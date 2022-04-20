import 'package:buchi/models/PetModel.dart';
import 'package:buchi/style/textstyle.dart';
import 'package:buchi/utility.dart';
import 'package:buchi/view/PetList.dart';
import 'package:buchi/view/SearchPet.dart';
import 'package:buchi/viewModel/SearchNotiffier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilteredPet extends StatelessWidget {
  List<String>? petTyps;
  String? age;
  String? gender;
  String? size;
  String? goodWithChildern;
  FilteredPet(
      {Key? key,
      this.age,
      this.gender,
      this.goodWithChildern,
      this.petTyps,
      this.size})
      : super(key: key);

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
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PetSearch();
            }));
          }
        },
      ),
     
      body: RefreshIndicator(
          onRefresh: () {
            // petNotiffier.getAllPets();
            return Future.value();
          },
          child: FutureBuilder<List<dynamic>>(
              future: SearchNotifier().searchAllPets(
                  petTypes: petTyps,
                  gender: gender,
                  age: age,
                  size: size,
                  goodWithChildern: goodWithChildern),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.deepPurpleAccent)),
                          child: Text(
                            "No pet was found based on your search! Either you are turning off all pet type or there is no record",
                            style: Style().appbarstyle,
                            textAlign: TextAlign.center,
                          )),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        dynamic pet = snapshot.data![index];
                        if (index % 2 == 0) {
                          return Utility().leftAligned(pet, context);
                        } else {
                          return Utility().rightAligned(pet, context);
                        }
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return Wrap(
                    children: [
                      Text(
                        "Please Wait...",
                        style: Style().getDetailStyle,
                      ),
                      const CircularProgressIndicator()
                    ],
                  );
                }
              })),
    );
  }

//   Widget ViewPets(SearchNotifier searchNotiffier) {
//     if (searchNotiffier.isLoading()) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (searchNotiffier.getFailer() != null) {
//       return Center(
//         child: Text("${searchNotiffier.getFailer()!.errorResponse}"),
//       );
//     } else if (searchNotiffier.length < 0) {
//       return Container(
//         child: Text(
//           """
// No pet was found based on your search! Either you are turing off all pet type or there is no record""",
//           style: TextStyle(fontSize: 16),
//         ),
//       );
//     } else {
//       return ListView.builder(
//           itemCount: searchNotiffier.getPetListModel().length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             dynamic pet = searchNotiffier.getPetListModel()[index];
//             if (index % 2 == 0) {
//               return Utility().leftAligned(pet, context);
//             } else {
//               return Utility().rightAligned(pet, context);
//             }
//           });
//     }
//   }

}
