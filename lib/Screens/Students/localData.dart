import 'package:cloud_firestore/cloud_firestore.dart';

List<String> currentClassStudents = new List<String>();

getCurrentClassStudents(className) {
  currentClassStudents.clear();
  print('cleared');
  print(currentClassStudents);
  Firestore.instance
      .collection('Classrooms')
      .document(className)
      .get()
      .then((docSnapshot) {
        for(var i = 0; i<docSnapshot.data['students'].length;i++){
          currentClassStudents.add(docSnapshot.data['students'][i]);
        }
        print('Students are: ');
        print(currentClassStudents);
      });
}
