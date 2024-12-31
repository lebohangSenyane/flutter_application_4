import 'package:flutter/material.dart';
import 'package:flutter_application_4/dafaults/defaults.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    const Center(child: Text("Inbox")),
    const Center(child: Text("Starred")),
    const Center(child: Text("Sent")),
    const Center(child: Text("Drafts")),
    const Center(child: Text("Trash")),
    const Center(child: Text("Spam")),
  ];

  void updateState(int index) {
    setState(() {
      indexClicked = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Navigation Drawer"),
      ),
      body: pages[indexClicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/drawer.jpg'),
                ),
              ),
              child: Column(
                children: const [
                  SizedBox(height: 12),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "John Bravo",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "johny@gmail.com",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () => updateState(0),
                    leading: Icon(
                      Defaults.drawerItemIcon[0],
                      color: indexClicked == 0
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                    title: Text(
                      Defaults.drawerItemText[0],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                        color: indexClicked == 0
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                    ),
                  ),
                  DrawerTile(
                    index: 1,
                    onTap: () => updateState(1),
                  ),
                  DrawerTile(
                    index: 2,
                    onTap: () => updateState(2),
                  ),
                  DrawerTile(
                    index: 3,
                    onTap: () => updateState(3),
                  ),
                  DrawerTile(
                    index: 4,
                    onTap: () => updateState(4),
                  ),
                  DrawerTile(
                    index: 5,
                    onTap: () => updateState(5),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Defaults.drawerItemColor,
                    indent: 20,
                    endIndent: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Lebomail",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "version 4",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        Defaults.drawerItemIcon[index],
        color: indexClicked == index
            ? Defaults.drawerItemSelectedColor
            : Defaults.drawerItemColor,
      ),
      title: Text(
        Defaults.drawerItemText[index],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w100,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
      ),
    );
  }
}
