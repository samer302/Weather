import 'package:flutter/material.dart';
import 'customizeText.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
   const LoadingWidget({this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomizeText(
            title: message,
            textAlign: TextAlign.center,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}

/*class LoadingWidget extends StatefulWidget {
  final String message;
const  LoadingWidget(this.message);
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
   child: Column(
     children: [
CustomizeText(title: message),
     ],
   ),
    );
  }
}*/
