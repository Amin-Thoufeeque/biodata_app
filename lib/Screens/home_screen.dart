import 'package:biodata_app/DataBase/db_functions.dart';
import 'package:biodata_app/Screens/biodata_screen.dart';
import 'package:flutter/material.dart';

import '../Widgets/biodata_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'Biodata Manager',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: biodataNotifier,
            builder: (BuildContext ctx, value, _) {
              DBFunctions.instance.getBiodata();
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return BioDataScreen(
                                  title: 'Create biodata',
                                  buttonlabel: 'Create',
                                );
                              },
                            ));
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 35,
                          ),
                          label: const Text(
                            'Add Biodata',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: value.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final data = value[index];
                      final dataid = data.id;
                      final dataname = data.name;
                      final dataage = data.age;
                      if (dataid == null) {
                        print('null id');
                        return null;
                      }
                      return BiodataWidget(
                        id: dataid,
                        name: dataname,
                        age: dataage,
                      );
                    },
                  ),
                ],
              );
            }));
  }
}
