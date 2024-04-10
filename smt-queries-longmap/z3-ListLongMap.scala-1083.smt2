; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22182 () Bool)

(assert start!22182)

(declare-fun b!232153 () Bool)

(declare-fun b_free!6249 () Bool)

(declare-fun b_next!6249 () Bool)

(assert (=> b!232153 (= b_free!6249 (not b_next!6249))))

(declare-fun tp!21888 () Bool)

(declare-fun b_and!13147 () Bool)

(assert (=> b!232153 (= tp!21888 b_and!13147)))

(declare-fun b!232140 () Bool)

(declare-datatypes ((Unit!7162 0))(
  ( (Unit!7163) )
))
(declare-fun e!150736 () Unit!7162)

(declare-fun Unit!7164 () Unit!7162)

(assert (=> b!232140 (= e!150736 Unit!7164)))

(declare-fun lt!117169 () Unit!7162)

(declare-datatypes ((V!7795 0))(
  ( (V!7796 (val!3100 Int)) )
))
(declare-datatypes ((ValueCell!2712 0))(
  ( (ValueCellFull!2712 (v!5120 V!7795)) (EmptyCell!2712) )
))
(declare-datatypes ((array!11465 0))(
  ( (array!11466 (arr!5452 (Array (_ BitVec 32) ValueCell!2712)) (size!5785 (_ BitVec 32))) )
))
(declare-datatypes ((array!11467 0))(
  ( (array!11468 (arr!5453 (Array (_ BitVec 32) (_ BitVec 64))) (size!5786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3324 0))(
  ( (LongMapFixedSize!3325 (defaultEntry!4321 Int) (mask!10231 (_ BitVec 32)) (extraKeys!4058 (_ BitVec 32)) (zeroValue!4162 V!7795) (minValue!4162 V!7795) (_size!1711 (_ BitVec 32)) (_keys!6375 array!11467) (_values!4304 array!11465) (_vacant!1711 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3324)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!308 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7795 V!7795 (_ BitVec 64) Int) Unit!7162)

(assert (=> b!232140 (= lt!117169 (lemmaInListMapThenSeekEntryOrOpenFindsIt!308 (_keys!6375 thiss!1504) (_values!4304 thiss!1504) (mask!10231 thiss!1504) (extraKeys!4058 thiss!1504) (zeroValue!4162 thiss!1504) (minValue!4162 thiss!1504) key!932 (defaultEntry!4321 thiss!1504)))))

(assert (=> b!232140 false))

(declare-fun mapIsEmpty!10336 () Bool)

(declare-fun mapRes!10336 () Bool)

(assert (=> mapIsEmpty!10336 mapRes!10336))

(declare-fun b!232141 () Bool)

(declare-fun e!150743 () Bool)

(declare-fun call!21582 () Bool)

(assert (=> b!232141 (= e!150743 (not call!21582))))

(declare-fun b!232142 () Bool)

(declare-fun res!114023 () Bool)

(declare-fun e!150734 () Bool)

(assert (=> b!232142 (=> (not res!114023) (not e!150734))))

(declare-datatypes ((SeekEntryResult!960 0))(
  ( (MissingZero!960 (index!6010 (_ BitVec 32))) (Found!960 (index!6011 (_ BitVec 32))) (Intermediate!960 (undefined!1772 Bool) (index!6012 (_ BitVec 32)) (x!23540 (_ BitVec 32))) (Undefined!960) (MissingVacant!960 (index!6013 (_ BitVec 32))) )
))
(declare-fun lt!117165 () SeekEntryResult!960)

(assert (=> b!232142 (= res!114023 (= (select (arr!5453 (_keys!6375 thiss!1504)) (index!6010 lt!117165)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232143 () Bool)

(declare-fun e!150733 () Bool)

(declare-fun tp_is_empty!6111 () Bool)

(assert (=> b!232143 (= e!150733 tp_is_empty!6111)))

(declare-fun b!232144 () Bool)

(assert (=> b!232144 (= e!150734 (not call!21582))))

(declare-fun b!232145 () Bool)

(declare-fun e!150746 () Bool)

(assert (=> b!232145 (= e!150746 e!150743)))

(declare-fun res!114025 () Bool)

(declare-fun call!21581 () Bool)

(assert (=> b!232145 (= res!114025 call!21581)))

(assert (=> b!232145 (=> (not res!114025) (not e!150743))))

(declare-fun b!232146 () Bool)

(declare-fun e!150742 () Unit!7162)

(declare-fun Unit!7165 () Unit!7162)

(assert (=> b!232146 (= e!150742 Unit!7165)))

(declare-fun b!232147 () Bool)

(declare-fun e!150740 () Bool)

(declare-fun e!150739 () Bool)

(assert (=> b!232147 (= e!150740 (and e!150739 mapRes!10336))))

(declare-fun condMapEmpty!10336 () Bool)

(declare-fun mapDefault!10336 () ValueCell!2712)

(assert (=> b!232147 (= condMapEmpty!10336 (= (arr!5452 (_values!4304 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2712)) mapDefault!10336)))))

(declare-fun b!232148 () Bool)

(get-info :version)

(assert (=> b!232148 (= e!150746 ((_ is Undefined!960) lt!117165))))

(declare-fun b!232149 () Bool)

(declare-fun e!150735 () Bool)

(assert (=> b!232149 (= e!150735 (not true))))

(declare-fun lt!117159 () array!11467)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11467 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232149 (= (arrayCountValidKeys!0 lt!117159 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117164 () Unit!7162)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11467 (_ BitVec 32)) Unit!7162)

(assert (=> b!232149 (= lt!117164 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117159 index!297))))

(declare-fun arrayContainsKey!0 (array!11467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232149 (arrayContainsKey!0 lt!117159 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117162 () Unit!7162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11467 (_ BitVec 64) (_ BitVec 32)) Unit!7162)

(assert (=> b!232149 (= lt!117162 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117159 key!932 index!297))))

(declare-fun v!346 () V!7795)

(declare-datatypes ((tuple2!4576 0))(
  ( (tuple2!4577 (_1!2299 (_ BitVec 64)) (_2!2299 V!7795)) )
))
(declare-datatypes ((List!3494 0))(
  ( (Nil!3491) (Cons!3490 (h!4138 tuple2!4576) (t!8453 List!3494)) )
))
(declare-datatypes ((ListLongMap!3489 0))(
  ( (ListLongMap!3490 (toList!1760 List!3494)) )
))
(declare-fun lt!117170 () ListLongMap!3489)

(declare-fun +!623 (ListLongMap!3489 tuple2!4576) ListLongMap!3489)

(declare-fun getCurrentListMap!1288 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7795 V!7795 (_ BitVec 32) Int) ListLongMap!3489)

(assert (=> b!232149 (= (+!623 lt!117170 (tuple2!4577 key!932 v!346)) (getCurrentListMap!1288 lt!117159 (array!11466 (store (arr!5452 (_values!4304 thiss!1504)) index!297 (ValueCellFull!2712 v!346)) (size!5785 (_values!4304 thiss!1504))) (mask!10231 thiss!1504) (extraKeys!4058 thiss!1504) (zeroValue!4162 thiss!1504) (minValue!4162 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4321 thiss!1504)))))

(declare-fun lt!117158 () Unit!7162)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!77 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7795 V!7795 (_ BitVec 32) (_ BitVec 64) V!7795 Int) Unit!7162)

(assert (=> b!232149 (= lt!117158 (lemmaAddValidKeyToArrayThenAddPairToListMap!77 (_keys!6375 thiss!1504) (_values!4304 thiss!1504) (mask!10231 thiss!1504) (extraKeys!4058 thiss!1504) (zeroValue!4162 thiss!1504) (minValue!4162 thiss!1504) index!297 key!932 v!346 (defaultEntry!4321 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11467 (_ BitVec 32)) Bool)

(assert (=> b!232149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117159 (mask!10231 thiss!1504))))

(declare-fun lt!117163 () Unit!7162)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11467 (_ BitVec 32) (_ BitVec 32)) Unit!7162)

(assert (=> b!232149 (= lt!117163 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6375 thiss!1504) index!297 (mask!10231 thiss!1504)))))

