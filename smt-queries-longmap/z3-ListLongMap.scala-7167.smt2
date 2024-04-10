; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91486 () Bool)

(assert start!91486)

(declare-fun b!1042273 () Bool)

(declare-fun b_free!21057 () Bool)

(declare-fun b_next!21057 () Bool)

(assert (=> b!1042273 (= b_free!21057 (not b_next!21057))))

(declare-fun tp!74393 () Bool)

(declare-fun b_and!33589 () Bool)

(assert (=> b!1042273 (= tp!74393 b_and!33589)))

(declare-fun b!1042268 () Bool)

(declare-fun e!590382 () Bool)

(declare-fun e!590385 () Bool)

(declare-fun mapRes!38771 () Bool)

(assert (=> b!1042268 (= e!590382 (and e!590385 mapRes!38771))))

(declare-fun condMapEmpty!38771 () Bool)

(declare-datatypes ((V!37909 0))(
  ( (V!37910 (val!12439 Int)) )
))
(declare-datatypes ((ValueCell!11685 0))(
  ( (ValueCellFull!11685 (v!15030 V!37909)) (EmptyCell!11685) )
))
(declare-datatypes ((array!65706 0))(
  ( (array!65707 (arr!31611 (Array (_ BitVec 32) (_ BitVec 64))) (size!32146 (_ BitVec 32))) )
))
(declare-datatypes ((array!65708 0))(
  ( (array!65709 (arr!31612 (Array (_ BitVec 32) ValueCell!11685)) (size!32147 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5964 0))(
  ( (LongMapFixedSize!5965 (defaultEntry!6364 Int) (mask!30421 (_ BitVec 32)) (extraKeys!6092 (_ BitVec 32)) (zeroValue!6198 V!37909) (minValue!6198 V!37909) (_size!3037 (_ BitVec 32)) (_keys!11612 array!65706) (_values!6387 array!65708) (_vacant!3037 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5964)

(declare-fun mapDefault!38771 () ValueCell!11685)

(assert (=> b!1042268 (= condMapEmpty!38771 (= (arr!31612 (_values!6387 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11685)) mapDefault!38771)))))

(declare-fun b!1042269 () Bool)

(declare-fun res!694508 () Bool)

(declare-fun e!590380 () Bool)

(assert (=> b!1042269 (=> (not res!694508) (not e!590380))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042269 (= res!694508 (not (= key!909 (bvneg key!909))))))

(declare-fun res!694505 () Bool)

(assert (=> start!91486 (=> (not res!694505) (not e!590380))))

(declare-fun valid!2241 (LongMapFixedSize!5964) Bool)

(assert (=> start!91486 (= res!694505 (valid!2241 thiss!1427))))

(assert (=> start!91486 e!590380))

(declare-fun e!590379 () Bool)

(assert (=> start!91486 e!590379))

(assert (=> start!91486 true))

(declare-fun b!1042270 () Bool)

(declare-fun e!590384 () Bool)

(declare-fun e!590386 () Bool)

(assert (=> b!1042270 (= e!590384 (not e!590386))))

(declare-fun res!694507 () Bool)

(assert (=> b!1042270 (=> res!694507 e!590386)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042270 (= res!694507 (not (validMask!0 (mask!30421 thiss!1427))))))

(declare-fun lt!459394 () array!65706)

(declare-fun arrayContainsKey!0 (array!65706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042270 (not (arrayContainsKey!0 lt!459394 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9814 0))(
  ( (MissingZero!9814 (index!41627 (_ BitVec 32))) (Found!9814 (index!41628 (_ BitVec 32))) (Intermediate!9814 (undefined!10626 Bool) (index!41629 (_ BitVec 32)) (x!93050 (_ BitVec 32))) (Undefined!9814) (MissingVacant!9814 (index!41630 (_ BitVec 32))) )
))
(declare-fun lt!459392 () SeekEntryResult!9814)

(declare-datatypes ((Unit!34043 0))(
  ( (Unit!34044) )
))
(declare-fun lt!459393 () Unit!34043)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65706 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> b!1042270 (= lt!459393 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11612 thiss!1427) (index!41628 lt!459392) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65706 (_ BitVec 32)) Bool)

(assert (=> b!1042270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459394 (mask!30421 thiss!1427))))

(declare-fun lt!459395 () Unit!34043)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65706 (_ BitVec 32) (_ BitVec 32)) Unit!34043)

(assert (=> b!1042270 (= lt!459395 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11612 thiss!1427) (index!41628 lt!459392) (mask!30421 thiss!1427)))))

(declare-datatypes ((List!21973 0))(
  ( (Nil!21970) (Cons!21969 (h!23177 (_ BitVec 64)) (t!31187 List!21973)) )
))
(declare-fun arrayNoDuplicates!0 (array!65706 (_ BitVec 32) List!21973) Bool)

