import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shop/model/products/arayesh_model.dart';
import 'package:online_shop/model/products/kafsh_model.dart';
import 'package:online_shop/model/products/kif_model.dart';
import 'package:online_shop/model/products/lebas_model.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/arayeshi.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/kafsh.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/kif.dart';
import 'package:online_shop/screen/admin_pannel/remove_product/lebas.dart';
import 'package:online_shop/services/kif_service.dart';
import 'package:online_shop/services/kafsh_service.dart';
import 'package:online_shop/services/lebas_service.dart';
import 'package:online_shop/services/arayesh_sevice.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CREATE_PRODUCT extends StatefulWidget {
  @override
  State<CREATE_PRODUCT> createState() => _CREATE_PRODUCTState();
}

class _CREATE_PRODUCTState extends State<CREATE_PRODUCT> {
  ////////////////////////////////////////////////////////// text form control

  final formkey = GlobalKey<FormState>();
  TextEditingController product_name_controler = TextEditingController();
  TextEditingController product_address_controler = TextEditingController();
  TextEditingController product_code_controler = TextEditingController();
  TextEditingController product_info_controler = TextEditingController();
  TextEditingController product_price_controler = TextEditingController();
  TextEditingController product_type_controler = TextEditingController();
  TextEditingController product_id_controler = TextEditingController();
  ////////////////////////////////////////////////////////// text form control

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              LottieBuilder.asset("assets/lottie/create_post.json"),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.right,
                        controller: product_address_controler,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText:
                                "آدرس عکس به صورت " + "https://***/image.jpg"),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.right,
                        controller: product_name_controler,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: "نام محصول"),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.right,
                        controller: product_code_controler,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: "کد محصول"),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        keyboardType: TextInputType.multiline,
                        controller: product_info_controler,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: "درباره محصول"),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: product_price_controler,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: "قیمت محصول"),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.right,
                        controller: product_type_controler,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText:
                                "نوع محصول : کیف / کفش / پوشاک / آرایشی "),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (product_type_controler.text == "کیف") {
                              var idc = product_id_controler.text;
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text("در حال ثبت محصول"),
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent),
                                        ),
                                      );
                                    });
                                await KIF_SERVICE.add_kif_product(KIF_MODEL(
                                    id: int.tryParse(idc),
                                    price: product_price_controler.text,
                                    product_address:
                                        product_address_controler.text,
                                    product_cod: product_code_controler.text,
                                    product_info: product_info_controler.text,
                                    product_name: product_name_controler.text));
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return KIF_ADMIN();
                                }));
                              }
                            }
                            if (product_type_controler.text == "کفش") {
                              var idc = product_id_controler.text;
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text("در حال ثبت محصول"),
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent),
                                        ),
                                      );
                                    });
                                await KAFSH_SERVICE.add_kafsh_product(
                                    KAFSH_MODEL(
                                        id: int.tryParse(idc),
                                        price: product_price_controler.text,
                                        product_address:
                                            product_address_controler.text,
                                        product_cod:
                                            product_code_controler.text,
                                        product_info:
                                            product_info_controler.text,
                                        product_name:
                                            product_name_controler.text));
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return KAFSH_ADMIN();
                                }));
                              }
                            }
                            if (product_type_controler.text == "پوشاک") {
                              var idc = product_id_controler.text;
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text("در حال ثبت محصول"),
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent),
                                        ),
                                      );
                                    });
                                await LEBAS_SERVICE.add_lebas_product(
                                    LEBAS_MODEL(
                                        id: int.tryParse(idc),
                                        price: product_price_controler.text,
                                        product_address:
                                            product_address_controler.text,
                                        product_cod:
                                            product_code_controler.text,
                                        product_info:
                                            product_info_controler.text,
                                        product_name:
                                            product_name_controler.text));
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LEBAS_ADMIN();
                                }));
                              }
                            }
                            if (product_type_controler.text == "آرایشی") {
                              var idc = product_id_controler.text;
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text("در حال ثبت محصول"),
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent),
                                        ),
                                      );
                                    });
                                await ARAYESH_SERVICE.add_arayesh_product(
                                    ARAYESH_MODEL(
                                        id: int.tryParse(idc),
                                        price: product_price_controler.text,
                                        product_address:
                                            product_address_controler.text,
                                        product_cod:
                                            product_code_controler.text,
                                        product_info:
                                            product_info_controler.text,
                                        product_name:
                                            product_name_controler.text,
                                        date: Jalali.now().formatFullDate()));
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ARAYESH_ADMIN();
                                }));
                              }
                            }
                          },
                          child: Text("ثبت")),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
