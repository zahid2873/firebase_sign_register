import 'package:flutter/material.dart';

import 'sign_in.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(),
              ),
              validator: (controller){},
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _password,
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
              onPressed: (){},child: Text("Sign up"),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                }, child: Text("Sign In"))
              ],)
          ],
        ),
      ),
    );
  }
}
