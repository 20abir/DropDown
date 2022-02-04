// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> countries = [];
  List<dynamic> stateMaster = [];
  List<dynamic> state = [];

  String? countryId;
  String? stateId;

  @override
  void initState() {
    super.initState();

    this.countries.add({"id": 1, "name": "Bangladesh"});
    this.countries.add({"id": 2, "name": "India"});

    this.stateMaster = [
      {"ID": 1, "Name": "Dhaka", "ParentId": 1},
      {"ID": 2, "Name": "Narsingdi", "ParentId": 1},
      {"ID": 3, "Name": "Munshigong", "ParentId": 1},
      {"ID": 4, "Name": "Narayangonj", "ParentId": 1},
      {"ID": 5, "Name": "Jossore", "ParentId": 1},
      {"ID": 6, "Name": "Cox-Bazar", "ParentId": 1},
      {"ID": 1, "Name": "Dehli", "ParentId": 2},
      {"ID": 2, "Name": "Kolkata", "ParentId": 2},
      {"ID": 3, "Name": "Asam", "ParentId": 2},
      {"ID": 4, "Name": "Punjab", "ParentId": 2},
      {"ID": 5, "Name": "Pune", "ParentId": 2},
      {"ID": 6, "Name": "Bengalor", "ParentId": 2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FormHelper.dropDownWidgetWithLabel(
            context,
            "Country",
            "Selected Country",
            this.countryId,
            this.countries,
            (onChangedval) {
              this.countryId = onChangedval;

              this.state = this
                  .stateMaster
                  .where(
                    (stateItem) =>
                        stateItem["ParentId"].toString() ==
                        onChangedval.toString(),
                  )
                  .toList();
              this.stateId = null;
            },
            (onValidateval) {
              if (onValidateval == null) {
                return 'Please Select Country';
              }
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
          ),
          FormHelper.dropDownWidgetWithLabel(
            context,
            "State",
            "Selected State",
            this.stateId,
            this.state,
            (onChangedval) {
              this.stateId = onChangedval;
            },
            (onValidate) {
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            optionValue: "ID",
            optionLabel: "Name",
          ),
        ],
      ),
    );
  }
}
