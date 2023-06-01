import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickpass/bookingscreen.dart';
import 'package:quickpass/profilescreen.dart';
import 'package:quickpass/settingscreen.dart';

import 'logoutscreen.dart';
import 'search.dart';

class RegularUserHomeScreen extends StatefulWidget {

  @override
  State<RegularUserHomeScreen> createState() => _RegularUserHomeScreenState();
}

class _RegularUserHomeScreenState extends State<RegularUserHomeScreen> {
List<String> filteredMonuments = [];

// void filterMonuments(String searchQuery) {
//     searchQuery = searchQuery.toLowerCase();
//     Future<List> monuments=getmonuments();
//     setState(() {
//       filteredMonuments = monuments
//           .where((vehicle) => vehicle.toLowerCase().contains(searchQuery))
//           .toList();
//     });
//   }
getmonuments()async
{
  print("hello");
  QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('monument').get();
  print(querySnapshot.docs.length);
  List<DocumentSnapshot>documents=querySnapshot.docs;
  List<String>monum=[];
 for(var document in documents)
 {
  Map<String,dynamic> data=document.data as Map<String,dynamic>;
  monum.add(data['name']);
 }
 for(var i in monum)
 {
  print(i);
 }
 return monum;
}

  changed()
  {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmonuments();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Monument Ticket Booking'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
        
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
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                // onChanged: (value) => filterMonuments(value),
                decoration: const InputDecoration(
                  hintText: 'Search for monuments...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
            // Categories or Featured Monuments
            Container(
              padding: const EdgeInsets.all(16.0),
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
              child: const Text(
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
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String email="";
  String name="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname();
  }

  getname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      email = (snap.data() as Map<String, dynamic>)['email'];
      name = (snap.data() as Map<String, dynamic>)['name'];
    });
  }

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
              children:  [
                const CircleAvatar(
                  radius: 30.0,
                  // Replace with the user's profile image
                  backgroundImage: AssetImage('assets/images/profile_image.jpg'),
                ),
                const SizedBox(height: 8.0),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                 Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle Home screen navigation
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegularUserHomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
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
            title: const Text('My Bookings'),
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
            title: const Text('Settings'),
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
            title: const Text('Logout'),
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

