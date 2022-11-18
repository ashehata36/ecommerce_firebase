import 'package:chatwithfirebase/controllers/auth_controller.dart';
import 'package:chatwithfirebase/services/auth.dart';
import 'package:chatwithfirebase/view/pages/auth_page.dart';
import 'package:chatwithfirebase/view/pages/bottom_navigation_bar.dart';
import 'package:chatwithfirebase/view/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.active) {
          final user = snapShot.data;
          return user == null
              ? ChangeNotifierProvider(
                  create: (_) => AuthController(auth: auth),
                  child: const AuthPage(),
                )
              : BottomBarPage();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
