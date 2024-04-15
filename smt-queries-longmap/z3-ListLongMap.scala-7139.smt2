; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90696 () Bool)

(assert start!90696)

(declare-fun b!1037036 () Bool)

(declare-fun b_free!20887 () Bool)

(declare-fun b_next!20887 () Bool)

(assert (=> b!1037036 (= b_free!20887 (not b_next!20887))))

(declare-fun tp!73803 () Bool)

(declare-fun b_and!33393 () Bool)

(assert (=> b!1037036 (= tp!73803 b_and!33393)))

(declare-fun b!1037035 () Bool)

(declare-fun e!586560 () Bool)

(declare-fun e!586557 () Bool)

(declare-fun mapRes!38436 () Bool)

(assert (=> b!1037035 (= e!586560 (and e!586557 mapRes!38436))))

(declare-fun condMapEmpty!38436 () Bool)

(declare-datatypes ((V!37683 0))(
  ( (V!37684 (val!12354 Int)) )
))
(declare-datatypes ((ValueCell!11600 0))(
  ( (ValueCellFull!11600 (v!14936 V!37683)) (EmptyCell!11600) )
))
(declare-datatypes ((array!65255 0))(
  ( (array!65256 (arr!31410 (Array (_ BitVec 32) (_ BitVec 64))) (size!31942 (_ BitVec 32))) )
))
(declare-datatypes ((array!65257 0))(
  ( (array!65258 (arr!31411 (Array (_ BitVec 32) ValueCell!11600)) (size!31943 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5794 0))(
  ( (LongMapFixedSize!5795 (defaultEntry!6279 Int) (mask!30188 (_ BitVec 32)) (extraKeys!6007 (_ BitVec 32)) (zeroValue!6113 V!37683) (minValue!6113 V!37683) (_size!2952 (_ BitVec 32)) (_keys!11470 array!65255) (_values!6302 array!65257) (_vacant!2952 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5794)

(declare-fun mapDefault!38436 () ValueCell!11600)

(assert (=> b!1037035 (= condMapEmpty!38436 (= (arr!31411 (_values!6302 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11600)) mapDefault!38436)))))

(declare-fun e!586561 () Bool)

(declare-fun tp_is_empty!24607 () Bool)

(declare-fun array_inv!24291 (array!65255) Bool)

(declare-fun array_inv!24292 (array!65257) Bool)

(assert (=> b!1037036 (= e!586561 (and tp!73803 tp_is_empty!24607 (array_inv!24291 (_keys!11470 thiss!1427)) (array_inv!24292 (_values!6302 thiss!1427)) e!586560))))

(declare-fun b!1037037 () Bool)

(declare-fun e!586559 () Bool)

(declare-fun e!586556 () Bool)

(assert (=> b!1037037 (= e!586559 e!586556)))

(declare-fun res!692018 () Bool)

(assert (=> b!1037037 (=> (not res!692018) (not e!586556))))

(declare-datatypes ((SeekEntryResult!9741 0))(
  ( (MissingZero!9741 (index!41335 (_ BitVec 32))) (Found!9741 (index!41336 (_ BitVec 32))) (Intermediate!9741 (undefined!10553 Bool) (index!41337 (_ BitVec 32)) (x!92505 (_ BitVec 32))) (Undefined!9741) (MissingVacant!9741 (index!41338 (_ BitVec 32))) )
))
(declare-fun lt!457219 () SeekEntryResult!9741)

(get-info :version)

(assert (=> b!1037037 (= res!692018 ((_ is Found!9741) lt!457219))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65255 (_ BitVec 32)) SeekEntryResult!9741)

(assert (=> b!1037037 (= lt!457219 (seekEntry!0 key!909 (_keys!11470 thiss!1427) (mask!30188 thiss!1427)))))

(declare-fun res!692016 () Bool)

(assert (=> start!90696 (=> (not res!692016) (not e!586559))))

(declare-fun valid!2175 (LongMapFixedSize!5794) Bool)

(assert (=> start!90696 (= res!692016 (valid!2175 thiss!1427))))

(assert (=> start!90696 e!586559))

(assert (=> start!90696 e!586561))

(assert (=> start!90696 true))

(declare-fun b!1037038 () Bool)

(assert (=> b!1037038 (= e!586557 tp_is_empty!24607)))

(declare-fun b!1037039 () Bool)

(declare-fun res!692017 () Bool)

(assert (=> b!1037039 (=> (not res!692017) (not e!586559))))

(assert (=> b!1037039 (= res!692017 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037040 () Bool)

(declare-fun e!586558 () Bool)

(assert (=> b!1037040 (= e!586558 tp_is_empty!24607)))

(declare-fun mapNonEmpty!38436 () Bool)

(declare-fun tp!73804 () Bool)

(assert (=> mapNonEmpty!38436 (= mapRes!38436 (and tp!73804 e!586558))))

(declare-fun mapValue!38436 () ValueCell!11600)

(declare-fun mapKey!38436 () (_ BitVec 32))

(declare-fun mapRest!38436 () (Array (_ BitVec 32) ValueCell!11600))

(assert (=> mapNonEmpty!38436 (= (arr!31411 (_values!6302 thiss!1427)) (store mapRest!38436 mapKey!38436 mapValue!38436))))

(declare-fun b!1037041 () Bool)

(assert (=> b!1037041 (= e!586556 (not (bvslt (size!31942 (_keys!11470 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun arrayCountValidKeys!0 (array!65255 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037041 (= (arrayCountValidKeys!0 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427))) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11470 thiss!1427) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33823 0))(
  ( (Unit!33824) )
))
(declare-fun lt!457220 () Unit!33823)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65255 (_ BitVec 32) (_ BitVec 64)) Unit!33823)

(assert (=> b!1037041 (= lt!457220 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11470 thiss!1427) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38436 () Bool)

(assert (=> mapIsEmpty!38436 mapRes!38436))

(assert (= (and start!90696 res!692016) b!1037039))

(assert (= (and b!1037039 res!692017) b!1037037))

(assert (= (and b!1037037 res!692018) b!1037041))

(assert (= (and b!1037035 condMapEmpty!38436) mapIsEmpty!38436))

(assert (= (and b!1037035 (not condMapEmpty!38436)) mapNonEmpty!38436))

(assert (= (and mapNonEmpty!38436 ((_ is ValueCellFull!11600) mapValue!38436)) b!1037040))

(assert (= (and b!1037035 ((_ is ValueCellFull!11600) mapDefault!38436)) b!1037038))

(assert (= b!1037036 b!1037035))

(assert (= start!90696 b!1037036))

(declare-fun m!956833 () Bool)

(assert (=> b!1037036 m!956833))

(declare-fun m!956835 () Bool)

(assert (=> b!1037036 m!956835))

(declare-fun m!956837 () Bool)

(assert (=> b!1037037 m!956837))

(declare-fun m!956839 () Bool)

(assert (=> mapNonEmpty!38436 m!956839))

(declare-fun m!956841 () Bool)

(assert (=> start!90696 m!956841))

(declare-fun m!956843 () Bool)

(assert (=> b!1037041 m!956843))

(declare-fun m!956845 () Bool)

(assert (=> b!1037041 m!956845))

(declare-fun m!956847 () Bool)

(assert (=> b!1037041 m!956847))

(declare-fun m!956849 () Bool)

(assert (=> b!1037041 m!956849))

(check-sat (not start!90696) (not b!1037041) b_and!33393 (not b!1037037) tp_is_empty!24607 (not mapNonEmpty!38436) (not b_next!20887) (not b!1037036))
(check-sat b_and!33393 (not b_next!20887))
(get-model)

(declare-fun d!125057 () Bool)

(assert (=> d!125057 (= (array_inv!24291 (_keys!11470 thiss!1427)) (bvsge (size!31942 (_keys!11470 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037036 d!125057))

(declare-fun d!125059 () Bool)

(assert (=> d!125059 (= (array_inv!24292 (_values!6302 thiss!1427)) (bvsge (size!31943 (_values!6302 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037036 d!125059))

(declare-fun b!1037096 () Bool)

(declare-fun e!586612 () SeekEntryResult!9741)

(declare-fun lt!457242 () SeekEntryResult!9741)

(assert (=> b!1037096 (= e!586612 (ite ((_ is MissingVacant!9741) lt!457242) (MissingZero!9741 (index!41338 lt!457242)) lt!457242))))

(declare-fun lt!457241 () SeekEntryResult!9741)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65255 (_ BitVec 32)) SeekEntryResult!9741)

(assert (=> b!1037096 (= lt!457242 (seekKeyOrZeroReturnVacant!0 (x!92505 lt!457241) (index!41337 lt!457241) (index!41337 lt!457241) key!909 (_keys!11470 thiss!1427) (mask!30188 thiss!1427)))))

(declare-fun b!1037097 () Bool)

(declare-fun c!105059 () Bool)

(declare-fun lt!457244 () (_ BitVec 64))

(assert (=> b!1037097 (= c!105059 (= lt!457244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586610 () SeekEntryResult!9741)

(assert (=> b!1037097 (= e!586610 e!586612)))

(declare-fun b!1037098 () Bool)

(declare-fun e!586611 () SeekEntryResult!9741)

(assert (=> b!1037098 (= e!586611 e!586610)))

(assert (=> b!1037098 (= lt!457244 (select (arr!31410 (_keys!11470 thiss!1427)) (index!41337 lt!457241)))))

(declare-fun c!105060 () Bool)

(assert (=> b!1037098 (= c!105060 (= lt!457244 key!909))))

(declare-fun d!125061 () Bool)

(declare-fun lt!457243 () SeekEntryResult!9741)

(assert (=> d!125061 (and (or ((_ is MissingVacant!9741) lt!457243) (not ((_ is Found!9741) lt!457243)) (and (bvsge (index!41336 lt!457243) #b00000000000000000000000000000000) (bvslt (index!41336 lt!457243) (size!31942 (_keys!11470 thiss!1427))))) (not ((_ is MissingVacant!9741) lt!457243)) (or (not ((_ is Found!9741) lt!457243)) (= (select (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457243)) key!909)))))

(assert (=> d!125061 (= lt!457243 e!586611)))

(declare-fun c!105058 () Bool)

(assert (=> d!125061 (= c!105058 (and ((_ is Intermediate!9741) lt!457241) (undefined!10553 lt!457241)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65255 (_ BitVec 32)) SeekEntryResult!9741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125061 (= lt!457241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30188 thiss!1427)) key!909 (_keys!11470 thiss!1427) (mask!30188 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125061 (validMask!0 (mask!30188 thiss!1427))))

(assert (=> d!125061 (= (seekEntry!0 key!909 (_keys!11470 thiss!1427) (mask!30188 thiss!1427)) lt!457243)))

(declare-fun b!1037099 () Bool)

(assert (=> b!1037099 (= e!586610 (Found!9741 (index!41337 lt!457241)))))

(declare-fun b!1037100 () Bool)

(assert (=> b!1037100 (= e!586612 (MissingZero!9741 (index!41337 lt!457241)))))

(declare-fun b!1037101 () Bool)

(assert (=> b!1037101 (= e!586611 Undefined!9741)))

(assert (= (and d!125061 c!105058) b!1037101))

(assert (= (and d!125061 (not c!105058)) b!1037098))

(assert (= (and b!1037098 c!105060) b!1037099))

(assert (= (and b!1037098 (not c!105060)) b!1037097))

(assert (= (and b!1037097 c!105059) b!1037100))

(assert (= (and b!1037097 (not c!105059)) b!1037096))

(declare-fun m!956887 () Bool)

(assert (=> b!1037096 m!956887))

(declare-fun m!956889 () Bool)

(assert (=> b!1037098 m!956889))

(declare-fun m!956891 () Bool)

(assert (=> d!125061 m!956891))

(declare-fun m!956893 () Bool)

(assert (=> d!125061 m!956893))

(assert (=> d!125061 m!956893))

(declare-fun m!956895 () Bool)

(assert (=> d!125061 m!956895))

(declare-fun m!956897 () Bool)

(assert (=> d!125061 m!956897))

(assert (=> b!1037037 d!125061))

(declare-fun bm!43888 () Bool)

(declare-fun call!43891 () (_ BitVec 32))

(assert (=> bm!43888 (= call!43891 (arrayCountValidKeys!0 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31942 (_keys!11470 thiss!1427))))))

(declare-fun b!1037110 () Bool)

(declare-fun e!586617 () (_ BitVec 32))

(declare-fun e!586618 () (_ BitVec 32))

(assert (=> b!1037110 (= e!586617 e!586618)))

(declare-fun c!105066 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037110 (= c!105066 (validKeyInArray!0 (select (arr!31410 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125063 () Bool)

(declare-fun lt!457247 () (_ BitVec 32))

(assert (=> d!125063 (and (bvsge lt!457247 #b00000000000000000000000000000000) (bvsle lt!457247 (bvsub (size!31942 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125063 (= lt!457247 e!586617)))

(declare-fun c!105065 () Bool)

(assert (=> d!125063 (= c!105065 (bvsge #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))))))

(assert (=> d!125063 (and (bvsle #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31942 (_keys!11470 thiss!1427)) (size!31942 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427))))))))

(assert (=> d!125063 (= (arrayCountValidKeys!0 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427))) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) lt!457247)))

(declare-fun b!1037111 () Bool)

(assert (=> b!1037111 (= e!586618 (bvadd #b00000000000000000000000000000001 call!43891))))

(declare-fun b!1037112 () Bool)

(assert (=> b!1037112 (= e!586617 #b00000000000000000000000000000000)))

(declare-fun b!1037113 () Bool)

(assert (=> b!1037113 (= e!586618 call!43891)))

(assert (= (and d!125063 c!105065) b!1037112))

(assert (= (and d!125063 (not c!105065)) b!1037110))

(assert (= (and b!1037110 c!105066) b!1037111))

(assert (= (and b!1037110 (not c!105066)) b!1037113))

(assert (= (or b!1037111 b!1037113) bm!43888))

(declare-fun m!956899 () Bool)

(assert (=> bm!43888 m!956899))

(declare-fun m!956901 () Bool)

(assert (=> b!1037110 m!956901))

(assert (=> b!1037110 m!956901))

(declare-fun m!956903 () Bool)

(assert (=> b!1037110 m!956903))

(assert (=> b!1037041 d!125063))

(declare-fun bm!43889 () Bool)

(declare-fun call!43892 () (_ BitVec 32))

(assert (=> bm!43889 (= call!43892 (arrayCountValidKeys!0 (_keys!11470 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31942 (_keys!11470 thiss!1427))))))

(declare-fun b!1037114 () Bool)

(declare-fun e!586619 () (_ BitVec 32))

(declare-fun e!586620 () (_ BitVec 32))

(assert (=> b!1037114 (= e!586619 e!586620)))

(declare-fun c!105068 () Bool)

(assert (=> b!1037114 (= c!105068 (validKeyInArray!0 (select (arr!31410 (_keys!11470 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125065 () Bool)

(declare-fun lt!457248 () (_ BitVec 32))

(assert (=> d!125065 (and (bvsge lt!457248 #b00000000000000000000000000000000) (bvsle lt!457248 (bvsub (size!31942 (_keys!11470 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125065 (= lt!457248 e!586619)))

(declare-fun c!105067 () Bool)

(assert (=> d!125065 (= c!105067 (bvsge #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))))))

(assert (=> d!125065 (and (bvsle #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31942 (_keys!11470 thiss!1427)) (size!31942 (_keys!11470 thiss!1427))))))

(assert (=> d!125065 (= (arrayCountValidKeys!0 (_keys!11470 thiss!1427) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) lt!457248)))

(declare-fun b!1037115 () Bool)

(assert (=> b!1037115 (= e!586620 (bvadd #b00000000000000000000000000000001 call!43892))))

(declare-fun b!1037116 () Bool)

(assert (=> b!1037116 (= e!586619 #b00000000000000000000000000000000)))

(declare-fun b!1037117 () Bool)

(assert (=> b!1037117 (= e!586620 call!43892)))

(assert (= (and d!125065 c!105067) b!1037116))

(assert (= (and d!125065 (not c!105067)) b!1037114))

(assert (= (and b!1037114 c!105068) b!1037115))

(assert (= (and b!1037114 (not c!105068)) b!1037117))

(assert (= (or b!1037115 b!1037117) bm!43889))

(declare-fun m!956905 () Bool)

(assert (=> bm!43889 m!956905))

(declare-fun m!956907 () Bool)

(assert (=> b!1037114 m!956907))

(assert (=> b!1037114 m!956907))

(declare-fun m!956909 () Bool)

(assert (=> b!1037114 m!956909))

(assert (=> b!1037041 d!125065))

(declare-fun b!1037128 () Bool)

(declare-fun e!586625 () Bool)

(assert (=> b!1037128 (= e!586625 (bvslt (size!31942 (_keys!11470 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1037126 () Bool)

(declare-fun res!692046 () Bool)

(assert (=> b!1037126 (=> (not res!692046) (not e!586625))))

(assert (=> b!1037126 (= res!692046 (validKeyInArray!0 (select (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219))))))

(declare-fun d!125067 () Bool)

(declare-fun e!586626 () Bool)

(assert (=> d!125067 e!586626))

(declare-fun res!692045 () Bool)

(assert (=> d!125067 (=> (not res!692045) (not e!586626))))

(assert (=> d!125067 (= res!692045 (and (bvsge (index!41336 lt!457219) #b00000000000000000000000000000000) (bvslt (index!41336 lt!457219) (size!31942 (_keys!11470 thiss!1427)))))))

(declare-fun lt!457251 () Unit!33823)

(declare-fun choose!82 (array!65255 (_ BitVec 32) (_ BitVec 64)) Unit!33823)

(assert (=> d!125067 (= lt!457251 (choose!82 (_keys!11470 thiss!1427) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125067 e!586625))

(declare-fun res!692048 () Bool)

(assert (=> d!125067 (=> (not res!692048) (not e!586625))))

(assert (=> d!125067 (= res!692048 (and (bvsge (index!41336 lt!457219) #b00000000000000000000000000000000) (bvslt (index!41336 lt!457219) (size!31942 (_keys!11470 thiss!1427)))))))

(assert (=> d!125067 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11470 thiss!1427) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457251)))

(declare-fun b!1037129 () Bool)

(assert (=> b!1037129 (= e!586626 (= (arrayCountValidKeys!0 (array!65256 (store (arr!31410 (_keys!11470 thiss!1427)) (index!41336 lt!457219) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31942 (_keys!11470 thiss!1427))) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11470 thiss!1427) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037127 () Bool)

(declare-fun res!692047 () Bool)

(assert (=> b!1037127 (=> (not res!692047) (not e!586625))))

(assert (=> b!1037127 (= res!692047 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125067 res!692048) b!1037126))

(assert (= (and b!1037126 res!692046) b!1037127))

(assert (= (and b!1037127 res!692047) b!1037128))

(assert (= (and d!125067 res!692045) b!1037129))

(declare-fun m!956911 () Bool)

(assert (=> b!1037126 m!956911))

(assert (=> b!1037126 m!956911))

(declare-fun m!956913 () Bool)

(assert (=> b!1037126 m!956913))

(declare-fun m!956915 () Bool)

(assert (=> d!125067 m!956915))

(assert (=> b!1037129 m!956843))

(assert (=> b!1037129 m!956845))

(assert (=> b!1037129 m!956847))

(declare-fun m!956917 () Bool)

(assert (=> b!1037127 m!956917))

(assert (=> b!1037041 d!125067))

(declare-fun d!125069 () Bool)

(declare-fun res!692055 () Bool)

(declare-fun e!586629 () Bool)

(assert (=> d!125069 (=> (not res!692055) (not e!586629))))

(declare-fun simpleValid!416 (LongMapFixedSize!5794) Bool)

(assert (=> d!125069 (= res!692055 (simpleValid!416 thiss!1427))))

(assert (=> d!125069 (= (valid!2175 thiss!1427) e!586629)))

(declare-fun b!1037136 () Bool)

(declare-fun res!692056 () Bool)

(assert (=> b!1037136 (=> (not res!692056) (not e!586629))))

(assert (=> b!1037136 (= res!692056 (= (arrayCountValidKeys!0 (_keys!11470 thiss!1427) #b00000000000000000000000000000000 (size!31942 (_keys!11470 thiss!1427))) (_size!2952 thiss!1427)))))

(declare-fun b!1037137 () Bool)

(declare-fun res!692057 () Bool)

(assert (=> b!1037137 (=> (not res!692057) (not e!586629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65255 (_ BitVec 32)) Bool)

(assert (=> b!1037137 (= res!692057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11470 thiss!1427) (mask!30188 thiss!1427)))))

(declare-fun b!1037138 () Bool)

(declare-datatypes ((List!21955 0))(
  ( (Nil!21952) (Cons!21951 (h!23154 (_ BitVec 64)) (t!31160 List!21955)) )
))
(declare-fun arrayNoDuplicates!0 (array!65255 (_ BitVec 32) List!21955) Bool)

(assert (=> b!1037138 (= e!586629 (arrayNoDuplicates!0 (_keys!11470 thiss!1427) #b00000000000000000000000000000000 Nil!21952))))

(assert (= (and d!125069 res!692055) b!1037136))

(assert (= (and b!1037136 res!692056) b!1037137))

(assert (= (and b!1037137 res!692057) b!1037138))

(declare-fun m!956919 () Bool)

(assert (=> d!125069 m!956919))

(assert (=> b!1037136 m!956847))

(declare-fun m!956921 () Bool)

(assert (=> b!1037137 m!956921))

(declare-fun m!956923 () Bool)

(assert (=> b!1037138 m!956923))

(assert (=> start!90696 d!125069))

(declare-fun b!1037145 () Bool)

(declare-fun e!586635 () Bool)

(assert (=> b!1037145 (= e!586635 tp_is_empty!24607)))

(declare-fun mapIsEmpty!38445 () Bool)

(declare-fun mapRes!38445 () Bool)

(assert (=> mapIsEmpty!38445 mapRes!38445))

(declare-fun condMapEmpty!38445 () Bool)

(declare-fun mapDefault!38445 () ValueCell!11600)

(assert (=> mapNonEmpty!38436 (= condMapEmpty!38445 (= mapRest!38436 ((as const (Array (_ BitVec 32) ValueCell!11600)) mapDefault!38445)))))

(declare-fun e!586634 () Bool)

(assert (=> mapNonEmpty!38436 (= tp!73804 (and e!586634 mapRes!38445))))

(declare-fun b!1037146 () Bool)

(assert (=> b!1037146 (= e!586634 tp_is_empty!24607)))

(declare-fun mapNonEmpty!38445 () Bool)

(declare-fun tp!73819 () Bool)

(assert (=> mapNonEmpty!38445 (= mapRes!38445 (and tp!73819 e!586635))))

(declare-fun mapKey!38445 () (_ BitVec 32))

(declare-fun mapRest!38445 () (Array (_ BitVec 32) ValueCell!11600))

(declare-fun mapValue!38445 () ValueCell!11600)

(assert (=> mapNonEmpty!38445 (= mapRest!38436 (store mapRest!38445 mapKey!38445 mapValue!38445))))

(assert (= (and mapNonEmpty!38436 condMapEmpty!38445) mapIsEmpty!38445))

(assert (= (and mapNonEmpty!38436 (not condMapEmpty!38445)) mapNonEmpty!38445))

(assert (= (and mapNonEmpty!38445 ((_ is ValueCellFull!11600) mapValue!38445)) b!1037145))

(assert (= (and mapNonEmpty!38436 ((_ is ValueCellFull!11600) mapDefault!38445)) b!1037146))

(declare-fun m!956925 () Bool)

(assert (=> mapNonEmpty!38445 m!956925))

(check-sat (not mapNonEmpty!38445) (not d!125067) (not b!1037129) (not b!1037110) (not bm!43888) (not b!1037096) (not b!1037137) (not bm!43889) (not b_next!20887) (not b!1037114) (not b!1037127) (not d!125069) (not b!1037126) (not d!125061) b_and!33393 (not b!1037138) tp_is_empty!24607 (not b!1037136))
(check-sat b_and!33393 (not b_next!20887))
