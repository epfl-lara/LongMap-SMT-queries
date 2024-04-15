; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22644 () Bool)

(assert start!22644)

(declare-fun b!236351 () Bool)

(declare-fun b_free!6361 () Bool)

(declare-fun b_next!6361 () Bool)

(assert (=> b!236351 (= b_free!6361 (not b_next!6361))))

(declare-fun tp!22262 () Bool)

(declare-fun b_and!13275 () Bool)

(assert (=> b!236351 (= tp!22262 b_and!13275)))

(declare-fun mapIsEmpty!10542 () Bool)

(declare-fun mapRes!10542 () Bool)

(assert (=> mapIsEmpty!10542 mapRes!10542))

(declare-fun mapNonEmpty!10542 () Bool)

(declare-fun tp!22263 () Bool)

(declare-fun e!153490 () Bool)

(assert (=> mapNonEmpty!10542 (= mapRes!10542 (and tp!22263 e!153490))))

(declare-datatypes ((V!7945 0))(
  ( (V!7946 (val!3156 Int)) )
))
(declare-datatypes ((ValueCell!2768 0))(
  ( (ValueCellFull!2768 (v!5181 V!7945)) (EmptyCell!2768) )
))
(declare-fun mapValue!10542 () ValueCell!2768)

(declare-datatypes ((array!11703 0))(
  ( (array!11704 (arr!5559 (Array (_ BitVec 32) ValueCell!2768)) (size!5898 (_ BitVec 32))) )
))
(declare-datatypes ((array!11705 0))(
  ( (array!11706 (arr!5560 (Array (_ BitVec 32) (_ BitVec 64))) (size!5899 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3436 0))(
  ( (LongMapFixedSize!3437 (defaultEntry!4393 Int) (mask!10385 (_ BitVec 32)) (extraKeys!4130 (_ BitVec 32)) (zeroValue!4234 V!7945) (minValue!4234 V!7945) (_size!1767 (_ BitVec 32)) (_keys!6475 array!11705) (_values!4376 array!11703) (_vacant!1767 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3436)

(declare-fun mapRest!10542 () (Array (_ BitVec 32) ValueCell!2768))

(declare-fun mapKey!10542 () (_ BitVec 32))

(assert (=> mapNonEmpty!10542 (= (arr!5559 (_values!4376 thiss!1504)) (store mapRest!10542 mapKey!10542 mapValue!10542))))

(declare-fun b!236343 () Bool)

(declare-fun tp_is_empty!6223 () Bool)

(assert (=> b!236343 (= e!153490 tp_is_empty!6223)))

(declare-fun b!236345 () Bool)

(declare-fun e!153485 () Bool)

(assert (=> b!236345 (= e!153485 (and (= (size!5898 (_values!4376 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10385 thiss!1504))) (not (= (size!5899 (_keys!6475 thiss!1504)) (size!5898 (_values!4376 thiss!1504))))))))

(declare-fun b!236346 () Bool)

(declare-fun e!153487 () Bool)

(assert (=> b!236346 (= e!153487 tp_is_empty!6223)))

(declare-fun b!236347 () Bool)

(declare-fun res!115862 () Bool)

(assert (=> b!236347 (=> (not res!115862) (not e!153485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236347 (= res!115862 (validMask!0 (mask!10385 thiss!1504)))))

(declare-fun b!236348 () Bool)

(declare-fun e!153489 () Bool)

(assert (=> b!236348 (= e!153489 e!153485)))

(declare-fun res!115865 () Bool)

(assert (=> b!236348 (=> (not res!115865) (not e!153485))))

(declare-datatypes ((SeekEntryResult!1000 0))(
  ( (MissingZero!1000 (index!6170 (_ BitVec 32))) (Found!1000 (index!6171 (_ BitVec 32))) (Intermediate!1000 (undefined!1812 Bool) (index!6172 (_ BitVec 32)) (x!23881 (_ BitVec 32))) (Undefined!1000) (MissingVacant!1000 (index!6173 (_ BitVec 32))) )
))
(declare-fun lt!119396 () SeekEntryResult!1000)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236348 (= res!115865 (or (= lt!119396 (MissingZero!1000 index!297)) (= lt!119396 (MissingVacant!1000 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11705 (_ BitVec 32)) SeekEntryResult!1000)

(assert (=> b!236348 (= lt!119396 (seekEntryOrOpen!0 key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(declare-fun b!236349 () Bool)

(declare-fun e!153484 () Bool)

(assert (=> b!236349 (= e!153484 (and e!153487 mapRes!10542))))

(declare-fun condMapEmpty!10542 () Bool)

(declare-fun mapDefault!10542 () ValueCell!2768)

(assert (=> b!236349 (= condMapEmpty!10542 (= (arr!5559 (_values!4376 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2768)) mapDefault!10542)))))

(declare-fun b!236350 () Bool)

(declare-fun res!115864 () Bool)

(assert (=> b!236350 (=> (not res!115864) (not e!153485))))

(declare-datatypes ((tuple2!4626 0))(
  ( (tuple2!4627 (_1!2324 (_ BitVec 64)) (_2!2324 V!7945)) )
))
(declare-datatypes ((List!3547 0))(
  ( (Nil!3544) (Cons!3543 (h!4196 tuple2!4626) (t!8519 List!3547)) )
))
(declare-datatypes ((ListLongMap!3529 0))(
  ( (ListLongMap!3530 (toList!1780 List!3547)) )
))
(declare-fun contains!1663 (ListLongMap!3529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1289 (array!11705 array!11703 (_ BitVec 32) (_ BitVec 32) V!7945 V!7945 (_ BitVec 32) Int) ListLongMap!3529)

(assert (=> b!236350 (= res!115864 (not (contains!1663 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) key!932)))))

(declare-fun e!153486 () Bool)

(declare-fun array_inv!3665 (array!11705) Bool)

(declare-fun array_inv!3666 (array!11703) Bool)

(assert (=> b!236351 (= e!153486 (and tp!22262 tp_is_empty!6223 (array_inv!3665 (_keys!6475 thiss!1504)) (array_inv!3666 (_values!4376 thiss!1504)) e!153484))))

(declare-fun b!236344 () Bool)

(declare-fun res!115863 () Bool)

(assert (=> b!236344 (=> (not res!115863) (not e!153489))))

(assert (=> b!236344 (= res!115863 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!115866 () Bool)

(assert (=> start!22644 (=> (not res!115866) (not e!153489))))

(declare-fun valid!1364 (LongMapFixedSize!3436) Bool)

(assert (=> start!22644 (= res!115866 (valid!1364 thiss!1504))))

(assert (=> start!22644 e!153489))

(assert (=> start!22644 e!153486))

(assert (=> start!22644 true))

(assert (= (and start!22644 res!115866) b!236344))

(assert (= (and b!236344 res!115863) b!236348))

(assert (= (and b!236348 res!115865) b!236350))

(assert (= (and b!236350 res!115864) b!236347))

(assert (= (and b!236347 res!115862) b!236345))

(assert (= (and b!236349 condMapEmpty!10542) mapIsEmpty!10542))

(assert (= (and b!236349 (not condMapEmpty!10542)) mapNonEmpty!10542))

(get-info :version)

(assert (= (and mapNonEmpty!10542 ((_ is ValueCellFull!2768) mapValue!10542)) b!236343))

(assert (= (and b!236349 ((_ is ValueCellFull!2768) mapDefault!10542)) b!236346))

(assert (= b!236351 b!236349))

(assert (= start!22644 b!236351))

(declare-fun m!256755 () Bool)

(assert (=> start!22644 m!256755))

(declare-fun m!256757 () Bool)

(assert (=> mapNonEmpty!10542 m!256757))

(declare-fun m!256759 () Bool)

(assert (=> b!236348 m!256759))

(declare-fun m!256761 () Bool)

(assert (=> b!236347 m!256761))

(declare-fun m!256763 () Bool)

(assert (=> b!236351 m!256763))

(declare-fun m!256765 () Bool)

(assert (=> b!236351 m!256765))

(declare-fun m!256767 () Bool)

(assert (=> b!236350 m!256767))

(assert (=> b!236350 m!256767))

(declare-fun m!256769 () Bool)

(assert (=> b!236350 m!256769))

(check-sat (not b!236350) tp_is_empty!6223 (not b!236347) (not start!22644) (not b!236351) b_and!13275 (not b_next!6361) (not b!236348) (not mapNonEmpty!10542))
(check-sat b_and!13275 (not b_next!6361))
(get-model)

(declare-fun d!59277 () Bool)

(assert (=> d!59277 (= (validMask!0 (mask!10385 thiss!1504)) (and (or (= (mask!10385 thiss!1504) #b00000000000000000000000000000111) (= (mask!10385 thiss!1504) #b00000000000000000000000000001111) (= (mask!10385 thiss!1504) #b00000000000000000000000000011111) (= (mask!10385 thiss!1504) #b00000000000000000000000000111111) (= (mask!10385 thiss!1504) #b00000000000000000000000001111111) (= (mask!10385 thiss!1504) #b00000000000000000000000011111111) (= (mask!10385 thiss!1504) #b00000000000000000000000111111111) (= (mask!10385 thiss!1504) #b00000000000000000000001111111111) (= (mask!10385 thiss!1504) #b00000000000000000000011111111111) (= (mask!10385 thiss!1504) #b00000000000000000000111111111111) (= (mask!10385 thiss!1504) #b00000000000000000001111111111111) (= (mask!10385 thiss!1504) #b00000000000000000011111111111111) (= (mask!10385 thiss!1504) #b00000000000000000111111111111111) (= (mask!10385 thiss!1504) #b00000000000000001111111111111111) (= (mask!10385 thiss!1504) #b00000000000000011111111111111111) (= (mask!10385 thiss!1504) #b00000000000000111111111111111111) (= (mask!10385 thiss!1504) #b00000000000001111111111111111111) (= (mask!10385 thiss!1504) #b00000000000011111111111111111111) (= (mask!10385 thiss!1504) #b00000000000111111111111111111111) (= (mask!10385 thiss!1504) #b00000000001111111111111111111111) (= (mask!10385 thiss!1504) #b00000000011111111111111111111111) (= (mask!10385 thiss!1504) #b00000000111111111111111111111111) (= (mask!10385 thiss!1504) #b00000001111111111111111111111111) (= (mask!10385 thiss!1504) #b00000011111111111111111111111111) (= (mask!10385 thiss!1504) #b00000111111111111111111111111111) (= (mask!10385 thiss!1504) #b00001111111111111111111111111111) (= (mask!10385 thiss!1504) #b00011111111111111111111111111111) (= (mask!10385 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10385 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236347 d!59277))

(declare-fun d!59279 () Bool)

(assert (=> d!59279 (= (array_inv!3665 (_keys!6475 thiss!1504)) (bvsge (size!5899 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236351 d!59279))

(declare-fun d!59281 () Bool)

(assert (=> d!59281 (= (array_inv!3666 (_values!4376 thiss!1504)) (bvsge (size!5898 (_values!4376 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236351 d!59281))

(declare-fun d!59283 () Bool)

(declare-fun e!153537 () Bool)

(assert (=> d!59283 e!153537))

(declare-fun res!115899 () Bool)

(assert (=> d!59283 (=> res!115899 e!153537)))

(declare-fun lt!119412 () Bool)

(assert (=> d!59283 (= res!115899 (not lt!119412))))

(declare-fun lt!119411 () Bool)

(assert (=> d!59283 (= lt!119412 lt!119411)))

(declare-datatypes ((Unit!7272 0))(
  ( (Unit!7273) )
))
(declare-fun lt!119413 () Unit!7272)

(declare-fun e!153538 () Unit!7272)

(assert (=> d!59283 (= lt!119413 e!153538)))

(declare-fun c!39372 () Bool)

(assert (=> d!59283 (= c!39372 lt!119411)))

(declare-fun containsKey!262 (List!3547 (_ BitVec 64)) Bool)

(assert (=> d!59283 (= lt!119411 (containsKey!262 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(assert (=> d!59283 (= (contains!1663 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) key!932) lt!119412)))

(declare-fun b!236412 () Bool)

(declare-fun lt!119414 () Unit!7272)

(assert (=> b!236412 (= e!153538 lt!119414)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!211 (List!3547 (_ BitVec 64)) Unit!7272)

(assert (=> b!236412 (= lt!119414 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-datatypes ((Option!276 0))(
  ( (Some!275 (v!5184 V!7945)) (None!274) )
))
(declare-fun isDefined!212 (Option!276) Bool)

(declare-fun getValueByKey!270 (List!3547 (_ BitVec 64)) Option!276)

(assert (=> b!236412 (isDefined!212 (getValueByKey!270 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-fun b!236413 () Bool)

(declare-fun Unit!7274 () Unit!7272)

(assert (=> b!236413 (= e!153538 Unit!7274)))

(declare-fun b!236414 () Bool)

(assert (=> b!236414 (= e!153537 (isDefined!212 (getValueByKey!270 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932)))))

(assert (= (and d!59283 c!39372) b!236412))

(assert (= (and d!59283 (not c!39372)) b!236413))

(assert (= (and d!59283 (not res!115899)) b!236414))

(declare-fun m!256803 () Bool)

(assert (=> d!59283 m!256803))

(declare-fun m!256805 () Bool)

(assert (=> b!236412 m!256805))

(declare-fun m!256807 () Bool)

(assert (=> b!236412 m!256807))

(assert (=> b!236412 m!256807))

(declare-fun m!256809 () Bool)

(assert (=> b!236412 m!256809))

(assert (=> b!236414 m!256807))

(assert (=> b!236414 m!256807))

(assert (=> b!236414 m!256809))

(assert (=> b!236350 d!59283))

(declare-fun b!236457 () Bool)

(declare-fun e!153576 () ListLongMap!3529)

(declare-fun call!21980 () ListLongMap!3529)

(assert (=> b!236457 (= e!153576 call!21980)))

(declare-fun bm!21972 () Bool)

(declare-fun call!21978 () ListLongMap!3529)

(declare-fun getCurrentListMapNoExtraKeys!530 (array!11705 array!11703 (_ BitVec 32) (_ BitVec 32) V!7945 V!7945 (_ BitVec 32) Int) ListLongMap!3529)

(assert (=> bm!21972 (= call!21978 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun b!236458 () Bool)

(declare-fun e!153570 () Bool)

(declare-fun call!21975 () Bool)

(assert (=> b!236458 (= e!153570 (not call!21975))))

(declare-fun b!236459 () Bool)

(declare-fun e!153566 () Bool)

(declare-fun lt!119479 () ListLongMap!3529)

(declare-fun apply!214 (ListLongMap!3529 (_ BitVec 64)) V!7945)

(declare-fun get!2856 (ValueCell!2768 V!7945) V!7945)

(declare-fun dynLambda!548 (Int (_ BitVec 64)) V!7945)

(assert (=> b!236459 (= e!153566 (= (apply!214 lt!119479 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)) (get!2856 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_values!4376 thiss!1504))))))

(assert (=> b!236459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun bm!21973 () Bool)

(declare-fun call!21976 () ListLongMap!3529)

(declare-fun call!21979 () ListLongMap!3529)

(assert (=> bm!21973 (= call!21976 call!21979)))

(declare-fun bm!21974 () Bool)

(declare-fun call!21981 () ListLongMap!3529)

(assert (=> bm!21974 (= call!21981 call!21978)))

(declare-fun b!236460 () Bool)

(declare-fun e!153577 () Bool)

(assert (=> b!236460 (= e!153577 e!153566)))

(declare-fun res!115922 () Bool)

(assert (=> b!236460 (=> (not res!115922) (not e!153566))))

(assert (=> b!236460 (= res!115922 (contains!1663 lt!119479 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun bm!21975 () Bool)

(assert (=> bm!21975 (= call!21975 (contains!1663 lt!119479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236461 () Bool)

(declare-fun e!153575 () Bool)

(assert (=> b!236461 (= e!153575 (= (apply!214 lt!119479 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4234 thiss!1504)))))

(declare-fun b!236462 () Bool)

(declare-fun e!153565 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236462 (= e!153565 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236463 () Bool)

(assert (=> b!236463 (= e!153576 call!21976)))

(declare-fun b!236464 () Bool)

(declare-fun e!153569 () Unit!7272)

(declare-fun lt!119469 () Unit!7272)

(assert (=> b!236464 (= e!153569 lt!119469)))

(declare-fun lt!119470 () ListLongMap!3529)

(assert (=> b!236464 (= lt!119470 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119475 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119464 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119464 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119465 () Unit!7272)

(declare-fun addStillContains!190 (ListLongMap!3529 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7272)

(assert (=> b!236464 (= lt!119465 (addStillContains!190 lt!119470 lt!119475 (zeroValue!4234 thiss!1504) lt!119464))))

(declare-fun +!647 (ListLongMap!3529 tuple2!4626) ListLongMap!3529)

(assert (=> b!236464 (contains!1663 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))) lt!119464)))

(declare-fun lt!119480 () Unit!7272)

(assert (=> b!236464 (= lt!119480 lt!119465)))

(declare-fun lt!119477 () ListLongMap!3529)

(assert (=> b!236464 (= lt!119477 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119461 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119461 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119466 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119466 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119476 () Unit!7272)

(declare-fun addApplyDifferent!190 (ListLongMap!3529 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7272)

(assert (=> b!236464 (= lt!119476 (addApplyDifferent!190 lt!119477 lt!119461 (minValue!4234 thiss!1504) lt!119466))))

(assert (=> b!236464 (= (apply!214 (+!647 lt!119477 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))) lt!119466) (apply!214 lt!119477 lt!119466))))

(declare-fun lt!119471 () Unit!7272)

(assert (=> b!236464 (= lt!119471 lt!119476)))

(declare-fun lt!119459 () ListLongMap!3529)

(assert (=> b!236464 (= lt!119459 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119460 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119473 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119473 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119478 () Unit!7272)

(assert (=> b!236464 (= lt!119478 (addApplyDifferent!190 lt!119459 lt!119460 (zeroValue!4234 thiss!1504) lt!119473))))

(assert (=> b!236464 (= (apply!214 (+!647 lt!119459 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))) lt!119473) (apply!214 lt!119459 lt!119473))))

(declare-fun lt!119468 () Unit!7272)

(assert (=> b!236464 (= lt!119468 lt!119478)))

(declare-fun lt!119462 () ListLongMap!3529)

(assert (=> b!236464 (= lt!119462 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119467 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119463 () (_ BitVec 64))

(assert (=> b!236464 (= lt!119463 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236464 (= lt!119469 (addApplyDifferent!190 lt!119462 lt!119467 (minValue!4234 thiss!1504) lt!119463))))

(assert (=> b!236464 (= (apply!214 (+!647 lt!119462 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))) lt!119463) (apply!214 lt!119462 lt!119463))))

(declare-fun d!59285 () Bool)

(declare-fun e!153572 () Bool)

(assert (=> d!59285 e!153572))

(declare-fun res!115919 () Bool)

(assert (=> d!59285 (=> (not res!115919) (not e!153572))))

(assert (=> d!59285 (= res!115919 (or (bvsge #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))))

(declare-fun lt!119472 () ListLongMap!3529)

(assert (=> d!59285 (= lt!119479 lt!119472)))

(declare-fun lt!119474 () Unit!7272)

(assert (=> d!59285 (= lt!119474 e!153569)))

(declare-fun c!39389 () Bool)

(declare-fun e!153571 () Bool)

(assert (=> d!59285 (= c!39389 e!153571)))

(declare-fun res!115923 () Bool)

(assert (=> d!59285 (=> (not res!115923) (not e!153571))))

(assert (=> d!59285 (= res!115923 (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun e!153568 () ListLongMap!3529)

(assert (=> d!59285 (= lt!119472 e!153568)))

(declare-fun c!39387 () Bool)

(assert (=> d!59285 (= c!39387 (and (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59285 (validMask!0 (mask!10385 thiss!1504))))

(assert (=> d!59285 (= (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) lt!119479)))

(declare-fun bm!21976 () Bool)

(declare-fun c!39388 () Bool)

(assert (=> bm!21976 (= call!21979 (+!647 (ite c!39387 call!21978 (ite c!39388 call!21981 call!21980)) (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(declare-fun b!236465 () Bool)

(declare-fun e!153567 () Bool)

(assert (=> b!236465 (= e!153567 e!153575)))

(declare-fun res!115921 () Bool)

(declare-fun call!21977 () Bool)

(assert (=> b!236465 (= res!115921 call!21977)))

(assert (=> b!236465 (=> (not res!115921) (not e!153575))))

(declare-fun bm!21977 () Bool)

(assert (=> bm!21977 (= call!21980 call!21981)))

(declare-fun b!236466 () Bool)

(declare-fun res!115925 () Bool)

(assert (=> b!236466 (=> (not res!115925) (not e!153572))))

(assert (=> b!236466 (= res!115925 e!153577)))

(declare-fun res!115918 () Bool)

(assert (=> b!236466 (=> res!115918 e!153577)))

(assert (=> b!236466 (= res!115918 (not e!153565))))

(declare-fun res!115920 () Bool)

(assert (=> b!236466 (=> (not res!115920) (not e!153565))))

(assert (=> b!236466 (= res!115920 (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun b!236467 () Bool)

(declare-fun Unit!7275 () Unit!7272)

(assert (=> b!236467 (= e!153569 Unit!7275)))

(declare-fun b!236468 () Bool)

(assert (=> b!236468 (= e!153567 (not call!21977))))

(declare-fun b!236469 () Bool)

(declare-fun e!153573 () ListLongMap!3529)

(assert (=> b!236469 (= e!153568 e!153573)))

(assert (=> b!236469 (= c!39388 (and (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236470 () Bool)

(declare-fun res!115924 () Bool)

(assert (=> b!236470 (=> (not res!115924) (not e!153572))))

(assert (=> b!236470 (= res!115924 e!153567)))

(declare-fun c!39385 () Bool)

(assert (=> b!236470 (= c!39385 (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236471 () Bool)

(declare-fun e!153574 () Bool)

(assert (=> b!236471 (= e!153570 e!153574)))

(declare-fun res!115926 () Bool)

(assert (=> b!236471 (= res!115926 call!21975)))

(assert (=> b!236471 (=> (not res!115926) (not e!153574))))

(declare-fun b!236472 () Bool)

(assert (=> b!236472 (= e!153568 (+!647 call!21979 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))

(declare-fun b!236473 () Bool)

(assert (=> b!236473 (= e!153571 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236474 () Bool)

(assert (=> b!236474 (= e!153572 e!153570)))

(declare-fun c!39386 () Bool)

(assert (=> b!236474 (= c!39386 (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21978 () Bool)

(assert (=> bm!21978 (= call!21977 (contains!1663 lt!119479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236475 () Bool)

(assert (=> b!236475 (= e!153574 (= (apply!214 lt!119479 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4234 thiss!1504)))))

(declare-fun b!236476 () Bool)

(assert (=> b!236476 (= e!153573 call!21976)))

(declare-fun b!236477 () Bool)

(declare-fun c!39390 () Bool)

(assert (=> b!236477 (= c!39390 (and (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!236477 (= e!153573 e!153576)))

(assert (= (and d!59285 c!39387) b!236472))

(assert (= (and d!59285 (not c!39387)) b!236469))

(assert (= (and b!236469 c!39388) b!236476))

(assert (= (and b!236469 (not c!39388)) b!236477))

(assert (= (and b!236477 c!39390) b!236463))

(assert (= (and b!236477 (not c!39390)) b!236457))

(assert (= (or b!236463 b!236457) bm!21977))

(assert (= (or b!236476 bm!21977) bm!21974))

(assert (= (or b!236476 b!236463) bm!21973))

(assert (= (or b!236472 bm!21974) bm!21972))

(assert (= (or b!236472 bm!21973) bm!21976))

(assert (= (and d!59285 res!115923) b!236473))

(assert (= (and d!59285 c!39389) b!236464))

(assert (= (and d!59285 (not c!39389)) b!236467))

(assert (= (and d!59285 res!115919) b!236466))

(assert (= (and b!236466 res!115920) b!236462))

(assert (= (and b!236466 (not res!115918)) b!236460))

(assert (= (and b!236460 res!115922) b!236459))

(assert (= (and b!236466 res!115925) b!236470))

(assert (= (and b!236470 c!39385) b!236465))

(assert (= (and b!236470 (not c!39385)) b!236468))

(assert (= (and b!236465 res!115921) b!236461))

(assert (= (or b!236465 b!236468) bm!21978))

(assert (= (and b!236470 res!115924) b!236474))

(assert (= (and b!236474 c!39386) b!236471))

(assert (= (and b!236474 (not c!39386)) b!236458))

(assert (= (and b!236471 res!115926) b!236475))

(assert (= (or b!236471 b!236458) bm!21975))

(declare-fun b_lambda!7909 () Bool)

(assert (=> (not b_lambda!7909) (not b!236459)))

(declare-fun t!8523 () Bool)

(declare-fun tb!2933 () Bool)

(assert (=> (and b!236351 (= (defaultEntry!4393 thiss!1504) (defaultEntry!4393 thiss!1504)) t!8523) tb!2933))

(declare-fun result!5137 () Bool)

(assert (=> tb!2933 (= result!5137 tp_is_empty!6223)))

(assert (=> b!236459 t!8523))

(declare-fun b_and!13281 () Bool)

(assert (= b_and!13275 (and (=> t!8523 result!5137) b_and!13281)))

(declare-fun m!256811 () Bool)

(assert (=> b!236459 m!256811))

(declare-fun m!256813 () Bool)

(assert (=> b!236459 m!256813))

(assert (=> b!236459 m!256811))

(declare-fun m!256815 () Bool)

(assert (=> b!236459 m!256815))

(declare-fun m!256817 () Bool)

(assert (=> b!236459 m!256817))

(declare-fun m!256819 () Bool)

(assert (=> b!236459 m!256819))

(assert (=> b!236459 m!256813))

(assert (=> b!236459 m!256817))

(declare-fun m!256821 () Bool)

(assert (=> bm!21972 m!256821))

(declare-fun m!256823 () Bool)

(assert (=> b!236472 m!256823))

(assert (=> b!236473 m!256817))

(assert (=> b!236473 m!256817))

(declare-fun m!256825 () Bool)

(assert (=> b!236473 m!256825))

(assert (=> b!236462 m!256817))

(assert (=> b!236462 m!256817))

(assert (=> b!236462 m!256825))

(declare-fun m!256827 () Bool)

(assert (=> b!236475 m!256827))

(declare-fun m!256829 () Bool)

(assert (=> b!236464 m!256829))

(declare-fun m!256831 () Bool)

(assert (=> b!236464 m!256831))

(declare-fun m!256833 () Bool)

(assert (=> b!236464 m!256833))

(assert (=> b!236464 m!256829))

(declare-fun m!256835 () Bool)

(assert (=> b!236464 m!256835))

(declare-fun m!256837 () Bool)

(assert (=> b!236464 m!256837))

(declare-fun m!256839 () Bool)

(assert (=> b!236464 m!256839))

(declare-fun m!256841 () Bool)

(assert (=> b!236464 m!256841))

(declare-fun m!256843 () Bool)

(assert (=> b!236464 m!256843))

(declare-fun m!256845 () Bool)

(assert (=> b!236464 m!256845))

(declare-fun m!256847 () Bool)

(assert (=> b!236464 m!256847))

(declare-fun m!256849 () Bool)

(assert (=> b!236464 m!256849))

(assert (=> b!236464 m!256849))

(declare-fun m!256851 () Bool)

(assert (=> b!236464 m!256851))

(assert (=> b!236464 m!256839))

(declare-fun m!256853 () Bool)

(assert (=> b!236464 m!256853))

(assert (=> b!236464 m!256835))

(declare-fun m!256855 () Bool)

(assert (=> b!236464 m!256855))

(declare-fun m!256857 () Bool)

(assert (=> b!236464 m!256857))

(assert (=> b!236464 m!256821))

(assert (=> b!236464 m!256817))

(declare-fun m!256859 () Bool)

(assert (=> bm!21976 m!256859))

(declare-fun m!256861 () Bool)

(assert (=> bm!21978 m!256861))

(assert (=> b!236460 m!256817))

(assert (=> b!236460 m!256817))

(declare-fun m!256863 () Bool)

(assert (=> b!236460 m!256863))

(declare-fun m!256865 () Bool)

(assert (=> b!236461 m!256865))

(assert (=> d!59285 m!256761))

(declare-fun m!256867 () Bool)

(assert (=> bm!21975 m!256867))

(assert (=> b!236350 d!59285))

(declare-fun d!59287 () Bool)

(declare-fun res!115933 () Bool)

(declare-fun e!153580 () Bool)

(assert (=> d!59287 (=> (not res!115933) (not e!153580))))

(declare-fun simpleValid!237 (LongMapFixedSize!3436) Bool)

(assert (=> d!59287 (= res!115933 (simpleValid!237 thiss!1504))))

(assert (=> d!59287 (= (valid!1364 thiss!1504) e!153580)))

(declare-fun b!236486 () Bool)

(declare-fun res!115934 () Bool)

(assert (=> b!236486 (=> (not res!115934) (not e!153580))))

(declare-fun arrayCountValidKeys!0 (array!11705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236486 (= res!115934 (= (arrayCountValidKeys!0 (_keys!6475 thiss!1504) #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))) (_size!1767 thiss!1504)))))

(declare-fun b!236487 () Bool)

(declare-fun res!115935 () Bool)

(assert (=> b!236487 (=> (not res!115935) (not e!153580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11705 (_ BitVec 32)) Bool)

(assert (=> b!236487 (= res!115935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(declare-fun b!236488 () Bool)

(declare-datatypes ((List!3550 0))(
  ( (Nil!3547) (Cons!3546 (h!4199 (_ BitVec 64)) (t!8524 List!3550)) )
))
(declare-fun arrayNoDuplicates!0 (array!11705 (_ BitVec 32) List!3550) Bool)

(assert (=> b!236488 (= e!153580 (arrayNoDuplicates!0 (_keys!6475 thiss!1504) #b00000000000000000000000000000000 Nil!3547))))

(assert (= (and d!59287 res!115933) b!236486))

(assert (= (and b!236486 res!115934) b!236487))

(assert (= (and b!236487 res!115935) b!236488))

(declare-fun m!256869 () Bool)

(assert (=> d!59287 m!256869))

(declare-fun m!256871 () Bool)

(assert (=> b!236486 m!256871))

(declare-fun m!256873 () Bool)

(assert (=> b!236487 m!256873))

(declare-fun m!256875 () Bool)

(assert (=> b!236488 m!256875))

(assert (=> start!22644 d!59287))

(declare-fun b!236501 () Bool)

(declare-fun e!153589 () SeekEntryResult!1000)

(declare-fun e!153587 () SeekEntryResult!1000)

(assert (=> b!236501 (= e!153589 e!153587)))

(declare-fun lt!119487 () (_ BitVec 64))

(declare-fun lt!119489 () SeekEntryResult!1000)

(assert (=> b!236501 (= lt!119487 (select (arr!5560 (_keys!6475 thiss!1504)) (index!6172 lt!119489)))))

(declare-fun c!39399 () Bool)

(assert (=> b!236501 (= c!39399 (= lt!119487 key!932))))

(declare-fun b!236502 () Bool)

(assert (=> b!236502 (= e!153587 (Found!1000 (index!6172 lt!119489)))))

(declare-fun d!59289 () Bool)

(declare-fun lt!119488 () SeekEntryResult!1000)

(assert (=> d!59289 (and (or ((_ is Undefined!1000) lt!119488) (not ((_ is Found!1000) lt!119488)) (and (bvsge (index!6171 lt!119488) #b00000000000000000000000000000000) (bvslt (index!6171 lt!119488) (size!5899 (_keys!6475 thiss!1504))))) (or ((_ is Undefined!1000) lt!119488) ((_ is Found!1000) lt!119488) (not ((_ is MissingZero!1000) lt!119488)) (and (bvsge (index!6170 lt!119488) #b00000000000000000000000000000000) (bvslt (index!6170 lt!119488) (size!5899 (_keys!6475 thiss!1504))))) (or ((_ is Undefined!1000) lt!119488) ((_ is Found!1000) lt!119488) ((_ is MissingZero!1000) lt!119488) (not ((_ is MissingVacant!1000) lt!119488)) (and (bvsge (index!6173 lt!119488) #b00000000000000000000000000000000) (bvslt (index!6173 lt!119488) (size!5899 (_keys!6475 thiss!1504))))) (or ((_ is Undefined!1000) lt!119488) (ite ((_ is Found!1000) lt!119488) (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6171 lt!119488)) key!932) (ite ((_ is MissingZero!1000) lt!119488) (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6170 lt!119488)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1000) lt!119488) (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6173 lt!119488)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59289 (= lt!119488 e!153589)))

(declare-fun c!39397 () Bool)

(assert (=> d!59289 (= c!39397 (and ((_ is Intermediate!1000) lt!119489) (undefined!1812 lt!119489)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11705 (_ BitVec 32)) SeekEntryResult!1000)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59289 (= lt!119489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10385 thiss!1504)) key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(assert (=> d!59289 (validMask!0 (mask!10385 thiss!1504))))

(assert (=> d!59289 (= (seekEntryOrOpen!0 key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)) lt!119488)))

(declare-fun b!236503 () Bool)

(assert (=> b!236503 (= e!153589 Undefined!1000)))

(declare-fun e!153588 () SeekEntryResult!1000)

(declare-fun b!236504 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11705 (_ BitVec 32)) SeekEntryResult!1000)

(assert (=> b!236504 (= e!153588 (seekKeyOrZeroReturnVacant!0 (x!23881 lt!119489) (index!6172 lt!119489) (index!6172 lt!119489) key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(declare-fun b!236505 () Bool)

(assert (=> b!236505 (= e!153588 (MissingZero!1000 (index!6172 lt!119489)))))

(declare-fun b!236506 () Bool)

(declare-fun c!39398 () Bool)

(assert (=> b!236506 (= c!39398 (= lt!119487 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236506 (= e!153587 e!153588)))

(assert (= (and d!59289 c!39397) b!236503))

(assert (= (and d!59289 (not c!39397)) b!236501))

(assert (= (and b!236501 c!39399) b!236502))

(assert (= (and b!236501 (not c!39399)) b!236506))

(assert (= (and b!236506 c!39398) b!236505))

(assert (= (and b!236506 (not c!39398)) b!236504))

(declare-fun m!256877 () Bool)

(assert (=> b!236501 m!256877))

(assert (=> d!59289 m!256761))

(declare-fun m!256879 () Bool)

(assert (=> d!59289 m!256879))

(declare-fun m!256881 () Bool)

(assert (=> d!59289 m!256881))

(declare-fun m!256883 () Bool)

(assert (=> d!59289 m!256883))

(declare-fun m!256885 () Bool)

(assert (=> d!59289 m!256885))

(assert (=> d!59289 m!256885))

(declare-fun m!256887 () Bool)

(assert (=> d!59289 m!256887))

(declare-fun m!256889 () Bool)

(assert (=> b!236504 m!256889))

(assert (=> b!236348 d!59289))

(declare-fun mapNonEmpty!10551 () Bool)

(declare-fun mapRes!10551 () Bool)

(declare-fun tp!22278 () Bool)

(declare-fun e!153595 () Bool)

(assert (=> mapNonEmpty!10551 (= mapRes!10551 (and tp!22278 e!153595))))

(declare-fun mapRest!10551 () (Array (_ BitVec 32) ValueCell!2768))

(declare-fun mapValue!10551 () ValueCell!2768)

(declare-fun mapKey!10551 () (_ BitVec 32))

(assert (=> mapNonEmpty!10551 (= mapRest!10542 (store mapRest!10551 mapKey!10551 mapValue!10551))))

(declare-fun b!236513 () Bool)

(assert (=> b!236513 (= e!153595 tp_is_empty!6223)))

(declare-fun condMapEmpty!10551 () Bool)

(declare-fun mapDefault!10551 () ValueCell!2768)

(assert (=> mapNonEmpty!10542 (= condMapEmpty!10551 (= mapRest!10542 ((as const (Array (_ BitVec 32) ValueCell!2768)) mapDefault!10551)))))

(declare-fun e!153594 () Bool)

(assert (=> mapNonEmpty!10542 (= tp!22263 (and e!153594 mapRes!10551))))

(declare-fun mapIsEmpty!10551 () Bool)

(assert (=> mapIsEmpty!10551 mapRes!10551))

(declare-fun b!236514 () Bool)

(assert (=> b!236514 (= e!153594 tp_is_empty!6223)))

(assert (= (and mapNonEmpty!10542 condMapEmpty!10551) mapIsEmpty!10551))

(assert (= (and mapNonEmpty!10542 (not condMapEmpty!10551)) mapNonEmpty!10551))

(assert (= (and mapNonEmpty!10551 ((_ is ValueCellFull!2768) mapValue!10551)) b!236513))

(assert (= (and mapNonEmpty!10542 ((_ is ValueCellFull!2768) mapDefault!10551)) b!236514))

(declare-fun m!256891 () Bool)

(assert (=> mapNonEmpty!10551 m!256891))

(declare-fun b_lambda!7911 () Bool)

(assert (= b_lambda!7909 (or (and b!236351 b_free!6361) b_lambda!7911)))

(check-sat (not b!236462) (not b_next!6361) (not b!236412) (not d!59289) (not b!236487) (not b!236486) (not b!236459) (not b_lambda!7911) (not bm!21972) (not b!236464) (not b!236461) (not b!236488) (not d!59285) (not bm!21976) (not b!236504) (not b!236472) (not d!59283) tp_is_empty!6223 (not bm!21975) (not d!59287) (not b!236460) b_and!13281 (not b!236473) (not b!236414) (not mapNonEmpty!10551) (not bm!21978) (not b!236475))
(check-sat b_and!13281 (not b_next!6361))
(get-model)

(declare-fun d!59291 () Bool)

(declare-fun e!153598 () Bool)

(assert (=> d!59291 e!153598))

(declare-fun res!115941 () Bool)

(assert (=> d!59291 (=> (not res!115941) (not e!153598))))

(declare-fun lt!119498 () ListLongMap!3529)

(assert (=> d!59291 (= res!115941 (contains!1663 lt!119498 (_1!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(declare-fun lt!119501 () List!3547)

(assert (=> d!59291 (= lt!119498 (ListLongMap!3530 lt!119501))))

(declare-fun lt!119500 () Unit!7272)

(declare-fun lt!119499 () Unit!7272)

(assert (=> d!59291 (= lt!119500 lt!119499)))

(assert (=> d!59291 (= (getValueByKey!270 lt!119501 (_1!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))) (Some!275 (_2!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!153 (List!3547 (_ BitVec 64) V!7945) Unit!7272)

(assert (=> d!59291 (= lt!119499 (lemmaContainsTupThenGetReturnValue!153 lt!119501 (_1!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (_2!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(declare-fun insertStrictlySorted!156 (List!3547 (_ BitVec 64) V!7945) List!3547)

(assert (=> d!59291 (= lt!119501 (insertStrictlySorted!156 (toList!1780 (ite c!39387 call!21978 (ite c!39388 call!21981 call!21980))) (_1!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (_2!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(assert (=> d!59291 (= (+!647 (ite c!39387 call!21978 (ite c!39388 call!21981 call!21980)) (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) lt!119498)))

(declare-fun b!236519 () Bool)

(declare-fun res!115940 () Bool)

(assert (=> b!236519 (=> (not res!115940) (not e!153598))))

(assert (=> b!236519 (= res!115940 (= (getValueByKey!270 (toList!1780 lt!119498) (_1!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))) (Some!275 (_2!2324 (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))))

(declare-fun b!236520 () Bool)

(declare-fun contains!1666 (List!3547 tuple2!4626) Bool)

(assert (=> b!236520 (= e!153598 (contains!1666 (toList!1780 lt!119498) (ite (or c!39387 c!39388) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(assert (= (and d!59291 res!115941) b!236519))

(assert (= (and b!236519 res!115940) b!236520))

(declare-fun m!256893 () Bool)

(assert (=> d!59291 m!256893))

(declare-fun m!256895 () Bool)

(assert (=> d!59291 m!256895))

(declare-fun m!256897 () Bool)

(assert (=> d!59291 m!256897))

(declare-fun m!256899 () Bool)

(assert (=> d!59291 m!256899))

(declare-fun m!256901 () Bool)

(assert (=> b!236519 m!256901))

(declare-fun m!256903 () Bool)

(assert (=> b!236520 m!256903))

(assert (=> bm!21976 d!59291))

(declare-fun d!59293 () Bool)

(assert (=> d!59293 (= (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236473 d!59293))

(declare-fun b!236545 () Bool)

(declare-fun e!153615 () Bool)

(declare-fun e!153616 () Bool)

(assert (=> b!236545 (= e!153615 e!153616)))

(assert (=> b!236545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun res!115951 () Bool)

(declare-fun lt!119522 () ListLongMap!3529)

(assert (=> b!236545 (= res!115951 (contains!1663 lt!119522 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236545 (=> (not res!115951) (not e!153616))))

(declare-fun b!236546 () Bool)

(declare-fun e!153617 () Bool)

(declare-fun isEmpty!518 (ListLongMap!3529) Bool)

(assert (=> b!236546 (= e!153617 (isEmpty!518 lt!119522))))

(declare-fun b!236547 () Bool)

(assert (=> b!236547 (= e!153617 (= lt!119522 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4393 thiss!1504))))))

(declare-fun b!236548 () Bool)

(declare-fun e!153618 () ListLongMap!3529)

(declare-fun call!21984 () ListLongMap!3529)

(assert (=> b!236548 (= e!153618 call!21984)))

(declare-fun b!236549 () Bool)

(assert (=> b!236549 (= e!153615 e!153617)))

(declare-fun c!39409 () Bool)

(assert (=> b!236549 (= c!39409 (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun d!59295 () Bool)

(declare-fun e!153614 () Bool)

(assert (=> d!59295 e!153614))

(declare-fun res!115950 () Bool)

(assert (=> d!59295 (=> (not res!115950) (not e!153614))))

(assert (=> d!59295 (= res!115950 (not (contains!1663 lt!119522 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!153619 () ListLongMap!3529)

(assert (=> d!59295 (= lt!119522 e!153619)))

(declare-fun c!39408 () Bool)

(assert (=> d!59295 (= c!39408 (bvsge #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> d!59295 (validMask!0 (mask!10385 thiss!1504))))

(assert (=> d!59295 (= (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) lt!119522)))

(declare-fun b!236550 () Bool)

(declare-fun res!115952 () Bool)

(assert (=> b!236550 (=> (not res!115952) (not e!153614))))

(assert (=> b!236550 (= res!115952 (not (contains!1663 lt!119522 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236551 () Bool)

(declare-fun lt!119518 () Unit!7272)

(declare-fun lt!119517 () Unit!7272)

(assert (=> b!236551 (= lt!119518 lt!119517)))

(declare-fun lt!119519 () ListLongMap!3529)

(declare-fun lt!119520 () (_ BitVec 64))

(declare-fun lt!119516 () (_ BitVec 64))

(declare-fun lt!119521 () V!7945)

(assert (=> b!236551 (not (contains!1663 (+!647 lt!119519 (tuple2!4627 lt!119516 lt!119521)) lt!119520))))

(declare-fun addStillNotContains!117 (ListLongMap!3529 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7272)

(assert (=> b!236551 (= lt!119517 (addStillNotContains!117 lt!119519 lt!119516 lt!119521 lt!119520))))

(assert (=> b!236551 (= lt!119520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!236551 (= lt!119521 (get!2856 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236551 (= lt!119516 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236551 (= lt!119519 call!21984)))

(assert (=> b!236551 (= e!153618 (+!647 call!21984 (tuple2!4627 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000) (get!2856 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!236552 () Bool)

(assert (=> b!236552 (= e!153619 e!153618)))

(declare-fun c!39410 () Bool)

(assert (=> b!236552 (= c!39410 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236553 () Bool)

(assert (=> b!236553 (= e!153614 e!153615)))

(declare-fun c!39411 () Bool)

(declare-fun e!153613 () Bool)

(assert (=> b!236553 (= c!39411 e!153613)))

(declare-fun res!115953 () Bool)

(assert (=> b!236553 (=> (not res!115953) (not e!153613))))

(assert (=> b!236553 (= res!115953 (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun b!236554 () Bool)

(assert (=> b!236554 (= e!153619 (ListLongMap!3530 Nil!3544))))

(declare-fun b!236555 () Bool)

(assert (=> b!236555 (= e!153613 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236555 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!21981 () Bool)

(assert (=> bm!21981 (= call!21984 (getCurrentListMapNoExtraKeys!530 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4393 thiss!1504)))))

(declare-fun b!236556 () Bool)

(assert (=> b!236556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> b!236556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_values!4376 thiss!1504))))))

(assert (=> b!236556 (= e!153616 (= (apply!214 lt!119522 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)) (get!2856 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!59295 c!39408) b!236554))

(assert (= (and d!59295 (not c!39408)) b!236552))

(assert (= (and b!236552 c!39410) b!236551))

(assert (= (and b!236552 (not c!39410)) b!236548))

(assert (= (or b!236551 b!236548) bm!21981))

(assert (= (and d!59295 res!115950) b!236550))

(assert (= (and b!236550 res!115952) b!236553))

(assert (= (and b!236553 res!115953) b!236555))

(assert (= (and b!236553 c!39411) b!236545))

(assert (= (and b!236553 (not c!39411)) b!236549))

(assert (= (and b!236545 res!115951) b!236556))

(assert (= (and b!236549 c!39409) b!236547))

(assert (= (and b!236549 (not c!39409)) b!236546))

(declare-fun b_lambda!7913 () Bool)

(assert (=> (not b_lambda!7913) (not b!236551)))

(assert (=> b!236551 t!8523))

(declare-fun b_and!13283 () Bool)

(assert (= b_and!13281 (and (=> t!8523 result!5137) b_and!13283)))

(declare-fun b_lambda!7915 () Bool)

(assert (=> (not b_lambda!7915) (not b!236556)))

(assert (=> b!236556 t!8523))

(declare-fun b_and!13285 () Bool)

(assert (= b_and!13283 (and (=> t!8523 result!5137) b_and!13285)))

(declare-fun m!256905 () Bool)

(assert (=> b!236551 m!256905))

(assert (=> b!236551 m!256905))

(declare-fun m!256907 () Bool)

(assert (=> b!236551 m!256907))

(declare-fun m!256909 () Bool)

(assert (=> b!236551 m!256909))

(declare-fun m!256911 () Bool)

(assert (=> b!236551 m!256911))

(assert (=> b!236551 m!256817))

(assert (=> b!236551 m!256813))

(assert (=> b!236551 m!256813))

(assert (=> b!236551 m!256811))

(assert (=> b!236551 m!256815))

(assert (=> b!236551 m!256811))

(declare-fun m!256913 () Bool)

(assert (=> bm!21981 m!256913))

(assert (=> b!236555 m!256817))

(assert (=> b!236555 m!256817))

(assert (=> b!236555 m!256825))

(assert (=> b!236547 m!256913))

(declare-fun m!256915 () Bool)

(assert (=> d!59295 m!256915))

(assert (=> d!59295 m!256761))

(assert (=> b!236552 m!256817))

(assert (=> b!236552 m!256817))

(assert (=> b!236552 m!256825))

(declare-fun m!256917 () Bool)

(assert (=> b!236550 m!256917))

(assert (=> b!236545 m!256817))

(assert (=> b!236545 m!256817))

(declare-fun m!256919 () Bool)

(assert (=> b!236545 m!256919))

(assert (=> b!236556 m!256817))

(declare-fun m!256921 () Bool)

(assert (=> b!236556 m!256921))

(assert (=> b!236556 m!256817))

(assert (=> b!236556 m!256813))

(assert (=> b!236556 m!256813))

(assert (=> b!236556 m!256811))

(assert (=> b!236556 m!256815))

(assert (=> b!236556 m!256811))

(declare-fun m!256923 () Bool)

(assert (=> b!236546 m!256923))

(assert (=> bm!21972 d!59295))

(declare-fun d!59297 () Bool)

(assert (=> d!59297 (= (apply!214 (+!647 lt!119462 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))) lt!119463) (apply!214 lt!119462 lt!119463))))

(declare-fun lt!119525 () Unit!7272)

(declare-fun choose!1114 (ListLongMap!3529 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7272)

(assert (=> d!59297 (= lt!119525 (choose!1114 lt!119462 lt!119467 (minValue!4234 thiss!1504) lt!119463))))

(declare-fun e!153622 () Bool)

(assert (=> d!59297 e!153622))

(declare-fun res!115956 () Bool)

(assert (=> d!59297 (=> (not res!115956) (not e!153622))))

(assert (=> d!59297 (= res!115956 (contains!1663 lt!119462 lt!119463))))

(assert (=> d!59297 (= (addApplyDifferent!190 lt!119462 lt!119467 (minValue!4234 thiss!1504) lt!119463) lt!119525)))

(declare-fun b!236560 () Bool)

(assert (=> b!236560 (= e!153622 (not (= lt!119463 lt!119467)))))

(assert (= (and d!59297 res!115956) b!236560))

(assert (=> d!59297 m!256835))

(assert (=> d!59297 m!256837))

(assert (=> d!59297 m!256835))

(assert (=> d!59297 m!256841))

(declare-fun m!256925 () Bool)

(assert (=> d!59297 m!256925))

(declare-fun m!256927 () Bool)

(assert (=> d!59297 m!256927))

(assert (=> b!236464 d!59297))

(declare-fun d!59299 () Bool)

(declare-fun get!2857 (Option!276) V!7945)

(assert (=> d!59299 (= (apply!214 lt!119462 lt!119463) (get!2857 (getValueByKey!270 (toList!1780 lt!119462) lt!119463)))))

(declare-fun bs!8716 () Bool)

(assert (= bs!8716 d!59299))

(declare-fun m!256929 () Bool)

(assert (=> bs!8716 m!256929))

(assert (=> bs!8716 m!256929))

(declare-fun m!256931 () Bool)

(assert (=> bs!8716 m!256931))

(assert (=> b!236464 d!59299))

(declare-fun d!59301 () Bool)

(declare-fun e!153623 () Bool)

(assert (=> d!59301 e!153623))

(declare-fun res!115957 () Bool)

(assert (=> d!59301 (=> res!115957 e!153623)))

(declare-fun lt!119527 () Bool)

(assert (=> d!59301 (= res!115957 (not lt!119527))))

(declare-fun lt!119526 () Bool)

(assert (=> d!59301 (= lt!119527 lt!119526)))

(declare-fun lt!119528 () Unit!7272)

(declare-fun e!153624 () Unit!7272)

(assert (=> d!59301 (= lt!119528 e!153624)))

(declare-fun c!39412 () Bool)

(assert (=> d!59301 (= c!39412 lt!119526)))

(assert (=> d!59301 (= lt!119526 (containsKey!262 (toList!1780 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))) lt!119464))))

(assert (=> d!59301 (= (contains!1663 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))) lt!119464) lt!119527)))

(declare-fun b!236561 () Bool)

(declare-fun lt!119529 () Unit!7272)

(assert (=> b!236561 (= e!153624 lt!119529)))

(assert (=> b!236561 (= lt!119529 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1780 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))) lt!119464))))

(assert (=> b!236561 (isDefined!212 (getValueByKey!270 (toList!1780 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))) lt!119464))))

(declare-fun b!236562 () Bool)

(declare-fun Unit!7276 () Unit!7272)

(assert (=> b!236562 (= e!153624 Unit!7276)))

(declare-fun b!236563 () Bool)

(assert (=> b!236563 (= e!153623 (isDefined!212 (getValueByKey!270 (toList!1780 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))) lt!119464)))))

(assert (= (and d!59301 c!39412) b!236561))

(assert (= (and d!59301 (not c!39412)) b!236562))

(assert (= (and d!59301 (not res!115957)) b!236563))

(declare-fun m!256933 () Bool)

(assert (=> d!59301 m!256933))

(declare-fun m!256935 () Bool)

(assert (=> b!236561 m!256935))

(declare-fun m!256937 () Bool)

(assert (=> b!236561 m!256937))

(assert (=> b!236561 m!256937))

(declare-fun m!256939 () Bool)

(assert (=> b!236561 m!256939))

(assert (=> b!236563 m!256937))

(assert (=> b!236563 m!256937))

(assert (=> b!236563 m!256939))

(assert (=> b!236464 d!59301))

(declare-fun d!59303 () Bool)

(declare-fun e!153625 () Bool)

(assert (=> d!59303 e!153625))

(declare-fun res!115959 () Bool)

(assert (=> d!59303 (=> (not res!115959) (not e!153625))))

(declare-fun lt!119530 () ListLongMap!3529)

(assert (=> d!59303 (= res!115959 (contains!1663 lt!119530 (_1!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))))))

(declare-fun lt!119533 () List!3547)

(assert (=> d!59303 (= lt!119530 (ListLongMap!3530 lt!119533))))

(declare-fun lt!119532 () Unit!7272)

(declare-fun lt!119531 () Unit!7272)

(assert (=> d!59303 (= lt!119532 lt!119531)))

(assert (=> d!59303 (= (getValueByKey!270 lt!119533 (_1!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59303 (= lt!119531 (lemmaContainsTupThenGetReturnValue!153 lt!119533 (_1!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59303 (= lt!119533 (insertStrictlySorted!156 (toList!1780 lt!119470) (_1!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59303 (= (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))) lt!119530)))

(declare-fun b!236564 () Bool)

(declare-fun res!115958 () Bool)

(assert (=> b!236564 (=> (not res!115958) (not e!153625))))

(assert (=> b!236564 (= res!115958 (= (getValueByKey!270 (toList!1780 lt!119530) (_1!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))))))))

(declare-fun b!236565 () Bool)

(assert (=> b!236565 (= e!153625 (contains!1666 (toList!1780 lt!119530) (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))))))

(assert (= (and d!59303 res!115959) b!236564))

(assert (= (and b!236564 res!115958) b!236565))

(declare-fun m!256941 () Bool)

(assert (=> d!59303 m!256941))

(declare-fun m!256943 () Bool)

(assert (=> d!59303 m!256943))

(declare-fun m!256945 () Bool)

(assert (=> d!59303 m!256945))

(declare-fun m!256947 () Bool)

(assert (=> d!59303 m!256947))

(declare-fun m!256949 () Bool)

(assert (=> b!236564 m!256949))

(declare-fun m!256951 () Bool)

(assert (=> b!236565 m!256951))

(assert (=> b!236464 d!59303))

(declare-fun d!59305 () Bool)

(assert (=> d!59305 (= (apply!214 (+!647 lt!119477 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))) lt!119466) (get!2857 (getValueByKey!270 (toList!1780 (+!647 lt!119477 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))) lt!119466)))))

(declare-fun bs!8717 () Bool)

(assert (= bs!8717 d!59305))

(declare-fun m!256953 () Bool)

(assert (=> bs!8717 m!256953))

(assert (=> bs!8717 m!256953))

(declare-fun m!256955 () Bool)

(assert (=> bs!8717 m!256955))

(assert (=> b!236464 d!59305))

(declare-fun d!59307 () Bool)

(assert (=> d!59307 (= (apply!214 (+!647 lt!119459 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))) lt!119473) (get!2857 (getValueByKey!270 (toList!1780 (+!647 lt!119459 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))) lt!119473)))))

(declare-fun bs!8718 () Bool)

(assert (= bs!8718 d!59307))

(declare-fun m!256957 () Bool)

(assert (=> bs!8718 m!256957))

(assert (=> bs!8718 m!256957))

(declare-fun m!256959 () Bool)

(assert (=> bs!8718 m!256959))

(assert (=> b!236464 d!59307))

(declare-fun d!59309 () Bool)

(declare-fun e!153626 () Bool)

(assert (=> d!59309 e!153626))

(declare-fun res!115961 () Bool)

(assert (=> d!59309 (=> (not res!115961) (not e!153626))))

(declare-fun lt!119534 () ListLongMap!3529)

(assert (=> d!59309 (= res!115961 (contains!1663 lt!119534 (_1!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))))))

(declare-fun lt!119537 () List!3547)

(assert (=> d!59309 (= lt!119534 (ListLongMap!3530 lt!119537))))

(declare-fun lt!119536 () Unit!7272)

(declare-fun lt!119535 () Unit!7272)

(assert (=> d!59309 (= lt!119536 lt!119535)))

(assert (=> d!59309 (= (getValueByKey!270 lt!119537 (_1!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))))))

(assert (=> d!59309 (= lt!119535 (lemmaContainsTupThenGetReturnValue!153 lt!119537 (_1!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))))))

(assert (=> d!59309 (= lt!119537 (insertStrictlySorted!156 (toList!1780 lt!119462) (_1!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))))))

(assert (=> d!59309 (= (+!647 lt!119462 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))) lt!119534)))

(declare-fun b!236566 () Bool)

(declare-fun res!115960 () Bool)

(assert (=> b!236566 (=> (not res!115960) (not e!153626))))

(assert (=> b!236566 (= res!115960 (= (getValueByKey!270 (toList!1780 lt!119534) (_1!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))))))))

(declare-fun b!236567 () Bool)

(assert (=> b!236567 (= e!153626 (contains!1666 (toList!1780 lt!119534) (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))))))

(assert (= (and d!59309 res!115961) b!236566))

(assert (= (and b!236566 res!115960) b!236567))

(declare-fun m!256961 () Bool)

(assert (=> d!59309 m!256961))

(declare-fun m!256963 () Bool)

(assert (=> d!59309 m!256963))

(declare-fun m!256965 () Bool)

(assert (=> d!59309 m!256965))

(declare-fun m!256967 () Bool)

(assert (=> d!59309 m!256967))

(declare-fun m!256969 () Bool)

(assert (=> b!236566 m!256969))

(declare-fun m!256971 () Bool)

(assert (=> b!236567 m!256971))

(assert (=> b!236464 d!59309))

(declare-fun d!59311 () Bool)

(assert (=> d!59311 (= (apply!214 (+!647 lt!119459 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))) lt!119473) (apply!214 lt!119459 lt!119473))))

(declare-fun lt!119538 () Unit!7272)

(assert (=> d!59311 (= lt!119538 (choose!1114 lt!119459 lt!119460 (zeroValue!4234 thiss!1504) lt!119473))))

(declare-fun e!153627 () Bool)

(assert (=> d!59311 e!153627))

(declare-fun res!115962 () Bool)

(assert (=> d!59311 (=> (not res!115962) (not e!153627))))

(assert (=> d!59311 (= res!115962 (contains!1663 lt!119459 lt!119473))))

(assert (=> d!59311 (= (addApplyDifferent!190 lt!119459 lt!119460 (zeroValue!4234 thiss!1504) lt!119473) lt!119538)))

(declare-fun b!236568 () Bool)

(assert (=> b!236568 (= e!153627 (not (= lt!119473 lt!119460)))))

(assert (= (and d!59311 res!115962) b!236568))

(assert (=> d!59311 m!256839))

(assert (=> d!59311 m!256853))

(assert (=> d!59311 m!256839))

(assert (=> d!59311 m!256855))

(declare-fun m!256973 () Bool)

(assert (=> d!59311 m!256973))

(declare-fun m!256975 () Bool)

(assert (=> d!59311 m!256975))

(assert (=> b!236464 d!59311))

(declare-fun d!59313 () Bool)

(declare-fun e!153628 () Bool)

(assert (=> d!59313 e!153628))

(declare-fun res!115964 () Bool)

(assert (=> d!59313 (=> (not res!115964) (not e!153628))))

(declare-fun lt!119539 () ListLongMap!3529)

(assert (=> d!59313 (= res!115964 (contains!1663 lt!119539 (_1!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))))))

(declare-fun lt!119542 () List!3547)

(assert (=> d!59313 (= lt!119539 (ListLongMap!3530 lt!119542))))

(declare-fun lt!119541 () Unit!7272)

(declare-fun lt!119540 () Unit!7272)

(assert (=> d!59313 (= lt!119541 lt!119540)))

(assert (=> d!59313 (= (getValueByKey!270 lt!119542 (_1!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))))))

(assert (=> d!59313 (= lt!119540 (lemmaContainsTupThenGetReturnValue!153 lt!119542 (_1!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))))))

(assert (=> d!59313 (= lt!119542 (insertStrictlySorted!156 (toList!1780 lt!119477) (_1!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))))))

(assert (=> d!59313 (= (+!647 lt!119477 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))) lt!119539)))

(declare-fun b!236569 () Bool)

(declare-fun res!115963 () Bool)

(assert (=> b!236569 (=> (not res!115963) (not e!153628))))

(assert (=> b!236569 (= res!115963 (= (getValueByKey!270 (toList!1780 lt!119539) (_1!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))))))))

(declare-fun b!236570 () Bool)

(assert (=> b!236570 (= e!153628 (contains!1666 (toList!1780 lt!119539) (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))))))

(assert (= (and d!59313 res!115964) b!236569))

(assert (= (and b!236569 res!115963) b!236570))

(declare-fun m!256977 () Bool)

(assert (=> d!59313 m!256977))

(declare-fun m!256979 () Bool)

(assert (=> d!59313 m!256979))

(declare-fun m!256981 () Bool)

(assert (=> d!59313 m!256981))

(declare-fun m!256983 () Bool)

(assert (=> d!59313 m!256983))

(declare-fun m!256985 () Bool)

(assert (=> b!236569 m!256985))

(declare-fun m!256987 () Bool)

(assert (=> b!236570 m!256987))

(assert (=> b!236464 d!59313))

(assert (=> b!236464 d!59295))

(declare-fun d!59315 () Bool)

(assert (=> d!59315 (contains!1663 (+!647 lt!119470 (tuple2!4627 lt!119475 (zeroValue!4234 thiss!1504))) lt!119464)))

(declare-fun lt!119545 () Unit!7272)

(declare-fun choose!1115 (ListLongMap!3529 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7272)

(assert (=> d!59315 (= lt!119545 (choose!1115 lt!119470 lt!119475 (zeroValue!4234 thiss!1504) lt!119464))))

(assert (=> d!59315 (contains!1663 lt!119470 lt!119464)))

(assert (=> d!59315 (= (addStillContains!190 lt!119470 lt!119475 (zeroValue!4234 thiss!1504) lt!119464) lt!119545)))

(declare-fun bs!8719 () Bool)

(assert (= bs!8719 d!59315))

(assert (=> bs!8719 m!256829))

(assert (=> bs!8719 m!256829))

(assert (=> bs!8719 m!256831))

(declare-fun m!256989 () Bool)

(assert (=> bs!8719 m!256989))

(declare-fun m!256991 () Bool)

(assert (=> bs!8719 m!256991))

(assert (=> b!236464 d!59315))

(declare-fun d!59317 () Bool)

(assert (=> d!59317 (= (apply!214 lt!119459 lt!119473) (get!2857 (getValueByKey!270 (toList!1780 lt!119459) lt!119473)))))

(declare-fun bs!8720 () Bool)

(assert (= bs!8720 d!59317))

(declare-fun m!256993 () Bool)

(assert (=> bs!8720 m!256993))

(assert (=> bs!8720 m!256993))

(declare-fun m!256995 () Bool)

(assert (=> bs!8720 m!256995))

(assert (=> b!236464 d!59317))

(declare-fun d!59319 () Bool)

(assert (=> d!59319 (= (apply!214 lt!119477 lt!119466) (get!2857 (getValueByKey!270 (toList!1780 lt!119477) lt!119466)))))

(declare-fun bs!8721 () Bool)

(assert (= bs!8721 d!59319))

(declare-fun m!256997 () Bool)

(assert (=> bs!8721 m!256997))

(assert (=> bs!8721 m!256997))

(declare-fun m!256999 () Bool)

(assert (=> bs!8721 m!256999))

(assert (=> b!236464 d!59319))

(declare-fun d!59321 () Bool)

(assert (=> d!59321 (= (apply!214 (+!647 lt!119477 (tuple2!4627 lt!119461 (minValue!4234 thiss!1504))) lt!119466) (apply!214 lt!119477 lt!119466))))

(declare-fun lt!119546 () Unit!7272)

(assert (=> d!59321 (= lt!119546 (choose!1114 lt!119477 lt!119461 (minValue!4234 thiss!1504) lt!119466))))

(declare-fun e!153629 () Bool)

(assert (=> d!59321 e!153629))

(declare-fun res!115965 () Bool)

(assert (=> d!59321 (=> (not res!115965) (not e!153629))))

(assert (=> d!59321 (= res!115965 (contains!1663 lt!119477 lt!119466))))

(assert (=> d!59321 (= (addApplyDifferent!190 lt!119477 lt!119461 (minValue!4234 thiss!1504) lt!119466) lt!119546)))

(declare-fun b!236572 () Bool)

(assert (=> b!236572 (= e!153629 (not (= lt!119466 lt!119461)))))

(assert (= (and d!59321 res!115965) b!236572))

(assert (=> d!59321 m!256849))

(assert (=> d!59321 m!256851))

(assert (=> d!59321 m!256849))

(assert (=> d!59321 m!256843))

(declare-fun m!257001 () Bool)

(assert (=> d!59321 m!257001))

(declare-fun m!257003 () Bool)

(assert (=> d!59321 m!257003))

(assert (=> b!236464 d!59321))

(declare-fun d!59323 () Bool)

(assert (=> d!59323 (= (apply!214 (+!647 lt!119462 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504))) lt!119463) (get!2857 (getValueByKey!270 (toList!1780 (+!647 lt!119462 (tuple2!4627 lt!119467 (minValue!4234 thiss!1504)))) lt!119463)))))

(declare-fun bs!8722 () Bool)

(assert (= bs!8722 d!59323))

(declare-fun m!257005 () Bool)

(assert (=> bs!8722 m!257005))

(assert (=> bs!8722 m!257005))

(declare-fun m!257007 () Bool)

(assert (=> bs!8722 m!257007))

(assert (=> b!236464 d!59323))

(declare-fun d!59325 () Bool)

(declare-fun e!153630 () Bool)

(assert (=> d!59325 e!153630))

(declare-fun res!115967 () Bool)

(assert (=> d!59325 (=> (not res!115967) (not e!153630))))

(declare-fun lt!119547 () ListLongMap!3529)

(assert (=> d!59325 (= res!115967 (contains!1663 lt!119547 (_1!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))))))

(declare-fun lt!119550 () List!3547)

(assert (=> d!59325 (= lt!119547 (ListLongMap!3530 lt!119550))))

(declare-fun lt!119549 () Unit!7272)

(declare-fun lt!119548 () Unit!7272)

(assert (=> d!59325 (= lt!119549 lt!119548)))

(assert (=> d!59325 (= (getValueByKey!270 lt!119550 (_1!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59325 (= lt!119548 (lemmaContainsTupThenGetReturnValue!153 lt!119550 (_1!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59325 (= lt!119550 (insertStrictlySorted!156 (toList!1780 lt!119459) (_1!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59325 (= (+!647 lt!119459 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))) lt!119547)))

(declare-fun b!236573 () Bool)

(declare-fun res!115966 () Bool)

(assert (=> b!236573 (=> (not res!115966) (not e!153630))))

(assert (=> b!236573 (= res!115966 (= (getValueByKey!270 (toList!1780 lt!119547) (_1!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))))))))

(declare-fun b!236574 () Bool)

(assert (=> b!236574 (= e!153630 (contains!1666 (toList!1780 lt!119547) (tuple2!4627 lt!119460 (zeroValue!4234 thiss!1504))))))

(assert (= (and d!59325 res!115967) b!236573))

(assert (= (and b!236573 res!115966) b!236574))

(declare-fun m!257009 () Bool)

(assert (=> d!59325 m!257009))

(declare-fun m!257011 () Bool)

(assert (=> d!59325 m!257011))

(declare-fun m!257013 () Bool)

(assert (=> d!59325 m!257013))

(declare-fun m!257015 () Bool)

(assert (=> d!59325 m!257015))

(declare-fun m!257017 () Bool)

(assert (=> b!236573 m!257017))

(declare-fun m!257019 () Bool)

(assert (=> b!236574 m!257019))

(assert (=> b!236464 d!59325))

(declare-fun d!59327 () Bool)

(declare-fun e!153631 () Bool)

(assert (=> d!59327 e!153631))

(declare-fun res!115969 () Bool)

(assert (=> d!59327 (=> (not res!115969) (not e!153631))))

(declare-fun lt!119551 () ListLongMap!3529)

(assert (=> d!59327 (= res!115969 (contains!1663 lt!119551 (_1!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(declare-fun lt!119554 () List!3547)

(assert (=> d!59327 (= lt!119551 (ListLongMap!3530 lt!119554))))

(declare-fun lt!119553 () Unit!7272)

(declare-fun lt!119552 () Unit!7272)

(assert (=> d!59327 (= lt!119553 lt!119552)))

(assert (=> d!59327 (= (getValueByKey!270 lt!119554 (_1!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(assert (=> d!59327 (= lt!119552 (lemmaContainsTupThenGetReturnValue!153 lt!119554 (_1!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(assert (=> d!59327 (= lt!119554 (insertStrictlySorted!156 (toList!1780 call!21979) (_1!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))) (_2!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(assert (=> d!59327 (= (+!647 call!21979 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))) lt!119551)))

(declare-fun b!236575 () Bool)

(declare-fun res!115968 () Bool)

(assert (=> b!236575 (=> (not res!115968) (not e!153631))))

(assert (=> b!236575 (= res!115968 (= (getValueByKey!270 (toList!1780 lt!119551) (_1!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (Some!275 (_2!2324 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(declare-fun b!236576 () Bool)

(assert (=> b!236576 (= e!153631 (contains!1666 (toList!1780 lt!119551) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))

(assert (= (and d!59327 res!115969) b!236575))

(assert (= (and b!236575 res!115968) b!236576))

(declare-fun m!257021 () Bool)

(assert (=> d!59327 m!257021))

(declare-fun m!257023 () Bool)

(assert (=> d!59327 m!257023))

(declare-fun m!257025 () Bool)

(assert (=> d!59327 m!257025))

(declare-fun m!257027 () Bool)

(assert (=> d!59327 m!257027))

(declare-fun m!257029 () Bool)

(assert (=> b!236575 m!257029))

(declare-fun m!257031 () Bool)

(assert (=> b!236576 m!257031))

(assert (=> b!236472 d!59327))

(declare-fun bm!21984 () Bool)

(declare-fun call!21987 () Bool)

(declare-fun c!39415 () Bool)

(assert (=> bm!21984 (= call!21987 (arrayNoDuplicates!0 (_keys!6475 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39415 (Cons!3546 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000) Nil!3547) Nil!3547)))))

(declare-fun b!236587 () Bool)

(declare-fun e!153643 () Bool)

(assert (=> b!236587 (= e!153643 call!21987)))

(declare-fun b!236588 () Bool)

(assert (=> b!236588 (= e!153643 call!21987)))

(declare-fun b!236589 () Bool)

(declare-fun e!153641 () Bool)

(declare-fun e!153640 () Bool)

(assert (=> b!236589 (= e!153641 e!153640)))

(declare-fun res!115978 () Bool)

(assert (=> b!236589 (=> (not res!115978) (not e!153640))))

(declare-fun e!153642 () Bool)

(assert (=> b!236589 (= res!115978 (not e!153642))))

(declare-fun res!115976 () Bool)

(assert (=> b!236589 (=> (not res!115976) (not e!153642))))

(assert (=> b!236589 (= res!115976 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59329 () Bool)

(declare-fun res!115977 () Bool)

(assert (=> d!59329 (=> res!115977 e!153641)))

(assert (=> d!59329 (= res!115977 (bvsge #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> d!59329 (= (arrayNoDuplicates!0 (_keys!6475 thiss!1504) #b00000000000000000000000000000000 Nil!3547) e!153641)))

(declare-fun b!236590 () Bool)

(assert (=> b!236590 (= e!153640 e!153643)))

(assert (=> b!236590 (= c!39415 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236591 () Bool)

(declare-fun contains!1667 (List!3550 (_ BitVec 64)) Bool)

(assert (=> b!236591 (= e!153642 (contains!1667 Nil!3547 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59329 (not res!115977)) b!236589))

(assert (= (and b!236589 res!115976) b!236591))

(assert (= (and b!236589 res!115978) b!236590))

(assert (= (and b!236590 c!39415) b!236587))

(assert (= (and b!236590 (not c!39415)) b!236588))

(assert (= (or b!236587 b!236588) bm!21984))

(assert (=> bm!21984 m!256817))

(declare-fun m!257033 () Bool)

(assert (=> bm!21984 m!257033))

(assert (=> b!236589 m!256817))

(assert (=> b!236589 m!256817))

(assert (=> b!236589 m!256825))

(assert (=> b!236590 m!256817))

(assert (=> b!236590 m!256817))

(assert (=> b!236590 m!256825))

(assert (=> b!236591 m!256817))

(assert (=> b!236591 m!256817))

(declare-fun m!257035 () Bool)

(assert (=> b!236591 m!257035))

(assert (=> b!236488 d!59329))

(declare-fun b!236600 () Bool)

(declare-fun e!153651 () Bool)

(declare-fun e!153650 () Bool)

(assert (=> b!236600 (= e!153651 e!153650)))

(declare-fun c!39418 () Bool)

(assert (=> b!236600 (= c!39418 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59331 () Bool)

(declare-fun res!115984 () Bool)

(assert (=> d!59331 (=> res!115984 e!153651)))

(assert (=> d!59331 (= res!115984 (bvsge #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> d!59331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)) e!153651)))

(declare-fun b!236601 () Bool)

(declare-fun e!153652 () Bool)

(declare-fun call!21990 () Bool)

(assert (=> b!236601 (= e!153652 call!21990)))

(declare-fun bm!21987 () Bool)

(assert (=> bm!21987 (= call!21990 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(declare-fun b!236602 () Bool)

(assert (=> b!236602 (= e!153650 e!153652)))

(declare-fun lt!119562 () (_ BitVec 64))

(assert (=> b!236602 (= lt!119562 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119563 () Unit!7272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11705 (_ BitVec 64) (_ BitVec 32)) Unit!7272)

(assert (=> b!236602 (= lt!119563 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6475 thiss!1504) lt!119562 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!236602 (arrayContainsKey!0 (_keys!6475 thiss!1504) lt!119562 #b00000000000000000000000000000000)))

(declare-fun lt!119561 () Unit!7272)

(assert (=> b!236602 (= lt!119561 lt!119563)))

(declare-fun res!115983 () Bool)

(assert (=> b!236602 (= res!115983 (= (seekEntryOrOpen!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000) (_keys!6475 thiss!1504) (mask!10385 thiss!1504)) (Found!1000 #b00000000000000000000000000000000)))))

(assert (=> b!236602 (=> (not res!115983) (not e!153652))))

(declare-fun b!236603 () Bool)

(assert (=> b!236603 (= e!153650 call!21990)))

(assert (= (and d!59331 (not res!115984)) b!236600))

(assert (= (and b!236600 c!39418) b!236602))

(assert (= (and b!236600 (not c!39418)) b!236603))

(assert (= (and b!236602 res!115983) b!236601))

(assert (= (or b!236601 b!236603) bm!21987))

(assert (=> b!236600 m!256817))

(assert (=> b!236600 m!256817))

(assert (=> b!236600 m!256825))

(declare-fun m!257037 () Bool)

(assert (=> bm!21987 m!257037))

(assert (=> b!236602 m!256817))

(declare-fun m!257039 () Bool)

(assert (=> b!236602 m!257039))

(declare-fun m!257041 () Bool)

(assert (=> b!236602 m!257041))

(assert (=> b!236602 m!256817))

(declare-fun m!257043 () Bool)

(assert (=> b!236602 m!257043))

(assert (=> b!236487 d!59331))

(declare-fun b!236622 () Bool)

(declare-fun e!153667 () SeekEntryResult!1000)

(assert (=> b!236622 (= e!153667 (Intermediate!1000 false (toIndex!0 key!932 (mask!10385 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236623 () Bool)

(declare-fun lt!119568 () SeekEntryResult!1000)

(assert (=> b!236623 (and (bvsge (index!6172 lt!119568) #b00000000000000000000000000000000) (bvslt (index!6172 lt!119568) (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun res!115992 () Bool)

(assert (=> b!236623 (= res!115992 (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6172 lt!119568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153666 () Bool)

(assert (=> b!236623 (=> res!115992 e!153666)))

(declare-fun b!236624 () Bool)

(declare-fun e!153663 () Bool)

(assert (=> b!236624 (= e!153663 (bvsge (x!23881 lt!119568) #b01111111111111111111111111111110))))

(declare-fun d!59333 () Bool)

(assert (=> d!59333 e!153663))

(declare-fun c!39427 () Bool)

(assert (=> d!59333 (= c!39427 (and ((_ is Intermediate!1000) lt!119568) (undefined!1812 lt!119568)))))

(declare-fun e!153665 () SeekEntryResult!1000)

(assert (=> d!59333 (= lt!119568 e!153665)))

(declare-fun c!39425 () Bool)

(assert (=> d!59333 (= c!39425 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!119569 () (_ BitVec 64))

(assert (=> d!59333 (= lt!119569 (select (arr!5560 (_keys!6475 thiss!1504)) (toIndex!0 key!932 (mask!10385 thiss!1504))))))

(assert (=> d!59333 (validMask!0 (mask!10385 thiss!1504))))

(assert (=> d!59333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10385 thiss!1504)) key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)) lt!119568)))

(declare-fun b!236625 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236625 (= e!153667 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10385 thiss!1504)) #b00000000000000000000000000000000 (mask!10385 thiss!1504)) key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(declare-fun b!236626 () Bool)

(assert (=> b!236626 (and (bvsge (index!6172 lt!119568) #b00000000000000000000000000000000) (bvslt (index!6172 lt!119568) (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> b!236626 (= e!153666 (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6172 lt!119568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236627 () Bool)

(assert (=> b!236627 (= e!153665 (Intermediate!1000 true (toIndex!0 key!932 (mask!10385 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236628 () Bool)

(assert (=> b!236628 (and (bvsge (index!6172 lt!119568) #b00000000000000000000000000000000) (bvslt (index!6172 lt!119568) (size!5899 (_keys!6475 thiss!1504))))))

(declare-fun res!115993 () Bool)

(assert (=> b!236628 (= res!115993 (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6172 lt!119568)) key!932))))

(assert (=> b!236628 (=> res!115993 e!153666)))

(declare-fun e!153664 () Bool)

(assert (=> b!236628 (= e!153664 e!153666)))

(declare-fun b!236629 () Bool)

(assert (=> b!236629 (= e!153665 e!153667)))

(declare-fun c!39426 () Bool)

(assert (=> b!236629 (= c!39426 (or (= lt!119569 key!932) (= (bvadd lt!119569 lt!119569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236630 () Bool)

(assert (=> b!236630 (= e!153663 e!153664)))

(declare-fun res!115991 () Bool)

(assert (=> b!236630 (= res!115991 (and ((_ is Intermediate!1000) lt!119568) (not (undefined!1812 lt!119568)) (bvslt (x!23881 lt!119568) #b01111111111111111111111111111110) (bvsge (x!23881 lt!119568) #b00000000000000000000000000000000) (bvsge (x!23881 lt!119568) #b00000000000000000000000000000000)))))

(assert (=> b!236630 (=> (not res!115991) (not e!153664))))

(assert (= (and d!59333 c!39425) b!236627))

(assert (= (and d!59333 (not c!39425)) b!236629))

(assert (= (and b!236629 c!39426) b!236622))

(assert (= (and b!236629 (not c!39426)) b!236625))

(assert (= (and d!59333 c!39427) b!236624))

(assert (= (and d!59333 (not c!39427)) b!236630))

(assert (= (and b!236630 res!115991) b!236628))

(assert (= (and b!236628 (not res!115993)) b!236623))

(assert (= (and b!236623 (not res!115992)) b!236626))

(assert (=> d!59333 m!256885))

(declare-fun m!257045 () Bool)

(assert (=> d!59333 m!257045))

(assert (=> d!59333 m!256761))

(declare-fun m!257047 () Bool)

(assert (=> b!236623 m!257047))

(assert (=> b!236626 m!257047))

(assert (=> b!236628 m!257047))

(assert (=> b!236625 m!256885))

(declare-fun m!257049 () Bool)

(assert (=> b!236625 m!257049))

(assert (=> b!236625 m!257049))

(declare-fun m!257051 () Bool)

(assert (=> b!236625 m!257051))

(assert (=> d!59289 d!59333))

(declare-fun d!59335 () Bool)

(declare-fun lt!119575 () (_ BitVec 32))

(declare-fun lt!119574 () (_ BitVec 32))

(assert (=> d!59335 (= lt!119575 (bvmul (bvxor lt!119574 (bvlshr lt!119574 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59335 (= lt!119574 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59335 (and (bvsge (mask!10385 thiss!1504) #b00000000000000000000000000000000) (let ((res!115994 (let ((h!4200 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23899 (bvmul (bvxor h!4200 (bvlshr h!4200 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23899 (bvlshr x!23899 #b00000000000000000000000000001101)) (mask!10385 thiss!1504)))))) (and (bvslt res!115994 (bvadd (mask!10385 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115994 #b00000000000000000000000000000000))))))

(assert (=> d!59335 (= (toIndex!0 key!932 (mask!10385 thiss!1504)) (bvand (bvxor lt!119575 (bvlshr lt!119575 #b00000000000000000000000000001101)) (mask!10385 thiss!1504)))))

(assert (=> d!59289 d!59335))

(assert (=> d!59289 d!59277))

(assert (=> b!236462 d!59293))

(declare-fun d!59337 () Bool)

(assert (=> d!59337 (= (apply!214 lt!119479 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2857 (getValueByKey!270 (toList!1780 lt!119479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8723 () Bool)

(assert (= bs!8723 d!59337))

(declare-fun m!257053 () Bool)

(assert (=> bs!8723 m!257053))

(assert (=> bs!8723 m!257053))

(declare-fun m!257055 () Bool)

(assert (=> bs!8723 m!257055))

(assert (=> b!236461 d!59337))

(declare-fun d!59339 () Bool)

(declare-fun isEmpty!519 (Option!276) Bool)

(assert (=> d!59339 (= (isDefined!212 (getValueByKey!270 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932)) (not (isEmpty!519 (getValueByKey!270 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))))

(declare-fun bs!8724 () Bool)

(assert (= bs!8724 d!59339))

(assert (=> bs!8724 m!256807))

(declare-fun m!257057 () Bool)

(assert (=> bs!8724 m!257057))

(assert (=> b!236414 d!59339))

(declare-fun b!236640 () Bool)

(declare-fun e!153672 () Option!276)

(declare-fun e!153673 () Option!276)

(assert (=> b!236640 (= e!153672 e!153673)))

(declare-fun c!39433 () Bool)

(assert (=> b!236640 (= c!39433 (and ((_ is Cons!3543) (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (not (= (_1!2324 (h!4196 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932))))))

(declare-fun d!59341 () Bool)

(declare-fun c!39432 () Bool)

(assert (=> d!59341 (= c!39432 (and ((_ is Cons!3543) (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (= (_1!2324 (h!4196 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)))))

(assert (=> d!59341 (= (getValueByKey!270 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932) e!153672)))

(declare-fun b!236639 () Bool)

(assert (=> b!236639 (= e!153672 (Some!275 (_2!2324 (h!4196 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))))))

(declare-fun b!236641 () Bool)

(assert (=> b!236641 (= e!153673 (getValueByKey!270 (t!8519 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) key!932))))

(declare-fun b!236642 () Bool)

(assert (=> b!236642 (= e!153673 None!274)))

(assert (= (and d!59341 c!39432) b!236639))

(assert (= (and d!59341 (not c!39432)) b!236640))

(assert (= (and b!236640 c!39433) b!236641))

(assert (= (and b!236640 (not c!39433)) b!236642))

(declare-fun m!257059 () Bool)

(assert (=> b!236641 m!257059))

(assert (=> b!236414 d!59341))

(assert (=> d!59285 d!59277))

(declare-fun b!236651 () Bool)

(declare-fun e!153678 () (_ BitVec 32))

(assert (=> b!236651 (= e!153678 #b00000000000000000000000000000000)))

(declare-fun b!236652 () Bool)

(declare-fun e!153679 () (_ BitVec 32))

(declare-fun call!21993 () (_ BitVec 32))

(assert (=> b!236652 (= e!153679 (bvadd #b00000000000000000000000000000001 call!21993))))

(declare-fun d!59343 () Bool)

(declare-fun lt!119578 () (_ BitVec 32))

(assert (=> d!59343 (and (bvsge lt!119578 #b00000000000000000000000000000000) (bvsle lt!119578 (bvsub (size!5899 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59343 (= lt!119578 e!153678)))

(declare-fun c!39439 () Bool)

(assert (=> d!59343 (= c!39439 (bvsge #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> d!59343 (and (bvsle #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5899 (_keys!6475 thiss!1504)) (size!5899 (_keys!6475 thiss!1504))))))

(assert (=> d!59343 (= (arrayCountValidKeys!0 (_keys!6475 thiss!1504) #b00000000000000000000000000000000 (size!5899 (_keys!6475 thiss!1504))) lt!119578)))

(declare-fun b!236653 () Bool)

(assert (=> b!236653 (= e!153678 e!153679)))

(declare-fun c!39438 () Bool)

(assert (=> b!236653 (= c!39438 (validKeyInArray!0 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236654 () Bool)

(assert (=> b!236654 (= e!153679 call!21993)))

(declare-fun bm!21990 () Bool)

(assert (=> bm!21990 (= call!21993 (arrayCountValidKeys!0 (_keys!6475 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5899 (_keys!6475 thiss!1504))))))

(assert (= (and d!59343 c!39439) b!236651))

(assert (= (and d!59343 (not c!39439)) b!236653))

(assert (= (and b!236653 c!39438) b!236652))

(assert (= (and b!236653 (not c!39438)) b!236654))

(assert (= (or b!236652 b!236654) bm!21990))

(assert (=> b!236653 m!256817))

(assert (=> b!236653 m!256817))

(assert (=> b!236653 m!256825))

(declare-fun m!257061 () Bool)

(assert (=> bm!21990 m!257061))

(assert (=> b!236486 d!59343))

(declare-fun b!236667 () Bool)

(declare-fun e!153687 () SeekEntryResult!1000)

(assert (=> b!236667 (= e!153687 (MissingVacant!1000 (index!6172 lt!119489)))))

(declare-fun b!236668 () Bool)

(assert (=> b!236668 (= e!153687 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23881 lt!119489) #b00000000000000000000000000000001) (nextIndex!0 (index!6172 lt!119489) (x!23881 lt!119489) (mask!10385 thiss!1504)) (index!6172 lt!119489) key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)))))

(declare-fun b!236669 () Bool)

(declare-fun c!39448 () Bool)

(declare-fun lt!119583 () (_ BitVec 64))

(assert (=> b!236669 (= c!39448 (= lt!119583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153688 () SeekEntryResult!1000)

(assert (=> b!236669 (= e!153688 e!153687)))

(declare-fun d!59345 () Bool)

(declare-fun lt!119584 () SeekEntryResult!1000)

(assert (=> d!59345 (and (or ((_ is Undefined!1000) lt!119584) (not ((_ is Found!1000) lt!119584)) (and (bvsge (index!6171 lt!119584) #b00000000000000000000000000000000) (bvslt (index!6171 lt!119584) (size!5899 (_keys!6475 thiss!1504))))) (or ((_ is Undefined!1000) lt!119584) ((_ is Found!1000) lt!119584) (not ((_ is MissingVacant!1000) lt!119584)) (not (= (index!6173 lt!119584) (index!6172 lt!119489))) (and (bvsge (index!6173 lt!119584) #b00000000000000000000000000000000) (bvslt (index!6173 lt!119584) (size!5899 (_keys!6475 thiss!1504))))) (or ((_ is Undefined!1000) lt!119584) (ite ((_ is Found!1000) lt!119584) (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6171 lt!119584)) key!932) (and ((_ is MissingVacant!1000) lt!119584) (= (index!6173 lt!119584) (index!6172 lt!119489)) (= (select (arr!5560 (_keys!6475 thiss!1504)) (index!6173 lt!119584)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!153686 () SeekEntryResult!1000)

(assert (=> d!59345 (= lt!119584 e!153686)))

(declare-fun c!39446 () Bool)

(assert (=> d!59345 (= c!39446 (bvsge (x!23881 lt!119489) #b01111111111111111111111111111110))))

(assert (=> d!59345 (= lt!119583 (select (arr!5560 (_keys!6475 thiss!1504)) (index!6172 lt!119489)))))

(assert (=> d!59345 (validMask!0 (mask!10385 thiss!1504))))

(assert (=> d!59345 (= (seekKeyOrZeroReturnVacant!0 (x!23881 lt!119489) (index!6172 lt!119489) (index!6172 lt!119489) key!932 (_keys!6475 thiss!1504) (mask!10385 thiss!1504)) lt!119584)))

(declare-fun b!236670 () Bool)

(assert (=> b!236670 (= e!153686 e!153688)))

(declare-fun c!39447 () Bool)

(assert (=> b!236670 (= c!39447 (= lt!119583 key!932))))

(declare-fun b!236671 () Bool)

(assert (=> b!236671 (= e!153686 Undefined!1000)))

(declare-fun b!236672 () Bool)

(assert (=> b!236672 (= e!153688 (Found!1000 (index!6172 lt!119489)))))

(assert (= (and d!59345 c!39446) b!236671))

(assert (= (and d!59345 (not c!39446)) b!236670))

(assert (= (and b!236670 c!39447) b!236672))

(assert (= (and b!236670 (not c!39447)) b!236669))

(assert (= (and b!236669 c!39448) b!236667))

(assert (= (and b!236669 (not c!39448)) b!236668))

(declare-fun m!257063 () Bool)

(assert (=> b!236668 m!257063))

(assert (=> b!236668 m!257063))

(declare-fun m!257065 () Bool)

(assert (=> b!236668 m!257065))

(declare-fun m!257067 () Bool)

(assert (=> d!59345 m!257067))

(declare-fun m!257069 () Bool)

(assert (=> d!59345 m!257069))

(assert (=> d!59345 m!256877))

(assert (=> d!59345 m!256761))

(assert (=> b!236504 d!59345))

(declare-fun b!236683 () Bool)

(declare-fun res!116003 () Bool)

(declare-fun e!153691 () Bool)

(assert (=> b!236683 (=> (not res!116003) (not e!153691))))

(declare-fun size!5904 (LongMapFixedSize!3436) (_ BitVec 32))

(assert (=> b!236683 (= res!116003 (= (size!5904 thiss!1504) (bvadd (_size!1767 thiss!1504) (bvsdiv (bvadd (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!236681 () Bool)

(declare-fun res!116004 () Bool)

(assert (=> b!236681 (=> (not res!116004) (not e!153691))))

(assert (=> b!236681 (= res!116004 (and (= (size!5898 (_values!4376 thiss!1504)) (bvadd (mask!10385 thiss!1504) #b00000000000000000000000000000001)) (= (size!5899 (_keys!6475 thiss!1504)) (size!5898 (_values!4376 thiss!1504))) (bvsge (_size!1767 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1767 thiss!1504) (bvadd (mask!10385 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!236684 () Bool)

(assert (=> b!236684 (= e!153691 (and (bvsge (extraKeys!4130 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4130 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1767 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236682 () Bool)

(declare-fun res!116005 () Bool)

(assert (=> b!236682 (=> (not res!116005) (not e!153691))))

(assert (=> b!236682 (= res!116005 (bvsge (size!5904 thiss!1504) (_size!1767 thiss!1504)))))

(declare-fun d!59347 () Bool)

(declare-fun res!116006 () Bool)

(assert (=> d!59347 (=> (not res!116006) (not e!153691))))

(assert (=> d!59347 (= res!116006 (validMask!0 (mask!10385 thiss!1504)))))

(assert (=> d!59347 (= (simpleValid!237 thiss!1504) e!153691)))

(assert (= (and d!59347 res!116006) b!236681))

(assert (= (and b!236681 res!116004) b!236682))

(assert (= (and b!236682 res!116005) b!236683))

(assert (= (and b!236683 res!116003) b!236684))

(declare-fun m!257071 () Bool)

(assert (=> b!236683 m!257071))

(assert (=> b!236682 m!257071))

(assert (=> d!59347 m!256761))

(assert (=> d!59287 d!59347))

(declare-fun d!59349 () Bool)

(declare-fun e!153692 () Bool)

(assert (=> d!59349 e!153692))

(declare-fun res!116007 () Bool)

(assert (=> d!59349 (=> res!116007 e!153692)))

(declare-fun lt!119586 () Bool)

(assert (=> d!59349 (= res!116007 (not lt!119586))))

(declare-fun lt!119585 () Bool)

(assert (=> d!59349 (= lt!119586 lt!119585)))

(declare-fun lt!119587 () Unit!7272)

(declare-fun e!153693 () Unit!7272)

(assert (=> d!59349 (= lt!119587 e!153693)))

(declare-fun c!39449 () Bool)

(assert (=> d!59349 (= c!39449 lt!119585)))

(assert (=> d!59349 (= lt!119585 (containsKey!262 (toList!1780 lt!119479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59349 (= (contains!1663 lt!119479 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119586)))

(declare-fun b!236685 () Bool)

(declare-fun lt!119588 () Unit!7272)

(assert (=> b!236685 (= e!153693 lt!119588)))

(assert (=> b!236685 (= lt!119588 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1780 lt!119479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236685 (isDefined!212 (getValueByKey!270 (toList!1780 lt!119479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236686 () Bool)

(declare-fun Unit!7277 () Unit!7272)

(assert (=> b!236686 (= e!153693 Unit!7277)))

(declare-fun b!236687 () Bool)

(assert (=> b!236687 (= e!153692 (isDefined!212 (getValueByKey!270 (toList!1780 lt!119479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59349 c!39449) b!236685))

(assert (= (and d!59349 (not c!39449)) b!236686))

(assert (= (and d!59349 (not res!116007)) b!236687))

(declare-fun m!257073 () Bool)

(assert (=> d!59349 m!257073))

(declare-fun m!257075 () Bool)

(assert (=> b!236685 m!257075))

(declare-fun m!257077 () Bool)

(assert (=> b!236685 m!257077))

(assert (=> b!236685 m!257077))

(declare-fun m!257079 () Bool)

(assert (=> b!236685 m!257079))

(assert (=> b!236687 m!257077))

(assert (=> b!236687 m!257077))

(assert (=> b!236687 m!257079))

(assert (=> bm!21975 d!59349))

(declare-fun d!59351 () Bool)

(declare-fun e!153694 () Bool)

(assert (=> d!59351 e!153694))

(declare-fun res!116008 () Bool)

(assert (=> d!59351 (=> res!116008 e!153694)))

(declare-fun lt!119590 () Bool)

(assert (=> d!59351 (= res!116008 (not lt!119590))))

(declare-fun lt!119589 () Bool)

(assert (=> d!59351 (= lt!119590 lt!119589)))

(declare-fun lt!119591 () Unit!7272)

(declare-fun e!153695 () Unit!7272)

(assert (=> d!59351 (= lt!119591 e!153695)))

(declare-fun c!39450 () Bool)

(assert (=> d!59351 (= c!39450 lt!119589)))

(assert (=> d!59351 (= lt!119589 (containsKey!262 (toList!1780 lt!119479) (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59351 (= (contains!1663 lt!119479 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)) lt!119590)))

(declare-fun b!236688 () Bool)

(declare-fun lt!119592 () Unit!7272)

(assert (=> b!236688 (= e!153695 lt!119592)))

(assert (=> b!236688 (= lt!119592 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1780 lt!119479) (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236688 (isDefined!212 (getValueByKey!270 (toList!1780 lt!119479) (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236689 () Bool)

(declare-fun Unit!7278 () Unit!7272)

(assert (=> b!236689 (= e!153695 Unit!7278)))

(declare-fun b!236690 () Bool)

(assert (=> b!236690 (= e!153694 (isDefined!212 (getValueByKey!270 (toList!1780 lt!119479) (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59351 c!39450) b!236688))

(assert (= (and d!59351 (not c!39450)) b!236689))

(assert (= (and d!59351 (not res!116008)) b!236690))

(assert (=> d!59351 m!256817))

(declare-fun m!257081 () Bool)

(assert (=> d!59351 m!257081))

(assert (=> b!236688 m!256817))

(declare-fun m!257083 () Bool)

(assert (=> b!236688 m!257083))

(assert (=> b!236688 m!256817))

(declare-fun m!257085 () Bool)

(assert (=> b!236688 m!257085))

(assert (=> b!236688 m!257085))

(declare-fun m!257087 () Bool)

(assert (=> b!236688 m!257087))

(assert (=> b!236690 m!256817))

(assert (=> b!236690 m!257085))

(assert (=> b!236690 m!257085))

(assert (=> b!236690 m!257087))

(assert (=> b!236460 d!59351))

(declare-fun d!59353 () Bool)

(assert (=> d!59353 (isDefined!212 (getValueByKey!270 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-fun lt!119595 () Unit!7272)

(declare-fun choose!1116 (List!3547 (_ BitVec 64)) Unit!7272)

(assert (=> d!59353 (= lt!119595 (choose!1116 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-fun e!153698 () Bool)

(assert (=> d!59353 e!153698))

(declare-fun res!116011 () Bool)

(assert (=> d!59353 (=> (not res!116011) (not e!153698))))

(declare-fun isStrictlySorted!359 (List!3547) Bool)

(assert (=> d!59353 (= res!116011 (isStrictlySorted!359 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))))

(assert (=> d!59353 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932) lt!119595)))

(declare-fun b!236693 () Bool)

(assert (=> b!236693 (= e!153698 (containsKey!262 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(assert (= (and d!59353 res!116011) b!236693))

(assert (=> d!59353 m!256807))

(assert (=> d!59353 m!256807))

(assert (=> d!59353 m!256809))

(declare-fun m!257089 () Bool)

(assert (=> d!59353 m!257089))

(declare-fun m!257091 () Bool)

(assert (=> d!59353 m!257091))

(assert (=> b!236693 m!256803))

(assert (=> b!236412 d!59353))

(assert (=> b!236412 d!59339))

(assert (=> b!236412 d!59341))

(declare-fun d!59355 () Bool)

(assert (=> d!59355 (= (apply!214 lt!119479 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2857 (getValueByKey!270 (toList!1780 lt!119479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8725 () Bool)

(assert (= bs!8725 d!59355))

(assert (=> bs!8725 m!257077))

(assert (=> bs!8725 m!257077))

(declare-fun m!257093 () Bool)

(assert (=> bs!8725 m!257093))

(assert (=> b!236475 d!59355))

(declare-fun d!59357 () Bool)

(declare-fun e!153699 () Bool)

(assert (=> d!59357 e!153699))

(declare-fun res!116012 () Bool)

(assert (=> d!59357 (=> res!116012 e!153699)))

(declare-fun lt!119597 () Bool)

(assert (=> d!59357 (= res!116012 (not lt!119597))))

(declare-fun lt!119596 () Bool)

(assert (=> d!59357 (= lt!119597 lt!119596)))

(declare-fun lt!119598 () Unit!7272)

(declare-fun e!153700 () Unit!7272)

(assert (=> d!59357 (= lt!119598 e!153700)))

(declare-fun c!39451 () Bool)

(assert (=> d!59357 (= c!39451 lt!119596)))

(assert (=> d!59357 (= lt!119596 (containsKey!262 (toList!1780 lt!119479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59357 (= (contains!1663 lt!119479 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119597)))

(declare-fun b!236694 () Bool)

(declare-fun lt!119599 () Unit!7272)

(assert (=> b!236694 (= e!153700 lt!119599)))

(assert (=> b!236694 (= lt!119599 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1780 lt!119479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236694 (isDefined!212 (getValueByKey!270 (toList!1780 lt!119479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236695 () Bool)

(declare-fun Unit!7279 () Unit!7272)

(assert (=> b!236695 (= e!153700 Unit!7279)))

(declare-fun b!236696 () Bool)

(assert (=> b!236696 (= e!153699 (isDefined!212 (getValueByKey!270 (toList!1780 lt!119479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59357 c!39451) b!236694))

(assert (= (and d!59357 (not c!39451)) b!236695))

(assert (= (and d!59357 (not res!116012)) b!236696))

(declare-fun m!257095 () Bool)

(assert (=> d!59357 m!257095))

(declare-fun m!257097 () Bool)

(assert (=> b!236694 m!257097))

(assert (=> b!236694 m!257053))

(assert (=> b!236694 m!257053))

(declare-fun m!257099 () Bool)

(assert (=> b!236694 m!257099))

(assert (=> b!236696 m!257053))

(assert (=> b!236696 m!257053))

(assert (=> b!236696 m!257099))

(assert (=> bm!21978 d!59357))

(declare-fun d!59359 () Bool)

(assert (=> d!59359 (= (apply!214 lt!119479 (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000)) (get!2857 (getValueByKey!270 (toList!1780 lt!119479) (select (arr!5560 (_keys!6475 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8726 () Bool)

(assert (= bs!8726 d!59359))

(assert (=> bs!8726 m!256817))

(assert (=> bs!8726 m!257085))

(assert (=> bs!8726 m!257085))

(declare-fun m!257101 () Bool)

(assert (=> bs!8726 m!257101))

(assert (=> b!236459 d!59359))

(declare-fun d!59361 () Bool)

(declare-fun c!39454 () Bool)

(assert (=> d!59361 (= c!39454 ((_ is ValueCellFull!2768) (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153703 () V!7945)

(assert (=> d!59361 (= (get!2856 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153703)))

(declare-fun b!236701 () Bool)

(declare-fun get!2858 (ValueCell!2768 V!7945) V!7945)

(assert (=> b!236701 (= e!153703 (get!2858 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236702 () Bool)

(declare-fun get!2859 (ValueCell!2768 V!7945) V!7945)

(assert (=> b!236702 (= e!153703 (get!2859 (select (arr!5559 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59361 c!39454) b!236701))

(assert (= (and d!59361 (not c!39454)) b!236702))

(assert (=> b!236701 m!256813))

(assert (=> b!236701 m!256811))

(declare-fun m!257103 () Bool)

(assert (=> b!236701 m!257103))

(assert (=> b!236702 m!256813))

(assert (=> b!236702 m!256811))

(declare-fun m!257105 () Bool)

(assert (=> b!236702 m!257105))

(assert (=> b!236459 d!59361))

(declare-fun d!59363 () Bool)

(declare-fun res!116017 () Bool)

(declare-fun e!153708 () Bool)

(assert (=> d!59363 (=> res!116017 e!153708)))

(assert (=> d!59363 (= res!116017 (and ((_ is Cons!3543) (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (= (_1!2324 (h!4196 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)))))

(assert (=> d!59363 (= (containsKey!262 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932) e!153708)))

(declare-fun b!236707 () Bool)

(declare-fun e!153709 () Bool)

(assert (=> b!236707 (= e!153708 e!153709)))

(declare-fun res!116018 () Bool)

(assert (=> b!236707 (=> (not res!116018) (not e!153709))))

(assert (=> b!236707 (= res!116018 (and (or (not ((_ is Cons!3543) (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) (bvsle (_1!2324 (h!4196 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)) ((_ is Cons!3543) (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (bvslt (_1!2324 (h!4196 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)))))

(declare-fun b!236708 () Bool)

(assert (=> b!236708 (= e!153709 (containsKey!262 (t!8519 (toList!1780 (getCurrentListMap!1289 (_keys!6475 thiss!1504) (_values!4376 thiss!1504) (mask!10385 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) key!932))))

(assert (= (and d!59363 (not res!116017)) b!236707))

(assert (= (and b!236707 res!116018) b!236708))

(declare-fun m!257107 () Bool)

(assert (=> b!236708 m!257107))

(assert (=> d!59283 d!59363))

(declare-fun mapNonEmpty!10552 () Bool)

(declare-fun mapRes!10552 () Bool)

(declare-fun tp!22279 () Bool)

(declare-fun e!153711 () Bool)

(assert (=> mapNonEmpty!10552 (= mapRes!10552 (and tp!22279 e!153711))))

(declare-fun mapRest!10552 () (Array (_ BitVec 32) ValueCell!2768))

(declare-fun mapValue!10552 () ValueCell!2768)

(declare-fun mapKey!10552 () (_ BitVec 32))

(assert (=> mapNonEmpty!10552 (= mapRest!10551 (store mapRest!10552 mapKey!10552 mapValue!10552))))

(declare-fun b!236709 () Bool)

(assert (=> b!236709 (= e!153711 tp_is_empty!6223)))

(declare-fun condMapEmpty!10552 () Bool)

(declare-fun mapDefault!10552 () ValueCell!2768)

(assert (=> mapNonEmpty!10551 (= condMapEmpty!10552 (= mapRest!10551 ((as const (Array (_ BitVec 32) ValueCell!2768)) mapDefault!10552)))))

(declare-fun e!153710 () Bool)

(assert (=> mapNonEmpty!10551 (= tp!22278 (and e!153710 mapRes!10552))))

(declare-fun mapIsEmpty!10552 () Bool)

(assert (=> mapIsEmpty!10552 mapRes!10552))

(declare-fun b!236710 () Bool)

(assert (=> b!236710 (= e!153710 tp_is_empty!6223)))

(assert (= (and mapNonEmpty!10551 condMapEmpty!10552) mapIsEmpty!10552))

(assert (= (and mapNonEmpty!10551 (not condMapEmpty!10552)) mapNonEmpty!10552))

(assert (= (and mapNonEmpty!10552 ((_ is ValueCellFull!2768) mapValue!10552)) b!236709))

(assert (= (and mapNonEmpty!10551 ((_ is ValueCellFull!2768) mapDefault!10552)) b!236710))

(declare-fun m!257109 () Bool)

(assert (=> mapNonEmpty!10552 m!257109))

(declare-fun b_lambda!7917 () Bool)

(assert (= b_lambda!7913 (or (and b!236351 b_free!6361) b_lambda!7917)))

(declare-fun b_lambda!7919 () Bool)

(assert (= b_lambda!7915 (or (and b!236351 b_free!6361) b_lambda!7919)))

(check-sat (not d!59351) (not b!236590) (not b!236563) (not b!236519) (not mapNonEmpty!10552) (not d!59307) (not b!236567) (not b!236685) (not b!236520) (not b!236687) (not b_lambda!7917) (not d!59305) (not b!236555) (not d!59337) (not d!59299) (not d!59339) (not d!59295) (not b!236600) (not d!59347) (not b!236690) (not b!236688) (not d!59311) (not d!59315) (not b!236701) (not bm!21987) (not b_next!6361) (not b!236552) (not d!59349) (not b!236696) (not d!59333) (not d!59345) (not d!59309) (not b!236574) (not b!236668) (not d!59319) (not b_lambda!7919) (not b!236694) (not b!236551) (not d!59301) (not b!236546) (not d!59303) (not b!236561) (not b!236576) (not b!236602) (not b!236550) (not b!236653) (not b!236589) (not b!236708) (not bm!21990) (not b!236547) (not b!236566) (not b!236575) (not b!236564) (not d!59325) (not d!59353) tp_is_empty!6223 (not b!236702) (not b!236569) (not bm!21981) (not d!59323) (not d!59313) b_and!13285 (not b!236641) (not d!59355) (not b!236556) (not d!59359) (not b!236565) (not b!236570) (not b!236693) (not b!236683) (not b_lambda!7911) (not d!59327) (not bm!21984) (not d!59357) (not d!59291) (not b!236573) (not d!59297) (not b!236625) (not b!236545) (not d!59317) (not d!59321) (not b!236591) (not b!236682))
(check-sat b_and!13285 (not b_next!6361))
