import 'package:flutter_drawer_tab_host/drawer/drawer_model.dart';
import 'package:meta/meta.dart';

@immutable
class DrawerState {
  DrawerState({
    @required this.currentTheater,
    @required this.theaters,
  });

  final DrawerModel currentTheater;
  final List<DrawerModel> theaters;

  factory DrawerState.initial() {
    return new DrawerState(
      currentTheater: null,
      theaters: <DrawerModel>[],
    );
  }

  DrawerState copyWith({
    DrawerModel currentTheater,
    List<DrawerModel> theaters,
  }) {
    return new DrawerState(
      currentTheater: currentTheater ?? this.currentTheater,
      theaters: theaters ?? this.theaters,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DrawerState &&
              runtimeType == other.runtimeType &&
              currentTheater == other.currentTheater &&
              theaters == other.theaters;

  @override
  int get hashCode =>
      currentTheater.hashCode ^
      theaters.hashCode;
}