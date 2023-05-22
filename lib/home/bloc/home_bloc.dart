import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:gender_reveal/models/question.dart';
import 'package:revel_ui/revel_ui.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeLoadQuestionsEvent>(_loadQuestions);
    on<HomeClosedQuestionCardEvent>(_closeCard);
    on<HomeShowQuestionCardEvent>(_showQuestionCard);
    on<HomeCountCorrectAnswerEvent>(_countAnswers);
  }

  static final flipControllers = List<FlipCardController>.generate(
    9,
    (index) => FlipCardController(),
  );

  FutureOr<void> _countAnswers(
    HomeCountCorrectAnswerEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(status: HomeStatus.loading));

    var counter = state.correctPearlCounter;

    if (event.id == 0 || event.id == 4 || event.id == 8) {
      counter++;
    }

    if (counter >= 3) {
      emit(
        state.copyWith(
          testCompleted: true,
          showInfoDialog: false,
          showQuestionCard: false,
          status: HomeStatus.loaded,
          correctPearlCounter: counter,
        ),
      );
      return null;
    }

    emit(
      state.copyWith(
        status: HomeStatus.loaded,
        correctPearlCounter: counter,
      ),
    );
  }

  FutureOr<void> _closeCard(
    HomeClosedQuestionCardEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(status: HomeStatus.loading));
    emit(
      state.copyWith(
        showInfoDialog: true,
        showQuestionCard: false,
        status: HomeStatus.loaded,
      ),
    );
  }

  FutureOr<void> _loadQuestions(
    HomeLoadQuestionsEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final questions = <Test>[];
      for (final json in rawJsons) {
        final question = Test.fromRawJson(json);
        questions.add(question);
      }

      emit(state.copyWith(tests: questions, status: HomeStatus.loaded));
    } catch (error, stack) {
      emit(state.copyWith(status: HomeStatus.error));
      if (kDebugMode) {
        print('Error getting questions: $error.\nStack: $stack');
      }
    }
  }

  FutureOr<void> _showQuestionCard(
    HomeShowQuestionCardEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(status: HomeStatus.loading));
    emit(
      state.copyWith(
        showInfoDialog: false,
        showQuestionCard: true,
        status: HomeStatus.loaded,
        testId: event.testId,
      ),
    );
  }
}
