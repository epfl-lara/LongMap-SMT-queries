; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90700 () Bool)

(assert start!90700)

(declare-fun b!1037208 () Bool)

(declare-fun b_free!20889 () Bool)

(declare-fun b_next!20889 () Bool)

(assert (=> b!1037208 (= b_free!20889 (not b_next!20889))))

(declare-fun tp!73810 () Bool)

(declare-fun b_and!33421 () Bool)

(assert (=> b!1037208 (= tp!73810 b_and!33421)))

(declare-fun mapIsEmpty!38439 () Bool)

(declare-fun mapRes!38439 () Bool)

(assert (=> mapIsEmpty!38439 mapRes!38439))

(declare-fun mapNonEmpty!38439 () Bool)

(declare-fun tp!73809 () Bool)

(declare-fun e!586671 () Bool)

(assert (=> mapNonEmpty!38439 (= mapRes!38439 (and tp!73809 e!586671))))

(declare-datatypes ((V!37685 0))(
  ( (V!37686 (val!12355 Int)) )
))
(declare-datatypes ((ValueCell!11601 0))(
  ( (ValueCellFull!11601 (v!14938 V!37685)) (EmptyCell!11601) )
))
(declare-datatypes ((array!65320 0))(
  ( (array!65321 (arr!31443 (Array (_ BitVec 32) (_ BitVec 64))) (size!31973 (_ BitVec 32))) )
))
(declare-datatypes ((array!65322 0))(
  ( (array!65323 (arr!31444 (Array (_ BitVec 32) ValueCell!11601)) (size!31974 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5796 0))(
  ( (LongMapFixedSize!5797 (defaultEntry!6280 Int) (mask!30194 (_ BitVec 32)) (extraKeys!6008 (_ BitVec 32)) (zeroValue!6114 V!37685) (minValue!6114 V!37685) (_size!2953 (_ BitVec 32)) (_keys!11475 array!65320) (_values!6303 array!65322) (_vacant!2953 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5796)

(declare-fun mapKey!38439 () (_ BitVec 32))

(declare-fun mapRest!38439 () (Array (_ BitVec 32) ValueCell!11601))

(declare-fun mapValue!38439 () ValueCell!11601)

(assert (=> mapNonEmpty!38439 (= (arr!31444 (_values!6303 thiss!1427)) (store mapRest!38439 mapKey!38439 mapValue!38439))))

(declare-fun b!1037207 () Bool)

(declare-fun res!692093 () Bool)

(declare-fun e!586670 () Bool)

(assert (=> b!1037207 (=> (not res!692093) (not e!586670))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037207 (= res!692093 (not (= key!909 (bvneg key!909))))))

(declare-fun tp_is_empty!24609 () Bool)

(declare-fun e!586673 () Bool)

(declare-fun e!586669 () Bool)

(declare-fun array_inv!24321 (array!65320) Bool)

(declare-fun array_inv!24322 (array!65322) Bool)

(assert (=> b!1037208 (= e!586673 (and tp!73810 tp_is_empty!24609 (array_inv!24321 (_keys!11475 thiss!1427)) (array_inv!24322 (_values!6303 thiss!1427)) e!586669))))

(declare-fun res!692092 () Bool)

(assert (=> start!90700 (=> (not res!692092) (not e!586670))))

(declare-fun valid!2186 (LongMapFixedSize!5796) Bool)

(assert (=> start!90700 (= res!692092 (valid!2186 thiss!1427))))

(assert (=> start!90700 e!586670))

(assert (=> start!90700 e!586673))

(assert (=> start!90700 true))

(declare-fun b!1037209 () Bool)

(declare-fun e!586667 () Bool)

(assert (=> b!1037209 (= e!586669 (and e!586667 mapRes!38439))))

(declare-fun condMapEmpty!38439 () Bool)

(declare-fun mapDefault!38439 () ValueCell!11601)

(assert (=> b!1037209 (= condMapEmpty!38439 (= (arr!31444 (_values!6303 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11601)) mapDefault!38439)))))

(declare-fun b!1037210 () Bool)

(assert (=> b!1037210 (= e!586671 tp_is_empty!24609)))

(declare-fun b!1037211 () Bool)

(assert (=> b!1037211 (= e!586667 tp_is_empty!24609)))

(declare-fun b!1037212 () Bool)

(declare-fun e!586668 () Bool)

(assert (=> b!1037212 (= e!586670 e!586668)))

(declare-fun res!692094 () Bool)

(assert (=> b!1037212 (=> (not res!692094) (not e!586668))))

(declare-datatypes ((SeekEntryResult!9750 0))(
  ( (MissingZero!9750 (index!41371 (_ BitVec 32))) (Found!9750 (index!41372 (_ BitVec 32))) (Intermediate!9750 (undefined!10562 Bool) (index!41373 (_ BitVec 32)) (x!92517 (_ BitVec 32))) (Undefined!9750) (MissingVacant!9750 (index!41374 (_ BitVec 32))) )
))
(declare-fun lt!457425 () SeekEntryResult!9750)

(get-info :version)

(assert (=> b!1037212 (= res!692094 ((_ is Found!9750) lt!457425))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65320 (_ BitVec 32)) SeekEntryResult!9750)

(assert (=> b!1037212 (= lt!457425 (seekEntry!0 key!909 (_keys!11475 thiss!1427) (mask!30194 thiss!1427)))))

(declare-fun b!1037213 () Bool)

(assert (=> b!1037213 (= e!586668 (not (bvslt (size!31973 (_keys!11475 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun arrayCountValidKeys!0 (array!65320 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037213 (= (arrayCountValidKeys!0 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427))) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11475 thiss!1427) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33945 0))(
  ( (Unit!33946) )
))
(declare-fun lt!457426 () Unit!33945)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65320 (_ BitVec 32) (_ BitVec 64)) Unit!33945)

(assert (=> b!1037213 (= lt!457426 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11475 thiss!1427) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90700 res!692092) b!1037207))

(assert (= (and b!1037207 res!692093) b!1037212))

(assert (= (and b!1037212 res!692094) b!1037213))

(assert (= (and b!1037209 condMapEmpty!38439) mapIsEmpty!38439))

(assert (= (and b!1037209 (not condMapEmpty!38439)) mapNonEmpty!38439))

(assert (= (and mapNonEmpty!38439 ((_ is ValueCellFull!11601) mapValue!38439)) b!1037210))

(assert (= (and b!1037209 ((_ is ValueCellFull!11601) mapDefault!38439)) b!1037211))

(assert (= b!1037208 b!1037209))

(assert (= start!90700 b!1037208))

(declare-fun m!957471 () Bool)

(assert (=> b!1037213 m!957471))

(declare-fun m!957473 () Bool)

(assert (=> b!1037213 m!957473))

(declare-fun m!957475 () Bool)

(assert (=> b!1037213 m!957475))

(declare-fun m!957477 () Bool)

(assert (=> b!1037213 m!957477))

(declare-fun m!957479 () Bool)

(assert (=> b!1037208 m!957479))

(declare-fun m!957481 () Bool)

(assert (=> b!1037208 m!957481))

(declare-fun m!957483 () Bool)

(assert (=> mapNonEmpty!38439 m!957483))

(declare-fun m!957485 () Bool)

(assert (=> b!1037212 m!957485))

(declare-fun m!957487 () Bool)

(assert (=> start!90700 m!957487))

(check-sat (not mapNonEmpty!38439) (not b_next!20889) (not b!1037212) (not b!1037208) tp_is_empty!24609 b_and!33421 (not b!1037213) (not start!90700))
(check-sat b_and!33421 (not b_next!20889))
(get-model)

(declare-fun b!1037247 () Bool)

(declare-fun e!586703 () SeekEntryResult!9750)

(declare-fun lt!457443 () SeekEntryResult!9750)

(assert (=> b!1037247 (= e!586703 (ite ((_ is MissingVacant!9750) lt!457443) (MissingZero!9750 (index!41374 lt!457443)) lt!457443))))

(declare-fun lt!457442 () SeekEntryResult!9750)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65320 (_ BitVec 32)) SeekEntryResult!9750)

(assert (=> b!1037247 (= lt!457443 (seekKeyOrZeroReturnVacant!0 (x!92517 lt!457442) (index!41373 lt!457442) (index!41373 lt!457442) key!909 (_keys!11475 thiss!1427) (mask!30194 thiss!1427)))))

(declare-fun b!1037248 () Bool)

(declare-fun e!586701 () SeekEntryResult!9750)

(assert (=> b!1037248 (= e!586701 Undefined!9750)))

(declare-fun b!1037249 () Bool)

(declare-fun e!586702 () SeekEntryResult!9750)

(assert (=> b!1037249 (= e!586702 (Found!9750 (index!41373 lt!457442)))))

(declare-fun d!125207 () Bool)

(declare-fun lt!457441 () SeekEntryResult!9750)

(assert (=> d!125207 (and (or ((_ is MissingVacant!9750) lt!457441) (not ((_ is Found!9750) lt!457441)) (and (bvsge (index!41372 lt!457441) #b00000000000000000000000000000000) (bvslt (index!41372 lt!457441) (size!31973 (_keys!11475 thiss!1427))))) (not ((_ is MissingVacant!9750) lt!457441)) (or (not ((_ is Found!9750) lt!457441)) (= (select (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457441)) key!909)))))

(assert (=> d!125207 (= lt!457441 e!586701)))

(declare-fun c!105097 () Bool)

(assert (=> d!125207 (= c!105097 (and ((_ is Intermediate!9750) lt!457442) (undefined!10562 lt!457442)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65320 (_ BitVec 32)) SeekEntryResult!9750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125207 (= lt!457442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30194 thiss!1427)) key!909 (_keys!11475 thiss!1427) (mask!30194 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125207 (validMask!0 (mask!30194 thiss!1427))))

(assert (=> d!125207 (= (seekEntry!0 key!909 (_keys!11475 thiss!1427) (mask!30194 thiss!1427)) lt!457441)))

(declare-fun b!1037250 () Bool)

(assert (=> b!1037250 (= e!586701 e!586702)))

(declare-fun lt!457444 () (_ BitVec 64))

(assert (=> b!1037250 (= lt!457444 (select (arr!31443 (_keys!11475 thiss!1427)) (index!41373 lt!457442)))))

(declare-fun c!105098 () Bool)

(assert (=> b!1037250 (= c!105098 (= lt!457444 key!909))))

(declare-fun b!1037251 () Bool)

(assert (=> b!1037251 (= e!586703 (MissingZero!9750 (index!41373 lt!457442)))))

(declare-fun b!1037252 () Bool)

(declare-fun c!105099 () Bool)

(assert (=> b!1037252 (= c!105099 (= lt!457444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037252 (= e!586702 e!586703)))

(assert (= (and d!125207 c!105097) b!1037248))

(assert (= (and d!125207 (not c!105097)) b!1037250))

(assert (= (and b!1037250 c!105098) b!1037249))

(assert (= (and b!1037250 (not c!105098)) b!1037252))

(assert (= (and b!1037252 c!105099) b!1037251))

(assert (= (and b!1037252 (not c!105099)) b!1037247))

(declare-fun m!957507 () Bool)

(assert (=> b!1037247 m!957507))

(declare-fun m!957509 () Bool)

(assert (=> d!125207 m!957509))

(declare-fun m!957511 () Bool)

(assert (=> d!125207 m!957511))

(assert (=> d!125207 m!957511))

(declare-fun m!957513 () Bool)

(assert (=> d!125207 m!957513))

(declare-fun m!957515 () Bool)

(assert (=> d!125207 m!957515))

(declare-fun m!957517 () Bool)

(assert (=> b!1037250 m!957517))

(assert (=> b!1037212 d!125207))

(declare-fun d!125209 () Bool)

(declare-fun res!692110 () Bool)

(declare-fun e!586706 () Bool)

(assert (=> d!125209 (=> (not res!692110) (not e!586706))))

(declare-fun simpleValid!416 (LongMapFixedSize!5796) Bool)

(assert (=> d!125209 (= res!692110 (simpleValid!416 thiss!1427))))

(assert (=> d!125209 (= (valid!2186 thiss!1427) e!586706)))

(declare-fun b!1037259 () Bool)

(declare-fun res!692111 () Bool)

(assert (=> b!1037259 (=> (not res!692111) (not e!586706))))

(assert (=> b!1037259 (= res!692111 (= (arrayCountValidKeys!0 (_keys!11475 thiss!1427) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) (_size!2953 thiss!1427)))))

(declare-fun b!1037260 () Bool)

(declare-fun res!692112 () Bool)

(assert (=> b!1037260 (=> (not res!692112) (not e!586706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65320 (_ BitVec 32)) Bool)

(assert (=> b!1037260 (= res!692112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11475 thiss!1427) (mask!30194 thiss!1427)))))

(declare-fun b!1037261 () Bool)

(declare-datatypes ((List!21922 0))(
  ( (Nil!21919) (Cons!21918 (h!23121 (_ BitVec 64)) (t!31136 List!21922)) )
))
(declare-fun arrayNoDuplicates!0 (array!65320 (_ BitVec 32) List!21922) Bool)

(assert (=> b!1037261 (= e!586706 (arrayNoDuplicates!0 (_keys!11475 thiss!1427) #b00000000000000000000000000000000 Nil!21919))))

(assert (= (and d!125209 res!692110) b!1037259))

(assert (= (and b!1037259 res!692111) b!1037260))

(assert (= (and b!1037260 res!692112) b!1037261))

(declare-fun m!957519 () Bool)

(assert (=> d!125209 m!957519))

(assert (=> b!1037259 m!957475))

(declare-fun m!957521 () Bool)

(assert (=> b!1037260 m!957521))

(declare-fun m!957523 () Bool)

(assert (=> b!1037261 m!957523))

(assert (=> start!90700 d!125209))

(declare-fun d!125211 () Bool)

(assert (=> d!125211 (= (array_inv!24321 (_keys!11475 thiss!1427)) (bvsge (size!31973 (_keys!11475 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037208 d!125211))

(declare-fun d!125213 () Bool)

(assert (=> d!125213 (= (array_inv!24322 (_values!6303 thiss!1427)) (bvsge (size!31974 (_values!6303 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037208 d!125213))

(declare-fun b!1037270 () Bool)

(declare-fun e!586712 () (_ BitVec 32))

(declare-fun e!586711 () (_ BitVec 32))

(assert (=> b!1037270 (= e!586712 e!586711)))

(declare-fun c!105104 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037270 (= c!105104 (validKeyInArray!0 (select (arr!31443 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125215 () Bool)

(declare-fun lt!457447 () (_ BitVec 32))

(assert (=> d!125215 (and (bvsge lt!457447 #b00000000000000000000000000000000) (bvsle lt!457447 (bvsub (size!31973 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125215 (= lt!457447 e!586712)))

(declare-fun c!105105 () Bool)

(assert (=> d!125215 (= c!105105 (bvsge #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))))))

(assert (=> d!125215 (and (bvsle #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31973 (_keys!11475 thiss!1427)) (size!31973 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427))))))))

(assert (=> d!125215 (= (arrayCountValidKeys!0 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427))) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) lt!457447)))

(declare-fun b!1037271 () Bool)

(declare-fun call!43914 () (_ BitVec 32))

(assert (=> b!1037271 (= e!586711 call!43914)))

(declare-fun b!1037272 () Bool)

(assert (=> b!1037272 (= e!586711 (bvadd #b00000000000000000000000000000001 call!43914))))

(declare-fun b!1037273 () Bool)

(assert (=> b!1037273 (= e!586712 #b00000000000000000000000000000000)))

(declare-fun bm!43911 () Bool)

(assert (=> bm!43911 (= call!43914 (arrayCountValidKeys!0 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31973 (_keys!11475 thiss!1427))))))

(assert (= (and d!125215 c!105105) b!1037273))

(assert (= (and d!125215 (not c!105105)) b!1037270))

(assert (= (and b!1037270 c!105104) b!1037272))

(assert (= (and b!1037270 (not c!105104)) b!1037271))

(assert (= (or b!1037272 b!1037271) bm!43911))

(declare-fun m!957525 () Bool)

(assert (=> b!1037270 m!957525))

(assert (=> b!1037270 m!957525))

(declare-fun m!957527 () Bool)

(assert (=> b!1037270 m!957527))

(declare-fun m!957529 () Bool)

(assert (=> bm!43911 m!957529))

(assert (=> b!1037213 d!125215))

(declare-fun b!1037274 () Bool)

(declare-fun e!586714 () (_ BitVec 32))

(declare-fun e!586713 () (_ BitVec 32))

(assert (=> b!1037274 (= e!586714 e!586713)))

(declare-fun c!105106 () Bool)

(assert (=> b!1037274 (= c!105106 (validKeyInArray!0 (select (arr!31443 (_keys!11475 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125217 () Bool)

(declare-fun lt!457448 () (_ BitVec 32))

(assert (=> d!125217 (and (bvsge lt!457448 #b00000000000000000000000000000000) (bvsle lt!457448 (bvsub (size!31973 (_keys!11475 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125217 (= lt!457448 e!586714)))

(declare-fun c!105107 () Bool)

(assert (=> d!125217 (= c!105107 (bvsge #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))))))

(assert (=> d!125217 (and (bvsle #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31973 (_keys!11475 thiss!1427)) (size!31973 (_keys!11475 thiss!1427))))))

(assert (=> d!125217 (= (arrayCountValidKeys!0 (_keys!11475 thiss!1427) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) lt!457448)))

(declare-fun b!1037275 () Bool)

(declare-fun call!43915 () (_ BitVec 32))

(assert (=> b!1037275 (= e!586713 call!43915)))

(declare-fun b!1037276 () Bool)

(assert (=> b!1037276 (= e!586713 (bvadd #b00000000000000000000000000000001 call!43915))))

(declare-fun b!1037277 () Bool)

(assert (=> b!1037277 (= e!586714 #b00000000000000000000000000000000)))

(declare-fun bm!43912 () Bool)

(assert (=> bm!43912 (= call!43915 (arrayCountValidKeys!0 (_keys!11475 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31973 (_keys!11475 thiss!1427))))))

(assert (= (and d!125217 c!105107) b!1037277))

(assert (= (and d!125217 (not c!105107)) b!1037274))

(assert (= (and b!1037274 c!105106) b!1037276))

(assert (= (and b!1037274 (not c!105106)) b!1037275))

(assert (= (or b!1037276 b!1037275) bm!43912))

(declare-fun m!957531 () Bool)

(assert (=> b!1037274 m!957531))

(assert (=> b!1037274 m!957531))

(declare-fun m!957533 () Bool)

(assert (=> b!1037274 m!957533))

(declare-fun m!957535 () Bool)

(assert (=> bm!43912 m!957535))

(assert (=> b!1037213 d!125217))

(declare-fun b!1037289 () Bool)

(declare-fun e!586719 () Bool)

(assert (=> b!1037289 (= e!586719 (= (arrayCountValidKeys!0 (array!65321 (store (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31973 (_keys!11475 thiss!1427))) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11475 thiss!1427) #b00000000000000000000000000000000 (size!31973 (_keys!11475 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037286 () Bool)

(declare-fun res!692123 () Bool)

(declare-fun e!586720 () Bool)

(assert (=> b!1037286 (=> (not res!692123) (not e!586720))))

(assert (=> b!1037286 (= res!692123 (validKeyInArray!0 (select (arr!31443 (_keys!11475 thiss!1427)) (index!41372 lt!457425))))))

(declare-fun b!1037288 () Bool)

(assert (=> b!1037288 (= e!586720 (bvslt (size!31973 (_keys!11475 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125219 () Bool)

(assert (=> d!125219 e!586719))

(declare-fun res!692121 () Bool)

(assert (=> d!125219 (=> (not res!692121) (not e!586719))))

(assert (=> d!125219 (= res!692121 (and (bvsge (index!41372 lt!457425) #b00000000000000000000000000000000) (bvslt (index!41372 lt!457425) (size!31973 (_keys!11475 thiss!1427)))))))

(declare-fun lt!457451 () Unit!33945)

(declare-fun choose!82 (array!65320 (_ BitVec 32) (_ BitVec 64)) Unit!33945)

(assert (=> d!125219 (= lt!457451 (choose!82 (_keys!11475 thiss!1427) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125219 e!586720))

(declare-fun res!692124 () Bool)

(assert (=> d!125219 (=> (not res!692124) (not e!586720))))

(assert (=> d!125219 (= res!692124 (and (bvsge (index!41372 lt!457425) #b00000000000000000000000000000000) (bvslt (index!41372 lt!457425) (size!31973 (_keys!11475 thiss!1427)))))))

(assert (=> d!125219 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11475 thiss!1427) (index!41372 lt!457425) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457451)))

(declare-fun b!1037287 () Bool)

(declare-fun res!692122 () Bool)

(assert (=> b!1037287 (=> (not res!692122) (not e!586720))))

(assert (=> b!1037287 (= res!692122 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125219 res!692124) b!1037286))

(assert (= (and b!1037286 res!692123) b!1037287))

(assert (= (and b!1037287 res!692122) b!1037288))

(assert (= (and d!125219 res!692121) b!1037289))

(assert (=> b!1037289 m!957471))

(assert (=> b!1037289 m!957473))

(assert (=> b!1037289 m!957475))

(declare-fun m!957537 () Bool)

(assert (=> b!1037286 m!957537))

(assert (=> b!1037286 m!957537))

(declare-fun m!957539 () Bool)

(assert (=> b!1037286 m!957539))

(declare-fun m!957541 () Bool)

(assert (=> d!125219 m!957541))

(declare-fun m!957543 () Bool)

(assert (=> b!1037287 m!957543))

(assert (=> b!1037213 d!125219))

(declare-fun b!1037297 () Bool)

(declare-fun e!586726 () Bool)

(assert (=> b!1037297 (= e!586726 tp_is_empty!24609)))

(declare-fun condMapEmpty!38445 () Bool)

(declare-fun mapDefault!38445 () ValueCell!11601)

(assert (=> mapNonEmpty!38439 (= condMapEmpty!38445 (= mapRest!38439 ((as const (Array (_ BitVec 32) ValueCell!11601)) mapDefault!38445)))))

(declare-fun mapRes!38445 () Bool)

(assert (=> mapNonEmpty!38439 (= tp!73809 (and e!586726 mapRes!38445))))

(declare-fun b!1037296 () Bool)

(declare-fun e!586725 () Bool)

(assert (=> b!1037296 (= e!586725 tp_is_empty!24609)))

(declare-fun mapIsEmpty!38445 () Bool)

(assert (=> mapIsEmpty!38445 mapRes!38445))

(declare-fun mapNonEmpty!38445 () Bool)

(declare-fun tp!73819 () Bool)

(assert (=> mapNonEmpty!38445 (= mapRes!38445 (and tp!73819 e!586725))))

(declare-fun mapKey!38445 () (_ BitVec 32))

(declare-fun mapRest!38445 () (Array (_ BitVec 32) ValueCell!11601))

(declare-fun mapValue!38445 () ValueCell!11601)

(assert (=> mapNonEmpty!38445 (= mapRest!38439 (store mapRest!38445 mapKey!38445 mapValue!38445))))

(assert (= (and mapNonEmpty!38439 condMapEmpty!38445) mapIsEmpty!38445))

(assert (= (and mapNonEmpty!38439 (not condMapEmpty!38445)) mapNonEmpty!38445))

(assert (= (and mapNonEmpty!38445 ((_ is ValueCellFull!11601) mapValue!38445)) b!1037296))

(assert (= (and mapNonEmpty!38439 ((_ is ValueCellFull!11601) mapDefault!38445)) b!1037297))

(declare-fun m!957545 () Bool)

(assert (=> mapNonEmpty!38445 m!957545))

(check-sat (not b!1037261) (not d!125219) (not b!1037260) (not b!1037259) (not d!125209) (not b!1037289) (not b!1037247) (not b!1037270) tp_is_empty!24609 b_and!33421 (not bm!43911) (not d!125207) (not b!1037274) (not b_next!20889) (not bm!43912) (not mapNonEmpty!38445) (not b!1037286) (not b!1037287))
(check-sat b_and!33421 (not b_next!20889))
