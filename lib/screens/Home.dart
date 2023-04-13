import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class Home extends StatelessWidget{
  // const Home({Key? key}) :super(key: key);
   @override
   Widget build(BuildContext context){
      return Scaffold(
         /*appBar: AppBar(
            title:Image.asset("assets/images/logo.jpeg"
               ,height: 160.0,width: 160.0,
            ),

            elevation: 15,
            backgroundColor: Colors.white,

         ),*/
           body: GridView(
              padding: EdgeInsets.all( 10),
              gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                 maxCrossAxisExtent: 400,
                 childAspectRatio: 8/8,
                 mainAxisSpacing: 10,
                 crossAxisSpacing: 10,
              ),
              children:Categories_data.map((categoryData)=>CategoryItem( categoryData.title, categoryData.imageUrl,categoryData.id)).toList(),
           ),

         );
   }



}

