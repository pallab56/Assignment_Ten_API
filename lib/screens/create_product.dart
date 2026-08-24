import 'package:assignment10/screens/widgets/button.dart';
import 'package:assignment10/screens/widgets/text_field.dart';
import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  const new({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Product')),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .13),
            _titleText(context),
            SizedBox(height: 15),
            InputTextField(hintText: 'ProductName..',controller: productNameController,),
            SizedBox(height: 7,),

            InputTextField(hintText: 'ProductCode..',controller: productCodeController,),
            SizedBox(height: 7,),

            InputTextField(hintText: 'ProductImage..',controller: productImageController,),
            SizedBox(height: 7,),

            InputTextField(hintText: 'ProductQuantity..',controller: productQuantityController,),
            SizedBox(height: 7,),

            InputTextField(hintText: 'ProductPrice..',controller: productPriceController,),
            SizedBox(height: 7,),

            InputTextField(hintText: 'ProductTotalPrice..',controller: productTotalPriceController,),
            SizedBox(height: 20,),
            MyButton(title: 'Create Product', ontap: (){}),
          ],
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
