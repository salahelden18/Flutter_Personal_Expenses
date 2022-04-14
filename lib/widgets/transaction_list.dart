import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) => Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    '${transactions[index].title}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date!),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteTransaction(transactions[index].id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
