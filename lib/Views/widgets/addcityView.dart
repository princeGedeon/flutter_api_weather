import 'package:flutter/material.dart';

class AddCityView extends StatelessWidget {
  AddCityView({Key? key,required this.onaddCity}) : super(key: key);
  TextEditingController controller=TextEditingController();
  Function(String) onaddCity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Ajouter une ville"),
        )),
        IconButton(onPressed: (()=>onaddCity(controller.text)), icon: Icon(Icons.send,color: Theme.of(context).primaryColorDark,))
      ],
    );
  }
}
