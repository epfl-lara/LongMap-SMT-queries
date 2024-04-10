; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22176 () Bool)

(assert start!22176)

(declare-fun b!231968 () Bool)

(declare-fun b_free!6243 () Bool)

(declare-fun b_next!6243 () Bool)

(assert (=> b!231968 (= b_free!6243 (not b_next!6243))))

(declare-fun tp!21870 () Bool)

(declare-fun b_and!13141 () Bool)

(assert (=> b!231968 (= tp!21870 b_and!13141)))

(declare-fun b!231960 () Bool)

(declare-fun res!113950 () Bool)

(declare-fun e!150615 () Bool)

(assert (=> b!231960 (=> (not res!113950) (not e!150615))))

(declare-datatypes ((V!7787 0))(
  ( (V!7788 (val!3097 Int)) )
))
(declare-datatypes ((ValueCell!2709 0))(
  ( (ValueCellFull!2709 (v!5117 V!7787)) (EmptyCell!2709) )
))
(declare-datatypes ((array!11453 0))(
  ( (array!11454 (arr!5446 (Array (_ BitVec 32) ValueCell!2709)) (size!5779 (_ BitVec 32))) )
))
(declare-datatypes ((array!11455 0))(
  ( (array!11456 (arr!5447 (Array (_ BitVec 32) (_ BitVec 64))) (size!5780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3318 0))(
  ( (LongMapFixedSize!3319 (defaultEntry!4318 Int) (mask!10226 (_ BitVec 32)) (extraKeys!4055 (_ BitVec 32)) (zeroValue!4159 V!7787) (minValue!4159 V!7787) (_size!1708 (_ BitVec 32)) (_keys!6372 array!11455) (_values!4301 array!11453) (_vacant!1708 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3318)

(declare-datatypes ((SeekEntryResult!958 0))(
  ( (MissingZero!958 (index!6002 (_ BitVec 32))) (Found!958 (index!6003 (_ BitVec 32))) (Intermediate!958 (undefined!1770 Bool) (index!6004 (_ BitVec 32)) (x!23530 (_ BitVec 32))) (Undefined!958) (MissingVacant!958 (index!6005 (_ BitVec 32))) )
))
(declare-fun lt!117043 () SeekEntryResult!958)

(assert (=> b!231960 (= res!113950 (= (select (arr!5447 (_keys!6372 thiss!1504)) (index!6002 lt!117043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231961 () Bool)

(declare-fun e!150610 () Bool)

(get-info :version)

(assert (=> b!231961 (= e!150610 ((_ is Undefined!958) lt!117043))))

(declare-fun b!231962 () Bool)

(declare-fun res!113949 () Bool)

(assert (=> b!231962 (=> (not res!113949) (not e!150615))))

(declare-fun call!21563 () Bool)

(assert (=> b!231962 (= res!113949 call!21563)))

(declare-fun e!150612 () Bool)

(assert (=> b!231962 (= e!150612 e!150615)))

(declare-fun b!231963 () Bool)

(declare-fun e!150611 () Bool)

(declare-fun tp_is_empty!6105 () Bool)

(assert (=> b!231963 (= e!150611 tp_is_empty!6105)))

(declare-fun b!231964 () Bool)

(declare-fun e!150614 () Bool)

(assert (=> b!231964 (= e!150614 (not true))))

(declare-fun lt!117044 () array!11455)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11455 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231964 (= (arrayCountValidKeys!0 lt!117044 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7150 0))(
  ( (Unit!7151) )
))
(declare-fun lt!117042 () Unit!7150)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11455 (_ BitVec 32)) Unit!7150)

(assert (=> b!231964 (= lt!117042 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117044 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231964 (arrayContainsKey!0 lt!117044 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117031 () Unit!7150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11455 (_ BitVec 64) (_ BitVec 32)) Unit!7150)

(assert (=> b!231964 (= lt!117031 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117044 key!932 index!297))))

(declare-fun v!346 () V!7787)

(declare-datatypes ((tuple2!4570 0))(
  ( (tuple2!4571 (_1!2296 (_ BitVec 64)) (_2!2296 V!7787)) )
))
(declare-datatypes ((List!3488 0))(
  ( (Nil!3485) (Cons!3484 (h!4132 tuple2!4570) (t!8447 List!3488)) )
))
(declare-datatypes ((ListLongMap!3483 0))(
  ( (ListLongMap!3484 (toList!1757 List!3488)) )
))
(declare-fun lt!117034 () ListLongMap!3483)

(declare-fun +!620 (ListLongMap!3483 tuple2!4570) ListLongMap!3483)

(declare-fun getCurrentListMap!1285 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7787 V!7787 (_ BitVec 32) Int) ListLongMap!3483)

(assert (=> b!231964 (= (+!620 lt!117034 (tuple2!4571 key!932 v!346)) (getCurrentListMap!1285 lt!117044 (array!11454 (store (arr!5446 (_values!4301 thiss!1504)) index!297 (ValueCellFull!2709 v!346)) (size!5779 (_values!4301 thiss!1504))) (mask!10226 thiss!1504) (extraKeys!4055 thiss!1504) (zeroValue!4159 thiss!1504) (minValue!4159 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4318 thiss!1504)))))

(declare-fun lt!117036 () Unit!7150)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!74 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7787 V!7787 (_ BitVec 32) (_ BitVec 64) V!7787 Int) Unit!7150)

(assert (=> b!231964 (= lt!117036 (lemmaAddValidKeyToArrayThenAddPairToListMap!74 (_keys!6372 thiss!1504) (_values!4301 thiss!1504) (mask!10226 thiss!1504) (extraKeys!4055 thiss!1504) (zeroValue!4159 thiss!1504) (minValue!4159 thiss!1504) index!297 key!932 v!346 (defaultEntry!4318 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11455 (_ BitVec 32)) Bool)

(assert (=> b!231964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117044 (mask!10226 thiss!1504))))

(declare-fun lt!117039 () Unit!7150)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11455 (_ BitVec 32) (_ BitVec 32)) Unit!7150)

(assert (=> b!231964 (= lt!117039 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6372 thiss!1504) index!297 (mask!10226 thiss!1504)))))

(assert (=> b!231964 (= (arrayCountValidKeys!0 lt!117044 #b00000000000000000000000000000000 (size!5780 (_keys!6372 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6372 thiss!1504) #b00000000000000000000000000000000 (size!5780 (_keys!6372 thiss!1504)))))))

(declare-fun lt!117041 () Unit!7150)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11455 (_ BitVec 32) (_ BitVec 64)) Unit!7150)

(assert (=> b!231964 (= lt!117041 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6372 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3489 0))(
  ( (Nil!3486) (Cons!3485 (h!4133 (_ BitVec 64)) (t!8448 List!3489)) )
))
(declare-fun arrayNoDuplicates!0 (array!11455 (_ BitVec 32) List!3489) Bool)

(assert (=> b!231964 (arrayNoDuplicates!0 lt!117044 #b00000000000000000000000000000000 Nil!3486)))

(assert (=> b!231964 (= lt!117044 (array!11456 (store (arr!5447 (_keys!6372 thiss!1504)) index!297 key!932) (size!5780 (_keys!6372 thiss!1504))))))

(declare-fun lt!117037 () Unit!7150)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3489) Unit!7150)

(assert (=> b!231964 (= lt!117037 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6372 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3486))))

(declare-fun lt!117038 () Unit!7150)

(declare-fun e!150616 () Unit!7150)

(assert (=> b!231964 (= lt!117038 e!150616)))

(declare-fun c!38554 () Bool)

(assert (=> b!231964 (= c!38554 (arrayContainsKey!0 (_keys!6372 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231965 () Bool)

(declare-fun res!113953 () Bool)

(assert (=> b!231965 (= res!113953 (= (select (arr!5447 (_keys!6372 thiss!1504)) (index!6005 lt!117043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150613 () Bool)

(assert (=> b!231965 (=> (not res!113953) (not e!150613))))

(declare-fun b!231966 () Bool)

(declare-fun e!150617 () Unit!7150)

(declare-fun Unit!7152 () Unit!7150)

(assert (=> b!231966 (= e!150617 Unit!7152)))

(declare-fun lt!117032 () Unit!7150)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!306 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7787 V!7787 (_ BitVec 64) Int) Unit!7150)

(assert (=> b!231966 (= lt!117032 (lemmaInListMapThenSeekEntryOrOpenFindsIt!306 (_keys!6372 thiss!1504) (_values!4301 thiss!1504) (mask!10226 thiss!1504) (extraKeys!4055 thiss!1504) (zeroValue!4159 thiss!1504) (minValue!4159 thiss!1504) key!932 (defaultEntry!4318 thiss!1504)))))

(assert (=> b!231966 false))

(declare-fun mapNonEmpty!10327 () Bool)

(declare-fun mapRes!10327 () Bool)

(declare-fun tp!21871 () Bool)

(declare-fun e!150607 () Bool)

(assert (=> mapNonEmpty!10327 (= mapRes!10327 (and tp!21871 e!150607))))

(declare-fun mapKey!10327 () (_ BitVec 32))

(declare-fun mapRest!10327 () (Array (_ BitVec 32) ValueCell!2709))

(declare-fun mapValue!10327 () ValueCell!2709)

(assert (=> mapNonEmpty!10327 (= (arr!5446 (_values!4301 thiss!1504)) (store mapRest!10327 mapKey!10327 mapValue!10327))))

(declare-fun e!150618 () Bool)

(declare-fun e!150619 () Bool)

(declare-fun array_inv!3589 (array!11455) Bool)

(declare-fun array_inv!3590 (array!11453) Bool)

(assert (=> b!231968 (= e!150618 (and tp!21870 tp_is_empty!6105 (array_inv!3589 (_keys!6372 thiss!1504)) (array_inv!3590 (_values!4301 thiss!1504)) e!150619))))

(declare-fun b!231969 () Bool)

(declare-fun e!150620 () Bool)

(declare-fun e!150608 () Bool)

(assert (=> b!231969 (= e!150620 e!150608)))

(declare-fun res!113948 () Bool)

(assert (=> b!231969 (=> (not res!113948) (not e!150608))))

(assert (=> b!231969 (= res!113948 (or (= lt!117043 (MissingZero!958 index!297)) (= lt!117043 (MissingVacant!958 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11455 (_ BitVec 32)) SeekEntryResult!958)

(assert (=> b!231969 (= lt!117043 (seekEntryOrOpen!0 key!932 (_keys!6372 thiss!1504) (mask!10226 thiss!1504)))))

(declare-fun b!231970 () Bool)

(assert (=> b!231970 (= e!150610 e!150613)))

(declare-fun res!113946 () Bool)

(assert (=> b!231970 (= res!113946 call!21563)))

(assert (=> b!231970 (=> (not res!113946) (not e!150613))))

(declare-fun b!231971 () Bool)

(assert (=> b!231971 (= e!150619 (and e!150611 mapRes!10327))))

(declare-fun condMapEmpty!10327 () Bool)

(declare-fun mapDefault!10327 () ValueCell!2709)

(assert (=> b!231971 (= condMapEmpty!10327 (= (arr!5446 (_values!4301 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2709)) mapDefault!10327)))))

(declare-fun b!231972 () Bool)

(declare-fun lt!117035 () Unit!7150)

(assert (=> b!231972 (= e!150617 lt!117035)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!322 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7787 V!7787 (_ BitVec 64) Int) Unit!7150)

(assert (=> b!231972 (= lt!117035 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!322 (_keys!6372 thiss!1504) (_values!4301 thiss!1504) (mask!10226 thiss!1504) (extraKeys!4055 thiss!1504) (zeroValue!4159 thiss!1504) (minValue!4159 thiss!1504) key!932 (defaultEntry!4318 thiss!1504)))))

(declare-fun c!38555 () Bool)

(assert (=> b!231972 (= c!38555 ((_ is MissingZero!958) lt!117043))))

(assert (=> b!231972 e!150612))

(declare-fun b!231973 () Bool)

(declare-fun call!21564 () Bool)

(assert (=> b!231973 (= e!150615 (not call!21564))))

(declare-fun b!231974 () Bool)

(declare-fun Unit!7153 () Unit!7150)

(assert (=> b!231974 (= e!150616 Unit!7153)))

(declare-fun lt!117040 () Unit!7150)

(declare-fun lemmaArrayContainsKeyThenInListMap!141 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7787 V!7787 (_ BitVec 64) (_ BitVec 32) Int) Unit!7150)

(assert (=> b!231974 (= lt!117040 (lemmaArrayContainsKeyThenInListMap!141 (_keys!6372 thiss!1504) (_values!4301 thiss!1504) (mask!10226 thiss!1504) (extraKeys!4055 thiss!1504) (zeroValue!4159 thiss!1504) (minValue!4159 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4318 thiss!1504)))))

(assert (=> b!231974 false))

(declare-fun mapIsEmpty!10327 () Bool)

(assert (=> mapIsEmpty!10327 mapRes!10327))

(declare-fun b!231975 () Bool)

(assert (=> b!231975 (= e!150608 e!150614)))

(declare-fun res!113951 () Bool)

(assert (=> b!231975 (=> (not res!113951) (not e!150614))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231975 (= res!113951 (inRange!0 index!297 (mask!10226 thiss!1504)))))

(declare-fun lt!117033 () Unit!7150)

(assert (=> b!231975 (= lt!117033 e!150617)))

(declare-fun c!38553 () Bool)

(declare-fun contains!1626 (ListLongMap!3483 (_ BitVec 64)) Bool)

(assert (=> b!231975 (= c!38553 (contains!1626 lt!117034 key!932))))

(assert (=> b!231975 (= lt!117034 (getCurrentListMap!1285 (_keys!6372 thiss!1504) (_values!4301 thiss!1504) (mask!10226 thiss!1504) (extraKeys!4055 thiss!1504) (zeroValue!4159 thiss!1504) (minValue!4159 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4318 thiss!1504)))))

(declare-fun res!113952 () Bool)

(assert (=> start!22176 (=> (not res!113952) (not e!150620))))

(declare-fun valid!1315 (LongMapFixedSize!3318) Bool)

(assert (=> start!22176 (= res!113952 (valid!1315 thiss!1504))))

(assert (=> start!22176 e!150620))

(assert (=> start!22176 e!150618))

(assert (=> start!22176 true))

(assert (=> start!22176 tp_is_empty!6105))

(declare-fun b!231967 () Bool)

(assert (=> b!231967 (= e!150607 tp_is_empty!6105)))

(declare-fun b!231976 () Bool)

(declare-fun c!38556 () Bool)

(assert (=> b!231976 (= c!38556 ((_ is MissingVacant!958) lt!117043))))

(assert (=> b!231976 (= e!150612 e!150610)))

(declare-fun b!231977 () Bool)

(assert (=> b!231977 (= e!150613 (not call!21564))))

(declare-fun b!231978 () Bool)

(declare-fun res!113947 () Bool)

(assert (=> b!231978 (=> (not res!113947) (not e!150620))))

(assert (=> b!231978 (= res!113947 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231979 () Bool)

(declare-fun Unit!7154 () Unit!7150)

(assert (=> b!231979 (= e!150616 Unit!7154)))

(declare-fun bm!21560 () Bool)

(assert (=> bm!21560 (= call!21563 (inRange!0 (ite c!38555 (index!6002 lt!117043) (index!6005 lt!117043)) (mask!10226 thiss!1504)))))

(declare-fun bm!21561 () Bool)

(assert (=> bm!21561 (= call!21564 (arrayContainsKey!0 (_keys!6372 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!22176 res!113952) b!231978))

(assert (= (and b!231978 res!113947) b!231969))

(assert (= (and b!231969 res!113948) b!231975))

(assert (= (and b!231975 c!38553) b!231966))

(assert (= (and b!231975 (not c!38553)) b!231972))

(assert (= (and b!231972 c!38555) b!231962))

(assert (= (and b!231972 (not c!38555)) b!231976))

(assert (= (and b!231962 res!113949) b!231960))

(assert (= (and b!231960 res!113950) b!231973))

(assert (= (and b!231976 c!38556) b!231970))

(assert (= (and b!231976 (not c!38556)) b!231961))

(assert (= (and b!231970 res!113946) b!231965))

(assert (= (and b!231965 res!113953) b!231977))

(assert (= (or b!231962 b!231970) bm!21560))

(assert (= (or b!231973 b!231977) bm!21561))

(assert (= (and b!231975 res!113951) b!231964))

(assert (= (and b!231964 c!38554) b!231974))

(assert (= (and b!231964 (not c!38554)) b!231979))

(assert (= (and b!231971 condMapEmpty!10327) mapIsEmpty!10327))

(assert (= (and b!231971 (not condMapEmpty!10327)) mapNonEmpty!10327))

(assert (= (and mapNonEmpty!10327 ((_ is ValueCellFull!2709) mapValue!10327)) b!231967))

(assert (= (and b!231971 ((_ is ValueCellFull!2709) mapDefault!10327)) b!231963))

(assert (= b!231968 b!231971))

(assert (= start!22176 b!231968))

(declare-fun m!253369 () Bool)

(assert (=> b!231964 m!253369))

(declare-fun m!253371 () Bool)

(assert (=> b!231964 m!253371))

(declare-fun m!253373 () Bool)

(assert (=> b!231964 m!253373))

(declare-fun m!253375 () Bool)

(assert (=> b!231964 m!253375))

(declare-fun m!253377 () Bool)

(assert (=> b!231964 m!253377))

(declare-fun m!253379 () Bool)

(assert (=> b!231964 m!253379))

(declare-fun m!253381 () Bool)

(assert (=> b!231964 m!253381))

(declare-fun m!253383 () Bool)

(assert (=> b!231964 m!253383))

(declare-fun m!253385 () Bool)

(assert (=> b!231964 m!253385))

(declare-fun m!253387 () Bool)

(assert (=> b!231964 m!253387))

(declare-fun m!253389 () Bool)

(assert (=> b!231964 m!253389))

(declare-fun m!253391 () Bool)

(assert (=> b!231964 m!253391))

(declare-fun m!253393 () Bool)

(assert (=> b!231964 m!253393))

(declare-fun m!253395 () Bool)

(assert (=> b!231964 m!253395))

(declare-fun m!253397 () Bool)

(assert (=> b!231964 m!253397))

(declare-fun m!253399 () Bool)

(assert (=> b!231964 m!253399))

(declare-fun m!253401 () Bool)

(assert (=> b!231964 m!253401))

(declare-fun m!253403 () Bool)

(assert (=> b!231966 m!253403))

(declare-fun m!253405 () Bool)

(assert (=> b!231968 m!253405))

(declare-fun m!253407 () Bool)

(assert (=> b!231968 m!253407))

(declare-fun m!253409 () Bool)

(assert (=> b!231960 m!253409))

(declare-fun m!253411 () Bool)

(assert (=> start!22176 m!253411))

(declare-fun m!253413 () Bool)

(assert (=> bm!21560 m!253413))

(declare-fun m!253415 () Bool)

(assert (=> b!231974 m!253415))

(declare-fun m!253417 () Bool)

(assert (=> b!231969 m!253417))

(declare-fun m!253419 () Bool)

(assert (=> b!231975 m!253419))

(declare-fun m!253421 () Bool)

(assert (=> b!231975 m!253421))

(declare-fun m!253423 () Bool)

(assert (=> b!231975 m!253423))

(declare-fun m!253425 () Bool)

(assert (=> mapNonEmpty!10327 m!253425))

(declare-fun m!253427 () Bool)

(assert (=> b!231972 m!253427))

(assert (=> bm!21561 m!253371))

(declare-fun m!253429 () Bool)

(assert (=> b!231965 m!253429))

(check-sat (not b!231968) tp_is_empty!6105 (not b!231969) (not b!231972) (not b!231975) (not b!231964) (not bm!21561) (not mapNonEmpty!10327) (not b!231974) (not b_next!6243) (not bm!21560) (not start!22176) (not b!231966) b_and!13141)
(check-sat b_and!13141 (not b_next!6243))
