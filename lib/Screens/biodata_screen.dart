import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BioDataScreen extends StatelessWidget {
  final String title;
  final String buttonlabel;
  const BioDataScreen({
    super.key,
    required this.title,
    required this.buttonlabel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector
              (onTap: (){},
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    buttonlabel,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Name',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 250),
              child: TextField(
                keyboardType:
                    TextInputType.number, // Allow only numerical input
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Only allow digits (0-9)
                  LengthLimitingTextInputFormatter(
                      2), // Limit the input to 2 characters
                ],
                decoration: InputDecoration(
                  hintText: 'Age',
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 2,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Place',
                    hintText: 'Place',
                    border: OutlineInputBorder(),
                    focusColor: Colors.yellow[100]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Content',
                    hintText: 'Content',
                    alignLabelWithHint: true),
                maxLength: 350,
                maxLines: 15,
              ),
            ),
          ],
        ));
  }
}
