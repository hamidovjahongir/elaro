import 'package:elaro/features/home/presentation/widgets/home_body.dart';
import 'package:elaro/features/products/presentation/blocs/products_bloc/products_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(ProductsFetchNewEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90 + MediaQuery.of(context).padding.top,
        backgroundColor: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        title: Column(
          children: [
            Text(
              "Elaro",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                  size: 20,
                ),
                hintText: "Qidirish",
              ),
            ),
          ],
        ),
      ),
      body: HomeBody(),
    );
  }
}
