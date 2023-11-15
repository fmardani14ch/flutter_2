import 'package:flutter/material.dart';
import 'package:online_shop/screen/admin_pannel/amar.dart';
import 'package:online_shop/screen/admin_pannel/comments.dart';
import 'package:online_shop/screen/admin_pannel/create_product/create_product.dart';

import 'package:online_shop/screen/admin_pannel/remove_product/arayeshi.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/kafsh.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/kif.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/lebas.dart';
import 'package:online_shop/screen/basket/admin_bascket_delivered.dart';
import 'package:online_shop/screen/basket/admin_basket.dart';
import 'package:online_shop/screen/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

import '../account/login/login.dart';

class ADMIN_PANNEL extends StatefulWidget {
  @override
  State<ADMIN_PANNEL> createState() => _ADMIN_PANNELState();
}

class _ADMIN_PANNELState extends State<ADMIN_PANNEL> {
  var _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////////////////////////////////////////////////// bottomn nvigatinbar
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              setState(() {
                _selectedIndex = value;
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ADMIN_BASCKET_WAITING();
              }));
            }
            if (value == 1) {
              setState(() {
                _selectedIndex = value;
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HOME();
              }));
            }
            if (value == 2) {
              setState(() {
                _selectedIndex = value;
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return COMMENTS();
              }));
            }
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.redAccent,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.delivery_dining), label: " سفارشات"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: " صفحه اصلی"),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_outlined), label: "نظرات"),
          ]),
      ////////////////////////////////////////////////////// bottomn nvigatinbar);
      ///////////////////////////////////////////////////////  body
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("خروج"),
          onPressed: () {
            setState(() {
              mod_login = '';
            });
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LOGIN();
            }));
          }),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 10, horizontal: 10),
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "حدف محصول",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 150,
                                  width: 200,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "assets/images/lebas.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LEBAS_ADMIN();
                                      }));
                                    },
                                  ),
                                )),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 150,
                                  width: 200,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "assets/images/kif.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return KIF_ADMIN();
                                      }));
                                    },
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 150,
                                  width: 200,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "assets/images/kafsh.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return KAFSH_ADMIN();
                                      }));
                                    },
                                  ),
                                )),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 150,
                                  width: 200,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "assets/images/arayesh.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ARAYESH_ADMIN();
                                      }));
                                    },
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5,
                        color: Colors.redAccent,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text("آمار کلی",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))),
                              Expanded(
                                child: Text(
                                  "افزودن محصول",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AMAR();
                                  }));
                                },
                                icon: Icon(Icons.bar_chart),
                                color: Colors.redAccent,
                                iconSize: 40,
                              )),
                              Expanded(
                                  child: IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CREATE_PRODUCT();
                                  }));
                                },
                                icon: Icon(Icons.add_a_photo_outlined),
                                color: Colors.green,
                                iconSize: 40,
                              )),
                            ],
                          ),
                          Center(
                            child: GestureDetector(
                              child: TextButton(
                                  child: Text("آپلود کننده عکس",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                  onPressed: () {
                                    launchUrl(
                                        Uri.parse("https://uploadkon.ir/"),
                                        mode: LaunchMode.inAppWebView);
                                  }),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              child: TextButton(
                                  child: Text(" کالاهای ارسال شده",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ADMIN_BASCKET_DELIVER();
                                    }));
                                  }),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
      /////////////////////////////////////////////////////// body
    );
  }
}
