; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90984 () Bool)

(assert start!90984)

(declare-fun b!1039313 () Bool)

(declare-fun b_free!20973 () Bool)

(declare-fun b_next!20973 () Bool)

(assert (=> b!1039313 (= b_free!20973 (not b_next!20973))))

(declare-fun tp!74096 () Bool)

(declare-fun b_and!33505 () Bool)

(assert (=> b!1039313 (= tp!74096 b_and!33505)))

(declare-fun res!693132 () Bool)

(declare-fun e!588220 () Bool)

(assert (=> start!90984 (=> (not res!693132) (not e!588220))))

(declare-datatypes ((V!37797 0))(
  ( (V!37798 (val!12397 Int)) )
))
(declare-datatypes ((ValueCell!11643 0))(
  ( (ValueCellFull!11643 (v!14984 V!37797)) (EmptyCell!11643) )
))
(declare-datatypes ((array!65510 0))(
  ( (array!65511 (arr!31527 (Array (_ BitVec 32) (_ BitVec 64))) (size!32058 (_ BitVec 32))) )
))
(declare-datatypes ((array!65512 0))(
  ( (array!65513 (arr!31528 (Array (_ BitVec 32) ValueCell!11643)) (size!32059 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5880 0))(
  ( (LongMapFixedSize!5881 (defaultEntry!6322 Int) (mask!30284 (_ BitVec 32)) (extraKeys!6050 (_ BitVec 32)) (zeroValue!6156 V!37797) (minValue!6156 V!37797) (_size!2995 (_ BitVec 32)) (_keys!11531 array!65510) (_values!6345 array!65512) (_vacant!2995 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5880)

(declare-fun valid!2209 (LongMapFixedSize!5880) Bool)

(assert (=> start!90984 (= res!693132 (valid!2209 thiss!1427))))

(assert (=> start!90984 e!588220))

(declare-fun e!588214 () Bool)

(assert (=> start!90984 e!588214))

(assert (=> start!90984 true))

(declare-fun mapIsEmpty!38599 () Bool)

(declare-fun mapRes!38599 () Bool)

(assert (=> mapIsEmpty!38599 mapRes!38599))

(declare-fun b!1039312 () Bool)

(declare-fun e!588217 () Bool)

(declare-datatypes ((List!21946 0))(
  ( (Nil!21943) (Cons!21942 (h!23146 (_ BitVec 64)) (t!31160 List!21946)) )
))
(declare-fun arrayNoDuplicates!0 (array!65510 (_ BitVec 32) List!21946) Bool)

(assert (=> b!1039312 (= e!588217 (arrayNoDuplicates!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 Nil!21943))))

(declare-fun tp_is_empty!24693 () Bool)

(declare-fun e!588219 () Bool)

(declare-fun array_inv!24373 (array!65510) Bool)

(declare-fun array_inv!24374 (array!65512) Bool)

(assert (=> b!1039313 (= e!588214 (and tp!74096 tp_is_empty!24693 (array_inv!24373 (_keys!11531 thiss!1427)) (array_inv!24374 (_values!6345 thiss!1427)) e!588219))))

(declare-fun mapNonEmpty!38599 () Bool)

(declare-fun tp!74095 () Bool)

(declare-fun e!588221 () Bool)

(assert (=> mapNonEmpty!38599 (= mapRes!38599 (and tp!74095 e!588221))))

(declare-fun mapKey!38599 () (_ BitVec 32))

(declare-fun mapRest!38599 () (Array (_ BitVec 32) ValueCell!11643))

(declare-fun mapValue!38599 () ValueCell!11643)

(assert (=> mapNonEmpty!38599 (= (arr!31528 (_values!6345 thiss!1427)) (store mapRest!38599 mapKey!38599 mapValue!38599))))

(declare-fun b!1039314 () Bool)

(declare-fun e!588216 () Bool)

(assert (=> b!1039314 (= e!588220 e!588216)))

(declare-fun res!693131 () Bool)

(assert (=> b!1039314 (=> (not res!693131) (not e!588216))))

(declare-datatypes ((SeekEntryResult!9781 0))(
  ( (MissingZero!9781 (index!41495 (_ BitVec 32))) (Found!9781 (index!41496 (_ BitVec 32))) (Intermediate!9781 (undefined!10593 Bool) (index!41497 (_ BitVec 32)) (x!92757 (_ BitVec 32))) (Undefined!9781) (MissingVacant!9781 (index!41498 (_ BitVec 32))) )
))
(declare-fun lt!458055 () SeekEntryResult!9781)

(get-info :version)

(assert (=> b!1039314 (= res!693131 ((_ is Found!9781) lt!458055))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65510 (_ BitVec 32)) SeekEntryResult!9781)

(assert (=> b!1039314 (= lt!458055 (seekEntry!0 key!909 (_keys!11531 thiss!1427) (mask!30284 thiss!1427)))))

(declare-fun b!1039315 () Bool)

(declare-fun res!693130 () Bool)

(assert (=> b!1039315 (=> (not res!693130) (not e!588220))))

(assert (=> b!1039315 (= res!693130 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039316 () Bool)

(declare-fun res!693128 () Bool)

(assert (=> b!1039316 (=> res!693128 e!588217)))

(assert (=> b!1039316 (= res!693128 (or (not (= (size!32058 (_keys!11531 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30284 thiss!1427)))) (bvslt (index!41496 lt!458055) #b00000000000000000000000000000000) (bvsge (index!41496 lt!458055) (size!32058 (_keys!11531 thiss!1427)))))))

(declare-fun b!1039317 () Bool)

(assert (=> b!1039317 (= e!588216 (not e!588217))))

(declare-fun res!693133 () Bool)

(assert (=> b!1039317 (=> res!693133 e!588217)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039317 (= res!693133 (not (validMask!0 (mask!30284 thiss!1427))))))

(declare-fun lt!458056 () array!65510)

(assert (=> b!1039317 (arrayNoDuplicates!0 lt!458056 #b00000000000000000000000000000000 Nil!21943)))

(declare-datatypes ((Unit!33993 0))(
  ( (Unit!33994) )
))
(declare-fun lt!458057 () Unit!33993)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65510 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21946) Unit!33993)

(assert (=> b!1039317 (= lt!458057 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11531 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41496 lt!458055) #b00000000000000000000000000000000 Nil!21943))))

(declare-fun arrayCountValidKeys!0 (array!65510 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039317 (= (arrayCountValidKeys!0 lt!458056 #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039317 (= lt!458056 (array!65511 (store (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32058 (_keys!11531 thiss!1427))))))

(declare-fun lt!458058 () Unit!33993)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65510 (_ BitVec 32) (_ BitVec 64)) Unit!33993)

(assert (=> b!1039317 (= lt!458058 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11531 thiss!1427) (index!41496 lt!458055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039318 () Bool)

(assert (=> b!1039318 (= e!588221 tp_is_empty!24693)))

(declare-fun b!1039319 () Bool)

(declare-fun res!693129 () Bool)

(assert (=> b!1039319 (=> res!693129 e!588217)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039319 (= res!693129 (not (validKeyInArray!0 (select (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055)))))))

(declare-fun b!1039320 () Bool)

(declare-fun e!588215 () Bool)

(assert (=> b!1039320 (= e!588215 tp_is_empty!24693)))

(declare-fun b!1039321 () Bool)

(assert (=> b!1039321 (= e!588219 (and e!588215 mapRes!38599))))

(declare-fun condMapEmpty!38599 () Bool)

(declare-fun mapDefault!38599 () ValueCell!11643)

(assert (=> b!1039321 (= condMapEmpty!38599 (= (arr!31528 (_values!6345 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11643)) mapDefault!38599)))))

(assert (= (and start!90984 res!693132) b!1039315))

(assert (= (and b!1039315 res!693130) b!1039314))

(assert (= (and b!1039314 res!693131) b!1039317))

(assert (= (and b!1039317 (not res!693133)) b!1039316))

(assert (= (and b!1039316 (not res!693128)) b!1039319))

(assert (= (and b!1039319 (not res!693129)) b!1039312))

(assert (= (and b!1039321 condMapEmpty!38599) mapIsEmpty!38599))

(assert (= (and b!1039321 (not condMapEmpty!38599)) mapNonEmpty!38599))

(assert (= (and mapNonEmpty!38599 ((_ is ValueCellFull!11643) mapValue!38599)) b!1039318))

(assert (= (and b!1039321 ((_ is ValueCellFull!11643) mapDefault!38599)) b!1039320))

(assert (= b!1039313 b!1039321))

(assert (= start!90984 b!1039313))

(declare-fun m!959051 () Bool)

(assert (=> b!1039312 m!959051))

(declare-fun m!959053 () Bool)

(assert (=> mapNonEmpty!38599 m!959053))

(declare-fun m!959055 () Bool)

(assert (=> b!1039313 m!959055))

(declare-fun m!959057 () Bool)

(assert (=> b!1039313 m!959057))

(declare-fun m!959059 () Bool)

(assert (=> b!1039317 m!959059))

(declare-fun m!959061 () Bool)

(assert (=> b!1039317 m!959061))

(declare-fun m!959063 () Bool)

(assert (=> b!1039317 m!959063))

(declare-fun m!959065 () Bool)

(assert (=> b!1039317 m!959065))

(declare-fun m!959067 () Bool)

(assert (=> b!1039317 m!959067))

(declare-fun m!959069 () Bool)

(assert (=> b!1039317 m!959069))

(declare-fun m!959071 () Bool)

(assert (=> b!1039317 m!959071))

(declare-fun m!959073 () Bool)

(assert (=> start!90984 m!959073))

(declare-fun m!959075 () Bool)

(assert (=> b!1039319 m!959075))

(assert (=> b!1039319 m!959075))

(declare-fun m!959077 () Bool)

(assert (=> b!1039319 m!959077))

(declare-fun m!959079 () Bool)

(assert (=> b!1039314 m!959079))

(check-sat (not start!90984) (not b!1039313) b_and!33505 tp_is_empty!24693 (not b!1039314) (not b_next!20973) (not mapNonEmpty!38599) (not b!1039317) (not b!1039319) (not b!1039312))
(check-sat b_and!33505 (not b_next!20973))
(get-model)

(declare-fun d!125481 () Bool)

(declare-fun res!693158 () Bool)

(declare-fun e!588257 () Bool)

(assert (=> d!125481 (=> res!693158 e!588257)))

(assert (=> d!125481 (= res!693158 (bvsge #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))))))

(assert (=> d!125481 (= (arrayNoDuplicates!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 Nil!21943) e!588257)))

(declare-fun b!1039362 () Bool)

(declare-fun e!588255 () Bool)

(declare-fun call!43988 () Bool)

(assert (=> b!1039362 (= e!588255 call!43988)))

(declare-fun b!1039363 () Bool)

(declare-fun e!588256 () Bool)

(declare-fun contains!6043 (List!21946 (_ BitVec 64)) Bool)

(assert (=> b!1039363 (= e!588256 (contains!6043 Nil!21943 (select (arr!31527 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039364 () Bool)

(declare-fun e!588254 () Bool)

(assert (=> b!1039364 (= e!588257 e!588254)))

(declare-fun res!693159 () Bool)

(assert (=> b!1039364 (=> (not res!693159) (not e!588254))))

(assert (=> b!1039364 (= res!693159 (not e!588256))))

(declare-fun res!693160 () Bool)

(assert (=> b!1039364 (=> (not res!693160) (not e!588256))))

(assert (=> b!1039364 (= res!693160 (validKeyInArray!0 (select (arr!31527 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039365 () Bool)

(assert (=> b!1039365 (= e!588255 call!43988)))

(declare-fun b!1039366 () Bool)

(assert (=> b!1039366 (= e!588254 e!588255)))

(declare-fun c!105331 () Bool)

(assert (=> b!1039366 (= c!105331 (validKeyInArray!0 (select (arr!31527 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43985 () Bool)

(assert (=> bm!43985 (= call!43988 (arrayNoDuplicates!0 (_keys!11531 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105331 (Cons!21942 (select (arr!31527 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000) Nil!21943) Nil!21943)))))

(assert (= (and d!125481 (not res!693158)) b!1039364))

(assert (= (and b!1039364 res!693160) b!1039363))

(assert (= (and b!1039364 res!693159) b!1039366))

(assert (= (and b!1039366 c!105331) b!1039362))

(assert (= (and b!1039366 (not c!105331)) b!1039365))

(assert (= (or b!1039362 b!1039365) bm!43985))

(declare-fun m!959111 () Bool)

(assert (=> b!1039363 m!959111))

(assert (=> b!1039363 m!959111))

(declare-fun m!959113 () Bool)

(assert (=> b!1039363 m!959113))

(assert (=> b!1039364 m!959111))

(assert (=> b!1039364 m!959111))

(declare-fun m!959115 () Bool)

(assert (=> b!1039364 m!959115))

(assert (=> b!1039366 m!959111))

(assert (=> b!1039366 m!959111))

(assert (=> b!1039366 m!959115))

(assert (=> bm!43985 m!959111))

(declare-fun m!959117 () Bool)

(assert (=> bm!43985 m!959117))

(assert (=> b!1039312 d!125481))

(declare-fun d!125483 () Bool)

(declare-fun e!588260 () Bool)

(assert (=> d!125483 e!588260))

(declare-fun res!693163 () Bool)

(assert (=> d!125483 (=> (not res!693163) (not e!588260))))

(assert (=> d!125483 (= res!693163 (and (bvsge (index!41496 lt!458055) #b00000000000000000000000000000000) (bvslt (index!41496 lt!458055) (size!32058 (_keys!11531 thiss!1427)))))))

(declare-fun lt!458073 () Unit!33993)

(declare-fun choose!53 (array!65510 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21946) Unit!33993)

(assert (=> d!125483 (= lt!458073 (choose!53 (_keys!11531 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41496 lt!458055) #b00000000000000000000000000000000 Nil!21943))))

(assert (=> d!125483 (bvslt (size!32058 (_keys!11531 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125483 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11531 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41496 lt!458055) #b00000000000000000000000000000000 Nil!21943) lt!458073)))

(declare-fun b!1039369 () Bool)

(assert (=> b!1039369 (= e!588260 (arrayNoDuplicates!0 (array!65511 (store (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32058 (_keys!11531 thiss!1427))) #b00000000000000000000000000000000 Nil!21943))))

(assert (= (and d!125483 res!693163) b!1039369))

(declare-fun m!959119 () Bool)

(assert (=> d!125483 m!959119))

(assert (=> b!1039369 m!959059))

(declare-fun m!959121 () Bool)

(assert (=> b!1039369 m!959121))

(assert (=> b!1039317 d!125483))

(declare-fun b!1039381 () Bool)

(declare-fun e!588265 () Bool)

(assert (=> b!1039381 (= e!588265 (= (arrayCountValidKeys!0 (array!65511 (store (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32058 (_keys!11531 thiss!1427))) #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039380 () Bool)

(declare-fun e!588266 () Bool)

(assert (=> b!1039380 (= e!588266 (bvslt (size!32058 (_keys!11531 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039379 () Bool)

(declare-fun res!693173 () Bool)

(assert (=> b!1039379 (=> (not res!693173) (not e!588266))))

(assert (=> b!1039379 (= res!693173 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039378 () Bool)

(declare-fun res!693172 () Bool)

(assert (=> b!1039378 (=> (not res!693172) (not e!588266))))

(assert (=> b!1039378 (= res!693172 (validKeyInArray!0 (select (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055))))))

(declare-fun d!125485 () Bool)

(assert (=> d!125485 e!588265))

(declare-fun res!693174 () Bool)

(assert (=> d!125485 (=> (not res!693174) (not e!588265))))

(assert (=> d!125485 (= res!693174 (and (bvsge (index!41496 lt!458055) #b00000000000000000000000000000000) (bvslt (index!41496 lt!458055) (size!32058 (_keys!11531 thiss!1427)))))))

(declare-fun lt!458076 () Unit!33993)

(declare-fun choose!82 (array!65510 (_ BitVec 32) (_ BitVec 64)) Unit!33993)

(assert (=> d!125485 (= lt!458076 (choose!82 (_keys!11531 thiss!1427) (index!41496 lt!458055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125485 e!588266))

(declare-fun res!693175 () Bool)

(assert (=> d!125485 (=> (not res!693175) (not e!588266))))

(assert (=> d!125485 (= res!693175 (and (bvsge (index!41496 lt!458055) #b00000000000000000000000000000000) (bvslt (index!41496 lt!458055) (size!32058 (_keys!11531 thiss!1427)))))))

(assert (=> d!125485 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11531 thiss!1427) (index!41496 lt!458055) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458076)))

(assert (= (and d!125485 res!693175) b!1039378))

(assert (= (and b!1039378 res!693172) b!1039379))

(assert (= (and b!1039379 res!693173) b!1039380))

(assert (= (and d!125485 res!693174) b!1039381))

(assert (=> b!1039381 m!959059))

(declare-fun m!959123 () Bool)

(assert (=> b!1039381 m!959123))

(assert (=> b!1039381 m!959067))

(declare-fun m!959125 () Bool)

(assert (=> b!1039379 m!959125))

(assert (=> b!1039378 m!959075))

(assert (=> b!1039378 m!959075))

(assert (=> b!1039378 m!959077))

(declare-fun m!959127 () Bool)

(assert (=> d!125485 m!959127))

(assert (=> b!1039317 d!125485))

(declare-fun d!125487 () Bool)

(assert (=> d!125487 (= (validMask!0 (mask!30284 thiss!1427)) (and (or (= (mask!30284 thiss!1427) #b00000000000000000000000000000111) (= (mask!30284 thiss!1427) #b00000000000000000000000000001111) (= (mask!30284 thiss!1427) #b00000000000000000000000000011111) (= (mask!30284 thiss!1427) #b00000000000000000000000000111111) (= (mask!30284 thiss!1427) #b00000000000000000000000001111111) (= (mask!30284 thiss!1427) #b00000000000000000000000011111111) (= (mask!30284 thiss!1427) #b00000000000000000000000111111111) (= (mask!30284 thiss!1427) #b00000000000000000000001111111111) (= (mask!30284 thiss!1427) #b00000000000000000000011111111111) (= (mask!30284 thiss!1427) #b00000000000000000000111111111111) (= (mask!30284 thiss!1427) #b00000000000000000001111111111111) (= (mask!30284 thiss!1427) #b00000000000000000011111111111111) (= (mask!30284 thiss!1427) #b00000000000000000111111111111111) (= (mask!30284 thiss!1427) #b00000000000000001111111111111111) (= (mask!30284 thiss!1427) #b00000000000000011111111111111111) (= (mask!30284 thiss!1427) #b00000000000000111111111111111111) (= (mask!30284 thiss!1427) #b00000000000001111111111111111111) (= (mask!30284 thiss!1427) #b00000000000011111111111111111111) (= (mask!30284 thiss!1427) #b00000000000111111111111111111111) (= (mask!30284 thiss!1427) #b00000000001111111111111111111111) (= (mask!30284 thiss!1427) #b00000000011111111111111111111111) (= (mask!30284 thiss!1427) #b00000000111111111111111111111111) (= (mask!30284 thiss!1427) #b00000001111111111111111111111111) (= (mask!30284 thiss!1427) #b00000011111111111111111111111111) (= (mask!30284 thiss!1427) #b00000111111111111111111111111111) (= (mask!30284 thiss!1427) #b00001111111111111111111111111111) (= (mask!30284 thiss!1427) #b00011111111111111111111111111111) (= (mask!30284 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30284 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039317 d!125487))

(declare-fun b!1039390 () Bool)

(declare-fun e!588271 () (_ BitVec 32))

(declare-fun call!43991 () (_ BitVec 32))

(assert (=> b!1039390 (= e!588271 (bvadd #b00000000000000000000000000000001 call!43991))))

(declare-fun b!1039391 () Bool)

(declare-fun e!588272 () (_ BitVec 32))

(assert (=> b!1039391 (= e!588272 e!588271)))

(declare-fun c!105337 () Bool)

(assert (=> b!1039391 (= c!105337 (validKeyInArray!0 (select (arr!31527 lt!458056) #b00000000000000000000000000000000)))))

(declare-fun d!125489 () Bool)

(declare-fun lt!458079 () (_ BitVec 32))

(assert (=> d!125489 (and (bvsge lt!458079 #b00000000000000000000000000000000) (bvsle lt!458079 (bvsub (size!32058 lt!458056) #b00000000000000000000000000000000)))))

(assert (=> d!125489 (= lt!458079 e!588272)))

(declare-fun c!105336 () Bool)

(assert (=> d!125489 (= c!105336 (bvsge #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))))))

(assert (=> d!125489 (and (bvsle #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32058 (_keys!11531 thiss!1427)) (size!32058 lt!458056)))))

(assert (=> d!125489 (= (arrayCountValidKeys!0 lt!458056 #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) lt!458079)))

(declare-fun b!1039392 () Bool)

(assert (=> b!1039392 (= e!588271 call!43991)))

(declare-fun bm!43988 () Bool)

(assert (=> bm!43988 (= call!43991 (arrayCountValidKeys!0 lt!458056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32058 (_keys!11531 thiss!1427))))))

(declare-fun b!1039393 () Bool)

(assert (=> b!1039393 (= e!588272 #b00000000000000000000000000000000)))

(assert (= (and d!125489 c!105336) b!1039393))

(assert (= (and d!125489 (not c!105336)) b!1039391))

(assert (= (and b!1039391 c!105337) b!1039390))

(assert (= (and b!1039391 (not c!105337)) b!1039392))

(assert (= (or b!1039390 b!1039392) bm!43988))

(declare-fun m!959129 () Bool)

(assert (=> b!1039391 m!959129))

(assert (=> b!1039391 m!959129))

(declare-fun m!959131 () Bool)

(assert (=> b!1039391 m!959131))

(declare-fun m!959133 () Bool)

(assert (=> bm!43988 m!959133))

(assert (=> b!1039317 d!125489))

(declare-fun d!125491 () Bool)

(declare-fun res!693176 () Bool)

(declare-fun e!588276 () Bool)

(assert (=> d!125491 (=> res!693176 e!588276)))

(assert (=> d!125491 (= res!693176 (bvsge #b00000000000000000000000000000000 (size!32058 lt!458056)))))

(assert (=> d!125491 (= (arrayNoDuplicates!0 lt!458056 #b00000000000000000000000000000000 Nil!21943) e!588276)))

(declare-fun b!1039394 () Bool)

(declare-fun e!588274 () Bool)

(declare-fun call!43992 () Bool)

(assert (=> b!1039394 (= e!588274 call!43992)))

(declare-fun b!1039395 () Bool)

(declare-fun e!588275 () Bool)

(assert (=> b!1039395 (= e!588275 (contains!6043 Nil!21943 (select (arr!31527 lt!458056) #b00000000000000000000000000000000)))))

(declare-fun b!1039396 () Bool)

(declare-fun e!588273 () Bool)

(assert (=> b!1039396 (= e!588276 e!588273)))

(declare-fun res!693177 () Bool)

(assert (=> b!1039396 (=> (not res!693177) (not e!588273))))

(assert (=> b!1039396 (= res!693177 (not e!588275))))

(declare-fun res!693178 () Bool)

(assert (=> b!1039396 (=> (not res!693178) (not e!588275))))

(assert (=> b!1039396 (= res!693178 (validKeyInArray!0 (select (arr!31527 lt!458056) #b00000000000000000000000000000000)))))

(declare-fun b!1039397 () Bool)

(assert (=> b!1039397 (= e!588274 call!43992)))

(declare-fun b!1039398 () Bool)

(assert (=> b!1039398 (= e!588273 e!588274)))

(declare-fun c!105338 () Bool)

(assert (=> b!1039398 (= c!105338 (validKeyInArray!0 (select (arr!31527 lt!458056) #b00000000000000000000000000000000)))))

(declare-fun bm!43989 () Bool)

(assert (=> bm!43989 (= call!43992 (arrayNoDuplicates!0 lt!458056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105338 (Cons!21942 (select (arr!31527 lt!458056) #b00000000000000000000000000000000) Nil!21943) Nil!21943)))))

(assert (= (and d!125491 (not res!693176)) b!1039396))

(assert (= (and b!1039396 res!693178) b!1039395))

(assert (= (and b!1039396 res!693177) b!1039398))

(assert (= (and b!1039398 c!105338) b!1039394))

(assert (= (and b!1039398 (not c!105338)) b!1039397))

(assert (= (or b!1039394 b!1039397) bm!43989))

(assert (=> b!1039395 m!959129))

(assert (=> b!1039395 m!959129))

(declare-fun m!959135 () Bool)

(assert (=> b!1039395 m!959135))

(assert (=> b!1039396 m!959129))

(assert (=> b!1039396 m!959129))

(assert (=> b!1039396 m!959131))

(assert (=> b!1039398 m!959129))

(assert (=> b!1039398 m!959129))

(assert (=> b!1039398 m!959131))

(assert (=> bm!43989 m!959129))

(declare-fun m!959137 () Bool)

(assert (=> bm!43989 m!959137))

(assert (=> b!1039317 d!125491))

(declare-fun b!1039399 () Bool)

(declare-fun e!588277 () (_ BitVec 32))

(declare-fun call!43993 () (_ BitVec 32))

(assert (=> b!1039399 (= e!588277 (bvadd #b00000000000000000000000000000001 call!43993))))

(declare-fun b!1039400 () Bool)

(declare-fun e!588278 () (_ BitVec 32))

(assert (=> b!1039400 (= e!588278 e!588277)))

(declare-fun c!105340 () Bool)

(assert (=> b!1039400 (= c!105340 (validKeyInArray!0 (select (arr!31527 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125493 () Bool)

(declare-fun lt!458080 () (_ BitVec 32))

(assert (=> d!125493 (and (bvsge lt!458080 #b00000000000000000000000000000000) (bvsle lt!458080 (bvsub (size!32058 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125493 (= lt!458080 e!588278)))

(declare-fun c!105339 () Bool)

(assert (=> d!125493 (= c!105339 (bvsge #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))))))

(assert (=> d!125493 (and (bvsle #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32058 (_keys!11531 thiss!1427)) (size!32058 (_keys!11531 thiss!1427))))))

(assert (=> d!125493 (= (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) lt!458080)))

(declare-fun b!1039401 () Bool)

(assert (=> b!1039401 (= e!588277 call!43993)))

(declare-fun bm!43990 () Bool)

(assert (=> bm!43990 (= call!43993 (arrayCountValidKeys!0 (_keys!11531 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32058 (_keys!11531 thiss!1427))))))

(declare-fun b!1039402 () Bool)

(assert (=> b!1039402 (= e!588278 #b00000000000000000000000000000000)))

(assert (= (and d!125493 c!105339) b!1039402))

(assert (= (and d!125493 (not c!105339)) b!1039400))

(assert (= (and b!1039400 c!105340) b!1039399))

(assert (= (and b!1039400 (not c!105340)) b!1039401))

(assert (= (or b!1039399 b!1039401) bm!43990))

(assert (=> b!1039400 m!959111))

(assert (=> b!1039400 m!959111))

(assert (=> b!1039400 m!959115))

(declare-fun m!959139 () Bool)

(assert (=> bm!43990 m!959139))

(assert (=> b!1039317 d!125493))

(declare-fun d!125495 () Bool)

(declare-fun res!693185 () Bool)

(declare-fun e!588281 () Bool)

(assert (=> d!125495 (=> (not res!693185) (not e!588281))))

(declare-fun simpleValid!427 (LongMapFixedSize!5880) Bool)

(assert (=> d!125495 (= res!693185 (simpleValid!427 thiss!1427))))

(assert (=> d!125495 (= (valid!2209 thiss!1427) e!588281)))

(declare-fun b!1039409 () Bool)

(declare-fun res!693186 () Bool)

(assert (=> b!1039409 (=> (not res!693186) (not e!588281))))

(assert (=> b!1039409 (= res!693186 (= (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32058 (_keys!11531 thiss!1427))) (_size!2995 thiss!1427)))))

(declare-fun b!1039410 () Bool)

(declare-fun res!693187 () Bool)

(assert (=> b!1039410 (=> (not res!693187) (not e!588281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65510 (_ BitVec 32)) Bool)

(assert (=> b!1039410 (= res!693187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11531 thiss!1427) (mask!30284 thiss!1427)))))

(declare-fun b!1039411 () Bool)

(assert (=> b!1039411 (= e!588281 (arrayNoDuplicates!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 Nil!21943))))

(assert (= (and d!125495 res!693185) b!1039409))

(assert (= (and b!1039409 res!693186) b!1039410))

(assert (= (and b!1039410 res!693187) b!1039411))

(declare-fun m!959141 () Bool)

(assert (=> d!125495 m!959141))

(assert (=> b!1039409 m!959067))

(declare-fun m!959143 () Bool)

(assert (=> b!1039410 m!959143))

(assert (=> b!1039411 m!959051))

(assert (=> start!90984 d!125495))

(declare-fun d!125497 () Bool)

(assert (=> d!125497 (= (array_inv!24373 (_keys!11531 thiss!1427)) (bvsge (size!32058 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039313 d!125497))

(declare-fun d!125499 () Bool)

(assert (=> d!125499 (= (array_inv!24374 (_values!6345 thiss!1427)) (bvsge (size!32059 (_values!6345 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039313 d!125499))

(declare-fun d!125501 () Bool)

(assert (=> d!125501 (= (validKeyInArray!0 (select (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055))) (and (not (= (select (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458055)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039319 d!125501))

(declare-fun d!125503 () Bool)

(declare-fun lt!458091 () SeekEntryResult!9781)

(assert (=> d!125503 (and (or ((_ is MissingVacant!9781) lt!458091) (not ((_ is Found!9781) lt!458091)) (and (bvsge (index!41496 lt!458091) #b00000000000000000000000000000000) (bvslt (index!41496 lt!458091) (size!32058 (_keys!11531 thiss!1427))))) (not ((_ is MissingVacant!9781) lt!458091)) (or (not ((_ is Found!9781) lt!458091)) (= (select (arr!31527 (_keys!11531 thiss!1427)) (index!41496 lt!458091)) key!909)))))

(declare-fun e!588288 () SeekEntryResult!9781)

(assert (=> d!125503 (= lt!458091 e!588288)))

(declare-fun c!105349 () Bool)

(declare-fun lt!458089 () SeekEntryResult!9781)

(assert (=> d!125503 (= c!105349 (and ((_ is Intermediate!9781) lt!458089) (undefined!10593 lt!458089)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65510 (_ BitVec 32)) SeekEntryResult!9781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125503 (= lt!458089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30284 thiss!1427)) key!909 (_keys!11531 thiss!1427) (mask!30284 thiss!1427)))))

(assert (=> d!125503 (validMask!0 (mask!30284 thiss!1427))))

(assert (=> d!125503 (= (seekEntry!0 key!909 (_keys!11531 thiss!1427) (mask!30284 thiss!1427)) lt!458091)))

(declare-fun b!1039424 () Bool)

(declare-fun c!105348 () Bool)

(declare-fun lt!458092 () (_ BitVec 64))

(assert (=> b!1039424 (= c!105348 (= lt!458092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588290 () SeekEntryResult!9781)

(declare-fun e!588289 () SeekEntryResult!9781)

(assert (=> b!1039424 (= e!588290 e!588289)))

(declare-fun b!1039425 () Bool)

(assert (=> b!1039425 (= e!588288 Undefined!9781)))

(declare-fun b!1039426 () Bool)

(declare-fun lt!458090 () SeekEntryResult!9781)

(assert (=> b!1039426 (= e!588289 (ite ((_ is MissingVacant!9781) lt!458090) (MissingZero!9781 (index!41498 lt!458090)) lt!458090))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65510 (_ BitVec 32)) SeekEntryResult!9781)

(assert (=> b!1039426 (= lt!458090 (seekKeyOrZeroReturnVacant!0 (x!92757 lt!458089) (index!41497 lt!458089) (index!41497 lt!458089) key!909 (_keys!11531 thiss!1427) (mask!30284 thiss!1427)))))

(declare-fun b!1039427 () Bool)

(assert (=> b!1039427 (= e!588290 (Found!9781 (index!41497 lt!458089)))))

(declare-fun b!1039428 () Bool)

(assert (=> b!1039428 (= e!588288 e!588290)))

(assert (=> b!1039428 (= lt!458092 (select (arr!31527 (_keys!11531 thiss!1427)) (index!41497 lt!458089)))))

(declare-fun c!105347 () Bool)

(assert (=> b!1039428 (= c!105347 (= lt!458092 key!909))))

(declare-fun b!1039429 () Bool)

(assert (=> b!1039429 (= e!588289 (MissingZero!9781 (index!41497 lt!458089)))))

(assert (= (and d!125503 c!105349) b!1039425))

(assert (= (and d!125503 (not c!105349)) b!1039428))

(assert (= (and b!1039428 c!105347) b!1039427))

(assert (= (and b!1039428 (not c!105347)) b!1039424))

(assert (= (and b!1039424 c!105348) b!1039429))

(assert (= (and b!1039424 (not c!105348)) b!1039426))

(declare-fun m!959145 () Bool)

(assert (=> d!125503 m!959145))

(declare-fun m!959147 () Bool)

(assert (=> d!125503 m!959147))

(assert (=> d!125503 m!959147))

(declare-fun m!959149 () Bool)

(assert (=> d!125503 m!959149))

(assert (=> d!125503 m!959061))

(declare-fun m!959151 () Bool)

(assert (=> b!1039426 m!959151))

(declare-fun m!959153 () Bool)

(assert (=> b!1039428 m!959153))

(assert (=> b!1039314 d!125503))

(declare-fun mapNonEmpty!38605 () Bool)

(declare-fun mapRes!38605 () Bool)

(declare-fun tp!74105 () Bool)

(declare-fun e!588295 () Bool)

(assert (=> mapNonEmpty!38605 (= mapRes!38605 (and tp!74105 e!588295))))

(declare-fun mapKey!38605 () (_ BitVec 32))

(declare-fun mapValue!38605 () ValueCell!11643)

(declare-fun mapRest!38605 () (Array (_ BitVec 32) ValueCell!11643))

(assert (=> mapNonEmpty!38605 (= mapRest!38599 (store mapRest!38605 mapKey!38605 mapValue!38605))))

(declare-fun mapIsEmpty!38605 () Bool)

(assert (=> mapIsEmpty!38605 mapRes!38605))

(declare-fun b!1039436 () Bool)

(assert (=> b!1039436 (= e!588295 tp_is_empty!24693)))

(declare-fun condMapEmpty!38605 () Bool)

(declare-fun mapDefault!38605 () ValueCell!11643)

(assert (=> mapNonEmpty!38599 (= condMapEmpty!38605 (= mapRest!38599 ((as const (Array (_ BitVec 32) ValueCell!11643)) mapDefault!38605)))))

(declare-fun e!588296 () Bool)

(assert (=> mapNonEmpty!38599 (= tp!74095 (and e!588296 mapRes!38605))))

(declare-fun b!1039437 () Bool)

(assert (=> b!1039437 (= e!588296 tp_is_empty!24693)))

(assert (= (and mapNonEmpty!38599 condMapEmpty!38605) mapIsEmpty!38605))

(assert (= (and mapNonEmpty!38599 (not condMapEmpty!38605)) mapNonEmpty!38605))

(assert (= (and mapNonEmpty!38605 ((_ is ValueCellFull!11643) mapValue!38605)) b!1039436))

(assert (= (and mapNonEmpty!38599 ((_ is ValueCellFull!11643) mapDefault!38605)) b!1039437))

(declare-fun m!959155 () Bool)

(assert (=> mapNonEmpty!38605 m!959155))

(check-sat (not b!1039426) (not mapNonEmpty!38605) tp_is_empty!24693 (not b!1039400) (not bm!43990) (not bm!43988) (not b!1039366) (not b!1039411) (not bm!43989) (not b!1039364) (not b!1039363) (not d!125503) (not b!1039398) (not d!125483) (not b!1039409) (not b!1039369) (not b!1039391) (not b!1039379) b_and!33505 (not b!1039378) (not b!1039410) (not b!1039381) (not d!125495) (not d!125485) (not b!1039395) (not b!1039396) (not bm!43985) (not b_next!20973))
(check-sat b_and!33505 (not b_next!20973))
