import 'dart:developer';

import 'package:cine_vibe/features/auth/viewmodels/auth.viewmodel.dart';
import 'package:cine_vibe/features/home/views/home_view.dart';
import 'package:cine_vibe/services/shared_pref_helper.dart';
import 'package:cine_vibe/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/custom_form_field_1.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(text: "vigneshk@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Abcd@1234");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewmodel>(builder: (context, authViewModel, child) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!authViewModel.isLogin)
                  Column(
                    children: [
                      CustomTextFormField1(
                        nameController: nameController,
                        label: "Name",
                        validator: validateName,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField1(
                        nameController: usernameController,
                        label: "Username",
                        validator: validateName,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                CustomTextFormField1(
                  nameController: emailController,
                  label: "Email",
                  validator: validateEmail,
                ),
                const SizedBox(height: 10),
                CustomTextFormField1(
                  nameController: passwordController,
                  label: "Password",
                  validator: validatePasswordRegistration,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        authViewModel.name = nameController.text;
                        authViewModel.username = usernameController.text;
                        authViewModel.email = emailController.text;
                        authViewModel.password = passwordController.text;
                        await authViewModel.authenticateUser(context);
                      }
                    },
                    child: Text(authViewModel.isLogin ? "Login" : "Register"),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child:
                          Text(authViewModel.isLogin ? "Sign Up" : "Sign In"),
                      onPressed: () {
                        authViewModel.isLogin = !authViewModel.isLogin;
                        log(authViewModel.isLogin.toString());
                      },
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
