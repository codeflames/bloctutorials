import 'dart:developer';

import 'package:counter_app/home/models/bored_panda_response.dart';
import 'package:counter_app/services/httpservice/http_service.dart';

class HomeRepository {
  final httpService = HttpService().dio;

  Future<BoredPandaResponse> getActivity() async {
    BoredPandaResponse boredPandaResponse = BoredPandaResponse();
    try {
      final response = await httpService.get('activity');
      boredPandaResponse = BoredPandaResponse.fromMap(response.data);
      // log(response.toString());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return boredPandaResponse;
  }
}
