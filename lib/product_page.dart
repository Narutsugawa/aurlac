import 'package:flutter/material.dart';
import 'package:aurlac/models/database_helper.dart';
import 'package:aurlac/models/product.dart';
import 'package:aurlac/widgets/decoration_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Expanded(
              child: buildProductList(),
            ),
            const DecorationCard(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 5,
      shadowColor: Colors.black54,
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                // Tu peux ajouter des actions ici
              },
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                // Tu peux ajouter des actions ici
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        )
      ],
      backgroundColor: const Color.fromARGB(255, 255, 228, 94),
      title: const Text(
        'Aurlac',
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildProductList() {
    return FutureBuilder<List<Product>>(
      future: DatabaseHelper.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Aucun produit trouvé.'));
        } else {
          List<Product> productList = snapshot.data!;
          return ListView.separated(
            itemCount: productList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (context, index) {
              return buildProductListItem(productList[index]);
            },
          );
        }
      },
    );
  }

  Widget buildProductListItem(Product product) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(child: Text(product.name)),
                  buildIconButton(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(product.stockQuantity.toString()),
        ),
      ],
    );
  }

  Widget buildIconButton() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // Action à effectuer lors du clic sur le bouton "Ajouter"
          },
          icon: const Icon(Icons.add),
          iconSize: 20,
          splashRadius: 5,
        ),
        IconButton(
          onPressed: () {
            // Action à effectuer lors du clic sur le bouton "Retirer"
          },
          icon: const Icon(Icons.remove),
          iconSize: 20,
          splashRadius: 5,
        ),
        IconButton(
          onPressed: () {
            // Action à effectuer lors du clic sur le bouton "Ajouter au panier"
          },
          icon: const Icon(Icons.add_shopping_cart),
          iconSize: 20,
          splashRadius: 5,
        ),
      ],
    );
  }
}
