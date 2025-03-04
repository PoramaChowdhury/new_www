import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/features/common/data/models/product_pagination_model/product_pagination_model.dart';
import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductListByNewController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1 && _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final int _count = 6;
  int _page = 0;
  final String _category = "6799c5d785b54cac3abec28f";
  int? _lastPage;

  final List<ProductItemModel> _productListModel = [];
  List<ProductItemModel> get productList => _productListModel;

  Future<bool> getNewProductList()async{
    _page++;
    if(_lastPage != null && _page > _lastPage!) return false;

    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParams = {
      "count": _count,
      "page": _page,
      "category": _category,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.productListByRemarksList,
        queryParams: queryParams
    );
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;

      ProductPaginationModel paginationModel = ProductPaginationModel.fromJson(response.responseData);
      _productListModel.addAll(paginationModel.data?.results ?? []);

      if(paginationModel.data?.lastPage != null){
        _lastPage = paginationModel.data!.lastPage!;
      }

    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}