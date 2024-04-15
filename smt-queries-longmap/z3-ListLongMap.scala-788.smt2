; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18776 () Bool)

(assert start!18776)

(declare-fun b!185353 () Bool)

(declare-fun b_free!4567 () Bool)

(declare-fun b_next!4567 () Bool)

(assert (=> b!185353 (= b_free!4567 (not b_next!4567))))

(declare-fun tp!16496 () Bool)

(declare-fun b_and!11141 () Bool)

(assert (=> b!185353 (= tp!16496 b_and!11141)))

(declare-fun b!185349 () Bool)

(declare-fun res!87652 () Bool)

(declare-fun e!121967 () Bool)

(assert (=> b!185349 (=> (not res!87652) (not e!121967))))

(declare-datatypes ((V!5433 0))(
  ( (V!5434 (val!2214 Int)) )
))
(declare-datatypes ((ValueCell!1826 0))(
  ( (ValueCellFull!1826 (v!4118 V!5433)) (EmptyCell!1826) )
))
(declare-datatypes ((array!7865 0))(
  ( (array!7866 (arr!3712 (Array (_ BitVec 32) (_ BitVec 64))) (size!4029 (_ BitVec 32))) )
))
(declare-datatypes ((array!7867 0))(
  ( (array!7868 (arr!3713 (Array (_ BitVec 32) ValueCell!1826)) (size!4030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2560 0))(
  ( (LongMapFixedSize!2561 (defaultEntry!3781 Int) (mask!8888 (_ BitVec 32)) (extraKeys!3518 (_ BitVec 32)) (zeroValue!3622 V!5433) (minValue!3622 V!5433) (_size!1329 (_ BitVec 32)) (_keys!5719 array!7865) (_values!3764 array!7867) (_vacant!1329 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2560)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7865 (_ BitVec 32)) Bool)

(assert (=> b!185349 (= res!87652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)))))

(declare-fun b!185350 () Bool)

(declare-fun e!121964 () Bool)

(assert (=> b!185350 (= e!121964 e!121967)))

(declare-fun res!87654 () Bool)

(assert (=> b!185350 (=> (not res!87654) (not e!121967))))

(declare-datatypes ((SeekEntryResult!635 0))(
  ( (MissingZero!635 (index!4710 (_ BitVec 32))) (Found!635 (index!4711 (_ BitVec 32))) (Intermediate!635 (undefined!1447 Bool) (index!4712 (_ BitVec 32)) (x!20146 (_ BitVec 32))) (Undefined!635) (MissingVacant!635 (index!4713 (_ BitVec 32))) )
))
(declare-fun lt!91568 () SeekEntryResult!635)

(get-info :version)

(assert (=> b!185350 (= res!87654 (and (not ((_ is Undefined!635) lt!91568)) (not ((_ is MissingVacant!635) lt!91568)) (not ((_ is MissingZero!635) lt!91568)) ((_ is Found!635) lt!91568)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7865 (_ BitVec 32)) SeekEntryResult!635)

(assert (=> b!185350 (= lt!91568 (seekEntryOrOpen!0 key!828 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)))))

(declare-fun b!185351 () Bool)

(declare-fun res!87653 () Bool)

(assert (=> b!185351 (=> (not res!87653) (not e!121967))))

(assert (=> b!185351 (= res!87653 (and (= (size!4030 (_values!3764 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8888 thiss!1248))) (= (size!4029 (_keys!5719 thiss!1248)) (size!4030 (_values!3764 thiss!1248))) (bvsge (mask!8888 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3518 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3518 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7467 () Bool)

(declare-fun mapRes!7467 () Bool)

(assert (=> mapIsEmpty!7467 mapRes!7467))

(declare-fun b!185352 () Bool)

(declare-fun res!87651 () Bool)

(assert (=> b!185352 (=> (not res!87651) (not e!121967))))

(declare-datatypes ((List!2349 0))(
  ( (Nil!2346) (Cons!2345 (h!2978 (_ BitVec 64)) (t!7222 List!2349)) )
))
(declare-fun arrayNoDuplicates!0 (array!7865 (_ BitVec 32) List!2349) Bool)

(assert (=> b!185352 (= res!87651 (arrayNoDuplicates!0 (_keys!5719 thiss!1248) #b00000000000000000000000000000000 Nil!2346))))

(declare-fun e!121962 () Bool)

(declare-fun tp_is_empty!4339 () Bool)

(declare-fun e!121965 () Bool)

(declare-fun array_inv!2403 (array!7865) Bool)

(declare-fun array_inv!2404 (array!7867) Bool)

(assert (=> b!185353 (= e!121965 (and tp!16496 tp_is_empty!4339 (array_inv!2403 (_keys!5719 thiss!1248)) (array_inv!2404 (_values!3764 thiss!1248)) e!121962))))

(declare-fun b!185354 () Bool)

(declare-fun res!87647 () Bool)

(assert (=> b!185354 (=> (not res!87647) (not e!121967))))

(declare-datatypes ((tuple2!3414 0))(
  ( (tuple2!3415 (_1!1718 (_ BitVec 64)) (_2!1718 V!5433)) )
))
(declare-datatypes ((List!2350 0))(
  ( (Nil!2347) (Cons!2346 (h!2979 tuple2!3414) (t!7223 List!2350)) )
))
(declare-datatypes ((ListLongMap!2323 0))(
  ( (ListLongMap!2324 (toList!1177 List!2350)) )
))
(declare-fun contains!1278 (ListLongMap!2323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!810 (array!7865 array!7867 (_ BitVec 32) (_ BitVec 32) V!5433 V!5433 (_ BitVec 32) Int) ListLongMap!2323)

(assert (=> b!185354 (= res!87647 (not (contains!1278 (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)) key!828)))))

(declare-fun res!87649 () Bool)

(assert (=> start!18776 (=> (not res!87649) (not e!121964))))

(declare-fun valid!1076 (LongMapFixedSize!2560) Bool)

(assert (=> start!18776 (= res!87649 (valid!1076 thiss!1248))))

(assert (=> start!18776 e!121964))

(assert (=> start!18776 e!121965))

(assert (=> start!18776 true))

(declare-fun mapNonEmpty!7467 () Bool)

(declare-fun tp!16497 () Bool)

(declare-fun e!121961 () Bool)

(assert (=> mapNonEmpty!7467 (= mapRes!7467 (and tp!16497 e!121961))))

(declare-fun mapValue!7467 () ValueCell!1826)

(declare-fun mapKey!7467 () (_ BitVec 32))

(declare-fun mapRest!7467 () (Array (_ BitVec 32) ValueCell!1826))

(assert (=> mapNonEmpty!7467 (= (arr!3713 (_values!3764 thiss!1248)) (store mapRest!7467 mapKey!7467 mapValue!7467))))

(declare-fun b!185355 () Bool)

(assert (=> b!185355 (= e!121961 tp_is_empty!4339)))

(declare-fun b!185356 () Bool)

(declare-fun res!87648 () Bool)

(assert (=> b!185356 (=> (not res!87648) (not e!121967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185356 (= res!87648 (validMask!0 (mask!8888 thiss!1248)))))

(declare-fun b!185357 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185357 (= e!121967 (not (validKeyInArray!0 key!828)))))

(declare-fun b!185358 () Bool)

(declare-fun e!121963 () Bool)

(assert (=> b!185358 (= e!121962 (and e!121963 mapRes!7467))))

(declare-fun condMapEmpty!7467 () Bool)

(declare-fun mapDefault!7467 () ValueCell!1826)

(assert (=> b!185358 (= condMapEmpty!7467 (= (arr!3713 (_values!3764 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1826)) mapDefault!7467)))))

(declare-fun b!185359 () Bool)

(assert (=> b!185359 (= e!121963 tp_is_empty!4339)))

(declare-fun b!185360 () Bool)

(declare-fun res!87650 () Bool)

(assert (=> b!185360 (=> (not res!87650) (not e!121964))))

(assert (=> b!185360 (= res!87650 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18776 res!87649) b!185360))

(assert (= (and b!185360 res!87650) b!185350))

(assert (= (and b!185350 res!87654) b!185354))

(assert (= (and b!185354 res!87647) b!185356))

(assert (= (and b!185356 res!87648) b!185351))

(assert (= (and b!185351 res!87653) b!185349))

(assert (= (and b!185349 res!87652) b!185352))

(assert (= (and b!185352 res!87651) b!185357))

(assert (= (and b!185358 condMapEmpty!7467) mapIsEmpty!7467))

(assert (= (and b!185358 (not condMapEmpty!7467)) mapNonEmpty!7467))

(assert (= (and mapNonEmpty!7467 ((_ is ValueCellFull!1826) mapValue!7467)) b!185355))

(assert (= (and b!185358 ((_ is ValueCellFull!1826) mapDefault!7467)) b!185359))

(assert (= b!185353 b!185358))

(assert (= start!18776 b!185353))

(declare-fun m!212085 () Bool)

(assert (=> mapNonEmpty!7467 m!212085))

(declare-fun m!212087 () Bool)

(assert (=> b!185353 m!212087))

(declare-fun m!212089 () Bool)

(assert (=> b!185353 m!212089))

(declare-fun m!212091 () Bool)

(assert (=> b!185356 m!212091))

(declare-fun m!212093 () Bool)

(assert (=> b!185354 m!212093))

(assert (=> b!185354 m!212093))

(declare-fun m!212095 () Bool)

(assert (=> b!185354 m!212095))

(declare-fun m!212097 () Bool)

(assert (=> b!185350 m!212097))

(declare-fun m!212099 () Bool)

(assert (=> b!185357 m!212099))

(declare-fun m!212101 () Bool)

(assert (=> b!185352 m!212101))

(declare-fun m!212103 () Bool)

(assert (=> start!18776 m!212103))

(declare-fun m!212105 () Bool)

(assert (=> b!185349 m!212105))

(check-sat (not b!185357) (not b!185354) (not b!185356) (not start!18776) b_and!11141 (not b!185350) (not b!185353) (not b!185352) (not b!185349) (not mapNonEmpty!7467) tp_is_empty!4339 (not b_next!4567))
(check-sat b_and!11141 (not b_next!4567))
(get-model)

(declare-fun d!54969 () Bool)

(declare-fun e!122015 () Bool)

(assert (=> d!54969 e!122015))

(declare-fun res!87705 () Bool)

(assert (=> d!54969 (=> res!87705 e!122015)))

(declare-fun lt!91583 () Bool)

(assert (=> d!54969 (= res!87705 (not lt!91583))))

(declare-fun lt!91584 () Bool)

(assert (=> d!54969 (= lt!91583 lt!91584)))

(declare-datatypes ((Unit!5563 0))(
  ( (Unit!5564) )
))
(declare-fun lt!91586 () Unit!5563)

(declare-fun e!122014 () Unit!5563)

(assert (=> d!54969 (= lt!91586 e!122014)))

(declare-fun c!33263 () Bool)

(assert (=> d!54969 (= c!33263 lt!91584)))

(declare-fun containsKey!225 (List!2350 (_ BitVec 64)) Bool)

(assert (=> d!54969 (= lt!91584 (containsKey!225 (toList!1177 (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828))))

(assert (=> d!54969 (= (contains!1278 (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)) key!828) lt!91583)))

(declare-fun b!185439 () Bool)

(declare-fun lt!91585 () Unit!5563)

(assert (=> b!185439 (= e!122014 lt!91585)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!174 (List!2350 (_ BitVec 64)) Unit!5563)

(assert (=> b!185439 (= lt!91585 (lemmaContainsKeyImpliesGetValueByKeyDefined!174 (toList!1177 (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828))))

(declare-datatypes ((Option!227 0))(
  ( (Some!226 (v!4121 V!5433)) (None!225) )
))
(declare-fun isDefined!175 (Option!227) Bool)

(declare-fun getValueByKey!221 (List!2350 (_ BitVec 64)) Option!227)

(assert (=> b!185439 (isDefined!175 (getValueByKey!221 (toList!1177 (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828))))

(declare-fun b!185440 () Bool)

(declare-fun Unit!5565 () Unit!5563)

(assert (=> b!185440 (= e!122014 Unit!5565)))

(declare-fun b!185441 () Bool)

(assert (=> b!185441 (= e!122015 (isDefined!175 (getValueByKey!221 (toList!1177 (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828)))))

(assert (= (and d!54969 c!33263) b!185439))

(assert (= (and d!54969 (not c!33263)) b!185440))

(assert (= (and d!54969 (not res!87705)) b!185441))

(declare-fun m!212151 () Bool)

(assert (=> d!54969 m!212151))

(declare-fun m!212153 () Bool)

(assert (=> b!185439 m!212153))

(declare-fun m!212155 () Bool)

(assert (=> b!185439 m!212155))

(assert (=> b!185439 m!212155))

(declare-fun m!212157 () Bool)

(assert (=> b!185439 m!212157))

(assert (=> b!185441 m!212155))

(assert (=> b!185441 m!212155))

(assert (=> b!185441 m!212157))

(assert (=> b!185354 d!54969))

(declare-fun bm!18700 () Bool)

(declare-fun call!18708 () Bool)

(declare-fun lt!91639 () ListLongMap!2323)

(assert (=> bm!18700 (= call!18708 (contains!1278 lt!91639 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185484 () Bool)

(declare-fun e!122045 () Bool)

(declare-fun apply!166 (ListLongMap!2323 (_ BitVec 64)) V!5433)

(assert (=> b!185484 (= e!122045 (= (apply!166 lt!91639 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3622 thiss!1248)))))

(declare-fun b!185485 () Bool)

(declare-fun res!87727 () Bool)

(declare-fun e!122048 () Bool)

(assert (=> b!185485 (=> (not res!87727) (not e!122048))))

(declare-fun e!122054 () Bool)

(assert (=> b!185485 (= res!87727 e!122054)))

(declare-fun res!87724 () Bool)

(assert (=> b!185485 (=> res!87724 e!122054)))

(declare-fun e!122043 () Bool)

(assert (=> b!185485 (= res!87724 (not e!122043))))

(declare-fun res!87728 () Bool)

(assert (=> b!185485 (=> (not res!87728) (not e!122043))))

(assert (=> b!185485 (= res!87728 (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))

(declare-fun b!185486 () Bool)

(declare-fun e!122042 () Bool)

(assert (=> b!185486 (= e!122042 (= (apply!166 lt!91639 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3622 thiss!1248)))))

(declare-fun b!185487 () Bool)

(declare-fun res!87731 () Bool)

(assert (=> b!185487 (=> (not res!87731) (not e!122048))))

(declare-fun e!122047 () Bool)

(assert (=> b!185487 (= res!87731 e!122047)))

(declare-fun c!33276 () Bool)

(assert (=> b!185487 (= c!33276 (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!185488 () Bool)

(declare-fun e!122049 () Bool)

(assert (=> b!185488 (= e!122048 e!122049)))

(declare-fun c!33278 () Bool)

(assert (=> b!185488 (= c!33278 (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18701 () Bool)

(declare-fun call!18707 () ListLongMap!2323)

(declare-fun call!18704 () ListLongMap!2323)

(assert (=> bm!18701 (= call!18707 call!18704)))

(declare-fun bm!18702 () Bool)

(declare-fun call!18705 () ListLongMap!2323)

(declare-fun getCurrentListMapNoExtraKeys!187 (array!7865 array!7867 (_ BitVec 32) (_ BitVec 32) V!5433 V!5433 (_ BitVec 32) Int) ListLongMap!2323)

(assert (=> bm!18702 (= call!18705 (getCurrentListMapNoExtraKeys!187 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun c!33280 () Bool)

(declare-fun call!18709 () ListLongMap!2323)

(declare-fun bm!18703 () Bool)

(declare-fun c!33277 () Bool)

(declare-fun +!283 (ListLongMap!2323 tuple2!3414) ListLongMap!2323)

(assert (=> bm!18703 (= call!18709 (+!283 (ite c!33280 call!18705 (ite c!33277 call!18704 call!18707)) (ite (or c!33280 c!33277) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3622 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3622 thiss!1248)))))))

(declare-fun b!185489 () Bool)

(declare-fun e!122052 () ListLongMap!2323)

(declare-fun e!122050 () ListLongMap!2323)

(assert (=> b!185489 (= e!122052 e!122050)))

(assert (=> b!185489 (= c!33277 (and (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185491 () Bool)

(declare-fun call!18703 () Bool)

(assert (=> b!185491 (= e!122047 (not call!18703))))

(declare-fun b!185492 () Bool)

(declare-fun e!122051 () Unit!5563)

(declare-fun Unit!5566 () Unit!5563)

(assert (=> b!185492 (= e!122051 Unit!5566)))

(declare-fun b!185493 () Bool)

(assert (=> b!185493 (= e!122049 e!122045)))

(declare-fun res!87726 () Bool)

(assert (=> b!185493 (= res!87726 call!18708)))

(assert (=> b!185493 (=> (not res!87726) (not e!122045))))

(declare-fun b!185494 () Bool)

(declare-fun call!18706 () ListLongMap!2323)

(assert (=> b!185494 (= e!122050 call!18706)))

(declare-fun b!185495 () Bool)

(declare-fun e!122046 () Bool)

(declare-fun get!2135 (ValueCell!1826 V!5433) V!5433)

(declare-fun dynLambda!500 (Int (_ BitVec 64)) V!5433)

(assert (=> b!185495 (= e!122046 (= (apply!166 lt!91639 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)) (get!2135 (select (arr!3713 (_values!3764 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!500 (defaultEntry!3781 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4030 (_values!3764 thiss!1248))))))

(assert (=> b!185495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))

(declare-fun b!185496 () Bool)

(declare-fun lt!91648 () Unit!5563)

(assert (=> b!185496 (= e!122051 lt!91648)))

(declare-fun lt!91636 () ListLongMap!2323)

(assert (=> b!185496 (= lt!91636 (getCurrentListMapNoExtraKeys!187 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91631 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91645 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91645 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91646 () Unit!5563)

(declare-fun addStillContains!142 (ListLongMap!2323 (_ BitVec 64) V!5433 (_ BitVec 64)) Unit!5563)

(assert (=> b!185496 (= lt!91646 (addStillContains!142 lt!91636 lt!91631 (zeroValue!3622 thiss!1248) lt!91645))))

(assert (=> b!185496 (contains!1278 (+!283 lt!91636 (tuple2!3415 lt!91631 (zeroValue!3622 thiss!1248))) lt!91645)))

(declare-fun lt!91651 () Unit!5563)

(assert (=> b!185496 (= lt!91651 lt!91646)))

(declare-fun lt!91650 () ListLongMap!2323)

(assert (=> b!185496 (= lt!91650 (getCurrentListMapNoExtraKeys!187 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91632 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91632 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91638 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91638 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91643 () Unit!5563)

(declare-fun addApplyDifferent!142 (ListLongMap!2323 (_ BitVec 64) V!5433 (_ BitVec 64)) Unit!5563)

(assert (=> b!185496 (= lt!91643 (addApplyDifferent!142 lt!91650 lt!91632 (minValue!3622 thiss!1248) lt!91638))))

(assert (=> b!185496 (= (apply!166 (+!283 lt!91650 (tuple2!3415 lt!91632 (minValue!3622 thiss!1248))) lt!91638) (apply!166 lt!91650 lt!91638))))

(declare-fun lt!91640 () Unit!5563)

(assert (=> b!185496 (= lt!91640 lt!91643)))

(declare-fun lt!91644 () ListLongMap!2323)

(assert (=> b!185496 (= lt!91644 (getCurrentListMapNoExtraKeys!187 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91647 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91641 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91641 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91637 () Unit!5563)

(assert (=> b!185496 (= lt!91637 (addApplyDifferent!142 lt!91644 lt!91647 (zeroValue!3622 thiss!1248) lt!91641))))

(assert (=> b!185496 (= (apply!166 (+!283 lt!91644 (tuple2!3415 lt!91647 (zeroValue!3622 thiss!1248))) lt!91641) (apply!166 lt!91644 lt!91641))))

(declare-fun lt!91634 () Unit!5563)

(assert (=> b!185496 (= lt!91634 lt!91637)))

(declare-fun lt!91633 () ListLongMap!2323)

(assert (=> b!185496 (= lt!91633 (getCurrentListMapNoExtraKeys!187 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91642 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91642 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91635 () (_ BitVec 64))

(assert (=> b!185496 (= lt!91635 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185496 (= lt!91648 (addApplyDifferent!142 lt!91633 lt!91642 (minValue!3622 thiss!1248) lt!91635))))

(assert (=> b!185496 (= (apply!166 (+!283 lt!91633 (tuple2!3415 lt!91642 (minValue!3622 thiss!1248))) lt!91635) (apply!166 lt!91633 lt!91635))))

(declare-fun b!185497 () Bool)

(assert (=> b!185497 (= e!122047 e!122042)))

(declare-fun res!87732 () Bool)

(assert (=> b!185497 (= res!87732 call!18703)))

(assert (=> b!185497 (=> (not res!87732) (not e!122042))))

(declare-fun bm!18704 () Bool)

(assert (=> bm!18704 (= call!18706 call!18709)))

(declare-fun b!185498 () Bool)

(declare-fun c!33279 () Bool)

(assert (=> b!185498 (= c!33279 (and (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122053 () ListLongMap!2323)

(assert (=> b!185498 (= e!122050 e!122053)))

(declare-fun b!185499 () Bool)

(assert (=> b!185499 (= e!122053 call!18706)))

(declare-fun bm!18705 () Bool)

(assert (=> bm!18705 (= call!18703 (contains!1278 lt!91639 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185500 () Bool)

(assert (=> b!185500 (= e!122049 (not call!18708))))

(declare-fun b!185501 () Bool)

(assert (=> b!185501 (= e!122052 (+!283 call!18709 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3622 thiss!1248))))))

(declare-fun b!185490 () Bool)

(assert (=> b!185490 (= e!122043 (validKeyInArray!0 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54971 () Bool)

(assert (=> d!54971 e!122048))

(declare-fun res!87730 () Bool)

(assert (=> d!54971 (=> (not res!87730) (not e!122048))))

(assert (=> d!54971 (= res!87730 (or (bvsge #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))))

(declare-fun lt!91652 () ListLongMap!2323)

(assert (=> d!54971 (= lt!91639 lt!91652)))

(declare-fun lt!91649 () Unit!5563)

(assert (=> d!54971 (= lt!91649 e!122051)))

(declare-fun c!33281 () Bool)

(declare-fun e!122044 () Bool)

(assert (=> d!54971 (= c!33281 e!122044)))

(declare-fun res!87725 () Bool)

(assert (=> d!54971 (=> (not res!87725) (not e!122044))))

(assert (=> d!54971 (= res!87725 (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))

(assert (=> d!54971 (= lt!91652 e!122052)))

(assert (=> d!54971 (= c!33280 (and (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54971 (validMask!0 (mask!8888 thiss!1248))))

(assert (=> d!54971 (= (getCurrentListMap!810 (_keys!5719 thiss!1248) (_values!3764 thiss!1248) (mask!8888 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)) lt!91639)))

(declare-fun bm!18706 () Bool)

(assert (=> bm!18706 (= call!18704 call!18705)))

(declare-fun b!185502 () Bool)

(assert (=> b!185502 (= e!122054 e!122046)))

(declare-fun res!87729 () Bool)

(assert (=> b!185502 (=> (not res!87729) (not e!122046))))

(assert (=> b!185502 (= res!87729 (contains!1278 lt!91639 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185502 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))

(declare-fun b!185503 () Bool)

(assert (=> b!185503 (= e!122044 (validKeyInArray!0 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185504 () Bool)

(assert (=> b!185504 (= e!122053 call!18707)))

(assert (= (and d!54971 c!33280) b!185501))

(assert (= (and d!54971 (not c!33280)) b!185489))

(assert (= (and b!185489 c!33277) b!185494))

(assert (= (and b!185489 (not c!33277)) b!185498))

(assert (= (and b!185498 c!33279) b!185499))

(assert (= (and b!185498 (not c!33279)) b!185504))

(assert (= (or b!185499 b!185504) bm!18701))

(assert (= (or b!185494 bm!18701) bm!18706))

(assert (= (or b!185494 b!185499) bm!18704))

(assert (= (or b!185501 bm!18706) bm!18702))

(assert (= (or b!185501 bm!18704) bm!18703))

(assert (= (and d!54971 res!87725) b!185503))

(assert (= (and d!54971 c!33281) b!185496))

(assert (= (and d!54971 (not c!33281)) b!185492))

(assert (= (and d!54971 res!87730) b!185485))

(assert (= (and b!185485 res!87728) b!185490))

(assert (= (and b!185485 (not res!87724)) b!185502))

(assert (= (and b!185502 res!87729) b!185495))

(assert (= (and b!185485 res!87727) b!185487))

(assert (= (and b!185487 c!33276) b!185497))

(assert (= (and b!185487 (not c!33276)) b!185491))

(assert (= (and b!185497 res!87732) b!185486))

(assert (= (or b!185497 b!185491) bm!18705))

(assert (= (and b!185487 res!87731) b!185488))

(assert (= (and b!185488 c!33278) b!185493))

(assert (= (and b!185488 (not c!33278)) b!185500))

(assert (= (and b!185493 res!87726) b!185484))

(assert (= (or b!185493 b!185500) bm!18700))

(declare-fun b_lambda!7233 () Bool)

(assert (=> (not b_lambda!7233) (not b!185495)))

(declare-fun t!7225 () Bool)

(declare-fun tb!2835 () Bool)

(assert (=> (and b!185353 (= (defaultEntry!3781 thiss!1248) (defaultEntry!3781 thiss!1248)) t!7225) tb!2835))

(declare-fun result!4799 () Bool)

(assert (=> tb!2835 (= result!4799 tp_is_empty!4339)))

(assert (=> b!185495 t!7225))

(declare-fun b_and!11147 () Bool)

(assert (= b_and!11141 (and (=> t!7225 result!4799) b_and!11147)))

(declare-fun m!212159 () Bool)

(assert (=> b!185490 m!212159))

(assert (=> b!185490 m!212159))

(declare-fun m!212161 () Bool)

(assert (=> b!185490 m!212161))

(assert (=> b!185495 m!212159))

(declare-fun m!212163 () Bool)

(assert (=> b!185495 m!212163))

(declare-fun m!212165 () Bool)

(assert (=> b!185495 m!212165))

(declare-fun m!212167 () Bool)

(assert (=> b!185495 m!212167))

(declare-fun m!212169 () Bool)

(assert (=> b!185495 m!212169))

(assert (=> b!185495 m!212165))

(assert (=> b!185495 m!212159))

(assert (=> b!185495 m!212167))

(declare-fun m!212171 () Bool)

(assert (=> bm!18702 m!212171))

(declare-fun m!212173 () Bool)

(assert (=> b!185486 m!212173))

(declare-fun m!212175 () Bool)

(assert (=> b!185484 m!212175))

(declare-fun m!212177 () Bool)

(assert (=> bm!18700 m!212177))

(declare-fun m!212179 () Bool)

(assert (=> bm!18705 m!212179))

(declare-fun m!212181 () Bool)

(assert (=> b!185496 m!212181))

(declare-fun m!212183 () Bool)

(assert (=> b!185496 m!212183))

(declare-fun m!212185 () Bool)

(assert (=> b!185496 m!212185))

(assert (=> b!185496 m!212185))

(declare-fun m!212187 () Bool)

(assert (=> b!185496 m!212187))

(assert (=> b!185496 m!212159))

(declare-fun m!212189 () Bool)

(assert (=> b!185496 m!212189))

(declare-fun m!212191 () Bool)

(assert (=> b!185496 m!212191))

(declare-fun m!212193 () Bool)

(assert (=> b!185496 m!212193))

(declare-fun m!212195 () Bool)

(assert (=> b!185496 m!212195))

(declare-fun m!212197 () Bool)

(assert (=> b!185496 m!212197))

(declare-fun m!212199 () Bool)

(assert (=> b!185496 m!212199))

(declare-fun m!212201 () Bool)

(assert (=> b!185496 m!212201))

(declare-fun m!212203 () Bool)

(assert (=> b!185496 m!212203))

(assert (=> b!185496 m!212193))

(declare-fun m!212205 () Bool)

(assert (=> b!185496 m!212205))

(assert (=> b!185496 m!212197))

(declare-fun m!212207 () Bool)

(assert (=> b!185496 m!212207))

(assert (=> b!185496 m!212171))

(assert (=> b!185496 m!212181))

(declare-fun m!212209 () Bool)

(assert (=> b!185496 m!212209))

(assert (=> b!185503 m!212159))

(assert (=> b!185503 m!212159))

(assert (=> b!185503 m!212161))

(declare-fun m!212211 () Bool)

(assert (=> b!185501 m!212211))

(assert (=> d!54971 m!212091))

(declare-fun m!212213 () Bool)

(assert (=> bm!18703 m!212213))

(assert (=> b!185502 m!212159))

(assert (=> b!185502 m!212159))

(declare-fun m!212215 () Bool)

(assert (=> b!185502 m!212215))

(assert (=> b!185354 d!54971))

(declare-fun b!185519 () Bool)

(declare-fun e!122061 () SeekEntryResult!635)

(assert (=> b!185519 (= e!122061 Undefined!635)))

(declare-fun d!54973 () Bool)

(declare-fun lt!91660 () SeekEntryResult!635)

(assert (=> d!54973 (and (or ((_ is Undefined!635) lt!91660) (not ((_ is Found!635) lt!91660)) (and (bvsge (index!4711 lt!91660) #b00000000000000000000000000000000) (bvslt (index!4711 lt!91660) (size!4029 (_keys!5719 thiss!1248))))) (or ((_ is Undefined!635) lt!91660) ((_ is Found!635) lt!91660) (not ((_ is MissingZero!635) lt!91660)) (and (bvsge (index!4710 lt!91660) #b00000000000000000000000000000000) (bvslt (index!4710 lt!91660) (size!4029 (_keys!5719 thiss!1248))))) (or ((_ is Undefined!635) lt!91660) ((_ is Found!635) lt!91660) ((_ is MissingZero!635) lt!91660) (not ((_ is MissingVacant!635) lt!91660)) (and (bvsge (index!4713 lt!91660) #b00000000000000000000000000000000) (bvslt (index!4713 lt!91660) (size!4029 (_keys!5719 thiss!1248))))) (or ((_ is Undefined!635) lt!91660) (ite ((_ is Found!635) lt!91660) (= (select (arr!3712 (_keys!5719 thiss!1248)) (index!4711 lt!91660)) key!828) (ite ((_ is MissingZero!635) lt!91660) (= (select (arr!3712 (_keys!5719 thiss!1248)) (index!4710 lt!91660)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!635) lt!91660) (= (select (arr!3712 (_keys!5719 thiss!1248)) (index!4713 lt!91660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54973 (= lt!91660 e!122061)))

(declare-fun c!33290 () Bool)

(declare-fun lt!91659 () SeekEntryResult!635)

(assert (=> d!54973 (= c!33290 (and ((_ is Intermediate!635) lt!91659) (undefined!1447 lt!91659)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7865 (_ BitVec 32)) SeekEntryResult!635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54973 (= lt!91659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8888 thiss!1248)) key!828 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)))))

(assert (=> d!54973 (validMask!0 (mask!8888 thiss!1248))))

(assert (=> d!54973 (= (seekEntryOrOpen!0 key!828 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)) lt!91660)))

(declare-fun b!185520 () Bool)

(declare-fun e!122063 () SeekEntryResult!635)

(assert (=> b!185520 (= e!122063 (Found!635 (index!4712 lt!91659)))))

(declare-fun b!185521 () Bool)

(declare-fun c!33289 () Bool)

(declare-fun lt!91661 () (_ BitVec 64))

(assert (=> b!185521 (= c!33289 (= lt!91661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122062 () SeekEntryResult!635)

(assert (=> b!185521 (= e!122063 e!122062)))

(declare-fun b!185522 () Bool)

(assert (=> b!185522 (= e!122062 (MissingZero!635 (index!4712 lt!91659)))))

(declare-fun b!185523 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7865 (_ BitVec 32)) SeekEntryResult!635)

(assert (=> b!185523 (= e!122062 (seekKeyOrZeroReturnVacant!0 (x!20146 lt!91659) (index!4712 lt!91659) (index!4712 lt!91659) key!828 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)))))

(declare-fun b!185524 () Bool)

(assert (=> b!185524 (= e!122061 e!122063)))

(assert (=> b!185524 (= lt!91661 (select (arr!3712 (_keys!5719 thiss!1248)) (index!4712 lt!91659)))))

(declare-fun c!33288 () Bool)

(assert (=> b!185524 (= c!33288 (= lt!91661 key!828))))

(assert (= (and d!54973 c!33290) b!185519))

(assert (= (and d!54973 (not c!33290)) b!185524))

(assert (= (and b!185524 c!33288) b!185520))

(assert (= (and b!185524 (not c!33288)) b!185521))

(assert (= (and b!185521 c!33289) b!185522))

(assert (= (and b!185521 (not c!33289)) b!185523))

(assert (=> d!54973 m!212091))

(declare-fun m!212217 () Bool)

(assert (=> d!54973 m!212217))

(declare-fun m!212219 () Bool)

(assert (=> d!54973 m!212219))

(declare-fun m!212221 () Bool)

(assert (=> d!54973 m!212221))

(assert (=> d!54973 m!212219))

(declare-fun m!212223 () Bool)

(assert (=> d!54973 m!212223))

(declare-fun m!212225 () Bool)

(assert (=> d!54973 m!212225))

(declare-fun m!212227 () Bool)

(assert (=> b!185523 m!212227))

(declare-fun m!212229 () Bool)

(assert (=> b!185524 m!212229))

(assert (=> b!185350 d!54973))

(declare-fun b!185533 () Bool)

(declare-fun e!122070 () Bool)

(declare-fun call!18712 () Bool)

(assert (=> b!185533 (= e!122070 call!18712)))

(declare-fun d!54975 () Bool)

(declare-fun res!87738 () Bool)

(declare-fun e!122071 () Bool)

(assert (=> d!54975 (=> res!87738 e!122071)))

(assert (=> d!54975 (= res!87738 (bvsge #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))

(assert (=> d!54975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)) e!122071)))

(declare-fun b!185534 () Bool)

(declare-fun e!122072 () Bool)

(assert (=> b!185534 (= e!122070 e!122072)))

(declare-fun lt!91668 () (_ BitVec 64))

(assert (=> b!185534 (= lt!91668 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91670 () Unit!5563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7865 (_ BitVec 64) (_ BitVec 32)) Unit!5563)

(assert (=> b!185534 (= lt!91670 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5719 thiss!1248) lt!91668 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185534 (arrayContainsKey!0 (_keys!5719 thiss!1248) lt!91668 #b00000000000000000000000000000000)))

(declare-fun lt!91669 () Unit!5563)

(assert (=> b!185534 (= lt!91669 lt!91670)))

(declare-fun res!87737 () Bool)

(assert (=> b!185534 (= res!87737 (= (seekEntryOrOpen!0 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000) (_keys!5719 thiss!1248) (mask!8888 thiss!1248)) (Found!635 #b00000000000000000000000000000000)))))

(assert (=> b!185534 (=> (not res!87737) (not e!122072))))

(declare-fun b!185535 () Bool)

(assert (=> b!185535 (= e!122071 e!122070)))

(declare-fun c!33293 () Bool)

(assert (=> b!185535 (= c!33293 (validKeyInArray!0 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185536 () Bool)

(assert (=> b!185536 (= e!122072 call!18712)))

(declare-fun bm!18709 () Bool)

(assert (=> bm!18709 (= call!18712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5719 thiss!1248) (mask!8888 thiss!1248)))))

(assert (= (and d!54975 (not res!87738)) b!185535))

(assert (= (and b!185535 c!33293) b!185534))

(assert (= (and b!185535 (not c!33293)) b!185533))

(assert (= (and b!185534 res!87737) b!185536))

(assert (= (or b!185536 b!185533) bm!18709))

(assert (=> b!185534 m!212159))

(declare-fun m!212231 () Bool)

(assert (=> b!185534 m!212231))

(declare-fun m!212233 () Bool)

(assert (=> b!185534 m!212233))

(assert (=> b!185534 m!212159))

(declare-fun m!212235 () Bool)

(assert (=> b!185534 m!212235))

(assert (=> b!185535 m!212159))

(assert (=> b!185535 m!212159))

(assert (=> b!185535 m!212161))

(declare-fun m!212237 () Bool)

(assert (=> bm!18709 m!212237))

(assert (=> b!185349 d!54975))

(declare-fun d!54977 () Bool)

(assert (=> d!54977 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185357 d!54977))

(declare-fun d!54979 () Bool)

(assert (=> d!54979 (= (array_inv!2403 (_keys!5719 thiss!1248)) (bvsge (size!4029 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185353 d!54979))

(declare-fun d!54981 () Bool)

(assert (=> d!54981 (= (array_inv!2404 (_values!3764 thiss!1248)) (bvsge (size!4030 (_values!3764 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185353 d!54981))

(declare-fun d!54983 () Bool)

(declare-fun res!87745 () Bool)

(declare-fun e!122081 () Bool)

(assert (=> d!54983 (=> res!87745 e!122081)))

(assert (=> d!54983 (= res!87745 (bvsge #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))))))

(assert (=> d!54983 (= (arrayNoDuplicates!0 (_keys!5719 thiss!1248) #b00000000000000000000000000000000 Nil!2346) e!122081)))

(declare-fun b!185547 () Bool)

(declare-fun e!122084 () Bool)

(declare-fun call!18715 () Bool)

(assert (=> b!185547 (= e!122084 call!18715)))

(declare-fun b!185548 () Bool)

(assert (=> b!185548 (= e!122084 call!18715)))

(declare-fun b!185549 () Bool)

(declare-fun e!122082 () Bool)

(assert (=> b!185549 (= e!122081 e!122082)))

(declare-fun res!87746 () Bool)

(assert (=> b!185549 (=> (not res!87746) (not e!122082))))

(declare-fun e!122083 () Bool)

(assert (=> b!185549 (= res!87746 (not e!122083))))

(declare-fun res!87747 () Bool)

(assert (=> b!185549 (=> (not res!87747) (not e!122083))))

(assert (=> b!185549 (= res!87747 (validKeyInArray!0 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18712 () Bool)

(declare-fun c!33296 () Bool)

(assert (=> bm!18712 (= call!18715 (arrayNoDuplicates!0 (_keys!5719 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33296 (Cons!2345 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000) Nil!2346) Nil!2346)))))

(declare-fun b!185550 () Bool)

(assert (=> b!185550 (= e!122082 e!122084)))

(assert (=> b!185550 (= c!33296 (validKeyInArray!0 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185551 () Bool)

(declare-fun contains!1279 (List!2349 (_ BitVec 64)) Bool)

(assert (=> b!185551 (= e!122083 (contains!1279 Nil!2346 (select (arr!3712 (_keys!5719 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54983 (not res!87745)) b!185549))

(assert (= (and b!185549 res!87747) b!185551))

(assert (= (and b!185549 res!87746) b!185550))

(assert (= (and b!185550 c!33296) b!185548))

(assert (= (and b!185550 (not c!33296)) b!185547))

(assert (= (or b!185548 b!185547) bm!18712))

(assert (=> b!185549 m!212159))

(assert (=> b!185549 m!212159))

(assert (=> b!185549 m!212161))

(assert (=> bm!18712 m!212159))

(declare-fun m!212239 () Bool)

(assert (=> bm!18712 m!212239))

(assert (=> b!185550 m!212159))

(assert (=> b!185550 m!212159))

(assert (=> b!185550 m!212161))

(assert (=> b!185551 m!212159))

(assert (=> b!185551 m!212159))

(declare-fun m!212241 () Bool)

(assert (=> b!185551 m!212241))

(assert (=> b!185352 d!54983))

(declare-fun d!54985 () Bool)

(declare-fun res!87754 () Bool)

(declare-fun e!122087 () Bool)

(assert (=> d!54985 (=> (not res!87754) (not e!122087))))

(declare-fun simpleValid!182 (LongMapFixedSize!2560) Bool)

(assert (=> d!54985 (= res!87754 (simpleValid!182 thiss!1248))))

(assert (=> d!54985 (= (valid!1076 thiss!1248) e!122087)))

(declare-fun b!185558 () Bool)

(declare-fun res!87755 () Bool)

(assert (=> b!185558 (=> (not res!87755) (not e!122087))))

(declare-fun arrayCountValidKeys!0 (array!7865 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185558 (= res!87755 (= (arrayCountValidKeys!0 (_keys!5719 thiss!1248) #b00000000000000000000000000000000 (size!4029 (_keys!5719 thiss!1248))) (_size!1329 thiss!1248)))))

(declare-fun b!185559 () Bool)

(declare-fun res!87756 () Bool)

(assert (=> b!185559 (=> (not res!87756) (not e!122087))))

(assert (=> b!185559 (= res!87756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5719 thiss!1248) (mask!8888 thiss!1248)))))

(declare-fun b!185560 () Bool)

(assert (=> b!185560 (= e!122087 (arrayNoDuplicates!0 (_keys!5719 thiss!1248) #b00000000000000000000000000000000 Nil!2346))))

(assert (= (and d!54985 res!87754) b!185558))

(assert (= (and b!185558 res!87755) b!185559))

(assert (= (and b!185559 res!87756) b!185560))

(declare-fun m!212243 () Bool)

(assert (=> d!54985 m!212243))

(declare-fun m!212245 () Bool)

(assert (=> b!185558 m!212245))

(assert (=> b!185559 m!212105))

(assert (=> b!185560 m!212101))

(assert (=> start!18776 d!54985))

(declare-fun d!54987 () Bool)

(assert (=> d!54987 (= (validMask!0 (mask!8888 thiss!1248)) (and (or (= (mask!8888 thiss!1248) #b00000000000000000000000000000111) (= (mask!8888 thiss!1248) #b00000000000000000000000000001111) (= (mask!8888 thiss!1248) #b00000000000000000000000000011111) (= (mask!8888 thiss!1248) #b00000000000000000000000000111111) (= (mask!8888 thiss!1248) #b00000000000000000000000001111111) (= (mask!8888 thiss!1248) #b00000000000000000000000011111111) (= (mask!8888 thiss!1248) #b00000000000000000000000111111111) (= (mask!8888 thiss!1248) #b00000000000000000000001111111111) (= (mask!8888 thiss!1248) #b00000000000000000000011111111111) (= (mask!8888 thiss!1248) #b00000000000000000000111111111111) (= (mask!8888 thiss!1248) #b00000000000000000001111111111111) (= (mask!8888 thiss!1248) #b00000000000000000011111111111111) (= (mask!8888 thiss!1248) #b00000000000000000111111111111111) (= (mask!8888 thiss!1248) #b00000000000000001111111111111111) (= (mask!8888 thiss!1248) #b00000000000000011111111111111111) (= (mask!8888 thiss!1248) #b00000000000000111111111111111111) (= (mask!8888 thiss!1248) #b00000000000001111111111111111111) (= (mask!8888 thiss!1248) #b00000000000011111111111111111111) (= (mask!8888 thiss!1248) #b00000000000111111111111111111111) (= (mask!8888 thiss!1248) #b00000000001111111111111111111111) (= (mask!8888 thiss!1248) #b00000000011111111111111111111111) (= (mask!8888 thiss!1248) #b00000000111111111111111111111111) (= (mask!8888 thiss!1248) #b00000001111111111111111111111111) (= (mask!8888 thiss!1248) #b00000011111111111111111111111111) (= (mask!8888 thiss!1248) #b00000111111111111111111111111111) (= (mask!8888 thiss!1248) #b00001111111111111111111111111111) (= (mask!8888 thiss!1248) #b00011111111111111111111111111111) (= (mask!8888 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8888 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185356 d!54987))

(declare-fun b!185568 () Bool)

(declare-fun e!122092 () Bool)

(assert (=> b!185568 (= e!122092 tp_is_empty!4339)))

(declare-fun mapNonEmpty!7476 () Bool)

(declare-fun mapRes!7476 () Bool)

(declare-fun tp!16512 () Bool)

(declare-fun e!122093 () Bool)

(assert (=> mapNonEmpty!7476 (= mapRes!7476 (and tp!16512 e!122093))))

(declare-fun mapValue!7476 () ValueCell!1826)

(declare-fun mapKey!7476 () (_ BitVec 32))

(declare-fun mapRest!7476 () (Array (_ BitVec 32) ValueCell!1826))

(assert (=> mapNonEmpty!7476 (= mapRest!7467 (store mapRest!7476 mapKey!7476 mapValue!7476))))

(declare-fun condMapEmpty!7476 () Bool)

(declare-fun mapDefault!7476 () ValueCell!1826)

(assert (=> mapNonEmpty!7467 (= condMapEmpty!7476 (= mapRest!7467 ((as const (Array (_ BitVec 32) ValueCell!1826)) mapDefault!7476)))))

(assert (=> mapNonEmpty!7467 (= tp!16497 (and e!122092 mapRes!7476))))

(declare-fun b!185567 () Bool)

(assert (=> b!185567 (= e!122093 tp_is_empty!4339)))

(declare-fun mapIsEmpty!7476 () Bool)

(assert (=> mapIsEmpty!7476 mapRes!7476))

(assert (= (and mapNonEmpty!7467 condMapEmpty!7476) mapIsEmpty!7476))

(assert (= (and mapNonEmpty!7467 (not condMapEmpty!7476)) mapNonEmpty!7476))

(assert (= (and mapNonEmpty!7476 ((_ is ValueCellFull!1826) mapValue!7476)) b!185567))

(assert (= (and mapNonEmpty!7467 ((_ is ValueCellFull!1826) mapDefault!7476)) b!185568))

(declare-fun m!212247 () Bool)

(assert (=> mapNonEmpty!7476 m!212247))

(declare-fun b_lambda!7235 () Bool)

(assert (= b_lambda!7233 (or (and b!185353 b_free!4567) b_lambda!7235)))

(check-sat b_and!11147 (not b!185551) (not b!185486) (not b!185441) (not b!185503) (not b!185550) (not b!185559) (not b!185490) (not b!185549) (not b!185484) (not d!54971) (not b_lambda!7235) (not bm!18705) (not d!54985) (not b!185523) (not b!185560) (not b!185501) (not b!185496) (not bm!18700) (not bm!18709) (not b!185534) (not b!185439) (not b!185558) tp_is_empty!4339 (not b_next!4567) (not bm!18702) (not b!185535) (not d!54969) (not bm!18703) (not mapNonEmpty!7476) (not b!185502) (not b!185495) (not bm!18712) (not d!54973))
(check-sat b_and!11147 (not b_next!4567))
