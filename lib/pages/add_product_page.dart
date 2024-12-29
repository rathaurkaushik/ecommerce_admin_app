import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_admin/widgets/custom_text_field.dart';
import 'package:ecommerce_admin/widgets/dropdown_btn.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Add New Product',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              CustomTextField(hintText: 'Product Name'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Product Description',
                maxLines: 4,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hintText: 'Image Url'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hintText: 'Product Price'),
              SizedBox(height: 10,),
Row(children: [
  DropdownBtn(),
  SizedBox(height: 10,),
  DropdownBtn(),
  Center(child: Text('Offer Product ? '),),
  DropdownBtn(),
  SizedBox(height: 20,),
  InkWell(child:   Container(
    decoration: BoxDecoration(border: Border.),
    child: Text('Add Product'),
  ))
],)

            ],
          ),
        ),
      ),
    );
  }
}
