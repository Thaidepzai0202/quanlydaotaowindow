import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_teacher/add_class_teacher_bloc.dart';
import 'package:quanlydaotao/common/models/selectable_Item.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/core/theme/app_form_field.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/models/class_model.dart';
import 'package:quanlydaotao/models/subject_model.dart';
import 'package:quanlydaotao/modules/auth/widgets/outline_text_form_field.dart';
import 'package:quanlydaotao/utils/data/enums/classSession.dart';
import 'package:quanlydaotao/utils/data/enums/day_of_week.dart';
import 'package:quanlydaotao/widget/signup_dialog.dart';

class AddClassDialog extends StatefulWidget {
  final SubjectModel subjectModel;
  const AddClassDialog({super.key, required this.subjectModel});

  @override
  State<AddClassDialog> createState() => _AddClassDialogState();
}

class _AddClassDialogState extends State<AddClassDialog> {
  String? _selectedDay;
  int? _selectedIntDay;
  final TextEditingController _textClassRoomNameController =
      TextEditingController();
  final TextEditingController _textMaxStudentController =
      TextEditingController();
  final List<bool> _selectedShifts =
      List<bool>.filled(ClassSession.values.length, false);

  @override
  void initState() {
    super.initState();
    _selectedDay = null; // Initialize with a default value if necessary
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: BlocListener<AddClassTeacherBloc, AddClassTeacherState>(
        listener: (context, state) {
          if (state.status == AddClassStatus.classBusy) {
            showDialog(
              context: context,
              builder: (context) {
                return const NotificationSignUp(
                  message: 'Phòng học thời điểm hiện tại đã có lớp học',
                );
              },
            );
          }else if(state.status == AddClassStatus.teacherBusy){
            showDialog(
              context: context,
              builder: (context) {
                return const NotificationSignUp(
                  message: 'Bạn đã có lớp vào thời điểm này rồi',
                );
              },
            );
          } else if (state.status == AddClassStatus.addSuccess) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return const NotificationSignUp(
                  message: 'Tạo lớp thành công',
                );
              },
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              image: const DecorationImage(
                image: AssetImage(Images.background_hust),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20)),
          height: 400,
          width: 650,
          child: Column(
            children: [
              Container(
                height: 40,
                width: 650,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: Gradients.gradientRed),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const Text(
                      StringConst.makeClass,
                      style: AppTextStyles.text18BoldWhite,
                    ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.white,
                        ))
                  ],
                ),
              ),
              _showSubjectName(),
              _showSubjectID(),
              _showTeacherName(),
              _showClassName(),
              _showDayOfWeek(),
              _showSession(),
              InkWell(
                onTap: () {
                  BlocProvider.of<AddClassTeacherBloc>(context).add(
                      AddClassEvent(
                          classRoomModel: ClassRoomModel(
                              className: _textClassRoomNameController.text,
                              classId: " ",
                              mscb: authTeacher.mscb,
                              subjectId: widget.subjectModel.subjectId,
                              dayOfWeek: _selectedIntDay!.toString(),
                              maxStudent: int.parse(_textMaxStudentController.text),
                              classSession:
                                  convertSelectionsToString(_selectedShifts))));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: Gradients.gradientRed,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    StringConst.done,
                    style: AppTextStyles.text16BoldWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showSubjectName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 8.0),
      child: Row(
        children: [
          const Text(
            "Môn học :            ",
            style: AppTextStyles.text16NormalWhite,
          ),
          Text(
            widget.subjectModel.subjectName,
            style: AppTextStyles.text16BoldWhite,
          ),
        ],
      ),
    );
  }

  Widget _showSubjectID() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 8.0),
      child: Row(
        children: [
          Text(
            "Mã Học Phần:                ${widget.subjectModel.subjectId}",
            style: AppTextStyles.text16NormalWhite,
          ),
        ],
      ),
    );
  }

  Widget _showTeacherName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 8.0),
      child: Row(
        children: [
          const Text(
            "Giáo viên đứng lớp :                ",
            style: AppTextStyles.text16NormalWhite,
          ),
          Text(
            authTeacher.name,
            style: AppTextStyles.text18BoldWhite,
          ),
        ],
      ),
    );
  }

  Widget _showClassName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "Phòng học :   ",
              style: AppTextStyles.text16NormalWhite,
            ),
          ),
          SizedBox(
            width: 100,
            height: 62,
            child: OutlineTextFormField(
              controller: _textClassRoomNameController,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.tundora,
              ),
              decoration: AppFormField.inputDecorationLight.copyWith(
                // hintText: "...",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray),
              ),
            ),
          ),
          const SizedBox(width: 100,),
          Container(
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "Số lượng sinh viên tối đa :  ",
              style: AppTextStyles.text16NormalWhite,
            ),
          ),
          SizedBox(
            width: 62,
            height: 62,
            child: TextFormField(
              style: AppTextStyles.text15W500White,
            controller: _textMaxStudentController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              // labelText: 'Enter an integer',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          ),
        ],
      ),
    );
  }

  Widget _showDayOfWeek() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        children: [
          const Text(
            "Thứ trong tuần :              ",
            style: AppTextStyles.text16NormalWhite,
          ),
          DropdownButton<String>(
            style: AppTextStyles.text16BoldWhite,
            dropdownColor: AppColors.red,
            iconDisabledColor: AppColors.white,
            iconEnabledColor: AppColors.white,
            hint: const Text(
              'Chọn ngày',
              style: AppTextStyles.text16W500White,
            ),
            value: _selectedDay,
            items: DayOfWeek.selectableItemList.map((SelectableItem item) {
              return DropdownMenuItem<String>(
                value: item.id,
                child: Center(child: Text(item.name)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedDay = newValue;
                _selectedIntDay = newValue != null ? int.parse(newValue) : null;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return DayOfWeek.selectableItemList.map((SelectableItem item) {
                return Center(
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList();
            },
            // isExpanded: true,
          )
        ],
      ),
    );
  }

  Widget _showSession() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "Ca làm việc :         ",
              style: AppTextStyles.text16NormalWhite,
            ),
          ),
          SizedBox(
            width: 400,
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ClassSession.selectableItemList.length,
                itemBuilder: (context, index) {
                  final item = ClassSession.selectableItemList[index];
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: CustomCheckboxListTile(
                      title: item.name,
                      value: _selectedShifts[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedShifts[index] = value!;
                        });
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CustomCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,

              materialTapTargetSize: MaterialTapTargetSize
                  .shrinkWrap, // Loại bỏ đệm không cần thiết
              visualDensity: VisualDensity.standard,
            ),
            Text(
              title,
              style: AppTextStyles.text15W500White,
            ),
          ],
        ),
      ),
    );
  }
}

String convertSelectionsToString(List<bool> selections) {
  String result = '';

  for (int i = 0; i < selections.length; i++) {
    if (selections[i]) {
      if (result.isNotEmpty) {
        result += ',';
      }
      result += (i + 1).toString();
    }
  }

  return result;
}
