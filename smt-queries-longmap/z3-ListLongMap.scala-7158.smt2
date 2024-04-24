; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91348 () Bool)

(assert start!91348)

(declare-fun b!1041445 () Bool)

(declare-fun b_free!21001 () Bool)

(declare-fun b_next!21001 () Bool)

(assert (=> b!1041445 (= b_free!21001 (not b_next!21001))))

(declare-fun tp!74195 () Bool)

(declare-fun b_and!33543 () Bool)

(assert (=> b!1041445 (= tp!74195 b_and!33543)))

(declare-fun b!1041443 () Bool)

(declare-fun e!589656 () Bool)

(declare-fun tp_is_empty!24721 () Bool)

(assert (=> b!1041443 (= e!589656 tp_is_empty!24721)))

(declare-fun b!1041444 () Bool)

(declare-fun e!589658 () Bool)

(declare-fun e!589655 () Bool)

(assert (=> b!1041444 (= e!589658 (not e!589655))))

(declare-fun res!694019 () Bool)

(assert (=> b!1041444 (=> res!694019 e!589655)))

(declare-datatypes ((SeekEntryResult!9747 0))(
  ( (MissingZero!9747 (index!41359 (_ BitVec 32))) (Found!9747 (index!41360 (_ BitVec 32))) (Intermediate!9747 (undefined!10559 Bool) (index!41361 (_ BitVec 32)) (x!92825 (_ BitVec 32))) (Undefined!9747) (MissingVacant!9747 (index!41362 (_ BitVec 32))) )
))
(declare-fun lt!458925 () SeekEntryResult!9747)

