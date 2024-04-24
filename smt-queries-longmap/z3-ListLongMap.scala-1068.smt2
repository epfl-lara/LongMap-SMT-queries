; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22094 () Bool)

(assert start!22094)

(declare-fun b!229387 () Bool)

(declare-fun b_free!6157 () Bool)

(declare-fun b_next!6157 () Bool)

(assert (=> b!229387 (= b_free!6157 (not b_next!6157))))

(declare-fun tp!21613 () Bool)

(declare-fun b_and!13069 () Bool)

(assert (=> b!229387 (= tp!21613 b_and!13069)))

(declare-fun b!229379 () Bool)

(declare-fun res!112896 () Bool)

(declare-fun e!148813 () Bool)

(assert (=> b!229379 (=> (not res!112896) (not e!148813))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!229379 (= res!112896 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229380 () Bool)

(declare-fun e!148818 () Bool)

(declare-datatypes ((SeekEntryResult!889 0))(
  ( (MissingZero!889 (index!5726 (_ BitVec 32))) (Found!889 (index!5727 (_ BitVec 32))) (Intermediate!889 (undefined!1701 Bool) (index!5728 (_ BitVec 32)) (x!23349 (_ BitVec 32))) (Undefined!889) (MissingVacant!889 (index!5729 (_ BitVec 32))) )
))
(declare-fun lt!115421 () SeekEntryResult!889)

(get-info :version)

(assert (=> b!229380 (= e!148818 ((_ is Undefined!889) lt!115421))))

(declare-fun b!229381 () Bool)

(declare-fun res!112891 () Bool)

(declare-fun e!148819 () Bool)

(assert (=> b!229381 (=> (not res!112891) (not e!148819))))

(declare-fun call!21293 () Bool)

(assert (=> b!229381 (= res!112891 call!21293)))

(declare-fun e!148809 () Bool)

(assert (=> b!229381 (= e!148809 e!148819)))

(declare-fun b!229382 () Bool)

(declare-fun res!112887 () Bool)

(declare-datatypes ((V!7673 0))(
  ( (V!7674 (val!3054 Int)) )
))
(declare-datatypes ((ValueCell!2666 0))(
  ( (ValueCellFull!2666 (v!5075 V!7673)) (EmptyCell!2666) )
))
(declare-datatypes ((array!11279 0))(
  ( (array!11280 (arr!5359 (Array (_ BitVec 32) ValueCell!2666)) (size!5692 (_ BitVec 32))) )
))
(declare-datatypes ((array!11281 0))(
  ( (array!11282 (arr!5360 (Array (_ BitVec 32) (_ BitVec 64))) (size!5693 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3232 0))(
  ( (LongMapFixedSize!3233 (defaultEntry!4275 Int) (mask!10155 (_ BitVec 32)) (extraKeys!4012 (_ BitVec 32)) (zeroValue!4116 V!7673) (minValue!4116 V!7673) (_size!1665 (_ BitVec 32)) (_keys!6329 array!11281) (_values!4258 array!11279) (_vacant!1665 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3232)

(assert (=> b!229382 (= res!112887 (= (select (arr!5360 (_keys!6329 thiss!1504)) (index!5729 lt!115421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148814 () Bool)

(assert (=> b!229382 (=> (not res!112887) (not e!148814))))

(declare-fun b!229383 () Bool)

(assert (=> b!229383 (= e!148818 e!148814)))

(declare-fun res!112889 () Bool)

(assert (=> b!229383 (= res!112889 call!21293)))

(assert (=> b!229383 (=> (not res!112889) (not e!148814))))

(declare-fun b!229384 () Bool)

(declare-fun c!38050 () Bool)

(assert (=> b!229384 (= c!38050 ((_ is MissingVacant!889) lt!115421))))

(assert (=> b!229384 (= e!148809 e!148818)))

(declare-fun bm!21290 () Bool)

(declare-fun call!21294 () Bool)

(declare-fun arrayContainsKey!0 (array!11281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21290 (= call!21294 (arrayContainsKey!0 (_keys!6329 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229385 () Bool)

(declare-datatypes ((Unit!6970 0))(
  ( (Unit!6971) )
))
(declare-fun e!148815 () Unit!6970)

(declare-fun Unit!6972 () Unit!6970)

(assert (=> b!229385 (= e!148815 Unit!6972)))

(declare-fun lt!115417 () Unit!6970)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!281 (array!11281 array!11279 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) Int) Unit!6970)

(assert (=> b!229385 (= lt!115417 (lemmaInListMapThenSeekEntryOrOpenFindsIt!281 (_keys!6329 thiss!1504) (_values!4258 thiss!1504) (mask!10155 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 (defaultEntry!4275 thiss!1504)))))

(assert (=> b!229385 false))

(declare-fun b!229386 () Bool)

(assert (=> b!229386 (= e!148819 (not call!21294))))

(declare-fun res!112890 () Bool)

(assert (=> start!22094 (=> (not res!112890) (not e!148813))))

(declare-fun valid!1298 (LongMapFixedSize!3232) Bool)

(assert (=> start!22094 (= res!112890 (valid!1298 thiss!1504))))

(assert (=> start!22094 e!148813))

(declare-fun e!148821 () Bool)

(assert (=> start!22094 e!148821))

(assert (=> start!22094 true))

(declare-fun e!148817 () Bool)

(declare-fun tp_is_empty!6019 () Bool)

(declare-fun array_inv!3521 (array!11281) Bool)

(declare-fun array_inv!3522 (array!11279) Bool)

(assert (=> b!229387 (= e!148821 (and tp!21613 tp_is_empty!6019 (array_inv!3521 (_keys!6329 thiss!1504)) (array_inv!3522 (_values!4258 thiss!1504)) e!148817))))

(declare-fun b!229388 () Bool)

(declare-fun e!148811 () Bool)

(assert (=> b!229388 (= e!148811 true)))

(declare-fun lt!115416 () Bool)

(declare-datatypes ((List!3346 0))(
  ( (Nil!3343) (Cons!3342 (h!3990 (_ BitVec 64)) (t!8297 List!3346)) )
))
(declare-fun arrayNoDuplicates!0 (array!11281 (_ BitVec 32) List!3346) Bool)

(assert (=> b!229388 (= lt!115416 (arrayNoDuplicates!0 (_keys!6329 thiss!1504) #b00000000000000000000000000000000 Nil!3343))))

(declare-fun b!229389 () Bool)

(declare-fun e!148822 () Bool)

(assert (=> b!229389 (= e!148813 e!148822)))

(declare-fun res!112895 () Bool)

(assert (=> b!229389 (=> (not res!112895) (not e!148822))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229389 (= res!112895 (or (= lt!115421 (MissingZero!889 index!297)) (= lt!115421 (MissingVacant!889 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11281 (_ BitVec 32)) SeekEntryResult!889)

(assert (=> b!229389 (= lt!115421 (seekEntryOrOpen!0 key!932 (_keys!6329 thiss!1504) (mask!10155 thiss!1504)))))

(declare-fun b!229390 () Bool)

(declare-fun res!112893 () Bool)

(assert (=> b!229390 (=> (not res!112893) (not e!148819))))

(assert (=> b!229390 (= res!112893 (= (select (arr!5360 (_keys!6329 thiss!1504)) (index!5726 lt!115421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229391 () Bool)

(assert (=> b!229391 (= e!148814 (not call!21294))))

(declare-fun b!229392 () Bool)

(declare-fun res!112892 () Bool)

(assert (=> b!229392 (=> res!112892 e!148811)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11281 (_ BitVec 32)) Bool)

(assert (=> b!229392 (= res!112892 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6329 thiss!1504) (mask!10155 thiss!1504))))))

(declare-fun b!229393 () Bool)

(declare-fun e!148816 () Unit!6970)

(declare-fun Unit!6973 () Unit!6970)

(assert (=> b!229393 (= e!148816 Unit!6973)))

(declare-fun mapNonEmpty!10198 () Bool)

(declare-fun mapRes!10198 () Bool)

(declare-fun tp!21612 () Bool)

(declare-fun e!148812 () Bool)

(assert (=> mapNonEmpty!10198 (= mapRes!10198 (and tp!21612 e!148812))))

(declare-fun mapKey!10198 () (_ BitVec 32))

(declare-fun mapRest!10198 () (Array (_ BitVec 32) ValueCell!2666))

(declare-fun mapValue!10198 () ValueCell!2666)

(assert (=> mapNonEmpty!10198 (= (arr!5359 (_values!4258 thiss!1504)) (store mapRest!10198 mapKey!10198 mapValue!10198))))

(declare-fun b!229394 () Bool)

(declare-fun e!148820 () Bool)

(assert (=> b!229394 (= e!148817 (and e!148820 mapRes!10198))))

(declare-fun condMapEmpty!10198 () Bool)

(declare-fun mapDefault!10198 () ValueCell!2666)

(assert (=> b!229394 (= condMapEmpty!10198 (= (arr!5359 (_values!4258 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2666)) mapDefault!10198)))))

(declare-fun b!229395 () Bool)

(declare-fun lt!115422 () Unit!6970)

(assert (=> b!229395 (= e!148815 lt!115422)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!274 (array!11281 array!11279 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) Int) Unit!6970)

(assert (=> b!229395 (= lt!115422 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!274 (_keys!6329 thiss!1504) (_values!4258 thiss!1504) (mask!10155 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 (defaultEntry!4275 thiss!1504)))))

(declare-fun c!38053 () Bool)

(assert (=> b!229395 (= c!38053 ((_ is MissingZero!889) lt!115421))))

(assert (=> b!229395 e!148809))

(declare-fun b!229396 () Bool)

(declare-fun e!148823 () Bool)

(assert (=> b!229396 (= e!148823 (not e!148811))))

(declare-fun res!112888 () Bool)

(assert (=> b!229396 (=> res!112888 e!148811)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229396 (= res!112888 (not (validMask!0 (mask!10155 thiss!1504))))))

(declare-fun lt!115418 () array!11281)

(assert (=> b!229396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115418 (mask!10155 thiss!1504))))

(declare-fun lt!115414 () Unit!6970)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11281 (_ BitVec 32) (_ BitVec 32)) Unit!6970)

(assert (=> b!229396 (= lt!115414 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6329 thiss!1504) index!297 (mask!10155 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229396 (= (arrayCountValidKeys!0 lt!115418 #b00000000000000000000000000000000 (size!5693 (_keys!6329 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6329 thiss!1504) #b00000000000000000000000000000000 (size!5693 (_keys!6329 thiss!1504)))))))

(declare-fun lt!115415 () Unit!6970)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11281 (_ BitVec 32) (_ BitVec 64)) Unit!6970)

(assert (=> b!229396 (= lt!115415 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6329 thiss!1504) index!297 key!932))))

(assert (=> b!229396 (arrayNoDuplicates!0 lt!115418 #b00000000000000000000000000000000 Nil!3343)))

(assert (=> b!229396 (= lt!115418 (array!11282 (store (arr!5360 (_keys!6329 thiss!1504)) index!297 key!932) (size!5693 (_keys!6329 thiss!1504))))))

(declare-fun lt!115420 () Unit!6970)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3346) Unit!6970)

(assert (=> b!229396 (= lt!115420 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6329 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3343))))

(declare-fun lt!115419 () Unit!6970)

(assert (=> b!229396 (= lt!115419 e!148816)))

(declare-fun c!38051 () Bool)

(assert (=> b!229396 (= c!38051 (arrayContainsKey!0 (_keys!6329 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229397 () Bool)

(assert (=> b!229397 (= e!148820 tp_is_empty!6019)))

(declare-fun b!229398 () Bool)

(declare-fun Unit!6974 () Unit!6970)

(assert (=> b!229398 (= e!148816 Unit!6974)))

(declare-fun lt!115413 () Unit!6970)

(declare-fun lemmaArrayContainsKeyThenInListMap!120 (array!11281 array!11279 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) (_ BitVec 32) Int) Unit!6970)

(assert (=> b!229398 (= lt!115413 (lemmaArrayContainsKeyThenInListMap!120 (_keys!6329 thiss!1504) (_values!4258 thiss!1504) (mask!10155 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4275 thiss!1504)))))

(assert (=> b!229398 false))

(declare-fun b!229399 () Bool)

(assert (=> b!229399 (= e!148812 tp_is_empty!6019)))

(declare-fun mapIsEmpty!10198 () Bool)

(assert (=> mapIsEmpty!10198 mapRes!10198))

(declare-fun b!229400 () Bool)

(assert (=> b!229400 (= e!148822 e!148823)))

(declare-fun res!112897 () Bool)

(assert (=> b!229400 (=> (not res!112897) (not e!148823))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229400 (= res!112897 (inRange!0 index!297 (mask!10155 thiss!1504)))))

(declare-fun lt!115423 () Unit!6970)

(assert (=> b!229400 (= lt!115423 e!148815)))

(declare-fun c!38052 () Bool)

(declare-datatypes ((tuple2!4430 0))(
  ( (tuple2!4431 (_1!2226 (_ BitVec 64)) (_2!2226 V!7673)) )
))
(declare-datatypes ((List!3347 0))(
  ( (Nil!3344) (Cons!3343 (h!3991 tuple2!4430) (t!8298 List!3347)) )
))
(declare-datatypes ((ListLongMap!3345 0))(
  ( (ListLongMap!3346 (toList!1688 List!3347)) )
))
(declare-fun contains!1577 (ListLongMap!3345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1220 (array!11281 array!11279 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 32) Int) ListLongMap!3345)

(assert (=> b!229400 (= c!38052 (contains!1577 (getCurrentListMap!1220 (_keys!6329 thiss!1504) (_values!4258 thiss!1504) (mask!10155 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4275 thiss!1504)) key!932))))

(declare-fun bm!21291 () Bool)

(assert (=> bm!21291 (= call!21293 (inRange!0 (ite c!38053 (index!5726 lt!115421) (index!5729 lt!115421)) (mask!10155 thiss!1504)))))

(declare-fun b!229401 () Bool)

(declare-fun res!112894 () Bool)

(assert (=> b!229401 (=> res!112894 e!148811)))

(assert (=> b!229401 (= res!112894 (or (not (= (size!5692 (_values!4258 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10155 thiss!1504)))) (not (= (size!5693 (_keys!6329 thiss!1504)) (size!5692 (_values!4258 thiss!1504)))) (bvslt (mask!10155 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4012 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4012 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!22094 res!112890) b!229379))

(assert (= (and b!229379 res!112896) b!229389))

(assert (= (and b!229389 res!112895) b!229400))

(assert (= (and b!229400 c!38052) b!229385))

(assert (= (and b!229400 (not c!38052)) b!229395))

(assert (= (and b!229395 c!38053) b!229381))

(assert (= (and b!229395 (not c!38053)) b!229384))

(assert (= (and b!229381 res!112891) b!229390))

(assert (= (and b!229390 res!112893) b!229386))

(assert (= (and b!229384 c!38050) b!229383))

(assert (= (and b!229384 (not c!38050)) b!229380))

(assert (= (and b!229383 res!112889) b!229382))

(assert (= (and b!229382 res!112887) b!229391))

(assert (= (or b!229381 b!229383) bm!21291))

(assert (= (or b!229386 b!229391) bm!21290))

(assert (= (and b!229400 res!112897) b!229396))

(assert (= (and b!229396 c!38051) b!229398))

(assert (= (and b!229396 (not c!38051)) b!229393))

(assert (= (and b!229396 (not res!112888)) b!229401))

(assert (= (and b!229401 (not res!112894)) b!229392))

(assert (= (and b!229392 (not res!112892)) b!229388))

(assert (= (and b!229394 condMapEmpty!10198) mapIsEmpty!10198))

(assert (= (and b!229394 (not condMapEmpty!10198)) mapNonEmpty!10198))

(assert (= (and mapNonEmpty!10198 ((_ is ValueCellFull!2666) mapValue!10198)) b!229399))

(assert (= (and b!229394 ((_ is ValueCellFull!2666) mapDefault!10198)) b!229397))

(assert (= b!229387 b!229394))

(assert (= start!22094 b!229387))

(declare-fun m!251053 () Bool)

(assert (=> bm!21291 m!251053))

(declare-fun m!251055 () Bool)

(assert (=> b!229390 m!251055))

(declare-fun m!251057 () Bool)

(assert (=> mapNonEmpty!10198 m!251057))

(declare-fun m!251059 () Bool)

(assert (=> b!229388 m!251059))

(declare-fun m!251061 () Bool)

(assert (=> b!229395 m!251061))

(declare-fun m!251063 () Bool)

(assert (=> b!229382 m!251063))

(declare-fun m!251065 () Bool)

(assert (=> bm!21290 m!251065))

(declare-fun m!251067 () Bool)

(assert (=> b!229392 m!251067))

(declare-fun m!251069 () Bool)

(assert (=> b!229400 m!251069))

(declare-fun m!251071 () Bool)

(assert (=> b!229400 m!251071))

(assert (=> b!229400 m!251071))

(declare-fun m!251073 () Bool)

(assert (=> b!229400 m!251073))

(declare-fun m!251075 () Bool)

(assert (=> b!229385 m!251075))

(declare-fun m!251077 () Bool)

(assert (=> b!229398 m!251077))

(declare-fun m!251079 () Bool)

(assert (=> b!229396 m!251079))

(assert (=> b!229396 m!251065))

(declare-fun m!251081 () Bool)

(assert (=> b!229396 m!251081))

(declare-fun m!251083 () Bool)

(assert (=> b!229396 m!251083))

(declare-fun m!251085 () Bool)

(assert (=> b!229396 m!251085))

(declare-fun m!251087 () Bool)

(assert (=> b!229396 m!251087))

(declare-fun m!251089 () Bool)

(assert (=> b!229396 m!251089))

(declare-fun m!251091 () Bool)

(assert (=> b!229396 m!251091))

(declare-fun m!251093 () Bool)

(assert (=> b!229396 m!251093))

(declare-fun m!251095 () Bool)

(assert (=> b!229396 m!251095))

(declare-fun m!251097 () Bool)

(assert (=> b!229389 m!251097))

(declare-fun m!251099 () Bool)

(assert (=> start!22094 m!251099))

(declare-fun m!251101 () Bool)

(assert (=> b!229387 m!251101))

(declare-fun m!251103 () Bool)

(assert (=> b!229387 m!251103))

(check-sat (not b!229387) (not b!229389) tp_is_empty!6019 (not b!229395) b_and!13069 (not b!229398) (not b_next!6157) (not b!229388) (not mapNonEmpty!10198) (not bm!21290) (not b!229396) (not bm!21291) (not b!229400) (not b!229385) (not b!229392) (not start!22094))
(check-sat b_and!13069 (not b_next!6157))
