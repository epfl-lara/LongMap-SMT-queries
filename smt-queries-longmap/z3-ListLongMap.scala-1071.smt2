; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22112 () Bool)

(assert start!22112)

(declare-fun b!229778 () Bool)

(declare-fun b_free!6175 () Bool)

(declare-fun b_next!6175 () Bool)

(assert (=> b!229778 (= b_free!6175 (not b_next!6175))))

(declare-fun tp!21666 () Bool)

(declare-fun b_and!13047 () Bool)

(assert (=> b!229778 (= tp!21666 b_and!13047)))

(declare-fun b!229773 () Bool)

(declare-fun e!149083 () Bool)

(declare-datatypes ((SeekEntryResult!926 0))(
  ( (MissingZero!926 (index!5874 (_ BitVec 32))) (Found!926 (index!5875 (_ BitVec 32))) (Intermediate!926 (undefined!1738 Bool) (index!5876 (_ BitVec 32)) (x!23409 (_ BitVec 32))) (Undefined!926) (MissingVacant!926 (index!5877 (_ BitVec 32))) )
))
(declare-fun lt!115489 () SeekEntryResult!926)

(get-info :version)

(assert (=> b!229773 (= e!149083 ((_ is Undefined!926) lt!115489))))

(declare-fun b!229774 () Bool)

(declare-fun res!113038 () Bool)

