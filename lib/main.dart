import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shop/screen/home/home.dart';
import 'package:online_shop/services/admin_bascket_delivered.dart';
import 'package:online_shop/services/admin_waiting_basket.dart';
import 'package:online_shop/services/arayesh_sevice.dart';
import 'package:online_shop/services/comments_service.dart';
import 'package:online_shop/services/kafsh_service.dart';
import 'package:online_shop/services/kif_service.dart';
import 'package:online_shop/services/lebas_service.dart';
import 'package:online_shop/services/user_pay_factor_service.dart';
import 'package:online_shop/services/user_profile.dart';

import 'package:online_shop/services/user_bascket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "yekan"),
      home: ROOT(),
      debugShowCheckedModeBanner: false,
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

class ROOT extends StatefulWidget {
  const ROOT({super.key});

  @override
  State<ROOT> createState() => _ROOTState();
}

class _ROOTState extends State<ROOT> {
  @override
  void initState() {
    ADMIN_BASCKET_DELIVERED_SERVICE.get_admin_bascket_delivered_list();

    COMMENTS_SERVICE.get_comment_list();

    ADMIN_WAITING_BASKET_SERVICE.get_admin_bascket_waiting_list();

    USER_SERVICE.get_user_list();

    KIF_SERVICE.get_kif_list();

    KAFSH_SERVICE.get_kafsh_list();

    ARAYESH_SERVICE.get_arayesh_list();

    LEBAS_SERVICE.get_lebas_list();

    USER_BASCKET_SERVICE.get_user_bascket_list();

    PAY_FACTOR_SERVICE.get_pay_factor_list();

    Timer(const Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HOME();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/welcome.jpg"))),
        ),
      )),
    );
  }
}
