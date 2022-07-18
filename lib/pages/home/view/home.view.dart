import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';
import '../../../configs/configs.dart';
import '../../../providers/providers.dart';

const Color _bg = Colors.blue;

class HomeView extends StatelessWidget {
  final String title;
  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppbar(),
          const ListTopRCorner(),
          listItems(),
        ],
      ),
    );
  }

  SliverAppBar sliverAppbar() {
    return SliverAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Padding(padding: EdgeInsets.all(16.0), child: Text(Constants.appName)),
        ],
      ),
      expandedHeight: 230.0,
      floating: false,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: _bg,
          // child: const Center(child: Text('fooo')),
        ),
      ),
    );
  }

  Consumer listItems() {
    return Consumer(
      builder: (context, ref, child) {
        var transactions = ref.watch(transactionsProvider);
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return TransactionListItem(
                transaction: transactions[index],
                onDeleteTransaction: () {},
              );
            },
            childCount: transactions.length,
          ),
        );
      },
    );
  }
}

class ListTopRCorner extends StatelessWidget {
  const ListTopRCorner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 30;
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(color: _bg, height: height),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 2),
            width: double.infinity,
            // height: 30,
            child: const Text('Today'),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height),
                topRight: Radius.circular(height),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
