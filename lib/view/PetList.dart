import 'package:buchi/apps_feature/feature.dart';
import 'package:buchi/models/PetModel.dart';
import 'package:buchi/style/textstyle.dart';
import 'package:buchi/utility.dart';
import 'package:buchi/view/SearchPet.dart';
import 'package:buchi/viewModel/PetNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetList extends StatelessWidget {
  const PetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PetNotiffier petNotiffier = context.watch<PetNotiffier>();
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
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AppFeature();
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
          child: ViewPets(petNotiffier)),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ViewPets(PetNotiffier petNotiffier) {
    if (petNotiffier.isLoading()) {
      return Center(
        child: Wrap(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Please wait....",
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      );
    } else if (petNotiffier.getFailer() != null) {
      return Center(
        child: Text("${petNotiffier.getFailer()!.errorResponse}"),
      );
    } else {
      return ListView.builder(
          itemCount: petNotiffier.getPetListModel().length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            dynamic pet = petNotiffier.getPetListModel()[index];
            if (index % 2 == 0) {
              return Utility().leftAligned(pet, context);
            } else {
              return Utility().rightAligned(pet, context);
            }
          });
    }
  }
}
