import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/model/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  String category = 'Category';
  String brand = 'Brand';
  bool offer = false;
  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProduct();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
          id: doc.id,
          name: productNameController.text,
          image: productImageController.text,
          brand: brand,
          category: category,
          description: productDescriptionController.text,
          offer: offer,
          price: double.tryParse(productPriceController.text));

      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product add successfully',
          colorText: Colors.white, backgroundColor: Colors.green);
      setValueDefault();
      fetchProduct();
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
      setValueDefault();
    } finally {
      update();
    }
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection
          .get(); // get database product list in productSnapshot
      final List<Product> retrivedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrivedProducts);
      Get.snackbar('Success', 'Product fetch successfully',
          colorText: Colors.white, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProduct();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  setValueDefault() {
    productNameController.clear();
    productDescriptionController.clear();
    productImageController.clear();
    productPriceController.clear();

    category = 'Category';
    brand = 'Brand';
    offer = false;
    update();
  }
}
