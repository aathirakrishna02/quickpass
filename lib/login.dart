import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickpass/forgetpass.dart';
import 'package:quickpass/homepage.dart';
import 'package:quickpass/register.dart';
import 'package:quickpass/utils/owner.dart';

import 'adminmod/ahomescreen.dart';
import 'authservices.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading=false;
 final TextEditingController _usernameController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
   _loginUser() async {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    final role = await AuthServices.login(email: email, password: password);

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
    if (role != "USER" &&
        role != "ADMIN" ) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('invalid username and password')));
      return;
    }

    Widget? page;
    switch (role.toUpperCase()) {
      case 'USER':
        page = RegularUserHomeScreen();
        print("IS USER");
        break;
      case 'ADMIN':
        page = OwnerScreen();
        print("IS A STAFF");

        break;
      
      default:
        print(role);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(role)));
    }
    if (page != null) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx2) => page!));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to your account',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            
            SizedBox(height: 16.0),
            TextFormField(
              controller: _usernameController,
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
            // RaisedButton(
            //   onPressed: () {
            //     // Handle login functionality
            //     String email = _emailController.text;
            //     String password = _passwordController.text;
            //     String userType = _selectedUserType;

            //     // Perform login actions based on user type
            //     if (userType == 'Regular User') {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => RegularUserHomeScreen(),
            //         ),
            //       );
            //     } else if (userType == 'Admin User') {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => AdminUserHomeScreen(),
            //         ),
            //       );
            //     }
            //   },
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: Text('Login'),
            // ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                        // Handle login functionality
                    _loginUser();

                    // Perform login actions based on user type
                    // if (userType == 'Regular User') {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => RegularUserHomeScreen(),
                    //     ),
                    //   );
                    // } else if (userType == 'Admin User') {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminUserHomeScreen(),
                    //     ),
                    //   );
                    // }
               
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
            //     // Handle signup screen navigation
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SignupScreen()),
            //     );
            //   },
            //   child: Text('Don\'t have an account? Sign Up'),
            // ),
            TextButton(
                  onPressed: () {
                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                  },
                  child: const Text('Don\'t have an account? Sign Up'),
              ),
              TextButton(
                  onPressed: () {
                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                  },
                  child: const Text('Forget Password'),
              ),
          ],
        ),
      ),
    );
  }
}

// class RegularUserHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Regular User Home'),
//       ),
//       body: Center(
//         child: Text('Regular User Home Screen'),
//       ),
//     );
//   }
// }

// class AdminUserHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin User Home'),
//       ),
//       body: Center(
//         child: Text('Admin User Home Screen'),
//       ),
//     );
//   }
// }

// class SignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Center(
//         child: Text('Sign Up Screen'),
//       ),
//     );
//   }
// }


