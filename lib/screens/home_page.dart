import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
//import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';


class MyHome extends StatefulWidget{
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome>{
  Uint8List? _image;
  File? selectedIMage;

  //String imageUrl = '';


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()async{
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.login),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Sidebar Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Navigate to Home screen
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen
              },
            ),
          ],
        ),
      ),
      body: Container(
       decoration: BoxDecoration(
         border: Border.all(
             width: 1,
             color: Colors.black
         ),
       ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My Closet",style:
                GoogleFonts.gluten(
                  fontSize: 60,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  shadows: <Shadow>[
                    const Shadow(
                      offset: Offset(0.0,0.0),
                      blurRadius: 14.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
              ),
            ),
            Text(
              "Clothes".toUpperCase(),style:
              GoogleFonts.outfit(
                fontSize: 35,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:20, left: 50, right: 50, bottom:20),
              height: 370.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.white,
                    child: Card(
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'image/shirt.jpg', // Corrected asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),

                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.white,
                    child: Card(
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'image/jacket.avif', // Corrected asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),

                  //card to add clothes
                  Container(
                      height: 300,
                      width: 300,
                      color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return SizedBox(
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)
                                            )),
                                        color: Colors.white60,
                                        padding: const EdgeInsets.symmetric(horizontal: 50),
                                        height: 50,
                                        child: const Text(
                                          "Pick Image form Gallery",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          ),
                                        ),
                                        onPressed: (){
                                          _pickImageFromGallery();
                                        }
                                    ),
                                    const SizedBox(height: 20,),
                                    MaterialButton(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)
                                          )),
                                      color: Colors.white60,
                                      padding: const EdgeInsets.symmetric(horizontal: 90),
                                      height: 50,
                                      child: const Text(
                                        "Open Camera",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                      onPressed: (){
                                        _pickImageFromCamera();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Card(
                        elevation: 10,
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

   // await _uploadFile(returnImage.path);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();

    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}

// Future _uploadFile(String  path0) async {
//   final ref = storage.FirebaseStorage.instance.ref()
//   .child('images')
//   .child('${DateTime.now().toIso8601String() + p.basename(path)}');
//
//   final result = await ref.putFile(File(path));
//
//   setState((){imageUrl = fileUrl; });
//
//   widget.onFileChange(fileUrl);
// }




