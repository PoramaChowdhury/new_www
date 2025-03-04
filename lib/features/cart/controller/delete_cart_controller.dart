

import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class DeleteCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final String? _token = Get.find<AuthController>().accessToken;

  // To track which item is currently being deleted
  String? _currentDeletingId;
  bool isDeleting(String cartItemId) => _currentDeletingId == cartItemId;

  // Deleting the entire cart
  Future<bool> deleteCart(String cartId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
      Urls.deleteCartItemUrl(cartId),
      accessToken: _token,
    );

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  // Deleting individual cart item
  Future<bool> deleteCartItem(String productId) async {
    bool isSuccess = false;

    // Track which item is being deleted
    _currentDeletingId = productId;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
      Urls.deleteCartItemUrl(productId),
      accessToken: _token,
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null; // Reset any previous error message
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    _currentDeletingId = null; // Reset deleting state
    update();

    return isSuccess;
  }
}
