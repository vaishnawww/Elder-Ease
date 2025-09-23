import 'package:flutter/material.dart';
import 'booking_confirmation_page.dart'; // Add this import

class ServiceProvidersPage extends StatelessWidget {
  final String serviceType;
  final IconData serviceIcon;
  
  const ServiceProvidersPage({
    super.key,
    required this.serviceType,
    required this.serviceIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Mock data for service providers
    final providers = [
      {
        'name': 'Dr. Sarah Johnson',
        'rating': 4.8,
        'reviews': 124,
        'distance': 2.5,
        'price': '\$45/hour',
        'experience': '5 years',
        'image': '👩‍⚕️',
        'available': true,
      },
      {
        'name': 'Nurse Mike Chen',
        'rating': 4.9,
        'reviews': 89,
        'distance': 1.2,
        'price': '\$38/hour',
        'experience': '3 years',
        'image': '👨‍⚕️',
        'available': true,
      },
      {
        'name': 'Medical Care Team',
        'rating': 4.7,
        'reviews': 256,
        'distance': 3.1,
        'price': '\$42/hour',
        'experience': '7 years',
        'image': '🏥',
        'available': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Select $serviceType",
          style: const TextStyle(
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
      body: Column(
        children: [
          // Mini Map Section
          Container(
            height: 200,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
            ),
            child: Stack(
              children: [
                // Simplified Map Background
                Container(
                  color: Colors.grey[50],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(serviceIcon, size: 50, color: Colors.black26),
                        const SizedBox(height: 8),
                        Text(
                          'Map View - $serviceType Providers',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // User Location Marker
                const Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 24),
                      Text('You', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
                // Provider Markers
                Positioned(
                  top: 40,
                  left: 40,
                  child: Column(
                    children: [
                      const Icon(Icons.person_pin, color: Colors.green, size: 20),
                      Text('Provider 1', style: TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 100,
                  child: Column(
                    children: [
                      const Icon(Icons.person_pin, color: Colors.green, size: 20),
                      Text('Provider 2', style: TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Providers List Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Providers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '3 found nearby',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: providers.length,
              itemBuilder: (context, index) {
                final provider = providers[index];
                return _buildProviderCard(context, provider, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProviderCard(BuildContext context, Map<String, dynamic> provider, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 25,
          child: Text(
            provider['image'] as String,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        title: Text(
          provider['name'] as String,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber[600], size: 16),
                const SizedBox(width: 4),
                Text(
                  '${provider['rating']} (${provider['reviews']} reviews)',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              '${provider['distance']} km away • ${provider['experience']} exp',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              provider['price'] as String,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        trailing: provider['available'] as bool
            ? ElevatedButton(
                onPressed: () {
                  _showBookingSheet(context, provider);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'BOOK',
                  style: TextStyle(fontSize: 12),
                ),
              )
            : OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text(
                  'BUSY',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
      ),
    );
  }

  void _showBookingSheet(BuildContext context, Map<String, dynamic> provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (context) => BookingConfirmationPage(
        provider: provider,
        serviceType: serviceType,
      ),
    );
  }
}