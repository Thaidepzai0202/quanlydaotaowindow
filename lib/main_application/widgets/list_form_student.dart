import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/form_student/form_student_bloc.dart';
import 'package:quanlydaotao/bloc/form_teacher/form_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/widget/test_item_widget.dart';

class ListFormStudentWidget extends StatefulWidget {
  final String classID;
  const ListFormStudentWidget({super.key, required this.classID});

  @override
  State<ListFormStudentWidget> createState() => _ListFormStudentWidgetState();
}

class _ListFormStudentWidgetState extends State<ListFormStudentWidget> {
  @override
  void initState() {
    BlocProvider.of<FormStudentBloc>(context)
        .add(InitFormStudentEvent(classID: widget.classID));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormStudentBloc, FormStudentState>(
      builder: (context, state) {
        if (state.status == FormStudentStatus.initial) {
          return const CircularProgressIndicator();
        } else if (state.status == FormStudentStatus.failure) {
          return const Center(child: Text("ERRO"),);
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.gray, width: 1))),
                  child: const Text(
                    "Bài tập / Khảo sát",
                    style: AppTextStyles.text15W500Gray,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.listTest!.length,
                  itemBuilder: (context, index) {
                    return TestItemWidget(
                      testModel: state.listTest![index],
                    );
                  },
                ))
              ],
            ),
          );
        }
      },
    );
  }
}
