import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_application_todo/domain/entity/data.dart';

class ApiClient {
  int id = 0;

  final client = HttpClient();

  final url = 'https://6na9svs6gyb5.softwars.com.ua/tasks';

  Future createData(String name) async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        'name': name,
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future getData() async {
    try {
      final respons = await http.get(Uri.parse(url));

      if (respons.statusCode == 200) {
        Iterable it = jsonDecode(respons.body);
        List<DataTasks> tasks = it.map((e) => DataTasks.fromJson(e)).toList();
        return tasks;
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      return e.toString();
    }
  }

  // void postTasks() async {
  //   try {
  //     final respons = await post(Uri.parse(url), body: {
  // 'taskId': 'taskId',
  // 'status': '1',
  // 'name': 'name',
  // 'type': '1',
  // 'description': 'description',
  // 'finishDate': 'finishDate',
  // 'urgent': '1',
  // 'file': 'file'
  //     });
  //     print(respons.body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<DataTasks> getTask() async {
  //   final url = Uri.parse('https://6na9svs6gyb5.softwars.com.ua/tasks');

  //   final request = await client.getUrl(url);
  //   final respons = await request.close();
  //   final jsonStrings = await respons.transform(utf8.decoder).toList();
  //   final jsonString = jsonStrings.join();
  //   final json = jsonDecode(jsonString);
  //   final data = DataTasks.fromJson(json['data'][0]);
  //   log('${json['data'][0]['syncTime']}');
  //   return data;
  // }

  // Future<DataTasks> createTask({
  //   required String taskId,
  //   required int status,
  //   required String name,
  //   required int type,
  //   required String description,
  //   required String finishDate,
  //   required int urgent,
  //   required String file,
  // }) async {
  //   final url = Uri.parse('https://6na9svs6gyb5.softwars.com.ua/tasks');

  //   final parametrs = <String, dynamic>{
  //     'taskId': taskId,
  //     'status': status,
  //     'name': name,
  //     'type': type,
  //     'description': description,
  //     'finishDate': finishDate,
  //     'urgent': urgent,
  //     'file': file
  //   };
  //   final reques = await client.postUrl(url);
  //   reques.headers.set('Content-type', 'application/json; charset=UTF-8');
  //   reques.write(jsonEncode(parametrs));
  //   final response = await reques.close();

  //   final jsonStrings = await response.transform(utf8.decoder).toList();
  //   final jsonString = jsonStrings.join();
  //   final json = jsonDecode(jsonString) as Map<String, dynamic>;
  //   final data = DataTasks.fromJson(json);
  //   print(json);

  //   return data;
  // }

//   Future<DataTasks> putTask(
//       {required String taskId,
//       required int status,
//       required String name,
//       required int type,
//       required String description,
//       required String finishDate,
//       required int urgent,
//       required String file}) async {
//     final url = Uri.parse('https://6na9svs6gyb5.softwars.com.ua/tasks');

//     final parametrs = <String, dynamic>{
//       'taskId': taskId,
//       'status': status,
//       'name': name,
//       'type': type,
//       'description': description,
//       'finishDate': finishDate,
//       'urgent': urgent,
//       'file': file
//     };
//     final reques = await client.putUrl(url);
//     reques.headers.set('Content-type', 'application/json; charset=UTF-8');
//     reques.write(jsonEncode(parametrs));
//     final respons = await reques.close();

//     final jsonStrings = await respons.transform(utf8.decoder).toList();
//     final jsonString = jsonStrings.join();
//     final json = jsonDecode(jsonString) as Map<String, dynamic>;
//     final data = DataTasks.fromJson(json);

//     return data;
//   }

//   Future<void> deleteTask(int id) async {
//     final url = Uri.parse('https://6na9svs6gyb5.softwars.com.ua/tasks/$id');

//     var result = await client.deleteUrl(url);

//     var response = await result.close();
//   }
}
