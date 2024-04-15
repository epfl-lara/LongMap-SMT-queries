; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19226 () Bool)

(assert start!19226)

(declare-fun b!188954 () Bool)

(declare-fun b_free!4639 () Bool)

(declare-fun b_next!4639 () Bool)

(assert (=> b!188954 (= b_free!4639 (not b_next!4639))))

(declare-fun tp!16746 () Bool)

(declare-fun b_and!11249 () Bool)

(assert (=> b!188954 (= tp!16746 b_and!11249)))

(declare-fun b!188951 () Bool)

(declare-fun e!124349 () Bool)

(declare-fun e!124345 () Bool)

(assert (=> b!188951 (= e!124349 e!124345)))

(declare-fun res!89306 () Bool)

(assert (=> b!188951 (=> (not res!89306) (not e!124345))))

(declare-datatypes ((SeekEntryResult!664 0))(
  ( (MissingZero!664 (index!4826 (_ BitVec 32))) (Found!664 (index!4827 (_ BitVec 32))) (Intermediate!664 (undefined!1476 Bool) (index!4828 (_ BitVec 32)) (x!20403 (_ BitVec 32))) (Undefined!664) (MissingVacant!664 (index!4829 (_ BitVec 32))) )
))
(declare-fun lt!93423 () SeekEntryResult!664)

(get-info :version)

