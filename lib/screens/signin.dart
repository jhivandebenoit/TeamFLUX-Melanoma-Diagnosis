import 'package:chat_ui/screens/chats.dart';
import 'package:chat_ui/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/services/authentication.dart';
import 'package:chat_ui/services/database.dart';
import 'package:chat_ui/helper/authenticate.dart';

class SignIn extends StatefulWidget {

	final	Function toggle;
	SignIn(this.toggle);
	
	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();

    AuthMethods authService = new AuthMethods();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              emailTextEditingController.text, passwordTextEditingController.text)
          .then((result) async {
        if (result != null)  {
        //   QuerySnapshot userInfoSnapshot =
        //       await DatabaseMethods().getUserInfo(emailTextEditingController.text);

        //   HelperFunctions.saveUserLoggedInSharedPreference(true);
        //   HelperFunctions.saveUserNameSharedPreference(
        //       userInfoSnapshot.documents[0].data["userName"]);
        //   HelperFunctions.saveUserEmailSharedPreference(
        //       userInfoSnapshot.documents[0].data["userEmail"]);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar (
				title: Center(
				  child: Image.asset("assets/images/AppBar2.png",
				  height: 30,
				  ),
				),
                backgroundColor: Colors.white,
                elevation: 0,
			),

			body: isLoading ? Container(
				child: Center (
					child: CircularProgressIndicator()
					), 
				) : SingleChildScrollView(
                          child: Container(
                              alignment: Alignment.bottomCenter,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                                                  child: Column (
                                                      mainAxisSize: MainAxisSize.min,
                                                  children: [ 
                                                    SizedBox(height: 80.0),
                                                      Form(
                                                          key: formKey,
                                                          child: Column(
                                                              children: [
                                                                  TextFormField(
                                                                        validator: (val) {
                                                                            return RegExp(
                                                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                                                    .hasMatch(val!)
                                                                                ? null
                                                                                : "Please Enter Correct Email";
                                                                        },
                                                                        controller: emailTextEditingController,
                                                                        decoration: inputFeildDecoration("Email"),
                                                                        ),
                                                                        TextFormField(
                                                                        obscureText: true,
                                                                        validator: (val) {
                                                                            return val!.length > 6
                                                                                ? null
                                                                                : "Enter Password 6+ characters";
                                                                        },
                                                                        controller: passwordTextEditingController,
                                                                        decoration: inputFeildDecoration("Password"),
                                                                        ),
                                                              ]),
                                                      ),

                                                //     TextField(
                                                //         controller: emailTextEditingController,
                                                //         decoration: inputFeildDecoration ("Email"),
                                                //     ),
                                                //   SizedBox(height: 20.0),
            
                                                //       TextField(
                                                //           obscureText: true,
                                                //           controller: passwordTextEditingController,
                                                //           decoration: inputFeildDecoration ("Password"),
                                                //       ),
                                                  SizedBox(height: 20.0),
            
                                                      Container(
                                                          child: Container ( 
                                                              alignment: Alignment.centerRight,
                                                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                                              child: Text (
                                                                  "Forgot Password",
                                                                  style: TextStyle (
                                                                      fontSize: 14.0
                                                                  ),
                                                              ),
                                                          ),
                                                      ),
                                                      SizedBox( height: 15.0),

                                                      GestureDetector(
                                                          onTap: () {
                                                              signIn();
                                                          },
                                                      
                                                      child: Container(
                                                          alignment: Alignment.center,
                                                          width: MediaQuery.of(context).size.width,
                                                          padding: EdgeInsets.symmetric(vertical: 20),
                                                          decoration: BoxDecoration(
                                                              gradient: LinearGradient (
                                                                  colors:  [
                                                                      const Color.fromARGB(169, 49, 163, 139),
                                                                      const Color.fromARGB(178, 49, 163, 138), 
                                                                      ]
                                                              ),
                                                              borderRadius: BorderRadius.circular(25)
                                                          ),
                                                          child: Text (
                                                              "Login",
                                                              style: TextStyle (
                                                                  fontSize: 18.0,
                                                                  color: Colors.white,
                                                              ),
                                                          ),
                                                      ),
                                                    ),
                                                    
                                                      SizedBox(height: 20.0),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                              Text ("Dont have an account? "),
                                                              GestureDetector (
                                                                  onTap: () {
                                                                      widget.toggle();
                                                                  },
                                                                  child: Container(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                  child: Text(
                                                                      " Sign Up here ",
                                                                      style: TextStyle (
                                                                          decoration: TextDecoration.underline
                                                                      ),
                                                                      ),
                                                                  ),
                                                              )
                                                          ],
                                                      ),
                                                      SizedBox(height: 100.0),
                                                  ],
                                              ),
                                          ),
                          ),
                        ),
		);
	}
}
