import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/home.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});
  static const String id='signup';

  @override
  Widget build(BuildContext context) {


    FirebaseAuth _auth =FirebaseAuth.instance;
    final _formkey=GlobalKey<FormState>();
    final emailController=TextEditingController();
    final passwordController=TextEditingController();

    return Scaffold(
appBar: AppBar(
  title: Text('SIGNUP'),
  backgroundColor: Colors.green,
  centerTitle: true,
),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'enter email',
                labelStyle: TextStyle(fontSize: 30,color: Colors.black),
                prefixIcon: Icon(Icons.mail),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.green),
                ),
                fillColor: Colors.grey,
                filled: true,
              ),


            ),

            SizedBox(height: 30,),

            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'enter password',
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(30),
                )
              ),
            ),
            SizedBox(height: 50,),

            ElevatedButton(onPressed: () async {
              try{
                UserCredential usercredentials= await _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
              print('User Registered: ${usercredentials.user?.uid}');
              Navigator.pushNamed(context, home.id);
              
              }
              catch (e){
                print('Registration failed due to $e');
              }
            }, child: Text('Sign up')),



            ElevatedButton(onPressed:  () async{
              try{
                _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
                print('Signed in successfully');
              } catch(e){
                print('signed in failed due to $e');
              }
            }, child: Text('sign in')),




            ElevatedButton(onPressed:  () async{
              try{
                _auth.signOut();
                print('Signed out successfully');
              } catch(e){
                print('signed out failed due to $e');
              }
            }, child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
