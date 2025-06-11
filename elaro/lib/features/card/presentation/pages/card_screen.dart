import 'package:elaro/features/card/presentation/bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Savatch")),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is CardLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CardErrorState) {
            return Center(child: Text(state.error.toString()));
          }
          if (state is CardSuccessS) {
            if (state.products.isEmpty) {
              return Center(child: Text("Ma'lumot yoq"));
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final produc = state.products[index];
                return ListTile(title: Text(produc.nameUz));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
