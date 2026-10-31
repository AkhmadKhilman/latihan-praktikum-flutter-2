import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Menu",

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.dark,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final String name = "Akhmad Khilman Al Khafid";
  final String status = "Mahasiswa - Software Engineering";

  final List<String> projects = [
    "Nebulon - Web based e-commerce application",
    "Jelajah Nusantara - Web based ticket sales application for various modes of transport",
    "Monk Notions - Singla Page Application (SPA) based application for recording summaries, integrated with AI",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person_3, size: 30),
                ),

                SizedBox(height: 15),

                Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
