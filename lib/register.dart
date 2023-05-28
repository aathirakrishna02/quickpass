import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickpass/homepage.dart';
import 'package:quickpass/login.dart';

import 'authservices.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  _SignupScreenState(){
   valuechoose=selectList[0];

  }
  List selectList=['USER','ADMIN'];
  String valuechoose= 'USER'; // Default user type selection

  final _nameController = TextEditingController();
 final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final registercontroller = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  // _signupUser() async {
  //   String email = _usernameController.text.trim();
  //   String password = _passwordController.text.trim();
  //   String res = await AuthServices.signup(email: email, password: password);
  //   if (res == "Success") {
  //     print(res);
     
  // }
  //     return;
    // }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an account',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
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
            DropdownButtonFormField(
                value: valuechoose,
                onTap: () {},
                items: selectList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    valuechoose = value as String;
                  });
   }),
            // RaisedButton(
            //   onPressed: () {
            //     // Handle sign up functionality
            //     String name = _nameController.text;
            //     String email = _emailController.text;
            //     String password = _passwordController.text;

            //     // Perform sign up actions
            //   },
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: Text('Sign Up'),
            // ),
            ElevatedButton(
              
              onPressed: () =>AuthServices.signup(
                      email: _usernameController.text.trim(),
                      password: _passwordController.text.trim(),
                      name: _nameController.text.trim(),
                      role: valuechoose.toString(), phone: '',
              )
                
                // Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                           builder: (context) =>
                //                               LoginScreen()));

              ,child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              ),
            // FlatButton(
            //   onPressed: () {
            //     // Handle login screen navigation
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => LoginScreen()),
            //     );
            //   },
            //   child: Text('Already have an account? Login'),
            // ),
             TextButton(
                  onPressed: () {
                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
                  },
                  child: const Text('Already have an account? Login'),
              ),
          ],
        ),
      ),
    );
  }
}


