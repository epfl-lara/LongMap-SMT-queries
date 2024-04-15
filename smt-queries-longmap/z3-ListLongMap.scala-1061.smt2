; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22052 () Bool)

(assert start!22052)

(declare-fun b!227750 () Bool)

(declare-fun b_free!6115 () Bool)

(declare-fun b_next!6115 () Bool)

(assert (=> b!227750 (= b_free!6115 (not b_next!6115))))

(declare-fun tp!21487 () Bool)

(declare-fun b_and!12987 () Bool)

(assert (=> b!227750 (= tp!21487 b_and!12987)))

(declare-fun b!227736 () Bool)

(declare-fun e!147744 () Bool)

(declare-fun e!147747 () Bool)

(assert (=> b!227736 (= e!147744 (not e!147747))))

(declare-fun res!112078 () Bool)

(assert (=> b!227736 (=> res!112078 e!147747)))

(declare-datatypes ((V!7617 0))(
  ( (V!7618 (val!3033 Int)) )
))
(declare-datatypes ((ValueCell!2645 0))(
  ( (ValueCellFull!2645 (v!5047 V!7617)) (EmptyCell!2645) )
))
(declare-datatypes ((array!11189 0))(
  ( (array!11190 (arr!5313 (Array (_ BitVec 32) ValueCell!2645)) (size!5647 (_ BitVec 32))) )
))
(declare-datatypes ((array!11191 0))(
  ( (array!11192 (arr!5314 (Array (_ BitVec 32) (_ BitVec 64))) (size!5648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3190 0))(
  ( (LongMapFixedSize!3191 (defaultEntry!4254 Int) (mask!10119 (_ BitVec 32)) (extraKeys!3991 (_ BitVec 32)) (zeroValue!4095 V!7617) (minValue!4095 V!7617) (_size!1644 (_ BitVec 32)) (_keys!6307 array!11191) (_values!4237 array!11189) (_vacant!1644 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3190)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227736 (= res!112078 (not (validMask!0 (mask!10119 thiss!1504))))))

(declare-fun lt!114481 () array!11191)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11191 (_ BitVec 32)) Bool)

(assert (=> b!227736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114481 (mask!10119 thiss!1504))))

(declare-datatypes ((Unit!6888 0))(
  ( (Unit!6889) )
))
(declare-fun lt!114490 () Unit!6888)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11191 (_ BitVec 32) (_ BitVec 32)) Unit!6888)

