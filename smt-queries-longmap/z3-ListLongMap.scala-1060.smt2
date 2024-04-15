; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22046 () Bool)

(assert start!22046)

(declare-fun b!227539 () Bool)

(declare-fun b_free!6109 () Bool)

(declare-fun b_next!6109 () Bool)

(assert (=> b!227539 (= b_free!6109 (not b_next!6109))))

(declare-fun tp!21469 () Bool)

(declare-fun b_and!12981 () Bool)

(assert (=> b!227539 (= tp!21469 b_and!12981)))

(declare-fun b!227529 () Bool)

(declare-fun e!147605 () Bool)

(declare-fun e!147610 () Bool)

(assert (=> b!227529 (= e!147605 e!147610)))

(declare-fun res!111983 () Bool)

(assert (=> b!227529 (=> (not res!111983) (not e!147610))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7609 0))(
  ( (V!7610 (val!3030 Int)) )
))
(declare-datatypes ((ValueCell!2642 0))(
  ( (ValueCellFull!2642 (v!5044 V!7609)) (EmptyCell!2642) )
))
(declare-datatypes ((array!11177 0))(
  ( (array!11178 (arr!5307 (Array (_ BitVec 32) ValueCell!2642)) (size!5641 (_ BitVec 32))) )
))
(declare-datatypes ((array!11179 0))(
  ( (array!11180 (arr!5308 (Array (_ BitVec 32) (_ BitVec 64))) (size!5642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3184 0))(
  ( (LongMapFixedSize!3185 (defaultEntry!4251 Int) (mask!10114 (_ BitVec 32)) (extraKeys!3988 (_ BitVec 32)) (zeroValue!4092 V!7609) (minValue!4092 V!7609) (_size!1641 (_ BitVec 32)) (_keys!6304 array!11179) (_values!4234 array!11177) (_vacant!1641 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3184)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227529 (= res!111983 (inRange!0 index!297 (mask!10114 thiss!1504)))))

(declare-datatypes ((Unit!6874 0))(
  ( (Unit!6875) )
))
(declare-fun lt!114388 () Unit!6874)

(declare-fun e!147614 () Unit!6874)

(assert (=> b!227529 (= lt!114388 e!147614)))

(declare-fun c!37725 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4454 0))(
  ( (tuple2!4455 (_1!2238 (_ BitVec 64)) (_2!2238 V!7609)) )
))
(declare-datatypes ((List!3385 0))(
  ( (Nil!3382) (Cons!3381 (h!4029 tuple2!4454) (t!8335 List!3385)) )
))
(declare-datatypes ((ListLongMap!3357 0))(
  ( (ListLongMap!3358 (toList!1694 List!3385)) )
))
(declare-fun contains!1569 (ListLongMap!3357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1203 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 32) Int) ListLongMap!3357)

(assert (=> b!227529 (= c!37725 (contains!1569 (getCurrentListMap!1203 (_keys!6304 thiss!1504) (_values!4234 thiss!1504) (mask!10114 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4251 thiss!1504)) key!932))))

(declare-fun b!227530 () Bool)

(declare-fun c!37723 () Bool)

(declare-datatypes ((SeekEntryResult!898 0))(
  ( (MissingZero!898 (index!5762 (_ BitVec 32))) (Found!898 (index!5763 (_ BitVec 32))) (Intermediate!898 (undefined!1710 Bool) (index!5764 (_ BitVec 32)) (x!23293 (_ BitVec 32))) (Undefined!898) (MissingVacant!898 (index!5765 (_ BitVec 32))) )
))
(declare-fun lt!114391 () SeekEntryResult!898)

(get-info :version)

(assert (=> b!227530 (= c!37723 ((_ is MissingVacant!898) lt!114391))))

(declare-fun e!147604 () Bool)

(declare-fun e!147615 () Bool)

(assert (=> b!227530 (= e!147604 e!147615)))

(declare-fun b!227531 () Bool)

(declare-fun e!147613 () Bool)

(assert (=> b!227531 (= e!147610 (not e!147613))))

(declare-fun res!111988 () Bool)

(assert (=> b!227531 (=> res!111988 e!147613)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227531 (= res!111988 (not (validMask!0 (mask!10114 thiss!1504))))))

(declare-fun lt!114389 () array!11179)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11179 (_ BitVec 32)) Bool)

(assert (=> b!227531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114389 (mask!10114 thiss!1504))))

(declare-fun lt!114384 () Unit!6874)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11179 (_ BitVec 32) (_ BitVec 32)) Unit!6874)

