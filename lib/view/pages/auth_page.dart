import 'package:chatwithfirebase/app/constants.dart';
import 'package:chatwithfirebase/controllers/auth_controller.dart';
import 'package:chatwithfirebase/utilities/enums.dart';
import 'package:chatwithfirebase/utilities/resources/values_manager.dart';
import 'package:chatwithfirebase/utilities/routes.dart';
import 'package:chatwithfirebase/utilities/resources/font_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final firebaseAuth = FirebaseAuth.instance;

  _submit(AuthController model) async {
    try {
      await model.submit();
    } catch (e) {
      debugPrint("Error = ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, __) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    model.authFormType == AuthFormType.register ? "Sign up" : "Login",
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeightManager.bold),
                  ),
                  const Spacer(),
                  if (model.authFormType == AuthFormType.register)
                    TextFormField(
                      focusNode: _nameFocusNode,
                      textInputAction: TextInputAction.next,
                      initialValue: model.name,
                      onEditingComplete: () => FocusScope.of(context).requestFocus(_emailFocusNode),
                      onChanged: model.updateName,
                      keyboardType: TextInputType.name,
                      validator: (value) => value == null || value.isEmpty ? "Please enter your name" : null,
                      decoration: const InputDecoration(labelText: "Name", hintText: "Enter your Name"),
                    ),
                  const SizedBox(height: AppSize.s16),
                  TextFormField(
                    focusNode: _emailFocusNode,
                    onChanged: model.updateEmail,
                    initialValue: model.email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    validator: (value) => value == null || value.isEmpty ? "Please enter your email" : null,
                    decoration: const InputDecoration(labelText: "Email", hintText: "Enter your email"),
                  ),
                  const SizedBox(height: AppSize.s16),
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    onChanged: model.updatePassword,
                    initialValue: model.password,
                    onEditingComplete: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, AppRoutes.bottomBarPageRoute);
                      }
                    },
                    validator: (value) => value == null || value.isEmpty ? "Please enter your password" : null,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: AppSize.s16),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Text(model.authFormType == AuthFormType.login
                          ? "Forgot your password?"
                          : "Already have an account?"),
                      onTap: () {
                        if (model.authFormType == AuthFormType.register) {
                          model.updateAuthFormType(authFormType: AuthFormType.login);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: AppSize.s18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          _submit(model);
                        }
                      },
                      child: Text(model.authFormType == AuthFormType.login ? "Login" : "SIGN UP"),
                    ),
                  ),
                  if (model.authFormType == AuthFormType.login)
                    Column(
                      children: [
                        const SizedBox(height: AppSize.s18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                            ),
                            InkWell(
                              child: const Text(
                                " SignUp",
                              ),
                              onTap: () {
                                model.updateAuthFormType(authFormType: AuthFormType.register);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        model.authFormType == AuthFormType.login
                            ? "Or login with social account"
                            : "Or sign up with social account",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  const SizedBox(height: AppSize.s16),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(AppSize.s18),
                        ),
                        child: const SizedBox(
                          height: AppSize.s80,
                          width: AppSize.s80,
                          child: Icon(
                            FontAwesomeIcons.facebookF,
                            size: AppSize.s40,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSize.s30),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(AppSize.s18),
                        ),
                        child: SizedBox(
                          height: AppSize.s80,
                          width: AppSize.s80,
                          child: SvgPicture.asset(
                            "assets/icons/icons8-google-16.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
