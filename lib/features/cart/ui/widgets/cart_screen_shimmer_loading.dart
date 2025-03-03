import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartScreenShimmerLoading extends StatelessWidget {
  const CartScreenShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: double.maxFinite,
                height: 120,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: double.maxFinite,
                height: 120,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: double.maxFinite,
                height: 120,
              ),
            ],
          ),
        )
    );
  }
}