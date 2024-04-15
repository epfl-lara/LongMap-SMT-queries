; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18752 () Bool)

(assert start!18752)

(declare-fun b!185121 () Bool)

(declare-fun b_free!4561 () Bool)

(declare-fun b_next!4561 () Bool)

(assert (=> b!185121 (= b_free!4561 (not b_next!4561))))

(declare-fun tp!16475 () Bool)

(declare-fun b_and!11133 () Bool)

(assert (=> b!185121 (= tp!16475 b_and!11133)))

(declare-fun b!185112 () Bool)

(declare-fun res!87532 () Bool)

(declare-fun e!121819 () Bool)

(assert (=> b!185112 (=> (not res!87532) (not e!121819))))

(declare-datatypes ((V!5425 0))(
  ( (V!5426 (val!2211 Int)) )
))
(declare-datatypes ((ValueCell!1823 0))(
  ( (ValueCellFull!1823 (v!4114 V!5425)) (EmptyCell!1823) )
))
(declare-datatypes ((array!7851 0))(
  ( (array!7852 (arr!3706 (Array (_ BitVec 32) (_ BitVec 64))) (size!4023 (_ BitVec 32))) )
))
(declare-datatypes ((array!7853 0))(
  ( (array!7854 (arr!3707 (Array (_ BitVec 32) ValueCell!1823)) (size!4024 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2554 0))(
  ( (LongMapFixedSize!2555 (defaultEntry!3777 Int) (mask!8879 (_ BitVec 32)) (extraKeys!3514 (_ BitVec 32)) (zeroValue!3618 V!5425) (minValue!3618 V!5425) (_size!1326 (_ BitVec 32)) (_keys!5713 array!7851) (_values!3760 array!7853) (_vacant!1326 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2554)

(assert (=> b!185112 (= res!87532 (and (= (size!4024 (_values!3760 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8879 thiss!1248))) (= (size!4023 (_keys!5713 thiss!1248)) (size!4024 (_values!3760 thiss!1248))) (bvsge (mask!8879 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3514 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3514 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185113 () Bool)

(declare-fun res!87529 () Bool)

(assert (=> b!185113 (=> (not res!87529) (not e!121819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7851 (_ BitVec 32)) Bool)

(assert (=> b!185113 (= res!87529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)))))

(declare-fun b!185114 () Bool)

(declare-fun res!87528 () Bool)

(assert (=> b!185114 (=> (not res!87528) (not e!121819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185114 (= res!87528 (validMask!0 (mask!8879 thiss!1248)))))

(declare-fun b!185116 () Bool)

(declare-fun e!121814 () Bool)

(declare-fun tp_is_empty!4333 () Bool)

(assert (=> b!185116 (= e!121814 tp_is_empty!4333)))

(declare-fun b!185117 () Bool)

(declare-fun res!87534 () Bool)

(assert (=> b!185117 (=> (not res!87534) (not e!121819))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3410 0))(
  ( (tuple2!3411 (_1!1716 (_ BitVec 64)) (_2!1716 V!5425)) )
))
(declare-datatypes ((List!2346 0))(
  ( (Nil!2343) (Cons!2342 (h!2975 tuple2!3410) (t!7217 List!2346)) )
))
(declare-datatypes ((ListLongMap!2319 0))(
  ( (ListLongMap!2320 (toList!1175 List!2346)) )
))
(declare-fun contains!1275 (ListLongMap!2319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!808 (array!7851 array!7853 (_ BitVec 32) (_ BitVec 32) V!5425 V!5425 (_ BitVec 32) Int) ListLongMap!2319)

(assert (=> b!185117 (= res!87534 (not (contains!1275 (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!7455 () Bool)

(declare-fun mapRes!7455 () Bool)

(assert (=> mapIsEmpty!7455 mapRes!7455))

(declare-fun b!185118 () Bool)

(declare-fun res!87530 () Bool)

(declare-fun e!121818 () Bool)

(assert (=> b!185118 (=> (not res!87530) (not e!121818))))

(assert (=> b!185118 (= res!87530 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185119 () Bool)

(declare-datatypes ((List!2347 0))(
  ( (Nil!2344) (Cons!2343 (h!2976 (_ BitVec 64)) (t!7218 List!2347)) )
))
(declare-fun arrayNoDuplicates!0 (array!7851 (_ BitVec 32) List!2347) Bool)

(assert (=> b!185119 (= e!121819 (not (arrayNoDuplicates!0 (_keys!5713 thiss!1248) #b00000000000000000000000000000000 Nil!2344)))))

(declare-fun mapNonEmpty!7455 () Bool)

(declare-fun tp!16476 () Bool)

(declare-fun e!121820 () Bool)

(assert (=> mapNonEmpty!7455 (= mapRes!7455 (and tp!16476 e!121820))))

(declare-fun mapRest!7455 () (Array (_ BitVec 32) ValueCell!1823))

(declare-fun mapValue!7455 () ValueCell!1823)

(declare-fun mapKey!7455 () (_ BitVec 32))

(assert (=> mapNonEmpty!7455 (= (arr!3707 (_values!3760 thiss!1248)) (store mapRest!7455 mapKey!7455 mapValue!7455))))

(declare-fun b!185120 () Bool)

(declare-fun e!121815 () Bool)

(assert (=> b!185120 (= e!121815 (and e!121814 mapRes!7455))))

(declare-fun condMapEmpty!7455 () Bool)

(declare-fun mapDefault!7455 () ValueCell!1823)

(assert (=> b!185120 (= condMapEmpty!7455 (= (arr!3707 (_values!3760 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1823)) mapDefault!7455)))))

(declare-fun res!87533 () Bool)

(assert (=> start!18752 (=> (not res!87533) (not e!121818))))

(declare-fun valid!1073 (LongMapFixedSize!2554) Bool)

(assert (=> start!18752 (= res!87533 (valid!1073 thiss!1248))))

(assert (=> start!18752 e!121818))

(declare-fun e!121816 () Bool)

(assert (=> start!18752 e!121816))

(assert (=> start!18752 true))

(declare-fun b!185115 () Bool)

(assert (=> b!185115 (= e!121818 e!121819)))

(declare-fun res!87531 () Bool)

(assert (=> b!185115 (=> (not res!87531) (not e!121819))))

(declare-datatypes ((SeekEntryResult!633 0))(
  ( (MissingZero!633 (index!4702 (_ BitVec 32))) (Found!633 (index!4703 (_ BitVec 32))) (Intermediate!633 (undefined!1445 Bool) (index!4704 (_ BitVec 32)) (x!20126 (_ BitVec 32))) (Undefined!633) (MissingVacant!633 (index!4705 (_ BitVec 32))) )
))
(declare-fun lt!91463 () SeekEntryResult!633)

(get-info :version)

(assert (=> b!185115 (= res!87531 (and (not ((_ is Undefined!633) lt!91463)) (not ((_ is MissingVacant!633) lt!91463)) (not ((_ is MissingZero!633) lt!91463)) ((_ is Found!633) lt!91463)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7851 (_ BitVec 32)) SeekEntryResult!633)

(assert (=> b!185115 (= lt!91463 (seekEntryOrOpen!0 key!828 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)))))

(declare-fun array_inv!2399 (array!7851) Bool)

(declare-fun array_inv!2400 (array!7853) Bool)

(assert (=> b!185121 (= e!121816 (and tp!16475 tp_is_empty!4333 (array_inv!2399 (_keys!5713 thiss!1248)) (array_inv!2400 (_values!3760 thiss!1248)) e!121815))))

(declare-fun b!185122 () Bool)

(assert (=> b!185122 (= e!121820 tp_is_empty!4333)))

(assert (= (and start!18752 res!87533) b!185118))

(assert (= (and b!185118 res!87530) b!185115))

(assert (= (and b!185115 res!87531) b!185117))

(assert (= (and b!185117 res!87534) b!185114))

(assert (= (and b!185114 res!87528) b!185112))

(assert (= (and b!185112 res!87532) b!185113))

(assert (= (and b!185113 res!87529) b!185119))

(assert (= (and b!185120 condMapEmpty!7455) mapIsEmpty!7455))

(assert (= (and b!185120 (not condMapEmpty!7455)) mapNonEmpty!7455))

(assert (= (and mapNonEmpty!7455 ((_ is ValueCellFull!1823) mapValue!7455)) b!185122))

(assert (= (and b!185120 ((_ is ValueCellFull!1823) mapDefault!7455)) b!185116))

(assert (= b!185121 b!185120))

(assert (= start!18752 b!185121))

(declare-fun m!211927 () Bool)

(assert (=> b!185117 m!211927))

(assert (=> b!185117 m!211927))

(declare-fun m!211929 () Bool)

(assert (=> b!185117 m!211929))

(declare-fun m!211931 () Bool)

(assert (=> b!185114 m!211931))

(declare-fun m!211933 () Bool)

(assert (=> mapNonEmpty!7455 m!211933))

(declare-fun m!211935 () Bool)

(assert (=> b!185119 m!211935))

(declare-fun m!211937 () Bool)

(assert (=> b!185115 m!211937))

(declare-fun m!211939 () Bool)

(assert (=> b!185121 m!211939))

(declare-fun m!211941 () Bool)

(assert (=> b!185121 m!211941))

(declare-fun m!211943 () Bool)

(assert (=> start!18752 m!211943))

(declare-fun m!211945 () Bool)

(assert (=> b!185113 m!211945))

(check-sat (not start!18752) b_and!11133 tp_is_empty!4333 (not b!185119) (not b!185114) (not b!185117) (not mapNonEmpty!7455) (not b_next!4561) (not b!185115) (not b!185113) (not b!185121))
(check-sat b_and!11133 (not b_next!4561))
(get-model)

(declare-fun d!54949 () Bool)

(declare-fun res!87582 () Bool)

(declare-fun e!121871 () Bool)

(assert (=> d!54949 (=> res!87582 e!121871)))

(assert (=> d!54949 (= res!87582 (bvsge #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))

(assert (=> d!54949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)) e!121871)))

(declare-fun b!185197 () Bool)

(declare-fun e!121870 () Bool)

(declare-fun e!121869 () Bool)

(assert (=> b!185197 (= e!121870 e!121869)))

(declare-fun lt!91478 () (_ BitVec 64))

(assert (=> b!185197 (= lt!91478 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5559 0))(
  ( (Unit!5560) )
))
(declare-fun lt!91476 () Unit!5559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7851 (_ BitVec 64) (_ BitVec 32)) Unit!5559)

(assert (=> b!185197 (= lt!91476 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5713 thiss!1248) lt!91478 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185197 (arrayContainsKey!0 (_keys!5713 thiss!1248) lt!91478 #b00000000000000000000000000000000)))

(declare-fun lt!91477 () Unit!5559)

(assert (=> b!185197 (= lt!91477 lt!91476)))

(declare-fun res!87581 () Bool)

(assert (=> b!185197 (= res!87581 (= (seekEntryOrOpen!0 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000) (_keys!5713 thiss!1248) (mask!8879 thiss!1248)) (Found!633 #b00000000000000000000000000000000)))))

(assert (=> b!185197 (=> (not res!87581) (not e!121869))))

(declare-fun b!185198 () Bool)

(assert (=> b!185198 (= e!121871 e!121870)))

(declare-fun c!33227 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185198 (= c!33227 (validKeyInArray!0 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185199 () Bool)

(declare-fun call!18664 () Bool)

(assert (=> b!185199 (= e!121869 call!18664)))

(declare-fun b!185200 () Bool)

(assert (=> b!185200 (= e!121870 call!18664)))

(declare-fun bm!18661 () Bool)

(assert (=> bm!18661 (= call!18664 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5713 thiss!1248) (mask!8879 thiss!1248)))))

(assert (= (and d!54949 (not res!87582)) b!185198))

(assert (= (and b!185198 c!33227) b!185197))

(assert (= (and b!185198 (not c!33227)) b!185200))

(assert (= (and b!185197 res!87581) b!185199))

(assert (= (or b!185199 b!185200) bm!18661))

(declare-fun m!211987 () Bool)

(assert (=> b!185197 m!211987))

(declare-fun m!211989 () Bool)

(assert (=> b!185197 m!211989))

(declare-fun m!211991 () Bool)

(assert (=> b!185197 m!211991))

(assert (=> b!185197 m!211987))

(declare-fun m!211993 () Bool)

(assert (=> b!185197 m!211993))

(assert (=> b!185198 m!211987))

(assert (=> b!185198 m!211987))

(declare-fun m!211995 () Bool)

(assert (=> b!185198 m!211995))

(declare-fun m!211997 () Bool)

(assert (=> bm!18661 m!211997))

(assert (=> b!185113 d!54949))

(declare-fun d!54951 () Bool)

(assert (=> d!54951 (= (array_inv!2399 (_keys!5713 thiss!1248)) (bvsge (size!4023 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185121 d!54951))

(declare-fun d!54953 () Bool)

(assert (=> d!54953 (= (array_inv!2400 (_values!3760 thiss!1248)) (bvsge (size!4024 (_values!3760 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185121 d!54953))

(declare-fun d!54955 () Bool)

(declare-fun e!121876 () Bool)

(assert (=> d!54955 e!121876))

(declare-fun res!87585 () Bool)

(assert (=> d!54955 (=> res!87585 e!121876)))

(declare-fun lt!91489 () Bool)

(assert (=> d!54955 (= res!87585 (not lt!91489))))

(declare-fun lt!91488 () Bool)

(assert (=> d!54955 (= lt!91489 lt!91488)))

(declare-fun lt!91487 () Unit!5559)

(declare-fun e!121877 () Unit!5559)

(assert (=> d!54955 (= lt!91487 e!121877)))

(declare-fun c!33230 () Bool)

(assert (=> d!54955 (= c!33230 lt!91488)))

(declare-fun containsKey!224 (List!2346 (_ BitVec 64)) Bool)

(assert (=> d!54955 (= lt!91488 (containsKey!224 (toList!1175 (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828))))

(assert (=> d!54955 (= (contains!1275 (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) key!828) lt!91489)))

(declare-fun b!185207 () Bool)

(declare-fun lt!91490 () Unit!5559)

(assert (=> b!185207 (= e!121877 lt!91490)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!173 (List!2346 (_ BitVec 64)) Unit!5559)

(assert (=> b!185207 (= lt!91490 (lemmaContainsKeyImpliesGetValueByKeyDefined!173 (toList!1175 (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828))))

(declare-datatypes ((Option!226 0))(
  ( (Some!225 (v!4117 V!5425)) (None!224) )
))
(declare-fun isDefined!174 (Option!226) Bool)

(declare-fun getValueByKey!220 (List!2346 (_ BitVec 64)) Option!226)

(assert (=> b!185207 (isDefined!174 (getValueByKey!220 (toList!1175 (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828))))

(declare-fun b!185208 () Bool)

(declare-fun Unit!5561 () Unit!5559)

(assert (=> b!185208 (= e!121877 Unit!5561)))

(declare-fun b!185209 () Bool)

(assert (=> b!185209 (= e!121876 (isDefined!174 (getValueByKey!220 (toList!1175 (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828)))))

(assert (= (and d!54955 c!33230) b!185207))

(assert (= (and d!54955 (not c!33230)) b!185208))

(assert (= (and d!54955 (not res!87585)) b!185209))

(declare-fun m!211999 () Bool)

(assert (=> d!54955 m!211999))

(declare-fun m!212001 () Bool)

(assert (=> b!185207 m!212001))

(declare-fun m!212003 () Bool)

(assert (=> b!185207 m!212003))

(assert (=> b!185207 m!212003))

(declare-fun m!212005 () Bool)

(assert (=> b!185207 m!212005))

(assert (=> b!185209 m!212003))

(assert (=> b!185209 m!212003))

(assert (=> b!185209 m!212005))

(assert (=> b!185117 d!54955))

(declare-fun b!185252 () Bool)

(declare-fun e!121912 () ListLongMap!2319)

(declare-fun call!18680 () ListLongMap!2319)

(declare-fun +!282 (ListLongMap!2319 tuple2!3410) ListLongMap!2319)

(assert (=> b!185252 (= e!121912 (+!282 call!18680 (tuple2!3411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3618 thiss!1248))))))

(declare-fun bm!18677 () Bool)

(declare-fun call!18682 () Bool)

(declare-fun lt!91543 () ListLongMap!2319)

(assert (=> bm!18677 (= call!18682 (contains!1275 lt!91543 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18678 () Bool)

(declare-fun call!18685 () ListLongMap!2319)

(declare-fun call!18684 () ListLongMap!2319)

(assert (=> bm!18678 (= call!18685 call!18684)))

(declare-fun b!185253 () Bool)

(declare-fun e!121915 () Bool)

(declare-fun call!18679 () Bool)

(assert (=> b!185253 (= e!121915 (not call!18679))))

(declare-fun b!185254 () Bool)

(declare-fun e!121913 () Bool)

(declare-fun apply!165 (ListLongMap!2319 (_ BitVec 64)) V!5425)

(declare-fun get!2132 (ValueCell!1823 V!5425) V!5425)

(declare-fun dynLambda!499 (Int (_ BitVec 64)) V!5425)

(assert (=> b!185254 (= e!121913 (= (apply!165 lt!91543 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)) (get!2132 (select (arr!3707 (_values!3760 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!499 (defaultEntry!3777 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4024 (_values!3760 thiss!1248))))))

(assert (=> b!185254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))

(declare-fun b!185255 () Bool)

(declare-fun e!121904 () Bool)

(assert (=> b!185255 (= e!121904 (not call!18682))))

(declare-fun b!185256 () Bool)

(declare-fun e!121916 () Bool)

(assert (=> b!185256 (= e!121916 e!121913)))

(declare-fun res!87612 () Bool)

(assert (=> b!185256 (=> (not res!87612) (not e!121913))))

(assert (=> b!185256 (= res!87612 (contains!1275 lt!91543 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))

(declare-fun b!185257 () Bool)

(declare-fun e!121911 () Bool)

(assert (=> b!185257 (= e!121911 e!121904)))

(declare-fun c!33243 () Bool)

(assert (=> b!185257 (= c!33243 (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18679 () Bool)

(declare-fun call!18683 () ListLongMap!2319)

(assert (=> bm!18679 (= call!18683 call!18680)))

(declare-fun b!185258 () Bool)

(declare-fun e!121914 () ListLongMap!2319)

(declare-fun call!18681 () ListLongMap!2319)

(assert (=> b!185258 (= e!121914 call!18681)))

(declare-fun b!185259 () Bool)

(declare-fun e!121908 () Bool)

(assert (=> b!185259 (= e!121908 (validKeyInArray!0 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185260 () Bool)

(declare-fun res!87607 () Bool)

(assert (=> b!185260 (=> (not res!87607) (not e!121911))))

(assert (=> b!185260 (= res!87607 e!121916)))

(declare-fun res!87609 () Bool)

(assert (=> b!185260 (=> res!87609 e!121916)))

(assert (=> b!185260 (= res!87609 (not e!121908))))

(declare-fun res!87604 () Bool)

(assert (=> b!185260 (=> (not res!87604) (not e!121908))))

(assert (=> b!185260 (= res!87604 (bvslt #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))

(declare-fun b!185261 () Bool)

(declare-fun e!121906 () Bool)

(assert (=> b!185261 (= e!121904 e!121906)))

(declare-fun res!87605 () Bool)

(assert (=> b!185261 (= res!87605 call!18682)))

(assert (=> b!185261 (=> (not res!87605) (not e!121906))))

(declare-fun b!185262 () Bool)

(declare-fun e!121907 () Unit!5559)

(declare-fun lt!91540 () Unit!5559)

(assert (=> b!185262 (= e!121907 lt!91540)))

(declare-fun lt!91545 () ListLongMap!2319)

(declare-fun getCurrentListMapNoExtraKeys!186 (array!7851 array!7853 (_ BitVec 32) (_ BitVec 32) V!5425 V!5425 (_ BitVec 32) Int) ListLongMap!2319)

(assert (=> b!185262 (= lt!91545 (getCurrentListMapNoExtraKeys!186 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91555 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91550 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91550 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91538 () Unit!5559)

(declare-fun addStillContains!141 (ListLongMap!2319 (_ BitVec 64) V!5425 (_ BitVec 64)) Unit!5559)

(assert (=> b!185262 (= lt!91538 (addStillContains!141 lt!91545 lt!91555 (zeroValue!3618 thiss!1248) lt!91550))))

(assert (=> b!185262 (contains!1275 (+!282 lt!91545 (tuple2!3411 lt!91555 (zeroValue!3618 thiss!1248))) lt!91550)))

(declare-fun lt!91556 () Unit!5559)

(assert (=> b!185262 (= lt!91556 lt!91538)))

(declare-fun lt!91542 () ListLongMap!2319)

(assert (=> b!185262 (= lt!91542 (getCurrentListMapNoExtraKeys!186 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91544 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91544 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91535 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91535 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91546 () Unit!5559)

(declare-fun addApplyDifferent!141 (ListLongMap!2319 (_ BitVec 64) V!5425 (_ BitVec 64)) Unit!5559)

(assert (=> b!185262 (= lt!91546 (addApplyDifferent!141 lt!91542 lt!91544 (minValue!3618 thiss!1248) lt!91535))))

(assert (=> b!185262 (= (apply!165 (+!282 lt!91542 (tuple2!3411 lt!91544 (minValue!3618 thiss!1248))) lt!91535) (apply!165 lt!91542 lt!91535))))

(declare-fun lt!91549 () Unit!5559)

(assert (=> b!185262 (= lt!91549 lt!91546)))

(declare-fun lt!91551 () ListLongMap!2319)

(assert (=> b!185262 (= lt!91551 (getCurrentListMapNoExtraKeys!186 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91537 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91539 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91539 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91553 () Unit!5559)

(assert (=> b!185262 (= lt!91553 (addApplyDifferent!141 lt!91551 lt!91537 (zeroValue!3618 thiss!1248) lt!91539))))

(assert (=> b!185262 (= (apply!165 (+!282 lt!91551 (tuple2!3411 lt!91537 (zeroValue!3618 thiss!1248))) lt!91539) (apply!165 lt!91551 lt!91539))))

(declare-fun lt!91548 () Unit!5559)

(assert (=> b!185262 (= lt!91548 lt!91553)))

(declare-fun lt!91547 () ListLongMap!2319)

(assert (=> b!185262 (= lt!91547 (getCurrentListMapNoExtraKeys!186 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91554 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91554 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91541 () (_ BitVec 64))

(assert (=> b!185262 (= lt!91541 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185262 (= lt!91540 (addApplyDifferent!141 lt!91547 lt!91554 (minValue!3618 thiss!1248) lt!91541))))

(assert (=> b!185262 (= (apply!165 (+!282 lt!91547 (tuple2!3411 lt!91554 (minValue!3618 thiss!1248))) lt!91541) (apply!165 lt!91547 lt!91541))))

(declare-fun c!33248 () Bool)

(declare-fun bm!18680 () Bool)

(declare-fun c!33247 () Bool)

(assert (=> bm!18680 (= call!18680 (+!282 (ite c!33248 call!18684 (ite c!33247 call!18685 call!18681)) (ite (or c!33248 c!33247) (tuple2!3411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3618 thiss!1248)) (tuple2!3411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3618 thiss!1248)))))))

(declare-fun bm!18681 () Bool)

(assert (=> bm!18681 (= call!18679 (contains!1275 lt!91543 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185263 () Bool)

(assert (=> b!185263 (= e!121906 (= (apply!165 lt!91543 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3618 thiss!1248)))))

(declare-fun bm!18676 () Bool)

(assert (=> bm!18676 (= call!18684 (getCurrentListMapNoExtraKeys!186 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun d!54957 () Bool)

(assert (=> d!54957 e!121911))

(declare-fun res!87606 () Bool)

(assert (=> d!54957 (=> (not res!87606) (not e!121911))))

(assert (=> d!54957 (= res!87606 (or (bvsge #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))))

(declare-fun lt!91536 () ListLongMap!2319)

(assert (=> d!54957 (= lt!91543 lt!91536)))

(declare-fun lt!91552 () Unit!5559)

(assert (=> d!54957 (= lt!91552 e!121907)))

(declare-fun c!33244 () Bool)

(declare-fun e!121905 () Bool)

(assert (=> d!54957 (= c!33244 e!121905)))

(declare-fun res!87610 () Bool)

(assert (=> d!54957 (=> (not res!87610) (not e!121905))))

(assert (=> d!54957 (= res!87610 (bvslt #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))

(assert (=> d!54957 (= lt!91536 e!121912)))

(assert (=> d!54957 (= c!33248 (and (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54957 (validMask!0 (mask!8879 thiss!1248))))

(assert (=> d!54957 (= (getCurrentListMap!808 (_keys!5713 thiss!1248) (_values!3760 thiss!1248) (mask!8879 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) lt!91543)))

(declare-fun b!185264 () Bool)

(declare-fun e!121909 () ListLongMap!2319)

(assert (=> b!185264 (= e!121909 call!18683)))

(declare-fun bm!18682 () Bool)

(assert (=> bm!18682 (= call!18681 call!18685)))

(declare-fun b!185265 () Bool)

(assert (=> b!185265 (= e!121912 e!121909)))

(assert (=> b!185265 (= c!33247 (and (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185266 () Bool)

(declare-fun e!121910 () Bool)

(assert (=> b!185266 (= e!121915 e!121910)))

(declare-fun res!87611 () Bool)

(assert (=> b!185266 (= res!87611 call!18679)))

(assert (=> b!185266 (=> (not res!87611) (not e!121910))))

(declare-fun b!185267 () Bool)

(declare-fun c!33245 () Bool)

(assert (=> b!185267 (= c!33245 (and (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!185267 (= e!121909 e!121914)))

(declare-fun b!185268 () Bool)

(declare-fun Unit!5562 () Unit!5559)

(assert (=> b!185268 (= e!121907 Unit!5562)))

(declare-fun b!185269 () Bool)

(assert (=> b!185269 (= e!121914 call!18683)))

(declare-fun b!185270 () Bool)

(assert (=> b!185270 (= e!121910 (= (apply!165 lt!91543 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3618 thiss!1248)))))

(declare-fun b!185271 () Bool)

(assert (=> b!185271 (= e!121905 (validKeyInArray!0 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185272 () Bool)

(declare-fun res!87608 () Bool)

(assert (=> b!185272 (=> (not res!87608) (not e!121911))))

(assert (=> b!185272 (= res!87608 e!121915)))

(declare-fun c!33246 () Bool)

(assert (=> b!185272 (= c!33246 (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!54957 c!33248) b!185252))

(assert (= (and d!54957 (not c!33248)) b!185265))

(assert (= (and b!185265 c!33247) b!185264))

(assert (= (and b!185265 (not c!33247)) b!185267))

(assert (= (and b!185267 c!33245) b!185269))

(assert (= (and b!185267 (not c!33245)) b!185258))

(assert (= (or b!185269 b!185258) bm!18682))

(assert (= (or b!185264 bm!18682) bm!18678))

(assert (= (or b!185264 b!185269) bm!18679))

(assert (= (or b!185252 bm!18678) bm!18676))

(assert (= (or b!185252 bm!18679) bm!18680))

(assert (= (and d!54957 res!87610) b!185271))

(assert (= (and d!54957 c!33244) b!185262))

(assert (= (and d!54957 (not c!33244)) b!185268))

(assert (= (and d!54957 res!87606) b!185260))

(assert (= (and b!185260 res!87604) b!185259))

(assert (= (and b!185260 (not res!87609)) b!185256))

(assert (= (and b!185256 res!87612) b!185254))

(assert (= (and b!185260 res!87607) b!185272))

(assert (= (and b!185272 c!33246) b!185266))

(assert (= (and b!185272 (not c!33246)) b!185253))

(assert (= (and b!185266 res!87611) b!185270))

(assert (= (or b!185266 b!185253) bm!18681))

(assert (= (and b!185272 res!87608) b!185257))

(assert (= (and b!185257 c!33243) b!185261))

(assert (= (and b!185257 (not c!33243)) b!185255))

(assert (= (and b!185261 res!87605) b!185263))

(assert (= (or b!185261 b!185255) bm!18677))

(declare-fun b_lambda!7229 () Bool)

(assert (=> (not b_lambda!7229) (not b!185254)))

(declare-fun t!7221 () Bool)

(declare-fun tb!2833 () Bool)

(assert (=> (and b!185121 (= (defaultEntry!3777 thiss!1248) (defaultEntry!3777 thiss!1248)) t!7221) tb!2833))

(declare-fun result!4793 () Bool)

(assert (=> tb!2833 (= result!4793 tp_is_empty!4333)))

(assert (=> b!185254 t!7221))

(declare-fun b_and!11139 () Bool)

(assert (= b_and!11133 (and (=> t!7221 result!4793) b_and!11139)))

(declare-fun m!212007 () Bool)

(assert (=> b!185252 m!212007))

(assert (=> b!185271 m!211987))

(assert (=> b!185271 m!211987))

(assert (=> b!185271 m!211995))

(assert (=> d!54957 m!211931))

(declare-fun m!212009 () Bool)

(assert (=> bm!18680 m!212009))

(declare-fun m!212011 () Bool)

(assert (=> b!185263 m!212011))

(declare-fun m!212013 () Bool)

(assert (=> b!185254 m!212013))

(declare-fun m!212015 () Bool)

(assert (=> b!185254 m!212015))

(declare-fun m!212017 () Bool)

(assert (=> b!185254 m!212017))

(assert (=> b!185254 m!212013))

(assert (=> b!185254 m!211987))

(assert (=> b!185254 m!212015))

(assert (=> b!185254 m!211987))

(declare-fun m!212019 () Bool)

(assert (=> b!185254 m!212019))

(declare-fun m!212021 () Bool)

(assert (=> bm!18681 m!212021))

(assert (=> b!185259 m!211987))

(assert (=> b!185259 m!211987))

(assert (=> b!185259 m!211995))

(declare-fun m!212023 () Bool)

(assert (=> bm!18677 m!212023))

(declare-fun m!212025 () Bool)

(assert (=> bm!18676 m!212025))

(declare-fun m!212027 () Bool)

(assert (=> b!185262 m!212027))

(declare-fun m!212029 () Bool)

(assert (=> b!185262 m!212029))

(assert (=> b!185262 m!212025))

(declare-fun m!212031 () Bool)

(assert (=> b!185262 m!212031))

(declare-fun m!212033 () Bool)

(assert (=> b!185262 m!212033))

(declare-fun m!212035 () Bool)

(assert (=> b!185262 m!212035))

(declare-fun m!212037 () Bool)

(assert (=> b!185262 m!212037))

(declare-fun m!212039 () Bool)

(assert (=> b!185262 m!212039))

(declare-fun m!212041 () Bool)

(assert (=> b!185262 m!212041))

(declare-fun m!212043 () Bool)

(assert (=> b!185262 m!212043))

(declare-fun m!212045 () Bool)

(assert (=> b!185262 m!212045))

(declare-fun m!212047 () Bool)

(assert (=> b!185262 m!212047))

(declare-fun m!212049 () Bool)

(assert (=> b!185262 m!212049))

(assert (=> b!185262 m!212043))

(declare-fun m!212051 () Bool)

(assert (=> b!185262 m!212051))

(assert (=> b!185262 m!212033))

(declare-fun m!212053 () Bool)

(assert (=> b!185262 m!212053))

(assert (=> b!185262 m!212047))

(declare-fun m!212055 () Bool)

(assert (=> b!185262 m!212055))

(assert (=> b!185262 m!211987))

(assert (=> b!185262 m!212039))

(assert (=> b!185256 m!211987))

(assert (=> b!185256 m!211987))

(declare-fun m!212057 () Bool)

(assert (=> b!185256 m!212057))

(declare-fun m!212059 () Bool)

(assert (=> b!185270 m!212059))

(assert (=> b!185117 d!54957))

(declare-fun d!54959 () Bool)

(declare-fun res!87619 () Bool)

(declare-fun e!121919 () Bool)

(assert (=> d!54959 (=> (not res!87619) (not e!121919))))

(declare-fun simpleValid!181 (LongMapFixedSize!2554) Bool)

(assert (=> d!54959 (= res!87619 (simpleValid!181 thiss!1248))))

(assert (=> d!54959 (= (valid!1073 thiss!1248) e!121919)))

(declare-fun b!185281 () Bool)

(declare-fun res!87620 () Bool)

(assert (=> b!185281 (=> (not res!87620) (not e!121919))))

(declare-fun arrayCountValidKeys!0 (array!7851 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185281 (= res!87620 (= (arrayCountValidKeys!0 (_keys!5713 thiss!1248) #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))) (_size!1326 thiss!1248)))))

(declare-fun b!185282 () Bool)

(declare-fun res!87621 () Bool)

(assert (=> b!185282 (=> (not res!87621) (not e!121919))))

(assert (=> b!185282 (= res!87621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)))))

(declare-fun b!185283 () Bool)

(assert (=> b!185283 (= e!121919 (arrayNoDuplicates!0 (_keys!5713 thiss!1248) #b00000000000000000000000000000000 Nil!2344))))

(assert (= (and d!54959 res!87619) b!185281))

(assert (= (and b!185281 res!87620) b!185282))

(assert (= (and b!185282 res!87621) b!185283))

(declare-fun m!212061 () Bool)

(assert (=> d!54959 m!212061))

(declare-fun m!212063 () Bool)

(assert (=> b!185281 m!212063))

(assert (=> b!185282 m!211945))

(assert (=> b!185283 m!211935))

(assert (=> start!18752 d!54959))

(declare-fun b!185296 () Bool)

(declare-fun e!121927 () SeekEntryResult!633)

(declare-fun lt!91564 () SeekEntryResult!633)

(assert (=> b!185296 (= e!121927 (MissingZero!633 (index!4704 lt!91564)))))

(declare-fun b!185297 () Bool)

(declare-fun e!121928 () SeekEntryResult!633)

(assert (=> b!185297 (= e!121928 Undefined!633)))

(declare-fun b!185298 () Bool)

(declare-fun e!121926 () SeekEntryResult!633)

(assert (=> b!185298 (= e!121928 e!121926)))

(declare-fun lt!91565 () (_ BitVec 64))

(assert (=> b!185298 (= lt!91565 (select (arr!3706 (_keys!5713 thiss!1248)) (index!4704 lt!91564)))))

(declare-fun c!33255 () Bool)

(assert (=> b!185298 (= c!33255 (= lt!91565 key!828))))

(declare-fun d!54961 () Bool)

(declare-fun lt!91563 () SeekEntryResult!633)

(assert (=> d!54961 (and (or ((_ is Undefined!633) lt!91563) (not ((_ is Found!633) lt!91563)) (and (bvsge (index!4703 lt!91563) #b00000000000000000000000000000000) (bvslt (index!4703 lt!91563) (size!4023 (_keys!5713 thiss!1248))))) (or ((_ is Undefined!633) lt!91563) ((_ is Found!633) lt!91563) (not ((_ is MissingZero!633) lt!91563)) (and (bvsge (index!4702 lt!91563) #b00000000000000000000000000000000) (bvslt (index!4702 lt!91563) (size!4023 (_keys!5713 thiss!1248))))) (or ((_ is Undefined!633) lt!91563) ((_ is Found!633) lt!91563) ((_ is MissingZero!633) lt!91563) (not ((_ is MissingVacant!633) lt!91563)) (and (bvsge (index!4705 lt!91563) #b00000000000000000000000000000000) (bvslt (index!4705 lt!91563) (size!4023 (_keys!5713 thiss!1248))))) (or ((_ is Undefined!633) lt!91563) (ite ((_ is Found!633) lt!91563) (= (select (arr!3706 (_keys!5713 thiss!1248)) (index!4703 lt!91563)) key!828) (ite ((_ is MissingZero!633) lt!91563) (= (select (arr!3706 (_keys!5713 thiss!1248)) (index!4702 lt!91563)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!633) lt!91563) (= (select (arr!3706 (_keys!5713 thiss!1248)) (index!4705 lt!91563)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54961 (= lt!91563 e!121928)))

(declare-fun c!33257 () Bool)

(assert (=> d!54961 (= c!33257 (and ((_ is Intermediate!633) lt!91564) (undefined!1445 lt!91564)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7851 (_ BitVec 32)) SeekEntryResult!633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54961 (= lt!91564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8879 thiss!1248)) key!828 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)))))

(assert (=> d!54961 (validMask!0 (mask!8879 thiss!1248))))

(assert (=> d!54961 (= (seekEntryOrOpen!0 key!828 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)) lt!91563)))

(declare-fun b!185299 () Bool)

(assert (=> b!185299 (= e!121926 (Found!633 (index!4704 lt!91564)))))

(declare-fun b!185300 () Bool)

(declare-fun c!33256 () Bool)

(assert (=> b!185300 (= c!33256 (= lt!91565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185300 (= e!121926 e!121927)))

(declare-fun b!185301 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7851 (_ BitVec 32)) SeekEntryResult!633)

(assert (=> b!185301 (= e!121927 (seekKeyOrZeroReturnVacant!0 (x!20126 lt!91564) (index!4704 lt!91564) (index!4704 lt!91564) key!828 (_keys!5713 thiss!1248) (mask!8879 thiss!1248)))))

(assert (= (and d!54961 c!33257) b!185297))

(assert (= (and d!54961 (not c!33257)) b!185298))

(assert (= (and b!185298 c!33255) b!185299))

(assert (= (and b!185298 (not c!33255)) b!185300))

(assert (= (and b!185300 c!33256) b!185296))

(assert (= (and b!185300 (not c!33256)) b!185301))

(declare-fun m!212065 () Bool)

(assert (=> b!185298 m!212065))

(declare-fun m!212067 () Bool)

(assert (=> d!54961 m!212067))

(declare-fun m!212069 () Bool)

(assert (=> d!54961 m!212069))

(assert (=> d!54961 m!212067))

(declare-fun m!212071 () Bool)

(assert (=> d!54961 m!212071))

(declare-fun m!212073 () Bool)

(assert (=> d!54961 m!212073))

(declare-fun m!212075 () Bool)

(assert (=> d!54961 m!212075))

(assert (=> d!54961 m!211931))

(declare-fun m!212077 () Bool)

(assert (=> b!185301 m!212077))

(assert (=> b!185115 d!54961))

(declare-fun b!185312 () Bool)

(declare-fun e!121938 () Bool)

(declare-fun contains!1277 (List!2347 (_ BitVec 64)) Bool)

(assert (=> b!185312 (= e!121938 (contains!1277 Nil!2344 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54963 () Bool)

(declare-fun res!87629 () Bool)

(declare-fun e!121937 () Bool)

(assert (=> d!54963 (=> res!87629 e!121937)))

(assert (=> d!54963 (= res!87629 (bvsge #b00000000000000000000000000000000 (size!4023 (_keys!5713 thiss!1248))))))

(assert (=> d!54963 (= (arrayNoDuplicates!0 (_keys!5713 thiss!1248) #b00000000000000000000000000000000 Nil!2344) e!121937)))

(declare-fun bm!18685 () Bool)

(declare-fun call!18688 () Bool)

(declare-fun c!33260 () Bool)

(assert (=> bm!18685 (= call!18688 (arrayNoDuplicates!0 (_keys!5713 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33260 (Cons!2343 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000) Nil!2344) Nil!2344)))))

(declare-fun b!185313 () Bool)

(declare-fun e!121940 () Bool)

(declare-fun e!121939 () Bool)

(assert (=> b!185313 (= e!121940 e!121939)))

(assert (=> b!185313 (= c!33260 (validKeyInArray!0 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185314 () Bool)

(assert (=> b!185314 (= e!121937 e!121940)))

(declare-fun res!87630 () Bool)

(assert (=> b!185314 (=> (not res!87630) (not e!121940))))

(assert (=> b!185314 (= res!87630 (not e!121938))))

(declare-fun res!87628 () Bool)

(assert (=> b!185314 (=> (not res!87628) (not e!121938))))

(assert (=> b!185314 (= res!87628 (validKeyInArray!0 (select (arr!3706 (_keys!5713 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185315 () Bool)

(assert (=> b!185315 (= e!121939 call!18688)))

(declare-fun b!185316 () Bool)

(assert (=> b!185316 (= e!121939 call!18688)))

(assert (= (and d!54963 (not res!87629)) b!185314))

(assert (= (and b!185314 res!87628) b!185312))

(assert (= (and b!185314 res!87630) b!185313))

(assert (= (and b!185313 c!33260) b!185315))

(assert (= (and b!185313 (not c!33260)) b!185316))

(assert (= (or b!185315 b!185316) bm!18685))

(assert (=> b!185312 m!211987))

(assert (=> b!185312 m!211987))

(declare-fun m!212079 () Bool)

(assert (=> b!185312 m!212079))

(assert (=> bm!18685 m!211987))

(declare-fun m!212081 () Bool)

(assert (=> bm!18685 m!212081))

(assert (=> b!185313 m!211987))

(assert (=> b!185313 m!211987))

(assert (=> b!185313 m!211995))

(assert (=> b!185314 m!211987))

(assert (=> b!185314 m!211987))

(assert (=> b!185314 m!211995))

(assert (=> b!185119 d!54963))

(declare-fun d!54965 () Bool)

(assert (=> d!54965 (= (validMask!0 (mask!8879 thiss!1248)) (and (or (= (mask!8879 thiss!1248) #b00000000000000000000000000000111) (= (mask!8879 thiss!1248) #b00000000000000000000000000001111) (= (mask!8879 thiss!1248) #b00000000000000000000000000011111) (= (mask!8879 thiss!1248) #b00000000000000000000000000111111) (= (mask!8879 thiss!1248) #b00000000000000000000000001111111) (= (mask!8879 thiss!1248) #b00000000000000000000000011111111) (= (mask!8879 thiss!1248) #b00000000000000000000000111111111) (= (mask!8879 thiss!1248) #b00000000000000000000001111111111) (= (mask!8879 thiss!1248) #b00000000000000000000011111111111) (= (mask!8879 thiss!1248) #b00000000000000000000111111111111) (= (mask!8879 thiss!1248) #b00000000000000000001111111111111) (= (mask!8879 thiss!1248) #b00000000000000000011111111111111) (= (mask!8879 thiss!1248) #b00000000000000000111111111111111) (= (mask!8879 thiss!1248) #b00000000000000001111111111111111) (= (mask!8879 thiss!1248) #b00000000000000011111111111111111) (= (mask!8879 thiss!1248) #b00000000000000111111111111111111) (= (mask!8879 thiss!1248) #b00000000000001111111111111111111) (= (mask!8879 thiss!1248) #b00000000000011111111111111111111) (= (mask!8879 thiss!1248) #b00000000000111111111111111111111) (= (mask!8879 thiss!1248) #b00000000001111111111111111111111) (= (mask!8879 thiss!1248) #b00000000011111111111111111111111) (= (mask!8879 thiss!1248) #b00000000111111111111111111111111) (= (mask!8879 thiss!1248) #b00000001111111111111111111111111) (= (mask!8879 thiss!1248) #b00000011111111111111111111111111) (= (mask!8879 thiss!1248) #b00000111111111111111111111111111) (= (mask!8879 thiss!1248) #b00001111111111111111111111111111) (= (mask!8879 thiss!1248) #b00011111111111111111111111111111) (= (mask!8879 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8879 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185114 d!54965))

(declare-fun mapNonEmpty!7464 () Bool)

(declare-fun mapRes!7464 () Bool)

(declare-fun tp!16491 () Bool)

(declare-fun e!121945 () Bool)

(assert (=> mapNonEmpty!7464 (= mapRes!7464 (and tp!16491 e!121945))))

(declare-fun mapRest!7464 () (Array (_ BitVec 32) ValueCell!1823))

(declare-fun mapKey!7464 () (_ BitVec 32))

(declare-fun mapValue!7464 () ValueCell!1823)

(assert (=> mapNonEmpty!7464 (= mapRest!7455 (store mapRest!7464 mapKey!7464 mapValue!7464))))

(declare-fun mapIsEmpty!7464 () Bool)

(assert (=> mapIsEmpty!7464 mapRes!7464))

(declare-fun condMapEmpty!7464 () Bool)

(declare-fun mapDefault!7464 () ValueCell!1823)

(assert (=> mapNonEmpty!7455 (= condMapEmpty!7464 (= mapRest!7455 ((as const (Array (_ BitVec 32) ValueCell!1823)) mapDefault!7464)))))

(declare-fun e!121946 () Bool)

(assert (=> mapNonEmpty!7455 (= tp!16476 (and e!121946 mapRes!7464))))

(declare-fun b!185323 () Bool)

(assert (=> b!185323 (= e!121945 tp_is_empty!4333)))

(declare-fun b!185324 () Bool)

(assert (=> b!185324 (= e!121946 tp_is_empty!4333)))

(assert (= (and mapNonEmpty!7455 condMapEmpty!7464) mapIsEmpty!7464))

(assert (= (and mapNonEmpty!7455 (not condMapEmpty!7464)) mapNonEmpty!7464))

(assert (= (and mapNonEmpty!7464 ((_ is ValueCellFull!1823) mapValue!7464)) b!185323))

(assert (= (and mapNonEmpty!7455 ((_ is ValueCellFull!1823) mapDefault!7464)) b!185324))

(declare-fun m!212083 () Bool)

(assert (=> mapNonEmpty!7464 m!212083))

(declare-fun b_lambda!7231 () Bool)

(assert (= b_lambda!7229 (or (and b!185121 b_free!4561) b_lambda!7231)))

(check-sat tp_is_empty!4333 (not bm!18681) (not mapNonEmpty!7464) (not b!185254) (not b!185259) (not b!185271) (not b!185198) (not bm!18680) (not b!185283) (not b!185312) (not d!54955) (not bm!18685) b_and!11139 (not b!185252) (not b!185313) (not b_next!4561) (not bm!18661) (not b!185256) (not b!185314) (not b!185197) (not bm!18676) (not b!185270) (not d!54957) (not b!185209) (not b!185282) (not b!185207) (not bm!18677) (not d!54961) (not b_lambda!7231) (not d!54959) (not b!185281) (not b!185263) (not b!185262) (not b!185301))
(check-sat b_and!11139 (not b_next!4561))
