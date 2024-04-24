; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91848 () Bool)

(assert start!91848)

(declare-fun b!1044400 () Bool)

(declare-fun b_free!21079 () Bool)

(declare-fun b_next!21079 () Bool)

(assert (=> b!1044400 (= b_free!21079 (not b_next!21079))))

(declare-fun tp!74471 () Bool)

(declare-fun b_and!33621 () Bool)

(assert (=> b!1044400 (= tp!74471 b_and!33621)))

(declare-fun res!695463 () Bool)

(declare-fun e!591786 () Bool)

(assert (=> start!91848 (=> (not res!695463) (not e!591786))))

(declare-datatypes ((V!37939 0))(
  ( (V!37940 (val!12450 Int)) )
))
(declare-datatypes ((ValueCell!11696 0))(
  ( (ValueCellFull!11696 (v!15037 V!37939)) (EmptyCell!11696) )
))
(declare-datatypes ((array!65807 0))(
  ( (array!65808 (arr!31651 (Array (_ BitVec 32) (_ BitVec 64))) (size!32187 (_ BitVec 32))) )
))
(declare-datatypes ((array!65809 0))(
  ( (array!65810 (arr!31652 (Array (_ BitVec 32) ValueCell!11696)) (size!32188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5986 0))(
  ( (LongMapFixedSize!5987 (defaultEntry!6375 Int) (mask!30516 (_ BitVec 32)) (extraKeys!6103 (_ BitVec 32)) (zeroValue!6209 V!37939) (minValue!6209 V!37939) (_size!3048 (_ BitVec 32)) (_keys!11669 array!65807) (_values!6398 array!65809) (_vacant!3048 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5986)

(declare-fun valid!2254 (LongMapFixedSize!5986) Bool)

(assert (=> start!91848 (= res!695463 (valid!2254 thiss!1427))))

(assert (=> start!91848 e!591786))

(declare-fun e!591783 () Bool)

(assert (=> start!91848 e!591783))

(assert (=> start!91848 true))

(declare-fun b!1044393 () Bool)

(declare-fun e!591788 () Bool)

(declare-fun tp_is_empty!24799 () Bool)

(assert (=> b!1044393 (= e!591788 tp_is_empty!24799)))

(declare-fun b!1044394 () Bool)

(declare-fun e!591785 () Bool)

(assert (=> b!1044394 (= e!591785 tp_is_empty!24799)))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun b!1044395 () Bool)

(declare-fun e!591782 () Bool)

(declare-datatypes ((SeekEntryResult!9780 0))(
  ( (MissingZero!9780 (index!41491 (_ BitVec 32))) (Found!9780 (index!41492 (_ BitVec 32))) (Intermediate!9780 (undefined!10592 Bool) (index!41493 (_ BitVec 32)) (x!93102 (_ BitVec 32))) (Undefined!9780) (MissingVacant!9780 (index!41494 (_ BitVec 32))) )
))
(declare-fun lt!460263 () SeekEntryResult!9780)

(assert (=> b!1044395 (= e!591782 (= (select (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263)) key!909))))

(declare-fun b!1044396 () Bool)

(declare-fun e!591784 () Bool)

(assert (=> b!1044396 (= e!591786 e!591784)))

(declare-fun res!695470 () Bool)

(assert (=> b!1044396 (=> (not res!695470) (not e!591784))))

(get-info :version)

(assert (=> b!1044396 (= res!695470 ((_ is Found!9780) lt!460263))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65807 (_ BitVec 32)) SeekEntryResult!9780)

(assert (=> b!1044396 (= lt!460263 (seekEntry!0 key!909 (_keys!11669 thiss!1427) (mask!30516 thiss!1427)))))

(declare-fun b!1044397 () Bool)

(declare-fun res!695464 () Bool)

(assert (=> b!1044397 (=> res!695464 e!591782)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65807 (_ BitVec 32)) Bool)

(assert (=> b!1044397 (= res!695464 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11669 thiss!1427) (mask!30516 thiss!1427))))))

(declare-fun b!1044398 () Bool)

(declare-fun res!695462 () Bool)

(assert (=> b!1044398 (=> res!695462 e!591782)))

(assert (=> b!1044398 (= res!695462 (or (bvslt (index!41492 lt!460263) #b00000000000000000000000000000000) (bvsge (index!41492 lt!460263) (size!32187 (_keys!11669 thiss!1427)))))))

(declare-fun b!1044399 () Bool)

(declare-fun e!591789 () Bool)

(declare-fun mapRes!38816 () Bool)

(assert (=> b!1044399 (= e!591789 (and e!591785 mapRes!38816))))

(declare-fun condMapEmpty!38816 () Bool)

(declare-fun mapDefault!38816 () ValueCell!11696)

(assert (=> b!1044399 (= condMapEmpty!38816 (= (arr!31652 (_values!6398 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11696)) mapDefault!38816)))))

(declare-fun array_inv!24467 (array!65807) Bool)

(declare-fun array_inv!24468 (array!65809) Bool)

(assert (=> b!1044400 (= e!591783 (and tp!74471 tp_is_empty!24799 (array_inv!24467 (_keys!11669 thiss!1427)) (array_inv!24468 (_values!6398 thiss!1427)) e!591789))))

(declare-fun b!1044401 () Bool)

(declare-fun res!695467 () Bool)

(assert (=> b!1044401 (=> res!695467 e!591782)))

(declare-datatypes ((List!21974 0))(
  ( (Nil!21971) (Cons!21970 (h!23187 (_ BitVec 64)) (t!31180 List!21974)) )
))
(declare-fun arrayNoDuplicates!0 (array!65807 (_ BitVec 32) List!21974) Bool)

(assert (=> b!1044401 (= res!695467 (not (arrayNoDuplicates!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 Nil!21971)))))

(declare-fun mapIsEmpty!38816 () Bool)

(assert (=> mapIsEmpty!38816 mapRes!38816))

(declare-fun b!1044402 () Bool)

(declare-fun res!695466 () Bool)

(assert (=> b!1044402 (=> res!695466 e!591782)))

(assert (=> b!1044402 (= res!695466 (or (not (= (size!32188 (_values!6398 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30516 thiss!1427)))) (not (= (size!32187 (_keys!11669 thiss!1427)) (size!32188 (_values!6398 thiss!1427)))) (bvslt (mask!30516 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6103 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6103 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38816 () Bool)

(declare-fun tp!74472 () Bool)

(assert (=> mapNonEmpty!38816 (= mapRes!38816 (and tp!74472 e!591788))))

(declare-fun mapValue!38816 () ValueCell!11696)

(declare-fun mapKey!38816 () (_ BitVec 32))

(declare-fun mapRest!38816 () (Array (_ BitVec 32) ValueCell!11696))

(assert (=> mapNonEmpty!38816 (= (arr!31652 (_values!6398 thiss!1427)) (store mapRest!38816 mapKey!38816 mapValue!38816))))

(declare-fun b!1044403 () Bool)

(assert (=> b!1044403 (= e!591784 (not e!591782))))

(declare-fun res!695465 () Bool)

(assert (=> b!1044403 (=> res!695465 e!591782)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044403 (= res!695465 (not (validMask!0 (mask!30516 thiss!1427))))))

(declare-fun lt!460268 () array!65807)

(declare-fun arrayContainsKey!0 (array!65807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044403 (not (arrayContainsKey!0 lt!460268 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34071 0))(
  ( (Unit!34072) )
))
(declare-fun lt!460264 () Unit!34071)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65807 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> b!1044403 (= lt!460264 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11669 thiss!1427) (index!41492 lt!460263) key!909))))

(assert (=> b!1044403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460268 (mask!30516 thiss!1427))))

(declare-fun lt!460265 () Unit!34071)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65807 (_ BitVec 32) (_ BitVec 32)) Unit!34071)

(assert (=> b!1044403 (= lt!460265 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11669 thiss!1427) (index!41492 lt!460263) (mask!30516 thiss!1427)))))

(assert (=> b!1044403 (arrayNoDuplicates!0 lt!460268 #b00000000000000000000000000000000 Nil!21971)))

(declare-fun lt!460266 () Unit!34071)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65807 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21974) Unit!34071)

(assert (=> b!1044403 (= lt!460266 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11669 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41492 lt!460263) #b00000000000000000000000000000000 Nil!21971))))

(declare-fun arrayCountValidKeys!0 (array!65807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044403 (= (arrayCountValidKeys!0 lt!460268 #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044403 (= lt!460268 (array!65808 (store (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11669 thiss!1427))))))

(declare-fun lt!460267 () Unit!34071)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65807 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> b!1044403 (= lt!460267 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11669 thiss!1427) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044404 () Bool)

(declare-fun res!695468 () Bool)

(assert (=> b!1044404 (=> res!695468 e!591782)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044404 (= res!695468 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1044405 () Bool)

(declare-fun res!695469 () Bool)

(assert (=> b!1044405 (=> (not res!695469) (not e!591786))))

(assert (=> b!1044405 (= res!695469 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91848 res!695463) b!1044405))

(assert (= (and b!1044405 res!695469) b!1044396))

(assert (= (and b!1044396 res!695470) b!1044403))

(assert (= (and b!1044403 (not res!695465)) b!1044402))

(assert (= (and b!1044402 (not res!695466)) b!1044397))

(assert (= (and b!1044397 (not res!695464)) b!1044401))

(assert (= (and b!1044401 (not res!695467)) b!1044398))

(assert (= (and b!1044398 (not res!695462)) b!1044404))

(assert (= (and b!1044404 (not res!695468)) b!1044395))

(assert (= (and b!1044399 condMapEmpty!38816) mapIsEmpty!38816))

(assert (= (and b!1044399 (not condMapEmpty!38816)) mapNonEmpty!38816))

(assert (= (and mapNonEmpty!38816 ((_ is ValueCellFull!11696) mapValue!38816)) b!1044393))

(assert (= (and b!1044399 ((_ is ValueCellFull!11696) mapDefault!38816)) b!1044394))

(assert (= b!1044400 b!1044399))

(assert (= start!91848 b!1044400))

(declare-fun m!963955 () Bool)

(assert (=> b!1044395 m!963955))

(declare-fun m!963957 () Bool)

(assert (=> b!1044397 m!963957))

(declare-fun m!963959 () Bool)

(assert (=> b!1044404 m!963959))

(declare-fun m!963961 () Bool)

(assert (=> b!1044400 m!963961))

(declare-fun m!963963 () Bool)

(assert (=> b!1044400 m!963963))

(declare-fun m!963965 () Bool)

(assert (=> b!1044396 m!963965))

(declare-fun m!963967 () Bool)

(assert (=> b!1044401 m!963967))

(declare-fun m!963969 () Bool)

(assert (=> start!91848 m!963969))

(declare-fun m!963971 () Bool)

(assert (=> mapNonEmpty!38816 m!963971))

(declare-fun m!963973 () Bool)

(assert (=> b!1044403 m!963973))

(declare-fun m!963975 () Bool)

(assert (=> b!1044403 m!963975))

(declare-fun m!963977 () Bool)

(assert (=> b!1044403 m!963977))

(declare-fun m!963979 () Bool)

(assert (=> b!1044403 m!963979))

(declare-fun m!963981 () Bool)

(assert (=> b!1044403 m!963981))

(declare-fun m!963983 () Bool)

(assert (=> b!1044403 m!963983))

(declare-fun m!963985 () Bool)

(assert (=> b!1044403 m!963985))

(declare-fun m!963987 () Bool)

(assert (=> b!1044403 m!963987))

(declare-fun m!963989 () Bool)

(assert (=> b!1044403 m!963989))

(declare-fun m!963991 () Bool)

(assert (=> b!1044403 m!963991))

(declare-fun m!963993 () Bool)

(assert (=> b!1044403 m!963993))

(check-sat (not b!1044396) (not b_next!21079) (not b!1044404) (not b!1044401) (not b!1044400) b_and!33621 (not start!91848) (not mapNonEmpty!38816) (not b!1044403) tp_is_empty!24799 (not b!1044397))
(check-sat b_and!33621 (not b_next!21079))
(get-model)

(declare-fun b!1044492 () Bool)

(declare-fun e!591845 () Bool)

(declare-fun call!44280 () Bool)

(assert (=> b!1044492 (= e!591845 call!44280)))

(declare-fun b!1044493 () Bool)

(declare-fun e!591846 () Bool)

(assert (=> b!1044493 (= e!591846 e!591845)))

(declare-fun c!106320 () Bool)

(assert (=> b!1044493 (= c!106320 (validKeyInArray!0 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044494 () Bool)

(declare-fun e!591844 () Bool)

(assert (=> b!1044494 (= e!591845 e!591844)))

(declare-fun lt!460312 () (_ BitVec 64))

(assert (=> b!1044494 (= lt!460312 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460311 () Unit!34071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65807 (_ BitVec 64) (_ BitVec 32)) Unit!34071)

(assert (=> b!1044494 (= lt!460311 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11669 thiss!1427) lt!460312 #b00000000000000000000000000000000))))

(assert (=> b!1044494 (arrayContainsKey!0 (_keys!11669 thiss!1427) lt!460312 #b00000000000000000000000000000000)))

(declare-fun lt!460313 () Unit!34071)

(assert (=> b!1044494 (= lt!460313 lt!460311)))

(declare-fun res!695530 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65807 (_ BitVec 32)) SeekEntryResult!9780)

(assert (=> b!1044494 (= res!695530 (= (seekEntryOrOpen!0 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000) (_keys!11669 thiss!1427) (mask!30516 thiss!1427)) (Found!9780 #b00000000000000000000000000000000)))))

(assert (=> b!1044494 (=> (not res!695530) (not e!591844))))

(declare-fun b!1044495 () Bool)

(assert (=> b!1044495 (= e!591844 call!44280)))

(declare-fun d!126683 () Bool)

(declare-fun res!695529 () Bool)

(assert (=> d!126683 (=> res!695529 e!591846)))

(assert (=> d!126683 (= res!695529 (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))))))

(assert (=> d!126683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11669 thiss!1427) (mask!30516 thiss!1427)) e!591846)))

(declare-fun bm!44277 () Bool)

(assert (=> bm!44277 (= call!44280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11669 thiss!1427) (mask!30516 thiss!1427)))))

(assert (= (and d!126683 (not res!695529)) b!1044493))

(assert (= (and b!1044493 c!106320) b!1044494))

(assert (= (and b!1044493 (not c!106320)) b!1044492))

(assert (= (and b!1044494 res!695530) b!1044495))

(assert (= (or b!1044495 b!1044492) bm!44277))

(declare-fun m!964075 () Bool)

(assert (=> b!1044493 m!964075))

(assert (=> b!1044493 m!964075))

(declare-fun m!964077 () Bool)

(assert (=> b!1044493 m!964077))

(assert (=> b!1044494 m!964075))

(declare-fun m!964079 () Bool)

(assert (=> b!1044494 m!964079))

(declare-fun m!964081 () Bool)

(assert (=> b!1044494 m!964081))

(assert (=> b!1044494 m!964075))

(declare-fun m!964083 () Bool)

(assert (=> b!1044494 m!964083))

(declare-fun m!964085 () Bool)

(assert (=> bm!44277 m!964085))

(assert (=> b!1044397 d!126683))

(declare-fun b!1044508 () Bool)

(declare-fun e!591855 () SeekEntryResult!9780)

(assert (=> b!1044508 (= e!591855 Undefined!9780)))

(declare-fun d!126685 () Bool)

(declare-fun lt!460325 () SeekEntryResult!9780)

(assert (=> d!126685 (and (or ((_ is MissingVacant!9780) lt!460325) (not ((_ is Found!9780) lt!460325)) (and (bvsge (index!41492 lt!460325) #b00000000000000000000000000000000) (bvslt (index!41492 lt!460325) (size!32187 (_keys!11669 thiss!1427))))) (not ((_ is MissingVacant!9780) lt!460325)) (or (not ((_ is Found!9780) lt!460325)) (= (select (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460325)) key!909)))))

(assert (=> d!126685 (= lt!460325 e!591855)))

(declare-fun c!106328 () Bool)

(declare-fun lt!460324 () SeekEntryResult!9780)

(assert (=> d!126685 (= c!106328 (and ((_ is Intermediate!9780) lt!460324) (undefined!10592 lt!460324)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65807 (_ BitVec 32)) SeekEntryResult!9780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126685 (= lt!460324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30516 thiss!1427)) key!909 (_keys!11669 thiss!1427) (mask!30516 thiss!1427)))))

(assert (=> d!126685 (validMask!0 (mask!30516 thiss!1427))))

(assert (=> d!126685 (= (seekEntry!0 key!909 (_keys!11669 thiss!1427) (mask!30516 thiss!1427)) lt!460325)))

(declare-fun b!1044509 () Bool)

(declare-fun e!591853 () SeekEntryResult!9780)

(declare-fun lt!460323 () SeekEntryResult!9780)

(assert (=> b!1044509 (= e!591853 (ite ((_ is MissingVacant!9780) lt!460323) (MissingZero!9780 (index!41494 lt!460323)) lt!460323))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65807 (_ BitVec 32)) SeekEntryResult!9780)

(assert (=> b!1044509 (= lt!460323 (seekKeyOrZeroReturnVacant!0 (x!93102 lt!460324) (index!41493 lt!460324) (index!41493 lt!460324) key!909 (_keys!11669 thiss!1427) (mask!30516 thiss!1427)))))

(declare-fun b!1044510 () Bool)

(declare-fun c!106327 () Bool)

(declare-fun lt!460322 () (_ BitVec 64))

(assert (=> b!1044510 (= c!106327 (= lt!460322 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591854 () SeekEntryResult!9780)

(assert (=> b!1044510 (= e!591854 e!591853)))

(declare-fun b!1044511 () Bool)

(assert (=> b!1044511 (= e!591855 e!591854)))

(assert (=> b!1044511 (= lt!460322 (select (arr!31651 (_keys!11669 thiss!1427)) (index!41493 lt!460324)))))

(declare-fun c!106329 () Bool)

(assert (=> b!1044511 (= c!106329 (= lt!460322 key!909))))

(declare-fun b!1044512 () Bool)

(assert (=> b!1044512 (= e!591853 (MissingZero!9780 (index!41493 lt!460324)))))

(declare-fun b!1044513 () Bool)

(assert (=> b!1044513 (= e!591854 (Found!9780 (index!41493 lt!460324)))))

(assert (= (and d!126685 c!106328) b!1044508))

(assert (= (and d!126685 (not c!106328)) b!1044511))

(assert (= (and b!1044511 c!106329) b!1044513))

(assert (= (and b!1044511 (not c!106329)) b!1044510))

(assert (= (and b!1044510 c!106327) b!1044512))

(assert (= (and b!1044510 (not c!106327)) b!1044509))

(declare-fun m!964087 () Bool)

(assert (=> d!126685 m!964087))

(declare-fun m!964089 () Bool)

(assert (=> d!126685 m!964089))

(assert (=> d!126685 m!964089))

(declare-fun m!964091 () Bool)

(assert (=> d!126685 m!964091))

(assert (=> d!126685 m!963989))

(declare-fun m!964093 () Bool)

(assert (=> b!1044509 m!964093))

(declare-fun m!964095 () Bool)

(assert (=> b!1044511 m!964095))

(assert (=> b!1044396 d!126685))

(declare-fun d!126687 () Bool)

(assert (=> d!126687 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044404 d!126687))

(declare-fun b!1044524 () Bool)

(declare-fun e!591864 () Bool)

(declare-fun contains!6087 (List!21974 (_ BitVec 64)) Bool)

(assert (=> b!1044524 (= e!591864 (contains!6087 Nil!21971 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126689 () Bool)

(declare-fun res!695537 () Bool)

(declare-fun e!591866 () Bool)

(assert (=> d!126689 (=> res!695537 e!591866)))

(assert (=> d!126689 (= res!695537 (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))))))

(assert (=> d!126689 (= (arrayNoDuplicates!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 Nil!21971) e!591866)))

(declare-fun b!1044525 () Bool)

(declare-fun e!591865 () Bool)

(declare-fun call!44283 () Bool)

(assert (=> b!1044525 (= e!591865 call!44283)))

(declare-fun b!1044526 () Bool)

(assert (=> b!1044526 (= e!591865 call!44283)))

(declare-fun b!1044527 () Bool)

(declare-fun e!591867 () Bool)

(assert (=> b!1044527 (= e!591867 e!591865)))

(declare-fun c!106332 () Bool)

(assert (=> b!1044527 (= c!106332 (validKeyInArray!0 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44280 () Bool)

(assert (=> bm!44280 (= call!44283 (arrayNoDuplicates!0 (_keys!11669 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106332 (Cons!21970 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000) Nil!21971) Nil!21971)))))

(declare-fun b!1044528 () Bool)

(assert (=> b!1044528 (= e!591866 e!591867)))

(declare-fun res!695539 () Bool)

(assert (=> b!1044528 (=> (not res!695539) (not e!591867))))

(assert (=> b!1044528 (= res!695539 (not e!591864))))

(declare-fun res!695538 () Bool)

(assert (=> b!1044528 (=> (not res!695538) (not e!591864))))

(assert (=> b!1044528 (= res!695538 (validKeyInArray!0 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126689 (not res!695537)) b!1044528))

(assert (= (and b!1044528 res!695538) b!1044524))

(assert (= (and b!1044528 res!695539) b!1044527))

(assert (= (and b!1044527 c!106332) b!1044525))

(assert (= (and b!1044527 (not c!106332)) b!1044526))

(assert (= (or b!1044525 b!1044526) bm!44280))

(assert (=> b!1044524 m!964075))

(assert (=> b!1044524 m!964075))

(declare-fun m!964097 () Bool)

(assert (=> b!1044524 m!964097))

(assert (=> b!1044527 m!964075))

(assert (=> b!1044527 m!964075))

(assert (=> b!1044527 m!964077))

(assert (=> bm!44280 m!964075))

(declare-fun m!964099 () Bool)

(assert (=> bm!44280 m!964099))

(assert (=> b!1044528 m!964075))

(assert (=> b!1044528 m!964075))

(assert (=> b!1044528 m!964077))

(assert (=> b!1044401 d!126689))

(declare-fun d!126691 () Bool)

(assert (=> d!126691 (= (array_inv!24467 (_keys!11669 thiss!1427)) (bvsge (size!32187 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044400 d!126691))

(declare-fun d!126693 () Bool)

(assert (=> d!126693 (= (array_inv!24468 (_values!6398 thiss!1427)) (bvsge (size!32188 (_values!6398 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044400 d!126693))

(declare-fun d!126695 () Bool)

(declare-fun res!695546 () Bool)

(declare-fun e!591870 () Bool)

(assert (=> d!126695 (=> (not res!695546) (not e!591870))))

(declare-fun simpleValid!445 (LongMapFixedSize!5986) Bool)

(assert (=> d!126695 (= res!695546 (simpleValid!445 thiss!1427))))

(assert (=> d!126695 (= (valid!2254 thiss!1427) e!591870)))

(declare-fun b!1044535 () Bool)

(declare-fun res!695547 () Bool)

(assert (=> b!1044535 (=> (not res!695547) (not e!591870))))

(assert (=> b!1044535 (= res!695547 (= (arrayCountValidKeys!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) (_size!3048 thiss!1427)))))

(declare-fun b!1044536 () Bool)

(declare-fun res!695548 () Bool)

(assert (=> b!1044536 (=> (not res!695548) (not e!591870))))

(assert (=> b!1044536 (= res!695548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11669 thiss!1427) (mask!30516 thiss!1427)))))

(declare-fun b!1044537 () Bool)

(assert (=> b!1044537 (= e!591870 (arrayNoDuplicates!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 Nil!21971))))

(assert (= (and d!126695 res!695546) b!1044535))

(assert (= (and b!1044535 res!695547) b!1044536))

(assert (= (and b!1044536 res!695548) b!1044537))

(declare-fun m!964101 () Bool)

(assert (=> d!126695 m!964101))

(assert (=> b!1044535 m!963993))

(assert (=> b!1044536 m!963957))

(assert (=> b!1044537 m!963967))

(assert (=> start!91848 d!126695))

(declare-fun d!126697 () Bool)

(declare-fun e!591875 () Bool)

(assert (=> d!126697 e!591875))

(declare-fun res!695558 () Bool)

(assert (=> d!126697 (=> (not res!695558) (not e!591875))))

(assert (=> d!126697 (= res!695558 (and (bvsge (index!41492 lt!460263) #b00000000000000000000000000000000) (bvslt (index!41492 lt!460263) (size!32187 (_keys!11669 thiss!1427)))))))

(declare-fun lt!460328 () Unit!34071)

(declare-fun choose!82 (array!65807 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> d!126697 (= lt!460328 (choose!82 (_keys!11669 thiss!1427) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591876 () Bool)

(assert (=> d!126697 e!591876))

(declare-fun res!695559 () Bool)

(assert (=> d!126697 (=> (not res!695559) (not e!591876))))

(assert (=> d!126697 (= res!695559 (and (bvsge (index!41492 lt!460263) #b00000000000000000000000000000000) (bvslt (index!41492 lt!460263) (size!32187 (_keys!11669 thiss!1427)))))))

(assert (=> d!126697 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11669 thiss!1427) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460328)))

(declare-fun b!1044548 () Bool)

(assert (=> b!1044548 (= e!591876 (bvslt (size!32187 (_keys!11669 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044546 () Bool)

(declare-fun res!695557 () Bool)

(assert (=> b!1044546 (=> (not res!695557) (not e!591876))))

(assert (=> b!1044546 (= res!695557 (validKeyInArray!0 (select (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263))))))

(declare-fun b!1044547 () Bool)

(declare-fun res!695560 () Bool)

(assert (=> b!1044547 (=> (not res!695560) (not e!591876))))

(assert (=> b!1044547 (= res!695560 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044549 () Bool)

(assert (=> b!1044549 (= e!591875 (= (arrayCountValidKeys!0 (array!65808 (store (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11669 thiss!1427))) #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126697 res!695559) b!1044546))

(assert (= (and b!1044546 res!695557) b!1044547))

(assert (= (and b!1044547 res!695560) b!1044548))

(assert (= (and d!126697 res!695558) b!1044549))

(declare-fun m!964103 () Bool)

(assert (=> d!126697 m!964103))

(assert (=> b!1044546 m!963955))

(assert (=> b!1044546 m!963955))

(declare-fun m!964105 () Bool)

(assert (=> b!1044546 m!964105))

(declare-fun m!964107 () Bool)

(assert (=> b!1044547 m!964107))

(assert (=> b!1044549 m!963983))

(declare-fun m!964109 () Bool)

(assert (=> b!1044549 m!964109))

(assert (=> b!1044549 m!963993))

(assert (=> b!1044403 d!126697))

(declare-fun b!1044550 () Bool)

(declare-fun e!591878 () Bool)

(declare-fun call!44284 () Bool)

(assert (=> b!1044550 (= e!591878 call!44284)))

(declare-fun b!1044551 () Bool)

(declare-fun e!591879 () Bool)

(assert (=> b!1044551 (= e!591879 e!591878)))

(declare-fun c!106333 () Bool)

(assert (=> b!1044551 (= c!106333 (validKeyInArray!0 (select (arr!31651 lt!460268) #b00000000000000000000000000000000)))))

(declare-fun b!1044552 () Bool)

(declare-fun e!591877 () Bool)

(assert (=> b!1044552 (= e!591878 e!591877)))

(declare-fun lt!460330 () (_ BitVec 64))

(assert (=> b!1044552 (= lt!460330 (select (arr!31651 lt!460268) #b00000000000000000000000000000000))))

(declare-fun lt!460329 () Unit!34071)

(assert (=> b!1044552 (= lt!460329 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460268 lt!460330 #b00000000000000000000000000000000))))

(assert (=> b!1044552 (arrayContainsKey!0 lt!460268 lt!460330 #b00000000000000000000000000000000)))

(declare-fun lt!460331 () Unit!34071)

(assert (=> b!1044552 (= lt!460331 lt!460329)))

(declare-fun res!695562 () Bool)

(assert (=> b!1044552 (= res!695562 (= (seekEntryOrOpen!0 (select (arr!31651 lt!460268) #b00000000000000000000000000000000) lt!460268 (mask!30516 thiss!1427)) (Found!9780 #b00000000000000000000000000000000)))))

(assert (=> b!1044552 (=> (not res!695562) (not e!591877))))

(declare-fun b!1044553 () Bool)

(assert (=> b!1044553 (= e!591877 call!44284)))

(declare-fun d!126699 () Bool)

(declare-fun res!695561 () Bool)

(assert (=> d!126699 (=> res!695561 e!591879)))

(assert (=> d!126699 (= res!695561 (bvsge #b00000000000000000000000000000000 (size!32187 lt!460268)))))

(assert (=> d!126699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460268 (mask!30516 thiss!1427)) e!591879)))

(declare-fun bm!44281 () Bool)

(assert (=> bm!44281 (= call!44284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460268 (mask!30516 thiss!1427)))))

(assert (= (and d!126699 (not res!695561)) b!1044551))

(assert (= (and b!1044551 c!106333) b!1044552))

(assert (= (and b!1044551 (not c!106333)) b!1044550))

(assert (= (and b!1044552 res!695562) b!1044553))

(assert (= (or b!1044553 b!1044550) bm!44281))

(declare-fun m!964111 () Bool)

(assert (=> b!1044551 m!964111))

(assert (=> b!1044551 m!964111))

(declare-fun m!964113 () Bool)

(assert (=> b!1044551 m!964113))

(assert (=> b!1044552 m!964111))

(declare-fun m!964115 () Bool)

(assert (=> b!1044552 m!964115))

(declare-fun m!964117 () Bool)

(assert (=> b!1044552 m!964117))

(assert (=> b!1044552 m!964111))

(declare-fun m!964119 () Bool)

(assert (=> b!1044552 m!964119))

(declare-fun m!964121 () Bool)

(assert (=> bm!44281 m!964121))

(assert (=> b!1044403 d!126699))

(declare-fun b!1044554 () Bool)

(declare-fun e!591880 () Bool)

(assert (=> b!1044554 (= e!591880 (contains!6087 Nil!21971 (select (arr!31651 lt!460268) #b00000000000000000000000000000000)))))

(declare-fun d!126701 () Bool)

(declare-fun res!695563 () Bool)

(declare-fun e!591882 () Bool)

(assert (=> d!126701 (=> res!695563 e!591882)))

(assert (=> d!126701 (= res!695563 (bvsge #b00000000000000000000000000000000 (size!32187 lt!460268)))))

(assert (=> d!126701 (= (arrayNoDuplicates!0 lt!460268 #b00000000000000000000000000000000 Nil!21971) e!591882)))

(declare-fun b!1044555 () Bool)

(declare-fun e!591881 () Bool)

(declare-fun call!44285 () Bool)

(assert (=> b!1044555 (= e!591881 call!44285)))

(declare-fun b!1044556 () Bool)

(assert (=> b!1044556 (= e!591881 call!44285)))

(declare-fun b!1044557 () Bool)

(declare-fun e!591883 () Bool)

(assert (=> b!1044557 (= e!591883 e!591881)))

(declare-fun c!106334 () Bool)

(assert (=> b!1044557 (= c!106334 (validKeyInArray!0 (select (arr!31651 lt!460268) #b00000000000000000000000000000000)))))

(declare-fun bm!44282 () Bool)

(assert (=> bm!44282 (= call!44285 (arrayNoDuplicates!0 lt!460268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106334 (Cons!21970 (select (arr!31651 lt!460268) #b00000000000000000000000000000000) Nil!21971) Nil!21971)))))

(declare-fun b!1044558 () Bool)

(assert (=> b!1044558 (= e!591882 e!591883)))

(declare-fun res!695565 () Bool)

(assert (=> b!1044558 (=> (not res!695565) (not e!591883))))

(assert (=> b!1044558 (= res!695565 (not e!591880))))

(declare-fun res!695564 () Bool)

(assert (=> b!1044558 (=> (not res!695564) (not e!591880))))

(assert (=> b!1044558 (= res!695564 (validKeyInArray!0 (select (arr!31651 lt!460268) #b00000000000000000000000000000000)))))

(assert (= (and d!126701 (not res!695563)) b!1044558))

(assert (= (and b!1044558 res!695564) b!1044554))

(assert (= (and b!1044558 res!695565) b!1044557))

(assert (= (and b!1044557 c!106334) b!1044555))

(assert (= (and b!1044557 (not c!106334)) b!1044556))

(assert (= (or b!1044555 b!1044556) bm!44282))

(assert (=> b!1044554 m!964111))

(assert (=> b!1044554 m!964111))

(declare-fun m!964123 () Bool)

(assert (=> b!1044554 m!964123))

(assert (=> b!1044557 m!964111))

(assert (=> b!1044557 m!964111))

(assert (=> b!1044557 m!964113))

(assert (=> bm!44282 m!964111))

(declare-fun m!964125 () Bool)

(assert (=> bm!44282 m!964125))

(assert (=> b!1044558 m!964111))

(assert (=> b!1044558 m!964111))

(assert (=> b!1044558 m!964113))

(assert (=> b!1044403 d!126701))

(declare-fun d!126703 () Bool)

(assert (=> d!126703 (= (validMask!0 (mask!30516 thiss!1427)) (and (or (= (mask!30516 thiss!1427) #b00000000000000000000000000000111) (= (mask!30516 thiss!1427) #b00000000000000000000000000001111) (= (mask!30516 thiss!1427) #b00000000000000000000000000011111) (= (mask!30516 thiss!1427) #b00000000000000000000000000111111) (= (mask!30516 thiss!1427) #b00000000000000000000000001111111) (= (mask!30516 thiss!1427) #b00000000000000000000000011111111) (= (mask!30516 thiss!1427) #b00000000000000000000000111111111) (= (mask!30516 thiss!1427) #b00000000000000000000001111111111) (= (mask!30516 thiss!1427) #b00000000000000000000011111111111) (= (mask!30516 thiss!1427) #b00000000000000000000111111111111) (= (mask!30516 thiss!1427) #b00000000000000000001111111111111) (= (mask!30516 thiss!1427) #b00000000000000000011111111111111) (= (mask!30516 thiss!1427) #b00000000000000000111111111111111) (= (mask!30516 thiss!1427) #b00000000000000001111111111111111) (= (mask!30516 thiss!1427) #b00000000000000011111111111111111) (= (mask!30516 thiss!1427) #b00000000000000111111111111111111) (= (mask!30516 thiss!1427) #b00000000000001111111111111111111) (= (mask!30516 thiss!1427) #b00000000000011111111111111111111) (= (mask!30516 thiss!1427) #b00000000000111111111111111111111) (= (mask!30516 thiss!1427) #b00000000001111111111111111111111) (= (mask!30516 thiss!1427) #b00000000011111111111111111111111) (= (mask!30516 thiss!1427) #b00000000111111111111111111111111) (= (mask!30516 thiss!1427) #b00000001111111111111111111111111) (= (mask!30516 thiss!1427) #b00000011111111111111111111111111) (= (mask!30516 thiss!1427) #b00000111111111111111111111111111) (= (mask!30516 thiss!1427) #b00001111111111111111111111111111) (= (mask!30516 thiss!1427) #b00011111111111111111111111111111) (= (mask!30516 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30516 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1044403 d!126703))

(declare-fun d!126705 () Bool)

(declare-fun e!591886 () Bool)

(assert (=> d!126705 e!591886))

(declare-fun res!695568 () Bool)

(assert (=> d!126705 (=> (not res!695568) (not e!591886))))

(assert (=> d!126705 (= res!695568 (and (bvsge (index!41492 lt!460263) #b00000000000000000000000000000000) (bvslt (index!41492 lt!460263) (size!32187 (_keys!11669 thiss!1427)))))))

(declare-fun lt!460334 () Unit!34071)

(declare-fun choose!53 (array!65807 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21974) Unit!34071)

(assert (=> d!126705 (= lt!460334 (choose!53 (_keys!11669 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41492 lt!460263) #b00000000000000000000000000000000 Nil!21971))))

(assert (=> d!126705 (bvslt (size!32187 (_keys!11669 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126705 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11669 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41492 lt!460263) #b00000000000000000000000000000000 Nil!21971) lt!460334)))

(declare-fun b!1044561 () Bool)

(assert (=> b!1044561 (= e!591886 (arrayNoDuplicates!0 (array!65808 (store (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11669 thiss!1427))) #b00000000000000000000000000000000 Nil!21971))))

(assert (= (and d!126705 res!695568) b!1044561))

(declare-fun m!964127 () Bool)

(assert (=> d!126705 m!964127))

(assert (=> b!1044561 m!963983))

(declare-fun m!964129 () Bool)

(assert (=> b!1044561 m!964129))

(assert (=> b!1044403 d!126705))

(declare-fun d!126707 () Bool)

(declare-fun res!695573 () Bool)

(declare-fun e!591891 () Bool)

(assert (=> d!126707 (=> res!695573 e!591891)))

(assert (=> d!126707 (= res!695573 (= (select (arr!31651 lt!460268) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126707 (= (arrayContainsKey!0 lt!460268 key!909 #b00000000000000000000000000000000) e!591891)))

(declare-fun b!1044566 () Bool)

(declare-fun e!591892 () Bool)

(assert (=> b!1044566 (= e!591891 e!591892)))

(declare-fun res!695574 () Bool)

(assert (=> b!1044566 (=> (not res!695574) (not e!591892))))

(assert (=> b!1044566 (= res!695574 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32187 lt!460268)))))

(declare-fun b!1044567 () Bool)

(assert (=> b!1044567 (= e!591892 (arrayContainsKey!0 lt!460268 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126707 (not res!695573)) b!1044566))

(assert (= (and b!1044566 res!695574) b!1044567))

(assert (=> d!126707 m!964111))

(declare-fun m!964131 () Bool)

(assert (=> b!1044567 m!964131))

(assert (=> b!1044403 d!126707))

(declare-fun bm!44285 () Bool)

(declare-fun call!44288 () (_ BitVec 32))

(assert (=> bm!44285 (= call!44288 (arrayCountValidKeys!0 lt!460268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32187 (_keys!11669 thiss!1427))))))

(declare-fun d!126709 () Bool)

(declare-fun lt!460337 () (_ BitVec 32))

(assert (=> d!126709 (and (bvsge lt!460337 #b00000000000000000000000000000000) (bvsle lt!460337 (bvsub (size!32187 lt!460268) #b00000000000000000000000000000000)))))

(declare-fun e!591898 () (_ BitVec 32))

(assert (=> d!126709 (= lt!460337 e!591898)))

(declare-fun c!106340 () Bool)

(assert (=> d!126709 (= c!106340 (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))))))

(assert (=> d!126709 (and (bvsle #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32187 (_keys!11669 thiss!1427)) (size!32187 lt!460268)))))

(assert (=> d!126709 (= (arrayCountValidKeys!0 lt!460268 #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) lt!460337)))

(declare-fun b!1044576 () Bool)

(declare-fun e!591897 () (_ BitVec 32))

(assert (=> b!1044576 (= e!591897 call!44288)))

(declare-fun b!1044577 () Bool)

(assert (=> b!1044577 (= e!591898 e!591897)))

(declare-fun c!106339 () Bool)

(assert (=> b!1044577 (= c!106339 (validKeyInArray!0 (select (arr!31651 lt!460268) #b00000000000000000000000000000000)))))

(declare-fun b!1044578 () Bool)

(assert (=> b!1044578 (= e!591897 (bvadd #b00000000000000000000000000000001 call!44288))))

(declare-fun b!1044579 () Bool)

(assert (=> b!1044579 (= e!591898 #b00000000000000000000000000000000)))

(assert (= (and d!126709 c!106340) b!1044579))

(assert (= (and d!126709 (not c!106340)) b!1044577))

(assert (= (and b!1044577 c!106339) b!1044578))

(assert (= (and b!1044577 (not c!106339)) b!1044576))

(assert (= (or b!1044578 b!1044576) bm!44285))

(declare-fun m!964133 () Bool)

(assert (=> bm!44285 m!964133))

(assert (=> b!1044577 m!964111))

(assert (=> b!1044577 m!964111))

(assert (=> b!1044577 m!964113))

(assert (=> b!1044403 d!126709))

(declare-fun bm!44286 () Bool)

(declare-fun call!44289 () (_ BitVec 32))

(assert (=> bm!44286 (= call!44289 (arrayCountValidKeys!0 (_keys!11669 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32187 (_keys!11669 thiss!1427))))))

(declare-fun d!126711 () Bool)

(declare-fun lt!460338 () (_ BitVec 32))

(assert (=> d!126711 (and (bvsge lt!460338 #b00000000000000000000000000000000) (bvsle lt!460338 (bvsub (size!32187 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!591900 () (_ BitVec 32))

(assert (=> d!126711 (= lt!460338 e!591900)))

(declare-fun c!106342 () Bool)

(assert (=> d!126711 (= c!106342 (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))))))

(assert (=> d!126711 (and (bvsle #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32187 (_keys!11669 thiss!1427)) (size!32187 (_keys!11669 thiss!1427))))))

(assert (=> d!126711 (= (arrayCountValidKeys!0 (_keys!11669 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11669 thiss!1427))) lt!460338)))

(declare-fun b!1044580 () Bool)

(declare-fun e!591899 () (_ BitVec 32))

(assert (=> b!1044580 (= e!591899 call!44289)))

(declare-fun b!1044581 () Bool)

(assert (=> b!1044581 (= e!591900 e!591899)))

(declare-fun c!106341 () Bool)

(assert (=> b!1044581 (= c!106341 (validKeyInArray!0 (select (arr!31651 (_keys!11669 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044582 () Bool)

(assert (=> b!1044582 (= e!591899 (bvadd #b00000000000000000000000000000001 call!44289))))

(declare-fun b!1044583 () Bool)

(assert (=> b!1044583 (= e!591900 #b00000000000000000000000000000000)))

(assert (= (and d!126711 c!106342) b!1044583))

(assert (= (and d!126711 (not c!106342)) b!1044581))

(assert (= (and b!1044581 c!106341) b!1044582))

(assert (= (and b!1044581 (not c!106341)) b!1044580))

(assert (= (or b!1044582 b!1044580) bm!44286))

(declare-fun m!964135 () Bool)

(assert (=> bm!44286 m!964135))

(assert (=> b!1044581 m!964075))

(assert (=> b!1044581 m!964075))

(assert (=> b!1044581 m!964077))

(assert (=> b!1044403 d!126711))

(declare-fun d!126713 () Bool)

(declare-fun e!591903 () Bool)

(assert (=> d!126713 e!591903))

(declare-fun res!695577 () Bool)

(assert (=> d!126713 (=> (not res!695577) (not e!591903))))

(assert (=> d!126713 (= res!695577 (bvslt (index!41492 lt!460263) (size!32187 (_keys!11669 thiss!1427))))))

(declare-fun lt!460341 () Unit!34071)

(declare-fun choose!121 (array!65807 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> d!126713 (= lt!460341 (choose!121 (_keys!11669 thiss!1427) (index!41492 lt!460263) key!909))))

(assert (=> d!126713 (bvsge (index!41492 lt!460263) #b00000000000000000000000000000000)))

(assert (=> d!126713 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11669 thiss!1427) (index!41492 lt!460263) key!909) lt!460341)))

(declare-fun b!1044586 () Bool)

(assert (=> b!1044586 (= e!591903 (not (arrayContainsKey!0 (array!65808 (store (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11669 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126713 res!695577) b!1044586))

(declare-fun m!964137 () Bool)

(assert (=> d!126713 m!964137))

(assert (=> b!1044586 m!963983))

(declare-fun m!964139 () Bool)

(assert (=> b!1044586 m!964139))

(assert (=> b!1044403 d!126713))

(declare-fun d!126715 () Bool)

(declare-fun e!591906 () Bool)

(assert (=> d!126715 e!591906))

(declare-fun res!695580 () Bool)

(assert (=> d!126715 (=> (not res!695580) (not e!591906))))

(assert (=> d!126715 (= res!695580 (and (bvsge (index!41492 lt!460263) #b00000000000000000000000000000000) (bvslt (index!41492 lt!460263) (size!32187 (_keys!11669 thiss!1427)))))))

(declare-fun lt!460344 () Unit!34071)

(declare-fun choose!25 (array!65807 (_ BitVec 32) (_ BitVec 32)) Unit!34071)

(assert (=> d!126715 (= lt!460344 (choose!25 (_keys!11669 thiss!1427) (index!41492 lt!460263) (mask!30516 thiss!1427)))))

(assert (=> d!126715 (validMask!0 (mask!30516 thiss!1427))))

(assert (=> d!126715 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11669 thiss!1427) (index!41492 lt!460263) (mask!30516 thiss!1427)) lt!460344)))

(declare-fun b!1044589 () Bool)

(assert (=> b!1044589 (= e!591906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65808 (store (arr!31651 (_keys!11669 thiss!1427)) (index!41492 lt!460263) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11669 thiss!1427))) (mask!30516 thiss!1427)))))

(assert (= (and d!126715 res!695580) b!1044589))

(declare-fun m!964141 () Bool)

(assert (=> d!126715 m!964141))

(assert (=> d!126715 m!963989))

(assert (=> b!1044589 m!963983))

(declare-fun m!964143 () Bool)

(assert (=> b!1044589 m!964143))

(assert (=> b!1044403 d!126715))

(declare-fun b!1044596 () Bool)

(declare-fun e!591911 () Bool)

(assert (=> b!1044596 (= e!591911 tp_is_empty!24799)))

(declare-fun mapNonEmpty!38825 () Bool)

(declare-fun mapRes!38825 () Bool)

(declare-fun tp!74487 () Bool)

(assert (=> mapNonEmpty!38825 (= mapRes!38825 (and tp!74487 e!591911))))

(declare-fun mapValue!38825 () ValueCell!11696)

(declare-fun mapRest!38825 () (Array (_ BitVec 32) ValueCell!11696))

(declare-fun mapKey!38825 () (_ BitVec 32))

(assert (=> mapNonEmpty!38825 (= mapRest!38816 (store mapRest!38825 mapKey!38825 mapValue!38825))))

(declare-fun condMapEmpty!38825 () Bool)

(declare-fun mapDefault!38825 () ValueCell!11696)

(assert (=> mapNonEmpty!38816 (= condMapEmpty!38825 (= mapRest!38816 ((as const (Array (_ BitVec 32) ValueCell!11696)) mapDefault!38825)))))

(declare-fun e!591912 () Bool)

(assert (=> mapNonEmpty!38816 (= tp!74472 (and e!591912 mapRes!38825))))

(declare-fun b!1044597 () Bool)

(assert (=> b!1044597 (= e!591912 tp_is_empty!24799)))

(declare-fun mapIsEmpty!38825 () Bool)

(assert (=> mapIsEmpty!38825 mapRes!38825))

(assert (= (and mapNonEmpty!38816 condMapEmpty!38825) mapIsEmpty!38825))

(assert (= (and mapNonEmpty!38816 (not condMapEmpty!38825)) mapNonEmpty!38825))

(assert (= (and mapNonEmpty!38825 ((_ is ValueCellFull!11696) mapValue!38825)) b!1044596))

(assert (= (and mapNonEmpty!38816 ((_ is ValueCellFull!11696) mapDefault!38825)) b!1044597))

(declare-fun m!964145 () Bool)

(assert (=> mapNonEmpty!38825 m!964145))

(check-sat (not b!1044561) (not b!1044586) (not b!1044493) (not b!1044551) (not b!1044567) (not d!126713) (not b!1044535) (not d!126715) (not b!1044528) (not b!1044581) (not b!1044577) (not bm!44281) tp_is_empty!24799 (not d!126705) (not d!126685) (not b!1044536) (not b!1044524) (not bm!44285) (not b_next!21079) (not b!1044494) (not b!1044554) (not bm!44277) (not b!1044589) (not bm!44282) (not d!126697) (not b!1044547) (not b!1044527) (not b!1044546) (not b!1044557) (not b!1044549) b_and!33621 (not b!1044552) (not b!1044537) (not d!126695) (not b!1044509) (not b!1044558) (not bm!44280) (not bm!44286) (not mapNonEmpty!38825))
(check-sat b_and!33621 (not b_next!21079))
