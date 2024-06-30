import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_student/add_class_student_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/main_application/screen/do_class_student_view.dart';
import 'package:quanlydaotao/main_application/screen/todo_assignment_view.dart';
import 'package:quanlydaotao/models/class_model.dart';

class MainRegistedClassStudent extends StatefulWidget {
  const MainRegistedClassStudent({super.key});

  @override
  State<MainRegistedClassStudent> createState() =>
      _MainRegistedClassStudentState();
}

class _MainRegistedClassStudentState extends State<MainRegistedClassStudent> {
  List<ClassRoomModel> listClass = [];

  @override
  void initState() {
    BlocProvider.of<AddClassStudentBloc>(context).add(ShowRegistedClassEvent());
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClassStudentBloc, AddClassStudentState>(
      builder: (context, state) {
        listClass = state.listClass ?? [];
        if (state.status == AddClassStudentStatus.showSuccess) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: AppColors.gray))),
                      child: const Text(
                        StringConst.listClass,
                        style: AppTextStyles.text15W500Black,
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listClass.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoClassStudentView(
                                  classRoomModel: listClass[index],),
                                  // ToDoAssignmentView------
                            )),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: AppColors.gray),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(4),
                          child: Column(children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${index + 1} . ${listClass[index].dataSubject!.subjectName}",
                                      style: AppTextStyles.text15W500Black,
                                    ),
                                    Text(listClass[index].subjectId),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "     Giáo viên đứng lớp : ${listClass[index].dataTeacher!.name}"),
                                    Text(
                                        "Email : ${listClass[index].dataTeacher!.email}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        "     Lịch học :  Thứ ${listClass[index].dayOfWeek} - Ca : ${listClass[index].classSession}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "     Phòng học : ${listClass[index].className}"),
                                    Text(
                                        "Số lượng sinh viên : ${listClass[index].currentStudent}/${listClass[index].maxStudent}"),
                                  ],
                                ),
                              ],
                            )
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
