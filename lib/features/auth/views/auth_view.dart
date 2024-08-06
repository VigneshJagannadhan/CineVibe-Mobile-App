import 'package:cine_vibe/features/auth/viewmodels/auth.viewmodel.dart';
import 'package:cine_vibe/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                validator: validateName,
              ),
              TextFormField(
                controller: usernameController,
                validator: validateName,
              ),
              TextFormField(
                controller: emailController,
                validator: validateEmail,
              ),
              TextFormField(
                controller: passwordController,
                validator: validatePasswordRegistration,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthViewmodel authViewmodel =
                      Provider.of<AuthViewmodel>(context, listen: false);
                  if (_formKey.currentState!.validate()) {
                    authViewmodel.name = nameController.text;
                    authViewmodel.username = usernameController.text;
                    authViewmodel.email = emailController.text;
                    authViewmodel.password = passwordController.text;
                    authViewmodel.registerUser(context);
                  }
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
