import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}
class _MyloginState extends State<Mylogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image:  const DecorationImage(image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(
            children: [
              Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 
                children: [
                  Container(                
                    //padding:  EdgeInsets.only(left: 35,top: 33),
                    child: Text('              Quickpass', textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                    ),),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,
                  right: 35,
                  left: 35 ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 248, 249, 249),
                          filled: true,
                          hintText: 'Email or Username',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                         decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 248, 249, 249),
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                     
                      ),
                       SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HomeScreen()));}, icon: Icon(Icons.login), label: Text('LOGIN')),
                      
                       SizedBox(
                        height: 50,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          
                          Text('Forget Password?',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          
                          )
              
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     
                      Row(
                      
                        children: [
                          TextButton(onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          }, 
                          child: Text('New to Quickpass?Sign Up',
                          style: TextStyle(decoration: TextDecoration.underline,fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          style: ButtonStyle(),
                          )
              
                        ],
                      )
              
                    ],
                  ),
                ),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
