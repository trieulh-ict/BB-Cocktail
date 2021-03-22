import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiMmodule {
  @lazySingleton
  Dio get dio => Dio();
}
