; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22160 () Bool)

(assert start!22160)

(declare-fun b!231415 () Bool)

(declare-fun b_free!6223 () Bool)

(declare-fun b_next!6223 () Bool)

(assert (=> b!231415 (= b_free!6223 (not b_next!6223))))

(declare-fun tp!21811 () Bool)

(declare-fun b_and!13135 () Bool)

(assert (=> b!231415 (= tp!21811 b_and!13135)))

(declare-fun b!231407 () Bool)

(declare-datatypes ((Unit!7098 0))(
  ( (Unit!7099) )
))
(declare-fun e!150215 () Unit!7098)

(declare-fun Unit!7100 () Unit!7098)

(assert (=> b!231407 (= e!150215 Unit!7100)))

(declare-fun lt!116677 () Unit!7098)

(declare-datatypes ((V!7761 0))(
  ( (V!7762 (val!3087 Int)) )
))
(declare-datatypes ((ValueCell!2699 0))(
  ( (ValueCellFull!2699 (v!5108 V!7761)) (EmptyCell!2699) )
))
(declare-datatypes ((array!11411 0))(
  ( (array!11412 (arr!5425 (Array (_ BitVec 32) ValueCell!2699)) (size!5758 (_ BitVec 32))) )
))
(declare-datatypes ((array!11413 0))(
  ( (array!11414 (arr!5426 (Array (_ BitVec 32) (_ BitVec 64))) (size!5759 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3298 0))(
  ( (LongMapFixedSize!3299 (defaultEntry!4308 Int) (mask!10210 (_ BitVec 32)) (extraKeys!4045 (_ BitVec 32)) (zeroValue!4149 V!7761) (minValue!4149 V!7761) (_size!1698 (_ BitVec 32)) (_keys!6362 array!11413) (_values!4291 array!11411) (_vacant!1698 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3298)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!304 (array!11413 array!11411 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) Int) Unit!7098)

(assert (=> b!231407 (= lt!116677 (lemmaInListMapThenSeekEntryOrOpenFindsIt!304 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231407 false))

(declare-fun bm!21488 () Bool)

(declare-fun call!21491 () Bool)

(declare-fun arrayContainsKey!0 (array!11413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21488 (= call!21491 (arrayContainsKey!0 (_keys!6362 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231408 () Bool)

(declare-fun e!150216 () Bool)

(declare-fun e!150220 () Bool)

(assert (=> b!231408 (= e!150216 e!150220)))

(declare-fun res!113727 () Bool)

(declare-fun call!21492 () Bool)

(assert (=> b!231408 (= res!113727 call!21492)))

(assert (=> b!231408 (=> (not res!113727) (not e!150220))))

(declare-fun b!231409 () Bool)

(declare-datatypes ((SeekEntryResult!918 0))(
  ( (MissingZero!918 (index!5842 (_ BitVec 32))) (Found!918 (index!5843 (_ BitVec 32))) (Intermediate!918 (undefined!1730 Bool) (index!5844 (_ BitVec 32)) (x!23466 (_ BitVec 32))) (Undefined!918) (MissingVacant!918 (index!5845 (_ BitVec 32))) )
))
(declare-fun lt!116682 () SeekEntryResult!918)

(get-info :version)

(assert (=> b!231409 (= e!150216 ((_ is Undefined!918) lt!116682))))

(declare-fun b!231411 () Bool)

(declare-fun e!150211 () Bool)

(declare-fun e!150223 () Bool)

(declare-fun mapRes!10297 () Bool)

(assert (=> b!231411 (= e!150211 (and e!150223 mapRes!10297))))

(declare-fun condMapEmpty!10297 () Bool)

(declare-fun mapDefault!10297 () ValueCell!2699)

(assert (=> b!231411 (= condMapEmpty!10297 (= (arr!5425 (_values!4291 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2699)) mapDefault!10297)))))

(declare-fun b!231412 () Bool)

(declare-fun e!150221 () Bool)

(declare-fun e!150213 () Bool)

(assert (=> b!231412 (= e!150221 e!150213)))

(declare-fun res!113728 () Bool)

(assert (=> b!231412 (=> (not res!113728) (not e!150213))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231412 (= res!113728 (or (= lt!116682 (MissingZero!918 index!297)) (= lt!116682 (MissingVacant!918 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11413 (_ BitVec 32)) SeekEntryResult!918)

(assert (=> b!231412 (= lt!116682 (seekEntryOrOpen!0 key!932 (_keys!6362 thiss!1504) (mask!10210 thiss!1504)))))

(declare-fun b!231413 () Bool)

(declare-fun res!113730 () Bool)

(declare-fun e!150224 () Bool)

(assert (=> b!231413 (=> (not res!113730) (not e!150224))))

(assert (=> b!231413 (= res!113730 call!21492)))

(declare-fun e!150218 () Bool)

(assert (=> b!231413 (= e!150218 e!150224)))

(declare-fun bm!21489 () Bool)

(declare-fun c!38447 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21489 (= call!21492 (inRange!0 (ite c!38447 (index!5842 lt!116682) (index!5845 lt!116682)) (mask!10210 thiss!1504)))))

(declare-fun b!231414 () Bool)

(declare-fun res!113731 () Bool)

(assert (=> b!231414 (=> (not res!113731) (not e!150224))))

(assert (=> b!231414 (= res!113731 (= (select (arr!5426 (_keys!6362 thiss!1504)) (index!5842 lt!116682)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10297 () Bool)

(assert (=> mapIsEmpty!10297 mapRes!10297))

(declare-fun mapNonEmpty!10297 () Bool)

(declare-fun tp!21810 () Bool)

(declare-fun e!150214 () Bool)

(assert (=> mapNonEmpty!10297 (= mapRes!10297 (and tp!21810 e!150214))))

(declare-fun mapKey!10297 () (_ BitVec 32))

(declare-fun mapRest!10297 () (Array (_ BitVec 32) ValueCell!2699))

(declare-fun mapValue!10297 () ValueCell!2699)

(assert (=> mapNonEmpty!10297 (= (arr!5425 (_values!4291 thiss!1504)) (store mapRest!10297 mapKey!10297 mapValue!10297))))

(declare-fun e!150219 () Bool)

(declare-fun tp_is_empty!6085 () Bool)

(declare-fun array_inv!3561 (array!11413) Bool)

(declare-fun array_inv!3562 (array!11411) Bool)

(assert (=> b!231415 (= e!150219 (and tp!21811 tp_is_empty!6085 (array_inv!3561 (_keys!6362 thiss!1504)) (array_inv!3562 (_values!4291 thiss!1504)) e!150211))))

(declare-fun b!231416 () Bool)

(declare-fun lt!116673 () Unit!7098)

(assert (=> b!231416 (= e!150215 lt!116673)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!298 (array!11413 array!11411 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) Int) Unit!7098)

(assert (=> b!231416 (= lt!116673 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!298 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231416 (= c!38447 ((_ is MissingZero!918) lt!116682))))

(assert (=> b!231416 e!150218))

(declare-fun b!231417 () Bool)

(declare-fun e!150222 () Unit!7098)

(declare-fun Unit!7101 () Unit!7098)

(assert (=> b!231417 (= e!150222 Unit!7101)))

(declare-fun lt!116671 () Unit!7098)

(declare-fun lemmaArrayContainsKeyThenInListMap!140 (array!11413 array!11411 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) (_ BitVec 32) Int) Unit!7098)

(assert (=> b!231417 (= lt!116671 (lemmaArrayContainsKeyThenInListMap!140 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231417 false))

(declare-fun b!231418 () Bool)

(declare-fun res!113729 () Bool)

(assert (=> b!231418 (= res!113729 (= (select (arr!5426 (_keys!6362 thiss!1504)) (index!5845 lt!116682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231418 (=> (not res!113729) (not e!150220))))

(declare-fun res!113733 () Bool)

(assert (=> start!22160 (=> (not res!113733) (not e!150221))))

(declare-fun valid!1325 (LongMapFixedSize!3298) Bool)

(assert (=> start!22160 (= res!113733 (valid!1325 thiss!1504))))

(assert (=> start!22160 e!150221))

(assert (=> start!22160 e!150219))

(assert (=> start!22160 true))

(assert (=> start!22160 tp_is_empty!6085))

(declare-fun b!231410 () Bool)

(assert (=> b!231410 (= e!150220 (not call!21491))))

(declare-fun b!231419 () Bool)

(declare-fun e!150212 () Bool)

(assert (=> b!231419 (= e!150213 e!150212)))

(declare-fun res!113734 () Bool)

(assert (=> b!231419 (=> (not res!113734) (not e!150212))))

(assert (=> b!231419 (= res!113734 (inRange!0 index!297 (mask!10210 thiss!1504)))))

(declare-fun lt!116678 () Unit!7098)

(assert (=> b!231419 (= lt!116678 e!150215)))

(declare-fun c!38446 () Bool)

(declare-datatypes ((tuple2!4482 0))(
  ( (tuple2!4483 (_1!2252 (_ BitVec 64)) (_2!2252 V!7761)) )
))
(declare-datatypes ((List!3394 0))(
  ( (Nil!3391) (Cons!3390 (h!4038 tuple2!4482) (t!8345 List!3394)) )
))
(declare-datatypes ((ListLongMap!3397 0))(
  ( (ListLongMap!3398 (toList!1714 List!3394)) )
))
(declare-fun lt!116675 () ListLongMap!3397)

(declare-fun contains!1600 (ListLongMap!3397 (_ BitVec 64)) Bool)

(assert (=> b!231419 (= c!38446 (contains!1600 lt!116675 key!932))))

(declare-fun getCurrentListMap!1246 (array!11413 array!11411 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 32) Int) ListLongMap!3397)

(assert (=> b!231419 (= lt!116675 (getCurrentListMap!1246 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(declare-fun b!231420 () Bool)

(declare-fun Unit!7102 () Unit!7098)

(assert (=> b!231420 (= e!150222 Unit!7102)))

(declare-fun b!231421 () Bool)

(assert (=> b!231421 (= e!150223 tp_is_empty!6085)))

(declare-fun b!231422 () Bool)

(assert (=> b!231422 (= e!150214 tp_is_empty!6085)))

(declare-fun b!231423 () Bool)

(declare-fun res!113732 () Bool)

(assert (=> b!231423 (=> (not res!113732) (not e!150221))))

(assert (=> b!231423 (= res!113732 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231424 () Bool)

(declare-fun c!38449 () Bool)

(assert (=> b!231424 (= c!38449 ((_ is MissingVacant!918) lt!116682))))

(assert (=> b!231424 (= e!150218 e!150216)))

(declare-fun b!231425 () Bool)

(assert (=> b!231425 (= e!150224 (not call!21491))))

(declare-fun b!231426 () Bool)

(assert (=> b!231426 (= e!150212 (not true))))

(declare-fun lt!116672 () array!11413)

(declare-fun arrayCountValidKeys!0 (array!11413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231426 (= (arrayCountValidKeys!0 lt!116672 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116683 () Unit!7098)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11413 (_ BitVec 32)) Unit!7098)

(assert (=> b!231426 (= lt!116683 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116672 index!297))))

(assert (=> b!231426 (arrayContainsKey!0 lt!116672 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116670 () Unit!7098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11413 (_ BitVec 64) (_ BitVec 32)) Unit!7098)

(assert (=> b!231426 (= lt!116670 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116672 key!932 index!297))))

(declare-fun v!346 () V!7761)

(declare-fun +!612 (ListLongMap!3397 tuple2!4482) ListLongMap!3397)

(assert (=> b!231426 (= (+!612 lt!116675 (tuple2!4483 key!932 v!346)) (getCurrentListMap!1246 lt!116672 (array!11412 (store (arr!5425 (_values!4291 thiss!1504)) index!297 (ValueCellFull!2699 v!346)) (size!5758 (_values!4291 thiss!1504))) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(declare-fun lt!116679 () Unit!7098)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!71 (array!11413 array!11411 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 32) (_ BitVec 64) V!7761 Int) Unit!7098)

(assert (=> b!231426 (= lt!116679 (lemmaAddValidKeyToArrayThenAddPairToListMap!71 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) index!297 key!932 v!346 (defaultEntry!4308 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11413 (_ BitVec 32)) Bool)

(assert (=> b!231426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116672 (mask!10210 thiss!1504))))

(declare-fun lt!116676 () Unit!7098)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11413 (_ BitVec 32) (_ BitVec 32)) Unit!7098)

(assert (=> b!231426 (= lt!116676 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6362 thiss!1504) index!297 (mask!10210 thiss!1504)))))

(assert (=> b!231426 (= (arrayCountValidKeys!0 lt!116672 #b00000000000000000000000000000000 (size!5759 (_keys!6362 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6362 thiss!1504) #b00000000000000000000000000000000 (size!5759 (_keys!6362 thiss!1504)))))))

(declare-fun lt!116680 () Unit!7098)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11413 (_ BitVec 32) (_ BitVec 64)) Unit!7098)

(assert (=> b!231426 (= lt!116680 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6362 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3395 0))(
  ( (Nil!3392) (Cons!3391 (h!4039 (_ BitVec 64)) (t!8346 List!3395)) )
))
(declare-fun arrayNoDuplicates!0 (array!11413 (_ BitVec 32) List!3395) Bool)

(assert (=> b!231426 (arrayNoDuplicates!0 lt!116672 #b00000000000000000000000000000000 Nil!3392)))

(assert (=> b!231426 (= lt!116672 (array!11414 (store (arr!5426 (_keys!6362 thiss!1504)) index!297 key!932) (size!5759 (_keys!6362 thiss!1504))))))

(declare-fun lt!116681 () Unit!7098)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3395) Unit!7098)

(assert (=> b!231426 (= lt!116681 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6362 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3392))))

(declare-fun lt!116674 () Unit!7098)

(assert (=> b!231426 (= lt!116674 e!150222)))

(declare-fun c!38448 () Bool)

(assert (=> b!231426 (= c!38448 (arrayContainsKey!0 (_keys!6362 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!22160 res!113733) b!231423))

(assert (= (and b!231423 res!113732) b!231412))

(assert (= (and b!231412 res!113728) b!231419))

(assert (= (and b!231419 c!38446) b!231407))

(assert (= (and b!231419 (not c!38446)) b!231416))

(assert (= (and b!231416 c!38447) b!231413))

(assert (= (and b!231416 (not c!38447)) b!231424))

(assert (= (and b!231413 res!113730) b!231414))

(assert (= (and b!231414 res!113731) b!231425))

(assert (= (and b!231424 c!38449) b!231408))

(assert (= (and b!231424 (not c!38449)) b!231409))

(assert (= (and b!231408 res!113727) b!231418))

(assert (= (and b!231418 res!113729) b!231410))

(assert (= (or b!231413 b!231408) bm!21489))

(assert (= (or b!231425 b!231410) bm!21488))

(assert (= (and b!231419 res!113734) b!231426))

(assert (= (and b!231426 c!38448) b!231417))

(assert (= (and b!231426 (not c!38448)) b!231420))

(assert (= (and b!231411 condMapEmpty!10297) mapIsEmpty!10297))

(assert (= (and b!231411 (not condMapEmpty!10297)) mapNonEmpty!10297))

(assert (= (and mapNonEmpty!10297 ((_ is ValueCellFull!2699) mapValue!10297)) b!231422))

(assert (= (and b!231411 ((_ is ValueCellFull!2699) mapDefault!10297)) b!231421))

(assert (= b!231415 b!231411))

(assert (= start!22160 b!231415))

(declare-fun m!252931 () Bool)

(assert (=> b!231414 m!252931))

(declare-fun m!252933 () Bool)

(assert (=> bm!21488 m!252933))

(declare-fun m!252935 () Bool)

(assert (=> b!231415 m!252935))

(declare-fun m!252937 () Bool)

(assert (=> b!231415 m!252937))

(declare-fun m!252939 () Bool)

(assert (=> start!22160 m!252939))

(declare-fun m!252941 () Bool)

(assert (=> b!231417 m!252941))

(declare-fun m!252943 () Bool)

(assert (=> mapNonEmpty!10297 m!252943))

(declare-fun m!252945 () Bool)

(assert (=> bm!21489 m!252945))

(declare-fun m!252947 () Bool)

(assert (=> b!231419 m!252947))

(declare-fun m!252949 () Bool)

(assert (=> b!231419 m!252949))

(declare-fun m!252951 () Bool)

(assert (=> b!231419 m!252951))

(declare-fun m!252953 () Bool)

(assert (=> b!231418 m!252953))

(declare-fun m!252955 () Bool)

(assert (=> b!231416 m!252955))

(assert (=> b!231426 m!252933))

(declare-fun m!252957 () Bool)

(assert (=> b!231426 m!252957))

(declare-fun m!252959 () Bool)

(assert (=> b!231426 m!252959))

(declare-fun m!252961 () Bool)

(assert (=> b!231426 m!252961))

(declare-fun m!252963 () Bool)

(assert (=> b!231426 m!252963))

(declare-fun m!252965 () Bool)

(assert (=> b!231426 m!252965))

(declare-fun m!252967 () Bool)

(assert (=> b!231426 m!252967))

(declare-fun m!252969 () Bool)

(assert (=> b!231426 m!252969))

(declare-fun m!252971 () Bool)

(assert (=> b!231426 m!252971))

(declare-fun m!252973 () Bool)

(assert (=> b!231426 m!252973))

(declare-fun m!252975 () Bool)

(assert (=> b!231426 m!252975))

(declare-fun m!252977 () Bool)

(assert (=> b!231426 m!252977))

(declare-fun m!252979 () Bool)

(assert (=> b!231426 m!252979))

(declare-fun m!252981 () Bool)

(assert (=> b!231426 m!252981))

(declare-fun m!252983 () Bool)

(assert (=> b!231426 m!252983))

(declare-fun m!252985 () Bool)

(assert (=> b!231426 m!252985))

(declare-fun m!252987 () Bool)

(assert (=> b!231426 m!252987))

(declare-fun m!252989 () Bool)

(assert (=> b!231412 m!252989))

(declare-fun m!252991 () Bool)

(assert (=> b!231407 m!252991))

(check-sat (not b!231416) (not b!231412) tp_is_empty!6085 (not bm!21488) (not b!231419) (not b!231426) (not start!22160) b_and!13135 (not b!231415) (not b_next!6223) (not b!231407) (not bm!21489) (not mapNonEmpty!10297) (not b!231417))
(check-sat b_and!13135 (not b_next!6223))
