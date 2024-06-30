import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanlydaotao/bloc/signUp/sign_up_bloc.dart';
import 'package:quanlydaotao/common/models/selectable_Item.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/core/theme/app_form_field.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/modules/auth/widgets/email_field.dart';
import 'package:quanlydaotao/modules/auth/widgets/outline_text_form_field.dart';
import 'package:quanlydaotao/modules/auth/widgets/password_field.dart';
import 'package:quanlydaotao/utils/data/enums/cource.dart';
import 'package:quanlydaotao/utils/data/enums/gender.dart';
import 'package:quanlydaotao/utils/helps/validators.dart';
import 'package:quanlydaotao/utils/ui/app_dialogs.dart';
import 'package:quanlydaotao/widget/signup_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController contactLoginTEC = TextEditingController();
  final FocusNode _emailNode = FocusNode(), _passNode = FocusNode();
  TextEditingController passUse = TextEditingController();
  final TextEditingController _textNameController = TextEditingController();
  final TextEditingController _textNumberStudentController =
      TextEditingController();
  final TextEditingController _textClassNameController =
      TextEditingController();
  final TextEditingController _textCourseController = TextEditingController();
  late SelectableItem _gender;
  late SelectableItem _cource;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textGenderController = TextEditingController();
  final TextEditingController _textPass2Controller = TextEditingController();
  ObjectPerson objectPerson = ObjectPerson.student;

  //nhập lại mật khẩu
  final FocusNode _focusRepeatPassword = FocusNode();
  final _rePasswordKey = GlobalKey<FormFieldState>();
  bool isChanging = false;

  @override
  void initState() {
    super.initState();
    _gender = Gender.selectableItemList.first;
    _textGenderController.text = _gender.name;
    _cource = Course.selectableItemList.first;

    doWhenWindowReady(() {
      var initialSize = const Size(450, 690);
      appWindow.minSize = initialSize;
      appWindow.maxSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == PostStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => NotificationSignUp(message: state.message!),
            );
          } else if (state.status == PostStatus.success) {
            showDialog(
              context: context,
              builder: (context) => NotificationSignUp(message: state.message!),
            );
          }
        },
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return Container(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LogoCompany(),
                          WindowButtonSmall(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      // width: 250,
                      height: MediaQuery.of(context).size.height - 40,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            StringConst.createAccount,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            // color: AppColors.white,
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => setState(() {
                                    objectPerson = ObjectPerson.student;
                                    localObjectPerson = ObjectPerson.student;
                                  }),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringConst.student,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: objectPerson ==
                                                    ObjectPerson.student
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                            color: objectPerson ==
                                                    ObjectPerson.student
                                                ? AppColors.white
                                                : AppColors.grayHint),
                                      ),
                                      Container(
                                        height: 2,
                                        width: 100,
                                        color:
                                            objectPerson == ObjectPerson.student
                                                ? AppColors.white
                                                : AppColors.grayHint,
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => setState(() {
                                    objectPerson = ObjectPerson.teacher;
                                    localObjectPerson = ObjectPerson.teacher;
                                  }),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringConst.teacher,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: objectPerson ==
                                                    ObjectPerson.teacher
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                            color: objectPerson ==
                                                    ObjectPerson.teacher
                                                ? AppColors.white
                                                : AppColors.grayHint),
                                      ),
                                      Container(
                                        height: 2,
                                        width: 100,
                                        color:
                                            objectPerson == ObjectPerson.teacher
                                                ? AppColors.white
                                                : AppColors.grayHint,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            // padding: const EdgeInsets.only(bottom: 10, top: 50),
                            child: Form(
                              key: _formKey,
                              // onChanged: () => _formKey.currentState?.validate(),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //email -----------------------------
                                    EmailField(
                                      controller: contactLoginTEC,
                                      focusNode: _emailNode,
                                    ),
                                    //họ và tên -----------------------------
                                    SizedBox(
                                      width: 360,
                                      height: 62,
                                      child: OutlineTextFormField(
                                        controller: _textNameController,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.tundora,
                                        ),
                                        decoration: AppFormField
                                            .inputDecorationLight
                                            .copyWith(
                                          hintText: StringConst.fullName,
                                          hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.gray),
                                          prefixIcon: Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: SvgPicture.asset(
                                              Images.ic_person_setup,
                                              height: 20,
                                              width: 20,
                                              color: AppColors.grey666,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Mã số sinh viên / cán bộ--------------------
                                    SizedBox(
                                      width: 360,
                                      height: 62,
                                      child: OutlineTextFormField(
                                        controller:
                                            _textNumberStudentController,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.tundora,
                                        ),
                                        decoration: AppFormField
                                            .inputDecorationLight
                                            .copyWith(
                                          hintText: objectPerson ==
                                                  ObjectPerson.student
                                              ? StringConst.numberStudent
                                              : StringConst.numberTeacher,
                                          hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.gray),
                                          prefixIcon: Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: SvgPicture.asset(
                                              Images.ic_person_setup,
                                              height: 20,
                                              width: 20,
                                              color: AppColors.grey666,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //Lớp học/ Chức vụ  ------------------------
                                    SizedBox(
                                      width: 360,
                                      height: 62,
                                      child: OutlineTextFormField(
                                        controller: _textClassNameController,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.tundora,
                                        ),
                                        decoration: AppFormField
                                            .inputDecorationLight
                                            .copyWith(
                                          hintText: objectPerson ==
                                                  ObjectPerson.student
                                              ? StringConst.className
                                              : StringConst.position,
                                          hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.gray),
                                          prefixIcon: Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: SvgPicture.asset(
                                              Images.ic_person_setup,
                                              height: 20,
                                              width: 20,
                                              color: AppColors.grey666,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //Khóa học----------------------------------
                                    objectPerson == ObjectPerson.student
                                        ? GestureDetector(
                                            onTap: () =>
                                                AppDialogs.showListDialog(
                                                        context: context,
                                                        list: Course
                                                            .selectableItemList,
                                                        value: _cource)
                                                    .then((value) {
                                              // if (value != null)
                                              //   _cource = value;
                                              _textCourseController.text =
                                                  _cource.name;
                                            }),
                                            child: SizedBox(
                                              width: 360,
                                              height: 62,
                                              child: OutlineTextFormField(
                                                controller:
                                                    _textCourseController,
                                                enable: false,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.tundora,
                                                ),
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                decoration: AppFormField
                                                    .inputDecorationLight
                                                    .copyWith(
                                                  hintText:
                                                      StringConst.selectCource,
                                                  hintStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.gray),
                                                  prefixIcon: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: SvgPicture.asset(
                                                      Images.ic_person,
                                                      height: 20,
                                                      width: 20,
                                                      color: AppColors.grey666,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            width: 360,
                                            height: 62,
                                            child: OutlineTextFormField(
                                              controller: _textCourseController,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: AppColors.tundora,
                                              ),
                                              decoration: AppFormField
                                                  .inputDecorationLight
                                                  .copyWith(
                                                hintText: StringConst.faculty,
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.gray),
                                                prefixIcon: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: SvgPicture.asset(
                                                    Images.ic_person_setup,
                                                    height: 20,
                                                    width: 20,
                                                    color: AppColors.grey666,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    //giới tính-----------------------------
                                    GestureDetector(
                                      onTap: () => AppDialogs.showListDialog(
                                              context: context,
                                              list: Gender.selectableItemList,
                                              value: _gender)
                                          .then((value) {
                                        if (value != null) _gender = value;
                                        _textGenderController.text =
                                            _gender.name;
                                      }),
                                      child: SizedBox(
                                        width: 360,
                                        height: 62,
                                        child: OutlineTextFormField(
                                          controller: _textGenderController,
                                          enable: false,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.tundora,
                                          ),
                                          textCapitalization:
                                              TextCapitalization.words,
                                          decoration: AppFormField
                                              .inputDecorationLight
                                              .copyWith(
                                            hintText: StringConst.selectGender,
                                            hintStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.gray),
                                            prefixIcon: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: SvgPicture.asset(
                                                Images.ic_gender,
                                                height: 20,
                                                width: 20,
                                                color: AppColors.grey666,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //Mật khẩu
                                    PasswordField(
                                      controller: passUse,
                                      hintText: StringConst.inputPassword,
                                      focusNode: _passNode,
                                    ),
                                    //Nhập lại mật khẩu
                                    PasswordField(
                                      key: _rePasswordKey,
                                      focusNode: _focusRepeatPassword,
                                      hintText: StringConst.reInputNewPassword,
                                      controller: _textPass2Controller,
                                      // autovalidateMode: AutovalidateMode.disabled,
                                      onChanged: (value) {
                                        // setState(() {
                                        //   isChanging = true;
                                        //   print(_textPass2Controller.value);
                                        // });
                                      },
                                      validator: (value) =>
                                          Validator.reInputPasswordValidator(
                                              value, passUse.text, isChanging),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryHust,
                              fixedSize: const Size(371, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<SignUpBloc>(context).add(
                                  SendDataToSignInEvent(
                                      name: _textNameController.text,
                                      mssv: _textNumberStudentController.text,
                                      gender: _textGenderController.text,
                                      email: contactLoginTEC.text,
                                      password: passUse.text,
                                      classNamePosition:
                                          _textClassNameController.text,
                                      courseFaculty: _textCourseController.text,
                                      objectPerson: objectPerson));
                            },
                            child: const Text(
                              StringConst.signUp,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                StringConst.doHaveAnAccount,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  child: const Text(
                                    StringConst.login,
                                    style: TextStyle(
                                      color: AppColors.primaryHust,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primaryHust,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class WindowButtonSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(iconNormal: AppColors.white),
        ),
        MaximizeWindowButton(
          onPressed: () {},
          colors: WindowButtonColors(
            iconNormal: Colors.grey,
            mouseDown: Colors.transparent,
            mouseOver: Colors.transparent,
            iconMouseDown: Colors.grey,
            iconMouseOver: Colors.grey,
          ),
        ),
        CloseWindowButton(
          colors: WindowButtonColors(iconNormal: AppColors.white),
          onPressed: () {
            appWindow.hide();
          },
        ),
      ],
    );
  }
}

class LogoCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          // Container(height: 29,width: 29,color: Colors.red,),
          Image.asset(Images.logo_hust, height: 28, width: 29),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 5,
              // ),
              Text(
                "HUST",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Quản lý đào tạo",
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}


