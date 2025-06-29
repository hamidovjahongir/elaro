import 'package:elaro/core/services/dependency_injection_instance.dart';
import 'package:elaro/features/card/data/model/card_mode.dart';
import 'package:elaro/features/card/data/repository/local_repository.dart';
import 'package:elaro/features/card/presentation/bloc/card_bloc.dart';
import 'package:elaro/features/main/presentation/pages/main_pages.dart';
import 'package:elaro/features/products/presentation/blocs/product_bloc/product_bloc_bloc.dart';
import 'package:elaro/features/products/presentation/blocs/products_bloc/products_bloc_bloc.dart';
import 'package:flutter/material.dart';   
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

final LocalCardRepository repository = LocalCardRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CardModeAdapter());
  Hive.registerAdapter(AttributeAdapter());
  Hive.registerAdapter(RasimAdapter());

  await serviceLocator();
  await repository.getInstance();

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
        BlocProvider(create: (context) => sl<CardBloc>()),
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Elaro",
        home: MainPage(),
      ),
    );
  }
}
