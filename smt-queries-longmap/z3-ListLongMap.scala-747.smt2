; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17404 () Bool)

(assert start!17404)

(declare-fun b!174493 () Bool)

(declare-fun b_free!4321 () Bool)

(declare-fun b_next!4321 () Bool)

(assert (=> b!174493 (= b_free!4321 (not b_next!4321))))

(declare-fun tp!15635 () Bool)

(declare-fun b_and!10763 () Bool)

(assert (=> b!174493 (= tp!15635 b_and!10763)))

(declare-fun b!174492 () Bool)

(declare-fun e!115222 () Bool)

(declare-datatypes ((V!5105 0))(
  ( (V!5106 (val!2091 Int)) )
))
(declare-datatypes ((ValueCell!1703 0))(
  ( (ValueCellFull!1703 (v!3957 V!5105)) (EmptyCell!1703) )
))
(declare-datatypes ((array!7301 0))(
  ( (array!7302 (arr!3466 (Array (_ BitVec 32) (_ BitVec 64))) (size!3767 (_ BitVec 32))) )
))
(declare-datatypes ((array!7303 0))(
  ( (array!7304 (arr!3467 (Array (_ BitVec 32) ValueCell!1703)) (size!3768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2314 0))(
  ( (LongMapFixedSize!2315 (defaultEntry!3608 Int) (mask!8488 (_ BitVec 32)) (extraKeys!3345 (_ BitVec 32)) (zeroValue!3449 V!5105) (minValue!3449 V!5105) (_size!1206 (_ BitVec 32)) (_keys!5451 array!7301) (_values!3591 array!7303) (_vacant!1206 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2314)

(assert (=> b!174492 (= e!115222 (not (= (size!3768 (_values!3591 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8488 thiss!1248)))))))

(declare-fun e!115221 () Bool)

(declare-fun e!115217 () Bool)

(declare-fun tp_is_empty!4093 () Bool)

(declare-fun array_inv!2237 (array!7301) Bool)

(declare-fun array_inv!2238 (array!7303) Bool)

(assert (=> b!174493 (= e!115217 (and tp!15635 tp_is_empty!4093 (array_inv!2237 (_keys!5451 thiss!1248)) (array_inv!2238 (_values!3591 thiss!1248)) e!115221))))

(declare-fun mapNonEmpty!6974 () Bool)

(declare-fun mapRes!6974 () Bool)

(declare-fun tp!15634 () Bool)

(declare-fun e!115220 () Bool)

(assert (=> mapNonEmpty!6974 (= mapRes!6974 (and tp!15634 e!115220))))

(declare-fun mapValue!6974 () ValueCell!1703)

(declare-fun mapKey!6974 () (_ BitVec 32))

(declare-fun mapRest!6974 () (Array (_ BitVec 32) ValueCell!1703))

(assert (=> mapNonEmpty!6974 (= (arr!3467 (_values!3591 thiss!1248)) (store mapRest!6974 mapKey!6974 mapValue!6974))))

(declare-fun b!174494 () Bool)

(declare-fun e!115219 () Bool)

(assert (=> b!174494 (= e!115221 (and e!115219 mapRes!6974))))

(declare-fun condMapEmpty!6974 () Bool)

(declare-fun mapDefault!6974 () ValueCell!1703)

(assert (=> b!174494 (= condMapEmpty!6974 (= (arr!3467 (_values!3591 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1703)) mapDefault!6974)))))

(declare-fun b!174495 () Bool)

(declare-fun res!82728 () Bool)

(assert (=> b!174495 (=> (not res!82728) (not e!115222))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!174495 (= res!82728 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174496 () Bool)

(declare-fun res!82731 () Bool)

(assert (=> b!174496 (=> (not res!82731) (not e!115222))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!557 0))(
  ( (MissingZero!557 (index!4396 (_ BitVec 32))) (Found!557 (index!4397 (_ BitVec 32))) (Intermediate!557 (undefined!1369 Bool) (index!4398 (_ BitVec 32)) (x!19244 (_ BitVec 32))) (Undefined!557) (MissingVacant!557 (index!4399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7301 (_ BitVec 32)) SeekEntryResult!557)

(assert (=> b!174496 (= res!82731 ((_ is Undefined!557) (seekEntryOrOpen!0 key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248))))))

(declare-fun res!82729 () Bool)

(assert (=> start!17404 (=> (not res!82729) (not e!115222))))

(declare-fun valid!994 (LongMapFixedSize!2314) Bool)

(assert (=> start!17404 (= res!82729 (valid!994 thiss!1248))))

(assert (=> start!17404 e!115222))

(assert (=> start!17404 e!115217))

(assert (=> start!17404 true))

(declare-fun b!174497 () Bool)

(declare-fun res!82732 () Bool)

(assert (=> b!174497 (=> (not res!82732) (not e!115222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174497 (= res!82732 (validMask!0 (mask!8488 thiss!1248)))))

(declare-fun b!174498 () Bool)

(declare-fun res!82730 () Bool)

(assert (=> b!174498 (=> (not res!82730) (not e!115222))))

(declare-datatypes ((tuple2!3248 0))(
  ( (tuple2!3249 (_1!1635 (_ BitVec 64)) (_2!1635 V!5105)) )
))
(declare-datatypes ((List!2222 0))(
  ( (Nil!2219) (Cons!2218 (h!2835 tuple2!3248) (t!7027 List!2222)) )
))
(declare-datatypes ((ListLongMap!2167 0))(
  ( (ListLongMap!2168 (toList!1099 List!2222)) )
))
(declare-fun contains!1160 (ListLongMap!2167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!735 (array!7301 array!7303 (_ BitVec 32) (_ BitVec 32) V!5105 V!5105 (_ BitVec 32) Int) ListLongMap!2167)

(assert (=> b!174498 (= res!82730 (contains!1160 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) key!828))))

(declare-fun b!174499 () Bool)

(assert (=> b!174499 (= e!115220 tp_is_empty!4093)))

(declare-fun b!174500 () Bool)

(assert (=> b!174500 (= e!115219 tp_is_empty!4093)))

(declare-fun mapIsEmpty!6974 () Bool)

(assert (=> mapIsEmpty!6974 mapRes!6974))

(assert (= (and start!17404 res!82729) b!174495))

(assert (= (and b!174495 res!82728) b!174496))

(assert (= (and b!174496 res!82731) b!174498))

(assert (= (and b!174498 res!82730) b!174497))

(assert (= (and b!174497 res!82732) b!174492))

(assert (= (and b!174494 condMapEmpty!6974) mapIsEmpty!6974))

(assert (= (and b!174494 (not condMapEmpty!6974)) mapNonEmpty!6974))

(assert (= (and mapNonEmpty!6974 ((_ is ValueCellFull!1703) mapValue!6974)) b!174499))

(assert (= (and b!174494 ((_ is ValueCellFull!1703) mapDefault!6974)) b!174500))

(assert (= b!174493 b!174494))

(assert (= start!17404 b!174493))

(declare-fun m!203031 () Bool)

(assert (=> mapNonEmpty!6974 m!203031))

(declare-fun m!203033 () Bool)

(assert (=> b!174497 m!203033))

(declare-fun m!203035 () Bool)

(assert (=> b!174498 m!203035))

(assert (=> b!174498 m!203035))

(declare-fun m!203037 () Bool)

(assert (=> b!174498 m!203037))

(declare-fun m!203039 () Bool)

(assert (=> start!17404 m!203039))

(declare-fun m!203041 () Bool)

(assert (=> b!174493 m!203041))

(declare-fun m!203043 () Bool)

(assert (=> b!174493 m!203043))

(declare-fun m!203045 () Bool)

(assert (=> b!174496 m!203045))

(check-sat (not mapNonEmpty!6974) (not b!174496) (not start!17404) (not b!174497) b_and!10763 (not b_next!4321) (not b!174493) tp_is_empty!4093 (not b!174498))
(check-sat b_and!10763 (not b_next!4321))
(get-model)

(declare-fun lt!86232 () SeekEntryResult!557)

(declare-fun e!115267 () SeekEntryResult!557)

(declare-fun b!174567 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7301 (_ BitVec 32)) SeekEntryResult!557)

(assert (=> b!174567 (= e!115267 (seekKeyOrZeroReturnVacant!0 (x!19244 lt!86232) (index!4398 lt!86232) (index!4398 lt!86232) key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)))))

(declare-fun b!174568 () Bool)

(declare-fun e!115265 () SeekEntryResult!557)

(assert (=> b!174568 (= e!115265 (Found!557 (index!4398 lt!86232)))))

(declare-fun b!174569 () Bool)

(assert (=> b!174569 (= e!115267 (MissingZero!557 (index!4398 lt!86232)))))

(declare-fun d!53145 () Bool)

(declare-fun lt!86231 () SeekEntryResult!557)

(assert (=> d!53145 (and (or ((_ is Undefined!557) lt!86231) (not ((_ is Found!557) lt!86231)) (and (bvsge (index!4397 lt!86231) #b00000000000000000000000000000000) (bvslt (index!4397 lt!86231) (size!3767 (_keys!5451 thiss!1248))))) (or ((_ is Undefined!557) lt!86231) ((_ is Found!557) lt!86231) (not ((_ is MissingZero!557) lt!86231)) (and (bvsge (index!4396 lt!86231) #b00000000000000000000000000000000) (bvslt (index!4396 lt!86231) (size!3767 (_keys!5451 thiss!1248))))) (or ((_ is Undefined!557) lt!86231) ((_ is Found!557) lt!86231) ((_ is MissingZero!557) lt!86231) (not ((_ is MissingVacant!557) lt!86231)) (and (bvsge (index!4399 lt!86231) #b00000000000000000000000000000000) (bvslt (index!4399 lt!86231) (size!3767 (_keys!5451 thiss!1248))))) (or ((_ is Undefined!557) lt!86231) (ite ((_ is Found!557) lt!86231) (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4397 lt!86231)) key!828) (ite ((_ is MissingZero!557) lt!86231) (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4396 lt!86231)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!557) lt!86231) (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4399 lt!86231)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115266 () SeekEntryResult!557)

(assert (=> d!53145 (= lt!86231 e!115266)))

(declare-fun c!31240 () Bool)

(assert (=> d!53145 (= c!31240 (and ((_ is Intermediate!557) lt!86232) (undefined!1369 lt!86232)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7301 (_ BitVec 32)) SeekEntryResult!557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53145 (= lt!86232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8488 thiss!1248)) key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)))))

(assert (=> d!53145 (validMask!0 (mask!8488 thiss!1248))))

(assert (=> d!53145 (= (seekEntryOrOpen!0 key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)) lt!86231)))

(declare-fun b!174570 () Bool)

(assert (=> b!174570 (= e!115266 Undefined!557)))

(declare-fun b!174571 () Bool)

(declare-fun c!31239 () Bool)

(declare-fun lt!86230 () (_ BitVec 64))

(assert (=> b!174571 (= c!31239 (= lt!86230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174571 (= e!115265 e!115267)))

(declare-fun b!174572 () Bool)

(assert (=> b!174572 (= e!115266 e!115265)))

(assert (=> b!174572 (= lt!86230 (select (arr!3466 (_keys!5451 thiss!1248)) (index!4398 lt!86232)))))

(declare-fun c!31238 () Bool)

(assert (=> b!174572 (= c!31238 (= lt!86230 key!828))))

(assert (= (and d!53145 c!31240) b!174570))

(assert (= (and d!53145 (not c!31240)) b!174572))

(assert (= (and b!174572 c!31238) b!174568))

(assert (= (and b!174572 (not c!31238)) b!174571))

(assert (= (and b!174571 c!31239) b!174569))

(assert (= (and b!174571 (not c!31239)) b!174567))

(declare-fun m!203079 () Bool)

(assert (=> b!174567 m!203079))

(declare-fun m!203081 () Bool)

(assert (=> d!53145 m!203081))

(declare-fun m!203083 () Bool)

(assert (=> d!53145 m!203083))

(declare-fun m!203085 () Bool)

(assert (=> d!53145 m!203085))

(declare-fun m!203087 () Bool)

(assert (=> d!53145 m!203087))

(assert (=> d!53145 m!203083))

(declare-fun m!203089 () Bool)

(assert (=> d!53145 m!203089))

(assert (=> d!53145 m!203033))

(declare-fun m!203091 () Bool)

(assert (=> b!174572 m!203091))

(assert (=> b!174496 d!53145))

(declare-fun d!53147 () Bool)

(declare-fun e!115273 () Bool)

(assert (=> d!53147 e!115273))

(declare-fun res!82765 () Bool)

(assert (=> d!53147 (=> res!82765 e!115273)))

(declare-fun lt!86243 () Bool)

(assert (=> d!53147 (= res!82765 (not lt!86243))))

(declare-fun lt!86241 () Bool)

(assert (=> d!53147 (= lt!86243 lt!86241)))

(declare-datatypes ((Unit!5343 0))(
  ( (Unit!5344) )
))
(declare-fun lt!86242 () Unit!5343)

(declare-fun e!115272 () Unit!5343)

(assert (=> d!53147 (= lt!86242 e!115272)))

(declare-fun c!31243 () Bool)

(assert (=> d!53147 (= c!31243 lt!86241)))

(declare-fun containsKey!189 (List!2222 (_ BitVec 64)) Bool)

(assert (=> d!53147 (= lt!86241 (containsKey!189 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(assert (=> d!53147 (= (contains!1160 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) key!828) lt!86243)))

(declare-fun b!174579 () Bool)

(declare-fun lt!86244 () Unit!5343)

(assert (=> b!174579 (= e!115272 lt!86244)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!138 (List!2222 (_ BitVec 64)) Unit!5343)

(assert (=> b!174579 (= lt!86244 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-datatypes ((Option!191 0))(
  ( (Some!190 (v!3960 V!5105)) (None!189) )
))
(declare-fun isDefined!139 (Option!191) Bool)

(declare-fun getValueByKey!185 (List!2222 (_ BitVec 64)) Option!191)

(assert (=> b!174579 (isDefined!139 (getValueByKey!185 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-fun b!174580 () Bool)

(declare-fun Unit!5345 () Unit!5343)

(assert (=> b!174580 (= e!115272 Unit!5345)))

(declare-fun b!174581 () Bool)

(assert (=> b!174581 (= e!115273 (isDefined!139 (getValueByKey!185 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828)))))

(assert (= (and d!53147 c!31243) b!174579))

(assert (= (and d!53147 (not c!31243)) b!174580))

(assert (= (and d!53147 (not res!82765)) b!174581))

(declare-fun m!203093 () Bool)

(assert (=> d!53147 m!203093))

(declare-fun m!203095 () Bool)

(assert (=> b!174579 m!203095))

(declare-fun m!203097 () Bool)

(assert (=> b!174579 m!203097))

(assert (=> b!174579 m!203097))

(declare-fun m!203099 () Bool)

(assert (=> b!174579 m!203099))

(assert (=> b!174581 m!203097))

(assert (=> b!174581 m!203097))

(assert (=> b!174581 m!203099))

(assert (=> b!174498 d!53147))

(declare-fun b!174624 () Bool)

(declare-fun e!115305 () Bool)

(declare-fun lt!86300 () ListLongMap!2167)

(declare-fun apply!132 (ListLongMap!2167 (_ BitVec 64)) V!5105)

(assert (=> b!174624 (= e!115305 (= (apply!132 lt!86300 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3449 thiss!1248)))))

(declare-fun b!174625 () Bool)

(declare-fun e!115310 () Bool)

(declare-fun e!115309 () Bool)

(assert (=> b!174625 (= e!115310 e!115309)))

(declare-fun res!82787 () Bool)

(assert (=> b!174625 (=> (not res!82787) (not e!115309))))

(assert (=> b!174625 (= res!82787 (contains!1160 lt!86300 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun bm!17680 () Bool)

(declare-fun call!17686 () Bool)

(assert (=> bm!17680 (= call!17686 (contains!1160 lt!86300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17681 () Bool)

(declare-fun call!17688 () Bool)

(assert (=> bm!17681 (= call!17688 (contains!1160 lt!86300 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174626 () Bool)

(declare-fun e!115302 () Bool)

(declare-fun e!115306 () Bool)

(assert (=> b!174626 (= e!115302 e!115306)))

(declare-fun c!31257 () Bool)

(assert (=> b!174626 (= c!31257 (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174627 () Bool)

(declare-fun c!31258 () Bool)

(assert (=> b!174627 (= c!31258 (and (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115312 () ListLongMap!2167)

(declare-fun e!115308 () ListLongMap!2167)

(assert (=> b!174627 (= e!115312 e!115308)))

(declare-fun b!174628 () Bool)

(declare-fun call!17684 () ListLongMap!2167)

(assert (=> b!174628 (= e!115312 call!17684)))

(declare-fun bm!17682 () Bool)

(declare-fun call!17687 () ListLongMap!2167)

(declare-fun call!17685 () ListLongMap!2167)

(assert (=> bm!17682 (= call!17687 call!17685)))

(declare-fun b!174629 () Bool)

(assert (=> b!174629 (= e!115308 call!17684)))

(declare-fun b!174630 () Bool)

(declare-fun e!115301 () Bool)

(assert (=> b!174630 (= e!115301 (not call!17686))))

(declare-fun b!174631 () Bool)

(declare-fun e!115303 () Bool)

(assert (=> b!174631 (= e!115303 (= (apply!132 lt!86300 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3449 thiss!1248)))))

(declare-fun b!174632 () Bool)

(declare-fun e!115311 () Unit!5343)

(declare-fun lt!86306 () Unit!5343)

(assert (=> b!174632 (= e!115311 lt!86306)))

(declare-fun lt!86305 () ListLongMap!2167)

(declare-fun getCurrentListMapNoExtraKeys!153 (array!7301 array!7303 (_ BitVec 32) (_ BitVec 32) V!5105 V!5105 (_ BitVec 32) Int) ListLongMap!2167)

(assert (=> b!174632 (= lt!86305 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86292 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86310 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86310 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86291 () Unit!5343)

(declare-fun addStillContains!108 (ListLongMap!2167 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5343)

(assert (=> b!174632 (= lt!86291 (addStillContains!108 lt!86305 lt!86292 (zeroValue!3449 thiss!1248) lt!86310))))

(declare-fun +!244 (ListLongMap!2167 tuple2!3248) ListLongMap!2167)

(assert (=> b!174632 (contains!1160 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))) lt!86310)))

(declare-fun lt!86302 () Unit!5343)

(assert (=> b!174632 (= lt!86302 lt!86291)))

(declare-fun lt!86309 () ListLongMap!2167)

(assert (=> b!174632 (= lt!86309 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86304 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86304 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86290 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86290 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86297 () Unit!5343)

(declare-fun addApplyDifferent!108 (ListLongMap!2167 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5343)

(assert (=> b!174632 (= lt!86297 (addApplyDifferent!108 lt!86309 lt!86304 (minValue!3449 thiss!1248) lt!86290))))

(assert (=> b!174632 (= (apply!132 (+!244 lt!86309 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))) lt!86290) (apply!132 lt!86309 lt!86290))))

(declare-fun lt!86299 () Unit!5343)

(assert (=> b!174632 (= lt!86299 lt!86297)))

(declare-fun lt!86295 () ListLongMap!2167)

(assert (=> b!174632 (= lt!86295 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86301 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86296 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86296 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86303 () Unit!5343)

(assert (=> b!174632 (= lt!86303 (addApplyDifferent!108 lt!86295 lt!86301 (zeroValue!3449 thiss!1248) lt!86296))))

(assert (=> b!174632 (= (apply!132 (+!244 lt!86295 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))) lt!86296) (apply!132 lt!86295 lt!86296))))

(declare-fun lt!86294 () Unit!5343)

(assert (=> b!174632 (= lt!86294 lt!86303)))

(declare-fun lt!86293 () ListLongMap!2167)

(assert (=> b!174632 (= lt!86293 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86308 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86308 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86289 () (_ BitVec 64))

(assert (=> b!174632 (= lt!86289 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174632 (= lt!86306 (addApplyDifferent!108 lt!86293 lt!86308 (minValue!3449 thiss!1248) lt!86289))))

(assert (=> b!174632 (= (apply!132 (+!244 lt!86293 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))) lt!86289) (apply!132 lt!86293 lt!86289))))

(declare-fun b!174633 () Bool)

(declare-fun e!115304 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174633 (= e!115304 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174634 () Bool)

(declare-fun get!1971 (ValueCell!1703 V!5105) V!5105)

(declare-fun dynLambda!466 (Int (_ BitVec 64)) V!5105)

(assert (=> b!174634 (= e!115309 (= (apply!132 lt!86300 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)) (get!1971 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3768 (_values!3591 thiss!1248))))))

(assert (=> b!174634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun b!174635 () Bool)

(declare-fun e!115300 () ListLongMap!2167)

(assert (=> b!174635 (= e!115300 e!115312)))

(declare-fun c!31256 () Bool)

(assert (=> b!174635 (= c!31256 (and (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174636 () Bool)

(declare-fun res!82786 () Bool)

(assert (=> b!174636 (=> (not res!82786) (not e!115302))))

(assert (=> b!174636 (= res!82786 e!115301)))

(declare-fun c!31259 () Bool)

(assert (=> b!174636 (= c!31259 (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!174637 () Bool)

(assert (=> b!174637 (= e!115306 e!115305)))

(declare-fun res!82788 () Bool)

(assert (=> b!174637 (= res!82788 call!17688)))

(assert (=> b!174637 (=> (not res!82788) (not e!115305))))

(declare-fun b!174638 () Bool)

(declare-fun call!17689 () ListLongMap!2167)

(assert (=> b!174638 (= e!115300 (+!244 call!17689 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))

(declare-fun bm!17683 () Bool)

(assert (=> bm!17683 (= call!17685 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun d!53149 () Bool)

(assert (=> d!53149 e!115302))

(declare-fun res!82784 () Bool)

(assert (=> d!53149 (=> (not res!82784) (not e!115302))))

(assert (=> d!53149 (= res!82784 (or (bvsge #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))))

(declare-fun lt!86298 () ListLongMap!2167)

(assert (=> d!53149 (= lt!86300 lt!86298)))

(declare-fun lt!86307 () Unit!5343)

(assert (=> d!53149 (= lt!86307 e!115311)))

(declare-fun c!31260 () Bool)

(assert (=> d!53149 (= c!31260 e!115304)))

(declare-fun res!82792 () Bool)

(assert (=> d!53149 (=> (not res!82792) (not e!115304))))

(assert (=> d!53149 (= res!82792 (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> d!53149 (= lt!86298 e!115300)))

(declare-fun c!31261 () Bool)

(assert (=> d!53149 (= c!31261 (and (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53149 (validMask!0 (mask!8488 thiss!1248))))

(assert (=> d!53149 (= (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) lt!86300)))

(declare-fun bm!17684 () Bool)

(assert (=> bm!17684 (= call!17684 call!17689)))

(declare-fun b!174639 () Bool)

(declare-fun Unit!5346 () Unit!5343)

(assert (=> b!174639 (= e!115311 Unit!5346)))

(declare-fun b!174640 () Bool)

(declare-fun res!82785 () Bool)

(assert (=> b!174640 (=> (not res!82785) (not e!115302))))

(assert (=> b!174640 (= res!82785 e!115310)))

(declare-fun res!82789 () Bool)

(assert (=> b!174640 (=> res!82789 e!115310)))

(declare-fun e!115307 () Bool)

(assert (=> b!174640 (= res!82789 (not e!115307))))

(declare-fun res!82791 () Bool)

(assert (=> b!174640 (=> (not res!82791) (not e!115307))))

(assert (=> b!174640 (= res!82791 (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun b!174641 () Bool)

(assert (=> b!174641 (= e!115301 e!115303)))

(declare-fun res!82790 () Bool)

(assert (=> b!174641 (= res!82790 call!17686)))

(assert (=> b!174641 (=> (not res!82790) (not e!115303))))

(declare-fun b!174642 () Bool)

(assert (=> b!174642 (= e!115306 (not call!17688))))

(declare-fun call!17683 () ListLongMap!2167)

(declare-fun bm!17685 () Bool)

(assert (=> bm!17685 (= call!17689 (+!244 (ite c!31261 call!17685 (ite c!31256 call!17687 call!17683)) (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(declare-fun bm!17686 () Bool)

(assert (=> bm!17686 (= call!17683 call!17687)))

(declare-fun b!174643 () Bool)

(assert (=> b!174643 (= e!115308 call!17683)))

(declare-fun b!174644 () Bool)

(assert (=> b!174644 (= e!115307 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53149 c!31261) b!174638))

(assert (= (and d!53149 (not c!31261)) b!174635))

(assert (= (and b!174635 c!31256) b!174628))

(assert (= (and b!174635 (not c!31256)) b!174627))

(assert (= (and b!174627 c!31258) b!174629))

(assert (= (and b!174627 (not c!31258)) b!174643))

(assert (= (or b!174629 b!174643) bm!17686))

(assert (= (or b!174628 bm!17686) bm!17682))

(assert (= (or b!174628 b!174629) bm!17684))

(assert (= (or b!174638 bm!17682) bm!17683))

(assert (= (or b!174638 bm!17684) bm!17685))

(assert (= (and d!53149 res!82792) b!174633))

(assert (= (and d!53149 c!31260) b!174632))

(assert (= (and d!53149 (not c!31260)) b!174639))

(assert (= (and d!53149 res!82784) b!174640))

(assert (= (and b!174640 res!82791) b!174644))

(assert (= (and b!174640 (not res!82789)) b!174625))

(assert (= (and b!174625 res!82787) b!174634))

(assert (= (and b!174640 res!82785) b!174636))

(assert (= (and b!174636 c!31259) b!174641))

(assert (= (and b!174636 (not c!31259)) b!174630))

(assert (= (and b!174641 res!82790) b!174631))

(assert (= (or b!174641 b!174630) bm!17680))

(assert (= (and b!174636 res!82786) b!174626))

(assert (= (and b!174626 c!31257) b!174637))

(assert (= (and b!174626 (not c!31257)) b!174642))

(assert (= (and b!174637 res!82788) b!174624))

(assert (= (or b!174637 b!174642) bm!17681))

(declare-fun b_lambda!6969 () Bool)

(assert (=> (not b_lambda!6969) (not b!174634)))

(declare-fun t!7029 () Bool)

(declare-fun tb!2767 () Bool)

(assert (=> (and b!174493 (= (defaultEntry!3608 thiss!1248) (defaultEntry!3608 thiss!1248)) t!7029) tb!2767))

(declare-fun result!4591 () Bool)

(assert (=> tb!2767 (= result!4591 tp_is_empty!4093)))

(assert (=> b!174634 t!7029))

(declare-fun b_and!10769 () Bool)

(assert (= b_and!10763 (and (=> t!7029 result!4591) b_and!10769)))

(declare-fun m!203101 () Bool)

(assert (=> b!174625 m!203101))

(assert (=> b!174625 m!203101))

(declare-fun m!203103 () Bool)

(assert (=> b!174625 m!203103))

(declare-fun m!203105 () Bool)

(assert (=> bm!17685 m!203105))

(declare-fun m!203107 () Bool)

(assert (=> b!174638 m!203107))

(declare-fun m!203109 () Bool)

(assert (=> bm!17680 m!203109))

(declare-fun m!203111 () Bool)

(assert (=> bm!17681 m!203111))

(declare-fun m!203113 () Bool)

(assert (=> b!174624 m!203113))

(declare-fun m!203115 () Bool)

(assert (=> b!174631 m!203115))

(assert (=> d!53149 m!203033))

(assert (=> b!174633 m!203101))

(assert (=> b!174633 m!203101))

(declare-fun m!203117 () Bool)

(assert (=> b!174633 m!203117))

(declare-fun m!203119 () Bool)

(assert (=> b!174632 m!203119))

(declare-fun m!203121 () Bool)

(assert (=> b!174632 m!203121))

(declare-fun m!203123 () Bool)

(assert (=> b!174632 m!203123))

(declare-fun m!203125 () Bool)

(assert (=> b!174632 m!203125))

(declare-fun m!203127 () Bool)

(assert (=> b!174632 m!203127))

(declare-fun m!203129 () Bool)

(assert (=> b!174632 m!203129))

(declare-fun m!203131 () Bool)

(assert (=> b!174632 m!203131))

(assert (=> b!174632 m!203123))

(declare-fun m!203133 () Bool)

(assert (=> b!174632 m!203133))

(declare-fun m!203135 () Bool)

(assert (=> b!174632 m!203135))

(declare-fun m!203137 () Bool)

(assert (=> b!174632 m!203137))

(declare-fun m!203139 () Bool)

(assert (=> b!174632 m!203139))

(declare-fun m!203141 () Bool)

(assert (=> b!174632 m!203141))

(assert (=> b!174632 m!203137))

(declare-fun m!203143 () Bool)

(assert (=> b!174632 m!203143))

(declare-fun m!203145 () Bool)

(assert (=> b!174632 m!203145))

(declare-fun m!203147 () Bool)

(assert (=> b!174632 m!203147))

(assert (=> b!174632 m!203129))

(assert (=> b!174632 m!203101))

(assert (=> b!174632 m!203141))

(declare-fun m!203149 () Bool)

(assert (=> b!174632 m!203149))

(declare-fun m!203151 () Bool)

(assert (=> b!174634 m!203151))

(declare-fun m!203153 () Bool)

(assert (=> b!174634 m!203153))

(declare-fun m!203155 () Bool)

(assert (=> b!174634 m!203155))

(assert (=> b!174634 m!203153))

(assert (=> b!174634 m!203101))

(declare-fun m!203157 () Bool)

(assert (=> b!174634 m!203157))

(assert (=> b!174634 m!203101))

(assert (=> b!174634 m!203151))

(assert (=> b!174644 m!203101))

(assert (=> b!174644 m!203101))

(assert (=> b!174644 m!203117))

(assert (=> bm!17683 m!203125))

(assert (=> b!174498 d!53149))

(declare-fun d!53151 () Bool)

(assert (=> d!53151 (= (array_inv!2237 (_keys!5451 thiss!1248)) (bvsge (size!3767 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174493 d!53151))

(declare-fun d!53153 () Bool)

(assert (=> d!53153 (= (array_inv!2238 (_values!3591 thiss!1248)) (bvsge (size!3768 (_values!3591 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174493 d!53153))

(declare-fun d!53155 () Bool)

(assert (=> d!53155 (= (validMask!0 (mask!8488 thiss!1248)) (and (or (= (mask!8488 thiss!1248) #b00000000000000000000000000000111) (= (mask!8488 thiss!1248) #b00000000000000000000000000001111) (= (mask!8488 thiss!1248) #b00000000000000000000000000011111) (= (mask!8488 thiss!1248) #b00000000000000000000000000111111) (= (mask!8488 thiss!1248) #b00000000000000000000000001111111) (= (mask!8488 thiss!1248) #b00000000000000000000000011111111) (= (mask!8488 thiss!1248) #b00000000000000000000000111111111) (= (mask!8488 thiss!1248) #b00000000000000000000001111111111) (= (mask!8488 thiss!1248) #b00000000000000000000011111111111) (= (mask!8488 thiss!1248) #b00000000000000000000111111111111) (= (mask!8488 thiss!1248) #b00000000000000000001111111111111) (= (mask!8488 thiss!1248) #b00000000000000000011111111111111) (= (mask!8488 thiss!1248) #b00000000000000000111111111111111) (= (mask!8488 thiss!1248) #b00000000000000001111111111111111) (= (mask!8488 thiss!1248) #b00000000000000011111111111111111) (= (mask!8488 thiss!1248) #b00000000000000111111111111111111) (= (mask!8488 thiss!1248) #b00000000000001111111111111111111) (= (mask!8488 thiss!1248) #b00000000000011111111111111111111) (= (mask!8488 thiss!1248) #b00000000000111111111111111111111) (= (mask!8488 thiss!1248) #b00000000001111111111111111111111) (= (mask!8488 thiss!1248) #b00000000011111111111111111111111) (= (mask!8488 thiss!1248) #b00000000111111111111111111111111) (= (mask!8488 thiss!1248) #b00000001111111111111111111111111) (= (mask!8488 thiss!1248) #b00000011111111111111111111111111) (= (mask!8488 thiss!1248) #b00000111111111111111111111111111) (= (mask!8488 thiss!1248) #b00001111111111111111111111111111) (= (mask!8488 thiss!1248) #b00011111111111111111111111111111) (= (mask!8488 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8488 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174497 d!53155))

(declare-fun d!53157 () Bool)

(declare-fun res!82799 () Bool)

(declare-fun e!115315 () Bool)

(assert (=> d!53157 (=> (not res!82799) (not e!115315))))

(declare-fun simpleValid!146 (LongMapFixedSize!2314) Bool)

(assert (=> d!53157 (= res!82799 (simpleValid!146 thiss!1248))))

(assert (=> d!53157 (= (valid!994 thiss!1248) e!115315)))

(declare-fun b!174653 () Bool)

(declare-fun res!82800 () Bool)

(assert (=> b!174653 (=> (not res!82800) (not e!115315))))

(declare-fun arrayCountValidKeys!0 (array!7301 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174653 (= res!82800 (= (arrayCountValidKeys!0 (_keys!5451 thiss!1248) #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))) (_size!1206 thiss!1248)))))

(declare-fun b!174654 () Bool)

(declare-fun res!82801 () Bool)

(assert (=> b!174654 (=> (not res!82801) (not e!115315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7301 (_ BitVec 32)) Bool)

(assert (=> b!174654 (= res!82801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)))))

(declare-fun b!174655 () Bool)

(declare-datatypes ((List!2223 0))(
  ( (Nil!2220) (Cons!2219 (h!2836 (_ BitVec 64)) (t!7030 List!2223)) )
))
(declare-fun arrayNoDuplicates!0 (array!7301 (_ BitVec 32) List!2223) Bool)

(assert (=> b!174655 (= e!115315 (arrayNoDuplicates!0 (_keys!5451 thiss!1248) #b00000000000000000000000000000000 Nil!2220))))

(assert (= (and d!53157 res!82799) b!174653))

(assert (= (and b!174653 res!82800) b!174654))

(assert (= (and b!174654 res!82801) b!174655))

(declare-fun m!203159 () Bool)

(assert (=> d!53157 m!203159))

(declare-fun m!203161 () Bool)

(assert (=> b!174653 m!203161))

(declare-fun m!203163 () Bool)

(assert (=> b!174654 m!203163))

(declare-fun m!203165 () Bool)

(assert (=> b!174655 m!203165))

(assert (=> start!17404 d!53157))

(declare-fun mapNonEmpty!6983 () Bool)

(declare-fun mapRes!6983 () Bool)

(declare-fun tp!15650 () Bool)

(declare-fun e!115321 () Bool)

(assert (=> mapNonEmpty!6983 (= mapRes!6983 (and tp!15650 e!115321))))

(declare-fun mapKey!6983 () (_ BitVec 32))

(declare-fun mapRest!6983 () (Array (_ BitVec 32) ValueCell!1703))

(declare-fun mapValue!6983 () ValueCell!1703)

(assert (=> mapNonEmpty!6983 (= mapRest!6974 (store mapRest!6983 mapKey!6983 mapValue!6983))))

(declare-fun b!174662 () Bool)

(assert (=> b!174662 (= e!115321 tp_is_empty!4093)))

(declare-fun condMapEmpty!6983 () Bool)

(declare-fun mapDefault!6983 () ValueCell!1703)

(assert (=> mapNonEmpty!6974 (= condMapEmpty!6983 (= mapRest!6974 ((as const (Array (_ BitVec 32) ValueCell!1703)) mapDefault!6983)))))

(declare-fun e!115320 () Bool)

(assert (=> mapNonEmpty!6974 (= tp!15634 (and e!115320 mapRes!6983))))

(declare-fun mapIsEmpty!6983 () Bool)

(assert (=> mapIsEmpty!6983 mapRes!6983))

(declare-fun b!174663 () Bool)

(assert (=> b!174663 (= e!115320 tp_is_empty!4093)))

(assert (= (and mapNonEmpty!6974 condMapEmpty!6983) mapIsEmpty!6983))

(assert (= (and mapNonEmpty!6974 (not condMapEmpty!6983)) mapNonEmpty!6983))

(assert (= (and mapNonEmpty!6983 ((_ is ValueCellFull!1703) mapValue!6983)) b!174662))

(assert (= (and mapNonEmpty!6974 ((_ is ValueCellFull!1703) mapDefault!6983)) b!174663))

(declare-fun m!203167 () Bool)

(assert (=> mapNonEmpty!6983 m!203167))

(declare-fun b_lambda!6971 () Bool)

(assert (= b_lambda!6969 (or (and b!174493 b_free!4321) b_lambda!6971)))

(check-sat (not b!174579) (not b!174632) (not bm!17683) (not d!53147) (not bm!17680) (not b!174655) (not d!53157) (not b_next!4321) (not b!174644) (not b!174653) (not b_lambda!6971) (not d!53145) (not b!174581) (not b!174625) (not b!174634) (not b!174624) (not bm!17685) (not b!174567) (not b!174633) (not b!174631) (not d!53149) (not bm!17681) (not b!174654) (not mapNonEmpty!6983) (not b!174638) tp_is_empty!4093 b_and!10769)
(check-sat b_and!10769 (not b_next!4321))
(get-model)

(declare-fun d!53159 () Bool)

(declare-fun e!115324 () Bool)

(assert (=> d!53159 e!115324))

(declare-fun res!82807 () Bool)

(assert (=> d!53159 (=> (not res!82807) (not e!115324))))

(declare-fun lt!86321 () ListLongMap!2167)

(assert (=> d!53159 (= res!82807 (contains!1160 lt!86321 (_1!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(declare-fun lt!86320 () List!2222)

(assert (=> d!53159 (= lt!86321 (ListLongMap!2168 lt!86320))))

(declare-fun lt!86322 () Unit!5343)

(declare-fun lt!86319 () Unit!5343)

(assert (=> d!53159 (= lt!86322 lt!86319)))

(assert (=> d!53159 (= (getValueByKey!185 lt!86320 (_1!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!100 (List!2222 (_ BitVec 64) V!5105) Unit!5343)

(assert (=> d!53159 (= lt!86319 (lemmaContainsTupThenGetReturnValue!100 lt!86320 (_1!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(declare-fun insertStrictlySorted!103 (List!2222 (_ BitVec 64) V!5105) List!2222)

(assert (=> d!53159 (= lt!86320 (insertStrictlySorted!103 (toList!1099 call!17689) (_1!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(assert (=> d!53159 (= (+!244 call!17689 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))) lt!86321)))

(declare-fun b!174668 () Bool)

(declare-fun res!82806 () Bool)

(assert (=> b!174668 (=> (not res!82806) (not e!115324))))

(assert (=> b!174668 (= res!82806 (= (getValueByKey!185 (toList!1099 lt!86321) (_1!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(declare-fun b!174669 () Bool)

(declare-fun contains!1161 (List!2222 tuple2!3248) Bool)

(assert (=> b!174669 (= e!115324 (contains!1161 (toList!1099 lt!86321) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))

(assert (= (and d!53159 res!82807) b!174668))

(assert (= (and b!174668 res!82806) b!174669))

(declare-fun m!203169 () Bool)

(assert (=> d!53159 m!203169))

(declare-fun m!203171 () Bool)

(assert (=> d!53159 m!203171))

(declare-fun m!203173 () Bool)

(assert (=> d!53159 m!203173))

(declare-fun m!203175 () Bool)

(assert (=> d!53159 m!203175))

(declare-fun m!203177 () Bool)

(assert (=> b!174668 m!203177))

(declare-fun m!203179 () Bool)

(assert (=> b!174669 m!203179))

(assert (=> b!174638 d!53159))

(declare-fun d!53161 () Bool)

(assert (=> d!53161 (= (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174644 d!53161))

(declare-fun d!53163 () Bool)

(assert (=> d!53163 (isDefined!139 (getValueByKey!185 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-fun lt!86325 () Unit!5343)

(declare-fun choose!941 (List!2222 (_ BitVec 64)) Unit!5343)

(assert (=> d!53163 (= lt!86325 (choose!941 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-fun e!115327 () Bool)

(assert (=> d!53163 e!115327))

(declare-fun res!82810 () Bool)

(assert (=> d!53163 (=> (not res!82810) (not e!115327))))

(declare-fun isStrictlySorted!328 (List!2222) Bool)

(assert (=> d!53163 (= res!82810 (isStrictlySorted!328 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))))

(assert (=> d!53163 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828) lt!86325)))

(declare-fun b!174672 () Bool)

(assert (=> b!174672 (= e!115327 (containsKey!189 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(assert (= (and d!53163 res!82810) b!174672))

(assert (=> d!53163 m!203097))

(assert (=> d!53163 m!203097))

(assert (=> d!53163 m!203099))

(declare-fun m!203181 () Bool)

(assert (=> d!53163 m!203181))

(declare-fun m!203183 () Bool)

(assert (=> d!53163 m!203183))

(assert (=> b!174672 m!203093))

(assert (=> b!174579 d!53163))

(declare-fun d!53165 () Bool)

(declare-fun isEmpty!443 (Option!191) Bool)

(assert (=> d!53165 (= (isDefined!139 (getValueByKey!185 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828)) (not (isEmpty!443 (getValueByKey!185 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))))

(declare-fun bs!7191 () Bool)

(assert (= bs!7191 d!53165))

(assert (=> bs!7191 m!203097))

(declare-fun m!203185 () Bool)

(assert (=> bs!7191 m!203185))

(assert (=> b!174579 d!53165))

(declare-fun b!174681 () Bool)

(declare-fun e!115332 () Option!191)

(assert (=> b!174681 (= e!115332 (Some!190 (_2!1635 (h!2835 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))))))

(declare-fun b!174683 () Bool)

(declare-fun e!115333 () Option!191)

(assert (=> b!174683 (= e!115333 (getValueByKey!185 (t!7027 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) key!828))))

(declare-fun b!174682 () Bool)

(assert (=> b!174682 (= e!115332 e!115333)))

(declare-fun c!31267 () Bool)

(assert (=> b!174682 (= c!31267 (and ((_ is Cons!2218) (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (not (= (_1!1635 (h!2835 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828))))))

(declare-fun d!53167 () Bool)

(declare-fun c!31266 () Bool)

(assert (=> d!53167 (= c!31266 (and ((_ is Cons!2218) (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (= (_1!1635 (h!2835 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)))))

(assert (=> d!53167 (= (getValueByKey!185 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828) e!115332)))

(declare-fun b!174684 () Bool)

(assert (=> b!174684 (= e!115333 None!189)))

(assert (= (and d!53167 c!31266) b!174681))

(assert (= (and d!53167 (not c!31266)) b!174682))

(assert (= (and b!174682 c!31267) b!174683))

(assert (= (and b!174682 (not c!31267)) b!174684))

(declare-fun m!203187 () Bool)

(assert (=> b!174683 m!203187))

(assert (=> b!174579 d!53167))

(assert (=> b!174581 d!53165))

(assert (=> b!174581 d!53167))

(declare-fun b!174709 () Bool)

(declare-fun e!115353 () ListLongMap!2167)

(assert (=> b!174709 (= e!115353 (ListLongMap!2168 Nil!2219))))

(declare-fun b!174710 () Bool)

(declare-fun lt!86341 () Unit!5343)

(declare-fun lt!86346 () Unit!5343)

(assert (=> b!174710 (= lt!86341 lt!86346)))

(declare-fun lt!86344 () (_ BitVec 64))

(declare-fun lt!86342 () ListLongMap!2167)

(declare-fun lt!86345 () V!5105)

(declare-fun lt!86343 () (_ BitVec 64))

(assert (=> b!174710 (not (contains!1160 (+!244 lt!86342 (tuple2!3249 lt!86344 lt!86345)) lt!86343))))

(declare-fun addStillNotContains!74 (ListLongMap!2167 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5343)

(assert (=> b!174710 (= lt!86346 (addStillNotContains!74 lt!86342 lt!86344 lt!86345 lt!86343))))

(assert (=> b!174710 (= lt!86343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174710 (= lt!86345 (get!1971 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174710 (= lt!86344 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17692 () ListLongMap!2167)

(assert (=> b!174710 (= lt!86342 call!17692)))

(declare-fun e!115352 () ListLongMap!2167)

(assert (=> b!174710 (= e!115352 (+!244 call!17692 (tuple2!3249 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000) (get!1971 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174711 () Bool)

(declare-fun e!115354 () Bool)

(declare-fun e!115349 () Bool)

(assert (=> b!174711 (= e!115354 e!115349)))

(declare-fun c!31276 () Bool)

(declare-fun e!115348 () Bool)

(assert (=> b!174711 (= c!31276 e!115348)))

(declare-fun res!82820 () Bool)

(assert (=> b!174711 (=> (not res!82820) (not e!115348))))

(assert (=> b!174711 (= res!82820 (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun b!174712 () Bool)

(assert (=> b!174712 (= e!115352 call!17692)))

(declare-fun b!174713 () Bool)

(declare-fun e!115350 () Bool)

(assert (=> b!174713 (= e!115349 e!115350)))

(declare-fun c!31278 () Bool)

(assert (=> b!174713 (= c!31278 (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun b!174714 () Bool)

(assert (=> b!174714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> b!174714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3768 (_values!3591 thiss!1248))))))

(declare-fun e!115351 () Bool)

(declare-fun lt!86340 () ListLongMap!2167)

(assert (=> b!174714 (= e!115351 (= (apply!132 lt!86340 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)) (get!1971 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174715 () Bool)

(declare-fun res!82819 () Bool)

(assert (=> b!174715 (=> (not res!82819) (not e!115354))))

(assert (=> b!174715 (= res!82819 (not (contains!1160 lt!86340 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53169 () Bool)

(assert (=> d!53169 e!115354))

(declare-fun res!82822 () Bool)

(assert (=> d!53169 (=> (not res!82822) (not e!115354))))

(assert (=> d!53169 (= res!82822 (not (contains!1160 lt!86340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53169 (= lt!86340 e!115353)))

(declare-fun c!31277 () Bool)

(assert (=> d!53169 (= c!31277 (bvsge #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> d!53169 (validMask!0 (mask!8488 thiss!1248))))

(assert (=> d!53169 (= (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) lt!86340)))

(declare-fun b!174716 () Bool)

(assert (=> b!174716 (= e!115348 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174716 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!174717 () Bool)

(declare-fun isEmpty!444 (ListLongMap!2167) Bool)

(assert (=> b!174717 (= e!115350 (isEmpty!444 lt!86340))))

(declare-fun b!174718 () Bool)

(assert (=> b!174718 (= e!115349 e!115351)))

(assert (=> b!174718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun res!82821 () Bool)

(assert (=> b!174718 (= res!82821 (contains!1160 lt!86340 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174718 (=> (not res!82821) (not e!115351))))

(declare-fun bm!17689 () Bool)

(assert (=> bm!17689 (= call!17692 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3608 thiss!1248)))))

(declare-fun b!174719 () Bool)

(assert (=> b!174719 (= e!115350 (= lt!86340 (getCurrentListMapNoExtraKeys!153 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3608 thiss!1248))))))

(declare-fun b!174720 () Bool)

(assert (=> b!174720 (= e!115353 e!115352)))

(declare-fun c!31279 () Bool)

(assert (=> b!174720 (= c!31279 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53169 c!31277) b!174709))

(assert (= (and d!53169 (not c!31277)) b!174720))

(assert (= (and b!174720 c!31279) b!174710))

(assert (= (and b!174720 (not c!31279)) b!174712))

(assert (= (or b!174710 b!174712) bm!17689))

(assert (= (and d!53169 res!82822) b!174715))

(assert (= (and b!174715 res!82819) b!174711))

(assert (= (and b!174711 res!82820) b!174716))

(assert (= (and b!174711 c!31276) b!174718))

(assert (= (and b!174711 (not c!31276)) b!174713))

(assert (= (and b!174718 res!82821) b!174714))

(assert (= (and b!174713 c!31278) b!174719))

(assert (= (and b!174713 (not c!31278)) b!174717))

(declare-fun b_lambda!6973 () Bool)

(assert (=> (not b_lambda!6973) (not b!174710)))

(assert (=> b!174710 t!7029))

(declare-fun b_and!10771 () Bool)

(assert (= b_and!10769 (and (=> t!7029 result!4591) b_and!10771)))

(declare-fun b_lambda!6975 () Bool)

(assert (=> (not b_lambda!6975) (not b!174714)))

(assert (=> b!174714 t!7029))

(declare-fun b_and!10773 () Bool)

(assert (= b_and!10771 (and (=> t!7029 result!4591) b_and!10773)))

(assert (=> b!174716 m!203101))

(assert (=> b!174716 m!203101))

(assert (=> b!174716 m!203117))

(assert (=> b!174710 m!203101))

(assert (=> b!174710 m!203151))

(assert (=> b!174710 m!203153))

(assert (=> b!174710 m!203155))

(declare-fun m!203189 () Bool)

(assert (=> b!174710 m!203189))

(declare-fun m!203191 () Bool)

(assert (=> b!174710 m!203191))

(declare-fun m!203193 () Bool)

(assert (=> b!174710 m!203193))

(assert (=> b!174710 m!203151))

(assert (=> b!174710 m!203189))

(assert (=> b!174710 m!203153))

(declare-fun m!203195 () Bool)

(assert (=> b!174710 m!203195))

(declare-fun m!203197 () Bool)

(assert (=> d!53169 m!203197))

(assert (=> d!53169 m!203033))

(assert (=> b!174718 m!203101))

(assert (=> b!174718 m!203101))

(declare-fun m!203199 () Bool)

(assert (=> b!174718 m!203199))

(declare-fun m!203201 () Bool)

(assert (=> bm!17689 m!203201))

(declare-fun m!203203 () Bool)

(assert (=> b!174717 m!203203))

(assert (=> b!174714 m!203101))

(assert (=> b!174714 m!203153))

(assert (=> b!174714 m!203151))

(assert (=> b!174714 m!203153))

(assert (=> b!174714 m!203155))

(assert (=> b!174714 m!203101))

(declare-fun m!203205 () Bool)

(assert (=> b!174714 m!203205))

(assert (=> b!174714 m!203151))

(assert (=> b!174719 m!203201))

(assert (=> b!174720 m!203101))

(assert (=> b!174720 m!203101))

(assert (=> b!174720 m!203117))

(declare-fun m!203207 () Bool)

(assert (=> b!174715 m!203207))

(assert (=> bm!17683 d!53169))

(assert (=> d!53149 d!53155))

(declare-fun b!174739 () Bool)

(declare-fun e!115369 () Bool)

(declare-fun e!115366 () Bool)

(assert (=> b!174739 (= e!115369 e!115366)))

(declare-fun res!82829 () Bool)

(declare-fun lt!86351 () SeekEntryResult!557)

(assert (=> b!174739 (= res!82829 (and ((_ is Intermediate!557) lt!86351) (not (undefined!1369 lt!86351)) (bvslt (x!19244 lt!86351) #b01111111111111111111111111111110) (bvsge (x!19244 lt!86351) #b00000000000000000000000000000000) (bvsge (x!19244 lt!86351) #b00000000000000000000000000000000)))))

(assert (=> b!174739 (=> (not res!82829) (not e!115366))))

(declare-fun b!174741 () Bool)

(assert (=> b!174741 (= e!115369 (bvsge (x!19244 lt!86351) #b01111111111111111111111111111110))))

(declare-fun b!174742 () Bool)

(declare-fun e!115365 () SeekEntryResult!557)

(declare-fun e!115367 () SeekEntryResult!557)

(assert (=> b!174742 (= e!115365 e!115367)))

(declare-fun c!31287 () Bool)

(declare-fun lt!86352 () (_ BitVec 64))

(assert (=> b!174742 (= c!31287 (or (= lt!86352 key!828) (= (bvadd lt!86352 lt!86352) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174743 () Bool)

(assert (=> b!174743 (= e!115367 (Intermediate!557 false (toIndex!0 key!828 (mask!8488 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!174744 () Bool)

(assert (=> b!174744 (= e!115365 (Intermediate!557 true (toIndex!0 key!828 (mask!8488 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!174745 () Bool)

(assert (=> b!174745 (and (bvsge (index!4398 lt!86351) #b00000000000000000000000000000000) (bvslt (index!4398 lt!86351) (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun res!82831 () Bool)

(assert (=> b!174745 (= res!82831 (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4398 lt!86351)) key!828))))

(declare-fun e!115368 () Bool)

(assert (=> b!174745 (=> res!82831 e!115368)))

(assert (=> b!174745 (= e!115366 e!115368)))

(declare-fun b!174740 () Bool)

(assert (=> b!174740 (and (bvsge (index!4398 lt!86351) #b00000000000000000000000000000000) (bvslt (index!4398 lt!86351) (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun res!82830 () Bool)

(assert (=> b!174740 (= res!82830 (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4398 lt!86351)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174740 (=> res!82830 e!115368)))

(declare-fun d!53171 () Bool)

(assert (=> d!53171 e!115369))

(declare-fun c!31288 () Bool)

(assert (=> d!53171 (= c!31288 (and ((_ is Intermediate!557) lt!86351) (undefined!1369 lt!86351)))))

(assert (=> d!53171 (= lt!86351 e!115365)))

(declare-fun c!31286 () Bool)

(assert (=> d!53171 (= c!31286 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53171 (= lt!86352 (select (arr!3466 (_keys!5451 thiss!1248)) (toIndex!0 key!828 (mask!8488 thiss!1248))))))

(assert (=> d!53171 (validMask!0 (mask!8488 thiss!1248))))

(assert (=> d!53171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8488 thiss!1248)) key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)) lt!86351)))

(declare-fun b!174746 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174746 (= e!115367 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8488 thiss!1248)) #b00000000000000000000000000000000 (mask!8488 thiss!1248)) key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)))))

(declare-fun b!174747 () Bool)

(assert (=> b!174747 (and (bvsge (index!4398 lt!86351) #b00000000000000000000000000000000) (bvslt (index!4398 lt!86351) (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> b!174747 (= e!115368 (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4398 lt!86351)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53171 c!31286) b!174744))

(assert (= (and d!53171 (not c!31286)) b!174742))

(assert (= (and b!174742 c!31287) b!174743))

(assert (= (and b!174742 (not c!31287)) b!174746))

(assert (= (and d!53171 c!31288) b!174741))

(assert (= (and d!53171 (not c!31288)) b!174739))

(assert (= (and b!174739 res!82829) b!174745))

(assert (= (and b!174745 (not res!82831)) b!174740))

(assert (= (and b!174740 (not res!82830)) b!174747))

(assert (=> b!174746 m!203083))

(declare-fun m!203209 () Bool)

(assert (=> b!174746 m!203209))

(assert (=> b!174746 m!203209))

(declare-fun m!203211 () Bool)

(assert (=> b!174746 m!203211))

(declare-fun m!203213 () Bool)

(assert (=> b!174740 m!203213))

(assert (=> b!174747 m!203213))

(assert (=> b!174745 m!203213))

(assert (=> d!53171 m!203083))

(declare-fun m!203215 () Bool)

(assert (=> d!53171 m!203215))

(assert (=> d!53171 m!203033))

(assert (=> d!53145 d!53171))

(declare-fun d!53173 () Bool)

(declare-fun lt!86358 () (_ BitVec 32))

(declare-fun lt!86357 () (_ BitVec 32))

(assert (=> d!53173 (= lt!86358 (bvmul (bvxor lt!86357 (bvlshr lt!86357 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53173 (= lt!86357 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53173 (and (bvsge (mask!8488 thiss!1248) #b00000000000000000000000000000000) (let ((res!82832 (let ((h!2837 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19261 (bvmul (bvxor h!2837 (bvlshr h!2837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19261 (bvlshr x!19261 #b00000000000000000000000000001101)) (mask!8488 thiss!1248)))))) (and (bvslt res!82832 (bvadd (mask!8488 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!82832 #b00000000000000000000000000000000))))))

(assert (=> d!53173 (= (toIndex!0 key!828 (mask!8488 thiss!1248)) (bvand (bvxor lt!86358 (bvlshr lt!86358 #b00000000000000000000000000001101)) (mask!8488 thiss!1248)))))

(assert (=> d!53145 d!53173))

(assert (=> d!53145 d!53155))

(declare-fun d!53175 () Bool)

(declare-fun get!1972 (Option!191) V!5105)

(assert (=> d!53175 (= (apply!132 lt!86300 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1972 (getValueByKey!185 (toList!1099 lt!86300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7192 () Bool)

(assert (= bs!7192 d!53175))

(declare-fun m!203217 () Bool)

(assert (=> bs!7192 m!203217))

(assert (=> bs!7192 m!203217))

(declare-fun m!203219 () Bool)

(assert (=> bs!7192 m!203219))

(assert (=> b!174624 d!53175))

(declare-fun d!53177 () Bool)

(assert (=> d!53177 (= (apply!132 lt!86300 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1972 (getValueByKey!185 (toList!1099 lt!86300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7193 () Bool)

(assert (= bs!7193 d!53177))

(declare-fun m!203221 () Bool)

(assert (=> bs!7193 m!203221))

(assert (=> bs!7193 m!203221))

(declare-fun m!203223 () Bool)

(assert (=> bs!7193 m!203223))

(assert (=> b!174631 d!53177))

(declare-fun d!53179 () Bool)

(declare-fun e!115371 () Bool)

(assert (=> d!53179 e!115371))

(declare-fun res!82833 () Bool)

(assert (=> d!53179 (=> res!82833 e!115371)))

(declare-fun lt!86361 () Bool)

(assert (=> d!53179 (= res!82833 (not lt!86361))))

(declare-fun lt!86359 () Bool)

(assert (=> d!53179 (= lt!86361 lt!86359)))

(declare-fun lt!86360 () Unit!5343)

(declare-fun e!115370 () Unit!5343)

(assert (=> d!53179 (= lt!86360 e!115370)))

(declare-fun c!31289 () Bool)

(assert (=> d!53179 (= c!31289 lt!86359)))

(assert (=> d!53179 (= lt!86359 (containsKey!189 (toList!1099 lt!86300) (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53179 (= (contains!1160 lt!86300 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)) lt!86361)))

(declare-fun b!174748 () Bool)

(declare-fun lt!86362 () Unit!5343)

(assert (=> b!174748 (= e!115370 lt!86362)))

(assert (=> b!174748 (= lt!86362 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1099 lt!86300) (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174748 (isDefined!139 (getValueByKey!185 (toList!1099 lt!86300) (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174749 () Bool)

(declare-fun Unit!5347 () Unit!5343)

(assert (=> b!174749 (= e!115370 Unit!5347)))

(declare-fun b!174750 () Bool)

(assert (=> b!174750 (= e!115371 (isDefined!139 (getValueByKey!185 (toList!1099 lt!86300) (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53179 c!31289) b!174748))

(assert (= (and d!53179 (not c!31289)) b!174749))

(assert (= (and d!53179 (not res!82833)) b!174750))

(assert (=> d!53179 m!203101))

(declare-fun m!203225 () Bool)

(assert (=> d!53179 m!203225))

(assert (=> b!174748 m!203101))

(declare-fun m!203227 () Bool)

(assert (=> b!174748 m!203227))

(assert (=> b!174748 m!203101))

(declare-fun m!203229 () Bool)

(assert (=> b!174748 m!203229))

(assert (=> b!174748 m!203229))

(declare-fun m!203231 () Bool)

(assert (=> b!174748 m!203231))

(assert (=> b!174750 m!203101))

(assert (=> b!174750 m!203229))

(assert (=> b!174750 m!203229))

(assert (=> b!174750 m!203231))

(assert (=> b!174625 d!53179))

(declare-fun b!174759 () Bool)

(declare-fun e!115377 () (_ BitVec 32))

(assert (=> b!174759 (= e!115377 #b00000000000000000000000000000000)))

(declare-fun b!174760 () Bool)

(declare-fun e!115376 () (_ BitVec 32))

(declare-fun call!17695 () (_ BitVec 32))

(assert (=> b!174760 (= e!115376 call!17695)))

(declare-fun bm!17692 () Bool)

(assert (=> bm!17692 (= call!17695 (arrayCountValidKeys!0 (_keys!5451 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3767 (_keys!5451 thiss!1248))))))

(declare-fun b!174761 () Bool)

(assert (=> b!174761 (= e!115377 e!115376)))

(declare-fun c!31295 () Bool)

(assert (=> b!174761 (= c!31295 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53181 () Bool)

(declare-fun lt!86365 () (_ BitVec 32))

(assert (=> d!53181 (and (bvsge lt!86365 #b00000000000000000000000000000000) (bvsle lt!86365 (bvsub (size!3767 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53181 (= lt!86365 e!115377)))

(declare-fun c!31294 () Bool)

(assert (=> d!53181 (= c!31294 (bvsge #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> d!53181 (and (bvsle #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3767 (_keys!5451 thiss!1248)) (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> d!53181 (= (arrayCountValidKeys!0 (_keys!5451 thiss!1248) #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))) lt!86365)))

(declare-fun b!174762 () Bool)

(assert (=> b!174762 (= e!115376 (bvadd #b00000000000000000000000000000001 call!17695))))

(assert (= (and d!53181 c!31294) b!174759))

(assert (= (and d!53181 (not c!31294)) b!174761))

(assert (= (and b!174761 c!31295) b!174762))

(assert (= (and b!174761 (not c!31295)) b!174760))

(assert (= (or b!174762 b!174760) bm!17692))

(declare-fun m!203233 () Bool)

(assert (=> bm!17692 m!203233))

(assert (=> b!174761 m!203101))

(assert (=> b!174761 m!203101))

(assert (=> b!174761 m!203117))

(assert (=> b!174653 d!53181))

(assert (=> b!174633 d!53161))

(assert (=> b!174632 d!53169))

(declare-fun d!53183 () Bool)

(assert (=> d!53183 (= (apply!132 lt!86293 lt!86289) (get!1972 (getValueByKey!185 (toList!1099 lt!86293) lt!86289)))))

(declare-fun bs!7194 () Bool)

(assert (= bs!7194 d!53183))

(declare-fun m!203235 () Bool)

(assert (=> bs!7194 m!203235))

(assert (=> bs!7194 m!203235))

(declare-fun m!203237 () Bool)

(assert (=> bs!7194 m!203237))

(assert (=> b!174632 d!53183))

(declare-fun d!53185 () Bool)

(assert (=> d!53185 (= (apply!132 (+!244 lt!86309 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))) lt!86290) (apply!132 lt!86309 lt!86290))))

(declare-fun lt!86368 () Unit!5343)

(declare-fun choose!942 (ListLongMap!2167 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5343)

(assert (=> d!53185 (= lt!86368 (choose!942 lt!86309 lt!86304 (minValue!3449 thiss!1248) lt!86290))))

(declare-fun e!115380 () Bool)

(assert (=> d!53185 e!115380))

(declare-fun res!82836 () Bool)

(assert (=> d!53185 (=> (not res!82836) (not e!115380))))

(assert (=> d!53185 (= res!82836 (contains!1160 lt!86309 lt!86290))))

(assert (=> d!53185 (= (addApplyDifferent!108 lt!86309 lt!86304 (minValue!3449 thiss!1248) lt!86290) lt!86368)))

(declare-fun b!174766 () Bool)

(assert (=> b!174766 (= e!115380 (not (= lt!86290 lt!86304)))))

(assert (= (and d!53185 res!82836) b!174766))

(declare-fun m!203239 () Bool)

(assert (=> d!53185 m!203239))

(declare-fun m!203241 () Bool)

(assert (=> d!53185 m!203241))

(assert (=> d!53185 m!203141))

(assert (=> d!53185 m!203149))

(assert (=> d!53185 m!203147))

(assert (=> d!53185 m!203141))

(assert (=> b!174632 d!53185))

(declare-fun d!53187 () Bool)

(declare-fun e!115381 () Bool)

(assert (=> d!53187 e!115381))

(declare-fun res!82838 () Bool)

(assert (=> d!53187 (=> (not res!82838) (not e!115381))))

(declare-fun lt!86371 () ListLongMap!2167)

(assert (=> d!53187 (= res!82838 (contains!1160 lt!86371 (_1!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))))))

(declare-fun lt!86370 () List!2222)

(assert (=> d!53187 (= lt!86371 (ListLongMap!2168 lt!86370))))

(declare-fun lt!86372 () Unit!5343)

(declare-fun lt!86369 () Unit!5343)

(assert (=> d!53187 (= lt!86372 lt!86369)))

(assert (=> d!53187 (= (getValueByKey!185 lt!86370 (_1!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53187 (= lt!86369 (lemmaContainsTupThenGetReturnValue!100 lt!86370 (_1!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53187 (= lt!86370 (insertStrictlySorted!103 (toList!1099 lt!86305) (_1!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53187 (= (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))) lt!86371)))

(declare-fun b!174767 () Bool)

(declare-fun res!82837 () Bool)

(assert (=> b!174767 (=> (not res!82837) (not e!115381))))

(assert (=> b!174767 (= res!82837 (= (getValueByKey!185 (toList!1099 lt!86371) (_1!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))))))))

(declare-fun b!174768 () Bool)

(assert (=> b!174768 (= e!115381 (contains!1161 (toList!1099 lt!86371) (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))))))

(assert (= (and d!53187 res!82838) b!174767))

(assert (= (and b!174767 res!82837) b!174768))

(declare-fun m!203243 () Bool)

(assert (=> d!53187 m!203243))

(declare-fun m!203245 () Bool)

(assert (=> d!53187 m!203245))

(declare-fun m!203247 () Bool)

(assert (=> d!53187 m!203247))

(declare-fun m!203249 () Bool)

(assert (=> d!53187 m!203249))

(declare-fun m!203251 () Bool)

(assert (=> b!174767 m!203251))

(declare-fun m!203253 () Bool)

(assert (=> b!174768 m!203253))

(assert (=> b!174632 d!53187))

(declare-fun d!53189 () Bool)

(declare-fun e!115382 () Bool)

(assert (=> d!53189 e!115382))

(declare-fun res!82840 () Bool)

(assert (=> d!53189 (=> (not res!82840) (not e!115382))))

(declare-fun lt!86375 () ListLongMap!2167)

(assert (=> d!53189 (= res!82840 (contains!1160 lt!86375 (_1!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))))))

(declare-fun lt!86374 () List!2222)

(assert (=> d!53189 (= lt!86375 (ListLongMap!2168 lt!86374))))

(declare-fun lt!86376 () Unit!5343)

(declare-fun lt!86373 () Unit!5343)

(assert (=> d!53189 (= lt!86376 lt!86373)))

(assert (=> d!53189 (= (getValueByKey!185 lt!86374 (_1!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))))))

(assert (=> d!53189 (= lt!86373 (lemmaContainsTupThenGetReturnValue!100 lt!86374 (_1!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))))))

(assert (=> d!53189 (= lt!86374 (insertStrictlySorted!103 (toList!1099 lt!86293) (_1!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))))))

(assert (=> d!53189 (= (+!244 lt!86293 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))) lt!86375)))

(declare-fun b!174769 () Bool)

(declare-fun res!82839 () Bool)

(assert (=> b!174769 (=> (not res!82839) (not e!115382))))

(assert (=> b!174769 (= res!82839 (= (getValueByKey!185 (toList!1099 lt!86375) (_1!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))))))))

(declare-fun b!174770 () Bool)

(assert (=> b!174770 (= e!115382 (contains!1161 (toList!1099 lt!86375) (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))))))

(assert (= (and d!53189 res!82840) b!174769))

(assert (= (and b!174769 res!82839) b!174770))

(declare-fun m!203255 () Bool)

(assert (=> d!53189 m!203255))

(declare-fun m!203257 () Bool)

(assert (=> d!53189 m!203257))

(declare-fun m!203259 () Bool)

(assert (=> d!53189 m!203259))

(declare-fun m!203261 () Bool)

(assert (=> d!53189 m!203261))

(declare-fun m!203263 () Bool)

(assert (=> b!174769 m!203263))

(declare-fun m!203265 () Bool)

(assert (=> b!174770 m!203265))

(assert (=> b!174632 d!53189))

(declare-fun d!53191 () Bool)

(assert (=> d!53191 (= (apply!132 lt!86295 lt!86296) (get!1972 (getValueByKey!185 (toList!1099 lt!86295) lt!86296)))))

(declare-fun bs!7195 () Bool)

(assert (= bs!7195 d!53191))

(declare-fun m!203267 () Bool)

(assert (=> bs!7195 m!203267))

(assert (=> bs!7195 m!203267))

(declare-fun m!203269 () Bool)

(assert (=> bs!7195 m!203269))

(assert (=> b!174632 d!53191))

(declare-fun d!53193 () Bool)

(assert (=> d!53193 (= (apply!132 (+!244 lt!86293 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))) lt!86289) (get!1972 (getValueByKey!185 (toList!1099 (+!244 lt!86293 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248)))) lt!86289)))))

(declare-fun bs!7196 () Bool)

(assert (= bs!7196 d!53193))

(declare-fun m!203271 () Bool)

(assert (=> bs!7196 m!203271))

(assert (=> bs!7196 m!203271))

(declare-fun m!203273 () Bool)

(assert (=> bs!7196 m!203273))

(assert (=> b!174632 d!53193))

(declare-fun d!53195 () Bool)

(declare-fun e!115383 () Bool)

(assert (=> d!53195 e!115383))

(declare-fun res!82842 () Bool)

(assert (=> d!53195 (=> (not res!82842) (not e!115383))))

(declare-fun lt!86379 () ListLongMap!2167)

(assert (=> d!53195 (= res!82842 (contains!1160 lt!86379 (_1!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))))))

(declare-fun lt!86378 () List!2222)

(assert (=> d!53195 (= lt!86379 (ListLongMap!2168 lt!86378))))

(declare-fun lt!86380 () Unit!5343)

(declare-fun lt!86377 () Unit!5343)

(assert (=> d!53195 (= lt!86380 lt!86377)))

(assert (=> d!53195 (= (getValueByKey!185 lt!86378 (_1!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))))))

(assert (=> d!53195 (= lt!86377 (lemmaContainsTupThenGetReturnValue!100 lt!86378 (_1!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))))))

(assert (=> d!53195 (= lt!86378 (insertStrictlySorted!103 (toList!1099 lt!86309) (_1!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))))))

(assert (=> d!53195 (= (+!244 lt!86309 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))) lt!86379)))

(declare-fun b!174771 () Bool)

(declare-fun res!82841 () Bool)

(assert (=> b!174771 (=> (not res!82841) (not e!115383))))

(assert (=> b!174771 (= res!82841 (= (getValueByKey!185 (toList!1099 lt!86379) (_1!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))))))))

(declare-fun b!174772 () Bool)

(assert (=> b!174772 (= e!115383 (contains!1161 (toList!1099 lt!86379) (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))))))

(assert (= (and d!53195 res!82842) b!174771))

(assert (= (and b!174771 res!82841) b!174772))

(declare-fun m!203275 () Bool)

(assert (=> d!53195 m!203275))

(declare-fun m!203277 () Bool)

(assert (=> d!53195 m!203277))

(declare-fun m!203279 () Bool)

(assert (=> d!53195 m!203279))

(declare-fun m!203281 () Bool)

(assert (=> d!53195 m!203281))

(declare-fun m!203283 () Bool)

(assert (=> b!174771 m!203283))

(declare-fun m!203285 () Bool)

(assert (=> b!174772 m!203285))

(assert (=> b!174632 d!53195))

(declare-fun d!53197 () Bool)

(declare-fun e!115384 () Bool)

(assert (=> d!53197 e!115384))

(declare-fun res!82844 () Bool)

(assert (=> d!53197 (=> (not res!82844) (not e!115384))))

(declare-fun lt!86383 () ListLongMap!2167)

(assert (=> d!53197 (= res!82844 (contains!1160 lt!86383 (_1!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))))))

(declare-fun lt!86382 () List!2222)

(assert (=> d!53197 (= lt!86383 (ListLongMap!2168 lt!86382))))

(declare-fun lt!86384 () Unit!5343)

(declare-fun lt!86381 () Unit!5343)

(assert (=> d!53197 (= lt!86384 lt!86381)))

(assert (=> d!53197 (= (getValueByKey!185 lt!86382 (_1!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53197 (= lt!86381 (lemmaContainsTupThenGetReturnValue!100 lt!86382 (_1!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53197 (= lt!86382 (insertStrictlySorted!103 (toList!1099 lt!86295) (_1!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))) (_2!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53197 (= (+!244 lt!86295 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))) lt!86383)))

(declare-fun b!174773 () Bool)

(declare-fun res!82843 () Bool)

(assert (=> b!174773 (=> (not res!82843) (not e!115384))))

(assert (=> b!174773 (= res!82843 (= (getValueByKey!185 (toList!1099 lt!86383) (_1!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))) (Some!190 (_2!1635 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))))))))

(declare-fun b!174774 () Bool)

(assert (=> b!174774 (= e!115384 (contains!1161 (toList!1099 lt!86383) (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))))))

(assert (= (and d!53197 res!82844) b!174773))

(assert (= (and b!174773 res!82843) b!174774))

(declare-fun m!203287 () Bool)

(assert (=> d!53197 m!203287))

(declare-fun m!203289 () Bool)

(assert (=> d!53197 m!203289))

(declare-fun m!203291 () Bool)

(assert (=> d!53197 m!203291))

(declare-fun m!203293 () Bool)

(assert (=> d!53197 m!203293))

(declare-fun m!203295 () Bool)

(assert (=> b!174773 m!203295))

(declare-fun m!203297 () Bool)

(assert (=> b!174774 m!203297))

(assert (=> b!174632 d!53197))

(declare-fun d!53199 () Bool)

(assert (=> d!53199 (= (apply!132 (+!244 lt!86293 (tuple2!3249 lt!86308 (minValue!3449 thiss!1248))) lt!86289) (apply!132 lt!86293 lt!86289))))

(declare-fun lt!86385 () Unit!5343)

(assert (=> d!53199 (= lt!86385 (choose!942 lt!86293 lt!86308 (minValue!3449 thiss!1248) lt!86289))))

(declare-fun e!115385 () Bool)

(assert (=> d!53199 e!115385))

(declare-fun res!82845 () Bool)

(assert (=> d!53199 (=> (not res!82845) (not e!115385))))

(assert (=> d!53199 (= res!82845 (contains!1160 lt!86293 lt!86289))))

(assert (=> d!53199 (= (addApplyDifferent!108 lt!86293 lt!86308 (minValue!3449 thiss!1248) lt!86289) lt!86385)))

(declare-fun b!174775 () Bool)

(assert (=> b!174775 (= e!115385 (not (= lt!86289 lt!86308)))))

(assert (= (and d!53199 res!82845) b!174775))

(declare-fun m!203299 () Bool)

(assert (=> d!53199 m!203299))

(declare-fun m!203301 () Bool)

(assert (=> d!53199 m!203301))

(assert (=> d!53199 m!203137))

(assert (=> d!53199 m!203143))

(assert (=> d!53199 m!203127))

(assert (=> d!53199 m!203137))

(assert (=> b!174632 d!53199))

(declare-fun d!53201 () Bool)

(declare-fun e!115387 () Bool)

(assert (=> d!53201 e!115387))

(declare-fun res!82846 () Bool)

(assert (=> d!53201 (=> res!82846 e!115387)))

(declare-fun lt!86388 () Bool)

(assert (=> d!53201 (= res!82846 (not lt!86388))))

(declare-fun lt!86386 () Bool)

(assert (=> d!53201 (= lt!86388 lt!86386)))

(declare-fun lt!86387 () Unit!5343)

(declare-fun e!115386 () Unit!5343)

(assert (=> d!53201 (= lt!86387 e!115386)))

(declare-fun c!31296 () Bool)

(assert (=> d!53201 (= c!31296 lt!86386)))

(assert (=> d!53201 (= lt!86386 (containsKey!189 (toList!1099 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))) lt!86310))))

(assert (=> d!53201 (= (contains!1160 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))) lt!86310) lt!86388)))

(declare-fun b!174776 () Bool)

(declare-fun lt!86389 () Unit!5343)

(assert (=> b!174776 (= e!115386 lt!86389)))

(assert (=> b!174776 (= lt!86389 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1099 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))) lt!86310))))

(assert (=> b!174776 (isDefined!139 (getValueByKey!185 (toList!1099 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))) lt!86310))))

(declare-fun b!174777 () Bool)

(declare-fun Unit!5348 () Unit!5343)

(assert (=> b!174777 (= e!115386 Unit!5348)))

(declare-fun b!174778 () Bool)

(assert (=> b!174778 (= e!115387 (isDefined!139 (getValueByKey!185 (toList!1099 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248)))) lt!86310)))))

(assert (= (and d!53201 c!31296) b!174776))

(assert (= (and d!53201 (not c!31296)) b!174777))

(assert (= (and d!53201 (not res!82846)) b!174778))

(declare-fun m!203303 () Bool)

(assert (=> d!53201 m!203303))

(declare-fun m!203305 () Bool)

(assert (=> b!174776 m!203305))

(declare-fun m!203307 () Bool)

(assert (=> b!174776 m!203307))

(assert (=> b!174776 m!203307))

(declare-fun m!203309 () Bool)

(assert (=> b!174776 m!203309))

(assert (=> b!174778 m!203307))

(assert (=> b!174778 m!203307))

(assert (=> b!174778 m!203309))

(assert (=> b!174632 d!53201))

(declare-fun d!53203 () Bool)

(assert (=> d!53203 (= (apply!132 (+!244 lt!86295 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))) lt!86296) (apply!132 lt!86295 lt!86296))))

(declare-fun lt!86390 () Unit!5343)

(assert (=> d!53203 (= lt!86390 (choose!942 lt!86295 lt!86301 (zeroValue!3449 thiss!1248) lt!86296))))

(declare-fun e!115388 () Bool)

(assert (=> d!53203 e!115388))

(declare-fun res!82847 () Bool)

(assert (=> d!53203 (=> (not res!82847) (not e!115388))))

(assert (=> d!53203 (= res!82847 (contains!1160 lt!86295 lt!86296))))

(assert (=> d!53203 (= (addApplyDifferent!108 lt!86295 lt!86301 (zeroValue!3449 thiss!1248) lt!86296) lt!86390)))

(declare-fun b!174779 () Bool)

(assert (=> b!174779 (= e!115388 (not (= lt!86296 lt!86301)))))

(assert (= (and d!53203 res!82847) b!174779))

(declare-fun m!203311 () Bool)

(assert (=> d!53203 m!203311))

(declare-fun m!203313 () Bool)

(assert (=> d!53203 m!203313))

(assert (=> d!53203 m!203129))

(assert (=> d!53203 m!203131))

(assert (=> d!53203 m!203121))

(assert (=> d!53203 m!203129))

(assert (=> b!174632 d!53203))

(declare-fun d!53205 () Bool)

(assert (=> d!53205 (= (apply!132 (+!244 lt!86295 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248))) lt!86296) (get!1972 (getValueByKey!185 (toList!1099 (+!244 lt!86295 (tuple2!3249 lt!86301 (zeroValue!3449 thiss!1248)))) lt!86296)))))

(declare-fun bs!7197 () Bool)

(assert (= bs!7197 d!53205))

(declare-fun m!203315 () Bool)

(assert (=> bs!7197 m!203315))

(assert (=> bs!7197 m!203315))

(declare-fun m!203317 () Bool)

(assert (=> bs!7197 m!203317))

(assert (=> b!174632 d!53205))

(declare-fun d!53207 () Bool)

(assert (=> d!53207 (contains!1160 (+!244 lt!86305 (tuple2!3249 lt!86292 (zeroValue!3449 thiss!1248))) lt!86310)))

(declare-fun lt!86393 () Unit!5343)

(declare-fun choose!943 (ListLongMap!2167 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5343)

(assert (=> d!53207 (= lt!86393 (choose!943 lt!86305 lt!86292 (zeroValue!3449 thiss!1248) lt!86310))))

(assert (=> d!53207 (contains!1160 lt!86305 lt!86310)))

(assert (=> d!53207 (= (addStillContains!108 lt!86305 lt!86292 (zeroValue!3449 thiss!1248) lt!86310) lt!86393)))

(declare-fun bs!7198 () Bool)

(assert (= bs!7198 d!53207))

(assert (=> bs!7198 m!203123))

(assert (=> bs!7198 m!203123))

(assert (=> bs!7198 m!203133))

(declare-fun m!203319 () Bool)

(assert (=> bs!7198 m!203319))

(declare-fun m!203321 () Bool)

(assert (=> bs!7198 m!203321))

(assert (=> b!174632 d!53207))

(declare-fun d!53209 () Bool)

(assert (=> d!53209 (= (apply!132 (+!244 lt!86309 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248))) lt!86290) (get!1972 (getValueByKey!185 (toList!1099 (+!244 lt!86309 (tuple2!3249 lt!86304 (minValue!3449 thiss!1248)))) lt!86290)))))

(declare-fun bs!7199 () Bool)

(assert (= bs!7199 d!53209))

(declare-fun m!203323 () Bool)

(assert (=> bs!7199 m!203323))

(assert (=> bs!7199 m!203323))

(declare-fun m!203325 () Bool)

(assert (=> bs!7199 m!203325))

(assert (=> b!174632 d!53209))

(declare-fun d!53211 () Bool)

(assert (=> d!53211 (= (apply!132 lt!86309 lt!86290) (get!1972 (getValueByKey!185 (toList!1099 lt!86309) lt!86290)))))

(declare-fun bs!7200 () Bool)

(assert (= bs!7200 d!53211))

(declare-fun m!203327 () Bool)

(assert (=> bs!7200 m!203327))

(assert (=> bs!7200 m!203327))

(declare-fun m!203329 () Bool)

(assert (=> bs!7200 m!203329))

(assert (=> b!174632 d!53211))

(declare-fun b!174789 () Bool)

(declare-fun res!82857 () Bool)

(declare-fun e!115391 () Bool)

(assert (=> b!174789 (=> (not res!82857) (not e!115391))))

(assert (=> b!174789 (= res!82857 (and (= (size!3768 (_values!3591 thiss!1248)) (bvadd (mask!8488 thiss!1248) #b00000000000000000000000000000001)) (= (size!3767 (_keys!5451 thiss!1248)) (size!3768 (_values!3591 thiss!1248))) (bvsge (_size!1206 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1206 thiss!1248) (bvadd (mask!8488 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53213 () Bool)

(declare-fun res!82859 () Bool)

(assert (=> d!53213 (=> (not res!82859) (not e!115391))))

(assert (=> d!53213 (= res!82859 (validMask!0 (mask!8488 thiss!1248)))))

(assert (=> d!53213 (= (simpleValid!146 thiss!1248) e!115391)))

(declare-fun b!174792 () Bool)

(assert (=> b!174792 (= e!115391 (and (bvsge (extraKeys!3345 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3345 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1206 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!174791 () Bool)

(declare-fun res!82858 () Bool)

(assert (=> b!174791 (=> (not res!82858) (not e!115391))))

(declare-fun size!3773 (LongMapFixedSize!2314) (_ BitVec 32))

(assert (=> b!174791 (= res!82858 (= (size!3773 thiss!1248) (bvadd (_size!1206 thiss!1248) (bvsdiv (bvadd (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!174790 () Bool)

(declare-fun res!82856 () Bool)

(assert (=> b!174790 (=> (not res!82856) (not e!115391))))

(assert (=> b!174790 (= res!82856 (bvsge (size!3773 thiss!1248) (_size!1206 thiss!1248)))))

(assert (= (and d!53213 res!82859) b!174789))

(assert (= (and b!174789 res!82857) b!174790))

(assert (= (and b!174790 res!82856) b!174791))

(assert (= (and b!174791 res!82858) b!174792))

(assert (=> d!53213 m!203033))

(declare-fun m!203331 () Bool)

(assert (=> b!174791 m!203331))

(assert (=> b!174790 m!203331))

(assert (=> d!53157 d!53213))

(declare-fun b!174801 () Bool)

(declare-fun e!115398 () Bool)

(declare-fun e!115399 () Bool)

(assert (=> b!174801 (= e!115398 e!115399)))

(declare-fun lt!86402 () (_ BitVec 64))

(assert (=> b!174801 (= lt!86402 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86401 () Unit!5343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7301 (_ BitVec 64) (_ BitVec 32)) Unit!5343)

(assert (=> b!174801 (= lt!86401 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5451 thiss!1248) lt!86402 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!174801 (arrayContainsKey!0 (_keys!5451 thiss!1248) lt!86402 #b00000000000000000000000000000000)))

(declare-fun lt!86400 () Unit!5343)

(assert (=> b!174801 (= lt!86400 lt!86401)))

(declare-fun res!82865 () Bool)

(assert (=> b!174801 (= res!82865 (= (seekEntryOrOpen!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000) (_keys!5451 thiss!1248) (mask!8488 thiss!1248)) (Found!557 #b00000000000000000000000000000000)))))

(assert (=> b!174801 (=> (not res!82865) (not e!115399))))

(declare-fun b!174802 () Bool)

(declare-fun call!17698 () Bool)

(assert (=> b!174802 (= e!115398 call!17698)))

(declare-fun d!53215 () Bool)

(declare-fun res!82864 () Bool)

(declare-fun e!115400 () Bool)

(assert (=> d!53215 (=> res!82864 e!115400)))

(assert (=> d!53215 (= res!82864 (bvsge #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> d!53215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)) e!115400)))

(declare-fun b!174803 () Bool)

(assert (=> b!174803 (= e!115400 e!115398)))

(declare-fun c!31299 () Bool)

(assert (=> b!174803 (= c!31299 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17695 () Bool)

(assert (=> bm!17695 (= call!17698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5451 thiss!1248) (mask!8488 thiss!1248)))))

(declare-fun b!174804 () Bool)

(assert (=> b!174804 (= e!115399 call!17698)))

(assert (= (and d!53215 (not res!82864)) b!174803))

(assert (= (and b!174803 c!31299) b!174801))

(assert (= (and b!174803 (not c!31299)) b!174802))

(assert (= (and b!174801 res!82865) b!174804))

(assert (= (or b!174804 b!174802) bm!17695))

(assert (=> b!174801 m!203101))

(declare-fun m!203333 () Bool)

(assert (=> b!174801 m!203333))

(declare-fun m!203335 () Bool)

(assert (=> b!174801 m!203335))

(assert (=> b!174801 m!203101))

(declare-fun m!203337 () Bool)

(assert (=> b!174801 m!203337))

(assert (=> b!174803 m!203101))

(assert (=> b!174803 m!203101))

(assert (=> b!174803 m!203117))

(declare-fun m!203339 () Bool)

(assert (=> bm!17695 m!203339))

(assert (=> b!174654 d!53215))

(declare-fun d!53217 () Bool)

(assert (=> d!53217 (= (apply!132 lt!86300 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)) (get!1972 (getValueByKey!185 (toList!1099 lt!86300) (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7201 () Bool)

(assert (= bs!7201 d!53217))

(assert (=> bs!7201 m!203101))

(assert (=> bs!7201 m!203229))

(assert (=> bs!7201 m!203229))

(declare-fun m!203341 () Bool)

(assert (=> bs!7201 m!203341))

(assert (=> b!174634 d!53217))

(declare-fun d!53219 () Bool)

(declare-fun c!31302 () Bool)

(assert (=> d!53219 (= c!31302 ((_ is ValueCellFull!1703) (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115403 () V!5105)

(assert (=> d!53219 (= (get!1971 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115403)))

(declare-fun b!174809 () Bool)

(declare-fun get!1973 (ValueCell!1703 V!5105) V!5105)

(assert (=> b!174809 (= e!115403 (get!1973 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174810 () Bool)

(declare-fun get!1974 (ValueCell!1703 V!5105) V!5105)

(assert (=> b!174810 (= e!115403 (get!1974 (select (arr!3467 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!466 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53219 c!31302) b!174809))

(assert (= (and d!53219 (not c!31302)) b!174810))

(assert (=> b!174809 m!203151))

(assert (=> b!174809 m!203153))

(declare-fun m!203343 () Bool)

(assert (=> b!174809 m!203343))

(assert (=> b!174810 m!203151))

(assert (=> b!174810 m!203153))

(declare-fun m!203345 () Bool)

(assert (=> b!174810 m!203345))

(assert (=> b!174634 d!53219))

(declare-fun d!53221 () Bool)

(declare-fun e!115404 () Bool)

(assert (=> d!53221 e!115404))

(declare-fun res!82867 () Bool)

(assert (=> d!53221 (=> (not res!82867) (not e!115404))))

(declare-fun lt!86405 () ListLongMap!2167)

(assert (=> d!53221 (= res!82867 (contains!1160 lt!86405 (_1!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(declare-fun lt!86404 () List!2222)

(assert (=> d!53221 (= lt!86405 (ListLongMap!2168 lt!86404))))

(declare-fun lt!86406 () Unit!5343)

(declare-fun lt!86403 () Unit!5343)

(assert (=> d!53221 (= lt!86406 lt!86403)))

(assert (=> d!53221 (= (getValueByKey!185 lt!86404 (_1!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))) (Some!190 (_2!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(assert (=> d!53221 (= lt!86403 (lemmaContainsTupThenGetReturnValue!100 lt!86404 (_1!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (_2!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(assert (=> d!53221 (= lt!86404 (insertStrictlySorted!103 (toList!1099 (ite c!31261 call!17685 (ite c!31256 call!17687 call!17683))) (_1!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (_2!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(assert (=> d!53221 (= (+!244 (ite c!31261 call!17685 (ite c!31256 call!17687 call!17683)) (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) lt!86405)))

(declare-fun b!174811 () Bool)

(declare-fun res!82866 () Bool)

(assert (=> b!174811 (=> (not res!82866) (not e!115404))))

(assert (=> b!174811 (= res!82866 (= (getValueByKey!185 (toList!1099 lt!86405) (_1!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))) (Some!190 (_2!1635 (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))))

(declare-fun b!174812 () Bool)

(assert (=> b!174812 (= e!115404 (contains!1161 (toList!1099 lt!86405) (ite (or c!31261 c!31256) (tuple2!3249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(assert (= (and d!53221 res!82867) b!174811))

(assert (= (and b!174811 res!82866) b!174812))

(declare-fun m!203347 () Bool)

(assert (=> d!53221 m!203347))

(declare-fun m!203349 () Bool)

(assert (=> d!53221 m!203349))

(declare-fun m!203351 () Bool)

(assert (=> d!53221 m!203351))

(declare-fun m!203353 () Bool)

(assert (=> d!53221 m!203353))

(declare-fun m!203355 () Bool)

(assert (=> b!174811 m!203355))

(declare-fun m!203357 () Bool)

(assert (=> b!174812 m!203357))

(assert (=> bm!17685 d!53221))

(declare-fun d!53223 () Bool)

(declare-fun e!115406 () Bool)

(assert (=> d!53223 e!115406))

(declare-fun res!82868 () Bool)

(assert (=> d!53223 (=> res!82868 e!115406)))

(declare-fun lt!86409 () Bool)

(assert (=> d!53223 (= res!82868 (not lt!86409))))

(declare-fun lt!86407 () Bool)

(assert (=> d!53223 (= lt!86409 lt!86407)))

(declare-fun lt!86408 () Unit!5343)

(declare-fun e!115405 () Unit!5343)

(assert (=> d!53223 (= lt!86408 e!115405)))

(declare-fun c!31303 () Bool)

(assert (=> d!53223 (= c!31303 lt!86407)))

(assert (=> d!53223 (= lt!86407 (containsKey!189 (toList!1099 lt!86300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53223 (= (contains!1160 lt!86300 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86409)))

(declare-fun b!174813 () Bool)

(declare-fun lt!86410 () Unit!5343)

(assert (=> b!174813 (= e!115405 lt!86410)))

(assert (=> b!174813 (= lt!86410 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1099 lt!86300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174813 (isDefined!139 (getValueByKey!185 (toList!1099 lt!86300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174814 () Bool)

(declare-fun Unit!5349 () Unit!5343)

(assert (=> b!174814 (= e!115405 Unit!5349)))

(declare-fun b!174815 () Bool)

(assert (=> b!174815 (= e!115406 (isDefined!139 (getValueByKey!185 (toList!1099 lt!86300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53223 c!31303) b!174813))

(assert (= (and d!53223 (not c!31303)) b!174814))

(assert (= (and d!53223 (not res!82868)) b!174815))

(declare-fun m!203359 () Bool)

(assert (=> d!53223 m!203359))

(declare-fun m!203361 () Bool)

(assert (=> b!174813 m!203361))

(assert (=> b!174813 m!203221))

(assert (=> b!174813 m!203221))

(declare-fun m!203363 () Bool)

(assert (=> b!174813 m!203363))

(assert (=> b!174815 m!203221))

(assert (=> b!174815 m!203221))

(assert (=> b!174815 m!203363))

(assert (=> bm!17680 d!53223))

(declare-fun d!53225 () Bool)

(declare-fun e!115408 () Bool)

(assert (=> d!53225 e!115408))

(declare-fun res!82869 () Bool)

(assert (=> d!53225 (=> res!82869 e!115408)))

(declare-fun lt!86413 () Bool)

(assert (=> d!53225 (= res!82869 (not lt!86413))))

(declare-fun lt!86411 () Bool)

(assert (=> d!53225 (= lt!86413 lt!86411)))

(declare-fun lt!86412 () Unit!5343)

(declare-fun e!115407 () Unit!5343)

(assert (=> d!53225 (= lt!86412 e!115407)))

(declare-fun c!31304 () Bool)

(assert (=> d!53225 (= c!31304 lt!86411)))

(assert (=> d!53225 (= lt!86411 (containsKey!189 (toList!1099 lt!86300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53225 (= (contains!1160 lt!86300 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86413)))

(declare-fun b!174816 () Bool)

(declare-fun lt!86414 () Unit!5343)

(assert (=> b!174816 (= e!115407 lt!86414)))

(assert (=> b!174816 (= lt!86414 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1099 lt!86300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174816 (isDefined!139 (getValueByKey!185 (toList!1099 lt!86300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174817 () Bool)

(declare-fun Unit!5350 () Unit!5343)

(assert (=> b!174817 (= e!115407 Unit!5350)))

(declare-fun b!174818 () Bool)

(assert (=> b!174818 (= e!115408 (isDefined!139 (getValueByKey!185 (toList!1099 lt!86300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53225 c!31304) b!174816))

(assert (= (and d!53225 (not c!31304)) b!174817))

(assert (= (and d!53225 (not res!82869)) b!174818))

(declare-fun m!203365 () Bool)

(assert (=> d!53225 m!203365))

(declare-fun m!203367 () Bool)

(assert (=> b!174816 m!203367))

(assert (=> b!174816 m!203217))

(assert (=> b!174816 m!203217))

(declare-fun m!203369 () Bool)

(assert (=> b!174816 m!203369))

(assert (=> b!174818 m!203217))

(assert (=> b!174818 m!203217))

(assert (=> b!174818 m!203369))

(assert (=> bm!17681 d!53225))

(declare-fun d!53227 () Bool)

(declare-fun res!82874 () Bool)

(declare-fun e!115413 () Bool)

(assert (=> d!53227 (=> res!82874 e!115413)))

(assert (=> d!53227 (= res!82874 (and ((_ is Cons!2218) (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (= (_1!1635 (h!2835 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)))))

(assert (=> d!53227 (= (containsKey!189 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828) e!115413)))

(declare-fun b!174823 () Bool)

(declare-fun e!115414 () Bool)

(assert (=> b!174823 (= e!115413 e!115414)))

(declare-fun res!82875 () Bool)

(assert (=> b!174823 (=> (not res!82875) (not e!115414))))

(assert (=> b!174823 (= res!82875 (and (or (not ((_ is Cons!2218) (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) (bvsle (_1!1635 (h!2835 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)) ((_ is Cons!2218) (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (bvslt (_1!1635 (h!2835 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)))))

(declare-fun b!174824 () Bool)

(assert (=> b!174824 (= e!115414 (containsKey!189 (t!7027 (toList!1099 (getCurrentListMap!735 (_keys!5451 thiss!1248) (_values!3591 thiss!1248) (mask!8488 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) key!828))))

(assert (= (and d!53227 (not res!82874)) b!174823))

(assert (= (and b!174823 res!82875) b!174824))

(declare-fun m!203371 () Bool)

(assert (=> b!174824 m!203371))

(assert (=> d!53147 d!53227))

(declare-fun bm!17698 () Bool)

(declare-fun call!17701 () Bool)

(declare-fun c!31307 () Bool)

(assert (=> bm!17698 (= call!17701 (arrayNoDuplicates!0 (_keys!5451 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31307 (Cons!2219 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000) Nil!2220) Nil!2220)))))

(declare-fun b!174836 () Bool)

(declare-fun e!115424 () Bool)

(assert (=> b!174836 (= e!115424 call!17701)))

(declare-fun b!174837 () Bool)

(declare-fun e!115425 () Bool)

(assert (=> b!174837 (= e!115425 e!115424)))

(assert (=> b!174837 (= c!31307 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174838 () Bool)

(declare-fun e!115426 () Bool)

(assert (=> b!174838 (= e!115426 e!115425)))

(declare-fun res!82882 () Bool)

(assert (=> b!174838 (=> (not res!82882) (not e!115425))))

(declare-fun e!115423 () Bool)

(assert (=> b!174838 (= res!82882 (not e!115423))))

(declare-fun res!82884 () Bool)

(assert (=> b!174838 (=> (not res!82884) (not e!115423))))

(assert (=> b!174838 (= res!82884 (validKeyInArray!0 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174839 () Bool)

(assert (=> b!174839 (= e!115424 call!17701)))

(declare-fun b!174835 () Bool)

(declare-fun contains!1162 (List!2223 (_ BitVec 64)) Bool)

(assert (=> b!174835 (= e!115423 (contains!1162 Nil!2220 (select (arr!3466 (_keys!5451 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53229 () Bool)

(declare-fun res!82883 () Bool)

(assert (=> d!53229 (=> res!82883 e!115426)))

(assert (=> d!53229 (= res!82883 (bvsge #b00000000000000000000000000000000 (size!3767 (_keys!5451 thiss!1248))))))

(assert (=> d!53229 (= (arrayNoDuplicates!0 (_keys!5451 thiss!1248) #b00000000000000000000000000000000 Nil!2220) e!115426)))

(assert (= (and d!53229 (not res!82883)) b!174838))

(assert (= (and b!174838 res!82884) b!174835))

(assert (= (and b!174838 res!82882) b!174837))

(assert (= (and b!174837 c!31307) b!174839))

(assert (= (and b!174837 (not c!31307)) b!174836))

(assert (= (or b!174839 b!174836) bm!17698))

(assert (=> bm!17698 m!203101))

(declare-fun m!203373 () Bool)

(assert (=> bm!17698 m!203373))

(assert (=> b!174837 m!203101))

(assert (=> b!174837 m!203101))

(assert (=> b!174837 m!203117))

(assert (=> b!174838 m!203101))

(assert (=> b!174838 m!203101))

(assert (=> b!174838 m!203117))

(assert (=> b!174835 m!203101))

(assert (=> b!174835 m!203101))

(declare-fun m!203375 () Bool)

(assert (=> b!174835 m!203375))

(assert (=> b!174655 d!53229))

(declare-fun b!174852 () Bool)

(declare-fun c!31315 () Bool)

(declare-fun lt!86419 () (_ BitVec 64))

(assert (=> b!174852 (= c!31315 (= lt!86419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115433 () SeekEntryResult!557)

(declare-fun e!115435 () SeekEntryResult!557)

(assert (=> b!174852 (= e!115433 e!115435)))

(declare-fun b!174853 () Bool)

(assert (=> b!174853 (= e!115435 (MissingVacant!557 (index!4398 lt!86232)))))

(declare-fun b!174854 () Bool)

(assert (=> b!174854 (= e!115433 (Found!557 (index!4398 lt!86232)))))

(declare-fun b!174856 () Bool)

(assert (=> b!174856 (= e!115435 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19244 lt!86232) #b00000000000000000000000000000001) (nextIndex!0 (index!4398 lt!86232) (x!19244 lt!86232) (mask!8488 thiss!1248)) (index!4398 lt!86232) key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)))))

(declare-fun b!174857 () Bool)

(declare-fun e!115434 () SeekEntryResult!557)

(assert (=> b!174857 (= e!115434 Undefined!557)))

(declare-fun lt!86420 () SeekEntryResult!557)

(declare-fun d!53231 () Bool)

(assert (=> d!53231 (and (or ((_ is Undefined!557) lt!86420) (not ((_ is Found!557) lt!86420)) (and (bvsge (index!4397 lt!86420) #b00000000000000000000000000000000) (bvslt (index!4397 lt!86420) (size!3767 (_keys!5451 thiss!1248))))) (or ((_ is Undefined!557) lt!86420) ((_ is Found!557) lt!86420) (not ((_ is MissingVacant!557) lt!86420)) (not (= (index!4399 lt!86420) (index!4398 lt!86232))) (and (bvsge (index!4399 lt!86420) #b00000000000000000000000000000000) (bvslt (index!4399 lt!86420) (size!3767 (_keys!5451 thiss!1248))))) (or ((_ is Undefined!557) lt!86420) (ite ((_ is Found!557) lt!86420) (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4397 lt!86420)) key!828) (and ((_ is MissingVacant!557) lt!86420) (= (index!4399 lt!86420) (index!4398 lt!86232)) (= (select (arr!3466 (_keys!5451 thiss!1248)) (index!4399 lt!86420)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53231 (= lt!86420 e!115434)))

(declare-fun c!31314 () Bool)

(assert (=> d!53231 (= c!31314 (bvsge (x!19244 lt!86232) #b01111111111111111111111111111110))))

(assert (=> d!53231 (= lt!86419 (select (arr!3466 (_keys!5451 thiss!1248)) (index!4398 lt!86232)))))

(assert (=> d!53231 (validMask!0 (mask!8488 thiss!1248))))

(assert (=> d!53231 (= (seekKeyOrZeroReturnVacant!0 (x!19244 lt!86232) (index!4398 lt!86232) (index!4398 lt!86232) key!828 (_keys!5451 thiss!1248) (mask!8488 thiss!1248)) lt!86420)))

(declare-fun b!174855 () Bool)

(assert (=> b!174855 (= e!115434 e!115433)))

(declare-fun c!31316 () Bool)

(assert (=> b!174855 (= c!31316 (= lt!86419 key!828))))

(assert (= (and d!53231 c!31314) b!174857))

(assert (= (and d!53231 (not c!31314)) b!174855))

(assert (= (and b!174855 c!31316) b!174854))

(assert (= (and b!174855 (not c!31316)) b!174852))

(assert (= (and b!174852 c!31315) b!174853))

(assert (= (and b!174852 (not c!31315)) b!174856))

(declare-fun m!203377 () Bool)

(assert (=> b!174856 m!203377))

(assert (=> b!174856 m!203377))

(declare-fun m!203379 () Bool)

(assert (=> b!174856 m!203379))

(declare-fun m!203381 () Bool)

(assert (=> d!53231 m!203381))

(declare-fun m!203383 () Bool)

(assert (=> d!53231 m!203383))

(assert (=> d!53231 m!203091))

(assert (=> d!53231 m!203033))

(assert (=> b!174567 d!53231))

(declare-fun mapNonEmpty!6984 () Bool)

(declare-fun mapRes!6984 () Bool)

(declare-fun tp!15651 () Bool)

(declare-fun e!115437 () Bool)

(assert (=> mapNonEmpty!6984 (= mapRes!6984 (and tp!15651 e!115437))))

(declare-fun mapKey!6984 () (_ BitVec 32))

(declare-fun mapRest!6984 () (Array (_ BitVec 32) ValueCell!1703))

(declare-fun mapValue!6984 () ValueCell!1703)

(assert (=> mapNonEmpty!6984 (= mapRest!6983 (store mapRest!6984 mapKey!6984 mapValue!6984))))

(declare-fun b!174858 () Bool)

(assert (=> b!174858 (= e!115437 tp_is_empty!4093)))

(declare-fun condMapEmpty!6984 () Bool)

(declare-fun mapDefault!6984 () ValueCell!1703)

(assert (=> mapNonEmpty!6983 (= condMapEmpty!6984 (= mapRest!6983 ((as const (Array (_ BitVec 32) ValueCell!1703)) mapDefault!6984)))))

(declare-fun e!115436 () Bool)

(assert (=> mapNonEmpty!6983 (= tp!15650 (and e!115436 mapRes!6984))))

(declare-fun mapIsEmpty!6984 () Bool)

(assert (=> mapIsEmpty!6984 mapRes!6984))

(declare-fun b!174859 () Bool)

(assert (=> b!174859 (= e!115436 tp_is_empty!4093)))

(assert (= (and mapNonEmpty!6983 condMapEmpty!6984) mapIsEmpty!6984))

(assert (= (and mapNonEmpty!6983 (not condMapEmpty!6984)) mapNonEmpty!6984))

(assert (= (and mapNonEmpty!6984 ((_ is ValueCellFull!1703) mapValue!6984)) b!174858))

(assert (= (and mapNonEmpty!6983 ((_ is ValueCellFull!1703) mapDefault!6984)) b!174859))

(declare-fun m!203385 () Bool)

(assert (=> mapNonEmpty!6984 m!203385))

(declare-fun b_lambda!6977 () Bool)

(assert (= b_lambda!6973 (or (and b!174493 b_free!4321) b_lambda!6977)))

(declare-fun b_lambda!6979 () Bool)

(assert (= b_lambda!6975 (or (and b!174493 b_free!4321) b_lambda!6979)))

(check-sat (not d!53165) (not b!174715) (not d!53163) (not b!174746) (not d!53231) (not b!174668) (not d!53207) (not b!174767) (not b!174815) (not d!53203) (not b!174801) (not d!53221) (not b!174761) (not b!174720) (not d!53179) (not b!174717) (not b!174856) (not bm!17698) (not d!53209) (not b!174750) (not b!174803) b_and!10773 (not b!174778) (not b!174714) (not b_lambda!6977) (not d!53213) (not b!174811) (not b!174838) (not d!53199) (not b!174790) (not d!53177) (not b!174669) (not b!174791) (not b!174683) (not b!174748) (not b!174774) (not b!174812) (not b!174710) (not b!174672) (not bm!17689) (not d!53189) (not b_next!4321) (not b!174776) (not d!53193) (not d!53205) (not b!174770) (not d!53211) (not b!174824) (not d!53187) (not b!174810) (not b!174772) (not b!174835) (not mapNonEmpty!6984) (not b!174837) (not b!174816) (not d!53225) (not b!174719) (not b!174771) (not b!174769) (not b!174768) (not bm!17695) (not b!174773) (not d!53191) (not d!53185) (not b!174809) (not d!53183) (not d!53195) (not d!53159) tp_is_empty!4093 (not b_lambda!6979) (not d!53169) (not bm!17692) (not d!53171) (not b!174813) (not b_lambda!6971) (not b!174716) (not d!53201) (not b!174818) (not d!53175) (not d!53197) (not d!53217) (not b!174718) (not d!53223))
(check-sat b_and!10773 (not b_next!4321))
