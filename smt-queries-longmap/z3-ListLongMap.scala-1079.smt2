; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22158 () Bool)

(assert start!22158)

(declare-fun b!231433 () Bool)

(declare-fun b_free!6225 () Bool)

(declare-fun b_next!6225 () Bool)

(assert (=> b!231433 (= b_free!6225 (not b_next!6225))))

(declare-fun tp!21816 () Bool)

(declare-fun b_and!13123 () Bool)

(assert (=> b!231433 (= tp!21816 b_and!13123)))

(declare-fun b!231420 () Bool)

(declare-fun e!150229 () Bool)

(declare-datatypes ((SeekEntryResult!951 0))(
  ( (MissingZero!951 (index!5974 (_ BitVec 32))) (Found!951 (index!5975 (_ BitVec 32))) (Intermediate!951 (undefined!1763 Bool) (index!5976 (_ BitVec 32)) (x!23499 (_ BitVec 32))) (Undefined!951) (MissingVacant!951 (index!5977 (_ BitVec 32))) )
))
(declare-fun lt!116662 () SeekEntryResult!951)

(get-info :version)

(assert (=> b!231420 (= e!150229 ((_ is Undefined!951) lt!116662))))

(declare-fun b!231421 () Bool)

(declare-fun e!150232 () Bool)

(declare-fun tp_is_empty!6087 () Bool)

(assert (=> b!231421 (= e!150232 tp_is_empty!6087)))

(declare-fun b!231422 () Bool)

(declare-fun res!113730 () Bool)

(declare-fun e!150230 () Bool)

(assert (=> b!231422 (=> (not res!113730) (not e!150230))))

(declare-fun call!21509 () Bool)

(assert (=> b!231422 (= res!113730 call!21509)))

(declare-fun e!150237 () Bool)

(assert (=> b!231422 (= e!150237 e!150230)))

(declare-fun b!231423 () Bool)

(declare-datatypes ((Unit!7119 0))(
  ( (Unit!7120) )
))
(declare-fun e!150238 () Unit!7119)

(declare-fun Unit!7121 () Unit!7119)

(assert (=> b!231423 (= e!150238 Unit!7121)))

(declare-fun lt!116655 () Unit!7119)

