; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22718 () Bool)

(assert start!22718)

(declare-fun b!237099 () Bool)

(declare-fun b_free!6375 () Bool)

(declare-fun b_next!6375 () Bool)

(assert (=> b!237099 (= b_free!6375 (not b_next!6375))))

(declare-fun tp!22311 () Bool)

(declare-fun b_and!13323 () Bool)

(assert (=> b!237099 (= tp!22311 b_and!13323)))

(declare-fun b!237093 () Bool)

(declare-fun res!116226 () Bool)

(declare-fun e!153979 () Bool)

(assert (=> b!237093 (=> (not res!116226) (not e!153979))))

(declare-datatypes ((V!7963 0))(
  ( (V!7964 (val!3163 Int)) )
))
(declare-datatypes ((ValueCell!2775 0))(
  ( (ValueCellFull!2775 (v!5196 V!7963)) (EmptyCell!2775) )
))
(declare-datatypes ((array!11743 0))(
  ( (array!11744 (arr!5578 (Array (_ BitVec 32) ValueCell!2775)) (size!5917 (_ BitVec 32))) )
))
(declare-datatypes ((array!11745 0))(
  ( (array!11746 (arr!5579 (Array (_ BitVec 32) (_ BitVec 64))) (size!5918 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3450 0))(
  ( (LongMapFixedSize!3451 (defaultEntry!4403 Int) (mask!10408 (_ BitVec 32)) (extraKeys!4140 (_ BitVec 32)) (zeroValue!4244 V!7963) (minValue!4244 V!7963) (_size!1774 (_ BitVec 32)) (_keys!6491 array!11745) (_values!4386 array!11743) (_vacant!1774 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3450)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237093 (= res!116226 (validMask!0 (mask!10408 thiss!1504)))))

(declare-fun mapIsEmpty!10570 () Bool)

(declare-fun mapRes!10570 () Bool)

(assert (=> mapIsEmpty!10570 mapRes!10570))

(declare-fun b!237094 () Bool)

(declare-fun e!153975 () Bool)

(declare-fun tp_is_empty!6237 () Bool)

(assert (=> b!237094 (= e!153975 tp_is_empty!6237)))

(declare-fun b!237095 () Bool)

(declare-fun e!153978 () Bool)

(assert (=> b!237095 (= e!153978 tp_is_empty!6237)))

(declare-fun mapNonEmpty!10570 () Bool)

(declare-fun tp!22312 () Bool)

(assert (=> mapNonEmpty!10570 (= mapRes!10570 (and tp!22312 e!153975))))

(declare-fun mapKey!10570 () (_ BitVec 32))

(declare-fun mapValue!10570 () ValueCell!2775)

(declare-fun mapRest!10570 () (Array (_ BitVec 32) ValueCell!2775))

(assert (=> mapNonEmpty!10570 (= (arr!5578 (_values!4386 thiss!1504)) (store mapRest!10570 mapKey!10570 mapValue!10570))))

(declare-fun b!237096 () Bool)

(declare-fun e!153980 () Bool)

(assert (=> b!237096 (= e!153980 (and e!153978 mapRes!10570))))

(declare-fun condMapEmpty!10570 () Bool)

(declare-fun mapDefault!10570 () ValueCell!2775)

(assert (=> b!237096 (= condMapEmpty!10570 (= (arr!5578 (_values!4386 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2775)) mapDefault!10570)))))

(declare-fun b!237097 () Bool)

(declare-fun res!116225 () Bool)

(assert (=> b!237097 (=> (not res!116225) (not e!153979))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4660 0))(
  ( (tuple2!4661 (_1!2341 (_ BitVec 64)) (_2!2341 V!7963)) )
))
(declare-datatypes ((List!3562 0))(
  ( (Nil!3559) (Cons!3558 (h!4212 tuple2!4660) (t!8547 List!3562)) )
))
(declare-datatypes ((ListLongMap!3573 0))(
  ( (ListLongMap!3574 (toList!1802 List!3562)) )
))
(declare-fun contains!1684 (ListLongMap!3573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1330 (array!11745 array!11743 (_ BitVec 32) (_ BitVec 32) V!7963 V!7963 (_ BitVec 32) Int) ListLongMap!3573)

(assert (=> b!237097 (= res!116225 (not (contains!1684 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)) key!932)))))

(declare-fun res!116224 () Bool)

(declare-fun e!153974 () Bool)

(assert (=> start!22718 (=> (not res!116224) (not e!153974))))

(declare-fun valid!1361 (LongMapFixedSize!3450) Bool)

(assert (=> start!22718 (= res!116224 (valid!1361 thiss!1504))))

(assert (=> start!22718 e!153974))

(declare-fun e!153977 () Bool)

(assert (=> start!22718 e!153977))

(assert (=> start!22718 true))

(declare-fun b!237098 () Bool)

(declare-fun res!116227 () Bool)

(assert (=> b!237098 (=> (not res!116227) (not e!153974))))

(assert (=> b!237098 (= res!116227 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!3681 (array!11745) Bool)

(declare-fun array_inv!3682 (array!11743) Bool)

(assert (=> b!237099 (= e!153977 (and tp!22311 tp_is_empty!6237 (array_inv!3681 (_keys!6491 thiss!1504)) (array_inv!3682 (_values!4386 thiss!1504)) e!153980))))

(declare-fun b!237100 () Bool)

(assert (=> b!237100 (= e!153979 (and (= (size!5917 (_values!4386 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10408 thiss!1504))) (= (size!5918 (_keys!6491 thiss!1504)) (size!5917 (_values!4386 thiss!1504))) (bvsge (mask!10408 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4140 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!237101 () Bool)

(assert (=> b!237101 (= e!153974 e!153979)))

(declare-fun res!116223 () Bool)

(assert (=> b!237101 (=> (not res!116223) (not e!153979))))

(declare-datatypes ((SeekEntryResult!1007 0))(
  ( (MissingZero!1007 (index!6198 (_ BitVec 32))) (Found!1007 (index!6199 (_ BitVec 32))) (Intermediate!1007 (undefined!1819 Bool) (index!6200 (_ BitVec 32)) (x!23933 (_ BitVec 32))) (Undefined!1007) (MissingVacant!1007 (index!6201 (_ BitVec 32))) )
))
(declare-fun lt!119882 () SeekEntryResult!1007)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237101 (= res!116223 (or (= lt!119882 (MissingZero!1007 index!297)) (= lt!119882 (MissingVacant!1007 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11745 (_ BitVec 32)) SeekEntryResult!1007)

(assert (=> b!237101 (= lt!119882 (seekEntryOrOpen!0 key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(assert (= (and start!22718 res!116224) b!237098))

(assert (= (and b!237098 res!116227) b!237101))

(assert (= (and b!237101 res!116223) b!237097))

(assert (= (and b!237097 res!116225) b!237093))

(assert (= (and b!237093 res!116226) b!237100))

(assert (= (and b!237096 condMapEmpty!10570) mapIsEmpty!10570))

(assert (= (and b!237096 (not condMapEmpty!10570)) mapNonEmpty!10570))

(get-info :version)

(assert (= (and mapNonEmpty!10570 ((_ is ValueCellFull!2775) mapValue!10570)) b!237094))

(assert (= (and b!237096 ((_ is ValueCellFull!2775) mapDefault!10570)) b!237095))

(assert (= b!237099 b!237096))

(assert (= start!22718 b!237099))

(declare-fun m!257881 () Bool)

(assert (=> b!237097 m!257881))

(assert (=> b!237097 m!257881))

(declare-fun m!257883 () Bool)

(assert (=> b!237097 m!257883))

(declare-fun m!257885 () Bool)

(assert (=> mapNonEmpty!10570 m!257885))

(declare-fun m!257887 () Bool)

(assert (=> b!237101 m!257887))

(declare-fun m!257889 () Bool)

(assert (=> b!237093 m!257889))

(declare-fun m!257891 () Bool)

(assert (=> start!22718 m!257891))

(declare-fun m!257893 () Bool)

(assert (=> b!237099 m!257893))

(declare-fun m!257895 () Bool)

(assert (=> b!237099 m!257895))

(check-sat (not b!237099) tp_is_empty!6237 (not b!237097) (not b_next!6375) (not b!237093) b_and!13323 (not mapNonEmpty!10570) (not b!237101) (not start!22718))
(check-sat b_and!13323 (not b_next!6375))
(get-model)

(declare-fun d!59531 () Bool)

(declare-fun e!154007 () Bool)

(assert (=> d!59531 e!154007))

(declare-fun res!116245 () Bool)

(assert (=> d!59531 (=> res!116245 e!154007)))

(declare-fun lt!119895 () Bool)

(assert (=> d!59531 (= res!116245 (not lt!119895))))

(declare-fun lt!119894 () Bool)

(assert (=> d!59531 (= lt!119895 lt!119894)))

(declare-datatypes ((Unit!7292 0))(
  ( (Unit!7293) )
))
(declare-fun lt!119896 () Unit!7292)

(declare-fun e!154006 () Unit!7292)

(assert (=> d!59531 (= lt!119896 e!154006)))

(declare-fun c!39513 () Bool)

(assert (=> d!59531 (= c!39513 lt!119894)))

(declare-fun containsKey!266 (List!3562 (_ BitVec 64)) Bool)

(assert (=> d!59531 (= lt!119894 (containsKey!266 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))

(assert (=> d!59531 (= (contains!1684 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)) key!932) lt!119895)))

(declare-fun b!237135 () Bool)

(declare-fun lt!119897 () Unit!7292)

(assert (=> b!237135 (= e!154006 lt!119897)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!214 (List!3562 (_ BitVec 64)) Unit!7292)

(assert (=> b!237135 (= lt!119897 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))

(declare-datatypes ((Option!280 0))(
  ( (Some!279 (v!5198 V!7963)) (None!278) )
))
(declare-fun isDefined!215 (Option!280) Bool)

(declare-fun getValueByKey!274 (List!3562 (_ BitVec 64)) Option!280)

(assert (=> b!237135 (isDefined!215 (getValueByKey!274 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))

(declare-fun b!237136 () Bool)

(declare-fun Unit!7294 () Unit!7292)

(assert (=> b!237136 (= e!154006 Unit!7294)))

(declare-fun b!237137 () Bool)

(assert (=> b!237137 (= e!154007 (isDefined!215 (getValueByKey!274 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932)))))

(assert (= (and d!59531 c!39513) b!237135))

(assert (= (and d!59531 (not c!39513)) b!237136))

(assert (= (and d!59531 (not res!116245)) b!237137))

(declare-fun m!257913 () Bool)

(assert (=> d!59531 m!257913))

(declare-fun m!257915 () Bool)

(assert (=> b!237135 m!257915))

(declare-fun m!257917 () Bool)

(assert (=> b!237135 m!257917))

(assert (=> b!237135 m!257917))

(declare-fun m!257919 () Bool)

(assert (=> b!237135 m!257919))

(assert (=> b!237137 m!257917))

(assert (=> b!237137 m!257917))

(assert (=> b!237137 m!257919))

(assert (=> b!237097 d!59531))

(declare-fun b!237180 () Bool)

(declare-fun e!154039 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237180 (= e!154039 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237181 () Bool)

(declare-fun e!154040 () Bool)

(declare-fun e!154034 () Bool)

(assert (=> b!237181 (= e!154040 e!154034)))

(declare-fun res!116270 () Bool)

(declare-fun call!22056 () Bool)

(assert (=> b!237181 (= res!116270 call!22056)))

(assert (=> b!237181 (=> (not res!116270) (not e!154034))))

(declare-fun b!237182 () Bool)

(assert (=> b!237182 (= e!154040 (not call!22056))))

(declare-fun bm!22050 () Bool)

(declare-fun lt!119946 () ListLongMap!3573)

(assert (=> bm!22050 (= call!22056 (contains!1684 lt!119946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237183 () Bool)

(declare-fun e!154046 () Bool)

(declare-fun call!22059 () Bool)

(assert (=> b!237183 (= e!154046 (not call!22059))))

(declare-fun b!237184 () Bool)

(declare-fun e!154038 () ListLongMap!3573)

(declare-fun e!154035 () ListLongMap!3573)

(assert (=> b!237184 (= e!154038 e!154035)))

(declare-fun c!39529 () Bool)

(assert (=> b!237184 (= c!39529 (and (not (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22051 () Bool)

(declare-fun call!22058 () ListLongMap!3573)

(declare-fun call!22057 () ListLongMap!3573)

(assert (=> bm!22051 (= call!22058 call!22057)))

(declare-fun bm!22052 () Bool)

(declare-fun call!22053 () ListLongMap!3573)

(declare-fun call!22055 () ListLongMap!3573)

(assert (=> bm!22052 (= call!22053 call!22055)))

(declare-fun b!237185 () Bool)

(assert (=> b!237185 (= e!154035 call!22053)))

(declare-fun b!237186 () Bool)

(declare-fun e!154041 () Unit!7292)

(declare-fun lt!119942 () Unit!7292)

(assert (=> b!237186 (= e!154041 lt!119942)))

(declare-fun lt!119947 () ListLongMap!3573)

(declare-fun getCurrentListMapNoExtraKeys!538 (array!11745 array!11743 (_ BitVec 32) (_ BitVec 32) V!7963 V!7963 (_ BitVec 32) Int) ListLongMap!3573)

(assert (=> b!237186 (= lt!119947 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))

(declare-fun lt!119963 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119954 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119954 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119959 () Unit!7292)

(declare-fun addStillContains!192 (ListLongMap!3573 (_ BitVec 64) V!7963 (_ BitVec 64)) Unit!7292)

(assert (=> b!237186 (= lt!119959 (addStillContains!192 lt!119947 lt!119963 (zeroValue!4244 thiss!1504) lt!119954))))

(declare-fun +!643 (ListLongMap!3573 tuple2!4660) ListLongMap!3573)

(assert (=> b!237186 (contains!1684 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))) lt!119954)))

(declare-fun lt!119961 () Unit!7292)

(assert (=> b!237186 (= lt!119961 lt!119959)))

(declare-fun lt!119949 () ListLongMap!3573)

(assert (=> b!237186 (= lt!119949 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))

(declare-fun lt!119962 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119962 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119953 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119953 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119960 () Unit!7292)

(declare-fun addApplyDifferent!192 (ListLongMap!3573 (_ BitVec 64) V!7963 (_ BitVec 64)) Unit!7292)

(assert (=> b!237186 (= lt!119960 (addApplyDifferent!192 lt!119949 lt!119962 (minValue!4244 thiss!1504) lt!119953))))

(declare-fun apply!216 (ListLongMap!3573 (_ BitVec 64)) V!7963)

(assert (=> b!237186 (= (apply!216 (+!643 lt!119949 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))) lt!119953) (apply!216 lt!119949 lt!119953))))

(declare-fun lt!119957 () Unit!7292)

(assert (=> b!237186 (= lt!119957 lt!119960)))

(declare-fun lt!119956 () ListLongMap!3573)

(assert (=> b!237186 (= lt!119956 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))

(declare-fun lt!119944 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119943 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119943 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119951 () Unit!7292)

(assert (=> b!237186 (= lt!119951 (addApplyDifferent!192 lt!119956 lt!119944 (zeroValue!4244 thiss!1504) lt!119943))))

(assert (=> b!237186 (= (apply!216 (+!643 lt!119956 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))) lt!119943) (apply!216 lt!119956 lt!119943))))

(declare-fun lt!119955 () Unit!7292)

(assert (=> b!237186 (= lt!119955 lt!119951)))

(declare-fun lt!119958 () ListLongMap!3573)

(assert (=> b!237186 (= lt!119958 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))

(declare-fun lt!119948 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119948 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119952 () (_ BitVec 64))

(assert (=> b!237186 (= lt!119952 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237186 (= lt!119942 (addApplyDifferent!192 lt!119958 lt!119948 (minValue!4244 thiss!1504) lt!119952))))

(assert (=> b!237186 (= (apply!216 (+!643 lt!119958 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))) lt!119952) (apply!216 lt!119958 lt!119952))))

(declare-fun b!237188 () Bool)

(declare-fun e!154036 () Bool)

(assert (=> b!237188 (= e!154036 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22053 () Bool)

(assert (=> bm!22053 (= call!22057 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))

(declare-fun b!237189 () Bool)

(declare-fun e!154037 () Bool)

(assert (=> b!237189 (= e!154037 (= (apply!216 lt!119946 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4244 thiss!1504)))))

(declare-fun b!237190 () Bool)

(declare-fun e!154044 () ListLongMap!3573)

(declare-fun call!22054 () ListLongMap!3573)

(assert (=> b!237190 (= e!154044 call!22054)))

(declare-fun b!237191 () Bool)

(assert (=> b!237191 (= e!154038 (+!643 call!22055 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))

(declare-fun b!237192 () Bool)

(assert (=> b!237192 (= e!154046 e!154037)))

(declare-fun res!116265 () Bool)

(assert (=> b!237192 (= res!116265 call!22059)))

(assert (=> b!237192 (=> (not res!116265) (not e!154037))))

(declare-fun b!237193 () Bool)

(declare-fun e!154043 () Bool)

(assert (=> b!237193 (= e!154043 e!154046)))

(declare-fun c!39527 () Bool)

(assert (=> b!237193 (= c!39527 (not (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237194 () Bool)

(declare-fun Unit!7295 () Unit!7292)

(assert (=> b!237194 (= e!154041 Unit!7295)))

(declare-fun b!237195 () Bool)

(declare-fun e!154042 () Bool)

(declare-fun e!154045 () Bool)

(assert (=> b!237195 (= e!154042 e!154045)))

(declare-fun res!116271 () Bool)

(assert (=> b!237195 (=> (not res!116271) (not e!154045))))

(assert (=> b!237195 (= res!116271 (contains!1684 lt!119946 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun b!237196 () Bool)

(declare-fun res!116269 () Bool)

(assert (=> b!237196 (=> (not res!116269) (not e!154043))))

(assert (=> b!237196 (= res!116269 e!154042)))

(declare-fun res!116266 () Bool)

(assert (=> b!237196 (=> res!116266 e!154042)))

(assert (=> b!237196 (= res!116266 (not e!154039))))

(declare-fun res!116272 () Bool)

(assert (=> b!237196 (=> (not res!116272) (not e!154039))))

(assert (=> b!237196 (= res!116272 (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun b!237197 () Bool)

(declare-fun res!116267 () Bool)

(assert (=> b!237197 (=> (not res!116267) (not e!154043))))

(assert (=> b!237197 (= res!116267 e!154040)))

(declare-fun c!39528 () Bool)

(assert (=> b!237197 (= c!39528 (not (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237198 () Bool)

(assert (=> b!237198 (= e!154044 call!22053)))

(declare-fun bm!22054 () Bool)

(assert (=> bm!22054 (= call!22054 call!22058)))

(declare-fun b!237199 () Bool)

(assert (=> b!237199 (= e!154034 (= (apply!216 lt!119946 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4244 thiss!1504)))))

(declare-fun bm!22055 () Bool)

(assert (=> bm!22055 (= call!22059 (contains!1684 lt!119946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!39526 () Bool)

(declare-fun bm!22056 () Bool)

(assert (=> bm!22056 (= call!22055 (+!643 (ite c!39526 call!22057 (ite c!39529 call!22058 call!22054)) (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))

(declare-fun b!237200 () Bool)

(declare-fun c!39531 () Bool)

(assert (=> b!237200 (= c!39531 (and (not (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237200 (= e!154035 e!154044)))

(declare-fun d!59533 () Bool)

(assert (=> d!59533 e!154043))

(declare-fun res!116268 () Bool)

(assert (=> d!59533 (=> (not res!116268) (not e!154043))))

(assert (=> d!59533 (= res!116268 (or (bvsge #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))))

(declare-fun lt!119950 () ListLongMap!3573)

(assert (=> d!59533 (= lt!119946 lt!119950)))

(declare-fun lt!119945 () Unit!7292)

(assert (=> d!59533 (= lt!119945 e!154041)))

(declare-fun c!39530 () Bool)

(assert (=> d!59533 (= c!39530 e!154036)))

(declare-fun res!116264 () Bool)

(assert (=> d!59533 (=> (not res!116264) (not e!154036))))

(assert (=> d!59533 (= res!116264 (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> d!59533 (= lt!119950 e!154038)))

(assert (=> d!59533 (= c!39526 (and (not (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4140 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59533 (validMask!0 (mask!10408 thiss!1504))))

(assert (=> d!59533 (= (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)) lt!119946)))

(declare-fun b!237187 () Bool)

(declare-fun get!2871 (ValueCell!2775 V!7963) V!7963)

(declare-fun dynLambda!559 (Int (_ BitVec 64)) V!7963)

(assert (=> b!237187 (= e!154045 (= (apply!216 lt!119946 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)) (get!2871 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5917 (_values!4386 thiss!1504))))))

(assert (=> b!237187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (= (and d!59533 c!39526) b!237191))

(assert (= (and d!59533 (not c!39526)) b!237184))

(assert (= (and b!237184 c!39529) b!237185))

(assert (= (and b!237184 (not c!39529)) b!237200))

(assert (= (and b!237200 c!39531) b!237198))

(assert (= (and b!237200 (not c!39531)) b!237190))

(assert (= (or b!237198 b!237190) bm!22054))

(assert (= (or b!237185 bm!22054) bm!22051))

(assert (= (or b!237185 b!237198) bm!22052))

(assert (= (or b!237191 bm!22051) bm!22053))

(assert (= (or b!237191 bm!22052) bm!22056))

(assert (= (and d!59533 res!116264) b!237188))

(assert (= (and d!59533 c!39530) b!237186))

(assert (= (and d!59533 (not c!39530)) b!237194))

(assert (= (and d!59533 res!116268) b!237196))

(assert (= (and b!237196 res!116272) b!237180))

(assert (= (and b!237196 (not res!116266)) b!237195))

(assert (= (and b!237195 res!116271) b!237187))

(assert (= (and b!237196 res!116269) b!237197))

(assert (= (and b!237197 c!39528) b!237181))

(assert (= (and b!237197 (not c!39528)) b!237182))

(assert (= (and b!237181 res!116270) b!237199))

(assert (= (or b!237181 b!237182) bm!22050))

(assert (= (and b!237197 res!116267) b!237193))

(assert (= (and b!237193 c!39527) b!237192))

(assert (= (and b!237193 (not c!39527)) b!237183))

(assert (= (and b!237192 res!116265) b!237189))

(assert (= (or b!237192 b!237183) bm!22055))

(declare-fun b_lambda!7943 () Bool)

(assert (=> (not b_lambda!7943) (not b!237187)))

(declare-fun t!8550 () Bool)

(declare-fun tb!2945 () Bool)

(assert (=> (and b!237099 (= (defaultEntry!4403 thiss!1504) (defaultEntry!4403 thiss!1504)) t!8550) tb!2945))

(declare-fun result!5157 () Bool)

(assert (=> tb!2945 (= result!5157 tp_is_empty!6237)))

(assert (=> b!237187 t!8550))

(declare-fun b_and!13327 () Bool)

(assert (= b_and!13323 (and (=> t!8550 result!5157) b_and!13327)))

(declare-fun m!257921 () Bool)

(assert (=> b!237199 m!257921))

(declare-fun m!257923 () Bool)

(assert (=> b!237188 m!257923))

(assert (=> b!237188 m!257923))

(declare-fun m!257925 () Bool)

(assert (=> b!237188 m!257925))

(assert (=> b!237180 m!257923))

(assert (=> b!237180 m!257923))

(assert (=> b!237180 m!257925))

(declare-fun m!257927 () Bool)

(assert (=> bm!22053 m!257927))

(declare-fun m!257929 () Bool)

(assert (=> bm!22056 m!257929))

(assert (=> d!59533 m!257889))

(declare-fun m!257931 () Bool)

(assert (=> b!237191 m!257931))

(assert (=> b!237187 m!257923))

(declare-fun m!257933 () Bool)

(assert (=> b!237187 m!257933))

(assert (=> b!237187 m!257933))

(declare-fun m!257935 () Bool)

(assert (=> b!237187 m!257935))

(declare-fun m!257937 () Bool)

(assert (=> b!237187 m!257937))

(assert (=> b!237187 m!257923))

(declare-fun m!257939 () Bool)

(assert (=> b!237187 m!257939))

(assert (=> b!237187 m!257935))

(declare-fun m!257941 () Bool)

(assert (=> bm!22055 m!257941))

(declare-fun m!257943 () Bool)

(assert (=> bm!22050 m!257943))

(declare-fun m!257945 () Bool)

(assert (=> b!237186 m!257945))

(declare-fun m!257947 () Bool)

(assert (=> b!237186 m!257947))

(declare-fun m!257949 () Bool)

(assert (=> b!237186 m!257949))

(declare-fun m!257951 () Bool)

(assert (=> b!237186 m!257951))

(declare-fun m!257953 () Bool)

(assert (=> b!237186 m!257953))

(assert (=> b!237186 m!257923))

(declare-fun m!257955 () Bool)

(assert (=> b!237186 m!257955))

(declare-fun m!257957 () Bool)

(assert (=> b!237186 m!257957))

(assert (=> b!237186 m!257951))

(declare-fun m!257959 () Bool)

(assert (=> b!237186 m!257959))

(declare-fun m!257961 () Bool)

(assert (=> b!237186 m!257961))

(assert (=> b!237186 m!257959))

(declare-fun m!257963 () Bool)

(assert (=> b!237186 m!257963))

(assert (=> b!237186 m!257957))

(declare-fun m!257965 () Bool)

(assert (=> b!237186 m!257965))

(assert (=> b!237186 m!257947))

(declare-fun m!257967 () Bool)

(assert (=> b!237186 m!257967))

(declare-fun m!257969 () Bool)

(assert (=> b!237186 m!257969))

(assert (=> b!237186 m!257927))

(declare-fun m!257971 () Bool)

(assert (=> b!237186 m!257971))

(declare-fun m!257973 () Bool)

(assert (=> b!237186 m!257973))

(declare-fun m!257975 () Bool)

(assert (=> b!237189 m!257975))

(assert (=> b!237195 m!257923))

(assert (=> b!237195 m!257923))

(declare-fun m!257977 () Bool)

(assert (=> b!237195 m!257977))

(assert (=> b!237097 d!59533))

(declare-fun d!59535 () Bool)

(assert (=> d!59535 (= (validMask!0 (mask!10408 thiss!1504)) (and (or (= (mask!10408 thiss!1504) #b00000000000000000000000000000111) (= (mask!10408 thiss!1504) #b00000000000000000000000000001111) (= (mask!10408 thiss!1504) #b00000000000000000000000000011111) (= (mask!10408 thiss!1504) #b00000000000000000000000000111111) (= (mask!10408 thiss!1504) #b00000000000000000000000001111111) (= (mask!10408 thiss!1504) #b00000000000000000000000011111111) (= (mask!10408 thiss!1504) #b00000000000000000000000111111111) (= (mask!10408 thiss!1504) #b00000000000000000000001111111111) (= (mask!10408 thiss!1504) #b00000000000000000000011111111111) (= (mask!10408 thiss!1504) #b00000000000000000000111111111111) (= (mask!10408 thiss!1504) #b00000000000000000001111111111111) (= (mask!10408 thiss!1504) #b00000000000000000011111111111111) (= (mask!10408 thiss!1504) #b00000000000000000111111111111111) (= (mask!10408 thiss!1504) #b00000000000000001111111111111111) (= (mask!10408 thiss!1504) #b00000000000000011111111111111111) (= (mask!10408 thiss!1504) #b00000000000000111111111111111111) (= (mask!10408 thiss!1504) #b00000000000001111111111111111111) (= (mask!10408 thiss!1504) #b00000000000011111111111111111111) (= (mask!10408 thiss!1504) #b00000000000111111111111111111111) (= (mask!10408 thiss!1504) #b00000000001111111111111111111111) (= (mask!10408 thiss!1504) #b00000000011111111111111111111111) (= (mask!10408 thiss!1504) #b00000000111111111111111111111111) (= (mask!10408 thiss!1504) #b00000001111111111111111111111111) (= (mask!10408 thiss!1504) #b00000011111111111111111111111111) (= (mask!10408 thiss!1504) #b00000111111111111111111111111111) (= (mask!10408 thiss!1504) #b00001111111111111111111111111111) (= (mask!10408 thiss!1504) #b00011111111111111111111111111111) (= (mask!10408 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10408 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237093 d!59535))

(declare-fun d!59537 () Bool)

(assert (=> d!59537 (= (array_inv!3681 (_keys!6491 thiss!1504)) (bvsge (size!5918 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237099 d!59537))

(declare-fun d!59539 () Bool)

(assert (=> d!59539 (= (array_inv!3682 (_values!4386 thiss!1504)) (bvsge (size!5917 (_values!4386 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237099 d!59539))

(declare-fun d!59541 () Bool)

(declare-fun res!116279 () Bool)

(declare-fun e!154049 () Bool)

(assert (=> d!59541 (=> (not res!116279) (not e!154049))))

(declare-fun simpleValid!239 (LongMapFixedSize!3450) Bool)

(assert (=> d!59541 (= res!116279 (simpleValid!239 thiss!1504))))

(assert (=> d!59541 (= (valid!1361 thiss!1504) e!154049)))

(declare-fun b!237209 () Bool)

(declare-fun res!116280 () Bool)

(assert (=> b!237209 (=> (not res!116280) (not e!154049))))

(declare-fun arrayCountValidKeys!0 (array!11745 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237209 (= res!116280 (= (arrayCountValidKeys!0 (_keys!6491 thiss!1504) #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))) (_size!1774 thiss!1504)))))

(declare-fun b!237210 () Bool)

(declare-fun res!116281 () Bool)

(assert (=> b!237210 (=> (not res!116281) (not e!154049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11745 (_ BitVec 32)) Bool)

(assert (=> b!237210 (= res!116281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(declare-fun b!237211 () Bool)

(declare-datatypes ((List!3564 0))(
  ( (Nil!3561) (Cons!3560 (h!4214 (_ BitVec 64)) (t!8551 List!3564)) )
))
(declare-fun arrayNoDuplicates!0 (array!11745 (_ BitVec 32) List!3564) Bool)

(assert (=> b!237211 (= e!154049 (arrayNoDuplicates!0 (_keys!6491 thiss!1504) #b00000000000000000000000000000000 Nil!3561))))

(assert (= (and d!59541 res!116279) b!237209))

(assert (= (and b!237209 res!116280) b!237210))

(assert (= (and b!237210 res!116281) b!237211))

(declare-fun m!257979 () Bool)

(assert (=> d!59541 m!257979))

(declare-fun m!257981 () Bool)

(assert (=> b!237209 m!257981))

(declare-fun m!257983 () Bool)

(assert (=> b!237210 m!257983))

(declare-fun m!257985 () Bool)

(assert (=> b!237211 m!257985))

(assert (=> start!22718 d!59541))

(declare-fun b!237224 () Bool)

(declare-fun c!39538 () Bool)

(declare-fun lt!119971 () (_ BitVec 64))

(assert (=> b!237224 (= c!39538 (= lt!119971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154058 () SeekEntryResult!1007)

(declare-fun e!154057 () SeekEntryResult!1007)

(assert (=> b!237224 (= e!154058 e!154057)))

(declare-fun d!59543 () Bool)

(declare-fun lt!119970 () SeekEntryResult!1007)

(assert (=> d!59543 (and (or ((_ is Undefined!1007) lt!119970) (not ((_ is Found!1007) lt!119970)) (and (bvsge (index!6199 lt!119970) #b00000000000000000000000000000000) (bvslt (index!6199 lt!119970) (size!5918 (_keys!6491 thiss!1504))))) (or ((_ is Undefined!1007) lt!119970) ((_ is Found!1007) lt!119970) (not ((_ is MissingZero!1007) lt!119970)) (and (bvsge (index!6198 lt!119970) #b00000000000000000000000000000000) (bvslt (index!6198 lt!119970) (size!5918 (_keys!6491 thiss!1504))))) (or ((_ is Undefined!1007) lt!119970) ((_ is Found!1007) lt!119970) ((_ is MissingZero!1007) lt!119970) (not ((_ is MissingVacant!1007) lt!119970)) (and (bvsge (index!6201 lt!119970) #b00000000000000000000000000000000) (bvslt (index!6201 lt!119970) (size!5918 (_keys!6491 thiss!1504))))) (or ((_ is Undefined!1007) lt!119970) (ite ((_ is Found!1007) lt!119970) (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6199 lt!119970)) key!932) (ite ((_ is MissingZero!1007) lt!119970) (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6198 lt!119970)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1007) lt!119970) (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6201 lt!119970)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!154056 () SeekEntryResult!1007)

(assert (=> d!59543 (= lt!119970 e!154056)))

(declare-fun c!39540 () Bool)

(declare-fun lt!119972 () SeekEntryResult!1007)

(assert (=> d!59543 (= c!39540 (and ((_ is Intermediate!1007) lt!119972) (undefined!1819 lt!119972)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11745 (_ BitVec 32)) SeekEntryResult!1007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59543 (= lt!119972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10408 thiss!1504)) key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(assert (=> d!59543 (validMask!0 (mask!10408 thiss!1504))))

(assert (=> d!59543 (= (seekEntryOrOpen!0 key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)) lt!119970)))

(declare-fun b!237225 () Bool)

(assert (=> b!237225 (= e!154057 (MissingZero!1007 (index!6200 lt!119972)))))

(declare-fun b!237226 () Bool)

(assert (=> b!237226 (= e!154058 (Found!1007 (index!6200 lt!119972)))))

(declare-fun b!237227 () Bool)

(assert (=> b!237227 (= e!154056 Undefined!1007)))

(declare-fun b!237228 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11745 (_ BitVec 32)) SeekEntryResult!1007)

(assert (=> b!237228 (= e!154057 (seekKeyOrZeroReturnVacant!0 (x!23933 lt!119972) (index!6200 lt!119972) (index!6200 lt!119972) key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(declare-fun b!237229 () Bool)

(assert (=> b!237229 (= e!154056 e!154058)))

(assert (=> b!237229 (= lt!119971 (select (arr!5579 (_keys!6491 thiss!1504)) (index!6200 lt!119972)))))

(declare-fun c!39539 () Bool)

(assert (=> b!237229 (= c!39539 (= lt!119971 key!932))))

(assert (= (and d!59543 c!39540) b!237227))

(assert (= (and d!59543 (not c!39540)) b!237229))

(assert (= (and b!237229 c!39539) b!237226))

(assert (= (and b!237229 (not c!39539)) b!237224))

(assert (= (and b!237224 c!39538) b!237225))

(assert (= (and b!237224 (not c!39538)) b!237228))

(declare-fun m!257987 () Bool)

(assert (=> d!59543 m!257987))

(declare-fun m!257989 () Bool)

(assert (=> d!59543 m!257989))

(declare-fun m!257991 () Bool)

(assert (=> d!59543 m!257991))

(assert (=> d!59543 m!257991))

(declare-fun m!257993 () Bool)

(assert (=> d!59543 m!257993))

(assert (=> d!59543 m!257889))

(declare-fun m!257995 () Bool)

(assert (=> d!59543 m!257995))

(declare-fun m!257997 () Bool)

(assert (=> b!237228 m!257997))

(declare-fun m!257999 () Bool)

(assert (=> b!237229 m!257999))

(assert (=> b!237101 d!59543))

(declare-fun b!237236 () Bool)

(declare-fun e!154064 () Bool)

(assert (=> b!237236 (= e!154064 tp_is_empty!6237)))

(declare-fun condMapEmpty!10576 () Bool)

(declare-fun mapDefault!10576 () ValueCell!2775)

(assert (=> mapNonEmpty!10570 (= condMapEmpty!10576 (= mapRest!10570 ((as const (Array (_ BitVec 32) ValueCell!2775)) mapDefault!10576)))))

(declare-fun e!154063 () Bool)

(declare-fun mapRes!10576 () Bool)

(assert (=> mapNonEmpty!10570 (= tp!22312 (and e!154063 mapRes!10576))))

(declare-fun mapIsEmpty!10576 () Bool)

(assert (=> mapIsEmpty!10576 mapRes!10576))

(declare-fun mapNonEmpty!10576 () Bool)

(declare-fun tp!22321 () Bool)

(assert (=> mapNonEmpty!10576 (= mapRes!10576 (and tp!22321 e!154064))))

(declare-fun mapValue!10576 () ValueCell!2775)

(declare-fun mapKey!10576 () (_ BitVec 32))

(declare-fun mapRest!10576 () (Array (_ BitVec 32) ValueCell!2775))

(assert (=> mapNonEmpty!10576 (= mapRest!10570 (store mapRest!10576 mapKey!10576 mapValue!10576))))

(declare-fun b!237237 () Bool)

(assert (=> b!237237 (= e!154063 tp_is_empty!6237)))

(assert (= (and mapNonEmpty!10570 condMapEmpty!10576) mapIsEmpty!10576))

(assert (= (and mapNonEmpty!10570 (not condMapEmpty!10576)) mapNonEmpty!10576))

(assert (= (and mapNonEmpty!10576 ((_ is ValueCellFull!2775) mapValue!10576)) b!237236))

(assert (= (and mapNonEmpty!10570 ((_ is ValueCellFull!2775) mapDefault!10576)) b!237237))

(declare-fun m!258001 () Bool)

(assert (=> mapNonEmpty!10576 m!258001))

(declare-fun b_lambda!7945 () Bool)

(assert (= b_lambda!7943 (or (and b!237099 b_free!6375) b_lambda!7945)))

(check-sat (not bm!22050) (not b_next!6375) (not b!237195) (not b!237191) (not b!237211) b_and!13327 (not bm!22056) (not bm!22055) (not b!237209) (not b!237210) (not d!59543) (not b_lambda!7945) (not b!237187) (not b!237188) (not bm!22053) tp_is_empty!6237 (not d!59541) (not b!237199) (not d!59531) (not b!237228) (not b!237135) (not b!237180) (not d!59533) (not mapNonEmpty!10576) (not b!237186) (not b!237189) (not b!237137))
(check-sat b_and!13327 (not b_next!6375))
(get-model)

(declare-fun d!59545 () Bool)

(assert (=> d!59545 (isDefined!215 (getValueByKey!274 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))

(declare-fun lt!119975 () Unit!7292)

(declare-fun choose!1110 (List!3562 (_ BitVec 64)) Unit!7292)

(assert (=> d!59545 (= lt!119975 (choose!1110 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))

(declare-fun e!154067 () Bool)

(assert (=> d!59545 e!154067))

(declare-fun res!116284 () Bool)

(assert (=> d!59545 (=> (not res!116284) (not e!154067))))

(declare-fun isStrictlySorted!365 (List!3562) Bool)

(assert (=> d!59545 (= res!116284 (isStrictlySorted!365 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))))

(assert (=> d!59545 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932) lt!119975)))

(declare-fun b!237240 () Bool)

(assert (=> b!237240 (= e!154067 (containsKey!266 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))

(assert (= (and d!59545 res!116284) b!237240))

(assert (=> d!59545 m!257917))

(assert (=> d!59545 m!257917))

(assert (=> d!59545 m!257919))

(declare-fun m!258003 () Bool)

(assert (=> d!59545 m!258003))

(declare-fun m!258005 () Bool)

(assert (=> d!59545 m!258005))

(assert (=> b!237240 m!257913))

(assert (=> b!237135 d!59545))

(declare-fun d!59547 () Bool)

(declare-fun isEmpty!516 (Option!280) Bool)

(assert (=> d!59547 (= (isDefined!215 (getValueByKey!274 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932)) (not (isEmpty!516 (getValueByKey!274 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932))))))

(declare-fun bs!8758 () Bool)

(assert (= bs!8758 d!59547))

(assert (=> bs!8758 m!257917))

(declare-fun m!258007 () Bool)

(assert (=> bs!8758 m!258007))

(assert (=> b!237135 d!59547))

(declare-fun b!237250 () Bool)

(declare-fun e!154072 () Option!280)

(declare-fun e!154073 () Option!280)

(assert (=> b!237250 (= e!154072 e!154073)))

(declare-fun c!39546 () Bool)

(assert (=> b!237250 (= c!39546 (and ((_ is Cons!3558) (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))) (not (= (_1!2341 (h!4212 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))))) key!932))))))

(declare-fun b!237252 () Bool)

(assert (=> b!237252 (= e!154073 None!278)))

(declare-fun d!59549 () Bool)

(declare-fun c!39545 () Bool)

(assert (=> d!59549 (= c!39545 (and ((_ is Cons!3558) (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))) (= (_1!2341 (h!4212 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))))) key!932)))))

(assert (=> d!59549 (= (getValueByKey!274 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932) e!154072)))

(declare-fun b!237251 () Bool)

(assert (=> b!237251 (= e!154073 (getValueByKey!274 (t!8547 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))) key!932))))

(declare-fun b!237249 () Bool)

(assert (=> b!237249 (= e!154072 (Some!279 (_2!2341 (h!4212 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))))))))

(assert (= (and d!59549 c!39545) b!237249))

(assert (= (and d!59549 (not c!39545)) b!237250))

(assert (= (and b!237250 c!39546) b!237251))

(assert (= (and b!237250 (not c!39546)) b!237252))

(declare-fun m!258009 () Bool)

(assert (=> b!237251 m!258009))

(assert (=> b!237135 d!59549))

(assert (=> b!237137 d!59547))

(assert (=> b!237137 d!59549))

(assert (=> d!59533 d!59535))

(declare-fun d!59551 () Bool)

(declare-fun e!154075 () Bool)

(assert (=> d!59551 e!154075))

(declare-fun res!116285 () Bool)

(assert (=> d!59551 (=> res!116285 e!154075)))

(declare-fun lt!119977 () Bool)

(assert (=> d!59551 (= res!116285 (not lt!119977))))

(declare-fun lt!119976 () Bool)

(assert (=> d!59551 (= lt!119977 lt!119976)))

(declare-fun lt!119978 () Unit!7292)

(declare-fun e!154074 () Unit!7292)

(assert (=> d!59551 (= lt!119978 e!154074)))

(declare-fun c!39547 () Bool)

(assert (=> d!59551 (= c!39547 lt!119976)))

(assert (=> d!59551 (= lt!119976 (containsKey!266 (toList!1802 lt!119946) (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59551 (= (contains!1684 lt!119946 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)) lt!119977)))

(declare-fun b!237253 () Bool)

(declare-fun lt!119979 () Unit!7292)

(assert (=> b!237253 (= e!154074 lt!119979)))

(assert (=> b!237253 (= lt!119979 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1802 lt!119946) (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237253 (isDefined!215 (getValueByKey!274 (toList!1802 lt!119946) (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237254 () Bool)

(declare-fun Unit!7296 () Unit!7292)

(assert (=> b!237254 (= e!154074 Unit!7296)))

(declare-fun b!237255 () Bool)

(assert (=> b!237255 (= e!154075 (isDefined!215 (getValueByKey!274 (toList!1802 lt!119946) (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59551 c!39547) b!237253))

(assert (= (and d!59551 (not c!39547)) b!237254))

(assert (= (and d!59551 (not res!116285)) b!237255))

(assert (=> d!59551 m!257923))

(declare-fun m!258011 () Bool)

(assert (=> d!59551 m!258011))

(assert (=> b!237253 m!257923))

(declare-fun m!258013 () Bool)

(assert (=> b!237253 m!258013))

(assert (=> b!237253 m!257923))

(declare-fun m!258015 () Bool)

(assert (=> b!237253 m!258015))

(assert (=> b!237253 m!258015))

(declare-fun m!258017 () Bool)

(assert (=> b!237253 m!258017))

(assert (=> b!237255 m!257923))

(assert (=> b!237255 m!258015))

(assert (=> b!237255 m!258015))

(assert (=> b!237255 m!258017))

(assert (=> b!237195 d!59551))

(declare-fun d!59553 () Bool)

(declare-fun e!154077 () Bool)

(assert (=> d!59553 e!154077))

(declare-fun res!116286 () Bool)

(assert (=> d!59553 (=> res!116286 e!154077)))

(declare-fun lt!119981 () Bool)

(assert (=> d!59553 (= res!116286 (not lt!119981))))

(declare-fun lt!119980 () Bool)

(assert (=> d!59553 (= lt!119981 lt!119980)))

(declare-fun lt!119982 () Unit!7292)

(declare-fun e!154076 () Unit!7292)

(assert (=> d!59553 (= lt!119982 e!154076)))

(declare-fun c!39548 () Bool)

(assert (=> d!59553 (= c!39548 lt!119980)))

(assert (=> d!59553 (= lt!119980 (containsKey!266 (toList!1802 lt!119946) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59553 (= (contains!1684 lt!119946 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119981)))

(declare-fun b!237256 () Bool)

(declare-fun lt!119983 () Unit!7292)

(assert (=> b!237256 (= e!154076 lt!119983)))

(assert (=> b!237256 (= lt!119983 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1802 lt!119946) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237256 (isDefined!215 (getValueByKey!274 (toList!1802 lt!119946) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237257 () Bool)

(declare-fun Unit!7297 () Unit!7292)

(assert (=> b!237257 (= e!154076 Unit!7297)))

(declare-fun b!237258 () Bool)

(assert (=> b!237258 (= e!154077 (isDefined!215 (getValueByKey!274 (toList!1802 lt!119946) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59553 c!39548) b!237256))

(assert (= (and d!59553 (not c!39548)) b!237257))

(assert (= (and d!59553 (not res!116286)) b!237258))

(declare-fun m!258019 () Bool)

(assert (=> d!59553 m!258019))

(declare-fun m!258021 () Bool)

(assert (=> b!237256 m!258021))

(declare-fun m!258023 () Bool)

(assert (=> b!237256 m!258023))

(assert (=> b!237256 m!258023))

(declare-fun m!258025 () Bool)

(assert (=> b!237256 m!258025))

(assert (=> b!237258 m!258023))

(assert (=> b!237258 m!258023))

(assert (=> b!237258 m!258025))

(assert (=> bm!22055 d!59553))

(declare-fun b!237269 () Bool)

(declare-fun e!154089 () Bool)

(declare-fun call!22062 () Bool)

(assert (=> b!237269 (= e!154089 call!22062)))

(declare-fun b!237270 () Bool)

(declare-fun e!154088 () Bool)

(assert (=> b!237270 (= e!154088 e!154089)))

(declare-fun c!39551 () Bool)

(assert (=> b!237270 (= c!39551 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22059 () Bool)

(assert (=> bm!22059 (= call!22062 (arrayNoDuplicates!0 (_keys!6491 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39551 (Cons!3560 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000) Nil!3561) Nil!3561)))))

(declare-fun b!237272 () Bool)

(declare-fun e!154086 () Bool)

(assert (=> b!237272 (= e!154086 e!154088)))

(declare-fun res!116294 () Bool)

(assert (=> b!237272 (=> (not res!116294) (not e!154088))))

(declare-fun e!154087 () Bool)

(assert (=> b!237272 (= res!116294 (not e!154087))))

(declare-fun res!116295 () Bool)

(assert (=> b!237272 (=> (not res!116295) (not e!154087))))

(assert (=> b!237272 (= res!116295 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237273 () Bool)

(declare-fun contains!1686 (List!3564 (_ BitVec 64)) Bool)

(assert (=> b!237273 (= e!154087 (contains!1686 Nil!3561 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59555 () Bool)

(declare-fun res!116293 () Bool)

(assert (=> d!59555 (=> res!116293 e!154086)))

(assert (=> d!59555 (= res!116293 (bvsge #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> d!59555 (= (arrayNoDuplicates!0 (_keys!6491 thiss!1504) #b00000000000000000000000000000000 Nil!3561) e!154086)))

(declare-fun b!237271 () Bool)

(assert (=> b!237271 (= e!154089 call!22062)))

(assert (= (and d!59555 (not res!116293)) b!237272))

(assert (= (and b!237272 res!116295) b!237273))

(assert (= (and b!237272 res!116294) b!237270))

(assert (= (and b!237270 c!39551) b!237269))

(assert (= (and b!237270 (not c!39551)) b!237271))

(assert (= (or b!237269 b!237271) bm!22059))

(assert (=> b!237270 m!257923))

(assert (=> b!237270 m!257923))

(assert (=> b!237270 m!257925))

(assert (=> bm!22059 m!257923))

(declare-fun m!258027 () Bool)

(assert (=> bm!22059 m!258027))

(assert (=> b!237272 m!257923))

(assert (=> b!237272 m!257923))

(assert (=> b!237272 m!257925))

(assert (=> b!237273 m!257923))

(assert (=> b!237273 m!257923))

(declare-fun m!258029 () Bool)

(assert (=> b!237273 m!258029))

(assert (=> b!237211 d!59555))

(declare-fun d!59557 () Bool)

(declare-fun e!154092 () Bool)

(assert (=> d!59557 e!154092))

(declare-fun res!116301 () Bool)

(assert (=> d!59557 (=> (not res!116301) (not e!154092))))

(declare-fun lt!119995 () ListLongMap!3573)

(assert (=> d!59557 (= res!116301 (contains!1684 lt!119995 (_1!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))

(declare-fun lt!119992 () List!3562)

(assert (=> d!59557 (= lt!119995 (ListLongMap!3574 lt!119992))))

(declare-fun lt!119993 () Unit!7292)

(declare-fun lt!119994 () Unit!7292)

(assert (=> d!59557 (= lt!119993 lt!119994)))

(assert (=> d!59557 (= (getValueByKey!274 lt!119992 (_1!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!153 (List!3562 (_ BitVec 64) V!7963) Unit!7292)

(assert (=> d!59557 (= lt!119994 (lemmaContainsTupThenGetReturnValue!153 lt!119992 (_1!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))

(declare-fun insertStrictlySorted!156 (List!3562 (_ BitVec 64) V!7963) List!3562)

(assert (=> d!59557 (= lt!119992 (insertStrictlySorted!156 (toList!1802 call!22055) (_1!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))

(assert (=> d!59557 (= (+!643 call!22055 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))) lt!119995)))

(declare-fun b!237278 () Bool)

(declare-fun res!116300 () Bool)

(assert (=> b!237278 (=> (not res!116300) (not e!154092))))

(assert (=> b!237278 (= res!116300 (= (getValueByKey!274 (toList!1802 lt!119995) (_1!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))))

(declare-fun b!237279 () Bool)

(declare-fun contains!1687 (List!3562 tuple2!4660) Bool)

(assert (=> b!237279 (= e!154092 (contains!1687 (toList!1802 lt!119995) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))

(assert (= (and d!59557 res!116301) b!237278))

(assert (= (and b!237278 res!116300) b!237279))

(declare-fun m!258031 () Bool)

(assert (=> d!59557 m!258031))

(declare-fun m!258033 () Bool)

(assert (=> d!59557 m!258033))

(declare-fun m!258035 () Bool)

(assert (=> d!59557 m!258035))

(declare-fun m!258037 () Bool)

(assert (=> d!59557 m!258037))

(declare-fun m!258039 () Bool)

(assert (=> b!237278 m!258039))

(declare-fun m!258041 () Bool)

(assert (=> b!237279 m!258041))

(assert (=> b!237191 d!59557))

(declare-fun d!59559 () Bool)

(declare-fun e!154093 () Bool)

(assert (=> d!59559 e!154093))

(declare-fun res!116303 () Bool)

(assert (=> d!59559 (=> (not res!116303) (not e!154093))))

(declare-fun lt!119999 () ListLongMap!3573)

(assert (=> d!59559 (= res!116303 (contains!1684 lt!119999 (_1!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))))

(declare-fun lt!119996 () List!3562)

(assert (=> d!59559 (= lt!119999 (ListLongMap!3574 lt!119996))))

(declare-fun lt!119997 () Unit!7292)

(declare-fun lt!119998 () Unit!7292)

(assert (=> d!59559 (= lt!119997 lt!119998)))

(assert (=> d!59559 (= (getValueByKey!274 lt!119996 (_1!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))) (Some!279 (_2!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))))

(assert (=> d!59559 (= lt!119998 (lemmaContainsTupThenGetReturnValue!153 lt!119996 (_1!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))) (_2!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))))

(assert (=> d!59559 (= lt!119996 (insertStrictlySorted!156 (toList!1802 (ite c!39526 call!22057 (ite c!39529 call!22058 call!22054))) (_1!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))) (_2!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))))))

(assert (=> d!59559 (= (+!643 (ite c!39526 call!22057 (ite c!39529 call!22058 call!22054)) (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))) lt!119999)))

(declare-fun b!237280 () Bool)

(declare-fun res!116302 () Bool)

(assert (=> b!237280 (=> (not res!116302) (not e!154093))))

(assert (=> b!237280 (= res!116302 (= (getValueByKey!274 (toList!1802 lt!119999) (_1!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504))))) (Some!279 (_2!2341 (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))))

(declare-fun b!237281 () Bool)

(assert (=> b!237281 (= e!154093 (contains!1687 (toList!1802 lt!119999) (ite (or c!39526 c!39529) (tuple2!4661 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4244 thiss!1504)) (tuple2!4661 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4244 thiss!1504)))))))

(assert (= (and d!59559 res!116303) b!237280))

(assert (= (and b!237280 res!116302) b!237281))

(declare-fun m!258043 () Bool)

(assert (=> d!59559 m!258043))

(declare-fun m!258045 () Bool)

(assert (=> d!59559 m!258045))

(declare-fun m!258047 () Bool)

(assert (=> d!59559 m!258047))

(declare-fun m!258049 () Bool)

(assert (=> d!59559 m!258049))

(declare-fun m!258051 () Bool)

(assert (=> b!237280 m!258051))

(declare-fun m!258053 () Bool)

(assert (=> b!237281 m!258053))

(assert (=> bm!22056 d!59559))

(declare-fun b!237293 () Bool)

(declare-fun e!154096 () Bool)

(assert (=> b!237293 (= e!154096 (and (bvsge (extraKeys!4140 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4140 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1774 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!59561 () Bool)

(declare-fun res!116314 () Bool)

(assert (=> d!59561 (=> (not res!116314) (not e!154096))))

(assert (=> d!59561 (= res!116314 (validMask!0 (mask!10408 thiss!1504)))))

(assert (=> d!59561 (= (simpleValid!239 thiss!1504) e!154096)))

(declare-fun b!237290 () Bool)

(declare-fun res!116312 () Bool)

(assert (=> b!237290 (=> (not res!116312) (not e!154096))))

(assert (=> b!237290 (= res!116312 (and (= (size!5917 (_values!4386 thiss!1504)) (bvadd (mask!10408 thiss!1504) #b00000000000000000000000000000001)) (= (size!5918 (_keys!6491 thiss!1504)) (size!5917 (_values!4386 thiss!1504))) (bvsge (_size!1774 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1774 thiss!1504) (bvadd (mask!10408 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!237292 () Bool)

(declare-fun res!116313 () Bool)

(assert (=> b!237292 (=> (not res!116313) (not e!154096))))

(declare-fun size!5921 (LongMapFixedSize!3450) (_ BitVec 32))

(assert (=> b!237292 (= res!116313 (= (size!5921 thiss!1504) (bvadd (_size!1774 thiss!1504) (bvsdiv (bvadd (extraKeys!4140 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!237291 () Bool)

(declare-fun res!116315 () Bool)

(assert (=> b!237291 (=> (not res!116315) (not e!154096))))

(assert (=> b!237291 (= res!116315 (bvsge (size!5921 thiss!1504) (_size!1774 thiss!1504)))))

(assert (= (and d!59561 res!116314) b!237290))

(assert (= (and b!237290 res!116312) b!237291))

(assert (= (and b!237291 res!116315) b!237292))

(assert (= (and b!237292 res!116313) b!237293))

(assert (=> d!59561 m!257889))

(declare-fun m!258055 () Bool)

(assert (=> b!237292 m!258055))

(assert (=> b!237291 m!258055))

(assert (=> d!59541 d!59561))

(declare-fun b!237306 () Bool)

(declare-fun e!154105 () SeekEntryResult!1007)

(assert (=> b!237306 (= e!154105 (MissingVacant!1007 (index!6200 lt!119972)))))

(declare-fun d!59563 () Bool)

(declare-fun lt!120004 () SeekEntryResult!1007)

(assert (=> d!59563 (and (or ((_ is Undefined!1007) lt!120004) (not ((_ is Found!1007) lt!120004)) (and (bvsge (index!6199 lt!120004) #b00000000000000000000000000000000) (bvslt (index!6199 lt!120004) (size!5918 (_keys!6491 thiss!1504))))) (or ((_ is Undefined!1007) lt!120004) ((_ is Found!1007) lt!120004) (not ((_ is MissingVacant!1007) lt!120004)) (not (= (index!6201 lt!120004) (index!6200 lt!119972))) (and (bvsge (index!6201 lt!120004) #b00000000000000000000000000000000) (bvslt (index!6201 lt!120004) (size!5918 (_keys!6491 thiss!1504))))) (or ((_ is Undefined!1007) lt!120004) (ite ((_ is Found!1007) lt!120004) (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6199 lt!120004)) key!932) (and ((_ is MissingVacant!1007) lt!120004) (= (index!6201 lt!120004) (index!6200 lt!119972)) (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6201 lt!120004)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!154104 () SeekEntryResult!1007)

(assert (=> d!59563 (= lt!120004 e!154104)))

(declare-fun c!39558 () Bool)

(assert (=> d!59563 (= c!39558 (bvsge (x!23933 lt!119972) #b01111111111111111111111111111110))))

(declare-fun lt!120005 () (_ BitVec 64))

(assert (=> d!59563 (= lt!120005 (select (arr!5579 (_keys!6491 thiss!1504)) (index!6200 lt!119972)))))

(assert (=> d!59563 (validMask!0 (mask!10408 thiss!1504))))

(assert (=> d!59563 (= (seekKeyOrZeroReturnVacant!0 (x!23933 lt!119972) (index!6200 lt!119972) (index!6200 lt!119972) key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)) lt!120004)))

(declare-fun b!237307 () Bool)

(assert (=> b!237307 (= e!154104 Undefined!1007)))

(declare-fun b!237308 () Bool)

(declare-fun e!154103 () SeekEntryResult!1007)

(assert (=> b!237308 (= e!154103 (Found!1007 (index!6200 lt!119972)))))

(declare-fun b!237309 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237309 (= e!154105 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23933 lt!119972) #b00000000000000000000000000000001) (nextIndex!0 (index!6200 lt!119972) (x!23933 lt!119972) (mask!10408 thiss!1504)) (index!6200 lt!119972) key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(declare-fun b!237310 () Bool)

(declare-fun c!39560 () Bool)

(assert (=> b!237310 (= c!39560 (= lt!120005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237310 (= e!154103 e!154105)))

(declare-fun b!237311 () Bool)

(assert (=> b!237311 (= e!154104 e!154103)))

(declare-fun c!39559 () Bool)

(assert (=> b!237311 (= c!39559 (= lt!120005 key!932))))

(assert (= (and d!59563 c!39558) b!237307))

(assert (= (and d!59563 (not c!39558)) b!237311))

(assert (= (and b!237311 c!39559) b!237308))

(assert (= (and b!237311 (not c!39559)) b!237310))

(assert (= (and b!237310 c!39560) b!237306))

(assert (= (and b!237310 (not c!39560)) b!237309))

(declare-fun m!258057 () Bool)

(assert (=> d!59563 m!258057))

(declare-fun m!258059 () Bool)

(assert (=> d!59563 m!258059))

(assert (=> d!59563 m!257999))

(assert (=> d!59563 m!257889))

(declare-fun m!258061 () Bool)

(assert (=> b!237309 m!258061))

(assert (=> b!237309 m!258061))

(declare-fun m!258063 () Bool)

(assert (=> b!237309 m!258063))

(assert (=> b!237228 d!59563))

(declare-fun b!237320 () Bool)

(declare-fun e!154111 () (_ BitVec 32))

(declare-fun call!22065 () (_ BitVec 32))

(assert (=> b!237320 (= e!154111 call!22065)))

(declare-fun b!237321 () Bool)

(declare-fun e!154110 () (_ BitVec 32))

(assert (=> b!237321 (= e!154110 e!154111)))

(declare-fun c!39565 () Bool)

(assert (=> b!237321 (= c!39565 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59565 () Bool)

(declare-fun lt!120008 () (_ BitVec 32))

(assert (=> d!59565 (and (bvsge lt!120008 #b00000000000000000000000000000000) (bvsle lt!120008 (bvsub (size!5918 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59565 (= lt!120008 e!154110)))

(declare-fun c!39566 () Bool)

(assert (=> d!59565 (= c!39566 (bvsge #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> d!59565 (and (bvsle #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5918 (_keys!6491 thiss!1504)) (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> d!59565 (= (arrayCountValidKeys!0 (_keys!6491 thiss!1504) #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))) lt!120008)))

(declare-fun b!237322 () Bool)

(assert (=> b!237322 (= e!154111 (bvadd #b00000000000000000000000000000001 call!22065))))

(declare-fun b!237323 () Bool)

(assert (=> b!237323 (= e!154110 #b00000000000000000000000000000000)))

(declare-fun bm!22062 () Bool)

(assert (=> bm!22062 (= call!22065 (arrayCountValidKeys!0 (_keys!6491 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5918 (_keys!6491 thiss!1504))))))

(assert (= (and d!59565 c!39566) b!237323))

(assert (= (and d!59565 (not c!39566)) b!237321))

(assert (= (and b!237321 c!39565) b!237322))

(assert (= (and b!237321 (not c!39565)) b!237320))

(assert (= (or b!237322 b!237320) bm!22062))

(assert (=> b!237321 m!257923))

(assert (=> b!237321 m!257923))

(assert (=> b!237321 m!257925))

(declare-fun m!258065 () Bool)

(assert (=> bm!22062 m!258065))

(assert (=> b!237209 d!59565))

(declare-fun b!237348 () Bool)

(declare-fun res!116325 () Bool)

(declare-fun e!154126 () Bool)

(assert (=> b!237348 (=> (not res!116325) (not e!154126))))

(declare-fun lt!120028 () ListLongMap!3573)

(assert (=> b!237348 (= res!116325 (not (contains!1684 lt!120028 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237349 () Bool)

(assert (=> b!237349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> b!237349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5917 (_values!4386 thiss!1504))))))

(declare-fun e!154128 () Bool)

(assert (=> b!237349 (= e!154128 (= (apply!216 lt!120028 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)) (get!2871 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237350 () Bool)

(declare-fun e!154127 () Bool)

(declare-fun e!154131 () Bool)

(assert (=> b!237350 (= e!154127 e!154131)))

(declare-fun c!39575 () Bool)

(assert (=> b!237350 (= c!39575 (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun b!237351 () Bool)

(declare-fun e!154130 () Bool)

(assert (=> b!237351 (= e!154130 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237351 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!237352 () Bool)

(declare-fun e!154132 () ListLongMap!3573)

(assert (=> b!237352 (= e!154132 (ListLongMap!3574 Nil!3559))))

(declare-fun b!237353 () Bool)

(assert (=> b!237353 (= e!154126 e!154127)))

(declare-fun c!39576 () Bool)

(assert (=> b!237353 (= c!39576 e!154130)))

(declare-fun res!116327 () Bool)

(assert (=> b!237353 (=> (not res!116327) (not e!154130))))

(assert (=> b!237353 (= res!116327 (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun b!237354 () Bool)

(declare-fun isEmpty!517 (ListLongMap!3573) Bool)

(assert (=> b!237354 (= e!154131 (isEmpty!517 lt!120028))))

(declare-fun b!237355 () Bool)

(assert (=> b!237355 (= e!154127 e!154128)))

(assert (=> b!237355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun res!116324 () Bool)

(assert (=> b!237355 (= res!116324 (contains!1684 lt!120028 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237355 (=> (not res!116324) (not e!154128))))

(declare-fun d!59567 () Bool)

(assert (=> d!59567 e!154126))

(declare-fun res!116326 () Bool)

(assert (=> d!59567 (=> (not res!116326) (not e!154126))))

(assert (=> d!59567 (= res!116326 (not (contains!1684 lt!120028 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59567 (= lt!120028 e!154132)))

(declare-fun c!39578 () Bool)

(assert (=> d!59567 (= c!39578 (bvsge #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> d!59567 (validMask!0 (mask!10408 thiss!1504))))

(assert (=> d!59567 (= (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)) lt!120028)))

(declare-fun b!237356 () Bool)

(declare-fun lt!120029 () Unit!7292)

(declare-fun lt!120025 () Unit!7292)

(assert (=> b!237356 (= lt!120029 lt!120025)))

(declare-fun lt!120026 () (_ BitVec 64))

(declare-fun lt!120027 () (_ BitVec 64))

(declare-fun lt!120023 () V!7963)

(declare-fun lt!120024 () ListLongMap!3573)

(assert (=> b!237356 (not (contains!1684 (+!643 lt!120024 (tuple2!4661 lt!120026 lt!120023)) lt!120027))))

(declare-fun addStillNotContains!117 (ListLongMap!3573 (_ BitVec 64) V!7963 (_ BitVec 64)) Unit!7292)

(assert (=> b!237356 (= lt!120025 (addStillNotContains!117 lt!120024 lt!120026 lt!120023 lt!120027))))

(assert (=> b!237356 (= lt!120027 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!237356 (= lt!120023 (get!2871 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237356 (= lt!120026 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!22068 () ListLongMap!3573)

(assert (=> b!237356 (= lt!120024 call!22068)))

(declare-fun e!154129 () ListLongMap!3573)

(assert (=> b!237356 (= e!154129 (+!643 call!22068 (tuple2!4661 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000) (get!2871 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!237357 () Bool)

(assert (=> b!237357 (= e!154129 call!22068)))

(declare-fun bm!22065 () Bool)

(assert (=> bm!22065 (= call!22068 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4403 thiss!1504)))))

(declare-fun b!237358 () Bool)

(assert (=> b!237358 (= e!154132 e!154129)))

(declare-fun c!39577 () Bool)

(assert (=> b!237358 (= c!39577 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237359 () Bool)

(assert (=> b!237359 (= e!154131 (= lt!120028 (getCurrentListMapNoExtraKeys!538 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4403 thiss!1504))))))

(assert (= (and d!59567 c!39578) b!237352))

(assert (= (and d!59567 (not c!39578)) b!237358))

(assert (= (and b!237358 c!39577) b!237356))

(assert (= (and b!237358 (not c!39577)) b!237357))

(assert (= (or b!237356 b!237357) bm!22065))

(assert (= (and d!59567 res!116326) b!237348))

(assert (= (and b!237348 res!116325) b!237353))

(assert (= (and b!237353 res!116327) b!237351))

(assert (= (and b!237353 c!39576) b!237355))

(assert (= (and b!237353 (not c!39576)) b!237350))

(assert (= (and b!237355 res!116324) b!237349))

(assert (= (and b!237350 c!39575) b!237359))

(assert (= (and b!237350 (not c!39575)) b!237354))

(declare-fun b_lambda!7947 () Bool)

(assert (=> (not b_lambda!7947) (not b!237349)))

(assert (=> b!237349 t!8550))

(declare-fun b_and!13329 () Bool)

(assert (= b_and!13327 (and (=> t!8550 result!5157) b_and!13329)))

(declare-fun b_lambda!7949 () Bool)

(assert (=> (not b_lambda!7949) (not b!237356)))

(assert (=> b!237356 t!8550))

(declare-fun b_and!13331 () Bool)

(assert (= b_and!13329 (and (=> t!8550 result!5157) b_and!13331)))

(assert (=> b!237351 m!257923))

(assert (=> b!237351 m!257923))

(assert (=> b!237351 m!257925))

(declare-fun m!258067 () Bool)

(assert (=> b!237348 m!258067))

(declare-fun m!258069 () Bool)

(assert (=> bm!22065 m!258069))

(assert (=> b!237356 m!257933))

(assert (=> b!237356 m!257933))

(assert (=> b!237356 m!257935))

(assert (=> b!237356 m!257937))

(assert (=> b!237356 m!257923))

(declare-fun m!258071 () Bool)

(assert (=> b!237356 m!258071))

(declare-fun m!258073 () Bool)

(assert (=> b!237356 m!258073))

(assert (=> b!237356 m!257935))

(declare-fun m!258075 () Bool)

(assert (=> b!237356 m!258075))

(assert (=> b!237356 m!258075))

(declare-fun m!258077 () Bool)

(assert (=> b!237356 m!258077))

(declare-fun m!258079 () Bool)

(assert (=> d!59567 m!258079))

(assert (=> d!59567 m!257889))

(assert (=> b!237355 m!257923))

(assert (=> b!237355 m!257923))

(declare-fun m!258081 () Bool)

(assert (=> b!237355 m!258081))

(assert (=> b!237349 m!257935))

(assert (=> b!237349 m!257923))

(declare-fun m!258083 () Bool)

(assert (=> b!237349 m!258083))

(assert (=> b!237349 m!257933))

(assert (=> b!237349 m!257933))

(assert (=> b!237349 m!257935))

(assert (=> b!237349 m!257937))

(assert (=> b!237349 m!257923))

(assert (=> b!237358 m!257923))

(assert (=> b!237358 m!257923))

(assert (=> b!237358 m!257925))

(assert (=> b!237359 m!258069))

(declare-fun m!258085 () Bool)

(assert (=> b!237354 m!258085))

(assert (=> bm!22053 d!59567))

(declare-fun bm!22068 () Bool)

(declare-fun call!22071 () Bool)

(assert (=> bm!22068 (= call!22071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(declare-fun b!237368 () Bool)

(declare-fun e!154140 () Bool)

(declare-fun e!154141 () Bool)

(assert (=> b!237368 (= e!154140 e!154141)))

(declare-fun c!39581 () Bool)

(assert (=> b!237368 (= c!39581 (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59569 () Bool)

(declare-fun res!116332 () Bool)

(assert (=> d!59569 (=> res!116332 e!154140)))

(assert (=> d!59569 (= res!116332 (bvsge #b00000000000000000000000000000000 (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> d!59569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)) e!154140)))

(declare-fun b!237369 () Bool)

(assert (=> b!237369 (= e!154141 call!22071)))

(declare-fun b!237370 () Bool)

(declare-fun e!154139 () Bool)

(assert (=> b!237370 (= e!154139 call!22071)))

(declare-fun b!237371 () Bool)

(assert (=> b!237371 (= e!154141 e!154139)))

(declare-fun lt!120037 () (_ BitVec 64))

(assert (=> b!237371 (= lt!120037 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120038 () Unit!7292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11745 (_ BitVec 64) (_ BitVec 32)) Unit!7292)

(assert (=> b!237371 (= lt!120038 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6491 thiss!1504) lt!120037 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237371 (arrayContainsKey!0 (_keys!6491 thiss!1504) lt!120037 #b00000000000000000000000000000000)))

(declare-fun lt!120036 () Unit!7292)

(assert (=> b!237371 (= lt!120036 lt!120038)))

(declare-fun res!116333 () Bool)

(assert (=> b!237371 (= res!116333 (= (seekEntryOrOpen!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000) (_keys!6491 thiss!1504) (mask!10408 thiss!1504)) (Found!1007 #b00000000000000000000000000000000)))))

(assert (=> b!237371 (=> (not res!116333) (not e!154139))))

(assert (= (and d!59569 (not res!116332)) b!237368))

(assert (= (and b!237368 c!39581) b!237371))

(assert (= (and b!237368 (not c!39581)) b!237369))

(assert (= (and b!237371 res!116333) b!237370))

(assert (= (or b!237370 b!237369) bm!22068))

(declare-fun m!258087 () Bool)

(assert (=> bm!22068 m!258087))

(assert (=> b!237368 m!257923))

(assert (=> b!237368 m!257923))

(assert (=> b!237368 m!257925))

(assert (=> b!237371 m!257923))

(declare-fun m!258089 () Bool)

(assert (=> b!237371 m!258089))

(declare-fun m!258091 () Bool)

(assert (=> b!237371 m!258091))

(assert (=> b!237371 m!257923))

(declare-fun m!258093 () Bool)

(assert (=> b!237371 m!258093))

(assert (=> b!237210 d!59569))

(declare-fun d!59571 () Bool)

(declare-fun get!2872 (Option!280) V!7963)

(assert (=> d!59571 (= (apply!216 lt!119946 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2872 (getValueByKey!274 (toList!1802 lt!119946) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8759 () Bool)

(assert (= bs!8759 d!59571))

(assert (=> bs!8759 m!258023))

(assert (=> bs!8759 m!258023))

(declare-fun m!258095 () Bool)

(assert (=> bs!8759 m!258095))

(assert (=> b!237189 d!59571))

(declare-fun d!59573 () Bool)

(declare-fun res!116338 () Bool)

(declare-fun e!154146 () Bool)

(assert (=> d!59573 (=> res!116338 e!154146)))

(assert (=> d!59573 (= res!116338 (and ((_ is Cons!3558) (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))) (= (_1!2341 (h!4212 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))))) key!932)))))

(assert (=> d!59573 (= (containsKey!266 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))) key!932) e!154146)))

(declare-fun b!237376 () Bool)

(declare-fun e!154147 () Bool)

(assert (=> b!237376 (= e!154146 e!154147)))

(declare-fun res!116339 () Bool)

(assert (=> b!237376 (=> (not res!116339) (not e!154147))))

(assert (=> b!237376 (= res!116339 (and (or (not ((_ is Cons!3558) (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))))) (bvsle (_1!2341 (h!4212 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))))) key!932)) ((_ is Cons!3558) (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))) (bvslt (_1!2341 (h!4212 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504))))) key!932)))))

(declare-fun b!237377 () Bool)

(assert (=> b!237377 (= e!154147 (containsKey!266 (t!8547 (toList!1802 (getCurrentListMap!1330 (_keys!6491 thiss!1504) (_values!4386 thiss!1504) (mask!10408 thiss!1504) (extraKeys!4140 thiss!1504) (zeroValue!4244 thiss!1504) (minValue!4244 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4403 thiss!1504)))) key!932))))

(assert (= (and d!59573 (not res!116338)) b!237376))

(assert (= (and b!237376 res!116339) b!237377))

(declare-fun m!258097 () Bool)

(assert (=> b!237377 m!258097))

(assert (=> d!59531 d!59573))

(declare-fun d!59575 () Bool)

(declare-fun e!154149 () Bool)

(assert (=> d!59575 e!154149))

(declare-fun res!116340 () Bool)

(assert (=> d!59575 (=> res!116340 e!154149)))

(declare-fun lt!120040 () Bool)

(assert (=> d!59575 (= res!116340 (not lt!120040))))

(declare-fun lt!120039 () Bool)

(assert (=> d!59575 (= lt!120040 lt!120039)))

(declare-fun lt!120041 () Unit!7292)

(declare-fun e!154148 () Unit!7292)

(assert (=> d!59575 (= lt!120041 e!154148)))

(declare-fun c!39582 () Bool)

(assert (=> d!59575 (= c!39582 lt!120039)))

(assert (=> d!59575 (= lt!120039 (containsKey!266 (toList!1802 lt!119946) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59575 (= (contains!1684 lt!119946 #b0000000000000000000000000000000000000000000000000000000000000000) lt!120040)))

(declare-fun b!237378 () Bool)

(declare-fun lt!120042 () Unit!7292)

(assert (=> b!237378 (= e!154148 lt!120042)))

(assert (=> b!237378 (= lt!120042 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1802 lt!119946) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237378 (isDefined!215 (getValueByKey!274 (toList!1802 lt!119946) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237379 () Bool)

(declare-fun Unit!7298 () Unit!7292)

(assert (=> b!237379 (= e!154148 Unit!7298)))

(declare-fun b!237380 () Bool)

(assert (=> b!237380 (= e!154149 (isDefined!215 (getValueByKey!274 (toList!1802 lt!119946) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59575 c!39582) b!237378))

(assert (= (and d!59575 (not c!39582)) b!237379))

(assert (= (and d!59575 (not res!116340)) b!237380))

(declare-fun m!258099 () Bool)

(assert (=> d!59575 m!258099))

(declare-fun m!258101 () Bool)

(assert (=> b!237378 m!258101))

(declare-fun m!258103 () Bool)

(assert (=> b!237378 m!258103))

(assert (=> b!237378 m!258103))

(declare-fun m!258105 () Bool)

(assert (=> b!237378 m!258105))

(assert (=> b!237380 m!258103))

(assert (=> b!237380 m!258103))

(assert (=> b!237380 m!258105))

(assert (=> bm!22050 d!59575))

(declare-fun b!237399 () Bool)

(declare-fun e!154160 () SeekEntryResult!1007)

(assert (=> b!237399 (= e!154160 (Intermediate!1007 true (toIndex!0 key!932 (mask!10408 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237400 () Bool)

(declare-fun lt!120048 () SeekEntryResult!1007)

(assert (=> b!237400 (and (bvsge (index!6200 lt!120048) #b00000000000000000000000000000000) (bvslt (index!6200 lt!120048) (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun res!116347 () Bool)

(assert (=> b!237400 (= res!116347 (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6200 lt!120048)) key!932))))

(declare-fun e!154162 () Bool)

(assert (=> b!237400 (=> res!116347 e!154162)))

(declare-fun e!154161 () Bool)

(assert (=> b!237400 (= e!154161 e!154162)))

(declare-fun b!237401 () Bool)

(declare-fun e!154164 () SeekEntryResult!1007)

(assert (=> b!237401 (= e!154164 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10408 thiss!1504)) #b00000000000000000000000000000000 (mask!10408 thiss!1504)) key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)))))

(declare-fun b!237402 () Bool)

(assert (=> b!237402 (= e!154164 (Intermediate!1007 false (toIndex!0 key!932 (mask!10408 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237404 () Bool)

(assert (=> b!237404 (and (bvsge (index!6200 lt!120048) #b00000000000000000000000000000000) (bvslt (index!6200 lt!120048) (size!5918 (_keys!6491 thiss!1504))))))

(assert (=> b!237404 (= e!154162 (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6200 lt!120048)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237405 () Bool)

(assert (=> b!237405 (and (bvsge (index!6200 lt!120048) #b00000000000000000000000000000000) (bvslt (index!6200 lt!120048) (size!5918 (_keys!6491 thiss!1504))))))

(declare-fun res!116348 () Bool)

(assert (=> b!237405 (= res!116348 (= (select (arr!5579 (_keys!6491 thiss!1504)) (index!6200 lt!120048)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237405 (=> res!116348 e!154162)))

(declare-fun d!59577 () Bool)

(declare-fun e!154163 () Bool)

(assert (=> d!59577 e!154163))

(declare-fun c!39589 () Bool)

(assert (=> d!59577 (= c!39589 (and ((_ is Intermediate!1007) lt!120048) (undefined!1819 lt!120048)))))

(assert (=> d!59577 (= lt!120048 e!154160)))

(declare-fun c!39591 () Bool)

(assert (=> d!59577 (= c!39591 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!120047 () (_ BitVec 64))

(assert (=> d!59577 (= lt!120047 (select (arr!5579 (_keys!6491 thiss!1504)) (toIndex!0 key!932 (mask!10408 thiss!1504))))))

(assert (=> d!59577 (validMask!0 (mask!10408 thiss!1504))))

(assert (=> d!59577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10408 thiss!1504)) key!932 (_keys!6491 thiss!1504) (mask!10408 thiss!1504)) lt!120048)))

(declare-fun b!237403 () Bool)

(assert (=> b!237403 (= e!154163 e!154161)))

(declare-fun res!116349 () Bool)

(assert (=> b!237403 (= res!116349 (and ((_ is Intermediate!1007) lt!120048) (not (undefined!1819 lt!120048)) (bvslt (x!23933 lt!120048) #b01111111111111111111111111111110) (bvsge (x!23933 lt!120048) #b00000000000000000000000000000000) (bvsge (x!23933 lt!120048) #b00000000000000000000000000000000)))))

(assert (=> b!237403 (=> (not res!116349) (not e!154161))))

(declare-fun b!237406 () Bool)

(assert (=> b!237406 (= e!154163 (bvsge (x!23933 lt!120048) #b01111111111111111111111111111110))))

(declare-fun b!237407 () Bool)

(assert (=> b!237407 (= e!154160 e!154164)))

(declare-fun c!39590 () Bool)

(assert (=> b!237407 (= c!39590 (or (= lt!120047 key!932) (= (bvadd lt!120047 lt!120047) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59577 c!39591) b!237399))

(assert (= (and d!59577 (not c!39591)) b!237407))

(assert (= (and b!237407 c!39590) b!237402))

(assert (= (and b!237407 (not c!39590)) b!237401))

(assert (= (and d!59577 c!39589) b!237406))

(assert (= (and d!59577 (not c!39589)) b!237403))

(assert (= (and b!237403 res!116349) b!237400))

(assert (= (and b!237400 (not res!116347)) b!237405))

(assert (= (and b!237405 (not res!116348)) b!237404))

(declare-fun m!258107 () Bool)

(assert (=> b!237400 m!258107))

(assert (=> b!237401 m!257991))

(declare-fun m!258109 () Bool)

(assert (=> b!237401 m!258109))

(assert (=> b!237401 m!258109))

(declare-fun m!258111 () Bool)

(assert (=> b!237401 m!258111))

(assert (=> b!237404 m!258107))

(assert (=> b!237405 m!258107))

(assert (=> d!59577 m!257991))

(declare-fun m!258113 () Bool)

(assert (=> d!59577 m!258113))

(assert (=> d!59577 m!257889))

(assert (=> d!59543 d!59577))

(declare-fun d!59579 () Bool)

(declare-fun lt!120054 () (_ BitVec 32))

(declare-fun lt!120053 () (_ BitVec 32))

(assert (=> d!59579 (= lt!120054 (bvmul (bvxor lt!120053 (bvlshr lt!120053 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59579 (= lt!120053 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59579 (and (bvsge (mask!10408 thiss!1504) #b00000000000000000000000000000000) (let ((res!116350 (let ((h!4215 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23952 (bvmul (bvxor h!4215 (bvlshr h!4215 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23952 (bvlshr x!23952 #b00000000000000000000000000001101)) (mask!10408 thiss!1504)))))) (and (bvslt res!116350 (bvadd (mask!10408 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116350 #b00000000000000000000000000000000))))))

(assert (=> d!59579 (= (toIndex!0 key!932 (mask!10408 thiss!1504)) (bvand (bvxor lt!120054 (bvlshr lt!120054 #b00000000000000000000000000001101)) (mask!10408 thiss!1504)))))

(assert (=> d!59543 d!59579))

(assert (=> d!59543 d!59535))

(declare-fun d!59581 () Bool)

(assert (=> d!59581 (= (apply!216 lt!119946 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2872 (getValueByKey!274 (toList!1802 lt!119946) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8760 () Bool)

(assert (= bs!8760 d!59581))

(assert (=> bs!8760 m!258103))

(assert (=> bs!8760 m!258103))

(declare-fun m!258115 () Bool)

(assert (=> bs!8760 m!258115))

(assert (=> b!237199 d!59581))

(declare-fun d!59583 () Bool)

(assert (=> d!59583 (= (apply!216 (+!643 lt!119949 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))) lt!119953) (apply!216 lt!119949 lt!119953))))

(declare-fun lt!120057 () Unit!7292)

(declare-fun choose!1111 (ListLongMap!3573 (_ BitVec 64) V!7963 (_ BitVec 64)) Unit!7292)

(assert (=> d!59583 (= lt!120057 (choose!1111 lt!119949 lt!119962 (minValue!4244 thiss!1504) lt!119953))))

(declare-fun e!154167 () Bool)

(assert (=> d!59583 e!154167))

(declare-fun res!116353 () Bool)

(assert (=> d!59583 (=> (not res!116353) (not e!154167))))

(assert (=> d!59583 (= res!116353 (contains!1684 lt!119949 lt!119953))))

(assert (=> d!59583 (= (addApplyDifferent!192 lt!119949 lt!119962 (minValue!4244 thiss!1504) lt!119953) lt!120057)))

(declare-fun b!237411 () Bool)

(assert (=> b!237411 (= e!154167 (not (= lt!119953 lt!119962)))))

(assert (= (and d!59583 res!116353) b!237411))

(declare-fun m!258117 () Bool)

(assert (=> d!59583 m!258117))

(assert (=> d!59583 m!257949))

(declare-fun m!258119 () Bool)

(assert (=> d!59583 m!258119))

(assert (=> d!59583 m!257951))

(assert (=> d!59583 m!257953))

(assert (=> d!59583 m!257951))

(assert (=> b!237186 d!59583))

(declare-fun d!59585 () Bool)

(declare-fun e!154169 () Bool)

(assert (=> d!59585 e!154169))

(declare-fun res!116354 () Bool)

(assert (=> d!59585 (=> res!116354 e!154169)))

(declare-fun lt!120059 () Bool)

(assert (=> d!59585 (= res!116354 (not lt!120059))))

(declare-fun lt!120058 () Bool)

(assert (=> d!59585 (= lt!120059 lt!120058)))

(declare-fun lt!120060 () Unit!7292)

(declare-fun e!154168 () Unit!7292)

(assert (=> d!59585 (= lt!120060 e!154168)))

(declare-fun c!39592 () Bool)

(assert (=> d!59585 (= c!39592 lt!120058)))

(assert (=> d!59585 (= lt!120058 (containsKey!266 (toList!1802 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))) lt!119954))))

(assert (=> d!59585 (= (contains!1684 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))) lt!119954) lt!120059)))

(declare-fun b!237412 () Bool)

(declare-fun lt!120061 () Unit!7292)

(assert (=> b!237412 (= e!154168 lt!120061)))

(assert (=> b!237412 (= lt!120061 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1802 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))) lt!119954))))

(assert (=> b!237412 (isDefined!215 (getValueByKey!274 (toList!1802 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))) lt!119954))))

(declare-fun b!237413 () Bool)

(declare-fun Unit!7299 () Unit!7292)

(assert (=> b!237413 (= e!154168 Unit!7299)))

(declare-fun b!237414 () Bool)

(assert (=> b!237414 (= e!154169 (isDefined!215 (getValueByKey!274 (toList!1802 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))) lt!119954)))))

(assert (= (and d!59585 c!39592) b!237412))

(assert (= (and d!59585 (not c!39592)) b!237413))

(assert (= (and d!59585 (not res!116354)) b!237414))

(declare-fun m!258121 () Bool)

(assert (=> d!59585 m!258121))

(declare-fun m!258123 () Bool)

(assert (=> b!237412 m!258123))

(declare-fun m!258125 () Bool)

(assert (=> b!237412 m!258125))

(assert (=> b!237412 m!258125))

(declare-fun m!258127 () Bool)

(assert (=> b!237412 m!258127))

(assert (=> b!237414 m!258125))

(assert (=> b!237414 m!258125))

(assert (=> b!237414 m!258127))

(assert (=> b!237186 d!59585))

(declare-fun d!59587 () Bool)

(assert (=> d!59587 (= (apply!216 (+!643 lt!119958 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))) lt!119952) (get!2872 (getValueByKey!274 (toList!1802 (+!643 lt!119958 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))) lt!119952)))))

(declare-fun bs!8761 () Bool)

(assert (= bs!8761 d!59587))

(declare-fun m!258129 () Bool)

(assert (=> bs!8761 m!258129))

(assert (=> bs!8761 m!258129))

(declare-fun m!258131 () Bool)

(assert (=> bs!8761 m!258131))

(assert (=> b!237186 d!59587))

(declare-fun d!59589 () Bool)

(assert (=> d!59589 (contains!1684 (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))) lt!119954)))

(declare-fun lt!120064 () Unit!7292)

(declare-fun choose!1112 (ListLongMap!3573 (_ BitVec 64) V!7963 (_ BitVec 64)) Unit!7292)

(assert (=> d!59589 (= lt!120064 (choose!1112 lt!119947 lt!119963 (zeroValue!4244 thiss!1504) lt!119954))))

(assert (=> d!59589 (contains!1684 lt!119947 lt!119954)))

(assert (=> d!59589 (= (addStillContains!192 lt!119947 lt!119963 (zeroValue!4244 thiss!1504) lt!119954) lt!120064)))

(declare-fun bs!8762 () Bool)

(assert (= bs!8762 d!59589))

(assert (=> bs!8762 m!257959))

(assert (=> bs!8762 m!257959))

(assert (=> bs!8762 m!257963))

(declare-fun m!258133 () Bool)

(assert (=> bs!8762 m!258133))

(declare-fun m!258135 () Bool)

(assert (=> bs!8762 m!258135))

(assert (=> b!237186 d!59589))

(declare-fun d!59591 () Bool)

(declare-fun e!154170 () Bool)

(assert (=> d!59591 e!154170))

(declare-fun res!116356 () Bool)

(assert (=> d!59591 (=> (not res!116356) (not e!154170))))

(declare-fun lt!120068 () ListLongMap!3573)

(assert (=> d!59591 (= res!116356 (contains!1684 lt!120068 (_1!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))))))

(declare-fun lt!120065 () List!3562)

(assert (=> d!59591 (= lt!120068 (ListLongMap!3574 lt!120065))))

(declare-fun lt!120066 () Unit!7292)

(declare-fun lt!120067 () Unit!7292)

(assert (=> d!59591 (= lt!120066 lt!120067)))

(assert (=> d!59591 (= (getValueByKey!274 lt!120065 (_1!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))))))

(assert (=> d!59591 (= lt!120067 (lemmaContainsTupThenGetReturnValue!153 lt!120065 (_1!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))))))

(assert (=> d!59591 (= lt!120065 (insertStrictlySorted!156 (toList!1802 lt!119947) (_1!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))))))

(assert (=> d!59591 (= (+!643 lt!119947 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))) lt!120068)))

(declare-fun b!237416 () Bool)

(declare-fun res!116355 () Bool)

(assert (=> b!237416 (=> (not res!116355) (not e!154170))))

(assert (=> b!237416 (= res!116355 (= (getValueByKey!274 (toList!1802 lt!120068) (_1!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))))))))

(declare-fun b!237417 () Bool)

(assert (=> b!237417 (= e!154170 (contains!1687 (toList!1802 lt!120068) (tuple2!4661 lt!119963 (zeroValue!4244 thiss!1504))))))

(assert (= (and d!59591 res!116356) b!237416))

(assert (= (and b!237416 res!116355) b!237417))

(declare-fun m!258137 () Bool)

(assert (=> d!59591 m!258137))

(declare-fun m!258139 () Bool)

(assert (=> d!59591 m!258139))

(declare-fun m!258141 () Bool)

(assert (=> d!59591 m!258141))

(declare-fun m!258143 () Bool)

(assert (=> d!59591 m!258143))

(declare-fun m!258145 () Bool)

(assert (=> b!237416 m!258145))

(declare-fun m!258147 () Bool)

(assert (=> b!237417 m!258147))

(assert (=> b!237186 d!59591))

(declare-fun d!59593 () Bool)

(assert (=> d!59593 (= (apply!216 (+!643 lt!119956 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))) lt!119943) (apply!216 lt!119956 lt!119943))))

(declare-fun lt!120069 () Unit!7292)

(assert (=> d!59593 (= lt!120069 (choose!1111 lt!119956 lt!119944 (zeroValue!4244 thiss!1504) lt!119943))))

(declare-fun e!154171 () Bool)

(assert (=> d!59593 e!154171))

(declare-fun res!116357 () Bool)

(assert (=> d!59593 (=> (not res!116357) (not e!154171))))

(assert (=> d!59593 (= res!116357 (contains!1684 lt!119956 lt!119943))))

(assert (=> d!59593 (= (addApplyDifferent!192 lt!119956 lt!119944 (zeroValue!4244 thiss!1504) lt!119943) lt!120069)))

(declare-fun b!237418 () Bool)

(assert (=> b!237418 (= e!154171 (not (= lt!119943 lt!119944)))))

(assert (= (and d!59593 res!116357) b!237418))

(declare-fun m!258149 () Bool)

(assert (=> d!59593 m!258149))

(assert (=> d!59593 m!257955))

(declare-fun m!258151 () Bool)

(assert (=> d!59593 m!258151))

(assert (=> d!59593 m!257947))

(assert (=> d!59593 m!257967))

(assert (=> d!59593 m!257947))

(assert (=> b!237186 d!59593))

(assert (=> b!237186 d!59567))

(declare-fun d!59595 () Bool)

(assert (=> d!59595 (= (apply!216 lt!119949 lt!119953) (get!2872 (getValueByKey!274 (toList!1802 lt!119949) lt!119953)))))

(declare-fun bs!8763 () Bool)

(assert (= bs!8763 d!59595))

(declare-fun m!258153 () Bool)

(assert (=> bs!8763 m!258153))

(assert (=> bs!8763 m!258153))

(declare-fun m!258155 () Bool)

(assert (=> bs!8763 m!258155))

(assert (=> b!237186 d!59595))

(declare-fun d!59597 () Bool)

(declare-fun e!154172 () Bool)

(assert (=> d!59597 e!154172))

(declare-fun res!116359 () Bool)

(assert (=> d!59597 (=> (not res!116359) (not e!154172))))

(declare-fun lt!120073 () ListLongMap!3573)

(assert (=> d!59597 (= res!116359 (contains!1684 lt!120073 (_1!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))))))

(declare-fun lt!120070 () List!3562)

(assert (=> d!59597 (= lt!120073 (ListLongMap!3574 lt!120070))))

(declare-fun lt!120071 () Unit!7292)

(declare-fun lt!120072 () Unit!7292)

(assert (=> d!59597 (= lt!120071 lt!120072)))

(assert (=> d!59597 (= (getValueByKey!274 lt!120070 (_1!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))))))

(assert (=> d!59597 (= lt!120072 (lemmaContainsTupThenGetReturnValue!153 lt!120070 (_1!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))))))

(assert (=> d!59597 (= lt!120070 (insertStrictlySorted!156 (toList!1802 lt!119956) (_1!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))))))

(assert (=> d!59597 (= (+!643 lt!119956 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))) lt!120073)))

(declare-fun b!237419 () Bool)

(declare-fun res!116358 () Bool)

(assert (=> b!237419 (=> (not res!116358) (not e!154172))))

(assert (=> b!237419 (= res!116358 (= (getValueByKey!274 (toList!1802 lt!120073) (_1!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))))))))

(declare-fun b!237420 () Bool)

(assert (=> b!237420 (= e!154172 (contains!1687 (toList!1802 lt!120073) (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))))))

(assert (= (and d!59597 res!116359) b!237419))

(assert (= (and b!237419 res!116358) b!237420))

(declare-fun m!258157 () Bool)

(assert (=> d!59597 m!258157))

(declare-fun m!258159 () Bool)

(assert (=> d!59597 m!258159))

(declare-fun m!258161 () Bool)

(assert (=> d!59597 m!258161))

(declare-fun m!258163 () Bool)

(assert (=> d!59597 m!258163))

(declare-fun m!258165 () Bool)

(assert (=> b!237419 m!258165))

(declare-fun m!258167 () Bool)

(assert (=> b!237420 m!258167))

(assert (=> b!237186 d!59597))

(declare-fun d!59599 () Bool)

(assert (=> d!59599 (= (apply!216 lt!119958 lt!119952) (get!2872 (getValueByKey!274 (toList!1802 lt!119958) lt!119952)))))

(declare-fun bs!8764 () Bool)

(assert (= bs!8764 d!59599))

(declare-fun m!258169 () Bool)

(assert (=> bs!8764 m!258169))

(assert (=> bs!8764 m!258169))

(declare-fun m!258171 () Bool)

(assert (=> bs!8764 m!258171))

(assert (=> b!237186 d!59599))

(declare-fun d!59601 () Bool)

(assert (=> d!59601 (= (apply!216 (+!643 lt!119956 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504))) lt!119943) (get!2872 (getValueByKey!274 (toList!1802 (+!643 lt!119956 (tuple2!4661 lt!119944 (zeroValue!4244 thiss!1504)))) lt!119943)))))

(declare-fun bs!8765 () Bool)

(assert (= bs!8765 d!59601))

(declare-fun m!258173 () Bool)

(assert (=> bs!8765 m!258173))

(assert (=> bs!8765 m!258173))

(declare-fun m!258175 () Bool)

(assert (=> bs!8765 m!258175))

(assert (=> b!237186 d!59601))

(declare-fun d!59603 () Bool)

(declare-fun e!154173 () Bool)

(assert (=> d!59603 e!154173))

(declare-fun res!116361 () Bool)

(assert (=> d!59603 (=> (not res!116361) (not e!154173))))

(declare-fun lt!120077 () ListLongMap!3573)

(assert (=> d!59603 (= res!116361 (contains!1684 lt!120077 (_1!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))))))

(declare-fun lt!120074 () List!3562)

(assert (=> d!59603 (= lt!120077 (ListLongMap!3574 lt!120074))))

(declare-fun lt!120075 () Unit!7292)

(declare-fun lt!120076 () Unit!7292)

(assert (=> d!59603 (= lt!120075 lt!120076)))

(assert (=> d!59603 (= (getValueByKey!274 lt!120074 (_1!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))))))

(assert (=> d!59603 (= lt!120076 (lemmaContainsTupThenGetReturnValue!153 lt!120074 (_1!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))))))

(assert (=> d!59603 (= lt!120074 (insertStrictlySorted!156 (toList!1802 lt!119958) (_1!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))))))

(assert (=> d!59603 (= (+!643 lt!119958 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))) lt!120077)))

(declare-fun b!237421 () Bool)

(declare-fun res!116360 () Bool)

(assert (=> b!237421 (=> (not res!116360) (not e!154173))))

(assert (=> b!237421 (= res!116360 (= (getValueByKey!274 (toList!1802 lt!120077) (_1!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))))))))

(declare-fun b!237422 () Bool)

(assert (=> b!237422 (= e!154173 (contains!1687 (toList!1802 lt!120077) (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))))))

(assert (= (and d!59603 res!116361) b!237421))

(assert (= (and b!237421 res!116360) b!237422))

(declare-fun m!258177 () Bool)

(assert (=> d!59603 m!258177))

(declare-fun m!258179 () Bool)

(assert (=> d!59603 m!258179))

(declare-fun m!258181 () Bool)

(assert (=> d!59603 m!258181))

(declare-fun m!258183 () Bool)

(assert (=> d!59603 m!258183))

(declare-fun m!258185 () Bool)

(assert (=> b!237421 m!258185))

(declare-fun m!258187 () Bool)

(assert (=> b!237422 m!258187))

(assert (=> b!237186 d!59603))

(declare-fun d!59605 () Bool)

(assert (=> d!59605 (= (apply!216 lt!119956 lt!119943) (get!2872 (getValueByKey!274 (toList!1802 lt!119956) lt!119943)))))

(declare-fun bs!8766 () Bool)

(assert (= bs!8766 d!59605))

(declare-fun m!258189 () Bool)

(assert (=> bs!8766 m!258189))

(assert (=> bs!8766 m!258189))

(declare-fun m!258191 () Bool)

(assert (=> bs!8766 m!258191))

(assert (=> b!237186 d!59605))

(declare-fun d!59607 () Bool)

(declare-fun e!154174 () Bool)

(assert (=> d!59607 e!154174))

(declare-fun res!116363 () Bool)

(assert (=> d!59607 (=> (not res!116363) (not e!154174))))

(declare-fun lt!120081 () ListLongMap!3573)

(assert (=> d!59607 (= res!116363 (contains!1684 lt!120081 (_1!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))))))

(declare-fun lt!120078 () List!3562)

(assert (=> d!59607 (= lt!120081 (ListLongMap!3574 lt!120078))))

(declare-fun lt!120079 () Unit!7292)

(declare-fun lt!120080 () Unit!7292)

(assert (=> d!59607 (= lt!120079 lt!120080)))

(assert (=> d!59607 (= (getValueByKey!274 lt!120078 (_1!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))))))

(assert (=> d!59607 (= lt!120080 (lemmaContainsTupThenGetReturnValue!153 lt!120078 (_1!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))))))

(assert (=> d!59607 (= lt!120078 (insertStrictlySorted!156 (toList!1802 lt!119949) (_1!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))) (_2!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))))))

(assert (=> d!59607 (= (+!643 lt!119949 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))) lt!120081)))

(declare-fun b!237423 () Bool)

(declare-fun res!116362 () Bool)

(assert (=> b!237423 (=> (not res!116362) (not e!154174))))

(assert (=> b!237423 (= res!116362 (= (getValueByKey!274 (toList!1802 lt!120081) (_1!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))) (Some!279 (_2!2341 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))))))))

(declare-fun b!237424 () Bool)

(assert (=> b!237424 (= e!154174 (contains!1687 (toList!1802 lt!120081) (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))))))

(assert (= (and d!59607 res!116363) b!237423))

(assert (= (and b!237423 res!116362) b!237424))

(declare-fun m!258193 () Bool)

(assert (=> d!59607 m!258193))

(declare-fun m!258195 () Bool)

(assert (=> d!59607 m!258195))

(declare-fun m!258197 () Bool)

(assert (=> d!59607 m!258197))

(declare-fun m!258199 () Bool)

(assert (=> d!59607 m!258199))

(declare-fun m!258201 () Bool)

(assert (=> b!237423 m!258201))

(declare-fun m!258203 () Bool)

(assert (=> b!237424 m!258203))

(assert (=> b!237186 d!59607))

(declare-fun d!59609 () Bool)

(assert (=> d!59609 (= (apply!216 (+!643 lt!119949 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504))) lt!119953) (get!2872 (getValueByKey!274 (toList!1802 (+!643 lt!119949 (tuple2!4661 lt!119962 (minValue!4244 thiss!1504)))) lt!119953)))))

(declare-fun bs!8767 () Bool)

(assert (= bs!8767 d!59609))

(declare-fun m!258205 () Bool)

(assert (=> bs!8767 m!258205))

(assert (=> bs!8767 m!258205))

(declare-fun m!258207 () Bool)

(assert (=> bs!8767 m!258207))

(assert (=> b!237186 d!59609))

(declare-fun d!59611 () Bool)

(assert (=> d!59611 (= (apply!216 (+!643 lt!119958 (tuple2!4661 lt!119948 (minValue!4244 thiss!1504))) lt!119952) (apply!216 lt!119958 lt!119952))))

(declare-fun lt!120082 () Unit!7292)

(assert (=> d!59611 (= lt!120082 (choose!1111 lt!119958 lt!119948 (minValue!4244 thiss!1504) lt!119952))))

(declare-fun e!154175 () Bool)

(assert (=> d!59611 e!154175))

(declare-fun res!116364 () Bool)

(assert (=> d!59611 (=> (not res!116364) (not e!154175))))

(assert (=> d!59611 (= res!116364 (contains!1684 lt!119958 lt!119952))))

(assert (=> d!59611 (= (addApplyDifferent!192 lt!119958 lt!119948 (minValue!4244 thiss!1504) lt!119952) lt!120082)))

(declare-fun b!237425 () Bool)

(assert (=> b!237425 (= e!154175 (not (= lt!119952 lt!119948)))))

(assert (= (and d!59611 res!116364) b!237425))

(declare-fun m!258209 () Bool)

(assert (=> d!59611 m!258209))

(assert (=> d!59611 m!257973))

(declare-fun m!258211 () Bool)

(assert (=> d!59611 m!258211))

(assert (=> d!59611 m!257957))

(assert (=> d!59611 m!257965))

(assert (=> d!59611 m!257957))

(assert (=> b!237186 d!59611))

(declare-fun d!59613 () Bool)

(assert (=> d!59613 (= (apply!216 lt!119946 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)) (get!2872 (getValueByKey!274 (toList!1802 lt!119946) (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8768 () Bool)

(assert (= bs!8768 d!59613))

(assert (=> bs!8768 m!257923))

(assert (=> bs!8768 m!258015))

(assert (=> bs!8768 m!258015))

(declare-fun m!258213 () Bool)

(assert (=> bs!8768 m!258213))

(assert (=> b!237187 d!59613))

(declare-fun d!59615 () Bool)

(declare-fun c!39595 () Bool)

(assert (=> d!59615 (= c!39595 ((_ is ValueCellFull!2775) (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!154178 () V!7963)

(assert (=> d!59615 (= (get!2871 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!154178)))

(declare-fun b!237430 () Bool)

(declare-fun get!2873 (ValueCell!2775 V!7963) V!7963)

(assert (=> b!237430 (= e!154178 (get!2873 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237431 () Bool)

(declare-fun get!2874 (ValueCell!2775 V!7963) V!7963)

(assert (=> b!237431 (= e!154178 (get!2874 (select (arr!5578 (_values!4386 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4403 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59615 c!39595) b!237430))

(assert (= (and d!59615 (not c!39595)) b!237431))

(assert (=> b!237430 m!257933))

(assert (=> b!237430 m!257935))

(declare-fun m!258215 () Bool)

(assert (=> b!237430 m!258215))

(assert (=> b!237431 m!257933))

(assert (=> b!237431 m!257935))

(declare-fun m!258217 () Bool)

(assert (=> b!237431 m!258217))

(assert (=> b!237187 d!59615))

(declare-fun d!59617 () Bool)

(assert (=> d!59617 (= (validKeyInArray!0 (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5579 (_keys!6491 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237188 d!59617))

(assert (=> b!237180 d!59617))

(declare-fun b!237432 () Bool)

(declare-fun e!154180 () Bool)

(assert (=> b!237432 (= e!154180 tp_is_empty!6237)))

(declare-fun condMapEmpty!10577 () Bool)

(declare-fun mapDefault!10577 () ValueCell!2775)

(assert (=> mapNonEmpty!10576 (= condMapEmpty!10577 (= mapRest!10576 ((as const (Array (_ BitVec 32) ValueCell!2775)) mapDefault!10577)))))

(declare-fun e!154179 () Bool)

(declare-fun mapRes!10577 () Bool)

(assert (=> mapNonEmpty!10576 (= tp!22321 (and e!154179 mapRes!10577))))

(declare-fun mapIsEmpty!10577 () Bool)

(assert (=> mapIsEmpty!10577 mapRes!10577))

(declare-fun mapNonEmpty!10577 () Bool)

(declare-fun tp!22322 () Bool)

(assert (=> mapNonEmpty!10577 (= mapRes!10577 (and tp!22322 e!154180))))

(declare-fun mapValue!10577 () ValueCell!2775)

(declare-fun mapRest!10577 () (Array (_ BitVec 32) ValueCell!2775))

(declare-fun mapKey!10577 () (_ BitVec 32))

(assert (=> mapNonEmpty!10577 (= mapRest!10576 (store mapRest!10577 mapKey!10577 mapValue!10577))))

(declare-fun b!237433 () Bool)

(assert (=> b!237433 (= e!154179 tp_is_empty!6237)))

(assert (= (and mapNonEmpty!10576 condMapEmpty!10577) mapIsEmpty!10577))

(assert (= (and mapNonEmpty!10576 (not condMapEmpty!10577)) mapNonEmpty!10577))

(assert (= (and mapNonEmpty!10577 ((_ is ValueCellFull!2775) mapValue!10577)) b!237432))

(assert (= (and mapNonEmpty!10576 ((_ is ValueCellFull!2775) mapDefault!10577)) b!237433))

(declare-fun m!258219 () Bool)

(assert (=> mapNonEmpty!10577 m!258219))

(declare-fun b_lambda!7951 () Bool)

(assert (= b_lambda!7947 (or (and b!237099 b_free!6375) b_lambda!7951)))

(declare-fun b_lambda!7953 () Bool)

(assert (= b_lambda!7949 (or (and b!237099 b_free!6375) b_lambda!7953)))

(check-sat (not d!59595) (not b!237349) (not b!237354) (not b!237292) (not b!237417) (not d!59603) (not b!237280) (not b!237430) (not bm!22068) (not b!237423) (not d!59553) (not d!59589) (not b!237279) (not b!237416) (not d!59583) tp_is_empty!6237 (not d!59571) (not bm!22059) (not b!237348) (not b_lambda!7951) (not d!59585) (not b!237414) (not b!237421) (not b_next!6375) (not b!237256) (not b!237368) (not b!237420) (not b!237419) (not b!237356) (not b!237255) (not d!59547) (not b!237253) (not bm!22065) (not d!59551) (not b!237359) (not b!237281) (not mapNonEmpty!10577) (not d!59581) (not d!59557) (not b!237380) (not d!59613) (not b!237309) (not b!237424) (not b!237371) (not d!59545) (not b!237422) (not b!237351) (not b!237321) (not b!237355) (not b!237431) (not b!237412) (not d!59587) (not b!237273) (not d!59597) (not d!59559) (not d!59611) (not d!59607) (not d!59605) (not b!237377) (not b!237291) (not d!59563) (not b!237278) (not d!59575) (not d!59593) (not d!59599) (not d!59591) (not bm!22062) (not b_lambda!7953) (not b!237378) (not d!59567) (not b!237272) (not b!237258) (not d!59601) (not b!237358) (not b_lambda!7945) (not d!59609) (not d!59561) (not b!237240) (not b!237401) (not b!237251) (not b!237270) b_and!13331 (not d!59577))
(check-sat b_and!13331 (not b_next!6375))