(assert (=> b!232149 (= (arrayCountValidKeys!0 lt!117159 #b00000000000000000000000000000000 (size!5786 (_keys!6375 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6375 thiss!1504) #b00000000000000000000000000000000 (size!5786 (_keys!6375 thiss!1504)))))))

(declare-fun lt!117161 () Unit!7162)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11467 (_ BitVec 32) (_ BitVec 64)) Unit!7162)

(assert (=> b!232149 (= lt!117161 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6375 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3495 0))(
  ( (Nil!3492) (Cons!3491 (h!4139 (_ BitVec 64)) (t!8454 List!3495)) )
))
(declare-fun arrayNoDuplicates!0 (array!11467 (_ BitVec 32) List!3495) Bool)

(assert (=> b!232149 (arrayNoDuplicates!0 lt!117159 #b00000000000000000000000000000000 Nil!3492)))

(assert (=> b!232149 (= lt!117159 (array!11468 (store (arr!5453 (_keys!6375 thiss!1504)) index!297 key!932) (size!5786 (_keys!6375 thiss!1504))))))

(declare-fun lt!117157 () Unit!7162)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3495) Unit!7162)

(assert (=> b!232149 (= lt!117157 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6375 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3492))))

(declare-fun lt!117160 () Unit!7162)

(assert (=> b!232149 (= lt!117160 e!150742)))

(declare-fun c!38589 () Bool)

(assert (=> b!232149 (= c!38589 (arrayContainsKey!0 (_keys!6375 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232150 () Bool)

(declare-fun e!150741 () Bool)

(declare-fun e!150738 () Bool)

(assert (=> b!232150 (= e!150741 e!150738)))

(declare-fun res!114019 () Bool)

(assert (=> b!232150 (=> (not res!114019) (not e!150738))))

(assert (=> b!232150 (= res!114019 (or (= lt!117165 (MissingZero!960 index!297)) (= lt!117165 (MissingVacant!960 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11467 (_ BitVec 32)) SeekEntryResult!960)

(assert (=> b!232150 (= lt!117165 (seekEntryOrOpen!0 key!932 (_keys!6375 thiss!1504) (mask!10231 thiss!1504)))))

(declare-fun bm!21578 () Bool)

(assert (=> bm!21578 (= call!21582 (arrayContainsKey!0 (_keys!6375 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232151 () Bool)

(assert (=> b!232151 (= e!150739 tp_is_empty!6111)))

(declare-fun b!232152 () Bool)

(declare-fun res!114024 () Bool)

(assert (=> b!232152 (=> (not res!114024) (not e!150741))))

(assert (=> b!232152 (= res!114024 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21579 () Bool)

(declare-fun c!38590 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21579 (= call!21581 (inRange!0 (ite c!38590 (index!6010 lt!117165) (index!6013 lt!117165)) (mask!10231 thiss!1504)))))

(declare-fun mapNonEmpty!10336 () Bool)

(declare-fun tp!21889 () Bool)

(assert (=> mapNonEmpty!10336 (= mapRes!10336 (and tp!21889 e!150733))))

(declare-fun mapRest!10336 () (Array (_ BitVec 32) ValueCell!2712))

(declare-fun mapKey!10336 () (_ BitVec 32))

(declare-fun mapValue!10336 () ValueCell!2712)

(assert (=> mapNonEmpty!10336 (= (arr!5452 (_values!4304 thiss!1504)) (store mapRest!10336 mapKey!10336 mapValue!10336))))

(declare-fun res!114018 () Bool)

(assert (=> start!22182 (=> (not res!114018) (not e!150741))))

(declare-fun valid!1317 (LongMapFixedSize!3324) Bool)

(assert (=> start!22182 (= res!114018 (valid!1317 thiss!1504))))

(assert (=> start!22182 e!150741))

(declare-fun e!150745 () Bool)

(assert (=> start!22182 e!150745))

(assert (=> start!22182 true))

(assert (=> start!22182 tp_is_empty!6111))

(declare-fun array_inv!3593 (array!11467) Bool)

(declare-fun array_inv!3594 (array!11465) Bool)

(assert (=> b!232153 (= e!150745 (and tp!21888 tp_is_empty!6111 (array_inv!3593 (_keys!6375 thiss!1504)) (array_inv!3594 (_values!4304 thiss!1504)) e!150740))))

(declare-fun b!232154 () Bool)

(assert (=> b!232154 (= e!150738 e!150735)))

(declare-fun res!114020 () Bool)

(assert (=> b!232154 (=> (not res!114020) (not e!150735))))

(assert (=> b!232154 (= res!114020 (inRange!0 index!297 (mask!10231 thiss!1504)))))

(declare-fun lt!117167 () Unit!7162)

(assert (=> b!232154 (= lt!117167 e!150736)))

(declare-fun c!38591 () Bool)

(declare-fun contains!1628 (ListLongMap!3489 (_ BitVec 64)) Bool)

(assert (=> b!232154 (= c!38591 (contains!1628 lt!117170 key!932))))

(assert (=> b!232154 (= lt!117170 (getCurrentListMap!1288 (_keys!6375 thiss!1504) (_values!4304 thiss!1504) (mask!10231 thiss!1504) (extraKeys!4058 thiss!1504) (zeroValue!4162 thiss!1504) (minValue!4162 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4321 thiss!1504)))))

(declare-fun b!232155 () Bool)

(declare-fun Unit!7166 () Unit!7162)

(assert (=> b!232155 (= e!150742 Unit!7166)))

(declare-fun lt!117166 () Unit!7162)

(declare-fun lemmaArrayContainsKeyThenInListMap!143 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7795 V!7795 (_ BitVec 64) (_ BitVec 32) Int) Unit!7162)

(assert (=> b!232155 (= lt!117166 (lemmaArrayContainsKeyThenInListMap!143 (_keys!6375 thiss!1504) (_values!4304 thiss!1504) (mask!10231 thiss!1504) (extraKeys!4058 thiss!1504) (zeroValue!4162 thiss!1504) (minValue!4162 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4321 thiss!1504)))))

(assert (=> b!232155 false))

(declare-fun b!232156 () Bool)

(declare-fun lt!117168 () Unit!7162)

(assert (=> b!232156 (= e!150736 lt!117168)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!324 (array!11467 array!11465 (_ BitVec 32) (_ BitVec 32) V!7795 V!7795 (_ BitVec 64) Int) Unit!7162)

(assert (=> b!232156 (= lt!117168 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!324 (_keys!6375 thiss!1504) (_values!4304 thiss!1504) (mask!10231 thiss!1504) (extraKeys!4058 thiss!1504) (zeroValue!4162 thiss!1504) (minValue!4162 thiss!1504) key!932 (defaultEntry!4321 thiss!1504)))))

(assert (=> b!232156 (= c!38590 ((_ is MissingZero!960) lt!117165))))

(declare-fun e!150744 () Bool)

(assert (=> b!232156 e!150744))

(declare-fun b!232157 () Bool)

(declare-fun res!114021 () Bool)

(assert (=> b!232157 (= res!114021 (= (select (arr!5453 (_keys!6375 thiss!1504)) (index!6013 lt!117165)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232157 (=> (not res!114021) (not e!150743))))

(declare-fun b!232158 () Bool)

(declare-fun res!114022 () Bool)

(assert (=> b!232158 (=> (not res!114022) (not e!150734))))

(assert (=> b!232158 (= res!114022 call!21581)))

(assert (=> b!232158 (= e!150744 e!150734)))

(declare-fun b!232159 () Bool)

(declare-fun c!38592 () Bool)

(assert (=> b!232159 (= c!38592 ((_ is MissingVacant!960) lt!117165))))

(assert (=> b!232159 (= e!150744 e!150746)))

(assert (= (and start!22182 res!114018) b!232152))

(assert (= (and b!232152 res!114024) b!232150))

(assert (= (and b!232150 res!114019) b!232154))

(assert (= (and b!232154 c!38591) b!232140))

(assert (= (and b!232154 (not c!38591)) b!232156))

(assert (= (and b!232156 c!38590) b!232158))

(assert (= (and b!232156 (not c!38590)) b!232159))

(assert (= (and b!232158 res!114022) b!232142))

(assert (= (and b!232142 res!114023) b!232144))

(assert (= (and b!232159 c!38592) b!232145))

(assert (= (and b!232159 (not c!38592)) b!232148))

(assert (= (and b!232145 res!114025) b!232157))

(assert (= (and b!232157 res!114021) b!232141))

(assert (= (or b!232158 b!232145) bm!21579))

(assert (= (or b!232144 b!232141) bm!21578))

(assert (= (and b!232154 res!114020) b!232149))

(assert (= (and b!232149 c!38589) b!232155))

(assert (= (and b!232149 (not c!38589)) b!232146))

(assert (= (and b!232147 condMapEmpty!10336) mapIsEmpty!10336))

(assert (= (and b!232147 (not condMapEmpty!10336)) mapNonEmpty!10336))

(assert (= (and mapNonEmpty!10336 ((_ is ValueCellFull!2712) mapValue!10336)) b!232143))

(assert (= (and b!232147 ((_ is ValueCellFull!2712) mapDefault!10336)) b!232151))

(assert (= b!232153 b!232147))

(assert (= start!22182 b!232153))

(declare-fun m!253555 () Bool)

(assert (=> b!232149 m!253555))

(declare-fun m!253557 () Bool)

(assert (=> b!232149 m!253557))

(declare-fun m!253559 () Bool)

(assert (=> b!232149 m!253559))

(declare-fun m!253561 () Bool)

(assert (=> b!232149 m!253561))

(declare-fun m!253563 () Bool)

(assert (=> b!232149 m!253563))

(declare-fun m!253565 () Bool)

(assert (=> b!232149 m!253565))

(declare-fun m!253567 () Bool)

(assert (=> b!232149 m!253567))

(declare-fun m!253569 () Bool)

(assert (=> b!232149 m!253569))

(declare-fun m!253571 () Bool)

(assert (=> b!232149 m!253571))

(declare-fun m!253573 () Bool)

(assert (=> b!232149 m!253573))

(declare-fun m!253575 () Bool)

(assert (=> b!232149 m!253575))

(declare-fun m!253577 () Bool)

(assert (=> b!232149 m!253577))

(declare-fun m!253579 () Bool)

(assert (=> b!232149 m!253579))

(declare-fun m!253581 () Bool)

(assert (=> b!232149 m!253581))

(declare-fun m!253583 () Bool)

(assert (=> b!232149 m!253583))

(declare-fun m!253585 () Bool)

(assert (=> b!232149 m!253585))

(declare-fun m!253587 () Bool)

(assert (=> b!232149 m!253587))

(declare-fun m!253589 () Bool)

(assert (=> b!232142 m!253589))

(declare-fun m!253591 () Bool)

(assert (=> b!232157 m!253591))

(declare-fun m!253593 () Bool)

(assert (=> b!232156 m!253593))

(declare-fun m!253595 () Bool)

(assert (=> b!232150 m!253595))

(declare-fun m!253597 () Bool)

(assert (=> bm!21579 m!253597))

(declare-fun m!253599 () Bool)

(assert (=> start!22182 m!253599))

(declare-fun m!253601 () Bool)

(assert (=> b!232140 m!253601))

(declare-fun m!253603 () Bool)

(assert (=> b!232155 m!253603))

(assert (=> bm!21578 m!253557))

(declare-fun m!253605 () Bool)

(assert (=> b!232154 m!253605))

(declare-fun m!253607 () Bool)

(assert (=> b!232154 m!253607))

(declare-fun m!253609 () Bool)

(assert (=> b!232154 m!253609))

(declare-fun m!253611 () Bool)

(assert (=> b!232153 m!253611))

(declare-fun m!253613 () Bool)

(assert (=> b!232153 m!253613))

(declare-fun m!253615 () Bool)

(assert (=> mapNonEmpty!10336 m!253615))

(check-sat (not mapNonEmpty!10336) (not b!232154) (not b!232150) (not b!232156) (not b!232149) (not bm!21578) (not b!232155) (not start!22182) b_and!13147 (not bm!21579) (not b!232153) (not b!232140) tp_is_empty!6111 (not b_next!6249))
(check-sat b_and!13147 (not b_next!6249))
