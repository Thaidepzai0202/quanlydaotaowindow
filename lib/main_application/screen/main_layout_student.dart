import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanlydaotao/bloc/add_class_student/add_class_student_bloc.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/widgets/main_add_class_student.dart';
import 'package:quanlydaotao/main_application/widgets/main_registed_class_student.dart';
import 'package:quanlydaotao/main_application/widgets/main_select_student.dart';

enum MainLayoutSelectStudent { addCLass, showClass }

class AppMainLayoutStudent extends StatefulWidget {
  const AppMainLayoutStudent({super.key});

  @override
  State<AppMainLayoutStudent> createState() => AppMainLayoutStudentState();
}

class AppMainLayoutStudentState extends State<AppMainLayoutStudent> {
  
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
              child: const  Row(
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
                                authStudent.name,
                                style: const TextStyle(
                                    color: AppColors.gray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              Text(
                                "MSCB: ${authStudent.mssv}",
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
              // Positioned(
              //     top: 20,
              //     right: 350,
              //     child: InkWell(
              //       onTap: () {
              //         BlocProvider.of<AddClassStudentBloc>(context).add(ShowClassEvent());
              //         mainLayoutSelectStudent.value = MainLayoutSelectStudent.addCLass;
              //       },
              //       child: Container(
              //         height: 50,
              //         width: 140,
              //         decoration: BoxDecoration(
              //             color: AppColors.white,
              //             borderRadius: BorderRadius.circular(100)),
              //         child: const Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Icon(Icons.add),
              //             Text(StringConst.registerClass),
              //           ],
              //         ),
              //       ),
              //     )),
              const Positioned(
                  top: 100, bottom: 40, left: 20, child: MainSelectStudent()),
              Positioned(
                  top: 100,
                  bottom: 40,
                  left: 250,
                  right: 20,
                  child: ValueListenableBuilder(
                      valueListenable: mainLayoutSelectStudent,
                      builder: (context, value, child) {
                        switch (mainLayoutSelectStudent.value) {
                          case MainLayoutSelectStudent.addCLass:
                            return const MainAddClassStudent();
                          case MainLayoutSelectStudent.showClass:
                            return const MainRegistedClassStudent();
                            // return  Container();

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