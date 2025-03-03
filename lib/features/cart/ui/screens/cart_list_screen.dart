import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/cart/controller/cart_list_controller.dart';
import 'package:ecommerce/features/cart/controller/delete_cart_controller.dart';
import 'package:ecommerce/features/cart/ui/widgets/cart_product_item_widget.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CartProductItemWidget();
                },
              ),
            ),
            _buildPriceAndCheckoutSection(textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price', style: textTheme.titleSmall),
              const Text(
                '\$100039',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}*/
class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartListController _cartListController = Get.put(CartListController());

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  void _fetchCartItems() async {
    final success = await _cartListController.getCartList();
    if (!success) {
      // Handle error if cart fetch failed
      showSnackbar('Error', _cartListController.errorMessage ?? 'Failed to load cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Obx(() {
          if (_cartListController.inProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (_cartListController.cartList.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _cartListController.cartList.length,
                  itemBuilder: (context, index) {
                    final cartItem = _cartListController.cartList[index];
                    return CartProductItemWidget(
                      cartModel: cartItem,
                      onDelete: () => _deleteCartItem(cartItem.sId!),
                    );
                  },
                ),
              ),
              _buildPriceAndCheckoutSection(textTheme),
            ],
          );
        }),
      ),
    );
  }

  void _deleteCartItem(String cartId) async {
    final success = await Get.find<DeleteCartController>().deleteCart(cartId);
    if (success) {
      showSnackbar('Success', 'Item removed from cart');
      _fetchCartItems(); // Re-fetch cart items after deletion
    } else {
      showSnackbar('Error', Get.find<DeleteCartController>().errorMessage ?? 'Failed to delete item');
    }
  }

  Widget _buildPriceAndCheckoutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price', style: textTheme.titleSmall),
              const Text(
                '\$100039',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
