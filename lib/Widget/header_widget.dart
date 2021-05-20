import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    String date =
        DateFormat.yMMMMEEEEd().format(DateTime.parse(now.toString()));
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              date,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'DUBAI',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Icon(Icons.pin_drop,color: Colors.white,size: 25,),
               Align(alignment: Alignment.center,
               child:Text(
                 '25.2 , 55.2',
                 style: TextStyle(
                     color: Colors.white,
                     fontSize: 25,
                     fontWeight: FontWeight.w300),
               ), ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'United Arab Emirates',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
