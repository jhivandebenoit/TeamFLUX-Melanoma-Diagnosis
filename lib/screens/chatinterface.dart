import 'dart:html';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:dialogflow_flutter/message.dart';

class MyHomePage extends StatefulWidget {
	// MyHomePage({  Key? key,  required this.title }) : super(key: key);
	// final String title ;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

File? selectedImage;
String? message = " ";

class _MyHomePageState extends State<MyHomePage> {
// this is the Dialogflow API call and its commented out for the Python file @Nemsara 

	void response(query) async {
		AuthGoogle authGoogle = await AuthGoogle(
				fileJson: "assets/melano-chatbot-nlru-8b72c52e3531.json"
				) .build() ;
		DialogFlow dialogflow = DialogFlow( authGoogle: authGoogle, language: Language.english);
		AIResponse aiResponse = await dialogflow.detectIntent(query);
		setState(() {
			messages.insert(0, {
				"data": 0,
				"message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
			});
		});

		print( aiResponse.getListMessage()[0]["text"]["text"][0].toString() );
		
	}

	final messageInsert = TextEditingController();
	List<Map> messages = [ ];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text (
                    "Scan",
                    style: TextStyle (
                        color: Colors.white,
                    ),
                ),
                backgroundColor: Color.fromRGBO(49, 163, 139, 0.663),
                elevation: 0,
            ),

			body: Container ( 
				child: Column (
					children: <Widget> [

            // ignore: prefer_const_constructors
            // Nems edit
            if (selectedImage == null) Text("Choose an image to uploade") else Image.file(selectedImage!)
            
						Flexible(child: ListView.builder  (
							reverse:  true,
							itemCount: messages.length,
							itemBuilder: (context, index) => chat (
								messages[index] ["message"].toString(),
								messages[index] ["data"]
							)
						)
						),

						SizedBox( height: 20.0 ),

						Divider( 
							height: 5.0,
						),

					Container(
						child: ListTile (

							title: Container (
								height: 35,
								decoration:  BoxDecoration (
									borderRadius: BorderRadius.all(Radius.circular(15)),
									color: Color.fromRGBO(220, 220, 220, 1),
								),

								padding: EdgeInsets.only(left: 15),
								child: TextFormField (
									controller: messageInsert,
									decoration: InputDecoration (
										hintText: "Ask your question here...",
										hintStyle: TextStyle (
											color:  Colors.black45
										),
										
										border:  InputBorder.none,
										focusedBorder: InputBorder.none,
										enabledBorder: InputBorder.none,
										errorBorder: InputBorder.none,
										disabledBorder: InputBorder.none,
									),

									style: TextStyle (
										fontSize: 15,
										color: Colors.black
									),

									onChanged: (value) { },

									),
								),
 
								leading: IconButton ( 

                                    icon: Icon (
                                        Icons.camera_alt,
                                        size: 28.0,
                                    ),
                                    onPressed: () {
                                      //-----------------------------------
                                              
                                                                    
                                    },
							),

								trailing: IconButton (
									
									icon:  Icon(
										Icons.send,
										size: 30.0,
									),

									onPressed: () { 
										if (messageInsert.text.isEmpty) {
											print("Message is Empty");
										} else {
											setState(() {
											messages.insert(0,
													{ "data" : 1, "message" : messageInsert.text } );
											});

											response(messageInsert.text);
											messageInsert.clear();
										}

										FocusScopeNode currentFocus = FocusScope.of(context);
										if ( !currentFocus.hasPrimaryFocus ) {
											currentFocus.unfocus();
										}
									}
								),
							),
						),

						SizedBox( height: 10.0 )

					],
				),
			),
		);
	}

	Widget chat (String message, int data) {
		return Container(
			padding: EdgeInsets.only(left: 10, right: 10),

			child: Row(
				mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
				children: [
					data == 0 ? Container(
						height: 40.0,
						width: 40.0,
						child: CircleAvatar (
							backgroundImage: AssetImage ("assets/images/Logo-draft-clear-2.png"),
						),
					) : Container(),

					Padding (
						padding: EdgeInsets.all(5.0),
						child: Bubble (
							radius: Radius.circular(5.0),
							color: data==0 ? Color.fromARGB(255, 49, 163, 138) : Color.fromARGB(255, 49, 135, 192),
							elevation: 0.0,

							child:  Padding (
								padding: EdgeInsets.all(2.0),
								child: Row(
									mainAxisSize: MainAxisSize.min,
									children: <Widget> [
										SizedBox( width: 10.0 ),

										Flexible(
											child: Container (
												constraints: BoxConstraints (maxWidth: 200),
												child: Text (
													message,
													style: TextStyle (
														color: Colors.white,
														fontWeight: FontWeight.bold,
													),
												),
											)
										)
									],
								),
							)
						),
					),

					data == 1 ? Container (
						// height: 60.0,
						// width: 60.0,
						// child: CircleAvatar (
						// 	backgroundImage: AssetImage("assets/default.jpg"),
						// 	),
					) : Container() ,

				],
			),
			
		);
	}
}
