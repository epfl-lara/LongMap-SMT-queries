; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3654 () Bool)

(assert start!3654)

(declare-fun b!25426 () Bool)

(declare-fun b_free!771 () Bool)

(declare-fun b_next!771 () Bool)

(assert (=> b!25426 (= b_free!771 (not b_next!771))))

(declare-fun tp!3567 () Bool)

(declare-fun b_and!1569 () Bool)

(assert (=> b!25426 (= tp!3567 b_and!1569)))

(declare-fun res!15275 () Bool)

(declare-fun e!16449 () Bool)

(assert (=> start!3654 (=> (not res!15275) (not e!16449))))

(declare-datatypes ((V!1205 0))(
  ( (V!1206 (val!544 Int)) )
))
(declare-datatypes ((ValueCell!318 0))(
  ( (ValueCellFull!318 (v!1626 V!1205)) (EmptyCell!318) )
))
(declare-datatypes ((array!1311 0))(
  ( (array!1312 (arr!619 (Array (_ BitVec 32) ValueCell!318)) (size!720 (_ BitVec 32))) )
))
(declare-datatypes ((array!1313 0))(
  ( (array!1314 (arr!620 (Array (_ BitVec 32) (_ BitVec 64))) (size!721 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!222 0))(
  ( (LongMapFixedSize!223 (defaultEntry!1769 Int) (mask!4771 (_ BitVec 32)) (extraKeys!1661 (_ BitVec 32)) (zeroValue!1688 V!1205) (minValue!1688 V!1205) (_size!159 (_ BitVec 32)) (_keys!3194 array!1313) (_values!1753 array!1311) (_vacant!159 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!222 0))(
  ( (Cell!223 (v!1627 LongMapFixedSize!222)) )
))
(declare-datatypes ((LongMap!222 0))(
  ( (LongMap!223 (underlying!122 Cell!222)) )
))
(declare-fun thiss!938 () LongMap!222)

(declare-fun valid!109 (LongMap!222) Bool)

(assert (=> start!3654 (= res!15275 (valid!109 thiss!938))))

(assert (=> start!3654 e!16449))

(declare-fun e!16448 () Bool)

(assert (=> start!3654 e!16448))

(declare-fun b!25425 () Bool)

(declare-fun e!16456 () Bool)

(declare-fun e!16446 () Bool)

(assert (=> b!25425 (= e!16456 e!16446)))

(declare-fun tp_is_empty!1035 () Bool)

(declare-fun e!16455 () Bool)

(declare-fun array_inv!417 (array!1313) Bool)

(declare-fun array_inv!418 (array!1311) Bool)

(assert (=> b!25426 (= e!16446 (and tp!3567 tp_is_empty!1035 (array_inv!417 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) (array_inv!418 (_values!1753 (v!1627 (underlying!122 thiss!938)))) e!16455))))

(declare-fun b!25427 () Bool)

(declare-fun e!16452 () Bool)

(assert (=> b!25427 (= e!16452 tp_is_empty!1035)))

(declare-fun lt!9964 () LongMapFixedSize!222)

(declare-fun c!3542 () Bool)

(declare-fun bm!2344 () Bool)

(declare-datatypes ((tuple2!984 0))(
  ( (tuple2!985 (_1!501 Bool) (_2!501 LongMapFixedSize!222)) )
))
(declare-fun call!2347 () tuple2!984)

(declare-fun c!3541 () Bool)

(declare-fun update!35 (LongMapFixedSize!222 (_ BitVec 64) V!1205) tuple2!984)

(assert (=> bm!2344 (= call!2347 (update!35 lt!9964 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))))))))

(declare-fun b!25428 () Bool)

(declare-fun e!16454 () Bool)

(declare-datatypes ((tuple3!18 0))(
  ( (tuple3!19 (_1!502 Bool) (_2!502 Cell!222) (_3!9 LongMap!222)) )
))
(declare-fun lt!9966 () tuple3!18)

(declare-datatypes ((tuple2!986 0))(
  ( (tuple2!987 (_1!503 (_ BitVec 64)) (_2!503 V!1205)) )
))
(declare-datatypes ((List!572 0))(
  ( (Nil!569) (Cons!568 (h!1135 tuple2!986) (t!3257 List!572)) )
))
(declare-datatypes ((ListLongMap!571 0))(
  ( (ListLongMap!572 (toList!301 List!572)) )
))
(declare-fun map!413 (LongMap!222) ListLongMap!571)

(assert (=> b!25428 (= e!16454 (not (= (map!413 (_3!9 lt!9966)) (map!413 thiss!938))))))

(declare-fun b!25429 () Bool)

(declare-fun lt!9968 () tuple2!984)

(declare-fun call!2348 () tuple2!984)

(assert (=> b!25429 (= lt!9968 call!2348)))

(declare-datatypes ((tuple2!988 0))(
  ( (tuple2!989 (_1!504 Bool) (_2!504 Cell!222)) )
))
(declare-fun e!16445 () tuple2!988)

(assert (=> b!25429 (= e!16445 (tuple2!989 (_1!501 lt!9968) (Cell!223 (_2!501 lt!9968))))))

(declare-fun b!25430 () Bool)

(declare-fun c!3540 () Bool)

(declare-fun lt!9961 () Bool)

