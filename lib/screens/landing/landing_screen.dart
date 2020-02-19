import 'package:cic/screens/calculate/calculate_screen.dart';
import 'package:cic/screens/landing/widgets/landing_screen_widgets.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            LandingButton(
              title: "Calculate: Total Amount",
              subTitle: "with Principal, ROI and No of Years",
              bgColor: Colors.blue.shade600,
              onPressed: () {
                openNextScreen(context, Page.ta);
              },
            ),
            LandingButton(
              title: "Calculate: ROI",
              subTitle: "with Principal, No of Years and Total Amount",
              bgColor: Colors.blue.shade600,
              onPressed: () {
                openNextScreen(context, Page.roi);
              },
            ),
            LandingButton(
              title: "Calculate: No of Years",
              subTitle: "with Principal, ROI and Total Amount",
              bgColor: Colors.blue.shade600,
              onPressed: () {
                openNextScreen(context, Page.noy);
              },
            ),
            LandingButton(
              title: "Calculate: Principal",
              subTitle: "with ROI, No of Years and Total Amount",
              bgColor: Colors.blue.shade600,
              onPressed: () {
                openNextScreen(context, Page.principal);
              },
            ),
//            LandingButton(
//              title: "Hybrid Calculator",
//              subTitle: "with Principal, ROI and No of Years",
//              bgColor: Colors.blue.shade600,
//              onPressed: () {
//                openNextScreen(context, Page.hybrid);
//              },
//            ),
          ],
        ),
      ),
    );
  }

  openNextScreen(BuildContext context, Page page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalculateScreen(page: page)),
    );
  }
}

enum Page { hybrid, ta, roi, noy, principal }
