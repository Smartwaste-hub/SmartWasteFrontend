import 'package:flutter/material.dart';
import 'package:smartwastefrontend/ViewProduct.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // light green background
      appBar: AppBar(
        title: const Text(
          'Reward Points',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF388E3C), // deep green
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Reward Summary Card ---
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xFF66BB6A),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star, color: Colors.white, size: 40),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Points",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "1,250",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // --- Section Title ---
            Row(
              children: const [
                Icon(Icons.history, color: Color(0xFF2E7D32)),
                SizedBox(width: 8),
                Text(
                  "Transaction History",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // --- Transaction List ---
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  // Example data for demonstration
                  final transactions = [
                    {
                      "title": "Cafeteria Purchase",
                      "date": "Nov 10, 2025",
                      "points": "-50",
                      "isPositive": false
                    },
                    {
                      "title": "plastic bottle",
                      "date": "Nov 8, 2025",
                      "points": "+100",
                      "isPositive": true
                    },
                    {
                      "title": "Attendance Bonus",
                      "date": "Nov 1, 2025",
                      "points": "+200",
                      "isPositive": true
                    },
                    {
                      "title": "Library Fine",
                      "date": "Oct 28, 2025",
                      "points": "-30",
                      "isPositive": false
                    },
                    {
                      "title": "Eco Club Activity",
                      "date": "Oct 20, 2025",
                      "points": "+150",
                      "isPositive": true
                    },
                    {
                      "title": "Canteen Purchase",
                      "date": "Oct 15, 2025",
                      "points": "-60",
                      "isPositive": false
                    },
                  ];

                  final transaction = transactions[index];
                  final isPositive = transaction["isPositive"] as bool;

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isPositive
                            ? const Color(0xFF81C784)
                            : const Color(0xFFC8E6C9),
                     child: Icon(
                          isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                          color:
                              isPositive ? Colors.green[900] : Colors.red[400],
                        ),
                      ),
                      title: Text(
                        transaction["title"].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        transaction["date"].toString(),
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: Text(
                        transaction["points"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isPositive
                              ? const Color(0xFF2E7D32)
                              : Colors.redAccent,
                          fontSize: 16,

                        ),
                      ),
                    ));
                      
               
                },
              ),
              
            ),ElevatedButton.icon(onPressed: (){
               Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ViewProduct( )
    ),
               );
              
            }, label: Text("Buy Product"),style:ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF388E3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ) ,)
          ],
        ),
      ),
    );
  }
}
