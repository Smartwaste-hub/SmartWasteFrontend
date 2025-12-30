import 'package:flutter/material.dart';
import 'package:smartwastefrontend/edit.dart';
import 'package:smartwastefrontend/login.dart';
import 'package:smartwastefrontend/registration.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {

  String name = '';
  String department = '';
  String phone = '';
  String gender = '';
  String email = '';
  String age = '';
  String address= '';

  bool isLoading = true;

  Future<void> viewprofile() async {
    Map<String, dynamic> data = {
      'lid': loginid
    };

    try {
      final response = await dio.get(
        '$baseurl/viewprofile',
        data: data,
      );
print(response.data);
      if (response.statusCode == 200) {
        final profile = response.data;

        setState(() {
          name = profile[0]['name'];
          age = profile[0]['age'].toString();
          address = profile[0]['address'];
          department = profile[0]['department'];
          phone = profile[0]['mobilenumber'].toString();
          gender = profile[0]['gender'];
          email = profile[0]['email'];
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    viewprofile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: const Text('View Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF388E3C),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFF66BB6A),
                          child: Icon(Icons.person, size: 60, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Student Profile",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF388E3C),
                          ),
                        ),
                        const Divider(height: 30),

                        buildProfileRow(Icons.person_outline, "Name", name),
                        buildProfileRow(Icons.school_outlined, "Department", department),
                        buildProfileRow(Icons.phone, "Mobile Number", phone),
                        buildProfileRow(Icons.person, "Gender", gender),
                        buildProfileRow(Icons.email, "Email", email),
                        buildProfileRow(Icons.event, "Age", age),
                        buildProfileRow(Icons.location_city, "Address", address),

                        const SizedBox(height: 30),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF388E3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                           Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EditProfile(
      profile: {
        "name": name,
        "department": department,
        "phone": phone,
        "gender": gender,
        "email": email,
        "age": age,
        "address": address,
      },
    ),
  ),
);

                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                          label: const Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildProfileRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF43A047)),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              "$label:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
