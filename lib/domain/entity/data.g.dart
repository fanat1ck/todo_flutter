// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
      errror: json['errror'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'errror': instance.errror,
      'data': instance.data,
    };

DataTasks _$DataTasksFromJson(Map<String, dynamic> json) => DataTasks(
      taskId: json['taskId'] as String?,
      status: json['status'] as int?,
      name: json['name'] as String?,
      type: json['type'] as int?,
      description: json['description'] as String?,
      file: json['file'] as String?,
      finishDate: json['finishDate'] as String?,
      urgent: json['urgent'] as int?,
      syncTime: json['syncTime'] as String?,
    );

Map<String, dynamic> _$DataTasksToJson(DataTasks instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'status': instance.status,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'finishDate': instance.finishDate,
      'urgent': instance.urgent,
      'syncTime': instance.syncTime,
      'file': instance.file,
    };
