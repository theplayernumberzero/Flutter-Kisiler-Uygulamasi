import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{

  AnasayfaCubit():super(<Kisiler>[]);   //Boş bir değer

  var kRepo = KisilerDaoRepository();

  Future<void> kisileriYukle() async{   //Arayüze veri göndereceği için void olacak
    var liste = await kRepo.kisileriYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste = await kRepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async{
    await kRepo.sil(kisi_id);
    await kRepo.kisileriYukle();
  }
}