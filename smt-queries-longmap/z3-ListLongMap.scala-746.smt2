; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17384 () Bool)

(assert start!17384)

(declare-fun b!174508 () Bool)

(declare-fun b_free!4315 () Bool)

(declare-fun b_next!4315 () Bool)

(assert (=> b!174508 (= b_free!4315 (not b_next!4315))))

(declare-fun tp!15613 () Bool)

(declare-fun b_and!10795 () Bool)

(assert (=> b!174508 (= tp!15613 b_and!10795)))

(declare-fun mapIsEmpty!6962 () Bool)

(declare-fun mapRes!6962 () Bool)

(assert (=> mapIsEmpty!6962 mapRes!6962))

(declare-fun b!174503 () Bool)

(declare-fun e!115225 () Bool)

(declare-fun tp_is_empty!4087 () Bool)

(assert (=> b!174503 (= e!115225 tp_is_empty!4087)))

(declare-fun mapNonEmpty!6962 () Bool)

(declare-fun tp!15614 () Bool)

(declare-fun e!115230 () Bool)

(assert (=> mapNonEmpty!6962 (= mapRes!6962 (and tp!15614 e!115230))))

(declare-datatypes ((V!5097 0))(
  ( (V!5098 (val!2088 Int)) )
))
(declare-datatypes ((ValueCell!1700 0))(
  ( (ValueCellFull!1700 (v!3960 V!5097)) (EmptyCell!1700) )
))
(declare-fun mapRest!6962 () (Array (_ BitVec 32) ValueCell!1700))

(declare-fun mapValue!6962 () ValueCell!1700)

(declare-fun mapKey!6962 () (_ BitVec 32))

