import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/model/user_model.dart';
import 'package:ticketbookapp/screens/bottom_bar.dart';
import 'package:ticketbookapp/screens/login_screen.dart';

import '../utils/app_style.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _formkey= GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;


  final TextEditingController firstnameController=TextEditingController();
  final TextEditingController lastnameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController cnfpasswordController=TextEditingController();




  @override
  Widget build(BuildContext context) {
    //first name field
    final TextFormField firstnamefield= TextFormField(
      autofocus: false,

      controller: firstnameController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("FirstName cannot be empty!");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid FirstName(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value){
        firstnameController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //last name
    final TextFormField lastnamefield= TextFormField(
      autofocus: false,

      controller: lastnameController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("LastName cannot be empty!");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid lastName(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value){
        lastnameController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.account_circle),
        contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //email field
    final TextFormField emailfield= TextFormField(
      autofocus: false,

      controller: emailController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.email),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //password field
    final TextFormField passwordfield= TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
      onSaved: (value){
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //cnf password field
    final TextFormField cnfpasswordfield= TextFormField(
      autofocus: false,
      obscureText: true,
      controller: cnfpasswordController,
       validator: (value){
        if(cnfpasswordController.text != passwordController.text){
          return "Password dont match";
        }
        return null;
       },
      onSaved: (value){
        cnfpasswordController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );



    //registration btn
    final signup=Container(

      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xD91130CE),
        child: MaterialButton(
          padding: const EdgeInsets.all(10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: (){
            signUp(emailController.text, passwordController.text);
          },
          child: Text("SignUp",style: Styles.textStyle1.copyWith(color: Colors.white ,fontSize: 17),),
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          //backbtn
          leading: IconButton(
            onPressed: (){
              //to navigate to the root
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginScreen()));
            },
              icon: const Icon(Icons.arrow_back),
            
          ),
      ),
      backgroundColor: Styles.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Image.asset("assets/images/ticket.png",fit: BoxFit.contain,),
                      ),
                      const Gap(40),
                      // Gap(AppLayout.getHeight(40)),
                      firstnamefield,
                      const Gap(10),
                      // Gap(AppLayout.getHeight(10)),
                      lastnamefield,
                      const Gap(10),
                      // Gap(AppLayout.getHeight(10)),
                      emailfield,
                      const Gap(10),
                      // Gap(AppLayout.getHeight(10)),
                      passwordfield,
                      const Gap(10),
                      // Gap(AppLayout.getHeight(10)),
                      cnfpasswordfield,
                      const Gap(20),
                      // Gap(AppLayout.getHeight(20)),
                      signup,
                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );


  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
          postDetailsToFirestore()
          })
          .catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }

    }

  void postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel=UserModel();
    userModel.email=user!.email;
    userModel.uid=user.uid;
    userModel.firstName= firstnameController.text;
    userModel.lastName=lastnameController.text;
    userModel.password=passwordController.text;

    //convert the password to the hashable using sha256//

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    
    Fluttertoast.showToast(msg: "Account Created Successfully!!");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomBar()),
            (route) => false);

  }







}
