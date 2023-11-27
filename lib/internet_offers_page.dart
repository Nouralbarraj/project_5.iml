import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Offers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InternetOffersPage(),
    );
  }
}
class InternetOffersPage extends StatefulWidget {
  @override
  _InternetOffersPageState createState() => _InternetOffersPageState();
}

class _InternetOffersPageState extends State<InternetOffersPage> {
  bool isStudent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Offers'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Are you a student?'),
            trailing: Checkbox(
              value: isStudent,
              onChanged: (value) {
                setState(() {
                  isStudent = value ?? false;
                });
              },
            ),
          ),
          OfferItem(name: 'Basic Internet', price: 29.99, isStudent: isStudent),
          OfferItem(name: 'High Speed Internet', price: 49.99, isStudent: isStudent),
          OfferItem(name: 'Premium Internet', price: 69.99, isStudent: isStudent),
          // Add more offer items as needed
        ],
      ),
    );
  }
}

class OfferItem extends StatelessWidget {
  final String name;
  final double price;
  final bool isStudent;

  OfferItem({required this.name, required this.price, required this.isStudent});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('\$${price.toStringAsFixed(2)}'),
      onTap: () {
        // Show a message with the new price and discount information
        showPriceMessage(context, name, price, isStudent);
      },
    );
  }

  void showPriceMessage(BuildContext context, String offerName, double offerPrice, bool isStudent) {
    // Calculate the new price based on the discount for students
    final discount = isStudent ? 0.5 : 0.0;
    final newPrice = offerPrice * (1 - discount);

    // Build the message
    String message = 'You selected $offerName.';

    if (isStudent) {
      message += ' If you are a student, you get a 50% discount!';
    } else {
      message += ' No discount applied.';
    }

    message += ' You have to pay \$${newPrice.toStringAsFixed(2)}';

    // Display an AlertDialog with the message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Details'),
          content: Text(message),
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
  }
}
