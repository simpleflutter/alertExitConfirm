import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  BuildContext appContext;

  Future<bool> exitConfirm() async {
    Future<bool> value = Future.value(false);

    AlertDialog alertDialog = AlertDialog(
      title: Text('Are your sure to exti?'),
      actions: <Widget>[
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(appContext);
            value = Future.value(false);
          },
        ),
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.pop(appContext);
            value = Future.value(true);
          },
        ),
      ],
    );

    await showDialog(
        context: appContext, builder: (BuildContext context) => alertDialog);

    return value;
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;

    return WillPopScope(
      onWillPop: exitConfirm,
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
