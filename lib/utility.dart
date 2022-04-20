import 'package:buchi/models/PetModel.dart';
import 'package:buchi/style/textstyle.dart';
import 'package:buchi/view/AdoptPet.dart';
import 'package:buchi/view/PetList.dart';
import 'package:buchi/view/SearchPet.dart';
import 'package:flutter/material.dart';

class Utility {
  Widget leftAligned(pet, BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // shape: Rectangular,
        margin: const EdgeInsets.only(bottom: 5),
        child: ListTile(
          onTap: () {
            showPetDetail(context, pet);
          },
          title: Text(
            "Pet Name: ${pet.petName}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: OutlinedButton(
              onPressed: () {
                showPetDetail(context, pet);
              },
              style: OutlinedButton.styleFrom(
                  // : ,
                  onSurface: Colors.blueAccent),
              child: const Text(
                "View",
                style: TextStyle(color: Colors.blueAccent),
              )),
          leading: SizedBox(
            width: 100,
            height: 150,
            child: Image(
                fit: BoxFit.cover,
                height: 150,
                image: AssetImage("assets/images/${pet.petPhoto}")),
          ),
          subtitle: Text(
            '''
Pet Type: ${pet.petType}           
                  ''',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget rightAligned(pet, BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        margin: const EdgeInsets.only(bottom: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          onTap: () {
            showPetDetail(context, pet);
          },
          title: Text(
            "Pet Name: ${pet.petName}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: OutlinedButton(
              onPressed: () {
                showPetDetail(context, pet);
              },
              child: const Text(
                "View",
                style: TextStyle(color: Colors.blueAccent),
              )),
          trailing: SizedBox(
            width: 100,
            height: 150,
            child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${pet.petPhoto}")),
          ),
          subtitle: Text(
            '''

Pet Type: ${pet.petType}           

                  ''',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  static showPetDetail(BuildContext context, pet) {
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Details of ${pet.petType} ${pet.petName}',
                      style: Style().appbarstyle,
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(
                      width: 100,
                      height: 150,
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/${pet.petPhoto}")),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.deepPurpleAccent,
                    ),
                    Text(
                      '''
Pet Age: ${pet.petAge}
Pet Type: ${pet.petType}           
Pet Gender: ${pet.petGender}
Pet Size: ${pet.petSize}
Pet Good With Childern: ${pet.goodWithChilderen}
Pet Color: ${pet.petColor}
''',
                      style: Style().getDetailStyle,
                    ),
                    Center(
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          IconButton(
                            onPressed: () {
                              var newPet = pet;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdoptPet(pets: newPet);
                              }));
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 60,
                            ),
                            tooltip: 'Adopt Me',
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20, left: 10),
                              child: const Text("Adopt Me"))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
