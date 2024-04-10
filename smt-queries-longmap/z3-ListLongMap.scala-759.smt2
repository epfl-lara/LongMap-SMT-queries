; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17806 () Bool)

(assert start!17806)

(declare-fun b!177829 () Bool)

(declare-fun b_free!4395 () Bool)

(declare-fun b_next!4395 () Bool)

(assert (=> b!177829 (= b_free!4395 (not b_next!4395))))

(declare-fun tp!15891 () Bool)

(declare-fun b_and!10903 () Bool)

(assert (=> b!177829 (= tp!15891 b_and!10903)))

(declare-fun b!177828 () Bool)

(declare-fun e!117247 () Bool)

(declare-fun e!117246 () Bool)

(declare-fun mapRes!7120 () Bool)

(assert (=> b!177828 (= e!117247 (and e!117246 mapRes!7120))))

(declare-fun condMapEmpty!7120 () Bool)

(declare-datatypes ((V!5203 0))(
  ( (V!5204 (val!2128 Int)) )
))
(declare-datatypes ((ValueCell!1740 0))(
  ( (ValueCellFull!1740 (v!4010 V!5203)) (EmptyCell!1740) )
))
(declare-datatypes ((array!7489 0))(
  ( (array!7490 (arr!3551 (Array (_ BitVec 32) (_ BitVec 64))) (size!3856 (_ BitVec 32))) )
))
(declare-datatypes ((array!7491 0))(
  ( (array!7492 (arr!3552 (Array (_ BitVec 32) ValueCell!1740)) (size!3857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2388 0))(
  ( (LongMapFixedSize!2389 (defaultEntry!3660 Int) (mask!8608 (_ BitVec 32)) (extraKeys!3397 (_ BitVec 32)) (zeroValue!3501 V!5203) (minValue!3501 V!5203) (_size!1243 (_ BitVec 32)) (_keys!5532 array!7489) (_values!3643 array!7491) (_vacant!1243 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2388)

(declare-fun mapDefault!7120 () ValueCell!1740)

(assert (=> b!177828 (= condMapEmpty!7120 (= (arr!3552 (_values!3643 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1740)) mapDefault!7120)))))

(declare-fun mapIsEmpty!7120 () Bool)

(assert (=> mapIsEmpty!7120 mapRes!7120))

(declare-fun e!117248 () Bool)

(declare-fun tp_is_empty!4167 () Bool)

(declare-fun array_inv!2279 (array!7489) Bool)

(declare-fun array_inv!2280 (array!7491) Bool)

(assert (=> b!177829 (= e!117248 (and tp!15891 tp_is_empty!4167 (array_inv!2279 (_keys!5532 thiss!1248)) (array_inv!2280 (_values!3643 thiss!1248)) e!117247))))

(declare-fun b!177830 () Bool)

(declare-fun e!117250 () Bool)

(assert (=> b!177830 (= e!117250 (and (= (size!3857 (_values!3643 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8608 thiss!1248))) (not (= (size!3856 (_keys!5532 thiss!1248)) (size!3857 (_values!3643 thiss!1248))))))))

(declare-fun b!177831 () Bool)

(declare-fun res!84277 () Bool)

(assert (=> b!177831 (=> (not res!84277) (not e!117250))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3310 0))(
  ( (tuple2!3311 (_1!1666 (_ BitVec 64)) (_2!1666 V!5203)) )
))
(declare-datatypes ((List!2258 0))(
  ( (Nil!2255) (Cons!2254 (h!2876 tuple2!3310) (t!7092 List!2258)) )
))
(declare-datatypes ((ListLongMap!2237 0))(
  ( (ListLongMap!2238 (toList!1134 List!2258)) )
))
(declare-fun contains!1202 (ListLongMap!2237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!786 (array!7489 array!7491 (_ BitVec 32) (_ BitVec 32) V!5203 V!5203 (_ BitVec 32) Int) ListLongMap!2237)

(assert (=> b!177831 (= res!84277 (not (contains!1202 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)) key!828)))))

(declare-fun res!84275 () Bool)

(assert (=> start!17806 (=> (not res!84275) (not e!117250))))

(declare-fun valid!1000 (LongMapFixedSize!2388) Bool)

(assert (=> start!17806 (= res!84275 (valid!1000 thiss!1248))))

(assert (=> start!17806 e!117250))

(assert (=> start!17806 e!117248))

(assert (=> start!17806 true))

(declare-fun b!177832 () Bool)

(declare-fun res!84274 () Bool)

(assert (=> b!177832 (=> (not res!84274) (not e!117250))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!570 0))(
  ( (MissingZero!570 (index!4448 (_ BitVec 32))) (Found!570 (index!4449 (_ BitVec 32))) (Intermediate!570 (undefined!1382 Bool) (index!4450 (_ BitVec 32)) (x!19494 (_ BitVec 32))) (Undefined!570) (MissingVacant!570 (index!4451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7489 (_ BitVec 32)) SeekEntryResult!570)

(assert (=> b!177832 (= res!84274 ((_ is Undefined!570) (seekEntryOrOpen!0 key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248))))))

(declare-fun mapNonEmpty!7120 () Bool)

(declare-fun tp!15892 () Bool)

(declare-fun e!117249 () Bool)

(assert (=> mapNonEmpty!7120 (= mapRes!7120 (and tp!15892 e!117249))))

(declare-fun mapRest!7120 () (Array (_ BitVec 32) ValueCell!1740))

(declare-fun mapValue!7120 () ValueCell!1740)

(declare-fun mapKey!7120 () (_ BitVec 32))

(assert (=> mapNonEmpty!7120 (= (arr!3552 (_values!3643 thiss!1248)) (store mapRest!7120 mapKey!7120 mapValue!7120))))

(declare-fun b!177833 () Bool)

(assert (=> b!177833 (= e!117246 tp_is_empty!4167)))

(declare-fun b!177834 () Bool)

(declare-fun res!84276 () Bool)

(assert (=> b!177834 (=> (not res!84276) (not e!117250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177834 (= res!84276 (validMask!0 (mask!8608 thiss!1248)))))

(declare-fun b!177835 () Bool)

(assert (=> b!177835 (= e!117249 tp_is_empty!4167)))

(declare-fun b!177836 () Bool)

(declare-fun res!84273 () Bool)

(assert (=> b!177836 (=> (not res!84273) (not e!117250))))

(assert (=> b!177836 (= res!84273 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!17806 res!84275) b!177836))

(assert (= (and b!177836 res!84273) b!177832))

(assert (= (and b!177832 res!84274) b!177831))

(assert (= (and b!177831 res!84277) b!177834))

(assert (= (and b!177834 res!84276) b!177830))

(assert (= (and b!177828 condMapEmpty!7120) mapIsEmpty!7120))

(assert (= (and b!177828 (not condMapEmpty!7120)) mapNonEmpty!7120))

(assert (= (and mapNonEmpty!7120 ((_ is ValueCellFull!1740) mapValue!7120)) b!177835))

(assert (= (and b!177828 ((_ is ValueCellFull!1740) mapDefault!7120)) b!177833))

(assert (= b!177829 b!177828))

(assert (= start!17806 b!177829))

(declare-fun m!206303 () Bool)

(assert (=> b!177829 m!206303))

(declare-fun m!206305 () Bool)

(assert (=> b!177829 m!206305))

(declare-fun m!206307 () Bool)

(assert (=> b!177834 m!206307))

(declare-fun m!206309 () Bool)

(assert (=> mapNonEmpty!7120 m!206309))

(declare-fun m!206311 () Bool)

(assert (=> b!177831 m!206311))

(assert (=> b!177831 m!206311))

(declare-fun m!206313 () Bool)

(assert (=> b!177831 m!206313))

(declare-fun m!206315 () Bool)

(assert (=> b!177832 m!206315))

(declare-fun m!206317 () Bool)

(assert (=> start!17806 m!206317))

(check-sat (not b!177831) tp_is_empty!4167 (not b_next!4395) (not b!177834) b_and!10903 (not mapNonEmpty!7120) (not start!17806) (not b!177832) (not b!177829))
(check-sat b_and!10903 (not b_next!4395))
(get-model)

(declare-fun b!177876 () Bool)

(declare-fun c!31856 () Bool)

(declare-fun lt!87878 () (_ BitVec 64))

(assert (=> b!177876 (= c!31856 (= lt!87878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117275 () SeekEntryResult!570)

(declare-fun e!117276 () SeekEntryResult!570)

(assert (=> b!177876 (= e!117275 e!117276)))

(declare-fun b!177877 () Bool)

(declare-fun lt!87877 () SeekEntryResult!570)

(assert (=> b!177877 (= e!117276 (MissingZero!570 (index!4450 lt!87877)))))

(declare-fun b!177878 () Bool)

(declare-fun e!117277 () SeekEntryResult!570)

(assert (=> b!177878 (= e!117277 e!117275)))

(assert (=> b!177878 (= lt!87878 (select (arr!3551 (_keys!5532 thiss!1248)) (index!4450 lt!87877)))))

(declare-fun c!31854 () Bool)

(assert (=> b!177878 (= c!31854 (= lt!87878 key!828))))

(declare-fun b!177879 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7489 (_ BitVec 32)) SeekEntryResult!570)

(assert (=> b!177879 (= e!117276 (seekKeyOrZeroReturnVacant!0 (x!19494 lt!87877) (index!4450 lt!87877) (index!4450 lt!87877) key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)))))

(declare-fun b!177880 () Bool)

(assert (=> b!177880 (= e!117277 Undefined!570)))

(declare-fun b!177881 () Bool)

(assert (=> b!177881 (= e!117275 (Found!570 (index!4450 lt!87877)))))

(declare-fun d!53839 () Bool)

(declare-fun lt!87876 () SeekEntryResult!570)

(assert (=> d!53839 (and (or ((_ is Undefined!570) lt!87876) (not ((_ is Found!570) lt!87876)) (and (bvsge (index!4449 lt!87876) #b00000000000000000000000000000000) (bvslt (index!4449 lt!87876) (size!3856 (_keys!5532 thiss!1248))))) (or ((_ is Undefined!570) lt!87876) ((_ is Found!570) lt!87876) (not ((_ is MissingZero!570) lt!87876)) (and (bvsge (index!4448 lt!87876) #b00000000000000000000000000000000) (bvslt (index!4448 lt!87876) (size!3856 (_keys!5532 thiss!1248))))) (or ((_ is Undefined!570) lt!87876) ((_ is Found!570) lt!87876) ((_ is MissingZero!570) lt!87876) (not ((_ is MissingVacant!570) lt!87876)) (and (bvsge (index!4451 lt!87876) #b00000000000000000000000000000000) (bvslt (index!4451 lt!87876) (size!3856 (_keys!5532 thiss!1248))))) (or ((_ is Undefined!570) lt!87876) (ite ((_ is Found!570) lt!87876) (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4449 lt!87876)) key!828) (ite ((_ is MissingZero!570) lt!87876) (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4448 lt!87876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!570) lt!87876) (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4451 lt!87876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53839 (= lt!87876 e!117277)))

(declare-fun c!31855 () Bool)

(assert (=> d!53839 (= c!31855 (and ((_ is Intermediate!570) lt!87877) (undefined!1382 lt!87877)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7489 (_ BitVec 32)) SeekEntryResult!570)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53839 (= lt!87877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8608 thiss!1248)) key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)))))

(assert (=> d!53839 (validMask!0 (mask!8608 thiss!1248))))

(assert (=> d!53839 (= (seekEntryOrOpen!0 key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)) lt!87876)))

(assert (= (and d!53839 c!31855) b!177880))

(assert (= (and d!53839 (not c!31855)) b!177878))

(assert (= (and b!177878 c!31854) b!177881))

(assert (= (and b!177878 (not c!31854)) b!177876))

(assert (= (and b!177876 c!31856) b!177877))

(assert (= (and b!177876 (not c!31856)) b!177879))

(declare-fun m!206335 () Bool)

(assert (=> b!177878 m!206335))

(declare-fun m!206337 () Bool)

(assert (=> b!177879 m!206337))

(declare-fun m!206339 () Bool)

(assert (=> d!53839 m!206339))

(assert (=> d!53839 m!206339))

(declare-fun m!206341 () Bool)

(assert (=> d!53839 m!206341))

(declare-fun m!206343 () Bool)

(assert (=> d!53839 m!206343))

(assert (=> d!53839 m!206307))

(declare-fun m!206345 () Bool)

(assert (=> d!53839 m!206345))

(declare-fun m!206347 () Bool)

(assert (=> d!53839 m!206347))

(assert (=> b!177832 d!53839))

(declare-fun d!53841 () Bool)

(declare-fun e!117282 () Bool)

(assert (=> d!53841 e!117282))

(declare-fun res!84295 () Bool)

(assert (=> d!53841 (=> res!84295 e!117282)))

(declare-fun lt!87890 () Bool)

(assert (=> d!53841 (= res!84295 (not lt!87890))))

(declare-fun lt!87888 () Bool)

(assert (=> d!53841 (= lt!87890 lt!87888)))

(declare-datatypes ((Unit!5432 0))(
  ( (Unit!5433) )
))
(declare-fun lt!87889 () Unit!5432)

(declare-fun e!117283 () Unit!5432)

(assert (=> d!53841 (= lt!87889 e!117283)))

(declare-fun c!31859 () Bool)

(assert (=> d!53841 (= c!31859 lt!87888)))

(declare-fun containsKey!201 (List!2258 (_ BitVec 64)) Bool)

(assert (=> d!53841 (= lt!87888 (containsKey!201 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))

(assert (=> d!53841 (= (contains!1202 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)) key!828) lt!87890)))

(declare-fun b!177888 () Bool)

(declare-fun lt!87887 () Unit!5432)

(assert (=> b!177888 (= e!117283 lt!87887)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!149 (List!2258 (_ BitVec 64)) Unit!5432)

(assert (=> b!177888 (= lt!87887 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))

(declare-datatypes ((Option!203 0))(
  ( (Some!202 (v!4012 V!5203)) (None!201) )
))
(declare-fun isDefined!150 (Option!203) Bool)

(declare-fun getValueByKey!197 (List!2258 (_ BitVec 64)) Option!203)

(assert (=> b!177888 (isDefined!150 (getValueByKey!197 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))

(declare-fun b!177889 () Bool)

(declare-fun Unit!5434 () Unit!5432)

(assert (=> b!177889 (= e!117283 Unit!5434)))

(declare-fun b!177890 () Bool)

(assert (=> b!177890 (= e!117282 (isDefined!150 (getValueByKey!197 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828)))))

(assert (= (and d!53841 c!31859) b!177888))

(assert (= (and d!53841 (not c!31859)) b!177889))

(assert (= (and d!53841 (not res!84295)) b!177890))

(declare-fun m!206349 () Bool)

(assert (=> d!53841 m!206349))

(declare-fun m!206351 () Bool)

(assert (=> b!177888 m!206351))

(declare-fun m!206353 () Bool)

(assert (=> b!177888 m!206353))

(assert (=> b!177888 m!206353))

(declare-fun m!206355 () Bool)

(assert (=> b!177888 m!206355))

(assert (=> b!177890 m!206353))

(assert (=> b!177890 m!206353))

(assert (=> b!177890 m!206355))

(assert (=> b!177831 d!53841))

(declare-fun b!177933 () Bool)

(declare-fun e!117315 () Bool)

(declare-fun lt!87954 () ListLongMap!2237)

(declare-fun apply!142 (ListLongMap!2237 (_ BitVec 64)) V!5203)

(assert (=> b!177933 (= e!117315 (= (apply!142 lt!87954 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3501 thiss!1248)))))

(declare-fun b!177934 () Bool)

(declare-fun e!117311 () ListLongMap!2237)

(declare-fun call!17993 () ListLongMap!2237)

(assert (=> b!177934 (= e!117311 call!17993)))

(declare-fun b!177935 () Bool)

(declare-fun e!117312 () Bool)

(declare-fun e!117321 () Bool)

(assert (=> b!177935 (= e!117312 e!117321)))

(declare-fun res!84320 () Bool)

(assert (=> b!177935 (=> (not res!84320) (not e!117321))))

(assert (=> b!177935 (= res!84320 (contains!1202 lt!87954 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun b!177936 () Bool)

(declare-fun e!117320 () Bool)

(declare-fun e!117318 () Bool)

(assert (=> b!177936 (= e!117320 e!117318)))

(declare-fun res!84315 () Bool)

(declare-fun call!17994 () Bool)

(assert (=> b!177936 (= res!84315 call!17994)))

(assert (=> b!177936 (=> (not res!84315) (not e!117318))))

(declare-fun b!177937 () Bool)

(declare-fun e!117317 () Unit!5432)

(declare-fun lt!87953 () Unit!5432)

(assert (=> b!177937 (= e!117317 lt!87953)))

(declare-fun lt!87937 () ListLongMap!2237)

(declare-fun getCurrentListMapNoExtraKeys!175 (array!7489 array!7491 (_ BitVec 32) (_ BitVec 32) V!5203 V!5203 (_ BitVec 32) Int) ListLongMap!2237)

(assert (=> b!177937 (= lt!87937 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))

(declare-fun lt!87952 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87955 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87955 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87939 () Unit!5432)

(declare-fun addStillContains!118 (ListLongMap!2237 (_ BitVec 64) V!5203 (_ BitVec 64)) Unit!5432)

(assert (=> b!177937 (= lt!87939 (addStillContains!118 lt!87937 lt!87952 (zeroValue!3501 thiss!1248) lt!87955))))

(declare-fun +!259 (ListLongMap!2237 tuple2!3310) ListLongMap!2237)

(assert (=> b!177937 (contains!1202 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))) lt!87955)))

(declare-fun lt!87949 () Unit!5432)

(assert (=> b!177937 (= lt!87949 lt!87939)))

(declare-fun lt!87946 () ListLongMap!2237)

(assert (=> b!177937 (= lt!87946 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))

(declare-fun lt!87942 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87938 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87938 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87941 () Unit!5432)

(declare-fun addApplyDifferent!118 (ListLongMap!2237 (_ BitVec 64) V!5203 (_ BitVec 64)) Unit!5432)

(assert (=> b!177937 (= lt!87941 (addApplyDifferent!118 lt!87946 lt!87942 (minValue!3501 thiss!1248) lt!87938))))

(assert (=> b!177937 (= (apply!142 (+!259 lt!87946 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))) lt!87938) (apply!142 lt!87946 lt!87938))))

(declare-fun lt!87936 () Unit!5432)

(assert (=> b!177937 (= lt!87936 lt!87941)))

(declare-fun lt!87945 () ListLongMap!2237)

(assert (=> b!177937 (= lt!87945 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))

(declare-fun lt!87935 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87944 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87944 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87950 () Unit!5432)

(assert (=> b!177937 (= lt!87950 (addApplyDifferent!118 lt!87945 lt!87935 (zeroValue!3501 thiss!1248) lt!87944))))

(assert (=> b!177937 (= (apply!142 (+!259 lt!87945 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))) lt!87944) (apply!142 lt!87945 lt!87944))))

(declare-fun lt!87943 () Unit!5432)

(assert (=> b!177937 (= lt!87943 lt!87950)))

(declare-fun lt!87947 () ListLongMap!2237)

(assert (=> b!177937 (= lt!87947 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))

(declare-fun lt!87940 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87940 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87956 () (_ BitVec 64))

(assert (=> b!177937 (= lt!87956 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177937 (= lt!87953 (addApplyDifferent!118 lt!87947 lt!87940 (minValue!3501 thiss!1248) lt!87956))))

(assert (=> b!177937 (= (apply!142 (+!259 lt!87947 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))) lt!87956) (apply!142 lt!87947 lt!87956))))

(declare-fun b!177938 () Bool)

(declare-fun e!117322 () ListLongMap!2237)

(declare-fun e!117319 () ListLongMap!2237)

(assert (=> b!177938 (= e!117322 e!117319)))

(declare-fun c!31877 () Bool)

(assert (=> b!177938 (= c!31877 (and (not (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!53843 () Bool)

(declare-fun e!117314 () Bool)

(assert (=> d!53843 e!117314))

(declare-fun res!84319 () Bool)

(assert (=> d!53843 (=> (not res!84319) (not e!117314))))

(assert (=> d!53843 (= res!84319 (or (bvsge #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))))

(declare-fun lt!87948 () ListLongMap!2237)

(assert (=> d!53843 (= lt!87954 lt!87948)))

(declare-fun lt!87951 () Unit!5432)

(assert (=> d!53843 (= lt!87951 e!117317)))

(declare-fun c!31874 () Bool)

(declare-fun e!117316 () Bool)

(assert (=> d!53843 (= c!31874 e!117316)))

(declare-fun res!84321 () Bool)

(assert (=> d!53843 (=> (not res!84321) (not e!117316))))

(assert (=> d!53843 (= res!84321 (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> d!53843 (= lt!87948 e!117322)))

(declare-fun c!31876 () Bool)

(assert (=> d!53843 (= c!31876 (and (not (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53843 (validMask!0 (mask!8608 thiss!1248))))

(assert (=> d!53843 (= (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)) lt!87954)))

(declare-fun b!177939 () Bool)

(declare-fun e!117313 () Bool)

(assert (=> b!177939 (= e!117314 e!117313)))

(declare-fun c!31873 () Bool)

(assert (=> b!177939 (= c!31873 (not (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177940 () Bool)

(assert (=> b!177940 (= e!117320 (not call!17994))))

(declare-fun b!177941 () Bool)

(assert (=> b!177941 (= e!117313 e!117315)))

(declare-fun res!84317 () Bool)

(declare-fun call!17996 () Bool)

(assert (=> b!177941 (= res!84317 call!17996)))

(assert (=> b!177941 (=> (not res!84317) (not e!117315))))

(declare-fun bm!17989 () Bool)

(declare-fun call!17997 () ListLongMap!2237)

(declare-fun call!17992 () ListLongMap!2237)

(assert (=> bm!17989 (= call!17997 call!17992)))

(declare-fun b!177942 () Bool)

(assert (=> b!177942 (= e!117319 call!17997)))

(declare-fun b!177943 () Bool)

(assert (=> b!177943 (= e!117318 (= (apply!142 lt!87954 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3501 thiss!1248)))))

(declare-fun b!177944 () Bool)

(assert (=> b!177944 (= e!117311 call!17997)))

(declare-fun b!177945 () Bool)

(assert (=> b!177945 (= e!117313 (not call!17996))))

(declare-fun b!177946 () Bool)

(declare-fun e!117310 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177946 (= e!117310 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17990 () Bool)

(declare-fun call!17998 () ListLongMap!2237)

(declare-fun call!17995 () ListLongMap!2237)

(assert (=> bm!17990 (= call!17998 call!17995)))

(declare-fun b!177947 () Bool)

(declare-fun res!84316 () Bool)

(assert (=> b!177947 (=> (not res!84316) (not e!117314))))

(assert (=> b!177947 (= res!84316 e!117320)))

(declare-fun c!31875 () Bool)

(assert (=> b!177947 (= c!31875 (not (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17991 () Bool)

(assert (=> bm!17991 (= call!17993 call!17998)))

(declare-fun b!177948 () Bool)

(declare-fun res!84322 () Bool)

(assert (=> b!177948 (=> (not res!84322) (not e!117314))))

(assert (=> b!177948 (= res!84322 e!117312)))

(declare-fun res!84318 () Bool)

(assert (=> b!177948 (=> res!84318 e!117312)))

(assert (=> b!177948 (= res!84318 (not e!117310))))

(declare-fun res!84314 () Bool)

(assert (=> b!177948 (=> (not res!84314) (not e!117310))))

(assert (=> b!177948 (= res!84314 (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun b!177949 () Bool)

(assert (=> b!177949 (= e!117322 (+!259 call!17992 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))

(declare-fun b!177950 () Bool)

(assert (=> b!177950 (= e!117316 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177951 () Bool)

(declare-fun Unit!5435 () Unit!5432)

(assert (=> b!177951 (= e!117317 Unit!5435)))

(declare-fun bm!17992 () Bool)

(assert (=> bm!17992 (= call!17996 (contains!1202 lt!87954 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17993 () Bool)

(assert (=> bm!17993 (= call!17994 (contains!1202 lt!87954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17994 () Bool)

(assert (=> bm!17994 (= call!17995 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))

(declare-fun bm!17995 () Bool)

(assert (=> bm!17995 (= call!17992 (+!259 (ite c!31876 call!17995 (ite c!31877 call!17998 call!17993)) (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))

(declare-fun b!177952 () Bool)

(declare-fun get!2026 (ValueCell!1740 V!5203) V!5203)

(declare-fun dynLambda!485 (Int (_ BitVec 64)) V!5203)

(assert (=> b!177952 (= e!117321 (= (apply!142 lt!87954 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)) (get!2026 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177952 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_values!3643 thiss!1248))))))

(assert (=> b!177952 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun b!177953 () Bool)

(declare-fun c!31872 () Bool)

(assert (=> b!177953 (= c!31872 (and (not (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3397 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!177953 (= e!117319 e!117311)))

(assert (= (and d!53843 c!31876) b!177949))

(assert (= (and d!53843 (not c!31876)) b!177938))

(assert (= (and b!177938 c!31877) b!177942))

(assert (= (and b!177938 (not c!31877)) b!177953))

(assert (= (and b!177953 c!31872) b!177944))

(assert (= (and b!177953 (not c!31872)) b!177934))

(assert (= (or b!177944 b!177934) bm!17991))

(assert (= (or b!177942 bm!17991) bm!17990))

(assert (= (or b!177942 b!177944) bm!17989))

(assert (= (or b!177949 bm!17990) bm!17994))

(assert (= (or b!177949 bm!17989) bm!17995))

(assert (= (and d!53843 res!84321) b!177950))

(assert (= (and d!53843 c!31874) b!177937))

(assert (= (and d!53843 (not c!31874)) b!177951))

(assert (= (and d!53843 res!84319) b!177948))

(assert (= (and b!177948 res!84314) b!177946))

(assert (= (and b!177948 (not res!84318)) b!177935))

(assert (= (and b!177935 res!84320) b!177952))

(assert (= (and b!177948 res!84322) b!177947))

(assert (= (and b!177947 c!31875) b!177936))

(assert (= (and b!177947 (not c!31875)) b!177940))

(assert (= (and b!177936 res!84315) b!177943))

(assert (= (or b!177936 b!177940) bm!17993))

(assert (= (and b!177947 res!84316) b!177939))

(assert (= (and b!177939 c!31873) b!177941))

(assert (= (and b!177939 (not c!31873)) b!177945))

(assert (= (and b!177941 res!84317) b!177933))

(assert (= (or b!177941 b!177945) bm!17992))

(declare-fun b_lambda!7067 () Bool)

(assert (=> (not b_lambda!7067) (not b!177952)))

(declare-fun t!7094 () Bool)

(declare-fun tb!2795 () Bool)

(assert (=> (and b!177829 (= (defaultEntry!3660 thiss!1248) (defaultEntry!3660 thiss!1248)) t!7094) tb!2795))

(declare-fun result!4659 () Bool)

(assert (=> tb!2795 (= result!4659 tp_is_empty!4167)))

(assert (=> b!177952 t!7094))

(declare-fun b_and!10907 () Bool)

(assert (= b_and!10903 (and (=> t!7094 result!4659) b_and!10907)))

(declare-fun m!206357 () Bool)

(assert (=> b!177943 m!206357))

(declare-fun m!206359 () Bool)

(assert (=> bm!17994 m!206359))

(declare-fun m!206361 () Bool)

(assert (=> b!177946 m!206361))

(assert (=> b!177946 m!206361))

(declare-fun m!206363 () Bool)

(assert (=> b!177946 m!206363))

(declare-fun m!206365 () Bool)

(assert (=> b!177933 m!206365))

(declare-fun m!206367 () Bool)

(assert (=> bm!17993 m!206367))

(declare-fun m!206369 () Bool)

(assert (=> bm!17992 m!206369))

(assert (=> b!177950 m!206361))

(assert (=> b!177950 m!206361))

(assert (=> b!177950 m!206363))

(declare-fun m!206371 () Bool)

(assert (=> b!177952 m!206371))

(declare-fun m!206373 () Bool)

(assert (=> b!177952 m!206373))

(assert (=> b!177952 m!206371))

(declare-fun m!206375 () Bool)

(assert (=> b!177952 m!206375))

(assert (=> b!177952 m!206361))

(assert (=> b!177952 m!206361))

(declare-fun m!206377 () Bool)

(assert (=> b!177952 m!206377))

(assert (=> b!177952 m!206373))

(declare-fun m!206379 () Bool)

(assert (=> b!177949 m!206379))

(declare-fun m!206381 () Bool)

(assert (=> b!177937 m!206381))

(declare-fun m!206383 () Bool)

(assert (=> b!177937 m!206383))

(declare-fun m!206385 () Bool)

(assert (=> b!177937 m!206385))

(declare-fun m!206387 () Bool)

(assert (=> b!177937 m!206387))

(declare-fun m!206389 () Bool)

(assert (=> b!177937 m!206389))

(assert (=> b!177937 m!206385))

(declare-fun m!206391 () Bool)

(assert (=> b!177937 m!206391))

(declare-fun m!206393 () Bool)

(assert (=> b!177937 m!206393))

(assert (=> b!177937 m!206361))

(declare-fun m!206395 () Bool)

(assert (=> b!177937 m!206395))

(declare-fun m!206397 () Bool)

(assert (=> b!177937 m!206397))

(declare-fun m!206399 () Bool)

(assert (=> b!177937 m!206399))

(declare-fun m!206401 () Bool)

(assert (=> b!177937 m!206401))

(assert (=> b!177937 m!206381))

(declare-fun m!206403 () Bool)

(assert (=> b!177937 m!206403))

(declare-fun m!206405 () Bool)

(assert (=> b!177937 m!206405))

(assert (=> b!177937 m!206399))

(assert (=> b!177937 m!206395))

(declare-fun m!206407 () Bool)

(assert (=> b!177937 m!206407))

(declare-fun m!206409 () Bool)

(assert (=> b!177937 m!206409))

(assert (=> b!177937 m!206359))

(assert (=> d!53843 m!206307))

(declare-fun m!206411 () Bool)

(assert (=> bm!17995 m!206411))

(assert (=> b!177935 m!206361))

(assert (=> b!177935 m!206361))

(declare-fun m!206413 () Bool)

(assert (=> b!177935 m!206413))

(assert (=> b!177831 d!53843))

(declare-fun d!53845 () Bool)

(declare-fun res!84329 () Bool)

(declare-fun e!117325 () Bool)

(assert (=> d!53845 (=> (not res!84329) (not e!117325))))

(declare-fun simpleValid!156 (LongMapFixedSize!2388) Bool)

(assert (=> d!53845 (= res!84329 (simpleValid!156 thiss!1248))))

(assert (=> d!53845 (= (valid!1000 thiss!1248) e!117325)))

(declare-fun b!177962 () Bool)

(declare-fun res!84330 () Bool)

(assert (=> b!177962 (=> (not res!84330) (not e!117325))))

(declare-fun arrayCountValidKeys!0 (array!7489 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177962 (= res!84330 (= (arrayCountValidKeys!0 (_keys!5532 thiss!1248) #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))) (_size!1243 thiss!1248)))))

(declare-fun b!177963 () Bool)

(declare-fun res!84331 () Bool)

(assert (=> b!177963 (=> (not res!84331) (not e!117325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7489 (_ BitVec 32)) Bool)

(assert (=> b!177963 (= res!84331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)))))

(declare-fun b!177964 () Bool)

(declare-datatypes ((List!2259 0))(
  ( (Nil!2256) (Cons!2255 (h!2877 (_ BitVec 64)) (t!7095 List!2259)) )
))
(declare-fun arrayNoDuplicates!0 (array!7489 (_ BitVec 32) List!2259) Bool)

(assert (=> b!177964 (= e!117325 (arrayNoDuplicates!0 (_keys!5532 thiss!1248) #b00000000000000000000000000000000 Nil!2256))))

(assert (= (and d!53845 res!84329) b!177962))

(assert (= (and b!177962 res!84330) b!177963))

(assert (= (and b!177963 res!84331) b!177964))

(declare-fun m!206415 () Bool)

(assert (=> d!53845 m!206415))

(declare-fun m!206417 () Bool)

(assert (=> b!177962 m!206417))

(declare-fun m!206419 () Bool)

(assert (=> b!177963 m!206419))

(declare-fun m!206421 () Bool)

(assert (=> b!177964 m!206421))

(assert (=> start!17806 d!53845))

(declare-fun d!53847 () Bool)

(assert (=> d!53847 (= (validMask!0 (mask!8608 thiss!1248)) (and (or (= (mask!8608 thiss!1248) #b00000000000000000000000000000111) (= (mask!8608 thiss!1248) #b00000000000000000000000000001111) (= (mask!8608 thiss!1248) #b00000000000000000000000000011111) (= (mask!8608 thiss!1248) #b00000000000000000000000000111111) (= (mask!8608 thiss!1248) #b00000000000000000000000001111111) (= (mask!8608 thiss!1248) #b00000000000000000000000011111111) (= (mask!8608 thiss!1248) #b00000000000000000000000111111111) (= (mask!8608 thiss!1248) #b00000000000000000000001111111111) (= (mask!8608 thiss!1248) #b00000000000000000000011111111111) (= (mask!8608 thiss!1248) #b00000000000000000000111111111111) (= (mask!8608 thiss!1248) #b00000000000000000001111111111111) (= (mask!8608 thiss!1248) #b00000000000000000011111111111111) (= (mask!8608 thiss!1248) #b00000000000000000111111111111111) (= (mask!8608 thiss!1248) #b00000000000000001111111111111111) (= (mask!8608 thiss!1248) #b00000000000000011111111111111111) (= (mask!8608 thiss!1248) #b00000000000000111111111111111111) (= (mask!8608 thiss!1248) #b00000000000001111111111111111111) (= (mask!8608 thiss!1248) #b00000000000011111111111111111111) (= (mask!8608 thiss!1248) #b00000000000111111111111111111111) (= (mask!8608 thiss!1248) #b00000000001111111111111111111111) (= (mask!8608 thiss!1248) #b00000000011111111111111111111111) (= (mask!8608 thiss!1248) #b00000000111111111111111111111111) (= (mask!8608 thiss!1248) #b00000001111111111111111111111111) (= (mask!8608 thiss!1248) #b00000011111111111111111111111111) (= (mask!8608 thiss!1248) #b00000111111111111111111111111111) (= (mask!8608 thiss!1248) #b00001111111111111111111111111111) (= (mask!8608 thiss!1248) #b00011111111111111111111111111111) (= (mask!8608 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8608 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177834 d!53847))

(declare-fun d!53849 () Bool)

(assert (=> d!53849 (= (array_inv!2279 (_keys!5532 thiss!1248)) (bvsge (size!3856 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177829 d!53849))

(declare-fun d!53851 () Bool)

(assert (=> d!53851 (= (array_inv!2280 (_values!3643 thiss!1248)) (bvsge (size!3857 (_values!3643 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177829 d!53851))

(declare-fun mapIsEmpty!7126 () Bool)

(declare-fun mapRes!7126 () Bool)

(assert (=> mapIsEmpty!7126 mapRes!7126))

(declare-fun mapNonEmpty!7126 () Bool)

(declare-fun tp!15901 () Bool)

(declare-fun e!117331 () Bool)

(assert (=> mapNonEmpty!7126 (= mapRes!7126 (and tp!15901 e!117331))))

(declare-fun mapRest!7126 () (Array (_ BitVec 32) ValueCell!1740))

(declare-fun mapValue!7126 () ValueCell!1740)

(declare-fun mapKey!7126 () (_ BitVec 32))

(assert (=> mapNonEmpty!7126 (= mapRest!7120 (store mapRest!7126 mapKey!7126 mapValue!7126))))

(declare-fun b!177972 () Bool)

(declare-fun e!117330 () Bool)

(assert (=> b!177972 (= e!117330 tp_is_empty!4167)))

(declare-fun condMapEmpty!7126 () Bool)

(declare-fun mapDefault!7126 () ValueCell!1740)

(assert (=> mapNonEmpty!7120 (= condMapEmpty!7126 (= mapRest!7120 ((as const (Array (_ BitVec 32) ValueCell!1740)) mapDefault!7126)))))

(assert (=> mapNonEmpty!7120 (= tp!15892 (and e!117330 mapRes!7126))))

(declare-fun b!177971 () Bool)

(assert (=> b!177971 (= e!117331 tp_is_empty!4167)))

(assert (= (and mapNonEmpty!7120 condMapEmpty!7126) mapIsEmpty!7126))

(assert (= (and mapNonEmpty!7120 (not condMapEmpty!7126)) mapNonEmpty!7126))

(assert (= (and mapNonEmpty!7126 ((_ is ValueCellFull!1740) mapValue!7126)) b!177971))

(assert (= (and mapNonEmpty!7120 ((_ is ValueCellFull!1740) mapDefault!7126)) b!177972))

(declare-fun m!206423 () Bool)

(assert (=> mapNonEmpty!7126 m!206423))

(declare-fun b_lambda!7069 () Bool)

(assert (= b_lambda!7067 (or (and b!177829 b_free!4395) b_lambda!7069)))

(check-sat (not b!177933) (not b!177952) (not bm!17995) (not b_next!4395) (not mapNonEmpty!7126) (not bm!17993) (not b!177888) (not b!177935) (not d!53843) (not b!177943) (not b!177946) (not b!177963) (not b!177950) (not b!177879) tp_is_empty!4167 (not d!53839) (not d!53845) (not b!177949) (not b!177890) (not bm!17994) (not b!177964) (not b_lambda!7069) (not b!177937) (not d!53841) (not b!177962) b_and!10907 (not bm!17992))
(check-sat b_and!10907 (not b_next!4395))
(get-model)

(declare-fun b!177983 () Bool)

(declare-fun e!117342 () Bool)

(declare-fun contains!1203 (List!2259 (_ BitVec 64)) Bool)

(assert (=> b!177983 (= e!117342 (contains!1203 Nil!2256 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177984 () Bool)

(declare-fun e!117340 () Bool)

(declare-fun call!18001 () Bool)

(assert (=> b!177984 (= e!117340 call!18001)))

(declare-fun bm!17998 () Bool)

(declare-fun c!31880 () Bool)

(assert (=> bm!17998 (= call!18001 (arrayNoDuplicates!0 (_keys!5532 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31880 (Cons!2255 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000) Nil!2256) Nil!2256)))))

(declare-fun b!177985 () Bool)

(assert (=> b!177985 (= e!117340 call!18001)))

(declare-fun d!53853 () Bool)

(declare-fun res!84338 () Bool)

(declare-fun e!117341 () Bool)

(assert (=> d!53853 (=> res!84338 e!117341)))

(assert (=> d!53853 (= res!84338 (bvsge #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> d!53853 (= (arrayNoDuplicates!0 (_keys!5532 thiss!1248) #b00000000000000000000000000000000 Nil!2256) e!117341)))

(declare-fun b!177986 () Bool)

(declare-fun e!117343 () Bool)

(assert (=> b!177986 (= e!117343 e!117340)))

(assert (=> b!177986 (= c!31880 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177987 () Bool)

(assert (=> b!177987 (= e!117341 e!117343)))

(declare-fun res!84340 () Bool)

(assert (=> b!177987 (=> (not res!84340) (not e!117343))))

(assert (=> b!177987 (= res!84340 (not e!117342))))

(declare-fun res!84339 () Bool)

(assert (=> b!177987 (=> (not res!84339) (not e!117342))))

(assert (=> b!177987 (= res!84339 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53853 (not res!84338)) b!177987))

(assert (= (and b!177987 res!84339) b!177983))

(assert (= (and b!177987 res!84340) b!177986))

(assert (= (and b!177986 c!31880) b!177985))

(assert (= (and b!177986 (not c!31880)) b!177984))

(assert (= (or b!177985 b!177984) bm!17998))

(assert (=> b!177983 m!206361))

(assert (=> b!177983 m!206361))

(declare-fun m!206425 () Bool)

(assert (=> b!177983 m!206425))

(assert (=> bm!17998 m!206361))

(declare-fun m!206427 () Bool)

(assert (=> bm!17998 m!206427))

(assert (=> b!177986 m!206361))

(assert (=> b!177986 m!206361))

(assert (=> b!177986 m!206363))

(assert (=> b!177987 m!206361))

(assert (=> b!177987 m!206361))

(assert (=> b!177987 m!206363))

(assert (=> b!177964 d!53853))

(declare-fun d!53855 () Bool)

(assert (=> d!53855 (= (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177950 d!53855))

(declare-fun bm!18001 () Bool)

(declare-fun call!18004 () Bool)

(assert (=> bm!18001 (= call!18004 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5532 thiss!1248) (mask!8608 thiss!1248)))))

(declare-fun b!177996 () Bool)

(declare-fun e!117350 () Bool)

(declare-fun e!117352 () Bool)

(assert (=> b!177996 (= e!117350 e!117352)))

(declare-fun lt!87964 () (_ BitVec 64))

(assert (=> b!177996 (= lt!87964 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87963 () Unit!5432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7489 (_ BitVec 64) (_ BitVec 32)) Unit!5432)

(assert (=> b!177996 (= lt!87963 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5532 thiss!1248) lt!87964 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177996 (arrayContainsKey!0 (_keys!5532 thiss!1248) lt!87964 #b00000000000000000000000000000000)))

(declare-fun lt!87965 () Unit!5432)

(assert (=> b!177996 (= lt!87965 lt!87963)))

(declare-fun res!84346 () Bool)

(assert (=> b!177996 (= res!84346 (= (seekEntryOrOpen!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000) (_keys!5532 thiss!1248) (mask!8608 thiss!1248)) (Found!570 #b00000000000000000000000000000000)))))

(assert (=> b!177996 (=> (not res!84346) (not e!117352))))

(declare-fun b!177997 () Bool)

(declare-fun e!117351 () Bool)

(assert (=> b!177997 (= e!117351 e!117350)))

(declare-fun c!31883 () Bool)

(assert (=> b!177997 (= c!31883 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177998 () Bool)

(assert (=> b!177998 (= e!117352 call!18004)))

(declare-fun b!177999 () Bool)

(assert (=> b!177999 (= e!117350 call!18004)))

(declare-fun d!53857 () Bool)

(declare-fun res!84345 () Bool)

(assert (=> d!53857 (=> res!84345 e!117351)))

(assert (=> d!53857 (= res!84345 (bvsge #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> d!53857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)) e!117351)))

(assert (= (and d!53857 (not res!84345)) b!177997))

(assert (= (and b!177997 c!31883) b!177996))

(assert (= (and b!177997 (not c!31883)) b!177999))

(assert (= (and b!177996 res!84346) b!177998))

(assert (= (or b!177998 b!177999) bm!18001))

(declare-fun m!206429 () Bool)

(assert (=> bm!18001 m!206429))

(assert (=> b!177996 m!206361))

(declare-fun m!206431 () Bool)

(assert (=> b!177996 m!206431))

(declare-fun m!206433 () Bool)

(assert (=> b!177996 m!206433))

(assert (=> b!177996 m!206361))

(declare-fun m!206435 () Bool)

(assert (=> b!177996 m!206435))

(assert (=> b!177997 m!206361))

(assert (=> b!177997 m!206361))

(assert (=> b!177997 m!206363))

(assert (=> b!177963 d!53857))

(declare-fun b!178018 () Bool)

(declare-fun e!117366 () SeekEntryResult!570)

(assert (=> b!178018 (= e!117366 (Intermediate!570 false (toIndex!0 key!828 (mask!8608 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178019 () Bool)

(declare-fun e!117367 () Bool)

(declare-fun lt!87971 () SeekEntryResult!570)

(assert (=> b!178019 (= e!117367 (bvsge (x!19494 lt!87971) #b01111111111111111111111111111110))))

(declare-fun b!178020 () Bool)

(assert (=> b!178020 (and (bvsge (index!4450 lt!87971) #b00000000000000000000000000000000) (bvslt (index!4450 lt!87971) (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun res!84353 () Bool)

(assert (=> b!178020 (= res!84353 (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4450 lt!87971)) key!828))))

(declare-fun e!117363 () Bool)

(assert (=> b!178020 (=> res!84353 e!117363)))

(declare-fun e!117365 () Bool)

(assert (=> b!178020 (= e!117365 e!117363)))

(declare-fun b!178021 () Bool)

(declare-fun e!117364 () SeekEntryResult!570)

(assert (=> b!178021 (= e!117364 (Intermediate!570 true (toIndex!0 key!828 (mask!8608 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178022 () Bool)

(assert (=> b!178022 (and (bvsge (index!4450 lt!87971) #b00000000000000000000000000000000) (bvslt (index!4450 lt!87971) (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun res!84354 () Bool)

(assert (=> b!178022 (= res!84354 (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4450 lt!87971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178022 (=> res!84354 e!117363)))

(declare-fun b!178024 () Bool)

(assert (=> b!178024 (and (bvsge (index!4450 lt!87971) #b00000000000000000000000000000000) (bvslt (index!4450 lt!87971) (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> b!178024 (= e!117363 (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4450 lt!87971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178025 () Bool)

(assert (=> b!178025 (= e!117367 e!117365)))

(declare-fun res!84355 () Bool)

(assert (=> b!178025 (= res!84355 (and ((_ is Intermediate!570) lt!87971) (not (undefined!1382 lt!87971)) (bvslt (x!19494 lt!87971) #b01111111111111111111111111111110) (bvsge (x!19494 lt!87971) #b00000000000000000000000000000000) (bvsge (x!19494 lt!87971) #b00000000000000000000000000000000)))))

(assert (=> b!178025 (=> (not res!84355) (not e!117365))))

(declare-fun b!178026 () Bool)

(assert (=> b!178026 (= e!117364 e!117366)))

(declare-fun c!31892 () Bool)

(declare-fun lt!87970 () (_ BitVec 64))

(assert (=> b!178026 (= c!31892 (or (= lt!87970 key!828) (= (bvadd lt!87970 lt!87970) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178023 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178023 (= e!117366 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8608 thiss!1248)) #b00000000000000000000000000000000 (mask!8608 thiss!1248)) key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)))))

(declare-fun d!53859 () Bool)

(assert (=> d!53859 e!117367))

(declare-fun c!31891 () Bool)

(assert (=> d!53859 (= c!31891 (and ((_ is Intermediate!570) lt!87971) (undefined!1382 lt!87971)))))

(assert (=> d!53859 (= lt!87971 e!117364)))

(declare-fun c!31890 () Bool)

(assert (=> d!53859 (= c!31890 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53859 (= lt!87970 (select (arr!3551 (_keys!5532 thiss!1248)) (toIndex!0 key!828 (mask!8608 thiss!1248))))))

(assert (=> d!53859 (validMask!0 (mask!8608 thiss!1248))))

(assert (=> d!53859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8608 thiss!1248)) key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)) lt!87971)))

(assert (= (and d!53859 c!31890) b!178021))

(assert (= (and d!53859 (not c!31890)) b!178026))

(assert (= (and b!178026 c!31892) b!178018))

(assert (= (and b!178026 (not c!31892)) b!178023))

(assert (= (and d!53859 c!31891) b!178019))

(assert (= (and d!53859 (not c!31891)) b!178025))

(assert (= (and b!178025 res!84355) b!178020))

(assert (= (and b!178020 (not res!84353)) b!178022))

(assert (= (and b!178022 (not res!84354)) b!178024))

(declare-fun m!206437 () Bool)

(assert (=> b!178024 m!206437))

(assert (=> d!53859 m!206339))

(declare-fun m!206439 () Bool)

(assert (=> d!53859 m!206439))

(assert (=> d!53859 m!206307))

(assert (=> b!178022 m!206437))

(assert (=> b!178020 m!206437))

(assert (=> b!178023 m!206339))

(declare-fun m!206441 () Bool)

(assert (=> b!178023 m!206441))

(assert (=> b!178023 m!206441))

(declare-fun m!206443 () Bool)

(assert (=> b!178023 m!206443))

(assert (=> d!53839 d!53859))

(declare-fun d!53861 () Bool)

(declare-fun lt!87977 () (_ BitVec 32))

(declare-fun lt!87976 () (_ BitVec 32))

(assert (=> d!53861 (= lt!87977 (bvmul (bvxor lt!87976 (bvlshr lt!87976 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53861 (= lt!87976 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53861 (and (bvsge (mask!8608 thiss!1248) #b00000000000000000000000000000000) (let ((res!84356 (let ((h!2878 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19511 (bvmul (bvxor h!2878 (bvlshr h!2878 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19511 (bvlshr x!19511 #b00000000000000000000000000001101)) (mask!8608 thiss!1248)))))) (and (bvslt res!84356 (bvadd (mask!8608 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84356 #b00000000000000000000000000000000))))))

(assert (=> d!53861 (= (toIndex!0 key!828 (mask!8608 thiss!1248)) (bvand (bvxor lt!87977 (bvlshr lt!87977 #b00000000000000000000000000001101)) (mask!8608 thiss!1248)))))

(assert (=> d!53839 d!53861))

(assert (=> d!53839 d!53847))

(declare-fun d!53863 () Bool)

(declare-fun e!117370 () Bool)

(assert (=> d!53863 e!117370))

(declare-fun res!84362 () Bool)

(assert (=> d!53863 (=> (not res!84362) (not e!117370))))

(declare-fun lt!87988 () ListLongMap!2237)

(assert (=> d!53863 (= res!84362 (contains!1202 lt!87988 (_1!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))

(declare-fun lt!87989 () List!2258)

(assert (=> d!53863 (= lt!87988 (ListLongMap!2238 lt!87989))))

(declare-fun lt!87986 () Unit!5432)

(declare-fun lt!87987 () Unit!5432)

(assert (=> d!53863 (= lt!87986 lt!87987)))

(assert (=> d!53863 (= (getValueByKey!197 lt!87989 (_1!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!104 (List!2258 (_ BitVec 64) V!5203) Unit!5432)

(assert (=> d!53863 (= lt!87987 (lemmaContainsTupThenGetReturnValue!104 lt!87989 (_1!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))

(declare-fun insertStrictlySorted!107 (List!2258 (_ BitVec 64) V!5203) List!2258)

(assert (=> d!53863 (= lt!87989 (insertStrictlySorted!107 (toList!1134 call!17992) (_1!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))

(assert (=> d!53863 (= (+!259 call!17992 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))) lt!87988)))

(declare-fun b!178031 () Bool)

(declare-fun res!84361 () Bool)

(assert (=> b!178031 (=> (not res!84361) (not e!117370))))

(assert (=> b!178031 (= res!84361 (= (getValueByKey!197 (toList!1134 lt!87988) (_1!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))))

(declare-fun b!178032 () Bool)

(declare-fun contains!1204 (List!2258 tuple2!3310) Bool)

(assert (=> b!178032 (= e!117370 (contains!1204 (toList!1134 lt!87988) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))

(assert (= (and d!53863 res!84362) b!178031))

(assert (= (and b!178031 res!84361) b!178032))

(declare-fun m!206445 () Bool)

(assert (=> d!53863 m!206445))

(declare-fun m!206447 () Bool)

(assert (=> d!53863 m!206447))

(declare-fun m!206449 () Bool)

(assert (=> d!53863 m!206449))

(declare-fun m!206451 () Bool)

(assert (=> d!53863 m!206451))

(declare-fun m!206453 () Bool)

(assert (=> b!178031 m!206453))

(declare-fun m!206455 () Bool)

(assert (=> b!178032 m!206455))

(assert (=> b!177949 d!53863))

(declare-fun d!53865 () Bool)

(declare-fun isEmpty!449 (Option!203) Bool)

(assert (=> d!53865 (= (isDefined!150 (getValueByKey!197 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828)) (not (isEmpty!449 (getValueByKey!197 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))))

(declare-fun bs!7307 () Bool)

(assert (= bs!7307 d!53865))

(assert (=> bs!7307 m!206353))

(declare-fun m!206457 () Bool)

(assert (=> bs!7307 m!206457))

(assert (=> b!177890 d!53865))

(declare-fun b!178044 () Bool)

(declare-fun e!117376 () Option!203)

(assert (=> b!178044 (= e!117376 None!201)))

(declare-fun b!178042 () Bool)

(declare-fun e!117375 () Option!203)

(assert (=> b!178042 (= e!117375 e!117376)))

(declare-fun c!31898 () Bool)

(assert (=> b!178042 (= c!31898 (and ((_ is Cons!2254) (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))) (not (= (_1!1666 (h!2876 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))))) key!828))))))

(declare-fun b!178043 () Bool)

(assert (=> b!178043 (= e!117376 (getValueByKey!197 (t!7092 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))) key!828))))

(declare-fun d!53867 () Bool)

(declare-fun c!31897 () Bool)

(assert (=> d!53867 (= c!31897 (and ((_ is Cons!2254) (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))) (= (_1!1666 (h!2876 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))))) key!828)))))

(assert (=> d!53867 (= (getValueByKey!197 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828) e!117375)))

(declare-fun b!178041 () Bool)

(assert (=> b!178041 (= e!117375 (Some!202 (_2!1666 (h!2876 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))))))

(assert (= (and d!53867 c!31897) b!178041))

(assert (= (and d!53867 (not c!31897)) b!178042))

(assert (= (and b!178042 c!31898) b!178043))

(assert (= (and b!178042 (not c!31898)) b!178044))

(declare-fun m!206459 () Bool)

(assert (=> b!178043 m!206459))

(assert (=> b!177890 d!53867))

(declare-fun d!53869 () Bool)

(declare-fun lt!87992 () (_ BitVec 32))

(assert (=> d!53869 (and (bvsge lt!87992 #b00000000000000000000000000000000) (bvsle lt!87992 (bvsub (size!3856 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117381 () (_ BitVec 32))

(assert (=> d!53869 (= lt!87992 e!117381)))

(declare-fun c!31903 () Bool)

(assert (=> d!53869 (= c!31903 (bvsge #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> d!53869 (and (bvsle #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3856 (_keys!5532 thiss!1248)) (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> d!53869 (= (arrayCountValidKeys!0 (_keys!5532 thiss!1248) #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))) lt!87992)))

(declare-fun b!178053 () Bool)

(declare-fun e!117382 () (_ BitVec 32))

(declare-fun call!18007 () (_ BitVec 32))

(assert (=> b!178053 (= e!117382 (bvadd #b00000000000000000000000000000001 call!18007))))

(declare-fun b!178054 () Bool)

(assert (=> b!178054 (= e!117381 #b00000000000000000000000000000000)))

(declare-fun b!178055 () Bool)

(assert (=> b!178055 (= e!117382 call!18007)))

(declare-fun bm!18004 () Bool)

(assert (=> bm!18004 (= call!18007 (arrayCountValidKeys!0 (_keys!5532 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun b!178056 () Bool)

(assert (=> b!178056 (= e!117381 e!117382)))

(declare-fun c!31904 () Bool)

(assert (=> b!178056 (= c!31904 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53869 c!31903) b!178054))

(assert (= (and d!53869 (not c!31903)) b!178056))

(assert (= (and b!178056 c!31904) b!178053))

(assert (= (and b!178056 (not c!31904)) b!178055))

(assert (= (or b!178053 b!178055) bm!18004))

(declare-fun m!206461 () Bool)

(assert (=> bm!18004 m!206461))

(assert (=> b!178056 m!206361))

(assert (=> b!178056 m!206361))

(assert (=> b!178056 m!206363))

(assert (=> b!177962 d!53869))

(assert (=> d!53843 d!53847))

(declare-fun b!178067 () Bool)

(declare-fun res!84373 () Bool)

(declare-fun e!117385 () Bool)

(assert (=> b!178067 (=> (not res!84373) (not e!117385))))

(declare-fun size!3860 (LongMapFixedSize!2388) (_ BitVec 32))

(assert (=> b!178067 (= res!84373 (= (size!3860 thiss!1248) (bvadd (_size!1243 thiss!1248) (bvsdiv (bvadd (extraKeys!3397 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!178068 () Bool)

(assert (=> b!178068 (= e!117385 (and (bvsge (extraKeys!3397 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3397 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1243 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178066 () Bool)

(declare-fun res!84372 () Bool)

(assert (=> b!178066 (=> (not res!84372) (not e!117385))))

(assert (=> b!178066 (= res!84372 (bvsge (size!3860 thiss!1248) (_size!1243 thiss!1248)))))

(declare-fun b!178065 () Bool)

(declare-fun res!84374 () Bool)

(assert (=> b!178065 (=> (not res!84374) (not e!117385))))

(assert (=> b!178065 (= res!84374 (and (= (size!3857 (_values!3643 thiss!1248)) (bvadd (mask!8608 thiss!1248) #b00000000000000000000000000000001)) (= (size!3856 (_keys!5532 thiss!1248)) (size!3857 (_values!3643 thiss!1248))) (bvsge (_size!1243 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1243 thiss!1248) (bvadd (mask!8608 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53871 () Bool)

(declare-fun res!84371 () Bool)

(assert (=> d!53871 (=> (not res!84371) (not e!117385))))

(assert (=> d!53871 (= res!84371 (validMask!0 (mask!8608 thiss!1248)))))

(assert (=> d!53871 (= (simpleValid!156 thiss!1248) e!117385)))

(assert (= (and d!53871 res!84371) b!178065))

(assert (= (and b!178065 res!84374) b!178066))

(assert (= (and b!178066 res!84372) b!178067))

(assert (= (and b!178067 res!84373) b!178068))

(declare-fun m!206463 () Bool)

(assert (=> b!178067 m!206463))

(assert (=> b!178066 m!206463))

(assert (=> d!53871 m!206307))

(assert (=> d!53845 d!53871))

(declare-fun e!117393 () SeekEntryResult!570)

(declare-fun b!178081 () Bool)

(assert (=> b!178081 (= e!117393 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19494 lt!87877) #b00000000000000000000000000000001) (nextIndex!0 (index!4450 lt!87877) (x!19494 lt!87877) (mask!8608 thiss!1248)) (index!4450 lt!87877) key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)))))

(declare-fun b!178082 () Bool)

(declare-fun e!117392 () SeekEntryResult!570)

(assert (=> b!178082 (= e!117392 Undefined!570)))

(declare-fun d!53873 () Bool)

(declare-fun lt!87998 () SeekEntryResult!570)

(assert (=> d!53873 (and (or ((_ is Undefined!570) lt!87998) (not ((_ is Found!570) lt!87998)) (and (bvsge (index!4449 lt!87998) #b00000000000000000000000000000000) (bvslt (index!4449 lt!87998) (size!3856 (_keys!5532 thiss!1248))))) (or ((_ is Undefined!570) lt!87998) ((_ is Found!570) lt!87998) (not ((_ is MissingVacant!570) lt!87998)) (not (= (index!4451 lt!87998) (index!4450 lt!87877))) (and (bvsge (index!4451 lt!87998) #b00000000000000000000000000000000) (bvslt (index!4451 lt!87998) (size!3856 (_keys!5532 thiss!1248))))) (or ((_ is Undefined!570) lt!87998) (ite ((_ is Found!570) lt!87998) (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4449 lt!87998)) key!828) (and ((_ is MissingVacant!570) lt!87998) (= (index!4451 lt!87998) (index!4450 lt!87877)) (= (select (arr!3551 (_keys!5532 thiss!1248)) (index!4451 lt!87998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53873 (= lt!87998 e!117392)))

(declare-fun c!31912 () Bool)

(assert (=> d!53873 (= c!31912 (bvsge (x!19494 lt!87877) #b01111111111111111111111111111110))))

(declare-fun lt!87997 () (_ BitVec 64))

(assert (=> d!53873 (= lt!87997 (select (arr!3551 (_keys!5532 thiss!1248)) (index!4450 lt!87877)))))

(assert (=> d!53873 (validMask!0 (mask!8608 thiss!1248))))

(assert (=> d!53873 (= (seekKeyOrZeroReturnVacant!0 (x!19494 lt!87877) (index!4450 lt!87877) (index!4450 lt!87877) key!828 (_keys!5532 thiss!1248) (mask!8608 thiss!1248)) lt!87998)))

(declare-fun b!178083 () Bool)

(declare-fun e!117394 () SeekEntryResult!570)

(assert (=> b!178083 (= e!117392 e!117394)))

(declare-fun c!31911 () Bool)

(assert (=> b!178083 (= c!31911 (= lt!87997 key!828))))

(declare-fun b!178084 () Bool)

(declare-fun c!31913 () Bool)

(assert (=> b!178084 (= c!31913 (= lt!87997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178084 (= e!117394 e!117393)))

(declare-fun b!178085 () Bool)

(assert (=> b!178085 (= e!117393 (MissingVacant!570 (index!4450 lt!87877)))))

(declare-fun b!178086 () Bool)

(assert (=> b!178086 (= e!117394 (Found!570 (index!4450 lt!87877)))))

(assert (= (and d!53873 c!31912) b!178082))

(assert (= (and d!53873 (not c!31912)) b!178083))

(assert (= (and b!178083 c!31911) b!178086))

(assert (= (and b!178083 (not c!31911)) b!178084))

(assert (= (and b!178084 c!31913) b!178085))

(assert (= (and b!178084 (not c!31913)) b!178081))

(declare-fun m!206465 () Bool)

(assert (=> b!178081 m!206465))

(assert (=> b!178081 m!206465))

(declare-fun m!206467 () Bool)

(assert (=> b!178081 m!206467))

(declare-fun m!206469 () Bool)

(assert (=> d!53873 m!206469))

(declare-fun m!206471 () Bool)

(assert (=> d!53873 m!206471))

(assert (=> d!53873 m!206335))

(assert (=> d!53873 m!206307))

(assert (=> b!177879 d!53873))

(declare-fun d!53875 () Bool)

(assert (=> d!53875 (isDefined!150 (getValueByKey!197 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))

(declare-fun lt!88001 () Unit!5432)

(declare-fun choose!949 (List!2258 (_ BitVec 64)) Unit!5432)

(assert (=> d!53875 (= lt!88001 (choose!949 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))

(declare-fun e!117397 () Bool)

(assert (=> d!53875 e!117397))

(declare-fun res!84377 () Bool)

(assert (=> d!53875 (=> (not res!84377) (not e!117397))))

(declare-fun isStrictlySorted!338 (List!2258) Bool)

(assert (=> d!53875 (= res!84377 (isStrictlySorted!338 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))))))

(assert (=> d!53875 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828) lt!88001)))

(declare-fun b!178089 () Bool)

(assert (=> b!178089 (= e!117397 (containsKey!201 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828))))

(assert (= (and d!53875 res!84377) b!178089))

(assert (=> d!53875 m!206353))

(assert (=> d!53875 m!206353))

(assert (=> d!53875 m!206355))

(declare-fun m!206473 () Bool)

(assert (=> d!53875 m!206473))

(declare-fun m!206475 () Bool)

(assert (=> d!53875 m!206475))

(assert (=> b!178089 m!206349))

(assert (=> b!177888 d!53875))

(assert (=> b!177888 d!53865))

(assert (=> b!177888 d!53867))

(declare-fun d!53877 () Bool)

(declare-fun get!2027 (Option!203) V!5203)

(assert (=> d!53877 (= (apply!142 lt!87954 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)) (get!2027 (getValueByKey!197 (toList!1134 lt!87954) (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7308 () Bool)

(assert (= bs!7308 d!53877))

(assert (=> bs!7308 m!206361))

(declare-fun m!206477 () Bool)

(assert (=> bs!7308 m!206477))

(assert (=> bs!7308 m!206477))

(declare-fun m!206479 () Bool)

(assert (=> bs!7308 m!206479))

(assert (=> b!177952 d!53877))

(declare-fun d!53879 () Bool)

(declare-fun c!31916 () Bool)

(assert (=> d!53879 (= c!31916 ((_ is ValueCellFull!1740) (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117400 () V!5203)

(assert (=> d!53879 (= (get!2026 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117400)))

(declare-fun b!178094 () Bool)

(declare-fun get!2028 (ValueCell!1740 V!5203) V!5203)

(assert (=> b!178094 (= e!117400 (get!2028 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178095 () Bool)

(declare-fun get!2029 (ValueCell!1740 V!5203) V!5203)

(assert (=> b!178095 (= e!117400 (get!2029 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53879 c!31916) b!178094))

(assert (= (and d!53879 (not c!31916)) b!178095))

(assert (=> b!178094 m!206373))

(assert (=> b!178094 m!206371))

(declare-fun m!206481 () Bool)

(assert (=> b!178094 m!206481))

(assert (=> b!178095 m!206373))

(assert (=> b!178095 m!206371))

(declare-fun m!206483 () Bool)

(assert (=> b!178095 m!206483))

(assert (=> b!177952 d!53879))

(declare-fun d!53881 () Bool)

(assert (=> d!53881 (= (apply!142 (+!259 lt!87947 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))) lt!87956) (get!2027 (getValueByKey!197 (toList!1134 (+!259 lt!87947 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))) lt!87956)))))

(declare-fun bs!7309 () Bool)

(assert (= bs!7309 d!53881))

(declare-fun m!206485 () Bool)

(assert (=> bs!7309 m!206485))

(assert (=> bs!7309 m!206485))

(declare-fun m!206487 () Bool)

(assert (=> bs!7309 m!206487))

(assert (=> b!177937 d!53881))

(declare-fun b!178120 () Bool)

(declare-fun lt!88018 () Unit!5432)

(declare-fun lt!88022 () Unit!5432)

(assert (=> b!178120 (= lt!88018 lt!88022)))

(declare-fun lt!88020 () (_ BitVec 64))

(declare-fun lt!88016 () (_ BitVec 64))

(declare-fun lt!88019 () V!5203)

(declare-fun lt!88021 () ListLongMap!2237)

(assert (=> b!178120 (not (contains!1202 (+!259 lt!88021 (tuple2!3311 lt!88020 lt!88019)) lt!88016))))

(declare-fun addStillNotContains!78 (ListLongMap!2237 (_ BitVec 64) V!5203 (_ BitVec 64)) Unit!5432)

(assert (=> b!178120 (= lt!88022 (addStillNotContains!78 lt!88021 lt!88020 lt!88019 lt!88016))))

(assert (=> b!178120 (= lt!88016 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!178120 (= lt!88019 (get!2026 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178120 (= lt!88020 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18010 () ListLongMap!2237)

(assert (=> b!178120 (= lt!88021 call!18010)))

(declare-fun e!117417 () ListLongMap!2237)

(assert (=> b!178120 (= e!117417 (+!259 call!18010 (tuple2!3311 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000) (get!2026 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!178121 () Bool)

(declare-fun e!117419 () Bool)

(declare-fun lt!88017 () ListLongMap!2237)

(assert (=> b!178121 (= e!117419 (= lt!88017 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3660 thiss!1248))))))

(declare-fun b!178122 () Bool)

(declare-fun e!117421 () ListLongMap!2237)

(assert (=> b!178122 (= e!117421 (ListLongMap!2238 Nil!2255))))

(declare-fun d!53883 () Bool)

(declare-fun e!117418 () Bool)

(assert (=> d!53883 e!117418))

(declare-fun res!84388 () Bool)

(assert (=> d!53883 (=> (not res!84388) (not e!117418))))

(assert (=> d!53883 (= res!84388 (not (contains!1202 lt!88017 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53883 (= lt!88017 e!117421)))

(declare-fun c!31928 () Bool)

(assert (=> d!53883 (= c!31928 (bvsge #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> d!53883 (validMask!0 (mask!8608 thiss!1248))))

(assert (=> d!53883 (= (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)) lt!88017)))

(declare-fun b!178123 () Bool)

(declare-fun e!117416 () Bool)

(assert (=> b!178123 (= e!117416 e!117419)))

(declare-fun c!31927 () Bool)

(assert (=> b!178123 (= c!31927 (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun b!178124 () Bool)

(declare-fun e!117415 () Bool)

(assert (=> b!178124 (= e!117416 e!117415)))

(assert (=> b!178124 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun res!84389 () Bool)

(assert (=> b!178124 (= res!84389 (contains!1202 lt!88017 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178124 (=> (not res!84389) (not e!117415))))

(declare-fun b!178125 () Bool)

(declare-fun isEmpty!450 (ListLongMap!2237) Bool)

(assert (=> b!178125 (= e!117419 (isEmpty!450 lt!88017))))

(declare-fun bm!18007 () Bool)

(assert (=> bm!18007 (= call!18010 (getCurrentListMapNoExtraKeys!175 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3660 thiss!1248)))))

(declare-fun b!178126 () Bool)

(assert (=> b!178126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(assert (=> b!178126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_values!3643 thiss!1248))))))

(assert (=> b!178126 (= e!117415 (= (apply!142 lt!88017 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)) (get!2026 (select (arr!3552 (_values!3643 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3660 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!178127 () Bool)

(assert (=> b!178127 (= e!117421 e!117417)))

(declare-fun c!31925 () Bool)

(assert (=> b!178127 (= c!31925 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178128 () Bool)

(assert (=> b!178128 (= e!117418 e!117416)))

(declare-fun c!31926 () Bool)

(declare-fun e!117420 () Bool)

(assert (=> b!178128 (= c!31926 e!117420)))

(declare-fun res!84386 () Bool)

(assert (=> b!178128 (=> (not res!84386) (not e!117420))))

(assert (=> b!178128 (= res!84386 (bvslt #b00000000000000000000000000000000 (size!3856 (_keys!5532 thiss!1248))))))

(declare-fun b!178129 () Bool)

(assert (=> b!178129 (= e!117417 call!18010)))

(declare-fun b!178130 () Bool)

(assert (=> b!178130 (= e!117420 (validKeyInArray!0 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178130 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!178131 () Bool)

(declare-fun res!84387 () Bool)

(assert (=> b!178131 (=> (not res!84387) (not e!117418))))

(assert (=> b!178131 (= res!84387 (not (contains!1202 lt!88017 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53883 c!31928) b!178122))

(assert (= (and d!53883 (not c!31928)) b!178127))

(assert (= (and b!178127 c!31925) b!178120))

(assert (= (and b!178127 (not c!31925)) b!178129))

(assert (= (or b!178120 b!178129) bm!18007))

(assert (= (and d!53883 res!84388) b!178131))

(assert (= (and b!178131 res!84387) b!178128))

(assert (= (and b!178128 res!84386) b!178130))

(assert (= (and b!178128 c!31926) b!178124))

(assert (= (and b!178128 (not c!31926)) b!178123))

(assert (= (and b!178124 res!84389) b!178126))

(assert (= (and b!178123 c!31927) b!178121))

(assert (= (and b!178123 (not c!31927)) b!178125))

(declare-fun b_lambda!7071 () Bool)

(assert (=> (not b_lambda!7071) (not b!178120)))

(assert (=> b!178120 t!7094))

(declare-fun b_and!10909 () Bool)

(assert (= b_and!10907 (and (=> t!7094 result!4659) b_and!10909)))

(declare-fun b_lambda!7073 () Bool)

(assert (=> (not b_lambda!7073) (not b!178126)))

(assert (=> b!178126 t!7094))

(declare-fun b_and!10911 () Bool)

(assert (= b_and!10909 (and (=> t!7094 result!4659) b_and!10911)))

(assert (=> b!178126 m!206361))

(declare-fun m!206489 () Bool)

(assert (=> b!178126 m!206489))

(assert (=> b!178126 m!206361))

(assert (=> b!178126 m!206373))

(assert (=> b!178126 m!206373))

(assert (=> b!178126 m!206371))

(assert (=> b!178126 m!206375))

(assert (=> b!178126 m!206371))

(declare-fun m!206491 () Bool)

(assert (=> b!178121 m!206491))

(assert (=> b!178130 m!206361))

(assert (=> b!178130 m!206361))

(assert (=> b!178130 m!206363))

(declare-fun m!206493 () Bool)

(assert (=> d!53883 m!206493))

(assert (=> d!53883 m!206307))

(declare-fun m!206495 () Bool)

(assert (=> b!178125 m!206495))

(declare-fun m!206497 () Bool)

(assert (=> b!178131 m!206497))

(assert (=> b!178124 m!206361))

(assert (=> b!178124 m!206361))

(declare-fun m!206499 () Bool)

(assert (=> b!178124 m!206499))

(assert (=> b!178127 m!206361))

(assert (=> b!178127 m!206361))

(assert (=> b!178127 m!206363))

(assert (=> bm!18007 m!206491))

(declare-fun m!206501 () Bool)

(assert (=> b!178120 m!206501))

(declare-fun m!206503 () Bool)

(assert (=> b!178120 m!206503))

(assert (=> b!178120 m!206361))

(declare-fun m!206505 () Bool)

(assert (=> b!178120 m!206505))

(assert (=> b!178120 m!206373))

(assert (=> b!178120 m!206501))

(assert (=> b!178120 m!206373))

(assert (=> b!178120 m!206371))

(assert (=> b!178120 m!206375))

(assert (=> b!178120 m!206371))

(declare-fun m!206507 () Bool)

(assert (=> b!178120 m!206507))

(assert (=> b!177937 d!53883))

(declare-fun d!53885 () Bool)

(declare-fun e!117422 () Bool)

(assert (=> d!53885 e!117422))

(declare-fun res!84391 () Bool)

(assert (=> d!53885 (=> (not res!84391) (not e!117422))))

(declare-fun lt!88025 () ListLongMap!2237)

(assert (=> d!53885 (= res!84391 (contains!1202 lt!88025 (_1!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))))))

(declare-fun lt!88026 () List!2258)

(assert (=> d!53885 (= lt!88025 (ListLongMap!2238 lt!88026))))

(declare-fun lt!88023 () Unit!5432)

(declare-fun lt!88024 () Unit!5432)

(assert (=> d!53885 (= lt!88023 lt!88024)))

(assert (=> d!53885 (= (getValueByKey!197 lt!88026 (_1!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))))))

(assert (=> d!53885 (= lt!88024 (lemmaContainsTupThenGetReturnValue!104 lt!88026 (_1!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))))))

(assert (=> d!53885 (= lt!88026 (insertStrictlySorted!107 (toList!1134 lt!87937) (_1!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))))))

(assert (=> d!53885 (= (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))) lt!88025)))

(declare-fun b!178132 () Bool)

(declare-fun res!84390 () Bool)

(assert (=> b!178132 (=> (not res!84390) (not e!117422))))

(assert (=> b!178132 (= res!84390 (= (getValueByKey!197 (toList!1134 lt!88025) (_1!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))))))))

(declare-fun b!178133 () Bool)

(assert (=> b!178133 (= e!117422 (contains!1204 (toList!1134 lt!88025) (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))))))

(assert (= (and d!53885 res!84391) b!178132))

(assert (= (and b!178132 res!84390) b!178133))

(declare-fun m!206509 () Bool)

(assert (=> d!53885 m!206509))

(declare-fun m!206511 () Bool)

(assert (=> d!53885 m!206511))

(declare-fun m!206513 () Bool)

(assert (=> d!53885 m!206513))

(declare-fun m!206515 () Bool)

(assert (=> d!53885 m!206515))

(declare-fun m!206517 () Bool)

(assert (=> b!178132 m!206517))

(declare-fun m!206519 () Bool)

(assert (=> b!178133 m!206519))

(assert (=> b!177937 d!53885))

(declare-fun d!53887 () Bool)

(assert (=> d!53887 (= (apply!142 (+!259 lt!87945 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))) lt!87944) (get!2027 (getValueByKey!197 (toList!1134 (+!259 lt!87945 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))) lt!87944)))))

(declare-fun bs!7310 () Bool)

(assert (= bs!7310 d!53887))

(declare-fun m!206521 () Bool)

(assert (=> bs!7310 m!206521))

(assert (=> bs!7310 m!206521))

(declare-fun m!206523 () Bool)

(assert (=> bs!7310 m!206523))

(assert (=> b!177937 d!53887))

(declare-fun d!53889 () Bool)

(assert (=> d!53889 (= (apply!142 (+!259 lt!87947 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))) lt!87956) (apply!142 lt!87947 lt!87956))))

(declare-fun lt!88029 () Unit!5432)

(declare-fun choose!950 (ListLongMap!2237 (_ BitVec 64) V!5203 (_ BitVec 64)) Unit!5432)

(assert (=> d!53889 (= lt!88029 (choose!950 lt!87947 lt!87940 (minValue!3501 thiss!1248) lt!87956))))

(declare-fun e!117425 () Bool)

(assert (=> d!53889 e!117425))

(declare-fun res!84394 () Bool)

(assert (=> d!53889 (=> (not res!84394) (not e!117425))))

(assert (=> d!53889 (= res!84394 (contains!1202 lt!87947 lt!87956))))

(assert (=> d!53889 (= (addApplyDifferent!118 lt!87947 lt!87940 (minValue!3501 thiss!1248) lt!87956) lt!88029)))

(declare-fun b!178137 () Bool)

(assert (=> b!178137 (= e!117425 (not (= lt!87956 lt!87940)))))

(assert (= (and d!53889 res!84394) b!178137))

(assert (=> d!53889 m!206405))

(declare-fun m!206525 () Bool)

(assert (=> d!53889 m!206525))

(assert (=> d!53889 m!206381))

(assert (=> d!53889 m!206403))

(declare-fun m!206527 () Bool)

(assert (=> d!53889 m!206527))

(assert (=> d!53889 m!206381))

(assert (=> b!177937 d!53889))

(declare-fun d!53891 () Bool)

(assert (=> d!53891 (= (apply!142 (+!259 lt!87945 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))) lt!87944) (apply!142 lt!87945 lt!87944))))

(declare-fun lt!88030 () Unit!5432)

(assert (=> d!53891 (= lt!88030 (choose!950 lt!87945 lt!87935 (zeroValue!3501 thiss!1248) lt!87944))))

(declare-fun e!117426 () Bool)

(assert (=> d!53891 e!117426))

(declare-fun res!84395 () Bool)

(assert (=> d!53891 (=> (not res!84395) (not e!117426))))

(assert (=> d!53891 (= res!84395 (contains!1202 lt!87945 lt!87944))))

(assert (=> d!53891 (= (addApplyDifferent!118 lt!87945 lt!87935 (zeroValue!3501 thiss!1248) lt!87944) lt!88030)))

(declare-fun b!178138 () Bool)

(assert (=> b!178138 (= e!117426 (not (= lt!87944 lt!87935)))))

(assert (= (and d!53891 res!84395) b!178138))

(assert (=> d!53891 m!206393))

(declare-fun m!206529 () Bool)

(assert (=> d!53891 m!206529))

(assert (=> d!53891 m!206385))

(assert (=> d!53891 m!206391))

(declare-fun m!206531 () Bool)

(assert (=> d!53891 m!206531))

(assert (=> d!53891 m!206385))

(assert (=> b!177937 d!53891))

(declare-fun d!53893 () Bool)

(declare-fun e!117427 () Bool)

(assert (=> d!53893 e!117427))

(declare-fun res!84397 () Bool)

(assert (=> d!53893 (=> (not res!84397) (not e!117427))))

(declare-fun lt!88033 () ListLongMap!2237)

(assert (=> d!53893 (= res!84397 (contains!1202 lt!88033 (_1!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))))))

(declare-fun lt!88034 () List!2258)

(assert (=> d!53893 (= lt!88033 (ListLongMap!2238 lt!88034))))

(declare-fun lt!88031 () Unit!5432)

(declare-fun lt!88032 () Unit!5432)

(assert (=> d!53893 (= lt!88031 lt!88032)))

(assert (=> d!53893 (= (getValueByKey!197 lt!88034 (_1!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))))))

(assert (=> d!53893 (= lt!88032 (lemmaContainsTupThenGetReturnValue!104 lt!88034 (_1!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))))))

(assert (=> d!53893 (= lt!88034 (insertStrictlySorted!107 (toList!1134 lt!87946) (_1!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))))))

(assert (=> d!53893 (= (+!259 lt!87946 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))) lt!88033)))

(declare-fun b!178139 () Bool)

(declare-fun res!84396 () Bool)

(assert (=> b!178139 (=> (not res!84396) (not e!117427))))

(assert (=> b!178139 (= res!84396 (= (getValueByKey!197 (toList!1134 lt!88033) (_1!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))))))))

(declare-fun b!178140 () Bool)

(assert (=> b!178140 (= e!117427 (contains!1204 (toList!1134 lt!88033) (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))))))

(assert (= (and d!53893 res!84397) b!178139))

(assert (= (and b!178139 res!84396) b!178140))

(declare-fun m!206533 () Bool)

(assert (=> d!53893 m!206533))

(declare-fun m!206535 () Bool)

(assert (=> d!53893 m!206535))

(declare-fun m!206537 () Bool)

(assert (=> d!53893 m!206537))

(declare-fun m!206539 () Bool)

(assert (=> d!53893 m!206539))

(declare-fun m!206541 () Bool)

(assert (=> b!178139 m!206541))

(declare-fun m!206543 () Bool)

(assert (=> b!178140 m!206543))

(assert (=> b!177937 d!53893))

(declare-fun d!53895 () Bool)

(assert (=> d!53895 (= (apply!142 lt!87947 lt!87956) (get!2027 (getValueByKey!197 (toList!1134 lt!87947) lt!87956)))))

(declare-fun bs!7311 () Bool)

(assert (= bs!7311 d!53895))

(declare-fun m!206545 () Bool)

(assert (=> bs!7311 m!206545))

(assert (=> bs!7311 m!206545))

(declare-fun m!206547 () Bool)

(assert (=> bs!7311 m!206547))

(assert (=> b!177937 d!53895))

(declare-fun d!53897 () Bool)

(assert (=> d!53897 (= (apply!142 lt!87946 lt!87938) (get!2027 (getValueByKey!197 (toList!1134 lt!87946) lt!87938)))))

(declare-fun bs!7312 () Bool)

(assert (= bs!7312 d!53897))

(declare-fun m!206549 () Bool)

(assert (=> bs!7312 m!206549))

(assert (=> bs!7312 m!206549))

(declare-fun m!206551 () Bool)

(assert (=> bs!7312 m!206551))

(assert (=> b!177937 d!53897))

(declare-fun d!53899 () Bool)

(assert (=> d!53899 (= (apply!142 (+!259 lt!87946 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))) lt!87938) (apply!142 lt!87946 lt!87938))))

(declare-fun lt!88035 () Unit!5432)

(assert (=> d!53899 (= lt!88035 (choose!950 lt!87946 lt!87942 (minValue!3501 thiss!1248) lt!87938))))

(declare-fun e!117428 () Bool)

(assert (=> d!53899 e!117428))

(declare-fun res!84398 () Bool)

(assert (=> d!53899 (=> (not res!84398) (not e!117428))))

(assert (=> d!53899 (= res!84398 (contains!1202 lt!87946 lt!87938))))

(assert (=> d!53899 (= (addApplyDifferent!118 lt!87946 lt!87942 (minValue!3501 thiss!1248) lt!87938) lt!88035)))

(declare-fun b!178141 () Bool)

(assert (=> b!178141 (= e!117428 (not (= lt!87938 lt!87942)))))

(assert (= (and d!53899 res!84398) b!178141))

(assert (=> d!53899 m!206383))

(declare-fun m!206553 () Bool)

(assert (=> d!53899 m!206553))

(assert (=> d!53899 m!206399))

(assert (=> d!53899 m!206401))

(declare-fun m!206555 () Bool)

(assert (=> d!53899 m!206555))

(assert (=> d!53899 m!206399))

(assert (=> b!177937 d!53899))

(declare-fun d!53901 () Bool)

(assert (=> d!53901 (= (apply!142 lt!87945 lt!87944) (get!2027 (getValueByKey!197 (toList!1134 lt!87945) lt!87944)))))

(declare-fun bs!7313 () Bool)

(assert (= bs!7313 d!53901))

(declare-fun m!206557 () Bool)

(assert (=> bs!7313 m!206557))

(assert (=> bs!7313 m!206557))

(declare-fun m!206559 () Bool)

(assert (=> bs!7313 m!206559))

(assert (=> b!177937 d!53901))

(declare-fun d!53903 () Bool)

(assert (=> d!53903 (contains!1202 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))) lt!87955)))

(declare-fun lt!88038 () Unit!5432)

(declare-fun choose!951 (ListLongMap!2237 (_ BitVec 64) V!5203 (_ BitVec 64)) Unit!5432)

(assert (=> d!53903 (= lt!88038 (choose!951 lt!87937 lt!87952 (zeroValue!3501 thiss!1248) lt!87955))))

(assert (=> d!53903 (contains!1202 lt!87937 lt!87955)))

(assert (=> d!53903 (= (addStillContains!118 lt!87937 lt!87952 (zeroValue!3501 thiss!1248) lt!87955) lt!88038)))

(declare-fun bs!7314 () Bool)

(assert (= bs!7314 d!53903))

(assert (=> bs!7314 m!206395))

(assert (=> bs!7314 m!206395))

(assert (=> bs!7314 m!206407))

(declare-fun m!206561 () Bool)

(assert (=> bs!7314 m!206561))

(declare-fun m!206563 () Bool)

(assert (=> bs!7314 m!206563))

(assert (=> b!177937 d!53903))

(declare-fun d!53905 () Bool)

(assert (=> d!53905 (= (apply!142 (+!259 lt!87946 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248))) lt!87938) (get!2027 (getValueByKey!197 (toList!1134 (+!259 lt!87946 (tuple2!3311 lt!87942 (minValue!3501 thiss!1248)))) lt!87938)))))

(declare-fun bs!7315 () Bool)

(assert (= bs!7315 d!53905))

(declare-fun m!206565 () Bool)

(assert (=> bs!7315 m!206565))

(assert (=> bs!7315 m!206565))

(declare-fun m!206567 () Bool)

(assert (=> bs!7315 m!206567))

(assert (=> b!177937 d!53905))

(declare-fun d!53907 () Bool)

(declare-fun e!117429 () Bool)

(assert (=> d!53907 e!117429))

(declare-fun res!84400 () Bool)

(assert (=> d!53907 (=> (not res!84400) (not e!117429))))

(declare-fun lt!88041 () ListLongMap!2237)

(assert (=> d!53907 (= res!84400 (contains!1202 lt!88041 (_1!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))))))

(declare-fun lt!88042 () List!2258)

(assert (=> d!53907 (= lt!88041 (ListLongMap!2238 lt!88042))))

(declare-fun lt!88039 () Unit!5432)

(declare-fun lt!88040 () Unit!5432)

(assert (=> d!53907 (= lt!88039 lt!88040)))

(assert (=> d!53907 (= (getValueByKey!197 lt!88042 (_1!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))))))

(assert (=> d!53907 (= lt!88040 (lemmaContainsTupThenGetReturnValue!104 lt!88042 (_1!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))))))

(assert (=> d!53907 (= lt!88042 (insertStrictlySorted!107 (toList!1134 lt!87945) (_1!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))))))

(assert (=> d!53907 (= (+!259 lt!87945 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))) lt!88041)))

(declare-fun b!178143 () Bool)

(declare-fun res!84399 () Bool)

(assert (=> b!178143 (=> (not res!84399) (not e!117429))))

(assert (=> b!178143 (= res!84399 (= (getValueByKey!197 (toList!1134 lt!88041) (_1!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))))))))

(declare-fun b!178144 () Bool)

(assert (=> b!178144 (= e!117429 (contains!1204 (toList!1134 lt!88041) (tuple2!3311 lt!87935 (zeroValue!3501 thiss!1248))))))

(assert (= (and d!53907 res!84400) b!178143))

(assert (= (and b!178143 res!84399) b!178144))

(declare-fun m!206569 () Bool)

(assert (=> d!53907 m!206569))

(declare-fun m!206571 () Bool)

(assert (=> d!53907 m!206571))

(declare-fun m!206573 () Bool)

(assert (=> d!53907 m!206573))

(declare-fun m!206575 () Bool)

(assert (=> d!53907 m!206575))

(declare-fun m!206577 () Bool)

(assert (=> b!178143 m!206577))

(declare-fun m!206579 () Bool)

(assert (=> b!178144 m!206579))

(assert (=> b!177937 d!53907))

(declare-fun d!53909 () Bool)

(declare-fun e!117430 () Bool)

(assert (=> d!53909 e!117430))

(declare-fun res!84402 () Bool)

(assert (=> d!53909 (=> (not res!84402) (not e!117430))))

(declare-fun lt!88045 () ListLongMap!2237)

(assert (=> d!53909 (= res!84402 (contains!1202 lt!88045 (_1!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))))))

(declare-fun lt!88046 () List!2258)

(assert (=> d!53909 (= lt!88045 (ListLongMap!2238 lt!88046))))

(declare-fun lt!88043 () Unit!5432)

(declare-fun lt!88044 () Unit!5432)

(assert (=> d!53909 (= lt!88043 lt!88044)))

(assert (=> d!53909 (= (getValueByKey!197 lt!88046 (_1!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))))))

(assert (=> d!53909 (= lt!88044 (lemmaContainsTupThenGetReturnValue!104 lt!88046 (_1!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))))))

(assert (=> d!53909 (= lt!88046 (insertStrictlySorted!107 (toList!1134 lt!87947) (_1!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))) (_2!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))))))

(assert (=> d!53909 (= (+!259 lt!87947 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))) lt!88045)))

(declare-fun b!178145 () Bool)

(declare-fun res!84401 () Bool)

(assert (=> b!178145 (=> (not res!84401) (not e!117430))))

(assert (=> b!178145 (= res!84401 (= (getValueByKey!197 (toList!1134 lt!88045) (_1!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248)))) (Some!202 (_2!1666 (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))))))))

(declare-fun b!178146 () Bool)

(assert (=> b!178146 (= e!117430 (contains!1204 (toList!1134 lt!88045) (tuple2!3311 lt!87940 (minValue!3501 thiss!1248))))))

(assert (= (and d!53909 res!84402) b!178145))

(assert (= (and b!178145 res!84401) b!178146))

(declare-fun m!206581 () Bool)

(assert (=> d!53909 m!206581))

(declare-fun m!206583 () Bool)

(assert (=> d!53909 m!206583))

(declare-fun m!206585 () Bool)

(assert (=> d!53909 m!206585))

(declare-fun m!206587 () Bool)

(assert (=> d!53909 m!206587))

(declare-fun m!206589 () Bool)

(assert (=> b!178145 m!206589))

(declare-fun m!206591 () Bool)

(assert (=> b!178146 m!206591))

(assert (=> b!177937 d!53909))

(declare-fun d!53911 () Bool)

(declare-fun e!117431 () Bool)

(assert (=> d!53911 e!117431))

(declare-fun res!84403 () Bool)

(assert (=> d!53911 (=> res!84403 e!117431)))

(declare-fun lt!88050 () Bool)

(assert (=> d!53911 (= res!84403 (not lt!88050))))

(declare-fun lt!88048 () Bool)

(assert (=> d!53911 (= lt!88050 lt!88048)))

(declare-fun lt!88049 () Unit!5432)

(declare-fun e!117432 () Unit!5432)

(assert (=> d!53911 (= lt!88049 e!117432)))

(declare-fun c!31929 () Bool)

(assert (=> d!53911 (= c!31929 lt!88048)))

(assert (=> d!53911 (= lt!88048 (containsKey!201 (toList!1134 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))) lt!87955))))

(assert (=> d!53911 (= (contains!1202 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248))) lt!87955) lt!88050)))

(declare-fun b!178147 () Bool)

(declare-fun lt!88047 () Unit!5432)

(assert (=> b!178147 (= e!117432 lt!88047)))

(assert (=> b!178147 (= lt!88047 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1134 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))) lt!87955))))

(assert (=> b!178147 (isDefined!150 (getValueByKey!197 (toList!1134 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))) lt!87955))))

(declare-fun b!178148 () Bool)

(declare-fun Unit!5436 () Unit!5432)

(assert (=> b!178148 (= e!117432 Unit!5436)))

(declare-fun b!178149 () Bool)

(assert (=> b!178149 (= e!117431 (isDefined!150 (getValueByKey!197 (toList!1134 (+!259 lt!87937 (tuple2!3311 lt!87952 (zeroValue!3501 thiss!1248)))) lt!87955)))))

(assert (= (and d!53911 c!31929) b!178147))

(assert (= (and d!53911 (not c!31929)) b!178148))

(assert (= (and d!53911 (not res!84403)) b!178149))

(declare-fun m!206593 () Bool)

(assert (=> d!53911 m!206593))

(declare-fun m!206595 () Bool)

(assert (=> b!178147 m!206595))

(declare-fun m!206597 () Bool)

(assert (=> b!178147 m!206597))

(assert (=> b!178147 m!206597))

(declare-fun m!206599 () Bool)

(assert (=> b!178147 m!206599))

(assert (=> b!178149 m!206597))

(assert (=> b!178149 m!206597))

(assert (=> b!178149 m!206599))

(assert (=> b!177937 d!53911))

(declare-fun d!53913 () Bool)

(declare-fun e!117433 () Bool)

(assert (=> d!53913 e!117433))

(declare-fun res!84405 () Bool)

(assert (=> d!53913 (=> (not res!84405) (not e!117433))))

(declare-fun lt!88053 () ListLongMap!2237)

(assert (=> d!53913 (= res!84405 (contains!1202 lt!88053 (_1!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))))

(declare-fun lt!88054 () List!2258)

(assert (=> d!53913 (= lt!88053 (ListLongMap!2238 lt!88054))))

(declare-fun lt!88051 () Unit!5432)

(declare-fun lt!88052 () Unit!5432)

(assert (=> d!53913 (= lt!88051 lt!88052)))

(assert (=> d!53913 (= (getValueByKey!197 lt!88054 (_1!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))) (Some!202 (_2!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))))

(assert (=> d!53913 (= lt!88052 (lemmaContainsTupThenGetReturnValue!104 lt!88054 (_1!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))) (_2!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))))

(assert (=> d!53913 (= lt!88054 (insertStrictlySorted!107 (toList!1134 (ite c!31876 call!17995 (ite c!31877 call!17998 call!17993))) (_1!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))) (_2!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))))))

(assert (=> d!53913 (= (+!259 (ite c!31876 call!17995 (ite c!31877 call!17998 call!17993)) (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))) lt!88053)))

(declare-fun b!178150 () Bool)

(declare-fun res!84404 () Bool)

(assert (=> b!178150 (=> (not res!84404) (not e!117433))))

(assert (=> b!178150 (= res!84404 (= (getValueByKey!197 (toList!1134 lt!88053) (_1!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248))))) (Some!202 (_2!1666 (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))))

(declare-fun b!178151 () Bool)

(assert (=> b!178151 (= e!117433 (contains!1204 (toList!1134 lt!88053) (ite (or c!31876 c!31877) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3501 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3501 thiss!1248)))))))

(assert (= (and d!53913 res!84405) b!178150))

(assert (= (and b!178150 res!84404) b!178151))

(declare-fun m!206601 () Bool)

(assert (=> d!53913 m!206601))

(declare-fun m!206603 () Bool)

(assert (=> d!53913 m!206603))

(declare-fun m!206605 () Bool)

(assert (=> d!53913 m!206605))

(declare-fun m!206607 () Bool)

(assert (=> d!53913 m!206607))

(declare-fun m!206609 () Bool)

(assert (=> b!178150 m!206609))

(declare-fun m!206611 () Bool)

(assert (=> b!178151 m!206611))

(assert (=> bm!17995 d!53913))

(assert (=> b!177946 d!53855))

(declare-fun d!53915 () Bool)

(declare-fun res!84410 () Bool)

(declare-fun e!117438 () Bool)

(assert (=> d!53915 (=> res!84410 e!117438)))

(assert (=> d!53915 (= res!84410 (and ((_ is Cons!2254) (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))) (= (_1!1666 (h!2876 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))))) key!828)))))

(assert (=> d!53915 (= (containsKey!201 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))) key!828) e!117438)))

(declare-fun b!178156 () Bool)

(declare-fun e!117439 () Bool)

(assert (=> b!178156 (= e!117438 e!117439)))

(declare-fun res!84411 () Bool)

(assert (=> b!178156 (=> (not res!84411) (not e!117439))))

(assert (=> b!178156 (= res!84411 (and (or (not ((_ is Cons!2254) (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))))) (bvsle (_1!1666 (h!2876 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))))) key!828)) ((_ is Cons!2254) (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))) (bvslt (_1!1666 (h!2876 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248))))) key!828)))))

(declare-fun b!178157 () Bool)

(assert (=> b!178157 (= e!117439 (containsKey!201 (t!7092 (toList!1134 (getCurrentListMap!786 (_keys!5532 thiss!1248) (_values!3643 thiss!1248) (mask!8608 thiss!1248) (extraKeys!3397 thiss!1248) (zeroValue!3501 thiss!1248) (minValue!3501 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3660 thiss!1248)))) key!828))))

(assert (= (and d!53915 (not res!84410)) b!178156))

(assert (= (and b!178156 res!84411) b!178157))

(declare-fun m!206613 () Bool)

(assert (=> b!178157 m!206613))

(assert (=> d!53841 d!53915))

(assert (=> bm!17994 d!53883))

(declare-fun d!53917 () Bool)

(declare-fun e!117440 () Bool)

(assert (=> d!53917 e!117440))

(declare-fun res!84412 () Bool)

(assert (=> d!53917 (=> res!84412 e!117440)))

(declare-fun lt!88058 () Bool)

(assert (=> d!53917 (= res!84412 (not lt!88058))))

(declare-fun lt!88056 () Bool)

(assert (=> d!53917 (= lt!88058 lt!88056)))

(declare-fun lt!88057 () Unit!5432)

(declare-fun e!117441 () Unit!5432)

(assert (=> d!53917 (= lt!88057 e!117441)))

(declare-fun c!31930 () Bool)

(assert (=> d!53917 (= c!31930 lt!88056)))

(assert (=> d!53917 (= lt!88056 (containsKey!201 (toList!1134 lt!87954) (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53917 (= (contains!1202 lt!87954 (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)) lt!88058)))

(declare-fun b!178158 () Bool)

(declare-fun lt!88055 () Unit!5432)

(assert (=> b!178158 (= e!117441 lt!88055)))

(assert (=> b!178158 (= lt!88055 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1134 lt!87954) (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178158 (isDefined!150 (getValueByKey!197 (toList!1134 lt!87954) (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178159 () Bool)

(declare-fun Unit!5437 () Unit!5432)

(assert (=> b!178159 (= e!117441 Unit!5437)))

(declare-fun b!178160 () Bool)

(assert (=> b!178160 (= e!117440 (isDefined!150 (getValueByKey!197 (toList!1134 lt!87954) (select (arr!3551 (_keys!5532 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53917 c!31930) b!178158))

(assert (= (and d!53917 (not c!31930)) b!178159))

(assert (= (and d!53917 (not res!84412)) b!178160))

(assert (=> d!53917 m!206361))

(declare-fun m!206615 () Bool)

(assert (=> d!53917 m!206615))

(assert (=> b!178158 m!206361))

(declare-fun m!206617 () Bool)

(assert (=> b!178158 m!206617))

(assert (=> b!178158 m!206361))

(assert (=> b!178158 m!206477))

(assert (=> b!178158 m!206477))

(declare-fun m!206619 () Bool)

(assert (=> b!178158 m!206619))

(assert (=> b!178160 m!206361))

(assert (=> b!178160 m!206477))

(assert (=> b!178160 m!206477))

(assert (=> b!178160 m!206619))

(assert (=> b!177935 d!53917))

(declare-fun d!53919 () Bool)

(declare-fun e!117442 () Bool)

(assert (=> d!53919 e!117442))

(declare-fun res!84413 () Bool)

(assert (=> d!53919 (=> res!84413 e!117442)))

(declare-fun lt!88062 () Bool)

(assert (=> d!53919 (= res!84413 (not lt!88062))))

(declare-fun lt!88060 () Bool)

(assert (=> d!53919 (= lt!88062 lt!88060)))

(declare-fun lt!88061 () Unit!5432)

(declare-fun e!117443 () Unit!5432)

(assert (=> d!53919 (= lt!88061 e!117443)))

(declare-fun c!31931 () Bool)

(assert (=> d!53919 (= c!31931 lt!88060)))

(assert (=> d!53919 (= lt!88060 (containsKey!201 (toList!1134 lt!87954) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53919 (= (contains!1202 lt!87954 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88062)))

(declare-fun b!178161 () Bool)

(declare-fun lt!88059 () Unit!5432)

(assert (=> b!178161 (= e!117443 lt!88059)))

(assert (=> b!178161 (= lt!88059 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1134 lt!87954) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178161 (isDefined!150 (getValueByKey!197 (toList!1134 lt!87954) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178162 () Bool)

(declare-fun Unit!5438 () Unit!5432)

(assert (=> b!178162 (= e!117443 Unit!5438)))

(declare-fun b!178163 () Bool)

(assert (=> b!178163 (= e!117442 (isDefined!150 (getValueByKey!197 (toList!1134 lt!87954) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53919 c!31931) b!178161))

(assert (= (and d!53919 (not c!31931)) b!178162))

(assert (= (and d!53919 (not res!84413)) b!178163))

(declare-fun m!206621 () Bool)

(assert (=> d!53919 m!206621))

(declare-fun m!206623 () Bool)

(assert (=> b!178161 m!206623))

(declare-fun m!206625 () Bool)

(assert (=> b!178161 m!206625))

(assert (=> b!178161 m!206625))

(declare-fun m!206627 () Bool)

(assert (=> b!178161 m!206627))

(assert (=> b!178163 m!206625))

(assert (=> b!178163 m!206625))

(assert (=> b!178163 m!206627))

(assert (=> bm!17993 d!53919))

(declare-fun d!53921 () Bool)

(declare-fun e!117444 () Bool)

(assert (=> d!53921 e!117444))

(declare-fun res!84414 () Bool)

(assert (=> d!53921 (=> res!84414 e!117444)))

(declare-fun lt!88066 () Bool)

(assert (=> d!53921 (= res!84414 (not lt!88066))))

(declare-fun lt!88064 () Bool)

(assert (=> d!53921 (= lt!88066 lt!88064)))

(declare-fun lt!88065 () Unit!5432)

(declare-fun e!117445 () Unit!5432)

(assert (=> d!53921 (= lt!88065 e!117445)))

(declare-fun c!31932 () Bool)

(assert (=> d!53921 (= c!31932 lt!88064)))

(assert (=> d!53921 (= lt!88064 (containsKey!201 (toList!1134 lt!87954) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53921 (= (contains!1202 lt!87954 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88066)))

(declare-fun b!178164 () Bool)

(declare-fun lt!88063 () Unit!5432)

(assert (=> b!178164 (= e!117445 lt!88063)))

(assert (=> b!178164 (= lt!88063 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1134 lt!87954) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178164 (isDefined!150 (getValueByKey!197 (toList!1134 lt!87954) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178165 () Bool)

(declare-fun Unit!5439 () Unit!5432)

(assert (=> b!178165 (= e!117445 Unit!5439)))

(declare-fun b!178166 () Bool)

(assert (=> b!178166 (= e!117444 (isDefined!150 (getValueByKey!197 (toList!1134 lt!87954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53921 c!31932) b!178164))

(assert (= (and d!53921 (not c!31932)) b!178165))

(assert (= (and d!53921 (not res!84414)) b!178166))

(declare-fun m!206629 () Bool)

(assert (=> d!53921 m!206629))

(declare-fun m!206631 () Bool)

(assert (=> b!178164 m!206631))

(declare-fun m!206633 () Bool)

(assert (=> b!178164 m!206633))

(assert (=> b!178164 m!206633))

(declare-fun m!206635 () Bool)

(assert (=> b!178164 m!206635))

(assert (=> b!178166 m!206633))

(assert (=> b!178166 m!206633))

(assert (=> b!178166 m!206635))

(assert (=> bm!17992 d!53921))

(declare-fun d!53923 () Bool)

(assert (=> d!53923 (= (apply!142 lt!87954 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2027 (getValueByKey!197 (toList!1134 lt!87954) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7316 () Bool)

(assert (= bs!7316 d!53923))

(assert (=> bs!7316 m!206625))

(assert (=> bs!7316 m!206625))

(declare-fun m!206637 () Bool)

(assert (=> bs!7316 m!206637))

(assert (=> b!177943 d!53923))

(declare-fun d!53925 () Bool)

(assert (=> d!53925 (= (apply!142 lt!87954 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2027 (getValueByKey!197 (toList!1134 lt!87954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7317 () Bool)

(assert (= bs!7317 d!53925))

(assert (=> bs!7317 m!206633))

(assert (=> bs!7317 m!206633))

(declare-fun m!206639 () Bool)

(assert (=> bs!7317 m!206639))

(assert (=> b!177933 d!53925))

(declare-fun mapIsEmpty!7127 () Bool)

(declare-fun mapRes!7127 () Bool)

(assert (=> mapIsEmpty!7127 mapRes!7127))

(declare-fun mapNonEmpty!7127 () Bool)

(declare-fun tp!15902 () Bool)

(declare-fun e!117447 () Bool)

(assert (=> mapNonEmpty!7127 (= mapRes!7127 (and tp!15902 e!117447))))

(declare-fun mapValue!7127 () ValueCell!1740)

(declare-fun mapRest!7127 () (Array (_ BitVec 32) ValueCell!1740))

(declare-fun mapKey!7127 () (_ BitVec 32))

(assert (=> mapNonEmpty!7127 (= mapRest!7126 (store mapRest!7127 mapKey!7127 mapValue!7127))))

(declare-fun b!178168 () Bool)

(declare-fun e!117446 () Bool)

(assert (=> b!178168 (= e!117446 tp_is_empty!4167)))

(declare-fun condMapEmpty!7127 () Bool)

(declare-fun mapDefault!7127 () ValueCell!1740)

(assert (=> mapNonEmpty!7126 (= condMapEmpty!7127 (= mapRest!7126 ((as const (Array (_ BitVec 32) ValueCell!1740)) mapDefault!7127)))))

(assert (=> mapNonEmpty!7126 (= tp!15901 (and e!117446 mapRes!7127))))

(declare-fun b!178167 () Bool)

(assert (=> b!178167 (= e!117447 tp_is_empty!4167)))

(assert (= (and mapNonEmpty!7126 condMapEmpty!7127) mapIsEmpty!7127))

(assert (= (and mapNonEmpty!7126 (not condMapEmpty!7127)) mapNonEmpty!7127))

(assert (= (and mapNonEmpty!7127 ((_ is ValueCellFull!1740) mapValue!7127)) b!178167))

(assert (= (and mapNonEmpty!7126 ((_ is ValueCellFull!1740) mapDefault!7127)) b!178168))

(declare-fun m!206641 () Bool)

(assert (=> mapNonEmpty!7127 m!206641))

(declare-fun b_lambda!7075 () Bool)

(assert (= b_lambda!7071 (or (and b!177829 b_free!4395) b_lambda!7075)))

(declare-fun b_lambda!7077 () Bool)

(assert (= b_lambda!7073 (or (and b!177829 b_free!4395) b_lambda!7077)))

(check-sat (not d!53863) (not b!178149) (not d!53883) (not d!53895) (not b!178121) (not bm!18001) (not d!53873) (not b!178056) (not d!53919) (not d!53893) (not b!178160) (not b!178126) (not b!178089) (not b!178139) (not d!53889) (not d!53881) (not d!53923) (not mapNonEmpty!7127) (not b!178032) (not d!53887) (not b!177987) (not b!178144) (not b!177996) (not b!178023) (not b!178031) (not d!53905) (not b!178125) (not b!178081) (not d!53865) (not b!178164) (not d!53917) (not b!178043) tp_is_empty!4167 (not b!177986) (not b!178158) (not b!178151) (not b!178143) (not d!53925) (not d!53907) (not b!178130) (not b!178147) (not d!53871) (not b!177983) (not d!53913) (not d!53921) (not b!178095) (not b_lambda!7077) (not b!178163) (not b!178133) (not d!53885) (not d!53897) (not b_next!4395) (not b!178067) (not b!178131) (not b!178066) (not b!178150) (not bm!17998) (not d!53911) (not b_lambda!7075) (not b!178120) (not d!53875) (not b_lambda!7069) (not b!178161) (not d!53899) (not b!177997) (not b!178166) b_and!10911 (not b!178124) (not d!53909) (not b!178094) (not b!178157) (not b!178140) (not d!53891) (not d!53859) (not bm!18007) (not b!178145) (not d!53903) (not b!178127) (not bm!18004) (not d!53901) (not b!178132) (not b!178146) (not d!53877))
(check-sat b_and!10911 (not b_next!4395))
