; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22190 () Bool)

(assert start!22190)

(declare-fun b!232127 () Bool)

(declare-fun b_free!6253 () Bool)

(declare-fun b_next!6253 () Bool)

(assert (=> b!232127 (= b_free!6253 (not b_next!6253))))

(declare-fun tp!21900 () Bool)

(declare-fun b_and!13125 () Bool)

(assert (=> b!232127 (= tp!21900 b_and!13125)))

(declare-fun b!232113 () Bool)

(declare-datatypes ((Unit!7147 0))(
  ( (Unit!7148) )
))
(declare-fun e!150720 () Unit!7147)

(declare-fun lt!117064 () Unit!7147)

(assert (=> b!232113 (= e!150720 lt!117064)))

(declare-datatypes ((V!7801 0))(
  ( (V!7802 (val!3102 Int)) )
))
(declare-datatypes ((ValueCell!2714 0))(
  ( (ValueCellFull!2714 (v!5116 V!7801)) (EmptyCell!2714) )
))
(declare-datatypes ((array!11465 0))(
  ( (array!11466 (arr!5451 (Array (_ BitVec 32) ValueCell!2714)) (size!5785 (_ BitVec 32))) )
))
(declare-datatypes ((array!11467 0))(
  ( (array!11468 (arr!5452 (Array (_ BitVec 32) (_ BitVec 64))) (size!5786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3328 0))(
  ( (LongMapFixedSize!3329 (defaultEntry!4323 Int) (mask!10234 (_ BitVec 32)) (extraKeys!4060 (_ BitVec 32)) (zeroValue!4164 V!7801) (minValue!4164 V!7801) (_size!1713 (_ BitVec 32)) (_keys!6376 array!11467) (_values!4306 array!11465) (_vacant!1713 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3328)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!310 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 64) Int) Unit!7147)

(assert (=> b!232113 (= lt!117064 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!310 (_keys!6376 thiss!1504) (_values!4306 thiss!1504) (mask!10234 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) key!932 (defaultEntry!4323 thiss!1504)))))

(declare-fun c!38587 () Bool)

(declare-datatypes ((SeekEntryResult!965 0))(
  ( (MissingZero!965 (index!6030 (_ BitVec 32))) (Found!965 (index!6031 (_ BitVec 32))) (Intermediate!965 (undefined!1777 Bool) (index!6032 (_ BitVec 32)) (x!23552 (_ BitVec 32))) (Undefined!965) (MissingVacant!965 (index!6033 (_ BitVec 32))) )
))
(declare-fun lt!117070 () SeekEntryResult!965)

(get-info :version)

(assert (=> b!232113 (= c!38587 ((_ is MissingZero!965) lt!117070))))

(declare-fun e!150729 () Bool)

(assert (=> b!232113 e!150729))

(declare-fun b!232114 () Bool)

(declare-fun e!150718 () Bool)

(declare-fun tp_is_empty!6115 () Bool)

(assert (=> b!232114 (= e!150718 tp_is_empty!6115)))

(declare-fun b!232115 () Bool)

(declare-fun e!150719 () Bool)

(assert (=> b!232115 (= e!150719 tp_is_empty!6115)))

(declare-fun b!232116 () Bool)

(declare-fun c!38589 () Bool)

(assert (=> b!232116 (= c!38589 ((_ is MissingVacant!965) lt!117070))))

(declare-fun e!150724 () Bool)

(assert (=> b!232116 (= e!150729 e!150724)))

(declare-fun mapNonEmpty!10342 () Bool)

(declare-fun mapRes!10342 () Bool)

(declare-fun tp!21901 () Bool)

(assert (=> mapNonEmpty!10342 (= mapRes!10342 (and tp!21901 e!150719))))

(declare-fun mapKey!10342 () (_ BitVec 32))

(declare-fun mapValue!10342 () ValueCell!2714)

(declare-fun mapRest!10342 () (Array (_ BitVec 32) ValueCell!2714))

(assert (=> mapNonEmpty!10342 (= (arr!5451 (_values!4306 thiss!1504)) (store mapRest!10342 mapKey!10342 mapValue!10342))))

(declare-fun b!232117 () Bool)

(declare-fun e!150722 () Bool)

(assert (=> b!232117 (= e!150722 (and e!150718 mapRes!10342))))

(declare-fun condMapEmpty!10342 () Bool)

(declare-fun mapDefault!10342 () ValueCell!2714)

(assert (=> b!232117 (= condMapEmpty!10342 (= (arr!5451 (_values!4306 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2714)) mapDefault!10342)))))

(declare-fun b!232118 () Bool)

(declare-fun e!150727 () Bool)

(declare-fun e!150721 () Bool)

(assert (=> b!232118 (= e!150727 e!150721)))

(declare-fun res!113973 () Bool)

(assert (=> b!232118 (=> (not res!113973) (not e!150721))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232118 (= res!113973 (inRange!0 index!297 (mask!10234 thiss!1504)))))

(declare-fun lt!117069 () Unit!7147)

(assert (=> b!232118 (= lt!117069 e!150720)))

(declare-fun c!38590 () Bool)

(declare-datatypes ((tuple2!4554 0))(
  ( (tuple2!4555 (_1!2288 (_ BitVec 64)) (_2!2288 V!7801)) )
))
(declare-datatypes ((List!3491 0))(
  ( (Nil!3488) (Cons!3487 (h!4135 tuple2!4554) (t!8441 List!3491)) )
))
(declare-datatypes ((ListLongMap!3457 0))(
  ( (ListLongMap!3458 (toList!1744 List!3491)) )
))
(declare-fun lt!117063 () ListLongMap!3457)

(declare-fun contains!1615 (ListLongMap!3457 (_ BitVec 64)) Bool)

(assert (=> b!232118 (= c!38590 (contains!1615 lt!117063 key!932))))

(declare-fun getCurrentListMap!1253 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 32) Int) ListLongMap!3457)

