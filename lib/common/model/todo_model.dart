import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(List<TodoModel> data) =>  json.encode(data.map((model) => model.toJson()).toList());

class TodoModel {
  String? todoNote;
  String? todoTitle;
  String? category;
  String? todoDate;
  String? todoTime;
  bool? inImportant;
  bool? isCompleted;

  TodoModel({
    this.todoNote,
    this.todoTitle,
    this.category,
    this.todoDate,
    this.todoTime,
    this.inImportant,
    this.isCompleted,
  });

  // The copyWith method remains unchanged
  TodoModel copyWith({
    String? todoNote,
    String? todoTitle,
    String? category,
    String? todoDate,
    String? todoTime,
    bool? inImportant,
    bool? isCompleted,
  }) {
    return TodoModel(
      todoNote: todoNote ?? this.todoNote,
      todoTitle: todoTitle ?? this.todoTitle,
      category: category ?? this.category,
      todoDate: todoDate ?? this.todoDate,
      todoTime: todoTime ?? this.todoTime,
      inImportant: inImportant ?? this.inImportant,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  // Method to convert TodoModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'todoTitle': todoTitle,
      'todoNote': todoNote,
      'category': category,
      'todoDate': todoDate,
      'todoTime': todoTime,
      'inImportant': inImportant,
      'isCompleted': isCompleted,
    };
  }

  // Factory constructor to create a TodoModel instance from a JSON map
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      todoTitle: json['todoTitle'],
      todoNote: json['todoNote'],
      category: json['category'],
      todoDate: json['todoDate'],
      todoTime: json['todoTime'],
      inImportant: json['inImportant'],
      isCompleted: json['isCompleted'],
    );
  }
}
