import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/models/attendance_model.dart';
import 'package:quanlydaotao/services/attendance_repo.dart';

part 'attendance_teacher_event.dart';
part 'attendance_teacher_state.dart';

class AttendanceTeacherBloc
    extends Bloc<AttendanceTeacherEvent, AttendanceTeacherState> {
  List<AttendanceModel> listAttendance = [];
  int statusLock = 0;
  late String classID;

  AttendanceTeacherBloc() : super(const AttendanceTeacherState()) {
    on<AttendanceTeacherEvent>((event, emit) {});
    on<InitListAttendanceEvent>(_onInitListAttend);
    on<UpdateListAttendanceEvent>(_updateListAttend);
    // on<GetLockStatusEvent>(_onGetStatusLock);
    on<UpdateLockStatusEvent>(_onUpdateLock);
  }

  Future<void> _onInitListAttend(InitListAttendanceEvent event,
      Emitter<AttendanceTeacherState> emit) async {
    try {
      emit(state.copyWith(status: AttendaceStatus.initial));
      listAttendance = await AttendanceRepo().getListAttendace(event.classID);
      classID = event.classID;
       await AttendanceRepo().getStatusLock(classID: classID);
      emit(state.copyWith(
          status: AttendaceStatus.success, listAttendance: listAttendance,statusLock: statusLock));
    } catch (e) {
      emit(state.copyWith(status: AttendaceStatus.failure));
      logger.log('Get Attendance error : $e');
    }
  }

  Future<void> _updateListAttend(UpdateListAttendanceEvent event,
      Emitter<AttendanceTeacherState> emit) async {
    try {
      await AttendanceRepo().updateListAttendace(
          listAttendance: event.listAttendance, classID: classID);

      emit(state.copyWith(
          status: AttendaceStatus.updateSuccess,
          listAttendance: listAttendance));
    } catch (e) {
      emit(state.copyWith(status: AttendaceStatus.failure));
      logger.log('Update Attendance error : $e');
    }
  }

  Future<void> _onUpdateLock(
      UpdateLockStatusEvent event, Emitter<AttendanceTeacherState> emit) async {
    try {
      statusLock = await AttendanceRepo().updateLock(classID: classID, statusLock: event.statusLock);
      logger.log("statusLock : ${event.statusLock}");
      emit(state.copyWith(statusLock: statusLock));
    } catch (e) {
      emit(state.copyWith(status: AttendaceStatus.failure));
      logger.log('Update Lock error : $e');
    }
  }
}
