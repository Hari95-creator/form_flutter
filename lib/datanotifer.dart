import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_app/data.dart';

class DataNotifier with ChangeNotifier
{
  List<Data> _dataList=[];
  Data _currentState;

  UnmodifiableListView<Data> get dataList=> UnmodifiableListView(_dataList);

  Data get currentState=> _currentState;

  set dataList(List<Data> dataList)
  {
    _dataList=dataList;
    notifyListeners();
  }

  set currentState(Data data)
  {
    _currentState=data;
    notifyListeners();
  }
}
