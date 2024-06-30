import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/form_teacher/form_teacher_bloc.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/widgets/add_question_widget.dart';
import 'package:quanlydaotao/models/question_model.dart';
import 'package:quanlydaotao/models/test_model.dart';
import 'package:quanlydaotao/widget/date_time_picker.dart';

class AddAsignmentView2 extends StatefulWidget {
  final String classID;
  final String? idTest;
  const AddAsignmentView2({super.key, required this.classID, this.idTest});

  @override
  State<AddAsignmentView2> createState() => _AddAsignmentView2State();
}

class _AddAsignmentView2State extends State<AddAsignmentView2> {
  late TestModel currentTest;
  final TextEditingController _nameTestController = TextEditingController();
  late DateTime _beginDateTime;
  late DateTime _endDateTime;

  @override
  void initState() {
    _beginDateTime = DateTime.now();
    _endDateTime = _beginDateTime.add(const Duration(hours: 1));
    super.initState();
    if (widget.idTest != null) {
      BlocProvider.of<FormTeacherBloc>(context)
          .add(GetTestEvent(idTest: widget.idTest!));
    }
    currentTest = TestModel(
        classId: widget.classID,
        testName: "",
        dataQuestions: [
          Question(
              dataQuestion: "",
              type: 1,
              dataAnswers: [],
              dataCorrectAnswer: [],
              score: 0)
        ],
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 1)));
  }

  @override
  void dispose() {
    _nameTestController.dispose();
    super.dispose();
  }

  void _deleteQuestion(int index) {
    BlocProvider.of<FormTeacherBloc>(context)
        .add(DeleteQuestionEvent(index: index));
  }

  void _updateQuestion(int index, Question question) {
    currentTest.dataQuestions![index] = question;
    BlocProvider.of<FormTeacherBloc>(context)
        .add(UpdateTestEvent(testModel: currentTest));
  }

  void _updateTest() {
    currentTest.testName = _nameTestController.text;
    currentTest.startTime = _beginDateTime;
    currentTest.endTime = _endDateTime;
    BlocProvider.of<FormTeacherBloc>(context)
        .add(UpdateTestEvent(testModel: currentTest));
  }

  void _addQuestion() {
    currentTest.dataQuestions!.add(Question(
        dataQuestion: "",
        type: 0,
        dataAnswers: [],
        dataCorrectAnswer: [],
        score: 0));
    BlocProvider.of<FormTeacherBloc>(context)
        .add(UpdateTestEvent(testModel: currentTest));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<FormTeacherBloc, FormTeacherState>(
        listener: (context, state) {
          if (state.status == FormTeacherStatus.addSuccess) {
            Navigator.pop(context);
          } else if (state.status == FormTeacherStatus.success) {
            currentTest = state.test!;
            _nameTestController.text = currentTest.testName;
            _beginDateTime = currentTest.startTime;
            _endDateTime = currentTest.endTime;
            setState(() {});
          }
        },
        child: Container(
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
                _makeQuestion(context),
                _nameTest(),
                _createButtom(),
                _dateTime()
              ],
            ))
          ]),
        ),
      ),
    );
  }

  Widget _dateTime() {
    return Positioned(
        top: 16,
        right: 20,
        child: Row(
          children: [
            CupertinoDateTimePickerDemo(
              title: "Begin",
              selectedDateTime: _beginDateTime,
              onUpdate: (p0) {
                setState(() {
                  _beginDateTime = p0;
                  _updateTest();
                });
              },
            ),
            const SizedBox(
              width: 20,
            ),
            CupertinoDateTimePickerDemo(
              title: "End",
              selectedDateTime: _endDateTime,
              onUpdate: (p0) {
                setState(() {
                  _endDateTime = p0;
                  _updateTest();
                });
              },
            ),
          ],
        ));
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
        top: 12,
        left: 100,
        child: SizedBox(
          width: 500,
          child: TextFormField(
            style: AppTextStyles.text18BoldWhite,
            controller: _nameTestController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "My Test",
                hintStyle: AppTextStyles.text18BoldGray),
            onChanged: (value) => _updateTest(),
          ),
        ));
  }

  Widget _makeQuestion(BuildContext context) {
    return Positioned(
      top: 80,
      bottom: 20,
      left: 50,
      right: 50,
      child: BlocBuilder<FormTeacherBloc, FormTeacherState>(
        builder: (context, state) {
          if (state.status == FormTeacherStatus.initial) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: currentTest.dataQuestions!.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AddQuestionWidget(
                      index: index,
                      question: currentTest.dataQuestions![index],
                      onDelete: () {
                        _deleteQuestion(index);
                        setState(() {});
                      },
                      onUpdate: (updatedQuestion, valuebool) {
                        _updateQuestion(index, updatedQuestion);
                        if (valuebool) {
                          setState(() {});
                        }
                      },
                    ),
                    index == currentTest.dataQuestions!.length - 1
                        ? Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () => setState(() {
                                  _addQuestion();
                                }),
                                child: const Row(children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                  ),
                                  Text(
                                    "Thêm câu hỏi",
                                    style: AppTextStyles.text16BoldWhite,
                                  )
                                ]),
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _createButtom() {
    return Positioned(
        bottom: 50,
        right: 100,
        child: InkWell(
          onTap: () {
            print("json : ${currentTest.toJson()}");
            BlocProvider.of<FormTeacherBloc>(context)
                .add(AddTestEvent(testModel: currentTest));
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 80,
            decoration: BoxDecoration(
                gradient: Gradients.gradientGreen,
                borderRadius: BorderRadius.circular(25)),
            child: const Text(
              "Tạo",
              style: AppTextStyles.text18NormalWhite,
            ),
          ),
        ));
  }
}
