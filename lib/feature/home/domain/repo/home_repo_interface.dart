import 'package:flutter_boilerplate/interface/repo_interface.dart';
import 'package:get/get.dart';

abstract class HomeRepoInterface extends RepositoryInterface{
  Future<Response> updateOrderStatus(Map<String, dynamic> body);
  Future<Response> xyz(Map<String, dynamic> body);
}