; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25126 () Bool)

(assert start!25126)

(declare-fun b!261469 () Bool)

(declare-fun b_free!6769 () Bool)

(declare-fun b_next!6769 () Bool)

(assert (=> b!261469 (= b_free!6769 (not b_next!6769))))

(declare-fun tp!23638 () Bool)

(declare-fun b_and!13877 () Bool)

(assert (=> b!261469 (= tp!23638 b_and!13877)))

(declare-fun b!261457 () Bool)

(declare-fun e!169408 () Bool)

(declare-fun e!169410 () Bool)

(assert (=> b!261457 (= e!169408 e!169410)))

(declare-fun res!127724 () Bool)

(assert (=> b!261457 (=> (not res!127724) (not e!169410))))

(declare-datatypes ((SeekEntryResult!1182 0))(
  ( (MissingZero!1182 (index!6898 (_ BitVec 32))) (Found!1182 (index!6899 (_ BitVec 32))) (Intermediate!1182 (undefined!1994 Bool) (index!6900 (_ BitVec 32)) (x!25171 (_ BitVec 32))) (Undefined!1182) (MissingVacant!1182 (index!6901 (_ BitVec 32))) )
))
(declare-fun lt!131910 () SeekEntryResult!1182)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261457 (= res!127724 (or (= lt!131910 (MissingZero!1182 index!297)) (= lt!131910 (MissingVacant!1182 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8489 0))(
  ( (V!8490 (val!3360 Int)) )
))
(declare-datatypes ((ValueCell!2972 0))(
  ( (ValueCellFull!2972 (v!5479 V!8489)) (EmptyCell!2972) )
))
(declare-datatypes ((array!12611 0))(
  ( (array!12612 (arr!5967 (Array (_ BitVec 32) ValueCell!2972)) (size!6319 (_ BitVec 32))) )
))
(declare-datatypes ((array!12613 0))(
  ( (array!12614 (arr!5968 (Array (_ BitVec 32) (_ BitVec 64))) (size!6320 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3844 0))(
  ( (LongMapFixedSize!3845 (defaultEntry!4820 Int) (mask!11167 (_ BitVec 32)) (extraKeys!4557 (_ BitVec 32)) (zeroValue!4661 V!8489) (minValue!4661 V!8489) (_size!1971 (_ BitVec 32)) (_keys!7007 array!12613) (_values!4803 array!12611) (_vacant!1971 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3844)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12613 (_ BitVec 32)) SeekEntryResult!1182)

(assert (=> b!261457 (= lt!131910 (seekEntryOrOpen!0 key!932 (_keys!7007 thiss!1504) (mask!11167 thiss!1504)))))

(declare-fun b!261458 () Bool)

(declare-fun res!127726 () Bool)

(declare-fun e!169413 () Bool)

(assert (=> b!261458 (=> (not res!127726) (not e!169413))))

(declare-fun call!24955 () Bool)

(assert (=> b!261458 (= res!127726 call!24955)))

(declare-fun e!169411 () Bool)

(assert (=> b!261458 (= e!169411 e!169413)))

(declare-fun b!261459 () Bool)

(declare-fun e!169409 () Bool)

(declare-fun e!169412 () Bool)

(declare-fun mapRes!11305 () Bool)

(assert (=> b!261459 (= e!169409 (and e!169412 mapRes!11305))))

(declare-fun condMapEmpty!11305 () Bool)

(declare-fun mapDefault!11305 () ValueCell!2972)

(assert (=> b!261459 (= condMapEmpty!11305 (= (arr!5967 (_values!4803 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2972)) mapDefault!11305)))))

(declare-fun bm!24952 () Bool)

(declare-fun call!24956 () Bool)

(declare-fun arrayContainsKey!0 (array!12613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24952 (= call!24956 (arrayContainsKey!0 (_keys!7007 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261460 () Bool)

(declare-fun res!127723 () Bool)

(assert (=> b!261460 (= res!127723 (= (select (arr!5968 (_keys!7007 thiss!1504)) (index!6901 lt!131910)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169418 () Bool)

(assert (=> b!261460 (=> (not res!127723) (not e!169418))))

(declare-fun b!261461 () Bool)

(declare-fun res!127730 () Bool)

(assert (=> b!261461 (=> (not res!127730) (not e!169408))))

(assert (=> b!261461 (= res!127730 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261462 () Bool)

(declare-datatypes ((Unit!8087 0))(
  ( (Unit!8088) )
))
(declare-fun e!169407 () Unit!8087)

(declare-fun lt!131914 () Unit!8087)

(assert (=> b!261462 (= e!169407 lt!131914)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!443 (array!12613 array!12611 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) Int) Unit!8087)

(assert (=> b!261462 (= lt!131914 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!443 (_keys!7007 thiss!1504) (_values!4803 thiss!1504) (mask!11167 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 (defaultEntry!4820 thiss!1504)))))

(declare-fun c!44523 () Bool)

(get-info :version)

(assert (=> b!261462 (= c!44523 ((_ is MissingZero!1182) lt!131910))))

(assert (=> b!261462 e!169411))

(declare-fun b!261463 () Bool)

(declare-fun c!44524 () Bool)

(assert (=> b!261463 (= c!44524 ((_ is MissingVacant!1182) lt!131910))))

(declare-fun e!169416 () Bool)

(assert (=> b!261463 (= e!169411 e!169416)))

(declare-fun b!261464 () Bool)

(declare-fun e!169417 () Bool)

(declare-fun tp_is_empty!6631 () Bool)

(assert (=> b!261464 (= e!169417 tp_is_empty!6631)))

(declare-fun bm!24953 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24953 (= call!24955 (inRange!0 (ite c!44523 (index!6898 lt!131910) (index!6901 lt!131910)) (mask!11167 thiss!1504)))))

(declare-fun mapNonEmpty!11305 () Bool)

(declare-fun tp!23637 () Bool)

(assert (=> mapNonEmpty!11305 (= mapRes!11305 (and tp!23637 e!169417))))

(declare-fun mapKey!11305 () (_ BitVec 32))

(declare-fun mapValue!11305 () ValueCell!2972)

(declare-fun mapRest!11305 () (Array (_ BitVec 32) ValueCell!2972))

(assert (=> mapNonEmpty!11305 (= (arr!5967 (_values!4803 thiss!1504)) (store mapRest!11305 mapKey!11305 mapValue!11305))))

(declare-fun b!261465 () Bool)

(declare-fun e!169415 () Bool)

(assert (=> b!261465 (= e!169410 e!169415)))

(declare-fun res!127727 () Bool)

(assert (=> b!261465 (=> (not res!127727) (not e!169415))))

(assert (=> b!261465 (= res!127727 (inRange!0 index!297 (mask!11167 thiss!1504)))))

(declare-fun lt!131917 () Unit!8087)

(assert (=> b!261465 (= lt!131917 e!169407)))

(declare-fun c!44526 () Bool)

(declare-datatypes ((tuple2!4904 0))(
  ( (tuple2!4905 (_1!2463 (_ BitVec 64)) (_2!2463 V!8489)) )
))
(declare-datatypes ((List!3802 0))(
  ( (Nil!3799) (Cons!3798 (h!4464 tuple2!4904) (t!8866 List!3802)) )
))
(declare-datatypes ((ListLongMap!3807 0))(
  ( (ListLongMap!3808 (toList!1919 List!3802)) )
))
(declare-fun lt!131915 () ListLongMap!3807)

(declare-fun contains!1878 (ListLongMap!3807 (_ BitVec 64)) Bool)

(assert (=> b!261465 (= c!44526 (contains!1878 lt!131915 key!932))))

(declare-fun getCurrentListMap!1428 (array!12613 array!12611 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 32) Int) ListLongMap!3807)

(assert (=> b!261465 (= lt!131915 (getCurrentListMap!1428 (_keys!7007 thiss!1504) (_values!4803 thiss!1504) (mask!11167 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(declare-fun b!261466 () Bool)

(assert (=> b!261466 (= e!169413 (not call!24956))))

(declare-fun b!261467 () Bool)

(assert (=> b!261467 (= e!169415 (not true))))

(declare-fun lt!131913 () array!12613)

(declare-fun arrayCountValidKeys!0 (array!12613 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261467 (= (arrayCountValidKeys!0 lt!131913 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!131920 () Unit!8087)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12613 (_ BitVec 32)) Unit!8087)

(assert (=> b!261467 (= lt!131920 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131913 index!297))))

(assert (=> b!261467 (arrayContainsKey!0 lt!131913 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131908 () Unit!8087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12613 (_ BitVec 64) (_ BitVec 32)) Unit!8087)

(assert (=> b!261467 (= lt!131908 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131913 key!932 index!297))))

(declare-fun v!346 () V!8489)

(declare-fun +!706 (ListLongMap!3807 tuple2!4904) ListLongMap!3807)

(assert (=> b!261467 (= (+!706 lt!131915 (tuple2!4905 key!932 v!346)) (getCurrentListMap!1428 lt!131913 (array!12612 (store (arr!5967 (_values!4803 thiss!1504)) index!297 (ValueCellFull!2972 v!346)) (size!6319 (_values!4803 thiss!1504))) (mask!11167 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(declare-fun lt!131918 () Unit!8087)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!117 (array!12613 array!12611 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 32) (_ BitVec 64) V!8489 Int) Unit!8087)

(assert (=> b!261467 (= lt!131918 (lemmaAddValidKeyToArrayThenAddPairToListMap!117 (_keys!7007 thiss!1504) (_values!4803 thiss!1504) (mask!11167 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) index!297 key!932 v!346 (defaultEntry!4820 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12613 (_ BitVec 32)) Bool)

(assert (=> b!261467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131913 (mask!11167 thiss!1504))))

(declare-fun lt!131919 () Unit!8087)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12613 (_ BitVec 32) (_ BitVec 32)) Unit!8087)

(assert (=> b!261467 (= lt!131919 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7007 thiss!1504) index!297 (mask!11167 thiss!1504)))))

(assert (=> b!261467 (= (arrayCountValidKeys!0 lt!131913 #b00000000000000000000000000000000 (size!6320 (_keys!7007 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7007 thiss!1504) #b00000000000000000000000000000000 (size!6320 (_keys!7007 thiss!1504)))))))

(declare-fun lt!131921 () Unit!8087)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12613 (_ BitVec 32) (_ BitVec 64)) Unit!8087)

(assert (=> b!261467 (= lt!131921 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7007 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3803 0))(
  ( (Nil!3800) (Cons!3799 (h!4465 (_ BitVec 64)) (t!8867 List!3803)) )
))
(declare-fun arrayNoDuplicates!0 (array!12613 (_ BitVec 32) List!3803) Bool)

(assert (=> b!261467 (arrayNoDuplicates!0 lt!131913 #b00000000000000000000000000000000 Nil!3800)))

(assert (=> b!261467 (= lt!131913 (array!12614 (store (arr!5968 (_keys!7007 thiss!1504)) index!297 key!932) (size!6320 (_keys!7007 thiss!1504))))))

(declare-fun lt!131916 () Unit!8087)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3803) Unit!8087)

(assert (=> b!261467 (= lt!131916 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7007 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3800))))

(declare-fun lt!131909 () Unit!8087)

(declare-fun e!169419 () Unit!8087)

(assert (=> b!261467 (= lt!131909 e!169419)))

(declare-fun c!44525 () Bool)

(assert (=> b!261467 (= c!44525 (arrayContainsKey!0 (_keys!7007 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261468 () Bool)

(declare-fun Unit!8089 () Unit!8087)

(assert (=> b!261468 (= e!169407 Unit!8089)))

(declare-fun lt!131911 () Unit!8087)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (array!12613 array!12611 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) Int) Unit!8087)

(assert (=> b!261468 (= lt!131911 (lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (_keys!7007 thiss!1504) (_values!4803 thiss!1504) (mask!11167 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261468 false))

(declare-fun e!169414 () Bool)

(declare-fun array_inv!3947 (array!12613) Bool)

(declare-fun array_inv!3948 (array!12611) Bool)

(assert (=> b!261469 (= e!169414 (and tp!23638 tp_is_empty!6631 (array_inv!3947 (_keys!7007 thiss!1504)) (array_inv!3948 (_values!4803 thiss!1504)) e!169409))))

(declare-fun b!261470 () Bool)

(declare-fun res!127728 () Bool)

(assert (=> b!261470 (=> (not res!127728) (not e!169413))))

(assert (=> b!261470 (= res!127728 (= (select (arr!5968 (_keys!7007 thiss!1504)) (index!6898 lt!131910)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!127725 () Bool)

(assert (=> start!25126 (=> (not res!127725) (not e!169408))))

(declare-fun valid!1504 (LongMapFixedSize!3844) Bool)

(assert (=> start!25126 (= res!127725 (valid!1504 thiss!1504))))

(assert (=> start!25126 e!169408))

(assert (=> start!25126 e!169414))

(assert (=> start!25126 true))

(assert (=> start!25126 tp_is_empty!6631))

(declare-fun b!261471 () Bool)

(assert (=> b!261471 (= e!169418 (not call!24956))))

(declare-fun b!261472 () Bool)

(declare-fun Unit!8090 () Unit!8087)

(assert (=> b!261472 (= e!169419 Unit!8090)))

(declare-fun b!261473 () Bool)

(assert (=> b!261473 (= e!169412 tp_is_empty!6631)))

(declare-fun mapIsEmpty!11305 () Bool)

(assert (=> mapIsEmpty!11305 mapRes!11305))

(declare-fun b!261474 () Bool)

(declare-fun Unit!8091 () Unit!8087)

(assert (=> b!261474 (= e!169419 Unit!8091)))

(declare-fun lt!131912 () Unit!8087)

(declare-fun lemmaArrayContainsKeyThenInListMap!253 (array!12613 array!12611 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) (_ BitVec 32) Int) Unit!8087)

(assert (=> b!261474 (= lt!131912 (lemmaArrayContainsKeyThenInListMap!253 (_keys!7007 thiss!1504) (_values!4803 thiss!1504) (mask!11167 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261474 false))

(declare-fun b!261475 () Bool)

(assert (=> b!261475 (= e!169416 e!169418)))

(declare-fun res!127729 () Bool)

(assert (=> b!261475 (= res!127729 call!24955)))

(assert (=> b!261475 (=> (not res!127729) (not e!169418))))

(declare-fun b!261476 () Bool)

(assert (=> b!261476 (= e!169416 ((_ is Undefined!1182) lt!131910))))

(assert (= (and start!25126 res!127725) b!261461))

(assert (= (and b!261461 res!127730) b!261457))

(assert (= (and b!261457 res!127724) b!261465))

(assert (= (and b!261465 c!44526) b!261468))

(assert (= (and b!261465 (not c!44526)) b!261462))

(assert (= (and b!261462 c!44523) b!261458))

(assert (= (and b!261462 (not c!44523)) b!261463))

(assert (= (and b!261458 res!127726) b!261470))

(assert (= (and b!261470 res!127728) b!261466))

(assert (= (and b!261463 c!44524) b!261475))

(assert (= (and b!261463 (not c!44524)) b!261476))

(assert (= (and b!261475 res!127729) b!261460))

(assert (= (and b!261460 res!127723) b!261471))

(assert (= (or b!261458 b!261475) bm!24953))

(assert (= (or b!261466 b!261471) bm!24952))

(assert (= (and b!261465 res!127727) b!261467))

(assert (= (and b!261467 c!44525) b!261474))

(assert (= (and b!261467 (not c!44525)) b!261472))

(assert (= (and b!261459 condMapEmpty!11305) mapIsEmpty!11305))

(assert (= (and b!261459 (not condMapEmpty!11305)) mapNonEmpty!11305))

(assert (= (and mapNonEmpty!11305 ((_ is ValueCellFull!2972) mapValue!11305)) b!261464))

(assert (= (and b!261459 ((_ is ValueCellFull!2972) mapDefault!11305)) b!261473))

(assert (= b!261469 b!261459))

(assert (= start!25126 b!261469))

(declare-fun m!277069 () Bool)

(assert (=> bm!24953 m!277069))

(declare-fun m!277071 () Bool)

(assert (=> b!261469 m!277071))

(declare-fun m!277073 () Bool)

(assert (=> b!261469 m!277073))

(declare-fun m!277075 () Bool)

(assert (=> b!261465 m!277075))

(declare-fun m!277077 () Bool)

(assert (=> b!261465 m!277077))

(declare-fun m!277079 () Bool)

(assert (=> b!261465 m!277079))

(declare-fun m!277081 () Bool)

(assert (=> mapNonEmpty!11305 m!277081))

(declare-fun m!277083 () Bool)

(assert (=> b!261468 m!277083))

(declare-fun m!277085 () Bool)

(assert (=> b!261462 m!277085))

(declare-fun m!277087 () Bool)

(assert (=> b!261470 m!277087))

(declare-fun m!277089 () Bool)

(assert (=> bm!24952 m!277089))

(declare-fun m!277091 () Bool)

(assert (=> b!261460 m!277091))

(declare-fun m!277093 () Bool)

(assert (=> b!261474 m!277093))

(declare-fun m!277095 () Bool)

(assert (=> b!261467 m!277095))

(assert (=> b!261467 m!277089))

(declare-fun m!277097 () Bool)

(assert (=> b!261467 m!277097))

(declare-fun m!277099 () Bool)

(assert (=> b!261467 m!277099))

(declare-fun m!277101 () Bool)

(assert (=> b!261467 m!277101))

(declare-fun m!277103 () Bool)

(assert (=> b!261467 m!277103))

(declare-fun m!277105 () Bool)

(assert (=> b!261467 m!277105))

(declare-fun m!277107 () Bool)

(assert (=> b!261467 m!277107))

(declare-fun m!277109 () Bool)

(assert (=> b!261467 m!277109))

(declare-fun m!277111 () Bool)

(assert (=> b!261467 m!277111))

(declare-fun m!277113 () Bool)

(assert (=> b!261467 m!277113))

(declare-fun m!277115 () Bool)

(assert (=> b!261467 m!277115))

(declare-fun m!277117 () Bool)

(assert (=> b!261467 m!277117))

(declare-fun m!277119 () Bool)

(assert (=> b!261467 m!277119))

(declare-fun m!277121 () Bool)

(assert (=> b!261467 m!277121))

(declare-fun m!277123 () Bool)

(assert (=> b!261467 m!277123))

(declare-fun m!277125 () Bool)

(assert (=> b!261467 m!277125))

(declare-fun m!277127 () Bool)

(assert (=> b!261457 m!277127))

(declare-fun m!277129 () Bool)

(assert (=> start!25126 m!277129))

(check-sat (not b!261468) b_and!13877 (not b!261462) (not start!25126) (not b!261457) (not b!261467) (not b_next!6769) (not b!261474) tp_is_empty!6631 (not b!261465) (not mapNonEmpty!11305) (not bm!24952) (not bm!24953) (not b!261469))
(check-sat b_and!13877 (not b_next!6769))
