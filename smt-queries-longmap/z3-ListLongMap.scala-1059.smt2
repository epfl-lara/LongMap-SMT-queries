; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22040 () Bool)

(assert start!22040)

(declare-fun b!227520 () Bool)

(declare-fun b_free!6103 () Bool)

(declare-fun b_next!6103 () Bool)

(assert (=> b!227520 (= b_free!6103 (not b_next!6103))))

(declare-fun tp!21450 () Bool)

(declare-fun b_and!13015 () Bool)

(assert (=> b!227520 (= tp!21450 b_and!13015)))

(declare-fun b!227516 () Bool)

(declare-fun e!147602 () Bool)

(declare-fun call!21131 () Bool)

(assert (=> b!227516 (= e!147602 (not call!21131))))

(declare-fun b!227517 () Bool)

(declare-fun e!147600 () Bool)

(assert (=> b!227517 (= e!147600 e!147602)))

(declare-fun res!112001 () Bool)

(declare-fun call!21132 () Bool)

(assert (=> b!227517 (= res!112001 call!21132)))

(assert (=> b!227517 (=> (not res!112001) (not e!147602))))

(declare-fun b!227518 () Bool)

(declare-fun e!147597 () Bool)

(declare-fun tp_is_empty!5965 () Bool)

(assert (=> b!227518 (= e!147597 tp_is_empty!5965)))

(declare-fun b!227519 () Bool)

(declare-fun e!147599 () Bool)

(declare-fun e!147601 () Bool)

(assert (=> b!227519 (= e!147599 e!147601)))

(declare-fun res!112003 () Bool)

(assert (=> b!227519 (=> (not res!112003) (not e!147601))))

