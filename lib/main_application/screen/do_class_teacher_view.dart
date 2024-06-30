import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/widgets/add_asignment.dart';
import 'package:quanlydaotao/main_application/widgets/add_asignment_2.dart';
import 'package:quanlydaotao/main_application/widgets/add_student_dialog.dart';
import 'package:quanlydaotao/main_application/widgets/attendance_dialog.dart';
import 'package:quanlydaotao/main_application/widgets/show_list_student_dialog.dart';
import 'package:quanlydaotao/main_application/widgets/study_document_view.dart';
import 'package:quanlydaotao/main_application/widgets/update_point_for_student.dart';
import 'package:quanlydaotao/models/class_model.dart';
import 'package:quanlydaotao/main_application/widgets/list_form_teacher.dart';

class DoClassTeacherView extends StatefulWidget {
  final ClassRoomModel classRoomModel;
  const DoClassTeacherView({super.key, required this.classRoomModel});

  @override
  State<DoClassTeacherView> createState() => _DoClassTeacherViewState();
}

class _DoClassTeacherViewState extends State<DoClassTeacherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Images.background_hust),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryHust,
              child: GestureDetector(
                onPanUpdate: (details) {
                  appWindow.position = Offset(
                    appWindow.position.dx + details.delta.dx,
                    appWindow.position.dy + details.delta.dy,
                  );
                },
                onDoubleTap: () {
                  // showWithSmallImage('cc','cccccc');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogoCompany(),
                    WindowButtons(),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                _titleClass(),
                _listStudent(context),
                _todoStudent(context),
                _fileTeacher(),
                _formExercise(),
                _addAsignment(),
                _addStudent(context)
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _titleClass() {
    return Positioned(
      top: 20,
      left: 20,
      child: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.white,
              )),
          const SizedBox(
            width: 20,
          ),
          Text(
            "${widget.classRoomModel.dataSubject!.subjectName} - ${widget.classRoomModel.dataSubject!.subjectId}",
            style: AppTextStyles.text20BoldWhite,
          ),
        ],
      ),
    );
  }

  Widget _listStudent(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => ShowListStudentInClass(
              classID: widget.classRoomModel.classId,
            ),
          );
        },
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: Gradients.blueGradientTheme),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SvgPicture.asset(
              Images.ic_person,
              color: AppColors.white,
            ),
            const Text(
              "Thông tin sinh viên",
              style: AppTextStyles.text15W500White,
            )
          ]),
        ),
      ),
    );
  }

  Widget _todoStudent(BuildContext context) {
    return Positioned(
      top: 80,
      right: 20,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showDialog(context: context, builder:(context) => AttendanceDialog(),);
            },
            child: Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: Gradients.orangeGradientTheme),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                    Text(
                      "Điểm danh",
                      style: AppTextStyles.text15W500White,
                    )
                  ]),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return UpdatePointForStudentDialog(
                    classID: widget.classRoomModel.classId,
                  );
                },
              );
            },
            child: Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: Gradients.greenGradientTheme),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                    Text(
                      "Nhập điểm",
                      style: AppTextStyles.text15W500White,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addAsignment() {
    return Positioned(
      top: 140,
      right: 20,
      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder:(context) =>  AddAsignmentView2(classID: widget.classRoomModel.classId,),));
        },
        child: Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: Gradients.gradientRed),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                Text(
                  "Tạo bài tập",
                  style: AppTextStyles.text15W500White,
                )
              ]),
        ),
      ),
    );
  }

  Widget _addStudent(BuildContext context){
    return Positioned(
      right: 180,
      top: 140,
      child: InkWell(
        onTap: () {
          showDialog(context: context, builder:(context) {
            return AddStudentDialog();
          });
        },
        child: Container(
            height: 50,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: Gradients.purple2GradientTheme),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                  Text(
                    "Thêm sinh viên",
                    style: AppTextStyles.text15W500White,
                  )
                ]),
          ),
      ),
    );
  }

  Widget _fileTeacher() {
    return Positioned(
      top: 100,
      left: 32,
      right: MediaQuery.of(context).size.width / 2 + 16,
      bottom: 32,
      child: StudyDocumentView(classID: widget.classRoomModel.classId,)
    );
  }

  Widget _formExercise() {
    return Positioned(
      top: 200,
      right: 32,
      left: MediaQuery.of(context).size.width / 2 + 16,
      bottom: 32,
      child:  ListFormTeacherWidget(classID: widget.classRoomModel.classId,),
    );
  }
}
