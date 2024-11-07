import 'package:abhiman_assignment/models/poll/poll_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../models/poll/poll.dart';
import 'package:abhiman_assignment/models/poll/poll_bloc.dart';

class CreatePollView extends StatefulWidget {
  @override
  _CreatePollViewState createState() => _CreatePollViewState();
}

class _CreatePollViewState extends State<CreatePollView> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  void _addOption() {
    if (_optionControllers.length < 5) {
      setState(() {
        _optionControllers.add(TextEditingController());
      });
    }
  }

  void _submitPoll() {
    if (_formKey.currentState?.validate() ?? false) {
      final poll = Poll(
        id: const Uuid().v4(),
        question: _questionController.text,
        options: _optionControllers.map((controller) => 
          PollOption(
            id: const Uuid().v4(),
            text: controller.text,
          )
        ).toList(),
        createdAt: DateTime.now(),
        votedUsers: [],
        likes: [],
      );

      context.read<PollBloc>().add(AddPoll(poll));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Poll')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a question' : null,
            ),
            SizedBox(height: 16.0),
            ..._optionControllers.asMap().entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: entry.value,
                  decoration: InputDecoration(
                    labelText: 'Option ${entry.key + 1}',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter an option' : null,
                ),
              );
            }),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _optionControllers.length < 5 ? _addOption : null,
              child: Text('Add Option'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitPoll,
              child: Text('Create Poll'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
