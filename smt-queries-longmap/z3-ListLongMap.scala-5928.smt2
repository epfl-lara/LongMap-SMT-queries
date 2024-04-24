; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77396 () Bool)

(assert start!77396)

(declare-fun b!902006 () Bool)

(declare-fun b_free!16069 () Bool)

(declare-fun b_next!16069 () Bool)

(assert (=> b!902006 (= b_free!16069 (not b_next!16069))))

(declare-fun tp!56304 () Bool)

(declare-fun b_and!26405 () Bool)

(assert (=> b!902006 (= tp!56304 b_and!26405)))

(declare-fun b!902005 () Bool)

(declare-fun e!505019 () Bool)

(declare-datatypes ((SeekEntryResult!8902 0))(
  ( (MissingZero!8902 (index!37979 (_ BitVec 32))) (Found!8902 (index!37980 (_ BitVec 32))) (Intermediate!8902 (undefined!9714 Bool) (index!37981 (_ BitVec 32)) (x!76747 (_ BitVec 32))) (Undefined!8902) (MissingVacant!8902 (index!37982 (_ BitVec 32))) )
))
(declare-fun lt!407598 () SeekEntryResult!8902)

(declare-datatypes ((array!52887 0))(
  ( (array!52888 (arr!25408 (Array (_ BitVec 32) (_ BitVec 64))) (size!25868 (_ BitVec 32))) )
))
(declare-datatypes ((V!29495 0))(
  ( (V!29496 (val!9249 Int)) )
))
(declare-datatypes ((ValueCell!8717 0))(
  ( (ValueCellFull!8717 (v!11745 V!29495)) (EmptyCell!8717) )
))
(declare-datatypes ((array!52889 0))(
  ( (array!52890 (arr!25409 (Array (_ BitVec 32) ValueCell!8717)) (size!25869 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4450 0))(
  ( (LongMapFixedSize!4451 (defaultEntry!5463 Int) (mask!26309 (_ BitVec 32)) (extraKeys!5191 (_ BitVec 32)) (zeroValue!5295 V!29495) (minValue!5295 V!29495) (_size!2280 (_ BitVec 32)) (_keys!10301 array!52887) (_values!5482 array!52889) (_vacant!2280 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4450)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!902005 (= e!505019 (inRange!0 (index!37980 lt!407598) (mask!26309 thiss!1181)))))

(declare-fun mapIsEmpty!29278 () Bool)

(declare-fun mapRes!29278 () Bool)

(assert (=> mapIsEmpty!29278 mapRes!29278))

(declare-fun tp_is_empty!18397 () Bool)

(declare-fun e!505015 () Bool)

(declare-fun e!505020 () Bool)

(declare-fun array_inv!19990 (array!52887) Bool)

(declare-fun array_inv!19991 (array!52889) Bool)

(assert (=> b!902006 (= e!505015 (and tp!56304 tp_is_empty!18397 (array_inv!19990 (_keys!10301 thiss!1181)) (array_inv!19991 (_values!5482 thiss!1181)) e!505020))))

(declare-fun res!608799 () Bool)

(declare-fun e!505018 () Bool)

(assert (=> start!77396 (=> (not res!608799) (not e!505018))))

(declare-fun valid!1720 (LongMapFixedSize!4450) Bool)

(assert (=> start!77396 (= res!608799 (valid!1720 thiss!1181))))

(assert (=> start!77396 e!505018))

(assert (=> start!77396 e!505015))

(assert (=> start!77396 true))

(declare-fun b!902007 () Bool)

(declare-fun e!505021 () Bool)

(assert (=> b!902007 (= e!505018 (not e!505021))))

(declare-fun res!608803 () Bool)

(assert (=> b!902007 (=> res!608803 e!505021)))

(get-info :version)

(assert (=> b!902007 (= res!608803 (not ((_ is Found!8902) lt!407598)))))

(assert (=> b!902007 e!505019))

(declare-fun res!608795 () Bool)

(assert (=> b!902007 (=> res!608795 e!505019)))

(assert (=> b!902007 (= res!608795 (not ((_ is Found!8902) lt!407598)))))

(declare-datatypes ((Unit!30607 0))(
  ( (Unit!30608) )
))
(declare-fun lt!407600 () Unit!30607)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!119 (array!52887 array!52889 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 64)) Unit!30607)

(assert (=> b!902007 (= lt!407600 (lemmaSeekEntryGivesInRangeIndex!119 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52887 (_ BitVec 32)) SeekEntryResult!8902)

(assert (=> b!902007 (= lt!407598 (seekEntry!0 key!785 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)))))

(declare-fun b!902008 () Bool)

(declare-fun res!608797 () Bool)

(declare-fun e!505014 () Bool)

(assert (=> b!902008 (=> res!608797 e!505014)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52887 (_ BitVec 32)) Bool)

(assert (=> b!902008 (= res!608797 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10301 thiss!1181) (mask!26309 thiss!1181))))))

(declare-fun b!902009 () Bool)

(declare-fun res!608800 () Bool)

(assert (=> b!902009 (=> res!608800 e!505014)))

