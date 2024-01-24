import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             TextFormField(
               controller: email,
               keyboardType: TextInputType.emailAddress,
               decoration: const InputDecoration(
                 hintText: "Email"
               ),
             ),
             const SizedBox(height: 20,),
             TextFormField(
               controller: pass,
               decoration: const InputDecoration(
                 hintText: "Password"
               ),
             ),
             const SizedBox(height: 20),
             GestureDetector(
               onTap: ()  {
                saveData();
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => const HomePage(),
                   ),
                 );

               },
               child: Container(
                 height: 50,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Colors.orange,
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: const Center(child: Text("Login",)),
               ),
             )
           ],
         ),
       ),
    );
  }

   saveData() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('username', email.text);
     await prefs.setString('userPass', pass.text);
  }
}
