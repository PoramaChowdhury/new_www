// //
// // import 'package:ecommerce/app/urls.dart';
// // import 'package:ecommerce/features/common/ui/controllers/auth_controller.dart';
// // import 'package:ecommerce/services/network_caller/network_caller.dart';
// // import 'package:get/get.dart';
// //
// //
// // class DeleteCartController extends GetxController{
// //   bool _inProgress = false;
// //   bool get inProgress => _inProgress;
// //   String? _errorMessage;
// //   String? get errorMessage => _errorMessage;
// //   final String? _token=Get.find<AuthController>().accessToken;
// //
// //   Future<bool>deleteCart(String cartId)async{
// //     bool isSuccess=false;
// //     _inProgress=true;
// //     update();
// //     NetworkResponse response = await Get.find<NetworkCaller>().delRequest(Urls.cartDeleteUrl(cartId),accessToken: _token);
// //     if(response.isSuccess){
// //       isSuccess = true;
// //     }else{
// //       _errorMessage = response.errorMessage;
// //     }
// //     _inProgress = false;
// //     update();
// //     return isSuccess;
// //   }
// // }
//
// import 'package:ecommerce/app/urls.dart';
// import 'package:ecommerce/features/common/ui/controllers/auth_controller.dart';
// import 'package:ecommerce/services/network_caller/network_caller.dart';
// import 'package:get/get.dart';
//
// class DeleteCartController extends GetxController {
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//   final String? _token = Get.find<AuthController>().accessToken;
//
//   // For deleteCartItem functionality
//   String? _currentDeletingId;
//   bool isDeleting(String cartItemId) => _currentDeletingId == cartItemId;
//
//   Future<bool> deleteCart(String cartId) async {
//     bool isSuccess = false;
//     _inProgress = true;
//     update();
//
//     NetworkResponse response = await Get.find<NetworkCaller>().delRequest(
//       Urls.cartDeleteUrl(cartId),
//       accessToken: _token,
//     );
//
//     if (response.isSuccess) {
//       isSuccess = true;
//     } else {
//       _errorMessage = response.errorMessage;
//     }
//
//     _inProgress = false;
//     update();
//     return isSuccess;
//   }
//
//   // Adding the deleteCartItem functionality
//   Future<bool> deleteCartItem(String productId) async {
//     bool isSuccess = false;
//     _currentDeletingId = productId;
//     _inProgress = true;
//     update();
//
//     // final NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
//       Urls.deleteCartItemUrl(productId),
//       accessToken: _token,
//     );
//
//     if (response.isSuccess) {
//       isSuccess = true;
//       _errorMessage = null;
//     } else {
//       isSuccess = false;
//       _errorMessage = response.errorMessage;
//     }
//
//     _inProgress = false;
//     _currentDeletingId = null;
//     update();
//     return isSuccess;
//   }
// }
