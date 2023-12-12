import 'dart:async';
import 'package:flutter/material.dart';

import '../models/quotes_model.dart';
import 'api_service.dart';

class QuotesService {
  final ApiService apiService;
  QuotesService(this.apiService);

  Future<List<QuotesModel>> getQuotes(BuildContext context) async {
    try {
      final response = await apiService.get('/quotes/random?limit=20');
      List<dynamic> jsonData = response as List<dynamic>;
      return jsonData.map((data) => QuotesModel.fromJson(data)).toList();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Fetching Data")));
      return [];
    }
  }

  Future<QuotesModel> getSingleQuote(
      BuildContext context, String quoteId) async {
    try {
      final response = await apiService.get('/quotes/$quoteId');
      return QuotesModel.fromJson(response);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Fetching Data")));
      return QuotesModel.fromJson({});
    }
  }
}
