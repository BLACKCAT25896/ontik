import 'package:flutter_boilerplate/data/api_client.dart';
import 'package:flutter_boilerplate/feature/home/domain/repo/home_repo_interface.dart';
import 'package:flutter_boilerplate/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class BannerRepo implements HomeRepoInterface{
  ApiClient apiClient;

  BannerRepo(this.apiClient);

  @override
  Future<Response> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> deleteById(String id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Response> get() async {
    return await apiClient.postData(AppConstants.logout, {});
  }

  @override
  Future<Response> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Response> post(Map<String, dynamic> body) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Response> postMultipartBody(Map<String, dynamic> body) {
    // TODO: implement postMultipartBody
    throw UnimplementedError();
  }

  @override
  Future<Response> update(Map<String, dynamic> body) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Response> updateOrderStatus(Map<String, dynamic> body) {
    // TODO: implement updateOrderStatus
    throw UnimplementedError();
  }

  @override
  Future<Response> xyz(Map<String, dynamic> body) {
    // TODO: implement xyz
    throw UnimplementedError();
  }


}