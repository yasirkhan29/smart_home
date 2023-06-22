import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/Pages/next_screen.dart';
import 'package:smart_home/Pages/widghts/smartDeviceBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart home',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //constant of horizonta and padding
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
// list of smart device
  List mySmartDevice = [
    ["smart Light", "images/light-bulb.png", true],
    ["smart AC", "images/air-conditioner.png", false],
    ["smart TV", "images/smart-tv.png", false],
    ["smart Fan", "images/fan.png", false],
  ];

  void powerSwitchChande(bool value, int index) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // Custome Bar
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => nextPage(),
                          duration: Duration(seconds: 2),
                          transition: Transition.rightToLeftWithFade);
                    },
                    child: Image.asset(
                      'images/menu.png',
                      height: 45,
                      color: Colors.black,
                    ),
                  ),
                  const Icon(
                    Icons.person,
                    size: 45,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Welcome Home"),
                  Text(
                    "Muhammad Yasir Khan",
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Device"),
            ),
            //// grid view
            Expanded(
                child: GridView.builder(
                    itemCount: mySmartDevice.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevice[index][0],
                        iconPath: mySmartDevice[index][1],
                        powerOn: mySmartDevice[index][2],
                        onChanged: (value) => powerSwitchChande(value, index),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
