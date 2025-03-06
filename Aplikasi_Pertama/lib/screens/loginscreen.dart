import 'package:aplikasi_pertama/assets/colors/appcolors.dart';
import 'package:aplikasi_pertama/providers/authprovider.dart';
import 'package:aplikasi_pertama/providers/passwordvisibilityprovider.dart';
import 'package:aplikasi_pertama/screens/registerscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/customtextfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final passwordProvider = context.watch<PasswordVisibilityProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "Username",
                controller: usernameController,
                suffixIcon: Icon(Icons.person, color: Colors.grey)
              ),
              SizedBox(height: 24),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                obscureText: passwordProvider.isObscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordProvider.isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    passwordProvider.toggleVisibility();
                  },
                ),
              ),
              SizedBox(
                height: 33,
              ),
              authProvider.isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    () async {
                      final navigator = Navigator.of(context);
                      bool success = await authProvider.login(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (success) {
                        navigator.pushReplacementNamed('/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login gagal, coba lagi!')),
                        );
                      }
                    };
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 38,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
