import 'dart:io';
import 'package:birds_main/information.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:wikidart/wikidart.dart';


class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) :super(key: key);
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {


  late List _results;
  late XFile image;
  String name="";
  var ok;
  bool imageSelect=false;
  @override
  void initState()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model: "assets/tflite/birds_450_quant_image_inceptionV3_metadata.tflite",labels: "assets/tflite/labels_450.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      image;
      imageSelect=true;
    name=recognitions[0]['label'];
    });
    return name;
    // print(_results);
    // print(name);
  }
  Future<dynamic> something(name) async {
    var res = await Wikidart.searchQuery(name);
    var pageid = res?.results?.first.pageId;

    if (pageid != null) {
      var google = await Wikidart.summary(pageid);

      // print(google?.title); // Returns "Google"
      // print(google?.description); // Returns "American technology company"
      // print(google?.extract); // Returns "Google LLC is an American multinational technology company that specializes in Internet-related..."
      setState(() {
        ok = google!.extract!;
      });
    }
    return ok;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child:Opacity(
              opacity: 0.5 ,
            child: Image.asset('assets/images/grass_dew_drops_193835_800x1420.jpg',
                  fit: BoxFit.fitHeight,),

              ),
               ),
              Container(
            margin: EdgeInsets.all(10),
            child:Image.asset('assets/images/A-removebg-preview.png'),),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Pick image from \ngallery or camera',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () async{
                        selectImageFromCamera();
                        },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      child: Text(
                        "Camera",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () async{
                        selectImageFromGallery();
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                     SizedBox(
                       height: 50,
                     ),
                     Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          onPressed: () async{
                            final String name1 = await imageClassification(File(image!.path));
                            print(name1);
                            final String ok1 = await something(name1);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => InfoPage(image:image,name:ok1.toString(),name1:name.toString())));
                          },
                          color: Colors.amber,
                          child: Text('Confirm',
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
  Future selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (_) => PredictionPage(image: file)));
      image=file;
    }
  }

  Future selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (_) => PredictionPage(image: (file))));
      image=file;
    }
  }
}