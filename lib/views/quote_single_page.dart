import 'package:crud_app/views/widgets/quote_single_card_widget.dart';
import 'package:flutter/material.dart';
import '../models/quotes_model.dart';
import '../repositories/quotes_service.dart';
import '../utils/global.dart';

class QuoteSinglePage extends StatefulWidget {
  final String quoteId;
  const QuoteSinglePage({super.key, required this.quoteId});

  @override
  State<QuoteSinglePage> createState() => _QuoteSinglePageState();
}

class _QuoteSinglePageState extends State<QuoteSinglePage> {
  QuotesService quotesService = QuotesService(apiService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Details'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/quotes_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder<QuotesModel>(
            future: quotesService.getSingleQuote(context, widget.quoteId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No Quotes Found'));
              } else {
                return QuoteSingleCardWidget(quote: snapshot.data!);
              }
            },
          ),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blue[900])),
                    child: const Text(
                      'Return to All Quotes',
                      style: TextStyle(color: Colors.white),
                    )),
              ))
        ],
      ),
    );
  }
}
