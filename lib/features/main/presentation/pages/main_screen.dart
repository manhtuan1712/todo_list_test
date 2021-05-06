import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/helpers/app_constants.dart';
import 'package:todo_list/core/helpers/base_view.dart';
import 'package:todo_list/features/main/data/model/todo_item_model.dart';
import 'package:todo_list/features/main/presentation/viewmodel/main_screen_view_model.dart';
import 'package:todo_list/injection_container.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppConstants.paddingDefault,
            ),
            titleHeaderWidget(),
            SizedBox(
              height: AppConstants.paddingDefault,
            ),
            buttonAddWidget(),
            SizedBox(
              height: AppConstants.paddingDefault,
            ),
            Expanded(
              child: BaseView<MainScreenViewModel>(
                model: sl(),
                onModelReady: (model) {
                  model.getTodoList();
                },
                builder: (context, model, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => Dismissible(
                      key: Key(model.listItemTodo[index].id.toString()),
                      onDismissed: (direction) {
                        model.deleteTask(index);
                      },
                      background: Container(color: Colors.red),
                      child: itemTodoWidget(
                        model.listItemTodo[index],
                        index,
                      ),
                    ),
                    itemCount: model.listItemTodo.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonAddWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingDefault,
      ),
      child: InkWell(
        onTap: () async {
          _controller.text = '';
          final result = await showDialog<String>(context: context, builder: (context) => dialogItemWidget());
          if (result != null) {
            TodoItemModel todoItemModel = TodoItemModel();
            Random random = new Random();
            todoItemModel.id = random.nextInt(1000);
            todoItemModel.title = result.toString();
            todoItemModel.isDone = false;
            sl<MainScreenViewModel>().addTask(todoItemModel);
          }
        },
        child: Text(
          'Add To do',
          style: TextStyle(
            fontWeight: AppConstants.fontSemiBold,
            fontSize: 16.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget titleHeaderWidget() {
    return Center(
      child: Text(
        'TODO LIST',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 32.0,
          fontWeight: AppConstants.fontSemiBold,
        ),
      ),
    );
  }

  Widget itemTodoWidget(TodoItemModel todoItemModel, int index) {
    return CheckboxListTile(
      value: todoItemModel.isDone,
      onChanged: (bool value) {
        sl<MainScreenViewModel>().doneTask(index);
      },
      title: Text(
        todoItemModel.title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: AppConstants.fontRegular,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget dialogItemWidget() {
    return AlertDialog(
      title: Text('Add Todo Item'),
      content: TextField(
        key: Key('title_field'),
        controller: _controller,
        autofocus: true,
      ),
      actions: <Widget>[
        FlatButton(key: Key('cancel'), onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
        FlatButton(key: Key('save'), onPressed: () => Navigator.of(context).pop(_controller.text), child: Text('Save')),
      ],
    );
  }
}
