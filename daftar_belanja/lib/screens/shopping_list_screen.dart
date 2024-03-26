import 'package:daftar_belanja/service/shopping_service.dart';
import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _controller = TextEditingController();
  final shopping_services _shoppingService = shopping_services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Daftar Belanja",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          hintText: "Masukan Nama Barang"),
                    )),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        _shoppingService.addShoppingList(_controller.text);
                        _controller.clear();
                      },
                    ),
                  ],
                ),
                Expanded(
                    child: StreamBuilder<Map<String, String>>(
                  stream: _shoppingService.getShoppingList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, String> items = snapshot.data!;
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final key = items.keys.elementAt(index);
                            final item = items[key];
                            return ListTile(
                              title: Text(item!),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _shoppingService.removeShoppingItem(key);
                                },
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
