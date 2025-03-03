class WishlistItemListDataModel {
  int? code;
  String? status;
  String? msg;
  WishlistData? data;

  WishlistItemListDataModel({this.code, this.status, this.msg, this.data});

  WishlistItemListDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? WishlistData.fromJson(json['data']) : null;
  }
}

class WishlistData {
  List<WishlistItemModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  WishlistData(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  WishlistData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <WishlistItemModel>[];
      json['results'].forEach((v) {
        results!.add(WishlistItemModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

}

class WishlistItemModel {
  String? sId;
  Product? product;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WishlistItemModel(
      {this.sId,
        this.product,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.iV});

  WishlistItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    categories = json['categories']?.cast<String>();
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos']?.cast<String>();
    colors = json['colors']?.cast<String>();
    sizes = json['sizes']?.cast<String>();
    tags = json['tags']?.cast<String>();
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
