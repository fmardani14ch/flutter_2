import 'package:flutter/material.dart';

import 'package:online_shop/screen/admin_pannel/admin_screen.dart';
import 'package:online_shop/services/comments_service.dart';

class COMMENTS extends StatefulWidget {
  @override
  State<COMMENTS> createState() => _COMMENTSState();
}

class _COMMENTSState extends State<COMMENTS> {
  var comments = COMMENTS_SERVICE.comment_list.value;
  @override
  Widget build(BuildContext context) {
    print(comments.length);
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
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ValueListenableBuilder(
            valueListenable: COMMENTS_SERVICE.comment_list,
            builder: (context, value, index) {
              return ListView.builder(
                itemCount: COMMENTS_SERVICE.comment_list.value.length,
                itemBuilder: (context, index) {
                  var item = comments[index];
                  return Container(
                      height: 200,
                      child: Column(
                        children: [
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
                                              child: Text("در حال حذف نطر"),
                                            ),
                                          );
                                        });
                                    await COMMENTS_SERVICE
                                        .delete_comment(item.id!);
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return COMMENTS();
                                    }));
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                  ),
                                  color: Colors.redAccent,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                item.date.toString(),
                              )),
                              Expanded(
                                  child: Text(
                                item.user_email.toString(),
                                textAlign: TextAlign.right,
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            textDirection: TextDirection.ltr,
                            children: [
                              Text(
                                item.user_comment_text.toString(),
                                style: TextStyle(fontWeight: FontWeight.w700),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )
                        ],
                      ));
                },
              );
            }),
      )),
    );
  }
}
