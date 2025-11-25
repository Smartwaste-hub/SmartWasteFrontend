import 'package:flutter/material.dart';
import 'package:smartwastefrontend/homepage.dart';
import 'package:smartwastefrontend/registration.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  TextEditingController Username  =TextEditingController();
  TextEditingController Password =TextEditingController();

  Future<void> _login(context) async {
    Map<String, dynamic> data = {
     'Username':Username.text,
     'Password':Password.text,
     
   
   };
  try {
    final response = await dio.post('$baseurl/loginPage_api',data: data);
    if (response.statusCode==200||response.statusCode==201){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route)=>false);
    }
  } catch (e) {
    print(e);
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('assets/images/nature_bg.jpg'),
            image: NetworkImage('https://tse2.mm.bing.net/th/id/OIP.6FBclAvI4AkCy74N5XX60gHaII?pid=Api&h=220&P=0'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Card(
                color: Colors.white.withOpacity(0.9), // slightly transparent
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Log in to continue your journey',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: Username,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your user name";}
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: Password,
                        validator: (value) {
                          if( value==null||value.isEmpty){return "Enter your password";}
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            _login(context);
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.grey),
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
