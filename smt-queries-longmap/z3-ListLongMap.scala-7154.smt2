; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91010 () Bool)

(assert start!91010)

(declare-fun b!1039498 () Bool)

(declare-fun b_free!20979 () Bool)

(declare-fun b_next!20979 () Bool)

(assert (=> b!1039498 (= b_free!20979 (not b_next!20979))))

(declare-fun tp!74117 () Bool)

(declare-fun b_and!33511 () Bool)

(assert (=> b!1039498 (= tp!74117 b_and!33511)))

(declare-fun b!1039493 () Bool)

(declare-fun e!588342 () Bool)

(declare-fun tp_is_empty!24699 () Bool)

(assert (=> b!1039493 (= e!588342 tp_is_empty!24699)))

(declare-fun res!693225 () Bool)

(declare-fun e!588339 () Bool)

(assert (=> start!91010 (=> (not res!693225) (not e!588339))))

(declare-datatypes ((V!37805 0))(
  ( (V!37806 (val!12400 Int)) )
))
(declare-datatypes ((ValueCell!11646 0))(
  ( (ValueCellFull!11646 (v!14987 V!37805)) (EmptyCell!11646) )
))
(declare-datatypes ((array!65524 0))(
  ( (array!65525 (arr!31533 (Array (_ BitVec 32) (_ BitVec 64))) (size!32064 (_ BitVec 32))) )
))
(declare-datatypes ((array!65526 0))(
  ( (array!65527 (arr!31534 (Array (_ BitVec 32) ValueCell!11646)) (size!32065 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5886 0))(
  ( (LongMapFixedSize!5887 (defaultEntry!6325 Int) (mask!30291 (_ BitVec 32)) (extraKeys!6053 (_ BitVec 32)) (zeroValue!6159 V!37805) (minValue!6159 V!37805) (_size!2998 (_ BitVec 32)) (_keys!11535 array!65524) (_values!6348 array!65526) (_vacant!2998 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5886)

(declare-fun valid!2211 (LongMapFixedSize!5886) Bool)

(assert (=> start!91010 (= res!693225 (valid!2211 thiss!1427))))

(assert (=> start!91010 e!588339))

(declare-fun e!588341 () Bool)

(assert (=> start!91010 e!588341))

(assert (=> start!91010 true))

(declare-fun b!1039494 () Bool)

(declare-fun e!588340 () Bool)

(declare-fun e!588337 () Bool)

(declare-fun mapRes!38611 () Bool)

(assert (=> b!1039494 (= e!588340 (and e!588337 mapRes!38611))))

(declare-fun condMapEmpty!38611 () Bool)

(declare-fun mapDefault!38611 () ValueCell!11646)

(assert (=> b!1039494 (= condMapEmpty!38611 (= (arr!31534 (_values!6348 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11646)) mapDefault!38611)))))

(declare-fun b!1039495 () Bool)

(assert (=> b!1039495 (= e!588337 tp_is_empty!24699)))

(declare-fun b!1039496 () Bool)

(declare-fun e!588343 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65524 (_ BitVec 32)) Bool)

(assert (=> b!1039496 (= e!588343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)))))

(declare-fun b!1039497 () Bool)

(declare-fun e!588338 () Bool)

(assert (=> b!1039497 (= e!588339 e!588338)))

(declare-fun res!693226 () Bool)

(assert (=> b!1039497 (=> (not res!693226) (not e!588338))))

(declare-datatypes ((SeekEntryResult!9784 0))(
  ( (MissingZero!9784 (index!41507 (_ BitVec 32))) (Found!9784 (index!41508 (_ BitVec 32))) (Intermediate!9784 (undefined!10596 Bool) (index!41509 (_ BitVec 32)) (x!92776 (_ BitVec 32))) (Undefined!9784) (MissingVacant!9784 (index!41510 (_ BitVec 32))) )
))
(declare-fun lt!458113 () SeekEntryResult!9784)

(get-info :version)

(assert (=> b!1039497 (= res!693226 ((_ is Found!9784) lt!458113))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65524 (_ BitVec 32)) SeekEntryResult!9784)

(assert (=> b!1039497 (= lt!458113 (seekEntry!0 key!909 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)))))

(declare-fun mapNonEmpty!38611 () Bool)

(declare-fun tp!74116 () Bool)

(assert (=> mapNonEmpty!38611 (= mapRes!38611 (and tp!74116 e!588342))))

(declare-fun mapRest!38611 () (Array (_ BitVec 32) ValueCell!11646))

(declare-fun mapKey!38611 () (_ BitVec 32))

(declare-fun mapValue!38611 () ValueCell!11646)

(assert (=> mapNonEmpty!38611 (= (arr!31534 (_values!6348 thiss!1427)) (store mapRest!38611 mapKey!38611 mapValue!38611))))

(declare-fun array_inv!24377 (array!65524) Bool)

(declare-fun array_inv!24378 (array!65526) Bool)

(assert (=> b!1039498 (= e!588341 (and tp!74117 tp_is_empty!24699 (array_inv!24377 (_keys!11535 thiss!1427)) (array_inv!24378 (_values!6348 thiss!1427)) e!588340))))

(declare-fun b!1039499 () Bool)

(declare-fun res!693228 () Bool)

(assert (=> b!1039499 (=> (not res!693228) (not e!588339))))

(assert (=> b!1039499 (= res!693228 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039500 () Bool)

(assert (=> b!1039500 (= e!588338 (not e!588343))))

(declare-fun res!693229 () Bool)

(assert (=> b!1039500 (=> res!693229 e!588343)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039500 (= res!693229 (not (validMask!0 (mask!30291 thiss!1427))))))

(declare-fun lt!458116 () array!65524)

(declare-datatypes ((List!21948 0))(
  ( (Nil!21945) (Cons!21944 (h!23148 (_ BitVec 64)) (t!31162 List!21948)) )
))
(declare-fun arrayNoDuplicates!0 (array!65524 (_ BitVec 32) List!21948) Bool)

(assert (=> b!1039500 (arrayNoDuplicates!0 lt!458116 #b00000000000000000000000000000000 Nil!21945)))

(declare-datatypes ((Unit!33997 0))(
  ( (Unit!33998) )
))
(declare-fun lt!458115 () Unit!33997)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21948) Unit!33997)

(assert (=> b!1039500 (= lt!458115 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11535 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41508 lt!458113) #b00000000000000000000000000000000 Nil!21945))))

(declare-fun arrayCountValidKeys!0 (array!65524 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039500 (= (arrayCountValidKeys!0 lt!458116 #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039500 (= lt!458116 (array!65525 (store (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32064 (_keys!11535 thiss!1427))))))

(declare-fun lt!458114 () Unit!33997)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65524 (_ BitVec 32) (_ BitVec 64)) Unit!33997)

(assert (=> b!1039500 (= lt!458114 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11535 thiss!1427) (index!41508 lt!458113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039501 () Bool)

(declare-fun res!693223 () Bool)

(assert (=> b!1039501 (=> res!693223 e!588343)))

(assert (=> b!1039501 (= res!693223 (not (arrayNoDuplicates!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 Nil!21945)))))

(declare-fun mapIsEmpty!38611 () Bool)

(assert (=> mapIsEmpty!38611 mapRes!38611))

(declare-fun b!1039502 () Bool)

(declare-fun res!693224 () Bool)

(assert (=> b!1039502 (=> res!693224 e!588343)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039502 (= res!693224 (not (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113)))))))

(declare-fun b!1039503 () Bool)

(declare-fun res!693227 () Bool)

(assert (=> b!1039503 (=> res!693227 e!588343)))

(assert (=> b!1039503 (= res!693227 (or (not (= (size!32064 (_keys!11535 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30291 thiss!1427)))) (bvslt (index!41508 lt!458113) #b00000000000000000000000000000000) (bvsge (index!41508 lt!458113) (size!32064 (_keys!11535 thiss!1427)))))))

(assert (= (and start!91010 res!693225) b!1039499))

(assert (= (and b!1039499 res!693228) b!1039497))

(assert (= (and b!1039497 res!693226) b!1039500))

(assert (= (and b!1039500 (not res!693229)) b!1039503))

(assert (= (and b!1039503 (not res!693227)) b!1039502))

(assert (= (and b!1039502 (not res!693224)) b!1039501))

(assert (= (and b!1039501 (not res!693223)) b!1039496))

(assert (= (and b!1039494 condMapEmpty!38611) mapIsEmpty!38611))

(assert (= (and b!1039494 (not condMapEmpty!38611)) mapNonEmpty!38611))

(assert (= (and mapNonEmpty!38611 ((_ is ValueCellFull!11646) mapValue!38611)) b!1039493))

(assert (= (and b!1039494 ((_ is ValueCellFull!11646) mapDefault!38611)) b!1039495))

(assert (= b!1039498 b!1039494))

(assert (= start!91010 b!1039498))

(declare-fun m!959189 () Bool)

(assert (=> start!91010 m!959189))

(declare-fun m!959191 () Bool)

(assert (=> mapNonEmpty!38611 m!959191))

(declare-fun m!959193 () Bool)

(assert (=> b!1039497 m!959193))

(declare-fun m!959195 () Bool)

(assert (=> b!1039496 m!959195))

(declare-fun m!959197 () Bool)

(assert (=> b!1039498 m!959197))

(declare-fun m!959199 () Bool)

(assert (=> b!1039498 m!959199))

(declare-fun m!959201 () Bool)

(assert (=> b!1039500 m!959201))

(declare-fun m!959203 () Bool)

(assert (=> b!1039500 m!959203))

(declare-fun m!959205 () Bool)

(assert (=> b!1039500 m!959205))

(declare-fun m!959207 () Bool)

(assert (=> b!1039500 m!959207))

(declare-fun m!959209 () Bool)

(assert (=> b!1039500 m!959209))

(declare-fun m!959211 () Bool)

(assert (=> b!1039500 m!959211))

(declare-fun m!959213 () Bool)

(assert (=> b!1039500 m!959213))

(declare-fun m!959215 () Bool)

(assert (=> b!1039501 m!959215))

(declare-fun m!959217 () Bool)

(assert (=> b!1039502 m!959217))

(assert (=> b!1039502 m!959217))

(declare-fun m!959219 () Bool)

(assert (=> b!1039502 m!959219))

(check-sat (not b!1039497) (not mapNonEmpty!38611) (not b!1039500) (not b!1039501) (not b!1039502) tp_is_empty!24699 b_and!33511 (not b!1039496) (not b!1039498) (not start!91010) (not b_next!20979))
(check-sat b_and!33511 (not b_next!20979))
(get-model)

(declare-fun b!1039547 () Bool)

(declare-fun e!588380 () Bool)

(declare-fun e!588378 () Bool)

(assert (=> b!1039547 (= e!588380 e!588378)))

(declare-fun res!693257 () Bool)

(assert (=> b!1039547 (=> (not res!693257) (not e!588378))))

(declare-fun e!588377 () Bool)

(assert (=> b!1039547 (= res!693257 (not e!588377))))

(declare-fun res!693259 () Bool)

(assert (=> b!1039547 (=> (not res!693259) (not e!588377))))

(assert (=> b!1039547 (= res!693259 (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039548 () Bool)

(declare-fun e!588379 () Bool)

(declare-fun call!43996 () Bool)

(assert (=> b!1039548 (= e!588379 call!43996)))

(declare-fun bm!43993 () Bool)

(declare-fun c!105352 () Bool)

(assert (=> bm!43993 (= call!43996 (arrayNoDuplicates!0 (_keys!11535 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105352 (Cons!21944 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000) Nil!21945) Nil!21945)))))

(declare-fun b!1039549 () Bool)

(assert (=> b!1039549 (= e!588379 call!43996)))

(declare-fun d!125507 () Bool)

(declare-fun res!693258 () Bool)

(assert (=> d!125507 (=> res!693258 e!588380)))

(assert (=> d!125507 (= res!693258 (bvsge #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))))))

(assert (=> d!125507 (= (arrayNoDuplicates!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 Nil!21945) e!588380)))

(declare-fun b!1039550 () Bool)

(assert (=> b!1039550 (= e!588378 e!588379)))

(assert (=> b!1039550 (= c!105352 (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039551 () Bool)

(declare-fun contains!6044 (List!21948 (_ BitVec 64)) Bool)

(assert (=> b!1039551 (= e!588377 (contains!6044 Nil!21945 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125507 (not res!693258)) b!1039547))

(assert (= (and b!1039547 res!693259) b!1039551))

(assert (= (and b!1039547 res!693257) b!1039550))

(assert (= (and b!1039550 c!105352) b!1039548))

(assert (= (and b!1039550 (not c!105352)) b!1039549))

(assert (= (or b!1039548 b!1039549) bm!43993))

(declare-fun m!959253 () Bool)

(assert (=> b!1039547 m!959253))

(assert (=> b!1039547 m!959253))

(declare-fun m!959255 () Bool)

(assert (=> b!1039547 m!959255))

(assert (=> bm!43993 m!959253))

(declare-fun m!959257 () Bool)

(assert (=> bm!43993 m!959257))

(assert (=> b!1039550 m!959253))

(assert (=> b!1039550 m!959253))

(assert (=> b!1039550 m!959255))

(assert (=> b!1039551 m!959253))

(assert (=> b!1039551 m!959253))

(declare-fun m!959259 () Bool)

(assert (=> b!1039551 m!959259))

(assert (=> b!1039501 d!125507))

(declare-fun d!125509 () Bool)

(declare-fun lt!458137 () SeekEntryResult!9784)

(assert (=> d!125509 (and (or ((_ is MissingVacant!9784) lt!458137) (not ((_ is Found!9784) lt!458137)) (and (bvsge (index!41508 lt!458137) #b00000000000000000000000000000000) (bvslt (index!41508 lt!458137) (size!32064 (_keys!11535 thiss!1427))))) (not ((_ is MissingVacant!9784) lt!458137)) (or (not ((_ is Found!9784) lt!458137)) (= (select (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458137)) key!909)))))

(declare-fun e!588387 () SeekEntryResult!9784)

(assert (=> d!125509 (= lt!458137 e!588387)))

(declare-fun c!105361 () Bool)

(declare-fun lt!458138 () SeekEntryResult!9784)

(assert (=> d!125509 (= c!105361 (and ((_ is Intermediate!9784) lt!458138) (undefined!10596 lt!458138)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65524 (_ BitVec 32)) SeekEntryResult!9784)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125509 (= lt!458138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30291 thiss!1427)) key!909 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)))))

(assert (=> d!125509 (validMask!0 (mask!30291 thiss!1427))))

(assert (=> d!125509 (= (seekEntry!0 key!909 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)) lt!458137)))

(declare-fun b!1039564 () Bool)

(declare-fun e!588389 () SeekEntryResult!9784)

(declare-fun lt!458140 () SeekEntryResult!9784)

(assert (=> b!1039564 (= e!588389 (ite ((_ is MissingVacant!9784) lt!458140) (MissingZero!9784 (index!41510 lt!458140)) lt!458140))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65524 (_ BitVec 32)) SeekEntryResult!9784)

(assert (=> b!1039564 (= lt!458140 (seekKeyOrZeroReturnVacant!0 (x!92776 lt!458138) (index!41509 lt!458138) (index!41509 lt!458138) key!909 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)))))

(declare-fun b!1039565 () Bool)

(declare-fun e!588388 () SeekEntryResult!9784)

(assert (=> b!1039565 (= e!588387 e!588388)))

(declare-fun lt!458139 () (_ BitVec 64))

(assert (=> b!1039565 (= lt!458139 (select (arr!31533 (_keys!11535 thiss!1427)) (index!41509 lt!458138)))))

(declare-fun c!105359 () Bool)

(assert (=> b!1039565 (= c!105359 (= lt!458139 key!909))))

(declare-fun b!1039566 () Bool)

(assert (=> b!1039566 (= e!588387 Undefined!9784)))

(declare-fun b!1039567 () Bool)

(declare-fun c!105360 () Bool)

(assert (=> b!1039567 (= c!105360 (= lt!458139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039567 (= e!588388 e!588389)))

(declare-fun b!1039568 () Bool)

(assert (=> b!1039568 (= e!588389 (MissingZero!9784 (index!41509 lt!458138)))))

(declare-fun b!1039569 () Bool)

(assert (=> b!1039569 (= e!588388 (Found!9784 (index!41509 lt!458138)))))

(assert (= (and d!125509 c!105361) b!1039566))

(assert (= (and d!125509 (not c!105361)) b!1039565))

(assert (= (and b!1039565 c!105359) b!1039569))

(assert (= (and b!1039565 (not c!105359)) b!1039567))

(assert (= (and b!1039567 c!105360) b!1039568))

(assert (= (and b!1039567 (not c!105360)) b!1039564))

(declare-fun m!959261 () Bool)

(assert (=> d!125509 m!959261))

(declare-fun m!959263 () Bool)

(assert (=> d!125509 m!959263))

(assert (=> d!125509 m!959263))

(declare-fun m!959265 () Bool)

(assert (=> d!125509 m!959265))

(assert (=> d!125509 m!959201))

(declare-fun m!959267 () Bool)

(assert (=> b!1039564 m!959267))

(declare-fun m!959269 () Bool)

(assert (=> b!1039565 m!959269))

(assert (=> b!1039497 d!125509))

(declare-fun d!125511 () Bool)

(assert (=> d!125511 (= (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113))) (and (not (= (select (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039502 d!125511))

(declare-fun d!125513 () Bool)

(assert (=> d!125513 (= (array_inv!24377 (_keys!11535 thiss!1427)) (bvsge (size!32064 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039498 d!125513))

(declare-fun d!125515 () Bool)

(assert (=> d!125515 (= (array_inv!24378 (_values!6348 thiss!1427)) (bvsge (size!32065 (_values!6348 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039498 d!125515))

(declare-fun d!125517 () Bool)

(declare-fun res!693266 () Bool)

(declare-fun e!588392 () Bool)

(assert (=> d!125517 (=> (not res!693266) (not e!588392))))

(declare-fun simpleValid!428 (LongMapFixedSize!5886) Bool)

(assert (=> d!125517 (= res!693266 (simpleValid!428 thiss!1427))))

(assert (=> d!125517 (= (valid!2211 thiss!1427) e!588392)))

(declare-fun b!1039576 () Bool)

(declare-fun res!693267 () Bool)

(assert (=> b!1039576 (=> (not res!693267) (not e!588392))))

(assert (=> b!1039576 (= res!693267 (= (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) (_size!2998 thiss!1427)))))

(declare-fun b!1039577 () Bool)

(declare-fun res!693268 () Bool)

(assert (=> b!1039577 (=> (not res!693268) (not e!588392))))

(assert (=> b!1039577 (= res!693268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)))))

(declare-fun b!1039578 () Bool)

(assert (=> b!1039578 (= e!588392 (arrayNoDuplicates!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 Nil!21945))))

(assert (= (and d!125517 res!693266) b!1039576))

(assert (= (and b!1039576 res!693267) b!1039577))

(assert (= (and b!1039577 res!693268) b!1039578))

(declare-fun m!959271 () Bool)

(assert (=> d!125517 m!959271))

(assert (=> b!1039576 m!959207))

(assert (=> b!1039577 m!959195))

(assert (=> b!1039578 m!959215))

(assert (=> start!91010 d!125517))

(declare-fun bm!43996 () Bool)

(declare-fun call!43999 () Bool)

(assert (=> bm!43996 (= call!43999 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11535 thiss!1427) (mask!30291 thiss!1427)))))

(declare-fun b!1039587 () Bool)

(declare-fun e!588399 () Bool)

(assert (=> b!1039587 (= e!588399 call!43999)))

(declare-fun b!1039588 () Bool)

(declare-fun e!588400 () Bool)

(assert (=> b!1039588 (= e!588400 e!588399)))

(declare-fun lt!458147 () (_ BitVec 64))

(assert (=> b!1039588 (= lt!458147 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458149 () Unit!33997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65524 (_ BitVec 64) (_ BitVec 32)) Unit!33997)

(assert (=> b!1039588 (= lt!458149 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11535 thiss!1427) lt!458147 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039588 (arrayContainsKey!0 (_keys!11535 thiss!1427) lt!458147 #b00000000000000000000000000000000)))

(declare-fun lt!458148 () Unit!33997)

(assert (=> b!1039588 (= lt!458148 lt!458149)))

(declare-fun res!693273 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65524 (_ BitVec 32)) SeekEntryResult!9784)

(assert (=> b!1039588 (= res!693273 (= (seekEntryOrOpen!0 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000) (_keys!11535 thiss!1427) (mask!30291 thiss!1427)) (Found!9784 #b00000000000000000000000000000000)))))

(assert (=> b!1039588 (=> (not res!693273) (not e!588399))))

(declare-fun b!1039589 () Bool)

(assert (=> b!1039589 (= e!588400 call!43999)))

(declare-fun b!1039590 () Bool)

(declare-fun e!588401 () Bool)

(assert (=> b!1039590 (= e!588401 e!588400)))

(declare-fun c!105364 () Bool)

(assert (=> b!1039590 (= c!105364 (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125519 () Bool)

(declare-fun res!693274 () Bool)

(assert (=> d!125519 (=> res!693274 e!588401)))

(assert (=> d!125519 (= res!693274 (bvsge #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))))))

(assert (=> d!125519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11535 thiss!1427) (mask!30291 thiss!1427)) e!588401)))

(assert (= (and d!125519 (not res!693274)) b!1039590))

(assert (= (and b!1039590 c!105364) b!1039588))

(assert (= (and b!1039590 (not c!105364)) b!1039589))

(assert (= (and b!1039588 res!693273) b!1039587))

(assert (= (or b!1039587 b!1039589) bm!43996))

(declare-fun m!959273 () Bool)

(assert (=> bm!43996 m!959273))

(assert (=> b!1039588 m!959253))

(declare-fun m!959275 () Bool)

(assert (=> b!1039588 m!959275))

(declare-fun m!959277 () Bool)

(assert (=> b!1039588 m!959277))

(assert (=> b!1039588 m!959253))

(declare-fun m!959279 () Bool)

(assert (=> b!1039588 m!959279))

(assert (=> b!1039590 m!959253))

(assert (=> b!1039590 m!959253))

(assert (=> b!1039590 m!959255))

(assert (=> b!1039496 d!125519))

(declare-fun bm!43999 () Bool)

(declare-fun call!44002 () (_ BitVec 32))

(assert (=> bm!43999 (= call!44002 (arrayCountValidKeys!0 lt!458116 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32064 (_keys!11535 thiss!1427))))))

(declare-fun b!1039599 () Bool)

(declare-fun e!588407 () (_ BitVec 32))

(assert (=> b!1039599 (= e!588407 call!44002)))

(declare-fun b!1039600 () Bool)

(declare-fun e!588406 () (_ BitVec 32))

(assert (=> b!1039600 (= e!588406 e!588407)))

(declare-fun c!105370 () Bool)

(assert (=> b!1039600 (= c!105370 (validKeyInArray!0 (select (arr!31533 lt!458116) #b00000000000000000000000000000000)))))

(declare-fun b!1039602 () Bool)

(assert (=> b!1039602 (= e!588406 #b00000000000000000000000000000000)))

(declare-fun b!1039601 () Bool)

(assert (=> b!1039601 (= e!588407 (bvadd #b00000000000000000000000000000001 call!44002))))

(declare-fun d!125521 () Bool)

(declare-fun lt!458152 () (_ BitVec 32))

(assert (=> d!125521 (and (bvsge lt!458152 #b00000000000000000000000000000000) (bvsle lt!458152 (bvsub (size!32064 lt!458116) #b00000000000000000000000000000000)))))

(assert (=> d!125521 (= lt!458152 e!588406)))

(declare-fun c!105369 () Bool)

(assert (=> d!125521 (= c!105369 (bvsge #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))))))

(assert (=> d!125521 (and (bvsle #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32064 (_keys!11535 thiss!1427)) (size!32064 lt!458116)))))

(assert (=> d!125521 (= (arrayCountValidKeys!0 lt!458116 #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) lt!458152)))

(assert (= (and d!125521 c!105369) b!1039602))

(assert (= (and d!125521 (not c!105369)) b!1039600))

(assert (= (and b!1039600 c!105370) b!1039601))

(assert (= (and b!1039600 (not c!105370)) b!1039599))

(assert (= (or b!1039601 b!1039599) bm!43999))

(declare-fun m!959281 () Bool)

(assert (=> bm!43999 m!959281))

(declare-fun m!959283 () Bool)

(assert (=> b!1039600 m!959283))

(assert (=> b!1039600 m!959283))

(declare-fun m!959285 () Bool)

(assert (=> b!1039600 m!959285))

(assert (=> b!1039500 d!125521))

(declare-fun d!125523 () Bool)

(declare-fun e!588410 () Bool)

(assert (=> d!125523 e!588410))

(declare-fun res!693277 () Bool)

(assert (=> d!125523 (=> (not res!693277) (not e!588410))))

(assert (=> d!125523 (= res!693277 (and (bvsge (index!41508 lt!458113) #b00000000000000000000000000000000) (bvslt (index!41508 lt!458113) (size!32064 (_keys!11535 thiss!1427)))))))

(declare-fun lt!458155 () Unit!33997)

(declare-fun choose!53 (array!65524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21948) Unit!33997)

(assert (=> d!125523 (= lt!458155 (choose!53 (_keys!11535 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41508 lt!458113) #b00000000000000000000000000000000 Nil!21945))))

(assert (=> d!125523 (bvslt (size!32064 (_keys!11535 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125523 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11535 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41508 lt!458113) #b00000000000000000000000000000000 Nil!21945) lt!458155)))

(declare-fun b!1039605 () Bool)

(assert (=> b!1039605 (= e!588410 (arrayNoDuplicates!0 (array!65525 (store (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32064 (_keys!11535 thiss!1427))) #b00000000000000000000000000000000 Nil!21945))))

(assert (= (and d!125523 res!693277) b!1039605))

(declare-fun m!959287 () Bool)

(assert (=> d!125523 m!959287))

(assert (=> b!1039605 m!959211))

(declare-fun m!959289 () Bool)

(assert (=> b!1039605 m!959289))

(assert (=> b!1039500 d!125523))

(declare-fun d!125525 () Bool)

(assert (=> d!125525 (= (validMask!0 (mask!30291 thiss!1427)) (and (or (= (mask!30291 thiss!1427) #b00000000000000000000000000000111) (= (mask!30291 thiss!1427) #b00000000000000000000000000001111) (= (mask!30291 thiss!1427) #b00000000000000000000000000011111) (= (mask!30291 thiss!1427) #b00000000000000000000000000111111) (= (mask!30291 thiss!1427) #b00000000000000000000000001111111) (= (mask!30291 thiss!1427) #b00000000000000000000000011111111) (= (mask!30291 thiss!1427) #b00000000000000000000000111111111) (= (mask!30291 thiss!1427) #b00000000000000000000001111111111) (= (mask!30291 thiss!1427) #b00000000000000000000011111111111) (= (mask!30291 thiss!1427) #b00000000000000000000111111111111) (= (mask!30291 thiss!1427) #b00000000000000000001111111111111) (= (mask!30291 thiss!1427) #b00000000000000000011111111111111) (= (mask!30291 thiss!1427) #b00000000000000000111111111111111) (= (mask!30291 thiss!1427) #b00000000000000001111111111111111) (= (mask!30291 thiss!1427) #b00000000000000011111111111111111) (= (mask!30291 thiss!1427) #b00000000000000111111111111111111) (= (mask!30291 thiss!1427) #b00000000000001111111111111111111) (= (mask!30291 thiss!1427) #b00000000000011111111111111111111) (= (mask!30291 thiss!1427) #b00000000000111111111111111111111) (= (mask!30291 thiss!1427) #b00000000001111111111111111111111) (= (mask!30291 thiss!1427) #b00000000011111111111111111111111) (= (mask!30291 thiss!1427) #b00000000111111111111111111111111) (= (mask!30291 thiss!1427) #b00000001111111111111111111111111) (= (mask!30291 thiss!1427) #b00000011111111111111111111111111) (= (mask!30291 thiss!1427) #b00000111111111111111111111111111) (= (mask!30291 thiss!1427) #b00001111111111111111111111111111) (= (mask!30291 thiss!1427) #b00011111111111111111111111111111) (= (mask!30291 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30291 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039500 d!125525))

(declare-fun b!1039617 () Bool)

(declare-fun e!588415 () Bool)

(assert (=> b!1039617 (= e!588415 (= (arrayCountValidKeys!0 (array!65525 (store (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32064 (_keys!11535 thiss!1427))) #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039614 () Bool)

(declare-fun res!693289 () Bool)

(declare-fun e!588416 () Bool)

(assert (=> b!1039614 (=> (not res!693289) (not e!588416))))

(assert (=> b!1039614 (= res!693289 (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) (index!41508 lt!458113))))))

(declare-fun b!1039616 () Bool)

(assert (=> b!1039616 (= e!588416 (bvslt (size!32064 (_keys!11535 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125527 () Bool)

(assert (=> d!125527 e!588415))

(declare-fun res!693288 () Bool)

(assert (=> d!125527 (=> (not res!693288) (not e!588415))))

(assert (=> d!125527 (= res!693288 (and (bvsge (index!41508 lt!458113) #b00000000000000000000000000000000) (bvslt (index!41508 lt!458113) (size!32064 (_keys!11535 thiss!1427)))))))

(declare-fun lt!458158 () Unit!33997)

(declare-fun choose!82 (array!65524 (_ BitVec 32) (_ BitVec 64)) Unit!33997)

(assert (=> d!125527 (= lt!458158 (choose!82 (_keys!11535 thiss!1427) (index!41508 lt!458113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125527 e!588416))

(declare-fun res!693286 () Bool)

(assert (=> d!125527 (=> (not res!693286) (not e!588416))))

(assert (=> d!125527 (= res!693286 (and (bvsge (index!41508 lt!458113) #b00000000000000000000000000000000) (bvslt (index!41508 lt!458113) (size!32064 (_keys!11535 thiss!1427)))))))

(assert (=> d!125527 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11535 thiss!1427) (index!41508 lt!458113) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458158)))

(declare-fun b!1039615 () Bool)

(declare-fun res!693287 () Bool)

(assert (=> b!1039615 (=> (not res!693287) (not e!588416))))

(assert (=> b!1039615 (= res!693287 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125527 res!693286) b!1039614))

(assert (= (and b!1039614 res!693289) b!1039615))

(assert (= (and b!1039615 res!693287) b!1039616))

(assert (= (and d!125527 res!693288) b!1039617))

(assert (=> b!1039617 m!959211))

(declare-fun m!959291 () Bool)

(assert (=> b!1039617 m!959291))

(assert (=> b!1039617 m!959207))

(assert (=> b!1039614 m!959217))

(assert (=> b!1039614 m!959217))

(assert (=> b!1039614 m!959219))

(declare-fun m!959293 () Bool)

(assert (=> d!125527 m!959293))

(declare-fun m!959295 () Bool)

(assert (=> b!1039615 m!959295))

(assert (=> b!1039500 d!125527))

(declare-fun b!1039618 () Bool)

(declare-fun e!588420 () Bool)

(declare-fun e!588418 () Bool)

(assert (=> b!1039618 (= e!588420 e!588418)))

(declare-fun res!693290 () Bool)

(assert (=> b!1039618 (=> (not res!693290) (not e!588418))))

(declare-fun e!588417 () Bool)

(assert (=> b!1039618 (= res!693290 (not e!588417))))

(declare-fun res!693292 () Bool)

(assert (=> b!1039618 (=> (not res!693292) (not e!588417))))

(assert (=> b!1039618 (= res!693292 (validKeyInArray!0 (select (arr!31533 lt!458116) #b00000000000000000000000000000000)))))

(declare-fun b!1039619 () Bool)

(declare-fun e!588419 () Bool)

(declare-fun call!44003 () Bool)

(assert (=> b!1039619 (= e!588419 call!44003)))

(declare-fun bm!44000 () Bool)

(declare-fun c!105371 () Bool)

(assert (=> bm!44000 (= call!44003 (arrayNoDuplicates!0 lt!458116 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105371 (Cons!21944 (select (arr!31533 lt!458116) #b00000000000000000000000000000000) Nil!21945) Nil!21945)))))

(declare-fun b!1039620 () Bool)

(assert (=> b!1039620 (= e!588419 call!44003)))

(declare-fun d!125529 () Bool)

(declare-fun res!693291 () Bool)

(assert (=> d!125529 (=> res!693291 e!588420)))

(assert (=> d!125529 (= res!693291 (bvsge #b00000000000000000000000000000000 (size!32064 lt!458116)))))

(assert (=> d!125529 (= (arrayNoDuplicates!0 lt!458116 #b00000000000000000000000000000000 Nil!21945) e!588420)))

(declare-fun b!1039621 () Bool)

(assert (=> b!1039621 (= e!588418 e!588419)))

(assert (=> b!1039621 (= c!105371 (validKeyInArray!0 (select (arr!31533 lt!458116) #b00000000000000000000000000000000)))))

(declare-fun b!1039622 () Bool)

(assert (=> b!1039622 (= e!588417 (contains!6044 Nil!21945 (select (arr!31533 lt!458116) #b00000000000000000000000000000000)))))

(assert (= (and d!125529 (not res!693291)) b!1039618))

(assert (= (and b!1039618 res!693292) b!1039622))

(assert (= (and b!1039618 res!693290) b!1039621))

(assert (= (and b!1039621 c!105371) b!1039619))

(assert (= (and b!1039621 (not c!105371)) b!1039620))

(assert (= (or b!1039619 b!1039620) bm!44000))

(assert (=> b!1039618 m!959283))

(assert (=> b!1039618 m!959283))

(assert (=> b!1039618 m!959285))

(assert (=> bm!44000 m!959283))

(declare-fun m!959297 () Bool)

(assert (=> bm!44000 m!959297))

(assert (=> b!1039621 m!959283))

(assert (=> b!1039621 m!959283))

(assert (=> b!1039621 m!959285))

(assert (=> b!1039622 m!959283))

(assert (=> b!1039622 m!959283))

(declare-fun m!959299 () Bool)

(assert (=> b!1039622 m!959299))

(assert (=> b!1039500 d!125529))

(declare-fun bm!44001 () Bool)

(declare-fun call!44004 () (_ BitVec 32))

(assert (=> bm!44001 (= call!44004 (arrayCountValidKeys!0 (_keys!11535 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32064 (_keys!11535 thiss!1427))))))

(declare-fun b!1039623 () Bool)

(declare-fun e!588422 () (_ BitVec 32))

(assert (=> b!1039623 (= e!588422 call!44004)))

(declare-fun b!1039624 () Bool)

(declare-fun e!588421 () (_ BitVec 32))

(assert (=> b!1039624 (= e!588421 e!588422)))

(declare-fun c!105373 () Bool)

(assert (=> b!1039624 (= c!105373 (validKeyInArray!0 (select (arr!31533 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039626 () Bool)

(assert (=> b!1039626 (= e!588421 #b00000000000000000000000000000000)))

(declare-fun b!1039625 () Bool)

(assert (=> b!1039625 (= e!588422 (bvadd #b00000000000000000000000000000001 call!44004))))

(declare-fun d!125531 () Bool)

(declare-fun lt!458159 () (_ BitVec 32))

(assert (=> d!125531 (and (bvsge lt!458159 #b00000000000000000000000000000000) (bvsle lt!458159 (bvsub (size!32064 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125531 (= lt!458159 e!588421)))

(declare-fun c!105372 () Bool)

(assert (=> d!125531 (= c!105372 (bvsge #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))))))

(assert (=> d!125531 (and (bvsle #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32064 (_keys!11535 thiss!1427)) (size!32064 (_keys!11535 thiss!1427))))))

(assert (=> d!125531 (= (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32064 (_keys!11535 thiss!1427))) lt!458159)))

(assert (= (and d!125531 c!105372) b!1039626))

(assert (= (and d!125531 (not c!105372)) b!1039624))

(assert (= (and b!1039624 c!105373) b!1039625))

(assert (= (and b!1039624 (not c!105373)) b!1039623))

(assert (= (or b!1039625 b!1039623) bm!44001))

(declare-fun m!959301 () Bool)

(assert (=> bm!44001 m!959301))

(assert (=> b!1039624 m!959253))

(assert (=> b!1039624 m!959253))

(assert (=> b!1039624 m!959255))

(assert (=> b!1039500 d!125531))

(declare-fun mapNonEmpty!38617 () Bool)

(declare-fun mapRes!38617 () Bool)

(declare-fun tp!74126 () Bool)

(declare-fun e!588427 () Bool)

(assert (=> mapNonEmpty!38617 (= mapRes!38617 (and tp!74126 e!588427))))

(declare-fun mapRest!38617 () (Array (_ BitVec 32) ValueCell!11646))

(declare-fun mapValue!38617 () ValueCell!11646)

(declare-fun mapKey!38617 () (_ BitVec 32))

(assert (=> mapNonEmpty!38617 (= mapRest!38611 (store mapRest!38617 mapKey!38617 mapValue!38617))))

(declare-fun condMapEmpty!38617 () Bool)

(declare-fun mapDefault!38617 () ValueCell!11646)

(assert (=> mapNonEmpty!38611 (= condMapEmpty!38617 (= mapRest!38611 ((as const (Array (_ BitVec 32) ValueCell!11646)) mapDefault!38617)))))

(declare-fun e!588428 () Bool)

(assert (=> mapNonEmpty!38611 (= tp!74116 (and e!588428 mapRes!38617))))

(declare-fun b!1039634 () Bool)

(assert (=> b!1039634 (= e!588428 tp_is_empty!24699)))

(declare-fun b!1039633 () Bool)

(assert (=> b!1039633 (= e!588427 tp_is_empty!24699)))

(declare-fun mapIsEmpty!38617 () Bool)

(assert (=> mapIsEmpty!38617 mapRes!38617))

(assert (= (and mapNonEmpty!38611 condMapEmpty!38617) mapIsEmpty!38617))

(assert (= (and mapNonEmpty!38611 (not condMapEmpty!38617)) mapNonEmpty!38617))

(assert (= (and mapNonEmpty!38617 ((_ is ValueCellFull!11646) mapValue!38617)) b!1039633))

(assert (= (and mapNonEmpty!38611 ((_ is ValueCellFull!11646) mapDefault!38617)) b!1039634))

(declare-fun m!959303 () Bool)

(assert (=> mapNonEmpty!38617 m!959303))

(check-sat (not bm!43993) (not b!1039547) (not d!125517) (not bm!44001) (not b!1039600) (not b!1039564) (not b!1039621) (not b!1039577) (not b!1039615) (not d!125527) (not b!1039576) (not b!1039617) (not b_next!20979) (not bm!43996) (not bm!43999) (not d!125523) (not b!1039622) (not d!125509) (not b!1039588) (not b!1039605) (not b!1039624) tp_is_empty!24699 b_and!33511 (not b!1039578) (not bm!44000) (not mapNonEmpty!38617) (not b!1039614) (not b!1039551) (not b!1039590) (not b!1039618) (not b!1039550))
(check-sat b_and!33511 (not b_next!20979))
