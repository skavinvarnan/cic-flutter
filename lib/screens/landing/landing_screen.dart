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
              title: "Total Amount Calculator",
              subTitle: "with Principal, ROI and No of Years",
              bgColor: Colors.indigo.shade600,
              onPressed: () {
                openNextScreen(context, Page.ta);
              },
            ),
            LandingButton(
              title: "ROI Calculator",
              subTitle: "with Principal, No of Years and Total Amount",
              bgColor: Colors.indigo.shade600,
              onPressed: () {
                openNextScreen(context, Page.roi);
              },
            ),
            LandingButton(
              title: "Time Period Calculator",
              subTitle: "with Principal, ROI and Total Amount",
              bgColor: Colors.indigo.shade600,
              onPressed: () {
                openNextScreen(context, Page.noy);
              },
            ),
            LandingButton(
              title: "Principal Calculator",
              subTitle: "with ROI, No of Years and Total Amount",
              bgColor: Colors.indigo.shade600,
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
