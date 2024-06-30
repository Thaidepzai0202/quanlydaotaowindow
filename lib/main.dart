import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_student/add_class_student_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_teacher/add_class_teacher_bloc.dart';
import 'package:quanlydaotao/bloc/add_student_to_class/add_student_to_class_bloc.dart';
import 'package:quanlydaotao/bloc/attendance_teacher/attendance_teacher_bloc.dart';
import 'package:quanlydaotao/bloc/classroom_teacher/class_room_teacher_bloc.dart';
import 'package:quanlydaotao/bloc/form_student/form_student_bloc.dart';
import 'package:quanlydaotao/bloc/form_teacher/form_teacher_bloc.dart';
import 'package:quanlydaotao/bloc/login/log_in_bloc.dart';
import 'package:quanlydaotao/bloc/signUp/sign_up_bloc.dart';
import 'package:quanlydaotao/bloc/study_document/study_document_bloc.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/login/view/login_view.dart';
import 'package:quanlydaotao/main_application/screen/main_layout.dart';
import 'package:quanlydaotao/main_application/screen/main_layout_student.dart';
import 'package:quanlydaotao/models/student_model.dart';
import 'package:quanlydaotao/models/teacher_model.dart';
import 'package:quanlydaotao/utils/data/enums/gender.dart';

// ObjectPerson localObjectPerson = ObjectPerson.student;
ObjectPerson localObjectPerson = ObjectPerson.teacher;
late StudentModel authStudent;
late TeacherModel authTeacher;
// MainLayoutSlect mainLayoutSlect = MainLayoutSlect.showClass;
ValueNotifier<MainLayoutSelectTeacher> mainLayoutSelectTeacher = ValueNotifier<MainLayoutSelectTeacher>(MainLayoutSelectTeacher.showClass);
ValueNotifier<MainLayoutSelectStudent> mainLayoutSelectStudent = ValueNotifier<MainLayoutSelectStudent>(MainLayoutSelectStudent.showClass);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => LogInBloc(),
        ),
        BlocProvider(
          create: (context) => AddClassTeacherBloc(),
        ),
        BlocProvider(
          create: (context) => AddClassStudentBloc(),
        ),
        BlocProvider(
          create: (context) => ClassRoomTeacherBloc(),
        ),
        BlocProvider(
          create: (context) => FormTeacherBloc(),
        ),
        BlocProvider(
          create: (context) => FormStudentBloc(),
        ),
        BlocProvider(
          create: (context) => AttendanceTeacherBloc(),
        ),
        BlocProvider(
          create: (context) => StudyDocumentBloc(),
        ),
        BlocProvider(
          create: (context) => AddStudentToClassBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quan ly dao tao ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.red),
            useMaterial3: true,
          ),
          // home: const SignUpScreen()
          home: const LoginScreen()
          // home: AppMainLayout(),
          ),
    );
  }
}