(declare-datatypes ((array!7293 0))(
  ( (array!7294 (arr!3464 (Array (_ BitVec 32) (_ BitVec 64))) (size!3764 (_ BitVec 32))) )
))
(declare-datatypes ((array!7295 0))(
  ( (array!7296 (arr!3465 (Array (_ BitVec 32) ValueCell!1700)) (size!3765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2308 0))(
  ( (LongMapFixedSize!2309 (defaultEntry!3604 Int) (mask!8481 (_ BitVec 32)) (extraKeys!3341 (_ BitVec 32)) (zeroValue!3445 V!5097) (minValue!3445 V!5097) (_size!1203 (_ BitVec 32)) (_keys!5447 array!7293) (_values!3587 array!7295) (_vacant!1203 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2308)

(assert (=> mapNonEmpty!6962 (= (arr!3465 (_values!3587 thiss!1248)) (store mapRest!6962 mapKey!6962 mapValue!6962))))

(declare-fun b!174504 () Bool)

(declare-fun res!82768 () Bool)

(declare-fun e!115228 () Bool)

(assert (=> b!174504 (=> (not res!82768) (not e!115228))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!174504 (= res!82768 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174505 () Bool)

(declare-fun res!82769 () Bool)

(assert (=> b!174505 (=> (not res!82769) (not e!115228))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!537 0))(
  ( (MissingZero!537 (index!4316 (_ BitVec 32))) (Found!537 (index!4317 (_ BitVec 32))) (Intermediate!537 (undefined!1349 Bool) (index!4318 (_ BitVec 32)) (x!19207 (_ BitVec 32))) (Undefined!537) (MissingVacant!537 (index!4319 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7293 (_ BitVec 32)) SeekEntryResult!537)

(assert (=> b!174505 (= res!82769 ((_ is Undefined!537) (seekEntryOrOpen!0 key!828 (_keys!5447 thiss!1248) (mask!8481 thiss!1248))))))

(declare-fun b!174506 () Bool)

(declare-fun e!115229 () Bool)

(assert (=> b!174506 (= e!115229 (and e!115225 mapRes!6962))))

(declare-fun condMapEmpty!6962 () Bool)

(declare-fun mapDefault!6962 () ValueCell!1700)

(assert (=> b!174506 (= condMapEmpty!6962 (= (arr!3465 (_values!3587 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1700)) mapDefault!6962)))))

(declare-fun b!174507 () Bool)

(assert (=> b!174507 (= e!115230 tp_is_empty!4087)))

(declare-fun e!115226 () Bool)

(declare-fun array_inv!2233 (array!7293) Bool)

(declare-fun array_inv!2234 (array!7295) Bool)

(assert (=> b!174508 (= e!115226 (and tp!15613 tp_is_empty!4087 (array_inv!2233 (_keys!5447 thiss!1248)) (array_inv!2234 (_values!3587 thiss!1248)) e!115229))))

(declare-fun b!174509 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174509 (= e!115228 (not (validMask!0 (mask!8481 thiss!1248))))))

(declare-fun res!82767 () Bool)

(assert (=> start!17384 (=> (not res!82767) (not e!115228))))

(declare-fun valid!991 (LongMapFixedSize!2308) Bool)

(assert (=> start!17384 (= res!82767 (valid!991 thiss!1248))))

(assert (=> start!17384 e!115228))

(assert (=> start!17384 e!115226))

(assert (=> start!17384 true))

(declare-fun b!174510 () Bool)

(declare-fun res!82770 () Bool)

(assert (=> b!174510 (=> (not res!82770) (not e!115228))))

(declare-datatypes ((tuple2!3208 0))(
  ( (tuple2!3209 (_1!1615 (_ BitVec 64)) (_2!1615 V!5097)) )
))
(declare-datatypes ((List!2192 0))(
  ( (Nil!2189) (Cons!2188 (h!2805 tuple2!3208) (t!6996 List!2192)) )
))
(declare-datatypes ((ListLongMap!2141 0))(
  ( (ListLongMap!2142 (toList!1086 List!2192)) )
))
(declare-fun contains!1153 (ListLongMap!2141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!741 (array!7293 array!7295 (_ BitVec 32) (_ BitVec 32) V!5097 V!5097 (_ BitVec 32) Int) ListLongMap!2141)

(assert (=> b!174510 (= res!82770 (contains!1153 (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) key!828))))

(assert (= (and start!17384 res!82767) b!174504))

(assert (= (and b!174504 res!82768) b!174505))

(assert (= (and b!174505 res!82769) b!174510))

(assert (= (and b!174510 res!82770) b!174509))

(assert (= (and b!174506 condMapEmpty!6962) mapIsEmpty!6962))

(assert (= (and b!174506 (not condMapEmpty!6962)) mapNonEmpty!6962))

(assert (= (and mapNonEmpty!6962 ((_ is ValueCellFull!1700) mapValue!6962)) b!174507))

(assert (= (and b!174506 ((_ is ValueCellFull!1700) mapDefault!6962)) b!174503))

(assert (= b!174508 b!174506))

(assert (= start!17384 b!174508))

(declare-fun m!203695 () Bool)

(assert (=> start!17384 m!203695))

(declare-fun m!203697 () Bool)

(assert (=> mapNonEmpty!6962 m!203697))

(declare-fun m!203699 () Bool)

(assert (=> b!174509 m!203699))

(declare-fun m!203701 () Bool)

(assert (=> b!174505 m!203701))

(declare-fun m!203703 () Bool)

(assert (=> b!174508 m!203703))

(declare-fun m!203705 () Bool)

(assert (=> b!174508 m!203705))

(declare-fun m!203707 () Bool)

(assert (=> b!174510 m!203707))

(assert (=> b!174510 m!203707))

(declare-fun m!203709 () Bool)

(assert (=> b!174510 m!203709))

(check-sat tp_is_empty!4087 (not b!174508) (not b!174509) b_and!10795 (not b_next!4315) (not b!174505) (not start!17384) (not b!174510) (not mapNonEmpty!6962))
(check-sat b_and!10795 (not b_next!4315))
(get-model)

(declare-fun d!53351 () Bool)

(assert (=> d!53351 (= (validMask!0 (mask!8481 thiss!1248)) (and (or (= (mask!8481 thiss!1248) #b00000000000000000000000000000111) (= (mask!8481 thiss!1248) #b00000000000000000000000000001111) (= (mask!8481 thiss!1248) #b00000000000000000000000000011111) (= (mask!8481 thiss!1248) #b00000000000000000000000000111111) (= (mask!8481 thiss!1248) #b00000000000000000000000001111111) (= (mask!8481 thiss!1248) #b00000000000000000000000011111111) (= (mask!8481 thiss!1248) #b00000000000000000000000111111111) (= (mask!8481 thiss!1248) #b00000000000000000000001111111111) (= (mask!8481 thiss!1248) #b00000000000000000000011111111111) (= (mask!8481 thiss!1248) #b00000000000000000000111111111111) (= (mask!8481 thiss!1248) #b00000000000000000001111111111111) (= (mask!8481 thiss!1248) #b00000000000000000011111111111111) (= (mask!8481 thiss!1248) #b00000000000000000111111111111111) (= (mask!8481 thiss!1248) #b00000000000000001111111111111111) (= (mask!8481 thiss!1248) #b00000000000000011111111111111111) (= (mask!8481 thiss!1248) #b00000000000000111111111111111111) (= (mask!8481 thiss!1248) #b00000000000001111111111111111111) (= (mask!8481 thiss!1248) #b00000000000011111111111111111111) (= (mask!8481 thiss!1248) #b00000000000111111111111111111111) (= (mask!8481 thiss!1248) #b00000000001111111111111111111111) (= (mask!8481 thiss!1248) #b00000000011111111111111111111111) (= (mask!8481 thiss!1248) #b00000000111111111111111111111111) (= (mask!8481 thiss!1248) #b00000001111111111111111111111111) (= (mask!8481 thiss!1248) #b00000011111111111111111111111111) (= (mask!8481 thiss!1248) #b00000111111111111111111111111111) (= (mask!8481 thiss!1248) #b00001111111111111111111111111111) (= (mask!8481 thiss!1248) #b00011111111111111111111111111111) (= (mask!8481 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8481 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174509 d!53351))

(declare-fun d!53353 () Bool)

(assert (=> d!53353 (= (array_inv!2233 (_keys!5447 thiss!1248)) (bvsge (size!3764 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174508 d!53353))

(declare-fun d!53355 () Bool)

(assert (=> d!53355 (= (array_inv!2234 (_values!3587 thiss!1248)) (bvsge (size!3765 (_values!3587 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174508 d!53355))

(declare-fun d!53357 () Bool)

(declare-fun e!115272 () Bool)

(assert (=> d!53357 e!115272))

(declare-fun res!82797 () Bool)

(assert (=> d!53357 (=> res!82797 e!115272)))

(declare-fun lt!86385 () Bool)

(assert (=> d!53357 (= res!82797 (not lt!86385))))

(declare-fun lt!86388 () Bool)

(assert (=> d!53357 (= lt!86385 lt!86388)))

(declare-datatypes ((Unit!5365 0))(
  ( (Unit!5366) )
))
(declare-fun lt!86386 () Unit!5365)

(declare-fun e!115271 () Unit!5365)

(assert (=> d!53357 (= lt!86386 e!115271)))

(declare-fun c!31243 () Bool)

(assert (=> d!53357 (= c!31243 lt!86388)))

(declare-fun containsKey!190 (List!2192 (_ BitVec 64)) Bool)

(assert (=> d!53357 (= lt!86388 (containsKey!190 (toList!1086 (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828))))

(assert (=> d!53357 (= (contains!1153 (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) key!828) lt!86385)))

(declare-fun b!174565 () Bool)

(declare-fun lt!86387 () Unit!5365)

(assert (=> b!174565 (= e!115271 lt!86387)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!138 (List!2192 (_ BitVec 64)) Unit!5365)

(assert (=> b!174565 (= lt!86387 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1086 (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828))))

(declare-datatypes ((Option!193 0))(
  ( (Some!192 (v!3963 V!5097)) (None!191) )
))
(declare-fun isDefined!139 (Option!193) Bool)

(declare-fun getValueByKey!187 (List!2192 (_ BitVec 64)) Option!193)

(assert (=> b!174565 (isDefined!139 (getValueByKey!187 (toList!1086 (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828))))

(declare-fun b!174566 () Bool)

(declare-fun Unit!5367 () Unit!5365)

(assert (=> b!174566 (= e!115271 Unit!5367)))

(declare-fun b!174567 () Bool)

(assert (=> b!174567 (= e!115272 (isDefined!139 (getValueByKey!187 (toList!1086 (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828)))))

(assert (= (and d!53357 c!31243) b!174565))

(assert (= (and d!53357 (not c!31243)) b!174566))

(assert (= (and d!53357 (not res!82797)) b!174567))

(declare-fun m!203743 () Bool)

(assert (=> d!53357 m!203743))

(declare-fun m!203745 () Bool)

(assert (=> b!174565 m!203745))

(declare-fun m!203747 () Bool)

(assert (=> b!174565 m!203747))

(assert (=> b!174565 m!203747))

(declare-fun m!203749 () Bool)

(assert (=> b!174565 m!203749))

(assert (=> b!174567 m!203747))

(assert (=> b!174567 m!203747))

(assert (=> b!174567 m!203749))

(assert (=> b!174510 d!53357))

(declare-fun b!174610 () Bool)

(declare-fun e!115310 () Bool)

(declare-fun call!17676 () Bool)

(assert (=> b!174610 (= e!115310 (not call!17676))))

(declare-fun b!174611 () Bool)

(declare-fun res!82817 () Bool)

(declare-fun e!115300 () Bool)

(assert (=> b!174611 (=> (not res!82817) (not e!115300))))

(declare-fun e!115307 () Bool)

(assert (=> b!174611 (= res!82817 e!115307)))

(declare-fun res!82821 () Bool)

(assert (=> b!174611 (=> res!82821 e!115307)))

(declare-fun e!115302 () Bool)

(assert (=> b!174611 (= res!82821 (not e!115302))))

(declare-fun res!82822 () Bool)

(assert (=> b!174611 (=> (not res!82822) (not e!115302))))

(assert (=> b!174611 (= res!82822 (bvslt #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))))))

(declare-fun b!174612 () Bool)

(declare-fun c!31261 () Bool)

(assert (=> b!174612 (= c!31261 (and (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115309 () ListLongMap!2141)

(declare-fun e!115303 () ListLongMap!2141)

(assert (=> b!174612 (= e!115309 e!115303)))

(declare-fun b!174613 () Bool)

(declare-fun e!115305 () Bool)

(declare-fun e!115299 () Bool)

(assert (=> b!174613 (= e!115305 e!115299)))

(declare-fun res!82818 () Bool)

(declare-fun call!17680 () Bool)

(assert (=> b!174613 (= res!82818 call!17680)))

(assert (=> b!174613 (=> (not res!82818) (not e!115299))))

(declare-fun bm!17671 () Bool)

(declare-fun lt!86448 () ListLongMap!2141)

(assert (=> bm!17671 (= call!17676 (contains!1153 lt!86448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174614 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174614 (= e!115302 (validKeyInArray!0 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174615 () Bool)

(declare-fun e!115301 () Bool)

(assert (=> b!174615 (= e!115301 (validKeyInArray!0 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174616 () Bool)

(declare-fun call!17679 () ListLongMap!2141)

(assert (=> b!174616 (= e!115309 call!17679)))

(declare-fun b!174617 () Bool)

(declare-fun e!115306 () ListLongMap!2141)

(declare-fun call!17674 () ListLongMap!2141)

(declare-fun +!248 (ListLongMap!2141 tuple2!3208) ListLongMap!2141)

(assert (=> b!174617 (= e!115306 (+!248 call!17674 (tuple2!3209 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3445 thiss!1248))))))

(declare-fun bm!17672 () Bool)

(declare-fun call!17675 () ListLongMap!2141)

(declare-fun call!17678 () ListLongMap!2141)

(assert (=> bm!17672 (= call!17675 call!17678)))

(declare-fun bm!17673 () Bool)

(declare-fun call!17677 () ListLongMap!2141)

(assert (=> bm!17673 (= call!17677 call!17675)))

(declare-fun d!53359 () Bool)

(assert (=> d!53359 e!115300))

(declare-fun res!82819 () Bool)

(assert (=> d!53359 (=> (not res!82819) (not e!115300))))

(assert (=> d!53359 (= res!82819 (or (bvsge #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))))))))

(declare-fun lt!86434 () ListLongMap!2141)

(assert (=> d!53359 (= lt!86448 lt!86434)))

(declare-fun lt!86441 () Unit!5365)

(declare-fun e!115311 () Unit!5365)

(assert (=> d!53359 (= lt!86441 e!115311)))

(declare-fun c!31260 () Bool)

(assert (=> d!53359 (= c!31260 e!115301)))

(declare-fun res!82824 () Bool)

(assert (=> d!53359 (=> (not res!82824) (not e!115301))))

(assert (=> d!53359 (= res!82824 (bvslt #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))))))

(assert (=> d!53359 (= lt!86434 e!115306)))

(declare-fun c!31256 () Bool)

(assert (=> d!53359 (= c!31256 (and (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53359 (validMask!0 (mask!8481 thiss!1248))))

(assert (=> d!53359 (= (getCurrentListMap!741 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) lt!86448)))

(declare-fun bm!17674 () Bool)

(assert (=> bm!17674 (= call!17679 call!17674)))

(declare-fun bm!17675 () Bool)

(assert (=> bm!17675 (= call!17680 (contains!1153 lt!86448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174618 () Bool)

(assert (=> b!174618 (= e!115303 call!17679)))

(declare-fun b!174619 () Bool)

(declare-fun lt!86435 () Unit!5365)

(assert (=> b!174619 (= e!115311 lt!86435)))

(declare-fun lt!86433 () ListLongMap!2141)

(declare-fun getCurrentListMapNoExtraKeys!162 (array!7293 array!7295 (_ BitVec 32) (_ BitVec 32) V!5097 V!5097 (_ BitVec 32) Int) ListLongMap!2141)

(assert (=> b!174619 (= lt!86433 (getCurrentListMapNoExtraKeys!162 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86447 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86453 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86453 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86450 () Unit!5365)

(declare-fun addStillContains!107 (ListLongMap!2141 (_ BitVec 64) V!5097 (_ BitVec 64)) Unit!5365)

(assert (=> b!174619 (= lt!86450 (addStillContains!107 lt!86433 lt!86447 (zeroValue!3445 thiss!1248) lt!86453))))

(assert (=> b!174619 (contains!1153 (+!248 lt!86433 (tuple2!3209 lt!86447 (zeroValue!3445 thiss!1248))) lt!86453)))

(declare-fun lt!86437 () Unit!5365)

(assert (=> b!174619 (= lt!86437 lt!86450)))

(declare-fun lt!86451 () ListLongMap!2141)

(assert (=> b!174619 (= lt!86451 (getCurrentListMapNoExtraKeys!162 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86445 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86454 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86454 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86444 () Unit!5365)

(declare-fun addApplyDifferent!107 (ListLongMap!2141 (_ BitVec 64) V!5097 (_ BitVec 64)) Unit!5365)

(assert (=> b!174619 (= lt!86444 (addApplyDifferent!107 lt!86451 lt!86445 (minValue!3445 thiss!1248) lt!86454))))

(declare-fun apply!131 (ListLongMap!2141 (_ BitVec 64)) V!5097)

(assert (=> b!174619 (= (apply!131 (+!248 lt!86451 (tuple2!3209 lt!86445 (minValue!3445 thiss!1248))) lt!86454) (apply!131 lt!86451 lt!86454))))

(declare-fun lt!86442 () Unit!5365)

(assert (=> b!174619 (= lt!86442 lt!86444)))

(declare-fun lt!86440 () ListLongMap!2141)

(assert (=> b!174619 (= lt!86440 (getCurrentListMapNoExtraKeys!162 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86446 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86446 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86436 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86436 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86443 () Unit!5365)

(assert (=> b!174619 (= lt!86443 (addApplyDifferent!107 lt!86440 lt!86446 (zeroValue!3445 thiss!1248) lt!86436))))

(assert (=> b!174619 (= (apply!131 (+!248 lt!86440 (tuple2!3209 lt!86446 (zeroValue!3445 thiss!1248))) lt!86436) (apply!131 lt!86440 lt!86436))))

(declare-fun lt!86438 () Unit!5365)

(assert (=> b!174619 (= lt!86438 lt!86443)))

(declare-fun lt!86439 () ListLongMap!2141)

(assert (=> b!174619 (= lt!86439 (getCurrentListMapNoExtraKeys!162 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86449 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86449 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86452 () (_ BitVec 64))

(assert (=> b!174619 (= lt!86452 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174619 (= lt!86435 (addApplyDifferent!107 lt!86439 lt!86449 (minValue!3445 thiss!1248) lt!86452))))

(assert (=> b!174619 (= (apply!131 (+!248 lt!86439 (tuple2!3209 lt!86449 (minValue!3445 thiss!1248))) lt!86452) (apply!131 lt!86439 lt!86452))))

(declare-fun b!174620 () Bool)

(declare-fun e!115308 () Bool)

(declare-fun get!1980 (ValueCell!1700 V!5097) V!5097)

(declare-fun dynLambda!474 (Int (_ BitVec 64)) V!5097)

(assert (=> b!174620 (= e!115308 (= (apply!131 lt!86448 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000)) (get!1980 (select (arr!3465 (_values!3587 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!474 (defaultEntry!3604 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3765 (_values!3587 thiss!1248))))))

(assert (=> b!174620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))))))

(declare-fun c!31257 () Bool)

(declare-fun bm!17676 () Bool)

(assert (=> bm!17676 (= call!17674 (+!248 (ite c!31256 call!17678 (ite c!31257 call!17675 call!17677)) (ite (or c!31256 c!31257) (tuple2!3209 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3445 thiss!1248)) (tuple2!3209 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3445 thiss!1248)))))))

(declare-fun b!174621 () Bool)

(assert (=> b!174621 (= e!115307 e!115308)))

(declare-fun res!82823 () Bool)

(assert (=> b!174621 (=> (not res!82823) (not e!115308))))

(assert (=> b!174621 (= res!82823 (contains!1153 lt!86448 (select (arr!3464 (_keys!5447 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))))))

(declare-fun b!174622 () Bool)

(assert (=> b!174622 (= e!115300 e!115305)))

(declare-fun c!31259 () Bool)

(assert (=> b!174622 (= c!31259 (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174623 () Bool)

(assert (=> b!174623 (= e!115306 e!115309)))

(assert (=> b!174623 (= c!31257 (and (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174624 () Bool)

(assert (=> b!174624 (= e!115303 call!17677)))

(declare-fun b!174625 () Bool)

(declare-fun e!115304 () Bool)

(assert (=> b!174625 (= e!115304 (= (apply!131 lt!86448 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3445 thiss!1248)))))

(declare-fun bm!17677 () Bool)

(assert (=> bm!17677 (= call!17678 (getCurrentListMapNoExtraKeys!162 (_keys!5447 thiss!1248) (_values!3587 thiss!1248) (mask!8481 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun b!174626 () Bool)

(assert (=> b!174626 (= e!115299 (= (apply!131 lt!86448 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3445 thiss!1248)))))

(declare-fun b!174627 () Bool)

(assert (=> b!174627 (= e!115305 (not call!17680))))

(declare-fun b!174628 () Bool)

(declare-fun Unit!5368 () Unit!5365)

(assert (=> b!174628 (= e!115311 Unit!5368)))

(declare-fun b!174629 () Bool)

(declare-fun res!82820 () Bool)

(assert (=> b!174629 (=> (not res!82820) (not e!115300))))

(assert (=> b!174629 (= res!82820 e!115310)))

(declare-fun c!31258 () Bool)

(assert (=> b!174629 (= c!31258 (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!174630 () Bool)

(assert (=> b!174630 (= e!115310 e!115304)))

(declare-fun res!82816 () Bool)

(assert (=> b!174630 (= res!82816 call!17676)))

(assert (=> b!174630 (=> (not res!82816) (not e!115304))))

(assert (= (and d!53359 c!31256) b!174617))

(assert (= (and d!53359 (not c!31256)) b!174623))

(assert (= (and b!174623 c!31257) b!174616))

(assert (= (and b!174623 (not c!31257)) b!174612))

(assert (= (and b!174612 c!31261) b!174618))

(assert (= (and b!174612 (not c!31261)) b!174624))

(assert (= (or b!174618 b!174624) bm!17673))

(assert (= (or b!174616 bm!17673) bm!17672))

(assert (= (or b!174616 b!174618) bm!17674))

(assert (= (or b!174617 bm!17672) bm!17677))

(assert (= (or b!174617 bm!17674) bm!17676))

(assert (= (and d!53359 res!82824) b!174615))

(assert (= (and d!53359 c!31260) b!174619))

(assert (= (and d!53359 (not c!31260)) b!174628))

(assert (= (and d!53359 res!82819) b!174611))

(assert (= (and b!174611 res!82822) b!174614))

(assert (= (and b!174611 (not res!82821)) b!174621))

(assert (= (and b!174621 res!82823) b!174620))

(assert (= (and b!174611 res!82817) b!174629))

(assert (= (and b!174629 c!31258) b!174630))

(assert (= (and b!174629 (not c!31258)) b!174610))

(assert (= (and b!174630 res!82816) b!174625))

(assert (= (or b!174630 b!174610) bm!17671))

(assert (= (and b!174629 res!82820) b!174622))

(assert (= (and b!174622 c!31259) b!174613))

(assert (= (and b!174622 (not c!31259)) b!174627))

(assert (= (and b!174613 res!82818) b!174626))

(assert (= (or b!174613 b!174627) bm!17675))

(declare-fun b_lambda!7005 () Bool)

(assert (=> (not b_lambda!7005) (not b!174620)))

(declare-fun t!6998 () Bool)

(declare-fun tb!2765 () Bool)

(assert (=> (and b!174508 (= (defaultEntry!3604 thiss!1248) (defaultEntry!3604 thiss!1248)) t!6998) tb!2765))

(declare-fun result!4585 () Bool)

(assert (=> tb!2765 (= result!4585 tp_is_empty!4087)))

(assert (=> b!174620 t!6998))

(declare-fun b_and!10801 () Bool)

(assert (= b_and!10795 (and (=> t!6998 result!4585) b_and!10801)))

(declare-fun m!203751 () Bool)

(assert (=> b!174617 m!203751))

(declare-fun m!203753 () Bool)

(assert (=> b!174614 m!203753))

(assert (=> b!174614 m!203753))

(declare-fun m!203755 () Bool)

(assert (=> b!174614 m!203755))

(assert (=> b!174621 m!203753))

(assert (=> b!174621 m!203753))

(declare-fun m!203757 () Bool)

(assert (=> b!174621 m!203757))

(assert (=> b!174615 m!203753))

(assert (=> b!174615 m!203753))

(assert (=> b!174615 m!203755))

(declare-fun m!203759 () Bool)

(assert (=> b!174626 m!203759))

(assert (=> d!53359 m!203699))

(declare-fun m!203761 () Bool)

(assert (=> b!174620 m!203761))

(declare-fun m!203763 () Bool)

(assert (=> b!174620 m!203763))

(declare-fun m!203765 () Bool)

(assert (=> b!174620 m!203765))

(assert (=> b!174620 m!203763))

(assert (=> b!174620 m!203753))

(declare-fun m!203767 () Bool)

(assert (=> b!174620 m!203767))

(assert (=> b!174620 m!203761))

(assert (=> b!174620 m!203753))

(declare-fun m!203769 () Bool)

(assert (=> bm!17671 m!203769))

(declare-fun m!203771 () Bool)

(assert (=> bm!17675 m!203771))

(declare-fun m!203773 () Bool)

(assert (=> b!174619 m!203773))

(declare-fun m!203775 () Bool)

(assert (=> b!174619 m!203775))

(declare-fun m!203777 () Bool)

(assert (=> b!174619 m!203777))

(declare-fun m!203779 () Bool)

(assert (=> b!174619 m!203779))

(declare-fun m!203781 () Bool)

(assert (=> b!174619 m!203781))

(declare-fun m!203783 () Bool)

(assert (=> b!174619 m!203783))

(declare-fun m!203785 () Bool)

(assert (=> b!174619 m!203785))

(declare-fun m!203787 () Bool)

(assert (=> b!174619 m!203787))

(declare-fun m!203789 () Bool)

(assert (=> b!174619 m!203789))

(assert (=> b!174619 m!203787))

(declare-fun m!203791 () Bool)

(assert (=> b!174619 m!203791))

(assert (=> b!174619 m!203753))

(assert (=> b!174619 m!203783))

(declare-fun m!203793 () Bool)

(assert (=> b!174619 m!203793))

(declare-fun m!203795 () Bool)

(assert (=> b!174619 m!203795))

(declare-fun m!203797 () Bool)

(assert (=> b!174619 m!203797))

(assert (=> b!174619 m!203789))

(declare-fun m!203799 () Bool)

(assert (=> b!174619 m!203799))

(assert (=> b!174619 m!203795))

(declare-fun m!203801 () Bool)

(assert (=> b!174619 m!203801))

(declare-fun m!203803 () Bool)

(assert (=> b!174619 m!203803))

(declare-fun m!203805 () Bool)

(assert (=> bm!17676 m!203805))

(declare-fun m!203807 () Bool)

(assert (=> b!174625 m!203807))

(assert (=> bm!17677 m!203779))

(assert (=> b!174510 d!53359))

(declare-fun d!53361 () Bool)

(declare-fun lt!86462 () SeekEntryResult!537)

(assert (=> d!53361 (and (or ((_ is Undefined!537) lt!86462) (not ((_ is Found!537) lt!86462)) (and (bvsge (index!4317 lt!86462) #b00000000000000000000000000000000) (bvslt (index!4317 lt!86462) (size!3764 (_keys!5447 thiss!1248))))) (or ((_ is Undefined!537) lt!86462) ((_ is Found!537) lt!86462) (not ((_ is MissingZero!537) lt!86462)) (and (bvsge (index!4316 lt!86462) #b00000000000000000000000000000000) (bvslt (index!4316 lt!86462) (size!3764 (_keys!5447 thiss!1248))))) (or ((_ is Undefined!537) lt!86462) ((_ is Found!537) lt!86462) ((_ is MissingZero!537) lt!86462) (not ((_ is MissingVacant!537) lt!86462)) (and (bvsge (index!4319 lt!86462) #b00000000000000000000000000000000) (bvslt (index!4319 lt!86462) (size!3764 (_keys!5447 thiss!1248))))) (or ((_ is Undefined!537) lt!86462) (ite ((_ is Found!537) lt!86462) (= (select (arr!3464 (_keys!5447 thiss!1248)) (index!4317 lt!86462)) key!828) (ite ((_ is MissingZero!537) lt!86462) (= (select (arr!3464 (_keys!5447 thiss!1248)) (index!4316 lt!86462)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!537) lt!86462) (= (select (arr!3464 (_keys!5447 thiss!1248)) (index!4319 lt!86462)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115320 () SeekEntryResult!537)

(assert (=> d!53361 (= lt!86462 e!115320)))

(declare-fun c!31270 () Bool)

(declare-fun lt!86461 () SeekEntryResult!537)

(assert (=> d!53361 (= c!31270 (and ((_ is Intermediate!537) lt!86461) (undefined!1349 lt!86461)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7293 (_ BitVec 32)) SeekEntryResult!537)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53361 (= lt!86461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8481 thiss!1248)) key!828 (_keys!5447 thiss!1248) (mask!8481 thiss!1248)))))

(assert (=> d!53361 (validMask!0 (mask!8481 thiss!1248))))

(assert (=> d!53361 (= (seekEntryOrOpen!0 key!828 (_keys!5447 thiss!1248) (mask!8481 thiss!1248)) lt!86462)))

(declare-fun b!174645 () Bool)

(declare-fun e!115319 () SeekEntryResult!537)

(assert (=> b!174645 (= e!115320 e!115319)))

(declare-fun lt!86463 () (_ BitVec 64))

(assert (=> b!174645 (= lt!86463 (select (arr!3464 (_keys!5447 thiss!1248)) (index!4318 lt!86461)))))

(declare-fun c!31269 () Bool)

(assert (=> b!174645 (= c!31269 (= lt!86463 key!828))))

(declare-fun b!174646 () Bool)

(assert (=> b!174646 (= e!115319 (Found!537 (index!4318 lt!86461)))))

(declare-fun b!174647 () Bool)

(declare-fun e!115318 () SeekEntryResult!537)

(assert (=> b!174647 (= e!115318 (MissingZero!537 (index!4318 lt!86461)))))

(declare-fun b!174648 () Bool)

(assert (=> b!174648 (= e!115320 Undefined!537)))

(declare-fun b!174649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7293 (_ BitVec 32)) SeekEntryResult!537)

(assert (=> b!174649 (= e!115318 (seekKeyOrZeroReturnVacant!0 (x!19207 lt!86461) (index!4318 lt!86461) (index!4318 lt!86461) key!828 (_keys!5447 thiss!1248) (mask!8481 thiss!1248)))))

(declare-fun b!174650 () Bool)

(declare-fun c!31268 () Bool)

(assert (=> b!174650 (= c!31268 (= lt!86463 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174650 (= e!115319 e!115318)))

(assert (= (and d!53361 c!31270) b!174648))

(assert (= (and d!53361 (not c!31270)) b!174645))

(assert (= (and b!174645 c!31269) b!174646))

(assert (= (and b!174645 (not c!31269)) b!174650))

(assert (= (and b!174650 c!31268) b!174647))

(assert (= (and b!174650 (not c!31268)) b!174649))

(declare-fun m!203809 () Bool)

(assert (=> d!53361 m!203809))

(declare-fun m!203811 () Bool)

(assert (=> d!53361 m!203811))

(assert (=> d!53361 m!203699))

(declare-fun m!203813 () Bool)

(assert (=> d!53361 m!203813))

(assert (=> d!53361 m!203809))

(declare-fun m!203815 () Bool)

(assert (=> d!53361 m!203815))

(declare-fun m!203817 () Bool)

(assert (=> d!53361 m!203817))

(declare-fun m!203819 () Bool)

(assert (=> b!174645 m!203819))

(declare-fun m!203821 () Bool)

(assert (=> b!174649 m!203821))

(assert (=> b!174505 d!53361))

(declare-fun d!53363 () Bool)

(declare-fun res!82831 () Bool)

(declare-fun e!115323 () Bool)

(assert (=> d!53363 (=> (not res!82831) (not e!115323))))

(declare-fun simpleValid!145 (LongMapFixedSize!2308) Bool)

(assert (=> d!53363 (= res!82831 (simpleValid!145 thiss!1248))))

(assert (=> d!53363 (= (valid!991 thiss!1248) e!115323)))

(declare-fun b!174657 () Bool)

(declare-fun res!82832 () Bool)

(assert (=> b!174657 (=> (not res!82832) (not e!115323))))

(declare-fun arrayCountValidKeys!0 (array!7293 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174657 (= res!82832 (= (arrayCountValidKeys!0 (_keys!5447 thiss!1248) #b00000000000000000000000000000000 (size!3764 (_keys!5447 thiss!1248))) (_size!1203 thiss!1248)))))

(declare-fun b!174658 () Bool)

(declare-fun res!82833 () Bool)

(assert (=> b!174658 (=> (not res!82833) (not e!115323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7293 (_ BitVec 32)) Bool)

(assert (=> b!174658 (= res!82833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5447 thiss!1248) (mask!8481 thiss!1248)))))

(declare-fun b!174659 () Bool)

(declare-datatypes ((List!2193 0))(
  ( (Nil!2190) (Cons!2189 (h!2806 (_ BitVec 64)) (t!6999 List!2193)) )
))
(declare-fun arrayNoDuplicates!0 (array!7293 (_ BitVec 32) List!2193) Bool)

(assert (=> b!174659 (= e!115323 (arrayNoDuplicates!0 (_keys!5447 thiss!1248) #b00000000000000000000000000000000 Nil!2190))))

(assert (= (and d!53363 res!82831) b!174657))

(assert (= (and b!174657 res!82832) b!174658))

(assert (= (and b!174658 res!82833) b!174659))

(declare-fun m!203823 () Bool)

(assert (=> d!53363 m!203823))

(declare-fun m!203825 () Bool)

(assert (=> b!174657 m!203825))

(declare-fun m!203827 () Bool)

(assert (=> b!174658 m!203827))

(declare-fun m!203829 () Bool)

(assert (=> b!174659 m!203829))

(assert (=> start!17384 d!53363))

(declare-fun mapIsEmpty!6971 () Bool)

(declare-fun mapRes!6971 () Bool)

(assert (=> mapIsEmpty!6971 mapRes!6971))

(declare-fun b!174666 () Bool)

(declare-fun e!115329 () Bool)

(assert (=> b!174666 (= e!115329 tp_is_empty!4087)))

(declare-fun mapNonEmpty!6971 () Bool)

(declare-fun tp!15629 () Bool)

(assert (=> mapNonEmpty!6971 (= mapRes!6971 (and tp!15629 e!115329))))

(declare-fun mapValue!6971 () ValueCell!1700)

(declare-fun mapRest!6971 () (Array (_ BitVec 32) ValueCell!1700))

(declare-fun mapKey!6971 () (_ BitVec 32))

(assert (=> mapNonEmpty!6971 (= mapRest!6962 (store mapRest!6971 mapKey!6971 mapValue!6971))))

(declare-fun b!174667 () Bool)

(declare-fun e!115328 () Bool)

(assert (=> b!174667 (= e!115328 tp_is_empty!4087)))

(declare-fun condMapEmpty!6971 () Bool)

(declare-fun mapDefault!6971 () ValueCell!1700)

(assert (=> mapNonEmpty!6962 (= condMapEmpty!6971 (= mapRest!6962 ((as const (Array (_ BitVec 32) ValueCell!1700)) mapDefault!6971)))))

(assert (=> mapNonEmpty!6962 (= tp!15614 (and e!115328 mapRes!6971))))

(assert (= (and mapNonEmpty!6962 condMapEmpty!6971) mapIsEmpty!6971))

(assert (= (and mapNonEmpty!6962 (not condMapEmpty!6971)) mapNonEmpty!6971))

(assert (= (and mapNonEmpty!6971 ((_ is ValueCellFull!1700) mapValue!6971)) b!174666))

(assert (= (and mapNonEmpty!6962 ((_ is ValueCellFull!1700) mapDefault!6971)) b!174667))

(declare-fun m!203831 () Bool)

(assert (=> mapNonEmpty!6971 m!203831))

(declare-fun b_lambda!7007 () Bool)

(assert (= b_lambda!7005 (or (and b!174508 b_free!4315) b_lambda!7007)))

(check-sat (not d!53361) b_and!10801 tp_is_empty!4087 (not bm!17671) (not b!174626) (not d!53363) (not b!174649) (not d!53357) (not b!174567) (not b!174620) (not bm!17676) (not b!174619) (not b!174659) (not b!174657) (not mapNonEmpty!6971) (not b!174658) (not b!174617) (not b!174621) (not d!53359) (not b_next!4315) (not b!174565) (not bm!17675) (not b!174614) (not b!174615) (not b!174625) (not b_lambda!7007) (not bm!17677))
(check-sat b_and!10801 (not b_next!4315))
