import 'package:abhiman_assignment/models/comment/comment_bloc.dart';
import 'package:abhiman_assignment/models/poll/poll_event.dart';
import 'package:abhiman_assignment/views/create_poll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'viewmodels/services/hive_service.dart';
import 'package:abhiman_assignment/models/poll/poll_bloc.dart';
import 'package:abhiman_assignment/views/feed_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final hiveService = HiveService();
  await hiveService.init();
  
  runApp(MyApp(hiveService: hiveService));
}
class MyApp extends StatelessWidget {
  final HiveService hiveService;
  
  const MyApp({super.key, required this.hiveService});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PollBloc(hiveService)..add(LoadPolls()),
        ),
        BlocProvider(
          create: (context) => CommentBloc(hiveService),
        ),
      ],
      child: MaterialApp(
        title: 'Poll App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => FeedView(),
          '/create-poll': (context) => CreatePollView(),
        },
      ),
    );
  }
}