(assert (=> b!902009 (= res!608800 (or (not (= (size!25869 (_values!5482 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26309 thiss!1181)))) (not (= (size!25868 (_keys!10301 thiss!1181)) (size!25869 (_values!5482 thiss!1181)))) (bvslt (mask!26309 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5191 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5191 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!902010 () Bool)

(declare-fun e!505017 () Bool)

(assert (=> b!902010 (= e!505017 tp_is_empty!18397)))

(declare-fun mapNonEmpty!29278 () Bool)

(declare-fun tp!56305 () Bool)

(declare-fun e!505016 () Bool)

(assert (=> mapNonEmpty!29278 (= mapRes!29278 (and tp!56305 e!505016))))

(declare-fun mapValue!29278 () ValueCell!8717)

(declare-fun mapKey!29278 () (_ BitVec 32))

(declare-fun mapRest!29278 () (Array (_ BitVec 32) ValueCell!8717))

(assert (=> mapNonEmpty!29278 (= (arr!25409 (_values!5482 thiss!1181)) (store mapRest!29278 mapKey!29278 mapValue!29278))))

(declare-fun b!902011 () Bool)

(declare-fun res!608794 () Bool)

(assert (=> b!902011 (=> res!608794 e!505014)))

(declare-datatypes ((tuple2!11990 0))(
  ( (tuple2!11991 (_1!6006 (_ BitVec 64)) (_2!6006 V!29495)) )
))
(declare-datatypes ((List!17822 0))(
  ( (Nil!17819) (Cons!17818 (h!18970 tuple2!11990) (t!25171 List!17822)) )
))
(declare-datatypes ((ListLongMap!10689 0))(
  ( (ListLongMap!10690 (toList!5360 List!17822)) )
))
(declare-fun lt!407599 () ListLongMap!10689)

(declare-fun contains!4411 (ListLongMap!10689 (_ BitVec 64)) Bool)

(assert (=> b!902011 (= res!608794 (not (contains!4411 lt!407599 key!785)))))

(declare-fun b!902012 () Bool)

(declare-fun res!608801 () Bool)

(assert (=> b!902012 (=> res!608801 e!505014)))

(assert (=> b!902012 (= res!608801 (not (inRange!0 (index!37980 lt!407598) (mask!26309 thiss!1181))))))

(declare-fun b!902013 () Bool)

(assert (=> b!902013 (= e!505021 e!505014)))

(declare-fun res!608798 () Bool)

(assert (=> b!902013 (=> res!608798 e!505014)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!902013 (= res!608798 (not (validMask!0 (mask!26309 thiss!1181))))))

(assert (=> b!902013 (contains!4411 lt!407599 (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598)))))

(declare-fun getCurrentListMap!2632 (array!52887 array!52889 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) ListLongMap!10689)

(assert (=> b!902013 (= lt!407599 (getCurrentListMap!2632 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407596 () Unit!30607)

(declare-fun lemmaValidKeyInArrayIsInListMap!262 (array!52887 array!52889 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) Unit!30607)

(assert (=> b!902013 (= lt!407596 (lemmaValidKeyInArrayIsInListMap!262 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) (index!37980 lt!407598) (defaultEntry!5463 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902013 (arrayContainsKey!0 (_keys!10301 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407597 () Unit!30607)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52887 (_ BitVec 64) (_ BitVec 32)) Unit!30607)

(assert (=> b!902013 (= lt!407597 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10301 thiss!1181) key!785 (index!37980 lt!407598)))))

(declare-fun b!902014 () Bool)

(declare-fun res!608802 () Bool)

(assert (=> b!902014 (=> (not res!608802) (not e!505018))))

(assert (=> b!902014 (= res!608802 (not (= key!785 (bvneg key!785))))))

(declare-fun b!902015 () Bool)

(assert (=> b!902015 (= e!505016 tp_is_empty!18397)))

(declare-fun b!902016 () Bool)

(declare-fun res!608796 () Bool)

(assert (=> b!902016 (=> res!608796 e!505014)))

(declare-datatypes ((List!17823 0))(
  ( (Nil!17820) (Cons!17819 (h!18971 (_ BitVec 64)) (t!25172 List!17823)) )
))
(declare-fun arrayNoDuplicates!0 (array!52887 (_ BitVec 32) List!17823) Bool)

(assert (=> b!902016 (= res!608796 (not (arrayNoDuplicates!0 (_keys!10301 thiss!1181) #b00000000000000000000000000000000 Nil!17820)))))

(declare-fun b!902017 () Bool)

(assert (=> b!902017 (= e!505014 (= (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598)) key!785))))

(declare-fun b!902018 () Bool)

(assert (=> b!902018 (= e!505020 (and e!505017 mapRes!29278))))

(declare-fun condMapEmpty!29278 () Bool)

(declare-fun mapDefault!29278 () ValueCell!8717)

(assert (=> b!902018 (= condMapEmpty!29278 (= (arr!25409 (_values!5482 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8717)) mapDefault!29278)))))

(assert (= (and start!77396 res!608799) b!902014))

(assert (= (and b!902014 res!608802) b!902007))

(assert (= (and b!902007 (not res!608795)) b!902005))

(assert (= (and b!902007 (not res!608803)) b!902013))

(assert (= (and b!902013 (not res!608798)) b!902009))

(assert (= (and b!902009 (not res!608800)) b!902008))

(assert (= (and b!902008 (not res!608797)) b!902016))

(assert (= (and b!902016 (not res!608796)) b!902011))

(assert (= (and b!902011 (not res!608794)) b!902012))

(assert (= (and b!902012 (not res!608801)) b!902017))

(assert (= (and b!902018 condMapEmpty!29278) mapIsEmpty!29278))

(assert (= (and b!902018 (not condMapEmpty!29278)) mapNonEmpty!29278))

(assert (= (and mapNonEmpty!29278 ((_ is ValueCellFull!8717) mapValue!29278)) b!902015))

(assert (= (and b!902018 ((_ is ValueCellFull!8717) mapDefault!29278)) b!902010))

(assert (= b!902006 b!902018))

(assert (= start!77396 b!902006))

(declare-fun m!838729 () Bool)

(assert (=> start!77396 m!838729))

(declare-fun m!838731 () Bool)

(assert (=> b!902007 m!838731))

(declare-fun m!838733 () Bool)

(assert (=> b!902007 m!838733))

(declare-fun m!838735 () Bool)

(assert (=> mapNonEmpty!29278 m!838735))

(declare-fun m!838737 () Bool)

(assert (=> b!902005 m!838737))

(declare-fun m!838739 () Bool)

(assert (=> b!902017 m!838739))

(declare-fun m!838741 () Bool)

(assert (=> b!902016 m!838741))

(declare-fun m!838743 () Bool)

(assert (=> b!902008 m!838743))

(declare-fun m!838745 () Bool)

(assert (=> b!902013 m!838745))

(declare-fun m!838747 () Bool)

(assert (=> b!902013 m!838747))

(assert (=> b!902013 m!838739))

(declare-fun m!838749 () Bool)

(assert (=> b!902013 m!838749))

(declare-fun m!838751 () Bool)

(assert (=> b!902013 m!838751))

(declare-fun m!838753 () Bool)

(assert (=> b!902013 m!838753))

(assert (=> b!902013 m!838739))

(declare-fun m!838755 () Bool)

(assert (=> b!902013 m!838755))

(assert (=> b!902012 m!838737))

(declare-fun m!838757 () Bool)

(assert (=> b!902011 m!838757))

(declare-fun m!838759 () Bool)

(assert (=> b!902006 m!838759))

(declare-fun m!838761 () Bool)

(assert (=> b!902006 m!838761))

(check-sat (not start!77396) b_and!26405 (not b!902012) (not b!902005) (not b_next!16069) (not b!902008) (not mapNonEmpty!29278) (not b!902007) (not b!902013) tp_is_empty!18397 (not b!902016) (not b!902011) (not b!902006))
(check-sat b_and!26405 (not b_next!16069))
(get-model)

(declare-fun d!112119 () Bool)

(assert (=> d!112119 (= (inRange!0 (index!37980 lt!407598) (mask!26309 thiss!1181)) (and (bvsge (index!37980 lt!407598) #b00000000000000000000000000000000) (bvslt (index!37980 lt!407598) (bvadd (mask!26309 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!902005 d!112119))

(declare-fun d!112121 () Bool)

(assert (=> d!112121 (= (validMask!0 (mask!26309 thiss!1181)) (and (or (= (mask!26309 thiss!1181) #b00000000000000000000000000000111) (= (mask!26309 thiss!1181) #b00000000000000000000000000001111) (= (mask!26309 thiss!1181) #b00000000000000000000000000011111) (= (mask!26309 thiss!1181) #b00000000000000000000000000111111) (= (mask!26309 thiss!1181) #b00000000000000000000000001111111) (= (mask!26309 thiss!1181) #b00000000000000000000000011111111) (= (mask!26309 thiss!1181) #b00000000000000000000000111111111) (= (mask!26309 thiss!1181) #b00000000000000000000001111111111) (= (mask!26309 thiss!1181) #b00000000000000000000011111111111) (= (mask!26309 thiss!1181) #b00000000000000000000111111111111) (= (mask!26309 thiss!1181) #b00000000000000000001111111111111) (= (mask!26309 thiss!1181) #b00000000000000000011111111111111) (= (mask!26309 thiss!1181) #b00000000000000000111111111111111) (= (mask!26309 thiss!1181) #b00000000000000001111111111111111) (= (mask!26309 thiss!1181) #b00000000000000011111111111111111) (= (mask!26309 thiss!1181) #b00000000000000111111111111111111) (= (mask!26309 thiss!1181) #b00000000000001111111111111111111) (= (mask!26309 thiss!1181) #b00000000000011111111111111111111) (= (mask!26309 thiss!1181) #b00000000000111111111111111111111) (= (mask!26309 thiss!1181) #b00000000001111111111111111111111) (= (mask!26309 thiss!1181) #b00000000011111111111111111111111) (= (mask!26309 thiss!1181) #b00000000111111111111111111111111) (= (mask!26309 thiss!1181) #b00000001111111111111111111111111) (= (mask!26309 thiss!1181) #b00000011111111111111111111111111) (= (mask!26309 thiss!1181) #b00000111111111111111111111111111) (= (mask!26309 thiss!1181) #b00001111111111111111111111111111) (= (mask!26309 thiss!1181) #b00011111111111111111111111111111) (= (mask!26309 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26309 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!902013 d!112121))

(declare-fun d!112123 () Bool)

(assert (=> d!112123 (arrayContainsKey!0 (_keys!10301 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407633 () Unit!30607)

(declare-fun choose!13 (array!52887 (_ BitVec 64) (_ BitVec 32)) Unit!30607)

(assert (=> d!112123 (= lt!407633 (choose!13 (_keys!10301 thiss!1181) key!785 (index!37980 lt!407598)))))

(assert (=> d!112123 (bvsge (index!37980 lt!407598) #b00000000000000000000000000000000)))

(assert (=> d!112123 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10301 thiss!1181) key!785 (index!37980 lt!407598)) lt!407633)))

(declare-fun bs!25314 () Bool)

(assert (= bs!25314 d!112123))

(assert (=> bs!25314 m!838751))

(declare-fun m!838831 () Bool)

(assert (=> bs!25314 m!838831))

(assert (=> b!902013 d!112123))

(declare-fun d!112125 () Bool)

(declare-fun e!505079 () Bool)

(assert (=> d!112125 e!505079))

(declare-fun res!608866 () Bool)

(assert (=> d!112125 (=> (not res!608866) (not e!505079))))

(assert (=> d!112125 (= res!608866 (and (bvsge (index!37980 lt!407598) #b00000000000000000000000000000000) (bvslt (index!37980 lt!407598) (size!25868 (_keys!10301 thiss!1181)))))))

(declare-fun lt!407636 () Unit!30607)

(declare-fun choose!1524 (array!52887 array!52889 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) Unit!30607)

(assert (=> d!112125 (= lt!407636 (choose!1524 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) (index!37980 lt!407598) (defaultEntry!5463 thiss!1181)))))

(assert (=> d!112125 (validMask!0 (mask!26309 thiss!1181))))

(assert (=> d!112125 (= (lemmaValidKeyInArrayIsInListMap!262 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) (index!37980 lt!407598) (defaultEntry!5463 thiss!1181)) lt!407636)))

(declare-fun b!902105 () Bool)

(assert (=> b!902105 (= e!505079 (contains!4411 (getCurrentListMap!2632 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)) (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598))))))

(assert (= (and d!112125 res!608866) b!902105))

(declare-fun m!838833 () Bool)

(assert (=> d!112125 m!838833))

(assert (=> d!112125 m!838753))

(assert (=> b!902105 m!838755))

(assert (=> b!902105 m!838739))

(assert (=> b!902105 m!838755))

(assert (=> b!902105 m!838739))

(declare-fun m!838835 () Bool)

(assert (=> b!902105 m!838835))

(assert (=> b!902013 d!112125))

(declare-fun d!112127 () Bool)

(declare-fun res!608871 () Bool)

(declare-fun e!505084 () Bool)

(assert (=> d!112127 (=> res!608871 e!505084)))

(assert (=> d!112127 (= res!608871 (= (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!112127 (= (arrayContainsKey!0 (_keys!10301 thiss!1181) key!785 #b00000000000000000000000000000000) e!505084)))

(declare-fun b!902110 () Bool)

(declare-fun e!505085 () Bool)

(assert (=> b!902110 (= e!505084 e!505085)))

(declare-fun res!608872 () Bool)

(assert (=> b!902110 (=> (not res!608872) (not e!505085))))

(assert (=> b!902110 (= res!608872 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25868 (_keys!10301 thiss!1181))))))

(declare-fun b!902111 () Bool)

(assert (=> b!902111 (= e!505085 (arrayContainsKey!0 (_keys!10301 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112127 (not res!608871)) b!902110))

(assert (= (and b!902110 res!608872) b!902111))

(declare-fun m!838837 () Bool)

(assert (=> d!112127 m!838837))

(declare-fun m!838839 () Bool)

(assert (=> b!902111 m!838839))

(assert (=> b!902013 d!112127))

(declare-fun call!40149 () ListLongMap!10689)

(declare-fun call!40147 () ListLongMap!10689)

(declare-fun call!40153 () ListLongMap!10689)

(declare-fun c!95719 () Bool)

(declare-fun c!95716 () Bool)

(declare-fun call!40150 () ListLongMap!10689)

(declare-fun bm!40144 () Bool)

(declare-fun +!2609 (ListLongMap!10689 tuple2!11990) ListLongMap!10689)

(assert (=> bm!40144 (= call!40149 (+!2609 (ite c!95716 call!40147 (ite c!95719 call!40153 call!40150)) (ite (or c!95716 c!95719) (tuple2!11991 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5295 thiss!1181)) (tuple2!11991 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5295 thiss!1181)))))))

(declare-fun bm!40145 () Bool)

(declare-fun call!40148 () Bool)

(declare-fun lt!407698 () ListLongMap!10689)

(assert (=> bm!40145 (= call!40148 (contains!4411 lt!407698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902154 () Bool)

(declare-fun res!608891 () Bool)

(declare-fun e!505113 () Bool)

(assert (=> b!902154 (=> (not res!608891) (not e!505113))))

(declare-fun e!505120 () Bool)

(assert (=> b!902154 (= res!608891 e!505120)))

(declare-fun res!608893 () Bool)

(assert (=> b!902154 (=> res!608893 e!505120)))

(declare-fun e!505117 () Bool)

(assert (=> b!902154 (= res!608893 (not e!505117))))

(declare-fun res!608894 () Bool)

(assert (=> b!902154 (=> (not res!608894) (not e!505117))))

(assert (=> b!902154 (= res!608894 (bvslt #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))

(declare-fun b!902155 () Bool)

(declare-fun e!505116 () ListLongMap!10689)

(assert (=> b!902155 (= e!505116 (+!2609 call!40149 (tuple2!11991 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5295 thiss!1181))))))

(declare-fun b!902156 () Bool)

(declare-fun e!505119 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902156 (= e!505119 (validKeyInArray!0 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!902157 () Bool)

(declare-fun e!505118 () ListLongMap!10689)

(assert (=> b!902157 (= e!505116 e!505118)))

(assert (=> b!902157 (= c!95719 (and (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!902158 () Bool)

(declare-fun e!505123 () Bool)

(declare-fun apply!414 (ListLongMap!10689 (_ BitVec 64)) V!29495)

(declare-fun get!13381 (ValueCell!8717 V!29495) V!29495)

(declare-fun dynLambda!1329 (Int (_ BitVec 64)) V!29495)

(assert (=> b!902158 (= e!505123 (= (apply!414 lt!407698 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)) (get!13381 (select (arr!25409 (_values!5482 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1329 (defaultEntry!5463 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!902158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25869 (_values!5482 thiss!1181))))))

(assert (=> b!902158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))

(declare-fun b!902159 () Bool)

(declare-fun e!505112 () Unit!30607)

(declare-fun Unit!30613 () Unit!30607)

(assert (=> b!902159 (= e!505112 Unit!30613)))

(declare-fun d!112129 () Bool)

(assert (=> d!112129 e!505113))

(declare-fun res!608899 () Bool)

(assert (=> d!112129 (=> (not res!608899) (not e!505113))))

(assert (=> d!112129 (= res!608899 (or (bvsge #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))))

(declare-fun lt!407685 () ListLongMap!10689)

(assert (=> d!112129 (= lt!407698 lt!407685)))

(declare-fun lt!407683 () Unit!30607)

(assert (=> d!112129 (= lt!407683 e!505112)))

(declare-fun c!95717 () Bool)

(assert (=> d!112129 (= c!95717 e!505119)))

(declare-fun res!608897 () Bool)

(assert (=> d!112129 (=> (not res!608897) (not e!505119))))

(assert (=> d!112129 (= res!608897 (bvslt #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))

(assert (=> d!112129 (= lt!407685 e!505116)))

(assert (=> d!112129 (= c!95716 (and (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112129 (validMask!0 (mask!26309 thiss!1181))))

(assert (=> d!112129 (= (getCurrentListMap!2632 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)) lt!407698)))

(declare-fun b!902160 () Bool)

(declare-fun res!608892 () Bool)

(assert (=> b!902160 (=> (not res!608892) (not e!505113))))

(declare-fun e!505115 () Bool)

(assert (=> b!902160 (= res!608892 e!505115)))

(declare-fun c!95715 () Bool)

(assert (=> b!902160 (= c!95715 (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!902161 () Bool)

(assert (=> b!902161 (= e!505115 (not call!40148))))

(declare-fun bm!40146 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3330 (array!52887 array!52889 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) ListLongMap!10689)

(assert (=> bm!40146 (= call!40147 (getCurrentListMapNoExtraKeys!3330 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun bm!40147 () Bool)

(declare-fun call!40152 () Bool)

(assert (=> bm!40147 (= call!40152 (contains!4411 lt!407698 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902162 () Bool)

(assert (=> b!902162 (= e!505120 e!505123)))

(declare-fun res!608895 () Bool)

(assert (=> b!902162 (=> (not res!608895) (not e!505123))))

(assert (=> b!902162 (= res!608895 (contains!4411 lt!407698 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!902162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))

(declare-fun bm!40148 () Bool)

(declare-fun call!40151 () ListLongMap!10689)

(assert (=> bm!40148 (= call!40151 call!40149)))

(declare-fun b!902163 () Bool)

(declare-fun e!505121 () Bool)

(assert (=> b!902163 (= e!505121 (= (apply!414 lt!407698 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5295 thiss!1181)))))

(declare-fun b!902164 () Bool)

(declare-fun lt!407693 () Unit!30607)

(assert (=> b!902164 (= e!505112 lt!407693)))

(declare-fun lt!407692 () ListLongMap!10689)

(assert (=> b!902164 (= lt!407692 (getCurrentListMapNoExtraKeys!3330 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407696 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407689 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407689 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407682 () Unit!30607)

(declare-fun addStillContains!340 (ListLongMap!10689 (_ BitVec 64) V!29495 (_ BitVec 64)) Unit!30607)

(assert (=> b!902164 (= lt!407682 (addStillContains!340 lt!407692 lt!407696 (zeroValue!5295 thiss!1181) lt!407689))))

(assert (=> b!902164 (contains!4411 (+!2609 lt!407692 (tuple2!11991 lt!407696 (zeroValue!5295 thiss!1181))) lt!407689)))

(declare-fun lt!407697 () Unit!30607)

(assert (=> b!902164 (= lt!407697 lt!407682)))

(declare-fun lt!407690 () ListLongMap!10689)

(assert (=> b!902164 (= lt!407690 (getCurrentListMapNoExtraKeys!3330 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407701 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407681 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407681 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407686 () Unit!30607)

(declare-fun addApplyDifferent!340 (ListLongMap!10689 (_ BitVec 64) V!29495 (_ BitVec 64)) Unit!30607)

(assert (=> b!902164 (= lt!407686 (addApplyDifferent!340 lt!407690 lt!407701 (minValue!5295 thiss!1181) lt!407681))))

(assert (=> b!902164 (= (apply!414 (+!2609 lt!407690 (tuple2!11991 lt!407701 (minValue!5295 thiss!1181))) lt!407681) (apply!414 lt!407690 lt!407681))))

(declare-fun lt!407702 () Unit!30607)

(assert (=> b!902164 (= lt!407702 lt!407686)))

(declare-fun lt!407695 () ListLongMap!10689)

(assert (=> b!902164 (= lt!407695 (getCurrentListMapNoExtraKeys!3330 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407700 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407684 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407684 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407699 () Unit!30607)

(assert (=> b!902164 (= lt!407699 (addApplyDifferent!340 lt!407695 lt!407700 (zeroValue!5295 thiss!1181) lt!407684))))

(assert (=> b!902164 (= (apply!414 (+!2609 lt!407695 (tuple2!11991 lt!407700 (zeroValue!5295 thiss!1181))) lt!407684) (apply!414 lt!407695 lt!407684))))

(declare-fun lt!407691 () Unit!30607)

(assert (=> b!902164 (= lt!407691 lt!407699)))

(declare-fun lt!407688 () ListLongMap!10689)

(assert (=> b!902164 (= lt!407688 (getCurrentListMapNoExtraKeys!3330 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407687 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407694 () (_ BitVec 64))

(assert (=> b!902164 (= lt!407694 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902164 (= lt!407693 (addApplyDifferent!340 lt!407688 lt!407687 (minValue!5295 thiss!1181) lt!407694))))

(assert (=> b!902164 (= (apply!414 (+!2609 lt!407688 (tuple2!11991 lt!407687 (minValue!5295 thiss!1181))) lt!407694) (apply!414 lt!407688 lt!407694))))

(declare-fun b!902165 () Bool)

(declare-fun e!505124 () Bool)

(assert (=> b!902165 (= e!505113 e!505124)))

(declare-fun c!95718 () Bool)

(assert (=> b!902165 (= c!95718 (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40149 () Bool)

(assert (=> bm!40149 (= call!40150 call!40153)))

(declare-fun b!902166 () Bool)

(declare-fun e!505114 () Bool)

(assert (=> b!902166 (= e!505115 e!505114)))

(declare-fun res!608896 () Bool)

(assert (=> b!902166 (= res!608896 call!40148)))

(assert (=> b!902166 (=> (not res!608896) (not e!505114))))

(declare-fun b!902167 () Bool)

(declare-fun c!95714 () Bool)

(assert (=> b!902167 (= c!95714 (and (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!505122 () ListLongMap!10689)

(assert (=> b!902167 (= e!505118 e!505122)))

(declare-fun b!902168 () Bool)

(assert (=> b!902168 (= e!505124 e!505121)))

(declare-fun res!608898 () Bool)

(assert (=> b!902168 (= res!608898 call!40152)))

(assert (=> b!902168 (=> (not res!608898) (not e!505121))))

(declare-fun b!902169 () Bool)

(assert (=> b!902169 (= e!505122 call!40150)))

(declare-fun b!902170 () Bool)

(assert (=> b!902170 (= e!505118 call!40151)))

(declare-fun b!902171 () Bool)

(assert (=> b!902171 (= e!505114 (= (apply!414 lt!407698 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5295 thiss!1181)))))

(declare-fun b!902172 () Bool)

(assert (=> b!902172 (= e!505124 (not call!40152))))

(declare-fun bm!40150 () Bool)

(assert (=> bm!40150 (= call!40153 call!40147)))

(declare-fun b!902173 () Bool)

(assert (=> b!902173 (= e!505117 (validKeyInArray!0 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!902174 () Bool)

(assert (=> b!902174 (= e!505122 call!40151)))

(assert (= (and d!112129 c!95716) b!902155))

(assert (= (and d!112129 (not c!95716)) b!902157))

(assert (= (and b!902157 c!95719) b!902170))

(assert (= (and b!902157 (not c!95719)) b!902167))

(assert (= (and b!902167 c!95714) b!902174))

(assert (= (and b!902167 (not c!95714)) b!902169))

(assert (= (or b!902174 b!902169) bm!40149))

(assert (= (or b!902170 bm!40149) bm!40150))

(assert (= (or b!902170 b!902174) bm!40148))

(assert (= (or b!902155 bm!40150) bm!40146))

(assert (= (or b!902155 bm!40148) bm!40144))

(assert (= (and d!112129 res!608897) b!902156))

(assert (= (and d!112129 c!95717) b!902164))

(assert (= (and d!112129 (not c!95717)) b!902159))

(assert (= (and d!112129 res!608899) b!902154))

(assert (= (and b!902154 res!608894) b!902173))

(assert (= (and b!902154 (not res!608893)) b!902162))

(assert (= (and b!902162 res!608895) b!902158))

(assert (= (and b!902154 res!608891) b!902160))

(assert (= (and b!902160 c!95715) b!902166))

(assert (= (and b!902160 (not c!95715)) b!902161))

(assert (= (and b!902166 res!608896) b!902171))

(assert (= (or b!902166 b!902161) bm!40145))

(assert (= (and b!902160 res!608892) b!902165))

(assert (= (and b!902165 c!95718) b!902168))

(assert (= (and b!902165 (not c!95718)) b!902172))

(assert (= (and b!902168 res!608898) b!902163))

(assert (= (or b!902168 b!902172) bm!40147))

(declare-fun b_lambda!13041 () Bool)

(assert (=> (not b_lambda!13041) (not b!902158)))

(declare-fun t!25176 () Bool)

(declare-fun tb!5201 () Bool)

(assert (=> (and b!902006 (= (defaultEntry!5463 thiss!1181) (defaultEntry!5463 thiss!1181)) t!25176) tb!5201))

(declare-fun result!10191 () Bool)

(assert (=> tb!5201 (= result!10191 tp_is_empty!18397)))

(assert (=> b!902158 t!25176))

(declare-fun b_and!26411 () Bool)

(assert (= b_and!26405 (and (=> t!25176 result!10191) b_and!26411)))

(declare-fun m!838841 () Bool)

(assert (=> b!902163 m!838841))

(declare-fun m!838843 () Bool)

(assert (=> b!902155 m!838843))

(declare-fun m!838845 () Bool)

(assert (=> bm!40144 m!838845))

(declare-fun m!838847 () Bool)

(assert (=> bm!40145 m!838847))

(assert (=> b!902156 m!838837))

(assert (=> b!902156 m!838837))

(declare-fun m!838849 () Bool)

(assert (=> b!902156 m!838849))

(declare-fun m!838851 () Bool)

(assert (=> b!902158 m!838851))

(declare-fun m!838853 () Bool)

(assert (=> b!902158 m!838853))

(declare-fun m!838855 () Bool)

(assert (=> b!902158 m!838855))

(assert (=> b!902158 m!838837))

(assert (=> b!902158 m!838837))

(declare-fun m!838857 () Bool)

(assert (=> b!902158 m!838857))

(assert (=> b!902158 m!838853))

(assert (=> b!902158 m!838851))

(declare-fun m!838859 () Bool)

(assert (=> b!902164 m!838859))

(declare-fun m!838861 () Bool)

(assert (=> b!902164 m!838861))

(declare-fun m!838863 () Bool)

(assert (=> b!902164 m!838863))

(declare-fun m!838865 () Bool)

(assert (=> b!902164 m!838865))

(declare-fun m!838867 () Bool)

(assert (=> b!902164 m!838867))

(declare-fun m!838869 () Bool)

(assert (=> b!902164 m!838869))

(declare-fun m!838871 () Bool)

(assert (=> b!902164 m!838871))

(assert (=> b!902164 m!838861))

(declare-fun m!838873 () Bool)

(assert (=> b!902164 m!838873))

(declare-fun m!838875 () Bool)

(assert (=> b!902164 m!838875))

(declare-fun m!838877 () Bool)

(assert (=> b!902164 m!838877))

(assert (=> b!902164 m!838837))

(assert (=> b!902164 m!838869))

(declare-fun m!838879 () Bool)

(assert (=> b!902164 m!838879))

(declare-fun m!838881 () Bool)

(assert (=> b!902164 m!838881))

(declare-fun m!838883 () Bool)

(assert (=> b!902164 m!838883))

(assert (=> b!902164 m!838875))

(declare-fun m!838885 () Bool)

(assert (=> b!902164 m!838885))

(declare-fun m!838887 () Bool)

(assert (=> b!902164 m!838887))

(assert (=> b!902164 m!838859))

(declare-fun m!838889 () Bool)

(assert (=> b!902164 m!838889))

(assert (=> b!902162 m!838837))

(assert (=> b!902162 m!838837))

(declare-fun m!838891 () Bool)

(assert (=> b!902162 m!838891))

(assert (=> b!902173 m!838837))

(assert (=> b!902173 m!838837))

(assert (=> b!902173 m!838849))

(assert (=> bm!40146 m!838887))

(declare-fun m!838893 () Bool)

(assert (=> bm!40147 m!838893))

(assert (=> d!112129 m!838753))

(declare-fun m!838895 () Bool)

(assert (=> b!902171 m!838895))

(assert (=> b!902013 d!112129))

(declare-fun d!112131 () Bool)

(declare-fun e!505130 () Bool)

(assert (=> d!112131 e!505130))

(declare-fun res!608902 () Bool)

(assert (=> d!112131 (=> res!608902 e!505130)))

(declare-fun lt!407712 () Bool)

(assert (=> d!112131 (= res!608902 (not lt!407712))))

(declare-fun lt!407711 () Bool)

(assert (=> d!112131 (= lt!407712 lt!407711)))

(declare-fun lt!407713 () Unit!30607)

(declare-fun e!505129 () Unit!30607)

(assert (=> d!112131 (= lt!407713 e!505129)))

(declare-fun c!95722 () Bool)

(assert (=> d!112131 (= c!95722 lt!407711)))

(declare-fun containsKey!435 (List!17822 (_ BitVec 64)) Bool)

(assert (=> d!112131 (= lt!407711 (containsKey!435 (toList!5360 lt!407599) (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598))))))

(assert (=> d!112131 (= (contains!4411 lt!407599 (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598))) lt!407712)))

(declare-fun b!902183 () Bool)

(declare-fun lt!407714 () Unit!30607)

(assert (=> b!902183 (= e!505129 lt!407714)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!329 (List!17822 (_ BitVec 64)) Unit!30607)

(assert (=> b!902183 (= lt!407714 (lemmaContainsKeyImpliesGetValueByKeyDefined!329 (toList!5360 lt!407599) (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598))))))

(declare-datatypes ((Option!468 0))(
  ( (Some!467 (v!11748 V!29495)) (None!466) )
))
(declare-fun isDefined!337 (Option!468) Bool)

(declare-fun getValueByKey!462 (List!17822 (_ BitVec 64)) Option!468)

(assert (=> b!902183 (isDefined!337 (getValueByKey!462 (toList!5360 lt!407599) (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598))))))

(declare-fun b!902184 () Bool)

(declare-fun Unit!30614 () Unit!30607)

(assert (=> b!902184 (= e!505129 Unit!30614)))

(declare-fun b!902185 () Bool)

(assert (=> b!902185 (= e!505130 (isDefined!337 (getValueByKey!462 (toList!5360 lt!407599) (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407598)))))))

(assert (= (and d!112131 c!95722) b!902183))

(assert (= (and d!112131 (not c!95722)) b!902184))

(assert (= (and d!112131 (not res!608902)) b!902185))

(assert (=> d!112131 m!838739))

(declare-fun m!838897 () Bool)

(assert (=> d!112131 m!838897))

(assert (=> b!902183 m!838739))

(declare-fun m!838899 () Bool)

(assert (=> b!902183 m!838899))

(assert (=> b!902183 m!838739))

(declare-fun m!838901 () Bool)

(assert (=> b!902183 m!838901))

(assert (=> b!902183 m!838901))

(declare-fun m!838903 () Bool)

(assert (=> b!902183 m!838903))

(assert (=> b!902185 m!838739))

(assert (=> b!902185 m!838901))

(assert (=> b!902185 m!838901))

(assert (=> b!902185 m!838903))

(assert (=> b!902013 d!112131))

(declare-fun b!902194 () Bool)

(declare-fun e!505137 () Bool)

(declare-fun call!40156 () Bool)

(assert (=> b!902194 (= e!505137 call!40156)))

(declare-fun bm!40153 () Bool)

(assert (=> bm!40153 (= call!40156 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10301 thiss!1181) (mask!26309 thiss!1181)))))

(declare-fun b!902195 () Bool)

(declare-fun e!505139 () Bool)

(assert (=> b!902195 (= e!505139 e!505137)))

(declare-fun c!95725 () Bool)

(assert (=> b!902195 (= c!95725 (validKeyInArray!0 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!112133 () Bool)

(declare-fun res!608907 () Bool)

(assert (=> d!112133 (=> res!608907 e!505139)))

(assert (=> d!112133 (= res!608907 (bvsge #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))

(assert (=> d!112133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)) e!505139)))

(declare-fun b!902196 () Bool)

(declare-fun e!505138 () Bool)

(assert (=> b!902196 (= e!505137 e!505138)))

(declare-fun lt!407723 () (_ BitVec 64))

(assert (=> b!902196 (= lt!407723 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407722 () Unit!30607)

(assert (=> b!902196 (= lt!407722 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10301 thiss!1181) lt!407723 #b00000000000000000000000000000000))))

(assert (=> b!902196 (arrayContainsKey!0 (_keys!10301 thiss!1181) lt!407723 #b00000000000000000000000000000000)))

(declare-fun lt!407721 () Unit!30607)

(assert (=> b!902196 (= lt!407721 lt!407722)))

(declare-fun res!608908 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52887 (_ BitVec 32)) SeekEntryResult!8902)

(assert (=> b!902196 (= res!608908 (= (seekEntryOrOpen!0 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000) (_keys!10301 thiss!1181) (mask!26309 thiss!1181)) (Found!8902 #b00000000000000000000000000000000)))))

(assert (=> b!902196 (=> (not res!608908) (not e!505138))))

(declare-fun b!902197 () Bool)

(assert (=> b!902197 (= e!505138 call!40156)))

(assert (= (and d!112133 (not res!608907)) b!902195))

(assert (= (and b!902195 c!95725) b!902196))

(assert (= (and b!902195 (not c!95725)) b!902194))

(assert (= (and b!902196 res!608908) b!902197))

(assert (= (or b!902197 b!902194) bm!40153))

(declare-fun m!838905 () Bool)

(assert (=> bm!40153 m!838905))

(assert (=> b!902195 m!838837))

(assert (=> b!902195 m!838837))

(assert (=> b!902195 m!838849))

(assert (=> b!902196 m!838837))

(declare-fun m!838907 () Bool)

(assert (=> b!902196 m!838907))

(declare-fun m!838909 () Bool)

(assert (=> b!902196 m!838909))

(assert (=> b!902196 m!838837))

(declare-fun m!838911 () Bool)

(assert (=> b!902196 m!838911))

(assert (=> b!902008 d!112133))

(assert (=> b!902012 d!112119))

(declare-fun d!112135 () Bool)

(declare-fun e!505141 () Bool)

(assert (=> d!112135 e!505141))

(declare-fun res!608909 () Bool)

(assert (=> d!112135 (=> res!608909 e!505141)))

(declare-fun lt!407725 () Bool)

(assert (=> d!112135 (= res!608909 (not lt!407725))))

(declare-fun lt!407724 () Bool)

(assert (=> d!112135 (= lt!407725 lt!407724)))

(declare-fun lt!407726 () Unit!30607)

(declare-fun e!505140 () Unit!30607)

(assert (=> d!112135 (= lt!407726 e!505140)))

(declare-fun c!95726 () Bool)

(assert (=> d!112135 (= c!95726 lt!407724)))

(assert (=> d!112135 (= lt!407724 (containsKey!435 (toList!5360 lt!407599) key!785))))

(assert (=> d!112135 (= (contains!4411 lt!407599 key!785) lt!407725)))

(declare-fun b!902198 () Bool)

(declare-fun lt!407727 () Unit!30607)

(assert (=> b!902198 (= e!505140 lt!407727)))

(assert (=> b!902198 (= lt!407727 (lemmaContainsKeyImpliesGetValueByKeyDefined!329 (toList!5360 lt!407599) key!785))))

(assert (=> b!902198 (isDefined!337 (getValueByKey!462 (toList!5360 lt!407599) key!785))))

(declare-fun b!902199 () Bool)

(declare-fun Unit!30615 () Unit!30607)

(assert (=> b!902199 (= e!505140 Unit!30615)))

(declare-fun b!902200 () Bool)

(assert (=> b!902200 (= e!505141 (isDefined!337 (getValueByKey!462 (toList!5360 lt!407599) key!785)))))

(assert (= (and d!112135 c!95726) b!902198))

(assert (= (and d!112135 (not c!95726)) b!902199))

(assert (= (and d!112135 (not res!608909)) b!902200))

(declare-fun m!838913 () Bool)

(assert (=> d!112135 m!838913))

(declare-fun m!838915 () Bool)

(assert (=> b!902198 m!838915))

(declare-fun m!838917 () Bool)

(assert (=> b!902198 m!838917))

(assert (=> b!902198 m!838917))

(declare-fun m!838919 () Bool)

(assert (=> b!902198 m!838919))

(assert (=> b!902200 m!838917))

(assert (=> b!902200 m!838917))

(assert (=> b!902200 m!838919))

(assert (=> b!902011 d!112135))

(declare-fun d!112137 () Bool)

(declare-fun e!505144 () Bool)

(assert (=> d!112137 e!505144))

(declare-fun res!608912 () Bool)

(assert (=> d!112137 (=> res!608912 e!505144)))

(declare-fun lt!407733 () SeekEntryResult!8902)

(assert (=> d!112137 (= res!608912 (not ((_ is Found!8902) lt!407733)))))

(assert (=> d!112137 (= lt!407733 (seekEntry!0 key!785 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)))))

(declare-fun lt!407732 () Unit!30607)

(declare-fun choose!1525 (array!52887 array!52889 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 64)) Unit!30607)

(assert (=> d!112137 (= lt!407732 (choose!1525 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785))))

(assert (=> d!112137 (validMask!0 (mask!26309 thiss!1181))))

(assert (=> d!112137 (= (lemmaSeekEntryGivesInRangeIndex!119 (_keys!10301 thiss!1181) (_values!5482 thiss!1181) (mask!26309 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785) lt!407732)))

(declare-fun b!902203 () Bool)

(assert (=> b!902203 (= e!505144 (inRange!0 (index!37980 lt!407733) (mask!26309 thiss!1181)))))

(assert (= (and d!112137 (not res!608912)) b!902203))

(assert (=> d!112137 m!838733))

(declare-fun m!838921 () Bool)

(assert (=> d!112137 m!838921))

(assert (=> d!112137 m!838753))

(declare-fun m!838923 () Bool)

(assert (=> b!902203 m!838923))

(assert (=> b!902007 d!112137))

(declare-fun b!902216 () Bool)

(declare-fun e!505152 () SeekEntryResult!8902)

(declare-fun lt!407742 () SeekEntryResult!8902)

(assert (=> b!902216 (= e!505152 (Found!8902 (index!37981 lt!407742)))))

(declare-fun d!112139 () Bool)

(declare-fun lt!407743 () SeekEntryResult!8902)

(assert (=> d!112139 (and (or ((_ is MissingVacant!8902) lt!407743) (not ((_ is Found!8902) lt!407743)) (and (bvsge (index!37980 lt!407743) #b00000000000000000000000000000000) (bvslt (index!37980 lt!407743) (size!25868 (_keys!10301 thiss!1181))))) (not ((_ is MissingVacant!8902) lt!407743)) (or (not ((_ is Found!8902) lt!407743)) (= (select (arr!25408 (_keys!10301 thiss!1181)) (index!37980 lt!407743)) key!785)))))

(declare-fun e!505151 () SeekEntryResult!8902)

(assert (=> d!112139 (= lt!407743 e!505151)))

(declare-fun c!95733 () Bool)

(assert (=> d!112139 (= c!95733 (and ((_ is Intermediate!8902) lt!407742) (undefined!9714 lt!407742)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52887 (_ BitVec 32)) SeekEntryResult!8902)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112139 (= lt!407742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26309 thiss!1181)) key!785 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)))))

(assert (=> d!112139 (validMask!0 (mask!26309 thiss!1181))))

(assert (=> d!112139 (= (seekEntry!0 key!785 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)) lt!407743)))

(declare-fun b!902217 () Bool)

(declare-fun e!505153 () SeekEntryResult!8902)

(declare-fun lt!407744 () SeekEntryResult!8902)

(assert (=> b!902217 (= e!505153 (ite ((_ is MissingVacant!8902) lt!407744) (MissingZero!8902 (index!37982 lt!407744)) lt!407744))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52887 (_ BitVec 32)) SeekEntryResult!8902)

(assert (=> b!902217 (= lt!407744 (seekKeyOrZeroReturnVacant!0 (x!76747 lt!407742) (index!37981 lt!407742) (index!37981 lt!407742) key!785 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)))))

(declare-fun b!902218 () Bool)

(assert (=> b!902218 (= e!505151 Undefined!8902)))

(declare-fun b!902219 () Bool)

(assert (=> b!902219 (= e!505151 e!505152)))

(declare-fun lt!407745 () (_ BitVec 64))

(assert (=> b!902219 (= lt!407745 (select (arr!25408 (_keys!10301 thiss!1181)) (index!37981 lt!407742)))))

(declare-fun c!95735 () Bool)

(assert (=> b!902219 (= c!95735 (= lt!407745 key!785))))

(declare-fun b!902220 () Bool)

(declare-fun c!95734 () Bool)

(assert (=> b!902220 (= c!95734 (= lt!407745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!902220 (= e!505152 e!505153)))

(declare-fun b!902221 () Bool)

(assert (=> b!902221 (= e!505153 (MissingZero!8902 (index!37981 lt!407742)))))

(assert (= (and d!112139 c!95733) b!902218))

(assert (= (and d!112139 (not c!95733)) b!902219))

(assert (= (and b!902219 c!95735) b!902216))

(assert (= (and b!902219 (not c!95735)) b!902220))

(assert (= (and b!902220 c!95734) b!902221))

(assert (= (and b!902220 (not c!95734)) b!902217))

(declare-fun m!838925 () Bool)

(assert (=> d!112139 m!838925))

(declare-fun m!838927 () Bool)

(assert (=> d!112139 m!838927))

(assert (=> d!112139 m!838927))

(declare-fun m!838929 () Bool)

(assert (=> d!112139 m!838929))

(assert (=> d!112139 m!838753))

(declare-fun m!838931 () Bool)

(assert (=> b!902217 m!838931))

(declare-fun m!838933 () Bool)

(assert (=> b!902219 m!838933))

(assert (=> b!902007 d!112139))

(declare-fun d!112141 () Bool)

(assert (=> d!112141 (= (array_inv!19990 (_keys!10301 thiss!1181)) (bvsge (size!25868 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902006 d!112141))

(declare-fun d!112143 () Bool)

(assert (=> d!112143 (= (array_inv!19991 (_values!5482 thiss!1181)) (bvsge (size!25869 (_values!5482 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902006 d!112143))

(declare-fun b!902232 () Bool)

(declare-fun e!505164 () Bool)

(declare-fun e!505163 () Bool)

(assert (=> b!902232 (= e!505164 e!505163)))

(declare-fun res!608920 () Bool)

(assert (=> b!902232 (=> (not res!608920) (not e!505163))))

(declare-fun e!505162 () Bool)

(assert (=> b!902232 (= res!608920 (not e!505162))))

(declare-fun res!608921 () Bool)

(assert (=> b!902232 (=> (not res!608921) (not e!505162))))

(assert (=> b!902232 (= res!608921 (validKeyInArray!0 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!112145 () Bool)

(declare-fun res!608919 () Bool)

(assert (=> d!112145 (=> res!608919 e!505164)))

(assert (=> d!112145 (= res!608919 (bvsge #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))))))

(assert (=> d!112145 (= (arrayNoDuplicates!0 (_keys!10301 thiss!1181) #b00000000000000000000000000000000 Nil!17820) e!505164)))

(declare-fun b!902233 () Bool)

(declare-fun e!505165 () Bool)

(assert (=> b!902233 (= e!505163 e!505165)))

(declare-fun c!95738 () Bool)

(assert (=> b!902233 (= c!95738 (validKeyInArray!0 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!902234 () Bool)

(declare-fun call!40159 () Bool)

(assert (=> b!902234 (= e!505165 call!40159)))

(declare-fun b!902235 () Bool)

(declare-fun contains!4413 (List!17823 (_ BitVec 64)) Bool)

(assert (=> b!902235 (= e!505162 (contains!4413 Nil!17820 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40156 () Bool)

(assert (=> bm!40156 (= call!40159 (arrayNoDuplicates!0 (_keys!10301 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95738 (Cons!17819 (select (arr!25408 (_keys!10301 thiss!1181)) #b00000000000000000000000000000000) Nil!17820) Nil!17820)))))

(declare-fun b!902236 () Bool)

(assert (=> b!902236 (= e!505165 call!40159)))

(assert (= (and d!112145 (not res!608919)) b!902232))

(assert (= (and b!902232 res!608921) b!902235))

(assert (= (and b!902232 res!608920) b!902233))

(assert (= (and b!902233 c!95738) b!902236))

(assert (= (and b!902233 (not c!95738)) b!902234))

(assert (= (or b!902236 b!902234) bm!40156))

(assert (=> b!902232 m!838837))

(assert (=> b!902232 m!838837))

(assert (=> b!902232 m!838849))

(assert (=> b!902233 m!838837))

(assert (=> b!902233 m!838837))

(assert (=> b!902233 m!838849))

(assert (=> b!902235 m!838837))

(assert (=> b!902235 m!838837))

(declare-fun m!838935 () Bool)

(assert (=> b!902235 m!838935))

(assert (=> bm!40156 m!838837))

(declare-fun m!838937 () Bool)

(assert (=> bm!40156 m!838937))

(assert (=> b!902016 d!112145))

(declare-fun d!112147 () Bool)

(declare-fun res!608928 () Bool)

(declare-fun e!505168 () Bool)

(assert (=> d!112147 (=> (not res!608928) (not e!505168))))

(declare-fun simpleValid!332 (LongMapFixedSize!4450) Bool)

(assert (=> d!112147 (= res!608928 (simpleValid!332 thiss!1181))))

(assert (=> d!112147 (= (valid!1720 thiss!1181) e!505168)))

(declare-fun b!902243 () Bool)

(declare-fun res!608929 () Bool)

(assert (=> b!902243 (=> (not res!608929) (not e!505168))))

(declare-fun arrayCountValidKeys!0 (array!52887 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902243 (= res!608929 (= (arrayCountValidKeys!0 (_keys!10301 thiss!1181) #b00000000000000000000000000000000 (size!25868 (_keys!10301 thiss!1181))) (_size!2280 thiss!1181)))))

(declare-fun b!902244 () Bool)

(declare-fun res!608930 () Bool)

(assert (=> b!902244 (=> (not res!608930) (not e!505168))))

(assert (=> b!902244 (= res!608930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10301 thiss!1181) (mask!26309 thiss!1181)))))

(declare-fun b!902245 () Bool)

(assert (=> b!902245 (= e!505168 (arrayNoDuplicates!0 (_keys!10301 thiss!1181) #b00000000000000000000000000000000 Nil!17820))))

(assert (= (and d!112147 res!608928) b!902243))

(assert (= (and b!902243 res!608929) b!902244))

(assert (= (and b!902244 res!608930) b!902245))

(declare-fun m!838939 () Bool)

(assert (=> d!112147 m!838939))

(declare-fun m!838941 () Bool)

(assert (=> b!902243 m!838941))

(assert (=> b!902244 m!838743))

(assert (=> b!902245 m!838741))

(assert (=> start!77396 d!112147))

(declare-fun mapIsEmpty!29287 () Bool)

(declare-fun mapRes!29287 () Bool)

(assert (=> mapIsEmpty!29287 mapRes!29287))

(declare-fun mapNonEmpty!29287 () Bool)

(declare-fun tp!56320 () Bool)

(declare-fun e!505174 () Bool)

(assert (=> mapNonEmpty!29287 (= mapRes!29287 (and tp!56320 e!505174))))

(declare-fun mapKey!29287 () (_ BitVec 32))

(declare-fun mapValue!29287 () ValueCell!8717)

(declare-fun mapRest!29287 () (Array (_ BitVec 32) ValueCell!8717))

(assert (=> mapNonEmpty!29287 (= mapRest!29278 (store mapRest!29287 mapKey!29287 mapValue!29287))))

(declare-fun condMapEmpty!29287 () Bool)

(declare-fun mapDefault!29287 () ValueCell!8717)

(assert (=> mapNonEmpty!29278 (= condMapEmpty!29287 (= mapRest!29278 ((as const (Array (_ BitVec 32) ValueCell!8717)) mapDefault!29287)))))

(declare-fun e!505173 () Bool)

(assert (=> mapNonEmpty!29278 (= tp!56305 (and e!505173 mapRes!29287))))

(declare-fun b!902252 () Bool)

(assert (=> b!902252 (= e!505174 tp_is_empty!18397)))

(declare-fun b!902253 () Bool)

(assert (=> b!902253 (= e!505173 tp_is_empty!18397)))

(assert (= (and mapNonEmpty!29278 condMapEmpty!29287) mapIsEmpty!29287))

(assert (= (and mapNonEmpty!29278 (not condMapEmpty!29287)) mapNonEmpty!29287))

(assert (= (and mapNonEmpty!29287 ((_ is ValueCellFull!8717) mapValue!29287)) b!902252))

(assert (= (and mapNonEmpty!29278 ((_ is ValueCellFull!8717) mapDefault!29287)) b!902253))

(declare-fun m!838943 () Bool)

(assert (=> mapNonEmpty!29287 m!838943))

(declare-fun b_lambda!13043 () Bool)

(assert (= b_lambda!13041 (or (and b!902006 b_free!16069) b_lambda!13043)))

(check-sat (not d!112137) (not bm!40146) (not bm!40147) (not b!902243) (not b_lambda!13043) (not b!902245) (not b!902162) (not bm!40144) (not b!902195) (not d!112147) (not b!902105) (not b!902163) (not b!902183) (not bm!40156) (not d!112123) (not d!112129) (not d!112135) tp_is_empty!18397 (not b!902200) (not b!902198) (not mapNonEmpty!29287) b_and!26411 (not b!902196) (not b!902111) (not b!902156) (not b_next!16069) (not b!902244) (not b!902158) (not b!902203) (not b!902232) (not b!902235) (not b!902173) (not b!902164) (not b!902233) (not b!902155) (not b!902217) (not bm!40145) (not b!902171) (not bm!40153) (not d!112139) (not d!112125) (not d!112131) (not b!902185))
(check-sat b_and!26411 (not b_next!16069))
