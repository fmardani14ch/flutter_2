class KAFSH_MODEL {
  int? id;
  String? product_name;
  String? product_address;
  String? product_cod;
  String? product_info;
  String? price;

  //*************************************** */
  KAFSH_MODEL({
    required this.id,
    required this.product_name,
    required this.product_info,
    required this.product_address,
    required this.price,
    required this.product_cod,
  });
  //************************** json to dart =  تبدیل اطلاعات از جیسان به دارت برای اجرا در برنامه */
  KAFSH_MODEL.fromJson(Map<String, dynamic> json) {
    product_name = json["product_name"];
    product_info = json["product_info"];
    product_address = json["product_address"];
    product_cod = json["product_cod"];
    id = json["id"];
    price = json["price"];
  }
  //****************************** json to dart = تبدیل اطلاعات دارت به جیسان برای ارسال به دیتابیس */
  Map<String, dynamic> toJson() {
    return {
      "product_name": product_name,
      "id": id,
      "product_info": product_info,
      "product_address": product_address,
      "product_cod": product_cod,
      "price": price,
    };
  }
}
