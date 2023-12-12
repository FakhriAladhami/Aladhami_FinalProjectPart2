import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../repositories/api_service.dart';

const storage = FlutterSecureStorage();
// Base URL means, root or main domain of the API which you are using.
final apiService = ApiService(baseUrl: 'https://api.quotable.io');

const globalUsername = 'admin';
const globalPassword = 'Password1';
