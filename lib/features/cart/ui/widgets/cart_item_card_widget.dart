import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/cart/controller/cart_list_controller.dart';
import 'package:ecommerce/features/cart/controller/delete_cart_controller.dart';
import 'package:ecommerce/features/cart/model/cart_model.dart';
import 'package:ecommerce/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce/features/common/ui/widgets/product_quantity_stepper_widget.dart';
import 'package:ecommerce/features/common/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCardWidget extends StatefulWidget {
  const CartItemCardWidget({
    super.key,
    required this.cartItem,
  });
  final CartModel cartItem;

  @override
  State<CartItemCardWidget> createState() => _CartItemCardWidgetState();
}

class _CartItemCardWidgetState extends State<CartItemCardWidget> {
  final CartListController _cartListController = Get.find<CartListController>();
  final AuthController _auth = Get.find<AuthController>();
  final DeleteCartController _deleteCartItemController = Get.find<DeleteCartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: _onTapNavigateToProductDetailsScreen,
              child: Image.network(
                (widget.cartItem.product?.photos?.isNotEmpty == true)
                    ? "${widget.cartItem.product?.photos}"
                    : "https://hudaenu.xyz/wp-content/uploads/2025/02/shoe2.png",
                width: 120,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartItem.product?.title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                                "Color: ${widget.cartItem.product?.colors}, Size: ${widget.cartItem.product?.sizes}"),
                          ],
                        ),
                      ),
                      GetBuilder<DeleteCartController>(
                        builder: (controller) {
                          if (controller.isDeleting(widget.cartItem.sId ?? "")) {
                            return const CenteredCircularProgressIndicator();
                          }
                          return IconButton(
                            onPressed: () {
                              _deleteCartItem();
                            },
                            icon: const Icon(
                              Icons.delete_rounded,
                              color: Colors.grey,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${widget.cartItem.product?.currentPrice}",
                        style: const TextStyle(
                            color: AppColors.themeColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      ProductQuantityStepperWidget(
                        onChange: (int value) {},
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _deleteCartItem() async {
    bool loggedIn = await _auth.isUserLoggedIn();
    if (loggedIn) {
      String productId = widget.cartItem.sId ?? "";
      bool result = await _deleteCartItemController.deleteCartItem(productId);

      if (result && mounted) {
        _cartListController.getCartList(_auth.accessToken ?? ""); // Assuming you want to refresh cart here
        showSnackBarMessage(context, "Cart item removed successfully");
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, _deleteCartItemController.errorMessage ?? "Something went wrong", false);
        }
      }
    } else {
      if (mounted) {
        Navigator.pushNamed(context, SignUpScreen.name);
      }
    }
  }

  void _onTapNavigateToProductDetailsScreen() {
    Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
  }
}
