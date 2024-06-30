import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/attendance_teacher/attendance_teacher_bloc.dart';
import 'package:quanlydaotao/bloc/form_teacher/form_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/main_application/widgets/small_attendance_widget.dart';
import 'package:quanlydaotao/models/attendance_model.dart';

class AttendanceDialog extends StatefulWidget {
  const AttendanceDialog({super.key});

  @override
  State<AttendanceDialog> createState() => _AttendanceDialogState();
}

class _AttendanceDialogState extends State<AttendanceDialog> {
  final ScrollController _verticalScrollController1 = ScrollController();
  final ScrollController _verticalScrollController2 = ScrollController();
  final ScrollController _horizontalScrollController1 = ScrollController();
  final ScrollController _horizontalScrollController2 = ScrollController();
  late List<AttendanceModel> listAttendance;

  @override
  void initState() {
    super.initState();
    _verticalScrollController1.addListener(() {
      if (_verticalScrollController2.hasClients) {
        _verticalScrollController2.jumpTo(_verticalScrollController1.offset);
      }
    });
    _verticalScrollController2.addListener(() {
      if (_verticalScrollController1.hasClients) {
        _verticalScrollController1.jumpTo(_verticalScrollController2.offset);
      }
    });
    _horizontalScrollController1.addListener(() {
      if (_horizontalScrollController2.hasClients) {
        _horizontalScrollController2
            .jumpTo(_horizontalScrollController1.offset);
      }
    });
    _horizontalScrollController2.addListener(() {
      if (_horizontalScrollController1.hasClients) {
        _horizontalScrollController1
            .jumpTo(_horizontalScrollController2.offset);
      }
    });
    BlocProvider.of<AttendanceTeacherBloc>(context).add(InitListAttendanceEvent(
        classID: BlocProvider.of<FormTeacherBloc>(context).classID));
  }

  @override
  void dispose() {
    _verticalScrollController1.dispose();
    _verticalScrollController2.dispose();
    _horizontalScrollController1.dispose();
    _horizontalScrollController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocListener<AttendanceTeacherBloc, AttendanceTeacherState>(
        listener: (context, state) {
          if (state.status == AttendaceStatus.updateSuccess) {
            Navigator.pop(context);
          }
        },
        child: Container(
          height: 500,
          width: 1000,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColors.white),
          child: Column(
            children: [_title(), _titleColumn(), _twoScroll(), _bottomWidget()],
          ),
        ),
      ),
    );
  }

  Widget _twoScroll() {
    return BlocBuilder<AttendanceTeacherBloc, AttendanceTeacherState>(
      builder: (context, state) {
        if (state.status == AttendaceStatus.initial) {
          return const CircularProgressIndicator();
        } else if (state.status == AttendaceStatus.failure) {
          return const Center(
            child: Text("ERROR"),
          );
        } else if (state.status == AttendaceStatus.success) {
          listAttendance = state.listAttendance!;
          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    controller: _verticalScrollController1,
                    child: Column(
                      children:
                          List.generate(state.listAttendance!.length, (index) {
                        return Row(
                          children: [
                            Container(
                              height: 50,
                              width: 240,
                              alignment: Alignment.centerLeft,
                              // color: Colors.grey[300],
                              child: Text(
                                '  ${index + 1}  ${state.listAttendance![index].name}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 80,
                              // color: Colors.grey[300],
                              child: Center(
                                child: Text(
                                  "${state.listAttendance![index].mssv}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: _verticalScrollController2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _horizontalScrollController2,
                      child: Column(
                        children: List.generate(state.listAttendance!.length,
                            (rowIndex) {
                          return Row(
                            children: List.generate(15, (colIndex) {
                              return Container(
                                width: 50,
                                height: 50,
                                color: colIndex % 2 == 0
                                    ? AppColors.grayHint.withOpacity(0.1)
                                    : AppColors.grayC4C4C4.withOpacity(0.3),
                                child: Center(
                                    child: SmallAttendanceWidget(
                                  dataAttend: state.listAttendance![rowIndex]
                                      .dataAttendance![colIndex],
                                  onChanged: (value) {
                                    listAttendance[rowIndex]
                                        .dataAttendance![colIndex] = value;
                                  },
                                )),
                              );
                            }),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _bottomWidget() {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<AttendanceTeacherBloc, AttendanceTeacherState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<AttendanceTeacherBloc>(context).add(UpdateLockStatusEvent(statusLock: state.statusLock==0 ? 1 : 0));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      gradient: state.statusLock == 1
                          ? Gradients.greenGradientTheme
                          : Gradients.offLinearLight,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Điểm danh online",
                    style: AppTextStyles.text13W500White,
                  ),
                ),
              );
            },
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<AttendanceTeacherBloc>(context).add(
                  UpdateListAttendanceEvent(listAttendance: listAttendance));
              // logger.log(listAttendance.map((e) => e.toJson()).toList());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  gradient: Gradients.blueGradientTheme,
                  borderRadius: BorderRadius.circular(8)),
              child: const Text(
                "Lưu",
                style: AppTextStyles.text13W500White,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: Gradients.gradientRed),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const Text(
            "Điểm danh",
            style: AppTextStyles.text16BoldWhite,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Icon(
                Icons.close,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _titleColumn() {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            height: 40,
            width: 240,
            child: Text(
              "Họ và tên",
              style: AppTextStyles.text15W500Black,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            height: 40,
            width: 80,
            child: Text("MSSV", style: AppTextStyles.text15W500Black),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController1,
            child: Row(
              children: List.generate(
                  15,
                  (index) => Container(
                      decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? AppColors.grayHint.withOpacity(0.1)
                              : AppColors.grayC4C4C4.withOpacity(0.3),
                          border: Border(bottom: BorderSide(width: 1))),
                      alignment: Alignment.center,
                      height: 40,
                      width: 50,
                      child: Text(
                        "${index + 1}",
                        style: AppTextStyles.text15W500Black,
                      ))),
            ),
          ))
        ],
      ),
    );
  }
}
