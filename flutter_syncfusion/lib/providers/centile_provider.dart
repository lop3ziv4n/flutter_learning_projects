import 'package:http/http.dart' as http;

import '../models/centile.dart';

class CentileProvider {
  static const String _urlProd = 'desarrollo.sap-web-dev.com';

  Future<ResponseCentileData> getById({required String id}) async {
    final response =
        await http.get(Uri.https(_urlProd, '/apicrecimiento/v1/centilos/$id'));
    return responseCentileDataFromJson(response.body);
  }
}
