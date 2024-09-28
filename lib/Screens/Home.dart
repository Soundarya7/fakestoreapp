import 'package:fakestoreapp/Poviders/property.dart';
import 'package:fakestoreapp/Screens/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget{
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
   @override
  void initState() {
    super.initState();
    ref.read(propertyprovider.notifier).getProperties();
   
  }
  @override


  Widget build(BuildContext context) {
    final propertyState = ref.watch(propertyprovider);
    return Scaffold(
      body: Column(children: [
        Expanded(child: 
        SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 45),
                    child: Text('Products',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: propertyState.when(
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        error: (error, stack) =>
                            Center(child: Text('Error: $error')),
                        data: (properties) {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: properties.length,
                              itemBuilder: (context, index) {
                                // final item = _items[index];
                                final property = properties[index];
                                String imageurl = '${property.image}';
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: Card(
                                    elevation: 4.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0,
                                          bottom: 16,
                                          right: 16,
                                          left: 25),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(),
                                              Image.network(
                                               imageurl,
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(width: 16),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 7.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${property.title}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                              size: 16),
                                                          const SizedBox(
                                                              width: 4),
                                                          Text(
                                                              '${property.rating.rate} (${property.rating.count})',
                                                              style: const TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black)),
                                                        ],
                                                      ),
                                                      Text(
                                                         '\u{20B9}${property.price} ' ,
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                                FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                // Handle button press

                                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(property: property))
                                  );
                                               
                                              },
                                              child: const Text('View Details'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                  )
        ],),)),
        Padding(
          padding: const EdgeInsets.only(top:  8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){ ref.read(propertyprovider.notifier).sortByPriceAscending();}, child: Text(" Low to high")),
              ElevatedButton(onPressed: (){ ref.read(propertyprovider.notifier).sortByPriceDescending();}, child: Text(" High to Low")),
            ],
          ),
        )
      ],),

    );
  }
}