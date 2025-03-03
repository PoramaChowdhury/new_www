import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductListShimmerLoading extends StatefulWidget {
  const ProductListShimmerLoading({super.key});

  @override
  State<ProductListShimmerLoading> createState() => _ProductListShimmerLoadingState();
}

class _ProductListShimmerLoadingState extends State<ProductListShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        spacing: 16,
        children: [
          Container(
            width: 150,
            height: 120,
            color: Colors.white,
          ),
          Container(
            width: 150,
            height: 120,
            color: Colors.white,
          ),
          Container(
            width: 60,
            height: 120,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}