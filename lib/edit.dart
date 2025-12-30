import 'package:flutter/material.dart';
import 'package:smartwastefrontend/login.dart';
import 'package:smartwastefrontend/registration.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> profile;
  const EditProfile({super.key, required this.profile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController department;
  late TextEditingController mobilenumber;
  late TextEditingController gender;
  late TextEditingController email;
  // late TextEditingController password;
  late TextEditingController age;
  late TextEditingController address;

  @override
  void initState() {
    super.initState();

    name = TextEditingController(text: widget.profile['name']);
    department = TextEditingController(text: widget.profile['department']);
    mobilenumber = TextEditingController(text: widget.profile['phone']);
    gender = TextEditingController(text: widget.profile['gender']);
    email = TextEditingController(text: widget.profile['email']);
    age = TextEditingController(text: widget.profile['age'].toString());
    address = TextEditingController(text: widget.profile['address']);
    // password = TextEditingController();

    print('===========>>>>${age.text}');
  }

  Future<void> updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    Map<String, dynamic> data = {
      "lid": loginid,
      "name": name.text,
      "department": department.text,
      "mobilenumber": mobilenumber.text,
      "gender": gender.text,
      "email": email.text,
      "age": age.text,
      "address": address.text,
      // "password": password.text,
    };

    try {
      final response = await dio.post(
        "$baseurl/viewprofile",
        data: data,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile Updated Successfully")),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color(0xFF388E3C),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildField(name, "Student Name", Icons.person_outline),
              buildField(age, "Age", Icons.calendar_today),
              buildField(address, "Address", Icons.location_on),
              buildField(department, "Department", Icons.school_outlined),
              buildField(mobilenumber, "Mobile Number", Icons.phone_android),
              buildField(gender, "Gender", Icons.person),
              buildField(email, "Email", Icons.email_outlined),
              // buildField(password, "Password", Icons.lock_outline, obscure: true),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: (value) => value!.isEmpty ? "Required field" : null,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
