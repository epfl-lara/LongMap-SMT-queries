; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22202 () Bool)

(assert start!22202)

(declare-fun b!232489 () Bool)

(declare-fun b_free!6265 () Bool)

(declare-fun b_next!6265 () Bool)

(assert (=> b!232489 (= b_free!6265 (not b_next!6265))))

(declare-fun tp!21936 () Bool)

(declare-fun b_and!13137 () Bool)

(assert (=> b!232489 (= tp!21936 b_and!13137)))

(declare-fun b!232475 () Bool)

(declare-datatypes ((Unit!7171 0))(
  ( (Unit!7172) )
))
(declare-fun e!150980 () Unit!7171)

(declare-fun Unit!7173 () Unit!7171)

(assert (=> b!232475 (= e!150980 Unit!7173)))

(declare-fun lt!117386 () Unit!7171)

(declare-datatypes ((V!7817 0))(
  ( (V!7818 (val!3108 Int)) )
))
(declare-datatypes ((ValueCell!2720 0))(
  ( (ValueCellFull!2720 (v!5122 V!7817)) (EmptyCell!2720) )
))
(declare-datatypes ((array!11489 0))(
  ( (array!11490 (arr!5463 (Array (_ BitVec 32) ValueCell!2720)) (size!5797 (_ BitVec 32))) )
))
(declare-datatypes ((array!11491 0))(
  ( (array!11492 (arr!5464 (Array (_ BitVec 32) (_ BitVec 64))) (size!5798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3340 0))(
  ( (LongMapFixedSize!3341 (defaultEntry!4329 Int) (mask!10244 (_ BitVec 32)) (extraKeys!4066 (_ BitVec 32)) (zeroValue!4170 V!7817) (minValue!4170 V!7817) (_size!1719 (_ BitVec 32)) (_keys!6382 array!11491) (_values!4312 array!11489) (_vacant!1719 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3340)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!318 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 64) Int) Unit!7171)

(assert (=> b!232475 (= lt!117386 (lemmaInListMapThenSeekEntryOrOpenFindsIt!318 (_keys!6382 thiss!1504) (_values!4312 thiss!1504) (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) key!932 (defaultEntry!4329 thiss!1504)))))

(assert (=> b!232475 false))

(declare-fun mapIsEmpty!10360 () Bool)

(declare-fun mapRes!10360 () Bool)

(assert (=> mapIsEmpty!10360 mapRes!10360))

(declare-fun bm!21603 () Bool)

(declare-fun call!21606 () Bool)

(declare-fun arrayContainsKey!0 (array!11491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21603 (= call!21606 (arrayContainsKey!0 (_keys!6382 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232476 () Bool)

(declare-fun e!150971 () Bool)

(assert (=> b!232476 (= e!150971 (not call!21606))))

(declare-fun b!232477 () Bool)

(declare-fun e!150974 () Bool)

(declare-datatypes ((SeekEntryResult!970 0))(
  ( (MissingZero!970 (index!6050 (_ BitVec 32))) (Found!970 (index!6051 (_ BitVec 32))) (Intermediate!970 (undefined!1782 Bool) (index!6052 (_ BitVec 32)) (x!23573 (_ BitVec 32))) (Undefined!970) (MissingVacant!970 (index!6053 (_ BitVec 32))) )
))
(declare-fun lt!117370 () SeekEntryResult!970)

(get-info :version)

(assert (=> b!232477 (= e!150974 ((_ is Undefined!970) lt!117370))))

(declare-fun b!232478 () Bool)

(declare-fun c!38660 () Bool)

(assert (=> b!232478 (= c!38660 ((_ is MissingVacant!970) lt!117370))))

(declare-fun e!150982 () Bool)

(assert (=> b!232478 (= e!150982 e!150974)))

(declare-fun b!232479 () Bool)

(declare-fun res!114124 () Bool)

(declare-fun e!150984 () Bool)

(assert (=> b!232479 (=> (not res!114124) (not e!150984))))

(assert (=> b!232479 (= res!114124 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232480 () Bool)

(declare-fun e!150979 () Bool)

(assert (=> b!232480 (= e!150979 (not call!21606))))

(declare-fun b!232481 () Bool)

(declare-fun e!150977 () Bool)

(declare-fun tp_is_empty!6127 () Bool)

(assert (=> b!232481 (= e!150977 tp_is_empty!6127)))

(declare-fun b!232482 () Bool)

(declare-fun lt!117379 () Unit!7171)

(assert (=> b!232482 (= e!150980 lt!117379)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!314 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 64) Int) Unit!7171)

(assert (=> b!232482 (= lt!117379 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!314 (_keys!6382 thiss!1504) (_values!4312 thiss!1504) (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) key!932 (defaultEntry!4329 thiss!1504)))))

(declare-fun c!38659 () Bool)

(assert (=> b!232482 (= c!38659 ((_ is MissingZero!970) lt!117370))))

(assert (=> b!232482 e!150982))

(declare-fun b!232483 () Bool)

(declare-fun e!150976 () Bool)

(assert (=> b!232483 (= e!150976 true)))

(declare-fun lt!117369 () Bool)

(declare-fun lt!117376 () LongMapFixedSize!3340)

(declare-datatypes ((tuple2!4564 0))(
  ( (tuple2!4565 (_1!2293 (_ BitVec 64)) (_2!2293 V!7817)) )
))
(declare-datatypes ((List!3501 0))(
  ( (Nil!3498) (Cons!3497 (h!4145 tuple2!4564) (t!8451 List!3501)) )
))
(declare-datatypes ((ListLongMap!3467 0))(
  ( (ListLongMap!3468 (toList!1749 List!3501)) )
))
(declare-fun contains!1620 (ListLongMap!3467 (_ BitVec 64)) Bool)

(declare-fun map!2558 (LongMapFixedSize!3340) ListLongMap!3467)

(assert (=> b!232483 (= lt!117369 (contains!1620 (map!2558 lt!117376) key!932))))

(declare-fun b!232484 () Bool)

(declare-fun e!150972 () Unit!7171)

(declare-fun Unit!7174 () Unit!7171)

(assert (=> b!232484 (= e!150972 Unit!7174)))

(declare-fun b!232485 () Bool)

(declare-fun res!114121 () Bool)

(assert (=> b!232485 (=> (not res!114121) (not e!150971))))

(assert (=> b!232485 (= res!114121 (= (select (arr!5464 (_keys!6382 thiss!1504)) (index!6050 lt!117370)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232486 () Bool)

(declare-fun e!150981 () Bool)

(declare-fun e!150975 () Bool)

(assert (=> b!232486 (= e!150981 (and e!150975 mapRes!10360))))

(declare-fun condMapEmpty!10360 () Bool)

(declare-fun mapDefault!10360 () ValueCell!2720)

(assert (=> b!232486 (= condMapEmpty!10360 (= (arr!5463 (_values!4312 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2720)) mapDefault!10360)))))

(declare-fun b!232487 () Bool)

(assert (=> b!232487 (= e!150974 e!150979)))

(declare-fun res!114120 () Bool)

(declare-fun call!21605 () Bool)

(assert (=> b!232487 (= res!114120 call!21605)))

(assert (=> b!232487 (=> (not res!114120) (not e!150979))))

(declare-fun bm!21602 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21602 (= call!21605 (inRange!0 (ite c!38659 (index!6050 lt!117370) (index!6053 lt!117370)) (mask!10244 thiss!1504)))))

(declare-fun res!114123 () Bool)

(assert (=> start!22202 (=> (not res!114123) (not e!150984))))

(declare-fun valid!1336 (LongMapFixedSize!3340) Bool)

(assert (=> start!22202 (= res!114123 (valid!1336 thiss!1504))))

(assert (=> start!22202 e!150984))

(declare-fun e!150970 () Bool)

(assert (=> start!22202 e!150970))

(assert (=> start!22202 true))

(assert (=> start!22202 tp_is_empty!6127))

(declare-fun b!232488 () Bool)

(declare-fun res!114118 () Bool)

(assert (=> b!232488 (=> (not res!114118) (not e!150971))))

(assert (=> b!232488 (= res!114118 call!21605)))

(assert (=> b!232488 (= e!150982 e!150971)))

(declare-fun mapNonEmpty!10360 () Bool)

(declare-fun tp!21937 () Bool)

(assert (=> mapNonEmpty!10360 (= mapRes!10360 (and tp!21937 e!150977))))

(declare-fun mapKey!10360 () (_ BitVec 32))

(declare-fun mapValue!10360 () ValueCell!2720)

(declare-fun mapRest!10360 () (Array (_ BitVec 32) ValueCell!2720))

(assert (=> mapNonEmpty!10360 (= (arr!5463 (_values!4312 thiss!1504)) (store mapRest!10360 mapKey!10360 mapValue!10360))))

(declare-fun array_inv!3605 (array!11491) Bool)

(declare-fun array_inv!3606 (array!11489) Bool)

(assert (=> b!232489 (= e!150970 (and tp!21936 tp_is_empty!6127 (array_inv!3605 (_keys!6382 thiss!1504)) (array_inv!3606 (_values!4312 thiss!1504)) e!150981))))

(declare-fun b!232490 () Bool)

(declare-fun e!150978 () Bool)

(declare-fun e!150983 () Bool)

(assert (=> b!232490 (= e!150978 e!150983)))

(declare-fun res!114122 () Bool)

(assert (=> b!232490 (=> (not res!114122) (not e!150983))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232490 (= res!114122 (inRange!0 index!297 (mask!10244 thiss!1504)))))

(declare-fun lt!117378 () Unit!7171)

(assert (=> b!232490 (= lt!117378 e!150980)))

(declare-fun c!38662 () Bool)

(declare-fun lt!117380 () ListLongMap!3467)

(assert (=> b!232490 (= c!38662 (contains!1620 lt!117380 key!932))))

(declare-fun getCurrentListMap!1258 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) Int) ListLongMap!3467)

(assert (=> b!232490 (= lt!117380 (getCurrentListMap!1258 (_keys!6382 thiss!1504) (_values!4312 thiss!1504) (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(declare-fun b!232491 () Bool)

(assert (=> b!232491 (= e!150983 (not e!150976))))

(declare-fun res!114117 () Bool)

(assert (=> b!232491 (=> res!114117 e!150976)))

(assert (=> b!232491 (= res!114117 (not (valid!1336 lt!117376)))))

(declare-fun lt!117385 () ListLongMap!3467)

(assert (=> b!232491 (contains!1620 lt!117385 key!932)))

(declare-fun lt!117383 () array!11489)

(declare-fun lt!117381 () Unit!7171)

(declare-fun lt!117377 () array!11491)

(declare-fun lemmaValidKeyInArrayIsInListMap!149 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) Int) Unit!7171)

(assert (=> b!232491 (= lt!117381 (lemmaValidKeyInArrayIsInListMap!149 lt!117377 lt!117383 (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) index!297 (defaultEntry!4329 thiss!1504)))))

(assert (=> b!232491 (= lt!117376 (LongMapFixedSize!3341 (defaultEntry!4329 thiss!1504) (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1719 thiss!1504)) lt!117377 lt!117383 (_vacant!1719 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11491 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232491 (= (arrayCountValidKeys!0 lt!117377 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117382 () Unit!7171)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11491 (_ BitVec 32)) Unit!7171)

(assert (=> b!232491 (= lt!117382 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117377 index!297))))

(assert (=> b!232491 (arrayContainsKey!0 lt!117377 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117373 () Unit!7171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11491 (_ BitVec 64) (_ BitVec 32)) Unit!7171)

(assert (=> b!232491 (= lt!117373 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117377 key!932 index!297))))

(declare-fun lt!117372 () ListLongMap!3467)

(assert (=> b!232491 (= lt!117372 lt!117385)))

(assert (=> b!232491 (= lt!117385 (getCurrentListMap!1258 lt!117377 lt!117383 (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(declare-fun v!346 () V!7817)

(declare-fun +!634 (ListLongMap!3467 tuple2!4564) ListLongMap!3467)

(assert (=> b!232491 (= lt!117372 (+!634 lt!117380 (tuple2!4565 key!932 v!346)))))

(assert (=> b!232491 (= lt!117383 (array!11490 (store (arr!5463 (_values!4312 thiss!1504)) index!297 (ValueCellFull!2720 v!346)) (size!5797 (_values!4312 thiss!1504))))))

(declare-fun lt!117387 () Unit!7171)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!89 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) (_ BitVec 64) V!7817 Int) Unit!7171)

(assert (=> b!232491 (= lt!117387 (lemmaAddValidKeyToArrayThenAddPairToListMap!89 (_keys!6382 thiss!1504) (_values!4312 thiss!1504) (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) index!297 key!932 v!346 (defaultEntry!4329 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11491 (_ BitVec 32)) Bool)

(assert (=> b!232491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117377 (mask!10244 thiss!1504))))

(declare-fun lt!117384 () Unit!7171)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11491 (_ BitVec 32) (_ BitVec 32)) Unit!7171)

(assert (=> b!232491 (= lt!117384 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6382 thiss!1504) index!297 (mask!10244 thiss!1504)))))

(assert (=> b!232491 (= (arrayCountValidKeys!0 lt!117377 #b00000000000000000000000000000000 (size!5798 (_keys!6382 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6382 thiss!1504) #b00000000000000000000000000000000 (size!5798 (_keys!6382 thiss!1504)))))))

(declare-fun lt!117375 () Unit!7171)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11491 (_ BitVec 32) (_ BitVec 64)) Unit!7171)

(assert (=> b!232491 (= lt!117375 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6382 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3502 0))(
  ( (Nil!3499) (Cons!3498 (h!4146 (_ BitVec 64)) (t!8452 List!3502)) )
))
(declare-fun arrayNoDuplicates!0 (array!11491 (_ BitVec 32) List!3502) Bool)

(assert (=> b!232491 (arrayNoDuplicates!0 lt!117377 #b00000000000000000000000000000000 Nil!3499)))

(assert (=> b!232491 (= lt!117377 (array!11492 (store (arr!5464 (_keys!6382 thiss!1504)) index!297 key!932) (size!5798 (_keys!6382 thiss!1504))))))

(declare-fun lt!117371 () Unit!7171)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3502) Unit!7171)

(assert (=> b!232491 (= lt!117371 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6382 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3499))))

(declare-fun lt!117374 () Unit!7171)

(assert (=> b!232491 (= lt!117374 e!150972)))

(declare-fun c!38661 () Bool)

(assert (=> b!232491 (= c!38661 (arrayContainsKey!0 (_keys!6382 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232492 () Bool)

(assert (=> b!232492 (= e!150975 tp_is_empty!6127)))

(declare-fun b!232493 () Bool)

(declare-fun Unit!7175 () Unit!7171)

(assert (=> b!232493 (= e!150972 Unit!7175)))

(declare-fun lt!117388 () Unit!7171)

(declare-fun lemmaArrayContainsKeyThenInListMap!156 (array!11491 array!11489 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 64) (_ BitVec 32) Int) Unit!7171)

(assert (=> b!232493 (= lt!117388 (lemmaArrayContainsKeyThenInListMap!156 (_keys!6382 thiss!1504) (_values!4312 thiss!1504) (mask!10244 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(assert (=> b!232493 false))

(declare-fun b!232494 () Bool)

(declare-fun res!114125 () Bool)

(assert (=> b!232494 (= res!114125 (= (select (arr!5464 (_keys!6382 thiss!1504)) (index!6053 lt!117370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232494 (=> (not res!114125) (not e!150979))))

(declare-fun b!232495 () Bool)

(assert (=> b!232495 (= e!150984 e!150978)))

(declare-fun res!114119 () Bool)

(assert (=> b!232495 (=> (not res!114119) (not e!150978))))

(assert (=> b!232495 (= res!114119 (or (= lt!117370 (MissingZero!970 index!297)) (= lt!117370 (MissingVacant!970 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11491 (_ BitVec 32)) SeekEntryResult!970)

(assert (=> b!232495 (= lt!117370 (seekEntryOrOpen!0 key!932 (_keys!6382 thiss!1504) (mask!10244 thiss!1504)))))

(assert (= (and start!22202 res!114123) b!232479))

(assert (= (and b!232479 res!114124) b!232495))

(assert (= (and b!232495 res!114119) b!232490))

(assert (= (and b!232490 c!38662) b!232475))

(assert (= (and b!232490 (not c!38662)) b!232482))

(assert (= (and b!232482 c!38659) b!232488))

(assert (= (and b!232482 (not c!38659)) b!232478))

(assert (= (and b!232488 res!114118) b!232485))

(assert (= (and b!232485 res!114121) b!232476))

(assert (= (and b!232478 c!38660) b!232487))

(assert (= (and b!232478 (not c!38660)) b!232477))

(assert (= (and b!232487 res!114120) b!232494))

(assert (= (and b!232494 res!114125) b!232480))

(assert (= (or b!232488 b!232487) bm!21602))

(assert (= (or b!232476 b!232480) bm!21603))

(assert (= (and b!232490 res!114122) b!232491))

(assert (= (and b!232491 c!38661) b!232493))

(assert (= (and b!232491 (not c!38661)) b!232484))

(assert (= (and b!232491 (not res!114117)) b!232483))

(assert (= (and b!232486 condMapEmpty!10360) mapIsEmpty!10360))

(assert (= (and b!232486 (not condMapEmpty!10360)) mapNonEmpty!10360))

(assert (= (and mapNonEmpty!10360 ((_ is ValueCellFull!2720) mapValue!10360)) b!232481))

(assert (= (and b!232486 ((_ is ValueCellFull!2720) mapDefault!10360)) b!232492))

(assert (= b!232489 b!232486))

(assert (= start!22202 b!232489))

(declare-fun m!253453 () Bool)

(assert (=> bm!21603 m!253453))

(declare-fun m!253455 () Bool)

(assert (=> b!232489 m!253455))

(declare-fun m!253457 () Bool)

(assert (=> b!232489 m!253457))

(declare-fun m!253459 () Bool)

(assert (=> b!232490 m!253459))

(declare-fun m!253461 () Bool)

(assert (=> b!232490 m!253461))

(declare-fun m!253463 () Bool)

(assert (=> b!232490 m!253463))

(declare-fun m!253465 () Bool)

(assert (=> b!232482 m!253465))

(declare-fun m!253467 () Bool)

(assert (=> bm!21602 m!253467))

(declare-fun m!253469 () Bool)

(assert (=> b!232475 m!253469))

(declare-fun m!253471 () Bool)

(assert (=> b!232483 m!253471))

(assert (=> b!232483 m!253471))

(declare-fun m!253473 () Bool)

(assert (=> b!232483 m!253473))

(declare-fun m!253475 () Bool)

(assert (=> mapNonEmpty!10360 m!253475))

(declare-fun m!253477 () Bool)

(assert (=> b!232485 m!253477))

(declare-fun m!253479 () Bool)

(assert (=> b!232494 m!253479))

(declare-fun m!253481 () Bool)

(assert (=> b!232491 m!253481))

(assert (=> b!232491 m!253453))

(declare-fun m!253483 () Bool)

(assert (=> b!232491 m!253483))

(declare-fun m!253485 () Bool)

(assert (=> b!232491 m!253485))

(declare-fun m!253487 () Bool)

(assert (=> b!232491 m!253487))

(declare-fun m!253489 () Bool)

(assert (=> b!232491 m!253489))

(declare-fun m!253491 () Bool)

(assert (=> b!232491 m!253491))

(declare-fun m!253493 () Bool)

(assert (=> b!232491 m!253493))

(declare-fun m!253495 () Bool)

(assert (=> b!232491 m!253495))

(declare-fun m!253497 () Bool)

(assert (=> b!232491 m!253497))

(declare-fun m!253499 () Bool)

(assert (=> b!232491 m!253499))

(declare-fun m!253501 () Bool)

(assert (=> b!232491 m!253501))

(declare-fun m!253503 () Bool)

(assert (=> b!232491 m!253503))

(declare-fun m!253505 () Bool)

(assert (=> b!232491 m!253505))

(declare-fun m!253507 () Bool)

(assert (=> b!232491 m!253507))

(declare-fun m!253509 () Bool)

(assert (=> b!232491 m!253509))

(declare-fun m!253511 () Bool)

(assert (=> b!232491 m!253511))

(declare-fun m!253513 () Bool)

(assert (=> b!232491 m!253513))

(declare-fun m!253515 () Bool)

(assert (=> b!232491 m!253515))

(declare-fun m!253517 () Bool)

(assert (=> b!232491 m!253517))

(declare-fun m!253519 () Bool)

(assert (=> b!232495 m!253519))

(declare-fun m!253521 () Bool)

(assert (=> start!22202 m!253521))

(declare-fun m!253523 () Bool)

(assert (=> b!232493 m!253523))

(check-sat (not b_next!6265) (not bm!21602) (not b!232493) (not start!22202) (not bm!21603) b_and!13137 (not b!232490) (not mapNonEmpty!10360) (not b!232491) (not b!232489) (not b!232483) (not b!232482) (not b!232475) (not b!232495) tp_is_empty!6127)
(check-sat b_and!13137 (not b_next!6265))
