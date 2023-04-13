import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';





class uploadImageScreen extends StatefulWidget{

  static const screenRoute='category-diseases';

  @override
  State<uploadImageScreen> createState() => _uploadImageScreenState();
}

class _uploadImageScreenState extends State<uploadImageScreen> {


 File? imageFile;
 Future _getFromGallery() async{
   XFile? pickedFile = await ImagePicker().pickImage(
     source: ImageSource.gallery,
     maxHeight: 400,
     maxWidth: 400,
   );
   setState(() {
     imageFile=File(pickedFile!.path);
   });
}

 /* final String categoryId;
  final String categoryTitle;

  uploadImageScreen(this.categoryId,this.categoryTitle);
   */
  @override
  Widget build(BuildContext context){

    final routeArgument=
       ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final categoryId=routeArgument['id'];
    final categoryTitle =routeArgument['title'];

    final ButtonStyle raisedButtonStyle=
        ElevatedButton.styleFrom(

          textStyle: TextStyle(fontSize: 25),
          foregroundColor: Colors.white,
          backgroundColor: Colors.tealAccent[300],
          minimumSize:Size(88, 52),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular( 10)),

          )

        );

    return  Scaffold(
      appBar: AppBar(
        title:Text(categoryTitle!,style: TextStyle(
          color: Colors.blue,
        ),),
        /*Image.asset("assets/images/logo.jpeg"
          ,height: 160.0,width: 160.0,
        ),
               */
        elevation: 15,
        backgroundColor: Colors.white30,

      ),
      body:ListView(
          children: [
            SizedBox(height: 50,),
            imageFile != null ?
                Container(
                  child: Image.file(imageFile!),
                ) :
                Container(
                  child: Icon(
                    Icons.camera_enhance_rounded,
                    color: Colors.blue,
                    size: MediaQuery.of(context).size.width*.6,
                  ),
                ),
            Padding(
                padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                child: Text('Upload Your Image'),
                onPressed: () {
                  _getFromGallery();
                },

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all( 12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                ),
              ),


            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                child: Text('Show Result'),
                onPressed: () { },

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all( 12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                ),
              ),


            ),
          ],
      ),

    );

  }



     }





