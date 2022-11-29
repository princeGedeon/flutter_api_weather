import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:const  Text("Aucune donée pour le lieu sélectionné"),
    );
  }
}
