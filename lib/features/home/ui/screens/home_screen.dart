import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/common/data/models/category/category_pagination_model.dart';
import 'package:ecommerce/features/common/data/models/product_pagination_model/product_pagination_model.dart';
import 'package:ecommerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce/features/home/ui/controllers/slider_list_controller.dart';
import 'package:ecommerce/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:ecommerce/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerce/features/home/ui/widgets/category_list_shimmer_loding.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/home_section_header.dart';
import 'package:ecommerce/features/home/ui/widgets/product_card_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/product_search_bar.dart';
import 'package:ecommerce/features/common/ui/widgets/product_list_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_by_remarks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  final PopularProductListController _popularPLController = Get.find<PopularProductListController>();
  final ProductListBySpecialController _specialPLController = Get.find<ProductListBySpecialController>();
  final ProductListByNewController _newPLController = Get.find<ProductListByNewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<SliderListController>().getSliders();
          Get.find<CategoryListController>().getCategoryList();
          Get.find<PopularProductListController>().getPopularProductList();
          Get.find<ProductListBySpecialController>().getSpecialProductList();
          Get.find<ProductListByNewController>().getNewProductList();
        },
        child: SingleChildScrollView(
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
                    return SizedBox(
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
                    return const CategoryListShimmerLoading();
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
                HomeSectionHeader(
                  title: 'Popular',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductListByRemarksScreen.name,
                      arguments: {
                        "productListByRemark": _popularPLController.productList,
                        "remark": "Popular",
                      },
                    );
                  },
                ),
                const SizedBox(height: 8),
                GetBuilder<PopularProductListController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const ProductListShimmerLoading();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _getProductCardList(controller.productList),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                // Special Products Section
                HomeSectionHeader(
                  title: 'Special',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductListByRemarksScreen.name,
                      arguments: {
                        "productListByRemark": _specialPLController.productList,
                        "remark": "Special",
                      },
                    );
                  },
                ),
                const SizedBox(height: 8),
                GetBuilder<ProductListBySpecialController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const ProductListShimmerLoading();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _getProductCardList(controller.productList),
                    ),
                  );
                }),
                const SizedBox(height: 16),

                HomeSectionHeader(
                  title: 'New',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductListByRemarksScreen.name,
                      arguments: {
                        "productListByRemark": _newPLController.productList,
                        "remark": "New",
                      },
                    );
                  },
                ),
                const SizedBox(height: 8),
                GetBuilder<ProductListByNewController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const ProductListShimmerLoading();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _getProductCardList(controller.productList),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(List<CategoryItemModel> categoryModel) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModel.length; i++) {
      categoryList.add(CategoryItemWidget(categoryModel: categoryModel[i]));
    }
    return categoryList;
  }

  List<Widget> _getProductCardList(List<ProductItemModel> productList) {
    List<Widget> productCardList = [];
    for (int i = 0; i < productList.length; i++) {
      productCardList.add(ProductCardWidget(productModel: productList[i]));
    }
    return productCardList;
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
