import 'package:chatwithfirebase/app/constants.dart';
import 'package:chatwithfirebase/models/product_model.dart';
import 'package:chatwithfirebase/utilities/resources/font_manager.dart';
import 'package:chatwithfirebase/utilities/resources/values_manager.dart';
import 'package:chatwithfirebase/view/widgets/home_list_header.dart';
import 'package:chatwithfirebase/view/widgets/home_list_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.6,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Placeholder(
                fallbackWidth: size.width,
                child: Image.asset(
                  "assets/images/home_bg.png",
                  width: size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p12,
                  vertical: AppPadding.p25,
                ),
                child: SizedBox(
                  width: size.width/2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FittedBox(
                        child: Text(
                          "Fashion\nsale",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: kWhiteColor, fontWeight: FontWeightManager.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Check"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const HomeListHeader(
          title: "New",
          buttonText: "View all",
          desc: "You’ve never seen it before!",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dummyProducts
                .map(
                  (e) => HomeListItem(product: e),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: AppSize.s18),
        const HomeListHeader(
          title: "Sale",
          buttonText: "View all",
          desc: "Super summer sale",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dummyProducts
                .map(
                  (e) => HomeListItem(product: e),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: AppSize.s80),
      ],
    );
  }
}
