import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({
    Key? key,
  }) : super(key: key);
  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Destaques do dia",
                style: TextStyle(
                  fontFamily: "caveat",
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HighlightItem(
                  imageURI: items[index]["image"],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                  itemDescription: items[index]['description'],
                );
              },
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
