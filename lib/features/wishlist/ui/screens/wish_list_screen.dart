import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/wishlist/ui/widgets/wish_list_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static String name = '/wish-list';
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wish List'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return const FittedBox(
                  child: WishListProductItemWidget(
                      tittle: 'New Year Special Shoe 3D',
                      rating: 4.5,
                      price: 100));
            }),
      ),
    );
  }
}
