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

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'msg': msg,
    'data': data?.toJson(),
  };
}

class Data {
  List<CartModel>? results;
  int? total;
  String? firstPage;
  String? previous;
  String? next;
  String? lastPage;

  Data({this.results, this.total, this.firstPage, this.previous, this.next, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    results = (json['results'] as List?)?.map((v) => CartModel.fromJson(v)).toList();
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() => {
    'results': results?.map((v) => v.toJson()).toList(),
    'total': total,
    'first_page': firstPage,
    'previous': previous,
    'next': next,
    'last_page': lastPage,
  };
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

  CartModel({this.sId, this.product, this.user, this.quantity, this.color, this.size, this.createdAt, this.updatedAt, this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() => {
    '_id': sId,
    'product': product?.toJson(),
    'user': user,
    'quantity': quantity,
    'color': color,
    'size': size,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': iV,
  };
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

  Product(
      {this.sId,
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
        this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = (json['categories'] as List?)?.cast<String>();
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = (json['photos'] as List?)?.cast<String>();
    colors = (json['colors'] as List?)?.cast<String>();
    sizes = (json['sizes'] as List?)?.cast<String>();
    tags = (json['tags'] as List?)?.cast<String>();
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() => {
    '_id': sId,
    'title': title,
    'brand': brand,
    'categories': categories,
    'slug': slug,
    'meta_description': metaDescription,
    'description': description,
    'photos': photos,
    'colors': colors,
    'sizes': sizes,
    'tags': tags,
    'regular_price': regularPrice,
    'current_price': currentPrice,
    'quantity': quantity,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': iV,
  };
}