(assert (=> b!227736 (= lt!114490 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6307 thiss!1504) index!297 (mask!10119 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11191 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227736 (= (arrayCountValidKeys!0 lt!114481 #b00000000000000000000000000000000 (size!5648 (_keys!6307 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6307 thiss!1504) #b00000000000000000000000000000000 (size!5648 (_keys!6307 thiss!1504)))))))

(declare-fun lt!114484 () Unit!6888)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11191 (_ BitVec 32) (_ BitVec 64)) Unit!6888)

(assert (=> b!227736 (= lt!114484 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6307 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3391 0))(
  ( (Nil!3388) (Cons!3387 (h!4035 (_ BitVec 64)) (t!8341 List!3391)) )
))
(declare-fun arrayNoDuplicates!0 (array!11191 (_ BitVec 32) List!3391) Bool)

(assert (=> b!227736 (arrayNoDuplicates!0 lt!114481 #b00000000000000000000000000000000 Nil!3388)))

(assert (=> b!227736 (= lt!114481 (array!11192 (store (arr!5314 (_keys!6307 thiss!1504)) index!297 key!932) (size!5648 (_keys!6307 thiss!1504))))))

(declare-fun lt!114485 () Unit!6888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3391) Unit!6888)

(assert (=> b!227736 (= lt!114485 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6307 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3388))))

(declare-fun lt!114483 () Unit!6888)

(declare-fun e!147746 () Unit!6888)

(assert (=> b!227736 (= lt!114483 e!147746)))

(declare-fun c!37760 () Bool)

(declare-fun arrayContainsKey!0 (array!11191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227736 (= c!37760 (arrayContainsKey!0 (_keys!6307 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227737 () Bool)

(declare-fun Unit!6890 () Unit!6888)

(assert (=> b!227737 (= e!147746 Unit!6890)))

(declare-fun lt!114488 () Unit!6888)

(declare-fun lemmaArrayContainsKeyThenInListMap!109 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) (_ BitVec 32) Int) Unit!6888)

(assert (=> b!227737 (= lt!114488 (lemmaArrayContainsKeyThenInListMap!109 (_keys!6307 thiss!1504) (_values!4237 thiss!1504) (mask!10119 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227737 false))

(declare-fun b!227738 () Bool)

(assert (=> b!227738 (= e!147747 true)))

(declare-fun lt!114486 () Bool)

(assert (=> b!227738 (= lt!114486 (arrayNoDuplicates!0 (_keys!6307 thiss!1504) #b00000000000000000000000000000000 Nil!3388))))

(declare-fun b!227739 () Bool)

(declare-fun e!147740 () Bool)

(declare-fun tp_is_empty!5977 () Bool)

(assert (=> b!227739 (= e!147740 tp_is_empty!5977)))

(declare-fun b!227740 () Bool)

(declare-fun e!147751 () Bool)

(declare-fun e!147752 () Bool)

(assert (=> b!227740 (= e!147751 e!147752)))

(declare-fun res!112086 () Bool)

(assert (=> b!227740 (=> (not res!112086) (not e!147752))))

(declare-datatypes ((SeekEntryResult!901 0))(
  ( (MissingZero!901 (index!5774 (_ BitVec 32))) (Found!901 (index!5775 (_ BitVec 32))) (Intermediate!901 (undefined!1713 Bool) (index!5776 (_ BitVec 32)) (x!23304 (_ BitVec 32))) (Undefined!901) (MissingVacant!901 (index!5777 (_ BitVec 32))) )
))
(declare-fun lt!114480 () SeekEntryResult!901)

(assert (=> b!227740 (= res!112086 (or (= lt!114480 (MissingZero!901 index!297)) (= lt!114480 (MissingVacant!901 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11191 (_ BitVec 32)) SeekEntryResult!901)

(assert (=> b!227740 (= lt!114480 (seekEntryOrOpen!0 key!932 (_keys!6307 thiss!1504) (mask!10119 thiss!1504)))))

(declare-fun mapNonEmpty!10135 () Bool)

(declare-fun mapRes!10135 () Bool)

(declare-fun tp!21486 () Bool)

(assert (=> mapNonEmpty!10135 (= mapRes!10135 (and tp!21486 e!147740))))

(declare-fun mapValue!10135 () ValueCell!2645)

(declare-fun mapRest!10135 () (Array (_ BitVec 32) ValueCell!2645))

(declare-fun mapKey!10135 () (_ BitVec 32))

(assert (=> mapNonEmpty!10135 (= (arr!5313 (_values!4237 thiss!1504)) (store mapRest!10135 mapKey!10135 mapValue!10135))))

(declare-fun bm!21152 () Bool)

(declare-fun call!21155 () Bool)

(assert (=> bm!21152 (= call!21155 (arrayContainsKey!0 (_keys!6307 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227742 () Bool)

(assert (=> b!227742 (= e!147752 e!147744)))

(declare-fun res!112087 () Bool)

(assert (=> b!227742 (=> (not res!112087) (not e!147744))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227742 (= res!112087 (inRange!0 index!297 (mask!10119 thiss!1504)))))

(declare-fun lt!114482 () Unit!6888)

(declare-fun e!147750 () Unit!6888)

(assert (=> b!227742 (= lt!114482 e!147750)))

(declare-fun c!37759 () Bool)

(declare-datatypes ((tuple2!4460 0))(
  ( (tuple2!4461 (_1!2241 (_ BitVec 64)) (_2!2241 V!7617)) )
))
(declare-datatypes ((List!3392 0))(
  ( (Nil!3389) (Cons!3388 (h!4036 tuple2!4460) (t!8342 List!3392)) )
))
(declare-datatypes ((ListLongMap!3363 0))(
  ( (ListLongMap!3364 (toList!1697 List!3392)) )
))
(declare-fun contains!1572 (ListLongMap!3363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1206 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 32) Int) ListLongMap!3363)

(assert (=> b!227742 (= c!37759 (contains!1572 (getCurrentListMap!1206 (_keys!6307 thiss!1504) (_values!4237 thiss!1504) (mask!10119 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4254 thiss!1504)) key!932))))

(declare-fun b!227743 () Bool)

(declare-fun res!112088 () Bool)

(assert (=> b!227743 (=> res!112088 e!147747)))

(assert (=> b!227743 (= res!112088 (or (not (= (size!5647 (_values!4237 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10119 thiss!1504)))) (not (= (size!5648 (_keys!6307 thiss!1504)) (size!5647 (_values!4237 thiss!1504)))) (bvslt (mask!10119 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3991 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3991 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227744 () Bool)

(declare-fun res!112079 () Bool)

(assert (=> b!227744 (=> (not res!112079) (not e!147751))))

(assert (=> b!227744 (= res!112079 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227745 () Bool)

(declare-fun res!112085 () Bool)

(declare-fun e!147745 () Bool)

(assert (=> b!227745 (=> (not res!112085) (not e!147745))))

(assert (=> b!227745 (= res!112085 (= (select (arr!5314 (_keys!6307 thiss!1504)) (index!5774 lt!114480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!37761 () Bool)

(declare-fun call!21156 () Bool)

(declare-fun bm!21153 () Bool)

(assert (=> bm!21153 (= call!21156 (inRange!0 (ite c!37761 (index!5774 lt!114480) (index!5777 lt!114480)) (mask!10119 thiss!1504)))))

(declare-fun b!227746 () Bool)

(declare-fun e!147749 () Bool)

(assert (=> b!227746 (= e!147749 tp_is_empty!5977)))

(declare-fun b!227747 () Bool)

(declare-fun Unit!6891 () Unit!6888)

(assert (=> b!227747 (= e!147746 Unit!6891)))

(declare-fun b!227748 () Bool)

(declare-fun e!147743 () Bool)

(get-info :version)

(assert (=> b!227748 (= e!147743 ((_ is Undefined!901) lt!114480))))

(declare-fun b!227749 () Bool)

(declare-fun Unit!6892 () Unit!6888)

(assert (=> b!227749 (= e!147750 Unit!6892)))

(declare-fun lt!114487 () Unit!6888)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!268 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) Int) Unit!6888)

(assert (=> b!227749 (= lt!114487 (lemmaInListMapThenSeekEntryOrOpenFindsIt!268 (_keys!6307 thiss!1504) (_values!4237 thiss!1504) (mask!10119 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227749 false))

(declare-fun e!147739 () Bool)

(declare-fun e!147753 () Bool)

(declare-fun array_inv!3507 (array!11191) Bool)

(declare-fun array_inv!3508 (array!11189) Bool)

(assert (=> b!227750 (= e!147753 (and tp!21487 tp_is_empty!5977 (array_inv!3507 (_keys!6307 thiss!1504)) (array_inv!3508 (_values!4237 thiss!1504)) e!147739))))

(declare-fun b!227751 () Bool)

(declare-fun e!147741 () Bool)

(assert (=> b!227751 (= e!147741 (not call!21155))))

(declare-fun b!227752 () Bool)

(declare-fun res!112081 () Bool)

(assert (=> b!227752 (=> (not res!112081) (not e!147745))))

(assert (=> b!227752 (= res!112081 call!21156)))

(declare-fun e!147748 () Bool)

(assert (=> b!227752 (= e!147748 e!147745)))

(declare-fun b!227753 () Bool)

(assert (=> b!227753 (= e!147743 e!147741)))

(declare-fun res!112080 () Bool)

(assert (=> b!227753 (= res!112080 call!21156)))

(assert (=> b!227753 (=> (not res!112080) (not e!147741))))

(declare-fun b!227754 () Bool)

(assert (=> b!227754 (= e!147739 (and e!147749 mapRes!10135))))

(declare-fun condMapEmpty!10135 () Bool)

(declare-fun mapDefault!10135 () ValueCell!2645)

(assert (=> b!227754 (= condMapEmpty!10135 (= (arr!5313 (_values!4237 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2645)) mapDefault!10135)))))

(declare-fun mapIsEmpty!10135 () Bool)

(assert (=> mapIsEmpty!10135 mapRes!10135))

(declare-fun b!227755 () Bool)

(declare-fun lt!114489 () Unit!6888)

(assert (=> b!227755 (= e!147750 lt!114489)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!263 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) Int) Unit!6888)

(assert (=> b!227755 (= lt!114489 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!263 (_keys!6307 thiss!1504) (_values!4237 thiss!1504) (mask!10119 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227755 (= c!37761 ((_ is MissingZero!901) lt!114480))))

(assert (=> b!227755 e!147748))

(declare-fun b!227756 () Bool)

(declare-fun c!37762 () Bool)

(assert (=> b!227756 (= c!37762 ((_ is MissingVacant!901) lt!114480))))

(assert (=> b!227756 (= e!147748 e!147743)))

(declare-fun b!227757 () Bool)

(declare-fun res!112084 () Bool)

(assert (=> b!227757 (= res!112084 (= (select (arr!5314 (_keys!6307 thiss!1504)) (index!5777 lt!114480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227757 (=> (not res!112084) (not e!147741))))

(declare-fun b!227758 () Bool)

(assert (=> b!227758 (= e!147745 (not call!21155))))

(declare-fun res!112082 () Bool)

(assert (=> start!22052 (=> (not res!112082) (not e!147751))))

(declare-fun valid!1292 (LongMapFixedSize!3190) Bool)

(assert (=> start!22052 (= res!112082 (valid!1292 thiss!1504))))

(assert (=> start!22052 e!147751))

(assert (=> start!22052 e!147753))

(assert (=> start!22052 true))

(declare-fun b!227741 () Bool)

(declare-fun res!112083 () Bool)

(assert (=> b!227741 (=> res!112083 e!147747)))

(assert (=> b!227741 (= res!112083 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6307 thiss!1504) (mask!10119 thiss!1504))))))

(assert (= (and start!22052 res!112082) b!227744))

(assert (= (and b!227744 res!112079) b!227740))

(assert (= (and b!227740 res!112086) b!227742))

(assert (= (and b!227742 c!37759) b!227749))

(assert (= (and b!227742 (not c!37759)) b!227755))

(assert (= (and b!227755 c!37761) b!227752))

(assert (= (and b!227755 (not c!37761)) b!227756))

(assert (= (and b!227752 res!112081) b!227745))

(assert (= (and b!227745 res!112085) b!227758))

(assert (= (and b!227756 c!37762) b!227753))

(assert (= (and b!227756 (not c!37762)) b!227748))

(assert (= (and b!227753 res!112080) b!227757))

(assert (= (and b!227757 res!112084) b!227751))

(assert (= (or b!227752 b!227753) bm!21153))

(assert (= (or b!227758 b!227751) bm!21152))

(assert (= (and b!227742 res!112087) b!227736))

(assert (= (and b!227736 c!37760) b!227737))

(assert (= (and b!227736 (not c!37760)) b!227747))

(assert (= (and b!227736 (not res!112078)) b!227743))

(assert (= (and b!227743 (not res!112088)) b!227741))

(assert (= (and b!227741 (not res!112083)) b!227738))

(assert (= (and b!227754 condMapEmpty!10135) mapIsEmpty!10135))

(assert (= (and b!227754 (not condMapEmpty!10135)) mapNonEmpty!10135))

(assert (= (and mapNonEmpty!10135 ((_ is ValueCellFull!2645) mapValue!10135)) b!227739))

(assert (= (and b!227754 ((_ is ValueCellFull!2645) mapDefault!10135)) b!227746))

(assert (= b!227750 b!227754))

(assert (= start!22052 b!227750))

(declare-fun m!249163 () Bool)

(assert (=> b!227749 m!249163))

(declare-fun m!249165 () Bool)

(assert (=> start!22052 m!249165))

(declare-fun m!249167 () Bool)

(assert (=> b!227757 m!249167))

(declare-fun m!249169 () Bool)

(assert (=> b!227742 m!249169))

(declare-fun m!249171 () Bool)

(assert (=> b!227742 m!249171))

(assert (=> b!227742 m!249171))

(declare-fun m!249173 () Bool)

(assert (=> b!227742 m!249173))

(declare-fun m!249175 () Bool)

(assert (=> b!227745 m!249175))

(declare-fun m!249177 () Bool)

(assert (=> bm!21152 m!249177))

(declare-fun m!249179 () Bool)

(assert (=> mapNonEmpty!10135 m!249179))

(declare-fun m!249181 () Bool)

(assert (=> bm!21153 m!249181))

(declare-fun m!249183 () Bool)

(assert (=> b!227750 m!249183))

(declare-fun m!249185 () Bool)

(assert (=> b!227750 m!249185))

(declare-fun m!249187 () Bool)

(assert (=> b!227755 m!249187))

(assert (=> b!227736 m!249177))

(declare-fun m!249189 () Bool)

(assert (=> b!227736 m!249189))

(declare-fun m!249191 () Bool)

(assert (=> b!227736 m!249191))

(declare-fun m!249193 () Bool)

(assert (=> b!227736 m!249193))

(declare-fun m!249195 () Bool)

(assert (=> b!227736 m!249195))

(declare-fun m!249197 () Bool)

(assert (=> b!227736 m!249197))

(declare-fun m!249199 () Bool)

(assert (=> b!227736 m!249199))

(declare-fun m!249201 () Bool)

(assert (=> b!227736 m!249201))

(declare-fun m!249203 () Bool)

(assert (=> b!227736 m!249203))

(declare-fun m!249205 () Bool)

(assert (=> b!227736 m!249205))

(declare-fun m!249207 () Bool)

(assert (=> b!227741 m!249207))

(declare-fun m!249209 () Bool)

(assert (=> b!227740 m!249209))

(declare-fun m!249211 () Bool)

(assert (=> b!227737 m!249211))

(declare-fun m!249213 () Bool)

(assert (=> b!227738 m!249213))

(check-sat (not start!22052) (not b!227740) (not bm!21152) b_and!12987 tp_is_empty!5977 (not b!227750) (not mapNonEmpty!10135) (not b!227755) (not b!227737) (not b!227742) (not b!227749) (not b!227741) (not bm!21153) (not b_next!6115) (not b!227736) (not b!227738))
(check-sat b_and!12987 (not b_next!6115))
