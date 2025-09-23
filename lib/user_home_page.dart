import 'package:flutter/material.dart';
import 'mock_db.dart';
import 'service_providers_page.dart';

class UserHomePage extends StatelessWidget {
  final String phone;
  const UserHomePage({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    final user = MockDB.getUser(phone);
    final name = user?['name'] ?? 'User';
    
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
        child: SingleChildScrollView( // Added SingleChildScrollView
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
                  "How can we assist you today?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40), // Reduced from 60 to 40
                
                // Divider
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                const SizedBox(height: 24),
                
                // Section title
                const Text(
                  "AVAILABLE SERVICES",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 24), // Reduced from 32 to 24
                
                // Services Grid with fixed height
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6, // Fixed height constraint
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85, // Reduced from 0.9 to 0.85
                    physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
                    shrinkWrap: true,
                    children: [
                      _buildServiceGridItem(
                        icon: Icons.medical_services,
                        title: "Home Nurse",
                        description: "Professional nursing care at home",
                        onTap: () => _selectService(context, "Home Nurse", Icons.medical_services),
                      ),
                      _buildServiceGridItem(
                        icon: Icons.home_repair_service,
                        title: "Home Maintenance",
                        description: "Plumbing, electrical, repairs",
                        onTap: () => _selectService(context, "Home Maintenance", Icons.home_repair_service),
                      ),
                      _buildServiceGridItem(
                        icon: Icons.cleaning_services,
                        title: "Cleaning",
                        description: "House cleaning & laundry services",
                        onTap: () => _selectService(context, "Cleaning", Icons.cleaning_services),
                      ),
                      _buildServiceGridItem(
                        icon: Icons.directions_car,
                        title: "Driver",
                        description: "Transportation & errand services",
                        onTap: () => _selectService(context, "Driver", Icons.directions_car),
                      ),
                      _buildServiceGridItem(
                        icon: Icons.fitness_center,
                        title: "Physical Therapy",
                        description: "Rehabilitation & exercise therapy",
                        onTap: () => _selectService(context, "Physical Therapy", Icons.fitness_center),
                      ),
                      _buildServiceGridItem(
                        icon: Icons.psychology,
                        title: "Companion Care",
                        description: "Social companionship & support",
                        onTap: () => _selectService(context, "Companion Care", Icons.psychology),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildServiceGridItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16), // Reduced from 20 to 16
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Icon
              Container(
                width: 40, // Reduced from 48 to 40
                height: 40, // Reduced from 48 to 40
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: Icon(icon, color: Colors.black, size: 20), // Reduced from 24 to 20
              ),
              const SizedBox(height: 12), // Reduced from 16 to 12
              
              // Service Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14, // Reduced from 16 to 14
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6), // Reduced from 8 to 6
              
              // Service Description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 11, // Reduced from 12 to 11
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                  height: 1.3, // Reduced from 1.4 to 1.3
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              
              // View Details Arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 20, // Reduced from 24 to 20
                    height: 20, // Reduced from 24 to 20
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 12, // Reduced from 14 to 12
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectService(BuildContext context, String serviceName, IconData serviceIcon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceProvidersPage(
          serviceType: serviceName,
          serviceIcon: serviceIcon,
        ),
      ),
    );
  }
}