; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23574 () Bool)

(assert start!23574)

(declare-fun b!247670 () Bool)

(declare-fun b_free!6589 () Bool)

(declare-fun b_next!6589 () Bool)

(assert (=> b!247670 (= b_free!6589 (not b_next!6589))))

(declare-fun tp!23014 () Bool)

(declare-fun b_and!13605 () Bool)

(assert (=> b!247670 (= tp!23014 b_and!13605)))

(declare-fun mapIsEmpty!10952 () Bool)

(declare-fun mapRes!10952 () Bool)

(assert (=> mapIsEmpty!10952 mapRes!10952))

(declare-fun b!247667 () Bool)

(declare-fun e!160656 () Bool)

(declare-fun e!160668 () Bool)

(assert (=> b!247667 (= e!160656 e!160668)))

(declare-fun res!121396 () Bool)

(declare-fun call!23177 () Bool)

(assert (=> b!247667 (= res!121396 call!23177)))

(assert (=> b!247667 (=> (not res!121396) (not e!160668))))

(declare-fun b!247668 () Bool)

(declare-fun e!160667 () Bool)

(declare-fun tp_is_empty!6451 () Bool)

(assert (=> b!247668 (= e!160667 tp_is_empty!6451)))

(declare-fun b!247669 () Bool)

(declare-fun res!121392 () Bool)

(declare-fun e!160664 () Bool)

(assert (=> b!247669 (=> (not res!121392) (not e!160664))))

(assert (=> b!247669 (= res!121392 call!23177)))

(declare-fun e!160658 () Bool)

(assert (=> b!247669 (= e!160658 e!160664)))

(declare-fun e!160655 () Bool)

