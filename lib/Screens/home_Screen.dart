import 'package:flutter/material.dart';
import 'package:mini_mart/Providers/product_provider.dart';
import 'package:mini_mart/Screens/cart.dart';
import 'package:mini_mart/Screens/product_list.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).items;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSilverAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 14)),
          buildProductSliverList(products),
          SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),

      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildSilverAppBar(){
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 120,
      backgroundColor: Colors.teal[200],
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/mini_mart.png',
        height: 55,
        width: 180,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 18),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10.5, end: 12.5),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.redAccent,
              elevation: 3,
              padding: EdgeInsets.all(2.5),
            ),
            badgeContent: const SizedBox.shrink(),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 30,),
              onPressed: () {},
            ),
          ),
        ),
      ],

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.11),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.search_outlined),
                ),
                suffixIcon: SizedBox(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        VerticalDivider(
                          color: Color(0xffDDDADA),
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.8,
                          width: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.filter_alt_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search...',
                hintStyle: const TextStyle(
                  color: Color(0xffDDDADA),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return Opacity(
      opacity: 0.7,
      child: SizedBox(
        height: 56,
        width: 133,
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
          backgroundColor: Colors.teal[200],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6),
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



