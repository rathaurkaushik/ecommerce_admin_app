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
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add New Product',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(hintText: 'Product Name'),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: 'Product Description',
                maxLines: 4,
              ),
              const SizedBox(height: 10),
              const CustomTextField(hintText: 'Image URL'),
              const SizedBox(height: 10),
              const CustomTextField(hintText: 'Product Price'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownBtn(
                      items: ['Cat1', 'Cat2', 'Cat3'],
                      selectedItem: 'Category', onSelected: (selectedValue) {
                        print(selectedValue);
                    },
                    ),
                  ),
                  const SizedBox(width: 10), // Proper spacing for Row
                  Expanded(
                    child: DropdownBtn(
                      items: ['Brand1', 'Brand2', 'Brand3'],
                      selectedItem: 'Brand', onSelected: (selectedValue) {  },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Offer Product ?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                  child: DropdownBtn(
                items: ['true', 'false'], selectedItem: 'Offer', onSelected: (selectedValue) {  },
              )),
              const SizedBox(height: 30),
              Center(
                child: InkWell(
                  onTap: () {
                    // Handle product submission
                    print('Add Product button tapped!');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Add Product',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
