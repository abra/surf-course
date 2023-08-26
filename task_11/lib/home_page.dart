import 'package:flutter/material.dart';
import 'package:task_11/receipt_page.dart';

import 'colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: <Widget>[
        const Icon(
          Icons.list_alt_outlined,
          size: 80,
          color: Colors.black12,
        ),
        const Icon(
          Icons.search_outlined,
          size: 80,
          color: Colors.black12,
        ),
        const Icon(
          Icons.shopping_basket_outlined,
          size: 80,
          color: Colors.black12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.person, size: 80, color: Colors.black12),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReceiptPage(),
                  ),
                );
              },
              child: const Text(
                'Чек № 56 →',
                style: TextStyle(
                  fontSize: 16,
                  color: lightGreen,
                ),
              ),
            ),
          ],
        ),
      ][_currentIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items: _navigationItems(),
      unselectedItemColor: lightGrey,
      selectedItemColor: lightGreen,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  List<BottomNavigationBarItem> _navigationItems() {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.list_alt_outlined),
        label: 'Каталог',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: 'Поиск',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        label: 'Корзина',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Личное',
      )
    ];
  }
}
