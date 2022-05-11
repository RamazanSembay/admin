import 'package:admin/view/new_add_info_structura.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddAdminStructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F7),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
            child: Text(
              'Жаңа ақпарат қосу',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff444444),
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xff444444).withOpacity(0.5),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
            child: Text(
              'Телефондар',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff444444),
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Wrap(
                  children: [
                    // Apple
                    NewInfo(
                      name: 'Apple',
                      image:
                          'https://i.pinimg.com/564x/36/e5/c4/36e5c4455bf294dff5714841a4031264.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Apple',
                            image:
                                'https://i.pinimg.com/564x/5e/ac/49/5eac4963bdc3551e17545e6002ffc9d5.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Apple Телефондары')
                                .snapshots(),
                            collectionPath: 'Apple Телефондары',
                          ),
                        );
                      },
                    ),

                    // Samsung
                    NewInfo(
                      name: 'Samsung',
                      image:
                          'https://i.pinimg.com/564x/5e/ac/49/5eac4963bdc3551e17545e6002ffc9d5.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Samsung',
                            image:
                                'https://i.pinimg.com/564x/5e/ac/49/5eac4963bdc3551e17545e6002ffc9d5.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Samsung Телефондары')
                                .snapshots(),
                            collectionPath: 'Samsung Телефондары',
                          ),
                        );
                      },
                    ),

                    // Realme
                    NewInfo(
                      name: 'Realme',
                      image:
                          'https://i.pinimg.com/564x/54/b4/04/54b404e4b57dbe1e20a098088409c077.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Realme',
                            image:
                                'https://i.pinimg.com/564x/54/b4/04/54b404e4b57dbe1e20a098088409c077.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Realme Телефондары')
                                .snapshots(),
                            collectionPath: 'Realme Телефондары',
                          ),
                        );
                      },
                    ),

                    // OnePlus
                    NewInfo(
                      name: 'OnePlus',
                      image:
                          'https://i.pinimg.com/564x/58/c8/50/58c85058ae9fd626cb3ed2d2bdb4e682.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Realme',
                            image:
                                'https://i.pinimg.com/564x/58/c8/50/58c85058ae9fd626cb3ed2d2bdb4e682.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('OnePlus Телефондары')
                                .snapshots(),
                            collectionPath: 'OnePlus Телефондары',
                          ),
                        );
                      },
                    ),

                    // Oppo
                    NewInfo(
                      name: 'Oppo',
                      image:
                          'https://i.pinimg.com/564x/bf/75/01/bf750183d443b7a137db0b4c79065988.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Realme',
                            image:
                                'https://i.pinimg.com/564x/bf/75/01/bf750183d443b7a137db0b4c79065988.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Oppo Телефондары')
                                .snapshots(),
                            collectionPath: 'Oppo Телефондары',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Divider(
              thickness: 1,
              color: Color(0xff444444).withOpacity(0.5),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
            child: Text(
              'Ноутбуктері',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff444444),
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Wrap(
                  children: [
                    // Apple
                    NewInfo(
                      name: 'Apple',
                      image:
                          'https://i.pinimg.com/564x/36/e5/c4/36e5c4455bf294dff5714841a4031264.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Apple',
                            image:
                                'https://i.pinimg.com/564x/5e/ac/49/5eac4963bdc3551e17545e6002ffc9d5.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Apple Ноутбуктері')
                                .snapshots(),
                            collectionPath: 'Apple Ноутбуктері',
                          ),
                        );
                      },
                    ),

                    // Lenovo
                    NewInfo(
                      name: 'Lenovo',
                      image:
                          'https://i.pinimg.com/564x/f1/bd/b2/f1bdb2137cc778c11b6c87f78a47e536.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Lenovo',
                            image:
                                'https://i.pinimg.com/564x/f1/bd/b2/f1bdb2137cc778c11b6c87f78a47e536.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Lenovo Ноутбуктері')
                                .snapshots(),
                            collectionPath: 'Lenovo Ноутбуктері',
                          ),
                        );
                      },
                    ),

                    // Hp
                    NewInfo(
                      name: 'Hp',
                      image:
                          'https://i.pinimg.com/564x/12/76/93/1276936eb7e9e7c46063845ad6cd533f.jpg',
                      onTap: () {
                        Get.to(
                          NewAddInfoStructura(
                            title: 'Hp',
                            image:
                                'https://i.pinimg.com/564x/12/76/93/1276936eb7e9e7c46063845ad6cd533f.jpg',
                            stream: FirebaseFirestore.instance
                                .collection('Hp Ноутбуктері')
                                .snapshots(),
                            collectionPath: 'Hp Ноутбуктері',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewInfo extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  const NewInfo({Key key, this.name, this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 250,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff4444444),
          boxShadow: [
            BoxShadow(
              color: Color(0xff999999).withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                image,
                height: 250,
                width: 220,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff444444),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              onTap: onTap,
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xff444444),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ашу',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: Color(0xffDFDFDF),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
