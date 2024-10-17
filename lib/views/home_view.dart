import 'package:flutter/material.dart';
import 'package:the_meal_app/views/favorite_view.dart';
import 'package:the_meal_app/views/meals_view.dart';
import 'package:the_meal_app/views/signin_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInView()),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController, // Use o pageController definido na classe
        onPageChanged: onPageChanged,
        children: const [
          MealsView(),
          FavoriteView(),
          // ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          if (index == 2) {
            logout();
          } else {
            changePage(index);
          }
        },
        elevation: 5,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Sair',
          ),
        ],
      ),
    );
  }
}