(declare-datatypes ((SeekEntryResult!866 0))(
  ( (MissingZero!866 (index!5634 (_ BitVec 32))) (Found!866 (index!5635 (_ BitVec 32))) (Intermediate!866 (undefined!1678 Bool) (index!5636 (_ BitVec 32)) (x!23254 (_ BitVec 32))) (Undefined!866) (MissingVacant!866 (index!5637 (_ BitVec 32))) )
))
(declare-fun lt!114530 () SeekEntryResult!866)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227519 (= res!112003 (or (= lt!114530 (MissingZero!866 index!297)) (= lt!114530 (MissingVacant!866 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7601 0))(
  ( (V!7602 (val!3027 Int)) )
))
(declare-datatypes ((ValueCell!2639 0))(
  ( (ValueCellFull!2639 (v!5048 V!7601)) (EmptyCell!2639) )
))
(declare-datatypes ((array!11171 0))(
  ( (array!11172 (arr!5305 (Array (_ BitVec 32) ValueCell!2639)) (size!5638 (_ BitVec 32))) )
))
(declare-datatypes ((array!11173 0))(
  ( (array!11174 (arr!5306 (Array (_ BitVec 32) (_ BitVec 64))) (size!5639 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3178 0))(
  ( (LongMapFixedSize!3179 (defaultEntry!4248 Int) (mask!10110 (_ BitVec 32)) (extraKeys!3985 (_ BitVec 32)) (zeroValue!4089 V!7601) (minValue!4089 V!7601) (_size!1638 (_ BitVec 32)) (_keys!6302 array!11173) (_values!4231 array!11171) (_vacant!1638 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3178)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11173 (_ BitVec 32)) SeekEntryResult!866)

(assert (=> b!227519 (= lt!114530 (seekEntryOrOpen!0 key!932 (_keys!6302 thiss!1504) (mask!10110 thiss!1504)))))

(declare-fun e!147608 () Bool)

(declare-fun e!147598 () Bool)

(declare-fun array_inv!3487 (array!11173) Bool)

(declare-fun array_inv!3488 (array!11171) Bool)

(assert (=> b!227520 (= e!147608 (and tp!21450 tp_is_empty!5965 (array_inv!3487 (_keys!6302 thiss!1504)) (array_inv!3488 (_values!4231 thiss!1504)) e!147598))))

(declare-fun b!227521 () Bool)

(declare-fun e!147603 () Bool)

(assert (=> b!227521 (= e!147603 true)))

(declare-fun lt!114528 () Bool)

(declare-datatypes ((List!3310 0))(
  ( (Nil!3307) (Cons!3306 (h!3954 (_ BitVec 64)) (t!8261 List!3310)) )
))
(declare-fun arrayNoDuplicates!0 (array!11173 (_ BitVec 32) List!3310) Bool)

(assert (=> b!227521 (= lt!114528 (arrayNoDuplicates!0 (_keys!6302 thiss!1504) #b00000000000000000000000000000000 Nil!3307))))

(declare-fun b!227522 () Bool)

(declare-datatypes ((Unit!6882 0))(
  ( (Unit!6883) )
))
(declare-fun e!147607 () Unit!6882)

(declare-fun lt!114527 () Unit!6882)

(assert (=> b!227522 (= e!147607 lt!114527)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!258 (array!11173 array!11171 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) Int) Unit!6882)

(assert (=> b!227522 (= lt!114527 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!258 (_keys!6302 thiss!1504) (_values!4231 thiss!1504) (mask!10110 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 (defaultEntry!4248 thiss!1504)))))

(declare-fun c!37729 () Bool)

(get-info :version)

(assert (=> b!227522 (= c!37729 ((_ is MissingZero!866) lt!114530))))

(declare-fun e!147596 () Bool)

(assert (=> b!227522 e!147596))

(declare-fun b!227523 () Bool)

(declare-fun e!147594 () Bool)

(assert (=> b!227523 (= e!147594 (not e!147603))))

(declare-fun res!111996 () Bool)

(assert (=> b!227523 (=> res!111996 e!147603)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227523 (= res!111996 (not (validMask!0 (mask!10110 thiss!1504))))))

(declare-fun lt!114523 () array!11173)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11173 (_ BitVec 32)) Bool)

(assert (=> b!227523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114523 (mask!10110 thiss!1504))))

(declare-fun lt!114529 () Unit!6882)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11173 (_ BitVec 32) (_ BitVec 32)) Unit!6882)

(assert (=> b!227523 (= lt!114529 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6302 thiss!1504) index!297 (mask!10110 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11173 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227523 (= (arrayCountValidKeys!0 lt!114523 #b00000000000000000000000000000000 (size!5639 (_keys!6302 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6302 thiss!1504) #b00000000000000000000000000000000 (size!5639 (_keys!6302 thiss!1504)))))))

(declare-fun lt!114532 () Unit!6882)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11173 (_ BitVec 32) (_ BitVec 64)) Unit!6882)

(assert (=> b!227523 (= lt!114532 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6302 thiss!1504) index!297 key!932))))

(assert (=> b!227523 (arrayNoDuplicates!0 lt!114523 #b00000000000000000000000000000000 Nil!3307)))

(assert (=> b!227523 (= lt!114523 (array!11174 (store (arr!5306 (_keys!6302 thiss!1504)) index!297 key!932) (size!5639 (_keys!6302 thiss!1504))))))

(declare-fun lt!114525 () Unit!6882)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11173 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3310) Unit!6882)

(assert (=> b!227523 (= lt!114525 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6302 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3307))))

(declare-fun lt!114531 () Unit!6882)

(declare-fun e!147604 () Unit!6882)

(assert (=> b!227523 (= lt!114531 e!147604)))

(declare-fun c!37726 () Bool)

(declare-fun arrayContainsKey!0 (array!11173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227523 (= c!37726 (arrayContainsKey!0 (_keys!6302 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227525 () Bool)

(declare-fun res!112006 () Bool)

(assert (=> b!227525 (= res!112006 (= (select (arr!5306 (_keys!6302 thiss!1504)) (index!5637 lt!114530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227525 (=> (not res!112006) (not e!147602))))

(declare-fun b!227526 () Bool)

(declare-fun e!147595 () Bool)

(assert (=> b!227526 (= e!147595 (not call!21131))))

(declare-fun b!227527 () Bool)

(declare-fun res!111997 () Bool)

(assert (=> b!227527 (=> res!111997 e!147603)))

(assert (=> b!227527 (= res!111997 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6302 thiss!1504) (mask!10110 thiss!1504))))))

(declare-fun b!227528 () Bool)

(declare-fun res!112004 () Bool)

(assert (=> b!227528 (=> (not res!112004) (not e!147595))))

(assert (=> b!227528 (= res!112004 call!21132)))

(assert (=> b!227528 (= e!147596 e!147595)))

(declare-fun mapIsEmpty!10117 () Bool)

(declare-fun mapRes!10117 () Bool)

(assert (=> mapIsEmpty!10117 mapRes!10117))

(declare-fun b!227529 () Bool)

(declare-fun res!112000 () Bool)

(assert (=> b!227529 (=> (not res!112000) (not e!147599))))

(assert (=> b!227529 (= res!112000 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227530 () Bool)

(assert (=> b!227530 (= e!147598 (and e!147597 mapRes!10117))))

(declare-fun condMapEmpty!10117 () Bool)

(declare-fun mapDefault!10117 () ValueCell!2639)

(assert (=> b!227530 (= condMapEmpty!10117 (= (arr!5305 (_values!4231 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2639)) mapDefault!10117)))))

(declare-fun mapNonEmpty!10117 () Bool)

(declare-fun tp!21451 () Bool)

(declare-fun e!147606 () Bool)

(assert (=> mapNonEmpty!10117 (= mapRes!10117 (and tp!21451 e!147606))))

(declare-fun mapRest!10117 () (Array (_ BitVec 32) ValueCell!2639))

(declare-fun mapKey!10117 () (_ BitVec 32))

(declare-fun mapValue!10117 () ValueCell!2639)

(assert (=> mapNonEmpty!10117 (= (arr!5305 (_values!4231 thiss!1504)) (store mapRest!10117 mapKey!10117 mapValue!10117))))

(declare-fun b!227531 () Bool)

(assert (=> b!227531 (= e!147600 ((_ is Undefined!866) lt!114530))))

(declare-fun b!227532 () Bool)

(declare-fun Unit!6884 () Unit!6882)

(assert (=> b!227532 (= e!147604 Unit!6884)))

(declare-fun lt!114524 () Unit!6882)

(declare-fun lemmaArrayContainsKeyThenInListMap!106 (array!11173 array!11171 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) (_ BitVec 32) Int) Unit!6882)

(assert (=> b!227532 (= lt!114524 (lemmaArrayContainsKeyThenInListMap!106 (_keys!6302 thiss!1504) (_values!4231 thiss!1504) (mask!10110 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4248 thiss!1504)))))

(assert (=> b!227532 false))

(declare-fun bm!21128 () Bool)

(assert (=> bm!21128 (= call!21131 (arrayContainsKey!0 (_keys!6302 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227533 () Bool)

(assert (=> b!227533 (= e!147601 e!147594)))

(declare-fun res!112005 () Bool)

(assert (=> b!227533 (=> (not res!112005) (not e!147594))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227533 (= res!112005 (inRange!0 index!297 (mask!10110 thiss!1504)))))

(declare-fun lt!114526 () Unit!6882)

(assert (=> b!227533 (= lt!114526 e!147607)))

(declare-fun c!37727 () Bool)

(declare-datatypes ((tuple2!4398 0))(
  ( (tuple2!4399 (_1!2210 (_ BitVec 64)) (_2!2210 V!7601)) )
))
(declare-datatypes ((List!3311 0))(
  ( (Nil!3308) (Cons!3307 (h!3955 tuple2!4398) (t!8262 List!3311)) )
))
(declare-datatypes ((ListLongMap!3313 0))(
  ( (ListLongMap!3314 (toList!1672 List!3311)) )
))
(declare-fun contains!1561 (ListLongMap!3313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1204 (array!11173 array!11171 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 32) Int) ListLongMap!3313)

(assert (=> b!227533 (= c!37727 (contains!1561 (getCurrentListMap!1204 (_keys!6302 thiss!1504) (_values!4231 thiss!1504) (mask!10110 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4248 thiss!1504)) key!932))))

(declare-fun b!227534 () Bool)

(declare-fun c!37728 () Bool)

(assert (=> b!227534 (= c!37728 ((_ is MissingVacant!866) lt!114530))))

(assert (=> b!227534 (= e!147596 e!147600)))

(declare-fun res!111998 () Bool)

(assert (=> start!22040 (=> (not res!111998) (not e!147599))))

(declare-fun valid!1282 (LongMapFixedSize!3178) Bool)

(assert (=> start!22040 (= res!111998 (valid!1282 thiss!1504))))

(assert (=> start!22040 e!147599))

(assert (=> start!22040 e!147608))

(assert (=> start!22040 true))

(declare-fun b!227524 () Bool)

(assert (=> b!227524 (= e!147606 tp_is_empty!5965)))

(declare-fun b!227535 () Bool)

(declare-fun res!111999 () Bool)

(assert (=> b!227535 (=> (not res!111999) (not e!147595))))

(assert (=> b!227535 (= res!111999 (= (select (arr!5306 (_keys!6302 thiss!1504)) (index!5634 lt!114530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227536 () Bool)

(declare-fun Unit!6885 () Unit!6882)

(assert (=> b!227536 (= e!147604 Unit!6885)))

(declare-fun b!227537 () Bool)

(declare-fun Unit!6886 () Unit!6882)

(assert (=> b!227537 (= e!147607 Unit!6886)))

(declare-fun lt!114522 () Unit!6882)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!266 (array!11173 array!11171 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) Int) Unit!6882)

(assert (=> b!227537 (= lt!114522 (lemmaInListMapThenSeekEntryOrOpenFindsIt!266 (_keys!6302 thiss!1504) (_values!4231 thiss!1504) (mask!10110 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 (defaultEntry!4248 thiss!1504)))))

(assert (=> b!227537 false))

(declare-fun b!227538 () Bool)

(declare-fun res!112002 () Bool)

(assert (=> b!227538 (=> res!112002 e!147603)))

(assert (=> b!227538 (= res!112002 (or (not (= (size!5638 (_values!4231 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10110 thiss!1504)))) (not (= (size!5639 (_keys!6302 thiss!1504)) (size!5638 (_values!4231 thiss!1504)))) (bvslt (mask!10110 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3985 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3985 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!21129 () Bool)

(assert (=> bm!21129 (= call!21132 (inRange!0 (ite c!37729 (index!5634 lt!114530) (index!5637 lt!114530)) (mask!10110 thiss!1504)))))

(assert (= (and start!22040 res!111998) b!227529))

(assert (= (and b!227529 res!112000) b!227519))

(assert (= (and b!227519 res!112003) b!227533))

(assert (= (and b!227533 c!37727) b!227537))

(assert (= (and b!227533 (not c!37727)) b!227522))

(assert (= (and b!227522 c!37729) b!227528))

(assert (= (and b!227522 (not c!37729)) b!227534))

(assert (= (and b!227528 res!112004) b!227535))

(assert (= (and b!227535 res!111999) b!227526))

(assert (= (and b!227534 c!37728) b!227517))

(assert (= (and b!227534 (not c!37728)) b!227531))

(assert (= (and b!227517 res!112001) b!227525))

(assert (= (and b!227525 res!112006) b!227516))

(assert (= (or b!227528 b!227517) bm!21129))

(assert (= (or b!227526 b!227516) bm!21128))

(assert (= (and b!227533 res!112005) b!227523))

(assert (= (and b!227523 c!37726) b!227532))

(assert (= (and b!227523 (not c!37726)) b!227536))

(assert (= (and b!227523 (not res!111996)) b!227538))

(assert (= (and b!227538 (not res!112002)) b!227527))

(assert (= (and b!227527 (not res!111997)) b!227521))

(assert (= (and b!227530 condMapEmpty!10117) mapIsEmpty!10117))

(assert (= (and b!227530 (not condMapEmpty!10117)) mapNonEmpty!10117))

(assert (= (and mapNonEmpty!10117 ((_ is ValueCellFull!2639) mapValue!10117)) b!227524))

(assert (= (and b!227530 ((_ is ValueCellFull!2639) mapDefault!10117)) b!227518))

(assert (= b!227520 b!227530))

(assert (= start!22040 b!227520))

(declare-fun m!249649 () Bool)

(assert (=> b!227520 m!249649))

(declare-fun m!249651 () Bool)

(assert (=> b!227520 m!249651))

(declare-fun m!249653 () Bool)

(assert (=> b!227523 m!249653))

(declare-fun m!249655 () Bool)

(assert (=> b!227523 m!249655))

(declare-fun m!249657 () Bool)

(assert (=> b!227523 m!249657))

(declare-fun m!249659 () Bool)

(assert (=> b!227523 m!249659))

(declare-fun m!249661 () Bool)

(assert (=> b!227523 m!249661))

(declare-fun m!249663 () Bool)

(assert (=> b!227523 m!249663))

(declare-fun m!249665 () Bool)

(assert (=> b!227523 m!249665))

(declare-fun m!249667 () Bool)

(assert (=> b!227523 m!249667))

(declare-fun m!249669 () Bool)

(assert (=> b!227523 m!249669))

(declare-fun m!249671 () Bool)

(assert (=> b!227523 m!249671))

(assert (=> bm!21128 m!249655))

(declare-fun m!249673 () Bool)

(assert (=> b!227525 m!249673))

(declare-fun m!249675 () Bool)

(assert (=> mapNonEmpty!10117 m!249675))

(declare-fun m!249677 () Bool)

(assert (=> bm!21129 m!249677))

(declare-fun m!249679 () Bool)

(assert (=> b!227537 m!249679))

(declare-fun m!249681 () Bool)

(assert (=> b!227522 m!249681))

(declare-fun m!249683 () Bool)

(assert (=> b!227521 m!249683))

(declare-fun m!249685 () Bool)

(assert (=> b!227533 m!249685))

(declare-fun m!249687 () Bool)

(assert (=> b!227533 m!249687))

(assert (=> b!227533 m!249687))

(declare-fun m!249689 () Bool)

(assert (=> b!227533 m!249689))

(declare-fun m!249691 () Bool)

(assert (=> b!227527 m!249691))

(declare-fun m!249693 () Bool)

(assert (=> b!227519 m!249693))

(declare-fun m!249695 () Bool)

(assert (=> start!22040 m!249695))

(declare-fun m!249697 () Bool)

(assert (=> b!227532 m!249697))

(declare-fun m!249699 () Bool)

(assert (=> b!227535 m!249699))

(check-sat b_and!13015 (not start!22040) (not bm!21128) (not b!227521) (not b!227537) tp_is_empty!5965 (not b!227527) (not bm!21129) (not b!227532) (not b_next!6103) (not b!227533) (not b!227520) (not b!227523) (not b!227519) (not b!227522) (not mapNonEmpty!10117))
(check-sat b_and!13015 (not b_next!6103))
