; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12144 () Bool)

(assert start!12144)

(declare-fun b!102424 () Bool)

(declare-fun b_free!2485 () Bool)

(declare-fun b_next!2485 () Bool)

(assert (=> b!102424 (= b_free!2485 (not b_next!2485))))

(declare-fun tp!9768 () Bool)

(declare-fun b_and!6313 () Bool)

(assert (=> b!102424 (= tp!9768 b_and!6313)))

(declare-fun b!102417 () Bool)

(declare-fun b_free!2487 () Bool)

(declare-fun b_next!2487 () Bool)

(assert (=> b!102417 (= b_free!2487 (not b_next!2487))))

(declare-fun tp!9767 () Bool)

(declare-fun b_and!6315 () Bool)

(assert (=> b!102417 (= tp!9767 b_and!6315)))

(declare-fun b!102411 () Bool)

(declare-fun e!66667 () Bool)

(declare-fun tp_is_empty!2659 () Bool)

(assert (=> b!102411 (= e!66667 tp_is_empty!2659)))

(declare-fun b!102412 () Bool)

(declare-fun res!51247 () Bool)

(declare-fun e!66671 () Bool)

(assert (=> b!102412 (=> (not res!51247) (not e!66671))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3193 0))(
  ( (V!3194 (val!1374 Int)) )
))
(declare-datatypes ((array!4291 0))(
  ( (array!4292 (arr!2036 (Array (_ BitVec 32) (_ BitVec 64))) (size!2290 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!986 0))(
  ( (ValueCellFull!986 (v!2862 V!3193)) (EmptyCell!986) )
))
(declare-datatypes ((array!4293 0))(
  ( (array!4294 (arr!2037 (Array (_ BitVec 32) ValueCell!986)) (size!2291 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!880 0))(
  ( (LongMapFixedSize!881 (defaultEntry!2551 Int) (mask!6682 (_ BitVec 32)) (extraKeys!2360 (_ BitVec 32)) (zeroValue!2428 V!3193) (minValue!2428 V!3193) (_size!489 (_ BitVec 32)) (_keys!4253 array!4291) (_values!2534 array!4293) (_vacant!489 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!684 0))(
  ( (Cell!685 (v!2863 LongMapFixedSize!880)) )
))
(declare-datatypes ((LongMap!684 0))(
  ( (LongMap!685 (underlying!353 Cell!684)) )
))
(declare-fun thiss!992 () LongMap!684)

(assert (=> b!102412 (= res!51247 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2290 (_keys!4253 (v!2863 (underlying!353 thiss!992)))))))))

(declare-fun b!102413 () Bool)

(declare-fun e!66663 () Bool)

(assert (=> b!102413 (= e!66671 e!66663)))

(declare-fun res!51246 () Bool)

(assert (=> b!102413 (=> (not res!51246) (not e!66663))))

(declare-datatypes ((tuple2!2334 0))(
  ( (tuple2!2335 (_1!1178 (_ BitVec 64)) (_2!1178 V!3193)) )
))
(declare-datatypes ((List!1583 0))(
  ( (Nil!1580) (Cons!1579 (h!2175 tuple2!2334) (t!5613 List!1583)) )
))
(declare-datatypes ((ListLongMap!1517 0))(
  ( (ListLongMap!1518 (toList!774 List!1583)) )
))
(declare-fun lt!52035 () ListLongMap!1517)

(declare-fun lt!52037 () ListLongMap!1517)

(assert (=> b!102413 (= res!51246 (and (= lt!52037 lt!52035) (not (= (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!880)

(declare-fun map!1270 (LongMapFixedSize!880) ListLongMap!1517)

(assert (=> b!102413 (= lt!52035 (map!1270 newMap!16))))

(declare-fun getCurrentListMap!462 (array!4291 array!4293 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 32) Int) ListLongMap!1517)

(assert (=> b!102413 (= lt!52037 (getCurrentListMap!462 (_keys!4253 (v!2863 (underlying!353 thiss!992))) (_values!2534 (v!2863 (underlying!353 thiss!992))) (mask!6682 (v!2863 (underlying!353 thiss!992))) (extraKeys!2360 (v!2863 (underlying!353 thiss!992))) (zeroValue!2428 (v!2863 (underlying!353 thiss!992))) (minValue!2428 (v!2863 (underlying!353 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2863 (underlying!353 thiss!992)))))))

(declare-fun b!102414 () Bool)

(declare-fun e!66674 () Bool)

(assert (=> b!102414 (= e!66663 e!66674)))

(declare-fun res!51245 () Bool)

(assert (=> b!102414 (=> (not res!51245) (not e!66674))))

(declare-datatypes ((tuple2!2336 0))(
  ( (tuple2!2337 (_1!1179 Bool) (_2!1179 LongMapFixedSize!880)) )
))
(declare-fun lt!52040 () tuple2!2336)

(assert (=> b!102414 (= res!51245 (and (_1!1179 lt!52040) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3110 0))(
  ( (Unit!3111) )
))
(declare-fun lt!52036 () Unit!3110)

(declare-fun e!66672 () Unit!3110)

(assert (=> b!102414 (= lt!52036 e!66672)))

(declare-fun c!17629 () Bool)

(declare-fun contains!805 (ListLongMap!1517 (_ BitVec 64)) Bool)

(assert (=> b!102414 (= c!17629 (contains!805 lt!52035 (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355)))))

(declare-fun update!154 (LongMapFixedSize!880 (_ BitVec 64) V!3193) tuple2!2336)

(declare-fun get!1319 (ValueCell!986 V!3193) V!3193)

(declare-fun dynLambda!379 (Int (_ BitVec 64)) V!3193)

(assert (=> b!102414 (= lt!52040 (update!154 newMap!16 (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) (get!1319 (select (arr!2037 (_values!2534 (v!2863 (underlying!353 thiss!992)))) from!355) (dynLambda!379 (defaultEntry!2551 (v!2863 (underlying!353 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!51243 () Bool)

(assert (=> start!12144 (=> (not res!51243) (not e!66671))))

(declare-fun valid!409 (LongMap!684) Bool)

(assert (=> start!12144 (= res!51243 (valid!409 thiss!992))))

(assert (=> start!12144 e!66671))

(declare-fun e!66664 () Bool)

(assert (=> start!12144 e!66664))

(assert (=> start!12144 true))

(declare-fun e!66669 () Bool)

(assert (=> start!12144 e!66669))

(declare-fun mapIsEmpty!3857 () Bool)

(declare-fun mapRes!3858 () Bool)

(assert (=> mapIsEmpty!3857 mapRes!3858))

(declare-fun b!102415 () Bool)

(declare-fun e!66676 () Bool)

(declare-fun mapRes!3857 () Bool)

(assert (=> b!102415 (= e!66676 (and e!66667 mapRes!3857))))

(declare-fun condMapEmpty!3857 () Bool)

(declare-fun mapDefault!3857 () ValueCell!986)

(assert (=> b!102415 (= condMapEmpty!3857 (= (arr!2037 (_values!2534 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!986)) mapDefault!3857)))))

(declare-fun b!102416 () Bool)

(declare-fun res!51244 () Bool)

(assert (=> b!102416 (=> (not res!51244) (not e!66671))))

(assert (=> b!102416 (= res!51244 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6682 newMap!16)) (_size!489 (v!2863 (underlying!353 thiss!992)))))))

(declare-fun array_inv!1253 (array!4291) Bool)

(declare-fun array_inv!1254 (array!4293) Bool)

(assert (=> b!102417 (= e!66669 (and tp!9767 tp_is_empty!2659 (array_inv!1253 (_keys!4253 newMap!16)) (array_inv!1254 (_values!2534 newMap!16)) e!66676))))

(declare-fun mapNonEmpty!3857 () Bool)

(declare-fun tp!9766 () Bool)

(declare-fun e!66673 () Bool)

(assert (=> mapNonEmpty!3857 (= mapRes!3858 (and tp!9766 e!66673))))

(declare-fun mapKey!3858 () (_ BitVec 32))

(declare-fun mapRest!3858 () (Array (_ BitVec 32) ValueCell!986))

(declare-fun mapValue!3857 () ValueCell!986)

(assert (=> mapNonEmpty!3857 (= (arr!2037 (_values!2534 (v!2863 (underlying!353 thiss!992)))) (store mapRest!3858 mapKey!3858 mapValue!3857))))

(declare-fun b!102418 () Bool)

(assert (=> b!102418 (= e!66674 false)))

(declare-fun lt!52038 () ListLongMap!1517)

(declare-fun getCurrentListMapNoExtraKeys!99 (array!4291 array!4293 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 32) Int) ListLongMap!1517)

(assert (=> b!102418 (= lt!52038 (getCurrentListMapNoExtraKeys!99 (_keys!4253 (v!2863 (underlying!353 thiss!992))) (_values!2534 (v!2863 (underlying!353 thiss!992))) (mask!6682 (v!2863 (underlying!353 thiss!992))) (extraKeys!2360 (v!2863 (underlying!353 thiss!992))) (zeroValue!2428 (v!2863 (underlying!353 thiss!992))) (minValue!2428 (v!2863 (underlying!353 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2863 (underlying!353 thiss!992)))))))

(declare-fun b!102419 () Bool)

(declare-fun Unit!3112 () Unit!3110)

(assert (=> b!102419 (= e!66672 Unit!3112)))

(declare-fun b!102420 () Bool)

(declare-fun e!66662 () Bool)

(assert (=> b!102420 (= e!66662 tp_is_empty!2659)))

(declare-fun mapIsEmpty!3858 () Bool)

(assert (=> mapIsEmpty!3858 mapRes!3857))

(declare-fun b!102421 () Bool)

(declare-fun res!51248 () Bool)

(assert (=> b!102421 (=> (not res!51248) (not e!66671))))

(declare-fun valid!410 (LongMapFixedSize!880) Bool)

(assert (=> b!102421 (= res!51248 (valid!410 newMap!16))))

(declare-fun b!102422 () Bool)

(declare-fun e!66666 () Bool)

(assert (=> b!102422 (= e!66664 e!66666)))

(declare-fun b!102423 () Bool)

(assert (=> b!102423 (= e!66673 tp_is_empty!2659)))

(declare-fun e!66665 () Bool)

(declare-fun e!66670 () Bool)

(assert (=> b!102424 (= e!66670 (and tp!9768 tp_is_empty!2659 (array_inv!1253 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) (array_inv!1254 (_values!2534 (v!2863 (underlying!353 thiss!992)))) e!66665))))

(declare-fun b!102425 () Bool)

(declare-fun e!66661 () Bool)

(assert (=> b!102425 (= e!66665 (and e!66661 mapRes!3858))))

(declare-fun condMapEmpty!3858 () Bool)

(declare-fun mapDefault!3858 () ValueCell!986)

(assert (=> b!102425 (= condMapEmpty!3858 (= (arr!2037 (_values!2534 (v!2863 (underlying!353 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!986)) mapDefault!3858)))))

(declare-fun b!102426 () Bool)

(assert (=> b!102426 (= e!66661 tp_is_empty!2659)))

(declare-fun b!102427 () Bool)

(declare-fun Unit!3113 () Unit!3110)

(assert (=> b!102427 (= e!66672 Unit!3113)))

(declare-fun lt!52042 () Unit!3110)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!94 (array!4291 array!4293 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 64) (_ BitVec 32) Int) Unit!3110)

(assert (=> b!102427 (= lt!52042 (lemmaListMapContainsThenArrayContainsFrom!94 (_keys!4253 (v!2863 (underlying!353 thiss!992))) (_values!2534 (v!2863 (underlying!353 thiss!992))) (mask!6682 (v!2863 (underlying!353 thiss!992))) (extraKeys!2360 (v!2863 (underlying!353 thiss!992))) (zeroValue!2428 (v!2863 (underlying!353 thiss!992))) (minValue!2428 (v!2863 (underlying!353 thiss!992))) (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2863 (underlying!353 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102427 (arrayContainsKey!0 (_keys!4253 (v!2863 (underlying!353 thiss!992))) (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52041 () Unit!3110)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4291 (_ BitVec 32) (_ BitVec 32)) Unit!3110)

(assert (=> b!102427 (= lt!52041 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4253 (v!2863 (underlying!353 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1584 0))(
  ( (Nil!1581) (Cons!1580 (h!2176 (_ BitVec 64)) (t!5614 List!1584)) )
))
(declare-fun arrayNoDuplicates!0 (array!4291 (_ BitVec 32) List!1584) Bool)

(assert (=> b!102427 (arrayNoDuplicates!0 (_keys!4253 (v!2863 (underlying!353 thiss!992))) from!355 Nil!1581)))

(declare-fun lt!52039 () Unit!3110)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4291 (_ BitVec 32) (_ BitVec 64) List!1584) Unit!3110)

(assert (=> b!102427 (= lt!52039 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4253 (v!2863 (underlying!353 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) (Cons!1580 (select (arr!2036 (_keys!4253 (v!2863 (underlying!353 thiss!992)))) from!355) Nil!1581)))))

(assert (=> b!102427 false))

(declare-fun mapNonEmpty!3858 () Bool)

(declare-fun tp!9765 () Bool)

(assert (=> mapNonEmpty!3858 (= mapRes!3857 (and tp!9765 e!66662))))

(declare-fun mapKey!3857 () (_ BitVec 32))

(declare-fun mapRest!3857 () (Array (_ BitVec 32) ValueCell!986))

(declare-fun mapValue!3858 () ValueCell!986)

(assert (=> mapNonEmpty!3858 (= (arr!2037 (_values!2534 newMap!16)) (store mapRest!3857 mapKey!3857 mapValue!3858))))

(declare-fun b!102428 () Bool)

(assert (=> b!102428 (= e!66666 e!66670)))

(assert (= (and start!12144 res!51243) b!102412))

(assert (= (and b!102412 res!51247) b!102421))

(assert (= (and b!102421 res!51248) b!102416))

(assert (= (and b!102416 res!51244) b!102413))

(assert (= (and b!102413 res!51246) b!102414))

(assert (= (and b!102414 c!17629) b!102427))

(assert (= (and b!102414 (not c!17629)) b!102419))

(assert (= (and b!102414 res!51245) b!102418))

(assert (= (and b!102425 condMapEmpty!3858) mapIsEmpty!3857))

(assert (= (and b!102425 (not condMapEmpty!3858)) mapNonEmpty!3857))

(get-info :version)

(assert (= (and mapNonEmpty!3857 ((_ is ValueCellFull!986) mapValue!3857)) b!102423))

(assert (= (and b!102425 ((_ is ValueCellFull!986) mapDefault!3858)) b!102426))

(assert (= b!102424 b!102425))

(assert (= b!102428 b!102424))

(assert (= b!102422 b!102428))

(assert (= start!12144 b!102422))

(assert (= (and b!102415 condMapEmpty!3857) mapIsEmpty!3858))

(assert (= (and b!102415 (not condMapEmpty!3857)) mapNonEmpty!3858))

(assert (= (and mapNonEmpty!3858 ((_ is ValueCellFull!986) mapValue!3858)) b!102420))

(assert (= (and b!102415 ((_ is ValueCellFull!986) mapDefault!3857)) b!102411))

(assert (= b!102417 b!102415))

(assert (= start!12144 b!102417))

(declare-fun b_lambda!4587 () Bool)

(assert (=> (not b_lambda!4587) (not b!102414)))

(declare-fun t!5610 () Bool)

(declare-fun tb!1997 () Bool)

(assert (=> (and b!102424 (= (defaultEntry!2551 (v!2863 (underlying!353 thiss!992))) (defaultEntry!2551 (v!2863 (underlying!353 thiss!992)))) t!5610) tb!1997))

(declare-fun result!3373 () Bool)

(assert (=> tb!1997 (= result!3373 tp_is_empty!2659)))

(assert (=> b!102414 t!5610))

(declare-fun b_and!6317 () Bool)

(assert (= b_and!6313 (and (=> t!5610 result!3373) b_and!6317)))

(declare-fun tb!1999 () Bool)

(declare-fun t!5612 () Bool)

(assert (=> (and b!102417 (= (defaultEntry!2551 newMap!16) (defaultEntry!2551 (v!2863 (underlying!353 thiss!992)))) t!5612) tb!1999))

(declare-fun result!3377 () Bool)

(assert (= result!3377 result!3373))

(assert (=> b!102414 t!5612))

(declare-fun b_and!6319 () Bool)

(assert (= b_and!6315 (and (=> t!5612 result!3377) b_and!6319)))

(declare-fun m!113387 () Bool)

(assert (=> start!12144 m!113387))

(declare-fun m!113389 () Bool)

(assert (=> b!102417 m!113389))

(declare-fun m!113391 () Bool)

(assert (=> b!102417 m!113391))

(declare-fun m!113393 () Bool)

(assert (=> b!102413 m!113393))

(declare-fun m!113395 () Bool)

(assert (=> b!102413 m!113395))

(declare-fun m!113397 () Bool)

(assert (=> b!102413 m!113397))

(declare-fun m!113399 () Bool)

(assert (=> b!102427 m!113399))

(declare-fun m!113401 () Bool)

(assert (=> b!102427 m!113401))

(assert (=> b!102427 m!113393))

(declare-fun m!113403 () Bool)

(assert (=> b!102427 m!113403))

(assert (=> b!102427 m!113393))

(assert (=> b!102427 m!113393))

(declare-fun m!113405 () Bool)

(assert (=> b!102427 m!113405))

(assert (=> b!102427 m!113393))

(declare-fun m!113407 () Bool)

(assert (=> b!102427 m!113407))

(declare-fun m!113409 () Bool)

(assert (=> mapNonEmpty!3857 m!113409))

(declare-fun m!113411 () Bool)

(assert (=> b!102421 m!113411))

(declare-fun m!113413 () Bool)

(assert (=> b!102418 m!113413))

(declare-fun m!113415 () Bool)

(assert (=> b!102414 m!113415))

(declare-fun m!113417 () Bool)

(assert (=> b!102414 m!113417))

(declare-fun m!113419 () Bool)

(assert (=> b!102414 m!113419))

(assert (=> b!102414 m!113393))

(assert (=> b!102414 m!113417))

(assert (=> b!102414 m!113393))

(assert (=> b!102414 m!113419))

(declare-fun m!113421 () Bool)

(assert (=> b!102414 m!113421))

(assert (=> b!102414 m!113415))

(assert (=> b!102414 m!113393))

(declare-fun m!113423 () Bool)

(assert (=> b!102414 m!113423))

(declare-fun m!113425 () Bool)

(assert (=> mapNonEmpty!3858 m!113425))

(declare-fun m!113427 () Bool)

(assert (=> b!102424 m!113427))

(declare-fun m!113429 () Bool)

(assert (=> b!102424 m!113429))

(check-sat (not b!102421) (not b!102417) (not b!102424) (not b!102427) (not mapNonEmpty!3857) (not b!102418) (not b_lambda!4587) (not mapNonEmpty!3858) (not b!102413) b_and!6319 (not b_next!2485) tp_is_empty!2659 b_and!6317 (not start!12144) (not b_next!2487) (not b!102414))
(check-sat b_and!6317 b_and!6319 (not b_next!2485) (not b_next!2487))
