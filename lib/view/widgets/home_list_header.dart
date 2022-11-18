import 'package:chatwithfirebase/utilities/resources/font_manager.dart';
import 'package:chatwithfirebase/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeListHeader extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? hPadding;
  final String title;
  final String desc;
  final String buttonText;

  const HomeListHeader({
    Key? key,
    this.onPressed,
    this.hPadding,
    required this.title,
    required this.buttonText,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeightManager.bold,
            ),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      subtitle: Text(
        desc,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: hPadding ?? AppPadding.p14,
        vertical: AppPadding.p8,
      ),
    );
  }
}
