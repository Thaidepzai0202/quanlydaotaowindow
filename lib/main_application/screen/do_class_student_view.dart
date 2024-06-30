import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/widgets/list_form_student.dart';
import 'package:quanlydaotao/main_application/widgets/study_document_view.dart';
import 'package:quanlydaotao/main_application/widgets/study_document_view_student.dart';
import 'package:quanlydaotao/models/class_model.dart';

class DoClassStudentView extends StatefulWidget {
  final ClassRoomModel classRoomModel;
  const DoClassStudentView({super.key, required this.classRoomModel});

  @override
  State<DoClassStudentView> createState() => _DoClassStudentViewState();
}

class _DoClassStudentViewState extends State<DoClassStudentView> {
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
                _fileTeacher(),
                _formExercise(),
                _attendance(),
                _showScore(),
                _leaveRequest()
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _attendance() {
    return Positioned(
      right: 20,
      top: 100,
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
    );
  }

  Widget _showScore() {
    return Positioned(
      right: 180,
      top: 100,
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
                "Xem điểm",
                style: AppTextStyles.text15W500White,
              )
            ]),
      ),
    );
  }

  Widget _leaveRequest() {
    return Positioned(
      right: 20,
      top: 30,
      child: Container(
        height: 50,
        width: 180,
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
                "Xin phép vắng",
                style: AppTextStyles.text15W500White,
              )
            ]),
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

  Widget _fileTeacher() {
    return Positioned(
      top: 100,
      left: 32,
      right: MediaQuery.of(context).size.width / 2 + 16,
      bottom: 32,
      child: StudyDocumentStudentView(classID: widget.classRoomModel.classId),
    );
  }

  Widget _formExercise() {
    return Positioned(
      top: 200,
      right: 32,
      left: MediaQuery.of(context).size.width / 2 + 16,
      bottom: 32,
      child: ListFormStudentWidget(classID: widget.classRoomModel.classId),
    );
  }
}