(assert (=> b!227531 (= lt!114384 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6304 thiss!1504) index!297 (mask!10114 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11179 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227531 (= (arrayCountValidKeys!0 lt!114389 #b00000000000000000000000000000000 (size!5642 (_keys!6304 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6304 thiss!1504) #b00000000000000000000000000000000 (size!5642 (_keys!6304 thiss!1504)))))))

(declare-fun lt!114390 () Unit!6874)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11179 (_ BitVec 32) (_ BitVec 64)) Unit!6874)

(assert (=> b!227531 (= lt!114390 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6304 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3386 0))(
  ( (Nil!3383) (Cons!3382 (h!4030 (_ BitVec 64)) (t!8336 List!3386)) )
))
(declare-fun arrayNoDuplicates!0 (array!11179 (_ BitVec 32) List!3386) Bool)

(assert (=> b!227531 (arrayNoDuplicates!0 lt!114389 #b00000000000000000000000000000000 Nil!3383)))

(assert (=> b!227531 (= lt!114389 (array!11180 (store (arr!5308 (_keys!6304 thiss!1504)) index!297 key!932) (size!5642 (_keys!6304 thiss!1504))))))

(declare-fun lt!114382 () Unit!6874)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11179 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3386) Unit!6874)

(assert (=> b!227531 (= lt!114382 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6304 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3383))))

(declare-fun lt!114386 () Unit!6874)

(declare-fun e!147612 () Unit!6874)

(assert (=> b!227531 (= lt!114386 e!147612)))

(declare-fun c!37724 () Bool)

(declare-fun arrayContainsKey!0 (array!11179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227531 (= c!37724 (arrayContainsKey!0 (_keys!6304 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227532 () Bool)

(declare-fun e!147606 () Bool)

(declare-fun tp_is_empty!5971 () Bool)

(assert (=> b!227532 (= e!147606 tp_is_empty!5971)))

(declare-fun b!227533 () Bool)

(declare-fun res!111979 () Bool)

(assert (=> b!227533 (= res!111979 (= (select (arr!5308 (_keys!6304 thiss!1504)) (index!5765 lt!114391)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147608 () Bool)

(assert (=> b!227533 (=> (not res!111979) (not e!147608))))

(declare-fun b!227534 () Bool)

(declare-fun res!111989 () Bool)

(declare-fun e!147611 () Bool)

(assert (=> b!227534 (=> (not res!111989) (not e!147611))))

(declare-fun call!21137 () Bool)

(assert (=> b!227534 (= res!111989 call!21137)))

(assert (=> b!227534 (= e!147604 e!147611)))

(declare-fun bm!21134 () Bool)

(declare-fun call!21138 () Bool)

(assert (=> bm!21134 (= call!21138 (arrayContainsKey!0 (_keys!6304 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227535 () Bool)

(declare-fun Unit!6876 () Unit!6874)

(assert (=> b!227535 (= e!147614 Unit!6876)))

(declare-fun lt!114385 () Unit!6874)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!266 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 64) Int) Unit!6874)

(assert (=> b!227535 (= lt!114385 (lemmaInListMapThenSeekEntryOrOpenFindsIt!266 (_keys!6304 thiss!1504) (_values!4234 thiss!1504) (mask!10114 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) key!932 (defaultEntry!4251 thiss!1504)))))

(assert (=> b!227535 false))

(declare-fun b!227536 () Bool)

(assert (=> b!227536 (= e!147608 (not call!21138))))

(declare-fun b!227537 () Bool)

(declare-fun Unit!6877 () Unit!6874)

(assert (=> b!227537 (= e!147612 Unit!6877)))

(declare-fun b!227538 () Bool)

(declare-fun Unit!6878 () Unit!6874)

(assert (=> b!227538 (= e!147612 Unit!6878)))

(declare-fun lt!114381 () Unit!6874)

(declare-fun lemmaArrayContainsKeyThenInListMap!106 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 64) (_ BitVec 32) Int) Unit!6874)

(assert (=> b!227538 (= lt!114381 (lemmaArrayContainsKeyThenInListMap!106 (_keys!6304 thiss!1504) (_values!4234 thiss!1504) (mask!10114 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4251 thiss!1504)))))

(assert (=> b!227538 false))

(declare-fun e!147616 () Bool)

(declare-fun e!147618 () Bool)

(declare-fun array_inv!3503 (array!11179) Bool)

(declare-fun array_inv!3504 (array!11177) Bool)

(assert (=> b!227539 (= e!147618 (and tp!21469 tp_is_empty!5971 (array_inv!3503 (_keys!6304 thiss!1504)) (array_inv!3504 (_values!4234 thiss!1504)) e!147616))))

(declare-fun mapNonEmpty!10126 () Bool)

(declare-fun mapRes!10126 () Bool)

(declare-fun tp!21468 () Bool)

(assert (=> mapNonEmpty!10126 (= mapRes!10126 (and tp!21468 e!147606))))

(declare-fun mapRest!10126 () (Array (_ BitVec 32) ValueCell!2642))

(declare-fun mapKey!10126 () (_ BitVec 32))

(declare-fun mapValue!10126 () ValueCell!2642)

(assert (=> mapNonEmpty!10126 (= (arr!5307 (_values!4234 thiss!1504)) (store mapRest!10126 mapKey!10126 mapValue!10126))))

(declare-fun b!227540 () Bool)

(assert (=> b!227540 (= e!147611 (not call!21138))))

(declare-fun b!227541 () Bool)

(declare-fun res!111987 () Bool)

(declare-fun e!147617 () Bool)

(assert (=> b!227541 (=> (not res!111987) (not e!147617))))

(assert (=> b!227541 (= res!111987 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!111981 () Bool)

(assert (=> start!22046 (=> (not res!111981) (not e!147617))))

(declare-fun valid!1289 (LongMapFixedSize!3184) Bool)

(assert (=> start!22046 (= res!111981 (valid!1289 thiss!1504))))

(assert (=> start!22046 e!147617))

(assert (=> start!22046 e!147618))

(assert (=> start!22046 true))

(declare-fun b!227542 () Bool)

(declare-fun res!111985 () Bool)

(assert (=> b!227542 (=> res!111985 e!147613)))

(assert (=> b!227542 (= res!111985 (or (not (= (size!5641 (_values!4234 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10114 thiss!1504)))) (not (= (size!5642 (_keys!6304 thiss!1504)) (size!5641 (_values!4234 thiss!1504)))) (bvslt (mask!10114 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3988 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3988 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227543 () Bool)

(assert (=> b!227543 (= e!147617 e!147605)))

(declare-fun res!111984 () Bool)

(assert (=> b!227543 (=> (not res!111984) (not e!147605))))

(assert (=> b!227543 (= res!111984 (or (= lt!114391 (MissingZero!898 index!297)) (= lt!114391 (MissingVacant!898 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11179 (_ BitVec 32)) SeekEntryResult!898)

(assert (=> b!227543 (= lt!114391 (seekEntryOrOpen!0 key!932 (_keys!6304 thiss!1504) (mask!10114 thiss!1504)))))

(declare-fun mapIsEmpty!10126 () Bool)

(assert (=> mapIsEmpty!10126 mapRes!10126))

(declare-fun b!227544 () Bool)

(declare-fun e!147607 () Bool)

(assert (=> b!227544 (= e!147616 (and e!147607 mapRes!10126))))

(declare-fun condMapEmpty!10126 () Bool)

(declare-fun mapDefault!10126 () ValueCell!2642)

(assert (=> b!227544 (= condMapEmpty!10126 (= (arr!5307 (_values!4234 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2642)) mapDefault!10126)))))

(declare-fun b!227545 () Bool)

(declare-fun res!111986 () Bool)

(assert (=> b!227545 (=> (not res!111986) (not e!147611))))

(assert (=> b!227545 (= res!111986 (= (select (arr!5308 (_keys!6304 thiss!1504)) (index!5762 lt!114391)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227546 () Bool)

(declare-fun res!111982 () Bool)

(assert (=> b!227546 (=> res!111982 e!147613)))

(assert (=> b!227546 (= res!111982 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6304 thiss!1504) (mask!10114 thiss!1504))))))

(declare-fun b!227547 () Bool)

(declare-fun lt!114387 () Unit!6874)

(assert (=> b!227547 (= e!147614 lt!114387)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!261 (array!11179 array!11177 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 64) Int) Unit!6874)

(assert (=> b!227547 (= lt!114387 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!261 (_keys!6304 thiss!1504) (_values!4234 thiss!1504) (mask!10114 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) key!932 (defaultEntry!4251 thiss!1504)))))

(declare-fun c!37726 () Bool)

(assert (=> b!227547 (= c!37726 ((_ is MissingZero!898) lt!114391))))

(assert (=> b!227547 e!147604))

(declare-fun b!227548 () Bool)

(assert (=> b!227548 (= e!147615 ((_ is Undefined!898) lt!114391))))

(declare-fun b!227549 () Bool)

(assert (=> b!227549 (= e!147615 e!147608)))

(declare-fun res!111980 () Bool)

(assert (=> b!227549 (= res!111980 call!21137)))

(assert (=> b!227549 (=> (not res!111980) (not e!147608))))

(declare-fun bm!21135 () Bool)

(assert (=> bm!21135 (= call!21137 (inRange!0 (ite c!37726 (index!5762 lt!114391) (index!5765 lt!114391)) (mask!10114 thiss!1504)))))

(declare-fun b!227550 () Bool)

(assert (=> b!227550 (= e!147613 true)))

(declare-fun lt!114383 () Bool)

(assert (=> b!227550 (= lt!114383 (arrayNoDuplicates!0 (_keys!6304 thiss!1504) #b00000000000000000000000000000000 Nil!3383))))

(declare-fun b!227551 () Bool)

(assert (=> b!227551 (= e!147607 tp_is_empty!5971)))

(assert (= (and start!22046 res!111981) b!227541))

(assert (= (and b!227541 res!111987) b!227543))

(assert (= (and b!227543 res!111984) b!227529))

(assert (= (and b!227529 c!37725) b!227535))

(assert (= (and b!227529 (not c!37725)) b!227547))

(assert (= (and b!227547 c!37726) b!227534))

(assert (= (and b!227547 (not c!37726)) b!227530))

(assert (= (and b!227534 res!111989) b!227545))

(assert (= (and b!227545 res!111986) b!227540))

(assert (= (and b!227530 c!37723) b!227549))

(assert (= (and b!227530 (not c!37723)) b!227548))

(assert (= (and b!227549 res!111980) b!227533))

(assert (= (and b!227533 res!111979) b!227536))

(assert (= (or b!227534 b!227549) bm!21135))

(assert (= (or b!227540 b!227536) bm!21134))

(assert (= (and b!227529 res!111983) b!227531))

(assert (= (and b!227531 c!37724) b!227538))

(assert (= (and b!227531 (not c!37724)) b!227537))

(assert (= (and b!227531 (not res!111988)) b!227542))

(assert (= (and b!227542 (not res!111985)) b!227546))

(assert (= (and b!227546 (not res!111982)) b!227550))

(assert (= (and b!227544 condMapEmpty!10126) mapIsEmpty!10126))

(assert (= (and b!227544 (not condMapEmpty!10126)) mapNonEmpty!10126))

(assert (= (and mapNonEmpty!10126 ((_ is ValueCellFull!2642) mapValue!10126)) b!227532))

(assert (= (and b!227544 ((_ is ValueCellFull!2642) mapDefault!10126)) b!227551))

(assert (= b!227539 b!227544))

(assert (= start!22046 b!227539))

(declare-fun m!249007 () Bool)

(assert (=> b!227538 m!249007))

(declare-fun m!249009 () Bool)

(assert (=> b!227550 m!249009))

(declare-fun m!249011 () Bool)

(assert (=> bm!21135 m!249011))

(declare-fun m!249013 () Bool)

(assert (=> b!227545 m!249013))

(declare-fun m!249015 () Bool)

(assert (=> b!227546 m!249015))

(declare-fun m!249017 () Bool)

(assert (=> b!227529 m!249017))

(declare-fun m!249019 () Bool)

(assert (=> b!227529 m!249019))

(assert (=> b!227529 m!249019))

(declare-fun m!249021 () Bool)

(assert (=> b!227529 m!249021))

(declare-fun m!249023 () Bool)

(assert (=> bm!21134 m!249023))

(declare-fun m!249025 () Bool)

(assert (=> b!227533 m!249025))

(declare-fun m!249027 () Bool)

(assert (=> start!22046 m!249027))

(declare-fun m!249029 () Bool)

(assert (=> b!227535 m!249029))

(declare-fun m!249031 () Bool)

(assert (=> mapNonEmpty!10126 m!249031))

(declare-fun m!249033 () Bool)

(assert (=> b!227547 m!249033))

(declare-fun m!249035 () Bool)

(assert (=> b!227539 m!249035))

(declare-fun m!249037 () Bool)

(assert (=> b!227539 m!249037))

(declare-fun m!249039 () Bool)

(assert (=> b!227531 m!249039))

(assert (=> b!227531 m!249023))

(declare-fun m!249041 () Bool)

(assert (=> b!227531 m!249041))

(declare-fun m!249043 () Bool)

(assert (=> b!227531 m!249043))

(declare-fun m!249045 () Bool)

(assert (=> b!227531 m!249045))

(declare-fun m!249047 () Bool)

(assert (=> b!227531 m!249047))

(declare-fun m!249049 () Bool)

(assert (=> b!227531 m!249049))

(declare-fun m!249051 () Bool)

(assert (=> b!227531 m!249051))

(declare-fun m!249053 () Bool)

(assert (=> b!227531 m!249053))

(declare-fun m!249055 () Bool)

(assert (=> b!227531 m!249055))

(declare-fun m!249057 () Bool)

(assert (=> b!227543 m!249057))

(check-sat (not b!227538) (not b!227531) (not b!227547) (not start!22046) (not b!227550) (not b_next!6109) (not b!227546) (not bm!21135) (not b!227539) (not b!227529) tp_is_empty!5971 (not b!227543) (not b!227535) b_and!12981 (not mapNonEmpty!10126) (not bm!21134))
(check-sat b_and!12981 (not b_next!6109))
