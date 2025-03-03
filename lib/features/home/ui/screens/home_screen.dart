import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/common/data/models/category_model.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:ecommerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce/features/home/ui/controllers/slider_list_controller.dart';
import 'package:ecommerce/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/home_section_header.dart';
import 'package:ecommerce/features/common/ui/widgets/product_list_shimmer_loading.dart';
import 'package:ecommerce/features/home/ui/widgets/product_card_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(controller: _searchBarController),
              const SizedBox(height: 16),
              // Carousel Slider Section
              GetBuilder<SliderListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                    height: 180,
                    child: CenteredCircularProgressIndicator(),
                  );
                }
                return HomeCarouselSlider(sliderList: controller.bannerList);
              }),
              const SizedBox(height: 16),
              // Category Section
              HomeSectionHeader(
                title: 'Category',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<CategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                    height: 100,
                    child: CenteredCircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoryList(controller.categoryList),
                  ),
                );
              }),
              const SizedBox(height: 16),
              // Popular Products Section
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              const SizedBox(height: 8),
              GetBuilder<PopularProductListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                    height: 200,
                    child: CenteredCircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(controller.productList),
                  ),
                );
              }),
              const SizedBox(height: 16),
              // Special Products Section (currently empty or placeholder)
              HomeSectionHeader(title: 'Special', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList([]), // Placeholder for empty list
                ),
              ),
              const SizedBox(height: 16),
              // New Products Section (currently empty or placeholder)
              HomeSectionHeader(title: 'New', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList([]), // Placeholder for empty list
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to generate category list widgets
  List<Widget> _getCategoryList(List<CategoryModel> categoryModels) {
    return categoryModels.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: CategoryItemWidget(categoryModel: category),
      );
    }).toList();
  }

  // Helper method to generate product card widgets
  List<Widget> _getProductList(List<ProductModel> productList) {
    return productList.map((product) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: ProductCardWidget(productModel: product),
      );
    }).toList();
  }

  // AppBar for the home screen
  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
