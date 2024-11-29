import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white, 
          ),
        ),
        backgroundColor:
            const Color.fromARGB(255, 2, 36, 65), 
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
      ),
      backgroundColor: const Color.fromARGB(
          255, 2, 36, 65), 
      body: Consumer<Favorites>(
        builder: (context, favorites, child) {
          return ListView.builder(
            itemCount: favorites.items.length,
            itemBuilder: (context, index) {
              final item = favorites.items[index];
              return Card(
                color: Colors
                    .white, 
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black, 
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black, 
                    ),
                    onPressed: () {
                      favorites.removeItem(item);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
