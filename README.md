# Community Builder App

A Flutter application for building a community platform that allows users to create polls, comment, and vote. The app is based on the Quizzo - Quiz App UI Kit (Light Version) and adapted for a community-building experience with a feed section, poll creation, and a visually polished interface.

![App Preview](link-to-screenshot-or-video)

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
<!-- - [Folder Structure](#folder-structure) -->
- [Dependencies](#dependencies)
- [Future Improvements](#future-improvements)

## Features

### Feed Section
- The main screen displays a list of polls.
- Users can interact with each poll by liking, commenting, or voting directly from the feed.

### Poll Creation
- Users can create a poll with a question, up to 5 options, and an optional expiry date.
- Newly created polls appear in the feed.
- The poll creation uses a modified Quiz Creation UI from the Quizzo UI Kit.

### Comment Section
- Each poll has a comment section where users can add comments.
- Comments load below the respective poll and display in chronological order.

### Poll Voting
- Users can vote on polls, and results are shown in a bar graph similar to the Quizzo UI.
- Only one vote per user per poll is allowed.

## Architecture

This app follows the MVVM (Model-View-ViewModel) architecture for a clean, maintainable structure.

- **Model**: Defines `Post`, `VoteOption`, and other data classes.
- **ViewModel**: Manages business logic, user interactions, and state (e.g., `PostViewModel`).
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


  ## Future Improvements

- **Flutter_bloc**: State Management
- **Hive**: Local Data persistence
- **Equatable**: Equality comparison
- **Uuid**: Unique Id generation
- **Fl_chart**: Graph visualizer

