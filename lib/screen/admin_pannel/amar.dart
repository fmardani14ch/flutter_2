import 'package:flutter/material.dart';
import 'package:online_shop/screen/admin_pannel/admin_screen.dart';
import 'package:online_shop/screen/admin_pannel/users_info.dart';
import 'package:online_shop/screen/basket/admin_bascket_delivered.dart';
import 'package:online_shop/screen/basket/admin_basket.dart';
import 'package:online_shop/services/admin_bascket_delivered.dart';
import 'package:online_shop/services/admin_waiting_basket.dart';
import 'package:online_shop/services/arayesh_sevice.dart';
import 'package:online_shop/services/kafsh_service.dart';
import 'package:online_shop/services/kif_service.dart';
import 'package:online_shop/services/lebas_service.dart';
import 'package:online_shop/services/user_profile.dart';

class AMAR extends StatefulWidget {
  const AMAR({super.key});

  @override
  State<AMAR> createState() => _AMARState();
}

class _AMARState extends State<AMAR> {
  @override
  Widget build(BuildContext context) {
    ADMIN_WAITING_BASKET_SERVICE.delete_waiting_bascket(21);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("بازگشت"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ADMIN_PANNEL();
            }));
          }),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                        ADMIN_WAITING_BASKET_SERVICE
                            .admin_bascket_waiting_list.value.length
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            color: Colors.redAccent))),
                Container(
                    child: TextButton(
                  child: Text(" در انتضار ارسال",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ADMIN_BASCKET_WAITING();
                    }));
                  },
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                        ADMIN_BASCKET_DELIVERED_SERVICE
                            .admin_bascket_delivered_list.value.length
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            color: Colors.redAccent))),
                Container(
                    child: TextButton(
                  child: Text("ارسال شده",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ADMIN_BASCKET_DELIVER();
                    }));
                  },
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(USER_SERVICE.user_list.value.length.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            color: Colors.redAccent))),
                Container(
                    child: TextButton(
                  child: Text(" کل کاربران",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return USERS_INFO();
                    }));
                  },
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                        (KIF_SERVICE.kif_list.value.length +
                                KAFSH_SERVICE.kafsh_list.value.length +
                                LEBAS_SERVICE.lebas_list.value.length +
                                ARAYESH_SERVICE.arayesh_list.value.length)
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            color: Colors.redAccent))),
                Container(
                    child: Text("کل محصولات",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
