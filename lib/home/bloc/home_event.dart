part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadQuestionsEvent extends HomeEvent {}

class HomeClosedQuestionCardEvent extends HomeEvent {}

class HomeShowQuestionCardEvent extends HomeEvent {
  HomeShowQuestionCardEvent({
    required this.testId,
  });

  final int testId;
}

class HomeCountCorrectAnswerEvent extends HomeEvent {
  HomeCountCorrectAnswerEvent({
    required this.id,
  });
  final int id;
}
