import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_student_to_class/add_student_to_class_bloc.dart';
import 'package:quanlydaotao/bloc/form_teacher/form_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/models/student_model.dart';
import 'package:quanlydaotao/widget/signup_dialog.dart';

class AddStudentDialog extends StatefulWidget {
  const AddStudentDialog({super.key});

  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  List<StudentModel> _listStudent = [];
  //  int _maxColumn = 0;
  bool _isSelectFile = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      _readExcel(file);
    }
  }

  void _readExcel(File file) async {
    var bytes = file.readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    List<StudentModel> liststudent = [];
    for (var table in excel.tables.keys) {
      var sheet = excel.tables[table];

      if (sheet != null) {
        var titleRow = sheet.rows.first;
        late int numMSSV;
        late int numName;
        late int numEmail;
        for (var i = 0; i < sheet.maxColumns; i++) {
          if (titleRow[i]!.value.toString().toLowerCase() == "mssv") {
            numMSSV = i;
          }
          if (titleRow[i]!.value.toString().toLowerCase() == "name") {
            numName = i;
          }
          if (titleRow[i]!.value.toString().toLowerCase() == "email") {
            numEmail = i;
          }
        }
        // _maxColumn = sheet.maxColumns;

        // Bỏ qua hàng đầu tiên nếu nó chứa tiêu đề cột
        for (int i = 1; i < sheet.rows.length; i++) {
          var row = sheet.rows[i];
          var mssv = row[numMSSV];
          var name = row[numName];
          var email = row[numEmail];

          if (mssv != null && name != null && email != null) {
            liststudent.add(StudentModel(
                mssv: mssv.value.toString(),
                name: name.value.toString(),
                gender: '',
                email: email.value.toString(),
                password: '',
                className: '',
                course: ''));
          }
        }
      }
    }

    setState(() {
      _listStudent = liststudent;
      _isSelectFile = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: BlocListener<AddStudentToClassBloc, AddStudentToClassState>(
      listener: (context, state) {
        if (state.status == AddStudentToClassStatus.success) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => NotificationSignUp(
              message: 'Thêm học sinh thành công',
            ),
          );
        }
      },
      child: Container(
        height: 500,
        width: 500,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 42,
              width: 500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppColors.primaryHust),
              child: Text(
                "Thêm Sinh Viên",
                style: AppTextStyles.text18BoldWhite,
              ),
            ),
            _isSelectFile
                ? Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _listStudent.length,
                            itemBuilder: (context, index) {
                              // return ListTile(
                              //   title: Text(_listStudent[index].toJson().toString()),
                              // );
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _listStudent[index].mssv,
                                      style: AppTextStyles.text14W400Gray,
                                    ),
                                    Text(_listStudent[index].name,
                                        style: AppTextStyles.text14W500Gray),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AddStudentToClassBloc>(context)
                                    .add(AddEvent(
                                        classID:
                                            BlocProvider.of<FormTeacherBloc>(
                                                    context)
                                                .classID,
                                        listmssv: _listStudent
                                            .map((e) => e.mssv)
                                            .toList()));
                              },
                              child: const Text("Thêm")),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: _pickFile,
                          child: const Text('Pick Excel File'),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    ));
  }
}
