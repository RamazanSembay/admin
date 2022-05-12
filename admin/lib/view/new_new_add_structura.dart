import 'dart:io';

import 'package:admin/services/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xfile/xfile.dart';

import '../services/firebase_services.dart';

class NewNewAddStructura extends StatefulWidget {
  @override
  State<NewNewAddStructura> createState() => _NewNewAddStructuraState();
}

class _NewNewAddStructuraState extends State<NewNewAddStructura> {
  // TextEditingController
  final _modelTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _priceTextController = TextEditingController();

  // Image Picker
  File selectedImage;
  bool _isLoading = false;

  CrudMethods _crudMethods = new CrudMethods();

  final ImagePicker _picker = ImagePicker();
  FirebaseServices _services = FirebaseServices();

  XFile _image;
  String _imageUrl;

  _getImage() async {
    final pickedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      this._image = XFile(pickedImage.path);
    } else {
      print('No Image Selected');
    }
    return _image;
  }

  // explame 1
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F7),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          NewAppBar(
            title: 'Қосу',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(
              //     bottom: 50,
              //     top: 30,
              //     left: 20,
              //     right: 20,
              //   ),
              //   child: Container(
              //     height: 120,
              //     width: 120,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(500),
              //       color: Color(0xff444444),
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.photo_camera,
              //           size: 40,
              //           color: Colors.white,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                child: InkWell(
                  onTap: () {
                    _getImage().then((value) {
                      setState(() {
                        value = _image;
                      });
                    });
                  },
                  child: _isLoading
                      ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: Color(0xff4444444),
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: _image == null
                              ? NetworkImage(
                                  'https://s.appleinsider.ru/2012/12/Steve-Jobs-Audiobook-Ai3123.png')
                              : FileImage(File(_image.path)),
                          radius: 70,
                        ),
                ),
              ),

              // Моделі
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      child: Text(
                        'Моделі',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff444444),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _modelTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(border: InputBorder.none),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Атауы
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      child: Text(
                        'Атауы',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff444444),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _nameTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(border: InputBorder.none),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Бағасы
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 5,
                      ),
                      child: Text(
                        'Бағасы',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff444444),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _priceTextController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Қосу кнопка
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    if (_image == null) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Профиль суреті таңдалмаған'),
                          backgroundColor: Color(0xff4444444),
                        ),
                      );
                    }

                    if (_image != null) {
                      setState(() {
                        _isLoading = true;
                      });
                    }

                    _services.uploadFile(_image).then((value) {
                      if (value != null) {
                        setState(() {
                          _imageUrl = value;
                        });
                      }
                    }).then((value) {
                      _services.addUserData(data: {
                        'Картинка': _imageUrl,
                        'Модель': _modelTextController,
                        'Название': _nameTextController,
                        'Цена': _priceTextController,
                      });
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff444444),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Қосу',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewAppBar extends StatelessWidget {
  final String title;

  const NewAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff999999).withOpacity(0.25),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Color(0xff999999),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff444444),
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}
