# Community Builder App

A Flutter application for building a community platform that allows users to create polls, like, comment, and vote.

![App Preview](link-to-screenshot-or-video)

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [My Opinion](#my_opinion)
- [Future Improvements](#future-improvements)

## Features

### Feed Section
- The main screen displays a list of polls.
- Users can interact with each poll by liking, commenting, or voting directly from the feed.

### Poll Creation
- Users can create a poll with a question, up to 5 options.
- Newly created polls appear in the feed.

### Comment Section
- Each poll has a comment section where users can add comments.
- Comments can be added and viewed by clicking on the comment icon.

### Poll Voting
- Users can vote on polls, and results are shown in a bar graph which can be viewed by tapping on the question in the feed.

## Architecture

This app follows the MVVM (Model-View-ViewModel) architecture for a clean, maintainable structure.

- **Model**: Defines `Polls` and `Comment` management.
- **ViewModel**: Manages business logic, user interactions, services and utils.
- **View**: Responsible for the UI layer, including screens for the feed, poll creation, comments, and voting.

State management is handled using the `Bloc` package, and data persistence is achieved with `Hive`.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name

2. **Install dependencies:**
   ```bash
   flutter pub get

3. **Run the app:**
   ```bash
   flutter run

## Usage

- **Feed:** View a list of active polls, each with options to like, comment, or vote.
- **Poll Creation:** Tap the "+" button to create a new poll. Enter the poll question, add up to 5 options, and optionally set an expiry date.
- **Commenting:** Tap the comment icon to open the comment section. Enter a comment to participate in the discussion.
- **Voting:** Tap on the desired option to which you want to cast vote. Results are displayed in a bar graph format after voting.


## Dependencies

- **Flutter_bloc**: State Management
- **Hive**: Local Data persistence
- **Equatable**: Equality comparison
- **Uuid**: Unique Id generation
- **Fl_chart**: Graph visualizer

To install these dependencies, add the following to your **pubspec.yaml**:

```bash
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  equatable: ^2.0.5
  uuid: ^4.5.1
  fl_chart: ^0.69.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  hive_generator: ^2.0.1
  build_runner: ^2.4.6
```

  ## My Opinion

In the voting part of this application, I have made it look as if multiple votes are being casted it can easily calculate the percentage and show it on graph. I know that the votes will be casted uniquely from each user's device, so for that I have code commented out in **polls.dart** file which will make sure that only one votes can be casted from a device.


  ## Future Improvements

- **Firebase Integration**: Use Firebase to persist data and allow for real-time updates.
- **User Authentication**: Add login and registration features to personalize the experience.
- **UI Enhacements**: More appealing UI