(assert (=> b!232118 (= lt!117063 (getCurrentListMap!1253 (_keys!6376 thiss!1504) (_values!4306 thiss!1504) (mask!10234 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4323 thiss!1504)))))

(declare-fun b!232119 () Bool)

(assert (=> b!232119 (= e!150721 (not true))))

(declare-fun lt!117065 () array!11467)

(declare-fun arrayCountValidKeys!0 (array!11467 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232119 (= (arrayCountValidKeys!0 lt!117065 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117060 () Unit!7147)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11467 (_ BitVec 32)) Unit!7147)

(assert (=> b!232119 (= lt!117060 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117065 index!297))))

(declare-fun arrayContainsKey!0 (array!11467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232119 (arrayContainsKey!0 lt!117065 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117073 () Unit!7147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11467 (_ BitVec 64) (_ BitVec 32)) Unit!7147)

(assert (=> b!232119 (= lt!117073 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117065 key!932 index!297))))

(declare-fun v!346 () V!7801)

(declare-fun +!629 (ListLongMap!3457 tuple2!4554) ListLongMap!3457)

(assert (=> b!232119 (= (+!629 lt!117063 (tuple2!4555 key!932 v!346)) (getCurrentListMap!1253 lt!117065 (array!11466 (store (arr!5451 (_values!4306 thiss!1504)) index!297 (ValueCellFull!2714 v!346)) (size!5785 (_values!4306 thiss!1504))) (mask!10234 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4323 thiss!1504)))))

(declare-fun lt!117071 () Unit!7147)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!84 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 32) (_ BitVec 64) V!7801 Int) Unit!7147)

(assert (=> b!232119 (= lt!117071 (lemmaAddValidKeyToArrayThenAddPairToListMap!84 (_keys!6376 thiss!1504) (_values!4306 thiss!1504) (mask!10234 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) index!297 key!932 v!346 (defaultEntry!4323 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11467 (_ BitVec 32)) Bool)

(assert (=> b!232119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117065 (mask!10234 thiss!1504))))

(declare-fun lt!117066 () Unit!7147)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11467 (_ BitVec 32) (_ BitVec 32)) Unit!7147)

