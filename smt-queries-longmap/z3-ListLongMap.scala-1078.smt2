; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22154 () Bool)

(assert start!22154)

(declare-fun b!231239 () Bool)

(declare-fun b_free!6217 () Bool)

(declare-fun b_next!6217 () Bool)

(assert (=> b!231239 (= b_free!6217 (not b_next!6217))))

(declare-fun tp!21793 () Bool)

(declare-fun b_and!13129 () Bool)

(assert (=> b!231239 (= tp!21793 b_and!13129)))

(declare-fun b!231227 () Bool)

(declare-fun res!113660 () Bool)

(declare-fun e!150087 () Bool)

(assert (=> b!231227 (=> (not res!113660) (not e!150087))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!231227 (= res!113660 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231228 () Bool)

(declare-fun e!150095 () Bool)

(declare-fun tp_is_empty!6079 () Bool)

(assert (=> b!231228 (= e!150095 tp_is_empty!6079)))

(declare-fun b!231229 () Bool)

(declare-fun e!150096 () Bool)

(assert (=> b!231229 (= e!150096 tp_is_empty!6079)))

(declare-fun b!231230 () Bool)

(declare-fun e!150098 () Bool)

(declare-fun call!21473 () Bool)

(assert (=> b!231230 (= e!150098 (not call!21473))))

(declare-fun b!231231 () Bool)

(declare-fun e!150089 () Bool)

(assert (=> b!231231 (= e!150089 e!150098)))

(declare-fun res!113657 () Bool)

(declare-fun call!21474 () Bool)

(assert (=> b!231231 (= res!113657 call!21474)))

(assert (=> b!231231 (=> (not res!113657) (not e!150098))))

(declare-fun mapNonEmpty!10288 () Bool)

(declare-fun mapRes!10288 () Bool)

(declare-fun tp!21792 () Bool)

(assert (=> mapNonEmpty!10288 (= mapRes!10288 (and tp!21792 e!150096))))

(declare-datatypes ((V!7753 0))(
  ( (V!7754 (val!3084 Int)) )
))
(declare-datatypes ((ValueCell!2696 0))(
  ( (ValueCellFull!2696 (v!5105 V!7753)) (EmptyCell!2696) )
))
(declare-datatypes ((array!11399 0))(
  ( (array!11400 (arr!5419 (Array (_ BitVec 32) ValueCell!2696)) (size!5752 (_ BitVec 32))) )
))
(declare-datatypes ((array!11401 0))(
  ( (array!11402 (arr!5420 (Array (_ BitVec 32) (_ BitVec 64))) (size!5753 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3292 0))(
  ( (LongMapFixedSize!3293 (defaultEntry!4305 Int) (mask!10205 (_ BitVec 32)) (extraKeys!4042 (_ BitVec 32)) (zeroValue!4146 V!7753) (minValue!4146 V!7753) (_size!1695 (_ BitVec 32)) (_keys!6359 array!11401) (_values!4288 array!11399) (_vacant!1695 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3292)

(declare-fun mapValue!10288 () ValueCell!2696)

(declare-fun mapKey!10288 () (_ BitVec 32))

(declare-fun mapRest!10288 () (Array (_ BitVec 32) ValueCell!2696))

(assert (=> mapNonEmpty!10288 (= (arr!5419 (_values!4288 thiss!1504)) (store mapRest!10288 mapKey!10288 mapValue!10288))))

(declare-fun mapIsEmpty!10288 () Bool)

(assert (=> mapIsEmpty!10288 mapRes!10288))

(declare-fun bm!21470 () Bool)

(declare-fun arrayContainsKey!0 (array!11401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21470 (= call!21473 (arrayContainsKey!0 (_keys!6359 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231233 () Bool)

(declare-fun e!150090 () Bool)

(assert (=> b!231233 (= e!150090 (not call!21473))))

(declare-fun b!231234 () Bool)

(declare-datatypes ((Unit!7085 0))(
  ( (Unit!7086) )
))
(declare-fun e!150088 () Unit!7085)

(declare-fun lt!116550 () Unit!7085)

(assert (=> b!231234 (= e!150088 lt!116550)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!295 (array!11401 array!11399 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) Int) Unit!7085)

(assert (=> b!231234 (= lt!116550 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!295 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 (defaultEntry!4305 thiss!1504)))))

(declare-fun c!38411 () Bool)

(declare-datatypes ((SeekEntryResult!915 0))(
  ( (MissingZero!915 (index!5830 (_ BitVec 32))) (Found!915 (index!5831 (_ BitVec 32))) (Intermediate!915 (undefined!1727 Bool) (index!5832 (_ BitVec 32)) (x!23455 (_ BitVec 32))) (Undefined!915) (MissingVacant!915 (index!5833 (_ BitVec 32))) )
))
(declare-fun lt!116551 () SeekEntryResult!915)

(get-info :version)

(assert (=> b!231234 (= c!38411 ((_ is MissingZero!915) lt!116551))))

(declare-fun e!150091 () Bool)

(assert (=> b!231234 e!150091))

(declare-fun b!231235 () Bool)

(declare-fun res!113661 () Bool)

(assert (=> b!231235 (=> (not res!113661) (not e!150090))))

(assert (=> b!231235 (= res!113661 call!21474)))

(assert (=> b!231235 (= e!150091 e!150090)))

(declare-fun b!231236 () Bool)

(declare-fun e!150086 () Unit!7085)

(declare-fun Unit!7087 () Unit!7085)

(assert (=> b!231236 (= e!150086 Unit!7087)))

(declare-fun b!231237 () Bool)

(declare-fun res!113655 () Bool)

(assert (=> b!231237 (=> (not res!113655) (not e!150090))))

(assert (=> b!231237 (= res!113655 (= (select (arr!5420 (_keys!6359 thiss!1504)) (index!5830 lt!116551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231238 () Bool)

(declare-fun e!150085 () Bool)

(assert (=> b!231238 (= e!150085 (and e!150095 mapRes!10288))))

(declare-fun condMapEmpty!10288 () Bool)

(declare-fun mapDefault!10288 () ValueCell!2696)

(assert (=> b!231238 (= condMapEmpty!10288 (= (arr!5419 (_values!4288 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2696)) mapDefault!10288)))))

(declare-fun b!231232 () Bool)

(declare-fun e!150097 () Bool)

(assert (=> b!231232 (= e!150087 e!150097)))

(declare-fun res!113656 () Bool)

(assert (=> b!231232 (=> (not res!113656) (not e!150097))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231232 (= res!113656 (or (= lt!116551 (MissingZero!915 index!297)) (= lt!116551 (MissingVacant!915 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11401 (_ BitVec 32)) SeekEntryResult!915)

(assert (=> b!231232 (= lt!116551 (seekEntryOrOpen!0 key!932 (_keys!6359 thiss!1504) (mask!10205 thiss!1504)))))

(declare-fun res!113662 () Bool)

(assert (=> start!22154 (=> (not res!113662) (not e!150087))))

(declare-fun valid!1322 (LongMapFixedSize!3292) Bool)

(assert (=> start!22154 (= res!113662 (valid!1322 thiss!1504))))

(assert (=> start!22154 e!150087))

(declare-fun e!150092 () Bool)

(assert (=> start!22154 e!150092))

(assert (=> start!22154 true))

(assert (=> start!22154 tp_is_empty!6079))

(declare-fun array_inv!3557 (array!11401) Bool)

(declare-fun array_inv!3558 (array!11399) Bool)

(assert (=> b!231239 (= e!150092 (and tp!21793 tp_is_empty!6079 (array_inv!3557 (_keys!6359 thiss!1504)) (array_inv!3558 (_values!4288 thiss!1504)) e!150085))))

(declare-fun b!231240 () Bool)

(declare-fun e!150093 () Bool)

(assert (=> b!231240 (= e!150097 e!150093)))

(declare-fun res!113659 () Bool)

(assert (=> b!231240 (=> (not res!113659) (not e!150093))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231240 (= res!113659 (inRange!0 index!297 (mask!10205 thiss!1504)))))

(declare-fun lt!116548 () Unit!7085)

(assert (=> b!231240 (= lt!116548 e!150088)))

(declare-fun c!38410 () Bool)

(declare-datatypes ((tuple2!4476 0))(
  ( (tuple2!4477 (_1!2249 (_ BitVec 64)) (_2!2249 V!7753)) )
))
(declare-datatypes ((List!3388 0))(
  ( (Nil!3385) (Cons!3384 (h!4032 tuple2!4476) (t!8339 List!3388)) )
))
(declare-datatypes ((ListLongMap!3391 0))(
  ( (ListLongMap!3392 (toList!1711 List!3388)) )
))
(declare-fun lt!116552 () ListLongMap!3391)

(declare-fun contains!1598 (ListLongMap!3391 (_ BitVec 64)) Bool)

(assert (=> b!231240 (= c!38410 (contains!1598 lt!116552 key!932))))

(declare-fun getCurrentListMap!1243 (array!11401 array!11399 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 32) Int) ListLongMap!3391)

(assert (=> b!231240 (= lt!116552 (getCurrentListMap!1243 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(declare-fun b!231241 () Bool)

(declare-fun Unit!7088 () Unit!7085)

(assert (=> b!231241 (= e!150088 Unit!7088)))

(declare-fun lt!116553 () Unit!7085)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!301 (array!11401 array!11399 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) Int) Unit!7085)

(assert (=> b!231241 (= lt!116553 (lemmaInListMapThenSeekEntryOrOpenFindsIt!301 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 (defaultEntry!4305 thiss!1504)))))

(assert (=> b!231241 false))

(declare-fun b!231242 () Bool)

(assert (=> b!231242 (= e!150089 ((_ is Undefined!915) lt!116551))))

(declare-fun b!231243 () Bool)

(declare-fun c!38412 () Bool)

(assert (=> b!231243 (= c!38412 ((_ is MissingVacant!915) lt!116551))))

(assert (=> b!231243 (= e!150091 e!150089)))

(declare-fun bm!21471 () Bool)

(assert (=> bm!21471 (= call!21474 (inRange!0 (ite c!38411 (index!5830 lt!116551) (index!5833 lt!116551)) (mask!10205 thiss!1504)))))

(declare-fun b!231244 () Bool)

(assert (=> b!231244 (= e!150093 (not true))))

(declare-fun lt!116546 () array!11401)

(declare-fun arrayCountValidKeys!0 (array!11401 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231244 (= (arrayCountValidKeys!0 lt!116546 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116544 () Unit!7085)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11401 (_ BitVec 32)) Unit!7085)

(assert (=> b!231244 (= lt!116544 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116546 index!297))))

(assert (=> b!231244 (arrayContainsKey!0 lt!116546 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116554 () Unit!7085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11401 (_ BitVec 64) (_ BitVec 32)) Unit!7085)

(assert (=> b!231244 (= lt!116554 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116546 key!932 index!297))))

(declare-fun v!346 () V!7753)

(declare-fun +!609 (ListLongMap!3391 tuple2!4476) ListLongMap!3391)

(assert (=> b!231244 (= (+!609 lt!116552 (tuple2!4477 key!932 v!346)) (getCurrentListMap!1243 lt!116546 (array!11400 (store (arr!5419 (_values!4288 thiss!1504)) index!297 (ValueCellFull!2696 v!346)) (size!5752 (_values!4288 thiss!1504))) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(declare-fun lt!116556 () Unit!7085)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!68 (array!11401 array!11399 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 32) (_ BitVec 64) V!7753 Int) Unit!7085)

(assert (=> b!231244 (= lt!116556 (lemmaAddValidKeyToArrayThenAddPairToListMap!68 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) index!297 key!932 v!346 (defaultEntry!4305 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11401 (_ BitVec 32)) Bool)

(assert (=> b!231244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116546 (mask!10205 thiss!1504))))

(declare-fun lt!116545 () Unit!7085)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11401 (_ BitVec 32) (_ BitVec 32)) Unit!7085)

(assert (=> b!231244 (= lt!116545 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6359 thiss!1504) index!297 (mask!10205 thiss!1504)))))

(assert (=> b!231244 (= (arrayCountValidKeys!0 lt!116546 #b00000000000000000000000000000000 (size!5753 (_keys!6359 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6359 thiss!1504) #b00000000000000000000000000000000 (size!5753 (_keys!6359 thiss!1504)))))))

(declare-fun lt!116555 () Unit!7085)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11401 (_ BitVec 32) (_ BitVec 64)) Unit!7085)

(assert (=> b!231244 (= lt!116555 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6359 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3389 0))(
  ( (Nil!3386) (Cons!3385 (h!4033 (_ BitVec 64)) (t!8340 List!3389)) )
))
(declare-fun arrayNoDuplicates!0 (array!11401 (_ BitVec 32) List!3389) Bool)

(assert (=> b!231244 (arrayNoDuplicates!0 lt!116546 #b00000000000000000000000000000000 Nil!3386)))

(assert (=> b!231244 (= lt!116546 (array!11402 (store (arr!5420 (_keys!6359 thiss!1504)) index!297 key!932) (size!5753 (_keys!6359 thiss!1504))))))

(declare-fun lt!116557 () Unit!7085)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3389) Unit!7085)

(assert (=> b!231244 (= lt!116557 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6359 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3386))))

(declare-fun lt!116547 () Unit!7085)

(assert (=> b!231244 (= lt!116547 e!150086)))

(declare-fun c!38413 () Bool)

(assert (=> b!231244 (= c!38413 (arrayContainsKey!0 (_keys!6359 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231245 () Bool)

(declare-fun res!113658 () Bool)

(assert (=> b!231245 (= res!113658 (= (select (arr!5420 (_keys!6359 thiss!1504)) (index!5833 lt!116551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231245 (=> (not res!113658) (not e!150098))))

(declare-fun b!231246 () Bool)

(declare-fun Unit!7089 () Unit!7085)

(assert (=> b!231246 (= e!150086 Unit!7089)))

(declare-fun lt!116549 () Unit!7085)

(declare-fun lemmaArrayContainsKeyThenInListMap!138 (array!11401 array!11399 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) (_ BitVec 32) Int) Unit!7085)

(assert (=> b!231246 (= lt!116549 (lemmaArrayContainsKeyThenInListMap!138 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(assert (=> b!231246 false))

(assert (= (and start!22154 res!113662) b!231227))

(assert (= (and b!231227 res!113660) b!231232))

(assert (= (and b!231232 res!113656) b!231240))

(assert (= (and b!231240 c!38410) b!231241))

(assert (= (and b!231240 (not c!38410)) b!231234))

(assert (= (and b!231234 c!38411) b!231235))

(assert (= (and b!231234 (not c!38411)) b!231243))

(assert (= (and b!231235 res!113661) b!231237))

(assert (= (and b!231237 res!113655) b!231233))

(assert (= (and b!231243 c!38412) b!231231))

(assert (= (and b!231243 (not c!38412)) b!231242))

(assert (= (and b!231231 res!113657) b!231245))

(assert (= (and b!231245 res!113658) b!231230))

(assert (= (or b!231235 b!231231) bm!21471))

(assert (= (or b!231233 b!231230) bm!21470))

(assert (= (and b!231240 res!113659) b!231244))

(assert (= (and b!231244 c!38413) b!231246))

(assert (= (and b!231244 (not c!38413)) b!231236))

(assert (= (and b!231238 condMapEmpty!10288) mapIsEmpty!10288))

(assert (= (and b!231238 (not condMapEmpty!10288)) mapNonEmpty!10288))

(assert (= (and mapNonEmpty!10288 ((_ is ValueCellFull!2696) mapValue!10288)) b!231229))

(assert (= (and b!231238 ((_ is ValueCellFull!2696) mapDefault!10288)) b!231228))

(assert (= b!231239 b!231238))

(assert (= start!22154 b!231239))

(declare-fun m!252745 () Bool)

(assert (=> b!231240 m!252745))

(declare-fun m!252747 () Bool)

(assert (=> b!231240 m!252747))

(declare-fun m!252749 () Bool)

(assert (=> b!231240 m!252749))

(declare-fun m!252751 () Bool)

(assert (=> b!231245 m!252751))

(declare-fun m!252753 () Bool)

(assert (=> mapNonEmpty!10288 m!252753))

(declare-fun m!252755 () Bool)

(assert (=> bm!21471 m!252755))

(declare-fun m!252757 () Bool)

(assert (=> b!231244 m!252757))

(declare-fun m!252759 () Bool)

(assert (=> b!231244 m!252759))

(declare-fun m!252761 () Bool)

(assert (=> b!231244 m!252761))

(declare-fun m!252763 () Bool)

(assert (=> b!231244 m!252763))

(declare-fun m!252765 () Bool)

(assert (=> b!231244 m!252765))

(declare-fun m!252767 () Bool)

(assert (=> b!231244 m!252767))

(declare-fun m!252769 () Bool)

(assert (=> b!231244 m!252769))

(declare-fun m!252771 () Bool)

(assert (=> b!231244 m!252771))

(declare-fun m!252773 () Bool)

(assert (=> b!231244 m!252773))

(declare-fun m!252775 () Bool)

(assert (=> b!231244 m!252775))

(declare-fun m!252777 () Bool)

(assert (=> b!231244 m!252777))

(declare-fun m!252779 () Bool)

(assert (=> b!231244 m!252779))

(declare-fun m!252781 () Bool)

(assert (=> b!231244 m!252781))

(declare-fun m!252783 () Bool)

(assert (=> b!231244 m!252783))

(declare-fun m!252785 () Bool)

(assert (=> b!231244 m!252785))

(declare-fun m!252787 () Bool)

(assert (=> b!231244 m!252787))

(declare-fun m!252789 () Bool)

(assert (=> b!231244 m!252789))

(declare-fun m!252791 () Bool)

(assert (=> b!231232 m!252791))

(declare-fun m!252793 () Bool)

(assert (=> b!231239 m!252793))

(declare-fun m!252795 () Bool)

(assert (=> b!231239 m!252795))

(declare-fun m!252797 () Bool)

(assert (=> b!231237 m!252797))

(assert (=> bm!21470 m!252757))

(declare-fun m!252799 () Bool)

(assert (=> b!231246 m!252799))

(declare-fun m!252801 () Bool)

(assert (=> start!22154 m!252801))

(declare-fun m!252803 () Bool)

(assert (=> b!231241 m!252803))

(declare-fun m!252805 () Bool)

(assert (=> b!231234 m!252805))

(check-sat tp_is_empty!6079 b_and!13129 (not b!231232) (not b!231240) (not mapNonEmpty!10288) (not b!231241) (not start!22154) (not b_next!6217) (not b!231234) (not b!231244) (not b!231239) (not bm!21470) (not bm!21471) (not b!231246))
(check-sat b_and!13129 (not b_next!6217))
