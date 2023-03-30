import 'package:flutter/material.dart';

import '../cardapio.dart';
import '../components/food_item.dart';

class FoodMenu extends StatelessWidget {
  FoodMenu({Key? key}) : super(key: key);
  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Menu',
                style: TextStyle(fontFamily: 'caveat', fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FoodItem(
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                  imageURI: items[index]['image'],
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
