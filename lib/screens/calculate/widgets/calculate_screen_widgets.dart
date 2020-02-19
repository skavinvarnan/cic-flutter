import 'package:cic/screens/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class CalculateTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final String hint;

  CalculateTextField({
    @required this.textEditingController,
    @required this.label,
    @required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: this.textEditingController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 0.0),
          ),
          labelText: this.label,
          hintText: this.hint,
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answer;
  final Page page;

  Answer({@required this.answer, @required this.page});

  @override
  Widget build(BuildContext context) {
    String prefix;
    switch (this.page) {
      case Page.ta:
        prefix = "Amount";
        break;
      case Page.roi:
        prefix = "Rate of Interest";
        break;
      case Page.noy:
        prefix = "No of years";
        break;
      case Page.principal:
        prefix = "Principal";
        break;
      case Page.hybrid:
        break;
    }
    if (this.answer != null) {
      return Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(
              prefix,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              this.answer,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

class InputFields extends StatelessWidget {
  final Page page;
  final TextEditingController principalController;
  final TextEditingController roiController;
  final TextEditingController noyController;
  final TextEditingController totalAmountController;

  InputFields({
    @required this.page,
    @required this.principalController,
    @required this.roiController,
    @required this.noyController,
    @required this.totalAmountController,
  });

  @override
  Widget build(BuildContext context) {
    switch (this.page) {
      case Page.ta:
        return Column(
          children: <Widget>[
            CalculateTextField(
              hint: 'Enter principal',
              label: 'Principal',
              textEditingController: principalController,
            ),
            CalculateTextField(
              hint: 'Enter rate of interest',
              label: 'Rate of Interest',
              textEditingController: roiController,
            ),
            CalculateTextField(
              hint: 'Enter no of years',
              label: 'No of Years',
              textEditingController: noyController,
            ),
          ],
        );
        break;
      case Page.roi:
        return Column(
          children: <Widget>[
            CalculateTextField(
              hint: 'Enter principal',
              label: 'Principal',
              textEditingController: principalController,
            ),
            CalculateTextField(
              hint: 'Enter no of years',
              label: 'No of Years',
              textEditingController: noyController,
            ),
            CalculateTextField(
              hint: 'Enter total amount',
              label: 'Total Amount',
              textEditingController: totalAmountController,
            ),
          ],
        );
        break;
      case Page.noy:
        return Column(
          children: <Widget>[
            CalculateTextField(
              hint: 'Enter principal',
              label: 'Principal',
              textEditingController: principalController,
            ),
            CalculateTextField(
              hint: 'Enter rate of interest',
              label: 'Rate of Interest',
              textEditingController: roiController,
            ),
            CalculateTextField(
              hint: 'Enter total amount',
              label: 'Total Amount',
              textEditingController: totalAmountController,
            ),
          ],
        );
        break;
      case Page.principal:
        return Column(
          children: <Widget>[
            CalculateTextField(
              hint: 'Enter rate of interest',
              label: 'Rate of Interest',
              textEditingController: roiController,
            ),
            CalculateTextField(
              hint: 'Enter no of years',
              label: 'No of Years',
              textEditingController: noyController,
            ),
            CalculateTextField(
              hint: 'Enter total amount',
              label: 'Total Amount',
              textEditingController: totalAmountController,
            ),
          ],
        );
        break;
      case Page.hybrid:
        return Column(
          children: <Widget>[
            CalculateTextField(
              hint: 'Enter principal',
              label: 'Principal',
              textEditingController: principalController,
            ),
            CalculateTextField(
              hint: 'Enter rate of interest',
              label: 'Rate of Interest',
              textEditingController: roiController,
            ),
            CalculateTextField(
              hint: 'Enter no of years',
              label: 'No of Years',
              textEditingController: noyController,
            ),
            CalculateTextField(
              hint: 'Enter total amount',
              label: 'Total Amount',
              textEditingController: totalAmountController,
            ),
          ],
        );
        break;
    }
    return Column(
      children: <Widget>[
        CalculateTextField(
          hint: 'Enter principal',
          label: 'Principal',
          textEditingController: principalController,
        ),
        CalculateTextField(
          hint: 'Enter rate of interest',
          label: 'Rate of Interest',
          textEditingController: roiController,
        ),
        CalculateTextField(
          hint: 'Enter no of years',
          label: 'No of Years',
          textEditingController: noyController,
        ),
        CalculateTextField(
          hint: 'Enter total amount',
          label: 'Total Amount',
          textEditingController: totalAmountController,
        ),
      ],
    );
  }
}
