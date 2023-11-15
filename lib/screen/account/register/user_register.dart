import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shop/model/user/user.dart';
import 'package:online_shop/screen/account/login/login.dart';
import 'package:online_shop/screen/home/home.dart';
import 'package:online_shop/services/user_profile.dart';

class USER_REGISTER extends StatefulWidget {
  @override
  State<USER_REGISTER> createState() => _USER_REGISTERState();
}

class _USER_REGISTERState extends State<USER_REGISTER> {
  //////////////////////////////////////////////////////////////  text controler
  TextEditingController user_full_name_controler = TextEditingController();
  TextEditingController user_email_controler = TextEditingController();
  TextEditingController user_password_controler = TextEditingController();
  TextEditingController user_phone_controler = TextEditingController();
  TextEditingController user_address_controler = TextEditingController();
  TextEditingController user_id_controler = TextEditingController();
  final formkey = GlobalKey<FormState>();

  //////////////////////////////////////////////////////////////  text controler
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HOME();
            }));
            ;
          }),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          LottieBuilder.asset("assets/lottie/register.json"),
                          TextFormField(
                            controller: user_full_name_controler,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: "نام و نام خانوادگی",
                                hintTextDirection: TextDirection.rtl),
                          ),
                          TextFormField(
                            controller: user_email_controler,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: "ایمیل",
                                hintTextDirection: TextDirection.rtl),
                          ),
                          TextFormField(
                            controller: user_password_controler,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: "رمز عبور",
                                hintTextDirection: TextDirection.rtl),
                          ),
                          TextFormField(
                            controller: user_phone_controler,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: "تلفن تماس",
                                hintTextDirection: TextDirection.rtl),
                          ),
                          TextFormField(
                            controller: user_address_controler,
                            textAlign: TextAlign.right,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                hintText: "آدرس + کد پستی",
                                hintTextDirection: TextDirection.rtl),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          IconButton(
                            onPressed: () async {
                              var idc = user_id_controler.text;
                              if (formkey.currentState!.validate()) {
                                await USER_SERVICE.add_user(USER_MODEL(
                                    id: int.tryParse(idc),
                                    usder_password:
                                        user_password_controler.text,
                                    user_address: user_address_controler.text,
                                    user_email: user_email_controler.text,
                                    user_full_name:
                                        user_full_name_controler.text,
                                    user_phone: user_phone_controler.text));
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LOGIN();
                                }));
                              }
                            },
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            iconSize: 50,
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ))
                ],
              ))),
    );
  }
}
