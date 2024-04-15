; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75348 () Bool)

(assert start!75348)

(declare-fun b!887297 () Bool)

(declare-fun b_free!15517 () Bool)

(declare-fun b_next!15517 () Bool)

(assert (=> b!887297 (= b_free!15517 (not b_next!15517))))

(declare-fun tp!54490 () Bool)

(declare-fun b_and!25711 () Bool)

(assert (=> b!887297 (= tp!54490 b_and!25711)))

(declare-fun b!887293 () Bool)

(declare-fun e!494131 () Bool)

(declare-fun tp_is_empty!17845 () Bool)

(assert (=> b!887293 (= e!494131 tp_is_empty!17845)))

(declare-fun b!887294 () Bool)

(declare-fun e!494128 () Bool)

(declare-fun e!494124 () Bool)

(declare-fun mapRes!28291 () Bool)

(assert (=> b!887294 (= e!494128 (and e!494124 mapRes!28291))))

(declare-fun condMapEmpty!28291 () Bool)

(declare-datatypes ((V!28759 0))(
  ( (V!28760 (val!8973 Int)) )
))
(declare-datatypes ((ValueCell!8441 0))(
  ( (ValueCellFull!8441 (v!11422 V!28759)) (EmptyCell!8441) )
))
(declare-datatypes ((array!51635 0))(
  ( (array!51636 (arr!24833 (Array (_ BitVec 32) ValueCell!8441)) (size!25275 (_ BitVec 32))) )
))
(declare-datatypes ((array!51637 0))(
  ( (array!51638 (arr!24834 (Array (_ BitVec 32) (_ BitVec 64))) (size!25276 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3898 0))(
  ( (LongMapFixedSize!3899 (defaultEntry!5140 Int) (mask!25533 (_ BitVec 32)) (extraKeys!4834 (_ BitVec 32)) (zeroValue!4938 V!28759) (minValue!4938 V!28759) (_size!2004 (_ BitVec 32)) (_keys!9812 array!51637) (_values!5125 array!51635) (_vacant!2004 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1050 0))(
  ( (Cell!1051 (v!11423 LongMapFixedSize!3898)) )
))
(declare-datatypes ((LongMap!1050 0))(
  ( (LongMap!1051 (underlying!536 Cell!1050)) )
))
(declare-fun thiss!833 () LongMap!1050)

(declare-fun mapDefault!28291 () ValueCell!8441)

(assert (=> b!887294 (= condMapEmpty!28291 (= (arr!24833 (_values!5125 (v!11423 (underlying!536 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8441)) mapDefault!28291)))))

(declare-fun b!887295 () Bool)

(assert (=> b!887295 (= e!494124 tp_is_empty!17845)))

(declare-fun b!887296 () Bool)

(declare-fun e!494126 () Bool)

(declare-fun e!494129 () Bool)

(assert (=> b!887296 (= e!494126 e!494129)))

(declare-fun c!93638 () Bool)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4282 (LongMap!1050 (_ BitVec 64)) Bool)

(assert (=> b!887296 (= c!93638 (contains!4282 thiss!833 key!673))))

(declare-fun lt!401175 () V!28759)

(declare-fun apply!394 (LongMapFixedSize!3898 (_ BitVec 64)) V!28759)

(assert (=> b!887296 (= lt!401175 (apply!394 (v!11423 (underlying!536 thiss!833)) key!673))))

(declare-fun e!494130 () Bool)

(declare-fun array_inv!19596 (array!51637) Bool)

(declare-fun array_inv!19597 (array!51635) Bool)

(assert (=> b!887297 (= e!494130 (and tp!54490 tp_is_empty!17845 (array_inv!19596 (_keys!9812 (v!11423 (underlying!536 thiss!833)))) (array_inv!19597 (_values!5125 (v!11423 (underlying!536 thiss!833)))) e!494128))))

(declare-fun res!602055 () Bool)

(assert (=> start!75348 (=> (not res!602055) (not e!494126))))

(declare-fun valid!1526 (LongMap!1050) Bool)

(assert (=> start!75348 (= res!602055 (valid!1526 thiss!833))))

(assert (=> start!75348 e!494126))

(declare-fun e!494123 () Bool)

(assert (=> start!75348 e!494123))

(assert (=> start!75348 true))

(declare-fun mapIsEmpty!28291 () Bool)

(assert (=> mapIsEmpty!28291 mapRes!28291))

(declare-fun b!887298 () Bool)

(declare-datatypes ((Option!438 0))(
  ( (Some!437 (v!11424 V!28759)) (None!436) )
))
(declare-fun get!13129 (Option!438) V!28759)

(declare-datatypes ((tuple2!11940 0))(
  ( (tuple2!11941 (_1!5981 (_ BitVec 64)) (_2!5981 V!28759)) )
))
(declare-datatypes ((List!17689 0))(
  ( (Nil!17686) (Cons!17685 (h!18816 tuple2!11940) (t!24969 List!17689)) )
))
(declare-fun getValueByKey!432 (List!17689 (_ BitVec 64)) Option!438)

(declare-datatypes ((ListLongMap!10627 0))(
  ( (ListLongMap!10628 (toList!5329 List!17689)) )
))
(declare-fun map!12067 (LongMap!1050) ListLongMap!10627)

(assert (=> b!887298 (= e!494129 (not (= lt!401175 (get!13129 (getValueByKey!432 (toList!5329 (map!12067 thiss!833)) key!673)))))))

(declare-fun mapNonEmpty!28291 () Bool)

(declare-fun tp!54489 () Bool)

(assert (=> mapNonEmpty!28291 (= mapRes!28291 (and tp!54489 e!494131))))

(declare-fun mapValue!28291 () ValueCell!8441)

(declare-fun mapRest!28291 () (Array (_ BitVec 32) ValueCell!8441))

(declare-fun mapKey!28291 () (_ BitVec 32))

(assert (=> mapNonEmpty!28291 (= (arr!24833 (_values!5125 (v!11423 (underlying!536 thiss!833)))) (store mapRest!28291 mapKey!28291 mapValue!28291))))

(declare-fun b!887299 () Bool)

(declare-fun e!494127 () Bool)

(assert (=> b!887299 (= e!494123 e!494127)))

(declare-fun b!887300 () Bool)

(assert (=> b!887300 (= e!494127 e!494130)))

(declare-fun b!887301 () Bool)

(declare-fun dynLambda!1286 (Int (_ BitVec 64)) V!28759)

(assert (=> b!887301 (= e!494129 (not (= lt!401175 (dynLambda!1286 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) key!673))))))

(assert (= (and start!75348 res!602055) b!887296))

(assert (= (and b!887296 c!93638) b!887298))

(assert (= (and b!887296 (not c!93638)) b!887301))

(assert (= (and b!887294 condMapEmpty!28291) mapIsEmpty!28291))

(assert (= (and b!887294 (not condMapEmpty!28291)) mapNonEmpty!28291))

(get-info :version)

(assert (= (and mapNonEmpty!28291 ((_ is ValueCellFull!8441) mapValue!28291)) b!887293))

(assert (= (and b!887294 ((_ is ValueCellFull!8441) mapDefault!28291)) b!887295))

(assert (= b!887297 b!887294))

(assert (= b!887300 b!887297))

(assert (= b!887299 b!887300))

(assert (= start!75348 b!887299))

(declare-fun b_lambda!12829 () Bool)

(assert (=> (not b_lambda!12829) (not b!887301)))

(declare-fun t!24968 () Bool)

(declare-fun tb!5131 () Bool)

(assert (=> (and b!887297 (= (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) (defaultEntry!5140 (v!11423 (underlying!536 thiss!833)))) t!24968) tb!5131))

(declare-fun result!9965 () Bool)

(assert (=> tb!5131 (= result!9965 tp_is_empty!17845)))

(assert (=> b!887301 t!24968))

(declare-fun b_and!25713 () Bool)

(assert (= b_and!25711 (and (=> t!24968 result!9965) b_and!25713)))

(declare-fun m!826387 () Bool)

(assert (=> b!887301 m!826387))

(declare-fun m!826389 () Bool)

(assert (=> mapNonEmpty!28291 m!826389))

(declare-fun m!826391 () Bool)

(assert (=> start!75348 m!826391))

(declare-fun m!826393 () Bool)

(assert (=> b!887296 m!826393))

(declare-fun m!826395 () Bool)

(assert (=> b!887296 m!826395))

(declare-fun m!826397 () Bool)

(assert (=> b!887297 m!826397))

(declare-fun m!826399 () Bool)

(assert (=> b!887297 m!826399))

(declare-fun m!826401 () Bool)

(assert (=> b!887298 m!826401))

(declare-fun m!826403 () Bool)

(assert (=> b!887298 m!826403))

(assert (=> b!887298 m!826403))

(declare-fun m!826405 () Bool)

(assert (=> b!887298 m!826405))

(check-sat (not b_lambda!12829) (not b_next!15517) tp_is_empty!17845 (not b!887296) (not start!75348) (not mapNonEmpty!28291) b_and!25713 (not b!887298) (not b!887297))
(check-sat b_and!25713 (not b_next!15517))
(get-model)

(declare-fun b_lambda!12835 () Bool)

(assert (= b_lambda!12829 (or (and b!887297 b_free!15517) b_lambda!12835)))

(check-sat (not b_next!15517) (not b_lambda!12835) tp_is_empty!17845 (not b!887296) (not start!75348) (not mapNonEmpty!28291) b_and!25713 (not b!887298) (not b!887297))
(check-sat b_and!25713 (not b_next!15517))
(get-model)

(declare-fun d!109745 () Bool)

(assert (=> d!109745 (= (array_inv!19596 (_keys!9812 (v!11423 (underlying!536 thiss!833)))) (bvsge (size!25276 (_keys!9812 (v!11423 (underlying!536 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887297 d!109745))

(declare-fun d!109747 () Bool)

(assert (=> d!109747 (= (array_inv!19597 (_values!5125 (v!11423 (underlying!536 thiss!833)))) (bvsge (size!25275 (_values!5125 (v!11423 (underlying!536 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887297 d!109747))

(declare-fun d!109749 () Bool)

(declare-fun lt!401184 () Bool)

(declare-fun contains!4283 (ListLongMap!10627 (_ BitVec 64)) Bool)

(assert (=> d!109749 (= lt!401184 (contains!4283 (map!12067 thiss!833) key!673))))

(declare-fun contains!4284 (LongMapFixedSize!3898 (_ BitVec 64)) Bool)

(assert (=> d!109749 (= lt!401184 (contains!4284 (v!11423 (underlying!536 thiss!833)) key!673))))

(assert (=> d!109749 (valid!1526 thiss!833)))

(assert (=> d!109749 (= (contains!4282 thiss!833 key!673) lt!401184)))

(declare-fun bs!24848 () Bool)

(assert (= bs!24848 d!109749))

(assert (=> bs!24848 m!826401))

(assert (=> bs!24848 m!826401))

(declare-fun m!826447 () Bool)

(assert (=> bs!24848 m!826447))

(declare-fun m!826449 () Bool)

(assert (=> bs!24848 m!826449))

(assert (=> bs!24848 m!826391))

(assert (=> b!887296 d!109749))

(declare-fun b!887398 () Bool)

(declare-fun e!494209 () V!28759)

(declare-fun e!494212 () V!28759)

(assert (=> b!887398 (= e!494209 e!494212)))

(declare-fun c!93663 () Bool)

(assert (=> b!887398 (= c!93663 (and (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!887399 () Bool)

(declare-fun e!494210 () Bool)

(declare-fun e!494208 () Bool)

(assert (=> b!887399 (= e!494210 e!494208)))

(declare-fun res!602072 () Bool)

(assert (=> b!887399 (= res!602072 (not (= (bvand (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887399 (=> (not res!602072) (not e!494208))))

(declare-fun b!887400 () Bool)

(declare-fun e!494215 () V!28759)

(assert (=> b!887400 (= e!494215 (dynLambda!1286 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) key!673))))

(declare-fun b!887401 () Bool)

(declare-fun call!39367 () V!28759)

(assert (=> b!887401 (= e!494208 (= call!39367 (zeroValue!4938 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun b!887402 () Bool)

(declare-fun lt!401214 () V!28759)

(declare-fun e!494216 () Bool)

(declare-fun map!12069 (LongMapFixedSize!3898) ListLongMap!10627)

(assert (=> b!887402 (= e!494216 (= lt!401214 (get!13129 (getValueByKey!432 (toList!5329 (map!12069 (v!11423 (underlying!536 thiss!833)))) key!673))))))

(declare-fun b!887403 () Bool)

(declare-fun res!602071 () Bool)

(declare-fun e!494213 () Bool)

(assert (=> b!887403 (=> (not res!602071) (not e!494213))))

(declare-fun arrayContainsKey!0 (array!51637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!887403 (= res!602071 (arrayContainsKey!0 (_keys!9812 (v!11423 (underlying!536 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun e!494214 () Bool)

(assert (=> b!887403 (= e!494214 e!494213)))

(declare-fun b!887404 () Bool)

(assert (=> b!887404 (= e!494209 e!494215)))

(declare-datatypes ((SeekEntryResult!8760 0))(
  ( (MissingZero!8760 (index!37411 (_ BitVec 32))) (Found!8760 (index!37412 (_ BitVec 32))) (Intermediate!8760 (undefined!9572 Bool) (index!37413 (_ BitVec 32)) (x!75263 (_ BitVec 32))) (Undefined!8760) (MissingVacant!8760 (index!37414 (_ BitVec 32))) )
))
(declare-fun lt!401207 () SeekEntryResult!8760)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51637 (_ BitVec 32)) SeekEntryResult!8760)

(assert (=> b!887404 (= lt!401207 (seekEntry!0 key!673 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833)))))))

(declare-datatypes ((Unit!30195 0))(
  ( (Unit!30196) )
))
(declare-fun lt!401215 () Unit!30195)

(declare-fun lemmaSeekEntryGivesInRangeIndex!2 (array!51637 array!51635 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 64)) Unit!30195)

(assert (=> b!887404 (= lt!401215 (lemmaSeekEntryGivesInRangeIndex!2 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (_values!5125 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833))) (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) (zeroValue!4938 (v!11423 (underlying!536 thiss!833))) (minValue!4938 (v!11423 (underlying!536 thiss!833))) key!673))))

(declare-fun lt!401209 () SeekEntryResult!8760)

(assert (=> b!887404 (= lt!401209 (seekEntry!0 key!673 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun res!602070 () Bool)

(assert (=> b!887404 (= res!602070 (not ((_ is Found!8760) lt!401209)))))

(declare-fun e!494217 () Bool)

(assert (=> b!887404 (=> res!602070 e!494217)))

(assert (=> b!887404 e!494217))

(declare-fun lt!401208 () Unit!30195)

(assert (=> b!887404 (= lt!401208 lt!401215)))

(declare-fun c!93665 () Bool)

(assert (=> b!887404 (= c!93665 ((_ is Found!8760) lt!401207))))

(declare-fun b!887405 () Bool)

(assert (=> b!887405 (= e!494216 (= lt!401214 (dynLambda!1286 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) key!673)))))

(declare-fun b!887406 () Bool)

(assert (=> b!887406 (= e!494210 e!494214)))

(declare-fun c!93659 () Bool)

(assert (=> b!887406 (= c!93659 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!109751 () Bool)

(assert (=> d!109751 e!494216))

(declare-fun c!93664 () Bool)

(assert (=> d!109751 (= c!93664 (contains!4284 (v!11423 (underlying!536 thiss!833)) key!673))))

(assert (=> d!109751 (= lt!401214 e!494209)))

(declare-fun c!93660 () Bool)

(assert (=> d!109751 (= c!93660 (= key!673 (bvneg key!673)))))

(declare-fun valid!1529 (LongMapFixedSize!3898) Bool)

(assert (=> d!109751 (valid!1529 (v!11423 (underlying!536 thiss!833)))))

(assert (=> d!109751 (= (apply!394 (v!11423 (underlying!536 thiss!833)) key!673) lt!401214)))

(declare-fun b!887407 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!887407 (= e!494217 (inRange!0 (index!37412 lt!401209) (mask!25533 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun bm!39362 () Bool)

(declare-fun call!39366 () V!28759)

(assert (=> bm!39362 (= call!39366 call!39367)))

(declare-fun b!887408 () Bool)

(declare-fun res!602073 () Bool)

(declare-fun e!494211 () Bool)

(assert (=> b!887408 (=> (not res!602073) (not e!494211))))

(assert (=> b!887408 (= res!602073 (not (= (bvand (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!887408 (= e!494214 e!494211)))

(declare-fun b!887409 () Bool)

(assert (=> b!887409 (= e!494212 (zeroValue!4938 (v!11423 (underlying!536 thiss!833))))))

(declare-fun c!93662 () Bool)

(declare-fun bm!39363 () Bool)

(declare-fun call!39368 () ListLongMap!10627)

(declare-fun call!39365 () ListLongMap!10627)

(declare-fun apply!395 (ListLongMap!10627 (_ BitVec 64)) V!28759)

(assert (=> bm!39363 (= call!39367 (apply!395 (ite c!93662 call!39368 call!39365) key!673))))

(declare-fun b!887410 () Bool)

(assert (=> b!887410 (= e!494211 (= call!39366 (minValue!4938 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun bm!39364 () Bool)

(assert (=> bm!39364 (= call!39365 call!39368)))

(declare-fun b!887411 () Bool)

(declare-fun e!494218 () V!28759)

(assert (=> b!887411 (= e!494218 (dynLambda!1286 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) key!673))))

(declare-fun b!887412 () Bool)

(declare-fun get!13131 (ValueCell!8441 V!28759) V!28759)

(assert (=> b!887412 (= e!494213 (= call!39366 (get!13131 (select (arr!24833 (_values!5125 (v!11423 (underlying!536 thiss!833)))) (index!37412 lt!401207)) (dynLambda!1286 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!887413 () Bool)

(declare-fun c!93661 () Bool)

(assert (=> b!887413 (= c!93661 (and (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!887413 (= e!494212 e!494218)))

(declare-fun bm!39365 () Bool)

(declare-fun getCurrentListMap!2564 (array!51637 array!51635 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 32) Int) ListLongMap!10627)

(assert (=> bm!39365 (= call!39368 (getCurrentListMap!2564 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (_values!5125 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833))) (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) (zeroValue!4938 (v!11423 (underlying!536 thiss!833))) (minValue!4938 (v!11423 (underlying!536 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun b!887414 () Bool)

(declare-fun lt!401210 () Unit!30195)

(declare-fun lt!401217 () Unit!30195)

(assert (=> b!887414 (= lt!401210 lt!401217)))

(assert (=> b!887414 e!494210))

(assert (=> b!887414 (= c!93662 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lemmaKeyInListMapThenSameValueInArray!2 (array!51637 array!51635 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 64) (_ BitVec 32) Int) Unit!30195)

(assert (=> b!887414 (= lt!401217 (lemmaKeyInListMapThenSameValueInArray!2 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (_values!5125 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833))) (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) (zeroValue!4938 (v!11423 (underlying!536 thiss!833))) (minValue!4938 (v!11423 (underlying!536 thiss!833))) key!673 (index!37412 lt!401207) (defaultEntry!5140 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun lt!401216 () Unit!30195)

(declare-fun lt!401211 () Unit!30195)

(assert (=> b!887414 (= lt!401216 lt!401211)))

(assert (=> b!887414 (contains!4283 (getCurrentListMap!2564 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (_values!5125 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833))) (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) (zeroValue!4938 (v!11423 (underlying!536 thiss!833))) (minValue!4938 (v!11423 (underlying!536 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833)))) (select (arr!24834 (_keys!9812 (v!11423 (underlying!536 thiss!833)))) (index!37412 lt!401207)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!200 (array!51637 array!51635 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 32) Int) Unit!30195)

(assert (=> b!887414 (= lt!401211 (lemmaValidKeyInArrayIsInListMap!200 (_keys!9812 (v!11423 (underlying!536 thiss!833))) (_values!5125 (v!11423 (underlying!536 thiss!833))) (mask!25533 (v!11423 (underlying!536 thiss!833))) (extraKeys!4834 (v!11423 (underlying!536 thiss!833))) (zeroValue!4938 (v!11423 (underlying!536 thiss!833))) (minValue!4938 (v!11423 (underlying!536 thiss!833))) (index!37412 lt!401207) (defaultEntry!5140 (v!11423 (underlying!536 thiss!833)))))))

(declare-fun lt!401213 () Unit!30195)

(declare-fun lt!401212 () Unit!30195)

(assert (=> b!887414 (= lt!401213 lt!401212)))

(assert (=> b!887414 (arrayContainsKey!0 (_keys!9812 (v!11423 (underlying!536 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51637 (_ BitVec 64) (_ BitVec 32)) Unit!30195)

(assert (=> b!887414 (= lt!401212 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9812 (v!11423 (underlying!536 thiss!833))) key!673 (index!37412 lt!401207)))))

(assert (=> b!887414 (= e!494215 (get!13131 (select (arr!24833 (_values!5125 (v!11423 (underlying!536 thiss!833)))) (index!37412 lt!401207)) (dynLambda!1286 (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!887415 () Bool)

(assert (=> b!887415 (= e!494218 (minValue!4938 (v!11423 (underlying!536 thiss!833))))))

(assert (= (and d!109751 c!93660) b!887398))

(assert (= (and d!109751 (not c!93660)) b!887404))

(assert (= (and b!887398 c!93663) b!887409))

(assert (= (and b!887398 (not c!93663)) b!887413))

(assert (= (and b!887413 c!93661) b!887415))

(assert (= (and b!887413 (not c!93661)) b!887411))

(assert (= (and b!887404 (not res!602070)) b!887407))

(assert (= (and b!887404 c!93665) b!887414))

(assert (= (and b!887404 (not c!93665)) b!887400))

(assert (= (and b!887414 c!93662) b!887399))

(assert (= (and b!887414 (not c!93662)) b!887406))

(assert (= (and b!887399 res!602072) b!887401))

(assert (= (and b!887406 c!93659) b!887408))

(assert (= (and b!887406 (not c!93659)) b!887403))

(assert (= (and b!887408 res!602073) b!887410))

(assert (= (and b!887403 res!602071) b!887412))

(assert (= (or b!887410 b!887412) bm!39364))

(assert (= (or b!887410 b!887412) bm!39362))

(assert (= (or b!887401 bm!39364) bm!39365))

(assert (= (or b!887401 bm!39362) bm!39363))

(assert (= (and d!109751 c!93664) b!887402))

(assert (= (and d!109751 (not c!93664)) b!887405))

(declare-fun b_lambda!12837 () Bool)

(assert (=> (not b_lambda!12837) (not b!887405)))

(assert (=> b!887405 t!24968))

(declare-fun b_and!25723 () Bool)

(assert (= b_and!25713 (and (=> t!24968 result!9965) b_and!25723)))

(declare-fun b_lambda!12839 () Bool)

(assert (=> (not b_lambda!12839) (not b!887414)))

(declare-fun t!24976 () Bool)

(declare-fun tb!5137 () Bool)

(assert (=> (and b!887297 (= (defaultEntry!5140 (v!11423 (underlying!536 thiss!833))) (defaultEntry!5140 (v!11423 (underlying!536 thiss!833)))) t!24976) tb!5137))

(declare-fun result!9977 () Bool)

(assert (=> tb!5137 (= result!9977 tp_is_empty!17845)))

(assert (=> b!887414 t!24976))

(declare-fun b_and!25725 () Bool)

(assert (= b_and!25723 (and (=> t!24976 result!9977) b_and!25725)))

(declare-fun b_lambda!12841 () Bool)

(assert (=> (not b_lambda!12841) (not b!887411)))

(assert (=> b!887411 t!24968))

(declare-fun b_and!25727 () Bool)

(assert (= b_and!25725 (and (=> t!24968 result!9965) b_and!25727)))

(declare-fun b_lambda!12843 () Bool)

(assert (=> (not b_lambda!12843) (not b!887400)))

(assert (=> b!887400 t!24968))

(declare-fun b_and!25729 () Bool)

(assert (= b_and!25727 (and (=> t!24968 result!9965) b_and!25729)))

(declare-fun b_lambda!12845 () Bool)

(assert (=> (not b_lambda!12845) (not b!887412)))

(assert (=> b!887412 t!24976))

(declare-fun b_and!25731 () Bool)

(assert (= b_and!25729 (and (=> t!24976 result!9977) b_and!25731)))

(declare-fun m!826451 () Bool)

(assert (=> b!887402 m!826451))

(declare-fun m!826453 () Bool)

(assert (=> b!887402 m!826453))

(assert (=> b!887402 m!826453))

(declare-fun m!826455 () Bool)

(assert (=> b!887402 m!826455))

(declare-fun m!826457 () Bool)

(assert (=> b!887403 m!826457))

(assert (=> b!887400 m!826387))

(declare-fun m!826459 () Bool)

(assert (=> bm!39363 m!826459))

(assert (=> d!109751 m!826449))

(declare-fun m!826461 () Bool)

(assert (=> d!109751 m!826461))

(assert (=> b!887411 m!826387))

(declare-fun m!826463 () Bool)

(assert (=> b!887404 m!826463))

(declare-fun m!826465 () Bool)

(assert (=> b!887404 m!826465))

(declare-fun m!826467 () Bool)

(assert (=> b!887414 m!826467))

(declare-fun m!826469 () Bool)

(assert (=> b!887414 m!826469))

(declare-fun m!826471 () Bool)

(assert (=> b!887414 m!826471))

(declare-fun m!826473 () Bool)

(assert (=> b!887414 m!826473))

(assert (=> b!887414 m!826471))

(declare-fun m!826475 () Bool)

(assert (=> b!887414 m!826475))

(assert (=> b!887414 m!826457))

(declare-fun m!826477 () Bool)

(assert (=> b!887414 m!826477))

(assert (=> b!887414 m!826473))

(declare-fun m!826479 () Bool)

(assert (=> b!887414 m!826479))

(declare-fun m!826481 () Bool)

(assert (=> b!887414 m!826481))

(declare-fun m!826483 () Bool)

(assert (=> b!887414 m!826483))

(assert (=> b!887414 m!826479))

(assert (=> b!887414 m!826481))

(declare-fun m!826485 () Bool)

(assert (=> b!887407 m!826485))

(assert (=> b!887405 m!826387))

(assert (=> b!887412 m!826473))

(assert (=> b!887412 m!826471))

(assert (=> b!887412 m!826473))

(assert (=> b!887412 m!826471))

(assert (=> b!887412 m!826475))

(assert (=> bm!39365 m!826479))

(assert (=> b!887296 d!109751))

(declare-fun d!109753 () Bool)

(assert (=> d!109753 (= (get!13129 (getValueByKey!432 (toList!5329 (map!12067 thiss!833)) key!673)) (v!11424 (getValueByKey!432 (toList!5329 (map!12067 thiss!833)) key!673)))))

(assert (=> b!887298 d!109753))

(declare-fun b!887427 () Bool)

(declare-fun e!494224 () Option!438)

(assert (=> b!887427 (= e!494224 None!436)))

(declare-fun d!109755 () Bool)

(declare-fun c!93670 () Bool)

(assert (=> d!109755 (= c!93670 (and ((_ is Cons!17685) (toList!5329 (map!12067 thiss!833))) (= (_1!5981 (h!18816 (toList!5329 (map!12067 thiss!833)))) key!673)))))

(declare-fun e!494223 () Option!438)

(assert (=> d!109755 (= (getValueByKey!432 (toList!5329 (map!12067 thiss!833)) key!673) e!494223)))

(declare-fun b!887424 () Bool)

(assert (=> b!887424 (= e!494223 (Some!437 (_2!5981 (h!18816 (toList!5329 (map!12067 thiss!833))))))))

(declare-fun b!887426 () Bool)

(assert (=> b!887426 (= e!494224 (getValueByKey!432 (t!24969 (toList!5329 (map!12067 thiss!833))) key!673))))

(declare-fun b!887425 () Bool)

(assert (=> b!887425 (= e!494223 e!494224)))

(declare-fun c!93671 () Bool)

(assert (=> b!887425 (= c!93671 (and ((_ is Cons!17685) (toList!5329 (map!12067 thiss!833))) (not (= (_1!5981 (h!18816 (toList!5329 (map!12067 thiss!833)))) key!673))))))

(assert (= (and d!109755 c!93670) b!887424))

(assert (= (and d!109755 (not c!93670)) b!887425))

(assert (= (and b!887425 c!93671) b!887426))

(assert (= (and b!887425 (not c!93671)) b!887427))

(declare-fun m!826487 () Bool)

(assert (=> b!887426 m!826487))

(assert (=> b!887298 d!109755))

(declare-fun d!109757 () Bool)

(assert (=> d!109757 (= (map!12067 thiss!833) (map!12069 (v!11423 (underlying!536 thiss!833))))))

(declare-fun bs!24849 () Bool)

(assert (= bs!24849 d!109757))

(assert (=> bs!24849 m!826451))

(assert (=> b!887298 d!109757))

(declare-fun d!109759 () Bool)

(assert (=> d!109759 (= (valid!1526 thiss!833) (valid!1529 (v!11423 (underlying!536 thiss!833))))))

(declare-fun bs!24850 () Bool)

(assert (= bs!24850 d!109759))

(assert (=> bs!24850 m!826461))

(assert (=> start!75348 d!109759))

(declare-fun b!887434 () Bool)

(declare-fun e!494230 () Bool)

(assert (=> b!887434 (= e!494230 tp_is_empty!17845)))

(declare-fun condMapEmpty!28300 () Bool)

(declare-fun mapDefault!28300 () ValueCell!8441)

(assert (=> mapNonEmpty!28291 (= condMapEmpty!28300 (= mapRest!28291 ((as const (Array (_ BitVec 32) ValueCell!8441)) mapDefault!28300)))))

(declare-fun e!494229 () Bool)

(declare-fun mapRes!28300 () Bool)

(assert (=> mapNonEmpty!28291 (= tp!54489 (and e!494229 mapRes!28300))))

(declare-fun mapIsEmpty!28300 () Bool)

(assert (=> mapIsEmpty!28300 mapRes!28300))

(declare-fun b!887435 () Bool)

(assert (=> b!887435 (= e!494229 tp_is_empty!17845)))

(declare-fun mapNonEmpty!28300 () Bool)

(declare-fun tp!54505 () Bool)

(assert (=> mapNonEmpty!28300 (= mapRes!28300 (and tp!54505 e!494230))))

(declare-fun mapKey!28300 () (_ BitVec 32))

(declare-fun mapValue!28300 () ValueCell!8441)

(declare-fun mapRest!28300 () (Array (_ BitVec 32) ValueCell!8441))

(assert (=> mapNonEmpty!28300 (= mapRest!28291 (store mapRest!28300 mapKey!28300 mapValue!28300))))

(assert (= (and mapNonEmpty!28291 condMapEmpty!28300) mapIsEmpty!28300))

(assert (= (and mapNonEmpty!28291 (not condMapEmpty!28300)) mapNonEmpty!28300))

(assert (= (and mapNonEmpty!28300 ((_ is ValueCellFull!8441) mapValue!28300)) b!887434))

(assert (= (and mapNonEmpty!28291 ((_ is ValueCellFull!8441) mapDefault!28300)) b!887435))

(declare-fun m!826489 () Bool)

(assert (=> mapNonEmpty!28300 m!826489))

(declare-fun b_lambda!12847 () Bool)

(assert (= b_lambda!12837 (or (and b!887297 b_free!15517) b_lambda!12847)))

(declare-fun b_lambda!12849 () Bool)

(assert (= b_lambda!12845 (or (and b!887297 b_free!15517) b_lambda!12849)))

(declare-fun b_lambda!12851 () Bool)

(assert (= b_lambda!12839 (or (and b!887297 b_free!15517) b_lambda!12851)))

(declare-fun b_lambda!12853 () Bool)

(assert (= b_lambda!12841 (or (and b!887297 b_free!15517) b_lambda!12853)))

(declare-fun b_lambda!12855 () Bool)

(assert (= b_lambda!12843 (or (and b!887297 b_free!15517) b_lambda!12855)))

(check-sat (not b!887412) (not b_next!15517) tp_is_empty!17845 (not b_lambda!12855) (not d!109749) (not b!887414) (not bm!39363) (not b_lambda!12847) (not mapNonEmpty!28300) (not b_lambda!12851) (not b_lambda!12849) (not b_lambda!12853) (not d!109751) (not bm!39365) b_and!25731 (not b!887403) (not b!887404) (not d!109757) (not b!887402) (not b_lambda!12835) (not b!887407) (not d!109759) (not b!887426))
(check-sat b_and!25731 (not b_next!15517))
