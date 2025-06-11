import 'dart:convert';

class ProductModel {
    Data data;

    ProductModel({
        required this.data,
    });

    ProductModel copyWith({
        Data? data,
    }) => 
        ProductModel(
            data: data ?? this.data,
        );

    factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
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
    String color;
    String price;
    int qty;
    int discountedPrice;
    String discount;
    dynamic discountType;
    dynamic discountStart;
    dynamic discountEnd;
    String descriptionUz;
    String descriptionCrl;
    String descriptionRu;
    int categoryId;
    int brandId;
    List<Rasim> images;
    List<Attribute> attributes;

    Data({
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
        required this.attributes,
    });

    Data copyWith({
        int? id,
        String? nameUz,
        String? nameCrl,
        String? nameRu,
        String? color,
        String? price,
        int? qty,
        int? discountedPrice,
        String? discount,
        dynamic discountType,
        dynamic discountStart,
        dynamic discountEnd,
        String? descriptionUz,
        String? descriptionCrl,
        String? descriptionRu,
        int? categoryId,
        int? brandId,
        List<Rasim>? images,
        List<Attribute>? attributes,
    }) => 
        Data(
            id: id ?? this.id,
            nameUz: nameUz ?? this.nameUz,
            nameCrl: nameCrl ?? this.nameCrl,
            nameRu: nameRu ?? this.nameRu,
            color: color ?? this.color,
            price: price ?? this.price,
            qty: qty ?? this.qty,
            discountedPrice: discountedPrice ?? this.discountedPrice,
            discount: discount ?? this.discount,
            discountType: discountType ?? this.discountType,
            discountStart: discountStart ?? this.discountStart,
            discountEnd: discountEnd ?? this.discountEnd,
            descriptionUz: descriptionUz ?? this.descriptionUz,
            descriptionCrl: descriptionCrl ?? this.descriptionCrl,
            descriptionRu: descriptionRu ?? this.descriptionRu,
            categoryId: categoryId ?? this.categoryId,
            brandId: brandId ?? this.brandId,
            images: images ?? this.images,
            attributes: attributes ?? this.attributes,
        );

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        images: List<Rasim>.from(json["images"].map((x) => Rasim.fromMap(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromMap(x))),
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
        "attributes": List<dynamic>.from(attributes.map((x) => x.toMap())),
    };
}

class Attribute {
    int id;
    String nameUz;
    String nameCrl;
    String nameRu;
    String valueUz;
    String valueCrl;
    String valueRu;

    Attribute({
        required this.id,
        required this.nameUz,
        required this.nameCrl,
        required this.nameRu,
        required this.valueUz,
        required this.valueCrl,
        required this.valueRu,
    });

    Attribute copyWith({
        int? id,
        String? nameUz,
        String? nameCrl,
        String? nameRu,
        String? valueUz,
        String? valueCrl,
        String? valueRu,
    }) => 
        Attribute(
            id: id ?? this.id,
            nameUz: nameUz ?? this.nameUz,
            nameCrl: nameCrl ?? this.nameCrl,
            nameRu: nameRu ?? this.nameRu,
            valueUz: valueUz ?? this.valueUz,
            valueCrl: valueCrl ?? this.valueCrl,
            valueRu: valueRu ?? this.valueRu,
        );

    factory Attribute.fromJson(String str) => Attribute.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        nameUz: json["name_uz"],
        nameCrl: json["name_crl"],
        nameRu: json["name_ru"],
        valueUz: json["value_uz"],
        valueCrl: json["value_crl"],
        valueRu: json["value_ru"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name_uz": nameUz,
        "name_crl": nameCrl,
        "name_ru": nameRu,
        "value_uz": valueUz,
        "value_crl": valueCrl,
        "value_ru": valueRu,
    };
}

class Rasim {
    int id;
    String image;

    Rasim({
        required this.id,
        required this.image,
    });

    Rasim copyWith({
        int? id,
        String? image,
    }) => 
        Rasim(
            id: id ?? this.id,
            image: image ?? this.image,
        );

    factory Rasim.fromJson(String str) => Rasim.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Rasim.fromMap(Map<String, dynamic> json) => Rasim(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}
