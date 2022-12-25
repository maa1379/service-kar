import 'dart:convert';
import 'package:flutter/material.dart';
import '../DB/BaseModel.dart';

class CarModel extends BaseModel {
  @override
  Map<String, DbDataTypes> fields() {
    return {
      'name': DbDataTypes.Text,
      'key': DbDataTypes.Text,
      'model': DbDataTypes.Text,
      'color': DbDataTypes.Text,
      'isChecked': DbDataTypes.Integer,
    };
  }

  @override
  String primaryKey() {
    return 'id';
  }

  // returns the id of the added row
  static Future<int> add({
    required String name,
    required String key,
    required String model,
    required String color,
    required bool isChecked,
  }) async {
    return await CarModel().insert({
      'name': name,
      'key': key,
      'model': model,
      'color': color,
      'isChecked': isChecked ? 1 : 0, // 0 is no 1 is  yes
    });
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    return await CarModel().getAll();
  }

  static Future<int> remove(id) async {
    return await CarModel().delete(id);
  }

  static Future getItem(id) async {
    return await CarModel().get(id);
  }

  static Future<int> updateItem(
      {required String name,
      required String color,
      required bool isChecked,
      required String key,
      required String model,
      required int id}) async {
    return await CarModel().update(id, {
      'name': name,
      'color': color,
      'key': key,
      'model': model,
      'isChecked': isChecked ? 1 : 0, // 0 is no 1 is  yes
    });
  }
}

class CarListModel {
  int? id;
  String? name;
  String? key;
  String? model;
  String? color;
  bool? isChecked;

  CarListModel(
      {this.id, this.name, this.key, this.model, this.color, this.isChecked});

  factory CarListModel.fromJson(Map<String, dynamic> json) => CarListModel(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        model: json["model"],
        isChecked: json["isChecked"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "model": model,
        "color": color,
        "isChecked": isChecked,
      };
}
