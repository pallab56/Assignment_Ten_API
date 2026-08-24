import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('CRUD_API')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1598327105666-5b89351aff97?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9iaWxlJTIwcGhvbmV8ZW58MHx8MHx8fDA%3D',
                          fit: BoxFit.contain,
                        ),
                      ),
                  
                      Text(
                        'Iphone pro max adfafaf af asf asf ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_note),
                              label: const Text('Edit'),
                            ),
                        
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline,color: Colors.red,size:28,),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey.shade800,
        tooltip: 'Add Product',

        child: Icon(Icons.add),
      ),
    );
  }
}
