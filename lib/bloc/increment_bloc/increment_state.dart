part of 'increment_bloc.dart';

abstract class IncrementState extends Equatable {
  const IncrementState();
}

class IncrementInitial extends IncrementState {
  final double lastPosition = 250;
  final double currentPosition = 250;
  final Offset offset = const Offset(250, 250);

  // const IncrementInitial(this.lastPosition, this.currentPosition, this.offset);
  @override
  List<Object> get props => [lastPosition, currentPosition, offset];
}

class ChangePositionState extends IncrementState {
  final double lastPosition, currentPosition;
  final Offset changePositionOffset;

  const ChangePositionState(
      {required this.lastPosition,
      required this.currentPosition,
      required this.changePositionOffset});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [lastPosition, currentPosition, changePositionOffset];
}