(declare-datatypes ((V!7697 0))(
  ( (V!7698 (val!3063 Int)) )
))
(declare-datatypes ((ValueCell!2675 0))(
  ( (ValueCellFull!2675 (v!5077 V!7697)) (EmptyCell!2675) )
))
(declare-datatypes ((array!11309 0))(
  ( (array!11310 (arr!5373 (Array (_ BitVec 32) ValueCell!2675)) (size!5707 (_ BitVec 32))) )
))
(declare-datatypes ((array!11311 0))(
  ( (array!11312 (arr!5374 (Array (_ BitVec 32) (_ BitVec 64))) (size!5708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3250 0))(
  ( (LongMapFixedSize!3251 (defaultEntry!4284 Int) (mask!10169 (_ BitVec 32)) (extraKeys!4021 (_ BitVec 32)) (zeroValue!4125 V!7697) (minValue!4125 V!7697) (_size!1674 (_ BitVec 32)) (_keys!6337 array!11311) (_values!4267 array!11309) (_vacant!1674 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3250)

(assert (=> b!229774 (= res!113038 (= (select (arr!5374 (_keys!6337 thiss!1504)) (index!5877 lt!115489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149089 () Bool)

(assert (=> b!229774 (=> (not res!113038) (not e!149089))))

(declare-fun b!229776 () Bool)

(declare-fun e!149086 () Bool)

(declare-fun e!149079 () Bool)

(declare-fun mapRes!10225 () Bool)

(assert (=> b!229776 (= e!149086 (and e!149079 mapRes!10225))))

(declare-fun condMapEmpty!10225 () Bool)

(declare-fun mapDefault!10225 () ValueCell!2675)

(assert (=> b!229776 (= condMapEmpty!10225 (= (arr!5373 (_values!4267 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2675)) mapDefault!10225)))))

(declare-fun b!229777 () Bool)

(declare-fun res!113040 () Bool)

(declare-fun e!149085 () Bool)

(assert (=> b!229777 (=> (not res!113040) (not e!149085))))

(declare-fun call!21335 () Bool)

(assert (=> b!229777 (= res!113040 call!21335)))

(declare-fun e!149088 () Bool)

(assert (=> b!229777 (= e!149088 e!149085)))

(declare-fun tp_is_empty!6037 () Bool)

(declare-fun e!149080 () Bool)

(declare-fun array_inv!3545 (array!11311) Bool)

(declare-fun array_inv!3546 (array!11309) Bool)

(assert (=> b!229778 (= e!149080 (and tp!21666 tp_is_empty!6037 (array_inv!3545 (_keys!6337 thiss!1504)) (array_inv!3546 (_values!4267 thiss!1504)) e!149086))))

(declare-fun b!229779 () Bool)

(assert (=> b!229779 (= e!149083 e!149089)))

(declare-fun res!113041 () Bool)

(assert (=> b!229779 (= res!113041 call!21335)))

(assert (=> b!229779 (=> (not res!113041) (not e!149089))))

(declare-fun bm!21332 () Bool)

(declare-fun call!21336 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21332 (= call!21336 (arrayContainsKey!0 (_keys!6337 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229780 () Bool)

(declare-datatypes ((Unit!6996 0))(
  ( (Unit!6997) )
))
(declare-fun e!149078 () Unit!6996)

(declare-fun lt!115483 () Unit!6996)

(assert (=> b!229780 (= e!149078 lt!115483)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!281 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) Int) Unit!6996)

(assert (=> b!229780 (= lt!115483 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!281 (_keys!6337 thiss!1504) (_values!4267 thiss!1504) (mask!10169 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 (defaultEntry!4284 thiss!1504)))))

(declare-fun c!38120 () Bool)

(assert (=> b!229780 (= c!38120 ((_ is MissingZero!926) lt!115489))))

(assert (=> b!229780 e!149088))

(declare-fun b!229781 () Bool)

(declare-fun e!149090 () Unit!6996)

(declare-fun Unit!6998 () Unit!6996)

(assert (=> b!229781 (= e!149090 Unit!6998)))

(declare-fun b!229782 () Bool)

(declare-fun e!149084 () Bool)

(assert (=> b!229782 (= e!149084 (not true))))

(declare-fun lt!115490 () array!11311)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun v!346 () V!7697)

(declare-datatypes ((tuple2!4492 0))(
  ( (tuple2!4493 (_1!2257 (_ BitVec 64)) (_2!2257 V!7697)) )
))
(declare-datatypes ((List!3430 0))(
  ( (Nil!3427) (Cons!3426 (h!4074 tuple2!4492) (t!8380 List!3430)) )
))
(declare-datatypes ((ListLongMap!3395 0))(
  ( (ListLongMap!3396 (toList!1713 List!3430)) )
))
(declare-fun lt!115481 () ListLongMap!3395)

(declare-fun +!599 (ListLongMap!3395 tuple2!4492) ListLongMap!3395)

(declare-fun getCurrentListMap!1222 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 32) Int) ListLongMap!3395)

(assert (=> b!229782 (= (+!599 lt!115481 (tuple2!4493 key!932 v!346)) (getCurrentListMap!1222 lt!115490 (array!11310 (store (arr!5373 (_values!4267 thiss!1504)) index!297 (ValueCellFull!2675 v!346)) (size!5707 (_values!4267 thiss!1504))) (mask!10169 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(declare-fun lt!115492 () Unit!6996)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!54 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 32) (_ BitVec 64) V!7697 Int) Unit!6996)

(assert (=> b!229782 (= lt!115492 (lemmaAddValidKeyToArrayThenAddPairToListMap!54 (_keys!6337 thiss!1504) (_values!4267 thiss!1504) (mask!10169 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) index!297 key!932 v!346 (defaultEntry!4284 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11311 (_ BitVec 32)) Bool)

(assert (=> b!229782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115490 (mask!10169 thiss!1504))))

(declare-fun lt!115484 () Unit!6996)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11311 (_ BitVec 32) (_ BitVec 32)) Unit!6996)

(assert (=> b!229782 (= lt!115484 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6337 thiss!1504) index!297 (mask!10169 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229782 (= (arrayCountValidKeys!0 lt!115490 #b00000000000000000000000000000000 (size!5708 (_keys!6337 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6337 thiss!1504) #b00000000000000000000000000000000 (size!5708 (_keys!6337 thiss!1504)))))))

(declare-fun lt!115491 () Unit!6996)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11311 (_ BitVec 32) (_ BitVec 64)) Unit!6996)

(assert (=> b!229782 (= lt!115491 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6337 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3431 0))(
  ( (Nil!3428) (Cons!3427 (h!4075 (_ BitVec 64)) (t!8381 List!3431)) )
))
(declare-fun arrayNoDuplicates!0 (array!11311 (_ BitVec 32) List!3431) Bool)

(assert (=> b!229782 (arrayNoDuplicates!0 lt!115490 #b00000000000000000000000000000000 Nil!3428)))

(assert (=> b!229782 (= lt!115490 (array!11312 (store (arr!5374 (_keys!6337 thiss!1504)) index!297 key!932) (size!5708 (_keys!6337 thiss!1504))))))

(declare-fun lt!115487 () Unit!6996)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3431) Unit!6996)

(assert (=> b!229782 (= lt!115487 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6337 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3428))))

(declare-fun lt!115485 () Unit!6996)

(assert (=> b!229782 (= lt!115485 e!149090)))

(declare-fun c!38121 () Bool)

(assert (=> b!229782 (= c!38121 (arrayContainsKey!0 (_keys!6337 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229783 () Bool)

(declare-fun e!149082 () Bool)

(assert (=> b!229783 (= e!149082 e!149084)))

(declare-fun res!113036 () Bool)

(assert (=> b!229783 (=> (not res!113036) (not e!149084))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229783 (= res!113036 (inRange!0 index!297 (mask!10169 thiss!1504)))))

(declare-fun lt!115486 () Unit!6996)

(assert (=> b!229783 (= lt!115486 e!149078)))

(declare-fun c!38122 () Bool)

(declare-fun contains!1588 (ListLongMap!3395 (_ BitVec 64)) Bool)

(assert (=> b!229783 (= c!38122 (contains!1588 lt!115481 key!932))))

(assert (=> b!229783 (= lt!115481 (getCurrentListMap!1222 (_keys!6337 thiss!1504) (_values!4267 thiss!1504) (mask!10169 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(declare-fun b!229784 () Bool)

(declare-fun e!149087 () Bool)

(assert (=> b!229784 (= e!149087 tp_is_empty!6037)))

(declare-fun b!229785 () Bool)

(declare-fun Unit!6999 () Unit!6996)

(assert (=> b!229785 (= e!149078 Unit!6999)))

(declare-fun lt!115482 () Unit!6996)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!285 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) Int) Unit!6996)

(assert (=> b!229785 (= lt!115482 (lemmaInListMapThenSeekEntryOrOpenFindsIt!285 (_keys!6337 thiss!1504) (_values!4267 thiss!1504) (mask!10169 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 (defaultEntry!4284 thiss!1504)))))

(assert (=> b!229785 false))

(declare-fun b!229786 () Bool)

(declare-fun e!149081 () Bool)

(assert (=> b!229786 (= e!149081 e!149082)))

(declare-fun res!113035 () Bool)

(assert (=> b!229786 (=> (not res!113035) (not e!149082))))

(assert (=> b!229786 (= res!113035 (or (= lt!115489 (MissingZero!926 index!297)) (= lt!115489 (MissingVacant!926 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11311 (_ BitVec 32)) SeekEntryResult!926)

(assert (=> b!229786 (= lt!115489 (seekEntryOrOpen!0 key!932 (_keys!6337 thiss!1504) (mask!10169 thiss!1504)))))

(declare-fun res!113039 () Bool)

(assert (=> start!22112 (=> (not res!113039) (not e!149081))))

(declare-fun valid!1309 (LongMapFixedSize!3250) Bool)

(assert (=> start!22112 (= res!113039 (valid!1309 thiss!1504))))

(assert (=> start!22112 e!149081))

(assert (=> start!22112 e!149080))

(assert (=> start!22112 true))

(assert (=> start!22112 tp_is_empty!6037))

(declare-fun b!229775 () Bool)

(declare-fun Unit!7000 () Unit!6996)

(assert (=> b!229775 (= e!149090 Unit!7000)))

(declare-fun lt!115488 () Unit!6996)

(declare-fun lemmaArrayContainsKeyThenInListMap!126 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) (_ BitVec 32) Int) Unit!6996)

(assert (=> b!229775 (= lt!115488 (lemmaArrayContainsKeyThenInListMap!126 (_keys!6337 thiss!1504) (_values!4267 thiss!1504) (mask!10169 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(assert (=> b!229775 false))

(declare-fun b!229787 () Bool)

(declare-fun res!113037 () Bool)

(assert (=> b!229787 (=> (not res!113037) (not e!149085))))

(assert (=> b!229787 (= res!113037 (= (select (arr!5374 (_keys!6337 thiss!1504)) (index!5874 lt!115489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229788 () Bool)

(declare-fun res!113042 () Bool)

(assert (=> b!229788 (=> (not res!113042) (not e!149081))))

(assert (=> b!229788 (= res!113042 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229789 () Bool)

(declare-fun c!38119 () Bool)

(assert (=> b!229789 (= c!38119 ((_ is MissingVacant!926) lt!115489))))

(assert (=> b!229789 (= e!149088 e!149083)))

(declare-fun bm!21333 () Bool)

(assert (=> bm!21333 (= call!21335 (inRange!0 (ite c!38120 (index!5874 lt!115489) (index!5877 lt!115489)) (mask!10169 thiss!1504)))))

(declare-fun b!229790 () Bool)

(assert (=> b!229790 (= e!149089 (not call!21336))))

(declare-fun mapNonEmpty!10225 () Bool)

(declare-fun tp!21667 () Bool)

(assert (=> mapNonEmpty!10225 (= mapRes!10225 (and tp!21667 e!149087))))

(declare-fun mapValue!10225 () ValueCell!2675)

(declare-fun mapKey!10225 () (_ BitVec 32))

(declare-fun mapRest!10225 () (Array (_ BitVec 32) ValueCell!2675))

(assert (=> mapNonEmpty!10225 (= (arr!5373 (_values!4267 thiss!1504)) (store mapRest!10225 mapKey!10225 mapValue!10225))))

(declare-fun mapIsEmpty!10225 () Bool)

(assert (=> mapIsEmpty!10225 mapRes!10225))

(declare-fun b!229791 () Bool)

(assert (=> b!229791 (= e!149079 tp_is_empty!6037)))

(declare-fun b!229792 () Bool)

(assert (=> b!229792 (= e!149085 (not call!21336))))

(assert (= (and start!22112 res!113039) b!229788))

(assert (= (and b!229788 res!113042) b!229786))

(assert (= (and b!229786 res!113035) b!229783))

(assert (= (and b!229783 c!38122) b!229785))

(assert (= (and b!229783 (not c!38122)) b!229780))

(assert (= (and b!229780 c!38120) b!229777))

(assert (= (and b!229780 (not c!38120)) b!229789))

(assert (= (and b!229777 res!113040) b!229787))

(assert (= (and b!229787 res!113037) b!229792))

(assert (= (and b!229789 c!38119) b!229779))

(assert (= (and b!229789 (not c!38119)) b!229773))

(assert (= (and b!229779 res!113041) b!229774))

(assert (= (and b!229774 res!113038) b!229790))

(assert (= (or b!229777 b!229779) bm!21333))

(assert (= (or b!229792 b!229790) bm!21332))

(assert (= (and b!229783 res!113036) b!229782))

(assert (= (and b!229782 c!38121) b!229775))

(assert (= (and b!229782 (not c!38121)) b!229781))

(assert (= (and b!229776 condMapEmpty!10225) mapIsEmpty!10225))

(assert (= (and b!229776 (not condMapEmpty!10225)) mapNonEmpty!10225))

(assert (= (and mapNonEmpty!10225 ((_ is ValueCellFull!2675) mapValue!10225)) b!229784))

(assert (= (and b!229776 ((_ is ValueCellFull!2675) mapDefault!10225)) b!229791))

(assert (= b!229778 b!229776))

(assert (= start!22112 b!229778))

(declare-fun m!250729 () Bool)

(assert (=> b!229785 m!250729))

(declare-fun m!250731 () Bool)

(assert (=> bm!21333 m!250731))

(declare-fun m!250733 () Bool)

(assert (=> b!229787 m!250733))

(declare-fun m!250735 () Bool)

(assert (=> b!229782 m!250735))

(declare-fun m!250737 () Bool)

(assert (=> b!229782 m!250737))

(declare-fun m!250739 () Bool)

(assert (=> b!229782 m!250739))

(declare-fun m!250741 () Bool)

(assert (=> b!229782 m!250741))

(declare-fun m!250743 () Bool)

(assert (=> b!229782 m!250743))

(declare-fun m!250745 () Bool)

(assert (=> b!229782 m!250745))

(declare-fun m!250747 () Bool)

(assert (=> b!229782 m!250747))

(declare-fun m!250749 () Bool)

(assert (=> b!229782 m!250749))

(declare-fun m!250751 () Bool)

(assert (=> b!229782 m!250751))

(declare-fun m!250753 () Bool)

(assert (=> b!229782 m!250753))

(declare-fun m!250755 () Bool)

(assert (=> b!229782 m!250755))

(declare-fun m!250757 () Bool)

(assert (=> b!229782 m!250757))

(declare-fun m!250759 () Bool)

(assert (=> b!229782 m!250759))

(declare-fun m!250761 () Bool)

(assert (=> mapNonEmpty!10225 m!250761))

(declare-fun m!250763 () Bool)

(assert (=> b!229780 m!250763))

(declare-fun m!250765 () Bool)

(assert (=> b!229778 m!250765))

(declare-fun m!250767 () Bool)

(assert (=> b!229778 m!250767))

(declare-fun m!250769 () Bool)

(assert (=> b!229775 m!250769))

(declare-fun m!250771 () Bool)

(assert (=> b!229774 m!250771))

(declare-fun m!250773 () Bool)

(assert (=> b!229786 m!250773))

(declare-fun m!250775 () Bool)

(assert (=> start!22112 m!250775))

(assert (=> bm!21332 m!250749))

(declare-fun m!250777 () Bool)

(assert (=> b!229783 m!250777))

(declare-fun m!250779 () Bool)

(assert (=> b!229783 m!250779))

(declare-fun m!250781 () Bool)

(assert (=> b!229783 m!250781))

(check-sat (not b!229775) (not b!229783) (not b!229785) (not start!22112) (not b_next!6175) (not b!229778) (not bm!21332) (not b!229780) tp_is_empty!6037 (not b!229786) b_and!13047 (not b!229782) (not mapNonEmpty!10225) (not bm!21333))
(check-sat b_and!13047 (not b_next!6175))
