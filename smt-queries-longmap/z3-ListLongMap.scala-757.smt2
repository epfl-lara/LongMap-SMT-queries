; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17732 () Bool)

(assert start!17732)

(declare-fun b!177279 () Bool)

(declare-fun b_free!4381 () Bool)

(declare-fun b_next!4381 () Bool)

(assert (=> b!177279 (= b_free!4381 (not b_next!4381))))

(declare-fun tp!15843 () Bool)

(declare-fun b_and!10895 () Bool)

(assert (=> b!177279 (= tp!15843 b_and!10895)))

(declare-fun e!116902 () Bool)

(declare-fun tp_is_empty!4153 () Bool)

(declare-datatypes ((V!5185 0))(
  ( (V!5186 (val!2121 Int)) )
))
(declare-datatypes ((ValueCell!1733 0))(
  ( (ValueCellFull!1733 (v!4002 V!5185)) (EmptyCell!1733) )
))
(declare-datatypes ((array!7443 0))(
  ( (array!7444 (arr!3530 (Array (_ BitVec 32) (_ BitVec 64))) (size!3834 (_ BitVec 32))) )
))
(declare-datatypes ((array!7445 0))(
  ( (array!7446 (arr!3531 (Array (_ BitVec 32) ValueCell!1733)) (size!3835 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2374 0))(
  ( (LongMapFixedSize!2375 (defaultEntry!3650 Int) (mask!8586 (_ BitVec 32)) (extraKeys!3387 (_ BitVec 32)) (zeroValue!3491 V!5185) (minValue!3491 V!5185) (_size!1236 (_ BitVec 32)) (_keys!5517 array!7443) (_values!3633 array!7445) (_vacant!1236 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2374)

(declare-fun e!116906 () Bool)

(declare-fun array_inv!2279 (array!7443) Bool)

(declare-fun array_inv!2280 (array!7445) Bool)

(assert (=> b!177279 (= e!116906 (and tp!15843 tp_is_empty!4153 (array_inv!2279 (_keys!5517 thiss!1248)) (array_inv!2280 (_values!3633 thiss!1248)) e!116902))))

(declare-fun b!177280 () Bool)

(declare-fun e!116905 () Bool)

(declare-fun mapRes!7092 () Bool)

(assert (=> b!177280 (= e!116902 (and e!116905 mapRes!7092))))

(declare-fun condMapEmpty!7092 () Bool)

(declare-fun mapDefault!7092 () ValueCell!1733)

(assert (=> b!177280 (= condMapEmpty!7092 (= (arr!3531 (_values!3633 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1733)) mapDefault!7092)))))

(declare-fun mapIsEmpty!7092 () Bool)

(assert (=> mapIsEmpty!7092 mapRes!7092))

(declare-fun b!177282 () Bool)

(declare-fun res!84038 () Bool)

(declare-fun e!116901 () Bool)

(assert (=> b!177282 (=> (not res!84038) (not e!116901))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!562 0))(
  ( (MissingZero!562 (index!4416 (_ BitVec 32))) (Found!562 (index!4417 (_ BitVec 32))) (Intermediate!562 (undefined!1374 Bool) (index!4418 (_ BitVec 32)) (x!19442 (_ BitVec 32))) (Undefined!562) (MissingVacant!562 (index!4419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7443 (_ BitVec 32)) SeekEntryResult!562)

(assert (=> b!177282 (= res!84038 ((_ is Undefined!562) (seekEntryOrOpen!0 key!828 (_keys!5517 thiss!1248) (mask!8586 thiss!1248))))))

(declare-fun b!177283 () Bool)

(declare-fun res!84035 () Bool)

(assert (=> b!177283 (=> (not res!84035) (not e!116901))))

(assert (=> b!177283 (= res!84035 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177284 () Bool)

(declare-fun e!116903 () Bool)

(assert (=> b!177284 (= e!116903 tp_is_empty!4153)))

(declare-fun b!177285 () Bool)

(assert (=> b!177285 (= e!116905 tp_is_empty!4153)))

(declare-fun res!84036 () Bool)

(assert (=> start!17732 (=> (not res!84036) (not e!116901))))

(declare-fun valid!1015 (LongMapFixedSize!2374) Bool)

(assert (=> start!17732 (= res!84036 (valid!1015 thiss!1248))))

(assert (=> start!17732 e!116901))

(assert (=> start!17732 e!116906))

(assert (=> start!17732 true))

(declare-fun b!177281 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177281 (= e!116901 (not (validMask!0 (mask!8586 thiss!1248))))))

(declare-fun mapNonEmpty!7092 () Bool)

(declare-fun tp!15842 () Bool)

(assert (=> mapNonEmpty!7092 (= mapRes!7092 (and tp!15842 e!116903))))

(declare-fun mapRest!7092 () (Array (_ BitVec 32) ValueCell!1733))

(declare-fun mapKey!7092 () (_ BitVec 32))

(declare-fun mapValue!7092 () ValueCell!1733)

(assert (=> mapNonEmpty!7092 (= (arr!3531 (_values!3633 thiss!1248)) (store mapRest!7092 mapKey!7092 mapValue!7092))))

(declare-fun b!177286 () Bool)

(declare-fun res!84037 () Bool)

(assert (=> b!177286 (=> (not res!84037) (not e!116901))))

(declare-datatypes ((tuple2!3252 0))(
  ( (tuple2!3253 (_1!1637 (_ BitVec 64)) (_2!1637 V!5185)) )
))
(declare-datatypes ((List!2225 0))(
  ( (Nil!2222) (Cons!2221 (h!2842 tuple2!3252) (t!7047 List!2225)) )
))
(declare-datatypes ((ListLongMap!2185 0))(
  ( (ListLongMap!2186 (toList!1108 List!2225)) )
))
(declare-fun contains!1185 (ListLongMap!2185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!763 (array!7443 array!7445 (_ BitVec 32) (_ BitVec 32) V!5185 V!5185 (_ BitVec 32) Int) ListLongMap!2185)

(assert (=> b!177286 (= res!84037 (not (contains!1185 (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)) key!828)))))

(assert (= (and start!17732 res!84036) b!177283))

(assert (= (and b!177283 res!84035) b!177282))

(assert (= (and b!177282 res!84038) b!177286))

(assert (= (and b!177286 res!84037) b!177281))

(assert (= (and b!177280 condMapEmpty!7092) mapIsEmpty!7092))

(assert (= (and b!177280 (not condMapEmpty!7092)) mapNonEmpty!7092))

(assert (= (and mapNonEmpty!7092 ((_ is ValueCellFull!1733) mapValue!7092)) b!177284))

(assert (= (and b!177280 ((_ is ValueCellFull!1733) mapDefault!7092)) b!177285))

(assert (= b!177279 b!177280))

(assert (= start!17732 b!177279))

(declare-fun m!205975 () Bool)

(assert (=> b!177282 m!205975))

(declare-fun m!205977 () Bool)

(assert (=> start!17732 m!205977))

(declare-fun m!205979 () Bool)

(assert (=> mapNonEmpty!7092 m!205979))

(declare-fun m!205981 () Bool)

(assert (=> b!177281 m!205981))

(declare-fun m!205983 () Bool)

(assert (=> b!177279 m!205983))

(declare-fun m!205985 () Bool)

(assert (=> b!177279 m!205985))

(declare-fun m!205987 () Bool)

(assert (=> b!177286 m!205987))

(assert (=> b!177286 m!205987))

(declare-fun m!205989 () Bool)

(assert (=> b!177286 m!205989))

(check-sat (not start!17732) (not b_next!4381) (not b!177279) (not b!177282) (not mapNonEmpty!7092) (not b!177281) (not b!177286) b_and!10895 tp_is_empty!4153)
(check-sat b_and!10895 (not b_next!4381))
(get-model)

(declare-fun d!53807 () Bool)

(declare-fun lt!87651 () SeekEntryResult!562)

(assert (=> d!53807 (and (or ((_ is Undefined!562) lt!87651) (not ((_ is Found!562) lt!87651)) (and (bvsge (index!4417 lt!87651) #b00000000000000000000000000000000) (bvslt (index!4417 lt!87651) (size!3834 (_keys!5517 thiss!1248))))) (or ((_ is Undefined!562) lt!87651) ((_ is Found!562) lt!87651) (not ((_ is MissingZero!562) lt!87651)) (and (bvsge (index!4416 lt!87651) #b00000000000000000000000000000000) (bvslt (index!4416 lt!87651) (size!3834 (_keys!5517 thiss!1248))))) (or ((_ is Undefined!562) lt!87651) ((_ is Found!562) lt!87651) ((_ is MissingZero!562) lt!87651) (not ((_ is MissingVacant!562) lt!87651)) (and (bvsge (index!4419 lt!87651) #b00000000000000000000000000000000) (bvslt (index!4419 lt!87651) (size!3834 (_keys!5517 thiss!1248))))) (or ((_ is Undefined!562) lt!87651) (ite ((_ is Found!562) lt!87651) (= (select (arr!3530 (_keys!5517 thiss!1248)) (index!4417 lt!87651)) key!828) (ite ((_ is MissingZero!562) lt!87651) (= (select (arr!3530 (_keys!5517 thiss!1248)) (index!4416 lt!87651)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!562) lt!87651) (= (select (arr!3530 (_keys!5517 thiss!1248)) (index!4419 lt!87651)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!116950 () SeekEntryResult!562)

(assert (=> d!53807 (= lt!87651 e!116950)))

(declare-fun c!31753 () Bool)

(declare-fun lt!87652 () SeekEntryResult!562)

(assert (=> d!53807 (= c!31753 (and ((_ is Intermediate!562) lt!87652) (undefined!1374 lt!87652)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7443 (_ BitVec 32)) SeekEntryResult!562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53807 (= lt!87652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8586 thiss!1248)) key!828 (_keys!5517 thiss!1248) (mask!8586 thiss!1248)))))

(assert (=> d!53807 (validMask!0 (mask!8586 thiss!1248))))

(assert (=> d!53807 (= (seekEntryOrOpen!0 key!828 (_keys!5517 thiss!1248) (mask!8586 thiss!1248)) lt!87651)))

(declare-fun b!177347 () Bool)

(declare-fun e!116949 () SeekEntryResult!562)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7443 (_ BitVec 32)) SeekEntryResult!562)

(assert (=> b!177347 (= e!116949 (seekKeyOrZeroReturnVacant!0 (x!19442 lt!87652) (index!4418 lt!87652) (index!4418 lt!87652) key!828 (_keys!5517 thiss!1248) (mask!8586 thiss!1248)))))

(declare-fun b!177348 () Bool)

(declare-fun c!31754 () Bool)

(declare-fun lt!87653 () (_ BitVec 64))

(assert (=> b!177348 (= c!31754 (= lt!87653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116951 () SeekEntryResult!562)

(assert (=> b!177348 (= e!116951 e!116949)))

(declare-fun b!177349 () Bool)

(assert (=> b!177349 (= e!116949 (MissingZero!562 (index!4418 lt!87652)))))

(declare-fun b!177350 () Bool)

(assert (=> b!177350 (= e!116950 e!116951)))

(assert (=> b!177350 (= lt!87653 (select (arr!3530 (_keys!5517 thiss!1248)) (index!4418 lt!87652)))))

(declare-fun c!31752 () Bool)

(assert (=> b!177350 (= c!31752 (= lt!87653 key!828))))

(declare-fun b!177351 () Bool)

(assert (=> b!177351 (= e!116951 (Found!562 (index!4418 lt!87652)))))

(declare-fun b!177352 () Bool)

(assert (=> b!177352 (= e!116950 Undefined!562)))

(assert (= (and d!53807 c!31753) b!177352))

(assert (= (and d!53807 (not c!31753)) b!177350))

(assert (= (and b!177350 c!31752) b!177351))

(assert (= (and b!177350 (not c!31752)) b!177348))

(assert (= (and b!177348 c!31754) b!177349))

(assert (= (and b!177348 (not c!31754)) b!177347))

(declare-fun m!206023 () Bool)

(assert (=> d!53807 m!206023))

(assert (=> d!53807 m!205981))

(declare-fun m!206025 () Bool)

(assert (=> d!53807 m!206025))

(declare-fun m!206027 () Bool)

(assert (=> d!53807 m!206027))

(declare-fun m!206029 () Bool)

(assert (=> d!53807 m!206029))

(assert (=> d!53807 m!206025))

(declare-fun m!206031 () Bool)

(assert (=> d!53807 m!206031))

(declare-fun m!206033 () Bool)

(assert (=> b!177347 m!206033))

(declare-fun m!206035 () Bool)

(assert (=> b!177350 m!206035))

(assert (=> b!177282 d!53807))

(declare-fun d!53809 () Bool)

(declare-fun e!116957 () Bool)

(assert (=> d!53809 e!116957))

(declare-fun res!84065 () Bool)

(assert (=> d!53809 (=> res!84065 e!116957)))

(declare-fun lt!87665 () Bool)

(assert (=> d!53809 (= res!84065 (not lt!87665))))

(declare-fun lt!87662 () Bool)

(assert (=> d!53809 (= lt!87665 lt!87662)))

(declare-datatypes ((Unit!5419 0))(
  ( (Unit!5420) )
))
(declare-fun lt!87663 () Unit!5419)

(declare-fun e!116956 () Unit!5419)

(assert (=> d!53809 (= lt!87663 e!116956)))

(declare-fun c!31757 () Bool)

(assert (=> d!53809 (= c!31757 lt!87662)))

(declare-fun containsKey!199 (List!2225 (_ BitVec 64)) Bool)

(assert (=> d!53809 (= lt!87662 (containsKey!199 (toList!1108 (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828))))

(assert (=> d!53809 (= (contains!1185 (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)) key!828) lt!87665)))

(declare-fun b!177359 () Bool)

(declare-fun lt!87664 () Unit!5419)

(assert (=> b!177359 (= e!116956 lt!87664)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!147 (List!2225 (_ BitVec 64)) Unit!5419)

(assert (=> b!177359 (= lt!87664 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1108 (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828))))

(declare-datatypes ((Option!202 0))(
  ( (Some!201 (v!4005 V!5185)) (None!200) )
))
(declare-fun isDefined!148 (Option!202) Bool)

(declare-fun getValueByKey!196 (List!2225 (_ BitVec 64)) Option!202)

(assert (=> b!177359 (isDefined!148 (getValueByKey!196 (toList!1108 (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828))))

(declare-fun b!177360 () Bool)

(declare-fun Unit!5421 () Unit!5419)

(assert (=> b!177360 (= e!116956 Unit!5421)))

(declare-fun b!177361 () Bool)

(assert (=> b!177361 (= e!116957 (isDefined!148 (getValueByKey!196 (toList!1108 (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828)))))

(assert (= (and d!53809 c!31757) b!177359))

(assert (= (and d!53809 (not c!31757)) b!177360))

(assert (= (and d!53809 (not res!84065)) b!177361))

(declare-fun m!206037 () Bool)

(assert (=> d!53809 m!206037))

(declare-fun m!206039 () Bool)

(assert (=> b!177359 m!206039))

(declare-fun m!206041 () Bool)

(assert (=> b!177359 m!206041))

(assert (=> b!177359 m!206041))

(declare-fun m!206043 () Bool)

(assert (=> b!177359 m!206043))

(assert (=> b!177361 m!206041))

(assert (=> b!177361 m!206041))

(assert (=> b!177361 m!206043))

(assert (=> b!177286 d!53809))

(declare-fun b!177404 () Bool)

(declare-fun e!116990 () Bool)

(declare-fun e!116985 () Bool)

(assert (=> b!177404 (= e!116990 e!116985)))

(declare-fun c!31773 () Bool)

(assert (=> b!177404 (= c!31773 (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177405 () Bool)

(declare-fun e!116995 () Unit!5419)

(declare-fun Unit!5422 () Unit!5419)

(assert (=> b!177405 (= e!116995 Unit!5422)))

(declare-fun b!177406 () Bool)

(declare-fun c!31772 () Bool)

(assert (=> b!177406 (= c!31772 (and (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116991 () ListLongMap!2185)

(declare-fun e!116994 () ListLongMap!2185)

(assert (=> b!177406 (= e!116991 e!116994)))

(declare-fun bm!17923 () Bool)

(declare-fun call!17927 () Bool)

(declare-fun lt!87728 () ListLongMap!2185)

(assert (=> bm!17923 (= call!17927 (contains!1185 lt!87728 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17924 () Bool)

(declare-fun call!17930 () ListLongMap!2185)

(declare-fun call!17932 () ListLongMap!2185)

(assert (=> bm!17924 (= call!17930 call!17932)))

(declare-fun b!177408 () Bool)

(declare-fun e!116993 () Bool)

(declare-fun call!17931 () Bool)

(assert (=> b!177408 (= e!116993 (not call!17931))))

(declare-fun b!177409 () Bool)

(declare-fun e!116992 () Bool)

(assert (=> b!177409 (= e!116985 e!116992)))

(declare-fun res!84088 () Bool)

(assert (=> b!177409 (= res!84088 call!17927)))

(assert (=> b!177409 (=> (not res!84088) (not e!116992))))

(declare-fun b!177410 () Bool)

(assert (=> b!177410 (= e!116985 (not call!17927))))

(declare-fun bm!17925 () Bool)

(assert (=> bm!17925 (= call!17931 (contains!1185 lt!87728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17926 () Bool)

(declare-fun call!17928 () ListLongMap!2185)

(declare-fun call!17929 () ListLongMap!2185)

(assert (=> bm!17926 (= call!17928 call!17929)))

(declare-fun b!177411 () Bool)

(declare-fun call!17926 () ListLongMap!2185)

(assert (=> b!177411 (= e!116994 call!17926)))

(declare-fun b!177412 () Bool)

(declare-fun e!116996 () Bool)

(assert (=> b!177412 (= e!116993 e!116996)))

(declare-fun res!84090 () Bool)

(assert (=> b!177412 (= res!84090 call!17931)))

(assert (=> b!177412 (=> (not res!84090) (not e!116996))))

(declare-fun b!177413 () Bool)

(declare-fun res!84091 () Bool)

(assert (=> b!177413 (=> (not res!84091) (not e!116990))))

(declare-fun e!116987 () Bool)

(assert (=> b!177413 (= res!84091 e!116987)))

(declare-fun res!84084 () Bool)

(assert (=> b!177413 (=> res!84084 e!116987)))

(declare-fun e!116986 () Bool)

(assert (=> b!177413 (= res!84084 (not e!116986))))

(declare-fun res!84092 () Bool)

(assert (=> b!177413 (=> (not res!84092) (not e!116986))))

(assert (=> b!177413 (= res!84092 (bvslt #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))))))

(declare-fun b!177414 () Bool)

(declare-fun e!116988 () Bool)

(assert (=> b!177414 (= e!116987 e!116988)))

(declare-fun res!84089 () Bool)

(assert (=> b!177414 (=> (not res!84089) (not e!116988))))

(assert (=> b!177414 (= res!84089 (contains!1185 lt!87728 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))))))

(declare-fun b!177415 () Bool)

(declare-fun lt!87712 () Unit!5419)

(assert (=> b!177415 (= e!116995 lt!87712)))

(declare-fun lt!87714 () ListLongMap!2185)

(declare-fun getCurrentListMapNoExtraKeys!171 (array!7443 array!7445 (_ BitVec 32) (_ BitVec 32) V!5185 V!5185 (_ BitVec 32) Int) ListLongMap!2185)

(assert (=> b!177415 (= lt!87714 (getCurrentListMapNoExtraKeys!171 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87725 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87725 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87721 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87721 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87710 () Unit!5419)

(declare-fun addStillContains!116 (ListLongMap!2185 (_ BitVec 64) V!5185 (_ BitVec 64)) Unit!5419)

(assert (=> b!177415 (= lt!87710 (addStillContains!116 lt!87714 lt!87725 (zeroValue!3491 thiss!1248) lt!87721))))

(declare-fun +!257 (ListLongMap!2185 tuple2!3252) ListLongMap!2185)

(assert (=> b!177415 (contains!1185 (+!257 lt!87714 (tuple2!3253 lt!87725 (zeroValue!3491 thiss!1248))) lt!87721)))

(declare-fun lt!87719 () Unit!5419)

(assert (=> b!177415 (= lt!87719 lt!87710)))

(declare-fun lt!87718 () ListLongMap!2185)

(assert (=> b!177415 (= lt!87718 (getCurrentListMapNoExtraKeys!171 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87726 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87726 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87713 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87713 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87729 () Unit!5419)

(declare-fun addApplyDifferent!116 (ListLongMap!2185 (_ BitVec 64) V!5185 (_ BitVec 64)) Unit!5419)

(assert (=> b!177415 (= lt!87729 (addApplyDifferent!116 lt!87718 lt!87726 (minValue!3491 thiss!1248) lt!87713))))

(declare-fun apply!140 (ListLongMap!2185 (_ BitVec 64)) V!5185)

(assert (=> b!177415 (= (apply!140 (+!257 lt!87718 (tuple2!3253 lt!87726 (minValue!3491 thiss!1248))) lt!87713) (apply!140 lt!87718 lt!87713))))

(declare-fun lt!87723 () Unit!5419)

(assert (=> b!177415 (= lt!87723 lt!87729)))

(declare-fun lt!87716 () ListLongMap!2185)

(assert (=> b!177415 (= lt!87716 (getCurrentListMapNoExtraKeys!171 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87715 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87720 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87720 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87727 () Unit!5419)

(assert (=> b!177415 (= lt!87727 (addApplyDifferent!116 lt!87716 lt!87715 (zeroValue!3491 thiss!1248) lt!87720))))

(assert (=> b!177415 (= (apply!140 (+!257 lt!87716 (tuple2!3253 lt!87715 (zeroValue!3491 thiss!1248))) lt!87720) (apply!140 lt!87716 lt!87720))))

(declare-fun lt!87711 () Unit!5419)

(assert (=> b!177415 (= lt!87711 lt!87727)))

(declare-fun lt!87724 () ListLongMap!2185)

(assert (=> b!177415 (= lt!87724 (getCurrentListMapNoExtraKeys!171 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87722 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87722 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87730 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87730 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177415 (= lt!87712 (addApplyDifferent!116 lt!87724 lt!87722 (minValue!3491 thiss!1248) lt!87730))))

(assert (=> b!177415 (= (apply!140 (+!257 lt!87724 (tuple2!3253 lt!87722 (minValue!3491 thiss!1248))) lt!87730) (apply!140 lt!87724 lt!87730))))

(declare-fun b!177407 () Bool)

(assert (=> b!177407 (= e!116992 (= (apply!140 lt!87728 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3491 thiss!1248)))))

(declare-fun d!53811 () Bool)

(assert (=> d!53811 e!116990))

(declare-fun res!84087 () Bool)

(assert (=> d!53811 (=> (not res!84087) (not e!116990))))

(assert (=> d!53811 (= res!84087 (or (bvsge #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))))))))

(declare-fun lt!87717 () ListLongMap!2185)

(assert (=> d!53811 (= lt!87728 lt!87717)))

(declare-fun lt!87731 () Unit!5419)

(assert (=> d!53811 (= lt!87731 e!116995)))

(declare-fun c!31774 () Bool)

(declare-fun e!116989 () Bool)

(assert (=> d!53811 (= c!31774 e!116989)))

(declare-fun res!84086 () Bool)

(assert (=> d!53811 (=> (not res!84086) (not e!116989))))

(assert (=> d!53811 (= res!84086 (bvslt #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))))))

(declare-fun e!116984 () ListLongMap!2185)

(assert (=> d!53811 (= lt!87717 e!116984)))

(declare-fun c!31770 () Bool)

(assert (=> d!53811 (= c!31770 (and (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53811 (validMask!0 (mask!8586 thiss!1248))))

(assert (=> d!53811 (= (getCurrentListMap!763 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)) lt!87728)))

(declare-fun b!177416 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177416 (= e!116989 (validKeyInArray!0 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177417 () Bool)

(declare-fun get!2023 (ValueCell!1733 V!5185) V!5185)

(declare-fun dynLambda!483 (Int (_ BitVec 64)) V!5185)

(assert (=> b!177417 (= e!116988 (= (apply!140 lt!87728 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000)) (get!2023 (select (arr!3531 (_values!3633 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!483 (defaultEntry!3650 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3835 (_values!3633 thiss!1248))))))

(assert (=> b!177417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))))))

(declare-fun bm!17927 () Bool)

(assert (=> bm!17927 (= call!17929 (getCurrentListMapNoExtraKeys!171 (_keys!5517 thiss!1248) (_values!3633 thiss!1248) (mask!8586 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun b!177418 () Bool)

(assert (=> b!177418 (= e!116984 e!116991)))

(declare-fun c!31771 () Bool)

(assert (=> b!177418 (= c!31771 (and (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177419 () Bool)

(assert (=> b!177419 (= e!116986 (validKeyInArray!0 (select (arr!3530 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177420 () Bool)

(assert (=> b!177420 (= e!116994 call!17930)))

(declare-fun b!177421 () Bool)

(assert (=> b!177421 (= e!116991 call!17930)))

(declare-fun bm!17928 () Bool)

(assert (=> bm!17928 (= call!17926 call!17928)))

(declare-fun b!177422 () Bool)

(assert (=> b!177422 (= e!116996 (= (apply!140 lt!87728 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3491 thiss!1248)))))

(declare-fun bm!17929 () Bool)

(assert (=> bm!17929 (= call!17932 (+!257 (ite c!31770 call!17929 (ite c!31771 call!17928 call!17926)) (ite (or c!31770 c!31771) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3491 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3491 thiss!1248)))))))

(declare-fun b!177423 () Bool)

(declare-fun res!84085 () Bool)

(assert (=> b!177423 (=> (not res!84085) (not e!116990))))

(assert (=> b!177423 (= res!84085 e!116993)))

(declare-fun c!31775 () Bool)

(assert (=> b!177423 (= c!31775 (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177424 () Bool)

(assert (=> b!177424 (= e!116984 (+!257 call!17932 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3491 thiss!1248))))))

(assert (= (and d!53811 c!31770) b!177424))

(assert (= (and d!53811 (not c!31770)) b!177418))

(assert (= (and b!177418 c!31771) b!177421))

(assert (= (and b!177418 (not c!31771)) b!177406))

(assert (= (and b!177406 c!31772) b!177420))

(assert (= (and b!177406 (not c!31772)) b!177411))

(assert (= (or b!177420 b!177411) bm!17928))

(assert (= (or b!177421 bm!17928) bm!17926))

(assert (= (or b!177421 b!177420) bm!17924))

(assert (= (or b!177424 bm!17926) bm!17927))

(assert (= (or b!177424 bm!17924) bm!17929))

(assert (= (and d!53811 res!84086) b!177416))

(assert (= (and d!53811 c!31774) b!177415))

(assert (= (and d!53811 (not c!31774)) b!177405))

(assert (= (and d!53811 res!84087) b!177413))

(assert (= (and b!177413 res!84092) b!177419))

(assert (= (and b!177413 (not res!84084)) b!177414))

(assert (= (and b!177414 res!84089) b!177417))

(assert (= (and b!177413 res!84091) b!177423))

(assert (= (and b!177423 c!31775) b!177412))

(assert (= (and b!177423 (not c!31775)) b!177408))

(assert (= (and b!177412 res!84090) b!177422))

(assert (= (or b!177412 b!177408) bm!17925))

(assert (= (and b!177423 res!84085) b!177404))

(assert (= (and b!177404 c!31773) b!177409))

(assert (= (and b!177404 (not c!31773)) b!177410))

(assert (= (and b!177409 res!84088) b!177407))

(assert (= (or b!177409 b!177410) bm!17923))

(declare-fun b_lambda!7073 () Bool)

(assert (=> (not b_lambda!7073) (not b!177417)))

(declare-fun t!7051 () Bool)

(declare-fun tb!2783 () Bool)

(assert (=> (and b!177279 (= (defaultEntry!3650 thiss!1248) (defaultEntry!3650 thiss!1248)) t!7051) tb!2783))

(declare-fun result!4639 () Bool)

(assert (=> tb!2783 (= result!4639 tp_is_empty!4153)))

(assert (=> b!177417 t!7051))

(declare-fun b_and!10901 () Bool)

(assert (= b_and!10895 (and (=> t!7051 result!4639) b_and!10901)))

(declare-fun m!206045 () Bool)

(assert (=> b!177407 m!206045))

(declare-fun m!206047 () Bool)

(assert (=> bm!17929 m!206047))

(declare-fun m!206049 () Bool)

(assert (=> bm!17925 m!206049))

(declare-fun m!206051 () Bool)

(assert (=> bm!17923 m!206051))

(assert (=> d!53811 m!205981))

(declare-fun m!206053 () Bool)

(assert (=> bm!17927 m!206053))

(declare-fun m!206055 () Bool)

(assert (=> b!177416 m!206055))

(assert (=> b!177416 m!206055))

(declare-fun m!206057 () Bool)

(assert (=> b!177416 m!206057))

(assert (=> b!177414 m!206055))

(assert (=> b!177414 m!206055))

(declare-fun m!206059 () Bool)

(assert (=> b!177414 m!206059))

(declare-fun m!206061 () Bool)

(assert (=> b!177415 m!206061))

(declare-fun m!206063 () Bool)

(assert (=> b!177415 m!206063))

(declare-fun m!206065 () Bool)

(assert (=> b!177415 m!206065))

(declare-fun m!206067 () Bool)

(assert (=> b!177415 m!206067))

(declare-fun m!206069 () Bool)

(assert (=> b!177415 m!206069))

(declare-fun m!206071 () Bool)

(assert (=> b!177415 m!206071))

(declare-fun m!206073 () Bool)

(assert (=> b!177415 m!206073))

(declare-fun m!206075 () Bool)

(assert (=> b!177415 m!206075))

(assert (=> b!177415 m!206071))

(declare-fun m!206077 () Bool)

(assert (=> b!177415 m!206077))

(declare-fun m!206079 () Bool)

(assert (=> b!177415 m!206079))

(assert (=> b!177415 m!206063))

(declare-fun m!206081 () Bool)

(assert (=> b!177415 m!206081))

(assert (=> b!177415 m!206055))

(assert (=> b!177415 m!206069))

(declare-fun m!206083 () Bool)

(assert (=> b!177415 m!206083))

(declare-fun m!206085 () Bool)

(assert (=> b!177415 m!206085))

(assert (=> b!177415 m!206053))

(declare-fun m!206087 () Bool)

(assert (=> b!177415 m!206087))

(assert (=> b!177415 m!206073))

(declare-fun m!206089 () Bool)

(assert (=> b!177415 m!206089))

(declare-fun m!206091 () Bool)

(assert (=> b!177424 m!206091))

(declare-fun m!206093 () Bool)

(assert (=> b!177422 m!206093))

(assert (=> b!177419 m!206055))

(assert (=> b!177419 m!206055))

(assert (=> b!177419 m!206057))

(assert (=> b!177417 m!206055))

(declare-fun m!206095 () Bool)

(assert (=> b!177417 m!206095))

(declare-fun m!206097 () Bool)

(assert (=> b!177417 m!206097))

(assert (=> b!177417 m!206055))

(declare-fun m!206099 () Bool)

(assert (=> b!177417 m!206099))

(assert (=> b!177417 m!206097))

(assert (=> b!177417 m!206095))

(declare-fun m!206101 () Bool)

(assert (=> b!177417 m!206101))

(assert (=> b!177286 d!53811))

(declare-fun d!53813 () Bool)

(assert (=> d!53813 (= (validMask!0 (mask!8586 thiss!1248)) (and (or (= (mask!8586 thiss!1248) #b00000000000000000000000000000111) (= (mask!8586 thiss!1248) #b00000000000000000000000000001111) (= (mask!8586 thiss!1248) #b00000000000000000000000000011111) (= (mask!8586 thiss!1248) #b00000000000000000000000000111111) (= (mask!8586 thiss!1248) #b00000000000000000000000001111111) (= (mask!8586 thiss!1248) #b00000000000000000000000011111111) (= (mask!8586 thiss!1248) #b00000000000000000000000111111111) (= (mask!8586 thiss!1248) #b00000000000000000000001111111111) (= (mask!8586 thiss!1248) #b00000000000000000000011111111111) (= (mask!8586 thiss!1248) #b00000000000000000000111111111111) (= (mask!8586 thiss!1248) #b00000000000000000001111111111111) (= (mask!8586 thiss!1248) #b00000000000000000011111111111111) (= (mask!8586 thiss!1248) #b00000000000000000111111111111111) (= (mask!8586 thiss!1248) #b00000000000000001111111111111111) (= (mask!8586 thiss!1248) #b00000000000000011111111111111111) (= (mask!8586 thiss!1248) #b00000000000000111111111111111111) (= (mask!8586 thiss!1248) #b00000000000001111111111111111111) (= (mask!8586 thiss!1248) #b00000000000011111111111111111111) (= (mask!8586 thiss!1248) #b00000000000111111111111111111111) (= (mask!8586 thiss!1248) #b00000000001111111111111111111111) (= (mask!8586 thiss!1248) #b00000000011111111111111111111111) (= (mask!8586 thiss!1248) #b00000000111111111111111111111111) (= (mask!8586 thiss!1248) #b00000001111111111111111111111111) (= (mask!8586 thiss!1248) #b00000011111111111111111111111111) (= (mask!8586 thiss!1248) #b00000111111111111111111111111111) (= (mask!8586 thiss!1248) #b00001111111111111111111111111111) (= (mask!8586 thiss!1248) #b00011111111111111111111111111111) (= (mask!8586 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8586 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177281 d!53813))

(declare-fun d!53815 () Bool)

(declare-fun res!84099 () Bool)

(declare-fun e!116999 () Bool)

(assert (=> d!53815 (=> (not res!84099) (not e!116999))))

(declare-fun simpleValid!154 (LongMapFixedSize!2374) Bool)

(assert (=> d!53815 (= res!84099 (simpleValid!154 thiss!1248))))

(assert (=> d!53815 (= (valid!1015 thiss!1248) e!116999)))

(declare-fun b!177433 () Bool)

(declare-fun res!84100 () Bool)

(assert (=> b!177433 (=> (not res!84100) (not e!116999))))

(declare-fun arrayCountValidKeys!0 (array!7443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177433 (= res!84100 (= (arrayCountValidKeys!0 (_keys!5517 thiss!1248) #b00000000000000000000000000000000 (size!3834 (_keys!5517 thiss!1248))) (_size!1236 thiss!1248)))))

(declare-fun b!177434 () Bool)

(declare-fun res!84101 () Bool)

(assert (=> b!177434 (=> (not res!84101) (not e!116999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7443 (_ BitVec 32)) Bool)

(assert (=> b!177434 (= res!84101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5517 thiss!1248) (mask!8586 thiss!1248)))))

(declare-fun b!177435 () Bool)

(declare-datatypes ((List!2228 0))(
  ( (Nil!2225) (Cons!2224 (h!2845 (_ BitVec 64)) (t!7052 List!2228)) )
))
(declare-fun arrayNoDuplicates!0 (array!7443 (_ BitVec 32) List!2228) Bool)

(assert (=> b!177435 (= e!116999 (arrayNoDuplicates!0 (_keys!5517 thiss!1248) #b00000000000000000000000000000000 Nil!2225))))

(assert (= (and d!53815 res!84099) b!177433))

(assert (= (and b!177433 res!84100) b!177434))

(assert (= (and b!177434 res!84101) b!177435))

(declare-fun m!206103 () Bool)

(assert (=> d!53815 m!206103))

(declare-fun m!206105 () Bool)

(assert (=> b!177433 m!206105))

(declare-fun m!206107 () Bool)

(assert (=> b!177434 m!206107))

(declare-fun m!206109 () Bool)

(assert (=> b!177435 m!206109))

(assert (=> start!17732 d!53815))

(declare-fun d!53817 () Bool)

(assert (=> d!53817 (= (array_inv!2279 (_keys!5517 thiss!1248)) (bvsge (size!3834 (_keys!5517 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177279 d!53817))

(declare-fun d!53819 () Bool)

(assert (=> d!53819 (= (array_inv!2280 (_values!3633 thiss!1248)) (bvsge (size!3835 (_values!3633 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177279 d!53819))

(declare-fun mapIsEmpty!7101 () Bool)

(declare-fun mapRes!7101 () Bool)

(assert (=> mapIsEmpty!7101 mapRes!7101))

(declare-fun b!177442 () Bool)

(declare-fun e!117005 () Bool)

(assert (=> b!177442 (= e!117005 tp_is_empty!4153)))

(declare-fun b!177443 () Bool)

(declare-fun e!117004 () Bool)

(assert (=> b!177443 (= e!117004 tp_is_empty!4153)))

(declare-fun condMapEmpty!7101 () Bool)

(declare-fun mapDefault!7101 () ValueCell!1733)

(assert (=> mapNonEmpty!7092 (= condMapEmpty!7101 (= mapRest!7092 ((as const (Array (_ BitVec 32) ValueCell!1733)) mapDefault!7101)))))

(assert (=> mapNonEmpty!7092 (= tp!15842 (and e!117004 mapRes!7101))))

(declare-fun mapNonEmpty!7101 () Bool)

(declare-fun tp!15858 () Bool)

(assert (=> mapNonEmpty!7101 (= mapRes!7101 (and tp!15858 e!117005))))

(declare-fun mapKey!7101 () (_ BitVec 32))

(declare-fun mapRest!7101 () (Array (_ BitVec 32) ValueCell!1733))

(declare-fun mapValue!7101 () ValueCell!1733)

(assert (=> mapNonEmpty!7101 (= mapRest!7092 (store mapRest!7101 mapKey!7101 mapValue!7101))))

(assert (= (and mapNonEmpty!7092 condMapEmpty!7101) mapIsEmpty!7101))

(assert (= (and mapNonEmpty!7092 (not condMapEmpty!7101)) mapNonEmpty!7101))

(assert (= (and mapNonEmpty!7101 ((_ is ValueCellFull!1733) mapValue!7101)) b!177442))

(assert (= (and mapNonEmpty!7092 ((_ is ValueCellFull!1733) mapDefault!7101)) b!177443))

(declare-fun m!206111 () Bool)

(assert (=> mapNonEmpty!7101 m!206111))

(declare-fun b_lambda!7075 () Bool)

(assert (= b_lambda!7073 (or (and b!177279 b_free!4381) b_lambda!7075)))

(check-sat (not b!177359) (not bm!17929) (not b!177433) (not b!177424) (not b!177415) (not b_next!4381) (not b!177419) (not d!53807) (not bm!17923) (not mapNonEmpty!7101) (not b!177407) (not b!177361) (not bm!17927) (not b!177435) (not b!177347) (not b!177422) (not b_lambda!7075) (not b!177416) tp_is_empty!4153 (not d!53811) (not bm!17925) b_and!10901 (not b!177417) (not d!53809) (not d!53815) (not b!177434) (not b!177414))
(check-sat b_and!10901 (not b_next!4381))
