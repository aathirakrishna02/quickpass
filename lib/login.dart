import 'package:flutter/material.dart';
import 'package:quickpass/forgetpass.dart';
import 'package:quickpass/register.dart';

import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               HomeScreen()));

              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              ),
            // FlatButton(
            //   onPressed: () {
            //     // Handle forgot password functionality
            //   },
            //   child: Text('Forgot Password?'),
            // ),
            TextButton(
                  onPressed: () {
                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                  },
                  child: const Text('Forgot Password?'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                    //  Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) =>
                    //                           SignupScreen()));
                  },
                  child: const Text('Do not have an account? Signup'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
              child: Text('Sign up'),
              onPressed: () {
                 Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));

              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              ),

          ],
        ),
      ),
    );
  }
}

