class PAY_FACTOR_MODEL {
  int? id;

  String? user_email;
  String? user_phone;
  String? user_address;
  String? user_payed;
  String? date;

  //*************************************** */
  PAY_FACTOR_MODEL({
    required this.id,
    required this.date,
    required this.user_email,
    required this.user_address,
    required this.user_phone,
    required this.user_payed,
  });
  //************************** json to dart =  تبدیل اطلاعات از جیسان به دارت برای اجرا در برنامه */
  PAY_FACTOR_MODEL.fromJson(Map<String, dynamic> json) {
    user_address = json["user_address"];
    date = json["date"];
    id = json["id"];
    user_email = json["user_email"];
    user_phone = json["user_phone"];
    user_payed = json["user_payed"];
  }
  //****************************** json to dart = تبدیل اطلاعات دارت به جیسان برای ارسال به دیتابیس */
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "user_address": user_address,
      "user_email": user_email,
      "user_payed": user_payed,
      "user_phone": user_phone,
    };
  }
}
