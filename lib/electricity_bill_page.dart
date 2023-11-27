import 'package:flutter/material.dart';

class ElectricityBillPage extends StatefulWidget {
  @override
  _ElectricityBillPageState createState() => _ElectricityBillPageState();
}

class _ElectricityBillPageState extends State<ElectricityBillPage> {
  final TextEditingController kwController = TextEditingController();
  double rateCost = 0.28; // Example rate cost per kilowatt-hour

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Electricity Bill')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the value of kW:'),
            TextField(
              controller: kwController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double kwValue = double.tryParse(kwController.text) ?? 0.0;
                double result = kwValue * rateCost;

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Electricity Bill Result'),
                      content: Text('The result is: \$${result.toStringAsFixed(2)}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
