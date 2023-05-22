part of 'presentation_bloc.dart';

enum PresentationStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isLoaded => this == loaded;
  bool get isError => this == error;
}

@immutable
class PresentationState {
  const PresentationState({
    this.status = PresentationStatus.initial,
  });

  final PresentationStatus status;

  PresentationState copyWith(
    PresentationStatus? status,
  ) =>
      PresentationState(
        status: status ?? this.status,
      );
}
