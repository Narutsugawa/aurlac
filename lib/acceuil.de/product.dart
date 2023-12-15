import 'package:aurlac/acceuil.de/models/product_model.dart';
import 'package:aurlac/widgets/decoration_card.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 5,
            shadowColor: Colors.black54,
            // actions: [
            // //   Row(
            //     children: [
            //       IconButton(
            //           onPressed: () {}, icon: const Icon(Icons.notifications)),
            //       IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            //     ],
            //   )
            // ],
            backgroundColor: const Color.fromARGB(255, 255, 228, 94),
            title: const Text(
              'Aurlac',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: getProductList(),
              ),
              DecorationCard(),
            ],
          )),
    );
  }

  getProductList() {
    return ListView.separated(
      itemCount: productList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text(productList[index].productName)),
                      getIconButton(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(productList[index].productNumber.toString()),
            ),
          ],
        );
      },
    );
  }

  getIconButton() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
          ),
          iconSize: 20,
          splashRadius: 5,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove,
          ),
          iconSize: 20,
          splashRadius: 5,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_shopping_cart,
          ),
          iconSize: 20,
          splashRadius: 5,
        ),
      ],
    );
  }
}
