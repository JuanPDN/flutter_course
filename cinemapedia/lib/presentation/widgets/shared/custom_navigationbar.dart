import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.currentIndex});

  final int currentIndex;
  void onItemTap(BuildContext context, int currentIndex){
    context.go('/home/$currentIndex');
  }

  @override
  Widget build(BuildContext context) {
    return 
    BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        onItemTap(context, value);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max),label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Categorias'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
      ],
      elevation: 0,
    );
  }
}
