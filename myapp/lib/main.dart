
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:myapp/navigateur.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories and Regions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWrapper(),
    );
  }
}


class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final String regionsUrl = 'http://127.0.0.1:8000/api/regions/';
  final String itemsUrl = 'http://127.0.0.1:8000/api/items/';
  int _selectedIndex = 0;

  Future<List<Region>>? futureRegions;

  final List<String> categoryImages = [
    'assets/back.jpg',
    'assets/backk.jpg',
    'assets/backkkK.jpg',
    'assets/backkk.jpg',
    
  ];
  @override
  void initState() {
    super.initState();
    futureRegions = fetchRegions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: List.generate(categoryImages.length, (index) {
                    return buildCategoryWidget(index + 1, categoryImages[index]);
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildCategoryWidget(int categoryId, String imagePath) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 410, // Adjust height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: MediaQuery.of(context).size.width * 0.17 - 45,
              top: MediaQuery.of(context).size.height * 0.32 - 40,
              child: Container(
                width: 550,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20), // Padding for text content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s plan your next vacation in Algeria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Immerse yourself in some of the world’s most historic Bardo National Museum on',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Learn more ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height * 0.1 - 40,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 55,
                        width: 700,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.search, color: Colors.black),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchResultsPage(itemsUrl: itemsUrl),
                                      ),
                                    );
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Choose a destination',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      height: 51,
                      width: 51,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Color.fromRGBO(245, 246, 249, 1),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.auto_awesome_rounded,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color.fromARGB(255, 11, 141, 255),
          unselectedItemColor: Color.fromARGB(255, 92, 91, 91),
          items: [
         

            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined),
              label: 'Culture',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.nature_outlined),
              label: 'Nature',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hotel_outlined),
              label: 'Hotel',
            ),
          ],
        ),
        SizedBox(height: 20), // Space between BottomNavigationBar and next section
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20), // Padding for section content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Make your best experiences',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              ItemsByCategoryWidget(categoryId: categoryId),
            ],
          ),
        ),
        SizedBox(height: 20), // Space between sections
        FutureBuilder<List<Region>>(
          future: futureRegions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading regions. Please try again later.'));
            } else {
              final regions = snapshot.data ?? [];
              if (regions.isEmpty) {
                return Center(child: Text('No regions available.'));
              } else {
                return Column(
                  children: [
                    SizedBox(height: 20), // Space between sections
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20), // Padding for section content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zoning In Algeria',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10),
                          buildRegionRow([regions[0], regions[1]], context),
                          SizedBox(height: 20),
                          buildRegionRow([regions[2], regions[3]], context),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Space between sections
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20), // Padding for section content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Best Wilayat With These Activities',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10),
                          WilayatAndItemsWidget(categoryId: categoryId),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Space at the end
                  ],
                );
              }
            }
          },
        ),
      ],
    );
  }
 
  Widget buildRegionRow(List<Region> regions, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: regions.map((region) => buildRegionItem(region, context)).toList(),
    );
  }


List<String> regionImagePaths = [
  'assets/chhhh.jpg',
  'assets/chh.jpg',
  'assets/chhh.jpg',
  'assets/ch.jpg',
];

