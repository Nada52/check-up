import 'package:flutter/material.dart';

class History extends StatelessWidget{
  const History({Key? key}) :super(key: key);
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children:const [
          Text( 'History page' , style: TextStyle(fontSize: 40, color:Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(height: 100,),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.history , size: 120,),
          ),
          SizedBox(height: 100,),
          Text( 'History page Content' , style: TextStyle(fontSize: 30, color:Colors.white),),
        ],
      ),
    );

  }


}
