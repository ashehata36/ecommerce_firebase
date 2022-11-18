import 'package:chatwithfirebase/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final int actualPrice;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.actualPrice,
    required this.imgUrl,
    this.discountValue,
    this.category = "Other",
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
    id: '11',
    title: 'T-shirt',
    price: 300,
    actualPrice: 400,
    imgUrl: AppAssets.product1,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '11',
    title: 'T-shirt',
    price: 300,
    actualPrice: 400,
    imgUrl: AppAssets.product1,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '11',
    title: 'T-shirt',
    price: 300,
    actualPrice: 400,
    imgUrl: AppAssets.product1,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '11',
    title: 'T-shirt',
    price: 300,
    actualPrice: 400,
    imgUrl: AppAssets.product1,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '11',
    title: 'T-shirt',
    price: 300,
    actualPrice: 400,
    imgUrl: AppAssets.product1,
    category: 'Clothes',
    discountValue: 20,
  ),
];
