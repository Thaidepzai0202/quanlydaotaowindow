import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanlydaotao/bloc/add_class_teacher/add_class_teacher_bloc.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/main_application/widgets/main_do.dart';
import 'package:quanlydaotao/main_application/widgets/main_select_teacher.dart';
import 'package:quanlydaotao/main_application/widgets/main_teacher_class_room.dart';
import 'package:quanlydaotao/main_application/widgets/schedule_teacher_screen.dart';

enum MainLayoutSelectTeacher { addCLass, showClass, schedule }

class AppMainLayoutTeacher extends StatefulWidget {
  const AppMainLayoutTeacher({super.key});

  @override
  State<AppMainLayoutTeacher> createState() => _AppMainLayoutTeacherState();
}

class _AppMainLayoutTeacherState extends State<AppMainLayoutTeacher> {
  @override
  void initState() {
    super.initState();

    doWhenWindowReady(() {
      var initialSize = const Size(1024, 720);
      appWindow.minSize = initialSize;
      appWindow.maxSize = const Size(2000, 1200);
      appWindow.size = const Size(1024, 720);
      appWindow.alignment = Alignment.center;
    });
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
              Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    height: 60,
                    width: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.gray),
                            child: SvgPicture.asset(
                              Images.ic_person,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                authTeacher.name,
                                style: const TextStyle(
                                    color: AppColors.gray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              Text(
                                "MSCB: ${authTeacher.mscb}",
                                style: const TextStyle(
                                    color: AppColors.dustyGray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 26,
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: 20,
                  right: 280,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.white),
                      child: const Icon(Icons.add),
                    ),
                  )),
              Positioned(
                  top: 20,
                  right: 350,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AddClassTeacherBloc>(context)
                          .add(ShowSubjectEvent());
                      mainLayoutSelectTeacher.value =
                          MainLayoutSelectTeacher.addCLass;
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.add),
                          Text(StringConst.makeClass),
                        ],
                      ),
                    ),
                  )),
              const Positioned(
                  top: 100, bottom: 40, left: 20, child: MainSelectTeacher()),
              Positioned(
                  top: 100,
                  bottom: 40,
                  left: 250,
                  right: 20,
                  child: ValueListenableBuilder(
                      valueListenable: mainLayoutSelectTeacher,
                      builder: (context, value, child) {
                        switch (mainLayoutSelectTeacher.value) {
                          case MainLayoutSelectTeacher.addCLass:
                            return BlocBuilder<AddClassTeacherBloc,
                                    AddClassTeacherState>(
                                builder: (context, state) {
                              if (state.status == AddClassStatus.failure) {
                                return Container(
                                  color: AppColors.white,
                                );
                              } else {
                                return MainDo(
                                  listSubject: state.listSubject!,
                                );
                              }
                            });
                          case MainLayoutSelectTeacher.showClass:
                            return const MainTeacherClassRoom();
                          case MainLayoutSelectTeacher.schedule:
                            return const ScheduleTeacherScreen();

                          default:
                            return Container();
                        }
                      })),
            ],
          ))
        ],
      ),
    ));
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
            colors: WindowButtonColors(iconNormal: AppColors.white)),
        MaximizeWindowButton(
            colors: WindowButtonColors(iconNormal: AppColors.white)),
        CloseWindowButton(
          colors: WindowButtonColors(iconNormal: AppColors.white),
          onPressed: () {
            appWindow.hide();
          },
        )
      ],
    );
  }
}
