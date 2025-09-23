import 'package:flutter/material.dart';
import 'mock_db.dart';
import 'provider_profile_page.dart'; // Add this import

class ProviderHomePage extends StatelessWidget {
  final String phone;
  const ProviderHomePage({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    final user = MockDB.getUser(phone);
    final name = user?['name'] ?? 'Provider';
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "ElderEase",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black, size: 20),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              
              // Welcome message
              Text(
                "Welcome,\n$name",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              
              const Text(
                "Manage your service requests",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 60),
              
              // Divider
              Container(
                height: 1,
                color: Colors.black12,
              ),
              const SizedBox(height: 24),
              
              // Section title
              const Text(
                "SERVICE REQUESTS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              
              // Request cards
              Expanded(
                child: ListView(
                  children: [
                    _buildRequestCard(
                      status: "New",
                      service: "Plumbing Repair",
                      client: "John Smith",
                      time: "2 hours ago"
                    ),
                    const SizedBox(height: 16),
                    _buildRequestCard(
                      status: "In Progress",
                      service: "Medical Checkup",
                      client: "Mary Johnson",
                      time: "Yesterday"
                    ),
                    const SizedBox(height: 16),
                    _buildRequestCard(
                      status: "Completed",
                      service: "Grocery Delivery",
                      client: "Robert Brown",
                      time: "3 days ago"
                    ),
                    const SizedBox(height: 16),
                    _buildRequestCard(
                      status: "Scheduled",
                      service: "House Cleaning",
                      client: "Sarah Wilson",
                      time: "Tomorrow, 2:00 PM"
                    ),
                  ],
                ),
              ),
              
              // Action buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Add availability
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(width: 1.5, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: const Text(
                          "SET AVAILABILITY",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProviderProfilePage(phone: phone),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "VIEW PROFILE",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildRequestCard({required String status, required String service, required String client, required String time}) {
    Color statusColor = Colors.black;
    if (status == "New") statusColor = Colors.black;
    if (status == "In Progress") statusColor = Colors.black54;
    if (status == "Completed") statusColor = Colors.black38;
    if (status == "Scheduled") statusColor = Colors.black87;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: statusColor, width: 1),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: statusColor,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            service,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Client: $client",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // View details
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(width: 1, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text(
                "VIEW DETAILS",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}