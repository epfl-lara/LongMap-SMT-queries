; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22142 () Bool)

(assert start!22142)

(declare-fun b!230886 () Bool)

(declare-fun b_free!6205 () Bool)

(declare-fun b_next!6205 () Bool)

(assert (=> b!230886 (= b_free!6205 (not b_next!6205))))

(declare-fun tp!21756 () Bool)

(declare-fun b_and!13117 () Bool)

(assert (=> b!230886 (= tp!21756 b_and!13117)))

(declare-fun b!230867 () Bool)

(declare-fun e!149845 () Bool)

(declare-datatypes ((SeekEntryResult!909 0))(
  ( (MissingZero!909 (index!5806 (_ BitVec 32))) (Found!909 (index!5807 (_ BitVec 32))) (Intermediate!909 (undefined!1721 Bool) (index!5808 (_ BitVec 32)) (x!23433 (_ BitVec 32))) (Undefined!909) (MissingVacant!909 (index!5809 (_ BitVec 32))) )
))
(declare-fun lt!116298 () SeekEntryResult!909)

(get-info :version)

(assert (=> b!230867 (= e!149845 ((_ is Undefined!909) lt!116298))))

(declare-fun bm!21434 () Bool)

(declare-fun call!21438 () Bool)

(declare-datatypes ((V!7737 0))(
  ( (V!7738 (val!3078 Int)) )
))
(declare-datatypes ((ValueCell!2690 0))(
  ( (ValueCellFull!2690 (v!5099 V!7737)) (EmptyCell!2690) )
))
(declare-datatypes ((array!11375 0))(
  ( (array!11376 (arr!5407 (Array (_ BitVec 32) ValueCell!2690)) (size!5740 (_ BitVec 32))) )
))
(declare-datatypes ((array!11377 0))(
  ( (array!11378 (arr!5408 (Array (_ BitVec 32) (_ BitVec 64))) (size!5741 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3280 0))(
  ( (LongMapFixedSize!3281 (defaultEntry!4299 Int) (mask!10195 (_ BitVec 32)) (extraKeys!4036 (_ BitVec 32)) (zeroValue!4140 V!7737) (minValue!4140 V!7737) (_size!1689 (_ BitVec 32)) (_keys!6353 array!11377) (_values!4282 array!11375) (_vacant!1689 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3280)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21434 (= call!21438 (arrayContainsKey!0 (_keys!6353 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230868 () Bool)

(declare-fun e!149835 () Bool)

(declare-fun e!149846 () Bool)

(assert (=> b!230868 (= e!149835 e!149846)))

(declare-fun res!113516 () Bool)

(assert (=> b!230868 (=> (not res!113516) (not e!149846))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230868 (= res!113516 (inRange!0 index!297 (mask!10195 thiss!1504)))))

(declare-datatypes ((Unit!7065 0))(
  ( (Unit!7066) )
))
(declare-fun lt!116300 () Unit!7065)

(declare-fun e!149842 () Unit!7065)

(assert (=> b!230868 (= lt!116300 e!149842)))

(declare-fun c!38339 () Bool)

(declare-datatypes ((tuple2!4468 0))(
  ( (tuple2!4469 (_1!2245 (_ BitVec 64)) (_2!2245 V!7737)) )
))
(declare-datatypes ((List!3381 0))(
  ( (Nil!3378) (Cons!3377 (h!4025 tuple2!4468) (t!8332 List!3381)) )
))
(declare-datatypes ((ListLongMap!3383 0))(
  ( (ListLongMap!3384 (toList!1707 List!3381)) )
))
(declare-fun lt!116303 () ListLongMap!3383)

(declare-fun contains!1595 (ListLongMap!3383 (_ BitVec 64)) Bool)

(assert (=> b!230868 (= c!38339 (contains!1595 lt!116303 key!932))))

(declare-fun getCurrentListMap!1239 (array!11377 array!11375 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 32) Int) ListLongMap!3383)

(assert (=> b!230868 (= lt!116303 (getCurrentListMap!1239 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(declare-fun mapNonEmpty!10270 () Bool)

(declare-fun mapRes!10270 () Bool)

(declare-fun tp!21757 () Bool)

(declare-fun e!149843 () Bool)

(assert (=> mapNonEmpty!10270 (= mapRes!10270 (and tp!21757 e!149843))))

(declare-fun mapValue!10270 () ValueCell!2690)

(declare-fun mapRest!10270 () (Array (_ BitVec 32) ValueCell!2690))

(declare-fun mapKey!10270 () (_ BitVec 32))

(assert (=> mapNonEmpty!10270 (= (arr!5407 (_values!4282 thiss!1504)) (store mapRest!10270 mapKey!10270 mapValue!10270))))

(declare-fun b!230869 () Bool)

(declare-fun e!149836 () Bool)

(assert (=> b!230869 (= e!149836 (not call!21438))))

(declare-fun b!230870 () Bool)

(declare-fun res!113514 () Bool)

(declare-fun e!149839 () Bool)

(assert (=> b!230870 (=> (not res!113514) (not e!149839))))

(declare-fun call!21437 () Bool)

(assert (=> b!230870 (= res!113514 call!21437)))

(declare-fun e!149844 () Bool)

(assert (=> b!230870 (= e!149844 e!149839)))

(declare-fun b!230871 () Bool)

(declare-fun c!38340 () Bool)

(assert (=> b!230871 (= c!38340 ((_ is MissingVacant!909) lt!116298))))

(assert (=> b!230871 (= e!149844 e!149845)))

(declare-fun b!230872 () Bool)

(declare-fun e!149838 () Bool)

(assert (=> b!230872 (= e!149838 e!149835)))

(declare-fun res!113511 () Bool)

(assert (=> b!230872 (=> (not res!113511) (not e!149835))))

(assert (=> b!230872 (= res!113511 (or (= lt!116298 (MissingZero!909 index!297)) (= lt!116298 (MissingVacant!909 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11377 (_ BitVec 32)) SeekEntryResult!909)

(assert (=> b!230872 (= lt!116298 (seekEntryOrOpen!0 key!932 (_keys!6353 thiss!1504) (mask!10195 thiss!1504)))))

(declare-fun bm!21435 () Bool)

(declare-fun c!38338 () Bool)

(assert (=> bm!21435 (= call!21437 (inRange!0 (ite c!38338 (index!5806 lt!116298) (index!5809 lt!116298)) (mask!10195 thiss!1504)))))

(declare-fun b!230873 () Bool)

(assert (=> b!230873 (= e!149839 (not call!21438))))

(declare-fun b!230874 () Bool)

(declare-fun res!113517 () Bool)

(assert (=> b!230874 (= res!113517 (= (select (arr!5408 (_keys!6353 thiss!1504)) (index!5809 lt!116298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230874 (=> (not res!113517) (not e!149836))))

(declare-fun b!230875 () Bool)

(declare-fun lt!116304 () Unit!7065)

(assert (=> b!230875 (= e!149842 lt!116304)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!291 (array!11377 array!11375 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) Int) Unit!7065)

(assert (=> b!230875 (= lt!116304 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!291 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230875 (= c!38338 ((_ is MissingZero!909) lt!116298))))

(assert (=> b!230875 e!149844))

(declare-fun b!230876 () Bool)

(declare-fun res!113515 () Bool)

(assert (=> b!230876 (=> (not res!113515) (not e!149839))))

(assert (=> b!230876 (= res!113515 (= (select (arr!5408 (_keys!6353 thiss!1504)) (index!5806 lt!116298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10270 () Bool)

(assert (=> mapIsEmpty!10270 mapRes!10270))

(declare-fun b!230877 () Bool)

(declare-fun e!149833 () Bool)

(declare-fun tp_is_empty!6067 () Bool)

(assert (=> b!230877 (= e!149833 tp_is_empty!6067)))

(declare-fun b!230878 () Bool)

(assert (=> b!230878 (= e!149846 (not true))))

(declare-fun lt!116296 () array!11377)

(declare-fun arrayCountValidKeys!0 (array!11377 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230878 (= (arrayCountValidKeys!0 lt!116296 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116294 () Unit!7065)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11377 (_ BitVec 32)) Unit!7065)

(assert (=> b!230878 (= lt!116294 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116296 index!297))))

(assert (=> b!230878 (arrayContainsKey!0 lt!116296 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116295 () Unit!7065)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11377 (_ BitVec 64) (_ BitVec 32)) Unit!7065)

(assert (=> b!230878 (= lt!116295 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116296 key!932 index!297))))

(declare-fun v!346 () V!7737)

(declare-fun +!606 (ListLongMap!3383 tuple2!4468) ListLongMap!3383)

(assert (=> b!230878 (= (+!606 lt!116303 (tuple2!4469 key!932 v!346)) (getCurrentListMap!1239 lt!116296 (array!11376 (store (arr!5407 (_values!4282 thiss!1504)) index!297 (ValueCellFull!2690 v!346)) (size!5740 (_values!4282 thiss!1504))) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(declare-fun lt!116297 () Unit!7065)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!65 (array!11377 array!11375 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 32) (_ BitVec 64) V!7737 Int) Unit!7065)

(assert (=> b!230878 (= lt!116297 (lemmaAddValidKeyToArrayThenAddPairToListMap!65 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) index!297 key!932 v!346 (defaultEntry!4299 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11377 (_ BitVec 32)) Bool)

(assert (=> b!230878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116296 (mask!10195 thiss!1504))))

(declare-fun lt!116301 () Unit!7065)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11377 (_ BitVec 32) (_ BitVec 32)) Unit!7065)

(assert (=> b!230878 (= lt!116301 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6353 thiss!1504) index!297 (mask!10195 thiss!1504)))))

(assert (=> b!230878 (= (arrayCountValidKeys!0 lt!116296 #b00000000000000000000000000000000 (size!5741 (_keys!6353 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6353 thiss!1504) #b00000000000000000000000000000000 (size!5741 (_keys!6353 thiss!1504)))))))

(declare-fun lt!116293 () Unit!7065)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11377 (_ BitVec 32) (_ BitVec 64)) Unit!7065)

(assert (=> b!230878 (= lt!116293 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6353 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3382 0))(
  ( (Nil!3379) (Cons!3378 (h!4026 (_ BitVec 64)) (t!8333 List!3382)) )
))
(declare-fun arrayNoDuplicates!0 (array!11377 (_ BitVec 32) List!3382) Bool)

(assert (=> b!230878 (arrayNoDuplicates!0 lt!116296 #b00000000000000000000000000000000 Nil!3379)))

(assert (=> b!230878 (= lt!116296 (array!11378 (store (arr!5408 (_keys!6353 thiss!1504)) index!297 key!932) (size!5741 (_keys!6353 thiss!1504))))))

(declare-fun lt!116302 () Unit!7065)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3382) Unit!7065)

(assert (=> b!230878 (= lt!116302 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6353 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3379))))

(declare-fun lt!116292 () Unit!7065)

(declare-fun e!149837 () Unit!7065)

(assert (=> b!230878 (= lt!116292 e!149837)))

(declare-fun c!38341 () Bool)

(assert (=> b!230878 (= c!38341 (arrayContainsKey!0 (_keys!6353 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230879 () Bool)

(declare-fun Unit!7067 () Unit!7065)

(assert (=> b!230879 (= e!149842 Unit!7067)))

(declare-fun lt!116299 () Unit!7065)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!299 (array!11377 array!11375 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) Int) Unit!7065)

(assert (=> b!230879 (= lt!116299 (lemmaInListMapThenSeekEntryOrOpenFindsIt!299 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230879 false))

(declare-fun b!230880 () Bool)

(declare-fun e!149840 () Bool)

(assert (=> b!230880 (= e!149840 (and e!149833 mapRes!10270))))

(declare-fun condMapEmpty!10270 () Bool)

(declare-fun mapDefault!10270 () ValueCell!2690)

(assert (=> b!230880 (= condMapEmpty!10270 (= (arr!5407 (_values!4282 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2690)) mapDefault!10270)))))

(declare-fun b!230881 () Bool)

(declare-fun Unit!7068 () Unit!7065)

(assert (=> b!230881 (= e!149837 Unit!7068)))

(declare-fun lt!116305 () Unit!7065)

(declare-fun lemmaArrayContainsKeyThenInListMap!135 (array!11377 array!11375 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) (_ BitVec 32) Int) Unit!7065)

(assert (=> b!230881 (= lt!116305 (lemmaArrayContainsKeyThenInListMap!135 (_keys!6353 thiss!1504) (_values!4282 thiss!1504) (mask!10195 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230881 false))

(declare-fun b!230882 () Bool)

(declare-fun res!113512 () Bool)

(assert (=> b!230882 (=> (not res!113512) (not e!149838))))

(assert (=> b!230882 (= res!113512 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!113513 () Bool)

(assert (=> start!22142 (=> (not res!113513) (not e!149838))))

(declare-fun valid!1318 (LongMapFixedSize!3280) Bool)

(assert (=> start!22142 (= res!113513 (valid!1318 thiss!1504))))

(assert (=> start!22142 e!149838))

(declare-fun e!149834 () Bool)

(assert (=> start!22142 e!149834))

(assert (=> start!22142 true))

(assert (=> start!22142 tp_is_empty!6067))

(declare-fun b!230883 () Bool)

(assert (=> b!230883 (= e!149845 e!149836)))

(declare-fun res!113518 () Bool)

(assert (=> b!230883 (= res!113518 call!21437)))

(assert (=> b!230883 (=> (not res!113518) (not e!149836))))

(declare-fun b!230884 () Bool)

(declare-fun Unit!7069 () Unit!7065)

(assert (=> b!230884 (= e!149837 Unit!7069)))

(declare-fun b!230885 () Bool)

(assert (=> b!230885 (= e!149843 tp_is_empty!6067)))

(declare-fun array_inv!3549 (array!11377) Bool)

(declare-fun array_inv!3550 (array!11375) Bool)

(assert (=> b!230886 (= e!149834 (and tp!21756 tp_is_empty!6067 (array_inv!3549 (_keys!6353 thiss!1504)) (array_inv!3550 (_values!4282 thiss!1504)) e!149840))))

(assert (= (and start!22142 res!113513) b!230882))

(assert (= (and b!230882 res!113512) b!230872))

(assert (= (and b!230872 res!113511) b!230868))

(assert (= (and b!230868 c!38339) b!230879))

(assert (= (and b!230868 (not c!38339)) b!230875))

(assert (= (and b!230875 c!38338) b!230870))

(assert (= (and b!230875 (not c!38338)) b!230871))

(assert (= (and b!230870 res!113514) b!230876))

(assert (= (and b!230876 res!113515) b!230873))

(assert (= (and b!230871 c!38340) b!230883))

(assert (= (and b!230871 (not c!38340)) b!230867))

(assert (= (and b!230883 res!113518) b!230874))

(assert (= (and b!230874 res!113517) b!230869))

(assert (= (or b!230870 b!230883) bm!21435))

(assert (= (or b!230873 b!230869) bm!21434))

(assert (= (and b!230868 res!113516) b!230878))

(assert (= (and b!230878 c!38341) b!230881))

(assert (= (and b!230878 (not c!38341)) b!230884))

(assert (= (and b!230880 condMapEmpty!10270) mapIsEmpty!10270))

(assert (= (and b!230880 (not condMapEmpty!10270)) mapNonEmpty!10270))

(assert (= (and mapNonEmpty!10270 ((_ is ValueCellFull!2690) mapValue!10270)) b!230885))

(assert (= (and b!230880 ((_ is ValueCellFull!2690) mapDefault!10270)) b!230877))

(assert (= b!230886 b!230880))

(assert (= start!22142 b!230886))

(declare-fun m!252373 () Bool)

(assert (=> b!230876 m!252373))

(declare-fun m!252375 () Bool)

(assert (=> b!230872 m!252375))

(declare-fun m!252377 () Bool)

(assert (=> mapNonEmpty!10270 m!252377))

(declare-fun m!252379 () Bool)

(assert (=> b!230886 m!252379))

(declare-fun m!252381 () Bool)

(assert (=> b!230886 m!252381))

(declare-fun m!252383 () Bool)

(assert (=> bm!21435 m!252383))

(declare-fun m!252385 () Bool)

(assert (=> b!230878 m!252385))

(declare-fun m!252387 () Bool)

(assert (=> b!230878 m!252387))

(declare-fun m!252389 () Bool)

(assert (=> b!230878 m!252389))

(declare-fun m!252391 () Bool)

(assert (=> b!230878 m!252391))

(declare-fun m!252393 () Bool)

(assert (=> b!230878 m!252393))

(declare-fun m!252395 () Bool)

(assert (=> b!230878 m!252395))

(declare-fun m!252397 () Bool)

(assert (=> b!230878 m!252397))

(declare-fun m!252399 () Bool)

(assert (=> b!230878 m!252399))

(declare-fun m!252401 () Bool)

(assert (=> b!230878 m!252401))

(declare-fun m!252403 () Bool)

(assert (=> b!230878 m!252403))

(declare-fun m!252405 () Bool)

(assert (=> b!230878 m!252405))

(declare-fun m!252407 () Bool)

(assert (=> b!230878 m!252407))

(declare-fun m!252409 () Bool)

(assert (=> b!230878 m!252409))

(declare-fun m!252411 () Bool)

(assert (=> b!230878 m!252411))

(declare-fun m!252413 () Bool)

(assert (=> b!230878 m!252413))

(declare-fun m!252415 () Bool)

(assert (=> b!230878 m!252415))

(declare-fun m!252417 () Bool)

(assert (=> b!230878 m!252417))

(declare-fun m!252419 () Bool)

(assert (=> b!230875 m!252419))

(declare-fun m!252421 () Bool)

(assert (=> b!230868 m!252421))

(declare-fun m!252423 () Bool)

(assert (=> b!230868 m!252423))

(declare-fun m!252425 () Bool)

(assert (=> b!230868 m!252425))

(declare-fun m!252427 () Bool)

(assert (=> b!230879 m!252427))

(assert (=> bm!21434 m!252407))

(declare-fun m!252429 () Bool)

(assert (=> b!230874 m!252429))

(declare-fun m!252431 () Bool)

(assert (=> start!22142 m!252431))

(declare-fun m!252433 () Bool)

(assert (=> b!230881 m!252433))

(check-sat (not b!230881) (not b!230868) (not bm!21434) (not start!22142) (not b_next!6205) (not b!230879) b_and!13117 (not b!230872) (not bm!21435) tp_is_empty!6067 (not b!230875) (not b!230886) (not mapNonEmpty!10270) (not b!230878))
(check-sat b_and!13117 (not b_next!6205))
