// ignore_for_file: invalid_use_of_visible_for_testing_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kibanda_kb/cubits/cubit/featured_product_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/customer_id_cubit.dart';
import 'package:kibanda_kb/ui/home/product/product_tile.dart';

import '../../../cubits/cubit/category_products_refresh_cubit/category_products_refresh_cubit.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
          builder: (context, state) {
            return state.maybeWhen(loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, success: (
              products,
              isLast,
              page,
            ) {
              loadMore() async {
                var prod = await context.read<FeaturedProductCubit>().getMore(
                    page: page + 1,
                    customerId: context.read<CustomerIdCubit>().state);
                context.read<FeaturedProductCubit>().saveState(
                    FeaturedProductState.success(
                        page: page + 1,
                        isLast: isLast,
                        products: [...products, ...prod]));
                context.read<CategoryProductsRefreshCubit>().reset();
                setState(() {});
              }

              var scrollController = ScrollController();
              scrollController.addListener(() {
                if (scrollController.position.pixels ==
                    scrollController.position.maxScrollExtent) {
                  loadMore();
                }
              });
              return ListView.builder(
                controller: scrollController,
                itemCount: products.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                  return ProductTile(product: products[index]);
                },
              );
            }, orElse: () {
              return Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/svgs/Lazy.svg',
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
