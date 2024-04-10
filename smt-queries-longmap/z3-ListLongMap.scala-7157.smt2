; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91090 () Bool)

(assert start!91090)

(declare-fun b!1039990 () Bool)

(declare-fun b_free!20997 () Bool)

(declare-fun b_next!20997 () Bool)

(assert (=> b!1039990 (= b_free!20997 (not b_next!20997))))

(declare-fun tp!74179 () Bool)

(declare-fun b_and!33529 () Bool)

(assert (=> b!1039990 (= tp!74179 b_and!33529)))

(declare-fun mapIsEmpty!38647 () Bool)

(declare-fun mapRes!38647 () Bool)

(assert (=> mapIsEmpty!38647 mapRes!38647))

(declare-fun b!1039988 () Bool)

(declare-fun e!588713 () Bool)

(declare-fun e!588714 () Bool)

(assert (=> b!1039988 (= e!588713 e!588714)))

(declare-fun res!693448 () Bool)

(assert (=> b!1039988 (=> (not res!693448) (not e!588714))))

(declare-datatypes ((SeekEntryResult!9791 0))(
  ( (MissingZero!9791 (index!41535 (_ BitVec 32))) (Found!9791 (index!41536 (_ BitVec 32))) (Intermediate!9791 (undefined!10603 Bool) (index!41537 (_ BitVec 32)) (x!92831 (_ BitVec 32))) (Undefined!9791) (MissingVacant!9791 (index!41538 (_ BitVec 32))) )
))
(declare-fun lt!458344 () SeekEntryResult!9791)

(get-info :version)

(assert (=> b!1039988 (= res!693448 ((_ is Found!9791) lt!458344))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37829 0))(
  ( (V!37830 (val!12409 Int)) )
))
(declare-datatypes ((ValueCell!11655 0))(
  ( (ValueCellFull!11655 (v!14996 V!37829)) (EmptyCell!11655) )
))
(declare-datatypes ((array!65566 0))(
  ( (array!65567 (arr!31551 (Array (_ BitVec 32) (_ BitVec 64))) (size!32082 (_ BitVec 32))) )
))
(declare-datatypes ((array!65568 0))(
  ( (array!65569 (arr!31552 (Array (_ BitVec 32) ValueCell!11655)) (size!32083 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5904 0))(
  ( (LongMapFixedSize!5905 (defaultEntry!6334 Int) (mask!30315 (_ BitVec 32)) (extraKeys!6062 (_ BitVec 32)) (zeroValue!6168 V!37829) (minValue!6168 V!37829) (_size!3007 (_ BitVec 32)) (_keys!11550 array!65566) (_values!6357 array!65568) (_vacant!3007 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5904)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65566 (_ BitVec 32)) SeekEntryResult!9791)

(assert (=> b!1039988 (= lt!458344 (seekEntry!0 key!909 (_keys!11550 thiss!1427) (mask!30315 thiss!1427)))))

(declare-fun res!693446 () Bool)

(assert (=> start!91090 (=> (not res!693446) (not e!588713))))

(declare-fun valid!2218 (LongMapFixedSize!5904) Bool)

(assert (=> start!91090 (= res!693446 (valid!2218 thiss!1427))))

(assert (=> start!91090 e!588713))

(declare-fun e!588712 () Bool)

(assert (=> start!91090 e!588712))

(assert (=> start!91090 true))

(declare-fun b!1039989 () Bool)

(declare-fun res!693447 () Bool)

(assert (=> b!1039989 (=> (not res!693447) (not e!588713))))

(assert (=> b!1039989 (= res!693447 (not (= key!909 (bvneg key!909))))))

(declare-fun tp_is_empty!24717 () Bool)

(declare-fun e!588708 () Bool)

(declare-fun array_inv!24387 (array!65566) Bool)

(declare-fun array_inv!24388 (array!65568) Bool)

(assert (=> b!1039990 (= e!588712 (and tp!74179 tp_is_empty!24717 (array_inv!24387 (_keys!11550 thiss!1427)) (array_inv!24388 (_values!6357 thiss!1427)) e!588708))))

(declare-fun b!1039991 () Bool)

(assert (=> b!1039991 (= e!588714 (not (or (bvslt (index!41536 lt!458344) #b00000000000000000000000000000000) (bvsge (index!41536 lt!458344) (size!32082 (_keys!11550 thiss!1427))) (bvslt (size!32082 (_keys!11550 thiss!1427)) #b01111111111111111111111111111111))))))

(declare-fun lt!458346 () array!65566)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65566 (_ BitVec 32)) Bool)

(assert (=> b!1039991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458346 (mask!30315 thiss!1427))))

(declare-datatypes ((Unit!34007 0))(
  ( (Unit!34008) )
))
(declare-fun lt!458345 () Unit!34007)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65566 (_ BitVec 32) (_ BitVec 32)) Unit!34007)

(assert (=> b!1039991 (= lt!458345 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11550 thiss!1427) (index!41536 lt!458344) (mask!30315 thiss!1427)))))

(declare-datatypes ((List!21953 0))(
  ( (Nil!21950) (Cons!21949 (h!23153 (_ BitVec 64)) (t!31167 List!21953)) )
))
(declare-fun arrayNoDuplicates!0 (array!65566 (_ BitVec 32) List!21953) Bool)

(assert (=> b!1039991 (arrayNoDuplicates!0 lt!458346 #b00000000000000000000000000000000 Nil!21950)))

(declare-fun lt!458343 () Unit!34007)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21953) Unit!34007)

(assert (=> b!1039991 (= lt!458343 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11550 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41536 lt!458344) #b00000000000000000000000000000000 Nil!21950))))

(declare-fun arrayCountValidKeys!0 (array!65566 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039991 (= (arrayCountValidKeys!0 lt!458346 #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039991 (= lt!458346 (array!65567 (store (arr!31551 (_keys!11550 thiss!1427)) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32082 (_keys!11550 thiss!1427))))))

(declare-fun lt!458347 () Unit!34007)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65566 (_ BitVec 32) (_ BitVec 64)) Unit!34007)

(assert (=> b!1039991 (= lt!458347 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11550 thiss!1427) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38647 () Bool)

(declare-fun tp!74180 () Bool)

(declare-fun e!588709 () Bool)

(assert (=> mapNonEmpty!38647 (= mapRes!38647 (and tp!74180 e!588709))))

(declare-fun mapValue!38647 () ValueCell!11655)

(declare-fun mapRest!38647 () (Array (_ BitVec 32) ValueCell!11655))

(declare-fun mapKey!38647 () (_ BitVec 32))

(assert (=> mapNonEmpty!38647 (= (arr!31552 (_values!6357 thiss!1427)) (store mapRest!38647 mapKey!38647 mapValue!38647))))

(declare-fun b!1039992 () Bool)

(assert (=> b!1039992 (= e!588709 tp_is_empty!24717)))

(declare-fun b!1039993 () Bool)

(declare-fun e!588711 () Bool)

(assert (=> b!1039993 (= e!588708 (and e!588711 mapRes!38647))))

(declare-fun condMapEmpty!38647 () Bool)

(declare-fun mapDefault!38647 () ValueCell!11655)

(assert (=> b!1039993 (= condMapEmpty!38647 (= (arr!31552 (_values!6357 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11655)) mapDefault!38647)))))

(declare-fun b!1039994 () Bool)

(assert (=> b!1039994 (= e!588711 tp_is_empty!24717)))

(assert (= (and start!91090 res!693446) b!1039989))

(assert (= (and b!1039989 res!693447) b!1039988))

(assert (= (and b!1039988 res!693448) b!1039991))

(assert (= (and b!1039993 condMapEmpty!38647) mapIsEmpty!38647))

(assert (= (and b!1039993 (not condMapEmpty!38647)) mapNonEmpty!38647))

(assert (= (and mapNonEmpty!38647 ((_ is ValueCellFull!11655) mapValue!38647)) b!1039992))

(assert (= (and b!1039993 ((_ is ValueCellFull!11655) mapDefault!38647)) b!1039994))

(assert (= b!1039990 b!1039993))

(assert (= start!91090 b!1039990))

(declare-fun m!959611 () Bool)

(assert (=> b!1039991 m!959611))

(declare-fun m!959613 () Bool)

(assert (=> b!1039991 m!959613))

(declare-fun m!959615 () Bool)

(assert (=> b!1039991 m!959615))

(declare-fun m!959617 () Bool)

(assert (=> b!1039991 m!959617))

(declare-fun m!959619 () Bool)

(assert (=> b!1039991 m!959619))

(declare-fun m!959621 () Bool)

(assert (=> b!1039991 m!959621))

(declare-fun m!959623 () Bool)

(assert (=> b!1039991 m!959623))

(declare-fun m!959625 () Bool)

(assert (=> b!1039991 m!959625))

(declare-fun m!959627 () Bool)

(assert (=> start!91090 m!959627))

(declare-fun m!959629 () Bool)

(assert (=> mapNonEmpty!38647 m!959629))

(declare-fun m!959631 () Bool)

(assert (=> b!1039988 m!959631))

(declare-fun m!959633 () Bool)

(assert (=> b!1039990 m!959633))

(declare-fun m!959635 () Bool)

(assert (=> b!1039990 m!959635))

(check-sat tp_is_empty!24717 (not b!1039988) b_and!33529 (not b!1039990) (not b_next!20997) (not mapNonEmpty!38647) (not start!91090) (not b!1039991))
(check-sat b_and!33529 (not b_next!20997))
(get-model)

(declare-fun b!1040027 () Bool)

(declare-fun e!588740 () Bool)

(assert (=> b!1040027 (= e!588740 (= (arrayCountValidKeys!0 (array!65567 (store (arr!31551 (_keys!11550 thiss!1427)) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32082 (_keys!11550 thiss!1427))) #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040025 () Bool)

(declare-fun res!693467 () Bool)

(declare-fun e!588741 () Bool)

(assert (=> b!1040025 (=> (not res!693467) (not e!588741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040025 (= res!693467 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040024 () Bool)

(declare-fun res!693466 () Bool)

(assert (=> b!1040024 (=> (not res!693466) (not e!588741))))

(assert (=> b!1040024 (= res!693466 (validKeyInArray!0 (select (arr!31551 (_keys!11550 thiss!1427)) (index!41536 lt!458344))))))

(declare-fun d!125583 () Bool)

(assert (=> d!125583 e!588740))

(declare-fun res!693468 () Bool)

(assert (=> d!125583 (=> (not res!693468) (not e!588740))))

(assert (=> d!125583 (= res!693468 (and (bvsge (index!41536 lt!458344) #b00000000000000000000000000000000) (bvslt (index!41536 lt!458344) (size!32082 (_keys!11550 thiss!1427)))))))

(declare-fun lt!458365 () Unit!34007)

(declare-fun choose!82 (array!65566 (_ BitVec 32) (_ BitVec 64)) Unit!34007)

(assert (=> d!125583 (= lt!458365 (choose!82 (_keys!11550 thiss!1427) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125583 e!588741))

(declare-fun res!693469 () Bool)

(assert (=> d!125583 (=> (not res!693469) (not e!588741))))

(assert (=> d!125583 (= res!693469 (and (bvsge (index!41536 lt!458344) #b00000000000000000000000000000000) (bvslt (index!41536 lt!458344) (size!32082 (_keys!11550 thiss!1427)))))))

(assert (=> d!125583 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11550 thiss!1427) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458365)))

(declare-fun b!1040026 () Bool)

(assert (=> b!1040026 (= e!588741 (bvslt (size!32082 (_keys!11550 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125583 res!693469) b!1040024))

(assert (= (and b!1040024 res!693466) b!1040025))

(assert (= (and b!1040025 res!693467) b!1040026))

(assert (= (and d!125583 res!693468) b!1040027))

(assert (=> b!1040027 m!959619))

(declare-fun m!959663 () Bool)

(assert (=> b!1040027 m!959663))

(assert (=> b!1040027 m!959613))

(declare-fun m!959665 () Bool)

(assert (=> b!1040025 m!959665))

(declare-fun m!959667 () Bool)

(assert (=> b!1040024 m!959667))

(assert (=> b!1040024 m!959667))

(declare-fun m!959669 () Bool)

(assert (=> b!1040024 m!959669))

(declare-fun m!959671 () Bool)

(assert (=> d!125583 m!959671))

(assert (=> b!1039991 d!125583))

(declare-fun bm!44024 () Bool)

(declare-fun call!44027 () (_ BitVec 32))

(assert (=> bm!44024 (= call!44027 (arrayCountValidKeys!0 lt!458346 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32082 (_keys!11550 thiss!1427))))))

(declare-fun d!125585 () Bool)

(declare-fun lt!458368 () (_ BitVec 32))

(assert (=> d!125585 (and (bvsge lt!458368 #b00000000000000000000000000000000) (bvsle lt!458368 (bvsub (size!32082 lt!458346) #b00000000000000000000000000000000)))))

(declare-fun e!588747 () (_ BitVec 32))

(assert (=> d!125585 (= lt!458368 e!588747)))

(declare-fun c!105424 () Bool)

(assert (=> d!125585 (= c!105424 (bvsge #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))))))

(assert (=> d!125585 (and (bvsle #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32082 (_keys!11550 thiss!1427)) (size!32082 lt!458346)))))

(assert (=> d!125585 (= (arrayCountValidKeys!0 lt!458346 #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) lt!458368)))

(declare-fun b!1040036 () Bool)

(assert (=> b!1040036 (= e!588747 #b00000000000000000000000000000000)))

(declare-fun b!1040037 () Bool)

(declare-fun e!588746 () (_ BitVec 32))

(assert (=> b!1040037 (= e!588747 e!588746)))

(declare-fun c!105425 () Bool)

(assert (=> b!1040037 (= c!105425 (validKeyInArray!0 (select (arr!31551 lt!458346) #b00000000000000000000000000000000)))))

(declare-fun b!1040038 () Bool)

(assert (=> b!1040038 (= e!588746 (bvadd #b00000000000000000000000000000001 call!44027))))

(declare-fun b!1040039 () Bool)

(assert (=> b!1040039 (= e!588746 call!44027)))

(assert (= (and d!125585 c!105424) b!1040036))

(assert (= (and d!125585 (not c!105424)) b!1040037))

(assert (= (and b!1040037 c!105425) b!1040038))

(assert (= (and b!1040037 (not c!105425)) b!1040039))

(assert (= (or b!1040038 b!1040039) bm!44024))

(declare-fun m!959673 () Bool)

(assert (=> bm!44024 m!959673))

(declare-fun m!959675 () Bool)

(assert (=> b!1040037 m!959675))

(assert (=> b!1040037 m!959675))

(declare-fun m!959677 () Bool)

(assert (=> b!1040037 m!959677))

(assert (=> b!1039991 d!125585))

(declare-fun d!125587 () Bool)

(declare-fun e!588750 () Bool)

(assert (=> d!125587 e!588750))

(declare-fun res!693472 () Bool)

(assert (=> d!125587 (=> (not res!693472) (not e!588750))))

(assert (=> d!125587 (= res!693472 (and (bvsge (index!41536 lt!458344) #b00000000000000000000000000000000) (bvslt (index!41536 lt!458344) (size!32082 (_keys!11550 thiss!1427)))))))

(declare-fun lt!458371 () Unit!34007)

(declare-fun choose!53 (array!65566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21953) Unit!34007)

(assert (=> d!125587 (= lt!458371 (choose!53 (_keys!11550 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41536 lt!458344) #b00000000000000000000000000000000 Nil!21950))))

(assert (=> d!125587 (bvslt (size!32082 (_keys!11550 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125587 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11550 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41536 lt!458344) #b00000000000000000000000000000000 Nil!21950) lt!458371)))

(declare-fun b!1040042 () Bool)

(assert (=> b!1040042 (= e!588750 (arrayNoDuplicates!0 (array!65567 (store (arr!31551 (_keys!11550 thiss!1427)) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32082 (_keys!11550 thiss!1427))) #b00000000000000000000000000000000 Nil!21950))))

(assert (= (and d!125587 res!693472) b!1040042))

(declare-fun m!959679 () Bool)

(assert (=> d!125587 m!959679))

(assert (=> b!1040042 m!959619))

(declare-fun m!959681 () Bool)

(assert (=> b!1040042 m!959681))

(assert (=> b!1039991 d!125587))

(declare-fun d!125589 () Bool)

(declare-fun e!588753 () Bool)

(assert (=> d!125589 e!588753))

(declare-fun res!693475 () Bool)

(assert (=> d!125589 (=> (not res!693475) (not e!588753))))

(assert (=> d!125589 (= res!693475 (and (bvsge (index!41536 lt!458344) #b00000000000000000000000000000000) (bvslt (index!41536 lt!458344) (size!32082 (_keys!11550 thiss!1427)))))))

(declare-fun lt!458374 () Unit!34007)

(declare-fun choose!25 (array!65566 (_ BitVec 32) (_ BitVec 32)) Unit!34007)

(assert (=> d!125589 (= lt!458374 (choose!25 (_keys!11550 thiss!1427) (index!41536 lt!458344) (mask!30315 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125589 (validMask!0 (mask!30315 thiss!1427))))

(assert (=> d!125589 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11550 thiss!1427) (index!41536 lt!458344) (mask!30315 thiss!1427)) lt!458374)))

(declare-fun b!1040045 () Bool)

(assert (=> b!1040045 (= e!588753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65567 (store (arr!31551 (_keys!11550 thiss!1427)) (index!41536 lt!458344) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32082 (_keys!11550 thiss!1427))) (mask!30315 thiss!1427)))))

(assert (= (and d!125589 res!693475) b!1040045))

(declare-fun m!959683 () Bool)

(assert (=> d!125589 m!959683))

(declare-fun m!959685 () Bool)

(assert (=> d!125589 m!959685))

(assert (=> b!1040045 m!959619))

(declare-fun m!959687 () Bool)

(assert (=> b!1040045 m!959687))

(assert (=> b!1039991 d!125589))

(declare-fun bm!44025 () Bool)

(declare-fun call!44028 () (_ BitVec 32))

(assert (=> bm!44025 (= call!44028 (arrayCountValidKeys!0 (_keys!11550 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32082 (_keys!11550 thiss!1427))))))

(declare-fun d!125591 () Bool)

(declare-fun lt!458375 () (_ BitVec 32))

(assert (=> d!125591 (and (bvsge lt!458375 #b00000000000000000000000000000000) (bvsle lt!458375 (bvsub (size!32082 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588755 () (_ BitVec 32))

(assert (=> d!125591 (= lt!458375 e!588755)))

(declare-fun c!105426 () Bool)

(assert (=> d!125591 (= c!105426 (bvsge #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))))))

(assert (=> d!125591 (and (bvsle #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32082 (_keys!11550 thiss!1427)) (size!32082 (_keys!11550 thiss!1427))))))

(assert (=> d!125591 (= (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) lt!458375)))

(declare-fun b!1040046 () Bool)

(assert (=> b!1040046 (= e!588755 #b00000000000000000000000000000000)))

(declare-fun b!1040047 () Bool)

(declare-fun e!588754 () (_ BitVec 32))

(assert (=> b!1040047 (= e!588755 e!588754)))

(declare-fun c!105427 () Bool)

(assert (=> b!1040047 (= c!105427 (validKeyInArray!0 (select (arr!31551 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040048 () Bool)

(assert (=> b!1040048 (= e!588754 (bvadd #b00000000000000000000000000000001 call!44028))))

(declare-fun b!1040049 () Bool)

(assert (=> b!1040049 (= e!588754 call!44028)))

(assert (= (and d!125591 c!105426) b!1040046))

(assert (= (and d!125591 (not c!105426)) b!1040047))

(assert (= (and b!1040047 c!105427) b!1040048))

(assert (= (and b!1040047 (not c!105427)) b!1040049))

(assert (= (or b!1040048 b!1040049) bm!44025))

(declare-fun m!959689 () Bool)

(assert (=> bm!44025 m!959689))

(declare-fun m!959691 () Bool)

(assert (=> b!1040047 m!959691))

(assert (=> b!1040047 m!959691))

(declare-fun m!959693 () Bool)

(assert (=> b!1040047 m!959693))

(assert (=> b!1039991 d!125591))

(declare-fun b!1040058 () Bool)

(declare-fun e!588764 () Bool)

(declare-fun call!44031 () Bool)

(assert (=> b!1040058 (= e!588764 call!44031)))

(declare-fun b!1040059 () Bool)

(declare-fun e!588762 () Bool)

(assert (=> b!1040059 (= e!588762 call!44031)))

(declare-fun bm!44028 () Bool)

(assert (=> bm!44028 (= call!44031 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458346 (mask!30315 thiss!1427)))))

(declare-fun d!125593 () Bool)

(declare-fun res!693481 () Bool)

(declare-fun e!588763 () Bool)

(assert (=> d!125593 (=> res!693481 e!588763)))

(assert (=> d!125593 (= res!693481 (bvsge #b00000000000000000000000000000000 (size!32082 lt!458346)))))

(assert (=> d!125593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458346 (mask!30315 thiss!1427)) e!588763)))

(declare-fun b!1040060 () Bool)

(assert (=> b!1040060 (= e!588762 e!588764)))

(declare-fun lt!458383 () (_ BitVec 64))

(assert (=> b!1040060 (= lt!458383 (select (arr!31551 lt!458346) #b00000000000000000000000000000000))))

(declare-fun lt!458382 () Unit!34007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65566 (_ BitVec 64) (_ BitVec 32)) Unit!34007)

(assert (=> b!1040060 (= lt!458382 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458346 lt!458383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040060 (arrayContainsKey!0 lt!458346 lt!458383 #b00000000000000000000000000000000)))

(declare-fun lt!458384 () Unit!34007)

(assert (=> b!1040060 (= lt!458384 lt!458382)))

(declare-fun res!693480 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65566 (_ BitVec 32)) SeekEntryResult!9791)

(assert (=> b!1040060 (= res!693480 (= (seekEntryOrOpen!0 (select (arr!31551 lt!458346) #b00000000000000000000000000000000) lt!458346 (mask!30315 thiss!1427)) (Found!9791 #b00000000000000000000000000000000)))))

(assert (=> b!1040060 (=> (not res!693480) (not e!588764))))

(declare-fun b!1040061 () Bool)

(assert (=> b!1040061 (= e!588763 e!588762)))

(declare-fun c!105430 () Bool)

(assert (=> b!1040061 (= c!105430 (validKeyInArray!0 (select (arr!31551 lt!458346) #b00000000000000000000000000000000)))))

(assert (= (and d!125593 (not res!693481)) b!1040061))

(assert (= (and b!1040061 c!105430) b!1040060))

(assert (= (and b!1040061 (not c!105430)) b!1040059))

(assert (= (and b!1040060 res!693480) b!1040058))

(assert (= (or b!1040058 b!1040059) bm!44028))

(declare-fun m!959695 () Bool)

(assert (=> bm!44028 m!959695))

(assert (=> b!1040060 m!959675))

(declare-fun m!959697 () Bool)

(assert (=> b!1040060 m!959697))

(declare-fun m!959699 () Bool)

(assert (=> b!1040060 m!959699))

(assert (=> b!1040060 m!959675))

(declare-fun m!959701 () Bool)

(assert (=> b!1040060 m!959701))

(assert (=> b!1040061 m!959675))

(assert (=> b!1040061 m!959675))

(assert (=> b!1040061 m!959677))

(assert (=> b!1039991 d!125593))

(declare-fun bm!44031 () Bool)

(declare-fun call!44034 () Bool)

(declare-fun c!105433 () Bool)

(assert (=> bm!44031 (= call!44034 (arrayNoDuplicates!0 lt!458346 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105433 (Cons!21949 (select (arr!31551 lt!458346) #b00000000000000000000000000000000) Nil!21950) Nil!21950)))))

(declare-fun b!1040072 () Bool)

(declare-fun e!588775 () Bool)

(assert (=> b!1040072 (= e!588775 call!44034)))

(declare-fun b!1040073 () Bool)

(declare-fun e!588776 () Bool)

(assert (=> b!1040073 (= e!588776 e!588775)))

(assert (=> b!1040073 (= c!105433 (validKeyInArray!0 (select (arr!31551 lt!458346) #b00000000000000000000000000000000)))))

(declare-fun b!1040074 () Bool)

(assert (=> b!1040074 (= e!588775 call!44034)))

(declare-fun b!1040075 () Bool)

(declare-fun e!588774 () Bool)

(declare-fun contains!6047 (List!21953 (_ BitVec 64)) Bool)

(assert (=> b!1040075 (= e!588774 (contains!6047 Nil!21950 (select (arr!31551 lt!458346) #b00000000000000000000000000000000)))))

(declare-fun d!125595 () Bool)

(declare-fun res!693488 () Bool)

(declare-fun e!588773 () Bool)

(assert (=> d!125595 (=> res!693488 e!588773)))

(assert (=> d!125595 (= res!693488 (bvsge #b00000000000000000000000000000000 (size!32082 lt!458346)))))

(assert (=> d!125595 (= (arrayNoDuplicates!0 lt!458346 #b00000000000000000000000000000000 Nil!21950) e!588773)))

(declare-fun b!1040076 () Bool)

(assert (=> b!1040076 (= e!588773 e!588776)))

(declare-fun res!693490 () Bool)

(assert (=> b!1040076 (=> (not res!693490) (not e!588776))))

(assert (=> b!1040076 (= res!693490 (not e!588774))))

(declare-fun res!693489 () Bool)

(assert (=> b!1040076 (=> (not res!693489) (not e!588774))))

(assert (=> b!1040076 (= res!693489 (validKeyInArray!0 (select (arr!31551 lt!458346) #b00000000000000000000000000000000)))))

(assert (= (and d!125595 (not res!693488)) b!1040076))

(assert (= (and b!1040076 res!693489) b!1040075))

(assert (= (and b!1040076 res!693490) b!1040073))

(assert (= (and b!1040073 c!105433) b!1040072))

(assert (= (and b!1040073 (not c!105433)) b!1040074))

(assert (= (or b!1040072 b!1040074) bm!44031))

(assert (=> bm!44031 m!959675))

(declare-fun m!959703 () Bool)

(assert (=> bm!44031 m!959703))

(assert (=> b!1040073 m!959675))

(assert (=> b!1040073 m!959675))

(assert (=> b!1040073 m!959677))

(assert (=> b!1040075 m!959675))

(assert (=> b!1040075 m!959675))

(declare-fun m!959705 () Bool)

(assert (=> b!1040075 m!959705))

(assert (=> b!1040076 m!959675))

(assert (=> b!1040076 m!959675))

(assert (=> b!1040076 m!959677))

(assert (=> b!1039991 d!125595))

(declare-fun d!125597 () Bool)

(assert (=> d!125597 (= (array_inv!24387 (_keys!11550 thiss!1427)) (bvsge (size!32082 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039990 d!125597))

(declare-fun d!125599 () Bool)

(assert (=> d!125599 (= (array_inv!24388 (_values!6357 thiss!1427)) (bvsge (size!32083 (_values!6357 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039990 d!125599))

(declare-fun b!1040089 () Bool)

(declare-fun e!588784 () SeekEntryResult!9791)

(declare-fun lt!458393 () SeekEntryResult!9791)

(assert (=> b!1040089 (= e!588784 (ite ((_ is MissingVacant!9791) lt!458393) (MissingZero!9791 (index!41538 lt!458393)) lt!458393))))

(declare-fun lt!458396 () SeekEntryResult!9791)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65566 (_ BitVec 32)) SeekEntryResult!9791)

(assert (=> b!1040089 (= lt!458393 (seekKeyOrZeroReturnVacant!0 (x!92831 lt!458396) (index!41537 lt!458396) (index!41537 lt!458396) key!909 (_keys!11550 thiss!1427) (mask!30315 thiss!1427)))))

(declare-fun b!1040090 () Bool)

(assert (=> b!1040090 (= e!588784 (MissingZero!9791 (index!41537 lt!458396)))))

(declare-fun d!125601 () Bool)

(declare-fun lt!458395 () SeekEntryResult!9791)

(assert (=> d!125601 (and (or ((_ is MissingVacant!9791) lt!458395) (not ((_ is Found!9791) lt!458395)) (and (bvsge (index!41536 lt!458395) #b00000000000000000000000000000000) (bvslt (index!41536 lt!458395) (size!32082 (_keys!11550 thiss!1427))))) (not ((_ is MissingVacant!9791) lt!458395)) (or (not ((_ is Found!9791) lt!458395)) (= (select (arr!31551 (_keys!11550 thiss!1427)) (index!41536 lt!458395)) key!909)))))

(declare-fun e!588785 () SeekEntryResult!9791)

(assert (=> d!125601 (= lt!458395 e!588785)))

(declare-fun c!105440 () Bool)

(assert (=> d!125601 (= c!105440 (and ((_ is Intermediate!9791) lt!458396) (undefined!10603 lt!458396)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65566 (_ BitVec 32)) SeekEntryResult!9791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125601 (= lt!458396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30315 thiss!1427)) key!909 (_keys!11550 thiss!1427) (mask!30315 thiss!1427)))))

(assert (=> d!125601 (validMask!0 (mask!30315 thiss!1427))))

(assert (=> d!125601 (= (seekEntry!0 key!909 (_keys!11550 thiss!1427) (mask!30315 thiss!1427)) lt!458395)))

(declare-fun b!1040091 () Bool)

(declare-fun c!105442 () Bool)

(declare-fun lt!458394 () (_ BitVec 64))

(assert (=> b!1040091 (= c!105442 (= lt!458394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588783 () SeekEntryResult!9791)

(assert (=> b!1040091 (= e!588783 e!588784)))

(declare-fun b!1040092 () Bool)

(assert (=> b!1040092 (= e!588785 Undefined!9791)))

(declare-fun b!1040093 () Bool)

(assert (=> b!1040093 (= e!588785 e!588783)))

(assert (=> b!1040093 (= lt!458394 (select (arr!31551 (_keys!11550 thiss!1427)) (index!41537 lt!458396)))))

(declare-fun c!105441 () Bool)

(assert (=> b!1040093 (= c!105441 (= lt!458394 key!909))))

(declare-fun b!1040094 () Bool)

(assert (=> b!1040094 (= e!588783 (Found!9791 (index!41537 lt!458396)))))

(assert (= (and d!125601 c!105440) b!1040092))

(assert (= (and d!125601 (not c!105440)) b!1040093))

(assert (= (and b!1040093 c!105441) b!1040094))

(assert (= (and b!1040093 (not c!105441)) b!1040091))

(assert (= (and b!1040091 c!105442) b!1040090))

(assert (= (and b!1040091 (not c!105442)) b!1040089))

(declare-fun m!959707 () Bool)

(assert (=> b!1040089 m!959707))

(declare-fun m!959709 () Bool)

(assert (=> d!125601 m!959709))

(declare-fun m!959711 () Bool)

(assert (=> d!125601 m!959711))

(assert (=> d!125601 m!959711))

(declare-fun m!959713 () Bool)

(assert (=> d!125601 m!959713))

(assert (=> d!125601 m!959685))

(declare-fun m!959715 () Bool)

(assert (=> b!1040093 m!959715))

(assert (=> b!1039988 d!125601))

(declare-fun d!125603 () Bool)

(declare-fun res!693497 () Bool)

(declare-fun e!588788 () Bool)

(assert (=> d!125603 (=> (not res!693497) (not e!588788))))

(declare-fun simpleValid!431 (LongMapFixedSize!5904) Bool)

(assert (=> d!125603 (= res!693497 (simpleValid!431 thiss!1427))))

(assert (=> d!125603 (= (valid!2218 thiss!1427) e!588788)))

(declare-fun b!1040101 () Bool)

(declare-fun res!693498 () Bool)

(assert (=> b!1040101 (=> (not res!693498) (not e!588788))))

(assert (=> b!1040101 (= res!693498 (= (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32082 (_keys!11550 thiss!1427))) (_size!3007 thiss!1427)))))

(declare-fun b!1040102 () Bool)

(declare-fun res!693499 () Bool)

(assert (=> b!1040102 (=> (not res!693499) (not e!588788))))

(assert (=> b!1040102 (= res!693499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11550 thiss!1427) (mask!30315 thiss!1427)))))

(declare-fun b!1040103 () Bool)

(assert (=> b!1040103 (= e!588788 (arrayNoDuplicates!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 Nil!21950))))

(assert (= (and d!125603 res!693497) b!1040101))

(assert (= (and b!1040101 res!693498) b!1040102))

(assert (= (and b!1040102 res!693499) b!1040103))

(declare-fun m!959717 () Bool)

(assert (=> d!125603 m!959717))

(assert (=> b!1040101 m!959613))

(declare-fun m!959719 () Bool)

(assert (=> b!1040102 m!959719))

(declare-fun m!959721 () Bool)

(assert (=> b!1040103 m!959721))

(assert (=> start!91090 d!125603))

(declare-fun condMapEmpty!38653 () Bool)

(declare-fun mapDefault!38653 () ValueCell!11655)

(assert (=> mapNonEmpty!38647 (= condMapEmpty!38653 (= mapRest!38647 ((as const (Array (_ BitVec 32) ValueCell!11655)) mapDefault!38653)))))

(declare-fun e!588794 () Bool)

(declare-fun mapRes!38653 () Bool)

(assert (=> mapNonEmpty!38647 (= tp!74180 (and e!588794 mapRes!38653))))

(declare-fun b!1040110 () Bool)

(declare-fun e!588793 () Bool)

(assert (=> b!1040110 (= e!588793 tp_is_empty!24717)))

(declare-fun b!1040111 () Bool)

(assert (=> b!1040111 (= e!588794 tp_is_empty!24717)))

(declare-fun mapNonEmpty!38653 () Bool)

(declare-fun tp!74189 () Bool)

(assert (=> mapNonEmpty!38653 (= mapRes!38653 (and tp!74189 e!588793))))

(declare-fun mapValue!38653 () ValueCell!11655)

(declare-fun mapKey!38653 () (_ BitVec 32))

(declare-fun mapRest!38653 () (Array (_ BitVec 32) ValueCell!11655))

(assert (=> mapNonEmpty!38653 (= mapRest!38647 (store mapRest!38653 mapKey!38653 mapValue!38653))))

(declare-fun mapIsEmpty!38653 () Bool)

(assert (=> mapIsEmpty!38653 mapRes!38653))

(assert (= (and mapNonEmpty!38647 condMapEmpty!38653) mapIsEmpty!38653))

(assert (= (and mapNonEmpty!38647 (not condMapEmpty!38653)) mapNonEmpty!38653))

(assert (= (and mapNonEmpty!38653 ((_ is ValueCellFull!11655) mapValue!38653)) b!1040110))

(assert (= (and mapNonEmpty!38647 ((_ is ValueCellFull!11655) mapDefault!38653)) b!1040111))

(declare-fun m!959723 () Bool)

(assert (=> mapNonEmpty!38653 m!959723))

(check-sat (not d!125583) b_and!33529 (not b!1040042) (not b!1040025) (not b!1040102) (not bm!44025) (not d!125587) (not bm!44031) (not b!1040045) (not b_next!20997) (not mapNonEmpty!38653) (not b!1040027) (not b!1040047) (not b!1040103) (not d!125589) tp_is_empty!24717 (not b!1040073) (not d!125603) (not d!125601) (not b!1040061) (not b!1040060) (not b!1040076) (not b!1040037) (not bm!44024) (not bm!44028) (not b!1040089) (not b!1040101) (not b!1040024) (not b!1040075))
(check-sat b_and!33529 (not b_next!20997))
