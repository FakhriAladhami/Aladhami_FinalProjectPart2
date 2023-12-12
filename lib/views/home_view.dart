import 'package:crud_app/repositories/quotes_service.dart';
import 'package:crud_app/views/widgets/quotes_card_widget.dart';
import 'package:flutter/material.dart';
import '../models/quotes_model.dart';
import '../utils/global.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  QuotesService quotesService = QuotesService(apiService);
  @override
  void initState() {
    quotesService.getQuotes(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await quotesService.getQuotes(context);
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Quotes Refreshed Successfully")));
                });
              },
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/quotes_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: FutureBuilder<List<QuotesModel>>(
              future: quotesService.getQuotes(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Quotes Found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        QuotesCardWidget(quote: snapshot.data![index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
