; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90954 () Bool)

(assert start!90954)

(declare-fun b!1038972 () Bool)

(declare-fun b_free!20965 () Bool)

(declare-fun b_next!20965 () Bool)

(assert (=> b!1038972 (= b_free!20965 (not b_next!20965))))

(declare-fun tp!74068 () Bool)

(declare-fun b_and!33471 () Bool)

(assert (=> b!1038972 (= tp!74068 b_and!33471)))

(declare-fun b!1038967 () Bool)

(declare-fun res!692964 () Bool)

(declare-fun e!587982 () Bool)

(assert (=> b!1038967 (=> res!692964 e!587982)))

(declare-datatypes ((V!37787 0))(
  ( (V!37788 (val!12393 Int)) )
))
(declare-datatypes ((ValueCell!11639 0))(
  ( (ValueCellFull!11639 (v!14979 V!37787)) (EmptyCell!11639) )
))
(declare-datatypes ((array!65431 0))(
  ( (array!65432 (arr!31488 (Array (_ BitVec 32) (_ BitVec 64))) (size!32021 (_ BitVec 32))) )
))
(declare-datatypes ((array!65433 0))(
  ( (array!65434 (arr!31489 (Array (_ BitVec 32) ValueCell!11639)) (size!32022 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5872 0))(
  ( (LongMapFixedSize!5873 (defaultEntry!6318 Int) (mask!30271 (_ BitVec 32)) (extraKeys!6046 (_ BitVec 32)) (zeroValue!6152 V!37787) (minValue!6152 V!37787) (_size!2991 (_ BitVec 32)) (_keys!11522 array!65431) (_values!6341 array!65433) (_vacant!2991 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5872)

(declare-datatypes ((SeekEntryResult!9774 0))(
  ( (MissingZero!9774 (index!41467 (_ BitVec 32))) (Found!9774 (index!41468 (_ BitVec 32))) (Intermediate!9774 (undefined!10586 Bool) (index!41469 (_ BitVec 32)) (x!92731 (_ BitVec 32))) (Undefined!9774) (MissingVacant!9774 (index!41470 (_ BitVec 32))) )
))
(declare-fun lt!457786 () SeekEntryResult!9774)

(assert (=> b!1038967 (= res!692964 (or (not (= (size!32021 (_keys!11522 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30271 thiss!1427)))) (bvslt (index!41468 lt!457786) #b00000000000000000000000000000000) (bvsge (index!41468 lt!457786) (size!32021 (_keys!11522 thiss!1427)))))))

(declare-fun b!1038968 () Bool)

(declare-fun res!692965 () Bool)

(declare-fun e!587987 () Bool)

(assert (=> b!1038968 (=> (not res!692965) (not e!587987))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038968 (= res!692965 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038969 () Bool)

(declare-fun e!587981 () Bool)

(declare-fun tp_is_empty!24685 () Bool)

(assert (=> b!1038969 (= e!587981 tp_is_empty!24685)))

(declare-fun b!1038970 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038970 (= e!587982 (validKeyInArray!0 (select (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786))))))

(declare-fun b!1038971 () Bool)

(declare-fun e!587980 () Bool)

(assert (=> b!1038971 (= e!587987 e!587980)))

(declare-fun res!692967 () Bool)

(assert (=> b!1038971 (=> (not res!692967) (not e!587980))))

(get-info :version)

(assert (=> b!1038971 (= res!692967 ((_ is Found!9774) lt!457786))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65431 (_ BitVec 32)) SeekEntryResult!9774)

(assert (=> b!1038971 (= lt!457786 (seekEntry!0 key!909 (_keys!11522 thiss!1427) (mask!30271 thiss!1427)))))

(declare-fun e!587984 () Bool)

(declare-fun e!587986 () Bool)

(declare-fun array_inv!24349 (array!65431) Bool)

(declare-fun array_inv!24350 (array!65433) Bool)

(assert (=> b!1038972 (= e!587984 (and tp!74068 tp_is_empty!24685 (array_inv!24349 (_keys!11522 thiss!1427)) (array_inv!24350 (_values!6341 thiss!1427)) e!587986))))

(declare-fun b!1038973 () Bool)

(assert (=> b!1038973 (= e!587980 (not e!587982))))

(declare-fun res!692966 () Bool)

(assert (=> b!1038973 (=> res!692966 e!587982)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038973 (= res!692966 (not (validMask!0 (mask!30271 thiss!1427))))))

(declare-fun lt!457787 () array!65431)

(declare-datatypes ((List!21980 0))(
  ( (Nil!21977) (Cons!21976 (h!23180 (_ BitVec 64)) (t!31185 List!21980)) )
))
(declare-fun arrayNoDuplicates!0 (array!65431 (_ BitVec 32) List!21980) Bool)

(assert (=> b!1038973 (arrayNoDuplicates!0 lt!457787 #b00000000000000000000000000000000 Nil!21977)))

(declare-datatypes ((Unit!33873 0))(
  ( (Unit!33874) )
))
(declare-fun lt!457785 () Unit!33873)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21980) Unit!33873)

(assert (=> b!1038973 (= lt!457785 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11522 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41468 lt!457786) #b00000000000000000000000000000000 Nil!21977))))

(declare-fun arrayCountValidKeys!0 (array!65431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038973 (= (arrayCountValidKeys!0 lt!457787 #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11522 thiss!1427) #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038973 (= lt!457787 (array!65432 (store (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32021 (_keys!11522 thiss!1427))))))

(declare-fun lt!457788 () Unit!33873)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65431 (_ BitVec 32) (_ BitVec 64)) Unit!33873)

(assert (=> b!1038973 (= lt!457788 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11522 thiss!1427) (index!41468 lt!457786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038974 () Bool)

(declare-fun e!587983 () Bool)

(declare-fun mapRes!38584 () Bool)

(assert (=> b!1038974 (= e!587986 (and e!587983 mapRes!38584))))

(declare-fun condMapEmpty!38584 () Bool)

(declare-fun mapDefault!38584 () ValueCell!11639)

(assert (=> b!1038974 (= condMapEmpty!38584 (= (arr!31489 (_values!6341 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11639)) mapDefault!38584)))))

(declare-fun mapNonEmpty!38584 () Bool)

(declare-fun tp!74069 () Bool)

(assert (=> mapNonEmpty!38584 (= mapRes!38584 (and tp!74069 e!587981))))

(declare-fun mapKey!38584 () (_ BitVec 32))

(declare-fun mapRest!38584 () (Array (_ BitVec 32) ValueCell!11639))

(declare-fun mapValue!38584 () ValueCell!11639)

(assert (=> mapNonEmpty!38584 (= (arr!31489 (_values!6341 thiss!1427)) (store mapRest!38584 mapKey!38584 mapValue!38584))))

(declare-fun res!692963 () Bool)

(assert (=> start!90954 (=> (not res!692963) (not e!587987))))

(declare-fun valid!2201 (LongMapFixedSize!5872) Bool)

(assert (=> start!90954 (= res!692963 (valid!2201 thiss!1427))))

(assert (=> start!90954 e!587987))

(assert (=> start!90954 e!587984))

(assert (=> start!90954 true))

(declare-fun mapIsEmpty!38584 () Bool)

(assert (=> mapIsEmpty!38584 mapRes!38584))

(declare-fun b!1038975 () Bool)

(assert (=> b!1038975 (= e!587983 tp_is_empty!24685)))

(assert (= (and start!90954 res!692963) b!1038968))

(assert (= (and b!1038968 res!692965) b!1038971))

(assert (= (and b!1038971 res!692967) b!1038973))

(assert (= (and b!1038973 (not res!692966)) b!1038967))

(assert (= (and b!1038967 (not res!692964)) b!1038970))

(assert (= (and b!1038974 condMapEmpty!38584) mapIsEmpty!38584))

(assert (= (and b!1038974 (not condMapEmpty!38584)) mapNonEmpty!38584))

(assert (= (and mapNonEmpty!38584 ((_ is ValueCellFull!11639) mapValue!38584)) b!1038969))

(assert (= (and b!1038974 ((_ is ValueCellFull!11639) mapDefault!38584)) b!1038975))

(assert (= b!1038972 b!1038974))

(assert (= start!90954 b!1038972))

(declare-fun m!958273 () Bool)

(assert (=> start!90954 m!958273))

(declare-fun m!958275 () Bool)

(assert (=> b!1038972 m!958275))

(declare-fun m!958277 () Bool)

(assert (=> b!1038972 m!958277))

(declare-fun m!958279 () Bool)

(assert (=> mapNonEmpty!38584 m!958279))

(declare-fun m!958281 () Bool)

(assert (=> b!1038973 m!958281))

(declare-fun m!958283 () Bool)

(assert (=> b!1038973 m!958283))

(declare-fun m!958285 () Bool)

(assert (=> b!1038973 m!958285))

(declare-fun m!958287 () Bool)

(assert (=> b!1038973 m!958287))

(declare-fun m!958289 () Bool)

(assert (=> b!1038973 m!958289))

(declare-fun m!958291 () Bool)

(assert (=> b!1038973 m!958291))

(declare-fun m!958293 () Bool)

(assert (=> b!1038973 m!958293))

(declare-fun m!958295 () Bool)

(assert (=> b!1038971 m!958295))

(declare-fun m!958297 () Bool)

(assert (=> b!1038970 m!958297))

(assert (=> b!1038970 m!958297))

(declare-fun m!958299 () Bool)

(assert (=> b!1038970 m!958299))

(check-sat b_and!33471 (not b!1038972) (not b!1038971) (not b!1038973) (not start!90954) (not mapNonEmpty!38584) tp_is_empty!24685 (not b_next!20965) (not b!1038970))
(check-sat b_and!33471 (not b_next!20965))
(get-model)

(declare-fun d!125307 () Bool)

(assert (=> d!125307 (= (validMask!0 (mask!30271 thiss!1427)) (and (or (= (mask!30271 thiss!1427) #b00000000000000000000000000000111) (= (mask!30271 thiss!1427) #b00000000000000000000000000001111) (= (mask!30271 thiss!1427) #b00000000000000000000000000011111) (= (mask!30271 thiss!1427) #b00000000000000000000000000111111) (= (mask!30271 thiss!1427) #b00000000000000000000000001111111) (= (mask!30271 thiss!1427) #b00000000000000000000000011111111) (= (mask!30271 thiss!1427) #b00000000000000000000000111111111) (= (mask!30271 thiss!1427) #b00000000000000000000001111111111) (= (mask!30271 thiss!1427) #b00000000000000000000011111111111) (= (mask!30271 thiss!1427) #b00000000000000000000111111111111) (= (mask!30271 thiss!1427) #b00000000000000000001111111111111) (= (mask!30271 thiss!1427) #b00000000000000000011111111111111) (= (mask!30271 thiss!1427) #b00000000000000000111111111111111) (= (mask!30271 thiss!1427) #b00000000000000001111111111111111) (= (mask!30271 thiss!1427) #b00000000000000011111111111111111) (= (mask!30271 thiss!1427) #b00000000000000111111111111111111) (= (mask!30271 thiss!1427) #b00000000000001111111111111111111) (= (mask!30271 thiss!1427) #b00000000000011111111111111111111) (= (mask!30271 thiss!1427) #b00000000000111111111111111111111) (= (mask!30271 thiss!1427) #b00000000001111111111111111111111) (= (mask!30271 thiss!1427) #b00000000011111111111111111111111) (= (mask!30271 thiss!1427) #b00000000111111111111111111111111) (= (mask!30271 thiss!1427) #b00000001111111111111111111111111) (= (mask!30271 thiss!1427) #b00000011111111111111111111111111) (= (mask!30271 thiss!1427) #b00000111111111111111111111111111) (= (mask!30271 thiss!1427) #b00001111111111111111111111111111) (= (mask!30271 thiss!1427) #b00011111111111111111111111111111) (= (mask!30271 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30271 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038973 d!125307))

(declare-fun b!1039041 () Bool)

(declare-fun e!588041 () Bool)

(assert (=> b!1039041 (= e!588041 (= (arrayCountValidKeys!0 (array!65432 (store (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32021 (_keys!11522 thiss!1427))) #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11522 thiss!1427) #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039040 () Bool)

(declare-fun e!588040 () Bool)

(assert (=> b!1039040 (= e!588040 (bvslt (size!32021 (_keys!11522 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125309 () Bool)

(assert (=> d!125309 e!588041))

(declare-fun res!693009 () Bool)

(assert (=> d!125309 (=> (not res!693009) (not e!588041))))

(assert (=> d!125309 (= res!693009 (and (bvsge (index!41468 lt!457786) #b00000000000000000000000000000000) (bvslt (index!41468 lt!457786) (size!32021 (_keys!11522 thiss!1427)))))))

(declare-fun lt!457815 () Unit!33873)

(declare-fun choose!82 (array!65431 (_ BitVec 32) (_ BitVec 64)) Unit!33873)

(assert (=> d!125309 (= lt!457815 (choose!82 (_keys!11522 thiss!1427) (index!41468 lt!457786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125309 e!588040))

(declare-fun res!693008 () Bool)

(assert (=> d!125309 (=> (not res!693008) (not e!588040))))

(assert (=> d!125309 (= res!693008 (and (bvsge (index!41468 lt!457786) #b00000000000000000000000000000000) (bvslt (index!41468 lt!457786) (size!32021 (_keys!11522 thiss!1427)))))))

(assert (=> d!125309 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11522 thiss!1427) (index!41468 lt!457786) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457815)))

(declare-fun b!1039039 () Bool)

(declare-fun res!693006 () Bool)

(assert (=> b!1039039 (=> (not res!693006) (not e!588040))))

(assert (=> b!1039039 (= res!693006 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039038 () Bool)

(declare-fun res!693007 () Bool)

(assert (=> b!1039038 (=> (not res!693007) (not e!588040))))

(assert (=> b!1039038 (= res!693007 (validKeyInArray!0 (select (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786))))))

(assert (= (and d!125309 res!693008) b!1039038))

(assert (= (and b!1039038 res!693007) b!1039039))

(assert (= (and b!1039039 res!693006) b!1039040))

(assert (= (and d!125309 res!693009) b!1039041))

(assert (=> b!1039041 m!958287))

(declare-fun m!958357 () Bool)

(assert (=> b!1039041 m!958357))

(assert (=> b!1039041 m!958289))

(declare-fun m!958359 () Bool)

(assert (=> d!125309 m!958359))

(declare-fun m!958361 () Bool)

(assert (=> b!1039039 m!958361))

(assert (=> b!1039038 m!958297))

(assert (=> b!1039038 m!958297))

(assert (=> b!1039038 m!958299))

(assert (=> b!1038973 d!125309))

(declare-fun b!1039052 () Bool)

(declare-fun e!588051 () Bool)

(declare-fun call!43958 () Bool)

(assert (=> b!1039052 (= e!588051 call!43958)))

(declare-fun bm!43955 () Bool)

(declare-fun c!105272 () Bool)

(assert (=> bm!43955 (= call!43958 (arrayNoDuplicates!0 lt!457787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105272 (Cons!21976 (select (arr!31488 lt!457787) #b00000000000000000000000000000000) Nil!21977) Nil!21977)))))

(declare-fun b!1039053 () Bool)

(assert (=> b!1039053 (= e!588051 call!43958)))

(declare-fun b!1039054 () Bool)

(declare-fun e!588050 () Bool)

(assert (=> b!1039054 (= e!588050 e!588051)))

(assert (=> b!1039054 (= c!105272 (validKeyInArray!0 (select (arr!31488 lt!457787) #b00000000000000000000000000000000)))))

(declare-fun b!1039055 () Bool)

(declare-fun e!588052 () Bool)

(declare-fun contains!6022 (List!21980 (_ BitVec 64)) Bool)

(assert (=> b!1039055 (= e!588052 (contains!6022 Nil!21977 (select (arr!31488 lt!457787) #b00000000000000000000000000000000)))))

(declare-fun b!1039056 () Bool)

(declare-fun e!588053 () Bool)

(assert (=> b!1039056 (= e!588053 e!588050)))

(declare-fun res!693018 () Bool)

(assert (=> b!1039056 (=> (not res!693018) (not e!588050))))

(assert (=> b!1039056 (= res!693018 (not e!588052))))

(declare-fun res!693017 () Bool)

(assert (=> b!1039056 (=> (not res!693017) (not e!588052))))

(assert (=> b!1039056 (= res!693017 (validKeyInArray!0 (select (arr!31488 lt!457787) #b00000000000000000000000000000000)))))

(declare-fun d!125311 () Bool)

(declare-fun res!693016 () Bool)

(assert (=> d!125311 (=> res!693016 e!588053)))

(assert (=> d!125311 (= res!693016 (bvsge #b00000000000000000000000000000000 (size!32021 lt!457787)))))

(assert (=> d!125311 (= (arrayNoDuplicates!0 lt!457787 #b00000000000000000000000000000000 Nil!21977) e!588053)))

(assert (= (and d!125311 (not res!693016)) b!1039056))

(assert (= (and b!1039056 res!693017) b!1039055))

(assert (= (and b!1039056 res!693018) b!1039054))

(assert (= (and b!1039054 c!105272) b!1039053))

(assert (= (and b!1039054 (not c!105272)) b!1039052))

(assert (= (or b!1039053 b!1039052) bm!43955))

(declare-fun m!958363 () Bool)

(assert (=> bm!43955 m!958363))

(declare-fun m!958365 () Bool)

(assert (=> bm!43955 m!958365))

(assert (=> b!1039054 m!958363))

(assert (=> b!1039054 m!958363))

(declare-fun m!958367 () Bool)

(assert (=> b!1039054 m!958367))

(assert (=> b!1039055 m!958363))

(assert (=> b!1039055 m!958363))

(declare-fun m!958369 () Bool)

(assert (=> b!1039055 m!958369))

(assert (=> b!1039056 m!958363))

(assert (=> b!1039056 m!958363))

(assert (=> b!1039056 m!958367))

(assert (=> b!1038973 d!125311))

(declare-fun b!1039065 () Bool)

(declare-fun e!588059 () (_ BitVec 32))

(assert (=> b!1039065 (= e!588059 #b00000000000000000000000000000000)))

(declare-fun bm!43958 () Bool)

(declare-fun call!43961 () (_ BitVec 32))

(assert (=> bm!43958 (= call!43961 (arrayCountValidKeys!0 (_keys!11522 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32021 (_keys!11522 thiss!1427))))))

(declare-fun b!1039066 () Bool)

(declare-fun e!588058 () (_ BitVec 32))

(assert (=> b!1039066 (= e!588058 (bvadd #b00000000000000000000000000000001 call!43961))))

(declare-fun d!125313 () Bool)

(declare-fun lt!457818 () (_ BitVec 32))

(assert (=> d!125313 (and (bvsge lt!457818 #b00000000000000000000000000000000) (bvsle lt!457818 (bvsub (size!32021 (_keys!11522 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125313 (= lt!457818 e!588059)))

(declare-fun c!105278 () Bool)

(assert (=> d!125313 (= c!105278 (bvsge #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))))))

(assert (=> d!125313 (and (bvsle #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32021 (_keys!11522 thiss!1427)) (size!32021 (_keys!11522 thiss!1427))))))

(assert (=> d!125313 (= (arrayCountValidKeys!0 (_keys!11522 thiss!1427) #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) lt!457818)))

(declare-fun b!1039067 () Bool)

(assert (=> b!1039067 (= e!588058 call!43961)))

(declare-fun b!1039068 () Bool)

(assert (=> b!1039068 (= e!588059 e!588058)))

(declare-fun c!105277 () Bool)

(assert (=> b!1039068 (= c!105277 (validKeyInArray!0 (select (arr!31488 (_keys!11522 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125313 c!105278) b!1039065))

(assert (= (and d!125313 (not c!105278)) b!1039068))

(assert (= (and b!1039068 c!105277) b!1039066))

(assert (= (and b!1039068 (not c!105277)) b!1039067))

(assert (= (or b!1039066 b!1039067) bm!43958))

(declare-fun m!958371 () Bool)

(assert (=> bm!43958 m!958371))

(declare-fun m!958373 () Bool)

(assert (=> b!1039068 m!958373))

(assert (=> b!1039068 m!958373))

(declare-fun m!958375 () Bool)

(assert (=> b!1039068 m!958375))

(assert (=> b!1038973 d!125313))

(declare-fun d!125315 () Bool)

(declare-fun e!588062 () Bool)

(assert (=> d!125315 e!588062))

(declare-fun res!693021 () Bool)

(assert (=> d!125315 (=> (not res!693021) (not e!588062))))

(assert (=> d!125315 (= res!693021 (and (bvsge (index!41468 lt!457786) #b00000000000000000000000000000000) (bvslt (index!41468 lt!457786) (size!32021 (_keys!11522 thiss!1427)))))))

(declare-fun lt!457821 () Unit!33873)

(declare-fun choose!53 (array!65431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21980) Unit!33873)

(assert (=> d!125315 (= lt!457821 (choose!53 (_keys!11522 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41468 lt!457786) #b00000000000000000000000000000000 Nil!21977))))

(assert (=> d!125315 (bvslt (size!32021 (_keys!11522 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125315 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11522 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41468 lt!457786) #b00000000000000000000000000000000 Nil!21977) lt!457821)))

(declare-fun b!1039071 () Bool)

(assert (=> b!1039071 (= e!588062 (arrayNoDuplicates!0 (array!65432 (store (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32021 (_keys!11522 thiss!1427))) #b00000000000000000000000000000000 Nil!21977))))

(assert (= (and d!125315 res!693021) b!1039071))

(declare-fun m!958377 () Bool)

(assert (=> d!125315 m!958377))

(assert (=> b!1039071 m!958287))

(declare-fun m!958379 () Bool)

(assert (=> b!1039071 m!958379))

(assert (=> b!1038973 d!125315))

(declare-fun b!1039072 () Bool)

(declare-fun e!588064 () (_ BitVec 32))

(assert (=> b!1039072 (= e!588064 #b00000000000000000000000000000000)))

(declare-fun bm!43959 () Bool)

(declare-fun call!43962 () (_ BitVec 32))

(assert (=> bm!43959 (= call!43962 (arrayCountValidKeys!0 lt!457787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32021 (_keys!11522 thiss!1427))))))

(declare-fun b!1039073 () Bool)

(declare-fun e!588063 () (_ BitVec 32))

(assert (=> b!1039073 (= e!588063 (bvadd #b00000000000000000000000000000001 call!43962))))

(declare-fun d!125317 () Bool)

(declare-fun lt!457822 () (_ BitVec 32))

(assert (=> d!125317 (and (bvsge lt!457822 #b00000000000000000000000000000000) (bvsle lt!457822 (bvsub (size!32021 lt!457787) #b00000000000000000000000000000000)))))

(assert (=> d!125317 (= lt!457822 e!588064)))

(declare-fun c!105280 () Bool)

(assert (=> d!125317 (= c!105280 (bvsge #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))))))

(assert (=> d!125317 (and (bvsle #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32021 (_keys!11522 thiss!1427)) (size!32021 lt!457787)))))

(assert (=> d!125317 (= (arrayCountValidKeys!0 lt!457787 #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) lt!457822)))

(declare-fun b!1039074 () Bool)

(assert (=> b!1039074 (= e!588063 call!43962)))

(declare-fun b!1039075 () Bool)

(assert (=> b!1039075 (= e!588064 e!588063)))

(declare-fun c!105279 () Bool)

(assert (=> b!1039075 (= c!105279 (validKeyInArray!0 (select (arr!31488 lt!457787) #b00000000000000000000000000000000)))))

(assert (= (and d!125317 c!105280) b!1039072))

(assert (= (and d!125317 (not c!105280)) b!1039075))

(assert (= (and b!1039075 c!105279) b!1039073))

(assert (= (and b!1039075 (not c!105279)) b!1039074))

(assert (= (or b!1039073 b!1039074) bm!43959))

(declare-fun m!958381 () Bool)

(assert (=> bm!43959 m!958381))

(assert (=> b!1039075 m!958363))

(assert (=> b!1039075 m!958363))

(assert (=> b!1039075 m!958367))

(assert (=> b!1038973 d!125317))

(declare-fun d!125319 () Bool)

(declare-fun res!693028 () Bool)

(declare-fun e!588067 () Bool)

(assert (=> d!125319 (=> (not res!693028) (not e!588067))))

(declare-fun simpleValid!426 (LongMapFixedSize!5872) Bool)

(assert (=> d!125319 (= res!693028 (simpleValid!426 thiss!1427))))

(assert (=> d!125319 (= (valid!2201 thiss!1427) e!588067)))

(declare-fun b!1039082 () Bool)

(declare-fun res!693029 () Bool)

(assert (=> b!1039082 (=> (not res!693029) (not e!588067))))

(assert (=> b!1039082 (= res!693029 (= (arrayCountValidKeys!0 (_keys!11522 thiss!1427) #b00000000000000000000000000000000 (size!32021 (_keys!11522 thiss!1427))) (_size!2991 thiss!1427)))))

(declare-fun b!1039083 () Bool)

(declare-fun res!693030 () Bool)

(assert (=> b!1039083 (=> (not res!693030) (not e!588067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65431 (_ BitVec 32)) Bool)

(assert (=> b!1039083 (= res!693030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11522 thiss!1427) (mask!30271 thiss!1427)))))

(declare-fun b!1039084 () Bool)

(assert (=> b!1039084 (= e!588067 (arrayNoDuplicates!0 (_keys!11522 thiss!1427) #b00000000000000000000000000000000 Nil!21977))))

(assert (= (and d!125319 res!693028) b!1039082))

(assert (= (and b!1039082 res!693029) b!1039083))

(assert (= (and b!1039083 res!693030) b!1039084))

(declare-fun m!958383 () Bool)

(assert (=> d!125319 m!958383))

(assert (=> b!1039082 m!958289))

(declare-fun m!958385 () Bool)

(assert (=> b!1039083 m!958385))

(declare-fun m!958387 () Bool)

(assert (=> b!1039084 m!958387))

(assert (=> start!90954 d!125319))

(declare-fun d!125321 () Bool)

(assert (=> d!125321 (= (array_inv!24349 (_keys!11522 thiss!1427)) (bvsge (size!32021 (_keys!11522 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038972 d!125321))

(declare-fun d!125323 () Bool)

(assert (=> d!125323 (= (array_inv!24350 (_values!6341 thiss!1427)) (bvsge (size!32022 (_values!6341 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038972 d!125323))

(declare-fun d!125325 () Bool)

(assert (=> d!125325 (= (validKeyInArray!0 (select (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786))) (and (not (= (select (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457786)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038970 d!125325))

(declare-fun b!1039097 () Bool)

(declare-fun e!588075 () SeekEntryResult!9774)

(declare-fun lt!457832 () SeekEntryResult!9774)

(assert (=> b!1039097 (= e!588075 (ite ((_ is MissingVacant!9774) lt!457832) (MissingZero!9774 (index!41470 lt!457832)) lt!457832))))

(declare-fun lt!457834 () SeekEntryResult!9774)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65431 (_ BitVec 32)) SeekEntryResult!9774)

(assert (=> b!1039097 (= lt!457832 (seekKeyOrZeroReturnVacant!0 (x!92731 lt!457834) (index!41469 lt!457834) (index!41469 lt!457834) key!909 (_keys!11522 thiss!1427) (mask!30271 thiss!1427)))))

(declare-fun d!125327 () Bool)

(declare-fun lt!457833 () SeekEntryResult!9774)

(assert (=> d!125327 (and (or ((_ is MissingVacant!9774) lt!457833) (not ((_ is Found!9774) lt!457833)) (and (bvsge (index!41468 lt!457833) #b00000000000000000000000000000000) (bvslt (index!41468 lt!457833) (size!32021 (_keys!11522 thiss!1427))))) (not ((_ is MissingVacant!9774) lt!457833)) (or (not ((_ is Found!9774) lt!457833)) (= (select (arr!31488 (_keys!11522 thiss!1427)) (index!41468 lt!457833)) key!909)))))

(declare-fun e!588076 () SeekEntryResult!9774)

(assert (=> d!125327 (= lt!457833 e!588076)))

(declare-fun c!105289 () Bool)

(assert (=> d!125327 (= c!105289 (and ((_ is Intermediate!9774) lt!457834) (undefined!10586 lt!457834)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65431 (_ BitVec 32)) SeekEntryResult!9774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125327 (= lt!457834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30271 thiss!1427)) key!909 (_keys!11522 thiss!1427) (mask!30271 thiss!1427)))))

(assert (=> d!125327 (validMask!0 (mask!30271 thiss!1427))))

(assert (=> d!125327 (= (seekEntry!0 key!909 (_keys!11522 thiss!1427) (mask!30271 thiss!1427)) lt!457833)))

(declare-fun b!1039098 () Bool)

(declare-fun e!588074 () SeekEntryResult!9774)

(assert (=> b!1039098 (= e!588076 e!588074)))

(declare-fun lt!457831 () (_ BitVec 64))

(assert (=> b!1039098 (= lt!457831 (select (arr!31488 (_keys!11522 thiss!1427)) (index!41469 lt!457834)))))

(declare-fun c!105288 () Bool)

(assert (=> b!1039098 (= c!105288 (= lt!457831 key!909))))

(declare-fun b!1039099 () Bool)

(assert (=> b!1039099 (= e!588074 (Found!9774 (index!41469 lt!457834)))))

(declare-fun b!1039100 () Bool)

(assert (=> b!1039100 (= e!588075 (MissingZero!9774 (index!41469 lt!457834)))))

(declare-fun b!1039101 () Bool)

(assert (=> b!1039101 (= e!588076 Undefined!9774)))

(declare-fun b!1039102 () Bool)

(declare-fun c!105287 () Bool)

(assert (=> b!1039102 (= c!105287 (= lt!457831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039102 (= e!588074 e!588075)))

(assert (= (and d!125327 c!105289) b!1039101))

(assert (= (and d!125327 (not c!105289)) b!1039098))

(assert (= (and b!1039098 c!105288) b!1039099))

(assert (= (and b!1039098 (not c!105288)) b!1039102))

(assert (= (and b!1039102 c!105287) b!1039100))

(assert (= (and b!1039102 (not c!105287)) b!1039097))

(declare-fun m!958389 () Bool)

(assert (=> b!1039097 m!958389))

(declare-fun m!958391 () Bool)

(assert (=> d!125327 m!958391))

(declare-fun m!958393 () Bool)

(assert (=> d!125327 m!958393))

(assert (=> d!125327 m!958393))

(declare-fun m!958395 () Bool)

(assert (=> d!125327 m!958395))

(assert (=> d!125327 m!958283))

(declare-fun m!958397 () Bool)

(assert (=> b!1039098 m!958397))

(assert (=> b!1038971 d!125327))

(declare-fun mapNonEmpty!38593 () Bool)

(declare-fun mapRes!38593 () Bool)

(declare-fun tp!74084 () Bool)

(declare-fun e!588081 () Bool)

(assert (=> mapNonEmpty!38593 (= mapRes!38593 (and tp!74084 e!588081))))

(declare-fun mapKey!38593 () (_ BitVec 32))

(declare-fun mapValue!38593 () ValueCell!11639)

(declare-fun mapRest!38593 () (Array (_ BitVec 32) ValueCell!11639))

(assert (=> mapNonEmpty!38593 (= mapRest!38584 (store mapRest!38593 mapKey!38593 mapValue!38593))))

(declare-fun condMapEmpty!38593 () Bool)

(declare-fun mapDefault!38593 () ValueCell!11639)

(assert (=> mapNonEmpty!38584 (= condMapEmpty!38593 (= mapRest!38584 ((as const (Array (_ BitVec 32) ValueCell!11639)) mapDefault!38593)))))

(declare-fun e!588082 () Bool)

(assert (=> mapNonEmpty!38584 (= tp!74069 (and e!588082 mapRes!38593))))

(declare-fun mapIsEmpty!38593 () Bool)

(assert (=> mapIsEmpty!38593 mapRes!38593))

(declare-fun b!1039109 () Bool)

(assert (=> b!1039109 (= e!588081 tp_is_empty!24685)))

(declare-fun b!1039110 () Bool)

(assert (=> b!1039110 (= e!588082 tp_is_empty!24685)))

(assert (= (and mapNonEmpty!38584 condMapEmpty!38593) mapIsEmpty!38593))

(assert (= (and mapNonEmpty!38584 (not condMapEmpty!38593)) mapNonEmpty!38593))

(assert (= (and mapNonEmpty!38593 ((_ is ValueCellFull!11639) mapValue!38593)) b!1039109))

(assert (= (and mapNonEmpty!38584 ((_ is ValueCellFull!11639) mapDefault!38593)) b!1039110))

(declare-fun m!958399 () Bool)

(assert (=> mapNonEmpty!38593 m!958399))

(check-sat (not b!1039041) (not bm!43958) (not b!1039083) (not d!125315) (not b!1039082) (not bm!43959) (not d!125327) (not d!125309) (not b!1039055) (not b!1039097) (not b!1039054) b_and!33471 (not b!1039071) (not b!1039056) (not b!1039084) (not mapNonEmpty!38593) (not d!125319) (not b!1039068) (not b!1039039) (not b!1039038) tp_is_empty!24685 (not b!1039075) (not b_next!20965) (not bm!43955))
(check-sat b_and!33471 (not b_next!20965))
