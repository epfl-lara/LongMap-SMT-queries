; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75840 () Bool)

(assert start!75840)

(declare-fun b!892480 () Bool)

(declare-fun b_free!15829 () Bool)

(declare-fun b_next!15829 () Bool)

(assert (=> b!892480 (= b_free!15829 (not b_next!15829))))

(declare-fun tp!55456 () Bool)

(declare-fun b_and!26055 () Bool)

(assert (=> b!892480 (= tp!55456 b_and!26055)))

(declare-fun mapIsEmpty!28790 () Bool)

(declare-fun mapRes!28790 () Bool)

(assert (=> mapIsEmpty!28790 mapRes!28790))

(declare-fun b!892479 () Bool)

(declare-fun e!498271 () Bool)

(declare-fun e!498263 () Bool)

(assert (=> b!892479 (= e!498271 e!498263)))

(declare-fun c!93921 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892479 (= c!93921 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!498264 () Bool)

(declare-fun e!498269 () Bool)

(declare-datatypes ((array!52277 0))(
  ( (array!52278 (arr!25145 (Array (_ BitVec 32) (_ BitVec 64))) (size!25591 (_ BitVec 32))) )
))
(declare-datatypes ((V!29175 0))(
  ( (V!29176 (val!9129 Int)) )
))
(declare-datatypes ((ValueCell!8597 0))(
  ( (ValueCellFull!8597 (v!11601 V!29175)) (EmptyCell!8597) )
))
(declare-datatypes ((array!52279 0))(
  ( (array!52280 (arr!25146 (Array (_ BitVec 32) ValueCell!8597)) (size!25592 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4210 0))(
  ( (LongMapFixedSize!4211 (defaultEntry!5302 Int) (mask!25812 (_ BitVec 32)) (extraKeys!4996 (_ BitVec 32)) (zeroValue!5100 V!29175) (minValue!5100 V!29175) (_size!2160 (_ BitVec 32)) (_keys!9980 array!52277) (_values!5287 array!52279) (_vacant!2160 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4210)

(declare-fun tp_is_empty!18157 () Bool)

(declare-fun array_inv!19810 (array!52277) Bool)

(declare-fun array_inv!19811 (array!52279) Bool)

(assert (=> b!892480 (= e!498269 (and tp!55456 tp_is_empty!18157 (array_inv!19810 (_keys!9980 thiss!1181)) (array_inv!19811 (_values!5287 thiss!1181)) e!498264))))

(declare-fun b!892481 () Bool)

(declare-fun e!498268 () Bool)

(assert (=> b!892481 (= e!498271 e!498268)))

(declare-fun res!604635 () Bool)

(assert (=> b!892481 (= res!604635 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892481 (=> (not res!604635) (not e!498268))))

(declare-fun bm!39522 () Bool)

(declare-fun call!39525 () V!29175)

(declare-fun call!39526 () V!29175)

(assert (=> bm!39522 (= call!39525 call!39526)))

(declare-fun b!892482 () Bool)

(declare-fun e!498267 () Bool)

(assert (=> b!892482 (= e!498267 tp_is_empty!18157)))

(declare-fun b!892483 () Bool)

(declare-fun res!604636 () Bool)

(declare-fun e!498273 () Bool)

(assert (=> b!892483 (=> (not res!604636) (not e!498273))))

(assert (=> b!892483 (= res!604636 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892483 (= e!498263 e!498273)))

(declare-fun bm!39523 () Bool)

(declare-datatypes ((tuple2!12022 0))(
  ( (tuple2!12023 (_1!6022 (_ BitVec 64)) (_2!6022 V!29175)) )
))
(declare-datatypes ((List!17797 0))(
  ( (Nil!17794) (Cons!17793 (h!18924 tuple2!12022) (t!25101 List!17797)) )
))
(declare-datatypes ((ListLongMap!10709 0))(
  ( (ListLongMap!10710 (toList!5370 List!17797)) )
))
(declare-fun lt!403077 () ListLongMap!10709)

(declare-fun apply!401 (ListLongMap!10709 (_ BitVec 64)) V!29175)

(assert (=> bm!39523 (= call!39526 (apply!401 lt!403077 key!785))))

(declare-fun b!892484 () Bool)

(declare-fun e!498265 () Bool)

(assert (=> b!892484 (= e!498264 (and e!498265 mapRes!28790))))

(declare-fun condMapEmpty!28790 () Bool)

(declare-fun mapDefault!28790 () ValueCell!8597)

(assert (=> b!892484 (= condMapEmpty!28790 (= (arr!25146 (_values!5287 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8597)) mapDefault!28790)))))

(declare-fun res!604637 () Bool)

(declare-fun e!498266 () Bool)

(assert (=> start!75840 (=> (not res!604637) (not e!498266))))

(declare-fun valid!1633 (LongMapFixedSize!4210) Bool)

(assert (=> start!75840 (= res!604637 (valid!1633 thiss!1181))))

(assert (=> start!75840 e!498266))

(assert (=> start!75840 e!498269))

(assert (=> start!75840 true))

(declare-fun b!892478 () Bool)

(assert (=> b!892478 (= e!498273 (= call!39525 (minValue!5100 thiss!1181)))))

(declare-fun mapNonEmpty!28790 () Bool)

(declare-fun tp!55457 () Bool)

(assert (=> mapNonEmpty!28790 (= mapRes!28790 (and tp!55457 e!498267))))

(declare-fun mapKey!28790 () (_ BitVec 32))

(declare-fun mapRest!28790 () (Array (_ BitVec 32) ValueCell!8597))

(declare-fun mapValue!28790 () ValueCell!8597)

(assert (=> mapNonEmpty!28790 (= (arr!25146 (_values!5287 thiss!1181)) (store mapRest!28790 mapKey!28790 mapValue!28790))))

(declare-fun b!892485 () Bool)

(assert (=> b!892485 (= e!498268 (= call!39526 (zeroValue!5100 thiss!1181)))))

(declare-fun b!892486 () Bool)

(declare-fun res!604632 () Bool)

(assert (=> b!892486 (=> (not res!604632) (not e!498266))))

(assert (=> b!892486 (= res!604632 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892487 () Bool)

(declare-fun e!498274 () Bool)

(declare-fun e!498275 () Bool)

(assert (=> b!892487 (= e!498274 e!498275)))

(declare-fun res!604633 () Bool)

(assert (=> b!892487 (=> res!604633 e!498275)))

(declare-fun contains!4343 (LongMapFixedSize!4210 (_ BitVec 64)) Bool)

(assert (=> b!892487 (= res!604633 (not (contains!4343 thiss!1181 key!785)))))

(assert (=> b!892487 e!498271))

(declare-fun c!93922 () Bool)

(assert (=> b!892487 (= c!93922 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!8858 0))(
  ( (MissingZero!8858 (index!37803 (_ BitVec 32))) (Found!8858 (index!37804 (_ BitVec 32))) (Intermediate!8858 (undefined!9670 Bool) (index!37805 (_ BitVec 32)) (x!75883 (_ BitVec 32))) (Undefined!8858) (MissingVacant!8858 (index!37806 (_ BitVec 32))) )
))
(declare-fun lt!403075 () SeekEntryResult!8858)

(declare-datatypes ((Unit!30348 0))(
  ( (Unit!30349) )
))
(declare-fun lt!403074 () Unit!30348)

(declare-fun lemmaKeyInListMapThenSameValueInArray!8 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64) (_ BitVec 32) Int) Unit!30348)

(assert (=> b!892487 (= lt!403074 (lemmaKeyInListMapThenSameValueInArray!8 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (index!37804 lt!403075) (defaultEntry!5302 thiss!1181)))))

(declare-fun contains!4344 (ListLongMap!10709 (_ BitVec 64)) Bool)

(assert (=> b!892487 (contains!4344 lt!403077 (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075)))))

(declare-fun getCurrentListMap!2596 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) ListLongMap!10709)

(assert (=> b!892487 (= lt!403077 (getCurrentListMap!2596 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403078 () Unit!30348)

(declare-fun lemmaValidKeyInArrayIsInListMap!232 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) Unit!30348)

(assert (=> b!892487 (= lt!403078 (lemmaValidKeyInArrayIsInListMap!232 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37804 lt!403075) (defaultEntry!5302 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892487 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403076 () Unit!30348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52277 (_ BitVec 64) (_ BitVec 32)) Unit!30348)

(assert (=> b!892487 (= lt!403076 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9980 thiss!1181) key!785 (index!37804 lt!403075)))))

(declare-fun b!892488 () Bool)

(declare-fun e!498272 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892488 (= e!498272 (inRange!0 (index!37804 lt!403075) (mask!25812 thiss!1181)))))

(declare-fun b!892489 () Bool)

(assert (=> b!892489 (= e!498266 (not e!498274))))

(declare-fun res!604634 () Bool)

(assert (=> b!892489 (=> res!604634 e!498274)))

(get-info :version)

(assert (=> b!892489 (= res!604634 (not ((_ is Found!8858) lt!403075)))))

(assert (=> b!892489 e!498272))

(declare-fun res!604638 () Bool)

(assert (=> b!892489 (=> res!604638 e!498272)))

(assert (=> b!892489 (= res!604638 (not ((_ is Found!8858) lt!403075)))))

(declare-fun lt!403079 () Unit!30348)

(declare-fun lemmaSeekEntryGivesInRangeIndex!57 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64)) Unit!30348)

(assert (=> b!892489 (= lt!403079 (lemmaSeekEntryGivesInRangeIndex!57 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52277 (_ BitVec 32)) SeekEntryResult!8858)

(assert (=> b!892489 (= lt!403075 (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun b!892490 () Bool)

(declare-datatypes ((Option!449 0))(
  ( (Some!448 (v!11602 V!29175)) (None!447) )
))
(declare-fun isDefined!324 (Option!449) Bool)

(declare-fun getValueByKey!443 (List!17797 (_ BitVec 64)) Option!449)

(declare-fun map!12185 (LongMapFixedSize!4210) ListLongMap!10709)

(assert (=> b!892490 (= e!498275 (isDefined!324 (getValueByKey!443 (toList!5370 (map!12185 thiss!1181)) key!785)))))

(declare-fun b!892491 () Bool)

(assert (=> b!892491 (= e!498265 tp_is_empty!18157)))

(declare-fun b!892492 () Bool)

(declare-fun get!13240 (ValueCell!8597 V!29175) V!29175)

(declare-fun dynLambda!1291 (Int (_ BitVec 64)) V!29175)

(assert (=> b!892492 (= e!498263 (= call!39525 (get!13240 (select (arr!25146 (_values!5287 thiss!1181)) (index!37804 lt!403075)) (dynLambda!1291 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!75840 res!604637) b!892486))

(assert (= (and b!892486 res!604632) b!892489))

(assert (= (and b!892489 (not res!604638)) b!892488))

(assert (= (and b!892489 (not res!604634)) b!892487))

(assert (= (and b!892487 c!93922) b!892481))

(assert (= (and b!892487 (not c!93922)) b!892479))

(assert (= (and b!892481 res!604635) b!892485))

(assert (= (and b!892479 c!93921) b!892483))

(assert (= (and b!892479 (not c!93921)) b!892492))

(assert (= (and b!892483 res!604636) b!892478))

(assert (= (or b!892478 b!892492) bm!39522))

(assert (= (or b!892485 bm!39522) bm!39523))

(assert (= (and b!892487 (not res!604633)) b!892490))

(assert (= (and b!892484 condMapEmpty!28790) mapIsEmpty!28790))

(assert (= (and b!892484 (not condMapEmpty!28790)) mapNonEmpty!28790))

(assert (= (and mapNonEmpty!28790 ((_ is ValueCellFull!8597) mapValue!28790)) b!892482))

(assert (= (and b!892484 ((_ is ValueCellFull!8597) mapDefault!28790)) b!892491))

(assert (= b!892480 b!892484))

(assert (= start!75840 b!892480))

(declare-fun b_lambda!12877 () Bool)

(assert (=> (not b_lambda!12877) (not b!892492)))

(declare-fun t!25100 () Bool)

(declare-fun tb!5155 () Bool)

(assert (=> (and b!892480 (= (defaultEntry!5302 thiss!1181) (defaultEntry!5302 thiss!1181)) t!25100) tb!5155))

(declare-fun result!10029 () Bool)

(assert (=> tb!5155 (= result!10029 tp_is_empty!18157)))

(assert (=> b!892492 t!25100))

(declare-fun b_and!26057 () Bool)

(assert (= b_and!26055 (and (=> t!25100 result!10029) b_and!26057)))

(declare-fun m!830167 () Bool)

(assert (=> mapNonEmpty!28790 m!830167))

(declare-fun m!830169 () Bool)

(assert (=> b!892490 m!830169))

(declare-fun m!830171 () Bool)

(assert (=> b!892490 m!830171))

(assert (=> b!892490 m!830171))

(declare-fun m!830173 () Bool)

(assert (=> b!892490 m!830173))

(declare-fun m!830175 () Bool)

(assert (=> b!892487 m!830175))

(declare-fun m!830177 () Bool)

(assert (=> b!892487 m!830177))

(declare-fun m!830179 () Bool)

(assert (=> b!892487 m!830179))

(declare-fun m!830181 () Bool)

(assert (=> b!892487 m!830181))

(declare-fun m!830183 () Bool)

(assert (=> b!892487 m!830183))

(declare-fun m!830185 () Bool)

(assert (=> b!892487 m!830185))

(declare-fun m!830187 () Bool)

(assert (=> b!892487 m!830187))

(declare-fun m!830189 () Bool)

(assert (=> b!892487 m!830189))

(assert (=> b!892487 m!830183))

(declare-fun m!830191 () Bool)

(assert (=> b!892489 m!830191))

(declare-fun m!830193 () Bool)

(assert (=> b!892489 m!830193))

(declare-fun m!830195 () Bool)

(assert (=> b!892492 m!830195))

(declare-fun m!830197 () Bool)

(assert (=> b!892492 m!830197))

(assert (=> b!892492 m!830195))

(assert (=> b!892492 m!830197))

(declare-fun m!830199 () Bool)

(assert (=> b!892492 m!830199))

(declare-fun m!830201 () Bool)

(assert (=> b!892480 m!830201))

(declare-fun m!830203 () Bool)

(assert (=> b!892480 m!830203))

(declare-fun m!830205 () Bool)

(assert (=> b!892488 m!830205))

(declare-fun m!830207 () Bool)

(assert (=> bm!39523 m!830207))

(declare-fun m!830209 () Bool)

(assert (=> start!75840 m!830209))

(check-sat (not mapNonEmpty!28790) b_and!26057 (not b!892487) (not b!892489) (not b_next!15829) (not b_lambda!12877) (not b!892490) (not b!892492) (not start!75840) (not b!892488) (not bm!39523) (not b!892480) tp_is_empty!18157)
(check-sat b_and!26057 (not b_next!15829))
(get-model)

(declare-fun b_lambda!12883 () Bool)

(assert (= b_lambda!12877 (or (and b!892480 b_free!15829) b_lambda!12883)))

(check-sat (not b_lambda!12883) (not mapNonEmpty!28790) b_and!26057 (not b!892487) (not b!892489) (not b_next!15829) (not b!892490) (not b!892492) (not start!75840) (not b!892488) (not bm!39523) (not b!892480) tp_is_empty!18157)
(check-sat b_and!26057 (not b_next!15829))
(get-model)

(declare-fun d!110041 () Bool)

(assert (=> d!110041 (= (array_inv!19810 (_keys!9980 thiss!1181)) (bvsge (size!25591 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892480 d!110041))

(declare-fun d!110043 () Bool)

(assert (=> d!110043 (= (array_inv!19811 (_values!5287 thiss!1181)) (bvsge (size!25592 (_values!5287 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892480 d!110043))

(declare-fun d!110045 () Bool)

(assert (=> d!110045 (= (inRange!0 (index!37804 lt!403075) (mask!25812 thiss!1181)) (and (bvsge (index!37804 lt!403075) #b00000000000000000000000000000000) (bvslt (index!37804 lt!403075) (bvadd (mask!25812 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!892488 d!110045))

(declare-fun d!110047 () Bool)

(declare-fun e!498359 () Bool)

(assert (=> d!110047 e!498359))

(declare-fun res!604683 () Bool)

(assert (=> d!110047 (=> res!604683 e!498359)))

(declare-fun lt!403126 () Bool)

(assert (=> d!110047 (= res!604683 (not lt!403126))))

(declare-fun lt!403125 () Bool)

(assert (=> d!110047 (= lt!403126 lt!403125)))

(declare-fun lt!403124 () Unit!30348)

(declare-fun e!498358 () Unit!30348)

(assert (=> d!110047 (= lt!403124 e!498358)))

(declare-fun c!93937 () Bool)

(assert (=> d!110047 (= c!93937 lt!403125)))

(declare-fun containsKey!421 (List!17797 (_ BitVec 64)) Bool)

(assert (=> d!110047 (= lt!403125 (containsKey!421 (toList!5370 lt!403077) (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075))))))

(assert (=> d!110047 (= (contains!4344 lt!403077 (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075))) lt!403126)))

(declare-fun b!892595 () Bool)

(declare-fun lt!403127 () Unit!30348)

(assert (=> b!892595 (= e!498358 lt!403127)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!316 (List!17797 (_ BitVec 64)) Unit!30348)

(assert (=> b!892595 (= lt!403127 (lemmaContainsKeyImpliesGetValueByKeyDefined!316 (toList!5370 lt!403077) (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075))))))

(assert (=> b!892595 (isDefined!324 (getValueByKey!443 (toList!5370 lt!403077) (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075))))))

(declare-fun b!892596 () Bool)

(declare-fun Unit!30352 () Unit!30348)

(assert (=> b!892596 (= e!498358 Unit!30352)))

(declare-fun b!892597 () Bool)

(assert (=> b!892597 (= e!498359 (isDefined!324 (getValueByKey!443 (toList!5370 lt!403077) (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075)))))))

(assert (= (and d!110047 c!93937) b!892595))

(assert (= (and d!110047 (not c!93937)) b!892596))

(assert (= (and d!110047 (not res!604683)) b!892597))

(assert (=> d!110047 m!830183))

(declare-fun m!830299 () Bool)

(assert (=> d!110047 m!830299))

(assert (=> b!892595 m!830183))

(declare-fun m!830301 () Bool)

(assert (=> b!892595 m!830301))

(assert (=> b!892595 m!830183))

(declare-fun m!830303 () Bool)

(assert (=> b!892595 m!830303))

(assert (=> b!892595 m!830303))

(declare-fun m!830305 () Bool)

(assert (=> b!892595 m!830305))

(assert (=> b!892597 m!830183))

(assert (=> b!892597 m!830303))

(assert (=> b!892597 m!830303))

(assert (=> b!892597 m!830305))

(assert (=> b!892487 d!110047))

(declare-fun d!110049 () Bool)

(declare-fun res!604688 () Bool)

(declare-fun e!498364 () Bool)

(assert (=> d!110049 (=> res!604688 e!498364)))

(assert (=> d!110049 (= res!604688 (= (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110049 (= (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000) e!498364)))

(declare-fun b!892602 () Bool)

(declare-fun e!498365 () Bool)

(assert (=> b!892602 (= e!498364 e!498365)))

(declare-fun res!604689 () Bool)

(assert (=> b!892602 (=> (not res!604689) (not e!498365))))

(assert (=> b!892602 (= res!604689 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25591 (_keys!9980 thiss!1181))))))

(declare-fun b!892603 () Bool)

(assert (=> b!892603 (= e!498365 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110049 (not res!604688)) b!892602))

(assert (= (and b!892602 res!604689) b!892603))

(declare-fun m!830307 () Bool)

(assert (=> d!110049 m!830307))

(declare-fun m!830309 () Bool)

(assert (=> b!892603 m!830309))

(assert (=> b!892487 d!110049))

(declare-fun b!892646 () Bool)

(declare-fun e!498399 () Bool)

(declare-fun e!498395 () Bool)

(assert (=> b!892646 (= e!498399 e!498395)))

(declare-fun res!604708 () Bool)

(declare-fun call!39556 () Bool)

(assert (=> b!892646 (= res!604708 call!39556)))

(assert (=> b!892646 (=> (not res!604708) (not e!498395))))

(declare-fun b!892647 () Bool)

(declare-fun e!498398 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!892647 (= e!498398 (validKeyInArray!0 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!892648 () Bool)

(declare-fun e!498392 () Bool)

(declare-fun call!39559 () Bool)

(assert (=> b!892648 (= e!498392 (not call!39559))))

(declare-fun bm!39550 () Bool)

(declare-fun call!39557 () ListLongMap!10709)

(declare-fun call!39555 () ListLongMap!10709)

(assert (=> bm!39550 (= call!39557 call!39555)))

(declare-fun bm!39551 () Bool)

(declare-fun call!39558 () ListLongMap!10709)

(assert (=> bm!39551 (= call!39558 call!39557)))

(declare-fun b!892649 () Bool)

(declare-fun e!498397 () Bool)

(declare-fun lt!403190 () ListLongMap!10709)

(assert (=> b!892649 (= e!498397 (= (apply!401 lt!403190 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5100 thiss!1181)))))

(declare-fun b!892650 () Bool)

(declare-fun c!93950 () Bool)

(assert (=> b!892650 (= c!93950 (and (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!498400 () ListLongMap!10709)

(declare-fun e!498393 () ListLongMap!10709)

(assert (=> b!892650 (= e!498400 e!498393)))

(declare-fun b!892651 () Bool)

(declare-fun e!498403 () Bool)

(assert (=> b!892651 (= e!498403 (validKeyInArray!0 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!892652 () Bool)

(declare-fun res!604712 () Bool)

(declare-fun e!498401 () Bool)

(assert (=> b!892652 (=> (not res!604712) (not e!498401))))

(assert (=> b!892652 (= res!604712 e!498392)))

(declare-fun c!93952 () Bool)

(assert (=> b!892652 (= c!93952 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!892653 () Bool)

(declare-fun res!604710 () Bool)

(assert (=> b!892653 (=> (not res!604710) (not e!498401))))

(declare-fun e!498404 () Bool)

(assert (=> b!892653 (= res!604710 e!498404)))

(declare-fun res!604715 () Bool)

(assert (=> b!892653 (=> res!604715 e!498404)))

(assert (=> b!892653 (= res!604715 (not e!498398))))

(declare-fun res!604713 () Bool)

(assert (=> b!892653 (=> (not res!604713) (not e!498398))))

(assert (=> b!892653 (= res!604713 (bvslt #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))))))

(declare-fun b!892655 () Bool)

(declare-fun e!498402 () Bool)

(assert (=> b!892655 (= e!498404 e!498402)))

(declare-fun res!604711 () Bool)

(assert (=> b!892655 (=> (not res!604711) (not e!498402))))

(assert (=> b!892655 (= res!604711 (contains!4344 lt!403190 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!892655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))))))

(declare-fun b!892656 () Bool)

(assert (=> b!892656 (= e!498395 (= (apply!401 lt!403190 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5100 thiss!1181)))))

(declare-fun b!892657 () Bool)

(assert (=> b!892657 (= e!498399 (not call!39556))))

(declare-fun b!892658 () Bool)

(declare-fun call!39553 () ListLongMap!10709)

(assert (=> b!892658 (= e!498400 call!39553)))

(declare-fun call!39554 () ListLongMap!10709)

(declare-fun c!93954 () Bool)

(declare-fun bm!39552 () Bool)

(declare-fun c!93951 () Bool)

(declare-fun +!2613 (ListLongMap!10709 tuple2!12022) ListLongMap!10709)

(assert (=> bm!39552 (= call!39554 (+!2613 (ite c!93951 call!39555 (ite c!93954 call!39557 call!39558)) (ite (or c!93951 c!93954) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5100 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5100 thiss!1181)))))))

(declare-fun b!892659 () Bool)

(declare-fun e!498394 () ListLongMap!10709)

(assert (=> b!892659 (= e!498394 (+!2613 call!39554 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5100 thiss!1181))))))

(declare-fun b!892660 () Bool)

(assert (=> b!892660 (= e!498392 e!498397)))

(declare-fun res!604714 () Bool)

(assert (=> b!892660 (= res!604714 call!39559)))

(assert (=> b!892660 (=> (not res!604714) (not e!498397))))

(declare-fun b!892661 () Bool)

(assert (=> b!892661 (= e!498394 e!498400)))

(assert (=> b!892661 (= c!93954 (and (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39553 () Bool)

(assert (=> bm!39553 (= call!39559 (contains!4344 lt!403190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892662 () Bool)

(assert (=> b!892662 (= e!498393 call!39558)))

(declare-fun b!892663 () Bool)

(assert (=> b!892663 (= e!498402 (= (apply!401 lt!403190 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000)) (get!13240 (select (arr!25146 (_values!5287 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1291 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!892663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25592 (_values!5287 thiss!1181))))))

(assert (=> b!892663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))))))

(declare-fun bm!39554 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3310 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) ListLongMap!10709)

(assert (=> bm!39554 (= call!39555 (getCurrentListMapNoExtraKeys!3310 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun bm!39555 () Bool)

(assert (=> bm!39555 (= call!39556 (contains!4344 lt!403190 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892664 () Bool)

(declare-fun e!498396 () Unit!30348)

(declare-fun lt!403184 () Unit!30348)

(assert (=> b!892664 (= e!498396 lt!403184)))

(declare-fun lt!403172 () ListLongMap!10709)

(assert (=> b!892664 (= lt!403172 (getCurrentListMapNoExtraKeys!3310 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403182 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403192 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403192 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403180 () Unit!30348)

(declare-fun addStillContains!328 (ListLongMap!10709 (_ BitVec 64) V!29175 (_ BitVec 64)) Unit!30348)

(assert (=> b!892664 (= lt!403180 (addStillContains!328 lt!403172 lt!403182 (zeroValue!5100 thiss!1181) lt!403192))))

(assert (=> b!892664 (contains!4344 (+!2613 lt!403172 (tuple2!12023 lt!403182 (zeroValue!5100 thiss!1181))) lt!403192)))

(declare-fun lt!403178 () Unit!30348)

(assert (=> b!892664 (= lt!403178 lt!403180)))

(declare-fun lt!403183 () ListLongMap!10709)

(assert (=> b!892664 (= lt!403183 (getCurrentListMapNoExtraKeys!3310 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403177 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403177 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403179 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403179 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403188 () Unit!30348)

(declare-fun addApplyDifferent!328 (ListLongMap!10709 (_ BitVec 64) V!29175 (_ BitVec 64)) Unit!30348)

(assert (=> b!892664 (= lt!403188 (addApplyDifferent!328 lt!403183 lt!403177 (minValue!5100 thiss!1181) lt!403179))))

(assert (=> b!892664 (= (apply!401 (+!2613 lt!403183 (tuple2!12023 lt!403177 (minValue!5100 thiss!1181))) lt!403179) (apply!401 lt!403183 lt!403179))))

(declare-fun lt!403186 () Unit!30348)

(assert (=> b!892664 (= lt!403186 lt!403188)))

(declare-fun lt!403189 () ListLongMap!10709)

(assert (=> b!892664 (= lt!403189 (getCurrentListMapNoExtraKeys!3310 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403193 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403176 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403176 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403175 () Unit!30348)

(assert (=> b!892664 (= lt!403175 (addApplyDifferent!328 lt!403189 lt!403193 (zeroValue!5100 thiss!1181) lt!403176))))

(assert (=> b!892664 (= (apply!401 (+!2613 lt!403189 (tuple2!12023 lt!403193 (zeroValue!5100 thiss!1181))) lt!403176) (apply!401 lt!403189 lt!403176))))

(declare-fun lt!403181 () Unit!30348)

(assert (=> b!892664 (= lt!403181 lt!403175)))

(declare-fun lt!403187 () ListLongMap!10709)

(assert (=> b!892664 (= lt!403187 (getCurrentListMapNoExtraKeys!3310 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403173 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403173 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403185 () (_ BitVec 64))

(assert (=> b!892664 (= lt!403185 (select (arr!25145 (_keys!9980 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892664 (= lt!403184 (addApplyDifferent!328 lt!403187 lt!403173 (minValue!5100 thiss!1181) lt!403185))))

(assert (=> b!892664 (= (apply!401 (+!2613 lt!403187 (tuple2!12023 lt!403173 (minValue!5100 thiss!1181))) lt!403185) (apply!401 lt!403187 lt!403185))))

(declare-fun b!892654 () Bool)

(assert (=> b!892654 (= e!498393 call!39553)))

(declare-fun d!110051 () Bool)

(assert (=> d!110051 e!498401))

(declare-fun res!604716 () Bool)

(assert (=> d!110051 (=> (not res!604716) (not e!498401))))

(assert (=> d!110051 (= res!604716 (or (bvsge #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))))))))

(declare-fun lt!403191 () ListLongMap!10709)

(assert (=> d!110051 (= lt!403190 lt!403191)))

(declare-fun lt!403174 () Unit!30348)

(assert (=> d!110051 (= lt!403174 e!498396)))

(declare-fun c!93953 () Bool)

(assert (=> d!110051 (= c!93953 e!498403)))

(declare-fun res!604709 () Bool)

(assert (=> d!110051 (=> (not res!604709) (not e!498403))))

(assert (=> d!110051 (= res!604709 (bvslt #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))))))

(assert (=> d!110051 (= lt!403191 e!498394)))

(assert (=> d!110051 (= c!93951 (and (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110051 (validMask!0 (mask!25812 thiss!1181))))

(assert (=> d!110051 (= (getCurrentListMap!2596 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)) lt!403190)))

(declare-fun bm!39556 () Bool)

(assert (=> bm!39556 (= call!39553 call!39554)))

(declare-fun b!892665 () Bool)

(declare-fun Unit!30353 () Unit!30348)

(assert (=> b!892665 (= e!498396 Unit!30353)))

(declare-fun b!892666 () Bool)

(assert (=> b!892666 (= e!498401 e!498399)))

(declare-fun c!93955 () Bool)

(assert (=> b!892666 (= c!93955 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!110051 c!93951) b!892659))

(assert (= (and d!110051 (not c!93951)) b!892661))

(assert (= (and b!892661 c!93954) b!892658))

(assert (= (and b!892661 (not c!93954)) b!892650))

(assert (= (and b!892650 c!93950) b!892654))

(assert (= (and b!892650 (not c!93950)) b!892662))

(assert (= (or b!892654 b!892662) bm!39551))

(assert (= (or b!892658 bm!39551) bm!39550))

(assert (= (or b!892658 b!892654) bm!39556))

(assert (= (or b!892659 bm!39550) bm!39554))

(assert (= (or b!892659 bm!39556) bm!39552))

(assert (= (and d!110051 res!604709) b!892651))

(assert (= (and d!110051 c!93953) b!892664))

(assert (= (and d!110051 (not c!93953)) b!892665))

(assert (= (and d!110051 res!604716) b!892653))

(assert (= (and b!892653 res!604713) b!892647))

(assert (= (and b!892653 (not res!604715)) b!892655))

(assert (= (and b!892655 res!604711) b!892663))

(assert (= (and b!892653 res!604710) b!892652))

(assert (= (and b!892652 c!93952) b!892660))

(assert (= (and b!892652 (not c!93952)) b!892648))

(assert (= (and b!892660 res!604714) b!892649))

(assert (= (or b!892660 b!892648) bm!39553))

(assert (= (and b!892652 res!604712) b!892666))

(assert (= (and b!892666 c!93955) b!892646))

(assert (= (and b!892666 (not c!93955)) b!892657))

(assert (= (and b!892646 res!604708) b!892656))

(assert (= (or b!892646 b!892657) bm!39555))

(declare-fun b_lambda!12885 () Bool)

(assert (=> (not b_lambda!12885) (not b!892663)))

(assert (=> b!892663 t!25100))

(declare-fun b_and!26067 () Bool)

(assert (= b_and!26057 (and (=> t!25100 result!10029) b_and!26067)))

(declare-fun m!830311 () Bool)

(assert (=> bm!39553 m!830311))

(declare-fun m!830313 () Bool)

(assert (=> bm!39552 m!830313))

(declare-fun m!830315 () Bool)

(assert (=> b!892649 m!830315))

(assert (=> b!892663 m!830307))

(declare-fun m!830317 () Bool)

(assert (=> b!892663 m!830317))

(declare-fun m!830319 () Bool)

(assert (=> b!892663 m!830319))

(assert (=> b!892663 m!830197))

(declare-fun m!830321 () Bool)

(assert (=> b!892663 m!830321))

(assert (=> b!892663 m!830319))

(assert (=> b!892663 m!830197))

(assert (=> b!892663 m!830307))

(declare-fun m!830323 () Bool)

(assert (=> b!892656 m!830323))

(declare-fun m!830325 () Bool)

(assert (=> bm!39555 m!830325))

(assert (=> b!892664 m!830307))

(declare-fun m!830327 () Bool)

(assert (=> b!892664 m!830327))

(declare-fun m!830329 () Bool)

(assert (=> b!892664 m!830329))

(declare-fun m!830331 () Bool)

(assert (=> b!892664 m!830331))

(declare-fun m!830333 () Bool)

(assert (=> b!892664 m!830333))

(declare-fun m!830335 () Bool)

(assert (=> b!892664 m!830335))

(declare-fun m!830337 () Bool)

(assert (=> b!892664 m!830337))

(declare-fun m!830339 () Bool)

(assert (=> b!892664 m!830339))

(declare-fun m!830341 () Bool)

(assert (=> b!892664 m!830341))

(assert (=> b!892664 m!830327))

(declare-fun m!830343 () Bool)

(assert (=> b!892664 m!830343))

(declare-fun m!830345 () Bool)

(assert (=> b!892664 m!830345))

(declare-fun m!830347 () Bool)

(assert (=> b!892664 m!830347))

(declare-fun m!830349 () Bool)

(assert (=> b!892664 m!830349))

(declare-fun m!830351 () Bool)

(assert (=> b!892664 m!830351))

(declare-fun m!830353 () Bool)

(assert (=> b!892664 m!830353))

(assert (=> b!892664 m!830331))

(declare-fun m!830355 () Bool)

(assert (=> b!892664 m!830355))

(assert (=> b!892664 m!830349))

(assert (=> b!892664 m!830339))

(declare-fun m!830357 () Bool)

(assert (=> b!892664 m!830357))

(declare-fun m!830359 () Bool)

(assert (=> d!110051 m!830359))

(assert (=> bm!39554 m!830337))

(assert (=> b!892647 m!830307))

(assert (=> b!892647 m!830307))

(declare-fun m!830361 () Bool)

(assert (=> b!892647 m!830361))

(assert (=> b!892655 m!830307))

(assert (=> b!892655 m!830307))

(declare-fun m!830363 () Bool)

(assert (=> b!892655 m!830363))

(assert (=> b!892651 m!830307))

(assert (=> b!892651 m!830307))

(assert (=> b!892651 m!830361))

(declare-fun m!830365 () Bool)

(assert (=> b!892659 m!830365))

(assert (=> b!892487 d!110051))

(declare-fun d!110053 () Bool)

(declare-fun e!498407 () Bool)

(assert (=> d!110053 e!498407))

(declare-fun res!604719 () Bool)

(assert (=> d!110053 (=> (not res!604719) (not e!498407))))

(assert (=> d!110053 (= res!604719 (and (bvsge (index!37804 lt!403075) #b00000000000000000000000000000000) (bvslt (index!37804 lt!403075) (size!25591 (_keys!9980 thiss!1181)))))))

(declare-fun lt!403196 () Unit!30348)

(declare-fun choose!1469 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) Unit!30348)

(assert (=> d!110053 (= lt!403196 (choose!1469 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37804 lt!403075) (defaultEntry!5302 thiss!1181)))))

(assert (=> d!110053 (validMask!0 (mask!25812 thiss!1181))))

(assert (=> d!110053 (= (lemmaValidKeyInArrayIsInListMap!232 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37804 lt!403075) (defaultEntry!5302 thiss!1181)) lt!403196)))

(declare-fun b!892669 () Bool)

(assert (=> b!892669 (= e!498407 (contains!4344 (getCurrentListMap!2596 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)) (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403075))))))

(assert (= (and d!110053 res!604719) b!892669))

(declare-fun m!830367 () Bool)

(assert (=> d!110053 m!830367))

(assert (=> d!110053 m!830359))

(assert (=> b!892669 m!830189))

(assert (=> b!892669 m!830183))

(assert (=> b!892669 m!830189))

(assert (=> b!892669 m!830183))

(declare-fun m!830369 () Bool)

(assert (=> b!892669 m!830369))

(assert (=> b!892487 d!110053))

(declare-fun b!892684 () Bool)

(declare-fun res!604727 () Bool)

(declare-fun e!498421 () Bool)

(assert (=> b!892684 (=> (not res!604727) (not e!498421))))

(assert (=> b!892684 (= res!604727 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!498422 () Bool)

(assert (=> b!892684 (= e!498422 e!498421)))

(declare-fun b!892685 () Bool)

(declare-fun call!39571 () V!29175)

(assert (=> b!892685 (= e!498421 (= call!39571 (minValue!5100 thiss!1181)))))

(declare-fun bm!39565 () Bool)

(declare-fun call!39568 () ListLongMap!10709)

(declare-fun call!39570 () ListLongMap!10709)

(assert (=> bm!39565 (= call!39568 call!39570)))

(declare-fun b!892687 () Bool)

(declare-fun e!498418 () Bool)

(assert (=> b!892687 (= e!498418 e!498422)))

(declare-fun c!93960 () Bool)

(assert (=> b!892687 (= c!93960 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!39569 () V!29175)

(declare-fun bm!39566 () Bool)

(declare-fun c!93961 () Bool)

(assert (=> bm!39566 (= call!39569 (apply!401 (ite c!93961 call!39570 call!39568) key!785))))

(declare-fun b!892688 () Bool)

(declare-fun e!498419 () Bool)

(assert (=> b!892688 (= e!498419 (= call!39569 (zeroValue!5100 thiss!1181)))))

(declare-fun b!892689 () Bool)

(assert (=> b!892689 (= e!498418 e!498419)))

(declare-fun res!604726 () Bool)

(assert (=> b!892689 (= res!604726 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892689 (=> (not res!604726) (not e!498419))))

(declare-fun bm!39567 () Bool)

(assert (=> bm!39567 (= call!39570 (getCurrentListMap!2596 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun d!110055 () Bool)

(assert (=> d!110055 e!498418))

(assert (=> d!110055 (= c!93961 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403199 () Unit!30348)

(declare-fun choose!1470 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64) (_ BitVec 32) Int) Unit!30348)

(assert (=> d!110055 (= lt!403199 (choose!1470 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (index!37804 lt!403075) (defaultEntry!5302 thiss!1181)))))

(assert (=> d!110055 (validMask!0 (mask!25812 thiss!1181))))

(assert (=> d!110055 (= (lemmaKeyInListMapThenSameValueInArray!8 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (index!37804 lt!403075) (defaultEntry!5302 thiss!1181)) lt!403199)))

(declare-fun b!892686 () Bool)

(declare-fun e!498420 () Bool)

(assert (=> b!892686 (= e!498420 (= call!39571 (get!13240 (select (arr!25146 (_values!5287 thiss!1181)) (index!37804 lt!403075)) (dynLambda!1291 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!892686 (and (bvsge (index!37804 lt!403075) #b00000000000000000000000000000000) (bvslt (index!37804 lt!403075) (size!25592 (_values!5287 thiss!1181))))))

(declare-fun bm!39568 () Bool)

(assert (=> bm!39568 (= call!39571 call!39569)))

(declare-fun b!892690 () Bool)

(declare-fun res!604728 () Bool)

(assert (=> b!892690 (=> (not res!604728) (not e!498420))))

(assert (=> b!892690 (= res!604728 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!892690 (= e!498422 e!498420)))

(assert (= (and d!110055 c!93961) b!892689))

(assert (= (and d!110055 (not c!93961)) b!892687))

(assert (= (and b!892689 res!604726) b!892688))

(assert (= (and b!892687 c!93960) b!892684))

(assert (= (and b!892687 (not c!93960)) b!892690))

(assert (= (and b!892684 res!604727) b!892685))

(assert (= (and b!892690 res!604728) b!892686))

(assert (= (or b!892685 b!892686) bm!39565))

(assert (= (or b!892685 b!892686) bm!39568))

(assert (= (or b!892688 bm!39565) bm!39567))

(assert (= (or b!892688 bm!39568) bm!39566))

(declare-fun b_lambda!12887 () Bool)

(assert (=> (not b_lambda!12887) (not b!892686)))

(assert (=> b!892686 t!25100))

(declare-fun b_and!26069 () Bool)

(assert (= b_and!26067 (and (=> t!25100 result!10029) b_and!26069)))

(assert (=> bm!39567 m!830189))

(assert (=> b!892686 m!830195))

(assert (=> b!892686 m!830197))

(assert (=> b!892686 m!830195))

(assert (=> b!892686 m!830197))

(assert (=> b!892686 m!830199))

(assert (=> b!892690 m!830181))

(declare-fun m!830371 () Bool)

(assert (=> bm!39566 m!830371))

(declare-fun m!830373 () Bool)

(assert (=> d!110055 m!830373))

(assert (=> d!110055 m!830359))

(assert (=> b!892487 d!110055))

(declare-fun d!110057 () Bool)

(assert (=> d!110057 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403202 () Unit!30348)

(declare-fun choose!13 (array!52277 (_ BitVec 64) (_ BitVec 32)) Unit!30348)

(assert (=> d!110057 (= lt!403202 (choose!13 (_keys!9980 thiss!1181) key!785 (index!37804 lt!403075)))))

(assert (=> d!110057 (bvsge (index!37804 lt!403075) #b00000000000000000000000000000000)))

(assert (=> d!110057 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9980 thiss!1181) key!785 (index!37804 lt!403075)) lt!403202)))

(declare-fun bs!25022 () Bool)

(assert (= bs!25022 d!110057))

(assert (=> bs!25022 m!830181))

(declare-fun m!830375 () Bool)

(assert (=> bs!25022 m!830375))

(assert (=> b!892487 d!110057))

(declare-fun b!892711 () Bool)

(declare-fun e!498437 () Bool)

(assert (=> b!892711 (= e!498437 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!892712 () Bool)

(declare-fun e!498434 () Bool)

(assert (=> b!892712 (= e!498434 true)))

(declare-fun lt!403240 () Unit!30348)

(declare-fun lt!403234 () SeekEntryResult!8858)

(assert (=> b!892712 (= lt!403240 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9980 thiss!1181) key!785 (index!37804 lt!403234)))))

(declare-fun call!39580 () Bool)

(assert (=> b!892712 call!39580))

(declare-fun lt!403246 () Unit!30348)

(assert (=> b!892712 (= lt!403246 lt!403240)))

(declare-fun lt!403237 () Unit!30348)

(assert (=> b!892712 (= lt!403237 (lemmaValidKeyInArrayIsInListMap!232 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37804 lt!403234) (defaultEntry!5302 thiss!1181)))))

(declare-fun call!39579 () Bool)

(assert (=> b!892712 call!39579))

(declare-fun lt!403244 () Unit!30348)

(assert (=> b!892712 (= lt!403244 lt!403237)))

(declare-fun b!892713 () Bool)

(declare-fun e!498436 () Bool)

(assert (=> b!892713 (= e!498436 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!892714 () Bool)

(declare-fun e!498435 () Unit!30348)

(declare-fun Unit!30354 () Unit!30348)

(assert (=> b!892714 (= e!498435 Unit!30354)))

(declare-fun b!892715 () Bool)

(declare-fun e!498433 () Bool)

(assert (=> b!892715 (= e!498436 e!498433)))

(declare-fun c!93976 () Bool)

(assert (=> b!892715 (= c!93976 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892716 () Bool)

(declare-fun c!93975 () Bool)

(assert (=> b!892716 (= c!93975 ((_ is Found!8858) lt!403234))))

(assert (=> b!892716 (= lt!403234 (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(assert (=> b!892716 (= e!498433 e!498434)))

(declare-fun b!892717 () Bool)

(assert (=> b!892717 (= e!498437 call!39580)))

(declare-fun b!892718 () Bool)

(assert (=> b!892718 false))

(declare-fun lt!403245 () Unit!30348)

(declare-fun lt!403243 () Unit!30348)

(assert (=> b!892718 (= lt!403245 lt!403243)))

(declare-fun lt!403247 () SeekEntryResult!8858)

(declare-fun lt!403238 () (_ BitVec 32))

(assert (=> b!892718 (and ((_ is Found!8858) lt!403247) (= (index!37804 lt!403247) lt!403238))))

(assert (=> b!892718 (= lt!403247 (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52277 (_ BitVec 32)) Unit!30348)

(assert (=> b!892718 (= lt!403243 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403238 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun lt!403242 () Unit!30348)

(declare-fun lt!403233 () Unit!30348)

(assert (=> b!892718 (= lt!403242 lt!403233)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52277 (_ BitVec 32)) Bool)

(assert (=> b!892718 (arrayForallSeekEntryOrOpenFound!0 lt!403238 (_keys!9980 thiss!1181) (mask!25812 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30348)

(assert (=> b!892718 (= lt!403233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9980 thiss!1181) (mask!25812 thiss!1181) #b00000000000000000000000000000000 lt!403238))))

(declare-fun arrayScanForKey!0 (array!52277 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!892718 (= lt!403238 (arrayScanForKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403239 () Unit!30348)

(declare-fun lt!403241 () Unit!30348)

(assert (=> b!892718 (= lt!403239 lt!403241)))

(assert (=> b!892718 e!498437))

(declare-fun c!93974 () Bool)

(assert (=> b!892718 (= c!93974 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!167 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64) Int) Unit!30348)

(assert (=> b!892718 (= lt!403241 (lemmaKeyInListMapIsInArray!167 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (defaultEntry!5302 thiss!1181)))))

(declare-fun Unit!30355 () Unit!30348)

(assert (=> b!892718 (= e!498435 Unit!30355)))

(declare-fun bm!39575 () Bool)

(declare-fun call!39578 () ListLongMap!10709)

(assert (=> bm!39575 (= call!39579 (contains!4344 call!39578 (ite c!93975 (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403234)) key!785)))))

(declare-fun d!110059 () Bool)

(declare-fun lt!403235 () Bool)

(assert (=> d!110059 (= lt!403235 (contains!4344 (map!12185 thiss!1181) key!785))))

(assert (=> d!110059 (= lt!403235 e!498436)))

(declare-fun c!93973 () Bool)

(assert (=> d!110059 (= c!93973 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110059 (valid!1633 thiss!1181)))

(assert (=> d!110059 (= (contains!4343 thiss!1181 key!785) lt!403235)))

(declare-fun b!892719 () Bool)

(assert (=> b!892719 (= e!498433 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39576 () Bool)

(assert (=> bm!39576 (= call!39578 (getCurrentListMap!2596 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun bm!39577 () Bool)

(assert (=> bm!39577 (= call!39580 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!892720 () Bool)

(assert (=> b!892720 (= e!498434 false)))

(declare-fun c!93972 () Bool)

(assert (=> b!892720 (= c!93972 call!39579)))

(declare-fun lt!403236 () Unit!30348)

(assert (=> b!892720 (= lt!403236 e!498435)))

(assert (= (and d!110059 c!93973) b!892713))

(assert (= (and d!110059 (not c!93973)) b!892715))

(assert (= (and b!892715 c!93976) b!892719))

(assert (= (and b!892715 (not c!93976)) b!892716))

(assert (= (and b!892716 c!93975) b!892712))

(assert (= (and b!892716 (not c!93975)) b!892720))

(assert (= (and b!892720 c!93972) b!892718))

(assert (= (and b!892720 (not c!93972)) b!892714))

(assert (= (and b!892718 c!93974) b!892717))

(assert (= (and b!892718 (not c!93974)) b!892711))

(assert (= (or b!892712 b!892717) bm!39577))

(assert (= (or b!892712 b!892720) bm!39576))

(assert (= (or b!892712 b!892720) bm!39575))

(assert (=> b!892718 m!830193))

(declare-fun m!830377 () Bool)

(assert (=> b!892718 m!830377))

(declare-fun m!830379 () Bool)

(assert (=> b!892718 m!830379))

(declare-fun m!830381 () Bool)

(assert (=> b!892718 m!830381))

(declare-fun m!830383 () Bool)

(assert (=> b!892718 m!830383))

(declare-fun m!830385 () Bool)

(assert (=> b!892718 m!830385))

(assert (=> bm!39577 m!830181))

(assert (=> b!892716 m!830193))

(assert (=> bm!39576 m!830189))

(declare-fun m!830387 () Bool)

(assert (=> bm!39575 m!830387))

(declare-fun m!830389 () Bool)

(assert (=> bm!39575 m!830389))

(declare-fun m!830391 () Bool)

(assert (=> b!892712 m!830391))

(declare-fun m!830393 () Bool)

(assert (=> b!892712 m!830393))

(assert (=> d!110059 m!830169))

(assert (=> d!110059 m!830169))

(declare-fun m!830395 () Bool)

(assert (=> d!110059 m!830395))

(assert (=> d!110059 m!830209))

(assert (=> b!892487 d!110059))

(declare-fun d!110061 () Bool)

(declare-fun get!13242 (Option!449) V!29175)

(assert (=> d!110061 (= (apply!401 lt!403077 key!785) (get!13242 (getValueByKey!443 (toList!5370 lt!403077) key!785)))))

(declare-fun bs!25023 () Bool)

(assert (= bs!25023 d!110061))

(declare-fun m!830397 () Bool)

(assert (=> bs!25023 m!830397))

(assert (=> bs!25023 m!830397))

(declare-fun m!830399 () Bool)

(assert (=> bs!25023 m!830399))

(assert (=> bm!39523 d!110061))

(declare-fun d!110063 () Bool)

(declare-fun c!93979 () Bool)

(assert (=> d!110063 (= c!93979 ((_ is ValueCellFull!8597) (select (arr!25146 (_values!5287 thiss!1181)) (index!37804 lt!403075))))))

(declare-fun e!498440 () V!29175)

(assert (=> d!110063 (= (get!13240 (select (arr!25146 (_values!5287 thiss!1181)) (index!37804 lt!403075)) (dynLambda!1291 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!498440)))

(declare-fun b!892725 () Bool)

(declare-fun get!13243 (ValueCell!8597 V!29175) V!29175)

(assert (=> b!892725 (= e!498440 (get!13243 (select (arr!25146 (_values!5287 thiss!1181)) (index!37804 lt!403075)) (dynLambda!1291 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!892726 () Bool)

(declare-fun get!13244 (ValueCell!8597 V!29175) V!29175)

(assert (=> b!892726 (= e!498440 (get!13244 (select (arr!25146 (_values!5287 thiss!1181)) (index!37804 lt!403075)) (dynLambda!1291 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110063 c!93979) b!892725))

(assert (= (and d!110063 (not c!93979)) b!892726))

(assert (=> b!892725 m!830195))

(assert (=> b!892725 m!830197))

(declare-fun m!830401 () Bool)

(assert (=> b!892725 m!830401))

(assert (=> b!892726 m!830195))

(assert (=> b!892726 m!830197))

(declare-fun m!830403 () Bool)

(assert (=> b!892726 m!830403))

(assert (=> b!892492 d!110063))

(declare-fun d!110065 () Bool)

(declare-fun res!604735 () Bool)

(declare-fun e!498443 () Bool)

(assert (=> d!110065 (=> (not res!604735) (not e!498443))))

(declare-fun simpleValid!295 (LongMapFixedSize!4210) Bool)

(assert (=> d!110065 (= res!604735 (simpleValid!295 thiss!1181))))

(assert (=> d!110065 (= (valid!1633 thiss!1181) e!498443)))

(declare-fun b!892733 () Bool)

(declare-fun res!604736 () Bool)

(assert (=> b!892733 (=> (not res!604736) (not e!498443))))

(declare-fun arrayCountValidKeys!0 (array!52277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!892733 (= res!604736 (= (arrayCountValidKeys!0 (_keys!9980 thiss!1181) #b00000000000000000000000000000000 (size!25591 (_keys!9980 thiss!1181))) (_size!2160 thiss!1181)))))

(declare-fun b!892734 () Bool)

(declare-fun res!604737 () Bool)

(assert (=> b!892734 (=> (not res!604737) (not e!498443))))

(assert (=> b!892734 (= res!604737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun b!892735 () Bool)

(declare-datatypes ((List!17800 0))(
  ( (Nil!17797) (Cons!17796 (h!18927 (_ BitVec 64)) (t!25108 List!17800)) )
))
(declare-fun arrayNoDuplicates!0 (array!52277 (_ BitVec 32) List!17800) Bool)

(assert (=> b!892735 (= e!498443 (arrayNoDuplicates!0 (_keys!9980 thiss!1181) #b00000000000000000000000000000000 Nil!17797))))

(assert (= (and d!110065 res!604735) b!892733))

(assert (= (and b!892733 res!604736) b!892734))

(assert (= (and b!892734 res!604737) b!892735))

(declare-fun m!830405 () Bool)

(assert (=> d!110065 m!830405))

(declare-fun m!830407 () Bool)

(assert (=> b!892733 m!830407))

(declare-fun m!830409 () Bool)

(assert (=> b!892734 m!830409))

(declare-fun m!830411 () Bool)

(assert (=> b!892735 m!830411))

(assert (=> start!75840 d!110065))

(declare-fun d!110067 () Bool)

(declare-fun isEmpty!683 (Option!449) Bool)

(assert (=> d!110067 (= (isDefined!324 (getValueByKey!443 (toList!5370 (map!12185 thiss!1181)) key!785)) (not (isEmpty!683 (getValueByKey!443 (toList!5370 (map!12185 thiss!1181)) key!785))))))

(declare-fun bs!25024 () Bool)

(assert (= bs!25024 d!110067))

(assert (=> bs!25024 m!830171))

(declare-fun m!830413 () Bool)

(assert (=> bs!25024 m!830413))

(assert (=> b!892490 d!110067))

(declare-fun b!892747 () Bool)

(declare-fun e!498449 () Option!449)

(assert (=> b!892747 (= e!498449 None!447)))

(declare-fun b!892744 () Bool)

(declare-fun e!498448 () Option!449)

(assert (=> b!892744 (= e!498448 (Some!448 (_2!6022 (h!18924 (toList!5370 (map!12185 thiss!1181))))))))

(declare-fun b!892746 () Bool)

(assert (=> b!892746 (= e!498449 (getValueByKey!443 (t!25101 (toList!5370 (map!12185 thiss!1181))) key!785))))

(declare-fun b!892745 () Bool)

(assert (=> b!892745 (= e!498448 e!498449)))

(declare-fun c!93985 () Bool)

(assert (=> b!892745 (= c!93985 (and ((_ is Cons!17793) (toList!5370 (map!12185 thiss!1181))) (not (= (_1!6022 (h!18924 (toList!5370 (map!12185 thiss!1181)))) key!785))))))

(declare-fun d!110069 () Bool)

(declare-fun c!93984 () Bool)

(assert (=> d!110069 (= c!93984 (and ((_ is Cons!17793) (toList!5370 (map!12185 thiss!1181))) (= (_1!6022 (h!18924 (toList!5370 (map!12185 thiss!1181)))) key!785)))))

(assert (=> d!110069 (= (getValueByKey!443 (toList!5370 (map!12185 thiss!1181)) key!785) e!498448)))

(assert (= (and d!110069 c!93984) b!892744))

(assert (= (and d!110069 (not c!93984)) b!892745))

(assert (= (and b!892745 c!93985) b!892746))

(assert (= (and b!892745 (not c!93985)) b!892747))

(declare-fun m!830415 () Bool)

(assert (=> b!892746 m!830415))

(assert (=> b!892490 d!110069))

(declare-fun d!110071 () Bool)

(assert (=> d!110071 (= (map!12185 thiss!1181) (getCurrentListMap!2596 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun bs!25025 () Bool)

(assert (= bs!25025 d!110071))

(assert (=> bs!25025 m!830189))

(assert (=> b!892490 d!110071))

(declare-fun d!110073 () Bool)

(declare-fun e!498452 () Bool)

(assert (=> d!110073 e!498452))

(declare-fun res!604740 () Bool)

(assert (=> d!110073 (=> res!604740 e!498452)))

(declare-fun lt!403253 () SeekEntryResult!8858)

(assert (=> d!110073 (= res!604740 (not ((_ is Found!8858) lt!403253)))))

(assert (=> d!110073 (= lt!403253 (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun lt!403252 () Unit!30348)

(declare-fun choose!1471 (array!52277 array!52279 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64)) Unit!30348)

(assert (=> d!110073 (= lt!403252 (choose!1471 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785))))

(assert (=> d!110073 (validMask!0 (mask!25812 thiss!1181))))

(assert (=> d!110073 (= (lemmaSeekEntryGivesInRangeIndex!57 (_keys!9980 thiss!1181) (_values!5287 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785) lt!403252)))

(declare-fun b!892750 () Bool)

(assert (=> b!892750 (= e!498452 (inRange!0 (index!37804 lt!403253) (mask!25812 thiss!1181)))))

(assert (= (and d!110073 (not res!604740)) b!892750))

(assert (=> d!110073 m!830193))

(declare-fun m!830417 () Bool)

(assert (=> d!110073 m!830417))

(assert (=> d!110073 m!830359))

(declare-fun m!830419 () Bool)

(assert (=> b!892750 m!830419))

(assert (=> b!892489 d!110073))

(declare-fun b!892763 () Bool)

(declare-fun e!498459 () SeekEntryResult!8858)

(declare-fun e!498460 () SeekEntryResult!8858)

(assert (=> b!892763 (= e!498459 e!498460)))

(declare-fun lt!403263 () (_ BitVec 64))

(declare-fun lt!403265 () SeekEntryResult!8858)

(assert (=> b!892763 (= lt!403263 (select (arr!25145 (_keys!9980 thiss!1181)) (index!37805 lt!403265)))))

(declare-fun c!93993 () Bool)

(assert (=> b!892763 (= c!93993 (= lt!403263 key!785))))

(declare-fun b!892764 () Bool)

(declare-fun e!498461 () SeekEntryResult!8858)

(assert (=> b!892764 (= e!498461 (MissingZero!8858 (index!37805 lt!403265)))))

(declare-fun b!892765 () Bool)

(assert (=> b!892765 (= e!498459 Undefined!8858)))

(declare-fun b!892766 () Bool)

(declare-fun c!93992 () Bool)

(assert (=> b!892766 (= c!93992 (= lt!403263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!892766 (= e!498460 e!498461)))

(declare-fun b!892767 () Bool)

(declare-fun lt!403264 () SeekEntryResult!8858)

(assert (=> b!892767 (= e!498461 (ite ((_ is MissingVacant!8858) lt!403264) (MissingZero!8858 (index!37806 lt!403264)) lt!403264))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52277 (_ BitVec 32)) SeekEntryResult!8858)

(assert (=> b!892767 (= lt!403264 (seekKeyOrZeroReturnVacant!0 (x!75883 lt!403265) (index!37805 lt!403265) (index!37805 lt!403265) key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun d!110075 () Bool)

(declare-fun lt!403262 () SeekEntryResult!8858)

(assert (=> d!110075 (and (or ((_ is MissingVacant!8858) lt!403262) (not ((_ is Found!8858) lt!403262)) (and (bvsge (index!37804 lt!403262) #b00000000000000000000000000000000) (bvslt (index!37804 lt!403262) (size!25591 (_keys!9980 thiss!1181))))) (not ((_ is MissingVacant!8858) lt!403262)) (or (not ((_ is Found!8858) lt!403262)) (= (select (arr!25145 (_keys!9980 thiss!1181)) (index!37804 lt!403262)) key!785)))))

(assert (=> d!110075 (= lt!403262 e!498459)))

(declare-fun c!93994 () Bool)

(assert (=> d!110075 (= c!93994 (and ((_ is Intermediate!8858) lt!403265) (undefined!9670 lt!403265)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52277 (_ BitVec 32)) SeekEntryResult!8858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110075 (= lt!403265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25812 thiss!1181)) key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)))))

(assert (=> d!110075 (validMask!0 (mask!25812 thiss!1181))))

(assert (=> d!110075 (= (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25812 thiss!1181)) lt!403262)))

(declare-fun b!892768 () Bool)

(assert (=> b!892768 (= e!498460 (Found!8858 (index!37805 lt!403265)))))

(assert (= (and d!110075 c!93994) b!892765))

(assert (= (and d!110075 (not c!93994)) b!892763))

(assert (= (and b!892763 c!93993) b!892768))

(assert (= (and b!892763 (not c!93993)) b!892766))

(assert (= (and b!892766 c!93992) b!892764))

(assert (= (and b!892766 (not c!93992)) b!892767))

(declare-fun m!830421 () Bool)

(assert (=> b!892763 m!830421))

(declare-fun m!830423 () Bool)

(assert (=> b!892767 m!830423))

(declare-fun m!830425 () Bool)

(assert (=> d!110075 m!830425))

(declare-fun m!830427 () Bool)

(assert (=> d!110075 m!830427))

(assert (=> d!110075 m!830427))

(declare-fun m!830429 () Bool)

(assert (=> d!110075 m!830429))

(assert (=> d!110075 m!830359))

(assert (=> b!892489 d!110075))

(declare-fun b!892776 () Bool)

(declare-fun e!498466 () Bool)

(assert (=> b!892776 (= e!498466 tp_is_empty!18157)))

(declare-fun mapIsEmpty!28799 () Bool)

(declare-fun mapRes!28799 () Bool)

(assert (=> mapIsEmpty!28799 mapRes!28799))

(declare-fun condMapEmpty!28799 () Bool)

(declare-fun mapDefault!28799 () ValueCell!8597)

(assert (=> mapNonEmpty!28790 (= condMapEmpty!28799 (= mapRest!28790 ((as const (Array (_ BitVec 32) ValueCell!8597)) mapDefault!28799)))))

(assert (=> mapNonEmpty!28790 (= tp!55457 (and e!498466 mapRes!28799))))

(declare-fun b!892775 () Bool)

(declare-fun e!498467 () Bool)

(assert (=> b!892775 (= e!498467 tp_is_empty!18157)))

(declare-fun mapNonEmpty!28799 () Bool)

(declare-fun tp!55472 () Bool)

(assert (=> mapNonEmpty!28799 (= mapRes!28799 (and tp!55472 e!498467))))

(declare-fun mapKey!28799 () (_ BitVec 32))

(declare-fun mapRest!28799 () (Array (_ BitVec 32) ValueCell!8597))

(declare-fun mapValue!28799 () ValueCell!8597)

(assert (=> mapNonEmpty!28799 (= mapRest!28790 (store mapRest!28799 mapKey!28799 mapValue!28799))))

(assert (= (and mapNonEmpty!28790 condMapEmpty!28799) mapIsEmpty!28799))

(assert (= (and mapNonEmpty!28790 (not condMapEmpty!28799)) mapNonEmpty!28799))

(assert (= (and mapNonEmpty!28799 ((_ is ValueCellFull!8597) mapValue!28799)) b!892775))

(assert (= (and mapNonEmpty!28790 ((_ is ValueCellFull!8597) mapDefault!28799)) b!892776))

(declare-fun m!830431 () Bool)

(assert (=> mapNonEmpty!28799 m!830431))

(declare-fun b_lambda!12889 () Bool)

(assert (= b_lambda!12885 (or (and b!892480 b_free!15829) b_lambda!12889)))

(declare-fun b_lambda!12891 () Bool)

(assert (= b_lambda!12887 (or (and b!892480 b_free!15829) b_lambda!12891)))

(check-sat (not b_lambda!12883) (not b!892690) (not b!892750) (not b!892595) (not b!892718) (not bm!39552) (not bm!39555) (not d!110065) (not b!892651) (not b!892686) (not b!892725) (not d!110053) (not d!110057) (not b!892656) (not b!892669) (not d!110067) (not b!892659) (not d!110051) (not d!110061) (not b!892726) (not b!892664) (not bm!39553) (not d!110047) b_and!26069 (not b!892767) (not b!892746) (not b!892597) (not b!892655) (not bm!39554) tp_is_empty!18157 (not bm!39567) (not bm!39575) (not mapNonEmpty!28799) (not bm!39576) (not b!892647) (not d!110075) (not b_lambda!12889) (not b!892733) (not b_next!15829) (not d!110059) (not b!892649) (not b!892734) (not d!110055) (not b_lambda!12891) (not d!110073) (not b!892712) (not bm!39566) (not bm!39577) (not b!892663) (not d!110071) (not b!892716) (not b!892735) (not b!892603))
(check-sat b_and!26069 (not b_next!15829))
