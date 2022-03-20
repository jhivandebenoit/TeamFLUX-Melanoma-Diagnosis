import 'package:chat_ui/screens/chats.dart';
import 'package:chat_ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

	final	Function toggle;
	SignIn(this.toggle);
	
	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    bool isLoading = false;

    loginUser() {
    // if (formKey.currentState!.validate()) {
        
    // 	Map<String, String> userInfoMap = {
    // 			"name" : userNameTextEditingController.text,
    // 			"email" : emailTextEditingController.text
    // 		};
            
        setState(() {
            isLoading = true; 
        });

    // 	authMethods.signUpwithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val) {
    // 		// print("${val.userId}");

    // 		// databaseMethods.uploadUserInfo(userInfoMap);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => ChatRoom()
            )   );
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
                                                    TextField(
                                                        decoration: inputFeildDecoration ("Email"),
                                                    ),
                                                  SizedBox(height: 20.0),
            
                                                      TextField(
                                                          obscureText: true,
                                                          decoration: inputFeildDecoration ("Password"),
                                                      ),
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
                                                              loginUser();
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
