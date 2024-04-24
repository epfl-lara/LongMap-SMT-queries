; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91166 () Bool)

(assert start!91166)

(declare-fun b!1040282 () Bool)

(declare-fun b_free!20959 () Bool)

(declare-fun b_next!20959 () Bool)

(assert (=> b!1040282 (= b_free!20959 (not b_next!20959))))

(declare-fun tp!74047 () Bool)

(declare-fun b_and!33501 () Bool)

(assert (=> b!1040282 (= tp!74047 b_and!33501)))

(declare-fun b!1040278 () Bool)

(declare-fun e!588795 () Bool)

(declare-fun tp_is_empty!24679 () Bool)

(assert (=> b!1040278 (= e!588795 tp_is_empty!24679)))

(declare-fun b!1040279 () Bool)

(declare-fun e!588796 () Bool)

(assert (=> b!1040279 (= e!588796 tp_is_empty!24679)))

(declare-fun b!1040280 () Bool)

(declare-fun e!588797 () Bool)

(declare-fun e!588799 () Bool)

(assert (=> b!1040280 (= e!588797 (not e!588799))))

(declare-fun res!693471 () Bool)

(assert (=> b!1040280 (=> res!693471 e!588799)))

(declare-datatypes ((V!37779 0))(
  ( (V!37780 (val!12390 Int)) )
))
(declare-datatypes ((ValueCell!11636 0))(
  ( (ValueCellFull!11636 (v!14973 V!37779)) (EmptyCell!11636) )
))
(declare-datatypes ((array!65527 0))(
  ( (array!65528 (arr!31531 (Array (_ BitVec 32) (_ BitVec 64))) (size!32063 (_ BitVec 32))) )
))
(declare-datatypes ((array!65529 0))(
  ( (array!65530 (arr!31532 (Array (_ BitVec 32) ValueCell!11636)) (size!32064 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5866 0))(
  ( (LongMapFixedSize!5867 (defaultEntry!6315 Int) (mask!30329 (_ BitVec 32)) (extraKeys!6043 (_ BitVec 32)) (zeroValue!6149 V!37779) (minValue!6149 V!37779) (_size!2988 (_ BitVec 32)) (_keys!11560 array!65527) (_values!6338 array!65529) (_vacant!2988 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5866)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040280 (= res!693471 (not (validMask!0 (mask!30329 thiss!1427))))))

(declare-fun lt!458442 () array!65527)

(declare-datatypes ((List!21930 0))(
  ( (Nil!21927) (Cons!21926 (h!23139 (_ BitVec 64)) (t!31136 List!21930)) )
))
(declare-fun arrayNoDuplicates!0 (array!65527 (_ BitVec 32) List!21930) Bool)

(assert (=> b!1040280 (arrayNoDuplicates!0 lt!458442 #b00000000000000000000000000000000 Nil!21927)))

(declare-datatypes ((Unit!33987 0))(
  ( (Unit!33988) )
))
(declare-fun lt!458443 () Unit!33987)

(declare-datatypes ((SeekEntryResult!9732 0))(
  ( (MissingZero!9732 (index!41299 (_ BitVec 32))) (Found!9732 (index!41300 (_ BitVec 32))) (Intermediate!9732 (undefined!10544 Bool) (index!41301 (_ BitVec 32)) (x!92698 (_ BitVec 32))) (Undefined!9732) (MissingVacant!9732 (index!41302 (_ BitVec 32))) )
))
(declare-fun lt!458445 () SeekEntryResult!9732)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21930) Unit!33987)

(assert (=> b!1040280 (= lt!458443 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41300 lt!458445) #b00000000000000000000000000000000 Nil!21927))))

(declare-fun arrayCountValidKeys!0 (array!65527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040280 (= (arrayCountValidKeys!0 lt!458442 #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040280 (= lt!458442 (array!65528 (store (arr!31531 (_keys!11560 thiss!1427)) (index!41300 lt!458445) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11560 thiss!1427))))))

(declare-fun lt!458444 () Unit!33987)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65527 (_ BitVec 32) (_ BitVec 64)) Unit!33987)

(assert (=> b!1040280 (= lt!458444 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11560 thiss!1427) (index!41300 lt!458445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040281 () Bool)

(declare-fun e!588802 () Bool)

(assert (=> b!1040281 (= e!588802 e!588797)))

(declare-fun res!693469 () Bool)

(assert (=> b!1040281 (=> (not res!693469) (not e!588797))))

(get-info :version)

(assert (=> b!1040281 (= res!693469 ((_ is Found!9732) lt!458445))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65527 (_ BitVec 32)) SeekEntryResult!9732)

(assert (=> b!1040281 (= lt!458445 (seekEntry!0 key!909 (_keys!11560 thiss!1427) (mask!30329 thiss!1427)))))

(declare-fun mapIsEmpty!38572 () Bool)

(declare-fun mapRes!38572 () Bool)

(assert (=> mapIsEmpty!38572 mapRes!38572))

(declare-fun e!588800 () Bool)

(declare-fun e!588801 () Bool)

(declare-fun array_inv!24389 (array!65527) Bool)

(declare-fun array_inv!24390 (array!65529) Bool)

(assert (=> b!1040282 (= e!588800 (and tp!74047 tp_is_empty!24679 (array_inv!24389 (_keys!11560 thiss!1427)) (array_inv!24390 (_values!6338 thiss!1427)) e!588801))))

(declare-fun res!693472 () Bool)

(assert (=> start!91166 (=> (not res!693472) (not e!588802))))

(declare-fun valid!2216 (LongMapFixedSize!5866) Bool)

(assert (=> start!91166 (= res!693472 (valid!2216 thiss!1427))))

(assert (=> start!91166 e!588802))

(assert (=> start!91166 e!588800))

(assert (=> start!91166 true))

(declare-fun b!1040283 () Bool)

(declare-fun res!693470 () Bool)

(assert (=> b!1040283 (=> (not res!693470) (not e!588802))))

(assert (=> b!1040283 (= res!693470 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38572 () Bool)

(declare-fun tp!74048 () Bool)

(assert (=> mapNonEmpty!38572 (= mapRes!38572 (and tp!74048 e!588796))))

(declare-fun mapKey!38572 () (_ BitVec 32))

(declare-fun mapRest!38572 () (Array (_ BitVec 32) ValueCell!11636))

(declare-fun mapValue!38572 () ValueCell!11636)

(assert (=> mapNonEmpty!38572 (= (arr!31532 (_values!6338 thiss!1427)) (store mapRest!38572 mapKey!38572 mapValue!38572))))

(declare-fun b!1040284 () Bool)

(assert (=> b!1040284 (= e!588801 (and e!588795 mapRes!38572))))

(declare-fun condMapEmpty!38572 () Bool)

(declare-fun mapDefault!38572 () ValueCell!11636)

(assert (=> b!1040284 (= condMapEmpty!38572 (= (arr!31532 (_values!6338 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11636)) mapDefault!38572)))))

(declare-fun b!1040285 () Bool)

(assert (=> b!1040285 (= e!588799 (or (not (= (size!32063 (_keys!11560 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30329 thiss!1427)))) (bvslt (index!41300 lt!458445) #b00000000000000000000000000000000) (bvslt (index!41300 lt!458445) (size!32063 (_keys!11560 thiss!1427)))))))

(assert (= (and start!91166 res!693472) b!1040283))

(assert (= (and b!1040283 res!693470) b!1040281))

(assert (= (and b!1040281 res!693469) b!1040280))

(assert (= (and b!1040280 (not res!693471)) b!1040285))

(assert (= (and b!1040284 condMapEmpty!38572) mapIsEmpty!38572))

(assert (= (and b!1040284 (not condMapEmpty!38572)) mapNonEmpty!38572))

(assert (= (and mapNonEmpty!38572 ((_ is ValueCellFull!11636) mapValue!38572)) b!1040279))

(assert (= (and b!1040284 ((_ is ValueCellFull!11636) mapDefault!38572)) b!1040278))

(assert (= b!1040282 b!1040284))

(assert (= start!91166 b!1040282))

(declare-fun m!960437 () Bool)

(assert (=> mapNonEmpty!38572 m!960437))

(declare-fun m!960439 () Bool)

(assert (=> start!91166 m!960439))

(declare-fun m!960441 () Bool)

(assert (=> b!1040280 m!960441))

(declare-fun m!960443 () Bool)

(assert (=> b!1040280 m!960443))

(declare-fun m!960445 () Bool)

(assert (=> b!1040280 m!960445))

(declare-fun m!960447 () Bool)

(assert (=> b!1040280 m!960447))

(declare-fun m!960449 () Bool)

(assert (=> b!1040280 m!960449))

(declare-fun m!960451 () Bool)

(assert (=> b!1040280 m!960451))

(declare-fun m!960453 () Bool)

(assert (=> b!1040280 m!960453))

(declare-fun m!960455 () Bool)

(assert (=> b!1040282 m!960455))

(declare-fun m!960457 () Bool)

(assert (=> b!1040282 m!960457))

(declare-fun m!960459 () Bool)

(assert (=> b!1040281 m!960459))

(check-sat (not b!1040281) (not b_next!20959) (not mapNonEmpty!38572) b_and!33501 tp_is_empty!24679 (not start!91166) (not b!1040280) (not b!1040282))
(check-sat b_and!33501 (not b_next!20959))
(get-model)

(declare-fun d!125897 () Bool)

(assert (=> d!125897 (= (array_inv!24389 (_keys!11560 thiss!1427)) (bvsge (size!32063 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040282 d!125897))

(declare-fun d!125899 () Bool)

(assert (=> d!125899 (= (array_inv!24390 (_values!6338 thiss!1427)) (bvsge (size!32064 (_values!6338 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040282 d!125899))

(declare-fun b!1040346 () Bool)

(declare-fun e!588857 () SeekEntryResult!9732)

(declare-fun lt!458480 () SeekEntryResult!9732)

(assert (=> b!1040346 (= e!588857 (ite ((_ is MissingVacant!9732) lt!458480) (MissingZero!9732 (index!41302 lt!458480)) lt!458480))))

(declare-fun lt!458478 () SeekEntryResult!9732)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65527 (_ BitVec 32)) SeekEntryResult!9732)

(assert (=> b!1040346 (= lt!458480 (seekKeyOrZeroReturnVacant!0 (x!92698 lt!458478) (index!41301 lt!458478) (index!41301 lt!458478) key!909 (_keys!11560 thiss!1427) (mask!30329 thiss!1427)))))

(declare-fun b!1040347 () Bool)

(declare-fun c!105706 () Bool)

(declare-fun lt!458479 () (_ BitVec 64))

(assert (=> b!1040347 (= c!105706 (= lt!458479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588858 () SeekEntryResult!9732)

(assert (=> b!1040347 (= e!588858 e!588857)))

(declare-fun b!1040348 () Bool)

(assert (=> b!1040348 (= e!588858 (Found!9732 (index!41301 lt!458478)))))

(declare-fun d!125901 () Bool)

(declare-fun lt!458481 () SeekEntryResult!9732)

(assert (=> d!125901 (and (or ((_ is MissingVacant!9732) lt!458481) (not ((_ is Found!9732) lt!458481)) (and (bvsge (index!41300 lt!458481) #b00000000000000000000000000000000) (bvslt (index!41300 lt!458481) (size!32063 (_keys!11560 thiss!1427))))) (not ((_ is MissingVacant!9732) lt!458481)) (or (not ((_ is Found!9732) lt!458481)) (= (select (arr!31531 (_keys!11560 thiss!1427)) (index!41300 lt!458481)) key!909)))))

(declare-fun e!588859 () SeekEntryResult!9732)

(assert (=> d!125901 (= lt!458481 e!588859)))

(declare-fun c!105705 () Bool)

(assert (=> d!125901 (= c!105705 (and ((_ is Intermediate!9732) lt!458478) (undefined!10544 lt!458478)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65527 (_ BitVec 32)) SeekEntryResult!9732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125901 (= lt!458478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30329 thiss!1427)) key!909 (_keys!11560 thiss!1427) (mask!30329 thiss!1427)))))

(assert (=> d!125901 (validMask!0 (mask!30329 thiss!1427))))

(assert (=> d!125901 (= (seekEntry!0 key!909 (_keys!11560 thiss!1427) (mask!30329 thiss!1427)) lt!458481)))

(declare-fun b!1040349 () Bool)

(assert (=> b!1040349 (= e!588857 (MissingZero!9732 (index!41301 lt!458478)))))

(declare-fun b!1040350 () Bool)

(assert (=> b!1040350 (= e!588859 Undefined!9732)))

(declare-fun b!1040351 () Bool)

(assert (=> b!1040351 (= e!588859 e!588858)))

(assert (=> b!1040351 (= lt!458479 (select (arr!31531 (_keys!11560 thiss!1427)) (index!41301 lt!458478)))))

(declare-fun c!105707 () Bool)

(assert (=> b!1040351 (= c!105707 (= lt!458479 key!909))))

(assert (= (and d!125901 c!105705) b!1040350))

(assert (= (and d!125901 (not c!105705)) b!1040351))

(assert (= (and b!1040351 c!105707) b!1040348))

(assert (= (and b!1040351 (not c!105707)) b!1040347))

(assert (= (and b!1040347 c!105706) b!1040349))

(assert (= (and b!1040347 (not c!105706)) b!1040346))

(declare-fun m!960509 () Bool)

(assert (=> b!1040346 m!960509))

(declare-fun m!960511 () Bool)

(assert (=> d!125901 m!960511))

(declare-fun m!960513 () Bool)

(assert (=> d!125901 m!960513))

(assert (=> d!125901 m!960513))

(declare-fun m!960515 () Bool)

(assert (=> d!125901 m!960515))

(assert (=> d!125901 m!960443))

(declare-fun m!960517 () Bool)

(assert (=> b!1040351 m!960517))

(assert (=> b!1040281 d!125901))

(declare-fun b!1040362 () Bool)

(declare-fun e!588870 () Bool)

(declare-fun call!44041 () Bool)

(assert (=> b!1040362 (= e!588870 call!44041)))

(declare-fun bm!44038 () Bool)

(declare-fun c!105710 () Bool)

(assert (=> bm!44038 (= call!44041 (arrayNoDuplicates!0 lt!458442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105710 (Cons!21926 (select (arr!31531 lt!458442) #b00000000000000000000000000000000) Nil!21927) Nil!21927)))))

(declare-fun b!1040363 () Bool)

(assert (=> b!1040363 (= e!588870 call!44041)))

(declare-fun d!125903 () Bool)

(declare-fun res!693504 () Bool)

(declare-fun e!588869 () Bool)

(assert (=> d!125903 (=> res!693504 e!588869)))

(assert (=> d!125903 (= res!693504 (bvsge #b00000000000000000000000000000000 (size!32063 lt!458442)))))

(assert (=> d!125903 (= (arrayNoDuplicates!0 lt!458442 #b00000000000000000000000000000000 Nil!21927) e!588869)))

(declare-fun b!1040364 () Bool)

(declare-fun e!588871 () Bool)

(assert (=> b!1040364 (= e!588871 e!588870)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040364 (= c!105710 (validKeyInArray!0 (select (arr!31531 lt!458442) #b00000000000000000000000000000000)))))

(declare-fun b!1040365 () Bool)

(declare-fun e!588868 () Bool)

(declare-fun contains!6067 (List!21930 (_ BitVec 64)) Bool)

(assert (=> b!1040365 (= e!588868 (contains!6067 Nil!21927 (select (arr!31531 lt!458442) #b00000000000000000000000000000000)))))

(declare-fun b!1040366 () Bool)

(assert (=> b!1040366 (= e!588869 e!588871)))

(declare-fun res!693505 () Bool)

(assert (=> b!1040366 (=> (not res!693505) (not e!588871))))

(assert (=> b!1040366 (= res!693505 (not e!588868))))

(declare-fun res!693503 () Bool)

(assert (=> b!1040366 (=> (not res!693503) (not e!588868))))

(assert (=> b!1040366 (= res!693503 (validKeyInArray!0 (select (arr!31531 lt!458442) #b00000000000000000000000000000000)))))

(assert (= (and d!125903 (not res!693504)) b!1040366))

(assert (= (and b!1040366 res!693503) b!1040365))

(assert (= (and b!1040366 res!693505) b!1040364))

(assert (= (and b!1040364 c!105710) b!1040363))

(assert (= (and b!1040364 (not c!105710)) b!1040362))

(assert (= (or b!1040363 b!1040362) bm!44038))

(declare-fun m!960519 () Bool)

(assert (=> bm!44038 m!960519))

(declare-fun m!960521 () Bool)

(assert (=> bm!44038 m!960521))

(assert (=> b!1040364 m!960519))

(assert (=> b!1040364 m!960519))

(declare-fun m!960523 () Bool)

(assert (=> b!1040364 m!960523))

(assert (=> b!1040365 m!960519))

(assert (=> b!1040365 m!960519))

(declare-fun m!960525 () Bool)

(assert (=> b!1040365 m!960525))

(assert (=> b!1040366 m!960519))

(assert (=> b!1040366 m!960519))

(assert (=> b!1040366 m!960523))

(assert (=> b!1040280 d!125903))

(declare-fun d!125905 () Bool)

(declare-fun e!588874 () Bool)

(assert (=> d!125905 e!588874))

(declare-fun res!693508 () Bool)

(assert (=> d!125905 (=> (not res!693508) (not e!588874))))

(assert (=> d!125905 (= res!693508 (and (bvsge (index!41300 lt!458445) #b00000000000000000000000000000000) (bvslt (index!41300 lt!458445) (size!32063 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458484 () Unit!33987)

(declare-fun choose!53 (array!65527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21930) Unit!33987)

(assert (=> d!125905 (= lt!458484 (choose!53 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41300 lt!458445) #b00000000000000000000000000000000 Nil!21927))))

(assert (=> d!125905 (bvslt (size!32063 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125905 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41300 lt!458445) #b00000000000000000000000000000000 Nil!21927) lt!458484)))

(declare-fun b!1040369 () Bool)

(assert (=> b!1040369 (= e!588874 (arrayNoDuplicates!0 (array!65528 (store (arr!31531 (_keys!11560 thiss!1427)) (index!41300 lt!458445) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11560 thiss!1427))) #b00000000000000000000000000000000 Nil!21927))))

(assert (= (and d!125905 res!693508) b!1040369))

(declare-fun m!960527 () Bool)

(assert (=> d!125905 m!960527))

(assert (=> b!1040369 m!960445))

(declare-fun m!960529 () Bool)

(assert (=> b!1040369 m!960529))

(assert (=> b!1040280 d!125905))

(declare-fun b!1040378 () Bool)

(declare-fun e!588879 () (_ BitVec 32))

(declare-fun call!44044 () (_ BitVec 32))

(assert (=> b!1040378 (= e!588879 call!44044)))

(declare-fun b!1040379 () Bool)

(assert (=> b!1040379 (= e!588879 (bvadd #b00000000000000000000000000000001 call!44044))))

(declare-fun b!1040380 () Bool)

(declare-fun e!588880 () (_ BitVec 32))

(assert (=> b!1040380 (= e!588880 #b00000000000000000000000000000000)))

(declare-fun d!125907 () Bool)

(declare-fun lt!458487 () (_ BitVec 32))

(assert (=> d!125907 (and (bvsge lt!458487 #b00000000000000000000000000000000) (bvsle lt!458487 (bvsub (size!32063 lt!458442) #b00000000000000000000000000000000)))))

(assert (=> d!125907 (= lt!458487 e!588880)))

(declare-fun c!105715 () Bool)

(assert (=> d!125907 (= c!105715 (bvsge #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))))))

(assert (=> d!125907 (and (bvsle #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32063 (_keys!11560 thiss!1427)) (size!32063 lt!458442)))))

(assert (=> d!125907 (= (arrayCountValidKeys!0 lt!458442 #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) lt!458487)))

(declare-fun b!1040381 () Bool)

(assert (=> b!1040381 (= e!588880 e!588879)))

(declare-fun c!105716 () Bool)

(assert (=> b!1040381 (= c!105716 (validKeyInArray!0 (select (arr!31531 lt!458442) #b00000000000000000000000000000000)))))

(declare-fun bm!44041 () Bool)

(assert (=> bm!44041 (= call!44044 (arrayCountValidKeys!0 lt!458442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32063 (_keys!11560 thiss!1427))))))

(assert (= (and d!125907 c!105715) b!1040380))

(assert (= (and d!125907 (not c!105715)) b!1040381))

(assert (= (and b!1040381 c!105716) b!1040379))

(assert (= (and b!1040381 (not c!105716)) b!1040378))

(assert (= (or b!1040379 b!1040378) bm!44041))

(assert (=> b!1040381 m!960519))

(assert (=> b!1040381 m!960519))

(assert (=> b!1040381 m!960523))

(declare-fun m!960531 () Bool)

(assert (=> bm!44041 m!960531))

(assert (=> b!1040280 d!125907))

(declare-fun b!1040382 () Bool)

(declare-fun e!588881 () (_ BitVec 32))

(declare-fun call!44045 () (_ BitVec 32))

(assert (=> b!1040382 (= e!588881 call!44045)))

(declare-fun b!1040383 () Bool)

(assert (=> b!1040383 (= e!588881 (bvadd #b00000000000000000000000000000001 call!44045))))

(declare-fun b!1040384 () Bool)

(declare-fun e!588882 () (_ BitVec 32))

(assert (=> b!1040384 (= e!588882 #b00000000000000000000000000000000)))

(declare-fun d!125909 () Bool)

(declare-fun lt!458488 () (_ BitVec 32))

(assert (=> d!125909 (and (bvsge lt!458488 #b00000000000000000000000000000000) (bvsle lt!458488 (bvsub (size!32063 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125909 (= lt!458488 e!588882)))

(declare-fun c!105717 () Bool)

(assert (=> d!125909 (= c!105717 (bvsge #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))))))

(assert (=> d!125909 (and (bvsle #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32063 (_keys!11560 thiss!1427)) (size!32063 (_keys!11560 thiss!1427))))))

(assert (=> d!125909 (= (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) lt!458488)))

(declare-fun b!1040385 () Bool)

(assert (=> b!1040385 (= e!588882 e!588881)))

(declare-fun c!105718 () Bool)

(assert (=> b!1040385 (= c!105718 (validKeyInArray!0 (select (arr!31531 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44042 () Bool)

(assert (=> bm!44042 (= call!44045 (arrayCountValidKeys!0 (_keys!11560 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32063 (_keys!11560 thiss!1427))))))

(assert (= (and d!125909 c!105717) b!1040384))

(assert (= (and d!125909 (not c!105717)) b!1040385))

(assert (= (and b!1040385 c!105718) b!1040383))

(assert (= (and b!1040385 (not c!105718)) b!1040382))

(assert (= (or b!1040383 b!1040382) bm!44042))

(declare-fun m!960533 () Bool)

(assert (=> b!1040385 m!960533))

(assert (=> b!1040385 m!960533))

(declare-fun m!960535 () Bool)

(assert (=> b!1040385 m!960535))

(declare-fun m!960537 () Bool)

(assert (=> bm!44042 m!960537))

(assert (=> b!1040280 d!125909))

(declare-fun d!125911 () Bool)

(declare-fun e!588887 () Bool)

(assert (=> d!125911 e!588887))

(declare-fun res!693518 () Bool)

(assert (=> d!125911 (=> (not res!693518) (not e!588887))))

(assert (=> d!125911 (= res!693518 (and (bvsge (index!41300 lt!458445) #b00000000000000000000000000000000) (bvslt (index!41300 lt!458445) (size!32063 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458491 () Unit!33987)

(declare-fun choose!82 (array!65527 (_ BitVec 32) (_ BitVec 64)) Unit!33987)

(assert (=> d!125911 (= lt!458491 (choose!82 (_keys!11560 thiss!1427) (index!41300 lt!458445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588888 () Bool)

(assert (=> d!125911 e!588888))

(declare-fun res!693519 () Bool)

(assert (=> d!125911 (=> (not res!693519) (not e!588888))))

(assert (=> d!125911 (= res!693519 (and (bvsge (index!41300 lt!458445) #b00000000000000000000000000000000) (bvslt (index!41300 lt!458445) (size!32063 (_keys!11560 thiss!1427)))))))

(assert (=> d!125911 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11560 thiss!1427) (index!41300 lt!458445) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458491)))

(declare-fun b!1040397 () Bool)

(assert (=> b!1040397 (= e!588887 (= (arrayCountValidKeys!0 (array!65528 (store (arr!31531 (_keys!11560 thiss!1427)) (index!41300 lt!458445) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11560 thiss!1427))) #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040394 () Bool)

(declare-fun res!693520 () Bool)

(assert (=> b!1040394 (=> (not res!693520) (not e!588888))))

(assert (=> b!1040394 (= res!693520 (validKeyInArray!0 (select (arr!31531 (_keys!11560 thiss!1427)) (index!41300 lt!458445))))))

(declare-fun b!1040395 () Bool)

(declare-fun res!693517 () Bool)

(assert (=> b!1040395 (=> (not res!693517) (not e!588888))))

(assert (=> b!1040395 (= res!693517 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040396 () Bool)

(assert (=> b!1040396 (= e!588888 (bvslt (size!32063 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125911 res!693519) b!1040394))

(assert (= (and b!1040394 res!693520) b!1040395))

(assert (= (and b!1040395 res!693517) b!1040396))

(assert (= (and d!125911 res!693518) b!1040397))

(declare-fun m!960539 () Bool)

(assert (=> d!125911 m!960539))

(assert (=> b!1040397 m!960445))

(declare-fun m!960541 () Bool)

(assert (=> b!1040397 m!960541))

(assert (=> b!1040397 m!960447))

(declare-fun m!960543 () Bool)

(assert (=> b!1040394 m!960543))

(assert (=> b!1040394 m!960543))

(declare-fun m!960545 () Bool)

(assert (=> b!1040394 m!960545))

(declare-fun m!960547 () Bool)

(assert (=> b!1040395 m!960547))

(assert (=> b!1040280 d!125911))

(declare-fun d!125913 () Bool)

(assert (=> d!125913 (= (validMask!0 (mask!30329 thiss!1427)) (and (or (= (mask!30329 thiss!1427) #b00000000000000000000000000000111) (= (mask!30329 thiss!1427) #b00000000000000000000000000001111) (= (mask!30329 thiss!1427) #b00000000000000000000000000011111) (= (mask!30329 thiss!1427) #b00000000000000000000000000111111) (= (mask!30329 thiss!1427) #b00000000000000000000000001111111) (= (mask!30329 thiss!1427) #b00000000000000000000000011111111) (= (mask!30329 thiss!1427) #b00000000000000000000000111111111) (= (mask!30329 thiss!1427) #b00000000000000000000001111111111) (= (mask!30329 thiss!1427) #b00000000000000000000011111111111) (= (mask!30329 thiss!1427) #b00000000000000000000111111111111) (= (mask!30329 thiss!1427) #b00000000000000000001111111111111) (= (mask!30329 thiss!1427) #b00000000000000000011111111111111) (= (mask!30329 thiss!1427) #b00000000000000000111111111111111) (= (mask!30329 thiss!1427) #b00000000000000001111111111111111) (= (mask!30329 thiss!1427) #b00000000000000011111111111111111) (= (mask!30329 thiss!1427) #b00000000000000111111111111111111) (= (mask!30329 thiss!1427) #b00000000000001111111111111111111) (= (mask!30329 thiss!1427) #b00000000000011111111111111111111) (= (mask!30329 thiss!1427) #b00000000000111111111111111111111) (= (mask!30329 thiss!1427) #b00000000001111111111111111111111) (= (mask!30329 thiss!1427) #b00000000011111111111111111111111) (= (mask!30329 thiss!1427) #b00000000111111111111111111111111) (= (mask!30329 thiss!1427) #b00000001111111111111111111111111) (= (mask!30329 thiss!1427) #b00000011111111111111111111111111) (= (mask!30329 thiss!1427) #b00000111111111111111111111111111) (= (mask!30329 thiss!1427) #b00001111111111111111111111111111) (= (mask!30329 thiss!1427) #b00011111111111111111111111111111) (= (mask!30329 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30329 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040280 d!125913))

(declare-fun d!125915 () Bool)

(declare-fun res!693527 () Bool)

(declare-fun e!588891 () Bool)

(assert (=> d!125915 (=> (not res!693527) (not e!588891))))

(declare-fun simpleValid!425 (LongMapFixedSize!5866) Bool)

(assert (=> d!125915 (= res!693527 (simpleValid!425 thiss!1427))))

(assert (=> d!125915 (= (valid!2216 thiss!1427) e!588891)))

(declare-fun b!1040404 () Bool)

(declare-fun res!693528 () Bool)

(assert (=> b!1040404 (=> (not res!693528) (not e!588891))))

(assert (=> b!1040404 (= res!693528 (= (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11560 thiss!1427))) (_size!2988 thiss!1427)))))

(declare-fun b!1040405 () Bool)

(declare-fun res!693529 () Bool)

(assert (=> b!1040405 (=> (not res!693529) (not e!588891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65527 (_ BitVec 32)) Bool)

(assert (=> b!1040405 (= res!693529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11560 thiss!1427) (mask!30329 thiss!1427)))))

(declare-fun b!1040406 () Bool)

(assert (=> b!1040406 (= e!588891 (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21927))))

(assert (= (and d!125915 res!693527) b!1040404))

(assert (= (and b!1040404 res!693528) b!1040405))

(assert (= (and b!1040405 res!693529) b!1040406))

(declare-fun m!960549 () Bool)

(assert (=> d!125915 m!960549))

(assert (=> b!1040404 m!960447))

(declare-fun m!960551 () Bool)

(assert (=> b!1040405 m!960551))

(declare-fun m!960553 () Bool)

(assert (=> b!1040406 m!960553))

(assert (=> start!91166 d!125915))

(declare-fun mapNonEmpty!38581 () Bool)

(declare-fun mapRes!38581 () Bool)

(declare-fun tp!74063 () Bool)

(declare-fun e!588897 () Bool)

(assert (=> mapNonEmpty!38581 (= mapRes!38581 (and tp!74063 e!588897))))

(declare-fun mapRest!38581 () (Array (_ BitVec 32) ValueCell!11636))

(declare-fun mapKey!38581 () (_ BitVec 32))

(declare-fun mapValue!38581 () ValueCell!11636)

(assert (=> mapNonEmpty!38581 (= mapRest!38572 (store mapRest!38581 mapKey!38581 mapValue!38581))))

(declare-fun b!1040413 () Bool)

(assert (=> b!1040413 (= e!588897 tp_is_empty!24679)))

(declare-fun b!1040414 () Bool)

(declare-fun e!588896 () Bool)

(assert (=> b!1040414 (= e!588896 tp_is_empty!24679)))

(declare-fun mapIsEmpty!38581 () Bool)

(assert (=> mapIsEmpty!38581 mapRes!38581))

(declare-fun condMapEmpty!38581 () Bool)

(declare-fun mapDefault!38581 () ValueCell!11636)

(assert (=> mapNonEmpty!38572 (= condMapEmpty!38581 (= mapRest!38572 ((as const (Array (_ BitVec 32) ValueCell!11636)) mapDefault!38581)))))

(assert (=> mapNonEmpty!38572 (= tp!74048 (and e!588896 mapRes!38581))))

(assert (= (and mapNonEmpty!38572 condMapEmpty!38581) mapIsEmpty!38581))

(assert (= (and mapNonEmpty!38572 (not condMapEmpty!38581)) mapNonEmpty!38581))

(assert (= (and mapNonEmpty!38581 ((_ is ValueCellFull!11636) mapValue!38581)) b!1040413))

(assert (= (and mapNonEmpty!38572 ((_ is ValueCellFull!11636) mapDefault!38581)) b!1040414))

(declare-fun m!960555 () Bool)

(assert (=> mapNonEmpty!38581 m!960555))

(check-sat (not b_next!20959) (not bm!44042) (not d!125901) (not b!1040394) (not b!1040369) (not b!1040364) (not b!1040346) tp_is_empty!24679 (not b!1040405) (not b!1040395) (not bm!44038) (not b!1040366) (not b!1040406) (not bm!44041) (not d!125911) (not b!1040381) (not d!125915) (not b!1040365) b_and!33501 (not b!1040397) (not b!1040385) (not b!1040404) (not mapNonEmpty!38581) (not d!125905))
(check-sat b_and!33501 (not b_next!20959))
