import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:smartwastefrontend/login.dart';
import 'package:smartwastefrontend/registration.dart';



class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {

  TextEditingController complaintController = TextEditingController();
  Dio dio = Dio();

  List complaintsList = [];   // store complaints from API
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchComplaints();
  }

  Future<void> fetchComplaints() async {
    try {
      final response = await dio.get(
        "$baseurl/SendComplaintAPI/$loginid",
      );

      if (response.statusCode == 200) {
        setState(() {
          complaintsList = response.data;
          loading = false;
        });
      }
    } catch (e) {
      print("Error fetching complaints: $e");
      setState(() => loading = false);
    }
  }

  Future<void> sendComplaint() async {
    if (complaintController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a complaint")),
      );
      return;
    }

    try {
      final response = await dio.post(
        "$baseurl/SendComplaintAPI/$loginid",
        data: {
          "Complaint": complaintController.text,
        },
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Complaint submitted successfully")),
        );

        complaintController.clear();
        fetchComplaints(); // refresh list
      }
    } catch (e) {
      print("Error submitting complaint: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: const Text(
          'Complaints',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF388E3C),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Complaint Box
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),

                child: Column(
                  children: [
                    TextFormField(
                      controller: complaintController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Write your complaint here',
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.report_problem_outlined,
                          color: Colors.green),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF388E3C),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: sendComplaint,
                        icon: const Icon(Icons.send, color: Colors.white),
                        label: const Text(
                          "SUBMIT",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Previous Complaints & Replies",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),

            const SizedBox(height: 10),

            // Complaint List ------------------------------------
            Expanded(
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : complaintsList.isEmpty
                      ? Center(child: Text("No complaints found"))
                      : ListView.builder(
                          itemCount: complaintsList.length,
                          itemBuilder: (context, index) {
                            var item = complaintsList[index];

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              child: ListTile(
                                leading: const Icon(Icons.feedback_outlined,
                                    color: Color(0xFF43A047)),
                                title: Text(
                                  item["Complaint"] ?? "No Complaint",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Reply: ${item['Reply'] ?? "No reply yet"}",
                                    style: const TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
