; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90958 () Bool)

(assert start!90958)

(declare-fun b!1039150 () Bool)

(declare-fun b_free!20967 () Bool)

(declare-fun b_next!20967 () Bool)

(assert (=> b!1039150 (= b_free!20967 (not b_next!20967))))

(declare-fun tp!74074 () Bool)

(declare-fun b_and!33499 () Bool)

(assert (=> b!1039150 (= tp!74074 b_and!33499)))

(declare-fun b!1039145 () Bool)

(declare-fun res!693048 () Bool)

(declare-fun e!588101 () Bool)

(assert (=> b!1039145 (=> res!693048 e!588101)))

(declare-datatypes ((V!37789 0))(
  ( (V!37790 (val!12394 Int)) )
))
(declare-datatypes ((ValueCell!11640 0))(
  ( (ValueCellFull!11640 (v!14981 V!37789)) (EmptyCell!11640) )
))
(declare-datatypes ((array!65496 0))(
  ( (array!65497 (arr!31521 (Array (_ BitVec 32) (_ BitVec 64))) (size!32052 (_ BitVec 32))) )
))
(declare-datatypes ((array!65498 0))(
  ( (array!65499 (arr!31522 (Array (_ BitVec 32) ValueCell!11640)) (size!32053 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5874 0))(
  ( (LongMapFixedSize!5875 (defaultEntry!6319 Int) (mask!30277 (_ BitVec 32)) (extraKeys!6047 (_ BitVec 32)) (zeroValue!6153 V!37789) (minValue!6153 V!37789) (_size!2992 (_ BitVec 32)) (_keys!11527 array!65496) (_values!6342 array!65498) (_vacant!2992 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5874)

(declare-datatypes ((SeekEntryResult!9780 0))(
  ( (MissingZero!9780 (index!41491 (_ BitVec 32))) (Found!9780 (index!41492 (_ BitVec 32))) (Intermediate!9780 (undefined!10592 Bool) (index!41493 (_ BitVec 32)) (x!92740 (_ BitVec 32))) (Undefined!9780) (MissingVacant!9780 (index!41494 (_ BitVec 32))) )
))
(declare-fun lt!458000 () SeekEntryResult!9780)

(assert (=> b!1039145 (= res!693048 (or (not (= (size!32052 (_keys!11527 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30277 thiss!1427)))) (bvslt (index!41492 lt!458000) #b00000000000000000000000000000000) (bvsge (index!41492 lt!458000) (size!32052 (_keys!11527 thiss!1427)))))))

(declare-fun b!1039146 () Bool)

(declare-fun e!588095 () Bool)

(declare-fun tp_is_empty!24687 () Bool)

(assert (=> b!1039146 (= e!588095 tp_is_empty!24687)))

(declare-fun b!1039147 () Bool)

(declare-fun e!588099 () Bool)

(assert (=> b!1039147 (= e!588099 tp_is_empty!24687)))

(declare-fun mapIsEmpty!38587 () Bool)

(declare-fun mapRes!38587 () Bool)

(assert (=> mapIsEmpty!38587 mapRes!38587))

(declare-fun b!1039148 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039148 (= e!588101 (validKeyInArray!0 (select (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000))))))

(declare-fun res!693047 () Bool)

(declare-fun e!588102 () Bool)

(assert (=> start!90958 (=> (not res!693047) (not e!588102))))

(declare-fun valid!2207 (LongMapFixedSize!5874) Bool)

(assert (=> start!90958 (= res!693047 (valid!2207 thiss!1427))))

(assert (=> start!90958 e!588102))

(declare-fun e!588098 () Bool)

(assert (=> start!90958 e!588098))

(assert (=> start!90958 true))

(declare-fun mapNonEmpty!38587 () Bool)

(declare-fun tp!74075 () Bool)

(assert (=> mapNonEmpty!38587 (= mapRes!38587 (and tp!74075 e!588095))))

(declare-fun mapValue!38587 () ValueCell!11640)

(declare-fun mapRest!38587 () (Array (_ BitVec 32) ValueCell!11640))

(declare-fun mapKey!38587 () (_ BitVec 32))

(assert (=> mapNonEmpty!38587 (= (arr!31522 (_values!6342 thiss!1427)) (store mapRest!38587 mapKey!38587 mapValue!38587))))

(declare-fun b!1039149 () Bool)

(declare-fun res!693045 () Bool)

(assert (=> b!1039149 (=> (not res!693045) (not e!588102))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039149 (= res!693045 (not (= key!909 (bvneg key!909))))))

(declare-fun e!588100 () Bool)

(declare-fun array_inv!24371 (array!65496) Bool)

(declare-fun array_inv!24372 (array!65498) Bool)

(assert (=> b!1039150 (= e!588098 (and tp!74074 tp_is_empty!24687 (array_inv!24371 (_keys!11527 thiss!1427)) (array_inv!24372 (_values!6342 thiss!1427)) e!588100))))

(declare-fun b!1039151 () Bool)

(declare-fun e!588096 () Bool)

(assert (=> b!1039151 (= e!588096 (not e!588101))))

(declare-fun res!693046 () Bool)

(assert (=> b!1039151 (=> res!693046 e!588101)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039151 (= res!693046 (not (validMask!0 (mask!30277 thiss!1427))))))

(declare-fun lt!457999 () array!65496)

(declare-datatypes ((List!21944 0))(
  ( (Nil!21941) (Cons!21940 (h!23144 (_ BitVec 64)) (t!31158 List!21944)) )
))
(declare-fun arrayNoDuplicates!0 (array!65496 (_ BitVec 32) List!21944) Bool)

(assert (=> b!1039151 (arrayNoDuplicates!0 lt!457999 #b00000000000000000000000000000000 Nil!21941)))

(declare-datatypes ((Unit!33991 0))(
  ( (Unit!33992) )
))
(declare-fun lt!457998 () Unit!33991)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21944) Unit!33991)

(assert (=> b!1039151 (= lt!457998 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11527 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41492 lt!458000) #b00000000000000000000000000000000 Nil!21941))))

(declare-fun arrayCountValidKeys!0 (array!65496 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039151 (= (arrayCountValidKeys!0 lt!457999 #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039151 (= lt!457999 (array!65497 (store (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32052 (_keys!11527 thiss!1427))))))

(declare-fun lt!457997 () Unit!33991)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65496 (_ BitVec 32) (_ BitVec 64)) Unit!33991)

(assert (=> b!1039151 (= lt!457997 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11527 thiss!1427) (index!41492 lt!458000) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039152 () Bool)

(assert (=> b!1039152 (= e!588100 (and e!588099 mapRes!38587))))

(declare-fun condMapEmpty!38587 () Bool)

(declare-fun mapDefault!38587 () ValueCell!11640)

(assert (=> b!1039152 (= condMapEmpty!38587 (= (arr!31522 (_values!6342 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11640)) mapDefault!38587)))))

(declare-fun b!1039153 () Bool)

(assert (=> b!1039153 (= e!588102 e!588096)))

(declare-fun res!693049 () Bool)

(assert (=> b!1039153 (=> (not res!693049) (not e!588096))))

(get-info :version)

(assert (=> b!1039153 (= res!693049 ((_ is Found!9780) lt!458000))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65496 (_ BitVec 32)) SeekEntryResult!9780)

(assert (=> b!1039153 (= lt!458000 (seekEntry!0 key!909 (_keys!11527 thiss!1427) (mask!30277 thiss!1427)))))

(assert (= (and start!90958 res!693047) b!1039149))

(assert (= (and b!1039149 res!693045) b!1039153))

(assert (= (and b!1039153 res!693049) b!1039151))

(assert (= (and b!1039151 (not res!693046)) b!1039145))

(assert (= (and b!1039145 (not res!693048)) b!1039148))

(assert (= (and b!1039152 condMapEmpty!38587) mapIsEmpty!38587))

(assert (= (and b!1039152 (not condMapEmpty!38587)) mapNonEmpty!38587))

(assert (= (and mapNonEmpty!38587 ((_ is ValueCellFull!11640) mapValue!38587)) b!1039146))

(assert (= (and b!1039152 ((_ is ValueCellFull!11640) mapDefault!38587)) b!1039147))

(assert (= b!1039150 b!1039152))

(assert (= start!90958 b!1039150))

(declare-fun m!958921 () Bool)

(assert (=> start!90958 m!958921))

(declare-fun m!958923 () Bool)

(assert (=> b!1039151 m!958923))

(declare-fun m!958925 () Bool)

(assert (=> b!1039151 m!958925))

(declare-fun m!958927 () Bool)

(assert (=> b!1039151 m!958927))

(declare-fun m!958929 () Bool)

(assert (=> b!1039151 m!958929))

(declare-fun m!958931 () Bool)

(assert (=> b!1039151 m!958931))

(declare-fun m!958933 () Bool)

(assert (=> b!1039151 m!958933))

(declare-fun m!958935 () Bool)

(assert (=> b!1039151 m!958935))

(declare-fun m!958937 () Bool)

(assert (=> b!1039148 m!958937))

(assert (=> b!1039148 m!958937))

(declare-fun m!958939 () Bool)

(assert (=> b!1039148 m!958939))

(declare-fun m!958941 () Bool)

(assert (=> mapNonEmpty!38587 m!958941))

(declare-fun m!958943 () Bool)

(assert (=> b!1039150 m!958943))

(declare-fun m!958945 () Bool)

(assert (=> b!1039150 m!958945))

(declare-fun m!958947 () Bool)

(assert (=> b!1039153 m!958947))

(check-sat (not start!90958) (not b!1039150) (not b!1039151) (not b!1039153) (not b_next!20967) (not mapNonEmpty!38587) (not b!1039148) tp_is_empty!24687 b_and!33499)
(check-sat b_and!33499 (not b_next!20967))
(get-model)

(declare-fun b!1039193 () Bool)

(declare-fun c!105315 () Bool)

(declare-fun lt!458023 () (_ BitVec 64))

(assert (=> b!1039193 (= c!105315 (= lt!458023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588133 () SeekEntryResult!9780)

(declare-fun e!588134 () SeekEntryResult!9780)

(assert (=> b!1039193 (= e!588133 e!588134)))

(declare-fun d!125457 () Bool)

(declare-fun lt!458022 () SeekEntryResult!9780)

(assert (=> d!125457 (and (or ((_ is MissingVacant!9780) lt!458022) (not ((_ is Found!9780) lt!458022)) (and (bvsge (index!41492 lt!458022) #b00000000000000000000000000000000) (bvslt (index!41492 lt!458022) (size!32052 (_keys!11527 thiss!1427))))) (not ((_ is MissingVacant!9780) lt!458022)) (or (not ((_ is Found!9780) lt!458022)) (= (select (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458022)) key!909)))))

(declare-fun e!588135 () SeekEntryResult!9780)

(assert (=> d!125457 (= lt!458022 e!588135)))

(declare-fun c!105317 () Bool)

(declare-fun lt!458024 () SeekEntryResult!9780)

(assert (=> d!125457 (= c!105317 (and ((_ is Intermediate!9780) lt!458024) (undefined!10592 lt!458024)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65496 (_ BitVec 32)) SeekEntryResult!9780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125457 (= lt!458024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30277 thiss!1427)) key!909 (_keys!11527 thiss!1427) (mask!30277 thiss!1427)))))

(assert (=> d!125457 (validMask!0 (mask!30277 thiss!1427))))

(assert (=> d!125457 (= (seekEntry!0 key!909 (_keys!11527 thiss!1427) (mask!30277 thiss!1427)) lt!458022)))

(declare-fun b!1039194 () Bool)

(assert (=> b!1039194 (= e!588134 (MissingZero!9780 (index!41493 lt!458024)))))

(declare-fun b!1039195 () Bool)

(assert (=> b!1039195 (= e!588135 Undefined!9780)))

(declare-fun b!1039196 () Bool)

(assert (=> b!1039196 (= e!588133 (Found!9780 (index!41493 lt!458024)))))

(declare-fun b!1039197 () Bool)

(declare-fun lt!458021 () SeekEntryResult!9780)

(assert (=> b!1039197 (= e!588134 (ite ((_ is MissingVacant!9780) lt!458021) (MissingZero!9780 (index!41494 lt!458021)) lt!458021))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65496 (_ BitVec 32)) SeekEntryResult!9780)

(assert (=> b!1039197 (= lt!458021 (seekKeyOrZeroReturnVacant!0 (x!92740 lt!458024) (index!41493 lt!458024) (index!41493 lt!458024) key!909 (_keys!11527 thiss!1427) (mask!30277 thiss!1427)))))

(declare-fun b!1039198 () Bool)

(assert (=> b!1039198 (= e!588135 e!588133)))

(assert (=> b!1039198 (= lt!458023 (select (arr!31521 (_keys!11527 thiss!1427)) (index!41493 lt!458024)))))

(declare-fun c!105316 () Bool)

(assert (=> b!1039198 (= c!105316 (= lt!458023 key!909))))

(assert (= (and d!125457 c!105317) b!1039195))

(assert (= (and d!125457 (not c!105317)) b!1039198))

(assert (= (and b!1039198 c!105316) b!1039196))

(assert (= (and b!1039198 (not c!105316)) b!1039193))

(assert (= (and b!1039193 c!105315) b!1039194))

(assert (= (and b!1039193 (not c!105315)) b!1039197))

(declare-fun m!958977 () Bool)

(assert (=> d!125457 m!958977))

(declare-fun m!958979 () Bool)

(assert (=> d!125457 m!958979))

(assert (=> d!125457 m!958979))

(declare-fun m!958981 () Bool)

(assert (=> d!125457 m!958981))

(assert (=> d!125457 m!958925))

(declare-fun m!958983 () Bool)

(assert (=> b!1039197 m!958983))

(declare-fun m!958985 () Bool)

(assert (=> b!1039198 m!958985))

(assert (=> b!1039153 d!125457))

(declare-fun d!125459 () Bool)

(assert (=> d!125459 (= (validKeyInArray!0 (select (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000))) (and (not (= (select (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039148 d!125459))

(declare-fun d!125461 () Bool)

(assert (=> d!125461 (= (array_inv!24371 (_keys!11527 thiss!1427)) (bvsge (size!32052 (_keys!11527 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039150 d!125461))

(declare-fun d!125463 () Bool)

(assert (=> d!125463 (= (array_inv!24372 (_values!6342 thiss!1427)) (bvsge (size!32053 (_values!6342 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039150 d!125463))

(declare-fun d!125465 () Bool)

(declare-fun res!693071 () Bool)

(declare-fun e!588138 () Bool)

(assert (=> d!125465 (=> (not res!693071) (not e!588138))))

(declare-fun simpleValid!426 (LongMapFixedSize!5874) Bool)

(assert (=> d!125465 (= res!693071 (simpleValid!426 thiss!1427))))

(assert (=> d!125465 (= (valid!2207 thiss!1427) e!588138)))

(declare-fun b!1039205 () Bool)

(declare-fun res!693072 () Bool)

(assert (=> b!1039205 (=> (not res!693072) (not e!588138))))

(assert (=> b!1039205 (= res!693072 (= (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) (_size!2992 thiss!1427)))))

(declare-fun b!1039206 () Bool)

(declare-fun res!693073 () Bool)

(assert (=> b!1039206 (=> (not res!693073) (not e!588138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65496 (_ BitVec 32)) Bool)

(assert (=> b!1039206 (= res!693073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11527 thiss!1427) (mask!30277 thiss!1427)))))

(declare-fun b!1039207 () Bool)

(assert (=> b!1039207 (= e!588138 (arrayNoDuplicates!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 Nil!21941))))

(assert (= (and d!125465 res!693071) b!1039205))

(assert (= (and b!1039205 res!693072) b!1039206))

(assert (= (and b!1039206 res!693073) b!1039207))

(declare-fun m!958987 () Bool)

(assert (=> d!125465 m!958987))

(assert (=> b!1039205 m!958933))

(declare-fun m!958989 () Bool)

(assert (=> b!1039206 m!958989))

(declare-fun m!958991 () Bool)

(assert (=> b!1039207 m!958991))

(assert (=> start!90958 d!125465))

(declare-fun d!125467 () Bool)

(declare-fun lt!458027 () (_ BitVec 32))

(assert (=> d!125467 (and (bvsge lt!458027 #b00000000000000000000000000000000) (bvsle lt!458027 (bvsub (size!32052 lt!457999) #b00000000000000000000000000000000)))))

(declare-fun e!588143 () (_ BitVec 32))

(assert (=> d!125467 (= lt!458027 e!588143)))

(declare-fun c!105322 () Bool)

(assert (=> d!125467 (= c!105322 (bvsge #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))))))

(assert (=> d!125467 (and (bvsle #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32052 (_keys!11527 thiss!1427)) (size!32052 lt!457999)))))

(assert (=> d!125467 (= (arrayCountValidKeys!0 lt!457999 #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) lt!458027)))

(declare-fun b!1039216 () Bool)

(declare-fun e!588144 () (_ BitVec 32))

(declare-fun call!43981 () (_ BitVec 32))

(assert (=> b!1039216 (= e!588144 call!43981)))

(declare-fun bm!43978 () Bool)

(assert (=> bm!43978 (= call!43981 (arrayCountValidKeys!0 lt!457999 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32052 (_keys!11527 thiss!1427))))))

(declare-fun b!1039217 () Bool)

(assert (=> b!1039217 (= e!588143 #b00000000000000000000000000000000)))

(declare-fun b!1039218 () Bool)

(assert (=> b!1039218 (= e!588144 (bvadd #b00000000000000000000000000000001 call!43981))))

(declare-fun b!1039219 () Bool)

(assert (=> b!1039219 (= e!588143 e!588144)))

(declare-fun c!105323 () Bool)

(assert (=> b!1039219 (= c!105323 (validKeyInArray!0 (select (arr!31521 lt!457999) #b00000000000000000000000000000000)))))

(assert (= (and d!125467 c!105322) b!1039217))

(assert (= (and d!125467 (not c!105322)) b!1039219))

(assert (= (and b!1039219 c!105323) b!1039218))

(assert (= (and b!1039219 (not c!105323)) b!1039216))

(assert (= (or b!1039218 b!1039216) bm!43978))

(declare-fun m!958993 () Bool)

(assert (=> bm!43978 m!958993))

(declare-fun m!958995 () Bool)

(assert (=> b!1039219 m!958995))

(assert (=> b!1039219 m!958995))

(declare-fun m!958997 () Bool)

(assert (=> b!1039219 m!958997))

(assert (=> b!1039151 d!125467))

(declare-fun b!1039230 () Bool)

(declare-fun e!588156 () Bool)

(declare-fun call!43984 () Bool)

(assert (=> b!1039230 (= e!588156 call!43984)))

(declare-fun bm!43981 () Bool)

(declare-fun c!105326 () Bool)

(assert (=> bm!43981 (= call!43984 (arrayNoDuplicates!0 lt!457999 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105326 (Cons!21940 (select (arr!31521 lt!457999) #b00000000000000000000000000000000) Nil!21941) Nil!21941)))))

(declare-fun b!1039231 () Bool)

(declare-fun e!588155 () Bool)

(declare-fun contains!6042 (List!21944 (_ BitVec 64)) Bool)

(assert (=> b!1039231 (= e!588155 (contains!6042 Nil!21941 (select (arr!31521 lt!457999) #b00000000000000000000000000000000)))))

(declare-fun b!1039232 () Bool)

(assert (=> b!1039232 (= e!588156 call!43984)))

(declare-fun d!125469 () Bool)

(declare-fun res!693082 () Bool)

(declare-fun e!588153 () Bool)

(assert (=> d!125469 (=> res!693082 e!588153)))

(assert (=> d!125469 (= res!693082 (bvsge #b00000000000000000000000000000000 (size!32052 lt!457999)))))

(assert (=> d!125469 (= (arrayNoDuplicates!0 lt!457999 #b00000000000000000000000000000000 Nil!21941) e!588153)))

(declare-fun b!1039233 () Bool)

(declare-fun e!588154 () Bool)

(assert (=> b!1039233 (= e!588153 e!588154)))

(declare-fun res!693081 () Bool)

(assert (=> b!1039233 (=> (not res!693081) (not e!588154))))

(assert (=> b!1039233 (= res!693081 (not e!588155))))

(declare-fun res!693080 () Bool)

(assert (=> b!1039233 (=> (not res!693080) (not e!588155))))

(assert (=> b!1039233 (= res!693080 (validKeyInArray!0 (select (arr!31521 lt!457999) #b00000000000000000000000000000000)))))

(declare-fun b!1039234 () Bool)

(assert (=> b!1039234 (= e!588154 e!588156)))

(assert (=> b!1039234 (= c!105326 (validKeyInArray!0 (select (arr!31521 lt!457999) #b00000000000000000000000000000000)))))

(assert (= (and d!125469 (not res!693082)) b!1039233))

(assert (= (and b!1039233 res!693080) b!1039231))

(assert (= (and b!1039233 res!693081) b!1039234))

(assert (= (and b!1039234 c!105326) b!1039230))

(assert (= (and b!1039234 (not c!105326)) b!1039232))

(assert (= (or b!1039230 b!1039232) bm!43981))

(assert (=> bm!43981 m!958995))

(declare-fun m!958999 () Bool)

(assert (=> bm!43981 m!958999))

(assert (=> b!1039231 m!958995))

(assert (=> b!1039231 m!958995))

(declare-fun m!959001 () Bool)

(assert (=> b!1039231 m!959001))

(assert (=> b!1039233 m!958995))

(assert (=> b!1039233 m!958995))

(assert (=> b!1039233 m!958997))

(assert (=> b!1039234 m!958995))

(assert (=> b!1039234 m!958995))

(assert (=> b!1039234 m!958997))

(assert (=> b!1039151 d!125469))

(declare-fun d!125471 () Bool)

(declare-fun e!588159 () Bool)

(assert (=> d!125471 e!588159))

(declare-fun res!693085 () Bool)

(assert (=> d!125471 (=> (not res!693085) (not e!588159))))

(assert (=> d!125471 (= res!693085 (and (bvsge (index!41492 lt!458000) #b00000000000000000000000000000000) (bvslt (index!41492 lt!458000) (size!32052 (_keys!11527 thiss!1427)))))))

(declare-fun lt!458030 () Unit!33991)

(declare-fun choose!53 (array!65496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21944) Unit!33991)

(assert (=> d!125471 (= lt!458030 (choose!53 (_keys!11527 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41492 lt!458000) #b00000000000000000000000000000000 Nil!21941))))

(assert (=> d!125471 (bvslt (size!32052 (_keys!11527 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125471 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11527 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41492 lt!458000) #b00000000000000000000000000000000 Nil!21941) lt!458030)))

(declare-fun b!1039237 () Bool)

(assert (=> b!1039237 (= e!588159 (arrayNoDuplicates!0 (array!65497 (store (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32052 (_keys!11527 thiss!1427))) #b00000000000000000000000000000000 Nil!21941))))

(assert (= (and d!125471 res!693085) b!1039237))

(declare-fun m!959003 () Bool)

(assert (=> d!125471 m!959003))

(assert (=> b!1039237 m!958929))

(declare-fun m!959005 () Bool)

(assert (=> b!1039237 m!959005))

(assert (=> b!1039151 d!125471))

(declare-fun d!125473 () Bool)

(assert (=> d!125473 (= (validMask!0 (mask!30277 thiss!1427)) (and (or (= (mask!30277 thiss!1427) #b00000000000000000000000000000111) (= (mask!30277 thiss!1427) #b00000000000000000000000000001111) (= (mask!30277 thiss!1427) #b00000000000000000000000000011111) (= (mask!30277 thiss!1427) #b00000000000000000000000000111111) (= (mask!30277 thiss!1427) #b00000000000000000000000001111111) (= (mask!30277 thiss!1427) #b00000000000000000000000011111111) (= (mask!30277 thiss!1427) #b00000000000000000000000111111111) (= (mask!30277 thiss!1427) #b00000000000000000000001111111111) (= (mask!30277 thiss!1427) #b00000000000000000000011111111111) (= (mask!30277 thiss!1427) #b00000000000000000000111111111111) (= (mask!30277 thiss!1427) #b00000000000000000001111111111111) (= (mask!30277 thiss!1427) #b00000000000000000011111111111111) (= (mask!30277 thiss!1427) #b00000000000000000111111111111111) (= (mask!30277 thiss!1427) #b00000000000000001111111111111111) (= (mask!30277 thiss!1427) #b00000000000000011111111111111111) (= (mask!30277 thiss!1427) #b00000000000000111111111111111111) (= (mask!30277 thiss!1427) #b00000000000001111111111111111111) (= (mask!30277 thiss!1427) #b00000000000011111111111111111111) (= (mask!30277 thiss!1427) #b00000000000111111111111111111111) (= (mask!30277 thiss!1427) #b00000000001111111111111111111111) (= (mask!30277 thiss!1427) #b00000000011111111111111111111111) (= (mask!30277 thiss!1427) #b00000000111111111111111111111111) (= (mask!30277 thiss!1427) #b00000001111111111111111111111111) (= (mask!30277 thiss!1427) #b00000011111111111111111111111111) (= (mask!30277 thiss!1427) #b00000111111111111111111111111111) (= (mask!30277 thiss!1427) #b00001111111111111111111111111111) (= (mask!30277 thiss!1427) #b00011111111111111111111111111111) (= (mask!30277 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30277 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039151 d!125473))

(declare-fun d!125475 () Bool)

(declare-fun e!588164 () Bool)

(assert (=> d!125475 e!588164))

(declare-fun res!693095 () Bool)

(assert (=> d!125475 (=> (not res!693095) (not e!588164))))

(assert (=> d!125475 (= res!693095 (and (bvsge (index!41492 lt!458000) #b00000000000000000000000000000000) (bvslt (index!41492 lt!458000) (size!32052 (_keys!11527 thiss!1427)))))))

(declare-fun lt!458033 () Unit!33991)

(declare-fun choose!82 (array!65496 (_ BitVec 32) (_ BitVec 64)) Unit!33991)

(assert (=> d!125475 (= lt!458033 (choose!82 (_keys!11527 thiss!1427) (index!41492 lt!458000) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588165 () Bool)

(assert (=> d!125475 e!588165))

(declare-fun res!693094 () Bool)

(assert (=> d!125475 (=> (not res!693094) (not e!588165))))

(assert (=> d!125475 (= res!693094 (and (bvsge (index!41492 lt!458000) #b00000000000000000000000000000000) (bvslt (index!41492 lt!458000) (size!32052 (_keys!11527 thiss!1427)))))))

(assert (=> d!125475 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11527 thiss!1427) (index!41492 lt!458000) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458033)))

(declare-fun b!1039249 () Bool)

(assert (=> b!1039249 (= e!588164 (= (arrayCountValidKeys!0 (array!65497 (store (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32052 (_keys!11527 thiss!1427))) #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039247 () Bool)

(declare-fun res!693096 () Bool)

(assert (=> b!1039247 (=> (not res!693096) (not e!588165))))

(assert (=> b!1039247 (= res!693096 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039248 () Bool)

(assert (=> b!1039248 (= e!588165 (bvslt (size!32052 (_keys!11527 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039246 () Bool)

(declare-fun res!693097 () Bool)

(assert (=> b!1039246 (=> (not res!693097) (not e!588165))))

(assert (=> b!1039246 (= res!693097 (validKeyInArray!0 (select (arr!31521 (_keys!11527 thiss!1427)) (index!41492 lt!458000))))))

(assert (= (and d!125475 res!693094) b!1039246))

(assert (= (and b!1039246 res!693097) b!1039247))

(assert (= (and b!1039247 res!693096) b!1039248))

(assert (= (and d!125475 res!693095) b!1039249))

(declare-fun m!959007 () Bool)

(assert (=> d!125475 m!959007))

(assert (=> b!1039249 m!958929))

(declare-fun m!959009 () Bool)

(assert (=> b!1039249 m!959009))

(assert (=> b!1039249 m!958933))

(declare-fun m!959011 () Bool)

(assert (=> b!1039247 m!959011))

(assert (=> b!1039246 m!958937))

(assert (=> b!1039246 m!958937))

(assert (=> b!1039246 m!958939))

(assert (=> b!1039151 d!125475))

(declare-fun d!125477 () Bool)

(declare-fun lt!458034 () (_ BitVec 32))

(assert (=> d!125477 (and (bvsge lt!458034 #b00000000000000000000000000000000) (bvsle lt!458034 (bvsub (size!32052 (_keys!11527 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588166 () (_ BitVec 32))

(assert (=> d!125477 (= lt!458034 e!588166)))

(declare-fun c!105327 () Bool)

(assert (=> d!125477 (= c!105327 (bvsge #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))))))

(assert (=> d!125477 (and (bvsle #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32052 (_keys!11527 thiss!1427)) (size!32052 (_keys!11527 thiss!1427))))))

(assert (=> d!125477 (= (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32052 (_keys!11527 thiss!1427))) lt!458034)))

(declare-fun b!1039250 () Bool)

(declare-fun e!588167 () (_ BitVec 32))

(declare-fun call!43985 () (_ BitVec 32))

(assert (=> b!1039250 (= e!588167 call!43985)))

(declare-fun bm!43982 () Bool)

(assert (=> bm!43982 (= call!43985 (arrayCountValidKeys!0 (_keys!11527 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32052 (_keys!11527 thiss!1427))))))

(declare-fun b!1039251 () Bool)

(assert (=> b!1039251 (= e!588166 #b00000000000000000000000000000000)))

(declare-fun b!1039252 () Bool)

(assert (=> b!1039252 (= e!588167 (bvadd #b00000000000000000000000000000001 call!43985))))

(declare-fun b!1039253 () Bool)

(assert (=> b!1039253 (= e!588166 e!588167)))

(declare-fun c!105328 () Bool)

(assert (=> b!1039253 (= c!105328 (validKeyInArray!0 (select (arr!31521 (_keys!11527 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125477 c!105327) b!1039251))

(assert (= (and d!125477 (not c!105327)) b!1039253))

(assert (= (and b!1039253 c!105328) b!1039252))

(assert (= (and b!1039253 (not c!105328)) b!1039250))

(assert (= (or b!1039252 b!1039250) bm!43982))

(declare-fun m!959013 () Bool)

(assert (=> bm!43982 m!959013))

(declare-fun m!959015 () Bool)

(assert (=> b!1039253 m!959015))

(assert (=> b!1039253 m!959015))

(declare-fun m!959017 () Bool)

(assert (=> b!1039253 m!959017))

(assert (=> b!1039151 d!125477))

(declare-fun condMapEmpty!38593 () Bool)

(declare-fun mapDefault!38593 () ValueCell!11640)

(assert (=> mapNonEmpty!38587 (= condMapEmpty!38593 (= mapRest!38587 ((as const (Array (_ BitVec 32) ValueCell!11640)) mapDefault!38593)))))

(declare-fun e!588173 () Bool)

(declare-fun mapRes!38593 () Bool)

(assert (=> mapNonEmpty!38587 (= tp!74075 (and e!588173 mapRes!38593))))

(declare-fun b!1039260 () Bool)

(declare-fun e!588172 () Bool)

(assert (=> b!1039260 (= e!588172 tp_is_empty!24687)))

(declare-fun b!1039261 () Bool)

(assert (=> b!1039261 (= e!588173 tp_is_empty!24687)))

(declare-fun mapNonEmpty!38593 () Bool)

(declare-fun tp!74084 () Bool)

(assert (=> mapNonEmpty!38593 (= mapRes!38593 (and tp!74084 e!588172))))

(declare-fun mapValue!38593 () ValueCell!11640)

(declare-fun mapRest!38593 () (Array (_ BitVec 32) ValueCell!11640))

(declare-fun mapKey!38593 () (_ BitVec 32))

(assert (=> mapNonEmpty!38593 (= mapRest!38587 (store mapRest!38593 mapKey!38593 mapValue!38593))))

(declare-fun mapIsEmpty!38593 () Bool)

(assert (=> mapIsEmpty!38593 mapRes!38593))

(assert (= (and mapNonEmpty!38587 condMapEmpty!38593) mapIsEmpty!38593))

(assert (= (and mapNonEmpty!38587 (not condMapEmpty!38593)) mapNonEmpty!38593))

(assert (= (and mapNonEmpty!38593 ((_ is ValueCellFull!11640) mapValue!38593)) b!1039260))

(assert (= (and mapNonEmpty!38587 ((_ is ValueCellFull!11640) mapDefault!38593)) b!1039261))

(declare-fun m!959019 () Bool)

(assert (=> mapNonEmpty!38593 m!959019))

(check-sat (not bm!43982) (not b!1039246) (not b!1039219) (not d!125475) (not bm!43978) (not b!1039206) (not b_next!20967) (not b!1039253) tp_is_empty!24687 (not b!1039249) (not b!1039231) b_and!33499 (not d!125457) (not b!1039237) (not bm!43981) (not b!1039233) (not d!125465) (not b!1039234) (not b!1039197) (not mapNonEmpty!38593) (not b!1039207) (not b!1039247) (not d!125471) (not b!1039205))
(check-sat b_and!33499 (not b_next!20967))
