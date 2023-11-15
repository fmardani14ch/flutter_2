class USER_MODEL {
  int? id;
  String? user_full_name;
  String? user_address;
  String? usder_password;
  String? user_email;
  String? user_phone;

  //*************************************** */
  USER_MODEL({
    required this.id,
    required this.user_full_name,
    required this.user_address,
    required this.user_email,
    required this.usder_password,
    required this.user_phone,
  });
  //************************** json to dart =  تبدیل اطلاعات از جیسان به دارت برای اجرا در برنامه */
  USER_MODEL.fromJson(Map<String, dynamic> json) {
    user_full_name = json["user_full_name"];
    user_address = json["user_address"];
    user_email = json["user_email"];
    usder_password = json["usder_password"];
    id = json["id"];
    user_phone = json["user_phone"];
  }
  //****************************** json to dart = تبدیل اطلاعات دارت به جیسان برای ارسال به دیتابیس */
  Map<String, dynamic> toJson() {
    return {
      "user_full_name": user_full_name,
      "user_address": user_address,
      "id": id,
      "user_email": user_email,
      "usder_password": usder_password,
      "user_phone": user_phone,
    };
  }
}
