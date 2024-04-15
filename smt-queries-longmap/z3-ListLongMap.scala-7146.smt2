; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90810 () Bool)

(assert start!90810)

(declare-fun b!1037967 () Bool)

(declare-fun b_free!20929 () Bool)

(declare-fun b_next!20929 () Bool)

(assert (=> b!1037967 (= b_free!20929 (not b_next!20929))))

(declare-fun tp!73944 () Bool)

(declare-fun b_and!33435 () Bool)

(assert (=> b!1037967 (= tp!73944 b_and!33435)))

(declare-fun b!1037958 () Bool)

(declare-fun res!692474 () Bool)

(declare-fun e!587256 () Bool)

(assert (=> b!1037958 (=> (not res!692474) (not e!587256))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037958 (= res!692474 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38514 () Bool)

(declare-fun mapRes!38514 () Bool)

(declare-fun tp!73945 () Bool)

(declare-fun e!587252 () Bool)

(assert (=> mapNonEmpty!38514 (= mapRes!38514 (and tp!73945 e!587252))))

(declare-fun mapKey!38514 () (_ BitVec 32))

(declare-datatypes ((V!37739 0))(
  ( (V!37740 (val!12375 Int)) )
))
(declare-datatypes ((ValueCell!11621 0))(
  ( (ValueCellFull!11621 (v!14959 V!37739)) (EmptyCell!11621) )
))
(declare-fun mapRest!38514 () (Array (_ BitVec 32) ValueCell!11621))

(declare-datatypes ((array!65349 0))(
  ( (array!65350 (arr!31452 (Array (_ BitVec 32) (_ BitVec 64))) (size!31984 (_ BitVec 32))) )
))
(declare-datatypes ((array!65351 0))(
  ( (array!65352 (arr!31453 (Array (_ BitVec 32) ValueCell!11621)) (size!31985 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5836 0))(
  ( (LongMapFixedSize!5837 (defaultEntry!6300 Int) (mask!30228 (_ BitVec 32)) (extraKeys!6028 (_ BitVec 32)) (zeroValue!6134 V!37739) (minValue!6134 V!37739) (_size!2973 (_ BitVec 32)) (_keys!11496 array!65349) (_values!6323 array!65351) (_vacant!2973 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5836)

(declare-fun mapValue!38514 () ValueCell!11621)

(assert (=> mapNonEmpty!38514 (= (arr!31453 (_values!6323 thiss!1427)) (store mapRest!38514 mapKey!38514 mapValue!38514))))

(declare-fun b!1037959 () Bool)

(declare-fun res!692478 () Bool)

(declare-fun e!587255 () Bool)

(assert (=> b!1037959 (=> res!692478 e!587255)))

(declare-datatypes ((List!21965 0))(
  ( (Nil!21962) (Cons!21961 (h!23164 (_ BitVec 64)) (t!31170 List!21965)) )
))
(declare-fun arrayNoDuplicates!0 (array!65349 (_ BitVec 32) List!21965) Bool)

(assert (=> b!1037959 (= res!692478 (not (arrayNoDuplicates!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 Nil!21962)))))

(declare-fun b!1037960 () Bool)

(declare-fun e!587254 () Bool)

(declare-fun tp_is_empty!24649 () Bool)

(assert (=> b!1037960 (= e!587254 tp_is_empty!24649)))

(declare-fun b!1037961 () Bool)

(declare-fun e!587250 () Bool)

(assert (=> b!1037961 (= e!587256 e!587250)))

(declare-fun res!692476 () Bool)

(assert (=> b!1037961 (=> (not res!692476) (not e!587250))))

(declare-datatypes ((SeekEntryResult!9758 0))(
  ( (MissingZero!9758 (index!41403 (_ BitVec 32))) (Found!9758 (index!41404 (_ BitVec 32))) (Intermediate!9758 (undefined!10570 Bool) (index!41405 (_ BitVec 32)) (x!92618 (_ BitVec 32))) (Undefined!9758) (MissingVacant!9758 (index!41406 (_ BitVec 32))) )
))
(declare-fun lt!457457 () SeekEntryResult!9758)

(get-info :version)

(assert (=> b!1037961 (= res!692476 ((_ is Found!9758) lt!457457))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65349 (_ BitVec 32)) SeekEntryResult!9758)

(assert (=> b!1037961 (= lt!457457 (seekEntry!0 key!909 (_keys!11496 thiss!1427) (mask!30228 thiss!1427)))))

(declare-fun b!1037962 () Bool)

(assert (=> b!1037962 (= e!587250 (not e!587255))))

(declare-fun res!692475 () Bool)

(assert (=> b!1037962 (=> res!692475 e!587255)))

(assert (=> b!1037962 (= res!692475 (or (bvsge (size!31984 (_keys!11496 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65349 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037962 (= (arrayCountValidKeys!0 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427))) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33849 0))(
  ( (Unit!33850) )
))
(declare-fun lt!457458 () Unit!33849)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65349 (_ BitVec 32) (_ BitVec 64)) Unit!33849)

(assert (=> b!1037962 (= lt!457458 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11496 thiss!1427) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037963 () Bool)

(declare-fun e!587249 () Bool)

(assert (=> b!1037963 (= e!587249 (and e!587254 mapRes!38514))))

(declare-fun condMapEmpty!38514 () Bool)

(declare-fun mapDefault!38514 () ValueCell!11621)

(assert (=> b!1037963 (= condMapEmpty!38514 (= (arr!31453 (_values!6323 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11621)) mapDefault!38514)))))

(declare-fun res!692471 () Bool)

(assert (=> start!90810 (=> (not res!692471) (not e!587256))))

(declare-fun valid!2189 (LongMapFixedSize!5836) Bool)

(assert (=> start!90810 (= res!692471 (valid!2189 thiss!1427))))

(assert (=> start!90810 e!587256))

(declare-fun e!587253 () Bool)

(assert (=> start!90810 e!587253))

(assert (=> start!90810 true))

(declare-fun b!1037964 () Bool)

(declare-fun res!692472 () Bool)

(assert (=> b!1037964 (=> res!692472 e!587255)))

(declare-fun contains!6012 (List!21965 (_ BitVec 64)) Bool)

(assert (=> b!1037964 (= res!692472 (contains!6012 Nil!21962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037965 () Bool)

(assert (=> b!1037965 (= e!587252 tp_is_empty!24649)))

(declare-fun b!1037966 () Bool)

(declare-fun res!692477 () Bool)

(assert (=> b!1037966 (=> res!692477 e!587255)))

(assert (=> b!1037966 (= res!692477 (contains!6012 Nil!21962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38514 () Bool)

(assert (=> mapIsEmpty!38514 mapRes!38514))

(declare-fun array_inv!24321 (array!65349) Bool)

(declare-fun array_inv!24322 (array!65351) Bool)

(assert (=> b!1037967 (= e!587253 (and tp!73944 tp_is_empty!24649 (array_inv!24321 (_keys!11496 thiss!1427)) (array_inv!24322 (_values!6323 thiss!1427)) e!587249))))

(declare-fun b!1037968 () Bool)

(declare-fun res!692473 () Bool)

(assert (=> b!1037968 (=> res!692473 e!587255)))

(declare-fun noDuplicate!1493 (List!21965) Bool)

(assert (=> b!1037968 (= res!692473 (not (noDuplicate!1493 Nil!21962)))))

(declare-fun b!1037969 () Bool)

(assert (=> b!1037969 (= e!587255 (and (bvsge (index!41404 lt!457457) #b00000000000000000000000000000000) (bvslt (index!41404 lt!457457) (size!31984 (_keys!11496 thiss!1427)))))))

(assert (= (and start!90810 res!692471) b!1037958))

(assert (= (and b!1037958 res!692474) b!1037961))

(assert (= (and b!1037961 res!692476) b!1037962))

(assert (= (and b!1037962 (not res!692475)) b!1037968))

(assert (= (and b!1037968 (not res!692473)) b!1037966))

(assert (= (and b!1037966 (not res!692477)) b!1037964))

(assert (= (and b!1037964 (not res!692472)) b!1037959))

(assert (= (and b!1037959 (not res!692478)) b!1037969))

(assert (= (and b!1037963 condMapEmpty!38514) mapIsEmpty!38514))

(assert (= (and b!1037963 (not condMapEmpty!38514)) mapNonEmpty!38514))

(assert (= (and mapNonEmpty!38514 ((_ is ValueCellFull!11621) mapValue!38514)) b!1037965))

(assert (= (and b!1037963 ((_ is ValueCellFull!11621) mapDefault!38514)) b!1037960))

(assert (= b!1037967 b!1037963))

(assert (= start!90810 b!1037967))

(declare-fun m!957517 () Bool)

(assert (=> start!90810 m!957517))

(declare-fun m!957519 () Bool)

(assert (=> b!1037964 m!957519))

(declare-fun m!957521 () Bool)

(assert (=> b!1037968 m!957521))

(declare-fun m!957523 () Bool)

(assert (=> b!1037959 m!957523))

(declare-fun m!957525 () Bool)

(assert (=> b!1037966 m!957525))

(declare-fun m!957527 () Bool)

(assert (=> b!1037967 m!957527))

(declare-fun m!957529 () Bool)

(assert (=> b!1037967 m!957529))

(declare-fun m!957531 () Bool)

(assert (=> b!1037962 m!957531))

(declare-fun m!957533 () Bool)

(assert (=> b!1037962 m!957533))

(declare-fun m!957535 () Bool)

(assert (=> b!1037962 m!957535))

(declare-fun m!957537 () Bool)

(assert (=> b!1037962 m!957537))

(declare-fun m!957539 () Bool)

(assert (=> mapNonEmpty!38514 m!957539))

(declare-fun m!957541 () Bool)

(assert (=> b!1037961 m!957541))

(check-sat (not b!1037961) tp_is_empty!24649 (not b!1037967) (not b_next!20929) (not mapNonEmpty!38514) (not b!1037962) (not b!1037964) (not b!1037959) b_and!33435 (not b!1037968) (not start!90810) (not b!1037966))
(check-sat b_and!33435 (not b_next!20929))
(get-model)

(declare-fun bm!43911 () Bool)

(declare-fun call!43914 () Bool)

(declare-fun c!105142 () Bool)

(assert (=> bm!43911 (= call!43914 (arrayNoDuplicates!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105142 (Cons!21961 (select (arr!31452 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) Nil!21962) Nil!21962)))))

(declare-fun b!1038052 () Bool)

(declare-fun e!587316 () Bool)

(assert (=> b!1038052 (= e!587316 call!43914)))

(declare-fun b!1038053 () Bool)

(declare-fun e!587315 () Bool)

(assert (=> b!1038053 (= e!587315 (contains!6012 Nil!21962 (select (arr!31452 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038055 () Bool)

(assert (=> b!1038055 (= e!587316 call!43914)))

(declare-fun b!1038056 () Bool)

(declare-fun e!587313 () Bool)

(declare-fun e!587314 () Bool)

(assert (=> b!1038056 (= e!587313 e!587314)))

(declare-fun res!692535 () Bool)

(assert (=> b!1038056 (=> (not res!692535) (not e!587314))))

(assert (=> b!1038056 (= res!692535 (not e!587315))))

(declare-fun res!692533 () Bool)

(assert (=> b!1038056 (=> (not res!692533) (not e!587315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038056 (= res!692533 (validKeyInArray!0 (select (arr!31452 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038054 () Bool)

(assert (=> b!1038054 (= e!587314 e!587316)))

(assert (=> b!1038054 (= c!105142 (validKeyInArray!0 (select (arr!31452 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125157 () Bool)

(declare-fun res!692534 () Bool)

(assert (=> d!125157 (=> res!692534 e!587313)))

(assert (=> d!125157 (= res!692534 (bvsge #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))))))

(assert (=> d!125157 (= (arrayNoDuplicates!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 Nil!21962) e!587313)))

(assert (= (and d!125157 (not res!692534)) b!1038056))

(assert (= (and b!1038056 res!692533) b!1038053))

(assert (= (and b!1038056 res!692535) b!1038054))

(assert (= (and b!1038054 c!105142) b!1038055))

(assert (= (and b!1038054 (not c!105142)) b!1038052))

(assert (= (or b!1038055 b!1038052) bm!43911))

(declare-fun m!957595 () Bool)

(assert (=> bm!43911 m!957595))

(declare-fun m!957597 () Bool)

(assert (=> bm!43911 m!957597))

(assert (=> b!1038053 m!957595))

(assert (=> b!1038053 m!957595))

(declare-fun m!957599 () Bool)

(assert (=> b!1038053 m!957599))

(assert (=> b!1038056 m!957595))

(assert (=> b!1038056 m!957595))

(declare-fun m!957601 () Bool)

(assert (=> b!1038056 m!957601))

(assert (=> b!1038054 m!957595))

(assert (=> b!1038054 m!957595))

(assert (=> b!1038054 m!957601))

(assert (=> b!1037959 d!125157))

(declare-fun d!125159 () Bool)

(declare-fun lt!457473 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!518 (List!21965) (InoxSet (_ BitVec 64)))

(assert (=> d!125159 (= lt!457473 (select (content!518 Nil!21962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587322 () Bool)

(assert (=> d!125159 (= lt!457473 e!587322)))

(declare-fun res!692541 () Bool)

(assert (=> d!125159 (=> (not res!692541) (not e!587322))))

(assert (=> d!125159 (= res!692541 ((_ is Cons!21961) Nil!21962))))

(assert (=> d!125159 (= (contains!6012 Nil!21962 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457473)))

(declare-fun b!1038061 () Bool)

(declare-fun e!587321 () Bool)

(assert (=> b!1038061 (= e!587322 e!587321)))

(declare-fun res!692540 () Bool)

(assert (=> b!1038061 (=> res!692540 e!587321)))

(assert (=> b!1038061 (= res!692540 (= (h!23164 Nil!21962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038062 () Bool)

(assert (=> b!1038062 (= e!587321 (contains!6012 (t!31170 Nil!21962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125159 res!692541) b!1038061))

(assert (= (and b!1038061 (not res!692540)) b!1038062))

(declare-fun m!957603 () Bool)

(assert (=> d!125159 m!957603))

(declare-fun m!957605 () Bool)

(assert (=> d!125159 m!957605))

(declare-fun m!957607 () Bool)

(assert (=> b!1038062 m!957607))

(assert (=> b!1037964 d!125159))

(declare-fun b!1038075 () Bool)

(declare-fun e!587330 () SeekEntryResult!9758)

(declare-fun lt!457484 () SeekEntryResult!9758)

(assert (=> b!1038075 (= e!587330 (ite ((_ is MissingVacant!9758) lt!457484) (MissingZero!9758 (index!41406 lt!457484)) lt!457484))))

(declare-fun lt!457485 () SeekEntryResult!9758)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65349 (_ BitVec 32)) SeekEntryResult!9758)

(assert (=> b!1038075 (= lt!457484 (seekKeyOrZeroReturnVacant!0 (x!92618 lt!457485) (index!41405 lt!457485) (index!41405 lt!457485) key!909 (_keys!11496 thiss!1427) (mask!30228 thiss!1427)))))

(declare-fun b!1038076 () Bool)

(declare-fun e!587329 () SeekEntryResult!9758)

(assert (=> b!1038076 (= e!587329 Undefined!9758)))

(declare-fun b!1038077 () Bool)

(declare-fun e!587331 () SeekEntryResult!9758)

(assert (=> b!1038077 (= e!587331 (Found!9758 (index!41405 lt!457485)))))

(declare-fun b!1038078 () Bool)

(assert (=> b!1038078 (= e!587329 e!587331)))

(declare-fun lt!457482 () (_ BitVec 64))

(assert (=> b!1038078 (= lt!457482 (select (arr!31452 (_keys!11496 thiss!1427)) (index!41405 lt!457485)))))

(declare-fun c!105151 () Bool)

(assert (=> b!1038078 (= c!105151 (= lt!457482 key!909))))

(declare-fun b!1038079 () Bool)

(assert (=> b!1038079 (= e!587330 (MissingZero!9758 (index!41405 lt!457485)))))

(declare-fun b!1038080 () Bool)

(declare-fun c!105149 () Bool)

(assert (=> b!1038080 (= c!105149 (= lt!457482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038080 (= e!587331 e!587330)))

(declare-fun d!125161 () Bool)

(declare-fun lt!457483 () SeekEntryResult!9758)

(assert (=> d!125161 (and (or ((_ is MissingVacant!9758) lt!457483) (not ((_ is Found!9758) lt!457483)) (and (bvsge (index!41404 lt!457483) #b00000000000000000000000000000000) (bvslt (index!41404 lt!457483) (size!31984 (_keys!11496 thiss!1427))))) (not ((_ is MissingVacant!9758) lt!457483)) (or (not ((_ is Found!9758) lt!457483)) (= (select (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457483)) key!909)))))

(assert (=> d!125161 (= lt!457483 e!587329)))

(declare-fun c!105150 () Bool)

(assert (=> d!125161 (= c!105150 (and ((_ is Intermediate!9758) lt!457485) (undefined!10570 lt!457485)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65349 (_ BitVec 32)) SeekEntryResult!9758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125161 (= lt!457485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30228 thiss!1427)) key!909 (_keys!11496 thiss!1427) (mask!30228 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125161 (validMask!0 (mask!30228 thiss!1427))))

(assert (=> d!125161 (= (seekEntry!0 key!909 (_keys!11496 thiss!1427) (mask!30228 thiss!1427)) lt!457483)))

(assert (= (and d!125161 c!105150) b!1038076))

(assert (= (and d!125161 (not c!105150)) b!1038078))

(assert (= (and b!1038078 c!105151) b!1038077))

(assert (= (and b!1038078 (not c!105151)) b!1038080))

(assert (= (and b!1038080 c!105149) b!1038079))

(assert (= (and b!1038080 (not c!105149)) b!1038075))

(declare-fun m!957609 () Bool)

(assert (=> b!1038075 m!957609))

(declare-fun m!957611 () Bool)

(assert (=> b!1038078 m!957611))

(declare-fun m!957613 () Bool)

(assert (=> d!125161 m!957613))

(declare-fun m!957615 () Bool)

(assert (=> d!125161 m!957615))

(assert (=> d!125161 m!957615))

(declare-fun m!957617 () Bool)

(assert (=> d!125161 m!957617))

(declare-fun m!957619 () Bool)

(assert (=> d!125161 m!957619))

(assert (=> b!1037961 d!125161))

(declare-fun d!125163 () Bool)

(declare-fun lt!457486 () Bool)

(assert (=> d!125163 (= lt!457486 (select (content!518 Nil!21962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587333 () Bool)

(assert (=> d!125163 (= lt!457486 e!587333)))

(declare-fun res!692543 () Bool)

(assert (=> d!125163 (=> (not res!692543) (not e!587333))))

(assert (=> d!125163 (= res!692543 ((_ is Cons!21961) Nil!21962))))

(assert (=> d!125163 (= (contains!6012 Nil!21962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457486)))

(declare-fun b!1038081 () Bool)

(declare-fun e!587332 () Bool)

(assert (=> b!1038081 (= e!587333 e!587332)))

(declare-fun res!692542 () Bool)

(assert (=> b!1038081 (=> res!692542 e!587332)))

(assert (=> b!1038081 (= res!692542 (= (h!23164 Nil!21962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038082 () Bool)

(assert (=> b!1038082 (= e!587332 (contains!6012 (t!31170 Nil!21962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125163 res!692543) b!1038081))

(assert (= (and b!1038081 (not res!692542)) b!1038082))

(assert (=> d!125163 m!957603))

(declare-fun m!957621 () Bool)

(assert (=> d!125163 m!957621))

(declare-fun m!957623 () Bool)

(assert (=> b!1038082 m!957623))

(assert (=> b!1037966 d!125163))

(declare-fun d!125165 () Bool)

(declare-fun res!692550 () Bool)

(declare-fun e!587336 () Bool)

(assert (=> d!125165 (=> (not res!692550) (not e!587336))))

(declare-fun simpleValid!421 (LongMapFixedSize!5836) Bool)

(assert (=> d!125165 (= res!692550 (simpleValid!421 thiss!1427))))

(assert (=> d!125165 (= (valid!2189 thiss!1427) e!587336)))

(declare-fun b!1038089 () Bool)

(declare-fun res!692551 () Bool)

(assert (=> b!1038089 (=> (not res!692551) (not e!587336))))

(assert (=> b!1038089 (= res!692551 (= (arrayCountValidKeys!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) (_size!2973 thiss!1427)))))

(declare-fun b!1038090 () Bool)

(declare-fun res!692552 () Bool)

(assert (=> b!1038090 (=> (not res!692552) (not e!587336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65349 (_ BitVec 32)) Bool)

(assert (=> b!1038090 (= res!692552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11496 thiss!1427) (mask!30228 thiss!1427)))))

(declare-fun b!1038091 () Bool)

(assert (=> b!1038091 (= e!587336 (arrayNoDuplicates!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 Nil!21962))))

(assert (= (and d!125165 res!692550) b!1038089))

(assert (= (and b!1038089 res!692551) b!1038090))

(assert (= (and b!1038090 res!692552) b!1038091))

(declare-fun m!957625 () Bool)

(assert (=> d!125165 m!957625))

(assert (=> b!1038089 m!957535))

(declare-fun m!957627 () Bool)

(assert (=> b!1038090 m!957627))

(assert (=> b!1038091 m!957523))

(assert (=> start!90810 d!125165))

(declare-fun b!1038100 () Bool)

(declare-fun e!587341 () (_ BitVec 32))

(declare-fun call!43917 () (_ BitVec 32))

(assert (=> b!1038100 (= e!587341 call!43917)))

(declare-fun d!125167 () Bool)

(declare-fun lt!457489 () (_ BitVec 32))

(assert (=> d!125167 (and (bvsge lt!457489 #b00000000000000000000000000000000) (bvsle lt!457489 (bvsub (size!31984 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!587342 () (_ BitVec 32))

(assert (=> d!125167 (= lt!457489 e!587342)))

(declare-fun c!105156 () Bool)

(assert (=> d!125167 (= c!105156 (bvsge #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))))))

(assert (=> d!125167 (and (bvsle #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31984 (_keys!11496 thiss!1427)) (size!31984 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427))))))))

(assert (=> d!125167 (= (arrayCountValidKeys!0 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427))) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) lt!457489)))

(declare-fun bm!43914 () Bool)

(assert (=> bm!43914 (= call!43917 (arrayCountValidKeys!0 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31984 (_keys!11496 thiss!1427))))))

(declare-fun b!1038101 () Bool)

(assert (=> b!1038101 (= e!587341 (bvadd #b00000000000000000000000000000001 call!43917))))

(declare-fun b!1038102 () Bool)

(assert (=> b!1038102 (= e!587342 #b00000000000000000000000000000000)))

(declare-fun b!1038103 () Bool)

(assert (=> b!1038103 (= e!587342 e!587341)))

(declare-fun c!105157 () Bool)

(assert (=> b!1038103 (= c!105157 (validKeyInArray!0 (select (arr!31452 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!125167 c!105156) b!1038102))

(assert (= (and d!125167 (not c!105156)) b!1038103))

(assert (= (and b!1038103 c!105157) b!1038101))

(assert (= (and b!1038103 (not c!105157)) b!1038100))

(assert (= (or b!1038101 b!1038100) bm!43914))

(declare-fun m!957629 () Bool)

(assert (=> bm!43914 m!957629))

(declare-fun m!957631 () Bool)

(assert (=> b!1038103 m!957631))

(assert (=> b!1038103 m!957631))

(declare-fun m!957633 () Bool)

(assert (=> b!1038103 m!957633))

(assert (=> b!1037962 d!125167))

(declare-fun b!1038104 () Bool)

(declare-fun e!587343 () (_ BitVec 32))

(declare-fun call!43918 () (_ BitVec 32))

(assert (=> b!1038104 (= e!587343 call!43918)))

(declare-fun d!125169 () Bool)

(declare-fun lt!457490 () (_ BitVec 32))

(assert (=> d!125169 (and (bvsge lt!457490 #b00000000000000000000000000000000) (bvsle lt!457490 (bvsub (size!31984 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587344 () (_ BitVec 32))

(assert (=> d!125169 (= lt!457490 e!587344)))

(declare-fun c!105158 () Bool)

(assert (=> d!125169 (= c!105158 (bvsge #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))))))

(assert (=> d!125169 (and (bvsle #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31984 (_keys!11496 thiss!1427)) (size!31984 (_keys!11496 thiss!1427))))))

(assert (=> d!125169 (= (arrayCountValidKeys!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) lt!457490)))

(declare-fun bm!43915 () Bool)

(assert (=> bm!43915 (= call!43918 (arrayCountValidKeys!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31984 (_keys!11496 thiss!1427))))))

(declare-fun b!1038105 () Bool)

(assert (=> b!1038105 (= e!587343 (bvadd #b00000000000000000000000000000001 call!43918))))

(declare-fun b!1038106 () Bool)

(assert (=> b!1038106 (= e!587344 #b00000000000000000000000000000000)))

(declare-fun b!1038107 () Bool)

(assert (=> b!1038107 (= e!587344 e!587343)))

(declare-fun c!105159 () Bool)

(assert (=> b!1038107 (= c!105159 (validKeyInArray!0 (select (arr!31452 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125169 c!105158) b!1038106))

(assert (= (and d!125169 (not c!105158)) b!1038107))

(assert (= (and b!1038107 c!105159) b!1038105))

(assert (= (and b!1038107 (not c!105159)) b!1038104))

(assert (= (or b!1038105 b!1038104) bm!43915))

(declare-fun m!957635 () Bool)

(assert (=> bm!43915 m!957635))

(assert (=> b!1038107 m!957595))

(assert (=> b!1038107 m!957595))

(assert (=> b!1038107 m!957601))

(assert (=> b!1037962 d!125169))

(declare-fun b!1038119 () Bool)

(declare-fun e!587349 () Bool)

(assert (=> b!1038119 (= e!587349 (= (arrayCountValidKeys!0 (array!65350 (store (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31984 (_keys!11496 thiss!1427))) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 (size!31984 (_keys!11496 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038116 () Bool)

(declare-fun res!692562 () Bool)

(declare-fun e!587350 () Bool)

(assert (=> b!1038116 (=> (not res!692562) (not e!587350))))

(assert (=> b!1038116 (= res!692562 (validKeyInArray!0 (select (arr!31452 (_keys!11496 thiss!1427)) (index!41404 lt!457457))))))

(declare-fun d!125171 () Bool)

(assert (=> d!125171 e!587349))

(declare-fun res!692563 () Bool)

(assert (=> d!125171 (=> (not res!692563) (not e!587349))))

(assert (=> d!125171 (= res!692563 (and (bvsge (index!41404 lt!457457) #b00000000000000000000000000000000) (bvslt (index!41404 lt!457457) (size!31984 (_keys!11496 thiss!1427)))))))

(declare-fun lt!457493 () Unit!33849)

(declare-fun choose!82 (array!65349 (_ BitVec 32) (_ BitVec 64)) Unit!33849)

(assert (=> d!125171 (= lt!457493 (choose!82 (_keys!11496 thiss!1427) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125171 e!587350))

(declare-fun res!692564 () Bool)

(assert (=> d!125171 (=> (not res!692564) (not e!587350))))

(assert (=> d!125171 (= res!692564 (and (bvsge (index!41404 lt!457457) #b00000000000000000000000000000000) (bvslt (index!41404 lt!457457) (size!31984 (_keys!11496 thiss!1427)))))))

(assert (=> d!125171 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11496 thiss!1427) (index!41404 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457493)))

(declare-fun b!1038118 () Bool)

(assert (=> b!1038118 (= e!587350 (bvslt (size!31984 (_keys!11496 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038117 () Bool)

(declare-fun res!692561 () Bool)

(assert (=> b!1038117 (=> (not res!692561) (not e!587350))))

(assert (=> b!1038117 (= res!692561 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125171 res!692564) b!1038116))

(assert (= (and b!1038116 res!692562) b!1038117))

(assert (= (and b!1038117 res!692561) b!1038118))

(assert (= (and d!125171 res!692563) b!1038119))

(assert (=> b!1038119 m!957531))

(assert (=> b!1038119 m!957533))

(assert (=> b!1038119 m!957535))

(declare-fun m!957637 () Bool)

(assert (=> b!1038116 m!957637))

(assert (=> b!1038116 m!957637))

(declare-fun m!957639 () Bool)

(assert (=> b!1038116 m!957639))

(declare-fun m!957641 () Bool)

(assert (=> d!125171 m!957641))

(declare-fun m!957643 () Bool)

(assert (=> b!1038117 m!957643))

(assert (=> b!1037962 d!125171))

(declare-fun d!125173 () Bool)

(declare-fun res!692569 () Bool)

(declare-fun e!587355 () Bool)

(assert (=> d!125173 (=> res!692569 e!587355)))

(assert (=> d!125173 (= res!692569 ((_ is Nil!21962) Nil!21962))))

(assert (=> d!125173 (= (noDuplicate!1493 Nil!21962) e!587355)))

(declare-fun b!1038124 () Bool)

(declare-fun e!587356 () Bool)

(assert (=> b!1038124 (= e!587355 e!587356)))

(declare-fun res!692570 () Bool)

(assert (=> b!1038124 (=> (not res!692570) (not e!587356))))

(assert (=> b!1038124 (= res!692570 (not (contains!6012 (t!31170 Nil!21962) (h!23164 Nil!21962))))))

(declare-fun b!1038125 () Bool)

(assert (=> b!1038125 (= e!587356 (noDuplicate!1493 (t!31170 Nil!21962)))))

(assert (= (and d!125173 (not res!692569)) b!1038124))

(assert (= (and b!1038124 res!692570) b!1038125))

(declare-fun m!957645 () Bool)

(assert (=> b!1038124 m!957645))

(declare-fun m!957647 () Bool)

(assert (=> b!1038125 m!957647))

(assert (=> b!1037968 d!125173))

(declare-fun d!125175 () Bool)

(assert (=> d!125175 (= (array_inv!24321 (_keys!11496 thiss!1427)) (bvsge (size!31984 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037967 d!125175))

(declare-fun d!125177 () Bool)

(assert (=> d!125177 (= (array_inv!24322 (_values!6323 thiss!1427)) (bvsge (size!31985 (_values!6323 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037967 d!125177))

(declare-fun mapNonEmpty!38523 () Bool)

(declare-fun mapRes!38523 () Bool)

(declare-fun tp!73960 () Bool)

(declare-fun e!587362 () Bool)

(assert (=> mapNonEmpty!38523 (= mapRes!38523 (and tp!73960 e!587362))))

(declare-fun mapKey!38523 () (_ BitVec 32))

(declare-fun mapValue!38523 () ValueCell!11621)

(declare-fun mapRest!38523 () (Array (_ BitVec 32) ValueCell!11621))

(assert (=> mapNonEmpty!38523 (= mapRest!38514 (store mapRest!38523 mapKey!38523 mapValue!38523))))

(declare-fun b!1038133 () Bool)

(declare-fun e!587361 () Bool)

(assert (=> b!1038133 (= e!587361 tp_is_empty!24649)))

(declare-fun condMapEmpty!38523 () Bool)

(declare-fun mapDefault!38523 () ValueCell!11621)

(assert (=> mapNonEmpty!38514 (= condMapEmpty!38523 (= mapRest!38514 ((as const (Array (_ BitVec 32) ValueCell!11621)) mapDefault!38523)))))

(assert (=> mapNonEmpty!38514 (= tp!73945 (and e!587361 mapRes!38523))))

(declare-fun b!1038132 () Bool)

(assert (=> b!1038132 (= e!587362 tp_is_empty!24649)))

(declare-fun mapIsEmpty!38523 () Bool)

(assert (=> mapIsEmpty!38523 mapRes!38523))

(assert (= (and mapNonEmpty!38514 condMapEmpty!38523) mapIsEmpty!38523))

(assert (= (and mapNonEmpty!38514 (not condMapEmpty!38523)) mapNonEmpty!38523))

(assert (= (and mapNonEmpty!38523 ((_ is ValueCellFull!11621) mapValue!38523)) b!1038132))

(assert (= (and mapNonEmpty!38514 ((_ is ValueCellFull!11621) mapDefault!38523)) b!1038133))

(declare-fun m!957649 () Bool)

(assert (=> mapNonEmpty!38523 m!957649))

(check-sat (not bm!43914) (not b!1038107) tp_is_empty!24649 (not b!1038054) (not mapNonEmpty!38523) b_and!33435 (not d!125171) (not d!125163) (not bm!43911) (not b!1038103) (not b!1038116) (not b!1038062) (not b!1038125) (not b!1038075) (not b!1038091) (not b!1038089) (not b_next!20929) (not b!1038117) (not b!1038082) (not b!1038056) (not d!125165) (not b!1038053) (not d!125159) (not b!1038124) (not d!125161) (not bm!43915) (not b!1038090) (not b!1038119))
(check-sat b_and!33435 (not b_next!20929))
