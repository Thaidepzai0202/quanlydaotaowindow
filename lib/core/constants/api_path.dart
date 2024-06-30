class ApiPath {
  static const port = "http://103.138.113.14/nodejs";

  static const signUpStudent = '$port/api/students';
  static const logInStudent = '$port/api/students/login';
  static const logInTeacher = '$port/api/teachers/login';
  static const signUpTeacher = '$port/api/teachers';
  static const listSubject = '$port/api/subjects';
  static const addClass = '$port/api/classes';
  static const addClassContents = '$port/api/classContents';
  static const getListStudent = '$port/api/classContents/getListStudent';
  static const updatePointForStudent = '$port/api/classContents/updatePoint';
  static const listTest = '$port/api/tests';
  static const listTestStudent = '$port/api/tests/student/';
  static const getTest = '$port/api/tests/getTest/';
  static const submitAssignment = '$port/api/assignment';
  static const getAssgnment = '$port/api/assignment';
  static const getAttendance = '$port/api/attendance/doattendance';
  static const getStatusLock = '$port/api/attendance/getlock';
  static const studyDocument = '$port/api/studydocument';
  static const addStudentToClass = '$port/api/classContents/addListStudent';
}
