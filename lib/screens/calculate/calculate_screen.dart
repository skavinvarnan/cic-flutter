import 'package:cic/screens/calculate/widgets/calculate_screen_widgets.dart';
import 'package:cic/screens/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculateScreen extends StatefulWidget {
  final Page page;

  CalculateScreen({Key key, @required this.page}) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  TextEditingController principalController = new TextEditingController();
  TextEditingController roiController = new TextEditingController();
  TextEditingController noyController = new TextEditingController();
  TextEditingController totalAmountController = new TextEditingController();
  String answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.getTitle(),
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: <Widget>[
                InputFields(
                  page: widget.page,
                  noyController: noyController,
                  principalController: principalController,
                  roiController: roiController,
                  totalAmountController: totalAmountController,
                ),
                Answer(answer: this.answer, page: widget.page),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.lightBlue,
                      onPressed: () {
                        this.answer = getAnswer(
                          widget.page,
                          principalController,
                          roiController,
                          noyController,
                          totalAmountController,
                        );
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {});
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTitle() {
    switch (this.widget.page) {
      case Page.hybrid:
        return "Hybrid Calculator";
      case Page.ta:
        return "Calculate: Total Amount";
      case Page.noy:
        return "Calculate: No of Years";
      case Page.principal:
        return "Calculate: Principal";
      case Page.roi:
        return "Calculate: Rate of Interest";
    }
    return null;
  }

  String getAnswer(
      Page page,
      TextEditingController principalController,
      TextEditingController roiController,
      TextEditingController noyController,
      TextEditingController totalAmountController) {
    int n = 1;
    double principal =
        double.tryParse(principalController.text) ?? double.infinity;
    double roi = double.tryParse(roiController.text) ?? double.infinity;
    double noy = double.tryParse(noyController.text) ?? double.infinity;
    double ta = double.tryParse(totalAmountController.text) ?? double.infinity;

    if ((page != Page.ta && ta == double.infinity) ||
        (page != Page.noy && noy == double.infinity) ||
        (page != Page.roi && roi == double.infinity) ||
        (page != Page.principal && principal == double.infinity)) {
      return null;
    }

    switch (page) {
      case Page.ta:
        String s = (principal * pow((1 + (roi / (n * 100))), (n * noy)))
            .toStringAsFixed(2);
        return num.parse(s).toString();
        break;
      case Page.roi:
        double someData = (log10(ta) - log10(principal)) / (n * noy);
        double temp = pow(10, someData);
        String s = ((temp - 1) * (n * 100)).toStringAsFixed(2);
        return num.parse(s).toString();
        break;
      case Page.noy:
        String s = ((log10(ta) - log10(principal)) /
                (n * (log10(1 + (roi / (n * 100))))))
            .toStringAsFixed(2);
        return num.parse(s).toString();
        break;
      case Page.principal:
        String s =
            (ta / pow((1 + (roi / (n * 100))), (n * noy))).toStringAsFixed(2);
        return num.parse(s).toString();
        break;
      case Page.hybrid:
        break;
    }
    return null;
  }

  double log10(double num) {
    return log(num) / ln10;
  }
}
