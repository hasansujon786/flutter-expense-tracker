import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../../../models/models.dart';
import '../../../configs/configs.dart';

const Color _bg = Colors.blue;

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);
  final String title;

  static const routeName = '/';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Transaction> _userTransactions = demoTransactions;

  void _addNewTransaction(Transaction newTransaction) {
    setState(() {
      _userTransactions.insert(0, newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final media = MediaQuery.of(context);
    // final screenHeight = media.size.height - appBar.preferredSize.height - media.padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppbar(),
          const ListTopRCorner(),
          listItems(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NewTransactionInputModal.open(context, _addNewTransaction),
        tooltip: 'Create transaction',
        child: const Icon(Icons.add),
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

  SliverList listItems() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return TransactionListItem(
            transaction: _userTransactions[index],
            onDeleteTransaction: _deleteTransaction,
          );
        },
        childCount: _userTransactions.length,
      ),
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
