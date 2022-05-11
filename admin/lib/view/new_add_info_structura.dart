import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class NewAddInfoStructura extends StatelessWidget {
  final String title;
  final String image;
  final Stream<QuerySnapshot> stream;

  const NewAddInfoStructura({
    Key key,
    this.title,
    this.image,
    this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F7),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          NewAppBar(
            title: title,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: NewInfo(
              title: title,
              image: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, bottom: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xff444444),
                  width: 2.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Қосу',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff444444),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Divider(
              thickness: 1,
              color: Color(0xff444444).withOpacity(0.5),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                NewFuture(
                  stream: stream,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
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

class NewInfo extends StatelessWidget {
  final String title;
  final String image;

  const NewInfo({Key key, this.title, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        height: 180,
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff444444),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(
                                Icons.production_quantity_limits,
                                size: 15,
                                color: Color(0xff888888),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '25' + 'дана',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewFuture extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final CollectionReference collection;

  const NewFuture({Key key, this.stream, this.collection}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return Column(
          children: [
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: snapshot.data.docs.length,
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              itemBuilder: (context, index) {
                var data = snapshot.data.docs[index];
                return Product(
                  name: data['Название'],
                  image: data['Картинка'],
                  delete: () {},
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class Product extends StatelessWidget {
  final String name;
  final String image;
  final Function delete;

  const Product({Key key, this.name, this.image, this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        height: 280,
        width: 190,
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    image,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff444444),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
                InkWell(
                  onTap: delete,
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xffB70F0F),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Өшіру',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffB70F0F),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
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
    );
  }
}
