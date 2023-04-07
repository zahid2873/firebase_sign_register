import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sign_register/screen/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHelper{

  Future signUp(email,password,context)async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user!.uid.isNotEmpty){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
      }
      else{
        print("Not valid");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }
}