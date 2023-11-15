class COMMENT_MODEL {
  int? id;

  String? user_email;
  String? user_comment_text;
  String? date;

  //*************************************** */
  COMMENT_MODEL({
    required this.id,
    required this.date,
    required this.user_email,
    required this.user_comment_text,
  });
  //************************** json to dart =  تبدیل اطلاعات از جیسان به دارت برای اجرا در برنامه */
  COMMENT_MODEL.fromJson(Map<String, dynamic> json) {
    user_comment_text = json["user_comment_text"];
    date = json["date"];
    id = json["id"];
    user_email = json["user_email"];
  }
  //****************************** json to dart = تبدیل اطلاعات دارت به جیسان برای ارسال به دیتابیس */
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "user_comment_text": user_comment_text,
      "user_email": user_email,
    };
  }
}
