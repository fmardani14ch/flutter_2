import 'package:flutter/material.dart';

import '../../../services/kafsh_service.dart';

class KAFSH_ADMIN extends StatefulWidget {
  @override
  State<KAFSH_ADMIN> createState() => _KAFSH_ADMINState();
}

class _KAFSH_ADMINState extends State<KAFSH_ADMIN> {
  @override
  Widget build(BuildContext context) {
    var kafsh = KAFSH_SERVICE.kafsh_list.value;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: Text("بازگشت"),
            onPressed: () {
              Navigator.pop(context);
            }),

        /////////////////////////////////////////////////////////////////// body
        body: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: KAFSH_SERVICE.kafsh_list.value.length,
                itemBuilder: (context, index) {
                  KAFSH_SERVICE.get_kafsh_list();
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
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Container(
                                                child: Text("در حال حذف محصول"),
                                                decoration: BoxDecoration(
                                                    color: Colors.greenAccent),
                                              ),
                                            );
                                          });
                                      await KAFSH_SERVICE
                                          .delete_kafsh_product(item.id!);
                                      Navigator.pop(context);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return KAFSH_ADMIN();
                                      }));
                                    },
                                    icon: Icon(Icons.delete_forever),
                                    color: Colors.redAccent,
                                    iconSize: 40,
                                  )),
                                  Expanded(
                                      child: Text(
                                    item.price.toString(),
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
