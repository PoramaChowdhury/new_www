import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/features/cart/model/cart_model.dart';
import 'package:ecommerce/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

// class CartListController extends GetxController{
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;
//
//   int totalPrice = 0;
//
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//
//   final List<CartModel>  _cartList = [];
//   List<CartModel> get cartList =>_cartList;
//
//
//
//   Future<bool>getCartList()async{
//     final String? token = Get.find<AuthController>().accessToken;
//     bool isSuccess=false;
//     _inProgress = true;
//     update();
//     NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.cartListUrl,accessToken: token);
//     if(response.isSuccess){
//       _cartList.clear();
//       isSuccess=true;
//       CartListModel cartListModel = CartListModel.fromJson(response.responseData);
//       _cartList.addAll(cartListModel.data!.results??[]);
//     }else{
//       _errorMessage = response.errorMessage;
//     }
//     _inProgress= false;
//     update();
//     return isSuccess;
//   }
// }
class CartListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  int totalPrice = 0;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final List<CartModel> _cartItemList = [];

  List<CartModel> get cartItemList => _cartItemList;

  Future<bool> getCartList(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    _cartItemList.clear();
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.cartListUrl,
      accessToken: token,
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;

      CartListModel cartListModel =
      CartListModel.fromJson(response.responseData);
      _cartItemList.addAll(cartListModel.data?.results ?? []);
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  void calculateTotalPrice() {
    totalPrice = _cartItemList.fold<int>(0, (sum, result) {
      final price = result.product?.currentPrice ?? 0;
      final quantity = result.quantity ?? 0;
      return sum + (price * quantity);
    });
  }
}
