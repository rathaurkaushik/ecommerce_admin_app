import 'package:ecommerce_admin/controller/home_controller.dart';
import 'package:ecommerce_admin/widgets/custom_text_field.dart';
import 'package:ecommerce_admin/widgets/dropdown_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Add New Product',
                            style: TextStyle(
                              fontSize: screenWidth > 400 ? 28 : 24,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.productNameController,
                          hintText: 'Enter Product Name',

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter product name';
                            }
                            return null;
                          }, keyboardType: TextInputType.text, labelText: 'Product Name',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.productDescriptionController,
                          hintText: 'Enter Product Description',
                          labelText: 'Description',
                          maxLines: 4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter product description';
                            }
                            return null;
                          }, keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.productImageController,
                          hintText: 'Enter Image URL',
                          labelText: 'Image URL',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter image URL';
                            }
                            return null;
                          }, keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.productPriceController,
                          hintText: 'Enter Product Price',
                          labelText: 'Price',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter product price';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid price';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownBtn(
                                items: ['Shoes', 'Sneakers', 'Boots', 'Loafers'],
                                selectedItem: controller.category,
                                onSelected: (selectedValue) {
                                  controller.category =
                                      selectedValue ?? 'Category';
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DropdownBtn(
                                items: ['Nike', 'Puma', 'Adidas', 'Gucci', 'Khaite'],
                                selectedItem: controller.brand,
                                onSelected: (selectedValue) {
                                  controller.brand = selectedValue ?? 'Brand';
                                  controller.update();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Offer Product?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: DropdownBtn(
                            items: ['true', 'false'],
                            selectedItem: controller.offer.toString(),
                            onSelected: (selectedValue) {
                              controller.offer = bool.tryParse(
                                  selectedValue ?? 'false') ??
                                  false;
                              controller.update();
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.addProduct();
                                Get.snackbar(
                                  'Success',
                                  'Product added successfully',
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              shadowColor: Colors.deepPurpleAccent,
                            ),
                            child: const Text(
                              'Add Product',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
  }

}
