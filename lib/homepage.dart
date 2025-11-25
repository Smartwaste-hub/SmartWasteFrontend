import 'package:flutter/material.dart';
import 'package:smartwastefrontend/complaint.dart';
import 'package:smartwastefrontend/rewardhistory.dart';
import 'package:smartwastefrontend/scanqrcode.dart';
import 'package:smartwastefrontend/viewprofile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9f5e9),
      appBar: AppBar(
        title: const Text("Green Home Page"),
        backgroundColor: const Color(0xff2e7d32),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // HERO
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=1500&q=80",
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black45,
              child: const Text(
                "Eco-Friendly • Clean • Modern",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            "Navigation Menu",
            style: TextStyle(
              color: Color(0xff2e7d32),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // NAV BUTTONS
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              _navButton(context, "Complaint", Icons.report, Complaint()),
              // _navButton(context, "Registration", Icons.app_registration, "/registration"),
              _navButton(context, "Scan QR Code", Icons.qr_code_scanner, QRScannerPage()),
              _navButton(context, "View Profile", Icons.person, ViewProfile()),
              _navButton(context, "Rewards & Transactions", Icons.card_giftcard, RewardPage() ),
            ],
          ),

          const Spacer(),

          // FOOTER
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xff1b5e20),
            child: const Center(
              child: Text(
                "© 2025 Green Theme — All Rights Reserved",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String text, IconData icon, Widget route) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff388e3c),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => route,)),
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
