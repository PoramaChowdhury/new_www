import 'package:ecommerce/features/common/ui/controllers/product_list_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/product_list_shimmer_loading.dart';
import 'package:ecommerce/features/home/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  static const String name = "/product/product-list-by-category";
  const ProductListByCategoryScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  final String categoryName;
  final int categoryId;

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState extends State<ProductListByCategoryScreen> {
  final ProductListController _controller = Get.find<ProductListController>();

  @override
  void initState() {
    super.initState();
    _controller.getProductListByCategory(widget.categoryId); // Load products for the category on screen init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios)),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              height: 2,
              color: Colors.grey.shade200,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          top: 8,
          right: 8,
          bottom: 0,
        ),
        child: GetBuilder<ProductListController>(
          builder: (controller) {
            if (controller.inProgress) {
              // Show shimmer loading while fetching products
              return ListView.separated(
                itemCount: 6,
                itemBuilder: (context, index) => const ProductListShimmerLoading(),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              );
            }

            if (controller.productList.isEmpty) {
              return Center(child: Text("No products available"));
            }

            // Display products in a grid
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 18,
              ),
              itemCount: controller.productList.length,
              itemBuilder: (BuildContext context, index) {
                return FittedBox(
                  child: ProductCardWidget(productModel: controller.productList[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onPop() {
    Navigator.pop(context);
  }
}
