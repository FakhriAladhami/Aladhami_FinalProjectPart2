import 'package:crud_app/models/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuoteSingleCardWidget extends StatelessWidget {
  final QuotesModel quote;
  const QuoteSingleCardWidget({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  quote.content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),
                Text(
                  '- ${quote.author}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Tags: ${quote.tags.join(", ")}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Length: ${quote.length} characters',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Date Added: ${DateFormat('yyyy-MM-dd').format(quote.dateAdded)}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
