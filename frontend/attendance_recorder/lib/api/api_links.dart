String website = "localhost:8000/";
String allUsersLink = "${website}users/users/";
String allStudentsLink = "${website}users/students/";
String allTeachersLink = "${website}users/teachers/";
String allClassesLink = "${website}classes/classes/";
String allAttendanceLink = "${website}attendance/attendance/";
String loginLink = "${website}users/login/";

String getSpecificStudentLink(int admnNumber){
  return "$allStudentsLink$admnNumber/";
}

String getSpecificTeacherLink(int id){
  return "$allTeachersLink$id/";
}

String getSpecificUserLink(int id){
  return "$allUsersLink$id/";
}

String getSpecificStudentAttendanceLink(int admnNumber){
  return "${allAttendanceLink}student/$admnNumber/";
}

String getSpecificClassLink(int id){
  return "$allClassesLink$id/";
}