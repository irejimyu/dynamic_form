import 'package:dynamic_test/app/todo/todo_bloc.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Dynamic Widgets'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TodoLoaded) {
            // uses for defining a functions or values
            final registry = JsonWidgetRegistry.instance;
            registry.setValue('dropItems', ["Home", "Other", "Work", "Sample"]);
            registry.registerFunctions(
              {
                'customFunction': ({args, required registry}) => () {
                      // uses for getting values
                      final BuildContext context =
                          registry.getValue('form_context');
                      if (Form.of(context).validate()) {
                        String plainText = registry.getValue('plainText');
                        String dropdown = registry.getValue('dropdown');
                        String email = registry.getValue('email');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$plainText - $email - $dropdown'),
                          ),
                        );
                      }
                    },
              },
            );
            final widget = JsonWidgetData.fromDynamic(
              state.jsonWidget,
              registry: registry,
            );
            return widget!.build(context: context);
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
