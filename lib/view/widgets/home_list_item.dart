import 'package:chatwithfirebase/app/constants.dart';
import 'package:chatwithfirebase/models/product_model.dart';
import 'package:chatwithfirebase/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  final Product product;

  const HomeListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2,
      margin: const EdgeInsets.all(AppMargin.m8),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5, vertical: AppPadding.p8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s14),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s14),
                  child: SizedBox(
                    height: size.width / 2,
                    width: double.infinity,
                    child: Image.network(
                      product.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: AppSize.s4,
                  left: AppSize.s4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: kErrorColor,
                      borderRadius: BorderRadius.circular(AppSize.s18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p3),
                      child: Text(
                        "-${product.discountValue}%",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: kWhiteColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            product.category,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: AppSize.s4),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: AppSize.s4),
          Text.rich(
            TextSpan(
                text: "${product.actualPrice}\$",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: kErrorColor,
                    ),
                children: [
                  TextSpan(
                    text: "${product.price}\$",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
