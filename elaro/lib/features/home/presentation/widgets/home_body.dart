import 'package:elaro/core/constants/app_color.dart';
import 'package:elaro/core/services/dependency_injection_instance.dart';
import 'package:elaro/features/products/presentation/pages/products_screen.dart';
import 'package:elaro/features/products/presentation/widgets/my_carousel_widgett.dart';
import 'package:elaro/features/products/presentation/widgets/re_product_list.dart';
import 'package:elaro/features/products/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elaro/features/products/presentation/blocs/products_bloc/products_bloc_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<ProductsBloc>().add(ProductsFetchEvent());
    context.read<ProductsBloc>().add(ProductsFetchDiscountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsFailureState) {
              return Center(child: Text(state.error));
            }
            if (state is ProductsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200, 
                    child: MyCarouselWidgett(items: state.data),
                  ),
                  const SizedBox(height: 10),
                  TitleWidget(
                    title: "Tavsiya etilgan mahsulotlar",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (x) => ProductsScreen(data: state.data),
                        ),
                      );
                    },
                    btnText: "Hammasi",
                  ),
                  const SizedBox(height: 15),
                  
                  BlocProvider(
                    create: (context) => sl<ProductsBloc>()..add(ProductsFetchEvent()),
                    child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                        if (state is ProductsFailureState) {
                          return const SizedBox();
                        }
                        if (state is ProductsSuccessState) {
                          return SizedBox(
                            height: 300,
                            child: ReProductList(products: state.data),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  TitleWidget(
                    title: "Chegirmadagi mahsulotlar",
                    onTap: () {},
                    btnText: "Hammasi",
                  ),
                  const SizedBox(height: 15),

                  BlocProvider(
                    create: (context) => sl<ProductsBloc>()..add(ProductsFetchDiscountEvent()),
                    child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                        if (state is ProductsFailureState) {
                          return Center(child: Text(state.error.toString()));
                        }
                        if (state is ProductsSuccessState) {
                          return SizedBox(
                            height: 300, 
                            child: ReProductList(products: state.data),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}