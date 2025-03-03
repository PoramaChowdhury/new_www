import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class WishListProductItemWidget extends StatelessWidget {
  const WishListProductItemWidget({
    super.key,
    required this.tittle,
    required this.rating,
    required this.price,
  });
  final String tittle;
  final int price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 150,


        child: Card(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.44),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetsPath.dummyImagePng,
                    fit: BoxFit.cover,

                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        tittle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '\$$price',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.themeColor),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Wrap(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                '$rating',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.themeColor
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.delete_outline,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
