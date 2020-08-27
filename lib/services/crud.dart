import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods
{
  Future<void> addData(detData) async{
    Firestore.instance.collection('/users').add(detData).catchError((e)
    {
      print(e);
    });
    print('data uploaded succesfully');
  }
}