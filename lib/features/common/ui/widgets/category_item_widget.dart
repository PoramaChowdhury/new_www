import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/common/data/models/category/category_pagination_model.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.categoryModel,
  });

  final CategoryItemModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategoryScreen.name,
          arguments:{
            "categoryName":categoryModel.title,
            "categoryId": categoryModel.iV
          },
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6)
            ),
            child: Image.network(categoryModel.icon ?? "",width: 40, height: 40, fit: BoxFit.scaleDown,),
          ),
          Text(categoryModel.title ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.themeColor,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),)
        ],
      ),
    );
  }
}