import 'dart:convert';

import 'package:quanlydaotao/core/constants/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/models/class_model.dart';

class StudentRepo {
  Future<List<ClassRoomModel>> getListClass(String? mssv) async {
    List<ClassRoomModel> listClass = [];

    var res = await http.get(Uri.parse(mssv == null
        ? ApiPath.addClass
        : "${ApiPath.addClassContents}/${mssv}"));
    if (res.statusCode == 200) {
      List<dynamic> result = json.decode(utf8.decode(res.bodyBytes));
      listClass = result.map((e) => ClassRoomModel.fromJson(e)).toList();

      // bookModel = BookModel.fromJson(result);
      // logger.log(result);
    } else {
      logger.log(res.statusCode, color: StrColor.red);
    }
    return listClass;
  }

  Future<int> registerClass(String classID) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> body = {"mssv": authStudent.mssv, "classID": classID};
    final bodyJson = jsonEncode(body);
    var res = await http.post(Uri.parse(ApiPath.addClassContents),
        headers: headers, body: bodyJson);

    return res.statusCode;
  }
}
