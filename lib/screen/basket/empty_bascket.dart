import 'package:flutter/material.dart';
import 'package:online_shop/screen/account/user_pannel.dart';

class EMPTY_BASCKET extends StatefulWidget {
  @override
  State<EMPTY_BASCKET> createState() => _EMPTY_BASCKETState();
}

class _EMPTY_BASCKETState extends State<EMPTY_BASCKET> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("بازگشت"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return USER_PANNEL();
            }));
          }),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Image.asset("assets/images/empty.png"),
          )
        ],
      )),
    );
  }
}
