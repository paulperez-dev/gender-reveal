part of 'presentation_bloc.dart';

@immutable
abstract class PresentationEvent {}

class PrecacheImagesEvent extends PresentationEvent {
  PrecacheImagesEvent(this.precacheImageList);

  final List<Future<void>> precacheImageList;
}
