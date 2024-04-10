; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91064 () Bool)

(assert start!91064)

(declare-fun b!1039829 () Bool)

(declare-fun b_free!20991 () Bool)

(declare-fun b_next!20991 () Bool)

(assert (=> b!1039829 (= b_free!20991 (not b_next!20991))))

(declare-fun tp!74159 () Bool)

(declare-fun b_and!33523 () Bool)

(assert (=> b!1039829 (= tp!74159 b_and!33523)))

(declare-fun mapIsEmpty!38635 () Bool)

(declare-fun mapRes!38635 () Bool)

(assert (=> mapIsEmpty!38635 mapRes!38635))

(declare-fun tp_is_empty!24711 () Bool)

(declare-datatypes ((V!37821 0))(
  ( (V!37822 (val!12406 Int)) )
))
(declare-datatypes ((ValueCell!11652 0))(
  ( (ValueCellFull!11652 (v!14993 V!37821)) (EmptyCell!11652) )
))
(declare-datatypes ((array!65552 0))(
  ( (array!65553 (arr!31545 (Array (_ BitVec 32) (_ BitVec 64))) (size!32076 (_ BitVec 32))) )
))
(declare-datatypes ((array!65554 0))(
  ( (array!65555 (arr!31546 (Array (_ BitVec 32) ValueCell!11652)) (size!32077 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5898 0))(
  ( (LongMapFixedSize!5899 (defaultEntry!6331 Int) (mask!30307 (_ BitVec 32)) (extraKeys!6059 (_ BitVec 32)) (zeroValue!6165 V!37821) (minValue!6165 V!37821) (_size!3004 (_ BitVec 32)) (_keys!11545 array!65552) (_values!6354 array!65554) (_vacant!3004 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5898)

(declare-fun e!588588 () Bool)

(declare-fun e!588590 () Bool)

(declare-fun array_inv!24385 (array!65552) Bool)

(declare-fun array_inv!24386 (array!65554) Bool)

(assert (=> b!1039829 (= e!588590 (and tp!74159 tp_is_empty!24711 (array_inv!24385 (_keys!11545 thiss!1427)) (array_inv!24386 (_values!6354 thiss!1427)) e!588588))))

(declare-fun b!1039830 () Bool)

(declare-fun e!588589 () Bool)

(assert (=> b!1039830 (= e!588589 tp_is_empty!24711)))

(declare-fun b!1039831 () Bool)

(declare-fun res!693379 () Bool)

(declare-fun e!588591 () Bool)

(assert (=> b!1039831 (=> (not res!693379) (not e!588591))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039831 (= res!693379 (not (= key!909 (bvneg key!909))))))

(declare-fun res!693377 () Bool)

(assert (=> start!91064 (=> (not res!693377) (not e!588591))))

(declare-fun valid!2216 (LongMapFixedSize!5898) Bool)

(assert (=> start!91064 (= res!693377 (valid!2216 thiss!1427))))

(assert (=> start!91064 e!588591))

(assert (=> start!91064 e!588590))

(assert (=> start!91064 true))

(declare-fun b!1039832 () Bool)

(declare-fun e!588592 () Bool)

(assert (=> b!1039832 (= e!588592 tp_is_empty!24711)))

(declare-fun mapNonEmpty!38635 () Bool)

(declare-fun tp!74158 () Bool)

(assert (=> mapNonEmpty!38635 (= mapRes!38635 (and tp!74158 e!588589))))

(declare-fun mapValue!38635 () ValueCell!11652)

(declare-fun mapRest!38635 () (Array (_ BitVec 32) ValueCell!11652))

(declare-fun mapKey!38635 () (_ BitVec 32))

(assert (=> mapNonEmpty!38635 (= (arr!31546 (_values!6354 thiss!1427)) (store mapRest!38635 mapKey!38635 mapValue!38635))))

(declare-fun b!1039833 () Bool)

(declare-fun e!588587 () Bool)

(declare-datatypes ((SeekEntryResult!9789 0))(
  ( (MissingZero!9789 (index!41527 (_ BitVec 32))) (Found!9789 (index!41528 (_ BitVec 32))) (Intermediate!9789 (undefined!10601 Bool) (index!41529 (_ BitVec 32)) (x!92813 (_ BitVec 32))) (Undefined!9789) (MissingVacant!9789 (index!41530 (_ BitVec 32))) )
))
(declare-fun lt!458266 () SeekEntryResult!9789)

(assert (=> b!1039833 (= e!588587 (not (or (bvslt (index!41528 lt!458266) #b00000000000000000000000000000000) (bvslt (index!41528 lt!458266) (size!32076 (_keys!11545 thiss!1427))))))))

(declare-fun lt!458267 () array!65552)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65552 (_ BitVec 32)) Bool)

(assert (=> b!1039833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458267 (mask!30307 thiss!1427))))

(declare-datatypes ((Unit!34003 0))(
  ( (Unit!34004) )
))
(declare-fun lt!458268 () Unit!34003)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65552 (_ BitVec 32) (_ BitVec 32)) Unit!34003)

(assert (=> b!1039833 (= lt!458268 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11545 thiss!1427) (index!41528 lt!458266) (mask!30307 thiss!1427)))))

(declare-datatypes ((List!21951 0))(
  ( (Nil!21948) (Cons!21947 (h!23151 (_ BitVec 64)) (t!31165 List!21951)) )
))
(declare-fun arrayNoDuplicates!0 (array!65552 (_ BitVec 32) List!21951) Bool)

(assert (=> b!1039833 (arrayNoDuplicates!0 lt!458267 #b00000000000000000000000000000000 Nil!21948)))

(declare-fun lt!458264 () Unit!34003)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21951) Unit!34003)

(assert (=> b!1039833 (= lt!458264 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41528 lt!458266) #b00000000000000000000000000000000 Nil!21948))))

(declare-fun arrayCountValidKeys!0 (array!65552 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039833 (= (arrayCountValidKeys!0 lt!458267 #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039833 (= lt!458267 (array!65553 (store (arr!31545 (_keys!11545 thiss!1427)) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32076 (_keys!11545 thiss!1427))))))

(declare-fun lt!458265 () Unit!34003)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65552 (_ BitVec 32) (_ BitVec 64)) Unit!34003)

(assert (=> b!1039833 (= lt!458265 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11545 thiss!1427) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039834 () Bool)

(assert (=> b!1039834 (= e!588588 (and e!588592 mapRes!38635))))

(declare-fun condMapEmpty!38635 () Bool)

(declare-fun mapDefault!38635 () ValueCell!11652)

(assert (=> b!1039834 (= condMapEmpty!38635 (= (arr!31546 (_values!6354 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11652)) mapDefault!38635)))))

(declare-fun b!1039835 () Bool)

(assert (=> b!1039835 (= e!588591 e!588587)))

(declare-fun res!693378 () Bool)

(assert (=> b!1039835 (=> (not res!693378) (not e!588587))))

(get-info :version)

(assert (=> b!1039835 (= res!693378 ((_ is Found!9789) lt!458266))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65552 (_ BitVec 32)) SeekEntryResult!9789)

(assert (=> b!1039835 (= lt!458266 (seekEntry!0 key!909 (_keys!11545 thiss!1427) (mask!30307 thiss!1427)))))

(assert (= (and start!91064 res!693377) b!1039831))

(assert (= (and b!1039831 res!693379) b!1039835))

(assert (= (and b!1039835 res!693378) b!1039833))

(assert (= (and b!1039834 condMapEmpty!38635) mapIsEmpty!38635))

(assert (= (and b!1039834 (not condMapEmpty!38635)) mapNonEmpty!38635))

(assert (= (and mapNonEmpty!38635 ((_ is ValueCellFull!11652) mapValue!38635)) b!1039830))

(assert (= (and b!1039834 ((_ is ValueCellFull!11652) mapDefault!38635)) b!1039832))

(assert (= b!1039829 b!1039834))

(assert (= start!91064 b!1039829))

(declare-fun m!959471 () Bool)

(assert (=> b!1039829 m!959471))

(declare-fun m!959473 () Bool)

(assert (=> b!1039829 m!959473))

(declare-fun m!959475 () Bool)

(assert (=> b!1039833 m!959475))

(declare-fun m!959477 () Bool)

(assert (=> b!1039833 m!959477))

(declare-fun m!959479 () Bool)

(assert (=> b!1039833 m!959479))

(declare-fun m!959481 () Bool)

(assert (=> b!1039833 m!959481))

(declare-fun m!959483 () Bool)

(assert (=> b!1039833 m!959483))

(declare-fun m!959485 () Bool)

(assert (=> b!1039833 m!959485))

(declare-fun m!959487 () Bool)

(assert (=> b!1039833 m!959487))

(declare-fun m!959489 () Bool)

(assert (=> b!1039833 m!959489))

(declare-fun m!959491 () Bool)

(assert (=> mapNonEmpty!38635 m!959491))

(declare-fun m!959493 () Bool)

(assert (=> start!91064 m!959493))

(declare-fun m!959495 () Bool)

(assert (=> b!1039835 m!959495))

(check-sat (not b!1039829) tp_is_empty!24711 (not b!1039833) (not start!91064) (not b!1039835) (not mapNonEmpty!38635) b_and!33523 (not b_next!20991))
(check-sat b_and!33523 (not b_next!20991))
(get-model)

(declare-fun d!125559 () Bool)

(assert (=> d!125559 (= (array_inv!24385 (_keys!11545 thiss!1427)) (bvsge (size!32076 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039829 d!125559))

(declare-fun d!125561 () Bool)

(assert (=> d!125561 (= (array_inv!24386 (_values!6354 thiss!1427)) (bvsge (size!32077 (_values!6354 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039829 d!125561))

(declare-fun d!125563 () Bool)

(declare-fun e!588616 () Bool)

(assert (=> d!125563 e!588616))

(declare-fun res!693391 () Bool)

(assert (=> d!125563 (=> (not res!693391) (not e!588616))))

(assert (=> d!125563 (= res!693391 (and (bvsge (index!41528 lt!458266) #b00000000000000000000000000000000) (bvslt (index!41528 lt!458266) (size!32076 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458286 () Unit!34003)

(declare-fun choose!25 (array!65552 (_ BitVec 32) (_ BitVec 32)) Unit!34003)

(assert (=> d!125563 (= lt!458286 (choose!25 (_keys!11545 thiss!1427) (index!41528 lt!458266) (mask!30307 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125563 (validMask!0 (mask!30307 thiss!1427))))

(assert (=> d!125563 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11545 thiss!1427) (index!41528 lt!458266) (mask!30307 thiss!1427)) lt!458286)))

(declare-fun b!1039859 () Bool)

(assert (=> b!1039859 (= e!588616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65553 (store (arr!31545 (_keys!11545 thiss!1427)) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32076 (_keys!11545 thiss!1427))) (mask!30307 thiss!1427)))))

(assert (= (and d!125563 res!693391) b!1039859))

(declare-fun m!959523 () Bool)

(assert (=> d!125563 m!959523))

(declare-fun m!959525 () Bool)

(assert (=> d!125563 m!959525))

(assert (=> b!1039859 m!959477))

(declare-fun m!959527 () Bool)

(assert (=> b!1039859 m!959527))

(assert (=> b!1039833 d!125563))

(declare-fun d!125565 () Bool)

(declare-fun e!588619 () Bool)

(assert (=> d!125565 e!588619))

(declare-fun res!693394 () Bool)

(assert (=> d!125565 (=> (not res!693394) (not e!588619))))

(assert (=> d!125565 (= res!693394 (and (bvsge (index!41528 lt!458266) #b00000000000000000000000000000000) (bvslt (index!41528 lt!458266) (size!32076 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458289 () Unit!34003)

(declare-fun choose!53 (array!65552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21951) Unit!34003)

(assert (=> d!125565 (= lt!458289 (choose!53 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41528 lt!458266) #b00000000000000000000000000000000 Nil!21948))))

(assert (=> d!125565 (bvslt (size!32076 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125565 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41528 lt!458266) #b00000000000000000000000000000000 Nil!21948) lt!458289)))

(declare-fun b!1039862 () Bool)

(assert (=> b!1039862 (= e!588619 (arrayNoDuplicates!0 (array!65553 (store (arr!31545 (_keys!11545 thiss!1427)) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32076 (_keys!11545 thiss!1427))) #b00000000000000000000000000000000 Nil!21948))))

(assert (= (and d!125565 res!693394) b!1039862))

(declare-fun m!959529 () Bool)

(assert (=> d!125565 m!959529))

(assert (=> b!1039862 m!959477))

(declare-fun m!959531 () Bool)

(assert (=> b!1039862 m!959531))

(assert (=> b!1039833 d!125565))

(declare-fun bm!44014 () Bool)

(declare-fun call!44017 () (_ BitVec 32))

(assert (=> bm!44014 (= call!44017 (arrayCountValidKeys!0 lt!458267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32076 (_keys!11545 thiss!1427))))))

(declare-fun d!125567 () Bool)

(declare-fun lt!458292 () (_ BitVec 32))

(assert (=> d!125567 (and (bvsge lt!458292 #b00000000000000000000000000000000) (bvsle lt!458292 (bvsub (size!32076 lt!458267) #b00000000000000000000000000000000)))))

(declare-fun e!588625 () (_ BitVec 32))

(assert (=> d!125567 (= lt!458292 e!588625)))

(declare-fun c!105402 () Bool)

(assert (=> d!125567 (= c!105402 (bvsge #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))))))

(assert (=> d!125567 (and (bvsle #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32076 (_keys!11545 thiss!1427)) (size!32076 lt!458267)))))

(assert (=> d!125567 (= (arrayCountValidKeys!0 lt!458267 #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) lt!458292)))

(declare-fun b!1039871 () Bool)

(declare-fun e!588624 () (_ BitVec 32))

(assert (=> b!1039871 (= e!588625 e!588624)))

(declare-fun c!105401 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039871 (= c!105401 (validKeyInArray!0 (select (arr!31545 lt!458267) #b00000000000000000000000000000000)))))

(declare-fun b!1039872 () Bool)

(assert (=> b!1039872 (= e!588624 call!44017)))

(declare-fun b!1039873 () Bool)

(assert (=> b!1039873 (= e!588624 (bvadd #b00000000000000000000000000000001 call!44017))))

(declare-fun b!1039874 () Bool)

(assert (=> b!1039874 (= e!588625 #b00000000000000000000000000000000)))

(assert (= (and d!125567 c!105402) b!1039874))

(assert (= (and d!125567 (not c!105402)) b!1039871))

(assert (= (and b!1039871 c!105401) b!1039873))

(assert (= (and b!1039871 (not c!105401)) b!1039872))

(assert (= (or b!1039873 b!1039872) bm!44014))

(declare-fun m!959533 () Bool)

(assert (=> bm!44014 m!959533))

(declare-fun m!959535 () Bool)

(assert (=> b!1039871 m!959535))

(assert (=> b!1039871 m!959535))

(declare-fun m!959537 () Bool)

(assert (=> b!1039871 m!959537))

(assert (=> b!1039833 d!125567))

(declare-fun b!1039886 () Bool)

(declare-fun e!588630 () Bool)

(assert (=> b!1039886 (= e!588630 (= (arrayCountValidKeys!0 (array!65553 (store (arr!31545 (_keys!11545 thiss!1427)) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32076 (_keys!11545 thiss!1427))) #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039884 () Bool)

(declare-fun res!693403 () Bool)

(declare-fun e!588631 () Bool)

(assert (=> b!1039884 (=> (not res!693403) (not e!588631))))

(assert (=> b!1039884 (= res!693403 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039883 () Bool)

(declare-fun res!693406 () Bool)

(assert (=> b!1039883 (=> (not res!693406) (not e!588631))))

(assert (=> b!1039883 (= res!693406 (validKeyInArray!0 (select (arr!31545 (_keys!11545 thiss!1427)) (index!41528 lt!458266))))))

(declare-fun b!1039885 () Bool)

(assert (=> b!1039885 (= e!588631 (bvslt (size!32076 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125569 () Bool)

(assert (=> d!125569 e!588630))

(declare-fun res!693404 () Bool)

(assert (=> d!125569 (=> (not res!693404) (not e!588630))))

(assert (=> d!125569 (= res!693404 (and (bvsge (index!41528 lt!458266) #b00000000000000000000000000000000) (bvslt (index!41528 lt!458266) (size!32076 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458295 () Unit!34003)

(declare-fun choose!82 (array!65552 (_ BitVec 32) (_ BitVec 64)) Unit!34003)

(assert (=> d!125569 (= lt!458295 (choose!82 (_keys!11545 thiss!1427) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125569 e!588631))

(declare-fun res!693405 () Bool)

(assert (=> d!125569 (=> (not res!693405) (not e!588631))))

(assert (=> d!125569 (= res!693405 (and (bvsge (index!41528 lt!458266) #b00000000000000000000000000000000) (bvslt (index!41528 lt!458266) (size!32076 (_keys!11545 thiss!1427)))))))

(assert (=> d!125569 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11545 thiss!1427) (index!41528 lt!458266) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458295)))

(assert (= (and d!125569 res!693405) b!1039883))

(assert (= (and b!1039883 res!693406) b!1039884))

(assert (= (and b!1039884 res!693403) b!1039885))

(assert (= (and d!125569 res!693404) b!1039886))

(assert (=> b!1039886 m!959477))

(declare-fun m!959539 () Bool)

(assert (=> b!1039886 m!959539))

(assert (=> b!1039886 m!959481))

(declare-fun m!959541 () Bool)

(assert (=> b!1039884 m!959541))

(declare-fun m!959543 () Bool)

(assert (=> b!1039883 m!959543))

(assert (=> b!1039883 m!959543))

(declare-fun m!959545 () Bool)

(assert (=> b!1039883 m!959545))

(declare-fun m!959547 () Bool)

(assert (=> d!125569 m!959547))

(assert (=> b!1039833 d!125569))

(declare-fun b!1039897 () Bool)

(declare-fun e!588642 () Bool)

(declare-fun call!44020 () Bool)

(assert (=> b!1039897 (= e!588642 call!44020)))

(declare-fun d!125571 () Bool)

(declare-fun res!693414 () Bool)

(declare-fun e!588640 () Bool)

(assert (=> d!125571 (=> res!693414 e!588640)))

(assert (=> d!125571 (= res!693414 (bvsge #b00000000000000000000000000000000 (size!32076 lt!458267)))))

(assert (=> d!125571 (= (arrayNoDuplicates!0 lt!458267 #b00000000000000000000000000000000 Nil!21948) e!588640)))

(declare-fun b!1039898 () Bool)

(declare-fun e!588641 () Bool)

(assert (=> b!1039898 (= e!588640 e!588641)))

(declare-fun res!693415 () Bool)

(assert (=> b!1039898 (=> (not res!693415) (not e!588641))))

(declare-fun e!588643 () Bool)

(assert (=> b!1039898 (= res!693415 (not e!588643))))

(declare-fun res!693413 () Bool)

(assert (=> b!1039898 (=> (not res!693413) (not e!588643))))

(assert (=> b!1039898 (= res!693413 (validKeyInArray!0 (select (arr!31545 lt!458267) #b00000000000000000000000000000000)))))

(declare-fun b!1039899 () Bool)

(assert (=> b!1039899 (= e!588641 e!588642)))

(declare-fun c!105405 () Bool)

(assert (=> b!1039899 (= c!105405 (validKeyInArray!0 (select (arr!31545 lt!458267) #b00000000000000000000000000000000)))))

(declare-fun bm!44017 () Bool)

(assert (=> bm!44017 (= call!44020 (arrayNoDuplicates!0 lt!458267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105405 (Cons!21947 (select (arr!31545 lt!458267) #b00000000000000000000000000000000) Nil!21948) Nil!21948)))))

(declare-fun b!1039900 () Bool)

(declare-fun contains!6046 (List!21951 (_ BitVec 64)) Bool)

(assert (=> b!1039900 (= e!588643 (contains!6046 Nil!21948 (select (arr!31545 lt!458267) #b00000000000000000000000000000000)))))

(declare-fun b!1039901 () Bool)

(assert (=> b!1039901 (= e!588642 call!44020)))

(assert (= (and d!125571 (not res!693414)) b!1039898))

(assert (= (and b!1039898 res!693413) b!1039900))

(assert (= (and b!1039898 res!693415) b!1039899))

(assert (= (and b!1039899 c!105405) b!1039901))

(assert (= (and b!1039899 (not c!105405)) b!1039897))

(assert (= (or b!1039901 b!1039897) bm!44017))

(assert (=> b!1039898 m!959535))

(assert (=> b!1039898 m!959535))

(assert (=> b!1039898 m!959537))

(assert (=> b!1039899 m!959535))

(assert (=> b!1039899 m!959535))

(assert (=> b!1039899 m!959537))

(assert (=> bm!44017 m!959535))

(declare-fun m!959549 () Bool)

(assert (=> bm!44017 m!959549))

(assert (=> b!1039900 m!959535))

(assert (=> b!1039900 m!959535))

(declare-fun m!959551 () Bool)

(assert (=> b!1039900 m!959551))

(assert (=> b!1039833 d!125571))

(declare-fun b!1039910 () Bool)

(declare-fun e!588650 () Bool)

(declare-fun e!588652 () Bool)

(assert (=> b!1039910 (= e!588650 e!588652)))

(declare-fun c!105408 () Bool)

(assert (=> b!1039910 (= c!105408 (validKeyInArray!0 (select (arr!31545 lt!458267) #b00000000000000000000000000000000)))))

(declare-fun b!1039911 () Bool)

(declare-fun call!44023 () Bool)

(assert (=> b!1039911 (= e!588652 call!44023)))

(declare-fun b!1039912 () Bool)

(declare-fun e!588651 () Bool)

(assert (=> b!1039912 (= e!588652 e!588651)))

(declare-fun lt!458304 () (_ BitVec 64))

(assert (=> b!1039912 (= lt!458304 (select (arr!31545 lt!458267) #b00000000000000000000000000000000))))

(declare-fun lt!458302 () Unit!34003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65552 (_ BitVec 64) (_ BitVec 32)) Unit!34003)

(assert (=> b!1039912 (= lt!458302 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458267 lt!458304 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039912 (arrayContainsKey!0 lt!458267 lt!458304 #b00000000000000000000000000000000)))

(declare-fun lt!458303 () Unit!34003)

(assert (=> b!1039912 (= lt!458303 lt!458302)))

(declare-fun res!693421 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65552 (_ BitVec 32)) SeekEntryResult!9789)

(assert (=> b!1039912 (= res!693421 (= (seekEntryOrOpen!0 (select (arr!31545 lt!458267) #b00000000000000000000000000000000) lt!458267 (mask!30307 thiss!1427)) (Found!9789 #b00000000000000000000000000000000)))))

(assert (=> b!1039912 (=> (not res!693421) (not e!588651))))

(declare-fun b!1039913 () Bool)

(assert (=> b!1039913 (= e!588651 call!44023)))

(declare-fun d!125573 () Bool)

(declare-fun res!693420 () Bool)

(assert (=> d!125573 (=> res!693420 e!588650)))

(assert (=> d!125573 (= res!693420 (bvsge #b00000000000000000000000000000000 (size!32076 lt!458267)))))

(assert (=> d!125573 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458267 (mask!30307 thiss!1427)) e!588650)))

(declare-fun bm!44020 () Bool)

(assert (=> bm!44020 (= call!44023 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458267 (mask!30307 thiss!1427)))))

(assert (= (and d!125573 (not res!693420)) b!1039910))

(assert (= (and b!1039910 c!105408) b!1039912))

(assert (= (and b!1039910 (not c!105408)) b!1039911))

(assert (= (and b!1039912 res!693421) b!1039913))

(assert (= (or b!1039913 b!1039911) bm!44020))

(assert (=> b!1039910 m!959535))

(assert (=> b!1039910 m!959535))

(assert (=> b!1039910 m!959537))

(assert (=> b!1039912 m!959535))

(declare-fun m!959553 () Bool)

(assert (=> b!1039912 m!959553))

(declare-fun m!959555 () Bool)

(assert (=> b!1039912 m!959555))

(assert (=> b!1039912 m!959535))

(declare-fun m!959557 () Bool)

(assert (=> b!1039912 m!959557))

(declare-fun m!959559 () Bool)

(assert (=> bm!44020 m!959559))

(assert (=> b!1039833 d!125573))

(declare-fun bm!44021 () Bool)

(declare-fun call!44024 () (_ BitVec 32))

(assert (=> bm!44021 (= call!44024 (arrayCountValidKeys!0 (_keys!11545 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32076 (_keys!11545 thiss!1427))))))

(declare-fun d!125575 () Bool)

(declare-fun lt!458305 () (_ BitVec 32))

(assert (=> d!125575 (and (bvsge lt!458305 #b00000000000000000000000000000000) (bvsle lt!458305 (bvsub (size!32076 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588654 () (_ BitVec 32))

(assert (=> d!125575 (= lt!458305 e!588654)))

(declare-fun c!105410 () Bool)

(assert (=> d!125575 (= c!105410 (bvsge #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))))))

(assert (=> d!125575 (and (bvsle #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32076 (_keys!11545 thiss!1427)) (size!32076 (_keys!11545 thiss!1427))))))

(assert (=> d!125575 (= (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) lt!458305)))

(declare-fun b!1039914 () Bool)

(declare-fun e!588653 () (_ BitVec 32))

(assert (=> b!1039914 (= e!588654 e!588653)))

(declare-fun c!105409 () Bool)

(assert (=> b!1039914 (= c!105409 (validKeyInArray!0 (select (arr!31545 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039915 () Bool)

(assert (=> b!1039915 (= e!588653 call!44024)))

(declare-fun b!1039916 () Bool)

(assert (=> b!1039916 (= e!588653 (bvadd #b00000000000000000000000000000001 call!44024))))

(declare-fun b!1039917 () Bool)

(assert (=> b!1039917 (= e!588654 #b00000000000000000000000000000000)))

(assert (= (and d!125575 c!105410) b!1039917))

(assert (= (and d!125575 (not c!105410)) b!1039914))

(assert (= (and b!1039914 c!105409) b!1039916))

(assert (= (and b!1039914 (not c!105409)) b!1039915))

(assert (= (or b!1039916 b!1039915) bm!44021))

(declare-fun m!959561 () Bool)

(assert (=> bm!44021 m!959561))

(declare-fun m!959563 () Bool)

(assert (=> b!1039914 m!959563))

(assert (=> b!1039914 m!959563))

(declare-fun m!959565 () Bool)

(assert (=> b!1039914 m!959565))

(assert (=> b!1039833 d!125575))

(declare-fun d!125577 () Bool)

(declare-fun res!693428 () Bool)

(declare-fun e!588657 () Bool)

(assert (=> d!125577 (=> (not res!693428) (not e!588657))))

(declare-fun simpleValid!430 (LongMapFixedSize!5898) Bool)

(assert (=> d!125577 (= res!693428 (simpleValid!430 thiss!1427))))

(assert (=> d!125577 (= (valid!2216 thiss!1427) e!588657)))

(declare-fun b!1039924 () Bool)

(declare-fun res!693429 () Bool)

(assert (=> b!1039924 (=> (not res!693429) (not e!588657))))

(assert (=> b!1039924 (= res!693429 (= (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32076 (_keys!11545 thiss!1427))) (_size!3004 thiss!1427)))))

(declare-fun b!1039925 () Bool)

(declare-fun res!693430 () Bool)

(assert (=> b!1039925 (=> (not res!693430) (not e!588657))))

(assert (=> b!1039925 (= res!693430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11545 thiss!1427) (mask!30307 thiss!1427)))))

(declare-fun b!1039926 () Bool)

(assert (=> b!1039926 (= e!588657 (arrayNoDuplicates!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 Nil!21948))))

(assert (= (and d!125577 res!693428) b!1039924))

(assert (= (and b!1039924 res!693429) b!1039925))

(assert (= (and b!1039925 res!693430) b!1039926))

(declare-fun m!959567 () Bool)

(assert (=> d!125577 m!959567))

(assert (=> b!1039924 m!959481))

(declare-fun m!959569 () Bool)

(assert (=> b!1039925 m!959569))

(declare-fun m!959571 () Bool)

(assert (=> b!1039926 m!959571))

(assert (=> start!91064 d!125577))

(declare-fun b!1039939 () Bool)

(declare-fun e!588666 () SeekEntryResult!9789)

(declare-fun e!588664 () SeekEntryResult!9789)

(assert (=> b!1039939 (= e!588666 e!588664)))

(declare-fun lt!458314 () (_ BitVec 64))

(declare-fun lt!458316 () SeekEntryResult!9789)

(assert (=> b!1039939 (= lt!458314 (select (arr!31545 (_keys!11545 thiss!1427)) (index!41529 lt!458316)))))

(declare-fun c!105419 () Bool)

(assert (=> b!1039939 (= c!105419 (= lt!458314 key!909))))

(declare-fun b!1039940 () Bool)

(declare-fun e!588665 () SeekEntryResult!9789)

(assert (=> b!1039940 (= e!588665 (MissingZero!9789 (index!41529 lt!458316)))))

(declare-fun b!1039942 () Bool)

(assert (=> b!1039942 (= e!588664 (Found!9789 (index!41529 lt!458316)))))

(declare-fun d!125579 () Bool)

(declare-fun lt!458317 () SeekEntryResult!9789)

(assert (=> d!125579 (and (or ((_ is MissingVacant!9789) lt!458317) (not ((_ is Found!9789) lt!458317)) (and (bvsge (index!41528 lt!458317) #b00000000000000000000000000000000) (bvslt (index!41528 lt!458317) (size!32076 (_keys!11545 thiss!1427))))) (not ((_ is MissingVacant!9789) lt!458317)) (or (not ((_ is Found!9789) lt!458317)) (= (select (arr!31545 (_keys!11545 thiss!1427)) (index!41528 lt!458317)) key!909)))))

(assert (=> d!125579 (= lt!458317 e!588666)))

(declare-fun c!105418 () Bool)

(assert (=> d!125579 (= c!105418 (and ((_ is Intermediate!9789) lt!458316) (undefined!10601 lt!458316)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65552 (_ BitVec 32)) SeekEntryResult!9789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125579 (= lt!458316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30307 thiss!1427)) key!909 (_keys!11545 thiss!1427) (mask!30307 thiss!1427)))))

(assert (=> d!125579 (validMask!0 (mask!30307 thiss!1427))))

(assert (=> d!125579 (= (seekEntry!0 key!909 (_keys!11545 thiss!1427) (mask!30307 thiss!1427)) lt!458317)))

(declare-fun b!1039941 () Bool)

(assert (=> b!1039941 (= e!588666 Undefined!9789)))

(declare-fun b!1039943 () Bool)

(declare-fun c!105417 () Bool)

(assert (=> b!1039943 (= c!105417 (= lt!458314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039943 (= e!588664 e!588665)))

(declare-fun b!1039944 () Bool)

(declare-fun lt!458315 () SeekEntryResult!9789)

(assert (=> b!1039944 (= e!588665 (ite ((_ is MissingVacant!9789) lt!458315) (MissingZero!9789 (index!41530 lt!458315)) lt!458315))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65552 (_ BitVec 32)) SeekEntryResult!9789)

(assert (=> b!1039944 (= lt!458315 (seekKeyOrZeroReturnVacant!0 (x!92813 lt!458316) (index!41529 lt!458316) (index!41529 lt!458316) key!909 (_keys!11545 thiss!1427) (mask!30307 thiss!1427)))))

(assert (= (and d!125579 c!105418) b!1039941))

(assert (= (and d!125579 (not c!105418)) b!1039939))

(assert (= (and b!1039939 c!105419) b!1039942))

(assert (= (and b!1039939 (not c!105419)) b!1039943))

(assert (= (and b!1039943 c!105417) b!1039940))

(assert (= (and b!1039943 (not c!105417)) b!1039944))

(declare-fun m!959573 () Bool)

(assert (=> b!1039939 m!959573))

(declare-fun m!959575 () Bool)

(assert (=> d!125579 m!959575))

(declare-fun m!959577 () Bool)

(assert (=> d!125579 m!959577))

(assert (=> d!125579 m!959577))

(declare-fun m!959579 () Bool)

(assert (=> d!125579 m!959579))

(assert (=> d!125579 m!959525))

(declare-fun m!959581 () Bool)

(assert (=> b!1039944 m!959581))

(assert (=> b!1039835 d!125579))

(declare-fun condMapEmpty!38641 () Bool)

(declare-fun mapDefault!38641 () ValueCell!11652)

(assert (=> mapNonEmpty!38635 (= condMapEmpty!38641 (= mapRest!38635 ((as const (Array (_ BitVec 32) ValueCell!11652)) mapDefault!38641)))))

(declare-fun e!588671 () Bool)

(declare-fun mapRes!38641 () Bool)

(assert (=> mapNonEmpty!38635 (= tp!74158 (and e!588671 mapRes!38641))))

(declare-fun mapIsEmpty!38641 () Bool)

(assert (=> mapIsEmpty!38641 mapRes!38641))

(declare-fun mapNonEmpty!38641 () Bool)

(declare-fun tp!74168 () Bool)

(declare-fun e!588672 () Bool)

(assert (=> mapNonEmpty!38641 (= mapRes!38641 (and tp!74168 e!588672))))

(declare-fun mapKey!38641 () (_ BitVec 32))

(declare-fun mapValue!38641 () ValueCell!11652)

(declare-fun mapRest!38641 () (Array (_ BitVec 32) ValueCell!11652))

(assert (=> mapNonEmpty!38641 (= mapRest!38635 (store mapRest!38641 mapKey!38641 mapValue!38641))))

(declare-fun b!1039951 () Bool)

(assert (=> b!1039951 (= e!588672 tp_is_empty!24711)))

(declare-fun b!1039952 () Bool)

(assert (=> b!1039952 (= e!588671 tp_is_empty!24711)))

(assert (= (and mapNonEmpty!38635 condMapEmpty!38641) mapIsEmpty!38641))

(assert (= (and mapNonEmpty!38635 (not condMapEmpty!38641)) mapNonEmpty!38641))

(assert (= (and mapNonEmpty!38641 ((_ is ValueCellFull!11652) mapValue!38641)) b!1039951))

(assert (= (and mapNonEmpty!38635 ((_ is ValueCellFull!11652) mapDefault!38641)) b!1039952))

(declare-fun m!959583 () Bool)

(assert (=> mapNonEmpty!38641 m!959583))

(check-sat (not bm!44021) (not bm!44014) (not b!1039914) (not d!125569) (not b!1039910) tp_is_empty!24711 (not d!125563) (not b!1039859) (not d!125565) (not b!1039924) (not mapNonEmpty!38641) (not b!1039944) (not bm!44020) (not d!125579) (not b!1039886) (not d!125577) b_and!33523 (not b!1039926) (not b_next!20991) (not b!1039871) (not bm!44017) (not b!1039884) (not b!1039925) (not b!1039900) (not b!1039883) (not b!1039912) (not b!1039862) (not b!1039898) (not b!1039899))
(check-sat b_and!33523 (not b_next!20991))
