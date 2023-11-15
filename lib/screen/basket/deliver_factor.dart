import 'package:flutter/material.dart';
import 'package:online_shop/screen/account/login/login.dart';
import 'package:online_shop/screen/account/user_pannel.dart';
import 'package:online_shop/services/user_pay_factor_service.dart';

class SHOW_PAY_FACTOR extends StatefulWidget {
  @override
  State<SHOW_PAY_FACTOR> createState() => _SHOW_PAY_FACTORState();
}

var factors = PAY_FACTOR_SERVICE.pay_factor_list.value
    .where((element) => element.user_email == mail_mode)
    .toList();

class _SHOW_PAY_FACTORState extends State<SHOW_PAY_FACTOR> {
  var factors = PAY_FACTOR_SERVICE.pay_factor_list.value
      .where((element) => element.user_email == mail_mode)
      .toList();
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
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ValueListenableBuilder(
            valueListenable: PAY_FACTOR_SERVICE.pay_factor_list,
            builder: (context, value, index) {
              if (factors.length < 1) {
                return Center(
                    child: Container(
                        child: Image.asset("assets/images/empty.jpg")));
              } else {
                return ListView.builder(
                    itemCount: factors.length,
                    itemBuilder: (context, index) {
                      var item = factors[index];
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  item.date.toString(),
                                  textDirection: TextDirection.rtl,
                                )),
                                Expanded(
                                    child: Text(
                                  item.user_email.toString(),
                                  textDirection: TextDirection.rtl,
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
                                  item.user_address.toString(),
                                  textDirection: TextDirection.rtl,
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
                                  item.user_phone.toString(),
                                  textDirection: TextDirection.rtl,
                                )),
                                Expanded(
                                    child: Text(
                                  "تلفن تماس",
                                  textDirection: TextDirection.rtl,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "تومان",
                                      textDirection: TextDirection.rtl,
                                    )),
                                    Expanded(
                                        child: Text(
                                      item.user_payed.toString(),
                                      style: TextStyle(fontSize: 20),
                                      textDirection: TextDirection.rtl,
                                    ))
                                  ],
                                )),
                                Expanded(
                                    child: Text(
                                  "پرداختی",
                                  textDirection: TextDirection.rtl,
                                )),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
      )),
    );
  }
}
