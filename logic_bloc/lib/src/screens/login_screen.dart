import 'package:flutter/material.dart';
import 'package:logic_bloc/src/bloc/bloc.dart';
import 'package:logic_bloc/src/bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          passwordField(bloc),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          submitButton(bloc)
        ],
      ),
    );
  }
}

//snapshot has the latest data in te stream
Widget emailField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.emailStream,
      builder: (conext, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'You@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      });
}

//stream builder works instead of stateful
//it watchs a stream any time stream has
//new value come through it
//the widget will call the builder method,
//and render the whole widget
//snapshot is argument that
//contains data for the accured event
//came from that stream

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.password,
      builder: (conext, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        );
      });
}

Widget submitButton(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.submitValid,
    builder: (context, snapshot) {
      return RaisedButton(
        onPressed: !snapshot.hasData?null:bloc.submit,
        child: Text('Submit'),
        
      );
    },
  );
}
