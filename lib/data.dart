import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_app/main.dart';
class Data {
  String name;
  String email;
  String place;
  String password;
  String phone;

  Data();
  List<Data> _dataList=[];

  Data.fromMap(Map<String, dynamic>data)
  {
    name = data['name'];
    email = data['email'];
    place = data['place'];
    password = data['password'];
    phone = data['phone'];
  }

  Map<String,dynamic> toMap()
  {

    return
      {
        'name':name,
        'email':email,
        'place':place,
        'password': password,
        'phone':phone,


      };
  }
}