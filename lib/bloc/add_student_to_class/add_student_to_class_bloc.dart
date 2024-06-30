import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/services/class_content_reo.dart';

part 'add_student_to_class_event.dart';
part 'add_student_to_class_state.dart';

class AddStudentToClassBloc
    extends Bloc<AddStudentToClassEvent, AddStudentToClassState> {
  AddStudentToClassBloc() : super(AddStudentToClassState()) {
    on<AddStudentToClassEvent>((event, emit) {});
    on<AddEvent>(_onAddStudent);
  }

  Future<void> _onAddStudent(AddEvent event,
      Emitter<AddStudentToClassState> emit) async {
    try {
      emit(state.copyWith(status: AddStudentToClassStatus.initial));
       await ClassContentRepo().addStudentToClass(classID: event.classID, listmssv: event.listmssv);
      //  logger.log("Adding",color: StrColor.green);
      emit(state.copyWith(
          status: AddStudentToClassStatus.success, message: "Đã thêm học sinh"));
    } catch (e) {
      emit(state.copyWith(status: AddStudentToClassStatus.failure));
      logger.log('Get Attendance error : $e');
    }
  }
}

