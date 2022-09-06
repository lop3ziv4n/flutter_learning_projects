import '../models/centile.dart';
import '../providers/centile_provider.dart';
import '../data/centile_data.dart';

class CentileService {
  Future<ResponseCentileData> getCentiles(String centileId) async {
    final CentileProvider centileProvider = CentileProvider();
    return await centileProvider.getById(id: centileId);
  }

  List<CentileData> getCentilesData(List<Centilo> centiles) {
    List<CentileData> centilesData = [];

    for (Centilo centile in centiles) {
      centilesData.add(CentileData(
          edad: centile.edad,
          centile3: centile.centilo3,
          centile10: centile.centilo10,
          centile25: centile.centilo25,
          centile50: centile.centilo50,
          centile75: centile.centilo75,
          centile90: centile.centilo90,
          centile97: centile.centilo97));
    }

    return centilesData;
  }
}
