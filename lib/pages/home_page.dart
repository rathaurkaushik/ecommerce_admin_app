import 'package:ecommerce_admin/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foot Wear'),
      ),
      body:
      ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('Product Name'),
              subtitle: Text('100'),
              trailing: IconButton(
                  onPressed: () {
                    print('Delete');
                  },
                  icon: Icon(Icons.delete)));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(AddProductPage());
      }),
    );
  }
}
