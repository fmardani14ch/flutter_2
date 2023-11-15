import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/screen/account/login/login.dart';
import 'package:online_shop/screen/basket/deliver_factor.dart';
import 'package:online_shop/screen/basket/user_bascket.dart';
import 'package:online_shop/screen/home/home.dart';
import 'package:online_shop/services/user_profile.dart';

class USER_PANNEL extends StatefulWidget {
  @override
  State<USER_PANNEL> createState() => _USER_PANNELState();
}

var mail = mail_mode;
int id = int.parse(uid);

class _USER_PANNELState extends State<USER_PANNEL> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////////////////////////////////////////////////// bottomn nvigatinbar
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) async {
            if (value == 0) {
              setState(() {
                _selectedIndex = value;
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return USER_BASCKET();
              }));
            }
            if (value == 1) {
              print(id);

              setState(() {
                _selectedIndex = value;
                mod_login = '';
                uaddress = "";
                upassword = '';
                uphone = '';
                uid = '';
                mail = '';
              });
              await USER_SERVICE.delete_user_product(id);
              Navigator.pop(context);
            }
            if (value == 2) {
              setState(() {
                _selectedIndex = value;
                mod_login = '';
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LOGIN();
              }));
            }
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.delivery_dining), label: "سبد خرید"),
            BottomNavigationBarItem(
                icon: Icon(Icons.delete), label: "حدف کاربر "),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app_outlined), label: "خروج"),
          ]),
      ////////////////////////////////////////////////////// bottomn nvigatinbar);
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("بازگشت"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HOME();
            }));
          }),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/prof.png",
                height: 150,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        fullname,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        mail_mode,
                        style: TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        "**  " + upassword + "  **",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.red),
                      ),
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        uphone,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        uaddress,
                        style: TextStyle(fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      width: 300,
                      height: 100,
                    ),
                    Container(
                      height: 50,
                      child: TextButton(
                        child: Text(
                          "پرداخت های من",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SHOW_PAY_FACTOR();
                          }));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
