; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22172 () Bool)

(assert start!22172)

(declare-fun b!231778 () Bool)

(declare-fun b_free!6235 () Bool)

(declare-fun b_next!6235 () Bool)

(assert (=> b!231778 (= b_free!6235 (not b_next!6235))))

(declare-fun tp!21847 () Bool)

(declare-fun b_and!13147 () Bool)

(assert (=> b!231778 (= tp!21847 b_and!13147)))

(declare-fun b!231767 () Bool)

(declare-datatypes ((Unit!7116 0))(
  ( (Unit!7117) )
))
(declare-fun e!150476 () Unit!7116)

(declare-fun lt!116932 () Unit!7116)

(assert (=> b!231767 (= e!150476 lt!116932)))

(declare-datatypes ((V!7777 0))(
  ( (V!7778 (val!3093 Int)) )
))
(declare-datatypes ((ValueCell!2705 0))(
  ( (ValueCellFull!2705 (v!5114 V!7777)) (EmptyCell!2705) )
))
(declare-datatypes ((array!11435 0))(
  ( (array!11436 (arr!5437 (Array (_ BitVec 32) ValueCell!2705)) (size!5770 (_ BitVec 32))) )
))
(declare-datatypes ((array!11437 0))(
  ( (array!11438 (arr!5438 (Array (_ BitVec 32) (_ BitVec 64))) (size!5771 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3310 0))(
  ( (LongMapFixedSize!3311 (defaultEntry!4314 Int) (mask!10220 (_ BitVec 32)) (extraKeys!4051 (_ BitVec 32)) (zeroValue!4155 V!7777) (minValue!4155 V!7777) (_size!1704 (_ BitVec 32)) (_keys!6368 array!11437) (_values!4297 array!11435) (_vacant!1704 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3310)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!302 (array!11437 array!11435 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) Int) Unit!7116)

(assert (=> b!231767 (= lt!116932 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!302 (_keys!6368 thiss!1504) (_values!4297 thiss!1504) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 (defaultEntry!4314 thiss!1504)))))

(declare-fun c!38520 () Bool)

(declare-datatypes ((SeekEntryResult!923 0))(
  ( (MissingZero!923 (index!5862 (_ BitVec 32))) (Found!923 (index!5863 (_ BitVec 32))) (Intermediate!923 (undefined!1735 Bool) (index!5864 (_ BitVec 32)) (x!23487 (_ BitVec 32))) (Undefined!923) (MissingVacant!923 (index!5865 (_ BitVec 32))) )
))
(declare-fun lt!116929 () SeekEntryResult!923)

(get-info :version)

(assert (=> b!231767 (= c!38520 ((_ is MissingZero!923) lt!116929))))

(declare-fun e!150464 () Bool)

(assert (=> b!231767 e!150464))

(declare-fun b!231768 () Bool)

(declare-fun e!150471 () Bool)

(declare-fun tp_is_empty!6097 () Bool)

(assert (=> b!231768 (= e!150471 tp_is_empty!6097)))

(declare-fun b!231769 () Bool)

(declare-fun e!150474 () Bool)

(declare-fun call!21527 () Bool)

(assert (=> b!231769 (= e!150474 (not call!21527))))

(declare-fun b!231770 () Bool)

(declare-fun res!113872 () Bool)

(declare-fun e!150472 () Bool)

(assert (=> b!231770 (=> (not res!113872) (not e!150472))))

(declare-fun call!21528 () Bool)

(assert (=> b!231770 (= res!113872 call!21528)))

(assert (=> b!231770 (= e!150464 e!150472)))

(declare-fun b!231771 () Bool)

(declare-fun e!150469 () Bool)

(assert (=> b!231771 (= e!150469 tp_is_empty!6097)))

(declare-fun b!231772 () Bool)

(declare-fun e!150467 () Bool)

(declare-fun e!150470 () Bool)

(assert (=> b!231772 (= e!150467 e!150470)))

(declare-fun res!113876 () Bool)

(assert (=> b!231772 (=> (not res!113876) (not e!150470))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231772 (= res!113876 (or (= lt!116929 (MissingZero!923 index!297)) (= lt!116929 (MissingVacant!923 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11437 (_ BitVec 32)) SeekEntryResult!923)

(assert (=> b!231772 (= lt!116929 (seekEntryOrOpen!0 key!932 (_keys!6368 thiss!1504) (mask!10220 thiss!1504)))))

(declare-fun b!231773 () Bool)

(declare-fun e!150473 () Bool)

(assert (=> b!231773 (= e!150473 ((_ is Undefined!923) lt!116929))))

(declare-fun b!231774 () Bool)

(declare-fun e!150465 () Bool)

(assert (=> b!231774 (= e!150465 (not true))))

(declare-fun lt!116923 () array!11437)

(declare-fun arrayCountValidKeys!0 (array!11437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231774 (= (arrayCountValidKeys!0 lt!116923 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116933 () Unit!7116)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11437 (_ BitVec 32)) Unit!7116)

(assert (=> b!231774 (= lt!116933 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116923 index!297))))

(declare-fun arrayContainsKey!0 (array!11437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231774 (arrayContainsKey!0 lt!116923 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116928 () Unit!7116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11437 (_ BitVec 64) (_ BitVec 32)) Unit!7116)

(assert (=> b!231774 (= lt!116928 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116923 key!932 index!297))))

(declare-datatypes ((tuple2!4492 0))(
  ( (tuple2!4493 (_1!2257 (_ BitVec 64)) (_2!2257 V!7777)) )
))
(declare-datatypes ((List!3401 0))(
  ( (Nil!3398) (Cons!3397 (h!4045 tuple2!4492) (t!8352 List!3401)) )
))
(declare-datatypes ((ListLongMap!3407 0))(
  ( (ListLongMap!3408 (toList!1719 List!3401)) )
))
(declare-fun lt!116935 () ListLongMap!3407)

(declare-fun v!346 () V!7777)

(declare-fun +!614 (ListLongMap!3407 tuple2!4492) ListLongMap!3407)

(declare-fun getCurrentListMap!1251 (array!11437 array!11435 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 32) Int) ListLongMap!3407)

(assert (=> b!231774 (= (+!614 lt!116935 (tuple2!4493 key!932 v!346)) (getCurrentListMap!1251 lt!116923 (array!11436 (store (arr!5437 (_values!4297 thiss!1504)) index!297 (ValueCellFull!2705 v!346)) (size!5770 (_values!4297 thiss!1504))) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4314 thiss!1504)))))

(declare-fun lt!116927 () Unit!7116)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!73 (array!11437 array!11435 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 32) (_ BitVec 64) V!7777 Int) Unit!7116)

(assert (=> b!231774 (= lt!116927 (lemmaAddValidKeyToArrayThenAddPairToListMap!73 (_keys!6368 thiss!1504) (_values!4297 thiss!1504) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) index!297 key!932 v!346 (defaultEntry!4314 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11437 (_ BitVec 32)) Bool)

(assert (=> b!231774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116923 (mask!10220 thiss!1504))))

(declare-fun lt!116934 () Unit!7116)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11437 (_ BitVec 32) (_ BitVec 32)) Unit!7116)

(assert (=> b!231774 (= lt!116934 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6368 thiss!1504) index!297 (mask!10220 thiss!1504)))))

