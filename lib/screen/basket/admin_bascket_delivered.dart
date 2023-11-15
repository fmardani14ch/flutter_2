import 'package:flutter/material.dart';
import 'package:online_shop/screen/account/login/login.dart';
import 'package:online_shop/screen/admin_pannel/admin_screen.dart';
import 'package:online_shop/services/admin_bascket_delivered.dart';

class ADMIN_BASCKET_DELIVER extends StatefulWidget {
  @override
  State<ADMIN_BASCKET_DELIVER> createState() => _ADMIN_BASCKET_DELIVERState();
}

var mail = mail_mode;

class _ADMIN_BASCKET_DELIVERState extends State<ADMIN_BASCKET_DELIVER> {
  var basket =
      ADMIN_BASCKET_DELIVERED_SERVICE.admin_bascket_delivered_list.value;
  @override
  Widget build(BuildContext context) {
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
                    valueListenable: ADMIN_BASCKET_DELIVERED_SERVICE
                        .admin_bascket_delivered_list,
                    builder: (context, value, index) {
                      return ListView.builder(
                          itemCount: ADMIN_BASCKET_DELIVERED_SERVICE
                              .admin_bascket_delivered_list.value.length,
                          itemBuilder: (context, index) {
                            var item = basket[index];
                            return Container(
                              height: 700,
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
                                                child: IconButton(
                                                    color: Colors.redAccent,
                                                    icon: Icon(
                                                        Icons.delete_forever),
                                                    onPressed: () async {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              content:
                                                                  Container(
                                                                child: Text(
                                                                    "در حال حذف محصول"),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .greenAccent),
                                                              ),
                                                            );
                                                          });
                                                      await ADMIN_BASCKET_DELIVERED_SERVICE
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
                                                        return ADMIN_BASCKET_DELIVER();
                                                      }));
                                                    })),
                                            Expanded(
                                                child: Text(
                                              "ارسال  شد",
                                              style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            )),
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
