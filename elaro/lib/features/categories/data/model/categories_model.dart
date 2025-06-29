import 'dart:convert';

class CategorieModel {
    Data data;

    CategorieModel({
        required this.data,
    });

    factory CategorieModel.fromJson(String str) => CategorieModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategorieModel.fromMap(Map<String, dynamic> json) => CategorieModel(
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class Data {
    int id;
    String nameUz;
    String nameCrl;
    String nameRu;
    String image;
    String backgroundImg;
    List<SubCategory> subCategories;
    List<Product> products;

    Data({
        required this.id,
        required this.nameUz,
        required this.nameCrl,
        required this.nameRu,
        required this.image,
        required this.backgroundImg,
        required this.subCategories,
        required this.products,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        nameUz: json["name_uz"],
        nameCrl: json["name_crl"],
        nameRu: json["name_ru"],
        image: json["image"],
        backgroundImg: json["background_img"],
        subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromMap(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name_uz": nameUz,
        "name_crl": nameCrl,
        "name_ru": nameRu,
        "image": image,
        "background_img": backgroundImg,
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x.toMap())),
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
    };
}

class Product {
    int id;
    String nameUz;
    String nameCrl;
    String nameRu;
    String color;
    String price;
    int qty;
    int discountedPrice;
    String discount;
    String discountType;
    String discountStart;
    String discountEnd;
    String descriptionUz;
    String descriptionCrl;
    String descriptionRu;
    int categoryId;
    int brandId;
    List<Imagee> images;

    Product({
        required this.id,
        required this.nameUz,
        required this.nameCrl,
        required this.nameRu,
        required this.color,
        required this.price,
        required this.qty,
        required this.discountedPrice,
        required this.discount,
        required this.discountType,
        required this.discountStart,
        required this.discountEnd,
        required this.descriptionUz,
        required this.descriptionCrl,
        required this.descriptionRu,
        required this.categoryId,
        required this.brandId,
        required this.images,
    });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        nameUz: json["name_uz"],
        nameCrl: json["name_crl"],
        nameRu: json["name_ru"],
        color: json["color"],
        price: json["price"],
        qty: json["qty"],
        discountedPrice: json["discounted_price"],
        discount: json["discount"],
        discountType: json["discount_type"],
        discountStart: json["discount_start"],
        discountEnd: json["discount_end"],
        descriptionUz: json["description_uz"],
        descriptionCrl: json["description_crl"],
        descriptionRu: json["description_ru"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        images: List<Imagee>.from(json["images"].map((x) => Imagee.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name_uz": nameUz,
        "name_crl": nameCrl,
        "name_ru": nameRu,
        "color": color,
        "price": price,
        "qty": qty,
        "discounted_price": discountedPrice,
        "discount": discount,
        "discount_type": discountType,
        "discount_start": discountStart,
        "discount_end": discountEnd,
        "description_uz": descriptionUz,
        "description_crl": descriptionCrl,
        "description_ru": descriptionRu,
        "category_id": categoryId,
        "brand_id": brandId,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
    };
}

class Imagee {
    int id;
    String image;

    Imagee({
        required this.id,
        required this.image,
    });

    factory Imagee.fromJson(String str) => Imagee.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Imagee.fromMap(Map<String, dynamic> json) => Imagee(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}

class SubCategory {
    int id;
    String nameUz;
    String nameCrl;
    String nameRu;
    String image;
    int categoryId;

    SubCategory({
        required this.id,
        required this.nameUz,
        required this.nameCrl,
        required this.nameRu,
        required this.image,
        required this.categoryId,
    });

    factory SubCategory.fromJson(String str) => SubCategory.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SubCategory.fromMap(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        nameUz: json["name_uz"],
        nameCrl: json["name_crl"],
        nameRu: json["name_ru"],
        image: json["image"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name_uz": nameUz,
        "name_crl": nameCrl,
        "name_ru": nameRu,
        "image": image,
        "category_id": categoryId,
    };
}
