; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21908 () Bool)

(assert start!21908)

(declare-fun b!222018 () Bool)

(declare-fun b_free!5971 () Bool)

(declare-fun b_next!5971 () Bool)

(assert (=> b!222018 (= b_free!5971 (not b_next!5971))))

(declare-fun tp!21054 () Bool)

(declare-fun b_and!12843 () Bool)

(assert (=> b!222018 (= tp!21054 b_and!12843)))

(declare-fun b!222013 () Bool)

(declare-fun c!36896 () Bool)

(declare-datatypes ((SeekEntryResult!829 0))(
  ( (MissingZero!829 (index!5486 (_ BitVec 32))) (Found!829 (index!5487 (_ BitVec 32))) (Intermediate!829 (undefined!1641 Bool) (index!5488 (_ BitVec 32)) (x!23040 (_ BitVec 32))) (Undefined!829) (MissingVacant!829 (index!5489 (_ BitVec 32))) )
))
(declare-fun lt!112402 () SeekEntryResult!829)

(get-info :version)

(assert (=> b!222013 (= c!36896 ((_ is MissingVacant!829) lt!112402))))

(declare-fun e!144280 () Bool)

(declare-fun e!144281 () Bool)

(assert (=> b!222013 (= e!144280 e!144281)))

(declare-fun b!222014 () Bool)

(declare-fun e!144277 () Bool)

(assert (=> b!222014 (= e!144281 e!144277)))

(declare-fun res!108961 () Bool)

(declare-fun call!20724 () Bool)

(assert (=> b!222014 (= res!108961 call!20724)))

(assert (=> b!222014 (=> (not res!108961) (not e!144277))))

(declare-fun b!222015 () Bool)

(declare-fun res!108958 () Bool)

(declare-fun e!144274 () Bool)

(assert (=> b!222015 (=> (not res!108958) (not e!144274))))