(declare-datatypes ((V!8249 0))(
  ( (V!8250 (val!3270 Int)) )
))
(declare-datatypes ((ValueCell!2882 0))(
  ( (ValueCellFull!2882 (v!5329 V!8249)) (EmptyCell!2882) )
))
(declare-datatypes ((array!12207 0))(
  ( (array!12208 (arr!5791 (Array (_ BitVec 32) ValueCell!2882)) (size!6134 (_ BitVec 32))) )
))
(declare-datatypes ((array!12209 0))(
  ( (array!12210 (arr!5792 (Array (_ BitVec 32) (_ BitVec 64))) (size!6135 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3664 0))(
  ( (LongMapFixedSize!3665 (defaultEntry!4581 Int) (mask!10721 (_ BitVec 32)) (extraKeys!4318 (_ BitVec 32)) (zeroValue!4422 V!8249) (minValue!4422 V!8249) (_size!1881 (_ BitVec 32)) (_keys!6703 array!12209) (_values!4564 array!12207) (_vacant!1881 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3664)

(declare-fun e!160662 () Bool)

(declare-fun array_inv!3807 (array!12209) Bool)

(declare-fun array_inv!3808 (array!12207) Bool)

(assert (=> b!247670 (= e!160655 (and tp!23014 tp_is_empty!6451 (array_inv!3807 (_keys!6703 thiss!1504)) (array_inv!3808 (_values!4564 thiss!1504)) e!160662))))

(declare-fun b!247671 () Bool)

(declare-fun call!23176 () Bool)

(assert (=> b!247671 (= e!160664 (not call!23176))))

(declare-fun bm!23173 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23173 (= call!23176 (arrayContainsKey!0 (_keys!6703 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247673 () Bool)

(declare-fun e!160659 () Bool)

(assert (=> b!247673 (= e!160659 tp_is_empty!6451)))

(declare-fun b!247674 () Bool)

(declare-datatypes ((Unit!7636 0))(
  ( (Unit!7637) )
))
(declare-fun e!160663 () Unit!7636)

(declare-fun Unit!7638 () Unit!7636)

(assert (=> b!247674 (= e!160663 Unit!7638)))

(declare-fun mapNonEmpty!10952 () Bool)

(declare-fun tp!23015 () Bool)

(assert (=> mapNonEmpty!10952 (= mapRes!10952 (and tp!23015 e!160659))))

(declare-fun mapValue!10952 () ValueCell!2882)

(declare-fun mapRest!10952 () (Array (_ BitVec 32) ValueCell!2882))

(declare-fun mapKey!10952 () (_ BitVec 32))

(assert (=> mapNonEmpty!10952 (= (arr!5791 (_values!4564 thiss!1504)) (store mapRest!10952 mapKey!10952 mapValue!10952))))

(declare-fun b!247675 () Bool)

(declare-fun res!121394 () Bool)

(assert (=> b!247675 (=> (not res!121394) (not e!160664))))

(declare-datatypes ((SeekEntryResult!1071 0))(
  ( (MissingZero!1071 (index!6454 (_ BitVec 32))) (Found!1071 (index!6455 (_ BitVec 32))) (Intermediate!1071 (undefined!1883 Bool) (index!6456 (_ BitVec 32)) (x!24507 (_ BitVec 32))) (Undefined!1071) (MissingVacant!1071 (index!6457 (_ BitVec 32))) )
))
(declare-fun lt!124070 () SeekEntryResult!1071)

(assert (=> b!247675 (= res!121394 (= (select (arr!5792 (_keys!6703 thiss!1504)) (index!6454 lt!124070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247676 () Bool)

(declare-fun res!121395 () Bool)

(declare-fun e!160660 () Bool)

(assert (=> b!247676 (=> (not res!121395) (not e!160660))))

(assert (=> b!247676 (= res!121395 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247677 () Bool)

(get-info :version)

(assert (=> b!247677 (= e!160656 ((_ is Undefined!1071) lt!124070))))

(declare-fun b!247678 () Bool)

(declare-fun Unit!7639 () Unit!7636)

(assert (=> b!247678 (= e!160663 Unit!7639)))

(declare-fun lt!124071 () Unit!7636)

(declare-fun lemmaArrayContainsKeyThenInListMap!199 (array!12209 array!12207 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) (_ BitVec 32) Int) Unit!7636)

(assert (=> b!247678 (= lt!124071 (lemmaArrayContainsKeyThenInListMap!199 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247678 false))

(declare-fun b!247672 () Bool)

(declare-fun e!160661 () Unit!7636)

(declare-fun lt!124072 () Unit!7636)

(assert (=> b!247672 (= e!160661 lt!124072)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (array!12209 array!12207 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) Int) Unit!7636)

(assert (=> b!247672 (= lt!124072 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 (defaultEntry!4581 thiss!1504)))))

(declare-fun c!41473 () Bool)

(assert (=> b!247672 (= c!41473 ((_ is MissingZero!1071) lt!124070))))

(assert (=> b!247672 e!160658))

(declare-fun res!121393 () Bool)

(assert (=> start!23574 (=> (not res!121393) (not e!160660))))

(declare-fun valid!1444 (LongMapFixedSize!3664) Bool)

(assert (=> start!23574 (= res!121393 (valid!1444 thiss!1504))))

(assert (=> start!23574 e!160660))

(assert (=> start!23574 e!160655))

(assert (=> start!23574 true))

(declare-fun b!247679 () Bool)

(declare-fun e!160665 () Bool)

(assert (=> b!247679 (= e!160665 (not true))))

(declare-fun lt!124069 () array!12209)

(declare-fun arrayCountValidKeys!0 (array!12209 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247679 (= (arrayCountValidKeys!0 lt!124069 #b00000000000000000000000000000000 (size!6135 (_keys!6703 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6703 thiss!1504) #b00000000000000000000000000000000 (size!6135 (_keys!6703 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!124074 () Unit!7636)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12209 (_ BitVec 32) (_ BitVec 64)) Unit!7636)

(assert (=> b!247679 (= lt!124074 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6703 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3618 0))(
  ( (Nil!3615) (Cons!3614 (h!4272 (_ BitVec 64)) (t!8633 List!3618)) )
))
(declare-fun arrayNoDuplicates!0 (array!12209 (_ BitVec 32) List!3618) Bool)

(assert (=> b!247679 (arrayNoDuplicates!0 lt!124069 #b00000000000000000000000000000000 Nil!3615)))

(assert (=> b!247679 (= lt!124069 (array!12210 (store (arr!5792 (_keys!6703 thiss!1504)) index!297 key!932) (size!6135 (_keys!6703 thiss!1504))))))

(declare-fun lt!124076 () Unit!7636)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3618) Unit!7636)

(assert (=> b!247679 (= lt!124076 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6703 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3615))))

(declare-fun lt!124073 () Unit!7636)

(assert (=> b!247679 (= lt!124073 e!160663)))

(declare-fun c!41475 () Bool)

(assert (=> b!247679 (= c!41475 (arrayContainsKey!0 (_keys!6703 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23174 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23174 (= call!23177 (inRange!0 (ite c!41473 (index!6454 lt!124070) (index!6457 lt!124070)) (mask!10721 thiss!1504)))))

(declare-fun b!247680 () Bool)

(declare-fun e!160666 () Bool)

(assert (=> b!247680 (= e!160666 e!160665)))

(declare-fun res!121391 () Bool)

(assert (=> b!247680 (=> (not res!121391) (not e!160665))))

(assert (=> b!247680 (= res!121391 (inRange!0 index!297 (mask!10721 thiss!1504)))))

(declare-fun lt!124075 () Unit!7636)

(assert (=> b!247680 (= lt!124075 e!160661)))

(declare-fun c!41474 () Bool)

(declare-datatypes ((tuple2!4742 0))(
  ( (tuple2!4743 (_1!2382 (_ BitVec 64)) (_2!2382 V!8249)) )
))
(declare-datatypes ((List!3619 0))(
  ( (Nil!3616) (Cons!3615 (h!4273 tuple2!4742) (t!8634 List!3619)) )
))
(declare-datatypes ((ListLongMap!3657 0))(
  ( (ListLongMap!3658 (toList!1844 List!3619)) )
))
(declare-fun contains!1774 (ListLongMap!3657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1376 (array!12209 array!12207 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 32) Int) ListLongMap!3657)

(assert (=> b!247680 (= c!41474 (contains!1774 (getCurrentListMap!1376 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4581 thiss!1504)) key!932))))

(declare-fun b!247681 () Bool)

(assert (=> b!247681 (= e!160660 e!160666)))

(declare-fun res!121390 () Bool)

(assert (=> b!247681 (=> (not res!121390) (not e!160666))))

(assert (=> b!247681 (= res!121390 (or (= lt!124070 (MissingZero!1071 index!297)) (= lt!124070 (MissingVacant!1071 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12209 (_ BitVec 32)) SeekEntryResult!1071)

(assert (=> b!247681 (= lt!124070 (seekEntryOrOpen!0 key!932 (_keys!6703 thiss!1504) (mask!10721 thiss!1504)))))

(declare-fun b!247682 () Bool)

(declare-fun res!121389 () Bool)

(assert (=> b!247682 (= res!121389 (= (select (arr!5792 (_keys!6703 thiss!1504)) (index!6457 lt!124070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247682 (=> (not res!121389) (not e!160668))))

(declare-fun b!247683 () Bool)

(assert (=> b!247683 (= e!160662 (and e!160667 mapRes!10952))))

(declare-fun condMapEmpty!10952 () Bool)

(declare-fun mapDefault!10952 () ValueCell!2882)

(assert (=> b!247683 (= condMapEmpty!10952 (= (arr!5791 (_values!4564 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2882)) mapDefault!10952)))))

(declare-fun b!247684 () Bool)

(assert (=> b!247684 (= e!160668 (not call!23176))))

(declare-fun b!247685 () Bool)

(declare-fun Unit!7640 () Unit!7636)

(assert (=> b!247685 (= e!160661 Unit!7640)))

(declare-fun lt!124068 () Unit!7636)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (array!12209 array!12207 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) Int) Unit!7636)

(assert (=> b!247685 (= lt!124068 (lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247685 false))

(declare-fun b!247686 () Bool)

(declare-fun c!41472 () Bool)

(assert (=> b!247686 (= c!41472 ((_ is MissingVacant!1071) lt!124070))))

(assert (=> b!247686 (= e!160658 e!160656)))

(assert (= (and start!23574 res!121393) b!247676))

(assert (= (and b!247676 res!121395) b!247681))

(assert (= (and b!247681 res!121390) b!247680))

(assert (= (and b!247680 c!41474) b!247685))

(assert (= (and b!247680 (not c!41474)) b!247672))

(assert (= (and b!247672 c!41473) b!247669))

(assert (= (and b!247672 (not c!41473)) b!247686))

(assert (= (and b!247669 res!121392) b!247675))

(assert (= (and b!247675 res!121394) b!247671))

(assert (= (and b!247686 c!41472) b!247667))

(assert (= (and b!247686 (not c!41472)) b!247677))

(assert (= (and b!247667 res!121396) b!247682))

(assert (= (and b!247682 res!121389) b!247684))

(assert (= (or b!247669 b!247667) bm!23174))

(assert (= (or b!247671 b!247684) bm!23173))

(assert (= (and b!247680 res!121391) b!247679))

(assert (= (and b!247679 c!41475) b!247678))

(assert (= (and b!247679 (not c!41475)) b!247674))

(assert (= (and b!247683 condMapEmpty!10952) mapIsEmpty!10952))

(assert (= (and b!247683 (not condMapEmpty!10952)) mapNonEmpty!10952))

(assert (= (and mapNonEmpty!10952 ((_ is ValueCellFull!2882) mapValue!10952)) b!247673))

(assert (= (and b!247683 ((_ is ValueCellFull!2882) mapDefault!10952)) b!247668))

(assert (= b!247670 b!247683))

(assert (= start!23574 b!247670))

(declare-fun m!264813 () Bool)

(assert (=> start!23574 m!264813))

(declare-fun m!264815 () Bool)

(assert (=> mapNonEmpty!10952 m!264815))

(declare-fun m!264817 () Bool)

(assert (=> bm!23173 m!264817))

(declare-fun m!264819 () Bool)

(assert (=> b!247680 m!264819))

(declare-fun m!264821 () Bool)

(assert (=> b!247680 m!264821))

(assert (=> b!247680 m!264821))

(declare-fun m!264823 () Bool)

(assert (=> b!247680 m!264823))

(declare-fun m!264825 () Bool)

(assert (=> b!247678 m!264825))

(declare-fun m!264827 () Bool)

(assert (=> b!247685 m!264827))

(declare-fun m!264829 () Bool)

(assert (=> bm!23174 m!264829))

(declare-fun m!264831 () Bool)

(assert (=> b!247682 m!264831))

(declare-fun m!264833 () Bool)

(assert (=> b!247679 m!264833))

(declare-fun m!264835 () Bool)

(assert (=> b!247679 m!264835))

(declare-fun m!264837 () Bool)

(assert (=> b!247679 m!264837))

(declare-fun m!264839 () Bool)

(assert (=> b!247679 m!264839))

(declare-fun m!264841 () Bool)

(assert (=> b!247679 m!264841))

(declare-fun m!264843 () Bool)

(assert (=> b!247679 m!264843))

(assert (=> b!247679 m!264817))

(declare-fun m!264845 () Bool)

(assert (=> b!247675 m!264845))

(declare-fun m!264847 () Bool)

(assert (=> b!247681 m!264847))

(declare-fun m!264849 () Bool)

(assert (=> b!247672 m!264849))

(declare-fun m!264851 () Bool)

(assert (=> b!247670 m!264851))

(declare-fun m!264853 () Bool)

(assert (=> b!247670 m!264853))

(check-sat (not b!247680) b_and!13605 (not bm!23173) (not start!23574) (not b!247670) (not b_next!6589) (not mapNonEmpty!10952) (not b!247685) tp_is_empty!6451 (not b!247672) (not bm!23174) (not b!247681) (not b!247678) (not b!247679))
(check-sat b_and!13605 (not b_next!6589))
