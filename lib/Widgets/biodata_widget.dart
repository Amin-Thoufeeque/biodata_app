import 'package:biodata_app/Screens/biodata_screen.dart';
import 'package:flutter/material.dart';

class BiodataWidget extends StatelessWidget {
  const BiodataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const BioDataScreen();
            },
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[500],
              borderRadius: BorderRadius.circular(15)),
          child:const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Text(
                  'Name:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
