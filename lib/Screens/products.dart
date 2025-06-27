import 'package:fe_petmaster/Components/pet_master_app_bar.dart';
import 'package:fe_petmaster/Components/pet_master_navigation_bar.dart';
import 'package:fe_petmaster/data/service/product_service.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';
import 'package:fe_petmaster/models/product.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key, required this.sessionData});

  final SessionData sessionData;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final ProductService _service = ProductService();
  List<Product> productsToShow = [];

  @override
  void initState() {
    super.initState();

    _service
        .getProducts()
        .then((products) {
          setState(() {
            productsToShow = products;
            print(productsToShow.length);
          });
        })
        .catchError((error) {
          print(error);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao buscar produtos: $error'),
              duration: const Duration(seconds: 2),
            ),
          );
        });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMasterAppBar(name: widget.sessionData.name),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: ListView.separated(
                  itemBuilder:
                      (context, index) => Container(
                        decoration: BoxDecoration(color: Colors.blue),
                        child: ProductCard(product: productsToShow[index]),
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: productsToShow.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PetMasterNavigationBar(currentIndex: 1),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        border: Border.all(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontFamily: "LeckerliOne", fontSize: 16.0),
            ),
            Text(
              "${product.quantityInStock.toString()} unidades",
              style: TextStyle(fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
