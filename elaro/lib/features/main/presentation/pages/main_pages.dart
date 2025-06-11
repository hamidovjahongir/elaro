import 'package:elaro/core/constants/app_color.dart';
import 'package:elaro/features/card/presentation/pages/card_screen.dart';
import 'package:elaro/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(valueListenable: currentIndex, builder: (context, value, child) {
        return IndexedStack(
          index: value,
          children: [
            HomeScreen(),
            Container(color: Colors.amber,),
            CardScreen(),
            Container(color: Colors.pink
            ,),
          ], 
        );
      },),
       bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return BottomNavigationBar(
            currentIndex: value,
            onTap: (index) {
              currentIndex.value = index;
            },
            backgroundColor: AppColor.lightGray100,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: "categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "card",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outlined),
                label: "orders",
              ),
            ],
          );
        },
      ),
    );
  }
}
