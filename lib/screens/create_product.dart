// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment10/model/product_model.dart';
import 'package:flutter/material.dart';

import 'package:assignment10/controller/product_controller.dart';
import 'package:assignment10/screens/widgets/button.dart';
import 'package:assignment10/screens/widgets/text_field.dart';

class CreateProduct extends StatefulWidget {
  final ProductController instance;

  const CreateProduct({super.key, required this.instance});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final productNameController = TextEditingController();
  final productCodeController = TextEditingController();
  final productImageController = TextEditingController();
  final productQuantityController = TextEditingController();
  final productPriceController = TextEditingController();
  final productTotalPriceController = TextEditingController();
  late ProductController instance;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    instance = widget.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Product')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * .13),
              _titleText(context),
              SizedBox(height: 15),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      InputTextField(
                        hintText: 'ProductName..',
                        controller: productNameController,
                      ),
                      SizedBox(height: 7),
        
                      InputTextField(
                        hintText: 'ProductCode..',
                        controller: productCodeController,
                      ),
                      SizedBox(height: 7),
        
                      InputTextField(
                        hintText: 'ProductImage..',
                        controller: productImageController,
                      ),
                      SizedBox(height: 7),
        
                      InputTextField(
                        hintText: 'ProductQuantity..',
                        controller: productQuantityController,
                      ),
                      SizedBox(height: 7),
        
                      InputTextField(
                        hintText: 'ProductPrice..',
                        controller: productPriceController,
                      ),
                      SizedBox(height: 7),
        
                      InputTextField(
                        hintText: 'ProductTotalPrice..',
                        controller: productTotalPriceController,
                      ),
                      SizedBox(height: 20),
                      MyButton(
                        title: 'Create Product',
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            Data data = Data();
                            data.productName = productNameController.text;
                            data.productCode =int.parse(productCodeController.text) ;
                            data.img =  productImageController.text;
                            data.qty =int.parse(productQuantityController.text);
                            data.unitPrice = int.parse(productPriceController.text);
                            data.totalPrice =
                                int.parse(productTotalPriceController.text);
        
                            await instance.createProduct(data);
        
                            
                              if (context.mounted) {  
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("${data.productCode} product Added!.")),
                                  );
                                  Navigator.pop(context);
                                }
                            
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        children: [
          TextSpan(text: 'To create a '),
          TextSpan(
            text: ' Product ',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextSpan(text: 'you must have to provide these details!'),
        ],
      ),
    );
  }
}
