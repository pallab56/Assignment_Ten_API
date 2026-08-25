import 'package:assignment10/controller/product_controller.dart';
import 'package:assignment10/model/product_model.dart';
import 'package:assignment10/screens/create_product.dart';
import 'package:assignment10/screens/edit_product.dart';
import 'package:assignment10/screens/widgets/button.dart';
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
      body: isLoading
          ? Center(child: CircularProgressIndicator(strokeWidth: 3))
          : Column(
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
                                product.img != null && product.img!.isNotEmpty
                                    ? product.img.toString()
                                    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAvf74EGdvKeVMLO9A9WWt1QZ3htqQoh6ozMNJL9nBk87TiltBpIyUIg8M&s=10',
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
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditProduct(
                                          data: product,
                                          instance: controller,
                                        ),
                                      ),
                                    );
                                    loadData();
                                  },
                                  icon: const Icon(Icons.edit_note),
                                  label: const Text('Edit'),
                                ),

                                IconButton(
                                  onPressed: () {
                                    _showDeleteDialog(
                                      context,
                                      product,
                                      product.sId.toString(),
                                    );
                                  },
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
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreateProduct(instance: controller),
            ),
          );

          loadData();
        },
        backgroundColor: Colors.blueGrey.shade800,
        tooltip: 'Add Product',

        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
    Data data,
    String productid,
  ) {
    final productId = productid;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Product'),
        content: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            children: [
              TextSpan(text: 'Are you sure you want to delete '),
              TextSpan(
                text: ' This ',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(text: 'product!'),
            ],
          ),
        ),
        actions: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    side: BorderSide(color: Colors.white12),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.deleteProduct(productId);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  loadData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    side: BorderSide(color: Colors.white12),
                  ),
                ),
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
