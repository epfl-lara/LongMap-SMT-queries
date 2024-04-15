; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107670 () Bool)

(assert start!107670)

(declare-fun b!1274011 () Bool)

(declare-fun b_free!27763 () Bool)

(declare-fun b_next!27763 () Bool)

(assert (=> b!1274011 (= b_free!27763 (not b_next!27763))))

(declare-fun tp!97856 () Bool)

(declare-fun b_and!45801 () Bool)

(assert (=> b!1274011 (= tp!97856 b_and!45801)))

(declare-fun mapNonEmpty!51341 () Bool)

(declare-fun mapRes!51341 () Bool)

(declare-fun tp!97857 () Bool)

(declare-fun e!727007 () Bool)

(assert (=> mapNonEmpty!51341 (= mapRes!51341 (and tp!97857 e!727007))))

(declare-datatypes ((V!49371 0))(
  ( (V!49372 (val!16641 Int)) )
))
(declare-datatypes ((ValueCell!15713 0))(
  ( (ValueCellFull!15713 (v!19277 V!49371)) (EmptyCell!15713) )
))
(declare-fun mapRest!51341 () (Array (_ BitVec 32) ValueCell!15713))

(declare-datatypes ((array!83449 0))(
  ( (array!83450 (arr!40244 (Array (_ BitVec 32) ValueCell!15713)) (size!40794 (_ BitVec 32))) )
))
(declare-datatypes ((array!83451 0))(
  ( (array!83452 (arr!40245 (Array (_ BitVec 32) (_ BitVec 64))) (size!40795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6190 0))(
  ( (LongMapFixedSize!6191 (defaultEntry!6741 Int) (mask!34539 (_ BitVec 32)) (extraKeys!6420 (_ BitVec 32)) (zeroValue!6526 V!49371) (minValue!6526 V!49371) (_size!3150 (_ BitVec 32)) (_keys!12154 array!83451) (_values!6764 array!83449) (_vacant!3150 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6190)

(declare-fun mapKey!51341 () (_ BitVec 32))

(declare-fun mapValue!51341 () ValueCell!15713)

(assert (=> mapNonEmpty!51341 (= (arr!40244 (_values!6764 thiss!1551)) (store mapRest!51341 mapKey!51341 mapValue!51341))))

(declare-fun b!1274005 () Bool)

(declare-fun tp_is_empty!33133 () Bool)

(assert (=> b!1274005 (= e!727007 tp_is_empty!33133)))

(declare-fun b!1274006 () Bool)

(declare-fun e!727010 () Bool)

(assert (=> b!1274006 (= e!727010 tp_is_empty!33133)))

(declare-fun mapIsEmpty!51341 () Bool)

(assert (=> mapIsEmpty!51341 mapRes!51341))

(declare-fun b!1274007 () Bool)

(declare-fun res!847058 () Bool)

(declare-fun e!727008 () Bool)

(assert (=> b!1274007 (=> (not res!847058) (not e!727008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83451 (_ BitVec 32)) Bool)

(assert (=> b!1274007 (= res!847058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12154 thiss!1551) (mask!34539 thiss!1551)))))

(declare-fun b!1274008 () Bool)

(declare-fun e!727009 () Bool)

(assert (=> b!1274008 (= e!727009 (and e!727010 mapRes!51341))))

(declare-fun condMapEmpty!51341 () Bool)

(declare-fun mapDefault!51341 () ValueCell!15713)

(assert (=> b!1274008 (= condMapEmpty!51341 (= (arr!40244 (_values!6764 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15713)) mapDefault!51341)))))

(declare-fun res!847061 () Bool)

(assert (=> start!107670 (=> (not res!847061) (not e!727008))))

(declare-fun simpleValid!479 (LongMapFixedSize!6190) Bool)

(assert (=> start!107670 (= res!847061 (simpleValid!479 thiss!1551))))

(assert (=> start!107670 e!727008))

(declare-fun e!727006 () Bool)

(assert (=> start!107670 e!727006))

(declare-fun b!1274009 () Bool)

(declare-fun res!847060 () Bool)

(assert (=> b!1274009 (=> (not res!847060) (not e!727008))))

(declare-fun arrayCountValidKeys!0 (array!83451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274009 (= res!847060 (= (arrayCountValidKeys!0 (_keys!12154 thiss!1551) #b00000000000000000000000000000000 (size!40795 (_keys!12154 thiss!1551))) (_size!3150 thiss!1551)))))

(declare-fun b!1274010 () Bool)

(declare-fun res!847059 () Bool)

(assert (=> b!1274010 (=> (not res!847059) (not e!727008))))

(assert (=> b!1274010 (= res!847059 (and (bvsle #b00000000000000000000000000000000 (size!40795 (_keys!12154 thiss!1551))) (bvslt (size!40795 (_keys!12154 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun array_inv!30747 (array!83451) Bool)

(declare-fun array_inv!30748 (array!83449) Bool)

(assert (=> b!1274011 (= e!727006 (and tp!97856 tp_is_empty!33133 (array_inv!30747 (_keys!12154 thiss!1551)) (array_inv!30748 (_values!6764 thiss!1551)) e!727009))))

(declare-fun b!1274012 () Bool)

(declare-datatypes ((List!28641 0))(
  ( (Nil!28638) (Cons!28637 (h!29846 (_ BitVec 64)) (t!42166 List!28641)) )
))
(declare-fun noDuplicate!2064 (List!28641) Bool)

(assert (=> b!1274012 (= e!727008 (not (noDuplicate!2064 Nil!28638)))))

(assert (= (and start!107670 res!847061) b!1274009))

(assert (= (and b!1274009 res!847060) b!1274007))

(assert (= (and b!1274007 res!847058) b!1274010))

(assert (= (and b!1274010 res!847059) b!1274012))

(assert (= (and b!1274008 condMapEmpty!51341) mapIsEmpty!51341))

(assert (= (and b!1274008 (not condMapEmpty!51341)) mapNonEmpty!51341))

(get-info :version)

(assert (= (and mapNonEmpty!51341 ((_ is ValueCellFull!15713) mapValue!51341)) b!1274005))

(assert (= (and b!1274008 ((_ is ValueCellFull!15713) mapDefault!51341)) b!1274006))

(assert (= b!1274011 b!1274008))

(assert (= start!107670 b!1274011))

(declare-fun m!1170469 () Bool)

(assert (=> mapNonEmpty!51341 m!1170469))

(declare-fun m!1170471 () Bool)

(assert (=> start!107670 m!1170471))

(declare-fun m!1170473 () Bool)

(assert (=> b!1274012 m!1170473))

(declare-fun m!1170475 () Bool)

(assert (=> b!1274007 m!1170475))

(declare-fun m!1170477 () Bool)

(assert (=> b!1274009 m!1170477))

(declare-fun m!1170479 () Bool)

(assert (=> b!1274011 m!1170479))

(declare-fun m!1170481 () Bool)

(assert (=> b!1274011 m!1170481))

(check-sat b_and!45801 (not b!1274011) (not b!1274007) (not b_next!27763) (not b!1274009) tp_is_empty!33133 (not start!107670) (not mapNonEmpty!51341) (not b!1274012))
(check-sat b_and!45801 (not b_next!27763))
(get-model)

(declare-fun d!139971 () Bool)

(assert (=> d!139971 (= (array_inv!30747 (_keys!12154 thiss!1551)) (bvsge (size!40795 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274011 d!139971))

(declare-fun d!139973 () Bool)

(assert (=> d!139973 (= (array_inv!30748 (_values!6764 thiss!1551)) (bvsge (size!40794 (_values!6764 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274011 d!139973))

(declare-fun b!1274072 () Bool)

(declare-fun e!727050 () Bool)

(assert (=> b!1274072 (= e!727050 (and (bvsge (extraKeys!6420 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6420 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3150 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1274070 () Bool)

(declare-fun res!847096 () Bool)

(assert (=> b!1274070 (=> (not res!847096) (not e!727050))))

(declare-fun size!40800 (LongMapFixedSize!6190) (_ BitVec 32))

(assert (=> b!1274070 (= res!847096 (bvsge (size!40800 thiss!1551) (_size!3150 thiss!1551)))))

(declare-fun b!1274069 () Bool)

(declare-fun res!847094 () Bool)

(assert (=> b!1274069 (=> (not res!847094) (not e!727050))))

(assert (=> b!1274069 (= res!847094 (and (= (size!40794 (_values!6764 thiss!1551)) (bvadd (mask!34539 thiss!1551) #b00000000000000000000000000000001)) (= (size!40795 (_keys!12154 thiss!1551)) (size!40794 (_values!6764 thiss!1551))) (bvsge (_size!3150 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3150 thiss!1551) (bvadd (mask!34539 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun d!139975 () Bool)

(declare-fun res!847095 () Bool)

(assert (=> d!139975 (=> (not res!847095) (not e!727050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139975 (= res!847095 (validMask!0 (mask!34539 thiss!1551)))))

(assert (=> d!139975 (= (simpleValid!479 thiss!1551) e!727050)))

(declare-fun b!1274071 () Bool)

(declare-fun res!847097 () Bool)

(assert (=> b!1274071 (=> (not res!847097) (not e!727050))))

(assert (=> b!1274071 (= res!847097 (= (size!40800 thiss!1551) (bvadd (_size!3150 thiss!1551) (bvsdiv (bvadd (extraKeys!6420 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!139975 res!847095) b!1274069))

(assert (= (and b!1274069 res!847094) b!1274070))

(assert (= (and b!1274070 res!847096) b!1274071))

(assert (= (and b!1274071 res!847097) b!1274072))

(declare-fun m!1170511 () Bool)

(assert (=> b!1274070 m!1170511))

(declare-fun m!1170513 () Bool)

(assert (=> d!139975 m!1170513))

(assert (=> b!1274071 m!1170511))

(assert (=> start!107670 d!139975))

(declare-fun bm!62601 () Bool)

(declare-fun call!62604 () Bool)

(assert (=> bm!62601 (= call!62604 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12154 thiss!1551) (mask!34539 thiss!1551)))))

(declare-fun d!139977 () Bool)

(declare-fun res!847102 () Bool)

(declare-fun e!727058 () Bool)

(assert (=> d!139977 (=> res!847102 e!727058)))

(assert (=> d!139977 (= res!847102 (bvsge #b00000000000000000000000000000000 (size!40795 (_keys!12154 thiss!1551))))))

(assert (=> d!139977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12154 thiss!1551) (mask!34539 thiss!1551)) e!727058)))

(declare-fun b!1274081 () Bool)

(declare-fun e!727059 () Bool)

(assert (=> b!1274081 (= e!727058 e!727059)))

(declare-fun c!123794 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274081 (= c!123794 (validKeyInArray!0 (select (arr!40245 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274082 () Bool)

(declare-fun e!727057 () Bool)

(assert (=> b!1274082 (= e!727059 e!727057)))

(declare-fun lt!575019 () (_ BitVec 64))

(assert (=> b!1274082 (= lt!575019 (select (arr!40245 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42184 0))(
  ( (Unit!42185) )
))
(declare-fun lt!575020 () Unit!42184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83451 (_ BitVec 64) (_ BitVec 32)) Unit!42184)

(assert (=> b!1274082 (= lt!575020 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12154 thiss!1551) lt!575019 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274082 (arrayContainsKey!0 (_keys!12154 thiss!1551) lt!575019 #b00000000000000000000000000000000)))

(declare-fun lt!575018 () Unit!42184)

(assert (=> b!1274082 (= lt!575018 lt!575020)))

(declare-fun res!847103 () Bool)

(declare-datatypes ((SeekEntryResult!9998 0))(
  ( (MissingZero!9998 (index!42363 (_ BitVec 32))) (Found!9998 (index!42364 (_ BitVec 32))) (Intermediate!9998 (undefined!10810 Bool) (index!42365 (_ BitVec 32)) (x!112716 (_ BitVec 32))) (Undefined!9998) (MissingVacant!9998 (index!42366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83451 (_ BitVec 32)) SeekEntryResult!9998)

(assert (=> b!1274082 (= res!847103 (= (seekEntryOrOpen!0 (select (arr!40245 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) (_keys!12154 thiss!1551) (mask!34539 thiss!1551)) (Found!9998 #b00000000000000000000000000000000)))))

(assert (=> b!1274082 (=> (not res!847103) (not e!727057))))

(declare-fun b!1274083 () Bool)

(assert (=> b!1274083 (= e!727057 call!62604)))

(declare-fun b!1274084 () Bool)

(assert (=> b!1274084 (= e!727059 call!62604)))

(assert (= (and d!139977 (not res!847102)) b!1274081))

(assert (= (and b!1274081 c!123794) b!1274082))

(assert (= (and b!1274081 (not c!123794)) b!1274084))

(assert (= (and b!1274082 res!847103) b!1274083))

(assert (= (or b!1274083 b!1274084) bm!62601))

(declare-fun m!1170515 () Bool)

(assert (=> bm!62601 m!1170515))

(declare-fun m!1170517 () Bool)

(assert (=> b!1274081 m!1170517))

(assert (=> b!1274081 m!1170517))

(declare-fun m!1170519 () Bool)

(assert (=> b!1274081 m!1170519))

(assert (=> b!1274082 m!1170517))

(declare-fun m!1170521 () Bool)

(assert (=> b!1274082 m!1170521))

(declare-fun m!1170523 () Bool)

(assert (=> b!1274082 m!1170523))

(assert (=> b!1274082 m!1170517))

(declare-fun m!1170525 () Bool)

(assert (=> b!1274082 m!1170525))

(assert (=> b!1274007 d!139977))

(declare-fun d!139979 () Bool)

(declare-fun res!847108 () Bool)

(declare-fun e!727064 () Bool)

(assert (=> d!139979 (=> res!847108 e!727064)))

(assert (=> d!139979 (= res!847108 ((_ is Nil!28638) Nil!28638))))

(assert (=> d!139979 (= (noDuplicate!2064 Nil!28638) e!727064)))

(declare-fun b!1274089 () Bool)

(declare-fun e!727065 () Bool)

(assert (=> b!1274089 (= e!727064 e!727065)))

(declare-fun res!847109 () Bool)

(assert (=> b!1274089 (=> (not res!847109) (not e!727065))))

(declare-fun contains!7644 (List!28641 (_ BitVec 64)) Bool)

(assert (=> b!1274089 (= res!847109 (not (contains!7644 (t!42166 Nil!28638) (h!29846 Nil!28638))))))

(declare-fun b!1274090 () Bool)

(assert (=> b!1274090 (= e!727065 (noDuplicate!2064 (t!42166 Nil!28638)))))

(assert (= (and d!139979 (not res!847108)) b!1274089))

(assert (= (and b!1274089 res!847109) b!1274090))

(declare-fun m!1170527 () Bool)

(assert (=> b!1274089 m!1170527))

(declare-fun m!1170529 () Bool)

(assert (=> b!1274090 m!1170529))

(assert (=> b!1274012 d!139979))

(declare-fun bm!62604 () Bool)

(declare-fun call!62607 () (_ BitVec 32))

(assert (=> bm!62604 (= call!62607 (arrayCountValidKeys!0 (_keys!12154 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40795 (_keys!12154 thiss!1551))))))

(declare-fun b!1274099 () Bool)

(declare-fun e!727070 () (_ BitVec 32))

(assert (=> b!1274099 (= e!727070 #b00000000000000000000000000000000)))

(declare-fun b!1274100 () Bool)

(declare-fun e!727071 () (_ BitVec 32))

(assert (=> b!1274100 (= e!727071 (bvadd #b00000000000000000000000000000001 call!62607))))

(declare-fun b!1274101 () Bool)

(assert (=> b!1274101 (= e!727071 call!62607)))

(declare-fun d!139981 () Bool)

(declare-fun lt!575023 () (_ BitVec 32))

(assert (=> d!139981 (and (bvsge lt!575023 #b00000000000000000000000000000000) (bvsle lt!575023 (bvsub (size!40795 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!139981 (= lt!575023 e!727070)))

(declare-fun c!123799 () Bool)

(assert (=> d!139981 (= c!123799 (bvsge #b00000000000000000000000000000000 (size!40795 (_keys!12154 thiss!1551))))))

(assert (=> d!139981 (and (bvsle #b00000000000000000000000000000000 (size!40795 (_keys!12154 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40795 (_keys!12154 thiss!1551)) (size!40795 (_keys!12154 thiss!1551))))))

(assert (=> d!139981 (= (arrayCountValidKeys!0 (_keys!12154 thiss!1551) #b00000000000000000000000000000000 (size!40795 (_keys!12154 thiss!1551))) lt!575023)))

(declare-fun b!1274102 () Bool)

(assert (=> b!1274102 (= e!727070 e!727071)))

(declare-fun c!123800 () Bool)

(assert (=> b!1274102 (= c!123800 (validKeyInArray!0 (select (arr!40245 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (= (and d!139981 c!123799) b!1274099))

(assert (= (and d!139981 (not c!123799)) b!1274102))

(assert (= (and b!1274102 c!123800) b!1274100))

(assert (= (and b!1274102 (not c!123800)) b!1274101))

(assert (= (or b!1274100 b!1274101) bm!62604))

(declare-fun m!1170531 () Bool)

(assert (=> bm!62604 m!1170531))

(assert (=> b!1274102 m!1170517))

(assert (=> b!1274102 m!1170517))

(assert (=> b!1274102 m!1170519))

(assert (=> b!1274009 d!139981))

(declare-fun condMapEmpty!51350 () Bool)

(declare-fun mapDefault!51350 () ValueCell!15713)

(assert (=> mapNonEmpty!51341 (= condMapEmpty!51350 (= mapRest!51341 ((as const (Array (_ BitVec 32) ValueCell!15713)) mapDefault!51350)))))

(declare-fun e!727076 () Bool)

(declare-fun mapRes!51350 () Bool)

(assert (=> mapNonEmpty!51341 (= tp!97857 (and e!727076 mapRes!51350))))

(declare-fun b!1274110 () Bool)

(assert (=> b!1274110 (= e!727076 tp_is_empty!33133)))

(declare-fun b!1274109 () Bool)

(declare-fun e!727077 () Bool)

(assert (=> b!1274109 (= e!727077 tp_is_empty!33133)))

(declare-fun mapNonEmpty!51350 () Bool)

(declare-fun tp!97872 () Bool)

(assert (=> mapNonEmpty!51350 (= mapRes!51350 (and tp!97872 e!727077))))

(declare-fun mapRest!51350 () (Array (_ BitVec 32) ValueCell!15713))

(declare-fun mapValue!51350 () ValueCell!15713)

(declare-fun mapKey!51350 () (_ BitVec 32))

(assert (=> mapNonEmpty!51350 (= mapRest!51341 (store mapRest!51350 mapKey!51350 mapValue!51350))))

(declare-fun mapIsEmpty!51350 () Bool)

(assert (=> mapIsEmpty!51350 mapRes!51350))

(assert (= (and mapNonEmpty!51341 condMapEmpty!51350) mapIsEmpty!51350))

(assert (= (and mapNonEmpty!51341 (not condMapEmpty!51350)) mapNonEmpty!51350))

(assert (= (and mapNonEmpty!51350 ((_ is ValueCellFull!15713) mapValue!51350)) b!1274109))

(assert (= (and mapNonEmpty!51341 ((_ is ValueCellFull!15713) mapDefault!51350)) b!1274110))

(declare-fun m!1170533 () Bool)

(assert (=> mapNonEmpty!51350 m!1170533))

(check-sat (not b!1274089) (not bm!62604) (not b!1274090) (not b!1274071) (not b!1274081) (not mapNonEmpty!51350) (not b!1274102) (not bm!62601) (not b_next!27763) (not b!1274070) (not b!1274082) b_and!45801 (not d!139975) tp_is_empty!33133)
(check-sat b_and!45801 (not b_next!27763))