(declare-datatypes ((V!37835 0))(
  ( (V!37836 (val!12411 Int)) )
))
(declare-datatypes ((ValueCell!11657 0))(
  ( (ValueCellFull!11657 (v!14994 V!37835)) (EmptyCell!11657) )
))
(declare-datatypes ((array!65625 0))(
  ( (array!65626 (arr!31573 (Array (_ BitVec 32) (_ BitVec 64))) (size!32105 (_ BitVec 32))) )
))
(declare-datatypes ((array!65627 0))(
  ( (array!65628 (arr!31574 (Array (_ BitVec 32) ValueCell!11657)) (size!32106 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5908 0))(
  ( (LongMapFixedSize!5909 (defaultEntry!6336 Int) (mask!30382 (_ BitVec 32)) (extraKeys!6064 (_ BitVec 32)) (zeroValue!6170 V!37835) (minValue!6170 V!37835) (_size!3009 (_ BitVec 32)) (_keys!11592 array!65625) (_values!6359 array!65627) (_vacant!3009 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5908)

(assert (=> b!1041444 (= res!694019 (or (bvslt (index!41360 lt!458925) #b00000000000000000000000000000000) (bvsge (index!41360 lt!458925) (size!32105 (_keys!11592 thiss!1427))) (bvsge (size!32105 (_keys!11592 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458923 () array!65625)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65625 (_ BitVec 32)) Bool)

(assert (=> b!1041444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458923 (mask!30382 thiss!1427))))

(declare-datatypes ((Unit!34013 0))(
  ( (Unit!34014) )
))
(declare-fun lt!458922 () Unit!34013)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65625 (_ BitVec 32) (_ BitVec 32)) Unit!34013)

(assert (=> b!1041444 (= lt!458922 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11592 thiss!1427) (index!41360 lt!458925) (mask!30382 thiss!1427)))))

(declare-datatypes ((List!21943 0))(
  ( (Nil!21940) (Cons!21939 (h!23152 (_ BitVec 64)) (t!31149 List!21943)) )
))
(declare-fun arrayNoDuplicates!0 (array!65625 (_ BitVec 32) List!21943) Bool)

(assert (=> b!1041444 (arrayNoDuplicates!0 lt!458923 #b00000000000000000000000000000000 Nil!21940)))

(declare-fun lt!458924 () Unit!34013)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21943) Unit!34013)

(assert (=> b!1041444 (= lt!458924 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11592 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41360 lt!458925) #b00000000000000000000000000000000 Nil!21940))))

(declare-fun arrayCountValidKeys!0 (array!65625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041444 (= (arrayCountValidKeys!0 lt!458923 #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041444 (= lt!458923 (array!65626 (store (arr!31573 (_keys!11592 thiss!1427)) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32105 (_keys!11592 thiss!1427))))))

(declare-fun lt!458926 () Unit!34013)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65625 (_ BitVec 32) (_ BitVec 64)) Unit!34013)

(assert (=> b!1041444 (= lt!458926 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11592 thiss!1427) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!694021 () Bool)

(declare-fun e!589659 () Bool)

(assert (=> start!91348 (=> (not res!694021) (not e!589659))))

(declare-fun valid!2229 (LongMapFixedSize!5908) Bool)

(assert (=> start!91348 (= res!694021 (valid!2229 thiss!1427))))

(assert (=> start!91348 e!589659))

(declare-fun e!589654 () Bool)

(assert (=> start!91348 e!589654))

(assert (=> start!91348 true))

(declare-fun mapNonEmpty!38656 () Bool)

(declare-fun mapRes!38656 () Bool)

(declare-fun tp!74194 () Bool)

(declare-fun e!589660 () Bool)

(assert (=> mapNonEmpty!38656 (= mapRes!38656 (and tp!74194 e!589660))))

(declare-fun mapValue!38656 () ValueCell!11657)

(declare-fun mapRest!38656 () (Array (_ BitVec 32) ValueCell!11657))

(declare-fun mapKey!38656 () (_ BitVec 32))

(assert (=> mapNonEmpty!38656 (= (arr!31574 (_values!6359 thiss!1427)) (store mapRest!38656 mapKey!38656 mapValue!38656))))

(declare-fun e!589657 () Bool)

(declare-fun array_inv!24415 (array!65625) Bool)

(declare-fun array_inv!24416 (array!65627) Bool)

(assert (=> b!1041445 (= e!589654 (and tp!74195 tp_is_empty!24721 (array_inv!24415 (_keys!11592 thiss!1427)) (array_inv!24416 (_values!6359 thiss!1427)) e!589657))))

(declare-fun b!1041446 () Bool)

(assert (=> b!1041446 (= e!589657 (and e!589656 mapRes!38656))))

(declare-fun condMapEmpty!38656 () Bool)

(declare-fun mapDefault!38656 () ValueCell!11657)

(assert (=> b!1041446 (= condMapEmpty!38656 (= (arr!31574 (_values!6359 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11657)) mapDefault!38656)))))

(declare-fun b!1041447 () Bool)

(assert (=> b!1041447 (= e!589660 tp_is_empty!24721)))

(declare-fun b!1041448 () Bool)

(assert (=> b!1041448 (= e!589655 (arrayNoDuplicates!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 Nil!21940))))

(declare-fun mapIsEmpty!38656 () Bool)

(assert (=> mapIsEmpty!38656 mapRes!38656))

(declare-fun b!1041449 () Bool)

(assert (=> b!1041449 (= e!589659 e!589658)))

(declare-fun res!694020 () Bool)

(assert (=> b!1041449 (=> (not res!694020) (not e!589658))))

(get-info :version)

(assert (=> b!1041449 (= res!694020 ((_ is Found!9747) lt!458925))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65625 (_ BitVec 32)) SeekEntryResult!9747)

(assert (=> b!1041449 (= lt!458925 (seekEntry!0 key!909 (_keys!11592 thiss!1427) (mask!30382 thiss!1427)))))

(declare-fun b!1041450 () Bool)

(declare-fun res!694018 () Bool)

(assert (=> b!1041450 (=> (not res!694018) (not e!589659))))

(assert (=> b!1041450 (= res!694018 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91348 res!694021) b!1041450))

(assert (= (and b!1041450 res!694018) b!1041449))

(assert (= (and b!1041449 res!694020) b!1041444))

(assert (= (and b!1041444 (not res!694019)) b!1041448))

(assert (= (and b!1041446 condMapEmpty!38656) mapIsEmpty!38656))

(assert (= (and b!1041446 (not condMapEmpty!38656)) mapNonEmpty!38656))

(assert (= (and mapNonEmpty!38656 ((_ is ValueCellFull!11657) mapValue!38656)) b!1041447))

(assert (= (and b!1041446 ((_ is ValueCellFull!11657) mapDefault!38656)) b!1041443))

(assert (= b!1041445 b!1041446))

(assert (= start!91348 b!1041445))

(declare-fun m!961389 () Bool)

(assert (=> b!1041448 m!961389))

(declare-fun m!961391 () Bool)

(assert (=> b!1041444 m!961391))

(declare-fun m!961393 () Bool)

(assert (=> b!1041444 m!961393))

(declare-fun m!961395 () Bool)

(assert (=> b!1041444 m!961395))

(declare-fun m!961397 () Bool)

(assert (=> b!1041444 m!961397))

(declare-fun m!961399 () Bool)

(assert (=> b!1041444 m!961399))

(declare-fun m!961401 () Bool)

(assert (=> b!1041444 m!961401))

(declare-fun m!961403 () Bool)

(assert (=> b!1041444 m!961403))

(declare-fun m!961405 () Bool)

(assert (=> b!1041444 m!961405))

(declare-fun m!961407 () Bool)

(assert (=> start!91348 m!961407))

(declare-fun m!961409 () Bool)

(assert (=> mapNonEmpty!38656 m!961409))

(declare-fun m!961411 () Bool)

(assert (=> b!1041449 m!961411))

(declare-fun m!961413 () Bool)

(assert (=> b!1041445 m!961413))

(declare-fun m!961415 () Bool)

(assert (=> b!1041445 m!961415))

(check-sat (not mapNonEmpty!38656) (not b_next!21001) (not b!1041448) (not b!1041449) b_and!33543 (not b!1041445) (not b!1041444) tp_is_empty!24721 (not start!91348))
(check-sat b_and!33543 (not b_next!21001))
(get-model)

(declare-fun b!1041511 () Bool)

(declare-fun e!589718 () SeekEntryResult!9747)

(declare-fun lt!458967 () SeekEntryResult!9747)

(assert (=> b!1041511 (= e!589718 (ite ((_ is MissingVacant!9747) lt!458967) (MissingZero!9747 (index!41362 lt!458967)) lt!458967))))

(declare-fun lt!458965 () SeekEntryResult!9747)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65625 (_ BitVec 32)) SeekEntryResult!9747)

(assert (=> b!1041511 (= lt!458967 (seekKeyOrZeroReturnVacant!0 (x!92825 lt!458965) (index!41361 lt!458965) (index!41361 lt!458965) key!909 (_keys!11592 thiss!1427) (mask!30382 thiss!1427)))))

(declare-fun b!1041512 () Bool)

(declare-fun c!105861 () Bool)

(declare-fun lt!458968 () (_ BitVec 64))

(assert (=> b!1041512 (= c!105861 (= lt!458968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589717 () SeekEntryResult!9747)

(assert (=> b!1041512 (= e!589717 e!589718)))

(declare-fun b!1041513 () Bool)

(declare-fun e!589716 () SeekEntryResult!9747)

(assert (=> b!1041513 (= e!589716 Undefined!9747)))

(declare-fun b!1041514 () Bool)

(assert (=> b!1041514 (= e!589716 e!589717)))

(assert (=> b!1041514 (= lt!458968 (select (arr!31573 (_keys!11592 thiss!1427)) (index!41361 lt!458965)))))

(declare-fun c!105860 () Bool)

(assert (=> b!1041514 (= c!105860 (= lt!458968 key!909))))

(declare-fun b!1041515 () Bool)

(assert (=> b!1041515 (= e!589718 (MissingZero!9747 (index!41361 lt!458965)))))

(declare-fun d!126069 () Bool)

(declare-fun lt!458966 () SeekEntryResult!9747)

(assert (=> d!126069 (and (or ((_ is MissingVacant!9747) lt!458966) (not ((_ is Found!9747) lt!458966)) (and (bvsge (index!41360 lt!458966) #b00000000000000000000000000000000) (bvslt (index!41360 lt!458966) (size!32105 (_keys!11592 thiss!1427))))) (not ((_ is MissingVacant!9747) lt!458966)) (or (not ((_ is Found!9747) lt!458966)) (= (select (arr!31573 (_keys!11592 thiss!1427)) (index!41360 lt!458966)) key!909)))))

(assert (=> d!126069 (= lt!458966 e!589716)))

(declare-fun c!105859 () Bool)

(assert (=> d!126069 (= c!105859 (and ((_ is Intermediate!9747) lt!458965) (undefined!10559 lt!458965)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65625 (_ BitVec 32)) SeekEntryResult!9747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126069 (= lt!458965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30382 thiss!1427)) key!909 (_keys!11592 thiss!1427) (mask!30382 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126069 (validMask!0 (mask!30382 thiss!1427))))

(assert (=> d!126069 (= (seekEntry!0 key!909 (_keys!11592 thiss!1427) (mask!30382 thiss!1427)) lt!458966)))

(declare-fun b!1041516 () Bool)

(assert (=> b!1041516 (= e!589717 (Found!9747 (index!41361 lt!458965)))))

(assert (= (and d!126069 c!105859) b!1041513))

(assert (= (and d!126069 (not c!105859)) b!1041514))

(assert (= (and b!1041514 c!105860) b!1041516))

(assert (= (and b!1041514 (not c!105860)) b!1041512))

(assert (= (and b!1041512 c!105861) b!1041515))

(assert (= (and b!1041512 (not c!105861)) b!1041511))

(declare-fun m!961473 () Bool)

(assert (=> b!1041511 m!961473))

(declare-fun m!961475 () Bool)

(assert (=> b!1041514 m!961475))

(declare-fun m!961477 () Bool)

(assert (=> d!126069 m!961477))

(declare-fun m!961479 () Bool)

(assert (=> d!126069 m!961479))

(assert (=> d!126069 m!961479))

(declare-fun m!961481 () Bool)

(assert (=> d!126069 m!961481))

(declare-fun m!961483 () Bool)

(assert (=> d!126069 m!961483))

(assert (=> b!1041449 d!126069))

(declare-fun d!126071 () Bool)

(assert (=> d!126071 (= (array_inv!24415 (_keys!11592 thiss!1427)) (bvsge (size!32105 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041445 d!126071))

(declare-fun d!126073 () Bool)

(assert (=> d!126073 (= (array_inv!24416 (_values!6359 thiss!1427)) (bvsge (size!32106 (_values!6359 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041445 d!126073))

(declare-fun d!126075 () Bool)

(declare-fun res!694052 () Bool)

(declare-fun e!589721 () Bool)

(assert (=> d!126075 (=> (not res!694052) (not e!589721))))

(declare-fun simpleValid!432 (LongMapFixedSize!5908) Bool)

(assert (=> d!126075 (= res!694052 (simpleValid!432 thiss!1427))))

(assert (=> d!126075 (= (valid!2229 thiss!1427) e!589721)))

(declare-fun b!1041523 () Bool)

(declare-fun res!694053 () Bool)

(assert (=> b!1041523 (=> (not res!694053) (not e!589721))))

(assert (=> b!1041523 (= res!694053 (= (arrayCountValidKeys!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) (_size!3009 thiss!1427)))))

(declare-fun b!1041524 () Bool)

(declare-fun res!694054 () Bool)

(assert (=> b!1041524 (=> (not res!694054) (not e!589721))))

(assert (=> b!1041524 (= res!694054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11592 thiss!1427) (mask!30382 thiss!1427)))))

(declare-fun b!1041525 () Bool)

(assert (=> b!1041525 (= e!589721 (arrayNoDuplicates!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 Nil!21940))))

(assert (= (and d!126075 res!694052) b!1041523))

(assert (= (and b!1041523 res!694053) b!1041524))

(assert (= (and b!1041524 res!694054) b!1041525))

(declare-fun m!961485 () Bool)

(assert (=> d!126075 m!961485))

(assert (=> b!1041523 m!961397))

(declare-fun m!961487 () Bool)

(assert (=> b!1041524 m!961487))

(assert (=> b!1041525 m!961389))

(assert (=> start!91348 d!126075))

(declare-fun b!1041536 () Bool)

(declare-fun e!589733 () Bool)

(declare-fun call!44104 () Bool)

(assert (=> b!1041536 (= e!589733 call!44104)))

(declare-fun b!1041537 () Bool)

(assert (=> b!1041537 (= e!589733 call!44104)))

(declare-fun b!1041538 () Bool)

(declare-fun e!589730 () Bool)

(declare-fun e!589731 () Bool)

(assert (=> b!1041538 (= e!589730 e!589731)))

(declare-fun res!694062 () Bool)

(assert (=> b!1041538 (=> (not res!694062) (not e!589731))))

(declare-fun e!589732 () Bool)

(assert (=> b!1041538 (= res!694062 (not e!589732))))

(declare-fun res!694061 () Bool)

(assert (=> b!1041538 (=> (not res!694061) (not e!589732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041538 (= res!694061 (validKeyInArray!0 (select (arr!31573 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126077 () Bool)

(declare-fun res!694063 () Bool)

(assert (=> d!126077 (=> res!694063 e!589730)))

(assert (=> d!126077 (= res!694063 (bvsge #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))))))

(assert (=> d!126077 (= (arrayNoDuplicates!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 Nil!21940) e!589730)))

(declare-fun b!1041539 () Bool)

(assert (=> b!1041539 (= e!589731 e!589733)))

(declare-fun c!105864 () Bool)

(assert (=> b!1041539 (= c!105864 (validKeyInArray!0 (select (arr!31573 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041540 () Bool)

(declare-fun contains!6074 (List!21943 (_ BitVec 64)) Bool)

(assert (=> b!1041540 (= e!589732 (contains!6074 Nil!21940 (select (arr!31573 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44101 () Bool)

(assert (=> bm!44101 (= call!44104 (arrayNoDuplicates!0 (_keys!11592 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105864 (Cons!21939 (select (arr!31573 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000) Nil!21940) Nil!21940)))))

(assert (= (and d!126077 (not res!694063)) b!1041538))

(assert (= (and b!1041538 res!694061) b!1041540))

(assert (= (and b!1041538 res!694062) b!1041539))

(assert (= (and b!1041539 c!105864) b!1041537))

(assert (= (and b!1041539 (not c!105864)) b!1041536))

(assert (= (or b!1041537 b!1041536) bm!44101))

(declare-fun m!961489 () Bool)

(assert (=> b!1041538 m!961489))

(assert (=> b!1041538 m!961489))

(declare-fun m!961491 () Bool)

(assert (=> b!1041538 m!961491))

(assert (=> b!1041539 m!961489))

(assert (=> b!1041539 m!961489))

(assert (=> b!1041539 m!961491))

(assert (=> b!1041540 m!961489))

(assert (=> b!1041540 m!961489))

(declare-fun m!961493 () Bool)

(assert (=> b!1041540 m!961493))

(assert (=> bm!44101 m!961489))

(declare-fun m!961495 () Bool)

(assert (=> bm!44101 m!961495))

(assert (=> b!1041448 d!126077))

(declare-fun d!126079 () Bool)

(declare-fun e!589736 () Bool)

(assert (=> d!126079 e!589736))

(declare-fun res!694066 () Bool)

(assert (=> d!126079 (=> (not res!694066) (not e!589736))))

(assert (=> d!126079 (= res!694066 (and (bvsge (index!41360 lt!458925) #b00000000000000000000000000000000) (bvslt (index!41360 lt!458925) (size!32105 (_keys!11592 thiss!1427)))))))

(declare-fun lt!458971 () Unit!34013)

(declare-fun choose!25 (array!65625 (_ BitVec 32) (_ BitVec 32)) Unit!34013)

(assert (=> d!126079 (= lt!458971 (choose!25 (_keys!11592 thiss!1427) (index!41360 lt!458925) (mask!30382 thiss!1427)))))

(assert (=> d!126079 (validMask!0 (mask!30382 thiss!1427))))

(assert (=> d!126079 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11592 thiss!1427) (index!41360 lt!458925) (mask!30382 thiss!1427)) lt!458971)))

(declare-fun b!1041543 () Bool)

(assert (=> b!1041543 (= e!589736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65626 (store (arr!31573 (_keys!11592 thiss!1427)) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32105 (_keys!11592 thiss!1427))) (mask!30382 thiss!1427)))))

(assert (= (and d!126079 res!694066) b!1041543))

(declare-fun m!961497 () Bool)

(assert (=> d!126079 m!961497))

(assert (=> d!126079 m!961483))

(assert (=> b!1041543 m!961403))

(declare-fun m!961499 () Bool)

(assert (=> b!1041543 m!961499))

(assert (=> b!1041444 d!126079))

(declare-fun b!1041552 () Bool)

(declare-fun res!694076 () Bool)

(declare-fun e!589741 () Bool)

(assert (=> b!1041552 (=> (not res!694076) (not e!589741))))

(assert (=> b!1041552 (= res!694076 (validKeyInArray!0 (select (arr!31573 (_keys!11592 thiss!1427)) (index!41360 lt!458925))))))

(declare-fun b!1041553 () Bool)

(declare-fun res!694078 () Bool)

(assert (=> b!1041553 (=> (not res!694078) (not e!589741))))

(assert (=> b!1041553 (= res!694078 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041554 () Bool)

(assert (=> b!1041554 (= e!589741 (bvslt (size!32105 (_keys!11592 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041555 () Bool)

(declare-fun e!589742 () Bool)

(assert (=> b!1041555 (= e!589742 (= (arrayCountValidKeys!0 (array!65626 (store (arr!31573 (_keys!11592 thiss!1427)) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32105 (_keys!11592 thiss!1427))) #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126081 () Bool)

(assert (=> d!126081 e!589742))

(declare-fun res!694075 () Bool)

(assert (=> d!126081 (=> (not res!694075) (not e!589742))))

(assert (=> d!126081 (= res!694075 (and (bvsge (index!41360 lt!458925) #b00000000000000000000000000000000) (bvslt (index!41360 lt!458925) (size!32105 (_keys!11592 thiss!1427)))))))

(declare-fun lt!458974 () Unit!34013)

(declare-fun choose!82 (array!65625 (_ BitVec 32) (_ BitVec 64)) Unit!34013)

(assert (=> d!126081 (= lt!458974 (choose!82 (_keys!11592 thiss!1427) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126081 e!589741))

(declare-fun res!694077 () Bool)

(assert (=> d!126081 (=> (not res!694077) (not e!589741))))

(assert (=> d!126081 (= res!694077 (and (bvsge (index!41360 lt!458925) #b00000000000000000000000000000000) (bvslt (index!41360 lt!458925) (size!32105 (_keys!11592 thiss!1427)))))))

(assert (=> d!126081 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11592 thiss!1427) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458974)))

(assert (= (and d!126081 res!694077) b!1041552))

(assert (= (and b!1041552 res!694076) b!1041553))

(assert (= (and b!1041553 res!694078) b!1041554))

(assert (= (and d!126081 res!694075) b!1041555))

(declare-fun m!961501 () Bool)

(assert (=> b!1041552 m!961501))

(assert (=> b!1041552 m!961501))

(declare-fun m!961503 () Bool)

(assert (=> b!1041552 m!961503))

(declare-fun m!961505 () Bool)

(assert (=> b!1041553 m!961505))

(assert (=> b!1041555 m!961403))

(declare-fun m!961507 () Bool)

(assert (=> b!1041555 m!961507))

(assert (=> b!1041555 m!961397))

(declare-fun m!961509 () Bool)

(assert (=> d!126081 m!961509))

(assert (=> b!1041444 d!126081))

(declare-fun b!1041556 () Bool)

(declare-fun e!589746 () Bool)

(declare-fun call!44105 () Bool)

(assert (=> b!1041556 (= e!589746 call!44105)))

(declare-fun b!1041557 () Bool)

(assert (=> b!1041557 (= e!589746 call!44105)))

(declare-fun b!1041558 () Bool)

(declare-fun e!589743 () Bool)

(declare-fun e!589744 () Bool)

(assert (=> b!1041558 (= e!589743 e!589744)))

(declare-fun res!694080 () Bool)

(assert (=> b!1041558 (=> (not res!694080) (not e!589744))))

(declare-fun e!589745 () Bool)

(assert (=> b!1041558 (= res!694080 (not e!589745))))

(declare-fun res!694079 () Bool)

(assert (=> b!1041558 (=> (not res!694079) (not e!589745))))

(assert (=> b!1041558 (= res!694079 (validKeyInArray!0 (select (arr!31573 lt!458923) #b00000000000000000000000000000000)))))

(declare-fun d!126083 () Bool)

(declare-fun res!694081 () Bool)

(assert (=> d!126083 (=> res!694081 e!589743)))

(assert (=> d!126083 (= res!694081 (bvsge #b00000000000000000000000000000000 (size!32105 lt!458923)))))

(assert (=> d!126083 (= (arrayNoDuplicates!0 lt!458923 #b00000000000000000000000000000000 Nil!21940) e!589743)))

(declare-fun b!1041559 () Bool)

(assert (=> b!1041559 (= e!589744 e!589746)))

(declare-fun c!105865 () Bool)

(assert (=> b!1041559 (= c!105865 (validKeyInArray!0 (select (arr!31573 lt!458923) #b00000000000000000000000000000000)))))

(declare-fun b!1041560 () Bool)

(assert (=> b!1041560 (= e!589745 (contains!6074 Nil!21940 (select (arr!31573 lt!458923) #b00000000000000000000000000000000)))))

(declare-fun bm!44102 () Bool)

(assert (=> bm!44102 (= call!44105 (arrayNoDuplicates!0 lt!458923 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105865 (Cons!21939 (select (arr!31573 lt!458923) #b00000000000000000000000000000000) Nil!21940) Nil!21940)))))

(assert (= (and d!126083 (not res!694081)) b!1041558))

(assert (= (and b!1041558 res!694079) b!1041560))

(assert (= (and b!1041558 res!694080) b!1041559))

(assert (= (and b!1041559 c!105865) b!1041557))

(assert (= (and b!1041559 (not c!105865)) b!1041556))

(assert (= (or b!1041557 b!1041556) bm!44102))

(declare-fun m!961511 () Bool)

(assert (=> b!1041558 m!961511))

(assert (=> b!1041558 m!961511))

(declare-fun m!961513 () Bool)

(assert (=> b!1041558 m!961513))

(assert (=> b!1041559 m!961511))

(assert (=> b!1041559 m!961511))

(assert (=> b!1041559 m!961513))

(assert (=> b!1041560 m!961511))

(assert (=> b!1041560 m!961511))

(declare-fun m!961515 () Bool)

(assert (=> b!1041560 m!961515))

(assert (=> bm!44102 m!961511))

(declare-fun m!961517 () Bool)

(assert (=> bm!44102 m!961517))

(assert (=> b!1041444 d!126083))

(declare-fun b!1041569 () Bool)

(declare-fun e!589755 () Bool)

(declare-fun call!44108 () Bool)

(assert (=> b!1041569 (= e!589755 call!44108)))

(declare-fun b!1041570 () Bool)

(declare-fun e!589753 () Bool)

(assert (=> b!1041570 (= e!589753 call!44108)))

(declare-fun d!126085 () Bool)

(declare-fun res!694087 () Bool)

(declare-fun e!589754 () Bool)

(assert (=> d!126085 (=> res!694087 e!589754)))

(assert (=> d!126085 (= res!694087 (bvsge #b00000000000000000000000000000000 (size!32105 lt!458923)))))

(assert (=> d!126085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458923 (mask!30382 thiss!1427)) e!589754)))

(declare-fun b!1041571 () Bool)

(assert (=> b!1041571 (= e!589754 e!589753)))

(declare-fun c!105868 () Bool)

(assert (=> b!1041571 (= c!105868 (validKeyInArray!0 (select (arr!31573 lt!458923) #b00000000000000000000000000000000)))))

(declare-fun b!1041572 () Bool)

(assert (=> b!1041572 (= e!589753 e!589755)))

(declare-fun lt!458981 () (_ BitVec 64))

(assert (=> b!1041572 (= lt!458981 (select (arr!31573 lt!458923) #b00000000000000000000000000000000))))

(declare-fun lt!458983 () Unit!34013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65625 (_ BitVec 64) (_ BitVec 32)) Unit!34013)

(assert (=> b!1041572 (= lt!458983 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458923 lt!458981 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041572 (arrayContainsKey!0 lt!458923 lt!458981 #b00000000000000000000000000000000)))

(declare-fun lt!458982 () Unit!34013)

(assert (=> b!1041572 (= lt!458982 lt!458983)))

(declare-fun res!694086 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65625 (_ BitVec 32)) SeekEntryResult!9747)

(assert (=> b!1041572 (= res!694086 (= (seekEntryOrOpen!0 (select (arr!31573 lt!458923) #b00000000000000000000000000000000) lt!458923 (mask!30382 thiss!1427)) (Found!9747 #b00000000000000000000000000000000)))))

(assert (=> b!1041572 (=> (not res!694086) (not e!589755))))

(declare-fun bm!44105 () Bool)

(assert (=> bm!44105 (= call!44108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458923 (mask!30382 thiss!1427)))))

(assert (= (and d!126085 (not res!694087)) b!1041571))

(assert (= (and b!1041571 c!105868) b!1041572))

(assert (= (and b!1041571 (not c!105868)) b!1041570))

(assert (= (and b!1041572 res!694086) b!1041569))

(assert (= (or b!1041569 b!1041570) bm!44105))

(assert (=> b!1041571 m!961511))

(assert (=> b!1041571 m!961511))

(assert (=> b!1041571 m!961513))

(assert (=> b!1041572 m!961511))

(declare-fun m!961519 () Bool)

(assert (=> b!1041572 m!961519))

(declare-fun m!961521 () Bool)

(assert (=> b!1041572 m!961521))

(assert (=> b!1041572 m!961511))

(declare-fun m!961523 () Bool)

(assert (=> b!1041572 m!961523))

(declare-fun m!961525 () Bool)

(assert (=> bm!44105 m!961525))

(assert (=> b!1041444 d!126085))

(declare-fun b!1041581 () Bool)

(declare-fun e!589761 () (_ BitVec 32))

(assert (=> b!1041581 (= e!589761 #b00000000000000000000000000000000)))

(declare-fun d!126087 () Bool)

(declare-fun lt!458986 () (_ BitVec 32))

(assert (=> d!126087 (and (bvsge lt!458986 #b00000000000000000000000000000000) (bvsle lt!458986 (bvsub (size!32105 lt!458923) #b00000000000000000000000000000000)))))

(assert (=> d!126087 (= lt!458986 e!589761)))

(declare-fun c!105874 () Bool)

(assert (=> d!126087 (= c!105874 (bvsge #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))))))

(assert (=> d!126087 (and (bvsle #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32105 (_keys!11592 thiss!1427)) (size!32105 lt!458923)))))

(assert (=> d!126087 (= (arrayCountValidKeys!0 lt!458923 #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) lt!458986)))

(declare-fun b!1041582 () Bool)

(declare-fun e!589760 () (_ BitVec 32))

(declare-fun call!44111 () (_ BitVec 32))

(assert (=> b!1041582 (= e!589760 call!44111)))

(declare-fun bm!44108 () Bool)

(assert (=> bm!44108 (= call!44111 (arrayCountValidKeys!0 lt!458923 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32105 (_keys!11592 thiss!1427))))))

(declare-fun b!1041583 () Bool)

(assert (=> b!1041583 (= e!589761 e!589760)))

(declare-fun c!105873 () Bool)

(assert (=> b!1041583 (= c!105873 (validKeyInArray!0 (select (arr!31573 lt!458923) #b00000000000000000000000000000000)))))

(declare-fun b!1041584 () Bool)

(assert (=> b!1041584 (= e!589760 (bvadd #b00000000000000000000000000000001 call!44111))))

(assert (= (and d!126087 c!105874) b!1041581))

(assert (= (and d!126087 (not c!105874)) b!1041583))

(assert (= (and b!1041583 c!105873) b!1041584))

(assert (= (and b!1041583 (not c!105873)) b!1041582))

(assert (= (or b!1041584 b!1041582) bm!44108))

(declare-fun m!961527 () Bool)

(assert (=> bm!44108 m!961527))

(assert (=> b!1041583 m!961511))

(assert (=> b!1041583 m!961511))

(assert (=> b!1041583 m!961513))

(assert (=> b!1041444 d!126087))

(declare-fun b!1041585 () Bool)

(declare-fun e!589763 () (_ BitVec 32))

(assert (=> b!1041585 (= e!589763 #b00000000000000000000000000000000)))

(declare-fun d!126089 () Bool)

(declare-fun lt!458987 () (_ BitVec 32))

(assert (=> d!126089 (and (bvsge lt!458987 #b00000000000000000000000000000000) (bvsle lt!458987 (bvsub (size!32105 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126089 (= lt!458987 e!589763)))

(declare-fun c!105876 () Bool)

(assert (=> d!126089 (= c!105876 (bvsge #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))))))

(assert (=> d!126089 (and (bvsle #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32105 (_keys!11592 thiss!1427)) (size!32105 (_keys!11592 thiss!1427))))))

(assert (=> d!126089 (= (arrayCountValidKeys!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 (size!32105 (_keys!11592 thiss!1427))) lt!458987)))

(declare-fun b!1041586 () Bool)

(declare-fun e!589762 () (_ BitVec 32))

(declare-fun call!44112 () (_ BitVec 32))

(assert (=> b!1041586 (= e!589762 call!44112)))

(declare-fun bm!44109 () Bool)

(assert (=> bm!44109 (= call!44112 (arrayCountValidKeys!0 (_keys!11592 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32105 (_keys!11592 thiss!1427))))))

(declare-fun b!1041587 () Bool)

(assert (=> b!1041587 (= e!589763 e!589762)))

(declare-fun c!105875 () Bool)

(assert (=> b!1041587 (= c!105875 (validKeyInArray!0 (select (arr!31573 (_keys!11592 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041588 () Bool)

(assert (=> b!1041588 (= e!589762 (bvadd #b00000000000000000000000000000001 call!44112))))

(assert (= (and d!126089 c!105876) b!1041585))

(assert (= (and d!126089 (not c!105876)) b!1041587))

(assert (= (and b!1041587 c!105875) b!1041588))

(assert (= (and b!1041587 (not c!105875)) b!1041586))

(assert (= (or b!1041588 b!1041586) bm!44109))

(declare-fun m!961529 () Bool)

(assert (=> bm!44109 m!961529))

(assert (=> b!1041587 m!961489))

(assert (=> b!1041587 m!961489))

(assert (=> b!1041587 m!961491))

(assert (=> b!1041444 d!126089))

(declare-fun d!126091 () Bool)

(declare-fun e!589766 () Bool)

(assert (=> d!126091 e!589766))

(declare-fun res!694090 () Bool)

(assert (=> d!126091 (=> (not res!694090) (not e!589766))))

(assert (=> d!126091 (= res!694090 (and (bvsge (index!41360 lt!458925) #b00000000000000000000000000000000) (bvslt (index!41360 lt!458925) (size!32105 (_keys!11592 thiss!1427)))))))

(declare-fun lt!458990 () Unit!34013)

(declare-fun choose!53 (array!65625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21943) Unit!34013)

(assert (=> d!126091 (= lt!458990 (choose!53 (_keys!11592 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41360 lt!458925) #b00000000000000000000000000000000 Nil!21940))))

(assert (=> d!126091 (bvslt (size!32105 (_keys!11592 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126091 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11592 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41360 lt!458925) #b00000000000000000000000000000000 Nil!21940) lt!458990)))

(declare-fun b!1041591 () Bool)

(assert (=> b!1041591 (= e!589766 (arrayNoDuplicates!0 (array!65626 (store (arr!31573 (_keys!11592 thiss!1427)) (index!41360 lt!458925) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32105 (_keys!11592 thiss!1427))) #b00000000000000000000000000000000 Nil!21940))))

(assert (= (and d!126091 res!694090) b!1041591))

(declare-fun m!961531 () Bool)

(assert (=> d!126091 m!961531))

(assert (=> b!1041591 m!961403))

(declare-fun m!961533 () Bool)

(assert (=> b!1041591 m!961533))

(assert (=> b!1041444 d!126091))

(declare-fun mapNonEmpty!38665 () Bool)

(declare-fun mapRes!38665 () Bool)

(declare-fun tp!74210 () Bool)

(declare-fun e!589771 () Bool)

(assert (=> mapNonEmpty!38665 (= mapRes!38665 (and tp!74210 e!589771))))

(declare-fun mapRest!38665 () (Array (_ BitVec 32) ValueCell!11657))

(declare-fun mapKey!38665 () (_ BitVec 32))

(declare-fun mapValue!38665 () ValueCell!11657)

(assert (=> mapNonEmpty!38665 (= mapRest!38656 (store mapRest!38665 mapKey!38665 mapValue!38665))))

(declare-fun mapIsEmpty!38665 () Bool)

(assert (=> mapIsEmpty!38665 mapRes!38665))

(declare-fun b!1041599 () Bool)

(declare-fun e!589772 () Bool)

(assert (=> b!1041599 (= e!589772 tp_is_empty!24721)))

(declare-fun b!1041598 () Bool)

(assert (=> b!1041598 (= e!589771 tp_is_empty!24721)))

(declare-fun condMapEmpty!38665 () Bool)

(declare-fun mapDefault!38665 () ValueCell!11657)

(assert (=> mapNonEmpty!38656 (= condMapEmpty!38665 (= mapRest!38656 ((as const (Array (_ BitVec 32) ValueCell!11657)) mapDefault!38665)))))

(assert (=> mapNonEmpty!38656 (= tp!74194 (and e!589772 mapRes!38665))))

(assert (= (and mapNonEmpty!38656 condMapEmpty!38665) mapIsEmpty!38665))

(assert (= (and mapNonEmpty!38656 (not condMapEmpty!38665)) mapNonEmpty!38665))

(assert (= (and mapNonEmpty!38665 ((_ is ValueCellFull!11657) mapValue!38665)) b!1041598))

(assert (= (and mapNonEmpty!38656 ((_ is ValueCellFull!11657) mapDefault!38665)) b!1041599))

(declare-fun m!961535 () Bool)

(assert (=> mapNonEmpty!38665 m!961535))

(check-sat (not d!126079) (not b!1041572) (not bm!44101) (not b_next!21001) (not b!1041591) (not d!126091) tp_is_empty!24721 b_and!33543 (not b!1041571) (not d!126075) (not bm!44108) (not b!1041539) (not b!1041543) (not bm!44102) (not b!1041587) (not b!1041552) (not b!1041511) (not bm!44109) (not d!126081) (not b!1041558) (not b!1041559) (not b!1041524) (not b!1041555) (not b!1041523) (not b!1041538) (not b!1041553) (not b!1041525) (not b!1041583) (not bm!44105) (not d!126069) (not mapNonEmpty!38665) (not b!1041540) (not b!1041560))
(check-sat b_and!33543 (not b_next!21001))
