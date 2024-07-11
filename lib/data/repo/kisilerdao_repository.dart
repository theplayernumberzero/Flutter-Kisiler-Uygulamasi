import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository{

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    print("Kisi kaydet: $kisi_ad - $kisi_tel");
  }

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    print("Kisi kaydet: $kisi_id - $kisi_ad - $kisi_tel");
  }

  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Bahadir", kisi_tel: "58");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Umut", kisi_tel: "34");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Uzay", kisi_tel: "38");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);

    return kisilerListesi;
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Bahadir", kisi_tel: "58");
    kisilerListesi.add(k1);
    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async{
    print("Kisi sil: $kisi_id");
  }
}