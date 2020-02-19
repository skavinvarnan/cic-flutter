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

  Answer({@required this.answer});

  @override
  Widget build(BuildContext context) {
    if (this.answer != null) {
      return Container(
        margin: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            this.answer,
            style: TextStyle(fontSize: 24),
          ),
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
