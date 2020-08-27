import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/data.dart';
import 'package:provider_app/datanotifer.dart';
import 'package:provider_app/form_api.dart';
import 'services/crud.dart';


class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String  name;
  String  email;
  String  place;
  String  password;
  String  phone;

  crudMethods crudObj = new crudMethods();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   // Data _currentState;
//  void initState()
//  {
//    super.initState();
//    DataNotifier dataNotifier= Provider.of<DataNotifier>(context,listen: false);
//
//    if(dataNotifier.currentState != null)
//      {
//        _currentState=dataNotifier.currentState;
//
//      }
//        else {
//      _currentState = Data();
//    }
//  }

  Widget _buildName()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      //initialValue:_currentState.name,
      maxLength: 20,
      // ignore: missing_return
      validator: (String value)
      {
        if(value.isEmpty)
          {
            return "Name is required";
          }
      },
      onSaved: (String value){
        this.name=value;
      },
    );
  }
  Widget _buildEmail()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
        //initialValue:_currentState.email,
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty)
        {

        return "email is required";

         }

        if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value))
        {
              return 'Please enter a valid email Address';
        }

            return null;
          },
        onSaved: (String value)
        {
        this.email=value;
        },
    );
  }
  Widget _buildPlace()
  {
    return TextFormField(
      decoration: InputDecoration(labelText:'Place'),
      //initialValue: _currentState.place,
      maxLength: 20,
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty)
          {
            return "place is required";
          }
      },

      onSaved: (String value)
      {
        this.place=value;
      },

    );
  }

  Widget _buildPhone()
  {
    return TextFormField(
      decoration: InputDecoration(labelText:'Phone'),
      //initialValue:_currentState.phone,
      // ignore: missing_return
      validator: (String value){
        if(value.length!=10)
        {
          return "mobile number must have 10 digits";
        }
        return null;
      },

      onSaved: (String value)
      {
        this.phone=value;
      },

    );
  }

  Widget _buildPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(labelText: 'Password'),
      //initialValue: _currentState.password,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return "password is required";
        }
      },
      onChanged: (String value) {
        this.password= value;
      },

    );
  }

//  _onDataUploaded(Data data)
//  {
//    DataNotifier dataNotifier = Provider.of<DataNotifier>(
//
//  _saveFood()
//  {
//    print('calledddd');
//
//    print('data saved');
//
//    uploadData(_currentState,_onDataUploaded);
//
//  }
  @override
  Widget build(BuildContext context)
  {
//    DataNotifier dataNotifier= Provider.of<DataNotifier>(context);

    return Scaffold(
      appBar:AppBar(title:Text("Form Demo"),
      centerTitle: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPlace(),
             _buildPassword(),
              _buildPhone(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text("Submit",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 10.0),),
                  onPressed:(){
                    if(_formkey.currentState.validate())
                    {
                      return;
                    }
                    _formkey.currentState.save();

                    Map detData ={
                      'name':name,
                      'email':email,
                      'place':place,
                      'password': password,
                      'phone':phone,
                    };
                    crudObj.addData(detData).catchError((e){

                      print (e);
                    });
                  },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
