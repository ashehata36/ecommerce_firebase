import 'package:chatwithfirebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<AuthBase>(
              builder: (__, model, _) => ListTile(
                title: Text("Sign Out", style: Theme.of(context).textTheme.titleLarge),
                onTap: () async => model.logOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
