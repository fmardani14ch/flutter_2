import 'package:flutter/material.dart';
import 'package:online_shop/services/arayesh_sevice.dart';

class ARAYESH_ADMIN extends StatefulWidget {
  @override
  State<ARAYESH_ADMIN> createState() => _ARAYESH_ADMINState();
}

class _ARAYESH_ADMINState extends State<ARAYESH_ADMIN> {
  @override
  void initState() {
    ARAYESH_SERVICE.get_arayesh_list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var arayesh = ARAYESH_SERVICE.arayesh_list.value;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: Text("بازگشت"),
            onPressed: () {
              Navigator.pop(context);
            }),

        ///////////////////////////////////////////////////////////// body
        body: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: ARAYESH_SERVICE.arayesh_list.value.length,
                itemBuilder: (context, index) {
                  ARAYESH_SERVICE.get_arayesh_list();
                  var item = arayesh[index];
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
                                      await ARAYESH_SERVICE
                                          .delete_arayesh_product(item.id!);
                                      Navigator.pop(context);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ARAYESH_ADMIN();
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
    ///////////////////////////////////////////////////////////////////// body
  }
}
