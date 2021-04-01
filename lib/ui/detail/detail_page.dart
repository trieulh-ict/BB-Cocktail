import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/ui/detail/widgets/detail_header.dart';
import 'package:bb_cocktail/ui/detail/widgets/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_cubit.dart';

class DetailPage extends StatefulWidget {
  final Drinks drink;

  const DetailPage({@required Drinks drink, Key key})
      : this.drink = drink,
        assert(drink != null),
        super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailCubit cubit;
  var isFavouriteUpdated = false;

  @override
  void initState() {
    cubit = getIt<DetailCubit>(param1: widget.drink)
      ..getCocktailDetail(widget.drink.idDrink);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          popScreen();
          return false;
        },
        child: Scaffold(
          body: BlocProvider<DetailCubit>(
            create: (context) => cubit,
            child: BlocBuilder<DetailCubit, DetailState>(
              builder: (context, state) {
                Widget detailBody;
                if (state is DetailSuccess) {
                  detailBody = _buildDetailInfo(state.drink);
                } else {
                  detailBody = _buildDetailLoading();
                }
                return Container(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 14, 14, 14)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildDetailImage(
                            state is DetailSuccess ? state.drink : widget.drink,
                            // ignore: avoid_bool_literals_in_conditional_expressions
                            state is DetailSuccess && state.isFavourite,
                            state is DetailSuccess),
                        detailBody
                      ],
                    ));
              },
            ),
          ),
        ),
      );

  Widget _buildDetailImage(
          Drinks drink, bool isFavourite, bool isFavouriteEnabled) =>
      Expanded(
        flex: 3,
        child: DetailHeader(
          drink: drink,
          isFavourite: isFavourite,
          onFavouriteTriggered: (Drinks drink) {
            cubit.toggleFavourite(drink);
            isFavouriteUpdated = true;
          },
          onNavigationPressed: isFavouriteEnabled ? popScreen : null,
        ),
      );

  void popScreen() {
    Navigator.pop(context, isFavouriteUpdated);
  }

  Widget _buildDetailLoading() =>
      Expanded(flex: 7, child: Center(child: CircularProgressIndicator()));

  Widget _buildDetailInfo(Drinks drink) => Expanded(
      flex: 7, child: SingleChildScrollView(child: DetailInfo(drink: drink)));
}
