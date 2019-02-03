import 'dart:async';

class Validator {
  //String , String are the input type and the output type 
      final validateEmail= StreamTransformer<String,String>.fromHandlers(
        handleData: (email, sink){
          if (email.contains('@'))
          {
                sink.add(email);
          }
          else if (email.isEmpty){
            sink.addError('this field must be filled');
          }
          else {
            sink.addError('Enter a valid Email!!');
          }
        }
      );
 final validatePassword = StreamTransformer<String,String>.fromHandlers(
        handleData: (password, sink){
          if (password.length > 3)
          {
                sink.add(password);
          }
          else if ( password.isEmpty)
          {
            sink.addError('This field must be filled');
          }
          else {
            sink.addError('Password must be at least 4 characters !!');
          }
        }
      );

}