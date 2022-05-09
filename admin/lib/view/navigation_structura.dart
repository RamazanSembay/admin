import 'package:admin/view/new_add_admin_structura.dart';
import 'package:admin/view/new_admin_structura.dart';
import 'package:flutter/material.dart';

class NavigationStructura extends StatefulWidget {
  @override
  State<NavigationStructura> createState() => _NavigationStructuraState();
}

class _NavigationStructuraState extends State<NavigationStructura> {
  PageController _tabsController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Bottom(
        selectedTab: _selectedTab,
        tabPressed: (num) {
          setState(() {
            _tabsController.animateToPage(
              num,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _tabsController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                NewAdminStructura(),
                NewAddAdminStructura(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bottom extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  Bottom({this.selectedTab, this.tabPressed});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff444444),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 30,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabs(
              image: 'icon/home.png',
              selected: _selectedTab == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            BottomTabs(
              image: 'icon/bag.png',
              selected: _selectedTab == 1 ? true : false,
              onPressed: () {
                widget.tabPressed(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTabs extends StatelessWidget {
  final String image;
  final bool selected;
  final Function onPressed;
  BottomTabs({this.image, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selected ? Colors.amber : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        height: 70,
        child: Image(
          color: Colors.white,
          image: AssetImage(image),
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
