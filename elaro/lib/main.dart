import 'package:elaro/core/services/dependency_injection_instance.dart';
import 'package:elaro/features/main/presentation/pages/main_pages.dart';
import 'package:elaro/features/products/presentation/blocs/product_bloc/product_bloc_bloc.dart';
import 'package:elaro/features/products/presentation/blocs/products_bloc/products_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductBloc>()),
        BlocProvider(create: (context) => sl<ProductsBloc>()),
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Elaro",
        home: MainPage(),
      ),
    );
  }
}
