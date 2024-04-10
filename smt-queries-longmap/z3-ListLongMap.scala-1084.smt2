; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22188 () Bool)

(assert start!22188)

(declare-fun b!232332 () Bool)

(declare-fun b_free!6255 () Bool)

(declare-fun b_next!6255 () Bool)

(assert (=> b!232332 (= b_free!6255 (not b_next!6255))))

(declare-fun tp!21907 () Bool)

(declare-fun b_and!13153 () Bool)

(assert (=> b!232332 (= tp!21907 b_and!13153)))

(declare-fun b!232320 () Bool)

(declare-fun c!38627 () Bool)

(declare-datatypes ((SeekEntryResult!963 0))(
  ( (MissingZero!963 (index!6022 (_ BitVec 32))) (Found!963 (index!6023 (_ BitVec 32))) (Intermediate!963 (undefined!1775 Bool) (index!6024 (_ BitVec 32)) (x!23551 (_ BitVec 32))) (Undefined!963) (MissingVacant!963 (index!6025 (_ BitVec 32))) )
))
(declare-fun lt!117286 () SeekEntryResult!963)

(get-info :version)

(assert (=> b!232320 (= c!38627 ((_ is MissingVacant!963) lt!117286))))

(declare-fun e!150862 () Bool)

(declare-fun e!150860 () Bool)

(assert (=> b!232320 (= e!150862 e!150860)))

(declare-fun b!232321 () Bool)

(declare-fun e!150871 () Bool)

(assert (=> b!232321 (= e!150860 e!150871)))

(declare-fun res!114095 () Bool)

(declare-fun call!21599 () Bool)

(assert (=> b!232321 (= res!114095 call!21599)))

(assert (=> b!232321 (=> (not res!114095) (not e!150871))))

(declare-fun b!232322 () Bool)

(declare-fun e!150868 () Bool)

(declare-fun tp_is_empty!6117 () Bool)

(assert (=> b!232322 (= e!150868 tp_is_empty!6117)))

(declare-fun b!232323 () Bool)

(declare-fun call!21600 () Bool)

(assert (=> b!232323 (= e!150871 (not call!21600))))

(declare-fun b!232324 () Bool)

(declare-datatypes ((Unit!7173 0))(
  ( (Unit!7174) )
))
(declare-fun e!150866 () Unit!7173)

(declare-fun Unit!7175 () Unit!7173)

(assert (=> b!232324 (= e!150866 Unit!7175)))

(declare-fun lt!117284 () Unit!7173)

(declare-datatypes ((V!7803 0))(
  ( (V!7804 (val!3103 Int)) )
))
(declare-datatypes ((ValueCell!2715 0))(
  ( (ValueCellFull!2715 (v!5123 V!7803)) (EmptyCell!2715) )
))
(declare-datatypes ((array!11477 0))(
  ( (array!11478 (arr!5458 (Array (_ BitVec 32) ValueCell!2715)) (size!5791 (_ BitVec 32))) )
))
(declare-datatypes ((array!11479 0))(
  ( (array!11480 (arr!5459 (Array (_ BitVec 32) (_ BitVec 64))) (size!5792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3330 0))(
  ( (LongMapFixedSize!3331 (defaultEntry!4324 Int) (mask!10236 (_ BitVec 32)) (extraKeys!4061 (_ BitVec 32)) (zeroValue!4165 V!7803) (minValue!4165 V!7803) (_size!1714 (_ BitVec 32)) (_keys!6378 array!11479) (_values!4307 array!11477) (_vacant!1714 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3330)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!144 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7803 V!7803 (_ BitVec 64) (_ BitVec 32) Int) Unit!7173)

(assert (=> b!232324 (= lt!117284 (lemmaArrayContainsKeyThenInListMap!144 (_keys!6378 thiss!1504) (_values!4307 thiss!1504) (mask!10236 thiss!1504) (extraKeys!4061 thiss!1504) (zeroValue!4165 thiss!1504) (minValue!4165 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4324 thiss!1504)))))

(assert (=> b!232324 false))

(declare-fun b!232325 () Bool)

(declare-fun e!150869 () Unit!7173)

(declare-fun Unit!7176 () Unit!7173)

(assert (=> b!232325 (= e!150869 Unit!7176)))

(declare-fun lt!117290 () Unit!7173)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!309 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7803 V!7803 (_ BitVec 64) Int) Unit!7173)

(assert (=> b!232325 (= lt!117290 (lemmaInListMapThenSeekEntryOrOpenFindsIt!309 (_keys!6378 thiss!1504) (_values!4307 thiss!1504) (mask!10236 thiss!1504) (extraKeys!4061 thiss!1504) (zeroValue!4165 thiss!1504) (minValue!4165 thiss!1504) key!932 (defaultEntry!4324 thiss!1504)))))

(assert (=> b!232325 false))

(declare-fun b!232326 () Bool)

(declare-fun e!150864 () Bool)

(declare-fun e!150865 () Bool)

(assert (=> b!232326 (= e!150864 e!150865)))

(declare-fun res!114091 () Bool)

(assert (=> b!232326 (=> (not res!114091) (not e!150865))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232326 (= res!114091 (inRange!0 index!297 (mask!10236 thiss!1504)))))

(declare-fun lt!117288 () Unit!7173)

(assert (=> b!232326 (= lt!117288 e!150869)))

(declare-fun c!38628 () Bool)

(declare-datatypes ((tuple2!4580 0))(
  ( (tuple2!4581 (_1!2301 (_ BitVec 64)) (_2!2301 V!7803)) )
))
(declare-datatypes ((List!3497 0))(
  ( (Nil!3494) (Cons!3493 (h!4141 tuple2!4580) (t!8456 List!3497)) )
))
(declare-datatypes ((ListLongMap!3493 0))(
  ( (ListLongMap!3494 (toList!1762 List!3497)) )
))
(declare-fun lt!117285 () ListLongMap!3493)

(declare-fun contains!1630 (ListLongMap!3493 (_ BitVec 64)) Bool)

(assert (=> b!232326 (= c!38628 (contains!1630 lt!117285 key!932))))

(declare-fun getCurrentListMap!1290 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7803 V!7803 (_ BitVec 32) Int) ListLongMap!3493)

(assert (=> b!232326 (= lt!117285 (getCurrentListMap!1290 (_keys!6378 thiss!1504) (_values!4307 thiss!1504) (mask!10236 thiss!1504) (extraKeys!4061 thiss!1504) (zeroValue!4165 thiss!1504) (minValue!4165 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4324 thiss!1504)))))

(declare-fun b!232327 () Bool)

(declare-fun e!150861 () Bool)

(declare-fun mapRes!10345 () Bool)

(assert (=> b!232327 (= e!150861 (and e!150868 mapRes!10345))))

(declare-fun condMapEmpty!10345 () Bool)

(declare-fun mapDefault!10345 () ValueCell!2715)

(assert (=> b!232327 (= condMapEmpty!10345 (= (arr!5458 (_values!4307 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2715)) mapDefault!10345)))))

(declare-fun b!232328 () Bool)

(declare-fun Unit!7177 () Unit!7173)

(assert (=> b!232328 (= e!150866 Unit!7177)))

(declare-fun b!232329 () Bool)

(declare-fun res!114097 () Bool)

(declare-fun e!150859 () Bool)

(assert (=> b!232329 (=> (not res!114097) (not e!150859))))

