import 'package:boot_camp_project/pages/cardsDetails.dart';
import 'package:flutter/material.dart';
import '../database/plant.dart';
import './sign_up.dart';
import 'package:boot_camp_project/services/database.dart';
import 'package:boot_camp_project/pages/cards.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  void initState() {
    super.initState();
    // setSpecificUser();
  }

  // void setSpecificUser() async {
  //   List userData = await Database().getSpecificUser();
  //   if (userData.isNotEmpty) {
  //     setState(() {
  //       username = userData[0];
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container()),
              Text('Welcome $username'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/admin');
                },
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
body: Center(
        // theme: ThemeData( scaffoldBackgroundColor: Colors.lightGreenAccent,),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.builder(
            itemCount: plantsData.length,
            itemBuilder: (context, index) {
              final plant = plantsData[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardsDetails(plant: plant),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
Text(
                          plant['name'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        CircleAvatar(
                          backgroundImage: NetworkImage(plant['image_url']),
                          radius: 80,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Rating: ${plant['rating']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}