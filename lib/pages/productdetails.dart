// product_details_page.dart
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final dynamic product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['thumbnail']),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price: \$${product['price']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rating: ${product['rating']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Description: ${product['description']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product['images'].length,
                      itemBuilder: (context, index) {
                        final imageUrl = product['images'][index];
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Image.network(imageUrl),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Swipe to view more images',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
