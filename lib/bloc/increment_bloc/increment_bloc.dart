import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  double currentPosition = 10, lastPosition = 10;
  Offset changePositionOffset = const Offset(200, 200);
  IncrementBloc() : super(IncrementInitial()) {
    on<IncrementEvent>((event, emit) {
      if (event is UpdateCurrentPositionEvent) {
        changePositionOffset = event.offset;
        emit(ChangePositionState(
            lastPosition: lastPosition,
            currentPosition: currentPosition,
            changePositionOffset: changePositionOffset));
      }
      if (event is ComitScalePositionEvent) {
        lastPosition = currentPosition;
        emit(ChangePositionState(
            lastPosition: lastPosition,
            currentPosition: currentPosition,
            changePositionOffset: changePositionOffset));
      }
      if (event is UpdateScaleEvent) {
        currentPosition = lastPosition * event.zoom;
        emit(ChangePositionState(
            lastPosition: lastPosition,
            currentPosition: currentPosition,
            changePositionOffset: changePositionOffset));
      }
    });
  }
}
