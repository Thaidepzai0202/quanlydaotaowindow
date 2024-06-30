import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/classroom_teacher/class_room_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/main_application/widgets/student_point_widget.dart';

class UpdatePointForStudentDialog extends StatefulWidget {
  final String classID;
  const UpdatePointForStudentDialog({super.key, required this.classID});

  @override
  State<UpdatePointForStudentDialog> createState() =>
      _UpdatePointForStudentDialogState();
}

class _UpdatePointForStudentDialogState
    extends State<UpdatePointForStudentDialog> {
  @override
  void initState() {
    BlocProvider.of<ClassRoomTeacherBloc>(context)
        .add(ShowListStudentEvent(classID: widget.classID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<ClassRoomTeacherBloc, ClassRoomTeacherState>(
        builder: (context, state) {
          if (state.status == ClassRoomStatus.success) {
            return Container(
              height: 500,
              width: 600,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                    height: 40,
                    width: 600,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: Gradients.gradientRed,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: const Text(
                      "Nhập điểm cho sinh viên",
                      style: AppTextStyles.text16BoldWhite,
                    )),
                SizedBox(height: 40, width: 560, child: _titleTableStudent()),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.listStudent!.length,
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: StudentPointWidget(
                              student: state.listStudent![index],
                            ))))
              ]),
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

  Widget _titleTableStudent() {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 250,
          child: const Text(
            "Họ và tên",
            style: AppTextStyles.text15W500Black,
          ),
        ),
        Container(
          alignment: Alignment.center,
            width: 80,
            child: const Text(
              "MSSV",
              style: AppTextStyles.text15W500Black,
            )),
        Container(
          alignment: Alignment.center,
            width: 115,
            child: const Text(
              "Giữa kỳ",
              style: AppTextStyles.text15W500Black,
            )),
        Container(
          alignment: Alignment.center,
            width: 115,
            child: const Text(
              "Cuối kỳ",
              style: AppTextStyles.text15W500Black,
            )),
      ],
    );
  }


}
