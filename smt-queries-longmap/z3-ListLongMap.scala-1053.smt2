; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22002 () Bool)

(assert start!22002)

(declare-fun b!226275 () Bool)

(declare-fun b_free!6069 () Bool)

(declare-fun b_next!6069 () Bool)

(assert (=> b!226275 (= b_free!6069 (not b_next!6069))))

(declare-fun tp!21349 () Bool)

(declare-fun b_and!12967 () Bool)

(assert (=> b!226275 (= tp!21349 b_and!12967)))

(declare-fun b!226252 () Bool)

(declare-fun res!111382 () Bool)

(declare-fun e!146809 () Bool)

(assert (=> b!226252 (=> res!111382 e!146809)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226252 (= res!111382 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226253 () Bool)

(declare-datatypes ((Unit!6838 0))(
  ( (Unit!6839) )
))
(declare-fun e!146806 () Unit!6838)

(declare-fun Unit!6840 () Unit!6838)

(assert (=> b!226253 (= e!146806 Unit!6840)))

(declare-fun lt!113905 () Unit!6838)

(declare-datatypes ((V!7555 0))(
  ( (V!7556 (val!3010 Int)) )
))
(declare-datatypes ((ValueCell!2622 0))(
  ( (ValueCellFull!2622 (v!5030 V!7555)) (EmptyCell!2622) )
))
(declare-datatypes ((array!11105 0))(
  ( (array!11106 (arr!5272 (Array (_ BitVec 32) ValueCell!2622)) (size!5605 (_ BitVec 32))) )
))
(declare-datatypes ((array!11107 0))(
  ( (array!11108 (arr!5273 (Array (_ BitVec 32) (_ BitVec 64))) (size!5606 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3144 0))(
  ( (LongMapFixedSize!3145 (defaultEntry!4231 Int) (mask!10081 (_ BitVec 32)) (extraKeys!3968 (_ BitVec 32)) (zeroValue!4072 V!7555) (minValue!4072 V!7555) (_size!1621 (_ BitVec 32)) (_keys!6285 array!11107) (_values!4214 array!11105) (_vacant!1621 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3144)

(declare-fun lemmaArrayContainsKeyThenInListMap!93 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7555 V!7555 (_ BitVec 64) (_ BitVec 32) Int) Unit!6838)

(assert (=> b!226253 (= lt!113905 (lemmaArrayContainsKeyThenInListMap!93 (_keys!6285 thiss!1504) (_values!4214 thiss!1504) (mask!10081 thiss!1504) (extraKeys!3968 thiss!1504) (zeroValue!4072 thiss!1504) (minValue!4072 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4231 thiss!1504)))))

(assert (=> b!226253 false))

(declare-fun b!226254 () Bool)

(assert (=> b!226254 (= e!146809 true)))

(declare-fun lt!113908 () Bool)

(declare-datatypes ((List!3370 0))(
  ( (Nil!3367) (Cons!3366 (h!4014 (_ BitVec 64)) (t!8329 List!3370)) )
))
(declare-fun arrayNoDuplicates!0 (array!11107 (_ BitVec 32) List!3370) Bool)

(assert (=> b!226254 (= lt!113908 (arrayNoDuplicates!0 (_keys!6285 thiss!1504) #b00000000000000000000000000000000 Nil!3367))))

(declare-fun b!226255 () Bool)

(declare-fun e!146812 () Bool)

(declare-fun e!146810 () Bool)

(assert (=> b!226255 (= e!146812 e!146810)))

(declare-fun res!111372 () Bool)

(assert (=> b!226255 (=> (not res!111372) (not e!146810))))

(declare-datatypes ((SeekEntryResult!880 0))(
  ( (MissingZero!880 (index!5690 (_ BitVec 32))) (Found!880 (index!5691 (_ BitVec 32))) (Intermediate!880 (undefined!1692 Bool) (index!5692 (_ BitVec 32)) (x!23220 (_ BitVec 32))) (Undefined!880) (MissingVacant!880 (index!5693 (_ BitVec 32))) )
))
(declare-fun lt!113909 () SeekEntryResult!880)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226255 (= res!111372 (or (= lt!113909 (MissingZero!880 index!297)) (= lt!113909 (MissingVacant!880 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11107 (_ BitVec 32)) SeekEntryResult!880)

(assert (=> b!226255 (= lt!113909 (seekEntryOrOpen!0 key!932 (_keys!6285 thiss!1504) (mask!10081 thiss!1504)))))

(declare-fun c!37511 () Bool)

(declare-fun call!21042 () Bool)

(declare-fun bm!21038 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21038 (= call!21042 (inRange!0 (ite c!37511 (index!5690 lt!113909) (index!5693 lt!113909)) (mask!10081 thiss!1504)))))

(declare-fun b!226256 () Bool)

(declare-fun e!146817 () Bool)

(get-info :version)

(assert (=> b!226256 (= e!146817 ((_ is Undefined!880) lt!113909))))

(declare-fun b!226257 () Bool)

(declare-fun e!146805 () Bool)

(declare-fun tp_is_empty!5931 () Bool)

(assert (=> b!226257 (= e!146805 tp_is_empty!5931)))

(declare-fun b!226258 () Bool)

(declare-fun e!146815 () Bool)

(declare-fun mapRes!10066 () Bool)

(assert (=> b!226258 (= e!146815 (and e!146805 mapRes!10066))))

(declare-fun condMapEmpty!10066 () Bool)

(declare-fun mapDefault!10066 () ValueCell!2622)

(assert (=> b!226258 (= condMapEmpty!10066 (= (arr!5272 (_values!4214 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2622)) mapDefault!10066)))))

(declare-fun mapIsEmpty!10066 () Bool)

(assert (=> mapIsEmpty!10066 mapRes!10066))

(declare-fun b!226259 () Bool)

(declare-fun e!146807 () Unit!6838)

(declare-fun Unit!6841 () Unit!6838)

(assert (=> b!226259 (= e!146807 Unit!6841)))

(declare-fun lt!113904 () Unit!6838)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!255 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7555 V!7555 (_ BitVec 64) Int) Unit!6838)

(assert (=> b!226259 (= lt!113904 (lemmaInListMapThenSeekEntryOrOpenFindsIt!255 (_keys!6285 thiss!1504) (_values!4214 thiss!1504) (mask!10081 thiss!1504) (extraKeys!3968 thiss!1504) (zeroValue!4072 thiss!1504) (minValue!4072 thiss!1504) key!932 (defaultEntry!4231 thiss!1504)))))

(assert (=> b!226259 false))

(declare-fun b!226260 () Bool)

(declare-fun res!111380 () Bool)

(assert (=> b!226260 (=> res!111380 e!146809)))

(declare-fun lt!113911 () Bool)

(assert (=> b!226260 (= res!111380 lt!113911)))

(declare-fun b!226261 () Bool)

(declare-fun res!111375 () Bool)

(declare-fun e!146811 () Bool)

(assert (=> b!226261 (=> (not res!111375) (not e!146811))))

(assert (=> b!226261 (= res!111375 call!21042)))

(declare-fun e!146808 () Bool)

(assert (=> b!226261 (= e!146808 e!146811)))

(declare-fun b!226262 () Bool)

(declare-fun Unit!6842 () Unit!6838)

(assert (=> b!226262 (= e!146806 Unit!6842)))

(declare-fun b!226263 () Bool)

(declare-fun res!111381 () Bool)

(assert (=> b!226263 (=> res!111381 e!146809)))

(assert (=> b!226263 (= res!111381 (or (not (= (size!5606 (_keys!6285 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10081 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5606 (_keys!6285 thiss!1504)))))))

(declare-fun b!226264 () Bool)

(declare-fun e!146813 () Bool)

(assert (=> b!226264 (= e!146813 (not e!146809))))

(declare-fun res!111378 () Bool)

(assert (=> b!226264 (=> res!111378 e!146809)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226264 (= res!111378 (not (validMask!0 (mask!10081 thiss!1504))))))

(declare-fun lt!113903 () array!11107)

(declare-fun arrayCountValidKeys!0 (array!11107 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226264 (= (arrayCountValidKeys!0 lt!113903 #b00000000000000000000000000000000 (size!5606 (_keys!6285 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6285 thiss!1504) #b00000000000000000000000000000000 (size!5606 (_keys!6285 thiss!1504)))))))

(declare-fun lt!113912 () Unit!6838)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11107 (_ BitVec 32) (_ BitVec 64)) Unit!6838)

(assert (=> b!226264 (= lt!113912 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6285 thiss!1504) index!297 key!932))))

(assert (=> b!226264 (arrayNoDuplicates!0 lt!113903 #b00000000000000000000000000000000 Nil!3367)))

(assert (=> b!226264 (= lt!113903 (array!11108 (store (arr!5273 (_keys!6285 thiss!1504)) index!297 key!932) (size!5606 (_keys!6285 thiss!1504))))))

(declare-fun lt!113906 () Unit!6838)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3370) Unit!6838)

(assert (=> b!226264 (= lt!113906 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6285 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3367))))

(declare-fun lt!113902 () Unit!6838)

(assert (=> b!226264 (= lt!113902 e!146806)))

(declare-fun c!37509 () Bool)

(assert (=> b!226264 (= c!37509 lt!113911)))

(declare-fun arrayContainsKey!0 (array!11107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226264 (= lt!113911 (arrayContainsKey!0 (_keys!6285 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226265 () Bool)

(declare-fun res!111379 () Bool)

(assert (=> b!226265 (=> res!111379 e!146809)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11107 (_ BitVec 32)) Bool)

(assert (=> b!226265 (= res!111379 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6285 thiss!1504) (mask!10081 thiss!1504))))))

(declare-fun bm!21039 () Bool)

(declare-fun call!21041 () Bool)

(assert (=> bm!21039 (= call!21041 (arrayContainsKey!0 (_keys!6285 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226266 () Bool)

(declare-fun e!146816 () Bool)

(assert (=> b!226266 (= e!146817 e!146816)))

(declare-fun res!111376 () Bool)

(assert (=> b!226266 (= res!111376 call!21042)))

(assert (=> b!226266 (=> (not res!111376) (not e!146816))))

(declare-fun b!226267 () Bool)

(declare-fun res!111373 () Bool)

(assert (=> b!226267 (=> (not res!111373) (not e!146811))))

(assert (=> b!226267 (= res!111373 (= (select (arr!5273 (_keys!6285 thiss!1504)) (index!5690 lt!113909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226268 () Bool)

(declare-fun res!111377 () Bool)

(assert (=> b!226268 (= res!111377 (= (select (arr!5273 (_keys!6285 thiss!1504)) (index!5693 lt!113909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226268 (=> (not res!111377) (not e!146816))))

(declare-fun b!226269 () Bool)

(declare-fun lt!113910 () Unit!6838)

(assert (=> b!226269 (= e!146807 lt!113910)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!267 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7555 V!7555 (_ BitVec 64) Int) Unit!6838)

(assert (=> b!226269 (= lt!113910 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!267 (_keys!6285 thiss!1504) (_values!4214 thiss!1504) (mask!10081 thiss!1504) (extraKeys!3968 thiss!1504) (zeroValue!4072 thiss!1504) (minValue!4072 thiss!1504) key!932 (defaultEntry!4231 thiss!1504)))))

(assert (=> b!226269 (= c!37511 ((_ is MissingZero!880) lt!113909))))

(assert (=> b!226269 e!146808))

(declare-fun res!111374 () Bool)

(assert (=> start!22002 (=> (not res!111374) (not e!146812))))

(declare-fun valid!1265 (LongMapFixedSize!3144) Bool)

(assert (=> start!22002 (= res!111374 (valid!1265 thiss!1504))))

(assert (=> start!22002 e!146812))

(declare-fun e!146819 () Bool)

(assert (=> start!22002 e!146819))

(assert (=> start!22002 true))

(declare-fun mapNonEmpty!10066 () Bool)

(declare-fun tp!21348 () Bool)

(declare-fun e!146814 () Bool)

(assert (=> mapNonEmpty!10066 (= mapRes!10066 (and tp!21348 e!146814))))

(declare-fun mapValue!10066 () ValueCell!2622)

(declare-fun mapRest!10066 () (Array (_ BitVec 32) ValueCell!2622))

(declare-fun mapKey!10066 () (_ BitVec 32))

(assert (=> mapNonEmpty!10066 (= (arr!5272 (_values!4214 thiss!1504)) (store mapRest!10066 mapKey!10066 mapValue!10066))))

(declare-fun b!226270 () Bool)

(assert (=> b!226270 (= e!146816 (not call!21041))))

(declare-fun b!226271 () Bool)

(assert (=> b!226271 (= e!146814 tp_is_empty!5931)))

(declare-fun b!226272 () Bool)

(declare-fun res!111371 () Bool)

(assert (=> b!226272 (=> (not res!111371) (not e!146812))))

(assert (=> b!226272 (= res!111371 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226273 () Bool)

(assert (=> b!226273 (= e!146811 (not call!21041))))

(declare-fun b!226274 () Bool)

(declare-fun c!37510 () Bool)

(assert (=> b!226274 (= c!37510 ((_ is MissingVacant!880) lt!113909))))

(assert (=> b!226274 (= e!146808 e!146817)))

(declare-fun array_inv!3487 (array!11107) Bool)

(declare-fun array_inv!3488 (array!11105) Bool)

(assert (=> b!226275 (= e!146819 (and tp!21349 tp_is_empty!5931 (array_inv!3487 (_keys!6285 thiss!1504)) (array_inv!3488 (_values!4214 thiss!1504)) e!146815))))

(declare-fun b!226276 () Bool)

(assert (=> b!226276 (= e!146810 e!146813)))

(declare-fun res!111370 () Bool)

(assert (=> b!226276 (=> (not res!111370) (not e!146813))))

(assert (=> b!226276 (= res!111370 (inRange!0 index!297 (mask!10081 thiss!1504)))))

(declare-fun lt!113907 () Unit!6838)

(assert (=> b!226276 (= lt!113907 e!146807)))

(declare-fun c!37512 () Bool)

(declare-datatypes ((tuple2!4454 0))(
  ( (tuple2!4455 (_1!2238 (_ BitVec 64)) (_2!2238 V!7555)) )
))
(declare-datatypes ((List!3371 0))(
  ( (Nil!3368) (Cons!3367 (h!4015 tuple2!4454) (t!8330 List!3371)) )
))
(declare-datatypes ((ListLongMap!3367 0))(
  ( (ListLongMap!3368 (toList!1699 List!3371)) )
))
(declare-fun contains!1573 (ListLongMap!3367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1227 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7555 V!7555 (_ BitVec 32) Int) ListLongMap!3367)

(assert (=> b!226276 (= c!37512 (contains!1573 (getCurrentListMap!1227 (_keys!6285 thiss!1504) (_values!4214 thiss!1504) (mask!10081 thiss!1504) (extraKeys!3968 thiss!1504) (zeroValue!4072 thiss!1504) (minValue!4072 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4231 thiss!1504)) key!932))))

(assert (= (and start!22002 res!111374) b!226272))

(assert (= (and b!226272 res!111371) b!226255))

(assert (= (and b!226255 res!111372) b!226276))

(assert (= (and b!226276 c!37512) b!226259))

(assert (= (and b!226276 (not c!37512)) b!226269))

(assert (= (and b!226269 c!37511) b!226261))

(assert (= (and b!226269 (not c!37511)) b!226274))

(assert (= (and b!226261 res!111375) b!226267))

(assert (= (and b!226267 res!111373) b!226273))

(assert (= (and b!226274 c!37510) b!226266))

(assert (= (and b!226274 (not c!37510)) b!226256))

(assert (= (and b!226266 res!111376) b!226268))

(assert (= (and b!226268 res!111377) b!226270))

(assert (= (or b!226261 b!226266) bm!21038))

(assert (= (or b!226273 b!226270) bm!21039))

(assert (= (and b!226276 res!111370) b!226264))

(assert (= (and b!226264 c!37509) b!226253))

(assert (= (and b!226264 (not c!37509)) b!226262))

(assert (= (and b!226264 (not res!111378)) b!226263))

(assert (= (and b!226263 (not res!111381)) b!226252))

(assert (= (and b!226252 (not res!111382)) b!226260))

(assert (= (and b!226260 (not res!111380)) b!226265))

(assert (= (and b!226265 (not res!111379)) b!226254))

(assert (= (and b!226258 condMapEmpty!10066) mapIsEmpty!10066))

(assert (= (and b!226258 (not condMapEmpty!10066)) mapNonEmpty!10066))

(assert (= (and mapNonEmpty!10066 ((_ is ValueCellFull!2622) mapValue!10066)) b!226271))

(assert (= (and b!226258 ((_ is ValueCellFull!2622) mapDefault!10066)) b!226257))

(assert (= b!226275 b!226258))

(assert (= start!22002 b!226275))

(declare-fun m!248599 () Bool)

(assert (=> bm!21039 m!248599))

(declare-fun m!248601 () Bool)

(assert (=> b!226267 m!248601))

(declare-fun m!248603 () Bool)

(assert (=> b!226255 m!248603))

(declare-fun m!248605 () Bool)

(assert (=> mapNonEmpty!10066 m!248605))

(declare-fun m!248607 () Bool)

(assert (=> b!226254 m!248607))

(declare-fun m!248609 () Bool)

(assert (=> b!226264 m!248609))

(assert (=> b!226264 m!248599))

(declare-fun m!248611 () Bool)

(assert (=> b!226264 m!248611))

(declare-fun m!248613 () Bool)

(assert (=> b!226264 m!248613))

(declare-fun m!248615 () Bool)

(assert (=> b!226264 m!248615))

(declare-fun m!248617 () Bool)

(assert (=> b!226264 m!248617))

(declare-fun m!248619 () Bool)

(assert (=> b!226264 m!248619))

(declare-fun m!248621 () Bool)

(assert (=> b!226264 m!248621))

(declare-fun m!248623 () Bool)

(assert (=> b!226265 m!248623))

(declare-fun m!248625 () Bool)

(assert (=> b!226259 m!248625))

(declare-fun m!248627 () Bool)

(assert (=> start!22002 m!248627))

(declare-fun m!248629 () Bool)

(assert (=> bm!21038 m!248629))

(declare-fun m!248631 () Bool)

(assert (=> b!226269 m!248631))

(declare-fun m!248633 () Bool)

(assert (=> b!226275 m!248633))

(declare-fun m!248635 () Bool)

(assert (=> b!226275 m!248635))

(declare-fun m!248637 () Bool)

(assert (=> b!226268 m!248637))

(declare-fun m!248639 () Bool)

(assert (=> b!226252 m!248639))

(declare-fun m!248641 () Bool)

(assert (=> b!226253 m!248641))

(declare-fun m!248643 () Bool)

(assert (=> b!226276 m!248643))

(declare-fun m!248645 () Bool)

(assert (=> b!226276 m!248645))

(assert (=> b!226276 m!248645))

(declare-fun m!248647 () Bool)

(assert (=> b!226276 m!248647))

(check-sat (not b!226255) tp_is_empty!5931 (not b!226252) (not b_next!6069) (not b!226254) (not b!226264) (not b!226269) b_and!12967 (not mapNonEmpty!10066) (not b!226276) (not bm!21039) (not b!226253) (not b!226275) (not b!226259) (not b!226265) (not start!22002) (not bm!21038))
(check-sat b_and!12967 (not b_next!6069))
