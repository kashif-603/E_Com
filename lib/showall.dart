import 'package:flutter/cupertino.dart';

class showAll extends StatefulWidget {
  @override
  State<showAll> createState() => _showAllState();
}

class _showAllState extends State<showAll> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('leftside',
        style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          )
        ),
        Text('Showall',
            style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            )
        )

      ],
    ),
    );
  }
}