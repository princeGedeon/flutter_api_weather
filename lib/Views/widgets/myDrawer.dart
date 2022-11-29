import 'package:flutter/material.dart';
import 'package:meteo_app/models/geoposition.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key,required this.myposition,required this.cities,required this.onTap,required this.onDelete}) : super(key: key);
  GeoPosition? myposition;
  List<String> cities;
  Function(String) onTap;
  Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    final itemCount= (myposition==null)?cities.length+1:cities.length+2;
    return Drawer(
      child: ListView.separated(itemBuilder: (context,index){
        if (index==0) return header(context);
        if (index==1 && myposition!=null) return tappable(myposition!.city,false);
        if (myposition==null) return tappable(cities[index-1],true);
        else return tappable(cities[index-2],true);
      }, separatorBuilder: ((context,index)=>const Divider()), itemCount: itemCount),

    );
  }

  DrawerHeader header(BuildContext context){
    return DrawerHeader(child:
    Column(
      children: [
        Icon(Icons.location_on_outlined,size: 32,color: Theme.of(context).primaryColor,),
        const Text("Mes Villes")
      ],
    )
    );

  }

  ListTile tappable(String string,bool canDelete){
    return ListTile(
      title: Text(string,),
      onTap: (()=>onTap(string)),
      trailing: (canDelete)?IconButton(icon: Icon(Icons.delete,color: Colors.redAccent,),onPressed: (()=>(canDelete?onDelete(string):null)),):null,
    );
  }
}
