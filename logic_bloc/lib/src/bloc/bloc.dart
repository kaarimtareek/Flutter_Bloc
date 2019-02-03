import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
//we can't use mixins without using extends key word ,
// the target class must be child for another class
//the stream controller  by default is consumed one time
//but we want to use the emailcontroller two times
//one in the email field and another one in
//submit button field , so we use the type
//broadcast to be ablt to use it more than once
//we changed the type of streamController to beavior subject
//because we want to get the last value in the stream
//and it's by default broadcast stream

class Bloc extends Object with Validator{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
//change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
// add data to stream
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(emailStream  , password, (emailStream, password) =>true);
  //traditional name for closing streams
  submit(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    print("$validEmail , $validPassword");
  }
    dispose(){
      _emailController.close();
      _passwordController.close();
    }

}


