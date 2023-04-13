import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:untitled1/screens/Home.dart';
import 'package:untitled1/screens/History.dart';
import 'package:untitled1/screens/Account.dart';
import 'package:untitled1/screens/upload_image_screens.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check Up App',
      theme: ThemeData(
        //to modify font
       textTheme: ThemeData.light().textTheme.copyWith(
         titleLarge: TextStyle(
           color: Colors.white,
           fontSize: 30,
         //  fontWeight: FontWeight.bold,
         ),
         titleSmall: TextStyle(
           color: Colors.blue,
           fontSize: 20,
           fontWeight: FontWeight.bold,
         )
       )
       // primarySwatch: Colors.deepOrange,
      ),
      //home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(ctx)=>MyHomePage(),
        uploadImageScreen.screenRoute:(ctx)=>uploadImageScreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
 //---> const MyHomePage({super.key, required this.title});
  const MyHomePage({super.key});



  //-->final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 /*--> int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
*/
  //list of icons that will be used
  final items=const[
    Icon(Icons.home,size: 30,color: Colors.blue,),
    Icon(Icons.history,size: 30,color: Colors.blue,),
    Icon(Icons.person,size: 30,color: Colors.blue,),

  ];
  //index to select what i click on of the navbar
  int index=1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
                  title:Image.asset("assets/images/logo.jpeg"
                    ,height: 160.0,width: 160.0,


                  ),

                  elevation: 15,
                     backgroundColor: Colors.white,

      ),
      bottomNavigationBar: CurvedNavigationBar(
        items:items,
        index:index,
        color: Colors.white54,
        onTap: (selectedIndex){
          setState(() {
            index=selectedIndex;

          });
        },

        height: 60,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 200),
      ),

      body: Container(

         width: double.infinity,
         height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index:index)
      ),

    );
  }
  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget= Home();
        break;
      case 1:
        widget=const History();
        break;
      default :
        widget=const Account();
        break;

    }
    return widget;
  }
}
