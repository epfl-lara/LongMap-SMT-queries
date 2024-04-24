; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22484 () Bool)

(assert start!22484)

(declare-fun b!235096 () Bool)

(declare-fun b_free!6319 () Bool)

(declare-fun b_next!6319 () Bool)

(assert (=> b!235096 (= b_free!6319 (not b_next!6319))))

(declare-fun tp!22121 () Bool)

(declare-fun b_and!13259 () Bool)

(assert (=> b!235096 (= tp!22121 b_and!13259)))

(declare-fun b!235094 () Bool)

(declare-fun res!115281 () Bool)

(declare-fun e!152683 () Bool)

(assert (=> b!235094 (=> (not res!115281) (not e!152683))))

(declare-datatypes ((V!7889 0))(
  ( (V!7890 (val!3135 Int)) )
))
(declare-datatypes ((ValueCell!2747 0))(
  ( (ValueCellFull!2747 (v!5162 V!7889)) (EmptyCell!2747) )
))
(declare-datatypes ((array!11615 0))(
  ( (array!11616 (arr!5521 (Array (_ BitVec 32) ValueCell!2747)) (size!5858 (_ BitVec 32))) )
))
(declare-datatypes ((array!11617 0))(
  ( (array!11618 (arr!5522 (Array (_ BitVec 32) (_ BitVec 64))) (size!5859 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3394 0))(
  ( (LongMapFixedSize!3395 (defaultEntry!4366 Int) (mask!10328 (_ BitVec 32)) (extraKeys!4103 (_ BitVec 32)) (zeroValue!4207 V!7889) (minValue!4207 V!7889) (_size!1746 (_ BitVec 32)) (_keys!6438 array!11617) (_values!4349 array!11615) (_vacant!1746 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3394)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235094 (= res!115281 (validMask!0 (mask!10328 thiss!1504)))))

(declare-fun mapIsEmpty!10463 () Bool)

(declare-fun mapRes!10463 () Bool)

(assert (=> mapIsEmpty!10463 mapRes!10463))

(declare-fun b!235095 () Bool)

(declare-fun e!152680 () Bool)

(declare-fun tp_is_empty!6181 () Bool)

(assert (=> b!235095 (= e!152680 tp_is_empty!6181)))

(declare-fun e!152677 () Bool)

(declare-fun e!152682 () Bool)

(declare-fun array_inv!3623 (array!11617) Bool)

(declare-fun array_inv!3624 (array!11615) Bool)

(assert (=> b!235096 (= e!152682 (and tp!22121 tp_is_empty!6181 (array_inv!3623 (_keys!6438 thiss!1504)) (array_inv!3624 (_values!4349 thiss!1504)) e!152677))))

(declare-fun b!235097 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11617 (_ BitVec 32)) Bool)

(assert (=> b!235097 (= e!152683 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6438 thiss!1504) (mask!10328 thiss!1504))))))

(declare-fun mapNonEmpty!10463 () Bool)

(declare-fun tp!22120 () Bool)

(declare-fun e!152681 () Bool)

(assert (=> mapNonEmpty!10463 (= mapRes!10463 (and tp!22120 e!152681))))

(declare-fun mapRest!10463 () (Array (_ BitVec 32) ValueCell!2747))

(declare-fun mapValue!10463 () ValueCell!2747)

(declare-fun mapKey!10463 () (_ BitVec 32))

(assert (=> mapNonEmpty!10463 (= (arr!5521 (_values!4349 thiss!1504)) (store mapRest!10463 mapKey!10463 mapValue!10463))))

(declare-fun b!235098 () Bool)

(declare-fun res!115283 () Bool)

