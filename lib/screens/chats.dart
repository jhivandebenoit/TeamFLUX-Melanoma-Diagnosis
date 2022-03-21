import 'package:chat_ui/screens/chatinterface.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
	@override
	_ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

	// AuthMethods authMethods = new AuthMethods();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar (
				title: Center(
				  child: Image.asset("assets/images/AppBar2.png",
				  height: 30,
				  ),
				),
                backgroundColor: Colors.white,
                elevation: 0,
			),
				// actions: [
				// 	GestureDetector(
				// 		onTap: () {
				// 			// authMethods.signOut();
				// 			Navigator.pushReplacement(context, MaterialPageRoute(
				// 			builder: (context) => Authenticate() 
				// 			));
				// 		},
				// 		child: Container (
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(60),
                //                   color: Colors.grey[350],
                //               ),
				// 			padding: EdgeInsets.symmetric (horizontal:20.0),
				// 			child: Icon(Icons.logout_outlined),
				// 		),
				// 	),
				// ],
			// ),
			body: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					GestureDetector(
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyHomePage()
                            ));
                        },
                        child: Center (
                            child: Card (
                                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                                child : Padding (padding: EdgeInsets.all(20.0),
                              child: Text (
                                  "Scan for Melanoma",
                                  style : TextStyle (
                                      fontSize: 18.0,
                                      color : Colors.black,
                                  ),
                              ),
                            ),
                        ),
                    ),
                    ),
					Text (
						"Option 2",
						style : TextStyle (
							fontSize: 18.0,
							color : Colors.black,
						),
					),
					Text(
						"Option 3",
						style : TextStyle (
							fontSize: 18.0,
							color : Colors.black,
						),
					),Text(
						"Option 4",
						style : TextStyle (
							fontSize: 18.0,
							color : Colors.black,
						),
					)
				],
			),
		);
	}
}