import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

@module
abstract class ApiMmodule {
  @lazySingleton
  Dio get dio => Dio();

  @preResolve
  Future<Database> get database async {
    // get the application documents directory
    final dir = await getApplicationDocumentsDirectory();
// make sure it exists
    await dir.create(recursive: true);
// build the database path
    final dbPath = join(dir.path, 'bbcocktail.db');
    final DatabaseFactory dbFactory = databaseFactoryIo;

    return dbFactory.openDatabase(dbPath);
  }
}
