import 'package:flutter/material.dart';
import 'mock_db.dart';

class ProviderProfilePage extends StatelessWidget {
  final String phone;
  const ProviderProfilePage({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    final user = MockDB.getUser(phone);
    final name = user?['name'] ?? 'Provider';
    final serviceType = _extractServiceType(name);
    final displayName = _extractName(name);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              
              // Profile Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      displayName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      serviceType,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Divider
              Container(
                height: 1,
                color: Colors.black12,
              ),
              const SizedBox(height: 24),
              
              // Section Title
              const Text(
                "PROFILE INFORMATION",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              
              // Profile Details
              Expanded(
                child: ListView(
                  children: [
                    _buildInfoRow(
                      icon: Icons.phone,
                      title: "Phone Number",
                      value: phone,
                      isEditable: false,
                    ),
                    const SizedBox(height: 24),
                    _buildInfoRow(
                      icon: Icons.work,
                      title: "Service Type",
                      value: serviceType,
                      isEditable: true,
                      onEdit: () => _editServiceType(context, serviceType),
                    ),
                    const SizedBox(height: 24),
                    _buildInfoRow(
                      icon: Icons.star,
                      title: "Rating",
                      value: "4.8 ★ (24 reviews)",
                      isEditable: false,
                    ),
                    const SizedBox(height: 24),
                    _buildInfoRow(
                      icon: Icons.assignment_turned_in,
                      title: "Completed Jobs",
                      value: "47",
                      isEditable: false,
                    ),
                    const SizedBox(height: 24),
                    _buildInfoRow(
                      icon: Icons.calendar_today,
                      title: "Member Since",
                      value: "Jan 2024",
                      isEditable: false,
                    ),
                    const SizedBox(height: 40),
                    
                    // Availability Section
                    const Text(
                      "AVAILABILITY",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildAvailabilityCard(context),
                    const SizedBox(height: 32),
                    
                    // Service Areas Section
                    const Text(
                      "SERVICE AREAS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildServiceAreasCard(context),
                    const SizedBox(height: 40),
                    
                    // Action Buttons
                    _buildActionButton(
                      icon: Icons.edit,
                      title: "Edit Profile Information",
                      onTap: () => _editProfile(context, displayName, serviceType),
                    ),
                    const SizedBox(height: 16),
                    _buildActionButton(
                      icon: Icons.lock,
                      title: "Change Password",
                      onTap: () => _changePassword(context),
                    ),
                    const SizedBox(height: 16),
                    _buildActionButton(
                      icon: Icons.description,
                      title: "Service Certifications",
                      onTap: () => _viewCertifications(context),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _extractServiceType(String fullName) {
    final match = RegExp(r'\((.*?)\)').firstMatch(fullName);
    return match?.group(1) ?? "Service Provider";
  }

  String _extractName(String fullName) {
    return fullName.replaceAll(RegExp(r'\(.*?\)'), '').trim();
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    required bool isEditable,
    VoidCallback? onEdit,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        if (isEditable)
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black, size: 18),
            onPressed: onEdit,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
      ],
    );
  }

  Widget _buildAvailabilityCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Schedule",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          _buildScheduleRow("Monday - Friday", "9:00 AM - 6:00 PM"),
          const SizedBox(height: 8),
          _buildScheduleRow("Saturday", "10:00 AM - 4:00 PM"),
          const SizedBox(height: 8),
          _buildScheduleRow("Sunday", "Not Available"),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _editAvailability(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(width: 1, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text(
                "UPDATE AVAILABILITY",
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

  Widget _buildScheduleRow(String day, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: time == "Not Available" ? Colors.black38 : Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceAreasCard(BuildContext context) {
    final areas = ["Downtown", "North District", "East Side", "West End"];
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Areas I Serve",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: areas.map((area) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Text(
                area,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            )).toList(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _editServiceAreas(context, areas),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(width: 1, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text(
                "EDIT SERVICE AREAS",
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

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black, size: 20),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        minLeadingWidth: 0,
      ),
    );
  }

  // Action functions with proper context parameter
  void _editServiceType(BuildContext context, String currentService) {
    _showMessage(context, "Edit Service Type: $currentService");
  }

  void _editProfile(BuildContext context, String name, String serviceType) {
    _showMessage(context, "Edit Profile: $name ($serviceType)");
  }

  void _changePassword(BuildContext context) {
    _showMessage(context, "Change Password functionality");
  }

  void _viewCertifications(BuildContext context) {
    _showMessage(context, "View Service Certifications");
  }

  void _editAvailability(BuildContext context) {
    _showMessage(context, "Edit Availability Schedule");
  }

  void _editServiceAreas(BuildContext context, List<String> areas) {
    _showMessage(context, "Edit Service Areas: ${areas.join(', ')}");
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}