; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18386 () Bool)

(assert start!18386)

(declare-fun b!182374 () Bool)

(declare-fun b_free!4497 () Bool)

(declare-fun b_next!4497 () Bool)

(assert (=> b!182374 (= b_free!4497 (not b_next!4497))))

(declare-fun tp!16250 () Bool)

(declare-fun b_and!11059 () Bool)

(assert (=> b!182374 (= tp!16250 b_and!11059)))

(declare-fun b!182372 () Bool)

(declare-fun res!86311 () Bool)

(declare-fun e!120093 () Bool)

(assert (=> b!182372 (=> (not res!86311) (not e!120093))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182372 (= res!86311 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182373 () Bool)

(declare-fun e!120090 () Bool)

(declare-fun tp_is_empty!4269 () Bool)

(assert (=> b!182373 (= e!120090 tp_is_empty!4269)))

(declare-fun mapIsEmpty!7325 () Bool)

(declare-fun mapRes!7325 () Bool)

(assert (=> mapIsEmpty!7325 mapRes!7325))

(declare-datatypes ((V!5339 0))(
  ( (V!5340 (val!2179 Int)) )
))
(declare-datatypes ((ValueCell!1791 0))(
  ( (ValueCellFull!1791 (v!4078 V!5339)) (EmptyCell!1791) )
))
(declare-datatypes ((array!7723 0))(
  ( (array!7724 (arr!3653 (Array (_ BitVec 32) (_ BitVec 64))) (size!3965 (_ BitVec 32))) )
))
(declare-datatypes ((array!7725 0))(
  ( (array!7726 (arr!3654 (Array (_ BitVec 32) ValueCell!1791)) (size!3966 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2490 0))(
  ( (LongMapFixedSize!2491 (defaultEntry!3731 Int) (mask!8772 (_ BitVec 32)) (extraKeys!3468 (_ BitVec 32)) (zeroValue!3572 V!5339) (minValue!3572 V!5339) (_size!1294 (_ BitVec 32)) (_keys!5642 array!7723) (_values!3714 array!7725) (_vacant!1294 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2490)

(declare-fun e!120091 () Bool)

(declare-fun e!120092 () Bool)

(declare-fun array_inv!2355 (array!7723) Bool)

(declare-fun array_inv!2356 (array!7725) Bool)

(assert (=> b!182374 (= e!120092 (and tp!16250 tp_is_empty!4269 (array_inv!2355 (_keys!5642 thiss!1248)) (array_inv!2356 (_values!3714 thiss!1248)) e!120091))))

(declare-fun b!182375 () Bool)

(declare-fun e!120095 () Bool)

(assert (=> b!182375 (= e!120095 tp_is_empty!4269)))

(declare-fun b!182376 () Bool)

(declare-fun res!86308 () Bool)

(declare-fun e!120089 () Bool)

(assert (=> b!182376 (=> (not res!86308) (not e!120089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182376 (= res!86308 (validMask!0 (mask!8772 thiss!1248)))))

(declare-fun b!182377 () Bool)

(assert (=> b!182377 (= e!120093 e!120089)))

(declare-fun res!86313 () Bool)

(assert (=> b!182377 (=> (not res!86313) (not e!120089))))

(declare-datatypes ((SeekEntryResult!605 0))(
  ( (MissingZero!605 (index!4590 (_ BitVec 32))) (Found!605 (index!4591 (_ BitVec 32))) (Intermediate!605 (undefined!1417 Bool) (index!4592 (_ BitVec 32)) (x!19879 (_ BitVec 32))) (Undefined!605) (MissingVacant!605 (index!4593 (_ BitVec 32))) )
))
(declare-fun lt!90193 () SeekEntryResult!605)

(get-info :version)

(assert (=> b!182377 (= res!86313 (and (not ((_ is Undefined!605) lt!90193)) (not ((_ is MissingVacant!605) lt!90193)) (not ((_ is MissingZero!605) lt!90193)) ((_ is Found!605) lt!90193)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7723 (_ BitVec 32)) SeekEntryResult!605)

(assert (=> b!182377 (= lt!90193 (seekEntryOrOpen!0 key!828 (_keys!5642 thiss!1248) (mask!8772 thiss!1248)))))

(declare-fun b!182378 () Bool)

(declare-fun res!86309 () Bool)

(assert (=> b!182378 (=> (not res!86309) (not e!120089))))

(declare-datatypes ((tuple2!3396 0))(
  ( (tuple2!3397 (_1!1709 (_ BitVec 64)) (_2!1709 V!5339)) )
))
(declare-datatypes ((List!2315 0))(
  ( (Nil!2312) (Cons!2311 (h!2940 tuple2!3396) (t!7175 List!2315)) )
))
(declare-datatypes ((ListLongMap!2313 0))(
  ( (ListLongMap!2314 (toList!1172 List!2315)) )
))
(declare-fun contains!1256 (ListLongMap!2313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!820 (array!7723 array!7725 (_ BitVec 32) (_ BitVec 32) V!5339 V!5339 (_ BitVec 32) Int) ListLongMap!2313)

(assert (=> b!182378 (= res!86309 (contains!1256 (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)) key!828))))

(declare-fun res!86312 () Bool)

(assert (=> start!18386 (=> (not res!86312) (not e!120093))))

(declare-fun valid!1031 (LongMapFixedSize!2490) Bool)

(assert (=> start!18386 (= res!86312 (valid!1031 thiss!1248))))

(assert (=> start!18386 e!120093))

(assert (=> start!18386 e!120092))

(assert (=> start!18386 true))

(declare-fun b!182379 () Bool)

(declare-fun res!86310 () Bool)

(assert (=> b!182379 (=> (not res!86310) (not e!120089))))

(assert (=> b!182379 (= res!86310 (and (= (size!3966 (_values!3714 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8772 thiss!1248))) (= (size!3965 (_keys!5642 thiss!1248)) (size!3966 (_values!3714 thiss!1248))) (bvsge (mask!8772 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3468 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3468 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182380 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7723 (_ BitVec 32)) Bool)

(assert (=> b!182380 (= e!120089 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5642 thiss!1248) (mask!8772 thiss!1248))))))

(declare-fun b!182381 () Bool)

(assert (=> b!182381 (= e!120091 (and e!120095 mapRes!7325))))

(declare-fun condMapEmpty!7325 () Bool)

(declare-fun mapDefault!7325 () ValueCell!1791)

(assert (=> b!182381 (= condMapEmpty!7325 (= (arr!3654 (_values!3714 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1791)) mapDefault!7325)))))

(declare-fun mapNonEmpty!7325 () Bool)

(declare-fun tp!16249 () Bool)

(assert (=> mapNonEmpty!7325 (= mapRes!7325 (and tp!16249 e!120090))))

(declare-fun mapRest!7325 () (Array (_ BitVec 32) ValueCell!1791))

(declare-fun mapKey!7325 () (_ BitVec 32))

(declare-fun mapValue!7325 () ValueCell!1791)

(assert (=> mapNonEmpty!7325 (= (arr!3654 (_values!3714 thiss!1248)) (store mapRest!7325 mapKey!7325 mapValue!7325))))

(assert (= (and start!18386 res!86312) b!182372))

(assert (= (and b!182372 res!86311) b!182377))

(assert (= (and b!182377 res!86313) b!182378))

(assert (= (and b!182378 res!86309) b!182376))

(assert (= (and b!182376 res!86308) b!182379))

(assert (= (and b!182379 res!86310) b!182380))

(assert (= (and b!182381 condMapEmpty!7325) mapIsEmpty!7325))

(assert (= (and b!182381 (not condMapEmpty!7325)) mapNonEmpty!7325))

(assert (= (and mapNonEmpty!7325 ((_ is ValueCellFull!1791) mapValue!7325)) b!182373))

(assert (= (and b!182381 ((_ is ValueCellFull!1791) mapDefault!7325)) b!182375))

(assert (= b!182374 b!182381))

(assert (= start!18386 b!182374))

(declare-fun m!210179 () Bool)

(assert (=> mapNonEmpty!7325 m!210179))

(declare-fun m!210181 () Bool)

(assert (=> b!182378 m!210181))

(assert (=> b!182378 m!210181))

(declare-fun m!210183 () Bool)

(assert (=> b!182378 m!210183))

(declare-fun m!210185 () Bool)

(assert (=> b!182374 m!210185))

(declare-fun m!210187 () Bool)

(assert (=> b!182374 m!210187))

(declare-fun m!210189 () Bool)

(assert (=> start!18386 m!210189))

(declare-fun m!210191 () Bool)

(assert (=> b!182377 m!210191))

(declare-fun m!210193 () Bool)

(assert (=> b!182380 m!210193))

(declare-fun m!210195 () Bool)

(assert (=> b!182376 m!210195))

(check-sat (not mapNonEmpty!7325) (not start!18386) (not b!182380) (not b!182374) tp_is_empty!4269 (not b!182376) b_and!11059 (not b!182378) (not b_next!4497) (not b!182377))
(check-sat b_and!11059 (not b_next!4497))
(get-model)

(declare-fun d!54625 () Bool)

(assert (=> d!54625 (= (array_inv!2355 (_keys!5642 thiss!1248)) (bvsge (size!3965 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182374 d!54625))

(declare-fun d!54627 () Bool)

(assert (=> d!54627 (= (array_inv!2356 (_values!3714 thiss!1248)) (bvsge (size!3966 (_values!3714 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182374 d!54627))

(declare-fun d!54629 () Bool)

(declare-fun res!86338 () Bool)

(declare-fun e!120119 () Bool)

(assert (=> d!54629 (=> (not res!86338) (not e!120119))))

(declare-fun simpleValid!171 (LongMapFixedSize!2490) Bool)

(assert (=> d!54629 (= res!86338 (simpleValid!171 thiss!1248))))

(assert (=> d!54629 (= (valid!1031 thiss!1248) e!120119)))

(declare-fun b!182418 () Bool)

(declare-fun res!86339 () Bool)

(assert (=> b!182418 (=> (not res!86339) (not e!120119))))

(declare-fun arrayCountValidKeys!0 (array!7723 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182418 (= res!86339 (= (arrayCountValidKeys!0 (_keys!5642 thiss!1248) #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))) (_size!1294 thiss!1248)))))

(declare-fun b!182419 () Bool)

(declare-fun res!86340 () Bool)

(assert (=> b!182419 (=> (not res!86340) (not e!120119))))

(assert (=> b!182419 (= res!86340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5642 thiss!1248) (mask!8772 thiss!1248)))))

(declare-fun b!182420 () Bool)

(declare-datatypes ((List!2316 0))(
  ( (Nil!2313) (Cons!2312 (h!2941 (_ BitVec 64)) (t!7178 List!2316)) )
))
(declare-fun arrayNoDuplicates!0 (array!7723 (_ BitVec 32) List!2316) Bool)

(assert (=> b!182420 (= e!120119 (arrayNoDuplicates!0 (_keys!5642 thiss!1248) #b00000000000000000000000000000000 Nil!2313))))

(assert (= (and d!54629 res!86338) b!182418))

(assert (= (and b!182418 res!86339) b!182419))

(assert (= (and b!182419 res!86340) b!182420))

(declare-fun m!210215 () Bool)

(assert (=> d!54629 m!210215))

(declare-fun m!210217 () Bool)

(assert (=> b!182418 m!210217))

(assert (=> b!182419 m!210193))

(declare-fun m!210219 () Bool)

(assert (=> b!182420 m!210219))

(assert (=> start!18386 d!54629))

(declare-fun d!54631 () Bool)

(declare-fun res!86346 () Bool)

(declare-fun e!120126 () Bool)

(assert (=> d!54631 (=> res!86346 e!120126)))

(assert (=> d!54631 (= res!86346 (bvsge #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))))))

(assert (=> d!54631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5642 thiss!1248) (mask!8772 thiss!1248)) e!120126)))

(declare-fun b!182429 () Bool)

(declare-fun e!120128 () Bool)

(declare-fun e!120127 () Bool)

(assert (=> b!182429 (= e!120128 e!120127)))

(declare-fun lt!90205 () (_ BitVec 64))

(assert (=> b!182429 (= lt!90205 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5532 0))(
  ( (Unit!5533) )
))
(declare-fun lt!90203 () Unit!5532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7723 (_ BitVec 64) (_ BitVec 32)) Unit!5532)

(assert (=> b!182429 (= lt!90203 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5642 thiss!1248) lt!90205 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182429 (arrayContainsKey!0 (_keys!5642 thiss!1248) lt!90205 #b00000000000000000000000000000000)))

(declare-fun lt!90204 () Unit!5532)

(assert (=> b!182429 (= lt!90204 lt!90203)))

(declare-fun res!86345 () Bool)

(assert (=> b!182429 (= res!86345 (= (seekEntryOrOpen!0 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000) (_keys!5642 thiss!1248) (mask!8772 thiss!1248)) (Found!605 #b00000000000000000000000000000000)))))

(assert (=> b!182429 (=> (not res!86345) (not e!120127))))

(declare-fun bm!18409 () Bool)

(declare-fun call!18412 () Bool)

(assert (=> bm!18409 (= call!18412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5642 thiss!1248) (mask!8772 thiss!1248)))))

(declare-fun b!182430 () Bool)

(assert (=> b!182430 (= e!120127 call!18412)))

(declare-fun b!182431 () Bool)

(assert (=> b!182431 (= e!120128 call!18412)))

(declare-fun b!182432 () Bool)

(assert (=> b!182432 (= e!120126 e!120128)))

(declare-fun c!32715 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182432 (= c!32715 (validKeyInArray!0 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54631 (not res!86346)) b!182432))

(assert (= (and b!182432 c!32715) b!182429))

(assert (= (and b!182432 (not c!32715)) b!182431))

(assert (= (and b!182429 res!86345) b!182430))

(assert (= (or b!182430 b!182431) bm!18409))

(declare-fun m!210221 () Bool)

(assert (=> b!182429 m!210221))

(declare-fun m!210223 () Bool)

(assert (=> b!182429 m!210223))

(declare-fun m!210225 () Bool)

(assert (=> b!182429 m!210225))

(assert (=> b!182429 m!210221))

(declare-fun m!210227 () Bool)

(assert (=> b!182429 m!210227))

(declare-fun m!210229 () Bool)

(assert (=> bm!18409 m!210229))

(assert (=> b!182432 m!210221))

(assert (=> b!182432 m!210221))

(declare-fun m!210231 () Bool)

(assert (=> b!182432 m!210231))

(assert (=> b!182380 d!54631))

(declare-fun d!54633 () Bool)

(declare-fun e!120134 () Bool)

(assert (=> d!54633 e!120134))

(declare-fun res!86349 () Bool)

(assert (=> d!54633 (=> res!86349 e!120134)))

(declare-fun lt!90215 () Bool)

(assert (=> d!54633 (= res!86349 (not lt!90215))))

(declare-fun lt!90214 () Bool)

(assert (=> d!54633 (= lt!90215 lt!90214)))

(declare-fun lt!90217 () Unit!5532)

(declare-fun e!120133 () Unit!5532)

(assert (=> d!54633 (= lt!90217 e!120133)))

(declare-fun c!32718 () Bool)

(assert (=> d!54633 (= c!32718 lt!90214)))

(declare-fun containsKey!216 (List!2315 (_ BitVec 64)) Bool)

(assert (=> d!54633 (= lt!90214 (containsKey!216 (toList!1172 (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248))) key!828))))

(assert (=> d!54633 (= (contains!1256 (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)) key!828) lt!90215)))

(declare-fun b!182439 () Bool)

(declare-fun lt!90216 () Unit!5532)

(assert (=> b!182439 (= e!120133 lt!90216)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!164 (List!2315 (_ BitVec 64)) Unit!5532)

(assert (=> b!182439 (= lt!90216 (lemmaContainsKeyImpliesGetValueByKeyDefined!164 (toList!1172 (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248))) key!828))))

(declare-datatypes ((Option!218 0))(
  ( (Some!217 (v!4080 V!5339)) (None!216) )
))
(declare-fun isDefined!165 (Option!218) Bool)

(declare-fun getValueByKey!212 (List!2315 (_ BitVec 64)) Option!218)

(assert (=> b!182439 (isDefined!165 (getValueByKey!212 (toList!1172 (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248))) key!828))))

(declare-fun b!182440 () Bool)

(declare-fun Unit!5534 () Unit!5532)

(assert (=> b!182440 (= e!120133 Unit!5534)))

(declare-fun b!182441 () Bool)

(assert (=> b!182441 (= e!120134 (isDefined!165 (getValueByKey!212 (toList!1172 (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248))) key!828)))))

(assert (= (and d!54633 c!32718) b!182439))

(assert (= (and d!54633 (not c!32718)) b!182440))

(assert (= (and d!54633 (not res!86349)) b!182441))

(declare-fun m!210233 () Bool)

(assert (=> d!54633 m!210233))

(declare-fun m!210235 () Bool)

(assert (=> b!182439 m!210235))

(declare-fun m!210237 () Bool)

(assert (=> b!182439 m!210237))

(assert (=> b!182439 m!210237))

(declare-fun m!210239 () Bool)

(assert (=> b!182439 m!210239))

(assert (=> b!182441 m!210237))

(assert (=> b!182441 m!210237))

(assert (=> b!182441 m!210239))

(assert (=> b!182378 d!54633))

(declare-fun bm!18424 () Bool)

(declare-fun call!18432 () Bool)

(declare-fun lt!90268 () ListLongMap!2313)

(assert (=> bm!18424 (= call!18432 (contains!1256 lt!90268 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182484 () Bool)

(declare-fun res!86373 () Bool)

(declare-fun e!120166 () Bool)

(assert (=> b!182484 (=> (not res!86373) (not e!120166))))

(declare-fun e!120168 () Bool)

(assert (=> b!182484 (= res!86373 e!120168)))

(declare-fun res!86371 () Bool)

(assert (=> b!182484 (=> res!86371 e!120168)))

(declare-fun e!120172 () Bool)

(assert (=> b!182484 (= res!86371 (not e!120172))))

(declare-fun res!86376 () Bool)

(assert (=> b!182484 (=> (not res!86376) (not e!120172))))

(assert (=> b!182484 (= res!86376 (bvslt #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))))))

(declare-fun b!182485 () Bool)

(declare-fun e!120167 () Bool)

(assert (=> b!182485 (= e!120168 e!120167)))

(declare-fun res!86369 () Bool)

(assert (=> b!182485 (=> (not res!86369) (not e!120167))))

(assert (=> b!182485 (= res!86369 (contains!1256 lt!90268 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))))))

(declare-fun d!54635 () Bool)

(assert (=> d!54635 e!120166))

(declare-fun res!86368 () Bool)

(assert (=> d!54635 (=> (not res!86368) (not e!120166))))

(assert (=> d!54635 (= res!86368 (or (bvsge #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))))))))

(declare-fun lt!90271 () ListLongMap!2313)

(assert (=> d!54635 (= lt!90268 lt!90271)))

(declare-fun lt!90269 () Unit!5532)

(declare-fun e!120169 () Unit!5532)

(assert (=> d!54635 (= lt!90269 e!120169)))

(declare-fun c!32733 () Bool)

(declare-fun e!120164 () Bool)

(assert (=> d!54635 (= c!32733 e!120164)))

(declare-fun res!86374 () Bool)

(assert (=> d!54635 (=> (not res!86374) (not e!120164))))

(assert (=> d!54635 (= res!86374 (bvslt #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))))))

(declare-fun e!120173 () ListLongMap!2313)

(assert (=> d!54635 (= lt!90271 e!120173)))

(declare-fun c!32734 () Bool)

(assert (=> d!54635 (= c!32734 (and (not (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54635 (validMask!0 (mask!8772 thiss!1248))))

(assert (=> d!54635 (= (getCurrentListMap!820 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)) lt!90268)))

(declare-fun bm!18425 () Bool)

(declare-fun call!18429 () ListLongMap!2313)

(declare-fun call!18433 () ListLongMap!2313)

(assert (=> bm!18425 (= call!18429 call!18433)))

(declare-fun b!182486 () Bool)

(declare-fun e!120163 () ListLongMap!2313)

(declare-fun call!18430 () ListLongMap!2313)

(assert (=> b!182486 (= e!120163 call!18430)))

(declare-fun b!182487 () Bool)

(assert (=> b!182487 (= e!120164 (validKeyInArray!0 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182488 () Bool)

(declare-fun e!120161 () Bool)

(declare-fun e!120171 () Bool)

(assert (=> b!182488 (= e!120161 e!120171)))

(declare-fun res!86375 () Bool)

(declare-fun call!18427 () Bool)

(assert (=> b!182488 (= res!86375 call!18427)))

(assert (=> b!182488 (=> (not res!86375) (not e!120171))))

(declare-fun b!182489 () Bool)

(declare-fun res!86372 () Bool)

(assert (=> b!182489 (=> (not res!86372) (not e!120166))))

(assert (=> b!182489 (= res!86372 e!120161)))

(declare-fun c!32732 () Bool)

(assert (=> b!182489 (= c!32732 (not (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!182490 () Bool)

(declare-fun e!120165 () Bool)

(declare-fun apply!155 (ListLongMap!2313 (_ BitVec 64)) V!5339)

(assert (=> b!182490 (= e!120165 (= (apply!155 lt!90268 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3572 thiss!1248)))))

(declare-fun bm!18426 () Bool)

(assert (=> bm!18426 (= call!18427 (contains!1256 lt!90268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182491 () Bool)

(assert (=> b!182491 (= e!120171 (= (apply!155 lt!90268 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3572 thiss!1248)))))

(declare-fun b!182492 () Bool)

(declare-fun e!120170 () Bool)

(assert (=> b!182492 (= e!120166 e!120170)))

(declare-fun c!32735 () Bool)

(assert (=> b!182492 (= c!32735 (not (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182493 () Bool)

(declare-fun c!32736 () Bool)

(assert (=> b!182493 (= c!32736 (and (not (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120162 () ListLongMap!2313)

(assert (=> b!182493 (= e!120163 e!120162)))

(declare-fun b!182494 () Bool)

(assert (=> b!182494 (= e!120173 e!120163)))

(declare-fun c!32731 () Bool)

(assert (=> b!182494 (= c!32731 (and (not (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3468 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182495 () Bool)

(declare-fun Unit!5535 () Unit!5532)

(assert (=> b!182495 (= e!120169 Unit!5535)))

(declare-fun b!182496 () Bool)

(assert (=> b!182496 (= e!120172 (validKeyInArray!0 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182497 () Bool)

(declare-fun get!2094 (ValueCell!1791 V!5339) V!5339)

(declare-fun dynLambda!498 (Int (_ BitVec 64)) V!5339)

(assert (=> b!182497 (= e!120167 (= (apply!155 lt!90268 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000)) (get!2094 (select (arr!3654 (_values!3714 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!498 (defaultEntry!3731 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3966 (_values!3714 thiss!1248))))))

(assert (=> b!182497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3965 (_keys!5642 thiss!1248))))))

(declare-fun b!182498 () Bool)

(assert (=> b!182498 (= e!120170 e!120165)))

(declare-fun res!86370 () Bool)

(assert (=> b!182498 (= res!86370 call!18432)))

(assert (=> b!182498 (=> (not res!86370) (not e!120165))))

(declare-fun b!182499 () Bool)

(assert (=> b!182499 (= e!120161 (not call!18427))))

(declare-fun b!182500 () Bool)

(assert (=> b!182500 (= e!120170 (not call!18432))))

(declare-fun b!182501 () Bool)

(assert (=> b!182501 (= e!120162 call!18430)))

(declare-fun bm!18427 () Bool)

(declare-fun call!18431 () ListLongMap!2313)

(assert (=> bm!18427 (= call!18430 call!18431)))

(declare-fun bm!18428 () Bool)

(declare-fun call!18428 () ListLongMap!2313)

(declare-fun getCurrentListMapNoExtraKeys!188 (array!7723 array!7725 (_ BitVec 32) (_ BitVec 32) V!5339 V!5339 (_ BitVec 32) Int) ListLongMap!2313)

(assert (=> bm!18428 (= call!18428 (getCurrentListMapNoExtraKeys!188 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)))))

(declare-fun b!182502 () Bool)

(assert (=> b!182502 (= e!120162 call!18429)))

(declare-fun bm!18429 () Bool)

(declare-fun +!275 (ListLongMap!2313 tuple2!3396) ListLongMap!2313)

(assert (=> bm!18429 (= call!18431 (+!275 (ite c!32734 call!18428 (ite c!32731 call!18433 call!18429)) (ite (or c!32734 c!32731) (tuple2!3397 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3572 thiss!1248)) (tuple2!3397 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3572 thiss!1248)))))))

(declare-fun bm!18430 () Bool)

(assert (=> bm!18430 (= call!18433 call!18428)))

(declare-fun b!182503 () Bool)

(declare-fun lt!90272 () Unit!5532)

(assert (=> b!182503 (= e!120169 lt!90272)))

(declare-fun lt!90270 () ListLongMap!2313)

(assert (=> b!182503 (= lt!90270 (getCurrentListMapNoExtraKeys!188 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)))))

(declare-fun lt!90264 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90262 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90262 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90280 () Unit!5532)

(declare-fun addStillContains!131 (ListLongMap!2313 (_ BitVec 64) V!5339 (_ BitVec 64)) Unit!5532)

(assert (=> b!182503 (= lt!90280 (addStillContains!131 lt!90270 lt!90264 (zeroValue!3572 thiss!1248) lt!90262))))

(assert (=> b!182503 (contains!1256 (+!275 lt!90270 (tuple2!3397 lt!90264 (zeroValue!3572 thiss!1248))) lt!90262)))

(declare-fun lt!90275 () Unit!5532)

(assert (=> b!182503 (= lt!90275 lt!90280)))

(declare-fun lt!90278 () ListLongMap!2313)

(assert (=> b!182503 (= lt!90278 (getCurrentListMapNoExtraKeys!188 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)))))

(declare-fun lt!90276 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90276 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90274 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90274 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90266 () Unit!5532)

(declare-fun addApplyDifferent!131 (ListLongMap!2313 (_ BitVec 64) V!5339 (_ BitVec 64)) Unit!5532)

(assert (=> b!182503 (= lt!90266 (addApplyDifferent!131 lt!90278 lt!90276 (minValue!3572 thiss!1248) lt!90274))))

(assert (=> b!182503 (= (apply!155 (+!275 lt!90278 (tuple2!3397 lt!90276 (minValue!3572 thiss!1248))) lt!90274) (apply!155 lt!90278 lt!90274))))

(declare-fun lt!90282 () Unit!5532)

(assert (=> b!182503 (= lt!90282 lt!90266)))

(declare-fun lt!90283 () ListLongMap!2313)

(assert (=> b!182503 (= lt!90283 (getCurrentListMapNoExtraKeys!188 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)))))

(declare-fun lt!90281 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90281 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90263 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90263 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90277 () Unit!5532)

(assert (=> b!182503 (= lt!90277 (addApplyDifferent!131 lt!90283 lt!90281 (zeroValue!3572 thiss!1248) lt!90263))))

(assert (=> b!182503 (= (apply!155 (+!275 lt!90283 (tuple2!3397 lt!90281 (zeroValue!3572 thiss!1248))) lt!90263) (apply!155 lt!90283 lt!90263))))

(declare-fun lt!90267 () Unit!5532)

(assert (=> b!182503 (= lt!90267 lt!90277)))

(declare-fun lt!90265 () ListLongMap!2313)

(assert (=> b!182503 (= lt!90265 (getCurrentListMapNoExtraKeys!188 (_keys!5642 thiss!1248) (_values!3714 thiss!1248) (mask!8772 thiss!1248) (extraKeys!3468 thiss!1248) (zeroValue!3572 thiss!1248) (minValue!3572 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3731 thiss!1248)))))

(declare-fun lt!90273 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90279 () (_ BitVec 64))

(assert (=> b!182503 (= lt!90279 (select (arr!3653 (_keys!5642 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182503 (= lt!90272 (addApplyDifferent!131 lt!90265 lt!90273 (minValue!3572 thiss!1248) lt!90279))))

(assert (=> b!182503 (= (apply!155 (+!275 lt!90265 (tuple2!3397 lt!90273 (minValue!3572 thiss!1248))) lt!90279) (apply!155 lt!90265 lt!90279))))

(declare-fun b!182504 () Bool)

(assert (=> b!182504 (= e!120173 (+!275 call!18431 (tuple2!3397 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3572 thiss!1248))))))

(assert (= (and d!54635 c!32734) b!182504))

(assert (= (and d!54635 (not c!32734)) b!182494))

(assert (= (and b!182494 c!32731) b!182486))

(assert (= (and b!182494 (not c!32731)) b!182493))

(assert (= (and b!182493 c!32736) b!182501))

(assert (= (and b!182493 (not c!32736)) b!182502))

(assert (= (or b!182501 b!182502) bm!18425))

(assert (= (or b!182486 bm!18425) bm!18430))

(assert (= (or b!182486 b!182501) bm!18427))

(assert (= (or b!182504 bm!18430) bm!18428))

(assert (= (or b!182504 bm!18427) bm!18429))

(assert (= (and d!54635 res!86374) b!182487))

(assert (= (and d!54635 c!32733) b!182503))

(assert (= (and d!54635 (not c!32733)) b!182495))

(assert (= (and d!54635 res!86368) b!182484))

(assert (= (and b!182484 res!86376) b!182496))

(assert (= (and b!182484 (not res!86371)) b!182485))

(assert (= (and b!182485 res!86369) b!182497))

(assert (= (and b!182484 res!86373) b!182489))

(assert (= (and b!182489 c!32732) b!182488))

(assert (= (and b!182489 (not c!32732)) b!182499))

(assert (= (and b!182488 res!86375) b!182491))

(assert (= (or b!182488 b!182499) bm!18426))

(assert (= (and b!182489 res!86372) b!182492))

(assert (= (and b!182492 c!32735) b!182498))

(assert (= (and b!182492 (not c!32735)) b!182500))

(assert (= (and b!182498 res!86370) b!182490))

(assert (= (or b!182498 b!182500) bm!18424))

(declare-fun b_lambda!7175 () Bool)

(assert (=> (not b_lambda!7175) (not b!182497)))

(declare-fun t!7177 () Bool)

(declare-fun tb!2821 () Bool)

(assert (=> (and b!182374 (= (defaultEntry!3731 thiss!1248) (defaultEntry!3731 thiss!1248)) t!7177) tb!2821))

(declare-fun result!4741 () Bool)

(assert (=> tb!2821 (= result!4741 tp_is_empty!4269)))

(assert (=> b!182497 t!7177))

(declare-fun b_and!11063 () Bool)

(assert (= b_and!11059 (and (=> t!7177 result!4741) b_and!11063)))

(assert (=> b!182496 m!210221))

(assert (=> b!182496 m!210221))

(assert (=> b!182496 m!210231))

(assert (=> b!182487 m!210221))

(assert (=> b!182487 m!210221))

(assert (=> b!182487 m!210231))

(declare-fun m!210241 () Bool)

(assert (=> b!182490 m!210241))

(declare-fun m!210243 () Bool)

(assert (=> bm!18426 m!210243))

(declare-fun m!210245 () Bool)

(assert (=> b!182503 m!210245))

(declare-fun m!210247 () Bool)

(assert (=> b!182503 m!210247))

(declare-fun m!210249 () Bool)

(assert (=> b!182503 m!210249))

(declare-fun m!210251 () Bool)

(assert (=> b!182503 m!210251))

(declare-fun m!210253 () Bool)

(assert (=> b!182503 m!210253))

(declare-fun m!210255 () Bool)

(assert (=> b!182503 m!210255))

(declare-fun m!210257 () Bool)

(assert (=> b!182503 m!210257))

(assert (=> b!182503 m!210255))

(declare-fun m!210259 () Bool)

(assert (=> b!182503 m!210259))

(declare-fun m!210261 () Bool)

(assert (=> b!182503 m!210261))

(assert (=> b!182503 m!210259))

(assert (=> b!182503 m!210221))

(declare-fun m!210263 () Bool)

(assert (=> b!182503 m!210263))

(assert (=> b!182503 m!210247))

(declare-fun m!210265 () Bool)

(assert (=> b!182503 m!210265))

(declare-fun m!210267 () Bool)

(assert (=> b!182503 m!210267))

(declare-fun m!210269 () Bool)

(assert (=> b!182503 m!210269))

(assert (=> b!182503 m!210251))

(declare-fun m!210271 () Bool)

(assert (=> b!182503 m!210271))

(declare-fun m!210273 () Bool)

(assert (=> b!182503 m!210273))

(declare-fun m!210275 () Bool)

(assert (=> b!182503 m!210275))

(declare-fun m!210277 () Bool)

(assert (=> b!182504 m!210277))

(assert (=> b!182485 m!210221))

(assert (=> b!182485 m!210221))

(declare-fun m!210279 () Bool)

(assert (=> b!182485 m!210279))

(declare-fun m!210281 () Bool)

(assert (=> b!182491 m!210281))

(declare-fun m!210283 () Bool)

(assert (=> bm!18424 m!210283))

(declare-fun m!210285 () Bool)

(assert (=> bm!18429 m!210285))

(declare-fun m!210287 () Bool)

(assert (=> b!182497 m!210287))

(declare-fun m!210289 () Bool)

(assert (=> b!182497 m!210289))

(assert (=> b!182497 m!210289))

(assert (=> b!182497 m!210287))

(declare-fun m!210291 () Bool)

(assert (=> b!182497 m!210291))

(assert (=> b!182497 m!210221))

(assert (=> b!182497 m!210221))

(declare-fun m!210293 () Bool)

(assert (=> b!182497 m!210293))

(assert (=> d!54635 m!210195))

(assert (=> bm!18428 m!210273))

(assert (=> b!182378 d!54635))

(declare-fun b!182519 () Bool)

(declare-fun e!120180 () SeekEntryResult!605)

(assert (=> b!182519 (= e!120180 Undefined!605)))

(declare-fun lt!90290 () SeekEntryResult!605)

(declare-fun e!120181 () SeekEntryResult!605)

(declare-fun b!182520 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7723 (_ BitVec 32)) SeekEntryResult!605)

(assert (=> b!182520 (= e!120181 (seekKeyOrZeroReturnVacant!0 (x!19879 lt!90290) (index!4592 lt!90290) (index!4592 lt!90290) key!828 (_keys!5642 thiss!1248) (mask!8772 thiss!1248)))))

(declare-fun b!182522 () Bool)

(declare-fun e!120182 () SeekEntryResult!605)

(assert (=> b!182522 (= e!120182 (Found!605 (index!4592 lt!90290)))))

(declare-fun b!182523 () Bool)

(assert (=> b!182523 (= e!120180 e!120182)))

(declare-fun lt!90291 () (_ BitVec 64))

(assert (=> b!182523 (= lt!90291 (select (arr!3653 (_keys!5642 thiss!1248)) (index!4592 lt!90290)))))

(declare-fun c!32744 () Bool)

(assert (=> b!182523 (= c!32744 (= lt!90291 key!828))))

(declare-fun b!182524 () Bool)

(declare-fun c!32743 () Bool)

(assert (=> b!182524 (= c!32743 (= lt!90291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182524 (= e!120182 e!120181)))

(declare-fun d!54637 () Bool)

(declare-fun lt!90292 () SeekEntryResult!605)

(assert (=> d!54637 (and (or ((_ is Undefined!605) lt!90292) (not ((_ is Found!605) lt!90292)) (and (bvsge (index!4591 lt!90292) #b00000000000000000000000000000000) (bvslt (index!4591 lt!90292) (size!3965 (_keys!5642 thiss!1248))))) (or ((_ is Undefined!605) lt!90292) ((_ is Found!605) lt!90292) (not ((_ is MissingZero!605) lt!90292)) (and (bvsge (index!4590 lt!90292) #b00000000000000000000000000000000) (bvslt (index!4590 lt!90292) (size!3965 (_keys!5642 thiss!1248))))) (or ((_ is Undefined!605) lt!90292) ((_ is Found!605) lt!90292) ((_ is MissingZero!605) lt!90292) (not ((_ is MissingVacant!605) lt!90292)) (and (bvsge (index!4593 lt!90292) #b00000000000000000000000000000000) (bvslt (index!4593 lt!90292) (size!3965 (_keys!5642 thiss!1248))))) (or ((_ is Undefined!605) lt!90292) (ite ((_ is Found!605) lt!90292) (= (select (arr!3653 (_keys!5642 thiss!1248)) (index!4591 lt!90292)) key!828) (ite ((_ is MissingZero!605) lt!90292) (= (select (arr!3653 (_keys!5642 thiss!1248)) (index!4590 lt!90292)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!605) lt!90292) (= (select (arr!3653 (_keys!5642 thiss!1248)) (index!4593 lt!90292)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54637 (= lt!90292 e!120180)))

(declare-fun c!32745 () Bool)

(assert (=> d!54637 (= c!32745 (and ((_ is Intermediate!605) lt!90290) (undefined!1417 lt!90290)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7723 (_ BitVec 32)) SeekEntryResult!605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54637 (= lt!90290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8772 thiss!1248)) key!828 (_keys!5642 thiss!1248) (mask!8772 thiss!1248)))))

(assert (=> d!54637 (validMask!0 (mask!8772 thiss!1248))))

(assert (=> d!54637 (= (seekEntryOrOpen!0 key!828 (_keys!5642 thiss!1248) (mask!8772 thiss!1248)) lt!90292)))

(declare-fun b!182521 () Bool)

(assert (=> b!182521 (= e!120181 (MissingZero!605 (index!4592 lt!90290)))))

(assert (= (and d!54637 c!32745) b!182519))

(assert (= (and d!54637 (not c!32745)) b!182523))

(assert (= (and b!182523 c!32744) b!182522))

(assert (= (and b!182523 (not c!32744)) b!182524))

(assert (= (and b!182524 c!32743) b!182521))

(assert (= (and b!182524 (not c!32743)) b!182520))

(declare-fun m!210295 () Bool)

(assert (=> b!182520 m!210295))

(declare-fun m!210297 () Bool)

(assert (=> b!182523 m!210297))

(assert (=> d!54637 m!210195))

(declare-fun m!210299 () Bool)

(assert (=> d!54637 m!210299))

(declare-fun m!210301 () Bool)

(assert (=> d!54637 m!210301))

(declare-fun m!210303 () Bool)

(assert (=> d!54637 m!210303))

(declare-fun m!210305 () Bool)

(assert (=> d!54637 m!210305))

(declare-fun m!210307 () Bool)

(assert (=> d!54637 m!210307))

(assert (=> d!54637 m!210305))

(assert (=> b!182377 d!54637))

(declare-fun d!54639 () Bool)

(assert (=> d!54639 (= (validMask!0 (mask!8772 thiss!1248)) (and (or (= (mask!8772 thiss!1248) #b00000000000000000000000000000111) (= (mask!8772 thiss!1248) #b00000000000000000000000000001111) (= (mask!8772 thiss!1248) #b00000000000000000000000000011111) (= (mask!8772 thiss!1248) #b00000000000000000000000000111111) (= (mask!8772 thiss!1248) #b00000000000000000000000001111111) (= (mask!8772 thiss!1248) #b00000000000000000000000011111111) (= (mask!8772 thiss!1248) #b00000000000000000000000111111111) (= (mask!8772 thiss!1248) #b00000000000000000000001111111111) (= (mask!8772 thiss!1248) #b00000000000000000000011111111111) (= (mask!8772 thiss!1248) #b00000000000000000000111111111111) (= (mask!8772 thiss!1248) #b00000000000000000001111111111111) (= (mask!8772 thiss!1248) #b00000000000000000011111111111111) (= (mask!8772 thiss!1248) #b00000000000000000111111111111111) (= (mask!8772 thiss!1248) #b00000000000000001111111111111111) (= (mask!8772 thiss!1248) #b00000000000000011111111111111111) (= (mask!8772 thiss!1248) #b00000000000000111111111111111111) (= (mask!8772 thiss!1248) #b00000000000001111111111111111111) (= (mask!8772 thiss!1248) #b00000000000011111111111111111111) (= (mask!8772 thiss!1248) #b00000000000111111111111111111111) (= (mask!8772 thiss!1248) #b00000000001111111111111111111111) (= (mask!8772 thiss!1248) #b00000000011111111111111111111111) (= (mask!8772 thiss!1248) #b00000000111111111111111111111111) (= (mask!8772 thiss!1248) #b00000001111111111111111111111111) (= (mask!8772 thiss!1248) #b00000011111111111111111111111111) (= (mask!8772 thiss!1248) #b00000111111111111111111111111111) (= (mask!8772 thiss!1248) #b00001111111111111111111111111111) (= (mask!8772 thiss!1248) #b00011111111111111111111111111111) (= (mask!8772 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8772 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182376 d!54639))

(declare-fun mapIsEmpty!7331 () Bool)

(declare-fun mapRes!7331 () Bool)

(assert (=> mapIsEmpty!7331 mapRes!7331))

(declare-fun b!182532 () Bool)

(declare-fun e!120187 () Bool)

(assert (=> b!182532 (= e!120187 tp_is_empty!4269)))

(declare-fun b!182531 () Bool)

(declare-fun e!120188 () Bool)

(assert (=> b!182531 (= e!120188 tp_is_empty!4269)))

(declare-fun mapNonEmpty!7331 () Bool)

(declare-fun tp!16259 () Bool)

(assert (=> mapNonEmpty!7331 (= mapRes!7331 (and tp!16259 e!120188))))

(declare-fun mapRest!7331 () (Array (_ BitVec 32) ValueCell!1791))

(declare-fun mapValue!7331 () ValueCell!1791)

(declare-fun mapKey!7331 () (_ BitVec 32))

(assert (=> mapNonEmpty!7331 (= mapRest!7325 (store mapRest!7331 mapKey!7331 mapValue!7331))))

(declare-fun condMapEmpty!7331 () Bool)

(declare-fun mapDefault!7331 () ValueCell!1791)

(assert (=> mapNonEmpty!7325 (= condMapEmpty!7331 (= mapRest!7325 ((as const (Array (_ BitVec 32) ValueCell!1791)) mapDefault!7331)))))

(assert (=> mapNonEmpty!7325 (= tp!16249 (and e!120187 mapRes!7331))))

(assert (= (and mapNonEmpty!7325 condMapEmpty!7331) mapIsEmpty!7331))

(assert (= (and mapNonEmpty!7325 (not condMapEmpty!7331)) mapNonEmpty!7331))

(assert (= (and mapNonEmpty!7331 ((_ is ValueCellFull!1791) mapValue!7331)) b!182531))

(assert (= (and mapNonEmpty!7325 ((_ is ValueCellFull!1791) mapDefault!7331)) b!182532))

(declare-fun m!210309 () Bool)

(assert (=> mapNonEmpty!7331 m!210309))

(declare-fun b_lambda!7177 () Bool)

(assert (= b_lambda!7175 (or (and b!182374 b_free!4497) b_lambda!7177)))

(check-sat (not mapNonEmpty!7331) (not bm!18424) (not b!182441) (not d!54629) (not b!182491) (not d!54635) (not b!182503) (not b!182504) (not d!54633) (not b_lambda!7177) (not b!182497) (not b!182487) (not d!54637) (not b!182485) (not bm!18428) (not b!182420) (not b!182418) (not bm!18426) tp_is_empty!4269 (not b!182496) b_and!11063 (not b!182429) (not b!182520) (not b!182439) (not bm!18409) (not b!182432) (not b!182419) (not b!182490) (not bm!18429) (not b_next!4497))
(check-sat b_and!11063 (not b_next!4497))
