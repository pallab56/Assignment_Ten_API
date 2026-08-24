import 'package:assignment10/controller/product_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController controller = ProductController();

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await controller.getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('CRUD_API'),
      ),
      body:isLoading?Center(child: CircularProgressIndicator(strokeWidth: 3,),) :Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: controller.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 8,
              ),
              itemBuilder: ((context, index) {
                final product = controller.products[index];
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
                          product.img != null && product.img!.isNotEmpty?
                          product.img.toString():'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAvf74EGdvKeVMLO9A9WWt1QZ3htqQoh6ozMNJL9nBk87TiltBpIyUIg8M&s=10',
                          height: 140,
                          width: double.maxFinite,
                        ),
                      ),

                      Text(
                        product.productName.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Price : \$${product.unitPrice}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
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
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 28,
                            ),
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
