; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3648 () Bool)

(assert start!3648)

(declare-fun b!25305 () Bool)

(declare-fun b_free!769 () Bool)

(declare-fun b_next!769 () Bool)

(assert (=> b!25305 (= b_free!769 (not b_next!769))))

(declare-fun tp!3562 () Bool)

(declare-fun b_and!1557 () Bool)

(assert (=> b!25305 (= tp!3562 b_and!1557)))

(declare-fun e!16364 () Bool)

(declare-fun tp_is_empty!1033 () Bool)

(declare-fun e!16365 () Bool)

(declare-datatypes ((V!1203 0))(
  ( (V!1204 (val!543 Int)) )
))
(declare-datatypes ((ValueCell!317 0))(
  ( (ValueCellFull!317 (v!1624 V!1203)) (EmptyCell!317) )
))
(declare-datatypes ((array!1289 0))(
  ( (array!1290 (arr!608 (Array (_ BitVec 32) ValueCell!317)) (size!709 (_ BitVec 32))) )
))
(declare-datatypes ((array!1291 0))(
  ( (array!1292 (arr!609 (Array (_ BitVec 32) (_ BitVec 64))) (size!710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!220 0))(
  ( (LongMapFixedSize!221 (defaultEntry!1768 Int) (mask!4770 (_ BitVec 32)) (extraKeys!1660 (_ BitVec 32)) (zeroValue!1687 V!1203) (minValue!1687 V!1203) (_size!158 (_ BitVec 32)) (_keys!3193 array!1291) (_values!1752 array!1289) (_vacant!158 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!220 0))(
  ( (Cell!221 (v!1625 LongMapFixedSize!220)) )
))
(declare-datatypes ((LongMap!220 0))(
  ( (LongMap!221 (underlying!121 Cell!220)) )
))
(declare-fun thiss!938 () LongMap!220)

(declare-fun array_inv!429 (array!1291) Bool)

(declare-fun array_inv!430 (array!1289) Bool)

(assert (=> b!25305 (= e!16364 (and tp!3562 tp_is_empty!1033 (array_inv!429 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) (array_inv!430 (_values!1752 (v!1625 (underlying!121 thiss!938)))) e!16365))))

(declare-fun b!25306 () Bool)

(declare-datatypes ((tuple2!988 0))(
  ( (tuple2!989 (_1!503 Bool) (_2!503 LongMapFixedSize!220)) )
))
(declare-fun lt!9895 () tuple2!988)

(declare-fun call!2328 () tuple2!988)

(assert (=> b!25306 (= lt!9895 call!2328)))

(declare-datatypes ((tuple2!990 0))(
  ( (tuple2!991 (_1!504 Bool) (_2!504 Cell!220)) )
))
(declare-fun e!16363 () tuple2!990)

(assert (=> b!25306 (= e!16363 (tuple2!991 (_1!503 lt!9895) (Cell!221 (_2!503 lt!9895))))))

(declare-fun b!25307 () Bool)

(declare-fun e!16356 () Bool)

(declare-datatypes ((tuple3!18 0))(
  ( (tuple3!19 (_1!505 Bool) (_2!505 Cell!220) (_3!9 LongMap!220)) )
))
(declare-fun lt!9892 () tuple3!18)

(declare-datatypes ((tuple2!992 0))(
  ( (tuple2!993 (_1!506 (_ BitVec 64)) (_2!506 V!1203)) )
))
(declare-datatypes ((List!568 0))(
  ( (Nil!565) (Cons!564 (h!1131 tuple2!992) (t!3247 List!568)) )
))
(declare-datatypes ((ListLongMap!567 0))(
  ( (ListLongMap!568 (toList!299 List!568)) )
))
(declare-fun map!414 (LongMap!220) ListLongMap!567)

(assert (=> b!25307 (= e!16356 (not (= (map!414 (_3!9 lt!9892)) (map!414 thiss!938))))))

(declare-fun b!25308 () Bool)

(declare-fun e!16359 () Bool)

(declare-fun mapRes!1048 () Bool)

(assert (=> b!25308 (= e!16365 (and e!16359 mapRes!1048))))

(declare-fun condMapEmpty!1048 () Bool)

(declare-fun mapDefault!1048 () ValueCell!317)

(assert (=> b!25308 (= condMapEmpty!1048 (= (arr!608 (_values!1752 (v!1625 (underlying!121 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!317)) mapDefault!1048)))))

(declare-fun b!25309 () Bool)

(declare-fun e!16360 () tuple2!990)

(declare-fun lt!9887 () tuple2!988)

(declare-fun lt!9893 () tuple2!988)

(assert (=> b!25309 (= e!16360 (tuple2!991 (and (_1!503 lt!9887) (_1!503 lt!9893)) (Cell!221 (_2!503 lt!9893))))))

(declare-fun call!2327 () tuple2!988)

(assert (=> b!25309 (= lt!9887 call!2327)))

(declare-fun update!45 (LongMapFixedSize!220 (_ BitVec 64) V!1203) tuple2!988)

(assert (=> b!25309 (= lt!9893 (update!45 (_2!503 lt!9887) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938)))))))

(declare-fun b!25310 () Bool)

(assert (=> b!25310 (= e!16359 tp_is_empty!1033)))

(declare-fun mapIsEmpty!1048 () Bool)

(assert (=> mapIsEmpty!1048 mapRes!1048))

(declare-fun b!25312 () Bool)

(declare-fun e!16366 () tuple3!18)

(declare-fun lt!9890 () tuple2!990)

(assert (=> b!25312 (= e!16366 (tuple3!19 false (_2!504 lt!9890) thiss!938))))

(declare-fun b!25313 () Bool)

(declare-fun e!16355 () Bool)

(declare-fun e!16357 () Bool)

(assert (=> b!25313 (= e!16355 e!16357)))

(declare-fun b!25314 () Bool)

(declare-fun e!16354 () tuple2!990)

(declare-fun lt!9888 () tuple2!988)

(assert (=> b!25314 (= e!16354 (tuple2!991 (_1!503 lt!9888) (Cell!221 (_2!503 lt!9888))))))

(assert (=> b!25314 (= lt!9888 call!2328)))

(declare-fun lt!9896 () Cell!220)

(declare-fun lt!9894 () tuple2!988)

(declare-fun b!25315 () Bool)

(assert (=> b!25315 (= e!16366 (ite (_1!503 lt!9894) (tuple3!19 true (underlying!121 thiss!938) (LongMap!221 lt!9896)) (tuple3!19 false lt!9896 thiss!938)))))

(declare-fun repackFrom!8 (LongMap!220 LongMapFixedSize!220 (_ BitVec 32)) tuple2!988)

(assert (=> b!25315 (= lt!9894 (repackFrom!8 thiss!938 (v!1625 (_2!504 lt!9890)) (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!25315 (= lt!9896 (Cell!221 (_2!503 lt!9894)))))

(declare-fun b!25316 () Bool)

(declare-fun lt!9889 () LongMapFixedSize!220)

(assert (=> b!25316 (= e!16354 (tuple2!991 true (Cell!221 lt!9889)))))

(declare-fun b!25317 () Bool)

(assert (=> b!25317 (= e!16357 e!16364)))

(declare-fun bm!2324 () Bool)

(assert (=> bm!2324 (= call!2328 call!2327)))

(declare-fun res!15229 () Bool)

(declare-fun e!16361 () Bool)

(assert (=> start!3648 (=> (not res!15229) (not e!16361))))

(declare-fun valid!124 (LongMap!220) Bool)

(assert (=> start!3648 (= res!15229 (valid!124 thiss!938))))

(assert (=> start!3648 e!16361))

(assert (=> start!3648 e!16355))

(declare-fun b!25311 () Bool)

(assert (=> b!25311 (= e!16361 e!16356)))

(declare-fun res!15228 () Bool)

(assert (=> b!25311 (=> (not res!15228) (not e!16356))))

(assert (=> b!25311 (= res!15228 (_1!505 lt!9892))))

(assert (=> b!25311 (= lt!9892 e!16366)))

(declare-fun c!3513 () Bool)

(assert (=> b!25311 (= c!3513 (not (_1!504 lt!9890)))))

(assert (=> b!25311 (= lt!9890 e!16360)))

(declare-fun c!3512 () Bool)

(declare-fun lt!9891 () Bool)

(assert (=> b!25311 (= c!3512 (and (not lt!9891) (not (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!25311 (= lt!9891 (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!42 ((_ BitVec 32) Int) LongMapFixedSize!220)

(declare-fun computeNewMask!37 (LongMap!220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25311 (= lt!9889 (getNewLongMapFixedSize!42 (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) (defaultEntry!1768 (v!1625 (underlying!121 thiss!938)))))))

(declare-fun b!25318 () Bool)

(assert (=> b!25318 (= e!16360 e!16363)))

(declare-fun c!3515 () Bool)

(assert (=> b!25318 (= c!3515 (and (not lt!9891) (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!25319 () Bool)

(declare-fun e!16358 () Bool)

(assert (=> b!25319 (= e!16358 tp_is_empty!1033)))

(declare-fun b!25320 () Bool)

(declare-fun c!3514 () Bool)

(assert (=> b!25320 (= c!3514 (and (not (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9891))))

(assert (=> b!25320 (= e!16363 e!16354)))

(declare-fun bm!2325 () Bool)

(assert (=> bm!2325 (= call!2327 (update!45 lt!9889 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun mapNonEmpty!1048 () Bool)

(declare-fun tp!3561 () Bool)

(assert (=> mapNonEmpty!1048 (= mapRes!1048 (and tp!3561 e!16358))))

(declare-fun mapKey!1048 () (_ BitVec 32))

(declare-fun mapValue!1048 () ValueCell!317)

(declare-fun mapRest!1048 () (Array (_ BitVec 32) ValueCell!317))

(assert (=> mapNonEmpty!1048 (= (arr!608 (_values!1752 (v!1625 (underlying!121 thiss!938)))) (store mapRest!1048 mapKey!1048 mapValue!1048))))

(assert (= (and start!3648 res!15229) b!25311))

(assert (= (and b!25311 c!3512) b!25309))

(assert (= (and b!25311 (not c!3512)) b!25318))

(assert (= (and b!25318 c!3515) b!25306))

(assert (= (and b!25318 (not c!3515)) b!25320))

(assert (= (and b!25320 c!3514) b!25314))

(assert (= (and b!25320 (not c!3514)) b!25316))

(assert (= (or b!25306 b!25314) bm!2324))

(assert (= (or b!25309 bm!2324) bm!2325))

(assert (= (and b!25311 c!3513) b!25312))

(assert (= (and b!25311 (not c!3513)) b!25315))

(assert (= (and b!25311 res!15228) b!25307))

(assert (= (and b!25308 condMapEmpty!1048) mapIsEmpty!1048))

(assert (= (and b!25308 (not condMapEmpty!1048)) mapNonEmpty!1048))

(get-info :version)

(assert (= (and mapNonEmpty!1048 ((_ is ValueCellFull!317) mapValue!1048)) b!25319))

(assert (= (and b!25308 ((_ is ValueCellFull!317) mapDefault!1048)) b!25310))

(assert (= b!25305 b!25308))

(assert (= b!25317 b!25305))

(assert (= b!25313 b!25317))

(assert (= start!3648 b!25313))

(declare-fun m!20337 () Bool)

(assert (=> mapNonEmpty!1048 m!20337))

(declare-fun m!20339 () Bool)

(assert (=> b!25315 m!20339))

(declare-fun m!20341 () Bool)

(assert (=> b!25305 m!20341))

(declare-fun m!20343 () Bool)

(assert (=> b!25305 m!20343))

(declare-fun m!20345 () Bool)

(assert (=> b!25309 m!20345))

(declare-fun m!20347 () Bool)

(assert (=> start!3648 m!20347))

(declare-fun m!20349 () Bool)

(assert (=> b!25311 m!20349))

(assert (=> b!25311 m!20349))

(declare-fun m!20351 () Bool)

(assert (=> b!25311 m!20351))

(declare-fun m!20353 () Bool)

(assert (=> bm!2325 m!20353))

(declare-fun m!20355 () Bool)

(assert (=> b!25307 m!20355))

(declare-fun m!20357 () Bool)

(assert (=> b!25307 m!20357))

(check-sat (not b_next!769) b_and!1557 (not b!25307) tp_is_empty!1033 (not b!25309) (not b!25311) (not b!25315) (not start!3648) (not b!25305) (not bm!2325) (not mapNonEmpty!1048))
(check-sat b_and!1557 (not b_next!769))
(get-model)

(declare-fun b!25445 () Bool)

(declare-datatypes ((Unit!612 0))(
  ( (Unit!613) )
))
(declare-fun e!16461 () Unit!612)

(declare-fun Unit!614 () Unit!612)

(assert (=> b!25445 (= e!16461 Unit!614)))

(declare-fun b!25446 () Bool)

(declare-fun lt!10039 () tuple2!988)

(declare-fun call!2374 () tuple2!988)

(assert (=> b!25446 (= lt!10039 call!2374)))

(declare-fun e!16467 () tuple2!988)

(assert (=> b!25446 (= e!16467 (tuple2!989 (_1!503 lt!10039) (_2!503 lt!10039)))))

(declare-fun b!25448 () Bool)

(assert (=> b!25448 false))

(declare-fun lt!10029 () Unit!612)

(declare-fun lt!10043 () Unit!612)

(assert (=> b!25448 (= lt!10029 lt!10043)))

(declare-fun lt!10034 () (_ BitVec 64))

(declare-fun lt!10045 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!1291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25448 (not (arrayContainsKey!0 (_keys!3193 (v!1625 (underlying!121 thiss!938))) lt!10034 lt!10045))))

(declare-datatypes ((List!569 0))(
  ( (Nil!566) (Cons!565 (h!1132 (_ BitVec 64)) (t!3250 List!569)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1291 (_ BitVec 32) (_ BitVec 64) List!569) Unit!612)

(assert (=> b!25448 (= lt!10043 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3193 (v!1625 (underlying!121 thiss!938))) lt!10045 lt!10034 (Cons!565 lt!10034 Nil!566)))))

(assert (=> b!25448 (= lt!10045 (bvadd (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!10044 () Unit!612)

(declare-fun lt!10021 () Unit!612)

(assert (=> b!25448 (= lt!10044 lt!10021)))

(declare-fun arrayNoDuplicates!0 (array!1291 (_ BitVec 32) List!569) Bool)

(assert (=> b!25448 (arrayNoDuplicates!0 (_keys!3193 (v!1625 (underlying!121 thiss!938))) (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) Nil!566)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) Unit!612)

(assert (=> b!25448 (= lt!10021 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3193 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000000 (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10049 () Unit!612)

(declare-fun lt!10036 () Unit!612)

(assert (=> b!25448 (= lt!10049 lt!10036)))

(declare-fun e!16468 () Bool)

(assert (=> b!25448 e!16468))

(declare-fun c!3552 () Bool)

(assert (=> b!25448 (= c!3552 (and (not (= lt!10034 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10034 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!10038 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!4 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) (_ BitVec 32) Int) Unit!612)

(assert (=> b!25448 (= lt!10036 (lemmaListMapContainsThenArrayContainsFrom!4 (_keys!3193 (v!1625 (underlying!121 thiss!938))) (_values!1752 (v!1625 (underlying!121 thiss!938))) (mask!4770 (v!1625 (underlying!121 thiss!938))) (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))) lt!10034 lt!10038 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938)))))))

(assert (=> b!25448 (= lt!10038 (bvadd (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!615 () Unit!612)

(assert (=> b!25448 (= e!16461 Unit!615)))

(declare-fun c!3556 () Bool)

(declare-fun lt!10052 () ListLongMap!567)

(declare-fun bm!2364 () Bool)

(declare-fun lt!10024 () (_ BitVec 64))

(declare-fun lt!10035 () ListLongMap!567)

(declare-fun call!2371 () ListLongMap!567)

(declare-fun lt!10047 () V!1203)

(declare-fun +!46 (ListLongMap!567 tuple2!992) ListLongMap!567)

(assert (=> bm!2364 (= call!2371 (+!46 (ite c!3556 lt!10052 lt!10035) (ite c!3556 (tuple2!993 lt!10024 (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (tuple2!993 lt!10034 lt!10047))))))

(declare-fun b!25449 () Bool)

(assert (=> b!25449 (= c!3556 (bvsgt (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!16464 () tuple2!988)

(declare-fun e!16466 () tuple2!988)

(assert (=> b!25449 (= e!16464 e!16466)))

(declare-fun lt!10040 () (_ BitVec 64))

(declare-fun bm!2365 () Bool)

(declare-fun lt!10027 () ListLongMap!567)

(declare-fun call!2367 () ListLongMap!567)

(assert (=> bm!2365 (= call!2367 (+!46 (ite c!3556 lt!10027 lt!10035) (ite c!3556 (tuple2!993 lt!10034 lt!10047) (tuple2!993 lt!10040 (minValue!1687 (v!1625 (underlying!121 thiss!938)))))))))

(declare-fun lt!10033 () ListLongMap!567)

(declare-fun call!2368 () ListLongMap!567)

(declare-fun bm!2366 () Bool)

(assert (=> bm!2366 (= call!2368 (+!46 (ite c!3556 lt!10052 lt!10033) (tuple2!993 lt!10034 lt!10047)))))

(declare-fun bm!2367 () Bool)

(declare-fun call!2376 () ListLongMap!567)

(declare-fun call!2378 () ListLongMap!567)

(assert (=> bm!2367 (= call!2376 (+!46 call!2378 (tuple2!993 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun b!25450 () Bool)

(declare-fun e!16462 () Bool)

(declare-fun lt!10046 () tuple2!988)

(declare-fun map!415 (LongMapFixedSize!220) ListLongMap!567)

(assert (=> b!25450 (= e!16462 (= (map!415 (_2!503 lt!10046)) (map!415 (v!1625 (underlying!121 thiss!938)))))))

(declare-fun b!25451 () Bool)

(assert (=> b!25451 (= e!16467 (tuple2!989 true (v!1625 (_2!504 lt!9890))))))

(declare-fun b!25452 () Bool)

(declare-fun lt!10030 () tuple2!988)

(assert (=> b!25452 (= e!16466 (tuple2!989 true (_2!503 lt!10030)))))

(assert (=> b!25452 (= lt!10033 call!2378)))

(declare-fun lt!10042 () (_ BitVec 64))

(assert (=> b!25452 (= lt!10042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10032 () Unit!612)

(declare-fun call!2373 () Unit!612)

(assert (=> b!25452 (= lt!10032 call!2373)))

(declare-fun call!2379 () ListLongMap!567)

(declare-fun call!2370 () ListLongMap!567)

(assert (=> b!25452 (= call!2379 call!2370)))

(declare-fun lt!10050 () Unit!612)

(assert (=> b!25452 (= lt!10050 lt!10032)))

(assert (=> b!25452 (= lt!10035 call!2376)))

(assert (=> b!25452 (= lt!10040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10037 () Unit!612)

(declare-fun call!2372 () Unit!612)

(assert (=> b!25452 (= lt!10037 call!2372)))

(declare-fun call!2377 () ListLongMap!567)

(declare-fun call!2369 () ListLongMap!567)

(assert (=> b!25452 (= call!2377 call!2369)))

(declare-fun lt!10048 () Unit!612)

(assert (=> b!25452 (= lt!10048 lt!10037)))

(declare-fun b!25453 () Bool)

(declare-fun e!16463 () tuple2!988)

(assert (=> b!25453 (= e!16463 e!16464)))

(assert (=> b!25453 (= lt!10030 (update!45 (v!1625 (_2!504 lt!9890)) lt!10034 lt!10047))))

(declare-fun c!3557 () Bool)

(declare-fun lt!10051 () ListLongMap!567)

(declare-fun contains!233 (ListLongMap!567 (_ BitVec 64)) Bool)

(assert (=> b!25453 (= c!3557 (contains!233 lt!10051 lt!10034))))

(declare-fun lt!10031 () Unit!612)

(assert (=> b!25453 (= lt!10031 e!16461)))

(declare-fun c!3555 () Bool)

(assert (=> b!25453 (= c!3555 (_1!503 lt!10030))))

(declare-fun b!25454 () Bool)

(assert (=> b!25454 (= e!16464 (tuple2!989 false (_2!503 lt!10030)))))

(declare-fun bm!2368 () Bool)

(declare-fun call!2375 () ListLongMap!567)

(assert (=> bm!2368 (= call!2370 (+!46 (ite c!3556 call!2368 call!2375) (ite c!3556 (tuple2!993 lt!10024 (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (tuple2!993 lt!10034 lt!10047))))))

(declare-fun d!4763 () Bool)

(declare-fun e!16465 () Bool)

(assert (=> d!4763 e!16465))

(declare-fun res!15246 () Bool)

(assert (=> d!4763 (=> res!15246 e!16465)))

(assert (=> d!4763 (= res!15246 (not (_1!503 lt!10046)))))

(assert (=> d!4763 (= lt!10046 e!16463)))

(declare-fun c!3553 () Bool)

(assert (=> d!4763 (= c!3553 (and (not (= lt!10034 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10034 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!4763 (= lt!10051 (map!415 (v!1625 (_2!504 lt!9890))))))

(declare-fun get!398 (ValueCell!317 V!1203) V!1203)

(declare-fun dynLambda!142 (Int (_ BitVec 64)) V!1203)

(assert (=> d!4763 (= lt!10047 (get!398 (select (arr!608 (_values!1752 (v!1625 (underlying!121 thiss!938)))) (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (dynLambda!142 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4763 (= lt!10034 (select (arr!609 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4763 (valid!124 thiss!938)))

(assert (=> d!4763 (= (repackFrom!8 thiss!938 (v!1625 (_2!504 lt!9890)) (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) lt!10046)))

(declare-fun b!25447 () Bool)

(assert (=> b!25447 (= e!16468 (ite (= lt!10034 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!25455 () Bool)

(assert (=> b!25455 (= e!16465 e!16462)))

(declare-fun res!15247 () Bool)

(assert (=> b!25455 (=> (not res!15247) (not e!16462))))

(declare-fun valid!125 (LongMapFixedSize!220) Bool)

(assert (=> b!25455 (= res!15247 (valid!125 (_2!503 lt!10046)))))

(declare-fun b!25456 () Bool)

(assert (=> b!25456 (= e!16468 (arrayContainsKey!0 (_keys!3193 (v!1625 (underlying!121 thiss!938))) lt!10034 lt!10038))))

(declare-fun b!25457 () Bool)

(assert (=> b!25457 (= e!16463 e!16467)))

(declare-fun c!3554 () Bool)

(assert (=> b!25457 (= c!3554 (bvsgt (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!25458 () Bool)

(declare-fun lt!10025 () tuple2!988)

(assert (=> b!25458 (= e!16466 (tuple2!989 (_1!503 lt!10025) (_2!503 lt!10025)))))

(assert (=> b!25458 (= lt!10027 call!2378)))

(declare-fun lt!10026 () (_ BitVec 64))

(assert (=> b!25458 (= lt!10026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10028 () Unit!612)

(assert (=> b!25458 (= lt!10028 call!2372)))

(assert (=> b!25458 (= call!2377 call!2379)))

(declare-fun lt!10022 () Unit!612)

(assert (=> b!25458 (= lt!10022 lt!10028)))

(assert (=> b!25458 (= lt!10052 call!2376)))

(assert (=> b!25458 (= lt!10024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10023 () Unit!612)

(assert (=> b!25458 (= lt!10023 call!2373)))

(assert (=> b!25458 (= call!2370 call!2369)))

(declare-fun lt!10041 () Unit!612)

(assert (=> b!25458 (= lt!10041 lt!10023)))

(assert (=> b!25458 (= lt!10025 call!2374)))

(declare-fun bm!2369 () Bool)

(assert (=> bm!2369 (= call!2375 (+!46 (ite c!3556 lt!10027 lt!10033) (ite c!3556 (tuple2!993 lt!10026 (zeroValue!1687 (v!1625 (underlying!121 thiss!938)))) (tuple2!993 lt!10042 (zeroValue!1687 (v!1625 (underlying!121 thiss!938)))))))))

(declare-fun bm!2370 () Bool)

(assert (=> bm!2370 (= call!2377 (+!46 (ite c!3556 call!2367 call!2371) (ite c!3556 (tuple2!993 lt!10026 (zeroValue!1687 (v!1625 (underlying!121 thiss!938)))) (tuple2!993 lt!10040 (minValue!1687 (v!1625 (underlying!121 thiss!938)))))))))

(declare-fun bm!2371 () Bool)

(declare-fun addCommutativeForDiffKeys!4 (ListLongMap!567 (_ BitVec 64) V!1203 (_ BitVec 64) V!1203) Unit!612)

(assert (=> bm!2371 (= call!2372 (addCommutativeForDiffKeys!4 (ite c!3556 lt!10027 lt!10035) lt!10034 lt!10047 (ite c!3556 lt!10026 lt!10040) (ite c!3556 (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun bm!2372 () Bool)

(assert (=> bm!2372 (= call!2373 (addCommutativeForDiffKeys!4 (ite c!3556 lt!10052 lt!10033) lt!10034 lt!10047 (ite c!3556 lt!10024 lt!10042) (ite c!3556 (minValue!1687 (v!1625 (underlying!121 thiss!938))) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun bm!2373 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!16 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) Int) ListLongMap!567)

(assert (=> bm!2373 (= call!2378 (getCurrentListMapNoExtraKeys!16 (_keys!3193 (v!1625 (underlying!121 thiss!938))) (_values!1752 (v!1625 (underlying!121 thiss!938))) (mask!4770 (v!1625 (underlying!121 thiss!938))) (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))) (bvadd (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1768 (v!1625 (underlying!121 thiss!938)))))))

(declare-fun bm!2374 () Bool)

(assert (=> bm!2374 (= call!2379 (+!46 (ite c!3556 call!2375 call!2368) (ite c!3556 (tuple2!993 lt!10034 lt!10047) (tuple2!993 lt!10042 (zeroValue!1687 (v!1625 (underlying!121 thiss!938)))))))))

(declare-fun bm!2375 () Bool)

(assert (=> bm!2375 (= call!2369 (+!46 (ite c!3556 call!2371 call!2367) (tuple2!993 lt!10034 lt!10047)))))

(declare-fun bm!2376 () Bool)

(assert (=> bm!2376 (= call!2374 (repackFrom!8 thiss!938 (ite c!3553 (_2!503 lt!10030) (v!1625 (_2!504 lt!9890))) (bvsub (bvsub (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!4763 c!3553) b!25453))

(assert (= (and d!4763 (not c!3553)) b!25457))

(assert (= (and b!25453 c!3557) b!25448))

(assert (= (and b!25453 (not c!3557)) b!25445))

(assert (= (and b!25448 c!3552) b!25456))

(assert (= (and b!25448 (not c!3552)) b!25447))

(assert (= (and b!25453 c!3555) b!25449))

(assert (= (and b!25453 (not c!3555)) b!25454))

(assert (= (and b!25449 c!3556) b!25458))

(assert (= (and b!25449 (not c!3556)) b!25452))

(assert (= (or b!25458 b!25452) bm!2365))

(assert (= (or b!25458 b!25452) bm!2372))

(assert (= (or b!25458 b!25452) bm!2373))

(assert (= (or b!25458 b!25452) bm!2371))

(assert (= (or b!25458 b!25452) bm!2369))

(assert (= (or b!25458 b!25452) bm!2364))

(assert (= (or b!25458 b!25452) bm!2366))

(assert (= (or b!25458 b!25452) bm!2370))

(assert (= (or b!25458 b!25452) bm!2374))

(assert (= (or b!25458 b!25452) bm!2375))

(assert (= (or b!25458 b!25452) bm!2367))

(assert (= (or b!25458 b!25452) bm!2368))

(assert (= (and b!25457 c!3554) b!25446))

(assert (= (and b!25457 (not c!3554)) b!25451))

(assert (= (or b!25458 b!25446) bm!2376))

(assert (= (and d!4763 (not res!15246)) b!25455))

(assert (= (and b!25455 res!15247) b!25450))

(declare-fun b_lambda!1655 () Bool)

(assert (=> (not b_lambda!1655) (not d!4763)))

(declare-fun t!3249 () Bool)

(declare-fun tb!667 () Bool)

(assert (=> (and b!25305 (= (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) (defaultEntry!1768 (v!1625 (underlying!121 thiss!938)))) t!3249) tb!667))

(declare-fun result!1111 () Bool)

(assert (=> tb!667 (= result!1111 tp_is_empty!1033)))

(assert (=> d!4763 t!3249))

(declare-fun b_and!1563 () Bool)

(assert (= b_and!1557 (and (=> t!3249 result!1111) b_and!1563)))

(declare-fun m!20403 () Bool)

(assert (=> bm!2373 m!20403))

(declare-fun m!20405 () Bool)

(assert (=> d!4763 m!20405))

(declare-fun m!20407 () Bool)

(assert (=> d!4763 m!20407))

(declare-fun m!20409 () Bool)

(assert (=> d!4763 m!20409))

(declare-fun m!20411 () Bool)

(assert (=> d!4763 m!20411))

(assert (=> d!4763 m!20409))

(declare-fun m!20413 () Bool)

(assert (=> d!4763 m!20413))

(assert (=> d!4763 m!20407))

(assert (=> d!4763 m!20347))

(declare-fun m!20415 () Bool)

(assert (=> bm!2366 m!20415))

(declare-fun m!20417 () Bool)

(assert (=> b!25453 m!20417))

(declare-fun m!20419 () Bool)

(assert (=> b!25453 m!20419))

(declare-fun m!20421 () Bool)

(assert (=> b!25456 m!20421))

(declare-fun m!20423 () Bool)

(assert (=> bm!2369 m!20423))

(declare-fun m!20425 () Bool)

(assert (=> b!25448 m!20425))

(declare-fun m!20427 () Bool)

(assert (=> b!25448 m!20427))

(declare-fun m!20429 () Bool)

(assert (=> b!25448 m!20429))

(declare-fun m!20431 () Bool)

(assert (=> b!25448 m!20431))

(declare-fun m!20433 () Bool)

(assert (=> b!25448 m!20433))

(declare-fun m!20435 () Bool)

(assert (=> bm!2375 m!20435))

(declare-fun m!20437 () Bool)

(assert (=> bm!2371 m!20437))

(declare-fun m!20439 () Bool)

(assert (=> b!25450 m!20439))

(declare-fun m!20441 () Bool)

(assert (=> b!25450 m!20441))

(declare-fun m!20443 () Bool)

(assert (=> bm!2370 m!20443))

(declare-fun m!20445 () Bool)

(assert (=> bm!2374 m!20445))

(declare-fun m!20447 () Bool)

(assert (=> b!25455 m!20447))

(declare-fun m!20449 () Bool)

(assert (=> bm!2364 m!20449))

(declare-fun m!20451 () Bool)

(assert (=> bm!2376 m!20451))

(declare-fun m!20453 () Bool)

(assert (=> bm!2365 m!20453))

(declare-fun m!20455 () Bool)

(assert (=> bm!2368 m!20455))

(declare-fun m!20457 () Bool)

(assert (=> bm!2367 m!20457))

(declare-fun m!20459 () Bool)

(assert (=> bm!2372 m!20459))

(assert (=> b!25315 d!4763))

(declare-fun d!4765 () Bool)

(assert (=> d!4765 (= (array_inv!429 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) (bvsge (size!710 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25305 d!4765))

(declare-fun d!4767 () Bool)

(assert (=> d!4767 (= (array_inv!430 (_values!1752 (v!1625 (underlying!121 thiss!938)))) (bvsge (size!709 (_values!1752 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25305 d!4767))

(declare-fun d!4769 () Bool)

(assert (=> d!4769 (= (valid!124 thiss!938) (valid!125 (v!1625 (underlying!121 thiss!938))))))

(declare-fun bs!1052 () Bool)

(assert (= bs!1052 d!4769))

(declare-fun m!20461 () Bool)

(assert (=> bs!1052 m!20461))

(assert (=> start!3648 d!4769))

(declare-fun b!25545 () Bool)

(declare-fun e!16524 () Unit!612)

(declare-fun Unit!616 () Unit!612)

(assert (=> b!25545 (= e!16524 Unit!616)))

(declare-fun lt!10126 () Unit!612)

(declare-fun call!2450 () Unit!612)

(assert (=> b!25545 (= lt!10126 call!2450)))

(declare-datatypes ((SeekEntryResult!56 0))(
  ( (MissingZero!56 (index!2346 (_ BitVec 32))) (Found!56 (index!2347 (_ BitVec 32))) (Intermediate!56 (undefined!868 Bool) (index!2348 (_ BitVec 32)) (x!6012 (_ BitVec 32))) (Undefined!56) (MissingVacant!56 (index!2349 (_ BitVec 32))) )
))
(declare-fun lt!10125 () SeekEntryResult!56)

(declare-fun call!2441 () SeekEntryResult!56)

(assert (=> b!25545 (= lt!10125 call!2441)))

(declare-fun res!15278 () Bool)

(assert (=> b!25545 (= res!15278 ((_ is Found!56) lt!10125))))

(declare-fun e!16532 () Bool)

(assert (=> b!25545 (=> (not res!15278) (not e!16532))))

(assert (=> b!25545 e!16532))

(declare-fun lt!10119 () Unit!612)

(assert (=> b!25545 (= lt!10119 lt!10126)))

(assert (=> b!25545 false))

(declare-fun bm!2425 () Bool)

(declare-fun call!2434 () ListLongMap!567)

(declare-fun call!2439 () ListLongMap!567)

(assert (=> bm!2425 (= call!2434 call!2439)))

(declare-fun b!25546 () Bool)

(declare-fun e!16521 () Bool)

(declare-fun e!16531 () Bool)

(assert (=> b!25546 (= e!16521 e!16531)))

(declare-fun res!15276 () Bool)

(declare-fun call!2432 () Bool)

(assert (=> b!25546 (= res!15276 call!2432)))

(assert (=> b!25546 (=> (not res!15276) (not e!16531))))

(declare-fun bm!2426 () Bool)

(declare-fun call!2431 () ListLongMap!567)

(assert (=> bm!2426 (= call!2431 (map!415 (_2!503 lt!9887)))))

(declare-fun bm!2427 () Bool)

(declare-fun call!2438 () Bool)

(declare-fun call!2429 () Bool)

(assert (=> bm!2427 (= call!2438 call!2429)))

(declare-fun b!25547 () Bool)

(declare-fun lt!10130 () Unit!612)

(declare-fun lt!10107 () Unit!612)

(assert (=> b!25547 (= lt!10130 lt!10107)))

(declare-fun call!2428 () ListLongMap!567)

(declare-fun call!2437 () ListLongMap!567)

(assert (=> b!25547 (= call!2428 call!2437)))

(declare-fun lt!10108 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 V!1203 Int) Unit!612)

(assert (=> b!25547 (= lt!10107 (lemmaChangeZeroKeyThenAddPairToListMap!12 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) lt!10108 (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (_2!503 lt!9887)) (defaultEntry!1768 (_2!503 lt!9887))))))

(assert (=> b!25547 (= lt!10108 (bvor (extraKeys!1660 (_2!503 lt!9887)) #b00000000000000000000000000000001))))

(declare-fun e!16528 () tuple2!988)

(assert (=> b!25547 (= e!16528 (tuple2!989 true (LongMapFixedSize!221 (defaultEntry!1768 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (bvor (extraKeys!1660 (_2!503 lt!9887)) #b00000000000000000000000000000001) (minValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (_2!503 lt!9887)) (_size!158 (_2!503 lt!9887)) (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (_vacant!158 (_2!503 lt!9887)))))))

(declare-fun b!25548 () Bool)

(declare-fun e!16522 () Bool)

(declare-fun e!16519 () Bool)

(assert (=> b!25548 (= e!16522 e!16519)))

(declare-fun c!3591 () Bool)

(declare-fun lt!10129 () tuple2!988)

(assert (=> b!25548 (= c!3591 (_1!503 lt!10129))))

(declare-fun bm!2428 () Bool)

(declare-fun call!2442 () ListLongMap!567)

(assert (=> bm!2428 (= call!2428 call!2442)))

(declare-fun b!25549 () Bool)

(declare-fun res!15283 () Bool)

(assert (=> b!25549 (= res!15283 call!2438)))

(declare-fun e!16518 () Bool)

(assert (=> b!25549 (=> (not res!15283) (not e!16518))))

(declare-fun b!25550 () Bool)

(declare-fun e!16514 () tuple2!988)

(declare-fun lt!10132 () tuple2!988)

(assert (=> b!25550 (= e!16514 (tuple2!989 (_1!503 lt!10132) (_2!503 lt!10132)))))

(declare-fun call!2433 () tuple2!988)

(assert (=> b!25550 (= lt!10132 call!2433)))

(declare-fun b!25551 () Bool)

(declare-fun res!15288 () Bool)

(declare-fun lt!10112 () SeekEntryResult!56)

(assert (=> b!25551 (= res!15288 (= (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2349 lt!10112)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16527 () Bool)

(assert (=> b!25551 (=> (not res!15288) (not e!16527))))

(declare-fun b!25552 () Bool)

(declare-fun res!15280 () Bool)

(declare-fun lt!10116 () SeekEntryResult!56)

(assert (=> b!25552 (= res!15280 (= (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2349 lt!10116)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25552 (=> (not res!15280) (not e!16531))))

(declare-fun b!25553 () Bool)

(declare-fun e!16533 () ListLongMap!567)

(declare-fun call!2447 () ListLongMap!567)

(assert (=> b!25553 (= e!16533 call!2447)))

(declare-fun b!25554 () Bool)

(declare-fun lt!10113 () Unit!612)

(assert (=> b!25554 (= e!16524 lt!10113)))

(declare-fun call!2449 () Unit!612)

(assert (=> b!25554 (= lt!10113 call!2449)))

(assert (=> b!25554 (= lt!10112 call!2441)))

(declare-fun c!3597 () Bool)

(assert (=> b!25554 (= c!3597 ((_ is MissingZero!56) lt!10112))))

(declare-fun e!16526 () Bool)

(assert (=> b!25554 e!16526))

(declare-fun b!25555 () Bool)

(declare-fun e!16516 () Bool)

(declare-fun call!2440 () Bool)

(assert (=> b!25555 (= e!16516 (not call!2440))))

(declare-fun b!25556 () Bool)

(declare-fun e!16517 () Bool)

(declare-fun call!2436 () Bool)

(assert (=> b!25556 (= e!16517 (not call!2436))))

(declare-fun b!25557 () Bool)

(assert (=> b!25557 (= e!16531 (not call!2436))))

(declare-fun bm!2429 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) Int) Unit!612)

(assert (=> bm!2429 (= call!2450 (lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1768 (_2!503 lt!9887))))))

(declare-fun b!25558 () Bool)

(declare-fun res!15282 () Bool)

(declare-fun call!2445 () Bool)

(assert (=> b!25558 (= res!15282 call!2445)))

(assert (=> b!25558 (=> (not res!15282) (not e!16532))))

(declare-fun b!25559 () Bool)

(declare-fun e!16530 () tuple2!988)

(assert (=> b!25559 (= e!16514 e!16530)))

(declare-fun c!3598 () Bool)

(declare-fun lt!10117 () SeekEntryResult!56)

(assert (=> b!25559 (= c!3598 ((_ is MissingZero!56) lt!10117))))

(declare-fun b!25560 () Bool)

(declare-fun e!16525 () tuple2!988)

(declare-fun e!16534 () tuple2!988)

(assert (=> b!25560 (= e!16525 e!16534)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1291 (_ BitVec 32)) SeekEntryResult!56)

(assert (=> b!25560 (= lt!10117 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3193 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887))))))

(declare-fun c!3594 () Bool)

(assert (=> b!25560 (= c!3594 ((_ is Undefined!56) lt!10117))))

(declare-fun bm!2430 () Bool)

(declare-fun call!2430 () Bool)

(assert (=> bm!2430 (= call!2440 call!2430)))

(declare-fun d!4771 () Bool)

(assert (=> d!4771 e!16522))

(declare-fun res!15289 () Bool)

(assert (=> d!4771 (=> (not res!15289) (not e!16522))))

(assert (=> d!4771 (= res!15289 (valid!125 (_2!503 lt!10129)))))

(assert (=> d!4771 (= lt!10129 e!16525)))

(declare-fun c!3587 () Bool)

(assert (=> d!4771 (= c!3587 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4771 (valid!125 (_2!503 lt!9887))))

(assert (=> d!4771 (= (update!45 (_2!503 lt!9887) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938)))) lt!10129)))

(declare-fun b!25561 () Bool)

(declare-fun e!16513 () Bool)

(assert (=> b!25561 (= e!16513 e!16527)))

(declare-fun res!15286 () Bool)

(declare-fun call!2448 () Bool)

(assert (=> b!25561 (= res!15286 call!2448)))

(assert (=> b!25561 (=> (not res!15286) (not e!16527))))

(declare-fun bm!2431 () Bool)

(assert (=> bm!2431 (= call!2432 call!2438)))

(declare-fun bm!2432 () Bool)

(assert (=> bm!2432 (= call!2445 call!2429)))

(declare-fun b!25562 () Bool)

(declare-fun call!2451 () ListLongMap!567)

(assert (=> b!25562 (= e!16533 call!2451)))

(declare-fun call!2435 () ListLongMap!567)

(declare-fun b!25563 () Bool)

(declare-fun e!16520 () Bool)

(assert (=> b!25563 (= e!16520 (= call!2435 (+!46 call!2431 (tuple2!993 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938)))))))))

(declare-fun b!25564 () Bool)

(declare-fun res!15281 () Bool)

(assert (=> b!25564 (=> (not res!15281) (not e!16517))))

(assert (=> b!25564 (= res!15281 (= (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2346 lt!10116)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25565 () Bool)

(declare-fun lt!10111 () SeekEntryResult!56)

(assert (=> b!25565 (= e!16518 (= (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2347 lt!10111)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25566 () Bool)

(assert (=> b!25566 (= e!16527 (not call!2440))))

(declare-fun bm!2433 () Bool)

(declare-fun getCurrentListMap!129 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) Int) ListLongMap!567)

(assert (=> bm!2433 (= call!2439 (getCurrentListMap!129 (_keys!3193 (_2!503 lt!9887)) (ite (or c!3587 c!3594) (_values!1752 (_2!503 lt!9887)) (array!1290 (store (arr!608 (_values!1752 (_2!503 lt!9887))) (index!2347 lt!10117) (ValueCellFull!317 (minValue!1687 (v!1625 (underlying!121 thiss!938))))) (size!709 (_values!1752 (_2!503 lt!9887))))) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) #b00000000000000000000000000000000 (defaultEntry!1768 (_2!503 lt!9887))))))

(declare-fun bm!2434 () Bool)

(assert (=> bm!2434 (= call!2437 call!2447)))

(declare-fun bm!2435 () Bool)

(declare-fun call!2444 () SeekEntryResult!56)

(assert (=> bm!2435 (= call!2441 call!2444)))

(declare-fun bm!2436 () Bool)

(declare-fun c!3589 () Bool)

(declare-fun c!3586 () Bool)

(declare-fun c!3596 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2436 (= call!2429 (inRange!0 (ite c!3594 (ite c!3589 (index!2347 lt!10125) (ite c!3597 (index!2346 lt!10112) (index!2349 lt!10112))) (ite c!3596 (index!2347 lt!10111) (ite c!3586 (index!2346 lt!10116) (index!2349 lt!10116)))) (mask!4770 (_2!503 lt!9887))))))

(declare-fun b!25567 () Bool)

(assert (=> b!25567 (= e!16525 e!16528)))

(declare-fun c!3595 () Bool)

(assert (=> b!25567 (= c!3595 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!10115 () (_ BitVec 32))

(declare-fun lt!10123 () array!1289)

(declare-fun bm!2437 () Bool)

(assert (=> bm!2437 (= call!2447 (getCurrentListMap!129 (_keys!3193 (_2!503 lt!9887)) (ite c!3587 (_values!1752 (_2!503 lt!9887)) lt!10123) (mask!4770 (_2!503 lt!9887)) (ite c!3587 (ite c!3595 lt!10108 lt!10115) (extraKeys!1660 (_2!503 lt!9887))) (ite (and c!3587 c!3595) (minValue!1687 (v!1625 (underlying!121 thiss!938))) (zeroValue!1687 (_2!503 lt!9887))) (ite c!3587 (ite c!3595 (minValue!1687 (_2!503 lt!9887)) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (minValue!1687 (_2!503 lt!9887))) #b00000000000000000000000000000000 (defaultEntry!1768 (_2!503 lt!9887))))))

(declare-fun b!25568 () Bool)

(declare-fun e!16515 () ListLongMap!567)

(assert (=> b!25568 (= e!16515 call!2434)))

(declare-fun bm!2438 () Bool)

(assert (=> bm!2438 (= call!2430 (arrayContainsKey!0 (_keys!3193 (_2!503 lt!9887)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!25569 () Bool)

(declare-fun lt!10118 () Unit!612)

(assert (=> b!25569 (= lt!10118 e!16524)))

(declare-fun call!2443 () Bool)

(assert (=> b!25569 (= c!3589 call!2443)))

(assert (=> b!25569 (= e!16534 (tuple2!989 false (_2!503 lt!9887)))))

(declare-fun b!25570 () Bool)

(declare-fun lt!10127 () Unit!612)

(declare-fun lt!10110 () Unit!612)

(assert (=> b!25570 (= lt!10127 lt!10110)))

(assert (=> b!25570 (= call!2428 call!2437)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 V!1203 Int) Unit!612)

(assert (=> b!25570 (= lt!10110 (lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) lt!10115 (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) (minValue!1687 (v!1625 (underlying!121 thiss!938))) (defaultEntry!1768 (_2!503 lt!9887))))))

(assert (=> b!25570 (= lt!10115 (bvor (extraKeys!1660 (_2!503 lt!9887)) #b00000000000000000000000000000010))))

(assert (=> b!25570 (= e!16528 (tuple2!989 true (LongMapFixedSize!221 (defaultEntry!1768 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (bvor (extraKeys!1660 (_2!503 lt!9887)) #b00000000000000000000000000000010) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (v!1625 (underlying!121 thiss!938))) (_size!158 (_2!503 lt!9887)) (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (_vacant!158 (_2!503 lt!9887)))))))

(declare-fun bm!2439 () Bool)

(assert (=> bm!2439 (= call!2436 call!2430)))

(declare-fun b!25571 () Bool)

(declare-fun c!3593 () Bool)

(assert (=> b!25571 (= c!3593 ((_ is MissingVacant!56) lt!10112))))

(assert (=> b!25571 (= e!16526 e!16513)))

(declare-fun b!25572 () Bool)

(declare-fun c!3590 () Bool)

(assert (=> b!25572 (= c!3590 ((_ is MissingVacant!56) lt!10116))))

(declare-fun e!16529 () Bool)

(assert (=> b!25572 (= e!16529 e!16521)))

(declare-fun b!25573 () Bool)

(assert (=> b!25573 (= e!16519 e!16520)))

(declare-fun res!15279 () Bool)

(assert (=> b!25573 (= res!15279 (contains!233 call!2435 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25573 (=> (not res!15279) (not e!16520))))

(declare-fun bm!2440 () Bool)

(assert (=> bm!2440 (= call!2442 (+!46 e!16515 (ite c!3587 (ite c!3595 (tuple2!993 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (tuple2!993 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938))))) (tuple2!993 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938)))))))))

(declare-fun c!3592 () Bool)

(assert (=> bm!2440 (= c!3592 c!3587)))

(declare-fun b!25574 () Bool)

(declare-fun e!16523 () Unit!612)

(declare-fun Unit!617 () Unit!612)

(assert (=> b!25574 (= e!16523 Unit!617)))

(declare-fun lt!10124 () Unit!612)

(assert (=> b!25574 (= lt!10124 call!2449)))

(declare-fun call!2446 () SeekEntryResult!56)

(assert (=> b!25574 (= lt!10116 call!2446)))

(assert (=> b!25574 (= c!3586 ((_ is MissingZero!56) lt!10116))))

(assert (=> b!25574 e!16529))

(declare-fun lt!10128 () Unit!612)

(assert (=> b!25574 (= lt!10128 lt!10124)))

(assert (=> b!25574 false))

(declare-fun bm!2441 () Bool)

(assert (=> bm!2441 (= call!2448 call!2445)))

(declare-fun b!25575 () Bool)

(assert (=> b!25575 (= e!16515 (getCurrentListMap!129 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) #b00000000000000000000000000000000 (defaultEntry!1768 (_2!503 lt!9887))))))

(declare-fun bm!2442 () Bool)

(assert (=> bm!2442 (= call!2451 call!2439)))

(declare-fun b!25576 () Bool)

(declare-fun res!15277 () Bool)

(assert (=> b!25576 (=> (not res!15277) (not e!16516))))

(assert (=> b!25576 (= res!15277 (= (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2346 lt!10112)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!3588 () Bool)

(declare-fun bm!2443 () Bool)

(declare-fun updateHelperNewKey!12 (LongMapFixedSize!220 (_ BitVec 64) V!1203 (_ BitVec 32)) tuple2!988)

(assert (=> bm!2443 (= call!2433 (updateHelperNewKey!12 (_2!503 lt!9887) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938))) (ite c!3588 (index!2349 lt!10117) (index!2346 lt!10117))))))

(declare-fun b!25577 () Bool)

(declare-fun lt!10114 () Unit!612)

(assert (=> b!25577 (= e!16523 lt!10114)))

(assert (=> b!25577 (= lt!10114 call!2450)))

(assert (=> b!25577 (= lt!10111 call!2446)))

(declare-fun res!15285 () Bool)

(assert (=> b!25577 (= res!15285 ((_ is Found!56) lt!10111))))

(assert (=> b!25577 (=> (not res!15285) (not e!16518))))

(assert (=> b!25577 e!16518))

(declare-fun b!25578 () Bool)

(assert (=> b!25578 (= e!16519 (= call!2435 call!2431))))

(declare-fun bm!2444 () Bool)

(assert (=> bm!2444 (= call!2444 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3193 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887))))))

(declare-fun b!25579 () Bool)

(declare-fun res!15287 () Bool)

(assert (=> b!25579 (=> (not res!15287) (not e!16517))))

(assert (=> b!25579 (= res!15287 call!2432)))

(assert (=> b!25579 (= e!16529 e!16517)))

(declare-fun b!25580 () Bool)

(declare-fun res!15284 () Bool)

(assert (=> b!25580 (=> (not res!15284) (not e!16516))))

(assert (=> b!25580 (= res!15284 call!2448)))

(assert (=> b!25580 (= e!16526 e!16516)))

(declare-fun b!25581 () Bool)

(assert (=> b!25581 (= e!16521 ((_ is Undefined!56) lt!10116))))

(declare-fun b!25582 () Bool)

(declare-fun lt!10131 () Unit!612)

(declare-fun lt!10122 () Unit!612)

(assert (=> b!25582 (= lt!10131 lt!10122)))

(assert (=> b!25582 call!2443))

(declare-fun lemmaValidKeyInArrayIsInListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) Int) Unit!612)

(assert (=> b!25582 (= lt!10122 (lemmaValidKeyInArrayIsInListMap!12 (_keys!3193 (_2!503 lt!9887)) lt!10123 (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) (index!2347 lt!10117) (defaultEntry!1768 (_2!503 lt!9887))))))

(assert (=> b!25582 (= lt!10123 (array!1290 (store (arr!608 (_values!1752 (_2!503 lt!9887))) (index!2347 lt!10117) (ValueCellFull!317 (minValue!1687 (v!1625 (underlying!121 thiss!938))))) (size!709 (_values!1752 (_2!503 lt!9887)))))))

(declare-fun lt!10121 () Unit!612)

(declare-fun lt!10109 () Unit!612)

(assert (=> b!25582 (= lt!10121 lt!10109)))

(assert (=> b!25582 (= call!2442 call!2451)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) (_ BitVec 64) V!1203 Int) Unit!612)

(assert (=> b!25582 (= lt!10109 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) (index!2347 lt!10117) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1687 (v!1625 (underlying!121 thiss!938))) (defaultEntry!1768 (_2!503 lt!9887))))))

(declare-fun lt!10133 () Unit!612)

(assert (=> b!25582 (= lt!10133 e!16523)))

(assert (=> b!25582 (= c!3596 (contains!233 (getCurrentListMap!129 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) #b00000000000000000000000000000000 (defaultEntry!1768 (_2!503 lt!9887))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25582 (= e!16530 (tuple2!989 true (LongMapFixedSize!221 (defaultEntry!1768 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) (_size!158 (_2!503 lt!9887)) (_keys!3193 (_2!503 lt!9887)) (array!1290 (store (arr!608 (_values!1752 (_2!503 lt!9887))) (index!2347 lt!10117) (ValueCellFull!317 (minValue!1687 (v!1625 (underlying!121 thiss!938))))) (size!709 (_values!1752 (_2!503 lt!9887)))) (_vacant!158 (_2!503 lt!9887)))))))

(declare-fun b!25583 () Bool)

(assert (=> b!25583 (= e!16513 ((_ is Undefined!56) lt!10112))))

(declare-fun b!25584 () Bool)

(assert (=> b!25584 (= e!16532 (= (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2347 lt!10125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2445 () Bool)

(assert (=> bm!2445 (= call!2435 (map!415 (_2!503 lt!10129)))))

(declare-fun bm!2446 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) Int) Unit!612)

(assert (=> bm!2446 (= call!2449 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (_keys!3193 (_2!503 lt!9887)) (_values!1752 (_2!503 lt!9887)) (mask!4770 (_2!503 lt!9887)) (extraKeys!1660 (_2!503 lt!9887)) (zeroValue!1687 (_2!503 lt!9887)) (minValue!1687 (_2!503 lt!9887)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1768 (_2!503 lt!9887))))))

(declare-fun b!25585 () Bool)

(declare-fun lt!10120 () tuple2!988)

(assert (=> b!25585 (= lt!10120 call!2433)))

(assert (=> b!25585 (= e!16530 (tuple2!989 (_1!503 lt!10120) (_2!503 lt!10120)))))

(declare-fun bm!2447 () Bool)

(assert (=> bm!2447 (= call!2446 call!2444)))

(declare-fun b!25586 () Bool)

(assert (=> b!25586 (= c!3588 ((_ is MissingVacant!56) lt!10117))))

(assert (=> b!25586 (= e!16534 e!16514)))

(declare-fun bm!2448 () Bool)

(declare-fun c!3599 () Bool)

(assert (=> bm!2448 (= c!3599 c!3594)))

(assert (=> bm!2448 (= call!2443 (contains!233 e!16533 (ite c!3594 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!609 (_keys!3193 (_2!503 lt!9887))) (index!2347 lt!10117)))))))

(assert (= (and d!4771 c!3587) b!25567))

(assert (= (and d!4771 (not c!3587)) b!25560))

(assert (= (and b!25567 c!3595) b!25547))

(assert (= (and b!25567 (not c!3595)) b!25570))

(assert (= (or b!25547 b!25570) bm!2434))

(assert (= (or b!25547 b!25570) bm!2425))

(assert (= (or b!25547 b!25570) bm!2428))

(assert (= (and b!25560 c!3594) b!25569))

(assert (= (and b!25560 (not c!3594)) b!25586))

(assert (= (and b!25569 c!3589) b!25545))

(assert (= (and b!25569 (not c!3589)) b!25554))

(assert (= (and b!25545 res!15278) b!25558))

(assert (= (and b!25558 res!15282) b!25584))

(assert (= (and b!25554 c!3597) b!25580))

(assert (= (and b!25554 (not c!3597)) b!25571))

(assert (= (and b!25580 res!15284) b!25576))

(assert (= (and b!25576 res!15277) b!25555))

(assert (= (and b!25571 c!3593) b!25561))

(assert (= (and b!25571 (not c!3593)) b!25583))

(assert (= (and b!25561 res!15286) b!25551))

(assert (= (and b!25551 res!15288) b!25566))

(assert (= (or b!25580 b!25561) bm!2441))

(assert (= (or b!25555 b!25566) bm!2430))

(assert (= (or b!25558 bm!2441) bm!2432))

(assert (= (or b!25545 b!25554) bm!2435))

(assert (= (and b!25586 c!3588) b!25550))

(assert (= (and b!25586 (not c!3588)) b!25559))

(assert (= (and b!25559 c!3598) b!25585))

(assert (= (and b!25559 (not c!3598)) b!25582))

(assert (= (and b!25582 c!3596) b!25577))

(assert (= (and b!25582 (not c!3596)) b!25574))

(assert (= (and b!25577 res!15285) b!25549))

(assert (= (and b!25549 res!15283) b!25565))

(assert (= (and b!25574 c!3586) b!25579))

(assert (= (and b!25574 (not c!3586)) b!25572))

(assert (= (and b!25579 res!15287) b!25564))

(assert (= (and b!25564 res!15281) b!25556))

(assert (= (and b!25572 c!3590) b!25546))

(assert (= (and b!25572 (not c!3590)) b!25581))

(assert (= (and b!25546 res!15276) b!25552))

(assert (= (and b!25552 res!15280) b!25557))

(assert (= (or b!25579 b!25546) bm!2431))

(assert (= (or b!25556 b!25557) bm!2439))

(assert (= (or b!25549 bm!2431) bm!2427))

(assert (= (or b!25577 b!25574) bm!2447))

(assert (= (or b!25550 b!25585) bm!2443))

(assert (= (or b!25545 b!25577) bm!2429))

(assert (= (or bm!2430 bm!2439) bm!2438))

(assert (= (or b!25569 b!25582) bm!2442))

(assert (= (or bm!2432 bm!2427) bm!2436))

(assert (= (or bm!2435 bm!2447) bm!2444))

(assert (= (or b!25554 b!25574) bm!2446))

(assert (= (or b!25569 b!25582) bm!2448))

(assert (= (and bm!2448 c!3599) b!25562))

(assert (= (and bm!2448 (not c!3599)) b!25553))

(assert (= (or bm!2434 b!25553) bm!2437))

(assert (= (or bm!2425 bm!2442) bm!2433))

(assert (= (or bm!2428 b!25582) bm!2440))

(assert (= (and bm!2440 c!3592) b!25568))

(assert (= (and bm!2440 (not c!3592)) b!25575))

(assert (= (and d!4771 res!15289) b!25548))

(assert (= (and b!25548 c!3591) b!25573))

(assert (= (and b!25548 (not c!3591)) b!25578))

(assert (= (and b!25573 res!15279) b!25563))

(assert (= (or b!25563 b!25578) bm!2426))

(assert (= (or b!25573 b!25563 b!25578) bm!2445))

(declare-fun m!20463 () Bool)

(assert (=> bm!2433 m!20463))

(declare-fun m!20465 () Bool)

(assert (=> bm!2433 m!20465))

(declare-fun m!20467 () Bool)

(assert (=> bm!2448 m!20467))

(declare-fun m!20469 () Bool)

(assert (=> bm!2448 m!20469))

(declare-fun m!20471 () Bool)

(assert (=> b!25560 m!20471))

(declare-fun m!20473 () Bool)

(assert (=> bm!2426 m!20473))

(declare-fun m!20475 () Bool)

(assert (=> b!25564 m!20475))

(declare-fun m!20477 () Bool)

(assert (=> bm!2446 m!20477))

(declare-fun m!20479 () Bool)

(assert (=> b!25582 m!20479))

(declare-fun m!20481 () Bool)

(assert (=> b!25582 m!20481))

(declare-fun m!20483 () Bool)

(assert (=> b!25582 m!20483))

(assert (=> b!25582 m!20479))

(assert (=> b!25582 m!20463))

(declare-fun m!20485 () Bool)

(assert (=> b!25582 m!20485))

(declare-fun m!20487 () Bool)

(assert (=> bm!2438 m!20487))

(declare-fun m!20489 () Bool)

(assert (=> b!25551 m!20489))

(assert (=> bm!2444 m!20471))

(declare-fun m!20491 () Bool)

(assert (=> bm!2429 m!20491))

(declare-fun m!20493 () Bool)

(assert (=> b!25573 m!20493))

(declare-fun m!20495 () Bool)

(assert (=> b!25552 m!20495))

(declare-fun m!20497 () Bool)

(assert (=> b!25570 m!20497))

(declare-fun m!20499 () Bool)

(assert (=> b!25584 m!20499))

(declare-fun m!20501 () Bool)

(assert (=> b!25547 m!20501))

(assert (=> b!25575 m!20479))

(declare-fun m!20503 () Bool)

(assert (=> d!4771 m!20503))

(declare-fun m!20505 () Bool)

(assert (=> d!4771 m!20505))

(declare-fun m!20507 () Bool)

(assert (=> bm!2443 m!20507))

(declare-fun m!20509 () Bool)

(assert (=> b!25563 m!20509))

(declare-fun m!20511 () Bool)

(assert (=> bm!2436 m!20511))

(declare-fun m!20513 () Bool)

(assert (=> b!25565 m!20513))

(declare-fun m!20515 () Bool)

(assert (=> bm!2437 m!20515))

(declare-fun m!20517 () Bool)

(assert (=> bm!2445 m!20517))

(declare-fun m!20519 () Bool)

(assert (=> bm!2440 m!20519))

(declare-fun m!20521 () Bool)

(assert (=> b!25576 m!20521))

(assert (=> b!25309 d!4771))

(declare-fun b!25587 () Bool)

(declare-fun e!16546 () Unit!612)

(declare-fun Unit!618 () Unit!612)

(assert (=> b!25587 (= e!16546 Unit!618)))

(declare-fun lt!10153 () Unit!612)

(declare-fun call!2474 () Unit!612)

(assert (=> b!25587 (= lt!10153 call!2474)))

(declare-fun lt!10152 () SeekEntryResult!56)

(declare-fun call!2465 () SeekEntryResult!56)

(assert (=> b!25587 (= lt!10152 call!2465)))

(declare-fun res!15292 () Bool)

(assert (=> b!25587 (= res!15292 ((_ is Found!56) lt!10152))))

(declare-fun e!16554 () Bool)

(assert (=> b!25587 (=> (not res!15292) (not e!16554))))

(assert (=> b!25587 e!16554))

(declare-fun lt!10146 () Unit!612)

(assert (=> b!25587 (= lt!10146 lt!10153)))

(assert (=> b!25587 false))

(declare-fun bm!2449 () Bool)

(declare-fun call!2458 () ListLongMap!567)

(declare-fun call!2463 () ListLongMap!567)

(assert (=> bm!2449 (= call!2458 call!2463)))

(declare-fun b!25588 () Bool)

(declare-fun e!16543 () Bool)

(declare-fun e!16553 () Bool)

(assert (=> b!25588 (= e!16543 e!16553)))

(declare-fun res!15290 () Bool)

(declare-fun call!2456 () Bool)

(assert (=> b!25588 (= res!15290 call!2456)))

(assert (=> b!25588 (=> (not res!15290) (not e!16553))))

(declare-fun bm!2450 () Bool)

(declare-fun call!2455 () ListLongMap!567)

(assert (=> bm!2450 (= call!2455 (map!415 lt!9889))))

(declare-fun bm!2451 () Bool)

(declare-fun call!2462 () Bool)

(declare-fun call!2453 () Bool)

(assert (=> bm!2451 (= call!2462 call!2453)))

(declare-fun b!25589 () Bool)

(declare-fun lt!10157 () Unit!612)

(declare-fun lt!10134 () Unit!612)

(assert (=> b!25589 (= lt!10157 lt!10134)))

(declare-fun call!2452 () ListLongMap!567)

(declare-fun call!2461 () ListLongMap!567)

(assert (=> b!25589 (= call!2452 call!2461)))

(declare-fun lt!10135 () (_ BitVec 32))

(assert (=> b!25589 (= lt!10134 (lemmaChangeZeroKeyThenAddPairToListMap!12 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) lt!10135 (zeroValue!1687 lt!9889) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (minValue!1687 lt!9889) (defaultEntry!1768 lt!9889)))))

(assert (=> b!25589 (= lt!10135 (bvor (extraKeys!1660 lt!9889) #b00000000000000000000000000000001))))

(declare-fun e!16550 () tuple2!988)

(assert (=> b!25589 (= e!16550 (tuple2!989 true (LongMapFixedSize!221 (defaultEntry!1768 lt!9889) (mask!4770 lt!9889) (bvor (extraKeys!1660 lt!9889) #b00000000000000000000000000000001) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (minValue!1687 lt!9889) (_size!158 lt!9889) (_keys!3193 lt!9889) (_values!1752 lt!9889) (_vacant!158 lt!9889))))))

(declare-fun b!25590 () Bool)

(declare-fun e!16544 () Bool)

(declare-fun e!16541 () Bool)

(assert (=> b!25590 (= e!16544 e!16541)))

(declare-fun c!3605 () Bool)

(declare-fun lt!10156 () tuple2!988)

(assert (=> b!25590 (= c!3605 (_1!503 lt!10156))))

(declare-fun bm!2452 () Bool)

(declare-fun call!2466 () ListLongMap!567)

(assert (=> bm!2452 (= call!2452 call!2466)))

(declare-fun b!25591 () Bool)

(declare-fun res!15297 () Bool)

(assert (=> b!25591 (= res!15297 call!2462)))

(declare-fun e!16540 () Bool)

(assert (=> b!25591 (=> (not res!15297) (not e!16540))))

(declare-fun b!25592 () Bool)

(declare-fun e!16536 () tuple2!988)

(declare-fun lt!10159 () tuple2!988)

(assert (=> b!25592 (= e!16536 (tuple2!989 (_1!503 lt!10159) (_2!503 lt!10159)))))

(declare-fun call!2457 () tuple2!988)

(assert (=> b!25592 (= lt!10159 call!2457)))

(declare-fun b!25593 () Bool)

(declare-fun res!15302 () Bool)

(declare-fun lt!10139 () SeekEntryResult!56)

(assert (=> b!25593 (= res!15302 (= (select (arr!609 (_keys!3193 lt!9889)) (index!2349 lt!10139)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16549 () Bool)

(assert (=> b!25593 (=> (not res!15302) (not e!16549))))

(declare-fun b!25594 () Bool)

(declare-fun res!15294 () Bool)

(declare-fun lt!10143 () SeekEntryResult!56)

(assert (=> b!25594 (= res!15294 (= (select (arr!609 (_keys!3193 lt!9889)) (index!2349 lt!10143)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25594 (=> (not res!15294) (not e!16553))))

(declare-fun b!25595 () Bool)

(declare-fun e!16555 () ListLongMap!567)

(declare-fun call!2471 () ListLongMap!567)

(assert (=> b!25595 (= e!16555 call!2471)))

(declare-fun b!25596 () Bool)

(declare-fun lt!10140 () Unit!612)

(assert (=> b!25596 (= e!16546 lt!10140)))

(declare-fun call!2473 () Unit!612)

(assert (=> b!25596 (= lt!10140 call!2473)))

(assert (=> b!25596 (= lt!10139 call!2465)))

(declare-fun c!3611 () Bool)

(assert (=> b!25596 (= c!3611 ((_ is MissingZero!56) lt!10139))))

(declare-fun e!16548 () Bool)

(assert (=> b!25596 e!16548))

(declare-fun b!25597 () Bool)

(declare-fun e!16538 () Bool)

(declare-fun call!2464 () Bool)

(assert (=> b!25597 (= e!16538 (not call!2464))))

(declare-fun b!25598 () Bool)

(declare-fun e!16539 () Bool)

(declare-fun call!2460 () Bool)

(assert (=> b!25598 (= e!16539 (not call!2460))))

(declare-fun b!25599 () Bool)

(assert (=> b!25599 (= e!16553 (not call!2460))))

(declare-fun bm!2453 () Bool)

(assert (=> bm!2453 (= call!2474 (lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1768 lt!9889)))))

(declare-fun b!25600 () Bool)

(declare-fun res!15296 () Bool)

(declare-fun call!2469 () Bool)

(assert (=> b!25600 (= res!15296 call!2469)))

(assert (=> b!25600 (=> (not res!15296) (not e!16554))))

(declare-fun b!25601 () Bool)

(declare-fun e!16552 () tuple2!988)

(assert (=> b!25601 (= e!16536 e!16552)))

(declare-fun c!3612 () Bool)

(declare-fun lt!10144 () SeekEntryResult!56)

(assert (=> b!25601 (= c!3612 ((_ is MissingZero!56) lt!10144))))

(declare-fun b!25602 () Bool)

(declare-fun e!16547 () tuple2!988)

(declare-fun e!16556 () tuple2!988)

(assert (=> b!25602 (= e!16547 e!16556)))

(assert (=> b!25602 (= lt!10144 (seekEntryOrOpen!0 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3193 lt!9889) (mask!4770 lt!9889)))))

(declare-fun c!3608 () Bool)

(assert (=> b!25602 (= c!3608 ((_ is Undefined!56) lt!10144))))

(declare-fun bm!2454 () Bool)

(declare-fun call!2454 () Bool)

(assert (=> bm!2454 (= call!2464 call!2454)))

(declare-fun d!4773 () Bool)

(assert (=> d!4773 e!16544))

(declare-fun res!15303 () Bool)

(assert (=> d!4773 (=> (not res!15303) (not e!16544))))

(assert (=> d!4773 (= res!15303 (valid!125 (_2!503 lt!10156)))))

(assert (=> d!4773 (= lt!10156 e!16547)))

(declare-fun c!3601 () Bool)

(assert (=> d!4773 (= c!3601 (= (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!4773 (valid!125 lt!9889)))

(assert (=> d!4773 (= (update!45 lt!9889 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))) lt!10156)))

(declare-fun b!25603 () Bool)

(declare-fun e!16535 () Bool)

(assert (=> b!25603 (= e!16535 e!16549)))

(declare-fun res!15300 () Bool)

(declare-fun call!2472 () Bool)

(assert (=> b!25603 (= res!15300 call!2472)))

(assert (=> b!25603 (=> (not res!15300) (not e!16549))))

(declare-fun bm!2455 () Bool)

(assert (=> bm!2455 (= call!2456 call!2462)))

(declare-fun bm!2456 () Bool)

(assert (=> bm!2456 (= call!2469 call!2453)))

(declare-fun b!25604 () Bool)

(declare-fun call!2475 () ListLongMap!567)

(assert (=> b!25604 (= e!16555 call!2475)))

(declare-fun b!25605 () Bool)

(declare-fun call!2459 () ListLongMap!567)

(declare-fun e!16542 () Bool)

(assert (=> b!25605 (= e!16542 (= call!2459 (+!46 call!2455 (tuple2!993 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))))))))

(declare-fun b!25606 () Bool)

(declare-fun res!15295 () Bool)

(assert (=> b!25606 (=> (not res!15295) (not e!16539))))

(assert (=> b!25606 (= res!15295 (= (select (arr!609 (_keys!3193 lt!9889)) (index!2346 lt!10143)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25607 () Bool)

(declare-fun lt!10138 () SeekEntryResult!56)

(assert (=> b!25607 (= e!16540 (= (select (arr!609 (_keys!3193 lt!9889)) (index!2347 lt!10138)) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!25608 () Bool)

(assert (=> b!25608 (= e!16549 (not call!2464))))

(declare-fun bm!2457 () Bool)

(assert (=> bm!2457 (= call!2463 (getCurrentListMap!129 (_keys!3193 lt!9889) (ite (or c!3601 c!3608) (_values!1752 lt!9889) (array!1290 (store (arr!608 (_values!1752 lt!9889)) (index!2347 lt!10144) (ValueCellFull!317 (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))))) (size!709 (_values!1752 lt!9889)))) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9889)))))

(declare-fun bm!2458 () Bool)

(assert (=> bm!2458 (= call!2461 call!2471)))

(declare-fun bm!2459 () Bool)

(declare-fun call!2468 () SeekEntryResult!56)

(assert (=> bm!2459 (= call!2465 call!2468)))

(declare-fun c!3603 () Bool)

(declare-fun bm!2460 () Bool)

(declare-fun c!3600 () Bool)

(declare-fun c!3610 () Bool)

(assert (=> bm!2460 (= call!2453 (inRange!0 (ite c!3608 (ite c!3603 (index!2347 lt!10152) (ite c!3611 (index!2346 lt!10139) (index!2349 lt!10139))) (ite c!3610 (index!2347 lt!10138) (ite c!3600 (index!2346 lt!10143) (index!2349 lt!10143)))) (mask!4770 lt!9889)))))

(declare-fun b!25609 () Bool)

(assert (=> b!25609 (= e!16547 e!16550)))

(declare-fun c!3609 () Bool)

(assert (=> b!25609 (= c!3609 (= (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2461 () Bool)

(declare-fun lt!10142 () (_ BitVec 32))

(declare-fun lt!10150 () array!1289)

(assert (=> bm!2461 (= call!2471 (getCurrentListMap!129 (_keys!3193 lt!9889) (ite c!3601 (_values!1752 lt!9889) lt!10150) (mask!4770 lt!9889) (ite c!3601 (ite c!3609 lt!10135 lt!10142) (extraKeys!1660 lt!9889)) (ite (and c!3601 c!3609) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (zeroValue!1687 lt!9889)) (ite c!3601 (ite c!3609 (minValue!1687 lt!9889) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))) (minValue!1687 lt!9889)) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9889)))))

(declare-fun b!25610 () Bool)

(declare-fun e!16537 () ListLongMap!567)

(assert (=> b!25610 (= e!16537 call!2458)))

(declare-fun bm!2462 () Bool)

(assert (=> bm!2462 (= call!2454 (arrayContainsKey!0 (_keys!3193 lt!9889) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!25611 () Bool)

(declare-fun lt!10145 () Unit!612)

(assert (=> b!25611 (= lt!10145 e!16546)))

(declare-fun call!2467 () Bool)

(assert (=> b!25611 (= c!3603 call!2467)))

(assert (=> b!25611 (= e!16556 (tuple2!989 false lt!9889))))

(declare-fun b!25612 () Bool)

(declare-fun lt!10154 () Unit!612)

(declare-fun lt!10137 () Unit!612)

(assert (=> b!25612 (= lt!10154 lt!10137)))

(assert (=> b!25612 (= call!2452 call!2461)))

(assert (=> b!25612 (= lt!10137 (lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) lt!10142 (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (defaultEntry!1768 lt!9889)))))

(assert (=> b!25612 (= lt!10142 (bvor (extraKeys!1660 lt!9889) #b00000000000000000000000000000010))))

(assert (=> b!25612 (= e!16550 (tuple2!989 true (LongMapFixedSize!221 (defaultEntry!1768 lt!9889) (mask!4770 lt!9889) (bvor (extraKeys!1660 lt!9889) #b00000000000000000000000000000010) (zeroValue!1687 lt!9889) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (_size!158 lt!9889) (_keys!3193 lt!9889) (_values!1752 lt!9889) (_vacant!158 lt!9889))))))

(declare-fun bm!2463 () Bool)

(assert (=> bm!2463 (= call!2460 call!2454)))

(declare-fun b!25613 () Bool)

(declare-fun c!3607 () Bool)

(assert (=> b!25613 (= c!3607 ((_ is MissingVacant!56) lt!10139))))

(assert (=> b!25613 (= e!16548 e!16535)))

(declare-fun b!25614 () Bool)

(declare-fun c!3604 () Bool)

(assert (=> b!25614 (= c!3604 ((_ is MissingVacant!56) lt!10143))))

(declare-fun e!16551 () Bool)

(assert (=> b!25614 (= e!16551 e!16543)))

(declare-fun b!25615 () Bool)

(assert (=> b!25615 (= e!16541 e!16542)))

(declare-fun res!15293 () Bool)

(assert (=> b!25615 (= res!15293 (contains!233 call!2459 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25615 (=> (not res!15293) (not e!16542))))

(declare-fun bm!2464 () Bool)

(assert (=> bm!2464 (= call!2466 (+!46 e!16537 (ite c!3601 (ite c!3609 (tuple2!993 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))) (tuple2!993 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))))) (tuple2!993 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))))))))

(declare-fun c!3606 () Bool)

(assert (=> bm!2464 (= c!3606 c!3601)))

(declare-fun b!25616 () Bool)

(declare-fun e!16545 () Unit!612)

(declare-fun Unit!619 () Unit!612)

(assert (=> b!25616 (= e!16545 Unit!619)))

(declare-fun lt!10151 () Unit!612)

(assert (=> b!25616 (= lt!10151 call!2473)))

(declare-fun call!2470 () SeekEntryResult!56)

(assert (=> b!25616 (= lt!10143 call!2470)))

(assert (=> b!25616 (= c!3600 ((_ is MissingZero!56) lt!10143))))

(assert (=> b!25616 e!16551))

(declare-fun lt!10155 () Unit!612)

(assert (=> b!25616 (= lt!10155 lt!10151)))

(assert (=> b!25616 false))

(declare-fun bm!2465 () Bool)

(assert (=> bm!2465 (= call!2472 call!2469)))

(declare-fun b!25617 () Bool)

(assert (=> b!25617 (= e!16537 (getCurrentListMap!129 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9889)))))

(declare-fun bm!2466 () Bool)

(assert (=> bm!2466 (= call!2475 call!2463)))

(declare-fun b!25618 () Bool)

(declare-fun res!15291 () Bool)

(assert (=> b!25618 (=> (not res!15291) (not e!16538))))

(assert (=> b!25618 (= res!15291 (= (select (arr!609 (_keys!3193 lt!9889)) (index!2346 lt!10139)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2467 () Bool)

(declare-fun c!3602 () Bool)

(assert (=> bm!2467 (= call!2457 (updateHelperNewKey!12 lt!9889 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (ite c!3602 (index!2349 lt!10144) (index!2346 lt!10144))))))

(declare-fun b!25619 () Bool)

(declare-fun lt!10141 () Unit!612)

(assert (=> b!25619 (= e!16545 lt!10141)))

(assert (=> b!25619 (= lt!10141 call!2474)))

(assert (=> b!25619 (= lt!10138 call!2470)))

(declare-fun res!15299 () Bool)

(assert (=> b!25619 (= res!15299 ((_ is Found!56) lt!10138))))

(assert (=> b!25619 (=> (not res!15299) (not e!16540))))

(assert (=> b!25619 e!16540))

(declare-fun b!25620 () Bool)

(assert (=> b!25620 (= e!16541 (= call!2459 call!2455))))

(declare-fun bm!2468 () Bool)

(assert (=> bm!2468 (= call!2468 (seekEntryOrOpen!0 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3193 lt!9889) (mask!4770 lt!9889)))))

(declare-fun b!25621 () Bool)

(declare-fun res!15301 () Bool)

(assert (=> b!25621 (=> (not res!15301) (not e!16539))))

(assert (=> b!25621 (= res!15301 call!2456)))

(assert (=> b!25621 (= e!16551 e!16539)))

(declare-fun b!25622 () Bool)

(declare-fun res!15298 () Bool)

(assert (=> b!25622 (=> (not res!15298) (not e!16538))))

(assert (=> b!25622 (= res!15298 call!2472)))

(assert (=> b!25622 (= e!16548 e!16538)))

(declare-fun b!25623 () Bool)

(assert (=> b!25623 (= e!16543 ((_ is Undefined!56) lt!10143))))

(declare-fun b!25624 () Bool)

(declare-fun lt!10158 () Unit!612)

(declare-fun lt!10149 () Unit!612)

(assert (=> b!25624 (= lt!10158 lt!10149)))

(assert (=> b!25624 call!2467))

(assert (=> b!25624 (= lt!10149 (lemmaValidKeyInArrayIsInListMap!12 (_keys!3193 lt!9889) lt!10150 (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) (index!2347 lt!10144) (defaultEntry!1768 lt!9889)))))

(assert (=> b!25624 (= lt!10150 (array!1290 (store (arr!608 (_values!1752 lt!9889)) (index!2347 lt!10144) (ValueCellFull!317 (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))))) (size!709 (_values!1752 lt!9889))))))

(declare-fun lt!10148 () Unit!612)

(declare-fun lt!10136 () Unit!612)

(assert (=> b!25624 (= lt!10148 lt!10136)))

(assert (=> b!25624 (= call!2466 call!2475)))

(assert (=> b!25624 (= lt!10136 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) (index!2347 lt!10144) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))) (defaultEntry!1768 lt!9889)))))

(declare-fun lt!10160 () Unit!612)

(assert (=> b!25624 (= lt!10160 e!16545)))

(assert (=> b!25624 (= c!3610 (contains!233 (getCurrentListMap!129 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9889)) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25624 (= e!16552 (tuple2!989 true (LongMapFixedSize!221 (defaultEntry!1768 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) (_size!158 lt!9889) (_keys!3193 lt!9889) (array!1290 (store (arr!608 (_values!1752 lt!9889)) (index!2347 lt!10144) (ValueCellFull!317 (ite (or c!3512 c!3515) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938)))))) (size!709 (_values!1752 lt!9889))) (_vacant!158 lt!9889))))))

(declare-fun b!25625 () Bool)

(assert (=> b!25625 (= e!16535 ((_ is Undefined!56) lt!10139))))

(declare-fun b!25626 () Bool)

(assert (=> b!25626 (= e!16554 (= (select (arr!609 (_keys!3193 lt!9889)) (index!2347 lt!10152)) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!2469 () Bool)

(assert (=> bm!2469 (= call!2459 (map!415 (_2!503 lt!10156)))))

(declare-fun bm!2470 () Bool)

(assert (=> bm!2470 (= call!2473 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (_keys!3193 lt!9889) (_values!1752 lt!9889) (mask!4770 lt!9889) (extraKeys!1660 lt!9889) (zeroValue!1687 lt!9889) (minValue!1687 lt!9889) (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1768 lt!9889)))))

(declare-fun b!25627 () Bool)

(declare-fun lt!10147 () tuple2!988)

(assert (=> b!25627 (= lt!10147 call!2457)))

(assert (=> b!25627 (= e!16552 (tuple2!989 (_1!503 lt!10147) (_2!503 lt!10147)))))

(declare-fun bm!2471 () Bool)

(assert (=> bm!2471 (= call!2470 call!2468)))

(declare-fun b!25628 () Bool)

(assert (=> b!25628 (= c!3602 ((_ is MissingVacant!56) lt!10144))))

(assert (=> b!25628 (= e!16556 e!16536)))

(declare-fun bm!2472 () Bool)

(declare-fun c!3613 () Bool)

(assert (=> bm!2472 (= c!3613 c!3608)))

(assert (=> bm!2472 (= call!2467 (contains!233 e!16555 (ite c!3608 (ite (or c!3512 c!3515) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!609 (_keys!3193 lt!9889)) (index!2347 lt!10144)))))))

(assert (= (and d!4773 c!3601) b!25609))

(assert (= (and d!4773 (not c!3601)) b!25602))

(assert (= (and b!25609 c!3609) b!25589))

(assert (= (and b!25609 (not c!3609)) b!25612))

(assert (= (or b!25589 b!25612) bm!2458))

(assert (= (or b!25589 b!25612) bm!2449))

(assert (= (or b!25589 b!25612) bm!2452))

(assert (= (and b!25602 c!3608) b!25611))

(assert (= (and b!25602 (not c!3608)) b!25628))

(assert (= (and b!25611 c!3603) b!25587))

(assert (= (and b!25611 (not c!3603)) b!25596))

(assert (= (and b!25587 res!15292) b!25600))

(assert (= (and b!25600 res!15296) b!25626))

(assert (= (and b!25596 c!3611) b!25622))

(assert (= (and b!25596 (not c!3611)) b!25613))

(assert (= (and b!25622 res!15298) b!25618))

(assert (= (and b!25618 res!15291) b!25597))

(assert (= (and b!25613 c!3607) b!25603))

(assert (= (and b!25613 (not c!3607)) b!25625))

(assert (= (and b!25603 res!15300) b!25593))

(assert (= (and b!25593 res!15302) b!25608))

(assert (= (or b!25622 b!25603) bm!2465))

(assert (= (or b!25597 b!25608) bm!2454))

(assert (= (or b!25600 bm!2465) bm!2456))

(assert (= (or b!25587 b!25596) bm!2459))

(assert (= (and b!25628 c!3602) b!25592))

(assert (= (and b!25628 (not c!3602)) b!25601))

(assert (= (and b!25601 c!3612) b!25627))

(assert (= (and b!25601 (not c!3612)) b!25624))

(assert (= (and b!25624 c!3610) b!25619))

(assert (= (and b!25624 (not c!3610)) b!25616))

(assert (= (and b!25619 res!15299) b!25591))

(assert (= (and b!25591 res!15297) b!25607))

(assert (= (and b!25616 c!3600) b!25621))

(assert (= (and b!25616 (not c!3600)) b!25614))

(assert (= (and b!25621 res!15301) b!25606))

(assert (= (and b!25606 res!15295) b!25598))

(assert (= (and b!25614 c!3604) b!25588))

(assert (= (and b!25614 (not c!3604)) b!25623))

(assert (= (and b!25588 res!15290) b!25594))

(assert (= (and b!25594 res!15294) b!25599))

(assert (= (or b!25621 b!25588) bm!2455))

(assert (= (or b!25598 b!25599) bm!2463))

(assert (= (or b!25591 bm!2455) bm!2451))

(assert (= (or b!25619 b!25616) bm!2471))

(assert (= (or b!25592 b!25627) bm!2467))

(assert (= (or b!25587 b!25619) bm!2453))

(assert (= (or bm!2454 bm!2463) bm!2462))

(assert (= (or b!25611 b!25624) bm!2466))

(assert (= (or bm!2456 bm!2451) bm!2460))

(assert (= (or bm!2459 bm!2471) bm!2468))

(assert (= (or b!25596 b!25616) bm!2470))

(assert (= (or b!25611 b!25624) bm!2472))

(assert (= (and bm!2472 c!3613) b!25604))

(assert (= (and bm!2472 (not c!3613)) b!25595))

(assert (= (or bm!2458 b!25595) bm!2461))

(assert (= (or bm!2449 bm!2466) bm!2457))

(assert (= (or bm!2452 b!25624) bm!2464))

(assert (= (and bm!2464 c!3606) b!25610))

(assert (= (and bm!2464 (not c!3606)) b!25617))

(assert (= (and d!4773 res!15303) b!25590))

(assert (= (and b!25590 c!3605) b!25615))

(assert (= (and b!25590 (not c!3605)) b!25620))

(assert (= (and b!25615 res!15293) b!25605))

(assert (= (or b!25605 b!25620) bm!2450))

(assert (= (or b!25615 b!25605 b!25620) bm!2469))

(declare-fun m!20523 () Bool)

(assert (=> bm!2457 m!20523))

(declare-fun m!20525 () Bool)

(assert (=> bm!2457 m!20525))

(declare-fun m!20527 () Bool)

(assert (=> bm!2472 m!20527))

(declare-fun m!20529 () Bool)

(assert (=> bm!2472 m!20529))

(declare-fun m!20531 () Bool)

(assert (=> b!25602 m!20531))

(declare-fun m!20533 () Bool)

(assert (=> bm!2450 m!20533))

(declare-fun m!20535 () Bool)

(assert (=> b!25606 m!20535))

(declare-fun m!20537 () Bool)

(assert (=> bm!2470 m!20537))

(declare-fun m!20539 () Bool)

(assert (=> b!25624 m!20539))

(declare-fun m!20541 () Bool)

(assert (=> b!25624 m!20541))

(declare-fun m!20543 () Bool)

(assert (=> b!25624 m!20543))

(assert (=> b!25624 m!20539))

(assert (=> b!25624 m!20523))

(declare-fun m!20545 () Bool)

(assert (=> b!25624 m!20545))

(declare-fun m!20547 () Bool)

(assert (=> bm!2462 m!20547))

(declare-fun m!20549 () Bool)

(assert (=> b!25593 m!20549))

(assert (=> bm!2468 m!20531))

(declare-fun m!20551 () Bool)

(assert (=> bm!2453 m!20551))

(declare-fun m!20553 () Bool)

(assert (=> b!25615 m!20553))

(declare-fun m!20555 () Bool)

(assert (=> b!25594 m!20555))

(declare-fun m!20557 () Bool)

(assert (=> b!25612 m!20557))

(declare-fun m!20559 () Bool)

(assert (=> b!25626 m!20559))

(declare-fun m!20561 () Bool)

(assert (=> b!25589 m!20561))

(assert (=> b!25617 m!20539))

(declare-fun m!20563 () Bool)

(assert (=> d!4773 m!20563))

(declare-fun m!20565 () Bool)

(assert (=> d!4773 m!20565))

(declare-fun m!20567 () Bool)

(assert (=> bm!2467 m!20567))

(declare-fun m!20569 () Bool)

(assert (=> b!25605 m!20569))

(declare-fun m!20571 () Bool)

(assert (=> bm!2460 m!20571))

(declare-fun m!20573 () Bool)

(assert (=> b!25607 m!20573))

(declare-fun m!20575 () Bool)

(assert (=> bm!2461 m!20575))

(declare-fun m!20577 () Bool)

(assert (=> bm!2469 m!20577))

(declare-fun m!20579 () Bool)

(assert (=> bm!2464 m!20579))

(declare-fun m!20581 () Bool)

(assert (=> b!25618 m!20581))

(assert (=> bm!2325 d!4773))

(declare-fun d!4775 () Bool)

(assert (=> d!4775 (= (map!414 (_3!9 lt!9892)) (map!415 (v!1625 (underlying!121 (_3!9 lt!9892)))))))

(declare-fun bs!1053 () Bool)

(assert (= bs!1053 d!4775))

(declare-fun m!20583 () Bool)

(assert (=> bs!1053 m!20583))

(assert (=> b!25307 d!4775))

(declare-fun d!4777 () Bool)

(assert (=> d!4777 (= (map!414 thiss!938) (map!415 (v!1625 (underlying!121 thiss!938))))))

(declare-fun bs!1054 () Bool)

(assert (= bs!1054 d!4777))

(assert (=> bs!1054 m!20441))

(assert (=> b!25307 d!4777))

(declare-fun d!4779 () Bool)

(declare-fun e!16565 () Bool)

(assert (=> d!4779 e!16565))

(declare-fun res!15308 () Bool)

(assert (=> d!4779 (=> (not res!15308) (not e!16565))))

(declare-fun lt!10209 () LongMapFixedSize!220)

(assert (=> d!4779 (= res!15308 (valid!125 lt!10209))))

(declare-fun lt!10211 () LongMapFixedSize!220)

(assert (=> d!4779 (= lt!10209 lt!10211)))

(declare-fun lt!10223 () Unit!612)

(declare-fun e!16563 () Unit!612)

(assert (=> d!4779 (= lt!10223 e!16563)))

(declare-fun c!3618 () Bool)

(assert (=> d!4779 (= c!3618 (not (= (map!415 lt!10211) (ListLongMap!568 Nil!565))))))

(declare-fun lt!10207 () Unit!612)

(declare-fun lt!10217 () Unit!612)

(assert (=> d!4779 (= lt!10207 lt!10217)))

(declare-fun lt!10224 () array!1291)

(declare-fun lt!10213 () (_ BitVec 32))

(declare-fun lt!10229 () List!569)

(assert (=> d!4779 (arrayNoDuplicates!0 lt!10224 lt!10213 lt!10229)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1291 (_ BitVec 32) (_ BitVec 32) List!569) Unit!612)

(assert (=> d!4779 (= lt!10217 (lemmaArrayNoDuplicatesInAll0Array!0 lt!10224 lt!10213 (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) lt!10229))))

(assert (=> d!4779 (= lt!10229 Nil!566)))

(assert (=> d!4779 (= lt!10213 #b00000000000000000000000000000000)))

(assert (=> d!4779 (= lt!10224 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10220 () Unit!612)

(declare-fun lt!10226 () Unit!612)

(assert (=> d!4779 (= lt!10220 lt!10226)))

(declare-fun lt!10227 () (_ BitVec 32))

(declare-fun lt!10208 () array!1291)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1291 (_ BitVec 32)) Bool)

(assert (=> d!4779 (arrayForallSeekEntryOrOpenFound!0 lt!10227 lt!10208 (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) Unit!612)

(assert (=> d!4779 (= lt!10226 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!10208 (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) lt!10227))))

(assert (=> d!4779 (= lt!10227 #b00000000000000000000000000000000)))

(assert (=> d!4779 (= lt!10208 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10219 () Unit!612)

(declare-fun lt!10218 () Unit!612)

(assert (=> d!4779 (= lt!10219 lt!10218)))

(declare-fun lt!10228 () array!1291)

(declare-fun lt!10210 () (_ BitVec 32))

(declare-fun lt!10212 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!4779 (= (arrayCountValidKeys!0 lt!10228 lt!10210 lt!10212) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) Unit!612)

(assert (=> d!4779 (= lt!10218 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!10228 lt!10210 lt!10212))))

(assert (=> d!4779 (= lt!10212 (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!4779 (= lt!10210 #b00000000000000000000000000000000)))

(assert (=> d!4779 (= lt!10228 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4779 (= lt!10211 (LongMapFixedSize!221 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!142 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!142 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (array!1290 ((as const (Array (_ BitVec 32) ValueCell!317)) EmptyCell!317) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!4779 (validMask!0 (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))))))

(assert (=> d!4779 (= (getNewLongMapFixedSize!42 (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) (defaultEntry!1768 (v!1625 (underlying!121 thiss!938)))) lt!10209)))

(declare-fun b!25641 () Bool)

(declare-fun e!16564 () Bool)

(declare-fun lt!10222 () tuple2!992)

(declare-fun lt!10225 () (_ BitVec 32))

(assert (=> b!25641 (= e!16564 (ite (= (_1!506 lt!10222) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!10225 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!10225 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!25642 () Bool)

(assert (=> b!25642 (= e!16565 (= (map!415 lt!10209) (ListLongMap!568 Nil!565)))))

(declare-fun b!25643 () Bool)

(declare-fun Unit!620 () Unit!612)

(assert (=> b!25643 (= e!16563 Unit!620)))

(declare-fun b!25644 () Bool)

(declare-fun Unit!621 () Unit!612)

(assert (=> b!25644 (= e!16563 Unit!621)))

(declare-fun head!830 (List!568) tuple2!992)

(assert (=> b!25644 (= lt!10222 (head!830 (toList!299 (map!415 lt!10211))))))

(declare-fun lt!10221 () array!1291)

(assert (=> b!25644 (= lt!10221 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!25644 (= lt!10225 #b00000000000000000000000000000000)))

(declare-fun lt!10216 () Unit!612)

(declare-fun lemmaKeyInListMapIsInArray!99 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) Int) Unit!612)

(assert (=> b!25644 (= lt!10216 (lemmaKeyInListMapIsInArray!99 lt!10221 (array!1290 ((as const (Array (_ BitVec 32) ValueCell!317)) EmptyCell!317) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) lt!10225 (dynLambda!142 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!142 (defaultEntry!1768 (v!1625 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!506 lt!10222) (defaultEntry!1768 (v!1625 (underlying!121 thiss!938)))))))

(declare-fun c!3619 () Bool)

(assert (=> b!25644 (= c!3619 (and (not (= (_1!506 lt!10222) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!506 lt!10222) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25644 e!16564))

(declare-fun lt!10215 () Unit!612)

(assert (=> b!25644 (= lt!10215 lt!10216)))

(declare-fun lt!10214 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1291 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25644 (= lt!10214 (arrayScanForKey!0 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (_1!506 lt!10222) #b00000000000000000000000000000000))))

(assert (=> b!25644 false))

(declare-fun b!25645 () Bool)

(declare-fun res!15309 () Bool)

(assert (=> b!25645 (=> (not res!15309) (not e!16565))))

(assert (=> b!25645 (= res!15309 (= (mask!4770 lt!10209) (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun b!25646 () Bool)

(assert (=> b!25646 (= e!16564 (arrayContainsKey!0 lt!10221 (_1!506 lt!10222) #b00000000000000000000000000000000))))

(assert (= (and d!4779 c!3618) b!25644))

(assert (= (and d!4779 (not c!3618)) b!25643))

(assert (= (and b!25644 c!3619) b!25646))

(assert (= (and b!25644 (not c!3619)) b!25641))

(assert (= (and d!4779 res!15308) b!25645))

(assert (= (and b!25645 res!15309) b!25642))

(declare-fun b_lambda!1657 () Bool)

(assert (=> (not b_lambda!1657) (not d!4779)))

(assert (=> d!4779 t!3249))

(declare-fun b_and!1565 () Bool)

(assert (= b_and!1563 (and (=> t!3249 result!1111) b_and!1565)))

(declare-fun b_lambda!1659 () Bool)

(assert (=> (not b_lambda!1659) (not b!25644)))

(assert (=> b!25644 t!3249))

(declare-fun b_and!1567 () Bool)

(assert (= b_and!1565 (and (=> t!3249 result!1111) b_and!1567)))

(declare-fun m!20585 () Bool)

(assert (=> d!4779 m!20585))

(declare-fun m!20587 () Bool)

(assert (=> d!4779 m!20587))

(declare-fun m!20589 () Bool)

(assert (=> d!4779 m!20589))

(declare-fun m!20591 () Bool)

(assert (=> d!4779 m!20591))

(declare-fun m!20593 () Bool)

(assert (=> d!4779 m!20593))

(assert (=> d!4779 m!20349))

(declare-fun m!20595 () Bool)

(assert (=> d!4779 m!20595))

(assert (=> d!4779 m!20409))

(assert (=> d!4779 m!20349))

(declare-fun m!20597 () Bool)

(assert (=> d!4779 m!20597))

(declare-fun m!20599 () Bool)

(assert (=> d!4779 m!20599))

(assert (=> d!4779 m!20349))

(declare-fun m!20601 () Bool)

(assert (=> d!4779 m!20601))

(declare-fun m!20603 () Bool)

(assert (=> b!25642 m!20603))

(assert (=> b!25644 m!20409))

(assert (=> b!25644 m!20585))

(assert (=> b!25644 m!20349))

(assert (=> b!25644 m!20409))

(assert (=> b!25644 m!20409))

(declare-fun m!20605 () Bool)

(assert (=> b!25644 m!20605))

(declare-fun m!20607 () Bool)

(assert (=> b!25644 m!20607))

(declare-fun m!20609 () Bool)

(assert (=> b!25644 m!20609))

(declare-fun m!20611 () Bool)

(assert (=> b!25646 m!20611))

(assert (=> b!25311 d!4779))

(declare-fun d!4781 () Bool)

(declare-fun e!16571 () Bool)

(assert (=> d!4781 e!16571))

(declare-fun res!15312 () Bool)

(assert (=> d!4781 (=> (not res!15312) (not e!16571))))

(declare-fun lt!10235 () (_ BitVec 32))

(assert (=> d!4781 (= res!15312 (validMask!0 lt!10235))))

(declare-datatypes ((tuple2!996 0))(
  ( (tuple2!997 (_1!509 Unit!612) (_2!509 (_ BitVec 32))) )
))
(declare-fun e!16570 () tuple2!996)

(assert (=> d!4781 (= lt!10235 (_2!509 e!16570))))

(declare-fun c!3622 () Bool)

(declare-fun lt!10234 () tuple2!996)

(assert (=> d!4781 (= c!3622 (and (bvsgt (_2!509 lt!10234) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!158 (v!1625 (underlying!121 thiss!938)))) (_2!509 lt!10234)) (bvsge (bvadd (bvand (bvashr (_2!509 lt!10234) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!158 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun Unit!622 () Unit!612)

(declare-fun Unit!623 () Unit!612)

(assert (=> d!4781 (= lt!10234 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!158 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))))) (mask!4770 (v!1625 (underlying!121 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!158 (v!1625 (underlying!121 thiss!938)))) (mask!4770 (v!1625 (underlying!121 thiss!938))))) (tuple2!997 Unit!622 (bvand (bvadd (bvshl (mask!4770 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!997 Unit!623 (mask!4770 (v!1625 (underlying!121 thiss!938))))))))

(assert (=> d!4781 (validMask!0 (mask!4770 (v!1625 (underlying!121 thiss!938))))))

(assert (=> d!4781 (= (computeNewMask!37 thiss!938 (mask!4770 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (_size!158 (v!1625 (underlying!121 thiss!938)))) lt!10235)))

(declare-fun b!25653 () Bool)

(declare-fun computeNewMaskWhile!16 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!996)

(assert (=> b!25653 (= e!16570 (computeNewMaskWhile!16 (_size!158 (v!1625 (underlying!121 thiss!938))) (_vacant!158 (v!1625 (underlying!121 thiss!938))) (mask!4770 (v!1625 (underlying!121 thiss!938))) (_2!509 lt!10234)))))

(declare-fun b!25654 () Bool)

(declare-fun Unit!624 () Unit!612)

(assert (=> b!25654 (= e!16570 (tuple2!997 Unit!624 (_2!509 lt!10234)))))

(declare-fun b!25655 () Bool)

(assert (=> b!25655 (= e!16571 (bvsle (_size!158 (v!1625 (underlying!121 thiss!938))) (bvadd lt!10235 #b00000000000000000000000000000001)))))

(assert (= (and d!4781 c!3622) b!25653))

(assert (= (and d!4781 (not c!3622)) b!25654))

(assert (= (and d!4781 res!15312) b!25655))

(declare-fun m!20613 () Bool)

(assert (=> d!4781 m!20613))

(declare-fun m!20615 () Bool)

(assert (=> d!4781 m!20615))

(declare-fun m!20617 () Bool)

(assert (=> b!25653 m!20617))

(assert (=> b!25311 d!4781))

(declare-fun b!25662 () Bool)

(declare-fun e!16576 () Bool)

(assert (=> b!25662 (= e!16576 tp_is_empty!1033)))

(declare-fun condMapEmpty!1057 () Bool)

(declare-fun mapDefault!1057 () ValueCell!317)

(assert (=> mapNonEmpty!1048 (= condMapEmpty!1057 (= mapRest!1048 ((as const (Array (_ BitVec 32) ValueCell!317)) mapDefault!1057)))))

(declare-fun e!16577 () Bool)

(declare-fun mapRes!1057 () Bool)

(assert (=> mapNonEmpty!1048 (= tp!3561 (and e!16577 mapRes!1057))))

(declare-fun mapNonEmpty!1057 () Bool)

(declare-fun tp!3577 () Bool)

(assert (=> mapNonEmpty!1057 (= mapRes!1057 (and tp!3577 e!16576))))

(declare-fun mapValue!1057 () ValueCell!317)

(declare-fun mapRest!1057 () (Array (_ BitVec 32) ValueCell!317))

(declare-fun mapKey!1057 () (_ BitVec 32))

(assert (=> mapNonEmpty!1057 (= mapRest!1048 (store mapRest!1057 mapKey!1057 mapValue!1057))))

(declare-fun b!25663 () Bool)

(assert (=> b!25663 (= e!16577 tp_is_empty!1033)))

(declare-fun mapIsEmpty!1057 () Bool)

(assert (=> mapIsEmpty!1057 mapRes!1057))

(assert (= (and mapNonEmpty!1048 condMapEmpty!1057) mapIsEmpty!1057))

(assert (= (and mapNonEmpty!1048 (not condMapEmpty!1057)) mapNonEmpty!1057))

(assert (= (and mapNonEmpty!1057 ((_ is ValueCellFull!317) mapValue!1057)) b!25662))

(assert (= (and mapNonEmpty!1048 ((_ is ValueCellFull!317) mapDefault!1057)) b!25663))

(declare-fun m!20619 () Bool)

(assert (=> mapNonEmpty!1057 m!20619))

(declare-fun b_lambda!1661 () Bool)

(assert (= b_lambda!1657 (or (and b!25305 b_free!769) b_lambda!1661)))

(declare-fun b_lambda!1663 () Bool)

(assert (= b_lambda!1655 (or (and b!25305 b_free!769) b_lambda!1663)))

(declare-fun b_lambda!1665 () Bool)

(assert (= b_lambda!1659 (or (and b!25305 b_free!769) b_lambda!1665)))

(check-sat (not b!25547) b_and!1567 (not d!4771) (not bm!2370) (not b!25573) (not d!4773) (not b!25624) (not bm!2443) (not bm!2436) (not b!25615) (not b!25617) (not b!25560) (not d!4763) (not b!25644) (not bm!2469) (not b_next!769) (not mapNonEmpty!1057) (not bm!2371) (not bm!2444) (not b!25602) (not b!25589) (not b!25453) (not bm!2429) (not b!25575) (not bm!2468) (not bm!2438) (not bm!2367) (not d!4781) (not bm!2376) (not b!25642) (not d!4769) (not bm!2448) (not bm!2374) tp_is_empty!1033 (not b!25448) (not bm!2440) (not bm!2433) (not b_lambda!1665) (not bm!2365) (not b_lambda!1663) (not bm!2369) (not bm!2472) (not b!25612) (not bm!2445) (not bm!2426) (not d!4775) (not b!25456) (not bm!2437) (not b!25450) (not b!25605) (not b!25563) (not bm!2375) (not b!25455) (not bm!2470) (not bm!2460) (not b!25570) (not bm!2446) (not bm!2366) (not b!25646) (not d!4777) (not d!4779) (not bm!2462) (not bm!2372) (not bm!2373) (not b!25653) (not b!25582) (not bm!2467) (not b_lambda!1661) (not bm!2464) (not bm!2461) (not bm!2364) (not bm!2450) (not bm!2457) (not bm!2368) (not bm!2453))
(check-sat b_and!1567 (not b_next!769))
