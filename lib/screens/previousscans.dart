import 'package:flutter/material.dart';

class Previousscans extends StatefulWidget {
  const Previousscans({ Key? key }) : super(key: key);

  @override
  State<Previousscans> createState() => _PreviousscansState();
}

class _PreviousscansState extends State<Previousscans> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
		    	title: Text (
                    "Previous Scans",
                    style: TextStyle (
                        color: Colors.white,
                    ),
                ),
                backgroundColor: Color.fromRGBO(49, 163, 139, 0.663),
                elevation: 0,
            ),
            body: Container (
                child: Center(
                    child: Text("To be announced.")
                ),
            ),
        );
    }
}