
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_app/data.dart';
import 'datanotifer.dart';



//getDetails(DataNotifier dataNotifier)async
//{
//   QuerySnapshot snapshot= await Firestore.instance.collection("form").getDocuments();
//
//   List<Data> _dataList=[];
//
//   snapshot.documents.forEach((document){
//     Data data = Data.fromMap(document.data);
//     _dataList.add(data);
//   });
//
//   dataNotifier.dataList = _dataList;
//}
//
//uploadData(Data data)async
//{
//  CollectionReference dataRef= Firestore.instance.collection("form");
//
//
//
////      data.createdAt = Timestamp.now();
////
////      DocumentReference documnetRef= await dataRef.add(data.toMap());
////
////      data.name =documnetRef.documentID;
////
////      print('uploaded data successfully:${data.toString()}');
////
////      await documnetRef.setData(data.toMap(),merge:true);
//}
//
////Future<void>addData(formData)async{
////  Firestore.instance.collection("form").add(formData).catchError((e){
////    print(e);
////  });
////}
