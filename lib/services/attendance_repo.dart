import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quanlydaotao/core/constants/api_path.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/models/attendance_model.dart';

class AttendanceRepo {
  Future<List<AttendanceModel>> getListAttendace(String classID) async {
    List<AttendanceModel> listAttendance = [];

    var res = await http.get(Uri.parse("${ApiPath.getAttendance}/$classID"));
    if (res.statusCode == 200) {
      List<dynamic> result = json.decode(utf8.decode(res.bodyBytes));
      listAttendance = result.map((e) => AttendanceModel.fromJson(e)).toList();

      // bookModel = BookModel.fromJson(result);
      // logger.log(result);
    } else {
      logger.log(res.statusCode, color: StrColor.red);
    }
    return listAttendance;
  }

  Future<void> updateListAttendace(
      {required List<AttendanceModel> listAttendance,
      required String classID}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    List<Map<String, dynamic>> body =
        listAttendance.map((e) => e.toJson()).toList();
    final bodyJson = jsonEncode(body);

    var res = await http.put(Uri.parse("${ApiPath.getAttendance}/$classID"),
        headers: headers, body: bodyJson);
    if (res.statusCode == 200) {
      List<dynamic> result = json.decode(utf8.decode(res.bodyBytes));
      // listAttendance = result.map((e) => AttendanceModel.fromJson(e)).toList();

      // bookModel = BookModel.fromJson(result);
      logger.log(result);
    } else {
      logger.log(res.statusCode, color: StrColor.red);
    }
  }

  Future<int> getStatusLock({required String classID}) async {
    var res = await http.get(
      Uri.parse("${ApiPath.getStatusLock}/$classID"),
    );
    if (res.statusCode == 200) {
      var result = json.decode(utf8.decode(res.bodyBytes));
      int realResult = result["lock"];

      // logger.log(result);
      // logger.log(" lock :   $realResult");
      return realResult;
    } else {
      logger.log(res.statusCode, color: StrColor.red);
    }
    return 0;
  }

  Future<int> updateLock(
      {required String classID, required int statusLock}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> body = {"lock": statusLock};
    final bodyJson = jsonEncode(body);
    var res = await http.put(
        Uri.parse(
          "${ApiPath.getStatusLock}/$classID",
        ),
        headers: headers,
        body: bodyJson);

    if (res.statusCode == 200) {
      var result = json.decode(utf8.decode(res.bodyBytes));
      int realResult = result["lock"];

      return realResult;
    } else {
      logger.log(res.statusCode, color: StrColor.red);
    }
    return 0;
  }
}
