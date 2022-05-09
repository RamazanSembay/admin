import 'package:admin/provider/cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class InfoAdmin extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String city;
  final String address;
  final String phone;
  final int totalprice;
  final int quantity;

  const InfoAdmin({
    Key key,
    this.id,
    this.name,
    this.image,
    this.city,
    this.address,
    this.phone,
    this.totalprice,
    this.quantity,
  }) : super(key: key);

  @override
  State<InfoAdmin> createState() => _InfoAdminState();
}

class _InfoAdminState extends State<InfoAdmin> {
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    print(widget.id);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: Color(0xff444444),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    widget.image,
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff444444),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff444444),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.city,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          thickness: 2,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.address,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          thickness: 2,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.phone,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff444444),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.deepPurple,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  'Тізімдер',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                  child: List(
                                    id: widget.id,
                                    future: FirebaseFirestore.instance
                                        .collection('Менің себетім')
                                        .doc(widget.id)
                                        .collection('Менің себетім')
                                        .snapshots(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.white24,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Дана: ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.quantity.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Барлығы: ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${formatter.format(widget.totalprice.toInt()) + ' ₸'}'
                            .replaceAll(',', ' '),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('Менің себетім')
                            .doc(widget.id)
                            .delete();

                        Navigator.pop(context);
                        print('Delete: ' + widget.id);
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Өшіру',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class List extends StatefulWidget {
  final String id;
  final Stream<QuerySnapshot> future;

  const List({Key key, this.id, this.future}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return StreamBuilder<QuerySnapshot>(
      stream: widget.future,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.size,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var data = snapshot.data.docs[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            data['Картинка'],
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['Название'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data['Количество'].toString() + ' дана',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('Менің себетім')
                            .doc(widget.id)
                            .collection('Менің себетім')
                            .doc(data['Id'])
                            .delete();

                        Get.snackbar(
                          "Өшіру",
                          "Өшірдім",
                          icon: Icon(Icons.delete, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Color(0xff444444),
                          borderRadius: 5,
                          margin: EdgeInsets.all(15),
                          colorText: Colors.white,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );

                        print('Delete: ' + data['Id']);
                      },
                      child: Icon(
                        Icons.delete,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}


// return ListView.builder(
    //   shrinkWrap: true,
    //   physics: BouncingScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //   itemCount: cartProvider.getCartList.length,
    //   itemBuilder: (context, index) {
    //     var data = cartProvider.cartList[index];

    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 15),
    //       child: Container(
    //         height: 70,
    //         width: double.infinity,
    //         child: Row(
    //           children: [
    //             Expanded(
    //               flex: 1,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Image.network(
    //                     data.image,
    //                     height: 50.0,
    //                     width: 50.0,
    //                     fit: BoxFit.fitHeight,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     data.name,
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     data.quantity.toString() + ' дана',
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 FirebaseFirestore.instance
    //                     .collection('Менің себетім')
    //                     .doc(FirebaseAuth.instance.currentUser.uid)
    //                     .collection('Менің себетім')
    //                     .doc(data.id)
    //                     .delete();

    //                 Get.snackbar(
    //                   "Өшіру",
    //                   "Өшірдім",
    //                   icon: Icon(Icons.delete, color: Colors.white),
    //                   snackPosition: SnackPosition.TOP,
    //                   backgroundColor: Color(0xff444444),
    //                   borderRadius: 5,
    //                   margin: EdgeInsets.all(15),
    //                   colorText: Colors.white,
    //                   duration: Duration(seconds: 3),
    //                   isDismissible: true,
    //                   dismissDirection: DismissDirection.horizontal,
    //                   forwardAnimationCurve: Curves.easeOutBack,
    //                 );
    //               },
    //               child: Icon(
    //                 Icons.delete,
    //                 size: 24,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );