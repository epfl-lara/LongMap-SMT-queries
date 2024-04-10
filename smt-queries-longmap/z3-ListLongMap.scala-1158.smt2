; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24336 () Bool)

(assert start!24336)

(declare-fun b!255055 () Bool)

(declare-fun b_free!6699 () Bool)

(declare-fun b_next!6699 () Bool)

(assert (=> b!255055 (= b_free!6699 (not b_next!6699))))

(declare-fun tp!23387 () Bool)

(declare-fun b_and!13745 () Bool)

(assert (=> b!255055 (= tp!23387 b_and!13745)))

(declare-fun b!255040 () Bool)

(declare-fun res!124827 () Bool)

(declare-datatypes ((V!8395 0))(
  ( (V!8396 (val!3325 Int)) )
))
(declare-datatypes ((ValueCell!2937 0))(
  ( (ValueCellFull!2937 (v!5402 V!8395)) (EmptyCell!2937) )
))
(declare-datatypes ((array!12455 0))(
  ( (array!12456 (arr!5902 (Array (_ BitVec 32) ValueCell!2937)) (size!6249 (_ BitVec 32))) )
))
(declare-datatypes ((array!12457 0))(
  ( (array!12458 (arr!5903 (Array (_ BitVec 32) (_ BitVec 64))) (size!6250 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3774 0))(
  ( (LongMapFixedSize!3775 (defaultEntry!4705 Int) (mask!10959 (_ BitVec 32)) (extraKeys!4442 (_ BitVec 32)) (zeroValue!4546 V!8395) (minValue!4546 V!8395) (_size!1936 (_ BitVec 32)) (_keys!6861 array!12457) (_values!4688 array!12455) (_vacant!1936 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3774)

(declare-datatypes ((SeekEntryResult!1155 0))(
  ( (MissingZero!1155 (index!6790 (_ BitVec 32))) (Found!1155 (index!6791 (_ BitVec 32))) (Intermediate!1155 (undefined!1967 Bool) (index!6792 (_ BitVec 32)) (x!24897 (_ BitVec 32))) (Undefined!1155) (MissingVacant!1155 (index!6793 (_ BitVec 32))) )
))
(declare-fun lt!127873 () SeekEntryResult!1155)

(assert (=> b!255040 (= res!124827 (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6793 lt!127873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165326 () Bool)

(assert (=> b!255040 (=> (not res!124827) (not e!165326))))

(declare-fun b!255041 () Bool)

(declare-datatypes ((Unit!7914 0))(
  ( (Unit!7915) )
))
(declare-fun e!165323 () Unit!7914)

(declare-fun lt!127871 () Unit!7914)

(assert (=> b!255041 (= e!165323 lt!127871)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!425 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 64) Int) Unit!7914)

(assert (=> b!255041 (= lt!127871 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!425 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 (defaultEntry!4705 thiss!1504)))))

(declare-fun c!43039 () Bool)

(get-info :version)

(assert (=> b!255041 (= c!43039 ((_ is MissingZero!1155) lt!127873))))

(declare-fun e!165329 () Bool)

(assert (=> b!255041 e!165329))

(declare-fun b!255042 () Bool)

(declare-fun res!124826 () Bool)

(declare-fun e!165320 () Bool)

(assert (=> b!255042 (=> (not res!124826) (not e!165320))))

(assert (=> b!255042 (= res!124826 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!124828 () Bool)

(assert (=> start!24336 (=> (not res!124828) (not e!165320))))

(declare-fun valid!1475 (LongMapFixedSize!3774) Bool)

(assert (=> start!24336 (= res!124828 (valid!1475 thiss!1504))))

(assert (=> start!24336 e!165320))

(declare-fun e!165324 () Bool)

(assert (=> start!24336 e!165324))

(assert (=> start!24336 true))

(declare-fun tp_is_empty!6561 () Bool)

(assert (=> start!24336 tp_is_empty!6561))

(declare-fun mapIsEmpty!11160 () Bool)

(declare-fun mapRes!11160 () Bool)

(assert (=> mapIsEmpty!11160 mapRes!11160))

(declare-fun b!255043 () Bool)

(declare-fun e!165319 () Bool)

(assert (=> b!255043 (= e!165319 ((_ is Undefined!1155) lt!127873))))

(declare-fun b!255044 () Bool)

(assert (=> b!255044 (= e!165319 e!165326)))

(declare-fun res!124830 () Bool)

(declare-fun call!24086 () Bool)

(assert (=> b!255044 (= res!124830 call!24086)))

(assert (=> b!255044 (=> (not res!124830) (not e!165326))))

(declare-fun b!255045 () Bool)

(declare-fun e!165321 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255045 (= e!165321 (not (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4896 0))(
  ( (tuple2!4897 (_1!2459 (_ BitVec 64)) (_2!2459 V!8395)) )
))
(declare-datatypes ((List!3777 0))(
  ( (Nil!3774) (Cons!3773 (h!4435 tuple2!4896) (t!8826 List!3777)) )
))
(declare-datatypes ((ListLongMap!3809 0))(
  ( (ListLongMap!3810 (toList!1920 List!3777)) )
))
(declare-fun lt!127868 () ListLongMap!3809)

(declare-fun v!346 () V!8395)

(declare-fun lt!127869 () array!12457)

(declare-fun +!676 (ListLongMap!3809 tuple2!4896) ListLongMap!3809)

(declare-fun getCurrentListMap!1448 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 32) Int) ListLongMap!3809)

(assert (=> b!255045 (= (+!676 lt!127868 (tuple2!4897 key!932 v!346)) (getCurrentListMap!1448 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!127867 () Unit!7914)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!86 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 32) (_ BitVec 64) V!8395 Int) Unit!7914)

(assert (=> b!255045 (= lt!127867 (lemmaAddValidKeyToArrayThenAddPairToListMap!86 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) index!297 key!932 v!346 (defaultEntry!4705 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12457 (_ BitVec 32)) Bool)

(assert (=> b!255045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127869 (mask!10959 thiss!1504))))

(declare-fun lt!127862 () Unit!7914)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12457 (_ BitVec 32) (_ BitVec 32)) Unit!7914)

(assert (=> b!255045 (= lt!127862 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6861 thiss!1504) index!297 (mask!10959 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12457 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255045 (= (arrayCountValidKeys!0 lt!127869 #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6861 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504)))))))

(declare-fun lt!127872 () Unit!7914)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12457 (_ BitVec 32) (_ BitVec 64)) Unit!7914)

(assert (=> b!255045 (= lt!127872 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6861 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3778 0))(
  ( (Nil!3775) (Cons!3774 (h!4436 (_ BitVec 64)) (t!8827 List!3778)) )
))
(declare-fun arrayNoDuplicates!0 (array!12457 (_ BitVec 32) List!3778) Bool)

(assert (=> b!255045 (arrayNoDuplicates!0 lt!127869 #b00000000000000000000000000000000 Nil!3775)))

(assert (=> b!255045 (= lt!127869 (array!12458 (store (arr!5903 (_keys!6861 thiss!1504)) index!297 key!932) (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun lt!127866 () Unit!7914)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12457 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3778) Unit!7914)

(assert (=> b!255045 (= lt!127866 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6861 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3775))))

(declare-fun lt!127863 () Unit!7914)

(declare-fun e!165327 () Unit!7914)

(assert (=> b!255045 (= lt!127863 e!165327)))

(declare-fun c!43042 () Bool)

(declare-fun arrayContainsKey!0 (array!12457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255045 (= c!43042 (arrayContainsKey!0 (_keys!6861 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255046 () Bool)

(declare-fun e!165330 () Bool)

(assert (=> b!255046 (= e!165330 tp_is_empty!6561)))

(declare-fun b!255047 () Bool)

(declare-fun e!165322 () Bool)

(declare-fun call!24087 () Bool)

(assert (=> b!255047 (= e!165322 (not call!24087))))

(declare-fun b!255048 () Bool)

(declare-fun e!165318 () Bool)

(assert (=> b!255048 (= e!165318 e!165321)))

(declare-fun res!124831 () Bool)

(assert (=> b!255048 (=> (not res!124831) (not e!165321))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255048 (= res!124831 (inRange!0 index!297 (mask!10959 thiss!1504)))))

(declare-fun lt!127870 () Unit!7914)

(assert (=> b!255048 (= lt!127870 e!165323)))

(declare-fun c!43040 () Bool)

(declare-fun contains!1852 (ListLongMap!3809 (_ BitVec 64)) Bool)

(assert (=> b!255048 (= c!43040 (contains!1852 lt!127868 key!932))))

(assert (=> b!255048 (= lt!127868 (getCurrentListMap!1448 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun b!255049 () Bool)

(declare-fun res!124832 () Bool)

(assert (=> b!255049 (=> (not res!124832) (not e!165322))))

(assert (=> b!255049 (= res!124832 (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6790 lt!127873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255050 () Bool)

(assert (=> b!255050 (= e!165320 e!165318)))

(declare-fun res!124829 () Bool)

(assert (=> b!255050 (=> (not res!124829) (not e!165318))))

(assert (=> b!255050 (= res!124829 (or (= lt!127873 (MissingZero!1155 index!297)) (= lt!127873 (MissingVacant!1155 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12457 (_ BitVec 32)) SeekEntryResult!1155)

(assert (=> b!255050 (= lt!127873 (seekEntryOrOpen!0 key!932 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)))))

(declare-fun b!255051 () Bool)

(declare-fun Unit!7916 () Unit!7914)

(assert (=> b!255051 (= e!165327 Unit!7916)))

(declare-fun b!255052 () Bool)

(declare-fun Unit!7917 () Unit!7914)

(assert (=> b!255052 (= e!165327 Unit!7917)))

(declare-fun lt!127864 () Unit!7914)

(declare-fun lemmaArrayContainsKeyThenInListMap!228 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 64) (_ BitVec 32) Int) Unit!7914)

(assert (=> b!255052 (= lt!127864 (lemmaArrayContainsKeyThenInListMap!228 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(assert (=> b!255052 false))

(declare-fun b!255053 () Bool)

(declare-fun e!165331 () Bool)

(declare-fun e!165328 () Bool)

(assert (=> b!255053 (= e!165331 (and e!165328 mapRes!11160))))

(declare-fun condMapEmpty!11160 () Bool)

(declare-fun mapDefault!11160 () ValueCell!2937)

(assert (=> b!255053 (= condMapEmpty!11160 (= (arr!5902 (_values!4688 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2937)) mapDefault!11160)))))

(declare-fun b!255054 () Bool)

(declare-fun c!43041 () Bool)

(assert (=> b!255054 (= c!43041 ((_ is MissingVacant!1155) lt!127873))))

(assert (=> b!255054 (= e!165329 e!165319)))

(declare-fun bm!24083 () Bool)

(assert (=> bm!24083 (= call!24086 (inRange!0 (ite c!43039 (index!6790 lt!127873) (index!6793 lt!127873)) (mask!10959 thiss!1504)))))

(declare-fun bm!24084 () Bool)

(assert (=> bm!24084 (= call!24087 (arrayContainsKey!0 (_keys!6861 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3903 (array!12457) Bool)

(declare-fun array_inv!3904 (array!12455) Bool)

(assert (=> b!255055 (= e!165324 (and tp!23387 tp_is_empty!6561 (array_inv!3903 (_keys!6861 thiss!1504)) (array_inv!3904 (_values!4688 thiss!1504)) e!165331))))

(declare-fun b!255056 () Bool)

(declare-fun res!124833 () Bool)

(assert (=> b!255056 (=> (not res!124833) (not e!165322))))

(assert (=> b!255056 (= res!124833 call!24086)))

(assert (=> b!255056 (= e!165329 e!165322)))

(declare-fun mapNonEmpty!11160 () Bool)

(declare-fun tp!23388 () Bool)

(assert (=> mapNonEmpty!11160 (= mapRes!11160 (and tp!23388 e!165330))))

(declare-fun mapRest!11160 () (Array (_ BitVec 32) ValueCell!2937))

(declare-fun mapValue!11160 () ValueCell!2937)

(declare-fun mapKey!11160 () (_ BitVec 32))

(assert (=> mapNonEmpty!11160 (= (arr!5902 (_values!4688 thiss!1504)) (store mapRest!11160 mapKey!11160 mapValue!11160))))

(declare-fun b!255057 () Bool)

(assert (=> b!255057 (= e!165328 tp_is_empty!6561)))

(declare-fun b!255058 () Bool)

(declare-fun Unit!7918 () Unit!7914)

(assert (=> b!255058 (= e!165323 Unit!7918)))

(declare-fun lt!127865 () Unit!7914)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!422 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 64) Int) Unit!7914)

(assert (=> b!255058 (= lt!127865 (lemmaInListMapThenSeekEntryOrOpenFindsIt!422 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 (defaultEntry!4705 thiss!1504)))))

(assert (=> b!255058 false))

(declare-fun b!255059 () Bool)

(assert (=> b!255059 (= e!165326 (not call!24087))))

(assert (= (and start!24336 res!124828) b!255042))

(assert (= (and b!255042 res!124826) b!255050))

(assert (= (and b!255050 res!124829) b!255048))

(assert (= (and b!255048 c!43040) b!255058))

(assert (= (and b!255048 (not c!43040)) b!255041))

(assert (= (and b!255041 c!43039) b!255056))

(assert (= (and b!255041 (not c!43039)) b!255054))

(assert (= (and b!255056 res!124833) b!255049))

(assert (= (and b!255049 res!124832) b!255047))

(assert (= (and b!255054 c!43041) b!255044))

(assert (= (and b!255054 (not c!43041)) b!255043))

(assert (= (and b!255044 res!124830) b!255040))

(assert (= (and b!255040 res!124827) b!255059))

(assert (= (or b!255056 b!255044) bm!24083))

(assert (= (or b!255047 b!255059) bm!24084))

(assert (= (and b!255048 res!124831) b!255045))

(assert (= (and b!255045 c!43042) b!255052))

(assert (= (and b!255045 (not c!43042)) b!255051))

(assert (= (and b!255053 condMapEmpty!11160) mapIsEmpty!11160))

(assert (= (and b!255053 (not condMapEmpty!11160)) mapNonEmpty!11160))

(assert (= (and mapNonEmpty!11160 ((_ is ValueCellFull!2937) mapValue!11160)) b!255046))

(assert (= (and b!255053 ((_ is ValueCellFull!2937) mapDefault!11160)) b!255057))

(assert (= b!255055 b!255053))

(assert (= start!24336 b!255055))

(declare-fun m!270539 () Bool)

(assert (=> bm!24083 m!270539))

(declare-fun m!270541 () Bool)

(assert (=> mapNonEmpty!11160 m!270541))

(declare-fun m!270543 () Bool)

(assert (=> b!255050 m!270543))

(declare-fun m!270545 () Bool)

(assert (=> start!24336 m!270545))

(declare-fun m!270547 () Bool)

(assert (=> b!255055 m!270547))

(declare-fun m!270549 () Bool)

(assert (=> b!255055 m!270549))

(declare-fun m!270551 () Bool)

(assert (=> b!255041 m!270551))

(declare-fun m!270553 () Bool)

(assert (=> b!255052 m!270553))

(declare-fun m!270555 () Bool)

(assert (=> b!255058 m!270555))

(declare-fun m!270557 () Bool)

(assert (=> b!255040 m!270557))

(declare-fun m!270559 () Bool)

(assert (=> bm!24084 m!270559))

(declare-fun m!270561 () Bool)

(assert (=> b!255049 m!270561))

(declare-fun m!270563 () Bool)

(assert (=> b!255048 m!270563))

(declare-fun m!270565 () Bool)

(assert (=> b!255048 m!270565))

(declare-fun m!270567 () Bool)

(assert (=> b!255048 m!270567))

(assert (=> b!255045 m!270559))

(declare-fun m!270569 () Bool)

(assert (=> b!255045 m!270569))

(declare-fun m!270571 () Bool)

(assert (=> b!255045 m!270571))

(declare-fun m!270573 () Bool)

(assert (=> b!255045 m!270573))

(declare-fun m!270575 () Bool)

(assert (=> b!255045 m!270575))

(declare-fun m!270577 () Bool)

(assert (=> b!255045 m!270577))

(declare-fun m!270579 () Bool)

(assert (=> b!255045 m!270579))

(declare-fun m!270581 () Bool)

(assert (=> b!255045 m!270581))

(declare-fun m!270583 () Bool)

(assert (=> b!255045 m!270583))

(declare-fun m!270585 () Bool)

(assert (=> b!255045 m!270585))

(declare-fun m!270587 () Bool)

(assert (=> b!255045 m!270587))

(declare-fun m!270589 () Bool)

(assert (=> b!255045 m!270589))

(declare-fun m!270591 () Bool)

(assert (=> b!255045 m!270591))

(check-sat b_and!13745 (not b!255055) (not b!255045) (not b_next!6699) (not b!255058) (not bm!24083) tp_is_empty!6561 (not b!255052) (not mapNonEmpty!11160) (not bm!24084) (not b!255041) (not b!255048) (not b!255050) (not start!24336))
(check-sat b_and!13745 (not b_next!6699))
(get-model)

(declare-fun d!61531 () Bool)

(assert (=> d!61531 (= (inRange!0 (ite c!43039 (index!6790 lt!127873) (index!6793 lt!127873)) (mask!10959 thiss!1504)) (and (bvsge (ite c!43039 (index!6790 lt!127873) (index!6793 lt!127873)) #b00000000000000000000000000000000) (bvslt (ite c!43039 (index!6790 lt!127873) (index!6793 lt!127873)) (bvadd (mask!10959 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24083 d!61531))

(declare-fun lt!127918 () SeekEntryResult!1155)

(declare-fun e!165381 () SeekEntryResult!1155)

(declare-fun b!255132 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12457 (_ BitVec 32)) SeekEntryResult!1155)

(assert (=> b!255132 (= e!165381 (seekKeyOrZeroReturnVacant!0 (x!24897 lt!127918) (index!6792 lt!127918) (index!6792 lt!127918) key!932 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)))))

(declare-fun b!255133 () Bool)

(declare-fun e!165382 () SeekEntryResult!1155)

(assert (=> b!255133 (= e!165382 (Found!1155 (index!6792 lt!127918)))))

(declare-fun d!61533 () Bool)

(declare-fun lt!127916 () SeekEntryResult!1155)

(assert (=> d!61533 (and (or ((_ is Undefined!1155) lt!127916) (not ((_ is Found!1155) lt!127916)) (and (bvsge (index!6791 lt!127916) #b00000000000000000000000000000000) (bvslt (index!6791 lt!127916) (size!6250 (_keys!6861 thiss!1504))))) (or ((_ is Undefined!1155) lt!127916) ((_ is Found!1155) lt!127916) (not ((_ is MissingZero!1155) lt!127916)) (and (bvsge (index!6790 lt!127916) #b00000000000000000000000000000000) (bvslt (index!6790 lt!127916) (size!6250 (_keys!6861 thiss!1504))))) (or ((_ is Undefined!1155) lt!127916) ((_ is Found!1155) lt!127916) ((_ is MissingZero!1155) lt!127916) (not ((_ is MissingVacant!1155) lt!127916)) (and (bvsge (index!6793 lt!127916) #b00000000000000000000000000000000) (bvslt (index!6793 lt!127916) (size!6250 (_keys!6861 thiss!1504))))) (or ((_ is Undefined!1155) lt!127916) (ite ((_ is Found!1155) lt!127916) (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6791 lt!127916)) key!932) (ite ((_ is MissingZero!1155) lt!127916) (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6790 lt!127916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1155) lt!127916) (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6793 lt!127916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!165380 () SeekEntryResult!1155)

(assert (=> d!61533 (= lt!127916 e!165380)))

(declare-fun c!43061 () Bool)

(assert (=> d!61533 (= c!43061 (and ((_ is Intermediate!1155) lt!127918) (undefined!1967 lt!127918)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12457 (_ BitVec 32)) SeekEntryResult!1155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61533 (= lt!127918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10959 thiss!1504)) key!932 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61533 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61533 (= (seekEntryOrOpen!0 key!932 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)) lt!127916)))

(declare-fun b!255134 () Bool)

(assert (=> b!255134 (= e!165381 (MissingZero!1155 (index!6792 lt!127918)))))

(declare-fun b!255135 () Bool)

(assert (=> b!255135 (= e!165380 Undefined!1155)))

(declare-fun b!255136 () Bool)

(assert (=> b!255136 (= e!165380 e!165382)))

(declare-fun lt!127917 () (_ BitVec 64))

(assert (=> b!255136 (= lt!127917 (select (arr!5903 (_keys!6861 thiss!1504)) (index!6792 lt!127918)))))

(declare-fun c!43063 () Bool)

(assert (=> b!255136 (= c!43063 (= lt!127917 key!932))))

(declare-fun b!255137 () Bool)

(declare-fun c!43062 () Bool)

(assert (=> b!255137 (= c!43062 (= lt!127917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255137 (= e!165382 e!165381)))

(assert (= (and d!61533 c!43061) b!255135))

(assert (= (and d!61533 (not c!43061)) b!255136))

(assert (= (and b!255136 c!43063) b!255133))

(assert (= (and b!255136 (not c!43063)) b!255137))

(assert (= (and b!255137 c!43062) b!255134))

(assert (= (and b!255137 (not c!43062)) b!255132))

(declare-fun m!270647 () Bool)

(assert (=> b!255132 m!270647))

(declare-fun m!270649 () Bool)

(assert (=> d!61533 m!270649))

(declare-fun m!270651 () Bool)

(assert (=> d!61533 m!270651))

(declare-fun m!270653 () Bool)

(assert (=> d!61533 m!270653))

(declare-fun m!270655 () Bool)

(assert (=> d!61533 m!270655))

(assert (=> d!61533 m!270655))

(declare-fun m!270657 () Bool)

(assert (=> d!61533 m!270657))

(declare-fun m!270659 () Bool)

(assert (=> d!61533 m!270659))

(declare-fun m!270661 () Bool)

(assert (=> b!255136 m!270661))

(assert (=> b!255050 d!61533))

(declare-fun d!61535 () Bool)

(assert (=> d!61535 (= (inRange!0 index!297 (mask!10959 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10959 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255048 d!61535))

(declare-fun d!61537 () Bool)

(declare-fun e!165388 () Bool)

(assert (=> d!61537 e!165388))

(declare-fun res!124860 () Bool)

(assert (=> d!61537 (=> res!124860 e!165388)))

(declare-fun lt!127927 () Bool)

(assert (=> d!61537 (= res!124860 (not lt!127927))))

(declare-fun lt!127930 () Bool)

(assert (=> d!61537 (= lt!127927 lt!127930)))

(declare-fun lt!127929 () Unit!7914)

(declare-fun e!165387 () Unit!7914)

(assert (=> d!61537 (= lt!127929 e!165387)))

(declare-fun c!43066 () Bool)

(assert (=> d!61537 (= c!43066 lt!127930)))

(declare-fun containsKey!298 (List!3777 (_ BitVec 64)) Bool)

(assert (=> d!61537 (= lt!127930 (containsKey!298 (toList!1920 lt!127868) key!932))))

(assert (=> d!61537 (= (contains!1852 lt!127868 key!932) lt!127927)))

(declare-fun b!255144 () Bool)

(declare-fun lt!127928 () Unit!7914)

(assert (=> b!255144 (= e!165387 lt!127928)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!246 (List!3777 (_ BitVec 64)) Unit!7914)

(assert (=> b!255144 (= lt!127928 (lemmaContainsKeyImpliesGetValueByKeyDefined!246 (toList!1920 lt!127868) key!932))))

(declare-datatypes ((Option!312 0))(
  ( (Some!311 (v!5406 V!8395)) (None!310) )
))
(declare-fun isDefined!247 (Option!312) Bool)

(declare-fun getValueByKey!306 (List!3777 (_ BitVec 64)) Option!312)

(assert (=> b!255144 (isDefined!247 (getValueByKey!306 (toList!1920 lt!127868) key!932))))

(declare-fun b!255145 () Bool)

(declare-fun Unit!7922 () Unit!7914)

(assert (=> b!255145 (= e!165387 Unit!7922)))

(declare-fun b!255146 () Bool)

(assert (=> b!255146 (= e!165388 (isDefined!247 (getValueByKey!306 (toList!1920 lt!127868) key!932)))))

(assert (= (and d!61537 c!43066) b!255144))

(assert (= (and d!61537 (not c!43066)) b!255145))

(assert (= (and d!61537 (not res!124860)) b!255146))

(declare-fun m!270663 () Bool)

(assert (=> d!61537 m!270663))

(declare-fun m!270665 () Bool)

(assert (=> b!255144 m!270665))

(declare-fun m!270667 () Bool)

(assert (=> b!255144 m!270667))

(assert (=> b!255144 m!270667))

(declare-fun m!270669 () Bool)

(assert (=> b!255144 m!270669))

(assert (=> b!255146 m!270667))

(assert (=> b!255146 m!270667))

(assert (=> b!255146 m!270669))

(assert (=> b!255048 d!61537))

(declare-fun bm!24105 () Bool)

(declare-fun call!24111 () ListLongMap!3809)

(declare-fun call!24109 () ListLongMap!3809)

(assert (=> bm!24105 (= call!24111 call!24109)))

(declare-fun b!255189 () Bool)

(declare-fun e!165415 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255189 (= e!165415 (validKeyInArray!0 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255190 () Bool)

(declare-fun e!165416 () ListLongMap!3809)

(declare-fun call!24108 () ListLongMap!3809)

(assert (=> b!255190 (= e!165416 call!24108)))

(declare-fun b!255191 () Bool)

(declare-fun e!165423 () Bool)

(assert (=> b!255191 (= e!165423 (validKeyInArray!0 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24106 () Bool)

(declare-fun call!24110 () Bool)

(declare-fun lt!127996 () ListLongMap!3809)

(assert (=> bm!24106 (= call!24110 (contains!1852 lt!127996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24107 () Bool)

(declare-fun call!24112 () ListLongMap!3809)

(assert (=> bm!24107 (= call!24109 call!24112)))

(declare-fun b!255192 () Bool)

(declare-fun c!43084 () Bool)

(assert (=> b!255192 (= c!43084 (and (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!165427 () ListLongMap!3809)

(assert (=> b!255192 (= e!165416 e!165427)))

(declare-fun b!255193 () Bool)

(declare-fun e!165420 () ListLongMap!3809)

(assert (=> b!255193 (= e!165420 e!165416)))

(declare-fun c!43081 () Bool)

(assert (=> b!255193 (= c!43081 (and (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255194 () Bool)

(declare-fun e!165424 () Bool)

(declare-fun apply!248 (ListLongMap!3809 (_ BitVec 64)) V!8395)

(assert (=> b!255194 (= e!165424 (= (apply!248 lt!127996 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4546 thiss!1504)))))

(declare-fun b!255195 () Bool)

(declare-fun e!165421 () Bool)

(declare-fun get!3035 (ValueCell!2937 V!8395) V!8395)

(declare-fun dynLambda!591 (Int (_ BitVec 64)) V!8395)

(assert (=> b!255195 (= e!165421 (= (apply!248 lt!127996 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000)) (get!3035 (select (arr!5902 (_values!4688 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!591 (defaultEntry!4705 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6249 (_values!4688 thiss!1504))))))

(assert (=> b!255195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun b!255196 () Bool)

(declare-fun e!165417 () Bool)

(assert (=> b!255196 (= e!165417 (= (apply!248 lt!127996 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4546 thiss!1504)))))

(declare-fun b!255197 () Bool)

(declare-fun e!165426 () Bool)

(assert (=> b!255197 (= e!165426 (not call!24110))))

(declare-fun b!255199 () Bool)

(assert (=> b!255199 (= e!165426 e!165424)))

(declare-fun res!124885 () Bool)

(assert (=> b!255199 (= res!124885 call!24110)))

(assert (=> b!255199 (=> (not res!124885) (not e!165424))))

(declare-fun b!255200 () Bool)

(declare-fun e!165419 () Bool)

(declare-fun e!165422 () Bool)

(assert (=> b!255200 (= e!165419 e!165422)))

(declare-fun c!43079 () Bool)

(assert (=> b!255200 (= c!43079 (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24108 () Bool)

(declare-fun call!24113 () ListLongMap!3809)

(assert (=> bm!24108 (= call!24108 call!24113)))

(declare-fun b!255201 () Bool)

(declare-fun res!124886 () Bool)

(assert (=> b!255201 (=> (not res!124886) (not e!165419))))

(assert (=> b!255201 (= res!124886 e!165426)))

(declare-fun c!43080 () Bool)

(assert (=> b!255201 (= c!43080 (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255202 () Bool)

(assert (=> b!255202 (= e!165422 e!165417)))

(declare-fun res!124879 () Bool)

(declare-fun call!24114 () Bool)

(assert (=> b!255202 (= res!124879 call!24114)))

(assert (=> b!255202 (=> (not res!124879) (not e!165417))))

(declare-fun b!255203 () Bool)

(declare-fun e!165425 () Unit!7914)

(declare-fun lt!127977 () Unit!7914)

(assert (=> b!255203 (= e!165425 lt!127977)))

(declare-fun lt!127980 () ListLongMap!3809)

(declare-fun getCurrentListMapNoExtraKeys!570 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 32) Int) ListLongMap!3809)

(assert (=> b!255203 (= lt!127980 (getCurrentListMapNoExtraKeys!570 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!127987 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127975 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127975 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127979 () Unit!7914)

(declare-fun addStillContains!224 (ListLongMap!3809 (_ BitVec 64) V!8395 (_ BitVec 64)) Unit!7914)

(assert (=> b!255203 (= lt!127979 (addStillContains!224 lt!127980 lt!127987 (zeroValue!4546 thiss!1504) lt!127975))))

(assert (=> b!255203 (contains!1852 (+!676 lt!127980 (tuple2!4897 lt!127987 (zeroValue!4546 thiss!1504))) lt!127975)))

(declare-fun lt!127993 () Unit!7914)

(assert (=> b!255203 (= lt!127993 lt!127979)))

(declare-fun lt!127990 () ListLongMap!3809)

(assert (=> b!255203 (= lt!127990 (getCurrentListMapNoExtraKeys!570 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!127983 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127991 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127991 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127988 () Unit!7914)

(declare-fun addApplyDifferent!224 (ListLongMap!3809 (_ BitVec 64) V!8395 (_ BitVec 64)) Unit!7914)

(assert (=> b!255203 (= lt!127988 (addApplyDifferent!224 lt!127990 lt!127983 (minValue!4546 thiss!1504) lt!127991))))

(assert (=> b!255203 (= (apply!248 (+!676 lt!127990 (tuple2!4897 lt!127983 (minValue!4546 thiss!1504))) lt!127991) (apply!248 lt!127990 lt!127991))))

(declare-fun lt!127984 () Unit!7914)

(assert (=> b!255203 (= lt!127984 lt!127988)))

(declare-fun lt!127985 () ListLongMap!3809)

(assert (=> b!255203 (= lt!127985 (getCurrentListMapNoExtraKeys!570 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!127981 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127986 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127986 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127995 () Unit!7914)

(assert (=> b!255203 (= lt!127995 (addApplyDifferent!224 lt!127985 lt!127981 (zeroValue!4546 thiss!1504) lt!127986))))

(assert (=> b!255203 (= (apply!248 (+!676 lt!127985 (tuple2!4897 lt!127981 (zeroValue!4546 thiss!1504))) lt!127986) (apply!248 lt!127985 lt!127986))))

(declare-fun lt!127992 () Unit!7914)

(assert (=> b!255203 (= lt!127992 lt!127995)))

(declare-fun lt!127978 () ListLongMap!3809)

(assert (=> b!255203 (= lt!127978 (getCurrentListMapNoExtraKeys!570 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!127976 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127976 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127989 () (_ BitVec 64))

(assert (=> b!255203 (= lt!127989 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255203 (= lt!127977 (addApplyDifferent!224 lt!127978 lt!127976 (minValue!4546 thiss!1504) lt!127989))))

(assert (=> b!255203 (= (apply!248 (+!676 lt!127978 (tuple2!4897 lt!127976 (minValue!4546 thiss!1504))) lt!127989) (apply!248 lt!127978 lt!127989))))

(declare-fun bm!24109 () Bool)

(declare-fun c!43082 () Bool)

(assert (=> bm!24109 (= call!24113 (+!676 (ite c!43082 call!24112 (ite c!43081 call!24109 call!24111)) (ite (or c!43082 c!43081) (tuple2!4897 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4546 thiss!1504)) (tuple2!4897 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4546 thiss!1504)))))))

(declare-fun b!255204 () Bool)

(assert (=> b!255204 (= e!165427 call!24108)))

(declare-fun bm!24110 () Bool)

(assert (=> bm!24110 (= call!24114 (contains!1852 lt!127996 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255205 () Bool)

(declare-fun e!165418 () Bool)

(assert (=> b!255205 (= e!165418 e!165421)))

(declare-fun res!124881 () Bool)

(assert (=> b!255205 (=> (not res!124881) (not e!165421))))

(assert (=> b!255205 (= res!124881 (contains!1852 lt!127996 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun bm!24111 () Bool)

(assert (=> bm!24111 (= call!24112 (getCurrentListMapNoExtraKeys!570 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun b!255206 () Bool)

(assert (=> b!255206 (= e!165420 (+!676 call!24113 (tuple2!4897 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4546 thiss!1504))))))

(declare-fun b!255207 () Bool)

(assert (=> b!255207 (= e!165422 (not call!24114))))

(declare-fun b!255208 () Bool)

(declare-fun res!124880 () Bool)

(assert (=> b!255208 (=> (not res!124880) (not e!165419))))

(assert (=> b!255208 (= res!124880 e!165418)))

(declare-fun res!124882 () Bool)

(assert (=> b!255208 (=> res!124882 e!165418)))

(assert (=> b!255208 (= res!124882 (not e!165415))))

(declare-fun res!124883 () Bool)

(assert (=> b!255208 (=> (not res!124883) (not e!165415))))

(assert (=> b!255208 (= res!124883 (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun b!255209 () Bool)

(declare-fun Unit!7923 () Unit!7914)

(assert (=> b!255209 (= e!165425 Unit!7923)))

(declare-fun d!61539 () Bool)

(assert (=> d!61539 e!165419))

(declare-fun res!124884 () Bool)

(assert (=> d!61539 (=> (not res!124884) (not e!165419))))

(assert (=> d!61539 (= res!124884 (or (bvsge #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))))

(declare-fun lt!127982 () ListLongMap!3809)

(assert (=> d!61539 (= lt!127996 lt!127982)))

(declare-fun lt!127994 () Unit!7914)

(assert (=> d!61539 (= lt!127994 e!165425)))

(declare-fun c!43083 () Bool)

(assert (=> d!61539 (= c!43083 e!165423)))

(declare-fun res!124887 () Bool)

(assert (=> d!61539 (=> (not res!124887) (not e!165423))))

(assert (=> d!61539 (= res!124887 (bvslt #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))

(assert (=> d!61539 (= lt!127982 e!165420)))

(assert (=> d!61539 (= c!43082 (and (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61539 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61539 (= (getCurrentListMap!1448 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)) lt!127996)))

(declare-fun b!255198 () Bool)

(assert (=> b!255198 (= e!165427 call!24111)))

(assert (= (and d!61539 c!43082) b!255206))

(assert (= (and d!61539 (not c!43082)) b!255193))

(assert (= (and b!255193 c!43081) b!255190))

(assert (= (and b!255193 (not c!43081)) b!255192))

(assert (= (and b!255192 c!43084) b!255204))

(assert (= (and b!255192 (not c!43084)) b!255198))

(assert (= (or b!255204 b!255198) bm!24105))

(assert (= (or b!255190 bm!24105) bm!24107))

(assert (= (or b!255190 b!255204) bm!24108))

(assert (= (or b!255206 bm!24107) bm!24111))

(assert (= (or b!255206 bm!24108) bm!24109))

(assert (= (and d!61539 res!124887) b!255191))

(assert (= (and d!61539 c!43083) b!255203))

(assert (= (and d!61539 (not c!43083)) b!255209))

(assert (= (and d!61539 res!124884) b!255208))

(assert (= (and b!255208 res!124883) b!255189))

(assert (= (and b!255208 (not res!124882)) b!255205))

(assert (= (and b!255205 res!124881) b!255195))

(assert (= (and b!255208 res!124880) b!255201))

(assert (= (and b!255201 c!43080) b!255199))

(assert (= (and b!255201 (not c!43080)) b!255197))

(assert (= (and b!255199 res!124885) b!255194))

(assert (= (or b!255199 b!255197) bm!24106))

(assert (= (and b!255201 res!124886) b!255200))

(assert (= (and b!255200 c!43079) b!255202))

(assert (= (and b!255200 (not c!43079)) b!255207))

(assert (= (and b!255202 res!124879) b!255196))

(assert (= (or b!255202 b!255207) bm!24110))

(declare-fun b_lambda!8139 () Bool)

(assert (=> (not b_lambda!8139) (not b!255195)))

(declare-fun t!8830 () Bool)

(declare-fun tb!3009 () Bool)

(assert (=> (and b!255055 (= (defaultEntry!4705 thiss!1504) (defaultEntry!4705 thiss!1504)) t!8830) tb!3009))

(declare-fun result!5349 () Bool)

(assert (=> tb!3009 (= result!5349 tp_is_empty!6561)))

(assert (=> b!255195 t!8830))

(declare-fun b_and!13749 () Bool)

(assert (= b_and!13745 (and (=> t!8830 result!5349) b_and!13749)))

(declare-fun m!270671 () Bool)

(assert (=> b!255195 m!270671))

(declare-fun m!270673 () Bool)

(assert (=> b!255195 m!270673))

(declare-fun m!270675 () Bool)

(assert (=> b!255195 m!270675))

(declare-fun m!270677 () Bool)

(assert (=> b!255195 m!270677))

(assert (=> b!255195 m!270671))

(assert (=> b!255195 m!270675))

(assert (=> b!255195 m!270677))

(declare-fun m!270679 () Bool)

(assert (=> b!255195 m!270679))

(declare-fun m!270681 () Bool)

(assert (=> b!255194 m!270681))

(declare-fun m!270683 () Bool)

(assert (=> b!255206 m!270683))

(declare-fun m!270685 () Bool)

(assert (=> bm!24109 m!270685))

(assert (=> b!255191 m!270671))

(assert (=> b!255191 m!270671))

(declare-fun m!270687 () Bool)

(assert (=> b!255191 m!270687))

(declare-fun m!270689 () Bool)

(assert (=> b!255196 m!270689))

(assert (=> d!61539 m!270653))

(declare-fun m!270691 () Bool)

(assert (=> bm!24106 m!270691))

(assert (=> b!255189 m!270671))

(assert (=> b!255189 m!270671))

(assert (=> b!255189 m!270687))

(declare-fun m!270693 () Bool)

(assert (=> bm!24111 m!270693))

(declare-fun m!270695 () Bool)

(assert (=> bm!24110 m!270695))

(assert (=> b!255205 m!270671))

(assert (=> b!255205 m!270671))

(declare-fun m!270697 () Bool)

(assert (=> b!255205 m!270697))

(declare-fun m!270699 () Bool)

(assert (=> b!255203 m!270699))

(declare-fun m!270701 () Bool)

(assert (=> b!255203 m!270701))

(declare-fun m!270703 () Bool)

(assert (=> b!255203 m!270703))

(declare-fun m!270705 () Bool)

(assert (=> b!255203 m!270705))

(declare-fun m!270707 () Bool)

(assert (=> b!255203 m!270707))

(declare-fun m!270709 () Bool)

(assert (=> b!255203 m!270709))

(declare-fun m!270711 () Bool)

(assert (=> b!255203 m!270711))

(assert (=> b!255203 m!270693))

(declare-fun m!270713 () Bool)

(assert (=> b!255203 m!270713))

(declare-fun m!270715 () Bool)

(assert (=> b!255203 m!270715))

(declare-fun m!270717 () Bool)

(assert (=> b!255203 m!270717))

(declare-fun m!270719 () Bool)

(assert (=> b!255203 m!270719))

(assert (=> b!255203 m!270713))

(declare-fun m!270721 () Bool)

(assert (=> b!255203 m!270721))

(declare-fun m!270723 () Bool)

(assert (=> b!255203 m!270723))

(assert (=> b!255203 m!270715))

(declare-fun m!270725 () Bool)

(assert (=> b!255203 m!270725))

(declare-fun m!270727 () Bool)

(assert (=> b!255203 m!270727))

(assert (=> b!255203 m!270671))

(assert (=> b!255203 m!270709))

(assert (=> b!255203 m!270725))

(assert (=> b!255048 d!61539))

(declare-fun d!61541 () Bool)

(assert (=> d!61541 (= (array_inv!3903 (_keys!6861 thiss!1504)) (bvsge (size!6250 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255055 d!61541))

(declare-fun d!61543 () Bool)

(assert (=> d!61543 (= (array_inv!3904 (_values!4688 thiss!1504)) (bvsge (size!6249 (_values!4688 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255055 d!61543))

(declare-fun d!61545 () Bool)

(assert (=> d!61545 (contains!1852 (getCurrentListMap!1448 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)) key!932)))

(declare-fun lt!127999 () Unit!7914)

(declare-fun choose!1216 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 64) (_ BitVec 32) Int) Unit!7914)

(assert (=> d!61545 (= lt!127999 (choose!1216 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(assert (=> d!61545 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61545 (= (lemmaArrayContainsKeyThenInListMap!228 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)) lt!127999)))

(declare-fun bs!9059 () Bool)

(assert (= bs!9059 d!61545))

(assert (=> bs!9059 m!270567))

(assert (=> bs!9059 m!270567))

(declare-fun m!270729 () Bool)

(assert (=> bs!9059 m!270729))

(declare-fun m!270731 () Bool)

(assert (=> bs!9059 m!270731))

(assert (=> bs!9059 m!270653))

(assert (=> b!255052 d!61545))

(declare-fun d!61547 () Bool)

(declare-fun res!124894 () Bool)

(declare-fun e!165430 () Bool)

(assert (=> d!61547 (=> (not res!124894) (not e!165430))))

(declare-fun simpleValid!271 (LongMapFixedSize!3774) Bool)

(assert (=> d!61547 (= res!124894 (simpleValid!271 thiss!1504))))

(assert (=> d!61547 (= (valid!1475 thiss!1504) e!165430)))

(declare-fun b!255218 () Bool)

(declare-fun res!124895 () Bool)

(assert (=> b!255218 (=> (not res!124895) (not e!165430))))

(assert (=> b!255218 (= res!124895 (= (arrayCountValidKeys!0 (_keys!6861 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) (_size!1936 thiss!1504)))))

(declare-fun b!255219 () Bool)

(declare-fun res!124896 () Bool)

(assert (=> b!255219 (=> (not res!124896) (not e!165430))))

(assert (=> b!255219 (= res!124896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)))))

(declare-fun b!255220 () Bool)

(assert (=> b!255220 (= e!165430 (arrayNoDuplicates!0 (_keys!6861 thiss!1504) #b00000000000000000000000000000000 Nil!3775))))

(assert (= (and d!61547 res!124894) b!255218))

(assert (= (and b!255218 res!124895) b!255219))

(assert (= (and b!255219 res!124896) b!255220))

(declare-fun m!270733 () Bool)

(assert (=> d!61547 m!270733))

(assert (=> b!255218 m!270589))

(declare-fun m!270735 () Bool)

(assert (=> b!255219 m!270735))

(declare-fun m!270737 () Bool)

(assert (=> b!255220 m!270737))

(assert (=> start!24336 d!61547))

(declare-fun d!61549 () Bool)

(declare-fun e!165433 () Bool)

(assert (=> d!61549 e!165433))

(declare-fun res!124902 () Bool)

(assert (=> d!61549 (=> (not res!124902) (not e!165433))))

(declare-fun lt!128005 () SeekEntryResult!1155)

(assert (=> d!61549 (= res!124902 ((_ is Found!1155) lt!128005))))

(assert (=> d!61549 (= lt!128005 (seekEntryOrOpen!0 key!932 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)))))

(declare-fun lt!128004 () Unit!7914)

(declare-fun choose!1217 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 64) Int) Unit!7914)

(assert (=> d!61549 (= lt!128004 (choose!1217 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 (defaultEntry!4705 thiss!1504)))))

(assert (=> d!61549 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61549 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!422 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 (defaultEntry!4705 thiss!1504)) lt!128004)))

(declare-fun b!255225 () Bool)

(declare-fun res!124901 () Bool)

(assert (=> b!255225 (=> (not res!124901) (not e!165433))))

(assert (=> b!255225 (= res!124901 (inRange!0 (index!6791 lt!128005) (mask!10959 thiss!1504)))))

(declare-fun b!255226 () Bool)

(assert (=> b!255226 (= e!165433 (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6791 lt!128005)) key!932))))

(assert (=> b!255226 (and (bvsge (index!6791 lt!128005) #b00000000000000000000000000000000) (bvslt (index!6791 lt!128005) (size!6250 (_keys!6861 thiss!1504))))))

(assert (= (and d!61549 res!124902) b!255225))

(assert (= (and b!255225 res!124901) b!255226))

(assert (=> d!61549 m!270543))

(declare-fun m!270739 () Bool)

(assert (=> d!61549 m!270739))

(assert (=> d!61549 m!270653))

(declare-fun m!270741 () Bool)

(assert (=> b!255225 m!270741))

(declare-fun m!270743 () Bool)

(assert (=> b!255226 m!270743))

(assert (=> b!255058 d!61549))

(declare-fun b!255237 () Bool)

(declare-fun e!165438 () Bool)

(assert (=> b!255237 (= e!165438 (bvslt (size!6250 (_keys!6861 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!255238 () Bool)

(declare-fun e!165439 () Bool)

(assert (=> b!255238 (= e!165439 (= (arrayCountValidKeys!0 (array!12458 (store (arr!5903 (_keys!6861 thiss!1504)) index!297 key!932) (size!6250 (_keys!6861 thiss!1504))) #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6861 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61551 () Bool)

(assert (=> d!61551 e!165439))

(declare-fun res!124913 () Bool)

(assert (=> d!61551 (=> (not res!124913) (not e!165439))))

(assert (=> d!61551 (= res!124913 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6861 thiss!1504)))))))

(declare-fun lt!128008 () Unit!7914)

(declare-fun choose!1 (array!12457 (_ BitVec 32) (_ BitVec 64)) Unit!7914)

(assert (=> d!61551 (= lt!128008 (choose!1 (_keys!6861 thiss!1504) index!297 key!932))))

(assert (=> d!61551 e!165438))

(declare-fun res!124914 () Bool)

(assert (=> d!61551 (=> (not res!124914) (not e!165438))))

(assert (=> d!61551 (= res!124914 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6861 thiss!1504)))))))

(assert (=> d!61551 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6861 thiss!1504) index!297 key!932) lt!128008)))

(declare-fun b!255236 () Bool)

(declare-fun res!124912 () Bool)

(assert (=> b!255236 (=> (not res!124912) (not e!165438))))

(assert (=> b!255236 (= res!124912 (validKeyInArray!0 key!932))))

(declare-fun b!255235 () Bool)

(declare-fun res!124911 () Bool)

(assert (=> b!255235 (=> (not res!124911) (not e!165438))))

(assert (=> b!255235 (= res!124911 (not (validKeyInArray!0 (select (arr!5903 (_keys!6861 thiss!1504)) index!297))))))

(assert (= (and d!61551 res!124914) b!255235))

(assert (= (and b!255235 res!124911) b!255236))

(assert (= (and b!255236 res!124912) b!255237))

(assert (= (and d!61551 res!124913) b!255238))

(assert (=> b!255238 m!270579))

(declare-fun m!270745 () Bool)

(assert (=> b!255238 m!270745))

(assert (=> b!255238 m!270589))

(declare-fun m!270747 () Bool)

(assert (=> d!61551 m!270747))

(declare-fun m!270749 () Bool)

(assert (=> b!255236 m!270749))

(declare-fun m!270751 () Bool)

(assert (=> b!255235 m!270751))

(assert (=> b!255235 m!270751))

(declare-fun m!270753 () Bool)

(assert (=> b!255235 m!270753))

(assert (=> b!255045 d!61551))

(declare-fun d!61553 () Bool)

(declare-fun e!165442 () Bool)

(assert (=> d!61553 e!165442))

(declare-fun res!124920 () Bool)

(assert (=> d!61553 (=> (not res!124920) (not e!165442))))

(declare-fun lt!128019 () ListLongMap!3809)

(assert (=> d!61553 (= res!124920 (contains!1852 lt!128019 (_1!2459 (tuple2!4897 key!932 v!346))))))

(declare-fun lt!128020 () List!3777)

(assert (=> d!61553 (= lt!128019 (ListLongMap!3810 lt!128020))))

(declare-fun lt!128018 () Unit!7914)

(declare-fun lt!128017 () Unit!7914)

(assert (=> d!61553 (= lt!128018 lt!128017)))

(assert (=> d!61553 (= (getValueByKey!306 lt!128020 (_1!2459 (tuple2!4897 key!932 v!346))) (Some!311 (_2!2459 (tuple2!4897 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!162 (List!3777 (_ BitVec 64) V!8395) Unit!7914)

(assert (=> d!61553 (= lt!128017 (lemmaContainsTupThenGetReturnValue!162 lt!128020 (_1!2459 (tuple2!4897 key!932 v!346)) (_2!2459 (tuple2!4897 key!932 v!346))))))

(declare-fun insertStrictlySorted!165 (List!3777 (_ BitVec 64) V!8395) List!3777)

(assert (=> d!61553 (= lt!128020 (insertStrictlySorted!165 (toList!1920 lt!127868) (_1!2459 (tuple2!4897 key!932 v!346)) (_2!2459 (tuple2!4897 key!932 v!346))))))

(assert (=> d!61553 (= (+!676 lt!127868 (tuple2!4897 key!932 v!346)) lt!128019)))

(declare-fun b!255243 () Bool)

(declare-fun res!124919 () Bool)

(assert (=> b!255243 (=> (not res!124919) (not e!165442))))

(assert (=> b!255243 (= res!124919 (= (getValueByKey!306 (toList!1920 lt!128019) (_1!2459 (tuple2!4897 key!932 v!346))) (Some!311 (_2!2459 (tuple2!4897 key!932 v!346)))))))

(declare-fun b!255244 () Bool)

(declare-fun contains!1854 (List!3777 tuple2!4896) Bool)

(assert (=> b!255244 (= e!165442 (contains!1854 (toList!1920 lt!128019) (tuple2!4897 key!932 v!346)))))

(assert (= (and d!61553 res!124920) b!255243))

(assert (= (and b!255243 res!124919) b!255244))

(declare-fun m!270755 () Bool)

(assert (=> d!61553 m!270755))

(declare-fun m!270757 () Bool)

(assert (=> d!61553 m!270757))

(declare-fun m!270759 () Bool)

(assert (=> d!61553 m!270759))

(declare-fun m!270761 () Bool)

(assert (=> d!61553 m!270761))

(declare-fun m!270763 () Bool)

(assert (=> b!255243 m!270763))

(declare-fun m!270765 () Bool)

(assert (=> b!255244 m!270765))

(assert (=> b!255045 d!61553))

(declare-fun d!61555 () Bool)

(declare-fun res!124925 () Bool)

(declare-fun e!165450 () Bool)

(assert (=> d!61555 (=> res!124925 e!165450)))

(assert (=> d!61555 (= res!124925 (bvsge #b00000000000000000000000000000000 (size!6250 lt!127869)))))

(assert (=> d!61555 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127869 (mask!10959 thiss!1504)) e!165450)))

(declare-fun b!255253 () Bool)

(declare-fun e!165449 () Bool)

(assert (=> b!255253 (= e!165450 e!165449)))

(declare-fun c!43087 () Bool)

(assert (=> b!255253 (= c!43087 (validKeyInArray!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(declare-fun bm!24114 () Bool)

(declare-fun call!24117 () Bool)

(assert (=> bm!24114 (= call!24117 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127869 (mask!10959 thiss!1504)))))

(declare-fun b!255254 () Bool)

(declare-fun e!165451 () Bool)

(assert (=> b!255254 (= e!165449 e!165451)))

(declare-fun lt!128027 () (_ BitVec 64))

(assert (=> b!255254 (= lt!128027 (select (arr!5903 lt!127869) #b00000000000000000000000000000000))))

(declare-fun lt!128029 () Unit!7914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12457 (_ BitVec 64) (_ BitVec 32)) Unit!7914)

(assert (=> b!255254 (= lt!128029 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127869 lt!128027 #b00000000000000000000000000000000))))

(assert (=> b!255254 (arrayContainsKey!0 lt!127869 lt!128027 #b00000000000000000000000000000000)))

(declare-fun lt!128028 () Unit!7914)

(assert (=> b!255254 (= lt!128028 lt!128029)))

(declare-fun res!124926 () Bool)

(assert (=> b!255254 (= res!124926 (= (seekEntryOrOpen!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000) lt!127869 (mask!10959 thiss!1504)) (Found!1155 #b00000000000000000000000000000000)))))

(assert (=> b!255254 (=> (not res!124926) (not e!165451))))

(declare-fun b!255255 () Bool)

(assert (=> b!255255 (= e!165451 call!24117)))

(declare-fun b!255256 () Bool)

(assert (=> b!255256 (= e!165449 call!24117)))

(assert (= (and d!61555 (not res!124925)) b!255253))

(assert (= (and b!255253 c!43087) b!255254))

(assert (= (and b!255253 (not c!43087)) b!255256))

(assert (= (and b!255254 res!124926) b!255255))

(assert (= (or b!255255 b!255256) bm!24114))

(declare-fun m!270767 () Bool)

(assert (=> b!255253 m!270767))

(assert (=> b!255253 m!270767))

(declare-fun m!270769 () Bool)

(assert (=> b!255253 m!270769))

(declare-fun m!270771 () Bool)

(assert (=> bm!24114 m!270771))

(assert (=> b!255254 m!270767))

(declare-fun m!270773 () Bool)

(assert (=> b!255254 m!270773))

(declare-fun m!270775 () Bool)

(assert (=> b!255254 m!270775))

(assert (=> b!255254 m!270767))

(declare-fun m!270777 () Bool)

(assert (=> b!255254 m!270777))

(assert (=> b!255045 d!61555))

(declare-fun bm!24117 () Bool)

(declare-fun call!24120 () (_ BitVec 32))

(assert (=> bm!24117 (= call!24120 (arrayCountValidKeys!0 (_keys!6861 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun b!255265 () Bool)

(declare-fun e!165457 () (_ BitVec 32))

(assert (=> b!255265 (= e!165457 call!24120)))

(declare-fun b!255266 () Bool)

(assert (=> b!255266 (= e!165457 (bvadd #b00000000000000000000000000000001 call!24120))))

(declare-fun d!61557 () Bool)

(declare-fun lt!128032 () (_ BitVec 32))

(assert (=> d!61557 (and (bvsge lt!128032 #b00000000000000000000000000000000) (bvsle lt!128032 (bvsub (size!6250 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!165456 () (_ BitVec 32))

(assert (=> d!61557 (= lt!128032 e!165456)))

(declare-fun c!43092 () Bool)

(assert (=> d!61557 (= c!43092 (bvsge #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))

(assert (=> d!61557 (and (bvsle #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6250 (_keys!6861 thiss!1504)) (size!6250 (_keys!6861 thiss!1504))))))

(assert (=> d!61557 (= (arrayCountValidKeys!0 (_keys!6861 thiss!1504) #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) lt!128032)))

(declare-fun b!255267 () Bool)

(assert (=> b!255267 (= e!165456 #b00000000000000000000000000000000)))

(declare-fun b!255268 () Bool)

(assert (=> b!255268 (= e!165456 e!165457)))

(declare-fun c!43093 () Bool)

(assert (=> b!255268 (= c!43093 (validKeyInArray!0 (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61557 c!43092) b!255267))

(assert (= (and d!61557 (not c!43092)) b!255268))

(assert (= (and b!255268 c!43093) b!255266))

(assert (= (and b!255268 (not c!43093)) b!255265))

(assert (= (or b!255266 b!255265) bm!24117))

(declare-fun m!270779 () Bool)

(assert (=> bm!24117 m!270779))

(assert (=> b!255268 m!270671))

(assert (=> b!255268 m!270671))

(assert (=> b!255268 m!270687))

(assert (=> b!255045 d!61557))

(declare-fun d!61559 () Bool)

(declare-fun e!165460 () Bool)

(assert (=> d!61559 e!165460))

(declare-fun res!124929 () Bool)

(assert (=> d!61559 (=> (not res!124929) (not e!165460))))

(assert (=> d!61559 (= res!124929 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6861 thiss!1504))) (bvslt index!297 (size!6249 (_values!4688 thiss!1504)))))))

(declare-fun lt!128035 () Unit!7914)

(declare-fun choose!1218 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 32) (_ BitVec 64) V!8395 Int) Unit!7914)

(assert (=> d!61559 (= lt!128035 (choose!1218 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) index!297 key!932 v!346 (defaultEntry!4705 thiss!1504)))))

(assert (=> d!61559 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61559 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!86 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) index!297 key!932 v!346 (defaultEntry!4705 thiss!1504)) lt!128035)))

(declare-fun b!255271 () Bool)

(assert (=> b!255271 (= e!165460 (= (+!676 (getCurrentListMap!1448 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)) (tuple2!4897 key!932 v!346)) (getCurrentListMap!1448 (array!12458 (store (arr!5903 (_keys!6861 thiss!1504)) index!297 key!932) (size!6250 (_keys!6861 thiss!1504))) (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504))))))

(assert (= (and d!61559 res!124929) b!255271))

(declare-fun m!270781 () Bool)

(assert (=> d!61559 m!270781))

(assert (=> d!61559 m!270653))

(assert (=> b!255271 m!270579))

(declare-fun m!270783 () Bool)

(assert (=> b!255271 m!270783))

(assert (=> b!255271 m!270587))

(assert (=> b!255271 m!270567))

(declare-fun m!270785 () Bool)

(assert (=> b!255271 m!270785))

(assert (=> b!255271 m!270567))

(assert (=> b!255045 d!61559))

(declare-fun bm!24118 () Bool)

(declare-fun call!24121 () (_ BitVec 32))

(assert (=> bm!24118 (= call!24121 (arrayCountValidKeys!0 lt!127869 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun b!255272 () Bool)

(declare-fun e!165462 () (_ BitVec 32))

(assert (=> b!255272 (= e!165462 call!24121)))

(declare-fun b!255273 () Bool)

(assert (=> b!255273 (= e!165462 (bvadd #b00000000000000000000000000000001 call!24121))))

(declare-fun d!61561 () Bool)

(declare-fun lt!128036 () (_ BitVec 32))

(assert (=> d!61561 (and (bvsge lt!128036 #b00000000000000000000000000000000) (bvsle lt!128036 (bvsub (size!6250 lt!127869) #b00000000000000000000000000000000)))))

(declare-fun e!165461 () (_ BitVec 32))

(assert (=> d!61561 (= lt!128036 e!165461)))

(declare-fun c!43094 () Bool)

(assert (=> d!61561 (= c!43094 (bvsge #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))))))

(assert (=> d!61561 (and (bvsle #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6250 (_keys!6861 thiss!1504)) (size!6250 lt!127869)))))

(assert (=> d!61561 (= (arrayCountValidKeys!0 lt!127869 #b00000000000000000000000000000000 (size!6250 (_keys!6861 thiss!1504))) lt!128036)))

(declare-fun b!255274 () Bool)

(assert (=> b!255274 (= e!165461 #b00000000000000000000000000000000)))

(declare-fun b!255275 () Bool)

(assert (=> b!255275 (= e!165461 e!165462)))

(declare-fun c!43095 () Bool)

(assert (=> b!255275 (= c!43095 (validKeyInArray!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(assert (= (and d!61561 c!43094) b!255274))

(assert (= (and d!61561 (not c!43094)) b!255275))

(assert (= (and b!255275 c!43095) b!255273))

(assert (= (and b!255275 (not c!43095)) b!255272))

(assert (= (or b!255273 b!255272) bm!24118))

(declare-fun m!270787 () Bool)

(assert (=> bm!24118 m!270787))

(assert (=> b!255275 m!270767))

(assert (=> b!255275 m!270767))

(assert (=> b!255275 m!270769))

(assert (=> b!255045 d!61561))

(declare-fun bm!24119 () Bool)

(declare-fun call!24125 () ListLongMap!3809)

(declare-fun call!24123 () ListLongMap!3809)

(assert (=> bm!24119 (= call!24125 call!24123)))

(declare-fun b!255276 () Bool)

(declare-fun e!165463 () Bool)

(assert (=> b!255276 (= e!165463 (validKeyInArray!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(declare-fun b!255277 () Bool)

(declare-fun e!165464 () ListLongMap!3809)

(declare-fun call!24122 () ListLongMap!3809)

(assert (=> b!255277 (= e!165464 call!24122)))

(declare-fun b!255278 () Bool)

(declare-fun e!165471 () Bool)

(assert (=> b!255278 (= e!165471 (validKeyInArray!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(declare-fun bm!24120 () Bool)

(declare-fun call!24124 () Bool)

(declare-fun lt!128058 () ListLongMap!3809)

(assert (=> bm!24120 (= call!24124 (contains!1852 lt!128058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24121 () Bool)

(declare-fun call!24126 () ListLongMap!3809)

(assert (=> bm!24121 (= call!24123 call!24126)))

(declare-fun b!255279 () Bool)

(declare-fun c!43101 () Bool)

(assert (=> b!255279 (= c!43101 (and (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!165475 () ListLongMap!3809)

(assert (=> b!255279 (= e!165464 e!165475)))

(declare-fun b!255280 () Bool)

(declare-fun e!165468 () ListLongMap!3809)

(assert (=> b!255280 (= e!165468 e!165464)))

(declare-fun c!43098 () Bool)

(assert (=> b!255280 (= c!43098 (and (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255281 () Bool)

(declare-fun e!165472 () Bool)

(assert (=> b!255281 (= e!165472 (= (apply!248 lt!128058 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4546 thiss!1504)))))

(declare-fun e!165469 () Bool)

(declare-fun b!255282 () Bool)

(assert (=> b!255282 (= e!165469 (= (apply!248 lt!128058 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)) (get!3035 (select (arr!5902 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!591 (defaultEntry!4705 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6249 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))))))))

(assert (=> b!255282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 lt!127869)))))

(declare-fun b!255283 () Bool)

(declare-fun e!165465 () Bool)

(assert (=> b!255283 (= e!165465 (= (apply!248 lt!128058 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4546 thiss!1504)))))

(declare-fun b!255284 () Bool)

(declare-fun e!165474 () Bool)

(assert (=> b!255284 (= e!165474 (not call!24124))))

(declare-fun b!255286 () Bool)

(assert (=> b!255286 (= e!165474 e!165472)))

(declare-fun res!124936 () Bool)

(assert (=> b!255286 (= res!124936 call!24124)))

(assert (=> b!255286 (=> (not res!124936) (not e!165472))))

(declare-fun b!255287 () Bool)

(declare-fun e!165467 () Bool)

(declare-fun e!165470 () Bool)

(assert (=> b!255287 (= e!165467 e!165470)))

(declare-fun c!43096 () Bool)

(assert (=> b!255287 (= c!43096 (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24122 () Bool)

(declare-fun call!24127 () ListLongMap!3809)

(assert (=> bm!24122 (= call!24122 call!24127)))

(declare-fun b!255288 () Bool)

(declare-fun res!124937 () Bool)

(assert (=> b!255288 (=> (not res!124937) (not e!165467))))

(assert (=> b!255288 (= res!124937 e!165474)))

(declare-fun c!43097 () Bool)

(assert (=> b!255288 (= c!43097 (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255289 () Bool)

(assert (=> b!255289 (= e!165470 e!165465)))

(declare-fun res!124930 () Bool)

(declare-fun call!24128 () Bool)

(assert (=> b!255289 (= res!124930 call!24128)))

(assert (=> b!255289 (=> (not res!124930) (not e!165465))))

(declare-fun b!255290 () Bool)

(declare-fun e!165473 () Unit!7914)

(declare-fun lt!128039 () Unit!7914)

(assert (=> b!255290 (= e!165473 lt!128039)))

(declare-fun lt!128042 () ListLongMap!3809)

(assert (=> b!255290 (= lt!128042 (getCurrentListMapNoExtraKeys!570 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!128049 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128037 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128037 (select (arr!5903 lt!127869) #b00000000000000000000000000000000))))

(declare-fun lt!128041 () Unit!7914)

(assert (=> b!255290 (= lt!128041 (addStillContains!224 lt!128042 lt!128049 (zeroValue!4546 thiss!1504) lt!128037))))

(assert (=> b!255290 (contains!1852 (+!676 lt!128042 (tuple2!4897 lt!128049 (zeroValue!4546 thiss!1504))) lt!128037)))

(declare-fun lt!128055 () Unit!7914)

(assert (=> b!255290 (= lt!128055 lt!128041)))

(declare-fun lt!128052 () ListLongMap!3809)

(assert (=> b!255290 (= lt!128052 (getCurrentListMapNoExtraKeys!570 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!128045 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128045 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128053 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128053 (select (arr!5903 lt!127869) #b00000000000000000000000000000000))))

(declare-fun lt!128050 () Unit!7914)

(assert (=> b!255290 (= lt!128050 (addApplyDifferent!224 lt!128052 lt!128045 (minValue!4546 thiss!1504) lt!128053))))

(assert (=> b!255290 (= (apply!248 (+!676 lt!128052 (tuple2!4897 lt!128045 (minValue!4546 thiss!1504))) lt!128053) (apply!248 lt!128052 lt!128053))))

(declare-fun lt!128046 () Unit!7914)

(assert (=> b!255290 (= lt!128046 lt!128050)))

(declare-fun lt!128047 () ListLongMap!3809)

(assert (=> b!255290 (= lt!128047 (getCurrentListMapNoExtraKeys!570 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!128043 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128048 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128048 (select (arr!5903 lt!127869) #b00000000000000000000000000000000))))

(declare-fun lt!128057 () Unit!7914)

(assert (=> b!255290 (= lt!128057 (addApplyDifferent!224 lt!128047 lt!128043 (zeroValue!4546 thiss!1504) lt!128048))))

(assert (=> b!255290 (= (apply!248 (+!676 lt!128047 (tuple2!4897 lt!128043 (zeroValue!4546 thiss!1504))) lt!128048) (apply!248 lt!128047 lt!128048))))

(declare-fun lt!128054 () Unit!7914)

(assert (=> b!255290 (= lt!128054 lt!128057)))

(declare-fun lt!128040 () ListLongMap!3809)

(assert (=> b!255290 (= lt!128040 (getCurrentListMapNoExtraKeys!570 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun lt!128038 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128038 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128051 () (_ BitVec 64))

(assert (=> b!255290 (= lt!128051 (select (arr!5903 lt!127869) #b00000000000000000000000000000000))))

(assert (=> b!255290 (= lt!128039 (addApplyDifferent!224 lt!128040 lt!128038 (minValue!4546 thiss!1504) lt!128051))))

(assert (=> b!255290 (= (apply!248 (+!676 lt!128040 (tuple2!4897 lt!128038 (minValue!4546 thiss!1504))) lt!128051) (apply!248 lt!128040 lt!128051))))

(declare-fun bm!24123 () Bool)

(declare-fun c!43099 () Bool)

(assert (=> bm!24123 (= call!24127 (+!676 (ite c!43099 call!24126 (ite c!43098 call!24123 call!24125)) (ite (or c!43099 c!43098) (tuple2!4897 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4546 thiss!1504)) (tuple2!4897 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4546 thiss!1504)))))))

(declare-fun b!255291 () Bool)

(assert (=> b!255291 (= e!165475 call!24122)))

(declare-fun bm!24124 () Bool)

(assert (=> bm!24124 (= call!24128 (contains!1852 lt!128058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255292 () Bool)

(declare-fun e!165466 () Bool)

(assert (=> b!255292 (= e!165466 e!165469)))

(declare-fun res!124932 () Bool)

(assert (=> b!255292 (=> (not res!124932) (not e!165469))))

(assert (=> b!255292 (= res!124932 (contains!1852 lt!128058 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(assert (=> b!255292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 lt!127869)))))

(declare-fun bm!24125 () Bool)

(assert (=> bm!24125 (= call!24126 (getCurrentListMapNoExtraKeys!570 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)))))

(declare-fun b!255293 () Bool)

(assert (=> b!255293 (= e!165468 (+!676 call!24127 (tuple2!4897 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4546 thiss!1504))))))

(declare-fun b!255294 () Bool)

(assert (=> b!255294 (= e!165470 (not call!24128))))

(declare-fun b!255295 () Bool)

(declare-fun res!124931 () Bool)

(assert (=> b!255295 (=> (not res!124931) (not e!165467))))

(assert (=> b!255295 (= res!124931 e!165466)))

(declare-fun res!124933 () Bool)

(assert (=> b!255295 (=> res!124933 e!165466)))

(assert (=> b!255295 (= res!124933 (not e!165463))))

(declare-fun res!124934 () Bool)

(assert (=> b!255295 (=> (not res!124934) (not e!165463))))

(assert (=> b!255295 (= res!124934 (bvslt #b00000000000000000000000000000000 (size!6250 lt!127869)))))

(declare-fun b!255296 () Bool)

(declare-fun Unit!7924 () Unit!7914)

(assert (=> b!255296 (= e!165473 Unit!7924)))

(declare-fun d!61563 () Bool)

(assert (=> d!61563 e!165467))

(declare-fun res!124935 () Bool)

(assert (=> d!61563 (=> (not res!124935) (not e!165467))))

(assert (=> d!61563 (= res!124935 (or (bvsge #b00000000000000000000000000000000 (size!6250 lt!127869)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6250 lt!127869)))))))

(declare-fun lt!128044 () ListLongMap!3809)

(assert (=> d!61563 (= lt!128058 lt!128044)))

(declare-fun lt!128056 () Unit!7914)

(assert (=> d!61563 (= lt!128056 e!165473)))

(declare-fun c!43100 () Bool)

(assert (=> d!61563 (= c!43100 e!165471)))

(declare-fun res!124938 () Bool)

(assert (=> d!61563 (=> (not res!124938) (not e!165471))))

(assert (=> d!61563 (= res!124938 (bvslt #b00000000000000000000000000000000 (size!6250 lt!127869)))))

(assert (=> d!61563 (= lt!128044 e!165468)))

(assert (=> d!61563 (= c!43099 (and (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4442 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61563 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61563 (= (getCurrentListMap!1448 lt!127869 (array!12456 (store (arr!5902 (_values!4688 thiss!1504)) index!297 (ValueCellFull!2937 v!346)) (size!6249 (_values!4688 thiss!1504))) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4705 thiss!1504)) lt!128058)))

(declare-fun b!255285 () Bool)

(assert (=> b!255285 (= e!165475 call!24125)))

(assert (= (and d!61563 c!43099) b!255293))

(assert (= (and d!61563 (not c!43099)) b!255280))

(assert (= (and b!255280 c!43098) b!255277))

(assert (= (and b!255280 (not c!43098)) b!255279))

(assert (= (and b!255279 c!43101) b!255291))

(assert (= (and b!255279 (not c!43101)) b!255285))

(assert (= (or b!255291 b!255285) bm!24119))

(assert (= (or b!255277 bm!24119) bm!24121))

(assert (= (or b!255277 b!255291) bm!24122))

(assert (= (or b!255293 bm!24121) bm!24125))

(assert (= (or b!255293 bm!24122) bm!24123))

(assert (= (and d!61563 res!124938) b!255278))

(assert (= (and d!61563 c!43100) b!255290))

(assert (= (and d!61563 (not c!43100)) b!255296))

(assert (= (and d!61563 res!124935) b!255295))

(assert (= (and b!255295 res!124934) b!255276))

(assert (= (and b!255295 (not res!124933)) b!255292))

(assert (= (and b!255292 res!124932) b!255282))

(assert (= (and b!255295 res!124931) b!255288))

(assert (= (and b!255288 c!43097) b!255286))

(assert (= (and b!255288 (not c!43097)) b!255284))

(assert (= (and b!255286 res!124936) b!255281))

(assert (= (or b!255286 b!255284) bm!24120))

(assert (= (and b!255288 res!124937) b!255287))

(assert (= (and b!255287 c!43096) b!255289))

(assert (= (and b!255287 (not c!43096)) b!255294))

(assert (= (and b!255289 res!124930) b!255283))

(assert (= (or b!255289 b!255294) bm!24124))

(declare-fun b_lambda!8141 () Bool)

(assert (=> (not b_lambda!8141) (not b!255282)))

(assert (=> b!255282 t!8830))

(declare-fun b_and!13751 () Bool)

(assert (= b_and!13749 (and (=> t!8830 result!5349) b_and!13751)))

(assert (=> b!255282 m!270767))

(declare-fun m!270789 () Bool)

(assert (=> b!255282 m!270789))

(declare-fun m!270791 () Bool)

(assert (=> b!255282 m!270791))

(assert (=> b!255282 m!270677))

(assert (=> b!255282 m!270767))

(assert (=> b!255282 m!270791))

(assert (=> b!255282 m!270677))

(declare-fun m!270793 () Bool)

(assert (=> b!255282 m!270793))

(declare-fun m!270795 () Bool)

(assert (=> b!255281 m!270795))

(declare-fun m!270797 () Bool)

(assert (=> b!255293 m!270797))

(declare-fun m!270799 () Bool)

(assert (=> bm!24123 m!270799))

(assert (=> b!255278 m!270767))

(assert (=> b!255278 m!270767))

(assert (=> b!255278 m!270769))

(declare-fun m!270801 () Bool)

(assert (=> b!255283 m!270801))

(assert (=> d!61563 m!270653))

(declare-fun m!270803 () Bool)

(assert (=> bm!24120 m!270803))

(assert (=> b!255276 m!270767))

(assert (=> b!255276 m!270767))

(assert (=> b!255276 m!270769))

(declare-fun m!270805 () Bool)

(assert (=> bm!24125 m!270805))

(declare-fun m!270807 () Bool)

(assert (=> bm!24124 m!270807))

(assert (=> b!255292 m!270767))

(assert (=> b!255292 m!270767))

(declare-fun m!270809 () Bool)

(assert (=> b!255292 m!270809))

(declare-fun m!270811 () Bool)

(assert (=> b!255290 m!270811))

(declare-fun m!270813 () Bool)

(assert (=> b!255290 m!270813))

(declare-fun m!270815 () Bool)

(assert (=> b!255290 m!270815))

(declare-fun m!270817 () Bool)

(assert (=> b!255290 m!270817))

(declare-fun m!270819 () Bool)

(assert (=> b!255290 m!270819))

(declare-fun m!270821 () Bool)

(assert (=> b!255290 m!270821))

(declare-fun m!270823 () Bool)

(assert (=> b!255290 m!270823))

(assert (=> b!255290 m!270805))

(declare-fun m!270825 () Bool)

(assert (=> b!255290 m!270825))

(declare-fun m!270827 () Bool)

(assert (=> b!255290 m!270827))

(declare-fun m!270829 () Bool)

(assert (=> b!255290 m!270829))

(declare-fun m!270831 () Bool)

(assert (=> b!255290 m!270831))

(assert (=> b!255290 m!270825))

(declare-fun m!270833 () Bool)

(assert (=> b!255290 m!270833))

(declare-fun m!270835 () Bool)

(assert (=> b!255290 m!270835))

(assert (=> b!255290 m!270827))

(declare-fun m!270837 () Bool)

(assert (=> b!255290 m!270837))

(declare-fun m!270839 () Bool)

(assert (=> b!255290 m!270839))

(assert (=> b!255290 m!270767))

(assert (=> b!255290 m!270821))

(assert (=> b!255290 m!270837))

(assert (=> b!255045 d!61563))

(declare-fun d!61565 () Bool)

(declare-fun e!165478 () Bool)

(assert (=> d!61565 e!165478))

(declare-fun res!124941 () Bool)

(assert (=> d!61565 (=> (not res!124941) (not e!165478))))

(assert (=> d!61565 (= res!124941 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6861 thiss!1504)))))))

(declare-fun lt!128061 () Unit!7914)

(declare-fun choose!41 (array!12457 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3778) Unit!7914)

(assert (=> d!61565 (= lt!128061 (choose!41 (_keys!6861 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3775))))

(assert (=> d!61565 (bvslt (size!6250 (_keys!6861 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61565 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6861 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3775) lt!128061)))

(declare-fun b!255299 () Bool)

(assert (=> b!255299 (= e!165478 (arrayNoDuplicates!0 (array!12458 (store (arr!5903 (_keys!6861 thiss!1504)) index!297 key!932) (size!6250 (_keys!6861 thiss!1504))) #b00000000000000000000000000000000 Nil!3775))))

(assert (= (and d!61565 res!124941) b!255299))

(declare-fun m!270841 () Bool)

(assert (=> d!61565 m!270841))

(assert (=> b!255299 m!270579))

(declare-fun m!270843 () Bool)

(assert (=> b!255299 m!270843))

(assert (=> b!255045 d!61565))

(declare-fun b!255310 () Bool)

(declare-fun e!165490 () Bool)

(declare-fun e!165489 () Bool)

(assert (=> b!255310 (= e!165490 e!165489)))

(declare-fun c!43104 () Bool)

(assert (=> b!255310 (= c!43104 (validKeyInArray!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(declare-fun b!255311 () Bool)

(declare-fun e!165488 () Bool)

(declare-fun contains!1855 (List!3778 (_ BitVec 64)) Bool)

(assert (=> b!255311 (= e!165488 (contains!1855 Nil!3775 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(declare-fun d!61567 () Bool)

(declare-fun res!124949 () Bool)

(declare-fun e!165487 () Bool)

(assert (=> d!61567 (=> res!124949 e!165487)))

(assert (=> d!61567 (= res!124949 (bvsge #b00000000000000000000000000000000 (size!6250 lt!127869)))))

(assert (=> d!61567 (= (arrayNoDuplicates!0 lt!127869 #b00000000000000000000000000000000 Nil!3775) e!165487)))

(declare-fun bm!24128 () Bool)

(declare-fun call!24131 () Bool)

(assert (=> bm!24128 (= call!24131 (arrayNoDuplicates!0 lt!127869 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43104 (Cons!3774 (select (arr!5903 lt!127869) #b00000000000000000000000000000000) Nil!3775) Nil!3775)))))

(declare-fun b!255312 () Bool)

(assert (=> b!255312 (= e!165489 call!24131)))

(declare-fun b!255313 () Bool)

(assert (=> b!255313 (= e!165489 call!24131)))

(declare-fun b!255314 () Bool)

(assert (=> b!255314 (= e!165487 e!165490)))

(declare-fun res!124950 () Bool)

(assert (=> b!255314 (=> (not res!124950) (not e!165490))))

(assert (=> b!255314 (= res!124950 (not e!165488))))

(declare-fun res!124948 () Bool)

(assert (=> b!255314 (=> (not res!124948) (not e!165488))))

(assert (=> b!255314 (= res!124948 (validKeyInArray!0 (select (arr!5903 lt!127869) #b00000000000000000000000000000000)))))

(assert (= (and d!61567 (not res!124949)) b!255314))

(assert (= (and b!255314 res!124948) b!255311))

(assert (= (and b!255314 res!124950) b!255310))

(assert (= (and b!255310 c!43104) b!255313))

(assert (= (and b!255310 (not c!43104)) b!255312))

(assert (= (or b!255313 b!255312) bm!24128))

(assert (=> b!255310 m!270767))

(assert (=> b!255310 m!270767))

(assert (=> b!255310 m!270769))

(assert (=> b!255311 m!270767))

(assert (=> b!255311 m!270767))

(declare-fun m!270845 () Bool)

(assert (=> b!255311 m!270845))

(assert (=> bm!24128 m!270767))

(declare-fun m!270847 () Bool)

(assert (=> bm!24128 m!270847))

(assert (=> b!255314 m!270767))

(assert (=> b!255314 m!270767))

(assert (=> b!255314 m!270769))

(assert (=> b!255045 d!61567))

(declare-fun d!61569 () Bool)

(declare-fun res!124955 () Bool)

(declare-fun e!165495 () Bool)

(assert (=> d!61569 (=> res!124955 e!165495)))

(assert (=> d!61569 (= res!124955 (= (select (arr!5903 (_keys!6861 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61569 (= (arrayContainsKey!0 (_keys!6861 thiss!1504) key!932 #b00000000000000000000000000000000) e!165495)))

(declare-fun b!255319 () Bool)

(declare-fun e!165496 () Bool)

(assert (=> b!255319 (= e!165495 e!165496)))

(declare-fun res!124956 () Bool)

(assert (=> b!255319 (=> (not res!124956) (not e!165496))))

(assert (=> b!255319 (= res!124956 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun b!255320 () Bool)

(assert (=> b!255320 (= e!165496 (arrayContainsKey!0 (_keys!6861 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61569 (not res!124955)) b!255319))

(assert (= (and b!255319 res!124956) b!255320))

(assert (=> d!61569 m!270671))

(declare-fun m!270849 () Bool)

(assert (=> b!255320 m!270849))

(assert (=> b!255045 d!61569))

(declare-fun d!61571 () Bool)

(declare-fun e!165499 () Bool)

(assert (=> d!61571 e!165499))

(declare-fun res!124959 () Bool)

(assert (=> d!61571 (=> (not res!124959) (not e!165499))))

(assert (=> d!61571 (= res!124959 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6250 (_keys!6861 thiss!1504)))))))

(declare-fun lt!128064 () Unit!7914)

(declare-fun choose!102 ((_ BitVec 64) array!12457 (_ BitVec 32) (_ BitVec 32)) Unit!7914)

(assert (=> d!61571 (= lt!128064 (choose!102 key!932 (_keys!6861 thiss!1504) index!297 (mask!10959 thiss!1504)))))

(assert (=> d!61571 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61571 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6861 thiss!1504) index!297 (mask!10959 thiss!1504)) lt!128064)))

(declare-fun b!255323 () Bool)

(assert (=> b!255323 (= e!165499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12458 (store (arr!5903 (_keys!6861 thiss!1504)) index!297 key!932) (size!6250 (_keys!6861 thiss!1504))) (mask!10959 thiss!1504)))))

(assert (= (and d!61571 res!124959) b!255323))

(declare-fun m!270851 () Bool)

(assert (=> d!61571 m!270851))

(assert (=> d!61571 m!270653))

(assert (=> b!255323 m!270579))

(declare-fun m!270853 () Bool)

(assert (=> b!255323 m!270853))

(assert (=> b!255045 d!61571))

(assert (=> bm!24084 d!61569))

(declare-fun b!255340 () Bool)

(declare-fun res!124968 () Bool)

(declare-fun e!165510 () Bool)

(assert (=> b!255340 (=> (not res!124968) (not e!165510))))

(declare-fun call!24136 () Bool)

(assert (=> b!255340 (= res!124968 call!24136)))

(declare-fun e!165511 () Bool)

(assert (=> b!255340 (= e!165511 e!165510)))

(declare-fun b!255341 () Bool)

(declare-fun res!124970 () Bool)

(assert (=> b!255341 (=> (not res!124970) (not e!165510))))

(declare-fun lt!128070 () SeekEntryResult!1155)

(assert (=> b!255341 (= res!124970 (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6793 lt!128070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255341 (and (bvsge (index!6793 lt!128070) #b00000000000000000000000000000000) (bvslt (index!6793 lt!128070) (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun b!255342 () Bool)

(declare-fun e!165508 () Bool)

(assert (=> b!255342 (= e!165508 e!165511)))

(declare-fun c!43109 () Bool)

(assert (=> b!255342 (= c!43109 ((_ is MissingVacant!1155) lt!128070))))

(declare-fun c!43110 () Bool)

(declare-fun bm!24134 () Bool)

(assert (=> bm!24134 (= call!24136 (inRange!0 (ite c!43110 (index!6790 lt!128070) (index!6793 lt!128070)) (mask!10959 thiss!1504)))))

(declare-fun b!255343 () Bool)

(assert (=> b!255343 (and (bvsge (index!6790 lt!128070) #b00000000000000000000000000000000) (bvslt (index!6790 lt!128070) (size!6250 (_keys!6861 thiss!1504))))))

(declare-fun res!124969 () Bool)

(assert (=> b!255343 (= res!124969 (= (select (arr!5903 (_keys!6861 thiss!1504)) (index!6790 lt!128070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165509 () Bool)

(assert (=> b!255343 (=> (not res!124969) (not e!165509))))

(declare-fun bm!24133 () Bool)

(declare-fun call!24137 () Bool)

(assert (=> bm!24133 (= call!24137 (arrayContainsKey!0 (_keys!6861 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!61573 () Bool)

(assert (=> d!61573 e!165508))

(assert (=> d!61573 (= c!43110 ((_ is MissingZero!1155) lt!128070))))

(assert (=> d!61573 (= lt!128070 (seekEntryOrOpen!0 key!932 (_keys!6861 thiss!1504) (mask!10959 thiss!1504)))))

(declare-fun lt!128069 () Unit!7914)

(declare-fun choose!1219 (array!12457 array!12455 (_ BitVec 32) (_ BitVec 32) V!8395 V!8395 (_ BitVec 64) Int) Unit!7914)

(assert (=> d!61573 (= lt!128069 (choose!1219 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 (defaultEntry!4705 thiss!1504)))))

(assert (=> d!61573 (validMask!0 (mask!10959 thiss!1504))))

(assert (=> d!61573 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!425 (_keys!6861 thiss!1504) (_values!4688 thiss!1504) (mask!10959 thiss!1504) (extraKeys!4442 thiss!1504) (zeroValue!4546 thiss!1504) (minValue!4546 thiss!1504) key!932 (defaultEntry!4705 thiss!1504)) lt!128069)))

(declare-fun b!255344 () Bool)

(assert (=> b!255344 (= e!165508 e!165509)))

(declare-fun res!124971 () Bool)

(assert (=> b!255344 (= res!124971 call!24136)))

(assert (=> b!255344 (=> (not res!124971) (not e!165509))))

(declare-fun b!255345 () Bool)

(assert (=> b!255345 (= e!165511 ((_ is Undefined!1155) lt!128070))))

(declare-fun b!255346 () Bool)

(assert (=> b!255346 (= e!165510 (not call!24137))))

(declare-fun b!255347 () Bool)

(assert (=> b!255347 (= e!165509 (not call!24137))))

(assert (= (and d!61573 c!43110) b!255344))

(assert (= (and d!61573 (not c!43110)) b!255342))

(assert (= (and b!255344 res!124971) b!255343))

(assert (= (and b!255343 res!124969) b!255347))

(assert (= (and b!255342 c!43109) b!255340))

(assert (= (and b!255342 (not c!43109)) b!255345))

(assert (= (and b!255340 res!124968) b!255341))

(assert (= (and b!255341 res!124970) b!255346))

(assert (= (or b!255344 b!255340) bm!24134))

(assert (= (or b!255347 b!255346) bm!24133))

(declare-fun m!270855 () Bool)

(assert (=> b!255343 m!270855))

(declare-fun m!270857 () Bool)

(assert (=> bm!24134 m!270857))

(assert (=> d!61573 m!270543))

(declare-fun m!270859 () Bool)

(assert (=> d!61573 m!270859))

(assert (=> d!61573 m!270653))

(assert (=> bm!24133 m!270559))

(declare-fun m!270861 () Bool)

(assert (=> b!255341 m!270861))

(assert (=> b!255041 d!61573))

(declare-fun b!255355 () Bool)

(declare-fun e!165517 () Bool)

(assert (=> b!255355 (= e!165517 tp_is_empty!6561)))

(declare-fun mapNonEmpty!11166 () Bool)

(declare-fun mapRes!11166 () Bool)

(declare-fun tp!23397 () Bool)

(declare-fun e!165516 () Bool)

(assert (=> mapNonEmpty!11166 (= mapRes!11166 (and tp!23397 e!165516))))

(declare-fun mapKey!11166 () (_ BitVec 32))

(declare-fun mapRest!11166 () (Array (_ BitVec 32) ValueCell!2937))

(declare-fun mapValue!11166 () ValueCell!2937)

(assert (=> mapNonEmpty!11166 (= mapRest!11160 (store mapRest!11166 mapKey!11166 mapValue!11166))))

(declare-fun b!255354 () Bool)

(assert (=> b!255354 (= e!165516 tp_is_empty!6561)))

(declare-fun condMapEmpty!11166 () Bool)

(declare-fun mapDefault!11166 () ValueCell!2937)

(assert (=> mapNonEmpty!11160 (= condMapEmpty!11166 (= mapRest!11160 ((as const (Array (_ BitVec 32) ValueCell!2937)) mapDefault!11166)))))

(assert (=> mapNonEmpty!11160 (= tp!23388 (and e!165517 mapRes!11166))))

(declare-fun mapIsEmpty!11166 () Bool)

(assert (=> mapIsEmpty!11166 mapRes!11166))

(assert (= (and mapNonEmpty!11160 condMapEmpty!11166) mapIsEmpty!11166))

(assert (= (and mapNonEmpty!11160 (not condMapEmpty!11166)) mapNonEmpty!11166))

(assert (= (and mapNonEmpty!11166 ((_ is ValueCellFull!2937) mapValue!11166)) b!255354))

(assert (= (and mapNonEmpty!11160 ((_ is ValueCellFull!2937) mapDefault!11166)) b!255355))

(declare-fun m!270863 () Bool)

(assert (=> mapNonEmpty!11166 m!270863))

(declare-fun b_lambda!8143 () Bool)

(assert (= b_lambda!8139 (or (and b!255055 b_free!6699) b_lambda!8143)))

(declare-fun b_lambda!8145 () Bool)

(assert (= b_lambda!8141 (or (and b!255055 b_free!6699) b_lambda!8145)))

(check-sat (not b!255191) (not b_lambda!8145) (not bm!24114) (not d!61533) (not b!255146) (not b!255205) (not b!255254) (not b!255275) (not b!255299) (not b!255311) (not b!255220) (not b!255236) (not b!255314) (not b!255225) (not d!61563) (not b!255206) (not d!61565) (not b!255278) (not b!255195) (not b!255235) (not b!255144) (not d!61539) (not bm!24123) (not d!61553) (not b!255268) (not b!255292) (not b!255243) (not b!255196) (not bm!24110) (not b!255238) (not b!255253) (not d!61551) (not bm!24133) (not b_next!6699) (not d!61545) (not d!61549) (not bm!24120) (not b!255194) (not b!255320) (not d!61573) (not b!255310) (not b!255290) (not bm!24109) (not bm!24128) (not bm!24106) (not d!61559) (not bm!24124) (not b!255271) (not bm!24118) tp_is_empty!6561 (not bm!24134) (not b!255293) (not bm!24125) (not mapNonEmpty!11166) (not b!255282) (not b!255218) (not d!61547) (not b!255203) (not bm!24111) (not bm!24117) (not b_lambda!8143) (not b!255132) b_and!13751 (not b!255323) (not b!255219) (not b!255283) (not b!255189) (not d!61571) (not b!255244) (not b!255281) (not d!61537) (not b!255276))
(check-sat b_and!13751 (not b_next!6699))
