import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/form_student/form_student_bloc.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/widgets/show_assignment_widget.dart';
import 'package:quanlydaotao/models/test_model.dart';

class GetStudentAssgnmentScreen extends StatefulWidget {
  final TestModel test;
  const GetStudentAssgnmentScreen({super.key, required this.test});

  @override
  State<GetStudentAssgnmentScreen> createState() =>
      _GetStudentAssgnmentScreenState();
}

class _GetStudentAssgnmentScreenState extends State<GetStudentAssgnmentScreen> {
  @override
  void initState() {
    BlocProvider.of<FormStudentBloc>(context)
        .add(GetAssignmentStudentEvent(idTest: widget.test.idTest!));
    super.initState();
  }

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
                _iconBack(),
                _nameTest(),
                _studentInformation(),
                _totalScore(),
                _testContent()
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _iconBack() {
    return Positioned(
      top: 20,
      left: 20,
      child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          )),
    );
  }

  Widget _nameTest() {
    return Positioned(
        top: 28,
        left: 100,
        child: SizedBox(
            width: 500,
            child: Text(
              "${widget.test.testName}  ${widget.test.idTest}",
              style: AppTextStyles.text18BoldWhite,
            )));
  }

  Widget _studentInformation() {
    return Positioned(
      top: 20,
      right: 20,
      child: Container(
        height: 80,
        width: 200,
        decoration: BoxDecoration(
            // color: AppColors.red,
            gradient: Gradients.purple2GradientTheme,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              authStudent.name,
              style: AppTextStyles.text15W500White,
            ),
            Text(
              "MSSV : ${authStudent.mssv}",
              style: AppTextStyles.text15W500White,
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalScore() {
    return Positioned(
      top: 20,
      right: 240,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            gradient: Gradients.purpleGradientTheme,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Điểm",
                style: AppTextStyles.text15W500White,
              ),
            ),
            Divider(
              height: 1,
              color: AppColors.white,
            ),
            BlocBuilder<FormStudentBloc, FormStudentState>(
              builder: (context, state) {
                return Expanded(
                            child: Center(
                                child: Text(
                          "${state.assignment!.totalScore ?? 0}",
                          style: AppTextStyles.text24NormalWhite,
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _testContent() {
    return Positioned(
      top: 120,
      bottom: 20,
      left: 50,
      right: 50,
      child: BlocBuilder<FormStudentBloc, FormStudentState>(
        builder: (context, state) {
          if (state.status == FormStudentStatus.initial) {
            return const CircularProgressIndicator();
          } else if (state.status == FormStudentStatus.failure) {
            return const Text("Error");
          } else {
            return ListView.builder(
                itemCount: state.test!.dataQuestions!.length,
                itemBuilder: (context, index) => ShowAssignmentWidget(
                  index: index,
                    question: state.test!.dataQuestions![index],
                    answer: state.assignment!.dataAnswersStudent![index]));
          }
        },
      ),
    );
  }
}
