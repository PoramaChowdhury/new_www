import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListShimmerLoading extends StatefulWidget {
  const CategoryListShimmerLoading({super.key});

  @override
  State<CategoryListShimmerLoading> createState() => _CategoryListShimmerLoadingState();
}

class _CategoryListShimmerLoadingState extends State<CategoryListShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        spacing: 16,
        children: [
          Container(
            width: 60,
            height: 60,
            color: Colors.white,
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.white,
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.white,
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.white,
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
