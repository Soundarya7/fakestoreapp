import 'package:fakestoreapp/Models/Propertystate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final Product property;
  const DetailsScreen({super.key, required this.property});

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Product property = widget.property;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Product Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      property.image,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    property.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                   Text(
                    'category :${property.category}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                   Text(
                    'Price :${property.price}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      // Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          '${property.description}\n',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text('${property.rating.rate} (${property.rating.count})',
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.black)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
