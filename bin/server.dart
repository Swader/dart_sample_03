import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'config/configuration.dart';

void main() {

  ConnectionPool pool = makeConnection(config);

  HttpServer.bind('0.0.0.0', 8080).then((HttpServer server) {

    server.listen((HttpRequest request) {

      pool.query("SELECT `value` FROM `test` WHERE `id` = 1").then((results) {
        results.listen((row) {
          request.response.write(row.value);
          request.response.close();
        });
      }).catchError((e) {
        request.response.write("Something went wrong.");
        request.response.write(e);
        request.response.close();
      });

    });
  });
}

ConnectionPool makeConnection(Map config) {
  ConnectionPool pool = new ConnectionPool(host: config["databaseHost"], port: 3306, user: config["databaseUser"], password: config["databasePassword"], db: config["databaseName"], max: 5);

  pool.query("SHOW TABLES").then((results) {
    results.listen((row) {
      print(row);
    });
  }).catchError(print);

  return pool;

}