part of 'increment_bloc.dart';

abstract class IncrementEvent extends Equatable {
  const IncrementEvent();
}

class UpdateScaleEvent extends IncrementEvent {
  final double zoom;
  // final double lastPosition, currentPosition;
  // final Offset offset;
  const UpdateScaleEvent(
    this.zoom,
    /* this.lastPosition, this.currentPosition, this.offset*/
  );
  @override
  // TODO: implement props
  List<Object?> get props => [zoom];
}

class UpdateCurrentPositionEvent extends IncrementEvent {
  final Offset offset;
  // final double lastPosition;
  // final double currentPosition;
  const UpdateCurrentPositionEvent(
    this.offset,
    /*this.lastPosition, this.currentPosition*/
  );
  @override
  // TODO: implement props
  List<Object?> get props => [offset];
}

class ComitScalePositionEvent extends IncrementEvent {
  // final Offset offset;
  // final double lastPosition;
  // final double currentPosition;

  const ComitScalePositionEvent(
      /*this.offset,*/ /*this.lastPosition, */ /*this.currentPosition*/);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
