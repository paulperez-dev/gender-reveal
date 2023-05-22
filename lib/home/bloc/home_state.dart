part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

@immutable
class HomeState {
  const HomeState({
    required this.tests,
    required this.status,
    required this.testId,
    required this.testCompleted,
    required this.showInfoDialog,
    required this.showQuestionCard,
    required this.correctPearlCounter,
  });

  factory HomeState.initial() {
    return const HomeState(
      showInfoDialog: true,
      testCompleted: false,
      showQuestionCard: false,
      correctPearlCounter: 0,
      testId: 0,
      tests: <Test>[],
      status: HomeStatus.initial,
    );
  }

  final int correctPearlCounter;
  final bool showQuestionCard;
  final bool showInfoDialog;
  final bool testCompleted;
  final HomeStatus status;
  final List<Test> tests;
  final int testId;

  HomeState copyWith({
    HomeStatus? status,
    bool? testCompleted,
    bool? showInfoDialog,
    bool? showQuestionCard,
    int? correctPearlCounter,
    List<Test>? tests,
    int? testId,
  }) {
    return HomeState(
      tests: tests ?? this.tests,
      status: status ?? this.status,
      testId: testId ?? this.testId,
      testCompleted: testCompleted ?? this.testCompleted,
      showInfoDialog: showInfoDialog ?? this.showInfoDialog,
      showQuestionCard: showQuestionCard ?? this.showQuestionCard,
      correctPearlCounter: correctPearlCounter ?? this.correctPearlCounter,
    );
  }
}
