import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/todo_model.dart';
import 'package:flutter_boilerplate/feature/add_new_todo/widget/add_new_todo_body.dart';
import 'package:flutter_boilerplate/feature/add_new_todo/widget/add_todo_button.dart';

class AddNewTodoView extends StatelessWidget {
  final int? index;
  final TodoModel? data;
  const AddNewTodoView({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    bool forEdit = (index != null) && (data != null);
    return  Scaffold(
      body: SafeArea(child: AddNewTodoBody(data: data,index: index,)),
      floatingActionButton: AddToDoButton(forEdit: forEdit,index: index,)
    );
  }
}
