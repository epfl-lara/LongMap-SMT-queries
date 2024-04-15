; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21736 () Bool)

(assert start!21736)

(declare-fun b!218483 () Bool)

(declare-fun b_free!5881 () Bool)

(declare-fun b_next!5881 () Bool)

(assert (=> b!218483 (= b_free!5881 (not b_next!5881))))

(declare-fun tp!20778 () Bool)

(declare-fun b_and!12745 () Bool)

(assert (=> b!218483 (= tp!20778 b_and!12745)))

(declare-fun b!218469 () Bool)

(declare-fun e!142119 () Bool)

(declare-fun e!142115 () Bool)

(declare-fun mapRes!9777 () Bool)

(assert (=> b!218469 (= e!142119 (and e!142115 mapRes!9777))))

(declare-fun condMapEmpty!9777 () Bool)

(declare-datatypes ((V!7305 0))(
  ( (V!7306 (val!2916 Int)) )
))
(declare-datatypes ((ValueCell!2528 0))(
  ( (ValueCellFull!2528 (v!4928 V!7305)) (EmptyCell!2528) )
))
(declare-datatypes ((array!10717 0))(
  ( (array!10718 (arr!5079 (Array (_ BitVec 32) ValueCell!2528)) (size!5412 (_ BitVec 32))) )
))
(declare-datatypes ((array!10719 0))(
  ( (array!10720 (arr!5080 (Array (_ BitVec 32) (_ BitVec 64))) (size!5413 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2956 0))(
  ( (LongMapFixedSize!2957 (defaultEntry!4128 Int) (mask!9906 (_ BitVec 32)) (extraKeys!3865 (_ BitVec 32)) (zeroValue!3969 V!7305) (minValue!3969 V!7305) (_size!1527 (_ BitVec 32)) (_keys!6176 array!10719) (_values!4111 array!10717) (_vacant!1527 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2956)

(declare-fun mapDefault!9777 () ValueCell!2528)

(assert (=> b!218469 (= condMapEmpty!9777 (= (arr!5079 (_values!4111 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2528)) mapDefault!9777)))))

(declare-fun b!218470 () Bool)

(declare-fun e!142125 () Bool)

(assert (=> b!218470 (= e!142125 (bvsge #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun b!218471 () Bool)

(declare-fun tp_is_empty!5743 () Bool)

(assert (=> b!218471 (= e!142115 tp_is_empty!5743)))

(declare-fun b!218472 () Bool)

(declare-fun e!142126 () Bool)

(declare-datatypes ((SeekEntryResult!786 0))(
  ( (MissingZero!786 (index!5314 (_ BitVec 32))) (Found!786 (index!5315 (_ BitVec 32))) (Intermediate!786 (undefined!1598 Bool) (index!5316 (_ BitVec 32)) (x!22849 (_ BitVec 32))) (Undefined!786) (MissingVacant!786 (index!5317 (_ BitVec 32))) )
))
(declare-fun lt!111390 () SeekEntryResult!786)

(get-info :version)

(assert (=> b!218472 (= e!142126 ((_ is Undefined!786) lt!111390))))

(declare-fun mapIsEmpty!9777 () Bool)

(assert (=> mapIsEmpty!9777 mapRes!9777))

(declare-fun b!218473 () Bool)

(declare-datatypes ((Unit!6475 0))(
  ( (Unit!6476) )
))
(declare-fun e!142127 () Unit!6475)

(declare-fun Unit!6477 () Unit!6475)

(assert (=> b!218473 (= e!142127 Unit!6477)))

(declare-fun lt!111391 () Unit!6475)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!187 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6475)

(assert (=> b!218473 (= lt!111391 (lemmaInListMapThenSeekEntryOrOpenFindsIt!187 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> b!218473 false))

(declare-fun bm!20378 () Bool)

(declare-fun call!20382 () Bool)

(declare-fun arrayContainsKey!0 (array!10719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20378 (= call!20382 (arrayContainsKey!0 (_keys!6176 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9777 () Bool)

(declare-fun tp!20777 () Bool)

(declare-fun e!142117 () Bool)

(assert (=> mapNonEmpty!9777 (= mapRes!9777 (and tp!20777 e!142117))))

(declare-fun mapKey!9777 () (_ BitVec 32))

(declare-fun mapValue!9777 () ValueCell!2528)

(declare-fun mapRest!9777 () (Array (_ BitVec 32) ValueCell!2528))

(assert (=> mapNonEmpty!9777 (= (arr!5079 (_values!4111 thiss!1504)) (store mapRest!9777 mapKey!9777 mapValue!9777))))

(declare-fun b!218475 () Bool)

(declare-fun e!142121 () Bool)

(assert (=> b!218475 (= e!142121 (not call!20382))))

(declare-fun b!218476 () Bool)

(declare-fun e!142120 () Bool)

(assert (=> b!218476 (= e!142120 (not call!20382))))

(declare-fun b!218477 () Bool)

(declare-fun res!107083 () Bool)

(assert (=> b!218477 (=> (not res!107083) (not e!142121))))

(declare-fun call!20381 () Bool)

(assert (=> b!218477 (= res!107083 call!20381)))

(declare-fun e!142118 () Bool)

(assert (=> b!218477 (= e!142118 e!142121)))

(declare-fun b!218478 () Bool)

(declare-fun c!36339 () Bool)

(assert (=> b!218478 (= c!36339 ((_ is MissingVacant!786) lt!111390))))

(assert (=> b!218478 (= e!142118 e!142126)))

(declare-fun b!218479 () Bool)

(declare-fun res!107087 () Bool)

(declare-fun e!142122 () Bool)

(assert (=> b!218479 (=> (not res!107087) (not e!142122))))

(assert (=> b!218479 (= res!107087 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218480 () Bool)

(assert (=> b!218480 (= e!142126 e!142120)))

(declare-fun res!107086 () Bool)

(assert (=> b!218480 (= res!107086 call!20381)))

(assert (=> b!218480 (=> (not res!107086) (not e!142120))))

(declare-fun b!218481 () Bool)

(declare-fun e!142123 () Bool)

(assert (=> b!218481 (= e!142122 e!142123)))

(declare-fun res!107088 () Bool)

(assert (=> b!218481 (=> (not res!107088) (not e!142123))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218481 (= res!107088 (or (= lt!111390 (MissingZero!786 index!297)) (= lt!111390 (MissingVacant!786 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10719 (_ BitVec 32)) SeekEntryResult!786)

(assert (=> b!218481 (= lt!111390 (seekEntryOrOpen!0 key!932 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)))))

(declare-fun b!218482 () Bool)

(declare-fun res!107084 () Bool)

(assert (=> b!218482 (=> (not res!107084) (not e!142121))))

(assert (=> b!218482 (= res!107084 (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5314 lt!111390)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142124 () Bool)

(declare-fun array_inv!3345 (array!10719) Bool)

(declare-fun array_inv!3346 (array!10717) Bool)

(assert (=> b!218483 (= e!142124 (and tp!20778 tp_is_empty!5743 (array_inv!3345 (_keys!6176 thiss!1504)) (array_inv!3346 (_values!4111 thiss!1504)) e!142119))))

(declare-fun res!107082 () Bool)

(assert (=> start!21736 (=> (not res!107082) (not e!142122))))

(declare-fun valid!1212 (LongMapFixedSize!2956) Bool)

(assert (=> start!21736 (= res!107082 (valid!1212 thiss!1504))))

(assert (=> start!21736 e!142122))

(assert (=> start!21736 e!142124))

(assert (=> start!21736 true))

(declare-fun b!218474 () Bool)

(declare-fun lt!111392 () Unit!6475)

(assert (=> b!218474 (= e!142127 lt!111392)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!186 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6475)

(assert (=> b!218474 (= lt!111392 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!186 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(declare-fun c!36337 () Bool)

(assert (=> b!218474 (= c!36337 ((_ is MissingZero!786) lt!111390))))

(assert (=> b!218474 e!142118))

(declare-fun b!218484 () Bool)

(assert (=> b!218484 (= e!142123 e!142125)))

(declare-fun res!107089 () Bool)

(assert (=> b!218484 (=> (not res!107089) (not e!142125))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218484 (= res!107089 (inRange!0 index!297 (mask!9906 thiss!1504)))))

(declare-fun lt!111389 () Unit!6475)

(assert (=> b!218484 (= lt!111389 e!142127)))

(declare-fun c!36338 () Bool)

(declare-datatypes ((tuple2!4292 0))(
  ( (tuple2!4293 (_1!2157 (_ BitVec 64)) (_2!2157 V!7305)) )
))
(declare-datatypes ((List!3214 0))(
  ( (Nil!3211) (Cons!3210 (h!3857 tuple2!4292) (t!8160 List!3214)) )
))
(declare-datatypes ((ListLongMap!3195 0))(
  ( (ListLongMap!3196 (toList!1613 List!3214)) )
))
(declare-fun contains!1454 (ListLongMap!3195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1122 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 32) Int) ListLongMap!3195)

(assert (=> b!218484 (= c!36338 (contains!1454 (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) key!932))))

(declare-fun b!218485 () Bool)

(assert (=> b!218485 (= e!142117 tp_is_empty!5743)))

(declare-fun b!218486 () Bool)

(declare-fun res!107085 () Bool)

(assert (=> b!218486 (= res!107085 (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5317 lt!111390)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218486 (=> (not res!107085) (not e!142120))))

(declare-fun bm!20379 () Bool)

(assert (=> bm!20379 (= call!20381 (inRange!0 (ite c!36337 (index!5314 lt!111390) (index!5317 lt!111390)) (mask!9906 thiss!1504)))))

(assert (= (and start!21736 res!107082) b!218479))

(assert (= (and b!218479 res!107087) b!218481))

(assert (= (and b!218481 res!107088) b!218484))

(assert (= (and b!218484 c!36338) b!218473))

(assert (= (and b!218484 (not c!36338)) b!218474))

(assert (= (and b!218474 c!36337) b!218477))

(assert (= (and b!218474 (not c!36337)) b!218478))

(assert (= (and b!218477 res!107083) b!218482))

(assert (= (and b!218482 res!107084) b!218475))

(assert (= (and b!218478 c!36339) b!218480))

(assert (= (and b!218478 (not c!36339)) b!218472))

(assert (= (and b!218480 res!107086) b!218486))

(assert (= (and b!218486 res!107085) b!218476))

(assert (= (or b!218477 b!218480) bm!20379))

(assert (= (or b!218475 b!218476) bm!20378))

(assert (= (and b!218484 res!107089) b!218470))

(assert (= (and b!218469 condMapEmpty!9777) mapIsEmpty!9777))

(assert (= (and b!218469 (not condMapEmpty!9777)) mapNonEmpty!9777))

(assert (= (and mapNonEmpty!9777 ((_ is ValueCellFull!2528) mapValue!9777)) b!218485))

(assert (= (and b!218469 ((_ is ValueCellFull!2528) mapDefault!9777)) b!218471))

(assert (= b!218483 b!218469))

(assert (= start!21736 b!218483))

(declare-fun m!243831 () Bool)

(assert (=> b!218484 m!243831))

(declare-fun m!243833 () Bool)

(assert (=> b!218484 m!243833))

(assert (=> b!218484 m!243833))

(declare-fun m!243835 () Bool)

(assert (=> b!218484 m!243835))

(declare-fun m!243837 () Bool)

(assert (=> bm!20379 m!243837))

(declare-fun m!243839 () Bool)

(assert (=> b!218473 m!243839))

(declare-fun m!243841 () Bool)

(assert (=> b!218474 m!243841))

(declare-fun m!243843 () Bool)

(assert (=> b!218483 m!243843))

(declare-fun m!243845 () Bool)

(assert (=> b!218483 m!243845))

(declare-fun m!243847 () Bool)

(assert (=> start!21736 m!243847))

(declare-fun m!243849 () Bool)

(assert (=> b!218486 m!243849))

(declare-fun m!243851 () Bool)

(assert (=> mapNonEmpty!9777 m!243851))

(declare-fun m!243853 () Bool)

(assert (=> b!218482 m!243853))

(declare-fun m!243855 () Bool)

(assert (=> b!218481 m!243855))

(declare-fun m!243857 () Bool)

(assert (=> bm!20378 m!243857))

(check-sat (not b!218483) (not b!218484) (not start!21736) (not b!218481) (not b!218473) (not mapNonEmpty!9777) (not b_next!5881) (not bm!20379) tp_is_empty!5743 (not b!218474) (not bm!20378) b_and!12745)
(check-sat b_and!12745 (not b_next!5881))
(get-model)

(declare-fun d!58451 () Bool)

(declare-fun res!107142 () Bool)

(declare-fun e!142210 () Bool)

(assert (=> d!58451 (=> res!107142 e!142210)))

(assert (=> d!58451 (= res!107142 (= (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!58451 (= (arrayContainsKey!0 (_keys!6176 thiss!1504) key!932 #b00000000000000000000000000000000) e!142210)))

(declare-fun b!218599 () Bool)

(declare-fun e!142211 () Bool)

(assert (=> b!218599 (= e!142210 e!142211)))

(declare-fun res!107143 () Bool)

(assert (=> b!218599 (=> (not res!107143) (not e!142211))))

(assert (=> b!218599 (= res!107143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun b!218600 () Bool)

(assert (=> b!218600 (= e!142211 (arrayContainsKey!0 (_keys!6176 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!58451 (not res!107142)) b!218599))

(assert (= (and b!218599 res!107143) b!218600))

(declare-fun m!243915 () Bool)

(assert (=> d!58451 m!243915))

(declare-fun m!243917 () Bool)

(assert (=> b!218600 m!243917))

(assert (=> bm!20378 d!58451))

(declare-fun d!58453 () Bool)

(assert (=> d!58453 (= (array_inv!3345 (_keys!6176 thiss!1504)) (bvsge (size!5413 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218483 d!58453))

(declare-fun d!58455 () Bool)

(assert (=> d!58455 (= (array_inv!3346 (_values!4111 thiss!1504)) (bvsge (size!5412 (_values!4111 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218483 d!58455))

(declare-fun b!218617 () Bool)

(declare-fun e!142221 () Bool)

(declare-fun call!20400 () Bool)

(assert (=> b!218617 (= e!142221 (not call!20400))))

(declare-fun b!218618 () Bool)

(declare-fun e!142223 () Bool)

(declare-fun lt!111422 () SeekEntryResult!786)

(assert (=> b!218618 (= e!142223 ((_ is Undefined!786) lt!111422))))

(declare-fun b!218619 () Bool)

(declare-fun res!107155 () Bool)

(assert (=> b!218619 (=> (not res!107155) (not e!142221))))

(assert (=> b!218619 (= res!107155 (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5317 lt!111422)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218619 (and (bvsge (index!5317 lt!111422) #b00000000000000000000000000000000) (bvslt (index!5317 lt!111422) (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun bm!20396 () Bool)

(declare-fun c!36362 () Bool)

(declare-fun call!20399 () Bool)

(assert (=> bm!20396 (= call!20399 (inRange!0 (ite c!36362 (index!5314 lt!111422) (index!5317 lt!111422)) (mask!9906 thiss!1504)))))

(declare-fun b!218620 () Bool)

(assert (=> b!218620 (and (bvsge (index!5314 lt!111422) #b00000000000000000000000000000000) (bvslt (index!5314 lt!111422) (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun res!107153 () Bool)

(assert (=> b!218620 (= res!107153 (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5314 lt!111422)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142220 () Bool)

(assert (=> b!218620 (=> (not res!107153) (not e!142220))))

(declare-fun b!218621 () Bool)

(declare-fun e!142222 () Bool)

(assert (=> b!218621 (= e!142222 e!142220)))

(declare-fun res!107152 () Bool)

(assert (=> b!218621 (= res!107152 call!20399)))

(assert (=> b!218621 (=> (not res!107152) (not e!142220))))

(declare-fun b!218622 () Bool)

(declare-fun res!107154 () Bool)

(assert (=> b!218622 (=> (not res!107154) (not e!142221))))

(assert (=> b!218622 (= res!107154 call!20399)))

(assert (=> b!218622 (= e!142223 e!142221)))

(declare-fun bm!20397 () Bool)

(assert (=> bm!20397 (= call!20400 (arrayContainsKey!0 (_keys!6176 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!58457 () Bool)

(assert (=> d!58457 e!142222))

(assert (=> d!58457 (= c!36362 ((_ is MissingZero!786) lt!111422))))

(assert (=> d!58457 (= lt!111422 (seekEntryOrOpen!0 key!932 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)))))

(declare-fun lt!111421 () Unit!6475)

(declare-fun choose!1092 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6475)

(assert (=> d!58457 (= lt!111421 (choose!1092 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!58457 (validMask!0 (mask!9906 thiss!1504))))

(assert (=> d!58457 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!186 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)) lt!111421)))

(declare-fun b!218623 () Bool)

(assert (=> b!218623 (= e!142222 e!142223)))

(declare-fun c!36363 () Bool)

(assert (=> b!218623 (= c!36363 ((_ is MissingVacant!786) lt!111422))))

(declare-fun b!218624 () Bool)

(assert (=> b!218624 (= e!142220 (not call!20400))))

(assert (= (and d!58457 c!36362) b!218621))

(assert (= (and d!58457 (not c!36362)) b!218623))

(assert (= (and b!218621 res!107152) b!218620))

(assert (= (and b!218620 res!107153) b!218624))

(assert (= (and b!218623 c!36363) b!218622))

(assert (= (and b!218623 (not c!36363)) b!218618))

(assert (= (and b!218622 res!107154) b!218619))

(assert (= (and b!218619 res!107155) b!218617))

(assert (= (or b!218621 b!218622) bm!20396))

(assert (= (or b!218624 b!218617) bm!20397))

(assert (=> d!58457 m!243855))

(declare-fun m!243919 () Bool)

(assert (=> d!58457 m!243919))

(declare-fun m!243921 () Bool)

(assert (=> d!58457 m!243921))

(declare-fun m!243923 () Bool)

(assert (=> b!218619 m!243923))

(assert (=> bm!20397 m!243857))

(declare-fun m!243925 () Bool)

(assert (=> bm!20396 m!243925))

(declare-fun m!243927 () Bool)

(assert (=> b!218620 m!243927))

(assert (=> b!218474 d!58457))

(declare-fun d!58459 () Bool)

(assert (=> d!58459 (= (inRange!0 index!297 (mask!9906 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!9906 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218484 d!58459))

(declare-fun d!58461 () Bool)

(declare-fun e!142228 () Bool)

(assert (=> d!58461 e!142228))

(declare-fun res!107158 () Bool)

(assert (=> d!58461 (=> res!107158 e!142228)))

(declare-fun lt!111431 () Bool)

(assert (=> d!58461 (= res!107158 (not lt!111431))))

(declare-fun lt!111433 () Bool)

(assert (=> d!58461 (= lt!111431 lt!111433)))

(declare-fun lt!111434 () Unit!6475)

(declare-fun e!142229 () Unit!6475)

(assert (=> d!58461 (= lt!111434 e!142229)))

(declare-fun c!36366 () Bool)

(assert (=> d!58461 (= c!36366 lt!111433)))

(declare-fun containsKey!249 (List!3214 (_ BitVec 64)) Bool)

(assert (=> d!58461 (= lt!111433 (containsKey!249 (toList!1613 (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932))))

(assert (=> d!58461 (= (contains!1454 (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) key!932) lt!111431)))

(declare-fun b!218631 () Bool)

(declare-fun lt!111432 () Unit!6475)

(assert (=> b!218631 (= e!142229 lt!111432)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!198 (List!3214 (_ BitVec 64)) Unit!6475)

(assert (=> b!218631 (= lt!111432 (lemmaContainsKeyImpliesGetValueByKeyDefined!198 (toList!1613 (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932))))

(declare-datatypes ((Option!263 0))(
  ( (Some!262 (v!4931 V!7305)) (None!261) )
))
(declare-fun isDefined!199 (Option!263) Bool)

(declare-fun getValueByKey!257 (List!3214 (_ BitVec 64)) Option!263)

(assert (=> b!218631 (isDefined!199 (getValueByKey!257 (toList!1613 (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932))))

(declare-fun b!218632 () Bool)

(declare-fun Unit!6484 () Unit!6475)

(assert (=> b!218632 (= e!142229 Unit!6484)))

(declare-fun b!218633 () Bool)

(assert (=> b!218633 (= e!142228 (isDefined!199 (getValueByKey!257 (toList!1613 (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932)))))

(assert (= (and d!58461 c!36366) b!218631))

(assert (= (and d!58461 (not c!36366)) b!218632))

(assert (= (and d!58461 (not res!107158)) b!218633))

(declare-fun m!243929 () Bool)

(assert (=> d!58461 m!243929))

(declare-fun m!243931 () Bool)

(assert (=> b!218631 m!243931))

(declare-fun m!243933 () Bool)

(assert (=> b!218631 m!243933))

(assert (=> b!218631 m!243933))

(declare-fun m!243935 () Bool)

(assert (=> b!218631 m!243935))

(assert (=> b!218633 m!243933))

(assert (=> b!218633 m!243933))

(assert (=> b!218633 m!243935))

(assert (=> b!218484 d!58461))

(declare-fun b!218676 () Bool)

(declare-fun e!142259 () ListLongMap!3195)

(declare-fun e!142261 () ListLongMap!3195)

(assert (=> b!218676 (= e!142259 e!142261)))

(declare-fun c!36380 () Bool)

(assert (=> b!218676 (= c!36380 (and (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!218677 () Bool)

(declare-fun e!142256 () Bool)

(declare-fun e!142260 () Bool)

(assert (=> b!218677 (= e!142256 e!142260)))

(declare-fun res!107179 () Bool)

(declare-fun call!20415 () Bool)

(assert (=> b!218677 (= res!107179 call!20415)))

(assert (=> b!218677 (=> (not res!107179) (not e!142260))))

(declare-fun b!218678 () Bool)

(declare-fun e!142257 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!218678 (= e!142257 (validKeyInArray!0 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!218679 () Bool)

(declare-fun e!142262 () Bool)

(declare-fun lt!111486 () ListLongMap!3195)

(declare-fun apply!201 (ListLongMap!3195 (_ BitVec 64)) V!7305)

(assert (=> b!218679 (= e!142262 (= (apply!201 lt!111486 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3969 thiss!1504)))))

(declare-fun b!218680 () Bool)

(declare-fun c!36379 () Bool)

(assert (=> b!218680 (= c!36379 (and (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!142264 () ListLongMap!3195)

(assert (=> b!218680 (= e!142261 e!142264)))

(declare-fun b!218681 () Bool)

(declare-fun e!142265 () Bool)

(declare-fun call!20417 () Bool)

(assert (=> b!218681 (= e!142265 (not call!20417))))

(declare-fun b!218683 () Bool)

(declare-fun e!142258 () Unit!6475)

(declare-fun lt!111480 () Unit!6475)

(assert (=> b!218683 (= e!142258 lt!111480)))

(declare-fun lt!111492 () ListLongMap!3195)

(declare-fun getCurrentListMapNoExtraKeys!517 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 32) Int) ListLongMap!3195)

(assert (=> b!218683 (= lt!111492 (getCurrentListMapNoExtraKeys!517 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111491 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111487 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111487 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111500 () Unit!6475)

(declare-fun addStillContains!177 (ListLongMap!3195 (_ BitVec 64) V!7305 (_ BitVec 64)) Unit!6475)

(assert (=> b!218683 (= lt!111500 (addStillContains!177 lt!111492 lt!111491 (zeroValue!3969 thiss!1504) lt!111487))))

(declare-fun +!595 (ListLongMap!3195 tuple2!4292) ListLongMap!3195)

(assert (=> b!218683 (contains!1454 (+!595 lt!111492 (tuple2!4293 lt!111491 (zeroValue!3969 thiss!1504))) lt!111487)))

(declare-fun lt!111490 () Unit!6475)

(assert (=> b!218683 (= lt!111490 lt!111500)))

(declare-fun lt!111489 () ListLongMap!3195)

(assert (=> b!218683 (= lt!111489 (getCurrentListMapNoExtraKeys!517 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111479 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111482 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111482 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111498 () Unit!6475)

(declare-fun addApplyDifferent!177 (ListLongMap!3195 (_ BitVec 64) V!7305 (_ BitVec 64)) Unit!6475)

(assert (=> b!218683 (= lt!111498 (addApplyDifferent!177 lt!111489 lt!111479 (minValue!3969 thiss!1504) lt!111482))))

(assert (=> b!218683 (= (apply!201 (+!595 lt!111489 (tuple2!4293 lt!111479 (minValue!3969 thiss!1504))) lt!111482) (apply!201 lt!111489 lt!111482))))

(declare-fun lt!111495 () Unit!6475)

(assert (=> b!218683 (= lt!111495 lt!111498)))

(declare-fun lt!111496 () ListLongMap!3195)

(assert (=> b!218683 (= lt!111496 (getCurrentListMapNoExtraKeys!517 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111493 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111488 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111488 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111485 () Unit!6475)

(assert (=> b!218683 (= lt!111485 (addApplyDifferent!177 lt!111496 lt!111493 (zeroValue!3969 thiss!1504) lt!111488))))

(assert (=> b!218683 (= (apply!201 (+!595 lt!111496 (tuple2!4293 lt!111493 (zeroValue!3969 thiss!1504))) lt!111488) (apply!201 lt!111496 lt!111488))))

(declare-fun lt!111499 () Unit!6475)

(assert (=> b!218683 (= lt!111499 lt!111485)))

(declare-fun lt!111484 () ListLongMap!3195)

(assert (=> b!218683 (= lt!111484 (getCurrentListMapNoExtraKeys!517 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111481 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111481 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111494 () (_ BitVec 64))

(assert (=> b!218683 (= lt!111494 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218683 (= lt!111480 (addApplyDifferent!177 lt!111484 lt!111481 (minValue!3969 thiss!1504) lt!111494))))

(assert (=> b!218683 (= (apply!201 (+!595 lt!111484 (tuple2!4293 lt!111481 (minValue!3969 thiss!1504))) lt!111494) (apply!201 lt!111484 lt!111494))))

(declare-fun b!218684 () Bool)

(declare-fun res!107178 () Bool)

(declare-fun e!142267 () Bool)

(assert (=> b!218684 (=> (not res!107178) (not e!142267))))

(assert (=> b!218684 (= res!107178 e!142265)))

(declare-fun c!36384 () Bool)

(assert (=> b!218684 (= c!36384 (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!218685 () Bool)

(declare-fun e!142266 () Bool)

(assert (=> b!218685 (= e!142266 (validKeyInArray!0 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20412 () Bool)

(assert (=> bm!20412 (= call!20417 (contains!1454 lt!111486 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20413 () Bool)

(declare-fun call!20419 () ListLongMap!3195)

(declare-fun call!20420 () ListLongMap!3195)

(assert (=> bm!20413 (= call!20419 call!20420)))

(declare-fun b!218686 () Bool)

(declare-fun call!20418 () ListLongMap!3195)

(assert (=> b!218686 (= e!142261 call!20418)))

(declare-fun bm!20414 () Bool)

(assert (=> bm!20414 (= call!20415 (contains!1454 lt!111486 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218687 () Bool)

(assert (=> b!218687 (= e!142256 (not call!20415))))

(declare-fun call!20421 () ListLongMap!3195)

(declare-fun bm!20415 () Bool)

(declare-fun c!36381 () Bool)

(declare-fun call!20416 () ListLongMap!3195)

(assert (=> bm!20415 (= call!20421 (+!595 (ite c!36381 call!20416 (ite c!36380 call!20420 call!20419)) (ite (or c!36381 c!36380) (tuple2!4293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3969 thiss!1504)) (tuple2!4293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3969 thiss!1504)))))))

(declare-fun b!218688 () Bool)

(declare-fun e!142263 () Bool)

(declare-fun e!142268 () Bool)

(assert (=> b!218688 (= e!142263 e!142268)))

(declare-fun res!107181 () Bool)

(assert (=> b!218688 (=> (not res!107181) (not e!142268))))

(assert (=> b!218688 (= res!107181 (contains!1454 lt!111486 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!218688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun bm!20416 () Bool)

(assert (=> bm!20416 (= call!20420 call!20416)))

(declare-fun b!218689 () Bool)

(assert (=> b!218689 (= e!142265 e!142262)))

(declare-fun res!107185 () Bool)

(assert (=> b!218689 (= res!107185 call!20417)))

(assert (=> b!218689 (=> (not res!107185) (not e!142262))))

(declare-fun b!218690 () Bool)

(assert (=> b!218690 (= e!142264 call!20418)))

(declare-fun b!218691 () Bool)

(assert (=> b!218691 (= e!142264 call!20419)))

(declare-fun b!218692 () Bool)

(declare-fun res!107183 () Bool)

(assert (=> b!218692 (=> (not res!107183) (not e!142267))))

(assert (=> b!218692 (= res!107183 e!142263)))

(declare-fun res!107180 () Bool)

(assert (=> b!218692 (=> res!107180 e!142263)))

(assert (=> b!218692 (= res!107180 (not e!142257))))

(declare-fun res!107177 () Bool)

(assert (=> b!218692 (=> (not res!107177) (not e!142257))))

(assert (=> b!218692 (= res!107177 (bvslt #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun d!58463 () Bool)

(assert (=> d!58463 e!142267))

(declare-fun res!107184 () Bool)

(assert (=> d!58463 (=> (not res!107184) (not e!142267))))

(assert (=> d!58463 (= res!107184 (or (bvsge #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))))))))

(declare-fun lt!111483 () ListLongMap!3195)

(assert (=> d!58463 (= lt!111486 lt!111483)))

(declare-fun lt!111497 () Unit!6475)

(assert (=> d!58463 (= lt!111497 e!142258)))

(declare-fun c!36382 () Bool)

(assert (=> d!58463 (= c!36382 e!142266)))

(declare-fun res!107182 () Bool)

(assert (=> d!58463 (=> (not res!107182) (not e!142266))))

(assert (=> d!58463 (= res!107182 (bvslt #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))))))

(assert (=> d!58463 (= lt!111483 e!142259)))

(assert (=> d!58463 (= c!36381 (and (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58463 (validMask!0 (mask!9906 thiss!1504))))

(assert (=> d!58463 (= (getCurrentListMap!1122 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) lt!111486)))

(declare-fun b!218682 () Bool)

(declare-fun get!2665 (ValueCell!2528 V!7305) V!7305)

(declare-fun dynLambda!535 (Int (_ BitVec 64)) V!7305)

(assert (=> b!218682 (= e!142268 (= (apply!201 lt!111486 (select (arr!5080 (_keys!6176 thiss!1504)) #b00000000000000000000000000000000)) (get!2665 (select (arr!5079 (_values!4111 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!535 (defaultEntry!4128 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!218682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5412 (_values!4111 thiss!1504))))))

(assert (=> b!218682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))))))

(declare-fun bm!20417 () Bool)

(assert (=> bm!20417 (= call!20416 (getCurrentListMapNoExtraKeys!517 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun b!218693 () Bool)

(assert (=> b!218693 (= e!142260 (= (apply!201 lt!111486 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3969 thiss!1504)))))

(declare-fun b!218694 () Bool)

(assert (=> b!218694 (= e!142267 e!142256)))

(declare-fun c!36383 () Bool)

(assert (=> b!218694 (= c!36383 (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!218695 () Bool)

(assert (=> b!218695 (= e!142259 (+!595 call!20421 (tuple2!4293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3969 thiss!1504))))))

(declare-fun bm!20418 () Bool)

(assert (=> bm!20418 (= call!20418 call!20421)))

(declare-fun b!218696 () Bool)

(declare-fun Unit!6485 () Unit!6475)

(assert (=> b!218696 (= e!142258 Unit!6485)))

(assert (= (and d!58463 c!36381) b!218695))

(assert (= (and d!58463 (not c!36381)) b!218676))

(assert (= (and b!218676 c!36380) b!218686))

(assert (= (and b!218676 (not c!36380)) b!218680))

(assert (= (and b!218680 c!36379) b!218690))

(assert (= (and b!218680 (not c!36379)) b!218691))

(assert (= (or b!218690 b!218691) bm!20413))

(assert (= (or b!218686 bm!20413) bm!20416))

(assert (= (or b!218686 b!218690) bm!20418))

(assert (= (or b!218695 bm!20416) bm!20417))

(assert (= (or b!218695 bm!20418) bm!20415))

(assert (= (and d!58463 res!107182) b!218685))

(assert (= (and d!58463 c!36382) b!218683))

(assert (= (and d!58463 (not c!36382)) b!218696))

(assert (= (and d!58463 res!107184) b!218692))

(assert (= (and b!218692 res!107177) b!218678))

(assert (= (and b!218692 (not res!107180)) b!218688))

(assert (= (and b!218688 res!107181) b!218682))

(assert (= (and b!218692 res!107183) b!218684))

(assert (= (and b!218684 c!36384) b!218689))

(assert (= (and b!218684 (not c!36384)) b!218681))

(assert (= (and b!218689 res!107185) b!218679))

(assert (= (or b!218689 b!218681) bm!20412))

(assert (= (and b!218684 res!107178) b!218694))

(assert (= (and b!218694 c!36383) b!218677))

(assert (= (and b!218694 (not c!36383)) b!218687))

(assert (= (and b!218677 res!107179) b!218693))

(assert (= (or b!218677 b!218687) bm!20414))

(declare-fun b_lambda!7809 () Bool)

(assert (=> (not b_lambda!7809) (not b!218682)))

(declare-fun t!8164 () Bool)

(declare-fun tb!2907 () Bool)

(assert (=> (and b!218483 (= (defaultEntry!4128 thiss!1504) (defaultEntry!4128 thiss!1504)) t!8164) tb!2907))

(declare-fun result!5059 () Bool)

(assert (=> tb!2907 (= result!5059 tp_is_empty!5743)))

(assert (=> b!218682 t!8164))

(declare-fun b_and!12751 () Bool)

(assert (= b_and!12745 (and (=> t!8164 result!5059) b_and!12751)))

(declare-fun m!243937 () Bool)

(assert (=> bm!20414 m!243937))

(declare-fun m!243939 () Bool)

(assert (=> b!218695 m!243939))

(declare-fun m!243941 () Bool)

(assert (=> b!218679 m!243941))

(declare-fun m!243943 () Bool)

(assert (=> b!218683 m!243943))

(declare-fun m!243945 () Bool)

(assert (=> b!218683 m!243945))

(declare-fun m!243947 () Bool)

(assert (=> b!218683 m!243947))

(declare-fun m!243949 () Bool)

(assert (=> b!218683 m!243949))

(declare-fun m!243951 () Bool)

(assert (=> b!218683 m!243951))

(assert (=> b!218683 m!243949))

(declare-fun m!243953 () Bool)

(assert (=> b!218683 m!243953))

(assert (=> b!218683 m!243945))

(declare-fun m!243955 () Bool)

(assert (=> b!218683 m!243955))

(declare-fun m!243957 () Bool)

(assert (=> b!218683 m!243957))

(declare-fun m!243959 () Bool)

(assert (=> b!218683 m!243959))

(declare-fun m!243961 () Bool)

(assert (=> b!218683 m!243961))

(declare-fun m!243963 () Bool)

(assert (=> b!218683 m!243963))

(assert (=> b!218683 m!243915))

(declare-fun m!243965 () Bool)

(assert (=> b!218683 m!243965))

(declare-fun m!243967 () Bool)

(assert (=> b!218683 m!243967))

(declare-fun m!243969 () Bool)

(assert (=> b!218683 m!243969))

(declare-fun m!243971 () Bool)

(assert (=> b!218683 m!243971))

(assert (=> b!218683 m!243957))

(declare-fun m!243973 () Bool)

(assert (=> b!218683 m!243973))

(assert (=> b!218683 m!243959))

(assert (=> b!218678 m!243915))

(assert (=> b!218678 m!243915))

(declare-fun m!243975 () Bool)

(assert (=> b!218678 m!243975))

(declare-fun m!243977 () Bool)

(assert (=> bm!20412 m!243977))

(assert (=> b!218688 m!243915))

(assert (=> b!218688 m!243915))

(declare-fun m!243979 () Bool)

(assert (=> b!218688 m!243979))

(declare-fun m!243981 () Bool)

(assert (=> bm!20415 m!243981))

(declare-fun m!243983 () Bool)

(assert (=> b!218693 m!243983))

(assert (=> b!218685 m!243915))

(assert (=> b!218685 m!243915))

(assert (=> b!218685 m!243975))

(assert (=> bm!20417 m!243951))

(assert (=> d!58463 m!243921))

(declare-fun m!243985 () Bool)

(assert (=> b!218682 m!243985))

(declare-fun m!243987 () Bool)

(assert (=> b!218682 m!243987))

(declare-fun m!243989 () Bool)

(assert (=> b!218682 m!243989))

(assert (=> b!218682 m!243987))

(assert (=> b!218682 m!243915))

(assert (=> b!218682 m!243915))

(declare-fun m!243991 () Bool)

(assert (=> b!218682 m!243991))

(assert (=> b!218682 m!243985))

(assert (=> b!218484 d!58463))

(declare-fun b!218711 () Bool)

(declare-fun e!142277 () SeekEntryResult!786)

(declare-fun e!142276 () SeekEntryResult!786)

(assert (=> b!218711 (= e!142277 e!142276)))

(declare-fun lt!111509 () (_ BitVec 64))

(declare-fun lt!111507 () SeekEntryResult!786)

(assert (=> b!218711 (= lt!111509 (select (arr!5080 (_keys!6176 thiss!1504)) (index!5316 lt!111507)))))

(declare-fun c!36393 () Bool)

(assert (=> b!218711 (= c!36393 (= lt!111509 key!932))))

(declare-fun b!218712 () Bool)

(assert (=> b!218712 (= e!142276 (Found!786 (index!5316 lt!111507)))))

(declare-fun b!218713 () Bool)

(declare-fun c!36391 () Bool)

(assert (=> b!218713 (= c!36391 (= lt!111509 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142275 () SeekEntryResult!786)

(assert (=> b!218713 (= e!142276 e!142275)))

(declare-fun b!218714 () Bool)

(assert (=> b!218714 (= e!142275 (MissingZero!786 (index!5316 lt!111507)))))

(declare-fun d!58465 () Bool)

(declare-fun lt!111508 () SeekEntryResult!786)

(assert (=> d!58465 (and (or ((_ is Undefined!786) lt!111508) (not ((_ is Found!786) lt!111508)) (and (bvsge (index!5315 lt!111508) #b00000000000000000000000000000000) (bvslt (index!5315 lt!111508) (size!5413 (_keys!6176 thiss!1504))))) (or ((_ is Undefined!786) lt!111508) ((_ is Found!786) lt!111508) (not ((_ is MissingZero!786) lt!111508)) (and (bvsge (index!5314 lt!111508) #b00000000000000000000000000000000) (bvslt (index!5314 lt!111508) (size!5413 (_keys!6176 thiss!1504))))) (or ((_ is Undefined!786) lt!111508) ((_ is Found!786) lt!111508) ((_ is MissingZero!786) lt!111508) (not ((_ is MissingVacant!786) lt!111508)) (and (bvsge (index!5317 lt!111508) #b00000000000000000000000000000000) (bvslt (index!5317 lt!111508) (size!5413 (_keys!6176 thiss!1504))))) (or ((_ is Undefined!786) lt!111508) (ite ((_ is Found!786) lt!111508) (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5315 lt!111508)) key!932) (ite ((_ is MissingZero!786) lt!111508) (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5314 lt!111508)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!786) lt!111508) (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5317 lt!111508)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58465 (= lt!111508 e!142277)))

(declare-fun c!36392 () Bool)

(assert (=> d!58465 (= c!36392 (and ((_ is Intermediate!786) lt!111507) (undefined!1598 lt!111507)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10719 (_ BitVec 32)) SeekEntryResult!786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58465 (= lt!111507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9906 thiss!1504)) key!932 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)))))

(assert (=> d!58465 (validMask!0 (mask!9906 thiss!1504))))

(assert (=> d!58465 (= (seekEntryOrOpen!0 key!932 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)) lt!111508)))

(declare-fun b!218715 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10719 (_ BitVec 32)) SeekEntryResult!786)

(assert (=> b!218715 (= e!142275 (seekKeyOrZeroReturnVacant!0 (x!22849 lt!111507) (index!5316 lt!111507) (index!5316 lt!111507) key!932 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)))))

(declare-fun b!218716 () Bool)

(assert (=> b!218716 (= e!142277 Undefined!786)))

(assert (= (and d!58465 c!36392) b!218716))

(assert (= (and d!58465 (not c!36392)) b!218711))

(assert (= (and b!218711 c!36393) b!218712))

(assert (= (and b!218711 (not c!36393)) b!218713))

(assert (= (and b!218713 c!36391) b!218714))

(assert (= (and b!218713 (not c!36391)) b!218715))

(declare-fun m!243993 () Bool)

(assert (=> b!218711 m!243993))

(declare-fun m!243995 () Bool)

(assert (=> d!58465 m!243995))

(declare-fun m!243997 () Bool)

(assert (=> d!58465 m!243997))

(assert (=> d!58465 m!243921))

(declare-fun m!243999 () Bool)

(assert (=> d!58465 m!243999))

(declare-fun m!244001 () Bool)

(assert (=> d!58465 m!244001))

(assert (=> d!58465 m!243995))

(declare-fun m!244003 () Bool)

(assert (=> d!58465 m!244003))

(declare-fun m!244005 () Bool)

(assert (=> b!218715 m!244005))

(assert (=> b!218481 d!58465))

(declare-fun d!58467 () Bool)

(declare-fun res!107192 () Bool)

(declare-fun e!142280 () Bool)

(assert (=> d!58467 (=> (not res!107192) (not e!142280))))

(declare-fun simpleValid!224 (LongMapFixedSize!2956) Bool)

(assert (=> d!58467 (= res!107192 (simpleValid!224 thiss!1504))))

(assert (=> d!58467 (= (valid!1212 thiss!1504) e!142280)))

(declare-fun b!218723 () Bool)

(declare-fun res!107193 () Bool)

(assert (=> b!218723 (=> (not res!107193) (not e!142280))))

(declare-fun arrayCountValidKeys!0 (array!10719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!218723 (= res!107193 (= (arrayCountValidKeys!0 (_keys!6176 thiss!1504) #b00000000000000000000000000000000 (size!5413 (_keys!6176 thiss!1504))) (_size!1527 thiss!1504)))))

(declare-fun b!218724 () Bool)

(declare-fun res!107194 () Bool)

(assert (=> b!218724 (=> (not res!107194) (not e!142280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10719 (_ BitVec 32)) Bool)

(assert (=> b!218724 (= res!107194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)))))

(declare-fun b!218725 () Bool)

(declare-datatypes ((List!3217 0))(
  ( (Nil!3214) (Cons!3213 (h!3860 (_ BitVec 64)) (t!8165 List!3217)) )
))
(declare-fun arrayNoDuplicates!0 (array!10719 (_ BitVec 32) List!3217) Bool)

(assert (=> b!218725 (= e!142280 (arrayNoDuplicates!0 (_keys!6176 thiss!1504) #b00000000000000000000000000000000 Nil!3214))))

(assert (= (and d!58467 res!107192) b!218723))

(assert (= (and b!218723 res!107193) b!218724))

(assert (= (and b!218724 res!107194) b!218725))

(declare-fun m!244007 () Bool)

(assert (=> d!58467 m!244007))

(declare-fun m!244009 () Bool)

(assert (=> b!218723 m!244009))

(declare-fun m!244011 () Bool)

(assert (=> b!218724 m!244011))

(declare-fun m!244013 () Bool)

(assert (=> b!218725 m!244013))

(assert (=> start!21736 d!58467))

(declare-fun d!58469 () Bool)

(assert (=> d!58469 (= (inRange!0 (ite c!36337 (index!5314 lt!111390) (index!5317 lt!111390)) (mask!9906 thiss!1504)) (and (bvsge (ite c!36337 (index!5314 lt!111390) (index!5317 lt!111390)) #b00000000000000000000000000000000) (bvslt (ite c!36337 (index!5314 lt!111390) (index!5317 lt!111390)) (bvadd (mask!9906 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20379 d!58469))

(declare-fun d!58471 () Bool)

(declare-fun e!142283 () Bool)

(assert (=> d!58471 e!142283))

(declare-fun res!107199 () Bool)

(assert (=> d!58471 (=> (not res!107199) (not e!142283))))

(declare-fun lt!111515 () SeekEntryResult!786)

(assert (=> d!58471 (= res!107199 ((_ is Found!786) lt!111515))))

(assert (=> d!58471 (= lt!111515 (seekEntryOrOpen!0 key!932 (_keys!6176 thiss!1504) (mask!9906 thiss!1504)))))

(declare-fun lt!111514 () Unit!6475)

(declare-fun choose!1093 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6475)

(assert (=> d!58471 (= lt!111514 (choose!1093 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> d!58471 (validMask!0 (mask!9906 thiss!1504))))

(assert (=> d!58471 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!187 (_keys!6176 thiss!1504) (_values!4111 thiss!1504) (mask!9906 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)) lt!111514)))

(declare-fun b!218730 () Bool)

(declare-fun res!107200 () Bool)

(assert (=> b!218730 (=> (not res!107200) (not e!142283))))

(assert (=> b!218730 (= res!107200 (inRange!0 (index!5315 lt!111515) (mask!9906 thiss!1504)))))

(declare-fun b!218731 () Bool)

(assert (=> b!218731 (= e!142283 (= (select (arr!5080 (_keys!6176 thiss!1504)) (index!5315 lt!111515)) key!932))))

(assert (=> b!218731 (and (bvsge (index!5315 lt!111515) #b00000000000000000000000000000000) (bvslt (index!5315 lt!111515) (size!5413 (_keys!6176 thiss!1504))))))

(assert (= (and d!58471 res!107199) b!218730))

(assert (= (and b!218730 res!107200) b!218731))

(assert (=> d!58471 m!243855))

(declare-fun m!244015 () Bool)

(assert (=> d!58471 m!244015))

(assert (=> d!58471 m!243921))

(declare-fun m!244017 () Bool)

(assert (=> b!218730 m!244017))

(declare-fun m!244019 () Bool)

(assert (=> b!218731 m!244019))

(assert (=> b!218473 d!58471))

(declare-fun b!218738 () Bool)

(declare-fun e!142288 () Bool)

(assert (=> b!218738 (= e!142288 tp_is_empty!5743)))

(declare-fun condMapEmpty!9786 () Bool)

(declare-fun mapDefault!9786 () ValueCell!2528)

(assert (=> mapNonEmpty!9777 (= condMapEmpty!9786 (= mapRest!9777 ((as const (Array (_ BitVec 32) ValueCell!2528)) mapDefault!9786)))))

(declare-fun e!142289 () Bool)

(declare-fun mapRes!9786 () Bool)

(assert (=> mapNonEmpty!9777 (= tp!20777 (and e!142289 mapRes!9786))))

(declare-fun mapIsEmpty!9786 () Bool)

(assert (=> mapIsEmpty!9786 mapRes!9786))

(declare-fun b!218739 () Bool)

(assert (=> b!218739 (= e!142289 tp_is_empty!5743)))

(declare-fun mapNonEmpty!9786 () Bool)

(declare-fun tp!20793 () Bool)

(assert (=> mapNonEmpty!9786 (= mapRes!9786 (and tp!20793 e!142288))))

(declare-fun mapValue!9786 () ValueCell!2528)

(declare-fun mapRest!9786 () (Array (_ BitVec 32) ValueCell!2528))

(declare-fun mapKey!9786 () (_ BitVec 32))

(assert (=> mapNonEmpty!9786 (= mapRest!9777 (store mapRest!9786 mapKey!9786 mapValue!9786))))

(assert (= (and mapNonEmpty!9777 condMapEmpty!9786) mapIsEmpty!9786))

(assert (= (and mapNonEmpty!9777 (not condMapEmpty!9786)) mapNonEmpty!9786))

(assert (= (and mapNonEmpty!9786 ((_ is ValueCellFull!2528) mapValue!9786)) b!218738))

(assert (= (and mapNonEmpty!9777 ((_ is ValueCellFull!2528) mapDefault!9786)) b!218739))

(declare-fun m!244021 () Bool)

(assert (=> mapNonEmpty!9786 m!244021))

(declare-fun b_lambda!7811 () Bool)

(assert (= b_lambda!7809 (or (and b!218483 b_free!5881) b_lambda!7811)))

(check-sat (not bm!20417) (not b!218688) (not b!218633) (not bm!20397) (not bm!20415) (not b_lambda!7811) (not b!218685) (not b!218600) (not d!58463) (not b_next!5881) (not d!58461) (not b!218678) (not mapNonEmpty!9786) (not b!218679) (not b!218693) tp_is_empty!5743 (not d!58467) (not bm!20414) (not b!218631) (not d!58471) (not bm!20412) (not b!218682) (not b!218724) (not bm!20396) (not b!218695) (not d!58465) (not d!58457) (not b!218683) (not b!218715) b_and!12751 (not b!218723) (not b!218730) (not b!218725))
(check-sat b_and!12751 (not b_next!5881))