(assert (=> b!235098 (=> (not res!115283) (not e!152683))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4552 0))(
  ( (tuple2!4553 (_1!2287 (_ BitVec 64)) (_2!2287 V!7889)) )
))
(declare-datatypes ((List!3453 0))(
  ( (Nil!3450) (Cons!3449 (h!4101 tuple2!4552) (t!8416 List!3453)) )
))
(declare-datatypes ((ListLongMap!3467 0))(
  ( (ListLongMap!3468 (toList!1749 List!3453)) )
))
(declare-fun contains!1639 (ListLongMap!3467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1281 (array!11617 array!11615 (_ BitVec 32) (_ BitVec 32) V!7889 V!7889 (_ BitVec 32) Int) ListLongMap!3467)

(assert (=> b!235098 (= res!115283 (contains!1639 (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) key!932))))

(declare-fun b!235099 () Bool)

(declare-fun res!115280 () Bool)

(assert (=> b!235099 (=> (not res!115280) (not e!152683))))

(assert (=> b!235099 (= res!115280 (and (= (size!5858 (_values!4349 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10328 thiss!1504))) (= (size!5859 (_keys!6438 thiss!1504)) (size!5858 (_values!4349 thiss!1504))) (bvsge (mask!10328 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4103 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4103 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!115282 () Bool)

(declare-fun e!152679 () Bool)

(assert (=> start!22484 (=> (not res!115282) (not e!152679))))

(declare-fun valid!1354 (LongMapFixedSize!3394) Bool)

(assert (=> start!22484 (= res!115282 (valid!1354 thiss!1504))))

(assert (=> start!22484 e!152679))

(assert (=> start!22484 e!152682))

(assert (=> start!22484 true))

(declare-fun b!235093 () Bool)

(assert (=> b!235093 (= e!152677 (and e!152680 mapRes!10463))))

(declare-fun condMapEmpty!10463 () Bool)

(declare-fun mapDefault!10463 () ValueCell!2747)

(assert (=> b!235093 (= condMapEmpty!10463 (= (arr!5521 (_values!4349 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2747)) mapDefault!10463)))))

(declare-fun b!235100 () Bool)

(assert (=> b!235100 (= e!152679 e!152683)))

(declare-fun res!115284 () Bool)

(assert (=> b!235100 (=> (not res!115284) (not e!152683))))

(declare-datatypes ((SeekEntryResult!956 0))(
  ( (MissingZero!956 (index!5994 (_ BitVec 32))) (Found!956 (index!5995 (_ BitVec 32))) (Intermediate!956 (undefined!1768 Bool) (index!5996 (_ BitVec 32)) (x!23724 (_ BitVec 32))) (Undefined!956) (MissingVacant!956 (index!5997 (_ BitVec 32))) )
))
(declare-fun lt!118983 () SeekEntryResult!956)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235100 (= res!115284 (or (= lt!118983 (MissingZero!956 index!297)) (= lt!118983 (MissingVacant!956 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11617 (_ BitVec 32)) SeekEntryResult!956)

(assert (=> b!235100 (= lt!118983 (seekEntryOrOpen!0 key!932 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)))))

(declare-fun b!235101 () Bool)

(assert (=> b!235101 (= e!152681 tp_is_empty!6181)))

(declare-fun b!235102 () Bool)

(declare-fun res!115279 () Bool)

(assert (=> b!235102 (=> (not res!115279) (not e!152679))))

(assert (=> b!235102 (= res!115279 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22484 res!115282) b!235102))

(assert (= (and b!235102 res!115279) b!235100))

(assert (= (and b!235100 res!115284) b!235098))

(assert (= (and b!235098 res!115283) b!235094))

(assert (= (and b!235094 res!115281) b!235099))

(assert (= (and b!235099 res!115280) b!235097))

(assert (= (and b!235093 condMapEmpty!10463) mapIsEmpty!10463))

(assert (= (and b!235093 (not condMapEmpty!10463)) mapNonEmpty!10463))

(get-info :version)

(assert (= (and mapNonEmpty!10463 ((_ is ValueCellFull!2747) mapValue!10463)) b!235101))

(assert (= (and b!235093 ((_ is ValueCellFull!2747) mapDefault!10463)) b!235095))

(assert (= b!235096 b!235093))

(assert (= start!22484 b!235096))

(declare-fun m!256467 () Bool)

(assert (=> b!235100 m!256467))

(declare-fun m!256469 () Bool)

(assert (=> start!22484 m!256469))

(declare-fun m!256471 () Bool)

(assert (=> b!235097 m!256471))

(declare-fun m!256473 () Bool)

(assert (=> mapNonEmpty!10463 m!256473))

(declare-fun m!256475 () Bool)

(assert (=> b!235098 m!256475))

(assert (=> b!235098 m!256475))

(declare-fun m!256477 () Bool)

(assert (=> b!235098 m!256477))

(declare-fun m!256479 () Bool)

(assert (=> b!235094 m!256479))

(declare-fun m!256481 () Bool)

(assert (=> b!235096 m!256481))

(declare-fun m!256483 () Bool)

(assert (=> b!235096 m!256483))

(check-sat (not b_next!6319) tp_is_empty!6181 (not b!235100) (not b!235094) b_and!13259 (not start!22484) (not b!235096) (not b!235098) (not b!235097) (not mapNonEmpty!10463))
(check-sat b_and!13259 (not b_next!6319))
(get-model)

(declare-fun d!59329 () Bool)

(declare-fun e!152731 () Bool)

(assert (=> d!59329 e!152731))

(declare-fun res!115323 () Bool)

(assert (=> d!59329 (=> res!115323 e!152731)))

(declare-fun lt!119001 () Bool)

(assert (=> d!59329 (= res!115323 (not lt!119001))))

(declare-fun lt!118999 () Bool)

(assert (=> d!59329 (= lt!119001 lt!118999)))

(declare-datatypes ((Unit!7239 0))(
  ( (Unit!7240) )
))
(declare-fun lt!119000 () Unit!7239)

(declare-fun e!152730 () Unit!7239)

(assert (=> d!59329 (= lt!119000 e!152730)))

(declare-fun c!39191 () Bool)

(assert (=> d!59329 (= c!39191 lt!118999)))

(declare-fun containsKey!259 (List!3453 (_ BitVec 64)) Bool)

(assert (=> d!59329 (= lt!118999 (containsKey!259 (toList!1749 (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932))))

(assert (=> d!59329 (= (contains!1639 (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) key!932) lt!119001)))

(declare-fun b!235169 () Bool)

(declare-fun lt!118998 () Unit!7239)

(assert (=> b!235169 (= e!152730 lt!118998)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!207 (List!3453 (_ BitVec 64)) Unit!7239)

(assert (=> b!235169 (= lt!118998 (lemmaContainsKeyImpliesGetValueByKeyDefined!207 (toList!1749 (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932))))

(declare-datatypes ((Option!274 0))(
  ( (Some!273 (v!5165 V!7889)) (None!272) )
))
(declare-fun isDefined!208 (Option!274) Bool)

(declare-fun getValueByKey!268 (List!3453 (_ BitVec 64)) Option!274)

(assert (=> b!235169 (isDefined!208 (getValueByKey!268 (toList!1749 (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932))))

(declare-fun b!235170 () Bool)

(declare-fun Unit!7241 () Unit!7239)

(assert (=> b!235170 (= e!152730 Unit!7241)))

(declare-fun b!235171 () Bool)

(assert (=> b!235171 (= e!152731 (isDefined!208 (getValueByKey!268 (toList!1749 (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932)))))

(assert (= (and d!59329 c!39191) b!235169))

(assert (= (and d!59329 (not c!39191)) b!235170))

(assert (= (and d!59329 (not res!115323)) b!235171))

(declare-fun m!256521 () Bool)

(assert (=> d!59329 m!256521))

(declare-fun m!256523 () Bool)

(assert (=> b!235169 m!256523))

(declare-fun m!256525 () Bool)

(assert (=> b!235169 m!256525))

(assert (=> b!235169 m!256525))

(declare-fun m!256527 () Bool)

(assert (=> b!235169 m!256527))

(assert (=> b!235171 m!256525))

(assert (=> b!235171 m!256525))

(assert (=> b!235171 m!256527))

(assert (=> b!235098 d!59329))

(declare-fun b!235214 () Bool)

(declare-fun e!152760 () ListLongMap!3467)

(declare-fun call!21855 () ListLongMap!3467)

(assert (=> b!235214 (= e!152760 call!21855)))

(declare-fun bm!21852 () Bool)

(declare-fun call!21860 () Bool)

(declare-fun lt!119061 () ListLongMap!3467)

(assert (=> bm!21852 (= call!21860 (contains!1639 lt!119061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235215 () Bool)

(declare-fun e!152761 () Bool)

(assert (=> b!235215 (= e!152761 (not call!21860))))

(declare-fun b!235216 () Bool)

(declare-fun e!152762 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235216 (= e!152762 (validKeyInArray!0 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235217 () Bool)

(declare-fun res!115346 () Bool)

(declare-fun e!152759 () Bool)

(assert (=> b!235217 (=> (not res!115346) (not e!152759))))

(declare-fun e!152767 () Bool)

(assert (=> b!235217 (= res!115346 e!152767)))

(declare-fun c!39207 () Bool)

(assert (=> b!235217 (= c!39207 (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!235218 () Bool)

(declare-fun call!21856 () ListLongMap!3467)

(assert (=> b!235218 (= e!152760 call!21856)))

(declare-fun b!235219 () Bool)

(assert (=> b!235219 (= e!152759 e!152761)))

(declare-fun c!39204 () Bool)

(assert (=> b!235219 (= c!39204 (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235220 () Bool)

(declare-fun res!115342 () Bool)

(assert (=> b!235220 (=> (not res!115342) (not e!152759))))

(declare-fun e!152769 () Bool)

(assert (=> b!235220 (= res!115342 e!152769)))

(declare-fun res!115345 () Bool)

(assert (=> b!235220 (=> res!115345 e!152769)))

(assert (=> b!235220 (= res!115345 (not e!152762))))

(declare-fun res!115350 () Bool)

(assert (=> b!235220 (=> (not res!115350) (not e!152762))))

(assert (=> b!235220 (= res!115350 (bvslt #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))))))

(declare-fun bm!21853 () Bool)

(declare-fun call!21857 () ListLongMap!3467)

(declare-fun call!21858 () ListLongMap!3467)

(assert (=> bm!21853 (= call!21857 call!21858)))

(declare-fun b!235221 () Bool)

(declare-fun e!152764 () ListLongMap!3467)

(assert (=> b!235221 (= e!152764 call!21855)))

(declare-fun bm!21854 () Bool)

(assert (=> bm!21854 (= call!21856 call!21857)))

(declare-fun b!235222 () Bool)

(declare-fun e!152770 () Bool)

(declare-fun apply!209 (ListLongMap!3467 (_ BitVec 64)) V!7889)

(declare-fun get!2846 (ValueCell!2747 V!7889) V!7889)

(declare-fun dynLambda!552 (Int (_ BitVec 64)) V!7889)

(assert (=> b!235222 (= e!152770 (= (apply!209 lt!119061 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000)) (get!2846 (select (arr!5521 (_values!4349 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!552 (defaultEntry!4366 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5858 (_values!4349 thiss!1504))))))

(assert (=> b!235222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))))))

(declare-fun b!235223 () Bool)

(declare-fun e!152763 () Bool)

(assert (=> b!235223 (= e!152761 e!152763)))

(declare-fun res!115343 () Bool)

(assert (=> b!235223 (= res!115343 call!21860)))

(assert (=> b!235223 (=> (not res!115343) (not e!152763))))

(declare-fun b!235224 () Bool)

(assert (=> b!235224 (= e!152769 e!152770)))

(declare-fun res!115344 () Bool)

(assert (=> b!235224 (=> (not res!115344) (not e!152770))))

(assert (=> b!235224 (= res!115344 (contains!1639 lt!119061 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235224 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))))))

(declare-fun b!235225 () Bool)

(declare-fun e!152758 () Unit!7239)

(declare-fun Unit!7242 () Unit!7239)

(assert (=> b!235225 (= e!152758 Unit!7242)))

(declare-fun b!235226 () Bool)

(declare-fun e!152768 () Bool)

(assert (=> b!235226 (= e!152768 (= (apply!209 lt!119061 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4207 thiss!1504)))))

(declare-fun b!235227 () Bool)

(declare-fun e!152765 () ListLongMap!3467)

(declare-fun call!21859 () ListLongMap!3467)

(declare-fun +!636 (ListLongMap!3467 tuple2!4552) ListLongMap!3467)

(assert (=> b!235227 (= e!152765 (+!636 call!21859 (tuple2!4553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4207 thiss!1504))))))

(declare-fun bm!21855 () Bool)

(assert (=> bm!21855 (= call!21855 call!21859)))

(declare-fun b!235228 () Bool)

(declare-fun call!21861 () Bool)

(assert (=> b!235228 (= e!152767 (not call!21861))))

(declare-fun b!235229 () Bool)

(declare-fun c!39209 () Bool)

(assert (=> b!235229 (= c!39209 (and (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235229 (= e!152764 e!152760)))

(declare-fun b!235230 () Bool)

(assert (=> b!235230 (= e!152763 (= (apply!209 lt!119061 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4207 thiss!1504)))))

(declare-fun d!59331 () Bool)

(assert (=> d!59331 e!152759))

(declare-fun res!115349 () Bool)

(assert (=> d!59331 (=> (not res!115349) (not e!152759))))

(assert (=> d!59331 (= res!115349 (or (bvsge #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))))))))

(declare-fun lt!119067 () ListLongMap!3467)

(assert (=> d!59331 (= lt!119061 lt!119067)))

(declare-fun lt!119056 () Unit!7239)

(assert (=> d!59331 (= lt!119056 e!152758)))

(declare-fun c!39206 () Bool)

(declare-fun e!152766 () Bool)

(assert (=> d!59331 (= c!39206 e!152766)))

(declare-fun res!115347 () Bool)

(assert (=> d!59331 (=> (not res!115347) (not e!152766))))

(assert (=> d!59331 (= res!115347 (bvslt #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))))))

(assert (=> d!59331 (= lt!119067 e!152765)))

(declare-fun c!39208 () Bool)

(assert (=> d!59331 (= c!39208 (and (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59331 (validMask!0 (mask!10328 thiss!1504))))

(assert (=> d!59331 (= (getCurrentListMap!1281 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) lt!119061)))

(declare-fun bm!21856 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!525 (array!11617 array!11615 (_ BitVec 32) (_ BitVec 32) V!7889 V!7889 (_ BitVec 32) Int) ListLongMap!3467)

(assert (=> bm!21856 (= call!21858 (getCurrentListMapNoExtraKeys!525 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun bm!21857 () Bool)

(assert (=> bm!21857 (= call!21861 (contains!1639 lt!119061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235231 () Bool)

(assert (=> b!235231 (= e!152766 (validKeyInArray!0 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235232 () Bool)

(declare-fun lt!119063 () Unit!7239)

(assert (=> b!235232 (= e!152758 lt!119063)))

(declare-fun lt!119058 () ListLongMap!3467)

(assert (=> b!235232 (= lt!119058 (getCurrentListMapNoExtraKeys!525 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!119050 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119055 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119055 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119059 () Unit!7239)

(declare-fun addStillContains!185 (ListLongMap!3467 (_ BitVec 64) V!7889 (_ BitVec 64)) Unit!7239)

(assert (=> b!235232 (= lt!119059 (addStillContains!185 lt!119058 lt!119050 (zeroValue!4207 thiss!1504) lt!119055))))

(assert (=> b!235232 (contains!1639 (+!636 lt!119058 (tuple2!4553 lt!119050 (zeroValue!4207 thiss!1504))) lt!119055)))

(declare-fun lt!119046 () Unit!7239)

(assert (=> b!235232 (= lt!119046 lt!119059)))

(declare-fun lt!119064 () ListLongMap!3467)

(assert (=> b!235232 (= lt!119064 (getCurrentListMapNoExtraKeys!525 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!119047 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119047 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119066 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119066 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119049 () Unit!7239)

(declare-fun addApplyDifferent!185 (ListLongMap!3467 (_ BitVec 64) V!7889 (_ BitVec 64)) Unit!7239)

(assert (=> b!235232 (= lt!119049 (addApplyDifferent!185 lt!119064 lt!119047 (minValue!4207 thiss!1504) lt!119066))))

(assert (=> b!235232 (= (apply!209 (+!636 lt!119064 (tuple2!4553 lt!119047 (minValue!4207 thiss!1504))) lt!119066) (apply!209 lt!119064 lt!119066))))

(declare-fun lt!119048 () Unit!7239)

(assert (=> b!235232 (= lt!119048 lt!119049)))

(declare-fun lt!119065 () ListLongMap!3467)

(assert (=> b!235232 (= lt!119065 (getCurrentListMapNoExtraKeys!525 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!119053 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119062 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119062 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119060 () Unit!7239)

(assert (=> b!235232 (= lt!119060 (addApplyDifferent!185 lt!119065 lt!119053 (zeroValue!4207 thiss!1504) lt!119062))))

(assert (=> b!235232 (= (apply!209 (+!636 lt!119065 (tuple2!4553 lt!119053 (zeroValue!4207 thiss!1504))) lt!119062) (apply!209 lt!119065 lt!119062))))

(declare-fun lt!119052 () Unit!7239)

(assert (=> b!235232 (= lt!119052 lt!119060)))

(declare-fun lt!119057 () ListLongMap!3467)

(assert (=> b!235232 (= lt!119057 (getCurrentListMapNoExtraKeys!525 (_keys!6438 thiss!1504) (_values!4349 thiss!1504) (mask!10328 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!119051 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119054 () (_ BitVec 64))

(assert (=> b!235232 (= lt!119054 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235232 (= lt!119063 (addApplyDifferent!185 lt!119057 lt!119051 (minValue!4207 thiss!1504) lt!119054))))

(assert (=> b!235232 (= (apply!209 (+!636 lt!119057 (tuple2!4553 lt!119051 (minValue!4207 thiss!1504))) lt!119054) (apply!209 lt!119057 lt!119054))))

(declare-fun b!235233 () Bool)

(assert (=> b!235233 (= e!152765 e!152764)))

(declare-fun c!39205 () Bool)

(assert (=> b!235233 (= c!39205 (and (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235234 () Bool)

(assert (=> b!235234 (= e!152767 e!152768)))

(declare-fun res!115348 () Bool)

(assert (=> b!235234 (= res!115348 call!21861)))

(assert (=> b!235234 (=> (not res!115348) (not e!152768))))

(declare-fun bm!21858 () Bool)

(assert (=> bm!21858 (= call!21859 (+!636 (ite c!39208 call!21858 (ite c!39205 call!21857 call!21856)) (ite (or c!39208 c!39205) (tuple2!4553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4207 thiss!1504)) (tuple2!4553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4207 thiss!1504)))))))

(assert (= (and d!59331 c!39208) b!235227))

(assert (= (and d!59331 (not c!39208)) b!235233))

(assert (= (and b!235233 c!39205) b!235221))

(assert (= (and b!235233 (not c!39205)) b!235229))

(assert (= (and b!235229 c!39209) b!235214))

(assert (= (and b!235229 (not c!39209)) b!235218))

(assert (= (or b!235214 b!235218) bm!21854))

(assert (= (or b!235221 bm!21854) bm!21853))

(assert (= (or b!235221 b!235214) bm!21855))

(assert (= (or b!235227 bm!21853) bm!21856))

(assert (= (or b!235227 bm!21855) bm!21858))

(assert (= (and d!59331 res!115347) b!235231))

(assert (= (and d!59331 c!39206) b!235232))

(assert (= (and d!59331 (not c!39206)) b!235225))

(assert (= (and d!59331 res!115349) b!235220))

(assert (= (and b!235220 res!115350) b!235216))

(assert (= (and b!235220 (not res!115345)) b!235224))

(assert (= (and b!235224 res!115344) b!235222))

(assert (= (and b!235220 res!115342) b!235217))

(assert (= (and b!235217 c!39207) b!235234))

(assert (= (and b!235217 (not c!39207)) b!235228))

(assert (= (and b!235234 res!115348) b!235226))

(assert (= (or b!235234 b!235228) bm!21857))

(assert (= (and b!235217 res!115346) b!235219))

(assert (= (and b!235219 c!39204) b!235223))

(assert (= (and b!235219 (not c!39204)) b!235215))

(assert (= (and b!235223 res!115343) b!235230))

(assert (= (or b!235223 b!235215) bm!21852))

(declare-fun b_lambda!7921 () Bool)

(assert (=> (not b_lambda!7921) (not b!235222)))

(declare-fun t!8420 () Bool)

(declare-fun tb!2923 () Bool)

(assert (=> (and b!235096 (= (defaultEntry!4366 thiss!1504) (defaultEntry!4366 thiss!1504)) t!8420) tb!2923))

(declare-fun result!5107 () Bool)

(assert (=> tb!2923 (= result!5107 tp_is_empty!6181)))

(assert (=> b!235222 t!8420))

(declare-fun b_and!13265 () Bool)

(assert (= b_and!13259 (and (=> t!8420 result!5107) b_and!13265)))

(declare-fun m!256529 () Bool)

(assert (=> b!235232 m!256529))

(declare-fun m!256531 () Bool)

(assert (=> b!235232 m!256531))

(declare-fun m!256533 () Bool)

(assert (=> b!235232 m!256533))

(declare-fun m!256535 () Bool)

(assert (=> b!235232 m!256535))

(declare-fun m!256537 () Bool)

(assert (=> b!235232 m!256537))

(declare-fun m!256539 () Bool)

(assert (=> b!235232 m!256539))

(declare-fun m!256541 () Bool)

(assert (=> b!235232 m!256541))

(assert (=> b!235232 m!256531))

(declare-fun m!256543 () Bool)

(assert (=> b!235232 m!256543))

(declare-fun m!256545 () Bool)

(assert (=> b!235232 m!256545))

(assert (=> b!235232 m!256535))

(declare-fun m!256547 () Bool)

(assert (=> b!235232 m!256547))

(declare-fun m!256549 () Bool)

(assert (=> b!235232 m!256549))

(declare-fun m!256551 () Bool)

(assert (=> b!235232 m!256551))

(declare-fun m!256553 () Bool)

(assert (=> b!235232 m!256553))

(declare-fun m!256555 () Bool)

(assert (=> b!235232 m!256555))

(assert (=> b!235232 m!256553))

(assert (=> b!235232 m!256539))

(declare-fun m!256557 () Bool)

(assert (=> b!235232 m!256557))

(declare-fun m!256559 () Bool)

(assert (=> b!235232 m!256559))

(declare-fun m!256561 () Bool)

(assert (=> b!235232 m!256561))

(declare-fun m!256563 () Bool)

(assert (=> b!235230 m!256563))

(assert (=> bm!21856 m!256559))

(declare-fun m!256565 () Bool)

(assert (=> b!235226 m!256565))

(assert (=> d!59331 m!256479))

(assert (=> b!235216 m!256549))

(assert (=> b!235216 m!256549))

(declare-fun m!256567 () Bool)

(assert (=> b!235216 m!256567))

(declare-fun m!256569 () Bool)

(assert (=> b!235222 m!256569))

(declare-fun m!256571 () Bool)

(assert (=> b!235222 m!256571))

(assert (=> b!235222 m!256571))

(assert (=> b!235222 m!256569))

(declare-fun m!256573 () Bool)

(assert (=> b!235222 m!256573))

(assert (=> b!235222 m!256549))

(declare-fun m!256575 () Bool)

(assert (=> b!235222 m!256575))

(assert (=> b!235222 m!256549))

(declare-fun m!256577 () Bool)

(assert (=> bm!21852 m!256577))

(declare-fun m!256579 () Bool)

(assert (=> bm!21857 m!256579))

(declare-fun m!256581 () Bool)

(assert (=> bm!21858 m!256581))

(assert (=> b!235231 m!256549))

(assert (=> b!235231 m!256549))

(assert (=> b!235231 m!256567))

(declare-fun m!256583 () Bool)

(assert (=> b!235227 m!256583))

(assert (=> b!235224 m!256549))

(assert (=> b!235224 m!256549))

(declare-fun m!256585 () Bool)

(assert (=> b!235224 m!256585))

(assert (=> b!235098 d!59331))

(declare-fun d!59333 () Bool)

(assert (=> d!59333 (= (validMask!0 (mask!10328 thiss!1504)) (and (or (= (mask!10328 thiss!1504) #b00000000000000000000000000000111) (= (mask!10328 thiss!1504) #b00000000000000000000000000001111) (= (mask!10328 thiss!1504) #b00000000000000000000000000011111) (= (mask!10328 thiss!1504) #b00000000000000000000000000111111) (= (mask!10328 thiss!1504) #b00000000000000000000000001111111) (= (mask!10328 thiss!1504) #b00000000000000000000000011111111) (= (mask!10328 thiss!1504) #b00000000000000000000000111111111) (= (mask!10328 thiss!1504) #b00000000000000000000001111111111) (= (mask!10328 thiss!1504) #b00000000000000000000011111111111) (= (mask!10328 thiss!1504) #b00000000000000000000111111111111) (= (mask!10328 thiss!1504) #b00000000000000000001111111111111) (= (mask!10328 thiss!1504) #b00000000000000000011111111111111) (= (mask!10328 thiss!1504) #b00000000000000000111111111111111) (= (mask!10328 thiss!1504) #b00000000000000001111111111111111) (= (mask!10328 thiss!1504) #b00000000000000011111111111111111) (= (mask!10328 thiss!1504) #b00000000000000111111111111111111) (= (mask!10328 thiss!1504) #b00000000000001111111111111111111) (= (mask!10328 thiss!1504) #b00000000000011111111111111111111) (= (mask!10328 thiss!1504) #b00000000000111111111111111111111) (= (mask!10328 thiss!1504) #b00000000001111111111111111111111) (= (mask!10328 thiss!1504) #b00000000011111111111111111111111) (= (mask!10328 thiss!1504) #b00000000111111111111111111111111) (= (mask!10328 thiss!1504) #b00000001111111111111111111111111) (= (mask!10328 thiss!1504) #b00000011111111111111111111111111) (= (mask!10328 thiss!1504) #b00000111111111111111111111111111) (= (mask!10328 thiss!1504) #b00001111111111111111111111111111) (= (mask!10328 thiss!1504) #b00011111111111111111111111111111) (= (mask!10328 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10328 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235094 d!59333))

(declare-fun b!235245 () Bool)

(declare-fun e!152779 () Bool)

(declare-fun call!21864 () Bool)

(assert (=> b!235245 (= e!152779 call!21864)))

(declare-fun b!235246 () Bool)

(declare-fun e!152777 () Bool)

(assert (=> b!235246 (= e!152779 e!152777)))

(declare-fun lt!119074 () (_ BitVec 64))

(assert (=> b!235246 (= lt!119074 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119076 () Unit!7239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11617 (_ BitVec 64) (_ BitVec 32)) Unit!7239)

(assert (=> b!235246 (= lt!119076 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6438 thiss!1504) lt!119074 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235246 (arrayContainsKey!0 (_keys!6438 thiss!1504) lt!119074 #b00000000000000000000000000000000)))

(declare-fun lt!119075 () Unit!7239)

(assert (=> b!235246 (= lt!119075 lt!119076)))

(declare-fun res!115355 () Bool)

(assert (=> b!235246 (= res!115355 (= (seekEntryOrOpen!0 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000) (_keys!6438 thiss!1504) (mask!10328 thiss!1504)) (Found!956 #b00000000000000000000000000000000)))))

(assert (=> b!235246 (=> (not res!115355) (not e!152777))))

(declare-fun bm!21861 () Bool)

(assert (=> bm!21861 (= call!21864 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6438 thiss!1504) (mask!10328 thiss!1504)))))

(declare-fun d!59335 () Bool)

(declare-fun res!115356 () Bool)

(declare-fun e!152778 () Bool)

(assert (=> d!59335 (=> res!115356 e!152778)))

(assert (=> d!59335 (= res!115356 (bvsge #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))))))

(assert (=> d!59335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)) e!152778)))

(declare-fun b!235247 () Bool)

(assert (=> b!235247 (= e!152777 call!21864)))

(declare-fun b!235248 () Bool)

(assert (=> b!235248 (= e!152778 e!152779)))

(declare-fun c!39212 () Bool)

(assert (=> b!235248 (= c!39212 (validKeyInArray!0 (select (arr!5522 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59335 (not res!115356)) b!235248))

(assert (= (and b!235248 c!39212) b!235246))

(assert (= (and b!235248 (not c!39212)) b!235245))

(assert (= (and b!235246 res!115355) b!235247))

(assert (= (or b!235247 b!235245) bm!21861))

(assert (=> b!235246 m!256549))

(declare-fun m!256587 () Bool)

(assert (=> b!235246 m!256587))

(declare-fun m!256589 () Bool)

(assert (=> b!235246 m!256589))

(assert (=> b!235246 m!256549))

(declare-fun m!256591 () Bool)

(assert (=> b!235246 m!256591))

(declare-fun m!256593 () Bool)

(assert (=> bm!21861 m!256593))

(assert (=> b!235248 m!256549))

(assert (=> b!235248 m!256549))

(assert (=> b!235248 m!256567))

(assert (=> b!235097 d!59335))

(declare-fun b!235262 () Bool)

(declare-fun c!39221 () Bool)

(declare-fun lt!119083 () (_ BitVec 64))

(assert (=> b!235262 (= c!39221 (= lt!119083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152786 () SeekEntryResult!956)

(declare-fun e!152788 () SeekEntryResult!956)

(assert (=> b!235262 (= e!152786 e!152788)))

(declare-fun b!235263 () Bool)

(declare-fun e!152787 () SeekEntryResult!956)

(assert (=> b!235263 (= e!152787 e!152786)))

(declare-fun lt!119085 () SeekEntryResult!956)

(assert (=> b!235263 (= lt!119083 (select (arr!5522 (_keys!6438 thiss!1504)) (index!5996 lt!119085)))))

(declare-fun c!39220 () Bool)

(assert (=> b!235263 (= c!39220 (= lt!119083 key!932))))

(declare-fun b!235264 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11617 (_ BitVec 32)) SeekEntryResult!956)

(assert (=> b!235264 (= e!152788 (seekKeyOrZeroReturnVacant!0 (x!23724 lt!119085) (index!5996 lt!119085) (index!5996 lt!119085) key!932 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)))))

(declare-fun b!235265 () Bool)

(assert (=> b!235265 (= e!152787 Undefined!956)))

(declare-fun b!235266 () Bool)

(assert (=> b!235266 (= e!152786 (Found!956 (index!5996 lt!119085)))))

(declare-fun d!59337 () Bool)

(declare-fun lt!119084 () SeekEntryResult!956)

(assert (=> d!59337 (and (or ((_ is Undefined!956) lt!119084) (not ((_ is Found!956) lt!119084)) (and (bvsge (index!5995 lt!119084) #b00000000000000000000000000000000) (bvslt (index!5995 lt!119084) (size!5859 (_keys!6438 thiss!1504))))) (or ((_ is Undefined!956) lt!119084) ((_ is Found!956) lt!119084) (not ((_ is MissingZero!956) lt!119084)) (and (bvsge (index!5994 lt!119084) #b00000000000000000000000000000000) (bvslt (index!5994 lt!119084) (size!5859 (_keys!6438 thiss!1504))))) (or ((_ is Undefined!956) lt!119084) ((_ is Found!956) lt!119084) ((_ is MissingZero!956) lt!119084) (not ((_ is MissingVacant!956) lt!119084)) (and (bvsge (index!5997 lt!119084) #b00000000000000000000000000000000) (bvslt (index!5997 lt!119084) (size!5859 (_keys!6438 thiss!1504))))) (or ((_ is Undefined!956) lt!119084) (ite ((_ is Found!956) lt!119084) (= (select (arr!5522 (_keys!6438 thiss!1504)) (index!5995 lt!119084)) key!932) (ite ((_ is MissingZero!956) lt!119084) (= (select (arr!5522 (_keys!6438 thiss!1504)) (index!5994 lt!119084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!956) lt!119084) (= (select (arr!5522 (_keys!6438 thiss!1504)) (index!5997 lt!119084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59337 (= lt!119084 e!152787)))

(declare-fun c!39219 () Bool)

(assert (=> d!59337 (= c!39219 (and ((_ is Intermediate!956) lt!119085) (undefined!1768 lt!119085)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11617 (_ BitVec 32)) SeekEntryResult!956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59337 (= lt!119085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10328 thiss!1504)) key!932 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)))))

(assert (=> d!59337 (validMask!0 (mask!10328 thiss!1504))))

(assert (=> d!59337 (= (seekEntryOrOpen!0 key!932 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)) lt!119084)))

(declare-fun b!235261 () Bool)

(assert (=> b!235261 (= e!152788 (MissingZero!956 (index!5996 lt!119085)))))

(assert (= (and d!59337 c!39219) b!235265))

(assert (= (and d!59337 (not c!39219)) b!235263))

(assert (= (and b!235263 c!39220) b!235266))

(assert (= (and b!235263 (not c!39220)) b!235262))

(assert (= (and b!235262 c!39221) b!235261))

(assert (= (and b!235262 (not c!39221)) b!235264))

(declare-fun m!256595 () Bool)

(assert (=> b!235263 m!256595))

(declare-fun m!256597 () Bool)

(assert (=> b!235264 m!256597))

(declare-fun m!256599 () Bool)

(assert (=> d!59337 m!256599))

(assert (=> d!59337 m!256479))

(assert (=> d!59337 m!256599))

(declare-fun m!256601 () Bool)

(assert (=> d!59337 m!256601))

(declare-fun m!256603 () Bool)

(assert (=> d!59337 m!256603))

(declare-fun m!256605 () Bool)

(assert (=> d!59337 m!256605))

(declare-fun m!256607 () Bool)

(assert (=> d!59337 m!256607))

(assert (=> b!235100 d!59337))

(declare-fun d!59339 () Bool)

(assert (=> d!59339 (= (array_inv!3623 (_keys!6438 thiss!1504)) (bvsge (size!5859 (_keys!6438 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235096 d!59339))

(declare-fun d!59341 () Bool)

(assert (=> d!59341 (= (array_inv!3624 (_values!4349 thiss!1504)) (bvsge (size!5858 (_values!4349 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235096 d!59341))

(declare-fun d!59343 () Bool)

(declare-fun res!115363 () Bool)

(declare-fun e!152791 () Bool)

(assert (=> d!59343 (=> (not res!115363) (not e!152791))))

(declare-fun simpleValid!232 (LongMapFixedSize!3394) Bool)

(assert (=> d!59343 (= res!115363 (simpleValid!232 thiss!1504))))

(assert (=> d!59343 (= (valid!1354 thiss!1504) e!152791)))

(declare-fun b!235273 () Bool)

(declare-fun res!115364 () Bool)

(assert (=> b!235273 (=> (not res!115364) (not e!152791))))

(declare-fun arrayCountValidKeys!0 (array!11617 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235273 (= res!115364 (= (arrayCountValidKeys!0 (_keys!6438 thiss!1504) #b00000000000000000000000000000000 (size!5859 (_keys!6438 thiss!1504))) (_size!1746 thiss!1504)))))

(declare-fun b!235274 () Bool)

(declare-fun res!115365 () Bool)

(assert (=> b!235274 (=> (not res!115365) (not e!152791))))

(assert (=> b!235274 (= res!115365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6438 thiss!1504) (mask!10328 thiss!1504)))))

(declare-fun b!235275 () Bool)

(declare-datatypes ((List!3456 0))(
  ( (Nil!3453) (Cons!3452 (h!4104 (_ BitVec 64)) (t!8421 List!3456)) )
))
(declare-fun arrayNoDuplicates!0 (array!11617 (_ BitVec 32) List!3456) Bool)

(assert (=> b!235275 (= e!152791 (arrayNoDuplicates!0 (_keys!6438 thiss!1504) #b00000000000000000000000000000000 Nil!3453))))

(assert (= (and d!59343 res!115363) b!235273))

(assert (= (and b!235273 res!115364) b!235274))

(assert (= (and b!235274 res!115365) b!235275))

(declare-fun m!256609 () Bool)

(assert (=> d!59343 m!256609))

(declare-fun m!256611 () Bool)

(assert (=> b!235273 m!256611))

(assert (=> b!235274 m!256471))

(declare-fun m!256613 () Bool)

(assert (=> b!235275 m!256613))

(assert (=> start!22484 d!59343))

(declare-fun b!235282 () Bool)

(declare-fun e!152796 () Bool)

(assert (=> b!235282 (= e!152796 tp_is_empty!6181)))

(declare-fun condMapEmpty!10472 () Bool)

(declare-fun mapDefault!10472 () ValueCell!2747)

(assert (=> mapNonEmpty!10463 (= condMapEmpty!10472 (= mapRest!10463 ((as const (Array (_ BitVec 32) ValueCell!2747)) mapDefault!10472)))))

(declare-fun e!152797 () Bool)

(declare-fun mapRes!10472 () Bool)

(assert (=> mapNonEmpty!10463 (= tp!22120 (and e!152797 mapRes!10472))))

(declare-fun b!235283 () Bool)

(assert (=> b!235283 (= e!152797 tp_is_empty!6181)))

(declare-fun mapIsEmpty!10472 () Bool)

(assert (=> mapIsEmpty!10472 mapRes!10472))

(declare-fun mapNonEmpty!10472 () Bool)

(declare-fun tp!22136 () Bool)

(assert (=> mapNonEmpty!10472 (= mapRes!10472 (and tp!22136 e!152796))))

(declare-fun mapRest!10472 () (Array (_ BitVec 32) ValueCell!2747))

(declare-fun mapValue!10472 () ValueCell!2747)

(declare-fun mapKey!10472 () (_ BitVec 32))

(assert (=> mapNonEmpty!10472 (= mapRest!10463 (store mapRest!10472 mapKey!10472 mapValue!10472))))

(assert (= (and mapNonEmpty!10463 condMapEmpty!10472) mapIsEmpty!10472))

(assert (= (and mapNonEmpty!10463 (not condMapEmpty!10472)) mapNonEmpty!10472))

(assert (= (and mapNonEmpty!10472 ((_ is ValueCellFull!2747) mapValue!10472)) b!235282))

(assert (= (and mapNonEmpty!10463 ((_ is ValueCellFull!2747) mapDefault!10472)) b!235283))

(declare-fun m!256615 () Bool)

(assert (=> mapNonEmpty!10472 m!256615))

(declare-fun b_lambda!7923 () Bool)

(assert (= b_lambda!7921 (or (and b!235096 b_free!6319) b_lambda!7923)))

(check-sat (not b_next!6319) b_and!13265 (not b!235275) (not d!59331) (not bm!21852) (not b!235264) (not b!235230) (not b!235231) (not b!235227) (not b!235224) (not bm!21858) (not b!235171) (not b!235246) tp_is_empty!6181 (not b!235216) (not b!235274) (not bm!21861) (not bm!21856) (not d!59343) (not b!235222) (not d!59337) (not d!59329) (not b!235248) (not mapNonEmpty!10472) (not bm!21857) (not b!235169) (not b!235273) (not b_lambda!7923) (not b!235232) (not b!235226))
(check-sat b_and!13265 (not b_next!6319))