(assert (=> b!25430 (= c!3540 (and (not (= (bvand (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9961))))

(declare-fun e!16451 () tuple2!988)

(assert (=> b!25430 (= e!16445 e!16451)))

(declare-fun e!16447 () tuple3!18)

(declare-fun b!25431 () Bool)

(declare-fun lt!9965 () tuple2!984)

(declare-fun lt!9963 () Cell!222)

(assert (=> b!25431 (= e!16447 (ite (_1!501 lt!9965) (tuple3!19 true (underlying!122 thiss!938) (LongMap!223 lt!9963)) (tuple3!19 false lt!9963 thiss!938)))))

(declare-fun lt!9970 () tuple2!988)

(declare-fun repackFrom!9 (LongMap!222 LongMapFixedSize!222 (_ BitVec 32)) tuple2!984)

(assert (=> b!25431 (= lt!9965 (repackFrom!9 thiss!938 (v!1627 (_2!504 lt!9970)) (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!25431 (= lt!9963 (Cell!223 (_2!501 lt!9965)))))

(declare-fun bm!2345 () Bool)

(assert (=> bm!2345 (= call!2348 call!2347)))

(declare-fun b!25432 () Bool)

(declare-fun e!16453 () Bool)

(declare-fun mapRes!1051 () Bool)

(assert (=> b!25432 (= e!16455 (and e!16453 mapRes!1051))))

(declare-fun condMapEmpty!1051 () Bool)

(declare-fun mapDefault!1051 () ValueCell!318)

(assert (=> b!25432 (= condMapEmpty!1051 (= (arr!619 (_values!1753 (v!1627 (underlying!122 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!318)) mapDefault!1051)))))

(declare-fun b!25433 () Bool)

(declare-fun e!16457 () tuple2!988)

(declare-fun lt!9969 () tuple2!984)

(declare-fun lt!9967 () tuple2!984)

(assert (=> b!25433 (= e!16457 (tuple2!989 (and (_1!501 lt!9969) (_1!501 lt!9967)) (Cell!223 (_2!501 lt!9967))))))

(assert (=> b!25433 (= lt!9969 call!2347)))

(assert (=> b!25433 (= lt!9967 (update!35 (_2!501 lt!9969) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun b!25434 () Bool)

(assert (=> b!25434 (= e!16457 e!16445)))

(assert (=> b!25434 (= c!3542 (and (not lt!9961) (= (bvand (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!25435 () Bool)

(assert (=> b!25435 (= e!16448 e!16456)))

(declare-fun b!25436 () Bool)

(assert (=> b!25436 (= e!16449 e!16454)))

(declare-fun res!15274 () Bool)

(assert (=> b!25436 (=> (not res!15274) (not e!16454))))

(assert (=> b!25436 (= res!15274 (_1!502 lt!9966))))

(assert (=> b!25436 (= lt!9966 e!16447)))

(declare-fun c!3543 () Bool)

(assert (=> b!25436 (= c!3543 (not (_1!504 lt!9970)))))

(assert (=> b!25436 (= lt!9970 e!16457)))

(assert (=> b!25436 (= c!3541 (and (not lt!9961) (not (= (bvand (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!25436 (= lt!9961 (= (bvand (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!36 ((_ BitVec 32) Int) LongMapFixedSize!222)

(declare-fun computeNewMask!32 (LongMap!222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25436 (= lt!9964 (getNewLongMapFixedSize!36 (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) (defaultEntry!1769 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun mapIsEmpty!1051 () Bool)

(assert (=> mapIsEmpty!1051 mapRes!1051))

(declare-fun b!25437 () Bool)

(assert (=> b!25437 (= e!16447 (tuple3!19 false (_2!504 lt!9970) thiss!938))))

(declare-fun mapNonEmpty!1051 () Bool)

(declare-fun tp!3568 () Bool)

(assert (=> mapNonEmpty!1051 (= mapRes!1051 (and tp!3568 e!16452))))

(declare-fun mapRest!1051 () (Array (_ BitVec 32) ValueCell!318))

(declare-fun mapValue!1051 () ValueCell!318)

(declare-fun mapKey!1051 () (_ BitVec 32))

(assert (=> mapNonEmpty!1051 (= (arr!619 (_values!1753 (v!1627 (underlying!122 thiss!938)))) (store mapRest!1051 mapKey!1051 mapValue!1051))))

(declare-fun b!25438 () Bool)

(declare-fun lt!9962 () tuple2!984)

(assert (=> b!25438 (= e!16451 (tuple2!989 (_1!501 lt!9962) (Cell!223 (_2!501 lt!9962))))))

(assert (=> b!25438 (= lt!9962 call!2348)))

(declare-fun b!25439 () Bool)

(assert (=> b!25439 (= e!16451 (tuple2!989 true (Cell!223 lt!9964)))))

(declare-fun b!25440 () Bool)

(assert (=> b!25440 (= e!16453 tp_is_empty!1035)))

(assert (= (and start!3654 res!15275) b!25436))

(assert (= (and b!25436 c!3541) b!25433))

(assert (= (and b!25436 (not c!3541)) b!25434))

(assert (= (and b!25434 c!3542) b!25429))

(assert (= (and b!25434 (not c!3542)) b!25430))

(assert (= (and b!25430 c!3540) b!25438))

(assert (= (and b!25430 (not c!3540)) b!25439))

(assert (= (or b!25429 b!25438) bm!2345))

(assert (= (or b!25433 bm!2345) bm!2344))

(assert (= (and b!25436 c!3543) b!25437))

(assert (= (and b!25436 (not c!3543)) b!25431))

(assert (= (and b!25436 res!15274) b!25428))

(assert (= (and b!25432 condMapEmpty!1051) mapIsEmpty!1051))

(assert (= (and b!25432 (not condMapEmpty!1051)) mapNonEmpty!1051))

(get-info :version)

(assert (= (and mapNonEmpty!1051 ((_ is ValueCellFull!318) mapValue!1051)) b!25427))

(assert (= (and b!25432 ((_ is ValueCellFull!318) mapDefault!1051)) b!25440))

(assert (= b!25426 b!25432))

(assert (= b!25425 b!25426))

(assert (= b!25435 b!25425))

(assert (= start!3654 b!25435))

(declare-fun m!20511 () Bool)

(assert (=> b!25433 m!20511))

(declare-fun m!20513 () Bool)

(assert (=> start!3654 m!20513))

(declare-fun m!20515 () Bool)

(assert (=> b!25431 m!20515))

(declare-fun m!20517 () Bool)

(assert (=> bm!2344 m!20517))

(declare-fun m!20519 () Bool)

(assert (=> b!25428 m!20519))

(declare-fun m!20521 () Bool)

(assert (=> b!25428 m!20521))

(declare-fun m!20523 () Bool)

(assert (=> b!25436 m!20523))

(assert (=> b!25436 m!20523))

(declare-fun m!20525 () Bool)

(assert (=> b!25436 m!20525))

(declare-fun m!20527 () Bool)

(assert (=> mapNonEmpty!1051 m!20527))

(declare-fun m!20529 () Bool)

(assert (=> b!25426 m!20529))

(declare-fun m!20531 () Bool)

(assert (=> b!25426 m!20531))

(check-sat (not b!25431) (not b!25433) (not b!25436) (not b!25428) b_and!1569 (not b!25426) tp_is_empty!1035 (not mapNonEmpty!1051) (not b_next!771) (not start!3654) (not bm!2344))
(check-sat b_and!1569 (not b_next!771))
(get-model)

(declare-fun lt!10084 () (_ BitVec 64))

(declare-fun bm!2378 () Bool)

(declare-fun lt!10065 () (_ BitVec 64))

(declare-fun c!3573 () Bool)

(declare-fun call!2390 () ListLongMap!571)

(declare-fun call!2385 () ListLongMap!571)

(declare-fun +!47 (ListLongMap!571 tuple2!986) ListLongMap!571)

(assert (=> bm!2378 (= call!2385 (+!47 call!2390 (ite c!3573 (tuple2!987 lt!10084 (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))) (tuple2!987 lt!10065 (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun b!25517 () Bool)

(assert (=> b!25517 (= c!3573 (bvsgt (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!16515 () tuple2!984)

(declare-fun e!16520 () tuple2!984)

(assert (=> b!25517 (= e!16515 e!16520)))

(declare-fun b!25518 () Bool)

(declare-fun e!16516 () Bool)

(declare-fun lt!10090 () (_ BitVec 64))

(assert (=> b!25518 (= e!16516 (ite (= lt!10090 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!2388 () ListLongMap!571)

(declare-fun bm!2379 () Bool)

(declare-fun lt!10089 () V!1205)

(declare-fun call!2387 () ListLongMap!571)

(declare-fun call!2384 () ListLongMap!571)

(assert (=> bm!2379 (= call!2384 (+!47 (ite c!3573 call!2387 call!2388) (tuple2!987 lt!10090 lt!10089)))))

(declare-fun b!25519 () Bool)

(declare-fun lt!10096 () tuple2!984)

(declare-fun call!2382 () tuple2!984)

(assert (=> b!25519 (= lt!10096 call!2382)))

(declare-fun e!16519 () tuple2!984)

(assert (=> b!25519 (= e!16519 (tuple2!985 (_1!501 lt!10096) (_2!501 lt!10096)))))

(declare-fun lt!10069 () (_ BitVec 64))

(declare-fun lt!10092 () ListLongMap!571)

(declare-fun lt!10067 () (_ BitVec 64))

(declare-datatypes ((Unit!604 0))(
  ( (Unit!605) )
))
(declare-fun call!2386 () Unit!604)

(declare-fun lt!10076 () ListLongMap!571)

(declare-fun bm!2380 () Bool)

(declare-fun addCommutativeForDiffKeys!4 (ListLongMap!571 (_ BitVec 64) V!1205 (_ BitVec 64) V!1205) Unit!604)

(assert (=> bm!2380 (= call!2386 (addCommutativeForDiffKeys!4 (ite c!3573 lt!10092 lt!10076) lt!10090 lt!10089 (ite c!3573 lt!10069 lt!10067) (minValue!1688 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun d!4799 () Bool)

(declare-fun e!16513 () Bool)

(assert (=> d!4799 e!16513))

(declare-fun res!15287 () Bool)

(assert (=> d!4799 (=> res!15287 e!16513)))

(declare-fun lt!10074 () tuple2!984)

(assert (=> d!4799 (= res!15287 (not (_1!501 lt!10074)))))

(declare-fun e!16514 () tuple2!984)

(assert (=> d!4799 (= lt!10074 e!16514)))

(declare-fun c!3569 () Bool)

(assert (=> d!4799 (= c!3569 (and (not (= lt!10090 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10090 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!10068 () ListLongMap!571)

(declare-fun map!415 (LongMapFixedSize!222) ListLongMap!571)

(assert (=> d!4799 (= lt!10068 (map!415 (v!1627 (_2!504 lt!9970))))))

(declare-fun get!398 (ValueCell!318 V!1205) V!1205)

(declare-fun dynLambda!146 (Int (_ BitVec 64)) V!1205)

(assert (=> d!4799 (= lt!10089 (get!398 (select (arr!619 (_values!1753 (v!1627 (underlying!122 thiss!938)))) (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)) (dynLambda!146 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4799 (= lt!10090 (select (arr!620 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4799 (valid!109 thiss!938)))

(assert (=> d!4799 (= (repackFrom!9 thiss!938 (v!1627 (_2!504 lt!9970)) (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)) lt!10074)))

(declare-fun bm!2381 () Bool)

(declare-fun call!2393 () ListLongMap!571)

(declare-fun call!2389 () ListLongMap!571)

(assert (=> bm!2381 (= call!2389 (+!47 (ite c!3573 call!2388 call!2393) (ite c!3573 (tuple2!987 lt!10069 (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun b!25520 () Bool)

(assert (=> b!25520 false))

(declare-fun lt!10066 () Unit!604)

(declare-fun lt!10091 () Unit!604)

(assert (=> b!25520 (= lt!10066 lt!10091)))

(declare-fun lt!10079 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!1313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25520 (not (arrayContainsKey!0 (_keys!3194 (v!1627 (underlying!122 thiss!938))) lt!10090 lt!10079))))

(declare-datatypes ((List!574 0))(
  ( (Nil!571) (Cons!570 (h!1137 (_ BitVec 64)) (t!3261 List!574)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1313 (_ BitVec 32) (_ BitVec 64) List!574) Unit!604)

(assert (=> b!25520 (= lt!10091 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3194 (v!1627 (underlying!122 thiss!938))) lt!10079 lt!10090 (Cons!570 lt!10090 Nil!571)))))

(assert (=> b!25520 (= lt!10079 (bvadd (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!10073 () Unit!604)

(declare-fun lt!10070 () Unit!604)

(assert (=> b!25520 (= lt!10073 lt!10070)))

(declare-fun arrayNoDuplicates!0 (array!1313 (_ BitVec 32) List!574) Bool)

(assert (=> b!25520 (arrayNoDuplicates!0 (_keys!3194 (v!1627 (underlying!122 thiss!938))) (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) Nil!571)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1313 (_ BitVec 32) (_ BitVec 32)) Unit!604)

(assert (=> b!25520 (= lt!10070 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3194 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000000 (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10083 () Unit!604)

(declare-fun lt!10086 () Unit!604)

(assert (=> b!25520 (= lt!10083 lt!10086)))

(assert (=> b!25520 e!16516))

(declare-fun c!3570 () Bool)

(assert (=> b!25520 (= c!3570 (and (not (= lt!10090 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10090 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!10095 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!4 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 64) (_ BitVec 32) Int) Unit!604)

(assert (=> b!25520 (= lt!10086 (lemmaListMapContainsThenArrayContainsFrom!4 (_keys!3194 (v!1627 (underlying!122 thiss!938))) (_values!1753 (v!1627 (underlying!122 thiss!938))) (mask!4771 (v!1627 (underlying!122 thiss!938))) (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))) lt!10090 lt!10095 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938)))))))

(assert (=> b!25520 (= lt!10095 (bvadd (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!16518 () Unit!604)

(declare-fun Unit!606 () Unit!604)

(assert (=> b!25520 (= e!16518 Unit!606)))

(declare-fun call!2381 () ListLongMap!571)

(declare-fun bm!2382 () Bool)

(declare-fun call!2391 () ListLongMap!571)

(assert (=> bm!2382 (= call!2391 (+!47 (ite c!3573 call!2393 call!2381) (ite c!3573 (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))) (tuple2!987 lt!10067 (minValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun lt!10072 () tuple2!984)

(declare-fun bm!2383 () Bool)

(assert (=> bm!2383 (= call!2382 (repackFrom!9 thiss!938 (ite c!3569 (_2!501 lt!10072) (v!1627 (_2!504 lt!9970))) (bvsub (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun call!2383 () ListLongMap!571)

(declare-fun bm!2384 () Bool)

(assert (=> bm!2384 (= call!2383 (+!47 (ite c!3573 call!2381 call!2387) (tuple2!987 lt!10090 lt!10089)))))

(declare-fun b!25521 () Bool)

(assert (=> b!25521 (= e!16520 (tuple2!985 true (_2!501 lt!10072)))))

(declare-fun lt!10087 () ListLongMap!571)

(assert (=> b!25521 (= lt!10087 call!2393)))

(assert (=> b!25521 (= lt!10065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10088 () Unit!604)

(declare-fun call!2392 () Unit!604)

(assert (=> b!25521 (= lt!10088 call!2392)))

(assert (=> b!25521 (= call!2385 call!2384)))

(declare-fun lt!10077 () Unit!604)

(assert (=> b!25521 (= lt!10077 lt!10088)))

(assert (=> b!25521 (= lt!10076 call!2389)))

(assert (=> b!25521 (= lt!10067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10081 () Unit!604)

(assert (=> b!25521 (= lt!10081 call!2386)))

(assert (=> b!25521 (= call!2391 call!2383)))

(declare-fun lt!10080 () Unit!604)

(assert (=> b!25521 (= lt!10080 lt!10081)))

(declare-fun b!25522 () Bool)

(assert (=> b!25522 (= e!16514 e!16515)))

(assert (=> b!25522 (= lt!10072 (update!35 (v!1627 (_2!504 lt!9970)) lt!10090 lt!10089))))

(declare-fun c!3571 () Bool)

(declare-fun contains!234 (ListLongMap!571 (_ BitVec 64)) Bool)

(assert (=> b!25522 (= c!3571 (contains!234 lt!10068 lt!10090))))

(declare-fun lt!10094 () Unit!604)

(assert (=> b!25522 (= lt!10094 e!16518)))

(declare-fun c!3568 () Bool)

(assert (=> b!25522 (= c!3568 (_1!501 lt!10072))))

(declare-fun b!25523 () Bool)

(assert (=> b!25523 (= e!16516 (arrayContainsKey!0 (_keys!3194 (v!1627 (underlying!122 thiss!938))) lt!10090 lt!10095))))

(declare-fun b!25524 () Bool)

(declare-fun Unit!607 () Unit!604)

(assert (=> b!25524 (= e!16518 Unit!607)))

(declare-fun lt!10075 () ListLongMap!571)

(declare-fun bm!2385 () Bool)

(assert (=> bm!2385 (= call!2390 (+!47 (ite c!3573 lt!10075 lt!10087) (tuple2!987 lt!10090 lt!10089)))))

(declare-fun b!25525 () Bool)

(declare-fun lt!10071 () tuple2!984)

(assert (=> b!25525 (= e!16520 (tuple2!985 (_1!501 lt!10071) (_2!501 lt!10071)))))

(assert (=> b!25525 (= lt!10075 call!2393)))

(assert (=> b!25525 (= lt!10084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10085 () Unit!604)

(assert (=> b!25525 (= lt!10085 call!2392)))

(assert (=> b!25525 (= call!2385 call!2383)))

(declare-fun lt!10082 () Unit!604)

(assert (=> b!25525 (= lt!10082 lt!10085)))

(assert (=> b!25525 (= lt!10092 call!2391)))

(assert (=> b!25525 (= lt!10069 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10078 () Unit!604)

(assert (=> b!25525 (= lt!10078 call!2386)))

(assert (=> b!25525 (= call!2389 call!2384)))

(declare-fun lt!10093 () Unit!604)

(assert (=> b!25525 (= lt!10093 lt!10078)))

(assert (=> b!25525 (= lt!10071 call!2382)))

(declare-fun bm!2386 () Bool)

(assert (=> bm!2386 (= call!2381 (+!47 (ite c!3573 lt!10075 lt!10076) (ite c!3573 (tuple2!987 lt!10084 (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))) (tuple2!987 lt!10090 lt!10089))))))

(declare-fun b!25526 () Bool)

(assert (=> b!25526 (= e!16514 e!16519)))

(declare-fun c!3572 () Bool)

(assert (=> b!25526 (= c!3572 (bvsgt (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!2387 () Bool)

(assert (=> bm!2387 (= call!2388 (+!47 (ite c!3573 lt!10092 lt!10087) (ite c!3573 (tuple2!987 lt!10090 lt!10089) (tuple2!987 lt!10065 (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun bm!2388 () Bool)

(assert (=> bm!2388 (= call!2387 (+!47 (ite c!3573 lt!10092 lt!10076) (ite c!3573 (tuple2!987 lt!10069 (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (tuple2!987 lt!10067 (minValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun bm!2389 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!16 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 32) Int) ListLongMap!571)

(assert (=> bm!2389 (= call!2393 (getCurrentListMapNoExtraKeys!16 (_keys!3194 (v!1627 (underlying!122 thiss!938))) (_values!1753 (v!1627 (underlying!122 thiss!938))) (mask!4771 (v!1627 (underlying!122 thiss!938))) (extraKeys!1661 (v!1627 (underlying!122 thiss!938))) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))) (bvadd (bvsub (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1769 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun bm!2390 () Bool)

(assert (=> bm!2390 (= call!2392 (addCommutativeForDiffKeys!4 (ite c!3573 lt!10075 lt!10087) lt!10090 lt!10089 (ite c!3573 lt!10084 lt!10065) (zeroValue!1688 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun b!25527 () Bool)

(declare-fun e!16517 () Bool)

(assert (=> b!25527 (= e!16513 e!16517)))

(declare-fun res!15286 () Bool)

(assert (=> b!25527 (=> (not res!15286) (not e!16517))))

(declare-fun valid!111 (LongMapFixedSize!222) Bool)

(assert (=> b!25527 (= res!15286 (valid!111 (_2!501 lt!10074)))))

(declare-fun b!25528 () Bool)

(assert (=> b!25528 (= e!16519 (tuple2!985 true (v!1627 (_2!504 lt!9970))))))

(declare-fun b!25529 () Bool)

(assert (=> b!25529 (= e!16517 (= (map!415 (_2!501 lt!10074)) (map!415 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun b!25530 () Bool)

(assert (=> b!25530 (= e!16515 (tuple2!985 false (_2!501 lt!10072)))))

(assert (= (and d!4799 c!3569) b!25522))

(assert (= (and d!4799 (not c!3569)) b!25526))

(assert (= (and b!25522 c!3571) b!25520))

(assert (= (and b!25522 (not c!3571)) b!25524))

(assert (= (and b!25520 c!3570) b!25523))

(assert (= (and b!25520 (not c!3570)) b!25518))

(assert (= (and b!25522 c!3568) b!25517))

(assert (= (and b!25522 (not c!3568)) b!25530))

(assert (= (and b!25517 c!3573) b!25525))

(assert (= (and b!25517 (not c!3573)) b!25521))

(assert (= (or b!25525 b!25521) bm!2385))

(assert (= (or b!25525 b!25521) bm!2386))

(assert (= (or b!25525 b!25521) bm!2380))

(assert (= (or b!25525 b!25521) bm!2390))

(assert (= (or b!25525 b!25521) bm!2387))

(assert (= (or b!25525 b!25521) bm!2388))

(assert (= (or b!25525 b!25521) bm!2389))

(assert (= (or b!25525 b!25521) bm!2384))

(assert (= (or b!25525 b!25521) bm!2378))

(assert (= (or b!25525 b!25521) bm!2379))

(assert (= (or b!25525 b!25521) bm!2382))

(assert (= (or b!25525 b!25521) bm!2381))

(assert (= (and b!25526 c!3572) b!25519))

(assert (= (and b!25526 (not c!3572)) b!25528))

(assert (= (or b!25525 b!25519) bm!2383))

(assert (= (and d!4799 (not res!15287)) b!25527))

(assert (= (and b!25527 res!15286) b!25529))

(declare-fun b_lambda!1671 () Bool)

(assert (=> (not b_lambda!1671) (not d!4799)))

(declare-fun t!3260 () Bool)

(declare-fun tb!673 () Bool)

(assert (=> (and b!25426 (= (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) (defaultEntry!1769 (v!1627 (underlying!122 thiss!938)))) t!3260) tb!673))

(declare-fun result!1117 () Bool)

(assert (=> tb!673 (= result!1117 tp_is_empty!1035)))

(assert (=> d!4799 t!3260))

(declare-fun b_and!1573 () Bool)

(assert (= b_and!1569 (and (=> t!3260 result!1117) b_and!1573)))

(declare-fun m!20555 () Bool)

(assert (=> bm!2386 m!20555))

(declare-fun m!20557 () Bool)

(assert (=> b!25523 m!20557))

(declare-fun m!20559 () Bool)

(assert (=> bm!2380 m!20559))

(declare-fun m!20561 () Bool)

(assert (=> bm!2381 m!20561))

(declare-fun m!20563 () Bool)

(assert (=> bm!2384 m!20563))

(declare-fun m!20565 () Bool)

(assert (=> bm!2387 m!20565))

(declare-fun m!20567 () Bool)

(assert (=> bm!2388 m!20567))

(declare-fun m!20569 () Bool)

(assert (=> b!25527 m!20569))

(declare-fun m!20571 () Bool)

(assert (=> bm!2385 m!20571))

(declare-fun m!20573 () Bool)

(assert (=> bm!2389 m!20573))

(declare-fun m!20575 () Bool)

(assert (=> b!25529 m!20575))

(declare-fun m!20577 () Bool)

(assert (=> b!25529 m!20577))

(declare-fun m!20579 () Bool)

(assert (=> bm!2378 m!20579))

(declare-fun m!20581 () Bool)

(assert (=> bm!2383 m!20581))

(declare-fun m!20583 () Bool)

(assert (=> bm!2390 m!20583))

(declare-fun m!20585 () Bool)

(assert (=> bm!2382 m!20585))

(declare-fun m!20587 () Bool)

(assert (=> bm!2379 m!20587))

(declare-fun m!20589 () Bool)

(assert (=> b!25522 m!20589))

(declare-fun m!20591 () Bool)

(assert (=> b!25522 m!20591))

(declare-fun m!20593 () Bool)

(assert (=> b!25520 m!20593))

(declare-fun m!20595 () Bool)

(assert (=> b!25520 m!20595))

(declare-fun m!20597 () Bool)

(assert (=> b!25520 m!20597))

(declare-fun m!20599 () Bool)

(assert (=> b!25520 m!20599))

(declare-fun m!20601 () Bool)

(assert (=> b!25520 m!20601))

(declare-fun m!20603 () Bool)

(assert (=> d!4799 m!20603))

(declare-fun m!20605 () Bool)

(assert (=> d!4799 m!20605))

(declare-fun m!20607 () Bool)

(assert (=> d!4799 m!20607))

(declare-fun m!20609 () Bool)

(assert (=> d!4799 m!20609))

(assert (=> d!4799 m!20605))

(assert (=> d!4799 m!20513))

(declare-fun m!20611 () Bool)

(assert (=> d!4799 m!20611))

(assert (=> d!4799 m!20603))

(assert (=> b!25431 d!4799))

(declare-fun b!25545 () Bool)

(declare-fun e!16527 () Bool)

(declare-fun lt!10158 () LongMapFixedSize!222)

(assert (=> b!25545 (= e!16527 (= (map!415 lt!10158) (ListLongMap!572 Nil!569)))))

(declare-fun b!25546 () Bool)

(declare-fun res!15293 () Bool)

(assert (=> b!25546 (=> (not res!15293) (not e!16527))))

(assert (=> b!25546 (= res!15293 (= (mask!4771 lt!10158) (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938))))))))

(declare-fun b!25547 () Bool)

(declare-fun e!16529 () Unit!604)

(declare-fun Unit!608 () Unit!604)

(assert (=> b!25547 (= e!16529 Unit!608)))

(declare-fun lt!10149 () tuple2!986)

(declare-fun lt!10146 () LongMapFixedSize!222)

(declare-fun head!832 (List!572) tuple2!986)

(assert (=> b!25547 (= lt!10149 (head!832 (toList!301 (map!415 lt!10146))))))

(declare-fun lt!10154 () array!1313)

(assert (=> b!25547 (= lt!10154 (array!1314 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10153 () (_ BitVec 32))

(assert (=> b!25547 (= lt!10153 #b00000000000000000000000000000000)))

(declare-fun lt!10160 () Unit!604)

(declare-fun lemmaKeyInListMapIsInArray!93 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 64) Int) Unit!604)

(assert (=> b!25547 (= lt!10160 (lemmaKeyInListMapIsInArray!93 lt!10154 (array!1312 ((as const (Array (_ BitVec 32) ValueCell!318)) EmptyCell!318) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) lt!10153 (dynLambda!146 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!146 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!503 lt!10149) (defaultEntry!1769 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun c!3578 () Bool)

(assert (=> b!25547 (= c!3578 (and (not (= (_1!503 lt!10149) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!503 lt!10149) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!16528 () Bool)

(assert (=> b!25547 e!16528))

(declare-fun lt!10159 () Unit!604)

(assert (=> b!25547 (= lt!10159 lt!10160)))

(declare-fun lt!10155 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1313 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25547 (= lt!10155 (arrayScanForKey!0 (array!1314 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)) (_1!503 lt!10149) #b00000000000000000000000000000000))))

(assert (=> b!25547 false))

(declare-fun b!25549 () Bool)

(declare-fun Unit!609 () Unit!604)

(assert (=> b!25549 (= e!16529 Unit!609)))

(declare-fun b!25550 () Bool)

(assert (=> b!25550 (= e!16528 (arrayContainsKey!0 lt!10154 (_1!503 lt!10149) #b00000000000000000000000000000000))))

(declare-fun d!4801 () Bool)

(assert (=> d!4801 e!16527))

(declare-fun res!15292 () Bool)

(assert (=> d!4801 (=> (not res!15292) (not e!16527))))

(assert (=> d!4801 (= res!15292 (valid!111 lt!10158))))

(assert (=> d!4801 (= lt!10158 lt!10146)))

(declare-fun lt!10151 () Unit!604)

(assert (=> d!4801 (= lt!10151 e!16529)))

(declare-fun c!3579 () Bool)

(assert (=> d!4801 (= c!3579 (not (= (map!415 lt!10146) (ListLongMap!572 Nil!569))))))

(declare-fun lt!10165 () Unit!604)

(declare-fun lt!10145 () Unit!604)

(assert (=> d!4801 (= lt!10165 lt!10145)))

(declare-fun lt!10143 () array!1313)

(declare-fun lt!10148 () (_ BitVec 32))

(declare-fun lt!10152 () List!574)

(assert (=> d!4801 (arrayNoDuplicates!0 lt!10143 lt!10148 lt!10152)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1313 (_ BitVec 32) (_ BitVec 32) List!574) Unit!604)

(assert (=> d!4801 (= lt!10145 (lemmaArrayNoDuplicatesInAll0Array!0 lt!10143 lt!10148 (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001) lt!10152))))

(assert (=> d!4801 (= lt!10152 Nil!571)))

(assert (=> d!4801 (= lt!10148 #b00000000000000000000000000000000)))

(assert (=> d!4801 (= lt!10143 (array!1314 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10150 () Unit!604)

(declare-fun lt!10162 () Unit!604)

(assert (=> d!4801 (= lt!10150 lt!10162)))

(declare-fun lt!10164 () (_ BitVec 32))

(declare-fun lt!10147 () array!1313)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1313 (_ BitVec 32)) Bool)

(assert (=> d!4801 (arrayForallSeekEntryOrOpenFound!0 lt!10164 lt!10147 (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1313 (_ BitVec 32) (_ BitVec 32)) Unit!604)

(assert (=> d!4801 (= lt!10162 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!10147 (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) lt!10164))))

(assert (=> d!4801 (= lt!10164 #b00000000000000000000000000000000)))

(assert (=> d!4801 (= lt!10147 (array!1314 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10144 () Unit!604)

(declare-fun lt!10156 () Unit!604)

(assert (=> d!4801 (= lt!10144 lt!10156)))

(declare-fun lt!10163 () array!1313)

(declare-fun lt!10161 () (_ BitVec 32))

(declare-fun lt!10157 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1313 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!4801 (= (arrayCountValidKeys!0 lt!10163 lt!10161 lt!10157) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1313 (_ BitVec 32) (_ BitVec 32)) Unit!604)

(assert (=> d!4801 (= lt!10156 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!10163 lt!10161 lt!10157))))

(assert (=> d!4801 (= lt!10157 (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!4801 (= lt!10161 #b00000000000000000000000000000000)))

(assert (=> d!4801 (= lt!10163 (array!1314 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4801 (= lt!10146 (LongMapFixedSize!223 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!146 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!146 (defaultEntry!1769 (v!1627 (underlying!122 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1314 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)) (array!1312 ((as const (Array (_ BitVec 32) ValueCell!318)) EmptyCell!318) (bvadd (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!4801 (validMask!0 (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))))))

(assert (=> d!4801 (= (getNewLongMapFixedSize!36 (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) (defaultEntry!1769 (v!1627 (underlying!122 thiss!938)))) lt!10158)))

(declare-fun b!25548 () Bool)

(assert (=> b!25548 (= e!16528 (ite (= (_1!503 lt!10149) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!10153 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!10153 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!4801 c!3579) b!25547))

(assert (= (and d!4801 (not c!3579)) b!25549))

(assert (= (and b!25547 c!3578) b!25550))

(assert (= (and b!25547 (not c!3578)) b!25548))

(assert (= (and d!4801 res!15292) b!25546))

(assert (= (and b!25546 res!15293) b!25545))

(declare-fun b_lambda!1673 () Bool)

(assert (=> (not b_lambda!1673) (not b!25547)))

(assert (=> b!25547 t!3260))

(declare-fun b_and!1575 () Bool)

(assert (= b_and!1573 (and (=> t!3260 result!1117) b_and!1575)))

(declare-fun b_lambda!1675 () Bool)

(assert (=> (not b_lambda!1675) (not d!4801)))

(assert (=> d!4801 t!3260))

(declare-fun b_and!1577 () Bool)

(assert (= b_and!1575 (and (=> t!3260 result!1117) b_and!1577)))

(declare-fun m!20613 () Bool)

(assert (=> b!25545 m!20613))

(declare-fun m!20615 () Bool)

(assert (=> b!25547 m!20615))

(assert (=> b!25547 m!20605))

(assert (=> b!25547 m!20523))

(assert (=> b!25547 m!20605))

(assert (=> b!25547 m!20605))

(declare-fun m!20617 () Bool)

(assert (=> b!25547 m!20617))

(declare-fun m!20619 () Bool)

(assert (=> b!25547 m!20619))

(declare-fun m!20621 () Bool)

(assert (=> b!25547 m!20621))

(declare-fun m!20623 () Bool)

(assert (=> b!25550 m!20623))

(declare-fun m!20625 () Bool)

(assert (=> d!4801 m!20625))

(assert (=> d!4801 m!20605))

(assert (=> d!4801 m!20523))

(declare-fun m!20627 () Bool)

(assert (=> d!4801 m!20627))

(declare-fun m!20629 () Bool)

(assert (=> d!4801 m!20629))

(assert (=> d!4801 m!20523))

(declare-fun m!20631 () Bool)

(assert (=> d!4801 m!20631))

(declare-fun m!20633 () Bool)

(assert (=> d!4801 m!20633))

(assert (=> d!4801 m!20523))

(declare-fun m!20635 () Bool)

(assert (=> d!4801 m!20635))

(assert (=> d!4801 m!20619))

(declare-fun m!20637 () Bool)

(assert (=> d!4801 m!20637))

(declare-fun m!20639 () Bool)

(assert (=> d!4801 m!20639))

(assert (=> b!25436 d!4801))

(declare-fun d!4803 () Bool)

(declare-fun e!16535 () Bool)

(assert (=> d!4803 e!16535))

(declare-fun res!15296 () Bool)

(assert (=> d!4803 (=> (not res!15296) (not e!16535))))

(declare-fun lt!10171 () (_ BitVec 32))

(assert (=> d!4803 (= res!15296 (validMask!0 lt!10171))))

(declare-datatypes ((tuple2!996 0))(
  ( (tuple2!997 (_1!509 Unit!604) (_2!509 (_ BitVec 32))) )
))
(declare-fun e!16534 () tuple2!996)

(assert (=> d!4803 (= lt!10171 (_2!509 e!16534))))

(declare-fun c!3582 () Bool)

(declare-fun lt!10170 () tuple2!996)

(assert (=> d!4803 (= c!3582 (and (bvsgt (_2!509 lt!10170) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!159 (v!1627 (underlying!122 thiss!938)))) (_2!509 lt!10170)) (bvsge (bvadd (bvand (bvashr (_2!509 lt!10170) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!159 (v!1627 (underlying!122 thiss!938))))))))

(declare-fun Unit!610 () Unit!604)

(declare-fun Unit!611 () Unit!604)

(assert (=> d!4803 (= lt!10170 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!159 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))))) (mask!4771 (v!1627 (underlying!122 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!159 (v!1627 (underlying!122 thiss!938)))) (mask!4771 (v!1627 (underlying!122 thiss!938))))) (tuple2!997 Unit!610 (bvand (bvadd (bvshl (mask!4771 (v!1627 (underlying!122 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!997 Unit!611 (mask!4771 (v!1627 (underlying!122 thiss!938))))))))

(assert (=> d!4803 (validMask!0 (mask!4771 (v!1627 (underlying!122 thiss!938))))))

(assert (=> d!4803 (= (computeNewMask!32 thiss!938 (mask!4771 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (_size!159 (v!1627 (underlying!122 thiss!938)))) lt!10171)))

(declare-fun b!25557 () Bool)

(declare-fun computeNewMaskWhile!16 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!996)

(assert (=> b!25557 (= e!16534 (computeNewMaskWhile!16 (_size!159 (v!1627 (underlying!122 thiss!938))) (_vacant!159 (v!1627 (underlying!122 thiss!938))) (mask!4771 (v!1627 (underlying!122 thiss!938))) (_2!509 lt!10170)))))

(declare-fun b!25558 () Bool)

(declare-fun Unit!612 () Unit!604)

(assert (=> b!25558 (= e!16534 (tuple2!997 Unit!612 (_2!509 lt!10170)))))

(declare-fun b!25559 () Bool)

(assert (=> b!25559 (= e!16535 (bvsle (_size!159 (v!1627 (underlying!122 thiss!938))) (bvadd lt!10171 #b00000000000000000000000000000001)))))

(assert (= (and d!4803 c!3582) b!25557))

(assert (= (and d!4803 (not c!3582)) b!25558))

(assert (= (and d!4803 res!15296) b!25559))

(declare-fun m!20641 () Bool)

(assert (=> d!4803 m!20641))

(declare-fun m!20643 () Bool)

(assert (=> d!4803 m!20643))

(declare-fun m!20645 () Bool)

(assert (=> b!25557 m!20645))

(assert (=> b!25436 d!4803))

(declare-fun d!4805 () Bool)

(assert (=> d!4805 (= (valid!109 thiss!938) (valid!111 (v!1627 (underlying!122 thiss!938))))))

(declare-fun bs!1054 () Bool)

(assert (= bs!1054 d!4805))

(declare-fun m!20647 () Bool)

(assert (=> bs!1054 m!20647))

(assert (=> start!3654 d!4805))

(declare-fun d!4807 () Bool)

(assert (=> d!4807 (= (array_inv!417 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) (bvsge (size!721 (_keys!3194 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25426 d!4807))

(declare-fun d!4809 () Bool)

(assert (=> d!4809 (= (array_inv!418 (_values!1753 (v!1627 (underlying!122 thiss!938)))) (bvsge (size!720 (_values!1753 (v!1627 (underlying!122 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25426 d!4809))

(declare-fun d!4811 () Bool)

(assert (=> d!4811 (= (map!413 (_3!9 lt!9966)) (map!415 (v!1627 (underlying!122 (_3!9 lt!9966)))))))

(declare-fun bs!1055 () Bool)

(assert (= bs!1055 d!4811))

(declare-fun m!20649 () Bool)

(assert (=> bs!1055 m!20649))

(assert (=> b!25428 d!4811))

(declare-fun d!4813 () Bool)

(assert (=> d!4813 (= (map!413 thiss!938) (map!415 (v!1627 (underlying!122 thiss!938))))))

(declare-fun bs!1056 () Bool)

(assert (= bs!1056 d!4813))

(assert (=> bs!1056 m!20577))

(assert (=> b!25428 d!4813))

(declare-fun b!25644 () Bool)

(declare-fun e!16589 () Bool)

(declare-fun e!16592 () Bool)

(assert (=> b!25644 (= e!16589 e!16592)))

(declare-fun c!3620 () Bool)

(declare-fun lt!10247 () tuple2!984)

(assert (=> b!25644 (= c!3620 (_1!501 lt!10247))))

(declare-fun b!25645 () Bool)

(declare-fun c!3615 () Bool)

(declare-datatypes ((SeekEntryResult!56 0))(
  ( (MissingZero!56 (index!2346 (_ BitVec 32))) (Found!56 (index!2347 (_ BitVec 32))) (Intermediate!56 (undefined!868 Bool) (index!2348 (_ BitVec 32)) (x!6012 (_ BitVec 32))) (Undefined!56) (MissingVacant!56 (index!2349 (_ BitVec 32))) )
))
(declare-fun lt!10238 () SeekEntryResult!56)

(assert (=> b!25645 (= c!3615 ((_ is MissingVacant!56) lt!10238))))

(declare-fun e!16582 () tuple2!984)

(declare-fun e!16591 () tuple2!984)

(assert (=> b!25645 (= e!16582 e!16591)))

(declare-fun b!25646 () Bool)

(declare-fun e!16585 () Unit!604)

(declare-fun Unit!613 () Unit!604)

(assert (=> b!25646 (= e!16585 Unit!613)))

(declare-fun lt!10226 () Unit!604)

(declare-fun call!2461 () Unit!604)

(assert (=> b!25646 (= lt!10226 call!2461)))

(declare-fun lt!10231 () SeekEntryResult!56)

(declare-fun call!2447 () SeekEntryResult!56)

(assert (=> b!25646 (= lt!10231 call!2447)))

(declare-fun res!15325 () Bool)

(assert (=> b!25646 (= res!15325 ((_ is Found!56) lt!10231))))

(declare-fun e!16595 () Bool)

(assert (=> b!25646 (=> (not res!15325) (not e!16595))))

(assert (=> b!25646 e!16595))

(declare-fun lt!10246 () Unit!604)

(assert (=> b!25646 (= lt!10246 lt!10226)))

(assert (=> b!25646 false))

(declare-fun bm!2439 () Bool)

(declare-fun call!2442 () ListLongMap!571)

(declare-fun call!2456 () ListLongMap!571)

(assert (=> bm!2439 (= call!2442 call!2456)))

(declare-fun bm!2440 () Bool)

(declare-fun call!2460 () Bool)

(declare-fun call!2450 () Bool)

(assert (=> bm!2440 (= call!2460 call!2450)))

(declare-fun bm!2441 () Bool)

(declare-fun call!2464 () Bool)

(assert (=> bm!2441 (= call!2464 call!2450)))

(declare-fun bm!2442 () Bool)

(declare-fun call!2451 () SeekEntryResult!56)

(assert (=> bm!2442 (= call!2447 call!2451)))

(declare-fun bm!2443 () Bool)

(declare-fun call!2452 () Bool)

(assert (=> bm!2443 (= call!2452 call!2460)))

(declare-fun b!25647 () Bool)

(declare-fun lt!10245 () Unit!604)

(declare-fun lt!10228 () Unit!604)

(assert (=> b!25647 (= lt!10245 lt!10228)))

(declare-fun call!2465 () ListLongMap!571)

(assert (=> b!25647 (= call!2442 call!2465)))

(declare-fun lt!10232 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!12 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 V!1205 Int) Unit!604)

(assert (=> b!25647 (= lt!10228 (lemmaChangeZeroKeyThenAddPairToListMap!12 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) lt!10232 (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (_2!501 lt!9969)) (defaultEntry!1769 (_2!501 lt!9969))))))

(assert (=> b!25647 (= lt!10232 (bvor (extraKeys!1661 (_2!501 lt!9969)) #b00000000000000000000000000000001))))

(declare-fun e!16594 () tuple2!984)

(assert (=> b!25647 (= e!16594 (tuple2!985 true (LongMapFixedSize!223 (defaultEntry!1769 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (bvor (extraKeys!1661 (_2!501 lt!9969)) #b00000000000000000000000000000001) (minValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (_2!501 lt!9969)) (_size!159 (_2!501 lt!9969)) (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (_vacant!159 (_2!501 lt!9969)))))))

(declare-fun b!25648 () Bool)

(declare-fun e!16596 () Bool)

(declare-fun call!2459 () Bool)

(assert (=> b!25648 (= e!16596 (not call!2459))))

(declare-fun b!25649 () Bool)

(declare-fun lt!10229 () tuple2!984)

(declare-fun call!2445 () tuple2!984)

(assert (=> b!25649 (= lt!10229 call!2445)))

(declare-fun e!16597 () tuple2!984)

(assert (=> b!25649 (= e!16597 (tuple2!985 (_1!501 lt!10229) (_2!501 lt!10229)))))

(declare-fun b!25650 () Bool)

(declare-fun res!15326 () Bool)

(assert (=> b!25650 (=> (not res!15326) (not e!16596))))

(declare-fun lt!10244 () SeekEntryResult!56)

(assert (=> b!25650 (= res!15326 (= (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2346 lt!10244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25651 () Bool)

(declare-fun c!3613 () Bool)

(assert (=> b!25651 (= c!3613 ((_ is MissingVacant!56) lt!10244))))

(declare-fun e!16600 () Bool)

(declare-fun e!16588 () Bool)

(assert (=> b!25651 (= e!16600 e!16588)))

(declare-fun bm!2444 () Bool)

(declare-fun call!2454 () ListLongMap!571)

(assert (=> bm!2444 (= call!2454 (map!415 (_2!501 lt!10247)))))

(declare-fun b!25652 () Bool)

(declare-fun e!16593 () tuple2!984)

(assert (=> b!25652 (= e!16593 e!16594)))

(declare-fun c!3621 () Bool)

(assert (=> b!25652 (= c!3621 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2445 () Bool)

(declare-fun call!2444 () ListLongMap!571)

(declare-fun call!2448 () ListLongMap!571)

(assert (=> bm!2445 (= call!2444 call!2448)))

(declare-fun b!25653 () Bool)

(assert (=> b!25653 (= e!16588 ((_ is Undefined!56) lt!10244))))

(declare-fun bm!2446 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 64) Int) Unit!604)

(assert (=> bm!2446 (= call!2461 (lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun b!25654 () Bool)

(declare-fun res!15336 () Bool)

(assert (=> b!25654 (=> (not res!15336) (not e!16596))))

(assert (=> b!25654 (= res!15336 call!2452)))

(assert (=> b!25654 (= e!16600 e!16596)))

(declare-fun bm!2447 () Bool)

(declare-fun call!2453 () ListLongMap!571)

(assert (=> bm!2447 (= call!2465 call!2453)))

(declare-fun b!25655 () Bool)

(declare-fun res!15337 () Bool)

(declare-fun e!16601 () Bool)

(assert (=> b!25655 (=> (not res!15337) (not e!16601))))

(declare-fun call!2462 () Bool)

(assert (=> b!25655 (= res!15337 call!2462)))

(declare-fun e!16599 () Bool)

(assert (=> b!25655 (= e!16599 e!16601)))

(declare-fun b!25656 () Bool)

(declare-fun res!15333 () Bool)

(assert (=> b!25656 (= res!15333 call!2464)))

(declare-fun e!16581 () Bool)

(assert (=> b!25656 (=> (not res!15333) (not e!16581))))

(declare-fun b!25657 () Bool)

(assert (=> b!25657 (= e!16593 e!16582)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1313 (_ BitVec 32)) SeekEntryResult!56)

(assert (=> b!25657 (= lt!10238 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3194 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969))))))

(declare-fun c!3622 () Bool)

(assert (=> b!25657 (= c!3622 ((_ is Undefined!56) lt!10238))))

(declare-fun bm!2448 () Bool)

(declare-fun call!2458 () ListLongMap!571)

(assert (=> bm!2448 (= call!2458 (map!415 (_2!501 lt!9969)))))

(declare-fun b!25658 () Bool)

(declare-fun e!16584 () ListLongMap!571)

(declare-fun getCurrentListMap!132 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 32) Int) ListLongMap!571)

(assert (=> b!25658 (= e!16584 (getCurrentListMap!132 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) #b00000000000000000000000000000000 (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun b!25659 () Bool)

(declare-fun e!16587 () ListLongMap!571)

(assert (=> b!25659 (= e!16587 (getCurrentListMap!132 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) #b00000000000000000000000000000000 (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun b!25660 () Bool)

(declare-fun res!15331 () Bool)

(assert (=> b!25660 (= res!15331 call!2460)))

(assert (=> b!25660 (=> (not res!15331) (not e!16595))))

(declare-fun b!25661 () Bool)

(assert (=> b!25661 (= e!16592 (= call!2454 call!2458))))

(declare-fun bm!2449 () Bool)

(declare-fun updateHelperNewKey!12 (LongMapFixedSize!222 (_ BitVec 64) V!1205 (_ BitVec 32)) tuple2!984)

(assert (=> bm!2449 (= call!2445 (updateHelperNewKey!12 (_2!501 lt!9969) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938))) (ite c!3615 (index!2349 lt!10238) (index!2346 lt!10238))))))

(declare-fun b!25662 () Bool)

(declare-fun e!16590 () Unit!604)

(declare-fun lt!10249 () Unit!604)

(assert (=> b!25662 (= e!16590 lt!10249)))

(assert (=> b!25662 (= lt!10249 call!2461)))

(declare-fun lt!10234 () SeekEntryResult!56)

(declare-fun call!2446 () SeekEntryResult!56)

(assert (=> b!25662 (= lt!10234 call!2446)))

(declare-fun res!15335 () Bool)

(assert (=> b!25662 (= res!15335 ((_ is Found!56) lt!10234))))

(assert (=> b!25662 (=> (not res!15335) (not e!16581))))

(assert (=> b!25662 e!16581))

(declare-fun bm!2450 () Bool)

(assert (=> bm!2450 (= call!2451 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3194 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969))))))

(declare-fun b!25663 () Bool)

(assert (=> b!25663 (= e!16591 e!16597)))

(declare-fun c!3619 () Bool)

(assert (=> b!25663 (= c!3619 ((_ is MissingZero!56) lt!10238))))

(declare-fun bm!2451 () Bool)

(declare-fun c!3612 () Bool)

(assert (=> bm!2451 (= call!2456 (+!47 e!16584 (ite c!3612 (ite c!3621 (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (tuple2!987 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938))))) (tuple2!987 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun c!3624 () Bool)

(assert (=> bm!2451 (= c!3624 c!3612)))

(declare-fun b!25664 () Bool)

(declare-fun lt!10227 () tuple2!984)

(assert (=> b!25664 (= e!16591 (tuple2!985 (_1!501 lt!10227) (_2!501 lt!10227)))))

(assert (=> b!25664 (= lt!10227 call!2445)))

(declare-fun bm!2452 () Bool)

(declare-fun lt!10241 () (_ BitVec 32))

(assert (=> bm!2452 (= call!2453 (getCurrentListMap!132 (_keys!3194 (_2!501 lt!9969)) (ite (or c!3612 c!3622) (_values!1753 (_2!501 lt!9969)) (array!1312 (store (arr!619 (_values!1753 (_2!501 lt!9969))) (index!2347 lt!10238) (ValueCellFull!318 (minValue!1688 (v!1627 (underlying!122 thiss!938))))) (size!720 (_values!1753 (_2!501 lt!9969))))) (mask!4771 (_2!501 lt!9969)) (ite c!3612 (ite c!3621 lt!10232 lt!10241) (extraKeys!1661 (_2!501 lt!9969))) (ite (and c!3612 c!3621) (minValue!1688 (v!1627 (underlying!122 thiss!938))) (zeroValue!1688 (_2!501 lt!9969))) (ite c!3612 (ite c!3621 (minValue!1688 (_2!501 lt!9969)) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (minValue!1688 (_2!501 lt!9969))) #b00000000000000000000000000000000 (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun b!25665 () Bool)

(declare-fun call!2455 () ListLongMap!571)

(assert (=> b!25665 (= e!16587 call!2455)))

(declare-fun bm!2453 () Bool)

(assert (=> bm!2453 (= call!2462 call!2464)))

(declare-fun b!25666 () Bool)

(declare-fun e!16580 () Bool)

(declare-fun lt!10242 () SeekEntryResult!56)

(assert (=> b!25666 (= e!16580 ((_ is Undefined!56) lt!10242))))

(declare-fun b!25667 () Bool)

(assert (=> b!25667 (= e!16595 (= (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2347 lt!10231)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2454 () Bool)

(declare-fun c!3616 () Bool)

(assert (=> bm!2454 (= c!3616 c!3622)))

(declare-fun call!2463 () Bool)

(assert (=> bm!2454 (= call!2463 (contains!234 e!16587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25668 () Bool)

(assert (=> b!25668 (= e!16581 (= (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2347 lt!10234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25669 () Bool)

(declare-fun lt!10237 () Unit!604)

(declare-fun lt!10251 () Unit!604)

(assert (=> b!25669 (= lt!10237 lt!10251)))

(assert (=> b!25669 (= call!2442 call!2465)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 V!1205 Int) Unit!604)

(assert (=> b!25669 (= lt!10251 (lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) lt!10241 (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) (minValue!1688 (v!1627 (underlying!122 thiss!938))) (defaultEntry!1769 (_2!501 lt!9969))))))

(assert (=> b!25669 (= lt!10241 (bvor (extraKeys!1661 (_2!501 lt!9969)) #b00000000000000000000000000000010))))

(assert (=> b!25669 (= e!16594 (tuple2!985 true (LongMapFixedSize!223 (defaultEntry!1769 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (bvor (extraKeys!1661 (_2!501 lt!9969)) #b00000000000000000000000000000010) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (v!1627 (underlying!122 thiss!938))) (_size!159 (_2!501 lt!9969)) (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (_vacant!159 (_2!501 lt!9969)))))))

(declare-fun bm!2455 () Bool)

(assert (=> bm!2455 (= call!2455 call!2453)))

(declare-fun bm!2456 () Bool)

(declare-fun call!2449 () Unit!604)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 64) Int) Unit!604)

(assert (=> bm!2456 (= call!2449 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun b!25670 () Bool)

(declare-fun lt!10248 () Unit!604)

(assert (=> b!25670 (= lt!10248 e!16585)))

(declare-fun c!3614 () Bool)

(assert (=> b!25670 (= c!3614 call!2463)))

(assert (=> b!25670 (= e!16582 (tuple2!985 false (_2!501 lt!9969)))))

(declare-fun bm!2457 () Bool)

(declare-fun call!2443 () Bool)

(assert (=> bm!2457 (= call!2443 (arrayContainsKey!0 (_keys!3194 (_2!501 lt!9969)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun lt!10243 () array!1311)

(declare-fun bm!2458 () Bool)

(assert (=> bm!2458 (= call!2448 (getCurrentListMap!132 (_keys!3194 (_2!501 lt!9969)) (ite c!3612 (_values!1753 (_2!501 lt!9969)) lt!10243) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) #b00000000000000000000000000000000 (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun b!25671 () Bool)

(declare-fun e!16586 () Bool)

(assert (=> b!25671 (= e!16588 e!16586)))

(declare-fun res!15332 () Bool)

(assert (=> b!25671 (= res!15332 call!2452)))

(assert (=> b!25671 (=> (not res!15332) (not e!16586))))

(declare-fun b!25672 () Bool)

(assert (=> b!25672 (= e!16584 call!2444)))

(declare-fun b!25673 () Bool)

(declare-fun e!16598 () Bool)

(declare-fun call!2457 () Bool)

(assert (=> b!25673 (= e!16598 (not call!2457))))

(declare-fun bm!2459 () Bool)

(assert (=> bm!2459 (= call!2457 call!2443)))

(declare-fun bm!2460 () Bool)

(assert (=> bm!2460 (= call!2446 call!2451)))

(declare-fun b!25674 () Bool)

(declare-fun Unit!614 () Unit!604)

(assert (=> b!25674 (= e!16590 Unit!614)))

(declare-fun lt!10235 () Unit!604)

(assert (=> b!25674 (= lt!10235 call!2449)))

(assert (=> b!25674 (= lt!10242 call!2446)))

(declare-fun c!3618 () Bool)

(assert (=> b!25674 (= c!3618 ((_ is MissingZero!56) lt!10242))))

(assert (=> b!25674 e!16599))

(declare-fun lt!10252 () Unit!604)

(assert (=> b!25674 (= lt!10252 lt!10235)))

(assert (=> b!25674 false))

(declare-fun b!25675 () Bool)

(declare-fun res!15334 () Bool)

(assert (=> b!25675 (= res!15334 (= (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2349 lt!10244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25675 (=> (not res!15334) (not e!16586))))

(declare-fun b!25676 () Bool)

(assert (=> b!25676 (= e!16586 (not call!2459))))

(declare-fun d!4815 () Bool)

(assert (=> d!4815 e!16589))

(declare-fun res!15338 () Bool)

(assert (=> d!4815 (=> (not res!15338) (not e!16589))))

(assert (=> d!4815 (= res!15338 (valid!111 (_2!501 lt!10247)))))

(assert (=> d!4815 (= lt!10247 e!16593)))

(assert (=> d!4815 (= c!3612 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4815 (valid!111 (_2!501 lt!9969))))

(assert (=> d!4815 (= (update!35 (_2!501 lt!9969) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938)))) lt!10247)))

(declare-fun b!25677 () Bool)

(assert (=> b!25677 (= e!16601 (not call!2457))))

(declare-fun b!25678 () Bool)

(declare-fun c!3623 () Bool)

(assert (=> b!25678 (= c!3623 ((_ is MissingVacant!56) lt!10242))))

(assert (=> b!25678 (= e!16599 e!16580)))

(declare-fun b!25679 () Bool)

(declare-fun res!15328 () Bool)

(assert (=> b!25679 (= res!15328 (= (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2349 lt!10242)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25679 (=> (not res!15328) (not e!16598))))

(declare-fun e!16583 () Bool)

(declare-fun b!25680 () Bool)

(assert (=> b!25680 (= e!16583 (= call!2454 (+!47 call!2458 (tuple2!987 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938)))))))))

(declare-fun bm!2461 () Bool)

(assert (=> bm!2461 (= call!2459 call!2443)))

(declare-fun bm!2462 () Bool)

(declare-fun c!3611 () Bool)

(declare-fun c!3617 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2462 (= call!2450 (inRange!0 (ite c!3622 (ite c!3614 (index!2347 lt!10231) (ite c!3611 (index!2346 lt!10244) (index!2349 lt!10244))) (ite c!3617 (index!2347 lt!10234) (ite c!3618 (index!2346 lt!10242) (index!2349 lt!10242)))) (mask!4771 (_2!501 lt!9969))))))

(declare-fun b!25681 () Bool)

(declare-fun lt!10236 () Unit!604)

(declare-fun lt!10250 () Unit!604)

(assert (=> b!25681 (= lt!10236 lt!10250)))

(assert (=> b!25681 (contains!234 call!2448 (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2347 lt!10238)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!12 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 32) Int) Unit!604)

(assert (=> b!25681 (= lt!10250 (lemmaValidKeyInArrayIsInListMap!12 (_keys!3194 (_2!501 lt!9969)) lt!10243 (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) (index!2347 lt!10238) (defaultEntry!1769 (_2!501 lt!9969))))))

(assert (=> b!25681 (= lt!10243 (array!1312 (store (arr!619 (_values!1753 (_2!501 lt!9969))) (index!2347 lt!10238) (ValueCellFull!318 (minValue!1688 (v!1627 (underlying!122 thiss!938))))) (size!720 (_values!1753 (_2!501 lt!9969)))))))

(declare-fun lt!10233 () Unit!604)

(declare-fun lt!10240 () Unit!604)

(assert (=> b!25681 (= lt!10233 lt!10240)))

(assert (=> b!25681 (= call!2456 call!2455)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (array!1313 array!1311 (_ BitVec 32) (_ BitVec 32) V!1205 V!1205 (_ BitVec 32) (_ BitVec 64) V!1205 Int) Unit!604)

(assert (=> b!25681 (= lt!10240 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (_keys!3194 (_2!501 lt!9969)) (_values!1753 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) (index!2347 lt!10238) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1688 (v!1627 (underlying!122 thiss!938))) (defaultEntry!1769 (_2!501 lt!9969))))))

(declare-fun lt!10239 () Unit!604)

(assert (=> b!25681 (= lt!10239 e!16590)))

(assert (=> b!25681 (= c!3617 call!2463)))

(assert (=> b!25681 (= e!16597 (tuple2!985 true (LongMapFixedSize!223 (defaultEntry!1769 (_2!501 lt!9969)) (mask!4771 (_2!501 lt!9969)) (extraKeys!1661 (_2!501 lt!9969)) (zeroValue!1688 (_2!501 lt!9969)) (minValue!1688 (_2!501 lt!9969)) (_size!159 (_2!501 lt!9969)) (_keys!3194 (_2!501 lt!9969)) (array!1312 (store (arr!619 (_values!1753 (_2!501 lt!9969))) (index!2347 lt!10238) (ValueCellFull!318 (minValue!1688 (v!1627 (underlying!122 thiss!938))))) (size!720 (_values!1753 (_2!501 lt!9969)))) (_vacant!159 (_2!501 lt!9969)))))))

(declare-fun b!25682 () Bool)

(declare-fun lt!10230 () Unit!604)

(assert (=> b!25682 (= e!16585 lt!10230)))

(assert (=> b!25682 (= lt!10230 call!2449)))

(assert (=> b!25682 (= lt!10244 call!2447)))

(assert (=> b!25682 (= c!3611 ((_ is MissingZero!56) lt!10244))))

(assert (=> b!25682 e!16600))

(declare-fun b!25683 () Bool)

(assert (=> b!25683 (= e!16592 e!16583)))

(declare-fun res!15330 () Bool)

(assert (=> b!25683 (= res!15330 (contains!234 call!2454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25683 (=> (not res!15330) (not e!16583))))

(declare-fun b!25684 () Bool)

(declare-fun res!15327 () Bool)

(assert (=> b!25684 (=> (not res!15327) (not e!16601))))

(assert (=> b!25684 (= res!15327 (= (select (arr!620 (_keys!3194 (_2!501 lt!9969))) (index!2346 lt!10242)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25685 () Bool)

(assert (=> b!25685 (= e!16580 e!16598)))

(declare-fun res!15329 () Bool)

(assert (=> b!25685 (= res!15329 call!2462)))

(assert (=> b!25685 (=> (not res!15329) (not e!16598))))

(assert (= (and d!4815 c!3612) b!25652))

(assert (= (and d!4815 (not c!3612)) b!25657))

(assert (= (and b!25652 c!3621) b!25647))

(assert (= (and b!25652 (not c!3621)) b!25669))

(assert (= (or b!25647 b!25669) bm!2447))

(assert (= (or b!25647 b!25669) bm!2445))

(assert (= (or b!25647 b!25669) bm!2439))

(assert (= (and b!25657 c!3622) b!25670))

(assert (= (and b!25657 (not c!3622)) b!25645))

(assert (= (and b!25670 c!3614) b!25646))

(assert (= (and b!25670 (not c!3614)) b!25682))

(assert (= (and b!25646 res!15325) b!25660))

(assert (= (and b!25660 res!15331) b!25667))

(assert (= (and b!25682 c!3611) b!25654))

(assert (= (and b!25682 (not c!3611)) b!25651))

(assert (= (and b!25654 res!15336) b!25650))

(assert (= (and b!25650 res!15326) b!25648))

(assert (= (and b!25651 c!3613) b!25671))

(assert (= (and b!25651 (not c!3613)) b!25653))

(assert (= (and b!25671 res!15332) b!25675))

(assert (= (and b!25675 res!15334) b!25676))

(assert (= (or b!25654 b!25671) bm!2443))

(assert (= (or b!25648 b!25676) bm!2461))

(assert (= (or b!25660 bm!2443) bm!2440))

(assert (= (or b!25646 b!25682) bm!2442))

(assert (= (and b!25645 c!3615) b!25664))

(assert (= (and b!25645 (not c!3615)) b!25663))

(assert (= (and b!25663 c!3619) b!25649))

(assert (= (and b!25663 (not c!3619)) b!25681))

(assert (= (and b!25681 c!3617) b!25662))

(assert (= (and b!25681 (not c!3617)) b!25674))

(assert (= (and b!25662 res!15335) b!25656))

(assert (= (and b!25656 res!15333) b!25668))

(assert (= (and b!25674 c!3618) b!25655))

(assert (= (and b!25674 (not c!3618)) b!25678))

(assert (= (and b!25655 res!15337) b!25684))

(assert (= (and b!25684 res!15327) b!25677))

(assert (= (and b!25678 c!3623) b!25685))

(assert (= (and b!25678 (not c!3623)) b!25666))

(assert (= (and b!25685 res!15329) b!25679))

(assert (= (and b!25679 res!15328) b!25673))

(assert (= (or b!25655 b!25685) bm!2453))

(assert (= (or b!25677 b!25673) bm!2459))

(assert (= (or b!25656 bm!2453) bm!2441))

(assert (= (or b!25662 b!25674) bm!2460))

(assert (= (or b!25664 b!25649) bm!2449))

(assert (= (or bm!2461 bm!2459) bm!2457))

(assert (= (or bm!2440 bm!2441) bm!2462))

(assert (= (or b!25682 b!25674) bm!2456))

(assert (= (or b!25670 b!25681) bm!2455))

(assert (= (or bm!2442 bm!2460) bm!2450))

(assert (= (or b!25646 b!25662) bm!2446))

(assert (= (or b!25670 b!25681) bm!2454))

(assert (= (and bm!2454 c!3616) b!25665))

(assert (= (and bm!2454 (not c!3616)) b!25659))

(assert (= (or bm!2447 bm!2455) bm!2452))

(assert (= (or bm!2445 b!25681) bm!2458))

(assert (= (or bm!2439 b!25681) bm!2451))

(assert (= (and bm!2451 c!3624) b!25672))

(assert (= (and bm!2451 (not c!3624)) b!25658))

(assert (= (and d!4815 res!15338) b!25644))

(assert (= (and b!25644 c!3620) b!25683))

(assert (= (and b!25644 (not c!3620)) b!25661))

(assert (= (and b!25683 res!15330) b!25680))

(assert (= (or b!25683 b!25680 b!25661) bm!2444))

(assert (= (or b!25680 b!25661) bm!2448))

(declare-fun m!20651 () Bool)

(assert (=> bm!2458 m!20651))

(declare-fun m!20653 () Bool)

(assert (=> b!25647 m!20653))

(declare-fun m!20655 () Bool)

(assert (=> b!25680 m!20655))

(declare-fun m!20657 () Bool)

(assert (=> bm!2444 m!20657))

(declare-fun m!20659 () Bool)

(assert (=> bm!2446 m!20659))

(declare-fun m!20661 () Bool)

(assert (=> d!4815 m!20661))

(declare-fun m!20663 () Bool)

(assert (=> d!4815 m!20663))

(declare-fun m!20665 () Bool)

(assert (=> bm!2452 m!20665))

(declare-fun m!20667 () Bool)

(assert (=> bm!2452 m!20667))

(declare-fun m!20669 () Bool)

(assert (=> bm!2448 m!20669))

(declare-fun m!20671 () Bool)

(assert (=> b!25675 m!20671))

(declare-fun m!20673 () Bool)

(assert (=> b!25681 m!20673))

(declare-fun m!20675 () Bool)

(assert (=> b!25681 m!20675))

(declare-fun m!20677 () Bool)

(assert (=> b!25681 m!20677))

(assert (=> b!25681 m!20677))

(declare-fun m!20679 () Bool)

(assert (=> b!25681 m!20679))

(assert (=> b!25681 m!20665))

(declare-fun m!20681 () Bool)

(assert (=> b!25657 m!20681))

(declare-fun m!20683 () Bool)

(assert (=> b!25679 m!20683))

(declare-fun m!20685 () Bool)

(assert (=> b!25683 m!20685))

(declare-fun m!20687 () Bool)

(assert (=> bm!2454 m!20687))

(declare-fun m!20689 () Bool)

(assert (=> b!25650 m!20689))

(declare-fun m!20691 () Bool)

(assert (=> b!25684 m!20691))

(declare-fun m!20693 () Bool)

(assert (=> bm!2462 m!20693))

(declare-fun m!20695 () Bool)

(assert (=> b!25667 m!20695))

(declare-fun m!20697 () Bool)

(assert (=> b!25658 m!20697))

(declare-fun m!20699 () Bool)

(assert (=> bm!2451 m!20699))

(assert (=> b!25659 m!20697))

(declare-fun m!20701 () Bool)

(assert (=> bm!2456 m!20701))

(declare-fun m!20703 () Bool)

(assert (=> bm!2449 m!20703))

(declare-fun m!20705 () Bool)

(assert (=> b!25668 m!20705))

(declare-fun m!20707 () Bool)

(assert (=> b!25669 m!20707))

(declare-fun m!20709 () Bool)

(assert (=> bm!2457 m!20709))

(assert (=> bm!2450 m!20681))

(assert (=> b!25433 d!4815))

(declare-fun b!25686 () Bool)

(declare-fun e!16611 () Bool)

(declare-fun e!16614 () Bool)

(assert (=> b!25686 (= e!16611 e!16614)))

(declare-fun c!3634 () Bool)

(declare-fun lt!10274 () tuple2!984)

(assert (=> b!25686 (= c!3634 (_1!501 lt!10274))))

(declare-fun b!25687 () Bool)

(declare-fun c!3629 () Bool)

(declare-fun lt!10265 () SeekEntryResult!56)

(assert (=> b!25687 (= c!3629 ((_ is MissingVacant!56) lt!10265))))

(declare-fun e!16604 () tuple2!984)

(declare-fun e!16613 () tuple2!984)

(assert (=> b!25687 (= e!16604 e!16613)))

(declare-fun b!25688 () Bool)

(declare-fun e!16607 () Unit!604)

(declare-fun Unit!615 () Unit!604)

(assert (=> b!25688 (= e!16607 Unit!615)))

(declare-fun lt!10253 () Unit!604)

(declare-fun call!2485 () Unit!604)

(assert (=> b!25688 (= lt!10253 call!2485)))

(declare-fun lt!10258 () SeekEntryResult!56)

(declare-fun call!2471 () SeekEntryResult!56)

(assert (=> b!25688 (= lt!10258 call!2471)))

(declare-fun res!15339 () Bool)

(assert (=> b!25688 (= res!15339 ((_ is Found!56) lt!10258))))

(declare-fun e!16617 () Bool)

(assert (=> b!25688 (=> (not res!15339) (not e!16617))))

(assert (=> b!25688 e!16617))

(declare-fun lt!10273 () Unit!604)

(assert (=> b!25688 (= lt!10273 lt!10253)))

(assert (=> b!25688 false))

(declare-fun bm!2463 () Bool)

(declare-fun call!2466 () ListLongMap!571)

(declare-fun call!2480 () ListLongMap!571)

(assert (=> bm!2463 (= call!2466 call!2480)))

(declare-fun bm!2464 () Bool)

(declare-fun call!2484 () Bool)

(declare-fun call!2474 () Bool)

(assert (=> bm!2464 (= call!2484 call!2474)))

(declare-fun bm!2465 () Bool)

(declare-fun call!2488 () Bool)

(assert (=> bm!2465 (= call!2488 call!2474)))

(declare-fun bm!2466 () Bool)

(declare-fun call!2475 () SeekEntryResult!56)

(assert (=> bm!2466 (= call!2471 call!2475)))

(declare-fun bm!2467 () Bool)

(declare-fun call!2476 () Bool)

(assert (=> bm!2467 (= call!2476 call!2484)))

(declare-fun b!25689 () Bool)

(declare-fun lt!10272 () Unit!604)

(declare-fun lt!10255 () Unit!604)

(assert (=> b!25689 (= lt!10272 lt!10255)))

(declare-fun call!2489 () ListLongMap!571)

(assert (=> b!25689 (= call!2466 call!2489)))

(declare-fun lt!10259 () (_ BitVec 32))

(assert (=> b!25689 (= lt!10255 (lemmaChangeZeroKeyThenAddPairToListMap!12 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) lt!10259 (zeroValue!1688 lt!9964) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (minValue!1688 lt!9964) (defaultEntry!1769 lt!9964)))))

(assert (=> b!25689 (= lt!10259 (bvor (extraKeys!1661 lt!9964) #b00000000000000000000000000000001))))

(declare-fun e!16616 () tuple2!984)

(assert (=> b!25689 (= e!16616 (tuple2!985 true (LongMapFixedSize!223 (defaultEntry!1769 lt!9964) (mask!4771 lt!9964) (bvor (extraKeys!1661 lt!9964) #b00000000000000000000000000000001) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (minValue!1688 lt!9964) (_size!159 lt!9964) (_keys!3194 lt!9964) (_values!1753 lt!9964) (_vacant!159 lt!9964))))))

(declare-fun b!25690 () Bool)

(declare-fun e!16618 () Bool)

(declare-fun call!2483 () Bool)

(assert (=> b!25690 (= e!16618 (not call!2483))))

(declare-fun b!25691 () Bool)

(declare-fun lt!10256 () tuple2!984)

(declare-fun call!2469 () tuple2!984)

(assert (=> b!25691 (= lt!10256 call!2469)))

(declare-fun e!16619 () tuple2!984)

(assert (=> b!25691 (= e!16619 (tuple2!985 (_1!501 lt!10256) (_2!501 lt!10256)))))

(declare-fun b!25692 () Bool)

(declare-fun res!15340 () Bool)

(assert (=> b!25692 (=> (not res!15340) (not e!16618))))

(declare-fun lt!10271 () SeekEntryResult!56)

(assert (=> b!25692 (= res!15340 (= (select (arr!620 (_keys!3194 lt!9964)) (index!2346 lt!10271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25693 () Bool)

(declare-fun c!3627 () Bool)

(assert (=> b!25693 (= c!3627 ((_ is MissingVacant!56) lt!10271))))

(declare-fun e!16622 () Bool)

(declare-fun e!16610 () Bool)

(assert (=> b!25693 (= e!16622 e!16610)))

(declare-fun bm!2468 () Bool)

(declare-fun call!2478 () ListLongMap!571)

(assert (=> bm!2468 (= call!2478 (map!415 (_2!501 lt!10274)))))

(declare-fun b!25694 () Bool)

(declare-fun e!16615 () tuple2!984)

(assert (=> b!25694 (= e!16615 e!16616)))

(declare-fun c!3635 () Bool)

(assert (=> b!25694 (= c!3635 (= (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2469 () Bool)

(declare-fun call!2468 () ListLongMap!571)

(declare-fun call!2472 () ListLongMap!571)

(assert (=> bm!2469 (= call!2468 call!2472)))

(declare-fun b!25695 () Bool)

(assert (=> b!25695 (= e!16610 ((_ is Undefined!56) lt!10271))))

(declare-fun bm!2470 () Bool)

(assert (=> bm!2470 (= call!2485 (lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1769 lt!9964)))))

(declare-fun b!25696 () Bool)

(declare-fun res!15350 () Bool)

(assert (=> b!25696 (=> (not res!15350) (not e!16618))))

(assert (=> b!25696 (= res!15350 call!2476)))

(assert (=> b!25696 (= e!16622 e!16618)))

(declare-fun bm!2471 () Bool)

(declare-fun call!2477 () ListLongMap!571)

(assert (=> bm!2471 (= call!2489 call!2477)))

(declare-fun b!25697 () Bool)

(declare-fun res!15351 () Bool)

(declare-fun e!16623 () Bool)

(assert (=> b!25697 (=> (not res!15351) (not e!16623))))

(declare-fun call!2486 () Bool)

(assert (=> b!25697 (= res!15351 call!2486)))

(declare-fun e!16621 () Bool)

(assert (=> b!25697 (= e!16621 e!16623)))

(declare-fun b!25698 () Bool)

(declare-fun res!15347 () Bool)

(assert (=> b!25698 (= res!15347 call!2488)))

(declare-fun e!16603 () Bool)

(assert (=> b!25698 (=> (not res!15347) (not e!16603))))

(declare-fun b!25699 () Bool)

(assert (=> b!25699 (= e!16615 e!16604)))

(assert (=> b!25699 (= lt!10265 (seekEntryOrOpen!0 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3194 lt!9964) (mask!4771 lt!9964)))))

(declare-fun c!3636 () Bool)

(assert (=> b!25699 (= c!3636 ((_ is Undefined!56) lt!10265))))

(declare-fun bm!2472 () Bool)

(declare-fun call!2482 () ListLongMap!571)

(assert (=> bm!2472 (= call!2482 (map!415 lt!9964))))

(declare-fun b!25700 () Bool)

(declare-fun e!16606 () ListLongMap!571)

(assert (=> b!25700 (= e!16606 (getCurrentListMap!132 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) #b00000000000000000000000000000000 (defaultEntry!1769 lt!9964)))))

(declare-fun b!25701 () Bool)

(declare-fun e!16609 () ListLongMap!571)

(assert (=> b!25701 (= e!16609 (getCurrentListMap!132 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) #b00000000000000000000000000000000 (defaultEntry!1769 lt!9964)))))

(declare-fun b!25702 () Bool)

(declare-fun res!15345 () Bool)

(assert (=> b!25702 (= res!15345 call!2484)))

(assert (=> b!25702 (=> (not res!15345) (not e!16617))))

(declare-fun b!25703 () Bool)

(assert (=> b!25703 (= e!16614 (= call!2478 call!2482))))

(declare-fun bm!2473 () Bool)

(assert (=> bm!2473 (= call!2469 (updateHelperNewKey!12 lt!9964 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (ite c!3629 (index!2349 lt!10265) (index!2346 lt!10265))))))

(declare-fun b!25704 () Bool)

(declare-fun e!16612 () Unit!604)

(declare-fun lt!10276 () Unit!604)

(assert (=> b!25704 (= e!16612 lt!10276)))

(assert (=> b!25704 (= lt!10276 call!2485)))

(declare-fun lt!10261 () SeekEntryResult!56)

(declare-fun call!2470 () SeekEntryResult!56)

(assert (=> b!25704 (= lt!10261 call!2470)))

(declare-fun res!15349 () Bool)

(assert (=> b!25704 (= res!15349 ((_ is Found!56) lt!10261))))

(assert (=> b!25704 (=> (not res!15349) (not e!16603))))

(assert (=> b!25704 e!16603))

(declare-fun bm!2474 () Bool)

(assert (=> bm!2474 (= call!2475 (seekEntryOrOpen!0 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3194 lt!9964) (mask!4771 lt!9964)))))

(declare-fun b!25705 () Bool)

(assert (=> b!25705 (= e!16613 e!16619)))

(declare-fun c!3633 () Bool)

(assert (=> b!25705 (= c!3633 ((_ is MissingZero!56) lt!10265))))

(declare-fun bm!2475 () Bool)

(declare-fun c!3626 () Bool)

(assert (=> bm!2475 (= call!2480 (+!47 e!16606 (ite c!3626 (ite c!3635 (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))))) (tuple2!987 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))))) (tuple2!987 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))))))))))

(declare-fun c!3638 () Bool)

(assert (=> bm!2475 (= c!3638 c!3626)))

(declare-fun b!25706 () Bool)

(declare-fun lt!10254 () tuple2!984)

(assert (=> b!25706 (= e!16613 (tuple2!985 (_1!501 lt!10254) (_2!501 lt!10254)))))

(assert (=> b!25706 (= lt!10254 call!2469)))

(declare-fun bm!2476 () Bool)

(declare-fun lt!10268 () (_ BitVec 32))

(assert (=> bm!2476 (= call!2477 (getCurrentListMap!132 (_keys!3194 lt!9964) (ite (or c!3626 c!3636) (_values!1753 lt!9964) (array!1312 (store (arr!619 (_values!1753 lt!9964)) (index!2347 lt!10265) (ValueCellFull!318 (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))))) (size!720 (_values!1753 lt!9964)))) (mask!4771 lt!9964) (ite c!3626 (ite c!3635 lt!10259 lt!10268) (extraKeys!1661 lt!9964)) (ite (and c!3626 c!3635) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (zeroValue!1688 lt!9964)) (ite c!3626 (ite c!3635 (minValue!1688 lt!9964) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))))) (minValue!1688 lt!9964)) #b00000000000000000000000000000000 (defaultEntry!1769 lt!9964)))))

(declare-fun b!25707 () Bool)

(declare-fun call!2479 () ListLongMap!571)

(assert (=> b!25707 (= e!16609 call!2479)))

(declare-fun bm!2477 () Bool)

(assert (=> bm!2477 (= call!2486 call!2488)))

(declare-fun b!25708 () Bool)

(declare-fun e!16602 () Bool)

(declare-fun lt!10269 () SeekEntryResult!56)

(assert (=> b!25708 (= e!16602 ((_ is Undefined!56) lt!10269))))

(declare-fun b!25709 () Bool)

(assert (=> b!25709 (= e!16617 (= (select (arr!620 (_keys!3194 lt!9964)) (index!2347 lt!10258)) (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!2478 () Bool)

(declare-fun c!3630 () Bool)

(assert (=> bm!2478 (= c!3630 c!3636)))

(declare-fun call!2487 () Bool)

(assert (=> bm!2478 (= call!2487 (contains!234 e!16609 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!25710 () Bool)

(assert (=> b!25710 (= e!16603 (= (select (arr!620 (_keys!3194 lt!9964)) (index!2347 lt!10261)) (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!25711 () Bool)

(declare-fun lt!10264 () Unit!604)

(declare-fun lt!10278 () Unit!604)

(assert (=> b!25711 (= lt!10264 lt!10278)))

(assert (=> b!25711 (= call!2466 call!2489)))

(assert (=> b!25711 (= lt!10278 (lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) lt!10268 (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (defaultEntry!1769 lt!9964)))))

(assert (=> b!25711 (= lt!10268 (bvor (extraKeys!1661 lt!9964) #b00000000000000000000000000000010))))

(assert (=> b!25711 (= e!16616 (tuple2!985 true (LongMapFixedSize!223 (defaultEntry!1769 lt!9964) (mask!4771 lt!9964) (bvor (extraKeys!1661 lt!9964) #b00000000000000000000000000000010) (zeroValue!1688 lt!9964) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (_size!159 lt!9964) (_keys!3194 lt!9964) (_values!1753 lt!9964) (_vacant!159 lt!9964))))))

(declare-fun bm!2479 () Bool)

(assert (=> bm!2479 (= call!2479 call!2477)))

(declare-fun call!2473 () Unit!604)

(declare-fun bm!2480 () Bool)

(assert (=> bm!2480 (= call!2473 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1769 lt!9964)))))

(declare-fun b!25712 () Bool)

(declare-fun lt!10275 () Unit!604)

(assert (=> b!25712 (= lt!10275 e!16607)))

(declare-fun c!3628 () Bool)

(assert (=> b!25712 (= c!3628 call!2487)))

(assert (=> b!25712 (= e!16604 (tuple2!985 false lt!9964))))

(declare-fun bm!2481 () Bool)

(declare-fun call!2467 () Bool)

(assert (=> bm!2481 (= call!2467 (arrayContainsKey!0 (_keys!3194 lt!9964) (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun lt!10270 () array!1311)

(declare-fun bm!2482 () Bool)

(assert (=> bm!2482 (= call!2472 (getCurrentListMap!132 (_keys!3194 lt!9964) (ite c!3626 (_values!1753 lt!9964) lt!10270) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) #b00000000000000000000000000000000 (defaultEntry!1769 lt!9964)))))

(declare-fun b!25713 () Bool)

(declare-fun e!16608 () Bool)

(assert (=> b!25713 (= e!16610 e!16608)))

(declare-fun res!15346 () Bool)

(assert (=> b!25713 (= res!15346 call!2476)))

(assert (=> b!25713 (=> (not res!15346) (not e!16608))))

(declare-fun b!25714 () Bool)

(assert (=> b!25714 (= e!16606 call!2468)))

(declare-fun b!25715 () Bool)

(declare-fun e!16620 () Bool)

(declare-fun call!2481 () Bool)

(assert (=> b!25715 (= e!16620 (not call!2481))))

(declare-fun bm!2483 () Bool)

(assert (=> bm!2483 (= call!2481 call!2467)))

(declare-fun bm!2484 () Bool)

(assert (=> bm!2484 (= call!2470 call!2475)))

(declare-fun b!25716 () Bool)

(declare-fun Unit!616 () Unit!604)

(assert (=> b!25716 (= e!16612 Unit!616)))

(declare-fun lt!10262 () Unit!604)

(assert (=> b!25716 (= lt!10262 call!2473)))

(assert (=> b!25716 (= lt!10269 call!2470)))

(declare-fun c!3632 () Bool)

(assert (=> b!25716 (= c!3632 ((_ is MissingZero!56) lt!10269))))

(assert (=> b!25716 e!16621))

(declare-fun lt!10279 () Unit!604)

(assert (=> b!25716 (= lt!10279 lt!10262)))

(assert (=> b!25716 false))

(declare-fun b!25717 () Bool)

(declare-fun res!15348 () Bool)

(assert (=> b!25717 (= res!15348 (= (select (arr!620 (_keys!3194 lt!9964)) (index!2349 lt!10271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25717 (=> (not res!15348) (not e!16608))))

(declare-fun b!25718 () Bool)

(assert (=> b!25718 (= e!16608 (not call!2483))))

(declare-fun d!4817 () Bool)

(assert (=> d!4817 e!16611))

(declare-fun res!15352 () Bool)

(assert (=> d!4817 (=> (not res!15352) (not e!16611))))

(assert (=> d!4817 (= res!15352 (valid!111 (_2!501 lt!10274)))))

(assert (=> d!4817 (= lt!10274 e!16615)))

(assert (=> d!4817 (= c!3626 (= (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!4817 (valid!111 lt!9964)))

(assert (=> d!4817 (= (update!35 lt!9964 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))))) lt!10274)))

(declare-fun b!25719 () Bool)

(assert (=> b!25719 (= e!16623 (not call!2481))))

(declare-fun b!25720 () Bool)

(declare-fun c!3637 () Bool)

(assert (=> b!25720 (= c!3637 ((_ is MissingVacant!56) lt!10269))))

(assert (=> b!25720 (= e!16621 e!16602)))

(declare-fun b!25721 () Bool)

(declare-fun res!15342 () Bool)

(assert (=> b!25721 (= res!15342 (= (select (arr!620 (_keys!3194 lt!9964)) (index!2349 lt!10269)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25721 (=> (not res!15342) (not e!16620))))

(declare-fun b!25722 () Bool)

(declare-fun e!16605 () Bool)

(assert (=> b!25722 (= e!16605 (= call!2478 (+!47 call!2482 (tuple2!987 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938))))))))))

(declare-fun bm!2485 () Bool)

(assert (=> bm!2485 (= call!2483 call!2467)))

(declare-fun bm!2486 () Bool)

(declare-fun c!3625 () Bool)

(declare-fun c!3631 () Bool)

(assert (=> bm!2486 (= call!2474 (inRange!0 (ite c!3636 (ite c!3628 (index!2347 lt!10258) (ite c!3625 (index!2346 lt!10271) (index!2349 lt!10271))) (ite c!3631 (index!2347 lt!10261) (ite c!3632 (index!2346 lt!10269) (index!2349 lt!10269)))) (mask!4771 lt!9964)))))

(declare-fun b!25723 () Bool)

(declare-fun lt!10263 () Unit!604)

(declare-fun lt!10277 () Unit!604)

(assert (=> b!25723 (= lt!10263 lt!10277)))

(assert (=> b!25723 (contains!234 call!2472 (select (arr!620 (_keys!3194 lt!9964)) (index!2347 lt!10265)))))

(assert (=> b!25723 (= lt!10277 (lemmaValidKeyInArrayIsInListMap!12 (_keys!3194 lt!9964) lt!10270 (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) (index!2347 lt!10265) (defaultEntry!1769 lt!9964)))))

(assert (=> b!25723 (= lt!10270 (array!1312 (store (arr!619 (_values!1753 lt!9964)) (index!2347 lt!10265) (ValueCellFull!318 (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))))) (size!720 (_values!1753 lt!9964))))))

(declare-fun lt!10260 () Unit!604)

(declare-fun lt!10267 () Unit!604)

(assert (=> b!25723 (= lt!10260 lt!10267)))

(assert (=> b!25723 (= call!2480 call!2479)))

(assert (=> b!25723 (= lt!10267 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (_keys!3194 lt!9964) (_values!1753 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) (index!2347 lt!10265) (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))) (defaultEntry!1769 lt!9964)))))

(declare-fun lt!10266 () Unit!604)

(assert (=> b!25723 (= lt!10266 e!16612)))

(assert (=> b!25723 (= c!3631 call!2487)))

(assert (=> b!25723 (= e!16619 (tuple2!985 true (LongMapFixedSize!223 (defaultEntry!1769 lt!9964) (mask!4771 lt!9964) (extraKeys!1661 lt!9964) (zeroValue!1688 lt!9964) (minValue!1688 lt!9964) (_size!159 lt!9964) (_keys!3194 lt!9964) (array!1312 (store (arr!619 (_values!1753 lt!9964)) (index!2347 lt!10265) (ValueCellFull!318 (ite (or c!3541 c!3542) (zeroValue!1688 (v!1627 (underlying!122 thiss!938))) (minValue!1688 (v!1627 (underlying!122 thiss!938)))))) (size!720 (_values!1753 lt!9964))) (_vacant!159 lt!9964))))))

(declare-fun b!25724 () Bool)

(declare-fun lt!10257 () Unit!604)

(assert (=> b!25724 (= e!16607 lt!10257)))

(assert (=> b!25724 (= lt!10257 call!2473)))

(assert (=> b!25724 (= lt!10271 call!2471)))

(assert (=> b!25724 (= c!3625 ((_ is MissingZero!56) lt!10271))))

(assert (=> b!25724 e!16622))

(declare-fun b!25725 () Bool)

(assert (=> b!25725 (= e!16614 e!16605)))

(declare-fun res!15344 () Bool)

(assert (=> b!25725 (= res!15344 (contains!234 call!2478 (ite (or c!3541 c!3542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25725 (=> (not res!15344) (not e!16605))))

(declare-fun b!25726 () Bool)

(declare-fun res!15341 () Bool)

(assert (=> b!25726 (=> (not res!15341) (not e!16623))))

(assert (=> b!25726 (= res!15341 (= (select (arr!620 (_keys!3194 lt!9964)) (index!2346 lt!10269)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25727 () Bool)

(assert (=> b!25727 (= e!16602 e!16620)))

(declare-fun res!15343 () Bool)

(assert (=> b!25727 (= res!15343 call!2486)))

(assert (=> b!25727 (=> (not res!15343) (not e!16620))))

(assert (= (and d!4817 c!3626) b!25694))

(assert (= (and d!4817 (not c!3626)) b!25699))

(assert (= (and b!25694 c!3635) b!25689))

(assert (= (and b!25694 (not c!3635)) b!25711))

(assert (= (or b!25689 b!25711) bm!2471))

(assert (= (or b!25689 b!25711) bm!2469))

(assert (= (or b!25689 b!25711) bm!2463))

(assert (= (and b!25699 c!3636) b!25712))

(assert (= (and b!25699 (not c!3636)) b!25687))

(assert (= (and b!25712 c!3628) b!25688))

(assert (= (and b!25712 (not c!3628)) b!25724))

(assert (= (and b!25688 res!15339) b!25702))

(assert (= (and b!25702 res!15345) b!25709))

(assert (= (and b!25724 c!3625) b!25696))

(assert (= (and b!25724 (not c!3625)) b!25693))

(assert (= (and b!25696 res!15350) b!25692))

(assert (= (and b!25692 res!15340) b!25690))

(assert (= (and b!25693 c!3627) b!25713))

(assert (= (and b!25693 (not c!3627)) b!25695))

(assert (= (and b!25713 res!15346) b!25717))

(assert (= (and b!25717 res!15348) b!25718))

(assert (= (or b!25696 b!25713) bm!2467))

(assert (= (or b!25690 b!25718) bm!2485))

(assert (= (or b!25702 bm!2467) bm!2464))

(assert (= (or b!25688 b!25724) bm!2466))

(assert (= (and b!25687 c!3629) b!25706))

(assert (= (and b!25687 (not c!3629)) b!25705))

(assert (= (and b!25705 c!3633) b!25691))

(assert (= (and b!25705 (not c!3633)) b!25723))

(assert (= (and b!25723 c!3631) b!25704))

(assert (= (and b!25723 (not c!3631)) b!25716))

(assert (= (and b!25704 res!15349) b!25698))

(assert (= (and b!25698 res!15347) b!25710))

(assert (= (and b!25716 c!3632) b!25697))

(assert (= (and b!25716 (not c!3632)) b!25720))

(assert (= (and b!25697 res!15351) b!25726))

(assert (= (and b!25726 res!15341) b!25719))

(assert (= (and b!25720 c!3637) b!25727))

(assert (= (and b!25720 (not c!3637)) b!25708))

(assert (= (and b!25727 res!15343) b!25721))

(assert (= (and b!25721 res!15342) b!25715))

(assert (= (or b!25697 b!25727) bm!2477))

(assert (= (or b!25719 b!25715) bm!2483))

(assert (= (or b!25698 bm!2477) bm!2465))

(assert (= (or b!25704 b!25716) bm!2484))

(assert (= (or b!25706 b!25691) bm!2473))

(assert (= (or bm!2485 bm!2483) bm!2481))

(assert (= (or bm!2464 bm!2465) bm!2486))

(assert (= (or b!25724 b!25716) bm!2480))

(assert (= (or b!25712 b!25723) bm!2479))

(assert (= (or bm!2466 bm!2484) bm!2474))

(assert (= (or b!25688 b!25704) bm!2470))

(assert (= (or b!25712 b!25723) bm!2478))

(assert (= (and bm!2478 c!3630) b!25707))

(assert (= (and bm!2478 (not c!3630)) b!25701))

(assert (= (or bm!2471 bm!2479) bm!2476))

(assert (= (or bm!2469 b!25723) bm!2482))

(assert (= (or bm!2463 b!25723) bm!2475))

(assert (= (and bm!2475 c!3638) b!25714))

(assert (= (and bm!2475 (not c!3638)) b!25700))

(assert (= (and d!4817 res!15352) b!25686))

(assert (= (and b!25686 c!3634) b!25725))

(assert (= (and b!25686 (not c!3634)) b!25703))

(assert (= (and b!25725 res!15344) b!25722))

(assert (= (or b!25725 b!25722 b!25703) bm!2468))

(assert (= (or b!25722 b!25703) bm!2472))

(declare-fun m!20711 () Bool)

(assert (=> bm!2482 m!20711))

(declare-fun m!20713 () Bool)

(assert (=> b!25689 m!20713))

(declare-fun m!20715 () Bool)

(assert (=> b!25722 m!20715))

(declare-fun m!20717 () Bool)

(assert (=> bm!2468 m!20717))

(declare-fun m!20719 () Bool)

(assert (=> bm!2470 m!20719))

(declare-fun m!20721 () Bool)

(assert (=> d!4817 m!20721))

(declare-fun m!20723 () Bool)

(assert (=> d!4817 m!20723))

(declare-fun m!20725 () Bool)

(assert (=> bm!2476 m!20725))

(declare-fun m!20727 () Bool)

(assert (=> bm!2476 m!20727))

(declare-fun m!20729 () Bool)

(assert (=> bm!2472 m!20729))

(declare-fun m!20731 () Bool)

(assert (=> b!25717 m!20731))

(declare-fun m!20733 () Bool)

(assert (=> b!25723 m!20733))

(declare-fun m!20735 () Bool)

(assert (=> b!25723 m!20735))

(declare-fun m!20737 () Bool)

(assert (=> b!25723 m!20737))

(assert (=> b!25723 m!20737))

(declare-fun m!20739 () Bool)

(assert (=> b!25723 m!20739))

(assert (=> b!25723 m!20725))

(declare-fun m!20741 () Bool)

(assert (=> b!25699 m!20741))

(declare-fun m!20743 () Bool)

(assert (=> b!25721 m!20743))

(declare-fun m!20745 () Bool)

(assert (=> b!25725 m!20745))

(declare-fun m!20747 () Bool)

(assert (=> bm!2478 m!20747))

(declare-fun m!20749 () Bool)

(assert (=> b!25692 m!20749))

(declare-fun m!20751 () Bool)

(assert (=> b!25726 m!20751))

(declare-fun m!20753 () Bool)

(assert (=> bm!2486 m!20753))

(declare-fun m!20755 () Bool)

(assert (=> b!25709 m!20755))

(declare-fun m!20757 () Bool)

(assert (=> b!25700 m!20757))

(declare-fun m!20759 () Bool)

(assert (=> bm!2475 m!20759))

(assert (=> b!25701 m!20757))

(declare-fun m!20761 () Bool)

(assert (=> bm!2480 m!20761))

(declare-fun m!20763 () Bool)

(assert (=> bm!2473 m!20763))

(declare-fun m!20765 () Bool)

(assert (=> b!25710 m!20765))

(declare-fun m!20767 () Bool)

(assert (=> b!25711 m!20767))

(declare-fun m!20769 () Bool)

(assert (=> bm!2481 m!20769))

(assert (=> bm!2474 m!20741))

(assert (=> bm!2344 d!4817))

(declare-fun mapIsEmpty!1057 () Bool)

(declare-fun mapRes!1057 () Bool)

(assert (=> mapIsEmpty!1057 mapRes!1057))

(declare-fun b!25734 () Bool)

(declare-fun e!16629 () Bool)

(assert (=> b!25734 (= e!16629 tp_is_empty!1035)))

(declare-fun condMapEmpty!1057 () Bool)

(declare-fun mapDefault!1057 () ValueCell!318)

(assert (=> mapNonEmpty!1051 (= condMapEmpty!1057 (= mapRest!1051 ((as const (Array (_ BitVec 32) ValueCell!318)) mapDefault!1057)))))

(declare-fun e!16628 () Bool)

(assert (=> mapNonEmpty!1051 (= tp!3568 (and e!16628 mapRes!1057))))

(declare-fun b!25735 () Bool)

(assert (=> b!25735 (= e!16628 tp_is_empty!1035)))

(declare-fun mapNonEmpty!1057 () Bool)

(declare-fun tp!3577 () Bool)

(assert (=> mapNonEmpty!1057 (= mapRes!1057 (and tp!3577 e!16629))))

(declare-fun mapRest!1057 () (Array (_ BitVec 32) ValueCell!318))

(declare-fun mapKey!1057 () (_ BitVec 32))

(declare-fun mapValue!1057 () ValueCell!318)

(assert (=> mapNonEmpty!1057 (= mapRest!1051 (store mapRest!1057 mapKey!1057 mapValue!1057))))

(assert (= (and mapNonEmpty!1051 condMapEmpty!1057) mapIsEmpty!1057))

(assert (= (and mapNonEmpty!1051 (not condMapEmpty!1057)) mapNonEmpty!1057))

(assert (= (and mapNonEmpty!1057 ((_ is ValueCellFull!318) mapValue!1057)) b!25734))

(assert (= (and mapNonEmpty!1051 ((_ is ValueCellFull!318) mapDefault!1057)) b!25735))

(declare-fun m!20771 () Bool)

(assert (=> mapNonEmpty!1057 m!20771))

(declare-fun b_lambda!1677 () Bool)

(assert (= b_lambda!1671 (or (and b!25426 b_free!771) b_lambda!1677)))

(declare-fun b_lambda!1679 () Bool)

(assert (= b_lambda!1673 (or (and b!25426 b_free!771) b_lambda!1679)))

(declare-fun b_lambda!1681 () Bool)

(assert (= b_lambda!1675 (or (and b!25426 b_free!771) b_lambda!1681)))

(check-sat (not b!25523) (not bm!2482) (not b!25711) (not bm!2389) (not b!25700) (not bm!2390) (not d!4813) (not b!25689) (not bm!2451) (not bm!2380) (not d!4805) (not b_lambda!1679) (not b!25701) (not bm!2470) b_and!1577 (not bm!2481) (not bm!2385) (not bm!2387) (not bm!2454) (not bm!2449) (not bm!2446) (not b!25527) (not bm!2468) (not d!4811) (not bm!2378) (not b!25550) (not b!25680) (not bm!2383) tp_is_empty!1035 (not b!25683) (not d!4799) (not bm!2450) (not bm!2452) (not bm!2473) (not b_next!771) (not bm!2474) (not d!4803) (not b!25547) (not b_lambda!1681) (not b!25557) (not bm!2388) (not bm!2486) (not bm!2381) (not b!25657) (not bm!2448) (not bm!2462) (not bm!2382) (not bm!2478) (not d!4801) (not bm!2475) (not b!25520) (not b!25545) (not b_lambda!1677) (not b!25681) (not b!25529) (not b!25658) (not d!4817) (not b!25722) (not bm!2476) (not b!25669) (not bm!2456) (not bm!2480) (not bm!2384) (not bm!2379) (not b!25647) (not bm!2444) (not b!25659) (not bm!2457) (not bm!2386) (not mapNonEmpty!1057) (not b!25522) (not bm!2472) (not b!25723) (not b!25699) (not d!4815) (not bm!2458) (not b!25725))
(check-sat b_and!1577 (not b_next!771))
