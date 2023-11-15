import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop/model/factor/pay_factor_model.dart';
import 'package:online_shop/model/user/admin_waiting_basket.dart';
import 'package:online_shop/screen/account/login/login.dart';
import 'package:online_shop/screen/account/user_pannel.dart';
import 'package:online_shop/screen/basket/admin_basket.dart';
import 'package:online_shop/screen/basket/deliver_factor.dart';
import 'package:online_shop/screen/basket/empty_bascket.dart';
import 'package:online_shop/services/admin_bascket_delivered.dart';
import 'package:online_shop/services/admin_waiting_basket.dart';
import 'package:online_shop/services/user_bascket.dart';
import 'package:online_shop/services/user_pay_factor_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../home/home.dart';

class USER_BASCKET extends StatefulWidget {
  @override
  State<USER_BASCKET> createState() => _USER_BASCKETState();
}

TextEditingController user_id_controler = TextEditingController();
var mail = mail_mode;
List t_price = [];

class _USER_BASCKETState extends State<USER_BASCKET> {
  var backets = USER_BASCKET_SERVICE.user_bascket_list.value
      .where((element) => element.user_bascket_email == mail_mode)
      .toList();

  @override
  Widget build(BuildContext context) {
    setState(() {
      t_price = [];
    });

    backets.forEach(
      (element) {
        t_price.add(int.parse(element.user_bascket_price!));
      },
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("بازگشت"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HOME();
            }));
          }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Spacer(),
          TextButton(
            onPressed: () {
              print(backets);
              var total_price = t_price.reduce((a, b) => a + b);
              double price = ((total_price - (total_price * (10 / 100))));
              var total = price.toInt();
              double takhfif = (total_price * 0.1);
              var takh = takhfif.toInt();

              print(total);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "تومان  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                  child: Text(
                                total_price.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.redAccent),
                                textAlign: TextAlign.left,
                              )),
                              Expanded(
                                  child: Text(
                                "جمع کل فاکتور",
                                textAlign: TextAlign.right,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "تومان  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                  child: Text(
                                takh.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.green),
                                textAlign: TextAlign.left,
                              )),
                              Expanded(
                                  child: Text(
                                "تخفیف 10 درصدی",
                                textAlign: TextAlign.right,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "تومان  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                  child: Text(
                                total.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: Colors.redAccent),
                                textAlign: TextAlign.left,
                              )),
                              Expanded(
                                  child: Text(
                                "قابل پرداخت",
                                textAlign: TextAlign.right,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                ///////////////////////////// SET TOUSER BASCKET
                                var idc = user_id_controler.text;
                                backets.forEach((element) async {
                                  if (element.user_bascket_email == mail_mode) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Container(
                                              child: Text(
                                                  "در حال ثبت محصول در سبد خرید"),
                                              decoration: BoxDecoration(
                                                  color: Colors.greenAccent),
                                            ),
                                          );
                                        });
                                    await ADMIN_WAITING_BASKET_SERVICE
                                        .add_waiting_bascket(
                                            ADMIN_WAITING_BASKET_MODEL(
                                                date: Jalali
                                                        .now()
                                                    .formatFullDate(),
                                                id: int.tryParse(idc),
                                                user_bascket_name: element
                                                    .user_bascket_name
                                                    .toString(),
                                                user_bascket_address: element
                                                    .user_bascket_address
                                                    .toString(),
                                                user_bascket_code: element
                                                    .user_bascket_code
                                                    .toString(),
                                                user_bascket_email:
                                                    mail_mode.toString(),
                                                user_bascket_price: element
                                                    .user_bascket_price
                                                    .toString(),
                                                user_fullname:
                                                    fullname.toString(),
                                                user_phone: uphone.toString(),
                                                user_address:
                                                    uaddress.toString()));

                                    await USER_BASCKET_SERVICE
                                        .delete_user_bascket(element.id!);

                                    await PAY_FACTOR_SERVICE.add_pay_factor(
                                        PAY_FACTOR_MODEL(
                                            id: int.tryParse(idc),
                                            date: Jalali.now().formatFullDate(),
                                            user_email: mail_mode.toString(),
                                            user_address: uaddress.toString(),
                                            user_phone: uphone.toString(),
                                            user_payed: total.toString()));
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SHOW_PAY_FACTOR();
                                    }));
                                  }
                                });

                                ////////////////////////////
                              },
                              child: Text(
                                "پرداخت نهایی",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ))
                        ],
                      ),
                    ));
                  });
            },
            child: Text(
              " ** نمایش فاکتور **",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
          ),
          Spacer()
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: USER_BASCKET_SERVICE.user_bascket_list,
            builder: (context, index, value) {
              if (backets.length < 1) {
                return Center(
                    child: Container(
                        child: Image.asset("assets/images/empty.jpg")));
              } else {
                return ListView.builder(
                    itemCount: backets.length,
                    itemBuilder: (context, index) {
                      var item = backets[index];
                      return Container(
                          height: 400,
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
                                            item.user_bascket_name.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                            textDirection: TextDirection.rtl,
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
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: IconButton(
                                                icon:
                                                    Icon(Icons.delete_forever),
                                                onPressed: () async {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Container(
                                                            child: Text(
                                                                "در حال حذف محصول"),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .greenAccent),
                                                          ),
                                                        );
                                                      });
                                                  await USER_BASCKET_SERVICE
                                                      .delete_user_bascket(
                                                          item.id!);
                                                  Navigator.pop(context);
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (Builder) {
                                                    return USER_BASCKET();
                                                  }));
                                                })),
                                        Expanded(
                                            child: Text(
                                          item.user_bascket_price.toString(),
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
                          ));
                    });
              }
            }),
      ),
    );
  }
}
