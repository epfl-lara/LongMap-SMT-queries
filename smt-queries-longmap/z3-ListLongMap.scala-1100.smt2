; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22568 () Bool)

(assert start!22568)

(declare-fun b!235972 () Bool)

(declare-fun b_free!6349 () Bool)

(declare-fun b_next!6349 () Bool)

(assert (=> b!235972 (= b_free!6349 (not b_next!6349))))

(declare-fun tp!22220 () Bool)

(declare-fun b_and!13295 () Bool)

(assert (=> b!235972 (= tp!22220 b_and!13295)))

(declare-fun b!235968 () Bool)

(declare-fun e!153243 () Bool)

(declare-fun tp_is_empty!6211 () Bool)

(assert (=> b!235968 (= e!153243 tp_is_empty!6211)))

(declare-fun b!235969 () Bool)

(declare-fun e!153245 () Bool)

(assert (=> b!235969 (= e!153245 tp_is_empty!6211)))

(declare-fun b!235970 () Bool)

(declare-fun res!115734 () Bool)

(declare-fun e!153242 () Bool)

(assert (=> b!235970 (=> (not res!115734) (not e!153242))))

(declare-datatypes ((V!7929 0))(
  ( (V!7930 (val!3150 Int)) )
))
(declare-datatypes ((ValueCell!2762 0))(
  ( (ValueCellFull!2762 (v!5180 V!7929)) (EmptyCell!2762) )
))
(declare-datatypes ((array!11681 0))(
  ( (array!11682 (arr!5551 (Array (_ BitVec 32) ValueCell!2762)) (size!5888 (_ BitVec 32))) )
))
(declare-datatypes ((array!11683 0))(
  ( (array!11684 (arr!5552 (Array (_ BitVec 32) (_ BitVec 64))) (size!5889 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3424 0))(
  ( (LongMapFixedSize!3425 (defaultEntry!4384 Int) (mask!10365 (_ BitVec 32)) (extraKeys!4121 (_ BitVec 32)) (zeroValue!4225 V!7929) (minValue!4225 V!7929) (_size!1761 (_ BitVec 32)) (_keys!6462 array!11683) (_values!4367 array!11681) (_vacant!1761 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3424)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4572 0))(
  ( (tuple2!4573 (_1!2297 (_ BitVec 64)) (_2!2297 V!7929)) )
))
(declare-datatypes ((List!3471 0))(
  ( (Nil!3468) (Cons!3467 (h!4119 tuple2!4572) (t!8440 List!3471)) )
))
(declare-datatypes ((ListLongMap!3487 0))(
  ( (ListLongMap!3488 (toList!1759 List!3471)) )
))
(declare-fun contains!1651 (ListLongMap!3487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1291 (array!11683 array!11681 (_ BitVec 32) (_ BitVec 32) V!7929 V!7929 (_ BitVec 32) Int) ListLongMap!3487)

(assert (=> b!235970 (= res!115734 (not (contains!1651 (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) key!932)))))

(declare-fun b!235971 () Bool)

(declare-fun res!115735 () Bool)

(declare-fun e!153246 () Bool)

(assert (=> b!235971 (=> (not res!115735) (not e!153246))))

(assert (=> b!235971 (= res!115735 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10517 () Bool)

(declare-fun mapRes!10517 () Bool)

(assert (=> mapIsEmpty!10517 mapRes!10517))

(declare-fun e!153247 () Bool)

(declare-fun e!153244 () Bool)

(declare-fun array_inv!3649 (array!11683) Bool)

(declare-fun array_inv!3650 (array!11681) Bool)

(assert (=> b!235972 (= e!153244 (and tp!22220 tp_is_empty!6211 (array_inv!3649 (_keys!6462 thiss!1504)) (array_inv!3650 (_values!4367 thiss!1504)) e!153247))))

(declare-fun b!235973 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235973 (= e!153242 (not (validMask!0 (mask!10365 thiss!1504))))))

(declare-fun res!115737 () Bool)

(assert (=> start!22568 (=> (not res!115737) (not e!153246))))

(declare-fun valid!1366 (LongMapFixedSize!3424) Bool)

(assert (=> start!22568 (= res!115737 (valid!1366 thiss!1504))))

(assert (=> start!22568 e!153246))

(assert (=> start!22568 e!153244))

(assert (=> start!22568 true))

(declare-fun b!235974 () Bool)

(assert (=> b!235974 (= e!153247 (and e!153243 mapRes!10517))))

(declare-fun condMapEmpty!10517 () Bool)

(declare-fun mapDefault!10517 () ValueCell!2762)

(assert (=> b!235974 (= condMapEmpty!10517 (= (arr!5551 (_values!4367 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2762)) mapDefault!10517)))))

(declare-fun mapNonEmpty!10517 () Bool)

(declare-fun tp!22219 () Bool)

(assert (=> mapNonEmpty!10517 (= mapRes!10517 (and tp!22219 e!153245))))

(declare-fun mapKey!10517 () (_ BitVec 32))

(declare-fun mapRest!10517 () (Array (_ BitVec 32) ValueCell!2762))

(declare-fun mapValue!10517 () ValueCell!2762)

(assert (=> mapNonEmpty!10517 (= (arr!5551 (_values!4367 thiss!1504)) (store mapRest!10517 mapKey!10517 mapValue!10517))))

(declare-fun b!235975 () Bool)

(assert (=> b!235975 (= e!153246 e!153242)))

(declare-fun res!115736 () Bool)

(assert (=> b!235975 (=> (not res!115736) (not e!153242))))

(declare-datatypes ((SeekEntryResult!970 0))(
  ( (MissingZero!970 (index!6050 (_ BitVec 32))) (Found!970 (index!6051 (_ BitVec 32))) (Intermediate!970 (undefined!1782 Bool) (index!6052 (_ BitVec 32)) (x!23808 (_ BitVec 32))) (Undefined!970) (MissingVacant!970 (index!6053 (_ BitVec 32))) )
))
(declare-fun lt!119334 () SeekEntryResult!970)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235975 (= res!115736 (or (= lt!119334 (MissingZero!970 index!297)) (= lt!119334 (MissingVacant!970 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11683 (_ BitVec 32)) SeekEntryResult!970)

(assert (=> b!235975 (= lt!119334 (seekEntryOrOpen!0 key!932 (_keys!6462 thiss!1504) (mask!10365 thiss!1504)))))

(assert (= (and start!22568 res!115737) b!235971))

(assert (= (and b!235971 res!115735) b!235975))

(assert (= (and b!235975 res!115736) b!235970))

(assert (= (and b!235970 res!115734) b!235973))

(assert (= (and b!235974 condMapEmpty!10517) mapIsEmpty!10517))

(assert (= (and b!235974 (not condMapEmpty!10517)) mapNonEmpty!10517))

(get-info :version)

(assert (= (and mapNonEmpty!10517 ((_ is ValueCellFull!2762) mapValue!10517)) b!235969))

(assert (= (and b!235974 ((_ is ValueCellFull!2762) mapDefault!10517)) b!235968))

(assert (= b!235972 b!235974))

(assert (= start!22568 b!235972))

(declare-fun m!257059 () Bool)

(assert (=> b!235970 m!257059))

(assert (=> b!235970 m!257059))

(declare-fun m!257061 () Bool)

(assert (=> b!235970 m!257061))

(declare-fun m!257063 () Bool)

(assert (=> mapNonEmpty!10517 m!257063))

(declare-fun m!257065 () Bool)

(assert (=> b!235975 m!257065))

(declare-fun m!257067 () Bool)

(assert (=> b!235972 m!257067))

(declare-fun m!257069 () Bool)

(assert (=> b!235972 m!257069))

(declare-fun m!257071 () Bool)

(assert (=> b!235973 m!257071))

(declare-fun m!257073 () Bool)

(assert (=> start!22568 m!257073))

(check-sat (not start!22568) (not b!235970) (not b_next!6349) (not b!235973) tp_is_empty!6211 (not b!235972) (not mapNonEmpty!10517) b_and!13295 (not b!235975))
(check-sat b_and!13295 (not b_next!6349))
(get-model)

(declare-fun d!59393 () Bool)

(assert (=> d!59393 (= (array_inv!3649 (_keys!6462 thiss!1504)) (bvsge (size!5889 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235972 d!59393))

(declare-fun d!59395 () Bool)

(assert (=> d!59395 (= (array_inv!3650 (_values!4367 thiss!1504)) (bvsge (size!5888 (_values!4367 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235972 d!59395))

(declare-fun d!59397 () Bool)

(assert (=> d!59397 (= (validMask!0 (mask!10365 thiss!1504)) (and (or (= (mask!10365 thiss!1504) #b00000000000000000000000000000111) (= (mask!10365 thiss!1504) #b00000000000000000000000000001111) (= (mask!10365 thiss!1504) #b00000000000000000000000000011111) (= (mask!10365 thiss!1504) #b00000000000000000000000000111111) (= (mask!10365 thiss!1504) #b00000000000000000000000001111111) (= (mask!10365 thiss!1504) #b00000000000000000000000011111111) (= (mask!10365 thiss!1504) #b00000000000000000000000111111111) (= (mask!10365 thiss!1504) #b00000000000000000000001111111111) (= (mask!10365 thiss!1504) #b00000000000000000000011111111111) (= (mask!10365 thiss!1504) #b00000000000000000000111111111111) (= (mask!10365 thiss!1504) #b00000000000000000001111111111111) (= (mask!10365 thiss!1504) #b00000000000000000011111111111111) (= (mask!10365 thiss!1504) #b00000000000000000111111111111111) (= (mask!10365 thiss!1504) #b00000000000000001111111111111111) (= (mask!10365 thiss!1504) #b00000000000000011111111111111111) (= (mask!10365 thiss!1504) #b00000000000000111111111111111111) (= (mask!10365 thiss!1504) #b00000000000001111111111111111111) (= (mask!10365 thiss!1504) #b00000000000011111111111111111111) (= (mask!10365 thiss!1504) #b00000000000111111111111111111111) (= (mask!10365 thiss!1504) #b00000000001111111111111111111111) (= (mask!10365 thiss!1504) #b00000000011111111111111111111111) (= (mask!10365 thiss!1504) #b00000000111111111111111111111111) (= (mask!10365 thiss!1504) #b00000001111111111111111111111111) (= (mask!10365 thiss!1504) #b00000011111111111111111111111111) (= (mask!10365 thiss!1504) #b00000111111111111111111111111111) (= (mask!10365 thiss!1504) #b00001111111111111111111111111111) (= (mask!10365 thiss!1504) #b00011111111111111111111111111111) (= (mask!10365 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10365 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235973 d!59397))

(declare-fun d!59399 () Bool)

(declare-fun e!153294 () Bool)

(assert (=> d!59399 e!153294))

(declare-fun res!115764 () Bool)

(assert (=> d!59399 (=> res!115764 e!153294)))

(declare-fun lt!119350 () Bool)

(assert (=> d!59399 (= res!115764 (not lt!119350))))

(declare-fun lt!119352 () Bool)

(assert (=> d!59399 (= lt!119350 lt!119352)))

(declare-datatypes ((Unit!7255 0))(
  ( (Unit!7256) )
))
(declare-fun lt!119349 () Unit!7255)

(declare-fun e!153295 () Unit!7255)

(assert (=> d!59399 (= lt!119349 e!153295)))

(declare-fun c!39296 () Bool)

(assert (=> d!59399 (= c!39296 lt!119352)))

(declare-fun containsKey!262 (List!3471 (_ BitVec 64)) Bool)

(assert (=> d!59399 (= lt!119352 (containsKey!262 (toList!1759 (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932))))

(assert (=> d!59399 (= (contains!1651 (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) key!932) lt!119350)))

(declare-fun b!236030 () Bool)

(declare-fun lt!119351 () Unit!7255)

(assert (=> b!236030 (= e!153295 lt!119351)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!210 (List!3471 (_ BitVec 64)) Unit!7255)

(assert (=> b!236030 (= lt!119351 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1759 (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932))))

(declare-datatypes ((Option!277 0))(
  ( (Some!276 (v!5183 V!7929)) (None!275) )
))
(declare-fun isDefined!211 (Option!277) Bool)

(declare-fun getValueByKey!271 (List!3471 (_ BitVec 64)) Option!277)

(assert (=> b!236030 (isDefined!211 (getValueByKey!271 (toList!1759 (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932))))

(declare-fun b!236031 () Bool)

(declare-fun Unit!7257 () Unit!7255)

(assert (=> b!236031 (= e!153295 Unit!7257)))

(declare-fun b!236032 () Bool)

(assert (=> b!236032 (= e!153294 (isDefined!211 (getValueByKey!271 (toList!1759 (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932)))))

(assert (= (and d!59399 c!39296) b!236030))

(assert (= (and d!59399 (not c!39296)) b!236031))

(assert (= (and d!59399 (not res!115764)) b!236032))

(declare-fun m!257107 () Bool)

(assert (=> d!59399 m!257107))

(declare-fun m!257109 () Bool)

(assert (=> b!236030 m!257109))

(declare-fun m!257111 () Bool)

(assert (=> b!236030 m!257111))

(assert (=> b!236030 m!257111))

(declare-fun m!257113 () Bool)

(assert (=> b!236030 m!257113))

(assert (=> b!236032 m!257111))

(assert (=> b!236032 m!257111))

(assert (=> b!236032 m!257113))

(assert (=> b!235970 d!59399))

(declare-fun b!236075 () Bool)

(declare-fun e!153333 () ListLongMap!3487)

(declare-fun call!21933 () ListLongMap!3487)

(declare-fun +!639 (ListLongMap!3487 tuple2!4572) ListLongMap!3487)

(assert (=> b!236075 (= e!153333 (+!639 call!21933 (tuple2!4573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4225 thiss!1504))))))

(declare-fun b!236076 () Bool)

(declare-fun e!153328 () Unit!7255)

(declare-fun lt!119417 () Unit!7255)

(assert (=> b!236076 (= e!153328 lt!119417)))

(declare-fun lt!119414 () ListLongMap!3487)

(declare-fun getCurrentListMapNoExtraKeys!528 (array!11683 array!11681 (_ BitVec 32) (_ BitVec 32) V!7929 V!7929 (_ BitVec 32) Int) ListLongMap!3487)

(assert (=> b!236076 (= lt!119414 (getCurrentListMapNoExtraKeys!528 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119415 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119415 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119405 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119405 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119418 () Unit!7255)

(declare-fun addStillContains!188 (ListLongMap!3487 (_ BitVec 64) V!7929 (_ BitVec 64)) Unit!7255)

(assert (=> b!236076 (= lt!119418 (addStillContains!188 lt!119414 lt!119415 (zeroValue!4225 thiss!1504) lt!119405))))

(assert (=> b!236076 (contains!1651 (+!639 lt!119414 (tuple2!4573 lt!119415 (zeroValue!4225 thiss!1504))) lt!119405)))

(declare-fun lt!119406 () Unit!7255)

(assert (=> b!236076 (= lt!119406 lt!119418)))

(declare-fun lt!119409 () ListLongMap!3487)

(assert (=> b!236076 (= lt!119409 (getCurrentListMapNoExtraKeys!528 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119410 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119410 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119397 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119397 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119400 () Unit!7255)

(declare-fun addApplyDifferent!188 (ListLongMap!3487 (_ BitVec 64) V!7929 (_ BitVec 64)) Unit!7255)

(assert (=> b!236076 (= lt!119400 (addApplyDifferent!188 lt!119409 lt!119410 (minValue!4225 thiss!1504) lt!119397))))

(declare-fun apply!212 (ListLongMap!3487 (_ BitVec 64)) V!7929)

(assert (=> b!236076 (= (apply!212 (+!639 lt!119409 (tuple2!4573 lt!119410 (minValue!4225 thiss!1504))) lt!119397) (apply!212 lt!119409 lt!119397))))

(declare-fun lt!119401 () Unit!7255)

(assert (=> b!236076 (= lt!119401 lt!119400)))

(declare-fun lt!119408 () ListLongMap!3487)

(assert (=> b!236076 (= lt!119408 (getCurrentListMapNoExtraKeys!528 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119399 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119412 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119412 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119413 () Unit!7255)

(assert (=> b!236076 (= lt!119413 (addApplyDifferent!188 lt!119408 lt!119399 (zeroValue!4225 thiss!1504) lt!119412))))

(assert (=> b!236076 (= (apply!212 (+!639 lt!119408 (tuple2!4573 lt!119399 (zeroValue!4225 thiss!1504))) lt!119412) (apply!212 lt!119408 lt!119412))))

(declare-fun lt!119407 () Unit!7255)

(assert (=> b!236076 (= lt!119407 lt!119413)))

(declare-fun lt!119404 () ListLongMap!3487)

(assert (=> b!236076 (= lt!119404 (getCurrentListMapNoExtraKeys!528 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119398 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119402 () (_ BitVec 64))

(assert (=> b!236076 (= lt!119402 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236076 (= lt!119417 (addApplyDifferent!188 lt!119404 lt!119398 (minValue!4225 thiss!1504) lt!119402))))

(assert (=> b!236076 (= (apply!212 (+!639 lt!119404 (tuple2!4573 lt!119398 (minValue!4225 thiss!1504))) lt!119402) (apply!212 lt!119404 lt!119402))))

(declare-fun bm!21930 () Bool)

(declare-fun call!21939 () ListLongMap!3487)

(declare-fun call!21936 () ListLongMap!3487)

(assert (=> bm!21930 (= call!21939 call!21936)))

(declare-fun b!236077 () Bool)

(declare-fun e!153322 () Bool)

(declare-fun e!153331 () Bool)

(assert (=> b!236077 (= e!153322 e!153331)))

(declare-fun c!39312 () Bool)

(assert (=> b!236077 (= c!39312 (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21931 () Bool)

(declare-fun call!21938 () Bool)

(declare-fun lt!119416 () ListLongMap!3487)

(assert (=> bm!21931 (= call!21938 (contains!1651 lt!119416 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236078 () Bool)

(declare-fun c!39310 () Bool)

(assert (=> b!236078 (= c!39310 (and (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!153323 () ListLongMap!3487)

(declare-fun e!153326 () ListLongMap!3487)

(assert (=> b!236078 (= e!153323 e!153326)))

(declare-fun b!236079 () Bool)

(declare-fun call!21937 () ListLongMap!3487)

(assert (=> b!236079 (= e!153323 call!21937)))

(declare-fun b!236081 () Bool)

(declare-fun e!153329 () Bool)

(declare-fun e!153327 () Bool)

(assert (=> b!236081 (= e!153329 e!153327)))

(declare-fun res!115784 () Bool)

(assert (=> b!236081 (=> (not res!115784) (not e!153327))))

(assert (=> b!236081 (= res!115784 (contains!1651 lt!119416 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))))))

(declare-fun b!236082 () Bool)

(declare-fun res!115785 () Bool)

(assert (=> b!236082 (=> (not res!115785) (not e!153322))))

(declare-fun e!153330 () Bool)

(assert (=> b!236082 (= res!115785 e!153330)))

(declare-fun c!39311 () Bool)

(assert (=> b!236082 (= c!39311 (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236083 () Bool)

(declare-fun res!115787 () Bool)

(assert (=> b!236083 (=> (not res!115787) (not e!153322))))

(assert (=> b!236083 (= res!115787 e!153329)))

(declare-fun res!115786 () Bool)

(assert (=> b!236083 (=> res!115786 e!153329)))

(declare-fun e!153324 () Bool)

(assert (=> b!236083 (= res!115786 (not e!153324))))

(declare-fun res!115788 () Bool)

(assert (=> b!236083 (=> (not res!115788) (not e!153324))))

(assert (=> b!236083 (= res!115788 (bvslt #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))))))

(declare-fun bm!21932 () Bool)

(declare-fun call!21934 () ListLongMap!3487)

(assert (=> bm!21932 (= call!21934 (getCurrentListMapNoExtraKeys!528 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun b!236084 () Bool)

(assert (=> b!236084 (= e!153331 (not call!21938))))

(declare-fun bm!21933 () Bool)

(assert (=> bm!21933 (= call!21936 call!21934)))

(declare-fun b!236085 () Bool)

(declare-fun Unit!7258 () Unit!7255)

(assert (=> b!236085 (= e!153328 Unit!7258)))

(declare-fun b!236086 () Bool)

(declare-fun e!153325 () Bool)

(assert (=> b!236086 (= e!153325 (= (apply!212 lt!119416 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4225 thiss!1504)))))

(declare-fun bm!21934 () Bool)

(declare-fun c!39309 () Bool)

(declare-fun c!39314 () Bool)

(assert (=> bm!21934 (= call!21933 (+!639 (ite c!39309 call!21934 (ite c!39314 call!21936 call!21939)) (ite (or c!39309 c!39314) (tuple2!4573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4225 thiss!1504)) (tuple2!4573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4225 thiss!1504)))))))

(declare-fun b!236087 () Bool)

(assert (=> b!236087 (= e!153333 e!153323)))

(assert (=> b!236087 (= c!39314 (and (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236088 () Bool)

(declare-fun get!2859 (ValueCell!2762 V!7929) V!7929)

(declare-fun dynLambda!555 (Int (_ BitVec 64)) V!7929)

(assert (=> b!236088 (= e!153327 (= (apply!212 lt!119416 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000)) (get!2859 (select (arr!5551 (_values!4367 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4384 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5888 (_values!4367 thiss!1504))))))

(assert (=> b!236088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))))))

(declare-fun bm!21935 () Bool)

(declare-fun call!21935 () Bool)

(assert (=> bm!21935 (= call!21935 (contains!1651 lt!119416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236089 () Bool)

(assert (=> b!236089 (= e!153330 (not call!21935))))

(declare-fun b!236090 () Bool)

(declare-fun e!153332 () Bool)

(assert (=> b!236090 (= e!153331 e!153332)))

(declare-fun res!115790 () Bool)

(assert (=> b!236090 (= res!115790 call!21938)))

(assert (=> b!236090 (=> (not res!115790) (not e!153332))))

(declare-fun b!236091 () Bool)

(declare-fun e!153334 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236091 (= e!153334 (validKeyInArray!0 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236092 () Bool)

(assert (=> b!236092 (= e!153332 (= (apply!212 lt!119416 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4225 thiss!1504)))))

(declare-fun d!59401 () Bool)

(assert (=> d!59401 e!153322))

(declare-fun res!115791 () Bool)

(assert (=> d!59401 (=> (not res!115791) (not e!153322))))

(assert (=> d!59401 (= res!115791 (or (bvsge #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))))))))

(declare-fun lt!119403 () ListLongMap!3487)

(assert (=> d!59401 (= lt!119416 lt!119403)))

(declare-fun lt!119411 () Unit!7255)

(assert (=> d!59401 (= lt!119411 e!153328)))

(declare-fun c!39313 () Bool)

(assert (=> d!59401 (= c!39313 e!153334)))

(declare-fun res!115783 () Bool)

(assert (=> d!59401 (=> (not res!115783) (not e!153334))))

(assert (=> d!59401 (= res!115783 (bvslt #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))))))

(assert (=> d!59401 (= lt!119403 e!153333)))

(assert (=> d!59401 (= c!39309 (and (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59401 (validMask!0 (mask!10365 thiss!1504))))

(assert (=> d!59401 (= (getCurrentListMap!1291 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) lt!119416)))

(declare-fun b!236080 () Bool)

(assert (=> b!236080 (= e!153330 e!153325)))

(declare-fun res!115789 () Bool)

(assert (=> b!236080 (= res!115789 call!21935)))

(assert (=> b!236080 (=> (not res!115789) (not e!153325))))

(declare-fun b!236093 () Bool)

(assert (=> b!236093 (= e!153326 call!21939)))

(declare-fun b!236094 () Bool)

(assert (=> b!236094 (= e!153326 call!21937)))

(declare-fun bm!21936 () Bool)

(assert (=> bm!21936 (= call!21937 call!21933)))

(declare-fun b!236095 () Bool)

(assert (=> b!236095 (= e!153324 (validKeyInArray!0 (select (arr!5552 (_keys!6462 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59401 c!39309) b!236075))

(assert (= (and d!59401 (not c!39309)) b!236087))

(assert (= (and b!236087 c!39314) b!236079))

(assert (= (and b!236087 (not c!39314)) b!236078))

(assert (= (and b!236078 c!39310) b!236094))

(assert (= (and b!236078 (not c!39310)) b!236093))

(assert (= (or b!236094 b!236093) bm!21930))

(assert (= (or b!236079 bm!21930) bm!21933))

(assert (= (or b!236079 b!236094) bm!21936))

(assert (= (or b!236075 bm!21933) bm!21932))

(assert (= (or b!236075 bm!21936) bm!21934))

(assert (= (and d!59401 res!115783) b!236091))

(assert (= (and d!59401 c!39313) b!236076))

(assert (= (and d!59401 (not c!39313)) b!236085))

(assert (= (and d!59401 res!115791) b!236083))

(assert (= (and b!236083 res!115788) b!236095))

(assert (= (and b!236083 (not res!115786)) b!236081))

(assert (= (and b!236081 res!115784) b!236088))

(assert (= (and b!236083 res!115787) b!236082))

(assert (= (and b!236082 c!39311) b!236080))

(assert (= (and b!236082 (not c!39311)) b!236089))

(assert (= (and b!236080 res!115789) b!236086))

(assert (= (or b!236080 b!236089) bm!21935))

(assert (= (and b!236082 res!115785) b!236077))

(assert (= (and b!236077 c!39312) b!236090))

(assert (= (and b!236077 (not c!39312)) b!236084))

(assert (= (and b!236090 res!115790) b!236092))

(assert (= (or b!236090 b!236084) bm!21931))

(declare-fun b_lambda!7933 () Bool)

(assert (=> (not b_lambda!7933) (not b!236088)))

(declare-fun t!8442 () Bool)

(declare-fun tb!2929 () Bool)

(assert (=> (and b!235972 (= (defaultEntry!4384 thiss!1504) (defaultEntry!4384 thiss!1504)) t!8442) tb!2929))

(declare-fun result!5125 () Bool)

(assert (=> tb!2929 (= result!5125 tp_is_empty!6211)))

(assert (=> b!236088 t!8442))

(declare-fun b_and!13301 () Bool)

(assert (= b_and!13295 (and (=> t!8442 result!5125) b_and!13301)))

(declare-fun m!257115 () Bool)

(assert (=> bm!21934 m!257115))

(declare-fun m!257117 () Bool)

(assert (=> b!236076 m!257117))

(assert (=> b!236076 m!257117))

(declare-fun m!257119 () Bool)

(assert (=> b!236076 m!257119))

(declare-fun m!257121 () Bool)

(assert (=> b!236076 m!257121))

(declare-fun m!257123 () Bool)

(assert (=> b!236076 m!257123))

(declare-fun m!257125 () Bool)

(assert (=> b!236076 m!257125))

(declare-fun m!257127 () Bool)

(assert (=> b!236076 m!257127))

(declare-fun m!257129 () Bool)

(assert (=> b!236076 m!257129))

(declare-fun m!257131 () Bool)

(assert (=> b!236076 m!257131))

(declare-fun m!257133 () Bool)

(assert (=> b!236076 m!257133))

(declare-fun m!257135 () Bool)

(assert (=> b!236076 m!257135))

(declare-fun m!257137 () Bool)

(assert (=> b!236076 m!257137))

(declare-fun m!257139 () Bool)

(assert (=> b!236076 m!257139))

(assert (=> b!236076 m!257129))

(declare-fun m!257141 () Bool)

(assert (=> b!236076 m!257141))

(declare-fun m!257143 () Bool)

(assert (=> b!236076 m!257143))

(assert (=> b!236076 m!257135))

(declare-fun m!257145 () Bool)

(assert (=> b!236076 m!257145))

(declare-fun m!257147 () Bool)

(assert (=> b!236076 m!257147))

(assert (=> b!236076 m!257139))

(declare-fun m!257149 () Bool)

(assert (=> b!236076 m!257149))

(assert (=> b!236091 m!257147))

(assert (=> b!236091 m!257147))

(declare-fun m!257151 () Bool)

(assert (=> b!236091 m!257151))

(assert (=> b!236081 m!257147))

(assert (=> b!236081 m!257147))

(declare-fun m!257153 () Bool)

(assert (=> b!236081 m!257153))

(declare-fun m!257155 () Bool)

(assert (=> b!236075 m!257155))

(declare-fun m!257157 () Bool)

(assert (=> bm!21935 m!257157))

(assert (=> b!236088 m!257147))

(assert (=> b!236088 m!257147))

(declare-fun m!257159 () Bool)

(assert (=> b!236088 m!257159))

(declare-fun m!257161 () Bool)

(assert (=> b!236088 m!257161))

(declare-fun m!257163 () Bool)

(assert (=> b!236088 m!257163))

(assert (=> b!236088 m!257161))

(declare-fun m!257165 () Bool)

(assert (=> b!236088 m!257165))

(assert (=> b!236088 m!257163))

(assert (=> bm!21932 m!257121))

(declare-fun m!257167 () Bool)

(assert (=> b!236086 m!257167))

(declare-fun m!257169 () Bool)

(assert (=> bm!21931 m!257169))

(assert (=> b!236095 m!257147))

(assert (=> b!236095 m!257147))

(assert (=> b!236095 m!257151))

(assert (=> d!59401 m!257071))

(declare-fun m!257171 () Bool)

(assert (=> b!236092 m!257171))

(assert (=> b!235970 d!59401))

(declare-fun d!59403 () Bool)

(declare-fun res!115798 () Bool)

(declare-fun e!153337 () Bool)

(assert (=> d!59403 (=> (not res!115798) (not e!153337))))

(declare-fun simpleValid!235 (LongMapFixedSize!3424) Bool)

(assert (=> d!59403 (= res!115798 (simpleValid!235 thiss!1504))))

(assert (=> d!59403 (= (valid!1366 thiss!1504) e!153337)))

(declare-fun b!236104 () Bool)

(declare-fun res!115799 () Bool)

(assert (=> b!236104 (=> (not res!115799) (not e!153337))))

(declare-fun arrayCountValidKeys!0 (array!11683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236104 (= res!115799 (= (arrayCountValidKeys!0 (_keys!6462 thiss!1504) #b00000000000000000000000000000000 (size!5889 (_keys!6462 thiss!1504))) (_size!1761 thiss!1504)))))

(declare-fun b!236105 () Bool)

(declare-fun res!115800 () Bool)

(assert (=> b!236105 (=> (not res!115800) (not e!153337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11683 (_ BitVec 32)) Bool)

(assert (=> b!236105 (= res!115800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6462 thiss!1504) (mask!10365 thiss!1504)))))

(declare-fun b!236106 () Bool)

(declare-datatypes ((List!3472 0))(
  ( (Nil!3469) (Cons!3468 (h!4120 (_ BitVec 64)) (t!8443 List!3472)) )
))
(declare-fun arrayNoDuplicates!0 (array!11683 (_ BitVec 32) List!3472) Bool)

(assert (=> b!236106 (= e!153337 (arrayNoDuplicates!0 (_keys!6462 thiss!1504) #b00000000000000000000000000000000 Nil!3469))))

(assert (= (and d!59403 res!115798) b!236104))

(assert (= (and b!236104 res!115799) b!236105))

(assert (= (and b!236105 res!115800) b!236106))

(declare-fun m!257173 () Bool)

(assert (=> d!59403 m!257173))

(declare-fun m!257175 () Bool)

(assert (=> b!236104 m!257175))

(declare-fun m!257177 () Bool)

(assert (=> b!236105 m!257177))

(declare-fun m!257179 () Bool)

(assert (=> b!236106 m!257179))

(assert (=> start!22568 d!59403))

(declare-fun b!236119 () Bool)

(declare-fun e!153346 () SeekEntryResult!970)

(assert (=> b!236119 (= e!153346 Undefined!970)))

(declare-fun e!153344 () SeekEntryResult!970)

(declare-fun lt!119425 () SeekEntryResult!970)

(declare-fun b!236120 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11683 (_ BitVec 32)) SeekEntryResult!970)

(assert (=> b!236120 (= e!153344 (seekKeyOrZeroReturnVacant!0 (x!23808 lt!119425) (index!6052 lt!119425) (index!6052 lt!119425) key!932 (_keys!6462 thiss!1504) (mask!10365 thiss!1504)))))

(declare-fun b!236121 () Bool)

(assert (=> b!236121 (= e!153344 (MissingZero!970 (index!6052 lt!119425)))))

(declare-fun b!236122 () Bool)

(declare-fun e!153345 () SeekEntryResult!970)

(assert (=> b!236122 (= e!153345 (Found!970 (index!6052 lt!119425)))))

(declare-fun b!236123 () Bool)

(declare-fun c!39321 () Bool)

(declare-fun lt!119427 () (_ BitVec 64))

(assert (=> b!236123 (= c!39321 (= lt!119427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236123 (= e!153345 e!153344)))

(declare-fun b!236124 () Bool)

(assert (=> b!236124 (= e!153346 e!153345)))

(assert (=> b!236124 (= lt!119427 (select (arr!5552 (_keys!6462 thiss!1504)) (index!6052 lt!119425)))))

(declare-fun c!39322 () Bool)

(assert (=> b!236124 (= c!39322 (= lt!119427 key!932))))

(declare-fun d!59405 () Bool)

(declare-fun lt!119426 () SeekEntryResult!970)

(assert (=> d!59405 (and (or ((_ is Undefined!970) lt!119426) (not ((_ is Found!970) lt!119426)) (and (bvsge (index!6051 lt!119426) #b00000000000000000000000000000000) (bvslt (index!6051 lt!119426) (size!5889 (_keys!6462 thiss!1504))))) (or ((_ is Undefined!970) lt!119426) ((_ is Found!970) lt!119426) (not ((_ is MissingZero!970) lt!119426)) (and (bvsge (index!6050 lt!119426) #b00000000000000000000000000000000) (bvslt (index!6050 lt!119426) (size!5889 (_keys!6462 thiss!1504))))) (or ((_ is Undefined!970) lt!119426) ((_ is Found!970) lt!119426) ((_ is MissingZero!970) lt!119426) (not ((_ is MissingVacant!970) lt!119426)) (and (bvsge (index!6053 lt!119426) #b00000000000000000000000000000000) (bvslt (index!6053 lt!119426) (size!5889 (_keys!6462 thiss!1504))))) (or ((_ is Undefined!970) lt!119426) (ite ((_ is Found!970) lt!119426) (= (select (arr!5552 (_keys!6462 thiss!1504)) (index!6051 lt!119426)) key!932) (ite ((_ is MissingZero!970) lt!119426) (= (select (arr!5552 (_keys!6462 thiss!1504)) (index!6050 lt!119426)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!970) lt!119426) (= (select (arr!5552 (_keys!6462 thiss!1504)) (index!6053 lt!119426)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59405 (= lt!119426 e!153346)))

(declare-fun c!39323 () Bool)

(assert (=> d!59405 (= c!39323 (and ((_ is Intermediate!970) lt!119425) (undefined!1782 lt!119425)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11683 (_ BitVec 32)) SeekEntryResult!970)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59405 (= lt!119425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10365 thiss!1504)) key!932 (_keys!6462 thiss!1504) (mask!10365 thiss!1504)))))

(assert (=> d!59405 (validMask!0 (mask!10365 thiss!1504))))

(assert (=> d!59405 (= (seekEntryOrOpen!0 key!932 (_keys!6462 thiss!1504) (mask!10365 thiss!1504)) lt!119426)))

(assert (= (and d!59405 c!39323) b!236119))

(assert (= (and d!59405 (not c!39323)) b!236124))

(assert (= (and b!236124 c!39322) b!236122))

(assert (= (and b!236124 (not c!39322)) b!236123))

(assert (= (and b!236123 c!39321) b!236121))

(assert (= (and b!236123 (not c!39321)) b!236120))

(declare-fun m!257181 () Bool)

(assert (=> b!236120 m!257181))

(declare-fun m!257183 () Bool)

(assert (=> b!236124 m!257183))

(declare-fun m!257185 () Bool)

(assert (=> d!59405 m!257185))

(declare-fun m!257187 () Bool)

(assert (=> d!59405 m!257187))

(declare-fun m!257189 () Bool)

(assert (=> d!59405 m!257189))

(assert (=> d!59405 m!257071))

(declare-fun m!257191 () Bool)

(assert (=> d!59405 m!257191))

(declare-fun m!257193 () Bool)

(assert (=> d!59405 m!257193))

(assert (=> d!59405 m!257191))

(assert (=> b!235975 d!59405))

(declare-fun condMapEmpty!10526 () Bool)

(declare-fun mapDefault!10526 () ValueCell!2762)

(assert (=> mapNonEmpty!10517 (= condMapEmpty!10526 (= mapRest!10517 ((as const (Array (_ BitVec 32) ValueCell!2762)) mapDefault!10526)))))

(declare-fun e!153351 () Bool)

(declare-fun mapRes!10526 () Bool)

(assert (=> mapNonEmpty!10517 (= tp!22219 (and e!153351 mapRes!10526))))

(declare-fun b!236132 () Bool)

(assert (=> b!236132 (= e!153351 tp_is_empty!6211)))

(declare-fun mapIsEmpty!10526 () Bool)

(assert (=> mapIsEmpty!10526 mapRes!10526))

(declare-fun b!236131 () Bool)

(declare-fun e!153352 () Bool)

(assert (=> b!236131 (= e!153352 tp_is_empty!6211)))

(declare-fun mapNonEmpty!10526 () Bool)

(declare-fun tp!22235 () Bool)

(assert (=> mapNonEmpty!10526 (= mapRes!10526 (and tp!22235 e!153352))))

(declare-fun mapRest!10526 () (Array (_ BitVec 32) ValueCell!2762))

(declare-fun mapKey!10526 () (_ BitVec 32))

(declare-fun mapValue!10526 () ValueCell!2762)

(assert (=> mapNonEmpty!10526 (= mapRest!10517 (store mapRest!10526 mapKey!10526 mapValue!10526))))

(assert (= (and mapNonEmpty!10517 condMapEmpty!10526) mapIsEmpty!10526))

(assert (= (and mapNonEmpty!10517 (not condMapEmpty!10526)) mapNonEmpty!10526))

(assert (= (and mapNonEmpty!10526 ((_ is ValueCellFull!2762) mapValue!10526)) b!236131))

(assert (= (and mapNonEmpty!10517 ((_ is ValueCellFull!2762) mapDefault!10526)) b!236132))

(declare-fun m!257195 () Bool)

(assert (=> mapNonEmpty!10526 m!257195))

(declare-fun b_lambda!7935 () Bool)

(assert (= b_lambda!7933 (or (and b!235972 b_free!6349) b_lambda!7935)))

(check-sat (not b!236120) (not b!236104) (not b!236106) (not b!236088) (not bm!21932) b_and!13301 (not d!59403) (not b!236091) (not b_next!6349) (not b_lambda!7935) (not b!236105) (not b!236032) (not b!236076) (not b!236095) (not d!59405) (not bm!21931) (not b!236075) (not d!59399) (not bm!21934) (not b!236092) (not b!236086) tp_is_empty!6211 (not b!236030) (not mapNonEmpty!10526) (not d!59401) (not b!236081) (not bm!21935))
(check-sat b_and!13301 (not b_next!6349))
