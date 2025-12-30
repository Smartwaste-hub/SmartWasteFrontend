import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartwastefrontend/login.dart';


 String baseurl='http://192.168.1.85:5000';
 Dio dio=Dio();

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});


  TextEditingController name =TextEditingController();
  TextEditingController department =TextEditingController();
  TextEditingController mobilenumber =TextEditingController();
  TextEditingController gender =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController age =TextEditingController();
  TextEditingController address =TextEditingController();


// Simple registration function
  Future<void> _register(context) async {
    Map<String, dynamic> data = {
     'name':name.text,
     'department':department.text,
     'mobilenumber':mobilenumber.text,
     'gender':gender.text,
     'email':email.text,
     'Username':email.text,
     'Password':password.text,
     'age':age.text,
     'address':address.text,
   
   };
   print(data);
  try {
    final response = await dio.post('$baseurl/StudentRegAPIView',data: data);
    if (response.statusCode==200||response.statusCode==201){
      Navigator.pop(context);
    }
  } catch (e) {
    print(e);
  }}

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43A047), Color(0xFF81C784)], // Green gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // changed to green
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Please fill in the details below",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),

                      // Student Name
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your name";}
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: 'Student Name',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: age,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your age";}
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: 'Age',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: address,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your address";}
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: 'Address',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),


                      TextFormField(
                        controller: department,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your department";}
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.school_outlined),
                          labelText: 'Department',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Mobile Number
                      TextFormField(
                        controller: mobilenumber,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your mobilenumber";}
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android),
                          labelText: 'Mobile Number',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Gender
                      TextFormField(
                        controller: gender,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your gender";}
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Gender',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your email";}
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your password";}
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Register Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.green, // changed to green
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _register(context);
                            }
                          },
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Already have an account? Login",
                          style: TextStyle(color: Colors.green), // changed to green
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}