import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop/services/user_profile.dart';

import 'admin_screen.dart';

class USERS_INFO extends StatefulWidget {
  @override
  State<USERS_INFO> createState() => _USERS_INFOState();
}

class _USERS_INFOState extends State<USERS_INFO> {
  @override
  Widget build(BuildContext context) {
    var userinfo = USER_SERVICE.user_list.value;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("بازگشت"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ADMIN_PANNEL();
            }));
          }),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: USER_SERVICE.user_list,
            builder: (context, value, index) {
              return ListView.builder(
                  itemCount: USER_SERVICE.user_list.value.length,
                  itemBuilder: (contex, index) {
                    var item = userinfo[index];
                    return Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 200,
                      child: Column(
                        children: [
                          Text(item.user_full_name.toString()),
                          Text(item.user_email.toString()),
                          Text(item.usder_password.toString()),
                          Text(item.user_phone.toString()),
                          Text(item.user_address.toString()),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                USER_SERVICE.delete_user_product(item.id!);

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return USERS_INFO();
                                }));
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.redAccent,
                              ))
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
