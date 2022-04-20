// ignore_for_file: prefer_const_constructors

import 'package:buchi/apps_feature/feature.dart';
import 'package:buchi/style/textstyle.dart';
import 'package:buchi/view/FIlteredPet.dart';
import 'package:buchi/view/PetList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

class PetSearch extends StatefulWidget {
  const PetSearch({Key? key}) : super(key: key);

  @override
  State<PetSearch> createState() => _PetSearchState();
}

class _PetSearchState extends State<PetSearch> {
  String title = "Dog, Cats, others";
  String goodWithChildern = "Any";
  String petAge = 'Any';
  String petGender = 'Any';
  String petSize = 'Any';
  bool isBetFinder = false;
  List<String> petTyps = ['dog', 'cat', 'others'];
  bool isDog = true;
  bool isCat = true;
  bool isOthers = true;
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PetList();
            }));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AppFeature();
            }));
          }
        },
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ExpansionTile(
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              childrenPadding: const EdgeInsets.only(left: 15, right: 10),
              title: Text(
                title,
                style: Style().appbarstyle,
              ),
              children: [
                Row(
                  children: [
                    const Text("Dog"),
                    const Spacer(),
                    Switch(
                        value: isDog,
                        onChanged: (val) {
                          setState(() {
                            isDog = val;
                          });
                          isDog && !petTyps.contains('dog')
                              ? petTyps.add('dog')
                              : petTyps.remove('dog');
                        },
                        activeColor: Colors.blueAccent)
                  ],
                ),
                Row(
                  children: [
                    const Text("Cat"),
                    const Spacer(),
                    Switch(
                      value: isCat,
                      onChanged: (val) {
                        setState(() {
                          isCat = val;
                        });
                        isCat && !petTyps.contains('cat')
                            ? petTyps.add('cat')
                            : petTyps.remove('cat');
                      },
                      activeColor: Colors.blueAccent,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("others"),
                    const Spacer(),
                    Switch(
                        value: isOthers,
                        onChanged: (val) {
                          setState(() {
                            isOthers = val;
                          });
                          isOthers && !petTyps.contains('others')
                              ? petTyps.add('others')
                              : petTyps.remove('others');
                        },
                        activeColor: Colors.blueAccent)
                  ],
                )
              ],
              initiallyExpanded: false,
            ),
          ),
          Center(
            child: Text(
              'Good With Other',
              style: Style().getDetailStyle,
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(
                left: 15.0, right: 15, top: 10, bottom: 10),
            padding: EdgeInsets.all(12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  iconSize: 30,
                  isDense: true,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  value: goodWithChildern,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Any"),
                      value: 'Any',
                    ),
                    DropdownMenuItem(
                      child: Text("Yes"),
                      value: 'Yes',
                    ),
                    DropdownMenuItem(
                      child: Text("No"),
                      value: 'No',
                    )
                  ],
                  onChanged: (val) {
                    setState(() {
                      goodWithChildern = val!;
                    });
                  }),
            ),
          ),
          Center(
            child: Text(
              'Age',
              style: Style().getDetailStyle,
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(
                left: 15.0, right: 15, top: 10, bottom: 10),
            padding: EdgeInsets.all(12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  iconSize: 30,
                  isDense: true,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  value: petAge,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Any"),
                      value: 'Any',
                    ),
                    DropdownMenuItem(
                      child: Text("Puppy"),
                      value: 'Puppy',
                    ),
                    DropdownMenuItem(
                      child: Text("Young"),
                      value: 'Young',
                    ),
                    DropdownMenuItem(
                      child: Text("Adult"),
                      value: 'Adult',
                    ),
                    DropdownMenuItem(
                      child: Text("Senior"),
                      value: 'Senior',
                    )
                  ],
                  onChanged: (val) {
                    setState(() {
                      petAge = val!;
                    });
                  }),
            ),
          ),
          Center(
            child: Text(
              'Gender',
              style: Style().getDetailStyle,
            ),
          ),

          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(
                left: 15.0, right: 15, top: 10, bottom: 10),
            padding: EdgeInsets.all(12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  iconSize: 30,
                  isDense: true,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  value: petGender,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Any"),
                      value: 'Any',
                    ),
                    DropdownMenuItem(
                      child: Text("Male"),
                      value: "Male",
                    ),
                    DropdownMenuItem(
                      child: Text("Female"),
                      value: "Female",
                    )
                  ],
                  onChanged: (val) {
                    setState(() {
                      petGender = val!;
                    });
                  }),
            ),
          ),
          Center(
            child: Text(
              'Size',
              style: Style().getDetailStyle,
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(
                left: 15.0, right: 15, top: 10, bottom: 10),
            padding: EdgeInsets.all(12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  iconSize: 30,
                  isDense: true,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  value: petSize,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Any"),
                      value: 'Any',
                    ),
                    DropdownMenuItem(
                      child: Text("Small"),
                      value: 'Small',
                    ),
                    DropdownMenuItem(
                      child: Text("Large"),
                      value: 'Large',
                    ),
                    DropdownMenuItem(
                      child: Text("Medium"),
                      value: 'Medium',
                    ),
                    DropdownMenuItem(
                      child: Text("Xlarge"),
                      value: 'Xlarge',
                    )
                  ],
                  onChanged: (val) {
                    setState(() {
                      petSize = val!;
                    });
                  }),
            ),
          ),
          Wrap(
            children: [
              Switch(
                value: isBetFinder,
                onChanged: (val) {
                  if (val) {
                    WarningAlertBoxCenter(
                        context: context,
                        messageText:
                            "Sorry Sir, My creator didn't connect me with petfinder.com database. I am only operating with local database. Sorry for that.");
                  }
                },
                activeColor: Colors.blueAccent,
              ),
              Text('Include pets listed from petfinder too?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.redAccent,
                  ))
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FilteredPet(
                    age: petAge,
                    gender: petGender,
                    goodWithChildern: goodWithChildern,
                    petTyps: petTyps,
                    size: petSize,
                  );
                }));
              },
              child: Text("Search"),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.blueAccent,
                  elevation: 10),
            ),
          )
        ],
      ),
    );
  }
}
