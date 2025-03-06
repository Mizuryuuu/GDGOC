
import 'package:aplikasi_pertama/screens/loginscreen.dart';
import 'package:aplikasi_pertama/widgets/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets/colors/appcolors.dart';
import '../providers/authprovider.dart';
import '../providers/passwordvisibilityprovider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final passwordProvider = context.watch<PasswordVisibilityProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context)
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
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
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: "Email",
                controller: emailController,
                suffixIcon: Icon(Icons.email_outlined,color: Colors.grey),
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                obscureText: passwordProvider.isObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    passwordProvider.toggleVisibility();
                  },
                  icon: Icon(
                    passwordProvider.isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: "Confirm Password",
                controller: confirmPasswordController,
                obscureText: passwordProvider.isObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    passwordProvider.toggleVisibility();
                  },
                  icon: Icon(
                    passwordProvider.isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
                      bool success = await authProvider.register(
                          context,
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text
                      );
                      if (success) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Registrasi Success"),
                              content: Text("Account created successfully!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    navigator.pop();
                                    navigator.pushReplacementNamed("/home");
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
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
                    "Sign Up",
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
                      text: 'Don’t have an account yet? ',
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
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
