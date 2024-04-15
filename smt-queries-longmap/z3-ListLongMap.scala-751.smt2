; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17592 () Bool)

(assert start!17592)

(declare-fun b!175846 () Bool)

(declare-fun b_free!4345 () Bool)

(declare-fun b_next!4345 () Bool)

(assert (=> b!175846 (= b_free!4345 (not b_next!4345))))

(declare-fun tp!15722 () Bool)

(declare-fun b_and!10807 () Bool)

(assert (=> b!175846 (= tp!15722 b_and!10807)))

(declare-fun b!175840 () Bool)

(declare-fun e!116033 () Bool)

(declare-fun tp_is_empty!4117 () Bool)

(assert (=> b!175840 (= e!116033 tp_is_empty!4117)))

(declare-fun mapIsEmpty!7025 () Bool)

(declare-fun mapRes!7025 () Bool)

(assert (=> mapIsEmpty!7025 mapRes!7025))

(declare-fun b!175841 () Bool)

(declare-fun e!116035 () Bool)

(declare-fun e!116034 () Bool)

(assert (=> b!175841 (= e!116035 (and e!116034 mapRes!7025))))

(declare-fun condMapEmpty!7025 () Bool)

(declare-datatypes ((V!5137 0))(
  ( (V!5138 (val!2103 Int)) )
))
(declare-datatypes ((ValueCell!1715 0))(
  ( (ValueCellFull!1715 (v!3973 V!5137)) (EmptyCell!1715) )
))
(declare-datatypes ((array!7357 0))(
  ( (array!7358 (arr!3490 (Array (_ BitVec 32) (_ BitVec 64))) (size!3794 (_ BitVec 32))) )
))
(declare-datatypes ((array!7359 0))(
  ( (array!7360 (arr!3491 (Array (_ BitVec 32) ValueCell!1715)) (size!3795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2338 0))(
  ( (LongMapFixedSize!2339 (defaultEntry!3627 Int) (mask!8535 (_ BitVec 32)) (extraKeys!3364 (_ BitVec 32)) (zeroValue!3468 V!5137) (minValue!3468 V!5137) (_size!1218 (_ BitVec 32)) (_keys!5483 array!7357) (_values!3610 array!7359) (_vacant!1218 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2338)

(declare-fun mapDefault!7025 () ValueCell!1715)

(assert (=> b!175841 (= condMapEmpty!7025 (= (arr!3491 (_values!3610 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1715)) mapDefault!7025)))))

(declare-fun b!175842 () Bool)

(declare-fun e!116038 () Bool)

(assert (=> b!175842 (= e!116038 (and (= (size!3795 (_values!3610 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8535 thiss!1248))) (= (size!3794 (_keys!5483 thiss!1248)) (size!3795 (_values!3610 thiss!1248))) (bvsge (mask!8535 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3364 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3364 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!175843 () Bool)

(declare-fun res!83315 () Bool)

(assert (=> b!175843 (=> (not res!83315) (not e!116038))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!565 0))(
  ( (MissingZero!565 (index!4428 (_ BitVec 32))) (Found!565 (index!4429 (_ BitVec 32))) (Intermediate!565 (undefined!1377 Bool) (index!4430 (_ BitVec 32)) (x!19348 (_ BitVec 32))) (Undefined!565) (MissingVacant!565 (index!4431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7357 (_ BitVec 32)) SeekEntryResult!565)

(assert (=> b!175843 (= res!83315 ((_ is Undefined!565) (seekEntryOrOpen!0 key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248))))))

(declare-fun b!175844 () Bool)

(declare-fun res!83314 () Bool)

(assert (=> b!175844 (=> (not res!83314) (not e!116038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175844 (= res!83314 (validMask!0 (mask!8535 thiss!1248)))))

(declare-fun b!175845 () Bool)

(declare-fun res!83317 () Bool)

(assert (=> b!175845 (=> (not res!83317) (not e!116038))))

(declare-datatypes ((tuple2!3264 0))(
  ( (tuple2!3265 (_1!1643 (_ BitVec 64)) (_2!1643 V!5137)) )
))
(declare-datatypes ((List!2234 0))(
  ( (Nil!2231) (Cons!2230 (h!2850 tuple2!3264) (t!7047 List!2234)) )
))
(declare-datatypes ((ListLongMap!2183 0))(
  ( (ListLongMap!2184 (toList!1107 List!2234)) )
))
(declare-fun contains!1174 (ListLongMap!2183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!743 (array!7357 array!7359 (_ BitVec 32) (_ BitVec 32) V!5137 V!5137 (_ BitVec 32) Int) ListLongMap!2183)

(assert (=> b!175845 (= res!83317 (contains!1174 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7025 () Bool)

(declare-fun tp!15721 () Bool)

(assert (=> mapNonEmpty!7025 (= mapRes!7025 (and tp!15721 e!116033))))

(declare-fun mapValue!7025 () ValueCell!1715)

(declare-fun mapRest!7025 () (Array (_ BitVec 32) ValueCell!1715))

(declare-fun mapKey!7025 () (_ BitVec 32))

(assert (=> mapNonEmpty!7025 (= (arr!3491 (_values!3610 thiss!1248)) (store mapRest!7025 mapKey!7025 mapValue!7025))))

(declare-fun e!116037 () Bool)

(declare-fun array_inv!2251 (array!7357) Bool)

(declare-fun array_inv!2252 (array!7359) Bool)

(assert (=> b!175846 (= e!116037 (and tp!15722 tp_is_empty!4117 (array_inv!2251 (_keys!5483 thiss!1248)) (array_inv!2252 (_values!3610 thiss!1248)) e!116035))))

(declare-fun res!83313 () Bool)

(assert (=> start!17592 (=> (not res!83313) (not e!116038))))

(declare-fun valid!1003 (LongMapFixedSize!2338) Bool)

(assert (=> start!17592 (= res!83313 (valid!1003 thiss!1248))))

(assert (=> start!17592 e!116038))

(assert (=> start!17592 e!116037))

(assert (=> start!17592 true))

(declare-fun b!175847 () Bool)

(assert (=> b!175847 (= e!116034 tp_is_empty!4117)))

(declare-fun b!175848 () Bool)

(declare-fun res!83316 () Bool)

(assert (=> b!175848 (=> (not res!83316) (not e!116038))))

(assert (=> b!175848 (= res!83316 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!17592 res!83313) b!175848))

(assert (= (and b!175848 res!83316) b!175843))

(assert (= (and b!175843 res!83315) b!175845))

(assert (= (and b!175845 res!83317) b!175844))

(assert (= (and b!175844 res!83314) b!175842))

(assert (= (and b!175841 condMapEmpty!7025) mapIsEmpty!7025))

(assert (= (and b!175841 (not condMapEmpty!7025)) mapNonEmpty!7025))

(assert (= (and mapNonEmpty!7025 ((_ is ValueCellFull!1715) mapValue!7025)) b!175840))

(assert (= (and b!175841 ((_ is ValueCellFull!1715) mapDefault!7025)) b!175847))

(assert (= b!175846 b!175841))

(assert (= start!17592 b!175846))

(declare-fun m!204237 () Bool)

(assert (=> start!17592 m!204237))

(declare-fun m!204239 () Bool)

(assert (=> b!175844 m!204239))

(declare-fun m!204241 () Bool)

(assert (=> mapNonEmpty!7025 m!204241))

(declare-fun m!204243 () Bool)

(assert (=> b!175845 m!204243))

(assert (=> b!175845 m!204243))

(declare-fun m!204245 () Bool)

(assert (=> b!175845 m!204245))

(declare-fun m!204247 () Bool)

(assert (=> b!175843 m!204247))

(declare-fun m!204249 () Bool)

(assert (=> b!175846 m!204249))

(declare-fun m!204251 () Bool)

(assert (=> b!175846 m!204251))

(check-sat (not mapNonEmpty!7025) (not b_next!4345) (not b!175845) (not start!17592) (not b!175846) (not b!175843) tp_is_empty!4117 (not b!175844) b_and!10807)
(check-sat b_and!10807 (not b_next!4345))
(get-model)

(declare-fun d!53431 () Bool)

(assert (=> d!53431 (= (validMask!0 (mask!8535 thiss!1248)) (and (or (= (mask!8535 thiss!1248) #b00000000000000000000000000000111) (= (mask!8535 thiss!1248) #b00000000000000000000000000001111) (= (mask!8535 thiss!1248) #b00000000000000000000000000011111) (= (mask!8535 thiss!1248) #b00000000000000000000000000111111) (= (mask!8535 thiss!1248) #b00000000000000000000000001111111) (= (mask!8535 thiss!1248) #b00000000000000000000000011111111) (= (mask!8535 thiss!1248) #b00000000000000000000000111111111) (= (mask!8535 thiss!1248) #b00000000000000000000001111111111) (= (mask!8535 thiss!1248) #b00000000000000000000011111111111) (= (mask!8535 thiss!1248) #b00000000000000000000111111111111) (= (mask!8535 thiss!1248) #b00000000000000000001111111111111) (= (mask!8535 thiss!1248) #b00000000000000000011111111111111) (= (mask!8535 thiss!1248) #b00000000000000000111111111111111) (= (mask!8535 thiss!1248) #b00000000000000001111111111111111) (= (mask!8535 thiss!1248) #b00000000000000011111111111111111) (= (mask!8535 thiss!1248) #b00000000000000111111111111111111) (= (mask!8535 thiss!1248) #b00000000000001111111111111111111) (= (mask!8535 thiss!1248) #b00000000000011111111111111111111) (= (mask!8535 thiss!1248) #b00000000000111111111111111111111) (= (mask!8535 thiss!1248) #b00000000001111111111111111111111) (= (mask!8535 thiss!1248) #b00000000011111111111111111111111) (= (mask!8535 thiss!1248) #b00000000111111111111111111111111) (= (mask!8535 thiss!1248) #b00000001111111111111111111111111) (= (mask!8535 thiss!1248) #b00000011111111111111111111111111) (= (mask!8535 thiss!1248) #b00000111111111111111111111111111) (= (mask!8535 thiss!1248) #b00001111111111111111111111111111) (= (mask!8535 thiss!1248) #b00011111111111111111111111111111) (= (mask!8535 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8535 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175844 d!53431))

(declare-fun d!53433 () Bool)

(declare-fun e!116079 () Bool)

(assert (=> d!53433 e!116079))

(declare-fun res!83350 () Bool)

(assert (=> d!53433 (=> res!83350 e!116079)))

(declare-fun lt!86911 () Bool)

(assert (=> d!53433 (= res!83350 (not lt!86911))))

(declare-fun lt!86912 () Bool)

(assert (=> d!53433 (= lt!86911 lt!86912)))

(declare-datatypes ((Unit!5371 0))(
  ( (Unit!5372) )
))
(declare-fun lt!86910 () Unit!5371)

(declare-fun e!116080 () Unit!5371)

(assert (=> d!53433 (= lt!86910 e!116080)))

(declare-fun c!31519 () Bool)

(assert (=> d!53433 (= c!31519 lt!86912)))

(declare-fun containsKey!193 (List!2234 (_ BitVec 64)) Bool)

(assert (=> d!53433 (= lt!86912 (containsKey!193 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(assert (=> d!53433 (= (contains!1174 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) key!828) lt!86911)))

(declare-fun b!175909 () Bool)

(declare-fun lt!86913 () Unit!5371)

(assert (=> b!175909 (= e!116080 lt!86913)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!142 (List!2234 (_ BitVec 64)) Unit!5371)

(assert (=> b!175909 (= lt!86913 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-datatypes ((Option!195 0))(
  ( (Some!194 (v!3976 V!5137)) (None!193) )
))
(declare-fun isDefined!143 (Option!195) Bool)

(declare-fun getValueByKey!189 (List!2234 (_ BitVec 64)) Option!195)

(assert (=> b!175909 (isDefined!143 (getValueByKey!189 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-fun b!175910 () Bool)

(declare-fun Unit!5373 () Unit!5371)

(assert (=> b!175910 (= e!116080 Unit!5373)))

(declare-fun b!175911 () Bool)

(assert (=> b!175911 (= e!116079 (isDefined!143 (getValueByKey!189 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828)))))

(assert (= (and d!53433 c!31519) b!175909))

(assert (= (and d!53433 (not c!31519)) b!175910))

(assert (= (and d!53433 (not res!83350)) b!175911))

(declare-fun m!204285 () Bool)

(assert (=> d!53433 m!204285))

(declare-fun m!204287 () Bool)

(assert (=> b!175909 m!204287))

(declare-fun m!204289 () Bool)

(assert (=> b!175909 m!204289))

(assert (=> b!175909 m!204289))

(declare-fun m!204291 () Bool)

(assert (=> b!175909 m!204291))

(assert (=> b!175911 m!204289))

(assert (=> b!175911 m!204289))

(assert (=> b!175911 m!204291))

(assert (=> b!175845 d!53433))

(declare-fun b!175954 () Bool)

(declare-fun e!116119 () Bool)

(declare-fun lt!86966 () ListLongMap!2183)

(declare-fun apply!136 (ListLongMap!2183 (_ BitVec 64)) V!5137)

(assert (=> b!175954 (= e!116119 (= (apply!136 lt!86966 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3468 thiss!1248)))))

(declare-fun b!175955 () Bool)

(declare-fun e!116108 () Bool)

(assert (=> b!175955 (= e!116108 e!116119)))

(declare-fun res!83376 () Bool)

(declare-fun call!17807 () Bool)

(assert (=> b!175955 (= res!83376 call!17807)))

(assert (=> b!175955 (=> (not res!83376) (not e!116119))))

(declare-fun b!175956 () Bool)

(declare-fun e!116111 () Bool)

(declare-fun call!17804 () Bool)

(assert (=> b!175956 (= e!116111 (not call!17804))))

(declare-fun b!175957 () Bool)

(declare-fun e!116114 () ListLongMap!2183)

(declare-fun e!116117 () ListLongMap!2183)

(assert (=> b!175957 (= e!116114 e!116117)))

(declare-fun c!31535 () Bool)

(assert (=> b!175957 (= c!31535 (and (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175958 () Bool)

(declare-fun res!83375 () Bool)

(declare-fun e!116107 () Bool)

(assert (=> b!175958 (=> (not res!83375) (not e!116107))))

(declare-fun e!116113 () Bool)

(assert (=> b!175958 (= res!83375 e!116113)))

(declare-fun res!83374 () Bool)

(assert (=> b!175958 (=> res!83374 e!116113)))

(declare-fun e!116118 () Bool)

(assert (=> b!175958 (= res!83374 (not e!116118))))

(declare-fun res!83373 () Bool)

(assert (=> b!175958 (=> (not res!83373) (not e!116118))))

(assert (=> b!175958 (= res!83373 (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun b!175959 () Bool)

(declare-fun e!116115 () Unit!5371)

(declare-fun lt!86971 () Unit!5371)

(assert (=> b!175959 (= e!116115 lt!86971)))

(declare-fun lt!86970 () ListLongMap!2183)

(declare-fun getCurrentListMapNoExtraKeys!157 (array!7357 array!7359 (_ BitVec 32) (_ BitVec 32) V!5137 V!5137 (_ BitVec 32) Int) ListLongMap!2183)

(assert (=> b!175959 (= lt!86970 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!86961 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86962 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86962 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86968 () Unit!5371)

(declare-fun addStillContains!112 (ListLongMap!2183 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5371)

(assert (=> b!175959 (= lt!86968 (addStillContains!112 lt!86970 lt!86961 (zeroValue!3468 thiss!1248) lt!86962))))

(declare-fun +!248 (ListLongMap!2183 tuple2!3264) ListLongMap!2183)

(assert (=> b!175959 (contains!1174 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))) lt!86962)))

(declare-fun lt!86969 () Unit!5371)

(assert (=> b!175959 (= lt!86969 lt!86968)))

(declare-fun lt!86959 () ListLongMap!2183)

(assert (=> b!175959 (= lt!86959 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!86978 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86978 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86963 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86963 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86976 () Unit!5371)

(declare-fun addApplyDifferent!112 (ListLongMap!2183 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5371)

(assert (=> b!175959 (= lt!86976 (addApplyDifferent!112 lt!86959 lt!86978 (minValue!3468 thiss!1248) lt!86963))))

(assert (=> b!175959 (= (apply!136 (+!248 lt!86959 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))) lt!86963) (apply!136 lt!86959 lt!86963))))

(declare-fun lt!86975 () Unit!5371)

(assert (=> b!175959 (= lt!86975 lt!86976)))

(declare-fun lt!86964 () ListLongMap!2183)

(assert (=> b!175959 (= lt!86964 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!86979 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86977 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86977 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86965 () Unit!5371)

(assert (=> b!175959 (= lt!86965 (addApplyDifferent!112 lt!86964 lt!86979 (zeroValue!3468 thiss!1248) lt!86977))))

(assert (=> b!175959 (= (apply!136 (+!248 lt!86964 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))) lt!86977) (apply!136 lt!86964 lt!86977))))

(declare-fun lt!86958 () Unit!5371)

(assert (=> b!175959 (= lt!86958 lt!86965)))

(declare-fun lt!86972 () ListLongMap!2183)

(assert (=> b!175959 (= lt!86972 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!86973 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86973 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86967 () (_ BitVec 64))

(assert (=> b!175959 (= lt!86967 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175959 (= lt!86971 (addApplyDifferent!112 lt!86972 lt!86973 (minValue!3468 thiss!1248) lt!86967))))

(assert (=> b!175959 (= (apply!136 (+!248 lt!86972 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))) lt!86967) (apply!136 lt!86972 lt!86967))))

(declare-fun b!175960 () Bool)

(declare-fun e!116110 () ListLongMap!2183)

(declare-fun call!17808 () ListLongMap!2183)

(assert (=> b!175960 (= e!116110 call!17808)))

(declare-fun b!175961 () Bool)

(assert (=> b!175961 (= e!116108 (not call!17807))))

(declare-fun b!175962 () Bool)

(declare-fun c!31534 () Bool)

(assert (=> b!175962 (= c!31534 (and (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!175962 (= e!116117 e!116110)))

(declare-fun d!53435 () Bool)

(assert (=> d!53435 e!116107))

(declare-fun res!83371 () Bool)

(assert (=> d!53435 (=> (not res!83371) (not e!116107))))

(assert (=> d!53435 (= res!83371 (or (bvsge #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))))

(declare-fun lt!86974 () ListLongMap!2183)

(assert (=> d!53435 (= lt!86966 lt!86974)))

(declare-fun lt!86960 () Unit!5371)

(assert (=> d!53435 (= lt!86960 e!116115)))

(declare-fun c!31533 () Bool)

(declare-fun e!116109 () Bool)

(assert (=> d!53435 (= c!31533 e!116109)))

(declare-fun res!83370 () Bool)

(assert (=> d!53435 (=> (not res!83370) (not e!116109))))

(assert (=> d!53435 (= res!83370 (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> d!53435 (= lt!86974 e!116114)))

(declare-fun c!31532 () Bool)

(assert (=> d!53435 (= c!31532 (and (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53435 (validMask!0 (mask!8535 thiss!1248))))

(assert (=> d!53435 (= (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) lt!86966)))

(declare-fun b!175963 () Bool)

(declare-fun Unit!5374 () Unit!5371)

(assert (=> b!175963 (= e!116115 Unit!5374)))

(declare-fun b!175964 () Bool)

(declare-fun res!83369 () Bool)

(assert (=> b!175964 (=> (not res!83369) (not e!116107))))

(assert (=> b!175964 (= res!83369 e!116108)))

(declare-fun c!31537 () Bool)

(assert (=> b!175964 (= c!31537 (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!175965 () Bool)

(declare-fun e!116112 () Bool)

(assert (=> b!175965 (= e!116113 e!116112)))

(declare-fun res!83377 () Bool)

(assert (=> b!175965 (=> (not res!83377) (not e!116112))))

(assert (=> b!175965 (= res!83377 (contains!1174 lt!86966 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175965 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun call!17809 () ListLongMap!2183)

(declare-fun call!17805 () ListLongMap!2183)

(declare-fun call!17806 () ListLongMap!2183)

(declare-fun bm!17800 () Bool)

(declare-fun call!17803 () ListLongMap!2183)

(assert (=> bm!17800 (= call!17805 (+!248 (ite c!31532 call!17806 (ite c!31535 call!17809 call!17803)) (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(declare-fun bm!17801 () Bool)

(assert (=> bm!17801 (= call!17803 call!17809)))

(declare-fun bm!17802 () Bool)

(assert (=> bm!17802 (= call!17808 call!17805)))

(declare-fun b!175966 () Bool)

(declare-fun get!1992 (ValueCell!1715 V!5137) V!5137)

(declare-fun dynLambda!470 (Int (_ BitVec 64)) V!5137)

(assert (=> b!175966 (= e!116112 (= (apply!136 lt!86966 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)) (get!1992 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3795 (_values!3610 thiss!1248))))))

(assert (=> b!175966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun bm!17803 () Bool)

(assert (=> bm!17803 (= call!17809 call!17806)))

(declare-fun b!175967 () Bool)

(assert (=> b!175967 (= e!116110 call!17803)))

(declare-fun b!175968 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175968 (= e!116109 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175969 () Bool)

(assert (=> b!175969 (= e!116117 call!17808)))

(declare-fun bm!17804 () Bool)

(assert (=> bm!17804 (= call!17806 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun b!175970 () Bool)

(assert (=> b!175970 (= e!116118 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175971 () Bool)

(assert (=> b!175971 (= e!116107 e!116111)))

(declare-fun c!31536 () Bool)

(assert (=> b!175971 (= c!31536 (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17805 () Bool)

(assert (=> bm!17805 (= call!17807 (contains!1174 lt!86966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175972 () Bool)

(declare-fun e!116116 () Bool)

(assert (=> b!175972 (= e!116116 (= (apply!136 lt!86966 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3468 thiss!1248)))))

(declare-fun b!175973 () Bool)

(assert (=> b!175973 (= e!116114 (+!248 call!17805 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))

(declare-fun b!175974 () Bool)

(assert (=> b!175974 (= e!116111 e!116116)))

(declare-fun res!83372 () Bool)

(assert (=> b!175974 (= res!83372 call!17804)))

(assert (=> b!175974 (=> (not res!83372) (not e!116116))))

(declare-fun bm!17806 () Bool)

(assert (=> bm!17806 (= call!17804 (contains!1174 lt!86966 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53435 c!31532) b!175973))

(assert (= (and d!53435 (not c!31532)) b!175957))

(assert (= (and b!175957 c!31535) b!175969))

(assert (= (and b!175957 (not c!31535)) b!175962))

(assert (= (and b!175962 c!31534) b!175960))

(assert (= (and b!175962 (not c!31534)) b!175967))

(assert (= (or b!175960 b!175967) bm!17801))

(assert (= (or b!175969 bm!17801) bm!17803))

(assert (= (or b!175969 b!175960) bm!17802))

(assert (= (or b!175973 bm!17803) bm!17804))

(assert (= (or b!175973 bm!17802) bm!17800))

(assert (= (and d!53435 res!83370) b!175968))

(assert (= (and d!53435 c!31533) b!175959))

(assert (= (and d!53435 (not c!31533)) b!175963))

(assert (= (and d!53435 res!83371) b!175958))

(assert (= (and b!175958 res!83373) b!175970))

(assert (= (and b!175958 (not res!83374)) b!175965))

(assert (= (and b!175965 res!83377) b!175966))

(assert (= (and b!175958 res!83375) b!175964))

(assert (= (and b!175964 c!31537) b!175955))

(assert (= (and b!175964 (not c!31537)) b!175961))

(assert (= (and b!175955 res!83376) b!175954))

(assert (= (or b!175955 b!175961) bm!17805))

(assert (= (and b!175964 res!83369) b!175971))

(assert (= (and b!175971 c!31536) b!175974))

(assert (= (and b!175971 (not c!31536)) b!175956))

(assert (= (and b!175974 res!83372) b!175972))

(assert (= (or b!175974 b!175956) bm!17806))

(declare-fun b_lambda!7009 () Bool)

(assert (=> (not b_lambda!7009) (not b!175966)))

(declare-fun t!7051 () Bool)

(declare-fun tb!2775 () Bool)

(assert (=> (and b!175846 (= (defaultEntry!3627 thiss!1248) (defaultEntry!3627 thiss!1248)) t!7051) tb!2775))

(declare-fun result!4615 () Bool)

(assert (=> tb!2775 (= result!4615 tp_is_empty!4117)))

(assert (=> b!175966 t!7051))

(declare-fun b_and!10813 () Bool)

(assert (= b_and!10807 (and (=> t!7051 result!4615) b_and!10813)))

(declare-fun m!204293 () Bool)

(assert (=> b!175970 m!204293))

(assert (=> b!175970 m!204293))

(declare-fun m!204295 () Bool)

(assert (=> b!175970 m!204295))

(declare-fun m!204297 () Bool)

(assert (=> b!175954 m!204297))

(assert (=> b!175968 m!204293))

(assert (=> b!175968 m!204293))

(assert (=> b!175968 m!204295))

(declare-fun m!204299 () Bool)

(assert (=> bm!17805 m!204299))

(declare-fun m!204301 () Bool)

(assert (=> bm!17800 m!204301))

(declare-fun m!204303 () Bool)

(assert (=> bm!17804 m!204303))

(assert (=> b!175965 m!204293))

(assert (=> b!175965 m!204293))

(declare-fun m!204305 () Bool)

(assert (=> b!175965 m!204305))

(assert (=> d!53435 m!204239))

(declare-fun m!204307 () Bool)

(assert (=> b!175972 m!204307))

(declare-fun m!204309 () Bool)

(assert (=> b!175959 m!204309))

(declare-fun m!204311 () Bool)

(assert (=> b!175959 m!204311))

(declare-fun m!204313 () Bool)

(assert (=> b!175959 m!204313))

(assert (=> b!175959 m!204309))

(declare-fun m!204315 () Bool)

(assert (=> b!175959 m!204315))

(declare-fun m!204317 () Bool)

(assert (=> b!175959 m!204317))

(assert (=> b!175959 m!204293))

(declare-fun m!204319 () Bool)

(assert (=> b!175959 m!204319))

(declare-fun m!204321 () Bool)

(assert (=> b!175959 m!204321))

(declare-fun m!204323 () Bool)

(assert (=> b!175959 m!204323))

(assert (=> b!175959 m!204319))

(declare-fun m!204325 () Bool)

(assert (=> b!175959 m!204325))

(declare-fun m!204327 () Bool)

(assert (=> b!175959 m!204327))

(assert (=> b!175959 m!204303))

(declare-fun m!204329 () Bool)

(assert (=> b!175959 m!204329))

(declare-fun m!204331 () Bool)

(assert (=> b!175959 m!204331))

(declare-fun m!204333 () Bool)

(assert (=> b!175959 m!204333))

(declare-fun m!204335 () Bool)

(assert (=> b!175959 m!204335))

(assert (=> b!175959 m!204333))

(declare-fun m!204337 () Bool)

(assert (=> b!175959 m!204337))

(assert (=> b!175959 m!204315))

(declare-fun m!204339 () Bool)

(assert (=> b!175966 m!204339))

(declare-fun m!204341 () Bool)

(assert (=> b!175966 m!204341))

(declare-fun m!204343 () Bool)

(assert (=> b!175966 m!204343))

(assert (=> b!175966 m!204293))

(declare-fun m!204345 () Bool)

(assert (=> b!175966 m!204345))

(assert (=> b!175966 m!204293))

(assert (=> b!175966 m!204341))

(assert (=> b!175966 m!204339))

(declare-fun m!204347 () Bool)

(assert (=> b!175973 m!204347))

(declare-fun m!204349 () Bool)

(assert (=> bm!17806 m!204349))

(assert (=> b!175845 d!53435))

(declare-fun d!53437 () Bool)

(assert (=> d!53437 (= (array_inv!2251 (_keys!5483 thiss!1248)) (bvsge (size!3794 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175846 d!53437))

(declare-fun d!53439 () Bool)

(assert (=> d!53439 (= (array_inv!2252 (_values!3610 thiss!1248)) (bvsge (size!3795 (_values!3610 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175846 d!53439))

(declare-fun d!53441 () Bool)

(declare-fun lt!86986 () SeekEntryResult!565)

(assert (=> d!53441 (and (or ((_ is Undefined!565) lt!86986) (not ((_ is Found!565) lt!86986)) (and (bvsge (index!4429 lt!86986) #b00000000000000000000000000000000) (bvslt (index!4429 lt!86986) (size!3794 (_keys!5483 thiss!1248))))) (or ((_ is Undefined!565) lt!86986) ((_ is Found!565) lt!86986) (not ((_ is MissingZero!565) lt!86986)) (and (bvsge (index!4428 lt!86986) #b00000000000000000000000000000000) (bvslt (index!4428 lt!86986) (size!3794 (_keys!5483 thiss!1248))))) (or ((_ is Undefined!565) lt!86986) ((_ is Found!565) lt!86986) ((_ is MissingZero!565) lt!86986) (not ((_ is MissingVacant!565) lt!86986)) (and (bvsge (index!4431 lt!86986) #b00000000000000000000000000000000) (bvslt (index!4431 lt!86986) (size!3794 (_keys!5483 thiss!1248))))) (or ((_ is Undefined!565) lt!86986) (ite ((_ is Found!565) lt!86986) (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4429 lt!86986)) key!828) (ite ((_ is MissingZero!565) lt!86986) (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4428 lt!86986)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!565) lt!86986) (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4431 lt!86986)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!116127 () SeekEntryResult!565)

(assert (=> d!53441 (= lt!86986 e!116127)))

(declare-fun c!31545 () Bool)

(declare-fun lt!86987 () SeekEntryResult!565)

(assert (=> d!53441 (= c!31545 (and ((_ is Intermediate!565) lt!86987) (undefined!1377 lt!86987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7357 (_ BitVec 32)) SeekEntryResult!565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53441 (= lt!86987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8535 thiss!1248)) key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)))))

(assert (=> d!53441 (validMask!0 (mask!8535 thiss!1248))))

(assert (=> d!53441 (= (seekEntryOrOpen!0 key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)) lt!86986)))

(declare-fun b!175989 () Bool)

(declare-fun c!31546 () Bool)

(declare-fun lt!86988 () (_ BitVec 64))

(assert (=> b!175989 (= c!31546 (= lt!86988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116126 () SeekEntryResult!565)

(declare-fun e!116128 () SeekEntryResult!565)

(assert (=> b!175989 (= e!116126 e!116128)))

(declare-fun b!175990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7357 (_ BitVec 32)) SeekEntryResult!565)

(assert (=> b!175990 (= e!116128 (seekKeyOrZeroReturnVacant!0 (x!19348 lt!86987) (index!4430 lt!86987) (index!4430 lt!86987) key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)))))

(declare-fun b!175991 () Bool)

(assert (=> b!175991 (= e!116127 e!116126)))

(assert (=> b!175991 (= lt!86988 (select (arr!3490 (_keys!5483 thiss!1248)) (index!4430 lt!86987)))))

(declare-fun c!31544 () Bool)

(assert (=> b!175991 (= c!31544 (= lt!86988 key!828))))

(declare-fun b!175992 () Bool)

(assert (=> b!175992 (= e!116126 (Found!565 (index!4430 lt!86987)))))

(declare-fun b!175993 () Bool)

(assert (=> b!175993 (= e!116128 (MissingZero!565 (index!4430 lt!86987)))))

(declare-fun b!175994 () Bool)

(assert (=> b!175994 (= e!116127 Undefined!565)))

(assert (= (and d!53441 c!31545) b!175994))

(assert (= (and d!53441 (not c!31545)) b!175991))

(assert (= (and b!175991 c!31544) b!175992))

(assert (= (and b!175991 (not c!31544)) b!175989))

(assert (= (and b!175989 c!31546) b!175993))

(assert (= (and b!175989 (not c!31546)) b!175990))

(declare-fun m!204351 () Bool)

(assert (=> d!53441 m!204351))

(declare-fun m!204353 () Bool)

(assert (=> d!53441 m!204353))

(assert (=> d!53441 m!204353))

(declare-fun m!204355 () Bool)

(assert (=> d!53441 m!204355))

(declare-fun m!204357 () Bool)

(assert (=> d!53441 m!204357))

(declare-fun m!204359 () Bool)

(assert (=> d!53441 m!204359))

(assert (=> d!53441 m!204239))

(declare-fun m!204361 () Bool)

(assert (=> b!175990 m!204361))

(declare-fun m!204363 () Bool)

(assert (=> b!175991 m!204363))

(assert (=> b!175843 d!53441))

(declare-fun d!53443 () Bool)

(declare-fun res!83384 () Bool)

(declare-fun e!116131 () Bool)

(assert (=> d!53443 (=> (not res!83384) (not e!116131))))

(declare-fun simpleValid!150 (LongMapFixedSize!2338) Bool)

(assert (=> d!53443 (= res!83384 (simpleValid!150 thiss!1248))))

(assert (=> d!53443 (= (valid!1003 thiss!1248) e!116131)))

(declare-fun b!176001 () Bool)

(declare-fun res!83385 () Bool)

(assert (=> b!176001 (=> (not res!83385) (not e!116131))))

(declare-fun arrayCountValidKeys!0 (array!7357 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176001 (= res!83385 (= (arrayCountValidKeys!0 (_keys!5483 thiss!1248) #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))) (_size!1218 thiss!1248)))))

(declare-fun b!176002 () Bool)

(declare-fun res!83386 () Bool)

(assert (=> b!176002 (=> (not res!83386) (not e!116131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7357 (_ BitVec 32)) Bool)

(assert (=> b!176002 (= res!83386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)))))

(declare-fun b!176003 () Bool)

(declare-datatypes ((List!2237 0))(
  ( (Nil!2234) (Cons!2233 (h!2853 (_ BitVec 64)) (t!7052 List!2237)) )
))
(declare-fun arrayNoDuplicates!0 (array!7357 (_ BitVec 32) List!2237) Bool)

(assert (=> b!176003 (= e!116131 (arrayNoDuplicates!0 (_keys!5483 thiss!1248) #b00000000000000000000000000000000 Nil!2234))))

(assert (= (and d!53443 res!83384) b!176001))

(assert (= (and b!176001 res!83385) b!176002))

(assert (= (and b!176002 res!83386) b!176003))

(declare-fun m!204365 () Bool)

(assert (=> d!53443 m!204365))

(declare-fun m!204367 () Bool)

(assert (=> b!176001 m!204367))

(declare-fun m!204369 () Bool)

(assert (=> b!176002 m!204369))

(declare-fun m!204371 () Bool)

(assert (=> b!176003 m!204371))

(assert (=> start!17592 d!53443))

(declare-fun condMapEmpty!7034 () Bool)

(declare-fun mapDefault!7034 () ValueCell!1715)

(assert (=> mapNonEmpty!7025 (= condMapEmpty!7034 (= mapRest!7025 ((as const (Array (_ BitVec 32) ValueCell!1715)) mapDefault!7034)))))

(declare-fun e!116136 () Bool)

(declare-fun mapRes!7034 () Bool)

(assert (=> mapNonEmpty!7025 (= tp!15721 (and e!116136 mapRes!7034))))

(declare-fun b!176010 () Bool)

(declare-fun e!116137 () Bool)

(assert (=> b!176010 (= e!116137 tp_is_empty!4117)))

(declare-fun b!176011 () Bool)

(assert (=> b!176011 (= e!116136 tp_is_empty!4117)))

(declare-fun mapIsEmpty!7034 () Bool)

(assert (=> mapIsEmpty!7034 mapRes!7034))

(declare-fun mapNonEmpty!7034 () Bool)

(declare-fun tp!15737 () Bool)

(assert (=> mapNonEmpty!7034 (= mapRes!7034 (and tp!15737 e!116137))))

(declare-fun mapRest!7034 () (Array (_ BitVec 32) ValueCell!1715))

(declare-fun mapValue!7034 () ValueCell!1715)

(declare-fun mapKey!7034 () (_ BitVec 32))

(assert (=> mapNonEmpty!7034 (= mapRest!7025 (store mapRest!7034 mapKey!7034 mapValue!7034))))

(assert (= (and mapNonEmpty!7025 condMapEmpty!7034) mapIsEmpty!7034))

(assert (= (and mapNonEmpty!7025 (not condMapEmpty!7034)) mapNonEmpty!7034))

(assert (= (and mapNonEmpty!7034 ((_ is ValueCellFull!1715) mapValue!7034)) b!176010))

(assert (= (and mapNonEmpty!7025 ((_ is ValueCellFull!1715) mapDefault!7034)) b!176011))

(declare-fun m!204373 () Bool)

(assert (=> mapNonEmpty!7034 m!204373))

(declare-fun b_lambda!7011 () Bool)

(assert (= b_lambda!7009 (or (and b!175846 b_free!4345) b_lambda!7011)))

(check-sat (not b!175959) (not bm!17800) (not b!176001) (not d!53441) (not b!175909) (not bm!17806) (not b!175968) (not b!176003) tp_is_empty!4117 (not b!175970) (not b!175965) (not mapNonEmpty!7034) (not b!176002) (not b!175954) (not d!53433) (not b_next!4345) (not bm!17804) (not b!175990) (not d!53435) (not b!175966) (not b!175973) (not b!175972) (not b_lambda!7011) (not d!53443) (not b!175911) (not bm!17805) b_and!10813)
(check-sat b_and!10813 (not b_next!4345))
(get-model)

(declare-fun d!53445 () Bool)

(declare-fun e!116140 () Bool)

(assert (=> d!53445 e!116140))

(declare-fun res!83392 () Bool)

(assert (=> d!53445 (=> (not res!83392) (not e!116140))))

(declare-fun lt!86997 () ListLongMap!2183)

(assert (=> d!53445 (= res!83392 (contains!1174 lt!86997 (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(declare-fun lt!86999 () List!2234)

(assert (=> d!53445 (= lt!86997 (ListLongMap!2184 lt!86999))))

(declare-fun lt!86998 () Unit!5371)

(declare-fun lt!87000 () Unit!5371)

(assert (=> d!53445 (= lt!86998 lt!87000)))

(assert (=> d!53445 (= (getValueByKey!189 lt!86999 (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!103 (List!2234 (_ BitVec 64) V!5137) Unit!5371)

(assert (=> d!53445 (= lt!87000 (lemmaContainsTupThenGetReturnValue!103 lt!86999 (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(declare-fun insertStrictlySorted!106 (List!2234 (_ BitVec 64) V!5137) List!2234)

(assert (=> d!53445 (= lt!86999 (insertStrictlySorted!106 (toList!1107 call!17805) (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(assert (=> d!53445 (= (+!248 call!17805 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))) lt!86997)))

(declare-fun b!176016 () Bool)

(declare-fun res!83391 () Bool)

(assert (=> b!176016 (=> (not res!83391) (not e!116140))))

(assert (=> b!176016 (= res!83391 (= (getValueByKey!189 (toList!1107 lt!86997) (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(declare-fun b!176017 () Bool)

(declare-fun contains!1177 (List!2234 tuple2!3264) Bool)

(assert (=> b!176017 (= e!116140 (contains!1177 (toList!1107 lt!86997) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))

(assert (= (and d!53445 res!83392) b!176016))

(assert (= (and b!176016 res!83391) b!176017))

(declare-fun m!204375 () Bool)

(assert (=> d!53445 m!204375))

(declare-fun m!204377 () Bool)

(assert (=> d!53445 m!204377))

(declare-fun m!204379 () Bool)

(assert (=> d!53445 m!204379))

(declare-fun m!204381 () Bool)

(assert (=> d!53445 m!204381))

(declare-fun m!204383 () Bool)

(assert (=> b!176016 m!204383))

(declare-fun m!204385 () Bool)

(assert (=> b!176017 m!204385))

(assert (=> b!175973 d!53445))

(declare-fun d!53447 () Bool)

(declare-fun res!83397 () Bool)

(declare-fun e!116145 () Bool)

(assert (=> d!53447 (=> res!83397 e!116145)))

(assert (=> d!53447 (= res!83397 (and ((_ is Cons!2230) (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (= (_1!1643 (h!2850 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)))))

(assert (=> d!53447 (= (containsKey!193 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828) e!116145)))

(declare-fun b!176022 () Bool)

(declare-fun e!116146 () Bool)

(assert (=> b!176022 (= e!116145 e!116146)))

(declare-fun res!83398 () Bool)

(assert (=> b!176022 (=> (not res!83398) (not e!116146))))

(assert (=> b!176022 (= res!83398 (and (or (not ((_ is Cons!2230) (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) (bvsle (_1!1643 (h!2850 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)) ((_ is Cons!2230) (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (bvslt (_1!1643 (h!2850 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)))))

(declare-fun b!176023 () Bool)

(assert (=> b!176023 (= e!116146 (containsKey!193 (t!7047 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) key!828))))

(assert (= (and d!53447 (not res!83397)) b!176022))

(assert (= (and b!176022 res!83398) b!176023))

(declare-fun m!204387 () Bool)

(assert (=> b!176023 m!204387))

(assert (=> d!53433 d!53447))

(declare-fun b!176034 () Bool)

(declare-fun e!116157 () Bool)

(declare-fun contains!1178 (List!2237 (_ BitVec 64)) Bool)

(assert (=> b!176034 (= e!116157 (contains!1178 Nil!2234 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176035 () Bool)

(declare-fun e!116158 () Bool)

(declare-fun call!17812 () Bool)

(assert (=> b!176035 (= e!116158 call!17812)))

(declare-fun b!176036 () Bool)

(declare-fun e!116155 () Bool)

(assert (=> b!176036 (= e!116155 e!116158)))

(declare-fun c!31549 () Bool)

(assert (=> b!176036 (= c!31549 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176037 () Bool)

(declare-fun e!116156 () Bool)

(assert (=> b!176037 (= e!116156 e!116155)))

(declare-fun res!83406 () Bool)

(assert (=> b!176037 (=> (not res!83406) (not e!116155))))

(assert (=> b!176037 (= res!83406 (not e!116157))))

(declare-fun res!83407 () Bool)

(assert (=> b!176037 (=> (not res!83407) (not e!116157))))

(assert (=> b!176037 (= res!83407 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176038 () Bool)

(assert (=> b!176038 (= e!116158 call!17812)))

(declare-fun d!53449 () Bool)

(declare-fun res!83405 () Bool)

(assert (=> d!53449 (=> res!83405 e!116156)))

(assert (=> d!53449 (= res!83405 (bvsge #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> d!53449 (= (arrayNoDuplicates!0 (_keys!5483 thiss!1248) #b00000000000000000000000000000000 Nil!2234) e!116156)))

(declare-fun bm!17809 () Bool)

(assert (=> bm!17809 (= call!17812 (arrayNoDuplicates!0 (_keys!5483 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31549 (Cons!2233 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000) Nil!2234) Nil!2234)))))

(assert (= (and d!53449 (not res!83405)) b!176037))

(assert (= (and b!176037 res!83407) b!176034))

(assert (= (and b!176037 res!83406) b!176036))

(assert (= (and b!176036 c!31549) b!176038))

(assert (= (and b!176036 (not c!31549)) b!176035))

(assert (= (or b!176038 b!176035) bm!17809))

(assert (=> b!176034 m!204293))

(assert (=> b!176034 m!204293))

(declare-fun m!204389 () Bool)

(assert (=> b!176034 m!204389))

(assert (=> b!176036 m!204293))

(assert (=> b!176036 m!204293))

(assert (=> b!176036 m!204295))

(assert (=> b!176037 m!204293))

(assert (=> b!176037 m!204293))

(assert (=> b!176037 m!204295))

(assert (=> bm!17809 m!204293))

(declare-fun m!204391 () Bool)

(assert (=> bm!17809 m!204391))

(assert (=> b!176003 d!53449))

(declare-fun d!53451 () Bool)

(declare-fun get!1993 (Option!195) V!5137)

(assert (=> d!53451 (= (apply!136 (+!248 lt!86972 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))) lt!86967) (get!1993 (getValueByKey!189 (toList!1107 (+!248 lt!86972 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))) lt!86967)))))

(declare-fun bs!7236 () Bool)

(assert (= bs!7236 d!53451))

(declare-fun m!204393 () Bool)

(assert (=> bs!7236 m!204393))

(assert (=> bs!7236 m!204393))

(declare-fun m!204395 () Bool)

(assert (=> bs!7236 m!204395))

(assert (=> b!175959 d!53451))

(declare-fun d!53453 () Bool)

(declare-fun e!116159 () Bool)

(assert (=> d!53453 e!116159))

(declare-fun res!83408 () Bool)

(assert (=> d!53453 (=> res!83408 e!116159)))

(declare-fun lt!87002 () Bool)

(assert (=> d!53453 (= res!83408 (not lt!87002))))

(declare-fun lt!87003 () Bool)

(assert (=> d!53453 (= lt!87002 lt!87003)))

(declare-fun lt!87001 () Unit!5371)

(declare-fun e!116160 () Unit!5371)

(assert (=> d!53453 (= lt!87001 e!116160)))

(declare-fun c!31550 () Bool)

(assert (=> d!53453 (= c!31550 lt!87003)))

(assert (=> d!53453 (= lt!87003 (containsKey!193 (toList!1107 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))) lt!86962))))

(assert (=> d!53453 (= (contains!1174 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))) lt!86962) lt!87002)))

(declare-fun b!176039 () Bool)

(declare-fun lt!87004 () Unit!5371)

(assert (=> b!176039 (= e!116160 lt!87004)))

(assert (=> b!176039 (= lt!87004 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1107 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))) lt!86962))))

(assert (=> b!176039 (isDefined!143 (getValueByKey!189 (toList!1107 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))) lt!86962))))

(declare-fun b!176040 () Bool)

(declare-fun Unit!5375 () Unit!5371)

(assert (=> b!176040 (= e!116160 Unit!5375)))

(declare-fun b!176041 () Bool)

(assert (=> b!176041 (= e!116159 (isDefined!143 (getValueByKey!189 (toList!1107 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))) lt!86962)))))

(assert (= (and d!53453 c!31550) b!176039))

(assert (= (and d!53453 (not c!31550)) b!176040))

(assert (= (and d!53453 (not res!83408)) b!176041))

(declare-fun m!204397 () Bool)

(assert (=> d!53453 m!204397))

(declare-fun m!204399 () Bool)

(assert (=> b!176039 m!204399))

(declare-fun m!204401 () Bool)

(assert (=> b!176039 m!204401))

(assert (=> b!176039 m!204401))

(declare-fun m!204403 () Bool)

(assert (=> b!176039 m!204403))

(assert (=> b!176041 m!204401))

(assert (=> b!176041 m!204401))

(assert (=> b!176041 m!204403))

(assert (=> b!175959 d!53453))

(declare-fun d!53455 () Bool)

(assert (=> d!53455 (= (apply!136 (+!248 lt!86972 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))) lt!86967) (apply!136 lt!86972 lt!86967))))

(declare-fun lt!87007 () Unit!5371)

(declare-fun choose!950 (ListLongMap!2183 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5371)

(assert (=> d!53455 (= lt!87007 (choose!950 lt!86972 lt!86973 (minValue!3468 thiss!1248) lt!86967))))

(declare-fun e!116163 () Bool)

(assert (=> d!53455 e!116163))

(declare-fun res!83411 () Bool)

(assert (=> d!53455 (=> (not res!83411) (not e!116163))))

(assert (=> d!53455 (= res!83411 (contains!1174 lt!86972 lt!86967))))

(assert (=> d!53455 (= (addApplyDifferent!112 lt!86972 lt!86973 (minValue!3468 thiss!1248) lt!86967) lt!87007)))

(declare-fun b!176045 () Bool)

(assert (=> b!176045 (= e!116163 (not (= lt!86967 lt!86973)))))

(assert (= (and d!53455 res!83411) b!176045))

(declare-fun m!204405 () Bool)

(assert (=> d!53455 m!204405))

(assert (=> d!53455 m!204315))

(declare-fun m!204407 () Bool)

(assert (=> d!53455 m!204407))

(assert (=> d!53455 m!204315))

(assert (=> d!53455 m!204317))

(assert (=> d!53455 m!204313))

(assert (=> b!175959 d!53455))

(declare-fun d!53457 () Bool)

(assert (=> d!53457 (= (apply!136 lt!86959 lt!86963) (get!1993 (getValueByKey!189 (toList!1107 lt!86959) lt!86963)))))

(declare-fun bs!7237 () Bool)

(assert (= bs!7237 d!53457))

(declare-fun m!204409 () Bool)

(assert (=> bs!7237 m!204409))

(assert (=> bs!7237 m!204409))

(declare-fun m!204411 () Bool)

(assert (=> bs!7237 m!204411))

(assert (=> b!175959 d!53457))

(declare-fun d!53459 () Bool)

(assert (=> d!53459 (= (apply!136 lt!86972 lt!86967) (get!1993 (getValueByKey!189 (toList!1107 lt!86972) lt!86967)))))

(declare-fun bs!7238 () Bool)

(assert (= bs!7238 d!53459))

(declare-fun m!204413 () Bool)

(assert (=> bs!7238 m!204413))

(assert (=> bs!7238 m!204413))

(declare-fun m!204415 () Bool)

(assert (=> bs!7238 m!204415))

(assert (=> b!175959 d!53459))

(declare-fun d!53461 () Bool)

(declare-fun e!116164 () Bool)

(assert (=> d!53461 e!116164))

(declare-fun res!83413 () Bool)

(assert (=> d!53461 (=> (not res!83413) (not e!116164))))

(declare-fun lt!87008 () ListLongMap!2183)

(assert (=> d!53461 (= res!83413 (contains!1174 lt!87008 (_1!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))))))

(declare-fun lt!87010 () List!2234)

(assert (=> d!53461 (= lt!87008 (ListLongMap!2184 lt!87010))))

(declare-fun lt!87009 () Unit!5371)

(declare-fun lt!87011 () Unit!5371)

(assert (=> d!53461 (= lt!87009 lt!87011)))

(assert (=> d!53461 (= (getValueByKey!189 lt!87010 (_1!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53461 (= lt!87011 (lemmaContainsTupThenGetReturnValue!103 lt!87010 (_1!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53461 (= lt!87010 (insertStrictlySorted!106 (toList!1107 lt!86970) (_1!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53461 (= (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))) lt!87008)))

(declare-fun b!176046 () Bool)

(declare-fun res!83412 () Bool)

(assert (=> b!176046 (=> (not res!83412) (not e!116164))))

(assert (=> b!176046 (= res!83412 (= (getValueByKey!189 (toList!1107 lt!87008) (_1!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))))))))

(declare-fun b!176047 () Bool)

(assert (=> b!176047 (= e!116164 (contains!1177 (toList!1107 lt!87008) (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))))))

(assert (= (and d!53461 res!83413) b!176046))

(assert (= (and b!176046 res!83412) b!176047))

(declare-fun m!204417 () Bool)

(assert (=> d!53461 m!204417))

(declare-fun m!204419 () Bool)

(assert (=> d!53461 m!204419))

(declare-fun m!204421 () Bool)

(assert (=> d!53461 m!204421))

(declare-fun m!204423 () Bool)

(assert (=> d!53461 m!204423))

(declare-fun m!204425 () Bool)

(assert (=> b!176046 m!204425))

(declare-fun m!204427 () Bool)

(assert (=> b!176047 m!204427))

(assert (=> b!175959 d!53461))

(declare-fun d!53463 () Bool)

(assert (=> d!53463 (= (apply!136 (+!248 lt!86964 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))) lt!86977) (get!1993 (getValueByKey!189 (toList!1107 (+!248 lt!86964 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))) lt!86977)))))

(declare-fun bs!7239 () Bool)

(assert (= bs!7239 d!53463))

(declare-fun m!204429 () Bool)

(assert (=> bs!7239 m!204429))

(assert (=> bs!7239 m!204429))

(declare-fun m!204431 () Bool)

(assert (=> bs!7239 m!204431))

(assert (=> b!175959 d!53463))

(declare-fun b!176072 () Bool)

(assert (=> b!176072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> b!176072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3795 (_values!3610 thiss!1248))))))

(declare-fun e!116180 () Bool)

(declare-fun lt!87030 () ListLongMap!2183)

(assert (=> b!176072 (= e!116180 (= (apply!136 lt!87030 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)) (get!1992 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17812 () Bool)

(declare-fun call!17815 () ListLongMap!2183)

(assert (=> bm!17812 (= call!17815 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3627 thiss!1248)))))

(declare-fun b!176073 () Bool)

(declare-fun res!83423 () Bool)

(declare-fun e!116182 () Bool)

(assert (=> b!176073 (=> (not res!83423) (not e!116182))))

(assert (=> b!176073 (= res!83423 (not (contains!1174 lt!87030 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176074 () Bool)

(declare-fun e!116179 () ListLongMap!2183)

(assert (=> b!176074 (= e!116179 (ListLongMap!2184 Nil!2231))))

(declare-fun b!176075 () Bool)

(declare-fun e!116183 () Bool)

(declare-fun e!116181 () Bool)

(assert (=> b!176075 (= e!116183 e!116181)))

(declare-fun c!31561 () Bool)

(assert (=> b!176075 (= c!31561 (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun b!176076 () Bool)

(declare-fun e!116184 () Bool)

(assert (=> b!176076 (= e!116184 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176076 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!176077 () Bool)

(declare-fun lt!87028 () Unit!5371)

(declare-fun lt!87027 () Unit!5371)

(assert (=> b!176077 (= lt!87028 lt!87027)))

(declare-fun lt!87026 () V!5137)

(declare-fun lt!87031 () (_ BitVec 64))

(declare-fun lt!87029 () (_ BitVec 64))

(declare-fun lt!87032 () ListLongMap!2183)

(assert (=> b!176077 (not (contains!1174 (+!248 lt!87032 (tuple2!3265 lt!87031 lt!87026)) lt!87029))))

(declare-fun addStillNotContains!77 (ListLongMap!2183 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5371)

(assert (=> b!176077 (= lt!87027 (addStillNotContains!77 lt!87032 lt!87031 lt!87026 lt!87029))))

(assert (=> b!176077 (= lt!87029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!176077 (= lt!87026 (get!1992 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176077 (= lt!87031 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176077 (= lt!87032 call!17815)))

(declare-fun e!116185 () ListLongMap!2183)

(assert (=> b!176077 (= e!116185 (+!248 call!17815 (tuple2!3265 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000) (get!1992 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!176078 () Bool)

(assert (=> b!176078 (= e!116183 e!116180)))

(assert (=> b!176078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun res!83425 () Bool)

(assert (=> b!176078 (= res!83425 (contains!1174 lt!87030 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176078 (=> (not res!83425) (not e!116180))))

(declare-fun d!53465 () Bool)

(assert (=> d!53465 e!116182))

(declare-fun res!83424 () Bool)

(assert (=> d!53465 (=> (not res!83424) (not e!116182))))

(assert (=> d!53465 (= res!83424 (not (contains!1174 lt!87030 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53465 (= lt!87030 e!116179)))

(declare-fun c!31560 () Bool)

(assert (=> d!53465 (= c!31560 (bvsge #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> d!53465 (validMask!0 (mask!8535 thiss!1248))))

(assert (=> d!53465 (= (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) lt!87030)))

(declare-fun b!176079 () Bool)

(declare-fun isEmpty!449 (ListLongMap!2183) Bool)

(assert (=> b!176079 (= e!116181 (isEmpty!449 lt!87030))))

(declare-fun b!176080 () Bool)

(assert (=> b!176080 (= e!116181 (= lt!87030 (getCurrentListMapNoExtraKeys!157 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3627 thiss!1248))))))

(declare-fun b!176081 () Bool)

(assert (=> b!176081 (= e!116185 call!17815)))

(declare-fun b!176082 () Bool)

(assert (=> b!176082 (= e!116179 e!116185)))

(declare-fun c!31559 () Bool)

(assert (=> b!176082 (= c!31559 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176083 () Bool)

(assert (=> b!176083 (= e!116182 e!116183)))

(declare-fun c!31562 () Bool)

(assert (=> b!176083 (= c!31562 e!116184)))

(declare-fun res!83422 () Bool)

(assert (=> b!176083 (=> (not res!83422) (not e!116184))))

(assert (=> b!176083 (= res!83422 (bvslt #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (= (and d!53465 c!31560) b!176074))

(assert (= (and d!53465 (not c!31560)) b!176082))

(assert (= (and b!176082 c!31559) b!176077))

(assert (= (and b!176082 (not c!31559)) b!176081))

(assert (= (or b!176077 b!176081) bm!17812))

(assert (= (and d!53465 res!83424) b!176073))

(assert (= (and b!176073 res!83423) b!176083))

(assert (= (and b!176083 res!83422) b!176076))

(assert (= (and b!176083 c!31562) b!176078))

(assert (= (and b!176083 (not c!31562)) b!176075))

(assert (= (and b!176078 res!83425) b!176072))

(assert (= (and b!176075 c!31561) b!176080))

(assert (= (and b!176075 (not c!31561)) b!176079))

(declare-fun b_lambda!7013 () Bool)

(assert (=> (not b_lambda!7013) (not b!176072)))

(assert (=> b!176072 t!7051))

(declare-fun b_and!10815 () Bool)

(assert (= b_and!10813 (and (=> t!7051 result!4615) b_and!10815)))

(declare-fun b_lambda!7015 () Bool)

(assert (=> (not b_lambda!7015) (not b!176077)))

(assert (=> b!176077 t!7051))

(declare-fun b_and!10817 () Bool)

(assert (= b_and!10815 (and (=> t!7051 result!4615) b_and!10817)))

(declare-fun m!204433 () Bool)

(assert (=> b!176079 m!204433))

(assert (=> b!176082 m!204293))

(assert (=> b!176082 m!204293))

(assert (=> b!176082 m!204295))

(assert (=> b!176077 m!204341))

(declare-fun m!204435 () Bool)

(assert (=> b!176077 m!204435))

(assert (=> b!176077 m!204339))

(assert (=> b!176077 m!204341))

(assert (=> b!176077 m!204343))

(declare-fun m!204437 () Bool)

(assert (=> b!176077 m!204437))

(declare-fun m!204439 () Bool)

(assert (=> b!176077 m!204439))

(assert (=> b!176077 m!204339))

(assert (=> b!176077 m!204435))

(declare-fun m!204441 () Bool)

(assert (=> b!176077 m!204441))

(assert (=> b!176077 m!204293))

(assert (=> b!176076 m!204293))

(assert (=> b!176076 m!204293))

(assert (=> b!176076 m!204295))

(assert (=> b!176078 m!204293))

(assert (=> b!176078 m!204293))

(declare-fun m!204443 () Bool)

(assert (=> b!176078 m!204443))

(declare-fun m!204445 () Bool)

(assert (=> b!176080 m!204445))

(declare-fun m!204447 () Bool)

(assert (=> b!176073 m!204447))

(declare-fun m!204449 () Bool)

(assert (=> d!53465 m!204449))

(assert (=> d!53465 m!204239))

(assert (=> bm!17812 m!204445))

(assert (=> b!176072 m!204341))

(assert (=> b!176072 m!204293))

(declare-fun m!204451 () Bool)

(assert (=> b!176072 m!204451))

(assert (=> b!176072 m!204339))

(assert (=> b!176072 m!204341))

(assert (=> b!176072 m!204343))

(assert (=> b!176072 m!204293))

(assert (=> b!176072 m!204339))

(assert (=> b!175959 d!53465))

(declare-fun d!53467 () Bool)

(assert (=> d!53467 (= (apply!136 (+!248 lt!86959 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))) lt!86963) (apply!136 lt!86959 lt!86963))))

(declare-fun lt!87033 () Unit!5371)

(assert (=> d!53467 (= lt!87033 (choose!950 lt!86959 lt!86978 (minValue!3468 thiss!1248) lt!86963))))

(declare-fun e!116186 () Bool)

(assert (=> d!53467 e!116186))

(declare-fun res!83426 () Bool)

(assert (=> d!53467 (=> (not res!83426) (not e!116186))))

(assert (=> d!53467 (= res!83426 (contains!1174 lt!86959 lt!86963))))

(assert (=> d!53467 (= (addApplyDifferent!112 lt!86959 lt!86978 (minValue!3468 thiss!1248) lt!86963) lt!87033)))

(declare-fun b!176084 () Bool)

(assert (=> b!176084 (= e!116186 (not (= lt!86963 lt!86978)))))

(assert (= (and d!53467 res!83426) b!176084))

(declare-fun m!204453 () Bool)

(assert (=> d!53467 m!204453))

(assert (=> d!53467 m!204319))

(declare-fun m!204455 () Bool)

(assert (=> d!53467 m!204455))

(assert (=> d!53467 m!204319))

(assert (=> d!53467 m!204325))

(assert (=> d!53467 m!204323))

(assert (=> b!175959 d!53467))

(declare-fun d!53469 () Bool)

(declare-fun e!116187 () Bool)

(assert (=> d!53469 e!116187))

(declare-fun res!83428 () Bool)

(assert (=> d!53469 (=> (not res!83428) (not e!116187))))

(declare-fun lt!87034 () ListLongMap!2183)

(assert (=> d!53469 (= res!83428 (contains!1174 lt!87034 (_1!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))))))

(declare-fun lt!87036 () List!2234)

(assert (=> d!53469 (= lt!87034 (ListLongMap!2184 lt!87036))))

(declare-fun lt!87035 () Unit!5371)

(declare-fun lt!87037 () Unit!5371)

(assert (=> d!53469 (= lt!87035 lt!87037)))

(assert (=> d!53469 (= (getValueByKey!189 lt!87036 (_1!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))))))

(assert (=> d!53469 (= lt!87037 (lemmaContainsTupThenGetReturnValue!103 lt!87036 (_1!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))))))

(assert (=> d!53469 (= lt!87036 (insertStrictlySorted!106 (toList!1107 lt!86972) (_1!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))))))

(assert (=> d!53469 (= (+!248 lt!86972 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))) lt!87034)))

(declare-fun b!176085 () Bool)

(declare-fun res!83427 () Bool)

(assert (=> b!176085 (=> (not res!83427) (not e!116187))))

(assert (=> b!176085 (= res!83427 (= (getValueByKey!189 (toList!1107 lt!87034) (_1!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))))))))

(declare-fun b!176086 () Bool)

(assert (=> b!176086 (= e!116187 (contains!1177 (toList!1107 lt!87034) (tuple2!3265 lt!86973 (minValue!3468 thiss!1248))))))

(assert (= (and d!53469 res!83428) b!176085))

(assert (= (and b!176085 res!83427) b!176086))

(declare-fun m!204457 () Bool)

(assert (=> d!53469 m!204457))

(declare-fun m!204459 () Bool)

(assert (=> d!53469 m!204459))

(declare-fun m!204461 () Bool)

(assert (=> d!53469 m!204461))

(declare-fun m!204463 () Bool)

(assert (=> d!53469 m!204463))

(declare-fun m!204465 () Bool)

(assert (=> b!176085 m!204465))

(declare-fun m!204467 () Bool)

(assert (=> b!176086 m!204467))

(assert (=> b!175959 d!53469))

(declare-fun d!53471 () Bool)

(assert (=> d!53471 (= (apply!136 (+!248 lt!86964 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))) lt!86977) (apply!136 lt!86964 lt!86977))))

(declare-fun lt!87038 () Unit!5371)

(assert (=> d!53471 (= lt!87038 (choose!950 lt!86964 lt!86979 (zeroValue!3468 thiss!1248) lt!86977))))

(declare-fun e!116188 () Bool)

(assert (=> d!53471 e!116188))

(declare-fun res!83429 () Bool)

(assert (=> d!53471 (=> (not res!83429) (not e!116188))))

(assert (=> d!53471 (= res!83429 (contains!1174 lt!86964 lt!86977))))

(assert (=> d!53471 (= (addApplyDifferent!112 lt!86964 lt!86979 (zeroValue!3468 thiss!1248) lt!86977) lt!87038)))

(declare-fun b!176087 () Bool)

(assert (=> b!176087 (= e!116188 (not (= lt!86977 lt!86979)))))

(assert (= (and d!53471 res!83429) b!176087))

(declare-fun m!204469 () Bool)

(assert (=> d!53471 m!204469))

(assert (=> d!53471 m!204309))

(declare-fun m!204471 () Bool)

(assert (=> d!53471 m!204471))

(assert (=> d!53471 m!204309))

(assert (=> d!53471 m!204311))

(assert (=> d!53471 m!204329))

(assert (=> b!175959 d!53471))

(declare-fun d!53473 () Bool)

(declare-fun e!116189 () Bool)

(assert (=> d!53473 e!116189))

(declare-fun res!83431 () Bool)

(assert (=> d!53473 (=> (not res!83431) (not e!116189))))

(declare-fun lt!87039 () ListLongMap!2183)

(assert (=> d!53473 (= res!83431 (contains!1174 lt!87039 (_1!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))))))

(declare-fun lt!87041 () List!2234)

(assert (=> d!53473 (= lt!87039 (ListLongMap!2184 lt!87041))))

(declare-fun lt!87040 () Unit!5371)

(declare-fun lt!87042 () Unit!5371)

(assert (=> d!53473 (= lt!87040 lt!87042)))

(assert (=> d!53473 (= (getValueByKey!189 lt!87041 (_1!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))))))

(assert (=> d!53473 (= lt!87042 (lemmaContainsTupThenGetReturnValue!103 lt!87041 (_1!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))))))

(assert (=> d!53473 (= lt!87041 (insertStrictlySorted!106 (toList!1107 lt!86959) (_1!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))))))

(assert (=> d!53473 (= (+!248 lt!86959 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))) lt!87039)))

(declare-fun b!176088 () Bool)

(declare-fun res!83430 () Bool)

(assert (=> b!176088 (=> (not res!83430) (not e!116189))))

(assert (=> b!176088 (= res!83430 (= (getValueByKey!189 (toList!1107 lt!87039) (_1!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))))))))

(declare-fun b!176089 () Bool)

(assert (=> b!176089 (= e!116189 (contains!1177 (toList!1107 lt!87039) (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))))))

(assert (= (and d!53473 res!83431) b!176088))

(assert (= (and b!176088 res!83430) b!176089))

(declare-fun m!204473 () Bool)

(assert (=> d!53473 m!204473))

(declare-fun m!204475 () Bool)

(assert (=> d!53473 m!204475))

(declare-fun m!204477 () Bool)

(assert (=> d!53473 m!204477))

(declare-fun m!204479 () Bool)

(assert (=> d!53473 m!204479))

(declare-fun m!204481 () Bool)

(assert (=> b!176088 m!204481))

(declare-fun m!204483 () Bool)

(assert (=> b!176089 m!204483))

(assert (=> b!175959 d!53473))

(declare-fun d!53475 () Bool)

(assert (=> d!53475 (= (apply!136 lt!86964 lt!86977) (get!1993 (getValueByKey!189 (toList!1107 lt!86964) lt!86977)))))

(declare-fun bs!7240 () Bool)

(assert (= bs!7240 d!53475))

(declare-fun m!204485 () Bool)

(assert (=> bs!7240 m!204485))

(assert (=> bs!7240 m!204485))

(declare-fun m!204487 () Bool)

(assert (=> bs!7240 m!204487))

(assert (=> b!175959 d!53475))

(declare-fun d!53477 () Bool)

(assert (=> d!53477 (= (apply!136 (+!248 lt!86959 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248))) lt!86963) (get!1993 (getValueByKey!189 (toList!1107 (+!248 lt!86959 (tuple2!3265 lt!86978 (minValue!3468 thiss!1248)))) lt!86963)))))

(declare-fun bs!7241 () Bool)

(assert (= bs!7241 d!53477))

(declare-fun m!204489 () Bool)

(assert (=> bs!7241 m!204489))

(assert (=> bs!7241 m!204489))

(declare-fun m!204491 () Bool)

(assert (=> bs!7241 m!204491))

(assert (=> b!175959 d!53477))

(declare-fun d!53479 () Bool)

(assert (=> d!53479 (contains!1174 (+!248 lt!86970 (tuple2!3265 lt!86961 (zeroValue!3468 thiss!1248))) lt!86962)))

(declare-fun lt!87045 () Unit!5371)

(declare-fun choose!951 (ListLongMap!2183 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5371)

(assert (=> d!53479 (= lt!87045 (choose!951 lt!86970 lt!86961 (zeroValue!3468 thiss!1248) lt!86962))))

(assert (=> d!53479 (contains!1174 lt!86970 lt!86962)))

(assert (=> d!53479 (= (addStillContains!112 lt!86970 lt!86961 (zeroValue!3468 thiss!1248) lt!86962) lt!87045)))

(declare-fun bs!7242 () Bool)

(assert (= bs!7242 d!53479))

(assert (=> bs!7242 m!204333))

(assert (=> bs!7242 m!204333))

(assert (=> bs!7242 m!204337))

(declare-fun m!204493 () Bool)

(assert (=> bs!7242 m!204493))

(declare-fun m!204495 () Bool)

(assert (=> bs!7242 m!204495))

(assert (=> b!175959 d!53479))

(declare-fun d!53481 () Bool)

(declare-fun e!116190 () Bool)

(assert (=> d!53481 e!116190))

(declare-fun res!83433 () Bool)

(assert (=> d!53481 (=> (not res!83433) (not e!116190))))

(declare-fun lt!87046 () ListLongMap!2183)

(assert (=> d!53481 (= res!83433 (contains!1174 lt!87046 (_1!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))))))

(declare-fun lt!87048 () List!2234)

(assert (=> d!53481 (= lt!87046 (ListLongMap!2184 lt!87048))))

(declare-fun lt!87047 () Unit!5371)

(declare-fun lt!87049 () Unit!5371)

(assert (=> d!53481 (= lt!87047 lt!87049)))

(assert (=> d!53481 (= (getValueByKey!189 lt!87048 (_1!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53481 (= lt!87049 (lemmaContainsTupThenGetReturnValue!103 lt!87048 (_1!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53481 (= lt!87048 (insertStrictlySorted!106 (toList!1107 lt!86964) (_1!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))) (_2!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53481 (= (+!248 lt!86964 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))) lt!87046)))

(declare-fun b!176091 () Bool)

(declare-fun res!83432 () Bool)

(assert (=> b!176091 (=> (not res!83432) (not e!116190))))

(assert (=> b!176091 (= res!83432 (= (getValueByKey!189 (toList!1107 lt!87046) (_1!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248)))) (Some!194 (_2!1643 (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))))))))

(declare-fun b!176092 () Bool)

(assert (=> b!176092 (= e!116190 (contains!1177 (toList!1107 lt!87046) (tuple2!3265 lt!86979 (zeroValue!3468 thiss!1248))))))

(assert (= (and d!53481 res!83433) b!176091))

(assert (= (and b!176091 res!83432) b!176092))

(declare-fun m!204497 () Bool)

(assert (=> d!53481 m!204497))

(declare-fun m!204499 () Bool)

(assert (=> d!53481 m!204499))

(declare-fun m!204501 () Bool)

(assert (=> d!53481 m!204501))

(declare-fun m!204503 () Bool)

(assert (=> d!53481 m!204503))

(declare-fun m!204505 () Bool)

(assert (=> b!176091 m!204505))

(declare-fun m!204507 () Bool)

(assert (=> b!176092 m!204507))

(assert (=> b!175959 d!53481))

(declare-fun d!53483 () Bool)

(assert (=> d!53483 (= (apply!136 lt!86966 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)) (get!1993 (getValueByKey!189 (toList!1107 lt!86966) (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7243 () Bool)

(assert (= bs!7243 d!53483))

(assert (=> bs!7243 m!204293))

(declare-fun m!204509 () Bool)

(assert (=> bs!7243 m!204509))

(assert (=> bs!7243 m!204509))

(declare-fun m!204511 () Bool)

(assert (=> bs!7243 m!204511))

(assert (=> b!175966 d!53483))

(declare-fun d!53485 () Bool)

(declare-fun c!31565 () Bool)

(assert (=> d!53485 (= c!31565 ((_ is ValueCellFull!1715) (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116193 () V!5137)

(assert (=> d!53485 (= (get!1992 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!116193)))

(declare-fun b!176097 () Bool)

(declare-fun get!1994 (ValueCell!1715 V!5137) V!5137)

(assert (=> b!176097 (= e!116193 (get!1994 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176098 () Bool)

(declare-fun get!1995 (ValueCell!1715 V!5137) V!5137)

(assert (=> b!176098 (= e!116193 (get!1995 (select (arr!3491 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!470 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53485 c!31565) b!176097))

(assert (= (and d!53485 (not c!31565)) b!176098))

(assert (=> b!176097 m!204339))

(assert (=> b!176097 m!204341))

(declare-fun m!204513 () Bool)

(assert (=> b!176097 m!204513))

(assert (=> b!176098 m!204339))

(assert (=> b!176098 m!204341))

(declare-fun m!204515 () Bool)

(assert (=> b!176098 m!204515))

(assert (=> b!175966 d!53485))

(declare-fun b!176107 () Bool)

(declare-fun e!116199 () (_ BitVec 32))

(declare-fun e!116198 () (_ BitVec 32))

(assert (=> b!176107 (= e!116199 e!116198)))

(declare-fun c!31570 () Bool)

(assert (=> b!176107 (= c!31570 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176108 () Bool)

(declare-fun call!17818 () (_ BitVec 32))

(assert (=> b!176108 (= e!116198 call!17818)))

(declare-fun bm!17815 () Bool)

(assert (=> bm!17815 (= call!17818 (arrayCountValidKeys!0 (_keys!5483 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun d!53487 () Bool)

(declare-fun lt!87052 () (_ BitVec 32))

(assert (=> d!53487 (and (bvsge lt!87052 #b00000000000000000000000000000000) (bvsle lt!87052 (bvsub (size!3794 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53487 (= lt!87052 e!116199)))

(declare-fun c!31571 () Bool)

(assert (=> d!53487 (= c!31571 (bvsge #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> d!53487 (and (bvsle #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3794 (_keys!5483 thiss!1248)) (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> d!53487 (= (arrayCountValidKeys!0 (_keys!5483 thiss!1248) #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))) lt!87052)))

(declare-fun b!176109 () Bool)

(assert (=> b!176109 (= e!116198 (bvadd #b00000000000000000000000000000001 call!17818))))

(declare-fun b!176110 () Bool)

(assert (=> b!176110 (= e!116199 #b00000000000000000000000000000000)))

(assert (= (and d!53487 c!31571) b!176110))

(assert (= (and d!53487 (not c!31571)) b!176107))

(assert (= (and b!176107 c!31570) b!176109))

(assert (= (and b!176107 (not c!31570)) b!176108))

(assert (= (or b!176109 b!176108) bm!17815))

(assert (=> b!176107 m!204293))

(assert (=> b!176107 m!204293))

(assert (=> b!176107 m!204295))

(declare-fun m!204517 () Bool)

(assert (=> bm!17815 m!204517))

(assert (=> b!176001 d!53487))

(declare-fun d!53489 () Bool)

(declare-fun e!116200 () Bool)

(assert (=> d!53489 e!116200))

(declare-fun res!83435 () Bool)

(assert (=> d!53489 (=> (not res!83435) (not e!116200))))

(declare-fun lt!87053 () ListLongMap!2183)

(assert (=> d!53489 (= res!83435 (contains!1174 lt!87053 (_1!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(declare-fun lt!87055 () List!2234)

(assert (=> d!53489 (= lt!87053 (ListLongMap!2184 lt!87055))))

(declare-fun lt!87054 () Unit!5371)

(declare-fun lt!87056 () Unit!5371)

(assert (=> d!53489 (= lt!87054 lt!87056)))

(assert (=> d!53489 (= (getValueByKey!189 lt!87055 (_1!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))) (Some!194 (_2!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(assert (=> d!53489 (= lt!87056 (lemmaContainsTupThenGetReturnValue!103 lt!87055 (_1!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (_2!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(assert (=> d!53489 (= lt!87055 (insertStrictlySorted!106 (toList!1107 (ite c!31532 call!17806 (ite c!31535 call!17809 call!17803))) (_1!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (_2!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(assert (=> d!53489 (= (+!248 (ite c!31532 call!17806 (ite c!31535 call!17809 call!17803)) (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) lt!87053)))

(declare-fun b!176111 () Bool)

(declare-fun res!83434 () Bool)

(assert (=> b!176111 (=> (not res!83434) (not e!116200))))

(assert (=> b!176111 (= res!83434 (= (getValueByKey!189 (toList!1107 lt!87053) (_1!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))) (Some!194 (_2!1643 (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))))

(declare-fun b!176112 () Bool)

(assert (=> b!176112 (= e!116200 (contains!1177 (toList!1107 lt!87053) (ite (or c!31532 c!31535) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(assert (= (and d!53489 res!83435) b!176111))

(assert (= (and b!176111 res!83434) b!176112))

(declare-fun m!204519 () Bool)

(assert (=> d!53489 m!204519))

(declare-fun m!204521 () Bool)

(assert (=> d!53489 m!204521))

(declare-fun m!204523 () Bool)

(assert (=> d!53489 m!204523))

(declare-fun m!204525 () Bool)

(assert (=> d!53489 m!204525))

(declare-fun m!204527 () Bool)

(assert (=> b!176111 m!204527))

(declare-fun m!204529 () Bool)

(assert (=> b!176112 m!204529))

(assert (=> bm!17800 d!53489))

(declare-fun d!53491 () Bool)

(declare-fun e!116201 () Bool)

(assert (=> d!53491 e!116201))

(declare-fun res!83436 () Bool)

(assert (=> d!53491 (=> res!83436 e!116201)))

(declare-fun lt!87058 () Bool)

(assert (=> d!53491 (= res!83436 (not lt!87058))))

(declare-fun lt!87059 () Bool)

(assert (=> d!53491 (= lt!87058 lt!87059)))

(declare-fun lt!87057 () Unit!5371)

(declare-fun e!116202 () Unit!5371)

(assert (=> d!53491 (= lt!87057 e!116202)))

(declare-fun c!31572 () Bool)

(assert (=> d!53491 (= c!31572 lt!87059)))

(assert (=> d!53491 (= lt!87059 (containsKey!193 (toList!1107 lt!86966) (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53491 (= (contains!1174 lt!86966 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)) lt!87058)))

(declare-fun b!176113 () Bool)

(declare-fun lt!87060 () Unit!5371)

(assert (=> b!176113 (= e!116202 lt!87060)))

(assert (=> b!176113 (= lt!87060 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1107 lt!86966) (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176113 (isDefined!143 (getValueByKey!189 (toList!1107 lt!86966) (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176114 () Bool)

(declare-fun Unit!5376 () Unit!5371)

(assert (=> b!176114 (= e!116202 Unit!5376)))

(declare-fun b!176115 () Bool)

(assert (=> b!176115 (= e!116201 (isDefined!143 (getValueByKey!189 (toList!1107 lt!86966) (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53491 c!31572) b!176113))

(assert (= (and d!53491 (not c!31572)) b!176114))

(assert (= (and d!53491 (not res!83436)) b!176115))

(assert (=> d!53491 m!204293))

(declare-fun m!204531 () Bool)

(assert (=> d!53491 m!204531))

(assert (=> b!176113 m!204293))

(declare-fun m!204533 () Bool)

(assert (=> b!176113 m!204533))

(assert (=> b!176113 m!204293))

(assert (=> b!176113 m!204509))

(assert (=> b!176113 m!204509))

(declare-fun m!204535 () Bool)

(assert (=> b!176113 m!204535))

(assert (=> b!176115 m!204293))

(assert (=> b!176115 m!204509))

(assert (=> b!176115 m!204509))

(assert (=> b!176115 m!204535))

(assert (=> b!175965 d!53491))

(declare-fun b!176125 () Bool)

(declare-fun res!83446 () Bool)

(declare-fun e!116205 () Bool)

(assert (=> b!176125 (=> (not res!83446) (not e!116205))))

(declare-fun size!3800 (LongMapFixedSize!2338) (_ BitVec 32))

(assert (=> b!176125 (= res!83446 (bvsge (size!3800 thiss!1248) (_size!1218 thiss!1248)))))

(declare-fun b!176127 () Bool)

(assert (=> b!176127 (= e!116205 (and (bvsge (extraKeys!3364 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3364 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1218 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!53493 () Bool)

(declare-fun res!83445 () Bool)

(assert (=> d!53493 (=> (not res!83445) (not e!116205))))

(assert (=> d!53493 (= res!83445 (validMask!0 (mask!8535 thiss!1248)))))

(assert (=> d!53493 (= (simpleValid!150 thiss!1248) e!116205)))

(declare-fun b!176124 () Bool)

(declare-fun res!83448 () Bool)

(assert (=> b!176124 (=> (not res!83448) (not e!116205))))

(assert (=> b!176124 (= res!83448 (and (= (size!3795 (_values!3610 thiss!1248)) (bvadd (mask!8535 thiss!1248) #b00000000000000000000000000000001)) (= (size!3794 (_keys!5483 thiss!1248)) (size!3795 (_values!3610 thiss!1248))) (bvsge (_size!1218 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1218 thiss!1248) (bvadd (mask!8535 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!176126 () Bool)

(declare-fun res!83447 () Bool)

(assert (=> b!176126 (=> (not res!83447) (not e!116205))))

(assert (=> b!176126 (= res!83447 (= (size!3800 thiss!1248) (bvadd (_size!1218 thiss!1248) (bvsdiv (bvadd (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!53493 res!83445) b!176124))

(assert (= (and b!176124 res!83448) b!176125))

(assert (= (and b!176125 res!83446) b!176126))

(assert (= (and b!176126 res!83447) b!176127))

(declare-fun m!204537 () Bool)

(assert (=> b!176125 m!204537))

(assert (=> d!53493 m!204239))

(assert (=> b!176126 m!204537))

(assert (=> d!53443 d!53493))

(declare-fun d!53495 () Bool)

(declare-fun res!83453 () Bool)

(declare-fun e!116214 () Bool)

(assert (=> d!53495 (=> res!83453 e!116214)))

(assert (=> d!53495 (= res!83453 (bvsge #b00000000000000000000000000000000 (size!3794 (_keys!5483 thiss!1248))))))

(assert (=> d!53495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)) e!116214)))

(declare-fun b!176136 () Bool)

(declare-fun e!116212 () Bool)

(declare-fun call!17821 () Bool)

(assert (=> b!176136 (= e!116212 call!17821)))

(declare-fun b!176137 () Bool)

(declare-fun e!116213 () Bool)

(assert (=> b!176137 (= e!116214 e!116213)))

(declare-fun c!31575 () Bool)

(assert (=> b!176137 (= c!31575 (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176138 () Bool)

(assert (=> b!176138 (= e!116213 e!116212)))

(declare-fun lt!87068 () (_ BitVec 64))

(assert (=> b!176138 (= lt!87068 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87067 () Unit!5371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7357 (_ BitVec 64) (_ BitVec 32)) Unit!5371)

(assert (=> b!176138 (= lt!87067 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5483 thiss!1248) lt!87068 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176138 (arrayContainsKey!0 (_keys!5483 thiss!1248) lt!87068 #b00000000000000000000000000000000)))

(declare-fun lt!87069 () Unit!5371)

(assert (=> b!176138 (= lt!87069 lt!87067)))

(declare-fun res!83454 () Bool)

(assert (=> b!176138 (= res!83454 (= (seekEntryOrOpen!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000) (_keys!5483 thiss!1248) (mask!8535 thiss!1248)) (Found!565 #b00000000000000000000000000000000)))))

(assert (=> b!176138 (=> (not res!83454) (not e!116212))))

(declare-fun b!176139 () Bool)

(assert (=> b!176139 (= e!116213 call!17821)))

(declare-fun bm!17818 () Bool)

(assert (=> bm!17818 (= call!17821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5483 thiss!1248) (mask!8535 thiss!1248)))))

(assert (= (and d!53495 (not res!83453)) b!176137))

(assert (= (and b!176137 c!31575) b!176138))

(assert (= (and b!176137 (not c!31575)) b!176139))

(assert (= (and b!176138 res!83454) b!176136))

(assert (= (or b!176136 b!176139) bm!17818))

(assert (=> b!176137 m!204293))

(assert (=> b!176137 m!204293))

(assert (=> b!176137 m!204295))

(assert (=> b!176138 m!204293))

(declare-fun m!204539 () Bool)

(assert (=> b!176138 m!204539))

(declare-fun m!204541 () Bool)

(assert (=> b!176138 m!204541))

(assert (=> b!176138 m!204293))

(declare-fun m!204543 () Bool)

(assert (=> b!176138 m!204543))

(declare-fun m!204545 () Bool)

(assert (=> bm!17818 m!204545))

(assert (=> b!176002 d!53495))

(declare-fun d!53497 () Bool)

(assert (=> d!53497 (= (apply!136 lt!86966 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1993 (getValueByKey!189 (toList!1107 lt!86966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7244 () Bool)

(assert (= bs!7244 d!53497))

(declare-fun m!204547 () Bool)

(assert (=> bs!7244 m!204547))

(assert (=> bs!7244 m!204547))

(declare-fun m!204549 () Bool)

(assert (=> bs!7244 m!204549))

(assert (=> b!175972 d!53497))

(declare-fun d!53499 () Bool)

(declare-fun e!116215 () Bool)

(assert (=> d!53499 e!116215))

(declare-fun res!83455 () Bool)

(assert (=> d!53499 (=> res!83455 e!116215)))

(declare-fun lt!87071 () Bool)

(assert (=> d!53499 (= res!83455 (not lt!87071))))

(declare-fun lt!87072 () Bool)

(assert (=> d!53499 (= lt!87071 lt!87072)))

(declare-fun lt!87070 () Unit!5371)

(declare-fun e!116216 () Unit!5371)

(assert (=> d!53499 (= lt!87070 e!116216)))

(declare-fun c!31576 () Bool)

(assert (=> d!53499 (= c!31576 lt!87072)))

(assert (=> d!53499 (= lt!87072 (containsKey!193 (toList!1107 lt!86966) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53499 (= (contains!1174 lt!86966 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87071)))

(declare-fun b!176140 () Bool)

(declare-fun lt!87073 () Unit!5371)

(assert (=> b!176140 (= e!116216 lt!87073)))

(assert (=> b!176140 (= lt!87073 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1107 lt!86966) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176140 (isDefined!143 (getValueByKey!189 (toList!1107 lt!86966) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176141 () Bool)

(declare-fun Unit!5377 () Unit!5371)

(assert (=> b!176141 (= e!116216 Unit!5377)))

(declare-fun b!176142 () Bool)

(assert (=> b!176142 (= e!116215 (isDefined!143 (getValueByKey!189 (toList!1107 lt!86966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53499 c!31576) b!176140))

(assert (= (and d!53499 (not c!31576)) b!176141))

(assert (= (and d!53499 (not res!83455)) b!176142))

(declare-fun m!204551 () Bool)

(assert (=> d!53499 m!204551))

(declare-fun m!204553 () Bool)

(assert (=> b!176140 m!204553))

(declare-fun m!204555 () Bool)

(assert (=> b!176140 m!204555))

(assert (=> b!176140 m!204555))

(declare-fun m!204557 () Bool)

(assert (=> b!176140 m!204557))

(assert (=> b!176142 m!204555))

(assert (=> b!176142 m!204555))

(assert (=> b!176142 m!204557))

(assert (=> bm!17805 d!53499))

(declare-fun b!176155 () Bool)

(declare-fun e!116225 () SeekEntryResult!565)

(assert (=> b!176155 (= e!116225 Undefined!565)))

(declare-fun d!53501 () Bool)

(declare-fun lt!87078 () SeekEntryResult!565)

(assert (=> d!53501 (and (or ((_ is Undefined!565) lt!87078) (not ((_ is Found!565) lt!87078)) (and (bvsge (index!4429 lt!87078) #b00000000000000000000000000000000) (bvslt (index!4429 lt!87078) (size!3794 (_keys!5483 thiss!1248))))) (or ((_ is Undefined!565) lt!87078) ((_ is Found!565) lt!87078) (not ((_ is MissingVacant!565) lt!87078)) (not (= (index!4431 lt!87078) (index!4430 lt!86987))) (and (bvsge (index!4431 lt!87078) #b00000000000000000000000000000000) (bvslt (index!4431 lt!87078) (size!3794 (_keys!5483 thiss!1248))))) (or ((_ is Undefined!565) lt!87078) (ite ((_ is Found!565) lt!87078) (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4429 lt!87078)) key!828) (and ((_ is MissingVacant!565) lt!87078) (= (index!4431 lt!87078) (index!4430 lt!86987)) (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4431 lt!87078)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53501 (= lt!87078 e!116225)))

(declare-fun c!31585 () Bool)

(assert (=> d!53501 (= c!31585 (bvsge (x!19348 lt!86987) #b01111111111111111111111111111110))))

(declare-fun lt!87079 () (_ BitVec 64))

(assert (=> d!53501 (= lt!87079 (select (arr!3490 (_keys!5483 thiss!1248)) (index!4430 lt!86987)))))

(assert (=> d!53501 (validMask!0 (mask!8535 thiss!1248))))

(assert (=> d!53501 (= (seekKeyOrZeroReturnVacant!0 (x!19348 lt!86987) (index!4430 lt!86987) (index!4430 lt!86987) key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)) lt!87078)))

(declare-fun b!176156 () Bool)

(declare-fun e!116224 () SeekEntryResult!565)

(assert (=> b!176156 (= e!116224 (Found!565 (index!4430 lt!86987)))))

(declare-fun b!176157 () Bool)

(assert (=> b!176157 (= e!116225 e!116224)))

(declare-fun c!31583 () Bool)

(assert (=> b!176157 (= c!31583 (= lt!87079 key!828))))

(declare-fun e!116223 () SeekEntryResult!565)

(declare-fun b!176158 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176158 (= e!116223 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19348 lt!86987) #b00000000000000000000000000000001) (nextIndex!0 (index!4430 lt!86987) (x!19348 lt!86987) (mask!8535 thiss!1248)) (index!4430 lt!86987) key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)))))

(declare-fun b!176159 () Bool)

(declare-fun c!31584 () Bool)

(assert (=> b!176159 (= c!31584 (= lt!87079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176159 (= e!116224 e!116223)))

(declare-fun b!176160 () Bool)

(assert (=> b!176160 (= e!116223 (MissingVacant!565 (index!4430 lt!86987)))))

(assert (= (and d!53501 c!31585) b!176155))

(assert (= (and d!53501 (not c!31585)) b!176157))

(assert (= (and b!176157 c!31583) b!176156))

(assert (= (and b!176157 (not c!31583)) b!176159))

(assert (= (and b!176159 c!31584) b!176160))

(assert (= (and b!176159 (not c!31584)) b!176158))

(declare-fun m!204559 () Bool)

(assert (=> d!53501 m!204559))

(declare-fun m!204561 () Bool)

(assert (=> d!53501 m!204561))

(assert (=> d!53501 m!204363))

(assert (=> d!53501 m!204239))

(declare-fun m!204563 () Bool)

(assert (=> b!176158 m!204563))

(assert (=> b!176158 m!204563))

(declare-fun m!204565 () Bool)

(assert (=> b!176158 m!204565))

(assert (=> b!175990 d!53501))

(assert (=> bm!17804 d!53465))

(declare-fun d!53503 () Bool)

(assert (=> d!53503 (= (validKeyInArray!0 (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3490 (_keys!5483 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175970 d!53503))

(declare-fun d!53505 () Bool)

(assert (=> d!53505 (= (apply!136 lt!86966 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1993 (getValueByKey!189 (toList!1107 lt!86966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7245 () Bool)

(assert (= bs!7245 d!53505))

(assert (=> bs!7245 m!204555))

(assert (=> bs!7245 m!204555))

(declare-fun m!204567 () Bool)

(assert (=> bs!7245 m!204567))

(assert (=> b!175954 d!53505))

(declare-fun b!176179 () Bool)

(declare-fun lt!87084 () SeekEntryResult!565)

(assert (=> b!176179 (and (bvsge (index!4430 lt!87084) #b00000000000000000000000000000000) (bvslt (index!4430 lt!87084) (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun e!116240 () Bool)

(assert (=> b!176179 (= e!116240 (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4430 lt!87084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176180 () Bool)

(assert (=> b!176180 (and (bvsge (index!4430 lt!87084) #b00000000000000000000000000000000) (bvslt (index!4430 lt!87084) (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun res!83463 () Bool)

(assert (=> b!176180 (= res!83463 (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4430 lt!87084)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176180 (=> res!83463 e!116240)))

(declare-fun b!176181 () Bool)

(declare-fun e!116239 () SeekEntryResult!565)

(declare-fun e!116238 () SeekEntryResult!565)

(assert (=> b!176181 (= e!116239 e!116238)))

(declare-fun c!31593 () Bool)

(declare-fun lt!87085 () (_ BitVec 64))

(assert (=> b!176181 (= c!31593 (or (= lt!87085 key!828) (= (bvadd lt!87085 lt!87085) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53507 () Bool)

(declare-fun e!116237 () Bool)

(assert (=> d!53507 e!116237))

(declare-fun c!31594 () Bool)

(assert (=> d!53507 (= c!31594 (and ((_ is Intermediate!565) lt!87084) (undefined!1377 lt!87084)))))

(assert (=> d!53507 (= lt!87084 e!116239)))

(declare-fun c!31592 () Bool)

(assert (=> d!53507 (= c!31592 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53507 (= lt!87085 (select (arr!3490 (_keys!5483 thiss!1248)) (toIndex!0 key!828 (mask!8535 thiss!1248))))))

(assert (=> d!53507 (validMask!0 (mask!8535 thiss!1248))))

(assert (=> d!53507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8535 thiss!1248)) key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)) lt!87084)))

(declare-fun b!176182 () Bool)

(assert (=> b!176182 (and (bvsge (index!4430 lt!87084) #b00000000000000000000000000000000) (bvslt (index!4430 lt!87084) (size!3794 (_keys!5483 thiss!1248))))))

(declare-fun res!83464 () Bool)

(assert (=> b!176182 (= res!83464 (= (select (arr!3490 (_keys!5483 thiss!1248)) (index!4430 lt!87084)) key!828))))

(assert (=> b!176182 (=> res!83464 e!116240)))

(declare-fun e!116236 () Bool)

(assert (=> b!176182 (= e!116236 e!116240)))

(declare-fun b!176183 () Bool)

(assert (=> b!176183 (= e!116238 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8535 thiss!1248)) #b00000000000000000000000000000000 (mask!8535 thiss!1248)) key!828 (_keys!5483 thiss!1248) (mask!8535 thiss!1248)))))

(declare-fun b!176184 () Bool)

(assert (=> b!176184 (= e!116237 e!116236)))

(declare-fun res!83462 () Bool)

(assert (=> b!176184 (= res!83462 (and ((_ is Intermediate!565) lt!87084) (not (undefined!1377 lt!87084)) (bvslt (x!19348 lt!87084) #b01111111111111111111111111111110) (bvsge (x!19348 lt!87084) #b00000000000000000000000000000000) (bvsge (x!19348 lt!87084) #b00000000000000000000000000000000)))))

(assert (=> b!176184 (=> (not res!83462) (not e!116236))))

(declare-fun b!176185 () Bool)

(assert (=> b!176185 (= e!116238 (Intermediate!565 false (toIndex!0 key!828 (mask!8535 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!176186 () Bool)

(assert (=> b!176186 (= e!116237 (bvsge (x!19348 lt!87084) #b01111111111111111111111111111110))))

(declare-fun b!176187 () Bool)

(assert (=> b!176187 (= e!116239 (Intermediate!565 true (toIndex!0 key!828 (mask!8535 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!53507 c!31592) b!176187))

(assert (= (and d!53507 (not c!31592)) b!176181))

(assert (= (and b!176181 c!31593) b!176185))

(assert (= (and b!176181 (not c!31593)) b!176183))

(assert (= (and d!53507 c!31594) b!176186))

(assert (= (and d!53507 (not c!31594)) b!176184))

(assert (= (and b!176184 res!83462) b!176182))

(assert (= (and b!176182 (not res!83464)) b!176180))

(assert (= (and b!176180 (not res!83463)) b!176179))

(assert (=> b!176183 m!204353))

(declare-fun m!204569 () Bool)

(assert (=> b!176183 m!204569))

(assert (=> b!176183 m!204569))

(declare-fun m!204571 () Bool)

(assert (=> b!176183 m!204571))

(declare-fun m!204573 () Bool)

(assert (=> b!176180 m!204573))

(assert (=> b!176182 m!204573))

(assert (=> d!53507 m!204353))

(declare-fun m!204575 () Bool)

(assert (=> d!53507 m!204575))

(assert (=> d!53507 m!204239))

(assert (=> b!176179 m!204573))

(assert (=> d!53441 d!53507))

(declare-fun d!53509 () Bool)

(declare-fun lt!87091 () (_ BitVec 32))

(declare-fun lt!87090 () (_ BitVec 32))

(assert (=> d!53509 (= lt!87091 (bvmul (bvxor lt!87090 (bvlshr lt!87090 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53509 (= lt!87090 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53509 (and (bvsge (mask!8535 thiss!1248) #b00000000000000000000000000000000) (let ((res!83465 (let ((h!2854 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19367 (bvmul (bvxor h!2854 (bvlshr h!2854 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19367 (bvlshr x!19367 #b00000000000000000000000000001101)) (mask!8535 thiss!1248)))))) (and (bvslt res!83465 (bvadd (mask!8535 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83465 #b00000000000000000000000000000000))))))

(assert (=> d!53509 (= (toIndex!0 key!828 (mask!8535 thiss!1248)) (bvand (bvxor lt!87091 (bvlshr lt!87091 #b00000000000000000000000000001101)) (mask!8535 thiss!1248)))))

(assert (=> d!53441 d!53509))

(assert (=> d!53441 d!53431))

(declare-fun d!53511 () Bool)

(assert (=> d!53511 (isDefined!143 (getValueByKey!189 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-fun lt!87094 () Unit!5371)

(declare-fun choose!952 (List!2234 (_ BitVec 64)) Unit!5371)

(assert (=> d!53511 (= lt!87094 (choose!952 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-fun e!116243 () Bool)

(assert (=> d!53511 e!116243))

(declare-fun res!83468 () Bool)

(assert (=> d!53511 (=> (not res!83468) (not e!116243))))

(declare-fun isStrictlySorted!331 (List!2234) Bool)

(assert (=> d!53511 (= res!83468 (isStrictlySorted!331 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))))

(assert (=> d!53511 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828) lt!87094)))

(declare-fun b!176190 () Bool)

(assert (=> b!176190 (= e!116243 (containsKey!193 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(assert (= (and d!53511 res!83468) b!176190))

(assert (=> d!53511 m!204289))

(assert (=> d!53511 m!204289))

(assert (=> d!53511 m!204291))

(declare-fun m!204577 () Bool)

(assert (=> d!53511 m!204577))

(declare-fun m!204579 () Bool)

(assert (=> d!53511 m!204579))

(assert (=> b!176190 m!204285))

(assert (=> b!175909 d!53511))

(declare-fun d!53513 () Bool)

(declare-fun isEmpty!450 (Option!195) Bool)

(assert (=> d!53513 (= (isDefined!143 (getValueByKey!189 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828)) (not (isEmpty!450 (getValueByKey!189 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))))

(declare-fun bs!7246 () Bool)

(assert (= bs!7246 d!53513))

(assert (=> bs!7246 m!204289))

(declare-fun m!204581 () Bool)

(assert (=> bs!7246 m!204581))

(assert (=> b!175909 d!53513))

(declare-fun b!176201 () Bool)

(declare-fun e!116249 () Option!195)

(assert (=> b!176201 (= e!116249 (getValueByKey!189 (t!7047 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) key!828))))

(declare-fun b!176199 () Bool)

(declare-fun e!116248 () Option!195)

(assert (=> b!176199 (= e!116248 (Some!194 (_2!1643 (h!2850 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))))))

(declare-fun b!176202 () Bool)

(assert (=> b!176202 (= e!116249 None!193)))

(declare-fun b!176200 () Bool)

(assert (=> b!176200 (= e!116248 e!116249)))

(declare-fun c!31600 () Bool)

(assert (=> b!176200 (= c!31600 (and ((_ is Cons!2230) (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (not (= (_1!1643 (h!2850 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828))))))

(declare-fun d!53515 () Bool)

(declare-fun c!31599 () Bool)

(assert (=> d!53515 (= c!31599 (and ((_ is Cons!2230) (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (= (_1!1643 (h!2850 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)))))

(assert (=> d!53515 (= (getValueByKey!189 (toList!1107 (getCurrentListMap!743 (_keys!5483 thiss!1248) (_values!3610 thiss!1248) (mask!8535 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828) e!116248)))

(assert (= (and d!53515 c!31599) b!176199))

(assert (= (and d!53515 (not c!31599)) b!176200))

(assert (= (and b!176200 c!31600) b!176201))

(assert (= (and b!176200 (not c!31600)) b!176202))

(declare-fun m!204583 () Bool)

(assert (=> b!176201 m!204583))

(assert (=> b!175909 d!53515))

(declare-fun d!53517 () Bool)

(declare-fun e!116250 () Bool)

(assert (=> d!53517 e!116250))

(declare-fun res!83469 () Bool)

(assert (=> d!53517 (=> res!83469 e!116250)))

(declare-fun lt!87096 () Bool)

(assert (=> d!53517 (= res!83469 (not lt!87096))))

(declare-fun lt!87097 () Bool)

(assert (=> d!53517 (= lt!87096 lt!87097)))

(declare-fun lt!87095 () Unit!5371)

(declare-fun e!116251 () Unit!5371)

(assert (=> d!53517 (= lt!87095 e!116251)))

(declare-fun c!31601 () Bool)

(assert (=> d!53517 (= c!31601 lt!87097)))

(assert (=> d!53517 (= lt!87097 (containsKey!193 (toList!1107 lt!86966) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53517 (= (contains!1174 lt!86966 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87096)))

(declare-fun b!176203 () Bool)

(declare-fun lt!87098 () Unit!5371)

(assert (=> b!176203 (= e!116251 lt!87098)))

(assert (=> b!176203 (= lt!87098 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1107 lt!86966) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176203 (isDefined!143 (getValueByKey!189 (toList!1107 lt!86966) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176204 () Bool)

(declare-fun Unit!5378 () Unit!5371)

(assert (=> b!176204 (= e!116251 Unit!5378)))

(declare-fun b!176205 () Bool)

(assert (=> b!176205 (= e!116250 (isDefined!143 (getValueByKey!189 (toList!1107 lt!86966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53517 c!31601) b!176203))

(assert (= (and d!53517 (not c!31601)) b!176204))

(assert (= (and d!53517 (not res!83469)) b!176205))

(declare-fun m!204585 () Bool)

(assert (=> d!53517 m!204585))

(declare-fun m!204587 () Bool)

(assert (=> b!176203 m!204587))

(assert (=> b!176203 m!204547))

(assert (=> b!176203 m!204547))

(declare-fun m!204589 () Bool)

(assert (=> b!176203 m!204589))

(assert (=> b!176205 m!204547))

(assert (=> b!176205 m!204547))

(assert (=> b!176205 m!204589))

(assert (=> bm!17806 d!53517))

(assert (=> b!175911 d!53513))

(assert (=> b!175911 d!53515))

(assert (=> d!53435 d!53431))

(assert (=> b!175968 d!53503))

(declare-fun condMapEmpty!7035 () Bool)

(declare-fun mapDefault!7035 () ValueCell!1715)

(assert (=> mapNonEmpty!7034 (= condMapEmpty!7035 (= mapRest!7034 ((as const (Array (_ BitVec 32) ValueCell!1715)) mapDefault!7035)))))

(declare-fun e!116252 () Bool)

(declare-fun mapRes!7035 () Bool)

(assert (=> mapNonEmpty!7034 (= tp!15737 (and e!116252 mapRes!7035))))

(declare-fun b!176206 () Bool)

(declare-fun e!116253 () Bool)

(assert (=> b!176206 (= e!116253 tp_is_empty!4117)))

(declare-fun b!176207 () Bool)

(assert (=> b!176207 (= e!116252 tp_is_empty!4117)))

(declare-fun mapIsEmpty!7035 () Bool)

(assert (=> mapIsEmpty!7035 mapRes!7035))

(declare-fun mapNonEmpty!7035 () Bool)

(declare-fun tp!15738 () Bool)

(assert (=> mapNonEmpty!7035 (= mapRes!7035 (and tp!15738 e!116253))))

(declare-fun mapRest!7035 () (Array (_ BitVec 32) ValueCell!1715))

(declare-fun mapValue!7035 () ValueCell!1715)

(declare-fun mapKey!7035 () (_ BitVec 32))

(assert (=> mapNonEmpty!7035 (= mapRest!7034 (store mapRest!7035 mapKey!7035 mapValue!7035))))

(assert (= (and mapNonEmpty!7034 condMapEmpty!7035) mapIsEmpty!7035))

(assert (= (and mapNonEmpty!7034 (not condMapEmpty!7035)) mapNonEmpty!7035))

(assert (= (and mapNonEmpty!7035 ((_ is ValueCellFull!1715) mapValue!7035)) b!176206))

(assert (= (and mapNonEmpty!7034 ((_ is ValueCellFull!1715) mapDefault!7035)) b!176207))

(declare-fun m!204591 () Bool)

(assert (=> mapNonEmpty!7035 m!204591))

(declare-fun b_lambda!7017 () Bool)

(assert (= b_lambda!7013 (or (and b!175846 b_free!4345) b_lambda!7017)))

(declare-fun b_lambda!7019 () Bool)

(assert (= b_lambda!7015 (or (and b!175846 b_free!4345) b_lambda!7019)))

(check-sat (not bm!17815) (not b_lambda!7011) (not d!53479) tp_is_empty!4117 (not d!53471) (not d!53477) (not b!176034) (not b!176098) (not mapNonEmpty!7035) (not d!53453) (not b!176037) (not d!53507) (not b!176085) (not d!53475) (not bm!17812) (not b!176080) (not d!53469) (not d!53513) (not d!53499) (not d!53451) (not b_next!4345) (not b!176140) (not d!53517) (not b!176073) (not b!176190) (not b!176086) (not b!176016) (not b!176089) (not b!176107) (not b!176023) (not d!53483) (not d!53511) (not b_lambda!7019) (not b!176203) (not b!176201) (not b!176088) (not d!53489) (not b!176076) (not b!176097) (not b!176183) (not d!53455) b_and!10817 (not d!53465) (not d!53463) (not b!176112) (not b!176115) (not d!53481) (not d!53493) (not b_lambda!7017) (not b!176046) (not b!176205) (not b!176079) (not bm!17809) (not b!176142) (not b!176036) (not d!53445) (not b!176092) (not b!176137) (not d!53473) (not d!53497) (not b!176126) (not b!176072) (not b!176125) (not d!53457) (not bm!17818) (not b!176113) (not b!176138) (not d!53491) (not b!176091) (not d!53461) (not b!176047) (not b!176111) (not b!176158) (not b!176017) (not b!176077) (not b!176082) (not b!176041) (not d!53505) (not b!176078) (not d!53459) (not d!53501) (not b!176039) (not d!53467))
(check-sat b_and!10817 (not b_next!4345))
