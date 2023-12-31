import 'package:biodata_app/DataBase/db_functions.dart';
import 'package:biodata_app/Screens/biodata_screen.dart';
import 'package:flutter/material.dart';

class BiodataWidget extends StatelessWidget {
  final int id;
  final String name;
  final String age;
  const BiodataWidget(
      {super.key, required this.id, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          final data = DBFunctions.instance.getBiodatabyID(id);
          if (data == null) {
            Navigator.of(context).pop();
          }
          final nametxt = data!.name;
          final agetxt = data.age;
          final placetxt = data.place;
          final contenttxt = data.content;

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return BioDataScreen(
                title: 'Biodata',
                buttonlabel: 'Save',
                idname: nametxt,
                idage: agetxt,
                idplace: placetxt,
                idcontent: contenttxt,
                bioID: id,
              );
            },
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[500],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Name: \n$name',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Age: $age',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      print(id);
                      DBFunctions.instance.deleteBiodata(id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 27,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
