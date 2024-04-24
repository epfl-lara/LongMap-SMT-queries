; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22106 () Bool)

(assert start!22106)

(declare-fun b!229793 () Bool)

(declare-fun b_free!6169 () Bool)

(declare-fun b_next!6169 () Bool)

(assert (=> b!229793 (= b_free!6169 (not b_next!6169))))

(declare-fun tp!21648 () Bool)

(declare-fun b_and!13081 () Bool)

(assert (=> b!229793 (= tp!21648 b_and!13081)))

(declare-fun b!229787 () Bool)

(declare-fun e!149089 () Bool)

(declare-fun call!21329 () Bool)

(assert (=> b!229787 (= e!149089 (not call!21329))))

(declare-fun b!229788 () Bool)

(declare-fun e!149078 () Bool)

(declare-fun e!149090 () Bool)

(assert (=> b!229788 (= e!149078 e!149090)))

(declare-fun res!113083 () Bool)

(assert (=> b!229788 (=> (not res!113083) (not e!149090))))

(declare-datatypes ((SeekEntryResult!893 0))(
  ( (MissingZero!893 (index!5742 (_ BitVec 32))) (Found!893 (index!5743 (_ BitVec 32))) (Intermediate!893 (undefined!1705 Bool) (index!5744 (_ BitVec 32)) (x!23369 (_ BitVec 32))) (Undefined!893) (MissingVacant!893 (index!5745 (_ BitVec 32))) )
))
(declare-fun lt!115617 () SeekEntryResult!893)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229788 (= res!113083 (or (= lt!115617 (MissingZero!893 index!297)) (= lt!115617 (MissingVacant!893 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7689 0))(
  ( (V!7690 (val!3060 Int)) )
))
(declare-datatypes ((ValueCell!2672 0))(
  ( (ValueCellFull!2672 (v!5081 V!7689)) (EmptyCell!2672) )
))
(declare-datatypes ((array!11303 0))(
  ( (array!11304 (arr!5371 (Array (_ BitVec 32) ValueCell!2672)) (size!5704 (_ BitVec 32))) )
))
(declare-datatypes ((array!11305 0))(
  ( (array!11306 (arr!5372 (Array (_ BitVec 32) (_ BitVec 64))) (size!5705 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3244 0))(
  ( (LongMapFixedSize!3245 (defaultEntry!4281 Int) (mask!10165 (_ BitVec 32)) (extraKeys!4018 (_ BitVec 32)) (zeroValue!4122 V!7689) (minValue!4122 V!7689) (_size!1671 (_ BitVec 32)) (_keys!6335 array!11305) (_values!4264 array!11303) (_vacant!1671 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3244)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11305 (_ BitVec 32)) SeekEntryResult!893)

(assert (=> b!229788 (= lt!115617 (seekEntryOrOpen!0 key!932 (_keys!6335 thiss!1504) (mask!10165 thiss!1504)))))

(declare-fun bm!21326 () Bool)

(declare-fun arrayContainsKey!0 (array!11305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21326 (= call!21329 (arrayContainsKey!0 (_keys!6335 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229789 () Bool)

(declare-fun e!149083 () Bool)

(declare-fun tp_is_empty!6031 () Bool)

(assert (=> b!229789 (= e!149083 tp_is_empty!6031)))

(declare-fun bm!21327 () Bool)

(declare-fun c!38122 () Bool)

(declare-fun call!21330 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21327 (= call!21330 (inRange!0 (ite c!38122 (index!5742 lt!115617) (index!5745 lt!115617)) (mask!10165 thiss!1504)))))

(declare-fun b!229790 () Bool)

(declare-fun e!149080 () Bool)

(assert (=> b!229790 (= e!149080 (not call!21329))))

(declare-fun b!229791 () Bool)

(declare-fun e!149079 () Bool)

(assert (=> b!229791 (= e!149090 e!149079)))

(declare-fun res!113081 () Bool)

(assert (=> b!229791 (=> (not res!113081) (not e!149079))))

(assert (=> b!229791 (= res!113081 (inRange!0 index!297 (mask!10165 thiss!1504)))))

(declare-datatypes ((Unit!6995 0))(
  ( (Unit!6996) )
))
(declare-fun lt!115623 () Unit!6995)

(declare-fun e!149084 () Unit!6995)

(assert (=> b!229791 (= lt!115623 e!149084)))

(declare-fun c!38125 () Bool)

(declare-datatypes ((tuple2!4440 0))(
  ( (tuple2!4441 (_1!2231 (_ BitVec 64)) (_2!2231 V!7689)) )
))
(declare-datatypes ((List!3354 0))(
  ( (Nil!3351) (Cons!3350 (h!3998 tuple2!4440) (t!8305 List!3354)) )
))
(declare-datatypes ((ListLongMap!3355 0))(
  ( (ListLongMap!3356 (toList!1693 List!3354)) )
))
(declare-fun lt!115618 () ListLongMap!3355)

(declare-fun contains!1582 (ListLongMap!3355 (_ BitVec 64)) Bool)

(assert (=> b!229791 (= c!38125 (contains!1582 lt!115618 key!932))))

(declare-fun getCurrentListMap!1225 (array!11305 array!11303 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 32) Int) ListLongMap!3355)

(assert (=> b!229791 (= lt!115618 (getCurrentListMap!1225 (_keys!6335 thiss!1504) (_values!4264 thiss!1504) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(declare-fun b!229792 () Bool)

(declare-fun e!149077 () Unit!6995)

(declare-fun Unit!6997 () Unit!6995)

(assert (=> b!229792 (= e!149077 Unit!6997)))

(declare-fun e!149081 () Bool)

(declare-fun e!149088 () Bool)

(declare-fun array_inv!3527 (array!11305) Bool)

(declare-fun array_inv!3528 (array!11303) Bool)

(assert (=> b!229793 (= e!149081 (and tp!21648 tp_is_empty!6031 (array_inv!3527 (_keys!6335 thiss!1504)) (array_inv!3528 (_values!4264 thiss!1504)) e!149088))))

(declare-fun b!229794 () Bool)

(declare-fun res!113080 () Bool)

(assert (=> b!229794 (= res!113080 (= (select (arr!5372 (_keys!6335 thiss!1504)) (index!5745 lt!115617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229794 (=> (not res!113080) (not e!149080))))

(declare-fun b!229795 () Bool)

(declare-fun e!149082 () Bool)

(assert (=> b!229795 (= e!149082 tp_is_empty!6031)))

(declare-fun b!229796 () Bool)

(declare-fun res!113085 () Bool)

(assert (=> b!229796 (=> (not res!113085) (not e!149078))))

(assert (=> b!229796 (= res!113085 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229797 () Bool)

(declare-fun Unit!6998 () Unit!6995)

(assert (=> b!229797 (= e!149084 Unit!6998)))

(declare-fun lt!115614 () Unit!6995)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!287 (array!11305 array!11303 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 64) Int) Unit!6995)

(assert (=> b!229797 (= lt!115614 (lemmaInListMapThenSeekEntryOrOpenFindsIt!287 (_keys!6335 thiss!1504) (_values!4264 thiss!1504) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) key!932 (defaultEntry!4281 thiss!1504)))))

(assert (=> b!229797 false))

(declare-fun b!229798 () Bool)

(declare-fun res!113084 () Bool)

(assert (=> b!229798 (=> (not res!113084) (not e!149089))))

(assert (=> b!229798 (= res!113084 (= (select (arr!5372 (_keys!6335 thiss!1504)) (index!5742 lt!115617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229799 () Bool)

(declare-fun e!149085 () Bool)

(get-info :version)

(assert (=> b!229799 (= e!149085 ((_ is Undefined!893) lt!115617))))

(declare-fun b!229800 () Bool)

(assert (=> b!229800 (= e!149079 (not true))))

(declare-fun lt!115619 () array!11305)

(declare-fun v!346 () V!7689)

(declare-fun +!593 (ListLongMap!3355 tuple2!4440) ListLongMap!3355)

(assert (=> b!229800 (= (+!593 lt!115618 (tuple2!4441 key!932 v!346)) (getCurrentListMap!1225 lt!115619 (array!11304 (store (arr!5371 (_values!4264 thiss!1504)) index!297 (ValueCellFull!2672 v!346)) (size!5704 (_values!4264 thiss!1504))) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(declare-fun lt!115622 () Unit!6995)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!52 (array!11305 array!11303 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 32) (_ BitVec 64) V!7689 Int) Unit!6995)

(assert (=> b!229800 (= lt!115622 (lemmaAddValidKeyToArrayThenAddPairToListMap!52 (_keys!6335 thiss!1504) (_values!4264 thiss!1504) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) index!297 key!932 v!346 (defaultEntry!4281 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11305 (_ BitVec 32)) Bool)

(assert (=> b!229800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115619 (mask!10165 thiss!1504))))

(declare-fun lt!115624 () Unit!6995)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11305 (_ BitVec 32) (_ BitVec 32)) Unit!6995)

(assert (=> b!229800 (= lt!115624 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6335 thiss!1504) index!297 (mask!10165 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229800 (= (arrayCountValidKeys!0 lt!115619 #b00000000000000000000000000000000 (size!5705 (_keys!6335 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6335 thiss!1504) #b00000000000000000000000000000000 (size!5705 (_keys!6335 thiss!1504)))))))

(declare-fun lt!115613 () Unit!6995)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11305 (_ BitVec 32) (_ BitVec 64)) Unit!6995)

(assert (=> b!229800 (= lt!115613 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6335 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3355 0))(
  ( (Nil!3352) (Cons!3351 (h!3999 (_ BitVec 64)) (t!8306 List!3355)) )
))
(declare-fun arrayNoDuplicates!0 (array!11305 (_ BitVec 32) List!3355) Bool)

(assert (=> b!229800 (arrayNoDuplicates!0 lt!115619 #b00000000000000000000000000000000 Nil!3352)))

(assert (=> b!229800 (= lt!115619 (array!11306 (store (arr!5372 (_keys!6335 thiss!1504)) index!297 key!932) (size!5705 (_keys!6335 thiss!1504))))))

(declare-fun lt!115620 () Unit!6995)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3355) Unit!6995)

(assert (=> b!229800 (= lt!115620 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6335 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3352))))

(declare-fun lt!115616 () Unit!6995)

(assert (=> b!229800 (= lt!115616 e!149077)))

(declare-fun c!38124 () Bool)

(assert (=> b!229800 (= c!38124 (arrayContainsKey!0 (_keys!6335 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!113082 () Bool)

(assert (=> start!22106 (=> (not res!113082) (not e!149078))))

(declare-fun valid!1303 (LongMapFixedSize!3244) Bool)

(assert (=> start!22106 (= res!113082 (valid!1303 thiss!1504))))

(assert (=> start!22106 e!149078))

(assert (=> start!22106 e!149081))

(assert (=> start!22106 true))

(assert (=> start!22106 tp_is_empty!6031))

(declare-fun mapIsEmpty!10216 () Bool)

(declare-fun mapRes!10216 () Bool)

(assert (=> mapIsEmpty!10216 mapRes!10216))

(declare-fun b!229801 () Bool)

(declare-fun res!113086 () Bool)

(assert (=> b!229801 (=> (not res!113086) (not e!149089))))

(assert (=> b!229801 (= res!113086 call!21330)))

(declare-fun e!149087 () Bool)

(assert (=> b!229801 (= e!149087 e!149089)))

(declare-fun b!229802 () Bool)

(assert (=> b!229802 (= e!149085 e!149080)))

(declare-fun res!113079 () Bool)

(assert (=> b!229802 (= res!113079 call!21330)))

(assert (=> b!229802 (=> (not res!113079) (not e!149080))))

(declare-fun mapNonEmpty!10216 () Bool)

(declare-fun tp!21649 () Bool)

(assert (=> mapNonEmpty!10216 (= mapRes!10216 (and tp!21649 e!149082))))

(declare-fun mapValue!10216 () ValueCell!2672)

(declare-fun mapRest!10216 () (Array (_ BitVec 32) ValueCell!2672))

(declare-fun mapKey!10216 () (_ BitVec 32))

(assert (=> mapNonEmpty!10216 (= (arr!5371 (_values!4264 thiss!1504)) (store mapRest!10216 mapKey!10216 mapValue!10216))))

(declare-fun b!229803 () Bool)

(declare-fun Unit!6999 () Unit!6995)

(assert (=> b!229803 (= e!149077 Unit!6999)))

(declare-fun lt!115615 () Unit!6995)

(declare-fun lemmaArrayContainsKeyThenInListMap!123 (array!11305 array!11303 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 64) (_ BitVec 32) Int) Unit!6995)

(assert (=> b!229803 (= lt!115615 (lemmaArrayContainsKeyThenInListMap!123 (_keys!6335 thiss!1504) (_values!4264 thiss!1504) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(assert (=> b!229803 false))

(declare-fun b!229804 () Bool)

(assert (=> b!229804 (= e!149088 (and e!149083 mapRes!10216))))

(declare-fun condMapEmpty!10216 () Bool)

(declare-fun mapDefault!10216 () ValueCell!2672)

(assert (=> b!229804 (= condMapEmpty!10216 (= (arr!5371 (_values!4264 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2672)) mapDefault!10216)))))

(declare-fun b!229805 () Bool)

(declare-fun c!38123 () Bool)

(assert (=> b!229805 (= c!38123 ((_ is MissingVacant!893) lt!115617))))

(assert (=> b!229805 (= e!149087 e!149085)))

(declare-fun b!229806 () Bool)

(declare-fun lt!115621 () Unit!6995)

(assert (=> b!229806 (= e!149084 lt!115621)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!278 (array!11305 array!11303 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 64) Int) Unit!6995)

(assert (=> b!229806 (= lt!115621 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!278 (_keys!6335 thiss!1504) (_values!4264 thiss!1504) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) key!932 (defaultEntry!4281 thiss!1504)))))

(assert (=> b!229806 (= c!38122 ((_ is MissingZero!893) lt!115617))))

(assert (=> b!229806 e!149087))

(assert (= (and start!22106 res!113082) b!229796))

(assert (= (and b!229796 res!113085) b!229788))

(assert (= (and b!229788 res!113083) b!229791))

(assert (= (and b!229791 c!38125) b!229797))

(assert (= (and b!229791 (not c!38125)) b!229806))

(assert (= (and b!229806 c!38122) b!229801))

(assert (= (and b!229806 (not c!38122)) b!229805))

(assert (= (and b!229801 res!113086) b!229798))

(assert (= (and b!229798 res!113084) b!229787))

(assert (= (and b!229805 c!38123) b!229802))

(assert (= (and b!229805 (not c!38123)) b!229799))

(assert (= (and b!229802 res!113079) b!229794))

(assert (= (and b!229794 res!113080) b!229790))

(assert (= (or b!229801 b!229802) bm!21327))

(assert (= (or b!229787 b!229790) bm!21326))

(assert (= (and b!229791 res!113081) b!229800))

(assert (= (and b!229800 c!38124) b!229803))

(assert (= (and b!229800 (not c!38124)) b!229792))

(assert (= (and b!229804 condMapEmpty!10216) mapIsEmpty!10216))

(assert (= (and b!229804 (not condMapEmpty!10216)) mapNonEmpty!10216))

(assert (= (and mapNonEmpty!10216 ((_ is ValueCellFull!2672) mapValue!10216)) b!229795))

(assert (= (and b!229804 ((_ is ValueCellFull!2672) mapDefault!10216)) b!229789))

(assert (= b!229793 b!229804))

(assert (= start!22106 b!229793))

(declare-fun m!251365 () Bool)

(assert (=> bm!21326 m!251365))

(declare-fun m!251367 () Bool)

(assert (=> b!229806 m!251367))

(declare-fun m!251369 () Bool)

(assert (=> b!229793 m!251369))

(declare-fun m!251371 () Bool)

(assert (=> b!229793 m!251371))

(declare-fun m!251373 () Bool)

(assert (=> b!229803 m!251373))

(declare-fun m!251375 () Bool)

(assert (=> start!22106 m!251375))

(declare-fun m!251377 () Bool)

(assert (=> b!229798 m!251377))

(declare-fun m!251379 () Bool)

(assert (=> b!229794 m!251379))

(assert (=> b!229800 m!251365))

(declare-fun m!251381 () Bool)

(assert (=> b!229800 m!251381))

(declare-fun m!251383 () Bool)

(assert (=> b!229800 m!251383))

(declare-fun m!251385 () Bool)

(assert (=> b!229800 m!251385))

(declare-fun m!251387 () Bool)

(assert (=> b!229800 m!251387))

(declare-fun m!251389 () Bool)

(assert (=> b!229800 m!251389))

(declare-fun m!251391 () Bool)

(assert (=> b!229800 m!251391))

(declare-fun m!251393 () Bool)

(assert (=> b!229800 m!251393))

(declare-fun m!251395 () Bool)

(assert (=> b!229800 m!251395))

(declare-fun m!251397 () Bool)

(assert (=> b!229800 m!251397))

(declare-fun m!251399 () Bool)

(assert (=> b!229800 m!251399))

(declare-fun m!251401 () Bool)

(assert (=> b!229800 m!251401))

(declare-fun m!251403 () Bool)

(assert (=> b!229800 m!251403))

(declare-fun m!251405 () Bool)

(assert (=> b!229791 m!251405))

(declare-fun m!251407 () Bool)

(assert (=> b!229791 m!251407))

(declare-fun m!251409 () Bool)

(assert (=> b!229791 m!251409))

(declare-fun m!251411 () Bool)

(assert (=> mapNonEmpty!10216 m!251411))

(declare-fun m!251413 () Bool)

(assert (=> b!229797 m!251413))

(declare-fun m!251415 () Bool)

(assert (=> b!229788 m!251415))

(declare-fun m!251417 () Bool)

(assert (=> bm!21327 m!251417))

(check-sat (not b!229806) (not b!229800) (not b!229793) b_and!13081 (not b!229791) (not b!229797) tp_is_empty!6031 (not mapNonEmpty!10216) (not bm!21327) (not b!229803) (not start!22106) (not b!229788) (not b_next!6169) (not bm!21326))
(check-sat b_and!13081 (not b_next!6169))
