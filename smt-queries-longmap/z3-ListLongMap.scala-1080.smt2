; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22166 () Bool)

(assert start!22166)

(declare-fun b!231602 () Bool)

(declare-fun b_free!6229 () Bool)

(declare-fun b_next!6229 () Bool)

(assert (=> b!231602 (= b_free!6229 (not b_next!6229))))

(declare-fun tp!21828 () Bool)

(declare-fun b_and!13141 () Bool)

(assert (=> b!231602 (= tp!21828 b_and!13141)))

(declare-fun b!231587 () Bool)

(declare-datatypes ((Unit!7108 0))(
  ( (Unit!7109) )
))
(declare-fun e!150347 () Unit!7108)

(declare-fun Unit!7110 () Unit!7108)

(assert (=> b!231587 (= e!150347 Unit!7110)))

(declare-fun lt!116809 () Unit!7108)

(declare-datatypes ((V!7769 0))(
  ( (V!7770 (val!3090 Int)) )
))
(declare-datatypes ((ValueCell!2702 0))(
  ( (ValueCellFull!2702 (v!5111 V!7769)) (EmptyCell!2702) )
))
(declare-datatypes ((array!11423 0))(
  ( (array!11424 (arr!5431 (Array (_ BitVec 32) ValueCell!2702)) (size!5764 (_ BitVec 32))) )
))
(declare-datatypes ((array!11425 0))(
  ( (array!11426 (arr!5432 (Array (_ BitVec 32) (_ BitVec 64))) (size!5765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3304 0))(
  ( (LongMapFixedSize!3305 (defaultEntry!4311 Int) (mask!10215 (_ BitVec 32)) (extraKeys!4048 (_ BitVec 32)) (zeroValue!4152 V!7769) (minValue!4152 V!7769) (_size!1701 (_ BitVec 32)) (_keys!6365 array!11425) (_values!4294 array!11423) (_vacant!1701 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3304)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!305 (array!11425 array!11423 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 64) Int) Unit!7108)

(assert (=> b!231587 (= lt!116809 (lemmaInListMapThenSeekEntryOrOpenFindsIt!305 (_keys!6365 thiss!1504) (_values!4294 thiss!1504) (mask!10215 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) key!932 (defaultEntry!4311 thiss!1504)))))

(assert (=> b!231587 false))

(declare-fun b!231588 () Bool)

(declare-fun e!150348 () Unit!7108)

(declare-fun Unit!7111 () Unit!7108)

(assert (=> b!231588 (= e!150348 Unit!7111)))

(declare-fun b!231589 () Bool)

(declare-fun Unit!7112 () Unit!7108)

(assert (=> b!231589 (= e!150348 Unit!7112)))

(declare-fun lt!116798 () Unit!7108)

(declare-fun lemmaArrayContainsKeyThenInListMap!142 (array!11425 array!11423 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 64) (_ BitVec 32) Int) Unit!7108)

(assert (=> b!231589 (= lt!116798 (lemmaArrayContainsKeyThenInListMap!142 (_keys!6365 thiss!1504) (_values!4294 thiss!1504) (mask!10215 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4311 thiss!1504)))))

(assert (=> b!231589 false))

(declare-fun b!231590 () Bool)

(declare-fun e!150350 () Bool)

(declare-fun e!150343 () Bool)

(assert (=> b!231590 (= e!150350 e!150343)))

(declare-fun res!113799 () Bool)

(assert (=> b!231590 (=> (not res!113799) (not e!150343))))

(declare-datatypes ((SeekEntryResult!921 0))(
  ( (MissingZero!921 (index!5854 (_ BitVec 32))) (Found!921 (index!5855 (_ BitVec 32))) (Intermediate!921 (undefined!1733 Bool) (index!5856 (_ BitVec 32)) (x!23477 (_ BitVec 32))) (Undefined!921) (MissingVacant!921 (index!5857 (_ BitVec 32))) )
))
(declare-fun lt!116805 () SeekEntryResult!921)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231590 (= res!113799 (or (= lt!116805 (MissingZero!921 index!297)) (= lt!116805 (MissingVacant!921 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11425 (_ BitVec 32)) SeekEntryResult!921)

(assert (=> b!231590 (= lt!116805 (seekEntryOrOpen!0 key!932 (_keys!6365 thiss!1504) (mask!10215 thiss!1504)))))

(declare-fun b!231591 () Bool)

(declare-fun e!150342 () Bool)

(declare-fun e!150339 () Bool)

(assert (=> b!231591 (= e!150342 e!150339)))

(declare-fun res!113804 () Bool)

(declare-fun call!21509 () Bool)

(assert (=> b!231591 (= res!113804 call!21509)))

(assert (=> b!231591 (=> (not res!113804) (not e!150339))))

(declare-fun bm!21506 () Bool)

(declare-fun c!38483 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21506 (= call!21509 (inRange!0 (ite c!38483 (index!5854 lt!116805) (index!5857 lt!116805)) (mask!10215 thiss!1504)))))

(declare-fun b!231592 () Bool)

(declare-fun res!113806 () Bool)

(assert (=> b!231592 (=> (not res!113806) (not e!150350))))

(assert (=> b!231592 (= res!113806 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231593 () Bool)

(declare-fun res!113800 () Bool)

(declare-fun e!150340 () Bool)

(assert (=> b!231593 (=> (not res!113800) (not e!150340))))

(assert (=> b!231593 (= res!113800 (= (select (arr!5432 (_keys!6365 thiss!1504)) (index!5854 lt!116805)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!113802 () Bool)

(assert (=> start!22166 (=> (not res!113802) (not e!150350))))

(declare-fun valid!1326 (LongMapFixedSize!3304) Bool)

(assert (=> start!22166 (= res!113802 (valid!1326 thiss!1504))))

(assert (=> start!22166 e!150350))

(declare-fun e!150344 () Bool)

(assert (=> start!22166 e!150344))

(assert (=> start!22166 true))

(declare-fun tp_is_empty!6091 () Bool)

(assert (=> start!22166 tp_is_empty!6091))

(declare-fun b!231594 () Bool)

(declare-fun e!150349 () Bool)

(assert (=> b!231594 (= e!150349 tp_is_empty!6091)))

(declare-fun b!231595 () Bool)

(declare-fun e!150338 () Bool)

(declare-fun mapRes!10306 () Bool)

(assert (=> b!231595 (= e!150338 (and e!150349 mapRes!10306))))

(declare-fun condMapEmpty!10306 () Bool)

(declare-fun mapDefault!10306 () ValueCell!2702)

(assert (=> b!231595 (= condMapEmpty!10306 (= (arr!5431 (_values!4294 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2702)) mapDefault!10306)))))

(declare-fun b!231596 () Bool)

(declare-fun call!21510 () Bool)

(assert (=> b!231596 (= e!150339 (not call!21510))))

(declare-fun b!231597 () Bool)

(declare-fun lt!116802 () Unit!7108)

(assert (=> b!231597 (= e!150347 lt!116802)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!300 (array!11425 array!11423 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 64) Int) Unit!7108)

(assert (=> b!231597 (= lt!116802 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!300 (_keys!6365 thiss!1504) (_values!4294 thiss!1504) (mask!10215 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) key!932 (defaultEntry!4311 thiss!1504)))))

(get-info :version)

(assert (=> b!231597 (= c!38483 ((_ is MissingZero!921) lt!116805))))

(declare-fun e!150341 () Bool)

(assert (=> b!231597 e!150341))

(declare-fun b!231598 () Bool)

(assert (=> b!231598 (= e!150340 (not call!21510))))

(declare-fun b!231599 () Bool)

(assert (=> b!231599 (= e!150342 ((_ is Undefined!921) lt!116805))))

(declare-fun b!231600 () Bool)

(declare-fun e!150346 () Bool)

(assert (=> b!231600 (= e!150346 tp_is_empty!6091)))

(declare-fun mapNonEmpty!10306 () Bool)

(declare-fun tp!21829 () Bool)

(assert (=> mapNonEmpty!10306 (= mapRes!10306 (and tp!21829 e!150346))))

(declare-fun mapRest!10306 () (Array (_ BitVec 32) ValueCell!2702))

(declare-fun mapKey!10306 () (_ BitVec 32))

(declare-fun mapValue!10306 () ValueCell!2702)

(assert (=> mapNonEmpty!10306 (= (arr!5431 (_values!4294 thiss!1504)) (store mapRest!10306 mapKey!10306 mapValue!10306))))

(declare-fun b!231601 () Bool)

(declare-fun res!113803 () Bool)

(assert (=> b!231601 (=> (not res!113803) (not e!150340))))

(assert (=> b!231601 (= res!113803 call!21509)))

(assert (=> b!231601 (= e!150341 e!150340)))

(declare-fun bm!21507 () Bool)

(declare-fun arrayContainsKey!0 (array!11425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21507 (= call!21510 (arrayContainsKey!0 (_keys!6365 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3563 (array!11425) Bool)

(declare-fun array_inv!3564 (array!11423) Bool)

(assert (=> b!231602 (= e!150344 (and tp!21828 tp_is_empty!6091 (array_inv!3563 (_keys!6365 thiss!1504)) (array_inv!3564 (_values!4294 thiss!1504)) e!150338))))

(declare-fun b!231603 () Bool)

(declare-fun e!150345 () Bool)

(assert (=> b!231603 (= e!150345 (not true))))

(declare-fun lt!116803 () array!11425)

(declare-fun arrayCountValidKeys!0 (array!11425 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231603 (= (arrayCountValidKeys!0 lt!116803 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116807 () Unit!7108)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11425 (_ BitVec 32)) Unit!7108)

(assert (=> b!231603 (= lt!116807 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116803 index!297))))

(assert (=> b!231603 (arrayContainsKey!0 lt!116803 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116800 () Unit!7108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11425 (_ BitVec 64) (_ BitVec 32)) Unit!7108)

(assert (=> b!231603 (= lt!116800 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116803 key!932 index!297))))

(declare-fun v!346 () V!7769)

(declare-datatypes ((tuple2!4488 0))(
  ( (tuple2!4489 (_1!2255 (_ BitVec 64)) (_2!2255 V!7769)) )
))
(declare-datatypes ((List!3398 0))(
  ( (Nil!3395) (Cons!3394 (h!4042 tuple2!4488) (t!8349 List!3398)) )
))
(declare-datatypes ((ListLongMap!3403 0))(
  ( (ListLongMap!3404 (toList!1717 List!3398)) )
))
(declare-fun lt!116808 () ListLongMap!3403)

(declare-fun +!613 (ListLongMap!3403 tuple2!4488) ListLongMap!3403)

(declare-fun getCurrentListMap!1249 (array!11425 array!11423 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 32) Int) ListLongMap!3403)

(assert (=> b!231603 (= (+!613 lt!116808 (tuple2!4489 key!932 v!346)) (getCurrentListMap!1249 lt!116803 (array!11424 (store (arr!5431 (_values!4294 thiss!1504)) index!297 (ValueCellFull!2702 v!346)) (size!5764 (_values!4294 thiss!1504))) (mask!10215 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4311 thiss!1504)))))

(declare-fun lt!116797 () Unit!7108)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!72 (array!11425 array!11423 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 32) (_ BitVec 64) V!7769 Int) Unit!7108)

(assert (=> b!231603 (= lt!116797 (lemmaAddValidKeyToArrayThenAddPairToListMap!72 (_keys!6365 thiss!1504) (_values!4294 thiss!1504) (mask!10215 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) index!297 key!932 v!346 (defaultEntry!4311 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11425 (_ BitVec 32)) Bool)

(assert (=> b!231603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116803 (mask!10215 thiss!1504))))

(declare-fun lt!116804 () Unit!7108)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11425 (_ BitVec 32) (_ BitVec 32)) Unit!7108)

(assert (=> b!231603 (= lt!116804 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6365 thiss!1504) index!297 (mask!10215 thiss!1504)))))

(assert (=> b!231603 (= (arrayCountValidKeys!0 lt!116803 #b00000000000000000000000000000000 (size!5765 (_keys!6365 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6365 thiss!1504) #b00000000000000000000000000000000 (size!5765 (_keys!6365 thiss!1504)))))))

(declare-fun lt!116801 () Unit!7108)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11425 (_ BitVec 32) (_ BitVec 64)) Unit!7108)

(assert (=> b!231603 (= lt!116801 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6365 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3399 0))(
  ( (Nil!3396) (Cons!3395 (h!4043 (_ BitVec 64)) (t!8350 List!3399)) )
))
(declare-fun arrayNoDuplicates!0 (array!11425 (_ BitVec 32) List!3399) Bool)

(assert (=> b!231603 (arrayNoDuplicates!0 lt!116803 #b00000000000000000000000000000000 Nil!3396)))

(assert (=> b!231603 (= lt!116803 (array!11426 (store (arr!5432 (_keys!6365 thiss!1504)) index!297 key!932) (size!5765 (_keys!6365 thiss!1504))))))

(declare-fun lt!116806 () Unit!7108)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3399) Unit!7108)

(assert (=> b!231603 (= lt!116806 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6365 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3396))))

(declare-fun lt!116799 () Unit!7108)

(assert (=> b!231603 (= lt!116799 e!150348)))

(declare-fun c!38485 () Bool)

(assert (=> b!231603 (= c!38485 (arrayContainsKey!0 (_keys!6365 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231604 () Bool)

(declare-fun res!113805 () Bool)

(assert (=> b!231604 (= res!113805 (= (select (arr!5432 (_keys!6365 thiss!1504)) (index!5857 lt!116805)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231604 (=> (not res!113805) (not e!150339))))

(declare-fun mapIsEmpty!10306 () Bool)

(assert (=> mapIsEmpty!10306 mapRes!10306))

(declare-fun b!231605 () Bool)

(assert (=> b!231605 (= e!150343 e!150345)))

(declare-fun res!113801 () Bool)

(assert (=> b!231605 (=> (not res!113801) (not e!150345))))

(assert (=> b!231605 (= res!113801 (inRange!0 index!297 (mask!10215 thiss!1504)))))

(declare-fun lt!116796 () Unit!7108)

(assert (=> b!231605 (= lt!116796 e!150347)))

(declare-fun c!38484 () Bool)

(declare-fun contains!1603 (ListLongMap!3403 (_ BitVec 64)) Bool)

(assert (=> b!231605 (= c!38484 (contains!1603 lt!116808 key!932))))

(assert (=> b!231605 (= lt!116808 (getCurrentListMap!1249 (_keys!6365 thiss!1504) (_values!4294 thiss!1504) (mask!10215 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4311 thiss!1504)))))

(declare-fun b!231606 () Bool)

(declare-fun c!38482 () Bool)

(assert (=> b!231606 (= c!38482 ((_ is MissingVacant!921) lt!116805))))

(assert (=> b!231606 (= e!150341 e!150342)))

(assert (= (and start!22166 res!113802) b!231592))

(assert (= (and b!231592 res!113806) b!231590))

(assert (= (and b!231590 res!113799) b!231605))

(assert (= (and b!231605 c!38484) b!231587))

(assert (= (and b!231605 (not c!38484)) b!231597))

(assert (= (and b!231597 c!38483) b!231601))

(assert (= (and b!231597 (not c!38483)) b!231606))

(assert (= (and b!231601 res!113803) b!231593))

(assert (= (and b!231593 res!113800) b!231598))

(assert (= (and b!231606 c!38482) b!231591))

(assert (= (and b!231606 (not c!38482)) b!231599))

(assert (= (and b!231591 res!113804) b!231604))

(assert (= (and b!231604 res!113805) b!231596))

(assert (= (or b!231601 b!231591) bm!21506))

(assert (= (or b!231598 b!231596) bm!21507))

(assert (= (and b!231605 res!113801) b!231603))

(assert (= (and b!231603 c!38485) b!231589))

(assert (= (and b!231603 (not c!38485)) b!231588))

(assert (= (and b!231595 condMapEmpty!10306) mapIsEmpty!10306))

(assert (= (and b!231595 (not condMapEmpty!10306)) mapNonEmpty!10306))

(assert (= (and mapNonEmpty!10306 ((_ is ValueCellFull!2702) mapValue!10306)) b!231600))

(assert (= (and b!231595 ((_ is ValueCellFull!2702) mapDefault!10306)) b!231594))

(assert (= b!231602 b!231595))

(assert (= start!22166 b!231602))

(declare-fun m!253117 () Bool)

(assert (=> b!231603 m!253117))

(declare-fun m!253119 () Bool)

(assert (=> b!231603 m!253119))

(declare-fun m!253121 () Bool)

(assert (=> b!231603 m!253121))

(declare-fun m!253123 () Bool)

(assert (=> b!231603 m!253123))

(declare-fun m!253125 () Bool)

(assert (=> b!231603 m!253125))

(declare-fun m!253127 () Bool)

(assert (=> b!231603 m!253127))

(declare-fun m!253129 () Bool)

(assert (=> b!231603 m!253129))

(declare-fun m!253131 () Bool)

(assert (=> b!231603 m!253131))

(declare-fun m!253133 () Bool)

(assert (=> b!231603 m!253133))

(declare-fun m!253135 () Bool)

(assert (=> b!231603 m!253135))

(declare-fun m!253137 () Bool)

(assert (=> b!231603 m!253137))

(declare-fun m!253139 () Bool)

(assert (=> b!231603 m!253139))

(declare-fun m!253141 () Bool)

(assert (=> b!231603 m!253141))

(declare-fun m!253143 () Bool)

(assert (=> b!231603 m!253143))

(declare-fun m!253145 () Bool)

(assert (=> b!231603 m!253145))

(declare-fun m!253147 () Bool)

(assert (=> b!231603 m!253147))

(declare-fun m!253149 () Bool)

(assert (=> b!231603 m!253149))

(declare-fun m!253151 () Bool)

(assert (=> b!231605 m!253151))

(declare-fun m!253153 () Bool)

(assert (=> b!231605 m!253153))

(declare-fun m!253155 () Bool)

(assert (=> b!231605 m!253155))

(declare-fun m!253157 () Bool)

(assert (=> mapNonEmpty!10306 m!253157))

(declare-fun m!253159 () Bool)

(assert (=> bm!21506 m!253159))

(declare-fun m!253161 () Bool)

(assert (=> b!231589 m!253161))

(declare-fun m!253163 () Bool)

(assert (=> b!231597 m!253163))

(declare-fun m!253165 () Bool)

(assert (=> b!231604 m!253165))

(declare-fun m!253167 () Bool)

(assert (=> b!231593 m!253167))

(declare-fun m!253169 () Bool)

(assert (=> b!231587 m!253169))

(declare-fun m!253171 () Bool)

(assert (=> b!231590 m!253171))

(declare-fun m!253173 () Bool)

(assert (=> b!231602 m!253173))

(declare-fun m!253175 () Bool)

(assert (=> b!231602 m!253175))

(assert (=> bm!21507 m!253143))

(declare-fun m!253177 () Bool)

(assert (=> start!22166 m!253177))

(check-sat (not bm!21506) (not b!231602) (not b!231589) (not start!22166) (not b_next!6229) (not mapNonEmpty!10306) (not b!231603) (not b!231605) (not b!231597) (not bm!21507) tp_is_empty!6091 (not b!231590) b_and!13141 (not b!231587))
(check-sat b_and!13141 (not b_next!6229))
