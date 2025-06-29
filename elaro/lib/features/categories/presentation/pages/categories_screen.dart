import 'dart:developer';
import 'package:elaro/core/interceptor/interceptor.dart';
import 'package:elaro/features/categories/data/repository/categories_repository_impl.dart';
import 'package:elaro/features/categories/presentation/bloc/categorie_bloc.dart';
import 'package:elaro/features/categories/presentation/widgets/categorie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

DioClient client = DioClient();

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesRepositoryImpl repository = CategoriesRepositoryImpl(client);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategorieBloc(repository)..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Categories'),
        ),
        body: BlocBuilder<CategorieBloc, CategorieState>(
          builder: (context, state) {
            log('Current state: $state');

            if (state is CategorieLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.amber),
              );
            }
            if (state is CategorieError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 64),
                    SizedBox(height: 16),
                    Text(
                      'Xatolik yuz berdi:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      state.error,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CategorieBloc>().add(GetCategoriesEvent());
                      },
                      child: Text('Qayta urinish'),
                    ),
                  ],
                ),
              );
            }

            if (state is CategorieSuccess) {
              if (state.data.isEmpty) {
                return Center(child: Text('Kategoriyalar topilmadi'));
              }

              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  // final category = state.data[index].data;
                  return CategorieWidget(data: state.data[index]);
                },
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Kategoriyalar yuklanmoqda...'),
                ],
              ),
            );
          },
        ),
        ),
    );
  }
}
