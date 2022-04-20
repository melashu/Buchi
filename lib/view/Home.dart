import 'package:buchi/style/textstyle.dart';
import 'package:buchi/utility.dart';
import 'package:buchi/view/PetList.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage("assets/images/homepic.png"),
            fit: BoxFit.cover,
            height: 350,
          ),
        ),
        const Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text("Be the part of the solution",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Adopt a stray pet to decrease the number of stray pets on the street for the safety of every one.\n\nStart your jorney of finding your companion now using Buchi app.",
                maxLines: 6,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
        Card(
            child: IconButton(
                iconSize: 20,
                onPressed: () async {
                  /**
                   * This ConnectivityResult check whether there is a connection or not
                   */
                  ConnectivityResult connectivityResult =
                      await Connectivity().checkConnectivity();
                  if ((connectivityResult == ConnectivityResult.bluetooth ||
                          connectivityResult == ConnectivityResult.none) &&
                      !Hive.box('buchi').get('isCatched')) {
                    WarningAlertBoxCenter(
                        context: context,
                        messageText:
                            'You are trying to access the pets for the first time, so you need to turn your internet connection!');
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PetList();
                    }));
                  }
                },
                icon: const Icon(Icons.search, size: 25)))
      ],
    );
  }
}
