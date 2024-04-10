; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80168 () Bool)

(assert start!80168)

(declare-fun b!941981 () Bool)

(declare-fun b_free!17931 () Bool)

(declare-fun b_next!17931 () Bool)

(assert (=> b!941981 (= b_free!17931 (not b_next!17931))))

(declare-fun tp!62285 () Bool)

(declare-fun b_and!29343 () Bool)

(assert (=> b!941981 (= tp!62285 b_and!29343)))

(declare-fun b!941979 () Bool)

(declare-fun e!529611 () Bool)

(declare-datatypes ((V!32217 0))(
  ( (V!32218 (val!10270 Int)) )
))
(declare-datatypes ((ValueCell!9738 0))(
  ( (ValueCellFull!9738 (v!12801 V!32217)) (EmptyCell!9738) )
))
(declare-datatypes ((array!56836 0))(
  ( (array!56837 (arr!27348 (Array (_ BitVec 32) ValueCell!9738)) (size!27812 (_ BitVec 32))) )
))
(declare-datatypes ((array!56838 0))(
  ( (array!56839 (arr!27349 (Array (_ BitVec 32) (_ BitVec 64))) (size!27813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4626 0))(
  ( (LongMapFixedSize!4627 (defaultEntry!5604 Int) (mask!27193 (_ BitVec 32)) (extraKeys!5336 (_ BitVec 32)) (zeroValue!5440 V!32217) (minValue!5440 V!32217) (_size!2368 (_ BitVec 32)) (_keys!10468 array!56838) (_values!5627 array!56836) (_vacant!2368 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4626)

(assert (=> b!941979 (= e!529611 (and (= (size!27812 (_values!5627 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27193 thiss!1141))) (= (size!27813 (_keys!10468 thiss!1141)) (size!27812 (_values!5627 thiss!1141))) (bvsge (mask!27193 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5336 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5336 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941980 () Bool)

(declare-fun e!529613 () Bool)

(declare-fun tp_is_empty!20439 () Bool)

(assert (=> b!941980 (= e!529613 tp_is_empty!20439)))

(declare-fun res!633097 () Bool)

(assert (=> start!80168 (=> (not res!633097) (not e!529611))))

(declare-fun valid!1771 (LongMapFixedSize!4626) Bool)

(assert (=> start!80168 (= res!633097 (valid!1771 thiss!1141))))

(assert (=> start!80168 e!529611))

(declare-fun e!529615 () Bool)

(assert (=> start!80168 e!529615))

(assert (=> start!80168 true))

(declare-fun e!529614 () Bool)

(declare-fun array_inv!21250 (array!56838) Bool)

(declare-fun array_inv!21251 (array!56836) Bool)

(assert (=> b!941981 (= e!529615 (and tp!62285 tp_is_empty!20439 (array_inv!21250 (_keys!10468 thiss!1141)) (array_inv!21251 (_values!5627 thiss!1141)) e!529614))))

(declare-fun b!941982 () Bool)

(declare-fun mapRes!32467 () Bool)

(assert (=> b!941982 (= e!529614 (and e!529613 mapRes!32467))))

(declare-fun condMapEmpty!32467 () Bool)

(declare-fun mapDefault!32467 () ValueCell!9738)

(assert (=> b!941982 (= condMapEmpty!32467 (= (arr!27348 (_values!5627 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9738)) mapDefault!32467)))))

(declare-fun b!941983 () Bool)

(declare-fun res!633095 () Bool)

(assert (=> b!941983 (=> (not res!633095) (not e!529611))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9027 0))(
  ( (MissingZero!9027 (index!38479 (_ BitVec 32))) (Found!9027 (index!38480 (_ BitVec 32))) (Intermediate!9027 (undefined!9839 Bool) (index!38481 (_ BitVec 32)) (x!80859 (_ BitVec 32))) (Undefined!9027) (MissingVacant!9027 (index!38482 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56838 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!941983 (= res!633095 (not ((_ is Found!9027) (seekEntry!0 key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))))

(declare-fun b!941984 () Bool)

(declare-fun res!633094 () Bool)

(assert (=> b!941984 (=> (not res!633094) (not e!529611))))

(assert (=> b!941984 (= res!633094 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941985 () Bool)

(declare-fun e!529610 () Bool)

(assert (=> b!941985 (= e!529610 tp_is_empty!20439)))

(declare-fun mapNonEmpty!32467 () Bool)

(declare-fun tp!62286 () Bool)

(assert (=> mapNonEmpty!32467 (= mapRes!32467 (and tp!62286 e!529610))))

(declare-fun mapRest!32467 () (Array (_ BitVec 32) ValueCell!9738))

(declare-fun mapValue!32467 () ValueCell!9738)

(declare-fun mapKey!32467 () (_ BitVec 32))

(assert (=> mapNonEmpty!32467 (= (arr!27348 (_values!5627 thiss!1141)) (store mapRest!32467 mapKey!32467 mapValue!32467))))

(declare-fun b!941986 () Bool)

(declare-fun res!633096 () Bool)

(assert (=> b!941986 (=> (not res!633096) (not e!529611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941986 (= res!633096 (validMask!0 (mask!27193 thiss!1141)))))

(declare-fun mapIsEmpty!32467 () Bool)

(assert (=> mapIsEmpty!32467 mapRes!32467))

(assert (= (and start!80168 res!633097) b!941984))

(assert (= (and b!941984 res!633094) b!941983))

(assert (= (and b!941983 res!633095) b!941986))

(assert (= (and b!941986 res!633096) b!941979))

(assert (= (and b!941982 condMapEmpty!32467) mapIsEmpty!32467))

(assert (= (and b!941982 (not condMapEmpty!32467)) mapNonEmpty!32467))

(assert (= (and mapNonEmpty!32467 ((_ is ValueCellFull!9738) mapValue!32467)) b!941985))

(assert (= (and b!941982 ((_ is ValueCellFull!9738) mapDefault!32467)) b!941980))

(assert (= b!941981 b!941982))

(assert (= start!80168 b!941981))

(declare-fun m!876785 () Bool)

(assert (=> start!80168 m!876785))

(declare-fun m!876787 () Bool)

(assert (=> b!941986 m!876787))

(declare-fun m!876789 () Bool)

(assert (=> b!941981 m!876789))

(declare-fun m!876791 () Bool)

(assert (=> b!941981 m!876791))

(declare-fun m!876793 () Bool)

(assert (=> mapNonEmpty!32467 m!876793))

(declare-fun m!876795 () Bool)

(assert (=> b!941983 m!876795))

(check-sat (not b!941981) tp_is_empty!20439 (not b_next!17931) (not b!941983) (not start!80168) b_and!29343 (not b!941986) (not mapNonEmpty!32467))
(check-sat b_and!29343 (not b_next!17931))
(get-model)

(declare-fun d!114133 () Bool)

(assert (=> d!114133 (= (array_inv!21250 (_keys!10468 thiss!1141)) (bvsge (size!27813 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941981 d!114133))

(declare-fun d!114135 () Bool)

(assert (=> d!114135 (= (array_inv!21251 (_values!5627 thiss!1141)) (bvsge (size!27812 (_values!5627 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941981 d!114135))

(declare-fun d!114137 () Bool)

(declare-fun res!633116 () Bool)

(declare-fun e!529636 () Bool)

(assert (=> d!114137 (=> (not res!633116) (not e!529636))))

(declare-fun simpleValid!344 (LongMapFixedSize!4626) Bool)

(assert (=> d!114137 (= res!633116 (simpleValid!344 thiss!1141))))

(assert (=> d!114137 (= (valid!1771 thiss!1141) e!529636)))

(declare-fun b!942017 () Bool)

(declare-fun res!633117 () Bool)

(assert (=> b!942017 (=> (not res!633117) (not e!529636))))

(declare-fun arrayCountValidKeys!0 (array!56838 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942017 (= res!633117 (= (arrayCountValidKeys!0 (_keys!10468 thiss!1141) #b00000000000000000000000000000000 (size!27813 (_keys!10468 thiss!1141))) (_size!2368 thiss!1141)))))

(declare-fun b!942018 () Bool)

(declare-fun res!633118 () Bool)

(assert (=> b!942018 (=> (not res!633118) (not e!529636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56838 (_ BitVec 32)) Bool)

(assert (=> b!942018 (= res!633118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))

(declare-fun b!942019 () Bool)

(declare-datatypes ((List!19209 0))(
  ( (Nil!19206) (Cons!19205 (h!20354 (_ BitVec 64)) (t!27524 List!19209)) )
))
(declare-fun arrayNoDuplicates!0 (array!56838 (_ BitVec 32) List!19209) Bool)

(assert (=> b!942019 (= e!529636 (arrayNoDuplicates!0 (_keys!10468 thiss!1141) #b00000000000000000000000000000000 Nil!19206))))

(assert (= (and d!114137 res!633116) b!942017))

(assert (= (and b!942017 res!633117) b!942018))

(assert (= (and b!942018 res!633118) b!942019))

(declare-fun m!876809 () Bool)

(assert (=> d!114137 m!876809))

(declare-fun m!876811 () Bool)

(assert (=> b!942017 m!876811))

(declare-fun m!876813 () Bool)

(assert (=> b!942018 m!876813))

(declare-fun m!876815 () Bool)

(assert (=> b!942019 m!876815))

(assert (=> start!80168 d!114137))

(declare-fun d!114139 () Bool)

(assert (=> d!114139 (= (validMask!0 (mask!27193 thiss!1141)) (and (or (= (mask!27193 thiss!1141) #b00000000000000000000000000000111) (= (mask!27193 thiss!1141) #b00000000000000000000000000001111) (= (mask!27193 thiss!1141) #b00000000000000000000000000011111) (= (mask!27193 thiss!1141) #b00000000000000000000000000111111) (= (mask!27193 thiss!1141) #b00000000000000000000000001111111) (= (mask!27193 thiss!1141) #b00000000000000000000000011111111) (= (mask!27193 thiss!1141) #b00000000000000000000000111111111) (= (mask!27193 thiss!1141) #b00000000000000000000001111111111) (= (mask!27193 thiss!1141) #b00000000000000000000011111111111) (= (mask!27193 thiss!1141) #b00000000000000000000111111111111) (= (mask!27193 thiss!1141) #b00000000000000000001111111111111) (= (mask!27193 thiss!1141) #b00000000000000000011111111111111) (= (mask!27193 thiss!1141) #b00000000000000000111111111111111) (= (mask!27193 thiss!1141) #b00000000000000001111111111111111) (= (mask!27193 thiss!1141) #b00000000000000011111111111111111) (= (mask!27193 thiss!1141) #b00000000000000111111111111111111) (= (mask!27193 thiss!1141) #b00000000000001111111111111111111) (= (mask!27193 thiss!1141) #b00000000000011111111111111111111) (= (mask!27193 thiss!1141) #b00000000000111111111111111111111) (= (mask!27193 thiss!1141) #b00000000001111111111111111111111) (= (mask!27193 thiss!1141) #b00000000011111111111111111111111) (= (mask!27193 thiss!1141) #b00000000111111111111111111111111) (= (mask!27193 thiss!1141) #b00000001111111111111111111111111) (= (mask!27193 thiss!1141) #b00000011111111111111111111111111) (= (mask!27193 thiss!1141) #b00000111111111111111111111111111) (= (mask!27193 thiss!1141) #b00001111111111111111111111111111) (= (mask!27193 thiss!1141) #b00011111111111111111111111111111) (= (mask!27193 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27193 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941986 d!114139))

(declare-fun b!942032 () Bool)

(declare-fun e!529643 () SeekEntryResult!9027)

(assert (=> b!942032 (= e!529643 Undefined!9027)))

(declare-fun b!942033 () Bool)

(declare-fun e!529645 () SeekEntryResult!9027)

(declare-fun lt!425083 () SeekEntryResult!9027)

(assert (=> b!942033 (= e!529645 (MissingZero!9027 (index!38481 lt!425083)))))

(declare-fun b!942034 () Bool)

(declare-fun e!529644 () SeekEntryResult!9027)

(assert (=> b!942034 (= e!529644 (Found!9027 (index!38481 lt!425083)))))

(declare-fun b!942035 () Bool)

(declare-fun c!98170 () Bool)

(declare-fun lt!425080 () (_ BitVec 64))

(assert (=> b!942035 (= c!98170 (= lt!425080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942035 (= e!529644 e!529645)))

(declare-fun b!942036 () Bool)

(assert (=> b!942036 (= e!529643 e!529644)))

(assert (=> b!942036 (= lt!425080 (select (arr!27349 (_keys!10468 thiss!1141)) (index!38481 lt!425083)))))

(declare-fun c!98168 () Bool)

(assert (=> b!942036 (= c!98168 (= lt!425080 key!756))))

(declare-fun d!114141 () Bool)

(declare-fun lt!425081 () SeekEntryResult!9027)

(assert (=> d!114141 (and (or ((_ is MissingVacant!9027) lt!425081) (not ((_ is Found!9027) lt!425081)) (and (bvsge (index!38480 lt!425081) #b00000000000000000000000000000000) (bvslt (index!38480 lt!425081) (size!27813 (_keys!10468 thiss!1141))))) (not ((_ is MissingVacant!9027) lt!425081)) (or (not ((_ is Found!9027) lt!425081)) (= (select (arr!27349 (_keys!10468 thiss!1141)) (index!38480 lt!425081)) key!756)))))

(assert (=> d!114141 (= lt!425081 e!529643)))

(declare-fun c!98169 () Bool)

(assert (=> d!114141 (= c!98169 (and ((_ is Intermediate!9027) lt!425083) (undefined!9839 lt!425083)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56838 (_ BitVec 32)) SeekEntryResult!9027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114141 (= lt!425083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27193 thiss!1141)) key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))

(assert (=> d!114141 (validMask!0 (mask!27193 thiss!1141))))

(assert (=> d!114141 (= (seekEntry!0 key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)) lt!425081)))

(declare-fun b!942037 () Bool)

(declare-fun lt!425082 () SeekEntryResult!9027)

(assert (=> b!942037 (= e!529645 (ite ((_ is MissingVacant!9027) lt!425082) (MissingZero!9027 (index!38482 lt!425082)) lt!425082))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56838 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!942037 (= lt!425082 (seekKeyOrZeroReturnVacant!0 (x!80859 lt!425083) (index!38481 lt!425083) (index!38481 lt!425083) key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))

(assert (= (and d!114141 c!98169) b!942032))

(assert (= (and d!114141 (not c!98169)) b!942036))

(assert (= (and b!942036 c!98168) b!942034))

(assert (= (and b!942036 (not c!98168)) b!942035))

(assert (= (and b!942035 c!98170) b!942033))

(assert (= (and b!942035 (not c!98170)) b!942037))

(declare-fun m!876817 () Bool)

(assert (=> b!942036 m!876817))

(declare-fun m!876819 () Bool)

(assert (=> d!114141 m!876819))

(declare-fun m!876821 () Bool)

(assert (=> d!114141 m!876821))

(assert (=> d!114141 m!876821))

(declare-fun m!876823 () Bool)

(assert (=> d!114141 m!876823))

(assert (=> d!114141 m!876787))

(declare-fun m!876825 () Bool)

(assert (=> b!942037 m!876825))

(assert (=> b!941983 d!114141))

(declare-fun condMapEmpty!32473 () Bool)

(declare-fun mapDefault!32473 () ValueCell!9738)

(assert (=> mapNonEmpty!32467 (= condMapEmpty!32473 (= mapRest!32467 ((as const (Array (_ BitVec 32) ValueCell!9738)) mapDefault!32473)))))

(declare-fun e!529651 () Bool)

(declare-fun mapRes!32473 () Bool)

(assert (=> mapNonEmpty!32467 (= tp!62286 (and e!529651 mapRes!32473))))

(declare-fun b!942045 () Bool)

(assert (=> b!942045 (= e!529651 tp_is_empty!20439)))

(declare-fun b!942044 () Bool)

(declare-fun e!529650 () Bool)

(assert (=> b!942044 (= e!529650 tp_is_empty!20439)))

(declare-fun mapNonEmpty!32473 () Bool)

(declare-fun tp!62295 () Bool)

(assert (=> mapNonEmpty!32473 (= mapRes!32473 (and tp!62295 e!529650))))

(declare-fun mapValue!32473 () ValueCell!9738)

(declare-fun mapRest!32473 () (Array (_ BitVec 32) ValueCell!9738))

(declare-fun mapKey!32473 () (_ BitVec 32))

(assert (=> mapNonEmpty!32473 (= mapRest!32467 (store mapRest!32473 mapKey!32473 mapValue!32473))))

(declare-fun mapIsEmpty!32473 () Bool)

(assert (=> mapIsEmpty!32473 mapRes!32473))

(assert (= (and mapNonEmpty!32467 condMapEmpty!32473) mapIsEmpty!32473))

(assert (= (and mapNonEmpty!32467 (not condMapEmpty!32473)) mapNonEmpty!32473))

(assert (= (and mapNonEmpty!32473 ((_ is ValueCellFull!9738) mapValue!32473)) b!942044))

(assert (= (and mapNonEmpty!32467 ((_ is ValueCellFull!9738) mapDefault!32473)) b!942045))

(declare-fun m!876827 () Bool)

(assert (=> mapNonEmpty!32473 m!876827))

(check-sat (not b!942017) (not b!942037) (not b!942019) tp_is_empty!20439 (not b_next!17931) b_and!29343 (not b!942018) (not d!114137) (not d!114141) (not mapNonEmpty!32473))
(check-sat b_and!29343 (not b_next!17931))
(get-model)

(declare-fun b!942056 () Bool)

(declare-fun e!529661 () Bool)

(declare-fun e!529662 () Bool)

(assert (=> b!942056 (= e!529661 e!529662)))

(declare-fun res!633126 () Bool)

(assert (=> b!942056 (=> (not res!633126) (not e!529662))))

(declare-fun e!529663 () Bool)

(assert (=> b!942056 (= res!633126 (not e!529663))))

(declare-fun res!633125 () Bool)

(assert (=> b!942056 (=> (not res!633125) (not e!529663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942056 (= res!633125 (validKeyInArray!0 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942057 () Bool)

(declare-fun e!529660 () Bool)

(declare-fun call!40944 () Bool)

(assert (=> b!942057 (= e!529660 call!40944)))

(declare-fun b!942058 () Bool)

(assert (=> b!942058 (= e!529660 call!40944)))

(declare-fun b!942059 () Bool)

(declare-fun contains!5134 (List!19209 (_ BitVec 64)) Bool)

(assert (=> b!942059 (= e!529663 (contains!5134 Nil!19206 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942060 () Bool)

(assert (=> b!942060 (= e!529662 e!529660)))

(declare-fun c!98173 () Bool)

(assert (=> b!942060 (= c!98173 (validKeyInArray!0 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114143 () Bool)

(declare-fun res!633127 () Bool)

(assert (=> d!114143 (=> res!633127 e!529661)))

(assert (=> d!114143 (= res!633127 (bvsge #b00000000000000000000000000000000 (size!27813 (_keys!10468 thiss!1141))))))

(assert (=> d!114143 (= (arrayNoDuplicates!0 (_keys!10468 thiss!1141) #b00000000000000000000000000000000 Nil!19206) e!529661)))

(declare-fun bm!40941 () Bool)

(assert (=> bm!40941 (= call!40944 (arrayNoDuplicates!0 (_keys!10468 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98173 (Cons!19205 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000) Nil!19206) Nil!19206)))))

(assert (= (and d!114143 (not res!633127)) b!942056))

(assert (= (and b!942056 res!633125) b!942059))

(assert (= (and b!942056 res!633126) b!942060))

(assert (= (and b!942060 c!98173) b!942058))

(assert (= (and b!942060 (not c!98173)) b!942057))

(assert (= (or b!942058 b!942057) bm!40941))

(declare-fun m!876829 () Bool)

(assert (=> b!942056 m!876829))

(assert (=> b!942056 m!876829))

(declare-fun m!876831 () Bool)

(assert (=> b!942056 m!876831))

(assert (=> b!942059 m!876829))

(assert (=> b!942059 m!876829))

(declare-fun m!876833 () Bool)

(assert (=> b!942059 m!876833))

(assert (=> b!942060 m!876829))

(assert (=> b!942060 m!876829))

(assert (=> b!942060 m!876831))

(assert (=> bm!40941 m!876829))

(declare-fun m!876835 () Bool)

(assert (=> bm!40941 m!876835))

(assert (=> b!942019 d!114143))

(declare-fun b!942079 () Bool)

(declare-fun lt!425089 () SeekEntryResult!9027)

(assert (=> b!942079 (and (bvsge (index!38481 lt!425089) #b00000000000000000000000000000000) (bvslt (index!38481 lt!425089) (size!27813 (_keys!10468 thiss!1141))))))

(declare-fun res!633134 () Bool)

(assert (=> b!942079 (= res!633134 (= (select (arr!27349 (_keys!10468 thiss!1141)) (index!38481 lt!425089)) key!756))))

(declare-fun e!529677 () Bool)

(assert (=> b!942079 (=> res!633134 e!529677)))

(declare-fun e!529675 () Bool)

(assert (=> b!942079 (= e!529675 e!529677)))

(declare-fun b!942080 () Bool)

(declare-fun e!529676 () SeekEntryResult!9027)

(assert (=> b!942080 (= e!529676 (Intermediate!9027 true (toIndex!0 key!756 (mask!27193 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!942081 () Bool)

(declare-fun e!529678 () SeekEntryResult!9027)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942081 (= e!529678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27193 thiss!1141)) #b00000000000000000000000000000000 (mask!27193 thiss!1141)) key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))

(declare-fun b!942082 () Bool)

(assert (=> b!942082 (and (bvsge (index!38481 lt!425089) #b00000000000000000000000000000000) (bvslt (index!38481 lt!425089) (size!27813 (_keys!10468 thiss!1141))))))

(assert (=> b!942082 (= e!529677 (= (select (arr!27349 (_keys!10468 thiss!1141)) (index!38481 lt!425089)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!114145 () Bool)

(declare-fun e!529674 () Bool)

(assert (=> d!114145 e!529674))

(declare-fun c!98182 () Bool)

(assert (=> d!114145 (= c!98182 (and ((_ is Intermediate!9027) lt!425089) (undefined!9839 lt!425089)))))

(assert (=> d!114145 (= lt!425089 e!529676)))

(declare-fun c!98180 () Bool)

(assert (=> d!114145 (= c!98180 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425088 () (_ BitVec 64))

(assert (=> d!114145 (= lt!425088 (select (arr!27349 (_keys!10468 thiss!1141)) (toIndex!0 key!756 (mask!27193 thiss!1141))))))

(assert (=> d!114145 (validMask!0 (mask!27193 thiss!1141))))

(assert (=> d!114145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27193 thiss!1141)) key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)) lt!425089)))

(declare-fun b!942083 () Bool)

(assert (=> b!942083 (= e!529674 (bvsge (x!80859 lt!425089) #b01111111111111111111111111111110))))

(declare-fun b!942084 () Bool)

(assert (=> b!942084 (= e!529676 e!529678)))

(declare-fun c!98181 () Bool)

(assert (=> b!942084 (= c!98181 (or (= lt!425088 key!756) (= (bvadd lt!425088 lt!425088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!942085 () Bool)

(assert (=> b!942085 (and (bvsge (index!38481 lt!425089) #b00000000000000000000000000000000) (bvslt (index!38481 lt!425089) (size!27813 (_keys!10468 thiss!1141))))))

(declare-fun res!633135 () Bool)

(assert (=> b!942085 (= res!633135 (= (select (arr!27349 (_keys!10468 thiss!1141)) (index!38481 lt!425089)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942085 (=> res!633135 e!529677)))

(declare-fun b!942086 () Bool)

(assert (=> b!942086 (= e!529674 e!529675)))

(declare-fun res!633136 () Bool)

(assert (=> b!942086 (= res!633136 (and ((_ is Intermediate!9027) lt!425089) (not (undefined!9839 lt!425089)) (bvslt (x!80859 lt!425089) #b01111111111111111111111111111110) (bvsge (x!80859 lt!425089) #b00000000000000000000000000000000) (bvsge (x!80859 lt!425089) #b00000000000000000000000000000000)))))

(assert (=> b!942086 (=> (not res!633136) (not e!529675))))

(declare-fun b!942087 () Bool)

(assert (=> b!942087 (= e!529678 (Intermediate!9027 false (toIndex!0 key!756 (mask!27193 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114145 c!98180) b!942080))

(assert (= (and d!114145 (not c!98180)) b!942084))

(assert (= (and b!942084 c!98181) b!942087))

(assert (= (and b!942084 (not c!98181)) b!942081))

(assert (= (and d!114145 c!98182) b!942083))

(assert (= (and d!114145 (not c!98182)) b!942086))

(assert (= (and b!942086 res!633136) b!942079))

(assert (= (and b!942079 (not res!633134)) b!942085))

(assert (= (and b!942085 (not res!633135)) b!942082))

(declare-fun m!876837 () Bool)

(assert (=> b!942079 m!876837))

(assert (=> d!114145 m!876821))

(declare-fun m!876839 () Bool)

(assert (=> d!114145 m!876839))

(assert (=> d!114145 m!876787))

(assert (=> b!942082 m!876837))

(assert (=> b!942081 m!876821))

(declare-fun m!876841 () Bool)

(assert (=> b!942081 m!876841))

(assert (=> b!942081 m!876841))

(declare-fun m!876843 () Bool)

(assert (=> b!942081 m!876843))

(assert (=> b!942085 m!876837))

(assert (=> d!114141 d!114145))

(declare-fun d!114147 () Bool)

(declare-fun lt!425095 () (_ BitVec 32))

(declare-fun lt!425094 () (_ BitVec 32))

(assert (=> d!114147 (= lt!425095 (bvmul (bvxor lt!425094 (bvlshr lt!425094 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114147 (= lt!425094 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114147 (and (bvsge (mask!27193 thiss!1141) #b00000000000000000000000000000000) (let ((res!633137 (let ((h!20355 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80876 (bvmul (bvxor h!20355 (bvlshr h!20355 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80876 (bvlshr x!80876 #b00000000000000000000000000001101)) (mask!27193 thiss!1141)))))) (and (bvslt res!633137 (bvadd (mask!27193 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633137 #b00000000000000000000000000000000))))))

(assert (=> d!114147 (= (toIndex!0 key!756 (mask!27193 thiss!1141)) (bvand (bvxor lt!425095 (bvlshr lt!425095 #b00000000000000000000000000001101)) (mask!27193 thiss!1141)))))

(assert (=> d!114141 d!114147))

(assert (=> d!114141 d!114139))

(declare-fun bm!40944 () Bool)

(declare-fun call!40947 () Bool)

(assert (=> bm!40944 (= call!40947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))

(declare-fun b!942096 () Bool)

(declare-fun e!529687 () Bool)

(assert (=> b!942096 (= e!529687 call!40947)))

(declare-fun b!942097 () Bool)

(declare-fun e!529686 () Bool)

(assert (=> b!942097 (= e!529687 e!529686)))

(declare-fun lt!425104 () (_ BitVec 64))

(assert (=> b!942097 (= lt!425104 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31806 0))(
  ( (Unit!31807) )
))
(declare-fun lt!425103 () Unit!31806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56838 (_ BitVec 64) (_ BitVec 32)) Unit!31806)

(assert (=> b!942097 (= lt!425103 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10468 thiss!1141) lt!425104 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942097 (arrayContainsKey!0 (_keys!10468 thiss!1141) lt!425104 #b00000000000000000000000000000000)))

(declare-fun lt!425102 () Unit!31806)

(assert (=> b!942097 (= lt!425102 lt!425103)))

(declare-fun res!633143 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56838 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!942097 (= res!633143 (= (seekEntryOrOpen!0 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000) (_keys!10468 thiss!1141) (mask!27193 thiss!1141)) (Found!9027 #b00000000000000000000000000000000)))))

(assert (=> b!942097 (=> (not res!633143) (not e!529686))))

(declare-fun b!942098 () Bool)

(assert (=> b!942098 (= e!529686 call!40947)))

(declare-fun b!942099 () Bool)

(declare-fun e!529685 () Bool)

(assert (=> b!942099 (= e!529685 e!529687)))

(declare-fun c!98185 () Bool)

(assert (=> b!942099 (= c!98185 (validKeyInArray!0 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114149 () Bool)

(declare-fun res!633142 () Bool)

(assert (=> d!114149 (=> res!633142 e!529685)))

(assert (=> d!114149 (= res!633142 (bvsge #b00000000000000000000000000000000 (size!27813 (_keys!10468 thiss!1141))))))

(assert (=> d!114149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)) e!529685)))

(assert (= (and d!114149 (not res!633142)) b!942099))

(assert (= (and b!942099 c!98185) b!942097))

(assert (= (and b!942099 (not c!98185)) b!942096))

(assert (= (and b!942097 res!633143) b!942098))

(assert (= (or b!942098 b!942096) bm!40944))

(declare-fun m!876845 () Bool)

(assert (=> bm!40944 m!876845))

(assert (=> b!942097 m!876829))

(declare-fun m!876847 () Bool)

(assert (=> b!942097 m!876847))

(declare-fun m!876849 () Bool)

(assert (=> b!942097 m!876849))

(assert (=> b!942097 m!876829))

(declare-fun m!876851 () Bool)

(assert (=> b!942097 m!876851))

(assert (=> b!942099 m!876829))

(assert (=> b!942099 m!876829))

(assert (=> b!942099 m!876831))

(assert (=> b!942018 d!114149))

(declare-fun d!114151 () Bool)

(declare-fun lt!425109 () SeekEntryResult!9027)

(assert (=> d!114151 (and (or ((_ is Undefined!9027) lt!425109) (not ((_ is Found!9027) lt!425109)) (and (bvsge (index!38480 lt!425109) #b00000000000000000000000000000000) (bvslt (index!38480 lt!425109) (size!27813 (_keys!10468 thiss!1141))))) (or ((_ is Undefined!9027) lt!425109) ((_ is Found!9027) lt!425109) (not ((_ is MissingVacant!9027) lt!425109)) (not (= (index!38482 lt!425109) (index!38481 lt!425083))) (and (bvsge (index!38482 lt!425109) #b00000000000000000000000000000000) (bvslt (index!38482 lt!425109) (size!27813 (_keys!10468 thiss!1141))))) (or ((_ is Undefined!9027) lt!425109) (ite ((_ is Found!9027) lt!425109) (= (select (arr!27349 (_keys!10468 thiss!1141)) (index!38480 lt!425109)) key!756) (and ((_ is MissingVacant!9027) lt!425109) (= (index!38482 lt!425109) (index!38481 lt!425083)) (= (select (arr!27349 (_keys!10468 thiss!1141)) (index!38482 lt!425109)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!529696 () SeekEntryResult!9027)

(assert (=> d!114151 (= lt!425109 e!529696)))

(declare-fun c!98192 () Bool)

(assert (=> d!114151 (= c!98192 (bvsge (x!80859 lt!425083) #b01111111111111111111111111111110))))

(declare-fun lt!425110 () (_ BitVec 64))

(assert (=> d!114151 (= lt!425110 (select (arr!27349 (_keys!10468 thiss!1141)) (index!38481 lt!425083)))))

(assert (=> d!114151 (validMask!0 (mask!27193 thiss!1141))))

(assert (=> d!114151 (= (seekKeyOrZeroReturnVacant!0 (x!80859 lt!425083) (index!38481 lt!425083) (index!38481 lt!425083) key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)) lt!425109)))

(declare-fun b!942112 () Bool)

(declare-fun e!529695 () SeekEntryResult!9027)

(assert (=> b!942112 (= e!529695 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80859 lt!425083) #b00000000000000000000000000000001) (nextIndex!0 (index!38481 lt!425083) (x!80859 lt!425083) (mask!27193 thiss!1141)) (index!38481 lt!425083) key!756 (_keys!10468 thiss!1141) (mask!27193 thiss!1141)))))

(declare-fun b!942113 () Bool)

(declare-fun e!529694 () SeekEntryResult!9027)

(assert (=> b!942113 (= e!529696 e!529694)))

(declare-fun c!98194 () Bool)

(assert (=> b!942113 (= c!98194 (= lt!425110 key!756))))

(declare-fun b!942114 () Bool)

(assert (=> b!942114 (= e!529694 (Found!9027 (index!38481 lt!425083)))))

(declare-fun b!942115 () Bool)

(declare-fun c!98193 () Bool)

(assert (=> b!942115 (= c!98193 (= lt!425110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942115 (= e!529694 e!529695)))

(declare-fun b!942116 () Bool)

(assert (=> b!942116 (= e!529695 (MissingVacant!9027 (index!38481 lt!425083)))))

(declare-fun b!942117 () Bool)

(assert (=> b!942117 (= e!529696 Undefined!9027)))

(assert (= (and d!114151 c!98192) b!942117))

(assert (= (and d!114151 (not c!98192)) b!942113))

(assert (= (and b!942113 c!98194) b!942114))

(assert (= (and b!942113 (not c!98194)) b!942115))

(assert (= (and b!942115 c!98193) b!942116))

(assert (= (and b!942115 (not c!98193)) b!942112))

(declare-fun m!876853 () Bool)

(assert (=> d!114151 m!876853))

(declare-fun m!876855 () Bool)

(assert (=> d!114151 m!876855))

(assert (=> d!114151 m!876817))

(assert (=> d!114151 m!876787))

(declare-fun m!876857 () Bool)

(assert (=> b!942112 m!876857))

(assert (=> b!942112 m!876857))

(declare-fun m!876859 () Bool)

(assert (=> b!942112 m!876859))

(assert (=> b!942037 d!114151))

(declare-fun b!942128 () Bool)

(declare-fun res!633153 () Bool)

(declare-fun e!529699 () Bool)

(assert (=> b!942128 (=> (not res!633153) (not e!529699))))

(declare-fun size!27816 (LongMapFixedSize!4626) (_ BitVec 32))

(assert (=> b!942128 (= res!633153 (= (size!27816 thiss!1141) (bvadd (_size!2368 thiss!1141) (bvsdiv (bvadd (extraKeys!5336 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!942127 () Bool)

(declare-fun res!633154 () Bool)

(assert (=> b!942127 (=> (not res!633154) (not e!529699))))

(assert (=> b!942127 (= res!633154 (bvsge (size!27816 thiss!1141) (_size!2368 thiss!1141)))))

(declare-fun b!942129 () Bool)

(assert (=> b!942129 (= e!529699 (and (bvsge (extraKeys!5336 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5336 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2368 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114153 () Bool)

(declare-fun res!633152 () Bool)

(assert (=> d!114153 (=> (not res!633152) (not e!529699))))

(assert (=> d!114153 (= res!633152 (validMask!0 (mask!27193 thiss!1141)))))

(assert (=> d!114153 (= (simpleValid!344 thiss!1141) e!529699)))

(declare-fun b!942126 () Bool)

(declare-fun res!633155 () Bool)

(assert (=> b!942126 (=> (not res!633155) (not e!529699))))

(assert (=> b!942126 (= res!633155 (and (= (size!27812 (_values!5627 thiss!1141)) (bvadd (mask!27193 thiss!1141) #b00000000000000000000000000000001)) (= (size!27813 (_keys!10468 thiss!1141)) (size!27812 (_values!5627 thiss!1141))) (bvsge (_size!2368 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2368 thiss!1141) (bvadd (mask!27193 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114153 res!633152) b!942126))

(assert (= (and b!942126 res!633155) b!942127))

(assert (= (and b!942127 res!633154) b!942128))

(assert (= (and b!942128 res!633153) b!942129))

(declare-fun m!876861 () Bool)

(assert (=> b!942128 m!876861))

(assert (=> b!942127 m!876861))

(assert (=> d!114153 m!876787))

(assert (=> d!114137 d!114153))

(declare-fun b!942138 () Bool)

(declare-fun e!529704 () (_ BitVec 32))

(declare-fun call!40950 () (_ BitVec 32))

(assert (=> b!942138 (= e!529704 (bvadd #b00000000000000000000000000000001 call!40950))))

(declare-fun b!942139 () Bool)

(assert (=> b!942139 (= e!529704 call!40950)))

(declare-fun d!114155 () Bool)

(declare-fun lt!425113 () (_ BitVec 32))

(assert (=> d!114155 (and (bvsge lt!425113 #b00000000000000000000000000000000) (bvsle lt!425113 (bvsub (size!27813 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!529705 () (_ BitVec 32))

(assert (=> d!114155 (= lt!425113 e!529705)))

(declare-fun c!98199 () Bool)

(assert (=> d!114155 (= c!98199 (bvsge #b00000000000000000000000000000000 (size!27813 (_keys!10468 thiss!1141))))))

(assert (=> d!114155 (and (bvsle #b00000000000000000000000000000000 (size!27813 (_keys!10468 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27813 (_keys!10468 thiss!1141)) (size!27813 (_keys!10468 thiss!1141))))))

(assert (=> d!114155 (= (arrayCountValidKeys!0 (_keys!10468 thiss!1141) #b00000000000000000000000000000000 (size!27813 (_keys!10468 thiss!1141))) lt!425113)))

(declare-fun b!942140 () Bool)

(assert (=> b!942140 (= e!529705 e!529704)))

(declare-fun c!98200 () Bool)

(assert (=> b!942140 (= c!98200 (validKeyInArray!0 (select (arr!27349 (_keys!10468 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40947 () Bool)

(assert (=> bm!40947 (= call!40950 (arrayCountValidKeys!0 (_keys!10468 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27813 (_keys!10468 thiss!1141))))))

(declare-fun b!942141 () Bool)

(assert (=> b!942141 (= e!529705 #b00000000000000000000000000000000)))

(assert (= (and d!114155 c!98199) b!942141))

(assert (= (and d!114155 (not c!98199)) b!942140))

(assert (= (and b!942140 c!98200) b!942138))

(assert (= (and b!942140 (not c!98200)) b!942139))

(assert (= (or b!942138 b!942139) bm!40947))

(assert (=> b!942140 m!876829))

(assert (=> b!942140 m!876829))

(assert (=> b!942140 m!876831))

(declare-fun m!876863 () Bool)

(assert (=> bm!40947 m!876863))

(assert (=> b!942017 d!114155))

(declare-fun condMapEmpty!32474 () Bool)

(declare-fun mapDefault!32474 () ValueCell!9738)

(assert (=> mapNonEmpty!32473 (= condMapEmpty!32474 (= mapRest!32473 ((as const (Array (_ BitVec 32) ValueCell!9738)) mapDefault!32474)))))

(declare-fun e!529707 () Bool)

(declare-fun mapRes!32474 () Bool)

(assert (=> mapNonEmpty!32473 (= tp!62295 (and e!529707 mapRes!32474))))

(declare-fun b!942143 () Bool)

(assert (=> b!942143 (= e!529707 tp_is_empty!20439)))

(declare-fun b!942142 () Bool)

(declare-fun e!529706 () Bool)

(assert (=> b!942142 (= e!529706 tp_is_empty!20439)))

(declare-fun mapNonEmpty!32474 () Bool)

(declare-fun tp!62296 () Bool)

(assert (=> mapNonEmpty!32474 (= mapRes!32474 (and tp!62296 e!529706))))

(declare-fun mapRest!32474 () (Array (_ BitVec 32) ValueCell!9738))

(declare-fun mapKey!32474 () (_ BitVec 32))

(declare-fun mapValue!32474 () ValueCell!9738)

(assert (=> mapNonEmpty!32474 (= mapRest!32473 (store mapRest!32474 mapKey!32474 mapValue!32474))))

(declare-fun mapIsEmpty!32474 () Bool)

(assert (=> mapIsEmpty!32474 mapRes!32474))

(assert (= (and mapNonEmpty!32473 condMapEmpty!32474) mapIsEmpty!32474))

(assert (= (and mapNonEmpty!32473 (not condMapEmpty!32474)) mapNonEmpty!32474))

(assert (= (and mapNonEmpty!32474 ((_ is ValueCellFull!9738) mapValue!32474)) b!942142))

(assert (= (and mapNonEmpty!32473 ((_ is ValueCellFull!9738) mapDefault!32474)) b!942143))

(declare-fun m!876865 () Bool)

(assert (=> mapNonEmpty!32474 m!876865))

(check-sat (not b!942099) (not d!114151) (not b!942081) (not bm!40947) (not b!942060) (not b!942059) (not b!942097) (not d!114153) (not b!942140) tp_is_empty!20439 (not b_next!17931) (not bm!40941) (not b!942128) (not bm!40944) (not b!942056) (not mapNonEmpty!32474) (not d!114145) (not b!942112) b_and!29343 (not b!942127))
(check-sat b_and!29343 (not b_next!17931))
