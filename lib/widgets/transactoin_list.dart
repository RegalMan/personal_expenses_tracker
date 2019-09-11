import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/models/transaction.dart';

class TransactonList extends StatelessWidget {
  final List<Transaction> transactions;
  BuildContext _context;
  TransactonList(this.transactions);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      height: 300,
      child: buildListViewWithBuilder(), // Or use buildListViewWithChildren
    );
  }

  Widget buildListViewWithBuilder() {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text('No transacton added'),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (buildcontext, index) {
              return buildTransactionCard(transactions[index]);
            },
            itemCount: transactions.length,
          );
  }

  ListView buildListViewWithChildren() {
    return ListView(
      children: transactions.map((tx) {
        return buildTransactionCard(tx);
      }).toList(),
    );
  }

  Card buildTransactionCard(Transaction tx) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(_context).primaryColor,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$${tx.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(_context).primaryColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat.yMMMd().format(tx.date),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
