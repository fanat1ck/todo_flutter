import 'package:flutter/cupertino.dart';
import 'package:flutter_application_todo/domain/api_tasks/api_tasks.dart';
import 'package:flutter_application_todo/domain/entity/data.dart';

class TodoWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _dataTasks = <DataTasks>[];
  List<DataTasks> get tasks => _dataTasks;

  // Future<void> createTasks() async {
  //   final tasks = await apiClient.createTask(
  //       taskId: '1',
  //       status: 1,
  //       name: 'name',
  //       type: 1,
  //       description: 'description',
  //       finishDate: 'finishDate',
  //       urgent: 1,
  //       file: 'file');
  // }

  // Future<void> receiveTask() async {
  //   // var receivedTask = await apiClient.getTask();
  //   // tasks.add(receivedTask);
  // }

//   Future<void> deleteTask(int id) async {
//     var deletedTask = await apiClient.deleteTask(id);
//   }
}

class TodoWidgetInherited extends InheritedNotifier {
  final TodoWidgetModel model;
  const TodoWidgetInherited(
      {Key? key, required Widget child, required this.model})
      : super(child: child, key: key, notifier: model);

  static TodoWidgetInherited? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TodoWidgetInherited>()
        ?.widget;
    return widget is TodoWidgetInherited ? widget : null;
  }

  static TodoWidgetInherited? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoWidgetInherited>();
  }
}
