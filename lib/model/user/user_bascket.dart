class USER_BASCKET_MODEL {
  int? id;
  String? user_bascket_name;
  String? user_bascket_address;
  String? user_bascket_code;
  String? user_bascket_email;
  String? user_bascket_price;
  String? user_fullname;
  String? user_phone;
  String? user_address;
  String? date;

  //*************************************** */
  USER_BASCKET_MODEL({
    required this.id,
    required this.date,
    required this.user_bascket_name,
    required this.user_bascket_address,
    required this.user_bascket_code,
    required this.user_bascket_email,
    required this.user_bascket_price,
    required this.user_fullname,
    required this.user_phone,
    required this.user_address,
  });
  //************************** json to dart =  تبدیل اطلاعات از جیسان به دارت برای اجرا در برنامه */
  USER_BASCKET_MODEL.fromJson(Map<String, dynamic> json) {
    user_bascket_name = json["user_bascket_name"];
    user_bascket_address = json["user_bascket_address"];
    user_bascket_code = json["user_bascket_code"];
    user_bascket_email = json["user_bascket_email"];
    id = json["id"];
    date = json["date"];
    user_bascket_price = json["user_bascket_price"];
    user_fullname = json["user_fullname"];
    user_phone = json["user_phone"];
    user_address = json["user_address"];
  }
  //****************************** json to dart = تبدیل اطلاعات دارت به جیسان برای ارسال به دیتابیس */
  Map<String, dynamic> toJson() {
    return {
      "user_bascket_name": user_bascket_name,
      "user_bascket_address": user_bascket_address,
      "id": id,
      "date": date,
      "user_bascket_code": user_bascket_code,
      "user_bascket_email": user_bascket_email,
      "user_bascket_price": user_bascket_price,
      "user_fullname": user_fullname,
      "user_phone": user_phone,
      "user_address": user_address,
    };
  }
}
