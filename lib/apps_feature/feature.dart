// ignore_for_file: prefer_const_constructors

import 'package:buchi/style/textstyle.dart';
import 'package:buchi/view/FIlteredPet.dart';
import 'package:buchi/view/PetList.dart';
import 'package:buchi/view/SearchPet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

class AppFeature extends StatefulWidget {
  const AppFeature({Key? key}) : super(key: key);

  @override
  State<AppFeature> createState() => AppFeatureState();
}

class AppFeatureState extends State<AppFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Buchi",
          style: Style().appbarstyle,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueAccent,
        // ignore: prefer_const_constructors
        selectedLabelStyle: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
            color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
        iconSize: 25,
        elevation: 10,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "All pets"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_outlined),
              label: "App Feature"),
        ],
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PetList();
            }));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PetSearch();
            }));
          }
        },
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'Advanced Features of Buchis',
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''
•	Buchi has a Local data catch feature. I use Hive to store the data locally. Once you fetch data from a remote server or API it stores in a local catch so the app didn’t send an http request at any time. 
•	Buchi as a connectivity checker feature. For so tasks that need internet connectivity, Buchi checks whether you are connected or not. 
•	Form validation feature (when user adopt pets and fill forms for that Buchi validate the form)

''',
                textAlign: TextAlign.justify,
                style: Style().featureDetail,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'Limitiations of Buchi ',
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''       
•	For local cache purpose I put images in local asset folder but it also possible to access images from remote server. But the Buchi cant access images from the remote server like other data.
•	I didn't connect Buchi with petfinder API I only use my own local database by filling data from the petfinder website to my database.
              ''',
                textAlign: TextAlign.justify,
                style: Style().featureDetail,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'Design Pattern Used',
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''

•	I used MVVM design pattern.
•	I have service, app_feature folders in addition to  Models, View and ViewModel folders. service folder stored http related and data access services. app_feature stores descriptions about Buchi (you are reading it now).
''',
                textAlign: TextAlign.justify,
                style: Style().featureDetail,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'State Management Used',
              /***
               * Wearem
               */
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''
•	I used Provider as a state management

''',
                textAlign: TextAlign.justify,
                style: Style().featureDetail,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'Frontend, Backend and Database ',
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''

•	I use flutter framework to build Buchi
•	I use PHP at the backed side
•	I use my personal online database (buchi.keteraraw.com/api.php) which act as your local database.
•	I didn't connect it with petfinder API
''',
                textAlign: TextAlign.justify,
                style: Style().featureDetail,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'How to run the code on you machine ',
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''

•	Pull or download the code from my GitHab
•	Open it on Vscode or Android Studio (I built it on Vscode ) editor.
•	From pubspace.yaml file run downloading dev dependency  packages.
•	Then you can run it on real device or immulator device .
•	For feature Buchi ask you to turn on your data or wifi
''',
                textAlign: TextAlign.justify,
                style: Style().featureDetail,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            title: Text(
              'Thanks Page ',
              style: Style().appbarstyle,
            ),
            children: [
              Text(
                '''
Thank you for helping me out.
''',
                textAlign: TextAlign.center,
                style: Style().getWelcomeStyle,
              )
            ],
            initiallyExpanded: false,
          ),
        ),
      ]),
    );
  }
}
