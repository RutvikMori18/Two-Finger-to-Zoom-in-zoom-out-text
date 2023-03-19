part of 'increment_bloc.dart';

abstract class IncrementEvent extends Equatable {
  const IncrementEvent();
}

class UpdateScaleEvent extends IncrementEvent {
  final double zoom;

  const UpdateScaleEvent(
    this.zoom,
  );
  @override
  // TODO: implement props
  List<Object?> get props => [zoom];
}

class UpdateCurrentPositionEvent extends IncrementEvent {
  final Offset offset;
  const UpdateCurrentPositionEvent(
    this.offset,
  );
  @override
  // TODO: implement props
  List<Object?> get props => [offset];
}

class ComitScalePositionEvent extends IncrementEvent {
  const ComitScalePositionEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
