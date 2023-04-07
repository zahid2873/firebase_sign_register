import 'package:firebase_sign_register/helpers/my_helpers.dart';
import 'package:firebase_sign_register/screen/sign_up.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
   SignInPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(),
              ),
              validator: (controller){},
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(),
              ),
              validator: (controller){},
            ),
            SizedBox(height: 10,),
            MaterialButton(
              height: 55,
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: (){
                var e = email.text;
                var p = password.text;
                var obj = MyHelper().signIn(e, p, context);
              },child: Text("Sign In"),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't have an account? "),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
              }, child: Text("Sign Up"))
            ],)
          ],
        ),
      ),
    );
  }
}
