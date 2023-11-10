part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoError extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final String jsonWidget;

  const TodoLoaded(this.jsonWidget);

  @override
  List<Object> get props => [jsonWidget];
}
