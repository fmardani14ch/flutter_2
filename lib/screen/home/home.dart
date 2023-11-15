// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_shop/model/comments/comments.dart';
import 'package:online_shop/model/home/home_slides.dart';
import 'package:online_shop/screen/account/user_pannel.dart';
import 'package:online_shop/screen/admin_pannel/admin_screen.dart';
import 'package:online_shop/services/comments_service.dart';
import 'package:online_shop/services/user_profile.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../account/login/login.dart';
import '../products/screen/arayeshi.dart';
import '../products/screen/kafsh.dart';
import '../products/screen/kif.dart';
import '../products/screen/lebas.dart';

////////////////////////////////////////////////////////////////////////

var isactive = false;
var _selectedIndex = 1;
var mail = mail_mode;

TextEditingController idcontroler = TextEditingController();
TextEditingController comment_msg = TextEditingController();

///////////////////////////////////////////////////////////////////////
class HOME extends StatefulWidget {
  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    // print(mail_mode);
    // print(mod_login);
    return Scaffold(
      ///////////////////////////////////////////////////// bottomn nvigatinbar
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        alignment: Alignment.centerLeft,
                        content: Container(
                          alignment: Alignment.centerLeft,
                          height: 250,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: IconButton(
                                    color: Colors.blue,
                                    iconSize: 50,
                                    onPressed: () {
                                      launchUrl(Uri.parse("www.telegram.org"),
                                          mode: LaunchMode.inAppWebView);
                                    },
                                    icon: Icon(Icons.telegram),
                                  )),
                                  Expanded(
                                      child: IconButton(
                                    iconSize: 50,
                                    onPressed: () {
                                      launchUrl(Uri.parse("www.instagram.com"),
                                          mode: LaunchMode.inAppWebView);
                                    },
                                    icon: Image.asset(
                                        "assets/images/instaicon.jpg"),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: IconButton(
                                    color: Colors.blue,
                                    iconSize: 50,
                                    onPressed: () {},
                                    icon: Icon(Icons.phone),
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text("021 - 12345678"),
                                      Text("021 - 12345679"),
                                      Text("021 - 12345680")
                                    ],
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: IconButton(
                                    color: Colors.blue,
                                    iconSize: 50,
                                    onPressed: () {},
                                    icon: Icon(Icons.location_city),
                                  )),
                                  Expanded(child: Text("... آدرس  ")),
                                ],
                              ),
                            ],
                          ),
                        ));
                  });
              setState(() {
                _selectedIndex = value;
              });
            }
            ////////////////////////////////////////////////////
            if (value == 1) {
              if (mod_login == "") {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: TextButton(
                            child: Text("لطفا ابتدا وارد حساب کاربری خود شوید"),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LOGIN();
                              }));
                            },
                          ),
                        ),
                      );
                    });
              }
              if (mod_login == "user") {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          alignment: Alignment.centerLeft,
                          content: Container(
                            height: 250,
                            width: 250,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  controller: comment_msg,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      hintText: "انتقادات و پیشنهادات",
                                      hintTextDirection: TextDirection.rtl),
                                )),
                                TextButton(
                                    onPressed: () async {
                                      var idc = idcontroler.text;
                                      await COMMENTS_SERVICE.add_comment(
                                          COMMENT_MODEL(
                                              date:
                                                  Jalali.now().formatFullDate(),
                                              id: int.tryParse(idc),
                                              user_email: mail_mode.toString(),
                                              user_comment_text:
                                                  comment_msg.text));
                                      Navigator.pop(context);
                                      comment_msg.clear();
                                    },
                                    child: Text(
                                      "ثبت",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          ));
                    });
              }
            }

            ///////////////////////////////////////////////////// isavtive admin mod
            if (value == 2) {
              if (mod_login == "admin") {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ADMIN_PANNEL();
                }));
              }
              if (mod_login == "user") {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return USER_PANNEL();
                }));
              }
              ////////////////////////////////////////////////////  not active mod
              if (mod_login == "") {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LOGIN();
                }));
              }
              setState(() {
                _selectedIndex = value;
              });
            }
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.redAccent,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.phone), label: "ارتباط با ما"),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment), label: " انتقادات و پیشنهادات"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "پروفایل"),
          ]),
      ////////////////////////////////////////////////////// bottomn nvigatinbar
      body: SafeArea(
          child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            Center(
                child: Image.asset(
              "assets/images/kala.png",
              height: 150,
              width: 200,
            )),
            ///////////////////////////////////////////////////  product slider
            SizedBox(
              height: 150,
              width: 370,
              child: CarouselSlider.builder(
                  itemCount: HOME_SLIDE.items.length,
                  itemBuilder: (BuildContext, index, realindx) {
                    return Container(
                      margin: const EdgeInsetsDirectional.symmetric(
                          horizontal: 2, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage(HOME_SLIDE.items[index].images))),
                    );
                  },
                  options: CarouselOptions(autoPlay: true)),
            ),

            ///////////////////////////////////////////////////  product slider

            ///////////////////////////////////////////////////  product
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 10, horizontal: 10),
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              "دسته بندی محصولات",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          "assets/images/lebas.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return LEBAS();
                                          }));
                                        },
                                      ),
                                    )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          "assets/images/kif.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return KIF();
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
                                        child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          "assets/images/kafsh.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return KAFSH();
                                          }));
                                        },
                                      ),
                                    )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          "assets/images/arayesh.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ARAYESH();
                                          }));
                                        },
                                      ),
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            ///////////////////////////////////////////////////  product
          ],
        ),
      )),
    );
  }
}
