part of 'add_student_to_class_bloc.dart';

sealed class AddStudentToClassEvent {}

class AddEvent extends AddStudentToClassEvent {
  final String classID;
  final List<String> listmssv;

  AddEvent({required this.classID, required this.listmssv});
}
