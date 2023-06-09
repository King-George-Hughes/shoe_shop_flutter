import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/components/shoe_tile.dart';
import 'package:shoe_shop/models/cart.dart';
import 'package:shoe_shop/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // Alert the user, sho successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart 🛒'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
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
                  // Fet a shoe from shop list
                  Shoe shoe = value.getShoeList()[index];

                  // Return the shoe
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe),
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
      ),
    );
  }
}
