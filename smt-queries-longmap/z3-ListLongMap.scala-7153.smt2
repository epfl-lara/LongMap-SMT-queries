; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90980 () Bool)

(assert start!90980)

(declare-fun b!1039135 () Bool)

(declare-fun b_free!20971 () Bool)

(declare-fun b_next!20971 () Bool)

(assert (=> b!1039135 (= b_free!20971 (not b_next!20971))))

(declare-fun tp!74090 () Bool)

(declare-fun b_and!33477 () Bool)

(assert (=> b!1039135 (= tp!74090 b_and!33477)))

(declare-fun b!1039131 () Bool)

(declare-fun e!588100 () Bool)

(declare-fun e!588103 () Bool)

(assert (=> b!1039131 (= e!588100 e!588103)))

(declare-fun res!693047 () Bool)

(assert (=> b!1039131 (=> (not res!693047) (not e!588103))))

(declare-datatypes ((SeekEntryResult!9776 0))(
  ( (MissingZero!9776 (index!41475 (_ BitVec 32))) (Found!9776 (index!41476 (_ BitVec 32))) (Intermediate!9776 (undefined!10588 Bool) (index!41477 (_ BitVec 32)) (x!92749 (_ BitVec 32))) (Undefined!9776) (MissingVacant!9776 (index!41478 (_ BitVec 32))) )
))
(declare-fun lt!457845 () SeekEntryResult!9776)

(get-info :version)

