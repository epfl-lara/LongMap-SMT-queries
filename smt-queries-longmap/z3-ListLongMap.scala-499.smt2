; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11316 () Bool)

(assert start!11316)

(declare-fun b!93497 () Bool)

(declare-fun b_free!2377 () Bool)

(declare-fun b_next!2377 () Bool)

(assert (=> b!93497 (= b_free!2377 (not b_next!2377))))

(declare-fun tp!9396 () Bool)

(declare-fun b_and!5697 () Bool)

(assert (=> b!93497 (= tp!9396 b_and!5697)))

(declare-fun b!93487 () Bool)

(declare-fun b_free!2379 () Bool)

(declare-fun b_next!2379 () Bool)

(assert (=> b!93487 (= b_free!2379 (not b_next!2379))))

(declare-fun tp!9393 () Bool)

(declare-fun b_and!5699 () Bool)

(assert (=> b!93487 (= tp!9393 b_and!5699)))

(declare-fun b!93483 () Bool)

(declare-fun e!61029 () Bool)

(declare-fun tp_is_empty!2605 () Bool)

(assert (=> b!93483 (= e!61029 tp_is_empty!2605)))

(declare-fun b!93484 () Bool)

(declare-fun e!61021 () Bool)

(declare-fun mapRes!3648 () Bool)

(assert (=> b!93484 (= e!61021 (and e!61029 mapRes!3648))))

(declare-fun condMapEmpty!3648 () Bool)

(declare-datatypes ((V!3121 0))(
  ( (V!3122 (val!1347 Int)) )
))
(declare-datatypes ((array!4169 0))(
  ( (array!4170 (arr!1982 (Array (_ BitVec 32) (_ BitVec 64))) (size!2230 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!959 0))(
  ( (ValueCellFull!959 (v!2755 V!3121)) (EmptyCell!959) )
))
(declare-datatypes ((array!4171 0))(
  ( (array!4172 (arr!1983 (Array (_ BitVec 32) ValueCell!959)) (size!2231 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!826 0))(
  ( (LongMapFixedSize!827 (defaultEntry!2430 Int) (mask!6502 (_ BitVec 32)) (extraKeys!2259 (_ BitVec 32)) (zeroValue!2317 V!3121) (minValue!2317 V!3121) (_size!462 (_ BitVec 32)) (_keys!4112 array!4169) (_values!2413 array!4171) (_vacant!462 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!632 0))(
  ( (Cell!633 (v!2756 LongMapFixedSize!826)) )
))
(declare-datatypes ((LongMap!632 0))(
  ( (LongMap!633 (underlying!327 Cell!632)) )
))
(declare-fun thiss!992 () LongMap!632)

(declare-fun mapDefault!3648 () ValueCell!959)

(assert (=> b!93484 (= condMapEmpty!3648 (= (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3648)))))

(declare-fun mapNonEmpty!3647 () Bool)

(declare-fun mapRes!3647 () Bool)

(declare-fun tp!9395 () Bool)

(declare-fun e!61020 () Bool)

(assert (=> mapNonEmpty!3647 (= mapRes!3647 (and tp!9395 e!61020))))

(declare-fun mapKey!3648 () (_ BitVec 32))

(declare-fun mapValue!3648 () ValueCell!959)

(declare-fun mapRest!3647 () (Array (_ BitVec 32) ValueCell!959))

(declare-fun newMap!16 () LongMapFixedSize!826)

(assert (=> mapNonEmpty!3647 (= (arr!1983 (_values!2413 newMap!16)) (store mapRest!3647 mapKey!3648 mapValue!3648))))

(declare-fun mapIsEmpty!3647 () Bool)

(assert (=> mapIsEmpty!3647 mapRes!3647))

(declare-fun mapNonEmpty!3648 () Bool)

(declare-fun tp!9394 () Bool)

(declare-fun e!61027 () Bool)

(assert (=> mapNonEmpty!3648 (= mapRes!3648 (and tp!9394 e!61027))))

(declare-fun mapKey!3647 () (_ BitVec 32))

(declare-fun mapRest!3648 () (Array (_ BitVec 32) ValueCell!959))

(declare-fun mapValue!3647 () ValueCell!959)

(assert (=> mapNonEmpty!3648 (= (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) (store mapRest!3648 mapKey!3647 mapValue!3647))))

(declare-fun b!93485 () Bool)

(declare-datatypes ((Unit!2775 0))(
  ( (Unit!2776) )
))
(declare-fun e!61023 () Unit!2775)

(declare-fun Unit!2777 () Unit!2775)

(assert (=> b!93485 (= e!61023 Unit!2777)))

(declare-fun b!93486 () Bool)

(declare-fun e!61024 () Bool)

(declare-fun e!61014 () Bool)

(assert (=> b!93486 (= e!61024 (and e!61014 mapRes!3647))))

(declare-fun condMapEmpty!3647 () Bool)

(declare-fun mapDefault!3647 () ValueCell!959)

(assert (=> b!93486 (= condMapEmpty!3647 (= (arr!1983 (_values!2413 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3647)))))

(declare-fun e!61025 () Bool)

(declare-fun array_inv!1223 (array!4169) Bool)

(declare-fun array_inv!1224 (array!4171) Bool)

(assert (=> b!93487 (= e!61025 (and tp!9393 tp_is_empty!2605 (array_inv!1223 (_keys!4112 newMap!16)) (array_inv!1224 (_values!2413 newMap!16)) e!61024))))

(declare-fun b!93488 () Bool)

(declare-fun res!47440 () Bool)

(declare-fun e!61015 () Bool)

(assert (=> b!93488 (=> (not res!47440) (not e!61015))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!93488 (= res!47440 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992)))))))))

(declare-fun b!93489 () Bool)

(assert (=> b!93489 (= e!61027 tp_is_empty!2605)))

(declare-fun b!93490 () Bool)

(declare-fun e!61018 () Bool)

(declare-fun e!61016 () Bool)

(assert (=> b!93490 (= e!61018 e!61016)))

(declare-fun res!47436 () Bool)

(assert (=> start!11316 (=> (not res!47436) (not e!61015))))

(declare-fun valid!381 (LongMap!632) Bool)

(assert (=> start!11316 (= res!47436 (valid!381 thiss!992))))

(assert (=> start!11316 e!61015))

(assert (=> start!11316 e!61018))

(assert (=> start!11316 true))

(assert (=> start!11316 e!61025))

(declare-fun b!93491 () Bool)

(assert (=> b!93491 (= e!61014 tp_is_empty!2605)))

(declare-fun b!93492 () Bool)

(declare-fun res!47439 () Bool)

(assert (=> b!93492 (=> (not res!47439) (not e!61015))))

(assert (=> b!93492 (= res!47439 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6502 newMap!16)) (_size!462 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun b!93493 () Bool)

(declare-fun Unit!2778 () Unit!2775)

(assert (=> b!93493 (= e!61023 Unit!2778)))

(declare-fun lt!46270 () Unit!2775)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!79 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) (_ BitVec 32) Int) Unit!2775)

(assert (=> b!93493 (= lt!46270 (lemmaListMapContainsThenArrayContainsFrom!79 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!93493 (arrayContainsKey!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!46271 () Unit!2775)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4169 (_ BitVec 32) (_ BitVec 32)) Unit!2775)

(assert (=> b!93493 (= lt!46271 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1551 0))(
  ( (Nil!1548) (Cons!1547 (h!2139 (_ BitVec 64)) (t!5433 List!1551)) )
))
(declare-fun arrayNoDuplicates!0 (array!4169 (_ BitVec 32) List!1551) Bool)

(assert (=> b!93493 (arrayNoDuplicates!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) from!355 Nil!1548)))

(declare-fun lt!46273 () Unit!2775)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4169 (_ BitVec 32) (_ BitVec 64) List!1551) Unit!2775)

(assert (=> b!93493 (= lt!46273 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (Cons!1547 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) Nil!1548)))))

(assert (=> b!93493 false))

(declare-fun b!93494 () Bool)

(declare-fun e!61026 () Bool)

(assert (=> b!93494 (= e!61016 e!61026)))

(declare-fun mapIsEmpty!3648 () Bool)

(assert (=> mapIsEmpty!3648 mapRes!3648))

(declare-fun b!93495 () Bool)

(assert (=> b!93495 (= e!61020 tp_is_empty!2605)))

(declare-fun b!93496 () Bool)

(declare-fun res!47438 () Bool)

(assert (=> b!93496 (=> (not res!47438) (not e!61015))))

(declare-fun valid!382 (LongMapFixedSize!826) Bool)

(assert (=> b!93496 (= res!47438 (valid!382 newMap!16))))

