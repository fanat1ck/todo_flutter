import 'package:flutter/material.dart';
import 'package:flutter_application_todo/domain/api_tasks/api_tasks.dart';
import 'package:flutter_application_todo/domain/entity/data.dart';
import 'package:flutter_application_todo/widget/todo/todo_widget_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final _data = TodoWidgetModel();
  @override
  void initState() {
    // _data.receiveTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromRGBO(169, 169, 169, 1),
              Color.fromRGBO(56, 56, 56, 1),
            ])),
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: TodoWidgetInherited(
                model: _data,
                child: Column(
                  children: const [
                    SizedBox(height: 20),
                    _TopButtomWidget(),
                    SizedBox(height: 20),
                    Expanded(child: _TodoListWidget()),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 71,
            width: 71,
            child: FloatingActionButton(
                onPressed: () => Navigator.pushNamed(context, '/add_task'),
                backgroundColor: const Color.fromRGBO(255, 214, 0, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: const Icon(
                  Icons.add,
                  size: 50,
                  color: Color.fromARGB(177, 0, 0, 0),
                )),
          ),
        ));
  }
}

class _TodoListWidget extends StatefulWidget {
  const _TodoListWidget({Key? key}) : super(key: key);

  @override
  State<_TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<_TodoListWidget> {
  ApiClient apiClient = ApiClient();
  List<DataTasks> listDataTasks = [];

  getData() async {
    dynamic listDataTasks = await apiClient.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          DataTasks tasks = listDataTasks[index];
          return _TodoListRowWidget(
            indexInList: index,
            tasks: tasks,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 0);
        },
        itemCount: listDataTasks.length

        //  TodoWidgetInherited.watch(context)?.model.tasks.length ?? 0
        );
  }
}

class _TodoListRowWidget extends StatelessWidget {
  final int indexInList;

  final DataTasks tasks;
  const _TodoListRowWidget(
      {Key? key, required this.indexInList, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _data = TodoWidgetInherited.watch(context)?.model.tasks[indexInList];
    return Card(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          focusColor: const Color.fromRGBO(255, 137, 137, 1),
          leading: const Icon(Icons.mobile_friendly),
          trailing: InkWell(
            onTap: () {},
            child: Image(
              image: AssetImage('images/rectangle.png'),
            ),
          ),

          title: Text('${tasks.name}'),
          //  Text('${_data?.name}'),
          subtitle: Text(
            // '${_data?.finishDate}',
            '${tasks.finishDate}',
            style: const TextStyle(fontSize: 11),
          ),
          onTap: () {
            // TodoWidgetInherited.read(context)?.model.deleteTask(
            //       int.parse(
            //         _data!.taskId.toString(),
            //       ),
            //     );
          },
        ),
      ),
    );
  }
}

class _TopButtomWidget extends StatelessWidget {
  const _TopButtomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(fontSize: 18);
    final _styleButton = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(219, 219, 219, 1)),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        overlayColor:
            MaterialStateProperty.all(const Color.fromRGBO(251, 239, 180, 1)),
        minimumSize: MaterialStateProperty.all(const Size(106, 48)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: _styleButton,
          onPressed: () {},
          child: const Text(
            'Усі',
            style: _textStyle,
          ),
        ),
        ElevatedButton(
          style: _styleButton,
          onPressed: () {},
          child: const Text(
            'Робочі',
            style: _textStyle,
          ),
        ),
        ElevatedButton(
          style: _styleButton,
          onPressed: () {},
          child: const Text(
            'Особисті',
            style: _textStyle,
          ),
        ),
      ],
    );
  }
}
