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
          seedColor: Color.fromRGBO(27, 54, 93, 1),
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
    "Nebulon - E-commerce application",
    "Jelajah Nusantara - Sales various modes of transport application",
    "Monk Notions - Recording summaries application, integrated with AI",
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
        backgroundColor: Color.fromRGBO(0, 90, 156, 1),
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
                  backgroundColor: Color.fromRGBO(96, 193, 229, 1),
                  child: Icon(Icons.person_3, size: 30, color: Colors.black),
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

                    SizedBox(height: 10),

                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 18),

                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Fitur Edit belum dibuat",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Color.fromRGBO(0, 90, 156, 1),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                      label: Text("Edit Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(96, 193, 229, 1),
                        foregroundColor: Colors.black,
                      ),
                    ),

                    SizedBox(height: 21),

                    Container(
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(160, 224, 239, 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          stats(count: "3", label: "Projects"),

                          stats(count: "3.8", label: "IPK"),

                          stats(count: "5", label: "Skills"),
                        ],
                      ),
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

class stats extends StatelessWidget {
  final String count;
  final String label;
  const stats({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
