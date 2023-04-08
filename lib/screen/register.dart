import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({Key? key}) : super(key: key);
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();

  Future addUser()async{
    CollectionReference users = await FirebaseFirestore.instance.collection('registrationInfo');

    users.add(({
      "email": _email.text,
      "first_name" : _firstName.text,
      "last_name": _lastName.text,
      "phone":_phone.text,

    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _firstName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter your first name",
                border: OutlineInputBorder(),
              ),
              validator: (controller){},
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _lastName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter your last name",
                border: OutlineInputBorder(),
              ),
              validator: (controller){},
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                border: OutlineInputBorder(),
              ),
              validator: (controller){},
            ),
            SizedBox(height: 10,),
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
            MaterialButton(
              height: 55,
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: (){
                addUser();
              },child: Text("Register"),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                }, child: Text("Sign In"))
              ],)
          ],
        ),
      ),
    );
  }
}
