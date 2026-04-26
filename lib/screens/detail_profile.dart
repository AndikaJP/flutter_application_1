import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/edit_profile.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  late String nama;
  bool isChange = true;
  @override
  void initState() {
    super.initState();
    nama = widget.profile.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Profile")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: Image.network(
                        "https://i.pinimg.com/1200x/be/c3/9e/bec39e2d310e70faf8a78911bfd39bea.jpg",
                      ).image,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Text(
              nama,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.profile.bio,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.profile.desc92,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isChange = !isChange;
                  nama = isChange
                      ? "Andika"
                      : "I Made Andika Nugraha Jayanta Putra";
                });
              },
              child: Text("Change name"),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Home"),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final Profile? updateProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(profile: widget.profile),
                  ),
                );

                if (updateProfile != null) {
                  Navigator.pop(context, updateProfile);
                }
              },
              child: Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
