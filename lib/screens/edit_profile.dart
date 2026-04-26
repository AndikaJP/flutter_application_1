import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _bioController = TextEditingController(text: widget.profile.bio);
    _descController = TextEditingController(text: widget.profile.desc92);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Desc'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = Profile(
                      id: widget.profile.id,
                      name: _nameController.text,
                      bio: _bioController.text,
                      desc92: _descController.text,
                    );
                    Navigator.pop(context, updatedProfile);
                  }
                },
                child: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
