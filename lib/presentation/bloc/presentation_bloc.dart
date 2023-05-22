import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'presentation_event.dart';
part 'presentation_state.dart';

class PresentationBloc extends Bloc<PresentationEvent, PresentationState> {
  PresentationBloc() : super(const PresentationState()) {
    on<PrecacheImagesEvent>(_precacheImages);
  }

  FutureOr<void> _precacheImages(
    PrecacheImagesEvent event,
    Emitter<PresentationState> emit,
  ) async {
    emit(state.copyWith(PresentationStatus.loading));
    for (final element in event.precacheImageList) {
      await element;
    }
    emit(state.copyWith(PresentationStatus.loaded));
  }
}
