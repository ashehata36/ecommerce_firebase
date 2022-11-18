import 'package:chatwithfirebase/services/auth.dart';
import 'package:chatwithfirebase/utilities/router.dart';
import 'package:chatwithfirebase/utilities/routes.dart';
import 'package:chatwithfirebase/utilities/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'E-commerce App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