(assert (=> b!231774 (= (arrayCountValidKeys!0 lt!116923 #b00000000000000000000000000000000 (size!5771 (_keys!6368 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6368 thiss!1504) #b00000000000000000000000000000000 (size!5771 (_keys!6368 thiss!1504)))))))

(declare-fun lt!116926 () Unit!7116)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11437 (_ BitVec 32) (_ BitVec 64)) Unit!7116)

(assert (=> b!231774 (= lt!116926 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6368 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3402 0))(
  ( (Nil!3399) (Cons!3398 (h!4046 (_ BitVec 64)) (t!8353 List!3402)) )
))
(declare-fun arrayNoDuplicates!0 (array!11437 (_ BitVec 32) List!3402) Bool)

(assert (=> b!231774 (arrayNoDuplicates!0 lt!116923 #b00000000000000000000000000000000 Nil!3399)))

(assert (=> b!231774 (= lt!116923 (array!11438 (store (arr!5438 (_keys!6368 thiss!1504)) index!297 key!932) (size!5771 (_keys!6368 thiss!1504))))))

(declare-fun lt!116924 () Unit!7116)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3402) Unit!7116)

(assert (=> b!231774 (= lt!116924 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6368 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3399))))

(declare-fun lt!116931 () Unit!7116)

(declare-fun e!150463 () Unit!7116)

(assert (=> b!231774 (= lt!116931 e!150463)))

(declare-fun c!38521 () Bool)

(assert (=> b!231774 (= c!38521 (arrayContainsKey!0 (_keys!6368 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231775 () Bool)

(declare-fun res!113873 () Bool)

(assert (=> b!231775 (=> (not res!113873) (not e!150467))))

(assert (=> b!231775 (= res!113873 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21524 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21524 (= call!21528 (inRange!0 (ite c!38520 (index!5862 lt!116929) (index!5865 lt!116929)) (mask!10220 thiss!1504)))))

(declare-fun b!231776 () Bool)

(assert (=> b!231776 (= e!150472 (not call!21527))))

(declare-fun bm!21525 () Bool)

(assert (=> bm!21525 (= call!21527 (arrayContainsKey!0 (_keys!6368 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231777 () Bool)

(declare-fun res!113874 () Bool)

(assert (=> b!231777 (= res!113874 (= (select (arr!5438 (_keys!6368 thiss!1504)) (index!5865 lt!116929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231777 (=> (not res!113874) (not e!150474))))

(declare-fun e!150475 () Bool)

(declare-fun e!150468 () Bool)

(declare-fun array_inv!3567 (array!11437) Bool)

(declare-fun array_inv!3568 (array!11435) Bool)

(assert (=> b!231778 (= e!150468 (and tp!21847 tp_is_empty!6097 (array_inv!3567 (_keys!6368 thiss!1504)) (array_inv!3568 (_values!4297 thiss!1504)) e!150475))))

(declare-fun b!231779 () Bool)

(declare-fun Unit!7118 () Unit!7116)

(assert (=> b!231779 (= e!150463 Unit!7118)))

(declare-fun b!231780 () Bool)

(declare-fun Unit!7119 () Unit!7116)

(assert (=> b!231780 (= e!150476 Unit!7119)))

(declare-fun lt!116922 () Unit!7116)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!307 (array!11437 array!11435 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) Int) Unit!7116)

(assert (=> b!231780 (= lt!116922 (lemmaInListMapThenSeekEntryOrOpenFindsIt!307 (_keys!6368 thiss!1504) (_values!4297 thiss!1504) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 (defaultEntry!4314 thiss!1504)))))

(assert (=> b!231780 false))

(declare-fun b!231781 () Bool)

(declare-fun res!113877 () Bool)

(assert (=> b!231781 (=> (not res!113877) (not e!150472))))

(assert (=> b!231781 (= res!113877 (= (select (arr!5438 (_keys!6368 thiss!1504)) (index!5862 lt!116929)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231782 () Bool)

(declare-fun mapRes!10315 () Bool)

(assert (=> b!231782 (= e!150475 (and e!150471 mapRes!10315))))

(declare-fun condMapEmpty!10315 () Bool)

(declare-fun mapDefault!10315 () ValueCell!2705)

(assert (=> b!231782 (= condMapEmpty!10315 (= (arr!5437 (_values!4297 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2705)) mapDefault!10315)))))

(declare-fun res!113871 () Bool)

(assert (=> start!22172 (=> (not res!113871) (not e!150467))))

(declare-fun valid!1328 (LongMapFixedSize!3310) Bool)

(assert (=> start!22172 (= res!113871 (valid!1328 thiss!1504))))

(assert (=> start!22172 e!150467))

(assert (=> start!22172 e!150468))

(assert (=> start!22172 true))

(assert (=> start!22172 tp_is_empty!6097))

(declare-fun b!231783 () Bool)

(assert (=> b!231783 (= e!150470 e!150465)))

(declare-fun res!113878 () Bool)

(assert (=> b!231783 (=> (not res!113878) (not e!150465))))

(assert (=> b!231783 (= res!113878 (inRange!0 index!297 (mask!10220 thiss!1504)))))

(declare-fun lt!116925 () Unit!7116)

(assert (=> b!231783 (= lt!116925 e!150476)))

(declare-fun c!38518 () Bool)

(declare-fun contains!1605 (ListLongMap!3407 (_ BitVec 64)) Bool)

(assert (=> b!231783 (= c!38518 (contains!1605 lt!116935 key!932))))

(assert (=> b!231783 (= lt!116935 (getCurrentListMap!1251 (_keys!6368 thiss!1504) (_values!4297 thiss!1504) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4314 thiss!1504)))))

(declare-fun b!231784 () Bool)

(declare-fun c!38519 () Bool)

(assert (=> b!231784 (= c!38519 ((_ is MissingVacant!923) lt!116929))))

(assert (=> b!231784 (= e!150464 e!150473)))

(declare-fun b!231785 () Bool)

(declare-fun Unit!7120 () Unit!7116)

(assert (=> b!231785 (= e!150463 Unit!7120)))

(declare-fun lt!116930 () Unit!7116)

(declare-fun lemmaArrayContainsKeyThenInListMap!143 (array!11437 array!11435 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) (_ BitVec 32) Int) Unit!7116)

(assert (=> b!231785 (= lt!116930 (lemmaArrayContainsKeyThenInListMap!143 (_keys!6368 thiss!1504) (_values!4297 thiss!1504) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4314 thiss!1504)))))

(assert (=> b!231785 false))

(declare-fun mapIsEmpty!10315 () Bool)

(assert (=> mapIsEmpty!10315 mapRes!10315))

(declare-fun b!231786 () Bool)

(assert (=> b!231786 (= e!150473 e!150474)))

(declare-fun res!113875 () Bool)

(assert (=> b!231786 (= res!113875 call!21528)))

(assert (=> b!231786 (=> (not res!113875) (not e!150474))))

(declare-fun mapNonEmpty!10315 () Bool)

(declare-fun tp!21846 () Bool)

(assert (=> mapNonEmpty!10315 (= mapRes!10315 (and tp!21846 e!150469))))

(declare-fun mapRest!10315 () (Array (_ BitVec 32) ValueCell!2705))

(declare-fun mapKey!10315 () (_ BitVec 32))

(declare-fun mapValue!10315 () ValueCell!2705)

(assert (=> mapNonEmpty!10315 (= (arr!5437 (_values!4297 thiss!1504)) (store mapRest!10315 mapKey!10315 mapValue!10315))))

(assert (= (and start!22172 res!113871) b!231775))

(assert (= (and b!231775 res!113873) b!231772))

(assert (= (and b!231772 res!113876) b!231783))

(assert (= (and b!231783 c!38518) b!231780))

(assert (= (and b!231783 (not c!38518)) b!231767))

(assert (= (and b!231767 c!38520) b!231770))

(assert (= (and b!231767 (not c!38520)) b!231784))

(assert (= (and b!231770 res!113872) b!231781))

(assert (= (and b!231781 res!113877) b!231776))

(assert (= (and b!231784 c!38519) b!231786))

(assert (= (and b!231784 (not c!38519)) b!231773))

(assert (= (and b!231786 res!113875) b!231777))

(assert (= (and b!231777 res!113874) b!231769))

(assert (= (or b!231770 b!231786) bm!21524))

(assert (= (or b!231776 b!231769) bm!21525))

(assert (= (and b!231783 res!113878) b!231774))

(assert (= (and b!231774 c!38521) b!231785))

(assert (= (and b!231774 (not c!38521)) b!231779))

(assert (= (and b!231782 condMapEmpty!10315) mapIsEmpty!10315))

(assert (= (and b!231782 (not condMapEmpty!10315)) mapNonEmpty!10315))

(assert (= (and mapNonEmpty!10315 ((_ is ValueCellFull!2705) mapValue!10315)) b!231771))

(assert (= (and b!231782 ((_ is ValueCellFull!2705) mapDefault!10315)) b!231768))

(assert (= b!231778 b!231782))

(assert (= start!22172 b!231778))

(declare-fun m!253303 () Bool)

(assert (=> b!231781 m!253303))

(declare-fun m!253305 () Bool)

(assert (=> b!231772 m!253305))

(declare-fun m!253307 () Bool)

(assert (=> b!231774 m!253307))

(declare-fun m!253309 () Bool)

(assert (=> b!231774 m!253309))

(declare-fun m!253311 () Bool)

(assert (=> b!231774 m!253311))

(declare-fun m!253313 () Bool)

(assert (=> b!231774 m!253313))

(declare-fun m!253315 () Bool)

(assert (=> b!231774 m!253315))

(declare-fun m!253317 () Bool)

(assert (=> b!231774 m!253317))

(declare-fun m!253319 () Bool)

(assert (=> b!231774 m!253319))

(declare-fun m!253321 () Bool)

(assert (=> b!231774 m!253321))

(declare-fun m!253323 () Bool)

(assert (=> b!231774 m!253323))

(declare-fun m!253325 () Bool)

(assert (=> b!231774 m!253325))

(declare-fun m!253327 () Bool)

(assert (=> b!231774 m!253327))

(declare-fun m!253329 () Bool)

(assert (=> b!231774 m!253329))

(declare-fun m!253331 () Bool)

(assert (=> b!231774 m!253331))

(declare-fun m!253333 () Bool)

(assert (=> b!231774 m!253333))

(declare-fun m!253335 () Bool)

(assert (=> b!231774 m!253335))

(declare-fun m!253337 () Bool)

(assert (=> b!231774 m!253337))

(declare-fun m!253339 () Bool)

(assert (=> b!231774 m!253339))

(declare-fun m!253341 () Bool)

(assert (=> b!231777 m!253341))

(declare-fun m!253343 () Bool)

(assert (=> b!231778 m!253343))

(declare-fun m!253345 () Bool)

(assert (=> b!231778 m!253345))

(declare-fun m!253347 () Bool)

(assert (=> bm!21524 m!253347))

(declare-fun m!253349 () Bool)

(assert (=> b!231767 m!253349))

(declare-fun m!253351 () Bool)

(assert (=> b!231785 m!253351))

(declare-fun m!253353 () Bool)

(assert (=> start!22172 m!253353))

(assert (=> bm!21525 m!253331))

(declare-fun m!253355 () Bool)

(assert (=> mapNonEmpty!10315 m!253355))

(declare-fun m!253357 () Bool)

(assert (=> b!231780 m!253357))

(declare-fun m!253359 () Bool)

(assert (=> b!231783 m!253359))

(declare-fun m!253361 () Bool)

(assert (=> b!231783 m!253361))

(declare-fun m!253363 () Bool)

(assert (=> b!231783 m!253363))

(check-sat tp_is_empty!6097 (not b!231767) (not bm!21525) (not b!231772) (not b!231778) (not b!231783) (not b!231785) (not bm!21524) b_and!13147 (not mapNonEmpty!10315) (not b_next!6235) (not start!22172) (not b!231774) (not b!231780))
(check-sat b_and!13147 (not b_next!6235))
