class CartListModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  CartListModel({this.code, this.status, this.msg, this.data});

  CartListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CartModel>? results;
  int? total;
  String? firstPage;
  String? previous;
  String? next;
  String? lastPage;

  Data({
    this.results,
    this.total,
    this.firstPage,
    this.previous,
    this.next,
    this.lastPage,
  });

  Data.fromJson(Map<String, dynamic> json) {
    results =
        (json['results'] as List?)?.map((v) => CartModel.fromJson(v)).toList();
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['first_page'] = firstPage;
    data['previous'] = previous;
    data['next'] = next;
    data['last_page'] = lastPage;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartModel {
  String? sId;
  Product? product;
  String? user;
  int? quantity;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartModel(
      {this.sId,
      this.product,
      this.user,
      this.quantity,
      this.color,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['user'] = user;
    data['quantity'] = quantity;
    data['color'] = color;
    data['size'] = size;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Product {
  String? sId;
  String? title;
  String? brand;
  List<String>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product({
    this.sId,
    this.title,
    this.brand,
    this.categories,
    this.slug,
    this.metaDescription,
    this.description,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    this.regularPrice,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = json['categories'] != null
        ? List<String>.from(json['categories'])
        : null;
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];

    photos = json['photos'] != null ? List<String>.from(json['photos']) : null;

    colors = json['colors'] != null ? List<String>.from(json['colors']) : null;
    sizes = json['sizes'] != null ? List<String>.from(json['sizes']) : null;
    tags = json['tags'] != null ? List<String>.from(json['tags']) : null;
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['brand'] = brand;
    data['categories'] = categories;
    data['slug'] = slug;
    data['meta_description'] = metaDescription;
    data['description'] = description;
    data['photos'] = photos;
    data['colors'] = colors;
    data['sizes'] = sizes;
    data['tags'] = tags;
    data['regular_price'] = regularPrice;
    data['current_price'] = currentPrice;
    data['quantity'] = quantity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