(assert (=> b!232329 (= res!114097 (= (select (arr!5459 (_keys!6378 thiss!1504)) (index!6022 lt!117286)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21596 () Bool)

(declare-fun arrayContainsKey!0 (array!11479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21596 (= call!21600 (arrayContainsKey!0 (_keys!6378 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!114093 () Bool)

(declare-fun e!150867 () Bool)

(assert (=> start!22188 (=> (not res!114093) (not e!150867))))

(declare-fun valid!1319 (LongMapFixedSize!3330) Bool)

(assert (=> start!22188 (= res!114093 (valid!1319 thiss!1504))))

(assert (=> start!22188 e!150867))

(declare-fun e!150872 () Bool)

(assert (=> start!22188 e!150872))

(assert (=> start!22188 true))

(assert (=> start!22188 tp_is_empty!6117))

(declare-fun b!232330 () Bool)

(assert (=> b!232330 (= e!150867 e!150864)))

(declare-fun res!114096 () Bool)

(assert (=> b!232330 (=> (not res!114096) (not e!150864))))

(assert (=> b!232330 (= res!114096 (or (= lt!117286 (MissingZero!963 index!297)) (= lt!117286 (MissingVacant!963 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11479 (_ BitVec 32)) SeekEntryResult!963)

(assert (=> b!232330 (= lt!117286 (seekEntryOrOpen!0 key!932 (_keys!6378 thiss!1504) (mask!10236 thiss!1504)))))

(declare-fun mapIsEmpty!10345 () Bool)

(assert (=> mapIsEmpty!10345 mapRes!10345))

(declare-fun b!232331 () Bool)

(assert (=> b!232331 (= e!150865 (not true))))

(declare-fun lt!117283 () array!11479)

(declare-fun arrayCountValidKeys!0 (array!11479 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232331 (= (arrayCountValidKeys!0 lt!117283 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117289 () Unit!7173)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11479 (_ BitVec 32)) Unit!7173)

(assert (=> b!232331 (= lt!117289 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117283 index!297))))

(assert (=> b!232331 (arrayContainsKey!0 lt!117283 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117296 () Unit!7173)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11479 (_ BitVec 64) (_ BitVec 32)) Unit!7173)

(assert (=> b!232331 (= lt!117296 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117283 key!932 index!297))))

(declare-fun v!346 () V!7803)

(declare-fun +!624 (ListLongMap!3493 tuple2!4580) ListLongMap!3493)

(assert (=> b!232331 (= (+!624 lt!117285 (tuple2!4581 key!932 v!346)) (getCurrentListMap!1290 lt!117283 (array!11478 (store (arr!5458 (_values!4307 thiss!1504)) index!297 (ValueCellFull!2715 v!346)) (size!5791 (_values!4307 thiss!1504))) (mask!10236 thiss!1504) (extraKeys!4061 thiss!1504) (zeroValue!4165 thiss!1504) (minValue!4165 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4324 thiss!1504)))))

(declare-fun lt!117295 () Unit!7173)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!78 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7803 V!7803 (_ BitVec 32) (_ BitVec 64) V!7803 Int) Unit!7173)

(assert (=> b!232331 (= lt!117295 (lemmaAddValidKeyToArrayThenAddPairToListMap!78 (_keys!6378 thiss!1504) (_values!4307 thiss!1504) (mask!10236 thiss!1504) (extraKeys!4061 thiss!1504) (zeroValue!4165 thiss!1504) (minValue!4165 thiss!1504) index!297 key!932 v!346 (defaultEntry!4324 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11479 (_ BitVec 32)) Bool)

(assert (=> b!232331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117283 (mask!10236 thiss!1504))))

(declare-fun lt!117294 () Unit!7173)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11479 (_ BitVec 32) (_ BitVec 32)) Unit!7173)

(assert (=> b!232331 (= lt!117294 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6378 thiss!1504) index!297 (mask!10236 thiss!1504)))))

(assert (=> b!232331 (= (arrayCountValidKeys!0 lt!117283 #b00000000000000000000000000000000 (size!5792 (_keys!6378 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6378 thiss!1504) #b00000000000000000000000000000000 (size!5792 (_keys!6378 thiss!1504)))))))

(declare-fun lt!117291 () Unit!7173)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11479 (_ BitVec 32) (_ BitVec 64)) Unit!7173)

(assert (=> b!232331 (= lt!117291 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6378 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3498 0))(
  ( (Nil!3495) (Cons!3494 (h!4142 (_ BitVec 64)) (t!8457 List!3498)) )
))
(declare-fun arrayNoDuplicates!0 (array!11479 (_ BitVec 32) List!3498) Bool)

(assert (=> b!232331 (arrayNoDuplicates!0 lt!117283 #b00000000000000000000000000000000 Nil!3495)))

(assert (=> b!232331 (= lt!117283 (array!11480 (store (arr!5459 (_keys!6378 thiss!1504)) index!297 key!932) (size!5792 (_keys!6378 thiss!1504))))))

(declare-fun lt!117287 () Unit!7173)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3498) Unit!7173)

(assert (=> b!232331 (= lt!117287 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6378 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3495))))

(declare-fun lt!117293 () Unit!7173)

(assert (=> b!232331 (= lt!117293 e!150866)))

(declare-fun c!38626 () Bool)

(assert (=> b!232331 (= c!38626 (arrayContainsKey!0 (_keys!6378 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3597 (array!11479) Bool)

(declare-fun array_inv!3598 (array!11477) Bool)

(assert (=> b!232332 (= e!150872 (and tp!21907 tp_is_empty!6117 (array_inv!3597 (_keys!6378 thiss!1504)) (array_inv!3598 (_values!4307 thiss!1504)) e!150861))))

(declare-fun b!232333 () Bool)

(declare-fun res!114094 () Bool)

(assert (=> b!232333 (= res!114094 (= (select (arr!5459 (_keys!6378 thiss!1504)) (index!6025 lt!117286)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232333 (=> (not res!114094) (not e!150871))))

(declare-fun b!232334 () Bool)

(declare-fun res!114090 () Bool)

(assert (=> b!232334 (=> (not res!114090) (not e!150867))))

(assert (=> b!232334 (= res!114090 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10345 () Bool)

(declare-fun tp!21906 () Bool)

(declare-fun e!150863 () Bool)

(assert (=> mapNonEmpty!10345 (= mapRes!10345 (and tp!21906 e!150863))))

(declare-fun mapKey!10345 () (_ BitVec 32))

(declare-fun mapRest!10345 () (Array (_ BitVec 32) ValueCell!2715))

(declare-fun mapValue!10345 () ValueCell!2715)

(assert (=> mapNonEmpty!10345 (= (arr!5458 (_values!4307 thiss!1504)) (store mapRest!10345 mapKey!10345 mapValue!10345))))

(declare-fun b!232335 () Bool)

(assert (=> b!232335 (= e!150860 ((_ is Undefined!963) lt!117286))))

(declare-fun b!232336 () Bool)

(assert (=> b!232336 (= e!150859 (not call!21600))))

(declare-fun b!232337 () Bool)

(declare-fun lt!117292 () Unit!7173)

(assert (=> b!232337 (= e!150869 lt!117292)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!326 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7803 V!7803 (_ BitVec 64) Int) Unit!7173)

(assert (=> b!232337 (= lt!117292 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!326 (_keys!6378 thiss!1504) (_values!4307 thiss!1504) (mask!10236 thiss!1504) (extraKeys!4061 thiss!1504) (zeroValue!4165 thiss!1504) (minValue!4165 thiss!1504) key!932 (defaultEntry!4324 thiss!1504)))))

(declare-fun c!38625 () Bool)

(assert (=> b!232337 (= c!38625 ((_ is MissingZero!963) lt!117286))))

(assert (=> b!232337 e!150862))

(declare-fun bm!21597 () Bool)

(assert (=> bm!21597 (= call!21599 (inRange!0 (ite c!38625 (index!6022 lt!117286) (index!6025 lt!117286)) (mask!10236 thiss!1504)))))

(declare-fun b!232338 () Bool)

(declare-fun res!114092 () Bool)

(assert (=> b!232338 (=> (not res!114092) (not e!150859))))

(assert (=> b!232338 (= res!114092 call!21599)))

(assert (=> b!232338 (= e!150862 e!150859)))

(declare-fun b!232339 () Bool)

(assert (=> b!232339 (= e!150863 tp_is_empty!6117)))

(assert (= (and start!22188 res!114093) b!232334))

(assert (= (and b!232334 res!114090) b!232330))

(assert (= (and b!232330 res!114096) b!232326))

(assert (= (and b!232326 c!38628) b!232325))

(assert (= (and b!232326 (not c!38628)) b!232337))

(assert (= (and b!232337 c!38625) b!232338))

(assert (= (and b!232337 (not c!38625)) b!232320))

(assert (= (and b!232338 res!114092) b!232329))

(assert (= (and b!232329 res!114097) b!232336))

(assert (= (and b!232320 c!38627) b!232321))

(assert (= (and b!232320 (not c!38627)) b!232335))

(assert (= (and b!232321 res!114095) b!232333))

(assert (= (and b!232333 res!114094) b!232323))

(assert (= (or b!232338 b!232321) bm!21597))

(assert (= (or b!232336 b!232323) bm!21596))

(assert (= (and b!232326 res!114091) b!232331))

(assert (= (and b!232331 c!38626) b!232324))

(assert (= (and b!232331 (not c!38626)) b!232328))

(assert (= (and b!232327 condMapEmpty!10345) mapIsEmpty!10345))

(assert (= (and b!232327 (not condMapEmpty!10345)) mapNonEmpty!10345))

(assert (= (and mapNonEmpty!10345 ((_ is ValueCellFull!2715) mapValue!10345)) b!232339))

(assert (= (and b!232327 ((_ is ValueCellFull!2715) mapDefault!10345)) b!232322))

(assert (= b!232332 b!232327))

(assert (= start!22188 b!232332))

(declare-fun m!253741 () Bool)

(assert (=> b!232332 m!253741))

(declare-fun m!253743 () Bool)

(assert (=> b!232332 m!253743))

(declare-fun m!253745 () Bool)

(assert (=> b!232329 m!253745))

(declare-fun m!253747 () Bool)

(assert (=> bm!21597 m!253747))

(declare-fun m!253749 () Bool)

(assert (=> b!232330 m!253749))

(declare-fun m!253751 () Bool)

(assert (=> b!232325 m!253751))

(declare-fun m!253753 () Bool)

(assert (=> b!232324 m!253753))

(declare-fun m!253755 () Bool)

(assert (=> b!232331 m!253755))

(declare-fun m!253757 () Bool)

(assert (=> b!232331 m!253757))

(declare-fun m!253759 () Bool)

(assert (=> b!232331 m!253759))

(declare-fun m!253761 () Bool)

(assert (=> b!232331 m!253761))

(declare-fun m!253763 () Bool)

(assert (=> b!232331 m!253763))

(declare-fun m!253765 () Bool)

(assert (=> b!232331 m!253765))

(declare-fun m!253767 () Bool)

(assert (=> b!232331 m!253767))

(declare-fun m!253769 () Bool)

(assert (=> b!232331 m!253769))

(declare-fun m!253771 () Bool)

(assert (=> b!232331 m!253771))

(declare-fun m!253773 () Bool)

(assert (=> b!232331 m!253773))

(declare-fun m!253775 () Bool)

(assert (=> b!232331 m!253775))

(declare-fun m!253777 () Bool)

(assert (=> b!232331 m!253777))

(declare-fun m!253779 () Bool)

(assert (=> b!232331 m!253779))

(declare-fun m!253781 () Bool)

(assert (=> b!232331 m!253781))

(declare-fun m!253783 () Bool)

(assert (=> b!232331 m!253783))

(declare-fun m!253785 () Bool)

(assert (=> b!232331 m!253785))

(declare-fun m!253787 () Bool)

(assert (=> b!232331 m!253787))

(assert (=> bm!21596 m!253755))

(declare-fun m!253789 () Bool)

(assert (=> mapNonEmpty!10345 m!253789))

(declare-fun m!253791 () Bool)

(assert (=> b!232337 m!253791))

(declare-fun m!253793 () Bool)

(assert (=> start!22188 m!253793))

(declare-fun m!253795 () Bool)

(assert (=> b!232333 m!253795))

(declare-fun m!253797 () Bool)

(assert (=> b!232326 m!253797))

(declare-fun m!253799 () Bool)

(assert (=> b!232326 m!253799))

(declare-fun m!253801 () Bool)

(assert (=> b!232326 m!253801))

(check-sat (not mapNonEmpty!10345) (not b!232324) (not bm!21596) b_and!13153 (not b!232331) (not start!22188) (not b_next!6255) (not b!232330) tp_is_empty!6117 (not b!232325) (not b!232332) (not b!232326) (not bm!21597) (not b!232337))
(check-sat b_and!13153 (not b_next!6255))
