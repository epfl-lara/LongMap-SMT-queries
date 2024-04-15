; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23574 () Bool)

(assert start!23574)

(declare-fun b!247478 () Bool)

(declare-fun b_free!6589 () Bool)

(declare-fun b_next!6589 () Bool)

(assert (=> b!247478 (= b_free!6589 (not b_next!6589))))

(declare-fun tp!23014 () Bool)

(declare-fun b_and!13565 () Bool)

(assert (=> b!247478 (= tp!23014 b_and!13565)))

(declare-fun mapIsEmpty!10952 () Bool)

(declare-fun mapRes!10952 () Bool)

(assert (=> mapIsEmpty!10952 mapRes!10952))

(declare-fun b!247473 () Bool)

(declare-fun e!160542 () Bool)

(declare-fun e!160534 () Bool)

(assert (=> b!247473 (= e!160542 (and e!160534 mapRes!10952))))

(declare-fun condMapEmpty!10952 () Bool)

(declare-datatypes ((V!8249 0))(
  ( (V!8250 (val!3270 Int)) )
))
(declare-datatypes ((ValueCell!2882 0))(
  ( (ValueCellFull!2882 (v!5322 V!8249)) (EmptyCell!2882) )
))
(declare-datatypes ((array!12201 0))(
  ( (array!12202 (arr!5787 (Array (_ BitVec 32) ValueCell!2882)) (size!6131 (_ BitVec 32))) )
))
(declare-datatypes ((array!12203 0))(
  ( (array!12204 (arr!5788 (Array (_ BitVec 32) (_ BitVec 64))) (size!6132 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3664 0))(
  ( (LongMapFixedSize!3665 (defaultEntry!4581 Int) (mask!10720 (_ BitVec 32)) (extraKeys!4318 (_ BitVec 32)) (zeroValue!4422 V!8249) (minValue!4422 V!8249) (_size!1881 (_ BitVec 32)) (_keys!6702 array!12203) (_values!4564 array!12201) (_vacant!1881 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3664)

(declare-fun mapDefault!10952 () ValueCell!2882)

(assert (=> b!247473 (= condMapEmpty!10952 (= (arr!5787 (_values!4564 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2882)) mapDefault!10952)))))

(declare-fun b!247474 () Bool)

(declare-fun tp_is_empty!6451 () Bool)

(assert (=> b!247474 (= e!160534 tp_is_empty!6451)))

(declare-fun b!247475 () Bool)

(declare-fun e!160539 () Bool)

(declare-fun e!160538 () Bool)

(assert (=> b!247475 (= e!160539 e!160538)))

(declare-fun res!121279 () Bool)

(declare-fun call!23165 () Bool)

(assert (=> b!247475 (= res!121279 call!23165)))

(assert (=> b!247475 (=> (not res!121279) (not e!160538))))

(declare-fun b!247476 () Bool)

(declare-fun e!160543 () Bool)

(declare-fun call!23164 () Bool)

(assert (=> b!247476 (= e!160543 (not call!23164))))

(declare-fun mapNonEmpty!10952 () Bool)

(declare-fun tp!23015 () Bool)

(declare-fun e!160530 () Bool)

(assert (=> mapNonEmpty!10952 (= mapRes!10952 (and tp!23015 e!160530))))

(declare-fun mapRest!10952 () (Array (_ BitVec 32) ValueCell!2882))

(declare-fun mapValue!10952 () ValueCell!2882)

(declare-fun mapKey!10952 () (_ BitVec 32))

(assert (=> mapNonEmpty!10952 (= (arr!5787 (_values!4564 thiss!1504)) (store mapRest!10952 mapKey!10952 mapValue!10952))))

(declare-fun b!247477 () Bool)

(declare-fun res!121274 () Bool)

(declare-datatypes ((SeekEntryResult!1102 0))(
  ( (MissingZero!1102 (index!6578 (_ BitVec 32))) (Found!1102 (index!6579 (_ BitVec 32))) (Intermediate!1102 (undefined!1914 Bool) (index!6580 (_ BitVec 32)) (x!24537 (_ BitVec 32))) (Undefined!1102) (MissingVacant!1102 (index!6581 (_ BitVec 32))) )
))
(declare-fun lt!123836 () SeekEntryResult!1102)

(assert (=> b!247477 (= res!121274 (= (select (arr!5788 (_keys!6702 thiss!1504)) (index!6581 lt!123836)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247477 (=> (not res!121274) (not e!160538))))

(declare-fun e!160536 () Bool)

(declare-fun array_inv!3819 (array!12203) Bool)

(declare-fun array_inv!3820 (array!12201) Bool)

(assert (=> b!247478 (= e!160536 (and tp!23014 tp_is_empty!6451 (array_inv!3819 (_keys!6702 thiss!1504)) (array_inv!3820 (_values!4564 thiss!1504)) e!160542))))

(declare-fun b!247479 () Bool)

(declare-fun c!41433 () Bool)

(get-info :version)

(assert (=> b!247479 (= c!41433 ((_ is MissingVacant!1102) lt!123836))))

(declare-fun e!160535 () Bool)

(assert (=> b!247479 (= e!160535 e!160539)))

(declare-fun b!247480 () Bool)

(assert (=> b!247480 (= e!160538 (not call!23164))))

(declare-fun b!247481 () Bool)

(declare-datatypes ((Unit!7648 0))(
  ( (Unit!7649) )
))
(declare-fun e!160533 () Unit!7648)

(declare-fun Unit!7650 () Unit!7648)

(assert (=> b!247481 (= e!160533 Unit!7650)))

(declare-fun lt!123834 () Unit!7648)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!388 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) Int) Unit!7648)

(assert (=> b!247481 (= lt!123834 (lemmaInListMapThenSeekEntryOrOpenFindsIt!388 (_keys!6702 thiss!1504) (_values!4564 thiss!1504) (mask!10720 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247481 false))

(declare-fun b!247482 () Bool)

(declare-fun e!160532 () Unit!7648)

(declare-fun Unit!7651 () Unit!7648)

(assert (=> b!247482 (= e!160532 Unit!7651)))

(declare-fun lt!123833 () Unit!7648)

(declare-fun lemmaArrayContainsKeyThenInListMap!197 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) (_ BitVec 32) Int) Unit!7648)

(assert (=> b!247482 (= lt!123833 (lemmaArrayContainsKeyThenInListMap!197 (_keys!6702 thiss!1504) (_values!4564 thiss!1504) (mask!10720 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247482 false))

(declare-fun b!247483 () Bool)

(declare-fun Unit!7652 () Unit!7648)

(assert (=> b!247483 (= e!160532 Unit!7652)))

(declare-fun b!247484 () Bool)

(declare-fun e!160537 () Bool)

(assert (=> b!247484 (= e!160537 (not true))))

(declare-fun lt!123830 () array!12203)

(declare-fun arrayCountValidKeys!0 (array!12203 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247484 (= (arrayCountValidKeys!0 lt!123830 #b00000000000000000000000000000000 (size!6132 (_keys!6702 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6702 thiss!1504) #b00000000000000000000000000000000 (size!6132 (_keys!6702 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!123829 () Unit!7648)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12203 (_ BitVec 32) (_ BitVec 64)) Unit!7648)

(assert (=> b!247484 (= lt!123829 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6702 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3683 0))(
  ( (Nil!3680) (Cons!3679 (h!4337 (_ BitVec 64)) (t!8697 List!3683)) )
))
(declare-fun arrayNoDuplicates!0 (array!12203 (_ BitVec 32) List!3683) Bool)

(assert (=> b!247484 (arrayNoDuplicates!0 lt!123830 #b00000000000000000000000000000000 Nil!3680)))

(assert (=> b!247484 (= lt!123830 (array!12204 (store (arr!5788 (_keys!6702 thiss!1504)) index!297 key!932) (size!6132 (_keys!6702 thiss!1504))))))

(declare-fun lt!123835 () Unit!7648)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3683) Unit!7648)

(assert (=> b!247484 (= lt!123835 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6702 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3680))))

(declare-fun lt!123831 () Unit!7648)

(assert (=> b!247484 (= lt!123831 e!160532)))

(declare-fun c!41435 () Bool)

(declare-fun arrayContainsKey!0 (array!12203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247484 (= c!41435 (arrayContainsKey!0 (_keys!6702 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247485 () Bool)

(declare-fun lt!123832 () Unit!7648)

(assert (=> b!247485 (= e!160533 lt!123832)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!385 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) Int) Unit!7648)

(assert (=> b!247485 (= lt!123832 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!385 (_keys!6702 thiss!1504) (_values!4564 thiss!1504) (mask!10720 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 (defaultEntry!4581 thiss!1504)))))

(declare-fun c!41436 () Bool)

(assert (=> b!247485 (= c!41436 ((_ is MissingZero!1102) lt!123836))))

(assert (=> b!247485 e!160535))

(declare-fun bm!23161 () Bool)

(assert (=> bm!23161 (= call!23164 (arrayContainsKey!0 (_keys!6702 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247486 () Bool)

(declare-fun res!121277 () Bool)

(assert (=> b!247486 (=> (not res!121277) (not e!160543))))

(assert (=> b!247486 (= res!121277 call!23165)))

(assert (=> b!247486 (= e!160535 e!160543)))

(declare-fun bm!23162 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23162 (= call!23165 (inRange!0 (ite c!41436 (index!6578 lt!123836) (index!6581 lt!123836)) (mask!10720 thiss!1504)))))

(declare-fun b!247487 () Bool)

(assert (=> b!247487 (= e!160539 ((_ is Undefined!1102) lt!123836))))

(declare-fun b!247488 () Bool)

(assert (=> b!247488 (= e!160530 tp_is_empty!6451)))

(declare-fun b!247489 () Bool)

(declare-fun e!160540 () Bool)

(assert (=> b!247489 (= e!160540 e!160537)))

(declare-fun res!121273 () Bool)

(assert (=> b!247489 (=> (not res!121273) (not e!160537))))

(assert (=> b!247489 (= res!121273 (inRange!0 index!297 (mask!10720 thiss!1504)))))

(declare-fun lt!123828 () Unit!7648)

(assert (=> b!247489 (= lt!123828 e!160533)))

(declare-fun c!41434 () Bool)

(declare-datatypes ((tuple2!4782 0))(
  ( (tuple2!4783 (_1!2402 (_ BitVec 64)) (_2!2402 V!8249)) )
))
(declare-datatypes ((List!3684 0))(
  ( (Nil!3681) (Cons!3680 (h!4338 tuple2!4782) (t!8698 List!3684)) )
))
(declare-datatypes ((ListLongMap!3685 0))(
  ( (ListLongMap!3686 (toList!1858 List!3684)) )
))
(declare-fun contains!1777 (ListLongMap!3685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1367 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 32) Int) ListLongMap!3685)

(assert (=> b!247489 (= c!41434 (contains!1777 (getCurrentListMap!1367 (_keys!6702 thiss!1504) (_values!4564 thiss!1504) (mask!10720 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4581 thiss!1504)) key!932))))

(declare-fun b!247490 () Bool)

(declare-fun res!121280 () Bool)

(declare-fun e!160541 () Bool)

(assert (=> b!247490 (=> (not res!121280) (not e!160541))))

(assert (=> b!247490 (= res!121280 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!121278 () Bool)

(assert (=> start!23574 (=> (not res!121278) (not e!160541))))

(declare-fun valid!1441 (LongMapFixedSize!3664) Bool)

(assert (=> start!23574 (= res!121278 (valid!1441 thiss!1504))))

(assert (=> start!23574 e!160541))

(assert (=> start!23574 e!160536))

(assert (=> start!23574 true))

(declare-fun b!247491 () Bool)

(declare-fun res!121275 () Bool)

(assert (=> b!247491 (=> (not res!121275) (not e!160543))))

(assert (=> b!247491 (= res!121275 (= (select (arr!5788 (_keys!6702 thiss!1504)) (index!6578 lt!123836)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247492 () Bool)

(assert (=> b!247492 (= e!160541 e!160540)))

(declare-fun res!121276 () Bool)

(assert (=> b!247492 (=> (not res!121276) (not e!160540))))

(assert (=> b!247492 (= res!121276 (or (= lt!123836 (MissingZero!1102 index!297)) (= lt!123836 (MissingVacant!1102 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12203 (_ BitVec 32)) SeekEntryResult!1102)

(assert (=> b!247492 (= lt!123836 (seekEntryOrOpen!0 key!932 (_keys!6702 thiss!1504) (mask!10720 thiss!1504)))))

(assert (= (and start!23574 res!121278) b!247490))

(assert (= (and b!247490 res!121280) b!247492))

(assert (= (and b!247492 res!121276) b!247489))

(assert (= (and b!247489 c!41434) b!247481))

(assert (= (and b!247489 (not c!41434)) b!247485))

(assert (= (and b!247485 c!41436) b!247486))

(assert (= (and b!247485 (not c!41436)) b!247479))

(assert (= (and b!247486 res!121277) b!247491))

(assert (= (and b!247491 res!121275) b!247476))

(assert (= (and b!247479 c!41433) b!247475))

(assert (= (and b!247479 (not c!41433)) b!247487))

(assert (= (and b!247475 res!121279) b!247477))

(assert (= (and b!247477 res!121274) b!247480))

(assert (= (or b!247486 b!247475) bm!23162))

(assert (= (or b!247476 b!247480) bm!23161))

(assert (= (and b!247489 res!121273) b!247484))

(assert (= (and b!247484 c!41435) b!247482))

(assert (= (and b!247484 (not c!41435)) b!247483))

(assert (= (and b!247473 condMapEmpty!10952) mapIsEmpty!10952))

(assert (= (and b!247473 (not condMapEmpty!10952)) mapNonEmpty!10952))

(assert (= (and mapNonEmpty!10952 ((_ is ValueCellFull!2882) mapValue!10952)) b!247488))

(assert (= (and b!247473 ((_ is ValueCellFull!2882) mapDefault!10952)) b!247474))

(assert (= b!247478 b!247473))

(assert (= start!23574 b!247478))

(declare-fun m!264015 () Bool)

(assert (=> b!247491 m!264015))

(declare-fun m!264017 () Bool)

(assert (=> b!247481 m!264017))

(declare-fun m!264019 () Bool)

(assert (=> bm!23162 m!264019))

(declare-fun m!264021 () Bool)

(assert (=> b!247478 m!264021))

(declare-fun m!264023 () Bool)

(assert (=> b!247478 m!264023))

(declare-fun m!264025 () Bool)

(assert (=> mapNonEmpty!10952 m!264025))

(declare-fun m!264027 () Bool)

(assert (=> b!247484 m!264027))

(declare-fun m!264029 () Bool)

(assert (=> b!247484 m!264029))

(declare-fun m!264031 () Bool)

(assert (=> b!247484 m!264031))

(declare-fun m!264033 () Bool)

(assert (=> b!247484 m!264033))

(declare-fun m!264035 () Bool)

(assert (=> b!247484 m!264035))

(declare-fun m!264037 () Bool)

(assert (=> b!247484 m!264037))

(declare-fun m!264039 () Bool)

(assert (=> b!247484 m!264039))

(declare-fun m!264041 () Bool)

(assert (=> b!247477 m!264041))

(assert (=> bm!23161 m!264037))

(declare-fun m!264043 () Bool)

(assert (=> start!23574 m!264043))

(declare-fun m!264045 () Bool)

(assert (=> b!247489 m!264045))

(declare-fun m!264047 () Bool)

(assert (=> b!247489 m!264047))

(assert (=> b!247489 m!264047))

(declare-fun m!264049 () Bool)

(assert (=> b!247489 m!264049))

(declare-fun m!264051 () Bool)

(assert (=> b!247485 m!264051))

(declare-fun m!264053 () Bool)

(assert (=> b!247482 m!264053))

(declare-fun m!264055 () Bool)

(assert (=> b!247492 m!264055))

(check-sat tp_is_empty!6451 b_and!13565 (not b!247478) (not bm!23161) (not b!247492) (not b!247481) (not b!247489) (not b!247484) (not b!247482) (not b_next!6589) (not mapNonEmpty!10952) (not start!23574) (not bm!23162) (not b!247485))
(check-sat b_and!13565 (not b_next!6589))
