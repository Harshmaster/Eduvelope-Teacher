import 'package:cloud_firestore/cloud_firestore.dart';

List<String> currentClassStudents = new List<String>();

getCurrentClassStudents(classid) {
  currentClassStudents.clear();
  print('cleared');
  print(currentClassStudents);
  Firestore.instance
      .collection('Classrooms')
      .where('classID', isEqualTo: classid).getDocuments().then((value){
        value.documents.forEach((element) {
          for(var i=0;i<element.data['students'];i++){
            currentClassStudents.add(element.data['students'][i]);
          }
        });
      });
}
