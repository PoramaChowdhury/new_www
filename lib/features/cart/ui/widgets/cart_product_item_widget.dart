// import 'package:ecommerce/app/app_colors.dart';
// import 'package:ecommerce/app/assets_path.dart';
// import 'package:ecommerce/features/cart/model/cart_model.dart';
// import 'package:ecommerce/features/common/ui/widgets/product_quantity_stepper_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// /*
// class CartProductItemWidget extends StatelessWidget {
//   const CartProductItemWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//
//     return Card(
//       elevation: 1,
//       color: Colors.white,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
//         child: Row(
//           children: [
//             Image.asset(
//               AssetsPath.dummyImagePng,
//               width: 90,
//               height: 90,
//               fit: BoxFit.scaleDown,
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Text(
//                               'Nike Shoe - AK45394 New year deal',
//                               maxLines: 1,
//                               style: textTheme.bodyLarge
//                                   ?.copyWith(overflow: TextOverflow.ellipsis),
//                             ),
//                             const Row(
//                               children: [
//                                 Text('Color: Red'),
//                                 SizedBox(width: 8),
//                                 Text('Size: XL'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.delete_outline),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         '\$100',
//                         style: TextStyle(
//                             color: AppColors.themeColor,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       ProductQuantityIncDecButton(
//                         onChange: (int noOfItem) {},
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }*/
// class CartProductItemWidget extends StatelessWidget {
//   final CartModel cartModel;
//   final VoidCallback onDelete;
//
//   const CartProductItemWidget({
//     super.key,
//     required this.cartModel,
//     required this.onDelete,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Card(
//       elevation: 1,
//       color: Colors.white,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
//         child: Row(
//           children: [
//             Image.asset(
//               AssetsPath.dummyImagePng,
//               width: 90,
//               height: 90,
//               fit: BoxFit.scaleDown,
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Text(
//                               cartModel.product?.title ?? 'No Title',
//                               maxLines: 1,
//                               style: textTheme.bodyLarge
//                                   ?.copyWith(overflow: TextOverflow.ellipsis),
//                             ),
//                             Row(
//                               children: [
//                                 Text('Color: ${cartModel.color}'),
//                                 SizedBox(width: 8),
//                                 Text('Size: ${cartModel.size}'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: onDelete,  // Trigger delete action
//                         icon: const Icon(Icons.delete_outline),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '\$${cartModel.product?.currentPrice}',
//                         style: TextStyle(
//                             color: AppColors.themeColor,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       ProductQuantityIncDecButton(
//                         onChange: (int noOfItem) {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// void showSnackbar(String title, String message) {
//   Get.snackbar(title, message,
//     snackPosition: SnackPosition.BOTTOM,
//     backgroundColor: Colors.black.withOpacity(0.7),
//     colorText: Colors.white,
//   );
// }
