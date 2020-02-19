import 'package:flutter/material.dart';

class LandingButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onPressed;
  final Color bgColor;

  LandingButton({
    @required this.title,
    @required this.subTitle,
    @required this.onPressed,
    @required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: this.bgColor,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                this.title,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