(assert (=> b!232119 (= lt!117066 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6376 thiss!1504) index!297 (mask!10234 thiss!1504)))))

(assert (=> b!232119 (= (arrayCountValidKeys!0 lt!117065 #b00000000000000000000000000000000 (size!5786 (_keys!6376 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6376 thiss!1504) #b00000000000000000000000000000000 (size!5786 (_keys!6376 thiss!1504)))))))

(declare-fun lt!117062 () Unit!7147)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11467 (_ BitVec 32) (_ BitVec 64)) Unit!7147)

(assert (=> b!232119 (= lt!117062 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6376 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3492 0))(
  ( (Nil!3489) (Cons!3488 (h!4136 (_ BitVec 64)) (t!8442 List!3492)) )
))
(declare-fun arrayNoDuplicates!0 (array!11467 (_ BitVec 32) List!3492) Bool)

(assert (=> b!232119 (arrayNoDuplicates!0 lt!117065 #b00000000000000000000000000000000 Nil!3489)))

(assert (=> b!232119 (= lt!117065 (array!11468 (store (arr!5452 (_keys!6376 thiss!1504)) index!297 key!932) (size!5786 (_keys!6376 thiss!1504))))))

(declare-fun lt!117061 () Unit!7147)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3492) Unit!7147)

(assert (=> b!232119 (= lt!117061 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6376 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3489))))

(declare-fun lt!117067 () Unit!7147)

(declare-fun e!150723 () Unit!7147)

(assert (=> b!232119 (= lt!117067 e!150723)))

(declare-fun c!38588 () Bool)

(assert (=> b!232119 (= c!38588 (arrayContainsKey!0 (_keys!6376 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232120 () Bool)

(declare-fun res!113971 () Bool)

(declare-fun e!150716 () Bool)

(assert (=> b!232120 (=> (not res!113971) (not e!150716))))

(declare-fun call!21570 () Bool)

(assert (=> b!232120 (= res!113971 call!21570)))

(assert (=> b!232120 (= e!150729 e!150716)))

(declare-fun b!232121 () Bool)

(declare-fun Unit!7149 () Unit!7147)

(assert (=> b!232121 (= e!150723 Unit!7149)))

(declare-fun b!232122 () Bool)

(declare-fun e!150728 () Bool)

(declare-fun call!21569 () Bool)

(assert (=> b!232122 (= e!150728 (not call!21569))))

(declare-fun b!232123 () Bool)

(declare-fun e!150726 () Bool)

(assert (=> b!232123 (= e!150726 e!150727)))

(declare-fun res!113972 () Bool)

(assert (=> b!232123 (=> (not res!113972) (not e!150727))))

(assert (=> b!232123 (= res!113972 (or (= lt!117070 (MissingZero!965 index!297)) (= lt!117070 (MissingVacant!965 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11467 (_ BitVec 32)) SeekEntryResult!965)

(assert (=> b!232123 (= lt!117070 (seekEntryOrOpen!0 key!932 (_keys!6376 thiss!1504) (mask!10234 thiss!1504)))))

(declare-fun b!232124 () Bool)

(assert (=> b!232124 (= e!150724 ((_ is Undefined!965) lt!117070))))

(declare-fun b!232125 () Bool)

(assert (=> b!232125 (= e!150724 e!150728)))

(declare-fun res!113975 () Bool)

(assert (=> b!232125 (= res!113975 call!21570)))

(assert (=> b!232125 (=> (not res!113975) (not e!150728))))

(declare-fun b!232126 () Bool)

(declare-fun res!113974 () Bool)

(assert (=> b!232126 (=> (not res!113974) (not e!150716))))

(assert (=> b!232126 (= res!113974 (= (select (arr!5452 (_keys!6376 thiss!1504)) (index!6030 lt!117070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232128 () Bool)

(declare-fun Unit!7150 () Unit!7147)

(assert (=> b!232128 (= e!150723 Unit!7150)))

(declare-fun lt!117072 () Unit!7147)

(declare-fun lemmaArrayContainsKeyThenInListMap!152 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 64) (_ BitVec 32) Int) Unit!7147)

(assert (=> b!232128 (= lt!117072 (lemmaArrayContainsKeyThenInListMap!152 (_keys!6376 thiss!1504) (_values!4306 thiss!1504) (mask!10234 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4323 thiss!1504)))))

(assert (=> b!232128 false))

(declare-fun e!150717 () Bool)

(declare-fun array_inv!3597 (array!11467) Bool)

(declare-fun array_inv!3598 (array!11465) Bool)

(assert (=> b!232127 (= e!150717 (and tp!21900 tp_is_empty!6115 (array_inv!3597 (_keys!6376 thiss!1504)) (array_inv!3598 (_values!4306 thiss!1504)) e!150722))))

(declare-fun res!113978 () Bool)

(assert (=> start!22190 (=> (not res!113978) (not e!150726))))

(declare-fun valid!1332 (LongMapFixedSize!3328) Bool)

(assert (=> start!22190 (= res!113978 (valid!1332 thiss!1504))))

(assert (=> start!22190 e!150726))

(assert (=> start!22190 e!150717))

(assert (=> start!22190 true))

(assert (=> start!22190 tp_is_empty!6115))

(declare-fun b!232129 () Bool)

(declare-fun Unit!7151 () Unit!7147)

(assert (=> b!232129 (= e!150720 Unit!7151)))

(declare-fun lt!117068 () Unit!7147)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!313 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 64) Int) Unit!7147)

(assert (=> b!232129 (= lt!117068 (lemmaInListMapThenSeekEntryOrOpenFindsIt!313 (_keys!6376 thiss!1504) (_values!4306 thiss!1504) (mask!10234 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) key!932 (defaultEntry!4323 thiss!1504)))))

(assert (=> b!232129 false))

(declare-fun b!232130 () Bool)

(assert (=> b!232130 (= e!150716 (not call!21569))))

(declare-fun b!232131 () Bool)

(declare-fun res!113976 () Bool)

(assert (=> b!232131 (= res!113976 (= (select (arr!5452 (_keys!6376 thiss!1504)) (index!6033 lt!117070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232131 (=> (not res!113976) (not e!150728))))

(declare-fun b!232132 () Bool)

(declare-fun res!113977 () Bool)

(assert (=> b!232132 (=> (not res!113977) (not e!150726))))

(assert (=> b!232132 (= res!113977 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21566 () Bool)

(assert (=> bm!21566 (= call!21569 (arrayContainsKey!0 (_keys!6376 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10342 () Bool)

(assert (=> mapIsEmpty!10342 mapRes!10342))

(declare-fun bm!21567 () Bool)

(assert (=> bm!21567 (= call!21570 (inRange!0 (ite c!38587 (index!6030 lt!117070) (index!6033 lt!117070)) (mask!10234 thiss!1504)))))

(assert (= (and start!22190 res!113978) b!232132))

(assert (= (and b!232132 res!113977) b!232123))

(assert (= (and b!232123 res!113972) b!232118))

(assert (= (and b!232118 c!38590) b!232129))

(assert (= (and b!232118 (not c!38590)) b!232113))

(assert (= (and b!232113 c!38587) b!232120))

(assert (= (and b!232113 (not c!38587)) b!232116))

(assert (= (and b!232120 res!113971) b!232126))

(assert (= (and b!232126 res!113974) b!232130))

(assert (= (and b!232116 c!38589) b!232125))

(assert (= (and b!232116 (not c!38589)) b!232124))

(assert (= (and b!232125 res!113975) b!232131))

(assert (= (and b!232131 res!113976) b!232122))

(assert (= (or b!232120 b!232125) bm!21567))

(assert (= (or b!232130 b!232122) bm!21566))

(assert (= (and b!232118 res!113973) b!232119))

(assert (= (and b!232119 c!38588) b!232128))

(assert (= (and b!232119 (not c!38588)) b!232121))

(assert (= (and b!232117 condMapEmpty!10342) mapIsEmpty!10342))

(assert (= (and b!232117 (not condMapEmpty!10342)) mapNonEmpty!10342))

(assert (= (and mapNonEmpty!10342 ((_ is ValueCellFull!2714) mapValue!10342)) b!232115))

(assert (= (and b!232117 ((_ is ValueCellFull!2714) mapDefault!10342)) b!232114))

(assert (= b!232127 b!232117))

(assert (= start!22190 b!232127))

(declare-fun m!253063 () Bool)

(assert (=> mapNonEmpty!10342 m!253063))

(declare-fun m!253065 () Bool)

(assert (=> b!232127 m!253065))

(declare-fun m!253067 () Bool)

(assert (=> b!232127 m!253067))

(declare-fun m!253069 () Bool)

(assert (=> bm!21567 m!253069))

(declare-fun m!253071 () Bool)

(assert (=> b!232118 m!253071))

(declare-fun m!253073 () Bool)

(assert (=> b!232118 m!253073))

(declare-fun m!253075 () Bool)

(assert (=> b!232118 m!253075))

(declare-fun m!253077 () Bool)

(assert (=> start!22190 m!253077))

(declare-fun m!253079 () Bool)

(assert (=> b!232126 m!253079))

(declare-fun m!253081 () Bool)

(assert (=> b!232119 m!253081))

(declare-fun m!253083 () Bool)

(assert (=> b!232119 m!253083))

(declare-fun m!253085 () Bool)

(assert (=> b!232119 m!253085))

(declare-fun m!253087 () Bool)

(assert (=> b!232119 m!253087))

(declare-fun m!253089 () Bool)

(assert (=> b!232119 m!253089))

(declare-fun m!253091 () Bool)

(assert (=> b!232119 m!253091))

(declare-fun m!253093 () Bool)

(assert (=> b!232119 m!253093))

(declare-fun m!253095 () Bool)

(assert (=> b!232119 m!253095))

(declare-fun m!253097 () Bool)

(assert (=> b!232119 m!253097))

(declare-fun m!253099 () Bool)

(assert (=> b!232119 m!253099))

(declare-fun m!253101 () Bool)

(assert (=> b!232119 m!253101))

(declare-fun m!253103 () Bool)

(assert (=> b!232119 m!253103))

(declare-fun m!253105 () Bool)

(assert (=> b!232119 m!253105))

(declare-fun m!253107 () Bool)

(assert (=> b!232119 m!253107))

(declare-fun m!253109 () Bool)

(assert (=> b!232119 m!253109))

(declare-fun m!253111 () Bool)

(assert (=> b!232119 m!253111))

(declare-fun m!253113 () Bool)

(assert (=> b!232119 m!253113))

(declare-fun m!253115 () Bool)

(assert (=> b!232131 m!253115))

(assert (=> bm!21566 m!253081))

(declare-fun m!253117 () Bool)

(assert (=> b!232129 m!253117))

(declare-fun m!253119 () Bool)

(assert (=> b!232113 m!253119))

(declare-fun m!253121 () Bool)

(assert (=> b!232123 m!253121))

(declare-fun m!253123 () Bool)

(assert (=> b!232128 m!253123))

(check-sat (not b!232119) (not b!232123) b_and!13125 (not mapNonEmpty!10342) (not b!232113) (not b_next!6253) (not b!232118) (not bm!21567) (not start!22190) (not b!232127) (not bm!21566) (not b!232129) (not b!232128) tp_is_empty!6115)
(check-sat b_and!13125 (not b_next!6253))
