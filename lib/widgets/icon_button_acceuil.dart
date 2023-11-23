import 'package:flutter/material.dart';

class IconButtonAcceuil extends StatefulWidget {
  const IconButtonAcceuil({super.key});

  @override
  State<IconButtonAcceuil> createState() => _IconButtonAcceuilState();
}

class _IconButtonAcceuilState extends State<IconButtonAcceuil> {
  List data = [
    {'icon': Icons.get_app, 'Text': 'Fournisseur'},
    {'icon': Icons.production_quantity_limits, 'Text': 'Produit'},
    {'icon': Icons.sell, 'Text': 'Vente'},
    {'icon': Icons.abc, 'Text': 'Facture'},
    {'icon': Icons.inventory, 'Text': 'Stock'},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: ((context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.grey,
              child: SizedBox(
                width: 75,
                height: 75,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    data[index]['icon'],
                  ),
                  iconSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            Text(data[index]['Text']),
          ],
        );
      }),
    );
  }
}
