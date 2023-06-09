import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickpass/monumentdetailscreen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

   @override
    void initState() {
    // TODO: implement initState
    super.initState();
    getmonuments();
  }
  final searchController = TextEditingController();
  List<String> filteredMonuments = [];
  List<String> monum = [];
  List<String> desc = [];
  void filterMonuments(String searchQuery) {
    searchQuery = searchQuery.toLowerCase();
    setState(() {
      filteredMonuments =
          monum.where((mo) => mo.toLowerCase().contains(searchQuery)).toList();
    });
  }

  getmonuments() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('monument').get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    // List<String>monum=[];
    for (var document in documents) {
      String name = (document.data() as Map<String, dynamic>)['name'];
      String description = (document.data() as Map<String, dynamic>)['description'];
      monum.add(name);
      desc.add(description);
    }
  }

  int count = 0;

  getdescription(){
    for (var i in monum) {
      if (searchController.text == i) {
        return desc[count];
      }
      count +=1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select monument'),
        backgroundColor: Colors.black
      ),
      body: SafeArea(child: Column(children: [TextField(controller: searchController,
                onChanged: (value) => filterMonuments(value),
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                                  onPressed: (){
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MonumentDetailScreen(monumentName: searchController.text, description: getdescription(), imageUrl: '',)));
                },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchController.text="";
                    });
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),

          ),Expanded(
              child:ListView.builder(
              itemCount: filteredMonuments.length,
              itemBuilder: (context, index) {
                final vehicle = filteredMonuments[index];
                return ListTile(
                  title: Text(vehicle),
                  onTap: () => setState(() {
                    searchController.text = vehicle;
                  }),
                );
              },
            ),
          )],)),
    );
  }
}
