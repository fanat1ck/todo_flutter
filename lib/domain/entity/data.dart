import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Task {
  String? errror;
  List<DataTasks> data;
  Task({required this.data, this.errror});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class DataTasks {
  String? taskId;
  int? status;
  String? name;
  int? type;

  String? description;
  String? file;

  String? finishDate;
  int? urgent;
  String? syncTime;
  DataTasks({
    this.taskId,
    this.status,
    this.name,
    this.type,
    this.description,
    this.finishDate,
    this.urgent,
    this.syncTime,
    this.file,
  });

  factory DataTasks.fromJson(Map<String, dynamic> json) =>
      _$DataTasksFromJson(json);
  Map<String, dynamic> toJson() => _$DataTasksToJson(this);
}
