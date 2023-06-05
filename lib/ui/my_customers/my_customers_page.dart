// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/authentication/customer_cookie_cubit.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/address/address/address_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/featured_product_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/login_as_customer_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/customer_id_cubit.dart';
import 'package:kibanda_kb/cubits/kibandalist/kibandalist_cubit.dart';
import 'package:kibanda_kb/models/customer_token_model.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/kibanda_reg_form.dart';

class MyCustomersPage extends StatefulWidget {
  const MyCustomersPage({super.key});

  @override
  State<MyCustomersPage> createState() => _MyCustomersPageState();
}

class _MyCustomersPageState extends State<MyCustomersPage> {
  var controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          context.read<LoadingMoreCubit>().setLoadingMore(true);
          context.read<KibandalistCubit>().state.maybeWhen(
                orElse: () {},
                success: (kibandaskistores, currentPage, isLast) {
                  if (!isLast) {
                    context.read<KibandalistCubit>().getMoreVibandas(
                        kibandaskis: kibandaskistores!, page: currentPage);
                  }
                },
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('My Customers'),
                // background: FlutterLogo(),
              ),
            ),
            BlocBuilder<LoadingMoreCubit, bool>(builder: (context, state) {
              if (state) {
                return const SliverToBoxAdapter(
                  child: LinearProgressIndicator(),
                );
              } else {
                return const SliverToBoxAdapter();
              }
            }),
            SliverFillRemaining(
              child: BlocConsumer<KibandalistCubit, KibandalistState>(
                listener: (context, state) {
                  state.maybeWhen(orElse: () {
                    context.read<LoadingMoreCubit>().setLoadingMore(false);
                  }, failed: () {
                    context.read<LoadingMoreCubit>().setLoadingMore(false);
                  }, success: (kibandalist, page, isLast) {
                    context.read<LoadingMoreCubit>().setLoadingMore(false);
                  });
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () {
                        return Container();
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      success: (kibandalist, page, isLast) => ListView.builder(
                            controller: controller,
                            itemCount: kibandalist!.length,
                            itemBuilder: (context, index) {
                              final kibanda = kibandalist[index];
                              return ListTile(
                                onTap: () {
                                  showBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Card(
                                          elevation: 20,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Icon(
                                                    CupertinoIcons.person),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                    '${kibanda.firstname!} ${kibanda.lastname!}'),
                                                CupertinoButton(
                                                  onPressed: () {
                                                    //Call the customer
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                          CupertinoIcons.phone),
                                                      Text(
                                                          '${kibanda.telephone}')
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: BlocConsumer<
                                                      LoginAsCustomerCubit,
                                                      LoginAsCustomerState>(
                                                    listener: (context, state) {
                                                      state.maybeWhen(
                                                          orElse: () {},
                                                          success:
                                                              (responseData) {
                                                            var data =
                                                                responseData[
                                                                    'token'];
                                                            var customerID = int
                                                                .parse(responseData[
                                                                        'data'][
                                                                    'customer_id']);
                                                            var cookieData =
                                                                responseData[
                                                                    'cookie'];
                                                            context
                                                                .read<
                                                                    CustomerTokenCubit>()
                                                                .saveToken(
                                                                    data);
                                                            context
                                                                .read<
                                                                    CustomerIdCubit>()
                                                                .saveToken(
                                                                    customerID);
                                                            context
                                                                .read<
                                                                    CustomerCookieCubit>()
                                                                .saveToken(
                                                                    cookieData);
                                                            CustomerCookieCubit
                                                                cookieCubit =
                                                                BlocProvider.of<
                                                                        CustomerCookieCubit>(
                                                                    context);
                                                            GetIt.I
                                                                .registerSingleton(
                                                                    cookieCubit);
                                                            GetIt.I.registerSingleton<
                                                                    CustomerTokenModel>(
                                                                CustomerTokenModel(
                                                                    token: data,
                                                                    cookie:
                                                                        cookieData));
                                                            context
                                                                .read<
                                                                    AddressCubit>()
                                                                .getAddresses();

                                                            context
                                                                .read<
                                                                    FeaturedProductCubit>()
                                                                .getFeaturedProducts(
                                                                  page: 1,
                                                                  customerId:
                                                                      customerID,
                                                                );
                                                            AutoRouter.of(
                                                                    context)
                                                                .push(
                                                                    const ProductsRoute());
                                                          });
                                                    },
                                                    builder: (context, state) {
                                                      return state.maybeWhen(
                                                        loading: () {
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        },
                                                        orElse: () {
                                                          return CupertinoButton(
                                                              color: Palette
                                                                  .greenColor,
                                                              child: const Text(
                                                                  'Place order for this customer'),
                                                              onPressed:
                                                                  () async {
                                                                var selectedKibanda =
                                                                    kibandalist[
                                                                        index];

                                                                context
                                                                    .read<
                                                                        LoginAsCustomerCubit>()
                                                                    .loginAsCustomer(
                                                                        selectedKibanda:
                                                                            selectedKibanda);
                                                              });
                                                        },
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                title: Text(
                                    '${kibanda.firstname!} ${kibanda.lastname!}'),
                                subtitle: Text('${kibanda.telephone}'),
                              );
                            },
                          ));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => KibandaRegForm())));
          },
          child: const Icon(Icons.add),
        ));
  }
}
