import 'package:ecommerce/app/app_theme_data.dart';
import 'package:ecommerce/app/controller_binder.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerce/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_by_category_screen.dart';
import 'package:ecommerce/features/review/ui/screens/create_review.dart';
import 'package:ecommerce/features/review/ui/screens/review_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == SignInScreen.name) {
          widget = const SignInScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          String email = settings.arguments as String;
          widget = OtpVerificationScreen(email: email);
        } else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListByCategoryScreen.name) {
          Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          widget = ProductListByCategoryScreen(
            categoryName: args['categoryName'],
            categoryId: args['categoryId'],
          );
        } else if (settings.name == ProductDetailsScreen.name) {
          Map<String, dynamic> productList = settings.arguments as Map<String, dynamic>;
          widget = ProductDetailsScreen(productList: productList["productList"]);
        }else if(settings.name == ReviewListScreen.name){
          String id = settings.arguments as String;
          widget = ReviewListScreen(productId: id,);
        }else if(settings.name == CreateReview.name){
          widget = const CreateReview();
        }else if(settings.name == CartListScreen.name){
          widget = const CartListScreen();
        }

        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}
