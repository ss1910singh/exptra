// ignore_for_file: unused_local_variable

import 'package:exptra/screen/landing_page.dart';
import 'package:exptra/screen/login_screen.dart';
import 'package:exptra/services/auth_service.dart';
import 'package:exptra/utils/appvalidator.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthServices();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "username": _usernameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      await authService.createUser(data, context);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LandingPage()));
      setState(() {
        isLoader = false;
      });
      // ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
      //   const SnackBar(content: Text('Account created')),
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: appValidator.validateUsername,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: appValidator.validateEmail,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: appValidator.validatePassword,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // ignore: avoid_print
                      isLoader ? print("Loading...") : _submitForm();
                    },
                    child: isLoader
                        ? const Center(child: CircularProgressIndicator())
                        : const Text("Create"),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: const Text('Sign in'),
                )
              ],
            )),
      ),
    );
  }
}
