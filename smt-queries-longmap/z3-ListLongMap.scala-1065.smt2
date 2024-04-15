; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22076 () Bool)

(assert start!22076)

(declare-fun b!228567 () Bool)

(declare-fun b_free!6139 () Bool)

(declare-fun b_next!6139 () Bool)

(assert (=> b!228567 (= b_free!6139 (not b_next!6139))))

(declare-fun tp!21558 () Bool)

(declare-fun b_and!13011 () Bool)

(assert (=> b!228567 (= tp!21558 b_and!13011)))

(declare-fun b!228564 () Bool)

(declare-fun res!112475 () Bool)

(declare-fun e!148280 () Bool)

(assert (=> b!228564 (=> res!112475 e!148280)))

(declare-datatypes ((V!7649 0))(
  ( (V!7650 (val!3045 Int)) )
))
(declare-datatypes ((ValueCell!2657 0))(
  ( (ValueCellFull!2657 (v!5059 V!7649)) (EmptyCell!2657) )
))
(declare-datatypes ((array!11237 0))(
  ( (array!11238 (arr!5337 (Array (_ BitVec 32) ValueCell!2657)) (size!5671 (_ BitVec 32))) )
))
(declare-datatypes ((array!11239 0))(
  ( (array!11240 (arr!5338 (Array (_ BitVec 32) (_ BitVec 64))) (size!5672 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3214 0))(
  ( (LongMapFixedSize!3215 (defaultEntry!4266 Int) (mask!10139 (_ BitVec 32)) (extraKeys!4003 (_ BitVec 32)) (zeroValue!4107 V!7649) (minValue!4107 V!7649) (_size!1656 (_ BitVec 32)) (_keys!6319 array!11239) (_values!4249 array!11237) (_vacant!1656 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3214)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11239 (_ BitVec 32)) Bool)

(assert (=> b!228564 (= res!112475 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6319 thiss!1504) (mask!10139 thiss!1504))))))

(declare-fun b!228565 () Bool)

(declare-fun e!148288 () Bool)

(declare-fun tp_is_empty!6001 () Bool)

(assert (=> b!228565 (= e!148288 tp_is_empty!6001)))

(declare-fun b!228566 () Bool)

(declare-fun e!148282 () Bool)

(declare-fun e!148289 () Bool)

(assert (=> b!228566 (= e!148282 e!148289)))

(declare-fun res!112479 () Bool)

(declare-fun call!21227 () Bool)

(assert (=> b!228566 (= res!112479 call!21227)))

(assert (=> b!228566 (=> (not res!112479) (not e!148289))))

(declare-fun mapNonEmpty!10171 () Bool)

(declare-fun mapRes!10171 () Bool)

(declare-fun tp!21559 () Bool)

(assert (=> mapNonEmpty!10171 (= mapRes!10171 (and tp!21559 e!148288))))

(declare-fun mapKey!10171 () (_ BitVec 32))

(declare-fun mapValue!10171 () ValueCell!2657)

(declare-fun mapRest!10171 () (Array (_ BitVec 32) ValueCell!2657))

(assert (=> mapNonEmpty!10171 (= (arr!5337 (_values!4249 thiss!1504)) (store mapRest!10171 mapKey!10171 mapValue!10171))))

(declare-fun e!148285 () Bool)

(declare-fun e!148293 () Bool)

(declare-fun array_inv!3521 (array!11239) Bool)

(declare-fun array_inv!3522 (array!11237) Bool)

(assert (=> b!228567 (= e!148293 (and tp!21558 tp_is_empty!6001 (array_inv!3521 (_keys!6319 thiss!1504)) (array_inv!3522 (_values!4249 thiss!1504)) e!148285))))

(declare-fun b!228568 () Bool)

(declare-fun e!148279 () Bool)

(assert (=> b!228568 (= e!148279 tp_is_empty!6001)))

(declare-fun b!228569 () Bool)

(declare-fun call!21228 () Bool)

(assert (=> b!228569 (= e!148289 (not call!21228))))

(declare-fun b!228571 () Bool)

(assert (=> b!228571 (= e!148280 true)))

(declare-fun lt!114879 () Bool)

(declare-datatypes ((List!3405 0))(
  ( (Nil!3402) (Cons!3401 (h!4049 (_ BitVec 64)) (t!8355 List!3405)) )
))
(declare-fun arrayNoDuplicates!0 (array!11239 (_ BitVec 32) List!3405) Bool)

(assert (=> b!228571 (= lt!114879 (arrayNoDuplicates!0 (_keys!6319 thiss!1504) #b00000000000000000000000000000000 Nil!3402))))

(declare-fun b!228572 () Bool)

(declare-fun res!112474 () Bool)

(declare-fun e!148284 () Bool)

(assert (=> b!228572 (=> (not res!112474) (not e!148284))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!228572 (= res!112474 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228573 () Bool)

(declare-fun e!148290 () Bool)

(assert (=> b!228573 (= e!148290 (not e!148280))))

(declare-fun res!112481 () Bool)

(assert (=> b!228573 (=> res!112481 e!148280)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228573 (= res!112481 (not (validMask!0 (mask!10139 thiss!1504))))))

(declare-fun lt!114886 () array!11239)

(assert (=> b!228573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114886 (mask!10139 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6931 0))(
  ( (Unit!6932) )
))
(declare-fun lt!114884 () Unit!6931)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11239 (_ BitVec 32) (_ BitVec 32)) Unit!6931)

(assert (=> b!228573 (= lt!114884 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6319 thiss!1504) index!297 (mask!10139 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11239 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228573 (= (arrayCountValidKeys!0 lt!114886 #b00000000000000000000000000000000 (size!5672 (_keys!6319 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6319 thiss!1504) #b00000000000000000000000000000000 (size!5672 (_keys!6319 thiss!1504)))))))

(declare-fun lt!114876 () Unit!6931)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11239 (_ BitVec 32) (_ BitVec 64)) Unit!6931)

(assert (=> b!228573 (= lt!114876 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6319 thiss!1504) index!297 key!932))))

(assert (=> b!228573 (arrayNoDuplicates!0 lt!114886 #b00000000000000000000000000000000 Nil!3402)))

(assert (=> b!228573 (= lt!114886 (array!11240 (store (arr!5338 (_keys!6319 thiss!1504)) index!297 key!932) (size!5672 (_keys!6319 thiss!1504))))))

(declare-fun lt!114880 () Unit!6931)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3405) Unit!6931)

(assert (=> b!228573 (= lt!114880 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6319 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3402))))

(declare-fun lt!114883 () Unit!6931)

(declare-fun e!148281 () Unit!6931)

(assert (=> b!228573 (= lt!114883 e!148281)))

(declare-fun c!37903 () Bool)

(declare-fun arrayContainsKey!0 (array!11239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228573 (= c!37903 (arrayContainsKey!0 (_keys!6319 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228574 () Bool)

(declare-fun e!148287 () Bool)

(assert (=> b!228574 (= e!148287 (not call!21228))))

(declare-fun b!228575 () Bool)

(declare-fun e!148291 () Unit!6931)

(declare-fun lt!114882 () Unit!6931)

(assert (=> b!228575 (= e!148291 lt!114882)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!272 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) Int) Unit!6931)

(assert (=> b!228575 (= lt!114882 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!272 (_keys!6319 thiss!1504) (_values!4249 thiss!1504) (mask!10139 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 (defaultEntry!4266 thiss!1504)))))

(declare-fun c!37905 () Bool)

(declare-datatypes ((SeekEntryResult!911 0))(
  ( (MissingZero!911 (index!5814 (_ BitVec 32))) (Found!911 (index!5815 (_ BitVec 32))) (Intermediate!911 (undefined!1723 Bool) (index!5816 (_ BitVec 32)) (x!23346 (_ BitVec 32))) (Undefined!911) (MissingVacant!911 (index!5817 (_ BitVec 32))) )
))
(declare-fun lt!114877 () SeekEntryResult!911)

(get-info :version)

(assert (=> b!228575 (= c!37905 ((_ is MissingZero!911) lt!114877))))

(declare-fun e!148286 () Bool)

(assert (=> b!228575 e!148286))

(declare-fun b!228576 () Bool)

(declare-fun e!148292 () Bool)

(assert (=> b!228576 (= e!148284 e!148292)))

(declare-fun res!112478 () Bool)

(assert (=> b!228576 (=> (not res!112478) (not e!148292))))

(assert (=> b!228576 (= res!112478 (or (= lt!114877 (MissingZero!911 index!297)) (= lt!114877 (MissingVacant!911 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11239 (_ BitVec 32)) SeekEntryResult!911)

(assert (=> b!228576 (= lt!114877 (seekEntryOrOpen!0 key!932 (_keys!6319 thiss!1504) (mask!10139 thiss!1504)))))

(declare-fun b!228577 () Bool)

(declare-fun Unit!6933 () Unit!6931)

(assert (=> b!228577 (= e!148281 Unit!6933)))

(declare-fun lt!114885 () Unit!6931)

(declare-fun lemmaArrayContainsKeyThenInListMap!116 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) (_ BitVec 32) Int) Unit!6931)

(assert (=> b!228577 (= lt!114885 (lemmaArrayContainsKeyThenInListMap!116 (_keys!6319 thiss!1504) (_values!4249 thiss!1504) (mask!10139 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4266 thiss!1504)))))

(assert (=> b!228577 false))

(declare-fun bm!21224 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21224 (= call!21227 (inRange!0 (ite c!37905 (index!5814 lt!114877) (index!5817 lt!114877)) (mask!10139 thiss!1504)))))

(declare-fun b!228578 () Bool)

(declare-fun Unit!6934 () Unit!6931)

(assert (=> b!228578 (= e!148281 Unit!6934)))

(declare-fun b!228579 () Bool)

(declare-fun Unit!6935 () Unit!6931)

(assert (=> b!228579 (= e!148291 Unit!6935)))

(declare-fun lt!114878 () Unit!6931)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!275 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) Int) Unit!6931)

(assert (=> b!228579 (= lt!114878 (lemmaInListMapThenSeekEntryOrOpenFindsIt!275 (_keys!6319 thiss!1504) (_values!4249 thiss!1504) (mask!10139 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 (defaultEntry!4266 thiss!1504)))))

(assert (=> b!228579 false))

(declare-fun b!228580 () Bool)

(assert (=> b!228580 (= e!148285 (and e!148279 mapRes!10171))))

(declare-fun condMapEmpty!10171 () Bool)

(declare-fun mapDefault!10171 () ValueCell!2657)

(assert (=> b!228580 (= condMapEmpty!10171 (= (arr!5337 (_values!4249 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2657)) mapDefault!10171)))))

(declare-fun b!228581 () Bool)

(assert (=> b!228581 (= e!148292 e!148290)))

(declare-fun res!112477 () Bool)

(assert (=> b!228581 (=> (not res!112477) (not e!148290))))

(assert (=> b!228581 (= res!112477 (inRange!0 index!297 (mask!10139 thiss!1504)))))

(declare-fun lt!114881 () Unit!6931)

(assert (=> b!228581 (= lt!114881 e!148291)))

(declare-fun c!37904 () Bool)

(declare-datatypes ((tuple2!4470 0))(
  ( (tuple2!4471 (_1!2246 (_ BitVec 64)) (_2!2246 V!7649)) )
))
(declare-datatypes ((List!3406 0))(
  ( (Nil!3403) (Cons!3402 (h!4050 tuple2!4470) (t!8356 List!3406)) )
))
(declare-datatypes ((ListLongMap!3373 0))(
  ( (ListLongMap!3374 (toList!1702 List!3406)) )
))
(declare-fun contains!1577 (ListLongMap!3373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1211 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 32) Int) ListLongMap!3373)

(assert (=> b!228581 (= c!37904 (contains!1577 (getCurrentListMap!1211 (_keys!6319 thiss!1504) (_values!4249 thiss!1504) (mask!10139 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4266 thiss!1504)) key!932))))

(declare-fun b!228582 () Bool)

(declare-fun c!37906 () Bool)

(assert (=> b!228582 (= c!37906 ((_ is MissingVacant!911) lt!114877))))

(assert (=> b!228582 (= e!148286 e!148282)))

(declare-fun b!228583 () Bool)

(declare-fun res!112476 () Bool)

(assert (=> b!228583 (= res!112476 (= (select (arr!5338 (_keys!6319 thiss!1504)) (index!5817 lt!114877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228583 (=> (not res!112476) (not e!148289))))

(declare-fun b!228584 () Bool)

(declare-fun res!112480 () Bool)

(assert (=> b!228584 (=> res!112480 e!148280)))

(assert (=> b!228584 (= res!112480 (or (not (= (size!5671 (_values!4249 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10139 thiss!1504)))) (not (= (size!5672 (_keys!6319 thiss!1504)) (size!5671 (_values!4249 thiss!1504)))) (bvslt (mask!10139 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4003 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4003 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10171 () Bool)

(assert (=> mapIsEmpty!10171 mapRes!10171))

(declare-fun b!228570 () Bool)

(declare-fun res!112484 () Bool)

(assert (=> b!228570 (=> (not res!112484) (not e!148287))))

(assert (=> b!228570 (= res!112484 (= (select (arr!5338 (_keys!6319 thiss!1504)) (index!5814 lt!114877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!112483 () Bool)

(assert (=> start!22076 (=> (not res!112483) (not e!148284))))

(declare-fun valid!1299 (LongMapFixedSize!3214) Bool)

(assert (=> start!22076 (= res!112483 (valid!1299 thiss!1504))))

(assert (=> start!22076 e!148284))

(assert (=> start!22076 e!148293))

(assert (=> start!22076 true))

(declare-fun b!228585 () Bool)

(declare-fun res!112482 () Bool)

(assert (=> b!228585 (=> (not res!112482) (not e!148287))))

(assert (=> b!228585 (= res!112482 call!21227)))

(assert (=> b!228585 (= e!148286 e!148287)))

(declare-fun b!228586 () Bool)

(assert (=> b!228586 (= e!148282 ((_ is Undefined!911) lt!114877))))

(declare-fun bm!21225 () Bool)

(assert (=> bm!21225 (= call!21228 (arrayContainsKey!0 (_keys!6319 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!22076 res!112483) b!228572))

(assert (= (and b!228572 res!112474) b!228576))

(assert (= (and b!228576 res!112478) b!228581))

(assert (= (and b!228581 c!37904) b!228579))

(assert (= (and b!228581 (not c!37904)) b!228575))

(assert (= (and b!228575 c!37905) b!228585))

(assert (= (and b!228575 (not c!37905)) b!228582))

(assert (= (and b!228585 res!112482) b!228570))

(assert (= (and b!228570 res!112484) b!228574))

(assert (= (and b!228582 c!37906) b!228566))

(assert (= (and b!228582 (not c!37906)) b!228586))

(assert (= (and b!228566 res!112479) b!228583))

(assert (= (and b!228583 res!112476) b!228569))

(assert (= (or b!228585 b!228566) bm!21224))

(assert (= (or b!228574 b!228569) bm!21225))

(assert (= (and b!228581 res!112477) b!228573))

(assert (= (and b!228573 c!37903) b!228577))

(assert (= (and b!228573 (not c!37903)) b!228578))

(assert (= (and b!228573 (not res!112481)) b!228584))

(assert (= (and b!228584 (not res!112480)) b!228564))

(assert (= (and b!228564 (not res!112475)) b!228571))

(assert (= (and b!228580 condMapEmpty!10171) mapIsEmpty!10171))

(assert (= (and b!228580 (not condMapEmpty!10171)) mapNonEmpty!10171))

(assert (= (and mapNonEmpty!10171 ((_ is ValueCellFull!2657) mapValue!10171)) b!228565))

(assert (= (and b!228580 ((_ is ValueCellFull!2657) mapDefault!10171)) b!228568))

(assert (= b!228567 b!228580))

(assert (= start!22076 b!228567))

(declare-fun m!249787 () Bool)

(assert (=> b!228575 m!249787))

(declare-fun m!249789 () Bool)

(assert (=> b!228576 m!249789))

(declare-fun m!249791 () Bool)

(assert (=> start!22076 m!249791))

(declare-fun m!249793 () Bool)

(assert (=> b!228571 m!249793))

(declare-fun m!249795 () Bool)

(assert (=> mapNonEmpty!10171 m!249795))

(declare-fun m!249797 () Bool)

(assert (=> b!228581 m!249797))

(declare-fun m!249799 () Bool)

(assert (=> b!228581 m!249799))

(assert (=> b!228581 m!249799))

(declare-fun m!249801 () Bool)

(assert (=> b!228581 m!249801))

(declare-fun m!249803 () Bool)

(assert (=> b!228570 m!249803))

(declare-fun m!249805 () Bool)

(assert (=> bm!21224 m!249805))

(declare-fun m!249807 () Bool)

(assert (=> b!228577 m!249807))

(declare-fun m!249809 () Bool)

(assert (=> b!228564 m!249809))

(declare-fun m!249811 () Bool)

(assert (=> bm!21225 m!249811))

(declare-fun m!249813 () Bool)

(assert (=> b!228583 m!249813))

(declare-fun m!249815 () Bool)

(assert (=> b!228579 m!249815))

(declare-fun m!249817 () Bool)

(assert (=> b!228573 m!249817))

(assert (=> b!228573 m!249811))

(declare-fun m!249819 () Bool)

(assert (=> b!228573 m!249819))

(declare-fun m!249821 () Bool)

(assert (=> b!228573 m!249821))

(declare-fun m!249823 () Bool)

(assert (=> b!228573 m!249823))

(declare-fun m!249825 () Bool)

(assert (=> b!228573 m!249825))

(declare-fun m!249827 () Bool)

(assert (=> b!228573 m!249827))

(declare-fun m!249829 () Bool)

(assert (=> b!228573 m!249829))

(declare-fun m!249831 () Bool)

(assert (=> b!228573 m!249831))

(declare-fun m!249833 () Bool)

(assert (=> b!228573 m!249833))

(declare-fun m!249835 () Bool)

(assert (=> b!228567 m!249835))

(declare-fun m!249837 () Bool)

(assert (=> b!228567 m!249837))

(check-sat (not b!228576) (not b!228571) tp_is_empty!6001 (not b!228577) (not mapNonEmpty!10171) (not b!228575) (not start!22076) (not b!228567) (not b_next!6139) (not b!228579) (not b!228581) b_and!13011 (not b!228573) (not b!228564) (not bm!21224) (not bm!21225))
(check-sat b_and!13011 (not b_next!6139))
