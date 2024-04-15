; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22588 () Bool)

(assert start!22588)

(declare-fun b!235962 () Bool)

(declare-fun b_free!6355 () Bool)

(declare-fun b_next!6355 () Bool)

(assert (=> b!235962 (= b_free!6355 (not b_next!6355))))

(declare-fun tp!22240 () Bool)

(declare-fun b_and!13263 () Bool)

(assert (=> b!235962 (= tp!22240 b_and!13263)))

(declare-fun b!235957 () Bool)

(declare-fun e!153247 () Bool)

(declare-fun e!153244 () Bool)

(assert (=> b!235957 (= e!153247 e!153244)))

(declare-fun res!115697 () Bool)

(assert (=> b!235957 (=> (not res!115697) (not e!153244))))

(declare-datatypes ((SeekEntryResult!998 0))(
  ( (MissingZero!998 (index!6162 (_ BitVec 32))) (Found!998 (index!6163 (_ BitVec 32))) (Intermediate!998 (undefined!1810 Bool) (index!6164 (_ BitVec 32)) (x!23853 (_ BitVec 32))) (Undefined!998) (MissingVacant!998 (index!6165 (_ BitVec 32))) )
))
(declare-fun lt!119190 () SeekEntryResult!998)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235957 (= res!115697 (or (= lt!119190 (MissingZero!998 index!297)) (= lt!119190 (MissingVacant!998 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7937 0))(
  ( (V!7938 (val!3153 Int)) )
))
(declare-datatypes ((ValueCell!2765 0))(
  ( (ValueCellFull!2765 (v!5177 V!7937)) (EmptyCell!2765) )
))
(declare-datatypes ((array!11689 0))(
  ( (array!11690 (arr!5553 (Array (_ BitVec 32) ValueCell!2765)) (size!5891 (_ BitVec 32))) )
))
(declare-datatypes ((array!11691 0))(
  ( (array!11692 (arr!5554 (Array (_ BitVec 32) (_ BitVec 64))) (size!5892 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3430 0))(
  ( (LongMapFixedSize!3431 (defaultEntry!4388 Int) (mask!10372 (_ BitVec 32)) (extraKeys!4125 (_ BitVec 32)) (zeroValue!4229 V!7937) (minValue!4229 V!7937) (_size!1764 (_ BitVec 32)) (_keys!6466 array!11691) (_values!4371 array!11689) (_vacant!1764 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3430)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11691 (_ BitVec 32)) SeekEntryResult!998)

(assert (=> b!235957 (= lt!119190 (seekEntryOrOpen!0 key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(declare-fun b!235958 () Bool)

(declare-fun e!153246 () Bool)

(declare-fun tp_is_empty!6217 () Bool)

(assert (=> b!235958 (= e!153246 tp_is_empty!6217)))

(declare-fun b!235959 () Bool)

(declare-fun res!115699 () Bool)

(assert (=> b!235959 (=> (not res!115699) (not e!153247))))

(assert (=> b!235959 (= res!115699 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235960 () Bool)

(declare-fun res!115698 () Bool)

(assert (=> b!235960 (=> (not res!115698) (not e!153244))))

(declare-datatypes ((tuple2!4622 0))(
  ( (tuple2!4623 (_1!2322 (_ BitVec 64)) (_2!2322 V!7937)) )
))
(declare-datatypes ((List!3544 0))(
  ( (Nil!3541) (Cons!3540 (h!4192 tuple2!4622) (t!8514 List!3544)) )
))
(declare-datatypes ((ListLongMap!3525 0))(
  ( (ListLongMap!3526 (toList!1778 List!3544)) )
))
(declare-fun contains!1659 (ListLongMap!3525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1287 (array!11691 array!11689 (_ BitVec 32) (_ BitVec 32) V!7937 V!7937 (_ BitVec 32) Int) ListLongMap!3525)

(assert (=> b!235960 (= res!115698 (not (contains!1659 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) key!932)))))

(declare-fun mapIsEmpty!10529 () Bool)

(declare-fun mapRes!10529 () Bool)

(assert (=> mapIsEmpty!10529 mapRes!10529))

(declare-fun e!153248 () Bool)

(declare-fun e!153242 () Bool)

(declare-fun array_inv!3661 (array!11691) Bool)

(declare-fun array_inv!3662 (array!11689) Bool)

(assert (=> b!235962 (= e!153248 (and tp!22240 tp_is_empty!6217 (array_inv!3661 (_keys!6466 thiss!1504)) (array_inv!3662 (_values!4371 thiss!1504)) e!153242))))

(declare-fun b!235963 () Bool)

(assert (=> b!235963 (= e!153244 (not (= (size!5891 (_values!4371 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10372 thiss!1504)))))))

(declare-fun b!235964 () Bool)

(declare-fun res!115695 () Bool)

(assert (=> b!235964 (=> (not res!115695) (not e!153244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235964 (= res!115695 (validMask!0 (mask!10372 thiss!1504)))))

(declare-fun res!115696 () Bool)

(assert (=> start!22588 (=> (not res!115696) (not e!153247))))

(declare-fun valid!1362 (LongMapFixedSize!3430) Bool)

(assert (=> start!22588 (= res!115696 (valid!1362 thiss!1504))))

(assert (=> start!22588 e!153247))

(assert (=> start!22588 e!153248))

(assert (=> start!22588 true))

(declare-fun b!235961 () Bool)

(declare-fun e!153245 () Bool)

(assert (=> b!235961 (= e!153245 tp_is_empty!6217)))

(declare-fun mapNonEmpty!10529 () Bool)

(declare-fun tp!22241 () Bool)

(assert (=> mapNonEmpty!10529 (= mapRes!10529 (and tp!22241 e!153245))))

(declare-fun mapRest!10529 () (Array (_ BitVec 32) ValueCell!2765))

(declare-fun mapKey!10529 () (_ BitVec 32))

(declare-fun mapValue!10529 () ValueCell!2765)

(assert (=> mapNonEmpty!10529 (= (arr!5553 (_values!4371 thiss!1504)) (store mapRest!10529 mapKey!10529 mapValue!10529))))

(declare-fun b!235965 () Bool)

(assert (=> b!235965 (= e!153242 (and e!153246 mapRes!10529))))

(declare-fun condMapEmpty!10529 () Bool)

(declare-fun mapDefault!10529 () ValueCell!2765)

(assert (=> b!235965 (= condMapEmpty!10529 (= (arr!5553 (_values!4371 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2765)) mapDefault!10529)))))

(assert (= (and start!22588 res!115696) b!235959))

(assert (= (and b!235959 res!115699) b!235957))

(assert (= (and b!235957 res!115697) b!235960))

(assert (= (and b!235960 res!115698) b!235964))

(assert (= (and b!235964 res!115695) b!235963))

(assert (= (and b!235965 condMapEmpty!10529) mapIsEmpty!10529))

(assert (= (and b!235965 (not condMapEmpty!10529)) mapNonEmpty!10529))

(get-info :version)

(assert (= (and mapNonEmpty!10529 ((_ is ValueCellFull!2765) mapValue!10529)) b!235961))

(assert (= (and b!235965 ((_ is ValueCellFull!2765) mapDefault!10529)) b!235958))

(assert (= b!235962 b!235965))

(assert (= start!22588 b!235962))

(declare-fun m!256399 () Bool)

(assert (=> start!22588 m!256399))

(declare-fun m!256401 () Bool)

(assert (=> b!235960 m!256401))

(assert (=> b!235960 m!256401))

(declare-fun m!256403 () Bool)

(assert (=> b!235960 m!256403))

(declare-fun m!256405 () Bool)

(assert (=> mapNonEmpty!10529 m!256405))

(declare-fun m!256407 () Bool)

(assert (=> b!235962 m!256407))

(declare-fun m!256409 () Bool)

(assert (=> b!235962 m!256409))

(declare-fun m!256411 () Bool)

(assert (=> b!235957 m!256411))

(declare-fun m!256413 () Bool)

(assert (=> b!235964 m!256413))

(check-sat b_and!13263 (not start!22588) (not b!235962) (not b!235964) (not mapNonEmpty!10529) (not b!235957) tp_is_empty!6217 (not b!235960) (not b_next!6355))
(check-sat b_and!13263 (not b_next!6355))
(get-model)

(declare-fun d!59187 () Bool)

(declare-fun e!153296 () Bool)

(assert (=> d!59187 e!153296))

(declare-fun res!115732 () Bool)

(assert (=> d!59187 (=> res!115732 e!153296)))

(declare-fun lt!119207 () Bool)

(assert (=> d!59187 (= res!115732 (not lt!119207))))

(declare-fun lt!119206 () Bool)

(assert (=> d!59187 (= lt!119207 lt!119206)))

(declare-datatypes ((Unit!7264 0))(
  ( (Unit!7265) )
))
(declare-fun lt!119205 () Unit!7264)

(declare-fun e!153295 () Unit!7264)

(assert (=> d!59187 (= lt!119205 e!153295)))

(declare-fun c!39287 () Bool)

(assert (=> d!59187 (= c!39287 lt!119206)))

(declare-fun containsKey!261 (List!3544 (_ BitVec 64)) Bool)

(assert (=> d!59187 (= lt!119206 (containsKey!261 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(assert (=> d!59187 (= (contains!1659 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) key!932) lt!119207)))

(declare-fun b!236026 () Bool)

(declare-fun lt!119208 () Unit!7264)

(assert (=> b!236026 (= e!153295 lt!119208)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!210 (List!3544 (_ BitVec 64)) Unit!7264)

(assert (=> b!236026 (= lt!119208 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-datatypes ((Option!275 0))(
  ( (Some!274 (v!5180 V!7937)) (None!273) )
))
(declare-fun isDefined!211 (Option!275) Bool)

(declare-fun getValueByKey!269 (List!3544 (_ BitVec 64)) Option!275)

(assert (=> b!236026 (isDefined!211 (getValueByKey!269 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-fun b!236027 () Bool)

(declare-fun Unit!7266 () Unit!7264)

(assert (=> b!236027 (= e!153295 Unit!7266)))

(declare-fun b!236028 () Bool)

(assert (=> b!236028 (= e!153296 (isDefined!211 (getValueByKey!269 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932)))))

(assert (= (and d!59187 c!39287) b!236026))

(assert (= (and d!59187 (not c!39287)) b!236027))

(assert (= (and d!59187 (not res!115732)) b!236028))

(declare-fun m!256447 () Bool)

(assert (=> d!59187 m!256447))

(declare-fun m!256449 () Bool)

(assert (=> b!236026 m!256449))

(declare-fun m!256451 () Bool)

(assert (=> b!236026 m!256451))

(assert (=> b!236026 m!256451))

(declare-fun m!256453 () Bool)

(assert (=> b!236026 m!256453))

(assert (=> b!236028 m!256451))

(assert (=> b!236028 m!256451))

(assert (=> b!236028 m!256453))

(assert (=> b!235960 d!59187))

(declare-fun b!236071 () Bool)

(declare-fun e!153334 () Unit!7264)

(declare-fun Unit!7267 () Unit!7264)

(assert (=> b!236071 (= e!153334 Unit!7267)))

(declare-fun b!236072 () Bool)

(declare-fun lt!119274 () Unit!7264)

(assert (=> b!236072 (= e!153334 lt!119274)))

(declare-fun lt!119256 () ListLongMap!3525)

(declare-fun getCurrentListMapNoExtraKeys!529 (array!11691 array!11689 (_ BitVec 32) (_ BitVec 32) V!7937 V!7937 (_ BitVec 32) Int) ListLongMap!3525)

(assert (=> b!236072 (= lt!119256 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119263 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119270 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119270 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119268 () Unit!7264)

(declare-fun addStillContains!189 (ListLongMap!3525 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7264)

(assert (=> b!236072 (= lt!119268 (addStillContains!189 lt!119256 lt!119263 (zeroValue!4229 thiss!1504) lt!119270))))

(declare-fun +!646 (ListLongMap!3525 tuple2!4622) ListLongMap!3525)

(assert (=> b!236072 (contains!1659 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))) lt!119270)))

(declare-fun lt!119264 () Unit!7264)

(assert (=> b!236072 (= lt!119264 lt!119268)))

(declare-fun lt!119259 () ListLongMap!3525)

(assert (=> b!236072 (= lt!119259 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119265 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119271 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119271 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119261 () Unit!7264)

(declare-fun addApplyDifferent!189 (ListLongMap!3525 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7264)

(assert (=> b!236072 (= lt!119261 (addApplyDifferent!189 lt!119259 lt!119265 (minValue!4229 thiss!1504) lt!119271))))

(declare-fun apply!213 (ListLongMap!3525 (_ BitVec 64)) V!7937)

(assert (=> b!236072 (= (apply!213 (+!646 lt!119259 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))) lt!119271) (apply!213 lt!119259 lt!119271))))

(declare-fun lt!119272 () Unit!7264)

(assert (=> b!236072 (= lt!119272 lt!119261)))

(declare-fun lt!119266 () ListLongMap!3525)

(assert (=> b!236072 (= lt!119266 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119267 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119253 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119253 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119258 () Unit!7264)

(assert (=> b!236072 (= lt!119258 (addApplyDifferent!189 lt!119266 lt!119267 (zeroValue!4229 thiss!1504) lt!119253))))

(assert (=> b!236072 (= (apply!213 (+!646 lt!119266 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))) lt!119253) (apply!213 lt!119266 lt!119253))))

(declare-fun lt!119269 () Unit!7264)

(assert (=> b!236072 (= lt!119269 lt!119258)))

(declare-fun lt!119260 () ListLongMap!3525)

(assert (=> b!236072 (= lt!119260 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119257 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119257 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119262 () (_ BitVec 64))

(assert (=> b!236072 (= lt!119262 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236072 (= lt!119274 (addApplyDifferent!189 lt!119260 lt!119257 (minValue!4229 thiss!1504) lt!119262))))

(assert (=> b!236072 (= (apply!213 (+!646 lt!119260 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))) lt!119262) (apply!213 lt!119260 lt!119262))))

(declare-fun b!236073 () Bool)

(declare-fun e!153325 () Bool)

(declare-fun e!153329 () Bool)

(assert (=> b!236073 (= e!153325 e!153329)))

(declare-fun c!39303 () Bool)

(assert (=> b!236073 (= c!39303 (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236074 () Bool)

(declare-fun call!21945 () Bool)

(assert (=> b!236074 (= e!153329 (not call!21945))))

(declare-fun b!236075 () Bool)

(declare-fun e!153331 () Bool)

(assert (=> b!236075 (= e!153329 e!153331)))

(declare-fun res!115756 () Bool)

(assert (=> b!236075 (= res!115756 call!21945)))

(assert (=> b!236075 (=> (not res!115756) (not e!153331))))

(declare-fun b!236076 () Bool)

(declare-fun e!153328 () Bool)

(declare-fun call!21948 () Bool)

(assert (=> b!236076 (= e!153328 (not call!21948))))

(declare-fun b!236077 () Bool)

(declare-fun e!153330 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236077 (= e!153330 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21939 () Bool)

(declare-fun call!21946 () ListLongMap!3525)

(declare-fun call!21947 () ListLongMap!3525)

(assert (=> bm!21939 (= call!21946 call!21947)))

(declare-fun b!236078 () Bool)

(declare-fun e!153324 () ListLongMap!3525)

(assert (=> b!236078 (= e!153324 call!21946)))

(declare-fun bm!21940 () Bool)

(declare-fun call!21944 () ListLongMap!3525)

(declare-fun call!21942 () ListLongMap!3525)

(assert (=> bm!21940 (= call!21944 call!21942)))

(declare-fun b!236079 () Bool)

(declare-fun e!153327 () Bool)

(assert (=> b!236079 (= e!153328 e!153327)))

(declare-fun res!115754 () Bool)

(assert (=> b!236079 (= res!115754 call!21948)))

(assert (=> b!236079 (=> (not res!115754) (not e!153327))))

(declare-fun b!236080 () Bool)

(declare-fun res!115758 () Bool)

(assert (=> b!236080 (=> (not res!115758) (not e!153325))))

(assert (=> b!236080 (= res!115758 e!153328)))

(declare-fun c!39300 () Bool)

(assert (=> b!236080 (= c!39300 (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236081 () Bool)

(declare-fun e!153326 () Bool)

(assert (=> b!236081 (= e!153326 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun c!39304 () Bool)

(declare-fun call!21943 () ListLongMap!3525)

(declare-fun c!39301 () Bool)

(declare-fun bm!21941 () Bool)

(assert (=> bm!21941 (= call!21947 (+!646 (ite c!39304 call!21942 (ite c!39301 call!21944 call!21943)) (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(declare-fun b!236082 () Bool)

(declare-fun e!153323 () Bool)

(declare-fun lt!119255 () ListLongMap!3525)

(declare-fun get!2850 (ValueCell!2765 V!7937) V!7937)

(declare-fun dynLambda!547 (Int (_ BitVec 64)) V!7937)

(assert (=> b!236082 (= e!153323 (= (apply!213 lt!119255 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)) (get!2850 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5891 (_values!4371 thiss!1504))))))

(assert (=> b!236082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun b!236083 () Bool)

(declare-fun e!153335 () ListLongMap!3525)

(assert (=> b!236083 (= e!153335 e!153324)))

(assert (=> b!236083 (= c!39301 (and (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21942 () Bool)

(assert (=> bm!21942 (= call!21942 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun b!236084 () Bool)

(declare-fun e!153332 () ListLongMap!3525)

(assert (=> b!236084 (= e!153332 call!21946)))

(declare-fun b!236085 () Bool)

(assert (=> b!236085 (= e!153327 (= (apply!213 lt!119255 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4229 thiss!1504)))))

(declare-fun d!59189 () Bool)

(assert (=> d!59189 e!153325))

(declare-fun res!115752 () Bool)

(assert (=> d!59189 (=> (not res!115752) (not e!153325))))

(assert (=> d!59189 (= res!115752 (or (bvsge #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))))

(declare-fun lt!119273 () ListLongMap!3525)

(assert (=> d!59189 (= lt!119255 lt!119273)))

(declare-fun lt!119254 () Unit!7264)

(assert (=> d!59189 (= lt!119254 e!153334)))

(declare-fun c!39302 () Bool)

(assert (=> d!59189 (= c!39302 e!153326)))

(declare-fun res!115759 () Bool)

(assert (=> d!59189 (=> (not res!115759) (not e!153326))))

(assert (=> d!59189 (= res!115759 (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> d!59189 (= lt!119273 e!153335)))

(assert (=> d!59189 (= c!39304 (and (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59189 (validMask!0 (mask!10372 thiss!1504))))

(assert (=> d!59189 (= (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) lt!119255)))

(declare-fun b!236086 () Bool)

(assert (=> b!236086 (= e!153335 (+!646 call!21947 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))

(declare-fun b!236087 () Bool)

(declare-fun e!153333 () Bool)

(assert (=> b!236087 (= e!153333 e!153323)))

(declare-fun res!115757 () Bool)

(assert (=> b!236087 (=> (not res!115757) (not e!153323))))

(assert (=> b!236087 (= res!115757 (contains!1659 lt!119255 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun b!236088 () Bool)

(declare-fun res!115751 () Bool)

(assert (=> b!236088 (=> (not res!115751) (not e!153325))))

(assert (=> b!236088 (= res!115751 e!153333)))

(declare-fun res!115755 () Bool)

(assert (=> b!236088 (=> res!115755 e!153333)))

(assert (=> b!236088 (= res!115755 (not e!153330))))

(declare-fun res!115753 () Bool)

(assert (=> b!236088 (=> (not res!115753) (not e!153330))))

(assert (=> b!236088 (= res!115753 (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun bm!21943 () Bool)

(assert (=> bm!21943 (= call!21945 (contains!1659 lt!119255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21944 () Bool)

(assert (=> bm!21944 (= call!21948 (contains!1659 lt!119255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236089 () Bool)

(assert (=> b!236089 (= e!153331 (= (apply!213 lt!119255 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4229 thiss!1504)))))

(declare-fun b!236090 () Bool)

(declare-fun c!39305 () Bool)

(assert (=> b!236090 (= c!39305 (and (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!236090 (= e!153324 e!153332)))

(declare-fun b!236091 () Bool)

(assert (=> b!236091 (= e!153332 call!21943)))

(declare-fun bm!21945 () Bool)

(assert (=> bm!21945 (= call!21943 call!21944)))

(assert (= (and d!59189 c!39304) b!236086))

(assert (= (and d!59189 (not c!39304)) b!236083))

(assert (= (and b!236083 c!39301) b!236078))

(assert (= (and b!236083 (not c!39301)) b!236090))

(assert (= (and b!236090 c!39305) b!236084))

(assert (= (and b!236090 (not c!39305)) b!236091))

(assert (= (or b!236084 b!236091) bm!21945))

(assert (= (or b!236078 bm!21945) bm!21940))

(assert (= (or b!236078 b!236084) bm!21939))

(assert (= (or b!236086 bm!21940) bm!21942))

(assert (= (or b!236086 bm!21939) bm!21941))

(assert (= (and d!59189 res!115759) b!236081))

(assert (= (and d!59189 c!39302) b!236072))

(assert (= (and d!59189 (not c!39302)) b!236071))

(assert (= (and d!59189 res!115752) b!236088))

(assert (= (and b!236088 res!115753) b!236077))

(assert (= (and b!236088 (not res!115755)) b!236087))

(assert (= (and b!236087 res!115757) b!236082))

(assert (= (and b!236088 res!115751) b!236080))

(assert (= (and b!236080 c!39300) b!236079))

(assert (= (and b!236080 (not c!39300)) b!236076))

(assert (= (and b!236079 res!115754) b!236085))

(assert (= (or b!236079 b!236076) bm!21944))

(assert (= (and b!236080 res!115758) b!236073))

(assert (= (and b!236073 c!39303) b!236075))

(assert (= (and b!236073 (not c!39303)) b!236074))

(assert (= (and b!236075 res!115756) b!236089))

(assert (= (or b!236075 b!236074) bm!21943))

(declare-fun b_lambda!7897 () Bool)

(assert (=> (not b_lambda!7897) (not b!236082)))

(declare-fun t!8517 () Bool)

(declare-fun tb!2931 () Bool)

(assert (=> (and b!235962 (= (defaultEntry!4388 thiss!1504) (defaultEntry!4388 thiss!1504)) t!8517) tb!2931))

(declare-fun result!5131 () Bool)

(assert (=> tb!2931 (= result!5131 tp_is_empty!6217)))

(assert (=> b!236082 t!8517))

(declare-fun b_and!13269 () Bool)

(assert (= b_and!13263 (and (=> t!8517 result!5131) b_and!13269)))

(declare-fun m!256455 () Bool)

(assert (=> bm!21944 m!256455))

(declare-fun m!256457 () Bool)

(assert (=> bm!21941 m!256457))

(declare-fun m!256459 () Bool)

(assert (=> bm!21942 m!256459))

(declare-fun m!256461 () Bool)

(assert (=> b!236082 m!256461))

(assert (=> b!236082 m!256461))

(declare-fun m!256463 () Bool)

(assert (=> b!236082 m!256463))

(declare-fun m!256465 () Bool)

(assert (=> b!236082 m!256465))

(declare-fun m!256467 () Bool)

(assert (=> b!236082 m!256467))

(declare-fun m!256469 () Bool)

(assert (=> b!236082 m!256469))

(assert (=> b!236082 m!256467))

(assert (=> b!236082 m!256465))

(assert (=> b!236077 m!256461))

(assert (=> b!236077 m!256461))

(declare-fun m!256471 () Bool)

(assert (=> b!236077 m!256471))

(declare-fun m!256473 () Bool)

(assert (=> b!236089 m!256473))

(assert (=> d!59189 m!256413))

(declare-fun m!256475 () Bool)

(assert (=> bm!21943 m!256475))

(declare-fun m!256477 () Bool)

(assert (=> b!236086 m!256477))

(assert (=> b!236087 m!256461))

(assert (=> b!236087 m!256461))

(declare-fun m!256479 () Bool)

(assert (=> b!236087 m!256479))

(declare-fun m!256481 () Bool)

(assert (=> b!236072 m!256481))

(declare-fun m!256483 () Bool)

(assert (=> b!236072 m!256483))

(declare-fun m!256485 () Bool)

(assert (=> b!236072 m!256485))

(assert (=> b!236072 m!256461))

(declare-fun m!256487 () Bool)

(assert (=> b!236072 m!256487))

(assert (=> b!236072 m!256483))

(declare-fun m!256489 () Bool)

(assert (=> b!236072 m!256489))

(declare-fun m!256491 () Bool)

(assert (=> b!236072 m!256491))

(declare-fun m!256493 () Bool)

(assert (=> b!236072 m!256493))

(declare-fun m!256495 () Bool)

(assert (=> b!236072 m!256495))

(assert (=> b!236072 m!256459))

(assert (=> b!236072 m!256489))

(declare-fun m!256497 () Bool)

(assert (=> b!236072 m!256497))

(declare-fun m!256499 () Bool)

(assert (=> b!236072 m!256499))

(declare-fun m!256501 () Bool)

(assert (=> b!236072 m!256501))

(declare-fun m!256503 () Bool)

(assert (=> b!236072 m!256503))

(declare-fun m!256505 () Bool)

(assert (=> b!236072 m!256505))

(assert (=> b!236072 m!256501))

(declare-fun m!256507 () Bool)

(assert (=> b!236072 m!256507))

(assert (=> b!236072 m!256499))

(declare-fun m!256509 () Bool)

(assert (=> b!236072 m!256509))

(declare-fun m!256511 () Bool)

(assert (=> b!236085 m!256511))

(assert (=> b!236081 m!256461))

(assert (=> b!236081 m!256461))

(assert (=> b!236081 m!256471))

(assert (=> b!235960 d!59189))

(declare-fun d!59191 () Bool)

(assert (=> d!59191 (= (validMask!0 (mask!10372 thiss!1504)) (and (or (= (mask!10372 thiss!1504) #b00000000000000000000000000000111) (= (mask!10372 thiss!1504) #b00000000000000000000000000001111) (= (mask!10372 thiss!1504) #b00000000000000000000000000011111) (= (mask!10372 thiss!1504) #b00000000000000000000000000111111) (= (mask!10372 thiss!1504) #b00000000000000000000000001111111) (= (mask!10372 thiss!1504) #b00000000000000000000000011111111) (= (mask!10372 thiss!1504) #b00000000000000000000000111111111) (= (mask!10372 thiss!1504) #b00000000000000000000001111111111) (= (mask!10372 thiss!1504) #b00000000000000000000011111111111) (= (mask!10372 thiss!1504) #b00000000000000000000111111111111) (= (mask!10372 thiss!1504) #b00000000000000000001111111111111) (= (mask!10372 thiss!1504) #b00000000000000000011111111111111) (= (mask!10372 thiss!1504) #b00000000000000000111111111111111) (= (mask!10372 thiss!1504) #b00000000000000001111111111111111) (= (mask!10372 thiss!1504) #b00000000000000011111111111111111) (= (mask!10372 thiss!1504) #b00000000000000111111111111111111) (= (mask!10372 thiss!1504) #b00000000000001111111111111111111) (= (mask!10372 thiss!1504) #b00000000000011111111111111111111) (= (mask!10372 thiss!1504) #b00000000000111111111111111111111) (= (mask!10372 thiss!1504) #b00000000001111111111111111111111) (= (mask!10372 thiss!1504) #b00000000011111111111111111111111) (= (mask!10372 thiss!1504) #b00000000111111111111111111111111) (= (mask!10372 thiss!1504) #b00000001111111111111111111111111) (= (mask!10372 thiss!1504) #b00000011111111111111111111111111) (= (mask!10372 thiss!1504) #b00000111111111111111111111111111) (= (mask!10372 thiss!1504) #b00001111111111111111111111111111) (= (mask!10372 thiss!1504) #b00011111111111111111111111111111) (= (mask!10372 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10372 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235964 d!59191))

(declare-fun d!59193 () Bool)

(declare-fun res!115766 () Bool)

(declare-fun e!153338 () Bool)

(assert (=> d!59193 (=> (not res!115766) (not e!153338))))

(declare-fun simpleValid!236 (LongMapFixedSize!3430) Bool)

(assert (=> d!59193 (= res!115766 (simpleValid!236 thiss!1504))))

(assert (=> d!59193 (= (valid!1362 thiss!1504) e!153338)))

(declare-fun b!236100 () Bool)

(declare-fun res!115767 () Bool)

(assert (=> b!236100 (=> (not res!115767) (not e!153338))))

(declare-fun arrayCountValidKeys!0 (array!11691 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236100 (= res!115767 (= (arrayCountValidKeys!0 (_keys!6466 thiss!1504) #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))) (_size!1764 thiss!1504)))))

(declare-fun b!236101 () Bool)

(declare-fun res!115768 () Bool)

(assert (=> b!236101 (=> (not res!115768) (not e!153338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11691 (_ BitVec 32)) Bool)

(assert (=> b!236101 (= res!115768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(declare-fun b!236102 () Bool)

(declare-datatypes ((List!3546 0))(
  ( (Nil!3543) (Cons!3542 (h!4194 (_ BitVec 64)) (t!8518 List!3546)) )
))
(declare-fun arrayNoDuplicates!0 (array!11691 (_ BitVec 32) List!3546) Bool)

(assert (=> b!236102 (= e!153338 (arrayNoDuplicates!0 (_keys!6466 thiss!1504) #b00000000000000000000000000000000 Nil!3543))))

(assert (= (and d!59193 res!115766) b!236100))

(assert (= (and b!236100 res!115767) b!236101))

(assert (= (and b!236101 res!115768) b!236102))

(declare-fun m!256513 () Bool)

(assert (=> d!59193 m!256513))

(declare-fun m!256515 () Bool)

(assert (=> b!236100 m!256515))

(declare-fun m!256517 () Bool)

(assert (=> b!236101 m!256517))

(declare-fun m!256519 () Bool)

(assert (=> b!236102 m!256519))

(assert (=> start!22588 d!59193))

(declare-fun b!236115 () Bool)

(declare-fun c!39313 () Bool)

(declare-fun lt!119281 () (_ BitVec 64))

(assert (=> b!236115 (= c!39313 (= lt!119281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153347 () SeekEntryResult!998)

(declare-fun e!153345 () SeekEntryResult!998)

(assert (=> b!236115 (= e!153347 e!153345)))

(declare-fun b!236116 () Bool)

(declare-fun lt!119282 () SeekEntryResult!998)

(assert (=> b!236116 (= e!153347 (Found!998 (index!6164 lt!119282)))))

(declare-fun b!236117 () Bool)

(assert (=> b!236117 (= e!153345 (MissingZero!998 (index!6164 lt!119282)))))

(declare-fun b!236118 () Bool)

(declare-fun e!153346 () SeekEntryResult!998)

(assert (=> b!236118 (= e!153346 e!153347)))

(assert (=> b!236118 (= lt!119281 (select (arr!5554 (_keys!6466 thiss!1504)) (index!6164 lt!119282)))))

(declare-fun c!39314 () Bool)

(assert (=> b!236118 (= c!39314 (= lt!119281 key!932))))

(declare-fun b!236119 () Bool)

(assert (=> b!236119 (= e!153346 Undefined!998)))

(declare-fun d!59195 () Bool)

(declare-fun lt!119283 () SeekEntryResult!998)

(assert (=> d!59195 (and (or ((_ is Undefined!998) lt!119283) (not ((_ is Found!998) lt!119283)) (and (bvsge (index!6163 lt!119283) #b00000000000000000000000000000000) (bvslt (index!6163 lt!119283) (size!5892 (_keys!6466 thiss!1504))))) (or ((_ is Undefined!998) lt!119283) ((_ is Found!998) lt!119283) (not ((_ is MissingZero!998) lt!119283)) (and (bvsge (index!6162 lt!119283) #b00000000000000000000000000000000) (bvslt (index!6162 lt!119283) (size!5892 (_keys!6466 thiss!1504))))) (or ((_ is Undefined!998) lt!119283) ((_ is Found!998) lt!119283) ((_ is MissingZero!998) lt!119283) (not ((_ is MissingVacant!998) lt!119283)) (and (bvsge (index!6165 lt!119283) #b00000000000000000000000000000000) (bvslt (index!6165 lt!119283) (size!5892 (_keys!6466 thiss!1504))))) (or ((_ is Undefined!998) lt!119283) (ite ((_ is Found!998) lt!119283) (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6163 lt!119283)) key!932) (ite ((_ is MissingZero!998) lt!119283) (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6162 lt!119283)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!998) lt!119283) (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6165 lt!119283)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59195 (= lt!119283 e!153346)))

(declare-fun c!39312 () Bool)

(assert (=> d!59195 (= c!39312 (and ((_ is Intermediate!998) lt!119282) (undefined!1810 lt!119282)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11691 (_ BitVec 32)) SeekEntryResult!998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59195 (= lt!119282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10372 thiss!1504)) key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(assert (=> d!59195 (validMask!0 (mask!10372 thiss!1504))))

(assert (=> d!59195 (= (seekEntryOrOpen!0 key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)) lt!119283)))

(declare-fun b!236120 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11691 (_ BitVec 32)) SeekEntryResult!998)

(assert (=> b!236120 (= e!153345 (seekKeyOrZeroReturnVacant!0 (x!23853 lt!119282) (index!6164 lt!119282) (index!6164 lt!119282) key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(assert (= (and d!59195 c!39312) b!236119))

(assert (= (and d!59195 (not c!39312)) b!236118))

(assert (= (and b!236118 c!39314) b!236116))

(assert (= (and b!236118 (not c!39314)) b!236115))

(assert (= (and b!236115 c!39313) b!236117))

(assert (= (and b!236115 (not c!39313)) b!236120))

(declare-fun m!256521 () Bool)

(assert (=> b!236118 m!256521))

(declare-fun m!256523 () Bool)

(assert (=> d!59195 m!256523))

(declare-fun m!256525 () Bool)

(assert (=> d!59195 m!256525))

(declare-fun m!256527 () Bool)

(assert (=> d!59195 m!256527))

(assert (=> d!59195 m!256413))

(assert (=> d!59195 m!256525))

(declare-fun m!256529 () Bool)

(assert (=> d!59195 m!256529))

(declare-fun m!256531 () Bool)

(assert (=> d!59195 m!256531))

(declare-fun m!256533 () Bool)

(assert (=> b!236120 m!256533))

(assert (=> b!235957 d!59195))

(declare-fun d!59197 () Bool)

(assert (=> d!59197 (= (array_inv!3661 (_keys!6466 thiss!1504)) (bvsge (size!5892 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235962 d!59197))

(declare-fun d!59199 () Bool)

(assert (=> d!59199 (= (array_inv!3662 (_values!4371 thiss!1504)) (bvsge (size!5891 (_values!4371 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235962 d!59199))

(declare-fun b!236128 () Bool)

(declare-fun e!153353 () Bool)

(assert (=> b!236128 (= e!153353 tp_is_empty!6217)))

(declare-fun b!236127 () Bool)

(declare-fun e!153352 () Bool)

(assert (=> b!236127 (= e!153352 tp_is_empty!6217)))

(declare-fun mapNonEmpty!10538 () Bool)

(declare-fun mapRes!10538 () Bool)

(declare-fun tp!22256 () Bool)

(assert (=> mapNonEmpty!10538 (= mapRes!10538 (and tp!22256 e!153352))))

(declare-fun mapKey!10538 () (_ BitVec 32))

(declare-fun mapValue!10538 () ValueCell!2765)

(declare-fun mapRest!10538 () (Array (_ BitVec 32) ValueCell!2765))

(assert (=> mapNonEmpty!10538 (= mapRest!10529 (store mapRest!10538 mapKey!10538 mapValue!10538))))

(declare-fun mapIsEmpty!10538 () Bool)

(assert (=> mapIsEmpty!10538 mapRes!10538))

(declare-fun condMapEmpty!10538 () Bool)

(declare-fun mapDefault!10538 () ValueCell!2765)

(assert (=> mapNonEmpty!10529 (= condMapEmpty!10538 (= mapRest!10529 ((as const (Array (_ BitVec 32) ValueCell!2765)) mapDefault!10538)))))

(assert (=> mapNonEmpty!10529 (= tp!22241 (and e!153353 mapRes!10538))))

(assert (= (and mapNonEmpty!10529 condMapEmpty!10538) mapIsEmpty!10538))

(assert (= (and mapNonEmpty!10529 (not condMapEmpty!10538)) mapNonEmpty!10538))

(assert (= (and mapNonEmpty!10538 ((_ is ValueCellFull!2765) mapValue!10538)) b!236127))

(assert (= (and mapNonEmpty!10529 ((_ is ValueCellFull!2765) mapDefault!10538)) b!236128))

(declare-fun m!256535 () Bool)

(assert (=> mapNonEmpty!10538 m!256535))

(declare-fun b_lambda!7899 () Bool)

(assert (= b_lambda!7897 (or (and b!235962 b_free!6355) b_lambda!7899)))

(check-sat (not b!236085) (not d!59189) (not b!236086) (not b!236102) (not bm!21942) tp_is_empty!6217 (not bm!21944) (not d!59187) (not d!59195) (not b_lambda!7899) (not b!236028) (not b!236101) (not b!236120) (not b!236087) (not b!236100) (not d!59193) b_and!13269 (not b!236089) (not bm!21943) (not b!236026) (not b!236072) (not b!236081) (not b!236082) (not mapNonEmpty!10538) (not b!236077) (not bm!21941) (not b_next!6355))
(check-sat b_and!13269 (not b_next!6355))
(get-model)

(declare-fun b!236153 () Bool)

(declare-fun e!153369 () ListLongMap!3525)

(declare-fun call!21951 () ListLongMap!3525)

(assert (=> b!236153 (= e!153369 call!21951)))

(declare-fun bm!21948 () Bool)

(assert (=> bm!21948 (= call!21951 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4388 thiss!1504)))))

(declare-fun b!236154 () Bool)

(declare-fun e!153368 () Bool)

(declare-fun e!153371 () Bool)

(assert (=> b!236154 (= e!153368 e!153371)))

(assert (=> b!236154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun res!115780 () Bool)

(declare-fun lt!119303 () ListLongMap!3525)

(assert (=> b!236154 (= res!115780 (contains!1659 lt!119303 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236154 (=> (not res!115780) (not e!153371))))

(declare-fun d!59201 () Bool)

(declare-fun e!153372 () Bool)

(assert (=> d!59201 e!153372))

(declare-fun res!115777 () Bool)

(assert (=> d!59201 (=> (not res!115777) (not e!153372))))

(assert (=> d!59201 (= res!115777 (not (contains!1659 lt!119303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!153374 () ListLongMap!3525)

(assert (=> d!59201 (= lt!119303 e!153374)))

(declare-fun c!39325 () Bool)

(assert (=> d!59201 (= c!39325 (bvsge #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> d!59201 (validMask!0 (mask!10372 thiss!1504))))

(assert (=> d!59201 (= (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) lt!119303)))

(declare-fun b!236155 () Bool)

(declare-fun e!153370 () Bool)

(declare-fun isEmpty!516 (ListLongMap!3525) Bool)

(assert (=> b!236155 (= e!153370 (isEmpty!516 lt!119303))))

(declare-fun b!236156 () Bool)

(assert (=> b!236156 (= e!153374 e!153369)))

(declare-fun c!39324 () Bool)

(assert (=> b!236156 (= c!39324 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236157 () Bool)

(assert (=> b!236157 (= e!153368 e!153370)))

(declare-fun c!39326 () Bool)

(assert (=> b!236157 (= c!39326 (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun b!236158 () Bool)

(assert (=> b!236158 (= e!153374 (ListLongMap!3526 Nil!3541))))

(declare-fun b!236159 () Bool)

(declare-fun res!115778 () Bool)

(assert (=> b!236159 (=> (not res!115778) (not e!153372))))

(assert (=> b!236159 (= res!115778 (not (contains!1659 lt!119303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236160 () Bool)

(declare-fun lt!119299 () Unit!7264)

(declare-fun lt!119304 () Unit!7264)

(assert (=> b!236160 (= lt!119299 lt!119304)))

(declare-fun lt!119302 () V!7937)

(declare-fun lt!119298 () ListLongMap!3525)

(declare-fun lt!119300 () (_ BitVec 64))

(declare-fun lt!119301 () (_ BitVec 64))

(assert (=> b!236160 (not (contains!1659 (+!646 lt!119298 (tuple2!4623 lt!119300 lt!119302)) lt!119301))))

(declare-fun addStillNotContains!116 (ListLongMap!3525 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7264)

(assert (=> b!236160 (= lt!119304 (addStillNotContains!116 lt!119298 lt!119300 lt!119302 lt!119301))))

(assert (=> b!236160 (= lt!119301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!236160 (= lt!119302 (get!2850 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236160 (= lt!119300 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236160 (= lt!119298 call!21951)))

(assert (=> b!236160 (= e!153369 (+!646 call!21951 (tuple2!4623 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000) (get!2850 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!236161 () Bool)

(assert (=> b!236161 (= e!153372 e!153368)))

(declare-fun c!39323 () Bool)

(declare-fun e!153373 () Bool)

(assert (=> b!236161 (= c!39323 e!153373)))

(declare-fun res!115779 () Bool)

(assert (=> b!236161 (=> (not res!115779) (not e!153373))))

(assert (=> b!236161 (= res!115779 (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun b!236162 () Bool)

(assert (=> b!236162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> b!236162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5891 (_values!4371 thiss!1504))))))

(assert (=> b!236162 (= e!153371 (= (apply!213 lt!119303 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)) (get!2850 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236163 () Bool)

(assert (=> b!236163 (= e!153373 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236163 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!236164 () Bool)

(assert (=> b!236164 (= e!153370 (= lt!119303 (getCurrentListMapNoExtraKeys!529 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4388 thiss!1504))))))

(assert (= (and d!59201 c!39325) b!236158))

(assert (= (and d!59201 (not c!39325)) b!236156))

(assert (= (and b!236156 c!39324) b!236160))

(assert (= (and b!236156 (not c!39324)) b!236153))

(assert (= (or b!236160 b!236153) bm!21948))

(assert (= (and d!59201 res!115777) b!236159))

(assert (= (and b!236159 res!115778) b!236161))

(assert (= (and b!236161 res!115779) b!236163))

(assert (= (and b!236161 c!39323) b!236154))

(assert (= (and b!236161 (not c!39323)) b!236157))

(assert (= (and b!236154 res!115780) b!236162))

(assert (= (and b!236157 c!39326) b!236164))

(assert (= (and b!236157 (not c!39326)) b!236155))

(declare-fun b_lambda!7901 () Bool)

(assert (=> (not b_lambda!7901) (not b!236160)))

(assert (=> b!236160 t!8517))

(declare-fun b_and!13271 () Bool)

(assert (= b_and!13269 (and (=> t!8517 result!5131) b_and!13271)))

(declare-fun b_lambda!7903 () Bool)

(assert (=> (not b_lambda!7903) (not b!236162)))

(assert (=> b!236162 t!8517))

(declare-fun b_and!13273 () Bool)

(assert (= b_and!13271 (and (=> t!8517 result!5131) b_and!13273)))

(assert (=> b!236154 m!256461))

(assert (=> b!236154 m!256461))

(declare-fun m!256537 () Bool)

(assert (=> b!236154 m!256537))

(declare-fun m!256539 () Bool)

(assert (=> b!236160 m!256539))

(assert (=> b!236160 m!256461))

(declare-fun m!256541 () Bool)

(assert (=> b!236160 m!256541))

(declare-fun m!256543 () Bool)

(assert (=> b!236160 m!256543))

(assert (=> b!236160 m!256467))

(assert (=> b!236160 m!256543))

(declare-fun m!256545 () Bool)

(assert (=> b!236160 m!256545))

(assert (=> b!236160 m!256465))

(assert (=> b!236160 m!256465))

(assert (=> b!236160 m!256467))

(assert (=> b!236160 m!256469))

(declare-fun m!256547 () Bool)

(assert (=> b!236159 m!256547))

(declare-fun m!256549 () Bool)

(assert (=> b!236164 m!256549))

(assert (=> b!236163 m!256461))

(assert (=> b!236163 m!256461))

(assert (=> b!236163 m!256471))

(declare-fun m!256551 () Bool)

(assert (=> d!59201 m!256551))

(assert (=> d!59201 m!256413))

(assert (=> bm!21948 m!256549))

(assert (=> b!236162 m!256467))

(assert (=> b!236162 m!256461))

(declare-fun m!256553 () Bool)

(assert (=> b!236162 m!256553))

(assert (=> b!236162 m!256461))

(assert (=> b!236162 m!256465))

(assert (=> b!236162 m!256465))

(assert (=> b!236162 m!256467))

(assert (=> b!236162 m!256469))

(declare-fun m!256555 () Bool)

(assert (=> b!236155 m!256555))

(assert (=> b!236156 m!256461))

(assert (=> b!236156 m!256461))

(assert (=> b!236156 m!256471))

(assert (=> bm!21942 d!59201))

(declare-fun d!59203 () Bool)

(assert (=> d!59203 (isDefined!211 (getValueByKey!269 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-fun lt!119307 () Unit!7264)

(declare-fun choose!1111 (List!3544 (_ BitVec 64)) Unit!7264)

(assert (=> d!59203 (= lt!119307 (choose!1111 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-fun e!153377 () Bool)

(assert (=> d!59203 e!153377))

(declare-fun res!115783 () Bool)

(assert (=> d!59203 (=> (not res!115783) (not e!153377))))

(declare-fun isStrictlySorted!358 (List!3544) Bool)

(assert (=> d!59203 (= res!115783 (isStrictlySorted!358 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))))

(assert (=> d!59203 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932) lt!119307)))

(declare-fun b!236167 () Bool)

(assert (=> b!236167 (= e!153377 (containsKey!261 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(assert (= (and d!59203 res!115783) b!236167))

(assert (=> d!59203 m!256451))

(assert (=> d!59203 m!256451))

(assert (=> d!59203 m!256453))

(declare-fun m!256557 () Bool)

(assert (=> d!59203 m!256557))

(declare-fun m!256559 () Bool)

(assert (=> d!59203 m!256559))

(assert (=> b!236167 m!256447))

(assert (=> b!236026 d!59203))

(declare-fun d!59205 () Bool)

(declare-fun isEmpty!517 (Option!275) Bool)

(assert (=> d!59205 (= (isDefined!211 (getValueByKey!269 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932)) (not (isEmpty!517 (getValueByKey!269 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))))

(declare-fun bs!8702 () Bool)

(assert (= bs!8702 d!59205))

(assert (=> bs!8702 m!256451))

(declare-fun m!256561 () Bool)

(assert (=> bs!8702 m!256561))

(assert (=> b!236026 d!59205))

(declare-fun b!236176 () Bool)

(declare-fun e!153382 () Option!275)

(assert (=> b!236176 (= e!153382 (Some!274 (_2!2322 (h!4192 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))))))

(declare-fun b!236178 () Bool)

(declare-fun e!153383 () Option!275)

(assert (=> b!236178 (= e!153383 (getValueByKey!269 (t!8514 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) key!932))))

(declare-fun b!236179 () Bool)

(assert (=> b!236179 (= e!153383 None!273)))

(declare-fun b!236177 () Bool)

(assert (=> b!236177 (= e!153382 e!153383)))

(declare-fun c!39332 () Bool)

(assert (=> b!236177 (= c!39332 (and ((_ is Cons!3540) (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (not (= (_1!2322 (h!4192 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932))))))

(declare-fun d!59207 () Bool)

(declare-fun c!39331 () Bool)

(assert (=> d!59207 (= c!39331 (and ((_ is Cons!3540) (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (= (_1!2322 (h!4192 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)))))

(assert (=> d!59207 (= (getValueByKey!269 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932) e!153382)))

(assert (= (and d!59207 c!39331) b!236176))

(assert (= (and d!59207 (not c!39331)) b!236177))

(assert (= (and b!236177 c!39332) b!236178))

(assert (= (and b!236177 (not c!39332)) b!236179))

(declare-fun m!256563 () Bool)

(assert (=> b!236178 m!256563))

(assert (=> b!236026 d!59207))

(declare-fun d!59209 () Bool)

(assert (=> d!59209 (= (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236077 d!59209))

(declare-fun d!59211 () Bool)

(declare-fun get!2851 (Option!275) V!7937)

(assert (=> d!59211 (= (apply!213 lt!119255 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2851 (getValueByKey!269 (toList!1778 lt!119255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8703 () Bool)

(assert (= bs!8703 d!59211))

(declare-fun m!256565 () Bool)

(assert (=> bs!8703 m!256565))

(assert (=> bs!8703 m!256565))

(declare-fun m!256567 () Bool)

(assert (=> bs!8703 m!256567))

(assert (=> b!236085 d!59211))

(assert (=> d!59189 d!59191))

(assert (=> b!236028 d!59205))

(assert (=> b!236028 d!59207))

(declare-fun d!59213 () Bool)

(declare-fun e!153386 () Bool)

(assert (=> d!59213 e!153386))

(declare-fun res!115788 () Bool)

(assert (=> d!59213 (=> (not res!115788) (not e!153386))))

(declare-fun lt!119316 () ListLongMap!3525)

(assert (=> d!59213 (= res!115788 (contains!1659 lt!119316 (_1!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(declare-fun lt!119318 () List!3544)

(assert (=> d!59213 (= lt!119316 (ListLongMap!3526 lt!119318))))

(declare-fun lt!119319 () Unit!7264)

(declare-fun lt!119317 () Unit!7264)

(assert (=> d!59213 (= lt!119319 lt!119317)))

(assert (=> d!59213 (= (getValueByKey!269 lt!119318 (_1!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!152 (List!3544 (_ BitVec 64) V!7937) Unit!7264)

(assert (=> d!59213 (= lt!119317 (lemmaContainsTupThenGetReturnValue!152 lt!119318 (_1!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(declare-fun insertStrictlySorted!155 (List!3544 (_ BitVec 64) V!7937) List!3544)

(assert (=> d!59213 (= lt!119318 (insertStrictlySorted!155 (toList!1778 call!21947) (_1!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(assert (=> d!59213 (= (+!646 call!21947 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))) lt!119316)))

(declare-fun b!236184 () Bool)

(declare-fun res!115789 () Bool)

(assert (=> b!236184 (=> (not res!115789) (not e!153386))))

(assert (=> b!236184 (= res!115789 (= (getValueByKey!269 (toList!1778 lt!119316) (_1!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(declare-fun b!236185 () Bool)

(declare-fun contains!1661 (List!3544 tuple2!4622) Bool)

(assert (=> b!236185 (= e!153386 (contains!1661 (toList!1778 lt!119316) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))

(assert (= (and d!59213 res!115788) b!236184))

(assert (= (and b!236184 res!115789) b!236185))

(declare-fun m!256569 () Bool)

(assert (=> d!59213 m!256569))

(declare-fun m!256571 () Bool)

(assert (=> d!59213 m!256571))

(declare-fun m!256573 () Bool)

(assert (=> d!59213 m!256573))

(declare-fun m!256575 () Bool)

(assert (=> d!59213 m!256575))

(declare-fun m!256577 () Bool)

(assert (=> b!236184 m!256577))

(declare-fun m!256579 () Bool)

(assert (=> b!236185 m!256579))

(assert (=> b!236086 d!59213))

(declare-fun d!59215 () Bool)

(declare-fun e!153388 () Bool)

(assert (=> d!59215 e!153388))

(declare-fun res!115790 () Bool)

(assert (=> d!59215 (=> res!115790 e!153388)))

(declare-fun lt!119322 () Bool)

(assert (=> d!59215 (= res!115790 (not lt!119322))))

(declare-fun lt!119321 () Bool)

(assert (=> d!59215 (= lt!119322 lt!119321)))

(declare-fun lt!119320 () Unit!7264)

(declare-fun e!153387 () Unit!7264)

(assert (=> d!59215 (= lt!119320 e!153387)))

(declare-fun c!39333 () Bool)

(assert (=> d!59215 (= c!39333 lt!119321)))

(assert (=> d!59215 (= lt!119321 (containsKey!261 (toList!1778 lt!119255) (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59215 (= (contains!1659 lt!119255 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)) lt!119322)))

(declare-fun b!236186 () Bool)

(declare-fun lt!119323 () Unit!7264)

(assert (=> b!236186 (= e!153387 lt!119323)))

(assert (=> b!236186 (= lt!119323 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1778 lt!119255) (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236186 (isDefined!211 (getValueByKey!269 (toList!1778 lt!119255) (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236187 () Bool)

(declare-fun Unit!7268 () Unit!7264)

(assert (=> b!236187 (= e!153387 Unit!7268)))

(declare-fun b!236188 () Bool)

(assert (=> b!236188 (= e!153388 (isDefined!211 (getValueByKey!269 (toList!1778 lt!119255) (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59215 c!39333) b!236186))

(assert (= (and d!59215 (not c!39333)) b!236187))

(assert (= (and d!59215 (not res!115790)) b!236188))

(assert (=> d!59215 m!256461))

(declare-fun m!256581 () Bool)

(assert (=> d!59215 m!256581))

(assert (=> b!236186 m!256461))

(declare-fun m!256583 () Bool)

(assert (=> b!236186 m!256583))

(assert (=> b!236186 m!256461))

(declare-fun m!256585 () Bool)

(assert (=> b!236186 m!256585))

(assert (=> b!236186 m!256585))

(declare-fun m!256587 () Bool)

(assert (=> b!236186 m!256587))

(assert (=> b!236188 m!256461))

(assert (=> b!236188 m!256585))

(assert (=> b!236188 m!256585))

(assert (=> b!236188 m!256587))

(assert (=> b!236087 d!59215))

(declare-fun d!59217 () Bool)

(declare-fun e!153390 () Bool)

(assert (=> d!59217 e!153390))

(declare-fun res!115791 () Bool)

(assert (=> d!59217 (=> res!115791 e!153390)))

(declare-fun lt!119326 () Bool)

(assert (=> d!59217 (= res!115791 (not lt!119326))))

(declare-fun lt!119325 () Bool)

(assert (=> d!59217 (= lt!119326 lt!119325)))

(declare-fun lt!119324 () Unit!7264)

(declare-fun e!153389 () Unit!7264)

(assert (=> d!59217 (= lt!119324 e!153389)))

(declare-fun c!39334 () Bool)

(assert (=> d!59217 (= c!39334 lt!119325)))

(assert (=> d!59217 (= lt!119325 (containsKey!261 (toList!1778 lt!119255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59217 (= (contains!1659 lt!119255 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119326)))

(declare-fun b!236189 () Bool)

(declare-fun lt!119327 () Unit!7264)

(assert (=> b!236189 (= e!153389 lt!119327)))

(assert (=> b!236189 (= lt!119327 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1778 lt!119255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236189 (isDefined!211 (getValueByKey!269 (toList!1778 lt!119255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236190 () Bool)

(declare-fun Unit!7269 () Unit!7264)

(assert (=> b!236190 (= e!153389 Unit!7269)))

(declare-fun b!236191 () Bool)

(assert (=> b!236191 (= e!153390 (isDefined!211 (getValueByKey!269 (toList!1778 lt!119255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59217 c!39334) b!236189))

(assert (= (and d!59217 (not c!39334)) b!236190))

(assert (= (and d!59217 (not res!115791)) b!236191))

(declare-fun m!256589 () Bool)

(assert (=> d!59217 m!256589))

(declare-fun m!256591 () Bool)

(assert (=> b!236189 m!256591))

(declare-fun m!256593 () Bool)

(assert (=> b!236189 m!256593))

(assert (=> b!236189 m!256593))

(declare-fun m!256595 () Bool)

(assert (=> b!236189 m!256595))

(assert (=> b!236191 m!256593))

(assert (=> b!236191 m!256593))

(assert (=> b!236191 m!256595))

(assert (=> bm!21943 d!59217))

(declare-fun d!59219 () Bool)

(assert (=> d!59219 (= (apply!213 (+!646 lt!119266 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))) lt!119253) (get!2851 (getValueByKey!269 (toList!1778 (+!646 lt!119266 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))) lt!119253)))))

(declare-fun bs!8704 () Bool)

(assert (= bs!8704 d!59219))

(declare-fun m!256597 () Bool)

(assert (=> bs!8704 m!256597))

(assert (=> bs!8704 m!256597))

(declare-fun m!256599 () Bool)

(assert (=> bs!8704 m!256599))

(assert (=> b!236072 d!59219))

(declare-fun d!59221 () Bool)

(assert (=> d!59221 (= (apply!213 lt!119266 lt!119253) (get!2851 (getValueByKey!269 (toList!1778 lt!119266) lt!119253)))))

(declare-fun bs!8705 () Bool)

(assert (= bs!8705 d!59221))

(declare-fun m!256601 () Bool)

(assert (=> bs!8705 m!256601))

(assert (=> bs!8705 m!256601))

(declare-fun m!256603 () Bool)

(assert (=> bs!8705 m!256603))

(assert (=> b!236072 d!59221))

(declare-fun d!59223 () Bool)

(declare-fun e!153391 () Bool)

(assert (=> d!59223 e!153391))

(declare-fun res!115792 () Bool)

(assert (=> d!59223 (=> (not res!115792) (not e!153391))))

(declare-fun lt!119328 () ListLongMap!3525)

(assert (=> d!59223 (= res!115792 (contains!1659 lt!119328 (_1!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))))))

(declare-fun lt!119330 () List!3544)

(assert (=> d!59223 (= lt!119328 (ListLongMap!3526 lt!119330))))

(declare-fun lt!119331 () Unit!7264)

(declare-fun lt!119329 () Unit!7264)

(assert (=> d!59223 (= lt!119331 lt!119329)))

(assert (=> d!59223 (= (getValueByKey!269 lt!119330 (_1!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))))))

(assert (=> d!59223 (= lt!119329 (lemmaContainsTupThenGetReturnValue!152 lt!119330 (_1!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))))))

(assert (=> d!59223 (= lt!119330 (insertStrictlySorted!155 (toList!1778 lt!119259) (_1!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))))))

(assert (=> d!59223 (= (+!646 lt!119259 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))) lt!119328)))

(declare-fun b!236192 () Bool)

(declare-fun res!115793 () Bool)

(assert (=> b!236192 (=> (not res!115793) (not e!153391))))

(assert (=> b!236192 (= res!115793 (= (getValueByKey!269 (toList!1778 lt!119328) (_1!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))))))))

(declare-fun b!236193 () Bool)

(assert (=> b!236193 (= e!153391 (contains!1661 (toList!1778 lt!119328) (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))))))

(assert (= (and d!59223 res!115792) b!236192))

(assert (= (and b!236192 res!115793) b!236193))

(declare-fun m!256605 () Bool)

(assert (=> d!59223 m!256605))

(declare-fun m!256607 () Bool)

(assert (=> d!59223 m!256607))

(declare-fun m!256609 () Bool)

(assert (=> d!59223 m!256609))

(declare-fun m!256611 () Bool)

(assert (=> d!59223 m!256611))

(declare-fun m!256613 () Bool)

(assert (=> b!236192 m!256613))

(declare-fun m!256615 () Bool)

(assert (=> b!236193 m!256615))

(assert (=> b!236072 d!59223))

(declare-fun d!59225 () Bool)

(assert (=> d!59225 (= (apply!213 lt!119260 lt!119262) (get!2851 (getValueByKey!269 (toList!1778 lt!119260) lt!119262)))))

(declare-fun bs!8706 () Bool)

(assert (= bs!8706 d!59225))

(declare-fun m!256617 () Bool)

(assert (=> bs!8706 m!256617))

(assert (=> bs!8706 m!256617))

(declare-fun m!256619 () Bool)

(assert (=> bs!8706 m!256619))

(assert (=> b!236072 d!59225))

(declare-fun d!59227 () Bool)

(assert (=> d!59227 (= (apply!213 (+!646 lt!119260 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))) lt!119262) (apply!213 lt!119260 lt!119262))))

(declare-fun lt!119334 () Unit!7264)

(declare-fun choose!1112 (ListLongMap!3525 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7264)

(assert (=> d!59227 (= lt!119334 (choose!1112 lt!119260 lt!119257 (minValue!4229 thiss!1504) lt!119262))))

(declare-fun e!153394 () Bool)

(assert (=> d!59227 e!153394))

(declare-fun res!115796 () Bool)

(assert (=> d!59227 (=> (not res!115796) (not e!153394))))

(assert (=> d!59227 (= res!115796 (contains!1659 lt!119260 lt!119262))))

(assert (=> d!59227 (= (addApplyDifferent!189 lt!119260 lt!119257 (minValue!4229 thiss!1504) lt!119262) lt!119334)))

(declare-fun b!236197 () Bool)

(assert (=> b!236197 (= e!153394 (not (= lt!119262 lt!119257)))))

(assert (= (and d!59227 res!115796) b!236197))

(assert (=> d!59227 m!256493))

(assert (=> d!59227 m!256489))

(assert (=> d!59227 m!256497))

(declare-fun m!256621 () Bool)

(assert (=> d!59227 m!256621))

(assert (=> d!59227 m!256489))

(declare-fun m!256623 () Bool)

(assert (=> d!59227 m!256623))

(assert (=> b!236072 d!59227))

(assert (=> b!236072 d!59201))

(declare-fun d!59229 () Bool)

(assert (=> d!59229 (= (apply!213 lt!119259 lt!119271) (get!2851 (getValueByKey!269 (toList!1778 lt!119259) lt!119271)))))

(declare-fun bs!8707 () Bool)

(assert (= bs!8707 d!59229))

(declare-fun m!256625 () Bool)

(assert (=> bs!8707 m!256625))

(assert (=> bs!8707 m!256625))

(declare-fun m!256627 () Bool)

(assert (=> bs!8707 m!256627))

(assert (=> b!236072 d!59229))

(declare-fun d!59231 () Bool)

(declare-fun e!153395 () Bool)

(assert (=> d!59231 e!153395))

(declare-fun res!115797 () Bool)

(assert (=> d!59231 (=> (not res!115797) (not e!153395))))

(declare-fun lt!119335 () ListLongMap!3525)

(assert (=> d!59231 (= res!115797 (contains!1659 lt!119335 (_1!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))))))

(declare-fun lt!119337 () List!3544)

(assert (=> d!59231 (= lt!119335 (ListLongMap!3526 lt!119337))))

(declare-fun lt!119338 () Unit!7264)

(declare-fun lt!119336 () Unit!7264)

(assert (=> d!59231 (= lt!119338 lt!119336)))

(assert (=> d!59231 (= (getValueByKey!269 lt!119337 (_1!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59231 (= lt!119336 (lemmaContainsTupThenGetReturnValue!152 lt!119337 (_1!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59231 (= lt!119337 (insertStrictlySorted!155 (toList!1778 lt!119256) (_1!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59231 (= (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))) lt!119335)))

(declare-fun b!236198 () Bool)

(declare-fun res!115798 () Bool)

(assert (=> b!236198 (=> (not res!115798) (not e!153395))))

(assert (=> b!236198 (= res!115798 (= (getValueByKey!269 (toList!1778 lt!119335) (_1!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))))))))

(declare-fun b!236199 () Bool)

(assert (=> b!236199 (= e!153395 (contains!1661 (toList!1778 lt!119335) (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))))))

(assert (= (and d!59231 res!115797) b!236198))

(assert (= (and b!236198 res!115798) b!236199))

(declare-fun m!256629 () Bool)

(assert (=> d!59231 m!256629))

(declare-fun m!256631 () Bool)

(assert (=> d!59231 m!256631))

(declare-fun m!256633 () Bool)

(assert (=> d!59231 m!256633))

(declare-fun m!256635 () Bool)

(assert (=> d!59231 m!256635))

(declare-fun m!256637 () Bool)

(assert (=> b!236198 m!256637))

(declare-fun m!256639 () Bool)

(assert (=> b!236199 m!256639))

(assert (=> b!236072 d!59231))

(declare-fun d!59233 () Bool)

(assert (=> d!59233 (= (apply!213 (+!646 lt!119260 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))) lt!119262) (get!2851 (getValueByKey!269 (toList!1778 (+!646 lt!119260 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))) lt!119262)))))

(declare-fun bs!8708 () Bool)

(assert (= bs!8708 d!59233))

(declare-fun m!256641 () Bool)

(assert (=> bs!8708 m!256641))

(assert (=> bs!8708 m!256641))

(declare-fun m!256643 () Bool)

(assert (=> bs!8708 m!256643))

(assert (=> b!236072 d!59233))

(declare-fun d!59235 () Bool)

(declare-fun e!153397 () Bool)

(assert (=> d!59235 e!153397))

(declare-fun res!115799 () Bool)

(assert (=> d!59235 (=> res!115799 e!153397)))

(declare-fun lt!119341 () Bool)

(assert (=> d!59235 (= res!115799 (not lt!119341))))

(declare-fun lt!119340 () Bool)

(assert (=> d!59235 (= lt!119341 lt!119340)))

(declare-fun lt!119339 () Unit!7264)

(declare-fun e!153396 () Unit!7264)

(assert (=> d!59235 (= lt!119339 e!153396)))

(declare-fun c!39335 () Bool)

(assert (=> d!59235 (= c!39335 lt!119340)))

(assert (=> d!59235 (= lt!119340 (containsKey!261 (toList!1778 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))) lt!119270))))

(assert (=> d!59235 (= (contains!1659 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))) lt!119270) lt!119341)))

(declare-fun b!236200 () Bool)

(declare-fun lt!119342 () Unit!7264)

(assert (=> b!236200 (= e!153396 lt!119342)))

(assert (=> b!236200 (= lt!119342 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1778 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))) lt!119270))))

(assert (=> b!236200 (isDefined!211 (getValueByKey!269 (toList!1778 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))) lt!119270))))

(declare-fun b!236201 () Bool)

(declare-fun Unit!7270 () Unit!7264)

(assert (=> b!236201 (= e!153396 Unit!7270)))

(declare-fun b!236202 () Bool)

(assert (=> b!236202 (= e!153397 (isDefined!211 (getValueByKey!269 (toList!1778 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504)))) lt!119270)))))

(assert (= (and d!59235 c!39335) b!236200))

(assert (= (and d!59235 (not c!39335)) b!236201))

(assert (= (and d!59235 (not res!115799)) b!236202))

(declare-fun m!256645 () Bool)

(assert (=> d!59235 m!256645))

(declare-fun m!256647 () Bool)

(assert (=> b!236200 m!256647))

(declare-fun m!256649 () Bool)

(assert (=> b!236200 m!256649))

(assert (=> b!236200 m!256649))

(declare-fun m!256651 () Bool)

(assert (=> b!236200 m!256651))

(assert (=> b!236202 m!256649))

(assert (=> b!236202 m!256649))

(assert (=> b!236202 m!256651))

(assert (=> b!236072 d!59235))

(declare-fun d!59237 () Bool)

(assert (=> d!59237 (= (apply!213 (+!646 lt!119259 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))) lt!119271) (apply!213 lt!119259 lt!119271))))

(declare-fun lt!119343 () Unit!7264)

(assert (=> d!59237 (= lt!119343 (choose!1112 lt!119259 lt!119265 (minValue!4229 thiss!1504) lt!119271))))

(declare-fun e!153398 () Bool)

(assert (=> d!59237 e!153398))

(declare-fun res!115800 () Bool)

(assert (=> d!59237 (=> (not res!115800) (not e!153398))))

(assert (=> d!59237 (= res!115800 (contains!1659 lt!119259 lt!119271))))

(assert (=> d!59237 (= (addApplyDifferent!189 lt!119259 lt!119265 (minValue!4229 thiss!1504) lt!119271) lt!119343)))

(declare-fun b!236203 () Bool)

(assert (=> b!236203 (= e!153398 (not (= lt!119271 lt!119265)))))

(assert (= (and d!59237 res!115800) b!236203))

(assert (=> d!59237 m!256491))

(assert (=> d!59237 m!256501))

(assert (=> d!59237 m!256503))

(declare-fun m!256653 () Bool)

(assert (=> d!59237 m!256653))

(assert (=> d!59237 m!256501))

(declare-fun m!256655 () Bool)

(assert (=> d!59237 m!256655))

(assert (=> b!236072 d!59237))

(declare-fun d!59239 () Bool)

(assert (=> d!59239 (= (apply!213 (+!646 lt!119266 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))) lt!119253) (apply!213 lt!119266 lt!119253))))

(declare-fun lt!119344 () Unit!7264)

(assert (=> d!59239 (= lt!119344 (choose!1112 lt!119266 lt!119267 (zeroValue!4229 thiss!1504) lt!119253))))

(declare-fun e!153399 () Bool)

(assert (=> d!59239 e!153399))

(declare-fun res!115801 () Bool)

(assert (=> d!59239 (=> (not res!115801) (not e!153399))))

(assert (=> d!59239 (= res!115801 (contains!1659 lt!119266 lt!119253))))

(assert (=> d!59239 (= (addApplyDifferent!189 lt!119266 lt!119267 (zeroValue!4229 thiss!1504) lt!119253) lt!119344)))

(declare-fun b!236204 () Bool)

(assert (=> b!236204 (= e!153399 (not (= lt!119253 lt!119267)))))

(assert (= (and d!59239 res!115801) b!236204))

(assert (=> d!59239 m!256495))

(assert (=> d!59239 m!256499))

(assert (=> d!59239 m!256509))

(declare-fun m!256657 () Bool)

(assert (=> d!59239 m!256657))

(assert (=> d!59239 m!256499))

(declare-fun m!256659 () Bool)

(assert (=> d!59239 m!256659))

(assert (=> b!236072 d!59239))

(declare-fun d!59241 () Bool)

(assert (=> d!59241 (contains!1659 (+!646 lt!119256 (tuple2!4623 lt!119263 (zeroValue!4229 thiss!1504))) lt!119270)))

(declare-fun lt!119347 () Unit!7264)

(declare-fun choose!1113 (ListLongMap!3525 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7264)

(assert (=> d!59241 (= lt!119347 (choose!1113 lt!119256 lt!119263 (zeroValue!4229 thiss!1504) lt!119270))))

(assert (=> d!59241 (contains!1659 lt!119256 lt!119270)))

(assert (=> d!59241 (= (addStillContains!189 lt!119256 lt!119263 (zeroValue!4229 thiss!1504) lt!119270) lt!119347)))

(declare-fun bs!8709 () Bool)

(assert (= bs!8709 d!59241))

(assert (=> bs!8709 m!256483))

(assert (=> bs!8709 m!256483))

(assert (=> bs!8709 m!256485))

(declare-fun m!256661 () Bool)

(assert (=> bs!8709 m!256661))

(declare-fun m!256663 () Bool)

(assert (=> bs!8709 m!256663))

(assert (=> b!236072 d!59241))

(declare-fun d!59243 () Bool)

(declare-fun e!153400 () Bool)

(assert (=> d!59243 e!153400))

(declare-fun res!115802 () Bool)

(assert (=> d!59243 (=> (not res!115802) (not e!153400))))

(declare-fun lt!119348 () ListLongMap!3525)

(assert (=> d!59243 (= res!115802 (contains!1659 lt!119348 (_1!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))))))

(declare-fun lt!119350 () List!3544)

(assert (=> d!59243 (= lt!119348 (ListLongMap!3526 lt!119350))))

(declare-fun lt!119351 () Unit!7264)

(declare-fun lt!119349 () Unit!7264)

(assert (=> d!59243 (= lt!119351 lt!119349)))

(assert (=> d!59243 (= (getValueByKey!269 lt!119350 (_1!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))))))

(assert (=> d!59243 (= lt!119349 (lemmaContainsTupThenGetReturnValue!152 lt!119350 (_1!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))))))

(assert (=> d!59243 (= lt!119350 (insertStrictlySorted!155 (toList!1778 lt!119260) (_1!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))))))

(assert (=> d!59243 (= (+!646 lt!119260 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))) lt!119348)))

(declare-fun b!236206 () Bool)

(declare-fun res!115803 () Bool)

(assert (=> b!236206 (=> (not res!115803) (not e!153400))))

(assert (=> b!236206 (= res!115803 (= (getValueByKey!269 (toList!1778 lt!119348) (_1!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))))))))

(declare-fun b!236207 () Bool)

(assert (=> b!236207 (= e!153400 (contains!1661 (toList!1778 lt!119348) (tuple2!4623 lt!119257 (minValue!4229 thiss!1504))))))

(assert (= (and d!59243 res!115802) b!236206))

(assert (= (and b!236206 res!115803) b!236207))

(declare-fun m!256665 () Bool)

(assert (=> d!59243 m!256665))

(declare-fun m!256667 () Bool)

(assert (=> d!59243 m!256667))

(declare-fun m!256669 () Bool)

(assert (=> d!59243 m!256669))

(declare-fun m!256671 () Bool)

(assert (=> d!59243 m!256671))

(declare-fun m!256673 () Bool)

(assert (=> b!236206 m!256673))

(declare-fun m!256675 () Bool)

(assert (=> b!236207 m!256675))

(assert (=> b!236072 d!59243))

(declare-fun d!59245 () Bool)

(declare-fun e!153401 () Bool)

(assert (=> d!59245 e!153401))

(declare-fun res!115804 () Bool)

(assert (=> d!59245 (=> (not res!115804) (not e!153401))))

(declare-fun lt!119352 () ListLongMap!3525)

(assert (=> d!59245 (= res!115804 (contains!1659 lt!119352 (_1!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))))))

(declare-fun lt!119354 () List!3544)

(assert (=> d!59245 (= lt!119352 (ListLongMap!3526 lt!119354))))

(declare-fun lt!119355 () Unit!7264)

(declare-fun lt!119353 () Unit!7264)

(assert (=> d!59245 (= lt!119355 lt!119353)))

(assert (=> d!59245 (= (getValueByKey!269 lt!119354 (_1!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59245 (= lt!119353 (lemmaContainsTupThenGetReturnValue!152 lt!119354 (_1!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59245 (= lt!119354 (insertStrictlySorted!155 (toList!1778 lt!119266) (_1!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))) (_2!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59245 (= (+!646 lt!119266 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))) lt!119352)))

(declare-fun b!236208 () Bool)

(declare-fun res!115805 () Bool)

(assert (=> b!236208 (=> (not res!115805) (not e!153401))))

(assert (=> b!236208 (= res!115805 (= (getValueByKey!269 (toList!1778 lt!119352) (_1!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504)))) (Some!274 (_2!2322 (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))))))))

(declare-fun b!236209 () Bool)

(assert (=> b!236209 (= e!153401 (contains!1661 (toList!1778 lt!119352) (tuple2!4623 lt!119267 (zeroValue!4229 thiss!1504))))))

(assert (= (and d!59245 res!115804) b!236208))

(assert (= (and b!236208 res!115805) b!236209))

(declare-fun m!256677 () Bool)

(assert (=> d!59245 m!256677))

(declare-fun m!256679 () Bool)

(assert (=> d!59245 m!256679))

(declare-fun m!256681 () Bool)

(assert (=> d!59245 m!256681))

(declare-fun m!256683 () Bool)

(assert (=> d!59245 m!256683))

(declare-fun m!256685 () Bool)

(assert (=> b!236208 m!256685))

(declare-fun m!256687 () Bool)

(assert (=> b!236209 m!256687))

(assert (=> b!236072 d!59245))

(declare-fun d!59247 () Bool)

(assert (=> d!59247 (= (apply!213 (+!646 lt!119259 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504))) lt!119271) (get!2851 (getValueByKey!269 (toList!1778 (+!646 lt!119259 (tuple2!4623 lt!119265 (minValue!4229 thiss!1504)))) lt!119271)))))

(declare-fun bs!8710 () Bool)

(assert (= bs!8710 d!59247))

(declare-fun m!256689 () Bool)

(assert (=> bs!8710 m!256689))

(assert (=> bs!8710 m!256689))

(declare-fun m!256691 () Bool)

(assert (=> bs!8710 m!256691))

(assert (=> b!236072 d!59247))

(declare-fun b!236218 () Bool)

(declare-fun res!115814 () Bool)

(declare-fun e!153404 () Bool)

(assert (=> b!236218 (=> (not res!115814) (not e!153404))))

(assert (=> b!236218 (= res!115814 (and (= (size!5891 (_values!4371 thiss!1504)) (bvadd (mask!10372 thiss!1504) #b00000000000000000000000000000001)) (= (size!5892 (_keys!6466 thiss!1504)) (size!5891 (_values!4371 thiss!1504))) (bvsge (_size!1764 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1764 thiss!1504) (bvadd (mask!10372 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!236219 () Bool)

(declare-fun res!115815 () Bool)

(assert (=> b!236219 (=> (not res!115815) (not e!153404))))

(declare-fun size!5897 (LongMapFixedSize!3430) (_ BitVec 32))

(assert (=> b!236219 (= res!115815 (bvsge (size!5897 thiss!1504) (_size!1764 thiss!1504)))))

(declare-fun d!59249 () Bool)

(declare-fun res!115817 () Bool)

(assert (=> d!59249 (=> (not res!115817) (not e!153404))))

(assert (=> d!59249 (= res!115817 (validMask!0 (mask!10372 thiss!1504)))))

(assert (=> d!59249 (= (simpleValid!236 thiss!1504) e!153404)))

(declare-fun b!236220 () Bool)

(declare-fun res!115816 () Bool)

(assert (=> b!236220 (=> (not res!115816) (not e!153404))))

(assert (=> b!236220 (= res!115816 (= (size!5897 thiss!1504) (bvadd (_size!1764 thiss!1504) (bvsdiv (bvadd (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!236221 () Bool)

(assert (=> b!236221 (= e!153404 (and (bvsge (extraKeys!4125 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4125 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1764 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!59249 res!115817) b!236218))

(assert (= (and b!236218 res!115814) b!236219))

(assert (= (and b!236219 res!115815) b!236220))

(assert (= (and b!236220 res!115816) b!236221))

(declare-fun m!256693 () Bool)

(assert (=> b!236219 m!256693))

(assert (=> d!59249 m!256413))

(assert (=> b!236220 m!256693))

(assert (=> d!59193 d!59249))

(assert (=> b!236081 d!59209))

(declare-fun d!59251 () Bool)

(declare-fun e!153406 () Bool)

(assert (=> d!59251 e!153406))

(declare-fun res!115818 () Bool)

(assert (=> d!59251 (=> res!115818 e!153406)))

(declare-fun lt!119358 () Bool)

(assert (=> d!59251 (= res!115818 (not lt!119358))))

(declare-fun lt!119357 () Bool)

(assert (=> d!59251 (= lt!119358 lt!119357)))

(declare-fun lt!119356 () Unit!7264)

(declare-fun e!153405 () Unit!7264)

(assert (=> d!59251 (= lt!119356 e!153405)))

(declare-fun c!39336 () Bool)

(assert (=> d!59251 (= c!39336 lt!119357)))

(assert (=> d!59251 (= lt!119357 (containsKey!261 (toList!1778 lt!119255) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59251 (= (contains!1659 lt!119255 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119358)))

(declare-fun b!236222 () Bool)

(declare-fun lt!119359 () Unit!7264)

(assert (=> b!236222 (= e!153405 lt!119359)))

(assert (=> b!236222 (= lt!119359 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1778 lt!119255) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236222 (isDefined!211 (getValueByKey!269 (toList!1778 lt!119255) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236223 () Bool)

(declare-fun Unit!7271 () Unit!7264)

(assert (=> b!236223 (= e!153405 Unit!7271)))

(declare-fun b!236224 () Bool)

(assert (=> b!236224 (= e!153406 (isDefined!211 (getValueByKey!269 (toList!1778 lt!119255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59251 c!39336) b!236222))

(assert (= (and d!59251 (not c!39336)) b!236223))

(assert (= (and d!59251 (not res!115818)) b!236224))

(declare-fun m!256695 () Bool)

(assert (=> d!59251 m!256695))

(declare-fun m!256697 () Bool)

(assert (=> b!236222 m!256697))

(assert (=> b!236222 m!256565))

(assert (=> b!236222 m!256565))

(declare-fun m!256699 () Bool)

(assert (=> b!236222 m!256699))

(assert (=> b!236224 m!256565))

(assert (=> b!236224 m!256565))

(assert (=> b!236224 m!256699))

(assert (=> bm!21944 d!59251))

(declare-fun b!236233 () Bool)

(declare-fun e!153411 () (_ BitVec 32))

(assert (=> b!236233 (= e!153411 #b00000000000000000000000000000000)))

(declare-fun bm!21951 () Bool)

(declare-fun call!21954 () (_ BitVec 32))

(assert (=> bm!21951 (= call!21954 (arrayCountValidKeys!0 (_keys!6466 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun d!59253 () Bool)

(declare-fun lt!119362 () (_ BitVec 32))

(assert (=> d!59253 (and (bvsge lt!119362 #b00000000000000000000000000000000) (bvsle lt!119362 (bvsub (size!5892 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59253 (= lt!119362 e!153411)))

(declare-fun c!39341 () Bool)

(assert (=> d!59253 (= c!39341 (bvsge #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> d!59253 (and (bvsle #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5892 (_keys!6466 thiss!1504)) (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> d!59253 (= (arrayCountValidKeys!0 (_keys!6466 thiss!1504) #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))) lt!119362)))

(declare-fun b!236234 () Bool)

(declare-fun e!153412 () (_ BitVec 32))

(assert (=> b!236234 (= e!153412 (bvadd #b00000000000000000000000000000001 call!21954))))

(declare-fun b!236235 () Bool)

(assert (=> b!236235 (= e!153411 e!153412)))

(declare-fun c!39342 () Bool)

(assert (=> b!236235 (= c!39342 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236236 () Bool)

(assert (=> b!236236 (= e!153412 call!21954)))

(assert (= (and d!59253 c!39341) b!236233))

(assert (= (and d!59253 (not c!39341)) b!236235))

(assert (= (and b!236235 c!39342) b!236234))

(assert (= (and b!236235 (not c!39342)) b!236236))

(assert (= (or b!236234 b!236236) bm!21951))

(declare-fun m!256701 () Bool)

(assert (=> bm!21951 m!256701))

(assert (=> b!236235 m!256461))

(assert (=> b!236235 m!256461))

(assert (=> b!236235 m!256471))

(assert (=> b!236100 d!59253))

(declare-fun d!59255 () Bool)

(declare-fun e!153413 () Bool)

(assert (=> d!59255 e!153413))

(declare-fun res!115819 () Bool)

(assert (=> d!59255 (=> (not res!115819) (not e!153413))))

(declare-fun lt!119363 () ListLongMap!3525)

(assert (=> d!59255 (= res!115819 (contains!1659 lt!119363 (_1!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(declare-fun lt!119365 () List!3544)

(assert (=> d!59255 (= lt!119363 (ListLongMap!3526 lt!119365))))

(declare-fun lt!119366 () Unit!7264)

(declare-fun lt!119364 () Unit!7264)

(assert (=> d!59255 (= lt!119366 lt!119364)))

(assert (=> d!59255 (= (getValueByKey!269 lt!119365 (_1!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))) (Some!274 (_2!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(assert (=> d!59255 (= lt!119364 (lemmaContainsTupThenGetReturnValue!152 lt!119365 (_1!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (_2!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(assert (=> d!59255 (= lt!119365 (insertStrictlySorted!155 (toList!1778 (ite c!39304 call!21942 (ite c!39301 call!21944 call!21943))) (_1!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (_2!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(assert (=> d!59255 (= (+!646 (ite c!39304 call!21942 (ite c!39301 call!21944 call!21943)) (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) lt!119363)))

(declare-fun b!236237 () Bool)

(declare-fun res!115820 () Bool)

(assert (=> b!236237 (=> (not res!115820) (not e!153413))))

(assert (=> b!236237 (= res!115820 (= (getValueByKey!269 (toList!1778 lt!119363) (_1!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))) (Some!274 (_2!2322 (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))))

(declare-fun b!236238 () Bool)

(assert (=> b!236238 (= e!153413 (contains!1661 (toList!1778 lt!119363) (ite (or c!39304 c!39301) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(assert (= (and d!59255 res!115819) b!236237))

(assert (= (and b!236237 res!115820) b!236238))

(declare-fun m!256703 () Bool)

(assert (=> d!59255 m!256703))

(declare-fun m!256705 () Bool)

(assert (=> d!59255 m!256705))

(declare-fun m!256707 () Bool)

(assert (=> d!59255 m!256707))

(declare-fun m!256709 () Bool)

(assert (=> d!59255 m!256709))

(declare-fun m!256711 () Bool)

(assert (=> b!236237 m!256711))

(declare-fun m!256713 () Bool)

(assert (=> b!236238 m!256713))

(assert (=> bm!21941 d!59255))

(declare-fun d!59257 () Bool)

(assert (=> d!59257 (= (apply!213 lt!119255 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2851 (getValueByKey!269 (toList!1778 lt!119255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8711 () Bool)

(assert (= bs!8711 d!59257))

(assert (=> bs!8711 m!256593))

(assert (=> bs!8711 m!256593))

(declare-fun m!256715 () Bool)

(assert (=> bs!8711 m!256715))

(assert (=> b!236089 d!59257))

(declare-fun b!236251 () Bool)

(declare-fun e!153421 () SeekEntryResult!998)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236251 (= e!153421 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23853 lt!119282) #b00000000000000000000000000000001) (nextIndex!0 (index!6164 lt!119282) (x!23853 lt!119282) (mask!10372 thiss!1504)) (index!6164 lt!119282) key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(declare-fun b!236252 () Bool)

(declare-fun c!39350 () Bool)

(declare-fun lt!119372 () (_ BitVec 64))

(assert (=> b!236252 (= c!39350 (= lt!119372 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153420 () SeekEntryResult!998)

(assert (=> b!236252 (= e!153420 e!153421)))

(declare-fun b!236253 () Bool)

(declare-fun e!153422 () SeekEntryResult!998)

(assert (=> b!236253 (= e!153422 Undefined!998)))

(declare-fun b!236255 () Bool)

(assert (=> b!236255 (= e!153422 e!153420)))

(declare-fun c!39351 () Bool)

(assert (=> b!236255 (= c!39351 (= lt!119372 key!932))))

(declare-fun b!236256 () Bool)

(assert (=> b!236256 (= e!153421 (MissingVacant!998 (index!6164 lt!119282)))))

(declare-fun lt!119371 () SeekEntryResult!998)

(declare-fun d!59259 () Bool)

(assert (=> d!59259 (and (or ((_ is Undefined!998) lt!119371) (not ((_ is Found!998) lt!119371)) (and (bvsge (index!6163 lt!119371) #b00000000000000000000000000000000) (bvslt (index!6163 lt!119371) (size!5892 (_keys!6466 thiss!1504))))) (or ((_ is Undefined!998) lt!119371) ((_ is Found!998) lt!119371) (not ((_ is MissingVacant!998) lt!119371)) (not (= (index!6165 lt!119371) (index!6164 lt!119282))) (and (bvsge (index!6165 lt!119371) #b00000000000000000000000000000000) (bvslt (index!6165 lt!119371) (size!5892 (_keys!6466 thiss!1504))))) (or ((_ is Undefined!998) lt!119371) (ite ((_ is Found!998) lt!119371) (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6163 lt!119371)) key!932) (and ((_ is MissingVacant!998) lt!119371) (= (index!6165 lt!119371) (index!6164 lt!119282)) (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6165 lt!119371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59259 (= lt!119371 e!153422)))

(declare-fun c!39349 () Bool)

(assert (=> d!59259 (= c!39349 (bvsge (x!23853 lt!119282) #b01111111111111111111111111111110))))

(assert (=> d!59259 (= lt!119372 (select (arr!5554 (_keys!6466 thiss!1504)) (index!6164 lt!119282)))))

(assert (=> d!59259 (validMask!0 (mask!10372 thiss!1504))))

(assert (=> d!59259 (= (seekKeyOrZeroReturnVacant!0 (x!23853 lt!119282) (index!6164 lt!119282) (index!6164 lt!119282) key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)) lt!119371)))

(declare-fun b!236254 () Bool)

(assert (=> b!236254 (= e!153420 (Found!998 (index!6164 lt!119282)))))

(assert (= (and d!59259 c!39349) b!236253))

(assert (= (and d!59259 (not c!39349)) b!236255))

(assert (= (and b!236255 c!39351) b!236254))

(assert (= (and b!236255 (not c!39351)) b!236252))

(assert (= (and b!236252 c!39350) b!236256))

(assert (= (and b!236252 (not c!39350)) b!236251))

(declare-fun m!256717 () Bool)

(assert (=> b!236251 m!256717))

(assert (=> b!236251 m!256717))

(declare-fun m!256719 () Bool)

(assert (=> b!236251 m!256719))

(declare-fun m!256721 () Bool)

(assert (=> d!59259 m!256721))

(declare-fun m!256723 () Bool)

(assert (=> d!59259 m!256723))

(assert (=> d!59259 m!256521))

(assert (=> d!59259 m!256413))

(assert (=> b!236120 d!59259))

(declare-fun b!236265 () Bool)

(declare-fun e!153431 () Bool)

(declare-fun e!153429 () Bool)

(assert (=> b!236265 (= e!153431 e!153429)))

(declare-fun c!39354 () Bool)

(assert (=> b!236265 (= c!39354 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236266 () Bool)

(declare-fun e!153430 () Bool)

(assert (=> b!236266 (= e!153429 e!153430)))

(declare-fun lt!119379 () (_ BitVec 64))

(assert (=> b!236266 (= lt!119379 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119380 () Unit!7264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11691 (_ BitVec 64) (_ BitVec 32)) Unit!7264)

(assert (=> b!236266 (= lt!119380 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6466 thiss!1504) lt!119379 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!236266 (arrayContainsKey!0 (_keys!6466 thiss!1504) lt!119379 #b00000000000000000000000000000000)))

(declare-fun lt!119381 () Unit!7264)

(assert (=> b!236266 (= lt!119381 lt!119380)))

(declare-fun res!115826 () Bool)

(assert (=> b!236266 (= res!115826 (= (seekEntryOrOpen!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000) (_keys!6466 thiss!1504) (mask!10372 thiss!1504)) (Found!998 #b00000000000000000000000000000000)))))

(assert (=> b!236266 (=> (not res!115826) (not e!153430))))

(declare-fun b!236267 () Bool)

(declare-fun call!21957 () Bool)

(assert (=> b!236267 (= e!153429 call!21957)))

(declare-fun bm!21954 () Bool)

(assert (=> bm!21954 (= call!21957 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(declare-fun d!59261 () Bool)

(declare-fun res!115825 () Bool)

(assert (=> d!59261 (=> res!115825 e!153431)))

(assert (=> d!59261 (= res!115825 (bvsge #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> d!59261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)) e!153431)))

(declare-fun b!236268 () Bool)

(assert (=> b!236268 (= e!153430 call!21957)))

(assert (= (and d!59261 (not res!115825)) b!236265))

(assert (= (and b!236265 c!39354) b!236266))

(assert (= (and b!236265 (not c!39354)) b!236267))

(assert (= (and b!236266 res!115826) b!236268))

(assert (= (or b!236268 b!236267) bm!21954))

(assert (=> b!236265 m!256461))

(assert (=> b!236265 m!256461))

(assert (=> b!236265 m!256471))

(assert (=> b!236266 m!256461))

(declare-fun m!256725 () Bool)

(assert (=> b!236266 m!256725))

(declare-fun m!256727 () Bool)

(assert (=> b!236266 m!256727))

(assert (=> b!236266 m!256461))

(declare-fun m!256729 () Bool)

(assert (=> b!236266 m!256729))

(declare-fun m!256731 () Bool)

(assert (=> bm!21954 m!256731))

(assert (=> b!236101 d!59261))

(declare-fun d!59263 () Bool)

(declare-fun res!115831 () Bool)

(declare-fun e!153436 () Bool)

(assert (=> d!59263 (=> res!115831 e!153436)))

(assert (=> d!59263 (= res!115831 (and ((_ is Cons!3540) (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (= (_1!2322 (h!4192 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)))))

(assert (=> d!59263 (= (containsKey!261 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932) e!153436)))

(declare-fun b!236273 () Bool)

(declare-fun e!153437 () Bool)

(assert (=> b!236273 (= e!153436 e!153437)))

(declare-fun res!115832 () Bool)

(assert (=> b!236273 (=> (not res!115832) (not e!153437))))

(assert (=> b!236273 (= res!115832 (and (or (not ((_ is Cons!3540) (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) (bvsle (_1!2322 (h!4192 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)) ((_ is Cons!3540) (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (bvslt (_1!2322 (h!4192 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)))))

(declare-fun b!236274 () Bool)

(assert (=> b!236274 (= e!153437 (containsKey!261 (t!8514 (toList!1778 (getCurrentListMap!1287 (_keys!6466 thiss!1504) (_values!4371 thiss!1504) (mask!10372 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) key!932))))

(assert (= (and d!59263 (not res!115831)) b!236273))

(assert (= (and b!236273 res!115832) b!236274))

(declare-fun m!256733 () Bool)

(assert (=> b!236274 m!256733))

(assert (=> d!59187 d!59263))

(declare-fun b!236293 () Bool)

(declare-fun e!153452 () Bool)

(declare-fun lt!119387 () SeekEntryResult!998)

(assert (=> b!236293 (= e!153452 (bvsge (x!23853 lt!119387) #b01111111111111111111111111111110))))

(declare-fun d!59265 () Bool)

(assert (=> d!59265 e!153452))

(declare-fun c!39361 () Bool)

(assert (=> d!59265 (= c!39361 (and ((_ is Intermediate!998) lt!119387) (undefined!1810 lt!119387)))))

(declare-fun e!153449 () SeekEntryResult!998)

(assert (=> d!59265 (= lt!119387 e!153449)))

(declare-fun c!39362 () Bool)

(assert (=> d!59265 (= c!39362 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!119386 () (_ BitVec 64))

(assert (=> d!59265 (= lt!119386 (select (arr!5554 (_keys!6466 thiss!1504)) (toIndex!0 key!932 (mask!10372 thiss!1504))))))

(assert (=> d!59265 (validMask!0 (mask!10372 thiss!1504))))

(assert (=> d!59265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10372 thiss!1504)) key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)) lt!119387)))

(declare-fun b!236294 () Bool)

(declare-fun e!153450 () Bool)

(assert (=> b!236294 (= e!153452 e!153450)))

(declare-fun res!115839 () Bool)

(assert (=> b!236294 (= res!115839 (and ((_ is Intermediate!998) lt!119387) (not (undefined!1810 lt!119387)) (bvslt (x!23853 lt!119387) #b01111111111111111111111111111110) (bvsge (x!23853 lt!119387) #b00000000000000000000000000000000) (bvsge (x!23853 lt!119387) #b00000000000000000000000000000000)))))

(assert (=> b!236294 (=> (not res!115839) (not e!153450))))

(declare-fun b!236295 () Bool)

(assert (=> b!236295 (and (bvsge (index!6164 lt!119387) #b00000000000000000000000000000000) (bvslt (index!6164 lt!119387) (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun e!153451 () Bool)

(assert (=> b!236295 (= e!153451 (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6164 lt!119387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236296 () Bool)

(assert (=> b!236296 (and (bvsge (index!6164 lt!119387) #b00000000000000000000000000000000) (bvslt (index!6164 lt!119387) (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun res!115841 () Bool)

(assert (=> b!236296 (= res!115841 (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6164 lt!119387)) key!932))))

(assert (=> b!236296 (=> res!115841 e!153451)))

(assert (=> b!236296 (= e!153450 e!153451)))

(declare-fun b!236297 () Bool)

(assert (=> b!236297 (= e!153449 (Intermediate!998 true (toIndex!0 key!932 (mask!10372 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236298 () Bool)

(declare-fun e!153448 () SeekEntryResult!998)

(assert (=> b!236298 (= e!153448 (Intermediate!998 false (toIndex!0 key!932 (mask!10372 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236299 () Bool)

(assert (=> b!236299 (= e!153449 e!153448)))

(declare-fun c!39363 () Bool)

(assert (=> b!236299 (= c!39363 (or (= lt!119386 key!932) (= (bvadd lt!119386 lt!119386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236300 () Bool)

(assert (=> b!236300 (and (bvsge (index!6164 lt!119387) #b00000000000000000000000000000000) (bvslt (index!6164 lt!119387) (size!5892 (_keys!6466 thiss!1504))))))

(declare-fun res!115840 () Bool)

(assert (=> b!236300 (= res!115840 (= (select (arr!5554 (_keys!6466 thiss!1504)) (index!6164 lt!119387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236300 (=> res!115840 e!153451)))

(declare-fun b!236301 () Bool)

(assert (=> b!236301 (= e!153448 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10372 thiss!1504)) #b00000000000000000000000000000000 (mask!10372 thiss!1504)) key!932 (_keys!6466 thiss!1504) (mask!10372 thiss!1504)))))

(assert (= (and d!59265 c!39362) b!236297))

(assert (= (and d!59265 (not c!39362)) b!236299))

(assert (= (and b!236299 c!39363) b!236298))

(assert (= (and b!236299 (not c!39363)) b!236301))

(assert (= (and d!59265 c!39361) b!236293))

(assert (= (and d!59265 (not c!39361)) b!236294))

(assert (= (and b!236294 res!115839) b!236296))

(assert (= (and b!236296 (not res!115841)) b!236300))

(assert (= (and b!236300 (not res!115840)) b!236295))

(assert (=> b!236301 m!256525))

(declare-fun m!256735 () Bool)

(assert (=> b!236301 m!256735))

(assert (=> b!236301 m!256735))

(declare-fun m!256737 () Bool)

(assert (=> b!236301 m!256737))

(declare-fun m!256739 () Bool)

(assert (=> b!236296 m!256739))

(assert (=> b!236295 m!256739))

(assert (=> b!236300 m!256739))

(assert (=> d!59265 m!256525))

(declare-fun m!256741 () Bool)

(assert (=> d!59265 m!256741))

(assert (=> d!59265 m!256413))

(assert (=> d!59195 d!59265))

(declare-fun d!59267 () Bool)

(declare-fun lt!119393 () (_ BitVec 32))

(declare-fun lt!119392 () (_ BitVec 32))

(assert (=> d!59267 (= lt!119393 (bvmul (bvxor lt!119392 (bvlshr lt!119392 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59267 (= lt!119392 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59267 (and (bvsge (mask!10372 thiss!1504) #b00000000000000000000000000000000) (let ((res!115842 (let ((h!4195 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23872 (bvmul (bvxor h!4195 (bvlshr h!4195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23872 (bvlshr x!23872 #b00000000000000000000000000001101)) (mask!10372 thiss!1504)))))) (and (bvslt res!115842 (bvadd (mask!10372 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115842 #b00000000000000000000000000000000))))))

(assert (=> d!59267 (= (toIndex!0 key!932 (mask!10372 thiss!1504)) (bvand (bvxor lt!119393 (bvlshr lt!119393 #b00000000000000000000000000001101)) (mask!10372 thiss!1504)))))

(assert (=> d!59195 d!59267))

(assert (=> d!59195 d!59191))

(declare-fun d!59269 () Bool)

(assert (=> d!59269 (= (apply!213 lt!119255 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)) (get!2851 (getValueByKey!269 (toList!1778 lt!119255) (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8712 () Bool)

(assert (= bs!8712 d!59269))

(assert (=> bs!8712 m!256461))

(assert (=> bs!8712 m!256585))

(assert (=> bs!8712 m!256585))

(declare-fun m!256743 () Bool)

(assert (=> bs!8712 m!256743))

(assert (=> b!236082 d!59269))

(declare-fun d!59271 () Bool)

(declare-fun c!39366 () Bool)

(assert (=> d!59271 (= c!39366 ((_ is ValueCellFull!2765) (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153455 () V!7937)

(assert (=> d!59271 (= (get!2850 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153455)))

(declare-fun b!236306 () Bool)

(declare-fun get!2852 (ValueCell!2765 V!7937) V!7937)

(assert (=> b!236306 (= e!153455 (get!2852 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236307 () Bool)

(declare-fun get!2853 (ValueCell!2765 V!7937) V!7937)

(assert (=> b!236307 (= e!153455 (get!2853 (select (arr!5553 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59271 c!39366) b!236306))

(assert (= (and d!59271 (not c!39366)) b!236307))

(assert (=> b!236306 m!256465))

(assert (=> b!236306 m!256467))

(declare-fun m!256745 () Bool)

(assert (=> b!236306 m!256745))

(assert (=> b!236307 m!256465))

(assert (=> b!236307 m!256467))

(declare-fun m!256747 () Bool)

(assert (=> b!236307 m!256747))

(assert (=> b!236082 d!59271))

(declare-fun b!236318 () Bool)

(declare-fun e!153464 () Bool)

(declare-fun e!153465 () Bool)

(assert (=> b!236318 (= e!153464 e!153465)))

(declare-fun res!115849 () Bool)

(assert (=> b!236318 (=> (not res!115849) (not e!153465))))

(declare-fun e!153467 () Bool)

(assert (=> b!236318 (= res!115849 (not e!153467))))

(declare-fun res!115850 () Bool)

(assert (=> b!236318 (=> (not res!115850) (not e!153467))))

(assert (=> b!236318 (= res!115850 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59273 () Bool)

(declare-fun res!115851 () Bool)

(assert (=> d!59273 (=> res!115851 e!153464)))

(assert (=> d!59273 (= res!115851 (bvsge #b00000000000000000000000000000000 (size!5892 (_keys!6466 thiss!1504))))))

(assert (=> d!59273 (= (arrayNoDuplicates!0 (_keys!6466 thiss!1504) #b00000000000000000000000000000000 Nil!3543) e!153464)))

(declare-fun b!236319 () Bool)

(declare-fun e!153466 () Bool)

(declare-fun call!21960 () Bool)

(assert (=> b!236319 (= e!153466 call!21960)))

(declare-fun b!236320 () Bool)

(assert (=> b!236320 (= e!153466 call!21960)))

(declare-fun b!236321 () Bool)

(declare-fun contains!1662 (List!3546 (_ BitVec 64)) Bool)

(assert (=> b!236321 (= e!153467 (contains!1662 Nil!3543 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21957 () Bool)

(declare-fun c!39369 () Bool)

(assert (=> bm!21957 (= call!21960 (arrayNoDuplicates!0 (_keys!6466 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39369 (Cons!3542 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000) Nil!3543) Nil!3543)))))

(declare-fun b!236322 () Bool)

(assert (=> b!236322 (= e!153465 e!153466)))

(assert (=> b!236322 (= c!39369 (validKeyInArray!0 (select (arr!5554 (_keys!6466 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59273 (not res!115851)) b!236318))

(assert (= (and b!236318 res!115850) b!236321))

(assert (= (and b!236318 res!115849) b!236322))

(assert (= (and b!236322 c!39369) b!236319))

(assert (= (and b!236322 (not c!39369)) b!236320))

(assert (= (or b!236319 b!236320) bm!21957))

(assert (=> b!236318 m!256461))

(assert (=> b!236318 m!256461))

(assert (=> b!236318 m!256471))

(assert (=> b!236321 m!256461))

(assert (=> b!236321 m!256461))

(declare-fun m!256749 () Bool)

(assert (=> b!236321 m!256749))

(assert (=> bm!21957 m!256461))

(declare-fun m!256751 () Bool)

(assert (=> bm!21957 m!256751))

(assert (=> b!236322 m!256461))

(assert (=> b!236322 m!256461))

(assert (=> b!236322 m!256471))

(assert (=> b!236102 d!59273))

(declare-fun b!236324 () Bool)

(declare-fun e!153469 () Bool)

(assert (=> b!236324 (= e!153469 tp_is_empty!6217)))

(declare-fun b!236323 () Bool)

(declare-fun e!153468 () Bool)

(assert (=> b!236323 (= e!153468 tp_is_empty!6217)))

(declare-fun mapNonEmpty!10539 () Bool)

(declare-fun mapRes!10539 () Bool)

(declare-fun tp!22257 () Bool)

(assert (=> mapNonEmpty!10539 (= mapRes!10539 (and tp!22257 e!153468))))

(declare-fun mapRest!10539 () (Array (_ BitVec 32) ValueCell!2765))

(declare-fun mapValue!10539 () ValueCell!2765)

(declare-fun mapKey!10539 () (_ BitVec 32))

(assert (=> mapNonEmpty!10539 (= mapRest!10538 (store mapRest!10539 mapKey!10539 mapValue!10539))))

(declare-fun mapIsEmpty!10539 () Bool)

(assert (=> mapIsEmpty!10539 mapRes!10539))

(declare-fun condMapEmpty!10539 () Bool)

(declare-fun mapDefault!10539 () ValueCell!2765)

(assert (=> mapNonEmpty!10538 (= condMapEmpty!10539 (= mapRest!10538 ((as const (Array (_ BitVec 32) ValueCell!2765)) mapDefault!10539)))))

(assert (=> mapNonEmpty!10538 (= tp!22256 (and e!153469 mapRes!10539))))

(assert (= (and mapNonEmpty!10538 condMapEmpty!10539) mapIsEmpty!10539))

(assert (= (and mapNonEmpty!10538 (not condMapEmpty!10539)) mapNonEmpty!10539))

(assert (= (and mapNonEmpty!10539 ((_ is ValueCellFull!2765) mapValue!10539)) b!236323))

(assert (= (and mapNonEmpty!10538 ((_ is ValueCellFull!2765) mapDefault!10539)) b!236324))

(declare-fun m!256753 () Bool)

(assert (=> mapNonEmpty!10539 m!256753))

(declare-fun b_lambda!7905 () Bool)

(assert (= b_lambda!7903 (or (and b!235962 b_free!6355) b_lambda!7905)))

(declare-fun b_lambda!7907 () Bool)

(assert (= b_lambda!7901 (or (and b!235962 b_free!6355) b_lambda!7907)))

(check-sat (not b!236307) (not b!236202) (not b!236154) (not b!236224) (not b!236192) (not d!59219) (not mapNonEmpty!10539) (not b!236321) (not b!236222) (not d!59233) (not b!236155) (not b_lambda!7899) (not d!59249) (not b!236301) (not b!236206) b_and!13273 (not d!59257) (not bm!21948) (not b!236191) (not b!236251) (not b!236318) (not d!59229) (not b!236238) (not d!59203) (not b!236207) (not b!236186) (not b!236306) (not b!236163) (not d!59239) (not bm!21957) (not d!59235) (not d!59221) (not d!59243) (not b!236193) (not b_lambda!7905) (not b!236322) (not b!236160) (not b!236266) (not b!236200) (not d!59259) (not b!236220) (not b!236178) (not d!59245) (not b!236237) (not d!59225) (not d!59247) (not d!59241) (not b!236185) tp_is_empty!6217 (not b!236189) (not d!59265) (not d!59215) (not b!236198) (not bm!21954) (not b!236188) (not d!59255) (not b!236274) (not b!236156) (not d!59251) (not b!236265) (not b!236184) (not b_lambda!7907) (not b!236199) (not b!236219) (not d!59227) (not d!59223) (not b!236209) (not b!236162) (not b!236164) (not d!59211) (not b!236167) (not bm!21951) (not d!59205) (not b!236159) (not b_next!6355) (not d!59201) (not d!59231) (not d!59237) (not d!59217) (not b!236208) (not b!236235) (not d!59269) (not d!59213))
(check-sat b_and!13273 (not b_next!6355))