(declare-datatypes ((V!7763 0))(
  ( (V!7764 (val!3088 Int)) )
))
(declare-datatypes ((ValueCell!2700 0))(
  ( (ValueCellFull!2700 (v!5108 V!7763)) (EmptyCell!2700) )
))
(declare-datatypes ((array!11417 0))(
  ( (array!11418 (arr!5428 (Array (_ BitVec 32) ValueCell!2700)) (size!5761 (_ BitVec 32))) )
))
(declare-datatypes ((array!11419 0))(
  ( (array!11420 (arr!5429 (Array (_ BitVec 32) (_ BitVec 64))) (size!5762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3300 0))(
  ( (LongMapFixedSize!3301 (defaultEntry!4309 Int) (mask!10211 (_ BitVec 32)) (extraKeys!4046 (_ BitVec 32)) (zeroValue!4150 V!7763) (minValue!4150 V!7763) (_size!1699 (_ BitVec 32)) (_keys!6363 array!11419) (_values!4292 array!11417) (_vacant!1699 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3300)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!300 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7763 V!7763 (_ BitVec 64) Int) Unit!7119)

(assert (=> b!231423 (= lt!116655 (lemmaInListMapThenSeekEntryOrOpenFindsIt!300 (_keys!6363 thiss!1504) (_values!4292 thiss!1504) (mask!10211 thiss!1504) (extraKeys!4046 thiss!1504) (zeroValue!4150 thiss!1504) (minValue!4150 thiss!1504) key!932 (defaultEntry!4309 thiss!1504)))))

(assert (=> b!231423 false))

(declare-fun b!231424 () Bool)

(declare-fun res!113736 () Bool)

(declare-fun e!150239 () Bool)

(assert (=> b!231424 (=> (not res!113736) (not e!150239))))

(assert (=> b!231424 (= res!113736 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231425 () Bool)

(declare-fun e!150235 () Bool)

(assert (=> b!231425 (= e!150239 e!150235)))

(declare-fun res!113734 () Bool)

(assert (=> b!231425 (=> (not res!113734) (not e!150235))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231425 (= res!113734 (or (= lt!116662 (MissingZero!951 index!297)) (= lt!116662 (MissingVacant!951 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11419 (_ BitVec 32)) SeekEntryResult!951)

(assert (=> b!231425 (= lt!116662 (seekEntryOrOpen!0 key!932 (_keys!6363 thiss!1504) (mask!10211 thiss!1504)))))

(declare-fun b!231426 () Bool)

(declare-fun e!150234 () Bool)

(assert (=> b!231426 (= e!150234 (not true))))

(declare-fun lt!116664 () array!11419)

(declare-fun arrayCountValidKeys!0 (array!11419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231426 (= (arrayCountValidKeys!0 lt!116664 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116666 () Unit!7119)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11419 (_ BitVec 32)) Unit!7119)

(assert (=> b!231426 (= lt!116666 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116664 index!297))))

(declare-fun arrayContainsKey!0 (array!11419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231426 (arrayContainsKey!0 lt!116664 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116665 () Unit!7119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11419 (_ BitVec 64) (_ BitVec 32)) Unit!7119)

(assert (=> b!231426 (= lt!116665 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116664 key!932 index!297))))

(declare-fun v!346 () V!7763)

(declare-datatypes ((tuple2!4558 0))(
  ( (tuple2!4559 (_1!2290 (_ BitVec 64)) (_2!2290 V!7763)) )
))
(declare-datatypes ((List!3477 0))(
  ( (Nil!3474) (Cons!3473 (h!4121 tuple2!4558) (t!8436 List!3477)) )
))
(declare-datatypes ((ListLongMap!3471 0))(
  ( (ListLongMap!3472 (toList!1751 List!3477)) )
))
(declare-fun lt!116659 () ListLongMap!3471)

(declare-fun +!615 (ListLongMap!3471 tuple2!4558) ListLongMap!3471)

(declare-fun getCurrentListMap!1279 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7763 V!7763 (_ BitVec 32) Int) ListLongMap!3471)

(assert (=> b!231426 (= (+!615 lt!116659 (tuple2!4559 key!932 v!346)) (getCurrentListMap!1279 lt!116664 (array!11418 (store (arr!5428 (_values!4292 thiss!1504)) index!297 (ValueCellFull!2700 v!346)) (size!5761 (_values!4292 thiss!1504))) (mask!10211 thiss!1504) (extraKeys!4046 thiss!1504) (zeroValue!4150 thiss!1504) (minValue!4150 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4309 thiss!1504)))))

(declare-fun lt!116660 () Unit!7119)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!69 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7763 V!7763 (_ BitVec 32) (_ BitVec 64) V!7763 Int) Unit!7119)

(assert (=> b!231426 (= lt!116660 (lemmaAddValidKeyToArrayThenAddPairToListMap!69 (_keys!6363 thiss!1504) (_values!4292 thiss!1504) (mask!10211 thiss!1504) (extraKeys!4046 thiss!1504) (zeroValue!4150 thiss!1504) (minValue!4150 thiss!1504) index!297 key!932 v!346 (defaultEntry!4309 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11419 (_ BitVec 32)) Bool)

(assert (=> b!231426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116664 (mask!10211 thiss!1504))))

(declare-fun lt!116653 () Unit!7119)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11419 (_ BitVec 32) (_ BitVec 32)) Unit!7119)

(assert (=> b!231426 (= lt!116653 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6363 thiss!1504) index!297 (mask!10211 thiss!1504)))))

(assert (=> b!231426 (= (arrayCountValidKeys!0 lt!116664 #b00000000000000000000000000000000 (size!5762 (_keys!6363 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6363 thiss!1504) #b00000000000000000000000000000000 (size!5762 (_keys!6363 thiss!1504)))))))

(declare-fun lt!116654 () Unit!7119)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11419 (_ BitVec 32) (_ BitVec 64)) Unit!7119)

(assert (=> b!231426 (= lt!116654 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6363 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3478 0))(
  ( (Nil!3475) (Cons!3474 (h!4122 (_ BitVec 64)) (t!8437 List!3478)) )
))
(declare-fun arrayNoDuplicates!0 (array!11419 (_ BitVec 32) List!3478) Bool)

(assert (=> b!231426 (arrayNoDuplicates!0 lt!116664 #b00000000000000000000000000000000 Nil!3475)))

(assert (=> b!231426 (= lt!116664 (array!11420 (store (arr!5429 (_keys!6363 thiss!1504)) index!297 key!932) (size!5762 (_keys!6363 thiss!1504))))))

(declare-fun lt!116656 () Unit!7119)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3478) Unit!7119)

(assert (=> b!231426 (= lt!116656 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6363 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3475))))

(declare-fun lt!116663 () Unit!7119)

(declare-fun e!150233 () Unit!7119)

(assert (=> b!231426 (= lt!116663 e!150233)))

(declare-fun c!38445 () Bool)

(assert (=> b!231426 (= c!38445 (arrayContainsKey!0 (_keys!6363 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231427 () Bool)

(declare-fun call!21510 () Bool)

(assert (=> b!231427 (= e!150230 (not call!21510))))

(declare-fun b!231428 () Bool)

(declare-fun e!150236 () Bool)

(assert (=> b!231428 (= e!150236 (not call!21510))))

(declare-fun b!231429 () Bool)

(declare-fun e!150231 () Bool)

(declare-fun mapRes!10300 () Bool)

(assert (=> b!231429 (= e!150231 (and e!150232 mapRes!10300))))

(declare-fun condMapEmpty!10300 () Bool)

(declare-fun mapDefault!10300 () ValueCell!2700)

(assert (=> b!231429 (= condMapEmpty!10300 (= (arr!5428 (_values!4292 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2700)) mapDefault!10300)))))

(declare-fun bm!21506 () Bool)

(assert (=> bm!21506 (= call!21510 (arrayContainsKey!0 (_keys!6363 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231430 () Bool)

(declare-fun Unit!7122 () Unit!7119)

(assert (=> b!231430 (= e!150233 Unit!7122)))

(declare-fun lt!116657 () Unit!7119)

(declare-fun lemmaArrayContainsKeyThenInListMap!136 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7763 V!7763 (_ BitVec 64) (_ BitVec 32) Int) Unit!7119)

(assert (=> b!231430 (= lt!116657 (lemmaArrayContainsKeyThenInListMap!136 (_keys!6363 thiss!1504) (_values!4292 thiss!1504) (mask!10211 thiss!1504) (extraKeys!4046 thiss!1504) (zeroValue!4150 thiss!1504) (minValue!4150 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4309 thiss!1504)))))

(assert (=> b!231430 false))

(declare-fun mapNonEmpty!10300 () Bool)

(declare-fun tp!21817 () Bool)

(declare-fun e!150240 () Bool)

(assert (=> mapNonEmpty!10300 (= mapRes!10300 (and tp!21817 e!150240))))

(declare-fun mapRest!10300 () (Array (_ BitVec 32) ValueCell!2700))

(declare-fun mapValue!10300 () ValueCell!2700)

(declare-fun mapKey!10300 () (_ BitVec 32))

(assert (=> mapNonEmpty!10300 (= (arr!5428 (_values!4292 thiss!1504)) (store mapRest!10300 mapKey!10300 mapValue!10300))))

(declare-fun b!231431 () Bool)

(declare-fun Unit!7123 () Unit!7119)

(assert (=> b!231431 (= e!150233 Unit!7123)))

(declare-fun b!231432 () Bool)

(assert (=> b!231432 (= e!150240 tp_is_empty!6087)))

(declare-fun e!150241 () Bool)

(declare-fun array_inv!3581 (array!11419) Bool)

(declare-fun array_inv!3582 (array!11417) Bool)

(assert (=> b!231433 (= e!150241 (and tp!21816 tp_is_empty!6087 (array_inv!3581 (_keys!6363 thiss!1504)) (array_inv!3582 (_values!4292 thiss!1504)) e!150231))))

(declare-fun mapIsEmpty!10300 () Bool)

(assert (=> mapIsEmpty!10300 mapRes!10300))

(declare-fun b!231434 () Bool)

(declare-fun lt!116661 () Unit!7119)

(assert (=> b!231434 (= e!150238 lt!116661)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!318 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7763 V!7763 (_ BitVec 64) Int) Unit!7119)

(assert (=> b!231434 (= lt!116661 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!318 (_keys!6363 thiss!1504) (_values!4292 thiss!1504) (mask!10211 thiss!1504) (extraKeys!4046 thiss!1504) (zeroValue!4150 thiss!1504) (minValue!4150 thiss!1504) key!932 (defaultEntry!4309 thiss!1504)))))

(declare-fun c!38447 () Bool)

(assert (=> b!231434 (= c!38447 ((_ is MissingZero!951) lt!116662))))

(assert (=> b!231434 e!150237))

(declare-fun b!231435 () Bool)

(declare-fun res!113735 () Bool)

(assert (=> b!231435 (=> (not res!113735) (not e!150230))))

(assert (=> b!231435 (= res!113735 (= (select (arr!5429 (_keys!6363 thiss!1504)) (index!5974 lt!116662)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231436 () Bool)

(assert (=> b!231436 (= e!150229 e!150236)))

(declare-fun res!113733 () Bool)

(assert (=> b!231436 (= res!113733 call!21509)))

(assert (=> b!231436 (=> (not res!113733) (not e!150236))))

(declare-fun res!113737 () Bool)

(assert (=> start!22158 (=> (not res!113737) (not e!150239))))

(declare-fun valid!1310 (LongMapFixedSize!3300) Bool)

(assert (=> start!22158 (= res!113737 (valid!1310 thiss!1504))))

(assert (=> start!22158 e!150239))

(assert (=> start!22158 e!150241))

(assert (=> start!22158 true))

(assert (=> start!22158 tp_is_empty!6087))

(declare-fun b!231437 () Bool)

(declare-fun res!113732 () Bool)

(assert (=> b!231437 (= res!113732 (= (select (arr!5429 (_keys!6363 thiss!1504)) (index!5977 lt!116662)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231437 (=> (not res!113732) (not e!150236))))

(declare-fun b!231438 () Bool)

(assert (=> b!231438 (= e!150235 e!150234)))

(declare-fun res!113731 () Bool)

(assert (=> b!231438 (=> (not res!113731) (not e!150234))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231438 (= res!113731 (inRange!0 index!297 (mask!10211 thiss!1504)))))

(declare-fun lt!116658 () Unit!7119)

(assert (=> b!231438 (= lt!116658 e!150238)))

(declare-fun c!38446 () Bool)

(declare-fun contains!1621 (ListLongMap!3471 (_ BitVec 64)) Bool)

(assert (=> b!231438 (= c!38446 (contains!1621 lt!116659 key!932))))

(assert (=> b!231438 (= lt!116659 (getCurrentListMap!1279 (_keys!6363 thiss!1504) (_values!4292 thiss!1504) (mask!10211 thiss!1504) (extraKeys!4046 thiss!1504) (zeroValue!4150 thiss!1504) (minValue!4150 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4309 thiss!1504)))))

(declare-fun b!231439 () Bool)

(declare-fun c!38448 () Bool)

(assert (=> b!231439 (= c!38448 ((_ is MissingVacant!951) lt!116662))))

(assert (=> b!231439 (= e!150237 e!150229)))

(declare-fun bm!21507 () Bool)

(assert (=> bm!21507 (= call!21509 (inRange!0 (ite c!38447 (index!5974 lt!116662) (index!5977 lt!116662)) (mask!10211 thiss!1504)))))

(assert (= (and start!22158 res!113737) b!231424))

(assert (= (and b!231424 res!113736) b!231425))

(assert (= (and b!231425 res!113734) b!231438))

(assert (= (and b!231438 c!38446) b!231423))

(assert (= (and b!231438 (not c!38446)) b!231434))

(assert (= (and b!231434 c!38447) b!231422))

(assert (= (and b!231434 (not c!38447)) b!231439))

(assert (= (and b!231422 res!113730) b!231435))

(assert (= (and b!231435 res!113735) b!231427))

(assert (= (and b!231439 c!38448) b!231436))

(assert (= (and b!231439 (not c!38448)) b!231420))

(assert (= (and b!231436 res!113733) b!231437))

(assert (= (and b!231437 res!113732) b!231428))

(assert (= (or b!231422 b!231436) bm!21507))

(assert (= (or b!231427 b!231428) bm!21506))

(assert (= (and b!231438 res!113731) b!231426))

(assert (= (and b!231426 c!38445) b!231430))

(assert (= (and b!231426 (not c!38445)) b!231431))

(assert (= (and b!231429 condMapEmpty!10300) mapIsEmpty!10300))

(assert (= (and b!231429 (not condMapEmpty!10300)) mapNonEmpty!10300))

(assert (= (and mapNonEmpty!10300 ((_ is ValueCellFull!2700) mapValue!10300)) b!231432))

(assert (= (and b!231429 ((_ is ValueCellFull!2700) mapDefault!10300)) b!231421))

(assert (= b!231433 b!231429))

(assert (= start!22158 b!231433))

(declare-fun m!252811 () Bool)

(assert (=> bm!21507 m!252811))

(declare-fun m!252813 () Bool)

(assert (=> mapNonEmpty!10300 m!252813))

(declare-fun m!252815 () Bool)

(assert (=> b!231435 m!252815))

(declare-fun m!252817 () Bool)

(assert (=> b!231426 m!252817))

(declare-fun m!252819 () Bool)

(assert (=> b!231426 m!252819))

(declare-fun m!252821 () Bool)

(assert (=> b!231426 m!252821))

(declare-fun m!252823 () Bool)

(assert (=> b!231426 m!252823))

(declare-fun m!252825 () Bool)

(assert (=> b!231426 m!252825))

(declare-fun m!252827 () Bool)

(assert (=> b!231426 m!252827))

(declare-fun m!252829 () Bool)

(assert (=> b!231426 m!252829))

(declare-fun m!252831 () Bool)

(assert (=> b!231426 m!252831))

(declare-fun m!252833 () Bool)

(assert (=> b!231426 m!252833))

(declare-fun m!252835 () Bool)

(assert (=> b!231426 m!252835))

(declare-fun m!252837 () Bool)

(assert (=> b!231426 m!252837))

(declare-fun m!252839 () Bool)

(assert (=> b!231426 m!252839))

(declare-fun m!252841 () Bool)

(assert (=> b!231426 m!252841))

(declare-fun m!252843 () Bool)

(assert (=> b!231426 m!252843))

(declare-fun m!252845 () Bool)

(assert (=> b!231426 m!252845))

(declare-fun m!252847 () Bool)

(assert (=> b!231426 m!252847))

(declare-fun m!252849 () Bool)

(assert (=> b!231426 m!252849))

(declare-fun m!252851 () Bool)

(assert (=> b!231425 m!252851))

(assert (=> bm!21506 m!252817))

(declare-fun m!252853 () Bool)

(assert (=> b!231437 m!252853))

(declare-fun m!252855 () Bool)

(assert (=> b!231438 m!252855))

(declare-fun m!252857 () Bool)

(assert (=> b!231438 m!252857))

(declare-fun m!252859 () Bool)

(assert (=> b!231438 m!252859))

(declare-fun m!252861 () Bool)

(assert (=> b!231430 m!252861))

(declare-fun m!252863 () Bool)

(assert (=> b!231434 m!252863))

(declare-fun m!252865 () Bool)

(assert (=> b!231433 m!252865))

(declare-fun m!252867 () Bool)

(assert (=> b!231433 m!252867))

(declare-fun m!252869 () Bool)

(assert (=> b!231423 m!252869))

(declare-fun m!252871 () Bool)

(assert (=> start!22158 m!252871))

(check-sat (not b!231438) (not mapNonEmpty!10300) (not bm!21506) (not b!231425) (not b!231423) b_and!13123 (not b!231433) (not b!231434) (not start!22158) (not b!231430) (not bm!21507) (not b_next!6225) tp_is_empty!6087 (not b!231426))
(check-sat b_and!13123 (not b_next!6225))
