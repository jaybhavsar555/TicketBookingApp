import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'package:ticketbookapp/screens/regis_screen.dart';
import 'package:ticketbookapp/utils/app_style.dart';

import 'bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editTeext controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? value;


  @override
  Widget build(BuildContext context) {
    //text email field
    final TextFormField emailfield = TextFormField(
      autofocus: false,

      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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

      // validator: (){},
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //password text field
    final TextFormField passwordfield = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      // validator: (){},
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
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Login
    final loginbtn = Container(

      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xD91130CE),
        child: MaterialButton(
          padding: const EdgeInsets.all(10),
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          onPressed: () {
            //go to the HomeScreen
             signIn(context, emailController.text, passwordController.text);
          },
          child: Text("login", style: Styles.textStyle1.copyWith(
              color: Colors.white, fontSize: 17),),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Image.asset(
                          "assets/images/ticket.png", fit: BoxFit.contain,),
                      ),
                      // Gap(AppLayout.getHeight(40)),
                      const Gap(40),
                      emailfield,
                      const Gap(17),
                      // Gap(AppLayout.getHeight(17)),
                      passwordfield,
                      const Gap(27),
                      // Gap(AppLayout.getHeight(27)),
                      loginbtn,
                      const Gap(10),
                      // Elevat edButton(onPressed:() {
                      //   //go to the HomeScreen
                      //   signIn(context, emailController.text, passwordController.text);
                      // },
                      //     child: Text("Login")),
                      // Gap(AppLayout.getHeight(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const Text("Don`t have account?"),
                          // Gap(AppLayout.getHeight(3)),
                          const Gap(3),
                          GestureDetector(

                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      const RegisterationScreen()));
                            },

                            child: Text("SignUp",
                              style: Styles.ticketTextStyle1.copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
  // login function
  void signIn(BuildContext context, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) =>
        {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const BottomBar())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        // print(error.code);
      }
    }
  }

}
