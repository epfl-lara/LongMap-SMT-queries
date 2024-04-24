; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22720 () Bool)

(assert start!22720)

(declare-fun b!237119 () Bool)

(declare-fun b_free!6373 () Bool)

(declare-fun b_next!6373 () Bool)

(assert (=> b!237119 (= b_free!6373 (not b_next!6373))))

(declare-fun tp!22305 () Bool)

(declare-fun b_and!13335 () Bool)

(assert (=> b!237119 (= tp!22305 b_and!13335)))

(declare-fun mapIsEmpty!10567 () Bool)

(declare-fun mapRes!10567 () Bool)

(assert (=> mapIsEmpty!10567 mapRes!10567))

(declare-fun b!237113 () Bool)

(declare-fun e!153978 () Bool)

(declare-fun e!153977 () Bool)

(assert (=> b!237113 (= e!153978 (and e!153977 mapRes!10567))))

(declare-fun condMapEmpty!10567 () Bool)

(declare-datatypes ((V!7961 0))(
  ( (V!7962 (val!3162 Int)) )
))
(declare-datatypes ((ValueCell!2774 0))(
  ( (ValueCellFull!2774 (v!5196 V!7961)) (EmptyCell!2774) )
))
(declare-datatypes ((array!11737 0))(
  ( (array!11738 (arr!5575 (Array (_ BitVec 32) ValueCell!2774)) (size!5914 (_ BitVec 32))) )
))
(declare-datatypes ((array!11739 0))(
  ( (array!11740 (arr!5576 (Array (_ BitVec 32) (_ BitVec 64))) (size!5915 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3448 0))(
  ( (LongMapFixedSize!3449 (defaultEntry!4402 Int) (mask!10407 (_ BitVec 32)) (extraKeys!4139 (_ BitVec 32)) (zeroValue!4243 V!7961) (minValue!4243 V!7961) (_size!1773 (_ BitVec 32)) (_keys!6490 array!11739) (_values!4385 array!11737) (_vacant!1773 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3448)

(declare-fun mapDefault!10567 () ValueCell!2774)

(assert (=> b!237113 (= condMapEmpty!10567 (= (arr!5575 (_values!4385 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2774)) mapDefault!10567)))))

(declare-fun b!237114 () Bool)

(declare-fun tp_is_empty!6235 () Bool)

(assert (=> b!237114 (= e!153977 tp_is_empty!6235)))

(declare-fun b!237115 () Bool)

(declare-fun res!116233 () Bool)

(declare-fun e!153981 () Bool)

(assert (=> b!237115 (=> (not res!116233) (not e!153981))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4586 0))(
  ( (tuple2!4587 (_1!2304 (_ BitVec 64)) (_2!2304 V!7961)) )
))
(declare-datatypes ((List!3482 0))(
  ( (Nil!3479) (Cons!3478 (h!4132 tuple2!4586) (t!8459 List!3482)) )
))
(declare-datatypes ((ListLongMap!3501 0))(
  ( (ListLongMap!3502 (toList!1766 List!3482)) )
))
(declare-fun contains!1662 (ListLongMap!3501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1298 (array!11739 array!11737 (_ BitVec 32) (_ BitVec 32) V!7961 V!7961 (_ BitVec 32) Int) ListLongMap!3501)

(assert (=> b!237115 (= res!116233 (not (contains!1662 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) key!932)))))

(declare-fun b!237116 () Bool)

(declare-fun e!153982 () Bool)

(assert (=> b!237116 (= e!153982 tp_is_empty!6235)))

(declare-fun res!116232 () Bool)

(declare-fun e!153983 () Bool)

(assert (=> start!22720 (=> (not res!116232) (not e!153983))))

(declare-fun valid!1374 (LongMapFixedSize!3448) Bool)

(assert (=> start!22720 (= res!116232 (valid!1374 thiss!1504))))

(assert (=> start!22720 e!153983))

(declare-fun e!153979 () Bool)

(assert (=> start!22720 e!153979))

(assert (=> start!22720 true))

(declare-fun b!237117 () Bool)

(assert (=> b!237117 (= e!153981 (and (= (size!5914 (_values!4385 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10407 thiss!1504))) (= (size!5915 (_keys!6490 thiss!1504)) (size!5914 (_values!4385 thiss!1504))) (bvsge (mask!10407 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4139 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!237118 () Bool)

(declare-fun res!116231 () Bool)

(assert (=> b!237118 (=> (not res!116231) (not e!153983))))

(assert (=> b!237118 (= res!116231 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!3663 (array!11739) Bool)

(declare-fun array_inv!3664 (array!11737) Bool)

(assert (=> b!237119 (= e!153979 (and tp!22305 tp_is_empty!6235 (array_inv!3663 (_keys!6490 thiss!1504)) (array_inv!3664 (_values!4385 thiss!1504)) e!153978))))

(declare-fun mapNonEmpty!10567 () Bool)

(declare-fun tp!22306 () Bool)

(assert (=> mapNonEmpty!10567 (= mapRes!10567 (and tp!22306 e!153982))))

(declare-fun mapRest!10567 () (Array (_ BitVec 32) ValueCell!2774))

(declare-fun mapKey!10567 () (_ BitVec 32))

(declare-fun mapValue!10567 () ValueCell!2774)

(assert (=> mapNonEmpty!10567 (= (arr!5575 (_values!4385 thiss!1504)) (store mapRest!10567 mapKey!10567 mapValue!10567))))

(declare-fun b!237120 () Bool)

(assert (=> b!237120 (= e!153983 e!153981)))

(declare-fun res!116229 () Bool)

(assert (=> b!237120 (=> (not res!116229) (not e!153981))))

(declare-datatypes ((SeekEntryResult!978 0))(
  ( (MissingZero!978 (index!6082 (_ BitVec 32))) (Found!978 (index!6083 (_ BitVec 32))) (Intermediate!978 (undefined!1790 Bool) (index!6084 (_ BitVec 32)) (x!23904 (_ BitVec 32))) (Undefined!978) (MissingVacant!978 (index!6085 (_ BitVec 32))) )
))
(declare-fun lt!119938 () SeekEntryResult!978)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237120 (= res!116229 (or (= lt!119938 (MissingZero!978 index!297)) (= lt!119938 (MissingVacant!978 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11739 (_ BitVec 32)) SeekEntryResult!978)

(assert (=> b!237120 (= lt!119938 (seekEntryOrOpen!0 key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(declare-fun b!237121 () Bool)

(declare-fun res!116230 () Bool)

(assert (=> b!237121 (=> (not res!116230) (not e!153981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237121 (= res!116230 (validMask!0 (mask!10407 thiss!1504)))))

(assert (= (and start!22720 res!116232) b!237118))

(assert (= (and b!237118 res!116231) b!237120))

(assert (= (and b!237120 res!116229) b!237115))

(assert (= (and b!237115 res!116233) b!237121))

(assert (= (and b!237121 res!116230) b!237117))

(assert (= (and b!237113 condMapEmpty!10567) mapIsEmpty!10567))

(assert (= (and b!237113 (not condMapEmpty!10567)) mapNonEmpty!10567))

(get-info :version)

(assert (= (and mapNonEmpty!10567 ((_ is ValueCellFull!2774) mapValue!10567)) b!237116))

(assert (= (and b!237113 ((_ is ValueCellFull!2774) mapDefault!10567)) b!237114))

(assert (= b!237119 b!237113))

(assert (= start!22720 b!237119))

(declare-fun m!258047 () Bool)

(assert (=> b!237119 m!258047))

(declare-fun m!258049 () Bool)

(assert (=> b!237119 m!258049))

(declare-fun m!258051 () Bool)

(assert (=> b!237115 m!258051))

(assert (=> b!237115 m!258051))

(declare-fun m!258053 () Bool)

(assert (=> b!237115 m!258053))

(declare-fun m!258055 () Bool)

(assert (=> start!22720 m!258055))

(declare-fun m!258057 () Bool)

(assert (=> mapNonEmpty!10567 m!258057))

(declare-fun m!258059 () Bool)

(assert (=> b!237120 m!258059))

(declare-fun m!258061 () Bool)

(assert (=> b!237121 m!258061))

(check-sat (not b!237120) (not b_next!6373) tp_is_empty!6235 (not b!237121) (not b!237119) (not start!22720) (not mapNonEmpty!10567) b_and!13335 (not b!237115))
(check-sat b_and!13335 (not b_next!6373))
(get-model)

(declare-fun b!237188 () Bool)

(declare-fun e!154034 () SeekEntryResult!978)

(declare-fun e!154032 () SeekEntryResult!978)

(assert (=> b!237188 (= e!154034 e!154032)))

(declare-fun lt!119952 () (_ BitVec 64))

(declare-fun lt!119951 () SeekEntryResult!978)

(assert (=> b!237188 (= lt!119952 (select (arr!5576 (_keys!6490 thiss!1504)) (index!6084 lt!119951)))))

(declare-fun c!39530 () Bool)

(assert (=> b!237188 (= c!39530 (= lt!119952 key!932))))

(declare-fun b!237189 () Bool)

(declare-fun e!154033 () SeekEntryResult!978)

(assert (=> b!237189 (= e!154033 (MissingZero!978 (index!6084 lt!119951)))))

(declare-fun b!237190 () Bool)

(assert (=> b!237190 (= e!154032 (Found!978 (index!6084 lt!119951)))))

(declare-fun b!237191 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11739 (_ BitVec 32)) SeekEntryResult!978)

(assert (=> b!237191 (= e!154033 (seekKeyOrZeroReturnVacant!0 (x!23904 lt!119951) (index!6084 lt!119951) (index!6084 lt!119951) key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(declare-fun d!59605 () Bool)

(declare-fun lt!119953 () SeekEntryResult!978)

(assert (=> d!59605 (and (or ((_ is Undefined!978) lt!119953) (not ((_ is Found!978) lt!119953)) (and (bvsge (index!6083 lt!119953) #b00000000000000000000000000000000) (bvslt (index!6083 lt!119953) (size!5915 (_keys!6490 thiss!1504))))) (or ((_ is Undefined!978) lt!119953) ((_ is Found!978) lt!119953) (not ((_ is MissingZero!978) lt!119953)) (and (bvsge (index!6082 lt!119953) #b00000000000000000000000000000000) (bvslt (index!6082 lt!119953) (size!5915 (_keys!6490 thiss!1504))))) (or ((_ is Undefined!978) lt!119953) ((_ is Found!978) lt!119953) ((_ is MissingZero!978) lt!119953) (not ((_ is MissingVacant!978) lt!119953)) (and (bvsge (index!6085 lt!119953) #b00000000000000000000000000000000) (bvslt (index!6085 lt!119953) (size!5915 (_keys!6490 thiss!1504))))) (or ((_ is Undefined!978) lt!119953) (ite ((_ is Found!978) lt!119953) (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6083 lt!119953)) key!932) (ite ((_ is MissingZero!978) lt!119953) (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6082 lt!119953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!978) lt!119953) (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6085 lt!119953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59605 (= lt!119953 e!154034)))

(declare-fun c!39531 () Bool)

(assert (=> d!59605 (= c!39531 (and ((_ is Intermediate!978) lt!119951) (undefined!1790 lt!119951)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11739 (_ BitVec 32)) SeekEntryResult!978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59605 (= lt!119951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10407 thiss!1504)) key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(assert (=> d!59605 (validMask!0 (mask!10407 thiss!1504))))

(assert (=> d!59605 (= (seekEntryOrOpen!0 key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)) lt!119953)))

(declare-fun b!237192 () Bool)

(assert (=> b!237192 (= e!154034 Undefined!978)))

(declare-fun b!237193 () Bool)

(declare-fun c!39532 () Bool)

(assert (=> b!237193 (= c!39532 (= lt!119952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237193 (= e!154032 e!154033)))

(assert (= (and d!59605 c!39531) b!237192))

(assert (= (and d!59605 (not c!39531)) b!237188))

(assert (= (and b!237188 c!39530) b!237190))

(assert (= (and b!237188 (not c!39530)) b!237193))

(assert (= (and b!237193 c!39532) b!237189))

(assert (= (and b!237193 (not c!39532)) b!237191))

(declare-fun m!258095 () Bool)

(assert (=> b!237188 m!258095))

(declare-fun m!258097 () Bool)

(assert (=> b!237191 m!258097))

(declare-fun m!258099 () Bool)

(assert (=> d!59605 m!258099))

(assert (=> d!59605 m!258061))

(declare-fun m!258101 () Bool)

(assert (=> d!59605 m!258101))

(declare-fun m!258103 () Bool)

(assert (=> d!59605 m!258103))

(assert (=> d!59605 m!258101))

(declare-fun m!258105 () Bool)

(assert (=> d!59605 m!258105))

(declare-fun m!258107 () Bool)

(assert (=> d!59605 m!258107))

(assert (=> b!237120 d!59605))

(declare-fun d!59607 () Bool)

(declare-fun e!154039 () Bool)

(assert (=> d!59607 e!154039))

(declare-fun res!116266 () Bool)

(assert (=> d!59607 (=> res!116266 e!154039)))

(declare-fun lt!119965 () Bool)

(assert (=> d!59607 (= res!116266 (not lt!119965))))

(declare-fun lt!119963 () Bool)

(assert (=> d!59607 (= lt!119965 lt!119963)))

(declare-datatypes ((Unit!7279 0))(
  ( (Unit!7280) )
))
(declare-fun lt!119962 () Unit!7279)

(declare-fun e!154040 () Unit!7279)

(assert (=> d!59607 (= lt!119962 e!154040)))

(declare-fun c!39535 () Bool)

(assert (=> d!59607 (= c!39535 lt!119963)))

(declare-fun containsKey!266 (List!3482 (_ BitVec 64)) Bool)

(assert (=> d!59607 (= lt!119963 (containsKey!266 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(assert (=> d!59607 (= (contains!1662 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) key!932) lt!119965)))

(declare-fun b!237200 () Bool)

(declare-fun lt!119964 () Unit!7279)

(assert (=> b!237200 (= e!154040 lt!119964)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!214 (List!3482 (_ BitVec 64)) Unit!7279)

(assert (=> b!237200 (= lt!119964 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-datatypes ((Option!281 0))(
  ( (Some!280 (v!5199 V!7961)) (None!279) )
))
(declare-fun isDefined!215 (Option!281) Bool)

(declare-fun getValueByKey!275 (List!3482 (_ BitVec 64)) Option!281)

(assert (=> b!237200 (isDefined!215 (getValueByKey!275 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-fun b!237201 () Bool)

(declare-fun Unit!7281 () Unit!7279)

(assert (=> b!237201 (= e!154040 Unit!7281)))

(declare-fun b!237202 () Bool)

(assert (=> b!237202 (= e!154039 (isDefined!215 (getValueByKey!275 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932)))))

(assert (= (and d!59607 c!39535) b!237200))

(assert (= (and d!59607 (not c!39535)) b!237201))

(assert (= (and d!59607 (not res!116266)) b!237202))

(declare-fun m!258109 () Bool)

(assert (=> d!59607 m!258109))

(declare-fun m!258111 () Bool)

(assert (=> b!237200 m!258111))

(declare-fun m!258113 () Bool)

(assert (=> b!237200 m!258113))

(assert (=> b!237200 m!258113))

(declare-fun m!258115 () Bool)

(assert (=> b!237200 m!258115))

(assert (=> b!237202 m!258113))

(assert (=> b!237202 m!258113))

(assert (=> b!237202 m!258115))

(assert (=> b!237115 d!59607))

(declare-fun bm!22038 () Bool)

(declare-fun call!22044 () ListLongMap!3501)

(declare-fun call!22041 () ListLongMap!3501)

(assert (=> bm!22038 (= call!22044 call!22041)))

(declare-fun bm!22039 () Bool)

(declare-fun call!22047 () ListLongMap!3501)

(declare-fun call!22042 () ListLongMap!3501)

(assert (=> bm!22039 (= call!22047 call!22042)))

(declare-fun b!237245 () Bool)

(declare-fun e!154074 () Unit!7279)

(declare-fun Unit!7282 () Unit!7279)

(assert (=> b!237245 (= e!154074 Unit!7282)))

(declare-fun b!237246 () Bool)

(declare-fun e!154073 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237246 (= e!154073 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237247 () Bool)

(declare-fun e!154075 () Bool)

(declare-fun e!154077 () Bool)

(assert (=> b!237247 (= e!154075 e!154077)))

(declare-fun res!116286 () Bool)

(declare-fun call!22046 () Bool)

(assert (=> b!237247 (= res!116286 call!22046)))

(assert (=> b!237247 (=> (not res!116286) (not e!154077))))

(declare-fun b!237248 () Bool)

(declare-fun e!154072 () Bool)

(declare-fun lt!120028 () ListLongMap!3501)

(declare-fun apply!216 (ListLongMap!3501 (_ BitVec 64)) V!7961)

(declare-fun get!2877 (ValueCell!2774 V!7961) V!7961)

(declare-fun dynLambda!559 (Int (_ BitVec 64)) V!7961)

(assert (=> b!237248 (= e!154072 (= (apply!216 lt!120028 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)) (get!2877 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5914 (_values!4385 thiss!1504))))))

(assert (=> b!237248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun bm!22040 () Bool)

(assert (=> bm!22040 (= call!22046 (contains!1662 lt!120028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237249 () Bool)

(declare-fun e!154078 () Bool)

(declare-fun e!154071 () Bool)

(assert (=> b!237249 (= e!154078 e!154071)))

(declare-fun c!39552 () Bool)

(assert (=> b!237249 (= c!39552 (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237250 () Bool)

(declare-fun e!154069 () Bool)

(assert (=> b!237250 (= e!154069 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237251 () Bool)

(declare-fun res!116292 () Bool)

(assert (=> b!237251 (=> (not res!116292) (not e!154078))))

(assert (=> b!237251 (= res!116292 e!154075)))

(declare-fun c!39551 () Bool)

(assert (=> b!237251 (= c!39551 (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237252 () Bool)

(declare-fun e!154067 () ListLongMap!3501)

(declare-fun +!643 (ListLongMap!3501 tuple2!4586) ListLongMap!3501)

(assert (=> b!237252 (= e!154067 (+!643 call!22042 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))

(declare-fun b!237253 () Bool)

(declare-fun lt!120019 () Unit!7279)

(assert (=> b!237253 (= e!154074 lt!120019)))

(declare-fun lt!120026 () ListLongMap!3501)

(declare-fun getCurrentListMapNoExtraKeys!532 (array!11739 array!11737 (_ BitVec 32) (_ BitVec 32) V!7961 V!7961 (_ BitVec 32) Int) ListLongMap!3501)

(assert (=> b!237253 (= lt!120026 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!120021 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120014 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120014 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120018 () Unit!7279)

(declare-fun addStillContains!192 (ListLongMap!3501 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7279)

(assert (=> b!237253 (= lt!120018 (addStillContains!192 lt!120026 lt!120021 (zeroValue!4243 thiss!1504) lt!120014))))

(assert (=> b!237253 (contains!1662 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))) lt!120014)))

(declare-fun lt!120016 () Unit!7279)

(assert (=> b!237253 (= lt!120016 lt!120018)))

(declare-fun lt!120024 () ListLongMap!3501)

(assert (=> b!237253 (= lt!120024 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!120015 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120015 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120010 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120010 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120029 () Unit!7279)

(declare-fun addApplyDifferent!192 (ListLongMap!3501 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7279)

(assert (=> b!237253 (= lt!120029 (addApplyDifferent!192 lt!120024 lt!120015 (minValue!4243 thiss!1504) lt!120010))))

(assert (=> b!237253 (= (apply!216 (+!643 lt!120024 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))) lt!120010) (apply!216 lt!120024 lt!120010))))

(declare-fun lt!120022 () Unit!7279)

(assert (=> b!237253 (= lt!120022 lt!120029)))

(declare-fun lt!120020 () ListLongMap!3501)

(assert (=> b!237253 (= lt!120020 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!120013 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120031 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120031 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120025 () Unit!7279)

(assert (=> b!237253 (= lt!120025 (addApplyDifferent!192 lt!120020 lt!120013 (zeroValue!4243 thiss!1504) lt!120031))))

(assert (=> b!237253 (= (apply!216 (+!643 lt!120020 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))) lt!120031) (apply!216 lt!120020 lt!120031))))

(declare-fun lt!120012 () Unit!7279)

(assert (=> b!237253 (= lt!120012 lt!120025)))

(declare-fun lt!120030 () ListLongMap!3501)

(assert (=> b!237253 (= lt!120030 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!120011 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120011 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120017 () (_ BitVec 64))

(assert (=> b!237253 (= lt!120017 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237253 (= lt!120019 (addApplyDifferent!192 lt!120030 lt!120011 (minValue!4243 thiss!1504) lt!120017))))

(assert (=> b!237253 (= (apply!216 (+!643 lt!120030 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))) lt!120017) (apply!216 lt!120030 lt!120017))))

(declare-fun b!237254 () Bool)

(declare-fun e!154076 () Bool)

(assert (=> b!237254 (= e!154071 e!154076)))

(declare-fun res!116293 () Bool)

(declare-fun call!22043 () Bool)

(assert (=> b!237254 (= res!116293 call!22043)))

(assert (=> b!237254 (=> (not res!116293) (not e!154076))))

(declare-fun bm!22041 () Bool)

(declare-fun c!39553 () Bool)

(declare-fun c!39548 () Bool)

(declare-fun call!22045 () ListLongMap!3501)

(assert (=> bm!22041 (= call!22042 (+!643 (ite c!39553 call!22041 (ite c!39548 call!22044 call!22045)) (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(declare-fun b!237255 () Bool)

(declare-fun e!154068 () ListLongMap!3501)

(assert (=> b!237255 (= e!154068 call!22047)))

(declare-fun b!237256 () Bool)

(declare-fun e!154070 () ListLongMap!3501)

(assert (=> b!237256 (= e!154067 e!154070)))

(assert (=> b!237256 (= c!39548 (and (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22042 () Bool)

(assert (=> bm!22042 (= call!22045 call!22044)))

(declare-fun bm!22043 () Bool)

(assert (=> bm!22043 (= call!22041 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun b!237257 () Bool)

(assert (=> b!237257 (= e!154068 call!22045)))

(declare-fun b!237258 () Bool)

(assert (=> b!237258 (= e!154070 call!22047)))

(declare-fun b!237259 () Bool)

(declare-fun e!154079 () Bool)

(assert (=> b!237259 (= e!154079 e!154072)))

(declare-fun res!116289 () Bool)

(assert (=> b!237259 (=> (not res!116289) (not e!154072))))

(assert (=> b!237259 (= res!116289 (contains!1662 lt!120028 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun b!237260 () Bool)

(assert (=> b!237260 (= e!154077 (= (apply!216 lt!120028 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4243 thiss!1504)))))

(declare-fun d!59609 () Bool)

(assert (=> d!59609 e!154078))

(declare-fun res!116288 () Bool)

(assert (=> d!59609 (=> (not res!116288) (not e!154078))))

(assert (=> d!59609 (= res!116288 (or (bvsge #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))))

(declare-fun lt!120027 () ListLongMap!3501)

(assert (=> d!59609 (= lt!120028 lt!120027)))

(declare-fun lt!120023 () Unit!7279)

(assert (=> d!59609 (= lt!120023 e!154074)))

(declare-fun c!39550 () Bool)

(assert (=> d!59609 (= c!39550 e!154073)))

(declare-fun res!116285 () Bool)

(assert (=> d!59609 (=> (not res!116285) (not e!154073))))

(assert (=> d!59609 (= res!116285 (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> d!59609 (= lt!120027 e!154067)))

(assert (=> d!59609 (= c!39553 (and (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59609 (validMask!0 (mask!10407 thiss!1504))))

(assert (=> d!59609 (= (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) lt!120028)))

(declare-fun b!237261 () Bool)

(assert (=> b!237261 (= e!154071 (not call!22043))))

(declare-fun b!237262 () Bool)

(declare-fun res!116291 () Bool)

(assert (=> b!237262 (=> (not res!116291) (not e!154078))))

(assert (=> b!237262 (= res!116291 e!154079)))

(declare-fun res!116287 () Bool)

(assert (=> b!237262 (=> res!116287 e!154079)))

(assert (=> b!237262 (= res!116287 (not e!154069))))

(declare-fun res!116290 () Bool)

(assert (=> b!237262 (=> (not res!116290) (not e!154069))))

(assert (=> b!237262 (= res!116290 (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun b!237263 () Bool)

(assert (=> b!237263 (= e!154076 (= (apply!216 lt!120028 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4243 thiss!1504)))))

(declare-fun b!237264 () Bool)

(assert (=> b!237264 (= e!154075 (not call!22046))))

(declare-fun bm!22044 () Bool)

(assert (=> bm!22044 (= call!22043 (contains!1662 lt!120028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237265 () Bool)

(declare-fun c!39549 () Bool)

(assert (=> b!237265 (= c!39549 (and (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237265 (= e!154070 e!154068)))

(assert (= (and d!59609 c!39553) b!237252))

(assert (= (and d!59609 (not c!39553)) b!237256))

(assert (= (and b!237256 c!39548) b!237258))

(assert (= (and b!237256 (not c!39548)) b!237265))

(assert (= (and b!237265 c!39549) b!237255))

(assert (= (and b!237265 (not c!39549)) b!237257))

(assert (= (or b!237255 b!237257) bm!22042))

(assert (= (or b!237258 bm!22042) bm!22038))

(assert (= (or b!237258 b!237255) bm!22039))

(assert (= (or b!237252 bm!22038) bm!22043))

(assert (= (or b!237252 bm!22039) bm!22041))

(assert (= (and d!59609 res!116285) b!237246))

(assert (= (and d!59609 c!39550) b!237253))

(assert (= (and d!59609 (not c!39550)) b!237245))

(assert (= (and d!59609 res!116288) b!237262))

(assert (= (and b!237262 res!116290) b!237250))

(assert (= (and b!237262 (not res!116287)) b!237259))

(assert (= (and b!237259 res!116289) b!237248))

(assert (= (and b!237262 res!116291) b!237251))

(assert (= (and b!237251 c!39551) b!237247))

(assert (= (and b!237251 (not c!39551)) b!237264))

(assert (= (and b!237247 res!116286) b!237260))

(assert (= (or b!237247 b!237264) bm!22040))

(assert (= (and b!237251 res!116292) b!237249))

(assert (= (and b!237249 c!39552) b!237254))

(assert (= (and b!237249 (not c!39552)) b!237261))

(assert (= (and b!237254 res!116293) b!237263))

(assert (= (or b!237254 b!237261) bm!22044))

(declare-fun b_lambda!7965 () Bool)

(assert (=> (not b_lambda!7965) (not b!237248)))

(declare-fun t!8462 () Bool)

(declare-fun tb!2937 () Bool)

(assert (=> (and b!237119 (= (defaultEntry!4402 thiss!1504) (defaultEntry!4402 thiss!1504)) t!8462) tb!2937))

(declare-fun result!5149 () Bool)

(assert (=> tb!2937 (= result!5149 tp_is_empty!6235)))

(assert (=> b!237248 t!8462))

(declare-fun b_and!13341 () Bool)

(assert (= b_and!13335 (and (=> t!8462 result!5149) b_and!13341)))

(assert (=> d!59609 m!258061))

(declare-fun m!258117 () Bool)

(assert (=> b!237250 m!258117))

(assert (=> b!237250 m!258117))

(declare-fun m!258119 () Bool)

(assert (=> b!237250 m!258119))

(declare-fun m!258121 () Bool)

(assert (=> b!237252 m!258121))

(declare-fun m!258123 () Bool)

(assert (=> bm!22043 m!258123))

(declare-fun m!258125 () Bool)

(assert (=> bm!22041 m!258125))

(assert (=> b!237246 m!258117))

(assert (=> b!237246 m!258117))

(assert (=> b!237246 m!258119))

(declare-fun m!258127 () Bool)

(assert (=> bm!22044 m!258127))

(declare-fun m!258129 () Bool)

(assert (=> b!237260 m!258129))

(assert (=> b!237259 m!258117))

(assert (=> b!237259 m!258117))

(declare-fun m!258131 () Bool)

(assert (=> b!237259 m!258131))

(declare-fun m!258133 () Bool)

(assert (=> b!237248 m!258133))

(assert (=> b!237248 m!258117))

(declare-fun m!258135 () Bool)

(assert (=> b!237248 m!258135))

(declare-fun m!258137 () Bool)

(assert (=> b!237248 m!258137))

(assert (=> b!237248 m!258133))

(declare-fun m!258139 () Bool)

(assert (=> b!237248 m!258139))

(assert (=> b!237248 m!258117))

(assert (=> b!237248 m!258137))

(declare-fun m!258141 () Bool)

(assert (=> b!237253 m!258141))

(declare-fun m!258143 () Bool)

(assert (=> b!237253 m!258143))

(declare-fun m!258145 () Bool)

(assert (=> b!237253 m!258145))

(declare-fun m!258147 () Bool)

(assert (=> b!237253 m!258147))

(declare-fun m!258149 () Bool)

(assert (=> b!237253 m!258149))

(declare-fun m!258151 () Bool)

(assert (=> b!237253 m!258151))

(declare-fun m!258153 () Bool)

(assert (=> b!237253 m!258153))

(declare-fun m!258155 () Bool)

(assert (=> b!237253 m!258155))

(declare-fun m!258157 () Bool)

(assert (=> b!237253 m!258157))

(declare-fun m!258159 () Bool)

(assert (=> b!237253 m!258159))

(declare-fun m!258161 () Bool)

(assert (=> b!237253 m!258161))

(assert (=> b!237253 m!258117))

(declare-fun m!258163 () Bool)

(assert (=> b!237253 m!258163))

(assert (=> b!237253 m!258149))

(assert (=> b!237253 m!258143))

(declare-fun m!258165 () Bool)

(assert (=> b!237253 m!258165))

(assert (=> b!237253 m!258123))

(assert (=> b!237253 m!258145))

(declare-fun m!258167 () Bool)

(assert (=> b!237253 m!258167))

(assert (=> b!237253 m!258157))

(declare-fun m!258169 () Bool)

(assert (=> b!237253 m!258169))

(declare-fun m!258171 () Bool)

(assert (=> bm!22040 m!258171))

(declare-fun m!258173 () Bool)

(assert (=> b!237263 m!258173))

(assert (=> b!237115 d!59609))

(declare-fun d!59611 () Bool)

(declare-fun res!116300 () Bool)

(declare-fun e!154082 () Bool)

(assert (=> d!59611 (=> (not res!116300) (not e!154082))))

(declare-fun simpleValid!239 (LongMapFixedSize!3448) Bool)

(assert (=> d!59611 (= res!116300 (simpleValid!239 thiss!1504))))

(assert (=> d!59611 (= (valid!1374 thiss!1504) e!154082)))

(declare-fun b!237274 () Bool)

(declare-fun res!116301 () Bool)

(assert (=> b!237274 (=> (not res!116301) (not e!154082))))

(declare-fun arrayCountValidKeys!0 (array!11739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237274 (= res!116301 (= (arrayCountValidKeys!0 (_keys!6490 thiss!1504) #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))) (_size!1773 thiss!1504)))))

(declare-fun b!237275 () Bool)

(declare-fun res!116302 () Bool)

(assert (=> b!237275 (=> (not res!116302) (not e!154082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11739 (_ BitVec 32)) Bool)

(assert (=> b!237275 (= res!116302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(declare-fun b!237276 () Bool)

(declare-datatypes ((List!3484 0))(
  ( (Nil!3481) (Cons!3480 (h!4134 (_ BitVec 64)) (t!8463 List!3484)) )
))
(declare-fun arrayNoDuplicates!0 (array!11739 (_ BitVec 32) List!3484) Bool)

(assert (=> b!237276 (= e!154082 (arrayNoDuplicates!0 (_keys!6490 thiss!1504) #b00000000000000000000000000000000 Nil!3481))))

(assert (= (and d!59611 res!116300) b!237274))

(assert (= (and b!237274 res!116301) b!237275))

(assert (= (and b!237275 res!116302) b!237276))

(declare-fun m!258175 () Bool)

(assert (=> d!59611 m!258175))

(declare-fun m!258177 () Bool)

(assert (=> b!237274 m!258177))

(declare-fun m!258179 () Bool)

(assert (=> b!237275 m!258179))

(declare-fun m!258181 () Bool)

(assert (=> b!237276 m!258181))

(assert (=> start!22720 d!59611))

(declare-fun d!59613 () Bool)

(assert (=> d!59613 (= (validMask!0 (mask!10407 thiss!1504)) (and (or (= (mask!10407 thiss!1504) #b00000000000000000000000000000111) (= (mask!10407 thiss!1504) #b00000000000000000000000000001111) (= (mask!10407 thiss!1504) #b00000000000000000000000000011111) (= (mask!10407 thiss!1504) #b00000000000000000000000000111111) (= (mask!10407 thiss!1504) #b00000000000000000000000001111111) (= (mask!10407 thiss!1504) #b00000000000000000000000011111111) (= (mask!10407 thiss!1504) #b00000000000000000000000111111111) (= (mask!10407 thiss!1504) #b00000000000000000000001111111111) (= (mask!10407 thiss!1504) #b00000000000000000000011111111111) (= (mask!10407 thiss!1504) #b00000000000000000000111111111111) (= (mask!10407 thiss!1504) #b00000000000000000001111111111111) (= (mask!10407 thiss!1504) #b00000000000000000011111111111111) (= (mask!10407 thiss!1504) #b00000000000000000111111111111111) (= (mask!10407 thiss!1504) #b00000000000000001111111111111111) (= (mask!10407 thiss!1504) #b00000000000000011111111111111111) (= (mask!10407 thiss!1504) #b00000000000000111111111111111111) (= (mask!10407 thiss!1504) #b00000000000001111111111111111111) (= (mask!10407 thiss!1504) #b00000000000011111111111111111111) (= (mask!10407 thiss!1504) #b00000000000111111111111111111111) (= (mask!10407 thiss!1504) #b00000000001111111111111111111111) (= (mask!10407 thiss!1504) #b00000000011111111111111111111111) (= (mask!10407 thiss!1504) #b00000000111111111111111111111111) (= (mask!10407 thiss!1504) #b00000001111111111111111111111111) (= (mask!10407 thiss!1504) #b00000011111111111111111111111111) (= (mask!10407 thiss!1504) #b00000111111111111111111111111111) (= (mask!10407 thiss!1504) #b00001111111111111111111111111111) (= (mask!10407 thiss!1504) #b00011111111111111111111111111111) (= (mask!10407 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10407 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237121 d!59613))

(declare-fun d!59615 () Bool)

(assert (=> d!59615 (= (array_inv!3663 (_keys!6490 thiss!1504)) (bvsge (size!5915 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237119 d!59615))

(declare-fun d!59617 () Bool)

(assert (=> d!59617 (= (array_inv!3664 (_values!4385 thiss!1504)) (bvsge (size!5914 (_values!4385 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237119 d!59617))

(declare-fun b!237284 () Bool)

(declare-fun e!154088 () Bool)

(assert (=> b!237284 (= e!154088 tp_is_empty!6235)))

(declare-fun b!237283 () Bool)

(declare-fun e!154087 () Bool)

(assert (=> b!237283 (= e!154087 tp_is_empty!6235)))

(declare-fun condMapEmpty!10576 () Bool)

(declare-fun mapDefault!10576 () ValueCell!2774)

(assert (=> mapNonEmpty!10567 (= condMapEmpty!10576 (= mapRest!10567 ((as const (Array (_ BitVec 32) ValueCell!2774)) mapDefault!10576)))))

(declare-fun mapRes!10576 () Bool)

(assert (=> mapNonEmpty!10567 (= tp!22306 (and e!154088 mapRes!10576))))

(declare-fun mapIsEmpty!10576 () Bool)

(assert (=> mapIsEmpty!10576 mapRes!10576))

(declare-fun mapNonEmpty!10576 () Bool)

(declare-fun tp!22321 () Bool)

(assert (=> mapNonEmpty!10576 (= mapRes!10576 (and tp!22321 e!154087))))

(declare-fun mapValue!10576 () ValueCell!2774)

(declare-fun mapRest!10576 () (Array (_ BitVec 32) ValueCell!2774))

(declare-fun mapKey!10576 () (_ BitVec 32))

(assert (=> mapNonEmpty!10576 (= mapRest!10567 (store mapRest!10576 mapKey!10576 mapValue!10576))))

(assert (= (and mapNonEmpty!10567 condMapEmpty!10576) mapIsEmpty!10576))

(assert (= (and mapNonEmpty!10567 (not condMapEmpty!10576)) mapNonEmpty!10576))

(assert (= (and mapNonEmpty!10576 ((_ is ValueCellFull!2774) mapValue!10576)) b!237283))

(assert (= (and mapNonEmpty!10567 ((_ is ValueCellFull!2774) mapDefault!10576)) b!237284))

(declare-fun m!258183 () Bool)

(assert (=> mapNonEmpty!10576 m!258183))

(declare-fun b_lambda!7967 () Bool)

(assert (= b_lambda!7965 (or (and b!237119 b_free!6373) b_lambda!7967)))

(check-sat (not b!237274) (not b!237202) (not b_next!6373) (not b_lambda!7967) tp_is_empty!6235 (not b!237276) b_and!13341 (not b!237253) (not bm!22044) (not b!237260) (not bm!22040) (not b!237263) (not d!59609) (not b!237259) (not bm!22043) (not b!237252) (not d!59611) (not b!237191) (not b!237246) (not d!59605) (not b!237200) (not d!59607) (not mapNonEmpty!10576) (not b!237275) (not b!237250) (not b!237248) (not bm!22041))
(check-sat b_and!13341 (not b_next!6373))
(get-model)

(declare-fun d!59619 () Bool)

(declare-fun e!154089 () Bool)

(assert (=> d!59619 e!154089))

(declare-fun res!116303 () Bool)

(assert (=> d!59619 (=> res!116303 e!154089)))

(declare-fun lt!120035 () Bool)

(assert (=> d!59619 (= res!116303 (not lt!120035))))

(declare-fun lt!120033 () Bool)

(assert (=> d!59619 (= lt!120035 lt!120033)))

(declare-fun lt!120032 () Unit!7279)

(declare-fun e!154090 () Unit!7279)

(assert (=> d!59619 (= lt!120032 e!154090)))

(declare-fun c!39554 () Bool)

(assert (=> d!59619 (= c!39554 lt!120033)))

(assert (=> d!59619 (= lt!120033 (containsKey!266 (toList!1766 lt!120028) (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59619 (= (contains!1662 lt!120028 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)) lt!120035)))

(declare-fun b!237285 () Bool)

(declare-fun lt!120034 () Unit!7279)

(assert (=> b!237285 (= e!154090 lt!120034)))

(assert (=> b!237285 (= lt!120034 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1766 lt!120028) (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237285 (isDefined!215 (getValueByKey!275 (toList!1766 lt!120028) (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237286 () Bool)

(declare-fun Unit!7283 () Unit!7279)

(assert (=> b!237286 (= e!154090 Unit!7283)))

(declare-fun b!237287 () Bool)

(assert (=> b!237287 (= e!154089 (isDefined!215 (getValueByKey!275 (toList!1766 lt!120028) (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59619 c!39554) b!237285))

(assert (= (and d!59619 (not c!39554)) b!237286))

(assert (= (and d!59619 (not res!116303)) b!237287))

(assert (=> d!59619 m!258117))

(declare-fun m!258185 () Bool)

(assert (=> d!59619 m!258185))

(assert (=> b!237285 m!258117))

(declare-fun m!258187 () Bool)

(assert (=> b!237285 m!258187))

(assert (=> b!237285 m!258117))

(declare-fun m!258189 () Bool)

(assert (=> b!237285 m!258189))

(assert (=> b!237285 m!258189))

(declare-fun m!258191 () Bool)

(assert (=> b!237285 m!258191))

(assert (=> b!237287 m!258117))

(assert (=> b!237287 m!258189))

(assert (=> b!237287 m!258189))

(assert (=> b!237287 m!258191))

(assert (=> b!237259 d!59619))

(declare-fun b!237296 () Bool)

(declare-fun e!154097 () Bool)

(declare-fun call!22050 () Bool)

(assert (=> b!237296 (= e!154097 call!22050)))

(declare-fun b!237297 () Bool)

(declare-fun e!154099 () Bool)

(assert (=> b!237297 (= e!154099 call!22050)))

(declare-fun d!59621 () Bool)

(declare-fun res!116309 () Bool)

(declare-fun e!154098 () Bool)

(assert (=> d!59621 (=> res!116309 e!154098)))

(assert (=> d!59621 (= res!116309 (bvsge #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> d!59621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)) e!154098)))

(declare-fun b!237298 () Bool)

(assert (=> b!237298 (= e!154097 e!154099)))

(declare-fun lt!120043 () (_ BitVec 64))

(assert (=> b!237298 (= lt!120043 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120044 () Unit!7279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11739 (_ BitVec 64) (_ BitVec 32)) Unit!7279)

(assert (=> b!237298 (= lt!120044 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6490 thiss!1504) lt!120043 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237298 (arrayContainsKey!0 (_keys!6490 thiss!1504) lt!120043 #b00000000000000000000000000000000)))

(declare-fun lt!120042 () Unit!7279)

(assert (=> b!237298 (= lt!120042 lt!120044)))

(declare-fun res!116308 () Bool)

(assert (=> b!237298 (= res!116308 (= (seekEntryOrOpen!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000) (_keys!6490 thiss!1504) (mask!10407 thiss!1504)) (Found!978 #b00000000000000000000000000000000)))))

(assert (=> b!237298 (=> (not res!116308) (not e!154099))))

(declare-fun b!237299 () Bool)

(assert (=> b!237299 (= e!154098 e!154097)))

(declare-fun c!39557 () Bool)

(assert (=> b!237299 (= c!39557 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22047 () Bool)

(assert (=> bm!22047 (= call!22050 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(assert (= (and d!59621 (not res!116309)) b!237299))

(assert (= (and b!237299 c!39557) b!237298))

(assert (= (and b!237299 (not c!39557)) b!237296))

(assert (= (and b!237298 res!116308) b!237297))

(assert (= (or b!237297 b!237296) bm!22047))

(assert (=> b!237298 m!258117))

(declare-fun m!258193 () Bool)

(assert (=> b!237298 m!258193))

(declare-fun m!258195 () Bool)

(assert (=> b!237298 m!258195))

(assert (=> b!237298 m!258117))

(declare-fun m!258197 () Bool)

(assert (=> b!237298 m!258197))

(assert (=> b!237299 m!258117))

(assert (=> b!237299 m!258117))

(assert (=> b!237299 m!258119))

(declare-fun m!258199 () Bool)

(assert (=> bm!22047 m!258199))

(assert (=> b!237275 d!59621))

(declare-fun b!237318 () Bool)

(declare-fun e!154113 () SeekEntryResult!978)

(assert (=> b!237318 (= e!154113 (Intermediate!978 false (toIndex!0 key!932 (mask!10407 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237319 () Bool)

(declare-fun lt!120049 () SeekEntryResult!978)

(assert (=> b!237319 (and (bvsge (index!6084 lt!120049) #b00000000000000000000000000000000) (bvslt (index!6084 lt!120049) (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun res!116317 () Bool)

(assert (=> b!237319 (= res!116317 (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6084 lt!120049)) key!932))))

(declare-fun e!154110 () Bool)

(assert (=> b!237319 (=> res!116317 e!154110)))

(declare-fun e!154112 () Bool)

(assert (=> b!237319 (= e!154112 e!154110)))

(declare-fun b!237320 () Bool)

(declare-fun e!154114 () SeekEntryResult!978)

(assert (=> b!237320 (= e!154114 (Intermediate!978 true (toIndex!0 key!932 (mask!10407 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!59623 () Bool)

(declare-fun e!154111 () Bool)

(assert (=> d!59623 e!154111))

(declare-fun c!39565 () Bool)

(assert (=> d!59623 (= c!39565 (and ((_ is Intermediate!978) lt!120049) (undefined!1790 lt!120049)))))

(assert (=> d!59623 (= lt!120049 e!154114)))

(declare-fun c!39564 () Bool)

(assert (=> d!59623 (= c!39564 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!120050 () (_ BitVec 64))

(assert (=> d!59623 (= lt!120050 (select (arr!5576 (_keys!6490 thiss!1504)) (toIndex!0 key!932 (mask!10407 thiss!1504))))))

(assert (=> d!59623 (validMask!0 (mask!10407 thiss!1504))))

(assert (=> d!59623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10407 thiss!1504)) key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)) lt!120049)))

(declare-fun b!237321 () Bool)

(assert (=> b!237321 (= e!154114 e!154113)))

(declare-fun c!39566 () Bool)

(assert (=> b!237321 (= c!39566 (or (= lt!120050 key!932) (= (bvadd lt!120050 lt!120050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237322 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237322 (= e!154113 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10407 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10407 thiss!1504)) key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(declare-fun b!237323 () Bool)

(assert (=> b!237323 (= e!154111 (bvsge (x!23904 lt!120049) #b01111111111111111111111111111110))))

(declare-fun b!237324 () Bool)

(assert (=> b!237324 (and (bvsge (index!6084 lt!120049) #b00000000000000000000000000000000) (bvslt (index!6084 lt!120049) (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun res!116316 () Bool)

(assert (=> b!237324 (= res!116316 (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6084 lt!120049)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237324 (=> res!116316 e!154110)))

(declare-fun b!237325 () Bool)

(assert (=> b!237325 (and (bvsge (index!6084 lt!120049) #b00000000000000000000000000000000) (bvslt (index!6084 lt!120049) (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> b!237325 (= e!154110 (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6084 lt!120049)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237326 () Bool)

(assert (=> b!237326 (= e!154111 e!154112)))

(declare-fun res!116318 () Bool)

(assert (=> b!237326 (= res!116318 (and ((_ is Intermediate!978) lt!120049) (not (undefined!1790 lt!120049)) (bvslt (x!23904 lt!120049) #b01111111111111111111111111111110) (bvsge (x!23904 lt!120049) #b00000000000000000000000000000000) (bvsge (x!23904 lt!120049) #b00000000000000000000000000000000)))))

(assert (=> b!237326 (=> (not res!116318) (not e!154112))))

(assert (= (and d!59623 c!39564) b!237320))

(assert (= (and d!59623 (not c!39564)) b!237321))

(assert (= (and b!237321 c!39566) b!237318))

(assert (= (and b!237321 (not c!39566)) b!237322))

(assert (= (and d!59623 c!39565) b!237323))

(assert (= (and d!59623 (not c!39565)) b!237326))

(assert (= (and b!237326 res!116318) b!237319))

(assert (= (and b!237319 (not res!116317)) b!237324))

(assert (= (and b!237324 (not res!116316)) b!237325))

(assert (=> d!59623 m!258101))

(declare-fun m!258201 () Bool)

(assert (=> d!59623 m!258201))

(assert (=> d!59623 m!258061))

(declare-fun m!258203 () Bool)

(assert (=> b!237319 m!258203))

(assert (=> b!237322 m!258101))

(declare-fun m!258205 () Bool)

(assert (=> b!237322 m!258205))

(assert (=> b!237322 m!258205))

(declare-fun m!258207 () Bool)

(assert (=> b!237322 m!258207))

(assert (=> b!237324 m!258203))

(assert (=> b!237325 m!258203))

(assert (=> d!59605 d!59623))

(declare-fun d!59625 () Bool)

(declare-fun lt!120056 () (_ BitVec 32))

(declare-fun lt!120055 () (_ BitVec 32))

(assert (=> d!59625 (= lt!120056 (bvmul (bvxor lt!120055 (bvlshr lt!120055 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59625 (= lt!120055 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59625 (and (bvsge (mask!10407 thiss!1504) #b00000000000000000000000000000000) (let ((res!116319 (let ((h!4135 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23922 (bvmul (bvxor h!4135 (bvlshr h!4135 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23922 (bvlshr x!23922 #b00000000000000000000000000001101)) (mask!10407 thiss!1504)))))) (and (bvslt res!116319 (bvadd (mask!10407 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116319 #b00000000000000000000000000000000))))))

(assert (=> d!59625 (= (toIndex!0 key!932 (mask!10407 thiss!1504)) (bvand (bvxor lt!120056 (bvlshr lt!120056 #b00000000000000000000000000001101)) (mask!10407 thiss!1504)))))

(assert (=> d!59605 d!59625))

(assert (=> d!59605 d!59613))

(declare-fun d!59627 () Bool)

(declare-fun get!2878 (Option!281) V!7961)

(assert (=> d!59627 (= (apply!216 lt!120028 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2878 (getValueByKey!275 (toList!1766 lt!120028) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8777 () Bool)

(assert (= bs!8777 d!59627))

(declare-fun m!258209 () Bool)

(assert (=> bs!8777 m!258209))

(assert (=> bs!8777 m!258209))

(declare-fun m!258211 () Bool)

(assert (=> bs!8777 m!258211))

(assert (=> b!237260 d!59627))

(declare-fun b!237337 () Bool)

(declare-fun e!154125 () Bool)

(declare-fun e!154124 () Bool)

(assert (=> b!237337 (= e!154125 e!154124)))

(declare-fun res!116326 () Bool)

(assert (=> b!237337 (=> (not res!116326) (not e!154124))))

(declare-fun e!154123 () Bool)

(assert (=> b!237337 (= res!116326 (not e!154123))))

(declare-fun res!116327 () Bool)

(assert (=> b!237337 (=> (not res!116327) (not e!154123))))

(assert (=> b!237337 (= res!116327 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237339 () Bool)

(declare-fun contains!1664 (List!3484 (_ BitVec 64)) Bool)

(assert (=> b!237339 (= e!154123 (contains!1664 Nil!3481 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237340 () Bool)

(declare-fun e!154126 () Bool)

(declare-fun call!22053 () Bool)

(assert (=> b!237340 (= e!154126 call!22053)))

(declare-fun b!237338 () Bool)

(assert (=> b!237338 (= e!154126 call!22053)))

(declare-fun d!59629 () Bool)

(declare-fun res!116328 () Bool)

(assert (=> d!59629 (=> res!116328 e!154125)))

(assert (=> d!59629 (= res!116328 (bvsge #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> d!59629 (= (arrayNoDuplicates!0 (_keys!6490 thiss!1504) #b00000000000000000000000000000000 Nil!3481) e!154125)))

(declare-fun b!237341 () Bool)

(assert (=> b!237341 (= e!154124 e!154126)))

(declare-fun c!39569 () Bool)

(assert (=> b!237341 (= c!39569 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22050 () Bool)

(assert (=> bm!22050 (= call!22053 (arrayNoDuplicates!0 (_keys!6490 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39569 (Cons!3480 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000) Nil!3481) Nil!3481)))))

(assert (= (and d!59629 (not res!116328)) b!237337))

(assert (= (and b!237337 res!116327) b!237339))

(assert (= (and b!237337 res!116326) b!237341))

(assert (= (and b!237341 c!39569) b!237340))

(assert (= (and b!237341 (not c!39569)) b!237338))

(assert (= (or b!237340 b!237338) bm!22050))

(assert (=> b!237337 m!258117))

(assert (=> b!237337 m!258117))

(assert (=> b!237337 m!258119))

(assert (=> b!237339 m!258117))

(assert (=> b!237339 m!258117))

(declare-fun m!258213 () Bool)

(assert (=> b!237339 m!258213))

(assert (=> b!237341 m!258117))

(assert (=> b!237341 m!258117))

(assert (=> b!237341 m!258119))

(assert (=> bm!22050 m!258117))

(declare-fun m!258215 () Bool)

(assert (=> bm!22050 m!258215))

(assert (=> b!237276 d!59629))

(declare-fun d!59631 () Bool)

(declare-fun e!154129 () Bool)

(assert (=> d!59631 e!154129))

(declare-fun res!116333 () Bool)

(assert (=> d!59631 (=> (not res!116333) (not e!154129))))

(declare-fun lt!120066 () ListLongMap!3501)

(assert (=> d!59631 (= res!116333 (contains!1662 lt!120066 (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(declare-fun lt!120068 () List!3482)

(assert (=> d!59631 (= lt!120066 (ListLongMap!3502 lt!120068))))

(declare-fun lt!120067 () Unit!7279)

(declare-fun lt!120065 () Unit!7279)

(assert (=> d!59631 (= lt!120067 lt!120065)))

(assert (=> d!59631 (= (getValueByKey!275 lt!120068 (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!154 (List!3482 (_ BitVec 64) V!7961) Unit!7279)

(assert (=> d!59631 (= lt!120065 (lemmaContainsTupThenGetReturnValue!154 lt!120068 (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(declare-fun insertStrictlySorted!157 (List!3482 (_ BitVec 64) V!7961) List!3482)

(assert (=> d!59631 (= lt!120068 (insertStrictlySorted!157 (toList!1766 call!22042) (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(assert (=> d!59631 (= (+!643 call!22042 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))) lt!120066)))

(declare-fun b!237346 () Bool)

(declare-fun res!116334 () Bool)

(assert (=> b!237346 (=> (not res!116334) (not e!154129))))

(assert (=> b!237346 (= res!116334 (= (getValueByKey!275 (toList!1766 lt!120066) (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(declare-fun b!237347 () Bool)

(declare-fun contains!1665 (List!3482 tuple2!4586) Bool)

(assert (=> b!237347 (= e!154129 (contains!1665 (toList!1766 lt!120066) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))

(assert (= (and d!59631 res!116333) b!237346))

(assert (= (and b!237346 res!116334) b!237347))

(declare-fun m!258217 () Bool)

(assert (=> d!59631 m!258217))

(declare-fun m!258219 () Bool)

(assert (=> d!59631 m!258219))

(declare-fun m!258221 () Bool)

(assert (=> d!59631 m!258221))

(declare-fun m!258223 () Bool)

(assert (=> d!59631 m!258223))

(declare-fun m!258225 () Bool)

(assert (=> b!237346 m!258225))

(declare-fun m!258227 () Bool)

(assert (=> b!237347 m!258227))

(assert (=> b!237252 d!59631))

(declare-fun b!237372 () Bool)

(declare-fun e!154147 () Bool)

(declare-fun lt!120086 () ListLongMap!3501)

(assert (=> b!237372 (= e!154147 (= lt!120086 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4402 thiss!1504))))))

(declare-fun bm!22053 () Bool)

(declare-fun call!22056 () ListLongMap!3501)

(assert (=> bm!22053 (= call!22056 (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4402 thiss!1504)))))

(declare-fun b!237373 () Bool)

(assert (=> b!237373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> b!237373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5914 (_values!4385 thiss!1504))))))

(declare-fun e!154150 () Bool)

(assert (=> b!237373 (= e!154150 (= (apply!216 lt!120086 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)) (get!2877 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237374 () Bool)

(declare-fun e!154144 () ListLongMap!3501)

(assert (=> b!237374 (= e!154144 (ListLongMap!3502 Nil!3479))))

(declare-fun b!237375 () Bool)

(declare-fun e!154149 () ListLongMap!3501)

(assert (=> b!237375 (= e!154144 e!154149)))

(declare-fun c!39579 () Bool)

(assert (=> b!237375 (= c!39579 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237376 () Bool)

(assert (=> b!237376 (= e!154149 call!22056)))

(declare-fun b!237377 () Bool)

(declare-fun isEmpty!522 (ListLongMap!3501) Bool)

(assert (=> b!237377 (= e!154147 (isEmpty!522 lt!120086))))

(declare-fun b!237378 () Bool)

(declare-fun e!154146 () Bool)

(assert (=> b!237378 (= e!154146 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237378 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!237379 () Bool)

(declare-fun e!154148 () Bool)

(declare-fun e!154145 () Bool)

(assert (=> b!237379 (= e!154148 e!154145)))

(declare-fun c!39578 () Bool)

(assert (=> b!237379 (= c!39578 e!154146)))

(declare-fun res!116344 () Bool)

(assert (=> b!237379 (=> (not res!116344) (not e!154146))))

(assert (=> b!237379 (= res!116344 (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun b!237380 () Bool)

(declare-fun res!116346 () Bool)

(assert (=> b!237380 (=> (not res!116346) (not e!154148))))

(assert (=> b!237380 (= res!116346 (not (contains!1662 lt!120086 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237381 () Bool)

(declare-fun lt!120087 () Unit!7279)

(declare-fun lt!120085 () Unit!7279)

(assert (=> b!237381 (= lt!120087 lt!120085)))

(declare-fun lt!120084 () (_ BitVec 64))

(declare-fun lt!120083 () (_ BitVec 64))

(declare-fun lt!120088 () ListLongMap!3501)

(declare-fun lt!120089 () V!7961)

(assert (=> b!237381 (not (contains!1662 (+!643 lt!120088 (tuple2!4587 lt!120083 lt!120089)) lt!120084))))

(declare-fun addStillNotContains!119 (ListLongMap!3501 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7279)

(assert (=> b!237381 (= lt!120085 (addStillNotContains!119 lt!120088 lt!120083 lt!120089 lt!120084))))

(assert (=> b!237381 (= lt!120084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!237381 (= lt!120089 (get!2877 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237381 (= lt!120083 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237381 (= lt!120088 call!22056)))

(assert (=> b!237381 (= e!154149 (+!643 call!22056 (tuple2!4587 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000) (get!2877 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!237382 () Bool)

(assert (=> b!237382 (= e!154145 e!154150)))

(assert (=> b!237382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun res!116345 () Bool)

(assert (=> b!237382 (= res!116345 (contains!1662 lt!120086 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237382 (=> (not res!116345) (not e!154150))))

(declare-fun b!237383 () Bool)

(assert (=> b!237383 (= e!154145 e!154147)))

(declare-fun c!39581 () Bool)

(assert (=> b!237383 (= c!39581 (bvslt #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(declare-fun d!59633 () Bool)

(assert (=> d!59633 e!154148))

(declare-fun res!116343 () Bool)

(assert (=> d!59633 (=> (not res!116343) (not e!154148))))

(assert (=> d!59633 (= res!116343 (not (contains!1662 lt!120086 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59633 (= lt!120086 e!154144)))

(declare-fun c!39580 () Bool)

(assert (=> d!59633 (= c!39580 (bvsge #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> d!59633 (validMask!0 (mask!10407 thiss!1504))))

(assert (=> d!59633 (= (getCurrentListMapNoExtraKeys!532 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) lt!120086)))

(assert (= (and d!59633 c!39580) b!237374))

(assert (= (and d!59633 (not c!39580)) b!237375))

(assert (= (and b!237375 c!39579) b!237381))

(assert (= (and b!237375 (not c!39579)) b!237376))

(assert (= (or b!237381 b!237376) bm!22053))

(assert (= (and d!59633 res!116343) b!237380))

(assert (= (and b!237380 res!116346) b!237379))

(assert (= (and b!237379 res!116344) b!237378))

(assert (= (and b!237379 c!39578) b!237382))

(assert (= (and b!237379 (not c!39578)) b!237383))

(assert (= (and b!237382 res!116345) b!237373))

(assert (= (and b!237383 c!39581) b!237372))

(assert (= (and b!237383 (not c!39581)) b!237377))

(declare-fun b_lambda!7969 () Bool)

(assert (=> (not b_lambda!7969) (not b!237373)))

(assert (=> b!237373 t!8462))

(declare-fun b_and!13343 () Bool)

(assert (= b_and!13341 (and (=> t!8462 result!5149) b_and!13343)))

(declare-fun b_lambda!7971 () Bool)

(assert (=> (not b_lambda!7971) (not b!237381)))

(assert (=> b!237381 t!8462))

(declare-fun b_and!13345 () Bool)

(assert (= b_and!13343 (and (=> t!8462 result!5149) b_and!13345)))

(declare-fun m!258229 () Bool)

(assert (=> b!237372 m!258229))

(assert (=> bm!22053 m!258229))

(declare-fun m!258231 () Bool)

(assert (=> d!59633 m!258231))

(assert (=> d!59633 m!258061))

(declare-fun m!258233 () Bool)

(assert (=> b!237377 m!258233))

(assert (=> b!237381 m!258133))

(assert (=> b!237381 m!258117))

(declare-fun m!258235 () Bool)

(assert (=> b!237381 m!258235))

(declare-fun m!258237 () Bool)

(assert (=> b!237381 m!258237))

(assert (=> b!237381 m!258137))

(assert (=> b!237381 m!258133))

(assert (=> b!237381 m!258139))

(declare-fun m!258239 () Bool)

(assert (=> b!237381 m!258239))

(assert (=> b!237381 m!258239))

(declare-fun m!258241 () Bool)

(assert (=> b!237381 m!258241))

(assert (=> b!237381 m!258137))

(assert (=> b!237373 m!258133))

(assert (=> b!237373 m!258117))

(assert (=> b!237373 m!258137))

(assert (=> b!237373 m!258133))

(assert (=> b!237373 m!258139))

(assert (=> b!237373 m!258117))

(declare-fun m!258243 () Bool)

(assert (=> b!237373 m!258243))

(assert (=> b!237373 m!258137))

(assert (=> b!237378 m!258117))

(assert (=> b!237378 m!258117))

(assert (=> b!237378 m!258119))

(assert (=> b!237382 m!258117))

(assert (=> b!237382 m!258117))

(declare-fun m!258245 () Bool)

(assert (=> b!237382 m!258245))

(assert (=> b!237375 m!258117))

(assert (=> b!237375 m!258117))

(assert (=> b!237375 m!258119))

(declare-fun m!258247 () Bool)

(assert (=> b!237380 m!258247))

(assert (=> bm!22043 d!59633))

(declare-fun b!237396 () Bool)

(declare-fun e!154159 () SeekEntryResult!978)

(assert (=> b!237396 (= e!154159 Undefined!978)))

(declare-fun b!237397 () Bool)

(declare-fun c!39589 () Bool)

(declare-fun lt!120095 () (_ BitVec 64))

(assert (=> b!237397 (= c!39589 (= lt!120095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154157 () SeekEntryResult!978)

(declare-fun e!154158 () SeekEntryResult!978)

(assert (=> b!237397 (= e!154157 e!154158)))

(declare-fun b!237398 () Bool)

(assert (=> b!237398 (= e!154158 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23904 lt!119951) #b00000000000000000000000000000001) (nextIndex!0 (index!6084 lt!119951) (bvadd (x!23904 lt!119951) #b00000000000000000000000000000001) (mask!10407 thiss!1504)) (index!6084 lt!119951) key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)))))

(declare-fun b!237399 () Bool)

(assert (=> b!237399 (= e!154159 e!154157)))

(declare-fun c!39590 () Bool)

(assert (=> b!237399 (= c!39590 (= lt!120095 key!932))))

(declare-fun b!237400 () Bool)

(assert (=> b!237400 (= e!154158 (MissingVacant!978 (index!6084 lt!119951)))))

(declare-fun b!237401 () Bool)

(assert (=> b!237401 (= e!154157 (Found!978 (index!6084 lt!119951)))))

(declare-fun lt!120094 () SeekEntryResult!978)

(declare-fun d!59635 () Bool)

(assert (=> d!59635 (and (or ((_ is Undefined!978) lt!120094) (not ((_ is Found!978) lt!120094)) (and (bvsge (index!6083 lt!120094) #b00000000000000000000000000000000) (bvslt (index!6083 lt!120094) (size!5915 (_keys!6490 thiss!1504))))) (or ((_ is Undefined!978) lt!120094) ((_ is Found!978) lt!120094) (not ((_ is MissingVacant!978) lt!120094)) (not (= (index!6085 lt!120094) (index!6084 lt!119951))) (and (bvsge (index!6085 lt!120094) #b00000000000000000000000000000000) (bvslt (index!6085 lt!120094) (size!5915 (_keys!6490 thiss!1504))))) (or ((_ is Undefined!978) lt!120094) (ite ((_ is Found!978) lt!120094) (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6083 lt!120094)) key!932) (and ((_ is MissingVacant!978) lt!120094) (= (index!6085 lt!120094) (index!6084 lt!119951)) (= (select (arr!5576 (_keys!6490 thiss!1504)) (index!6085 lt!120094)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59635 (= lt!120094 e!154159)))

(declare-fun c!39588 () Bool)

(assert (=> d!59635 (= c!39588 (bvsge (x!23904 lt!119951) #b01111111111111111111111111111110))))

(assert (=> d!59635 (= lt!120095 (select (arr!5576 (_keys!6490 thiss!1504)) (index!6084 lt!119951)))))

(assert (=> d!59635 (validMask!0 (mask!10407 thiss!1504))))

(assert (=> d!59635 (= (seekKeyOrZeroReturnVacant!0 (x!23904 lt!119951) (index!6084 lt!119951) (index!6084 lt!119951) key!932 (_keys!6490 thiss!1504) (mask!10407 thiss!1504)) lt!120094)))

(assert (= (and d!59635 c!39588) b!237396))

(assert (= (and d!59635 (not c!39588)) b!237399))

(assert (= (and b!237399 c!39590) b!237401))

(assert (= (and b!237399 (not c!39590)) b!237397))

(assert (= (and b!237397 c!39589) b!237400))

(assert (= (and b!237397 (not c!39589)) b!237398))

(declare-fun m!258249 () Bool)

(assert (=> b!237398 m!258249))

(assert (=> b!237398 m!258249))

(declare-fun m!258251 () Bool)

(assert (=> b!237398 m!258251))

(declare-fun m!258253 () Bool)

(assert (=> d!59635 m!258253))

(declare-fun m!258255 () Bool)

(assert (=> d!59635 m!258255))

(assert (=> d!59635 m!258095))

(assert (=> d!59635 m!258061))

(assert (=> b!237191 d!59635))

(declare-fun d!59637 () Bool)

(declare-fun e!154160 () Bool)

(assert (=> d!59637 e!154160))

(declare-fun res!116347 () Bool)

(assert (=> d!59637 (=> res!116347 e!154160)))

(declare-fun lt!120099 () Bool)

(assert (=> d!59637 (= res!116347 (not lt!120099))))

(declare-fun lt!120097 () Bool)

(assert (=> d!59637 (= lt!120099 lt!120097)))

(declare-fun lt!120096 () Unit!7279)

(declare-fun e!154161 () Unit!7279)

(assert (=> d!59637 (= lt!120096 e!154161)))

(declare-fun c!39591 () Bool)

(assert (=> d!59637 (= c!39591 lt!120097)))

(assert (=> d!59637 (= lt!120097 (containsKey!266 (toList!1766 lt!120028) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59637 (= (contains!1662 lt!120028 #b0000000000000000000000000000000000000000000000000000000000000000) lt!120099)))

(declare-fun b!237402 () Bool)

(declare-fun lt!120098 () Unit!7279)

(assert (=> b!237402 (= e!154161 lt!120098)))

(assert (=> b!237402 (= lt!120098 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1766 lt!120028) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237402 (isDefined!215 (getValueByKey!275 (toList!1766 lt!120028) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237403 () Bool)

(declare-fun Unit!7284 () Unit!7279)

(assert (=> b!237403 (= e!154161 Unit!7284)))

(declare-fun b!237404 () Bool)

(assert (=> b!237404 (= e!154160 (isDefined!215 (getValueByKey!275 (toList!1766 lt!120028) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59637 c!39591) b!237402))

(assert (= (and d!59637 (not c!39591)) b!237403))

(assert (= (and d!59637 (not res!116347)) b!237404))

(declare-fun m!258257 () Bool)

(assert (=> d!59637 m!258257))

(declare-fun m!258259 () Bool)

(assert (=> b!237402 m!258259))

(assert (=> b!237402 m!258209))

(assert (=> b!237402 m!258209))

(declare-fun m!258261 () Bool)

(assert (=> b!237402 m!258261))

(assert (=> b!237404 m!258209))

(assert (=> b!237404 m!258209))

(assert (=> b!237404 m!258261))

(assert (=> bm!22040 d!59637))

(declare-fun d!59639 () Bool)

(assert (=> d!59639 (isDefined!215 (getValueByKey!275 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-fun lt!120102 () Unit!7279)

(declare-fun choose!1117 (List!3482 (_ BitVec 64)) Unit!7279)

(assert (=> d!59639 (= lt!120102 (choose!1117 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-fun e!154164 () Bool)

(assert (=> d!59639 e!154164))

(declare-fun res!116350 () Bool)

(assert (=> d!59639 (=> (not res!116350) (not e!154164))))

(declare-fun isStrictlySorted!352 (List!3482) Bool)

(assert (=> d!59639 (= res!116350 (isStrictlySorted!352 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))))

(assert (=> d!59639 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932) lt!120102)))

(declare-fun b!237407 () Bool)

(assert (=> b!237407 (= e!154164 (containsKey!266 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(assert (= (and d!59639 res!116350) b!237407))

(assert (=> d!59639 m!258113))

(assert (=> d!59639 m!258113))

(assert (=> d!59639 m!258115))

(declare-fun m!258263 () Bool)

(assert (=> d!59639 m!258263))

(declare-fun m!258265 () Bool)

(assert (=> d!59639 m!258265))

(assert (=> b!237407 m!258109))

(assert (=> b!237200 d!59639))

(declare-fun d!59641 () Bool)

(declare-fun isEmpty!523 (Option!281) Bool)

(assert (=> d!59641 (= (isDefined!215 (getValueByKey!275 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932)) (not (isEmpty!523 (getValueByKey!275 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))))

(declare-fun bs!8778 () Bool)

(assert (= bs!8778 d!59641))

(assert (=> bs!8778 m!258113))

(declare-fun m!258267 () Bool)

(assert (=> bs!8778 m!258267))

(assert (=> b!237200 d!59641))

(declare-fun d!59643 () Bool)

(declare-fun c!39596 () Bool)

(assert (=> d!59643 (= c!39596 (and ((_ is Cons!3478) (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (= (_1!2304 (h!4132 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)))))

(declare-fun e!154169 () Option!281)

(assert (=> d!59643 (= (getValueByKey!275 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932) e!154169)))

(declare-fun b!237418 () Bool)

(declare-fun e!154170 () Option!281)

(assert (=> b!237418 (= e!154170 (getValueByKey!275 (t!8459 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) key!932))))

(declare-fun b!237416 () Bool)

(assert (=> b!237416 (= e!154169 (Some!280 (_2!2304 (h!4132 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))))))

(declare-fun b!237419 () Bool)

(assert (=> b!237419 (= e!154170 None!279)))

(declare-fun b!237417 () Bool)

(assert (=> b!237417 (= e!154169 e!154170)))

(declare-fun c!39597 () Bool)

(assert (=> b!237417 (= c!39597 (and ((_ is Cons!3478) (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (not (= (_1!2304 (h!4132 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932))))))

(assert (= (and d!59643 c!39596) b!237416))

(assert (= (and d!59643 (not c!39596)) b!237417))

(assert (= (and b!237417 c!39597) b!237418))

(assert (= (and b!237417 (not c!39597)) b!237419))

(declare-fun m!258269 () Bool)

(assert (=> b!237418 m!258269))

(assert (=> b!237200 d!59643))

(declare-fun b!237428 () Bool)

(declare-fun e!154176 () (_ BitVec 32))

(declare-fun call!22059 () (_ BitVec 32))

(assert (=> b!237428 (= e!154176 call!22059)))

(declare-fun b!237429 () Bool)

(declare-fun e!154175 () (_ BitVec 32))

(assert (=> b!237429 (= e!154175 #b00000000000000000000000000000000)))

(declare-fun b!237430 () Bool)

(assert (=> b!237430 (= e!154176 (bvadd #b00000000000000000000000000000001 call!22059))))

(declare-fun d!59645 () Bool)

(declare-fun lt!120105 () (_ BitVec 32))

(assert (=> d!59645 (and (bvsge lt!120105 #b00000000000000000000000000000000) (bvsle lt!120105 (bvsub (size!5915 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59645 (= lt!120105 e!154175)))

(declare-fun c!39603 () Bool)

(assert (=> d!59645 (= c!39603 (bvsge #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> d!59645 (and (bvsle #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5915 (_keys!6490 thiss!1504)) (size!5915 (_keys!6490 thiss!1504))))))

(assert (=> d!59645 (= (arrayCountValidKeys!0 (_keys!6490 thiss!1504) #b00000000000000000000000000000000 (size!5915 (_keys!6490 thiss!1504))) lt!120105)))

(declare-fun b!237431 () Bool)

(assert (=> b!237431 (= e!154175 e!154176)))

(declare-fun c!39602 () Bool)

(assert (=> b!237431 (= c!39602 (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22056 () Bool)

(assert (=> bm!22056 (= call!22059 (arrayCountValidKeys!0 (_keys!6490 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5915 (_keys!6490 thiss!1504))))))

(assert (= (and d!59645 c!39603) b!237429))

(assert (= (and d!59645 (not c!39603)) b!237431))

(assert (= (and b!237431 c!39602) b!237430))

(assert (= (and b!237431 (not c!39602)) b!237428))

(assert (= (or b!237430 b!237428) bm!22056))

(assert (=> b!237431 m!258117))

(assert (=> b!237431 m!258117))

(assert (=> b!237431 m!258119))

(declare-fun m!258271 () Bool)

(assert (=> bm!22056 m!258271))

(assert (=> b!237274 d!59645))

(declare-fun d!59647 () Bool)

(assert (=> d!59647 (= (validKeyInArray!0 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237250 d!59647))

(assert (=> b!237202 d!59641))

(assert (=> b!237202 d!59643))

(declare-fun d!59649 () Bool)

(declare-fun res!116360 () Bool)

(declare-fun e!154179 () Bool)

(assert (=> d!59649 (=> (not res!116360) (not e!154179))))

(assert (=> d!59649 (= res!116360 (validMask!0 (mask!10407 thiss!1504)))))

(assert (=> d!59649 (= (simpleValid!239 thiss!1504) e!154179)))

(declare-fun b!237442 () Bool)

(declare-fun res!116362 () Bool)

(assert (=> b!237442 (=> (not res!116362) (not e!154179))))

(declare-fun size!5920 (LongMapFixedSize!3448) (_ BitVec 32))

(assert (=> b!237442 (= res!116362 (= (size!5920 thiss!1504) (bvadd (_size!1773 thiss!1504) (bvsdiv (bvadd (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!237441 () Bool)

(declare-fun res!116361 () Bool)

(assert (=> b!237441 (=> (not res!116361) (not e!154179))))

(assert (=> b!237441 (= res!116361 (bvsge (size!5920 thiss!1504) (_size!1773 thiss!1504)))))

(declare-fun b!237440 () Bool)

(declare-fun res!116359 () Bool)

(assert (=> b!237440 (=> (not res!116359) (not e!154179))))

(assert (=> b!237440 (= res!116359 (and (= (size!5914 (_values!4385 thiss!1504)) (bvadd (mask!10407 thiss!1504) #b00000000000000000000000000000001)) (= (size!5915 (_keys!6490 thiss!1504)) (size!5914 (_values!4385 thiss!1504))) (bvsge (_size!1773 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1773 thiss!1504) (bvadd (mask!10407 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!237443 () Bool)

(assert (=> b!237443 (= e!154179 (and (bvsge (extraKeys!4139 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4139 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1773 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!59649 res!116360) b!237440))

(assert (= (and b!237440 res!116359) b!237441))

(assert (= (and b!237441 res!116361) b!237442))

(assert (= (and b!237442 res!116362) b!237443))

(assert (=> d!59649 m!258061))

(declare-fun m!258273 () Bool)

(assert (=> b!237442 m!258273))

(assert (=> b!237441 m!258273))

(assert (=> d!59611 d!59649))

(assert (=> d!59609 d!59613))

(assert (=> b!237246 d!59647))

(declare-fun d!59651 () Bool)

(declare-fun res!116367 () Bool)

(declare-fun e!154184 () Bool)

(assert (=> d!59651 (=> res!116367 e!154184)))

(assert (=> d!59651 (= res!116367 (and ((_ is Cons!3478) (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (= (_1!2304 (h!4132 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)))))

(assert (=> d!59651 (= (containsKey!266 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932) e!154184)))

(declare-fun b!237448 () Bool)

(declare-fun e!154185 () Bool)

(assert (=> b!237448 (= e!154184 e!154185)))

(declare-fun res!116368 () Bool)

(assert (=> b!237448 (=> (not res!116368) (not e!154185))))

(assert (=> b!237448 (= res!116368 (and (or (not ((_ is Cons!3478) (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) (bvsle (_1!2304 (h!4132 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)) ((_ is Cons!3478) (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (bvslt (_1!2304 (h!4132 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)))))

(declare-fun b!237449 () Bool)

(assert (=> b!237449 (= e!154185 (containsKey!266 (t!8459 (toList!1766 (getCurrentListMap!1298 (_keys!6490 thiss!1504) (_values!4385 thiss!1504) (mask!10407 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) key!932))))

(assert (= (and d!59651 (not res!116367)) b!237448))

(assert (= (and b!237448 res!116368) b!237449))

(declare-fun m!258275 () Bool)

(assert (=> b!237449 m!258275))

(assert (=> d!59607 d!59651))

(declare-fun d!59653 () Bool)

(assert (=> d!59653 (= (apply!216 lt!120028 (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000)) (get!2878 (getValueByKey!275 (toList!1766 lt!120028) (select (arr!5576 (_keys!6490 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8779 () Bool)

(assert (= bs!8779 d!59653))

(assert (=> bs!8779 m!258117))

(assert (=> bs!8779 m!258189))

(assert (=> bs!8779 m!258189))

(declare-fun m!258277 () Bool)

(assert (=> bs!8779 m!258277))

(assert (=> b!237248 d!59653))

(declare-fun d!59655 () Bool)

(declare-fun c!39606 () Bool)

(assert (=> d!59655 (= c!39606 ((_ is ValueCellFull!2774) (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!154188 () V!7961)

(assert (=> d!59655 (= (get!2877 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!154188)))

(declare-fun b!237454 () Bool)

(declare-fun get!2879 (ValueCell!2774 V!7961) V!7961)

(assert (=> b!237454 (= e!154188 (get!2879 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237455 () Bool)

(declare-fun get!2880 (ValueCell!2774 V!7961) V!7961)

(assert (=> b!237455 (= e!154188 (get!2880 (select (arr!5575 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59655 c!39606) b!237454))

(assert (= (and d!59655 (not c!39606)) b!237455))

(assert (=> b!237454 m!258137))

(assert (=> b!237454 m!258133))

(declare-fun m!258279 () Bool)

(assert (=> b!237454 m!258279))

(assert (=> b!237455 m!258137))

(assert (=> b!237455 m!258133))

(declare-fun m!258281 () Bool)

(assert (=> b!237455 m!258281))

(assert (=> b!237248 d!59655))

(declare-fun d!59657 () Bool)

(declare-fun e!154189 () Bool)

(assert (=> d!59657 e!154189))

(declare-fun res!116369 () Bool)

(assert (=> d!59657 (=> res!116369 e!154189)))

(declare-fun lt!120109 () Bool)

(assert (=> d!59657 (= res!116369 (not lt!120109))))

(declare-fun lt!120107 () Bool)

(assert (=> d!59657 (= lt!120109 lt!120107)))

(declare-fun lt!120106 () Unit!7279)

(declare-fun e!154190 () Unit!7279)

(assert (=> d!59657 (= lt!120106 e!154190)))

(declare-fun c!39607 () Bool)

(assert (=> d!59657 (= c!39607 lt!120107)))

(assert (=> d!59657 (= lt!120107 (containsKey!266 (toList!1766 lt!120028) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59657 (= (contains!1662 lt!120028 #b1000000000000000000000000000000000000000000000000000000000000000) lt!120109)))

(declare-fun b!237456 () Bool)

(declare-fun lt!120108 () Unit!7279)

(assert (=> b!237456 (= e!154190 lt!120108)))

(assert (=> b!237456 (= lt!120108 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1766 lt!120028) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237456 (isDefined!215 (getValueByKey!275 (toList!1766 lt!120028) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237457 () Bool)

(declare-fun Unit!7285 () Unit!7279)

(assert (=> b!237457 (= e!154190 Unit!7285)))

(declare-fun b!237458 () Bool)

(assert (=> b!237458 (= e!154189 (isDefined!215 (getValueByKey!275 (toList!1766 lt!120028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59657 c!39607) b!237456))

(assert (= (and d!59657 (not c!39607)) b!237457))

(assert (= (and d!59657 (not res!116369)) b!237458))

(declare-fun m!258283 () Bool)

(assert (=> d!59657 m!258283))

(declare-fun m!258285 () Bool)

(assert (=> b!237456 m!258285))

(declare-fun m!258287 () Bool)

(assert (=> b!237456 m!258287))

(assert (=> b!237456 m!258287))

(declare-fun m!258289 () Bool)

(assert (=> b!237456 m!258289))

(assert (=> b!237458 m!258287))

(assert (=> b!237458 m!258287))

(assert (=> b!237458 m!258289))

(assert (=> bm!22044 d!59657))

(declare-fun d!59659 () Bool)

(assert (=> d!59659 (contains!1662 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))) lt!120014)))

(declare-fun lt!120112 () Unit!7279)

(declare-fun choose!1118 (ListLongMap!3501 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7279)

(assert (=> d!59659 (= lt!120112 (choose!1118 lt!120026 lt!120021 (zeroValue!4243 thiss!1504) lt!120014))))

(assert (=> d!59659 (contains!1662 lt!120026 lt!120014)))

(assert (=> d!59659 (= (addStillContains!192 lt!120026 lt!120021 (zeroValue!4243 thiss!1504) lt!120014) lt!120112)))

(declare-fun bs!8780 () Bool)

(assert (= bs!8780 d!59659))

(assert (=> bs!8780 m!258143))

(assert (=> bs!8780 m!258143))

(assert (=> bs!8780 m!258165))

(declare-fun m!258291 () Bool)

(assert (=> bs!8780 m!258291))

(declare-fun m!258293 () Bool)

(assert (=> bs!8780 m!258293))

(assert (=> b!237253 d!59659))

(declare-fun d!59661 () Bool)

(declare-fun e!154191 () Bool)

(assert (=> d!59661 e!154191))

(declare-fun res!116370 () Bool)

(assert (=> d!59661 (=> res!116370 e!154191)))

(declare-fun lt!120116 () Bool)

(assert (=> d!59661 (= res!116370 (not lt!120116))))

(declare-fun lt!120114 () Bool)

(assert (=> d!59661 (= lt!120116 lt!120114)))

(declare-fun lt!120113 () Unit!7279)

(declare-fun e!154192 () Unit!7279)

(assert (=> d!59661 (= lt!120113 e!154192)))

(declare-fun c!39608 () Bool)

(assert (=> d!59661 (= c!39608 lt!120114)))

(assert (=> d!59661 (= lt!120114 (containsKey!266 (toList!1766 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))) lt!120014))))

(assert (=> d!59661 (= (contains!1662 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))) lt!120014) lt!120116)))

(declare-fun b!237460 () Bool)

(declare-fun lt!120115 () Unit!7279)

(assert (=> b!237460 (= e!154192 lt!120115)))

(assert (=> b!237460 (= lt!120115 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1766 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))) lt!120014))))

(assert (=> b!237460 (isDefined!215 (getValueByKey!275 (toList!1766 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))) lt!120014))))

(declare-fun b!237461 () Bool)

(declare-fun Unit!7286 () Unit!7279)

(assert (=> b!237461 (= e!154192 Unit!7286)))

(declare-fun b!237462 () Bool)

(assert (=> b!237462 (= e!154191 (isDefined!215 (getValueByKey!275 (toList!1766 (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))) lt!120014)))))

(assert (= (and d!59661 c!39608) b!237460))

(assert (= (and d!59661 (not c!39608)) b!237461))

(assert (= (and d!59661 (not res!116370)) b!237462))

(declare-fun m!258295 () Bool)

(assert (=> d!59661 m!258295))

(declare-fun m!258297 () Bool)

(assert (=> b!237460 m!258297))

(declare-fun m!258299 () Bool)

(assert (=> b!237460 m!258299))

(assert (=> b!237460 m!258299))

(declare-fun m!258301 () Bool)

(assert (=> b!237460 m!258301))

(assert (=> b!237462 m!258299))

(assert (=> b!237462 m!258299))

(assert (=> b!237462 m!258301))

(assert (=> b!237253 d!59661))

(declare-fun d!59663 () Bool)

(assert (=> d!59663 (= (apply!216 lt!120030 lt!120017) (get!2878 (getValueByKey!275 (toList!1766 lt!120030) lt!120017)))))

(declare-fun bs!8781 () Bool)

(assert (= bs!8781 d!59663))

(declare-fun m!258303 () Bool)

(assert (=> bs!8781 m!258303))

(assert (=> bs!8781 m!258303))

(declare-fun m!258305 () Bool)

(assert (=> bs!8781 m!258305))

(assert (=> b!237253 d!59663))

(declare-fun d!59665 () Bool)

(assert (=> d!59665 (= (apply!216 (+!643 lt!120030 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))) lt!120017) (get!2878 (getValueByKey!275 (toList!1766 (+!643 lt!120030 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))) lt!120017)))))

(declare-fun bs!8782 () Bool)

(assert (= bs!8782 d!59665))

(declare-fun m!258307 () Bool)

(assert (=> bs!8782 m!258307))

(assert (=> bs!8782 m!258307))

(declare-fun m!258309 () Bool)

(assert (=> bs!8782 m!258309))

(assert (=> b!237253 d!59665))

(assert (=> b!237253 d!59633))

(declare-fun d!59667 () Bool)

(declare-fun e!154193 () Bool)

(assert (=> d!59667 e!154193))

(declare-fun res!116371 () Bool)

(assert (=> d!59667 (=> (not res!116371) (not e!154193))))

(declare-fun lt!120118 () ListLongMap!3501)

(assert (=> d!59667 (= res!116371 (contains!1662 lt!120118 (_1!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))))))

(declare-fun lt!120120 () List!3482)

(assert (=> d!59667 (= lt!120118 (ListLongMap!3502 lt!120120))))

(declare-fun lt!120119 () Unit!7279)

(declare-fun lt!120117 () Unit!7279)

(assert (=> d!59667 (= lt!120119 lt!120117)))

(assert (=> d!59667 (= (getValueByKey!275 lt!120120 (_1!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59667 (= lt!120117 (lemmaContainsTupThenGetReturnValue!154 lt!120120 (_1!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59667 (= lt!120120 (insertStrictlySorted!157 (toList!1766 lt!120020) (_1!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59667 (= (+!643 lt!120020 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))) lt!120118)))

(declare-fun b!237463 () Bool)

(declare-fun res!116372 () Bool)

(assert (=> b!237463 (=> (not res!116372) (not e!154193))))

(assert (=> b!237463 (= res!116372 (= (getValueByKey!275 (toList!1766 lt!120118) (_1!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))))))))

(declare-fun b!237464 () Bool)

(assert (=> b!237464 (= e!154193 (contains!1665 (toList!1766 lt!120118) (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))))))

(assert (= (and d!59667 res!116371) b!237463))

(assert (= (and b!237463 res!116372) b!237464))

(declare-fun m!258311 () Bool)

(assert (=> d!59667 m!258311))

(declare-fun m!258313 () Bool)

(assert (=> d!59667 m!258313))

(declare-fun m!258315 () Bool)

(assert (=> d!59667 m!258315))

(declare-fun m!258317 () Bool)

(assert (=> d!59667 m!258317))

(declare-fun m!258319 () Bool)

(assert (=> b!237463 m!258319))

(declare-fun m!258321 () Bool)

(assert (=> b!237464 m!258321))

(assert (=> b!237253 d!59667))

(declare-fun d!59669 () Bool)

(assert (=> d!59669 (= (apply!216 lt!120020 lt!120031) (get!2878 (getValueByKey!275 (toList!1766 lt!120020) lt!120031)))))

(declare-fun bs!8783 () Bool)

(assert (= bs!8783 d!59669))

(declare-fun m!258323 () Bool)

(assert (=> bs!8783 m!258323))

(assert (=> bs!8783 m!258323))

(declare-fun m!258325 () Bool)

(assert (=> bs!8783 m!258325))

(assert (=> b!237253 d!59669))

(declare-fun d!59671 () Bool)

(declare-fun e!154194 () Bool)

(assert (=> d!59671 e!154194))

(declare-fun res!116373 () Bool)

(assert (=> d!59671 (=> (not res!116373) (not e!154194))))

(declare-fun lt!120122 () ListLongMap!3501)

(assert (=> d!59671 (= res!116373 (contains!1662 lt!120122 (_1!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))))))

(declare-fun lt!120124 () List!3482)

(assert (=> d!59671 (= lt!120122 (ListLongMap!3502 lt!120124))))

(declare-fun lt!120123 () Unit!7279)

(declare-fun lt!120121 () Unit!7279)

(assert (=> d!59671 (= lt!120123 lt!120121)))

(assert (=> d!59671 (= (getValueByKey!275 lt!120124 (_1!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))))))

(assert (=> d!59671 (= lt!120121 (lemmaContainsTupThenGetReturnValue!154 lt!120124 (_1!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))))))

(assert (=> d!59671 (= lt!120124 (insertStrictlySorted!157 (toList!1766 lt!120024) (_1!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))))))

(assert (=> d!59671 (= (+!643 lt!120024 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))) lt!120122)))

(declare-fun b!237465 () Bool)

(declare-fun res!116374 () Bool)

(assert (=> b!237465 (=> (not res!116374) (not e!154194))))

(assert (=> b!237465 (= res!116374 (= (getValueByKey!275 (toList!1766 lt!120122) (_1!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))))))))

(declare-fun b!237466 () Bool)

(assert (=> b!237466 (= e!154194 (contains!1665 (toList!1766 lt!120122) (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))))))

(assert (= (and d!59671 res!116373) b!237465))

(assert (= (and b!237465 res!116374) b!237466))

(declare-fun m!258327 () Bool)

(assert (=> d!59671 m!258327))

(declare-fun m!258329 () Bool)

(assert (=> d!59671 m!258329))

(declare-fun m!258331 () Bool)

(assert (=> d!59671 m!258331))

(declare-fun m!258333 () Bool)

(assert (=> d!59671 m!258333))

(declare-fun m!258335 () Bool)

(assert (=> b!237465 m!258335))

(declare-fun m!258337 () Bool)

(assert (=> b!237466 m!258337))

(assert (=> b!237253 d!59671))

(declare-fun d!59673 () Bool)

(assert (=> d!59673 (= (apply!216 lt!120024 lt!120010) (get!2878 (getValueByKey!275 (toList!1766 lt!120024) lt!120010)))))

(declare-fun bs!8784 () Bool)

(assert (= bs!8784 d!59673))

(declare-fun m!258339 () Bool)

(assert (=> bs!8784 m!258339))

(assert (=> bs!8784 m!258339))

(declare-fun m!258341 () Bool)

(assert (=> bs!8784 m!258341))

(assert (=> b!237253 d!59673))

(declare-fun d!59675 () Bool)

(declare-fun e!154195 () Bool)

(assert (=> d!59675 e!154195))

(declare-fun res!116375 () Bool)

(assert (=> d!59675 (=> (not res!116375) (not e!154195))))

(declare-fun lt!120126 () ListLongMap!3501)

(assert (=> d!59675 (= res!116375 (contains!1662 lt!120126 (_1!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))))))

(declare-fun lt!120128 () List!3482)

(assert (=> d!59675 (= lt!120126 (ListLongMap!3502 lt!120128))))

(declare-fun lt!120127 () Unit!7279)

(declare-fun lt!120125 () Unit!7279)

(assert (=> d!59675 (= lt!120127 lt!120125)))

(assert (=> d!59675 (= (getValueByKey!275 lt!120128 (_1!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59675 (= lt!120125 (lemmaContainsTupThenGetReturnValue!154 lt!120128 (_1!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59675 (= lt!120128 (insertStrictlySorted!157 (toList!1766 lt!120026) (_1!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59675 (= (+!643 lt!120026 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))) lt!120126)))

(declare-fun b!237467 () Bool)

(declare-fun res!116376 () Bool)

(assert (=> b!237467 (=> (not res!116376) (not e!154195))))

(assert (=> b!237467 (= res!116376 (= (getValueByKey!275 (toList!1766 lt!120126) (_1!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))))))))

(declare-fun b!237468 () Bool)

(assert (=> b!237468 (= e!154195 (contains!1665 (toList!1766 lt!120126) (tuple2!4587 lt!120021 (zeroValue!4243 thiss!1504))))))

(assert (= (and d!59675 res!116375) b!237467))

(assert (= (and b!237467 res!116376) b!237468))

(declare-fun m!258343 () Bool)

(assert (=> d!59675 m!258343))

(declare-fun m!258345 () Bool)

(assert (=> d!59675 m!258345))

(declare-fun m!258347 () Bool)

(assert (=> d!59675 m!258347))

(declare-fun m!258349 () Bool)

(assert (=> d!59675 m!258349))

(declare-fun m!258351 () Bool)

(assert (=> b!237467 m!258351))

(declare-fun m!258353 () Bool)

(assert (=> b!237468 m!258353))

(assert (=> b!237253 d!59675))

(declare-fun d!59677 () Bool)

(assert (=> d!59677 (= (apply!216 (+!643 lt!120030 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))) lt!120017) (apply!216 lt!120030 lt!120017))))

(declare-fun lt!120131 () Unit!7279)

(declare-fun choose!1119 (ListLongMap!3501 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7279)

(assert (=> d!59677 (= lt!120131 (choose!1119 lt!120030 lt!120011 (minValue!4243 thiss!1504) lt!120017))))

(declare-fun e!154198 () Bool)

(assert (=> d!59677 e!154198))

(declare-fun res!116379 () Bool)

(assert (=> d!59677 (=> (not res!116379) (not e!154198))))

(assert (=> d!59677 (= res!116379 (contains!1662 lt!120030 lt!120017))))

(assert (=> d!59677 (= (addApplyDifferent!192 lt!120030 lt!120011 (minValue!4243 thiss!1504) lt!120017) lt!120131)))

(declare-fun b!237472 () Bool)

(assert (=> b!237472 (= e!154198 (not (= lt!120017 lt!120011)))))

(assert (= (and d!59677 res!116379) b!237472))

(assert (=> d!59677 m!258155))

(declare-fun m!258355 () Bool)

(assert (=> d!59677 m!258355))

(assert (=> d!59677 m!258157))

(assert (=> d!59677 m!258157))

(assert (=> d!59677 m!258169))

(declare-fun m!258357 () Bool)

(assert (=> d!59677 m!258357))

(assert (=> b!237253 d!59677))

(declare-fun d!59679 () Bool)

(assert (=> d!59679 (= (apply!216 (+!643 lt!120024 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))) lt!120010) (apply!216 lt!120024 lt!120010))))

(declare-fun lt!120132 () Unit!7279)

(assert (=> d!59679 (= lt!120132 (choose!1119 lt!120024 lt!120015 (minValue!4243 thiss!1504) lt!120010))))

(declare-fun e!154199 () Bool)

(assert (=> d!59679 e!154199))

(declare-fun res!116380 () Bool)

(assert (=> d!59679 (=> (not res!116380) (not e!154199))))

(assert (=> d!59679 (= res!116380 (contains!1662 lt!120024 lt!120010))))

(assert (=> d!59679 (= (addApplyDifferent!192 lt!120024 lt!120015 (minValue!4243 thiss!1504) lt!120010) lt!120132)))

(declare-fun b!237473 () Bool)

(assert (=> b!237473 (= e!154199 (not (= lt!120010 lt!120015)))))

(assert (= (and d!59679 res!116380) b!237473))

(assert (=> d!59679 m!258163))

(declare-fun m!258359 () Bool)

(assert (=> d!59679 m!258359))

(assert (=> d!59679 m!258145))

(assert (=> d!59679 m!258145))

(assert (=> d!59679 m!258167))

(declare-fun m!258361 () Bool)

(assert (=> d!59679 m!258361))

(assert (=> b!237253 d!59679))

(declare-fun d!59681 () Bool)

(declare-fun e!154200 () Bool)

(assert (=> d!59681 e!154200))

(declare-fun res!116381 () Bool)

(assert (=> d!59681 (=> (not res!116381) (not e!154200))))

(declare-fun lt!120134 () ListLongMap!3501)

(assert (=> d!59681 (= res!116381 (contains!1662 lt!120134 (_1!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))))))

(declare-fun lt!120136 () List!3482)

(assert (=> d!59681 (= lt!120134 (ListLongMap!3502 lt!120136))))

(declare-fun lt!120135 () Unit!7279)

(declare-fun lt!120133 () Unit!7279)

(assert (=> d!59681 (= lt!120135 lt!120133)))

(assert (=> d!59681 (= (getValueByKey!275 lt!120136 (_1!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))))))

(assert (=> d!59681 (= lt!120133 (lemmaContainsTupThenGetReturnValue!154 lt!120136 (_1!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))))))

(assert (=> d!59681 (= lt!120136 (insertStrictlySorted!157 (toList!1766 lt!120030) (_1!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))) (_2!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))))))

(assert (=> d!59681 (= (+!643 lt!120030 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))) lt!120134)))

(declare-fun b!237474 () Bool)

(declare-fun res!116382 () Bool)

(assert (=> b!237474 (=> (not res!116382) (not e!154200))))

(assert (=> b!237474 (= res!116382 (= (getValueByKey!275 (toList!1766 lt!120134) (_1!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504)))) (Some!280 (_2!2304 (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))))))))

(declare-fun b!237475 () Bool)

(assert (=> b!237475 (= e!154200 (contains!1665 (toList!1766 lt!120134) (tuple2!4587 lt!120011 (minValue!4243 thiss!1504))))))

(assert (= (and d!59681 res!116381) b!237474))

(assert (= (and b!237474 res!116382) b!237475))

(declare-fun m!258363 () Bool)

(assert (=> d!59681 m!258363))

(declare-fun m!258365 () Bool)

(assert (=> d!59681 m!258365))

(declare-fun m!258367 () Bool)

(assert (=> d!59681 m!258367))

(declare-fun m!258369 () Bool)

(assert (=> d!59681 m!258369))

(declare-fun m!258371 () Bool)

(assert (=> b!237474 m!258371))

(declare-fun m!258373 () Bool)

(assert (=> b!237475 m!258373))

(assert (=> b!237253 d!59681))

(declare-fun d!59683 () Bool)

(assert (=> d!59683 (= (apply!216 (+!643 lt!120020 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))) lt!120031) (apply!216 lt!120020 lt!120031))))

(declare-fun lt!120137 () Unit!7279)

(assert (=> d!59683 (= lt!120137 (choose!1119 lt!120020 lt!120013 (zeroValue!4243 thiss!1504) lt!120031))))

(declare-fun e!154201 () Bool)

(assert (=> d!59683 e!154201))

(declare-fun res!116383 () Bool)

(assert (=> d!59683 (=> (not res!116383) (not e!154201))))

(assert (=> d!59683 (= res!116383 (contains!1662 lt!120020 lt!120031))))

(assert (=> d!59683 (= (addApplyDifferent!192 lt!120020 lt!120013 (zeroValue!4243 thiss!1504) lt!120031) lt!120137)))

(declare-fun b!237476 () Bool)

(assert (=> b!237476 (= e!154201 (not (= lt!120031 lt!120013)))))

(assert (= (and d!59683 res!116383) b!237476))

(assert (=> d!59683 m!258147))

(declare-fun m!258375 () Bool)

(assert (=> d!59683 m!258375))

(assert (=> d!59683 m!258149))

(assert (=> d!59683 m!258149))

(assert (=> d!59683 m!258151))

(declare-fun m!258377 () Bool)

(assert (=> d!59683 m!258377))

(assert (=> b!237253 d!59683))

(declare-fun d!59685 () Bool)

(assert (=> d!59685 (= (apply!216 (+!643 lt!120020 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504))) lt!120031) (get!2878 (getValueByKey!275 (toList!1766 (+!643 lt!120020 (tuple2!4587 lt!120013 (zeroValue!4243 thiss!1504)))) lt!120031)))))

(declare-fun bs!8785 () Bool)

(assert (= bs!8785 d!59685))

(declare-fun m!258379 () Bool)

(assert (=> bs!8785 m!258379))

(assert (=> bs!8785 m!258379))

(declare-fun m!258381 () Bool)

(assert (=> bs!8785 m!258381))

(assert (=> b!237253 d!59685))

(declare-fun d!59687 () Bool)

(assert (=> d!59687 (= (apply!216 (+!643 lt!120024 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504))) lt!120010) (get!2878 (getValueByKey!275 (toList!1766 (+!643 lt!120024 (tuple2!4587 lt!120015 (minValue!4243 thiss!1504)))) lt!120010)))))

(declare-fun bs!8786 () Bool)

(assert (= bs!8786 d!59687))

(declare-fun m!258383 () Bool)

(assert (=> bs!8786 m!258383))

(assert (=> bs!8786 m!258383))

(declare-fun m!258385 () Bool)

(assert (=> bs!8786 m!258385))

(assert (=> b!237253 d!59687))

(declare-fun d!59689 () Bool)

(declare-fun e!154202 () Bool)

(assert (=> d!59689 e!154202))

(declare-fun res!116384 () Bool)

(assert (=> d!59689 (=> (not res!116384) (not e!154202))))

(declare-fun lt!120139 () ListLongMap!3501)

(assert (=> d!59689 (= res!116384 (contains!1662 lt!120139 (_1!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(declare-fun lt!120141 () List!3482)

(assert (=> d!59689 (= lt!120139 (ListLongMap!3502 lt!120141))))

(declare-fun lt!120140 () Unit!7279)

(declare-fun lt!120138 () Unit!7279)

(assert (=> d!59689 (= lt!120140 lt!120138)))

(assert (=> d!59689 (= (getValueByKey!275 lt!120141 (_1!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))) (Some!280 (_2!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(assert (=> d!59689 (= lt!120138 (lemmaContainsTupThenGetReturnValue!154 lt!120141 (_1!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (_2!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(assert (=> d!59689 (= lt!120141 (insertStrictlySorted!157 (toList!1766 (ite c!39553 call!22041 (ite c!39548 call!22044 call!22045))) (_1!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (_2!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(assert (=> d!59689 (= (+!643 (ite c!39553 call!22041 (ite c!39548 call!22044 call!22045)) (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) lt!120139)))

(declare-fun b!237477 () Bool)

(declare-fun res!116385 () Bool)

(assert (=> b!237477 (=> (not res!116385) (not e!154202))))

(assert (=> b!237477 (= res!116385 (= (getValueByKey!275 (toList!1766 lt!120139) (_1!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))) (Some!280 (_2!2304 (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))))

(declare-fun b!237478 () Bool)

(assert (=> b!237478 (= e!154202 (contains!1665 (toList!1766 lt!120139) (ite (or c!39553 c!39548) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(assert (= (and d!59689 res!116384) b!237477))

(assert (= (and b!237477 res!116385) b!237478))

(declare-fun m!258387 () Bool)

(assert (=> d!59689 m!258387))

(declare-fun m!258389 () Bool)

(assert (=> d!59689 m!258389))

(declare-fun m!258391 () Bool)

(assert (=> d!59689 m!258391))

(declare-fun m!258393 () Bool)

(assert (=> d!59689 m!258393))

(declare-fun m!258395 () Bool)

(assert (=> b!237477 m!258395))

(declare-fun m!258397 () Bool)

(assert (=> b!237478 m!258397))

(assert (=> bm!22041 d!59689))

(declare-fun d!59691 () Bool)

(assert (=> d!59691 (= (apply!216 lt!120028 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2878 (getValueByKey!275 (toList!1766 lt!120028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8787 () Bool)

(assert (= bs!8787 d!59691))

(assert (=> bs!8787 m!258287))

(assert (=> bs!8787 m!258287))

(declare-fun m!258399 () Bool)

(assert (=> bs!8787 m!258399))

(assert (=> b!237263 d!59691))

(declare-fun b!237480 () Bool)

(declare-fun e!154204 () Bool)

(assert (=> b!237480 (= e!154204 tp_is_empty!6235)))

(declare-fun b!237479 () Bool)

(declare-fun e!154203 () Bool)

(assert (=> b!237479 (= e!154203 tp_is_empty!6235)))

(declare-fun condMapEmpty!10577 () Bool)

(declare-fun mapDefault!10577 () ValueCell!2774)

(assert (=> mapNonEmpty!10576 (= condMapEmpty!10577 (= mapRest!10576 ((as const (Array (_ BitVec 32) ValueCell!2774)) mapDefault!10577)))))

(declare-fun mapRes!10577 () Bool)

(assert (=> mapNonEmpty!10576 (= tp!22321 (and e!154204 mapRes!10577))))

(declare-fun mapIsEmpty!10577 () Bool)

(assert (=> mapIsEmpty!10577 mapRes!10577))

(declare-fun mapNonEmpty!10577 () Bool)

(declare-fun tp!22322 () Bool)

(assert (=> mapNonEmpty!10577 (= mapRes!10577 (and tp!22322 e!154203))))

(declare-fun mapKey!10577 () (_ BitVec 32))

(declare-fun mapValue!10577 () ValueCell!2774)

(declare-fun mapRest!10577 () (Array (_ BitVec 32) ValueCell!2774))

(assert (=> mapNonEmpty!10577 (= mapRest!10576 (store mapRest!10577 mapKey!10577 mapValue!10577))))

(assert (= (and mapNonEmpty!10576 condMapEmpty!10577) mapIsEmpty!10577))

(assert (= (and mapNonEmpty!10576 (not condMapEmpty!10577)) mapNonEmpty!10577))

(assert (= (and mapNonEmpty!10577 ((_ is ValueCellFull!2774) mapValue!10577)) b!237479))

(assert (= (and mapNonEmpty!10576 ((_ is ValueCellFull!2774) mapDefault!10577)) b!237480))

(declare-fun m!258401 () Bool)

(assert (=> mapNonEmpty!10577 m!258401))

(declare-fun b_lambda!7973 () Bool)

(assert (= b_lambda!7969 (or (and b!237119 b_free!6373) b_lambda!7973)))

(declare-fun b_lambda!7975 () Bool)

(assert (= b_lambda!7971 (or (and b!237119 b_free!6373) b_lambda!7975)))

(check-sat (not b!237398) (not d!59669) (not b!237346) (not d!59665) (not b!237449) (not d!59661) (not b!237468) (not d!59653) (not b!237377) (not d!59657) (not b!237378) (not d!59649) (not b!237285) (not d!59667) (not b!237477) (not bm!22050) (not b!237463) (not d!59679) (not d!59675) (not d!59631) (not d!59633) (not d!59671) (not b_lambda!7973) (not mapNonEmpty!10577) (not b!237347) (not b!237442) (not b_next!6373) (not b!237456) (not b!237298) (not d!59627) (not b_lambda!7975) (not b_lambda!7967) (not d!59619) (not b!237464) (not d!59641) tp_is_empty!6235 (not b!237462) (not d!59689) (not d!59683) (not bm!22056) (not b!237381) (not b!237402) (not bm!22053) (not b!237467) (not b!237478) (not b!237475) (not d!59687) (not d!59639) (not b!237458) (not b!237337) (not b!237466) (not b!237299) (not d!59635) (not b!237373) (not d!59677) (not b!237418) (not bm!22047) b_and!13345 (not b!237454) (not b!237322) (not b!237441) (not d!59623) (not b!237287) (not b!237474) (not b!237460) (not d!59681) (not b!237465) (not b!237455) (not d!59637) (not b!237431) (not b!237382) (not b!237380) (not b!237407) (not b!237375) (not d!59659) (not b!237372) (not d!59691) (not d!59673) (not d!59685) (not b!237404) (not b!237339) (not d!59663) (not b!237341))
(check-sat b_and!13345 (not b_next!6373))
