import 'package:basic_getx_project/entity/yan_entity.dart';

abstract class ApiRepository {
  Future<YanEntity> fetchYan();
}