(assert (=> b!93497 (= e!61026 (and tp!9396 tp_is_empty!2605 (array_inv!1223 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (array_inv!1224 (_values!2413 (v!2756 (underlying!327 thiss!992)))) e!61021))))

(declare-fun b!93498 () Bool)

(declare-fun e!61019 () Bool)

(declare-fun e!61028 () Bool)

(assert (=> b!93498 (= e!61019 e!61028)))

(declare-fun res!47437 () Bool)

(assert (=> b!93498 (=> (not res!47437) (not e!61028))))

(declare-datatypes ((tuple2!2276 0))(
  ( (tuple2!2277 (_1!1149 Bool) (_2!1149 LongMapFixedSize!826)) )
))
(declare-fun lt!46269 () tuple2!2276)

(assert (=> b!93498 (= res!47437 (and (_1!1149 lt!46269) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!46272 () Unit!2775)

(assert (=> b!93498 (= lt!46272 e!61023)))

(declare-fun c!15566 () Bool)

(declare-datatypes ((tuple2!2278 0))(
  ( (tuple2!2279 (_1!1150 (_ BitVec 64)) (_2!1150 V!3121)) )
))
(declare-datatypes ((List!1552 0))(
  ( (Nil!1549) (Cons!1548 (h!2140 tuple2!2278) (t!5434 List!1552)) )
))
(declare-datatypes ((ListLongMap!1487 0))(
  ( (ListLongMap!1488 (toList!759 List!1552)) )
))
(declare-fun lt!46268 () ListLongMap!1487)

(declare-fun contains!778 (ListLongMap!1487 (_ BitVec 64)) Bool)

(assert (=> b!93498 (= c!15566 (contains!778 lt!46268 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun update!140 (LongMapFixedSize!826 (_ BitVec 64) V!3121) tuple2!2276)

(declare-fun get!1267 (ValueCell!959 V!3121) V!3121)

(declare-fun dynLambda!365 (Int (_ BitVec 64)) V!3121)

(assert (=> b!93498 (= lt!46269 (update!140 newMap!16 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!93499 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!93499 (= e!61028 (not (validMask!0 (mask!6502 (v!2756 (underlying!327 thiss!992))))))))

(declare-fun b!93500 () Bool)

(assert (=> b!93500 (= e!61015 e!61019)))

(declare-fun res!47435 () Bool)

(assert (=> b!93500 (=> (not res!47435) (not e!61019))))

(declare-fun lt!46274 () ListLongMap!1487)

(assert (=> b!93500 (= res!47435 (and (= lt!46274 lt!46268) (not (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1239 (LongMapFixedSize!826) ListLongMap!1487)

(assert (=> b!93500 (= lt!46268 (map!1239 newMap!16))))

(declare-fun getCurrentListMap!449 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) ListLongMap!1487)

(assert (=> b!93500 (= lt!46274 (getCurrentListMap!449 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(assert (= (and start!11316 res!47436) b!93488))

(assert (= (and b!93488 res!47440) b!93496))

(assert (= (and b!93496 res!47438) b!93492))

(assert (= (and b!93492 res!47439) b!93500))

(assert (= (and b!93500 res!47435) b!93498))

(assert (= (and b!93498 c!15566) b!93493))

(assert (= (and b!93498 (not c!15566)) b!93485))

(assert (= (and b!93498 res!47437) b!93499))

(assert (= (and b!93484 condMapEmpty!3648) mapIsEmpty!3648))

(assert (= (and b!93484 (not condMapEmpty!3648)) mapNonEmpty!3648))

(get-info :version)

(assert (= (and mapNonEmpty!3648 ((_ is ValueCellFull!959) mapValue!3647)) b!93489))

(assert (= (and b!93484 ((_ is ValueCellFull!959) mapDefault!3648)) b!93483))

(assert (= b!93497 b!93484))

(assert (= b!93494 b!93497))

(assert (= b!93490 b!93494))

(assert (= start!11316 b!93490))

(assert (= (and b!93486 condMapEmpty!3647) mapIsEmpty!3647))

(assert (= (and b!93486 (not condMapEmpty!3647)) mapNonEmpty!3647))

(assert (= (and mapNonEmpty!3647 ((_ is ValueCellFull!959) mapValue!3648)) b!93495))

(assert (= (and b!93486 ((_ is ValueCellFull!959) mapDefault!3647)) b!93491))

(assert (= b!93487 b!93486))

(assert (= start!11316 b!93487))

(declare-fun b_lambda!4127 () Bool)

(assert (=> (not b_lambda!4127) (not b!93498)))

(declare-fun t!5430 () Bool)

(declare-fun tb!1849 () Bool)

(assert (=> (and b!93497 (= (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))) t!5430) tb!1849))

(declare-fun result!3157 () Bool)

(assert (=> tb!1849 (= result!3157 tp_is_empty!2605)))

(assert (=> b!93498 t!5430))

(declare-fun b_and!5701 () Bool)

(assert (= b_and!5697 (and (=> t!5430 result!3157) b_and!5701)))

(declare-fun tb!1851 () Bool)

(declare-fun t!5432 () Bool)

(assert (=> (and b!93487 (= (defaultEntry!2430 newMap!16) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))) t!5432) tb!1851))

(declare-fun result!3161 () Bool)

(assert (= result!3161 result!3157))

(assert (=> b!93498 t!5432))

(declare-fun b_and!5703 () Bool)

(assert (= b_and!5699 (and (=> t!5432 result!3161) b_and!5703)))

(declare-fun m!100847 () Bool)

(assert (=> start!11316 m!100847))

(declare-fun m!100849 () Bool)

(assert (=> mapNonEmpty!3647 m!100849))

(declare-fun m!100851 () Bool)

(assert (=> b!93500 m!100851))

(declare-fun m!100853 () Bool)

(assert (=> b!93500 m!100853))

(declare-fun m!100855 () Bool)

(assert (=> b!93500 m!100855))

(declare-fun m!100857 () Bool)

(assert (=> b!93499 m!100857))

(declare-fun m!100859 () Bool)

(assert (=> b!93496 m!100859))

(declare-fun m!100861 () Bool)

(assert (=> b!93497 m!100861))

(declare-fun m!100863 () Bool)

(assert (=> b!93497 m!100863))

(declare-fun m!100865 () Bool)

(assert (=> b!93498 m!100865))

(declare-fun m!100867 () Bool)

(assert (=> b!93498 m!100867))

(declare-fun m!100869 () Bool)

(assert (=> b!93498 m!100869))

(assert (=> b!93498 m!100851))

(assert (=> b!93498 m!100851))

(declare-fun m!100871 () Bool)

(assert (=> b!93498 m!100871))

(assert (=> b!93498 m!100867))

(assert (=> b!93498 m!100851))

(assert (=> b!93498 m!100869))

(declare-fun m!100873 () Bool)

(assert (=> b!93498 m!100873))

(assert (=> b!93498 m!100865))

(declare-fun m!100875 () Bool)

(assert (=> mapNonEmpty!3648 m!100875))

(declare-fun m!100877 () Bool)

(assert (=> b!93487 m!100877))

(declare-fun m!100879 () Bool)

(assert (=> b!93487 m!100879))

(declare-fun m!100881 () Bool)

(assert (=> b!93493 m!100881))

(declare-fun m!100883 () Bool)

(assert (=> b!93493 m!100883))

(assert (=> b!93493 m!100851))

(declare-fun m!100885 () Bool)

(assert (=> b!93493 m!100885))

(assert (=> b!93493 m!100851))

(assert (=> b!93493 m!100851))

(declare-fun m!100887 () Bool)

(assert (=> b!93493 m!100887))

(assert (=> b!93493 m!100851))

(declare-fun m!100889 () Bool)

(assert (=> b!93493 m!100889))

(check-sat (not b!93487) (not b_lambda!4127) b_and!5701 (not b!93498) (not b_next!2377) (not mapNonEmpty!3647) (not b_next!2379) (not b!93496) (not mapNonEmpty!3648) tp_is_empty!2605 (not b!93500) b_and!5703 (not b!93493) (not b!93499) (not start!11316) (not b!93497))
(check-sat b_and!5701 b_and!5703 (not b_next!2377) (not b_next!2379))
(get-model)

(declare-fun b_lambda!4133 () Bool)

(assert (= b_lambda!4127 (or (and b!93497 b_free!2377) (and b!93487 b_free!2379 (= (defaultEntry!2430 newMap!16) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))))) b_lambda!4133)))

(check-sat (not b!93487) b_and!5701 (not b!93498) (not b_next!2377) (not b_lambda!4133) (not mapNonEmpty!3647) (not b_next!2379) (not b!93496) (not mapNonEmpty!3648) tp_is_empty!2605 (not b!93500) b_and!5703 (not b!93493) (not b!93499) (not start!11316) (not b!93497))
(check-sat b_and!5701 b_and!5703 (not b_next!2377) (not b_next!2379))
(get-model)

(declare-fun d!24537 () Bool)

(assert (=> d!24537 (= (validMask!0 (mask!6502 (v!2756 (underlying!327 thiss!992)))) (and (or (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000001111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000011111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000001111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000011111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000001111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000011111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000001111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000011111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000000111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000001111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000011111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000000111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000001111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000011111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000000111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000001111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000011111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000000111111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000001111111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000011111111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00000111111111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00001111111111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00011111111111111111111111111111) (= (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6502 (v!2756 (underlying!327 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!93499 d!24537))

(declare-fun d!24539 () Bool)

(declare-fun e!61130 () Bool)

(assert (=> d!24539 e!61130))

(declare-fun res!47479 () Bool)

(assert (=> d!24539 (=> res!47479 e!61130)))

(declare-fun lt!46326 () Bool)

(assert (=> d!24539 (= res!47479 (not lt!46326))))

(declare-fun lt!46328 () Bool)

(assert (=> d!24539 (= lt!46326 lt!46328)))

(declare-fun lt!46325 () Unit!2775)

(declare-fun e!61131 () Unit!2775)

(assert (=> d!24539 (= lt!46325 e!61131)))

(declare-fun c!15575 () Bool)

(assert (=> d!24539 (= c!15575 lt!46328)))

(declare-fun containsKey!151 (List!1552 (_ BitVec 64)) Bool)

(assert (=> d!24539 (= lt!46328 (containsKey!151 (toList!759 lt!46268) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(assert (=> d!24539 (= (contains!778 lt!46268 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)) lt!46326)))

(declare-fun b!93621 () Bool)

(declare-fun lt!46327 () Unit!2775)

(assert (=> b!93621 (= e!61131 lt!46327)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!99 (List!1552 (_ BitVec 64)) Unit!2775)

(assert (=> b!93621 (= lt!46327 (lemmaContainsKeyImpliesGetValueByKeyDefined!99 (toList!759 lt!46268) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-datatypes ((Option!154 0))(
  ( (Some!153 (v!2762 V!3121)) (None!152) )
))
(declare-fun isDefined!100 (Option!154) Bool)

(declare-fun getValueByKey!148 (List!1552 (_ BitVec 64)) Option!154)

(assert (=> b!93621 (isDefined!100 (getValueByKey!148 (toList!759 lt!46268) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun b!93622 () Bool)

(declare-fun Unit!2782 () Unit!2775)

(assert (=> b!93622 (= e!61131 Unit!2782)))

(declare-fun b!93623 () Bool)

(assert (=> b!93623 (= e!61130 (isDefined!100 (getValueByKey!148 (toList!759 lt!46268) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355))))))

(assert (= (and d!24539 c!15575) b!93621))

(assert (= (and d!24539 (not c!15575)) b!93622))

(assert (= (and d!24539 (not res!47479)) b!93623))

(assert (=> d!24539 m!100851))

(declare-fun m!100979 () Bool)

(assert (=> d!24539 m!100979))

(assert (=> b!93621 m!100851))

(declare-fun m!100981 () Bool)

(assert (=> b!93621 m!100981))

(assert (=> b!93621 m!100851))

(declare-fun m!100983 () Bool)

(assert (=> b!93621 m!100983))

(assert (=> b!93621 m!100983))

(declare-fun m!100985 () Bool)

(assert (=> b!93621 m!100985))

(assert (=> b!93623 m!100851))

(assert (=> b!93623 m!100983))

(assert (=> b!93623 m!100983))

(assert (=> b!93623 m!100985))

(assert (=> b!93498 d!24539))

(declare-fun bm!9295 () Bool)

(declare-fun call!9320 () Unit!2775)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!38 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) Int) Unit!2775)

(assert (=> bm!9295 (= call!9320 (lemmaInListMapThenSeekEntryOrOpenFindsIt!38 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (defaultEntry!2430 newMap!16)))))

(declare-fun b!93708 () Bool)

(declare-fun e!61183 () Bool)

(declare-datatypes ((SeekEntryResult!244 0))(
  ( (MissingZero!244 (index!3117 (_ BitVec 32))) (Found!244 (index!3118 (_ BitVec 32))) (Intermediate!244 (undefined!1056 Bool) (index!3119 (_ BitVec 32)) (x!12608 (_ BitVec 32))) (Undefined!244) (MissingVacant!244 (index!3120 (_ BitVec 32))) )
))
(declare-fun lt!46392 () SeekEntryResult!244)

(assert (=> b!93708 (= e!61183 ((_ is Undefined!244) lt!46392))))

(declare-fun b!93709 () Bool)

(declare-fun res!47518 () Bool)

(declare-fun call!9313 () Bool)

(assert (=> b!93709 (= res!47518 call!9313)))

(declare-fun e!61179 () Bool)

(assert (=> b!93709 (=> (not res!47518) (not e!61179))))

(declare-fun c!15604 () Bool)

(declare-fun lt!46397 () SeekEntryResult!244)

(declare-fun call!9311 () Bool)

(declare-fun c!15613 () Bool)

(declare-fun lt!46387 () SeekEntryResult!244)

(declare-fun c!15614 () Bool)

(declare-fun c!15608 () Bool)

(declare-fun c!15615 () Bool)

(declare-fun bm!9296 () Bool)

(declare-fun lt!46399 () SeekEntryResult!244)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9296 (= call!9311 (inRange!0 (ite c!15613 (ite c!15604 (index!3118 lt!46397) (ite c!15615 (index!3117 lt!46392) (index!3120 lt!46392))) (ite c!15608 (index!3118 lt!46387) (ite c!15614 (index!3117 lt!46399) (index!3120 lt!46399)))) (mask!6502 newMap!16)))))

(declare-fun bm!9297 () Bool)

(declare-fun call!9301 () ListLongMap!1487)

(declare-fun call!9308 () ListLongMap!1487)

(assert (=> bm!9297 (= call!9301 call!9308)))

(declare-fun b!93710 () Bool)

(declare-fun e!61194 () tuple2!2276)

(declare-fun lt!46383 () tuple2!2276)

(assert (=> b!93710 (= e!61194 (tuple2!2277 (_1!1149 lt!46383) (_2!1149 lt!46383)))))

(declare-fun call!9319 () tuple2!2276)

(assert (=> b!93710 (= lt!46383 call!9319)))

(declare-fun b!93711 () Bool)

(declare-fun res!47520 () Bool)

(assert (=> b!93711 (= res!47520 (= (select (arr!1982 (_keys!4112 newMap!16)) (index!3120 lt!46392)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!61184 () Bool)

(assert (=> b!93711 (=> (not res!47520) (not e!61184))))

(declare-fun b!93712 () Bool)

(declare-fun lt!46405 () Unit!2775)

(declare-fun lt!46401 () Unit!2775)

(assert (=> b!93712 (= lt!46405 lt!46401)))

(declare-fun call!9307 () ListLongMap!1487)

(assert (=> b!93712 (= call!9301 call!9307)))

(declare-fun lt!46402 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!38 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 V!3121 Int) Unit!2775)

(assert (=> b!93712 (= lt!46401 (lemmaChangeLongMinValueKeyThenAddPairToListMap!38 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) lt!46402 (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2430 newMap!16)))))

(assert (=> b!93712 (= lt!46402 (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!61186 () tuple2!2276)

(assert (=> b!93712 (= e!61186 (tuple2!2277 true (LongMapFixedSize!827 (defaultEntry!2430 newMap!16) (mask!6502 newMap!16) (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000010) (zeroValue!2317 newMap!16) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!462 newMap!16) (_keys!4112 newMap!16) (_values!2413 newMap!16) (_vacant!462 newMap!16))))))

(declare-fun e!61192 () Bool)

(declare-fun call!9318 () ListLongMap!1487)

(declare-fun b!93713 () Bool)

(declare-fun call!9315 () ListLongMap!1487)

(declare-fun +!127 (ListLongMap!1487 tuple2!2278) ListLongMap!1487)

(assert (=> b!93713 (= e!61192 (= call!9318 (+!127 call!9315 (tuple2!2279 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!9298 () Bool)

(declare-fun call!9298 () SeekEntryResult!244)

(declare-fun call!9317 () SeekEntryResult!244)

(assert (=> bm!9298 (= call!9298 call!9317)))

(declare-fun b!93714 () Bool)

(declare-fun e!61193 () Bool)

(declare-fun e!61196 () Bool)

(assert (=> b!93714 (= e!61193 e!61196)))

(declare-fun c!15610 () Bool)

(declare-fun lt!46396 () tuple2!2276)

(assert (=> b!93714 (= c!15610 (_1!1149 lt!46396))))

(declare-fun b!93715 () Bool)

(assert (=> b!93715 (= e!61196 e!61192)))

(declare-fun res!47514 () Bool)

(assert (=> b!93715 (= res!47514 (contains!778 call!9318 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(assert (=> b!93715 (=> (not res!47514) (not e!61192))))

(declare-fun b!93716 () Bool)

(declare-fun res!47521 () Bool)

(declare-fun e!61182 () Bool)

(assert (=> b!93716 (=> (not res!47521) (not e!61182))))

(assert (=> b!93716 (= res!47521 (= (select (arr!1982 (_keys!4112 newMap!16)) (index!3117 lt!46392)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93717 () Bool)

(declare-fun e!61181 () ListLongMap!1487)

(assert (=> b!93717 (= e!61181 (getCurrentListMap!449 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun b!93718 () Bool)

(declare-fun c!15616 () Bool)

(declare-fun lt!46406 () SeekEntryResult!244)

(assert (=> b!93718 (= c!15616 ((_ is MissingVacant!244) lt!46406))))

(declare-fun e!61191 () tuple2!2276)

(assert (=> b!93718 (= e!61191 e!61194)))

(declare-fun b!93719 () Bool)

(assert (=> b!93719 (= e!61179 (= (select (arr!1982 (_keys!4112 newMap!16)) (index!3118 lt!46387)) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun b!93720 () Bool)

(assert (=> b!93720 (= e!61196 (= call!9318 call!9315))))

(declare-fun b!93721 () Bool)

(declare-fun res!47513 () Bool)

(declare-fun e!61195 () Bool)

(assert (=> b!93721 (=> (not res!47513) (not e!61195))))

(assert (=> b!93721 (= res!47513 (= (select (arr!1982 (_keys!4112 newMap!16)) (index!3117 lt!46399)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9299 () Bool)

(declare-fun call!9321 () Unit!2775)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!38 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) Int) Unit!2775)

(assert (=> bm!9299 (= call!9321 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!38 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (defaultEntry!2430 newMap!16)))))

(declare-fun bm!9300 () Bool)

(declare-fun updateHelperNewKey!38 (LongMapFixedSize!826 (_ BitVec 64) V!3121 (_ BitVec 32)) tuple2!2276)

(assert (=> bm!9300 (= call!9319 (updateHelperNewKey!38 newMap!16 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!15616 (index!3120 lt!46406) (index!3117 lt!46406))))))

(declare-fun b!93722 () Bool)

(declare-fun lt!46409 () Unit!2775)

(declare-fun lt!46393 () Unit!2775)

(assert (=> b!93722 (= lt!46409 lt!46393)))

(declare-fun call!9314 () ListLongMap!1487)

(assert (=> b!93722 (contains!778 call!9314 (select (arr!1982 (_keys!4112 newMap!16)) (index!3118 lt!46406)))))

(declare-fun lt!46408 () array!4171)

(declare-fun lemmaValidKeyInArrayIsInListMap!98 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) Unit!2775)

(assert (=> b!93722 (= lt!46393 (lemmaValidKeyInArrayIsInListMap!98 (_keys!4112 newMap!16) lt!46408 (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (index!3118 lt!46406) (defaultEntry!2430 newMap!16)))))

(assert (=> b!93722 (= lt!46408 (array!4172 (store (arr!1983 (_values!2413 newMap!16)) (index!3118 lt!46406) (ValueCellFull!959 (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2231 (_values!2413 newMap!16))))))

(declare-fun lt!46389 () Unit!2775)

(declare-fun lt!46404 () Unit!2775)

(assert (=> b!93722 (= lt!46389 lt!46404)))

(declare-fun call!9303 () ListLongMap!1487)

(assert (=> b!93722 (= call!9308 call!9303)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!38 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) (_ BitVec 64) V!3121 Int) Unit!2775)

(assert (=> b!93722 (= lt!46404 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!38 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (index!3118 lt!46406) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2430 newMap!16)))))

(declare-fun lt!46407 () Unit!2775)

(declare-fun e!61187 () Unit!2775)

(assert (=> b!93722 (= lt!46407 e!61187)))

(declare-fun call!9304 () Bool)

(assert (=> b!93722 (= c!15608 call!9304)))

(declare-fun e!61185 () tuple2!2276)

(assert (=> b!93722 (= e!61185 (tuple2!2277 true (LongMapFixedSize!827 (defaultEntry!2430 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (_size!462 newMap!16) (_keys!4112 newMap!16) (array!4172 (store (arr!1983 (_values!2413 newMap!16)) (index!3118 lt!46406) (ValueCellFull!959 (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2231 (_values!2413 newMap!16))) (_vacant!462 newMap!16))))))

(declare-fun b!93723 () Bool)

(assert (=> b!93723 (= e!61194 e!61185)))

(declare-fun c!15606 () Bool)

(assert (=> b!93723 (= c!15606 ((_ is MissingZero!244) lt!46406))))

(declare-fun lt!46398 () (_ BitVec 32))

(declare-fun c!15617 () Bool)

(declare-fun c!15609 () Bool)

(declare-fun bm!9301 () Bool)

(assert (=> bm!9301 (= call!9303 (getCurrentListMap!449 (_keys!4112 newMap!16) (ite c!15617 (_values!2413 newMap!16) (array!4172 (store (arr!1983 (_values!2413 newMap!16)) (index!3118 lt!46406) (ValueCellFull!959 (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2231 (_values!2413 newMap!16)))) (mask!6502 newMap!16) (ite (and c!15617 c!15609) lt!46398 (extraKeys!2259 newMap!16)) (ite (and c!15617 c!15609) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2317 newMap!16)) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun b!93724 () Bool)

(declare-fun call!9312 () Bool)

(assert (=> b!93724 (= e!61182 (not call!9312))))

(declare-fun b!93725 () Bool)

(declare-fun e!61188 () Bool)

(declare-fun e!61189 () Bool)

(assert (=> b!93725 (= e!61188 e!61189)))

(declare-fun res!47519 () Bool)

(declare-fun call!9310 () Bool)

(assert (=> b!93725 (= res!47519 call!9310)))

(assert (=> b!93725 (=> (not res!47519) (not e!61189))))

(declare-fun bm!9302 () Bool)

(declare-fun call!9300 () Bool)

(declare-fun call!9309 () Bool)

(assert (=> bm!9302 (= call!9300 call!9309)))

(declare-fun bm!9303 () Bool)

(declare-fun call!9299 () ListLongMap!1487)

(assert (=> bm!9303 (= call!9314 call!9299)))

(declare-fun b!93726 () Bool)

(declare-fun res!47510 () Bool)

(assert (=> b!93726 (= res!47510 (= (select (arr!1982 (_keys!4112 newMap!16)) (index!3120 lt!46399)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93726 (=> (not res!47510) (not e!61189))))

(declare-fun bm!9304 () Bool)

(declare-fun call!9306 () ListLongMap!1487)

(assert (=> bm!9304 (= call!9306 call!9303)))

(declare-fun bm!9305 () Bool)

(assert (=> bm!9305 (= call!9312 call!9309)))

(declare-fun e!61197 () ListLongMap!1487)

(declare-fun bm!9306 () Bool)

(assert (=> bm!9306 (= call!9308 (+!127 e!61197 (ite c!15617 (ite c!15609 (tuple2!2279 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2279 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2279 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!15605 () Bool)

(assert (=> bm!9306 (= c!15605 c!15617)))

(declare-fun b!93727 () Bool)

(declare-fun e!61180 () Unit!2775)

(declare-fun Unit!2783 () Unit!2775)

(assert (=> b!93727 (= e!61180 Unit!2783)))

(declare-fun lt!46388 () Unit!2775)

(assert (=> b!93727 (= lt!46388 call!9320)))

(assert (=> b!93727 (= lt!46397 call!9298)))

(declare-fun res!47517 () Bool)

(assert (=> b!93727 (= res!47517 ((_ is Found!244) lt!46397))))

(declare-fun e!61176 () Bool)

(assert (=> b!93727 (=> (not res!47517) (not e!61176))))

(assert (=> b!93727 e!61176))

(declare-fun lt!46394 () Unit!2775)

(assert (=> b!93727 (= lt!46394 lt!46388)))

(assert (=> b!93727 false))

(declare-fun b!93728 () Bool)

(assert (=> b!93728 (= e!61195 (not call!9300))))

(declare-fun bm!9307 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4169 (_ BitVec 32)) SeekEntryResult!244)

(assert (=> bm!9307 (= call!9317 (seekEntryOrOpen!0 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (_keys!4112 newMap!16) (mask!6502 newMap!16)))))

(declare-fun bm!9308 () Bool)

(assert (=> bm!9308 (= call!9307 call!9299)))

(declare-fun b!93729 () Bool)

(declare-fun lt!46384 () Unit!2775)

(assert (=> b!93729 (= e!61180 lt!46384)))

(assert (=> b!93729 (= lt!46384 call!9321)))

(assert (=> b!93729 (= lt!46392 call!9298)))

(assert (=> b!93729 (= c!15615 ((_ is MissingZero!244) lt!46392))))

(declare-fun e!61178 () Bool)

(assert (=> b!93729 e!61178))

(declare-fun bm!9309 () Bool)

(declare-fun call!9316 () SeekEntryResult!244)

(assert (=> bm!9309 (= call!9316 call!9317)))

(declare-fun b!93730 () Bool)

(declare-fun c!15611 () Bool)

(assert (=> b!93730 (= c!15611 ((_ is MissingVacant!244) lt!46392))))

(assert (=> b!93730 (= e!61178 e!61183)))

(declare-fun d!24541 () Bool)

(assert (=> d!24541 e!61193))

(declare-fun res!47515 () Bool)

(assert (=> d!24541 (=> (not res!47515) (not e!61193))))

(assert (=> d!24541 (= res!47515 (valid!382 (_2!1149 lt!46396)))))

(declare-fun e!61190 () tuple2!2276)

(assert (=> d!24541 (= lt!46396 e!61190)))

(assert (=> d!24541 (= c!15617 (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvneg (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355))))))

(assert (=> d!24541 (valid!382 newMap!16)))

(assert (=> d!24541 (= (update!140 newMap!16 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!46396)))

(declare-fun b!93731 () Bool)

(declare-fun res!47509 () Bool)

(declare-fun call!9305 () Bool)

(assert (=> b!93731 (= res!47509 call!9305)))

(assert (=> b!93731 (=> (not res!47509) (not e!61176))))

(declare-fun b!93732 () Bool)

(declare-fun lt!46403 () Unit!2775)

(assert (=> b!93732 (= lt!46403 e!61180)))

(assert (=> b!93732 (= c!15604 call!9304)))

(assert (=> b!93732 (= e!61191 (tuple2!2277 false newMap!16))))

(declare-fun bm!9310 () Bool)

(assert (=> bm!9310 (= call!9313 call!9311)))

(declare-fun bm!9311 () Bool)

(assert (=> bm!9311 (= call!9310 call!9313)))

(declare-fun bm!9312 () Bool)

(assert (=> bm!9312 (= call!9318 (map!1239 (_2!1149 lt!46396)))))

(declare-fun bm!9313 () Bool)

(declare-fun c!15607 () Bool)

(assert (=> bm!9313 (= c!15607 c!15613)))

(assert (=> bm!9313 (= call!9304 (contains!778 e!61181 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun b!93733 () Bool)

(assert (=> b!93733 (= e!61183 e!61184)))

(declare-fun res!47516 () Bool)

(declare-fun call!9302 () Bool)

(assert (=> b!93733 (= res!47516 call!9302)))

(assert (=> b!93733 (=> (not res!47516) (not e!61184))))

(declare-fun b!93734 () Bool)

(declare-fun Unit!2784 () Unit!2775)

(assert (=> b!93734 (= e!61187 Unit!2784)))

(declare-fun lt!46400 () Unit!2775)

(assert (=> b!93734 (= lt!46400 call!9321)))

(assert (=> b!93734 (= lt!46399 call!9316)))

(assert (=> b!93734 (= c!15614 ((_ is MissingZero!244) lt!46399))))

(declare-fun e!61177 () Bool)

(assert (=> b!93734 e!61177))

(declare-fun lt!46391 () Unit!2775)

(assert (=> b!93734 (= lt!46391 lt!46400)))

(assert (=> b!93734 false))

(declare-fun b!93735 () Bool)

(assert (=> b!93735 (= e!61197 (ite c!15609 call!9307 call!9306))))

(declare-fun b!93736 () Bool)

(declare-fun lt!46386 () tuple2!2276)

(assert (=> b!93736 (= lt!46386 call!9319)))

(assert (=> b!93736 (= e!61185 (tuple2!2277 (_1!1149 lt!46386) (_2!1149 lt!46386)))))

(declare-fun b!93737 () Bool)

(assert (=> b!93737 (= e!61176 (= (select (arr!1982 (_keys!4112 newMap!16)) (index!3118 lt!46397)) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun b!93738 () Bool)

(assert (=> b!93738 (= e!61189 (not call!9300))))

(declare-fun b!93739 () Bool)

(declare-fun res!47512 () Bool)

(assert (=> b!93739 (=> (not res!47512) (not e!61182))))

(assert (=> b!93739 (= res!47512 call!9302)))

(assert (=> b!93739 (= e!61178 e!61182)))

(declare-fun b!93740 () Bool)

(declare-fun res!47508 () Bool)

(assert (=> b!93740 (=> (not res!47508) (not e!61195))))

(assert (=> b!93740 (= res!47508 call!9310)))

(assert (=> b!93740 (= e!61177 e!61195)))

(declare-fun b!93741 () Bool)

(declare-fun lt!46385 () Unit!2775)

(declare-fun lt!46390 () Unit!2775)

(assert (=> b!93741 (= lt!46385 lt!46390)))

(assert (=> b!93741 (= call!9301 call!9306)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!38 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 V!3121 Int) Unit!2775)

(assert (=> b!93741 (= lt!46390 (lemmaChangeZeroKeyThenAddPairToListMap!38 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) lt!46398 (zeroValue!2317 newMap!16) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2317 newMap!16) (defaultEntry!2430 newMap!16)))))

(assert (=> b!93741 (= lt!46398 (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!93741 (= e!61186 (tuple2!2277 true (LongMapFixedSize!827 (defaultEntry!2430 newMap!16) (mask!6502 newMap!16) (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000001) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2317 newMap!16) (_size!462 newMap!16) (_keys!4112 newMap!16) (_values!2413 newMap!16) (_vacant!462 newMap!16))))))

(declare-fun b!93742 () Bool)

(assert (=> b!93742 (= e!61190 e!61186)))

(assert (=> b!93742 (= c!15609 (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9314 () Bool)

(assert (=> bm!9314 (= call!9302 call!9305)))

(declare-fun b!93743 () Bool)

(declare-fun lt!46395 () Unit!2775)

(assert (=> b!93743 (= e!61187 lt!46395)))

(assert (=> b!93743 (= lt!46395 call!9320)))

(assert (=> b!93743 (= lt!46387 call!9316)))

(declare-fun res!47511 () Bool)

(assert (=> b!93743 (= res!47511 ((_ is Found!244) lt!46387))))

(assert (=> b!93743 (=> (not res!47511) (not e!61179))))

(assert (=> b!93743 e!61179))

(declare-fun bm!9315 () Bool)

(assert (=> bm!9315 (= call!9315 (map!1239 newMap!16))))

(declare-fun b!93744 () Bool)

(assert (=> b!93744 (= e!61197 (getCurrentListMap!449 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun b!93745 () Bool)

(declare-fun c!15612 () Bool)

(assert (=> b!93745 (= c!15612 ((_ is MissingVacant!244) lt!46399))))

(assert (=> b!93745 (= e!61177 e!61188)))

(declare-fun bm!9316 () Bool)

(assert (=> bm!9316 (= call!9309 (arrayContainsKey!0 (_keys!4112 newMap!16) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!93746 () Bool)

(assert (=> b!93746 (= e!61184 (not call!9312))))

(declare-fun b!93747 () Bool)

(assert (=> b!93747 (= e!61188 ((_ is Undefined!244) lt!46399))))

(declare-fun b!93748 () Bool)

(assert (=> b!93748 (= e!61190 e!61191)))

(assert (=> b!93748 (= lt!46406 (seekEntryOrOpen!0 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (_keys!4112 newMap!16) (mask!6502 newMap!16)))))

(assert (=> b!93748 (= c!15613 ((_ is Undefined!244) lt!46406))))

(declare-fun b!93749 () Bool)

(assert (=> b!93749 (= e!61181 call!9314)))

(declare-fun bm!9317 () Bool)

(assert (=> bm!9317 (= call!9305 call!9311)))

(declare-fun bm!9318 () Bool)

(assert (=> bm!9318 (= call!9299 (getCurrentListMap!449 (_keys!4112 newMap!16) (ite (or c!15617 c!15613) (_values!2413 newMap!16) lt!46408) (mask!6502 newMap!16) (ite c!15617 (ite c!15609 (extraKeys!2259 newMap!16) lt!46402) (extraKeys!2259 newMap!16)) (zeroValue!2317 newMap!16) (ite c!15617 (ite c!15609 (minValue!2317 newMap!16) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2317 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(assert (= (and d!24541 c!15617) b!93742))

(assert (= (and d!24541 (not c!15617)) b!93748))

(assert (= (and b!93742 c!15609) b!93741))

(assert (= (and b!93742 (not c!15609)) b!93712))

(assert (= (or b!93741 b!93712) bm!9308))

(assert (= (or b!93741 b!93712) bm!9304))

(assert (= (or b!93741 b!93712) bm!9297))

(assert (= (and b!93748 c!15613) b!93732))

(assert (= (and b!93748 (not c!15613)) b!93718))

(assert (= (and b!93732 c!15604) b!93727))

(assert (= (and b!93732 (not c!15604)) b!93729))

(assert (= (and b!93727 res!47517) b!93731))

(assert (= (and b!93731 res!47509) b!93737))

(assert (= (and b!93729 c!15615) b!93739))

(assert (= (and b!93729 (not c!15615)) b!93730))

(assert (= (and b!93739 res!47512) b!93716))

(assert (= (and b!93716 res!47521) b!93724))

(assert (= (and b!93730 c!15611) b!93733))

(assert (= (and b!93730 (not c!15611)) b!93708))

(assert (= (and b!93733 res!47516) b!93711))

(assert (= (and b!93711 res!47520) b!93746))

(assert (= (or b!93739 b!93733) bm!9314))

(assert (= (or b!93724 b!93746) bm!9305))

(assert (= (or b!93731 bm!9314) bm!9317))

(assert (= (or b!93727 b!93729) bm!9298))

(assert (= (and b!93718 c!15616) b!93710))

(assert (= (and b!93718 (not c!15616)) b!93723))

(assert (= (and b!93723 c!15606) b!93736))

(assert (= (and b!93723 (not c!15606)) b!93722))

(assert (= (and b!93722 c!15608) b!93743))

(assert (= (and b!93722 (not c!15608)) b!93734))

(assert (= (and b!93743 res!47511) b!93709))

(assert (= (and b!93709 res!47518) b!93719))

(assert (= (and b!93734 c!15614) b!93740))

(assert (= (and b!93734 (not c!15614)) b!93745))

(assert (= (and b!93740 res!47508) b!93721))

(assert (= (and b!93721 res!47513) b!93728))

(assert (= (and b!93745 c!15612) b!93725))

(assert (= (and b!93745 (not c!15612)) b!93747))

(assert (= (and b!93725 res!47519) b!93726))

(assert (= (and b!93726 res!47510) b!93738))

(assert (= (or b!93740 b!93725) bm!9311))

(assert (= (or b!93728 b!93738) bm!9302))

(assert (= (or b!93709 bm!9311) bm!9310))

(assert (= (or b!93743 b!93734) bm!9309))

(assert (= (or b!93710 b!93736) bm!9300))

(assert (= (or bm!9298 bm!9309) bm!9307))

(assert (= (or bm!9305 bm!9302) bm!9316))

(assert (= (or bm!9317 bm!9310) bm!9296))

(assert (= (or b!93727 b!93743) bm!9295))

(assert (= (or b!93732 b!93722) bm!9303))

(assert (= (or b!93729 b!93734) bm!9299))

(assert (= (or b!93732 b!93722) bm!9313))

(assert (= (and bm!9313 c!15607) b!93749))

(assert (= (and bm!9313 (not c!15607)) b!93717))

(assert (= (or bm!9308 bm!9303) bm!9318))

(assert (= (or bm!9304 b!93722) bm!9301))

(assert (= (or bm!9297 b!93722) bm!9306))

(assert (= (and bm!9306 c!15605) b!93735))

(assert (= (and bm!9306 (not c!15605)) b!93744))

(assert (= (and d!24541 res!47515) b!93714))

(assert (= (and b!93714 c!15610) b!93715))

(assert (= (and b!93714 (not c!15610)) b!93720))

(assert (= (and b!93715 res!47514) b!93713))

(assert (= (or b!93715 b!93713 b!93720) bm!9312))

(assert (= (or b!93713 b!93720) bm!9315))

(assert (=> b!93741 m!100869))

(declare-fun m!100987 () Bool)

(assert (=> b!93741 m!100987))

(declare-fun m!100989 () Bool)

(assert (=> b!93716 m!100989))

(declare-fun m!100991 () Bool)

(assert (=> bm!9301 m!100991))

(declare-fun m!100993 () Bool)

(assert (=> bm!9301 m!100993))

(declare-fun m!100995 () Bool)

(assert (=> b!93721 m!100995))

(assert (=> bm!9299 m!100851))

(declare-fun m!100997 () Bool)

(assert (=> bm!9299 m!100997))

(declare-fun m!100999 () Bool)

(assert (=> b!93719 m!100999))

(assert (=> b!93715 m!100851))

(declare-fun m!101001 () Bool)

(assert (=> b!93715 m!101001))

(declare-fun m!101003 () Bool)

(assert (=> bm!9296 m!101003))

(declare-fun m!101005 () Bool)

(assert (=> b!93737 m!101005))

(declare-fun m!101007 () Bool)

(assert (=> b!93717 m!101007))

(declare-fun m!101009 () Bool)

(assert (=> b!93711 m!101009))

(declare-fun m!101011 () Bool)

(assert (=> b!93722 m!101011))

(declare-fun m!101013 () Bool)

(assert (=> b!93722 m!101013))

(declare-fun m!101015 () Bool)

(assert (=> b!93722 m!101015))

(assert (=> b!93722 m!100991))

(assert (=> b!93722 m!100851))

(assert (=> b!93722 m!100869))

(declare-fun m!101017 () Bool)

(assert (=> b!93722 m!101017))

(assert (=> b!93722 m!101013))

(declare-fun m!101019 () Bool)

(assert (=> bm!9312 m!101019))

(assert (=> b!93744 m!101007))

(declare-fun m!101021 () Bool)

(assert (=> b!93726 m!101021))

(assert (=> bm!9313 m!100851))

(declare-fun m!101023 () Bool)

(assert (=> bm!9313 m!101023))

(assert (=> bm!9316 m!100851))

(declare-fun m!101025 () Bool)

(assert (=> bm!9316 m!101025))

(assert (=> bm!9295 m!100851))

(declare-fun m!101027 () Bool)

(assert (=> bm!9295 m!101027))

(declare-fun m!101029 () Bool)

(assert (=> bm!9318 m!101029))

(declare-fun m!101031 () Bool)

(assert (=> d!24541 m!101031))

(assert (=> d!24541 m!100859))

(assert (=> bm!9315 m!100853))

(assert (=> b!93712 m!100869))

(declare-fun m!101033 () Bool)

(assert (=> b!93712 m!101033))

(assert (=> bm!9307 m!100851))

(declare-fun m!101035 () Bool)

(assert (=> bm!9307 m!101035))

(assert (=> b!93748 m!100851))

(assert (=> b!93748 m!101035))

(declare-fun m!101037 () Bool)

(assert (=> b!93713 m!101037))

(assert (=> bm!9300 m!100851))

(assert (=> bm!9300 m!100869))

(declare-fun m!101039 () Bool)

(assert (=> bm!9300 m!101039))

(declare-fun m!101041 () Bool)

(assert (=> bm!9306 m!101041))

(assert (=> b!93498 d!24541))

(declare-fun d!24543 () Bool)

(declare-fun c!15620 () Bool)

(assert (=> d!24543 (= c!15620 ((_ is ValueCellFull!959) (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun e!61200 () V!3121)

(assert (=> d!24543 (= (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!61200)))

(declare-fun b!93754 () Bool)

(declare-fun get!1268 (ValueCell!959 V!3121) V!3121)

(assert (=> b!93754 (= e!61200 (get!1268 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93755 () Bool)

(declare-fun get!1269 (ValueCell!959 V!3121) V!3121)

(assert (=> b!93755 (= e!61200 (get!1269 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24543 c!15620) b!93754))

(assert (= (and d!24543 (not c!15620)) b!93755))

(assert (=> b!93754 m!100865))

(assert (=> b!93754 m!100867))

(declare-fun m!101043 () Bool)

(assert (=> b!93754 m!101043))

(assert (=> b!93755 m!100865))

(assert (=> b!93755 m!100867))

(declare-fun m!101045 () Bool)

(assert (=> b!93755 m!101045))

(assert (=> b!93498 d!24543))

(declare-fun d!24545 () Bool)

(assert (=> d!24545 (not (arrayContainsKey!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46412 () Unit!2775)

(declare-fun choose!68 (array!4169 (_ BitVec 32) (_ BitVec 64) List!1551) Unit!2775)

(assert (=> d!24545 (= lt!46412 (choose!68 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (Cons!1547 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) Nil!1548)))))

(assert (=> d!24545 (bvslt (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24545 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (Cons!1547 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) Nil!1548)) lt!46412)))

(declare-fun bs!3860 () Bool)

(assert (= bs!3860 d!24545))

(assert (=> bs!3860 m!100851))

(assert (=> bs!3860 m!100887))

(assert (=> bs!3860 m!100851))

(declare-fun m!101047 () Bool)

(assert (=> bs!3860 m!101047))

(assert (=> b!93493 d!24545))

(declare-fun d!24547 () Bool)

(assert (=> d!24547 (arrayNoDuplicates!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) from!355 Nil!1548)))

(declare-fun lt!46415 () Unit!2775)

(declare-fun choose!39 (array!4169 (_ BitVec 32) (_ BitVec 32)) Unit!2775)

(assert (=> d!24547 (= lt!46415 (choose!39 (_keys!4112 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24547 (bvslt (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24547 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000000 from!355) lt!46415)))

(declare-fun bs!3861 () Bool)

(assert (= bs!3861 d!24547))

(assert (=> bs!3861 m!100883))

(declare-fun m!101049 () Bool)

(assert (=> bs!3861 m!101049))

(assert (=> b!93493 d!24547))

(declare-fun d!24549 () Bool)

(declare-fun res!47526 () Bool)

(declare-fun e!61205 () Bool)

(assert (=> d!24549 (=> res!47526 e!61205)))

(assert (=> d!24549 (= res!47526 (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(assert (=> d!24549 (= (arrayContainsKey!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!61205)))

(declare-fun b!93760 () Bool)

(declare-fun e!61206 () Bool)

(assert (=> b!93760 (= e!61205 e!61206)))

(declare-fun res!47527 () Bool)

(assert (=> b!93760 (=> (not res!47527) (not e!61206))))

(assert (=> b!93760 (= res!47527 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))

(declare-fun b!93761 () Bool)

(assert (=> b!93761 (= e!61206 (arrayContainsKey!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24549 (not res!47526)) b!93760))

(assert (= (and b!93760 res!47527) b!93761))

(declare-fun m!101051 () Bool)

(assert (=> d!24549 m!101051))

(assert (=> b!93761 m!100851))

(declare-fun m!101053 () Bool)

(assert (=> b!93761 m!101053))

(assert (=> b!93493 d!24549))

(declare-fun d!24551 () Bool)

(declare-fun e!61209 () Bool)

(assert (=> d!24551 e!61209))

(declare-fun c!15623 () Bool)

(assert (=> d!24551 (= c!15623 (and (not (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46418 () Unit!2775)

(declare-fun choose!565 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) (_ BitVec 32) Int) Unit!2775)

(assert (=> d!24551 (= lt!46418 (choose!565 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(assert (=> d!24551 (validMask!0 (mask!6502 (v!2756 (underlying!327 thiss!992))))))

(assert (=> d!24551 (= (lemmaListMapContainsThenArrayContainsFrom!79 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))) lt!46418)))

(declare-fun b!93766 () Bool)

(assert (=> b!93766 (= e!61209 (arrayContainsKey!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!93767 () Bool)

(assert (=> b!93767 (= e!61209 (ite (= (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24551 c!15623) b!93766))

(assert (= (and d!24551 (not c!15623)) b!93767))

(assert (=> d!24551 m!100851))

(declare-fun m!101055 () Bool)

(assert (=> d!24551 m!101055))

(assert (=> d!24551 m!100857))

(assert (=> b!93766 m!100851))

(assert (=> b!93766 m!100887))

(assert (=> b!93493 d!24551))

(declare-fun c!15626 () Bool)

(declare-fun bm!9321 () Bool)

(declare-fun call!9324 () Bool)

(assert (=> bm!9321 (= call!9324 (arrayNoDuplicates!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15626 (Cons!1547 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355) Nil!1548) Nil!1548)))))

(declare-fun b!93778 () Bool)

(declare-fun e!61220 () Bool)

(declare-fun e!61221 () Bool)

(assert (=> b!93778 (= e!61220 e!61221)))

(declare-fun res!47535 () Bool)

(assert (=> b!93778 (=> (not res!47535) (not e!61221))))

(declare-fun e!61218 () Bool)

(assert (=> b!93778 (= res!47535 (not e!61218))))

(declare-fun res!47536 () Bool)

(assert (=> b!93778 (=> (not res!47536) (not e!61218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!93778 (= res!47536 (validKeyInArray!0 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun b!93779 () Bool)

(declare-fun e!61219 () Bool)

(assert (=> b!93779 (= e!61219 call!9324)))

(declare-fun b!93780 () Bool)

(assert (=> b!93780 (= e!61219 call!9324)))

(declare-fun b!93781 () Bool)

(declare-fun contains!779 (List!1551 (_ BitVec 64)) Bool)

(assert (=> b!93781 (= e!61218 (contains!779 Nil!1548 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(declare-fun d!24553 () Bool)

(declare-fun res!47534 () Bool)

(assert (=> d!24553 (=> res!47534 e!61220)))

(assert (=> d!24553 (= res!47534 (bvsge from!355 (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))

(assert (=> d!24553 (= (arrayNoDuplicates!0 (_keys!4112 (v!2756 (underlying!327 thiss!992))) from!355 Nil!1548) e!61220)))

(declare-fun b!93782 () Bool)

(assert (=> b!93782 (= e!61221 e!61219)))

(assert (=> b!93782 (= c!15626 (validKeyInArray!0 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) from!355)))))

(assert (= (and d!24553 (not res!47534)) b!93778))

(assert (= (and b!93778 res!47536) b!93781))

(assert (= (and b!93778 res!47535) b!93782))

(assert (= (and b!93782 c!15626) b!93779))

(assert (= (and b!93782 (not c!15626)) b!93780))

(assert (= (or b!93779 b!93780) bm!9321))

(assert (=> bm!9321 m!100851))

(declare-fun m!101057 () Bool)

(assert (=> bm!9321 m!101057))

(assert (=> b!93778 m!100851))

(assert (=> b!93778 m!100851))

(declare-fun m!101059 () Bool)

(assert (=> b!93778 m!101059))

(assert (=> b!93781 m!100851))

(assert (=> b!93781 m!100851))

(declare-fun m!101061 () Bool)

(assert (=> b!93781 m!101061))

(assert (=> b!93782 m!100851))

(assert (=> b!93782 m!100851))

(assert (=> b!93782 m!101059))

(assert (=> b!93493 d!24553))

(declare-fun d!24555 () Bool)

(assert (=> d!24555 (= (array_inv!1223 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvsge (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93497 d!24555))

(declare-fun d!24557 () Bool)

(assert (=> d!24557 (= (array_inv!1224 (_values!2413 (v!2756 (underlying!327 thiss!992)))) (bvsge (size!2231 (_values!2413 (v!2756 (underlying!327 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93497 d!24557))

(declare-fun d!24559 () Bool)

(assert (=> d!24559 (= (array_inv!1223 (_keys!4112 newMap!16)) (bvsge (size!2230 (_keys!4112 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93487 d!24559))

(declare-fun d!24561 () Bool)

(assert (=> d!24561 (= (array_inv!1224 (_values!2413 newMap!16)) (bvsge (size!2231 (_values!2413 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93487 d!24561))

(declare-fun d!24563 () Bool)

(assert (=> d!24563 (= (valid!381 thiss!992) (valid!382 (v!2756 (underlying!327 thiss!992))))))

(declare-fun bs!3862 () Bool)

(assert (= bs!3862 d!24563))

(declare-fun m!101063 () Bool)

(assert (=> bs!3862 m!101063))

(assert (=> start!11316 d!24563))

(declare-fun d!24565 () Bool)

(declare-fun res!47543 () Bool)

(declare-fun e!61224 () Bool)

(assert (=> d!24565 (=> (not res!47543) (not e!61224))))

(declare-fun simpleValid!65 (LongMapFixedSize!826) Bool)

(assert (=> d!24565 (= res!47543 (simpleValid!65 newMap!16))))

(assert (=> d!24565 (= (valid!382 newMap!16) e!61224)))

(declare-fun b!93789 () Bool)

(declare-fun res!47544 () Bool)

(assert (=> b!93789 (=> (not res!47544) (not e!61224))))

(declare-fun arrayCountValidKeys!0 (array!4169 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!93789 (= res!47544 (= (arrayCountValidKeys!0 (_keys!4112 newMap!16) #b00000000000000000000000000000000 (size!2230 (_keys!4112 newMap!16))) (_size!462 newMap!16)))))

(declare-fun b!93790 () Bool)

(declare-fun res!47545 () Bool)

(assert (=> b!93790 (=> (not res!47545) (not e!61224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4169 (_ BitVec 32)) Bool)

(assert (=> b!93790 (= res!47545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4112 newMap!16) (mask!6502 newMap!16)))))

(declare-fun b!93791 () Bool)

(assert (=> b!93791 (= e!61224 (arrayNoDuplicates!0 (_keys!4112 newMap!16) #b00000000000000000000000000000000 Nil!1548))))

(assert (= (and d!24565 res!47543) b!93789))

(assert (= (and b!93789 res!47544) b!93790))

(assert (= (and b!93790 res!47545) b!93791))

(declare-fun m!101065 () Bool)

(assert (=> d!24565 m!101065))

(declare-fun m!101067 () Bool)

(assert (=> b!93789 m!101067))

(declare-fun m!101069 () Bool)

(assert (=> b!93790 m!101069))

(declare-fun m!101071 () Bool)

(assert (=> b!93791 m!101071))

(assert (=> b!93496 d!24565))

(declare-fun d!24567 () Bool)

(assert (=> d!24567 (= (map!1239 newMap!16) (getCurrentListMap!449 (_keys!4112 newMap!16) (_values!2413 newMap!16) (mask!6502 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun bs!3863 () Bool)

(assert (= bs!3863 d!24567))

(assert (=> bs!3863 m!101007))

(assert (=> b!93500 d!24567))

(declare-fun e!61252 () Bool)

(declare-fun lt!46465 () ListLongMap!1487)

(declare-fun b!93834 () Bool)

(declare-fun apply!89 (ListLongMap!1487 (_ BitVec 64)) V!3121)

(assert (=> b!93834 (= e!61252 (= (apply!89 lt!46465 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1267 (select (arr!1983 (_values!2413 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!365 (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93834 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2231 (_values!2413 (v!2756 (underlying!327 thiss!992))))))))

(assert (=> b!93834 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))

(declare-fun b!93835 () Bool)

(declare-fun e!61260 () Unit!2775)

(declare-fun lt!46467 () Unit!2775)

(assert (=> b!93835 (= e!61260 lt!46467)))

(declare-fun lt!46474 () ListLongMap!1487)

(declare-fun getCurrentListMapNoExtraKeys!92 (array!4169 array!4171 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) ListLongMap!1487)

(assert (=> b!93835 (= lt!46474 (getCurrentListMapNoExtraKeys!92 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun lt!46463 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46483 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46483 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46466 () Unit!2775)

(declare-fun addStillContains!65 (ListLongMap!1487 (_ BitVec 64) V!3121 (_ BitVec 64)) Unit!2775)

(assert (=> b!93835 (= lt!46466 (addStillContains!65 lt!46474 lt!46463 (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) lt!46483))))

(assert (=> b!93835 (contains!778 (+!127 lt!46474 (tuple2!2279 lt!46463 (zeroValue!2317 (v!2756 (underlying!327 thiss!992))))) lt!46483)))

(declare-fun lt!46471 () Unit!2775)

(assert (=> b!93835 (= lt!46471 lt!46466)))

(declare-fun lt!46478 () ListLongMap!1487)

(assert (=> b!93835 (= lt!46478 (getCurrentListMapNoExtraKeys!92 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun lt!46468 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46479 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46479 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46464 () Unit!2775)

(declare-fun addApplyDifferent!65 (ListLongMap!1487 (_ BitVec 64) V!3121 (_ BitVec 64)) Unit!2775)

(assert (=> b!93835 (= lt!46464 (addApplyDifferent!65 lt!46478 lt!46468 (minValue!2317 (v!2756 (underlying!327 thiss!992))) lt!46479))))

(assert (=> b!93835 (= (apply!89 (+!127 lt!46478 (tuple2!2279 lt!46468 (minValue!2317 (v!2756 (underlying!327 thiss!992))))) lt!46479) (apply!89 lt!46478 lt!46479))))

(declare-fun lt!46476 () Unit!2775)

(assert (=> b!93835 (= lt!46476 lt!46464)))

(declare-fun lt!46472 () ListLongMap!1487)

(assert (=> b!93835 (= lt!46472 (getCurrentListMapNoExtraKeys!92 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun lt!46481 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46477 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46477 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46484 () Unit!2775)

(assert (=> b!93835 (= lt!46484 (addApplyDifferent!65 lt!46472 lt!46481 (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) lt!46477))))

(assert (=> b!93835 (= (apply!89 (+!127 lt!46472 (tuple2!2279 lt!46481 (zeroValue!2317 (v!2756 (underlying!327 thiss!992))))) lt!46477) (apply!89 lt!46472 lt!46477))))

(declare-fun lt!46473 () Unit!2775)

(assert (=> b!93835 (= lt!46473 lt!46484)))

(declare-fun lt!46470 () ListLongMap!1487)

(assert (=> b!93835 (= lt!46470 (getCurrentListMapNoExtraKeys!92 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun lt!46469 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46469 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46480 () (_ BitVec 64))

(assert (=> b!93835 (= lt!46480 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93835 (= lt!46467 (addApplyDifferent!65 lt!46470 lt!46469 (minValue!2317 (v!2756 (underlying!327 thiss!992))) lt!46480))))

(assert (=> b!93835 (= (apply!89 (+!127 lt!46470 (tuple2!2279 lt!46469 (minValue!2317 (v!2756 (underlying!327 thiss!992))))) lt!46480) (apply!89 lt!46470 lt!46480))))

(declare-fun bm!9336 () Bool)

(declare-fun call!9344 () Bool)

(assert (=> bm!9336 (= call!9344 (contains!778 lt!46465 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93837 () Bool)

(declare-fun res!47570 () Bool)

(declare-fun e!61251 () Bool)

(assert (=> b!93837 (=> (not res!47570) (not e!61251))))

(declare-fun e!61258 () Bool)

(assert (=> b!93837 (= res!47570 e!61258)))

(declare-fun c!15641 () Bool)

(assert (=> b!93837 (= c!15641 (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!93838 () Bool)

(declare-fun e!61254 () ListLongMap!1487)

(declare-fun call!9343 () ListLongMap!1487)

(assert (=> b!93838 (= e!61254 call!9343)))

(declare-fun b!93839 () Bool)

(declare-fun e!61263 () Bool)

(assert (=> b!93839 (= e!61263 (= (apply!89 lt!46465 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2317 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun bm!9337 () Bool)

(declare-fun call!9345 () ListLongMap!1487)

(declare-fun call!9341 () ListLongMap!1487)

(assert (=> bm!9337 (= call!9345 call!9341)))

(declare-fun b!93840 () Bool)

(declare-fun e!61255 () ListLongMap!1487)

(declare-fun call!9342 () ListLongMap!1487)

(assert (=> b!93840 (= e!61255 (+!127 call!9342 (tuple2!2279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2317 (v!2756 (underlying!327 thiss!992))))))))

(declare-fun b!93841 () Bool)

(declare-fun e!61257 () Bool)

(assert (=> b!93841 (= e!61257 e!61252)))

(declare-fun res!47571 () Bool)

(assert (=> b!93841 (=> (not res!47571) (not e!61252))))

(assert (=> b!93841 (= res!47571 (contains!778 lt!46465 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93841 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))

(declare-fun b!93842 () Bool)

(declare-fun e!61262 () Bool)

(assert (=> b!93842 (= e!61262 e!61263)))

(declare-fun res!47572 () Bool)

(assert (=> b!93842 (= res!47572 call!9344)))

(assert (=> b!93842 (=> (not res!47572) (not e!61263))))

(declare-fun c!15640 () Bool)

(declare-fun bm!9338 () Bool)

(declare-fun call!9339 () ListLongMap!1487)

(declare-fun c!15643 () Bool)

(assert (=> bm!9338 (= call!9342 (+!127 (ite c!15643 call!9339 (ite c!15640 call!9341 call!9345)) (ite (or c!15643 c!15640) (tuple2!2279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2317 (v!2756 (underlying!327 thiss!992)))) (tuple2!2279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2317 (v!2756 (underlying!327 thiss!992)))))))))

(declare-fun b!93843 () Bool)

(declare-fun Unit!2785 () Unit!2775)

(assert (=> b!93843 (= e!61260 Unit!2785)))

(declare-fun bm!9339 () Bool)

(declare-fun call!9340 () Bool)

(assert (=> bm!9339 (= call!9340 (contains!778 lt!46465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93836 () Bool)

(assert (=> b!93836 (= e!61258 (not call!9340))))

(declare-fun d!24569 () Bool)

(assert (=> d!24569 e!61251))

(declare-fun res!47569 () Bool)

(assert (=> d!24569 (=> (not res!47569) (not e!61251))))

(assert (=> d!24569 (= res!47569 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))))

(declare-fun lt!46482 () ListLongMap!1487)

(assert (=> d!24569 (= lt!46465 lt!46482)))

(declare-fun lt!46475 () Unit!2775)

(assert (=> d!24569 (= lt!46475 e!61260)))

(declare-fun c!15639 () Bool)

(declare-fun e!61253 () Bool)

(assert (=> d!24569 (= c!15639 e!61253)))

(declare-fun res!47567 () Bool)

(assert (=> d!24569 (=> (not res!47567) (not e!61253))))

(assert (=> d!24569 (= res!47567 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))

(assert (=> d!24569 (= lt!46482 e!61255)))

(assert (=> d!24569 (= c!15643 (and (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24569 (validMask!0 (mask!6502 (v!2756 (underlying!327 thiss!992))))))

(assert (=> d!24569 (= (getCurrentListMap!449 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))) lt!46465)))

(declare-fun bm!9340 () Bool)

(assert (=> bm!9340 (= call!9341 call!9339)))

(declare-fun b!93844 () Bool)

(declare-fun c!15644 () Bool)

(assert (=> b!93844 (= c!15644 (and (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!61261 () ListLongMap!1487)

(assert (=> b!93844 (= e!61254 e!61261)))

(declare-fun bm!9341 () Bool)

(assert (=> bm!9341 (= call!9339 (getCurrentListMapNoExtraKeys!92 (_keys!4112 (v!2756 (underlying!327 thiss!992))) (_values!2413 (v!2756 (underlying!327 thiss!992))) (mask!6502 (v!2756 (underlying!327 thiss!992))) (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) (zeroValue!2317 (v!2756 (underlying!327 thiss!992))) (minValue!2317 (v!2756 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992)))))))

(declare-fun bm!9342 () Bool)

(assert (=> bm!9342 (= call!9343 call!9342)))

(declare-fun b!93845 () Bool)

(assert (=> b!93845 (= e!61261 call!9343)))

(declare-fun b!93846 () Bool)

(assert (=> b!93846 (= e!61253 (validKeyInArray!0 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93847 () Bool)

(assert (=> b!93847 (= e!61261 call!9345)))

(declare-fun b!93848 () Bool)

(assert (=> b!93848 (= e!61251 e!61262)))

(declare-fun c!15642 () Bool)

(assert (=> b!93848 (= c!15642 (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93849 () Bool)

(assert (=> b!93849 (= e!61262 (not call!9344))))

(declare-fun b!93850 () Bool)

(declare-fun e!61259 () Bool)

(assert (=> b!93850 (= e!61259 (validKeyInArray!0 (select (arr!1982 (_keys!4112 (v!2756 (underlying!327 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93851 () Bool)

(declare-fun res!47566 () Bool)

(assert (=> b!93851 (=> (not res!47566) (not e!61251))))

(assert (=> b!93851 (= res!47566 e!61257)))

(declare-fun res!47568 () Bool)

(assert (=> b!93851 (=> res!47568 e!61257)))

(assert (=> b!93851 (= res!47568 (not e!61259))))

(declare-fun res!47565 () Bool)

(assert (=> b!93851 (=> (not res!47565) (not e!61259))))

(assert (=> b!93851 (= res!47565 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2230 (_keys!4112 (v!2756 (underlying!327 thiss!992))))))))

(declare-fun b!93852 () Bool)

(declare-fun e!61256 () Bool)

(assert (=> b!93852 (= e!61258 e!61256)))

(declare-fun res!47564 () Bool)

(assert (=> b!93852 (= res!47564 call!9340)))

(assert (=> b!93852 (=> (not res!47564) (not e!61256))))

(declare-fun b!93853 () Bool)

(assert (=> b!93853 (= e!61255 e!61254)))

(assert (=> b!93853 (= c!15640 (and (not (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2259 (v!2756 (underlying!327 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93854 () Bool)

(assert (=> b!93854 (= e!61256 (= (apply!89 lt!46465 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2317 (v!2756 (underlying!327 thiss!992)))))))

(assert (= (and d!24569 c!15643) b!93840))

(assert (= (and d!24569 (not c!15643)) b!93853))

(assert (= (and b!93853 c!15640) b!93838))

(assert (= (and b!93853 (not c!15640)) b!93844))

(assert (= (and b!93844 c!15644) b!93845))

(assert (= (and b!93844 (not c!15644)) b!93847))

(assert (= (or b!93845 b!93847) bm!9337))

(assert (= (or b!93838 bm!9337) bm!9340))

(assert (= (or b!93838 b!93845) bm!9342))

(assert (= (or b!93840 bm!9340) bm!9341))

(assert (= (or b!93840 bm!9342) bm!9338))

(assert (= (and d!24569 res!47567) b!93846))

(assert (= (and d!24569 c!15639) b!93835))

(assert (= (and d!24569 (not c!15639)) b!93843))

(assert (= (and d!24569 res!47569) b!93851))

(assert (= (and b!93851 res!47565) b!93850))

(assert (= (and b!93851 (not res!47568)) b!93841))

(assert (= (and b!93841 res!47571) b!93834))

(assert (= (and b!93851 res!47566) b!93837))

(assert (= (and b!93837 c!15641) b!93852))

(assert (= (and b!93837 (not c!15641)) b!93836))

(assert (= (and b!93852 res!47564) b!93854))

(assert (= (or b!93852 b!93836) bm!9339))

(assert (= (and b!93837 res!47570) b!93848))

(assert (= (and b!93848 c!15642) b!93842))

(assert (= (and b!93848 (not c!15642)) b!93849))

(assert (= (and b!93842 res!47572) b!93839))

(assert (= (or b!93842 b!93849) bm!9336))

(declare-fun b_lambda!4135 () Bool)

(assert (=> (not b_lambda!4135) (not b!93834)))

(assert (=> b!93834 t!5430))

(declare-fun b_and!5721 () Bool)

(assert (= b_and!5701 (and (=> t!5430 result!3157) b_and!5721)))

(assert (=> b!93834 t!5432))

(declare-fun b_and!5723 () Bool)

(assert (= b_and!5703 (and (=> t!5432 result!3161) b_and!5723)))

(declare-fun m!101073 () Bool)

(assert (=> bm!9339 m!101073))

(declare-fun m!101075 () Bool)

(assert (=> b!93854 m!101075))

(assert (=> d!24569 m!100857))

(assert (=> b!93846 m!101051))

(assert (=> b!93846 m!101051))

(declare-fun m!101077 () Bool)

(assert (=> b!93846 m!101077))

(assert (=> b!93834 m!101051))

(declare-fun m!101079 () Bool)

(assert (=> b!93834 m!101079))

(assert (=> b!93834 m!101079))

(assert (=> b!93834 m!100867))

(declare-fun m!101081 () Bool)

(assert (=> b!93834 m!101081))

(assert (=> b!93834 m!100867))

(assert (=> b!93834 m!101051))

(declare-fun m!101083 () Bool)

(assert (=> b!93834 m!101083))

(assert (=> b!93850 m!101051))

(assert (=> b!93850 m!101051))

(assert (=> b!93850 m!101077))

(declare-fun m!101085 () Bool)

(assert (=> bm!9336 m!101085))

(assert (=> b!93841 m!101051))

(assert (=> b!93841 m!101051))

(declare-fun m!101087 () Bool)

(assert (=> b!93841 m!101087))

(declare-fun m!101089 () Bool)

(assert (=> b!93840 m!101089))

(declare-fun m!101091 () Bool)

(assert (=> bm!9341 m!101091))

(declare-fun m!101093 () Bool)

(assert (=> bm!9338 m!101093))

(declare-fun m!101095 () Bool)

(assert (=> b!93835 m!101095))

(declare-fun m!101097 () Bool)

(assert (=> b!93835 m!101097))

(declare-fun m!101099 () Bool)

(assert (=> b!93835 m!101099))

(declare-fun m!101101 () Bool)

(assert (=> b!93835 m!101101))

(declare-fun m!101103 () Bool)

(assert (=> b!93835 m!101103))

(declare-fun m!101105 () Bool)

(assert (=> b!93835 m!101105))

(declare-fun m!101107 () Bool)

(assert (=> b!93835 m!101107))

(declare-fun m!101109 () Bool)

(assert (=> b!93835 m!101109))

(declare-fun m!101111 () Bool)

(assert (=> b!93835 m!101111))

(assert (=> b!93835 m!101105))

(declare-fun m!101113 () Bool)

(assert (=> b!93835 m!101113))

(assert (=> b!93835 m!101091))

(declare-fun m!101115 () Bool)

(assert (=> b!93835 m!101115))

(declare-fun m!101117 () Bool)

(assert (=> b!93835 m!101117))

(assert (=> b!93835 m!101051))

(declare-fun m!101119 () Bool)

(assert (=> b!93835 m!101119))

(assert (=> b!93835 m!101101))

(declare-fun m!101121 () Bool)

(assert (=> b!93835 m!101121))

(assert (=> b!93835 m!101103))

(declare-fun m!101123 () Bool)

(assert (=> b!93835 m!101123))

(assert (=> b!93835 m!101115))

(declare-fun m!101125 () Bool)

(assert (=> b!93839 m!101125))

(assert (=> b!93500 d!24569))

(declare-fun b!93862 () Bool)

(declare-fun e!61269 () Bool)

(assert (=> b!93862 (= e!61269 tp_is_empty!2605)))

(declare-fun mapIsEmpty!3663 () Bool)

(declare-fun mapRes!3663 () Bool)

(assert (=> mapIsEmpty!3663 mapRes!3663))

(declare-fun mapNonEmpty!3663 () Bool)

(declare-fun tp!9423 () Bool)

(declare-fun e!61268 () Bool)

(assert (=> mapNonEmpty!3663 (= mapRes!3663 (and tp!9423 e!61268))))

(declare-fun mapRest!3663 () (Array (_ BitVec 32) ValueCell!959))

(declare-fun mapKey!3663 () (_ BitVec 32))

(declare-fun mapValue!3663 () ValueCell!959)

(assert (=> mapNonEmpty!3663 (= mapRest!3648 (store mapRest!3663 mapKey!3663 mapValue!3663))))

(declare-fun b!93861 () Bool)

(assert (=> b!93861 (= e!61268 tp_is_empty!2605)))

(declare-fun condMapEmpty!3663 () Bool)

(declare-fun mapDefault!3663 () ValueCell!959)

(assert (=> mapNonEmpty!3648 (= condMapEmpty!3663 (= mapRest!3648 ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3663)))))

(assert (=> mapNonEmpty!3648 (= tp!9394 (and e!61269 mapRes!3663))))

(assert (= (and mapNonEmpty!3648 condMapEmpty!3663) mapIsEmpty!3663))

(assert (= (and mapNonEmpty!3648 (not condMapEmpty!3663)) mapNonEmpty!3663))

(assert (= (and mapNonEmpty!3663 ((_ is ValueCellFull!959) mapValue!3663)) b!93861))

(assert (= (and mapNonEmpty!3648 ((_ is ValueCellFull!959) mapDefault!3663)) b!93862))

(declare-fun m!101127 () Bool)

(assert (=> mapNonEmpty!3663 m!101127))

(declare-fun b!93864 () Bool)

(declare-fun e!61271 () Bool)

(assert (=> b!93864 (= e!61271 tp_is_empty!2605)))

(declare-fun mapIsEmpty!3664 () Bool)

(declare-fun mapRes!3664 () Bool)

(assert (=> mapIsEmpty!3664 mapRes!3664))

(declare-fun mapNonEmpty!3664 () Bool)

(declare-fun tp!9424 () Bool)

(declare-fun e!61270 () Bool)

(assert (=> mapNonEmpty!3664 (= mapRes!3664 (and tp!9424 e!61270))))

(declare-fun mapRest!3664 () (Array (_ BitVec 32) ValueCell!959))

(declare-fun mapKey!3664 () (_ BitVec 32))

(declare-fun mapValue!3664 () ValueCell!959)

(assert (=> mapNonEmpty!3664 (= mapRest!3647 (store mapRest!3664 mapKey!3664 mapValue!3664))))

(declare-fun b!93863 () Bool)

(assert (=> b!93863 (= e!61270 tp_is_empty!2605)))

(declare-fun condMapEmpty!3664 () Bool)

(declare-fun mapDefault!3664 () ValueCell!959)

(assert (=> mapNonEmpty!3647 (= condMapEmpty!3664 (= mapRest!3647 ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3664)))))

(assert (=> mapNonEmpty!3647 (= tp!9395 (and e!61271 mapRes!3664))))

(assert (= (and mapNonEmpty!3647 condMapEmpty!3664) mapIsEmpty!3664))

(assert (= (and mapNonEmpty!3647 (not condMapEmpty!3664)) mapNonEmpty!3664))

(assert (= (and mapNonEmpty!3664 ((_ is ValueCellFull!959) mapValue!3664)) b!93863))

(assert (= (and mapNonEmpty!3647 ((_ is ValueCellFull!959) mapDefault!3664)) b!93864))

(declare-fun m!101129 () Bool)

(assert (=> mapNonEmpty!3664 m!101129))

(declare-fun b_lambda!4137 () Bool)

(assert (= b_lambda!4135 (or (and b!93497 b_free!2377) (and b!93487 b_free!2379 (= (defaultEntry!2430 newMap!16) (defaultEntry!2430 (v!2756 (underlying!327 thiss!992))))) b_lambda!4137)))

(check-sat (not d!24539) (not d!24545) (not bm!9300) b_and!5721 (not b!93840) (not b!93791) (not mapNonEmpty!3664) (not b!93741) (not b!93789) (not d!24547) (not d!24569) (not b!93761) (not bm!9312) (not d!24563) (not b!93755) (not bm!9321) (not mapNonEmpty!3663) (not b!93841) (not bm!9318) (not b!93712) (not b!93850) (not bm!9301) (not b!93715) (not b!93713) (not b!93835) (not b!93717) (not b!93623) (not bm!9316) (not b!93754) b_and!5723 (not b!93782) (not b_next!2377) (not b!93621) (not bm!9313) (not b_lambda!4137) (not b_lambda!4133) (not d!24551) (not b!93778) (not b!93846) (not bm!9307) (not b!93766) (not bm!9296) (not b_next!2379) (not b!93834) (not b!93790) (not bm!9306) (not bm!9299) (not bm!9339) (not b!93744) (not bm!9295) (not bm!9336) (not b!93748) (not b!93839) (not b!93781) (not d!24567) (not bm!9315) (not d!24541) (not bm!9341) (not b!93722) tp_is_empty!2605 (not bm!9338) (not d!24565) (not b!93854))
(check-sat b_and!5721 b_and!5723 (not b_next!2377) (not b_next!2379))
