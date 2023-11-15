import 'dart:async';

import 'package:flutter/material.dart';
import '../data_server/http_client.dart';
import '../model/user/admin_bascket_delivered.dart';

//##############################################################################

// get()   / json_to_dart برای دریافت اطلاعات از سرور از متد گِت و تبدیل دارت به جیسان استفاده میشود
// post()  / post_to_json برای ارسال اطلاعات از سرور از متد پست و تبدیل جیسان به دارت استفاده میشود
// put()  / post_to_json برای ویرایش اطلاعات از سرور از متد پست و تبدیل جیسان به دارت استفاده میشود

//##############################################################################
//##############################################################################

class ADMIN_BASCKET_DELIVERED_SERVICE {
  //******************** ایجاد متغیری خالی برای بروز رسانی لحظه ای اطلاعات */
  static ValueNotifier<List<ADMIN_BASCKET_DELIVERED_MODEL>>
      admin_bascket_delivered_list = ValueNotifier([]);
  //******************************************** گرفتن اطلاعات تمام دیتا بیس */
  static Future<List<ADMIN_BASCKET_DELIVERED_MODEL>>
      get_admin_bascket_delivered_list() async {
    Timer.periodic(Duration(seconds: 1), (timer) {});
    //************************json متغیری برای دریافت اطلاعات به صورت جیسان */
    var response = await httpClient.get("bbqsZz/admin_deliver_basket");
    // ایجاد شرط اگر دریافت اطلاعات صحیح بود یا از طرف سرور پاسخی ارسال شد*/
    if (response.statusCode == 200 || response.statusCode == 201) {
      //************** لیست مقادیر دریافتی پس از خوانده شدن مجدد خالی شود */
      admin_bascket_delivered_list.value = [];
      //***************** برای تمام یا تک تک مقادیر ارسال شده از سمت سرور */
      for (var element in response.data) {
        //********* تمام مقادیر لیست شده را به صورت جیسان در کلاس دخیره کن */
        admin_bascket_delivered_list.value
            .add(ADMIN_BASCKET_DELIVERED_MODEL.fromJson(element));
      }
      //************ بازگردانی یا خواندن مقادیر درون لیست مربوط به خط اول */
      return admin_bascket_delivered_list.value;
    }
    //**** در غیر این صورت اگر سرور پاسخ نداد یا مشکل داشت ارور نشان بده */
    throw Exception("error");
  }

//##############################################################################
//##############################################################################

//************************* post() ثبت یا ارسال اطلاعات  در دیتابیس بامتد پست */
//***  مقادیری که قرار است در دیتابیس دخیره شود پس از فراخوانی نام کلاس و
//*** یک متغیر که بهتر است هم نام کلاس ولی با نام کوچکتر باشد ارسال میشود */
  static Future<ADMIN_BASCKET_DELIVERED_MODEL> add_delivered_bascket(
      ADMIN_BASCKET_DELIVERED_MODEL admin_bascket_delivered_list) async {
    //سپس با یک متغیر، یک درخواست  که میخواهیم اطاعات رااز نوع متد پست و
    //***************************  تبدیل دارت به جیسان به سرور ارسال میکنم */
    var response = await httpClient.post("bbqsZz/admin_deliver_basket",
        data: admin_bascket_delivered_list.toJson());
    //*********** اگر شرط بر قرار بود و سرور به ما پاسخ صحیح یا قبولی داد */
    if (response.statusCode == 200 || response.statusCode == 201) {
      //******************************************* اطلاعات را ارسال می کنیم */
      await get_admin_bascket_delivered_list();
      return ADMIN_BASCKET_DELIVERED_MODEL.fromJson(response.data);
    }
    //**** در غیر این صورت اگر سرور پاسخ نداد یا مشکل داشت ارور نشان بده */
    throw Exception("error");
  }

//##############################################################################
//##############################################################################

  static Future<ADMIN_BASCKET_DELIVERED_MODEL> delete_user_bascket(
      int id) async {
    // سپس با یک متغیر، یک درخواست  که میخواهیم اطاعات رااز نوع مِتد دِلیت و
    //*********** متغیر آیدی اطلاعاتی که برای حذف انتخاب کردیم ارسال میکنیم*/
    var response = await httpClient.delete(
      "bbqsZz/admin_deliver_basket/$id",
    );
    //*********** اگر شرط بر قرار بود و سرور به ما پاسخ صحیح یا قبولی داد */
    if (response.statusCode == 200 || response.statusCode == 201) {
      //******************************* اطلاعات حذفی را ارسال می کنیم */
      await get_admin_bascket_delivered_list();
      return ADMIN_BASCKET_DELIVERED_MODEL.fromJson(response.data);
    }
    //**** در غیر این صورت اگر سرور پاسخ نداد یا مشکل داشت ارور نشان بده */
    throw Exception("error");
  }

//##############################################################################
//##############################################################################
}