(assert (=> b!188951 (= res!89306 (and (not ((_ is Undefined!664) lt!93423)) (not ((_ is MissingVacant!664) lt!93423)) (not ((_ is MissingZero!664) lt!93423)) ((_ is Found!664) lt!93423)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5529 0))(
  ( (V!5530 (val!2250 Int)) )
))
(declare-datatypes ((ValueCell!1862 0))(
  ( (ValueCellFull!1862 (v!4164 V!5529)) (EmptyCell!1862) )
))
(declare-datatypes ((array!8029 0))(
  ( (array!8030 (arr!3784 (Array (_ BitVec 32) (_ BitVec 64))) (size!4105 (_ BitVec 32))) )
))
(declare-datatypes ((array!8031 0))(
  ( (array!8032 (arr!3785 (Array (_ BitVec 32) ValueCell!1862)) (size!4106 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2632 0))(
  ( (LongMapFixedSize!2633 (defaultEntry!3857 Int) (mask!9037 (_ BitVec 32)) (extraKeys!3594 (_ BitVec 32)) (zeroValue!3698 V!5529) (minValue!3698 V!5529) (_size!1365 (_ BitVec 32)) (_keys!5821 array!8029) (_values!3840 array!8031) (_vacant!1365 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2632)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8029 (_ BitVec 32)) SeekEntryResult!664)

(assert (=> b!188951 (= lt!93423 (seekEntryOrOpen!0 key!828 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun b!188952 () Bool)

(declare-fun e!124344 () Bool)

(declare-fun e!124346 () Bool)

(declare-fun mapRes!7609 () Bool)

(assert (=> b!188952 (= e!124344 (and e!124346 mapRes!7609))))

(declare-fun condMapEmpty!7609 () Bool)

(declare-fun mapDefault!7609 () ValueCell!1862)

(assert (=> b!188952 (= condMapEmpty!7609 (= (arr!3785 (_values!3840 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1862)) mapDefault!7609)))))

(declare-fun e!124348 () Bool)

(declare-fun b!188953 () Bool)

(assert (=> b!188953 (= e!124348 (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4827 lt!93423)) key!828))))

(declare-fun tp_is_empty!4411 () Bool)

(declare-fun e!124342 () Bool)

(declare-fun array_inv!2449 (array!8029) Bool)

(declare-fun array_inv!2450 (array!8031) Bool)

(assert (=> b!188954 (= e!124342 (and tp!16746 tp_is_empty!4411 (array_inv!2449 (_keys!5821 thiss!1248)) (array_inv!2450 (_values!3840 thiss!1248)) e!124344))))

(declare-fun b!188955 () Bool)

(declare-fun res!89304 () Bool)

(declare-fun e!124347 () Bool)

(assert (=> b!188955 (=> (not res!89304) (not e!124347))))

(assert (=> b!188955 (= res!89304 (and (= (size!4106 (_values!3840 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9037 thiss!1248))) (= (size!4105 (_keys!5821 thiss!1248)) (size!4106 (_values!3840 thiss!1248))) (bvsge (mask!9037 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3594 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3594 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188957 () Bool)

(declare-fun res!89302 () Bool)

(assert (=> b!188957 (=> (not res!89302) (not e!124347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8029 (_ BitVec 32)) Bool)

(assert (=> b!188957 (= res!89302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun b!188958 () Bool)

(declare-fun res!89303 () Bool)

(assert (=> b!188958 (=> (not res!89303) (not e!124347))))

(declare-datatypes ((List!2384 0))(
  ( (Nil!2381) (Cons!2380 (h!3017 (_ BitVec 64)) (t!7277 List!2384)) )
))
(declare-fun arrayNoDuplicates!0 (array!8029 (_ BitVec 32) List!2384) Bool)

(assert (=> b!188958 (= res!89303 (arrayNoDuplicates!0 (_keys!5821 thiss!1248) #b00000000000000000000000000000000 Nil!2381))))

(declare-fun b!188959 () Bool)

(declare-fun e!124350 () Bool)

(assert (=> b!188959 (= e!124350 tp_is_empty!4411)))

(declare-fun b!188960 () Bool)

(declare-fun res!89309 () Bool)

(assert (=> b!188960 (=> (not res!89309) (not e!124349))))

(assert (=> b!188960 (= res!89309 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7609 () Bool)

(declare-fun tp!16747 () Bool)

(assert (=> mapNonEmpty!7609 (= mapRes!7609 (and tp!16747 e!124350))))

(declare-fun mapKey!7609 () (_ BitVec 32))

(declare-fun mapValue!7609 () ValueCell!1862)

(declare-fun mapRest!7609 () (Array (_ BitVec 32) ValueCell!1862))

(assert (=> mapNonEmpty!7609 (= (arr!3785 (_values!3840 thiss!1248)) (store mapRest!7609 mapKey!7609 mapValue!7609))))

(declare-fun mapIsEmpty!7609 () Bool)

(assert (=> mapIsEmpty!7609 mapRes!7609))

(declare-fun b!188961 () Bool)

(assert (=> b!188961 (= e!124346 tp_is_empty!4411)))

(declare-fun b!188962 () Bool)

(assert (=> b!188962 (= e!124345 e!124347)))

(declare-fun res!89301 () Bool)

(assert (=> b!188962 (=> (not res!89301) (not e!124347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188962 (= res!89301 (validMask!0 (mask!9037 thiss!1248)))))

(declare-datatypes ((Unit!5663 0))(
  ( (Unit!5664) )
))
(declare-fun lt!93421 () Unit!5663)

(declare-fun e!124343 () Unit!5663)

(assert (=> b!188962 (= lt!93421 e!124343)))

(declare-fun c!33963 () Bool)

(declare-datatypes ((tuple2!3456 0))(
  ( (tuple2!3457 (_1!1739 (_ BitVec 64)) (_2!1739 V!5529)) )
))
(declare-datatypes ((List!2385 0))(
  ( (Nil!2382) (Cons!2381 (h!3018 tuple2!3456) (t!7278 List!2385)) )
))
(declare-datatypes ((ListLongMap!2365 0))(
  ( (ListLongMap!2366 (toList!1198 List!2385)) )
))
(declare-fun contains!1310 (ListLongMap!2365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!831 (array!8029 array!8031 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 32) Int) ListLongMap!2365)

(assert (=> b!188962 (= c!33963 (contains!1310 (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) key!828))))

(declare-fun b!188963 () Bool)

(declare-fun res!89308 () Bool)

(assert (=> b!188963 (=> (not res!89308) (not e!124347))))

(assert (=> b!188963 (= res!89308 (and (bvsge (index!4827 lt!93423) #b00000000000000000000000000000000) (bvslt (index!4827 lt!93423) (size!4105 (_keys!5821 thiss!1248)))))))

(declare-fun b!188964 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188964 (= e!124347 (not (validKeyInArray!0 key!828)))))

(declare-fun b!188965 () Bool)

(declare-fun Unit!5665 () Unit!5663)

(assert (=> b!188965 (= e!124343 Unit!5665)))

(declare-fun lt!93424 () Unit!5663)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (array!8029 array!8031 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5663)

(assert (=> b!188965 (= lt!93424 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(assert (=> b!188965 false))

(declare-fun res!89307 () Bool)

(assert (=> start!19226 (=> (not res!89307) (not e!124349))))

(declare-fun valid!1101 (LongMapFixedSize!2632) Bool)

(assert (=> start!19226 (= res!89307 (valid!1101 thiss!1248))))

(assert (=> start!19226 e!124349))

(assert (=> start!19226 e!124342))

(assert (=> start!19226 true))

(declare-fun b!188956 () Bool)

(declare-fun lt!93422 () Unit!5663)

(assert (=> b!188956 (= e!124343 lt!93422)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (array!8029 array!8031 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5663)

(assert (=> b!188956 (= lt!93422 (lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(declare-fun res!89305 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188956 (= res!89305 (inRange!0 (index!4827 lt!93423) (mask!9037 thiss!1248)))))

(assert (=> b!188956 (=> (not res!89305) (not e!124348))))

(assert (=> b!188956 e!124348))

(assert (= (and start!19226 res!89307) b!188960))

(assert (= (and b!188960 res!89309) b!188951))

(assert (= (and b!188951 res!89306) b!188962))

(assert (= (and b!188962 c!33963) b!188956))

(assert (= (and b!188962 (not c!33963)) b!188965))

(assert (= (and b!188956 res!89305) b!188953))

(assert (= (and b!188962 res!89301) b!188955))

(assert (= (and b!188955 res!89304) b!188957))

(assert (= (and b!188957 res!89302) b!188958))

(assert (= (and b!188958 res!89303) b!188963))

(assert (= (and b!188963 res!89308) b!188964))

(assert (= (and b!188952 condMapEmpty!7609) mapIsEmpty!7609))

(assert (= (and b!188952 (not condMapEmpty!7609)) mapNonEmpty!7609))

(assert (= (and mapNonEmpty!7609 ((_ is ValueCellFull!1862) mapValue!7609)) b!188959))

(assert (= (and b!188952 ((_ is ValueCellFull!1862) mapDefault!7609)) b!188961))

(assert (= b!188954 b!188952))

(assert (= start!19226 b!188954))

(declare-fun m!214931 () Bool)

(assert (=> b!188965 m!214931))

(declare-fun m!214933 () Bool)

(assert (=> b!188956 m!214933))

(declare-fun m!214935 () Bool)

(assert (=> b!188956 m!214935))

(declare-fun m!214937 () Bool)

(assert (=> b!188954 m!214937))

(declare-fun m!214939 () Bool)

(assert (=> b!188954 m!214939))

(declare-fun m!214941 () Bool)

(assert (=> b!188962 m!214941))

(declare-fun m!214943 () Bool)

(assert (=> b!188962 m!214943))

(assert (=> b!188962 m!214943))

(declare-fun m!214945 () Bool)

(assert (=> b!188962 m!214945))

(declare-fun m!214947 () Bool)

(assert (=> start!19226 m!214947))

(declare-fun m!214949 () Bool)

(assert (=> b!188964 m!214949))

(declare-fun m!214951 () Bool)

(assert (=> b!188953 m!214951))

(declare-fun m!214953 () Bool)

(assert (=> b!188958 m!214953))

(declare-fun m!214955 () Bool)

(assert (=> b!188957 m!214955))

(declare-fun m!214957 () Bool)

(assert (=> mapNonEmpty!7609 m!214957))

(declare-fun m!214959 () Bool)

(assert (=> b!188951 m!214959))

(check-sat (not b!188957) (not b_next!4639) b_and!11249 (not b!188956) (not start!19226) (not b!188954) tp_is_empty!4411 (not b!188951) (not b!188962) (not b!188964) (not mapNonEmpty!7609) (not b!188958) (not b!188965))
(check-sat b_and!11249 (not b_next!4639))
(get-model)

(declare-fun d!55539 () Bool)

(assert (=> d!55539 (= (array_inv!2449 (_keys!5821 thiss!1248)) (bvsge (size!4105 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188954 d!55539))

(declare-fun d!55541 () Bool)

(assert (=> d!55541 (= (array_inv!2450 (_values!3840 thiss!1248)) (bvsge (size!4106 (_values!3840 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188954 d!55541))

(declare-fun d!55543 () Bool)

(assert (=> d!55543 (= (validMask!0 (mask!9037 thiss!1248)) (and (or (= (mask!9037 thiss!1248) #b00000000000000000000000000000111) (= (mask!9037 thiss!1248) #b00000000000000000000000000001111) (= (mask!9037 thiss!1248) #b00000000000000000000000000011111) (= (mask!9037 thiss!1248) #b00000000000000000000000000111111) (= (mask!9037 thiss!1248) #b00000000000000000000000001111111) (= (mask!9037 thiss!1248) #b00000000000000000000000011111111) (= (mask!9037 thiss!1248) #b00000000000000000000000111111111) (= (mask!9037 thiss!1248) #b00000000000000000000001111111111) (= (mask!9037 thiss!1248) #b00000000000000000000011111111111) (= (mask!9037 thiss!1248) #b00000000000000000000111111111111) (= (mask!9037 thiss!1248) #b00000000000000000001111111111111) (= (mask!9037 thiss!1248) #b00000000000000000011111111111111) (= (mask!9037 thiss!1248) #b00000000000000000111111111111111) (= (mask!9037 thiss!1248) #b00000000000000001111111111111111) (= (mask!9037 thiss!1248) #b00000000000000011111111111111111) (= (mask!9037 thiss!1248) #b00000000000000111111111111111111) (= (mask!9037 thiss!1248) #b00000000000001111111111111111111) (= (mask!9037 thiss!1248) #b00000000000011111111111111111111) (= (mask!9037 thiss!1248) #b00000000000111111111111111111111) (= (mask!9037 thiss!1248) #b00000000001111111111111111111111) (= (mask!9037 thiss!1248) #b00000000011111111111111111111111) (= (mask!9037 thiss!1248) #b00000000111111111111111111111111) (= (mask!9037 thiss!1248) #b00000001111111111111111111111111) (= (mask!9037 thiss!1248) #b00000011111111111111111111111111) (= (mask!9037 thiss!1248) #b00000111111111111111111111111111) (= (mask!9037 thiss!1248) #b00001111111111111111111111111111) (= (mask!9037 thiss!1248) #b00011111111111111111111111111111) (= (mask!9037 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9037 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188962 d!55543))

(declare-fun d!55545 () Bool)

(declare-fun e!124416 () Bool)

(assert (=> d!55545 e!124416))

(declare-fun res!89366 () Bool)

(assert (=> d!55545 (=> res!89366 e!124416)))

(declare-fun lt!93457 () Bool)

(assert (=> d!55545 (= res!89366 (not lt!93457))))

(declare-fun lt!93459 () Bool)

(assert (=> d!55545 (= lt!93457 lt!93459)))

(declare-fun lt!93460 () Unit!5663)

(declare-fun e!124417 () Unit!5663)

(assert (=> d!55545 (= lt!93460 e!124417)))

(declare-fun c!33972 () Bool)

(assert (=> d!55545 (= c!33972 lt!93459)))

(declare-fun containsKey!235 (List!2385 (_ BitVec 64)) Bool)

(assert (=> d!55545 (= lt!93459 (containsKey!235 (toList!1198 (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828))))

(assert (=> d!55545 (= (contains!1310 (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) key!828) lt!93457)))

(declare-fun b!189062 () Bool)

(declare-fun lt!93458 () Unit!5663)

(assert (=> b!189062 (= e!124417 lt!93458)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!184 (List!2385 (_ BitVec 64)) Unit!5663)

(assert (=> b!189062 (= lt!93458 (lemmaContainsKeyImpliesGetValueByKeyDefined!184 (toList!1198 (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828))))

(declare-datatypes ((Option!237 0))(
  ( (Some!236 (v!4167 V!5529)) (None!235) )
))
(declare-fun isDefined!185 (Option!237) Bool)

(declare-fun getValueByKey!231 (List!2385 (_ BitVec 64)) Option!237)

(assert (=> b!189062 (isDefined!185 (getValueByKey!231 (toList!1198 (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828))))

(declare-fun b!189063 () Bool)

(declare-fun Unit!5668 () Unit!5663)

(assert (=> b!189063 (= e!124417 Unit!5668)))

(declare-fun b!189064 () Bool)

(assert (=> b!189064 (= e!124416 (isDefined!185 (getValueByKey!231 (toList!1198 (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828)))))

(assert (= (and d!55545 c!33972) b!189062))

(assert (= (and d!55545 (not c!33972)) b!189063))

(assert (= (and d!55545 (not res!89366)) b!189064))

(declare-fun m!215021 () Bool)

(assert (=> d!55545 m!215021))

(declare-fun m!215023 () Bool)

(assert (=> b!189062 m!215023))

(declare-fun m!215025 () Bool)

(assert (=> b!189062 m!215025))

(assert (=> b!189062 m!215025))

(declare-fun m!215027 () Bool)

(assert (=> b!189062 m!215027))

(assert (=> b!189064 m!215025))

(assert (=> b!189064 m!215025))

(assert (=> b!189064 m!215027))

(assert (=> b!188962 d!55545))

(declare-fun b!189108 () Bool)

(declare-fun e!124448 () ListLongMap!2365)

(declare-fun call!19060 () ListLongMap!2365)

(assert (=> b!189108 (= e!124448 call!19060)))

(declare-fun bm!19057 () Bool)

(declare-fun call!19064 () ListLongMap!2365)

(declare-fun getCurrentListMapNoExtraKeys!197 (array!8029 array!8031 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 32) Int) ListLongMap!2365)

(assert (=> bm!19057 (= call!19064 (getCurrentListMapNoExtraKeys!197 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun b!189109 () Bool)

(declare-fun e!124453 () Unit!5663)

(declare-fun Unit!5669 () Unit!5663)

(assert (=> b!189109 (= e!124453 Unit!5669)))

(declare-fun bm!19058 () Bool)

(declare-fun call!19063 () Bool)

(declare-fun lt!93506 () ListLongMap!2365)

(assert (=> bm!19058 (= call!19063 (contains!1310 lt!93506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189110 () Bool)

(declare-fun e!124445 () ListLongMap!2365)

(declare-fun call!19061 () ListLongMap!2365)

(declare-fun +!293 (ListLongMap!2365 tuple2!3456) ListLongMap!2365)

(assert (=> b!189110 (= e!124445 (+!293 call!19061 (tuple2!3457 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3698 thiss!1248))))))

(declare-fun b!189111 () Bool)

(declare-fun e!124447 () ListLongMap!2365)

(declare-fun call!19062 () ListLongMap!2365)

(assert (=> b!189111 (= e!124447 call!19062)))

(declare-fun b!189112 () Bool)

(assert (=> b!189112 (= e!124445 e!124447)))

(declare-fun c!33986 () Bool)

(assert (=> b!189112 (= c!33986 (and (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19059 () Bool)

(assert (=> bm!19059 (= call!19062 call!19061)))

(declare-fun b!189113 () Bool)

(declare-fun e!124451 () Bool)

(declare-fun e!124454 () Bool)

(assert (=> b!189113 (= e!124451 e!124454)))

(declare-fun c!33989 () Bool)

(assert (=> b!189113 (= c!33989 (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189114 () Bool)

(declare-fun e!124450 () Bool)

(assert (=> b!189114 (= e!124450 (not call!19063))))

(declare-fun bm!19060 () Bool)

(declare-fun call!19065 () Bool)

(assert (=> bm!19060 (= call!19065 (contains!1310 lt!93506 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55547 () Bool)

(assert (=> d!55547 e!124451))

(declare-fun res!89386 () Bool)

(assert (=> d!55547 (=> (not res!89386) (not e!124451))))

(assert (=> d!55547 (= res!89386 (or (bvsge #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))))

(declare-fun lt!93519 () ListLongMap!2365)

(assert (=> d!55547 (= lt!93506 lt!93519)))

(declare-fun lt!93511 () Unit!5663)

(assert (=> d!55547 (= lt!93511 e!124453)))

(declare-fun c!33985 () Bool)

(declare-fun e!124444 () Bool)

(assert (=> d!55547 (= c!33985 e!124444)))

(declare-fun res!89389 () Bool)

(assert (=> d!55547 (=> (not res!89389) (not e!124444))))

(assert (=> d!55547 (= res!89389 (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))

(assert (=> d!55547 (= lt!93519 e!124445)))

(declare-fun c!33988 () Bool)

(assert (=> d!55547 (= c!33988 (and (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55547 (validMask!0 (mask!9037 thiss!1248))))

(assert (=> d!55547 (= (getCurrentListMap!831 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) lt!93506)))

(declare-fun b!189107 () Bool)

(declare-fun e!124446 () Bool)

(declare-fun apply!176 (ListLongMap!2365 (_ BitVec 64)) V!5529)

(assert (=> b!189107 (= e!124446 (= (apply!176 lt!93506 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3698 thiss!1248)))))

(declare-fun b!189115 () Bool)

(assert (=> b!189115 (= e!124450 e!124446)))

(declare-fun res!89385 () Bool)

(assert (=> b!189115 (= res!89385 call!19063)))

(assert (=> b!189115 (=> (not res!89385) (not e!124446))))

(declare-fun b!189116 () Bool)

(declare-fun lt!93513 () Unit!5663)

(assert (=> b!189116 (= e!124453 lt!93513)))

(declare-fun lt!93525 () ListLongMap!2365)

(assert (=> b!189116 (= lt!93525 (getCurrentListMapNoExtraKeys!197 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93510 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93512 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93512 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93516 () Unit!5663)

(declare-fun addStillContains!152 (ListLongMap!2365 (_ BitVec 64) V!5529 (_ BitVec 64)) Unit!5663)

(assert (=> b!189116 (= lt!93516 (addStillContains!152 lt!93525 lt!93510 (zeroValue!3698 thiss!1248) lt!93512))))

(assert (=> b!189116 (contains!1310 (+!293 lt!93525 (tuple2!3457 lt!93510 (zeroValue!3698 thiss!1248))) lt!93512)))

(declare-fun lt!93505 () Unit!5663)

(assert (=> b!189116 (= lt!93505 lt!93516)))

(declare-fun lt!93515 () ListLongMap!2365)

(assert (=> b!189116 (= lt!93515 (getCurrentListMapNoExtraKeys!197 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93514 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93526 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93526 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93508 () Unit!5663)

(declare-fun addApplyDifferent!152 (ListLongMap!2365 (_ BitVec 64) V!5529 (_ BitVec 64)) Unit!5663)

(assert (=> b!189116 (= lt!93508 (addApplyDifferent!152 lt!93515 lt!93514 (minValue!3698 thiss!1248) lt!93526))))

(assert (=> b!189116 (= (apply!176 (+!293 lt!93515 (tuple2!3457 lt!93514 (minValue!3698 thiss!1248))) lt!93526) (apply!176 lt!93515 lt!93526))))

(declare-fun lt!93517 () Unit!5663)

(assert (=> b!189116 (= lt!93517 lt!93508)))

(declare-fun lt!93507 () ListLongMap!2365)

(assert (=> b!189116 (= lt!93507 (getCurrentListMapNoExtraKeys!197 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93522 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93524 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93524 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93518 () Unit!5663)

(assert (=> b!189116 (= lt!93518 (addApplyDifferent!152 lt!93507 lt!93522 (zeroValue!3698 thiss!1248) lt!93524))))

(assert (=> b!189116 (= (apply!176 (+!293 lt!93507 (tuple2!3457 lt!93522 (zeroValue!3698 thiss!1248))) lt!93524) (apply!176 lt!93507 lt!93524))))

(declare-fun lt!93520 () Unit!5663)

(assert (=> b!189116 (= lt!93520 lt!93518)))

(declare-fun lt!93523 () ListLongMap!2365)

(assert (=> b!189116 (= lt!93523 (getCurrentListMapNoExtraKeys!197 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93521 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93509 () (_ BitVec 64))

(assert (=> b!189116 (= lt!93509 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189116 (= lt!93513 (addApplyDifferent!152 lt!93523 lt!93521 (minValue!3698 thiss!1248) lt!93509))))

(assert (=> b!189116 (= (apply!176 (+!293 lt!93523 (tuple2!3457 lt!93521 (minValue!3698 thiss!1248))) lt!93509) (apply!176 lt!93523 lt!93509))))

(declare-fun b!189117 () Bool)

(assert (=> b!189117 (= e!124454 (not call!19065))))

(declare-fun b!189118 () Bool)

(declare-fun res!89393 () Bool)

(assert (=> b!189118 (=> (not res!89393) (not e!124451))))

(declare-fun e!124452 () Bool)

(assert (=> b!189118 (= res!89393 e!124452)))

(declare-fun res!89388 () Bool)

(assert (=> b!189118 (=> res!89388 e!124452)))

(declare-fun e!124455 () Bool)

(assert (=> b!189118 (= res!89388 (not e!124455))))

(declare-fun res!89392 () Bool)

(assert (=> b!189118 (=> (not res!89392) (not e!124455))))

(assert (=> b!189118 (= res!89392 (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))

(declare-fun bm!19061 () Bool)

(declare-fun call!19066 () ListLongMap!2365)

(assert (=> bm!19061 (= call!19060 call!19066)))

(declare-fun b!189119 () Bool)

(declare-fun e!124449 () Bool)

(assert (=> b!189119 (= e!124454 e!124449)))

(declare-fun res!89387 () Bool)

(assert (=> b!189119 (= res!89387 call!19065)))

(assert (=> b!189119 (=> (not res!89387) (not e!124449))))

(declare-fun bm!19062 () Bool)

(assert (=> bm!19062 (= call!19061 (+!293 (ite c!33988 call!19064 (ite c!33986 call!19066 call!19060)) (ite (or c!33988 c!33986) (tuple2!3457 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3698 thiss!1248)) (tuple2!3457 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3698 thiss!1248)))))))

(declare-fun bm!19063 () Bool)

(assert (=> bm!19063 (= call!19066 call!19064)))

(declare-fun b!189120 () Bool)

(declare-fun c!33987 () Bool)

(assert (=> b!189120 (= c!33987 (and (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189120 (= e!124447 e!124448)))

(declare-fun b!189121 () Bool)

(declare-fun e!124456 () Bool)

(declare-fun get!2181 (ValueCell!1862 V!5529) V!5529)

(declare-fun dynLambda!510 (Int (_ BitVec 64)) V!5529)

(assert (=> b!189121 (= e!124456 (= (apply!176 lt!93506 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)) (get!2181 (select (arr!3785 (_values!3840 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!510 (defaultEntry!3857 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4106 (_values!3840 thiss!1248))))))

(assert (=> b!189121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))

(declare-fun b!189122 () Bool)

(assert (=> b!189122 (= e!124449 (= (apply!176 lt!93506 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3698 thiss!1248)))))

(declare-fun b!189123 () Bool)

(assert (=> b!189123 (= e!124444 (validKeyInArray!0 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189124 () Bool)

(assert (=> b!189124 (= e!124448 call!19062)))

(declare-fun b!189125 () Bool)

(declare-fun res!89391 () Bool)

(assert (=> b!189125 (=> (not res!89391) (not e!124451))))

(assert (=> b!189125 (= res!89391 e!124450)))

(declare-fun c!33990 () Bool)

(assert (=> b!189125 (= c!33990 (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189126 () Bool)

(assert (=> b!189126 (= e!124452 e!124456)))

(declare-fun res!89390 () Bool)

(assert (=> b!189126 (=> (not res!89390) (not e!124456))))

(assert (=> b!189126 (= res!89390 (contains!1310 lt!93506 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))

(declare-fun b!189127 () Bool)

(assert (=> b!189127 (= e!124455 (validKeyInArray!0 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55547 c!33988) b!189110))

(assert (= (and d!55547 (not c!33988)) b!189112))

(assert (= (and b!189112 c!33986) b!189111))

(assert (= (and b!189112 (not c!33986)) b!189120))

(assert (= (and b!189120 c!33987) b!189124))

(assert (= (and b!189120 (not c!33987)) b!189108))

(assert (= (or b!189124 b!189108) bm!19061))

(assert (= (or b!189111 bm!19061) bm!19063))

(assert (= (or b!189111 b!189124) bm!19059))

(assert (= (or b!189110 bm!19063) bm!19057))

(assert (= (or b!189110 bm!19059) bm!19062))

(assert (= (and d!55547 res!89389) b!189123))

(assert (= (and d!55547 c!33985) b!189116))

(assert (= (and d!55547 (not c!33985)) b!189109))

(assert (= (and d!55547 res!89386) b!189118))

(assert (= (and b!189118 res!89392) b!189127))

(assert (= (and b!189118 (not res!89388)) b!189126))

(assert (= (and b!189126 res!89390) b!189121))

(assert (= (and b!189118 res!89393) b!189125))

(assert (= (and b!189125 c!33990) b!189115))

(assert (= (and b!189125 (not c!33990)) b!189114))

(assert (= (and b!189115 res!89385) b!189107))

(assert (= (or b!189115 b!189114) bm!19058))

(assert (= (and b!189125 res!89391) b!189113))

(assert (= (and b!189113 c!33989) b!189119))

(assert (= (and b!189113 (not c!33989)) b!189117))

(assert (= (and b!189119 res!89387) b!189122))

(assert (= (or b!189119 b!189117) bm!19060))

(declare-fun b_lambda!7305 () Bool)

(assert (=> (not b_lambda!7305) (not b!189121)))

(declare-fun t!7281 () Bool)

(declare-fun tb!2855 () Bool)

(assert (=> (and b!188954 (= (defaultEntry!3857 thiss!1248) (defaultEntry!3857 thiss!1248)) t!7281) tb!2855))

(declare-fun result!4859 () Bool)

(assert (=> tb!2855 (= result!4859 tp_is_empty!4411)))

(assert (=> b!189121 t!7281))

(declare-fun b_and!11255 () Bool)

(assert (= b_and!11249 (and (=> t!7281 result!4859) b_and!11255)))

(declare-fun m!215029 () Bool)

(assert (=> b!189116 m!215029))

(declare-fun m!215031 () Bool)

(assert (=> b!189116 m!215031))

(declare-fun m!215033 () Bool)

(assert (=> b!189116 m!215033))

(declare-fun m!215035 () Bool)

(assert (=> b!189116 m!215035))

(declare-fun m!215037 () Bool)

(assert (=> b!189116 m!215037))

(declare-fun m!215039 () Bool)

(assert (=> b!189116 m!215039))

(declare-fun m!215041 () Bool)

(assert (=> b!189116 m!215041))

(declare-fun m!215043 () Bool)

(assert (=> b!189116 m!215043))

(declare-fun m!215045 () Bool)

(assert (=> b!189116 m!215045))

(assert (=> b!189116 m!215031))

(declare-fun m!215047 () Bool)

(assert (=> b!189116 m!215047))

(declare-fun m!215049 () Bool)

(assert (=> b!189116 m!215049))

(declare-fun m!215051 () Bool)

(assert (=> b!189116 m!215051))

(declare-fun m!215053 () Bool)

(assert (=> b!189116 m!215053))

(declare-fun m!215055 () Bool)

(assert (=> b!189116 m!215055))

(assert (=> b!189116 m!215045))

(declare-fun m!215057 () Bool)

(assert (=> b!189116 m!215057))

(declare-fun m!215059 () Bool)

(assert (=> b!189116 m!215059))

(declare-fun m!215061 () Bool)

(assert (=> b!189116 m!215061))

(assert (=> b!189116 m!215059))

(assert (=> b!189116 m!215041))

(assert (=> bm!19057 m!215053))

(assert (=> b!189126 m!215049))

(assert (=> b!189126 m!215049))

(declare-fun m!215063 () Bool)

(assert (=> b!189126 m!215063))

(declare-fun m!215065 () Bool)

(assert (=> bm!19062 m!215065))

(declare-fun m!215067 () Bool)

(assert (=> bm!19058 m!215067))

(declare-fun m!215069 () Bool)

(assert (=> bm!19060 m!215069))

(declare-fun m!215071 () Bool)

(assert (=> b!189110 m!215071))

(declare-fun m!215073 () Bool)

(assert (=> b!189107 m!215073))

(assert (=> b!189123 m!215049))

(assert (=> b!189123 m!215049))

(declare-fun m!215075 () Bool)

(assert (=> b!189123 m!215075))

(assert (=> d!55547 m!214941))

(declare-fun m!215077 () Bool)

(assert (=> b!189122 m!215077))

(assert (=> b!189127 m!215049))

(assert (=> b!189127 m!215049))

(assert (=> b!189127 m!215075))

(declare-fun m!215079 () Bool)

(assert (=> b!189121 m!215079))

(declare-fun m!215081 () Bool)

(assert (=> b!189121 m!215081))

(declare-fun m!215083 () Bool)

(assert (=> b!189121 m!215083))

(assert (=> b!189121 m!215079))

(assert (=> b!189121 m!215049))

(assert (=> b!189121 m!215081))

(assert (=> b!189121 m!215049))

(declare-fun m!215085 () Bool)

(assert (=> b!189121 m!215085))

(assert (=> b!188962 d!55547))

(declare-fun d!55549 () Bool)

(assert (=> d!55549 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188964 d!55549))

(declare-fun d!55551 () Bool)

(declare-fun e!124468 () Bool)

(assert (=> d!55551 e!124468))

(declare-fun c!33996 () Bool)

(declare-fun lt!93531 () SeekEntryResult!664)

(assert (=> d!55551 (= c!33996 ((_ is MissingZero!664) lt!93531))))

(assert (=> d!55551 (= lt!93531 (seekEntryOrOpen!0 key!828 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun lt!93532 () Unit!5663)

(declare-fun choose!1019 (array!8029 array!8031 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5663)

(assert (=> d!55551 (= lt!93532 (choose!1019 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(assert (=> d!55551 (validMask!0 (mask!9037 thiss!1248))))

(assert (=> d!55551 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)) lt!93532)))

(declare-fun b!189146 () Bool)

(declare-fun res!89402 () Bool)

(declare-fun e!124465 () Bool)

(assert (=> b!189146 (=> (not res!89402) (not e!124465))))

(assert (=> b!189146 (= res!89402 (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4829 lt!93531)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189146 (and (bvsge (index!4829 lt!93531) #b00000000000000000000000000000000) (bvslt (index!4829 lt!93531) (size!4105 (_keys!5821 thiss!1248))))))

(declare-fun b!189147 () Bool)

(declare-fun e!124466 () Bool)

(assert (=> b!189147 (= e!124468 e!124466)))

(declare-fun res!89403 () Bool)

(declare-fun call!19071 () Bool)

(assert (=> b!189147 (= res!89403 call!19071)))

(assert (=> b!189147 (=> (not res!89403) (not e!124466))))

(declare-fun b!189148 () Bool)

(declare-fun call!19072 () Bool)

(assert (=> b!189148 (= e!124465 (not call!19072))))

(declare-fun bm!19068 () Bool)

(declare-fun arrayContainsKey!0 (array!8029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19068 (= call!19072 (arrayContainsKey!0 (_keys!5821 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!189149 () Bool)

(declare-fun e!124467 () Bool)

(assert (=> b!189149 (= e!124468 e!124467)))

(declare-fun c!33995 () Bool)

(assert (=> b!189149 (= c!33995 ((_ is MissingVacant!664) lt!93531))))

(declare-fun bm!19069 () Bool)

(assert (=> bm!19069 (= call!19071 (inRange!0 (ite c!33996 (index!4826 lt!93531) (index!4829 lt!93531)) (mask!9037 thiss!1248)))))

(declare-fun b!189150 () Bool)

(assert (=> b!189150 (= e!124467 ((_ is Undefined!664) lt!93531))))

(declare-fun b!189151 () Bool)

(assert (=> b!189151 (= e!124466 (not call!19072))))

(declare-fun b!189152 () Bool)

(declare-fun res!89404 () Bool)

(assert (=> b!189152 (=> (not res!89404) (not e!124465))))

(assert (=> b!189152 (= res!89404 call!19071)))

(assert (=> b!189152 (= e!124467 e!124465)))

(declare-fun b!189153 () Bool)

(assert (=> b!189153 (and (bvsge (index!4826 lt!93531) #b00000000000000000000000000000000) (bvslt (index!4826 lt!93531) (size!4105 (_keys!5821 thiss!1248))))))

(declare-fun res!89405 () Bool)

(assert (=> b!189153 (= res!89405 (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4826 lt!93531)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189153 (=> (not res!89405) (not e!124466))))

(assert (= (and d!55551 c!33996) b!189147))

(assert (= (and d!55551 (not c!33996)) b!189149))

(assert (= (and b!189147 res!89403) b!189153))

(assert (= (and b!189153 res!89405) b!189151))

(assert (= (and b!189149 c!33995) b!189152))

(assert (= (and b!189149 (not c!33995)) b!189150))

(assert (= (and b!189152 res!89404) b!189146))

(assert (= (and b!189146 res!89402) b!189148))

(assert (= (or b!189147 b!189152) bm!19069))

(assert (= (or b!189151 b!189148) bm!19068))

(declare-fun m!215087 () Bool)

(assert (=> b!189153 m!215087))

(declare-fun m!215089 () Bool)

(assert (=> bm!19069 m!215089))

(declare-fun m!215091 () Bool)

(assert (=> b!189146 m!215091))

(assert (=> d!55551 m!214959))

(declare-fun m!215093 () Bool)

(assert (=> d!55551 m!215093))

(assert (=> d!55551 m!214941))

(declare-fun m!215095 () Bool)

(assert (=> bm!19068 m!215095))

(assert (=> b!188965 d!55551))

(declare-fun e!124477 () SeekEntryResult!664)

(declare-fun lt!93539 () SeekEntryResult!664)

(declare-fun b!189166 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8029 (_ BitVec 32)) SeekEntryResult!664)

(assert (=> b!189166 (= e!124477 (seekKeyOrZeroReturnVacant!0 (x!20403 lt!93539) (index!4828 lt!93539) (index!4828 lt!93539) key!828 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun b!189167 () Bool)

(declare-fun e!124476 () SeekEntryResult!664)

(assert (=> b!189167 (= e!124476 Undefined!664)))

(declare-fun b!189168 () Bool)

(assert (=> b!189168 (= e!124477 (MissingZero!664 (index!4828 lt!93539)))))

(declare-fun b!189169 () Bool)

(declare-fun e!124475 () SeekEntryResult!664)

(assert (=> b!189169 (= e!124475 (Found!664 (index!4828 lt!93539)))))

(declare-fun b!189170 () Bool)

(assert (=> b!189170 (= e!124476 e!124475)))

(declare-fun lt!93541 () (_ BitVec 64))

(assert (=> b!189170 (= lt!93541 (select (arr!3784 (_keys!5821 thiss!1248)) (index!4828 lt!93539)))))

(declare-fun c!34005 () Bool)

(assert (=> b!189170 (= c!34005 (= lt!93541 key!828))))

(declare-fun d!55553 () Bool)

(declare-fun lt!93540 () SeekEntryResult!664)

(assert (=> d!55553 (and (or ((_ is Undefined!664) lt!93540) (not ((_ is Found!664) lt!93540)) (and (bvsge (index!4827 lt!93540) #b00000000000000000000000000000000) (bvslt (index!4827 lt!93540) (size!4105 (_keys!5821 thiss!1248))))) (or ((_ is Undefined!664) lt!93540) ((_ is Found!664) lt!93540) (not ((_ is MissingZero!664) lt!93540)) (and (bvsge (index!4826 lt!93540) #b00000000000000000000000000000000) (bvslt (index!4826 lt!93540) (size!4105 (_keys!5821 thiss!1248))))) (or ((_ is Undefined!664) lt!93540) ((_ is Found!664) lt!93540) ((_ is MissingZero!664) lt!93540) (not ((_ is MissingVacant!664) lt!93540)) (and (bvsge (index!4829 lt!93540) #b00000000000000000000000000000000) (bvslt (index!4829 lt!93540) (size!4105 (_keys!5821 thiss!1248))))) (or ((_ is Undefined!664) lt!93540) (ite ((_ is Found!664) lt!93540) (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4827 lt!93540)) key!828) (ite ((_ is MissingZero!664) lt!93540) (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4826 lt!93540)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!664) lt!93540) (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4829 lt!93540)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55553 (= lt!93540 e!124476)))

(declare-fun c!34004 () Bool)

(assert (=> d!55553 (= c!34004 (and ((_ is Intermediate!664) lt!93539) (undefined!1476 lt!93539)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8029 (_ BitVec 32)) SeekEntryResult!664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55553 (= lt!93539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9037 thiss!1248)) key!828 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(assert (=> d!55553 (validMask!0 (mask!9037 thiss!1248))))

(assert (=> d!55553 (= (seekEntryOrOpen!0 key!828 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)) lt!93540)))

(declare-fun b!189171 () Bool)

(declare-fun c!34003 () Bool)

(assert (=> b!189171 (= c!34003 (= lt!93541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189171 (= e!124475 e!124477)))

(assert (= (and d!55553 c!34004) b!189167))

(assert (= (and d!55553 (not c!34004)) b!189170))

(assert (= (and b!189170 c!34005) b!189169))

(assert (= (and b!189170 (not c!34005)) b!189171))

(assert (= (and b!189171 c!34003) b!189168))

(assert (= (and b!189171 (not c!34003)) b!189166))

(declare-fun m!215097 () Bool)

(assert (=> b!189166 m!215097))

(declare-fun m!215099 () Bool)

(assert (=> b!189170 m!215099))

(declare-fun m!215101 () Bool)

(assert (=> d!55553 m!215101))

(declare-fun m!215103 () Bool)

(assert (=> d!55553 m!215103))

(declare-fun m!215105 () Bool)

(assert (=> d!55553 m!215105))

(declare-fun m!215107 () Bool)

(assert (=> d!55553 m!215107))

(assert (=> d!55553 m!215107))

(declare-fun m!215109 () Bool)

(assert (=> d!55553 m!215109))

(assert (=> d!55553 m!214941))

(assert (=> b!188951 d!55553))

(declare-fun d!55555 () Bool)

(declare-fun res!89412 () Bool)

(declare-fun e!124480 () Bool)

(assert (=> d!55555 (=> (not res!89412) (not e!124480))))

(declare-fun simpleValid!192 (LongMapFixedSize!2632) Bool)

(assert (=> d!55555 (= res!89412 (simpleValid!192 thiss!1248))))

(assert (=> d!55555 (= (valid!1101 thiss!1248) e!124480)))

(declare-fun b!189178 () Bool)

(declare-fun res!89413 () Bool)

(assert (=> b!189178 (=> (not res!89413) (not e!124480))))

(declare-fun arrayCountValidKeys!0 (array!8029 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189178 (= res!89413 (= (arrayCountValidKeys!0 (_keys!5821 thiss!1248) #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))) (_size!1365 thiss!1248)))))

(declare-fun b!189179 () Bool)

(declare-fun res!89414 () Bool)

(assert (=> b!189179 (=> (not res!89414) (not e!124480))))

(assert (=> b!189179 (= res!89414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun b!189180 () Bool)

(assert (=> b!189180 (= e!124480 (arrayNoDuplicates!0 (_keys!5821 thiss!1248) #b00000000000000000000000000000000 Nil!2381))))

(assert (= (and d!55555 res!89412) b!189178))

(assert (= (and b!189178 res!89413) b!189179))

(assert (= (and b!189179 res!89414) b!189180))

(declare-fun m!215111 () Bool)

(assert (=> d!55555 m!215111))

(declare-fun m!215113 () Bool)

(assert (=> b!189178 m!215113))

(assert (=> b!189179 m!214955))

(assert (=> b!189180 m!214953))

(assert (=> start!19226 d!55555))

(declare-fun d!55557 () Bool)

(declare-fun e!124483 () Bool)

(assert (=> d!55557 e!124483))

(declare-fun res!89420 () Bool)

(assert (=> d!55557 (=> (not res!89420) (not e!124483))))

(declare-fun lt!93546 () SeekEntryResult!664)

(assert (=> d!55557 (= res!89420 ((_ is Found!664) lt!93546))))

(assert (=> d!55557 (= lt!93546 (seekEntryOrOpen!0 key!828 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun lt!93547 () Unit!5663)

(declare-fun choose!1020 (array!8029 array!8031 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5663)

(assert (=> d!55557 (= lt!93547 (choose!1020 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(assert (=> d!55557 (validMask!0 (mask!9037 thiss!1248))))

(assert (=> d!55557 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (_keys!5821 thiss!1248) (_values!3840 thiss!1248) (mask!9037 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)) lt!93547)))

(declare-fun b!189185 () Bool)

(declare-fun res!89419 () Bool)

(assert (=> b!189185 (=> (not res!89419) (not e!124483))))

(assert (=> b!189185 (= res!89419 (inRange!0 (index!4827 lt!93546) (mask!9037 thiss!1248)))))

(declare-fun b!189186 () Bool)

(assert (=> b!189186 (= e!124483 (= (select (arr!3784 (_keys!5821 thiss!1248)) (index!4827 lt!93546)) key!828))))

(assert (=> b!189186 (and (bvsge (index!4827 lt!93546) #b00000000000000000000000000000000) (bvslt (index!4827 lt!93546) (size!4105 (_keys!5821 thiss!1248))))))

(assert (= (and d!55557 res!89420) b!189185))

(assert (= (and b!189185 res!89419) b!189186))

(assert (=> d!55557 m!214959))

(declare-fun m!215115 () Bool)

(assert (=> d!55557 m!215115))

(assert (=> d!55557 m!214941))

(declare-fun m!215117 () Bool)

(assert (=> b!189185 m!215117))

(declare-fun m!215119 () Bool)

(assert (=> b!189186 m!215119))

(assert (=> b!188956 d!55557))

(declare-fun d!55559 () Bool)

(assert (=> d!55559 (= (inRange!0 (index!4827 lt!93423) (mask!9037 thiss!1248)) (and (bvsge (index!4827 lt!93423) #b00000000000000000000000000000000) (bvslt (index!4827 lt!93423) (bvadd (mask!9037 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188956 d!55559))

(declare-fun b!189197 () Bool)

(declare-fun e!124494 () Bool)

(declare-fun call!19075 () Bool)

(assert (=> b!189197 (= e!124494 call!19075)))

(declare-fun d!55561 () Bool)

(declare-fun res!89427 () Bool)

(declare-fun e!124493 () Bool)

(assert (=> d!55561 (=> res!89427 e!124493)))

(assert (=> d!55561 (= res!89427 (bvsge #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))

(assert (=> d!55561 (= (arrayNoDuplicates!0 (_keys!5821 thiss!1248) #b00000000000000000000000000000000 Nil!2381) e!124493)))

(declare-fun b!189198 () Bool)

(declare-fun e!124495 () Bool)

(declare-fun contains!1312 (List!2384 (_ BitVec 64)) Bool)

(assert (=> b!189198 (= e!124495 (contains!1312 Nil!2381 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19072 () Bool)

(declare-fun c!34008 () Bool)

(assert (=> bm!19072 (= call!19075 (arrayNoDuplicates!0 (_keys!5821 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34008 (Cons!2380 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000) Nil!2381) Nil!2381)))))

(declare-fun b!189199 () Bool)

(assert (=> b!189199 (= e!124494 call!19075)))

(declare-fun b!189200 () Bool)

(declare-fun e!124492 () Bool)

(assert (=> b!189200 (= e!124492 e!124494)))

(assert (=> b!189200 (= c!34008 (validKeyInArray!0 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189201 () Bool)

(assert (=> b!189201 (= e!124493 e!124492)))

(declare-fun res!89429 () Bool)

(assert (=> b!189201 (=> (not res!89429) (not e!124492))))

(assert (=> b!189201 (= res!89429 (not e!124495))))

(declare-fun res!89428 () Bool)

(assert (=> b!189201 (=> (not res!89428) (not e!124495))))

(assert (=> b!189201 (= res!89428 (validKeyInArray!0 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55561 (not res!89427)) b!189201))

(assert (= (and b!189201 res!89428) b!189198))

(assert (= (and b!189201 res!89429) b!189200))

(assert (= (and b!189200 c!34008) b!189199))

(assert (= (and b!189200 (not c!34008)) b!189197))

(assert (= (or b!189199 b!189197) bm!19072))

(assert (=> b!189198 m!215049))

(assert (=> b!189198 m!215049))

(declare-fun m!215121 () Bool)

(assert (=> b!189198 m!215121))

(assert (=> bm!19072 m!215049))

(declare-fun m!215123 () Bool)

(assert (=> bm!19072 m!215123))

(assert (=> b!189200 m!215049))

(assert (=> b!189200 m!215049))

(assert (=> b!189200 m!215075))

(assert (=> b!189201 m!215049))

(assert (=> b!189201 m!215049))

(assert (=> b!189201 m!215075))

(assert (=> b!188958 d!55561))

(declare-fun b!189210 () Bool)

(declare-fun e!124504 () Bool)

(declare-fun e!124502 () Bool)

(assert (=> b!189210 (= e!124504 e!124502)))

(declare-fun lt!93555 () (_ BitVec 64))

(assert (=> b!189210 (= lt!93555 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93554 () Unit!5663)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8029 (_ BitVec 64) (_ BitVec 32)) Unit!5663)

(assert (=> b!189210 (= lt!93554 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5821 thiss!1248) lt!93555 #b00000000000000000000000000000000))))

(assert (=> b!189210 (arrayContainsKey!0 (_keys!5821 thiss!1248) lt!93555 #b00000000000000000000000000000000)))

(declare-fun lt!93556 () Unit!5663)

(assert (=> b!189210 (= lt!93556 lt!93554)))

(declare-fun res!89435 () Bool)

(assert (=> b!189210 (= res!89435 (= (seekEntryOrOpen!0 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000) (_keys!5821 thiss!1248) (mask!9037 thiss!1248)) (Found!664 #b00000000000000000000000000000000)))))

(assert (=> b!189210 (=> (not res!89435) (not e!124502))))

(declare-fun b!189211 () Bool)

(declare-fun call!19078 () Bool)

(assert (=> b!189211 (= e!124502 call!19078)))

(declare-fun b!189212 () Bool)

(declare-fun e!124503 () Bool)

(assert (=> b!189212 (= e!124503 e!124504)))

(declare-fun c!34011 () Bool)

(assert (=> b!189212 (= c!34011 (validKeyInArray!0 (select (arr!3784 (_keys!5821 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189213 () Bool)

(assert (=> b!189213 (= e!124504 call!19078)))

(declare-fun bm!19075 () Bool)

(assert (=> bm!19075 (= call!19078 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5821 thiss!1248) (mask!9037 thiss!1248)))))

(declare-fun d!55563 () Bool)

(declare-fun res!89434 () Bool)

(assert (=> d!55563 (=> res!89434 e!124503)))

(assert (=> d!55563 (= res!89434 (bvsge #b00000000000000000000000000000000 (size!4105 (_keys!5821 thiss!1248))))))

(assert (=> d!55563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5821 thiss!1248) (mask!9037 thiss!1248)) e!124503)))

(assert (= (and d!55563 (not res!89434)) b!189212))

(assert (= (and b!189212 c!34011) b!189210))

(assert (= (and b!189212 (not c!34011)) b!189213))

(assert (= (and b!189210 res!89435) b!189211))

(assert (= (or b!189211 b!189213) bm!19075))

(assert (=> b!189210 m!215049))

(declare-fun m!215125 () Bool)

(assert (=> b!189210 m!215125))

(declare-fun m!215127 () Bool)

(assert (=> b!189210 m!215127))

(assert (=> b!189210 m!215049))

(declare-fun m!215129 () Bool)

(assert (=> b!189210 m!215129))

(assert (=> b!189212 m!215049))

(assert (=> b!189212 m!215049))

(assert (=> b!189212 m!215075))

(declare-fun m!215131 () Bool)

(assert (=> bm!19075 m!215131))

(assert (=> b!188957 d!55563))

(declare-fun b!189220 () Bool)

(declare-fun e!124510 () Bool)

(assert (=> b!189220 (= e!124510 tp_is_empty!4411)))

(declare-fun condMapEmpty!7618 () Bool)

(declare-fun mapDefault!7618 () ValueCell!1862)

(assert (=> mapNonEmpty!7609 (= condMapEmpty!7618 (= mapRest!7609 ((as const (Array (_ BitVec 32) ValueCell!1862)) mapDefault!7618)))))

(declare-fun e!124509 () Bool)

(declare-fun mapRes!7618 () Bool)

(assert (=> mapNonEmpty!7609 (= tp!16747 (and e!124509 mapRes!7618))))

(declare-fun mapIsEmpty!7618 () Bool)

(assert (=> mapIsEmpty!7618 mapRes!7618))

(declare-fun b!189221 () Bool)

(assert (=> b!189221 (= e!124509 tp_is_empty!4411)))

(declare-fun mapNonEmpty!7618 () Bool)

(declare-fun tp!16762 () Bool)

(assert (=> mapNonEmpty!7618 (= mapRes!7618 (and tp!16762 e!124510))))

(declare-fun mapKey!7618 () (_ BitVec 32))

(declare-fun mapValue!7618 () ValueCell!1862)

(declare-fun mapRest!7618 () (Array (_ BitVec 32) ValueCell!1862))

(assert (=> mapNonEmpty!7618 (= mapRest!7609 (store mapRest!7618 mapKey!7618 mapValue!7618))))

(assert (= (and mapNonEmpty!7609 condMapEmpty!7618) mapIsEmpty!7618))

(assert (= (and mapNonEmpty!7609 (not condMapEmpty!7618)) mapNonEmpty!7618))

(assert (= (and mapNonEmpty!7618 ((_ is ValueCellFull!1862) mapValue!7618)) b!189220))

(assert (= (and mapNonEmpty!7609 ((_ is ValueCellFull!1862) mapDefault!7618)) b!189221))

(declare-fun m!215133 () Bool)

(assert (=> mapNonEmpty!7618 m!215133))

(declare-fun b_lambda!7307 () Bool)

(assert (= b_lambda!7305 (or (and b!188954 b_free!4639) b_lambda!7307)))

(check-sat (not bm!19069) (not d!55545) (not b!189200) (not b!189122) (not bm!19075) (not b!189201) (not b!189110) tp_is_empty!4411 (not b!189212) (not d!55555) (not b_lambda!7307) (not b!189126) (not bm!19058) (not b!189062) (not b_next!4639) (not d!55553) (not b!189127) (not bm!19068) (not b!189166) (not bm!19062) (not bm!19057) (not b!189116) (not b!189210) (not bm!19072) (not mapNonEmpty!7618) (not b!189178) (not b!189180) (not b!189064) (not b!189179) (not b!189185) (not d!55551) b_and!11255 (not b!189198) (not d!55547) (not d!55557) (not bm!19060) (not b!189107) (not b!189121) (not b!189123))
(check-sat b_and!11255 (not b_next!4639))
