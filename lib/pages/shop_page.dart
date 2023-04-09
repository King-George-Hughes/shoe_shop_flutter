import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_shop/components/shoe_tile.dart';
import 'package:shoe_shop/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // Search bar
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: GoogleFonts.sourceSansPro(color: Colors.grey),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: GoogleFonts.sourceSansPro(
                color: Colors.grey.shade600,
                fontSize: 16.0,
              ),
            ),
          ),

          // Hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks 🔥",
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  "See all",
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),

          // Contents
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                Shoe shoe = Shoe(
                    name: 'Air Jordan',
                    price: '\$200',
                    imagePath: 'images/4.jpg',
                    description: 'lorem ipsum dollor');
                return ShoeTile(
                  shoe: shoe,
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
