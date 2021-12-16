import 'package:basic_getx_project/generated/json/base/json_convert_content.dart';
import 'package:basic_getx_project/entity/yan_entity.dart';

YanEntity $YanEntityFromJson(Map<String, dynamic> json) {
	final YanEntity yanEntity = YanEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		yanEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		yanEntity.msg = msg;
	}
	final String? text = jsonConvert.convert<String>(json['text']);
	if (text != null) {
		yanEntity.text = text;
	}
	return yanEntity;
}

Map<String, dynamic> $YanEntityToJson(YanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['text'] = entity.text;
	return data;
}