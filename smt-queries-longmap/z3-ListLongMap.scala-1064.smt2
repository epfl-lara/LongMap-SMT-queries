; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22070 () Bool)

(assert start!22070)

(declare-fun b!228366 () Bool)

(declare-fun b_free!6133 () Bool)

(declare-fun b_next!6133 () Bool)

(assert (=> b!228366 (= b_free!6133 (not b_next!6133))))

(declare-fun tp!21540 () Bool)

(declare-fun b_and!13005 () Bool)

(assert (=> b!228366 (= tp!21540 b_and!13005)))

(declare-fun b!228357 () Bool)

(declare-fun res!112380 () Bool)

(declare-fun e!148158 () Bool)

(assert (=> b!228357 (=> (not res!112380) (not e!148158))))

(declare-datatypes ((V!7641 0))(
  ( (V!7642 (val!3042 Int)) )
))
(declare-datatypes ((ValueCell!2654 0))(
  ( (ValueCellFull!2654 (v!5056 V!7641)) (EmptyCell!2654) )
))
(declare-datatypes ((array!11225 0))(
  ( (array!11226 (arr!5331 (Array (_ BitVec 32) ValueCell!2654)) (size!5665 (_ BitVec 32))) )
))
(declare-datatypes ((array!11227 0))(
  ( (array!11228 (arr!5332 (Array (_ BitVec 32) (_ BitVec 64))) (size!5666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3208 0))(
  ( (LongMapFixedSize!3209 (defaultEntry!4263 Int) (mask!10134 (_ BitVec 32)) (extraKeys!4000 (_ BitVec 32)) (zeroValue!4104 V!7641) (minValue!4104 V!7641) (_size!1653 (_ BitVec 32)) (_keys!6316 array!11227) (_values!4246 array!11225) (_vacant!1653 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3208)

(declare-datatypes ((SeekEntryResult!908 0))(
  ( (MissingZero!908 (index!5802 (_ BitVec 32))) (Found!908 (index!5803 (_ BitVec 32))) (Intermediate!908 (undefined!1720 Bool) (index!5804 (_ BitVec 32)) (x!23335 (_ BitVec 32))) (Undefined!908) (MissingVacant!908 (index!5805 (_ BitVec 32))) )
))
(declare-fun lt!114780 () SeekEntryResult!908)

(assert (=> b!228357 (= res!112380 (= (select (arr!5332 (_keys!6316 thiss!1504)) (index!5802 lt!114780)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!37868 () Bool)

(declare-fun call!21209 () Bool)

(declare-fun bm!21206 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21206 (= call!21209 (inRange!0 (ite c!37868 (index!5802 lt!114780) (index!5805 lt!114780)) (mask!10134 thiss!1504)))))

(declare-fun b!228358 () Bool)

(declare-fun e!148147 () Bool)

(declare-fun tp_is_empty!5995 () Bool)

(assert (=> b!228358 (= e!148147 tp_is_empty!5995)))

(declare-fun b!228359 () Bool)

(declare-fun res!112378 () Bool)

(declare-fun e!148148 () Bool)

(assert (=> b!228359 (=> (not res!112378) (not e!148148))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!228359 (= res!112378 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!112385 () Bool)

(assert (=> start!22070 (=> (not res!112385) (not e!148148))))

(declare-fun valid!1298 (LongMapFixedSize!3208) Bool)

(assert (=> start!22070 (= res!112385 (valid!1298 thiss!1504))))

(assert (=> start!22070 e!148148))

(declare-fun e!148149 () Bool)

(assert (=> start!22070 e!148149))

(assert (=> start!22070 true))

(declare-fun b!228360 () Bool)

(declare-datatypes ((Unit!6919 0))(
  ( (Unit!6920) )
))
(declare-fun e!148154 () Unit!6919)

(declare-fun lt!114778 () Unit!6919)

(assert (=> b!228360 (= e!148154 lt!114778)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!270 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) Int) Unit!6919)

(assert (=> b!228360 (= lt!114778 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!270 (_keys!6316 thiss!1504) (_values!4246 thiss!1504) (mask!10134 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 (defaultEntry!4263 thiss!1504)))))

(get-info :version)

(assert (=> b!228360 (= c!37868 ((_ is MissingZero!908) lt!114780))))

(declare-fun e!148156 () Bool)

(assert (=> b!228360 e!148156))

(declare-fun bm!21207 () Bool)

(declare-fun call!21210 () Bool)

(declare-fun arrayContainsKey!0 (array!11227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21207 (= call!21210 (arrayContainsKey!0 (_keys!6316 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228361 () Bool)

(declare-fun c!37870 () Bool)

(assert (=> b!228361 (= c!37870 ((_ is MissingVacant!908) lt!114780))))

(declare-fun e!148152 () Bool)

(assert (=> b!228361 (= e!148156 e!148152)))

(declare-fun b!228362 () Bool)

(declare-fun res!112375 () Bool)

(assert (=> b!228362 (= res!112375 (= (select (arr!5332 (_keys!6316 thiss!1504)) (index!5805 lt!114780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148155 () Bool)

(assert (=> b!228362 (=> (not res!112375) (not e!148155))))

(declare-fun b!228363 () Bool)

(declare-fun e!148145 () Bool)

(assert (=> b!228363 (= e!148148 e!148145)))

(declare-fun res!112379 () Bool)

(assert (=> b!228363 (=> (not res!112379) (not e!148145))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228363 (= res!112379 (or (= lt!114780 (MissingZero!908 index!297)) (= lt!114780 (MissingVacant!908 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11227 (_ BitVec 32)) SeekEntryResult!908)

(assert (=> b!228363 (= lt!114780 (seekEntryOrOpen!0 key!932 (_keys!6316 thiss!1504) (mask!10134 thiss!1504)))))

(declare-fun b!228364 () Bool)

(assert (=> b!228364 (= e!148152 e!148155)))

(declare-fun res!112384 () Bool)

(assert (=> b!228364 (= res!112384 call!21209)))

(assert (=> b!228364 (=> (not res!112384) (not e!148155))))

(declare-fun b!228365 () Bool)

(declare-fun e!148146 () Bool)

(declare-fun e!148151 () Bool)

(assert (=> b!228365 (= e!148146 (not e!148151))))

(declare-fun res!112383 () Bool)

(assert (=> b!228365 (=> res!112383 e!148151)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228365 (= res!112383 (not (validMask!0 (mask!10134 thiss!1504))))))

(declare-fun lt!114782 () array!11227)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11227 (_ BitVec 32)) Bool)

(assert (=> b!228365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114782 (mask!10134 thiss!1504))))

(declare-fun lt!114786 () Unit!6919)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11227 (_ BitVec 32) (_ BitVec 32)) Unit!6919)

(assert (=> b!228365 (= lt!114786 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6316 thiss!1504) index!297 (mask!10134 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11227 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228365 (= (arrayCountValidKeys!0 lt!114782 #b00000000000000000000000000000000 (size!5666 (_keys!6316 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6316 thiss!1504) #b00000000000000000000000000000000 (size!5666 (_keys!6316 thiss!1504)))))))

(declare-fun lt!114784 () Unit!6919)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11227 (_ BitVec 32) (_ BitVec 64)) Unit!6919)

(assert (=> b!228365 (= lt!114784 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6316 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3401 0))(
  ( (Nil!3398) (Cons!3397 (h!4045 (_ BitVec 64)) (t!8351 List!3401)) )
))
(declare-fun arrayNoDuplicates!0 (array!11227 (_ BitVec 32) List!3401) Bool)

(assert (=> b!228365 (arrayNoDuplicates!0 lt!114782 #b00000000000000000000000000000000 Nil!3398)))

(assert (=> b!228365 (= lt!114782 (array!11228 (store (arr!5332 (_keys!6316 thiss!1504)) index!297 key!932) (size!5666 (_keys!6316 thiss!1504))))))

(declare-fun lt!114787 () Unit!6919)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3401) Unit!6919)

(assert (=> b!228365 (= lt!114787 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6316 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3398))))

(declare-fun lt!114779 () Unit!6919)

(declare-fun e!148150 () Unit!6919)

(assert (=> b!228365 (= lt!114779 e!148150)))

(declare-fun c!37867 () Bool)

(assert (=> b!228365 (= c!37867 (arrayContainsKey!0 (_keys!6316 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!148157 () Bool)

(declare-fun array_inv!3515 (array!11227) Bool)

(declare-fun array_inv!3516 (array!11225) Bool)

(assert (=> b!228366 (= e!148149 (and tp!21540 tp_is_empty!5995 (array_inv!3515 (_keys!6316 thiss!1504)) (array_inv!3516 (_values!4246 thiss!1504)) e!148157))))

(declare-fun b!228367 () Bool)

(declare-fun res!112377 () Bool)

(assert (=> b!228367 (=> res!112377 e!148151)))

(assert (=> b!228367 (= res!112377 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6316 thiss!1504) (mask!10134 thiss!1504))))))

(declare-fun b!228368 () Bool)

(assert (=> b!228368 (= e!148151 true)))

(declare-fun lt!114783 () Bool)

(assert (=> b!228368 (= lt!114783 (arrayNoDuplicates!0 (_keys!6316 thiss!1504) #b00000000000000000000000000000000 Nil!3398))))

(declare-fun mapNonEmpty!10162 () Bool)

(declare-fun mapRes!10162 () Bool)

(declare-fun tp!21541 () Bool)

(declare-fun e!148153 () Bool)

(assert (=> mapNonEmpty!10162 (= mapRes!10162 (and tp!21541 e!148153))))

(declare-fun mapValue!10162 () ValueCell!2654)

(declare-fun mapRest!10162 () (Array (_ BitVec 32) ValueCell!2654))

(declare-fun mapKey!10162 () (_ BitVec 32))

(assert (=> mapNonEmpty!10162 (= (arr!5331 (_values!4246 thiss!1504)) (store mapRest!10162 mapKey!10162 mapValue!10162))))

(declare-fun b!228369 () Bool)

(assert (=> b!228369 (= e!148145 e!148146)))

(declare-fun res!112382 () Bool)

(assert (=> b!228369 (=> (not res!112382) (not e!148146))))

(assert (=> b!228369 (= res!112382 (inRange!0 index!297 (mask!10134 thiss!1504)))))

(declare-fun lt!114777 () Unit!6919)

(assert (=> b!228369 (= lt!114777 e!148154)))

(declare-fun c!37869 () Bool)

(declare-datatypes ((tuple2!4468 0))(
  ( (tuple2!4469 (_1!2245 (_ BitVec 64)) (_2!2245 V!7641)) )
))
(declare-datatypes ((List!3402 0))(
  ( (Nil!3399) (Cons!3398 (h!4046 tuple2!4468) (t!8352 List!3402)) )
))
(declare-datatypes ((ListLongMap!3371 0))(
  ( (ListLongMap!3372 (toList!1701 List!3402)) )
))
(declare-fun contains!1576 (ListLongMap!3371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1210 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 32) Int) ListLongMap!3371)

(assert (=> b!228369 (= c!37869 (contains!1576 (getCurrentListMap!1210 (_keys!6316 thiss!1504) (_values!4246 thiss!1504) (mask!10134 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4263 thiss!1504)) key!932))))

(declare-fun b!228370 () Bool)

(assert (=> b!228370 (= e!148155 (not call!21210))))

(declare-fun b!228371 () Bool)

(declare-fun Unit!6921 () Unit!6919)

(assert (=> b!228371 (= e!148154 Unit!6921)))

(declare-fun lt!114781 () Unit!6919)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!273 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) Int) Unit!6919)

(assert (=> b!228371 (= lt!114781 (lemmaInListMapThenSeekEntryOrOpenFindsIt!273 (_keys!6316 thiss!1504) (_values!4246 thiss!1504) (mask!10134 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 (defaultEntry!4263 thiss!1504)))))

(assert (=> b!228371 false))

(declare-fun b!228372 () Bool)

(declare-fun Unit!6922 () Unit!6919)

(assert (=> b!228372 (= e!148150 Unit!6922)))

(declare-fun b!228373 () Bool)

(declare-fun res!112376 () Bool)

(assert (=> b!228373 (=> res!112376 e!148151)))

(assert (=> b!228373 (= res!112376 (or (not (= (size!5665 (_values!4246 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10134 thiss!1504)))) (not (= (size!5666 (_keys!6316 thiss!1504)) (size!5665 (_values!4246 thiss!1504)))) (bvslt (mask!10134 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4000 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4000 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228374 () Bool)

(assert (=> b!228374 (= e!148152 ((_ is Undefined!908) lt!114780))))

(declare-fun b!228375 () Bool)

(declare-fun res!112381 () Bool)

(assert (=> b!228375 (=> (not res!112381) (not e!148158))))

(assert (=> b!228375 (= res!112381 call!21209)))

(assert (=> b!228375 (= e!148156 e!148158)))

(declare-fun b!228376 () Bool)

(assert (=> b!228376 (= e!148158 (not call!21210))))

(declare-fun b!228377 () Bool)

(assert (=> b!228377 (= e!148153 tp_is_empty!5995)))

(declare-fun b!228378 () Bool)

(assert (=> b!228378 (= e!148157 (and e!148147 mapRes!10162))))

(declare-fun condMapEmpty!10162 () Bool)

(declare-fun mapDefault!10162 () ValueCell!2654)

(assert (=> b!228378 (= condMapEmpty!10162 (= (arr!5331 (_values!4246 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2654)) mapDefault!10162)))))

(declare-fun mapIsEmpty!10162 () Bool)

(assert (=> mapIsEmpty!10162 mapRes!10162))

(declare-fun b!228379 () Bool)

(declare-fun Unit!6923 () Unit!6919)

(assert (=> b!228379 (= e!148150 Unit!6923)))

(declare-fun lt!114785 () Unit!6919)

(declare-fun lemmaArrayContainsKeyThenInListMap!114 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) (_ BitVec 32) Int) Unit!6919)

(assert (=> b!228379 (= lt!114785 (lemmaArrayContainsKeyThenInListMap!114 (_keys!6316 thiss!1504) (_values!4246 thiss!1504) (mask!10134 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4263 thiss!1504)))))

(assert (=> b!228379 false))

(assert (= (and start!22070 res!112385) b!228359))

(assert (= (and b!228359 res!112378) b!228363))

(assert (= (and b!228363 res!112379) b!228369))

(assert (= (and b!228369 c!37869) b!228371))

(assert (= (and b!228369 (not c!37869)) b!228360))

(assert (= (and b!228360 c!37868) b!228375))

(assert (= (and b!228360 (not c!37868)) b!228361))

(assert (= (and b!228375 res!112381) b!228357))

(assert (= (and b!228357 res!112380) b!228376))

(assert (= (and b!228361 c!37870) b!228364))

(assert (= (and b!228361 (not c!37870)) b!228374))

(assert (= (and b!228364 res!112384) b!228362))

(assert (= (and b!228362 res!112375) b!228370))

(assert (= (or b!228375 b!228364) bm!21206))

(assert (= (or b!228376 b!228370) bm!21207))

(assert (= (and b!228369 res!112382) b!228365))

(assert (= (and b!228365 c!37867) b!228379))

(assert (= (and b!228365 (not c!37867)) b!228372))

(assert (= (and b!228365 (not res!112383)) b!228373))

(assert (= (and b!228373 (not res!112376)) b!228367))

(assert (= (and b!228367 (not res!112377)) b!228368))

(assert (= (and b!228378 condMapEmpty!10162) mapIsEmpty!10162))

(assert (= (and b!228378 (not condMapEmpty!10162)) mapNonEmpty!10162))

(assert (= (and mapNonEmpty!10162 ((_ is ValueCellFull!2654) mapValue!10162)) b!228377))

(assert (= (and b!228378 ((_ is ValueCellFull!2654) mapDefault!10162)) b!228358))

(assert (= b!228366 b!228378))

(assert (= start!22070 b!228366))

(declare-fun m!249631 () Bool)

(assert (=> b!228357 m!249631))

(declare-fun m!249633 () Bool)

(assert (=> bm!21206 m!249633))

(declare-fun m!249635 () Bool)

(assert (=> bm!21207 m!249635))

(declare-fun m!249637 () Bool)

(assert (=> mapNonEmpty!10162 m!249637))

(declare-fun m!249639 () Bool)

(assert (=> b!228366 m!249639))

(declare-fun m!249641 () Bool)

(assert (=> b!228366 m!249641))

(declare-fun m!249643 () Bool)

(assert (=> b!228371 m!249643))

(declare-fun m!249645 () Bool)

(assert (=> b!228367 m!249645))

(declare-fun m!249647 () Bool)

(assert (=> b!228360 m!249647))

(declare-fun m!249649 () Bool)

(assert (=> b!228379 m!249649))

(declare-fun m!249651 () Bool)

(assert (=> b!228369 m!249651))

(declare-fun m!249653 () Bool)

(assert (=> b!228369 m!249653))

(assert (=> b!228369 m!249653))

(declare-fun m!249655 () Bool)

(assert (=> b!228369 m!249655))

(declare-fun m!249657 () Bool)

(assert (=> b!228365 m!249657))

(assert (=> b!228365 m!249635))

(declare-fun m!249659 () Bool)

(assert (=> b!228365 m!249659))

(declare-fun m!249661 () Bool)

(assert (=> b!228365 m!249661))

(declare-fun m!249663 () Bool)

(assert (=> b!228365 m!249663))

(declare-fun m!249665 () Bool)

(assert (=> b!228365 m!249665))

(declare-fun m!249667 () Bool)

(assert (=> b!228365 m!249667))

(declare-fun m!249669 () Bool)

(assert (=> b!228365 m!249669))

(declare-fun m!249671 () Bool)

(assert (=> b!228365 m!249671))

(declare-fun m!249673 () Bool)

(assert (=> b!228365 m!249673))

(declare-fun m!249675 () Bool)

(assert (=> b!228368 m!249675))

(declare-fun m!249677 () Bool)

(assert (=> b!228362 m!249677))

(declare-fun m!249679 () Bool)

(assert (=> start!22070 m!249679))

(declare-fun m!249681 () Bool)

(assert (=> b!228363 m!249681))

(check-sat (not b!228367) (not b!228365) (not bm!21206) (not b!228379) (not mapNonEmpty!10162) (not b_next!6133) (not b!228371) tp_is_empty!5995 (not b!228360) (not b!228368) (not b!228369) (not bm!21207) (not b!228366) (not b!228363) (not start!22070) b_and!13005)
(check-sat b_and!13005 (not b_next!6133))
