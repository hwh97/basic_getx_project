import 'dart:convert';
import 'package:basic_getx_project/generated/json/base/json_field.dart';
import 'package:basic_getx_project/generated/json/yan_entity.g.dart';

@JsonSerializable()
class YanEntity {

	late int code;
	late String msg;
	late String text;
  
  YanEntity();

  factory YanEntity.fromJson(Map<String, dynamic> json) => $YanEntityFromJson(json);

  Map<String, dynamic> toJson() => $YanEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}