(declare-datatypes ((V!7425 0))(
  ( (V!7426 (val!2961 Int)) )
))
(declare-datatypes ((ValueCell!2573 0))(
  ( (ValueCellFull!2573 (v!4975 V!7425)) (EmptyCell!2573) )
))
(declare-datatypes ((array!10901 0))(
  ( (array!10902 (arr!5169 (Array (_ BitVec 32) ValueCell!2573)) (size!5503 (_ BitVec 32))) )
))
(declare-datatypes ((array!10903 0))(
  ( (array!10904 (arr!5170 (Array (_ BitVec 32) (_ BitVec 64))) (size!5504 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3046 0))(
  ( (LongMapFixedSize!3047 (defaultEntry!4182 Int) (mask!9999 (_ BitVec 32)) (extraKeys!3919 (_ BitVec 32)) (zeroValue!4023 V!7425) (minValue!4023 V!7425) (_size!1572 (_ BitVec 32)) (_keys!6235 array!10903) (_values!4165 array!10901) (_vacant!1572 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3046)

(assert (=> b!222015 (= res!108958 (= (select (arr!5170 (_keys!6235 thiss!1504)) (index!5486 lt!112402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222016 () Bool)

(assert (=> b!222016 (= e!144281 ((_ is Undefined!829) lt!112402))))

(declare-fun b!222017 () Bool)

(declare-fun res!108952 () Bool)

(declare-fun e!144288 () Bool)

(assert (=> b!222017 (=> (not res!108952) (not e!144288))))

(declare-fun e!144273 () Bool)

(assert (=> b!222017 (= res!108952 e!144273)))

(declare-fun res!108948 () Bool)

(assert (=> b!222017 (=> res!108948 e!144273)))

(declare-fun e!144287 () Bool)

(assert (=> b!222017 (= res!108948 e!144287)))

(declare-fun res!108962 () Bool)

(assert (=> b!222017 (=> (not res!108962) (not e!144287))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222017 (= res!108962 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222019 () Bool)

(declare-fun e!144279 () Bool)

(assert (=> b!222019 (= e!144273 e!144279)))

(declare-fun res!108954 () Bool)

(assert (=> b!222019 (=> (not res!108954) (not e!144279))))

(assert (=> b!222019 (= res!108954 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222020 () Bool)

(declare-datatypes ((Unit!6597 0))(
  ( (Unit!6598) )
))
(declare-fun e!144282 () Unit!6597)

(declare-fun Unit!6599 () Unit!6597)

(assert (=> b!222020 (= e!144282 Unit!6599)))

(declare-fun b!222021 () Bool)

(declare-fun res!108950 () Bool)

(declare-fun e!144276 () Bool)

(assert (=> b!222021 (=> (not res!108950) (not e!144276))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!222021 (= res!108950 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9919 () Bool)

(declare-fun mapRes!9919 () Bool)

(assert (=> mapIsEmpty!9919 mapRes!9919))

(declare-fun mapNonEmpty!9919 () Bool)

(declare-fun tp!21055 () Bool)

(declare-fun e!144285 () Bool)

(assert (=> mapNonEmpty!9919 (= mapRes!9919 (and tp!21055 e!144285))))

(declare-fun mapValue!9919 () ValueCell!2573)

(declare-fun mapRest!9919 () (Array (_ BitVec 32) ValueCell!2573))

(declare-fun mapKey!9919 () (_ BitVec 32))

(assert (=> mapNonEmpty!9919 (= (arr!5169 (_values!4165 thiss!1504)) (store mapRest!9919 mapKey!9919 mapValue!9919))))

(declare-fun b!222022 () Bool)

(declare-fun e!144272 () Bool)

(assert (=> b!222022 (= e!144272 e!144288)))

(declare-fun res!108949 () Bool)

(assert (=> b!222022 (=> (not res!108949) (not e!144288))))

(assert (=> b!222022 (= res!108949 (and (bvslt (size!5504 (_keys!6235 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5504 (_keys!6235 thiss!1504)))))))

(declare-fun lt!112408 () Unit!6597)

(assert (=> b!222022 (= lt!112408 e!144282)))

(declare-fun c!36898 () Bool)

(declare-fun arrayContainsKey!0 (array!10903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222022 (= c!36898 (arrayContainsKey!0 (_keys!6235 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222023 () Bool)

(declare-fun e!144275 () Unit!6597)

(declare-fun Unit!6600 () Unit!6597)

(assert (=> b!222023 (= e!144275 Unit!6600)))

(declare-fun lt!112406 () Unit!6597)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!215 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) Int) Unit!6597)

(assert (=> b!222023 (= lt!112406 (lemmaInListMapThenSeekEntryOrOpenFindsIt!215 (_keys!6235 thiss!1504) (_values!4165 thiss!1504) (mask!9999 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 (defaultEntry!4182 thiss!1504)))))

(assert (=> b!222023 false))

(declare-fun b!222024 () Bool)

(assert (=> b!222024 (= e!144288 false)))

(declare-fun lt!112407 () Bool)

(declare-datatypes ((List!3280 0))(
  ( (Nil!3277) (Cons!3276 (h!3924 (_ BitVec 64)) (t!8230 List!3280)) )
))
(declare-fun arrayNoDuplicates!0 (array!10903 (_ BitVec 32) List!3280) Bool)

(assert (=> b!222024 (= lt!112407 (arrayNoDuplicates!0 (_keys!6235 thiss!1504) #b00000000000000000000000000000000 Nil!3277))))

(declare-fun b!222025 () Bool)

(declare-fun res!108957 () Bool)

(assert (=> b!222025 (=> (not res!108957) (not e!144288))))

(declare-fun contains!1496 (List!3280 (_ BitVec 64)) Bool)

(assert (=> b!222025 (= res!108957 (not (contains!1496 Nil!3277 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222026 () Bool)

(assert (=> b!222026 (= e!144279 (not (contains!1496 Nil!3277 key!932)))))

(declare-fun b!222027 () Bool)

(declare-fun e!144286 () Bool)

(declare-fun e!144271 () Bool)

(assert (=> b!222027 (= e!144286 (and e!144271 mapRes!9919))))

(declare-fun condMapEmpty!9919 () Bool)

(declare-fun mapDefault!9919 () ValueCell!2573)

(assert (=> b!222027 (= condMapEmpty!9919 (= (arr!5169 (_values!4165 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2573)) mapDefault!9919)))))

(declare-fun b!222028 () Bool)

(declare-fun Unit!6601 () Unit!6597)

(assert (=> b!222028 (= e!144282 Unit!6601)))

(declare-fun lt!112403 () Unit!6597)

(declare-fun lemmaArrayContainsKeyThenInListMap!57 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) (_ BitVec 32) Int) Unit!6597)

(assert (=> b!222028 (= lt!112403 (lemmaArrayContainsKeyThenInListMap!57 (_keys!6235 thiss!1504) (_values!4165 thiss!1504) (mask!9999 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4182 thiss!1504)))))

(assert (=> b!222028 false))

(declare-fun b!222029 () Bool)

(declare-fun call!20723 () Bool)

(assert (=> b!222029 (= e!144277 (not call!20723))))

(declare-fun b!222030 () Bool)

(declare-fun e!144284 () Bool)

(assert (=> b!222030 (= e!144284 e!144272)))

(declare-fun res!108947 () Bool)

(assert (=> b!222030 (=> (not res!108947) (not e!144272))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222030 (= res!108947 (inRange!0 index!297 (mask!9999 thiss!1504)))))

(declare-fun lt!112404 () Unit!6597)

(assert (=> b!222030 (= lt!112404 e!144275)))

(declare-fun c!36895 () Bool)

(declare-datatypes ((tuple2!4360 0))(
  ( (tuple2!4361 (_1!2191 (_ BitVec 64)) (_2!2191 V!7425)) )
))
(declare-datatypes ((List!3281 0))(
  ( (Nil!3278) (Cons!3277 (h!3925 tuple2!4360) (t!8231 List!3281)) )
))
(declare-datatypes ((ListLongMap!3263 0))(
  ( (ListLongMap!3264 (toList!1647 List!3281)) )
))
(declare-fun contains!1497 (ListLongMap!3263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1156 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 32) Int) ListLongMap!3263)

(assert (=> b!222030 (= c!36895 (contains!1497 (getCurrentListMap!1156 (_keys!6235 thiss!1504) (_values!4165 thiss!1504) (mask!9999 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4182 thiss!1504)) key!932))))

(declare-fun b!222031 () Bool)

(declare-fun lt!112405 () Unit!6597)

(assert (=> b!222031 (= e!144275 lt!112405)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!215 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) Int) Unit!6597)

(assert (=> b!222031 (= lt!112405 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!215 (_keys!6235 thiss!1504) (_values!4165 thiss!1504) (mask!9999 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 (defaultEntry!4182 thiss!1504)))))

(declare-fun c!36897 () Bool)

(assert (=> b!222031 (= c!36897 ((_ is MissingZero!829) lt!112402))))

(assert (=> b!222031 e!144280))

(declare-fun e!144283 () Bool)

(declare-fun tp_is_empty!5833 () Bool)

(declare-fun array_inv!3409 (array!10903) Bool)

(declare-fun array_inv!3410 (array!10901) Bool)

(assert (=> b!222018 (= e!144283 (and tp!21054 tp_is_empty!5833 (array_inv!3409 (_keys!6235 thiss!1504)) (array_inv!3410 (_values!4165 thiss!1504)) e!144286))))

(declare-fun res!108956 () Bool)

(assert (=> start!21908 (=> (not res!108956) (not e!144276))))

(declare-fun valid!1243 (LongMapFixedSize!3046) Bool)

(assert (=> start!21908 (= res!108956 (valid!1243 thiss!1504))))

(assert (=> start!21908 e!144276))

(assert (=> start!21908 e!144283))

(assert (=> start!21908 true))

(declare-fun b!222032 () Bool)

(assert (=> b!222032 (= e!144271 tp_is_empty!5833)))

(declare-fun b!222033 () Bool)

(assert (=> b!222033 (= e!144276 e!144284)))

(declare-fun res!108959 () Bool)

(assert (=> b!222033 (=> (not res!108959) (not e!144284))))

(assert (=> b!222033 (= res!108959 (or (= lt!112402 (MissingZero!829 index!297)) (= lt!112402 (MissingVacant!829 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10903 (_ BitVec 32)) SeekEntryResult!829)

(assert (=> b!222033 (= lt!112402 (seekEntryOrOpen!0 key!932 (_keys!6235 thiss!1504) (mask!9999 thiss!1504)))))

(declare-fun b!222034 () Bool)

(assert (=> b!222034 (= e!144285 tp_is_empty!5833)))

(declare-fun b!222035 () Bool)

(assert (=> b!222035 (= e!144274 (not call!20723))))

(declare-fun bm!20720 () Bool)

(assert (=> bm!20720 (= call!20723 (arrayContainsKey!0 (_keys!6235 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20721 () Bool)

(assert (=> bm!20721 (= call!20724 (inRange!0 (ite c!36897 (index!5486 lt!112402) (index!5489 lt!112402)) (mask!9999 thiss!1504)))))

(declare-fun b!222036 () Bool)

(declare-fun res!108953 () Bool)

(assert (=> b!222036 (=> (not res!108953) (not e!144274))))

(assert (=> b!222036 (= res!108953 call!20724)))

(assert (=> b!222036 (= e!144280 e!144274)))

(declare-fun b!222037 () Bool)

(assert (=> b!222037 (= e!144287 (contains!1496 Nil!3277 key!932))))

(declare-fun b!222038 () Bool)

(declare-fun res!108960 () Bool)

(assert (=> b!222038 (=> (not res!108960) (not e!144288))))

(assert (=> b!222038 (= res!108960 (not (contains!1496 Nil!3277 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222039 () Bool)

(declare-fun res!108955 () Bool)

(assert (=> b!222039 (=> (not res!108955) (not e!144288))))

(declare-fun noDuplicate!67 (List!3280) Bool)

(assert (=> b!222039 (= res!108955 (noDuplicate!67 Nil!3277))))

(declare-fun b!222040 () Bool)

(declare-fun res!108951 () Bool)

(assert (=> b!222040 (= res!108951 (= (select (arr!5170 (_keys!6235 thiss!1504)) (index!5489 lt!112402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222040 (=> (not res!108951) (not e!144277))))

(assert (= (and start!21908 res!108956) b!222021))

(assert (= (and b!222021 res!108950) b!222033))

(assert (= (and b!222033 res!108959) b!222030))

(assert (= (and b!222030 c!36895) b!222023))

(assert (= (and b!222030 (not c!36895)) b!222031))

(assert (= (and b!222031 c!36897) b!222036))

(assert (= (and b!222031 (not c!36897)) b!222013))

(assert (= (and b!222036 res!108953) b!222015))

(assert (= (and b!222015 res!108958) b!222035))

(assert (= (and b!222013 c!36896) b!222014))

(assert (= (and b!222013 (not c!36896)) b!222016))

(assert (= (and b!222014 res!108961) b!222040))

(assert (= (and b!222040 res!108951) b!222029))

(assert (= (or b!222036 b!222014) bm!20721))

(assert (= (or b!222035 b!222029) bm!20720))

(assert (= (and b!222030 res!108947) b!222022))

(assert (= (and b!222022 c!36898) b!222028))

(assert (= (and b!222022 (not c!36898)) b!222020))

(assert (= (and b!222022 res!108949) b!222039))

(assert (= (and b!222039 res!108955) b!222025))

(assert (= (and b!222025 res!108957) b!222038))

(assert (= (and b!222038 res!108960) b!222017))

(assert (= (and b!222017 res!108962) b!222037))

(assert (= (and b!222017 (not res!108948)) b!222019))

(assert (= (and b!222019 res!108954) b!222026))

(assert (= (and b!222017 res!108952) b!222024))

(assert (= (and b!222027 condMapEmpty!9919) mapIsEmpty!9919))

(assert (= (and b!222027 (not condMapEmpty!9919)) mapNonEmpty!9919))

(assert (= (and mapNonEmpty!9919 ((_ is ValueCellFull!2573) mapValue!9919)) b!222034))

(assert (= (and b!222027 ((_ is ValueCellFull!2573) mapDefault!9919)) b!222032))

(assert (= b!222018 b!222027))

(assert (= start!21908 b!222018))

(declare-fun m!245809 () Bool)

(assert (=> b!222024 m!245809))

(declare-fun m!245811 () Bool)

(assert (=> b!222025 m!245811))

(declare-fun m!245813 () Bool)

(assert (=> b!222018 m!245813))

(declare-fun m!245815 () Bool)

(assert (=> b!222018 m!245815))

(declare-fun m!245817 () Bool)

(assert (=> mapNonEmpty!9919 m!245817))

(declare-fun m!245819 () Bool)

(assert (=> b!222023 m!245819))

(declare-fun m!245821 () Bool)

(assert (=> b!222033 m!245821))

(declare-fun m!245823 () Bool)

(assert (=> b!222026 m!245823))

(declare-fun m!245825 () Bool)

(assert (=> b!222038 m!245825))

(declare-fun m!245827 () Bool)

(assert (=> b!222039 m!245827))

(declare-fun m!245829 () Bool)

(assert (=> b!222015 m!245829))

(declare-fun m!245831 () Bool)

(assert (=> b!222040 m!245831))

(declare-fun m!245833 () Bool)

(assert (=> bm!20720 m!245833))

(declare-fun m!245835 () Bool)

(assert (=> start!21908 m!245835))

(assert (=> b!222037 m!245823))

(assert (=> b!222022 m!245833))

(declare-fun m!245837 () Bool)

(assert (=> bm!20721 m!245837))

(declare-fun m!245839 () Bool)

(assert (=> b!222030 m!245839))

(declare-fun m!245841 () Bool)

(assert (=> b!222030 m!245841))

(assert (=> b!222030 m!245841))

(declare-fun m!245843 () Bool)

(assert (=> b!222030 m!245843))

(declare-fun m!245845 () Bool)

(assert (=> b!222028 m!245845))

(declare-fun m!245847 () Bool)

(assert (=> b!222031 m!245847))

(check-sat (not b!222037) (not b!222022) (not bm!20720) (not b!222031) b_and!12843 (not b!222023) (not b!222024) tp_is_empty!5833 (not b_next!5971) (not mapNonEmpty!9919) (not bm!20721) (not start!21908) (not b!222030) (not b!222025) (not b!222028) (not b!222018) (not b!222038) (not b!222033) (not b!222026) (not b!222039))
(check-sat b_and!12843 (not b_next!5971))
