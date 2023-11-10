import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodo>((event, emit) async {
      try {
        // uses for fetching remote config from firebase
        final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
        await remoteConfig.setDefaults(
          <String, dynamic>{"type": "circular_progress_indicator"},
        );
        await remoteConfig.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 10),
            minimumFetchInterval: Duration.zero,
          ),
        );
        await remoteConfig.fetchAndActivate();
        emit(TodoLoaded(remoteConfig.getString('todo_list')));
      } catch (error) {
        emit(TodoError());
      }
    });
  }
}
