import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quanlydaotao/bloc/study_document/study_document_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/core/theme/app_form_field.dart';
import 'package:quanlydaotao/modules/auth/widgets/outline_text_form_field.dart';
import 'package:quanlydaotao/utils/ui/app_border_and_radius.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyDocumentStudentView extends StatefulWidget {
  final String classID;
  const StudyDocumentStudentView({super.key, required this.classID});

  @override
  State<StudyDocumentStudentView> createState() => _StudyDocumentStudentViewState();
}

class _StudyDocumentStudentViewState extends State<StudyDocumentStudentView> {

  @override
  void initState() {
    BlocProvider.of<StudyDocumentBloc>(context)
        .add(InitGetListStudyEvent(classID: widget.classID));
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudyDocumentBloc, StudyDocumentState>(
      builder: (context, state) {
        if (state.status == StudyStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == StudyStatus.failure) {
          return const Center(
            child: Text("ERROR"),
          );
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
                    "Tài liệu học tập",
                    style: AppTextStyles.text15W500Gray,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.listStudyDocument!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(state
                              .listStudyDocument![
                                  state.listStudyDocument!.length - 1 - index]
                              .dataLink ??
                          "google.com"))) {
                        throw 'Could not launch url';
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color:
                                        AppColors.black99.withOpacity(0.3)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.listStudyDocument![state.listStudyDocument!.length - 1 - index].dataLink}",
                              style: AppTextStyles.text13W500Black.copyWith(
                                  decoration: TextDecoration.underline),
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  DateFormat('hh:mma -- dd-MM-yyyy').format(
                                      state
                                          .listStudyDocument![
                                              state.listStudyDocument!.length -
                                                  1 -
                                                  index]
                                          .createdAt!),
                                  style: AppTextStyles.text12W500Gray,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                )),
              ],
            ),
          );
        }
      },
    );
  }
}
