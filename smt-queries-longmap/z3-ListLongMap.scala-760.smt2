; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17864 () Bool)

(assert start!17864)

(declare-fun b!178237 () Bool)

(declare-fun b_free!4399 () Bool)

(declare-fun b_next!4399 () Bool)

(assert (=> b!178237 (= b_free!4399 (not b_next!4399))))

(declare-fun tp!15907 () Bool)

(declare-fun b_and!10927 () Bool)

(assert (=> b!178237 (= tp!15907 b_and!10927)))

(declare-fun b!178234 () Bool)

(declare-fun res!84446 () Bool)

(declare-fun e!117486 () Bool)

(assert (=> b!178234 (=> (not res!84446) (not e!117486))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5209 0))(
  ( (V!5210 (val!2130 Int)) )
))
(declare-datatypes ((ValueCell!1742 0))(
  ( (ValueCellFull!1742 (v!4014 V!5209)) (EmptyCell!1742) )
))
(declare-datatypes ((array!7485 0))(
  ( (array!7486 (arr!3548 (Array (_ BitVec 32) (_ BitVec 64))) (size!3854 (_ BitVec 32))) )
))
(declare-datatypes ((array!7487 0))(
  ( (array!7488 (arr!3549 (Array (_ BitVec 32) ValueCell!1742)) (size!3855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2392 0))(
  ( (LongMapFixedSize!2393 (defaultEntry!3664 Int) (mask!8620 (_ BitVec 32)) (extraKeys!3401 (_ BitVec 32)) (zeroValue!3505 V!5209) (minValue!3505 V!5209) (_size!1245 (_ BitVec 32)) (_keys!5540 array!7485) (_values!3647 array!7487) (_vacant!1245 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2392)

(get-info :version)

(declare-datatypes ((SeekEntryResult!569 0))(
  ( (MissingZero!569 (index!4444 (_ BitVec 32))) (Found!569 (index!4445 (_ BitVec 32))) (Intermediate!569 (undefined!1381 Bool) (index!4446 (_ BitVec 32)) (x!19519 (_ BitVec 32))) (Undefined!569) (MissingVacant!569 (index!4447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7485 (_ BitVec 32)) SeekEntryResult!569)

(assert (=> b!178234 (= res!84446 ((_ is Undefined!569) (seekEntryOrOpen!0 key!828 (_keys!5540 thiss!1248) (mask!8620 thiss!1248))))))

(declare-fun mapNonEmpty!7130 () Bool)

(declare-fun mapRes!7130 () Bool)

(declare-fun tp!15908 () Bool)

(declare-fun e!117488 () Bool)

(assert (=> mapNonEmpty!7130 (= mapRes!7130 (and tp!15908 e!117488))))

(declare-fun mapKey!7130 () (_ BitVec 32))

(declare-fun mapValue!7130 () ValueCell!1742)

(declare-fun mapRest!7130 () (Array (_ BitVec 32) ValueCell!1742))

(assert (=> mapNonEmpty!7130 (= (arr!3549 (_values!3647 thiss!1248)) (store mapRest!7130 mapKey!7130 mapValue!7130))))

(declare-fun b!178235 () Bool)

(assert (=> b!178235 (= e!117486 (and (= (size!3855 (_values!3647 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8620 thiss!1248))) (= (size!3854 (_keys!5540 thiss!1248)) (size!3855 (_values!3647 thiss!1248))) (bvslt (mask!8620 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178236 () Bool)

(declare-fun e!117485 () Bool)

(declare-fun tp_is_empty!4171 () Bool)

(assert (=> b!178236 (= e!117485 tp_is_empty!4171)))

(declare-fun b!178238 () Bool)

(declare-fun res!84450 () Bool)

(assert (=> b!178238 (=> (not res!84450) (not e!117486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178238 (= res!84450 (validMask!0 (mask!8620 thiss!1248)))))

(declare-fun b!178239 () Bool)

(assert (=> b!178239 (= e!117488 tp_is_empty!4171)))

(declare-fun b!178240 () Bool)

(declare-fun res!84448 () Bool)

(assert (=> b!178240 (=> (not res!84448) (not e!117486))))

(assert (=> b!178240 (= res!84448 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178241 () Bool)

(declare-fun res!84447 () Bool)

(assert (=> b!178241 (=> (not res!84447) (not e!117486))))

(declare-datatypes ((tuple2!3268 0))(
  ( (tuple2!3269 (_1!1645 (_ BitVec 64)) (_2!1645 V!5209)) )
))
(declare-datatypes ((List!2236 0))(
  ( (Nil!2233) (Cons!2232 (h!2855 tuple2!3268) (t!7064 List!2236)) )
))
(declare-datatypes ((ListLongMap!2201 0))(
  ( (ListLongMap!2202 (toList!1116 List!2236)) )
))
(declare-fun contains!1197 (ListLongMap!2201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!771 (array!7485 array!7487 (_ BitVec 32) (_ BitVec 32) V!5209 V!5209 (_ BitVec 32) Int) ListLongMap!2201)

(assert (=> b!178241 (= res!84447 (not (contains!1197 (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) key!828)))))

(declare-fun res!84449 () Bool)

(assert (=> start!17864 (=> (not res!84449) (not e!117486))))

(declare-fun valid!1023 (LongMapFixedSize!2392) Bool)

(assert (=> start!17864 (= res!84449 (valid!1023 thiss!1248))))

(assert (=> start!17864 e!117486))

(declare-fun e!117484 () Bool)

(assert (=> start!17864 e!117484))

(assert (=> start!17864 true))

(declare-fun e!117487 () Bool)

(declare-fun array_inv!2293 (array!7485) Bool)

(declare-fun array_inv!2294 (array!7487) Bool)

(assert (=> b!178237 (= e!117484 (and tp!15907 tp_is_empty!4171 (array_inv!2293 (_keys!5540 thiss!1248)) (array_inv!2294 (_values!3647 thiss!1248)) e!117487))))

(declare-fun b!178242 () Bool)

(assert (=> b!178242 (= e!117487 (and e!117485 mapRes!7130))))

(declare-fun condMapEmpty!7130 () Bool)

(declare-fun mapDefault!7130 () ValueCell!1742)

(assert (=> b!178242 (= condMapEmpty!7130 (= (arr!3549 (_values!3647 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1742)) mapDefault!7130)))))

(declare-fun mapIsEmpty!7130 () Bool)

(assert (=> mapIsEmpty!7130 mapRes!7130))

(assert (= (and start!17864 res!84449) b!178240))

(assert (= (and b!178240 res!84448) b!178234))

(assert (= (and b!178234 res!84446) b!178241))

(assert (= (and b!178241 res!84447) b!178238))

(assert (= (and b!178238 res!84450) b!178235))

(assert (= (and b!178242 condMapEmpty!7130) mapIsEmpty!7130))

(assert (= (and b!178242 (not condMapEmpty!7130)) mapNonEmpty!7130))

(assert (= (and mapNonEmpty!7130 ((_ is ValueCellFull!1742) mapValue!7130)) b!178239))

(assert (= (and b!178242 ((_ is ValueCellFull!1742) mapDefault!7130)) b!178236))

(assert (= b!178237 b!178242))

(assert (= start!17864 b!178237))

(declare-fun m!206825 () Bool)

(assert (=> b!178234 m!206825))

(declare-fun m!206827 () Bool)

(assert (=> b!178241 m!206827))

(assert (=> b!178241 m!206827))

(declare-fun m!206829 () Bool)

(assert (=> b!178241 m!206829))

(declare-fun m!206831 () Bool)

(assert (=> b!178238 m!206831))

(declare-fun m!206833 () Bool)

(assert (=> start!17864 m!206833))

(declare-fun m!206835 () Bool)

(assert (=> mapNonEmpty!7130 m!206835))

(declare-fun m!206837 () Bool)

(assert (=> b!178237 m!206837))

(declare-fun m!206839 () Bool)

(assert (=> b!178237 m!206839))

(check-sat (not start!17864) tp_is_empty!4171 (not mapNonEmpty!7130) (not b!178234) (not b_next!4399) (not b!178237) b_and!10927 (not b!178241) (not b!178238))
(check-sat b_and!10927 (not b_next!4399))
(get-model)

(declare-fun d!54003 () Bool)

(declare-fun e!117531 () Bool)

(assert (=> d!54003 e!117531))

(declare-fun res!84483 () Bool)

(assert (=> d!54003 (=> res!84483 e!117531)))

(declare-fun lt!88136 () Bool)

(assert (=> d!54003 (= res!84483 (not lt!88136))))

(declare-fun lt!88135 () Bool)

(assert (=> d!54003 (= lt!88136 lt!88135)))

(declare-datatypes ((Unit!5439 0))(
  ( (Unit!5440) )
))
(declare-fun lt!88134 () Unit!5439)

(declare-fun e!117530 () Unit!5439)

(assert (=> d!54003 (= lt!88134 e!117530)))

(declare-fun c!31948 () Bool)

(assert (=> d!54003 (= c!31948 lt!88135)))

(declare-fun containsKey!202 (List!2236 (_ BitVec 64)) Bool)

(assert (=> d!54003 (= lt!88135 (containsKey!202 (toList!1116 (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828))))

(assert (=> d!54003 (= (contains!1197 (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) key!828) lt!88136)))

(declare-fun b!178303 () Bool)

(declare-fun lt!88137 () Unit!5439)

(assert (=> b!178303 (= e!117530 lt!88137)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!150 (List!2236 (_ BitVec 64)) Unit!5439)

(assert (=> b!178303 (= lt!88137 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1116 (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828))))

(declare-datatypes ((Option!205 0))(
  ( (Some!204 (v!4017 V!5209)) (None!203) )
))
(declare-fun isDefined!151 (Option!205) Bool)

(declare-fun getValueByKey!199 (List!2236 (_ BitVec 64)) Option!205)

(assert (=> b!178303 (isDefined!151 (getValueByKey!199 (toList!1116 (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828))))

(declare-fun b!178304 () Bool)

(declare-fun Unit!5441 () Unit!5439)

(assert (=> b!178304 (= e!117530 Unit!5441)))

(declare-fun b!178305 () Bool)

(assert (=> b!178305 (= e!117531 (isDefined!151 (getValueByKey!199 (toList!1116 (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828)))))

(assert (= (and d!54003 c!31948) b!178303))

(assert (= (and d!54003 (not c!31948)) b!178304))

(assert (= (and d!54003 (not res!84483)) b!178305))

(declare-fun m!206873 () Bool)

(assert (=> d!54003 m!206873))

(declare-fun m!206875 () Bool)

(assert (=> b!178303 m!206875))

(declare-fun m!206877 () Bool)

(assert (=> b!178303 m!206877))

(assert (=> b!178303 m!206877))

(declare-fun m!206879 () Bool)

(assert (=> b!178303 m!206879))

(assert (=> b!178305 m!206877))

(assert (=> b!178305 m!206877))

(assert (=> b!178305 m!206879))

(assert (=> b!178241 d!54003))

(declare-fun b!178348 () Bool)

(declare-fun e!117564 () Bool)

(declare-fun e!117558 () Bool)

(assert (=> b!178348 (= e!117564 e!117558)))

(declare-fun res!84506 () Bool)

(declare-fun call!18015 () Bool)

(assert (=> b!178348 (= res!84506 call!18015)))

(assert (=> b!178348 (=> (not res!84506) (not e!117558))))

(declare-fun b!178349 () Bool)

(declare-fun e!117569 () Unit!5439)

(declare-fun lt!88193 () Unit!5439)

(assert (=> b!178349 (= e!117569 lt!88193)))

(declare-fun lt!88198 () ListLongMap!2201)

(declare-fun getCurrentListMapNoExtraKeys!174 (array!7485 array!7487 (_ BitVec 32) (_ BitVec 32) V!5209 V!5209 (_ BitVec 32) Int) ListLongMap!2201)

(assert (=> b!178349 (= lt!88198 (getCurrentListMapNoExtraKeys!174 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!88191 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88201 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88201 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88195 () Unit!5439)

(declare-fun addStillContains!119 (ListLongMap!2201 (_ BitVec 64) V!5209 (_ BitVec 64)) Unit!5439)

(assert (=> b!178349 (= lt!88195 (addStillContains!119 lt!88198 lt!88191 (zeroValue!3505 thiss!1248) lt!88201))))

(declare-fun +!260 (ListLongMap!2201 tuple2!3268) ListLongMap!2201)

(assert (=> b!178349 (contains!1197 (+!260 lt!88198 (tuple2!3269 lt!88191 (zeroValue!3505 thiss!1248))) lt!88201)))

(declare-fun lt!88183 () Unit!5439)

(assert (=> b!178349 (= lt!88183 lt!88195)))

(declare-fun lt!88192 () ListLongMap!2201)

(assert (=> b!178349 (= lt!88192 (getCurrentListMapNoExtraKeys!174 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!88184 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88184 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88197 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88197 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88189 () Unit!5439)

(declare-fun addApplyDifferent!119 (ListLongMap!2201 (_ BitVec 64) V!5209 (_ BitVec 64)) Unit!5439)

(assert (=> b!178349 (= lt!88189 (addApplyDifferent!119 lt!88192 lt!88184 (minValue!3505 thiss!1248) lt!88197))))

(declare-fun apply!143 (ListLongMap!2201 (_ BitVec 64)) V!5209)

(assert (=> b!178349 (= (apply!143 (+!260 lt!88192 (tuple2!3269 lt!88184 (minValue!3505 thiss!1248))) lt!88197) (apply!143 lt!88192 lt!88197))))

(declare-fun lt!88188 () Unit!5439)

(assert (=> b!178349 (= lt!88188 lt!88189)))

(declare-fun lt!88182 () ListLongMap!2201)

(assert (=> b!178349 (= lt!88182 (getCurrentListMapNoExtraKeys!174 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!88202 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88202 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88186 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88186 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88187 () Unit!5439)

(assert (=> b!178349 (= lt!88187 (addApplyDifferent!119 lt!88182 lt!88202 (zeroValue!3505 thiss!1248) lt!88186))))

(assert (=> b!178349 (= (apply!143 (+!260 lt!88182 (tuple2!3269 lt!88202 (zeroValue!3505 thiss!1248))) lt!88186) (apply!143 lt!88182 lt!88186))))

(declare-fun lt!88199 () Unit!5439)

(assert (=> b!178349 (= lt!88199 lt!88187)))

(declare-fun lt!88200 () ListLongMap!2201)

(assert (=> b!178349 (= lt!88200 (getCurrentListMapNoExtraKeys!174 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!88203 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88203 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88190 () (_ BitVec 64))

(assert (=> b!178349 (= lt!88190 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178349 (= lt!88193 (addApplyDifferent!119 lt!88200 lt!88203 (minValue!3505 thiss!1248) lt!88190))))

(assert (=> b!178349 (= (apply!143 (+!260 lt!88200 (tuple2!3269 lt!88203 (minValue!3505 thiss!1248))) lt!88190) (apply!143 lt!88200 lt!88190))))

(declare-fun b!178350 () Bool)

(declare-fun e!117562 () Bool)

(assert (=> b!178350 (= e!117562 e!117564)))

(declare-fun c!31965 () Bool)

(assert (=> b!178350 (= c!31965 (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178351 () Bool)

(declare-fun e!117568 () ListLongMap!2201)

(declare-fun e!117565 () ListLongMap!2201)

(assert (=> b!178351 (= e!117568 e!117565)))

(declare-fun c!31962 () Bool)

(assert (=> b!178351 (= c!31962 (and (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178352 () Bool)

(declare-fun e!117559 () Bool)

(declare-fun lt!88185 () ListLongMap!2201)

(declare-fun get!2038 (ValueCell!1742 V!5209) V!5209)

(declare-fun dynLambda!486 (Int (_ BitVec 64)) V!5209)

(assert (=> b!178352 (= e!117559 (= (apply!143 lt!88185 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000)) (get!2038 (select (arr!3549 (_values!3647 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!486 (defaultEntry!3664 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3855 (_values!3647 thiss!1248))))))

(assert (=> b!178352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))))))

(declare-fun bm!18010 () Bool)

(declare-fun call!18013 () ListLongMap!2201)

(declare-fun call!18018 () ListLongMap!2201)

(assert (=> bm!18010 (= call!18013 call!18018)))

(declare-fun bm!18011 () Bool)

(declare-fun call!18014 () ListLongMap!2201)

(declare-fun call!18019 () ListLongMap!2201)

(assert (=> bm!18011 (= call!18014 call!18019)))

(declare-fun d!54005 () Bool)

(assert (=> d!54005 e!117562))

(declare-fun res!84504 () Bool)

(assert (=> d!54005 (=> (not res!84504) (not e!117562))))

(assert (=> d!54005 (= res!84504 (or (bvsge #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))))))))

(declare-fun lt!88196 () ListLongMap!2201)

(assert (=> d!54005 (= lt!88185 lt!88196)))

(declare-fun lt!88194 () Unit!5439)

(assert (=> d!54005 (= lt!88194 e!117569)))

(declare-fun c!31963 () Bool)

(declare-fun e!117567 () Bool)

(assert (=> d!54005 (= c!31963 e!117567)))

(declare-fun res!84503 () Bool)

(assert (=> d!54005 (=> (not res!84503) (not e!117567))))

(assert (=> d!54005 (= res!84503 (bvslt #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))))))

(assert (=> d!54005 (= lt!88196 e!117568)))

(declare-fun c!31961 () Bool)

(assert (=> d!54005 (= c!31961 (and (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54005 (validMask!0 (mask!8620 thiss!1248))))

(assert (=> d!54005 (= (getCurrentListMap!771 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) lt!88185)))

(declare-fun bm!18012 () Bool)

(assert (=> bm!18012 (= call!18018 (getCurrentListMapNoExtraKeys!174 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun b!178353 () Bool)

(assert (=> b!178353 (= e!117564 (not call!18015))))

(declare-fun b!178354 () Bool)

(declare-fun e!117563 () ListLongMap!2201)

(assert (=> b!178354 (= e!117563 call!18014)))

(declare-fun b!178355 () Bool)

(assert (=> b!178355 (= e!117558 (= (apply!143 lt!88185 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3505 thiss!1248)))))

(declare-fun b!178356 () Bool)

(declare-fun Unit!5442 () Unit!5439)

(assert (=> b!178356 (= e!117569 Unit!5442)))

(declare-fun b!178357 () Bool)

(declare-fun call!18016 () ListLongMap!2201)

(assert (=> b!178357 (= e!117563 call!18016)))

(declare-fun b!178358 () Bool)

(declare-fun e!117561 () Bool)

(declare-fun call!18017 () Bool)

(assert (=> b!178358 (= e!117561 (not call!18017))))

(declare-fun b!178359 () Bool)

(assert (=> b!178359 (= e!117568 (+!260 call!18019 (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3505 thiss!1248))))))

(declare-fun bm!18013 () Bool)

(assert (=> bm!18013 (= call!18015 (contains!1197 lt!88185 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178360 () Bool)

(declare-fun c!31964 () Bool)

(assert (=> b!178360 (= c!31964 (and (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!178360 (= e!117565 e!117563)))

(declare-fun b!178361 () Bool)

(declare-fun e!117570 () Bool)

(assert (=> b!178361 (= e!117570 e!117559)))

(declare-fun res!84505 () Bool)

(assert (=> b!178361 (=> (not res!84505) (not e!117559))))

(assert (=> b!178361 (= res!84505 (contains!1197 lt!88185 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))))))

(declare-fun bm!18014 () Bool)

(assert (=> bm!18014 (= call!18016 call!18013)))

(declare-fun b!178362 () Bool)

(declare-fun res!84502 () Bool)

(assert (=> b!178362 (=> (not res!84502) (not e!117562))))

(assert (=> b!178362 (= res!84502 e!117570)))

(declare-fun res!84509 () Bool)

(assert (=> b!178362 (=> res!84509 e!117570)))

(declare-fun e!117560 () Bool)

(assert (=> b!178362 (= res!84509 (not e!117560))))

(declare-fun res!84508 () Bool)

(assert (=> b!178362 (=> (not res!84508) (not e!117560))))

(assert (=> b!178362 (= res!84508 (bvslt #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))))))

(declare-fun b!178363 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178363 (= e!117567 (validKeyInArray!0 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18015 () Bool)

(assert (=> bm!18015 (= call!18017 (contains!1197 lt!88185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18016 () Bool)

(assert (=> bm!18016 (= call!18019 (+!260 (ite c!31961 call!18018 (ite c!31962 call!18013 call!18016)) (ite (or c!31961 c!31962) (tuple2!3269 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3505 thiss!1248)) (tuple2!3269 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3505 thiss!1248)))))))

(declare-fun b!178364 () Bool)

(declare-fun res!84507 () Bool)

(assert (=> b!178364 (=> (not res!84507) (not e!117562))))

(assert (=> b!178364 (= res!84507 e!117561)))

(declare-fun c!31966 () Bool)

(assert (=> b!178364 (= c!31966 (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178365 () Bool)

(assert (=> b!178365 (= e!117565 call!18014)))

(declare-fun b!178366 () Bool)

(declare-fun e!117566 () Bool)

(assert (=> b!178366 (= e!117566 (= (apply!143 lt!88185 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3505 thiss!1248)))))

(declare-fun b!178367 () Bool)

(assert (=> b!178367 (= e!117560 (validKeyInArray!0 (select (arr!3548 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178368 () Bool)

(assert (=> b!178368 (= e!117561 e!117566)))

(declare-fun res!84510 () Bool)

(assert (=> b!178368 (= res!84510 call!18017)))

(assert (=> b!178368 (=> (not res!84510) (not e!117566))))

(assert (= (and d!54005 c!31961) b!178359))

(assert (= (and d!54005 (not c!31961)) b!178351))

(assert (= (and b!178351 c!31962) b!178365))

(assert (= (and b!178351 (not c!31962)) b!178360))

(assert (= (and b!178360 c!31964) b!178354))

(assert (= (and b!178360 (not c!31964)) b!178357))

(assert (= (or b!178354 b!178357) bm!18014))

(assert (= (or b!178365 bm!18014) bm!18010))

(assert (= (or b!178365 b!178354) bm!18011))

(assert (= (or b!178359 bm!18010) bm!18012))

(assert (= (or b!178359 bm!18011) bm!18016))

(assert (= (and d!54005 res!84503) b!178363))

(assert (= (and d!54005 c!31963) b!178349))

(assert (= (and d!54005 (not c!31963)) b!178356))

(assert (= (and d!54005 res!84504) b!178362))

(assert (= (and b!178362 res!84508) b!178367))

(assert (= (and b!178362 (not res!84509)) b!178361))

(assert (= (and b!178361 res!84505) b!178352))

(assert (= (and b!178362 res!84502) b!178364))

(assert (= (and b!178364 c!31966) b!178368))

(assert (= (and b!178364 (not c!31966)) b!178358))

(assert (= (and b!178368 res!84510) b!178366))

(assert (= (or b!178368 b!178358) bm!18015))

(assert (= (and b!178364 res!84507) b!178350))

(assert (= (and b!178350 c!31965) b!178348))

(assert (= (and b!178350 (not c!31965)) b!178353))

(assert (= (and b!178348 res!84506) b!178355))

(assert (= (or b!178348 b!178353) bm!18013))

(declare-fun b_lambda!7101 () Bool)

(assert (=> (not b_lambda!7101) (not b!178352)))

(declare-fun t!7068 () Bool)

(declare-fun tb!2789 () Bool)

(assert (=> (and b!178237 (= (defaultEntry!3664 thiss!1248) (defaultEntry!3664 thiss!1248)) t!7068) tb!2789))

(declare-fun result!4657 () Bool)

(assert (=> tb!2789 (= result!4657 tp_is_empty!4171)))

(assert (=> b!178352 t!7068))

(declare-fun b_and!10933 () Bool)

(assert (= b_and!10927 (and (=> t!7068 result!4657) b_and!10933)))

(declare-fun m!206881 () Bool)

(assert (=> b!178366 m!206881))

(declare-fun m!206883 () Bool)

(assert (=> b!178363 m!206883))

(assert (=> b!178363 m!206883))

(declare-fun m!206885 () Bool)

(assert (=> b!178363 m!206885))

(assert (=> d!54005 m!206831))

(declare-fun m!206887 () Bool)

(assert (=> bm!18013 m!206887))

(declare-fun m!206889 () Bool)

(assert (=> bm!18015 m!206889))

(declare-fun m!206891 () Bool)

(assert (=> b!178352 m!206891))

(declare-fun m!206893 () Bool)

(assert (=> b!178352 m!206893))

(assert (=> b!178352 m!206893))

(assert (=> b!178352 m!206891))

(declare-fun m!206895 () Bool)

(assert (=> b!178352 m!206895))

(assert (=> b!178352 m!206883))

(assert (=> b!178352 m!206883))

(declare-fun m!206897 () Bool)

(assert (=> b!178352 m!206897))

(declare-fun m!206899 () Bool)

(assert (=> bm!18016 m!206899))

(assert (=> b!178367 m!206883))

(assert (=> b!178367 m!206883))

(assert (=> b!178367 m!206885))

(declare-fun m!206901 () Bool)

(assert (=> b!178359 m!206901))

(assert (=> b!178361 m!206883))

(assert (=> b!178361 m!206883))

(declare-fun m!206903 () Bool)

(assert (=> b!178361 m!206903))

(declare-fun m!206905 () Bool)

(assert (=> b!178355 m!206905))

(declare-fun m!206907 () Bool)

(assert (=> b!178349 m!206907))

(declare-fun m!206909 () Bool)

(assert (=> b!178349 m!206909))

(declare-fun m!206911 () Bool)

(assert (=> b!178349 m!206911))

(declare-fun m!206913 () Bool)

(assert (=> b!178349 m!206913))

(declare-fun m!206915 () Bool)

(assert (=> b!178349 m!206915))

(declare-fun m!206917 () Bool)

(assert (=> b!178349 m!206917))

(declare-fun m!206919 () Bool)

(assert (=> b!178349 m!206919))

(declare-fun m!206921 () Bool)

(assert (=> b!178349 m!206921))

(assert (=> b!178349 m!206883))

(declare-fun m!206923 () Bool)

(assert (=> b!178349 m!206923))

(declare-fun m!206925 () Bool)

(assert (=> b!178349 m!206925))

(assert (=> b!178349 m!206923))

(declare-fun m!206927 () Bool)

(assert (=> b!178349 m!206927))

(assert (=> b!178349 m!206913))

(declare-fun m!206929 () Bool)

(assert (=> b!178349 m!206929))

(declare-fun m!206931 () Bool)

(assert (=> b!178349 m!206931))

(declare-fun m!206933 () Bool)

(assert (=> b!178349 m!206933))

(assert (=> b!178349 m!206931))

(assert (=> b!178349 m!206915))

(declare-fun m!206935 () Bool)

(assert (=> b!178349 m!206935))

(declare-fun m!206937 () Bool)

(assert (=> b!178349 m!206937))

(assert (=> bm!18012 m!206937))

(assert (=> b!178241 d!54005))

(declare-fun d!54007 () Bool)

(assert (=> d!54007 (= (validMask!0 (mask!8620 thiss!1248)) (and (or (= (mask!8620 thiss!1248) #b00000000000000000000000000000111) (= (mask!8620 thiss!1248) #b00000000000000000000000000001111) (= (mask!8620 thiss!1248) #b00000000000000000000000000011111) (= (mask!8620 thiss!1248) #b00000000000000000000000000111111) (= (mask!8620 thiss!1248) #b00000000000000000000000001111111) (= (mask!8620 thiss!1248) #b00000000000000000000000011111111) (= (mask!8620 thiss!1248) #b00000000000000000000000111111111) (= (mask!8620 thiss!1248) #b00000000000000000000001111111111) (= (mask!8620 thiss!1248) #b00000000000000000000011111111111) (= (mask!8620 thiss!1248) #b00000000000000000000111111111111) (= (mask!8620 thiss!1248) #b00000000000000000001111111111111) (= (mask!8620 thiss!1248) #b00000000000000000011111111111111) (= (mask!8620 thiss!1248) #b00000000000000000111111111111111) (= (mask!8620 thiss!1248) #b00000000000000001111111111111111) (= (mask!8620 thiss!1248) #b00000000000000011111111111111111) (= (mask!8620 thiss!1248) #b00000000000000111111111111111111) (= (mask!8620 thiss!1248) #b00000000000001111111111111111111) (= (mask!8620 thiss!1248) #b00000000000011111111111111111111) (= (mask!8620 thiss!1248) #b00000000000111111111111111111111) (= (mask!8620 thiss!1248) #b00000000001111111111111111111111) (= (mask!8620 thiss!1248) #b00000000011111111111111111111111) (= (mask!8620 thiss!1248) #b00000000111111111111111111111111) (= (mask!8620 thiss!1248) #b00000001111111111111111111111111) (= (mask!8620 thiss!1248) #b00000011111111111111111111111111) (= (mask!8620 thiss!1248) #b00000111111111111111111111111111) (= (mask!8620 thiss!1248) #b00001111111111111111111111111111) (= (mask!8620 thiss!1248) #b00011111111111111111111111111111) (= (mask!8620 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8620 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178238 d!54007))

(declare-fun d!54009 () Bool)

(declare-fun lt!88212 () SeekEntryResult!569)

(assert (=> d!54009 (and (or ((_ is Undefined!569) lt!88212) (not ((_ is Found!569) lt!88212)) (and (bvsge (index!4445 lt!88212) #b00000000000000000000000000000000) (bvslt (index!4445 lt!88212) (size!3854 (_keys!5540 thiss!1248))))) (or ((_ is Undefined!569) lt!88212) ((_ is Found!569) lt!88212) (not ((_ is MissingZero!569) lt!88212)) (and (bvsge (index!4444 lt!88212) #b00000000000000000000000000000000) (bvslt (index!4444 lt!88212) (size!3854 (_keys!5540 thiss!1248))))) (or ((_ is Undefined!569) lt!88212) ((_ is Found!569) lt!88212) ((_ is MissingZero!569) lt!88212) (not ((_ is MissingVacant!569) lt!88212)) (and (bvsge (index!4447 lt!88212) #b00000000000000000000000000000000) (bvslt (index!4447 lt!88212) (size!3854 (_keys!5540 thiss!1248))))) (or ((_ is Undefined!569) lt!88212) (ite ((_ is Found!569) lt!88212) (= (select (arr!3548 (_keys!5540 thiss!1248)) (index!4445 lt!88212)) key!828) (ite ((_ is MissingZero!569) lt!88212) (= (select (arr!3548 (_keys!5540 thiss!1248)) (index!4444 lt!88212)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!569) lt!88212) (= (select (arr!3548 (_keys!5540 thiss!1248)) (index!4447 lt!88212)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!117579 () SeekEntryResult!569)

(assert (=> d!54009 (= lt!88212 e!117579)))

(declare-fun c!31975 () Bool)

(declare-fun lt!88211 () SeekEntryResult!569)

(assert (=> d!54009 (= c!31975 (and ((_ is Intermediate!569) lt!88211) (undefined!1381 lt!88211)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7485 (_ BitVec 32)) SeekEntryResult!569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54009 (= lt!88211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8620 thiss!1248)) key!828 (_keys!5540 thiss!1248) (mask!8620 thiss!1248)))))

(assert (=> d!54009 (validMask!0 (mask!8620 thiss!1248))))

(assert (=> d!54009 (= (seekEntryOrOpen!0 key!828 (_keys!5540 thiss!1248) (mask!8620 thiss!1248)) lt!88212)))

(declare-fun b!178383 () Bool)

(declare-fun e!117578 () SeekEntryResult!569)

(assert (=> b!178383 (= e!117578 (Found!569 (index!4446 lt!88211)))))

(declare-fun b!178384 () Bool)

(declare-fun e!117577 () SeekEntryResult!569)

(assert (=> b!178384 (= e!117577 (MissingZero!569 (index!4446 lt!88211)))))

(declare-fun b!178385 () Bool)

(declare-fun c!31974 () Bool)

(declare-fun lt!88210 () (_ BitVec 64))

(assert (=> b!178385 (= c!31974 (= lt!88210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178385 (= e!117578 e!117577)))

(declare-fun b!178386 () Bool)

(assert (=> b!178386 (= e!117579 e!117578)))

(assert (=> b!178386 (= lt!88210 (select (arr!3548 (_keys!5540 thiss!1248)) (index!4446 lt!88211)))))

(declare-fun c!31973 () Bool)

(assert (=> b!178386 (= c!31973 (= lt!88210 key!828))))

(declare-fun b!178387 () Bool)

(assert (=> b!178387 (= e!117579 Undefined!569)))

(declare-fun b!178388 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7485 (_ BitVec 32)) SeekEntryResult!569)

(assert (=> b!178388 (= e!117577 (seekKeyOrZeroReturnVacant!0 (x!19519 lt!88211) (index!4446 lt!88211) (index!4446 lt!88211) key!828 (_keys!5540 thiss!1248) (mask!8620 thiss!1248)))))

(assert (= (and d!54009 c!31975) b!178387))

(assert (= (and d!54009 (not c!31975)) b!178386))

(assert (= (and b!178386 c!31973) b!178383))

(assert (= (and b!178386 (not c!31973)) b!178385))

(assert (= (and b!178385 c!31974) b!178384))

(assert (= (and b!178385 (not c!31974)) b!178388))

(assert (=> d!54009 m!206831))

(declare-fun m!206939 () Bool)

(assert (=> d!54009 m!206939))

(declare-fun m!206941 () Bool)

(assert (=> d!54009 m!206941))

(declare-fun m!206943 () Bool)

(assert (=> d!54009 m!206943))

(declare-fun m!206945 () Bool)

(assert (=> d!54009 m!206945))

(assert (=> d!54009 m!206943))

(declare-fun m!206947 () Bool)

(assert (=> d!54009 m!206947))

(declare-fun m!206949 () Bool)

(assert (=> b!178386 m!206949))

(declare-fun m!206951 () Bool)

(assert (=> b!178388 m!206951))

(assert (=> b!178234 d!54009))

(declare-fun d!54011 () Bool)

(declare-fun res!84517 () Bool)

(declare-fun e!117582 () Bool)

(assert (=> d!54011 (=> (not res!84517) (not e!117582))))

(declare-fun simpleValid!157 (LongMapFixedSize!2392) Bool)

(assert (=> d!54011 (= res!84517 (simpleValid!157 thiss!1248))))

(assert (=> d!54011 (= (valid!1023 thiss!1248) e!117582)))

(declare-fun b!178395 () Bool)

(declare-fun res!84518 () Bool)

(assert (=> b!178395 (=> (not res!84518) (not e!117582))))

(declare-fun arrayCountValidKeys!0 (array!7485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178395 (= res!84518 (= (arrayCountValidKeys!0 (_keys!5540 thiss!1248) #b00000000000000000000000000000000 (size!3854 (_keys!5540 thiss!1248))) (_size!1245 thiss!1248)))))

(declare-fun b!178396 () Bool)

(declare-fun res!84519 () Bool)

(assert (=> b!178396 (=> (not res!84519) (not e!117582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7485 (_ BitVec 32)) Bool)

(assert (=> b!178396 (= res!84519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5540 thiss!1248) (mask!8620 thiss!1248)))))

(declare-fun b!178397 () Bool)

(declare-datatypes ((List!2239 0))(
  ( (Nil!2236) (Cons!2235 (h!2858 (_ BitVec 64)) (t!7069 List!2239)) )
))
(declare-fun arrayNoDuplicates!0 (array!7485 (_ BitVec 32) List!2239) Bool)

(assert (=> b!178397 (= e!117582 (arrayNoDuplicates!0 (_keys!5540 thiss!1248) #b00000000000000000000000000000000 Nil!2236))))

(assert (= (and d!54011 res!84517) b!178395))

(assert (= (and b!178395 res!84518) b!178396))

(assert (= (and b!178396 res!84519) b!178397))

(declare-fun m!206953 () Bool)

(assert (=> d!54011 m!206953))

(declare-fun m!206955 () Bool)

(assert (=> b!178395 m!206955))

(declare-fun m!206957 () Bool)

(assert (=> b!178396 m!206957))

(declare-fun m!206959 () Bool)

(assert (=> b!178397 m!206959))

(assert (=> start!17864 d!54011))

(declare-fun d!54013 () Bool)

(assert (=> d!54013 (= (array_inv!2293 (_keys!5540 thiss!1248)) (bvsge (size!3854 (_keys!5540 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178237 d!54013))

(declare-fun d!54015 () Bool)

(assert (=> d!54015 (= (array_inv!2294 (_values!3647 thiss!1248)) (bvsge (size!3855 (_values!3647 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178237 d!54015))

(declare-fun b!178404 () Bool)

(declare-fun e!117587 () Bool)

(assert (=> b!178404 (= e!117587 tp_is_empty!4171)))

(declare-fun mapIsEmpty!7139 () Bool)

(declare-fun mapRes!7139 () Bool)

(assert (=> mapIsEmpty!7139 mapRes!7139))

(declare-fun mapNonEmpty!7139 () Bool)

(declare-fun tp!15923 () Bool)

(assert (=> mapNonEmpty!7139 (= mapRes!7139 (and tp!15923 e!117587))))

(declare-fun mapKey!7139 () (_ BitVec 32))

(declare-fun mapValue!7139 () ValueCell!1742)

(declare-fun mapRest!7139 () (Array (_ BitVec 32) ValueCell!1742))

(assert (=> mapNonEmpty!7139 (= mapRest!7130 (store mapRest!7139 mapKey!7139 mapValue!7139))))

(declare-fun b!178405 () Bool)

(declare-fun e!117588 () Bool)

(assert (=> b!178405 (= e!117588 tp_is_empty!4171)))

(declare-fun condMapEmpty!7139 () Bool)

(declare-fun mapDefault!7139 () ValueCell!1742)

(assert (=> mapNonEmpty!7130 (= condMapEmpty!7139 (= mapRest!7130 ((as const (Array (_ BitVec 32) ValueCell!1742)) mapDefault!7139)))))

(assert (=> mapNonEmpty!7130 (= tp!15908 (and e!117588 mapRes!7139))))

(assert (= (and mapNonEmpty!7130 condMapEmpty!7139) mapIsEmpty!7139))

(assert (= (and mapNonEmpty!7130 (not condMapEmpty!7139)) mapNonEmpty!7139))

(assert (= (and mapNonEmpty!7139 ((_ is ValueCellFull!1742) mapValue!7139)) b!178404))

(assert (= (and mapNonEmpty!7130 ((_ is ValueCellFull!1742) mapDefault!7139)) b!178405))

(declare-fun m!206961 () Bool)

(assert (=> mapNonEmpty!7139 m!206961))

(declare-fun b_lambda!7103 () Bool)

(assert (= b_lambda!7101 (or (and b!178237 b_free!4399) b_lambda!7103)))

(check-sat (not b!178363) (not b!178349) (not b!178367) (not b!178359) (not b!178388) (not b_next!4399) (not bm!18015) (not b!178396) (not bm!18012) (not d!54009) (not d!54011) (not bm!18016) (not b!178355) (not b_lambda!7103) tp_is_empty!4171 (not d!54005) (not b!178303) (not bm!18013) (not b!178352) (not b!178361) (not b!178305) (not b!178395) b_and!10933 (not mapNonEmpty!7139) (not d!54003) (not b!178397) (not b!178366))
(check-sat b_and!10933 (not b_next!4399))
