import 'package:flutter/material.dart';
import 'package:online_shop/screen/account/user_pannel.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../model/user/user_bascket.dart';
import '../../../services/user_bascket.dart';
import '../../account/login/login.dart';

import '../../admin_pannel/admin_screen.dart';
import '../../basket/user_bascket.dart';
import '../../home/home.dart';
import '../../../services/kafsh_service.dart';

class KAFSH extends StatefulWidget {
  @override
  State<KAFSH> createState() => _KAFSHState();
}

TextEditingController user_id_controler = TextEditingController();
var mail = mail_mode;

class _KAFSHState extends State<KAFSH> {
  @override
  void initState() {
    KAFSH_SERVICE.get_kafsh_list();
    USER_BASCKET_SERVICE.get_user_bascket_list();
    super.initState();
  }

  var _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    var kafsh = KAFSH_SERVICE.kafsh_list.value;
    return Scaffold(
        /////////////////////////////////////////////////////////// navigaton bar
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              if (value == 0) {
                setState(() {
                  _selectedIndex = value;
                });

                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HOME();
                }));
              }
              if (value == 1) {
                setState(() {
                  _selectedIndex = value;
                });
                if (mod_login == "admin") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ADMIN_PANNEL();
                  }));
                }
                if (mod_login == "user") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return USER_PANNEL();
                  }));
                }
                if (mod_login == "") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LOGIN();
                  }));
                }
              }
            },
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.redAccent,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined),
                  label: "  محصولات"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined), label: "پروفایل"),
            ]),
        //////////////////////////////////////////////////////// navigaton bar
        /////////////////////////////////////////////////////////////////// body
        body: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: KAFSH_SERVICE.kafsh_list.value.length,
                itemBuilder: (context, index) {
                  var item = kafsh[index];
                  return Container(
                    height: 500,
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
                            item.product_address.toString(),
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
                                      item.product_name.toString(),
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
                                    item.product_cod.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                      child: Text(
                                    item.product_info.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    textDirection: TextDirection.rtl,
                                  )),
                                  Expanded(
                                      child: Text(
                                    " توضیحات ",
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
                                    onPressed: () async {
                                      if (activate == true) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Container(
                                                    height: 30,
                                                    width: 50,
                                                    color: Colors.grey,
                                                    child: Text(
                                                      "در حال افزودن به سبد خرید",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )),
                                              );
                                            });
                                        ///////////////////////////// SET TOUSER BASCKET
                                        var idc = user_id_controler.text;
                                        await USER_BASCKET_SERVICE
                                            .add_user_bascket(
                                                USER_BASCKET_MODEL(
                                          id: int.tryParse(idc),
                                          user_bascket_name:
                                              item.product_name.toString(),
                                          user_bascket_address:
                                              item.product_address.toString(),
                                          user_bascket_code:
                                              item.product_cod.toString(),
                                          user_bascket_email:
                                              mail_mode.toString(),
                                          user_bascket_price:
                                              item.price.toString(),
                                          user_fullname: fullname.toString(),
                                          user_phone: uphone.toString(),
                                          user_address: uaddress.toString(),
                                          date: Jalali.now().formatFullDate(),
                                        ));
                                        Navigator.pop(context);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return USER_BASCKET();
                                        }));
                                        ////////////////////////////  set to userbascket
                                      }
                                      if (activate == false) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  content: Container(
                                                height: 100,
                                                width: 100,
                                                color: Colors.redAccent,
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return LOGIN();
                                                      }));
                                                    },
                                                    child: Text(
                                                      "لطفا وارد حساب کابری خود شوید",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )),
                                              ));
                                            });
                                      }
                                    },
                                    icon: Icon(Icons.add_circle_outline),
                                    color: Colors.greenAccent,
                                    iconSize: 40,
                                  )),
                                  Expanded(
                                      child: Text(
                                    item.price!.toString(),
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
                })));
    ////////////////////////////////////////////////////////////////// body
  }
}
