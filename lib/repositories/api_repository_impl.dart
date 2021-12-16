import 'dart:convert';

import 'package:basic_getx_project/constant/api_routes.dart';
import 'package:basic_getx_project/entity/yan_entity.dart';
import 'package:basic_getx_project/exceptions/network_exception.dart';
import 'package:basic_getx_project/exceptions/repository_exception.dart';
import 'package:basic_getx_project/repositories/api_repository.dart';
import 'package:basic_getx_project/services/api/api_service.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiService apiService;

  ApiRepositoryImpl(this.apiService);

  @override
  Future<YanEntity> fetchYan() async {
    try {
      final resp = jsonDecode(await apiService.get(ApiRoutes.yan, {}));
      return YanEntity.fromJson(resp);
    } on NetworkException catch (e) {
      throw(RepositoryException(e.message));
    }
  }
}