; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23924 () Bool)

(assert start!23924)

(declare-fun b!250577 () Bool)

(declare-fun b_free!6631 () Bool)

(declare-fun b_next!6631 () Bool)

(assert (=> b!250577 (= b_free!6631 (not b_next!6631))))

(declare-fun tp!23161 () Bool)

(declare-fun b_and!13627 () Bool)

(assert (=> b!250577 (= tp!23161 b_and!13627)))

(declare-fun b!250562 () Bool)

(declare-fun e!162498 () Bool)

(declare-fun e!162508 () Bool)

(declare-fun mapRes!11035 () Bool)

(assert (=> b!250562 (= e!162498 (and e!162508 mapRes!11035))))

(declare-fun condMapEmpty!11035 () Bool)

(declare-datatypes ((V!8305 0))(
  ( (V!8306 (val!3291 Int)) )
))
(declare-datatypes ((ValueCell!2903 0))(
  ( (ValueCellFull!2903 (v!5351 V!8305)) (EmptyCell!2903) )
))
(declare-datatypes ((array!12297 0))(
  ( (array!12298 (arr!5829 (Array (_ BitVec 32) ValueCell!2903)) (size!6175 (_ BitVec 32))) )
))
(declare-datatypes ((array!12299 0))(
  ( (array!12300 (arr!5830 (Array (_ BitVec 32) (_ BitVec 64))) (size!6176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3706 0))(
  ( (LongMapFixedSize!3707 (defaultEntry!4634 Int) (mask!10823 (_ BitVec 32)) (extraKeys!4371 (_ BitVec 32)) (zeroValue!4475 V!8305) (minValue!4475 V!8305) (_size!1902 (_ BitVec 32)) (_keys!6771 array!12299) (_values!4617 array!12297) (_vacant!1902 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3706)

(declare-fun mapDefault!11035 () ValueCell!2903)

(assert (=> b!250562 (= condMapEmpty!11035 (= (arr!5829 (_values!4617 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2903)) mapDefault!11035)))))

(declare-fun b!250563 () Bool)

(declare-datatypes ((Unit!7735 0))(
  ( (Unit!7736) )
))
(declare-fun e!162497 () Unit!7735)

(declare-fun Unit!7737 () Unit!7735)

(assert (=> b!250563 (= e!162497 Unit!7737)))

(declare-fun lt!125448 () Unit!7735)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!208 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) (_ BitVec 32) Int) Unit!7735)

(assert (=> b!250563 (= lt!125448 (lemmaArrayContainsKeyThenInListMap!208 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250563 false))

(declare-fun b!250564 () Bool)

(declare-fun c!42117 () Bool)

(declare-datatypes ((SeekEntryResult!1122 0))(
  ( (MissingZero!1122 (index!6658 (_ BitVec 32))) (Found!1122 (index!6659 (_ BitVec 32))) (Intermediate!1122 (undefined!1934 Bool) (index!6660 (_ BitVec 32)) (x!24689 (_ BitVec 32))) (Undefined!1122) (MissingVacant!1122 (index!6661 (_ BitVec 32))) )
))
(declare-fun lt!125447 () SeekEntryResult!1122)

(get-info :version)

(assert (=> b!250564 (= c!42117 ((_ is MissingVacant!1122) lt!125447))))

(declare-fun e!162501 () Bool)

(declare-fun e!162509 () Bool)

(assert (=> b!250564 (= e!162501 e!162509)))

(declare-fun b!250565 () Bool)

(declare-fun e!162495 () Bool)

(declare-fun call!23549 () Bool)

(assert (=> b!250565 (= e!162495 (not call!23549))))

(declare-fun b!250566 () Bool)

(declare-fun res!122688 () Bool)

(assert (=> b!250566 (=> (not res!122688) (not e!162495))))

(declare-fun call!23550 () Bool)

(assert (=> b!250566 (= res!122688 call!23550)))

(assert (=> b!250566 (= e!162501 e!162495)))

(declare-fun res!122682 () Bool)

(declare-fun e!162505 () Bool)

(assert (=> start!23924 (=> (not res!122682) (not e!162505))))

(declare-fun valid!1453 (LongMapFixedSize!3706) Bool)

(assert (=> start!23924 (= res!122682 (valid!1453 thiss!1504))))

(assert (=> start!23924 e!162505))

(declare-fun e!162496 () Bool)

(assert (=> start!23924 e!162496))

(assert (=> start!23924 true))

(declare-fun b!250567 () Bool)

(declare-fun e!162502 () Bool)

(declare-fun tp_is_empty!6493 () Bool)

(assert (=> b!250567 (= e!162502 tp_is_empty!6493)))

(declare-fun b!250568 () Bool)

(declare-fun e!162506 () Bool)

(assert (=> b!250568 (= e!162505 e!162506)))

(declare-fun res!122687 () Bool)

(assert (=> b!250568 (=> (not res!122687) (not e!162506))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!250568 (= res!122687 (or (= lt!125447 (MissingZero!1122 index!297)) (= lt!125447 (MissingVacant!1122 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12299 (_ BitVec 32)) SeekEntryResult!1122)

(assert (=> b!250568 (= lt!125447 (seekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(declare-fun c!42115 () Bool)

(declare-fun bm!23546 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23546 (= call!23550 (inRange!0 (ite c!42115 (index!6658 lt!125447) (index!6661 lt!125447)) (mask!10823 thiss!1504)))))

(declare-fun b!250569 () Bool)

(assert (=> b!250569 (= e!162509 ((_ is Undefined!1122) lt!125447))))

(declare-fun mapNonEmpty!11035 () Bool)

(declare-fun tp!23160 () Bool)

(assert (=> mapNonEmpty!11035 (= mapRes!11035 (and tp!23160 e!162502))))

(declare-fun mapValue!11035 () ValueCell!2903)

(declare-fun mapRest!11035 () (Array (_ BitVec 32) ValueCell!2903))

(declare-fun mapKey!11035 () (_ BitVec 32))

(assert (=> mapNonEmpty!11035 (= (arr!5829 (_values!4617 thiss!1504)) (store mapRest!11035 mapKey!11035 mapValue!11035))))

(declare-fun b!250570 () Bool)

(declare-fun e!162499 () Unit!7735)

(declare-fun lt!125439 () Unit!7735)

(assert (=> b!250570 (= e!162499 lt!125439)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7735)

(assert (=> b!250570 (= lt!125439 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250570 (= c!42115 ((_ is MissingZero!1122) lt!125447))))

(assert (=> b!250570 e!162501))

(declare-fun b!250571 () Bool)

(declare-fun res!122690 () Bool)

(assert (=> b!250571 (=> (not res!122690) (not e!162505))))

(assert (=> b!250571 (= res!122690 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250572 () Bool)

(declare-fun Unit!7738 () Unit!7735)

(assert (=> b!250572 (= e!162497 Unit!7738)))

(declare-fun b!250573 () Bool)

(declare-fun e!162504 () Bool)

(assert (=> b!250573 (= e!162509 e!162504)))

(declare-fun res!122683 () Bool)

(assert (=> b!250573 (= res!122683 call!23550)))

(assert (=> b!250573 (=> (not res!122683) (not e!162504))))

(declare-fun b!250574 () Bool)

(assert (=> b!250574 (= e!162504 (not call!23549))))

(declare-fun b!250575 () Bool)

(declare-fun e!162500 () Bool)

(declare-fun e!162503 () Bool)

(assert (=> b!250575 (= e!162500 (not e!162503))))

(declare-fun res!122685 () Bool)

(assert (=> b!250575 (=> res!122685 e!162503)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250575 (= res!122685 (not (validMask!0 (mask!10823 thiss!1504))))))

(declare-fun lt!125440 () array!12299)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12299 (_ BitVec 32)) Bool)

(assert (=> b!250575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125440 (mask!10823 thiss!1504))))

(declare-fun lt!125442 () Unit!7735)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12299 (_ BitVec 32) (_ BitVec 32)) Unit!7735)

(assert (=> b!250575 (= lt!125442 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) index!297 (mask!10823 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250575 (= (arrayCountValidKeys!0 lt!125440 #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504)))))))

(declare-fun lt!125441 () Unit!7735)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12299 (_ BitVec 32) (_ BitVec 64)) Unit!7735)

(assert (=> b!250575 (= lt!125441 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6771 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3707 0))(
  ( (Nil!3704) (Cons!3703 (h!4363 (_ BitVec 64)) (t!8733 List!3707)) )
))
(declare-fun arrayNoDuplicates!0 (array!12299 (_ BitVec 32) List!3707) Bool)

(assert (=> b!250575 (arrayNoDuplicates!0 lt!125440 #b00000000000000000000000000000000 Nil!3704)))

(assert (=> b!250575 (= lt!125440 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun lt!125443 () Unit!7735)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3707) Unit!7735)

(assert (=> b!250575 (= lt!125443 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6771 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704))))

(declare-fun lt!125445 () Unit!7735)

(assert (=> b!250575 (= lt!125445 e!162497)))

(declare-fun c!42116 () Bool)

(declare-fun arrayContainsKey!0 (array!12299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!250575 (= c!42116 (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250576 () Bool)

(assert (=> b!250576 (= e!162508 tp_is_empty!6493)))

(declare-fun array_inv!3841 (array!12299) Bool)

(declare-fun array_inv!3842 (array!12297) Bool)

(assert (=> b!250577 (= e!162496 (and tp!23161 tp_is_empty!6493 (array_inv!3841 (_keys!6771 thiss!1504)) (array_inv!3842 (_values!4617 thiss!1504)) e!162498))))

(declare-fun b!250578 () Bool)

(declare-fun res!122684 () Bool)

(assert (=> b!250578 (= res!122684 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6661 lt!125447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250578 (=> (not res!122684) (not e!162504))))

(declare-fun b!250579 () Bool)

(declare-fun Unit!7739 () Unit!7735)

(assert (=> b!250579 (= e!162499 Unit!7739)))

(declare-fun lt!125444 () Unit!7735)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!399 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7735)

(assert (=> b!250579 (= lt!125444 (lemmaInListMapThenSeekEntryOrOpenFindsIt!399 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250579 false))

(declare-fun b!250580 () Bool)

(declare-fun res!122689 () Bool)

(assert (=> b!250580 (=> (not res!122689) (not e!162495))))

(assert (=> b!250580 (= res!122689 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6658 lt!125447)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11035 () Bool)

(assert (=> mapIsEmpty!11035 mapRes!11035))

(declare-fun b!250581 () Bool)

(assert (=> b!250581 (= e!162506 e!162500)))

(declare-fun res!122686 () Bool)

(assert (=> b!250581 (=> (not res!122686) (not e!162500))))

(assert (=> b!250581 (= res!122686 (inRange!0 index!297 (mask!10823 thiss!1504)))))

(declare-fun lt!125446 () Unit!7735)

(assert (=> b!250581 (= lt!125446 e!162499)))

(declare-fun c!42114 () Bool)

(declare-datatypes ((tuple2!4808 0))(
  ( (tuple2!4809 (_1!2415 (_ BitVec 64)) (_2!2415 V!8305)) )
))
(declare-datatypes ((List!3708 0))(
  ( (Nil!3705) (Cons!3704 (h!4364 tuple2!4808) (t!8734 List!3708)) )
))
(declare-datatypes ((ListLongMap!3711 0))(
  ( (ListLongMap!3712 (toList!1871 List!3708)) )
))
(declare-fun contains!1798 (ListLongMap!3711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1380 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 32) Int) ListLongMap!3711)

(assert (=> b!250581 (= c!42114 (contains!1798 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932))))

(declare-fun b!250582 () Bool)

(assert (=> b!250582 (= e!162503 (or (not (= (size!6175 (_values!4617 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10823 thiss!1504)))) (not (= (size!6176 (_keys!6771 thiss!1504)) (size!6175 (_values!4617 thiss!1504)))) (bvslt (mask!10823 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4371 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun bm!23547 () Bool)

(assert (=> bm!23547 (= call!23549 (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!23924 res!122682) b!250571))

(assert (= (and b!250571 res!122690) b!250568))

(assert (= (and b!250568 res!122687) b!250581))

(assert (= (and b!250581 c!42114) b!250579))

(assert (= (and b!250581 (not c!42114)) b!250570))

(assert (= (and b!250570 c!42115) b!250566))

(assert (= (and b!250570 (not c!42115)) b!250564))

(assert (= (and b!250566 res!122688) b!250580))

(assert (= (and b!250580 res!122689) b!250565))

(assert (= (and b!250564 c!42117) b!250573))

(assert (= (and b!250564 (not c!42117)) b!250569))

(assert (= (and b!250573 res!122683) b!250578))

(assert (= (and b!250578 res!122684) b!250574))

(assert (= (or b!250566 b!250573) bm!23546))

(assert (= (or b!250565 b!250574) bm!23547))

(assert (= (and b!250581 res!122686) b!250575))

(assert (= (and b!250575 c!42116) b!250563))

(assert (= (and b!250575 (not c!42116)) b!250572))

(assert (= (and b!250575 (not res!122685)) b!250582))

(assert (= (and b!250562 condMapEmpty!11035) mapIsEmpty!11035))

(assert (= (and b!250562 (not condMapEmpty!11035)) mapNonEmpty!11035))

(assert (= (and mapNonEmpty!11035 ((_ is ValueCellFull!2903) mapValue!11035)) b!250567))

(assert (= (and b!250562 ((_ is ValueCellFull!2903) mapDefault!11035)) b!250576))

(assert (= b!250577 b!250562))

(assert (= start!23924 b!250577))

(declare-fun m!266449 () Bool)

(assert (=> b!250580 m!266449))

(declare-fun m!266451 () Bool)

(assert (=> b!250577 m!266451))

(declare-fun m!266453 () Bool)

(assert (=> b!250577 m!266453))

(declare-fun m!266455 () Bool)

(assert (=> b!250575 m!266455))

(declare-fun m!266457 () Bool)

(assert (=> b!250575 m!266457))

(declare-fun m!266459 () Bool)

(assert (=> b!250575 m!266459))

(declare-fun m!266461 () Bool)

(assert (=> b!250575 m!266461))

(declare-fun m!266463 () Bool)

(assert (=> b!250575 m!266463))

(declare-fun m!266465 () Bool)

(assert (=> b!250575 m!266465))

(declare-fun m!266467 () Bool)

(assert (=> b!250575 m!266467))

(declare-fun m!266469 () Bool)

(assert (=> b!250575 m!266469))

(declare-fun m!266471 () Bool)

(assert (=> b!250575 m!266471))

(declare-fun m!266473 () Bool)

(assert (=> b!250575 m!266473))

(declare-fun m!266475 () Bool)

(assert (=> bm!23546 m!266475))

(declare-fun m!266477 () Bool)

(assert (=> b!250568 m!266477))

(declare-fun m!266479 () Bool)

(assert (=> b!250563 m!266479))

(declare-fun m!266481 () Bool)

(assert (=> mapNonEmpty!11035 m!266481))

(declare-fun m!266483 () Bool)

(assert (=> b!250570 m!266483))

(declare-fun m!266485 () Bool)

(assert (=> b!250579 m!266485))

(declare-fun m!266487 () Bool)

(assert (=> start!23924 m!266487))

(declare-fun m!266489 () Bool)

(assert (=> b!250581 m!266489))

(declare-fun m!266491 () Bool)

(assert (=> b!250581 m!266491))

(assert (=> b!250581 m!266491))

(declare-fun m!266493 () Bool)

(assert (=> b!250581 m!266493))

(declare-fun m!266495 () Bool)

(assert (=> b!250578 m!266495))

(assert (=> bm!23547 m!266457))

(check-sat (not b_next!6631) (not b!250581) b_and!13627 (not bm!23546) (not b!250575) (not b!250568) (not b!250563) tp_is_empty!6493 (not mapNonEmpty!11035) (not b!250579) (not bm!23547) (not b!250577) (not b!250570) (not start!23924))
(check-sat b_and!13627 (not b_next!6631))
(get-model)

(declare-fun b!250725 () Bool)

(declare-fun e!162609 () Bool)

(declare-fun e!162610 () Bool)

(assert (=> b!250725 (= e!162609 e!162610)))

(declare-fun res!122755 () Bool)

(declare-fun call!23567 () Bool)

(assert (=> b!250725 (= res!122755 call!23567)))

(assert (=> b!250725 (=> (not res!122755) (not e!162610))))

(declare-fun b!250726 () Bool)

(declare-fun e!162608 () Bool)

(declare-fun lt!125513 () SeekEntryResult!1122)

(assert (=> b!250726 (= e!162608 ((_ is Undefined!1122) lt!125513))))

(declare-fun b!250727 () Bool)

(declare-fun res!122756 () Bool)

(declare-fun e!162611 () Bool)

(assert (=> b!250727 (=> (not res!122756) (not e!162611))))

(assert (=> b!250727 (= res!122756 call!23567)))

(assert (=> b!250727 (= e!162608 e!162611)))

(declare-fun c!42147 () Bool)

(declare-fun bm!23564 () Bool)

(assert (=> bm!23564 (= call!23567 (inRange!0 (ite c!42147 (index!6658 lt!125513) (index!6661 lt!125513)) (mask!10823 thiss!1504)))))

(declare-fun b!250728 () Bool)

(declare-fun res!122753 () Bool)

(assert (=> b!250728 (=> (not res!122753) (not e!162611))))

(assert (=> b!250728 (= res!122753 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6661 lt!125513)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250728 (and (bvsge (index!6661 lt!125513) #b00000000000000000000000000000000) (bvslt (index!6661 lt!125513) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun bm!23565 () Bool)

(declare-fun call!23568 () Bool)

(assert (=> bm!23565 (= call!23568 (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250729 () Bool)

(assert (=> b!250729 (= e!162609 e!162608)))

(declare-fun c!42146 () Bool)

(assert (=> b!250729 (= c!42146 ((_ is MissingVacant!1122) lt!125513))))

(declare-fun b!250730 () Bool)

(assert (=> b!250730 (= e!162610 (not call!23568))))

(declare-fun d!60825 () Bool)

(assert (=> d!60825 e!162609))

(assert (=> d!60825 (= c!42147 ((_ is MissingZero!1122) lt!125513))))

(assert (=> d!60825 (= lt!125513 (seekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(declare-fun lt!125514 () Unit!7735)

(declare-fun choose!1195 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7735)

(assert (=> d!60825 (= lt!125514 (choose!1195 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> d!60825 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60825 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) lt!125514)))

(declare-fun b!250731 () Bool)

(assert (=> b!250731 (= e!162611 (not call!23568))))

(declare-fun b!250732 () Bool)

(assert (=> b!250732 (and (bvsge (index!6658 lt!125513) #b00000000000000000000000000000000) (bvslt (index!6658 lt!125513) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun res!122754 () Bool)

(assert (=> b!250732 (= res!122754 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6658 lt!125513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250732 (=> (not res!122754) (not e!162610))))

(assert (= (and d!60825 c!42147) b!250725))

(assert (= (and d!60825 (not c!42147)) b!250729))

(assert (= (and b!250725 res!122755) b!250732))

(assert (= (and b!250732 res!122754) b!250730))

(assert (= (and b!250729 c!42146) b!250727))

(assert (= (and b!250729 (not c!42146)) b!250726))

(assert (= (and b!250727 res!122756) b!250728))

(assert (= (and b!250728 res!122753) b!250731))

(assert (= (or b!250725 b!250727) bm!23564))

(assert (= (or b!250730 b!250731) bm!23565))

(declare-fun m!266593 () Bool)

(assert (=> b!250732 m!266593))

(declare-fun m!266595 () Bool)

(assert (=> bm!23564 m!266595))

(assert (=> d!60825 m!266477))

(declare-fun m!266597 () Bool)

(assert (=> d!60825 m!266597))

(assert (=> d!60825 m!266455))

(assert (=> bm!23565 m!266457))

(declare-fun m!266599 () Bool)

(assert (=> b!250728 m!266599))

(assert (=> b!250570 d!60825))

(declare-fun d!60827 () Bool)

(declare-fun e!162616 () Bool)

(assert (=> d!60827 e!162616))

(declare-fun res!122768 () Bool)

(assert (=> d!60827 (=> (not res!122768) (not e!162616))))

(assert (=> d!60827 (= res!122768 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6771 thiss!1504)))))))

(declare-fun lt!125517 () Unit!7735)

(declare-fun choose!1 (array!12299 (_ BitVec 32) (_ BitVec 64)) Unit!7735)

(assert (=> d!60827 (= lt!125517 (choose!1 (_keys!6771 thiss!1504) index!297 key!932))))

(declare-fun e!162617 () Bool)

(assert (=> d!60827 e!162617))

(declare-fun res!122765 () Bool)

(assert (=> d!60827 (=> (not res!122765) (not e!162617))))

(assert (=> d!60827 (= res!122765 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6771 thiss!1504)))))))

(assert (=> d!60827 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6771 thiss!1504) index!297 key!932) lt!125517)))

(declare-fun b!250744 () Bool)

(assert (=> b!250744 (= e!162616 (= (arrayCountValidKeys!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!250741 () Bool)

(declare-fun res!122766 () Bool)

(assert (=> b!250741 (=> (not res!122766) (not e!162617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!250741 (= res!122766 (not (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) index!297))))))

(declare-fun b!250742 () Bool)

(declare-fun res!122767 () Bool)

(assert (=> b!250742 (=> (not res!122767) (not e!162617))))

(assert (=> b!250742 (= res!122767 (validKeyInArray!0 key!932))))

(declare-fun b!250743 () Bool)

(assert (=> b!250743 (= e!162617 (bvslt (size!6176 (_keys!6771 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60827 res!122765) b!250741))

(assert (= (and b!250741 res!122766) b!250742))

(assert (= (and b!250742 res!122767) b!250743))

(assert (= (and d!60827 res!122768) b!250744))

(declare-fun m!266601 () Bool)

(assert (=> d!60827 m!266601))

(assert (=> b!250744 m!266463))

(declare-fun m!266603 () Bool)

(assert (=> b!250744 m!266603))

(assert (=> b!250744 m!266465))

(declare-fun m!266605 () Bool)

(assert (=> b!250741 m!266605))

(assert (=> b!250741 m!266605))

(declare-fun m!266607 () Bool)

(assert (=> b!250741 m!266607))

(declare-fun m!266609 () Bool)

(assert (=> b!250742 m!266609))

(assert (=> b!250575 d!60827))

(declare-fun b!250754 () Bool)

(declare-fun e!162622 () (_ BitVec 32))

(declare-fun call!23571 () (_ BitVec 32))

(assert (=> b!250754 (= e!162622 call!23571)))

(declare-fun b!250755 () Bool)

(assert (=> b!250755 (= e!162622 (bvadd #b00000000000000000000000000000001 call!23571))))

(declare-fun b!250756 () Bool)

(declare-fun e!162623 () (_ BitVec 32))

(assert (=> b!250756 (= e!162623 #b00000000000000000000000000000000)))

(declare-fun bm!23568 () Bool)

(assert (=> bm!23568 (= call!23571 (arrayCountValidKeys!0 (_keys!6771 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun d!60829 () Bool)

(declare-fun lt!125520 () (_ BitVec 32))

(assert (=> d!60829 (and (bvsge lt!125520 #b00000000000000000000000000000000) (bvsle lt!125520 (bvsub (size!6176 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60829 (= lt!125520 e!162623)))

(declare-fun c!42152 () Bool)

(assert (=> d!60829 (= c!42152 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60829 (and (bvsle #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6771 thiss!1504)) (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60829 (= (arrayCountValidKeys!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) lt!125520)))

(declare-fun b!250753 () Bool)

(assert (=> b!250753 (= e!162623 e!162622)))

(declare-fun c!42153 () Bool)

(assert (=> b!250753 (= c!42153 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60829 c!42152) b!250756))

(assert (= (and d!60829 (not c!42152)) b!250753))

(assert (= (and b!250753 c!42153) b!250755))

(assert (= (and b!250753 (not c!42153)) b!250754))

(assert (= (or b!250755 b!250754) bm!23568))

(declare-fun m!266611 () Bool)

(assert (=> bm!23568 m!266611))

(declare-fun m!266613 () Bool)

(assert (=> b!250753 m!266613))

(assert (=> b!250753 m!266613))

(declare-fun m!266615 () Bool)

(assert (=> b!250753 m!266615))

(assert (=> b!250575 d!60829))

(declare-fun d!60831 () Bool)

(assert (=> d!60831 (= (validMask!0 (mask!10823 thiss!1504)) (and (or (= (mask!10823 thiss!1504) #b00000000000000000000000000000111) (= (mask!10823 thiss!1504) #b00000000000000000000000000001111) (= (mask!10823 thiss!1504) #b00000000000000000000000000011111) (= (mask!10823 thiss!1504) #b00000000000000000000000000111111) (= (mask!10823 thiss!1504) #b00000000000000000000000001111111) (= (mask!10823 thiss!1504) #b00000000000000000000000011111111) (= (mask!10823 thiss!1504) #b00000000000000000000000111111111) (= (mask!10823 thiss!1504) #b00000000000000000000001111111111) (= (mask!10823 thiss!1504) #b00000000000000000000011111111111) (= (mask!10823 thiss!1504) #b00000000000000000000111111111111) (= (mask!10823 thiss!1504) #b00000000000000000001111111111111) (= (mask!10823 thiss!1504) #b00000000000000000011111111111111) (= (mask!10823 thiss!1504) #b00000000000000000111111111111111) (= (mask!10823 thiss!1504) #b00000000000000001111111111111111) (= (mask!10823 thiss!1504) #b00000000000000011111111111111111) (= (mask!10823 thiss!1504) #b00000000000000111111111111111111) (= (mask!10823 thiss!1504) #b00000000000001111111111111111111) (= (mask!10823 thiss!1504) #b00000000000011111111111111111111) (= (mask!10823 thiss!1504) #b00000000000111111111111111111111) (= (mask!10823 thiss!1504) #b00000000001111111111111111111111) (= (mask!10823 thiss!1504) #b00000000011111111111111111111111) (= (mask!10823 thiss!1504) #b00000000111111111111111111111111) (= (mask!10823 thiss!1504) #b00000001111111111111111111111111) (= (mask!10823 thiss!1504) #b00000011111111111111111111111111) (= (mask!10823 thiss!1504) #b00000111111111111111111111111111) (= (mask!10823 thiss!1504) #b00001111111111111111111111111111) (= (mask!10823 thiss!1504) #b00011111111111111111111111111111) (= (mask!10823 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10823 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!250575 d!60831))

(declare-fun bm!23571 () Bool)

(declare-fun call!23574 () Bool)

(declare-fun c!42156 () Bool)

(assert (=> bm!23571 (= call!23574 (arrayNoDuplicates!0 lt!125440 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42156 (Cons!3703 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) Nil!3704) Nil!3704)))))

(declare-fun b!250767 () Bool)

(declare-fun e!162632 () Bool)

(declare-fun contains!1801 (List!3707 (_ BitVec 64)) Bool)

(assert (=> b!250767 (= e!162632 (contains!1801 Nil!3704 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun d!60833 () Bool)

(declare-fun res!122775 () Bool)

(declare-fun e!162635 () Bool)

(assert (=> d!60833 (=> res!122775 e!162635)))

(assert (=> d!60833 (= res!122775 (bvsge #b00000000000000000000000000000000 (size!6176 lt!125440)))))

(assert (=> d!60833 (= (arrayNoDuplicates!0 lt!125440 #b00000000000000000000000000000000 Nil!3704) e!162635)))

(declare-fun b!250768 () Bool)

(declare-fun e!162634 () Bool)

(assert (=> b!250768 (= e!162635 e!162634)))

(declare-fun res!122776 () Bool)

(assert (=> b!250768 (=> (not res!122776) (not e!162634))))

(assert (=> b!250768 (= res!122776 (not e!162632))))

(declare-fun res!122777 () Bool)

(assert (=> b!250768 (=> (not res!122777) (not e!162632))))

(assert (=> b!250768 (= res!122777 (validKeyInArray!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun b!250769 () Bool)

(declare-fun e!162633 () Bool)

(assert (=> b!250769 (= e!162634 e!162633)))

(assert (=> b!250769 (= c!42156 (validKeyInArray!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun b!250770 () Bool)

(assert (=> b!250770 (= e!162633 call!23574)))

(declare-fun b!250771 () Bool)

(assert (=> b!250771 (= e!162633 call!23574)))

(assert (= (and d!60833 (not res!122775)) b!250768))

(assert (= (and b!250768 res!122777) b!250767))

(assert (= (and b!250768 res!122776) b!250769))

(assert (= (and b!250769 c!42156) b!250770))

(assert (= (and b!250769 (not c!42156)) b!250771))

(assert (= (or b!250770 b!250771) bm!23571))

(declare-fun m!266617 () Bool)

(assert (=> bm!23571 m!266617))

(declare-fun m!266619 () Bool)

(assert (=> bm!23571 m!266619))

(assert (=> b!250767 m!266617))

(assert (=> b!250767 m!266617))

(declare-fun m!266621 () Bool)

(assert (=> b!250767 m!266621))

(assert (=> b!250768 m!266617))

(assert (=> b!250768 m!266617))

(declare-fun m!266623 () Bool)

(assert (=> b!250768 m!266623))

(assert (=> b!250769 m!266617))

(assert (=> b!250769 m!266617))

(assert (=> b!250769 m!266623))

(assert (=> b!250575 d!60833))

(declare-fun bm!23574 () Bool)

(declare-fun call!23577 () Bool)

(assert (=> bm!23574 (= call!23577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125440 (mask!10823 thiss!1504)))))

(declare-fun b!250780 () Bool)

(declare-fun e!162642 () Bool)

(assert (=> b!250780 (= e!162642 call!23577)))

(declare-fun d!60835 () Bool)

(declare-fun res!122782 () Bool)

(declare-fun e!162643 () Bool)

(assert (=> d!60835 (=> res!122782 e!162643)))

(assert (=> d!60835 (= res!122782 (bvsge #b00000000000000000000000000000000 (size!6176 lt!125440)))))

(assert (=> d!60835 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125440 (mask!10823 thiss!1504)) e!162643)))

(declare-fun b!250781 () Bool)

(declare-fun e!162644 () Bool)

(assert (=> b!250781 (= e!162643 e!162644)))

(declare-fun c!42159 () Bool)

(assert (=> b!250781 (= c!42159 (validKeyInArray!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun b!250782 () Bool)

(assert (=> b!250782 (= e!162644 e!162642)))

(declare-fun lt!125529 () (_ BitVec 64))

(assert (=> b!250782 (= lt!125529 (select (arr!5830 lt!125440) #b00000000000000000000000000000000))))

(declare-fun lt!125528 () Unit!7735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12299 (_ BitVec 64) (_ BitVec 32)) Unit!7735)

(assert (=> b!250782 (= lt!125528 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125440 lt!125529 #b00000000000000000000000000000000))))

(assert (=> b!250782 (arrayContainsKey!0 lt!125440 lt!125529 #b00000000000000000000000000000000)))

(declare-fun lt!125527 () Unit!7735)

(assert (=> b!250782 (= lt!125527 lt!125528)))

(declare-fun res!122783 () Bool)

(assert (=> b!250782 (= res!122783 (= (seekEntryOrOpen!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) lt!125440 (mask!10823 thiss!1504)) (Found!1122 #b00000000000000000000000000000000)))))

(assert (=> b!250782 (=> (not res!122783) (not e!162642))))

(declare-fun b!250783 () Bool)

(assert (=> b!250783 (= e!162644 call!23577)))

(assert (= (and d!60835 (not res!122782)) b!250781))

(assert (= (and b!250781 c!42159) b!250782))

(assert (= (and b!250781 (not c!42159)) b!250783))

(assert (= (and b!250782 res!122783) b!250780))

(assert (= (or b!250780 b!250783) bm!23574))

(declare-fun m!266625 () Bool)

(assert (=> bm!23574 m!266625))

(assert (=> b!250781 m!266617))

(assert (=> b!250781 m!266617))

(assert (=> b!250781 m!266623))

(assert (=> b!250782 m!266617))

(declare-fun m!266627 () Bool)

(assert (=> b!250782 m!266627))

(declare-fun m!266629 () Bool)

(assert (=> b!250782 m!266629))

(assert (=> b!250782 m!266617))

(declare-fun m!266631 () Bool)

(assert (=> b!250782 m!266631))

(assert (=> b!250575 d!60835))

(declare-fun d!60837 () Bool)

(declare-fun e!162647 () Bool)

(assert (=> d!60837 e!162647))

(declare-fun res!122786 () Bool)

(assert (=> d!60837 (=> (not res!122786) (not e!162647))))

(assert (=> d!60837 (= res!122786 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6771 thiss!1504)))))))

(declare-fun lt!125532 () Unit!7735)

(declare-fun choose!41 (array!12299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3707) Unit!7735)

(assert (=> d!60837 (= lt!125532 (choose!41 (_keys!6771 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704))))

(assert (=> d!60837 (bvslt (size!6176 (_keys!6771 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60837 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6771 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704) lt!125532)))

(declare-fun b!250786 () Bool)

(assert (=> b!250786 (= e!162647 (arrayNoDuplicates!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000000 Nil!3704))))

(assert (= (and d!60837 res!122786) b!250786))

(declare-fun m!266633 () Bool)

(assert (=> d!60837 m!266633))

(assert (=> b!250786 m!266463))

(declare-fun m!266635 () Bool)

(assert (=> b!250786 m!266635))

(assert (=> b!250575 d!60837))

(declare-fun b!250788 () Bool)

(declare-fun e!162648 () (_ BitVec 32))

(declare-fun call!23578 () (_ BitVec 32))

(assert (=> b!250788 (= e!162648 call!23578)))

(declare-fun b!250789 () Bool)

(assert (=> b!250789 (= e!162648 (bvadd #b00000000000000000000000000000001 call!23578))))

(declare-fun b!250790 () Bool)

(declare-fun e!162649 () (_ BitVec 32))

(assert (=> b!250790 (= e!162649 #b00000000000000000000000000000000)))

(declare-fun bm!23575 () Bool)

(assert (=> bm!23575 (= call!23578 (arrayCountValidKeys!0 lt!125440 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun d!60839 () Bool)

(declare-fun lt!125533 () (_ BitVec 32))

(assert (=> d!60839 (and (bvsge lt!125533 #b00000000000000000000000000000000) (bvsle lt!125533 (bvsub (size!6176 lt!125440) #b00000000000000000000000000000000)))))

(assert (=> d!60839 (= lt!125533 e!162649)))

(declare-fun c!42160 () Bool)

(assert (=> d!60839 (= c!42160 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60839 (and (bvsle #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6771 thiss!1504)) (size!6176 lt!125440)))))

(assert (=> d!60839 (= (arrayCountValidKeys!0 lt!125440 #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) lt!125533)))

(declare-fun b!250787 () Bool)

(assert (=> b!250787 (= e!162649 e!162648)))

(declare-fun c!42161 () Bool)

(assert (=> b!250787 (= c!42161 (validKeyInArray!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(assert (= (and d!60839 c!42160) b!250790))

(assert (= (and d!60839 (not c!42160)) b!250787))

(assert (= (and b!250787 c!42161) b!250789))

(assert (= (and b!250787 (not c!42161)) b!250788))

(assert (= (or b!250789 b!250788) bm!23575))

(declare-fun m!266637 () Bool)

(assert (=> bm!23575 m!266637))

(assert (=> b!250787 m!266617))

(assert (=> b!250787 m!266617))

(assert (=> b!250787 m!266623))

(assert (=> b!250575 d!60839))

(declare-fun d!60841 () Bool)

(declare-fun res!122791 () Bool)

(declare-fun e!162654 () Bool)

(assert (=> d!60841 (=> res!122791 e!162654)))

(assert (=> d!60841 (= res!122791 (= (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60841 (= (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 #b00000000000000000000000000000000) e!162654)))

(declare-fun b!250795 () Bool)

(declare-fun e!162655 () Bool)

(assert (=> b!250795 (= e!162654 e!162655)))

(declare-fun res!122792 () Bool)

(assert (=> b!250795 (=> (not res!122792) (not e!162655))))

(assert (=> b!250795 (= res!122792 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun b!250796 () Bool)

(assert (=> b!250796 (= e!162655 (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60841 (not res!122791)) b!250795))

(assert (= (and b!250795 res!122792) b!250796))

(assert (=> d!60841 m!266613))

(declare-fun m!266639 () Bool)

(assert (=> b!250796 m!266639))

(assert (=> b!250575 d!60841))

(declare-fun d!60843 () Bool)

(declare-fun e!162658 () Bool)

(assert (=> d!60843 e!162658))

(declare-fun res!122795 () Bool)

(assert (=> d!60843 (=> (not res!122795) (not e!162658))))

(assert (=> d!60843 (= res!122795 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6771 thiss!1504)))))))

(declare-fun lt!125536 () Unit!7735)

(declare-fun choose!102 ((_ BitVec 64) array!12299 (_ BitVec 32) (_ BitVec 32)) Unit!7735)

(assert (=> d!60843 (= lt!125536 (choose!102 key!932 (_keys!6771 thiss!1504) index!297 (mask!10823 thiss!1504)))))

(assert (=> d!60843 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60843 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) index!297 (mask!10823 thiss!1504)) lt!125536)))

(declare-fun b!250799 () Bool)

(assert (=> b!250799 (= e!162658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (mask!10823 thiss!1504)))))

(assert (= (and d!60843 res!122795) b!250799))

(declare-fun m!266641 () Bool)

(assert (=> d!60843 m!266641))

(assert (=> d!60843 m!266455))

(assert (=> b!250799 m!266463))

(declare-fun m!266643 () Bool)

(assert (=> b!250799 m!266643))

(assert (=> b!250575 d!60843))

(assert (=> bm!23547 d!60841))

(declare-fun d!60845 () Bool)

(declare-fun e!162661 () Bool)

(assert (=> d!60845 e!162661))

(declare-fun res!122800 () Bool)

(assert (=> d!60845 (=> (not res!122800) (not e!162661))))

(declare-fun lt!125542 () SeekEntryResult!1122)

(assert (=> d!60845 (= res!122800 ((_ is Found!1122) lt!125542))))

(assert (=> d!60845 (= lt!125542 (seekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(declare-fun lt!125541 () Unit!7735)

(declare-fun choose!1196 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7735)

(assert (=> d!60845 (= lt!125541 (choose!1196 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> d!60845 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60845 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!399 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) lt!125541)))

(declare-fun b!250804 () Bool)

(declare-fun res!122801 () Bool)

(assert (=> b!250804 (=> (not res!122801) (not e!162661))))

(assert (=> b!250804 (= res!122801 (inRange!0 (index!6659 lt!125542) (mask!10823 thiss!1504)))))

(declare-fun b!250805 () Bool)

(assert (=> b!250805 (= e!162661 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6659 lt!125542)) key!932))))

(assert (=> b!250805 (and (bvsge (index!6659 lt!125542) #b00000000000000000000000000000000) (bvslt (index!6659 lt!125542) (size!6176 (_keys!6771 thiss!1504))))))

(assert (= (and d!60845 res!122800) b!250804))

(assert (= (and b!250804 res!122801) b!250805))

(assert (=> d!60845 m!266477))

(declare-fun m!266645 () Bool)

(assert (=> d!60845 m!266645))

(assert (=> d!60845 m!266455))

(declare-fun m!266647 () Bool)

(assert (=> b!250804 m!266647))

(declare-fun m!266649 () Bool)

(assert (=> b!250805 m!266649))

(assert (=> b!250579 d!60845))

(declare-fun d!60847 () Bool)

(assert (=> d!60847 (= (inRange!0 (ite c!42115 (index!6658 lt!125447) (index!6661 lt!125447)) (mask!10823 thiss!1504)) (and (bvsge (ite c!42115 (index!6658 lt!125447) (index!6661 lt!125447)) #b00000000000000000000000000000000) (bvslt (ite c!42115 (index!6658 lt!125447) (index!6661 lt!125447)) (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23546 d!60847))

(declare-fun d!60849 () Bool)

(assert (=> d!60849 (= (inRange!0 index!297 (mask!10823 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250581 d!60849))

(declare-fun d!60851 () Bool)

(declare-fun e!162666 () Bool)

(assert (=> d!60851 e!162666))

(declare-fun res!122804 () Bool)

(assert (=> d!60851 (=> res!122804 e!162666)))

(declare-fun lt!125553 () Bool)

(assert (=> d!60851 (= res!122804 (not lt!125553))))

(declare-fun lt!125552 () Bool)

(assert (=> d!60851 (= lt!125553 lt!125552)))

(declare-fun lt!125551 () Unit!7735)

(declare-fun e!162667 () Unit!7735)

(assert (=> d!60851 (= lt!125551 e!162667)))

(declare-fun c!42164 () Bool)

(assert (=> d!60851 (= c!42164 lt!125552)))

(declare-fun containsKey!289 (List!3708 (_ BitVec 64)) Bool)

(assert (=> d!60851 (= lt!125552 (containsKey!289 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(assert (=> d!60851 (= (contains!1798 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932) lt!125553)))

(declare-fun b!250812 () Bool)

(declare-fun lt!125554 () Unit!7735)

(assert (=> b!250812 (= e!162667 lt!125554)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!238 (List!3708 (_ BitVec 64)) Unit!7735)

(assert (=> b!250812 (= lt!125554 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-datatypes ((Option!303 0))(
  ( (Some!302 (v!5354 V!8305)) (None!301) )
))
(declare-fun isDefined!239 (Option!303) Bool)

(declare-fun getValueByKey!297 (List!3708 (_ BitVec 64)) Option!303)

(assert (=> b!250812 (isDefined!239 (getValueByKey!297 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-fun b!250813 () Bool)

(declare-fun Unit!7747 () Unit!7735)

(assert (=> b!250813 (= e!162667 Unit!7747)))

(declare-fun b!250814 () Bool)

(assert (=> b!250814 (= e!162666 (isDefined!239 (getValueByKey!297 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932)))))

(assert (= (and d!60851 c!42164) b!250812))

(assert (= (and d!60851 (not c!42164)) b!250813))

(assert (= (and d!60851 (not res!122804)) b!250814))

(declare-fun m!266651 () Bool)

(assert (=> d!60851 m!266651))

(declare-fun m!266653 () Bool)

(assert (=> b!250812 m!266653))

(declare-fun m!266655 () Bool)

(assert (=> b!250812 m!266655))

(assert (=> b!250812 m!266655))

(declare-fun m!266657 () Bool)

(assert (=> b!250812 m!266657))

(assert (=> b!250814 m!266655))

(assert (=> b!250814 m!266655))

(assert (=> b!250814 m!266657))

(assert (=> b!250581 d!60851))

(declare-fun b!250857 () Bool)

(declare-fun e!162696 () Bool)

(declare-fun e!162702 () Bool)

(assert (=> b!250857 (= e!162696 e!162702)))

(declare-fun res!122828 () Bool)

(declare-fun call!23593 () Bool)

(assert (=> b!250857 (= res!122828 call!23593)))

(assert (=> b!250857 (=> (not res!122828) (not e!162702))))

(declare-fun b!250858 () Bool)

(declare-fun e!162697 () Bool)

(declare-fun call!23598 () Bool)

(assert (=> b!250858 (= e!162697 (not call!23598))))

(declare-fun b!250859 () Bool)

(declare-fun res!122824 () Bool)

(declare-fun e!162695 () Bool)

(assert (=> b!250859 (=> (not res!122824) (not e!162695))))

(assert (=> b!250859 (= res!122824 e!162697)))

(declare-fun c!42177 () Bool)

(assert (=> b!250859 (= c!42177 (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!250860 () Bool)

(declare-fun e!162700 () Bool)

(assert (=> b!250860 (= e!162700 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250861 () Bool)

(declare-fun e!162706 () Bool)

(declare-fun lt!125610 () ListLongMap!3711)

(declare-fun apply!241 (ListLongMap!3711 (_ BitVec 64)) V!8305)

(declare-fun get!2994 (ValueCell!2903 V!8305) V!8305)

(declare-fun dynLambda!575 (Int (_ BitVec 64)) V!8305)

(assert (=> b!250861 (= e!162706 (= (apply!241 lt!125610 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)) (get!2994 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6175 (_values!4617 thiss!1504))))))

(assert (=> b!250861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun bm!23590 () Bool)

(declare-fun call!23594 () ListLongMap!3711)

(declare-fun call!23599 () ListLongMap!3711)

(assert (=> bm!23590 (= call!23594 call!23599)))

(declare-fun b!250862 () Bool)

(declare-fun e!162699 () ListLongMap!3711)

(declare-fun e!162705 () ListLongMap!3711)

(assert (=> b!250862 (= e!162699 e!162705)))

(declare-fun c!42179 () Bool)

(assert (=> b!250862 (= c!42179 (and (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250863 () Bool)

(assert (=> b!250863 (= e!162702 (= (apply!241 lt!125610 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4475 thiss!1504)))))

(declare-fun b!250864 () Bool)

(declare-fun e!162698 () Unit!7735)

(declare-fun lt!125599 () Unit!7735)

(assert (=> b!250864 (= e!162698 lt!125599)))

(declare-fun lt!125620 () ListLongMap!3711)

(declare-fun getCurrentListMapNoExtraKeys!557 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 32) Int) ListLongMap!3711)

(assert (=> b!250864 (= lt!125620 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125604 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125616 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125616 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125612 () Unit!7735)

(declare-fun addStillContains!217 (ListLongMap!3711 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7735)

(assert (=> b!250864 (= lt!125612 (addStillContains!217 lt!125620 lt!125604 (zeroValue!4475 thiss!1504) lt!125616))))

(declare-fun +!674 (ListLongMap!3711 tuple2!4808) ListLongMap!3711)

(assert (=> b!250864 (contains!1798 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))) lt!125616)))

(declare-fun lt!125605 () Unit!7735)

(assert (=> b!250864 (= lt!125605 lt!125612)))

(declare-fun lt!125607 () ListLongMap!3711)

(assert (=> b!250864 (= lt!125607 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125602 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125606 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125606 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125601 () Unit!7735)

(declare-fun addApplyDifferent!217 (ListLongMap!3711 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7735)

(assert (=> b!250864 (= lt!125601 (addApplyDifferent!217 lt!125607 lt!125602 (minValue!4475 thiss!1504) lt!125606))))

(assert (=> b!250864 (= (apply!241 (+!674 lt!125607 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))) lt!125606) (apply!241 lt!125607 lt!125606))))

(declare-fun lt!125614 () Unit!7735)

(assert (=> b!250864 (= lt!125614 lt!125601)))

(declare-fun lt!125609 () ListLongMap!3711)

(assert (=> b!250864 (= lt!125609 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125613 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125600 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125600 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125603 () Unit!7735)

(assert (=> b!250864 (= lt!125603 (addApplyDifferent!217 lt!125609 lt!125613 (zeroValue!4475 thiss!1504) lt!125600))))

(assert (=> b!250864 (= (apply!241 (+!674 lt!125609 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))) lt!125600) (apply!241 lt!125609 lt!125600))))

(declare-fun lt!125608 () Unit!7735)

(assert (=> b!250864 (= lt!125608 lt!125603)))

(declare-fun lt!125611 () ListLongMap!3711)

(assert (=> b!250864 (= lt!125611 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125619 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125618 () (_ BitVec 64))

(assert (=> b!250864 (= lt!125618 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250864 (= lt!125599 (addApplyDifferent!217 lt!125611 lt!125619 (minValue!4475 thiss!1504) lt!125618))))

(assert (=> b!250864 (= (apply!241 (+!674 lt!125611 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))) lt!125618) (apply!241 lt!125611 lt!125618))))

(declare-fun bm!23592 () Bool)

(declare-fun call!23597 () ListLongMap!3711)

(declare-fun call!23595 () ListLongMap!3711)

(assert (=> bm!23592 (= call!23597 call!23595)))

(declare-fun bm!23593 () Bool)

(assert (=> bm!23593 (= call!23598 (contains!1798 lt!125610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!42180 () Bool)

(declare-fun bm!23594 () Bool)

(declare-fun call!23596 () ListLongMap!3711)

(assert (=> bm!23594 (= call!23599 (+!674 (ite c!42180 call!23596 (ite c!42179 call!23595 call!23597)) (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(declare-fun b!250865 () Bool)

(assert (=> b!250865 (= e!162705 call!23594)))

(declare-fun b!250866 () Bool)

(declare-fun e!162704 () Bool)

(assert (=> b!250866 (= e!162704 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250867 () Bool)

(declare-fun Unit!7748 () Unit!7735)

(assert (=> b!250867 (= e!162698 Unit!7748)))

(declare-fun b!250868 () Bool)

(declare-fun e!162703 () Bool)

(assert (=> b!250868 (= e!162697 e!162703)))

(declare-fun res!122826 () Bool)

(assert (=> b!250868 (= res!122826 call!23598)))

(assert (=> b!250868 (=> (not res!122826) (not e!162703))))

(declare-fun b!250869 () Bool)

(declare-fun c!42178 () Bool)

(assert (=> b!250869 (= c!42178 (and (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!162701 () ListLongMap!3711)

(assert (=> b!250869 (= e!162705 e!162701)))

(declare-fun bm!23595 () Bool)

(assert (=> bm!23595 (= call!23595 call!23596)))

(declare-fun b!250870 () Bool)

(assert (=> b!250870 (= e!162701 call!23597)))

(declare-fun b!250871 () Bool)

(declare-fun res!122825 () Bool)

(assert (=> b!250871 (=> (not res!122825) (not e!162695))))

(declare-fun e!162694 () Bool)

(assert (=> b!250871 (= res!122825 e!162694)))

(declare-fun res!122823 () Bool)

(assert (=> b!250871 (=> res!122823 e!162694)))

(assert (=> b!250871 (= res!122823 (not e!162700))))

(declare-fun res!122827 () Bool)

(assert (=> b!250871 (=> (not res!122827) (not e!162700))))

(assert (=> b!250871 (= res!122827 (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun bm!23596 () Bool)

(assert (=> bm!23596 (= call!23593 (contains!1798 lt!125610 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250872 () Bool)

(assert (=> b!250872 (= e!162694 e!162706)))

(declare-fun res!122830 () Bool)

(assert (=> b!250872 (=> (not res!122830) (not e!162706))))

(assert (=> b!250872 (= res!122830 (contains!1798 lt!125610 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun b!250873 () Bool)

(assert (=> b!250873 (= e!162696 (not call!23593))))

(declare-fun d!60853 () Bool)

(assert (=> d!60853 e!162695))

(declare-fun res!122831 () Bool)

(assert (=> d!60853 (=> (not res!122831) (not e!162695))))

(assert (=> d!60853 (= res!122831 (or (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))))

(declare-fun lt!125615 () ListLongMap!3711)

(assert (=> d!60853 (= lt!125610 lt!125615)))

(declare-fun lt!125617 () Unit!7735)

(assert (=> d!60853 (= lt!125617 e!162698)))

(declare-fun c!42181 () Bool)

(assert (=> d!60853 (= c!42181 e!162704)))

(declare-fun res!122829 () Bool)

(assert (=> d!60853 (=> (not res!122829) (not e!162704))))

(assert (=> d!60853 (= res!122829 (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60853 (= lt!125615 e!162699)))

(assert (=> d!60853 (= c!42180 (and (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60853 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60853 (= (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) lt!125610)))

(declare-fun bm!23591 () Bool)

(assert (=> bm!23591 (= call!23596 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun b!250874 () Bool)

(assert (=> b!250874 (= e!162701 call!23594)))

(declare-fun b!250875 () Bool)

(assert (=> b!250875 (= e!162695 e!162696)))

(declare-fun c!42182 () Bool)

(assert (=> b!250875 (= c!42182 (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250876 () Bool)

(assert (=> b!250876 (= e!162699 (+!674 call!23599 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))

(declare-fun b!250877 () Bool)

(assert (=> b!250877 (= e!162703 (= (apply!241 lt!125610 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4475 thiss!1504)))))

(assert (= (and d!60853 c!42180) b!250876))

(assert (= (and d!60853 (not c!42180)) b!250862))

(assert (= (and b!250862 c!42179) b!250865))

(assert (= (and b!250862 (not c!42179)) b!250869))

(assert (= (and b!250869 c!42178) b!250874))

(assert (= (and b!250869 (not c!42178)) b!250870))

(assert (= (or b!250874 b!250870) bm!23592))

(assert (= (or b!250865 bm!23592) bm!23595))

(assert (= (or b!250865 b!250874) bm!23590))

(assert (= (or b!250876 bm!23595) bm!23591))

(assert (= (or b!250876 bm!23590) bm!23594))

(assert (= (and d!60853 res!122829) b!250866))

(assert (= (and d!60853 c!42181) b!250864))

(assert (= (and d!60853 (not c!42181)) b!250867))

(assert (= (and d!60853 res!122831) b!250871))

(assert (= (and b!250871 res!122827) b!250860))

(assert (= (and b!250871 (not res!122823)) b!250872))

(assert (= (and b!250872 res!122830) b!250861))

(assert (= (and b!250871 res!122825) b!250859))

(assert (= (and b!250859 c!42177) b!250868))

(assert (= (and b!250859 (not c!42177)) b!250858))

(assert (= (and b!250868 res!122826) b!250877))

(assert (= (or b!250868 b!250858) bm!23593))

(assert (= (and b!250859 res!122824) b!250875))

(assert (= (and b!250875 c!42182) b!250857))

(assert (= (and b!250875 (not c!42182)) b!250873))

(assert (= (and b!250857 res!122828) b!250863))

(assert (= (or b!250857 b!250873) bm!23596))

(declare-fun b_lambda!8073 () Bool)

(assert (=> (not b_lambda!8073) (not b!250861)))

(declare-fun t!8740 () Bool)

(declare-fun tb!2987 () Bool)

(assert (=> (and b!250577 (= (defaultEntry!4634 thiss!1504) (defaultEntry!4634 thiss!1504)) t!8740) tb!2987))

(declare-fun result!5299 () Bool)

(assert (=> tb!2987 (= result!5299 tp_is_empty!6493)))

(assert (=> b!250861 t!8740))

(declare-fun b_and!13633 () Bool)

(assert (= b_and!13627 (and (=> t!8740 result!5299) b_and!13633)))

(declare-fun m!266659 () Bool)

(assert (=> bm!23594 m!266659))

(declare-fun m!266661 () Bool)

(assert (=> b!250864 m!266661))

(declare-fun m!266663 () Bool)

(assert (=> b!250864 m!266663))

(assert (=> b!250864 m!266661))

(declare-fun m!266665 () Bool)

(assert (=> b!250864 m!266665))

(declare-fun m!266667 () Bool)

(assert (=> b!250864 m!266667))

(declare-fun m!266669 () Bool)

(assert (=> b!250864 m!266669))

(declare-fun m!266671 () Bool)

(assert (=> b!250864 m!266671))

(declare-fun m!266673 () Bool)

(assert (=> b!250864 m!266673))

(declare-fun m!266675 () Bool)

(assert (=> b!250864 m!266675))

(declare-fun m!266677 () Bool)

(assert (=> b!250864 m!266677))

(declare-fun m!266679 () Bool)

(assert (=> b!250864 m!266679))

(assert (=> b!250864 m!266673))

(declare-fun m!266681 () Bool)

(assert (=> b!250864 m!266681))

(assert (=> b!250864 m!266669))

(declare-fun m!266683 () Bool)

(assert (=> b!250864 m!266683))

(declare-fun m!266685 () Bool)

(assert (=> b!250864 m!266685))

(declare-fun m!266687 () Bool)

(assert (=> b!250864 m!266687))

(declare-fun m!266689 () Bool)

(assert (=> b!250864 m!266689))

(assert (=> b!250864 m!266687))

(declare-fun m!266691 () Bool)

(assert (=> b!250864 m!266691))

(assert (=> b!250864 m!266613))

(declare-fun m!266693 () Bool)

(assert (=> bm!23593 m!266693))

(declare-fun m!266695 () Bool)

(assert (=> b!250877 m!266695))

(assert (=> b!250866 m!266613))

(assert (=> b!250866 m!266613))

(assert (=> b!250866 m!266615))

(declare-fun m!266697 () Bool)

(assert (=> b!250861 m!266697))

(assert (=> b!250861 m!266697))

(declare-fun m!266699 () Bool)

(assert (=> b!250861 m!266699))

(declare-fun m!266701 () Bool)

(assert (=> b!250861 m!266701))

(assert (=> b!250861 m!266613))

(assert (=> b!250861 m!266699))

(assert (=> b!250861 m!266613))

(declare-fun m!266703 () Bool)

(assert (=> b!250861 m!266703))

(declare-fun m!266705 () Bool)

(assert (=> b!250876 m!266705))

(assert (=> b!250860 m!266613))

(assert (=> b!250860 m!266613))

(assert (=> b!250860 m!266615))

(declare-fun m!266707 () Bool)

(assert (=> bm!23596 m!266707))

(assert (=> d!60853 m!266455))

(declare-fun m!266709 () Bool)

(assert (=> b!250863 m!266709))

(assert (=> bm!23591 m!266671))

(assert (=> b!250872 m!266613))

(assert (=> b!250872 m!266613))

(declare-fun m!266711 () Bool)

(assert (=> b!250872 m!266711))

(assert (=> b!250581 d!60853))

(declare-fun b!250892 () Bool)

(declare-fun e!162715 () SeekEntryResult!1122)

(declare-fun e!162714 () SeekEntryResult!1122)

(assert (=> b!250892 (= e!162715 e!162714)))

(declare-fun lt!125627 () (_ BitVec 64))

(declare-fun lt!125629 () SeekEntryResult!1122)

(assert (=> b!250892 (= lt!125627 (select (arr!5830 (_keys!6771 thiss!1504)) (index!6660 lt!125629)))))

(declare-fun c!42189 () Bool)

(assert (=> b!250892 (= c!42189 (= lt!125627 key!932))))

(declare-fun b!250893 () Bool)

(assert (=> b!250893 (= e!162715 Undefined!1122)))

(declare-fun b!250894 () Bool)

(declare-fun e!162713 () SeekEntryResult!1122)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12299 (_ BitVec 32)) SeekEntryResult!1122)

(assert (=> b!250894 (= e!162713 (seekKeyOrZeroReturnVacant!0 (x!24689 lt!125629) (index!6660 lt!125629) (index!6660 lt!125629) key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(declare-fun b!250895 () Bool)

(declare-fun c!42190 () Bool)

(assert (=> b!250895 (= c!42190 (= lt!125627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250895 (= e!162714 e!162713)))

(declare-fun d!60855 () Bool)

(declare-fun lt!125628 () SeekEntryResult!1122)

(assert (=> d!60855 (and (or ((_ is Undefined!1122) lt!125628) (not ((_ is Found!1122) lt!125628)) (and (bvsge (index!6659 lt!125628) #b00000000000000000000000000000000) (bvslt (index!6659 lt!125628) (size!6176 (_keys!6771 thiss!1504))))) (or ((_ is Undefined!1122) lt!125628) ((_ is Found!1122) lt!125628) (not ((_ is MissingZero!1122) lt!125628)) (and (bvsge (index!6658 lt!125628) #b00000000000000000000000000000000) (bvslt (index!6658 lt!125628) (size!6176 (_keys!6771 thiss!1504))))) (or ((_ is Undefined!1122) lt!125628) ((_ is Found!1122) lt!125628) ((_ is MissingZero!1122) lt!125628) (not ((_ is MissingVacant!1122) lt!125628)) (and (bvsge (index!6661 lt!125628) #b00000000000000000000000000000000) (bvslt (index!6661 lt!125628) (size!6176 (_keys!6771 thiss!1504))))) (or ((_ is Undefined!1122) lt!125628) (ite ((_ is Found!1122) lt!125628) (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6659 lt!125628)) key!932) (ite ((_ is MissingZero!1122) lt!125628) (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6658 lt!125628)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1122) lt!125628) (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6661 lt!125628)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60855 (= lt!125628 e!162715)))

(declare-fun c!42191 () Bool)

(assert (=> d!60855 (= c!42191 (and ((_ is Intermediate!1122) lt!125629) (undefined!1934 lt!125629)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12299 (_ BitVec 32)) SeekEntryResult!1122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60855 (= lt!125629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10823 thiss!1504)) key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(assert (=> d!60855 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60855 (= (seekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)) lt!125628)))

(declare-fun b!250896 () Bool)

(assert (=> b!250896 (= e!162714 (Found!1122 (index!6660 lt!125629)))))

(declare-fun b!250897 () Bool)

(assert (=> b!250897 (= e!162713 (MissingZero!1122 (index!6660 lt!125629)))))

(assert (= (and d!60855 c!42191) b!250893))

(assert (= (and d!60855 (not c!42191)) b!250892))

(assert (= (and b!250892 c!42189) b!250896))

(assert (= (and b!250892 (not c!42189)) b!250895))

(assert (= (and b!250895 c!42190) b!250897))

(assert (= (and b!250895 (not c!42190)) b!250894))

(declare-fun m!266713 () Bool)

(assert (=> b!250892 m!266713))

(declare-fun m!266715 () Bool)

(assert (=> b!250894 m!266715))

(assert (=> d!60855 m!266455))

(declare-fun m!266717 () Bool)

(assert (=> d!60855 m!266717))

(declare-fun m!266719 () Bool)

(assert (=> d!60855 m!266719))

(declare-fun m!266721 () Bool)

(assert (=> d!60855 m!266721))

(assert (=> d!60855 m!266721))

(declare-fun m!266723 () Bool)

(assert (=> d!60855 m!266723))

(declare-fun m!266725 () Bool)

(assert (=> d!60855 m!266725))

(assert (=> b!250568 d!60855))

(declare-fun d!60857 () Bool)

(assert (=> d!60857 (= (array_inv!3841 (_keys!6771 thiss!1504)) (bvsge (size!6176 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250577 d!60857))

(declare-fun d!60859 () Bool)

(assert (=> d!60859 (= (array_inv!3842 (_values!4617 thiss!1504)) (bvsge (size!6175 (_values!4617 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250577 d!60859))

(declare-fun d!60861 () Bool)

(assert (=> d!60861 (contains!1798 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932)))

(declare-fun lt!125632 () Unit!7735)

(declare-fun choose!1197 (array!12299 array!12297 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) (_ BitVec 32) Int) Unit!7735)

(assert (=> d!60861 (= lt!125632 (choose!1197 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(assert (=> d!60861 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60861 (= (lemmaArrayContainsKeyThenInListMap!208 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) lt!125632)))

(declare-fun bs!8962 () Bool)

(assert (= bs!8962 d!60861))

(assert (=> bs!8962 m!266491))

(assert (=> bs!8962 m!266491))

(assert (=> bs!8962 m!266493))

(declare-fun m!266727 () Bool)

(assert (=> bs!8962 m!266727))

(assert (=> bs!8962 m!266455))

(assert (=> b!250563 d!60861))

(declare-fun d!60863 () Bool)

(declare-fun res!122838 () Bool)

(declare-fun e!162718 () Bool)

(assert (=> d!60863 (=> (not res!122838) (not e!162718))))

(declare-fun simpleValid!264 (LongMapFixedSize!3706) Bool)

(assert (=> d!60863 (= res!122838 (simpleValid!264 thiss!1504))))

(assert (=> d!60863 (= (valid!1453 thiss!1504) e!162718)))

(declare-fun b!250904 () Bool)

(declare-fun res!122839 () Bool)

(assert (=> b!250904 (=> (not res!122839) (not e!162718))))

(assert (=> b!250904 (= res!122839 (= (arrayCountValidKeys!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (_size!1902 thiss!1504)))))

(declare-fun b!250905 () Bool)

(declare-fun res!122840 () Bool)

(assert (=> b!250905 (=> (not res!122840) (not e!162718))))

(assert (=> b!250905 (= res!122840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(declare-fun b!250906 () Bool)

(assert (=> b!250906 (= e!162718 (arrayNoDuplicates!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 Nil!3704))))

(assert (= (and d!60863 res!122838) b!250904))

(assert (= (and b!250904 res!122839) b!250905))

(assert (= (and b!250905 res!122840) b!250906))

(declare-fun m!266729 () Bool)

(assert (=> d!60863 m!266729))

(assert (=> b!250904 m!266465))

(declare-fun m!266731 () Bool)

(assert (=> b!250905 m!266731))

(declare-fun m!266733 () Bool)

(assert (=> b!250906 m!266733))

(assert (=> start!23924 d!60863))

(declare-fun b!250914 () Bool)

(declare-fun e!162723 () Bool)

(assert (=> b!250914 (= e!162723 tp_is_empty!6493)))

(declare-fun condMapEmpty!11044 () Bool)

(declare-fun mapDefault!11044 () ValueCell!2903)

(assert (=> mapNonEmpty!11035 (= condMapEmpty!11044 (= mapRest!11035 ((as const (Array (_ BitVec 32) ValueCell!2903)) mapDefault!11044)))))

(declare-fun mapRes!11044 () Bool)

(assert (=> mapNonEmpty!11035 (= tp!23160 (and e!162723 mapRes!11044))))

(declare-fun mapNonEmpty!11044 () Bool)

(declare-fun tp!23176 () Bool)

(declare-fun e!162724 () Bool)

(assert (=> mapNonEmpty!11044 (= mapRes!11044 (and tp!23176 e!162724))))

(declare-fun mapKey!11044 () (_ BitVec 32))

(declare-fun mapRest!11044 () (Array (_ BitVec 32) ValueCell!2903))

(declare-fun mapValue!11044 () ValueCell!2903)

(assert (=> mapNonEmpty!11044 (= mapRest!11035 (store mapRest!11044 mapKey!11044 mapValue!11044))))

(declare-fun b!250913 () Bool)

(assert (=> b!250913 (= e!162724 tp_is_empty!6493)))

(declare-fun mapIsEmpty!11044 () Bool)

(assert (=> mapIsEmpty!11044 mapRes!11044))

(assert (= (and mapNonEmpty!11035 condMapEmpty!11044) mapIsEmpty!11044))

(assert (= (and mapNonEmpty!11035 (not condMapEmpty!11044)) mapNonEmpty!11044))

(assert (= (and mapNonEmpty!11044 ((_ is ValueCellFull!2903) mapValue!11044)) b!250913))

(assert (= (and mapNonEmpty!11035 ((_ is ValueCellFull!2903) mapDefault!11044)) b!250914))

(declare-fun m!266735 () Bool)

(assert (=> mapNonEmpty!11044 m!266735))

(declare-fun b_lambda!8075 () Bool)

(assert (= b_lambda!8073 (or (and b!250577 b_free!6631) b_lambda!8075)))

(check-sat (not d!60827) (not b!250804) (not d!60843) (not b!250872) (not d!60825) (not b!250742) (not b!250787) (not b!250861) (not b!250741) (not b!250768) (not mapNonEmpty!11044) (not b_next!6631) (not d!60851) (not d!60861) (not d!60863) (not b!250877) (not b_lambda!8075) (not b!250786) (not b!250796) (not b!250864) (not b!250781) (not bm!23596) (not b!250894) (not b!250905) (not d!60853) (not d!60855) (not b!250904) (not bm!23571) (not bm!23574) (not b!250863) (not bm!23564) (not d!60845) (not b!250767) (not b!250876) (not b!250753) (not bm!23594) tp_is_empty!6493 (not d!60837) (not b!250866) (not b!250814) (not bm!23591) (not b!250799) (not b!250744) b_and!13633 (not b!250769) (not bm!23575) (not b!250860) (not b!250812) (not bm!23568) (not bm!23593) (not b!250782) (not b!250906) (not bm!23565))
(check-sat b_and!13633 (not b_next!6631))
(get-model)

(declare-fun bm!23597 () Bool)

(declare-fun call!23600 () Bool)

(assert (=> bm!23597 (= call!23600 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125440 (mask!10823 thiss!1504)))))

(declare-fun b!250915 () Bool)

(declare-fun e!162725 () Bool)

(assert (=> b!250915 (= e!162725 call!23600)))

(declare-fun d!60865 () Bool)

(declare-fun res!122841 () Bool)

(declare-fun e!162726 () Bool)

(assert (=> d!60865 (=> res!122841 e!162726)))

(assert (=> d!60865 (= res!122841 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 lt!125440)))))

(assert (=> d!60865 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125440 (mask!10823 thiss!1504)) e!162726)))

(declare-fun b!250916 () Bool)

(declare-fun e!162727 () Bool)

(assert (=> b!250916 (= e!162726 e!162727)))

(declare-fun c!42192 () Bool)

(assert (=> b!250916 (= c!42192 (validKeyInArray!0 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250917 () Bool)

(assert (=> b!250917 (= e!162727 e!162725)))

(declare-fun lt!125635 () (_ BitVec 64))

(assert (=> b!250917 (= lt!125635 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125634 () Unit!7735)

(assert (=> b!250917 (= lt!125634 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125440 lt!125635 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!250917 (arrayContainsKey!0 lt!125440 lt!125635 #b00000000000000000000000000000000)))

(declare-fun lt!125633 () Unit!7735)

(assert (=> b!250917 (= lt!125633 lt!125634)))

(declare-fun res!122842 () Bool)

(assert (=> b!250917 (= res!122842 (= (seekEntryOrOpen!0 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125440 (mask!10823 thiss!1504)) (Found!1122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!250917 (=> (not res!122842) (not e!162725))))

(declare-fun b!250918 () Bool)

(assert (=> b!250918 (= e!162727 call!23600)))

(assert (= (and d!60865 (not res!122841)) b!250916))

(assert (= (and b!250916 c!42192) b!250917))

(assert (= (and b!250916 (not c!42192)) b!250918))

(assert (= (and b!250917 res!122842) b!250915))

(assert (= (or b!250915 b!250918) bm!23597))

(declare-fun m!266737 () Bool)

(assert (=> bm!23597 m!266737))

(declare-fun m!266739 () Bool)

(assert (=> b!250916 m!266739))

(assert (=> b!250916 m!266739))

(declare-fun m!266741 () Bool)

(assert (=> b!250916 m!266741))

(assert (=> b!250917 m!266739))

(declare-fun m!266743 () Bool)

(assert (=> b!250917 m!266743))

(declare-fun m!266745 () Bool)

(assert (=> b!250917 m!266745))

(assert (=> b!250917 m!266739))

(declare-fun m!266747 () Bool)

(assert (=> b!250917 m!266747))

(assert (=> bm!23574 d!60865))

(declare-fun d!60867 () Bool)

(assert (=> d!60867 (= (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) index!297)) (and (not (= (select (arr!5830 (_keys!6771 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5830 (_keys!6771 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250741 d!60867))

(assert (=> d!60845 d!60855))

(declare-fun d!60869 () Bool)

(declare-fun e!162730 () Bool)

(assert (=> d!60869 e!162730))

(declare-fun res!122847 () Bool)

(assert (=> d!60869 (=> (not res!122847) (not e!162730))))

(declare-fun lt!125638 () SeekEntryResult!1122)

(assert (=> d!60869 (= res!122847 ((_ is Found!1122) lt!125638))))

(assert (=> d!60869 (= lt!125638 (seekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(assert (=> d!60869 true))

(declare-fun _$33!168 () Unit!7735)

(assert (=> d!60869 (= (choose!1196 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) _$33!168)))

(declare-fun b!250923 () Bool)

(declare-fun res!122848 () Bool)

(assert (=> b!250923 (=> (not res!122848) (not e!162730))))

(assert (=> b!250923 (= res!122848 (inRange!0 (index!6659 lt!125638) (mask!10823 thiss!1504)))))

(declare-fun b!250924 () Bool)

(assert (=> b!250924 (= e!162730 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6659 lt!125638)) key!932))))

(assert (= (and d!60869 res!122847) b!250923))

(assert (= (and b!250923 res!122848) b!250924))

(assert (=> d!60869 m!266477))

(declare-fun m!266749 () Bool)

(assert (=> b!250923 m!266749))

(declare-fun m!266751 () Bool)

(assert (=> b!250924 m!266751))

(assert (=> d!60845 d!60869))

(assert (=> d!60845 d!60831))

(declare-fun d!60871 () Bool)

(assert (=> d!60871 (= (validKeyInArray!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)) (and (not (= (select (arr!5830 lt!125440) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5830 lt!125440) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250781 d!60871))

(declare-fun d!60873 () Bool)

(declare-fun e!162733 () Bool)

(assert (=> d!60873 e!162733))

(declare-fun res!122854 () Bool)

(assert (=> d!60873 (=> (not res!122854) (not e!162733))))

(declare-fun lt!125650 () ListLongMap!3711)

(assert (=> d!60873 (= res!122854 (contains!1798 lt!125650 (_1!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(declare-fun lt!125648 () List!3708)

(assert (=> d!60873 (= lt!125650 (ListLongMap!3712 lt!125648))))

(declare-fun lt!125649 () Unit!7735)

(declare-fun lt!125647 () Unit!7735)

(assert (=> d!60873 (= lt!125649 lt!125647)))

(assert (=> d!60873 (= (getValueByKey!297 lt!125648 (_1!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))) (Some!302 (_2!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!160 (List!3708 (_ BitVec 64) V!8305) Unit!7735)

(assert (=> d!60873 (= lt!125647 (lemmaContainsTupThenGetReturnValue!160 lt!125648 (_1!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (_2!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(declare-fun insertStrictlySorted!163 (List!3708 (_ BitVec 64) V!8305) List!3708)

(assert (=> d!60873 (= lt!125648 (insertStrictlySorted!163 (toList!1871 (ite c!42180 call!23596 (ite c!42179 call!23595 call!23597))) (_1!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (_2!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(assert (=> d!60873 (= (+!674 (ite c!42180 call!23596 (ite c!42179 call!23595 call!23597)) (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) lt!125650)))

(declare-fun b!250929 () Bool)

(declare-fun res!122853 () Bool)

(assert (=> b!250929 (=> (not res!122853) (not e!162733))))

(assert (=> b!250929 (= res!122853 (= (getValueByKey!297 (toList!1871 lt!125650) (_1!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))) (Some!302 (_2!2415 (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))))

(declare-fun b!250930 () Bool)

(declare-fun contains!1802 (List!3708 tuple2!4808) Bool)

(assert (=> b!250930 (= e!162733 (contains!1802 (toList!1871 lt!125650) (ite (or c!42180 c!42179) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (= (and d!60873 res!122854) b!250929))

(assert (= (and b!250929 res!122853) b!250930))

(declare-fun m!266753 () Bool)

(assert (=> d!60873 m!266753))

(declare-fun m!266755 () Bool)

(assert (=> d!60873 m!266755))

(declare-fun m!266757 () Bool)

(assert (=> d!60873 m!266757))

(declare-fun m!266759 () Bool)

(assert (=> d!60873 m!266759))

(declare-fun m!266761 () Bool)

(assert (=> b!250929 m!266761))

(declare-fun m!266763 () Bool)

(assert (=> b!250930 m!266763))

(assert (=> bm!23594 d!60873))

(declare-fun b!250942 () Bool)

(declare-fun e!162736 () Bool)

(assert (=> b!250942 (= e!162736 (and (bvsge (extraKeys!4371 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4371 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1902 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250939 () Bool)

(declare-fun res!122864 () Bool)

(assert (=> b!250939 (=> (not res!122864) (not e!162736))))

(assert (=> b!250939 (= res!122864 (and (= (size!6175 (_values!4617 thiss!1504)) (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001)) (= (size!6176 (_keys!6771 thiss!1504)) (size!6175 (_values!4617 thiss!1504))) (bvsge (_size!1902 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1902 thiss!1504) (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!250940 () Bool)

(declare-fun res!122866 () Bool)

(assert (=> b!250940 (=> (not res!122866) (not e!162736))))

(declare-fun size!6181 (LongMapFixedSize!3706) (_ BitVec 32))

(assert (=> b!250940 (= res!122866 (bvsge (size!6181 thiss!1504) (_size!1902 thiss!1504)))))

(declare-fun d!60875 () Bool)

(declare-fun res!122863 () Bool)

(assert (=> d!60875 (=> (not res!122863) (not e!162736))))

(assert (=> d!60875 (= res!122863 (validMask!0 (mask!10823 thiss!1504)))))

(assert (=> d!60875 (= (simpleValid!264 thiss!1504) e!162736)))

(declare-fun b!250941 () Bool)

(declare-fun res!122865 () Bool)

(assert (=> b!250941 (=> (not res!122865) (not e!162736))))

(assert (=> b!250941 (= res!122865 (= (size!6181 thiss!1504) (bvadd (_size!1902 thiss!1504) (bvsdiv (bvadd (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!60875 res!122863) b!250939))

(assert (= (and b!250939 res!122864) b!250940))

(assert (= (and b!250940 res!122866) b!250941))

(assert (= (and b!250941 res!122865) b!250942))

(declare-fun m!266765 () Bool)

(assert (=> b!250940 m!266765))

(assert (=> d!60875 m!266455))

(assert (=> b!250941 m!266765))

(assert (=> d!60863 d!60875))

(declare-fun d!60877 () Bool)

(declare-fun get!2995 (Option!303) V!8305)

(assert (=> d!60877 (= (apply!241 lt!125610 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2995 (getValueByKey!297 (toList!1871 lt!125610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8963 () Bool)

(assert (= bs!8963 d!60877))

(declare-fun m!266767 () Bool)

(assert (=> bs!8963 m!266767))

(assert (=> bs!8963 m!266767))

(declare-fun m!266769 () Bool)

(assert (=> bs!8963 m!266769))

(assert (=> b!250877 d!60877))

(declare-fun bm!23598 () Bool)

(declare-fun call!23601 () Bool)

(assert (=> bm!23598 (= call!23601 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (mask!10823 thiss!1504)))))

(declare-fun b!250943 () Bool)

(declare-fun e!162737 () Bool)

(assert (=> b!250943 (= e!162737 call!23601)))

(declare-fun d!60879 () Bool)

(declare-fun res!122867 () Bool)

(declare-fun e!162738 () Bool)

(assert (=> d!60879 (=> res!122867 e!162738)))

(assert (=> d!60879 (= res!122867 (bvsge #b00000000000000000000000000000000 (size!6176 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))))))))

(assert (=> d!60879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (mask!10823 thiss!1504)) e!162738)))

(declare-fun b!250944 () Bool)

(declare-fun e!162739 () Bool)

(assert (=> b!250944 (= e!162738 e!162739)))

(declare-fun c!42193 () Bool)

(assert (=> b!250944 (= c!42193 (validKeyInArray!0 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!250945 () Bool)

(assert (=> b!250945 (= e!162739 e!162737)))

(declare-fun lt!125653 () (_ BitVec 64))

(assert (=> b!250945 (= lt!125653 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125652 () Unit!7735)

(assert (=> b!250945 (= lt!125652 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) lt!125653 #b00000000000000000000000000000000))))

(assert (=> b!250945 (arrayContainsKey!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) lt!125653 #b00000000000000000000000000000000)))

(declare-fun lt!125651 () Unit!7735)

(assert (=> b!250945 (= lt!125651 lt!125652)))

(declare-fun res!122868 () Bool)

(assert (=> b!250945 (= res!122868 (= (seekEntryOrOpen!0 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000) (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (mask!10823 thiss!1504)) (Found!1122 #b00000000000000000000000000000000)))))

(assert (=> b!250945 (=> (not res!122868) (not e!162737))))

(declare-fun b!250946 () Bool)

(assert (=> b!250946 (= e!162739 call!23601)))

(assert (= (and d!60879 (not res!122867)) b!250944))

(assert (= (and b!250944 c!42193) b!250945))

(assert (= (and b!250944 (not c!42193)) b!250946))

(assert (= (and b!250945 res!122868) b!250943))

(assert (= (or b!250943 b!250946) bm!23598))

(declare-fun m!266771 () Bool)

(assert (=> bm!23598 m!266771))

(declare-fun m!266773 () Bool)

(assert (=> b!250944 m!266773))

(assert (=> b!250944 m!266773))

(declare-fun m!266775 () Bool)

(assert (=> b!250944 m!266775))

(assert (=> b!250945 m!266773))

(declare-fun m!266777 () Bool)

(assert (=> b!250945 m!266777))

(declare-fun m!266779 () Bool)

(assert (=> b!250945 m!266779))

(assert (=> b!250945 m!266773))

(declare-fun m!266781 () Bool)

(assert (=> b!250945 m!266781))

(assert (=> b!250799 d!60879))

(declare-fun d!60881 () Bool)

(assert (=> d!60881 (= (apply!241 lt!125610 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)) (get!2995 (getValueByKey!297 (toList!1871 lt!125610) (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8964 () Bool)

(assert (= bs!8964 d!60881))

(assert (=> bs!8964 m!266613))

(declare-fun m!266783 () Bool)

(assert (=> bs!8964 m!266783))

(assert (=> bs!8964 m!266783))

(declare-fun m!266785 () Bool)

(assert (=> bs!8964 m!266785))

(assert (=> b!250861 d!60881))

(declare-fun d!60883 () Bool)

(declare-fun c!42196 () Bool)

(assert (=> d!60883 (= c!42196 ((_ is ValueCellFull!2903) (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162742 () V!8305)

(assert (=> d!60883 (= (get!2994 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!162742)))

(declare-fun b!250951 () Bool)

(declare-fun get!2996 (ValueCell!2903 V!8305) V!8305)

(assert (=> b!250951 (= e!162742 (get!2996 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!250952 () Bool)

(declare-fun get!2997 (ValueCell!2903 V!8305) V!8305)

(assert (=> b!250952 (= e!162742 (get!2997 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60883 c!42196) b!250951))

(assert (= (and d!60883 (not c!42196)) b!250952))

(assert (=> b!250951 m!266697))

(assert (=> b!250951 m!266699))

(declare-fun m!266787 () Bool)

(assert (=> b!250951 m!266787))

(assert (=> b!250952 m!266697))

(assert (=> b!250952 m!266699))

(declare-fun m!266789 () Bool)

(assert (=> b!250952 m!266789))

(assert (=> b!250861 d!60883))

(assert (=> d!60861 d!60851))

(assert (=> d!60861 d!60853))

(declare-fun d!60885 () Bool)

(assert (=> d!60885 (contains!1798 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932)))

(assert (=> d!60885 true))

(declare-fun _$17!77 () Unit!7735)

(assert (=> d!60885 (= (choose!1197 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) _$17!77)))

(declare-fun bs!8965 () Bool)

(assert (= bs!8965 d!60885))

(assert (=> bs!8965 m!266491))

(assert (=> bs!8965 m!266491))

(assert (=> bs!8965 m!266493))

(assert (=> d!60861 d!60885))

(assert (=> d!60861 d!60831))

(declare-fun d!60887 () Bool)

(assert (=> d!60887 (= (apply!241 (+!674 lt!125609 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))) lt!125600) (get!2995 (getValueByKey!297 (toList!1871 (+!674 lt!125609 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))) lt!125600)))))

(declare-fun bs!8966 () Bool)

(assert (= bs!8966 d!60887))

(declare-fun m!266791 () Bool)

(assert (=> bs!8966 m!266791))

(assert (=> bs!8966 m!266791))

(declare-fun m!266793 () Bool)

(assert (=> bs!8966 m!266793))

(assert (=> b!250864 d!60887))

(declare-fun b!250977 () Bool)

(declare-fun lt!125674 () Unit!7735)

(declare-fun lt!125669 () Unit!7735)

(assert (=> b!250977 (= lt!125674 lt!125669)))

(declare-fun lt!125671 () ListLongMap!3711)

(declare-fun lt!125672 () (_ BitVec 64))

(declare-fun lt!125668 () V!8305)

(declare-fun lt!125673 () (_ BitVec 64))

(assert (=> b!250977 (not (contains!1798 (+!674 lt!125671 (tuple2!4809 lt!125672 lt!125668)) lt!125673))))

(declare-fun addStillNotContains!124 (ListLongMap!3711 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7735)

(assert (=> b!250977 (= lt!125669 (addStillNotContains!124 lt!125671 lt!125672 lt!125668 lt!125673))))

(assert (=> b!250977 (= lt!125673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!250977 (= lt!125668 (get!2994 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250977 (= lt!125672 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!23604 () ListLongMap!3711)

(assert (=> b!250977 (= lt!125671 call!23604)))

(declare-fun e!162761 () ListLongMap!3711)

(assert (=> b!250977 (= e!162761 (+!674 call!23604 (tuple2!4809 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000) (get!2994 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!250979 () Bool)

(assert (=> b!250979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> b!250979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6175 (_values!4617 thiss!1504))))))

(declare-fun e!162757 () Bool)

(declare-fun lt!125670 () ListLongMap!3711)

(assert (=> b!250979 (= e!162757 (= (apply!241 lt!125670 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)) (get!2994 (select (arr!5829 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250980 () Bool)

(declare-fun e!162763 () ListLongMap!3711)

(assert (=> b!250980 (= e!162763 e!162761)))

(declare-fun c!42206 () Bool)

(assert (=> b!250980 (= c!42206 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250981 () Bool)

(assert (=> b!250981 (= e!162763 (ListLongMap!3712 Nil!3705))))

(declare-fun b!250982 () Bool)

(declare-fun e!162760 () Bool)

(declare-fun isEmpty!532 (ListLongMap!3711) Bool)

(assert (=> b!250982 (= e!162760 (isEmpty!532 lt!125670))))

(declare-fun b!250983 () Bool)

(declare-fun e!162758 () Bool)

(assert (=> b!250983 (= e!162758 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250983 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!250984 () Bool)

(declare-fun e!162762 () Bool)

(declare-fun e!162759 () Bool)

(assert (=> b!250984 (= e!162762 e!162759)))

(declare-fun c!42207 () Bool)

(assert (=> b!250984 (= c!42207 e!162758)))

(declare-fun res!122877 () Bool)

(assert (=> b!250984 (=> (not res!122877) (not e!162758))))

(assert (=> b!250984 (= res!122877 (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun bm!23601 () Bool)

(assert (=> bm!23601 (= call!23604 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4634 thiss!1504)))))

(declare-fun b!250985 () Bool)

(declare-fun res!122879 () Bool)

(assert (=> b!250985 (=> (not res!122879) (not e!162762))))

(assert (=> b!250985 (= res!122879 (not (contains!1798 lt!125670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!250986 () Bool)

(assert (=> b!250986 (= e!162760 (= lt!125670 (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4634 thiss!1504))))))

(declare-fun b!250978 () Bool)

(assert (=> b!250978 (= e!162759 e!162760)))

(declare-fun c!42205 () Bool)

(assert (=> b!250978 (= c!42205 (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun d!60889 () Bool)

(assert (=> d!60889 e!162762))

(declare-fun res!122880 () Bool)

(assert (=> d!60889 (=> (not res!122880) (not e!162762))))

(assert (=> d!60889 (= res!122880 (not (contains!1798 lt!125670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60889 (= lt!125670 e!162763)))

(declare-fun c!42208 () Bool)

(assert (=> d!60889 (= c!42208 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60889 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60889 (= (getCurrentListMapNoExtraKeys!557 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) lt!125670)))

(declare-fun b!250987 () Bool)

(assert (=> b!250987 (= e!162759 e!162757)))

(assert (=> b!250987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun res!122878 () Bool)

(assert (=> b!250987 (= res!122878 (contains!1798 lt!125670 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250987 (=> (not res!122878) (not e!162757))))

(declare-fun b!250988 () Bool)

(assert (=> b!250988 (= e!162761 call!23604)))

(assert (= (and d!60889 c!42208) b!250981))

(assert (= (and d!60889 (not c!42208)) b!250980))

(assert (= (and b!250980 c!42206) b!250977))

(assert (= (and b!250980 (not c!42206)) b!250988))

(assert (= (or b!250977 b!250988) bm!23601))

(assert (= (and d!60889 res!122880) b!250985))

(assert (= (and b!250985 res!122879) b!250984))

(assert (= (and b!250984 res!122877) b!250983))

(assert (= (and b!250984 c!42207) b!250987))

(assert (= (and b!250984 (not c!42207)) b!250978))

(assert (= (and b!250987 res!122878) b!250979))

(assert (= (and b!250978 c!42205) b!250986))

(assert (= (and b!250978 (not c!42205)) b!250982))

(declare-fun b_lambda!8077 () Bool)

(assert (=> (not b_lambda!8077) (not b!250977)))

(assert (=> b!250977 t!8740))

(declare-fun b_and!13635 () Bool)

(assert (= b_and!13633 (and (=> t!8740 result!5299) b_and!13635)))

(declare-fun b_lambda!8079 () Bool)

(assert (=> (not b_lambda!8079) (not b!250979)))

(assert (=> b!250979 t!8740))

(declare-fun b_and!13637 () Bool)

(assert (= b_and!13635 (and (=> t!8740 result!5299) b_and!13637)))

(assert (=> b!250979 m!266697))

(assert (=> b!250979 m!266699))

(assert (=> b!250979 m!266701))

(assert (=> b!250979 m!266699))

(assert (=> b!250979 m!266697))

(assert (=> b!250979 m!266613))

(assert (=> b!250979 m!266613))

(declare-fun m!266795 () Bool)

(assert (=> b!250979 m!266795))

(assert (=> b!250983 m!266613))

(assert (=> b!250983 m!266613))

(assert (=> b!250983 m!266615))

(assert (=> b!250980 m!266613))

(assert (=> b!250980 m!266613))

(assert (=> b!250980 m!266615))

(declare-fun m!266797 () Bool)

(assert (=> b!250985 m!266797))

(declare-fun m!266799 () Bool)

(assert (=> d!60889 m!266799))

(assert (=> d!60889 m!266455))

(declare-fun m!266801 () Bool)

(assert (=> bm!23601 m!266801))

(declare-fun m!266803 () Bool)

(assert (=> b!250982 m!266803))

(declare-fun m!266805 () Bool)

(assert (=> b!250977 m!266805))

(assert (=> b!250977 m!266613))

(assert (=> b!250977 m!266697))

(assert (=> b!250977 m!266699))

(assert (=> b!250977 m!266701))

(declare-fun m!266807 () Bool)

(assert (=> b!250977 m!266807))

(declare-fun m!266809 () Bool)

(assert (=> b!250977 m!266809))

(declare-fun m!266811 () Bool)

(assert (=> b!250977 m!266811))

(assert (=> b!250977 m!266697))

(assert (=> b!250977 m!266807))

(assert (=> b!250977 m!266699))

(assert (=> b!250987 m!266613))

(assert (=> b!250987 m!266613))

(declare-fun m!266813 () Bool)

(assert (=> b!250987 m!266813))

(assert (=> b!250986 m!266801))

(assert (=> b!250864 d!60889))

(declare-fun d!60891 () Bool)

(assert (=> d!60891 (= (apply!241 lt!125607 lt!125606) (get!2995 (getValueByKey!297 (toList!1871 lt!125607) lt!125606)))))

(declare-fun bs!8967 () Bool)

(assert (= bs!8967 d!60891))

(declare-fun m!266815 () Bool)

(assert (=> bs!8967 m!266815))

(assert (=> bs!8967 m!266815))

(declare-fun m!266817 () Bool)

(assert (=> bs!8967 m!266817))

(assert (=> b!250864 d!60891))

(declare-fun d!60893 () Bool)

(assert (=> d!60893 (= (apply!241 lt!125611 lt!125618) (get!2995 (getValueByKey!297 (toList!1871 lt!125611) lt!125618)))))

(declare-fun bs!8968 () Bool)

(assert (= bs!8968 d!60893))

(declare-fun m!266819 () Bool)

(assert (=> bs!8968 m!266819))

(assert (=> bs!8968 m!266819))

(declare-fun m!266821 () Bool)

(assert (=> bs!8968 m!266821))

(assert (=> b!250864 d!60893))

(declare-fun d!60895 () Bool)

(assert (=> d!60895 (= (apply!241 (+!674 lt!125609 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))) lt!125600) (apply!241 lt!125609 lt!125600))))

(declare-fun lt!125677 () Unit!7735)

(declare-fun choose!1198 (ListLongMap!3711 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7735)

(assert (=> d!60895 (= lt!125677 (choose!1198 lt!125609 lt!125613 (zeroValue!4475 thiss!1504) lt!125600))))

(declare-fun e!162766 () Bool)

(assert (=> d!60895 e!162766))

(declare-fun res!122883 () Bool)

(assert (=> d!60895 (=> (not res!122883) (not e!162766))))

(assert (=> d!60895 (= res!122883 (contains!1798 lt!125609 lt!125600))))

(assert (=> d!60895 (= (addApplyDifferent!217 lt!125609 lt!125613 (zeroValue!4475 thiss!1504) lt!125600) lt!125677)))

(declare-fun b!250992 () Bool)

(assert (=> b!250992 (= e!162766 (not (= lt!125600 lt!125613)))))

(assert (= (and d!60895 res!122883) b!250992))

(declare-fun m!266823 () Bool)

(assert (=> d!60895 m!266823))

(assert (=> d!60895 m!266691))

(assert (=> d!60895 m!266673))

(assert (=> d!60895 m!266675))

(declare-fun m!266825 () Bool)

(assert (=> d!60895 m!266825))

(assert (=> d!60895 m!266673))

(assert (=> b!250864 d!60895))

(declare-fun d!60897 () Bool)

(assert (=> d!60897 (= (apply!241 (+!674 lt!125611 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))) lt!125618) (apply!241 lt!125611 lt!125618))))

(declare-fun lt!125678 () Unit!7735)

(assert (=> d!60897 (= lt!125678 (choose!1198 lt!125611 lt!125619 (minValue!4475 thiss!1504) lt!125618))))

(declare-fun e!162767 () Bool)

(assert (=> d!60897 e!162767))

(declare-fun res!122884 () Bool)

(assert (=> d!60897 (=> (not res!122884) (not e!162767))))

(assert (=> d!60897 (= res!122884 (contains!1798 lt!125611 lt!125618))))

(assert (=> d!60897 (= (addApplyDifferent!217 lt!125611 lt!125619 (minValue!4475 thiss!1504) lt!125618) lt!125678)))

(declare-fun b!250993 () Bool)

(assert (=> b!250993 (= e!162767 (not (= lt!125618 lt!125619)))))

(assert (= (and d!60897 res!122884) b!250993))

(declare-fun m!266827 () Bool)

(assert (=> d!60897 m!266827))

(assert (=> d!60897 m!266665))

(assert (=> d!60897 m!266661))

(assert (=> d!60897 m!266663))

(declare-fun m!266829 () Bool)

(assert (=> d!60897 m!266829))

(assert (=> d!60897 m!266661))

(assert (=> b!250864 d!60897))

(declare-fun d!60899 () Bool)

(declare-fun e!162768 () Bool)

(assert (=> d!60899 e!162768))

(declare-fun res!122886 () Bool)

(assert (=> d!60899 (=> (not res!122886) (not e!162768))))

(declare-fun lt!125682 () ListLongMap!3711)

(assert (=> d!60899 (= res!122886 (contains!1798 lt!125682 (_1!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))))))

(declare-fun lt!125680 () List!3708)

(assert (=> d!60899 (= lt!125682 (ListLongMap!3712 lt!125680))))

(declare-fun lt!125681 () Unit!7735)

(declare-fun lt!125679 () Unit!7735)

(assert (=> d!60899 (= lt!125681 lt!125679)))

(assert (=> d!60899 (= (getValueByKey!297 lt!125680 (_1!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))))))

(assert (=> d!60899 (= lt!125679 (lemmaContainsTupThenGetReturnValue!160 lt!125680 (_1!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))))))

(assert (=> d!60899 (= lt!125680 (insertStrictlySorted!163 (toList!1871 lt!125611) (_1!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))))))

(assert (=> d!60899 (= (+!674 lt!125611 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))) lt!125682)))

(declare-fun b!250994 () Bool)

(declare-fun res!122885 () Bool)

(assert (=> b!250994 (=> (not res!122885) (not e!162768))))

(assert (=> b!250994 (= res!122885 (= (getValueByKey!297 (toList!1871 lt!125682) (_1!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))))))))

(declare-fun b!250995 () Bool)

(assert (=> b!250995 (= e!162768 (contains!1802 (toList!1871 lt!125682) (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))))))

(assert (= (and d!60899 res!122886) b!250994))

(assert (= (and b!250994 res!122885) b!250995))

(declare-fun m!266831 () Bool)

(assert (=> d!60899 m!266831))

(declare-fun m!266833 () Bool)

(assert (=> d!60899 m!266833))

(declare-fun m!266835 () Bool)

(assert (=> d!60899 m!266835))

(declare-fun m!266837 () Bool)

(assert (=> d!60899 m!266837))

(declare-fun m!266839 () Bool)

(assert (=> b!250994 m!266839))

(declare-fun m!266841 () Bool)

(assert (=> b!250995 m!266841))

(assert (=> b!250864 d!60899))

(declare-fun d!60901 () Bool)

(assert (=> d!60901 (= (apply!241 (+!674 lt!125607 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))) lt!125606) (apply!241 lt!125607 lt!125606))))

(declare-fun lt!125683 () Unit!7735)

(assert (=> d!60901 (= lt!125683 (choose!1198 lt!125607 lt!125602 (minValue!4475 thiss!1504) lt!125606))))

(declare-fun e!162769 () Bool)

(assert (=> d!60901 e!162769))

(declare-fun res!122887 () Bool)

(assert (=> d!60901 (=> (not res!122887) (not e!162769))))

(assert (=> d!60901 (= res!122887 (contains!1798 lt!125607 lt!125606))))

(assert (=> d!60901 (= (addApplyDifferent!217 lt!125607 lt!125602 (minValue!4475 thiss!1504) lt!125606) lt!125683)))

(declare-fun b!250996 () Bool)

(assert (=> b!250996 (= e!162769 (not (= lt!125606 lt!125602)))))

(assert (= (and d!60901 res!122887) b!250996))

(declare-fun m!266843 () Bool)

(assert (=> d!60901 m!266843))

(assert (=> d!60901 m!266679))

(assert (=> d!60901 m!266687))

(assert (=> d!60901 m!266689))

(declare-fun m!266845 () Bool)

(assert (=> d!60901 m!266845))

(assert (=> d!60901 m!266687))

(assert (=> b!250864 d!60901))

(declare-fun d!60903 () Bool)

(declare-fun e!162770 () Bool)

(assert (=> d!60903 e!162770))

(declare-fun res!122889 () Bool)

(assert (=> d!60903 (=> (not res!122889) (not e!162770))))

(declare-fun lt!125687 () ListLongMap!3711)

(assert (=> d!60903 (= res!122889 (contains!1798 lt!125687 (_1!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))))))

(declare-fun lt!125685 () List!3708)

(assert (=> d!60903 (= lt!125687 (ListLongMap!3712 lt!125685))))

(declare-fun lt!125686 () Unit!7735)

(declare-fun lt!125684 () Unit!7735)

(assert (=> d!60903 (= lt!125686 lt!125684)))

(assert (=> d!60903 (= (getValueByKey!297 lt!125685 (_1!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!60903 (= lt!125684 (lemmaContainsTupThenGetReturnValue!160 lt!125685 (_1!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!60903 (= lt!125685 (insertStrictlySorted!163 (toList!1871 lt!125620) (_1!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!60903 (= (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))) lt!125687)))

(declare-fun b!250997 () Bool)

(declare-fun res!122888 () Bool)

(assert (=> b!250997 (=> (not res!122888) (not e!162770))))

(assert (=> b!250997 (= res!122888 (= (getValueByKey!297 (toList!1871 lt!125687) (_1!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))))))))

(declare-fun b!250998 () Bool)

(assert (=> b!250998 (= e!162770 (contains!1802 (toList!1871 lt!125687) (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))))))

(assert (= (and d!60903 res!122889) b!250997))

(assert (= (and b!250997 res!122888) b!250998))

(declare-fun m!266847 () Bool)

(assert (=> d!60903 m!266847))

(declare-fun m!266849 () Bool)

(assert (=> d!60903 m!266849))

(declare-fun m!266851 () Bool)

(assert (=> d!60903 m!266851))

(declare-fun m!266853 () Bool)

(assert (=> d!60903 m!266853))

(declare-fun m!266855 () Bool)

(assert (=> b!250997 m!266855))

(declare-fun m!266857 () Bool)

(assert (=> b!250998 m!266857))

(assert (=> b!250864 d!60903))

(declare-fun d!60905 () Bool)

(declare-fun e!162771 () Bool)

(assert (=> d!60905 e!162771))

(declare-fun res!122891 () Bool)

(assert (=> d!60905 (=> (not res!122891) (not e!162771))))

(declare-fun lt!125691 () ListLongMap!3711)

(assert (=> d!60905 (= res!122891 (contains!1798 lt!125691 (_1!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))))))

(declare-fun lt!125689 () List!3708)

(assert (=> d!60905 (= lt!125691 (ListLongMap!3712 lt!125689))))

(declare-fun lt!125690 () Unit!7735)

(declare-fun lt!125688 () Unit!7735)

(assert (=> d!60905 (= lt!125690 lt!125688)))

(assert (=> d!60905 (= (getValueByKey!297 lt!125689 (_1!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))))))

(assert (=> d!60905 (= lt!125688 (lemmaContainsTupThenGetReturnValue!160 lt!125689 (_1!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))))))

(assert (=> d!60905 (= lt!125689 (insertStrictlySorted!163 (toList!1871 lt!125607) (_1!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))))))

(assert (=> d!60905 (= (+!674 lt!125607 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))) lt!125691)))

(declare-fun b!250999 () Bool)

(declare-fun res!122890 () Bool)

(assert (=> b!250999 (=> (not res!122890) (not e!162771))))

(assert (=> b!250999 (= res!122890 (= (getValueByKey!297 (toList!1871 lt!125691) (_1!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))))))))

(declare-fun b!251000 () Bool)

(assert (=> b!251000 (= e!162771 (contains!1802 (toList!1871 lt!125691) (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))))))

(assert (= (and d!60905 res!122891) b!250999))

(assert (= (and b!250999 res!122890) b!251000))

(declare-fun m!266859 () Bool)

(assert (=> d!60905 m!266859))

(declare-fun m!266861 () Bool)

(assert (=> d!60905 m!266861))

(declare-fun m!266863 () Bool)

(assert (=> d!60905 m!266863))

(declare-fun m!266865 () Bool)

(assert (=> d!60905 m!266865))

(declare-fun m!266867 () Bool)

(assert (=> b!250999 m!266867))

(declare-fun m!266869 () Bool)

(assert (=> b!251000 m!266869))

(assert (=> b!250864 d!60905))

(declare-fun d!60907 () Bool)

(declare-fun e!162772 () Bool)

(assert (=> d!60907 e!162772))

(declare-fun res!122893 () Bool)

(assert (=> d!60907 (=> (not res!122893) (not e!162772))))

(declare-fun lt!125695 () ListLongMap!3711)

(assert (=> d!60907 (= res!122893 (contains!1798 lt!125695 (_1!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))))))

(declare-fun lt!125693 () List!3708)

(assert (=> d!60907 (= lt!125695 (ListLongMap!3712 lt!125693))))

(declare-fun lt!125694 () Unit!7735)

(declare-fun lt!125692 () Unit!7735)

(assert (=> d!60907 (= lt!125694 lt!125692)))

(assert (=> d!60907 (= (getValueByKey!297 lt!125693 (_1!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!60907 (= lt!125692 (lemmaContainsTupThenGetReturnValue!160 lt!125693 (_1!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!60907 (= lt!125693 (insertStrictlySorted!163 (toList!1871 lt!125609) (_1!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!60907 (= (+!674 lt!125609 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))) lt!125695)))

(declare-fun b!251001 () Bool)

(declare-fun res!122892 () Bool)

(assert (=> b!251001 (=> (not res!122892) (not e!162772))))

(assert (=> b!251001 (= res!122892 (= (getValueByKey!297 (toList!1871 lt!125695) (_1!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))))))))

(declare-fun b!251002 () Bool)

(assert (=> b!251002 (= e!162772 (contains!1802 (toList!1871 lt!125695) (tuple2!4809 lt!125613 (zeroValue!4475 thiss!1504))))))

(assert (= (and d!60907 res!122893) b!251001))

(assert (= (and b!251001 res!122892) b!251002))

(declare-fun m!266871 () Bool)

(assert (=> d!60907 m!266871))

(declare-fun m!266873 () Bool)

(assert (=> d!60907 m!266873))

(declare-fun m!266875 () Bool)

(assert (=> d!60907 m!266875))

(declare-fun m!266877 () Bool)

(assert (=> d!60907 m!266877))

(declare-fun m!266879 () Bool)

(assert (=> b!251001 m!266879))

(declare-fun m!266881 () Bool)

(assert (=> b!251002 m!266881))

(assert (=> b!250864 d!60907))

(declare-fun d!60909 () Bool)

(assert (=> d!60909 (= (apply!241 lt!125609 lt!125600) (get!2995 (getValueByKey!297 (toList!1871 lt!125609) lt!125600)))))

(declare-fun bs!8969 () Bool)

(assert (= bs!8969 d!60909))

(declare-fun m!266883 () Bool)

(assert (=> bs!8969 m!266883))

(assert (=> bs!8969 m!266883))

(declare-fun m!266885 () Bool)

(assert (=> bs!8969 m!266885))

(assert (=> b!250864 d!60909))

(declare-fun d!60911 () Bool)

(assert (=> d!60911 (contains!1798 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))) lt!125616)))

(declare-fun lt!125698 () Unit!7735)

(declare-fun choose!1199 (ListLongMap!3711 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7735)

(assert (=> d!60911 (= lt!125698 (choose!1199 lt!125620 lt!125604 (zeroValue!4475 thiss!1504) lt!125616))))

(assert (=> d!60911 (contains!1798 lt!125620 lt!125616)))

(assert (=> d!60911 (= (addStillContains!217 lt!125620 lt!125604 (zeroValue!4475 thiss!1504) lt!125616) lt!125698)))

(declare-fun bs!8970 () Bool)

(assert (= bs!8970 d!60911))

(assert (=> bs!8970 m!266669))

(assert (=> bs!8970 m!266669))

(assert (=> bs!8970 m!266683))

(declare-fun m!266887 () Bool)

(assert (=> bs!8970 m!266887))

(declare-fun m!266889 () Bool)

(assert (=> bs!8970 m!266889))

(assert (=> b!250864 d!60911))

(declare-fun d!60913 () Bool)

(assert (=> d!60913 (= (apply!241 (+!674 lt!125611 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504))) lt!125618) (get!2995 (getValueByKey!297 (toList!1871 (+!674 lt!125611 (tuple2!4809 lt!125619 (minValue!4475 thiss!1504)))) lt!125618)))))

(declare-fun bs!8971 () Bool)

(assert (= bs!8971 d!60913))

(declare-fun m!266891 () Bool)

(assert (=> bs!8971 m!266891))

(assert (=> bs!8971 m!266891))

(declare-fun m!266893 () Bool)

(assert (=> bs!8971 m!266893))

(assert (=> b!250864 d!60913))

(declare-fun d!60915 () Bool)

(assert (=> d!60915 (= (apply!241 (+!674 lt!125607 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504))) lt!125606) (get!2995 (getValueByKey!297 (toList!1871 (+!674 lt!125607 (tuple2!4809 lt!125602 (minValue!4475 thiss!1504)))) lt!125606)))))

(declare-fun bs!8972 () Bool)

(assert (= bs!8972 d!60915))

(declare-fun m!266895 () Bool)

(assert (=> bs!8972 m!266895))

(assert (=> bs!8972 m!266895))

(declare-fun m!266897 () Bool)

(assert (=> bs!8972 m!266897))

(assert (=> b!250864 d!60915))

(declare-fun d!60917 () Bool)

(declare-fun e!162773 () Bool)

(assert (=> d!60917 e!162773))

(declare-fun res!122894 () Bool)

(assert (=> d!60917 (=> res!122894 e!162773)))

(declare-fun lt!125701 () Bool)

(assert (=> d!60917 (= res!122894 (not lt!125701))))

(declare-fun lt!125700 () Bool)

(assert (=> d!60917 (= lt!125701 lt!125700)))

(declare-fun lt!125699 () Unit!7735)

(declare-fun e!162774 () Unit!7735)

(assert (=> d!60917 (= lt!125699 e!162774)))

(declare-fun c!42209 () Bool)

(assert (=> d!60917 (= c!42209 lt!125700)))

(assert (=> d!60917 (= lt!125700 (containsKey!289 (toList!1871 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))) lt!125616))))

(assert (=> d!60917 (= (contains!1798 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504))) lt!125616) lt!125701)))

(declare-fun b!251004 () Bool)

(declare-fun lt!125702 () Unit!7735)

(assert (=> b!251004 (= e!162774 lt!125702)))

(assert (=> b!251004 (= lt!125702 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1871 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))) lt!125616))))

(assert (=> b!251004 (isDefined!239 (getValueByKey!297 (toList!1871 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))) lt!125616))))

(declare-fun b!251005 () Bool)

(declare-fun Unit!7749 () Unit!7735)

(assert (=> b!251005 (= e!162774 Unit!7749)))

(declare-fun b!251006 () Bool)

(assert (=> b!251006 (= e!162773 (isDefined!239 (getValueByKey!297 (toList!1871 (+!674 lt!125620 (tuple2!4809 lt!125604 (zeroValue!4475 thiss!1504)))) lt!125616)))))

(assert (= (and d!60917 c!42209) b!251004))

(assert (= (and d!60917 (not c!42209)) b!251005))

(assert (= (and d!60917 (not res!122894)) b!251006))

(declare-fun m!266899 () Bool)

(assert (=> d!60917 m!266899))

(declare-fun m!266901 () Bool)

(assert (=> b!251004 m!266901))

(declare-fun m!266903 () Bool)

(assert (=> b!251004 m!266903))

(assert (=> b!251004 m!266903))

(declare-fun m!266905 () Bool)

(assert (=> b!251004 m!266905))

(assert (=> b!251006 m!266903))

(assert (=> b!251006 m!266903))

(assert (=> b!251006 m!266905))

(assert (=> b!250864 d!60917))

(declare-fun d!60919 () Bool)

(declare-fun isEmpty!533 (Option!303) Bool)

(assert (=> d!60919 (= (isDefined!239 (getValueByKey!297 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932)) (not (isEmpty!533 (getValueByKey!297 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))))

(declare-fun bs!8973 () Bool)

(assert (= bs!8973 d!60919))

(assert (=> bs!8973 m!266655))

(declare-fun m!266907 () Bool)

(assert (=> bs!8973 m!266907))

(assert (=> b!250814 d!60919))

(declare-fun b!251016 () Bool)

(declare-fun e!162779 () Option!303)

(declare-fun e!162780 () Option!303)

(assert (=> b!251016 (= e!162779 e!162780)))

(declare-fun c!42215 () Bool)

(assert (=> b!251016 (= c!42215 (and ((_ is Cons!3704) (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (not (= (_1!2415 (h!4364 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932))))))

(declare-fun b!251015 () Bool)

(assert (=> b!251015 (= e!162779 (Some!302 (_2!2415 (h!4364 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))))))

(declare-fun b!251018 () Bool)

(assert (=> b!251018 (= e!162780 None!301)))

(declare-fun d!60921 () Bool)

(declare-fun c!42214 () Bool)

(assert (=> d!60921 (= c!42214 (and ((_ is Cons!3704) (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (= (_1!2415 (h!4364 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)))))

(assert (=> d!60921 (= (getValueByKey!297 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932) e!162779)))

(declare-fun b!251017 () Bool)

(assert (=> b!251017 (= e!162780 (getValueByKey!297 (t!8734 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) key!932))))

(assert (= (and d!60921 c!42214) b!251015))

(assert (= (and d!60921 (not c!42214)) b!251016))

(assert (= (and b!251016 c!42215) b!251017))

(assert (= (and b!251016 (not c!42215)) b!251018))

(declare-fun m!266909 () Bool)

(assert (=> b!251017 m!266909))

(assert (=> b!250814 d!60921))

(declare-fun d!60923 () Bool)

(assert (=> d!60923 (isDefined!239 (getValueByKey!297 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-fun lt!125705 () Unit!7735)

(declare-fun choose!1200 (List!3708 (_ BitVec 64)) Unit!7735)

(assert (=> d!60923 (= lt!125705 (choose!1200 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-fun e!162783 () Bool)

(assert (=> d!60923 e!162783))

(declare-fun res!122897 () Bool)

(assert (=> d!60923 (=> (not res!122897) (not e!162783))))

(declare-fun isStrictlySorted!366 (List!3708) Bool)

(assert (=> d!60923 (= res!122897 (isStrictlySorted!366 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))))

(assert (=> d!60923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932) lt!125705)))

(declare-fun b!251021 () Bool)

(assert (=> b!251021 (= e!162783 (containsKey!289 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(assert (= (and d!60923 res!122897) b!251021))

(assert (=> d!60923 m!266655))

(assert (=> d!60923 m!266655))

(assert (=> d!60923 m!266657))

(declare-fun m!266911 () Bool)

(assert (=> d!60923 m!266911))

(declare-fun m!266913 () Bool)

(assert (=> d!60923 m!266913))

(assert (=> b!251021 m!266651))

(assert (=> b!250812 d!60923))

(assert (=> b!250812 d!60919))

(assert (=> b!250812 d!60921))

(declare-fun bm!23602 () Bool)

(declare-fun call!23605 () Bool)

(assert (=> bm!23602 (= call!23605 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(declare-fun b!251022 () Bool)

(declare-fun e!162784 () Bool)

(assert (=> b!251022 (= e!162784 call!23605)))

(declare-fun d!60925 () Bool)

(declare-fun res!122898 () Bool)

(declare-fun e!162785 () Bool)

(assert (=> d!60925 (=> res!122898 e!162785)))

(assert (=> d!60925 (= res!122898 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60925 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)) e!162785)))

(declare-fun b!251023 () Bool)

(declare-fun e!162786 () Bool)

(assert (=> b!251023 (= e!162785 e!162786)))

(declare-fun c!42216 () Bool)

(assert (=> b!251023 (= c!42216 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251024 () Bool)

(assert (=> b!251024 (= e!162786 e!162784)))

(declare-fun lt!125708 () (_ BitVec 64))

(assert (=> b!251024 (= lt!125708 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125707 () Unit!7735)

(assert (=> b!251024 (= lt!125707 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6771 thiss!1504) lt!125708 #b00000000000000000000000000000000))))

(assert (=> b!251024 (arrayContainsKey!0 (_keys!6771 thiss!1504) lt!125708 #b00000000000000000000000000000000)))

(declare-fun lt!125706 () Unit!7735)

(assert (=> b!251024 (= lt!125706 lt!125707)))

(declare-fun res!122899 () Bool)

(assert (=> b!251024 (= res!122899 (= (seekEntryOrOpen!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000) (_keys!6771 thiss!1504) (mask!10823 thiss!1504)) (Found!1122 #b00000000000000000000000000000000)))))

(assert (=> b!251024 (=> (not res!122899) (not e!162784))))

(declare-fun b!251025 () Bool)

(assert (=> b!251025 (= e!162786 call!23605)))

(assert (= (and d!60925 (not res!122898)) b!251023))

(assert (= (and b!251023 c!42216) b!251024))

(assert (= (and b!251023 (not c!42216)) b!251025))

(assert (= (and b!251024 res!122899) b!251022))

(assert (= (or b!251022 b!251025) bm!23602))

(declare-fun m!266915 () Bool)

(assert (=> bm!23602 m!266915))

(assert (=> b!251023 m!266613))

(assert (=> b!251023 m!266613))

(assert (=> b!251023 m!266615))

(assert (=> b!251024 m!266613))

(declare-fun m!266917 () Bool)

(assert (=> b!251024 m!266917))

(declare-fun m!266919 () Bool)

(assert (=> b!251024 m!266919))

(assert (=> b!251024 m!266613))

(declare-fun m!266921 () Bool)

(assert (=> b!251024 m!266921))

(assert (=> b!250905 d!60925))

(declare-fun d!60927 () Bool)

(declare-fun res!122900 () Bool)

(declare-fun e!162787 () Bool)

(assert (=> d!60927 (=> res!122900 e!162787)))

(assert (=> d!60927 (= res!122900 (= (select (arr!5830 (_keys!6771 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60927 (= (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!162787)))

(declare-fun b!251026 () Bool)

(declare-fun e!162788 () Bool)

(assert (=> b!251026 (= e!162787 e!162788)))

(declare-fun res!122901 () Bool)

(assert (=> b!251026 (=> (not res!122901) (not e!162788))))

(assert (=> b!251026 (= res!122901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun b!251027 () Bool)

(assert (=> b!251027 (= e!162788 (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60927 (not res!122900)) b!251026))

(assert (= (and b!251026 res!122901) b!251027))

(declare-fun m!266923 () Bool)

(assert (=> d!60927 m!266923))

(declare-fun m!266925 () Bool)

(assert (=> b!251027 m!266925))

(assert (=> b!250796 d!60927))

(declare-fun d!60929 () Bool)

(assert (=> d!60929 (= (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250860 d!60929))

(declare-fun d!60931 () Bool)

(declare-fun e!162789 () Bool)

(assert (=> d!60931 e!162789))

(declare-fun res!122902 () Bool)

(assert (=> d!60931 (=> res!122902 e!162789)))

(declare-fun lt!125711 () Bool)

(assert (=> d!60931 (= res!122902 (not lt!125711))))

(declare-fun lt!125710 () Bool)

(assert (=> d!60931 (= lt!125711 lt!125710)))

(declare-fun lt!125709 () Unit!7735)

(declare-fun e!162790 () Unit!7735)

(assert (=> d!60931 (= lt!125709 e!162790)))

(declare-fun c!42217 () Bool)

(assert (=> d!60931 (= c!42217 lt!125710)))

(assert (=> d!60931 (= lt!125710 (containsKey!289 (toList!1871 lt!125610) (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60931 (= (contains!1798 lt!125610 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)) lt!125711)))

(declare-fun b!251028 () Bool)

(declare-fun lt!125712 () Unit!7735)

(assert (=> b!251028 (= e!162790 lt!125712)))

(assert (=> b!251028 (= lt!125712 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1871 lt!125610) (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251028 (isDefined!239 (getValueByKey!297 (toList!1871 lt!125610) (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251029 () Bool)

(declare-fun Unit!7750 () Unit!7735)

(assert (=> b!251029 (= e!162790 Unit!7750)))

(declare-fun b!251030 () Bool)

(assert (=> b!251030 (= e!162789 (isDefined!239 (getValueByKey!297 (toList!1871 lt!125610) (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60931 c!42217) b!251028))

(assert (= (and d!60931 (not c!42217)) b!251029))

(assert (= (and d!60931 (not res!122902)) b!251030))

(assert (=> d!60931 m!266613))

(declare-fun m!266927 () Bool)

(assert (=> d!60931 m!266927))

(assert (=> b!251028 m!266613))

(declare-fun m!266929 () Bool)

(assert (=> b!251028 m!266929))

(assert (=> b!251028 m!266613))

(assert (=> b!251028 m!266783))

(assert (=> b!251028 m!266783))

(declare-fun m!266931 () Bool)

(assert (=> b!251028 m!266931))

(assert (=> b!251030 m!266613))

(assert (=> b!251030 m!266783))

(assert (=> b!251030 m!266783))

(assert (=> b!251030 m!266931))

(assert (=> b!250872 d!60931))

(declare-fun call!23606 () Bool)

(declare-fun bm!23603 () Bool)

(declare-fun c!42218 () Bool)

(assert (=> bm!23603 (= call!23606 (arrayNoDuplicates!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42218 (Cons!3703 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000) Nil!3704) Nil!3704)))))

(declare-fun e!162791 () Bool)

(declare-fun b!251031 () Bool)

(assert (=> b!251031 (= e!162791 (contains!1801 Nil!3704 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60933 () Bool)

(declare-fun res!122903 () Bool)

(declare-fun e!162794 () Bool)

(assert (=> d!60933 (=> res!122903 e!162794)))

(assert (=> d!60933 (= res!122903 (bvsge #b00000000000000000000000000000000 (size!6176 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))))))))

(assert (=> d!60933 (= (arrayNoDuplicates!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000000 Nil!3704) e!162794)))

(declare-fun b!251032 () Bool)

(declare-fun e!162793 () Bool)

(assert (=> b!251032 (= e!162794 e!162793)))

(declare-fun res!122904 () Bool)

(assert (=> b!251032 (=> (not res!122904) (not e!162793))))

(assert (=> b!251032 (= res!122904 (not e!162791))))

(declare-fun res!122905 () Bool)

(assert (=> b!251032 (=> (not res!122905) (not e!162791))))

(assert (=> b!251032 (= res!122905 (validKeyInArray!0 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251033 () Bool)

(declare-fun e!162792 () Bool)

(assert (=> b!251033 (= e!162793 e!162792)))

(assert (=> b!251033 (= c!42218 (validKeyInArray!0 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251034 () Bool)

(assert (=> b!251034 (= e!162792 call!23606)))

(declare-fun b!251035 () Bool)

(assert (=> b!251035 (= e!162792 call!23606)))

(assert (= (and d!60933 (not res!122903)) b!251032))

(assert (= (and b!251032 res!122905) b!251031))

(assert (= (and b!251032 res!122904) b!251033))

(assert (= (and b!251033 c!42218) b!251034))

(assert (= (and b!251033 (not c!42218)) b!251035))

(assert (= (or b!251034 b!251035) bm!23603))

(assert (=> bm!23603 m!266773))

(declare-fun m!266933 () Bool)

(assert (=> bm!23603 m!266933))

(assert (=> b!251031 m!266773))

(assert (=> b!251031 m!266773))

(declare-fun m!266935 () Bool)

(assert (=> b!251031 m!266935))

(assert (=> b!251032 m!266773))

(assert (=> b!251032 m!266773))

(assert (=> b!251032 m!266775))

(assert (=> b!251033 m!266773))

(assert (=> b!251033 m!266773))

(assert (=> b!251033 m!266775))

(assert (=> b!250786 d!60933))

(declare-fun d!60935 () Bool)

(assert (=> d!60935 (= (inRange!0 (ite c!42147 (index!6658 lt!125513) (index!6661 lt!125513)) (mask!10823 thiss!1504)) (and (bvsge (ite c!42147 (index!6658 lt!125513) (index!6661 lt!125513)) #b00000000000000000000000000000000) (bvslt (ite c!42147 (index!6658 lt!125513) (index!6661 lt!125513)) (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23564 d!60935))

(assert (=> b!250768 d!60871))

(assert (=> b!250787 d!60871))

(assert (=> b!250866 d!60929))

(declare-fun c!42219 () Bool)

(declare-fun call!23607 () Bool)

(declare-fun bm!23604 () Bool)

(assert (=> bm!23604 (= call!23607 (arrayNoDuplicates!0 lt!125440 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42219 (Cons!3703 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!42156 (Cons!3703 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) Nil!3704) Nil!3704)) (ite c!42156 (Cons!3703 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) Nil!3704) Nil!3704))))))

(declare-fun b!251036 () Bool)

(declare-fun e!162795 () Bool)

(assert (=> b!251036 (= e!162795 (contains!1801 (ite c!42156 (Cons!3703 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) Nil!3704) Nil!3704) (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60937 () Bool)

(declare-fun res!122906 () Bool)

(declare-fun e!162798 () Bool)

(assert (=> d!60937 (=> res!122906 e!162798)))

(assert (=> d!60937 (= res!122906 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 lt!125440)))))

(assert (=> d!60937 (= (arrayNoDuplicates!0 lt!125440 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42156 (Cons!3703 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) Nil!3704) Nil!3704)) e!162798)))

(declare-fun b!251037 () Bool)

(declare-fun e!162797 () Bool)

(assert (=> b!251037 (= e!162798 e!162797)))

(declare-fun res!122907 () Bool)

(assert (=> b!251037 (=> (not res!122907) (not e!162797))))

(assert (=> b!251037 (= res!122907 (not e!162795))))

(declare-fun res!122908 () Bool)

(assert (=> b!251037 (=> (not res!122908) (not e!162795))))

(assert (=> b!251037 (= res!122908 (validKeyInArray!0 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251038 () Bool)

(declare-fun e!162796 () Bool)

(assert (=> b!251038 (= e!162797 e!162796)))

(assert (=> b!251038 (= c!42219 (validKeyInArray!0 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251039 () Bool)

(assert (=> b!251039 (= e!162796 call!23607)))

(declare-fun b!251040 () Bool)

(assert (=> b!251040 (= e!162796 call!23607)))

(assert (= (and d!60937 (not res!122906)) b!251037))

(assert (= (and b!251037 res!122908) b!251036))

(assert (= (and b!251037 res!122907) b!251038))

(assert (= (and b!251038 c!42219) b!251039))

(assert (= (and b!251038 (not c!42219)) b!251040))

(assert (= (or b!251039 b!251040) bm!23604))

(assert (=> bm!23604 m!266739))

(declare-fun m!266937 () Bool)

(assert (=> bm!23604 m!266937))

(assert (=> b!251036 m!266739))

(assert (=> b!251036 m!266739))

(declare-fun m!266939 () Bool)

(assert (=> b!251036 m!266939))

(assert (=> b!251037 m!266739))

(assert (=> b!251037 m!266739))

(assert (=> b!251037 m!266741))

(assert (=> b!251038 m!266739))

(assert (=> b!251038 m!266739))

(assert (=> b!251038 m!266741))

(assert (=> bm!23571 d!60937))

(declare-fun b!251042 () Bool)

(declare-fun e!162799 () (_ BitVec 32))

(declare-fun call!23608 () (_ BitVec 32))

(assert (=> b!251042 (= e!162799 call!23608)))

(declare-fun b!251043 () Bool)

(assert (=> b!251043 (= e!162799 (bvadd #b00000000000000000000000000000001 call!23608))))

(declare-fun b!251044 () Bool)

(declare-fun e!162800 () (_ BitVec 32))

(assert (=> b!251044 (= e!162800 #b00000000000000000000000000000000)))

(declare-fun bm!23605 () Bool)

(assert (=> bm!23605 (= call!23608 (arrayCountValidKeys!0 lt!125440 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun d!60939 () Bool)

(declare-fun lt!125713 () (_ BitVec 32))

(assert (=> d!60939 (and (bvsge lt!125713 #b00000000000000000000000000000000) (bvsle lt!125713 (bvsub (size!6176 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60939 (= lt!125713 e!162800)))

(declare-fun c!42220 () Bool)

(assert (=> d!60939 (= c!42220 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60939 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6771 thiss!1504)) (size!6176 lt!125440)))))

(assert (=> d!60939 (= (arrayCountValidKeys!0 lt!125440 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))) lt!125713)))

(declare-fun b!251041 () Bool)

(assert (=> b!251041 (= e!162800 e!162799)))

(declare-fun c!42221 () Bool)

(assert (=> b!251041 (= c!42221 (validKeyInArray!0 (select (arr!5830 lt!125440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60939 c!42220) b!251044))

(assert (= (and d!60939 (not c!42220)) b!251041))

(assert (= (and b!251041 c!42221) b!251043))

(assert (= (and b!251041 (not c!42221)) b!251042))

(assert (= (or b!251043 b!251042) bm!23605))

(declare-fun m!266941 () Bool)

(assert (=> bm!23605 m!266941))

(assert (=> b!251041 m!266739))

(assert (=> b!251041 m!266739))

(assert (=> b!251041 m!266741))

(assert (=> bm!23575 d!60939))

(assert (=> d!60853 d!60831))

(declare-fun d!60941 () Bool)

(assert (=> d!60941 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250742 d!60941))

(assert (=> d!60825 d!60855))

(declare-fun d!60943 () Bool)

(declare-fun e!162809 () Bool)

(assert (=> d!60943 e!162809))

(declare-fun c!42226 () Bool)

(declare-fun lt!125716 () SeekEntryResult!1122)

(assert (=> d!60943 (= c!42226 ((_ is MissingZero!1122) lt!125716))))

(assert (=> d!60943 (= lt!125716 (seekEntryOrOpen!0 key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(assert (=> d!60943 true))

(declare-fun _$34!1113 () Unit!7735)

(assert (=> d!60943 (= (choose!1195 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) _$34!1113)))

(declare-fun b!251061 () Bool)

(declare-fun res!122918 () Bool)

(declare-fun e!162811 () Bool)

(assert (=> b!251061 (=> (not res!122918) (not e!162811))))

(declare-fun call!23614 () Bool)

(assert (=> b!251061 (= res!122918 call!23614)))

(declare-fun e!162810 () Bool)

(assert (=> b!251061 (= e!162810 e!162811)))

(declare-fun bm!23610 () Bool)

(declare-fun call!23613 () Bool)

(assert (=> bm!23610 (= call!23613 (arrayContainsKey!0 (_keys!6771 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251062 () Bool)

(declare-fun e!162812 () Bool)

(assert (=> b!251062 (= e!162809 e!162812)))

(declare-fun res!122920 () Bool)

(assert (=> b!251062 (= res!122920 call!23614)))

(assert (=> b!251062 (=> (not res!122920) (not e!162812))))

(declare-fun b!251063 () Bool)

(assert (=> b!251063 (= e!162810 ((_ is Undefined!1122) lt!125716))))

(declare-fun b!251064 () Bool)

(assert (=> b!251064 (= e!162811 (not call!23613))))

(declare-fun b!251065 () Bool)

(assert (=> b!251065 (= e!162812 (not call!23613))))

(declare-fun b!251066 () Bool)

(assert (=> b!251066 (= e!162809 e!162810)))

(declare-fun c!42227 () Bool)

(assert (=> b!251066 (= c!42227 ((_ is MissingVacant!1122) lt!125716))))

(declare-fun b!251067 () Bool)

(declare-fun res!122919 () Bool)

(assert (=> b!251067 (=> (not res!122919) (not e!162811))))

(assert (=> b!251067 (= res!122919 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6661 lt!125716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23611 () Bool)

(assert (=> bm!23611 (= call!23614 (inRange!0 (ite c!42226 (index!6658 lt!125716) (index!6661 lt!125716)) (mask!10823 thiss!1504)))))

(declare-fun b!251068 () Bool)

(declare-fun res!122917 () Bool)

(assert (=> b!251068 (= res!122917 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6658 lt!125716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251068 (=> (not res!122917) (not e!162812))))

(assert (= (and d!60943 c!42226) b!251062))

(assert (= (and d!60943 (not c!42226)) b!251066))

(assert (= (and b!251062 res!122920) b!251068))

(assert (= (and b!251068 res!122917) b!251065))

(assert (= (and b!251066 c!42227) b!251061))

(assert (= (and b!251066 (not c!42227)) b!251063))

(assert (= (and b!251061 res!122918) b!251067))

(assert (= (and b!251067 res!122919) b!251064))

(assert (= (or b!251062 b!251061) bm!23611))

(assert (= (or b!251065 b!251064) bm!23610))

(assert (=> bm!23610 m!266457))

(assert (=> d!60943 m!266477))

(declare-fun m!266943 () Bool)

(assert (=> bm!23611 m!266943))

(declare-fun m!266945 () Bool)

(assert (=> b!251067 m!266945))

(declare-fun m!266947 () Bool)

(assert (=> b!251068 m!266947))

(assert (=> d!60825 d!60943))

(assert (=> d!60825 d!60831))

(declare-fun d!60945 () Bool)

(declare-fun e!162813 () Bool)

(assert (=> d!60945 e!162813))

(declare-fun res!122921 () Bool)

(assert (=> d!60945 (=> res!122921 e!162813)))

(declare-fun lt!125719 () Bool)

(assert (=> d!60945 (= res!122921 (not lt!125719))))

(declare-fun lt!125718 () Bool)

(assert (=> d!60945 (= lt!125719 lt!125718)))

(declare-fun lt!125717 () Unit!7735)

(declare-fun e!162814 () Unit!7735)

(assert (=> d!60945 (= lt!125717 e!162814)))

(declare-fun c!42228 () Bool)

(assert (=> d!60945 (= c!42228 lt!125718)))

(assert (=> d!60945 (= lt!125718 (containsKey!289 (toList!1871 lt!125610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60945 (= (contains!1798 lt!125610 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125719)))

(declare-fun b!251069 () Bool)

(declare-fun lt!125720 () Unit!7735)

(assert (=> b!251069 (= e!162814 lt!125720)))

(assert (=> b!251069 (= lt!125720 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1871 lt!125610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251069 (isDefined!239 (getValueByKey!297 (toList!1871 lt!125610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251070 () Bool)

(declare-fun Unit!7751 () Unit!7735)

(assert (=> b!251070 (= e!162814 Unit!7751)))

(declare-fun b!251071 () Bool)

(assert (=> b!251071 (= e!162813 (isDefined!239 (getValueByKey!297 (toList!1871 lt!125610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60945 c!42228) b!251069))

(assert (= (and d!60945 (not c!42228)) b!251070))

(assert (= (and d!60945 (not res!122921)) b!251071))

(declare-fun m!266949 () Bool)

(assert (=> d!60945 m!266949))

(declare-fun m!266951 () Bool)

(assert (=> b!251069 m!266951))

(assert (=> b!251069 m!266767))

(assert (=> b!251069 m!266767))

(declare-fun m!266953 () Bool)

(assert (=> b!251069 m!266953))

(assert (=> b!251071 m!266767))

(assert (=> b!251071 m!266767))

(assert (=> b!251071 m!266953))

(assert (=> bm!23593 d!60945))

(assert (=> bm!23591 d!60889))

(declare-fun b!251073 () Bool)

(declare-fun e!162815 () (_ BitVec 32))

(declare-fun call!23615 () (_ BitVec 32))

(assert (=> b!251073 (= e!162815 call!23615)))

(declare-fun b!251074 () Bool)

(assert (=> b!251074 (= e!162815 (bvadd #b00000000000000000000000000000001 call!23615))))

(declare-fun b!251075 () Bool)

(declare-fun e!162816 () (_ BitVec 32))

(assert (=> b!251075 (= e!162816 #b00000000000000000000000000000000)))

(declare-fun bm!23612 () Bool)

(assert (=> bm!23612 (= call!23615 (arrayCountValidKeys!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun d!60947 () Bool)

(declare-fun lt!125721 () (_ BitVec 32))

(assert (=> d!60947 (and (bvsge lt!125721 #b00000000000000000000000000000000) (bvsle lt!125721 (bvsub (size!6176 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!60947 (= lt!125721 e!162816)))

(declare-fun c!42229 () Bool)

(assert (=> d!60947 (= c!42229 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60947 (and (bvsle #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6771 thiss!1504)) (size!6176 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))))))))

(assert (=> d!60947 (= (arrayCountValidKeys!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) lt!125721)))

(declare-fun b!251072 () Bool)

(assert (=> b!251072 (= e!162816 e!162815)))

(declare-fun c!42230 () Bool)

(assert (=> b!251072 (= c!42230 (validKeyInArray!0 (select (arr!5830 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60947 c!42229) b!251075))

(assert (= (and d!60947 (not c!42229)) b!251072))

(assert (= (and b!251072 c!42230) b!251074))

(assert (= (and b!251072 (not c!42230)) b!251073))

(assert (= (or b!251074 b!251073) bm!23612))

(declare-fun m!266955 () Bool)

(assert (=> bm!23612 m!266955))

(assert (=> b!251072 m!266773))

(assert (=> b!251072 m!266773))

(assert (=> b!251072 m!266775))

(assert (=> b!250744 d!60947))

(assert (=> b!250744 d!60829))

(declare-fun d!60949 () Bool)

(declare-fun res!122926 () Bool)

(declare-fun e!162821 () Bool)

(assert (=> d!60949 (=> res!122926 e!162821)))

(assert (=> d!60949 (= res!122926 (and ((_ is Cons!3704) (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (= (_1!2415 (h!4364 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)))))

(assert (=> d!60949 (= (containsKey!289 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932) e!162821)))

(declare-fun b!251080 () Bool)

(declare-fun e!162822 () Bool)

(assert (=> b!251080 (= e!162821 e!162822)))

(declare-fun res!122927 () Bool)

(assert (=> b!251080 (=> (not res!122927) (not e!162822))))

(assert (=> b!251080 (= res!122927 (and (or (not ((_ is Cons!3704) (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) (bvsle (_1!2415 (h!4364 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)) ((_ is Cons!3704) (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (bvslt (_1!2415 (h!4364 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)))))

(declare-fun b!251081 () Bool)

(assert (=> b!251081 (= e!162822 (containsKey!289 (t!8734 (toList!1871 (getCurrentListMap!1380 (_keys!6771 thiss!1504) (_values!4617 thiss!1504) (mask!10823 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) key!932))))

(assert (= (and d!60949 (not res!122926)) b!251080))

(assert (= (and b!251080 res!122927) b!251081))

(declare-fun m!266957 () Bool)

(assert (=> b!251081 m!266957))

(assert (=> d!60851 d!60949))

(declare-fun b!251100 () Bool)

(declare-fun e!162835 () SeekEntryResult!1122)

(declare-fun e!162833 () SeekEntryResult!1122)

(assert (=> b!251100 (= e!162835 e!162833)))

(declare-fun c!42237 () Bool)

(declare-fun lt!125727 () (_ BitVec 64))

(assert (=> b!251100 (= c!42237 (or (= lt!125727 key!932) (= (bvadd lt!125727 lt!125727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251101 () Bool)

(declare-fun lt!125726 () SeekEntryResult!1122)

(assert (=> b!251101 (and (bvsge (index!6660 lt!125726) #b00000000000000000000000000000000) (bvslt (index!6660 lt!125726) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun res!122935 () Bool)

(assert (=> b!251101 (= res!122935 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6660 lt!125726)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162834 () Bool)

(assert (=> b!251101 (=> res!122935 e!162834)))

(declare-fun b!251102 () Bool)

(assert (=> b!251102 (= e!162835 (Intermediate!1122 true (toIndex!0 key!932 (mask!10823 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251103 () Bool)

(declare-fun e!162837 () Bool)

(declare-fun e!162836 () Bool)

(assert (=> b!251103 (= e!162837 e!162836)))

(declare-fun res!122934 () Bool)

(assert (=> b!251103 (= res!122934 (and ((_ is Intermediate!1122) lt!125726) (not (undefined!1934 lt!125726)) (bvslt (x!24689 lt!125726) #b01111111111111111111111111111110) (bvsge (x!24689 lt!125726) #b00000000000000000000000000000000) (bvsge (x!24689 lt!125726) #b00000000000000000000000000000000)))))

(assert (=> b!251103 (=> (not res!122934) (not e!162836))))

(declare-fun d!60951 () Bool)

(assert (=> d!60951 e!162837))

(declare-fun c!42238 () Bool)

(assert (=> d!60951 (= c!42238 (and ((_ is Intermediate!1122) lt!125726) (undefined!1934 lt!125726)))))

(assert (=> d!60951 (= lt!125726 e!162835)))

(declare-fun c!42239 () Bool)

(assert (=> d!60951 (= c!42239 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!60951 (= lt!125727 (select (arr!5830 (_keys!6771 thiss!1504)) (toIndex!0 key!932 (mask!10823 thiss!1504))))))

(assert (=> d!60951 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10823 thiss!1504)) key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)) lt!125726)))

(declare-fun b!251104 () Bool)

(assert (=> b!251104 (and (bvsge (index!6660 lt!125726) #b00000000000000000000000000000000) (bvslt (index!6660 lt!125726) (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> b!251104 (= e!162834 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6660 lt!125726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251105 () Bool)

(assert (=> b!251105 (and (bvsge (index!6660 lt!125726) #b00000000000000000000000000000000) (bvslt (index!6660 lt!125726) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun res!122936 () Bool)

(assert (=> b!251105 (= res!122936 (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6660 lt!125726)) key!932))))

(assert (=> b!251105 (=> res!122936 e!162834)))

(assert (=> b!251105 (= e!162836 e!162834)))

(declare-fun b!251106 () Bool)

(assert (=> b!251106 (= e!162833 (Intermediate!1122 false (toIndex!0 key!932 (mask!10823 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251107 () Bool)

(assert (=> b!251107 (= e!162837 (bvsge (x!24689 lt!125726) #b01111111111111111111111111111110))))

(declare-fun b!251108 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251108 (= e!162833 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10823 thiss!1504)) #b00000000000000000000000000000000 (mask!10823 thiss!1504)) key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(assert (= (and d!60951 c!42239) b!251102))

(assert (= (and d!60951 (not c!42239)) b!251100))

(assert (= (and b!251100 c!42237) b!251106))

(assert (= (and b!251100 (not c!42237)) b!251108))

(assert (= (and d!60951 c!42238) b!251107))

(assert (= (and d!60951 (not c!42238)) b!251103))

(assert (= (and b!251103 res!122934) b!251105))

(assert (= (and b!251105 (not res!122936)) b!251101))

(assert (= (and b!251101 (not res!122935)) b!251104))

(declare-fun m!266959 () Bool)

(assert (=> b!251101 m!266959))

(assert (=> b!251105 m!266959))

(assert (=> b!251104 m!266959))

(assert (=> b!251108 m!266721))

(declare-fun m!266961 () Bool)

(assert (=> b!251108 m!266961))

(assert (=> b!251108 m!266961))

(declare-fun m!266963 () Bool)

(assert (=> b!251108 m!266963))

(assert (=> d!60951 m!266721))

(declare-fun m!266965 () Bool)

(assert (=> d!60951 m!266965))

(assert (=> d!60951 m!266455))

(assert (=> d!60855 d!60951))

(declare-fun d!60953 () Bool)

(declare-fun lt!125733 () (_ BitVec 32))

(declare-fun lt!125732 () (_ BitVec 32))

(assert (=> d!60953 (= lt!125733 (bvmul (bvxor lt!125732 (bvlshr lt!125732 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60953 (= lt!125732 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60953 (and (bvsge (mask!10823 thiss!1504) #b00000000000000000000000000000000) (let ((res!122937 (let ((h!4369 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24708 (bvmul (bvxor h!4369 (bvlshr h!4369 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24708 (bvlshr x!24708 #b00000000000000000000000000001101)) (mask!10823 thiss!1504)))))) (and (bvslt res!122937 (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122937 #b00000000000000000000000000000000))))))

(assert (=> d!60953 (= (toIndex!0 key!932 (mask!10823 thiss!1504)) (bvand (bvxor lt!125733 (bvlshr lt!125733 #b00000000000000000000000000001101)) (mask!10823 thiss!1504)))))

(assert (=> d!60855 d!60953))

(assert (=> d!60855 d!60831))

(declare-fun d!60955 () Bool)

(declare-fun e!162838 () Bool)

(assert (=> d!60955 e!162838))

(declare-fun res!122939 () Bool)

(assert (=> d!60955 (=> (not res!122939) (not e!162838))))

(declare-fun lt!125737 () ListLongMap!3711)

(assert (=> d!60955 (= res!122939 (contains!1798 lt!125737 (_1!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(declare-fun lt!125735 () List!3708)

(assert (=> d!60955 (= lt!125737 (ListLongMap!3712 lt!125735))))

(declare-fun lt!125736 () Unit!7735)

(declare-fun lt!125734 () Unit!7735)

(assert (=> d!60955 (= lt!125736 lt!125734)))

(assert (=> d!60955 (= (getValueByKey!297 lt!125735 (_1!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (=> d!60955 (= lt!125734 (lemmaContainsTupThenGetReturnValue!160 lt!125735 (_1!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (=> d!60955 (= lt!125735 (insertStrictlySorted!163 (toList!1871 call!23599) (_1!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))) (_2!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (=> d!60955 (= (+!674 call!23599 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))) lt!125737)))

(declare-fun b!251109 () Bool)

(declare-fun res!122938 () Bool)

(assert (=> b!251109 (=> (not res!122938) (not e!162838))))

(assert (=> b!251109 (= res!122938 (= (getValueByKey!297 (toList!1871 lt!125737) (_1!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (Some!302 (_2!2415 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(declare-fun b!251110 () Bool)

(assert (=> b!251110 (= e!162838 (contains!1802 (toList!1871 lt!125737) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))

(assert (= (and d!60955 res!122939) b!251109))

(assert (= (and b!251109 res!122938) b!251110))

(declare-fun m!266967 () Bool)

(assert (=> d!60955 m!266967))

(declare-fun m!266969 () Bool)

(assert (=> d!60955 m!266969))

(declare-fun m!266971 () Bool)

(assert (=> d!60955 m!266971))

(declare-fun m!266973 () Bool)

(assert (=> d!60955 m!266973))

(declare-fun m!266975 () Bool)

(assert (=> b!251109 m!266975))

(declare-fun m!266977 () Bool)

(assert (=> b!251110 m!266977))

(assert (=> b!250876 d!60955))

(assert (=> b!250904 d!60829))

(declare-fun d!60957 () Bool)

(assert (=> d!60957 (arrayNoDuplicates!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000000 Nil!3704)))

(assert (=> d!60957 true))

(declare-fun _$65!80 () Unit!7735)

(assert (=> d!60957 (= (choose!41 (_keys!6771 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704) _$65!80)))

(declare-fun bs!8974 () Bool)

(assert (= bs!8974 d!60957))

(assert (=> bs!8974 m!266463))

(assert (=> bs!8974 m!266635))

(assert (=> d!60837 d!60957))

(assert (=> bm!23565 d!60841))

(declare-fun bm!23613 () Bool)

(declare-fun call!23616 () Bool)

(declare-fun c!42240 () Bool)

(assert (=> bm!23613 (= call!23616 (arrayNoDuplicates!0 (_keys!6771 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42240 (Cons!3703 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000) Nil!3704) Nil!3704)))))

(declare-fun b!251111 () Bool)

(declare-fun e!162839 () Bool)

(assert (=> b!251111 (= e!162839 (contains!1801 Nil!3704 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60959 () Bool)

(declare-fun res!122940 () Bool)

(declare-fun e!162842 () Bool)

(assert (=> d!60959 (=> res!122940 e!162842)))

(assert (=> d!60959 (= res!122940 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60959 (= (arrayNoDuplicates!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 Nil!3704) e!162842)))

(declare-fun b!251112 () Bool)

(declare-fun e!162841 () Bool)

(assert (=> b!251112 (= e!162842 e!162841)))

(declare-fun res!122941 () Bool)

(assert (=> b!251112 (=> (not res!122941) (not e!162841))))

(assert (=> b!251112 (= res!122941 (not e!162839))))

(declare-fun res!122942 () Bool)

(assert (=> b!251112 (=> (not res!122942) (not e!162839))))

(assert (=> b!251112 (= res!122942 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251113 () Bool)

(declare-fun e!162840 () Bool)

(assert (=> b!251113 (= e!162841 e!162840)))

(assert (=> b!251113 (= c!42240 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251114 () Bool)

(assert (=> b!251114 (= e!162840 call!23616)))

(declare-fun b!251115 () Bool)

(assert (=> b!251115 (= e!162840 call!23616)))

(assert (= (and d!60959 (not res!122940)) b!251112))

(assert (= (and b!251112 res!122942) b!251111))

(assert (= (and b!251112 res!122941) b!251113))

(assert (= (and b!251113 c!42240) b!251114))

(assert (= (and b!251113 (not c!42240)) b!251115))

(assert (= (or b!251114 b!251115) bm!23613))

(assert (=> bm!23613 m!266613))

(declare-fun m!266979 () Bool)

(assert (=> bm!23613 m!266979))

(assert (=> b!251111 m!266613))

(assert (=> b!251111 m!266613))

(declare-fun m!266981 () Bool)

(assert (=> b!251111 m!266981))

(assert (=> b!251112 m!266613))

(assert (=> b!251112 m!266613))

(assert (=> b!251112 m!266615))

(assert (=> b!251113 m!266613))

(assert (=> b!251113 m!266613))

(assert (=> b!251113 m!266615))

(assert (=> b!250906 d!60959))

(declare-fun d!60961 () Bool)

(assert (=> d!60961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) (mask!10823 thiss!1504))))

(assert (=> d!60961 true))

(declare-fun _$56!27 () Unit!7735)

(assert (=> d!60961 (= (choose!102 key!932 (_keys!6771 thiss!1504) index!297 (mask!10823 thiss!1504)) _$56!27)))

(declare-fun bs!8975 () Bool)

(assert (= bs!8975 d!60961))

(assert (=> bs!8975 m!266463))

(assert (=> bs!8975 m!266643))

(assert (=> d!60843 d!60961))

(assert (=> d!60843 d!60831))

(declare-fun d!60963 () Bool)

(assert (=> d!60963 (= (apply!241 lt!125610 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2995 (getValueByKey!297 (toList!1871 lt!125610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8976 () Bool)

(assert (= bs!8976 d!60963))

(declare-fun m!266983 () Bool)

(assert (=> bs!8976 m!266983))

(assert (=> bs!8976 m!266983))

(declare-fun m!266985 () Bool)

(assert (=> bs!8976 m!266985))

(assert (=> b!250863 d!60963))

(declare-fun b!251128 () Bool)

(declare-fun e!162849 () SeekEntryResult!1122)

(assert (=> b!251128 (= e!162849 (MissingVacant!1122 (index!6660 lt!125629)))))

(declare-fun lt!125742 () SeekEntryResult!1122)

(declare-fun d!60965 () Bool)

(assert (=> d!60965 (and (or ((_ is Undefined!1122) lt!125742) (not ((_ is Found!1122) lt!125742)) (and (bvsge (index!6659 lt!125742) #b00000000000000000000000000000000) (bvslt (index!6659 lt!125742) (size!6176 (_keys!6771 thiss!1504))))) (or ((_ is Undefined!1122) lt!125742) ((_ is Found!1122) lt!125742) (not ((_ is MissingVacant!1122) lt!125742)) (not (= (index!6661 lt!125742) (index!6660 lt!125629))) (and (bvsge (index!6661 lt!125742) #b00000000000000000000000000000000) (bvslt (index!6661 lt!125742) (size!6176 (_keys!6771 thiss!1504))))) (or ((_ is Undefined!1122) lt!125742) (ite ((_ is Found!1122) lt!125742) (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6659 lt!125742)) key!932) (and ((_ is MissingVacant!1122) lt!125742) (= (index!6661 lt!125742) (index!6660 lt!125629)) (= (select (arr!5830 (_keys!6771 thiss!1504)) (index!6661 lt!125742)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!162850 () SeekEntryResult!1122)

(assert (=> d!60965 (= lt!125742 e!162850)))

(declare-fun c!42247 () Bool)

(assert (=> d!60965 (= c!42247 (bvsge (x!24689 lt!125629) #b01111111111111111111111111111110))))

(declare-fun lt!125743 () (_ BitVec 64))

(assert (=> d!60965 (= lt!125743 (select (arr!5830 (_keys!6771 thiss!1504)) (index!6660 lt!125629)))))

(assert (=> d!60965 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60965 (= (seekKeyOrZeroReturnVacant!0 (x!24689 lt!125629) (index!6660 lt!125629) (index!6660 lt!125629) key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)) lt!125742)))

(declare-fun b!251129 () Bool)

(declare-fun e!162851 () SeekEntryResult!1122)

(assert (=> b!251129 (= e!162850 e!162851)))

(declare-fun c!42249 () Bool)

(assert (=> b!251129 (= c!42249 (= lt!125743 key!932))))

(declare-fun b!251130 () Bool)

(declare-fun c!42248 () Bool)

(assert (=> b!251130 (= c!42248 (= lt!125743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251130 (= e!162851 e!162849)))

(declare-fun b!251131 () Bool)

(assert (=> b!251131 (= e!162850 Undefined!1122)))

(declare-fun b!251132 () Bool)

(assert (=> b!251132 (= e!162851 (Found!1122 (index!6660 lt!125629)))))

(declare-fun b!251133 () Bool)

(assert (=> b!251133 (= e!162849 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24689 lt!125629) #b00000000000000000000000000000001) (nextIndex!0 (index!6660 lt!125629) (x!24689 lt!125629) (mask!10823 thiss!1504)) (index!6660 lt!125629) key!932 (_keys!6771 thiss!1504) (mask!10823 thiss!1504)))))

(assert (= (and d!60965 c!42247) b!251131))

(assert (= (and d!60965 (not c!42247)) b!251129))

(assert (= (and b!251129 c!42249) b!251132))

(assert (= (and b!251129 (not c!42249)) b!251130))

(assert (= (and b!251130 c!42248) b!251128))

(assert (= (and b!251130 (not c!42248)) b!251133))

(declare-fun m!266987 () Bool)

(assert (=> d!60965 m!266987))

(declare-fun m!266989 () Bool)

(assert (=> d!60965 m!266989))

(assert (=> d!60965 m!266713))

(assert (=> d!60965 m!266455))

(declare-fun m!266991 () Bool)

(assert (=> b!251133 m!266991))

(assert (=> b!251133 m!266991))

(declare-fun m!266993 () Bool)

(assert (=> b!251133 m!266993))

(assert (=> b!250894 d!60965))

(declare-fun d!60967 () Bool)

(declare-fun e!162852 () Bool)

(assert (=> d!60967 e!162852))

(declare-fun res!122943 () Bool)

(assert (=> d!60967 (=> res!122943 e!162852)))

(declare-fun lt!125746 () Bool)

(assert (=> d!60967 (= res!122943 (not lt!125746))))

(declare-fun lt!125745 () Bool)

(assert (=> d!60967 (= lt!125746 lt!125745)))

(declare-fun lt!125744 () Unit!7735)

(declare-fun e!162853 () Unit!7735)

(assert (=> d!60967 (= lt!125744 e!162853)))

(declare-fun c!42250 () Bool)

(assert (=> d!60967 (= c!42250 lt!125745)))

(assert (=> d!60967 (= lt!125745 (containsKey!289 (toList!1871 lt!125610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60967 (= (contains!1798 lt!125610 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125746)))

(declare-fun b!251134 () Bool)

(declare-fun lt!125747 () Unit!7735)

(assert (=> b!251134 (= e!162853 lt!125747)))

(assert (=> b!251134 (= lt!125747 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1871 lt!125610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251134 (isDefined!239 (getValueByKey!297 (toList!1871 lt!125610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251135 () Bool)

(declare-fun Unit!7752 () Unit!7735)

(assert (=> b!251135 (= e!162853 Unit!7752)))

(declare-fun b!251136 () Bool)

(assert (=> b!251136 (= e!162852 (isDefined!239 (getValueByKey!297 (toList!1871 lt!125610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60967 c!42250) b!251134))

(assert (= (and d!60967 (not c!42250)) b!251135))

(assert (= (and d!60967 (not res!122943)) b!251136))

(declare-fun m!266995 () Bool)

(assert (=> d!60967 m!266995))

(declare-fun m!266997 () Bool)

(assert (=> b!251134 m!266997))

(assert (=> b!251134 m!266983))

(assert (=> b!251134 m!266983))

(declare-fun m!266999 () Bool)

(assert (=> b!251134 m!266999))

(assert (=> b!251136 m!266983))

(assert (=> b!251136 m!266983))

(assert (=> b!251136 m!266999))

(assert (=> bm!23596 d!60967))

(declare-fun b!251138 () Bool)

(declare-fun e!162854 () (_ BitVec 32))

(declare-fun call!23617 () (_ BitVec 32))

(assert (=> b!251138 (= e!162854 call!23617)))

(declare-fun b!251139 () Bool)

(assert (=> b!251139 (= e!162854 (bvadd #b00000000000000000000000000000001 call!23617))))

(declare-fun b!251140 () Bool)

(declare-fun e!162855 () (_ BitVec 32))

(assert (=> b!251140 (= e!162855 #b00000000000000000000000000000000)))

(declare-fun bm!23614 () Bool)

(assert (=> bm!23614 (= call!23617 (arrayCountValidKeys!0 (_keys!6771 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(declare-fun d!60969 () Bool)

(declare-fun lt!125748 () (_ BitVec 32))

(assert (=> d!60969 (and (bvsge lt!125748 #b00000000000000000000000000000000) (bvsle lt!125748 (bvsub (size!6176 (_keys!6771 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60969 (= lt!125748 e!162855)))

(declare-fun c!42251 () Bool)

(assert (=> d!60969 (= c!42251 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60969 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6771 thiss!1504)) (size!6176 (_keys!6771 thiss!1504))))))

(assert (=> d!60969 (= (arrayCountValidKeys!0 (_keys!6771 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6771 thiss!1504))) lt!125748)))

(declare-fun b!251137 () Bool)

(assert (=> b!251137 (= e!162855 e!162854)))

(declare-fun c!42252 () Bool)

(assert (=> b!251137 (= c!42252 (validKeyInArray!0 (select (arr!5830 (_keys!6771 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60969 c!42251) b!251140))

(assert (= (and d!60969 (not c!42251)) b!251137))

(assert (= (and b!251137 c!42252) b!251139))

(assert (= (and b!251137 (not c!42252)) b!251138))

(assert (= (or b!251139 b!251138) bm!23614))

(declare-fun m!267001 () Bool)

(assert (=> bm!23614 m!267001))

(assert (=> b!251137 m!266923))

(assert (=> b!251137 m!266923))

(declare-fun m!267003 () Bool)

(assert (=> b!251137 m!267003))

(assert (=> bm!23568 d!60969))

(assert (=> b!250753 d!60929))

(declare-fun d!60971 () Bool)

(assert (=> d!60971 (arrayContainsKey!0 lt!125440 lt!125529 #b00000000000000000000000000000000)))

(declare-fun lt!125751 () Unit!7735)

(declare-fun choose!13 (array!12299 (_ BitVec 64) (_ BitVec 32)) Unit!7735)

(assert (=> d!60971 (= lt!125751 (choose!13 lt!125440 lt!125529 #b00000000000000000000000000000000))))

(assert (=> d!60971 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60971 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125440 lt!125529 #b00000000000000000000000000000000) lt!125751)))

(declare-fun bs!8977 () Bool)

(assert (= bs!8977 d!60971))

(assert (=> bs!8977 m!266629))

(declare-fun m!267005 () Bool)

(assert (=> bs!8977 m!267005))

(assert (=> b!250782 d!60971))

(declare-fun d!60973 () Bool)

(declare-fun res!122944 () Bool)

(declare-fun e!162856 () Bool)

(assert (=> d!60973 (=> res!122944 e!162856)))

(assert (=> d!60973 (= res!122944 (= (select (arr!5830 lt!125440) #b00000000000000000000000000000000) lt!125529))))

(assert (=> d!60973 (= (arrayContainsKey!0 lt!125440 lt!125529 #b00000000000000000000000000000000) e!162856)))

(declare-fun b!251141 () Bool)

(declare-fun e!162857 () Bool)

(assert (=> b!251141 (= e!162856 e!162857)))

(declare-fun res!122945 () Bool)

(assert (=> b!251141 (=> (not res!122945) (not e!162857))))

(assert (=> b!251141 (= res!122945 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 lt!125440)))))

(declare-fun b!251142 () Bool)

(assert (=> b!251142 (= e!162857 (arrayContainsKey!0 lt!125440 lt!125529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60973 (not res!122944)) b!251141))

(assert (= (and b!251141 res!122945) b!251142))

(assert (=> d!60973 m!266617))

(declare-fun m!267007 () Bool)

(assert (=> b!251142 m!267007))

(assert (=> b!250782 d!60973))

(declare-fun b!251143 () Bool)

(declare-fun e!162860 () SeekEntryResult!1122)

(declare-fun e!162859 () SeekEntryResult!1122)

(assert (=> b!251143 (= e!162860 e!162859)))

(declare-fun lt!125752 () (_ BitVec 64))

(declare-fun lt!125754 () SeekEntryResult!1122)

(assert (=> b!251143 (= lt!125752 (select (arr!5830 lt!125440) (index!6660 lt!125754)))))

(declare-fun c!42253 () Bool)

(assert (=> b!251143 (= c!42253 (= lt!125752 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun b!251144 () Bool)

(assert (=> b!251144 (= e!162860 Undefined!1122)))

(declare-fun e!162858 () SeekEntryResult!1122)

(declare-fun b!251145 () Bool)

(assert (=> b!251145 (= e!162858 (seekKeyOrZeroReturnVacant!0 (x!24689 lt!125754) (index!6660 lt!125754) (index!6660 lt!125754) (select (arr!5830 lt!125440) #b00000000000000000000000000000000) lt!125440 (mask!10823 thiss!1504)))))

(declare-fun b!251146 () Bool)

(declare-fun c!42254 () Bool)

(assert (=> b!251146 (= c!42254 (= lt!125752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251146 (= e!162859 e!162858)))

(declare-fun d!60975 () Bool)

(declare-fun lt!125753 () SeekEntryResult!1122)

(assert (=> d!60975 (and (or ((_ is Undefined!1122) lt!125753) (not ((_ is Found!1122) lt!125753)) (and (bvsge (index!6659 lt!125753) #b00000000000000000000000000000000) (bvslt (index!6659 lt!125753) (size!6176 lt!125440)))) (or ((_ is Undefined!1122) lt!125753) ((_ is Found!1122) lt!125753) (not ((_ is MissingZero!1122) lt!125753)) (and (bvsge (index!6658 lt!125753) #b00000000000000000000000000000000) (bvslt (index!6658 lt!125753) (size!6176 lt!125440)))) (or ((_ is Undefined!1122) lt!125753) ((_ is Found!1122) lt!125753) ((_ is MissingZero!1122) lt!125753) (not ((_ is MissingVacant!1122) lt!125753)) (and (bvsge (index!6661 lt!125753) #b00000000000000000000000000000000) (bvslt (index!6661 lt!125753) (size!6176 lt!125440)))) (or ((_ is Undefined!1122) lt!125753) (ite ((_ is Found!1122) lt!125753) (= (select (arr!5830 lt!125440) (index!6659 lt!125753)) (select (arr!5830 lt!125440) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1122) lt!125753) (= (select (arr!5830 lt!125440) (index!6658 lt!125753)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1122) lt!125753) (= (select (arr!5830 lt!125440) (index!6661 lt!125753)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60975 (= lt!125753 e!162860)))

(declare-fun c!42255 () Bool)

(assert (=> d!60975 (= c!42255 (and ((_ is Intermediate!1122) lt!125754) (undefined!1934 lt!125754)))))

(assert (=> d!60975 (= lt!125754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) (mask!10823 thiss!1504)) (select (arr!5830 lt!125440) #b00000000000000000000000000000000) lt!125440 (mask!10823 thiss!1504)))))

(assert (=> d!60975 (validMask!0 (mask!10823 thiss!1504))))

(assert (=> d!60975 (= (seekEntryOrOpen!0 (select (arr!5830 lt!125440) #b00000000000000000000000000000000) lt!125440 (mask!10823 thiss!1504)) lt!125753)))

(declare-fun b!251147 () Bool)

(assert (=> b!251147 (= e!162859 (Found!1122 (index!6660 lt!125754)))))

(declare-fun b!251148 () Bool)

(assert (=> b!251148 (= e!162858 (MissingZero!1122 (index!6660 lt!125754)))))

(assert (= (and d!60975 c!42255) b!251144))

(assert (= (and d!60975 (not c!42255)) b!251143))

(assert (= (and b!251143 c!42253) b!251147))

(assert (= (and b!251143 (not c!42253)) b!251146))

(assert (= (and b!251146 c!42254) b!251148))

(assert (= (and b!251146 (not c!42254)) b!251145))

(declare-fun m!267009 () Bool)

(assert (=> b!251143 m!267009))

(assert (=> b!251145 m!266617))

(declare-fun m!267011 () Bool)

(assert (=> b!251145 m!267011))

(assert (=> d!60975 m!266455))

(declare-fun m!267013 () Bool)

(assert (=> d!60975 m!267013))

(declare-fun m!267015 () Bool)

(assert (=> d!60975 m!267015))

(assert (=> d!60975 m!266617))

(declare-fun m!267017 () Bool)

(assert (=> d!60975 m!267017))

(assert (=> d!60975 m!267017))

(assert (=> d!60975 m!266617))

(declare-fun m!267019 () Bool)

(assert (=> d!60975 m!267019))

(declare-fun m!267021 () Bool)

(assert (=> d!60975 m!267021))

(assert (=> b!250782 d!60975))

(declare-fun d!60977 () Bool)

(declare-fun lt!125757 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!166 (List!3707) (InoxSet (_ BitVec 64)))

(assert (=> d!60977 (= lt!125757 (select (content!166 Nil!3704) (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun e!162865 () Bool)

(assert (=> d!60977 (= lt!125757 e!162865)))

(declare-fun res!122951 () Bool)

(assert (=> d!60977 (=> (not res!122951) (not e!162865))))

(assert (=> d!60977 (= res!122951 ((_ is Cons!3703) Nil!3704))))

(assert (=> d!60977 (= (contains!1801 Nil!3704 (select (arr!5830 lt!125440) #b00000000000000000000000000000000)) lt!125757)))

(declare-fun b!251153 () Bool)

(declare-fun e!162866 () Bool)

(assert (=> b!251153 (= e!162865 e!162866)))

(declare-fun res!122950 () Bool)

(assert (=> b!251153 (=> res!122950 e!162866)))

(assert (=> b!251153 (= res!122950 (= (h!4363 Nil!3704) (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(declare-fun b!251154 () Bool)

(assert (=> b!251154 (= e!162866 (contains!1801 (t!8733 Nil!3704) (select (arr!5830 lt!125440) #b00000000000000000000000000000000)))))

(assert (= (and d!60977 res!122951) b!251153))

(assert (= (and b!251153 (not res!122950)) b!251154))

(declare-fun m!267023 () Bool)

(assert (=> d!60977 m!267023))

(assert (=> d!60977 m!266617))

(declare-fun m!267025 () Bool)

(assert (=> d!60977 m!267025))

(assert (=> b!251154 m!266617))

(declare-fun m!267027 () Bool)

(assert (=> b!251154 m!267027))

(assert (=> b!250767 d!60977))

(declare-fun d!60979 () Bool)

(assert (=> d!60979 (= (inRange!0 (index!6659 lt!125542) (mask!10823 thiss!1504)) (and (bvsge (index!6659 lt!125542) #b00000000000000000000000000000000) (bvslt (index!6659 lt!125542) (bvadd (mask!10823 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250804 d!60979))

(assert (=> b!250769 d!60871))

(declare-fun d!60981 () Bool)

(assert (=> d!60981 (= (arrayCountValidKeys!0 (array!12300 (store (arr!5830 (_keys!6771 thiss!1504)) index!297 key!932) (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6771 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6771 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60981 true))

(declare-fun _$84!30 () Unit!7735)

(assert (=> d!60981 (= (choose!1 (_keys!6771 thiss!1504) index!297 key!932) _$84!30)))

(declare-fun bs!8978 () Bool)

(assert (= bs!8978 d!60981))

(assert (=> bs!8978 m!266463))

(assert (=> bs!8978 m!266603))

(assert (=> bs!8978 m!266465))

(assert (=> d!60827 d!60981))

(declare-fun b!251156 () Bool)

(declare-fun e!162867 () Bool)

(assert (=> b!251156 (= e!162867 tp_is_empty!6493)))

(declare-fun condMapEmpty!11045 () Bool)

(declare-fun mapDefault!11045 () ValueCell!2903)

(assert (=> mapNonEmpty!11044 (= condMapEmpty!11045 (= mapRest!11044 ((as const (Array (_ BitVec 32) ValueCell!2903)) mapDefault!11045)))))

(declare-fun mapRes!11045 () Bool)

(assert (=> mapNonEmpty!11044 (= tp!23176 (and e!162867 mapRes!11045))))

(declare-fun mapNonEmpty!11045 () Bool)

(declare-fun tp!23177 () Bool)

(declare-fun e!162868 () Bool)

(assert (=> mapNonEmpty!11045 (= mapRes!11045 (and tp!23177 e!162868))))

(declare-fun mapValue!11045 () ValueCell!2903)

(declare-fun mapKey!11045 () (_ BitVec 32))

(declare-fun mapRest!11045 () (Array (_ BitVec 32) ValueCell!2903))

(assert (=> mapNonEmpty!11045 (= mapRest!11044 (store mapRest!11045 mapKey!11045 mapValue!11045))))

(declare-fun b!251155 () Bool)

(assert (=> b!251155 (= e!162868 tp_is_empty!6493)))

(declare-fun mapIsEmpty!11045 () Bool)

(assert (=> mapIsEmpty!11045 mapRes!11045))

(assert (= (and mapNonEmpty!11044 condMapEmpty!11045) mapIsEmpty!11045))

(assert (= (and mapNonEmpty!11044 (not condMapEmpty!11045)) mapNonEmpty!11045))

(assert (= (and mapNonEmpty!11045 ((_ is ValueCellFull!2903) mapValue!11045)) b!251155))

(assert (= (and mapNonEmpty!11044 ((_ is ValueCellFull!2903) mapDefault!11045)) b!251156))

(declare-fun m!267029 () Bool)

(assert (=> mapNonEmpty!11045 m!267029))

(declare-fun b_lambda!8081 () Bool)

(assert (= b_lambda!8077 (or (and b!250577 b_free!6631) b_lambda!8081)))

(declare-fun b_lambda!8083 () Bool)

(assert (= b_lambda!8079 (or (and b!250577 b_free!6631) b_lambda!8083)))

(check-sat (not d!60909) (not b!251142) (not b!250923) (not mapNonEmpty!11045) (not d!60887) (not b!251071) (not b!251041) (not d!60961) (not b_next!6631) (not b!251110) (not b!251137) (not b!251072) (not b!251145) (not b!251000) (not b!251069) (not bm!23603) (not b!251037) (not b!251031) (not b!250941) (not bm!23610) (not d!60975) (not b!251113) (not bm!23613) (not b_lambda!8075) (not d!60967) (not b!251030) (not b!251081) (not b!251002) (not b!250940) (not b!251154) (not b!250997) (not d!60915) (not bm!23612) (not d!60895) (not b!251134) (not d!60943) (not d!60963) (not b!250999) (not b!250917) (not d!60889) (not d!60873) (not d!60965) (not b!250979) (not d!60877) (not bm!23605) (not d!60981) (not b!251036) (not b!251004) (not b!250929) (not d!60931) (not d!60919) (not b!250995) (not b!250986) (not d!60945) (not b!250945) (not b_lambda!8081) (not b!251108) (not b!251112) (not d!60957) tp_is_empty!6493 (not b!250944) (not d!60905) (not bm!23611) (not b!250985) (not d!60903) (not b!250994) b_and!13637 (not bm!23598) (not b_lambda!8083) (not d!60951) (not b!251133) (not b!251136) (not b!251023) (not d!60869) (not b!251109) (not d!60911) (not d!60885) (not b!250930) (not b!251032) (not bm!23614) (not b!250977) (not bm!23602) (not d!60899) (not d!60881) (not d!60917) (not b!250951) (not b!251006) (not d!60923) (not b!251028) (not d!60893) (not d!60891) (not b!250987) (not b!251017) (not d!60913) (not b!251038) (not b!251033) (not b!250980) (not bm!23601) (not bm!23604) (not b!250983) (not d!60907) (not b!250952) (not b!250916) (not d!60875) (not b!251111) (not b!251024) (not bm!23597) (not b!251001) (not b!251021) (not b!251027) (not b!250998) (not b!250982) (not d!60971) (not d!60955) (not d!60901) (not d!60977) (not d!60897))
(check-sat b_and!13637 (not b_next!6631))
