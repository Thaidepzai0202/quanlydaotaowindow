import 'package:flutter/material.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/models/answer_model.dart';
import 'package:quanlydaotao/models/question_model.dart';

class DoQuestionWidget extends StatefulWidget {
  final int index;
  final Question question;
  final Function(AnswerModel) onUpdate;
  // final AnswerModel answer;
  const DoQuestionWidget(
      {super.key,
      required this.question,
      // required this.answer,
      required this.index,
      required this.onUpdate});

  @override
  State<DoQuestionWidget> createState() => _DoQuestionWidgetState();
}

class _DoQuestionWidgetState extends State<DoQuestionWidget> {
  final _formKey = GlobalKey<FormState>();
  int _type = 0;
  int? _selectOne;
  final Map<int, bool> _checkBox = {
    0: false,
    1: false,
  };
  List<String> _studentAnswer = [];
  final TextEditingController _editAnswerStudent = TextEditingController(text: "");

  @override
  void initState() {
    _type = widget.question.type;
    for (var i = 0; i < widget.question.dataAnswers.length; i++) {
      _checkBox[i] = false;
    }
    super.initState();
  }
  @override
  void dispose() {
    _editAnswerStudent.dispose();
    super.dispose();
  }

  void _updateAnswer() {
    List<String> update = [];
    if (_type == 0) {
      update.add(_selectOne!=null ? widget.question.dataAnswers[_selectOne!] : "") ;
    } else if (_type == 1) {
      for (var element in widget.question.dataAnswers) {
        if (_checkBox[widget.question.dataAnswers.indexOf(element)] == true) {
          update.add(element);
        }
      }
    } else if (_type == 2) {
      update.add(_editAnswerStudent.text);
    }
    _studentAnswer = update;
    widget.onUpdate(AnswerModel(
        idQuestion: widget.question.idQuestion,
        mssv: authStudent.mssv,
        dataAnswers: _studentAnswer));
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: AppColors.gray)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('${widget.index + 1}. '),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        widget.question.dataQuestion,
                        style: AppTextStyles.text15W500Black,
                      )),
                ],
              ),
            ),
            _answerWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Số điểm : ",
                  style: AppTextStyles.text15W500Gray,
                ),
                SizedBox(
                    width: 50,
                    child: Text(
                      widget.question.score.toString(),
                      style: AppTextStyles.text15W500Black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerWidget() {
    switch (_type) {
      case 0:
        return _makeOneAnswer();
      case 1:
        return _makeManyAnswer();
      case 2:
        return _makeAnswer();
      case 3:
        return _makeAnswer();
      default:
        return _makeOneAnswer();
    }
  }

  Widget _makeOneAnswer() {
    return Column(
      children: widget.question.dataAnswers
          .map((e) => Row(
                children: [
                  Radio(
                      value: widget.question.dataAnswers.indexOf(e),
                      groupValue: _selectOne,
                      onChanged: (value) {
                        setState(() {
                          _selectOne = value!;
                        });
                        _updateAnswer();
                      }),
                  Text(e)
                ],
              ))
          .toList(),
    );
  }

  Widget _makeManyAnswer() {
    return Column(
      children: widget.question.dataAnswers
          .map((e) => Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Checkbox(
                      value: _checkBox[widget.question.dataAnswers.indexOf(e)],
                      onChanged: (value) {
                        setState(() {
                          _checkBox[widget.question.dataAnswers.indexOf(e)] =
                              value!;
                        });
                        _updateAnswer();
                      },
                    ),
                  ),
                  SizedBox(child: Text(e))
                ],
              ))
          .toList(),
    );
  }

  Widget _makeAnswer() {
    return TextFormField(
      controller: _editAnswerStudent,
      onChanged: (value) => _updateAnswer() ,
    );
  }
}
