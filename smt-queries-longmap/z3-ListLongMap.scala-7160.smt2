; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91166 () Bool)

(assert start!91166)

(declare-fun b!1040336 () Bool)

(declare-fun b_free!21013 () Bool)

(declare-fun b_next!21013 () Bool)

(assert (=> b!1040336 (= b_free!21013 (not b_next!21013))))

(declare-fun tp!74236 () Bool)

(declare-fun b_and!33519 () Bool)

(assert (=> b!1040336 (= tp!74236 b_and!33519)))

(declare-fun mapIsEmpty!38680 () Bool)

(declare-fun mapRes!38680 () Bool)

(assert (=> mapIsEmpty!38680 mapRes!38680))

(declare-fun tp_is_empty!24733 () Bool)

(declare-fun e!588996 () Bool)

(declare-fun e!588995 () Bool)

(declare-datatypes ((V!37851 0))(
  ( (V!37852 (val!12417 Int)) )
))
(declare-datatypes ((ValueCell!11663 0))(
  ( (ValueCellFull!11663 (v!15003 V!37851)) (EmptyCell!11663) )
))
(declare-datatypes ((array!65543 0))(
  ( (array!65544 (arr!31536 (Array (_ BitVec 32) (_ BitVec 64))) (size!32069 (_ BitVec 32))) )
))
(declare-datatypes ((array!65545 0))(
  ( (array!65546 (arr!31537 (Array (_ BitVec 32) ValueCell!11663)) (size!32070 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5920 0))(
  ( (LongMapFixedSize!5921 (defaultEntry!6342 Int) (mask!30333 (_ BitVec 32)) (extraKeys!6070 (_ BitVec 32)) (zeroValue!6176 V!37851) (minValue!6176 V!37851) (_size!3015 (_ BitVec 32)) (_keys!11560 array!65543) (_values!6365 array!65545) (_vacant!3015 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5920)

(declare-fun array_inv!24379 (array!65543) Bool)

(declare-fun array_inv!24380 (array!65545) Bool)

(assert (=> b!1040336 (= e!588995 (and tp!74236 tp_is_empty!24733 (array_inv!24379 (_keys!11560 thiss!1427)) (array_inv!24380 (_values!6365 thiss!1427)) e!588996))))

(declare-fun b!1040337 () Bool)

(declare-fun res!693619 () Bool)

(declare-fun e!588990 () Bool)

(assert (=> b!1040337 (=> res!693619 e!588990)))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040337 (= res!693619 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1040338 () Bool)

(declare-datatypes ((SeekEntryResult!9792 0))(
  ( (MissingZero!9792 (index!41539 (_ BitVec 32))) (Found!9792 (index!41540 (_ BitVec 32))) (Intermediate!9792 (undefined!10604 Bool) (index!41541 (_ BitVec 32)) (x!92877 (_ BitVec 32))) (Undefined!9792) (MissingVacant!9792 (index!41542 (_ BitVec 32))) )
))
(declare-fun lt!458366 () SeekEntryResult!9792)

(assert (=> b!1040338 (= e!588990 (= (select (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458366)) key!909))))

(declare-fun b!1040340 () Bool)

(declare-fun res!693616 () Bool)

(assert (=> b!1040340 (=> res!693616 e!588990)))

(declare-datatypes ((List!21996 0))(
  ( (Nil!21993) (Cons!21992 (h!23196 (_ BitVec 64)) (t!31201 List!21996)) )
))
(declare-fun arrayNoDuplicates!0 (array!65543 (_ BitVec 32) List!21996) Bool)

(assert (=> b!1040340 (= res!693616 (not (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21993)))))

(declare-fun b!1040341 () Bool)

(declare-fun e!588993 () Bool)

(assert (=> b!1040341 (= e!588993 (not e!588990))))

(declare-fun res!693617 () Bool)

(assert (=> b!1040341 (=> res!693617 e!588990)))

(assert (=> b!1040341 (= res!693617 (or (bvslt (index!41540 lt!458366) #b00000000000000000000000000000000) (bvsge (index!41540 lt!458366) (size!32069 (_keys!11560 thiss!1427))) (bvsge (size!32069 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458369 () array!65543)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65543 (_ BitVec 32)) Bool)

(assert (=> b!1040341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458369 (mask!30333 thiss!1427))))

(declare-datatypes ((Unit!33901 0))(
  ( (Unit!33902) )
))
(declare-fun lt!458367 () Unit!33901)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65543 (_ BitVec 32) (_ BitVec 32)) Unit!33901)

(assert (=> b!1040341 (= lt!458367 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11560 thiss!1427) (index!41540 lt!458366) (mask!30333 thiss!1427)))))

(assert (=> b!1040341 (arrayNoDuplicates!0 lt!458369 #b00000000000000000000000000000000 Nil!21993)))

(declare-fun lt!458365 () Unit!33901)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21996) Unit!33901)

(assert (=> b!1040341 (= lt!458365 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!458366) #b00000000000000000000000000000000 Nil!21993))))

(declare-fun arrayCountValidKeys!0 (array!65543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040341 (= (arrayCountValidKeys!0 lt!458369 #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040341 (= lt!458369 (array!65544 (store (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11560 thiss!1427))))))

(declare-fun lt!458368 () Unit!33901)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65543 (_ BitVec 32) (_ BitVec 64)) Unit!33901)

(assert (=> b!1040341 (= lt!458368 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11560 thiss!1427) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040342 () Bool)

(declare-fun e!588994 () Bool)

(assert (=> b!1040342 (= e!588994 e!588993)))

(declare-fun res!693620 () Bool)

(assert (=> b!1040342 (=> (not res!693620) (not e!588993))))

(get-info :version)

(assert (=> b!1040342 (= res!693620 ((_ is Found!9792) lt!458366))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65543 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1040342 (= lt!458366 (seekEntry!0 key!909 (_keys!11560 thiss!1427) (mask!30333 thiss!1427)))))

(declare-fun mapNonEmpty!38680 () Bool)

(declare-fun tp!74237 () Bool)

(declare-fun e!588991 () Bool)

(assert (=> mapNonEmpty!38680 (= mapRes!38680 (and tp!74237 e!588991))))

(declare-fun mapKey!38680 () (_ BitVec 32))

(declare-fun mapValue!38680 () ValueCell!11663)

(declare-fun mapRest!38680 () (Array (_ BitVec 32) ValueCell!11663))

(assert (=> mapNonEmpty!38680 (= (arr!31537 (_values!6365 thiss!1427)) (store mapRest!38680 mapKey!38680 mapValue!38680))))

(declare-fun b!1040343 () Bool)

(declare-fun e!588997 () Bool)

(assert (=> b!1040343 (= e!588997 tp_is_empty!24733)))

(declare-fun b!1040344 () Bool)

(assert (=> b!1040344 (= e!588996 (and e!588997 mapRes!38680))))

(declare-fun condMapEmpty!38680 () Bool)

(declare-fun mapDefault!38680 () ValueCell!11663)

(assert (=> b!1040344 (= condMapEmpty!38680 (= (arr!31537 (_values!6365 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11663)) mapDefault!38680)))))

(declare-fun b!1040345 () Bool)

(declare-fun res!693621 () Bool)

(assert (=> b!1040345 (=> (not res!693621) (not e!588994))))

(assert (=> b!1040345 (= res!693621 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040339 () Bool)

(assert (=> b!1040339 (= e!588991 tp_is_empty!24733)))

(declare-fun res!693618 () Bool)

(assert (=> start!91166 (=> (not res!693618) (not e!588994))))

(declare-fun valid!2214 (LongMapFixedSize!5920) Bool)

(assert (=> start!91166 (= res!693618 (valid!2214 thiss!1427))))

(assert (=> start!91166 e!588994))

(assert (=> start!91166 e!588995))

(assert (=> start!91166 true))

(assert (= (and start!91166 res!693618) b!1040345))

(assert (= (and b!1040345 res!693621) b!1040342))

(assert (= (and b!1040342 res!693620) b!1040341))

(assert (= (and b!1040341 (not res!693617)) b!1040340))

(assert (= (and b!1040340 (not res!693616)) b!1040337))

(assert (= (and b!1040337 (not res!693619)) b!1040338))

(assert (= (and b!1040344 condMapEmpty!38680) mapIsEmpty!38680))

(assert (= (and b!1040344 (not condMapEmpty!38680)) mapNonEmpty!38680))

(assert (= (and mapNonEmpty!38680 ((_ is ValueCellFull!11663) mapValue!38680)) b!1040339))

(assert (= (and b!1040344 ((_ is ValueCellFull!11663) mapDefault!38680)) b!1040343))

(assert (= b!1040336 b!1040344))

(assert (= start!91166 b!1040336))

(declare-fun m!959407 () Bool)

(assert (=> b!1040336 m!959407))

(declare-fun m!959409 () Bool)

(assert (=> b!1040336 m!959409))

(declare-fun m!959411 () Bool)

(assert (=> b!1040341 m!959411))

(declare-fun m!959413 () Bool)

(assert (=> b!1040341 m!959413))

(declare-fun m!959415 () Bool)

(assert (=> b!1040341 m!959415))

(declare-fun m!959417 () Bool)

(assert (=> b!1040341 m!959417))

(declare-fun m!959419 () Bool)

(assert (=> b!1040341 m!959419))

(declare-fun m!959421 () Bool)

(assert (=> b!1040341 m!959421))

(declare-fun m!959423 () Bool)

(assert (=> b!1040341 m!959423))

(declare-fun m!959425 () Bool)

(assert (=> b!1040341 m!959425))

(declare-fun m!959427 () Bool)

(assert (=> b!1040342 m!959427))

(declare-fun m!959429 () Bool)

(assert (=> b!1040337 m!959429))

(declare-fun m!959431 () Bool)

(assert (=> start!91166 m!959431))

(declare-fun m!959433 () Bool)

(assert (=> mapNonEmpty!38680 m!959433))

(declare-fun m!959435 () Bool)

(assert (=> b!1040338 m!959435))

(declare-fun m!959437 () Bool)

(assert (=> b!1040340 m!959437))

(check-sat (not b!1040336) (not mapNonEmpty!38680) tp_is_empty!24733 b_and!33519 (not start!91166) (not b_next!21013) (not b!1040337) (not b!1040342) (not b!1040341) (not b!1040340))
(check-sat b_and!33519 (not b_next!21013))
(get-model)

(declare-fun b!1040416 () Bool)

(declare-fun e!589054 () Bool)

(declare-fun call!44036 () Bool)

(assert (=> b!1040416 (= e!589054 call!44036)))

(declare-fun bm!44033 () Bool)

(declare-fun c!105454 () Bool)

(assert (=> bm!44033 (= call!44036 (arrayNoDuplicates!0 (_keys!11560 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105454 (Cons!21992 (select (arr!31536 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000) Nil!21993) Nil!21993)))))

(declare-fun b!1040417 () Bool)

(assert (=> b!1040417 (= e!589054 call!44036)))

(declare-fun b!1040418 () Bool)

(declare-fun e!589057 () Bool)

(assert (=> b!1040418 (= e!589057 e!589054)))

(assert (=> b!1040418 (= c!105454 (validKeyInArray!0 (select (arr!31536 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040419 () Bool)

(declare-fun e!589055 () Bool)

(assert (=> b!1040419 (= e!589055 e!589057)))

(declare-fun res!693664 () Bool)

(assert (=> b!1040419 (=> (not res!693664) (not e!589057))))

(declare-fun e!589056 () Bool)

(assert (=> b!1040419 (= res!693664 (not e!589056))))

(declare-fun res!693666 () Bool)

(assert (=> b!1040419 (=> (not res!693666) (not e!589056))))

(assert (=> b!1040419 (= res!693666 (validKeyInArray!0 (select (arr!31536 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125511 () Bool)

(declare-fun res!693665 () Bool)

(assert (=> d!125511 (=> res!693665 e!589055)))

(assert (=> d!125511 (= res!693665 (bvsge #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))))))

(assert (=> d!125511 (= (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21993) e!589055)))

(declare-fun b!1040420 () Bool)

(declare-fun contains!6030 (List!21996 (_ BitVec 64)) Bool)

(assert (=> b!1040420 (= e!589056 (contains!6030 Nil!21993 (select (arr!31536 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125511 (not res!693665)) b!1040419))

(assert (= (and b!1040419 res!693666) b!1040420))

(assert (= (and b!1040419 res!693664) b!1040418))

(assert (= (and b!1040418 c!105454) b!1040416))

(assert (= (and b!1040418 (not c!105454)) b!1040417))

(assert (= (or b!1040416 b!1040417) bm!44033))

(declare-fun m!959503 () Bool)

(assert (=> bm!44033 m!959503))

(declare-fun m!959505 () Bool)

(assert (=> bm!44033 m!959505))

(assert (=> b!1040418 m!959503))

(assert (=> b!1040418 m!959503))

(declare-fun m!959507 () Bool)

(assert (=> b!1040418 m!959507))

(assert (=> b!1040419 m!959503))

(assert (=> b!1040419 m!959503))

(assert (=> b!1040419 m!959507))

(assert (=> b!1040420 m!959503))

(assert (=> b!1040420 m!959503))

(declare-fun m!959509 () Bool)

(assert (=> b!1040420 m!959509))

(assert (=> b!1040340 d!125511))

(declare-fun b!1040429 () Bool)

(declare-fun e!589064 () Bool)

(declare-fun call!44039 () Bool)

(assert (=> b!1040429 (= e!589064 call!44039)))

(declare-fun b!1040430 () Bool)

(declare-fun e!589065 () Bool)

(assert (=> b!1040430 (= e!589065 e!589064)))

(declare-fun c!105457 () Bool)

(assert (=> b!1040430 (= c!105457 (validKeyInArray!0 (select (arr!31536 lt!458369) #b00000000000000000000000000000000)))))

(declare-fun b!1040431 () Bool)

(declare-fun e!589066 () Bool)

(assert (=> b!1040431 (= e!589064 e!589066)))

(declare-fun lt!458406 () (_ BitVec 64))

(assert (=> b!1040431 (= lt!458406 (select (arr!31536 lt!458369) #b00000000000000000000000000000000))))

(declare-fun lt!458407 () Unit!33901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65543 (_ BitVec 64) (_ BitVec 32)) Unit!33901)

(assert (=> b!1040431 (= lt!458407 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458369 lt!458406 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040431 (arrayContainsKey!0 lt!458369 lt!458406 #b00000000000000000000000000000000)))

(declare-fun lt!458408 () Unit!33901)

(assert (=> b!1040431 (= lt!458408 lt!458407)))

(declare-fun res!693671 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65543 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1040431 (= res!693671 (= (seekEntryOrOpen!0 (select (arr!31536 lt!458369) #b00000000000000000000000000000000) lt!458369 (mask!30333 thiss!1427)) (Found!9792 #b00000000000000000000000000000000)))))

(assert (=> b!1040431 (=> (not res!693671) (not e!589066))))

(declare-fun bm!44036 () Bool)

(assert (=> bm!44036 (= call!44039 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458369 (mask!30333 thiss!1427)))))

(declare-fun b!1040432 () Bool)

(assert (=> b!1040432 (= e!589066 call!44039)))

(declare-fun d!125513 () Bool)

(declare-fun res!693672 () Bool)

(assert (=> d!125513 (=> res!693672 e!589065)))

(assert (=> d!125513 (= res!693672 (bvsge #b00000000000000000000000000000000 (size!32069 lt!458369)))))

(assert (=> d!125513 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458369 (mask!30333 thiss!1427)) e!589065)))

(assert (= (and d!125513 (not res!693672)) b!1040430))

(assert (= (and b!1040430 c!105457) b!1040431))

(assert (= (and b!1040430 (not c!105457)) b!1040429))

(assert (= (and b!1040431 res!693671) b!1040432))

(assert (= (or b!1040432 b!1040429) bm!44036))

(declare-fun m!959511 () Bool)

(assert (=> b!1040430 m!959511))

(assert (=> b!1040430 m!959511))

(declare-fun m!959513 () Bool)

(assert (=> b!1040430 m!959513))

(assert (=> b!1040431 m!959511))

(declare-fun m!959515 () Bool)

(assert (=> b!1040431 m!959515))

(declare-fun m!959517 () Bool)

(assert (=> b!1040431 m!959517))

(assert (=> b!1040431 m!959511))

(declare-fun m!959519 () Bool)

(assert (=> b!1040431 m!959519))

(declare-fun m!959521 () Bool)

(assert (=> bm!44036 m!959521))

(assert (=> b!1040341 d!125513))

(declare-fun b!1040443 () Bool)

(declare-fun e!589072 () Bool)

(assert (=> b!1040443 (= e!589072 (bvslt (size!32069 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125515 () Bool)

(declare-fun e!589071 () Bool)

(assert (=> d!125515 e!589071))

(declare-fun res!693681 () Bool)

(assert (=> d!125515 (=> (not res!693681) (not e!589071))))

(assert (=> d!125515 (= res!693681 (and (bvsge (index!41540 lt!458366) #b00000000000000000000000000000000) (bvslt (index!41540 lt!458366) (size!32069 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458411 () Unit!33901)

(declare-fun choose!82 (array!65543 (_ BitVec 32) (_ BitVec 64)) Unit!33901)

(assert (=> d!125515 (= lt!458411 (choose!82 (_keys!11560 thiss!1427) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125515 e!589072))

(declare-fun res!693682 () Bool)

(assert (=> d!125515 (=> (not res!693682) (not e!589072))))

(assert (=> d!125515 (= res!693682 (and (bvsge (index!41540 lt!458366) #b00000000000000000000000000000000) (bvslt (index!41540 lt!458366) (size!32069 (_keys!11560 thiss!1427)))))))

(assert (=> d!125515 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11560 thiss!1427) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458411)))

(declare-fun b!1040444 () Bool)

(assert (=> b!1040444 (= e!589071 (= (arrayCountValidKeys!0 (array!65544 (store (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11560 thiss!1427))) #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040442 () Bool)

(declare-fun res!693684 () Bool)

(assert (=> b!1040442 (=> (not res!693684) (not e!589072))))

(assert (=> b!1040442 (= res!693684 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040441 () Bool)

(declare-fun res!693683 () Bool)

(assert (=> b!1040441 (=> (not res!693683) (not e!589072))))

(assert (=> b!1040441 (= res!693683 (validKeyInArray!0 (select (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458366))))))

(assert (= (and d!125515 res!693682) b!1040441))

(assert (= (and b!1040441 res!693683) b!1040442))

(assert (= (and b!1040442 res!693684) b!1040443))

(assert (= (and d!125515 res!693681) b!1040444))

(declare-fun m!959523 () Bool)

(assert (=> d!125515 m!959523))

(assert (=> b!1040444 m!959413))

(declare-fun m!959525 () Bool)

(assert (=> b!1040444 m!959525))

(assert (=> b!1040444 m!959425))

(declare-fun m!959527 () Bool)

(assert (=> b!1040442 m!959527))

(assert (=> b!1040441 m!959435))

(assert (=> b!1040441 m!959435))

(declare-fun m!959529 () Bool)

(assert (=> b!1040441 m!959529))

(assert (=> b!1040341 d!125515))

(declare-fun d!125517 () Bool)

(declare-fun e!589075 () Bool)

(assert (=> d!125517 e!589075))

(declare-fun res!693687 () Bool)

(assert (=> d!125517 (=> (not res!693687) (not e!589075))))

(assert (=> d!125517 (= res!693687 (and (bvsge (index!41540 lt!458366) #b00000000000000000000000000000000) (bvslt (index!41540 lt!458366) (size!32069 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458414 () Unit!33901)

(declare-fun choose!25 (array!65543 (_ BitVec 32) (_ BitVec 32)) Unit!33901)

(assert (=> d!125517 (= lt!458414 (choose!25 (_keys!11560 thiss!1427) (index!41540 lt!458366) (mask!30333 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125517 (validMask!0 (mask!30333 thiss!1427))))

(assert (=> d!125517 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11560 thiss!1427) (index!41540 lt!458366) (mask!30333 thiss!1427)) lt!458414)))

(declare-fun b!1040447 () Bool)

(assert (=> b!1040447 (= e!589075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65544 (store (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11560 thiss!1427))) (mask!30333 thiss!1427)))))

(assert (= (and d!125517 res!693687) b!1040447))

(declare-fun m!959531 () Bool)

(assert (=> d!125517 m!959531))

(declare-fun m!959533 () Bool)

(assert (=> d!125517 m!959533))

(assert (=> b!1040447 m!959413))

(declare-fun m!959535 () Bool)

(assert (=> b!1040447 m!959535))

(assert (=> b!1040341 d!125517))

(declare-fun b!1040456 () Bool)

(declare-fun e!589081 () (_ BitVec 32))

(assert (=> b!1040456 (= e!589081 #b00000000000000000000000000000000)))

(declare-fun b!1040457 () Bool)

(declare-fun e!589080 () (_ BitVec 32))

(declare-fun call!44042 () (_ BitVec 32))

(assert (=> b!1040457 (= e!589080 (bvadd #b00000000000000000000000000000001 call!44042))))

(declare-fun b!1040458 () Bool)

(assert (=> b!1040458 (= e!589081 e!589080)))

(declare-fun c!105463 () Bool)

(assert (=> b!1040458 (= c!105463 (validKeyInArray!0 (select (arr!31536 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125519 () Bool)

(declare-fun lt!458417 () (_ BitVec 32))

(assert (=> d!125519 (and (bvsge lt!458417 #b00000000000000000000000000000000) (bvsle lt!458417 (bvsub (size!32069 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125519 (= lt!458417 e!589081)))

(declare-fun c!105462 () Bool)

(assert (=> d!125519 (= c!105462 (bvsge #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))))))

(assert (=> d!125519 (and (bvsle #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32069 (_keys!11560 thiss!1427)) (size!32069 (_keys!11560 thiss!1427))))))

(assert (=> d!125519 (= (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) lt!458417)))

(declare-fun bm!44039 () Bool)

(assert (=> bm!44039 (= call!44042 (arrayCountValidKeys!0 (_keys!11560 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32069 (_keys!11560 thiss!1427))))))

(declare-fun b!1040459 () Bool)

(assert (=> b!1040459 (= e!589080 call!44042)))

(assert (= (and d!125519 c!105462) b!1040456))

(assert (= (and d!125519 (not c!105462)) b!1040458))

(assert (= (and b!1040458 c!105463) b!1040457))

(assert (= (and b!1040458 (not c!105463)) b!1040459))

(assert (= (or b!1040457 b!1040459) bm!44039))

(assert (=> b!1040458 m!959503))

(assert (=> b!1040458 m!959503))

(assert (=> b!1040458 m!959507))

(declare-fun m!959537 () Bool)

(assert (=> bm!44039 m!959537))

(assert (=> b!1040341 d!125519))

(declare-fun b!1040460 () Bool)

(declare-fun e!589083 () (_ BitVec 32))

(assert (=> b!1040460 (= e!589083 #b00000000000000000000000000000000)))

(declare-fun b!1040461 () Bool)

(declare-fun e!589082 () (_ BitVec 32))

(declare-fun call!44043 () (_ BitVec 32))

(assert (=> b!1040461 (= e!589082 (bvadd #b00000000000000000000000000000001 call!44043))))

(declare-fun b!1040462 () Bool)

(assert (=> b!1040462 (= e!589083 e!589082)))

(declare-fun c!105465 () Bool)

(assert (=> b!1040462 (= c!105465 (validKeyInArray!0 (select (arr!31536 lt!458369) #b00000000000000000000000000000000)))))

(declare-fun d!125521 () Bool)

(declare-fun lt!458418 () (_ BitVec 32))

(assert (=> d!125521 (and (bvsge lt!458418 #b00000000000000000000000000000000) (bvsle lt!458418 (bvsub (size!32069 lt!458369) #b00000000000000000000000000000000)))))

(assert (=> d!125521 (= lt!458418 e!589083)))

(declare-fun c!105464 () Bool)

(assert (=> d!125521 (= c!105464 (bvsge #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))))))

(assert (=> d!125521 (and (bvsle #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32069 (_keys!11560 thiss!1427)) (size!32069 lt!458369)))))

(assert (=> d!125521 (= (arrayCountValidKeys!0 lt!458369 #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) lt!458418)))

(declare-fun bm!44040 () Bool)

(assert (=> bm!44040 (= call!44043 (arrayCountValidKeys!0 lt!458369 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32069 (_keys!11560 thiss!1427))))))

(declare-fun b!1040463 () Bool)

(assert (=> b!1040463 (= e!589082 call!44043)))

(assert (= (and d!125521 c!105464) b!1040460))

(assert (= (and d!125521 (not c!105464)) b!1040462))

(assert (= (and b!1040462 c!105465) b!1040461))

(assert (= (and b!1040462 (not c!105465)) b!1040463))

(assert (= (or b!1040461 b!1040463) bm!44040))

(assert (=> b!1040462 m!959511))

(assert (=> b!1040462 m!959511))

(assert (=> b!1040462 m!959513))

(declare-fun m!959539 () Bool)

(assert (=> bm!44040 m!959539))

(assert (=> b!1040341 d!125521))

(declare-fun d!125523 () Bool)

(declare-fun e!589086 () Bool)

(assert (=> d!125523 e!589086))

(declare-fun res!693690 () Bool)

(assert (=> d!125523 (=> (not res!693690) (not e!589086))))

(assert (=> d!125523 (= res!693690 (and (bvsge (index!41540 lt!458366) #b00000000000000000000000000000000) (bvslt (index!41540 lt!458366) (size!32069 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458421 () Unit!33901)

(declare-fun choose!53 (array!65543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21996) Unit!33901)

(assert (=> d!125523 (= lt!458421 (choose!53 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!458366) #b00000000000000000000000000000000 Nil!21993))))

(assert (=> d!125523 (bvslt (size!32069 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125523 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!458366) #b00000000000000000000000000000000 Nil!21993) lt!458421)))

(declare-fun b!1040466 () Bool)

(assert (=> b!1040466 (= e!589086 (arrayNoDuplicates!0 (array!65544 (store (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458366) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11560 thiss!1427))) #b00000000000000000000000000000000 Nil!21993))))

(assert (= (and d!125523 res!693690) b!1040466))

(declare-fun m!959541 () Bool)

(assert (=> d!125523 m!959541))

(assert (=> b!1040466 m!959413))

(declare-fun m!959543 () Bool)

(assert (=> b!1040466 m!959543))

(assert (=> b!1040341 d!125523))

(declare-fun b!1040467 () Bool)

(declare-fun e!589087 () Bool)

(declare-fun call!44044 () Bool)

(assert (=> b!1040467 (= e!589087 call!44044)))

(declare-fun bm!44041 () Bool)

(declare-fun c!105466 () Bool)

(assert (=> bm!44041 (= call!44044 (arrayNoDuplicates!0 lt!458369 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105466 (Cons!21992 (select (arr!31536 lt!458369) #b00000000000000000000000000000000) Nil!21993) Nil!21993)))))

(declare-fun b!1040468 () Bool)

(assert (=> b!1040468 (= e!589087 call!44044)))

(declare-fun b!1040469 () Bool)

(declare-fun e!589090 () Bool)

(assert (=> b!1040469 (= e!589090 e!589087)))

(assert (=> b!1040469 (= c!105466 (validKeyInArray!0 (select (arr!31536 lt!458369) #b00000000000000000000000000000000)))))

(declare-fun b!1040470 () Bool)

(declare-fun e!589088 () Bool)

(assert (=> b!1040470 (= e!589088 e!589090)))

(declare-fun res!693691 () Bool)

(assert (=> b!1040470 (=> (not res!693691) (not e!589090))))

(declare-fun e!589089 () Bool)

(assert (=> b!1040470 (= res!693691 (not e!589089))))

(declare-fun res!693693 () Bool)

(assert (=> b!1040470 (=> (not res!693693) (not e!589089))))

(assert (=> b!1040470 (= res!693693 (validKeyInArray!0 (select (arr!31536 lt!458369) #b00000000000000000000000000000000)))))

(declare-fun d!125525 () Bool)

(declare-fun res!693692 () Bool)

(assert (=> d!125525 (=> res!693692 e!589088)))

(assert (=> d!125525 (= res!693692 (bvsge #b00000000000000000000000000000000 (size!32069 lt!458369)))))

(assert (=> d!125525 (= (arrayNoDuplicates!0 lt!458369 #b00000000000000000000000000000000 Nil!21993) e!589088)))

(declare-fun b!1040471 () Bool)

(assert (=> b!1040471 (= e!589089 (contains!6030 Nil!21993 (select (arr!31536 lt!458369) #b00000000000000000000000000000000)))))

(assert (= (and d!125525 (not res!693692)) b!1040470))

(assert (= (and b!1040470 res!693693) b!1040471))

(assert (= (and b!1040470 res!693691) b!1040469))

(assert (= (and b!1040469 c!105466) b!1040467))

(assert (= (and b!1040469 (not c!105466)) b!1040468))

(assert (= (or b!1040467 b!1040468) bm!44041))

(assert (=> bm!44041 m!959511))

(declare-fun m!959545 () Bool)

(assert (=> bm!44041 m!959545))

(assert (=> b!1040469 m!959511))

(assert (=> b!1040469 m!959511))

(assert (=> b!1040469 m!959513))

(assert (=> b!1040470 m!959511))

(assert (=> b!1040470 m!959511))

(assert (=> b!1040470 m!959513))

(assert (=> b!1040471 m!959511))

(assert (=> b!1040471 m!959511))

(declare-fun m!959547 () Bool)

(assert (=> b!1040471 m!959547))

(assert (=> b!1040341 d!125525))

(declare-fun d!125527 () Bool)

(declare-fun res!693700 () Bool)

(declare-fun e!589093 () Bool)

(assert (=> d!125527 (=> (not res!693700) (not e!589093))))

(declare-fun simpleValid!434 (LongMapFixedSize!5920) Bool)

(assert (=> d!125527 (= res!693700 (simpleValid!434 thiss!1427))))

(assert (=> d!125527 (= (valid!2214 thiss!1427) e!589093)))

(declare-fun b!1040478 () Bool)

(declare-fun res!693701 () Bool)

(assert (=> b!1040478 (=> (not res!693701) (not e!589093))))

(assert (=> b!1040478 (= res!693701 (= (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11560 thiss!1427))) (_size!3015 thiss!1427)))))

(declare-fun b!1040479 () Bool)

(declare-fun res!693702 () Bool)

(assert (=> b!1040479 (=> (not res!693702) (not e!589093))))

(assert (=> b!1040479 (= res!693702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11560 thiss!1427) (mask!30333 thiss!1427)))))

(declare-fun b!1040480 () Bool)

(assert (=> b!1040480 (= e!589093 (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21993))))

(assert (= (and d!125527 res!693700) b!1040478))

(assert (= (and b!1040478 res!693701) b!1040479))

(assert (= (and b!1040479 res!693702) b!1040480))

(declare-fun m!959549 () Bool)

(assert (=> d!125527 m!959549))

(assert (=> b!1040478 m!959425))

(declare-fun m!959551 () Bool)

(assert (=> b!1040479 m!959551))

(assert (=> b!1040480 m!959437))

(assert (=> start!91166 d!125527))

(declare-fun d!125529 () Bool)

(assert (=> d!125529 (= (array_inv!24379 (_keys!11560 thiss!1427)) (bvsge (size!32069 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040336 d!125529))

(declare-fun d!125531 () Bool)

(assert (=> d!125531 (= (array_inv!24380 (_values!6365 thiss!1427)) (bvsge (size!32070 (_values!6365 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040336 d!125531))

(declare-fun b!1040493 () Bool)

(declare-fun e!589100 () SeekEntryResult!9792)

(assert (=> b!1040493 (= e!589100 Undefined!9792)))

(declare-fun b!1040494 () Bool)

(declare-fun c!105474 () Bool)

(declare-fun lt!458433 () (_ BitVec 64))

(assert (=> b!1040494 (= c!105474 (= lt!458433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589102 () SeekEntryResult!9792)

(declare-fun e!589101 () SeekEntryResult!9792)

(assert (=> b!1040494 (= e!589102 e!589101)))

(declare-fun d!125533 () Bool)

(declare-fun lt!458430 () SeekEntryResult!9792)

(assert (=> d!125533 (and (or ((_ is MissingVacant!9792) lt!458430) (not ((_ is Found!9792) lt!458430)) (and (bvsge (index!41540 lt!458430) #b00000000000000000000000000000000) (bvslt (index!41540 lt!458430) (size!32069 (_keys!11560 thiss!1427))))) (not ((_ is MissingVacant!9792) lt!458430)) (or (not ((_ is Found!9792) lt!458430)) (= (select (arr!31536 (_keys!11560 thiss!1427)) (index!41540 lt!458430)) key!909)))))

(assert (=> d!125533 (= lt!458430 e!589100)))

(declare-fun c!105475 () Bool)

(declare-fun lt!458432 () SeekEntryResult!9792)

(assert (=> d!125533 (= c!105475 (and ((_ is Intermediate!9792) lt!458432) (undefined!10604 lt!458432)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65543 (_ BitVec 32)) SeekEntryResult!9792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125533 (= lt!458432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30333 thiss!1427)) key!909 (_keys!11560 thiss!1427) (mask!30333 thiss!1427)))))

(assert (=> d!125533 (validMask!0 (mask!30333 thiss!1427))))

(assert (=> d!125533 (= (seekEntry!0 key!909 (_keys!11560 thiss!1427) (mask!30333 thiss!1427)) lt!458430)))

(declare-fun b!1040495 () Bool)

(assert (=> b!1040495 (= e!589100 e!589102)))

(assert (=> b!1040495 (= lt!458433 (select (arr!31536 (_keys!11560 thiss!1427)) (index!41541 lt!458432)))))

(declare-fun c!105473 () Bool)

(assert (=> b!1040495 (= c!105473 (= lt!458433 key!909))))

(declare-fun b!1040496 () Bool)

(assert (=> b!1040496 (= e!589101 (MissingZero!9792 (index!41541 lt!458432)))))

(declare-fun b!1040497 () Bool)

(assert (=> b!1040497 (= e!589102 (Found!9792 (index!41541 lt!458432)))))

(declare-fun b!1040498 () Bool)

(declare-fun lt!458431 () SeekEntryResult!9792)

(assert (=> b!1040498 (= e!589101 (ite ((_ is MissingVacant!9792) lt!458431) (MissingZero!9792 (index!41542 lt!458431)) lt!458431))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65543 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1040498 (= lt!458431 (seekKeyOrZeroReturnVacant!0 (x!92877 lt!458432) (index!41541 lt!458432) (index!41541 lt!458432) key!909 (_keys!11560 thiss!1427) (mask!30333 thiss!1427)))))

(assert (= (and d!125533 c!105475) b!1040493))

(assert (= (and d!125533 (not c!105475)) b!1040495))

(assert (= (and b!1040495 c!105473) b!1040497))

(assert (= (and b!1040495 (not c!105473)) b!1040494))

(assert (= (and b!1040494 c!105474) b!1040496))

(assert (= (and b!1040494 (not c!105474)) b!1040498))

(declare-fun m!959553 () Bool)

(assert (=> d!125533 m!959553))

(declare-fun m!959555 () Bool)

(assert (=> d!125533 m!959555))

(assert (=> d!125533 m!959555))

(declare-fun m!959557 () Bool)

(assert (=> d!125533 m!959557))

(assert (=> d!125533 m!959533))

(declare-fun m!959559 () Bool)

(assert (=> b!1040495 m!959559))

(declare-fun m!959561 () Bool)

(assert (=> b!1040498 m!959561))

(assert (=> b!1040342 d!125533))

(declare-fun d!125535 () Bool)

(assert (=> d!125535 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040337 d!125535))

(declare-fun mapNonEmpty!38689 () Bool)

(declare-fun mapRes!38689 () Bool)

(declare-fun tp!74252 () Bool)

(declare-fun e!589108 () Bool)

(assert (=> mapNonEmpty!38689 (= mapRes!38689 (and tp!74252 e!589108))))

(declare-fun mapKey!38689 () (_ BitVec 32))

(declare-fun mapValue!38689 () ValueCell!11663)

(declare-fun mapRest!38689 () (Array (_ BitVec 32) ValueCell!11663))

(assert (=> mapNonEmpty!38689 (= mapRest!38680 (store mapRest!38689 mapKey!38689 mapValue!38689))))

(declare-fun b!1040506 () Bool)

(declare-fun e!589107 () Bool)

(assert (=> b!1040506 (= e!589107 tp_is_empty!24733)))

(declare-fun b!1040505 () Bool)

(assert (=> b!1040505 (= e!589108 tp_is_empty!24733)))

(declare-fun condMapEmpty!38689 () Bool)

(declare-fun mapDefault!38689 () ValueCell!11663)

(assert (=> mapNonEmpty!38680 (= condMapEmpty!38689 (= mapRest!38680 ((as const (Array (_ BitVec 32) ValueCell!11663)) mapDefault!38689)))))

(assert (=> mapNonEmpty!38680 (= tp!74237 (and e!589107 mapRes!38689))))

(declare-fun mapIsEmpty!38689 () Bool)

(assert (=> mapIsEmpty!38689 mapRes!38689))

(assert (= (and mapNonEmpty!38680 condMapEmpty!38689) mapIsEmpty!38689))

(assert (= (and mapNonEmpty!38680 (not condMapEmpty!38689)) mapNonEmpty!38689))

(assert (= (and mapNonEmpty!38689 ((_ is ValueCellFull!11663) mapValue!38689)) b!1040505))

(assert (= (and mapNonEmpty!38680 ((_ is ValueCellFull!11663) mapDefault!38689)) b!1040506))

(declare-fun m!959563 () Bool)

(assert (=> mapNonEmpty!38689 m!959563))

(check-sat (not b!1040480) (not d!125517) (not b!1040419) (not b!1040430) (not bm!44033) (not b!1040418) (not b!1040441) (not bm!44041) (not d!125515) (not b!1040447) (not b!1040498) (not bm!44036) (not b!1040444) (not d!125527) (not bm!44040) (not b!1040442) (not b!1040470) (not b!1040466) (not b!1040469) (not b!1040478) tp_is_empty!24733 (not b!1040458) (not d!125533) (not b!1040479) (not d!125523) (not b!1040462) (not b!1040471) (not b!1040420) b_and!33519 (not b!1040431) (not bm!44039) (not mapNonEmpty!38689) (not b_next!21013))
(check-sat b_and!33519 (not b_next!21013))
