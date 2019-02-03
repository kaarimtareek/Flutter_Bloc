import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({Key key, this.child}) : super(key: key, child: child);

  final Widget child;
  final bloc = new Bloc();
//evry context knows about the context above it
//so the inheritFromWidgetOfExactType function is going to look
//for a widget called or the same type (provider)
//and because the function doesn't know the type of that
//widget except it's inherited widget we tell it
//will be of type provider 'as provider'
//then we get the attribute bloc of that provider
  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) => true;
}
