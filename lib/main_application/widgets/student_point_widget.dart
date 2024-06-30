import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/classroom_teacher/class_room_teacher_bloc.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/models/class_content_model.dart';

class StudentPointWidget extends StatefulWidget {
  final ClassContentModel student;
  const StudentPointWidget({super.key, required this.student});

  @override
  State<StudentPointWidget> createState() => _StudentPointWidgetState();
}

class _StudentPointWidgetState extends State<StudentPointWidget> {
  final TextEditingController _textMidScore = TextEditingController();
  final TextEditingController _textFinalScore = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode   _focusNode2 = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(_enterPointForStudent);
    _focusNode2.addListener(_enterPointForStudent);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_enterPointForStudent);
    _focusNode2.removeListener(_enterPointForStudent);
    _textMidScore.dispose();
    _textFinalScore.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  _enterPointForStudent() {
    if (!_focusNode.hasFocus) {
      BlocProvider.of<ClassRoomTeacherBloc>(context)
          .add(
              UpdatePointForStudentEvent(
                  classContentModel:
                      ClassContentModel(
                          classId: widget.student.classId,
                          mssv: widget.student.mssv,
                          midScore: _textMidScore.text == ""
                              ? widget.student.midScore
                              : double.parse(_textMidScore.text),
                          finalScore: _textFinalScore.text == ""
                              ? widget.student.finalScore
                              : double.parse(_textFinalScore.text))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 30,
      width: 600,
      child: Row(
        children: [
          SizedBox(width: 250, child: Text(widget.student.dataStudent!.name)),
          SizedBox(width: 80, child: Text(widget.student.mssv)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: 115,
            height: 30,
            child: TextFormField(
              focusNode: _focusNode,
              onFieldSubmitted: (value) {
                _enterPointForStudent();
              },
              controller: _textMidScore,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "${widget.student.midScore}",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: 115,
            height: 30,
            child: TextFormField(
              focusNode: _focusNode2,
              onFieldSubmitted: (value) {
                _enterPointForStudent();
              },
              controller: _textFinalScore,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "${widget.student.finalScore}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
