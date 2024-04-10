; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22008 () Bool)

(assert start!22008)

(declare-fun b!226497 () Bool)

(declare-fun b_free!6075 () Bool)

(declare-fun b_next!6075 () Bool)

(assert (=> b!226497 (= b_free!6075 (not b_next!6075))))

(declare-fun tp!21366 () Bool)

(declare-fun b_and!12973 () Bool)

(assert (=> b!226497 (= tp!21366 b_and!12973)))

(declare-fun b!226477 () Bool)

(declare-fun e!146949 () Bool)

(declare-fun e!146940 () Bool)

(assert (=> b!226477 (= e!146949 e!146940)))

(declare-fun res!111488 () Bool)

(assert (=> b!226477 (=> (not res!111488) (not e!146940))))

(declare-datatypes ((SeekEntryResult!883 0))(
  ( (MissingZero!883 (index!5702 (_ BitVec 32))) (Found!883 (index!5703 (_ BitVec 32))) (Intermediate!883 (undefined!1695 Bool) (index!5704 (_ BitVec 32)) (x!23231 (_ BitVec 32))) (Undefined!883) (MissingVacant!883 (index!5705 (_ BitVec 32))) )
))
(declare-fun lt!114009 () SeekEntryResult!883)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226477 (= res!111488 (or (= lt!114009 (MissingZero!883 index!297)) (= lt!114009 (MissingVacant!883 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7563 0))(
  ( (V!7564 (val!3013 Int)) )
))
(declare-datatypes ((ValueCell!2625 0))(
  ( (ValueCellFull!2625 (v!5033 V!7563)) (EmptyCell!2625) )
))
(declare-datatypes ((array!11117 0))(
  ( (array!11118 (arr!5278 (Array (_ BitVec 32) ValueCell!2625)) (size!5611 (_ BitVec 32))) )
))
(declare-datatypes ((array!11119 0))(
  ( (array!11120 (arr!5279 (Array (_ BitVec 32) (_ BitVec 64))) (size!5612 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3150 0))(
  ( (LongMapFixedSize!3151 (defaultEntry!4234 Int) (mask!10086 (_ BitVec 32)) (extraKeys!3971 (_ BitVec 32)) (zeroValue!4075 V!7563) (minValue!4075 V!7563) (_size!1624 (_ BitVec 32)) (_keys!6288 array!11119) (_values!4217 array!11117) (_vacant!1624 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3150)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11119 (_ BitVec 32)) SeekEntryResult!883)

(assert (=> b!226477 (= lt!114009 (seekEntryOrOpen!0 key!932 (_keys!6288 thiss!1504) (mask!10086 thiss!1504)))))

(declare-fun b!226478 () Bool)

(declare-fun e!146944 () Bool)

(declare-fun e!146942 () Bool)

(assert (=> b!226478 (= e!146944 e!146942)))

(declare-fun res!111496 () Bool)

(declare-fun call!21059 () Bool)

(assert (=> b!226478 (= res!111496 call!21059)))

(assert (=> b!226478 (=> (not res!111496) (not e!146942))))

(declare-fun bm!21056 () Bool)

(declare-fun call!21060 () Bool)

(declare-fun arrayContainsKey!0 (array!11119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21056 (= call!21060 (arrayContainsKey!0 (_keys!6288 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226480 () Bool)

(declare-fun res!111495 () Bool)

(declare-fun e!146947 () Bool)

(assert (=> b!226480 (=> res!111495 e!146947)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11119 (_ BitVec 32)) Bool)

(assert (=> b!226480 (= res!111495 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6288 thiss!1504) (mask!10086 thiss!1504))))))

(declare-fun b!226481 () Bool)

(declare-fun res!111498 () Bool)

(declare-fun e!146943 () Bool)

(assert (=> b!226481 (=> (not res!111498) (not e!146943))))

(assert (=> b!226481 (= res!111498 call!21059)))

(declare-fun e!146946 () Bool)

(assert (=> b!226481 (= e!146946 e!146943)))

(declare-fun b!226482 () Bool)

(assert (=> b!226482 (= e!146947 true)))

(declare-fun lt!114010 () Bool)

(declare-datatypes ((List!3375 0))(
  ( (Nil!3372) (Cons!3371 (h!4019 (_ BitVec 64)) (t!8334 List!3375)) )
))
(declare-fun arrayNoDuplicates!0 (array!11119 (_ BitVec 32) List!3375) Bool)

(assert (=> b!226482 (= lt!114010 (arrayNoDuplicates!0 (_keys!6288 thiss!1504) #b00000000000000000000000000000000 Nil!3372))))

(declare-fun b!226483 () Bool)

(declare-fun e!146951 () Bool)

(declare-fun tp_is_empty!5937 () Bool)

(assert (=> b!226483 (= e!146951 tp_is_empty!5937)))

(declare-fun b!226484 () Bool)

(declare-datatypes ((Unit!6850 0))(
  ( (Unit!6851) )
))
(declare-fun e!146945 () Unit!6850)

(declare-fun Unit!6852 () Unit!6850)

(assert (=> b!226484 (= e!146945 Unit!6852)))

(declare-fun lt!114005 () Unit!6850)

(declare-fun lemmaArrayContainsKeyThenInListMap!95 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7563 V!7563 (_ BitVec 64) (_ BitVec 32) Int) Unit!6850)

(assert (=> b!226484 (= lt!114005 (lemmaArrayContainsKeyThenInListMap!95 (_keys!6288 thiss!1504) (_values!4217 thiss!1504) (mask!10086 thiss!1504) (extraKeys!3971 thiss!1504) (zeroValue!4075 thiss!1504) (minValue!4075 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4234 thiss!1504)))))

(assert (=> b!226484 false))

(declare-fun b!226485 () Bool)

(declare-fun res!111487 () Bool)

(assert (=> b!226485 (=> (not res!111487) (not e!146943))))

(assert (=> b!226485 (= res!111487 (= (select (arr!5279 (_keys!6288 thiss!1504)) (index!5702 lt!114009)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226486 () Bool)

(declare-fun e!146953 () Unit!6850)

(declare-fun Unit!6853 () Unit!6850)

(assert (=> b!226486 (= e!146953 Unit!6853)))

(declare-fun lt!114003 () Unit!6850)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!257 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7563 V!7563 (_ BitVec 64) Int) Unit!6850)

(assert (=> b!226486 (= lt!114003 (lemmaInListMapThenSeekEntryOrOpenFindsIt!257 (_keys!6288 thiss!1504) (_values!4217 thiss!1504) (mask!10086 thiss!1504) (extraKeys!3971 thiss!1504) (zeroValue!4075 thiss!1504) (minValue!4075 thiss!1504) key!932 (defaultEntry!4234 thiss!1504)))))

(assert (=> b!226486 false))

(declare-fun b!226487 () Bool)

(declare-fun res!111499 () Bool)

(assert (=> b!226487 (=> res!111499 e!146947)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226487 (= res!111499 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226488 () Bool)

(declare-fun c!37545 () Bool)

(get-info :version)

(assert (=> b!226488 (= c!37545 ((_ is MissingVacant!883) lt!114009))))

(assert (=> b!226488 (= e!146946 e!146944)))

(declare-fun mapIsEmpty!10075 () Bool)

(declare-fun mapRes!10075 () Bool)

(assert (=> mapIsEmpty!10075 mapRes!10075))

(declare-fun b!226489 () Bool)

(declare-fun e!146948 () Bool)

(declare-fun e!146952 () Bool)

(assert (=> b!226489 (= e!146948 (and e!146952 mapRes!10075))))

(declare-fun condMapEmpty!10075 () Bool)

(declare-fun mapDefault!10075 () ValueCell!2625)

(assert (=> b!226489 (= condMapEmpty!10075 (= (arr!5278 (_values!4217 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2625)) mapDefault!10075)))))

(declare-fun b!226490 () Bool)

(declare-fun res!111490 () Bool)

(assert (=> b!226490 (=> res!111490 e!146947)))

(declare-fun lt!114004 () Bool)

(assert (=> b!226490 (= res!111490 lt!114004)))

(declare-fun mapNonEmpty!10075 () Bool)

(declare-fun tp!21367 () Bool)

(assert (=> mapNonEmpty!10075 (= mapRes!10075 (and tp!21367 e!146951))))

(declare-fun mapRest!10075 () (Array (_ BitVec 32) ValueCell!2625))

(declare-fun mapValue!10075 () ValueCell!2625)

(declare-fun mapKey!10075 () (_ BitVec 32))

(assert (=> mapNonEmpty!10075 (= (arr!5278 (_values!4217 thiss!1504)) (store mapRest!10075 mapKey!10075 mapValue!10075))))

(declare-fun b!226491 () Bool)

(assert (=> b!226491 (= e!146942 (not call!21060))))

(declare-fun b!226492 () Bool)

(declare-fun lt!114007 () Unit!6850)

(assert (=> b!226492 (= e!146953 lt!114007)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!269 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7563 V!7563 (_ BitVec 64) Int) Unit!6850)

(assert (=> b!226492 (= lt!114007 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!269 (_keys!6288 thiss!1504) (_values!4217 thiss!1504) (mask!10086 thiss!1504) (extraKeys!3971 thiss!1504) (zeroValue!4075 thiss!1504) (minValue!4075 thiss!1504) key!932 (defaultEntry!4234 thiss!1504)))))

(declare-fun c!37546 () Bool)

(assert (=> b!226492 (= c!37546 ((_ is MissingZero!883) lt!114009))))

(assert (=> b!226492 e!146946))

(declare-fun b!226493 () Bool)

(assert (=> b!226493 (= e!146944 ((_ is Undefined!883) lt!114009))))

(declare-fun b!226494 () Bool)

(declare-fun res!111491 () Bool)

(assert (=> b!226494 (=> (not res!111491) (not e!146949))))

(assert (=> b!226494 (= res!111491 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226495 () Bool)

(declare-fun res!111493 () Bool)

(assert (=> b!226495 (= res!111493 (= (select (arr!5279 (_keys!6288 thiss!1504)) (index!5705 lt!114009)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226495 (=> (not res!111493) (not e!146942))))

(declare-fun b!226479 () Bool)

(declare-fun res!111494 () Bool)

(assert (=> b!226479 (=> res!111494 e!146947)))

(assert (=> b!226479 (= res!111494 (or (not (= (size!5612 (_keys!6288 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10086 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5612 (_keys!6288 thiss!1504)))))))

(declare-fun res!111489 () Bool)

(assert (=> start!22008 (=> (not res!111489) (not e!146949))))

(declare-fun valid!1268 (LongMapFixedSize!3150) Bool)

(assert (=> start!22008 (= res!111489 (valid!1268 thiss!1504))))

(assert (=> start!22008 e!146949))

(declare-fun e!146941 () Bool)

(assert (=> start!22008 e!146941))

(assert (=> start!22008 true))

(declare-fun b!226496 () Bool)

(declare-fun e!146950 () Bool)

(assert (=> b!226496 (= e!146940 e!146950)))

(declare-fun res!111492 () Bool)

(assert (=> b!226496 (=> (not res!111492) (not e!146950))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226496 (= res!111492 (inRange!0 index!297 (mask!10086 thiss!1504)))))

(declare-fun lt!114006 () Unit!6850)

(assert (=> b!226496 (= lt!114006 e!146953)))

(declare-fun c!37548 () Bool)

(declare-datatypes ((tuple2!4458 0))(
  ( (tuple2!4459 (_1!2240 (_ BitVec 64)) (_2!2240 V!7563)) )
))
(declare-datatypes ((List!3376 0))(
  ( (Nil!3373) (Cons!3372 (h!4020 tuple2!4458) (t!8335 List!3376)) )
))
(declare-datatypes ((ListLongMap!3371 0))(
  ( (ListLongMap!3372 (toList!1701 List!3376)) )
))
(declare-fun contains!1575 (ListLongMap!3371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1229 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7563 V!7563 (_ BitVec 32) Int) ListLongMap!3371)

(assert (=> b!226496 (= c!37548 (contains!1575 (getCurrentListMap!1229 (_keys!6288 thiss!1504) (_values!4217 thiss!1504) (mask!10086 thiss!1504) (extraKeys!3971 thiss!1504) (zeroValue!4075 thiss!1504) (minValue!4075 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4234 thiss!1504)) key!932))))

(declare-fun array_inv!3491 (array!11119) Bool)

(declare-fun array_inv!3492 (array!11117) Bool)

(assert (=> b!226497 (= e!146941 (and tp!21366 tp_is_empty!5937 (array_inv!3491 (_keys!6288 thiss!1504)) (array_inv!3492 (_values!4217 thiss!1504)) e!146948))))

(declare-fun b!226498 () Bool)

(assert (=> b!226498 (= e!146950 (not e!146947))))

(declare-fun res!111497 () Bool)

(assert (=> b!226498 (=> res!111497 e!146947)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226498 (= res!111497 (not (validMask!0 (mask!10086 thiss!1504))))))

(declare-fun lt!114002 () array!11119)

(declare-fun arrayCountValidKeys!0 (array!11119 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226498 (= (arrayCountValidKeys!0 lt!114002 #b00000000000000000000000000000000 (size!5612 (_keys!6288 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6288 thiss!1504) #b00000000000000000000000000000000 (size!5612 (_keys!6288 thiss!1504)))))))

(declare-fun lt!114001 () Unit!6850)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11119 (_ BitVec 32) (_ BitVec 64)) Unit!6850)

(assert (=> b!226498 (= lt!114001 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6288 thiss!1504) index!297 key!932))))

(assert (=> b!226498 (arrayNoDuplicates!0 lt!114002 #b00000000000000000000000000000000 Nil!3372)))

(assert (=> b!226498 (= lt!114002 (array!11120 (store (arr!5279 (_keys!6288 thiss!1504)) index!297 key!932) (size!5612 (_keys!6288 thiss!1504))))))

(declare-fun lt!114008 () Unit!6850)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3375) Unit!6850)

(assert (=> b!226498 (= lt!114008 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6288 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3372))))

(declare-fun lt!114011 () Unit!6850)

(assert (=> b!226498 (= lt!114011 e!146945)))

(declare-fun c!37547 () Bool)

(assert (=> b!226498 (= c!37547 lt!114004)))

(assert (=> b!226498 (= lt!114004 (arrayContainsKey!0 (_keys!6288 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21057 () Bool)

(assert (=> bm!21057 (= call!21059 (inRange!0 (ite c!37546 (index!5702 lt!114009) (index!5705 lt!114009)) (mask!10086 thiss!1504)))))

(declare-fun b!226499 () Bool)

(assert (=> b!226499 (= e!146943 (not call!21060))))

(declare-fun b!226500 () Bool)

(assert (=> b!226500 (= e!146952 tp_is_empty!5937)))

(declare-fun b!226501 () Bool)

(declare-fun Unit!6854 () Unit!6850)

(assert (=> b!226501 (= e!146945 Unit!6854)))

(assert (= (and start!22008 res!111489) b!226494))

(assert (= (and b!226494 res!111491) b!226477))

(assert (= (and b!226477 res!111488) b!226496))

(assert (= (and b!226496 c!37548) b!226486))

(assert (= (and b!226496 (not c!37548)) b!226492))

(assert (= (and b!226492 c!37546) b!226481))

(assert (= (and b!226492 (not c!37546)) b!226488))

(assert (= (and b!226481 res!111498) b!226485))

(assert (= (and b!226485 res!111487) b!226499))

(assert (= (and b!226488 c!37545) b!226478))

(assert (= (and b!226488 (not c!37545)) b!226493))

(assert (= (and b!226478 res!111496) b!226495))

(assert (= (and b!226495 res!111493) b!226491))

(assert (= (or b!226481 b!226478) bm!21057))

(assert (= (or b!226499 b!226491) bm!21056))

(assert (= (and b!226496 res!111492) b!226498))

(assert (= (and b!226498 c!37547) b!226484))

(assert (= (and b!226498 (not c!37547)) b!226501))

(assert (= (and b!226498 (not res!111497)) b!226479))

(assert (= (and b!226479 (not res!111494)) b!226487))

(assert (= (and b!226487 (not res!111499)) b!226490))

(assert (= (and b!226490 (not res!111490)) b!226480))

(assert (= (and b!226480 (not res!111495)) b!226482))

(assert (= (and b!226489 condMapEmpty!10075) mapIsEmpty!10075))

(assert (= (and b!226489 (not condMapEmpty!10075)) mapNonEmpty!10075))

(assert (= (and mapNonEmpty!10075 ((_ is ValueCellFull!2625) mapValue!10075)) b!226483))

(assert (= (and b!226489 ((_ is ValueCellFull!2625) mapDefault!10075)) b!226500))

(assert (= b!226497 b!226489))

(assert (= start!22008 b!226497))

(declare-fun m!248749 () Bool)

(assert (=> mapNonEmpty!10075 m!248749))

(declare-fun m!248751 () Bool)

(assert (=> bm!21057 m!248751))

(declare-fun m!248753 () Bool)

(assert (=> b!226498 m!248753))

(declare-fun m!248755 () Bool)

(assert (=> b!226498 m!248755))

(declare-fun m!248757 () Bool)

(assert (=> b!226498 m!248757))

(declare-fun m!248759 () Bool)

(assert (=> b!226498 m!248759))

(declare-fun m!248761 () Bool)

(assert (=> b!226498 m!248761))

(declare-fun m!248763 () Bool)

(assert (=> b!226498 m!248763))

(declare-fun m!248765 () Bool)

(assert (=> b!226498 m!248765))

(declare-fun m!248767 () Bool)

(assert (=> b!226498 m!248767))

(declare-fun m!248769 () Bool)

(assert (=> b!226486 m!248769))

(declare-fun m!248771 () Bool)

(assert (=> b!226497 m!248771))

(declare-fun m!248773 () Bool)

(assert (=> b!226497 m!248773))

(declare-fun m!248775 () Bool)

(assert (=> b!226496 m!248775))

(declare-fun m!248777 () Bool)

(assert (=> b!226496 m!248777))

(assert (=> b!226496 m!248777))

(declare-fun m!248779 () Bool)

(assert (=> b!226496 m!248779))

(declare-fun m!248781 () Bool)

(assert (=> b!226480 m!248781))

(declare-fun m!248783 () Bool)

(assert (=> b!226477 m!248783))

(declare-fun m!248785 () Bool)

(assert (=> b!226487 m!248785))

(declare-fun m!248787 () Bool)

(assert (=> b!226492 m!248787))

(declare-fun m!248789 () Bool)

(assert (=> b!226495 m!248789))

(declare-fun m!248791 () Bool)

(assert (=> b!226482 m!248791))

(declare-fun m!248793 () Bool)

(assert (=> b!226485 m!248793))

(assert (=> bm!21056 m!248755))

(declare-fun m!248795 () Bool)

(assert (=> start!22008 m!248795))

(declare-fun m!248797 () Bool)

(assert (=> b!226484 m!248797))

(check-sat (not mapNonEmpty!10075) (not bm!21056) (not b!226484) (not b!226477) (not b!226496) (not b!226498) (not bm!21057) (not b!226487) (not start!22008) (not b!226497) b_and!12973 (not b!226486) (not b!226482) tp_is_empty!5937 (not b!226492) (not b!226480) (not b_next!6075))
(check-sat b_and!12973 (not b_next!6075))
