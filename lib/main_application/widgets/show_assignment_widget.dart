import 'package:flutter/material.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/models/answer_model.dart';
import 'package:quanlydaotao/models/assignment_model.dart';
import 'package:quanlydaotao/models/question_model.dart';
import 'package:quanlydaotao/models/test_model.dart';

class ShowAssignmentWidget extends StatefulWidget {
  final int index;
  final Question question;
  final AnswerModel answer;
  const ShowAssignmentWidget(
      {super.key,
      required this.question,
      required this.answer,
      required this.index});

  @override
  State<ShowAssignmentWidget> createState() => _ShowAssignmentWidgetState();
}

class _ShowAssignmentWidgetState extends State<ShowAssignmentWidget> {
  int? _selectOne;
  final Map<int, bool> _checkBox = {};

  @override
  void initState() {
    switch (widget.question.type) {
      case 0:
      if(widget.answer.dataAnswers!.length!=0){
        _selectOne = widget.question.dataAnswers.indexOf(widget.answer.dataAnswers!.first);
      }
        break;
      case 1:
        for (var i = 0; i < widget.question.dataAnswers.length; i++) {
          if (widget.answer.dataAnswers!
              .contains(widget.question.dataAnswers[i])) {
            _checkBox[i] = true;
          } else {
            _checkBox[i] = false;
          }
        }
        break;

      case 2:
        break;
      case 3:
        break;
      default:
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: AppColors.gray)),
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
          _answerContent(),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Số điểm : ",
                    style: AppTextStyles.text15W500Gray,
                  ),
                  SizedBox(
                      width: 50,
                      child: Text(
                        "${widget.answer.score}/${widget.question.score}",
                        style: AppTextStyles.text15W500Black,
                      )),
                ],
              ),
          ),
        ],
      ),
    );
  }

  Widget _answerContent() {
    switch (widget.question.type) {
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
                    onChanged: (int? value) {},
                  ),
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
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(child: Text(e))
                ],
              ))
          .toList(),
    );
  }

  Widget _makeAnswer(){
    return Text(widget.answer.dataAnswers!.first);
  }
}
