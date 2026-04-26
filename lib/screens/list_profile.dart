import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int counter = profiles.length + 1;
      profiles.add(
        Profile(
          id: counter,
          name: "Andika ${counter}",
          bio: "Junior Developer",
          desc92: "Haloo",
        ),
      );
    });
  }

  void deleteItem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Profile")),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Dismissible(
            key: Key(profile.id.toString()),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteItem(index);
              Fluttertoast.showToast(msg: "${deletedItem.name} dihapus");
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/1200x/be/c3/9e/bec39e2d310e70faf8a78911bfd39bea.jpg',
                ),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.bio),
              onTap: () async {
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProfile(profile: profile),
                  ),
                );

                if (updatedProfile != null) {
                  setState(() {
                    profiles[index] = updatedProfile;
                  });
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
