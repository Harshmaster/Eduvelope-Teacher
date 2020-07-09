import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> currentTeacherClassrooms = new List<String>();
String currentTeacherId;
String currentTeacherName;

getCurrentId() {
  FirebaseAuth.instance.currentUser().then((user) {
    currentTeacherId = user.uid;
  });
}

getCurrentTeacherName(id) async {
  await Firestore.instance
      .collection('Teachers')
      .document(id)
      .get()
      .then((docSnapshot) {
    currentTeacherClassrooms.clear();
    for (var i = 0; i < docSnapshot.data['classrooms'].length; i++) {
      currentTeacherClassrooms.add(docSnapshot.data['classrooms'][i]);
    }
    currentTeacherName='';
    currentTeacherName = '${docSnapshot.data['firstName']} ${docSnapshot.data['lastName']}';
  });
}

getCurrentTeacherRooms(id) async {
  await Firestore.instance
      .collection('Teachers')
      .document(id)
      .get()
      .then((docSnapshot) {
    currentTeacherClassrooms.clear();
    for (var i = 0; i < docSnapshot.data['classrooms'].length; i++) {
      currentTeacherClassrooms.add(docSnapshot.data['classrooms'][i]);
    }
  });
}