Widget buildRegionItem(Region region, BuildContext context) {
  
  String imagePath = regionImagePaths[region.id - 1]; 

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegionDetailPage(
            region: region,
            categoryId: _selectedIndex + 1,
          ),
        ),
      );
    },
    child: Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath), // Use specific region image
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 120,
            left: 15,
            child: Container(
              width: 100,
              height: 26,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 6, 25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text(
                region.regionType,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 10,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 95,
            left: 15,
            child: FutureBuilder<List<Item>>(
              future: fetchItems(_selectedIndex + 1, region.id), // Pass both categoryId and regionId
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final items = snapshot.data ?? [];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      '${items.length} activities ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
  
  Future<List<Item>> fetchItems(int categoryId, int regionId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> filteredItems = jsonResponse
          .map((data) => Item.fromJson(data))
          .where((item) => item.category == categoryId && item.region == regionId)
          .toList();
      return filteredItems;
    } else {
      throw Exception('Failed to load items');
    }
  }
 

  Future<List<Region>> fetchRegions() async {
    final response = await http.get(Uri.parse(regionsUrl));
    print('Regions API Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Region> regions = body.map((dynamic region) => Region.fromJson(region)).toList();
      regions.forEach((region) {
        print('Region: ${region.name}, Type: ${region.regionType}');
      });

      return regions;
    } else {
      throw Exception('Failed to load regions');
    }
  }
}
  
class ItemsByCategoryWidget extends StatefulWidget {
  final int categoryId;

  ItemsByCategoryWidget({required this.categoryId});

  @override
  _ItemsByCategoryWidgetState createState() => _ItemsByCategoryWidgetState();
}

class _ItemsByCategoryWidgetState extends State<ItemsByCategoryWidget> {
  List<Item> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: fetchItemsByCategory(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Item> uniqueItems = _getUniqueItems(snapshot.data!); // Filter unique items by name

          return Positioned(
            bottom: 0,
            right: 0,
            left: MediaQuery.of(context).size.width * 0.17 - 45,
            top: MediaQuery.of(context).size.height * 0.35 - 40,
            child: Container(
              width: 500,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: uniqueItems.map((item) {
                    bool isFavorite = favoriteItems.contains(item);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailPage(item: item),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 420,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color.fromARGB(129, 114, 114, 114),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 240,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: Image.network(
                                            item.picture,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.itemType,
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 123, 125, 123),
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item.name,
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: Colors.orange),
                                                SizedBox(width: 5),
                                                Icon(Icons.star, color: Colors.orange),
                                                SizedBox(width: 5),
                                                Icon(Icons.star, color: Colors.orange),
                                                SizedBox(width: 5),
                                                Icon(Icons.star, color: Colors.orange),
                                                SizedBox(width: 5),
                                                Icon(Icons.star, color: Colors.orange),
                                                SizedBox(width: 5),
                                                Text(
                                                  item.rating.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    icon: Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (isFavorite) {
                                          favoriteItems.remove(item);
                                        } else {
                                          favoriteItems.add(item);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load items'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<Item>> fetchItemsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> allItems = jsonResponse.map((data) => Item.fromJson(data)).toList();
      List<Item> filteredItems = _getUniqueItems(allItems.where((item) => item.category == categoryId).toList());
      return filteredItems;
    } else {
      throw Exception('Failed to load items');
    }
  }

  List<Item> _getUniqueItems(List<Item> items) {
    Set<String> itemNames = Set<String>();
    List<Item> uniqueItems = [];

    for (var item in items) {
      if (!itemNames.contains(item.name)) {
        itemNames.add(item.name);
        uniqueItems.add(item);
      }
    }

    return uniqueItems;
  }
}

 class FavoritesPage extends StatelessWidget {
  final List<Item> favoriteItems;

  FavoritesPage({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return ListTile(
            leading: Image.network(item.picture),
            title: Text(item.name),
            subtitle: Text(item.itemType),
          );
        },
      ),
    );
  }
}


class SearchResultsPage extends StatefulWidget {
  final String itemsUrl;

  SearchResultsPage({required this.itemsUrl});

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late Future<List<Item>> futureItems;
  List<Item> allItems = [];
  List<Item> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems(widget.itemsUrl);
  }

  Future<List<Item>> fetchItems(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Item> items = body.map((dynamic item) => Item.fromJson(item)).toList();
      setState(() {
        allItems = items;
        filteredItems = items;
      });
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: MediaQuery.of(context).size.height * 0.1 - 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 55,
                      width: 700,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: 'Choose a destination',
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  filterItems(value);
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1 + 55,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<List<Item>>(
                    future: futureItems,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading items.'));
                      } else {
                        return ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return ListTile(
                              title: Text(item.name),
                              subtitle: Text(item.itemType),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromARGB(130, 0, 0, 0), width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    item.picture,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemDetailPage(item: item),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 


class RegionDetailPage extends StatefulWidget {
  final Region region;
  final int categoryId;

  RegionDetailPage({required this.region, required this.categoryId});

  @override
  _RegionDetailPageState createState() => _RegionDetailPageState();
}

class _RegionDetailPageState extends State<RegionDetailPage> {
  late Future<List<Item>> futureItems;

  final Map<int, List<String>> regionImages = {
    1: [
            'assets/chhhh1.jpg',
      'assets/chhhh2.jpg',
      'assets/chhhh3.jpg',

    ],
    2: [
      'assets/chh1.jpg',
      'assets/chh2.jpg',
      'assets/chh3.jpg',
    ],
    3: [
      'assets/0a108c7adaefe04a07f6e4edb012b5f0.jpg',
      'assets/8nl0w46p1qo41.jpg',
      'assets/c6e809c5122beccc2e62bd6ec7603dc7_1.jpg',
    ],
    4: [
      'assets/002.jpg',
      'assets/jj.jpeg',
      'assets/S_233273.jpg',
    ],
  };

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems(widget.categoryId, widget.region.id);
  }

  Future<List<Item>> fetchItems(int categoryId, int regionId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> filteredItems = jsonResponse
          .map((data) => Item.fromJson(data))
          .where((item) => item.category == categoryId && item.region == regionId)
          .toList();
      return filteredItems;
    } else {
      throw Exception('Failed to load items');
    }
  }
 
  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text('Alphabetical'),
                onTap: () {
                  // Implement sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rating'),
                onTap: () {
                  // Implement sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date'),
                onTap: () {
                  // Implement sorting logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.region.name),
        backgroundColor: Color.fromARGB(255, 171, 220, 253),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Item>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading items. Please try again later.'));
          } else {
            final items = snapshot.data ?? [];
            if (items.isEmpty) {
              return Center(child: Text('No items available.'));
            } else {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            '${widget.region.regionType} in algeria',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Description: ${widget.region.description}',
                            style: TextStyle(
                              color: Color.fromARGB(146, 65, 65, 65),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3, 
                              itemBuilder: (context, index) {
                                String imagePath = regionImages[widget.region.id]![index]; // Get image path for the current region

                                return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imagePath,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => _showSortOptions(context),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 33, 149, 243),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(196, 156, 155, 155),
                                  width: 2,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sort',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '${items.length} activities found',
                              style: TextStyle(
                                color: Color.fromARGB(255, 154, 151, 151),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return _buildItemCard(items[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 142, 171, 215),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.picture,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Positioned(
             
              child: 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemType,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [

                      
                      Text(
                        '${item.timeString}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 10),
 ],
              ),
            ),
          )  ],
        ),
      ),
    );
  }
 }

class ItemDetailPage extends StatefulWidget {
  final Item item;

  ItemDetailPage({required this.item});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.item.picture,
      if (widget.item.picture1.isNotEmpty) widget.item.picture1,
      if (widget.item.picture2.isNotEmpty) widget.item.picture2,
      if (widget.item.picture3.isNotEmpty) widget.item.picture3,
      if (widget.item.picture4.isNotEmpty) widget.item.picture4,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (images.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 20), 
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.35,
                     
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: images.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: images.length,
                    effect: ScrollingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 6,
                      dotWidth: 6,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )
            else
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                color: Colors.grey, // Placeholder color
                child: Center(
                  child: Text(
                    'No image available',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.10,
                          letterSpacing: 0.10,
                        ),
                      ),
 
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(
                        '${widget.item.rating}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    '3113 reviews',
                    style: TextStyle(
                      color: Color.fromARGB(255, 23, 85, 255),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                      letterSpacing: 0.10,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          widget.item.description,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                      
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'About this activity',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Color.fromARGB(255, 74, 73, 73),
                      ),
                      SizedBox(width: 8), // Add space between the icon and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Opening times: ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 74, 73, 73),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                              letterSpacing: 0.10,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.item.timeString,
                            style: TextStyle(
                              color: Color.fromARGB(255, 23, 85, 255),
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Experience',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20),
                  ExpansionTile(
                    title: Text(
                      'Highlights',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 14, 12, 12),
                      size: 24,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(widget.item.highlight),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 1),
                  ExpansionTile(
                    title: Text(
                      'Full description',
                      style: TextStyle(
                        color: Color.fromARGB(255, 14, 12, 12),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 14, 12, 12),
                      size: 24,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(widget.item.fullDescription),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Itinerary',
                    style: TextStyle(
                      color: Color.fromARGB(255, 14, 12, 12),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  ExpansionTile(
                    title: Text(
                      'Itinerary',
                      style: TextStyle(
                        color: Color.fromARGB(255, 14, 12, 12),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 14, 12, 12),
                      size: 24,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(widget.item.url),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final int id;
  final String name;
  final String description;
  
  final String rating;
  final String itemType;
  final String fullDescription;
  final String highlight;
  final String url;
  final String timeString;
  final String picture;
  final String picture1;
  final String picture2;
  final String picture3;
  final String picture4;
  final int region;
  final int? wilayat;
  final int? category;

  Item({
    required this.id,
    required this.name,
    required this.description,
   
    required this.rating,
    required this.itemType,
    required this.fullDescription,
    required this.highlight,
    required this.url,
    required this.timeString,
    required this.picture,
    required this.picture1,
    required this.picture2,
    required this.picture3,
    required this.picture4,
    required this.region,
    this.wilayat,
    this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      
      rating: json['rating'],
      itemType: json['item_type'],
      fullDescription: json['full_description'],
      highlight: json['highlight'],
      url: json['url'],
      timeString: json['time_string'],
      picture: json['picture'],
      picture1: json['picture1'] ?? '',
      picture2: json['picture2'] ?? '',
      picture3: json['picture3'] ?? '',
      picture4: json['picture4'] ?? '',
      region: json['region'],
      wilayat: json['wilayat'],
      category: json['category'],
    );
  }
}


class WilayatAndItemsWidget extends StatelessWidget {
  final int categoryId;

  WilayatAndItemsWidget({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Wilaya>>(
      future: fetchWilayatByCategory(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load wilayat'));
        } else {
          final wilayat = snapshot.data ?? [];
          return SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: wilayat.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WilayaCard(
                          wilaya: wilayat[index],
                          categoryId: categoryId,
                        ),
                      );
                    },
                  ),
                ),
 ],
            ),
          );
    }
      },
    );
  }

  Future<List<Wilaya>> fetchWilayatByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/wilayat/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Wilaya> filteredWilayat = jsonResponse
          .map((data) => Wilaya.fromJson(data))
          .where((wilaya) => wilaya.category == categoryId)
          .toList();
      return filteredWilayat;
    } else {
      throw Exception('Failed to load wilayat');
    }
  }
}

class WilayaCard extends StatelessWidget {
  final Wilaya wilaya;
  final int categoryId;

  const WilayaCard({Key? key, required this.wilaya, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsByWilayaAndCategoryScreen(
              wilayaId: wilaya.id,
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              wilaya.picture,
              fit: BoxFit.cover,
              height: 300,
              width: 220,
            ),
          ),
          Positioned(
            bottom: 20, // Adjust the bottom value to position the text higher or lower
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Text(
                wilaya.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsByWilayaAndCategoryScreen extends StatefulWidget {
  final int wilayaId;
  final int categoryId;

  ItemsByWilayaAndCategoryScreen({required this.wilayaId, required this.categoryId});

  @override
  _ItemsByWilayaAndCategoryScreenState createState() => _ItemsByWilayaAndCategoryScreenState();
}

class _ItemsByWilayaAndCategoryScreenState extends State<ItemsByWilayaAndCategoryScreen> {
  late Future<List<Item>> futureItems;
  late Future<Wilaya> futureWilaya;

  @override
  void initState() {
    super.initState();
    futureWilaya = fetchWilaya(widget.wilayaId);
    futureItems = fetchItems(widget.wilayaId, widget.categoryId);
  }

  Future<Wilaya> fetchWilaya(int wilayaId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/wilayat/$wilayaId'));

    if (response.statusCode == 200) {
      return Wilaya.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load wilaya');
    }
  }

  Future<List<Item>> fetchItems(int wilayaId, int categoryId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/items/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Item> allItems = jsonResponse.map((data) => Item.fromJson(data)).toList();
      List<Item> uniqueItems = _getUniqueItems(allItems); // Filter unique items by name
      return uniqueItems.where((item) => item.wilayat == wilayaId && item.category == categoryId).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  List<Item> _getUniqueItems(List<Item> items) {
    // Use a set to track seen item names
    Set<String> itemNames = Set<String>();
    List<Item> uniqueItems = [];

    for (var item in items) {
      if (!itemNames.contains(item.name)) {
        itemNames.add(item.name);
        uniqueItems.add(item);
      }
    }

    return uniqueItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Items",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 171, 220, 253),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([futureWilaya, futureItems]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data. Please try again later.'));
          } else {
            final wilaya = snapshot.data![0] as Wilaya;
            final items = snapshot.data![1] as List<Item>;

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      wilaya.name,
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      wilaya.description,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    wilaya.picture,
                                    width: 400,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showSortOptions(context),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 33, 149, 243),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(196, 156, 155, 155),
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sort',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${items.length} activities found',
                            style: TextStyle(
                              color: Color.fromARGB(255, 154, 151, 151),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return _buildItemCard(items[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 142, 171, 215),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.picture,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Positioned(
             
              child: 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemType,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [

                      
                      Text(
                        '${item.timeString}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 10),
 ],
              ),
            ),
          )  ],
        ),
      ),
    );
  }
 
  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text('Alphabetical'),
                onTap: () {
                  // Implement sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rating'),
                onTap: () {
                  // Implement sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date'),
                onTap: () {
                  // Implement sorting logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

  
class Region {
  final int id;
  final String regionType;
  final String name;
  
  final String description;

  Region({
    required this.id,
    required this.regionType,
    required this.name,
    
    required this.description,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      regionType: json['region_type'],
      name: json['name'],
      
      description: json['description'],
    );
  }
}




 
class Wilaya {
  final int id;
  final String name;
  final String description;
  final String picture;
  final int? category;

  Wilaya({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    this.category,
  });

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
      category: json['category'],
    );
  }
}
 
class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['category'],
    );
  }
}
