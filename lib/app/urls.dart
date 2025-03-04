class Urls{

  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";

  static String signInUrl = "$_baseUrl/auth/login";
  static String verifyOtpUrl = "$_baseUrl/auth/verify-otp";
  static String readProfile = "$_baseUrl/ReadProfile";
  static String signUpUrl = "$_baseUrl/auth/signup";
  static String homeBannerSliders = "$_baseUrl/slides";
  static String categoryList = "$_baseUrl/categories";
  static String productListByCategory(int categoryId) => "$_baseUrl/ListProductByCategory/$categoryId";
  static String productListByRemarksList = "$_baseUrl/products";
  static String productDetails= "$_baseUrl/products/id/";
  static String reviewsUrl = "$_baseUrl/reviews";
  static String addToCartUrl = "$_baseUrl/cart";
  static String cartListUrl = "$_baseUrl/cart";
  static String wishlistUrl = "$_baseUrl/wishlist";
  static String createOrderUrl = "$_baseUrl/order";
  static String deleteCartItemUrl(String productId) => "$_baseUrl/cart/$productId";
  static String deleteWishlistItemUrl(String productId) => "$_baseUrl/wishlist/$productId";

}