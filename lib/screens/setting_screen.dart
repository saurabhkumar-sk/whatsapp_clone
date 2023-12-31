import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/profile.dart';
import 'package:whatsapp_clone/utils/database.dart';

class MenuSettingScreen extends StatefulWidget {
  const MenuSettingScreen({super.key});

  @override
  State<MenuSettingScreen> createState() => _MenuSettingScreenState();
}

class _MenuSettingScreenState extends State<MenuSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              minVerticalPadding: 24,
              leading: const CircleAvatar(
                maxRadius: 35,
                backgroundImage: AssetImage('assets/images/dp.webp'),
              ),
              title: const Text(
                "Saurabh Kumar",
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text('Available'),
              trailing: const Icon(
                Icons.qr_code,
                color: Colors.teal,
                size: 30,
              ),
            ),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingIconList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        settingIconList[index]['icons'],
                        color: const Color.fromARGB(255, 119, 116, 116),
                      ),),
                  title: Text(
                    setingScreenTitleSubtitle[index]['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    setingScreenTitleSubtitle[index]['subtitle'],
                  ),
                );
              },
            ),
            const ListTile(
              contentPadding: EdgeInsets.only(left: 25),
              leading: Icon(
                Icons.group,
                color: Color.fromARGB(255, 119, 116, 116),
              ),
              title: Text(
                'Invite a friend',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 3, left: 8),
              child: Text(
                'from',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  Text(
                    ' Meta',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
