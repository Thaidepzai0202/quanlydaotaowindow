import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_student/add_class_student_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/models/class_model.dart';
import 'package:quanlydaotao/widget/signup_dialog.dart';

class MainAddClassStudent extends StatefulWidget {
  const MainAddClassStudent({super.key});

  @override
  State<MainAddClassStudent> createState() => _MainAddClassStudentState();
}

class _MainAddClassStudentState extends State<MainAddClassStudent> {
  List<ClassRoomModel> filteredItems = [];
  List<ClassRoomModel> listClass = [];

  @override
  void initState() {
    BlocProvider.of<AddClassStudentBloc>(context).add(ShowClassEvent());
    listClass = BlocProvider.of<AddClassStudentBloc>(context).listClass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddClassStudentBloc, AddClassStudentState>(
      listener: (context, state) {
        if (state.status == AddClassStudentStatus.addSuccess ||
            state.status == AddClassStudentStatus.existedClass ||
            state.status == AddClassStudentStatus.studentBusy) {
          showDialog(
              context: context,
              builder: (context) =>
                  NotificationSignUp(message: state.message!));
        }
      },
      child: BlocBuilder<AddClassStudentBloc, AddClassStudentState>(
        builder: (context, state) {
          filteredItems = state.listClass ?? [];
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
                                bottom: BorderSide(
                                    width: 1, color: AppColors.gray))),
                        child: const Text(
                          StringConst.listClass,
                          style: AppTextStyles.text15W500Black,
                        )),
                  ),
                  searchWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return Container(
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
                                      "${index + 1} . ${filteredItems[index].dataSubject!.subjectName}",
                                      style: AppTextStyles.text15W500Black,
                                    ),
                                    Text(filteredItems[index].subjectId),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "     Giáo viên đứng lớp : ${filteredItems[index].dataTeacher!.name}"),
                                    Text(
                                        "Email : ${filteredItems[index].dataTeacher!.email}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        "     Lịch học :  Thứ ${filteredItems[index].dayOfWeek} - Ca : ${filteredItems[index].classSession}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "     Phòng học : ${filteredItems[index].className}"),
                                    Text(
                                        "Số lượng sinh viên : ${filteredItems[index].currentStudent}/${filteredItems[index].maxStudent}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          BlocProvider.of<AddClassStudentBloc>(
                                                  context)
                                              .add(AddClassEvent(
                                                  classID: filteredItems[index]
                                                      .classId)),
                                      child: Container(
                                        height: 40,
                                        width: 150,
                                        margin: const EdgeInsets.only(top: 8),
                                        decoration: BoxDecoration(
                                            gradient: Gradients.gradientRed,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          StringConst.registerClass,
                                          style: AppTextStyles.text15W500White,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ]),
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
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      // width: 300,
      height: 60,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<AddClassStudentBloc>(context)
                    .add(SearchClassEvent(query: value, isID: false));
              },
              // style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Tên môn học",
                hintStyle: TextStyle(color: AppColors.gray),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.search, color: AppColors.gray),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            flex: 2,
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<AddClassStudentBloc>(context)
                    .add(SearchClassEvent(query: value, isID: true));
              },
              // style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Mã học phần",
                hintStyle: TextStyle(color: AppColors.gray),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.search, color: AppColors.gray),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
