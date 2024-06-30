import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/form_student/form_student_bloc.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/widgets/do_question.dart';
import 'package:quanlydaotao/models/answer_model.dart';
import 'package:quanlydaotao/models/assignment_model.dart';
import 'package:quanlydaotao/models/test_model.dart';

class ToDoAssignmentView extends StatefulWidget {
  // final String classID;
  final TestModel test;

  const ToDoAssignmentView({super.key, required this.test});

  @override
  State<ToDoAssignmentView> createState() => _ToDoAssignmentViewState();
}

class _ToDoAssignmentViewState extends State<ToDoAssignmentView> {
  late AssignmentModel assignmentModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FormStudentBloc>(context)
        .add(GetTestStudentEvent(idTest: widget.test.idTest!));
  }

  @override
  void dispose() {
    super.dispose();
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
        child: Column(children: [
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
              _testContent(),
              _nameTest(),
              _submitButtom(),
              _deadline()
            ],
          ))
        ]),
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

  Widget _deadline() {
    return Positioned(
        top: 20,
        right: 20,
        child: Container(
            decoration: BoxDecoration(
                gradient: Gradients.gradientRed,
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(16),
            child: Text(
              "Hạn nộp : ${getFormattedDateTime(widget.test.endTime)}",
              style: AppTextStyles.text13W500White,
            )));
  }

  String getFormattedDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}\n    ${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ";
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

  void _updateQuestion(int index, AnswerModel answer) {
    assignmentModel.dataAnswersStudent![index] = answer;
    BlocProvider.of<FormStudentBloc>(context)
        .add(UpdateAssignmentEvent(assignment: assignmentModel));
  }

  Widget _testContent() {
    return Positioned(
        top: 80,
        bottom: 20,
        left: 50,
        right: 50,
        child: BlocListener<FormStudentBloc, FormStudentState>(
          listener: (context, state) {
            if (state.status == FormStudentStatus.submitSuccessfully) {
              Navigator.pop(context);
              BlocProvider.of<FormStudentBloc>(context).add(
                  InitFormStudentEvent(
                      classID:
                          BlocProvider.of<FormStudentBloc>(context).classID));
            }
          },
          child: BlocBuilder<FormStudentBloc, FormStudentState>(
            builder: (context, state) {
              if (state.status == FormStudentStatus.initial) {
                return const CircularProgressIndicator();
              } else if (state.status == FormStudentStatus.getTestSuccess) {
                assignmentModel = state.assignment ?? AssignmentModel();
                return ListView.builder(
                  itemCount: state.test!.dataQuestions!.length,
                  itemBuilder: (context, index) {
                    return DoQuestionWidget(
                      question: state.test!.dataQuestions![index],
                      index: index,
                      onUpdate: (answerModel) {
                        _updateQuestion(index, answerModel);
                      },
                    );
                  },
                );
              }
              return const Center(
                child: Text("ERROR"),
              );
            },
          ),
        ));
  }

  Widget _submitButtom() {
    return Positioned(
        top: 20,
        right: 160,
        child: InkWell(
          onTap: () {
            logger.log(assignmentModel!.toJson());
            BlocProvider.of<FormStudentBloc>(context)
                .add(SubmitAssignmentEvent());
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 140,
            decoration: BoxDecoration(
                gradient: Gradients.gradientGreen,
                borderRadius: BorderRadius.circular(25)),
            child: const Text(
              "Nộp Bài",
              style: AppTextStyles.text18NormalWhite,
            ),
          ),
        ));
  }
}
