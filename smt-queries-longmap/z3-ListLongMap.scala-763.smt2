; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17994 () Bool)

(assert start!17994)

(declare-fun b!179189 () Bool)

(declare-fun b_free!4419 () Bool)

(declare-fun b_next!4419 () Bool)

(assert (=> b!179189 (= b_free!4419 (not b_next!4419))))

(declare-fun tp!15978 () Bool)

(declare-fun b_and!10947 () Bool)

(assert (=> b!179189 (= tp!15978 b_and!10947)))

(declare-fun res!84863 () Bool)

(declare-fun e!118065 () Bool)

(assert (=> start!17994 (=> (not res!84863) (not e!118065))))

(declare-datatypes ((V!5235 0))(
  ( (V!5236 (val!2140 Int)) )
))
(declare-datatypes ((ValueCell!1752 0))(
  ( (ValueCellFull!1752 (v!4026 V!5235)) (EmptyCell!1752) )
))
(declare-datatypes ((array!7545 0))(
  ( (array!7546 (arr!3575 (Array (_ BitVec 32) (_ BitVec 64))) (size!3883 (_ BitVec 32))) )
))
(declare-datatypes ((array!7547 0))(
  ( (array!7548 (arr!3576 (Array (_ BitVec 32) ValueCell!1752)) (size!3884 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2412 0))(
  ( (LongMapFixedSize!2413 (defaultEntry!3679 Int) (mask!8655 (_ BitVec 32)) (extraKeys!3416 (_ BitVec 32)) (zeroValue!3520 V!5235) (minValue!3520 V!5235) (_size!1255 (_ BitVec 32)) (_keys!5564 array!7545) (_values!3662 array!7547) (_vacant!1255 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2412)

(declare-fun valid!1009 (LongMapFixedSize!2412) Bool)

(assert (=> start!17994 (= res!84863 (valid!1009 thiss!1248))))

(assert (=> start!17994 e!118065))

(declare-fun e!118061 () Bool)

(assert (=> start!17994 e!118061))

(assert (=> start!17994 true))

(declare-fun b!179181 () Bool)

(declare-fun e!118064 () Bool)

(declare-fun e!118062 () Bool)

(declare-fun mapRes!7171 () Bool)

(assert (=> b!179181 (= e!118064 (and e!118062 mapRes!7171))))

(declare-fun condMapEmpty!7171 () Bool)

(declare-fun mapDefault!7171 () ValueCell!1752)

(assert (=> b!179181 (= condMapEmpty!7171 (= (arr!3576 (_values!3662 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1752)) mapDefault!7171)))))

(declare-fun b!179182 () Bool)

(declare-fun res!84867 () Bool)

(assert (=> b!179182 (=> (not res!84867) (not e!118065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179182 (= res!84867 (validMask!0 (mask!8655 thiss!1248)))))

(declare-fun b!179183 () Bool)

(declare-fun tp_is_empty!4191 () Bool)

(assert (=> b!179183 (= e!118062 tp_is_empty!4191)))

(declare-fun b!179184 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7545 (_ BitVec 32)) Bool)

(assert (=> b!179184 (= e!118065 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5564 thiss!1248) (mask!8655 thiss!1248))))))

(declare-fun mapIsEmpty!7171 () Bool)

(assert (=> mapIsEmpty!7171 mapRes!7171))

(declare-fun b!179185 () Bool)

(declare-fun res!84864 () Bool)

(assert (=> b!179185 (=> (not res!84864) (not e!118065))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!179185 (= res!84864 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179186 () Bool)

(declare-fun res!84868 () Bool)

(assert (=> b!179186 (=> (not res!84868) (not e!118065))))

(declare-datatypes ((tuple2!3326 0))(
  ( (tuple2!3327 (_1!1674 (_ BitVec 64)) (_2!1674 V!5235)) )
))
(declare-datatypes ((List!2270 0))(
  ( (Nil!2267) (Cons!2266 (h!2891 tuple2!3326) (t!7112 List!2270)) )
))
(declare-datatypes ((ListLongMap!2253 0))(
  ( (ListLongMap!2254 (toList!1142 List!2270)) )
))
(declare-fun contains!1216 (ListLongMap!2253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!794 (array!7545 array!7547 (_ BitVec 32) (_ BitVec 32) V!5235 V!5235 (_ BitVec 32) Int) ListLongMap!2253)

(assert (=> b!179186 (= res!84868 (not (contains!1216 (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)) key!828)))))

(declare-fun b!179187 () Bool)

(declare-fun res!84865 () Bool)

(assert (=> b!179187 (=> (not res!84865) (not e!118065))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!580 0))(
  ( (MissingZero!580 (index!4488 (_ BitVec 32))) (Found!580 (index!4489 (_ BitVec 32))) (Intermediate!580 (undefined!1392 Bool) (index!4490 (_ BitVec 32)) (x!19600 (_ BitVec 32))) (Undefined!580) (MissingVacant!580 (index!4491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7545 (_ BitVec 32)) SeekEntryResult!580)

(assert (=> b!179187 (= res!84865 ((_ is Undefined!580) (seekEntryOrOpen!0 key!828 (_keys!5564 thiss!1248) (mask!8655 thiss!1248))))))

(declare-fun mapNonEmpty!7171 () Bool)

(declare-fun tp!15979 () Bool)

(declare-fun e!118063 () Bool)

(assert (=> mapNonEmpty!7171 (= mapRes!7171 (and tp!15979 e!118063))))

(declare-fun mapValue!7171 () ValueCell!1752)

(declare-fun mapKey!7171 () (_ BitVec 32))

(declare-fun mapRest!7171 () (Array (_ BitVec 32) ValueCell!1752))

(assert (=> mapNonEmpty!7171 (= (arr!3576 (_values!3662 thiss!1248)) (store mapRest!7171 mapKey!7171 mapValue!7171))))

(declare-fun b!179188 () Bool)

(assert (=> b!179188 (= e!118063 tp_is_empty!4191)))

(declare-fun array_inv!2301 (array!7545) Bool)

(declare-fun array_inv!2302 (array!7547) Bool)

(assert (=> b!179189 (= e!118061 (and tp!15978 tp_is_empty!4191 (array_inv!2301 (_keys!5564 thiss!1248)) (array_inv!2302 (_values!3662 thiss!1248)) e!118064))))

(declare-fun b!179190 () Bool)

(declare-fun res!84866 () Bool)

(assert (=> b!179190 (=> (not res!84866) (not e!118065))))

(assert (=> b!179190 (= res!84866 (and (= (size!3884 (_values!3662 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8655 thiss!1248))) (= (size!3883 (_keys!5564 thiss!1248)) (size!3884 (_values!3662 thiss!1248))) (bvsge (mask!8655 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3416 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3416 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!17994 res!84863) b!179185))

(assert (= (and b!179185 res!84864) b!179187))

(assert (= (and b!179187 res!84865) b!179186))

(assert (= (and b!179186 res!84868) b!179182))

(assert (= (and b!179182 res!84867) b!179190))

(assert (= (and b!179190 res!84866) b!179184))

(assert (= (and b!179181 condMapEmpty!7171) mapIsEmpty!7171))

(assert (= (and b!179181 (not condMapEmpty!7171)) mapNonEmpty!7171))

(assert (= (and mapNonEmpty!7171 ((_ is ValueCellFull!1752) mapValue!7171)) b!179188))

(assert (= (and b!179181 ((_ is ValueCellFull!1752) mapDefault!7171)) b!179183))

(assert (= b!179189 b!179181))

(assert (= start!17994 b!179189))

(declare-fun m!207511 () Bool)

(assert (=> b!179184 m!207511))

(declare-fun m!207513 () Bool)

(assert (=> b!179182 m!207513))

(declare-fun m!207515 () Bool)

(assert (=> b!179189 m!207515))

(declare-fun m!207517 () Bool)

(assert (=> b!179189 m!207517))

(declare-fun m!207519 () Bool)

(assert (=> start!17994 m!207519))

(declare-fun m!207521 () Bool)

(assert (=> b!179186 m!207521))

(assert (=> b!179186 m!207521))

(declare-fun m!207523 () Bool)

(assert (=> b!179186 m!207523))

(declare-fun m!207525 () Bool)

(assert (=> mapNonEmpty!7171 m!207525))

(declare-fun m!207527 () Bool)

(assert (=> b!179187 m!207527))

(check-sat (not mapNonEmpty!7171) (not b!179187) (not b!179184) (not b_next!4419) (not b!179182) (not b!179186) b_and!10947 (not b!179189) (not start!17994) tp_is_empty!4191)
(check-sat b_and!10947 (not b_next!4419))
(get-model)

(declare-fun b!179229 () Bool)

(declare-fun e!118091 () Bool)

(declare-fun e!118093 () Bool)

(assert (=> b!179229 (= e!118091 e!118093)))

(declare-fun lt!88556 () (_ BitVec 64))

(assert (=> b!179229 (= lt!88556 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5460 0))(
  ( (Unit!5461) )
))
(declare-fun lt!88555 () Unit!5460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7545 (_ BitVec 64) (_ BitVec 32)) Unit!5460)

(assert (=> b!179229 (= lt!88555 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5564 thiss!1248) lt!88556 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179229 (arrayContainsKey!0 (_keys!5564 thiss!1248) lt!88556 #b00000000000000000000000000000000)))

(declare-fun lt!88554 () Unit!5460)

(assert (=> b!179229 (= lt!88554 lt!88555)))

(declare-fun res!84891 () Bool)

(assert (=> b!179229 (= res!84891 (= (seekEntryOrOpen!0 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000) (_keys!5564 thiss!1248) (mask!8655 thiss!1248)) (Found!580 #b00000000000000000000000000000000)))))

(assert (=> b!179229 (=> (not res!84891) (not e!118093))))

(declare-fun b!179230 () Bool)

(declare-fun call!18100 () Bool)

(assert (=> b!179230 (= e!118093 call!18100)))

(declare-fun d!54125 () Bool)

(declare-fun res!84892 () Bool)

(declare-fun e!118092 () Bool)

(assert (=> d!54125 (=> res!84892 e!118092)))

(assert (=> d!54125 (= res!84892 (bvsge #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))))))

(assert (=> d!54125 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5564 thiss!1248) (mask!8655 thiss!1248)) e!118092)))

(declare-fun bm!18097 () Bool)

(assert (=> bm!18097 (= call!18100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5564 thiss!1248) (mask!8655 thiss!1248)))))

(declare-fun b!179231 () Bool)

(assert (=> b!179231 (= e!118092 e!118091)))

(declare-fun c!32135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179231 (= c!32135 (validKeyInArray!0 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179232 () Bool)

(assert (=> b!179232 (= e!118091 call!18100)))

(assert (= (and d!54125 (not res!84892)) b!179231))

(assert (= (and b!179231 c!32135) b!179229))

(assert (= (and b!179231 (not c!32135)) b!179232))

(assert (= (and b!179229 res!84891) b!179230))

(assert (= (or b!179230 b!179232) bm!18097))

(declare-fun m!207547 () Bool)

(assert (=> b!179229 m!207547))

(declare-fun m!207549 () Bool)

(assert (=> b!179229 m!207549))

(declare-fun m!207551 () Bool)

(assert (=> b!179229 m!207551))

(assert (=> b!179229 m!207547))

(declare-fun m!207553 () Bool)

(assert (=> b!179229 m!207553))

(declare-fun m!207555 () Bool)

(assert (=> bm!18097 m!207555))

(assert (=> b!179231 m!207547))

(assert (=> b!179231 m!207547))

(declare-fun m!207557 () Bool)

(assert (=> b!179231 m!207557))

(assert (=> b!179184 d!54125))

(declare-fun d!54127 () Bool)

(declare-fun res!84899 () Bool)

(declare-fun e!118096 () Bool)

(assert (=> d!54127 (=> (not res!84899) (not e!118096))))

(declare-fun simpleValid!160 (LongMapFixedSize!2412) Bool)

(assert (=> d!54127 (= res!84899 (simpleValid!160 thiss!1248))))

(assert (=> d!54127 (= (valid!1009 thiss!1248) e!118096)))

(declare-fun b!179239 () Bool)

(declare-fun res!84900 () Bool)

(assert (=> b!179239 (=> (not res!84900) (not e!118096))))

(declare-fun arrayCountValidKeys!0 (array!7545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179239 (= res!84900 (= (arrayCountValidKeys!0 (_keys!5564 thiss!1248) #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))) (_size!1255 thiss!1248)))))

(declare-fun b!179240 () Bool)

(declare-fun res!84901 () Bool)

(assert (=> b!179240 (=> (not res!84901) (not e!118096))))

(assert (=> b!179240 (= res!84901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5564 thiss!1248) (mask!8655 thiss!1248)))))

(declare-fun b!179241 () Bool)

(declare-datatypes ((List!2272 0))(
  ( (Nil!2269) (Cons!2268 (h!2893 (_ BitVec 64)) (t!7116 List!2272)) )
))
(declare-fun arrayNoDuplicates!0 (array!7545 (_ BitVec 32) List!2272) Bool)

(assert (=> b!179241 (= e!118096 (arrayNoDuplicates!0 (_keys!5564 thiss!1248) #b00000000000000000000000000000000 Nil!2269))))

(assert (= (and d!54127 res!84899) b!179239))

(assert (= (and b!179239 res!84900) b!179240))

(assert (= (and b!179240 res!84901) b!179241))

(declare-fun m!207559 () Bool)

(assert (=> d!54127 m!207559))

(declare-fun m!207561 () Bool)

(assert (=> b!179239 m!207561))

(assert (=> b!179240 m!207511))

(declare-fun m!207563 () Bool)

(assert (=> b!179241 m!207563))

(assert (=> start!17994 d!54127))

(declare-fun d!54129 () Bool)

(assert (=> d!54129 (= (array_inv!2301 (_keys!5564 thiss!1248)) (bvsge (size!3883 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179189 d!54129))

(declare-fun d!54131 () Bool)

(assert (=> d!54131 (= (array_inv!2302 (_values!3662 thiss!1248)) (bvsge (size!3884 (_values!3662 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179189 d!54131))

(declare-fun d!54133 () Bool)

(declare-fun e!118102 () Bool)

(assert (=> d!54133 e!118102))

(declare-fun res!84904 () Bool)

(assert (=> d!54133 (=> res!84904 e!118102)))

(declare-fun lt!88565 () Bool)

(assert (=> d!54133 (= res!84904 (not lt!88565))))

(declare-fun lt!88567 () Bool)

(assert (=> d!54133 (= lt!88565 lt!88567)))

(declare-fun lt!88568 () Unit!5460)

(declare-fun e!118101 () Unit!5460)

(assert (=> d!54133 (= lt!88568 e!118101)))

(declare-fun c!32138 () Bool)

(assert (=> d!54133 (= c!32138 lt!88567)))

(declare-fun containsKey!205 (List!2270 (_ BitVec 64)) Bool)

(assert (=> d!54133 (= lt!88567 (containsKey!205 (toList!1142 (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248))) key!828))))

(assert (=> d!54133 (= (contains!1216 (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)) key!828) lt!88565)))

(declare-fun b!179248 () Bool)

(declare-fun lt!88566 () Unit!5460)

(assert (=> b!179248 (= e!118101 lt!88566)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!153 (List!2270 (_ BitVec 64)) Unit!5460)

(assert (=> b!179248 (= lt!88566 (lemmaContainsKeyImpliesGetValueByKeyDefined!153 (toList!1142 (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248))) key!828))))

(declare-datatypes ((Option!207 0))(
  ( (Some!206 (v!4028 V!5235)) (None!205) )
))
(declare-fun isDefined!154 (Option!207) Bool)

(declare-fun getValueByKey!201 (List!2270 (_ BitVec 64)) Option!207)

(assert (=> b!179248 (isDefined!154 (getValueByKey!201 (toList!1142 (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248))) key!828))))

(declare-fun b!179249 () Bool)

(declare-fun Unit!5462 () Unit!5460)

(assert (=> b!179249 (= e!118101 Unit!5462)))

(declare-fun b!179250 () Bool)

(assert (=> b!179250 (= e!118102 (isDefined!154 (getValueByKey!201 (toList!1142 (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248))) key!828)))))

(assert (= (and d!54133 c!32138) b!179248))

(assert (= (and d!54133 (not c!32138)) b!179249))

(assert (= (and d!54133 (not res!84904)) b!179250))

(declare-fun m!207565 () Bool)

(assert (=> d!54133 m!207565))

(declare-fun m!207567 () Bool)

(assert (=> b!179248 m!207567))

(declare-fun m!207569 () Bool)

(assert (=> b!179248 m!207569))

(assert (=> b!179248 m!207569))

(declare-fun m!207571 () Bool)

(assert (=> b!179248 m!207571))

(assert (=> b!179250 m!207569))

(assert (=> b!179250 m!207569))

(assert (=> b!179250 m!207571))

(assert (=> b!179186 d!54133))

(declare-fun b!179293 () Bool)

(declare-fun e!118137 () Bool)

(assert (=> b!179293 (= e!118137 (validKeyInArray!0 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179294 () Bool)

(declare-fun e!118141 () ListLongMap!2253)

(declare-fun call!18115 () ListLongMap!2253)

(assert (=> b!179294 (= e!118141 call!18115)))

(declare-fun bm!18112 () Bool)

(declare-fun call!18120 () ListLongMap!2253)

(declare-fun call!18117 () ListLongMap!2253)

(assert (=> bm!18112 (= call!18120 call!18117)))

(declare-fun c!32151 () Bool)

(declare-fun c!32153 () Bool)

(declare-fun call!18116 () ListLongMap!2253)

(declare-fun bm!18113 () Bool)

(declare-fun call!18118 () ListLongMap!2253)

(declare-fun +!263 (ListLongMap!2253 tuple2!3326) ListLongMap!2253)

(assert (=> bm!18113 (= call!18116 (+!263 (ite c!32153 call!18118 (ite c!32151 call!18117 call!18120)) (ite (or c!32153 c!32151) (tuple2!3327 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3520 thiss!1248)) (tuple2!3327 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3520 thiss!1248)))))))

(declare-fun bm!18114 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!179 (array!7545 array!7547 (_ BitVec 32) (_ BitVec 32) V!5235 V!5235 (_ BitVec 32) Int) ListLongMap!2253)

(assert (=> bm!18114 (= call!18118 (getCurrentListMapNoExtraKeys!179 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)))))

(declare-fun bm!18115 () Bool)

(declare-fun call!18121 () Bool)

(declare-fun lt!88623 () ListLongMap!2253)

(assert (=> bm!18115 (= call!18121 (contains!1216 lt!88623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18116 () Bool)

(declare-fun call!18119 () Bool)

(assert (=> bm!18116 (= call!18119 (contains!1216 lt!88623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179295 () Bool)

(declare-fun c!32155 () Bool)

(assert (=> b!179295 (= c!32155 (and (not (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!118136 () ListLongMap!2253)

(assert (=> b!179295 (= e!118136 e!118141)))

(declare-fun b!179296 () Bool)

(declare-fun e!118133 () ListLongMap!2253)

(assert (=> b!179296 (= e!118133 (+!263 call!18116 (tuple2!3327 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3520 thiss!1248))))))

(declare-fun b!179297 () Bool)

(declare-fun e!118138 () Bool)

(declare-fun e!118135 () Bool)

(assert (=> b!179297 (= e!118138 e!118135)))

(declare-fun c!32156 () Bool)

(assert (=> b!179297 (= c!32156 (not (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179298 () Bool)

(declare-fun res!84929 () Bool)

(assert (=> b!179298 (=> (not res!84929) (not e!118138))))

(declare-fun e!118131 () Bool)

(assert (=> b!179298 (= res!84929 e!118131)))

(declare-fun c!32154 () Bool)

(assert (=> b!179298 (= c!32154 (not (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179299 () Bool)

(assert (=> b!179299 (= e!118136 call!18115)))

(declare-fun b!179300 () Bool)

(declare-fun e!118132 () Unit!5460)

(declare-fun Unit!5463 () Unit!5460)

(assert (=> b!179300 (= e!118132 Unit!5463)))

(declare-fun b!179301 () Bool)

(declare-fun e!118140 () Bool)

(assert (=> b!179301 (= e!118135 e!118140)))

(declare-fun res!84928 () Bool)

(assert (=> b!179301 (= res!84928 call!18119)))

(assert (=> b!179301 (=> (not res!84928) (not e!118140))))

(declare-fun b!179302 () Bool)

(declare-fun apply!146 (ListLongMap!2253 (_ BitVec 64)) V!5235)

(assert (=> b!179302 (= e!118140 (= (apply!146 lt!88623 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3520 thiss!1248)))))

(declare-fun b!179303 () Bool)

(declare-fun e!118129 () Bool)

(declare-fun get!2047 (ValueCell!1752 V!5235) V!5235)

(declare-fun dynLambda!489 (Int (_ BitVec 64)) V!5235)

(assert (=> b!179303 (= e!118129 (= (apply!146 lt!88623 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000)) (get!2047 (select (arr!3576 (_values!3662 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!489 (defaultEntry!3679 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3884 (_values!3662 thiss!1248))))))

(assert (=> b!179303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))))))

(declare-fun b!179304 () Bool)

(declare-fun lt!88632 () Unit!5460)

(assert (=> b!179304 (= e!118132 lt!88632)))

(declare-fun lt!88621 () ListLongMap!2253)

(assert (=> b!179304 (= lt!88621 (getCurrentListMapNoExtraKeys!179 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)))))

(declare-fun lt!88622 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88627 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88627 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88633 () Unit!5460)

(declare-fun addStillContains!122 (ListLongMap!2253 (_ BitVec 64) V!5235 (_ BitVec 64)) Unit!5460)

(assert (=> b!179304 (= lt!88633 (addStillContains!122 lt!88621 lt!88622 (zeroValue!3520 thiss!1248) lt!88627))))

(assert (=> b!179304 (contains!1216 (+!263 lt!88621 (tuple2!3327 lt!88622 (zeroValue!3520 thiss!1248))) lt!88627)))

(declare-fun lt!88630 () Unit!5460)

(assert (=> b!179304 (= lt!88630 lt!88633)))

(declare-fun lt!88616 () ListLongMap!2253)

(assert (=> b!179304 (= lt!88616 (getCurrentListMapNoExtraKeys!179 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)))))

(declare-fun lt!88615 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88626 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88626 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88631 () Unit!5460)

(declare-fun addApplyDifferent!122 (ListLongMap!2253 (_ BitVec 64) V!5235 (_ BitVec 64)) Unit!5460)

(assert (=> b!179304 (= lt!88631 (addApplyDifferent!122 lt!88616 lt!88615 (minValue!3520 thiss!1248) lt!88626))))

(assert (=> b!179304 (= (apply!146 (+!263 lt!88616 (tuple2!3327 lt!88615 (minValue!3520 thiss!1248))) lt!88626) (apply!146 lt!88616 lt!88626))))

(declare-fun lt!88634 () Unit!5460)

(assert (=> b!179304 (= lt!88634 lt!88631)))

(declare-fun lt!88628 () ListLongMap!2253)

(assert (=> b!179304 (= lt!88628 (getCurrentListMapNoExtraKeys!179 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)))))

(declare-fun lt!88629 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88617 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88617 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88620 () Unit!5460)

(assert (=> b!179304 (= lt!88620 (addApplyDifferent!122 lt!88628 lt!88629 (zeroValue!3520 thiss!1248) lt!88617))))

(assert (=> b!179304 (= (apply!146 (+!263 lt!88628 (tuple2!3327 lt!88629 (zeroValue!3520 thiss!1248))) lt!88617) (apply!146 lt!88628 lt!88617))))

(declare-fun lt!88624 () Unit!5460)

(assert (=> b!179304 (= lt!88624 lt!88620)))

(declare-fun lt!88619 () ListLongMap!2253)

(assert (=> b!179304 (= lt!88619 (getCurrentListMapNoExtraKeys!179 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)))))

(declare-fun lt!88613 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88613 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88618 () (_ BitVec 64))

(assert (=> b!179304 (= lt!88618 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179304 (= lt!88632 (addApplyDifferent!122 lt!88619 lt!88613 (minValue!3520 thiss!1248) lt!88618))))

(assert (=> b!179304 (= (apply!146 (+!263 lt!88619 (tuple2!3327 lt!88613 (minValue!3520 thiss!1248))) lt!88618) (apply!146 lt!88619 lt!88618))))

(declare-fun b!179305 () Bool)

(assert (=> b!179305 (= e!118141 call!18120)))

(declare-fun b!179306 () Bool)

(assert (=> b!179306 (= e!118133 e!118136)))

(assert (=> b!179306 (= c!32151 (and (not (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!54135 () Bool)

(assert (=> d!54135 e!118138))

(declare-fun res!84931 () Bool)

(assert (=> d!54135 (=> (not res!84931) (not e!118138))))

(assert (=> d!54135 (= res!84931 (or (bvsge #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))))))))

(declare-fun lt!88625 () ListLongMap!2253)

(assert (=> d!54135 (= lt!88623 lt!88625)))

(declare-fun lt!88614 () Unit!5460)

(assert (=> d!54135 (= lt!88614 e!118132)))

(declare-fun c!32152 () Bool)

(declare-fun e!118139 () Bool)

(assert (=> d!54135 (= c!32152 e!118139)))

(declare-fun res!84930 () Bool)

(assert (=> d!54135 (=> (not res!84930) (not e!118139))))

(assert (=> d!54135 (= res!84930 (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))))))

(assert (=> d!54135 (= lt!88625 e!118133)))

(assert (=> d!54135 (= c!32153 (and (not (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3416 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54135 (validMask!0 (mask!8655 thiss!1248))))

(assert (=> d!54135 (= (getCurrentListMap!794 (_keys!5564 thiss!1248) (_values!3662 thiss!1248) (mask!8655 thiss!1248) (extraKeys!3416 thiss!1248) (zeroValue!3520 thiss!1248) (minValue!3520 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3679 thiss!1248)) lt!88623)))

(declare-fun b!179307 () Bool)

(assert (=> b!179307 (= e!118139 (validKeyInArray!0 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179308 () Bool)

(assert (=> b!179308 (= e!118131 (not call!18121))))

(declare-fun bm!18117 () Bool)

(assert (=> bm!18117 (= call!18117 call!18118)))

(declare-fun b!179309 () Bool)

(declare-fun e!118134 () Bool)

(assert (=> b!179309 (= e!118134 (= (apply!146 lt!88623 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3520 thiss!1248)))))

(declare-fun b!179310 () Bool)

(declare-fun e!118130 () Bool)

(assert (=> b!179310 (= e!118130 e!118129)))

(declare-fun res!84927 () Bool)

(assert (=> b!179310 (=> (not res!84927) (not e!118129))))

(assert (=> b!179310 (= res!84927 (contains!1216 lt!88623 (select (arr!3575 (_keys!5564 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))))))

(declare-fun b!179311 () Bool)

(assert (=> b!179311 (= e!118135 (not call!18119))))

(declare-fun bm!18118 () Bool)

(assert (=> bm!18118 (= call!18115 call!18116)))

(declare-fun b!179312 () Bool)

(declare-fun res!84924 () Bool)

(assert (=> b!179312 (=> (not res!84924) (not e!118138))))

(assert (=> b!179312 (= res!84924 e!118130)))

(declare-fun res!84925 () Bool)

(assert (=> b!179312 (=> res!84925 e!118130)))

(assert (=> b!179312 (= res!84925 (not e!118137))))

(declare-fun res!84923 () Bool)

(assert (=> b!179312 (=> (not res!84923) (not e!118137))))

(assert (=> b!179312 (= res!84923 (bvslt #b00000000000000000000000000000000 (size!3883 (_keys!5564 thiss!1248))))))

(declare-fun b!179313 () Bool)

(assert (=> b!179313 (= e!118131 e!118134)))

(declare-fun res!84926 () Bool)

(assert (=> b!179313 (= res!84926 call!18121)))

(assert (=> b!179313 (=> (not res!84926) (not e!118134))))

(assert (= (and d!54135 c!32153) b!179296))

(assert (= (and d!54135 (not c!32153)) b!179306))

(assert (= (and b!179306 c!32151) b!179299))

(assert (= (and b!179306 (not c!32151)) b!179295))

(assert (= (and b!179295 c!32155) b!179294))

(assert (= (and b!179295 (not c!32155)) b!179305))

(assert (= (or b!179294 b!179305) bm!18112))

(assert (= (or b!179299 bm!18112) bm!18117))

(assert (= (or b!179299 b!179294) bm!18118))

(assert (= (or b!179296 bm!18117) bm!18114))

(assert (= (or b!179296 bm!18118) bm!18113))

(assert (= (and d!54135 res!84930) b!179307))

(assert (= (and d!54135 c!32152) b!179304))

(assert (= (and d!54135 (not c!32152)) b!179300))

(assert (= (and d!54135 res!84931) b!179312))

(assert (= (and b!179312 res!84923) b!179293))

(assert (= (and b!179312 (not res!84925)) b!179310))

(assert (= (and b!179310 res!84927) b!179303))

(assert (= (and b!179312 res!84924) b!179298))

(assert (= (and b!179298 c!32154) b!179313))

(assert (= (and b!179298 (not c!32154)) b!179308))

(assert (= (and b!179313 res!84926) b!179309))

(assert (= (or b!179313 b!179308) bm!18115))

(assert (= (and b!179298 res!84929) b!179297))

(assert (= (and b!179297 c!32156) b!179301))

(assert (= (and b!179297 (not c!32156)) b!179311))

(assert (= (and b!179301 res!84928) b!179302))

(assert (= (or b!179301 b!179311) bm!18116))

(declare-fun b_lambda!7107 () Bool)

(assert (=> (not b_lambda!7107) (not b!179303)))

(declare-fun t!7115 () Bool)

(declare-fun tb!2803 () Bool)

(assert (=> (and b!179189 (= (defaultEntry!3679 thiss!1248) (defaultEntry!3679 thiss!1248)) t!7115) tb!2803))

(declare-fun result!4683 () Bool)

(assert (=> tb!2803 (= result!4683 tp_is_empty!4191)))

(assert (=> b!179303 t!7115))

(declare-fun b_and!10951 () Bool)

(assert (= b_and!10947 (and (=> t!7115 result!4683) b_and!10951)))

(declare-fun m!207573 () Bool)

(assert (=> b!179296 m!207573))

(declare-fun m!207575 () Bool)

(assert (=> b!179304 m!207575))

(declare-fun m!207577 () Bool)

(assert (=> b!179304 m!207577))

(declare-fun m!207579 () Bool)

(assert (=> b!179304 m!207579))

(declare-fun m!207581 () Bool)

(assert (=> b!179304 m!207581))

(declare-fun m!207583 () Bool)

(assert (=> b!179304 m!207583))

(assert (=> b!179304 m!207579))

(declare-fun m!207585 () Bool)

(assert (=> b!179304 m!207585))

(declare-fun m!207587 () Bool)

(assert (=> b!179304 m!207587))

(declare-fun m!207589 () Bool)

(assert (=> b!179304 m!207589))

(declare-fun m!207591 () Bool)

(assert (=> b!179304 m!207591))

(assert (=> b!179304 m!207589))

(declare-fun m!207593 () Bool)

(assert (=> b!179304 m!207593))

(declare-fun m!207595 () Bool)

(assert (=> b!179304 m!207595))

(assert (=> b!179304 m!207577))

(declare-fun m!207597 () Bool)

(assert (=> b!179304 m!207597))

(declare-fun m!207599 () Bool)

(assert (=> b!179304 m!207599))

(declare-fun m!207601 () Bool)

(assert (=> b!179304 m!207601))

(assert (=> b!179304 m!207547))

(assert (=> b!179304 m!207583))

(declare-fun m!207603 () Bool)

(assert (=> b!179304 m!207603))

(declare-fun m!207605 () Bool)

(assert (=> b!179304 m!207605))

(assert (=> b!179293 m!207547))

(assert (=> b!179293 m!207547))

(assert (=> b!179293 m!207557))

(assert (=> b!179307 m!207547))

(assert (=> b!179307 m!207547))

(assert (=> b!179307 m!207557))

(assert (=> bm!18114 m!207595))

(declare-fun m!207607 () Bool)

(assert (=> b!179302 m!207607))

(assert (=> d!54135 m!207513))

(declare-fun m!207609 () Bool)

(assert (=> bm!18116 m!207609))

(assert (=> b!179303 m!207547))

(assert (=> b!179303 m!207547))

(declare-fun m!207611 () Bool)

(assert (=> b!179303 m!207611))

(declare-fun m!207613 () Bool)

(assert (=> b!179303 m!207613))

(declare-fun m!207615 () Bool)

(assert (=> b!179303 m!207615))

(assert (=> b!179303 m!207615))

(assert (=> b!179303 m!207613))

(declare-fun m!207617 () Bool)

(assert (=> b!179303 m!207617))

(declare-fun m!207619 () Bool)

(assert (=> bm!18115 m!207619))

(declare-fun m!207621 () Bool)

(assert (=> b!179309 m!207621))

(declare-fun m!207623 () Bool)

(assert (=> bm!18113 m!207623))

(assert (=> b!179310 m!207547))

(assert (=> b!179310 m!207547))

(declare-fun m!207625 () Bool)

(assert (=> b!179310 m!207625))

(assert (=> b!179186 d!54135))

(declare-fun d!54137 () Bool)

(assert (=> d!54137 (= (validMask!0 (mask!8655 thiss!1248)) (and (or (= (mask!8655 thiss!1248) #b00000000000000000000000000000111) (= (mask!8655 thiss!1248) #b00000000000000000000000000001111) (= (mask!8655 thiss!1248) #b00000000000000000000000000011111) (= (mask!8655 thiss!1248) #b00000000000000000000000000111111) (= (mask!8655 thiss!1248) #b00000000000000000000000001111111) (= (mask!8655 thiss!1248) #b00000000000000000000000011111111) (= (mask!8655 thiss!1248) #b00000000000000000000000111111111) (= (mask!8655 thiss!1248) #b00000000000000000000001111111111) (= (mask!8655 thiss!1248) #b00000000000000000000011111111111) (= (mask!8655 thiss!1248) #b00000000000000000000111111111111) (= (mask!8655 thiss!1248) #b00000000000000000001111111111111) (= (mask!8655 thiss!1248) #b00000000000000000011111111111111) (= (mask!8655 thiss!1248) #b00000000000000000111111111111111) (= (mask!8655 thiss!1248) #b00000000000000001111111111111111) (= (mask!8655 thiss!1248) #b00000000000000011111111111111111) (= (mask!8655 thiss!1248) #b00000000000000111111111111111111) (= (mask!8655 thiss!1248) #b00000000000001111111111111111111) (= (mask!8655 thiss!1248) #b00000000000011111111111111111111) (= (mask!8655 thiss!1248) #b00000000000111111111111111111111) (= (mask!8655 thiss!1248) #b00000000001111111111111111111111) (= (mask!8655 thiss!1248) #b00000000011111111111111111111111) (= (mask!8655 thiss!1248) #b00000000111111111111111111111111) (= (mask!8655 thiss!1248) #b00000001111111111111111111111111) (= (mask!8655 thiss!1248) #b00000011111111111111111111111111) (= (mask!8655 thiss!1248) #b00000111111111111111111111111111) (= (mask!8655 thiss!1248) #b00001111111111111111111111111111) (= (mask!8655 thiss!1248) #b00011111111111111111111111111111) (= (mask!8655 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8655 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179182 d!54137))

(declare-fun d!54139 () Bool)

(declare-fun lt!88643 () SeekEntryResult!580)

(assert (=> d!54139 (and (or ((_ is Undefined!580) lt!88643) (not ((_ is Found!580) lt!88643)) (and (bvsge (index!4489 lt!88643) #b00000000000000000000000000000000) (bvslt (index!4489 lt!88643) (size!3883 (_keys!5564 thiss!1248))))) (or ((_ is Undefined!580) lt!88643) ((_ is Found!580) lt!88643) (not ((_ is MissingZero!580) lt!88643)) (and (bvsge (index!4488 lt!88643) #b00000000000000000000000000000000) (bvslt (index!4488 lt!88643) (size!3883 (_keys!5564 thiss!1248))))) (or ((_ is Undefined!580) lt!88643) ((_ is Found!580) lt!88643) ((_ is MissingZero!580) lt!88643) (not ((_ is MissingVacant!580) lt!88643)) (and (bvsge (index!4491 lt!88643) #b00000000000000000000000000000000) (bvslt (index!4491 lt!88643) (size!3883 (_keys!5564 thiss!1248))))) (or ((_ is Undefined!580) lt!88643) (ite ((_ is Found!580) lt!88643) (= (select (arr!3575 (_keys!5564 thiss!1248)) (index!4489 lt!88643)) key!828) (ite ((_ is MissingZero!580) lt!88643) (= (select (arr!3575 (_keys!5564 thiss!1248)) (index!4488 lt!88643)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!580) lt!88643) (= (select (arr!3575 (_keys!5564 thiss!1248)) (index!4491 lt!88643)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118149 () SeekEntryResult!580)

(assert (=> d!54139 (= lt!88643 e!118149)))

(declare-fun c!32164 () Bool)

(declare-fun lt!88641 () SeekEntryResult!580)

(assert (=> d!54139 (= c!32164 (and ((_ is Intermediate!580) lt!88641) (undefined!1392 lt!88641)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7545 (_ BitVec 32)) SeekEntryResult!580)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54139 (= lt!88641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8655 thiss!1248)) key!828 (_keys!5564 thiss!1248) (mask!8655 thiss!1248)))))

(assert (=> d!54139 (validMask!0 (mask!8655 thiss!1248))))

(assert (=> d!54139 (= (seekEntryOrOpen!0 key!828 (_keys!5564 thiss!1248) (mask!8655 thiss!1248)) lt!88643)))

(declare-fun b!179328 () Bool)

(declare-fun c!32163 () Bool)

(declare-fun lt!88642 () (_ BitVec 64))

(assert (=> b!179328 (= c!32163 (= lt!88642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118148 () SeekEntryResult!580)

(declare-fun e!118150 () SeekEntryResult!580)

(assert (=> b!179328 (= e!118148 e!118150)))

(declare-fun b!179329 () Bool)

(assert (=> b!179329 (= e!118149 Undefined!580)))

(declare-fun b!179330 () Bool)

(assert (=> b!179330 (= e!118148 (Found!580 (index!4490 lt!88641)))))

(declare-fun b!179331 () Bool)

(assert (=> b!179331 (= e!118149 e!118148)))

(assert (=> b!179331 (= lt!88642 (select (arr!3575 (_keys!5564 thiss!1248)) (index!4490 lt!88641)))))

(declare-fun c!32165 () Bool)

(assert (=> b!179331 (= c!32165 (= lt!88642 key!828))))

(declare-fun b!179332 () Bool)

(assert (=> b!179332 (= e!118150 (MissingZero!580 (index!4490 lt!88641)))))

(declare-fun b!179333 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7545 (_ BitVec 32)) SeekEntryResult!580)

(assert (=> b!179333 (= e!118150 (seekKeyOrZeroReturnVacant!0 (x!19600 lt!88641) (index!4490 lt!88641) (index!4490 lt!88641) key!828 (_keys!5564 thiss!1248) (mask!8655 thiss!1248)))))

(assert (= (and d!54139 c!32164) b!179329))

(assert (= (and d!54139 (not c!32164)) b!179331))

(assert (= (and b!179331 c!32165) b!179330))

(assert (= (and b!179331 (not c!32165)) b!179328))

(assert (= (and b!179328 c!32163) b!179332))

(assert (= (and b!179328 (not c!32163)) b!179333))

(declare-fun m!207627 () Bool)

(assert (=> d!54139 m!207627))

(declare-fun m!207629 () Bool)

(assert (=> d!54139 m!207629))

(declare-fun m!207631 () Bool)

(assert (=> d!54139 m!207631))

(declare-fun m!207633 () Bool)

(assert (=> d!54139 m!207633))

(assert (=> d!54139 m!207627))

(declare-fun m!207635 () Bool)

(assert (=> d!54139 m!207635))

(assert (=> d!54139 m!207513))

(declare-fun m!207637 () Bool)

(assert (=> b!179331 m!207637))

(declare-fun m!207639 () Bool)

(assert (=> b!179333 m!207639))

(assert (=> b!179187 d!54139))

(declare-fun mapNonEmpty!7177 () Bool)

(declare-fun mapRes!7177 () Bool)

(declare-fun tp!15988 () Bool)

(declare-fun e!118155 () Bool)

(assert (=> mapNonEmpty!7177 (= mapRes!7177 (and tp!15988 e!118155))))

(declare-fun mapValue!7177 () ValueCell!1752)

(declare-fun mapRest!7177 () (Array (_ BitVec 32) ValueCell!1752))

(declare-fun mapKey!7177 () (_ BitVec 32))

(assert (=> mapNonEmpty!7177 (= mapRest!7171 (store mapRest!7177 mapKey!7177 mapValue!7177))))

(declare-fun condMapEmpty!7177 () Bool)

(declare-fun mapDefault!7177 () ValueCell!1752)

(assert (=> mapNonEmpty!7171 (= condMapEmpty!7177 (= mapRest!7171 ((as const (Array (_ BitVec 32) ValueCell!1752)) mapDefault!7177)))))

(declare-fun e!118156 () Bool)

(assert (=> mapNonEmpty!7171 (= tp!15979 (and e!118156 mapRes!7177))))

(declare-fun b!179340 () Bool)

(assert (=> b!179340 (= e!118155 tp_is_empty!4191)))

(declare-fun b!179341 () Bool)

(assert (=> b!179341 (= e!118156 tp_is_empty!4191)))

(declare-fun mapIsEmpty!7177 () Bool)

(assert (=> mapIsEmpty!7177 mapRes!7177))

(assert (= (and mapNonEmpty!7171 condMapEmpty!7177) mapIsEmpty!7177))

(assert (= (and mapNonEmpty!7171 (not condMapEmpty!7177)) mapNonEmpty!7177))

(assert (= (and mapNonEmpty!7177 ((_ is ValueCellFull!1752) mapValue!7177)) b!179340))

(assert (= (and mapNonEmpty!7171 ((_ is ValueCellFull!1752) mapDefault!7177)) b!179341))

(declare-fun m!207641 () Bool)

(assert (=> mapNonEmpty!7177 m!207641))

(declare-fun b_lambda!7109 () Bool)

(assert (= b_lambda!7107 (or (and b!179189 b_free!4419) b_lambda!7109)))

(check-sat (not b!179309) (not mapNonEmpty!7177) (not b!179304) (not b!179248) (not b_next!4419) (not bm!18114) (not b!179240) (not b_lambda!7109) (not d!54135) (not b!179229) (not d!54133) (not d!54139) (not b!179310) (not b!179333) (not b!179231) (not b!179241) (not bm!18115) (not bm!18116) (not b!179296) (not b!179239) tp_is_empty!4191 (not d!54127) (not b!179293) b_and!10951 (not b!179302) (not bm!18097) (not b!179250) (not b!179303) (not b!179307) (not bm!18113))
(check-sat b_and!10951 (not b_next!4419))
