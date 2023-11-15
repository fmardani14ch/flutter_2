import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shop/screen/account/register/user_register.dart';
import 'package:online_shop/screen/account/user_pannel.dart';

import 'package:online_shop/screen/admin_pannel/admin_screen.dart';

import 'package:online_shop/screen/home/home.dart';
import 'package:online_shop/services/user_profile.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

bool pass_visible = true;
var log_mod = Lottie.asset("assets/lottie/normal.json");

var mail_mode = '';
var mod_login = '';
var activate = false;
var fullname = '';
var upassword = '';
var uphone = '';
var uaddress = '';
var uid = '';

class _LOGINState extends State<LOGIN> {
  /////////////////////////////////////////////////////////// text controler
  TextEditingController usernamecontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  TextEditingController passwordcontroler = TextEditingController();
  ////////////////////////////////////////////////////////// text controler
  ///////////////////////////////////////////////////////////// mode

/////////////////////////////////////////////////////////////// mode
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          setState(() {
            pass_visible = true;
            log_mod = log_mod = Lottie.asset("assets/lottie/normal.json");
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HOME();
          }));
        },
        child: const Text("بازگشت"),
      ),
      //************************************** */
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //************************************************ */

              GestureDetector(child: log_mod),
              const SizedBox(
                height: 30,
              ),
              //************************************************ */
              //************************************** */
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        textDirection: TextDirection.rtl,
                        children: [
                          //************************************** */
                          TextFormField(
                            onTap: () {
                              setState(() {
                                log_mod = Lottie.asset(
                                    "assets/lottie/email_type.json");
                              });
                            },
                            controller: usernamecontroler,
                            validator: (value) {
                              // ignore: unused_local_variable
                              var username = 'admin';
                              if (value!.isEmpty || value.isEmpty) {
                                return "ایمیل نا معتبر است";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                icon: const Icon(
                                  Icons.mail,
                                ),
                                hintText: "ایمیل "),
                            textAlign: TextAlign.right,
                          ),
                          //************************************************ */
                          const SizedBox(
                            height: 10,
                          ),
                          //************************************************ */
                          TextFormField(
                              obscureText: pass_visible,
                              onTap: () {
                                setState(() {
                                  log_mod = Lottie.asset(
                                      "assets/lottie/password_type.json");
                                });
                              },
                              controller: passwordcontroler,
                              validator: (value) {
                                // ignore: unused_local_variable
                                var password = 'test';
                                if (value!.isEmpty || value.length < 1) {
                                  return "رمز ورود نا معتبر است";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        if (pass_visible == true) {
                                          setState(() {
                                            pass_visible = false;
                                            log_mod = Lottie.asset(
                                                "assets/lottie/password_type.json");
                                          });
                                        } else {
                                          setState(() {
                                            pass_visible = false;
                                            log_mod = Lottie.asset(
                                                "assets/lottie/show_password.json");
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.visibility)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  icon: const Icon(
                                    Icons.key,
                                  ),
                                  hintText: "رمز عبور"),
                              textAlign: TextAlign.right),
                          //************************************************ */
                          const SizedBox(
                            height: 20,
                          ),
                          //************************************************ */
                          const SizedBox(height: 30),
                          //************************************************ */
                          ElevatedButton(
                              onPressed: () {
                                var user = USER_SERVICE.user_list.value;
                                user.forEach((email) {
                                  if (email.user_email ==
                                      usernamecontroler.text) {
                                    print(email.user_email);
                                    print(email.usder_password);

                                    if (formkey.currentState!.validate() &&
                                        usernamecontroler.text ==
                                            email.user_email &&
                                        email.usder_password ==
                                            passwordcontroler.text) {
                                      setState(() {
                                        mod_login = "user";
                                        activate = true;
                                        mail_mode = email.user_email.toString();
                                        uaddress =
                                            email.user_address.toString();
                                        upassword =
                                            email.usder_password.toString();
                                        uphone = email.user_phone.toString();
                                        fullname =
                                            email.user_full_name.toString();
                                        uid = email.id.toString();

                                        print(mail_mode);
                                        print(uid);
                                      });

                                      Navigator.push(context,
                                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                          MaterialPageRoute(builder: (Builder) {
                                        return USER_PANNEL();
                                      }));
                                    }
                                  }
                                });

                                if (formkey.currentState!.validate() &&
                                    usernamecontroler.text == "admin" &&
                                    passwordcontroler.text == "test") {
                                  setState(() {
                                    mod_login = "admin";
                                    activate = true;
                                  });

                                  // ignore: use_build_context_synchronously
                                  Navigator.push(context,
                                      // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                                      MaterialPageRoute(builder: (Builder) {
                                    return ADMIN_PANNEL();
                                  }));
                                }
                              },
                              child: Text(
                                "ورود",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return USER_REGISTER();
                                }));
                              },
                              child: Text(
                                "حساب کاربری ندارم",
                                style: TextStyle(color: Colors.redAccent),
                              ))
                          //******************************************** */
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
