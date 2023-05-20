import 'package:flutter/material.dart';
import 'package:quickpass/bookingscreen.dart';
import 'package:quickpass/profilescreen.dart';
import 'package:quickpass/settingscreen.dart';

import 'logoutscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monument Ticket Booking'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section
            Container(
              // Use appropriate height for the hero section
              height: 200,
              child: Image.asset(
                'assets/images/hero_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
            
            // Search Bar
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for monuments...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
            // Categories or Featured Monuments
            Container(
              padding: EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  // Replace with actual category or featured monument widgets
                  CategoryCard('Historical Monuments', 'assets/images/monument1.jpg'),
                  CategoryCard('Architectural Wonders', 'assets/images/monument2.jpg'),
                  CategoryCard('Natural Landmarks', 'assets/images/monument3.jpg'),
                  CategoryCard('Cultural Heritage Sites', 'assets/images/monument4.jpg'),
                ],
              ),
            ),
            
            // Promotions and Offers
            Container(
              padding: const EdgeInsets.all(16.0),
              child:  const Text(
                'Current Promotions and Offers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Explore by Location
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore by Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Search Results or Popular Monuments
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Popular Monuments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  
  CategoryCard(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  // Replace with the user's profile image
                  backgroundImage: AssetImage('assets/images/profile_image.jpg'),
                ),
                SizedBox(height: 8.0),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'johndoe@example.com',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle Home screen navigation
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () {
              // Handle profile screen navigation
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: Text('My Bookings'),
            onTap: () {
              // Handle bookings screen navigation
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookingScreen ()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings screen navigation
               Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingsScreen ()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LogoutScreen ()));
            },
          ),
        ],
      ),
    );
  }
}

