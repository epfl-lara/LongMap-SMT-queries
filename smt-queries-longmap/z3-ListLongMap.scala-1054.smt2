; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22010 () Bool)

(assert start!22010)

(declare-fun b!226278 () Bool)

(declare-fun b_free!6073 () Bool)

(declare-fun b_next!6073 () Bool)

(assert (=> b!226278 (= b_free!6073 (not b_next!6073))))

(declare-fun tp!21360 () Bool)

(declare-fun b_and!12945 () Bool)

(assert (=> b!226278 (= tp!21360 b_and!12945)))

(declare-fun b!226255 () Bool)

(declare-fun e!146798 () Bool)

(declare-fun e!146796 () Bool)

(declare-fun mapRes!10072 () Bool)

(assert (=> b!226255 (= e!146798 (and e!146796 mapRes!10072))))

(declare-fun condMapEmpty!10072 () Bool)

(declare-datatypes ((V!7561 0))(
  ( (V!7562 (val!3012 Int)) )
))
(declare-datatypes ((ValueCell!2624 0))(
  ( (ValueCellFull!2624 (v!5026 V!7561)) (EmptyCell!2624) )
))
(declare-datatypes ((array!11105 0))(
  ( (array!11106 (arr!5271 (Array (_ BitVec 32) ValueCell!2624)) (size!5605 (_ BitVec 32))) )
))
(declare-datatypes ((array!11107 0))(
  ( (array!11108 (arr!5272 (Array (_ BitVec 32) (_ BitVec 64))) (size!5606 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3148 0))(
  ( (LongMapFixedSize!3149 (defaultEntry!4233 Int) (mask!10084 (_ BitVec 32)) (extraKeys!3970 (_ BitVec 32)) (zeroValue!4074 V!7561) (minValue!4074 V!7561) (_size!1623 (_ BitVec 32)) (_keys!6286 array!11107) (_values!4216 array!11105) (_vacant!1623 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3148)

(declare-fun mapDefault!10072 () ValueCell!2624)

(assert (=> b!226255 (= condMapEmpty!10072 (= (arr!5271 (_values!4216 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2624)) mapDefault!10072)))))

(declare-fun b!226256 () Bool)

(declare-fun e!146799 () Bool)

(declare-fun e!146801 () Bool)

(assert (=> b!226256 (= e!146799 e!146801)))

(declare-fun res!111359 () Bool)

(declare-fun call!21029 () Bool)

(assert (=> b!226256 (= res!111359 call!21029)))

(assert (=> b!226256 (=> (not res!111359) (not e!146801))))

(declare-fun b!226257 () Bool)

(declare-fun e!146802 () Bool)

(declare-fun e!146803 () Bool)

(assert (=> b!226257 (= e!146802 (not e!146803))))

(declare-fun res!111364 () Bool)

(assert (=> b!226257 (=> res!111364 e!146803)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226257 (= res!111364 (not (validMask!0 (mask!10084 thiss!1504))))))

(declare-fun lt!113793 () array!11107)

(declare-fun arrayCountValidKeys!0 (array!11107 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226257 (= (arrayCountValidKeys!0 lt!113793 #b00000000000000000000000000000000 (size!5606 (_keys!6286 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6286 thiss!1504) #b00000000000000000000000000000000 (size!5606 (_keys!6286 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!6797 0))(
  ( (Unit!6798) )
))
(declare-fun lt!113790 () Unit!6797)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11107 (_ BitVec 32) (_ BitVec 64)) Unit!6797)

(assert (=> b!226257 (= lt!113790 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6286 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3358 0))(
  ( (Nil!3355) (Cons!3354 (h!4002 (_ BitVec 64)) (t!8308 List!3358)) )
))
(declare-fun arrayNoDuplicates!0 (array!11107 (_ BitVec 32) List!3358) Bool)

(assert (=> b!226257 (arrayNoDuplicates!0 lt!113793 #b00000000000000000000000000000000 Nil!3355)))

(assert (=> b!226257 (= lt!113793 (array!11108 (store (arr!5272 (_keys!6286 thiss!1504)) index!297 key!932) (size!5606 (_keys!6286 thiss!1504))))))

(declare-fun lt!113791 () Unit!6797)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3358) Unit!6797)

(assert (=> b!226257 (= lt!113791 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6286 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3355))))

(declare-fun lt!113789 () Unit!6797)

(declare-fun e!146808 () Unit!6797)

(assert (=> b!226257 (= lt!113789 e!146808)))

(declare-fun c!37507 () Bool)

(declare-fun lt!113788 () Bool)

(assert (=> b!226257 (= c!37507 lt!113788)))

(declare-fun arrayContainsKey!0 (array!11107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226257 (= lt!113788 (arrayContainsKey!0 (_keys!6286 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226258 () Bool)

(declare-fun res!111361 () Bool)

(declare-fun e!146807 () Bool)

(assert (=> b!226258 (=> (not res!111361) (not e!146807))))

(assert (=> b!226258 (= res!111361 call!21029)))

(declare-fun e!146804 () Bool)

(assert (=> b!226258 (= e!146804 e!146807)))

(declare-fun b!226259 () Bool)

(declare-datatypes ((SeekEntryResult!880 0))(
  ( (MissingZero!880 (index!5690 (_ BitVec 32))) (Found!880 (index!5691 (_ BitVec 32))) (Intermediate!880 (undefined!1692 Bool) (index!5692 (_ BitVec 32)) (x!23227 (_ BitVec 32))) (Undefined!880) (MissingVacant!880 (index!5693 (_ BitVec 32))) )
))
(declare-fun lt!113794 () SeekEntryResult!880)

(get-info :version)

(assert (=> b!226259 (= e!146799 ((_ is Undefined!880) lt!113794))))

(declare-fun b!226260 () Bool)

(declare-fun Unit!6799 () Unit!6797)

(assert (=> b!226260 (= e!146808 Unit!6799)))

(declare-fun b!226261 () Bool)

(declare-fun res!111356 () Bool)

(assert (=> b!226261 (=> (not res!111356) (not e!146807))))

(assert (=> b!226261 (= res!111356 (= (select (arr!5272 (_keys!6286 thiss!1504)) (index!5690 lt!113794)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226262 () Bool)

(declare-fun Unit!6800 () Unit!6797)

(assert (=> b!226262 (= e!146808 Unit!6800)))

(declare-fun lt!113787 () Unit!6797)

(declare-fun lemmaArrayContainsKeyThenInListMap!92 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) (_ BitVec 32) Int) Unit!6797)

(assert (=> b!226262 (= lt!113787 (lemmaArrayContainsKeyThenInListMap!92 (_keys!6286 thiss!1504) (_values!4216 thiss!1504) (mask!10084 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4233 thiss!1504)))))

(assert (=> b!226262 false))

(declare-fun b!226263 () Bool)

(declare-fun e!146797 () Bool)

(declare-fun tp_is_empty!5935 () Bool)

(assert (=> b!226263 (= e!146797 tp_is_empty!5935)))

(declare-fun b!226264 () Bool)

(declare-fun e!146805 () Unit!6797)

(declare-fun lt!113792 () Unit!6797)

(assert (=> b!226264 (= e!146805 lt!113792)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!248 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) Int) Unit!6797)

(assert (=> b!226264 (= lt!113792 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!248 (_keys!6286 thiss!1504) (_values!4216 thiss!1504) (mask!10084 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 (defaultEntry!4233 thiss!1504)))))

(declare-fun c!37510 () Bool)

(assert (=> b!226264 (= c!37510 ((_ is MissingZero!880) lt!113794))))

(assert (=> b!226264 e!146804))

(declare-fun b!226265 () Bool)

(assert (=> b!226265 (= e!146796 tp_is_empty!5935)))

(declare-fun bm!21026 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21026 (= call!21029 (inRange!0 (ite c!37510 (index!5690 lt!113794) (index!5693 lt!113794)) (mask!10084 thiss!1504)))))

(declare-fun mapIsEmpty!10072 () Bool)

(assert (=> mapIsEmpty!10072 mapRes!10072))

(declare-fun b!226266 () Bool)

(declare-fun call!21030 () Bool)

(assert (=> b!226266 (= e!146801 (not call!21030))))

(declare-fun b!226267 () Bool)

(declare-fun e!146806 () Bool)

(declare-fun e!146795 () Bool)

(assert (=> b!226267 (= e!146806 e!146795)))

(declare-fun res!111354 () Bool)

(assert (=> b!226267 (=> (not res!111354) (not e!146795))))

(assert (=> b!226267 (= res!111354 (or (= lt!113794 (MissingZero!880 index!297)) (= lt!113794 (MissingVacant!880 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11107 (_ BitVec 32)) SeekEntryResult!880)

(assert (=> b!226267 (= lt!113794 (seekEntryOrOpen!0 key!932 (_keys!6286 thiss!1504) (mask!10084 thiss!1504)))))

(declare-fun b!226268 () Bool)

(declare-fun Unit!6801 () Unit!6797)

(assert (=> b!226268 (= e!146805 Unit!6801)))

(declare-fun lt!113797 () Unit!6797)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!252 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) Int) Unit!6797)

(assert (=> b!226268 (= lt!113797 (lemmaInListMapThenSeekEntryOrOpenFindsIt!252 (_keys!6286 thiss!1504) (_values!4216 thiss!1504) (mask!10084 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 (defaultEntry!4233 thiss!1504)))))

(assert (=> b!226268 false))

(declare-fun b!226269 () Bool)

(declare-fun res!111357 () Bool)

(assert (=> b!226269 (= res!111357 (= (select (arr!5272 (_keys!6286 thiss!1504)) (index!5693 lt!113794)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226269 (=> (not res!111357) (not e!146801))))

(declare-fun bm!21027 () Bool)

(assert (=> bm!21027 (= call!21030 (arrayContainsKey!0 (_keys!6286 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226270 () Bool)

(declare-fun res!111358 () Bool)

(assert (=> b!226270 (=> res!111358 e!146803)))

(assert (=> b!226270 (= res!111358 lt!113788)))

(declare-fun b!226271 () Bool)

(declare-fun res!111363 () Bool)

(assert (=> b!226271 (=> (not res!111363) (not e!146806))))

(assert (=> b!226271 (= res!111363 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226272 () Bool)

(declare-fun res!111360 () Bool)

(assert (=> b!226272 (=> res!111360 e!146803)))

(assert (=> b!226272 (= res!111360 (or (not (= (size!5606 (_keys!6286 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10084 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5606 (_keys!6286 thiss!1504)))))))

(declare-fun b!226273 () Bool)

(declare-fun res!111365 () Bool)

(assert (=> b!226273 (=> res!111365 e!146803)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226273 (= res!111365 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226274 () Bool)

(declare-fun res!111355 () Bool)

(assert (=> b!226274 (=> res!111355 e!146803)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11107 (_ BitVec 32)) Bool)

(assert (=> b!226274 (= res!111355 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6286 thiss!1504) (mask!10084 thiss!1504))))))

(declare-fun b!226275 () Bool)

(declare-fun c!37508 () Bool)

(assert (=> b!226275 (= c!37508 ((_ is MissingVacant!880) lt!113794))))

(assert (=> b!226275 (= e!146804 e!146799)))

(declare-fun b!226276 () Bool)

(assert (=> b!226276 (= e!146807 (not call!21030))))

(declare-fun b!226277 () Bool)

(assert (=> b!226277 (= e!146795 e!146802)))

(declare-fun res!111353 () Bool)

(assert (=> b!226277 (=> (not res!111353) (not e!146802))))

(assert (=> b!226277 (= res!111353 (inRange!0 index!297 (mask!10084 thiss!1504)))))

(declare-fun lt!113796 () Unit!6797)

(assert (=> b!226277 (= lt!113796 e!146805)))

(declare-fun c!37509 () Bool)

(declare-datatypes ((tuple2!4430 0))(
  ( (tuple2!4431 (_1!2226 (_ BitVec 64)) (_2!2226 V!7561)) )
))
(declare-datatypes ((List!3359 0))(
  ( (Nil!3356) (Cons!3355 (h!4003 tuple2!4430) (t!8309 List!3359)) )
))
(declare-datatypes ((ListLongMap!3333 0))(
  ( (ListLongMap!3334 (toList!1682 List!3359)) )
))
(declare-fun contains!1557 (ListLongMap!3333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1191 (array!11107 array!11105 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 32) Int) ListLongMap!3333)

(assert (=> b!226277 (= c!37509 (contains!1557 (getCurrentListMap!1191 (_keys!6286 thiss!1504) (_values!4216 thiss!1504) (mask!10084 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4233 thiss!1504)) key!932))))

(declare-fun e!146794 () Bool)

(declare-fun array_inv!3477 (array!11107) Bool)

(declare-fun array_inv!3478 (array!11105) Bool)

(assert (=> b!226278 (= e!146794 (and tp!21360 tp_is_empty!5935 (array_inv!3477 (_keys!6286 thiss!1504)) (array_inv!3478 (_values!4216 thiss!1504)) e!146798))))

(declare-fun res!111362 () Bool)

(assert (=> start!22010 (=> (not res!111362) (not e!146806))))

(declare-fun valid!1276 (LongMapFixedSize!3148) Bool)

(assert (=> start!22010 (= res!111362 (valid!1276 thiss!1504))))

(assert (=> start!22010 e!146806))

(assert (=> start!22010 e!146794))

(assert (=> start!22010 true))

(declare-fun b!226279 () Bool)

(assert (=> b!226279 (= e!146803 true)))

(declare-fun lt!113795 () Bool)

(assert (=> b!226279 (= lt!113795 (arrayNoDuplicates!0 (_keys!6286 thiss!1504) #b00000000000000000000000000000000 Nil!3355))))

(declare-fun mapNonEmpty!10072 () Bool)

(declare-fun tp!21361 () Bool)

(assert (=> mapNonEmpty!10072 (= mapRes!10072 (and tp!21361 e!146797))))

(declare-fun mapValue!10072 () ValueCell!2624)

(declare-fun mapRest!10072 () (Array (_ BitVec 32) ValueCell!2624))

(declare-fun mapKey!10072 () (_ BitVec 32))

(assert (=> mapNonEmpty!10072 (= (arr!5271 (_values!4216 thiss!1504)) (store mapRest!10072 mapKey!10072 mapValue!10072))))

(assert (= (and start!22010 res!111362) b!226271))

(assert (= (and b!226271 res!111363) b!226267))

(assert (= (and b!226267 res!111354) b!226277))

(assert (= (and b!226277 c!37509) b!226268))

(assert (= (and b!226277 (not c!37509)) b!226264))

(assert (= (and b!226264 c!37510) b!226258))

(assert (= (and b!226264 (not c!37510)) b!226275))

(assert (= (and b!226258 res!111361) b!226261))

(assert (= (and b!226261 res!111356) b!226276))

(assert (= (and b!226275 c!37508) b!226256))

(assert (= (and b!226275 (not c!37508)) b!226259))

(assert (= (and b!226256 res!111359) b!226269))

(assert (= (and b!226269 res!111357) b!226266))

(assert (= (or b!226258 b!226256) bm!21026))

(assert (= (or b!226276 b!226266) bm!21027))

(assert (= (and b!226277 res!111353) b!226257))

(assert (= (and b!226257 c!37507) b!226262))

(assert (= (and b!226257 (not c!37507)) b!226260))

(assert (= (and b!226257 (not res!111364)) b!226272))

(assert (= (and b!226272 (not res!111360)) b!226273))

(assert (= (and b!226273 (not res!111365)) b!226270))

(assert (= (and b!226270 (not res!111358)) b!226274))

(assert (= (and b!226274 (not res!111355)) b!226279))

(assert (= (and b!226255 condMapEmpty!10072) mapIsEmpty!10072))

(assert (= (and b!226255 (not condMapEmpty!10072)) mapNonEmpty!10072))

(assert (= (and mapNonEmpty!10072 ((_ is ValueCellFull!2624) mapValue!10072)) b!226263))

(assert (= (and b!226255 ((_ is ValueCellFull!2624) mapDefault!10072)) b!226265))

(assert (= b!226278 b!226255))

(assert (= start!22010 b!226278))

(declare-fun m!248083 () Bool)

(assert (=> start!22010 m!248083))

(declare-fun m!248085 () Bool)

(assert (=> b!226273 m!248085))

(declare-fun m!248087 () Bool)

(assert (=> b!226277 m!248087))

(declare-fun m!248089 () Bool)

(assert (=> b!226277 m!248089))

(assert (=> b!226277 m!248089))

(declare-fun m!248091 () Bool)

(assert (=> b!226277 m!248091))

(declare-fun m!248093 () Bool)

(assert (=> b!226262 m!248093))

(declare-fun m!248095 () Bool)

(assert (=> b!226267 m!248095))

(declare-fun m!248097 () Bool)

(assert (=> bm!21027 m!248097))

(declare-fun m!248099 () Bool)

(assert (=> b!226264 m!248099))

(declare-fun m!248101 () Bool)

(assert (=> b!226274 m!248101))

(declare-fun m!248103 () Bool)

(assert (=> b!226278 m!248103))

(declare-fun m!248105 () Bool)

(assert (=> b!226278 m!248105))

(declare-fun m!248107 () Bool)

(assert (=> bm!21026 m!248107))

(declare-fun m!248109 () Bool)

(assert (=> b!226279 m!248109))

(declare-fun m!248111 () Bool)

(assert (=> b!226269 m!248111))

(declare-fun m!248113 () Bool)

(assert (=> b!226268 m!248113))

(declare-fun m!248115 () Bool)

(assert (=> b!226257 m!248115))

(assert (=> b!226257 m!248097))

(declare-fun m!248117 () Bool)

(assert (=> b!226257 m!248117))

(declare-fun m!248119 () Bool)

(assert (=> b!226257 m!248119))

(declare-fun m!248121 () Bool)

(assert (=> b!226257 m!248121))

(declare-fun m!248123 () Bool)

(assert (=> b!226257 m!248123))

(declare-fun m!248125 () Bool)

(assert (=> b!226257 m!248125))

(declare-fun m!248127 () Bool)

(assert (=> b!226257 m!248127))

(declare-fun m!248129 () Bool)

(assert (=> b!226261 m!248129))

(declare-fun m!248131 () Bool)

(assert (=> mapNonEmpty!10072 m!248131))

(check-sat (not b!226279) (not b!226278) (not start!22010) (not b_next!6073) (not b!226257) (not b!226273) (not b!226262) (not mapNonEmpty!10072) (not b!226268) (not b!226264) b_and!12945 tp_is_empty!5935 (not b!226274) (not b!226277) (not bm!21026) (not b!226267) (not bm!21027))
(check-sat b_and!12945 (not b_next!6073))
