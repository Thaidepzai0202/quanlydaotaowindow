import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/form_teacher/form_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/widget/test_item_widget.dart';

class ListFormTeacherWidget extends StatefulWidget {
  final String classID;
  const ListFormTeacherWidget({super.key, required this.classID});

  @override
  State<ListFormTeacherWidget> createState() => _ListFormTeacherWidgetState();
}

class _ListFormTeacherWidgetState extends State<ListFormTeacherWidget> {
  @override
  void initState() {
    BlocProvider.of<FormTeacherBloc>(context)
        .add(ShowListFormEvent(classID: widget.classID));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormTeacherBloc, FormTeacherState>(
      builder: (context, state) {
        if (state.status == FormTeacherStatus.initial) {
          return const SizedBox();
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
                    return TestItemWidget(testModel: state.listTest![index],);
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
