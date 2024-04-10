; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22194 () Bool)

(assert start!22194)

(declare-fun b!232500 () Bool)

(declare-fun b_free!6261 () Bool)

(declare-fun b_next!6261 () Bool)

(assert (=> b!232500 (= b_free!6261 (not b_next!6261))))

(declare-fun tp!21924 () Bool)

(declare-fun b_and!13159 () Bool)

(assert (=> b!232500 (= tp!21924 b_and!13159)))

(declare-fun e!150998 () Bool)

(declare-datatypes ((V!7811 0))(
  ( (V!7812 (val!3106 Int)) )
))
(declare-datatypes ((ValueCell!2718 0))(
  ( (ValueCellFull!2718 (v!5126 V!7811)) (EmptyCell!2718) )
))
(declare-datatypes ((array!11489 0))(
  ( (array!11490 (arr!5464 (Array (_ BitVec 32) ValueCell!2718)) (size!5797 (_ BitVec 32))) )
))
(declare-datatypes ((array!11491 0))(
  ( (array!11492 (arr!5465 (Array (_ BitVec 32) (_ BitVec 64))) (size!5798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3336 0))(
  ( (LongMapFixedSize!3337 (defaultEntry!4327 Int) (mask!10241 (_ BitVec 32)) (extraKeys!4064 (_ BitVec 32)) (zeroValue!4168 V!7811) (minValue!4168 V!7811) (_size!1717 (_ BitVec 32)) (_keys!6381 array!11491) (_values!4310 array!11489) (_vacant!1717 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3336)

(declare-fun tp_is_empty!6123 () Bool)

(declare-fun e!150993 () Bool)

(declare-fun array_inv!3601 (array!11491) Bool)

(declare-fun array_inv!3602 (array!11489) Bool)

(assert (=> b!232500 (= e!150998 (and tp!21924 tp_is_empty!6123 (array_inv!3601 (_keys!6381 thiss!1504)) (array_inv!3602 (_values!4310 thiss!1504)) e!150993))))

(declare-fun b!232501 () Bool)

(declare-fun e!150997 () Bool)

(assert (=> b!232501 (= e!150997 tp_is_empty!6123)))

(declare-fun bm!21614 () Bool)

(declare-fun call!21618 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21614 (= call!21618 (arrayContainsKey!0 (_keys!6381 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232502 () Bool)

(declare-datatypes ((Unit!7181 0))(
  ( (Unit!7182) )
))
(declare-fun e!150985 () Unit!7181)

(declare-fun lt!117450 () Unit!7181)

(assert (=> b!232502 (= e!150985 lt!117450)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!327 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7811 V!7811 (_ BitVec 64) Int) Unit!7181)

(assert (=> b!232502 (= lt!117450 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!327 (_keys!6381 thiss!1504) (_values!4310 thiss!1504) (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) key!932 (defaultEntry!4327 thiss!1504)))))

(declare-fun c!38661 () Bool)

(declare-datatypes ((SeekEntryResult!965 0))(
  ( (MissingZero!965 (index!6030 (_ BitVec 32))) (Found!965 (index!6031 (_ BitVec 32))) (Intermediate!965 (undefined!1777 Bool) (index!6032 (_ BitVec 32)) (x!23561 (_ BitVec 32))) (Undefined!965) (MissingVacant!965 (index!6033 (_ BitVec 32))) )
))
(declare-fun lt!117438 () SeekEntryResult!965)

(get-info :version)

(assert (=> b!232502 (= c!38661 ((_ is MissingZero!965) lt!117438))))

(declare-fun e!150988 () Bool)

(assert (=> b!232502 e!150988))

(declare-fun mapNonEmpty!10354 () Bool)

(declare-fun mapRes!10354 () Bool)

(declare-fun tp!21925 () Bool)

(declare-fun e!150991 () Bool)

(assert (=> mapNonEmpty!10354 (= mapRes!10354 (and tp!21925 e!150991))))

(declare-fun mapValue!10354 () ValueCell!2718)

(declare-fun mapKey!10354 () (_ BitVec 32))

(declare-fun mapRest!10354 () (Array (_ BitVec 32) ValueCell!2718))

(assert (=> mapNonEmpty!10354 (= (arr!5464 (_values!4310 thiss!1504)) (store mapRest!10354 mapKey!10354 mapValue!10354))))

(declare-fun b!232503 () Bool)

(declare-fun e!150992 () Bool)

(assert (=> b!232503 (= e!150992 (not call!21618))))

(declare-fun b!232504 () Bool)

(declare-fun Unit!7183 () Unit!7181)

(assert (=> b!232504 (= e!150985 Unit!7183)))

(declare-fun lt!117439 () Unit!7181)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!310 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7811 V!7811 (_ BitVec 64) Int) Unit!7181)

(assert (=> b!232504 (= lt!117439 (lemmaInListMapThenSeekEntryOrOpenFindsIt!310 (_keys!6381 thiss!1504) (_values!4310 thiss!1504) (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) key!932 (defaultEntry!4327 thiss!1504)))))

(assert (=> b!232504 false))

(declare-fun res!114166 () Bool)

(declare-fun e!150989 () Bool)

(assert (=> start!22194 (=> (not res!114166) (not e!150989))))

(declare-fun valid!1320 (LongMapFixedSize!3336) Bool)

(assert (=> start!22194 (= res!114166 (valid!1320 thiss!1504))))

(assert (=> start!22194 e!150989))

(assert (=> start!22194 e!150998))

(assert (=> start!22194 true))

(assert (=> start!22194 tp_is_empty!6123))

(declare-fun b!232505 () Bool)

(declare-fun res!114162 () Bool)

(assert (=> b!232505 (= res!114162 (= (select (arr!5465 (_keys!6381 thiss!1504)) (index!6033 lt!117438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232505 (=> (not res!114162) (not e!150992))))

(declare-fun b!232506 () Bool)

(declare-fun res!114165 () Bool)

(assert (=> b!232506 (=> (not res!114165) (not e!150989))))

(assert (=> b!232506 (= res!114165 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232507 () Bool)

(assert (=> b!232507 (= e!150993 (and e!150997 mapRes!10354))))

(declare-fun condMapEmpty!10354 () Bool)

(declare-fun mapDefault!10354 () ValueCell!2718)

(assert (=> b!232507 (= condMapEmpty!10354 (= (arr!5464 (_values!4310 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2718)) mapDefault!10354)))))

(declare-fun b!232508 () Bool)

(declare-fun e!150986 () Unit!7181)

(declare-fun Unit!7184 () Unit!7181)

(assert (=> b!232508 (= e!150986 Unit!7184)))

(declare-fun lt!117447 () Unit!7181)

(declare-fun lemmaArrayContainsKeyThenInListMap!145 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7811 V!7811 (_ BitVec 64) (_ BitVec 32) Int) Unit!7181)

(assert (=> b!232508 (= lt!117447 (lemmaArrayContainsKeyThenInListMap!145 (_keys!6381 thiss!1504) (_values!4310 thiss!1504) (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4327 thiss!1504)))))

(assert (=> b!232508 false))

(declare-fun mapIsEmpty!10354 () Bool)

(assert (=> mapIsEmpty!10354 mapRes!10354))

(declare-fun b!232509 () Bool)

(declare-fun c!38662 () Bool)

(assert (=> b!232509 (= c!38662 ((_ is MissingVacant!965) lt!117438))))

(declare-fun e!150995 () Bool)

(assert (=> b!232509 (= e!150988 e!150995)))

(declare-fun bm!21615 () Bool)

(declare-fun call!21617 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21615 (= call!21617 (inRange!0 (ite c!38661 (index!6030 lt!117438) (index!6033 lt!117438)) (mask!10241 thiss!1504)))))

(declare-fun b!232510 () Bool)

(declare-fun e!150990 () Bool)

(assert (=> b!232510 (= e!150989 e!150990)))

(declare-fun res!114169 () Bool)

(assert (=> b!232510 (=> (not res!114169) (not e!150990))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232510 (= res!114169 (or (= lt!117438 (MissingZero!965 index!297)) (= lt!117438 (MissingVacant!965 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11491 (_ BitVec 32)) SeekEntryResult!965)

(assert (=> b!232510 (= lt!117438 (seekEntryOrOpen!0 key!932 (_keys!6381 thiss!1504) (mask!10241 thiss!1504)))))

(declare-fun b!232511 () Bool)

(declare-fun res!114167 () Bool)

(declare-fun e!150994 () Bool)

(assert (=> b!232511 (=> (not res!114167) (not e!150994))))

(assert (=> b!232511 (= res!114167 (= (select (arr!5465 (_keys!6381 thiss!1504)) (index!6030 lt!117438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232512 () Bool)

(declare-fun e!150987 () Bool)

(assert (=> b!232512 (= e!150990 e!150987)))

(declare-fun res!114163 () Bool)

(assert (=> b!232512 (=> (not res!114163) (not e!150987))))

(assert (=> b!232512 (= res!114163 (inRange!0 index!297 (mask!10241 thiss!1504)))))

(declare-fun lt!117440 () Unit!7181)

(assert (=> b!232512 (= lt!117440 e!150985)))

(declare-fun c!38664 () Bool)

(declare-datatypes ((tuple2!4584 0))(
  ( (tuple2!4585 (_1!2303 (_ BitVec 64)) (_2!2303 V!7811)) )
))
(declare-datatypes ((List!3501 0))(
  ( (Nil!3498) (Cons!3497 (h!4145 tuple2!4584) (t!8460 List!3501)) )
))
(declare-datatypes ((ListLongMap!3497 0))(
  ( (ListLongMap!3498 (toList!1764 List!3501)) )
))
(declare-fun lt!117437 () ListLongMap!3497)

(declare-fun contains!1632 (ListLongMap!3497 (_ BitVec 64)) Bool)

(assert (=> b!232512 (= c!38664 (contains!1632 lt!117437 key!932))))

(declare-fun getCurrentListMap!1292 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7811 V!7811 (_ BitVec 32) Int) ListLongMap!3497)

(assert (=> b!232512 (= lt!117437 (getCurrentListMap!1292 (_keys!6381 thiss!1504) (_values!4310 thiss!1504) (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4327 thiss!1504)))))

(declare-fun b!232513 () Bool)

(assert (=> b!232513 (= e!150995 ((_ is Undefined!965) lt!117438))))

(declare-fun b!232514 () Bool)

(declare-fun Unit!7185 () Unit!7181)

(assert (=> b!232514 (= e!150986 Unit!7185)))

(declare-fun b!232515 () Bool)

(declare-fun res!114164 () Bool)

(assert (=> b!232515 (=> (not res!114164) (not e!150994))))

(assert (=> b!232515 (= res!114164 call!21617)))

(assert (=> b!232515 (= e!150988 e!150994)))

(declare-fun b!232516 () Bool)

(assert (=> b!232516 (= e!150987 (not true))))

(declare-fun lt!117452 () array!11489)

(declare-fun lt!117451 () Bool)

(declare-fun lt!117444 () array!11491)

(assert (=> b!232516 (= lt!117451 (valid!1320 (LongMapFixedSize!3337 (defaultEntry!4327 thiss!1504) (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1717 thiss!1504)) lt!117444 lt!117452 (_vacant!1717 thiss!1504))))))

(declare-fun lt!117435 () ListLongMap!3497)

(assert (=> b!232516 (contains!1632 lt!117435 key!932)))

(declare-fun lt!117446 () Unit!7181)

(declare-fun lemmaValidKeyInArrayIsInListMap!148 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7811 V!7811 (_ BitVec 32) Int) Unit!7181)

(assert (=> b!232516 (= lt!117446 (lemmaValidKeyInArrayIsInListMap!148 lt!117444 lt!117452 (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) index!297 (defaultEntry!4327 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11491 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232516 (= (arrayCountValidKeys!0 lt!117444 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117449 () Unit!7181)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11491 (_ BitVec 32)) Unit!7181)

(assert (=> b!232516 (= lt!117449 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117444 index!297))))

(assert (=> b!232516 (arrayContainsKey!0 lt!117444 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117434 () Unit!7181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11491 (_ BitVec 64) (_ BitVec 32)) Unit!7181)

(assert (=> b!232516 (= lt!117434 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117444 key!932 index!297))))

(declare-fun lt!117443 () ListLongMap!3497)

(assert (=> b!232516 (= lt!117443 lt!117435)))

(assert (=> b!232516 (= lt!117435 (getCurrentListMap!1292 lt!117444 lt!117452 (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4327 thiss!1504)))))

(declare-fun v!346 () V!7811)

(declare-fun +!626 (ListLongMap!3497 tuple2!4584) ListLongMap!3497)

(assert (=> b!232516 (= lt!117443 (+!626 lt!117437 (tuple2!4585 key!932 v!346)))))

(assert (=> b!232516 (= lt!117452 (array!11490 (store (arr!5464 (_values!4310 thiss!1504)) index!297 (ValueCellFull!2718 v!346)) (size!5797 (_values!4310 thiss!1504))))))

(declare-fun lt!117442 () Unit!7181)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!80 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7811 V!7811 (_ BitVec 32) (_ BitVec 64) V!7811 Int) Unit!7181)

(assert (=> b!232516 (= lt!117442 (lemmaAddValidKeyToArrayThenAddPairToListMap!80 (_keys!6381 thiss!1504) (_values!4310 thiss!1504) (mask!10241 thiss!1504) (extraKeys!4064 thiss!1504) (zeroValue!4168 thiss!1504) (minValue!4168 thiss!1504) index!297 key!932 v!346 (defaultEntry!4327 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11491 (_ BitVec 32)) Bool)

(assert (=> b!232516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117444 (mask!10241 thiss!1504))))

(declare-fun lt!117441 () Unit!7181)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11491 (_ BitVec 32) (_ BitVec 32)) Unit!7181)

(assert (=> b!232516 (= lt!117441 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6381 thiss!1504) index!297 (mask!10241 thiss!1504)))))

(assert (=> b!232516 (= (arrayCountValidKeys!0 lt!117444 #b00000000000000000000000000000000 (size!5798 (_keys!6381 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6381 thiss!1504) #b00000000000000000000000000000000 (size!5798 (_keys!6381 thiss!1504)))))))

(declare-fun lt!117436 () Unit!7181)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11491 (_ BitVec 32) (_ BitVec 64)) Unit!7181)

(assert (=> b!232516 (= lt!117436 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6381 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3502 0))(
  ( (Nil!3499) (Cons!3498 (h!4146 (_ BitVec 64)) (t!8461 List!3502)) )
))
(declare-fun arrayNoDuplicates!0 (array!11491 (_ BitVec 32) List!3502) Bool)

(assert (=> b!232516 (arrayNoDuplicates!0 lt!117444 #b00000000000000000000000000000000 Nil!3499)))

(assert (=> b!232516 (= lt!117444 (array!11492 (store (arr!5465 (_keys!6381 thiss!1504)) index!297 key!932) (size!5798 (_keys!6381 thiss!1504))))))

(declare-fun lt!117445 () Unit!7181)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3502) Unit!7181)

(assert (=> b!232516 (= lt!117445 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6381 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3499))))

(declare-fun lt!117448 () Unit!7181)

(assert (=> b!232516 (= lt!117448 e!150986)))

(declare-fun c!38663 () Bool)

(assert (=> b!232516 (= c!38663 (arrayContainsKey!0 (_keys!6381 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232517 () Bool)

(assert (=> b!232517 (= e!150994 (not call!21618))))

(declare-fun b!232518 () Bool)

(assert (=> b!232518 (= e!150995 e!150992)))

(declare-fun res!114168 () Bool)

(assert (=> b!232518 (= res!114168 call!21617)))

(assert (=> b!232518 (=> (not res!114168) (not e!150992))))

(declare-fun b!232519 () Bool)

(assert (=> b!232519 (= e!150991 tp_is_empty!6123)))

(assert (= (and start!22194 res!114166) b!232506))

(assert (= (and b!232506 res!114165) b!232510))

(assert (= (and b!232510 res!114169) b!232512))

(assert (= (and b!232512 c!38664) b!232504))

(assert (= (and b!232512 (not c!38664)) b!232502))

(assert (= (and b!232502 c!38661) b!232515))

(assert (= (and b!232502 (not c!38661)) b!232509))

(assert (= (and b!232515 res!114164) b!232511))

(assert (= (and b!232511 res!114167) b!232517))

(assert (= (and b!232509 c!38662) b!232518))

(assert (= (and b!232509 (not c!38662)) b!232513))

(assert (= (and b!232518 res!114168) b!232505))

(assert (= (and b!232505 res!114162) b!232503))

(assert (= (or b!232515 b!232518) bm!21615))

(assert (= (or b!232517 b!232503) bm!21614))

(assert (= (and b!232512 res!114163) b!232516))

(assert (= (and b!232516 c!38663) b!232508))

(assert (= (and b!232516 (not c!38663)) b!232514))

(assert (= (and b!232507 condMapEmpty!10354) mapIsEmpty!10354))

(assert (= (and b!232507 (not condMapEmpty!10354)) mapNonEmpty!10354))

(assert (= (and mapNonEmpty!10354 ((_ is ValueCellFull!2718) mapValue!10354)) b!232519))

(assert (= (and b!232507 ((_ is ValueCellFull!2718) mapDefault!10354)) b!232501))

(assert (= b!232500 b!232507))

(assert (= start!22194 b!232500))

(declare-fun m!253933 () Bool)

(assert (=> b!232505 m!253933))

(declare-fun m!253935 () Bool)

(assert (=> b!232511 m!253935))

(declare-fun m!253937 () Bool)

(assert (=> b!232516 m!253937))

(declare-fun m!253939 () Bool)

(assert (=> b!232516 m!253939))

(declare-fun m!253941 () Bool)

(assert (=> b!232516 m!253941))

(declare-fun m!253943 () Bool)

(assert (=> b!232516 m!253943))

(declare-fun m!253945 () Bool)

(assert (=> b!232516 m!253945))

(declare-fun m!253947 () Bool)

(assert (=> b!232516 m!253947))

(declare-fun m!253949 () Bool)

(assert (=> b!232516 m!253949))

(declare-fun m!253951 () Bool)

(assert (=> b!232516 m!253951))

(declare-fun m!253953 () Bool)

(assert (=> b!232516 m!253953))

(declare-fun m!253955 () Bool)

(assert (=> b!232516 m!253955))

(declare-fun m!253957 () Bool)

(assert (=> b!232516 m!253957))

(declare-fun m!253959 () Bool)

(assert (=> b!232516 m!253959))

(declare-fun m!253961 () Bool)

(assert (=> b!232516 m!253961))

(declare-fun m!253963 () Bool)

(assert (=> b!232516 m!253963))

(declare-fun m!253965 () Bool)

(assert (=> b!232516 m!253965))

(declare-fun m!253967 () Bool)

(assert (=> b!232516 m!253967))

(declare-fun m!253969 () Bool)

(assert (=> b!232516 m!253969))

(declare-fun m!253971 () Bool)

(assert (=> b!232516 m!253971))

(declare-fun m!253973 () Bool)

(assert (=> b!232516 m!253973))

(declare-fun m!253975 () Bool)

(assert (=> b!232516 m!253975))

(declare-fun m!253977 () Bool)

(assert (=> bm!21615 m!253977))

(declare-fun m!253979 () Bool)

(assert (=> start!22194 m!253979))

(declare-fun m!253981 () Bool)

(assert (=> b!232508 m!253981))

(declare-fun m!253983 () Bool)

(assert (=> b!232504 m!253983))

(declare-fun m!253985 () Bool)

(assert (=> mapNonEmpty!10354 m!253985))

(declare-fun m!253987 () Bool)

(assert (=> b!232500 m!253987))

(declare-fun m!253989 () Bool)

(assert (=> b!232500 m!253989))

(declare-fun m!253991 () Bool)

(assert (=> b!232512 m!253991))

(declare-fun m!253993 () Bool)

(assert (=> b!232512 m!253993))

(declare-fun m!253995 () Bool)

(assert (=> b!232512 m!253995))

(assert (=> bm!21614 m!253937))

(declare-fun m!253997 () Bool)

(assert (=> b!232510 m!253997))

(declare-fun m!253999 () Bool)

(assert (=> b!232502 m!253999))

(check-sat (not mapNonEmpty!10354) (not b!232502) (not b!232500) (not b!232504) (not bm!21615) (not start!22194) tp_is_empty!6123 (not b!232508) b_and!13159 (not b!232512) (not b!232516) (not bm!21614) (not b!232510) (not b_next!6261))
(check-sat b_and!13159 (not b_next!6261))
