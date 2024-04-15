; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17648 () Bool)

(assert start!17648)

(declare-fun b!176235 () Bool)

(declare-fun b_free!4351 () Bool)

(declare-fun b_next!4351 () Bool)

(assert (=> b!176235 (= b_free!4351 (not b_next!4351))))

(declare-fun tp!15743 () Bool)

(declare-fun b_and!10819 () Bool)

(assert (=> b!176235 (= tp!15743 b_and!10819)))

(declare-fun b!176228 () Bool)

(declare-fun res!83483 () Bool)

(declare-fun e!116269 () Bool)

(assert (=> b!176228 (=> (not res!83483) (not e!116269))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176228 (= res!83483 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176229 () Bool)

(declare-fun res!83484 () Bool)

(assert (=> b!176229 (=> (not res!83484) (not e!116269))))

(declare-datatypes ((V!5145 0))(
  ( (V!5146 (val!2106 Int)) )
))
(declare-datatypes ((ValueCell!1718 0))(
  ( (ValueCellFull!1718 (v!3977 V!5145)) (EmptyCell!1718) )
))
(declare-datatypes ((array!7371 0))(
  ( (array!7372 (arr!3496 (Array (_ BitVec 32) (_ BitVec 64))) (size!3801 (_ BitVec 32))) )
))
(declare-datatypes ((array!7373 0))(
  ( (array!7374 (arr!3497 (Array (_ BitVec 32) ValueCell!1718)) (size!3802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2344 0))(
  ( (LongMapFixedSize!2345 (defaultEntry!3632 Int) (mask!8548 (_ BitVec 32)) (extraKeys!3369 (_ BitVec 32)) (zeroValue!3473 V!5145) (minValue!3473 V!5145) (_size!1221 (_ BitVec 32)) (_keys!5492 array!7371) (_values!3615 array!7373) (_vacant!1221 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2344)

(get-info :version)

(declare-datatypes ((SeekEntryResult!567 0))(
  ( (MissingZero!567 (index!4436 (_ BitVec 32))) (Found!567 (index!4437 (_ BitVec 32))) (Intermediate!567 (undefined!1379 Bool) (index!4438 (_ BitVec 32)) (x!19376 (_ BitVec 32))) (Undefined!567) (MissingVacant!567 (index!4439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7371 (_ BitVec 32)) SeekEntryResult!567)

(assert (=> b!176229 (= res!83484 ((_ is Undefined!567) (seekEntryOrOpen!0 key!828 (_keys!5492 thiss!1248) (mask!8548 thiss!1248))))))

(declare-fun b!176230 () Bool)

(declare-fun res!83482 () Bool)

(assert (=> b!176230 (=> (not res!83482) (not e!116269))))

(declare-datatypes ((tuple2!3270 0))(
  ( (tuple2!3271 (_1!1646 (_ BitVec 64)) (_2!1646 V!5145)) )
))
(declare-datatypes ((List!2238 0))(
  ( (Nil!2235) (Cons!2234 (h!2855 tuple2!3270) (t!7053 List!2238)) )
))
(declare-datatypes ((ListLongMap!2189 0))(
  ( (ListLongMap!2190 (toList!1110 List!2238)) )
))
(declare-fun contains!1179 (ListLongMap!2189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!746 (array!7371 array!7373 (_ BitVec 32) (_ BitVec 32) V!5145 V!5145 (_ BitVec 32) Int) ListLongMap!2189)

(assert (=> b!176230 (= res!83482 (contains!1179 (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) key!828))))

(declare-fun b!176231 () Bool)

(declare-fun res!83485 () Bool)

(assert (=> b!176231 (=> (not res!83485) (not e!116269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176231 (= res!83485 (validMask!0 (mask!8548 thiss!1248)))))

(declare-fun b!176232 () Bool)

(declare-fun e!116266 () Bool)

(declare-fun tp_is_empty!4123 () Bool)

(assert (=> b!176232 (= e!116266 tp_is_empty!4123)))

(declare-fun b!176233 () Bool)

(declare-fun e!116271 () Bool)

(declare-fun mapRes!7038 () Bool)

(assert (=> b!176233 (= e!116271 (and e!116266 mapRes!7038))))

(declare-fun condMapEmpty!7038 () Bool)

(declare-fun mapDefault!7038 () ValueCell!1718)

(assert (=> b!176233 (= condMapEmpty!7038 (= (arr!3497 (_values!3615 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1718)) mapDefault!7038)))))

(declare-fun b!176234 () Bool)

(declare-fun e!116268 () Bool)

(assert (=> b!176234 (= e!116268 tp_is_empty!4123)))

(declare-fun mapIsEmpty!7038 () Bool)

(assert (=> mapIsEmpty!7038 mapRes!7038))

(declare-fun e!116267 () Bool)

(declare-fun array_inv!2257 (array!7371) Bool)

(declare-fun array_inv!2258 (array!7373) Bool)

(assert (=> b!176235 (= e!116267 (and tp!15743 tp_is_empty!4123 (array_inv!2257 (_keys!5492 thiss!1248)) (array_inv!2258 (_values!3615 thiss!1248)) e!116271))))

(declare-fun b!176236 () Bool)

(declare-fun res!83487 () Bool)

(assert (=> b!176236 (=> (not res!83487) (not e!116269))))

(assert (=> b!176236 (= res!83487 (and (= (size!3802 (_values!3615 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8548 thiss!1248))) (= (size!3801 (_keys!5492 thiss!1248)) (size!3802 (_values!3615 thiss!1248))) (bvsge (mask!8548 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3369 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3369 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176237 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7371 (_ BitVec 32)) Bool)

(assert (=> b!176237 (= e!116269 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5492 thiss!1248) (mask!8548 thiss!1248))))))

(declare-fun res!83486 () Bool)

(assert (=> start!17648 (=> (not res!83486) (not e!116269))))

(declare-fun valid!1005 (LongMapFixedSize!2344) Bool)

(assert (=> start!17648 (= res!83486 (valid!1005 thiss!1248))))

(assert (=> start!17648 e!116269))

(assert (=> start!17648 e!116267))

(assert (=> start!17648 true))

(declare-fun mapNonEmpty!7038 () Bool)

(declare-fun tp!15744 () Bool)

(assert (=> mapNonEmpty!7038 (= mapRes!7038 (and tp!15744 e!116268))))

(declare-fun mapValue!7038 () ValueCell!1718)

(declare-fun mapRest!7038 () (Array (_ BitVec 32) ValueCell!1718))

(declare-fun mapKey!7038 () (_ BitVec 32))

(assert (=> mapNonEmpty!7038 (= (arr!3497 (_values!3615 thiss!1248)) (store mapRest!7038 mapKey!7038 mapValue!7038))))

(assert (= (and start!17648 res!83486) b!176228))

(assert (= (and b!176228 res!83483) b!176229))

(assert (= (and b!176229 res!83484) b!176230))

(assert (= (and b!176230 res!83482) b!176231))

(assert (= (and b!176231 res!83485) b!176236))

(assert (= (and b!176236 res!83487) b!176237))

(assert (= (and b!176233 condMapEmpty!7038) mapIsEmpty!7038))

(assert (= (and b!176233 (not condMapEmpty!7038)) mapNonEmpty!7038))

(assert (= (and mapNonEmpty!7038 ((_ is ValueCellFull!1718) mapValue!7038)) b!176234))

(assert (= (and b!176233 ((_ is ValueCellFull!1718) mapDefault!7038)) b!176232))

(assert (= b!176235 b!176233))

(assert (= start!17648 b!176235))

(declare-fun m!204593 () Bool)

(assert (=> b!176231 m!204593))

(declare-fun m!204595 () Bool)

(assert (=> b!176229 m!204595))

(declare-fun m!204597 () Bool)

(assert (=> start!17648 m!204597))

(declare-fun m!204599 () Bool)

(assert (=> b!176230 m!204599))

(assert (=> b!176230 m!204599))

(declare-fun m!204601 () Bool)

(assert (=> b!176230 m!204601))

(declare-fun m!204603 () Bool)

(assert (=> b!176235 m!204603))

(declare-fun m!204605 () Bool)

(assert (=> b!176235 m!204605))

(declare-fun m!204607 () Bool)

(assert (=> b!176237 m!204607))

(declare-fun m!204609 () Bool)

(assert (=> mapNonEmpty!7038 m!204609))

(check-sat (not start!17648) (not b!176231) (not mapNonEmpty!7038) (not b!176235) (not b!176230) (not b_next!4351) tp_is_empty!4123 (not b!176229) b_and!10819 (not b!176237))
(check-sat b_and!10819 (not b_next!4351))
(get-model)

(declare-fun d!53521 () Bool)

(declare-fun e!116312 () Bool)

(assert (=> d!53521 e!116312))

(declare-fun res!83526 () Bool)

(assert (=> d!53521 (=> res!83526 e!116312)))

(declare-fun lt!87109 () Bool)

(assert (=> d!53521 (= res!83526 (not lt!87109))))

(declare-fun lt!87107 () Bool)

(assert (=> d!53521 (= lt!87109 lt!87107)))

(declare-datatypes ((Unit!5379 0))(
  ( (Unit!5380) )
))
(declare-fun lt!87108 () Unit!5379)

(declare-fun e!116313 () Unit!5379)

(assert (=> d!53521 (= lt!87108 e!116313)))

(declare-fun c!31604 () Bool)

(assert (=> d!53521 (= c!31604 lt!87107)))

(declare-fun containsKey!194 (List!2238 (_ BitVec 64)) Bool)

(assert (=> d!53521 (= lt!87107 (containsKey!194 (toList!1110 (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828))))

(assert (=> d!53521 (= (contains!1179 (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) key!828) lt!87109)))

(declare-fun b!176304 () Bool)

(declare-fun lt!87110 () Unit!5379)

(assert (=> b!176304 (= e!116313 lt!87110)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!143 (List!2238 (_ BitVec 64)) Unit!5379)

(assert (=> b!176304 (= lt!87110 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1110 (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828))))

(declare-datatypes ((Option!196 0))(
  ( (Some!195 (v!3980 V!5145)) (None!194) )
))
(declare-fun isDefined!144 (Option!196) Bool)

(declare-fun getValueByKey!190 (List!2238 (_ BitVec 64)) Option!196)

(assert (=> b!176304 (isDefined!144 (getValueByKey!190 (toList!1110 (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828))))

(declare-fun b!176305 () Bool)

(declare-fun Unit!5381 () Unit!5379)

(assert (=> b!176305 (= e!116313 Unit!5381)))

(declare-fun b!176306 () Bool)

(assert (=> b!176306 (= e!116312 (isDefined!144 (getValueByKey!190 (toList!1110 (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828)))))

(assert (= (and d!53521 c!31604) b!176304))

(assert (= (and d!53521 (not c!31604)) b!176305))

(assert (= (and d!53521 (not res!83526)) b!176306))

(declare-fun m!204647 () Bool)

(assert (=> d!53521 m!204647))

(declare-fun m!204649 () Bool)

(assert (=> b!176304 m!204649))

(declare-fun m!204651 () Bool)

(assert (=> b!176304 m!204651))

(assert (=> b!176304 m!204651))

(declare-fun m!204653 () Bool)

(assert (=> b!176304 m!204653))

(assert (=> b!176306 m!204651))

(assert (=> b!176306 m!204651))

(assert (=> b!176306 m!204653))

(assert (=> b!176230 d!53521))

(declare-fun c!31621 () Bool)

(declare-fun call!17837 () ListLongMap!2189)

(declare-fun call!17840 () ListLongMap!2189)

(declare-fun c!31617 () Bool)

(declare-fun call!17836 () ListLongMap!2189)

(declare-fun bm!17833 () Bool)

(declare-fun call!17842 () ListLongMap!2189)

(declare-fun +!249 (ListLongMap!2189 tuple2!3270) ListLongMap!2189)

(assert (=> bm!17833 (= call!17842 (+!249 (ite c!31621 call!17840 (ite c!31617 call!17836 call!17837)) (ite (or c!31621 c!31617) (tuple2!3271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3473 thiss!1248)) (tuple2!3271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3473 thiss!1248)))))))

(declare-fun bm!17834 () Bool)

(declare-fun call!17838 () ListLongMap!2189)

(assert (=> bm!17834 (= call!17838 call!17842)))

(declare-fun b!176349 () Bool)

(declare-fun e!116351 () Bool)

(declare-fun lt!87173 () ListLongMap!2189)

(declare-fun apply!137 (ListLongMap!2189 (_ BitVec 64)) V!5145)

(declare-fun get!1998 (ValueCell!1718 V!5145) V!5145)

(declare-fun dynLambda!471 (Int (_ BitVec 64)) V!5145)

(assert (=> b!176349 (= e!116351 (= (apply!137 lt!87173 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000)) (get!1998 (select (arr!3497 (_values!3615 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3632 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3802 (_values!3615 thiss!1248))))))

(assert (=> b!176349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))))))

(declare-fun b!176350 () Bool)

(declare-fun e!116346 () Bool)

(declare-fun e!116342 () Bool)

(assert (=> b!176350 (= e!116346 e!116342)))

(declare-fun res!83550 () Bool)

(declare-fun call!17839 () Bool)

(assert (=> b!176350 (= res!83550 call!17839)))

(assert (=> b!176350 (=> (not res!83550) (not e!116342))))

(declare-fun b!176351 () Bool)

(declare-fun e!116348 () Unit!5379)

(declare-fun lt!87157 () Unit!5379)

(assert (=> b!176351 (= e!116348 lt!87157)))

(declare-fun lt!87161 () ListLongMap!2189)

(declare-fun getCurrentListMapNoExtraKeys!158 (array!7371 array!7373 (_ BitVec 32) (_ BitVec 32) V!5145 V!5145 (_ BitVec 32) Int) ListLongMap!2189)

(assert (=> b!176351 (= lt!87161 (getCurrentListMapNoExtraKeys!158 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87163 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87172 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87172 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87162 () Unit!5379)

(declare-fun addStillContains!113 (ListLongMap!2189 (_ BitVec 64) V!5145 (_ BitVec 64)) Unit!5379)

(assert (=> b!176351 (= lt!87162 (addStillContains!113 lt!87161 lt!87163 (zeroValue!3473 thiss!1248) lt!87172))))

(assert (=> b!176351 (contains!1179 (+!249 lt!87161 (tuple2!3271 lt!87163 (zeroValue!3473 thiss!1248))) lt!87172)))

(declare-fun lt!87168 () Unit!5379)

(assert (=> b!176351 (= lt!87168 lt!87162)))

(declare-fun lt!87166 () ListLongMap!2189)

(assert (=> b!176351 (= lt!87166 (getCurrentListMapNoExtraKeys!158 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87160 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87160 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87164 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87164 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87158 () Unit!5379)

(declare-fun addApplyDifferent!113 (ListLongMap!2189 (_ BitVec 64) V!5145 (_ BitVec 64)) Unit!5379)

(assert (=> b!176351 (= lt!87158 (addApplyDifferent!113 lt!87166 lt!87160 (minValue!3473 thiss!1248) lt!87164))))

(assert (=> b!176351 (= (apply!137 (+!249 lt!87166 (tuple2!3271 lt!87160 (minValue!3473 thiss!1248))) lt!87164) (apply!137 lt!87166 lt!87164))))

(declare-fun lt!87174 () Unit!5379)

(assert (=> b!176351 (= lt!87174 lt!87158)))

(declare-fun lt!87169 () ListLongMap!2189)

(assert (=> b!176351 (= lt!87169 (getCurrentListMapNoExtraKeys!158 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87170 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87159 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87159 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87156 () Unit!5379)

(assert (=> b!176351 (= lt!87156 (addApplyDifferent!113 lt!87169 lt!87170 (zeroValue!3473 thiss!1248) lt!87159))))

(assert (=> b!176351 (= (apply!137 (+!249 lt!87169 (tuple2!3271 lt!87170 (zeroValue!3473 thiss!1248))) lt!87159) (apply!137 lt!87169 lt!87159))))

(declare-fun lt!87175 () Unit!5379)

(assert (=> b!176351 (= lt!87175 lt!87156)))

(declare-fun lt!87165 () ListLongMap!2189)

(assert (=> b!176351 (= lt!87165 (getCurrentListMapNoExtraKeys!158 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87155 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87155 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87171 () (_ BitVec 64))

(assert (=> b!176351 (= lt!87171 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176351 (= lt!87157 (addApplyDifferent!113 lt!87165 lt!87155 (minValue!3473 thiss!1248) lt!87171))))

(assert (=> b!176351 (= (apply!137 (+!249 lt!87165 (tuple2!3271 lt!87155 (minValue!3473 thiss!1248))) lt!87171) (apply!137 lt!87165 lt!87171))))

(declare-fun b!176352 () Bool)

(declare-fun e!116347 () ListLongMap!2189)

(assert (=> b!176352 (= e!116347 call!17838)))

(declare-fun d!53523 () Bool)

(declare-fun e!116350 () Bool)

(assert (=> d!53523 e!116350))

(declare-fun res!83549 () Bool)

(assert (=> d!53523 (=> (not res!83549) (not e!116350))))

(assert (=> d!53523 (= res!83549 (or (bvsge #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))))))))

(declare-fun lt!87176 () ListLongMap!2189)

(assert (=> d!53523 (= lt!87173 lt!87176)))

(declare-fun lt!87167 () Unit!5379)

(assert (=> d!53523 (= lt!87167 e!116348)))

(declare-fun c!31618 () Bool)

(declare-fun e!116349 () Bool)

(assert (=> d!53523 (= c!31618 e!116349)))

(declare-fun res!83552 () Bool)

(assert (=> d!53523 (=> (not res!83552) (not e!116349))))

(assert (=> d!53523 (= res!83552 (bvslt #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))))))

(declare-fun e!116352 () ListLongMap!2189)

(assert (=> d!53523 (= lt!87176 e!116352)))

(assert (=> d!53523 (= c!31621 (and (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53523 (validMask!0 (mask!8548 thiss!1248))))

(assert (=> d!53523 (= (getCurrentListMap!746 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) lt!87173)))

(declare-fun b!176353 () Bool)

(declare-fun c!31622 () Bool)

(assert (=> b!176353 (= c!31622 (and (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116343 () ListLongMap!2189)

(assert (=> b!176353 (= e!116347 e!116343)))

(declare-fun bm!17835 () Bool)

(assert (=> bm!17835 (= call!17836 call!17840)))

(declare-fun bm!17836 () Bool)

(declare-fun call!17841 () Bool)

(assert (=> bm!17836 (= call!17841 (contains!1179 lt!87173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176354 () Bool)

(assert (=> b!176354 (= e!116346 (not call!17839))))

(declare-fun b!176355 () Bool)

(declare-fun Unit!5382 () Unit!5379)

(assert (=> b!176355 (= e!116348 Unit!5382)))

(declare-fun bm!17837 () Bool)

(assert (=> bm!17837 (= call!17837 call!17836)))

(declare-fun b!176356 () Bool)

(declare-fun e!116340 () Bool)

(assert (=> b!176356 (= e!116340 (not call!17841))))

(declare-fun b!176357 () Bool)

(declare-fun res!83548 () Bool)

(assert (=> b!176357 (=> (not res!83548) (not e!116350))))

(declare-fun e!116345 () Bool)

(assert (=> b!176357 (= res!83548 e!116345)))

(declare-fun res!83545 () Bool)

(assert (=> b!176357 (=> res!83545 e!116345)))

(declare-fun e!116341 () Bool)

(assert (=> b!176357 (= res!83545 (not e!116341))))

(declare-fun res!83551 () Bool)

(assert (=> b!176357 (=> (not res!83551) (not e!116341))))

(assert (=> b!176357 (= res!83551 (bvslt #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))))))

(declare-fun b!176358 () Bool)

(declare-fun res!83547 () Bool)

(assert (=> b!176358 (=> (not res!83547) (not e!116350))))

(assert (=> b!176358 (= res!83547 e!116346)))

(declare-fun c!31619 () Bool)

(assert (=> b!176358 (= c!31619 (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!176359 () Bool)

(assert (=> b!176359 (= e!116343 call!17838)))

(declare-fun b!176360 () Bool)

(assert (=> b!176360 (= e!116345 e!116351)))

(declare-fun res!83553 () Bool)

(assert (=> b!176360 (=> (not res!83553) (not e!116351))))

(assert (=> b!176360 (= res!83553 (contains!1179 lt!87173 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))))))

(declare-fun bm!17838 () Bool)

(assert (=> bm!17838 (= call!17839 (contains!1179 lt!87173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176361 () Bool)

(assert (=> b!176361 (= e!116352 (+!249 call!17842 (tuple2!3271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3473 thiss!1248))))))

(declare-fun b!176362 () Bool)

(assert (=> b!176362 (= e!116343 call!17837)))

(declare-fun b!176363 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176363 (= e!116349 (validKeyInArray!0 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176364 () Bool)

(assert (=> b!176364 (= e!116342 (= (apply!137 lt!87173 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3473 thiss!1248)))))

(declare-fun b!176365 () Bool)

(declare-fun e!116344 () Bool)

(assert (=> b!176365 (= e!116340 e!116344)))

(declare-fun res!83546 () Bool)

(assert (=> b!176365 (= res!83546 call!17841)))

(assert (=> b!176365 (=> (not res!83546) (not e!116344))))

(declare-fun b!176366 () Bool)

(assert (=> b!176366 (= e!116341 (validKeyInArray!0 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176367 () Bool)

(assert (=> b!176367 (= e!116352 e!116347)))

(assert (=> b!176367 (= c!31617 (and (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176368 () Bool)

(assert (=> b!176368 (= e!116350 e!116340)))

(declare-fun c!31620 () Bool)

(assert (=> b!176368 (= c!31620 (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176369 () Bool)

(assert (=> b!176369 (= e!116344 (= (apply!137 lt!87173 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3473 thiss!1248)))))

(declare-fun bm!17839 () Bool)

(assert (=> bm!17839 (= call!17840 (getCurrentListMapNoExtraKeys!158 (_keys!5492 thiss!1248) (_values!3615 thiss!1248) (mask!8548 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(assert (= (and d!53523 c!31621) b!176361))

(assert (= (and d!53523 (not c!31621)) b!176367))

(assert (= (and b!176367 c!31617) b!176352))

(assert (= (and b!176367 (not c!31617)) b!176353))

(assert (= (and b!176353 c!31622) b!176359))

(assert (= (and b!176353 (not c!31622)) b!176362))

(assert (= (or b!176359 b!176362) bm!17837))

(assert (= (or b!176352 bm!17837) bm!17835))

(assert (= (or b!176352 b!176359) bm!17834))

(assert (= (or b!176361 bm!17835) bm!17839))

(assert (= (or b!176361 bm!17834) bm!17833))

(assert (= (and d!53523 res!83552) b!176363))

(assert (= (and d!53523 c!31618) b!176351))

(assert (= (and d!53523 (not c!31618)) b!176355))

(assert (= (and d!53523 res!83549) b!176357))

(assert (= (and b!176357 res!83551) b!176366))

(assert (= (and b!176357 (not res!83545)) b!176360))

(assert (= (and b!176360 res!83553) b!176349))

(assert (= (and b!176357 res!83548) b!176358))

(assert (= (and b!176358 c!31619) b!176350))

(assert (= (and b!176358 (not c!31619)) b!176354))

(assert (= (and b!176350 res!83550) b!176364))

(assert (= (or b!176350 b!176354) bm!17838))

(assert (= (and b!176358 res!83547) b!176368))

(assert (= (and b!176368 c!31620) b!176365))

(assert (= (and b!176368 (not c!31620)) b!176356))

(assert (= (and b!176365 res!83546) b!176369))

(assert (= (or b!176365 b!176356) bm!17836))

(declare-fun b_lambda!7021 () Bool)

(assert (=> (not b_lambda!7021) (not b!176349)))

(declare-fun t!7055 () Bool)

(declare-fun tb!2777 () Bool)

(assert (=> (and b!176235 (= (defaultEntry!3632 thiss!1248) (defaultEntry!3632 thiss!1248)) t!7055) tb!2777))

(declare-fun result!4621 () Bool)

(assert (=> tb!2777 (= result!4621 tp_is_empty!4123)))

(assert (=> b!176349 t!7055))

(declare-fun b_and!10825 () Bool)

(assert (= b_and!10819 (and (=> t!7055 result!4621) b_and!10825)))

(assert (=> d!53523 m!204593))

(declare-fun m!204655 () Bool)

(assert (=> bm!17839 m!204655))

(declare-fun m!204657 () Bool)

(assert (=> b!176369 m!204657))

(declare-fun m!204659 () Bool)

(assert (=> b!176363 m!204659))

(assert (=> b!176363 m!204659))

(declare-fun m!204661 () Bool)

(assert (=> b!176363 m!204661))

(declare-fun m!204663 () Bool)

(assert (=> b!176351 m!204663))

(declare-fun m!204665 () Bool)

(assert (=> b!176351 m!204665))

(declare-fun m!204667 () Bool)

(assert (=> b!176351 m!204667))

(declare-fun m!204669 () Bool)

(assert (=> b!176351 m!204669))

(declare-fun m!204671 () Bool)

(assert (=> b!176351 m!204671))

(declare-fun m!204673 () Bool)

(assert (=> b!176351 m!204673))

(declare-fun m!204675 () Bool)

(assert (=> b!176351 m!204675))

(assert (=> b!176351 m!204669))

(assert (=> b!176351 m!204655))

(declare-fun m!204677 () Bool)

(assert (=> b!176351 m!204677))

(declare-fun m!204679 () Bool)

(assert (=> b!176351 m!204679))

(declare-fun m!204681 () Bool)

(assert (=> b!176351 m!204681))

(assert (=> b!176351 m!204673))

(assert (=> b!176351 m!204677))

(declare-fun m!204683 () Bool)

(assert (=> b!176351 m!204683))

(declare-fun m!204685 () Bool)

(assert (=> b!176351 m!204685))

(declare-fun m!204687 () Bool)

(assert (=> b!176351 m!204687))

(assert (=> b!176351 m!204667))

(declare-fun m!204689 () Bool)

(assert (=> b!176351 m!204689))

(declare-fun m!204691 () Bool)

(assert (=> b!176351 m!204691))

(assert (=> b!176351 m!204659))

(assert (=> b!176360 m!204659))

(assert (=> b!176360 m!204659))

(declare-fun m!204693 () Bool)

(assert (=> b!176360 m!204693))

(declare-fun m!204695 () Bool)

(assert (=> bm!17836 m!204695))

(declare-fun m!204697 () Bool)

(assert (=> b!176364 m!204697))

(declare-fun m!204699 () Bool)

(assert (=> bm!17838 m!204699))

(declare-fun m!204701 () Bool)

(assert (=> bm!17833 m!204701))

(assert (=> b!176366 m!204659))

(assert (=> b!176366 m!204659))

(assert (=> b!176366 m!204661))

(declare-fun m!204703 () Bool)

(assert (=> b!176349 m!204703))

(declare-fun m!204705 () Bool)

(assert (=> b!176349 m!204705))

(assert (=> b!176349 m!204703))

(declare-fun m!204707 () Bool)

(assert (=> b!176349 m!204707))

(assert (=> b!176349 m!204659))

(assert (=> b!176349 m!204705))

(assert (=> b!176349 m!204659))

(declare-fun m!204709 () Bool)

(assert (=> b!176349 m!204709))

(declare-fun m!204711 () Bool)

(assert (=> b!176361 m!204711))

(assert (=> b!176230 d!53523))

(declare-fun d!53525 () Bool)

(assert (=> d!53525 (= (validMask!0 (mask!8548 thiss!1248)) (and (or (= (mask!8548 thiss!1248) #b00000000000000000000000000000111) (= (mask!8548 thiss!1248) #b00000000000000000000000000001111) (= (mask!8548 thiss!1248) #b00000000000000000000000000011111) (= (mask!8548 thiss!1248) #b00000000000000000000000000111111) (= (mask!8548 thiss!1248) #b00000000000000000000000001111111) (= (mask!8548 thiss!1248) #b00000000000000000000000011111111) (= (mask!8548 thiss!1248) #b00000000000000000000000111111111) (= (mask!8548 thiss!1248) #b00000000000000000000001111111111) (= (mask!8548 thiss!1248) #b00000000000000000000011111111111) (= (mask!8548 thiss!1248) #b00000000000000000000111111111111) (= (mask!8548 thiss!1248) #b00000000000000000001111111111111) (= (mask!8548 thiss!1248) #b00000000000000000011111111111111) (= (mask!8548 thiss!1248) #b00000000000000000111111111111111) (= (mask!8548 thiss!1248) #b00000000000000001111111111111111) (= (mask!8548 thiss!1248) #b00000000000000011111111111111111) (= (mask!8548 thiss!1248) #b00000000000000111111111111111111) (= (mask!8548 thiss!1248) #b00000000000001111111111111111111) (= (mask!8548 thiss!1248) #b00000000000011111111111111111111) (= (mask!8548 thiss!1248) #b00000000000111111111111111111111) (= (mask!8548 thiss!1248) #b00000000001111111111111111111111) (= (mask!8548 thiss!1248) #b00000000011111111111111111111111) (= (mask!8548 thiss!1248) #b00000000111111111111111111111111) (= (mask!8548 thiss!1248) #b00000001111111111111111111111111) (= (mask!8548 thiss!1248) #b00000011111111111111111111111111) (= (mask!8548 thiss!1248) #b00000111111111111111111111111111) (= (mask!8548 thiss!1248) #b00001111111111111111111111111111) (= (mask!8548 thiss!1248) #b00011111111111111111111111111111) (= (mask!8548 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8548 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176231 d!53525))

(declare-fun d!53527 () Bool)

(assert (=> d!53527 (= (array_inv!2257 (_keys!5492 thiss!1248)) (bvsge (size!3801 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176235 d!53527))

(declare-fun d!53529 () Bool)

(assert (=> d!53529 (= (array_inv!2258 (_values!3615 thiss!1248)) (bvsge (size!3802 (_values!3615 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176235 d!53529))

(declare-fun d!53531 () Bool)

(declare-fun res!83560 () Bool)

(declare-fun e!116355 () Bool)

(assert (=> d!53531 (=> (not res!83560) (not e!116355))))

(declare-fun simpleValid!151 (LongMapFixedSize!2344) Bool)

(assert (=> d!53531 (= res!83560 (simpleValid!151 thiss!1248))))

(assert (=> d!53531 (= (valid!1005 thiss!1248) e!116355)))

(declare-fun b!176378 () Bool)

(declare-fun res!83561 () Bool)

(assert (=> b!176378 (=> (not res!83561) (not e!116355))))

(declare-fun arrayCountValidKeys!0 (array!7371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176378 (= res!83561 (= (arrayCountValidKeys!0 (_keys!5492 thiss!1248) #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))) (_size!1221 thiss!1248)))))

(declare-fun b!176379 () Bool)

(declare-fun res!83562 () Bool)

(assert (=> b!176379 (=> (not res!83562) (not e!116355))))

(assert (=> b!176379 (= res!83562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5492 thiss!1248) (mask!8548 thiss!1248)))))

(declare-fun b!176380 () Bool)

(declare-datatypes ((List!2239 0))(
  ( (Nil!2236) (Cons!2235 (h!2856 (_ BitVec 64)) (t!7056 List!2239)) )
))
(declare-fun arrayNoDuplicates!0 (array!7371 (_ BitVec 32) List!2239) Bool)

(assert (=> b!176380 (= e!116355 (arrayNoDuplicates!0 (_keys!5492 thiss!1248) #b00000000000000000000000000000000 Nil!2236))))

(assert (= (and d!53531 res!83560) b!176378))

(assert (= (and b!176378 res!83561) b!176379))

(assert (= (and b!176379 res!83562) b!176380))

(declare-fun m!204713 () Bool)

(assert (=> d!53531 m!204713))

(declare-fun m!204715 () Bool)

(assert (=> b!176378 m!204715))

(assert (=> b!176379 m!204607))

(declare-fun m!204717 () Bool)

(assert (=> b!176380 m!204717))

(assert (=> start!17648 d!53531))

(declare-fun b!176389 () Bool)

(declare-fun e!116364 () Bool)

(declare-fun e!116362 () Bool)

(assert (=> b!176389 (= e!116364 e!116362)))

(declare-fun c!31625 () Bool)

(assert (=> b!176389 (= c!31625 (validKeyInArray!0 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17842 () Bool)

(declare-fun call!17845 () Bool)

(assert (=> bm!17842 (= call!17845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5492 thiss!1248) (mask!8548 thiss!1248)))))

(declare-fun b!176390 () Bool)

(declare-fun e!116363 () Bool)

(assert (=> b!176390 (= e!116363 call!17845)))

(declare-fun b!176391 () Bool)

(assert (=> b!176391 (= e!116362 e!116363)))

(declare-fun lt!87184 () (_ BitVec 64))

(assert (=> b!176391 (= lt!87184 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87183 () Unit!5379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7371 (_ BitVec 64) (_ BitVec 32)) Unit!5379)

(assert (=> b!176391 (= lt!87183 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5492 thiss!1248) lt!87184 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176391 (arrayContainsKey!0 (_keys!5492 thiss!1248) lt!87184 #b00000000000000000000000000000000)))

(declare-fun lt!87185 () Unit!5379)

(assert (=> b!176391 (= lt!87185 lt!87183)))

(declare-fun res!83567 () Bool)

(assert (=> b!176391 (= res!83567 (= (seekEntryOrOpen!0 (select (arr!3496 (_keys!5492 thiss!1248)) #b00000000000000000000000000000000) (_keys!5492 thiss!1248) (mask!8548 thiss!1248)) (Found!567 #b00000000000000000000000000000000)))))

(assert (=> b!176391 (=> (not res!83567) (not e!116363))))

(declare-fun b!176392 () Bool)

(assert (=> b!176392 (= e!116362 call!17845)))

(declare-fun d!53533 () Bool)

(declare-fun res!83568 () Bool)

(assert (=> d!53533 (=> res!83568 e!116364)))

(assert (=> d!53533 (= res!83568 (bvsge #b00000000000000000000000000000000 (size!3801 (_keys!5492 thiss!1248))))))

(assert (=> d!53533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5492 thiss!1248) (mask!8548 thiss!1248)) e!116364)))

(assert (= (and d!53533 (not res!83568)) b!176389))

(assert (= (and b!176389 c!31625) b!176391))

(assert (= (and b!176389 (not c!31625)) b!176392))

(assert (= (and b!176391 res!83567) b!176390))

(assert (= (or b!176390 b!176392) bm!17842))

(assert (=> b!176389 m!204659))

(assert (=> b!176389 m!204659))

(assert (=> b!176389 m!204661))

(declare-fun m!204719 () Bool)

(assert (=> bm!17842 m!204719))

(assert (=> b!176391 m!204659))

(declare-fun m!204721 () Bool)

(assert (=> b!176391 m!204721))

(declare-fun m!204723 () Bool)

(assert (=> b!176391 m!204723))

(assert (=> b!176391 m!204659))

(declare-fun m!204725 () Bool)

(assert (=> b!176391 m!204725))

(assert (=> b!176237 d!53533))

(declare-fun lt!87193 () SeekEntryResult!567)

(declare-fun e!116372 () SeekEntryResult!567)

(declare-fun b!176405 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7371 (_ BitVec 32)) SeekEntryResult!567)

(assert (=> b!176405 (= e!116372 (seekKeyOrZeroReturnVacant!0 (x!19376 lt!87193) (index!4438 lt!87193) (index!4438 lt!87193) key!828 (_keys!5492 thiss!1248) (mask!8548 thiss!1248)))))

(declare-fun b!176407 () Bool)

(declare-fun e!116371 () SeekEntryResult!567)

(assert (=> b!176407 (= e!116371 (Found!567 (index!4438 lt!87193)))))

(declare-fun b!176408 () Bool)

(declare-fun e!116373 () SeekEntryResult!567)

(assert (=> b!176408 (= e!116373 Undefined!567)))

(declare-fun b!176409 () Bool)

(assert (=> b!176409 (= e!116373 e!116371)))

(declare-fun lt!87194 () (_ BitVec 64))

(assert (=> b!176409 (= lt!87194 (select (arr!3496 (_keys!5492 thiss!1248)) (index!4438 lt!87193)))))

(declare-fun c!31634 () Bool)

(assert (=> b!176409 (= c!31634 (= lt!87194 key!828))))

(declare-fun b!176410 () Bool)

(declare-fun c!31632 () Bool)

(assert (=> b!176410 (= c!31632 (= lt!87194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176410 (= e!116371 e!116372)))

(declare-fun d!53535 () Bool)

(declare-fun lt!87192 () SeekEntryResult!567)

(assert (=> d!53535 (and (or ((_ is Undefined!567) lt!87192) (not ((_ is Found!567) lt!87192)) (and (bvsge (index!4437 lt!87192) #b00000000000000000000000000000000) (bvslt (index!4437 lt!87192) (size!3801 (_keys!5492 thiss!1248))))) (or ((_ is Undefined!567) lt!87192) ((_ is Found!567) lt!87192) (not ((_ is MissingZero!567) lt!87192)) (and (bvsge (index!4436 lt!87192) #b00000000000000000000000000000000) (bvslt (index!4436 lt!87192) (size!3801 (_keys!5492 thiss!1248))))) (or ((_ is Undefined!567) lt!87192) ((_ is Found!567) lt!87192) ((_ is MissingZero!567) lt!87192) (not ((_ is MissingVacant!567) lt!87192)) (and (bvsge (index!4439 lt!87192) #b00000000000000000000000000000000) (bvslt (index!4439 lt!87192) (size!3801 (_keys!5492 thiss!1248))))) (or ((_ is Undefined!567) lt!87192) (ite ((_ is Found!567) lt!87192) (= (select (arr!3496 (_keys!5492 thiss!1248)) (index!4437 lt!87192)) key!828) (ite ((_ is MissingZero!567) lt!87192) (= (select (arr!3496 (_keys!5492 thiss!1248)) (index!4436 lt!87192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!567) lt!87192) (= (select (arr!3496 (_keys!5492 thiss!1248)) (index!4439 lt!87192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53535 (= lt!87192 e!116373)))

(declare-fun c!31633 () Bool)

(assert (=> d!53535 (= c!31633 (and ((_ is Intermediate!567) lt!87193) (undefined!1379 lt!87193)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7371 (_ BitVec 32)) SeekEntryResult!567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53535 (= lt!87193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8548 thiss!1248)) key!828 (_keys!5492 thiss!1248) (mask!8548 thiss!1248)))))

(assert (=> d!53535 (validMask!0 (mask!8548 thiss!1248))))

(assert (=> d!53535 (= (seekEntryOrOpen!0 key!828 (_keys!5492 thiss!1248) (mask!8548 thiss!1248)) lt!87192)))

(declare-fun b!176406 () Bool)

(assert (=> b!176406 (= e!116372 (MissingZero!567 (index!4438 lt!87193)))))

(assert (= (and d!53535 c!31633) b!176408))

(assert (= (and d!53535 (not c!31633)) b!176409))

(assert (= (and b!176409 c!31634) b!176407))

(assert (= (and b!176409 (not c!31634)) b!176410))

(assert (= (and b!176410 c!31632) b!176406))

(assert (= (and b!176410 (not c!31632)) b!176405))

(declare-fun m!204727 () Bool)

(assert (=> b!176405 m!204727))

(declare-fun m!204729 () Bool)

(assert (=> b!176409 m!204729))

(declare-fun m!204731 () Bool)

(assert (=> d!53535 m!204731))

(assert (=> d!53535 m!204593))

(declare-fun m!204733 () Bool)

(assert (=> d!53535 m!204733))

(declare-fun m!204735 () Bool)

(assert (=> d!53535 m!204735))

(declare-fun m!204737 () Bool)

(assert (=> d!53535 m!204737))

(declare-fun m!204739 () Bool)

(assert (=> d!53535 m!204739))

(assert (=> d!53535 m!204733))

(assert (=> b!176229 d!53535))

(declare-fun b!176417 () Bool)

(declare-fun e!116378 () Bool)

(assert (=> b!176417 (= e!116378 tp_is_empty!4123)))

(declare-fun b!176418 () Bool)

(declare-fun e!116379 () Bool)

(assert (=> b!176418 (= e!116379 tp_is_empty!4123)))

(declare-fun mapNonEmpty!7047 () Bool)

(declare-fun mapRes!7047 () Bool)

(declare-fun tp!15759 () Bool)

(assert (=> mapNonEmpty!7047 (= mapRes!7047 (and tp!15759 e!116378))))

(declare-fun mapKey!7047 () (_ BitVec 32))

(declare-fun mapValue!7047 () ValueCell!1718)

(declare-fun mapRest!7047 () (Array (_ BitVec 32) ValueCell!1718))

(assert (=> mapNonEmpty!7047 (= mapRest!7038 (store mapRest!7047 mapKey!7047 mapValue!7047))))

(declare-fun mapIsEmpty!7047 () Bool)

(assert (=> mapIsEmpty!7047 mapRes!7047))

(declare-fun condMapEmpty!7047 () Bool)

(declare-fun mapDefault!7047 () ValueCell!1718)

(assert (=> mapNonEmpty!7038 (= condMapEmpty!7047 (= mapRest!7038 ((as const (Array (_ BitVec 32) ValueCell!1718)) mapDefault!7047)))))

(assert (=> mapNonEmpty!7038 (= tp!15744 (and e!116379 mapRes!7047))))

(assert (= (and mapNonEmpty!7038 condMapEmpty!7047) mapIsEmpty!7047))

(assert (= (and mapNonEmpty!7038 (not condMapEmpty!7047)) mapNonEmpty!7047))

(assert (= (and mapNonEmpty!7047 ((_ is ValueCellFull!1718) mapValue!7047)) b!176417))

(assert (= (and mapNonEmpty!7038 ((_ is ValueCellFull!1718) mapDefault!7047)) b!176418))

(declare-fun m!204741 () Bool)

(assert (=> mapNonEmpty!7047 m!204741))

(declare-fun b_lambda!7023 () Bool)

(assert (= b_lambda!7021 (or (and b!176235 b_free!4351) b_lambda!7023)))

(check-sat (not b!176378) (not b!176304) (not b!176405) (not bm!17836) (not b!176380) (not d!53531) (not b_lambda!7023) b_and!10825 (not b!176389) tp_is_empty!4123 (not b!176366) (not bm!17839) (not bm!17838) (not b!176351) (not b!176391) (not d!53521) (not b!176306) (not d!53523) (not b!176364) (not b!176363) (not b!176349) (not b!176379) (not bm!17842) (not b!176360) (not mapNonEmpty!7047) (not bm!17833) (not b!176369) (not b_next!4351) (not d!53535) (not b!176361))
(check-sat b_and!10825 (not b_next!4351))
