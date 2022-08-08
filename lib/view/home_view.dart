import 'package:flutter/material.dart';
import 'search_movie.dart';

import 'movie_banners_view.dart';
import 'movie_list_view.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const MyMovieList(),
    const MyMovieBannner(),
    const MySearchMovie(),
  ];
  late PageController pageController;
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: PageView(
        children: _pages,
        controller: pageController,
        onPageChanged: changePage,
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapped,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xffE1B21E),
          unselectedItemColor: const Color(0xff9c7b15),
          backgroundColor: const Color(0xff292929),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Movie list'),
            BottomNavigationBarItem(
                icon: Icon(Icons.image), label: 'Movie banner'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search movie'),
          ]),
    );
  }
}
