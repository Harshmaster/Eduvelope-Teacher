import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> currentTeacherClassrooms = new List<String>();

SharedPreferences prefs;
String currentTeacherID;
Future<String> getTeacherId() async {
  prefs = await SharedPreferences.getInstance();
  currentTeacherID = prefs.getString("teacherId");
  return prefs.getString("teacherId");
}

getCurrentTeacherRooms(id) async {
  await Firestore.instance
      .collection('Teachers')
      .document(id)
      .get()
      .then((docSnapshot) {
        for(var i = 0; i<docSnapshot.data['classrooms'].length;i++){
          currentTeacherClassrooms.add(docSnapshot.data['classrooms'][i]);
        }
  });
}
