import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

import '../cardapio.dart';

class DrinkMenu extends StatelessWidget {
  DrinkMenu({super.key});
  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Bebidas',
                style: TextStyle(fontSize: 28, fontFamily: 'caveat'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DrinkItem(
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                );
              },
              childCount: items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1
                        : 158 / 194),
          )
        ],
      ),
    );
  }
}
