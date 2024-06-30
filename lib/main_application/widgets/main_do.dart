import 'package:flutter/material.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/models/subject_model.dart';
import 'package:quanlydaotao/widget/add_class_dialog.dart';

class MainDo extends StatefulWidget {
  final List<SubjectModel> listSubject;
  const MainDo({super.key, required this.listSubject});

  @override
  State<MainDo> createState() => _MainDoState();
}

class _MainDoState extends State<MainDo> {
  List<SubjectModel> filteredItems = [];

  @override
  void initState() {
    filteredItems = widget.listSubject;
    print(widget.listSubject.first.subjectName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // filteredItems =BlocProvider.of<AddClassTeacherBloc>(context).listSubject;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.gray))),
                child: const Text(
                  StringConst.listSubject,
                  style: AppTextStyles.text15W500Black,
                )),
          ),
          searchWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 40,
                  child: Column(children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AddClassDialog(
                                subjectModel: widget.listSubject[index],
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${index + 1} . ${filteredItems[index].subjectName}"),
                          Text(filteredItems[index].subjectId),
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void nameClassSearchResults(String query) {
    List<SubjectModel> dummyList = [];
    dummyList.addAll(widget.listSubject);
    if (query.isNotEmpty) {
      List<SubjectModel> dummyListData = [];
      for (var item in dummyList) {
        if (item.subjectName.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        filteredItems = dummyListData;
      });
      return;
    } else {
      setState(() {
        filteredItems = widget.listSubject;
      });
    }
  }
  void idClassSearchResults(String query) {
    List<SubjectModel> dummyList = [];
    dummyList.addAll(widget.listSubject);
    if (query.isNotEmpty) {
      List<SubjectModel> dummyListData = [];
      for (var item in dummyList) {
        if (item.subjectId.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        filteredItems = dummyListData;
      });
      return;
    } else {
      setState(() {
        filteredItems = widget.listSubject;
      });
    }
  }

  Widget searchWidget() {
    return Container(
    // width: 300,
    height: 60,
    padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextField(
              onChanged: (value) {
                nameClassSearchResults(value);
              },
              // style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Tên môn học",
                hintStyle: TextStyle(color: AppColors.gray),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.0),
                  child: Icon(Icons.search, color: AppColors.gray),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
              ),
            ),
          ),
          const SizedBox(width: 50,),
          Expanded(
            flex: 2,
            child: TextField(
              onChanged: (value) {
                idClassSearchResults(value);
              },
              // style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Mã học phần",
                hintStyle: TextStyle(color: AppColors.gray),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.0),
                  child: Icon(Icons.search, color: AppColors.gray),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
