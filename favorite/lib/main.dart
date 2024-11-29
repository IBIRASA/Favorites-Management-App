import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import 'favorites_screen.dart'; // Import for the Favorites screen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> products = [
    'Laptop',
    'Headphones',
    'Charger',
    'Mouse',
    'PC Stand',
    'Fan',
    'Keyboard',
    'Mouse Pad',
    'Earphone',
    'Speaker',
  ];
  final Map<String, bool> _favoriteStatus = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List',
            style: TextStyle(color: Colors.white)), 
        backgroundColor: const Color.fromARGB(
            255, 2, 36, 65),
      ),
      backgroundColor: const Color.fromARGB(
          255, 2, 36, 65), 
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          bool isFavorite = _favoriteStatus[product] ?? false;

          return Card(
            color:
                Colors.blue[50],
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product,
                  style: const TextStyle(
                      color: Colors.black)), 
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isFavorite) {
                      
                      _favoriteStatus[product] = false;
                    } else {
                     
                      _favoriteStatus[product] = true;
                      Provider.of<Favorites>(context, listen: false)
                          .addItem(product);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isFavorite
                        ? Colors.red
                        : Colors.transparent, 
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: isFavorite
                        ? Colors.white
                        : const Color.fromARGB(
                            255, 95, 95, 95), 
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritesScreen()),
          );
        },
      ),
    );
  }
}
