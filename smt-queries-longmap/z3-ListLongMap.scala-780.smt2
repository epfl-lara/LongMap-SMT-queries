; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18466 () Bool)

(assert start!18466)

(declare-fun b!182985 () Bool)

(declare-fun b_free!4519 () Bool)

(declare-fun b_next!4519 () Bool)

(assert (=> b!182985 (= b_free!4519 (not b_next!4519))))

(declare-fun tp!16325 () Bool)

(declare-fun b_and!11061 () Bool)

(assert (=> b!182985 (= tp!16325 b_and!11061)))

(declare-fun b!182980 () Bool)

(declare-fun res!86597 () Bool)

(declare-fun e!120460 () Bool)

(assert (=> b!182980 (=> (not res!86597) (not e!120460))))

(declare-datatypes ((V!5369 0))(
  ( (V!5370 (val!2190 Int)) )
))
(declare-datatypes ((ValueCell!1802 0))(
  ( (ValueCellFull!1802 (v!4086 V!5369)) (EmptyCell!1802) )
))
(declare-datatypes ((array!7753 0))(
  ( (array!7754 (arr!3664 (Array (_ BitVec 32) (_ BitVec 64))) (size!3977 (_ BitVec 32))) )
))
(declare-datatypes ((array!7755 0))(
  ( (array!7756 (arr!3665 (Array (_ BitVec 32) ValueCell!1802)) (size!3978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2512 0))(
  ( (LongMapFixedSize!2513 (defaultEntry!3745 Int) (mask!8802 (_ BitVec 32)) (extraKeys!3482 (_ BitVec 32)) (zeroValue!3586 V!5369) (minValue!3586 V!5369) (_size!1305 (_ BitVec 32)) (_keys!5661 array!7753) (_values!3728 array!7755) (_vacant!1305 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2512)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3386 0))(
  ( (tuple2!3387 (_1!1704 (_ BitVec 64)) (_2!1704 V!5369)) )
))
(declare-datatypes ((List!2327 0))(
  ( (Nil!2324) (Cons!2323 (h!2952 tuple2!3386) (t!7184 List!2327)) )
))
(declare-datatypes ((ListLongMap!2295 0))(
  ( (ListLongMap!2296 (toList!1163 List!2327)) )
))
(declare-fun contains!1255 (ListLongMap!2295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!796 (array!7753 array!7755 (_ BitVec 32) (_ BitVec 32) V!5369 V!5369 (_ BitVec 32) Int) ListLongMap!2295)

(assert (=> b!182980 (= res!86597 (not (contains!1255 (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!7367 () Bool)

(declare-fun mapRes!7367 () Bool)

(declare-fun tp!16324 () Bool)

(declare-fun e!120463 () Bool)

(assert (=> mapNonEmpty!7367 (= mapRes!7367 (and tp!16324 e!120463))))

(declare-fun mapRest!7367 () (Array (_ BitVec 32) ValueCell!1802))

(declare-fun mapValue!7367 () ValueCell!1802)

(declare-fun mapKey!7367 () (_ BitVec 32))

(assert (=> mapNonEmpty!7367 (= (arr!3665 (_values!3728 thiss!1248)) (store mapRest!7367 mapKey!7367 mapValue!7367))))

(declare-fun b!182982 () Bool)

(declare-fun e!120461 () Bool)

(declare-fun tp_is_empty!4291 () Bool)

(assert (=> b!182982 (= e!120461 tp_is_empty!4291)))

(declare-fun b!182983 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182983 (= e!120460 (not (validMask!0 (mask!8802 thiss!1248))))))

(declare-fun b!182984 () Bool)

(declare-fun e!120462 () Bool)

(assert (=> b!182984 (= e!120462 e!120460)))

(declare-fun res!86599 () Bool)

(assert (=> b!182984 (=> (not res!86599) (not e!120460))))

(declare-datatypes ((SeekEntryResult!622 0))(
  ( (MissingZero!622 (index!4658 (_ BitVec 32))) (Found!622 (index!4659 (_ BitVec 32))) (Intermediate!622 (undefined!1434 Bool) (index!4660 (_ BitVec 32)) (x!19957 (_ BitVec 32))) (Undefined!622) (MissingVacant!622 (index!4661 (_ BitVec 32))) )
))
(declare-fun lt!90342 () SeekEntryResult!622)

(get-info :version)

(assert (=> b!182984 (= res!86599 (and (not ((_ is Undefined!622) lt!90342)) (not ((_ is MissingVacant!622) lt!90342)) (not ((_ is MissingZero!622) lt!90342)) ((_ is Found!622) lt!90342)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7753 (_ BitVec 32)) SeekEntryResult!622)

(assert (=> b!182984 (= lt!90342 (seekEntryOrOpen!0 key!828 (_keys!5661 thiss!1248) (mask!8802 thiss!1248)))))

(declare-fun e!120464 () Bool)

(declare-fun e!120465 () Bool)

(declare-fun array_inv!2371 (array!7753) Bool)

(declare-fun array_inv!2372 (array!7755) Bool)

(assert (=> b!182985 (= e!120464 (and tp!16325 tp_is_empty!4291 (array_inv!2371 (_keys!5661 thiss!1248)) (array_inv!2372 (_values!3728 thiss!1248)) e!120465))))

(declare-fun mapIsEmpty!7367 () Bool)

(assert (=> mapIsEmpty!7367 mapRes!7367))

(declare-fun b!182986 () Bool)

(assert (=> b!182986 (= e!120463 tp_is_empty!4291)))

(declare-fun b!182987 () Bool)

(assert (=> b!182987 (= e!120465 (and e!120461 mapRes!7367))))

(declare-fun condMapEmpty!7367 () Bool)

(declare-fun mapDefault!7367 () ValueCell!1802)

(assert (=> b!182987 (= condMapEmpty!7367 (= (arr!3665 (_values!3728 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1802)) mapDefault!7367)))))

(declare-fun b!182981 () Bool)

(declare-fun res!86598 () Bool)

(assert (=> b!182981 (=> (not res!86598) (not e!120462))))

(assert (=> b!182981 (= res!86598 (not (= key!828 (bvneg key!828))))))

(declare-fun res!86596 () Bool)

(assert (=> start!18466 (=> (not res!86596) (not e!120462))))

(declare-fun valid!1057 (LongMapFixedSize!2512) Bool)

(assert (=> start!18466 (= res!86596 (valid!1057 thiss!1248))))

(assert (=> start!18466 e!120462))

(assert (=> start!18466 e!120464))

(assert (=> start!18466 true))

(assert (= (and start!18466 res!86596) b!182981))

(assert (= (and b!182981 res!86598) b!182984))

(assert (= (and b!182984 res!86599) b!182980))

(assert (= (and b!182980 res!86597) b!182983))

(assert (= (and b!182987 condMapEmpty!7367) mapIsEmpty!7367))

(assert (= (and b!182987 (not condMapEmpty!7367)) mapNonEmpty!7367))

(assert (= (and mapNonEmpty!7367 ((_ is ValueCellFull!1802) mapValue!7367)) b!182986))

(assert (= (and b!182987 ((_ is ValueCellFull!1802) mapDefault!7367)) b!182982))

(assert (= b!182985 b!182987))

(assert (= start!18466 b!182985))

(declare-fun m!210077 () Bool)

(assert (=> b!182984 m!210077))

(declare-fun m!210079 () Bool)

(assert (=> start!18466 m!210079))

(declare-fun m!210081 () Bool)

(assert (=> b!182980 m!210081))

(assert (=> b!182980 m!210081))

(declare-fun m!210083 () Bool)

(assert (=> b!182980 m!210083))

(declare-fun m!210085 () Bool)

(assert (=> b!182985 m!210085))

(declare-fun m!210087 () Bool)

(assert (=> b!182985 m!210087))

(declare-fun m!210089 () Bool)

(assert (=> b!182983 m!210089))

(declare-fun m!210091 () Bool)

(assert (=> mapNonEmpty!7367 m!210091))

(check-sat (not b!182980) (not b!182984) (not start!18466) (not b!182985) (not mapNonEmpty!7367) (not b_next!4519) tp_is_empty!4291 (not b!182983) b_and!11061)
(check-sat b_and!11061 (not b_next!4519))
(get-model)

(declare-fun d!54539 () Bool)

(assert (=> d!54539 (= (array_inv!2371 (_keys!5661 thiss!1248)) (bvsge (size!3977 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182985 d!54539))

(declare-fun d!54541 () Bool)

(assert (=> d!54541 (= (array_inv!2372 (_values!3728 thiss!1248)) (bvsge (size!3978 (_values!3728 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182985 d!54541))

(declare-fun d!54543 () Bool)

(declare-fun e!120512 () Bool)

(assert (=> d!54543 e!120512))

(declare-fun res!86626 () Bool)

(assert (=> d!54543 (=> res!86626 e!120512)))

(declare-fun lt!90360 () Bool)

(assert (=> d!54543 (= res!86626 (not lt!90360))))

(declare-fun lt!90359 () Bool)

(assert (=> d!54543 (= lt!90360 lt!90359)))

(declare-datatypes ((Unit!5515 0))(
  ( (Unit!5516) )
))
(declare-fun lt!90358 () Unit!5515)

(declare-fun e!120513 () Unit!5515)

(assert (=> d!54543 (= lt!90358 e!120513)))

(declare-fun c!32794 () Bool)

(assert (=> d!54543 (= c!32794 lt!90359)))

(declare-fun containsKey!217 (List!2327 (_ BitVec 64)) Bool)

(assert (=> d!54543 (= lt!90359 (containsKey!217 (toList!1163 (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828))))

(assert (=> d!54543 (= (contains!1255 (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)) key!828) lt!90360)))

(declare-fun b!183042 () Bool)

(declare-fun lt!90357 () Unit!5515)

(assert (=> b!183042 (= e!120513 lt!90357)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!166 (List!2327 (_ BitVec 64)) Unit!5515)

(assert (=> b!183042 (= lt!90357 (lemmaContainsKeyImpliesGetValueByKeyDefined!166 (toList!1163 (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828))))

(declare-datatypes ((Option!219 0))(
  ( (Some!218 (v!4089 V!5369)) (None!217) )
))
(declare-fun isDefined!167 (Option!219) Bool)

(declare-fun getValueByKey!213 (List!2327 (_ BitVec 64)) Option!219)

(assert (=> b!183042 (isDefined!167 (getValueByKey!213 (toList!1163 (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828))))

(declare-fun b!183043 () Bool)

(declare-fun Unit!5517 () Unit!5515)

(assert (=> b!183043 (= e!120513 Unit!5517)))

(declare-fun b!183044 () Bool)

(assert (=> b!183044 (= e!120512 (isDefined!167 (getValueByKey!213 (toList!1163 (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828)))))

(assert (= (and d!54543 c!32794) b!183042))

(assert (= (and d!54543 (not c!32794)) b!183043))

(assert (= (and d!54543 (not res!86626)) b!183044))

(declare-fun m!210125 () Bool)

(assert (=> d!54543 m!210125))

(declare-fun m!210127 () Bool)

(assert (=> b!183042 m!210127))

(declare-fun m!210129 () Bool)

(assert (=> b!183042 m!210129))

(assert (=> b!183042 m!210129))

(declare-fun m!210131 () Bool)

(assert (=> b!183042 m!210131))

(assert (=> b!183044 m!210129))

(assert (=> b!183044 m!210129))

(assert (=> b!183044 m!210131))

(assert (=> b!182980 d!54543))

(declare-fun b!183087 () Bool)

(declare-fun e!120546 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183087 (= e!120546 (validKeyInArray!0 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183088 () Bool)

(declare-fun e!120542 () Bool)

(declare-fun e!120550 () Bool)

(assert (=> b!183088 (= e!120542 e!120550)))

(declare-fun c!32810 () Bool)

(assert (=> b!183088 (= c!32810 (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183089 () Bool)

(declare-fun e!120545 () Bool)

(declare-fun call!18481 () Bool)

(assert (=> b!183089 (= e!120545 (not call!18481))))

(declare-fun b!183090 () Bool)

(declare-fun e!120549 () Bool)

(assert (=> b!183090 (= e!120545 e!120549)))

(declare-fun res!86648 () Bool)

(assert (=> b!183090 (= res!86648 call!18481)))

(assert (=> b!183090 (=> (not res!86648) (not e!120549))))

(declare-fun b!183092 () Bool)

(declare-fun e!120540 () ListLongMap!2295)

(declare-fun call!18482 () ListLongMap!2295)

(assert (=> b!183092 (= e!120540 call!18482)))

(declare-fun b!183093 () Bool)

(declare-fun e!120544 () ListLongMap!2295)

(declare-fun call!18483 () ListLongMap!2295)

(assert (=> b!183093 (= e!120544 call!18483)))

(declare-fun b!183094 () Bool)

(assert (=> b!183094 (= e!120540 call!18483)))

(declare-fun b!183095 () Bool)

(declare-fun e!120543 () Bool)

(assert (=> b!183095 (= e!120550 e!120543)))

(declare-fun res!86645 () Bool)

(declare-fun call!18478 () Bool)

(assert (=> b!183095 (= res!86645 call!18478)))

(assert (=> b!183095 (=> (not res!86645) (not e!120543))))

(declare-fun bm!18475 () Bool)

(declare-fun lt!90414 () ListLongMap!2295)

(assert (=> bm!18475 (= call!18481 (contains!1255 lt!90414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183096 () Bool)

(declare-fun e!120551 () Unit!5515)

(declare-fun Unit!5518 () Unit!5515)

(assert (=> b!183096 (= e!120551 Unit!5518)))

(declare-fun b!183097 () Bool)

(declare-fun res!86652 () Bool)

(assert (=> b!183097 (=> (not res!86652) (not e!120542))))

(declare-fun e!120552 () Bool)

(assert (=> b!183097 (= res!86652 e!120552)))

(declare-fun res!86651 () Bool)

(assert (=> b!183097 (=> res!86651 e!120552)))

(declare-fun e!120547 () Bool)

(assert (=> b!183097 (= res!86651 (not e!120547))))

(declare-fun res!86653 () Bool)

(assert (=> b!183097 (=> (not res!86653) (not e!120547))))

(assert (=> b!183097 (= res!86653 (bvslt #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))))))

(declare-fun b!183098 () Bool)

(declare-fun apply!158 (ListLongMap!2295 (_ BitVec 64)) V!5369)

(assert (=> b!183098 (= e!120543 (= (apply!158 lt!90414 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3586 thiss!1248)))))

(declare-fun b!183099 () Bool)

(assert (=> b!183099 (= e!120547 (validKeyInArray!0 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18476 () Bool)

(declare-fun call!18484 () ListLongMap!2295)

(assert (=> bm!18476 (= call!18483 call!18484)))

(declare-fun b!183100 () Bool)

(declare-fun res!86649 () Bool)

(assert (=> b!183100 (=> (not res!86649) (not e!120542))))

(assert (=> b!183100 (= res!86649 e!120545)))

(declare-fun c!32809 () Bool)

(assert (=> b!183100 (= c!32809 (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183101 () Bool)

(declare-fun c!32811 () Bool)

(assert (=> b!183101 (= c!32811 (and (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!183101 (= e!120544 e!120540)))

(declare-fun c!32812 () Bool)

(declare-fun bm!18477 () Bool)

(declare-fun call!18479 () ListLongMap!2295)

(declare-fun c!32808 () Bool)

(declare-fun call!18480 () ListLongMap!2295)

(declare-fun +!275 (ListLongMap!2295 tuple2!3386) ListLongMap!2295)

(assert (=> bm!18477 (= call!18484 (+!275 (ite c!32808 call!18480 (ite c!32812 call!18479 call!18482)) (ite (or c!32808 c!32812) (tuple2!3387 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3586 thiss!1248)) (tuple2!3387 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3586 thiss!1248)))))))

(declare-fun bm!18478 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!179 (array!7753 array!7755 (_ BitVec 32) (_ BitVec 32) V!5369 V!5369 (_ BitVec 32) Int) ListLongMap!2295)

(assert (=> bm!18478 (= call!18480 (getCurrentListMapNoExtraKeys!179 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun b!183102 () Bool)

(assert (=> b!183102 (= e!120549 (= (apply!158 lt!90414 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3586 thiss!1248)))))

(declare-fun bm!18479 () Bool)

(assert (=> bm!18479 (= call!18479 call!18480)))

(declare-fun bm!18480 () Bool)

(assert (=> bm!18480 (= call!18478 (contains!1255 lt!90414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183103 () Bool)

(declare-fun e!120548 () ListLongMap!2295)

(assert (=> b!183103 (= e!120548 e!120544)))

(assert (=> b!183103 (= c!32812 (and (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183104 () Bool)

(assert (=> b!183104 (= e!120548 (+!275 call!18484 (tuple2!3387 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3586 thiss!1248))))))

(declare-fun bm!18481 () Bool)

(assert (=> bm!18481 (= call!18482 call!18479)))

(declare-fun b!183105 () Bool)

(assert (=> b!183105 (= e!120550 (not call!18478))))

(declare-fun d!54545 () Bool)

(assert (=> d!54545 e!120542))

(declare-fun res!86650 () Bool)

(assert (=> d!54545 (=> (not res!86650) (not e!120542))))

(assert (=> d!54545 (= res!86650 (or (bvsge #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))))))))

(declare-fun lt!90426 () ListLongMap!2295)

(assert (=> d!54545 (= lt!90414 lt!90426)))

(declare-fun lt!90407 () Unit!5515)

(assert (=> d!54545 (= lt!90407 e!120551)))

(declare-fun c!32807 () Bool)

(assert (=> d!54545 (= c!32807 e!120546)))

(declare-fun res!86647 () Bool)

(assert (=> d!54545 (=> (not res!86647) (not e!120546))))

(assert (=> d!54545 (= res!86647 (bvslt #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))))))

(assert (=> d!54545 (= lt!90426 e!120548)))

(assert (=> d!54545 (= c!32808 (and (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54545 (validMask!0 (mask!8802 thiss!1248))))

(assert (=> d!54545 (= (getCurrentListMap!796 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)) lt!90414)))

(declare-fun b!183091 () Bool)

(declare-fun e!120541 () Bool)

(declare-fun get!2099 (ValueCell!1802 V!5369) V!5369)

(declare-fun dynLambda!492 (Int (_ BitVec 64)) V!5369)

(assert (=> b!183091 (= e!120541 (= (apply!158 lt!90414 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000)) (get!2099 (select (arr!3665 (_values!3728 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!492 (defaultEntry!3745 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3978 (_values!3728 thiss!1248))))))

(assert (=> b!183091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))))))

(declare-fun b!183106 () Bool)

(assert (=> b!183106 (= e!120552 e!120541)))

(declare-fun res!86646 () Bool)

(assert (=> b!183106 (=> (not res!86646) (not e!120541))))

(assert (=> b!183106 (= res!86646 (contains!1255 lt!90414 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))))))

(declare-fun b!183107 () Bool)

(declare-fun lt!90425 () Unit!5515)

(assert (=> b!183107 (= e!120551 lt!90425)))

(declare-fun lt!90422 () ListLongMap!2295)

(assert (=> b!183107 (= lt!90422 (getCurrentListMapNoExtraKeys!179 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90415 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90415 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90405 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90405 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90416 () Unit!5515)

(declare-fun addStillContains!134 (ListLongMap!2295 (_ BitVec 64) V!5369 (_ BitVec 64)) Unit!5515)

(assert (=> b!183107 (= lt!90416 (addStillContains!134 lt!90422 lt!90415 (zeroValue!3586 thiss!1248) lt!90405))))

(assert (=> b!183107 (contains!1255 (+!275 lt!90422 (tuple2!3387 lt!90415 (zeroValue!3586 thiss!1248))) lt!90405)))

(declare-fun lt!90420 () Unit!5515)

(assert (=> b!183107 (= lt!90420 lt!90416)))

(declare-fun lt!90421 () ListLongMap!2295)

(assert (=> b!183107 (= lt!90421 (getCurrentListMapNoExtraKeys!179 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90417 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90419 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90419 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90411 () Unit!5515)

(declare-fun addApplyDifferent!134 (ListLongMap!2295 (_ BitVec 64) V!5369 (_ BitVec 64)) Unit!5515)

(assert (=> b!183107 (= lt!90411 (addApplyDifferent!134 lt!90421 lt!90417 (minValue!3586 thiss!1248) lt!90419))))

(assert (=> b!183107 (= (apply!158 (+!275 lt!90421 (tuple2!3387 lt!90417 (minValue!3586 thiss!1248))) lt!90419) (apply!158 lt!90421 lt!90419))))

(declare-fun lt!90423 () Unit!5515)

(assert (=> b!183107 (= lt!90423 lt!90411)))

(declare-fun lt!90409 () ListLongMap!2295)

(assert (=> b!183107 (= lt!90409 (getCurrentListMapNoExtraKeys!179 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90413 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90408 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90408 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90412 () Unit!5515)

(assert (=> b!183107 (= lt!90412 (addApplyDifferent!134 lt!90409 lt!90413 (zeroValue!3586 thiss!1248) lt!90408))))

(assert (=> b!183107 (= (apply!158 (+!275 lt!90409 (tuple2!3387 lt!90413 (zeroValue!3586 thiss!1248))) lt!90408) (apply!158 lt!90409 lt!90408))))

(declare-fun lt!90424 () Unit!5515)

(assert (=> b!183107 (= lt!90424 lt!90412)))

(declare-fun lt!90406 () ListLongMap!2295)

(assert (=> b!183107 (= lt!90406 (getCurrentListMapNoExtraKeys!179 (_keys!5661 thiss!1248) (_values!3728 thiss!1248) (mask!8802 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90410 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90410 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90418 () (_ BitVec 64))

(assert (=> b!183107 (= lt!90418 (select (arr!3664 (_keys!5661 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183107 (= lt!90425 (addApplyDifferent!134 lt!90406 lt!90410 (minValue!3586 thiss!1248) lt!90418))))

(assert (=> b!183107 (= (apply!158 (+!275 lt!90406 (tuple2!3387 lt!90410 (minValue!3586 thiss!1248))) lt!90418) (apply!158 lt!90406 lt!90418))))

(assert (= (and d!54545 c!32808) b!183104))

(assert (= (and d!54545 (not c!32808)) b!183103))

(assert (= (and b!183103 c!32812) b!183093))

(assert (= (and b!183103 (not c!32812)) b!183101))

(assert (= (and b!183101 c!32811) b!183094))

(assert (= (and b!183101 (not c!32811)) b!183092))

(assert (= (or b!183094 b!183092) bm!18481))

(assert (= (or b!183093 bm!18481) bm!18479))

(assert (= (or b!183093 b!183094) bm!18476))

(assert (= (or b!183104 bm!18479) bm!18478))

(assert (= (or b!183104 bm!18476) bm!18477))

(assert (= (and d!54545 res!86647) b!183087))

(assert (= (and d!54545 c!32807) b!183107))

(assert (= (and d!54545 (not c!32807)) b!183096))

(assert (= (and d!54545 res!86650) b!183097))

(assert (= (and b!183097 res!86653) b!183099))

(assert (= (and b!183097 (not res!86651)) b!183106))

(assert (= (and b!183106 res!86646) b!183091))

(assert (= (and b!183097 res!86652) b!183100))

(assert (= (and b!183100 c!32809) b!183090))

(assert (= (and b!183100 (not c!32809)) b!183089))

(assert (= (and b!183090 res!86648) b!183102))

(assert (= (or b!183090 b!183089) bm!18475))

(assert (= (and b!183100 res!86649) b!183088))

(assert (= (and b!183088 c!32810) b!183095))

(assert (= (and b!183088 (not c!32810)) b!183105))

(assert (= (and b!183095 res!86645) b!183098))

(assert (= (or b!183095 b!183105) bm!18480))

(declare-fun b_lambda!7169 () Bool)

(assert (=> (not b_lambda!7169) (not b!183091)))

(declare-fun t!7186 () Bool)

(declare-fun tb!2819 () Bool)

(assert (=> (and b!182985 (= (defaultEntry!3745 thiss!1248) (defaultEntry!3745 thiss!1248)) t!7186) tb!2819))

(declare-fun result!4751 () Bool)

(assert (=> tb!2819 (= result!4751 tp_is_empty!4291)))

(assert (=> b!183091 t!7186))

(declare-fun b_and!11067 () Bool)

(assert (= b_and!11061 (and (=> t!7186 result!4751) b_and!11067)))

(declare-fun m!210133 () Bool)

(assert (=> b!183107 m!210133))

(declare-fun m!210135 () Bool)

(assert (=> b!183107 m!210135))

(declare-fun m!210137 () Bool)

(assert (=> b!183107 m!210137))

(declare-fun m!210139 () Bool)

(assert (=> b!183107 m!210139))

(declare-fun m!210141 () Bool)

(assert (=> b!183107 m!210141))

(declare-fun m!210143 () Bool)

(assert (=> b!183107 m!210143))

(declare-fun m!210145 () Bool)

(assert (=> b!183107 m!210145))

(declare-fun m!210147 () Bool)

(assert (=> b!183107 m!210147))

(declare-fun m!210149 () Bool)

(assert (=> b!183107 m!210149))

(declare-fun m!210151 () Bool)

(assert (=> b!183107 m!210151))

(assert (=> b!183107 m!210139))

(declare-fun m!210153 () Bool)

(assert (=> b!183107 m!210153))

(assert (=> b!183107 m!210151))

(declare-fun m!210155 () Bool)

(assert (=> b!183107 m!210155))

(declare-fun m!210157 () Bool)

(assert (=> b!183107 m!210157))

(assert (=> b!183107 m!210157))

(declare-fun m!210159 () Bool)

(assert (=> b!183107 m!210159))

(declare-fun m!210161 () Bool)

(assert (=> b!183107 m!210161))

(assert (=> b!183107 m!210141))

(declare-fun m!210163 () Bool)

(assert (=> b!183107 m!210163))

(declare-fun m!210165 () Bool)

(assert (=> b!183107 m!210165))

(declare-fun m!210167 () Bool)

(assert (=> b!183102 m!210167))

(assert (=> b!183091 m!210149))

(declare-fun m!210169 () Bool)

(assert (=> b!183091 m!210169))

(declare-fun m!210171 () Bool)

(assert (=> b!183091 m!210171))

(assert (=> b!183091 m!210149))

(declare-fun m!210173 () Bool)

(assert (=> b!183091 m!210173))

(assert (=> b!183091 m!210171))

(assert (=> b!183091 m!210169))

(declare-fun m!210175 () Bool)

(assert (=> b!183091 m!210175))

(declare-fun m!210177 () Bool)

(assert (=> bm!18480 m!210177))

(declare-fun m!210179 () Bool)

(assert (=> bm!18475 m!210179))

(assert (=> b!183106 m!210149))

(assert (=> b!183106 m!210149))

(declare-fun m!210181 () Bool)

(assert (=> b!183106 m!210181))

(assert (=> d!54545 m!210089))

(declare-fun m!210183 () Bool)

(assert (=> bm!18477 m!210183))

(declare-fun m!210185 () Bool)

(assert (=> b!183098 m!210185))

(declare-fun m!210187 () Bool)

(assert (=> b!183104 m!210187))

(assert (=> b!183099 m!210149))

(assert (=> b!183099 m!210149))

(declare-fun m!210189 () Bool)

(assert (=> b!183099 m!210189))

(assert (=> bm!18478 m!210165))

(assert (=> b!183087 m!210149))

(assert (=> b!183087 m!210149))

(assert (=> b!183087 m!210189))

(assert (=> b!182980 d!54545))

(declare-fun d!54547 () Bool)

(declare-fun res!86660 () Bool)

(declare-fun e!120555 () Bool)

(assert (=> d!54547 (=> (not res!86660) (not e!120555))))

(declare-fun simpleValid!174 (LongMapFixedSize!2512) Bool)

(assert (=> d!54547 (= res!86660 (simpleValid!174 thiss!1248))))

(assert (=> d!54547 (= (valid!1057 thiss!1248) e!120555)))

(declare-fun b!183116 () Bool)

(declare-fun res!86661 () Bool)

(assert (=> b!183116 (=> (not res!86661) (not e!120555))))

(declare-fun arrayCountValidKeys!0 (array!7753 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183116 (= res!86661 (= (arrayCountValidKeys!0 (_keys!5661 thiss!1248) #b00000000000000000000000000000000 (size!3977 (_keys!5661 thiss!1248))) (_size!1305 thiss!1248)))))

(declare-fun b!183117 () Bool)

(declare-fun res!86662 () Bool)

(assert (=> b!183117 (=> (not res!86662) (not e!120555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7753 (_ BitVec 32)) Bool)

(assert (=> b!183117 (= res!86662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5661 thiss!1248) (mask!8802 thiss!1248)))))

(declare-fun b!183118 () Bool)

(declare-datatypes ((List!2328 0))(
  ( (Nil!2325) (Cons!2324 (h!2953 (_ BitVec 64)) (t!7187 List!2328)) )
))
(declare-fun arrayNoDuplicates!0 (array!7753 (_ BitVec 32) List!2328) Bool)

(assert (=> b!183118 (= e!120555 (arrayNoDuplicates!0 (_keys!5661 thiss!1248) #b00000000000000000000000000000000 Nil!2325))))

(assert (= (and d!54547 res!86660) b!183116))

(assert (= (and b!183116 res!86661) b!183117))

(assert (= (and b!183117 res!86662) b!183118))

(declare-fun m!210191 () Bool)

(assert (=> d!54547 m!210191))

(declare-fun m!210193 () Bool)

(assert (=> b!183116 m!210193))

(declare-fun m!210195 () Bool)

(assert (=> b!183117 m!210195))

(declare-fun m!210197 () Bool)

(assert (=> b!183118 m!210197))

(assert (=> start!18466 d!54547))

(declare-fun b!183131 () Bool)

(declare-fun e!120564 () SeekEntryResult!622)

(declare-fun lt!90434 () SeekEntryResult!622)

(assert (=> b!183131 (= e!120564 (Found!622 (index!4660 lt!90434)))))

(declare-fun b!183132 () Bool)

(declare-fun e!120562 () SeekEntryResult!622)

(assert (=> b!183132 (= e!120562 Undefined!622)))

(declare-fun b!183133 () Bool)

(declare-fun e!120563 () SeekEntryResult!622)

(assert (=> b!183133 (= e!120563 (MissingZero!622 (index!4660 lt!90434)))))

(declare-fun b!183134 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7753 (_ BitVec 32)) SeekEntryResult!622)

(assert (=> b!183134 (= e!120563 (seekKeyOrZeroReturnVacant!0 (x!19957 lt!90434) (index!4660 lt!90434) (index!4660 lt!90434) key!828 (_keys!5661 thiss!1248) (mask!8802 thiss!1248)))))

(declare-fun d!54549 () Bool)

(declare-fun lt!90433 () SeekEntryResult!622)

(assert (=> d!54549 (and (or ((_ is Undefined!622) lt!90433) (not ((_ is Found!622) lt!90433)) (and (bvsge (index!4659 lt!90433) #b00000000000000000000000000000000) (bvslt (index!4659 lt!90433) (size!3977 (_keys!5661 thiss!1248))))) (or ((_ is Undefined!622) lt!90433) ((_ is Found!622) lt!90433) (not ((_ is MissingZero!622) lt!90433)) (and (bvsge (index!4658 lt!90433) #b00000000000000000000000000000000) (bvslt (index!4658 lt!90433) (size!3977 (_keys!5661 thiss!1248))))) (or ((_ is Undefined!622) lt!90433) ((_ is Found!622) lt!90433) ((_ is MissingZero!622) lt!90433) (not ((_ is MissingVacant!622) lt!90433)) (and (bvsge (index!4661 lt!90433) #b00000000000000000000000000000000) (bvslt (index!4661 lt!90433) (size!3977 (_keys!5661 thiss!1248))))) (or ((_ is Undefined!622) lt!90433) (ite ((_ is Found!622) lt!90433) (= (select (arr!3664 (_keys!5661 thiss!1248)) (index!4659 lt!90433)) key!828) (ite ((_ is MissingZero!622) lt!90433) (= (select (arr!3664 (_keys!5661 thiss!1248)) (index!4658 lt!90433)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!622) lt!90433) (= (select (arr!3664 (_keys!5661 thiss!1248)) (index!4661 lt!90433)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54549 (= lt!90433 e!120562)))

(declare-fun c!32819 () Bool)

(assert (=> d!54549 (= c!32819 (and ((_ is Intermediate!622) lt!90434) (undefined!1434 lt!90434)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7753 (_ BitVec 32)) SeekEntryResult!622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54549 (= lt!90434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8802 thiss!1248)) key!828 (_keys!5661 thiss!1248) (mask!8802 thiss!1248)))))

(assert (=> d!54549 (validMask!0 (mask!8802 thiss!1248))))

(assert (=> d!54549 (= (seekEntryOrOpen!0 key!828 (_keys!5661 thiss!1248) (mask!8802 thiss!1248)) lt!90433)))

(declare-fun b!183135 () Bool)

(declare-fun c!32821 () Bool)

(declare-fun lt!90435 () (_ BitVec 64))

(assert (=> b!183135 (= c!32821 (= lt!90435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183135 (= e!120564 e!120563)))

(declare-fun b!183136 () Bool)

(assert (=> b!183136 (= e!120562 e!120564)))

(assert (=> b!183136 (= lt!90435 (select (arr!3664 (_keys!5661 thiss!1248)) (index!4660 lt!90434)))))

(declare-fun c!32820 () Bool)

(assert (=> b!183136 (= c!32820 (= lt!90435 key!828))))

(assert (= (and d!54549 c!32819) b!183132))

(assert (= (and d!54549 (not c!32819)) b!183136))

(assert (= (and b!183136 c!32820) b!183131))

(assert (= (and b!183136 (not c!32820)) b!183135))

(assert (= (and b!183135 c!32821) b!183133))

(assert (= (and b!183135 (not c!32821)) b!183134))

(declare-fun m!210199 () Bool)

(assert (=> b!183134 m!210199))

(declare-fun m!210201 () Bool)

(assert (=> d!54549 m!210201))

(declare-fun m!210203 () Bool)

(assert (=> d!54549 m!210203))

(declare-fun m!210205 () Bool)

(assert (=> d!54549 m!210205))

(assert (=> d!54549 m!210201))

(declare-fun m!210207 () Bool)

(assert (=> d!54549 m!210207))

(declare-fun m!210209 () Bool)

(assert (=> d!54549 m!210209))

(assert (=> d!54549 m!210089))

(declare-fun m!210211 () Bool)

(assert (=> b!183136 m!210211))

(assert (=> b!182984 d!54549))

(declare-fun d!54551 () Bool)

(assert (=> d!54551 (= (validMask!0 (mask!8802 thiss!1248)) (and (or (= (mask!8802 thiss!1248) #b00000000000000000000000000000111) (= (mask!8802 thiss!1248) #b00000000000000000000000000001111) (= (mask!8802 thiss!1248) #b00000000000000000000000000011111) (= (mask!8802 thiss!1248) #b00000000000000000000000000111111) (= (mask!8802 thiss!1248) #b00000000000000000000000001111111) (= (mask!8802 thiss!1248) #b00000000000000000000000011111111) (= (mask!8802 thiss!1248) #b00000000000000000000000111111111) (= (mask!8802 thiss!1248) #b00000000000000000000001111111111) (= (mask!8802 thiss!1248) #b00000000000000000000011111111111) (= (mask!8802 thiss!1248) #b00000000000000000000111111111111) (= (mask!8802 thiss!1248) #b00000000000000000001111111111111) (= (mask!8802 thiss!1248) #b00000000000000000011111111111111) (= (mask!8802 thiss!1248) #b00000000000000000111111111111111) (= (mask!8802 thiss!1248) #b00000000000000001111111111111111) (= (mask!8802 thiss!1248) #b00000000000000011111111111111111) (= (mask!8802 thiss!1248) #b00000000000000111111111111111111) (= (mask!8802 thiss!1248) #b00000000000001111111111111111111) (= (mask!8802 thiss!1248) #b00000000000011111111111111111111) (= (mask!8802 thiss!1248) #b00000000000111111111111111111111) (= (mask!8802 thiss!1248) #b00000000001111111111111111111111) (= (mask!8802 thiss!1248) #b00000000011111111111111111111111) (= (mask!8802 thiss!1248) #b00000000111111111111111111111111) (= (mask!8802 thiss!1248) #b00000001111111111111111111111111) (= (mask!8802 thiss!1248) #b00000011111111111111111111111111) (= (mask!8802 thiss!1248) #b00000111111111111111111111111111) (= (mask!8802 thiss!1248) #b00001111111111111111111111111111) (= (mask!8802 thiss!1248) #b00011111111111111111111111111111) (= (mask!8802 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8802 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182983 d!54551))

(declare-fun b!183143 () Bool)

(declare-fun e!120569 () Bool)

(assert (=> b!183143 (= e!120569 tp_is_empty!4291)))

(declare-fun mapIsEmpty!7376 () Bool)

(declare-fun mapRes!7376 () Bool)

(assert (=> mapIsEmpty!7376 mapRes!7376))

(declare-fun condMapEmpty!7376 () Bool)

(declare-fun mapDefault!7376 () ValueCell!1802)

(assert (=> mapNonEmpty!7367 (= condMapEmpty!7376 (= mapRest!7367 ((as const (Array (_ BitVec 32) ValueCell!1802)) mapDefault!7376)))))

(declare-fun e!120570 () Bool)

(assert (=> mapNonEmpty!7367 (= tp!16324 (and e!120570 mapRes!7376))))

(declare-fun b!183144 () Bool)

(assert (=> b!183144 (= e!120570 tp_is_empty!4291)))

(declare-fun mapNonEmpty!7376 () Bool)

(declare-fun tp!16340 () Bool)

(assert (=> mapNonEmpty!7376 (= mapRes!7376 (and tp!16340 e!120569))))

(declare-fun mapValue!7376 () ValueCell!1802)

(declare-fun mapRest!7376 () (Array (_ BitVec 32) ValueCell!1802))

(declare-fun mapKey!7376 () (_ BitVec 32))

(assert (=> mapNonEmpty!7376 (= mapRest!7367 (store mapRest!7376 mapKey!7376 mapValue!7376))))

(assert (= (and mapNonEmpty!7367 condMapEmpty!7376) mapIsEmpty!7376))

(assert (= (and mapNonEmpty!7367 (not condMapEmpty!7376)) mapNonEmpty!7376))

(assert (= (and mapNonEmpty!7376 ((_ is ValueCellFull!1802) mapValue!7376)) b!183143))

(assert (= (and mapNonEmpty!7367 ((_ is ValueCellFull!1802) mapDefault!7376)) b!183144))

(declare-fun m!210213 () Bool)

(assert (=> mapNonEmpty!7376 m!210213))

(declare-fun b_lambda!7171 () Bool)

(assert (= b_lambda!7169 (or (and b!182985 b_free!4519) b_lambda!7171)))

(check-sat (not d!54549) (not b_next!4519) (not bm!18480) (not b!183044) (not d!54543) (not b!183134) (not b!183104) (not b!183117) (not b!183098) (not b!183091) (not b!183116) tp_is_empty!4291 (not d!54545) (not b!183099) (not b!183087) (not bm!18475) (not b!183042) (not b!183118) (not b!183106) (not b!183102) (not b_lambda!7171) (not mapNonEmpty!7376) (not bm!18478) b_and!11067 (not b!183107) (not bm!18477) (not d!54547))
(check-sat b_and!11067 (not b_next!4519))