(assert (=> b!1042270 (arrayNoDuplicates!0 lt!459394 #b00000000000000000000000000000000 Nil!21970)))

(declare-fun lt!459390 () Unit!34043)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21973) Unit!34043)

(assert (=> b!1042270 (= lt!459390 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41628 lt!459392) #b00000000000000000000000000000000 Nil!21970))))

(declare-fun arrayCountValidKeys!0 (array!65706 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042270 (= (arrayCountValidKeys!0 lt!459394 #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042270 (= lt!459394 (array!65707 (store (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32146 (_keys!11612 thiss!1427))))))

(declare-fun lt!459391 () Unit!34043)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65706 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> b!1042270 (= lt!459391 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11612 thiss!1427) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042271 () Bool)

(assert (=> b!1042271 (= e!590380 e!590384)))

(declare-fun res!694506 () Bool)

(assert (=> b!1042271 (=> (not res!694506) (not e!590384))))

(get-info :version)

(assert (=> b!1042271 (= res!694506 ((_ is Found!9814) lt!459392))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65706 (_ BitVec 32)) SeekEntryResult!9814)

(assert (=> b!1042271 (= lt!459392 (seekEntry!0 key!909 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)))))

(declare-fun b!1042272 () Bool)

(declare-fun tp_is_empty!24777 () Bool)

(assert (=> b!1042272 (= e!590385 tp_is_empty!24777)))

(declare-fun mapIsEmpty!38771 () Bool)

(assert (=> mapIsEmpty!38771 mapRes!38771))

(declare-fun array_inv!24425 (array!65706) Bool)

(declare-fun array_inv!24426 (array!65708) Bool)

(assert (=> b!1042273 (= e!590379 (and tp!74393 tp_is_empty!24777 (array_inv!24425 (_keys!11612 thiss!1427)) (array_inv!24426 (_values!6387 thiss!1427)) e!590382))))

(declare-fun b!1042274 () Bool)

(assert (=> b!1042274 (= e!590386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)))))

(declare-fun b!1042275 () Bool)

(declare-fun e!590383 () Bool)

(assert (=> b!1042275 (= e!590383 tp_is_empty!24777)))

(declare-fun b!1042276 () Bool)

(declare-fun res!694504 () Bool)

(assert (=> b!1042276 (=> res!694504 e!590386)))

(assert (=> b!1042276 (= res!694504 (or (not (= (size!32147 (_values!6387 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30421 thiss!1427)))) (not (= (size!32146 (_keys!11612 thiss!1427)) (size!32147 (_values!6387 thiss!1427)))) (bvslt (mask!30421 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6092 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6092 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38771 () Bool)

(declare-fun tp!74394 () Bool)

(assert (=> mapNonEmpty!38771 (= mapRes!38771 (and tp!74394 e!590383))))

(declare-fun mapRest!38771 () (Array (_ BitVec 32) ValueCell!11685))

(declare-fun mapKey!38771 () (_ BitVec 32))

(declare-fun mapValue!38771 () ValueCell!11685)

(assert (=> mapNonEmpty!38771 (= (arr!31612 (_values!6387 thiss!1427)) (store mapRest!38771 mapKey!38771 mapValue!38771))))

(assert (= (and start!91486 res!694505) b!1042269))

(assert (= (and b!1042269 res!694508) b!1042271))

(assert (= (and b!1042271 res!694506) b!1042270))

(assert (= (and b!1042270 (not res!694507)) b!1042276))

(assert (= (and b!1042276 (not res!694504)) b!1042274))

(assert (= (and b!1042268 condMapEmpty!38771) mapIsEmpty!38771))

(assert (= (and b!1042268 (not condMapEmpty!38771)) mapNonEmpty!38771))

(assert (= (and mapNonEmpty!38771 ((_ is ValueCellFull!11685) mapValue!38771)) b!1042275))

(assert (= (and b!1042268 ((_ is ValueCellFull!11685) mapDefault!38771)) b!1042272))

(assert (= b!1042273 b!1042268))

(assert (= start!91486 b!1042273))

(declare-fun m!961599 () Bool)

(assert (=> b!1042271 m!961599))

(declare-fun m!961601 () Bool)

(assert (=> b!1042270 m!961601))

(declare-fun m!961603 () Bool)

(assert (=> b!1042270 m!961603))

(declare-fun m!961605 () Bool)

(assert (=> b!1042270 m!961605))

(declare-fun m!961607 () Bool)

(assert (=> b!1042270 m!961607))

(declare-fun m!961609 () Bool)

(assert (=> b!1042270 m!961609))

(declare-fun m!961611 () Bool)

(assert (=> b!1042270 m!961611))

(declare-fun m!961613 () Bool)

(assert (=> b!1042270 m!961613))

(declare-fun m!961615 () Bool)

(assert (=> b!1042270 m!961615))

(declare-fun m!961617 () Bool)

(assert (=> b!1042270 m!961617))

(declare-fun m!961619 () Bool)

(assert (=> b!1042270 m!961619))

(declare-fun m!961621 () Bool)

(assert (=> b!1042270 m!961621))

(declare-fun m!961623 () Bool)

(assert (=> b!1042274 m!961623))

(declare-fun m!961625 () Bool)

(assert (=> b!1042273 m!961625))

(declare-fun m!961627 () Bool)

(assert (=> b!1042273 m!961627))

(declare-fun m!961629 () Bool)

(assert (=> mapNonEmpty!38771 m!961629))

(declare-fun m!961631 () Bool)

(assert (=> start!91486 m!961631))

(check-sat (not start!91486) (not b_next!21057) (not b!1042270) (not b!1042271) (not mapNonEmpty!38771) b_and!33589 (not b!1042273) (not b!1042274) tp_is_empty!24777)
(check-sat b_and!33589 (not b_next!21057))
(get-model)

(declare-fun d!126085 () Bool)

(assert (=> d!126085 (= (array_inv!24425 (_keys!11612 thiss!1427)) (bvsge (size!32146 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042273 d!126085))

(declare-fun d!126087 () Bool)

(assert (=> d!126087 (= (array_inv!24426 (_values!6387 thiss!1427)) (bvsge (size!32147 (_values!6387 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042273 d!126087))

(declare-fun d!126089 () Bool)

(declare-fun res!694530 () Bool)

(declare-fun e!590413 () Bool)

(assert (=> d!126089 (=> (not res!694530) (not e!590413))))

(declare-fun simpleValid!441 (LongMapFixedSize!5964) Bool)

(assert (=> d!126089 (= res!694530 (simpleValid!441 thiss!1427))))

(assert (=> d!126089 (= (valid!2241 thiss!1427) e!590413)))

(declare-fun b!1042310 () Bool)

(declare-fun res!694531 () Bool)

(assert (=> b!1042310 (=> (not res!694531) (not e!590413))))

(assert (=> b!1042310 (= res!694531 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) (_size!3037 thiss!1427)))))

(declare-fun b!1042311 () Bool)

(declare-fun res!694532 () Bool)

(assert (=> b!1042311 (=> (not res!694532) (not e!590413))))

(assert (=> b!1042311 (= res!694532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)))))

(declare-fun b!1042312 () Bool)

(assert (=> b!1042312 (= e!590413 (arrayNoDuplicates!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 Nil!21970))))

(assert (= (and d!126089 res!694530) b!1042310))

(assert (= (and b!1042310 res!694531) b!1042311))

(assert (= (and b!1042311 res!694532) b!1042312))

(declare-fun m!961667 () Bool)

(assert (=> d!126089 m!961667))

(assert (=> b!1042310 m!961609))

(assert (=> b!1042311 m!961623))

(declare-fun m!961669 () Bool)

(assert (=> b!1042312 m!961669))

(assert (=> start!91486 d!126089))

(declare-fun b!1042321 () Bool)

(declare-fun e!590420 () Bool)

(declare-fun call!44166 () Bool)

(assert (=> b!1042321 (= e!590420 call!44166)))

(declare-fun bm!44163 () Bool)

(assert (=> bm!44163 (= call!44166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11612 thiss!1427) (mask!30421 thiss!1427)))))

(declare-fun b!1042322 () Bool)

(declare-fun e!590421 () Bool)

(assert (=> b!1042322 (= e!590421 e!590420)))

(declare-fun lt!459420 () (_ BitVec 64))

(assert (=> b!1042322 (= lt!459420 (select (arr!31611 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459422 () Unit!34043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65706 (_ BitVec 64) (_ BitVec 32)) Unit!34043)

(assert (=> b!1042322 (= lt!459422 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11612 thiss!1427) lt!459420 #b00000000000000000000000000000000))))

(assert (=> b!1042322 (arrayContainsKey!0 (_keys!11612 thiss!1427) lt!459420 #b00000000000000000000000000000000)))

(declare-fun lt!459421 () Unit!34043)

(assert (=> b!1042322 (= lt!459421 lt!459422)))

(declare-fun res!694537 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65706 (_ BitVec 32)) SeekEntryResult!9814)

(assert (=> b!1042322 (= res!694537 (= (seekEntryOrOpen!0 (select (arr!31611 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) (_keys!11612 thiss!1427) (mask!30421 thiss!1427)) (Found!9814 #b00000000000000000000000000000000)))))

(assert (=> b!1042322 (=> (not res!694537) (not e!590420))))

(declare-fun b!1042323 () Bool)

(declare-fun e!590422 () Bool)

(assert (=> b!1042323 (= e!590422 e!590421)))

(declare-fun c!105811 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042323 (= c!105811 (validKeyInArray!0 (select (arr!31611 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126091 () Bool)

(declare-fun res!694538 () Bool)

(assert (=> d!126091 (=> res!694538 e!590422)))

(assert (=> d!126091 (= res!694538 (bvsge #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))))))

(assert (=> d!126091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)) e!590422)))

(declare-fun b!1042324 () Bool)

(assert (=> b!1042324 (= e!590421 call!44166)))

(assert (= (and d!126091 (not res!694538)) b!1042323))

(assert (= (and b!1042323 c!105811) b!1042322))

(assert (= (and b!1042323 (not c!105811)) b!1042324))

(assert (= (and b!1042322 res!694537) b!1042321))

(assert (= (or b!1042321 b!1042324) bm!44163))

(declare-fun m!961671 () Bool)

(assert (=> bm!44163 m!961671))

(declare-fun m!961673 () Bool)

(assert (=> b!1042322 m!961673))

(declare-fun m!961675 () Bool)

(assert (=> b!1042322 m!961675))

(declare-fun m!961677 () Bool)

(assert (=> b!1042322 m!961677))

(assert (=> b!1042322 m!961673))

(declare-fun m!961679 () Bool)

(assert (=> b!1042322 m!961679))

(assert (=> b!1042323 m!961673))

(assert (=> b!1042323 m!961673))

(declare-fun m!961681 () Bool)

(assert (=> b!1042323 m!961681))

(assert (=> b!1042274 d!126091))

(declare-fun d!126093 () Bool)

(declare-fun res!694543 () Bool)

(declare-fun e!590427 () Bool)

(assert (=> d!126093 (=> res!694543 e!590427)))

(assert (=> d!126093 (= res!694543 (= (select (arr!31611 lt!459394) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126093 (= (arrayContainsKey!0 lt!459394 key!909 #b00000000000000000000000000000000) e!590427)))

(declare-fun b!1042329 () Bool)

(declare-fun e!590428 () Bool)

(assert (=> b!1042329 (= e!590427 e!590428)))

(declare-fun res!694544 () Bool)

(assert (=> b!1042329 (=> (not res!694544) (not e!590428))))

(assert (=> b!1042329 (= res!694544 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32146 lt!459394)))))

(declare-fun b!1042330 () Bool)

(assert (=> b!1042330 (= e!590428 (arrayContainsKey!0 lt!459394 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126093 (not res!694543)) b!1042329))

(assert (= (and b!1042329 res!694544) b!1042330))

(declare-fun m!961683 () Bool)

(assert (=> d!126093 m!961683))

(declare-fun m!961685 () Bool)

(assert (=> b!1042330 m!961685))

(assert (=> b!1042270 d!126093))

(declare-fun bm!44166 () Bool)

(declare-fun call!44169 () Bool)

(declare-fun c!105814 () Bool)

(assert (=> bm!44166 (= call!44169 (arrayNoDuplicates!0 lt!459394 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105814 (Cons!21969 (select (arr!31611 lt!459394) #b00000000000000000000000000000000) Nil!21970) Nil!21970)))))

(declare-fun d!126095 () Bool)

(declare-fun res!694552 () Bool)

(declare-fun e!590437 () Bool)

(assert (=> d!126095 (=> res!694552 e!590437)))

(assert (=> d!126095 (= res!694552 (bvsge #b00000000000000000000000000000000 (size!32146 lt!459394)))))

(assert (=> d!126095 (= (arrayNoDuplicates!0 lt!459394 #b00000000000000000000000000000000 Nil!21970) e!590437)))

(declare-fun b!1042341 () Bool)

(declare-fun e!590439 () Bool)

(declare-fun contains!6057 (List!21973 (_ BitVec 64)) Bool)

(assert (=> b!1042341 (= e!590439 (contains!6057 Nil!21970 (select (arr!31611 lt!459394) #b00000000000000000000000000000000)))))

(declare-fun b!1042342 () Bool)

(declare-fun e!590440 () Bool)

(assert (=> b!1042342 (= e!590437 e!590440)))

(declare-fun res!694553 () Bool)

(assert (=> b!1042342 (=> (not res!694553) (not e!590440))))

(assert (=> b!1042342 (= res!694553 (not e!590439))))

(declare-fun res!694551 () Bool)

(assert (=> b!1042342 (=> (not res!694551) (not e!590439))))

(assert (=> b!1042342 (= res!694551 (validKeyInArray!0 (select (arr!31611 lt!459394) #b00000000000000000000000000000000)))))

(declare-fun b!1042343 () Bool)

(declare-fun e!590438 () Bool)

(assert (=> b!1042343 (= e!590440 e!590438)))

(assert (=> b!1042343 (= c!105814 (validKeyInArray!0 (select (arr!31611 lt!459394) #b00000000000000000000000000000000)))))

(declare-fun b!1042344 () Bool)

(assert (=> b!1042344 (= e!590438 call!44169)))

(declare-fun b!1042345 () Bool)

(assert (=> b!1042345 (= e!590438 call!44169)))

(assert (= (and d!126095 (not res!694552)) b!1042342))

(assert (= (and b!1042342 res!694551) b!1042341))

(assert (= (and b!1042342 res!694553) b!1042343))

(assert (= (and b!1042343 c!105814) b!1042344))

(assert (= (and b!1042343 (not c!105814)) b!1042345))

(assert (= (or b!1042344 b!1042345) bm!44166))

(assert (=> bm!44166 m!961683))

(declare-fun m!961687 () Bool)

(assert (=> bm!44166 m!961687))

(assert (=> b!1042341 m!961683))

(assert (=> b!1042341 m!961683))

(declare-fun m!961689 () Bool)

(assert (=> b!1042341 m!961689))

(assert (=> b!1042342 m!961683))

(assert (=> b!1042342 m!961683))

(declare-fun m!961691 () Bool)

(assert (=> b!1042342 m!961691))

(assert (=> b!1042343 m!961683))

(assert (=> b!1042343 m!961683))

(assert (=> b!1042343 m!961691))

(assert (=> b!1042270 d!126095))

(declare-fun b!1042354 () Bool)

(declare-fun e!590445 () (_ BitVec 32))

(assert (=> b!1042354 (= e!590445 #b00000000000000000000000000000000)))

(declare-fun b!1042355 () Bool)

(declare-fun e!590446 () (_ BitVec 32))

(assert (=> b!1042355 (= e!590445 e!590446)))

(declare-fun c!105820 () Bool)

(assert (=> b!1042355 (= c!105820 (validKeyInArray!0 (select (arr!31611 lt!459394) #b00000000000000000000000000000000)))))

(declare-fun b!1042356 () Bool)

(declare-fun call!44172 () (_ BitVec 32))

(assert (=> b!1042356 (= e!590446 call!44172)))

(declare-fun bm!44169 () Bool)

(assert (=> bm!44169 (= call!44172 (arrayCountValidKeys!0 lt!459394 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32146 (_keys!11612 thiss!1427))))))

(declare-fun b!1042357 () Bool)

(assert (=> b!1042357 (= e!590446 (bvadd #b00000000000000000000000000000001 call!44172))))

(declare-fun d!126097 () Bool)

(declare-fun lt!459425 () (_ BitVec 32))

(assert (=> d!126097 (and (bvsge lt!459425 #b00000000000000000000000000000000) (bvsle lt!459425 (bvsub (size!32146 lt!459394) #b00000000000000000000000000000000)))))

(assert (=> d!126097 (= lt!459425 e!590445)))

(declare-fun c!105819 () Bool)

(assert (=> d!126097 (= c!105819 (bvsge #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))))))

(assert (=> d!126097 (and (bvsle #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32146 (_keys!11612 thiss!1427)) (size!32146 lt!459394)))))

(assert (=> d!126097 (= (arrayCountValidKeys!0 lt!459394 #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) lt!459425)))

(assert (= (and d!126097 c!105819) b!1042354))

(assert (= (and d!126097 (not c!105819)) b!1042355))

(assert (= (and b!1042355 c!105820) b!1042357))

(assert (= (and b!1042355 (not c!105820)) b!1042356))

(assert (= (or b!1042357 b!1042356) bm!44169))

(assert (=> b!1042355 m!961683))

(assert (=> b!1042355 m!961683))

(assert (=> b!1042355 m!961691))

(declare-fun m!961693 () Bool)

(assert (=> bm!44169 m!961693))

(assert (=> b!1042270 d!126097))

(declare-fun d!126099 () Bool)

(declare-fun e!590449 () Bool)

(assert (=> d!126099 e!590449))

(declare-fun res!694556 () Bool)

(assert (=> d!126099 (=> (not res!694556) (not e!590449))))

(assert (=> d!126099 (= res!694556 (and (bvsge (index!41628 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41628 lt!459392) (size!32146 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459428 () Unit!34043)

(declare-fun choose!53 (array!65706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21973) Unit!34043)

(assert (=> d!126099 (= lt!459428 (choose!53 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41628 lt!459392) #b00000000000000000000000000000000 Nil!21970))))

(assert (=> d!126099 (bvslt (size!32146 (_keys!11612 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126099 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41628 lt!459392) #b00000000000000000000000000000000 Nil!21970) lt!459428)))

(declare-fun b!1042360 () Bool)

(assert (=> b!1042360 (= e!590449 (arrayNoDuplicates!0 (array!65707 (store (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32146 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 Nil!21970))))

(assert (= (and d!126099 res!694556) b!1042360))

(declare-fun m!961695 () Bool)

(assert (=> d!126099 m!961695))

(assert (=> b!1042360 m!961601))

(declare-fun m!961697 () Bool)

(assert (=> b!1042360 m!961697))

(assert (=> b!1042270 d!126099))

(declare-fun d!126101 () Bool)

(assert (=> d!126101 (= (validMask!0 (mask!30421 thiss!1427)) (and (or (= (mask!30421 thiss!1427) #b00000000000000000000000000000111) (= (mask!30421 thiss!1427) #b00000000000000000000000000001111) (= (mask!30421 thiss!1427) #b00000000000000000000000000011111) (= (mask!30421 thiss!1427) #b00000000000000000000000000111111) (= (mask!30421 thiss!1427) #b00000000000000000000000001111111) (= (mask!30421 thiss!1427) #b00000000000000000000000011111111) (= (mask!30421 thiss!1427) #b00000000000000000000000111111111) (= (mask!30421 thiss!1427) #b00000000000000000000001111111111) (= (mask!30421 thiss!1427) #b00000000000000000000011111111111) (= (mask!30421 thiss!1427) #b00000000000000000000111111111111) (= (mask!30421 thiss!1427) #b00000000000000000001111111111111) (= (mask!30421 thiss!1427) #b00000000000000000011111111111111) (= (mask!30421 thiss!1427) #b00000000000000000111111111111111) (= (mask!30421 thiss!1427) #b00000000000000001111111111111111) (= (mask!30421 thiss!1427) #b00000000000000011111111111111111) (= (mask!30421 thiss!1427) #b00000000000000111111111111111111) (= (mask!30421 thiss!1427) #b00000000000001111111111111111111) (= (mask!30421 thiss!1427) #b00000000000011111111111111111111) (= (mask!30421 thiss!1427) #b00000000000111111111111111111111) (= (mask!30421 thiss!1427) #b00000000001111111111111111111111) (= (mask!30421 thiss!1427) #b00000000011111111111111111111111) (= (mask!30421 thiss!1427) #b00000000111111111111111111111111) (= (mask!30421 thiss!1427) #b00000001111111111111111111111111) (= (mask!30421 thiss!1427) #b00000011111111111111111111111111) (= (mask!30421 thiss!1427) #b00000111111111111111111111111111) (= (mask!30421 thiss!1427) #b00001111111111111111111111111111) (= (mask!30421 thiss!1427) #b00011111111111111111111111111111) (= (mask!30421 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30421 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042270 d!126101))

(declare-fun d!126103 () Bool)

(declare-fun e!590452 () Bool)

(assert (=> d!126103 e!590452))

(declare-fun res!694559 () Bool)

(assert (=> d!126103 (=> (not res!694559) (not e!590452))))

(assert (=> d!126103 (= res!694559 (bvslt (index!41628 lt!459392) (size!32146 (_keys!11612 thiss!1427))))))

(declare-fun lt!459431 () Unit!34043)

(declare-fun choose!121 (array!65706 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> d!126103 (= lt!459431 (choose!121 (_keys!11612 thiss!1427) (index!41628 lt!459392) key!909))))

(assert (=> d!126103 (bvsge (index!41628 lt!459392) #b00000000000000000000000000000000)))

(assert (=> d!126103 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11612 thiss!1427) (index!41628 lt!459392) key!909) lt!459431)))

(declare-fun b!1042363 () Bool)

(assert (=> b!1042363 (= e!590452 (not (arrayContainsKey!0 (array!65707 (store (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32146 (_keys!11612 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126103 res!694559) b!1042363))

(declare-fun m!961699 () Bool)

(assert (=> d!126103 m!961699))

(assert (=> b!1042363 m!961601))

(declare-fun m!961701 () Bool)

(assert (=> b!1042363 m!961701))

(assert (=> b!1042270 d!126103))

(declare-fun b!1042364 () Bool)

(declare-fun e!590453 () Bool)

(declare-fun call!44173 () Bool)

(assert (=> b!1042364 (= e!590453 call!44173)))

(declare-fun bm!44170 () Bool)

(assert (=> bm!44170 (= call!44173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459394 (mask!30421 thiss!1427)))))

(declare-fun b!1042365 () Bool)

(declare-fun e!590454 () Bool)

(assert (=> b!1042365 (= e!590454 e!590453)))

(declare-fun lt!459432 () (_ BitVec 64))

(assert (=> b!1042365 (= lt!459432 (select (arr!31611 lt!459394) #b00000000000000000000000000000000))))

(declare-fun lt!459434 () Unit!34043)

(assert (=> b!1042365 (= lt!459434 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459394 lt!459432 #b00000000000000000000000000000000))))

(assert (=> b!1042365 (arrayContainsKey!0 lt!459394 lt!459432 #b00000000000000000000000000000000)))

(declare-fun lt!459433 () Unit!34043)

(assert (=> b!1042365 (= lt!459433 lt!459434)))

(declare-fun res!694560 () Bool)

(assert (=> b!1042365 (= res!694560 (= (seekEntryOrOpen!0 (select (arr!31611 lt!459394) #b00000000000000000000000000000000) lt!459394 (mask!30421 thiss!1427)) (Found!9814 #b00000000000000000000000000000000)))))

(assert (=> b!1042365 (=> (not res!694560) (not e!590453))))

(declare-fun b!1042366 () Bool)

(declare-fun e!590455 () Bool)

(assert (=> b!1042366 (= e!590455 e!590454)))

(declare-fun c!105821 () Bool)

(assert (=> b!1042366 (= c!105821 (validKeyInArray!0 (select (arr!31611 lt!459394) #b00000000000000000000000000000000)))))

(declare-fun d!126105 () Bool)

(declare-fun res!694561 () Bool)

(assert (=> d!126105 (=> res!694561 e!590455)))

(assert (=> d!126105 (= res!694561 (bvsge #b00000000000000000000000000000000 (size!32146 lt!459394)))))

(assert (=> d!126105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459394 (mask!30421 thiss!1427)) e!590455)))

(declare-fun b!1042367 () Bool)

(assert (=> b!1042367 (= e!590454 call!44173)))

(assert (= (and d!126105 (not res!694561)) b!1042366))

(assert (= (and b!1042366 c!105821) b!1042365))

(assert (= (and b!1042366 (not c!105821)) b!1042367))

(assert (= (and b!1042365 res!694560) b!1042364))

(assert (= (or b!1042364 b!1042367) bm!44170))

(declare-fun m!961703 () Bool)

(assert (=> bm!44170 m!961703))

(assert (=> b!1042365 m!961683))

(declare-fun m!961705 () Bool)

(assert (=> b!1042365 m!961705))

(declare-fun m!961707 () Bool)

(assert (=> b!1042365 m!961707))

(assert (=> b!1042365 m!961683))

(declare-fun m!961709 () Bool)

(assert (=> b!1042365 m!961709))

(assert (=> b!1042366 m!961683))

(assert (=> b!1042366 m!961683))

(assert (=> b!1042366 m!961691))

(assert (=> b!1042270 d!126105))

(declare-fun d!126107 () Bool)

(declare-fun e!590458 () Bool)

(assert (=> d!126107 e!590458))

(declare-fun res!694564 () Bool)

(assert (=> d!126107 (=> (not res!694564) (not e!590458))))

(assert (=> d!126107 (= res!694564 (and (bvsge (index!41628 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41628 lt!459392) (size!32146 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459437 () Unit!34043)

(declare-fun choose!25 (array!65706 (_ BitVec 32) (_ BitVec 32)) Unit!34043)

(assert (=> d!126107 (= lt!459437 (choose!25 (_keys!11612 thiss!1427) (index!41628 lt!459392) (mask!30421 thiss!1427)))))

(assert (=> d!126107 (validMask!0 (mask!30421 thiss!1427))))

(assert (=> d!126107 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11612 thiss!1427) (index!41628 lt!459392) (mask!30421 thiss!1427)) lt!459437)))

(declare-fun b!1042370 () Bool)

(assert (=> b!1042370 (= e!590458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65707 (store (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32146 (_keys!11612 thiss!1427))) (mask!30421 thiss!1427)))))

(assert (= (and d!126107 res!694564) b!1042370))

(declare-fun m!961711 () Bool)

(assert (=> d!126107 m!961711))

(assert (=> d!126107 m!961603))

(assert (=> b!1042370 m!961601))

(declare-fun m!961713 () Bool)

(assert (=> b!1042370 m!961713))

(assert (=> b!1042270 d!126107))

(declare-fun b!1042371 () Bool)

(declare-fun e!590459 () (_ BitVec 32))

(assert (=> b!1042371 (= e!590459 #b00000000000000000000000000000000)))

(declare-fun b!1042372 () Bool)

(declare-fun e!590460 () (_ BitVec 32))

(assert (=> b!1042372 (= e!590459 e!590460)))

(declare-fun c!105823 () Bool)

(assert (=> b!1042372 (= c!105823 (validKeyInArray!0 (select (arr!31611 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042373 () Bool)

(declare-fun call!44174 () (_ BitVec 32))

(assert (=> b!1042373 (= e!590460 call!44174)))

(declare-fun bm!44171 () Bool)

(assert (=> bm!44171 (= call!44174 (arrayCountValidKeys!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32146 (_keys!11612 thiss!1427))))))

(declare-fun b!1042374 () Bool)

(assert (=> b!1042374 (= e!590460 (bvadd #b00000000000000000000000000000001 call!44174))))

(declare-fun d!126109 () Bool)

(declare-fun lt!459438 () (_ BitVec 32))

(assert (=> d!126109 (and (bvsge lt!459438 #b00000000000000000000000000000000) (bvsle lt!459438 (bvsub (size!32146 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126109 (= lt!459438 e!590459)))

(declare-fun c!105822 () Bool)

(assert (=> d!126109 (= c!105822 (bvsge #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))))))

(assert (=> d!126109 (and (bvsle #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32146 (_keys!11612 thiss!1427)) (size!32146 (_keys!11612 thiss!1427))))))

(assert (=> d!126109 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) lt!459438)))

(assert (= (and d!126109 c!105822) b!1042371))

(assert (= (and d!126109 (not c!105822)) b!1042372))

(assert (= (and b!1042372 c!105823) b!1042374))

(assert (= (and b!1042372 (not c!105823)) b!1042373))

(assert (= (or b!1042374 b!1042373) bm!44171))

(assert (=> b!1042372 m!961673))

(assert (=> b!1042372 m!961673))

(assert (=> b!1042372 m!961681))

(declare-fun m!961715 () Bool)

(assert (=> bm!44171 m!961715))

(assert (=> b!1042270 d!126109))

(declare-fun b!1042386 () Bool)

(declare-fun e!590465 () Bool)

(assert (=> b!1042386 (= e!590465 (= (arrayCountValidKeys!0 (array!65707 (store (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32146 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32146 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126111 () Bool)

(assert (=> d!126111 e!590465))

(declare-fun res!694575 () Bool)

(assert (=> d!126111 (=> (not res!694575) (not e!590465))))

(assert (=> d!126111 (= res!694575 (and (bvsge (index!41628 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41628 lt!459392) (size!32146 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459441 () Unit!34043)

(declare-fun choose!82 (array!65706 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> d!126111 (= lt!459441 (choose!82 (_keys!11612 thiss!1427) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590466 () Bool)

(assert (=> d!126111 e!590466))

(declare-fun res!694574 () Bool)

(assert (=> d!126111 (=> (not res!694574) (not e!590466))))

(assert (=> d!126111 (= res!694574 (and (bvsge (index!41628 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41628 lt!459392) (size!32146 (_keys!11612 thiss!1427)))))))

(assert (=> d!126111 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11612 thiss!1427) (index!41628 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459441)))

(declare-fun b!1042384 () Bool)

(declare-fun res!694573 () Bool)

(assert (=> b!1042384 (=> (not res!694573) (not e!590466))))

(assert (=> b!1042384 (= res!694573 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042385 () Bool)

(assert (=> b!1042385 (= e!590466 (bvslt (size!32146 (_keys!11612 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042383 () Bool)

(declare-fun res!694576 () Bool)

(assert (=> b!1042383 (=> (not res!694576) (not e!590466))))

(assert (=> b!1042383 (= res!694576 (validKeyInArray!0 (select (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459392))))))

(assert (= (and d!126111 res!694574) b!1042383))

(assert (= (and b!1042383 res!694576) b!1042384))

(assert (= (and b!1042384 res!694573) b!1042385))

(assert (= (and d!126111 res!694575) b!1042386))

(assert (=> b!1042386 m!961601))

(declare-fun m!961717 () Bool)

(assert (=> b!1042386 m!961717))

(assert (=> b!1042386 m!961609))

(declare-fun m!961719 () Bool)

(assert (=> d!126111 m!961719))

(declare-fun m!961721 () Bool)

(assert (=> b!1042384 m!961721))

(declare-fun m!961723 () Bool)

(assert (=> b!1042383 m!961723))

(assert (=> b!1042383 m!961723))

(declare-fun m!961725 () Bool)

(assert (=> b!1042383 m!961725))

(assert (=> b!1042270 d!126111))

(declare-fun b!1042399 () Bool)

(declare-fun e!590475 () SeekEntryResult!9814)

(declare-fun lt!459450 () SeekEntryResult!9814)

(assert (=> b!1042399 (= e!590475 (ite ((_ is MissingVacant!9814) lt!459450) (MissingZero!9814 (index!41630 lt!459450)) lt!459450))))

(declare-fun lt!459451 () SeekEntryResult!9814)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65706 (_ BitVec 32)) SeekEntryResult!9814)

(assert (=> b!1042399 (= lt!459450 (seekKeyOrZeroReturnVacant!0 (x!93050 lt!459451) (index!41629 lt!459451) (index!41629 lt!459451) key!909 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)))))

(declare-fun b!1042400 () Bool)

(declare-fun e!590474 () SeekEntryResult!9814)

(assert (=> b!1042400 (= e!590474 (Found!9814 (index!41629 lt!459451)))))

(declare-fun b!1042401 () Bool)

(assert (=> b!1042401 (= e!590475 (MissingZero!9814 (index!41629 lt!459451)))))

(declare-fun d!126113 () Bool)

(declare-fun lt!459453 () SeekEntryResult!9814)

(assert (=> d!126113 (and (or ((_ is MissingVacant!9814) lt!459453) (not ((_ is Found!9814) lt!459453)) (and (bvsge (index!41628 lt!459453) #b00000000000000000000000000000000) (bvslt (index!41628 lt!459453) (size!32146 (_keys!11612 thiss!1427))))) (not ((_ is MissingVacant!9814) lt!459453)) (or (not ((_ is Found!9814) lt!459453)) (= (select (arr!31611 (_keys!11612 thiss!1427)) (index!41628 lt!459453)) key!909)))))

(declare-fun e!590473 () SeekEntryResult!9814)

(assert (=> d!126113 (= lt!459453 e!590473)))

(declare-fun c!105831 () Bool)

(assert (=> d!126113 (= c!105831 (and ((_ is Intermediate!9814) lt!459451) (undefined!10626 lt!459451)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65706 (_ BitVec 32)) SeekEntryResult!9814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126113 (= lt!459451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30421 thiss!1427)) key!909 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)))))

(assert (=> d!126113 (validMask!0 (mask!30421 thiss!1427))))

(assert (=> d!126113 (= (seekEntry!0 key!909 (_keys!11612 thiss!1427) (mask!30421 thiss!1427)) lt!459453)))

(declare-fun b!1042402 () Bool)

(assert (=> b!1042402 (= e!590473 Undefined!9814)))

(declare-fun b!1042403 () Bool)

(declare-fun c!105832 () Bool)

(declare-fun lt!459452 () (_ BitVec 64))

(assert (=> b!1042403 (= c!105832 (= lt!459452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042403 (= e!590474 e!590475)))

(declare-fun b!1042404 () Bool)

(assert (=> b!1042404 (= e!590473 e!590474)))

(assert (=> b!1042404 (= lt!459452 (select (arr!31611 (_keys!11612 thiss!1427)) (index!41629 lt!459451)))))

(declare-fun c!105830 () Bool)

(assert (=> b!1042404 (= c!105830 (= lt!459452 key!909))))

(assert (= (and d!126113 c!105831) b!1042402))

(assert (= (and d!126113 (not c!105831)) b!1042404))

(assert (= (and b!1042404 c!105830) b!1042400))

(assert (= (and b!1042404 (not c!105830)) b!1042403))

(assert (= (and b!1042403 c!105832) b!1042401))

(assert (= (and b!1042403 (not c!105832)) b!1042399))

(declare-fun m!961727 () Bool)

(assert (=> b!1042399 m!961727))

(declare-fun m!961729 () Bool)

(assert (=> d!126113 m!961729))

(declare-fun m!961731 () Bool)

(assert (=> d!126113 m!961731))

(assert (=> d!126113 m!961731))

(declare-fun m!961733 () Bool)

(assert (=> d!126113 m!961733))

(assert (=> d!126113 m!961603))

(declare-fun m!961735 () Bool)

(assert (=> b!1042404 m!961735))

(assert (=> b!1042271 d!126113))

(declare-fun b!1042412 () Bool)

(declare-fun e!590481 () Bool)

(assert (=> b!1042412 (= e!590481 tp_is_empty!24777)))

(declare-fun mapIsEmpty!38777 () Bool)

(declare-fun mapRes!38777 () Bool)

(assert (=> mapIsEmpty!38777 mapRes!38777))

(declare-fun condMapEmpty!38777 () Bool)

(declare-fun mapDefault!38777 () ValueCell!11685)

(assert (=> mapNonEmpty!38771 (= condMapEmpty!38777 (= mapRest!38771 ((as const (Array (_ BitVec 32) ValueCell!11685)) mapDefault!38777)))))

(assert (=> mapNonEmpty!38771 (= tp!74394 (and e!590481 mapRes!38777))))

(declare-fun b!1042411 () Bool)

(declare-fun e!590480 () Bool)

(assert (=> b!1042411 (= e!590480 tp_is_empty!24777)))

(declare-fun mapNonEmpty!38777 () Bool)

(declare-fun tp!74403 () Bool)

(assert (=> mapNonEmpty!38777 (= mapRes!38777 (and tp!74403 e!590480))))

(declare-fun mapKey!38777 () (_ BitVec 32))

(declare-fun mapValue!38777 () ValueCell!11685)

(declare-fun mapRest!38777 () (Array (_ BitVec 32) ValueCell!11685))

(assert (=> mapNonEmpty!38777 (= mapRest!38771 (store mapRest!38777 mapKey!38777 mapValue!38777))))

(assert (= (and mapNonEmpty!38771 condMapEmpty!38777) mapIsEmpty!38777))

(assert (= (and mapNonEmpty!38771 (not condMapEmpty!38777)) mapNonEmpty!38777))

(assert (= (and mapNonEmpty!38777 ((_ is ValueCellFull!11685) mapValue!38777)) b!1042411))

(assert (= (and mapNonEmpty!38771 ((_ is ValueCellFull!11685) mapDefault!38777)) b!1042412))

(declare-fun m!961737 () Bool)

(assert (=> mapNonEmpty!38777 m!961737))

(check-sat (not b!1042343) (not b!1042366) (not bm!44171) (not b!1042341) (not b!1042312) (not b_next!21057) tp_is_empty!24777 (not d!126111) (not b!1042330) (not d!126099) (not b!1042363) (not b!1042370) (not bm!44169) (not b!1042322) (not bm!44166) (not d!126107) (not d!126089) (not bm!44163) (not mapNonEmpty!38777) (not d!126113) (not b!1042399) (not bm!44170) (not b!1042384) (not b!1042323) (not b!1042386) (not b!1042355) (not b!1042365) (not b!1042372) (not d!126103) (not b!1042342) (not b!1042311) (not b!1042360) (not b!1042383) (not b!1042310) b_and!33589)
(check-sat b_and!33589 (not b_next!21057))
