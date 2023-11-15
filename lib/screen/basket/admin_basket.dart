import 'package:flutter/material.dart';
import 'package:online_shop/model/user/admin_bascket_delivered.dart';
import 'package:online_shop/screen/account/login/login.dart';
import 'package:online_shop/screen/admin_pannel/admin_screen.dart';
import 'package:online_shop/screen/basket/admin_bascket_delivered.dart';
import 'package:online_shop/screen/basket/user_bascket.dart';
import 'package:online_shop/services/admin_waiting_basket.dart';
import 'package:online_shop/services/user_bascket.dart';
import 'package:online_shop/services/admin_bascket_delivered.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

// ignore: camel_case_types
class ADMIN_BASCKET_WAITING extends StatefulWidget {
  const ADMIN_BASCKET_WAITING({super.key});

  @override
  State<ADMIN_BASCKET_WAITING> createState() => _ADMIN_BASCKET_WAITINGState();
}

var mail = mail_mode;

class _ADMIN_BASCKET_WAITINGState extends State<ADMIN_BASCKET_WAITING> {
  TextEditingController product_id_controler = TextEditingController();
  var basket = USER_BASCKET_SERVICE.user_bascket_list.value;
  @override
  Widget build(BuildContext context) {
    // ADMIN_WAITING_BASKET_SERVICE.delete_waiting_bascket(10);
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
                child: ValueListenableBuilder(
                    valueListenable:
                        ADMIN_WAITING_BASKET_SERVICE.admin_bascket_waiting_list,
                    builder: (context, value, index) {
                      return ListView.builder(
                          itemCount: ADMIN_WAITING_BASKET_SERVICE
                              .admin_bascket_waiting_list.value.length,
                          itemBuilder: (context, index) {
                            var item = basket[index];
                            return Container(
                              height: 800,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    height: 250,
                                    width: 250,
                                    child: Image.network(
                                      item.user_bascket_address.toString(),
                                    ),
                                  )),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item.user_bascket_name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              "نام محصول ",
                                              textDirection: TextDirection.rtl,
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              item.user_bascket_code.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textDirection: TextDirection.rtl,
                                            )),
                                            Expanded(
                                                child: Text(
                                              "کد محصول  ",
                                              textDirection: TextDirection.rtl,
                                            )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              item.user_bascket_email
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textDirection: TextDirection.rtl,
                                            )),
                                            Expanded(
                                                child: Text(
                                              " ایمیل کاربر  ",
                                              textDirection: TextDirection.rtl,
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              item.user_fullname.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textDirection: TextDirection.rtl,
                                            )),
                                            Expanded(
                                                child: Text(
                                              " نام کاربر کاربر  ",
                                              textDirection: TextDirection.rtl,
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              item.user_phone.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textDirection: TextDirection.rtl,
                                            )),
                                            Expanded(
                                                child: Text(
                                              " تلفن کاربر  ",
                                              textDirection: TextDirection.rtl,
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              item.user_address.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textDirection: TextDirection.rtl,
                                            )),
                                            Expanded(
                                                child: Text(
                                              " آدرس کاربر  ",
                                              textDirection: TextDirection.rtl,
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: TextButton(
                                              child: Text(
                                                "ارسال محصول",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              onPressed: () async {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                            height: 30,
                                                            width: 50,
                                                            color: Colors
                                                                .greenAccent,
                                                            child: Text(
                                                              "در حال ثبت در محصولات ارسال شده",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                      );
                                                    });
                                                var idc =
                                                    product_id_controler.text;
                                                await ADMIN_BASCKET_DELIVERED_SERVICE
                                                    .add_delivered_bascket(ADMIN_BASCKET_DELIVERED_MODEL(
                                                        date: Jalali.now()
                                                            .formatFullDate(),
                                                        id: int.tryParse(idc),
                                                        user_bascket_name: item
                                                            .user_bascket_name,
                                                        user_bascket_address: item
                                                            .user_bascket_address,
                                                        user_bascket_code: item
                                                            .user_bascket_code,
                                                        user_bascket_email: item
                                                            .user_bascket_email,
                                                        user_bascket_price: item
                                                            .user_bascket_price,
                                                        user_fullname:
                                                            item.user_fullname,
                                                        user_phone:
                                                            item.user_phone,
                                                        user_address:
                                                            item.user_address));
                                                await ADMIN_WAITING_BASKET_SERVICE
                                                    .delete_waiting_bascket(
                                                        item.id!);

                                                Navigator.pop(
                                                    context as BuildContext);

                                                Navigator.push(
                                                    context as BuildContext,
                                                    MaterialPageRoute(
                                                        builder: (Builder) {
                                                  return ADMIN_BASCKET_DELIVER();
                                                }));
                                              },
                                            )),
                                            Expanded(
                                                child: IconButton(
                                                    color: Colors.redAccent,
                                                    icon: Icon(
                                                        Icons.delete_forever),
                                                    onPressed: () async {
                                                      await USER_BASCKET_SERVICE
                                                          .delete_user_bascket(
                                                              item.id!);
                                                      Navigator.pop(context
                                                          as BuildContext);
                                                      Navigator.push(
                                                          context
                                                              as BuildContext,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (Builder) {
                                                        return USER_BASCKET();
                                                      }));
                                                    })),
                                            Expanded(
                                                child: Text(
                                              item.user_bascket_price
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w900),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                                  SizedBox(
                                    height: 5,
                                    child: Container(
                                      color: Colors.blueAccent,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }))));
  }
}