(assert (=> b!1039131 (= res!693047 ((_ is Found!9776) lt!457845))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37795 0))(
  ( (V!37796 (val!12396 Int)) )
))
(declare-datatypes ((ValueCell!11642 0))(
  ( (ValueCellFull!11642 (v!14982 V!37795)) (EmptyCell!11642) )
))
(declare-datatypes ((array!65445 0))(
  ( (array!65446 (arr!31494 (Array (_ BitVec 32) (_ BitVec 64))) (size!32027 (_ BitVec 32))) )
))
(declare-datatypes ((array!65447 0))(
  ( (array!65448 (arr!31495 (Array (_ BitVec 32) ValueCell!11642)) (size!32028 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5878 0))(
  ( (LongMapFixedSize!5879 (defaultEntry!6321 Int) (mask!30278 (_ BitVec 32)) (extraKeys!6049 (_ BitVec 32)) (zeroValue!6155 V!37795) (minValue!6155 V!37795) (_size!2994 (_ BitVec 32)) (_keys!11526 array!65445) (_values!6344 array!65447) (_vacant!2994 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5878)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65445 (_ BitVec 32)) SeekEntryResult!9776)

(assert (=> b!1039131 (= lt!457845 (seekEntry!0 key!909 (_keys!11526 thiss!1427) (mask!30278 thiss!1427)))))

(declare-fun b!1039132 () Bool)

(declare-fun res!693043 () Bool)

(declare-fun e!588105 () Bool)

(assert (=> b!1039132 (=> res!693043 e!588105)))

(assert (=> b!1039132 (= res!693043 (or (not (= (size!32027 (_keys!11526 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30278 thiss!1427)))) (bvslt (index!41476 lt!457845) #b00000000000000000000000000000000) (bvsge (index!41476 lt!457845) (size!32027 (_keys!11526 thiss!1427)))))))

(declare-fun res!693048 () Bool)

(assert (=> start!90980 (=> (not res!693048) (not e!588100))))

(declare-fun valid!2202 (LongMapFixedSize!5878) Bool)

(assert (=> start!90980 (= res!693048 (valid!2202 thiss!1427))))

(assert (=> start!90980 e!588100))

(declare-fun e!588102 () Bool)

(assert (=> start!90980 e!588102))

(assert (=> start!90980 true))

(declare-fun b!1039133 () Bool)

(declare-datatypes ((List!21981 0))(
  ( (Nil!21978) (Cons!21977 (h!23181 (_ BitVec 64)) (t!31186 List!21981)) )
))
(declare-fun arrayNoDuplicates!0 (array!65445 (_ BitVec 32) List!21981) Bool)

(assert (=> b!1039133 (= e!588105 (arrayNoDuplicates!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 Nil!21978))))

(declare-fun b!1039134 () Bool)

(assert (=> b!1039134 (= e!588103 (not e!588105))))

(declare-fun res!693045 () Bool)

(assert (=> b!1039134 (=> res!693045 e!588105)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039134 (= res!693045 (not (validMask!0 (mask!30278 thiss!1427))))))

(declare-fun lt!457843 () array!65445)

(assert (=> b!1039134 (arrayNoDuplicates!0 lt!457843 #b00000000000000000000000000000000 Nil!21978)))

(declare-datatypes ((Unit!33875 0))(
  ( (Unit!33876) )
))
(declare-fun lt!457844 () Unit!33875)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21981) Unit!33875)

(assert (=> b!1039134 (= lt!457844 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11526 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41476 lt!457845) #b00000000000000000000000000000000 Nil!21978))))

(declare-fun arrayCountValidKeys!0 (array!65445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039134 (= (arrayCountValidKeys!0 lt!457843 #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039134 (= lt!457843 (array!65446 (store (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32027 (_keys!11526 thiss!1427))))))

(declare-fun lt!457846 () Unit!33875)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65445 (_ BitVec 32) (_ BitVec 64)) Unit!33875)

(assert (=> b!1039134 (= lt!457846 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11526 thiss!1427) (index!41476 lt!457845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24691 () Bool)

(declare-fun e!588104 () Bool)

(declare-fun array_inv!24353 (array!65445) Bool)

(declare-fun array_inv!24354 (array!65447) Bool)

(assert (=> b!1039135 (= e!588102 (and tp!74090 tp_is_empty!24691 (array_inv!24353 (_keys!11526 thiss!1427)) (array_inv!24354 (_values!6344 thiss!1427)) e!588104))))

(declare-fun b!1039136 () Bool)

(declare-fun e!588101 () Bool)

(assert (=> b!1039136 (= e!588101 tp_is_empty!24691)))

(declare-fun b!1039137 () Bool)

(declare-fun res!693046 () Bool)

(assert (=> b!1039137 (=> (not res!693046) (not e!588100))))

(assert (=> b!1039137 (= res!693046 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38596 () Bool)

(declare-fun mapRes!38596 () Bool)

(assert (=> mapIsEmpty!38596 mapRes!38596))

(declare-fun b!1039138 () Bool)

(declare-fun e!588099 () Bool)

(assert (=> b!1039138 (= e!588099 tp_is_empty!24691)))

(declare-fun b!1039139 () Bool)

(declare-fun res!693044 () Bool)

(assert (=> b!1039139 (=> res!693044 e!588105)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039139 (= res!693044 (not (validKeyInArray!0 (select (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845)))))))

(declare-fun b!1039140 () Bool)

(assert (=> b!1039140 (= e!588104 (and e!588101 mapRes!38596))))

(declare-fun condMapEmpty!38596 () Bool)

(declare-fun mapDefault!38596 () ValueCell!11642)

(assert (=> b!1039140 (= condMapEmpty!38596 (= (arr!31495 (_values!6344 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11642)) mapDefault!38596)))))

(declare-fun mapNonEmpty!38596 () Bool)

(declare-fun tp!74089 () Bool)

(assert (=> mapNonEmpty!38596 (= mapRes!38596 (and tp!74089 e!588099))))

(declare-fun mapKey!38596 () (_ BitVec 32))

(declare-fun mapValue!38596 () ValueCell!11642)

(declare-fun mapRest!38596 () (Array (_ BitVec 32) ValueCell!11642))

(assert (=> mapNonEmpty!38596 (= (arr!31495 (_values!6344 thiss!1427)) (store mapRest!38596 mapKey!38596 mapValue!38596))))

(assert (= (and start!90980 res!693048) b!1039137))

(assert (= (and b!1039137 res!693046) b!1039131))

(assert (= (and b!1039131 res!693047) b!1039134))

(assert (= (and b!1039134 (not res!693045)) b!1039132))

(assert (= (and b!1039132 (not res!693043)) b!1039139))

(assert (= (and b!1039139 (not res!693044)) b!1039133))

(assert (= (and b!1039140 condMapEmpty!38596) mapIsEmpty!38596))

(assert (= (and b!1039140 (not condMapEmpty!38596)) mapNonEmpty!38596))

(assert (= (and mapNonEmpty!38596 ((_ is ValueCellFull!11642) mapValue!38596)) b!1039138))

(assert (= (and b!1039140 ((_ is ValueCellFull!11642) mapDefault!38596)) b!1039136))

(assert (= b!1039135 b!1039140))

(assert (= start!90980 b!1039135))

(declare-fun m!958401 () Bool)

(assert (=> b!1039134 m!958401))

(declare-fun m!958403 () Bool)

(assert (=> b!1039134 m!958403))

(declare-fun m!958405 () Bool)

(assert (=> b!1039134 m!958405))

(declare-fun m!958407 () Bool)

(assert (=> b!1039134 m!958407))

(declare-fun m!958409 () Bool)

(assert (=> b!1039134 m!958409))

(declare-fun m!958411 () Bool)

(assert (=> b!1039134 m!958411))

(declare-fun m!958413 () Bool)

(assert (=> b!1039134 m!958413))

(declare-fun m!958415 () Bool)

(assert (=> b!1039131 m!958415))

(declare-fun m!958417 () Bool)

(assert (=> b!1039139 m!958417))

(assert (=> b!1039139 m!958417))

(declare-fun m!958419 () Bool)

(assert (=> b!1039139 m!958419))

(declare-fun m!958421 () Bool)

(assert (=> start!90980 m!958421))

(declare-fun m!958423 () Bool)

(assert (=> b!1039133 m!958423))

(declare-fun m!958425 () Bool)

(assert (=> mapNonEmpty!38596 m!958425))

(declare-fun m!958427 () Bool)

(assert (=> b!1039135 m!958427))

(declare-fun m!958429 () Bool)

(assert (=> b!1039135 m!958429))

(check-sat (not b_next!20971) tp_is_empty!24691 (not b!1039139) (not mapNonEmpty!38596) (not b!1039131) (not b!1039135) (not b!1039134) b_and!33477 (not start!90980) (not b!1039133))
(check-sat b_and!33477 (not b_next!20971))
(get-model)

(declare-fun d!125331 () Bool)

(assert (=> d!125331 (= (validKeyInArray!0 (select (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845))) (and (not (= (select (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039139 d!125331))

(declare-fun d!125333 () Bool)

(assert (=> d!125333 (= (array_inv!24353 (_keys!11526 thiss!1427)) (bvsge (size!32027 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039135 d!125333))

(declare-fun d!125335 () Bool)

(assert (=> d!125335 (= (array_inv!24354 (_values!6344 thiss!1427)) (bvsge (size!32028 (_values!6344 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039135 d!125335))

(declare-fun bm!43962 () Bool)

(declare-fun call!43965 () Bool)

(declare-fun c!105292 () Bool)

(assert (=> bm!43962 (= call!43965 (arrayNoDuplicates!0 (_keys!11526 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105292 (Cons!21977 (select (arr!31494 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000) Nil!21978) Nil!21978)))))

(declare-fun d!125337 () Bool)

(declare-fun res!693091 () Bool)

(declare-fun e!588163 () Bool)

(assert (=> d!125337 (=> res!693091 e!588163)))

(assert (=> d!125337 (= res!693091 (bvsge #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))))))

(assert (=> d!125337 (= (arrayNoDuplicates!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 Nil!21978) e!588163)))

(declare-fun b!1039211 () Bool)

(declare-fun e!588166 () Bool)

(declare-fun contains!6023 (List!21981 (_ BitVec 64)) Bool)

(assert (=> b!1039211 (= e!588166 (contains!6023 Nil!21978 (select (arr!31494 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039212 () Bool)

(declare-fun e!588165 () Bool)

(assert (=> b!1039212 (= e!588165 call!43965)))

(declare-fun b!1039213 () Bool)

(declare-fun e!588164 () Bool)

(assert (=> b!1039213 (= e!588163 e!588164)))

(declare-fun res!693092 () Bool)

(assert (=> b!1039213 (=> (not res!693092) (not e!588164))))

(assert (=> b!1039213 (= res!693092 (not e!588166))))

(declare-fun res!693093 () Bool)

(assert (=> b!1039213 (=> (not res!693093) (not e!588166))))

(assert (=> b!1039213 (= res!693093 (validKeyInArray!0 (select (arr!31494 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039214 () Bool)

(assert (=> b!1039214 (= e!588165 call!43965)))

(declare-fun b!1039215 () Bool)

(assert (=> b!1039215 (= e!588164 e!588165)))

(assert (=> b!1039215 (= c!105292 (validKeyInArray!0 (select (arr!31494 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125337 (not res!693091)) b!1039213))

(assert (= (and b!1039213 res!693093) b!1039211))

(assert (= (and b!1039213 res!693092) b!1039215))

(assert (= (and b!1039215 c!105292) b!1039214))

(assert (= (and b!1039215 (not c!105292)) b!1039212))

(assert (= (or b!1039214 b!1039212) bm!43962))

(declare-fun m!958491 () Bool)

(assert (=> bm!43962 m!958491))

(declare-fun m!958493 () Bool)

(assert (=> bm!43962 m!958493))

(assert (=> b!1039211 m!958491))

(assert (=> b!1039211 m!958491))

(declare-fun m!958495 () Bool)

(assert (=> b!1039211 m!958495))

(assert (=> b!1039213 m!958491))

(assert (=> b!1039213 m!958491))

(declare-fun m!958497 () Bool)

(assert (=> b!1039213 m!958497))

(assert (=> b!1039215 m!958491))

(assert (=> b!1039215 m!958491))

(assert (=> b!1039215 m!958497))

(assert (=> b!1039133 d!125337))

(declare-fun b!1039224 () Bool)

(declare-fun e!588171 () (_ BitVec 32))

(assert (=> b!1039224 (= e!588171 #b00000000000000000000000000000000)))

(declare-fun b!1039225 () Bool)

(declare-fun e!588172 () (_ BitVec 32))

(declare-fun call!43968 () (_ BitVec 32))

(assert (=> b!1039225 (= e!588172 call!43968)))

(declare-fun b!1039226 () Bool)

(assert (=> b!1039226 (= e!588171 e!588172)))

(declare-fun c!105298 () Bool)

(assert (=> b!1039226 (= c!105298 (validKeyInArray!0 (select (arr!31494 lt!457843) #b00000000000000000000000000000000)))))

(declare-fun d!125339 () Bool)

(declare-fun lt!457873 () (_ BitVec 32))

(assert (=> d!125339 (and (bvsge lt!457873 #b00000000000000000000000000000000) (bvsle lt!457873 (bvsub (size!32027 lt!457843) #b00000000000000000000000000000000)))))

(assert (=> d!125339 (= lt!457873 e!588171)))

(declare-fun c!105297 () Bool)

(assert (=> d!125339 (= c!105297 (bvsge #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))))))

(assert (=> d!125339 (and (bvsle #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32027 (_keys!11526 thiss!1427)) (size!32027 lt!457843)))))

(assert (=> d!125339 (= (arrayCountValidKeys!0 lt!457843 #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) lt!457873)))

(declare-fun b!1039227 () Bool)

(assert (=> b!1039227 (= e!588172 (bvadd #b00000000000000000000000000000001 call!43968))))

(declare-fun bm!43965 () Bool)

(assert (=> bm!43965 (= call!43968 (arrayCountValidKeys!0 lt!457843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32027 (_keys!11526 thiss!1427))))))

(assert (= (and d!125339 c!105297) b!1039224))

(assert (= (and d!125339 (not c!105297)) b!1039226))

(assert (= (and b!1039226 c!105298) b!1039227))

(assert (= (and b!1039226 (not c!105298)) b!1039225))

(assert (= (or b!1039227 b!1039225) bm!43965))

(declare-fun m!958499 () Bool)

(assert (=> b!1039226 m!958499))

(assert (=> b!1039226 m!958499))

(declare-fun m!958501 () Bool)

(assert (=> b!1039226 m!958501))

(declare-fun m!958503 () Bool)

(assert (=> bm!43965 m!958503))

(assert (=> b!1039134 d!125339))

(declare-fun d!125341 () Bool)

(assert (=> d!125341 (= (validMask!0 (mask!30278 thiss!1427)) (and (or (= (mask!30278 thiss!1427) #b00000000000000000000000000000111) (= (mask!30278 thiss!1427) #b00000000000000000000000000001111) (= (mask!30278 thiss!1427) #b00000000000000000000000000011111) (= (mask!30278 thiss!1427) #b00000000000000000000000000111111) (= (mask!30278 thiss!1427) #b00000000000000000000000001111111) (= (mask!30278 thiss!1427) #b00000000000000000000000011111111) (= (mask!30278 thiss!1427) #b00000000000000000000000111111111) (= (mask!30278 thiss!1427) #b00000000000000000000001111111111) (= (mask!30278 thiss!1427) #b00000000000000000000011111111111) (= (mask!30278 thiss!1427) #b00000000000000000000111111111111) (= (mask!30278 thiss!1427) #b00000000000000000001111111111111) (= (mask!30278 thiss!1427) #b00000000000000000011111111111111) (= (mask!30278 thiss!1427) #b00000000000000000111111111111111) (= (mask!30278 thiss!1427) #b00000000000000001111111111111111) (= (mask!30278 thiss!1427) #b00000000000000011111111111111111) (= (mask!30278 thiss!1427) #b00000000000000111111111111111111) (= (mask!30278 thiss!1427) #b00000000000001111111111111111111) (= (mask!30278 thiss!1427) #b00000000000011111111111111111111) (= (mask!30278 thiss!1427) #b00000000000111111111111111111111) (= (mask!30278 thiss!1427) #b00000000001111111111111111111111) (= (mask!30278 thiss!1427) #b00000000011111111111111111111111) (= (mask!30278 thiss!1427) #b00000000111111111111111111111111) (= (mask!30278 thiss!1427) #b00000001111111111111111111111111) (= (mask!30278 thiss!1427) #b00000011111111111111111111111111) (= (mask!30278 thiss!1427) #b00000111111111111111111111111111) (= (mask!30278 thiss!1427) #b00001111111111111111111111111111) (= (mask!30278 thiss!1427) #b00011111111111111111111111111111) (= (mask!30278 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30278 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039134 d!125341))

(declare-fun b!1039228 () Bool)

(declare-fun e!588173 () (_ BitVec 32))

(assert (=> b!1039228 (= e!588173 #b00000000000000000000000000000000)))

(declare-fun b!1039229 () Bool)

(declare-fun e!588174 () (_ BitVec 32))

(declare-fun call!43969 () (_ BitVec 32))

(assert (=> b!1039229 (= e!588174 call!43969)))

(declare-fun b!1039230 () Bool)

(assert (=> b!1039230 (= e!588173 e!588174)))

(declare-fun c!105300 () Bool)

(assert (=> b!1039230 (= c!105300 (validKeyInArray!0 (select (arr!31494 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125343 () Bool)

(declare-fun lt!457874 () (_ BitVec 32))

(assert (=> d!125343 (and (bvsge lt!457874 #b00000000000000000000000000000000) (bvsle lt!457874 (bvsub (size!32027 (_keys!11526 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125343 (= lt!457874 e!588173)))

(declare-fun c!105299 () Bool)

(assert (=> d!125343 (= c!105299 (bvsge #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))))))

(assert (=> d!125343 (and (bvsle #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32027 (_keys!11526 thiss!1427)) (size!32027 (_keys!11526 thiss!1427))))))

(assert (=> d!125343 (= (arrayCountValidKeys!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) lt!457874)))

(declare-fun b!1039231 () Bool)

(assert (=> b!1039231 (= e!588174 (bvadd #b00000000000000000000000000000001 call!43969))))

(declare-fun bm!43966 () Bool)

(assert (=> bm!43966 (= call!43969 (arrayCountValidKeys!0 (_keys!11526 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32027 (_keys!11526 thiss!1427))))))

(assert (= (and d!125343 c!105299) b!1039228))

(assert (= (and d!125343 (not c!105299)) b!1039230))

(assert (= (and b!1039230 c!105300) b!1039231))

(assert (= (and b!1039230 (not c!105300)) b!1039229))

(assert (= (or b!1039231 b!1039229) bm!43966))

(assert (=> b!1039230 m!958491))

(assert (=> b!1039230 m!958491))

(assert (=> b!1039230 m!958497))

(declare-fun m!958505 () Bool)

(assert (=> bm!43966 m!958505))

(assert (=> b!1039134 d!125343))

(declare-fun bm!43967 () Bool)

(declare-fun call!43970 () Bool)

(declare-fun c!105301 () Bool)

(assert (=> bm!43967 (= call!43970 (arrayNoDuplicates!0 lt!457843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105301 (Cons!21977 (select (arr!31494 lt!457843) #b00000000000000000000000000000000) Nil!21978) Nil!21978)))))

(declare-fun d!125345 () Bool)

(declare-fun res!693094 () Bool)

(declare-fun e!588175 () Bool)

(assert (=> d!125345 (=> res!693094 e!588175)))

(assert (=> d!125345 (= res!693094 (bvsge #b00000000000000000000000000000000 (size!32027 lt!457843)))))

(assert (=> d!125345 (= (arrayNoDuplicates!0 lt!457843 #b00000000000000000000000000000000 Nil!21978) e!588175)))

(declare-fun b!1039232 () Bool)

(declare-fun e!588178 () Bool)

(assert (=> b!1039232 (= e!588178 (contains!6023 Nil!21978 (select (arr!31494 lt!457843) #b00000000000000000000000000000000)))))

(declare-fun b!1039233 () Bool)

(declare-fun e!588177 () Bool)

(assert (=> b!1039233 (= e!588177 call!43970)))

(declare-fun b!1039234 () Bool)

(declare-fun e!588176 () Bool)

(assert (=> b!1039234 (= e!588175 e!588176)))

(declare-fun res!693095 () Bool)

(assert (=> b!1039234 (=> (not res!693095) (not e!588176))))

(assert (=> b!1039234 (= res!693095 (not e!588178))))

(declare-fun res!693096 () Bool)

(assert (=> b!1039234 (=> (not res!693096) (not e!588178))))

(assert (=> b!1039234 (= res!693096 (validKeyInArray!0 (select (arr!31494 lt!457843) #b00000000000000000000000000000000)))))

(declare-fun b!1039235 () Bool)

(assert (=> b!1039235 (= e!588177 call!43970)))

(declare-fun b!1039236 () Bool)

(assert (=> b!1039236 (= e!588176 e!588177)))

(assert (=> b!1039236 (= c!105301 (validKeyInArray!0 (select (arr!31494 lt!457843) #b00000000000000000000000000000000)))))

(assert (= (and d!125345 (not res!693094)) b!1039234))

(assert (= (and b!1039234 res!693096) b!1039232))

(assert (= (and b!1039234 res!693095) b!1039236))

(assert (= (and b!1039236 c!105301) b!1039235))

(assert (= (and b!1039236 (not c!105301)) b!1039233))

(assert (= (or b!1039235 b!1039233) bm!43967))

(assert (=> bm!43967 m!958499))

(declare-fun m!958507 () Bool)

(assert (=> bm!43967 m!958507))

(assert (=> b!1039232 m!958499))

(assert (=> b!1039232 m!958499))

(declare-fun m!958509 () Bool)

(assert (=> b!1039232 m!958509))

(assert (=> b!1039234 m!958499))

(assert (=> b!1039234 m!958499))

(assert (=> b!1039234 m!958501))

(assert (=> b!1039236 m!958499))

(assert (=> b!1039236 m!958499))

(assert (=> b!1039236 m!958501))

(assert (=> b!1039134 d!125345))

(declare-fun d!125347 () Bool)

(declare-fun e!588181 () Bool)

(assert (=> d!125347 e!588181))

(declare-fun res!693099 () Bool)

(assert (=> d!125347 (=> (not res!693099) (not e!588181))))

(assert (=> d!125347 (= res!693099 (and (bvsge (index!41476 lt!457845) #b00000000000000000000000000000000) (bvslt (index!41476 lt!457845) (size!32027 (_keys!11526 thiss!1427)))))))

(declare-fun lt!457877 () Unit!33875)

(declare-fun choose!53 (array!65445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21981) Unit!33875)

(assert (=> d!125347 (= lt!457877 (choose!53 (_keys!11526 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41476 lt!457845) #b00000000000000000000000000000000 Nil!21978))))

(assert (=> d!125347 (bvslt (size!32027 (_keys!11526 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125347 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11526 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41476 lt!457845) #b00000000000000000000000000000000 Nil!21978) lt!457877)))

(declare-fun b!1039239 () Bool)

(assert (=> b!1039239 (= e!588181 (arrayNoDuplicates!0 (array!65446 (store (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32027 (_keys!11526 thiss!1427))) #b00000000000000000000000000000000 Nil!21978))))

(assert (= (and d!125347 res!693099) b!1039239))

(declare-fun m!958511 () Bool)

(assert (=> d!125347 m!958511))

(assert (=> b!1039239 m!958401))

(declare-fun m!958513 () Bool)

(assert (=> b!1039239 m!958513))

(assert (=> b!1039134 d!125347))

(declare-fun b!1039249 () Bool)

(declare-fun res!693110 () Bool)

(declare-fun e!588186 () Bool)

(assert (=> b!1039249 (=> (not res!693110) (not e!588186))))

(assert (=> b!1039249 (= res!693110 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039250 () Bool)

(assert (=> b!1039250 (= e!588186 (bvslt (size!32027 (_keys!11526 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039251 () Bool)

(declare-fun e!588187 () Bool)

(assert (=> b!1039251 (= e!588187 (= (arrayCountValidKeys!0 (array!65446 (store (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32027 (_keys!11526 thiss!1427))) #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125349 () Bool)

(assert (=> d!125349 e!588187))

(declare-fun res!693108 () Bool)

(assert (=> d!125349 (=> (not res!693108) (not e!588187))))

(assert (=> d!125349 (= res!693108 (and (bvsge (index!41476 lt!457845) #b00000000000000000000000000000000) (bvslt (index!41476 lt!457845) (size!32027 (_keys!11526 thiss!1427)))))))

(declare-fun lt!457880 () Unit!33875)

(declare-fun choose!82 (array!65445 (_ BitVec 32) (_ BitVec 64)) Unit!33875)

(assert (=> d!125349 (= lt!457880 (choose!82 (_keys!11526 thiss!1427) (index!41476 lt!457845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125349 e!588186))

(declare-fun res!693111 () Bool)

(assert (=> d!125349 (=> (not res!693111) (not e!588186))))

(assert (=> d!125349 (= res!693111 (and (bvsge (index!41476 lt!457845) #b00000000000000000000000000000000) (bvslt (index!41476 lt!457845) (size!32027 (_keys!11526 thiss!1427)))))))

(assert (=> d!125349 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11526 thiss!1427) (index!41476 lt!457845) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457880)))

(declare-fun b!1039248 () Bool)

(declare-fun res!693109 () Bool)

(assert (=> b!1039248 (=> (not res!693109) (not e!588186))))

(assert (=> b!1039248 (= res!693109 (validKeyInArray!0 (select (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457845))))))

(assert (= (and d!125349 res!693111) b!1039248))

(assert (= (and b!1039248 res!693109) b!1039249))

(assert (= (and b!1039249 res!693110) b!1039250))

(assert (= (and d!125349 res!693108) b!1039251))

(declare-fun m!958515 () Bool)

(assert (=> b!1039249 m!958515))

(assert (=> b!1039251 m!958401))

(declare-fun m!958517 () Bool)

(assert (=> b!1039251 m!958517))

(assert (=> b!1039251 m!958409))

(declare-fun m!958519 () Bool)

(assert (=> d!125349 m!958519))

(assert (=> b!1039248 m!958417))

(assert (=> b!1039248 m!958417))

(assert (=> b!1039248 m!958419))

(assert (=> b!1039134 d!125349))

(declare-fun d!125351 () Bool)

(declare-fun res!693118 () Bool)

(declare-fun e!588190 () Bool)

(assert (=> d!125351 (=> (not res!693118) (not e!588190))))

(declare-fun simpleValid!427 (LongMapFixedSize!5878) Bool)

(assert (=> d!125351 (= res!693118 (simpleValid!427 thiss!1427))))

(assert (=> d!125351 (= (valid!2202 thiss!1427) e!588190)))

(declare-fun b!1039258 () Bool)

(declare-fun res!693119 () Bool)

(assert (=> b!1039258 (=> (not res!693119) (not e!588190))))

(assert (=> b!1039258 (= res!693119 (= (arrayCountValidKeys!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11526 thiss!1427))) (_size!2994 thiss!1427)))))

(declare-fun b!1039259 () Bool)

(declare-fun res!693120 () Bool)

(assert (=> b!1039259 (=> (not res!693120) (not e!588190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65445 (_ BitVec 32)) Bool)

(assert (=> b!1039259 (= res!693120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11526 thiss!1427) (mask!30278 thiss!1427)))))

(declare-fun b!1039260 () Bool)

(assert (=> b!1039260 (= e!588190 (arrayNoDuplicates!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 Nil!21978))))

(assert (= (and d!125351 res!693118) b!1039258))

(assert (= (and b!1039258 res!693119) b!1039259))

(assert (= (and b!1039259 res!693120) b!1039260))

(declare-fun m!958521 () Bool)

(assert (=> d!125351 m!958521))

(assert (=> b!1039258 m!958409))

(declare-fun m!958523 () Bool)

(assert (=> b!1039259 m!958523))

(assert (=> b!1039260 m!958423))

(assert (=> start!90980 d!125351))

(declare-fun b!1039273 () Bool)

(declare-fun e!588199 () SeekEntryResult!9776)

(declare-fun e!588197 () SeekEntryResult!9776)

(assert (=> b!1039273 (= e!588199 e!588197)))

(declare-fun lt!457891 () (_ BitVec 64))

(declare-fun lt!457889 () SeekEntryResult!9776)

(assert (=> b!1039273 (= lt!457891 (select (arr!31494 (_keys!11526 thiss!1427)) (index!41477 lt!457889)))))

(declare-fun c!105310 () Bool)

(assert (=> b!1039273 (= c!105310 (= lt!457891 key!909))))

(declare-fun d!125353 () Bool)

(declare-fun lt!457892 () SeekEntryResult!9776)

(assert (=> d!125353 (and (or ((_ is MissingVacant!9776) lt!457892) (not ((_ is Found!9776) lt!457892)) (and (bvsge (index!41476 lt!457892) #b00000000000000000000000000000000) (bvslt (index!41476 lt!457892) (size!32027 (_keys!11526 thiss!1427))))) (not ((_ is MissingVacant!9776) lt!457892)) (or (not ((_ is Found!9776) lt!457892)) (= (select (arr!31494 (_keys!11526 thiss!1427)) (index!41476 lt!457892)) key!909)))))

(assert (=> d!125353 (= lt!457892 e!588199)))

(declare-fun c!105308 () Bool)

(assert (=> d!125353 (= c!105308 (and ((_ is Intermediate!9776) lt!457889) (undefined!10588 lt!457889)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65445 (_ BitVec 32)) SeekEntryResult!9776)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125353 (= lt!457889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30278 thiss!1427)) key!909 (_keys!11526 thiss!1427) (mask!30278 thiss!1427)))))

(assert (=> d!125353 (validMask!0 (mask!30278 thiss!1427))))

(assert (=> d!125353 (= (seekEntry!0 key!909 (_keys!11526 thiss!1427) (mask!30278 thiss!1427)) lt!457892)))

(declare-fun b!1039274 () Bool)

(assert (=> b!1039274 (= e!588197 (Found!9776 (index!41477 lt!457889)))))

(declare-fun b!1039275 () Bool)

(declare-fun c!105309 () Bool)

(assert (=> b!1039275 (= c!105309 (= lt!457891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588198 () SeekEntryResult!9776)

(assert (=> b!1039275 (= e!588197 e!588198)))

(declare-fun b!1039276 () Bool)

(assert (=> b!1039276 (= e!588198 (MissingZero!9776 (index!41477 lt!457889)))))

(declare-fun b!1039277 () Bool)

(assert (=> b!1039277 (= e!588199 Undefined!9776)))

(declare-fun b!1039278 () Bool)

(declare-fun lt!457890 () SeekEntryResult!9776)

(assert (=> b!1039278 (= e!588198 (ite ((_ is MissingVacant!9776) lt!457890) (MissingZero!9776 (index!41478 lt!457890)) lt!457890))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65445 (_ BitVec 32)) SeekEntryResult!9776)

(assert (=> b!1039278 (= lt!457890 (seekKeyOrZeroReturnVacant!0 (x!92749 lt!457889) (index!41477 lt!457889) (index!41477 lt!457889) key!909 (_keys!11526 thiss!1427) (mask!30278 thiss!1427)))))

(assert (= (and d!125353 c!105308) b!1039277))

(assert (= (and d!125353 (not c!105308)) b!1039273))

(assert (= (and b!1039273 c!105310) b!1039274))

(assert (= (and b!1039273 (not c!105310)) b!1039275))

(assert (= (and b!1039275 c!105309) b!1039276))

(assert (= (and b!1039275 (not c!105309)) b!1039278))

(declare-fun m!958525 () Bool)

(assert (=> b!1039273 m!958525))

(declare-fun m!958527 () Bool)

(assert (=> d!125353 m!958527))

(declare-fun m!958529 () Bool)

(assert (=> d!125353 m!958529))

(assert (=> d!125353 m!958529))

(declare-fun m!958531 () Bool)

(assert (=> d!125353 m!958531))

(assert (=> d!125353 m!958403))

(declare-fun m!958533 () Bool)

(assert (=> b!1039278 m!958533))

(assert (=> b!1039131 d!125353))

(declare-fun mapIsEmpty!38605 () Bool)

(declare-fun mapRes!38605 () Bool)

(assert (=> mapIsEmpty!38605 mapRes!38605))

(declare-fun mapNonEmpty!38605 () Bool)

(declare-fun tp!74105 () Bool)

(declare-fun e!588204 () Bool)

(assert (=> mapNonEmpty!38605 (= mapRes!38605 (and tp!74105 e!588204))))

(declare-fun mapValue!38605 () ValueCell!11642)

(declare-fun mapRest!38605 () (Array (_ BitVec 32) ValueCell!11642))

(declare-fun mapKey!38605 () (_ BitVec 32))

(assert (=> mapNonEmpty!38605 (= mapRest!38596 (store mapRest!38605 mapKey!38605 mapValue!38605))))

(declare-fun b!1039285 () Bool)

(assert (=> b!1039285 (= e!588204 tp_is_empty!24691)))

(declare-fun condMapEmpty!38605 () Bool)

(declare-fun mapDefault!38605 () ValueCell!11642)

(assert (=> mapNonEmpty!38596 (= condMapEmpty!38605 (= mapRest!38596 ((as const (Array (_ BitVec 32) ValueCell!11642)) mapDefault!38605)))))

(declare-fun e!588205 () Bool)

(assert (=> mapNonEmpty!38596 (= tp!74089 (and e!588205 mapRes!38605))))

(declare-fun b!1039286 () Bool)

(assert (=> b!1039286 (= e!588205 tp_is_empty!24691)))

(assert (= (and mapNonEmpty!38596 condMapEmpty!38605) mapIsEmpty!38605))

(assert (= (and mapNonEmpty!38596 (not condMapEmpty!38605)) mapNonEmpty!38605))

(assert (= (and mapNonEmpty!38605 ((_ is ValueCellFull!11642) mapValue!38605)) b!1039285))

(assert (= (and mapNonEmpty!38596 ((_ is ValueCellFull!11642) mapDefault!38605)) b!1039286))

(declare-fun m!958535 () Bool)

(assert (=> mapNonEmpty!38605 m!958535))

(check-sat (not b_next!20971) (not b!1039236) (not b!1039258) (not b!1039226) (not b!1039215) (not bm!43965) (not d!125353) (not bm!43967) b_and!33477 (not d!125349) (not b!1039259) (not b!1039211) (not b!1039234) (not bm!43962) tp_is_empty!24691 (not d!125347) (not b!1039249) (not mapNonEmpty!38605) (not b!1039251) (not b!1039248) (not b!1039239) (not b!1039213) (not d!125351) (not b!1039260) (not b!1039230) (not b!1039232) (not bm!43966) (not b!1039278))
(check-sat b_and!33477 (not b_next!20971))
