; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19586 () Bool)

(assert start!19586)

(declare-fun b!192144 () Bool)

(declare-fun b_free!4687 () Bool)

(declare-fun b_next!4687 () Bool)

(assert (=> b!192144 (= b_free!4687 (not b_next!4687))))

(declare-fun tp!16915 () Bool)

(declare-fun b_and!11387 () Bool)

(assert (=> b!192144 (= tp!16915 b_and!11387)))

(declare-fun e!126431 () Bool)

(declare-fun tp_is_empty!4459 () Bool)

(declare-fun e!126428 () Bool)

(declare-datatypes ((V!5593 0))(
  ( (V!5594 (val!2274 Int)) )
))
(declare-datatypes ((ValueCell!1886 0))(
  ( (ValueCellFull!1886 (v!4220 V!5593)) (EmptyCell!1886) )
))
(declare-datatypes ((array!8145 0))(
  ( (array!8146 (arr!3836 (Array (_ BitVec 32) (_ BitVec 64))) (size!4159 (_ BitVec 32))) )
))
(declare-datatypes ((array!8147 0))(
  ( (array!8148 (arr!3837 (Array (_ BitVec 32) ValueCell!1886)) (size!4160 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2680 0))(
  ( (LongMapFixedSize!2681 (defaultEntry!3920 Int) (mask!9150 (_ BitVec 32)) (extraKeys!3657 (_ BitVec 32)) (zeroValue!3761 V!5593) (minValue!3761 V!5593) (_size!1389 (_ BitVec 32)) (_keys!5902 array!8145) (_values!3903 array!8147) (_vacant!1389 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2680)

(declare-fun array_inv!2469 (array!8145) Bool)

(declare-fun array_inv!2470 (array!8147) Bool)

(assert (=> b!192144 (= e!126431 (and tp!16915 tp_is_empty!4459 (array_inv!2469 (_keys!5902 thiss!1248)) (array_inv!2470 (_values!3903 thiss!1248)) e!126428))))

(declare-fun b!192145 () Bool)

(declare-fun e!126426 () Bool)

(assert (=> b!192145 (= e!126426 tp_is_empty!4459)))

(declare-fun b!192146 () Bool)

(declare-fun mapRes!7705 () Bool)

(assert (=> b!192146 (= e!126428 (and e!126426 mapRes!7705))))

(declare-fun condMapEmpty!7705 () Bool)

(declare-fun mapDefault!7705 () ValueCell!1886)

(assert (=> b!192146 (= condMapEmpty!7705 (= (arr!3837 (_values!3903 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1886)) mapDefault!7705)))))

(declare-fun mapNonEmpty!7705 () Bool)

(declare-fun tp!16914 () Bool)

(declare-fun e!126424 () Bool)

(assert (=> mapNonEmpty!7705 (= mapRes!7705 (and tp!16914 e!126424))))

(declare-fun mapKey!7705 () (_ BitVec 32))

(declare-fun mapRest!7705 () (Array (_ BitVec 32) ValueCell!1886))

(declare-fun mapValue!7705 () ValueCell!1886)

(assert (=> mapNonEmpty!7705 (= (arr!3837 (_values!3903 thiss!1248)) (store mapRest!7705 mapKey!7705 mapValue!7705))))

(declare-fun res!90798 () Bool)

(declare-fun e!126430 () Bool)

(assert (=> start!19586 (=> (not res!90798) (not e!126430))))

(declare-fun valid!1122 (LongMapFixedSize!2680) Bool)

(assert (=> start!19586 (= res!90798 (valid!1122 thiss!1248))))

(assert (=> start!19586 e!126430))

(assert (=> start!19586 e!126431))

(assert (=> start!19586 true))

(assert (=> start!19586 tp_is_empty!4459))

(declare-fun b!192147 () Bool)

(declare-fun res!90796 () Bool)

(assert (=> b!192147 (=> (not res!90796) (not e!126430))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!192147 (= res!90796 (not (= key!828 (bvneg key!828))))))

(declare-fun b!192148 () Bool)

(declare-fun e!126423 () Bool)

(declare-fun e!126425 () Bool)

(assert (=> b!192148 (= e!126423 (not e!126425))))

(declare-fun res!90797 () Bool)

(assert (=> b!192148 (=> res!90797 e!126425)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192148 (= res!90797 (not (validMask!0 (mask!9150 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!668 0))(
  ( (MissingZero!668 (index!4842 (_ BitVec 32))) (Found!668 (index!4843 (_ BitVec 32))) (Intermediate!668 (undefined!1480 Bool) (index!4844 (_ BitVec 32)) (x!20566 (_ BitVec 32))) (Undefined!668) (MissingVacant!668 (index!4845 (_ BitVec 32))) )
))
(declare-fun lt!95517 () SeekEntryResult!668)

(declare-datatypes ((tuple2!3478 0))(
  ( (tuple2!3479 (_1!1750 (_ BitVec 64)) (_2!1750 V!5593)) )
))
(declare-datatypes ((List!2389 0))(
  ( (Nil!2386) (Cons!2385 (h!3025 tuple2!3478) (t!7297 List!2389)) )
))
(declare-datatypes ((ListLongMap!2399 0))(
  ( (ListLongMap!2400 (toList!1215 List!2389)) )
))
(declare-fun lt!95513 () ListLongMap!2399)

(declare-fun v!309 () V!5593)

(declare-fun +!308 (ListLongMap!2399 tuple2!3478) ListLongMap!2399)

(declare-fun getCurrentListMap!867 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) Int) ListLongMap!2399)

(assert (=> b!192148 (= (+!308 lt!95513 (tuple2!3479 key!828 v!309)) (getCurrentListMap!867 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-datatypes ((Unit!5797 0))(
  ( (Unit!5798) )
))
(declare-fun lt!95515 () Unit!5797)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!112 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) (_ BitVec 64) V!5593 Int) Unit!5797)

(assert (=> b!192148 (= lt!95515 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!112 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4843 lt!95517) key!828 v!309 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95516 () Unit!5797)

(declare-fun e!126429 () Unit!5797)

(assert (=> b!192148 (= lt!95516 e!126429)))

(declare-fun c!34629 () Bool)

(declare-fun contains!1343 (ListLongMap!2399 (_ BitVec 64)) Bool)

(assert (=> b!192148 (= c!34629 (contains!1343 lt!95513 key!828))))

(assert (=> b!192148 (= lt!95513 (getCurrentListMap!867 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192149 () Bool)

(declare-fun Unit!5799 () Unit!5797)

(assert (=> b!192149 (= e!126429 Unit!5799)))

(declare-fun lt!95514 () Unit!5797)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!171 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5797)

(assert (=> b!192149 (= lt!95514 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!171 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(assert (=> b!192149 false))

(declare-fun b!192150 () Bool)

(assert (=> b!192150 (= e!126424 tp_is_empty!4459)))

(declare-fun b!192151 () Bool)

(declare-fun e!126432 () Bool)

(assert (=> b!192151 (= e!126432 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4843 lt!95517)) key!828))))

(declare-fun b!192152 () Bool)

(declare-fun lt!95518 () Unit!5797)

(assert (=> b!192152 (= e!126429 lt!95518)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5797)

(assert (=> b!192152 (= lt!95518 (lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(declare-fun res!90799 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192152 (= res!90799 (inRange!0 (index!4843 lt!95517) (mask!9150 thiss!1248)))))

(assert (=> b!192152 (=> (not res!90799) (not e!126432))))

(assert (=> b!192152 e!126432))

(declare-fun b!192153 () Bool)

(assert (=> b!192153 (= e!126430 e!126423)))

(declare-fun res!90795 () Bool)

(assert (=> b!192153 (=> (not res!90795) (not e!126423))))

(get-info :version)

(assert (=> b!192153 (= res!90795 (and (not ((_ is Undefined!668) lt!95517)) (not ((_ is MissingVacant!668) lt!95517)) (not ((_ is MissingZero!668) lt!95517)) ((_ is Found!668) lt!95517)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8145 (_ BitVec 32)) SeekEntryResult!668)

(assert (=> b!192153 (= lt!95517 (seekEntryOrOpen!0 key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun mapIsEmpty!7705 () Bool)

(assert (=> mapIsEmpty!7705 mapRes!7705))

(declare-fun b!192154 () Bool)

(assert (=> b!192154 (= e!126425 (or (not (= (size!4160 (_values!3903 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9150 thiss!1248)))) (not (= (size!4159 (_keys!5902 thiss!1248)) (size!4160 (_values!3903 thiss!1248)))) (bvslt (mask!9150 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3657 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3657 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!19586 res!90798) b!192147))

(assert (= (and b!192147 res!90796) b!192153))

(assert (= (and b!192153 res!90795) b!192148))

(assert (= (and b!192148 c!34629) b!192152))

(assert (= (and b!192148 (not c!34629)) b!192149))

(assert (= (and b!192152 res!90799) b!192151))

(assert (= (and b!192148 (not res!90797)) b!192154))

(assert (= (and b!192146 condMapEmpty!7705) mapIsEmpty!7705))

(assert (= (and b!192146 (not condMapEmpty!7705)) mapNonEmpty!7705))

(assert (= (and mapNonEmpty!7705 ((_ is ValueCellFull!1886) mapValue!7705)) b!192150))

(assert (= (and b!192146 ((_ is ValueCellFull!1886) mapDefault!7705)) b!192145))

(assert (= b!192144 b!192146))

(assert (= start!19586 b!192144))

(declare-fun m!218989 () Bool)

(assert (=> b!192148 m!218989))

(declare-fun m!218991 () Bool)

(assert (=> b!192148 m!218991))

(declare-fun m!218993 () Bool)

(assert (=> b!192148 m!218993))

(declare-fun m!218995 () Bool)

(assert (=> b!192148 m!218995))

(declare-fun m!218997 () Bool)

(assert (=> b!192148 m!218997))

(declare-fun m!218999 () Bool)

(assert (=> b!192148 m!218999))

(declare-fun m!219001 () Bool)

(assert (=> b!192148 m!219001))

(declare-fun m!219003 () Bool)

(assert (=> start!19586 m!219003))

(declare-fun m!219005 () Bool)

(assert (=> mapNonEmpty!7705 m!219005))

(declare-fun m!219007 () Bool)

(assert (=> b!192153 m!219007))

(declare-fun m!219009 () Bool)

(assert (=> b!192151 m!219009))

(declare-fun m!219011 () Bool)

(assert (=> b!192152 m!219011))

(declare-fun m!219013 () Bool)

(assert (=> b!192152 m!219013))

(declare-fun m!219015 () Bool)

(assert (=> b!192144 m!219015))

(declare-fun m!219017 () Bool)

(assert (=> b!192144 m!219017))

(declare-fun m!219019 () Bool)

(assert (=> b!192149 m!219019))

(check-sat (not mapNonEmpty!7705) (not start!19586) (not b!192152) tp_is_empty!4459 (not b!192148) (not b!192144) (not b!192153) (not b_next!4687) (not b!192149) b_and!11387)
(check-sat b_and!11387 (not b_next!4687))
(get-model)

(declare-fun call!19383 () Bool)

(declare-fun bm!19380 () Bool)

(declare-fun c!34640 () Bool)

(declare-fun lt!95560 () SeekEntryResult!668)

(assert (=> bm!19380 (= call!19383 (inRange!0 (ite c!34640 (index!4842 lt!95560) (index!4845 lt!95560)) (mask!9150 thiss!1248)))))

(declare-fun bm!19381 () Bool)

(declare-fun call!19384 () Bool)

(declare-fun arrayContainsKey!0 (array!8145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19381 (= call!19384 (arrayContainsKey!0 (_keys!5902 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!192237 () Bool)

(declare-fun res!90840 () Bool)

(declare-fun e!126502 () Bool)

(assert (=> b!192237 (=> (not res!90840) (not e!126502))))

(assert (=> b!192237 (= res!90840 call!19383)))

(declare-fun e!126503 () Bool)

(assert (=> b!192237 (= e!126503 e!126502)))

(declare-fun d!56407 () Bool)

(declare-fun e!126504 () Bool)

(assert (=> d!56407 e!126504))

(assert (=> d!56407 (= c!34640 ((_ is MissingZero!668) lt!95560))))

(assert (=> d!56407 (= lt!95560 (seekEntryOrOpen!0 key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun lt!95559 () Unit!5797)

(declare-fun choose!1051 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5797)

(assert (=> d!56407 (= lt!95559 (choose!1051 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56407 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56407 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!171 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) lt!95559)))

(declare-fun b!192238 () Bool)

(assert (=> b!192238 (and (bvsge (index!4842 lt!95560) #b00000000000000000000000000000000) (bvslt (index!4842 lt!95560) (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun res!90841 () Bool)

(assert (=> b!192238 (= res!90841 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4842 lt!95560)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126501 () Bool)

(assert (=> b!192238 (=> (not res!90841) (not e!126501))))

(declare-fun b!192239 () Bool)

(assert (=> b!192239 (= e!126502 (not call!19384))))

(declare-fun b!192240 () Bool)

(assert (=> b!192240 (= e!126503 ((_ is Undefined!668) lt!95560))))

(declare-fun b!192241 () Bool)

(declare-fun res!90839 () Bool)

(assert (=> b!192241 (=> (not res!90839) (not e!126502))))

(assert (=> b!192241 (= res!90839 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4845 lt!95560)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192241 (and (bvsge (index!4845 lt!95560) #b00000000000000000000000000000000) (bvslt (index!4845 lt!95560) (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192242 () Bool)

(assert (=> b!192242 (= e!126504 e!126501)))

(declare-fun res!90838 () Bool)

(assert (=> b!192242 (= res!90838 call!19383)))

(assert (=> b!192242 (=> (not res!90838) (not e!126501))))

(declare-fun b!192243 () Bool)

(assert (=> b!192243 (= e!126501 (not call!19384))))

(declare-fun b!192244 () Bool)

(assert (=> b!192244 (= e!126504 e!126503)))

(declare-fun c!34641 () Bool)

(assert (=> b!192244 (= c!34641 ((_ is MissingVacant!668) lt!95560))))

(assert (= (and d!56407 c!34640) b!192242))

(assert (= (and d!56407 (not c!34640)) b!192244))

(assert (= (and b!192242 res!90838) b!192238))

(assert (= (and b!192238 res!90841) b!192243))

(assert (= (and b!192244 c!34641) b!192237))

(assert (= (and b!192244 (not c!34641)) b!192240))

(assert (= (and b!192237 res!90840) b!192241))

(assert (= (and b!192241 res!90839) b!192239))

(assert (= (or b!192242 b!192237) bm!19380))

(assert (= (or b!192243 b!192239) bm!19381))

(declare-fun m!219085 () Bool)

(assert (=> b!192238 m!219085))

(assert (=> d!56407 m!219007))

(declare-fun m!219087 () Bool)

(assert (=> d!56407 m!219087))

(assert (=> d!56407 m!219001))

(declare-fun m!219089 () Bool)

(assert (=> bm!19381 m!219089))

(declare-fun m!219091 () Bool)

(assert (=> bm!19380 m!219091))

(declare-fun m!219093 () Bool)

(assert (=> b!192241 m!219093))

(assert (=> b!192149 d!56407))

(declare-fun d!56409 () Bool)

(assert (=> d!56409 (= (array_inv!2469 (_keys!5902 thiss!1248)) (bvsge (size!4159 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192144 d!56409))

(declare-fun d!56411 () Bool)

(assert (=> d!56411 (= (array_inv!2470 (_values!3903 thiss!1248)) (bvsge (size!4160 (_values!3903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192144 d!56411))

(declare-fun d!56413 () Bool)

(declare-fun e!126507 () Bool)

(assert (=> d!56413 e!126507))

(declare-fun res!90844 () Bool)

(assert (=> d!56413 (=> (not res!90844) (not e!126507))))

(assert (=> d!56413 (= res!90844 (and (bvsge (index!4843 lt!95517) #b00000000000000000000000000000000) (bvslt (index!4843 lt!95517) (size!4160 (_values!3903 thiss!1248)))))))

(declare-fun lt!95563 () Unit!5797)

(declare-fun choose!1052 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) (_ BitVec 64) V!5593 Int) Unit!5797)

(assert (=> d!56413 (= lt!95563 (choose!1052 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4843 lt!95517) key!828 v!309 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56413 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56413 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!112 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4843 lt!95517) key!828 v!309 (defaultEntry!3920 thiss!1248)) lt!95563)))

(declare-fun b!192247 () Bool)

(assert (=> b!192247 (= e!126507 (= (+!308 (getCurrentListMap!867 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) (tuple2!3479 key!828 v!309)) (getCurrentListMap!867 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248))))))

(assert (= (and d!56413 res!90844) b!192247))

(declare-fun m!219095 () Bool)

(assert (=> d!56413 m!219095))

(assert (=> d!56413 m!219001))

(assert (=> b!192247 m!218989))

(assert (=> b!192247 m!218989))

(declare-fun m!219097 () Bool)

(assert (=> b!192247 m!219097))

(assert (=> b!192247 m!218991))

(assert (=> b!192247 m!218997))

(assert (=> b!192148 d!56413))

(declare-fun d!56415 () Bool)

(assert (=> d!56415 (= (validMask!0 (mask!9150 thiss!1248)) (and (or (= (mask!9150 thiss!1248) #b00000000000000000000000000000111) (= (mask!9150 thiss!1248) #b00000000000000000000000000001111) (= (mask!9150 thiss!1248) #b00000000000000000000000000011111) (= (mask!9150 thiss!1248) #b00000000000000000000000000111111) (= (mask!9150 thiss!1248) #b00000000000000000000000001111111) (= (mask!9150 thiss!1248) #b00000000000000000000000011111111) (= (mask!9150 thiss!1248) #b00000000000000000000000111111111) (= (mask!9150 thiss!1248) #b00000000000000000000001111111111) (= (mask!9150 thiss!1248) #b00000000000000000000011111111111) (= (mask!9150 thiss!1248) #b00000000000000000000111111111111) (= (mask!9150 thiss!1248) #b00000000000000000001111111111111) (= (mask!9150 thiss!1248) #b00000000000000000011111111111111) (= (mask!9150 thiss!1248) #b00000000000000000111111111111111) (= (mask!9150 thiss!1248) #b00000000000000001111111111111111) (= (mask!9150 thiss!1248) #b00000000000000011111111111111111) (= (mask!9150 thiss!1248) #b00000000000000111111111111111111) (= (mask!9150 thiss!1248) #b00000000000001111111111111111111) (= (mask!9150 thiss!1248) #b00000000000011111111111111111111) (= (mask!9150 thiss!1248) #b00000000000111111111111111111111) (= (mask!9150 thiss!1248) #b00000000001111111111111111111111) (= (mask!9150 thiss!1248) #b00000000011111111111111111111111) (= (mask!9150 thiss!1248) #b00000000111111111111111111111111) (= (mask!9150 thiss!1248) #b00000001111111111111111111111111) (= (mask!9150 thiss!1248) #b00000011111111111111111111111111) (= (mask!9150 thiss!1248) #b00000111111111111111111111111111) (= (mask!9150 thiss!1248) #b00001111111111111111111111111111) (= (mask!9150 thiss!1248) #b00011111111111111111111111111111) (= (mask!9150 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9150 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!192148 d!56415))

(declare-fun b!192290 () Bool)

(declare-fun e!126540 () Bool)

(declare-fun e!126539 () Bool)

(assert (=> b!192290 (= e!126540 e!126539)))

(declare-fun res!90865 () Bool)

(declare-fun call!19399 () Bool)

(assert (=> b!192290 (= res!90865 call!19399)))

(assert (=> b!192290 (=> (not res!90865) (not e!126539))))

(declare-fun call!19402 () ListLongMap!2399)

(declare-fun bm!19396 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!214 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) Int) ListLongMap!2399)

(assert (=> bm!19396 (= call!19402 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192291 () Bool)

(declare-fun e!126544 () Bool)

(declare-fun lt!95627 () ListLongMap!2399)

(declare-fun apply!183 (ListLongMap!2399 (_ BitVec 64)) V!5593)

(assert (=> b!192291 (= e!126544 (= (apply!183 lt!95627 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3761 thiss!1248)))))

(declare-fun b!192292 () Bool)

(declare-fun e!126546 () ListLongMap!2399)

(declare-fun call!19403 () ListLongMap!2399)

(assert (=> b!192292 (= e!126546 (+!308 call!19403 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(declare-fun b!192293 () Bool)

(declare-fun res!90867 () Bool)

(declare-fun e!126543 () Bool)

(assert (=> b!192293 (=> (not res!90867) (not e!126543))))

(declare-fun e!126545 () Bool)

(assert (=> b!192293 (= res!90867 e!126545)))

(declare-fun res!90864 () Bool)

(assert (=> b!192293 (=> res!90864 e!126545)))

(declare-fun e!126541 () Bool)

(assert (=> b!192293 (= res!90864 (not e!126541))))

(declare-fun res!90870 () Bool)

(assert (=> b!192293 (=> (not res!90870) (not e!126541))))

(assert (=> b!192293 (= res!90870 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192294 () Bool)

(declare-fun e!126535 () Bool)

(assert (=> b!192294 (= e!126535 e!126544)))

(declare-fun res!90871 () Bool)

(declare-fun call!19400 () Bool)

(assert (=> b!192294 (= res!90871 call!19400)))

(assert (=> b!192294 (=> (not res!90871) (not e!126544))))

(declare-fun bm!19397 () Bool)

(assert (=> bm!19397 (= call!19399 (contains!1343 lt!95627 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192295 () Bool)

(declare-fun e!126542 () ListLongMap!2399)

(declare-fun call!19404 () ListLongMap!2399)

(assert (=> b!192295 (= e!126542 call!19404)))

(declare-fun b!192296 () Bool)

(declare-fun e!126536 () Unit!5797)

(declare-fun Unit!5805 () Unit!5797)

(assert (=> b!192296 (= e!126536 Unit!5805)))

(declare-fun b!192297 () Bool)

(assert (=> b!192297 (= e!126535 (not call!19400))))

(declare-fun c!34654 () Bool)

(declare-fun bm!19398 () Bool)

(declare-fun c!34659 () Bool)

(declare-fun call!19405 () ListLongMap!2399)

(assert (=> bm!19398 (= call!19403 (+!308 (ite c!34654 call!19402 (ite c!34659 call!19405 call!19404)) (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun b!192298 () Bool)

(assert (=> b!192298 (= e!126540 (not call!19399))))

(declare-fun bm!19399 () Bool)

(assert (=> bm!19399 (= call!19400 (contains!1343 lt!95627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56417 () Bool)

(assert (=> d!56417 e!126543))

(declare-fun res!90863 () Bool)

(assert (=> d!56417 (=> (not res!90863) (not e!126543))))

(assert (=> d!56417 (= res!90863 (or (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))))

(declare-fun lt!95624 () ListLongMap!2399)

(assert (=> d!56417 (= lt!95627 lt!95624)))

(declare-fun lt!95628 () Unit!5797)

(assert (=> d!56417 (= lt!95628 e!126536)))

(declare-fun c!34658 () Bool)

(declare-fun e!126534 () Bool)

(assert (=> d!56417 (= c!34658 e!126534)))

(declare-fun res!90868 () Bool)

(assert (=> d!56417 (=> (not res!90868) (not e!126534))))

(assert (=> d!56417 (= res!90868 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56417 (= lt!95624 e!126546)))

(assert (=> d!56417 (= c!34654 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56417 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56417 (= (getCurrentListMap!867 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95627)))

(declare-fun b!192299 () Bool)

(declare-fun lt!95610 () Unit!5797)

(assert (=> b!192299 (= e!126536 lt!95610)))

(declare-fun lt!95620 () ListLongMap!2399)

(assert (=> b!192299 (= lt!95620 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95629 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95623 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95623 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95619 () Unit!5797)

(declare-fun addStillContains!159 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5797)

(assert (=> b!192299 (= lt!95619 (addStillContains!159 lt!95620 lt!95629 (zeroValue!3761 thiss!1248) lt!95623))))

(assert (=> b!192299 (contains!1343 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))) lt!95623)))

(declare-fun lt!95612 () Unit!5797)

(assert (=> b!192299 (= lt!95612 lt!95619)))

(declare-fun lt!95622 () ListLongMap!2399)

(assert (=> b!192299 (= lt!95622 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95608 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95613 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95613 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95609 () Unit!5797)

(declare-fun addApplyDifferent!159 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5797)

(assert (=> b!192299 (= lt!95609 (addApplyDifferent!159 lt!95622 lt!95608 (minValue!3761 thiss!1248) lt!95613))))

(assert (=> b!192299 (= (apply!183 (+!308 lt!95622 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))) lt!95613) (apply!183 lt!95622 lt!95613))))

(declare-fun lt!95611 () Unit!5797)

(assert (=> b!192299 (= lt!95611 lt!95609)))

(declare-fun lt!95616 () ListLongMap!2399)

(assert (=> b!192299 (= lt!95616 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95617 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95614 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95614 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95625 () Unit!5797)

(assert (=> b!192299 (= lt!95625 (addApplyDifferent!159 lt!95616 lt!95617 (zeroValue!3761 thiss!1248) lt!95614))))

(assert (=> b!192299 (= (apply!183 (+!308 lt!95616 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))) lt!95614) (apply!183 lt!95616 lt!95614))))

(declare-fun lt!95621 () Unit!5797)

(assert (=> b!192299 (= lt!95621 lt!95625)))

(declare-fun lt!95618 () ListLongMap!2399)

(assert (=> b!192299 (= lt!95618 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95615 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95626 () (_ BitVec 64))

(assert (=> b!192299 (= lt!95626 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192299 (= lt!95610 (addApplyDifferent!159 lt!95618 lt!95615 (minValue!3761 thiss!1248) lt!95626))))

(assert (=> b!192299 (= (apply!183 (+!308 lt!95618 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))) lt!95626) (apply!183 lt!95618 lt!95626))))

(declare-fun b!192300 () Bool)

(declare-fun e!126537 () ListLongMap!2399)

(declare-fun call!19401 () ListLongMap!2399)

(assert (=> b!192300 (= e!126537 call!19401)))

(declare-fun bm!19400 () Bool)

(assert (=> bm!19400 (= call!19404 call!19405)))

(declare-fun b!192301 () Bool)

(declare-fun e!126538 () Bool)

(declare-fun get!2225 (ValueCell!1886 V!5593) V!5593)

(declare-fun dynLambda!526 (Int (_ BitVec 64)) V!5593)

(assert (=> b!192301 (= e!126538 (= (apply!183 lt!95627 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4160 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))))))))

(assert (=> b!192301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192302 () Bool)

(assert (=> b!192302 (= e!126542 call!19401)))

(declare-fun b!192303 () Bool)

(assert (=> b!192303 (= e!126545 e!126538)))

(declare-fun res!90869 () Bool)

(assert (=> b!192303 (=> (not res!90869) (not e!126538))))

(assert (=> b!192303 (= res!90869 (contains!1343 lt!95627 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192304 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192304 (= e!126534 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192305 () Bool)

(assert (=> b!192305 (= e!126543 e!126540)))

(declare-fun c!34655 () Bool)

(assert (=> b!192305 (= c!34655 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192306 () Bool)

(assert (=> b!192306 (= e!126546 e!126537)))

(assert (=> b!192306 (= c!34659 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192307 () Bool)

(assert (=> b!192307 (= e!126541 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192308 () Bool)

(assert (=> b!192308 (= e!126539 (= (apply!183 lt!95627 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3761 thiss!1248)))))

(declare-fun b!192309 () Bool)

(declare-fun res!90866 () Bool)

(assert (=> b!192309 (=> (not res!90866) (not e!126543))))

(assert (=> b!192309 (= res!90866 e!126535)))

(declare-fun c!34657 () Bool)

(assert (=> b!192309 (= c!34657 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19401 () Bool)

(assert (=> bm!19401 (= call!19405 call!19402)))

(declare-fun bm!19402 () Bool)

(assert (=> bm!19402 (= call!19401 call!19403)))

(declare-fun b!192310 () Bool)

(declare-fun c!34656 () Bool)

(assert (=> b!192310 (= c!34656 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!192310 (= e!126537 e!126542)))

(assert (= (and d!56417 c!34654) b!192292))

(assert (= (and d!56417 (not c!34654)) b!192306))

(assert (= (and b!192306 c!34659) b!192300))

(assert (= (and b!192306 (not c!34659)) b!192310))

(assert (= (and b!192310 c!34656) b!192302))

(assert (= (and b!192310 (not c!34656)) b!192295))

(assert (= (or b!192302 b!192295) bm!19400))

(assert (= (or b!192300 bm!19400) bm!19401))

(assert (= (or b!192300 b!192302) bm!19402))

(assert (= (or b!192292 bm!19401) bm!19396))

(assert (= (or b!192292 bm!19402) bm!19398))

(assert (= (and d!56417 res!90868) b!192304))

(assert (= (and d!56417 c!34658) b!192299))

(assert (= (and d!56417 (not c!34658)) b!192296))

(assert (= (and d!56417 res!90863) b!192293))

(assert (= (and b!192293 res!90870) b!192307))

(assert (= (and b!192293 (not res!90864)) b!192303))

(assert (= (and b!192303 res!90869) b!192301))

(assert (= (and b!192293 res!90867) b!192309))

(assert (= (and b!192309 c!34657) b!192294))

(assert (= (and b!192309 (not c!34657)) b!192297))

(assert (= (and b!192294 res!90871) b!192291))

(assert (= (or b!192294 b!192297) bm!19399))

(assert (= (and b!192309 res!90866) b!192305))

(assert (= (and b!192305 c!34655) b!192290))

(assert (= (and b!192305 (not c!34655)) b!192298))

(assert (= (and b!192290 res!90865) b!192308))

(assert (= (or b!192290 b!192298) bm!19397))

(declare-fun b_lambda!7445 () Bool)

(assert (=> (not b_lambda!7445) (not b!192301)))

(declare-fun t!7301 () Bool)

(declare-fun tb!2869 () Bool)

(assert (=> (and b!192144 (= (defaultEntry!3920 thiss!1248) (defaultEntry!3920 thiss!1248)) t!7301) tb!2869))

(declare-fun result!4901 () Bool)

(assert (=> tb!2869 (= result!4901 tp_is_empty!4459)))

(assert (=> b!192301 t!7301))

(declare-fun b_and!11393 () Bool)

(assert (= b_and!11387 (and (=> t!7301 result!4901) b_and!11393)))

(declare-fun m!219099 () Bool)

(assert (=> b!192307 m!219099))

(assert (=> b!192307 m!219099))

(declare-fun m!219101 () Bool)

(assert (=> b!192307 m!219101))

(declare-fun m!219103 () Bool)

(assert (=> b!192308 m!219103))

(declare-fun m!219105 () Bool)

(assert (=> bm!19399 m!219105))

(declare-fun m!219107 () Bool)

(assert (=> b!192291 m!219107))

(assert (=> b!192303 m!219099))

(assert (=> b!192303 m!219099))

(declare-fun m!219109 () Bool)

(assert (=> b!192303 m!219109))

(declare-fun m!219111 () Bool)

(assert (=> bm!19398 m!219111))

(declare-fun m!219113 () Bool)

(assert (=> b!192299 m!219113))

(declare-fun m!219115 () Bool)

(assert (=> b!192299 m!219115))

(declare-fun m!219117 () Bool)

(assert (=> b!192299 m!219117))

(declare-fun m!219119 () Bool)

(assert (=> b!192299 m!219119))

(declare-fun m!219121 () Bool)

(assert (=> b!192299 m!219121))

(declare-fun m!219123 () Bool)

(assert (=> b!192299 m!219123))

(declare-fun m!219125 () Bool)

(assert (=> b!192299 m!219125))

(assert (=> b!192299 m!219113))

(assert (=> b!192299 m!219117))

(declare-fun m!219127 () Bool)

(assert (=> b!192299 m!219127))

(declare-fun m!219129 () Bool)

(assert (=> b!192299 m!219129))

(declare-fun m!219131 () Bool)

(assert (=> b!192299 m!219131))

(declare-fun m!219133 () Bool)

(assert (=> b!192299 m!219133))

(declare-fun m!219135 () Bool)

(assert (=> b!192299 m!219135))

(assert (=> b!192299 m!219135))

(declare-fun m!219137 () Bool)

(assert (=> b!192299 m!219137))

(assert (=> b!192299 m!219099))

(declare-fun m!219139 () Bool)

(assert (=> b!192299 m!219139))

(declare-fun m!219141 () Bool)

(assert (=> b!192299 m!219141))

(assert (=> b!192299 m!219125))

(declare-fun m!219143 () Bool)

(assert (=> b!192299 m!219143))

(assert (=> bm!19396 m!219133))

(assert (=> d!56417 m!219001))

(declare-fun m!219145 () Bool)

(assert (=> b!192292 m!219145))

(assert (=> b!192301 m!219099))

(declare-fun m!219147 () Bool)

(assert (=> b!192301 m!219147))

(declare-fun m!219149 () Bool)

(assert (=> b!192301 m!219149))

(declare-fun m!219151 () Bool)

(assert (=> b!192301 m!219151))

(assert (=> b!192301 m!219099))

(assert (=> b!192301 m!219151))

(assert (=> b!192301 m!219149))

(declare-fun m!219153 () Bool)

(assert (=> b!192301 m!219153))

(assert (=> b!192304 m!219099))

(assert (=> b!192304 m!219099))

(assert (=> b!192304 m!219101))

(declare-fun m!219155 () Bool)

(assert (=> bm!19397 m!219155))

(assert (=> b!192148 d!56417))

(declare-fun d!56419 () Bool)

(declare-fun e!126549 () Bool)

(assert (=> d!56419 e!126549))

(declare-fun res!90876 () Bool)

(assert (=> d!56419 (=> (not res!90876) (not e!126549))))

(declare-fun lt!95638 () ListLongMap!2399)

(assert (=> d!56419 (= res!90876 (contains!1343 lt!95638 (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun lt!95639 () List!2389)

(assert (=> d!56419 (= lt!95638 (ListLongMap!2400 lt!95639))))

(declare-fun lt!95641 () Unit!5797)

(declare-fun lt!95640 () Unit!5797)

(assert (=> d!56419 (= lt!95641 lt!95640)))

(declare-datatypes ((Option!247 0))(
  ( (Some!246 (v!4225 V!5593)) (None!245) )
))
(declare-fun getValueByKey!241 (List!2389 (_ BitVec 64)) Option!247)

(assert (=> d!56419 (= (getValueByKey!241 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309))) (Some!246 (_2!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!128 (List!2389 (_ BitVec 64) V!5593) Unit!5797)

(assert (=> d!56419 (= lt!95640 (lemmaContainsTupThenGetReturnValue!128 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun insertStrictlySorted!131 (List!2389 (_ BitVec 64) V!5593) List!2389)

(assert (=> d!56419 (= lt!95639 (insertStrictlySorted!131 (toList!1215 lt!95513) (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))

(assert (=> d!56419 (= (+!308 lt!95513 (tuple2!3479 key!828 v!309)) lt!95638)))

(declare-fun b!192317 () Bool)

(declare-fun res!90877 () Bool)

(assert (=> b!192317 (=> (not res!90877) (not e!126549))))

(assert (=> b!192317 (= res!90877 (= (getValueByKey!241 (toList!1215 lt!95638) (_1!1750 (tuple2!3479 key!828 v!309))) (Some!246 (_2!1750 (tuple2!3479 key!828 v!309)))))))

(declare-fun b!192318 () Bool)

(declare-fun contains!1346 (List!2389 tuple2!3478) Bool)

(assert (=> b!192318 (= e!126549 (contains!1346 (toList!1215 lt!95638) (tuple2!3479 key!828 v!309)))))

(assert (= (and d!56419 res!90876) b!192317))

(assert (= (and b!192317 res!90877) b!192318))

(declare-fun m!219157 () Bool)

(assert (=> d!56419 m!219157))

(declare-fun m!219159 () Bool)

(assert (=> d!56419 m!219159))

(declare-fun m!219161 () Bool)

(assert (=> d!56419 m!219161))

(declare-fun m!219163 () Bool)

(assert (=> d!56419 m!219163))

(declare-fun m!219165 () Bool)

(assert (=> b!192317 m!219165))

(declare-fun m!219167 () Bool)

(assert (=> b!192318 m!219167))

(assert (=> b!192148 d!56419))

(declare-fun b!192319 () Bool)

(declare-fun e!126556 () Bool)

(declare-fun e!126555 () Bool)

(assert (=> b!192319 (= e!126556 e!126555)))

(declare-fun res!90880 () Bool)

(declare-fun call!19406 () Bool)

(assert (=> b!192319 (= res!90880 call!19406)))

(assert (=> b!192319 (=> (not res!90880) (not e!126555))))

(declare-fun bm!19403 () Bool)

(declare-fun call!19409 () ListLongMap!2399)

(assert (=> bm!19403 (= call!19409 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192320 () Bool)

(declare-fun e!126560 () Bool)

(declare-fun lt!95661 () ListLongMap!2399)

(assert (=> b!192320 (= e!126560 (= (apply!183 lt!95661 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3761 thiss!1248)))))

(declare-fun b!192321 () Bool)

(declare-fun e!126562 () ListLongMap!2399)

(declare-fun call!19410 () ListLongMap!2399)

(assert (=> b!192321 (= e!126562 (+!308 call!19410 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(declare-fun b!192322 () Bool)

(declare-fun res!90882 () Bool)

(declare-fun e!126559 () Bool)

(assert (=> b!192322 (=> (not res!90882) (not e!126559))))

(declare-fun e!126561 () Bool)

(assert (=> b!192322 (= res!90882 e!126561)))

(declare-fun res!90879 () Bool)

(assert (=> b!192322 (=> res!90879 e!126561)))

(declare-fun e!126557 () Bool)

(assert (=> b!192322 (= res!90879 (not e!126557))))

(declare-fun res!90885 () Bool)

(assert (=> b!192322 (=> (not res!90885) (not e!126557))))

(assert (=> b!192322 (= res!90885 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192323 () Bool)

(declare-fun e!126551 () Bool)

(assert (=> b!192323 (= e!126551 e!126560)))

(declare-fun res!90886 () Bool)

(declare-fun call!19407 () Bool)

(assert (=> b!192323 (= res!90886 call!19407)))

(assert (=> b!192323 (=> (not res!90886) (not e!126560))))

(declare-fun bm!19404 () Bool)

(assert (=> bm!19404 (= call!19406 (contains!1343 lt!95661 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192324 () Bool)

(declare-fun e!126558 () ListLongMap!2399)

(declare-fun call!19411 () ListLongMap!2399)

(assert (=> b!192324 (= e!126558 call!19411)))

(declare-fun b!192325 () Bool)

(declare-fun e!126552 () Unit!5797)

(declare-fun Unit!5806 () Unit!5797)

(assert (=> b!192325 (= e!126552 Unit!5806)))

(declare-fun b!192326 () Bool)

(assert (=> b!192326 (= e!126551 (not call!19407))))

(declare-fun call!19412 () ListLongMap!2399)

(declare-fun c!34660 () Bool)

(declare-fun bm!19405 () Bool)

(declare-fun c!34665 () Bool)

(assert (=> bm!19405 (= call!19410 (+!308 (ite c!34660 call!19409 (ite c!34665 call!19412 call!19411)) (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun b!192327 () Bool)

(assert (=> b!192327 (= e!126556 (not call!19406))))

(declare-fun bm!19406 () Bool)

(assert (=> bm!19406 (= call!19407 (contains!1343 lt!95661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56421 () Bool)

(assert (=> d!56421 e!126559))

(declare-fun res!90878 () Bool)

(assert (=> d!56421 (=> (not res!90878) (not e!126559))))

(assert (=> d!56421 (= res!90878 (or (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))))

(declare-fun lt!95658 () ListLongMap!2399)

(assert (=> d!56421 (= lt!95661 lt!95658)))

(declare-fun lt!95662 () Unit!5797)

(assert (=> d!56421 (= lt!95662 e!126552)))

(declare-fun c!34664 () Bool)

(declare-fun e!126550 () Bool)

(assert (=> d!56421 (= c!34664 e!126550)))

(declare-fun res!90883 () Bool)

(assert (=> d!56421 (=> (not res!90883) (not e!126550))))

(assert (=> d!56421 (= res!90883 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56421 (= lt!95658 e!126562)))

(assert (=> d!56421 (= c!34660 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56421 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56421 (= (getCurrentListMap!867 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95661)))

(declare-fun b!192328 () Bool)

(declare-fun lt!95644 () Unit!5797)

(assert (=> b!192328 (= e!126552 lt!95644)))

(declare-fun lt!95654 () ListLongMap!2399)

(assert (=> b!192328 (= lt!95654 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95663 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95657 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95657 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95653 () Unit!5797)

(assert (=> b!192328 (= lt!95653 (addStillContains!159 lt!95654 lt!95663 (zeroValue!3761 thiss!1248) lt!95657))))

(assert (=> b!192328 (contains!1343 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))) lt!95657)))

(declare-fun lt!95646 () Unit!5797)

(assert (=> b!192328 (= lt!95646 lt!95653)))

(declare-fun lt!95656 () ListLongMap!2399)

(assert (=> b!192328 (= lt!95656 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95642 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95642 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95647 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95647 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95643 () Unit!5797)

(assert (=> b!192328 (= lt!95643 (addApplyDifferent!159 lt!95656 lt!95642 (minValue!3761 thiss!1248) lt!95647))))

(assert (=> b!192328 (= (apply!183 (+!308 lt!95656 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))) lt!95647) (apply!183 lt!95656 lt!95647))))

(declare-fun lt!95645 () Unit!5797)

(assert (=> b!192328 (= lt!95645 lt!95643)))

(declare-fun lt!95650 () ListLongMap!2399)

(assert (=> b!192328 (= lt!95650 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95651 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95648 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95648 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95659 () Unit!5797)

(assert (=> b!192328 (= lt!95659 (addApplyDifferent!159 lt!95650 lt!95651 (zeroValue!3761 thiss!1248) lt!95648))))

(assert (=> b!192328 (= (apply!183 (+!308 lt!95650 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))) lt!95648) (apply!183 lt!95650 lt!95648))))

(declare-fun lt!95655 () Unit!5797)

(assert (=> b!192328 (= lt!95655 lt!95659)))

(declare-fun lt!95652 () ListLongMap!2399)

(assert (=> b!192328 (= lt!95652 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95649 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95649 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95660 () (_ BitVec 64))

(assert (=> b!192328 (= lt!95660 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192328 (= lt!95644 (addApplyDifferent!159 lt!95652 lt!95649 (minValue!3761 thiss!1248) lt!95660))))

(assert (=> b!192328 (= (apply!183 (+!308 lt!95652 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))) lt!95660) (apply!183 lt!95652 lt!95660))))

(declare-fun b!192329 () Bool)

(declare-fun e!126553 () ListLongMap!2399)

(declare-fun call!19408 () ListLongMap!2399)

(assert (=> b!192329 (= e!126553 call!19408)))

(declare-fun bm!19407 () Bool)

(assert (=> bm!19407 (= call!19411 call!19412)))

(declare-fun b!192330 () Bool)

(declare-fun e!126554 () Bool)

(assert (=> b!192330 (= e!126554 (= (apply!183 lt!95661 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4160 (_values!3903 thiss!1248))))))

(assert (=> b!192330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192331 () Bool)

(assert (=> b!192331 (= e!126558 call!19408)))

(declare-fun b!192332 () Bool)

(assert (=> b!192332 (= e!126561 e!126554)))

(declare-fun res!90884 () Bool)

(assert (=> b!192332 (=> (not res!90884) (not e!126554))))

(assert (=> b!192332 (= res!90884 (contains!1343 lt!95661 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192333 () Bool)

(assert (=> b!192333 (= e!126550 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192334 () Bool)

(assert (=> b!192334 (= e!126559 e!126556)))

(declare-fun c!34661 () Bool)

(assert (=> b!192334 (= c!34661 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192335 () Bool)

(assert (=> b!192335 (= e!126562 e!126553)))

(assert (=> b!192335 (= c!34665 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192336 () Bool)

(assert (=> b!192336 (= e!126557 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192337 () Bool)

(assert (=> b!192337 (= e!126555 (= (apply!183 lt!95661 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3761 thiss!1248)))))

(declare-fun b!192338 () Bool)

(declare-fun res!90881 () Bool)

(assert (=> b!192338 (=> (not res!90881) (not e!126559))))

(assert (=> b!192338 (= res!90881 e!126551)))

(declare-fun c!34663 () Bool)

(assert (=> b!192338 (= c!34663 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19408 () Bool)

(assert (=> bm!19408 (= call!19412 call!19409)))

(declare-fun bm!19409 () Bool)

(assert (=> bm!19409 (= call!19408 call!19410)))

(declare-fun b!192339 () Bool)

(declare-fun c!34662 () Bool)

(assert (=> b!192339 (= c!34662 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!192339 (= e!126553 e!126558)))

(assert (= (and d!56421 c!34660) b!192321))

(assert (= (and d!56421 (not c!34660)) b!192335))

(assert (= (and b!192335 c!34665) b!192329))

(assert (= (and b!192335 (not c!34665)) b!192339))

(assert (= (and b!192339 c!34662) b!192331))

(assert (= (and b!192339 (not c!34662)) b!192324))

(assert (= (or b!192331 b!192324) bm!19407))

(assert (= (or b!192329 bm!19407) bm!19408))

(assert (= (or b!192329 b!192331) bm!19409))

(assert (= (or b!192321 bm!19408) bm!19403))

(assert (= (or b!192321 bm!19409) bm!19405))

(assert (= (and d!56421 res!90883) b!192333))

(assert (= (and d!56421 c!34664) b!192328))

(assert (= (and d!56421 (not c!34664)) b!192325))

(assert (= (and d!56421 res!90878) b!192322))

(assert (= (and b!192322 res!90885) b!192336))

(assert (= (and b!192322 (not res!90879)) b!192332))

(assert (= (and b!192332 res!90884) b!192330))

(assert (= (and b!192322 res!90882) b!192338))

(assert (= (and b!192338 c!34663) b!192323))

(assert (= (and b!192338 (not c!34663)) b!192326))

(assert (= (and b!192323 res!90886) b!192320))

(assert (= (or b!192323 b!192326) bm!19406))

(assert (= (and b!192338 res!90881) b!192334))

(assert (= (and b!192334 c!34661) b!192319))

(assert (= (and b!192334 (not c!34661)) b!192327))

(assert (= (and b!192319 res!90880) b!192337))

(assert (= (or b!192319 b!192327) bm!19404))

(declare-fun b_lambda!7447 () Bool)

(assert (=> (not b_lambda!7447) (not b!192330)))

(assert (=> b!192330 t!7301))

(declare-fun b_and!11395 () Bool)

(assert (= b_and!11393 (and (=> t!7301 result!4901) b_and!11395)))

(assert (=> b!192336 m!219099))

(assert (=> b!192336 m!219099))

(assert (=> b!192336 m!219101))

(declare-fun m!219169 () Bool)

(assert (=> b!192337 m!219169))

(declare-fun m!219171 () Bool)

(assert (=> bm!19406 m!219171))

(declare-fun m!219173 () Bool)

(assert (=> b!192320 m!219173))

(assert (=> b!192332 m!219099))

(assert (=> b!192332 m!219099))

(declare-fun m!219175 () Bool)

(assert (=> b!192332 m!219175))

(declare-fun m!219177 () Bool)

(assert (=> bm!19405 m!219177))

(declare-fun m!219179 () Bool)

(assert (=> b!192328 m!219179))

(declare-fun m!219181 () Bool)

(assert (=> b!192328 m!219181))

(declare-fun m!219183 () Bool)

(assert (=> b!192328 m!219183))

(declare-fun m!219185 () Bool)

(assert (=> b!192328 m!219185))

(declare-fun m!219187 () Bool)

(assert (=> b!192328 m!219187))

(declare-fun m!219189 () Bool)

(assert (=> b!192328 m!219189))

(declare-fun m!219191 () Bool)

(assert (=> b!192328 m!219191))

(assert (=> b!192328 m!219179))

(assert (=> b!192328 m!219183))

(declare-fun m!219193 () Bool)

(assert (=> b!192328 m!219193))

(declare-fun m!219195 () Bool)

(assert (=> b!192328 m!219195))

(declare-fun m!219197 () Bool)

(assert (=> b!192328 m!219197))

(declare-fun m!219199 () Bool)

(assert (=> b!192328 m!219199))

(declare-fun m!219201 () Bool)

(assert (=> b!192328 m!219201))

(assert (=> b!192328 m!219201))

(declare-fun m!219203 () Bool)

(assert (=> b!192328 m!219203))

(assert (=> b!192328 m!219099))

(declare-fun m!219205 () Bool)

(assert (=> b!192328 m!219205))

(declare-fun m!219207 () Bool)

(assert (=> b!192328 m!219207))

(assert (=> b!192328 m!219191))

(declare-fun m!219209 () Bool)

(assert (=> b!192328 m!219209))

(assert (=> bm!19403 m!219199))

(assert (=> d!56421 m!219001))

(declare-fun m!219211 () Bool)

(assert (=> b!192321 m!219211))

(assert (=> b!192330 m!219099))

(declare-fun m!219213 () Bool)

(assert (=> b!192330 m!219213))

(assert (=> b!192330 m!219149))

(declare-fun m!219215 () Bool)

(assert (=> b!192330 m!219215))

(assert (=> b!192330 m!219099))

(assert (=> b!192330 m!219215))

(assert (=> b!192330 m!219149))

(declare-fun m!219217 () Bool)

(assert (=> b!192330 m!219217))

(assert (=> b!192333 m!219099))

(assert (=> b!192333 m!219099))

(assert (=> b!192333 m!219101))

(declare-fun m!219219 () Bool)

(assert (=> bm!19404 m!219219))

(assert (=> b!192148 d!56421))

(declare-fun d!56423 () Bool)

(declare-fun e!126567 () Bool)

(assert (=> d!56423 e!126567))

(declare-fun res!90889 () Bool)

(assert (=> d!56423 (=> res!90889 e!126567)))

(declare-fun lt!95673 () Bool)

(assert (=> d!56423 (= res!90889 (not lt!95673))))

(declare-fun lt!95675 () Bool)

(assert (=> d!56423 (= lt!95673 lt!95675)))

(declare-fun lt!95674 () Unit!5797)

(declare-fun e!126568 () Unit!5797)

(assert (=> d!56423 (= lt!95674 e!126568)))

(declare-fun c!34668 () Bool)

(assert (=> d!56423 (= c!34668 lt!95675)))

(declare-fun containsKey!244 (List!2389 (_ BitVec 64)) Bool)

(assert (=> d!56423 (= lt!95675 (containsKey!244 (toList!1215 lt!95513) key!828))))

(assert (=> d!56423 (= (contains!1343 lt!95513 key!828) lt!95673)))

(declare-fun b!192346 () Bool)

(declare-fun lt!95672 () Unit!5797)

(assert (=> b!192346 (= e!126568 lt!95672)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!192 (List!2389 (_ BitVec 64)) Unit!5797)

(assert (=> b!192346 (= lt!95672 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95513) key!828))))

(declare-fun isDefined!193 (Option!247) Bool)

(assert (=> b!192346 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95513) key!828))))

(declare-fun b!192347 () Bool)

(declare-fun Unit!5807 () Unit!5797)

(assert (=> b!192347 (= e!126568 Unit!5807)))

(declare-fun b!192348 () Bool)

(assert (=> b!192348 (= e!126567 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95513) key!828)))))

(assert (= (and d!56423 c!34668) b!192346))

(assert (= (and d!56423 (not c!34668)) b!192347))

(assert (= (and d!56423 (not res!90889)) b!192348))

(declare-fun m!219221 () Bool)

(assert (=> d!56423 m!219221))

(declare-fun m!219223 () Bool)

(assert (=> b!192346 m!219223))

(declare-fun m!219225 () Bool)

(assert (=> b!192346 m!219225))

(assert (=> b!192346 m!219225))

(declare-fun m!219227 () Bool)

(assert (=> b!192346 m!219227))

(assert (=> b!192348 m!219225))

(assert (=> b!192348 m!219225))

(assert (=> b!192348 m!219227))

(assert (=> b!192148 d!56423))

(declare-fun b!192361 () Bool)

(declare-fun e!126576 () SeekEntryResult!668)

(declare-fun lt!95683 () SeekEntryResult!668)

(assert (=> b!192361 (= e!126576 (Found!668 (index!4844 lt!95683)))))

(declare-fun d!56425 () Bool)

(declare-fun lt!95684 () SeekEntryResult!668)

(assert (=> d!56425 (and (or ((_ is Undefined!668) lt!95684) (not ((_ is Found!668) lt!95684)) (and (bvsge (index!4843 lt!95684) #b00000000000000000000000000000000) (bvslt (index!4843 lt!95684) (size!4159 (_keys!5902 thiss!1248))))) (or ((_ is Undefined!668) lt!95684) ((_ is Found!668) lt!95684) (not ((_ is MissingZero!668) lt!95684)) (and (bvsge (index!4842 lt!95684) #b00000000000000000000000000000000) (bvslt (index!4842 lt!95684) (size!4159 (_keys!5902 thiss!1248))))) (or ((_ is Undefined!668) lt!95684) ((_ is Found!668) lt!95684) ((_ is MissingZero!668) lt!95684) (not ((_ is MissingVacant!668) lt!95684)) (and (bvsge (index!4845 lt!95684) #b00000000000000000000000000000000) (bvslt (index!4845 lt!95684) (size!4159 (_keys!5902 thiss!1248))))) (or ((_ is Undefined!668) lt!95684) (ite ((_ is Found!668) lt!95684) (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4843 lt!95684)) key!828) (ite ((_ is MissingZero!668) lt!95684) (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4842 lt!95684)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!668) lt!95684) (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4845 lt!95684)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!126577 () SeekEntryResult!668)

(assert (=> d!56425 (= lt!95684 e!126577)))

(declare-fun c!34675 () Bool)

(assert (=> d!56425 (= c!34675 (and ((_ is Intermediate!668) lt!95683) (undefined!1480 lt!95683)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8145 (_ BitVec 32)) SeekEntryResult!668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56425 (= lt!95683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9150 thiss!1248)) key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(assert (=> d!56425 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56425 (= (seekEntryOrOpen!0 key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)) lt!95684)))

(declare-fun b!192362 () Bool)

(assert (=> b!192362 (= e!126577 e!126576)))

(declare-fun lt!95682 () (_ BitVec 64))

(assert (=> b!192362 (= lt!95682 (select (arr!3836 (_keys!5902 thiss!1248)) (index!4844 lt!95683)))))

(declare-fun c!34677 () Bool)

(assert (=> b!192362 (= c!34677 (= lt!95682 key!828))))

(declare-fun b!192363 () Bool)

(assert (=> b!192363 (= e!126577 Undefined!668)))

(declare-fun b!192364 () Bool)

(declare-fun e!126575 () SeekEntryResult!668)

(assert (=> b!192364 (= e!126575 (MissingZero!668 (index!4844 lt!95683)))))

(declare-fun b!192365 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8145 (_ BitVec 32)) SeekEntryResult!668)

(assert (=> b!192365 (= e!126575 (seekKeyOrZeroReturnVacant!0 (x!20566 lt!95683) (index!4844 lt!95683) (index!4844 lt!95683) key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun b!192366 () Bool)

(declare-fun c!34676 () Bool)

(assert (=> b!192366 (= c!34676 (= lt!95682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192366 (= e!126576 e!126575)))

(assert (= (and d!56425 c!34675) b!192363))

(assert (= (and d!56425 (not c!34675)) b!192362))

(assert (= (and b!192362 c!34677) b!192361))

(assert (= (and b!192362 (not c!34677)) b!192366))

(assert (= (and b!192366 c!34676) b!192364))

(assert (= (and b!192366 (not c!34676)) b!192365))

(declare-fun m!219229 () Bool)

(assert (=> d!56425 m!219229))

(assert (=> d!56425 m!219001))

(declare-fun m!219231 () Bool)

(assert (=> d!56425 m!219231))

(declare-fun m!219233 () Bool)

(assert (=> d!56425 m!219233))

(declare-fun m!219235 () Bool)

(assert (=> d!56425 m!219235))

(declare-fun m!219237 () Bool)

(assert (=> d!56425 m!219237))

(assert (=> d!56425 m!219235))

(declare-fun m!219239 () Bool)

(assert (=> b!192362 m!219239))

(declare-fun m!219241 () Bool)

(assert (=> b!192365 m!219241))

(assert (=> b!192153 d!56425))

(declare-fun d!56427 () Bool)

(declare-fun e!126580 () Bool)

(assert (=> d!56427 e!126580))

(declare-fun res!90895 () Bool)

(assert (=> d!56427 (=> (not res!90895) (not e!126580))))

(declare-fun lt!95689 () SeekEntryResult!668)

(assert (=> d!56427 (= res!90895 ((_ is Found!668) lt!95689))))

(assert (=> d!56427 (= lt!95689 (seekEntryOrOpen!0 key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun lt!95690 () Unit!5797)

(declare-fun choose!1053 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5797)

(assert (=> d!56427 (= lt!95690 (choose!1053 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56427 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56427 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) lt!95690)))

(declare-fun b!192371 () Bool)

(declare-fun res!90894 () Bool)

(assert (=> b!192371 (=> (not res!90894) (not e!126580))))

(assert (=> b!192371 (= res!90894 (inRange!0 (index!4843 lt!95689) (mask!9150 thiss!1248)))))

(declare-fun b!192372 () Bool)

(assert (=> b!192372 (= e!126580 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4843 lt!95689)) key!828))))

(assert (=> b!192372 (and (bvsge (index!4843 lt!95689) #b00000000000000000000000000000000) (bvslt (index!4843 lt!95689) (size!4159 (_keys!5902 thiss!1248))))))

(assert (= (and d!56427 res!90895) b!192371))

(assert (= (and b!192371 res!90894) b!192372))

(assert (=> d!56427 m!219007))

(declare-fun m!219243 () Bool)

(assert (=> d!56427 m!219243))

(assert (=> d!56427 m!219001))

(declare-fun m!219245 () Bool)

(assert (=> b!192371 m!219245))

(declare-fun m!219247 () Bool)

(assert (=> b!192372 m!219247))

(assert (=> b!192152 d!56427))

(declare-fun d!56429 () Bool)

(assert (=> d!56429 (= (inRange!0 (index!4843 lt!95517) (mask!9150 thiss!1248)) (and (bvsge (index!4843 lt!95517) #b00000000000000000000000000000000) (bvslt (index!4843 lt!95517) (bvadd (mask!9150 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192152 d!56429))

(declare-fun d!56431 () Bool)

(declare-fun res!90902 () Bool)

(declare-fun e!126583 () Bool)

(assert (=> d!56431 (=> (not res!90902) (not e!126583))))

(declare-fun simpleValid!199 (LongMapFixedSize!2680) Bool)

(assert (=> d!56431 (= res!90902 (simpleValid!199 thiss!1248))))

(assert (=> d!56431 (= (valid!1122 thiss!1248) e!126583)))

(declare-fun b!192379 () Bool)

(declare-fun res!90903 () Bool)

(assert (=> b!192379 (=> (not res!90903) (not e!126583))))

(declare-fun arrayCountValidKeys!0 (array!8145 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192379 (= res!90903 (= (arrayCountValidKeys!0 (_keys!5902 thiss!1248) #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))) (_size!1389 thiss!1248)))))

(declare-fun b!192380 () Bool)

(declare-fun res!90904 () Bool)

(assert (=> b!192380 (=> (not res!90904) (not e!126583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8145 (_ BitVec 32)) Bool)

(assert (=> b!192380 (= res!90904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun b!192381 () Bool)

(declare-datatypes ((List!2392 0))(
  ( (Nil!2389) (Cons!2388 (h!3028 (_ BitVec 64)) (t!7302 List!2392)) )
))
(declare-fun arrayNoDuplicates!0 (array!8145 (_ BitVec 32) List!2392) Bool)

(assert (=> b!192381 (= e!126583 (arrayNoDuplicates!0 (_keys!5902 thiss!1248) #b00000000000000000000000000000000 Nil!2389))))

(assert (= (and d!56431 res!90902) b!192379))

(assert (= (and b!192379 res!90903) b!192380))

(assert (= (and b!192380 res!90904) b!192381))

(declare-fun m!219249 () Bool)

(assert (=> d!56431 m!219249))

(declare-fun m!219251 () Bool)

(assert (=> b!192379 m!219251))

(declare-fun m!219253 () Bool)

(assert (=> b!192380 m!219253))

(declare-fun m!219255 () Bool)

(assert (=> b!192381 m!219255))

(assert (=> start!19586 d!56431))

(declare-fun b!192388 () Bool)

(declare-fun e!126588 () Bool)

(assert (=> b!192388 (= e!126588 tp_is_empty!4459)))

(declare-fun b!192389 () Bool)

(declare-fun e!126589 () Bool)

(assert (=> b!192389 (= e!126589 tp_is_empty!4459)))

(declare-fun mapNonEmpty!7714 () Bool)

(declare-fun mapRes!7714 () Bool)

(declare-fun tp!16930 () Bool)

(assert (=> mapNonEmpty!7714 (= mapRes!7714 (and tp!16930 e!126588))))

(declare-fun mapRest!7714 () (Array (_ BitVec 32) ValueCell!1886))

(declare-fun mapValue!7714 () ValueCell!1886)

(declare-fun mapKey!7714 () (_ BitVec 32))

(assert (=> mapNonEmpty!7714 (= mapRest!7705 (store mapRest!7714 mapKey!7714 mapValue!7714))))

(declare-fun mapIsEmpty!7714 () Bool)

(assert (=> mapIsEmpty!7714 mapRes!7714))

(declare-fun condMapEmpty!7714 () Bool)

(declare-fun mapDefault!7714 () ValueCell!1886)

(assert (=> mapNonEmpty!7705 (= condMapEmpty!7714 (= mapRest!7705 ((as const (Array (_ BitVec 32) ValueCell!1886)) mapDefault!7714)))))

(assert (=> mapNonEmpty!7705 (= tp!16914 (and e!126589 mapRes!7714))))

(assert (= (and mapNonEmpty!7705 condMapEmpty!7714) mapIsEmpty!7714))

(assert (= (and mapNonEmpty!7705 (not condMapEmpty!7714)) mapNonEmpty!7714))

(assert (= (and mapNonEmpty!7714 ((_ is ValueCellFull!1886) mapValue!7714)) b!192388))

(assert (= (and mapNonEmpty!7705 ((_ is ValueCellFull!1886) mapDefault!7714)) b!192389))

(declare-fun m!219257 () Bool)

(assert (=> mapNonEmpty!7714 m!219257))

(declare-fun b_lambda!7449 () Bool)

(assert (= b_lambda!7445 (or (and b!192144 b_free!4687) b_lambda!7449)))

(declare-fun b_lambda!7451 () Bool)

(assert (= b_lambda!7447 (or (and b!192144 b_free!4687) b_lambda!7451)))

(check-sat (not b!192381) (not b!192304) (not b!192379) (not b!192336) b_and!11395 (not d!56425) (not d!56417) (not b!192348) (not b!192247) (not d!56413) (not b!192346) (not b!192333) (not b!192303) (not b_lambda!7451) (not b!192301) (not d!56407) (not bm!19404) (not b!192328) (not b!192292) (not b!192317) (not b!192337) (not b!192332) tp_is_empty!4459 (not b!192371) (not bm!19403) (not bm!19396) (not bm!19405) (not b!192321) (not bm!19399) (not b!192365) (not d!56423) (not b!192291) (not b!192320) (not b!192299) (not d!56427) (not bm!19380) (not bm!19398) (not b!192318) (not b_next!4687) (not d!56421) (not b!192330) (not d!56419) (not mapNonEmpty!7714) (not bm!19397) (not b!192380) (not bm!19406) (not bm!19381) (not b_lambda!7449) (not d!56431) (not b!192308) (not b!192307))
(check-sat b_and!11395 (not b_next!4687))
(get-model)

(declare-fun d!56433 () Bool)

(declare-fun get!2226 (Option!247) V!5593)

(assert (=> d!56433 (= (apply!183 lt!95661 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2226 (getValueByKey!241 (toList!1215 lt!95661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7708 () Bool)

(assert (= bs!7708 d!56433))

(declare-fun m!219259 () Bool)

(assert (=> bs!7708 m!219259))

(assert (=> bs!7708 m!219259))

(declare-fun m!219261 () Bool)

(assert (=> bs!7708 m!219261))

(assert (=> b!192320 d!56433))

(declare-fun d!56435 () Bool)

(assert (=> d!56435 (= (apply!183 lt!95627 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (get!2226 (getValueByKey!241 (toList!1215 lt!95627) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7709 () Bool)

(assert (= bs!7709 d!56435))

(assert (=> bs!7709 m!219099))

(declare-fun m!219263 () Bool)

(assert (=> bs!7709 m!219263))

(assert (=> bs!7709 m!219263))

(declare-fun m!219265 () Bool)

(assert (=> bs!7709 m!219265))

(assert (=> b!192301 d!56435))

(declare-fun c!34680 () Bool)

(declare-fun d!56437 () Bool)

(assert (=> d!56437 (= c!34680 ((_ is ValueCellFull!1886) (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!126592 () V!5593)

(assert (=> d!56437 (= (get!2225 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126592)))

(declare-fun b!192394 () Bool)

(declare-fun get!2227 (ValueCell!1886 V!5593) V!5593)

(assert (=> b!192394 (= e!126592 (get!2227 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192395 () Bool)

(declare-fun get!2228 (ValueCell!1886 V!5593) V!5593)

(assert (=> b!192395 (= e!126592 (get!2228 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56437 c!34680) b!192394))

(assert (= (and d!56437 (not c!34680)) b!192395))

(assert (=> b!192394 m!219151))

(assert (=> b!192394 m!219149))

(declare-fun m!219267 () Bool)

(assert (=> b!192394 m!219267))

(assert (=> b!192395 m!219151))

(assert (=> b!192395 m!219149))

(declare-fun m!219269 () Bool)

(assert (=> b!192395 m!219269))

(assert (=> b!192301 d!56437))

(declare-fun d!56439 () Bool)

(declare-fun res!90909 () Bool)

(declare-fun e!126597 () Bool)

(assert (=> d!56439 (=> res!90909 e!126597)))

(assert (=> d!56439 (= res!90909 (= (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56439 (= (arrayContainsKey!0 (_keys!5902 thiss!1248) key!828 #b00000000000000000000000000000000) e!126597)))

(declare-fun b!192400 () Bool)

(declare-fun e!126598 () Bool)

(assert (=> b!192400 (= e!126597 e!126598)))

(declare-fun res!90910 () Bool)

(assert (=> b!192400 (=> (not res!90910) (not e!126598))))

(assert (=> b!192400 (= res!90910 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192401 () Bool)

(assert (=> b!192401 (= e!126598 (arrayContainsKey!0 (_keys!5902 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56439 (not res!90909)) b!192400))

(assert (= (and b!192400 res!90910) b!192401))

(assert (=> d!56439 m!219099))

(declare-fun m!219271 () Bool)

(assert (=> b!192401 m!219271))

(assert (=> bm!19381 d!56439))

(declare-fun d!56441 () Bool)

(assert (=> d!56441 (= (apply!183 lt!95661 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2226 (getValueByKey!241 (toList!1215 lt!95661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7710 () Bool)

(assert (= bs!7710 d!56441))

(declare-fun m!219273 () Bool)

(assert (=> bs!7710 m!219273))

(assert (=> bs!7710 m!219273))

(declare-fun m!219275 () Bool)

(assert (=> bs!7710 m!219275))

(assert (=> b!192337 d!56441))

(declare-fun d!56443 () Bool)

(assert (=> d!56443 (= (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192336 d!56443))

(declare-fun b!192426 () Bool)

(declare-fun e!126613 () Bool)

(declare-fun lt!95707 () ListLongMap!2399)

(assert (=> b!192426 (= e!126613 (= lt!95707 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248))))))

(declare-fun b!192427 () Bool)

(declare-fun e!126619 () ListLongMap!2399)

(declare-fun call!19415 () ListLongMap!2399)

(assert (=> b!192427 (= e!126619 call!19415)))

(declare-fun b!192428 () Bool)

(declare-fun res!90922 () Bool)

(declare-fun e!126615 () Bool)

(assert (=> b!192428 (=> (not res!90922) (not e!126615))))

(assert (=> b!192428 (= res!90922 (not (contains!1343 lt!95707 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192429 () Bool)

(declare-fun e!126616 () Bool)

(assert (=> b!192429 (= e!126616 e!126613)))

(declare-fun c!34689 () Bool)

(assert (=> b!192429 (= c!34689 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun d!56445 () Bool)

(assert (=> d!56445 e!126615))

(declare-fun res!90919 () Bool)

(assert (=> d!56445 (=> (not res!90919) (not e!126615))))

(assert (=> d!56445 (= res!90919 (not (contains!1343 lt!95707 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!126618 () ListLongMap!2399)

(assert (=> d!56445 (= lt!95707 e!126618)))

(declare-fun c!34692 () Bool)

(assert (=> d!56445 (= c!34692 (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56445 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56445 (= (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95707)))

(declare-fun b!192430 () Bool)

(assert (=> b!192430 (= e!126615 e!126616)))

(declare-fun c!34691 () Bool)

(declare-fun e!126617 () Bool)

(assert (=> b!192430 (= c!34691 e!126617)))

(declare-fun res!90920 () Bool)

(assert (=> b!192430 (=> (not res!90920) (not e!126617))))

(assert (=> b!192430 (= res!90920 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192431 () Bool)

(declare-fun lt!95710 () Unit!5797)

(declare-fun lt!95706 () Unit!5797)

(assert (=> b!192431 (= lt!95710 lt!95706)))

(declare-fun lt!95705 () V!5593)

(declare-fun lt!95708 () (_ BitVec 64))

(declare-fun lt!95711 () (_ BitVec 64))

(declare-fun lt!95709 () ListLongMap!2399)

(assert (=> b!192431 (not (contains!1343 (+!308 lt!95709 (tuple2!3479 lt!95711 lt!95705)) lt!95708))))

(declare-fun addStillNotContains!98 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5797)

(assert (=> b!192431 (= lt!95706 (addStillNotContains!98 lt!95709 lt!95711 lt!95705 lt!95708))))

(assert (=> b!192431 (= lt!95708 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192431 (= lt!95705 (get!2225 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192431 (= lt!95711 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192431 (= lt!95709 call!19415)))

(assert (=> b!192431 (= e!126619 (+!308 call!19415 (tuple2!3479 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) (get!2225 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!19412 () Bool)

(assert (=> bm!19412 (= call!19415 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192432 () Bool)

(assert (=> b!192432 (= e!126618 (ListLongMap!2400 Nil!2386))))

(declare-fun b!192433 () Bool)

(assert (=> b!192433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> b!192433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4160 (_values!3903 thiss!1248))))))

(declare-fun e!126614 () Bool)

(assert (=> b!192433 (= e!126614 (= (apply!183 lt!95707 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!192434 () Bool)

(assert (=> b!192434 (= e!126618 e!126619)))

(declare-fun c!34690 () Bool)

(assert (=> b!192434 (= c!34690 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192435 () Bool)

(assert (=> b!192435 (= e!126616 e!126614)))

(assert (=> b!192435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun res!90921 () Bool)

(assert (=> b!192435 (= res!90921 (contains!1343 lt!95707 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192435 (=> (not res!90921) (not e!126614))))

(declare-fun b!192436 () Bool)

(assert (=> b!192436 (= e!126617 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192436 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!192437 () Bool)

(declare-fun isEmpty!491 (ListLongMap!2399) Bool)

(assert (=> b!192437 (= e!126613 (isEmpty!491 lt!95707))))

(assert (= (and d!56445 c!34692) b!192432))

(assert (= (and d!56445 (not c!34692)) b!192434))

(assert (= (and b!192434 c!34690) b!192431))

(assert (= (and b!192434 (not c!34690)) b!192427))

(assert (= (or b!192431 b!192427) bm!19412))

(assert (= (and d!56445 res!90919) b!192428))

(assert (= (and b!192428 res!90922) b!192430))

(assert (= (and b!192430 res!90920) b!192436))

(assert (= (and b!192430 c!34691) b!192435))

(assert (= (and b!192430 (not c!34691)) b!192429))

(assert (= (and b!192435 res!90921) b!192433))

(assert (= (and b!192429 c!34689) b!192426))

(assert (= (and b!192429 (not c!34689)) b!192437))

(declare-fun b_lambda!7453 () Bool)

(assert (=> (not b_lambda!7453) (not b!192431)))

(assert (=> b!192431 t!7301))

(declare-fun b_and!11397 () Bool)

(assert (= b_and!11395 (and (=> t!7301 result!4901) b_and!11397)))

(declare-fun b_lambda!7455 () Bool)

(assert (=> (not b_lambda!7455) (not b!192433)))

(assert (=> b!192433 t!7301))

(declare-fun b_and!11399 () Bool)

(assert (= b_and!11397 (and (=> t!7301 result!4901) b_and!11399)))

(assert (=> b!192431 m!219149))

(assert (=> b!192431 m!219099))

(declare-fun m!219277 () Bool)

(assert (=> b!192431 m!219277))

(declare-fun m!219279 () Bool)

(assert (=> b!192431 m!219279))

(assert (=> b!192431 m!219215))

(declare-fun m!219281 () Bool)

(assert (=> b!192431 m!219281))

(assert (=> b!192431 m!219277))

(declare-fun m!219283 () Bool)

(assert (=> b!192431 m!219283))

(assert (=> b!192431 m!219215))

(assert (=> b!192431 m!219149))

(assert (=> b!192431 m!219217))

(assert (=> b!192436 m!219099))

(assert (=> b!192436 m!219099))

(assert (=> b!192436 m!219101))

(declare-fun m!219285 () Bool)

(assert (=> bm!19412 m!219285))

(assert (=> b!192426 m!219285))

(declare-fun m!219287 () Bool)

(assert (=> b!192437 m!219287))

(declare-fun m!219289 () Bool)

(assert (=> b!192428 m!219289))

(assert (=> b!192433 m!219099))

(declare-fun m!219291 () Bool)

(assert (=> b!192433 m!219291))

(assert (=> b!192433 m!219149))

(assert (=> b!192433 m!219099))

(assert (=> b!192433 m!219215))

(assert (=> b!192433 m!219215))

(assert (=> b!192433 m!219149))

(assert (=> b!192433 m!219217))

(assert (=> b!192435 m!219099))

(assert (=> b!192435 m!219099))

(declare-fun m!219293 () Bool)

(assert (=> b!192435 m!219293))

(assert (=> b!192434 m!219099))

(assert (=> b!192434 m!219099))

(assert (=> b!192434 m!219101))

(declare-fun m!219295 () Bool)

(assert (=> d!56445 m!219295))

(assert (=> d!56445 m!219001))

(assert (=> bm!19403 d!56445))

(declare-fun d!56447 () Bool)

(assert (=> d!56447 (= (inRange!0 (ite c!34640 (index!4842 lt!95560) (index!4845 lt!95560)) (mask!9150 thiss!1248)) (and (bvsge (ite c!34640 (index!4842 lt!95560) (index!4845 lt!95560)) #b00000000000000000000000000000000) (bvslt (ite c!34640 (index!4842 lt!95560) (index!4845 lt!95560)) (bvadd (mask!9150 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19380 d!56447))

(declare-fun d!56449 () Bool)

(declare-fun res!90927 () Bool)

(declare-fun e!126624 () Bool)

(assert (=> d!56449 (=> res!90927 e!126624)))

(assert (=> d!56449 (= res!90927 (and ((_ is Cons!2385) (toList!1215 lt!95513)) (= (_1!1750 (h!3025 (toList!1215 lt!95513))) key!828)))))

(assert (=> d!56449 (= (containsKey!244 (toList!1215 lt!95513) key!828) e!126624)))

(declare-fun b!192442 () Bool)

(declare-fun e!126625 () Bool)

(assert (=> b!192442 (= e!126624 e!126625)))

(declare-fun res!90928 () Bool)

(assert (=> b!192442 (=> (not res!90928) (not e!126625))))

(assert (=> b!192442 (= res!90928 (and (or (not ((_ is Cons!2385) (toList!1215 lt!95513))) (bvsle (_1!1750 (h!3025 (toList!1215 lt!95513))) key!828)) ((_ is Cons!2385) (toList!1215 lt!95513)) (bvslt (_1!1750 (h!3025 (toList!1215 lt!95513))) key!828)))))

(declare-fun b!192443 () Bool)

(assert (=> b!192443 (= e!126625 (containsKey!244 (t!7297 (toList!1215 lt!95513)) key!828))))

(assert (= (and d!56449 (not res!90927)) b!192442))

(assert (= (and b!192442 res!90928) b!192443))

(declare-fun m!219297 () Bool)

(assert (=> b!192443 m!219297))

(assert (=> d!56423 d!56449))

(declare-fun d!56451 () Bool)

(assert (=> d!56451 (= (apply!183 (+!308 lt!95622 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))) lt!95613) (apply!183 lt!95622 lt!95613))))

(declare-fun lt!95714 () Unit!5797)

(declare-fun choose!1054 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5797)

(assert (=> d!56451 (= lt!95714 (choose!1054 lt!95622 lt!95608 (minValue!3761 thiss!1248) lt!95613))))

(declare-fun e!126628 () Bool)

(assert (=> d!56451 e!126628))

(declare-fun res!90931 () Bool)

(assert (=> d!56451 (=> (not res!90931) (not e!126628))))

(assert (=> d!56451 (= res!90931 (contains!1343 lt!95622 lt!95613))))

(assert (=> d!56451 (= (addApplyDifferent!159 lt!95622 lt!95608 (minValue!3761 thiss!1248) lt!95613) lt!95714)))

(declare-fun b!192447 () Bool)

(assert (=> b!192447 (= e!126628 (not (= lt!95613 lt!95608)))))

(assert (= (and d!56451 res!90931) b!192447))

(declare-fun m!219299 () Bool)

(assert (=> d!56451 m!219299))

(declare-fun m!219301 () Bool)

(assert (=> d!56451 m!219301))

(assert (=> d!56451 m!219117))

(assert (=> d!56451 m!219131))

(assert (=> d!56451 m!219117))

(assert (=> d!56451 m!219127))

(assert (=> b!192299 d!56451))

(declare-fun d!56453 () Bool)

(declare-fun e!126629 () Bool)

(assert (=> d!56453 e!126629))

(declare-fun res!90932 () Bool)

(assert (=> d!56453 (=> (not res!90932) (not e!126629))))

(declare-fun lt!95715 () ListLongMap!2399)

(assert (=> d!56453 (= res!90932 (contains!1343 lt!95715 (_1!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95716 () List!2389)

(assert (=> d!56453 (= lt!95715 (ListLongMap!2400 lt!95716))))

(declare-fun lt!95718 () Unit!5797)

(declare-fun lt!95717 () Unit!5797)

(assert (=> d!56453 (= lt!95718 lt!95717)))

(assert (=> d!56453 (= (getValueByKey!241 lt!95716 (_1!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))))))

(assert (=> d!56453 (= lt!95717 (lemmaContainsTupThenGetReturnValue!128 lt!95716 (_1!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))))))

(assert (=> d!56453 (= lt!95716 (insertStrictlySorted!131 (toList!1215 lt!95622) (_1!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))))))

(assert (=> d!56453 (= (+!308 lt!95622 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))) lt!95715)))

(declare-fun b!192448 () Bool)

(declare-fun res!90933 () Bool)

(assert (=> b!192448 (=> (not res!90933) (not e!126629))))

(assert (=> b!192448 (= res!90933 (= (getValueByKey!241 (toList!1215 lt!95715) (_1!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))))))))

(declare-fun b!192449 () Bool)

(assert (=> b!192449 (= e!126629 (contains!1346 (toList!1215 lt!95715) (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))))))

(assert (= (and d!56453 res!90932) b!192448))

(assert (= (and b!192448 res!90933) b!192449))

(declare-fun m!219303 () Bool)

(assert (=> d!56453 m!219303))

(declare-fun m!219305 () Bool)

(assert (=> d!56453 m!219305))

(declare-fun m!219307 () Bool)

(assert (=> d!56453 m!219307))

(declare-fun m!219309 () Bool)

(assert (=> d!56453 m!219309))

(declare-fun m!219311 () Bool)

(assert (=> b!192448 m!219311))

(declare-fun m!219313 () Bool)

(assert (=> b!192449 m!219313))

(assert (=> b!192299 d!56453))

(declare-fun e!126630 () Bool)

(declare-fun lt!95721 () ListLongMap!2399)

(declare-fun b!192450 () Bool)

(assert (=> b!192450 (= e!126630 (= lt!95721 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248))))))

(declare-fun b!192451 () Bool)

(declare-fun e!126636 () ListLongMap!2399)

(declare-fun call!19416 () ListLongMap!2399)

(assert (=> b!192451 (= e!126636 call!19416)))

(declare-fun b!192452 () Bool)

(declare-fun res!90937 () Bool)

(declare-fun e!126632 () Bool)

(assert (=> b!192452 (=> (not res!90937) (not e!126632))))

(assert (=> b!192452 (= res!90937 (not (contains!1343 lt!95721 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192453 () Bool)

(declare-fun e!126633 () Bool)

(assert (=> b!192453 (= e!126633 e!126630)))

(declare-fun c!34693 () Bool)

(assert (=> b!192453 (= c!34693 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun d!56455 () Bool)

(assert (=> d!56455 e!126632))

(declare-fun res!90934 () Bool)

(assert (=> d!56455 (=> (not res!90934) (not e!126632))))

(assert (=> d!56455 (= res!90934 (not (contains!1343 lt!95721 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!126635 () ListLongMap!2399)

(assert (=> d!56455 (= lt!95721 e!126635)))

(declare-fun c!34696 () Bool)

(assert (=> d!56455 (= c!34696 (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56455 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56455 (= (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95721)))

(declare-fun b!192454 () Bool)

(assert (=> b!192454 (= e!126632 e!126633)))

(declare-fun c!34695 () Bool)

(declare-fun e!126634 () Bool)

(assert (=> b!192454 (= c!34695 e!126634)))

(declare-fun res!90935 () Bool)

(assert (=> b!192454 (=> (not res!90935) (not e!126634))))

(assert (=> b!192454 (= res!90935 (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun b!192455 () Bool)

(declare-fun lt!95724 () Unit!5797)

(declare-fun lt!95720 () Unit!5797)

(assert (=> b!192455 (= lt!95724 lt!95720)))

(declare-fun lt!95725 () (_ BitVec 64))

(declare-fun lt!95723 () ListLongMap!2399)

(declare-fun lt!95722 () (_ BitVec 64))

(declare-fun lt!95719 () V!5593)

(assert (=> b!192455 (not (contains!1343 (+!308 lt!95723 (tuple2!3479 lt!95725 lt!95719)) lt!95722))))

(assert (=> b!192455 (= lt!95720 (addStillNotContains!98 lt!95723 lt!95725 lt!95719 lt!95722))))

(assert (=> b!192455 (= lt!95722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192455 (= lt!95719 (get!2225 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192455 (= lt!95725 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192455 (= lt!95723 call!19416)))

(assert (=> b!192455 (= e!126636 (+!308 call!19416 (tuple2!3479 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) (get!2225 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!19413 () Bool)

(assert (=> bm!19413 (= call!19416 (getCurrentListMapNoExtraKeys!214 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192456 () Bool)

(assert (=> b!192456 (= e!126635 (ListLongMap!2400 Nil!2386))))

(declare-fun b!192457 () Bool)

(assert (=> b!192457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> b!192457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4160 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))))))))

(declare-fun e!126631 () Bool)

(assert (=> b!192457 (= e!126631 (= (apply!183 lt!95721 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3837 (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!192458 () Bool)

(assert (=> b!192458 (= e!126635 e!126636)))

(declare-fun c!34694 () Bool)

(assert (=> b!192458 (= c!34694 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192459 () Bool)

(assert (=> b!192459 (= e!126633 e!126631)))

(assert (=> b!192459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun res!90936 () Bool)

(assert (=> b!192459 (= res!90936 (contains!1343 lt!95721 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192459 (=> (not res!90936) (not e!126631))))

(declare-fun b!192460 () Bool)

(assert (=> b!192460 (= e!126634 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192460 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!192461 () Bool)

(assert (=> b!192461 (= e!126630 (isEmpty!491 lt!95721))))

(assert (= (and d!56455 c!34696) b!192456))

(assert (= (and d!56455 (not c!34696)) b!192458))

(assert (= (and b!192458 c!34694) b!192455))

(assert (= (and b!192458 (not c!34694)) b!192451))

(assert (= (or b!192455 b!192451) bm!19413))

(assert (= (and d!56455 res!90934) b!192452))

(assert (= (and b!192452 res!90937) b!192454))

(assert (= (and b!192454 res!90935) b!192460))

(assert (= (and b!192454 c!34695) b!192459))

(assert (= (and b!192454 (not c!34695)) b!192453))

(assert (= (and b!192459 res!90936) b!192457))

(assert (= (and b!192453 c!34693) b!192450))

(assert (= (and b!192453 (not c!34693)) b!192461))

(declare-fun b_lambda!7457 () Bool)

(assert (=> (not b_lambda!7457) (not b!192455)))

(assert (=> b!192455 t!7301))

(declare-fun b_and!11401 () Bool)

(assert (= b_and!11399 (and (=> t!7301 result!4901) b_and!11401)))

(declare-fun b_lambda!7459 () Bool)

(assert (=> (not b_lambda!7459) (not b!192457)))

(assert (=> b!192457 t!7301))

(declare-fun b_and!11403 () Bool)

(assert (= b_and!11401 (and (=> t!7301 result!4901) b_and!11403)))

(assert (=> b!192455 m!219149))

(assert (=> b!192455 m!219099))

(declare-fun m!219315 () Bool)

(assert (=> b!192455 m!219315))

(declare-fun m!219317 () Bool)

(assert (=> b!192455 m!219317))

(assert (=> b!192455 m!219151))

(declare-fun m!219319 () Bool)

(assert (=> b!192455 m!219319))

(assert (=> b!192455 m!219315))

(declare-fun m!219321 () Bool)

(assert (=> b!192455 m!219321))

(assert (=> b!192455 m!219151))

(assert (=> b!192455 m!219149))

(assert (=> b!192455 m!219153))

(assert (=> b!192460 m!219099))

(assert (=> b!192460 m!219099))

(assert (=> b!192460 m!219101))

(declare-fun m!219323 () Bool)

(assert (=> bm!19413 m!219323))

(assert (=> b!192450 m!219323))

(declare-fun m!219325 () Bool)

(assert (=> b!192461 m!219325))

(declare-fun m!219327 () Bool)

(assert (=> b!192452 m!219327))

(assert (=> b!192457 m!219099))

(declare-fun m!219329 () Bool)

(assert (=> b!192457 m!219329))

(assert (=> b!192457 m!219149))

(assert (=> b!192457 m!219099))

(assert (=> b!192457 m!219151))

(assert (=> b!192457 m!219151))

(assert (=> b!192457 m!219149))

(assert (=> b!192457 m!219153))

(assert (=> b!192459 m!219099))

(assert (=> b!192459 m!219099))

(declare-fun m!219331 () Bool)

(assert (=> b!192459 m!219331))

(assert (=> b!192458 m!219099))

(assert (=> b!192458 m!219099))

(assert (=> b!192458 m!219101))

(declare-fun m!219333 () Bool)

(assert (=> d!56455 m!219333))

(assert (=> d!56455 m!219001))

(assert (=> b!192299 d!56455))

(declare-fun d!56457 () Bool)

(assert (=> d!56457 (= (apply!183 (+!308 lt!95618 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))) lt!95626) (get!2226 (getValueByKey!241 (toList!1215 (+!308 lt!95618 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))) lt!95626)))))

(declare-fun bs!7711 () Bool)

(assert (= bs!7711 d!56457))

(declare-fun m!219335 () Bool)

(assert (=> bs!7711 m!219335))

(assert (=> bs!7711 m!219335))

(declare-fun m!219337 () Bool)

(assert (=> bs!7711 m!219337))

(assert (=> b!192299 d!56457))

(declare-fun d!56459 () Bool)

(assert (=> d!56459 (= (apply!183 lt!95622 lt!95613) (get!2226 (getValueByKey!241 (toList!1215 lt!95622) lt!95613)))))

(declare-fun bs!7712 () Bool)

(assert (= bs!7712 d!56459))

(declare-fun m!219339 () Bool)

(assert (=> bs!7712 m!219339))

(assert (=> bs!7712 m!219339))

(declare-fun m!219341 () Bool)

(assert (=> bs!7712 m!219341))

(assert (=> b!192299 d!56459))

(declare-fun d!56461 () Bool)

(assert (=> d!56461 (= (apply!183 (+!308 lt!95616 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))) lt!95614) (get!2226 (getValueByKey!241 (toList!1215 (+!308 lt!95616 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))) lt!95614)))))

(declare-fun bs!7713 () Bool)

(assert (= bs!7713 d!56461))

(declare-fun m!219343 () Bool)

(assert (=> bs!7713 m!219343))

(assert (=> bs!7713 m!219343))

(declare-fun m!219345 () Bool)

(assert (=> bs!7713 m!219345))

(assert (=> b!192299 d!56461))

(declare-fun d!56463 () Bool)

(declare-fun e!126637 () Bool)

(assert (=> d!56463 e!126637))

(declare-fun res!90938 () Bool)

(assert (=> d!56463 (=> (not res!90938) (not e!126637))))

(declare-fun lt!95726 () ListLongMap!2399)

(assert (=> d!56463 (= res!90938 (contains!1343 lt!95726 (_1!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95727 () List!2389)

(assert (=> d!56463 (= lt!95726 (ListLongMap!2400 lt!95727))))

(declare-fun lt!95729 () Unit!5797)

(declare-fun lt!95728 () Unit!5797)

(assert (=> d!56463 (= lt!95729 lt!95728)))

(assert (=> d!56463 (= (getValueByKey!241 lt!95727 (_1!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56463 (= lt!95728 (lemmaContainsTupThenGetReturnValue!128 lt!95727 (_1!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56463 (= lt!95727 (insertStrictlySorted!131 (toList!1215 lt!95620) (_1!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56463 (= (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))) lt!95726)))

(declare-fun b!192462 () Bool)

(declare-fun res!90939 () Bool)

(assert (=> b!192462 (=> (not res!90939) (not e!126637))))

(assert (=> b!192462 (= res!90939 (= (getValueByKey!241 (toList!1215 lt!95726) (_1!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192463 () Bool)

(assert (=> b!192463 (= e!126637 (contains!1346 (toList!1215 lt!95726) (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56463 res!90938) b!192462))

(assert (= (and b!192462 res!90939) b!192463))

(declare-fun m!219347 () Bool)

(assert (=> d!56463 m!219347))

(declare-fun m!219349 () Bool)

(assert (=> d!56463 m!219349))

(declare-fun m!219351 () Bool)

(assert (=> d!56463 m!219351))

(declare-fun m!219353 () Bool)

(assert (=> d!56463 m!219353))

(declare-fun m!219355 () Bool)

(assert (=> b!192462 m!219355))

(declare-fun m!219357 () Bool)

(assert (=> b!192463 m!219357))

(assert (=> b!192299 d!56463))

(declare-fun d!56465 () Bool)

(assert (=> d!56465 (= (apply!183 (+!308 lt!95622 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248))) lt!95613) (get!2226 (getValueByKey!241 (toList!1215 (+!308 lt!95622 (tuple2!3479 lt!95608 (minValue!3761 thiss!1248)))) lt!95613)))))

(declare-fun bs!7714 () Bool)

(assert (= bs!7714 d!56465))

(declare-fun m!219359 () Bool)

(assert (=> bs!7714 m!219359))

(assert (=> bs!7714 m!219359))

(declare-fun m!219361 () Bool)

(assert (=> bs!7714 m!219361))

(assert (=> b!192299 d!56465))

(declare-fun d!56467 () Bool)

(assert (=> d!56467 (= (apply!183 lt!95618 lt!95626) (get!2226 (getValueByKey!241 (toList!1215 lt!95618) lt!95626)))))

(declare-fun bs!7715 () Bool)

(assert (= bs!7715 d!56467))

(declare-fun m!219363 () Bool)

(assert (=> bs!7715 m!219363))

(assert (=> bs!7715 m!219363))

(declare-fun m!219365 () Bool)

(assert (=> bs!7715 m!219365))

(assert (=> b!192299 d!56467))

(declare-fun d!56469 () Bool)

(assert (=> d!56469 (= (apply!183 (+!308 lt!95618 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))) lt!95626) (apply!183 lt!95618 lt!95626))))

(declare-fun lt!95730 () Unit!5797)

(assert (=> d!56469 (= lt!95730 (choose!1054 lt!95618 lt!95615 (minValue!3761 thiss!1248) lt!95626))))

(declare-fun e!126638 () Bool)

(assert (=> d!56469 e!126638))

(declare-fun res!90940 () Bool)

(assert (=> d!56469 (=> (not res!90940) (not e!126638))))

(assert (=> d!56469 (= res!90940 (contains!1343 lt!95618 lt!95626))))

(assert (=> d!56469 (= (addApplyDifferent!159 lt!95618 lt!95615 (minValue!3761 thiss!1248) lt!95626) lt!95730)))

(declare-fun b!192464 () Bool)

(assert (=> b!192464 (= e!126638 (not (= lt!95626 lt!95615)))))

(assert (= (and d!56469 res!90940) b!192464))

(declare-fun m!219367 () Bool)

(assert (=> d!56469 m!219367))

(declare-fun m!219369 () Bool)

(assert (=> d!56469 m!219369))

(assert (=> d!56469 m!219113))

(assert (=> d!56469 m!219123))

(assert (=> d!56469 m!219113))

(assert (=> d!56469 m!219115))

(assert (=> b!192299 d!56469))

(declare-fun d!56471 () Bool)

(declare-fun e!126639 () Bool)

(assert (=> d!56471 e!126639))

(declare-fun res!90941 () Bool)

(assert (=> d!56471 (=> (not res!90941) (not e!126639))))

(declare-fun lt!95731 () ListLongMap!2399)

(assert (=> d!56471 (= res!90941 (contains!1343 lt!95731 (_1!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95732 () List!2389)

(assert (=> d!56471 (= lt!95731 (ListLongMap!2400 lt!95732))))

(declare-fun lt!95734 () Unit!5797)

(declare-fun lt!95733 () Unit!5797)

(assert (=> d!56471 (= lt!95734 lt!95733)))

(assert (=> d!56471 (= (getValueByKey!241 lt!95732 (_1!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))))))

(assert (=> d!56471 (= lt!95733 (lemmaContainsTupThenGetReturnValue!128 lt!95732 (_1!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))))))

(assert (=> d!56471 (= lt!95732 (insertStrictlySorted!131 (toList!1215 lt!95618) (_1!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))))))

(assert (=> d!56471 (= (+!308 lt!95618 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))) lt!95731)))

(declare-fun b!192465 () Bool)

(declare-fun res!90942 () Bool)

(assert (=> b!192465 (=> (not res!90942) (not e!126639))))

(assert (=> b!192465 (= res!90942 (= (getValueByKey!241 (toList!1215 lt!95731) (_1!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))))))))

(declare-fun b!192466 () Bool)

(assert (=> b!192466 (= e!126639 (contains!1346 (toList!1215 lt!95731) (tuple2!3479 lt!95615 (minValue!3761 thiss!1248))))))

(assert (= (and d!56471 res!90941) b!192465))

(assert (= (and b!192465 res!90942) b!192466))

(declare-fun m!219371 () Bool)

(assert (=> d!56471 m!219371))

(declare-fun m!219373 () Bool)

(assert (=> d!56471 m!219373))

(declare-fun m!219375 () Bool)

(assert (=> d!56471 m!219375))

(declare-fun m!219377 () Bool)

(assert (=> d!56471 m!219377))

(declare-fun m!219379 () Bool)

(assert (=> b!192465 m!219379))

(declare-fun m!219381 () Bool)

(assert (=> b!192466 m!219381))

(assert (=> b!192299 d!56471))

(declare-fun d!56473 () Bool)

(assert (=> d!56473 (= (apply!183 lt!95616 lt!95614) (get!2226 (getValueByKey!241 (toList!1215 lt!95616) lt!95614)))))

(declare-fun bs!7716 () Bool)

(assert (= bs!7716 d!56473))

(declare-fun m!219383 () Bool)

(assert (=> bs!7716 m!219383))

(assert (=> bs!7716 m!219383))

(declare-fun m!219385 () Bool)

(assert (=> bs!7716 m!219385))

(assert (=> b!192299 d!56473))

(declare-fun d!56475 () Bool)

(assert (=> d!56475 (contains!1343 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))) lt!95623)))

(declare-fun lt!95737 () Unit!5797)

(declare-fun choose!1055 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5797)

(assert (=> d!56475 (= lt!95737 (choose!1055 lt!95620 lt!95629 (zeroValue!3761 thiss!1248) lt!95623))))

(assert (=> d!56475 (contains!1343 lt!95620 lt!95623)))

(assert (=> d!56475 (= (addStillContains!159 lt!95620 lt!95629 (zeroValue!3761 thiss!1248) lt!95623) lt!95737)))

(declare-fun bs!7717 () Bool)

(assert (= bs!7717 d!56475))

(assert (=> bs!7717 m!219135))

(assert (=> bs!7717 m!219135))

(assert (=> bs!7717 m!219137))

(declare-fun m!219387 () Bool)

(assert (=> bs!7717 m!219387))

(declare-fun m!219389 () Bool)

(assert (=> bs!7717 m!219389))

(assert (=> b!192299 d!56475))

(declare-fun d!56477 () Bool)

(declare-fun e!126640 () Bool)

(assert (=> d!56477 e!126640))

(declare-fun res!90943 () Bool)

(assert (=> d!56477 (=> res!90943 e!126640)))

(declare-fun lt!95739 () Bool)

(assert (=> d!56477 (= res!90943 (not lt!95739))))

(declare-fun lt!95741 () Bool)

(assert (=> d!56477 (= lt!95739 lt!95741)))

(declare-fun lt!95740 () Unit!5797)

(declare-fun e!126641 () Unit!5797)

(assert (=> d!56477 (= lt!95740 e!126641)))

(declare-fun c!34697 () Bool)

(assert (=> d!56477 (= c!34697 lt!95741)))

(assert (=> d!56477 (= lt!95741 (containsKey!244 (toList!1215 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))) lt!95623))))

(assert (=> d!56477 (= (contains!1343 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248))) lt!95623) lt!95739)))

(declare-fun b!192468 () Bool)

(declare-fun lt!95738 () Unit!5797)

(assert (=> b!192468 (= e!126641 lt!95738)))

(assert (=> b!192468 (= lt!95738 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))) lt!95623))))

(assert (=> b!192468 (isDefined!193 (getValueByKey!241 (toList!1215 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))) lt!95623))))

(declare-fun b!192469 () Bool)

(declare-fun Unit!5808 () Unit!5797)

(assert (=> b!192469 (= e!126641 Unit!5808)))

(declare-fun b!192470 () Bool)

(assert (=> b!192470 (= e!126640 (isDefined!193 (getValueByKey!241 (toList!1215 (+!308 lt!95620 (tuple2!3479 lt!95629 (zeroValue!3761 thiss!1248)))) lt!95623)))))

(assert (= (and d!56477 c!34697) b!192468))

(assert (= (and d!56477 (not c!34697)) b!192469))

(assert (= (and d!56477 (not res!90943)) b!192470))

(declare-fun m!219391 () Bool)

(assert (=> d!56477 m!219391))

(declare-fun m!219393 () Bool)

(assert (=> b!192468 m!219393))

(declare-fun m!219395 () Bool)

(assert (=> b!192468 m!219395))

(assert (=> b!192468 m!219395))

(declare-fun m!219397 () Bool)

(assert (=> b!192468 m!219397))

(assert (=> b!192470 m!219395))

(assert (=> b!192470 m!219395))

(assert (=> b!192470 m!219397))

(assert (=> b!192299 d!56477))

(declare-fun d!56479 () Bool)

(declare-fun e!126642 () Bool)

(assert (=> d!56479 e!126642))

(declare-fun res!90944 () Bool)

(assert (=> d!56479 (=> (not res!90944) (not e!126642))))

(declare-fun lt!95742 () ListLongMap!2399)

(assert (=> d!56479 (= res!90944 (contains!1343 lt!95742 (_1!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95743 () List!2389)

(assert (=> d!56479 (= lt!95742 (ListLongMap!2400 lt!95743))))

(declare-fun lt!95745 () Unit!5797)

(declare-fun lt!95744 () Unit!5797)

(assert (=> d!56479 (= lt!95745 lt!95744)))

(assert (=> d!56479 (= (getValueByKey!241 lt!95743 (_1!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56479 (= lt!95744 (lemmaContainsTupThenGetReturnValue!128 lt!95743 (_1!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56479 (= lt!95743 (insertStrictlySorted!131 (toList!1215 lt!95616) (_1!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56479 (= (+!308 lt!95616 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))) lt!95742)))

(declare-fun b!192471 () Bool)

(declare-fun res!90945 () Bool)

(assert (=> b!192471 (=> (not res!90945) (not e!126642))))

(assert (=> b!192471 (= res!90945 (= (getValueByKey!241 (toList!1215 lt!95742) (_1!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192472 () Bool)

(assert (=> b!192472 (= e!126642 (contains!1346 (toList!1215 lt!95742) (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56479 res!90944) b!192471))

(assert (= (and b!192471 res!90945) b!192472))

(declare-fun m!219399 () Bool)

(assert (=> d!56479 m!219399))

(declare-fun m!219401 () Bool)

(assert (=> d!56479 m!219401))

(declare-fun m!219403 () Bool)

(assert (=> d!56479 m!219403))

(declare-fun m!219405 () Bool)

(assert (=> d!56479 m!219405))

(declare-fun m!219407 () Bool)

(assert (=> b!192471 m!219407))

(declare-fun m!219409 () Bool)

(assert (=> b!192472 m!219409))

(assert (=> b!192299 d!56479))

(declare-fun d!56481 () Bool)

(assert (=> d!56481 (= (apply!183 (+!308 lt!95616 (tuple2!3479 lt!95617 (zeroValue!3761 thiss!1248))) lt!95614) (apply!183 lt!95616 lt!95614))))

(declare-fun lt!95746 () Unit!5797)

(assert (=> d!56481 (= lt!95746 (choose!1054 lt!95616 lt!95617 (zeroValue!3761 thiss!1248) lt!95614))))

(declare-fun e!126643 () Bool)

(assert (=> d!56481 e!126643))

(declare-fun res!90946 () Bool)

(assert (=> d!56481 (=> (not res!90946) (not e!126643))))

(assert (=> d!56481 (= res!90946 (contains!1343 lt!95616 lt!95614))))

(assert (=> d!56481 (= (addApplyDifferent!159 lt!95616 lt!95617 (zeroValue!3761 thiss!1248) lt!95614) lt!95746)))

(declare-fun b!192473 () Bool)

(assert (=> b!192473 (= e!126643 (not (= lt!95614 lt!95617)))))

(assert (= (and d!56481 res!90946) b!192473))

(declare-fun m!219411 () Bool)

(assert (=> d!56481 m!219411))

(declare-fun m!219413 () Bool)

(assert (=> d!56481 m!219413))

(assert (=> d!56481 m!219125))

(assert (=> d!56481 m!219129))

(assert (=> d!56481 m!219125))

(assert (=> d!56481 m!219143))

(assert (=> b!192299 d!56481))

(declare-fun d!56483 () Bool)

(declare-fun e!126644 () Bool)

(assert (=> d!56483 e!126644))

(declare-fun res!90947 () Bool)

(assert (=> d!56483 (=> res!90947 e!126644)))

(declare-fun lt!95748 () Bool)

(assert (=> d!56483 (= res!90947 (not lt!95748))))

(declare-fun lt!95750 () Bool)

(assert (=> d!56483 (= lt!95748 lt!95750)))

(declare-fun lt!95749 () Unit!5797)

(declare-fun e!126645 () Unit!5797)

(assert (=> d!56483 (= lt!95749 e!126645)))

(declare-fun c!34698 () Bool)

(assert (=> d!56483 (= c!34698 lt!95750)))

(assert (=> d!56483 (= lt!95750 (containsKey!244 (toList!1215 lt!95627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56483 (= (contains!1343 lt!95627 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95748)))

(declare-fun b!192474 () Bool)

(declare-fun lt!95747 () Unit!5797)

(assert (=> b!192474 (= e!126645 lt!95747)))

(assert (=> b!192474 (= lt!95747 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192474 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192475 () Bool)

(declare-fun Unit!5809 () Unit!5797)

(assert (=> b!192475 (= e!126645 Unit!5809)))

(declare-fun b!192476 () Bool)

(assert (=> b!192476 (= e!126644 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95627) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56483 c!34698) b!192474))

(assert (= (and d!56483 (not c!34698)) b!192475))

(assert (= (and d!56483 (not res!90947)) b!192476))

(declare-fun m!219415 () Bool)

(assert (=> d!56483 m!219415))

(declare-fun m!219417 () Bool)

(assert (=> b!192474 m!219417))

(declare-fun m!219419 () Bool)

(assert (=> b!192474 m!219419))

(assert (=> b!192474 m!219419))

(declare-fun m!219421 () Bool)

(assert (=> b!192474 m!219421))

(assert (=> b!192476 m!219419))

(assert (=> b!192476 m!219419))

(assert (=> b!192476 m!219421))

(assert (=> bm!19399 d!56483))

(assert (=> b!192333 d!56443))

(declare-fun d!56485 () Bool)

(declare-fun e!126646 () Bool)

(assert (=> d!56485 e!126646))

(declare-fun res!90948 () Bool)

(assert (=> d!56485 (=> res!90948 e!126646)))

(declare-fun lt!95752 () Bool)

(assert (=> d!56485 (= res!90948 (not lt!95752))))

(declare-fun lt!95754 () Bool)

(assert (=> d!56485 (= lt!95752 lt!95754)))

(declare-fun lt!95753 () Unit!5797)

(declare-fun e!126647 () Unit!5797)

(assert (=> d!56485 (= lt!95753 e!126647)))

(declare-fun c!34699 () Bool)

(assert (=> d!56485 (= c!34699 lt!95754)))

(assert (=> d!56485 (= lt!95754 (containsKey!244 (toList!1215 lt!95661) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56485 (= (contains!1343 lt!95661 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95752)))

(declare-fun b!192477 () Bool)

(declare-fun lt!95751 () Unit!5797)

(assert (=> b!192477 (= e!126647 lt!95751)))

(assert (=> b!192477 (= lt!95751 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95661) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192477 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95661) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192478 () Bool)

(declare-fun Unit!5810 () Unit!5797)

(assert (=> b!192478 (= e!126647 Unit!5810)))

(declare-fun b!192479 () Bool)

(assert (=> b!192479 (= e!126646 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56485 c!34699) b!192477))

(assert (= (and d!56485 (not c!34699)) b!192478))

(assert (= (and d!56485 (not res!90948)) b!192479))

(declare-fun m!219423 () Bool)

(assert (=> d!56485 m!219423))

(declare-fun m!219425 () Bool)

(assert (=> b!192477 m!219425))

(assert (=> b!192477 m!219273))

(assert (=> b!192477 m!219273))

(declare-fun m!219427 () Bool)

(assert (=> b!192477 m!219427))

(assert (=> b!192479 m!219273))

(assert (=> b!192479 m!219273))

(assert (=> b!192479 m!219427))

(assert (=> bm!19404 d!56485))

(assert (=> d!56421 d!56415))

(assert (=> b!192304 d!56443))

(declare-fun b!192498 () Bool)

(declare-fun lt!95760 () SeekEntryResult!668)

(assert (=> b!192498 (and (bvsge (index!4844 lt!95760) #b00000000000000000000000000000000) (bvslt (index!4844 lt!95760) (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun res!90955 () Bool)

(assert (=> b!192498 (= res!90955 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4844 lt!95760)) key!828))))

(declare-fun e!126662 () Bool)

(assert (=> b!192498 (=> res!90955 e!126662)))

(declare-fun e!126660 () Bool)

(assert (=> b!192498 (= e!126660 e!126662)))

(declare-fun b!192499 () Bool)

(declare-fun e!126659 () Bool)

(assert (=> b!192499 (= e!126659 e!126660)))

(declare-fun res!90956 () Bool)

(assert (=> b!192499 (= res!90956 (and ((_ is Intermediate!668) lt!95760) (not (undefined!1480 lt!95760)) (bvslt (x!20566 lt!95760) #b01111111111111111111111111111110) (bvsge (x!20566 lt!95760) #b00000000000000000000000000000000) (bvsge (x!20566 lt!95760) #b00000000000000000000000000000000)))))

(assert (=> b!192499 (=> (not res!90956) (not e!126660))))

(declare-fun b!192500 () Bool)

(declare-fun e!126658 () SeekEntryResult!668)

(assert (=> b!192500 (= e!126658 (Intermediate!668 true (toIndex!0 key!828 (mask!9150 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192501 () Bool)

(declare-fun e!126661 () SeekEntryResult!668)

(assert (=> b!192501 (= e!126661 (Intermediate!668 false (toIndex!0 key!828 (mask!9150 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192502 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192502 (= e!126661 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9150 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9150 thiss!1248)) key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun d!56487 () Bool)

(assert (=> d!56487 e!126659))

(declare-fun c!34707 () Bool)

(assert (=> d!56487 (= c!34707 (and ((_ is Intermediate!668) lt!95760) (undefined!1480 lt!95760)))))

(assert (=> d!56487 (= lt!95760 e!126658)))

(declare-fun c!34706 () Bool)

(assert (=> d!56487 (= c!34706 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!95759 () (_ BitVec 64))

(assert (=> d!56487 (= lt!95759 (select (arr!3836 (_keys!5902 thiss!1248)) (toIndex!0 key!828 (mask!9150 thiss!1248))))))

(assert (=> d!56487 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9150 thiss!1248)) key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)) lt!95760)))

(declare-fun b!192503 () Bool)

(assert (=> b!192503 (= e!126658 e!126661)))

(declare-fun c!34708 () Bool)

(assert (=> b!192503 (= c!34708 (or (= lt!95759 key!828) (= (bvadd lt!95759 lt!95759) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192504 () Bool)

(assert (=> b!192504 (= e!126659 (bvsge (x!20566 lt!95760) #b01111111111111111111111111111110))))

(declare-fun b!192505 () Bool)

(assert (=> b!192505 (and (bvsge (index!4844 lt!95760) #b00000000000000000000000000000000) (bvslt (index!4844 lt!95760) (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> b!192505 (= e!126662 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4844 lt!95760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192506 () Bool)

(assert (=> b!192506 (and (bvsge (index!4844 lt!95760) #b00000000000000000000000000000000) (bvslt (index!4844 lt!95760) (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun res!90957 () Bool)

(assert (=> b!192506 (= res!90957 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4844 lt!95760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192506 (=> res!90957 e!126662)))

(assert (= (and d!56487 c!34706) b!192500))

(assert (= (and d!56487 (not c!34706)) b!192503))

(assert (= (and b!192503 c!34708) b!192501))

(assert (= (and b!192503 (not c!34708)) b!192502))

(assert (= (and d!56487 c!34707) b!192504))

(assert (= (and d!56487 (not c!34707)) b!192499))

(assert (= (and b!192499 res!90956) b!192498))

(assert (= (and b!192498 (not res!90955)) b!192506))

(assert (= (and b!192506 (not res!90957)) b!192505))

(declare-fun m!219429 () Bool)

(assert (=> b!192498 m!219429))

(assert (=> b!192502 m!219235))

(declare-fun m!219431 () Bool)

(assert (=> b!192502 m!219431))

(assert (=> b!192502 m!219431))

(declare-fun m!219433 () Bool)

(assert (=> b!192502 m!219433))

(assert (=> d!56487 m!219235))

(declare-fun m!219435 () Bool)

(assert (=> d!56487 m!219435))

(assert (=> d!56487 m!219001))

(assert (=> b!192505 m!219429))

(assert (=> b!192506 m!219429))

(assert (=> d!56425 d!56487))

(declare-fun d!56489 () Bool)

(declare-fun lt!95766 () (_ BitVec 32))

(declare-fun lt!95765 () (_ BitVec 32))

(assert (=> d!56489 (= lt!95766 (bvmul (bvxor lt!95765 (bvlshr lt!95765 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56489 (= lt!95765 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56489 (and (bvsge (mask!9150 thiss!1248) #b00000000000000000000000000000000) (let ((res!90958 (let ((h!3029 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20585 (bvmul (bvxor h!3029 (bvlshr h!3029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20585 (bvlshr x!20585 #b00000000000000000000000000001101)) (mask!9150 thiss!1248)))))) (and (bvslt res!90958 (bvadd (mask!9150 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90958 #b00000000000000000000000000000000))))))

(assert (=> d!56489 (= (toIndex!0 key!828 (mask!9150 thiss!1248)) (bvand (bvxor lt!95766 (bvlshr lt!95766 #b00000000000000000000000000001101)) (mask!9150 thiss!1248)))))

(assert (=> d!56425 d!56489))

(assert (=> d!56425 d!56415))

(declare-fun d!56491 () Bool)

(declare-fun e!126663 () Bool)

(assert (=> d!56491 e!126663))

(declare-fun res!90959 () Bool)

(assert (=> d!56491 (=> res!90959 e!126663)))

(declare-fun lt!95768 () Bool)

(assert (=> d!56491 (= res!90959 (not lt!95768))))

(declare-fun lt!95770 () Bool)

(assert (=> d!56491 (= lt!95768 lt!95770)))

(declare-fun lt!95769 () Unit!5797)

(declare-fun e!126664 () Unit!5797)

(assert (=> d!56491 (= lt!95769 e!126664)))

(declare-fun c!34709 () Bool)

(assert (=> d!56491 (= c!34709 lt!95770)))

(assert (=> d!56491 (= lt!95770 (containsKey!244 (toList!1215 lt!95627) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56491 (= (contains!1343 lt!95627 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) lt!95768)))

(declare-fun b!192507 () Bool)

(declare-fun lt!95767 () Unit!5797)

(assert (=> b!192507 (= e!126664 lt!95767)))

(assert (=> b!192507 (= lt!95767 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95627) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192507 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95627) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192508 () Bool)

(declare-fun Unit!5811 () Unit!5797)

(assert (=> b!192508 (= e!126664 Unit!5811)))

(declare-fun b!192509 () Bool)

(assert (=> b!192509 (= e!126663 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95627) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56491 c!34709) b!192507))

(assert (= (and d!56491 (not c!34709)) b!192508))

(assert (= (and d!56491 (not res!90959)) b!192509))

(assert (=> d!56491 m!219099))

(declare-fun m!219437 () Bool)

(assert (=> d!56491 m!219437))

(assert (=> b!192507 m!219099))

(declare-fun m!219439 () Bool)

(assert (=> b!192507 m!219439))

(assert (=> b!192507 m!219099))

(assert (=> b!192507 m!219263))

(assert (=> b!192507 m!219263))

(declare-fun m!219441 () Bool)

(assert (=> b!192507 m!219441))

(assert (=> b!192509 m!219099))

(assert (=> b!192509 m!219263))

(assert (=> b!192509 m!219263))

(assert (=> b!192509 m!219441))

(assert (=> b!192303 d!56491))

(assert (=> d!56417 d!56415))

(declare-fun d!56493 () Bool)

(declare-fun e!126665 () Bool)

(assert (=> d!56493 e!126665))

(declare-fun res!90960 () Bool)

(assert (=> d!56493 (=> res!90960 e!126665)))

(declare-fun lt!95772 () Bool)

(assert (=> d!56493 (= res!90960 (not lt!95772))))

(declare-fun lt!95774 () Bool)

(assert (=> d!56493 (= lt!95772 lt!95774)))

(declare-fun lt!95773 () Unit!5797)

(declare-fun e!126666 () Unit!5797)

(assert (=> d!56493 (= lt!95773 e!126666)))

(declare-fun c!34710 () Bool)

(assert (=> d!56493 (= c!34710 lt!95774)))

(assert (=> d!56493 (= lt!95774 (containsKey!244 (toList!1215 lt!95638) (_1!1750 (tuple2!3479 key!828 v!309))))))

(assert (=> d!56493 (= (contains!1343 lt!95638 (_1!1750 (tuple2!3479 key!828 v!309))) lt!95772)))

(declare-fun b!192510 () Bool)

(declare-fun lt!95771 () Unit!5797)

(assert (=> b!192510 (= e!126666 lt!95771)))

(assert (=> b!192510 (= lt!95771 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95638) (_1!1750 (tuple2!3479 key!828 v!309))))))

(assert (=> b!192510 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95638) (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun b!192511 () Bool)

(declare-fun Unit!5812 () Unit!5797)

(assert (=> b!192511 (= e!126666 Unit!5812)))

(declare-fun b!192512 () Bool)

(assert (=> b!192512 (= e!126665 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95638) (_1!1750 (tuple2!3479 key!828 v!309)))))))

(assert (= (and d!56493 c!34710) b!192510))

(assert (= (and d!56493 (not c!34710)) b!192511))

(assert (= (and d!56493 (not res!90960)) b!192512))

(declare-fun m!219443 () Bool)

(assert (=> d!56493 m!219443))

(declare-fun m!219445 () Bool)

(assert (=> b!192510 m!219445))

(assert (=> b!192510 m!219165))

(assert (=> b!192510 m!219165))

(declare-fun m!219447 () Bool)

(assert (=> b!192510 m!219447))

(assert (=> b!192512 m!219165))

(assert (=> b!192512 m!219165))

(assert (=> b!192512 m!219447))

(assert (=> d!56419 d!56493))

(declare-fun c!34715 () Bool)

(declare-fun d!56495 () Bool)

(assert (=> d!56495 (= c!34715 (and ((_ is Cons!2385) lt!95639) (= (_1!1750 (h!3025 lt!95639)) (_1!1750 (tuple2!3479 key!828 v!309)))))))

(declare-fun e!126671 () Option!247)

(assert (=> d!56495 (= (getValueByKey!241 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309))) e!126671)))

(declare-fun e!126672 () Option!247)

(declare-fun b!192523 () Bool)

(assert (=> b!192523 (= e!126672 (getValueByKey!241 (t!7297 lt!95639) (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun b!192522 () Bool)

(assert (=> b!192522 (= e!126671 e!126672)))

(declare-fun c!34716 () Bool)

(assert (=> b!192522 (= c!34716 (and ((_ is Cons!2385) lt!95639) (not (= (_1!1750 (h!3025 lt!95639)) (_1!1750 (tuple2!3479 key!828 v!309))))))))

(declare-fun b!192521 () Bool)

(assert (=> b!192521 (= e!126671 (Some!246 (_2!1750 (h!3025 lt!95639))))))

(declare-fun b!192524 () Bool)

(assert (=> b!192524 (= e!126672 None!245)))

(assert (= (and d!56495 c!34715) b!192521))

(assert (= (and d!56495 (not c!34715)) b!192522))

(assert (= (and b!192522 c!34716) b!192523))

(assert (= (and b!192522 (not c!34716)) b!192524))

(declare-fun m!219449 () Bool)

(assert (=> b!192523 m!219449))

(assert (=> d!56419 d!56495))

(declare-fun d!56497 () Bool)

(assert (=> d!56497 (= (getValueByKey!241 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309))) (Some!246 (_2!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun lt!95777 () Unit!5797)

(declare-fun choose!1056 (List!2389 (_ BitVec 64) V!5593) Unit!5797)

(assert (=> d!56497 (= lt!95777 (choose!1056 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun e!126675 () Bool)

(assert (=> d!56497 e!126675))

(declare-fun res!90965 () Bool)

(assert (=> d!56497 (=> (not res!90965) (not e!126675))))

(declare-fun isStrictlySorted!343 (List!2389) Bool)

(assert (=> d!56497 (= res!90965 (isStrictlySorted!343 lt!95639))))

(assert (=> d!56497 (= (lemmaContainsTupThenGetReturnValue!128 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))) lt!95777)))

(declare-fun b!192529 () Bool)

(declare-fun res!90966 () Bool)

(assert (=> b!192529 (=> (not res!90966) (not e!126675))))

(assert (=> b!192529 (= res!90966 (containsKey!244 lt!95639 (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun b!192530 () Bool)

(assert (=> b!192530 (= e!126675 (contains!1346 lt!95639 (tuple2!3479 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309)))))))

(assert (= (and d!56497 res!90965) b!192529))

(assert (= (and b!192529 res!90966) b!192530))

(assert (=> d!56497 m!219159))

(declare-fun m!219451 () Bool)

(assert (=> d!56497 m!219451))

(declare-fun m!219453 () Bool)

(assert (=> d!56497 m!219453))

(declare-fun m!219455 () Bool)

(assert (=> b!192529 m!219455))

(declare-fun m!219457 () Bool)

(assert (=> b!192530 m!219457))

(assert (=> d!56419 d!56497))

(declare-fun e!126690 () List!2389)

(declare-fun b!192551 () Bool)

(assert (=> b!192551 (= e!126690 (insertStrictlySorted!131 (t!7297 (toList!1215 lt!95513)) (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun c!34727 () Bool)

(declare-fun c!34725 () Bool)

(declare-fun b!192553 () Bool)

(assert (=> b!192553 (= e!126690 (ite c!34727 (t!7297 (toList!1215 lt!95513)) (ite c!34725 (Cons!2385 (h!3025 (toList!1215 lt!95513)) (t!7297 (toList!1215 lt!95513))) Nil!2386)))))

(declare-fun b!192554 () Bool)

(declare-fun e!126687 () List!2389)

(declare-fun e!126688 () List!2389)

(assert (=> b!192554 (= e!126687 e!126688)))

(assert (=> b!192554 (= c!34727 (and ((_ is Cons!2385) (toList!1215 lt!95513)) (= (_1!1750 (h!3025 (toList!1215 lt!95513))) (_1!1750 (tuple2!3479 key!828 v!309)))))))

(declare-fun b!192555 () Bool)

(declare-fun call!19425 () List!2389)

(assert (=> b!192555 (= e!126687 call!19425)))

(declare-fun bm!19420 () Bool)

(declare-fun call!19423 () List!2389)

(assert (=> bm!19420 (= call!19423 call!19425)))

(declare-fun b!192556 () Bool)

(declare-fun res!90971 () Bool)

(declare-fun e!126689 () Bool)

(assert (=> b!192556 (=> (not res!90971) (not e!126689))))

(declare-fun lt!95780 () List!2389)

(assert (=> b!192556 (= res!90971 (containsKey!244 lt!95780 (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun b!192557 () Bool)

(assert (=> b!192557 (= e!126689 (contains!1346 lt!95780 (tuple2!3479 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309)))))))

(declare-fun b!192558 () Bool)

(declare-fun e!126686 () List!2389)

(declare-fun call!19424 () List!2389)

(assert (=> b!192558 (= e!126686 call!19424)))

(declare-fun bm!19421 () Bool)

(assert (=> bm!19421 (= call!19424 call!19423)))

(declare-fun c!34728 () Bool)

(declare-fun bm!19422 () Bool)

(declare-fun $colon$colon!101 (List!2389 tuple2!3478) List!2389)

(assert (=> bm!19422 (= call!19425 ($colon$colon!101 e!126690 (ite c!34728 (h!3025 (toList!1215 lt!95513)) (tuple2!3479 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))))

(declare-fun c!34726 () Bool)

(assert (=> bm!19422 (= c!34726 c!34728)))

(declare-fun b!192552 () Bool)

(assert (=> b!192552 (= e!126688 call!19423)))

(declare-fun d!56499 () Bool)

(assert (=> d!56499 e!126689))

(declare-fun res!90972 () Bool)

(assert (=> d!56499 (=> (not res!90972) (not e!126689))))

(assert (=> d!56499 (= res!90972 (isStrictlySorted!343 lt!95780))))

(assert (=> d!56499 (= lt!95780 e!126687)))

(assert (=> d!56499 (= c!34728 (and ((_ is Cons!2385) (toList!1215 lt!95513)) (bvslt (_1!1750 (h!3025 (toList!1215 lt!95513))) (_1!1750 (tuple2!3479 key!828 v!309)))))))

(assert (=> d!56499 (isStrictlySorted!343 (toList!1215 lt!95513))))

(assert (=> d!56499 (= (insertStrictlySorted!131 (toList!1215 lt!95513) (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))) lt!95780)))

(declare-fun b!192559 () Bool)

(assert (=> b!192559 (= e!126686 call!19424)))

(declare-fun b!192560 () Bool)

(assert (=> b!192560 (= c!34725 (and ((_ is Cons!2385) (toList!1215 lt!95513)) (bvsgt (_1!1750 (h!3025 (toList!1215 lt!95513))) (_1!1750 (tuple2!3479 key!828 v!309)))))))

(assert (=> b!192560 (= e!126688 e!126686)))

(assert (= (and d!56499 c!34728) b!192555))

(assert (= (and d!56499 (not c!34728)) b!192554))

(assert (= (and b!192554 c!34727) b!192552))

(assert (= (and b!192554 (not c!34727)) b!192560))

(assert (= (and b!192560 c!34725) b!192559))

(assert (= (and b!192560 (not c!34725)) b!192558))

(assert (= (or b!192559 b!192558) bm!19421))

(assert (= (or b!192552 bm!19421) bm!19420))

(assert (= (or b!192555 bm!19420) bm!19422))

(assert (= (and bm!19422 c!34726) b!192551))

(assert (= (and bm!19422 (not c!34726)) b!192553))

(assert (= (and d!56499 res!90972) b!192556))

(assert (= (and b!192556 res!90971) b!192557))

(declare-fun m!219459 () Bool)

(assert (=> b!192557 m!219459))

(declare-fun m!219461 () Bool)

(assert (=> b!192551 m!219461))

(declare-fun m!219463 () Bool)

(assert (=> b!192556 m!219463))

(declare-fun m!219465 () Bool)

(assert (=> d!56499 m!219465))

(declare-fun m!219467 () Bool)

(assert (=> d!56499 m!219467))

(declare-fun m!219469 () Bool)

(assert (=> bm!19422 m!219469))

(assert (=> d!56419 d!56499))

(declare-fun d!56501 () Bool)

(declare-fun e!126691 () Bool)

(assert (=> d!56501 e!126691))

(declare-fun res!90973 () Bool)

(assert (=> d!56501 (=> (not res!90973) (not e!126691))))

(declare-fun lt!95781 () ListLongMap!2399)

(assert (=> d!56501 (= res!90973 (contains!1343 lt!95781 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95782 () List!2389)

(assert (=> d!56501 (= lt!95781 (ListLongMap!2400 lt!95782))))

(declare-fun lt!95784 () Unit!5797)

(declare-fun lt!95783 () Unit!5797)

(assert (=> d!56501 (= lt!95784 lt!95783)))

(assert (=> d!56501 (= (getValueByKey!241 lt!95782 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56501 (= lt!95783 (lemmaContainsTupThenGetReturnValue!128 lt!95782 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56501 (= lt!95782 (insertStrictlySorted!131 (toList!1215 call!19410) (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56501 (= (+!308 call!19410 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) lt!95781)))

(declare-fun b!192561 () Bool)

(declare-fun res!90974 () Bool)

(assert (=> b!192561 (=> (not res!90974) (not e!126691))))

(assert (=> b!192561 (= res!90974 (= (getValueByKey!241 (toList!1215 lt!95781) (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun b!192562 () Bool)

(assert (=> b!192562 (= e!126691 (contains!1346 (toList!1215 lt!95781) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(assert (= (and d!56501 res!90973) b!192561))

(assert (= (and b!192561 res!90974) b!192562))

(declare-fun m!219471 () Bool)

(assert (=> d!56501 m!219471))

(declare-fun m!219473 () Bool)

(assert (=> d!56501 m!219473))

(declare-fun m!219475 () Bool)

(assert (=> d!56501 m!219475))

(declare-fun m!219477 () Bool)

(assert (=> d!56501 m!219477))

(declare-fun m!219479 () Bool)

(assert (=> b!192561 m!219479))

(declare-fun m!219481 () Bool)

(assert (=> b!192562 m!219481))

(assert (=> b!192321 d!56501))

(declare-fun d!56503 () Bool)

(assert (=> d!56503 (= (apply!183 (+!308 lt!95656 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))) lt!95647) (get!2226 (getValueByKey!241 (toList!1215 (+!308 lt!95656 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))) lt!95647)))))

(declare-fun bs!7718 () Bool)

(assert (= bs!7718 d!56503))

(declare-fun m!219483 () Bool)

(assert (=> bs!7718 m!219483))

(assert (=> bs!7718 m!219483))

(declare-fun m!219485 () Bool)

(assert (=> bs!7718 m!219485))

(assert (=> b!192328 d!56503))

(assert (=> b!192328 d!56445))

(declare-fun d!56505 () Bool)

(declare-fun e!126692 () Bool)

(assert (=> d!56505 e!126692))

(declare-fun res!90975 () Bool)

(assert (=> d!56505 (=> (not res!90975) (not e!126692))))

(declare-fun lt!95785 () ListLongMap!2399)

(assert (=> d!56505 (= res!90975 (contains!1343 lt!95785 (_1!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95786 () List!2389)

(assert (=> d!56505 (= lt!95785 (ListLongMap!2400 lt!95786))))

(declare-fun lt!95788 () Unit!5797)

(declare-fun lt!95787 () Unit!5797)

(assert (=> d!56505 (= lt!95788 lt!95787)))

(assert (=> d!56505 (= (getValueByKey!241 lt!95786 (_1!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56505 (= lt!95787 (lemmaContainsTupThenGetReturnValue!128 lt!95786 (_1!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56505 (= lt!95786 (insertStrictlySorted!131 (toList!1215 lt!95650) (_1!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56505 (= (+!308 lt!95650 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))) lt!95785)))

(declare-fun b!192563 () Bool)

(declare-fun res!90976 () Bool)

(assert (=> b!192563 (=> (not res!90976) (not e!126692))))

(assert (=> b!192563 (= res!90976 (= (getValueByKey!241 (toList!1215 lt!95785) (_1!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192564 () Bool)

(assert (=> b!192564 (= e!126692 (contains!1346 (toList!1215 lt!95785) (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56505 res!90975) b!192563))

(assert (= (and b!192563 res!90976) b!192564))

(declare-fun m!219487 () Bool)

(assert (=> d!56505 m!219487))

(declare-fun m!219489 () Bool)

(assert (=> d!56505 m!219489))

(declare-fun m!219491 () Bool)

(assert (=> d!56505 m!219491))

(declare-fun m!219493 () Bool)

(assert (=> d!56505 m!219493))

(declare-fun m!219495 () Bool)

(assert (=> b!192563 m!219495))

(declare-fun m!219497 () Bool)

(assert (=> b!192564 m!219497))

(assert (=> b!192328 d!56505))

(declare-fun d!56507 () Bool)

(assert (=> d!56507 (= (apply!183 lt!95656 lt!95647) (get!2226 (getValueByKey!241 (toList!1215 lt!95656) lt!95647)))))

(declare-fun bs!7719 () Bool)

(assert (= bs!7719 d!56507))

(declare-fun m!219499 () Bool)

(assert (=> bs!7719 m!219499))

(assert (=> bs!7719 m!219499))

(declare-fun m!219501 () Bool)

(assert (=> bs!7719 m!219501))

(assert (=> b!192328 d!56507))

(declare-fun d!56509 () Bool)

(assert (=> d!56509 (= (apply!183 (+!308 lt!95652 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))) lt!95660) (apply!183 lt!95652 lt!95660))))

(declare-fun lt!95789 () Unit!5797)

(assert (=> d!56509 (= lt!95789 (choose!1054 lt!95652 lt!95649 (minValue!3761 thiss!1248) lt!95660))))

(declare-fun e!126693 () Bool)

(assert (=> d!56509 e!126693))

(declare-fun res!90977 () Bool)

(assert (=> d!56509 (=> (not res!90977) (not e!126693))))

(assert (=> d!56509 (= res!90977 (contains!1343 lt!95652 lt!95660))))

(assert (=> d!56509 (= (addApplyDifferent!159 lt!95652 lt!95649 (minValue!3761 thiss!1248) lt!95660) lt!95789)))

(declare-fun b!192565 () Bool)

(assert (=> b!192565 (= e!126693 (not (= lt!95660 lt!95649)))))

(assert (= (and d!56509 res!90977) b!192565))

(declare-fun m!219503 () Bool)

(assert (=> d!56509 m!219503))

(declare-fun m!219505 () Bool)

(assert (=> d!56509 m!219505))

(assert (=> d!56509 m!219179))

(assert (=> d!56509 m!219189))

(assert (=> d!56509 m!219179))

(assert (=> d!56509 m!219181))

(assert (=> b!192328 d!56509))

(declare-fun d!56511 () Bool)

(assert (=> d!56511 (= (apply!183 lt!95650 lt!95648) (get!2226 (getValueByKey!241 (toList!1215 lt!95650) lt!95648)))))

(declare-fun bs!7720 () Bool)

(assert (= bs!7720 d!56511))

(declare-fun m!219507 () Bool)

(assert (=> bs!7720 m!219507))

(assert (=> bs!7720 m!219507))

(declare-fun m!219509 () Bool)

(assert (=> bs!7720 m!219509))

(assert (=> b!192328 d!56511))

(declare-fun d!56513 () Bool)

(assert (=> d!56513 (contains!1343 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))) lt!95657)))

(declare-fun lt!95790 () Unit!5797)

(assert (=> d!56513 (= lt!95790 (choose!1055 lt!95654 lt!95663 (zeroValue!3761 thiss!1248) lt!95657))))

(assert (=> d!56513 (contains!1343 lt!95654 lt!95657)))

(assert (=> d!56513 (= (addStillContains!159 lt!95654 lt!95663 (zeroValue!3761 thiss!1248) lt!95657) lt!95790)))

(declare-fun bs!7721 () Bool)

(assert (= bs!7721 d!56513))

(assert (=> bs!7721 m!219201))

(assert (=> bs!7721 m!219201))

(assert (=> bs!7721 m!219203))

(declare-fun m!219511 () Bool)

(assert (=> bs!7721 m!219511))

(declare-fun m!219513 () Bool)

(assert (=> bs!7721 m!219513))

(assert (=> b!192328 d!56513))

(declare-fun d!56515 () Bool)

(declare-fun e!126694 () Bool)

(assert (=> d!56515 e!126694))

(declare-fun res!90978 () Bool)

(assert (=> d!56515 (=> (not res!90978) (not e!126694))))

(declare-fun lt!95791 () ListLongMap!2399)

(assert (=> d!56515 (= res!90978 (contains!1343 lt!95791 (_1!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95792 () List!2389)

(assert (=> d!56515 (= lt!95791 (ListLongMap!2400 lt!95792))))

(declare-fun lt!95794 () Unit!5797)

(declare-fun lt!95793 () Unit!5797)

(assert (=> d!56515 (= lt!95794 lt!95793)))

(assert (=> d!56515 (= (getValueByKey!241 lt!95792 (_1!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56515 (= lt!95793 (lemmaContainsTupThenGetReturnValue!128 lt!95792 (_1!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56515 (= lt!95792 (insertStrictlySorted!131 (toList!1215 lt!95654) (_1!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56515 (= (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))) lt!95791)))

(declare-fun b!192566 () Bool)

(declare-fun res!90979 () Bool)

(assert (=> b!192566 (=> (not res!90979) (not e!126694))))

(assert (=> b!192566 (= res!90979 (= (getValueByKey!241 (toList!1215 lt!95791) (_1!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192567 () Bool)

(assert (=> b!192567 (= e!126694 (contains!1346 (toList!1215 lt!95791) (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56515 res!90978) b!192566))

(assert (= (and b!192566 res!90979) b!192567))

(declare-fun m!219515 () Bool)

(assert (=> d!56515 m!219515))

(declare-fun m!219517 () Bool)

(assert (=> d!56515 m!219517))

(declare-fun m!219519 () Bool)

(assert (=> d!56515 m!219519))

(declare-fun m!219521 () Bool)

(assert (=> d!56515 m!219521))

(declare-fun m!219523 () Bool)

(assert (=> b!192566 m!219523))

(declare-fun m!219525 () Bool)

(assert (=> b!192567 m!219525))

(assert (=> b!192328 d!56515))

(declare-fun d!56517 () Bool)

(assert (=> d!56517 (= (apply!183 (+!308 lt!95652 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))) lt!95660) (get!2226 (getValueByKey!241 (toList!1215 (+!308 lt!95652 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))) lt!95660)))))

(declare-fun bs!7722 () Bool)

(assert (= bs!7722 d!56517))

(declare-fun m!219527 () Bool)

(assert (=> bs!7722 m!219527))

(assert (=> bs!7722 m!219527))

(declare-fun m!219529 () Bool)

(assert (=> bs!7722 m!219529))

(assert (=> b!192328 d!56517))

(declare-fun d!56519 () Bool)

(assert (=> d!56519 (= (apply!183 lt!95652 lt!95660) (get!2226 (getValueByKey!241 (toList!1215 lt!95652) lt!95660)))))

(declare-fun bs!7723 () Bool)

(assert (= bs!7723 d!56519))

(declare-fun m!219531 () Bool)

(assert (=> bs!7723 m!219531))

(assert (=> bs!7723 m!219531))

(declare-fun m!219533 () Bool)

(assert (=> bs!7723 m!219533))

(assert (=> b!192328 d!56519))

(declare-fun d!56521 () Bool)

(declare-fun e!126695 () Bool)

(assert (=> d!56521 e!126695))

(declare-fun res!90980 () Bool)

(assert (=> d!56521 (=> res!90980 e!126695)))

(declare-fun lt!95796 () Bool)

(assert (=> d!56521 (= res!90980 (not lt!95796))))

(declare-fun lt!95798 () Bool)

(assert (=> d!56521 (= lt!95796 lt!95798)))

(declare-fun lt!95797 () Unit!5797)

(declare-fun e!126696 () Unit!5797)

(assert (=> d!56521 (= lt!95797 e!126696)))

(declare-fun c!34729 () Bool)

(assert (=> d!56521 (= c!34729 lt!95798)))

(assert (=> d!56521 (= lt!95798 (containsKey!244 (toList!1215 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))) lt!95657))))

(assert (=> d!56521 (= (contains!1343 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248))) lt!95657) lt!95796)))

(declare-fun b!192568 () Bool)

(declare-fun lt!95795 () Unit!5797)

(assert (=> b!192568 (= e!126696 lt!95795)))

(assert (=> b!192568 (= lt!95795 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))) lt!95657))))

(assert (=> b!192568 (isDefined!193 (getValueByKey!241 (toList!1215 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))) lt!95657))))

(declare-fun b!192569 () Bool)

(declare-fun Unit!5813 () Unit!5797)

(assert (=> b!192569 (= e!126696 Unit!5813)))

(declare-fun b!192570 () Bool)

(assert (=> b!192570 (= e!126695 (isDefined!193 (getValueByKey!241 (toList!1215 (+!308 lt!95654 (tuple2!3479 lt!95663 (zeroValue!3761 thiss!1248)))) lt!95657)))))

(assert (= (and d!56521 c!34729) b!192568))

(assert (= (and d!56521 (not c!34729)) b!192569))

(assert (= (and d!56521 (not res!90980)) b!192570))

(declare-fun m!219535 () Bool)

(assert (=> d!56521 m!219535))

(declare-fun m!219537 () Bool)

(assert (=> b!192568 m!219537))

(declare-fun m!219539 () Bool)

(assert (=> b!192568 m!219539))

(assert (=> b!192568 m!219539))

(declare-fun m!219541 () Bool)

(assert (=> b!192568 m!219541))

(assert (=> b!192570 m!219539))

(assert (=> b!192570 m!219539))

(assert (=> b!192570 m!219541))

(assert (=> b!192328 d!56521))

(declare-fun d!56523 () Bool)

(assert (=> d!56523 (= (apply!183 (+!308 lt!95656 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))) lt!95647) (apply!183 lt!95656 lt!95647))))

(declare-fun lt!95799 () Unit!5797)

(assert (=> d!56523 (= lt!95799 (choose!1054 lt!95656 lt!95642 (minValue!3761 thiss!1248) lt!95647))))

(declare-fun e!126697 () Bool)

(assert (=> d!56523 e!126697))

(declare-fun res!90981 () Bool)

(assert (=> d!56523 (=> (not res!90981) (not e!126697))))

(assert (=> d!56523 (= res!90981 (contains!1343 lt!95656 lt!95647))))

(assert (=> d!56523 (= (addApplyDifferent!159 lt!95656 lt!95642 (minValue!3761 thiss!1248) lt!95647) lt!95799)))

(declare-fun b!192571 () Bool)

(assert (=> b!192571 (= e!126697 (not (= lt!95647 lt!95642)))))

(assert (= (and d!56523 res!90981) b!192571))

(declare-fun m!219543 () Bool)

(assert (=> d!56523 m!219543))

(declare-fun m!219545 () Bool)

(assert (=> d!56523 m!219545))

(assert (=> d!56523 m!219183))

(assert (=> d!56523 m!219197))

(assert (=> d!56523 m!219183))

(assert (=> d!56523 m!219193))

(assert (=> b!192328 d!56523))

(declare-fun d!56525 () Bool)

(declare-fun e!126698 () Bool)

(assert (=> d!56525 e!126698))

(declare-fun res!90982 () Bool)

(assert (=> d!56525 (=> (not res!90982) (not e!126698))))

(declare-fun lt!95800 () ListLongMap!2399)

(assert (=> d!56525 (= res!90982 (contains!1343 lt!95800 (_1!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95801 () List!2389)

(assert (=> d!56525 (= lt!95800 (ListLongMap!2400 lt!95801))))

(declare-fun lt!95803 () Unit!5797)

(declare-fun lt!95802 () Unit!5797)

(assert (=> d!56525 (= lt!95803 lt!95802)))

(assert (=> d!56525 (= (getValueByKey!241 lt!95801 (_1!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))))))

(assert (=> d!56525 (= lt!95802 (lemmaContainsTupThenGetReturnValue!128 lt!95801 (_1!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))))))

(assert (=> d!56525 (= lt!95801 (insertStrictlySorted!131 (toList!1215 lt!95656) (_1!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))))))

(assert (=> d!56525 (= (+!308 lt!95656 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))) lt!95800)))

(declare-fun b!192572 () Bool)

(declare-fun res!90983 () Bool)

(assert (=> b!192572 (=> (not res!90983) (not e!126698))))

(assert (=> b!192572 (= res!90983 (= (getValueByKey!241 (toList!1215 lt!95800) (_1!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))))))))

(declare-fun b!192573 () Bool)

(assert (=> b!192573 (= e!126698 (contains!1346 (toList!1215 lt!95800) (tuple2!3479 lt!95642 (minValue!3761 thiss!1248))))))

(assert (= (and d!56525 res!90982) b!192572))

(assert (= (and b!192572 res!90983) b!192573))

(declare-fun m!219547 () Bool)

(assert (=> d!56525 m!219547))

(declare-fun m!219549 () Bool)

(assert (=> d!56525 m!219549))

(declare-fun m!219551 () Bool)

(assert (=> d!56525 m!219551))

(declare-fun m!219553 () Bool)

(assert (=> d!56525 m!219553))

(declare-fun m!219555 () Bool)

(assert (=> b!192572 m!219555))

(declare-fun m!219557 () Bool)

(assert (=> b!192573 m!219557))

(assert (=> b!192328 d!56525))

(declare-fun d!56527 () Bool)

(assert (=> d!56527 (= (apply!183 (+!308 lt!95650 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))) lt!95648) (apply!183 lt!95650 lt!95648))))

(declare-fun lt!95804 () Unit!5797)

(assert (=> d!56527 (= lt!95804 (choose!1054 lt!95650 lt!95651 (zeroValue!3761 thiss!1248) lt!95648))))

(declare-fun e!126699 () Bool)

(assert (=> d!56527 e!126699))

(declare-fun res!90984 () Bool)

(assert (=> d!56527 (=> (not res!90984) (not e!126699))))

(assert (=> d!56527 (= res!90984 (contains!1343 lt!95650 lt!95648))))

(assert (=> d!56527 (= (addApplyDifferent!159 lt!95650 lt!95651 (zeroValue!3761 thiss!1248) lt!95648) lt!95804)))

(declare-fun b!192574 () Bool)

(assert (=> b!192574 (= e!126699 (not (= lt!95648 lt!95651)))))

(assert (= (and d!56527 res!90984) b!192574))

(declare-fun m!219559 () Bool)

(assert (=> d!56527 m!219559))

(declare-fun m!219561 () Bool)

(assert (=> d!56527 m!219561))

(assert (=> d!56527 m!219191))

(assert (=> d!56527 m!219195))

(assert (=> d!56527 m!219191))

(assert (=> d!56527 m!219209))

(assert (=> b!192328 d!56527))

(declare-fun d!56529 () Bool)

(assert (=> d!56529 (= (apply!183 (+!308 lt!95650 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248))) lt!95648) (get!2226 (getValueByKey!241 (toList!1215 (+!308 lt!95650 (tuple2!3479 lt!95651 (zeroValue!3761 thiss!1248)))) lt!95648)))))

(declare-fun bs!7724 () Bool)

(assert (= bs!7724 d!56529))

(declare-fun m!219563 () Bool)

(assert (=> bs!7724 m!219563))

(assert (=> bs!7724 m!219563))

(declare-fun m!219565 () Bool)

(assert (=> bs!7724 m!219565))

(assert (=> b!192328 d!56529))

(declare-fun d!56531 () Bool)

(declare-fun e!126700 () Bool)

(assert (=> d!56531 e!126700))

(declare-fun res!90985 () Bool)

(assert (=> d!56531 (=> (not res!90985) (not e!126700))))

(declare-fun lt!95805 () ListLongMap!2399)

(assert (=> d!56531 (= res!90985 (contains!1343 lt!95805 (_1!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95806 () List!2389)

(assert (=> d!56531 (= lt!95805 (ListLongMap!2400 lt!95806))))

(declare-fun lt!95808 () Unit!5797)

(declare-fun lt!95807 () Unit!5797)

(assert (=> d!56531 (= lt!95808 lt!95807)))

(assert (=> d!56531 (= (getValueByKey!241 lt!95806 (_1!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))))))

(assert (=> d!56531 (= lt!95807 (lemmaContainsTupThenGetReturnValue!128 lt!95806 (_1!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))))))

(assert (=> d!56531 (= lt!95806 (insertStrictlySorted!131 (toList!1215 lt!95652) (_1!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))))))

(assert (=> d!56531 (= (+!308 lt!95652 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))) lt!95805)))

(declare-fun b!192575 () Bool)

(declare-fun res!90986 () Bool)

(assert (=> b!192575 (=> (not res!90986) (not e!126700))))

(assert (=> b!192575 (= res!90986 (= (getValueByKey!241 (toList!1215 lt!95805) (_1!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))))))))

(declare-fun b!192576 () Bool)

(assert (=> b!192576 (= e!126700 (contains!1346 (toList!1215 lt!95805) (tuple2!3479 lt!95649 (minValue!3761 thiss!1248))))))

(assert (= (and d!56531 res!90985) b!192575))

(assert (= (and b!192575 res!90986) b!192576))

(declare-fun m!219567 () Bool)

(assert (=> d!56531 m!219567))

(declare-fun m!219569 () Bool)

(assert (=> d!56531 m!219569))

(declare-fun m!219571 () Bool)

(assert (=> d!56531 m!219571))

(declare-fun m!219573 () Bool)

(assert (=> d!56531 m!219573))

(declare-fun m!219575 () Bool)

(assert (=> b!192575 m!219575))

(declare-fun m!219577 () Bool)

(assert (=> b!192576 m!219577))

(assert (=> b!192328 d!56531))

(declare-fun b!192586 () Bool)

(declare-fun e!126705 () (_ BitVec 32))

(assert (=> b!192586 (= e!126705 #b00000000000000000000000000000000)))

(declare-fun b!192587 () Bool)

(declare-fun e!126706 () (_ BitVec 32))

(declare-fun call!19428 () (_ BitVec 32))

(assert (=> b!192587 (= e!126706 call!19428)))

(declare-fun b!192588 () Bool)

(assert (=> b!192588 (= e!126705 e!126706)))

(declare-fun c!34734 () Bool)

(assert (=> b!192588 (= c!34734 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19425 () Bool)

(assert (=> bm!19425 (= call!19428 (arrayCountValidKeys!0 (_keys!5902 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4159 (_keys!5902 thiss!1248))))))

(declare-fun d!56533 () Bool)

(declare-fun lt!95811 () (_ BitVec 32))

(assert (=> d!56533 (and (bvsge lt!95811 #b00000000000000000000000000000000) (bvsle lt!95811 (bvsub (size!4159 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56533 (= lt!95811 e!126705)))

(declare-fun c!34735 () Bool)

(assert (=> d!56533 (= c!34735 (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56533 (and (bvsle #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4159 (_keys!5902 thiss!1248)) (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56533 (= (arrayCountValidKeys!0 (_keys!5902 thiss!1248) #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))) lt!95811)))

(declare-fun b!192585 () Bool)

(assert (=> b!192585 (= e!126706 (bvadd #b00000000000000000000000000000001 call!19428))))

(assert (= (and d!56533 c!34735) b!192586))

(assert (= (and d!56533 (not c!34735)) b!192588))

(assert (= (and b!192588 c!34734) b!192585))

(assert (= (and b!192588 (not c!34734)) b!192587))

(assert (= (or b!192585 b!192587) bm!19425))

(assert (=> b!192588 m!219099))

(assert (=> b!192588 m!219099))

(assert (=> b!192588 m!219101))

(declare-fun m!219579 () Bool)

(assert (=> bm!19425 m!219579))

(assert (=> b!192379 d!56533))

(declare-fun d!56535 () Bool)

(declare-fun e!126707 () Bool)

(assert (=> d!56535 e!126707))

(declare-fun res!90987 () Bool)

(assert (=> d!56535 (=> res!90987 e!126707)))

(declare-fun lt!95813 () Bool)

(assert (=> d!56535 (= res!90987 (not lt!95813))))

(declare-fun lt!95815 () Bool)

(assert (=> d!56535 (= lt!95813 lt!95815)))

(declare-fun lt!95814 () Unit!5797)

(declare-fun e!126708 () Unit!5797)

(assert (=> d!56535 (= lt!95814 e!126708)))

(declare-fun c!34736 () Bool)

(assert (=> d!56535 (= c!34736 lt!95815)))

(assert (=> d!56535 (= lt!95815 (containsKey!244 (toList!1215 lt!95661) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56535 (= (contains!1343 lt!95661 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95813)))

(declare-fun b!192589 () Bool)

(declare-fun lt!95812 () Unit!5797)

(assert (=> b!192589 (= e!126708 lt!95812)))

(assert (=> b!192589 (= lt!95812 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95661) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192589 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95661) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192590 () Bool)

(declare-fun Unit!5814 () Unit!5797)

(assert (=> b!192590 (= e!126708 Unit!5814)))

(declare-fun b!192591 () Bool)

(assert (=> b!192591 (= e!126707 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56535 c!34736) b!192589))

(assert (= (and d!56535 (not c!34736)) b!192590))

(assert (= (and d!56535 (not res!90987)) b!192591))

(declare-fun m!219581 () Bool)

(assert (=> d!56535 m!219581))

(declare-fun m!219583 () Bool)

(assert (=> b!192589 m!219583))

(assert (=> b!192589 m!219259))

(assert (=> b!192589 m!219259))

(declare-fun m!219585 () Bool)

(assert (=> b!192589 m!219585))

(assert (=> b!192591 m!219259))

(assert (=> b!192591 m!219259))

(assert (=> b!192591 m!219585))

(assert (=> bm!19406 d!56535))

(declare-fun d!56537 () Bool)

(declare-fun res!90992 () Bool)

(declare-fun e!126717 () Bool)

(assert (=> d!56537 (=> res!90992 e!126717)))

(assert (=> d!56537 (= res!90992 (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)) e!126717)))

(declare-fun b!192600 () Bool)

(declare-fun e!126715 () Bool)

(declare-fun e!126716 () Bool)

(assert (=> b!192600 (= e!126715 e!126716)))

(declare-fun lt!95822 () (_ BitVec 64))

(assert (=> b!192600 (= lt!95822 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95823 () Unit!5797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8145 (_ BitVec 64) (_ BitVec 32)) Unit!5797)

(assert (=> b!192600 (= lt!95823 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5902 thiss!1248) lt!95822 #b00000000000000000000000000000000))))

(assert (=> b!192600 (arrayContainsKey!0 (_keys!5902 thiss!1248) lt!95822 #b00000000000000000000000000000000)))

(declare-fun lt!95824 () Unit!5797)

(assert (=> b!192600 (= lt!95824 lt!95823)))

(declare-fun res!90993 () Bool)

(assert (=> b!192600 (= res!90993 (= (seekEntryOrOpen!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) (_keys!5902 thiss!1248) (mask!9150 thiss!1248)) (Found!668 #b00000000000000000000000000000000)))))

(assert (=> b!192600 (=> (not res!90993) (not e!126716))))

(declare-fun b!192601 () Bool)

(declare-fun call!19431 () Bool)

(assert (=> b!192601 (= e!126715 call!19431)))

(declare-fun bm!19428 () Bool)

(assert (=> bm!19428 (= call!19431 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun b!192602 () Bool)

(assert (=> b!192602 (= e!126717 e!126715)))

(declare-fun c!34739 () Bool)

(assert (=> b!192602 (= c!34739 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192603 () Bool)

(assert (=> b!192603 (= e!126716 call!19431)))

(assert (= (and d!56537 (not res!90992)) b!192602))

(assert (= (and b!192602 c!34739) b!192600))

(assert (= (and b!192602 (not c!34739)) b!192601))

(assert (= (and b!192600 res!90993) b!192603))

(assert (= (or b!192603 b!192601) bm!19428))

(assert (=> b!192600 m!219099))

(declare-fun m!219587 () Bool)

(assert (=> b!192600 m!219587))

(declare-fun m!219589 () Bool)

(assert (=> b!192600 m!219589))

(assert (=> b!192600 m!219099))

(declare-fun m!219591 () Bool)

(assert (=> b!192600 m!219591))

(declare-fun m!219593 () Bool)

(assert (=> bm!19428 m!219593))

(assert (=> b!192602 m!219099))

(assert (=> b!192602 m!219099))

(assert (=> b!192602 m!219101))

(assert (=> b!192380 d!56537))

(declare-fun d!56539 () Bool)

(declare-fun c!34740 () Bool)

(assert (=> d!56539 (= c!34740 (and ((_ is Cons!2385) (toList!1215 lt!95638)) (= (_1!1750 (h!3025 (toList!1215 lt!95638))) (_1!1750 (tuple2!3479 key!828 v!309)))))))

(declare-fun e!126718 () Option!247)

(assert (=> d!56539 (= (getValueByKey!241 (toList!1215 lt!95638) (_1!1750 (tuple2!3479 key!828 v!309))) e!126718)))

(declare-fun e!126719 () Option!247)

(declare-fun b!192606 () Bool)

(assert (=> b!192606 (= e!126719 (getValueByKey!241 (t!7297 (toList!1215 lt!95638)) (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun b!192605 () Bool)

(assert (=> b!192605 (= e!126718 e!126719)))

(declare-fun c!34741 () Bool)

(assert (=> b!192605 (= c!34741 (and ((_ is Cons!2385) (toList!1215 lt!95638)) (not (= (_1!1750 (h!3025 (toList!1215 lt!95638))) (_1!1750 (tuple2!3479 key!828 v!309))))))))

(declare-fun b!192604 () Bool)

(assert (=> b!192604 (= e!126718 (Some!246 (_2!1750 (h!3025 (toList!1215 lt!95638)))))))

(declare-fun b!192607 () Bool)

(assert (=> b!192607 (= e!126719 None!245)))

(assert (= (and d!56539 c!34740) b!192604))

(assert (= (and d!56539 (not c!34740)) b!192605))

(assert (= (and b!192605 c!34741) b!192606))

(assert (= (and b!192605 (not c!34741)) b!192607))

(declare-fun m!219595 () Bool)

(assert (=> b!192606 m!219595))

(assert (=> b!192317 d!56539))

(declare-fun d!56541 () Bool)

(assert (=> d!56541 (= (+!308 (getCurrentListMap!867 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) (tuple2!3479 key!828 v!309)) (getCurrentListMap!867 (_keys!5902 thiss!1248) (array!8148 (store (arr!3837 (_values!3903 thiss!1248)) (index!4843 lt!95517) (ValueCellFull!1886 v!309)) (size!4160 (_values!3903 thiss!1248))) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56541 true))

(declare-fun _$5!155 () Unit!5797)

(assert (=> d!56541 (= (choose!1052 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4843 lt!95517) key!828 v!309 (defaultEntry!3920 thiss!1248)) _$5!155)))

(declare-fun bs!7725 () Bool)

(assert (= bs!7725 d!56541))

(assert (=> bs!7725 m!218989))

(assert (=> bs!7725 m!218989))

(assert (=> bs!7725 m!219097))

(assert (=> bs!7725 m!218991))

(assert (=> bs!7725 m!218997))

(assert (=> d!56413 d!56541))

(assert (=> d!56413 d!56415))

(declare-fun b!192616 () Bool)

(declare-fun res!91003 () Bool)

(declare-fun e!126722 () Bool)

(assert (=> b!192616 (=> (not res!91003) (not e!126722))))

(assert (=> b!192616 (= res!91003 (and (= (size!4160 (_values!3903 thiss!1248)) (bvadd (mask!9150 thiss!1248) #b00000000000000000000000000000001)) (= (size!4159 (_keys!5902 thiss!1248)) (size!4160 (_values!3903 thiss!1248))) (bvsge (_size!1389 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1389 thiss!1248) (bvadd (mask!9150 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!192617 () Bool)

(declare-fun res!91004 () Bool)

(assert (=> b!192617 (=> (not res!91004) (not e!126722))))

(declare-fun size!4165 (LongMapFixedSize!2680) (_ BitVec 32))

(assert (=> b!192617 (= res!91004 (bvsge (size!4165 thiss!1248) (_size!1389 thiss!1248)))))

(declare-fun b!192618 () Bool)

(declare-fun res!91002 () Bool)

(assert (=> b!192618 (=> (not res!91002) (not e!126722))))

(assert (=> b!192618 (= res!91002 (= (size!4165 thiss!1248) (bvadd (_size!1389 thiss!1248) (bvsdiv (bvadd (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!56543 () Bool)

(declare-fun res!91005 () Bool)

(assert (=> d!56543 (=> (not res!91005) (not e!126722))))

(assert (=> d!56543 (= res!91005 (validMask!0 (mask!9150 thiss!1248)))))

(assert (=> d!56543 (= (simpleValid!199 thiss!1248) e!126722)))

(declare-fun b!192619 () Bool)

(assert (=> b!192619 (= e!126722 (and (bvsge (extraKeys!3657 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3657 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1389 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!56543 res!91005) b!192616))

(assert (= (and b!192616 res!91003) b!192617))

(assert (= (and b!192617 res!91004) b!192618))

(assert (= (and b!192618 res!91002) b!192619))

(declare-fun m!219597 () Bool)

(assert (=> b!192617 m!219597))

(assert (=> b!192618 m!219597))

(assert (=> d!56543 m!219001))

(assert (=> d!56431 d!56543))

(declare-fun d!56545 () Bool)

(declare-fun e!126723 () Bool)

(assert (=> d!56545 e!126723))

(declare-fun res!91006 () Bool)

(assert (=> d!56545 (=> (not res!91006) (not e!126723))))

(declare-fun lt!95825 () ListLongMap!2399)

(assert (=> d!56545 (= res!91006 (contains!1343 lt!95825 (_1!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun lt!95826 () List!2389)

(assert (=> d!56545 (= lt!95825 (ListLongMap!2400 lt!95826))))

(declare-fun lt!95828 () Unit!5797)

(declare-fun lt!95827 () Unit!5797)

(assert (=> d!56545 (= lt!95828 lt!95827)))

(assert (=> d!56545 (= (getValueByKey!241 lt!95826 (_1!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!246 (_2!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56545 (= lt!95827 (lemmaContainsTupThenGetReturnValue!128 lt!95826 (_1!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56545 (= lt!95826 (insertStrictlySorted!131 (toList!1215 (ite c!34660 call!19409 (ite c!34665 call!19412 call!19411))) (_1!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56545 (= (+!308 (ite c!34660 call!19409 (ite c!34665 call!19412 call!19411)) (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) lt!95825)))

(declare-fun b!192620 () Bool)

(declare-fun res!91007 () Bool)

(assert (=> b!192620 (=> (not res!91007) (not e!126723))))

(assert (=> b!192620 (= res!91007 (= (getValueByKey!241 (toList!1215 lt!95825) (_1!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!246 (_2!1750 (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))))

(declare-fun b!192621 () Bool)

(assert (=> b!192621 (= e!126723 (contains!1346 (toList!1215 lt!95825) (ite (or c!34660 c!34665) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (= (and d!56545 res!91006) b!192620))

(assert (= (and b!192620 res!91007) b!192621))

(declare-fun m!219599 () Bool)

(assert (=> d!56545 m!219599))

(declare-fun m!219601 () Bool)

(assert (=> d!56545 m!219601))

(declare-fun m!219603 () Bool)

(assert (=> d!56545 m!219603))

(declare-fun m!219605 () Bool)

(assert (=> d!56545 m!219605))

(declare-fun m!219607 () Bool)

(assert (=> b!192620 m!219607))

(declare-fun m!219609 () Bool)

(assert (=> b!192621 m!219609))

(assert (=> bm!19405 d!56545))

(declare-fun d!56547 () Bool)

(declare-fun e!126724 () Bool)

(assert (=> d!56547 e!126724))

(declare-fun res!91008 () Bool)

(assert (=> d!56547 (=> (not res!91008) (not e!126724))))

(declare-fun lt!95829 () ListLongMap!2399)

(assert (=> d!56547 (= res!91008 (contains!1343 lt!95829 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95830 () List!2389)

(assert (=> d!56547 (= lt!95829 (ListLongMap!2400 lt!95830))))

(declare-fun lt!95832 () Unit!5797)

(declare-fun lt!95831 () Unit!5797)

(assert (=> d!56547 (= lt!95832 lt!95831)))

(assert (=> d!56547 (= (getValueByKey!241 lt!95830 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56547 (= lt!95831 (lemmaContainsTupThenGetReturnValue!128 lt!95830 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56547 (= lt!95830 (insertStrictlySorted!131 (toList!1215 call!19403) (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56547 (= (+!308 call!19403 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) lt!95829)))

(declare-fun b!192622 () Bool)

(declare-fun res!91009 () Bool)

(assert (=> b!192622 (=> (not res!91009) (not e!126724))))

(assert (=> b!192622 (= res!91009 (= (getValueByKey!241 (toList!1215 lt!95829) (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!246 (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun b!192623 () Bool)

(assert (=> b!192623 (= e!126724 (contains!1346 (toList!1215 lt!95829) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(assert (= (and d!56547 res!91008) b!192622))

(assert (= (and b!192622 res!91009) b!192623))

(declare-fun m!219611 () Bool)

(assert (=> d!56547 m!219611))

(declare-fun m!219613 () Bool)

(assert (=> d!56547 m!219613))

(declare-fun m!219615 () Bool)

(assert (=> d!56547 m!219615))

(declare-fun m!219617 () Bool)

(assert (=> d!56547 m!219617))

(declare-fun m!219619 () Bool)

(assert (=> b!192622 m!219619))

(declare-fun m!219621 () Bool)

(assert (=> b!192623 m!219621))

(assert (=> b!192292 d!56547))

(declare-fun d!56549 () Bool)

(assert (=> d!56549 (= (apply!183 lt!95627 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2226 (getValueByKey!241 (toList!1215 lt!95627) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7726 () Bool)

(assert (= bs!7726 d!56549))

(assert (=> bs!7726 m!219419))

(assert (=> bs!7726 m!219419))

(declare-fun m!219623 () Bool)

(assert (=> bs!7726 m!219623))

(assert (=> b!192291 d!56549))

(assert (=> d!56427 d!56425))

(declare-fun d!56551 () Bool)

(declare-fun e!126727 () Bool)

(assert (=> d!56551 e!126727))

(declare-fun res!91014 () Bool)

(assert (=> d!56551 (=> (not res!91014) (not e!126727))))

(declare-fun lt!95835 () SeekEntryResult!668)

(assert (=> d!56551 (= res!91014 ((_ is Found!668) lt!95835))))

(assert (=> d!56551 (= lt!95835 (seekEntryOrOpen!0 key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(assert (=> d!56551 true))

(declare-fun _$33!147 () Unit!5797)

(assert (=> d!56551 (= (choose!1053 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) _$33!147)))

(declare-fun b!192628 () Bool)

(declare-fun res!91015 () Bool)

(assert (=> b!192628 (=> (not res!91015) (not e!126727))))

(assert (=> b!192628 (= res!91015 (inRange!0 (index!4843 lt!95835) (mask!9150 thiss!1248)))))

(declare-fun b!192629 () Bool)

(assert (=> b!192629 (= e!126727 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4843 lt!95835)) key!828))))

(assert (= (and d!56551 res!91014) b!192628))

(assert (= (and b!192628 res!91015) b!192629))

(assert (=> d!56551 m!219007))

(declare-fun m!219625 () Bool)

(assert (=> b!192628 m!219625))

(declare-fun m!219627 () Bool)

(assert (=> b!192629 m!219627))

(assert (=> d!56427 d!56551))

(assert (=> d!56427 d!56415))

(declare-fun d!56553 () Bool)

(assert (=> d!56553 (= (apply!183 lt!95627 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2226 (getValueByKey!241 (toList!1215 lt!95627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7727 () Bool)

(assert (= bs!7727 d!56553))

(declare-fun m!219629 () Bool)

(assert (=> bs!7727 m!219629))

(assert (=> bs!7727 m!219629))

(declare-fun m!219631 () Bool)

(assert (=> bs!7727 m!219631))

(assert (=> b!192308 d!56553))

(assert (=> b!192307 d!56443))

(assert (=> bm!19396 d!56455))

(declare-fun d!56555 () Bool)

(declare-fun e!126728 () Bool)

(assert (=> d!56555 e!126728))

(declare-fun res!91016 () Bool)

(assert (=> d!56555 (=> res!91016 e!126728)))

(declare-fun lt!95837 () Bool)

(assert (=> d!56555 (= res!91016 (not lt!95837))))

(declare-fun lt!95839 () Bool)

(assert (=> d!56555 (= lt!95837 lt!95839)))

(declare-fun lt!95838 () Unit!5797)

(declare-fun e!126729 () Unit!5797)

(assert (=> d!56555 (= lt!95838 e!126729)))

(declare-fun c!34742 () Bool)

(assert (=> d!56555 (= c!34742 lt!95839)))

(assert (=> d!56555 (= lt!95839 (containsKey!244 (toList!1215 lt!95661) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56555 (= (contains!1343 lt!95661 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) lt!95837)))

(declare-fun b!192630 () Bool)

(declare-fun lt!95836 () Unit!5797)

(assert (=> b!192630 (= e!126729 lt!95836)))

(assert (=> b!192630 (= lt!95836 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95661) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192630 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95661) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192631 () Bool)

(declare-fun Unit!5815 () Unit!5797)

(assert (=> b!192631 (= e!126729 Unit!5815)))

(declare-fun b!192632 () Bool)

(assert (=> b!192632 (= e!126728 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95661) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56555 c!34742) b!192630))

(assert (= (and d!56555 (not c!34742)) b!192631))

(assert (= (and d!56555 (not res!91016)) b!192632))

(assert (=> d!56555 m!219099))

(declare-fun m!219633 () Bool)

(assert (=> d!56555 m!219633))

(assert (=> b!192630 m!219099))

(declare-fun m!219635 () Bool)

(assert (=> b!192630 m!219635))

(assert (=> b!192630 m!219099))

(declare-fun m!219637 () Bool)

(assert (=> b!192630 m!219637))

(assert (=> b!192630 m!219637))

(declare-fun m!219639 () Bool)

(assert (=> b!192630 m!219639))

(assert (=> b!192632 m!219099))

(assert (=> b!192632 m!219637))

(assert (=> b!192632 m!219637))

(assert (=> b!192632 m!219639))

(assert (=> b!192332 d!56555))

(declare-fun d!56557 () Bool)

(assert (=> d!56557 (= (inRange!0 (index!4843 lt!95689) (mask!9150 thiss!1248)) (and (bvsge (index!4843 lt!95689) #b00000000000000000000000000000000) (bvslt (index!4843 lt!95689) (bvadd (mask!9150 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192371 d!56557))

(declare-fun d!56559 () Bool)

(declare-fun e!126730 () Bool)

(assert (=> d!56559 e!126730))

(declare-fun res!91017 () Bool)

(assert (=> d!56559 (=> (not res!91017) (not e!126730))))

(declare-fun lt!95840 () ListLongMap!2399)

(assert (=> d!56559 (= res!91017 (contains!1343 lt!95840 (_1!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun lt!95841 () List!2389)

(assert (=> d!56559 (= lt!95840 (ListLongMap!2400 lt!95841))))

(declare-fun lt!95843 () Unit!5797)

(declare-fun lt!95842 () Unit!5797)

(assert (=> d!56559 (= lt!95843 lt!95842)))

(assert (=> d!56559 (= (getValueByKey!241 lt!95841 (_1!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!246 (_2!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56559 (= lt!95842 (lemmaContainsTupThenGetReturnValue!128 lt!95841 (_1!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56559 (= lt!95841 (insertStrictlySorted!131 (toList!1215 (ite c!34654 call!19402 (ite c!34659 call!19405 call!19404))) (_1!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56559 (= (+!308 (ite c!34654 call!19402 (ite c!34659 call!19405 call!19404)) (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) lt!95840)))

(declare-fun b!192633 () Bool)

(declare-fun res!91018 () Bool)

(assert (=> b!192633 (=> (not res!91018) (not e!126730))))

(assert (=> b!192633 (= res!91018 (= (getValueByKey!241 (toList!1215 lt!95840) (_1!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!246 (_2!1750 (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))))

(declare-fun b!192634 () Bool)

(assert (=> b!192634 (= e!126730 (contains!1346 (toList!1215 lt!95840) (ite (or c!34654 c!34659) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (= (and d!56559 res!91017) b!192633))

(assert (= (and b!192633 res!91018) b!192634))

(declare-fun m!219641 () Bool)

(assert (=> d!56559 m!219641))

(declare-fun m!219643 () Bool)

(assert (=> d!56559 m!219643))

(declare-fun m!219645 () Bool)

(assert (=> d!56559 m!219645))

(declare-fun m!219647 () Bool)

(assert (=> d!56559 m!219647))

(declare-fun m!219649 () Bool)

(assert (=> b!192633 m!219649))

(declare-fun m!219651 () Bool)

(assert (=> b!192634 m!219651))

(assert (=> bm!19398 d!56559))

(declare-fun d!56561 () Bool)

(assert (=> d!56561 (= (apply!183 lt!95661 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)) (get!2226 (getValueByKey!241 (toList!1215 lt!95661) (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7728 () Bool)

(assert (= bs!7728 d!56561))

(assert (=> bs!7728 m!219099))

(assert (=> bs!7728 m!219637))

(assert (=> bs!7728 m!219637))

(declare-fun m!219653 () Bool)

(assert (=> bs!7728 m!219653))

(assert (=> b!192330 d!56561))

(declare-fun d!56563 () Bool)

(declare-fun c!34743 () Bool)

(assert (=> d!56563 (= c!34743 ((_ is ValueCellFull!1886) (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126731 () V!5593)

(assert (=> d!56563 (= (get!2225 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126731)))

(declare-fun b!192635 () Bool)

(assert (=> b!192635 (= e!126731 (get!2227 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192636 () Bool)

(assert (=> b!192636 (= e!126731 (get!2228 (select (arr!3837 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56563 c!34743) b!192635))

(assert (= (and d!56563 (not c!34743)) b!192636))

(assert (=> b!192635 m!219215))

(assert (=> b!192635 m!219149))

(declare-fun m!219655 () Bool)

(assert (=> b!192635 m!219655))

(assert (=> b!192636 m!219215))

(assert (=> b!192636 m!219149))

(declare-fun m!219657 () Bool)

(assert (=> b!192636 m!219657))

(assert (=> b!192330 d!56563))

(declare-fun d!56565 () Bool)

(declare-fun isEmpty!492 (Option!247) Bool)

(assert (=> d!56565 (= (isDefined!193 (getValueByKey!241 (toList!1215 lt!95513) key!828)) (not (isEmpty!492 (getValueByKey!241 (toList!1215 lt!95513) key!828))))))

(declare-fun bs!7729 () Bool)

(assert (= bs!7729 d!56565))

(assert (=> bs!7729 m!219225))

(declare-fun m!219659 () Bool)

(assert (=> bs!7729 m!219659))

(assert (=> b!192348 d!56565))

(declare-fun d!56567 () Bool)

(declare-fun c!34744 () Bool)

(assert (=> d!56567 (= c!34744 (and ((_ is Cons!2385) (toList!1215 lt!95513)) (= (_1!1750 (h!3025 (toList!1215 lt!95513))) key!828)))))

(declare-fun e!126732 () Option!247)

(assert (=> d!56567 (= (getValueByKey!241 (toList!1215 lt!95513) key!828) e!126732)))

(declare-fun b!192639 () Bool)

(declare-fun e!126733 () Option!247)

(assert (=> b!192639 (= e!126733 (getValueByKey!241 (t!7297 (toList!1215 lt!95513)) key!828))))

(declare-fun b!192638 () Bool)

(assert (=> b!192638 (= e!126732 e!126733)))

(declare-fun c!34745 () Bool)

(assert (=> b!192638 (= c!34745 (and ((_ is Cons!2385) (toList!1215 lt!95513)) (not (= (_1!1750 (h!3025 (toList!1215 lt!95513))) key!828))))))

(declare-fun b!192637 () Bool)

(assert (=> b!192637 (= e!126732 (Some!246 (_2!1750 (h!3025 (toList!1215 lt!95513)))))))

(declare-fun b!192640 () Bool)

(assert (=> b!192640 (= e!126733 None!245)))

(assert (= (and d!56567 c!34744) b!192637))

(assert (= (and d!56567 (not c!34744)) b!192638))

(assert (= (and b!192638 c!34745) b!192639))

(assert (= (and b!192638 (not c!34745)) b!192640))

(declare-fun m!219661 () Bool)

(assert (=> b!192639 m!219661))

(assert (=> b!192348 d!56567))

(declare-fun d!56569 () Bool)

(declare-fun e!126734 () Bool)

(assert (=> d!56569 e!126734))

(declare-fun res!91019 () Bool)

(assert (=> d!56569 (=> (not res!91019) (not e!126734))))

(declare-fun lt!95844 () ListLongMap!2399)

(assert (=> d!56569 (= res!91019 (contains!1343 lt!95844 (_1!1750 (tuple2!3479 key!828 v!309))))))

(declare-fun lt!95845 () List!2389)

(assert (=> d!56569 (= lt!95844 (ListLongMap!2400 lt!95845))))

(declare-fun lt!95847 () Unit!5797)

(declare-fun lt!95846 () Unit!5797)

(assert (=> d!56569 (= lt!95847 lt!95846)))

(assert (=> d!56569 (= (getValueByKey!241 lt!95845 (_1!1750 (tuple2!3479 key!828 v!309))) (Some!246 (_2!1750 (tuple2!3479 key!828 v!309))))))

(assert (=> d!56569 (= lt!95846 (lemmaContainsTupThenGetReturnValue!128 lt!95845 (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))

(assert (=> d!56569 (= lt!95845 (insertStrictlySorted!131 (toList!1215 (getCurrentListMap!867 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248))) (_1!1750 (tuple2!3479 key!828 v!309)) (_2!1750 (tuple2!3479 key!828 v!309))))))

(assert (=> d!56569 (= (+!308 (getCurrentListMap!867 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) (tuple2!3479 key!828 v!309)) lt!95844)))

(declare-fun b!192641 () Bool)

(declare-fun res!91020 () Bool)

(assert (=> b!192641 (=> (not res!91020) (not e!126734))))

(assert (=> b!192641 (= res!91020 (= (getValueByKey!241 (toList!1215 lt!95844) (_1!1750 (tuple2!3479 key!828 v!309))) (Some!246 (_2!1750 (tuple2!3479 key!828 v!309)))))))

(declare-fun b!192642 () Bool)

(assert (=> b!192642 (= e!126734 (contains!1346 (toList!1215 lt!95844) (tuple2!3479 key!828 v!309)))))

(assert (= (and d!56569 res!91019) b!192641))

(assert (= (and b!192641 res!91020) b!192642))

(declare-fun m!219663 () Bool)

(assert (=> d!56569 m!219663))

(declare-fun m!219665 () Bool)

(assert (=> d!56569 m!219665))

(declare-fun m!219667 () Bool)

(assert (=> d!56569 m!219667))

(declare-fun m!219669 () Bool)

(assert (=> d!56569 m!219669))

(declare-fun m!219671 () Bool)

(assert (=> b!192641 m!219671))

(declare-fun m!219673 () Bool)

(assert (=> b!192642 m!219673))

(assert (=> b!192247 d!56569))

(assert (=> b!192247 d!56421))

(assert (=> b!192247 d!56417))

(declare-fun d!56571 () Bool)

(assert (=> d!56571 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95513) key!828))))

(declare-fun lt!95850 () Unit!5797)

(declare-fun choose!1057 (List!2389 (_ BitVec 64)) Unit!5797)

(assert (=> d!56571 (= lt!95850 (choose!1057 (toList!1215 lt!95513) key!828))))

(declare-fun e!126737 () Bool)

(assert (=> d!56571 e!126737))

(declare-fun res!91023 () Bool)

(assert (=> d!56571 (=> (not res!91023) (not e!126737))))

(assert (=> d!56571 (= res!91023 (isStrictlySorted!343 (toList!1215 lt!95513)))))

(assert (=> d!56571 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95513) key!828) lt!95850)))

(declare-fun b!192645 () Bool)

(assert (=> b!192645 (= e!126737 (containsKey!244 (toList!1215 lt!95513) key!828))))

(assert (= (and d!56571 res!91023) b!192645))

(assert (=> d!56571 m!219225))

(assert (=> d!56571 m!219225))

(assert (=> d!56571 m!219227))

(declare-fun m!219675 () Bool)

(assert (=> d!56571 m!219675))

(assert (=> d!56571 m!219467))

(assert (=> b!192645 m!219221))

(assert (=> b!192346 d!56571))

(assert (=> b!192346 d!56565))

(assert (=> b!192346 d!56567))

(declare-fun b!192658 () Bool)

(declare-fun e!126744 () SeekEntryResult!668)

(assert (=> b!192658 (= e!126744 (MissingVacant!668 (index!4844 lt!95683)))))

(declare-fun b!192659 () Bool)

(assert (=> b!192659 (= e!126744 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20566 lt!95683) #b00000000000000000000000000000001) (nextIndex!0 (index!4844 lt!95683) (bvadd (x!20566 lt!95683) #b00000000000000000000000000000001) (mask!9150 thiss!1248)) (index!4844 lt!95683) key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(declare-fun b!192660 () Bool)

(declare-fun e!126746 () SeekEntryResult!668)

(assert (=> b!192660 (= e!126746 (Found!668 (index!4844 lt!95683)))))

(declare-fun b!192661 () Bool)

(declare-fun e!126745 () SeekEntryResult!668)

(assert (=> b!192661 (= e!126745 Undefined!668)))

(declare-fun d!56573 () Bool)

(declare-fun lt!95855 () SeekEntryResult!668)

(assert (=> d!56573 (and (or ((_ is Undefined!668) lt!95855) (not ((_ is Found!668) lt!95855)) (and (bvsge (index!4843 lt!95855) #b00000000000000000000000000000000) (bvslt (index!4843 lt!95855) (size!4159 (_keys!5902 thiss!1248))))) (or ((_ is Undefined!668) lt!95855) ((_ is Found!668) lt!95855) (not ((_ is MissingVacant!668) lt!95855)) (not (= (index!4845 lt!95855) (index!4844 lt!95683))) (and (bvsge (index!4845 lt!95855) #b00000000000000000000000000000000) (bvslt (index!4845 lt!95855) (size!4159 (_keys!5902 thiss!1248))))) (or ((_ is Undefined!668) lt!95855) (ite ((_ is Found!668) lt!95855) (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4843 lt!95855)) key!828) (and ((_ is MissingVacant!668) lt!95855) (= (index!4845 lt!95855) (index!4844 lt!95683)) (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4845 lt!95855)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56573 (= lt!95855 e!126745)))

(declare-fun c!34753 () Bool)

(assert (=> d!56573 (= c!34753 (bvsge (x!20566 lt!95683) #b01111111111111111111111111111110))))

(declare-fun lt!95856 () (_ BitVec 64))

(assert (=> d!56573 (= lt!95856 (select (arr!3836 (_keys!5902 thiss!1248)) (index!4844 lt!95683)))))

(assert (=> d!56573 (validMask!0 (mask!9150 thiss!1248))))

(assert (=> d!56573 (= (seekKeyOrZeroReturnVacant!0 (x!20566 lt!95683) (index!4844 lt!95683) (index!4844 lt!95683) key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)) lt!95855)))

(declare-fun b!192662 () Bool)

(assert (=> b!192662 (= e!126745 e!126746)))

(declare-fun c!34752 () Bool)

(assert (=> b!192662 (= c!34752 (= lt!95856 key!828))))

(declare-fun b!192663 () Bool)

(declare-fun c!34754 () Bool)

(assert (=> b!192663 (= c!34754 (= lt!95856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192663 (= e!126746 e!126744)))

(assert (= (and d!56573 c!34753) b!192661))

(assert (= (and d!56573 (not c!34753)) b!192662))

(assert (= (and b!192662 c!34752) b!192660))

(assert (= (and b!192662 (not c!34752)) b!192663))

(assert (= (and b!192663 c!34754) b!192658))

(assert (= (and b!192663 (not c!34754)) b!192659))

(declare-fun m!219677 () Bool)

(assert (=> b!192659 m!219677))

(assert (=> b!192659 m!219677))

(declare-fun m!219679 () Bool)

(assert (=> b!192659 m!219679))

(declare-fun m!219681 () Bool)

(assert (=> d!56573 m!219681))

(declare-fun m!219683 () Bool)

(assert (=> d!56573 m!219683))

(assert (=> d!56573 m!219239))

(assert (=> d!56573 m!219001))

(assert (=> b!192365 d!56573))

(declare-fun lt!95859 () Bool)

(declare-fun d!56575 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!155 (List!2389) (InoxSet tuple2!3478))

(assert (=> d!56575 (= lt!95859 (select (content!155 (toList!1215 lt!95638)) (tuple2!3479 key!828 v!309)))))

(declare-fun e!126752 () Bool)

(assert (=> d!56575 (= lt!95859 e!126752)))

(declare-fun res!91028 () Bool)

(assert (=> d!56575 (=> (not res!91028) (not e!126752))))

(assert (=> d!56575 (= res!91028 ((_ is Cons!2385) (toList!1215 lt!95638)))))

(assert (=> d!56575 (= (contains!1346 (toList!1215 lt!95638) (tuple2!3479 key!828 v!309)) lt!95859)))

(declare-fun b!192668 () Bool)

(declare-fun e!126751 () Bool)

(assert (=> b!192668 (= e!126752 e!126751)))

(declare-fun res!91029 () Bool)

(assert (=> b!192668 (=> res!91029 e!126751)))

(assert (=> b!192668 (= res!91029 (= (h!3025 (toList!1215 lt!95638)) (tuple2!3479 key!828 v!309)))))

(declare-fun b!192669 () Bool)

(assert (=> b!192669 (= e!126751 (contains!1346 (t!7297 (toList!1215 lt!95638)) (tuple2!3479 key!828 v!309)))))

(assert (= (and d!56575 res!91028) b!192668))

(assert (= (and b!192668 (not res!91029)) b!192669))

(declare-fun m!219685 () Bool)

(assert (=> d!56575 m!219685))

(declare-fun m!219687 () Bool)

(assert (=> d!56575 m!219687))

(declare-fun m!219689 () Bool)

(assert (=> b!192669 m!219689))

(assert (=> b!192318 d!56575))

(declare-fun d!56577 () Bool)

(declare-fun e!126753 () Bool)

(assert (=> d!56577 e!126753))

(declare-fun res!91030 () Bool)

(assert (=> d!56577 (=> res!91030 e!126753)))

(declare-fun lt!95861 () Bool)

(assert (=> d!56577 (= res!91030 (not lt!95861))))

(declare-fun lt!95863 () Bool)

(assert (=> d!56577 (= lt!95861 lt!95863)))

(declare-fun lt!95862 () Unit!5797)

(declare-fun e!126754 () Unit!5797)

(assert (=> d!56577 (= lt!95862 e!126754)))

(declare-fun c!34755 () Bool)

(assert (=> d!56577 (= c!34755 lt!95863)))

(assert (=> d!56577 (= lt!95863 (containsKey!244 (toList!1215 lt!95627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56577 (= (contains!1343 lt!95627 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95861)))

(declare-fun b!192670 () Bool)

(declare-fun lt!95860 () Unit!5797)

(assert (=> b!192670 (= e!126754 lt!95860)))

(assert (=> b!192670 (= lt!95860 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1215 lt!95627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192670 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192671 () Bool)

(declare-fun Unit!5816 () Unit!5797)

(assert (=> b!192671 (= e!126754 Unit!5816)))

(declare-fun b!192672 () Bool)

(assert (=> b!192672 (= e!126753 (isDefined!193 (getValueByKey!241 (toList!1215 lt!95627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56577 c!34755) b!192670))

(assert (= (and d!56577 (not c!34755)) b!192671))

(assert (= (and d!56577 (not res!91030)) b!192672))

(declare-fun m!219691 () Bool)

(assert (=> d!56577 m!219691))

(declare-fun m!219693 () Bool)

(assert (=> b!192670 m!219693))

(assert (=> b!192670 m!219629))

(assert (=> b!192670 m!219629))

(declare-fun m!219695 () Bool)

(assert (=> b!192670 m!219695))

(assert (=> b!192672 m!219629))

(assert (=> b!192672 m!219629))

(assert (=> b!192672 m!219695))

(assert (=> bm!19397 d!56577))

(assert (=> d!56407 d!56425))

(declare-fun lt!95866 () SeekEntryResult!668)

(declare-fun c!34760 () Bool)

(declare-fun call!19436 () Bool)

(declare-fun bm!19433 () Bool)

(assert (=> bm!19433 (= call!19436 (inRange!0 (ite c!34760 (index!4842 lt!95866) (index!4845 lt!95866)) (mask!9150 thiss!1248)))))

(declare-fun b!192689 () Bool)

(declare-fun e!126764 () Bool)

(declare-fun call!19437 () Bool)

(assert (=> b!192689 (= e!126764 (not call!19437))))

(declare-fun b!192690 () Bool)

(declare-fun e!126766 () Bool)

(assert (=> b!192690 (= e!126766 ((_ is Undefined!668) lt!95866))))

(declare-fun b!192691 () Bool)

(declare-fun res!91041 () Bool)

(assert (=> b!192691 (=> (not res!91041) (not e!126764))))

(assert (=> b!192691 (= res!91041 call!19436)))

(assert (=> b!192691 (= e!126766 e!126764)))

(declare-fun bm!19434 () Bool)

(assert (=> bm!19434 (= call!19437 (arrayContainsKey!0 (_keys!5902 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!192692 () Bool)

(declare-fun e!126765 () Bool)

(assert (=> b!192692 (= e!126765 (not call!19437))))

(declare-fun d!56579 () Bool)

(declare-fun e!126763 () Bool)

(assert (=> d!56579 e!126763))

(assert (=> d!56579 (= c!34760 ((_ is MissingZero!668) lt!95866))))

(assert (=> d!56579 (= lt!95866 (seekEntryOrOpen!0 key!828 (_keys!5902 thiss!1248) (mask!9150 thiss!1248)))))

(assert (=> d!56579 true))

(declare-fun _$34!1084 () Unit!5797)

(assert (=> d!56579 (= (choose!1051 (_keys!5902 thiss!1248) (_values!3903 thiss!1248) (mask!9150 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) _$34!1084)))

(declare-fun b!192693 () Bool)

(assert (=> b!192693 (= e!126763 e!126766)))

(declare-fun c!34761 () Bool)

(assert (=> b!192693 (= c!34761 ((_ is MissingVacant!668) lt!95866))))

(declare-fun b!192694 () Bool)

(assert (=> b!192694 (= e!126763 e!126765)))

(declare-fun res!91042 () Bool)

(assert (=> b!192694 (= res!91042 call!19436)))

(assert (=> b!192694 (=> (not res!91042) (not e!126765))))

(declare-fun b!192695 () Bool)

(declare-fun res!91039 () Bool)

(assert (=> b!192695 (= res!91039 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4842 lt!95866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192695 (=> (not res!91039) (not e!126765))))

(declare-fun b!192696 () Bool)

(declare-fun res!91040 () Bool)

(assert (=> b!192696 (=> (not res!91040) (not e!126764))))

(assert (=> b!192696 (= res!91040 (= (select (arr!3836 (_keys!5902 thiss!1248)) (index!4845 lt!95866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56579 c!34760) b!192694))

(assert (= (and d!56579 (not c!34760)) b!192693))

(assert (= (and b!192694 res!91042) b!192695))

(assert (= (and b!192695 res!91039) b!192692))

(assert (= (and b!192693 c!34761) b!192691))

(assert (= (and b!192693 (not c!34761)) b!192690))

(assert (= (and b!192691 res!91041) b!192696))

(assert (= (and b!192696 res!91040) b!192689))

(assert (= (or b!192694 b!192691) bm!19433))

(assert (= (or b!192692 b!192689) bm!19434))

(assert (=> d!56579 m!219007))

(declare-fun m!219697 () Bool)

(assert (=> b!192695 m!219697))

(declare-fun m!219699 () Bool)

(assert (=> b!192696 m!219699))

(declare-fun m!219701 () Bool)

(assert (=> bm!19433 m!219701))

(assert (=> bm!19434 m!219089))

(assert (=> d!56407 d!56579))

(assert (=> d!56407 d!56415))

(declare-fun b!192707 () Bool)

(declare-fun e!126775 () Bool)

(declare-fun call!19440 () Bool)

(assert (=> b!192707 (= e!126775 call!19440)))

(declare-fun b!192708 () Bool)

(declare-fun e!126777 () Bool)

(declare-fun e!126778 () Bool)

(assert (=> b!192708 (= e!126777 e!126778)))

(declare-fun res!91049 () Bool)

(assert (=> b!192708 (=> (not res!91049) (not e!126778))))

(declare-fun e!126776 () Bool)

(assert (=> b!192708 (= res!91049 (not e!126776))))

(declare-fun res!91050 () Bool)

(assert (=> b!192708 (=> (not res!91050) (not e!126776))))

(assert (=> b!192708 (= res!91050 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192709 () Bool)

(declare-fun contains!1347 (List!2392 (_ BitVec 64)) Bool)

(assert (=> b!192709 (= e!126776 (contains!1347 Nil!2389 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56581 () Bool)

(declare-fun res!91051 () Bool)

(assert (=> d!56581 (=> res!91051 e!126777)))

(assert (=> d!56581 (= res!91051 (bvsge #b00000000000000000000000000000000 (size!4159 (_keys!5902 thiss!1248))))))

(assert (=> d!56581 (= (arrayNoDuplicates!0 (_keys!5902 thiss!1248) #b00000000000000000000000000000000 Nil!2389) e!126777)))

(declare-fun bm!19437 () Bool)

(declare-fun c!34764 () Bool)

(assert (=> bm!19437 (= call!19440 (arrayNoDuplicates!0 (_keys!5902 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34764 (Cons!2388 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000) Nil!2389) Nil!2389)))))

(declare-fun b!192710 () Bool)

(assert (=> b!192710 (= e!126775 call!19440)))

(declare-fun b!192711 () Bool)

(assert (=> b!192711 (= e!126778 e!126775)))

(assert (=> b!192711 (= c!34764 (validKeyInArray!0 (select (arr!3836 (_keys!5902 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56581 (not res!91051)) b!192708))

(assert (= (and b!192708 res!91050) b!192709))

(assert (= (and b!192708 res!91049) b!192711))

(assert (= (and b!192711 c!34764) b!192707))

(assert (= (and b!192711 (not c!34764)) b!192710))

(assert (= (or b!192707 b!192710) bm!19437))

(assert (=> b!192708 m!219099))

(assert (=> b!192708 m!219099))

(assert (=> b!192708 m!219101))

(assert (=> b!192709 m!219099))

(assert (=> b!192709 m!219099))

(declare-fun m!219703 () Bool)

(assert (=> b!192709 m!219703))

(assert (=> bm!19437 m!219099))

(declare-fun m!219705 () Bool)

(assert (=> bm!19437 m!219705))

(assert (=> b!192711 m!219099))

(assert (=> b!192711 m!219099))

(assert (=> b!192711 m!219101))

(assert (=> b!192381 d!56581))

(declare-fun b!192712 () Bool)

(declare-fun e!126779 () Bool)

(assert (=> b!192712 (= e!126779 tp_is_empty!4459)))

(declare-fun b!192713 () Bool)

(declare-fun e!126780 () Bool)

(assert (=> b!192713 (= e!126780 tp_is_empty!4459)))

(declare-fun mapNonEmpty!7715 () Bool)

(declare-fun mapRes!7715 () Bool)

(declare-fun tp!16931 () Bool)

(assert (=> mapNonEmpty!7715 (= mapRes!7715 (and tp!16931 e!126779))))

(declare-fun mapValue!7715 () ValueCell!1886)

(declare-fun mapKey!7715 () (_ BitVec 32))

(declare-fun mapRest!7715 () (Array (_ BitVec 32) ValueCell!1886))

(assert (=> mapNonEmpty!7715 (= mapRest!7714 (store mapRest!7715 mapKey!7715 mapValue!7715))))

(declare-fun mapIsEmpty!7715 () Bool)

(assert (=> mapIsEmpty!7715 mapRes!7715))

(declare-fun condMapEmpty!7715 () Bool)

(declare-fun mapDefault!7715 () ValueCell!1886)

(assert (=> mapNonEmpty!7714 (= condMapEmpty!7715 (= mapRest!7714 ((as const (Array (_ BitVec 32) ValueCell!1886)) mapDefault!7715)))))

(assert (=> mapNonEmpty!7714 (= tp!16930 (and e!126780 mapRes!7715))))

(assert (= (and mapNonEmpty!7714 condMapEmpty!7715) mapIsEmpty!7715))

(assert (= (and mapNonEmpty!7714 (not condMapEmpty!7715)) mapNonEmpty!7715))

(assert (= (and mapNonEmpty!7715 ((_ is ValueCellFull!1886) mapValue!7715)) b!192712))

(assert (= (and mapNonEmpty!7714 ((_ is ValueCellFull!1886) mapDefault!7715)) b!192713))

(declare-fun m!219707 () Bool)

(assert (=> mapNonEmpty!7715 m!219707))

(declare-fun b_lambda!7461 () Bool)

(assert (= b_lambda!7453 (or (and b!192144 b_free!4687) b_lambda!7461)))

(declare-fun b_lambda!7463 () Bool)

(assert (= b_lambda!7459 (or (and b!192144 b_free!4687) b_lambda!7463)))

(declare-fun b_lambda!7465 () Bool)

(assert (= b_lambda!7457 (or (and b!192144 b_free!4687) b_lambda!7465)))

(declare-fun b_lambda!7467 () Bool)

(assert (= b_lambda!7455 (or (and b!192144 b_free!4687) b_lambda!7467)))

(check-sat (not d!56451) (not d!56477) (not b!192568) (not b!192672) (not d!56523) (not b!192434) (not b!192474) (not d!56569) (not b!192557) (not d!56529) (not b_lambda!7465) (not b!192433) (not b!192622) (not b_lambda!7451) (not b!192470) (not d!56479) (not b!192460) (not d!56511) (not d!56457) (not b!192659) (not b!192509) (not b!192437) (not b!192566) (not b!192572) (not d!56535) (not d!56543) (not d!56483) (not d!56453) (not b!192641) (not b_lambda!7461) (not b!192602) (not b!192436) (not d!56521) (not b!192642) (not b!192709) (not b!192459) (not d!56487) (not b!192448) (not d!56433) (not d!56545) (not b!192466) (not d!56513) (not b!192591) (not bm!19425) (not d!56507) (not d!56499) (not b!192512) (not b!192562) (not b!192502) (not b!192458) (not b!192570) (not b_lambda!7463) tp_is_empty!4459 (not b!192636) (not b!192463) (not d!56475) (not b!192457) (not b!192573) (not b!192455) (not b!192472) (not bm!19434) (not b!192618) (not b!192551) (not d!56555) (not b!192462) (not d!56519) (not d!56435) (not b!192589) (not b!192394) (not d!56571) (not d!56517) (not d!56473) (not b!192708) (not d!56467) (not bm!19413) (not d!56455) (not b!192620) (not b!192435) (not d!56531) b_and!11403 (not b!192576) (not b!192452) (not b!192465) (not b!192510) (not d!56561) (not d!56549) (not b!192426) (not b!192634) (not bm!19428) (not d!56559) (not b!192431) (not b!192450) (not b!192476) (not d!56497) (not bm!19422) (not d!56575) (not d!56485) (not bm!19437) (not d!56463) (not b!192479) (not b_lambda!7467) (not d!56547) (not d!56465) (not d!56493) (not d!56469) (not d!56491) (not b!192471) (not b!192670) (not b_next!4687) (not b!192564) (not d!56445) (not d!56509) (not b!192530) (not d!56505) (not d!56551) (not d!56471) (not b!192477) (not d!56481) (not d!56553) (not b!192588) (not b!192628) (not d!56441) (not b!192630) (not b!192606) (not mapNonEmpty!7715) (not d!56461) (not b!192567) (not b!192617) (not b!192632) (not d!56565) (not d!56501) (not b!192563) (not b!192645) (not b!192556) (not b!192428) (not b!192507) (not d!56515) (not b!192461) (not b!192529) (not b!192669) (not b!192401) (not d!56459) (not d!56503) (not d!56577) (not b!192711) (not b_lambda!7449) (not b!192621) (not d!56525) (not d!56573) (not b!192443) (not b!192633) (not b!192635) (not b!192575) (not bm!19412) (not d!56579) (not b!192623) (not bm!19433) (not b!192523) (not b!192449) (not d!56527) (not b!192639) (not b!192468) (not b!192561) (not b!192600) (not d!56541) (not b!192395))
(check-sat b_and!11403 (not b_next!4687))
