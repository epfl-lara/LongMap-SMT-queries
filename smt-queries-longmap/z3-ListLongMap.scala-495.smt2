; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11156 () Bool)

(assert start!11156)

(declare-fun b!91293 () Bool)

(declare-fun b_free!2329 () Bool)

(declare-fun b_next!2329 () Bool)

(assert (=> b!91293 (= b_free!2329 (not b_next!2329))))

(declare-fun tp!9239 () Bool)

(declare-fun b_and!5525 () Bool)

(assert (=> b!91293 (= tp!9239 b_and!5525)))

(declare-fun b!91288 () Bool)

(declare-fun b_free!2331 () Bool)

(declare-fun b_next!2331 () Bool)

(assert (=> b!91288 (= b_free!2331 (not b_next!2331))))

(declare-fun tp!9241 () Bool)

(declare-fun b_and!5527 () Bool)

(assert (=> b!91288 (= tp!9241 b_and!5527)))

(declare-fun b!91276 () Bool)

(declare-fun res!46497 () Bool)

(declare-fun e!59533 () Bool)

(assert (=> b!91276 (=> (not res!46497) (not e!59533))))

(declare-datatypes ((V!3089 0))(
  ( (V!3090 (val!1335 Int)) )
))
(declare-datatypes ((array!4111 0))(
  ( (array!4112 (arr!1954 (Array (_ BitVec 32) (_ BitVec 64))) (size!2202 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!947 0))(
  ( (ValueCellFull!947 (v!2712 V!3089)) (EmptyCell!947) )
))
(declare-datatypes ((array!4113 0))(
  ( (array!4114 (arr!1955 (Array (_ BitVec 32) ValueCell!947)) (size!2203 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!802 0))(
  ( (LongMapFixedSize!803 (defaultEntry!2405 Int) (mask!6464 (_ BitVec 32)) (extraKeys!2236 (_ BitVec 32)) (zeroValue!2293 V!3089) (minValue!2293 V!3089) (_size!450 (_ BitVec 32)) (_keys!4084 array!4111) (_values!2388 array!4113) (_vacant!450 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!802)

(declare-fun valid!362 (LongMapFixedSize!802) Bool)

(assert (=> b!91276 (= res!46497 (valid!362 newMap!16))))

(declare-fun res!46494 () Bool)

(assert (=> start!11156 (=> (not res!46494) (not e!59533))))

(declare-datatypes ((Cell!594 0))(
  ( (Cell!595 (v!2713 LongMapFixedSize!802)) )
))
(declare-datatypes ((LongMap!594 0))(
  ( (LongMap!595 (underlying!308 Cell!594)) )
))
(declare-fun thiss!992 () LongMap!594)

(declare-fun valid!363 (LongMap!594) Bool)

(assert (=> start!11156 (= res!46494 (valid!363 thiss!992))))

(assert (=> start!11156 e!59533))

(declare-fun e!59540 () Bool)

(assert (=> start!11156 e!59540))

(assert (=> start!11156 true))

(declare-fun e!59546 () Bool)

(assert (=> start!11156 e!59546))

(declare-fun b!91277 () Bool)

(declare-fun e!59535 () Bool)

(assert (=> b!91277 (= e!59540 e!59535)))

(declare-fun b!91278 () Bool)

(declare-fun e!59545 () Bool)

(declare-fun e!59538 () Bool)

(declare-fun mapRes!3565 () Bool)

(assert (=> b!91278 (= e!59545 (and e!59538 mapRes!3565))))

(declare-fun condMapEmpty!3565 () Bool)

(declare-fun mapDefault!3565 () ValueCell!947)

(assert (=> b!91278 (= condMapEmpty!3565 (= (arr!1955 (_values!2388 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3565)))))

(declare-fun b!91279 () Bool)

(declare-fun res!46502 () Bool)

(declare-fun e!59536 () Bool)

(assert (=> b!91279 (=> res!46502 e!59536)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!91279 (= res!46502 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun mapIsEmpty!3565 () Bool)

(declare-fun mapRes!3566 () Bool)

(assert (=> mapIsEmpty!3565 mapRes!3566))

(declare-fun b!91280 () Bool)

(declare-fun e!59534 () Bool)

(assert (=> b!91280 (= e!59535 e!59534)))

(declare-fun b!91281 () Bool)

(declare-fun res!46495 () Bool)

(assert (=> b!91281 (=> (not res!46495) (not e!59533))))

(assert (=> b!91281 (= res!46495 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6464 newMap!16)) (_size!450 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91282 () Bool)

(declare-fun res!46493 () Bool)

(assert (=> b!91282 (=> (not res!46493) (not e!59533))))

(assert (=> b!91282 (= res!46493 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun b!91283 () Bool)

(declare-fun e!59543 () Bool)

(declare-fun e!59541 () Bool)

(assert (=> b!91283 (= e!59543 e!59541)))

(declare-fun res!46501 () Bool)

(assert (=> b!91283 (=> (not res!46501) (not e!59541))))

(assert (=> b!91283 (= res!46501 (and (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44490 () V!3089)

(declare-fun get!1241 (ValueCell!947 V!3089) V!3089)

(declare-fun dynLambda!355 (Int (_ BitVec 64)) V!3089)

(assert (=> b!91283 (= lt!44490 (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91284 () Bool)

(declare-fun res!46498 () Bool)

(assert (=> b!91284 (=> res!46498 e!59536)))

(declare-datatypes ((tuple2!2254 0))(
  ( (tuple2!2255 (_1!1138 Bool) (_2!1138 LongMapFixedSize!802)) )
))
(declare-fun lt!44500 () tuple2!2254)

(assert (=> b!91284 (= res!46498 (not (valid!362 (_2!1138 lt!44500))))))

(declare-fun b!91285 () Bool)

(declare-fun e!59547 () Bool)

(declare-fun e!59548 () Bool)

(assert (=> b!91285 (= e!59547 (and e!59548 mapRes!3566))))

(declare-fun condMapEmpty!3566 () Bool)

(declare-fun mapDefault!3566 () ValueCell!947)

(assert (=> b!91285 (= condMapEmpty!3566 (= (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3566)))))

(declare-fun b!91286 () Bool)

(assert (=> b!91286 (= e!59533 e!59543)))

(declare-fun res!46500 () Bool)

(assert (=> b!91286 (=> (not res!46500) (not e!59543))))

(declare-datatypes ((tuple2!2256 0))(
  ( (tuple2!2257 (_1!1139 (_ BitVec 64)) (_2!1139 V!3089)) )
))
(declare-datatypes ((List!1555 0))(
  ( (Nil!1552) (Cons!1551 (h!2143 tuple2!2256) (t!5380 List!1555)) )
))
(declare-datatypes ((ListLongMap!1477 0))(
  ( (ListLongMap!1478 (toList!754 List!1555)) )
))
(declare-fun lt!44501 () ListLongMap!1477)

(declare-fun lt!44488 () ListLongMap!1477)

(assert (=> b!91286 (= res!46500 (= lt!44501 lt!44488))))

(declare-fun map!1213 (LongMapFixedSize!802) ListLongMap!1477)

(assert (=> b!91286 (= lt!44488 (map!1213 newMap!16))))

(declare-fun getCurrentListMap!437 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) ListLongMap!1477)

(assert (=> b!91286 (= lt!44501 (getCurrentListMap!437 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91287 () Bool)

(declare-fun tp_is_empty!2581 () Bool)

(assert (=> b!91287 (= e!59548 tp_is_empty!2581)))

(declare-fun array_inv!1223 (array!4111) Bool)

(declare-fun array_inv!1224 (array!4113) Bool)

(assert (=> b!91288 (= e!59546 (and tp!9241 tp_is_empty!2581 (array_inv!1223 (_keys!4084 newMap!16)) (array_inv!1224 (_values!2388 newMap!16)) e!59545))))

(declare-fun b!91289 () Bool)

(assert (=> b!91289 (= e!59536 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6464 (_2!1138 lt!44500))) (_size!450 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91290 () Bool)

(declare-datatypes ((Unit!2718 0))(
  ( (Unit!2719) )
))
(declare-fun e!59537 () Unit!2718)

(declare-fun Unit!2720 () Unit!2718)

(assert (=> b!91290 (= e!59537 Unit!2720)))

(declare-fun lt!44486 () Unit!2718)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!82 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) (_ BitVec 32) Int) Unit!2718)

(assert (=> b!91290 (= lt!44486 (lemmaListMapContainsThenArrayContainsFrom!82 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!91290 (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44484 () Unit!2718)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4111 (_ BitVec 32) (_ BitVec 32)) Unit!2718)

(assert (=> b!91290 (= lt!44484 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1556 0))(
  ( (Nil!1553) (Cons!1552 (h!2144 (_ BitVec 64)) (t!5381 List!1556)) )
))
(declare-fun arrayNoDuplicates!0 (array!4111 (_ BitVec 32) List!1556) Bool)

(assert (=> b!91290 (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) from!355 Nil!1553)))

(declare-fun lt!44496 () Unit!2718)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4111 (_ BitVec 32) (_ BitVec 64) List!1556) Unit!2718)

(assert (=> b!91290 (= lt!44496 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553)))))

(assert (=> b!91290 false))

(declare-fun b!91291 () Bool)

(declare-fun e!59549 () Bool)

(assert (=> b!91291 (= e!59549 tp_is_empty!2581)))

(declare-fun b!91292 () Bool)

(assert (=> b!91292 (= e!59538 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3566 () Bool)

(assert (=> mapIsEmpty!3566 mapRes!3565))

(assert (=> b!91293 (= e!59534 (and tp!9239 tp_is_empty!2581 (array_inv!1223 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (array_inv!1224 (_values!2388 (v!2713 (underlying!308 thiss!992)))) e!59547))))

(declare-fun b!91294 () Bool)

(declare-fun e!59542 () Bool)

(assert (=> b!91294 (= e!59542 (not e!59536))))

(declare-fun res!46499 () Bool)

(assert (=> b!91294 (=> res!46499 e!59536)))

(assert (=> b!91294 (= res!46499 (not (= (getCurrentListMap!437 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) (map!1213 (_2!1138 lt!44500)))))))

(declare-fun lt!44498 () ListLongMap!1477)

(declare-fun lt!44487 () ListLongMap!1477)

(declare-fun lt!44495 () tuple2!2256)

(declare-fun lt!44489 () tuple2!2256)

(declare-fun +!119 (ListLongMap!1477 tuple2!2256) ListLongMap!1477)

(assert (=> b!91294 (= (+!119 lt!44487 lt!44489) (+!119 (+!119 lt!44498 lt!44489) lt!44495))))

(assert (=> b!91294 (= lt!44489 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44499 () Unit!2718)

(declare-fun addCommutativeForDiffKeys!38 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64) V!3089) Unit!2718)

(assert (=> b!91294 (= lt!44499 (addCommutativeForDiffKeys!38 lt!44498 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44494 () ListLongMap!1477)

(assert (=> b!91294 (= lt!44494 lt!44487)))

(assert (=> b!91294 (= lt!44487 (+!119 lt!44498 lt!44495))))

(declare-fun lt!44497 () ListLongMap!1477)

(declare-fun lt!44492 () tuple2!2256)

(assert (=> b!91294 (= lt!44494 (+!119 lt!44497 lt!44492))))

(declare-fun lt!44485 () ListLongMap!1477)

(assert (=> b!91294 (= lt!44498 (+!119 lt!44485 lt!44492))))

(assert (=> b!91294 (= lt!44492 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(assert (=> b!91294 (= lt!44497 (+!119 lt!44485 lt!44495))))

(assert (=> b!91294 (= lt!44495 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))

(declare-fun lt!44491 () Unit!2718)

(assert (=> b!91294 (= lt!44491 (addCommutativeForDiffKeys!38 lt!44485 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!83 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) ListLongMap!1477)

(assert (=> b!91294 (= lt!44485 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91295 () Bool)

(declare-fun Unit!2721 () Unit!2718)

(assert (=> b!91295 (= e!59537 Unit!2721)))

(declare-fun b!91296 () Bool)

(assert (=> b!91296 (= e!59541 e!59542)))

(declare-fun res!46496 () Bool)

(assert (=> b!91296 (=> (not res!46496) (not e!59542))))

(assert (=> b!91296 (= res!46496 (and (_1!1138 lt!44500) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44493 () Unit!2718)

(assert (=> b!91296 (= lt!44493 e!59537)))

(declare-fun c!15139 () Bool)

(declare-fun contains!772 (ListLongMap!1477 (_ BitVec 64)) Bool)

(assert (=> b!91296 (= c!15139 (contains!772 lt!44488 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun update!132 (LongMapFixedSize!802 (_ BitVec 64) V!3089) tuple2!2254)

(assert (=> b!91296 (= lt!44500 (update!132 newMap!16 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))

(declare-fun b!91297 () Bool)

(declare-fun e!59539 () Bool)

(assert (=> b!91297 (= e!59539 tp_is_empty!2581)))

(declare-fun mapNonEmpty!3565 () Bool)

(declare-fun tp!9240 () Bool)

(assert (=> mapNonEmpty!3565 (= mapRes!3565 (and tp!9240 e!59539))))

(declare-fun mapKey!3565 () (_ BitVec 32))

(declare-fun mapValue!3566 () ValueCell!947)

(declare-fun mapRest!3565 () (Array (_ BitVec 32) ValueCell!947))

(assert (=> mapNonEmpty!3565 (= (arr!1955 (_values!2388 newMap!16)) (store mapRest!3565 mapKey!3565 mapValue!3566))))

(declare-fun mapNonEmpty!3566 () Bool)

(declare-fun tp!9242 () Bool)

(assert (=> mapNonEmpty!3566 (= mapRes!3566 (and tp!9242 e!59549))))

(declare-fun mapRest!3566 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3565 () ValueCell!947)

(declare-fun mapKey!3566 () (_ BitVec 32))

(assert (=> mapNonEmpty!3566 (= (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (store mapRest!3566 mapKey!3566 mapValue!3565))))

(assert (= (and start!11156 res!46494) b!91282))

(assert (= (and b!91282 res!46493) b!91276))

(assert (= (and b!91276 res!46497) b!91281))

(assert (= (and b!91281 res!46495) b!91286))

(assert (= (and b!91286 res!46500) b!91283))

(assert (= (and b!91283 res!46501) b!91296))

(assert (= (and b!91296 c!15139) b!91290))

(assert (= (and b!91296 (not c!15139)) b!91295))

(assert (= (and b!91296 res!46496) b!91294))

(assert (= (and b!91294 (not res!46499)) b!91279))

(assert (= (and b!91279 (not res!46502)) b!91284))

(assert (= (and b!91284 (not res!46498)) b!91289))

(assert (= (and b!91285 condMapEmpty!3566) mapIsEmpty!3565))

(assert (= (and b!91285 (not condMapEmpty!3566)) mapNonEmpty!3566))

(get-info :version)

(assert (= (and mapNonEmpty!3566 ((_ is ValueCellFull!947) mapValue!3565)) b!91291))

(assert (= (and b!91285 ((_ is ValueCellFull!947) mapDefault!3566)) b!91287))

(assert (= b!91293 b!91285))

(assert (= b!91280 b!91293))

(assert (= b!91277 b!91280))

(assert (= start!11156 b!91277))

(assert (= (and b!91278 condMapEmpty!3565) mapIsEmpty!3566))

(assert (= (and b!91278 (not condMapEmpty!3565)) mapNonEmpty!3565))

(assert (= (and mapNonEmpty!3565 ((_ is ValueCellFull!947) mapValue!3566)) b!91297))

(assert (= (and b!91278 ((_ is ValueCellFull!947) mapDefault!3565)) b!91292))

(assert (= b!91288 b!91278))

(assert (= start!11156 b!91288))

(declare-fun b_lambda!4025 () Bool)

(assert (=> (not b_lambda!4025) (not b!91283)))

(declare-fun t!5377 () Bool)

(declare-fun tb!1793 () Bool)

(assert (=> (and b!91293 (= (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) t!5377) tb!1793))

(declare-fun result!3073 () Bool)

(assert (=> tb!1793 (= result!3073 tp_is_empty!2581)))

(assert (=> b!91283 t!5377))

(declare-fun b_and!5529 () Bool)

(assert (= b_and!5525 (and (=> t!5377 result!3073) b_and!5529)))

(declare-fun tb!1795 () Bool)

(declare-fun t!5379 () Bool)

(assert (=> (and b!91288 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) t!5379) tb!1795))

(declare-fun result!3077 () Bool)

(assert (= result!3077 result!3073))

(assert (=> b!91283 t!5379))

(declare-fun b_and!5531 () Bool)

(assert (= b_and!5527 (and (=> t!5379 result!3077) b_and!5531)))

(declare-fun m!97895 () Bool)

(assert (=> b!91290 m!97895))

(declare-fun m!97897 () Bool)

(assert (=> b!91290 m!97897))

(declare-fun m!97899 () Bool)

(assert (=> b!91290 m!97899))

(declare-fun m!97901 () Bool)

(assert (=> b!91290 m!97901))

(assert (=> b!91290 m!97899))

(assert (=> b!91290 m!97899))

(declare-fun m!97903 () Bool)

(assert (=> b!91290 m!97903))

(assert (=> b!91290 m!97899))

(declare-fun m!97905 () Bool)

(assert (=> b!91290 m!97905))

(declare-fun m!97907 () Bool)

(assert (=> b!91286 m!97907))

(declare-fun m!97909 () Bool)

(assert (=> b!91286 m!97909))

(declare-fun m!97911 () Bool)

(assert (=> b!91284 m!97911))

(assert (=> b!91296 m!97899))

(assert (=> b!91296 m!97899))

(declare-fun m!97913 () Bool)

(assert (=> b!91296 m!97913))

(assert (=> b!91296 m!97899))

(declare-fun m!97915 () Bool)

(assert (=> b!91296 m!97915))

(declare-fun m!97917 () Bool)

(assert (=> mapNonEmpty!3566 m!97917))

(declare-fun m!97919 () Bool)

(assert (=> start!11156 m!97919))

(assert (=> b!91283 m!97899))

(declare-fun m!97921 () Bool)

(assert (=> b!91283 m!97921))

(declare-fun m!97923 () Bool)

(assert (=> b!91283 m!97923))

(assert (=> b!91283 m!97921))

(assert (=> b!91283 m!97923))

(declare-fun m!97925 () Bool)

(assert (=> b!91283 m!97925))

(declare-fun m!97927 () Bool)

(assert (=> b!91294 m!97927))

(declare-fun m!97929 () Bool)

(assert (=> b!91294 m!97929))

(declare-fun m!97931 () Bool)

(assert (=> b!91294 m!97931))

(declare-fun m!97933 () Bool)

(assert (=> b!91294 m!97933))

(declare-fun m!97935 () Bool)

(assert (=> b!91294 m!97935))

(declare-fun m!97937 () Bool)

(assert (=> b!91294 m!97937))

(declare-fun m!97939 () Bool)

(assert (=> b!91294 m!97939))

(assert (=> b!91294 m!97899))

(declare-fun m!97941 () Bool)

(assert (=> b!91294 m!97941))

(declare-fun m!97943 () Bool)

(assert (=> b!91294 m!97943))

(assert (=> b!91294 m!97899))

(declare-fun m!97945 () Bool)

(assert (=> b!91294 m!97945))

(assert (=> b!91294 m!97899))

(declare-fun m!97947 () Bool)

(assert (=> b!91294 m!97947))

(assert (=> b!91294 m!97931))

(declare-fun m!97949 () Bool)

(assert (=> b!91294 m!97949))

(declare-fun m!97951 () Bool)

(assert (=> b!91293 m!97951))

(declare-fun m!97953 () Bool)

(assert (=> b!91293 m!97953))

(declare-fun m!97955 () Bool)

(assert (=> b!91288 m!97955))

(declare-fun m!97957 () Bool)

(assert (=> b!91288 m!97957))

(declare-fun m!97959 () Bool)

(assert (=> mapNonEmpty!3565 m!97959))

(declare-fun m!97961 () Bool)

(assert (=> b!91276 m!97961))

(check-sat b_and!5529 (not b!91294) (not b!91296) (not b!91288) (not start!11156) tp_is_empty!2581 (not b_lambda!4025) (not b_next!2329) (not b!91276) (not b!91284) (not b!91290) (not b_next!2331) (not b!91283) b_and!5531 (not mapNonEmpty!3565) (not b!91286) (not mapNonEmpty!3566) (not b!91293))
(check-sat b_and!5529 b_and!5531 (not b_next!2329) (not b_next!2331))
(get-model)

(declare-fun b_lambda!4031 () Bool)

(assert (= b_lambda!4025 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4031)))

(check-sat b_and!5529 (not b!91294) (not b!91296) (not b!91288) (not start!11156) tp_is_empty!2581 (not b_next!2329) (not b!91276) (not b!91284) (not b!91290) (not b_next!2331) (not b!91283) (not b_lambda!4031) b_and!5531 (not mapNonEmpty!3565) (not b!91286) (not mapNonEmpty!3566) (not b!91293))
(check-sat b_and!5529 b_and!5531 (not b_next!2329) (not b_next!2331))
(get-model)

(declare-fun d!24041 () Bool)

(declare-fun res!46569 () Bool)

(declare-fun e!59661 () Bool)

(assert (=> d!24041 (=> (not res!46569) (not e!59661))))

(declare-fun simpleValid!63 (LongMapFixedSize!802) Bool)

(assert (=> d!24041 (= res!46569 (simpleValid!63 newMap!16))))

(assert (=> d!24041 (= (valid!362 newMap!16) e!59661)))

(declare-fun b!91442 () Bool)

(declare-fun res!46570 () Bool)

(assert (=> b!91442 (=> (not res!46570) (not e!59661))))

(declare-fun arrayCountValidKeys!0 (array!4111 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!91442 (= res!46570 (= (arrayCountValidKeys!0 (_keys!4084 newMap!16) #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) (_size!450 newMap!16)))))

(declare-fun b!91443 () Bool)

(declare-fun res!46571 () Bool)

(assert (=> b!91443 (=> (not res!46571) (not e!59661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4111 (_ BitVec 32)) Bool)

(assert (=> b!91443 (= res!46571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(declare-fun b!91444 () Bool)

(assert (=> b!91444 (= e!59661 (arrayNoDuplicates!0 (_keys!4084 newMap!16) #b00000000000000000000000000000000 Nil!1553))))

(assert (= (and d!24041 res!46569) b!91442))

(assert (= (and b!91442 res!46570) b!91443))

(assert (= (and b!91443 res!46571) b!91444))

(declare-fun m!98099 () Bool)

(assert (=> d!24041 m!98099))

(declare-fun m!98101 () Bool)

(assert (=> b!91442 m!98101))

(declare-fun m!98103 () Bool)

(assert (=> b!91443 m!98103))

(declare-fun m!98105 () Bool)

(assert (=> b!91444 m!98105))

(assert (=> b!91276 d!24041))

(declare-fun d!24043 () Bool)

(assert (=> d!24043 (= (map!1213 newMap!16) (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun bs!3793 () Bool)

(assert (= bs!3793 d!24043))

(declare-fun m!98107 () Bool)

(assert (=> bs!3793 m!98107))

(assert (=> b!91286 d!24043))

(declare-fun bm!8929 () Bool)

(declare-fun call!8936 () ListLongMap!1477)

(assert (=> bm!8929 (= call!8936 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91487 () Bool)

(declare-fun res!46592 () Bool)

(declare-fun e!59700 () Bool)

(assert (=> b!91487 (=> (not res!46592) (not e!59700))))

(declare-fun e!59691 () Bool)

(assert (=> b!91487 (= res!46592 e!59691)))

(declare-fun res!46598 () Bool)

(assert (=> b!91487 (=> res!46598 e!59691)))

(declare-fun e!59696 () Bool)

(assert (=> b!91487 (= res!46598 (not e!59696))))

(declare-fun res!46593 () Bool)

(assert (=> b!91487 (=> (not res!46593) (not e!59696))))

(assert (=> b!91487 (= res!46593 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91488 () Bool)

(declare-fun e!59698 () ListLongMap!1477)

(declare-fun call!8935 () ListLongMap!1477)

(assert (=> b!91488 (= e!59698 call!8935)))

(declare-fun bm!8930 () Bool)

(declare-fun call!8938 () Bool)

(declare-fun lt!44671 () ListLongMap!1477)

(assert (=> bm!8930 (= call!8938 (contains!772 lt!44671 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8931 () Bool)

(declare-fun call!8934 () Bool)

(assert (=> bm!8931 (= call!8934 (contains!772 lt!44671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91489 () Bool)

(declare-fun c!15159 () Bool)

(assert (=> b!91489 (= c!15159 (and (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59694 () ListLongMap!1477)

(assert (=> b!91489 (= e!59698 e!59694)))

(declare-fun b!91490 () Bool)

(declare-fun e!59695 () Unit!2718)

(declare-fun Unit!2725 () Unit!2718)

(assert (=> b!91490 (= e!59695 Unit!2725)))

(declare-fun b!91491 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!91491 (= e!59696 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91492 () Bool)

(assert (=> b!91492 (= e!59694 call!8935)))

(declare-fun b!91493 () Bool)

(declare-fun e!59689 () Bool)

(declare-fun apply!87 (ListLongMap!1477 (_ BitVec 64)) V!3089)

(assert (=> b!91493 (= e!59689 (= (apply!87 lt!44671 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91494 () Bool)

(declare-fun e!59699 () Bool)

(assert (=> b!91494 (= e!59699 e!59689)))

(declare-fun res!46590 () Bool)

(assert (=> b!91494 (= res!46590 call!8934)))

(assert (=> b!91494 (=> (not res!46590) (not e!59689))))

(declare-fun b!91495 () Bool)

(declare-fun e!59697 () Bool)

(assert (=> b!91495 (= e!59700 e!59697)))

(declare-fun c!15158 () Bool)

(assert (=> b!91495 (= c!15158 (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8932 () Bool)

(declare-fun call!8933 () ListLongMap!1477)

(declare-fun call!8932 () ListLongMap!1477)

(assert (=> bm!8932 (= call!8933 call!8932)))

(declare-fun b!91496 () Bool)

(declare-fun res!46594 () Bool)

(assert (=> b!91496 (=> (not res!46594) (not e!59700))))

(assert (=> b!91496 (= res!46594 e!59699)))

(declare-fun c!15162 () Bool)

(assert (=> b!91496 (= c!15162 (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91497 () Bool)

(declare-fun e!59693 () Bool)

(assert (=> b!91497 (= e!59693 (= (apply!87 lt!44671 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91498 () Bool)

(declare-fun lt!44657 () Unit!2718)

(assert (=> b!91498 (= e!59695 lt!44657)))

(declare-fun lt!44662 () ListLongMap!1477)

(assert (=> b!91498 (= lt!44662 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44672 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44663 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44663 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44658 () Unit!2718)

(declare-fun addStillContains!63 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2718)

(assert (=> b!91498 (= lt!44658 (addStillContains!63 lt!44662 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44663))))

(assert (=> b!91498 (contains!772 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44663)))

(declare-fun lt!44674 () Unit!2718)

(assert (=> b!91498 (= lt!44674 lt!44658)))

(declare-fun lt!44669 () ListLongMap!1477)

(assert (=> b!91498 (= lt!44669 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44660 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44667 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44667 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44656 () Unit!2718)

(declare-fun addApplyDifferent!63 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2718)

(assert (=> b!91498 (= lt!44656 (addApplyDifferent!63 lt!44669 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44667))))

(assert (=> b!91498 (= (apply!87 (+!119 lt!44669 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44667) (apply!87 lt!44669 lt!44667))))

(declare-fun lt!44666 () Unit!2718)

(assert (=> b!91498 (= lt!44666 lt!44656)))

(declare-fun lt!44675 () ListLongMap!1477)

(assert (=> b!91498 (= lt!44675 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44654 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44655 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44655 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44659 () Unit!2718)

(assert (=> b!91498 (= lt!44659 (addApplyDifferent!63 lt!44675 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44655))))

(assert (=> b!91498 (= (apply!87 (+!119 lt!44675 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44655) (apply!87 lt!44675 lt!44655))))

(declare-fun lt!44673 () Unit!2718)

(assert (=> b!91498 (= lt!44673 lt!44659)))

(declare-fun lt!44665 () ListLongMap!1477)

(assert (=> b!91498 (= lt!44665 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44664 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44664 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44670 () (_ BitVec 64))

(assert (=> b!91498 (= lt!44670 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91498 (= lt!44657 (addApplyDifferent!63 lt!44665 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44670))))

(assert (=> b!91498 (= (apply!87 (+!119 lt!44665 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44670) (apply!87 lt!44665 lt!44670))))

(declare-fun bm!8933 () Bool)

(declare-fun call!8937 () ListLongMap!1477)

(declare-fun c!15163 () Bool)

(declare-fun c!15161 () Bool)

(assert (=> bm!8933 (= call!8937 (+!119 (ite c!15163 call!8936 (ite c!15161 call!8932 call!8933)) (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun bm!8934 () Bool)

(assert (=> bm!8934 (= call!8932 call!8936)))

(declare-fun b!91499 () Bool)

(declare-fun e!59692 () Bool)

(assert (=> b!91499 (= e!59692 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8935 () Bool)

(assert (=> bm!8935 (= call!8935 call!8937)))

(declare-fun d!24045 () Bool)

(assert (=> d!24045 e!59700))

(declare-fun res!46595 () Bool)

(assert (=> d!24045 (=> (not res!46595) (not e!59700))))

(assert (=> d!24045 (= res!46595 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun lt!44661 () ListLongMap!1477)

(assert (=> d!24045 (= lt!44671 lt!44661)))

(declare-fun lt!44668 () Unit!2718)

(assert (=> d!24045 (= lt!44668 e!59695)))

(declare-fun c!15160 () Bool)

(assert (=> d!24045 (= c!15160 e!59692)))

(declare-fun res!46596 () Bool)

(assert (=> d!24045 (=> (not res!46596) (not e!59692))))

(assert (=> d!24045 (= res!46596 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun e!59688 () ListLongMap!1477)

(assert (=> d!24045 (= lt!44661 e!59688)))

(assert (=> d!24045 (= c!15163 (and (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24045 (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24045 (= (getCurrentListMap!437 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) lt!44671)))

(declare-fun b!91500 () Bool)

(assert (=> b!91500 (= e!59697 e!59693)))

(declare-fun res!46597 () Bool)

(assert (=> b!91500 (= res!46597 call!8938)))

(assert (=> b!91500 (=> (not res!46597) (not e!59693))))

(declare-fun b!91501 () Bool)

(assert (=> b!91501 (= e!59699 (not call!8934))))

(declare-fun b!91502 () Bool)

(declare-fun e!59690 () Bool)

(assert (=> b!91502 (= e!59691 e!59690)))

(declare-fun res!46591 () Bool)

(assert (=> b!91502 (=> (not res!46591) (not e!59690))))

(assert (=> b!91502 (= res!46591 (contains!772 lt!44671 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91502 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91503 () Bool)

(assert (=> b!91503 (= e!59690 (= (apply!87 lt!44671 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91503 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2203 (_values!2388 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> b!91503 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91504 () Bool)

(assert (=> b!91504 (= e!59688 (+!119 call!8937 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91505 () Bool)

(assert (=> b!91505 (= e!59697 (not call!8938))))

(declare-fun b!91506 () Bool)

(assert (=> b!91506 (= e!59694 call!8933)))

(declare-fun b!91507 () Bool)

(assert (=> b!91507 (= e!59688 e!59698)))

(assert (=> b!91507 (= c!15161 (and (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!24045 c!15163) b!91504))

(assert (= (and d!24045 (not c!15163)) b!91507))

(assert (= (and b!91507 c!15161) b!91488))

(assert (= (and b!91507 (not c!15161)) b!91489))

(assert (= (and b!91489 c!15159) b!91492))

(assert (= (and b!91489 (not c!15159)) b!91506))

(assert (= (or b!91492 b!91506) bm!8932))

(assert (= (or b!91488 bm!8932) bm!8934))

(assert (= (or b!91488 b!91492) bm!8935))

(assert (= (or b!91504 bm!8934) bm!8929))

(assert (= (or b!91504 bm!8935) bm!8933))

(assert (= (and d!24045 res!46596) b!91499))

(assert (= (and d!24045 c!15160) b!91498))

(assert (= (and d!24045 (not c!15160)) b!91490))

(assert (= (and d!24045 res!46595) b!91487))

(assert (= (and b!91487 res!46593) b!91491))

(assert (= (and b!91487 (not res!46598)) b!91502))

(assert (= (and b!91502 res!46591) b!91503))

(assert (= (and b!91487 res!46592) b!91496))

(assert (= (and b!91496 c!15162) b!91494))

(assert (= (and b!91496 (not c!15162)) b!91501))

(assert (= (and b!91494 res!46590) b!91493))

(assert (= (or b!91494 b!91501) bm!8931))

(assert (= (and b!91496 res!46594) b!91495))

(assert (= (and b!91495 c!15158) b!91500))

(assert (= (and b!91495 (not c!15158)) b!91505))

(assert (= (and b!91500 res!46597) b!91497))

(assert (= (or b!91500 b!91505) bm!8930))

(declare-fun b_lambda!4033 () Bool)

(assert (=> (not b_lambda!4033) (not b!91503)))

(assert (=> b!91503 t!5377))

(declare-fun b_and!5549 () Bool)

(assert (= b_and!5529 (and (=> t!5377 result!3073) b_and!5549)))

(assert (=> b!91503 t!5379))

(declare-fun b_and!5551 () Bool)

(assert (= b_and!5531 (and (=> t!5379 result!3077) b_and!5551)))

(declare-fun m!98109 () Bool)

(assert (=> b!91491 m!98109))

(assert (=> b!91491 m!98109))

(declare-fun m!98111 () Bool)

(assert (=> b!91491 m!98111))

(declare-fun m!98113 () Bool)

(assert (=> bm!8931 m!98113))

(assert (=> bm!8929 m!97943))

(declare-fun m!98115 () Bool)

(assert (=> b!91498 m!98115))

(declare-fun m!98117 () Bool)

(assert (=> b!91498 m!98117))

(declare-fun m!98119 () Bool)

(assert (=> b!91498 m!98119))

(assert (=> b!91498 m!98115))

(declare-fun m!98121 () Bool)

(assert (=> b!91498 m!98121))

(declare-fun m!98123 () Bool)

(assert (=> b!91498 m!98123))

(assert (=> b!91498 m!98109))

(declare-fun m!98125 () Bool)

(assert (=> b!91498 m!98125))

(declare-fun m!98127 () Bool)

(assert (=> b!91498 m!98127))

(assert (=> b!91498 m!98121))

(declare-fun m!98129 () Bool)

(assert (=> b!91498 m!98129))

(declare-fun m!98131 () Bool)

(assert (=> b!91498 m!98131))

(declare-fun m!98133 () Bool)

(assert (=> b!91498 m!98133))

(assert (=> b!91498 m!98123))

(declare-fun m!98135 () Bool)

(assert (=> b!91498 m!98135))

(declare-fun m!98137 () Bool)

(assert (=> b!91498 m!98137))

(assert (=> b!91498 m!97943))

(assert (=> b!91498 m!98137))

(declare-fun m!98139 () Bool)

(assert (=> b!91498 m!98139))

(declare-fun m!98141 () Bool)

(assert (=> b!91498 m!98141))

(declare-fun m!98143 () Bool)

(assert (=> b!91498 m!98143))

(assert (=> b!91499 m!98109))

(assert (=> b!91499 m!98109))

(assert (=> b!91499 m!98111))

(declare-fun m!98145 () Bool)

(assert (=> b!91497 m!98145))

(assert (=> b!91502 m!98109))

(assert (=> b!91502 m!98109))

(declare-fun m!98147 () Bool)

(assert (=> b!91502 m!98147))

(assert (=> b!91503 m!97923))

(assert (=> b!91503 m!98109))

(declare-fun m!98149 () Bool)

(assert (=> b!91503 m!98149))

(assert (=> b!91503 m!97923))

(declare-fun m!98151 () Bool)

(assert (=> b!91503 m!98151))

(assert (=> b!91503 m!98109))

(declare-fun m!98153 () Bool)

(assert (=> b!91503 m!98153))

(assert (=> b!91503 m!98149))

(declare-fun m!98155 () Bool)

(assert (=> d!24045 m!98155))

(declare-fun m!98157 () Bool)

(assert (=> b!91504 m!98157))

(declare-fun m!98159 () Bool)

(assert (=> bm!8933 m!98159))

(declare-fun m!98161 () Bool)

(assert (=> bm!8930 m!98161))

(declare-fun m!98163 () Bool)

(assert (=> b!91493 m!98163))

(assert (=> b!91286 d!24045))

(declare-fun d!24047 () Bool)

(declare-fun res!46599 () Bool)

(declare-fun e!59701 () Bool)

(assert (=> d!24047 (=> (not res!46599) (not e!59701))))

(assert (=> d!24047 (= res!46599 (simpleValid!63 (_2!1138 lt!44500)))))

(assert (=> d!24047 (= (valid!362 (_2!1138 lt!44500)) e!59701)))

(declare-fun b!91508 () Bool)

(declare-fun res!46600 () Bool)

(assert (=> b!91508 (=> (not res!46600) (not e!59701))))

(assert (=> b!91508 (= res!46600 (= (arrayCountValidKeys!0 (_keys!4084 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))) (_size!450 (_2!1138 lt!44500))))))

(declare-fun b!91509 () Bool)

(declare-fun res!46601 () Bool)

(assert (=> b!91509 (=> (not res!46601) (not e!59701))))

(assert (=> b!91509 (= res!46601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4084 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500))))))

(declare-fun b!91510 () Bool)

(assert (=> b!91510 (= e!59701 (arrayNoDuplicates!0 (_keys!4084 (_2!1138 lt!44500)) #b00000000000000000000000000000000 Nil!1553))))

(assert (= (and d!24047 res!46599) b!91508))

(assert (= (and b!91508 res!46600) b!91509))

(assert (= (and b!91509 res!46601) b!91510))

(declare-fun m!98165 () Bool)

(assert (=> d!24047 m!98165))

(declare-fun m!98167 () Bool)

(assert (=> b!91508 m!98167))

(declare-fun m!98169 () Bool)

(assert (=> b!91509 m!98169))

(declare-fun m!98171 () Bool)

(assert (=> b!91510 m!98171))

(assert (=> b!91284 d!24047))

(declare-fun d!24049 () Bool)

(declare-fun e!59704 () Bool)

(assert (=> d!24049 e!59704))

(declare-fun res!46606 () Bool)

(assert (=> d!24049 (=> (not res!46606) (not e!59704))))

(declare-fun lt!44684 () ListLongMap!1477)

(assert (=> d!24049 (= res!46606 (contains!772 lt!44684 (_1!1139 lt!44489)))))

(declare-fun lt!44687 () List!1555)

(assert (=> d!24049 (= lt!44684 (ListLongMap!1478 lt!44687))))

(declare-fun lt!44686 () Unit!2718)

(declare-fun lt!44685 () Unit!2718)

(assert (=> d!24049 (= lt!44686 lt!44685)))

(declare-datatypes ((Option!149 0))(
  ( (Some!148 (v!2719 V!3089)) (None!147) )
))
(declare-fun getValueByKey!143 (List!1555 (_ BitVec 64)) Option!149)

(assert (=> d!24049 (= (getValueByKey!143 lt!44687 (_1!1139 lt!44489)) (Some!148 (_2!1139 lt!44489)))))

(declare-fun lemmaContainsTupThenGetReturnValue!63 (List!1555 (_ BitVec 64) V!3089) Unit!2718)

(assert (=> d!24049 (= lt!44685 (lemmaContainsTupThenGetReturnValue!63 lt!44687 (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(declare-fun insertStrictlySorted!66 (List!1555 (_ BitVec 64) V!3089) List!1555)

(assert (=> d!24049 (= lt!44687 (insertStrictlySorted!66 (toList!754 lt!44487) (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(assert (=> d!24049 (= (+!119 lt!44487 lt!44489) lt!44684)))

(declare-fun b!91515 () Bool)

(declare-fun res!46607 () Bool)

(assert (=> b!91515 (=> (not res!46607) (not e!59704))))

(assert (=> b!91515 (= res!46607 (= (getValueByKey!143 (toList!754 lt!44684) (_1!1139 lt!44489)) (Some!148 (_2!1139 lt!44489))))))

(declare-fun b!91516 () Bool)

(declare-fun contains!773 (List!1555 tuple2!2256) Bool)

(assert (=> b!91516 (= e!59704 (contains!773 (toList!754 lt!44684) lt!44489))))

(assert (= (and d!24049 res!46606) b!91515))

(assert (= (and b!91515 res!46607) b!91516))

(declare-fun m!98173 () Bool)

(assert (=> d!24049 m!98173))

(declare-fun m!98175 () Bool)

(assert (=> d!24049 m!98175))

(declare-fun m!98177 () Bool)

(assert (=> d!24049 m!98177))

(declare-fun m!98179 () Bool)

(assert (=> d!24049 m!98179))

(declare-fun m!98181 () Bool)

(assert (=> b!91515 m!98181))

(declare-fun m!98183 () Bool)

(assert (=> b!91516 m!98183))

(assert (=> b!91294 d!24049))

(declare-fun d!24051 () Bool)

(declare-fun e!59705 () Bool)

(assert (=> d!24051 e!59705))

(declare-fun res!46608 () Bool)

(assert (=> d!24051 (=> (not res!46608) (not e!59705))))

(declare-fun lt!44688 () ListLongMap!1477)

(assert (=> d!24051 (= res!46608 (contains!772 lt!44688 (_1!1139 lt!44495)))))

(declare-fun lt!44691 () List!1555)

(assert (=> d!24051 (= lt!44688 (ListLongMap!1478 lt!44691))))

(declare-fun lt!44690 () Unit!2718)

(declare-fun lt!44689 () Unit!2718)

(assert (=> d!24051 (= lt!44690 lt!44689)))

(assert (=> d!24051 (= (getValueByKey!143 lt!44691 (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495)))))

(assert (=> d!24051 (= lt!44689 (lemmaContainsTupThenGetReturnValue!63 lt!44691 (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(assert (=> d!24051 (= lt!44691 (insertStrictlySorted!66 (toList!754 lt!44485) (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(assert (=> d!24051 (= (+!119 lt!44485 lt!44495) lt!44688)))

(declare-fun b!91517 () Bool)

(declare-fun res!46609 () Bool)

(assert (=> b!91517 (=> (not res!46609) (not e!59705))))

(assert (=> b!91517 (= res!46609 (= (getValueByKey!143 (toList!754 lt!44688) (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495))))))

(declare-fun b!91518 () Bool)

(assert (=> b!91518 (= e!59705 (contains!773 (toList!754 lt!44688) lt!44495))))

(assert (= (and d!24051 res!46608) b!91517))

(assert (= (and b!91517 res!46609) b!91518))

(declare-fun m!98185 () Bool)

(assert (=> d!24051 m!98185))

(declare-fun m!98187 () Bool)

(assert (=> d!24051 m!98187))

(declare-fun m!98189 () Bool)

(assert (=> d!24051 m!98189))

(declare-fun m!98191 () Bool)

(assert (=> d!24051 m!98191))

(declare-fun m!98193 () Bool)

(assert (=> b!91517 m!98193))

(declare-fun m!98195 () Bool)

(assert (=> b!91518 m!98195))

(assert (=> b!91294 d!24051))

(declare-fun b!91543 () Bool)

(declare-fun lt!44709 () Unit!2718)

(declare-fun lt!44708 () Unit!2718)

(assert (=> b!91543 (= lt!44709 lt!44708)))

(declare-fun lt!44712 () (_ BitVec 64))

(declare-fun lt!44710 () ListLongMap!1477)

(declare-fun lt!44711 () V!3089)

(declare-fun lt!44706 () (_ BitVec 64))

(assert (=> b!91543 (not (contains!772 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711)) lt!44706))))

(declare-fun addStillNotContains!37 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2718)

(assert (=> b!91543 (= lt!44708 (addStillNotContains!37 lt!44710 lt!44712 lt!44711 lt!44706))))

(assert (=> b!91543 (= lt!44706 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91543 (= lt!44711 (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91543 (= lt!44712 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!8941 () ListLongMap!1477)

(assert (=> b!91543 (= lt!44710 call!8941)))

(declare-fun e!59720 () ListLongMap!1477)

(assert (=> b!91543 (= e!59720 (+!119 call!8941 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!91544 () Bool)

(declare-fun e!59725 () Bool)

(declare-fun e!59724 () Bool)

(assert (=> b!91544 (= e!59725 e!59724)))

(declare-fun c!15173 () Bool)

(assert (=> b!91544 (= c!15173 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91545 () Bool)

(declare-fun lt!44707 () ListLongMap!1477)

(assert (=> b!91545 (= e!59724 (= lt!44707 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91546 () Bool)

(declare-fun e!59723 () ListLongMap!1477)

(assert (=> b!91546 (= e!59723 (ListLongMap!1478 Nil!1552))))

(declare-fun bm!8938 () Bool)

(assert (=> bm!8938 (= call!8941 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91547 () Bool)

(assert (=> b!91547 (= e!59723 e!59720)))

(declare-fun c!15175 () Bool)

(assert (=> b!91547 (= c!15175 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91548 () Bool)

(declare-fun isEmpty!350 (ListLongMap!1477) Bool)

(assert (=> b!91548 (= e!59724 (isEmpty!350 lt!44707))))

(declare-fun b!91549 () Bool)

(assert (=> b!91549 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> b!91549 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2203 (_values!2388 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun e!59726 () Bool)

(assert (=> b!91549 (= e!59726 (= (apply!87 lt!44707 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!91550 () Bool)

(declare-fun e!59722 () Bool)

(assert (=> b!91550 (= e!59722 e!59725)))

(declare-fun c!15174 () Bool)

(declare-fun e!59721 () Bool)

(assert (=> b!91550 (= c!15174 e!59721)))

(declare-fun res!46620 () Bool)

(assert (=> b!91550 (=> (not res!46620) (not e!59721))))

(assert (=> b!91550 (= res!46620 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91552 () Bool)

(assert (=> b!91552 (= e!59721 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91552 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!91553 () Bool)

(assert (=> b!91553 (= e!59725 e!59726)))

(assert (=> b!91553 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun res!46618 () Bool)

(assert (=> b!91553 (= res!46618 (contains!772 lt!44707 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91553 (=> (not res!46618) (not e!59726))))

(declare-fun b!91554 () Bool)

(declare-fun res!46619 () Bool)

(assert (=> b!91554 (=> (not res!46619) (not e!59722))))

(assert (=> b!91554 (= res!46619 (not (contains!772 lt!44707 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91551 () Bool)

(assert (=> b!91551 (= e!59720 call!8941)))

(declare-fun d!24053 () Bool)

(assert (=> d!24053 e!59722))

(declare-fun res!46621 () Bool)

(assert (=> d!24053 (=> (not res!46621) (not e!59722))))

(assert (=> d!24053 (= res!46621 (not (contains!772 lt!44707 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24053 (= lt!44707 e!59723)))

(declare-fun c!15172 () Bool)

(assert (=> d!24053 (= c!15172 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> d!24053 (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24053 (= (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) lt!44707)))

(assert (= (and d!24053 c!15172) b!91546))

(assert (= (and d!24053 (not c!15172)) b!91547))

(assert (= (and b!91547 c!15175) b!91543))

(assert (= (and b!91547 (not c!15175)) b!91551))

(assert (= (or b!91543 b!91551) bm!8938))

(assert (= (and d!24053 res!46621) b!91554))

(assert (= (and b!91554 res!46619) b!91550))

(assert (= (and b!91550 res!46620) b!91552))

(assert (= (and b!91550 c!15174) b!91553))

(assert (= (and b!91550 (not c!15174)) b!91544))

(assert (= (and b!91553 res!46618) b!91549))

(assert (= (and b!91544 c!15173) b!91545))

(assert (= (and b!91544 (not c!15173)) b!91548))

(declare-fun b_lambda!4035 () Bool)

(assert (=> (not b_lambda!4035) (not b!91543)))

(assert (=> b!91543 t!5377))

(declare-fun b_and!5553 () Bool)

(assert (= b_and!5549 (and (=> t!5377 result!3073) b_and!5553)))

(assert (=> b!91543 t!5379))

(declare-fun b_and!5555 () Bool)

(assert (= b_and!5551 (and (=> t!5379 result!3077) b_and!5555)))

(declare-fun b_lambda!4037 () Bool)

(assert (=> (not b_lambda!4037) (not b!91549)))

(assert (=> b!91549 t!5377))

(declare-fun b_and!5557 () Bool)

(assert (= b_and!5553 (and (=> t!5377 result!3073) b_and!5557)))

(assert (=> b!91549 t!5379))

(declare-fun b_and!5559 () Bool)

(assert (= b_and!5555 (and (=> t!5379 result!3077) b_and!5559)))

(declare-fun m!98197 () Bool)

(assert (=> b!91554 m!98197))

(declare-fun m!98199 () Bool)

(assert (=> d!24053 m!98199))

(assert (=> d!24053 m!98155))

(declare-fun m!98201 () Bool)

(assert (=> b!91548 m!98201))

(declare-fun m!98203 () Bool)

(assert (=> b!91545 m!98203))

(assert (=> bm!8938 m!98203))

(assert (=> b!91549 m!98109))

(declare-fun m!98205 () Bool)

(assert (=> b!91549 m!98205))

(assert (=> b!91549 m!97923))

(assert (=> b!91549 m!98149))

(assert (=> b!91549 m!98109))

(assert (=> b!91549 m!98149))

(assert (=> b!91549 m!97923))

(assert (=> b!91549 m!98151))

(declare-fun m!98207 () Bool)

(assert (=> b!91543 m!98207))

(declare-fun m!98209 () Bool)

(assert (=> b!91543 m!98209))

(assert (=> b!91543 m!97923))

(assert (=> b!91543 m!98149))

(declare-fun m!98211 () Bool)

(assert (=> b!91543 m!98211))

(assert (=> b!91543 m!98149))

(assert (=> b!91543 m!97923))

(assert (=> b!91543 m!98151))

(assert (=> b!91543 m!98211))

(declare-fun m!98213 () Bool)

(assert (=> b!91543 m!98213))

(assert (=> b!91543 m!98109))

(assert (=> b!91547 m!98109))

(assert (=> b!91547 m!98109))

(assert (=> b!91547 m!98111))

(assert (=> b!91552 m!98109))

(assert (=> b!91552 m!98109))

(assert (=> b!91552 m!98111))

(assert (=> b!91553 m!98109))

(assert (=> b!91553 m!98109))

(declare-fun m!98215 () Bool)

(assert (=> b!91553 m!98215))

(assert (=> b!91294 d!24053))

(declare-fun bm!8939 () Bool)

(declare-fun call!8946 () ListLongMap!1477)

(assert (=> bm!8939 (= call!8946 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91555 () Bool)

(declare-fun res!46624 () Bool)

(declare-fun e!59739 () Bool)

(assert (=> b!91555 (=> (not res!46624) (not e!59739))))

(declare-fun e!59730 () Bool)

(assert (=> b!91555 (= res!46624 e!59730)))

(declare-fun res!46630 () Bool)

(assert (=> b!91555 (=> res!46630 e!59730)))

(declare-fun e!59735 () Bool)

(assert (=> b!91555 (= res!46630 (not e!59735))))

(declare-fun res!46625 () Bool)

(assert (=> b!91555 (=> (not res!46625) (not e!59735))))

(assert (=> b!91555 (= res!46625 (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91556 () Bool)

(declare-fun e!59737 () ListLongMap!1477)

(declare-fun call!8945 () ListLongMap!1477)

(assert (=> b!91556 (= e!59737 call!8945)))

(declare-fun bm!8940 () Bool)

(declare-fun call!8948 () Bool)

(declare-fun lt!44730 () ListLongMap!1477)

(assert (=> bm!8940 (= call!8948 (contains!772 lt!44730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8941 () Bool)

(declare-fun call!8944 () Bool)

(assert (=> bm!8941 (= call!8944 (contains!772 lt!44730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91557 () Bool)

(declare-fun c!15177 () Bool)

(assert (=> b!91557 (= c!15177 (and (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59733 () ListLongMap!1477)

(assert (=> b!91557 (= e!59737 e!59733)))

(declare-fun b!91558 () Bool)

(declare-fun e!59734 () Unit!2718)

(declare-fun Unit!2726 () Unit!2718)

(assert (=> b!91558 (= e!59734 Unit!2726)))

(declare-fun b!91559 () Bool)

(assert (=> b!91559 (= e!59735 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91560 () Bool)

(assert (=> b!91560 (= e!59733 call!8945)))

(declare-fun b!91561 () Bool)

(declare-fun e!59728 () Bool)

(assert (=> b!91561 (= e!59728 (= (apply!87 lt!44730 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91562 () Bool)

(declare-fun e!59738 () Bool)

(assert (=> b!91562 (= e!59738 e!59728)))

(declare-fun res!46622 () Bool)

(assert (=> b!91562 (= res!46622 call!8944)))

(assert (=> b!91562 (=> (not res!46622) (not e!59728))))

(declare-fun b!91563 () Bool)

(declare-fun e!59736 () Bool)

(assert (=> b!91563 (= e!59739 e!59736)))

(declare-fun c!15176 () Bool)

(assert (=> b!91563 (= c!15176 (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8942 () Bool)

(declare-fun call!8943 () ListLongMap!1477)

(declare-fun call!8942 () ListLongMap!1477)

(assert (=> bm!8942 (= call!8943 call!8942)))

(declare-fun b!91564 () Bool)

(declare-fun res!46626 () Bool)

(assert (=> b!91564 (=> (not res!46626) (not e!59739))))

(assert (=> b!91564 (= res!46626 e!59738)))

(declare-fun c!15180 () Bool)

(assert (=> b!91564 (= c!15180 (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91565 () Bool)

(declare-fun e!59732 () Bool)

(assert (=> b!91565 (= e!59732 (= (apply!87 lt!44730 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91566 () Bool)

(declare-fun lt!44716 () Unit!2718)

(assert (=> b!91566 (= e!59734 lt!44716)))

(declare-fun lt!44721 () ListLongMap!1477)

(assert (=> b!91566 (= lt!44721 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44731 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44722 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44722 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))

(declare-fun lt!44717 () Unit!2718)

(assert (=> b!91566 (= lt!44717 (addStillContains!63 lt!44721 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44722))))

(assert (=> b!91566 (contains!772 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44722)))

(declare-fun lt!44733 () Unit!2718)

(assert (=> b!91566 (= lt!44733 lt!44717)))

(declare-fun lt!44728 () ListLongMap!1477)

(assert (=> b!91566 (= lt!44728 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44719 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44719 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44726 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44726 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))

(declare-fun lt!44715 () Unit!2718)

(assert (=> b!91566 (= lt!44715 (addApplyDifferent!63 lt!44728 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44726))))

(assert (=> b!91566 (= (apply!87 (+!119 lt!44728 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44726) (apply!87 lt!44728 lt!44726))))

(declare-fun lt!44725 () Unit!2718)

(assert (=> b!91566 (= lt!44725 lt!44715)))

(declare-fun lt!44734 () ListLongMap!1477)

(assert (=> b!91566 (= lt!44734 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44713 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44713 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44714 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44714 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))

(declare-fun lt!44718 () Unit!2718)

(assert (=> b!91566 (= lt!44718 (addApplyDifferent!63 lt!44734 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44714))))

(assert (=> b!91566 (= (apply!87 (+!119 lt!44734 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44714) (apply!87 lt!44734 lt!44714))))

(declare-fun lt!44732 () Unit!2718)

(assert (=> b!91566 (= lt!44732 lt!44718)))

(declare-fun lt!44724 () ListLongMap!1477)

(assert (=> b!91566 (= lt!44724 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun lt!44723 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44729 () (_ BitVec 64))

(assert (=> b!91566 (= lt!44729 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))

(assert (=> b!91566 (= lt!44716 (addApplyDifferent!63 lt!44724 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44729))))

(assert (=> b!91566 (= (apply!87 (+!119 lt!44724 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44729) (apply!87 lt!44724 lt!44729))))

(declare-fun bm!8943 () Bool)

(declare-fun c!15181 () Bool)

(declare-fun c!15179 () Bool)

(declare-fun call!8947 () ListLongMap!1477)

(assert (=> bm!8943 (= call!8947 (+!119 (ite c!15181 call!8946 (ite c!15179 call!8942 call!8943)) (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun bm!8944 () Bool)

(assert (=> bm!8944 (= call!8942 call!8946)))

(declare-fun b!91567 () Bool)

(declare-fun e!59731 () Bool)

(assert (=> b!91567 (= e!59731 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun bm!8945 () Bool)

(assert (=> bm!8945 (= call!8945 call!8947)))

(declare-fun d!24055 () Bool)

(assert (=> d!24055 e!59739))

(declare-fun res!46627 () Bool)

(assert (=> d!24055 (=> (not res!46627) (not e!59739))))

(assert (=> d!24055 (= res!46627 (or (bvsge from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun lt!44720 () ListLongMap!1477)

(assert (=> d!24055 (= lt!44730 lt!44720)))

(declare-fun lt!44727 () Unit!2718)

(assert (=> d!24055 (= lt!44727 e!59734)))

(declare-fun c!15178 () Bool)

(assert (=> d!24055 (= c!15178 e!59731)))

(declare-fun res!46628 () Bool)

(assert (=> d!24055 (=> (not res!46628) (not e!59731))))

(assert (=> d!24055 (= res!46628 (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun e!59727 () ListLongMap!1477)

(assert (=> d!24055 (= lt!44720 e!59727)))

(assert (=> d!24055 (= c!15181 (and (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24055 (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24055 (= (getCurrentListMap!437 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) lt!44730)))

(declare-fun b!91568 () Bool)

(assert (=> b!91568 (= e!59736 e!59732)))

(declare-fun res!46629 () Bool)

(assert (=> b!91568 (= res!46629 call!8948)))

(assert (=> b!91568 (=> (not res!46629) (not e!59732))))

(declare-fun b!91569 () Bool)

(assert (=> b!91569 (= e!59738 (not call!8944))))

(declare-fun b!91570 () Bool)

(declare-fun e!59729 () Bool)

(assert (=> b!91570 (= e!59730 e!59729)))

(declare-fun res!46623 () Bool)

(assert (=> b!91570 (=> (not res!46623) (not e!59729))))

(assert (=> b!91570 (= res!46623 (contains!772 lt!44730 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91570 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91571 () Bool)

(assert (=> b!91571 (= e!59729 (= (apply!87 lt!44730 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91571 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2203 (_values!2388 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> b!91571 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91572 () Bool)

(assert (=> b!91572 (= e!59727 (+!119 call!8947 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91573 () Bool)

(assert (=> b!91573 (= e!59736 (not call!8948))))

(declare-fun b!91574 () Bool)

(assert (=> b!91574 (= e!59733 call!8943)))

(declare-fun b!91575 () Bool)

(assert (=> b!91575 (= e!59727 e!59737)))

(assert (=> b!91575 (= c!15179 (and (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!24055 c!15181) b!91572))

(assert (= (and d!24055 (not c!15181)) b!91575))

(assert (= (and b!91575 c!15179) b!91556))

(assert (= (and b!91575 (not c!15179)) b!91557))

(assert (= (and b!91557 c!15177) b!91560))

(assert (= (and b!91557 (not c!15177)) b!91574))

(assert (= (or b!91560 b!91574) bm!8942))

(assert (= (or b!91556 bm!8942) bm!8944))

(assert (= (or b!91556 b!91560) bm!8945))

(assert (= (or b!91572 bm!8944) bm!8939))

(assert (= (or b!91572 bm!8945) bm!8943))

(assert (= (and d!24055 res!46628) b!91567))

(assert (= (and d!24055 c!15178) b!91566))

(assert (= (and d!24055 (not c!15178)) b!91558))

(assert (= (and d!24055 res!46627) b!91555))

(assert (= (and b!91555 res!46625) b!91559))

(assert (= (and b!91555 (not res!46630)) b!91570))

(assert (= (and b!91570 res!46623) b!91571))

(assert (= (and b!91555 res!46624) b!91564))

(assert (= (and b!91564 c!15180) b!91562))

(assert (= (and b!91564 (not c!15180)) b!91569))

(assert (= (and b!91562 res!46622) b!91561))

(assert (= (or b!91562 b!91569) bm!8941))

(assert (= (and b!91564 res!46626) b!91563))

(assert (= (and b!91563 c!15176) b!91568))

(assert (= (and b!91563 (not c!15176)) b!91573))

(assert (= (and b!91568 res!46629) b!91565))

(assert (= (or b!91568 b!91573) bm!8940))

(declare-fun b_lambda!4039 () Bool)

(assert (=> (not b_lambda!4039) (not b!91571)))

(assert (=> b!91571 t!5377))

(declare-fun b_and!5561 () Bool)

(assert (= b_and!5557 (and (=> t!5377 result!3073) b_and!5561)))

(assert (=> b!91571 t!5379))

(declare-fun b_and!5563 () Bool)

(assert (= b_and!5559 (and (=> t!5379 result!3077) b_and!5563)))

(assert (=> b!91559 m!97899))

(assert (=> b!91559 m!97899))

(declare-fun m!98217 () Bool)

(assert (=> b!91559 m!98217))

(declare-fun m!98219 () Bool)

(assert (=> bm!8941 m!98219))

(declare-fun m!98221 () Bool)

(assert (=> bm!8939 m!98221))

(declare-fun m!98223 () Bool)

(assert (=> b!91566 m!98223))

(declare-fun m!98225 () Bool)

(assert (=> b!91566 m!98225))

(declare-fun m!98227 () Bool)

(assert (=> b!91566 m!98227))

(assert (=> b!91566 m!98223))

(declare-fun m!98229 () Bool)

(assert (=> b!91566 m!98229))

(declare-fun m!98231 () Bool)

(assert (=> b!91566 m!98231))

(assert (=> b!91566 m!97899))

(declare-fun m!98233 () Bool)

(assert (=> b!91566 m!98233))

(declare-fun m!98235 () Bool)

(assert (=> b!91566 m!98235))

(assert (=> b!91566 m!98229))

(declare-fun m!98237 () Bool)

(assert (=> b!91566 m!98237))

(declare-fun m!98239 () Bool)

(assert (=> b!91566 m!98239))

(declare-fun m!98241 () Bool)

(assert (=> b!91566 m!98241))

(assert (=> b!91566 m!98231))

(declare-fun m!98243 () Bool)

(assert (=> b!91566 m!98243))

(declare-fun m!98245 () Bool)

(assert (=> b!91566 m!98245))

(assert (=> b!91566 m!98221))

(assert (=> b!91566 m!98245))

(declare-fun m!98247 () Bool)

(assert (=> b!91566 m!98247))

(declare-fun m!98249 () Bool)

(assert (=> b!91566 m!98249))

(declare-fun m!98251 () Bool)

(assert (=> b!91566 m!98251))

(assert (=> b!91567 m!97899))

(assert (=> b!91567 m!97899))

(assert (=> b!91567 m!98217))

(declare-fun m!98253 () Bool)

(assert (=> b!91565 m!98253))

(assert (=> b!91570 m!97899))

(assert (=> b!91570 m!97899))

(declare-fun m!98255 () Bool)

(assert (=> b!91570 m!98255))

(assert (=> b!91571 m!97923))

(assert (=> b!91571 m!97899))

(assert (=> b!91571 m!97921))

(assert (=> b!91571 m!97923))

(assert (=> b!91571 m!97925))

(assert (=> b!91571 m!97899))

(declare-fun m!98257 () Bool)

(assert (=> b!91571 m!98257))

(assert (=> b!91571 m!97921))

(assert (=> d!24055 m!98155))

(declare-fun m!98259 () Bool)

(assert (=> b!91572 m!98259))

(declare-fun m!98261 () Bool)

(assert (=> bm!8943 m!98261))

(declare-fun m!98263 () Bool)

(assert (=> bm!8940 m!98263))

(declare-fun m!98265 () Bool)

(assert (=> b!91561 m!98265))

(assert (=> b!91294 d!24055))

(declare-fun d!24057 () Bool)

(declare-fun e!59740 () Bool)

(assert (=> d!24057 e!59740))

(declare-fun res!46631 () Bool)

(assert (=> d!24057 (=> (not res!46631) (not e!59740))))

(declare-fun lt!44735 () ListLongMap!1477)

(assert (=> d!24057 (= res!46631 (contains!772 lt!44735 (_1!1139 lt!44489)))))

(declare-fun lt!44738 () List!1555)

(assert (=> d!24057 (= lt!44735 (ListLongMap!1478 lt!44738))))

(declare-fun lt!44737 () Unit!2718)

(declare-fun lt!44736 () Unit!2718)

(assert (=> d!24057 (= lt!44737 lt!44736)))

(assert (=> d!24057 (= (getValueByKey!143 lt!44738 (_1!1139 lt!44489)) (Some!148 (_2!1139 lt!44489)))))

(assert (=> d!24057 (= lt!44736 (lemmaContainsTupThenGetReturnValue!63 lt!44738 (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(assert (=> d!24057 (= lt!44738 (insertStrictlySorted!66 (toList!754 lt!44498) (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(assert (=> d!24057 (= (+!119 lt!44498 lt!44489) lt!44735)))

(declare-fun b!91576 () Bool)

(declare-fun res!46632 () Bool)

(assert (=> b!91576 (=> (not res!46632) (not e!59740))))

(assert (=> b!91576 (= res!46632 (= (getValueByKey!143 (toList!754 lt!44735) (_1!1139 lt!44489)) (Some!148 (_2!1139 lt!44489))))))

(declare-fun b!91577 () Bool)

(assert (=> b!91577 (= e!59740 (contains!773 (toList!754 lt!44735) lt!44489))))

(assert (= (and d!24057 res!46631) b!91576))

(assert (= (and b!91576 res!46632) b!91577))

(declare-fun m!98267 () Bool)

(assert (=> d!24057 m!98267))

(declare-fun m!98269 () Bool)

(assert (=> d!24057 m!98269))

(declare-fun m!98271 () Bool)

(assert (=> d!24057 m!98271))

(declare-fun m!98273 () Bool)

(assert (=> d!24057 m!98273))

(declare-fun m!98275 () Bool)

(assert (=> b!91576 m!98275))

(declare-fun m!98277 () Bool)

(assert (=> b!91577 m!98277))

(assert (=> b!91294 d!24057))

(declare-fun d!24059 () Bool)

(declare-fun e!59741 () Bool)

(assert (=> d!24059 e!59741))

(declare-fun res!46633 () Bool)

(assert (=> d!24059 (=> (not res!46633) (not e!59741))))

(declare-fun lt!44739 () ListLongMap!1477)

(assert (=> d!24059 (= res!46633 (contains!772 lt!44739 (_1!1139 lt!44495)))))

(declare-fun lt!44742 () List!1555)

(assert (=> d!24059 (= lt!44739 (ListLongMap!1478 lt!44742))))

(declare-fun lt!44741 () Unit!2718)

(declare-fun lt!44740 () Unit!2718)

(assert (=> d!24059 (= lt!44741 lt!44740)))

(assert (=> d!24059 (= (getValueByKey!143 lt!44742 (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495)))))

(assert (=> d!24059 (= lt!44740 (lemmaContainsTupThenGetReturnValue!63 lt!44742 (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(assert (=> d!24059 (= lt!44742 (insertStrictlySorted!66 (toList!754 (+!119 lt!44498 lt!44489)) (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(assert (=> d!24059 (= (+!119 (+!119 lt!44498 lt!44489) lt!44495) lt!44739)))

(declare-fun b!91578 () Bool)

(declare-fun res!46634 () Bool)

(assert (=> b!91578 (=> (not res!46634) (not e!59741))))

(assert (=> b!91578 (= res!46634 (= (getValueByKey!143 (toList!754 lt!44739) (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495))))))

(declare-fun b!91579 () Bool)

(assert (=> b!91579 (= e!59741 (contains!773 (toList!754 lt!44739) lt!44495))))

(assert (= (and d!24059 res!46633) b!91578))

(assert (= (and b!91578 res!46634) b!91579))

(declare-fun m!98279 () Bool)

(assert (=> d!24059 m!98279))

(declare-fun m!98281 () Bool)

(assert (=> d!24059 m!98281))

(declare-fun m!98283 () Bool)

(assert (=> d!24059 m!98283))

(declare-fun m!98285 () Bool)

(assert (=> d!24059 m!98285))

(declare-fun m!98287 () Bool)

(assert (=> b!91578 m!98287))

(declare-fun m!98289 () Bool)

(assert (=> b!91579 m!98289))

(assert (=> b!91294 d!24059))

(declare-fun d!24061 () Bool)

(declare-fun e!59742 () Bool)

(assert (=> d!24061 e!59742))

(declare-fun res!46635 () Bool)

(assert (=> d!24061 (=> (not res!46635) (not e!59742))))

(declare-fun lt!44743 () ListLongMap!1477)

(assert (=> d!24061 (= res!46635 (contains!772 lt!44743 (_1!1139 lt!44492)))))

(declare-fun lt!44746 () List!1555)

(assert (=> d!24061 (= lt!44743 (ListLongMap!1478 lt!44746))))

(declare-fun lt!44745 () Unit!2718)

(declare-fun lt!44744 () Unit!2718)

(assert (=> d!24061 (= lt!44745 lt!44744)))

(assert (=> d!24061 (= (getValueByKey!143 lt!44746 (_1!1139 lt!44492)) (Some!148 (_2!1139 lt!44492)))))

(assert (=> d!24061 (= lt!44744 (lemmaContainsTupThenGetReturnValue!63 lt!44746 (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(assert (=> d!24061 (= lt!44746 (insertStrictlySorted!66 (toList!754 lt!44497) (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(assert (=> d!24061 (= (+!119 lt!44497 lt!44492) lt!44743)))

(declare-fun b!91580 () Bool)

(declare-fun res!46636 () Bool)

(assert (=> b!91580 (=> (not res!46636) (not e!59742))))

(assert (=> b!91580 (= res!46636 (= (getValueByKey!143 (toList!754 lt!44743) (_1!1139 lt!44492)) (Some!148 (_2!1139 lt!44492))))))

(declare-fun b!91581 () Bool)

(assert (=> b!91581 (= e!59742 (contains!773 (toList!754 lt!44743) lt!44492))))

(assert (= (and d!24061 res!46635) b!91580))

(assert (= (and b!91580 res!46636) b!91581))

(declare-fun m!98291 () Bool)

(assert (=> d!24061 m!98291))

(declare-fun m!98293 () Bool)

(assert (=> d!24061 m!98293))

(declare-fun m!98295 () Bool)

(assert (=> d!24061 m!98295))

(declare-fun m!98297 () Bool)

(assert (=> d!24061 m!98297))

(declare-fun m!98299 () Bool)

(assert (=> b!91580 m!98299))

(declare-fun m!98301 () Bool)

(assert (=> b!91581 m!98301))

(assert (=> b!91294 d!24061))

(declare-fun d!24063 () Bool)

(assert (=> d!24063 (= (+!119 (+!119 lt!44485 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (+!119 (+!119 lt!44485 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(declare-fun lt!44749 () Unit!2718)

(declare-fun choose!550 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64) V!3089) Unit!2718)

(assert (=> d!24063 (= lt!44749 (choose!550 lt!44485 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(assert (=> d!24063 (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24063 (= (addCommutativeForDiffKeys!38 lt!44485 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) lt!44749)))

(declare-fun bs!3794 () Bool)

(assert (= bs!3794 d!24063))

(declare-fun m!98303 () Bool)

(assert (=> bs!3794 m!98303))

(declare-fun m!98305 () Bool)

(assert (=> bs!3794 m!98305))

(declare-fun m!98307 () Bool)

(assert (=> bs!3794 m!98307))

(declare-fun m!98309 () Bool)

(assert (=> bs!3794 m!98309))

(assert (=> bs!3794 m!97899))

(declare-fun m!98311 () Bool)

(assert (=> bs!3794 m!98311))

(assert (=> bs!3794 m!98307))

(assert (=> bs!3794 m!98303))

(assert (=> b!91294 d!24063))

(declare-fun d!24065 () Bool)

(assert (=> d!24065 (= (+!119 (+!119 lt!44498 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (+!119 (+!119 lt!44498 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(declare-fun lt!44750 () Unit!2718)

(assert (=> d!24065 (= lt!44750 (choose!550 lt!44498 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))

(assert (=> d!24065 (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24065 (= (addCommutativeForDiffKeys!38 lt!44498 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))) lt!44750)))

(declare-fun bs!3795 () Bool)

(assert (= bs!3795 d!24065))

(declare-fun m!98313 () Bool)

(assert (=> bs!3795 m!98313))

(declare-fun m!98315 () Bool)

(assert (=> bs!3795 m!98315))

(declare-fun m!98317 () Bool)

(assert (=> bs!3795 m!98317))

(declare-fun m!98319 () Bool)

(assert (=> bs!3795 m!98319))

(assert (=> bs!3795 m!97899))

(declare-fun m!98321 () Bool)

(assert (=> bs!3795 m!98321))

(assert (=> bs!3795 m!98317))

(assert (=> bs!3795 m!98313))

(assert (=> b!91294 d!24065))

(declare-fun d!24067 () Bool)

(declare-fun e!59743 () Bool)

(assert (=> d!24067 e!59743))

(declare-fun res!46637 () Bool)

(assert (=> d!24067 (=> (not res!46637) (not e!59743))))

(declare-fun lt!44751 () ListLongMap!1477)

(assert (=> d!24067 (= res!46637 (contains!772 lt!44751 (_1!1139 lt!44492)))))

(declare-fun lt!44754 () List!1555)

(assert (=> d!24067 (= lt!44751 (ListLongMap!1478 lt!44754))))

(declare-fun lt!44753 () Unit!2718)

(declare-fun lt!44752 () Unit!2718)

(assert (=> d!24067 (= lt!44753 lt!44752)))

(assert (=> d!24067 (= (getValueByKey!143 lt!44754 (_1!1139 lt!44492)) (Some!148 (_2!1139 lt!44492)))))

(assert (=> d!24067 (= lt!44752 (lemmaContainsTupThenGetReturnValue!63 lt!44754 (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(assert (=> d!24067 (= lt!44754 (insertStrictlySorted!66 (toList!754 lt!44485) (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(assert (=> d!24067 (= (+!119 lt!44485 lt!44492) lt!44751)))

(declare-fun b!91582 () Bool)

(declare-fun res!46638 () Bool)

(assert (=> b!91582 (=> (not res!46638) (not e!59743))))

(assert (=> b!91582 (= res!46638 (= (getValueByKey!143 (toList!754 lt!44751) (_1!1139 lt!44492)) (Some!148 (_2!1139 lt!44492))))))

(declare-fun b!91583 () Bool)

(assert (=> b!91583 (= e!59743 (contains!773 (toList!754 lt!44751) lt!44492))))

(assert (= (and d!24067 res!46637) b!91582))

(assert (= (and b!91582 res!46638) b!91583))

(declare-fun m!98323 () Bool)

(assert (=> d!24067 m!98323))

(declare-fun m!98325 () Bool)

(assert (=> d!24067 m!98325))

(declare-fun m!98327 () Bool)

(assert (=> d!24067 m!98327))

(declare-fun m!98329 () Bool)

(assert (=> d!24067 m!98329))

(declare-fun m!98331 () Bool)

(assert (=> b!91582 m!98331))

(declare-fun m!98333 () Bool)

(assert (=> b!91583 m!98333))

(assert (=> b!91294 d!24067))

(declare-fun d!24069 () Bool)

(assert (=> d!24069 (= (map!1213 (_2!1138 lt!44500)) (getCurrentListMap!437 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))))))

(declare-fun bs!3796 () Bool)

(assert (= bs!3796 d!24069))

(declare-fun m!98335 () Bool)

(assert (=> bs!3796 m!98335))

(assert (=> b!91294 d!24069))

(declare-fun d!24071 () Bool)

(declare-fun e!59744 () Bool)

(assert (=> d!24071 e!59744))

(declare-fun res!46639 () Bool)

(assert (=> d!24071 (=> (not res!46639) (not e!59744))))

(declare-fun lt!44755 () ListLongMap!1477)

(assert (=> d!24071 (= res!46639 (contains!772 lt!44755 (_1!1139 lt!44495)))))

(declare-fun lt!44758 () List!1555)

(assert (=> d!24071 (= lt!44755 (ListLongMap!1478 lt!44758))))

(declare-fun lt!44757 () Unit!2718)

(declare-fun lt!44756 () Unit!2718)

(assert (=> d!24071 (= lt!44757 lt!44756)))

(assert (=> d!24071 (= (getValueByKey!143 lt!44758 (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495)))))

(assert (=> d!24071 (= lt!44756 (lemmaContainsTupThenGetReturnValue!63 lt!44758 (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(assert (=> d!24071 (= lt!44758 (insertStrictlySorted!66 (toList!754 lt!44498) (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(assert (=> d!24071 (= (+!119 lt!44498 lt!44495) lt!44755)))

(declare-fun b!91584 () Bool)

(declare-fun res!46640 () Bool)

(assert (=> b!91584 (=> (not res!46640) (not e!59744))))

(assert (=> b!91584 (= res!46640 (= (getValueByKey!143 (toList!754 lt!44755) (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495))))))

(declare-fun b!91585 () Bool)

(assert (=> b!91585 (= e!59744 (contains!773 (toList!754 lt!44755) lt!44495))))

(assert (= (and d!24071 res!46639) b!91584))

(assert (= (and b!91584 res!46640) b!91585))

(declare-fun m!98337 () Bool)

(assert (=> d!24071 m!98337))

(declare-fun m!98339 () Bool)

(assert (=> d!24071 m!98339))

(declare-fun m!98341 () Bool)

(assert (=> d!24071 m!98341))

(declare-fun m!98343 () Bool)

(assert (=> d!24071 m!98343))

(declare-fun m!98345 () Bool)

(assert (=> b!91584 m!98345))

(declare-fun m!98347 () Bool)

(assert (=> b!91585 m!98347))

(assert (=> b!91294 d!24071))

(declare-fun d!24073 () Bool)

(assert (=> d!24073 (not (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44761 () Unit!2718)

(declare-fun choose!68 (array!4111 (_ BitVec 32) (_ BitVec 64) List!1556) Unit!2718)

(assert (=> d!24073 (= lt!44761 (choose!68 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553)))))

(assert (=> d!24073 (bvslt (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24073 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553)) lt!44761)))

(declare-fun bs!3797 () Bool)

(assert (= bs!3797 d!24073))

(assert (=> bs!3797 m!97899))

(assert (=> bs!3797 m!97903))

(assert (=> bs!3797 m!97899))

(declare-fun m!98349 () Bool)

(assert (=> bs!3797 m!98349))

(assert (=> b!91290 d!24073))

(declare-fun d!24075 () Bool)

(assert (=> d!24075 (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) from!355 Nil!1553)))

(declare-fun lt!44764 () Unit!2718)

(declare-fun choose!39 (array!4111 (_ BitVec 32) (_ BitVec 32)) Unit!2718)

(assert (=> d!24075 (= lt!44764 (choose!39 (_keys!4084 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24075 (bvslt (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24075 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000000 from!355) lt!44764)))

(declare-fun bs!3798 () Bool)

(assert (= bs!3798 d!24075))

(assert (=> bs!3798 m!97897))

(declare-fun m!98351 () Bool)

(assert (=> bs!3798 m!98351))

(assert (=> b!91290 d!24075))

(declare-fun d!24077 () Bool)

(declare-fun res!46645 () Bool)

(declare-fun e!59749 () Bool)

(assert (=> d!24077 (=> res!46645 e!59749)))

(assert (=> d!24077 (= res!46645 (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24077 (= (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!59749)))

(declare-fun b!91590 () Bool)

(declare-fun e!59750 () Bool)

(assert (=> b!91590 (= e!59749 e!59750)))

(declare-fun res!46646 () Bool)

(assert (=> b!91590 (=> (not res!46646) (not e!59750))))

(assert (=> b!91590 (= res!46646 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91591 () Bool)

(assert (=> b!91591 (= e!59750 (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24077 (not res!46645)) b!91590))

(assert (= (and b!91590 res!46646) b!91591))

(assert (=> d!24077 m!98109))

(assert (=> b!91591 m!97899))

(declare-fun m!98353 () Bool)

(assert (=> b!91591 m!98353))

(assert (=> b!91290 d!24077))

(declare-fun d!24079 () Bool)

(declare-fun e!59753 () Bool)

(assert (=> d!24079 e!59753))

(declare-fun c!15184 () Bool)

(assert (=> d!24079 (= c!15184 (and (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44767 () Unit!2718)

(declare-fun choose!551 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) (_ BitVec 32) Int) Unit!2718)

(assert (=> d!24079 (= lt!44767 (choose!551 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(assert (=> d!24079 (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24079 (= (lemmaListMapContainsThenArrayContainsFrom!82 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) lt!44767)))

(declare-fun b!91596 () Bool)

(assert (=> b!91596 (= e!59753 (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!91597 () Bool)

(assert (=> b!91597 (= e!59753 (ite (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24079 c!15184) b!91596))

(assert (= (and d!24079 (not c!15184)) b!91597))

(assert (=> d!24079 m!97899))

(declare-fun m!98355 () Bool)

(assert (=> d!24079 m!98355))

(assert (=> d!24079 m!98155))

(assert (=> b!91596 m!97899))

(assert (=> b!91596 m!97903))

(assert (=> b!91290 d!24079))

(declare-fun b!91608 () Bool)

(declare-fun e!59764 () Bool)

(declare-fun call!8951 () Bool)

(assert (=> b!91608 (= e!59764 call!8951)))

(declare-fun b!91609 () Bool)

(assert (=> b!91609 (= e!59764 call!8951)))

(declare-fun c!15187 () Bool)

(declare-fun bm!8948 () Bool)

(assert (=> bm!8948 (= call!8951 (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15187 (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553) Nil!1553)))))

(declare-fun b!91610 () Bool)

(declare-fun e!59763 () Bool)

(declare-fun e!59762 () Bool)

(assert (=> b!91610 (= e!59763 e!59762)))

(declare-fun res!46653 () Bool)

(assert (=> b!91610 (=> (not res!46653) (not e!59762))))

(declare-fun e!59765 () Bool)

(assert (=> b!91610 (= res!46653 (not e!59765))))

(declare-fun res!46655 () Bool)

(assert (=> b!91610 (=> (not res!46655) (not e!59765))))

(assert (=> b!91610 (= res!46655 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91612 () Bool)

(assert (=> b!91612 (= e!59762 e!59764)))

(assert (=> b!91612 (= c!15187 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun d!24081 () Bool)

(declare-fun res!46654 () Bool)

(assert (=> d!24081 (=> res!46654 e!59763)))

(assert (=> d!24081 (= res!46654 (bvsge from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> d!24081 (= (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) from!355 Nil!1553) e!59763)))

(declare-fun b!91611 () Bool)

(declare-fun contains!774 (List!1556 (_ BitVec 64)) Bool)

(assert (=> b!91611 (= e!59765 (contains!774 Nil!1553 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (= (and d!24081 (not res!46654)) b!91610))

(assert (= (and b!91610 res!46655) b!91611))

(assert (= (and b!91610 res!46653) b!91612))

(assert (= (and b!91612 c!15187) b!91608))

(assert (= (and b!91612 (not c!15187)) b!91609))

(assert (= (or b!91608 b!91609) bm!8948))

(assert (=> bm!8948 m!97899))

(declare-fun m!98357 () Bool)

(assert (=> bm!8948 m!98357))

(assert (=> b!91610 m!97899))

(assert (=> b!91610 m!97899))

(assert (=> b!91610 m!98217))

(assert (=> b!91612 m!97899))

(assert (=> b!91612 m!97899))

(assert (=> b!91612 m!98217))

(assert (=> b!91611 m!97899))

(assert (=> b!91611 m!97899))

(declare-fun m!98359 () Bool)

(assert (=> b!91611 m!98359))

(assert (=> b!91290 d!24081))

(declare-fun d!24083 () Bool)

(assert (=> d!24083 (= (array_inv!1223 (_keys!4084 newMap!16)) (bvsge (size!2202 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91288 d!24083))

(declare-fun d!24085 () Bool)

(assert (=> d!24085 (= (array_inv!1224 (_values!2388 newMap!16)) (bvsge (size!2203 (_values!2388 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91288 d!24085))

(declare-fun d!24087 () Bool)

(declare-fun c!15190 () Bool)

(assert (=> d!24087 (= c!15190 ((_ is ValueCellFull!947) (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun e!59768 () V!3089)

(assert (=> d!24087 (= (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59768)))

(declare-fun b!91617 () Bool)

(declare-fun get!1242 (ValueCell!947 V!3089) V!3089)

(assert (=> b!91617 (= e!59768 (get!1242 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91618 () Bool)

(declare-fun get!1243 (ValueCell!947 V!3089) V!3089)

(assert (=> b!91618 (= e!59768 (get!1243 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24087 c!15190) b!91617))

(assert (= (and d!24087 (not c!15190)) b!91618))

(assert (=> b!91617 m!97921))

(assert (=> b!91617 m!97923))

(declare-fun m!98361 () Bool)

(assert (=> b!91617 m!98361))

(assert (=> b!91618 m!97921))

(assert (=> b!91618 m!97923))

(declare-fun m!98363 () Bool)

(assert (=> b!91618 m!98363))

(assert (=> b!91283 d!24087))

(declare-fun d!24089 () Bool)

(assert (=> d!24089 (= (array_inv!1223 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvsge (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!91293 d!24089))

(declare-fun d!24091 () Bool)

(assert (=> d!24091 (= (array_inv!1224 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvsge (size!2203 (_values!2388 (v!2713 (underlying!308 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!91293 d!24091))

(declare-fun d!24093 () Bool)

(declare-fun e!59773 () Bool)

(assert (=> d!24093 e!59773))

(declare-fun res!46658 () Bool)

(assert (=> d!24093 (=> res!46658 e!59773)))

(declare-fun lt!44779 () Bool)

(assert (=> d!24093 (= res!46658 (not lt!44779))))

(declare-fun lt!44777 () Bool)

(assert (=> d!24093 (= lt!44779 lt!44777)))

(declare-fun lt!44778 () Unit!2718)

(declare-fun e!59774 () Unit!2718)

(assert (=> d!24093 (= lt!44778 e!59774)))

(declare-fun c!15193 () Bool)

(assert (=> d!24093 (= c!15193 lt!44777)))

(declare-fun containsKey!147 (List!1555 (_ BitVec 64)) Bool)

(assert (=> d!24093 (= lt!44777 (containsKey!147 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24093 (= (contains!772 lt!44488 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) lt!44779)))

(declare-fun b!91625 () Bool)

(declare-fun lt!44776 () Unit!2718)

(assert (=> b!91625 (= e!59774 lt!44776)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!96 (List!1555 (_ BitVec 64)) Unit!2718)

(assert (=> b!91625 (= lt!44776 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun isDefined!97 (Option!149) Bool)

(assert (=> b!91625 (isDefined!97 (getValueByKey!143 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91626 () Bool)

(declare-fun Unit!2727 () Unit!2718)

(assert (=> b!91626 (= e!59774 Unit!2727)))

(declare-fun b!91627 () Bool)

(assert (=> b!91627 (= e!59773 (isDefined!97 (getValueByKey!143 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(assert (= (and d!24093 c!15193) b!91625))

(assert (= (and d!24093 (not c!15193)) b!91626))

(assert (= (and d!24093 (not res!46658)) b!91627))

(assert (=> d!24093 m!97899))

(declare-fun m!98365 () Bool)

(assert (=> d!24093 m!98365))

(assert (=> b!91625 m!97899))

(declare-fun m!98367 () Bool)

(assert (=> b!91625 m!98367))

(assert (=> b!91625 m!97899))

(declare-fun m!98369 () Bool)

(assert (=> b!91625 m!98369))

(assert (=> b!91625 m!98369))

(declare-fun m!98371 () Bool)

(assert (=> b!91625 m!98371))

(assert (=> b!91627 m!97899))

(assert (=> b!91627 m!98369))

(assert (=> b!91627 m!98369))

(assert (=> b!91627 m!98371))

(assert (=> b!91296 d!24093))

(declare-fun b!91712 () Bool)

(declare-fun res!46699 () Bool)

(declare-datatypes ((SeekEntryResult!251 0))(
  ( (MissingZero!251 (index!3144 (_ BitVec 32))) (Found!251 (index!3145 (_ BitVec 32))) (Intermediate!251 (undefined!1063 Bool) (index!3146 (_ BitVec 32)) (x!12449 (_ BitVec 32))) (Undefined!251) (MissingVacant!251 (index!3147 (_ BitVec 32))) )
))
(declare-fun lt!44852 () SeekEntryResult!251)

(assert (=> b!91712 (= res!46699 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3147 lt!44852)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!59827 () Bool)

(assert (=> b!91712 (=> (not res!46699) (not e!59827))))

(declare-fun b!91713 () Bool)

(declare-fun e!59834 () ListLongMap!1477)

(declare-fun call!9007 () ListLongMap!1477)

(assert (=> b!91713 (= e!59834 call!9007)))

(declare-fun b!91714 () Bool)

(declare-fun e!59838 () Unit!2718)

(declare-fun Unit!2728 () Unit!2718)

(assert (=> b!91714 (= e!59838 Unit!2728)))

(declare-fun lt!44851 () Unit!2718)

(declare-fun call!9013 () Unit!2718)

(assert (=> b!91714 (= lt!44851 call!9013)))

(declare-fun lt!44834 () SeekEntryResult!251)

(declare-fun call!9011 () SeekEntryResult!251)

(assert (=> b!91714 (= lt!44834 call!9011)))

(declare-fun res!46695 () Bool)

(assert (=> b!91714 (= res!46695 ((_ is Found!251) lt!44834))))

(declare-fun e!59828 () Bool)

(assert (=> b!91714 (=> (not res!46695) (not e!59828))))

(assert (=> b!91714 e!59828))

(declare-fun lt!44860 () Unit!2718)

(assert (=> b!91714 (= lt!44860 lt!44851)))

(assert (=> b!91714 false))

(declare-fun lt!44850 () SeekEntryResult!251)

(declare-fun e!59819 () Bool)

(declare-fun b!91715 () Bool)

(assert (=> b!91715 (= e!59819 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44850)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91716 () Bool)

(declare-fun c!15233 () Bool)

(declare-fun lt!44841 () SeekEntryResult!251)

(assert (=> b!91716 (= c!15233 ((_ is MissingVacant!251) lt!44841))))

(declare-fun e!59830 () tuple2!2254)

(declare-fun e!59833 () tuple2!2254)

(assert (=> b!91716 (= e!59830 e!59833)))

(declare-fun b!91717 () Bool)

(declare-fun e!59826 () Bool)

(declare-fun e!59837 () Bool)

(assert (=> b!91717 (= e!59826 e!59837)))

(declare-fun res!46692 () Bool)

(declare-fun call!9022 () ListLongMap!1477)

(assert (=> b!91717 (= res!46692 (contains!772 call!9022 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91717 (=> (not res!46692) (not e!59837))))

(declare-fun b!91718 () Bool)

(declare-fun e!59821 () Bool)

(declare-fun e!59822 () Bool)

(assert (=> b!91718 (= e!59821 e!59822)))

(declare-fun res!46698 () Bool)

(declare-fun call!9014 () Bool)

(assert (=> b!91718 (= res!46698 call!9014)))

(assert (=> b!91718 (=> (not res!46698) (not e!59822))))

(declare-fun b!91719 () Bool)

(declare-fun e!59839 () Bool)

(assert (=> b!91719 (= e!59839 e!59827)))

(declare-fun res!46688 () Bool)

(declare-fun call!9018 () Bool)

(assert (=> b!91719 (= res!46688 call!9018)))

(assert (=> b!91719 (=> (not res!46688) (not e!59827))))

(declare-fun b!91720 () Bool)

(assert (=> b!91720 (= e!59828 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44834)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun bm!8997 () Bool)

(declare-fun call!9008 () Bool)

(declare-fun call!9005 () Bool)

(assert (=> bm!8997 (= call!9008 call!9005)))

(declare-fun bm!8998 () Bool)

(declare-fun call!9015 () SeekEntryResult!251)

(assert (=> bm!8998 (= call!9011 call!9015)))

(declare-fun b!91721 () Bool)

(declare-fun lt!44845 () Unit!2718)

(assert (=> b!91721 (= lt!44845 e!59838)))

(declare-fun c!15235 () Bool)

(declare-fun call!9006 () Bool)

(assert (=> b!91721 (= c!15235 call!9006)))

(assert (=> b!91721 (= e!59830 (tuple2!2255 false newMap!16))))

(declare-fun b!91722 () Bool)

(declare-fun c!15229 () Bool)

(assert (=> b!91722 (= c!15229 ((_ is MissingVacant!251) lt!44852))))

(declare-fun e!59824 () Bool)

(assert (=> b!91722 (= e!59824 e!59839)))

(declare-fun bm!8999 () Bool)

(declare-fun call!9016 () Bool)

(assert (=> bm!8999 (= call!9016 call!9005)))

(declare-fun bm!9000 () Bool)

(declare-fun call!9020 () tuple2!2254)

(declare-fun updateHelperNewKey!36 (LongMapFixedSize!802 (_ BitVec 64) V!3089 (_ BitVec 32)) tuple2!2254)

(assert (=> bm!9000 (= call!9020 (updateHelperNewKey!36 newMap!16 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841))))))

(declare-fun bm!9001 () Bool)

(declare-fun call!9023 () Bool)

(assert (=> bm!9001 (= call!9018 call!9023)))

(declare-fun b!91723 () Bool)

(declare-fun lt!44839 () tuple2!2254)

(assert (=> b!91723 (= e!59833 (tuple2!2255 (_1!1138 lt!44839) (_2!1138 lt!44839)))))

(assert (=> b!91723 (= lt!44839 call!9020)))

(declare-fun bm!9002 () Bool)

(declare-fun call!9012 () Bool)

(assert (=> bm!9002 (= call!9023 call!9012)))

(declare-fun bm!9003 () Bool)

(declare-fun call!9000 () ListLongMap!1477)

(declare-fun call!9002 () ListLongMap!1477)

(assert (=> bm!9003 (= call!9000 call!9002)))

(declare-fun b!91724 () Bool)

(declare-fun e!59820 () Bool)

(assert (=> b!91724 (= e!59820 (not call!9016))))

(declare-fun b!91725 () Bool)

(declare-fun e!59832 () Unit!2718)

(declare-fun lt!44836 () Unit!2718)

(assert (=> b!91725 (= e!59832 lt!44836)))

(assert (=> b!91725 (= lt!44836 call!9013)))

(declare-fun call!9001 () SeekEntryResult!251)

(assert (=> b!91725 (= lt!44850 call!9001)))

(declare-fun res!46689 () Bool)

(assert (=> b!91725 (= res!46689 ((_ is Found!251) lt!44850))))

(assert (=> b!91725 (=> (not res!46689) (not e!59819))))

(assert (=> b!91725 e!59819))

(declare-fun b!91726 () Bool)

(assert (=> b!91726 (= e!59834 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun c!15224 () Bool)

(declare-fun bm!9004 () Bool)

(declare-fun call!9017 () ListLongMap!1477)

(declare-fun c!15230 () Bool)

(assert (=> bm!9004 (= call!9017 (getCurrentListMap!437 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun bm!9005 () Bool)

(declare-fun call!9004 () Bool)

(assert (=> bm!9005 (= call!9004 call!9012)))

(declare-fun b!91727 () Bool)

(declare-fun e!59831 () Bool)

(assert (=> b!91727 (= e!59831 (not call!9008))))

(declare-fun bm!9006 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2718)

(assert (=> bm!9006 (= call!9013 (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(declare-fun c!15232 () Bool)

(declare-fun lt!44842 () array!4113)

(declare-fun call!9019 () ListLongMap!1477)

(declare-fun bm!9007 () Bool)

(declare-fun lt!44856 () (_ BitVec 32))

(declare-fun lt!44843 () (_ BitVec 32))

(assert (=> bm!9007 (= call!9019 (getCurrentListMap!437 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!91728 () Bool)

(assert (=> b!91728 (= e!59827 (not call!9016))))

(declare-fun b!91729 () Bool)

(declare-fun lt!44855 () Unit!2718)

(declare-fun lt!44853 () Unit!2718)

(assert (=> b!91729 (= lt!44855 lt!44853)))

(assert (=> b!91729 (contains!772 call!9019 (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!95 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) Unit!2718)

(assert (=> b!91729 (= lt!44853 (lemmaValidKeyInArrayIsInListMap!95 (_keys!4084 newMap!16) lt!44842 (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3145 lt!44841) (defaultEntry!2405 newMap!16)))))

(assert (=> b!91729 (= lt!44842 (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))))))

(declare-fun lt!44848 () Unit!2718)

(declare-fun lt!44840 () Unit!2718)

(assert (=> b!91729 (= lt!44848 lt!44840)))

(assert (=> b!91729 (= call!9002 call!9007)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) (_ BitVec 64) V!3089 Int) Unit!2718)

(assert (=> b!91729 (= lt!44840 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3145 lt!44841) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44857 () Unit!2718)

(assert (=> b!91729 (= lt!44857 e!59832)))

(declare-fun c!15234 () Bool)

(assert (=> b!91729 (= c!15234 call!9006)))

(declare-fun e!59829 () tuple2!2254)

(assert (=> b!91729 (= e!59829 (tuple2!2255 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (_size!450 newMap!16) (_keys!4084 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))) (_vacant!450 newMap!16))))))

(declare-fun b!91730 () Bool)

(declare-fun res!46694 () Bool)

(declare-fun lt!44859 () SeekEntryResult!251)

(assert (=> b!91730 (= res!46694 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3147 lt!44859)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91730 (=> (not res!46694) (not e!59822))))

(declare-fun b!91731 () Bool)

(declare-fun lt!44849 () Unit!2718)

(assert (=> b!91731 (= e!59838 lt!44849)))

(declare-fun call!9003 () Unit!2718)

(assert (=> b!91731 (= lt!44849 call!9003)))

(assert (=> b!91731 (= lt!44852 call!9011)))

(declare-fun c!15225 () Bool)

(assert (=> b!91731 (= c!15225 ((_ is MissingZero!251) lt!44852))))

(assert (=> b!91731 e!59824))

(declare-fun b!91732 () Bool)

(assert (=> b!91732 (= e!59821 ((_ is Undefined!251) lt!44859))))

(declare-fun b!91733 () Bool)

(declare-fun res!46700 () Bool)

(assert (=> b!91733 (=> (not res!46700) (not e!59831))))

(assert (=> b!91733 (= res!46700 call!9014)))

(declare-fun e!59835 () Bool)

(assert (=> b!91733 (= e!59835 e!59831)))

(declare-fun bm!9008 () Bool)

(assert (=> bm!9008 (= call!9001 call!9015)))

(declare-fun b!91734 () Bool)

(declare-fun e!59825 () ListLongMap!1477)

(declare-fun call!9009 () ListLongMap!1477)

(assert (=> b!91734 (= e!59825 call!9009)))

(declare-fun b!91735 () Bool)

(declare-fun e!59823 () Bool)

(assert (=> b!91735 (= e!59823 e!59826)))

(declare-fun c!15223 () Bool)

(declare-fun lt!44835 () tuple2!2254)

(assert (=> b!91735 (= c!15223 (_1!1138 lt!44835))))

(declare-fun bm!9009 () Bool)

(assert (=> bm!9009 (= call!9005 (arrayContainsKey!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!91736 () Bool)

(declare-fun res!46696 () Bool)

(assert (=> b!91736 (=> (not res!46696) (not e!59831))))

(assert (=> b!91736 (= res!46696 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3144 lt!44859)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91737 () Bool)

(declare-fun res!46691 () Bool)

(assert (=> b!91737 (=> (not res!46691) (not e!59820))))

(assert (=> b!91737 (= res!46691 call!9018)))

(assert (=> b!91737 (= e!59824 e!59820)))

(declare-fun b!91738 () Bool)

(assert (=> b!91738 (= e!59825 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun bm!9010 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2718)

(assert (=> bm!9010 (= call!9003 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(declare-fun b!91739 () Bool)

(declare-fun res!46690 () Bool)

(assert (=> b!91739 (= res!46690 call!9023)))

(assert (=> b!91739 (=> (not res!46690) (not e!59828))))

(declare-fun c!15228 () Bool)

(declare-fun bm!9011 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9011 (= call!9012 (inRange!0 (ite c!15224 (ite c!15235 (index!3145 lt!44834) (ite c!15225 (index!3144 lt!44852) (index!3147 lt!44852))) (ite c!15234 (index!3145 lt!44850) (ite c!15228 (index!3144 lt!44859) (index!3147 lt!44859)))) (mask!6464 newMap!16)))))

(declare-fun d!24095 () Bool)

(assert (=> d!24095 e!59823))

(declare-fun res!46687 () Bool)

(assert (=> d!24095 (=> (not res!46687) (not e!59823))))

(assert (=> d!24095 (= res!46687 (valid!362 (_2!1138 lt!44835)))))

(declare-fun e!59836 () tuple2!2254)

(assert (=> d!24095 (= lt!44835 e!59836)))

(assert (=> d!24095 (= c!15230 (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvneg (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(assert (=> d!24095 (valid!362 newMap!16)))

(assert (=> d!24095 (= (update!132 newMap!16 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490) lt!44835)))

(declare-fun bm!9012 () Bool)

(assert (=> bm!9012 (= call!9002 (+!119 e!59825 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun c!15227 () Bool)

(assert (=> bm!9012 (= c!15227 c!15230)))

(declare-fun b!91740 () Bool)

(declare-fun e!59840 () tuple2!2254)

(assert (=> b!91740 (= e!59836 e!59840)))

(assert (=> b!91740 (= c!15232 (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9013 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4111 (_ BitVec 32)) SeekEntryResult!251)

(assert (=> bm!9013 (= call!9015 (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(declare-fun b!91741 () Bool)

(declare-fun res!46697 () Bool)

(assert (=> b!91741 (= res!46697 call!9004)))

(assert (=> b!91741 (=> (not res!46697) (not e!59819))))

(declare-fun b!91742 () Bool)

(assert (=> b!91742 (= e!59833 e!59829)))

(declare-fun c!15231 () Bool)

(assert (=> b!91742 (= c!15231 ((_ is MissingZero!251) lt!44841))))

(declare-fun b!91743 () Bool)

(declare-fun Unit!2729 () Unit!2718)

(assert (=> b!91743 (= e!59832 Unit!2729)))

(declare-fun lt!44837 () Unit!2718)

(assert (=> b!91743 (= lt!44837 call!9003)))

(assert (=> b!91743 (= lt!44859 call!9001)))

(assert (=> b!91743 (= c!15228 ((_ is MissingZero!251) lt!44859))))

(assert (=> b!91743 e!59835))

(declare-fun lt!44846 () Unit!2718)

(assert (=> b!91743 (= lt!44846 lt!44837)))

(assert (=> b!91743 false))

(declare-fun b!91744 () Bool)

(assert (=> b!91744 (= e!59822 (not call!9008))))

(declare-fun b!91745 () Bool)

(declare-fun call!9010 () ListLongMap!1477)

(assert (=> b!91745 (= e!59826 (= call!9022 call!9010))))

(declare-fun bm!9014 () Bool)

(declare-fun call!9021 () ListLongMap!1477)

(assert (=> bm!9014 (= call!9021 call!9019)))

(declare-fun bm!9015 () Bool)

(assert (=> bm!9015 (= call!9010 (map!1213 newMap!16))))

(declare-fun bm!9016 () Bool)

(assert (=> bm!9016 (= call!9007 call!9017)))

(declare-fun b!91746 () Bool)

(declare-fun res!46693 () Bool)

(assert (=> b!91746 (=> (not res!46693) (not e!59820))))

(assert (=> b!91746 (= res!46693 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3144 lt!44852)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91747 () Bool)

(declare-fun lt!44858 () tuple2!2254)

(assert (=> b!91747 (= lt!44858 call!9020)))

(assert (=> b!91747 (= e!59829 (tuple2!2255 (_1!1138 lt!44858) (_2!1138 lt!44858)))))

(declare-fun b!91748 () Bool)

(assert (=> b!91748 (= e!59839 ((_ is Undefined!251) lt!44852))))

(declare-fun b!91749 () Bool)

(assert (=> b!91749 (= e!59837 (= call!9022 (+!119 call!9010 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun b!91750 () Bool)

(declare-fun c!15222 () Bool)

(assert (=> b!91750 (= c!15222 ((_ is MissingVacant!251) lt!44859))))

(assert (=> b!91750 (= e!59835 e!59821)))

(declare-fun bm!9017 () Bool)

(declare-fun c!15226 () Bool)

(assert (=> bm!9017 (= c!15226 c!15224)))

(assert (=> bm!9017 (= call!9006 (contains!772 e!59834 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91751 () Bool)

(declare-fun lt!44854 () Unit!2718)

(declare-fun lt!44844 () Unit!2718)

(assert (=> b!91751 (= lt!44854 lt!44844)))

(assert (=> b!91751 (= call!9000 call!9021)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2718)

(assert (=> b!91751 (= lt!44844 (lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) lt!44843 (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) lt!44490 (defaultEntry!2405 newMap!16)))))

(assert (=> b!91751 (= lt!44843 (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!91751 (= e!59840 (tuple2!2255 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6464 newMap!16) (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) (zeroValue!2293 newMap!16) lt!44490 (_size!450 newMap!16) (_keys!4084 newMap!16) (_values!2388 newMap!16) (_vacant!450 newMap!16))))))

(declare-fun bm!9018 () Bool)

(assert (=> bm!9018 (= call!9022 (map!1213 (_2!1138 lt!44835)))))

(declare-fun b!91752 () Bool)

(declare-fun lt!44838 () Unit!2718)

(declare-fun lt!44847 () Unit!2718)

(assert (=> b!91752 (= lt!44838 lt!44847)))

(assert (=> b!91752 (= call!9000 call!9021)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!36 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2718)

(assert (=> b!91752 (= lt!44847 (lemmaChangeZeroKeyThenAddPairToListMap!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) lt!44856 (zeroValue!2293 newMap!16) lt!44490 (minValue!2293 newMap!16) (defaultEntry!2405 newMap!16)))))

(assert (=> b!91752 (= lt!44856 (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!91752 (= e!59840 (tuple2!2255 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6464 newMap!16) (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) lt!44490 (minValue!2293 newMap!16) (_size!450 newMap!16) (_keys!4084 newMap!16) (_values!2388 newMap!16) (_vacant!450 newMap!16))))))

(declare-fun b!91753 () Bool)

(assert (=> b!91753 (= e!59836 e!59830)))

(assert (=> b!91753 (= lt!44841 (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(assert (=> b!91753 (= c!15224 ((_ is Undefined!251) lt!44841))))

(declare-fun bm!9019 () Bool)

(assert (=> bm!9019 (= call!9009 call!9017)))

(declare-fun bm!9020 () Bool)

(assert (=> bm!9020 (= call!9014 call!9004)))

(assert (= (and d!24095 c!15230) b!91740))

(assert (= (and d!24095 (not c!15230)) b!91753))

(assert (= (and b!91740 c!15232) b!91752))

(assert (= (and b!91740 (not c!15232)) b!91751))

(assert (= (or b!91752 b!91751) bm!9019))

(assert (= (or b!91752 b!91751) bm!9014))

(assert (= (or b!91752 b!91751) bm!9003))

(assert (= (and b!91753 c!15224) b!91721))

(assert (= (and b!91753 (not c!15224)) b!91716))

(assert (= (and b!91721 c!15235) b!91714))

(assert (= (and b!91721 (not c!15235)) b!91731))

(assert (= (and b!91714 res!46695) b!91739))

(assert (= (and b!91739 res!46690) b!91720))

(assert (= (and b!91731 c!15225) b!91737))

(assert (= (and b!91731 (not c!15225)) b!91722))

(assert (= (and b!91737 res!46691) b!91746))

(assert (= (and b!91746 res!46693) b!91724))

(assert (= (and b!91722 c!15229) b!91719))

(assert (= (and b!91722 (not c!15229)) b!91748))

(assert (= (and b!91719 res!46688) b!91712))

(assert (= (and b!91712 res!46699) b!91728))

(assert (= (or b!91737 b!91719) bm!9001))

(assert (= (or b!91724 b!91728) bm!8999))

(assert (= (or b!91739 bm!9001) bm!9002))

(assert (= (or b!91714 b!91731) bm!8998))

(assert (= (and b!91716 c!15233) b!91723))

(assert (= (and b!91716 (not c!15233)) b!91742))

(assert (= (and b!91742 c!15231) b!91747))

(assert (= (and b!91742 (not c!15231)) b!91729))

(assert (= (and b!91729 c!15234) b!91725))

(assert (= (and b!91729 (not c!15234)) b!91743))

(assert (= (and b!91725 res!46689) b!91741))

(assert (= (and b!91741 res!46697) b!91715))

(assert (= (and b!91743 c!15228) b!91733))

(assert (= (and b!91743 (not c!15228)) b!91750))

(assert (= (and b!91733 res!46700) b!91736))

(assert (= (and b!91736 res!46696) b!91727))

(assert (= (and b!91750 c!15222) b!91718))

(assert (= (and b!91750 (not c!15222)) b!91732))

(assert (= (and b!91718 res!46698) b!91730))

(assert (= (and b!91730 res!46694) b!91744))

(assert (= (or b!91733 b!91718) bm!9020))

(assert (= (or b!91727 b!91744) bm!8997))

(assert (= (or b!91741 bm!9020) bm!9005))

(assert (= (or b!91725 b!91743) bm!9008))

(assert (= (or b!91723 b!91747) bm!9000))

(assert (= (or bm!9002 bm!9005) bm!9011))

(assert (= (or b!91721 b!91729) bm!9016))

(assert (= (or bm!8999 bm!8997) bm!9009))

(assert (= (or bm!8998 bm!9008) bm!9013))

(assert (= (or b!91731 b!91743) bm!9010))

(assert (= (or b!91714 b!91725) bm!9006))

(assert (= (or b!91721 b!91729) bm!9017))

(assert (= (and bm!9017 c!15226) b!91713))

(assert (= (and bm!9017 (not c!15226)) b!91726))

(assert (= (or bm!9014 b!91729) bm!9007))

(assert (= (or bm!9019 bm!9016) bm!9004))

(assert (= (or bm!9003 b!91729) bm!9012))

(assert (= (and bm!9012 c!15227) b!91734))

(assert (= (and bm!9012 (not c!15227)) b!91738))

(assert (= (and d!24095 res!46687) b!91735))

(assert (= (and b!91735 c!15223) b!91717))

(assert (= (and b!91735 (not c!15223)) b!91745))

(assert (= (and b!91717 res!46692) b!91749))

(assert (= (or b!91749 b!91745) bm!9015))

(assert (= (or b!91717 b!91749 b!91745) bm!9018))

(assert (=> bm!9000 m!97899))

(declare-fun m!98373 () Bool)

(assert (=> bm!9000 m!98373))

(declare-fun m!98375 () Bool)

(assert (=> bm!9018 m!98375))

(declare-fun m!98377 () Bool)

(assert (=> b!91746 m!98377))

(assert (=> bm!9015 m!97907))

(declare-fun m!98379 () Bool)

(assert (=> d!24095 m!98379))

(assert (=> d!24095 m!97961))

(assert (=> bm!9013 m!97899))

(declare-fun m!98381 () Bool)

(assert (=> bm!9013 m!98381))

(assert (=> b!91738 m!98107))

(assert (=> bm!9006 m!97899))

(declare-fun m!98383 () Bool)

(assert (=> bm!9006 m!98383))

(declare-fun m!98385 () Bool)

(assert (=> b!91752 m!98385))

(assert (=> bm!9010 m!97899))

(declare-fun m!98387 () Bool)

(assert (=> bm!9010 m!98387))

(declare-fun m!98389 () Bool)

(assert (=> b!91715 m!98389))

(declare-fun m!98391 () Bool)

(assert (=> b!91730 m!98391))

(declare-fun m!98393 () Bool)

(assert (=> bm!9004 m!98393))

(declare-fun m!98395 () Bool)

(assert (=> bm!9004 m!98395))

(declare-fun m!98397 () Bool)

(assert (=> b!91749 m!98397))

(declare-fun m!98399 () Bool)

(assert (=> bm!9012 m!98399))

(declare-fun m!98401 () Bool)

(assert (=> bm!9011 m!98401))

(assert (=> bm!9009 m!97899))

(declare-fun m!98403 () Bool)

(assert (=> bm!9009 m!98403))

(assert (=> b!91753 m!97899))

(assert (=> b!91753 m!98381))

(declare-fun m!98405 () Bool)

(assert (=> b!91736 m!98405))

(declare-fun m!98407 () Bool)

(assert (=> b!91712 m!98407))

(assert (=> b!91729 m!97899))

(declare-fun m!98409 () Bool)

(assert (=> b!91729 m!98409))

(declare-fun m!98411 () Bool)

(assert (=> b!91729 m!98411))

(declare-fun m!98413 () Bool)

(assert (=> b!91729 m!98413))

(assert (=> b!91729 m!98411))

(assert (=> b!91729 m!98393))

(declare-fun m!98415 () Bool)

(assert (=> b!91729 m!98415))

(assert (=> bm!9017 m!97899))

(declare-fun m!98417 () Bool)

(assert (=> bm!9017 m!98417))

(assert (=> b!91726 m!98107))

(declare-fun m!98419 () Bool)

(assert (=> b!91751 m!98419))

(assert (=> b!91717 m!97899))

(declare-fun m!98421 () Bool)

(assert (=> b!91717 m!98421))

(declare-fun m!98423 () Bool)

(assert (=> b!91720 m!98423))

(declare-fun m!98425 () Bool)

(assert (=> bm!9007 m!98425))

(assert (=> b!91296 d!24095))

(declare-fun d!24097 () Bool)

(assert (=> d!24097 (= (valid!363 thiss!992) (valid!362 (v!2713 (underlying!308 thiss!992))))))

(declare-fun bs!3799 () Bool)

(assert (= bs!3799 d!24097))

(declare-fun m!98427 () Bool)

(assert (=> bs!3799 m!98427))

(assert (=> start!11156 d!24097))

(declare-fun condMapEmpty!3581 () Bool)

(declare-fun mapDefault!3581 () ValueCell!947)

(assert (=> mapNonEmpty!3566 (= condMapEmpty!3581 (= mapRest!3566 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3581)))))

(declare-fun e!59846 () Bool)

(declare-fun mapRes!3581 () Bool)

(assert (=> mapNonEmpty!3566 (= tp!9242 (and e!59846 mapRes!3581))))

(declare-fun mapNonEmpty!3581 () Bool)

(declare-fun tp!9269 () Bool)

(declare-fun e!59845 () Bool)

(assert (=> mapNonEmpty!3581 (= mapRes!3581 (and tp!9269 e!59845))))

(declare-fun mapValue!3581 () ValueCell!947)

(declare-fun mapKey!3581 () (_ BitVec 32))

(declare-fun mapRest!3581 () (Array (_ BitVec 32) ValueCell!947))

(assert (=> mapNonEmpty!3581 (= mapRest!3566 (store mapRest!3581 mapKey!3581 mapValue!3581))))

(declare-fun b!91761 () Bool)

(assert (=> b!91761 (= e!59846 tp_is_empty!2581)))

(declare-fun b!91760 () Bool)

(assert (=> b!91760 (= e!59845 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3581 () Bool)

(assert (=> mapIsEmpty!3581 mapRes!3581))

(assert (= (and mapNonEmpty!3566 condMapEmpty!3581) mapIsEmpty!3581))

(assert (= (and mapNonEmpty!3566 (not condMapEmpty!3581)) mapNonEmpty!3581))

(assert (= (and mapNonEmpty!3581 ((_ is ValueCellFull!947) mapValue!3581)) b!91760))

(assert (= (and mapNonEmpty!3566 ((_ is ValueCellFull!947) mapDefault!3581)) b!91761))

(declare-fun m!98429 () Bool)

(assert (=> mapNonEmpty!3581 m!98429))

(declare-fun condMapEmpty!3582 () Bool)

(declare-fun mapDefault!3582 () ValueCell!947)

(assert (=> mapNonEmpty!3565 (= condMapEmpty!3582 (= mapRest!3565 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3582)))))

(declare-fun e!59848 () Bool)

(declare-fun mapRes!3582 () Bool)

(assert (=> mapNonEmpty!3565 (= tp!9240 (and e!59848 mapRes!3582))))

(declare-fun mapNonEmpty!3582 () Bool)

(declare-fun tp!9270 () Bool)

(declare-fun e!59847 () Bool)

(assert (=> mapNonEmpty!3582 (= mapRes!3582 (and tp!9270 e!59847))))

(declare-fun mapRest!3582 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3582 () ValueCell!947)

(declare-fun mapKey!3582 () (_ BitVec 32))

(assert (=> mapNonEmpty!3582 (= mapRest!3565 (store mapRest!3582 mapKey!3582 mapValue!3582))))

(declare-fun b!91763 () Bool)

(assert (=> b!91763 (= e!59848 tp_is_empty!2581)))

(declare-fun b!91762 () Bool)

(assert (=> b!91762 (= e!59847 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3582 () Bool)

(assert (=> mapIsEmpty!3582 mapRes!3582))

(assert (= (and mapNonEmpty!3565 condMapEmpty!3582) mapIsEmpty!3582))

(assert (= (and mapNonEmpty!3565 (not condMapEmpty!3582)) mapNonEmpty!3582))

(assert (= (and mapNonEmpty!3582 ((_ is ValueCellFull!947) mapValue!3582)) b!91762))

(assert (= (and mapNonEmpty!3565 ((_ is ValueCellFull!947) mapDefault!3582)) b!91763))

(declare-fun m!98431 () Bool)

(assert (=> mapNonEmpty!3582 m!98431))

(declare-fun b_lambda!4041 () Bool)

(assert (= b_lambda!4037 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4041)))

(declare-fun b_lambda!4043 () Bool)

(assert (= b_lambda!4035 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4043)))

(declare-fun b_lambda!4045 () Bool)

(assert (= b_lambda!4039 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4045)))

(declare-fun b_lambda!4047 () Bool)

(assert (= b_lambda!4033 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4047)))

(check-sat (not b!91444) (not bm!9011) (not b!91580) (not bm!9012) (not d!24065) (not b!91499) (not bm!9009) (not b!91612) (not b!91442) (not bm!8943) (not b!91547) (not b!91504) (not d!24071) (not b_lambda!4031) (not bm!9015) (not b!91570) (not b!91565) (not d!24061) (not b!91545) (not bm!9010) (not b!91566) (not bm!8933) b_and!5563 (not mapNonEmpty!3581) (not d!24079) (not b!91493) (not b_lambda!4041) (not b!91443) (not b!91518) (not d!24059) (not bm!8938) (not bm!8939) (not bm!9004) (not b!91585) (not d!24043) (not d!24093) (not bm!8940) (not b!91515) (not d!24097) (not bm!8948) b_and!5561 (not b!91553) (not d!24075) (not b_lambda!4047) (not bm!9013) (not b!91596) (not b!91548) (not d!24057) (not b!91617) (not b!91497) (not bm!8929) (not bm!9017) (not b!91582) (not b_lambda!4043) (not b!91729) (not bm!8931) (not d!24073) (not b!91581) (not b!91572) (not d!24041) (not b!91552) (not b!91571) (not bm!9007) (not bm!9006) (not mapNonEmpty!3582) (not b!91517) (not b!91508) (not b!91498) (not b!91627) (not b!91751) (not bm!9018) tp_is_empty!2581 (not b!91752) (not b!91503) (not b!91717) (not b!91516) (not b!91510) (not b!91749) (not bm!8930) (not d!24055) (not b!91549) (not b!91509) (not d!24069) (not d!24047) (not bm!9000) (not d!24063) (not b!91578) (not b!91584) (not b!91543) (not b!91611) (not b_next!2329) (not d!24053) (not d!24049) (not bm!8941) (not b!91618) (not b!91625) (not b!91491) (not b!91753) (not b!91554) (not b_lambda!4045) (not d!24067) (not b!91502) (not d!24095) (not b!91591) (not d!24045) (not b!91559) (not b!91577) (not b!91738) (not b!91610) (not b!91579) (not b!91576) (not d!24051) (not b!91561) (not b!91726) (not b!91567) (not b_next!2331) (not b!91583))
(check-sat b_and!5561 b_and!5563 (not b_next!2329) (not b_next!2331))
(get-model)

(declare-fun d!24099 () Bool)

(declare-fun c!15240 () Bool)

(assert (=> d!24099 (= c!15240 (and ((_ is Cons!1551) (toList!754 lt!44743)) (= (_1!1139 (h!2143 (toList!754 lt!44743))) (_1!1139 lt!44492))))))

(declare-fun e!59853 () Option!149)

(assert (=> d!24099 (= (getValueByKey!143 (toList!754 lt!44743) (_1!1139 lt!44492)) e!59853)))

(declare-fun b!91774 () Bool)

(declare-fun e!59854 () Option!149)

(assert (=> b!91774 (= e!59854 (getValueByKey!143 (t!5380 (toList!754 lt!44743)) (_1!1139 lt!44492)))))

(declare-fun b!91773 () Bool)

(assert (=> b!91773 (= e!59853 e!59854)))

(declare-fun c!15241 () Bool)

(assert (=> b!91773 (= c!15241 (and ((_ is Cons!1551) (toList!754 lt!44743)) (not (= (_1!1139 (h!2143 (toList!754 lt!44743))) (_1!1139 lt!44492)))))))

(declare-fun b!91775 () Bool)

(assert (=> b!91775 (= e!59854 None!147)))

(declare-fun b!91772 () Bool)

(assert (=> b!91772 (= e!59853 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44743)))))))

(assert (= (and d!24099 c!15240) b!91772))

(assert (= (and d!24099 (not c!15240)) b!91773))

(assert (= (and b!91773 c!15241) b!91774))

(assert (= (and b!91773 (not c!15241)) b!91775))

(declare-fun m!98433 () Bool)

(assert (=> b!91774 m!98433))

(assert (=> b!91580 d!24099))

(declare-fun d!24101 () Bool)

(declare-fun get!1244 (Option!149) V!3089)

(assert (=> d!24101 (= (apply!87 lt!44671 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1244 (getValueByKey!143 (toList!754 lt!44671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3800 () Bool)

(assert (= bs!3800 d!24101))

(declare-fun m!98435 () Bool)

(assert (=> bs!3800 m!98435))

(assert (=> bs!3800 m!98435))

(declare-fun m!98437 () Bool)

(assert (=> bs!3800 m!98437))

(assert (=> b!91497 d!24101))

(declare-fun d!24103 () Bool)

(assert (=> d!24103 (= (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (and (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91610 d!24103))

(declare-fun d!24105 () Bool)

(declare-fun e!59855 () Bool)

(assert (=> d!24105 e!59855))

(declare-fun res!46701 () Bool)

(assert (=> d!24105 (=> res!46701 e!59855)))

(declare-fun lt!44864 () Bool)

(assert (=> d!24105 (= res!46701 (not lt!44864))))

(declare-fun lt!44862 () Bool)

(assert (=> d!24105 (= lt!44864 lt!44862)))

(declare-fun lt!44863 () Unit!2718)

(declare-fun e!59856 () Unit!2718)

(assert (=> d!24105 (= lt!44863 e!59856)))

(declare-fun c!15242 () Bool)

(assert (=> d!24105 (= c!15242 lt!44862)))

(assert (=> d!24105 (= lt!44862 (containsKey!147 (toList!754 lt!44707) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24105 (= (contains!772 lt!44707 #b1000000000000000000000000000000000000000000000000000000000000000) lt!44864)))

(declare-fun b!91776 () Bool)

(declare-fun lt!44861 () Unit!2718)

(assert (=> b!91776 (= e!59856 lt!44861)))

(assert (=> b!91776 (= lt!44861 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44707) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91776 (isDefined!97 (getValueByKey!143 (toList!754 lt!44707) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91777 () Bool)

(declare-fun Unit!2730 () Unit!2718)

(assert (=> b!91777 (= e!59856 Unit!2730)))

(declare-fun b!91778 () Bool)

(assert (=> b!91778 (= e!59855 (isDefined!97 (getValueByKey!143 (toList!754 lt!44707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24105 c!15242) b!91776))

(assert (= (and d!24105 (not c!15242)) b!91777))

(assert (= (and d!24105 (not res!46701)) b!91778))

(declare-fun m!98439 () Bool)

(assert (=> d!24105 m!98439))

(declare-fun m!98441 () Bool)

(assert (=> b!91776 m!98441))

(declare-fun m!98443 () Bool)

(assert (=> b!91776 m!98443))

(assert (=> b!91776 m!98443))

(declare-fun m!98445 () Bool)

(assert (=> b!91776 m!98445))

(assert (=> b!91778 m!98443))

(assert (=> b!91778 m!98443))

(assert (=> b!91778 m!98445))

(assert (=> b!91554 d!24105))

(declare-fun bm!9021 () Bool)

(declare-fun call!9028 () ListLongMap!1477)

(assert (=> bm!9021 (= call!9028 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!91779 () Bool)

(declare-fun res!46704 () Bool)

(declare-fun e!59869 () Bool)

(assert (=> b!91779 (=> (not res!46704) (not e!59869))))

(declare-fun e!59860 () Bool)

(assert (=> b!91779 (= res!46704 e!59860)))

(declare-fun res!46710 () Bool)

(assert (=> b!91779 (=> res!46710 e!59860)))

(declare-fun e!59865 () Bool)

(assert (=> b!91779 (= res!46710 (not e!59865))))

(declare-fun res!46705 () Bool)

(assert (=> b!91779 (=> (not res!46705) (not e!59865))))

(assert (=> b!91779 (= res!46705 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!91780 () Bool)

(declare-fun e!59867 () ListLongMap!1477)

(declare-fun call!9027 () ListLongMap!1477)

(assert (=> b!91780 (= e!59867 call!9027)))

(declare-fun bm!9022 () Bool)

(declare-fun call!9030 () Bool)

(declare-fun lt!44882 () ListLongMap!1477)

(assert (=> bm!9022 (= call!9030 (contains!772 lt!44882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9023 () Bool)

(declare-fun call!9026 () Bool)

(assert (=> bm!9023 (= call!9026 (contains!772 lt!44882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91781 () Bool)

(declare-fun c!15244 () Bool)

(assert (=> b!91781 (= c!15244 (and (not (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59863 () ListLongMap!1477)

(assert (=> b!91781 (= e!59867 e!59863)))

(declare-fun b!91782 () Bool)

(declare-fun e!59864 () Unit!2718)

(declare-fun Unit!2731 () Unit!2718)

(assert (=> b!91782 (= e!59864 Unit!2731)))

(declare-fun b!91783 () Bool)

(assert (=> b!91783 (= e!59865 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!91784 () Bool)

(assert (=> b!91784 (= e!59863 call!9027)))

(declare-fun e!59858 () Bool)

(declare-fun b!91785 () Bool)

(assert (=> b!91785 (= e!59858 (= (apply!87 lt!44882 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16))))))

(declare-fun b!91786 () Bool)

(declare-fun e!59868 () Bool)

(assert (=> b!91786 (= e!59868 e!59858)))

(declare-fun res!46702 () Bool)

(assert (=> b!91786 (= res!46702 call!9026)))

(assert (=> b!91786 (=> (not res!46702) (not e!59858))))

(declare-fun b!91787 () Bool)

(declare-fun e!59866 () Bool)

(assert (=> b!91787 (= e!59869 e!59866)))

(declare-fun c!15243 () Bool)

(assert (=> b!91787 (= c!15243 (not (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9024 () Bool)

(declare-fun call!9025 () ListLongMap!1477)

(declare-fun call!9024 () ListLongMap!1477)

(assert (=> bm!9024 (= call!9025 call!9024)))

(declare-fun b!91788 () Bool)

(declare-fun res!46706 () Bool)

(assert (=> b!91788 (=> (not res!46706) (not e!59869))))

(assert (=> b!91788 (= res!46706 e!59868)))

(declare-fun c!15247 () Bool)

(assert (=> b!91788 (= c!15247 (not (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91789 () Bool)

(declare-fun e!59862 () Bool)

(assert (=> b!91789 (= e!59862 (= (apply!87 lt!44882 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16))))))

(declare-fun b!91790 () Bool)

(declare-fun lt!44868 () Unit!2718)

(assert (=> b!91790 (= e!59864 lt!44868)))

(declare-fun lt!44873 () ListLongMap!1477)

(assert (=> b!91790 (= lt!44873 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44883 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44874 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44874 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!44869 () Unit!2718)

(assert (=> b!91790 (= lt!44869 (addStillContains!63 lt!44873 lt!44883 (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) lt!44874))))

(assert (=> b!91790 (contains!772 (+!119 lt!44873 (tuple2!2257 lt!44883 (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)))) lt!44874)))

(declare-fun lt!44885 () Unit!2718)

(assert (=> b!91790 (= lt!44885 lt!44869)))

(declare-fun lt!44880 () ListLongMap!1477)

(assert (=> b!91790 (= lt!44880 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44871 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44871 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44878 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44878 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!44867 () Unit!2718)

(assert (=> b!91790 (= lt!44867 (addApplyDifferent!63 lt!44880 lt!44871 (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) lt!44878))))

(assert (=> b!91790 (= (apply!87 (+!119 lt!44880 (tuple2!2257 lt!44871 (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)))) lt!44878) (apply!87 lt!44880 lt!44878))))

(declare-fun lt!44877 () Unit!2718)

(assert (=> b!91790 (= lt!44877 lt!44867)))

(declare-fun lt!44886 () ListLongMap!1477)

(assert (=> b!91790 (= lt!44886 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44865 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44866 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44866 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!44870 () Unit!2718)

(assert (=> b!91790 (= lt!44870 (addApplyDifferent!63 lt!44886 lt!44865 (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) lt!44866))))

(assert (=> b!91790 (= (apply!87 (+!119 lt!44886 (tuple2!2257 lt!44865 (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)))) lt!44866) (apply!87 lt!44886 lt!44866))))

(declare-fun lt!44884 () Unit!2718)

(assert (=> b!91790 (= lt!44884 lt!44870)))

(declare-fun lt!44876 () ListLongMap!1477)

(assert (=> b!91790 (= lt!44876 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44875 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44881 () (_ BitVec 64))

(assert (=> b!91790 (= lt!44881 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91790 (= lt!44868 (addApplyDifferent!63 lt!44876 lt!44875 (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) lt!44881))))

(assert (=> b!91790 (= (apply!87 (+!119 lt!44876 (tuple2!2257 lt!44875 (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)))) lt!44881) (apply!87 lt!44876 lt!44881))))

(declare-fun call!9029 () ListLongMap!1477)

(declare-fun c!15248 () Bool)

(declare-fun bm!9025 () Bool)

(declare-fun c!15246 () Bool)

(assert (=> bm!9025 (= call!9029 (+!119 (ite c!15248 call!9028 (ite c!15246 call!9024 call!9025)) (ite (or c!15248 c!15246) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16))))))))

(declare-fun bm!9026 () Bool)

(assert (=> bm!9026 (= call!9024 call!9028)))

(declare-fun b!91791 () Bool)

(declare-fun e!59861 () Bool)

(assert (=> b!91791 (= e!59861 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9027 () Bool)

(assert (=> bm!9027 (= call!9027 call!9029)))

(declare-fun d!24107 () Bool)

(assert (=> d!24107 e!59869))

(declare-fun res!46707 () Bool)

(assert (=> d!24107 (=> (not res!46707) (not e!59869))))

(assert (=> d!24107 (= res!46707 (or (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))))

(declare-fun lt!44872 () ListLongMap!1477)

(assert (=> d!24107 (= lt!44882 lt!44872)))

(declare-fun lt!44879 () Unit!2718)

(assert (=> d!24107 (= lt!44879 e!59864)))

(declare-fun c!15245 () Bool)

(assert (=> d!24107 (= c!15245 e!59861)))

(declare-fun res!46708 () Bool)

(assert (=> d!24107 (=> (not res!46708) (not e!59861))))

(assert (=> d!24107 (= res!46708 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun e!59857 () ListLongMap!1477)

(assert (=> d!24107 (= lt!44872 e!59857)))

(assert (=> d!24107 (= c!15248 (and (not (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24107 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24107 (= (getCurrentListMap!437 (_keys!4084 newMap!16) (ite c!15230 (_values!2388 newMap!16) lt!44842) (mask!6464 newMap!16) (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) (ite (and c!15230 c!15232) lt!44490 (zeroValue!2293 newMap!16)) (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) lt!44882)))

(declare-fun b!91792 () Bool)

(assert (=> b!91792 (= e!59866 e!59862)))

(declare-fun res!46709 () Bool)

(assert (=> b!91792 (= res!46709 call!9030)))

(assert (=> b!91792 (=> (not res!46709) (not e!59862))))

(declare-fun b!91793 () Bool)

(assert (=> b!91793 (= e!59868 (not call!9026))))

(declare-fun b!91794 () Bool)

(declare-fun e!59859 () Bool)

(assert (=> b!91794 (= e!59860 e!59859)))

(declare-fun res!46703 () Bool)

(assert (=> b!91794 (=> (not res!46703) (not e!59859))))

(assert (=> b!91794 (= res!46703 (contains!772 lt!44882 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!91794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!91795 () Bool)

(assert (=> b!91795 (= e!59859 (= (apply!87 lt!44882 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)) (get!1241 (select (arr!1955 (ite c!15230 (_values!2388 newMap!16) lt!44842)) #b00000000000000000000000000000000) (dynLambda!355 (defaultEntry!2405 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2203 (ite c!15230 (_values!2388 newMap!16) lt!44842))))))

(assert (=> b!91795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!91796 () Bool)

(assert (=> b!91796 (= e!59857 (+!119 call!9029 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!15230 (ite c!15232 (minValue!2293 newMap!16) lt!44490) (minValue!2293 newMap!16)))))))

(declare-fun b!91797 () Bool)

(assert (=> b!91797 (= e!59866 (not call!9030))))

(declare-fun b!91798 () Bool)

(assert (=> b!91798 (= e!59863 call!9025)))

(declare-fun b!91799 () Bool)

(assert (=> b!91799 (= e!59857 e!59867)))

(assert (=> b!91799 (= c!15246 (and (not (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!15230 (ite c!15232 lt!44856 lt!44843) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!24107 c!15248) b!91796))

(assert (= (and d!24107 (not c!15248)) b!91799))

(assert (= (and b!91799 c!15246) b!91780))

(assert (= (and b!91799 (not c!15246)) b!91781))

(assert (= (and b!91781 c!15244) b!91784))

(assert (= (and b!91781 (not c!15244)) b!91798))

(assert (= (or b!91784 b!91798) bm!9024))

(assert (= (or b!91780 bm!9024) bm!9026))

(assert (= (or b!91780 b!91784) bm!9027))

(assert (= (or b!91796 bm!9026) bm!9021))

(assert (= (or b!91796 bm!9027) bm!9025))

(assert (= (and d!24107 res!46708) b!91791))

(assert (= (and d!24107 c!15245) b!91790))

(assert (= (and d!24107 (not c!15245)) b!91782))

(assert (= (and d!24107 res!46707) b!91779))

(assert (= (and b!91779 res!46705) b!91783))

(assert (= (and b!91779 (not res!46710)) b!91794))

(assert (= (and b!91794 res!46703) b!91795))

(assert (= (and b!91779 res!46704) b!91788))

(assert (= (and b!91788 c!15247) b!91786))

(assert (= (and b!91788 (not c!15247)) b!91793))

(assert (= (and b!91786 res!46702) b!91785))

(assert (= (or b!91786 b!91793) bm!9023))

(assert (= (and b!91788 res!46706) b!91787))

(assert (= (and b!91787 c!15243) b!91792))

(assert (= (and b!91787 (not c!15243)) b!91797))

(assert (= (and b!91792 res!46709) b!91789))

(assert (= (or b!91792 b!91797) bm!9022))

(declare-fun b_lambda!4049 () Bool)

(assert (=> (not b_lambda!4049) (not b!91795)))

(declare-fun t!5391 () Bool)

(declare-fun tb!1805 () Bool)

(assert (=> (and b!91293 (= (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) (defaultEntry!2405 newMap!16)) t!5391) tb!1805))

(declare-fun result!3093 () Bool)

(assert (=> tb!1805 (= result!3093 tp_is_empty!2581)))

(assert (=> b!91795 t!5391))

(declare-fun b_and!5565 () Bool)

(assert (= b_and!5561 (and (=> t!5391 result!3093) b_and!5565)))

(declare-fun t!5393 () Bool)

(declare-fun tb!1807 () Bool)

(assert (=> (and b!91288 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 newMap!16)) t!5393) tb!1807))

(declare-fun result!3095 () Bool)

(assert (= result!3095 result!3093))

(assert (=> b!91795 t!5393))

(declare-fun b_and!5567 () Bool)

(assert (= b_and!5563 (and (=> t!5393 result!3095) b_and!5567)))

(declare-fun m!98447 () Bool)

(assert (=> b!91783 m!98447))

(assert (=> b!91783 m!98447))

(declare-fun m!98449 () Bool)

(assert (=> b!91783 m!98449))

(declare-fun m!98451 () Bool)

(assert (=> bm!9023 m!98451))

(declare-fun m!98453 () Bool)

(assert (=> bm!9021 m!98453))

(declare-fun m!98455 () Bool)

(assert (=> b!91790 m!98455))

(declare-fun m!98457 () Bool)

(assert (=> b!91790 m!98457))

(declare-fun m!98459 () Bool)

(assert (=> b!91790 m!98459))

(assert (=> b!91790 m!98455))

(declare-fun m!98461 () Bool)

(assert (=> b!91790 m!98461))

(declare-fun m!98463 () Bool)

(assert (=> b!91790 m!98463))

(assert (=> b!91790 m!98447))

(declare-fun m!98465 () Bool)

(assert (=> b!91790 m!98465))

(declare-fun m!98467 () Bool)

(assert (=> b!91790 m!98467))

(assert (=> b!91790 m!98461))

(declare-fun m!98469 () Bool)

(assert (=> b!91790 m!98469))

(declare-fun m!98471 () Bool)

(assert (=> b!91790 m!98471))

(declare-fun m!98473 () Bool)

(assert (=> b!91790 m!98473))

(assert (=> b!91790 m!98463))

(declare-fun m!98475 () Bool)

(assert (=> b!91790 m!98475))

(declare-fun m!98477 () Bool)

(assert (=> b!91790 m!98477))

(assert (=> b!91790 m!98453))

(assert (=> b!91790 m!98477))

(declare-fun m!98479 () Bool)

(assert (=> b!91790 m!98479))

(declare-fun m!98481 () Bool)

(assert (=> b!91790 m!98481))

(declare-fun m!98483 () Bool)

(assert (=> b!91790 m!98483))

(assert (=> b!91791 m!98447))

(assert (=> b!91791 m!98447))

(assert (=> b!91791 m!98449))

(declare-fun m!98485 () Bool)

(assert (=> b!91789 m!98485))

(assert (=> b!91794 m!98447))

(assert (=> b!91794 m!98447))

(declare-fun m!98487 () Bool)

(assert (=> b!91794 m!98487))

(declare-fun m!98489 () Bool)

(assert (=> b!91795 m!98489))

(assert (=> b!91795 m!98447))

(declare-fun m!98491 () Bool)

(assert (=> b!91795 m!98491))

(assert (=> b!91795 m!98489))

(declare-fun m!98493 () Bool)

(assert (=> b!91795 m!98493))

(assert (=> b!91795 m!98447))

(declare-fun m!98495 () Bool)

(assert (=> b!91795 m!98495))

(assert (=> b!91795 m!98491))

(declare-fun m!98497 () Bool)

(assert (=> d!24107 m!98497))

(declare-fun m!98499 () Bool)

(assert (=> b!91796 m!98499))

(declare-fun m!98501 () Bool)

(assert (=> bm!9025 m!98501))

(declare-fun m!98503 () Bool)

(assert (=> bm!9022 m!98503))

(declare-fun m!98505 () Bool)

(assert (=> b!91785 m!98505))

(assert (=> bm!9007 d!24107))

(declare-fun d!24109 () Bool)

(declare-fun c!15249 () Bool)

(assert (=> d!24109 (= c!15249 (and ((_ is Cons!1551) (toList!754 lt!44755)) (= (_1!1139 (h!2143 (toList!754 lt!44755))) (_1!1139 lt!44495))))))

(declare-fun e!59870 () Option!149)

(assert (=> d!24109 (= (getValueByKey!143 (toList!754 lt!44755) (_1!1139 lt!44495)) e!59870)))

(declare-fun b!91802 () Bool)

(declare-fun e!59871 () Option!149)

(assert (=> b!91802 (= e!59871 (getValueByKey!143 (t!5380 (toList!754 lt!44755)) (_1!1139 lt!44495)))))

(declare-fun b!91801 () Bool)

(assert (=> b!91801 (= e!59870 e!59871)))

(declare-fun c!15250 () Bool)

(assert (=> b!91801 (= c!15250 (and ((_ is Cons!1551) (toList!754 lt!44755)) (not (= (_1!1139 (h!2143 (toList!754 lt!44755))) (_1!1139 lt!44495)))))))

(declare-fun b!91803 () Bool)

(assert (=> b!91803 (= e!59871 None!147)))

(declare-fun b!91800 () Bool)

(assert (=> b!91800 (= e!59870 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44755)))))))

(assert (= (and d!24109 c!15249) b!91800))

(assert (= (and d!24109 (not c!15249)) b!91801))

(assert (= (and b!91801 c!15250) b!91802))

(assert (= (and b!91801 (not c!15250)) b!91803))

(declare-fun m!98507 () Bool)

(assert (=> b!91802 m!98507))

(assert (=> b!91584 d!24109))

(declare-fun b!91812 () Bool)

(declare-fun res!46722 () Bool)

(declare-fun e!59874 () Bool)

(assert (=> b!91812 (=> (not res!46722) (not e!59874))))

(assert (=> b!91812 (= res!46722 (and (= (size!2203 (_values!2388 newMap!16)) (bvadd (mask!6464 newMap!16) #b00000000000000000000000000000001)) (= (size!2202 (_keys!4084 newMap!16)) (size!2203 (_values!2388 newMap!16))) (bvsge (_size!450 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!450 newMap!16) (bvadd (mask!6464 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!24111 () Bool)

(declare-fun res!46720 () Bool)

(assert (=> d!24111 (=> (not res!46720) (not e!59874))))

(assert (=> d!24111 (= res!46720 (validMask!0 (mask!6464 newMap!16)))))

(assert (=> d!24111 (= (simpleValid!63 newMap!16) e!59874)))

(declare-fun b!91814 () Bool)

(declare-fun res!46719 () Bool)

(assert (=> b!91814 (=> (not res!46719) (not e!59874))))

(declare-fun size!2208 (LongMapFixedSize!802) (_ BitVec 32))

(assert (=> b!91814 (= res!46719 (= (size!2208 newMap!16) (bvadd (_size!450 newMap!16) (bvsdiv (bvadd (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!91815 () Bool)

(assert (=> b!91815 (= e!59874 (and (bvsge (extraKeys!2236 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2236 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!450 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!91813 () Bool)

(declare-fun res!46721 () Bool)

(assert (=> b!91813 (=> (not res!46721) (not e!59874))))

(assert (=> b!91813 (= res!46721 (bvsge (size!2208 newMap!16) (_size!450 newMap!16)))))

(assert (= (and d!24111 res!46720) b!91812))

(assert (= (and b!91812 res!46722) b!91813))

(assert (= (and b!91813 res!46721) b!91814))

(assert (= (and b!91814 res!46719) b!91815))

(assert (=> d!24111 m!98497))

(declare-fun m!98509 () Bool)

(assert (=> b!91814 m!98509))

(assert (=> b!91813 m!98509))

(assert (=> d!24041 d!24111))

(declare-fun d!24113 () Bool)

(declare-fun e!59875 () Bool)

(assert (=> d!24113 e!59875))

(declare-fun res!46723 () Bool)

(assert (=> d!24113 (=> res!46723 e!59875)))

(declare-fun lt!44890 () Bool)

(assert (=> d!24113 (= res!46723 (not lt!44890))))

(declare-fun lt!44888 () Bool)

(assert (=> d!24113 (= lt!44890 lt!44888)))

(declare-fun lt!44889 () Unit!2718)

(declare-fun e!59876 () Unit!2718)

(assert (=> d!24113 (= lt!44889 e!59876)))

(declare-fun c!15251 () Bool)

(assert (=> d!24113 (= c!15251 lt!44888)))

(assert (=> d!24113 (= lt!44888 (containsKey!147 (toList!754 call!9022) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24113 (= (contains!772 call!9022 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) lt!44890)))

(declare-fun b!91816 () Bool)

(declare-fun lt!44887 () Unit!2718)

(assert (=> b!91816 (= e!59876 lt!44887)))

(assert (=> b!91816 (= lt!44887 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 call!9022) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91816 (isDefined!97 (getValueByKey!143 (toList!754 call!9022) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91817 () Bool)

(declare-fun Unit!2732 () Unit!2718)

(assert (=> b!91817 (= e!59876 Unit!2732)))

(declare-fun b!91818 () Bool)

(assert (=> b!91818 (= e!59875 (isDefined!97 (getValueByKey!143 (toList!754 call!9022) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(assert (= (and d!24113 c!15251) b!91816))

(assert (= (and d!24113 (not c!15251)) b!91817))

(assert (= (and d!24113 (not res!46723)) b!91818))

(assert (=> d!24113 m!97899))

(declare-fun m!98511 () Bool)

(assert (=> d!24113 m!98511))

(assert (=> b!91816 m!97899))

(declare-fun m!98513 () Bool)

(assert (=> b!91816 m!98513))

(assert (=> b!91816 m!97899))

(declare-fun m!98515 () Bool)

(assert (=> b!91816 m!98515))

(assert (=> b!91816 m!98515))

(declare-fun m!98517 () Bool)

(assert (=> b!91816 m!98517))

(assert (=> b!91818 m!97899))

(assert (=> b!91818 m!98515))

(assert (=> b!91818 m!98515))

(assert (=> b!91818 m!98517))

(assert (=> b!91717 d!24113))

(declare-fun d!24115 () Bool)

(assert (=> d!24115 (= (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91499 d!24115))

(declare-fun d!24117 () Bool)

(assert (=> d!24117 (= (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992)))) (and (or (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000001111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000011111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000001111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000011111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000001111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000011111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000001111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000011111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000000111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000001111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000011111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000000111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000001111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000011111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000000111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000001111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000011111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000000111111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000001111111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000011111111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00000111111111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00001111111111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00011111111111111111111111111111) (= (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6464 (v!2713 (underlying!308 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!24045 d!24117))

(declare-fun d!24119 () Bool)

(declare-fun e!59877 () Bool)

(assert (=> d!24119 e!59877))

(declare-fun res!46724 () Bool)

(assert (=> d!24119 (=> res!46724 e!59877)))

(declare-fun lt!44894 () Bool)

(assert (=> d!24119 (= res!46724 (not lt!44894))))

(declare-fun lt!44892 () Bool)

(assert (=> d!24119 (= lt!44894 lt!44892)))

(declare-fun lt!44893 () Unit!2718)

(declare-fun e!59878 () Unit!2718)

(assert (=> d!24119 (= lt!44893 e!59878)))

(declare-fun c!15252 () Bool)

(assert (=> d!24119 (= c!15252 lt!44892)))

(assert (=> d!24119 (= lt!44892 (containsKey!147 (toList!754 lt!44671) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!24119 (= (contains!772 lt!44671 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!44894)))

(declare-fun b!91819 () Bool)

(declare-fun lt!44891 () Unit!2718)

(assert (=> b!91819 (= e!59878 lt!44891)))

(assert (=> b!91819 (= lt!44891 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44671) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91819 (isDefined!97 (getValueByKey!143 (toList!754 lt!44671) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91820 () Bool)

(declare-fun Unit!2733 () Unit!2718)

(assert (=> b!91820 (= e!59878 Unit!2733)))

(declare-fun b!91821 () Bool)

(assert (=> b!91821 (= e!59877 (isDefined!97 (getValueByKey!143 (toList!754 lt!44671) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!24119 c!15252) b!91819))

(assert (= (and d!24119 (not c!15252)) b!91820))

(assert (= (and d!24119 (not res!46724)) b!91821))

(assert (=> d!24119 m!98109))

(declare-fun m!98519 () Bool)

(assert (=> d!24119 m!98519))

(assert (=> b!91819 m!98109))

(declare-fun m!98521 () Bool)

(assert (=> b!91819 m!98521))

(assert (=> b!91819 m!98109))

(declare-fun m!98523 () Bool)

(assert (=> b!91819 m!98523))

(assert (=> b!91819 m!98523))

(declare-fun m!98525 () Bool)

(assert (=> b!91819 m!98525))

(assert (=> b!91821 m!98109))

(assert (=> b!91821 m!98523))

(assert (=> b!91821 m!98523))

(assert (=> b!91821 m!98525))

(assert (=> b!91502 d!24119))

(declare-fun b!91822 () Bool)

(declare-fun lt!44898 () Unit!2718)

(declare-fun lt!44897 () Unit!2718)

(assert (=> b!91822 (= lt!44898 lt!44897)))

(declare-fun lt!44900 () V!3089)

(declare-fun lt!44899 () ListLongMap!1477)

(declare-fun lt!44901 () (_ BitVec 64))

(declare-fun lt!44895 () (_ BitVec 64))

(assert (=> b!91822 (not (contains!772 (+!119 lt!44899 (tuple2!2257 lt!44901 lt!44900)) lt!44895))))

(assert (=> b!91822 (= lt!44897 (addStillNotContains!37 lt!44899 lt!44901 lt!44900 lt!44895))))

(assert (=> b!91822 (= lt!44895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91822 (= lt!44900 (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91822 (= lt!44901 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))

(declare-fun call!9031 () ListLongMap!1477)

(assert (=> b!91822 (= lt!44899 call!9031)))

(declare-fun e!59879 () ListLongMap!1477)

(assert (=> b!91822 (= e!59879 (+!119 call!9031 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!91823 () Bool)

(declare-fun e!59884 () Bool)

(declare-fun e!59883 () Bool)

(assert (=> b!91823 (= e!59884 e!59883)))

(declare-fun c!15254 () Bool)

(assert (=> b!91823 (= c!15254 (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91824 () Bool)

(declare-fun lt!44896 () ListLongMap!1477)

(assert (=> b!91824 (= e!59883 (= lt!44896 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91825 () Bool)

(declare-fun e!59882 () ListLongMap!1477)

(assert (=> b!91825 (= e!59882 (ListLongMap!1478 Nil!1552))))

(declare-fun bm!9028 () Bool)

(assert (=> bm!9028 (= call!9031 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!91826 () Bool)

(assert (=> b!91826 (= e!59882 e!59879)))

(declare-fun c!15256 () Bool)

(assert (=> b!91826 (= c!15256 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91827 () Bool)

(assert (=> b!91827 (= e!59883 (isEmpty!350 lt!44896))))

(declare-fun b!91828 () Bool)

(assert (=> b!91828 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> b!91828 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2203 (_values!2388 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun e!59885 () Bool)

(assert (=> b!91828 (= e!59885 (= (apply!87 lt!44896 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!91829 () Bool)

(declare-fun e!59881 () Bool)

(assert (=> b!91829 (= e!59881 e!59884)))

(declare-fun c!15255 () Bool)

(declare-fun e!59880 () Bool)

(assert (=> b!91829 (= c!15255 e!59880)))

(declare-fun res!46727 () Bool)

(assert (=> b!91829 (=> (not res!46727) (not e!59880))))

(assert (=> b!91829 (= res!46727 (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!91831 () Bool)

(assert (=> b!91831 (= e!59880 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91831 (bvsge from!355 #b00000000000000000000000000000000)))

(declare-fun b!91832 () Bool)

(assert (=> b!91832 (= e!59884 e!59885)))

(assert (=> b!91832 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun res!46725 () Bool)

(assert (=> b!91832 (= res!46725 (contains!772 lt!44896 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91832 (=> (not res!46725) (not e!59885))))

(declare-fun b!91833 () Bool)

(declare-fun res!46726 () Bool)

(assert (=> b!91833 (=> (not res!46726) (not e!59881))))

(assert (=> b!91833 (= res!46726 (not (contains!772 lt!44896 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91830 () Bool)

(assert (=> b!91830 (= e!59879 call!9031)))

(declare-fun d!24121 () Bool)

(assert (=> d!24121 e!59881))

(declare-fun res!46728 () Bool)

(assert (=> d!24121 (=> (not res!46728) (not e!59881))))

(assert (=> d!24121 (= res!46728 (not (contains!772 lt!44896 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24121 (= lt!44896 e!59882)))

(declare-fun c!15253 () Bool)

(assert (=> d!24121 (= c!15253 (bvsge from!355 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> d!24121 (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24121 (= (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) from!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) lt!44896)))

(assert (= (and d!24121 c!15253) b!91825))

(assert (= (and d!24121 (not c!15253)) b!91826))

(assert (= (and b!91826 c!15256) b!91822))

(assert (= (and b!91826 (not c!15256)) b!91830))

(assert (= (or b!91822 b!91830) bm!9028))

(assert (= (and d!24121 res!46728) b!91833))

(assert (= (and b!91833 res!46726) b!91829))

(assert (= (and b!91829 res!46727) b!91831))

(assert (= (and b!91829 c!15255) b!91832))

(assert (= (and b!91829 (not c!15255)) b!91823))

(assert (= (and b!91832 res!46725) b!91828))

(assert (= (and b!91823 c!15254) b!91824))

(assert (= (and b!91823 (not c!15254)) b!91827))

(declare-fun b_lambda!4051 () Bool)

(assert (=> (not b_lambda!4051) (not b!91822)))

(assert (=> b!91822 t!5377))

(declare-fun b_and!5569 () Bool)

(assert (= b_and!5565 (and (=> t!5377 result!3073) b_and!5569)))

(assert (=> b!91822 t!5379))

(declare-fun b_and!5571 () Bool)

(assert (= b_and!5567 (and (=> t!5379 result!3077) b_and!5571)))

(declare-fun b_lambda!4053 () Bool)

(assert (=> (not b_lambda!4053) (not b!91828)))

(assert (=> b!91828 t!5377))

(declare-fun b_and!5573 () Bool)

(assert (= b_and!5569 (and (=> t!5377 result!3073) b_and!5573)))

(assert (=> b!91828 t!5379))

(declare-fun b_and!5575 () Bool)

(assert (= b_and!5571 (and (=> t!5379 result!3077) b_and!5575)))

(declare-fun m!98527 () Bool)

(assert (=> b!91833 m!98527))

(declare-fun m!98529 () Bool)

(assert (=> d!24121 m!98529))

(assert (=> d!24121 m!98155))

(declare-fun m!98531 () Bool)

(assert (=> b!91827 m!98531))

(declare-fun m!98533 () Bool)

(assert (=> b!91824 m!98533))

(assert (=> bm!9028 m!98533))

(assert (=> b!91828 m!97899))

(declare-fun m!98535 () Bool)

(assert (=> b!91828 m!98535))

(assert (=> b!91828 m!97923))

(assert (=> b!91828 m!97921))

(assert (=> b!91828 m!97899))

(assert (=> b!91828 m!97921))

(assert (=> b!91828 m!97923))

(assert (=> b!91828 m!97925))

(declare-fun m!98537 () Bool)

(assert (=> b!91822 m!98537))

(declare-fun m!98539 () Bool)

(assert (=> b!91822 m!98539))

(assert (=> b!91822 m!97923))

(assert (=> b!91822 m!97921))

(declare-fun m!98541 () Bool)

(assert (=> b!91822 m!98541))

(assert (=> b!91822 m!97921))

(assert (=> b!91822 m!97923))

(assert (=> b!91822 m!97925))

(assert (=> b!91822 m!98541))

(declare-fun m!98543 () Bool)

(assert (=> b!91822 m!98543))

(assert (=> b!91822 m!97899))

(assert (=> b!91826 m!97899))

(assert (=> b!91826 m!97899))

(assert (=> b!91826 m!98217))

(assert (=> b!91831 m!97899))

(assert (=> b!91831 m!97899))

(assert (=> b!91831 m!98217))

(assert (=> b!91832 m!97899))

(assert (=> b!91832 m!97899))

(declare-fun m!98545 () Bool)

(assert (=> b!91832 m!98545))

(assert (=> bm!8939 d!24121))

(assert (=> d!24075 d!24081))

(declare-fun d!24123 () Bool)

(assert (=> d!24123 (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) from!355 Nil!1553)))

(assert (=> d!24123 true))

(declare-fun _$71!123 () Unit!2718)

(assert (=> d!24123 (= (choose!39 (_keys!4084 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!123)))

(declare-fun bs!3801 () Bool)

(assert (= bs!3801 d!24123))

(assert (=> bs!3801 m!97897))

(assert (=> d!24075 d!24123))

(declare-fun bm!9029 () Bool)

(declare-fun call!9036 () ListLongMap!1477)

(assert (=> bm!9029 (= call!9036 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))))))

(declare-fun b!91834 () Bool)

(declare-fun res!46731 () Bool)

(declare-fun e!59898 () Bool)

(assert (=> b!91834 (=> (not res!46731) (not e!59898))))

(declare-fun e!59889 () Bool)

(assert (=> b!91834 (= res!46731 e!59889)))

(declare-fun res!46737 () Bool)

(assert (=> b!91834 (=> res!46737 e!59889)))

(declare-fun e!59894 () Bool)

(assert (=> b!91834 (= res!46737 (not e!59894))))

(declare-fun res!46732 () Bool)

(assert (=> b!91834 (=> (not res!46732) (not e!59894))))

(assert (=> b!91834 (= res!46732 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(declare-fun b!91835 () Bool)

(declare-fun e!59896 () ListLongMap!1477)

(declare-fun call!9035 () ListLongMap!1477)

(assert (=> b!91835 (= e!59896 call!9035)))

(declare-fun bm!9030 () Bool)

(declare-fun call!9038 () Bool)

(declare-fun lt!44919 () ListLongMap!1477)

(assert (=> bm!9030 (= call!9038 (contains!772 lt!44919 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9031 () Bool)

(declare-fun call!9034 () Bool)

(assert (=> bm!9031 (= call!9034 (contains!772 lt!44919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91836 () Bool)

(declare-fun c!15258 () Bool)

(assert (=> b!91836 (= c!15258 (and (not (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59892 () ListLongMap!1477)

(assert (=> b!91836 (= e!59896 e!59892)))

(declare-fun b!91837 () Bool)

(declare-fun e!59893 () Unit!2718)

(declare-fun Unit!2734 () Unit!2718)

(assert (=> b!91837 (= e!59893 Unit!2734)))

(declare-fun b!91838 () Bool)

(assert (=> b!91838 (= e!59894 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun b!91839 () Bool)

(assert (=> b!91839 (= e!59892 call!9035)))

(declare-fun b!91840 () Bool)

(declare-fun e!59887 () Bool)

(assert (=> b!91840 (= e!59887 (= (apply!87 lt!44919 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 (_2!1138 lt!44500))))))

(declare-fun b!91841 () Bool)

(declare-fun e!59897 () Bool)

(assert (=> b!91841 (= e!59897 e!59887)))

(declare-fun res!46729 () Bool)

(assert (=> b!91841 (= res!46729 call!9034)))

(assert (=> b!91841 (=> (not res!46729) (not e!59887))))

(declare-fun b!91842 () Bool)

(declare-fun e!59895 () Bool)

(assert (=> b!91842 (= e!59898 e!59895)))

(declare-fun c!15257 () Bool)

(assert (=> b!91842 (= c!15257 (not (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9032 () Bool)

(declare-fun call!9033 () ListLongMap!1477)

(declare-fun call!9032 () ListLongMap!1477)

(assert (=> bm!9032 (= call!9033 call!9032)))

(declare-fun b!91843 () Bool)

(declare-fun res!46733 () Bool)

(assert (=> b!91843 (=> (not res!46733) (not e!59898))))

(assert (=> b!91843 (= res!46733 e!59897)))

(declare-fun c!15261 () Bool)

(assert (=> b!91843 (= c!15261 (not (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91844 () Bool)

(declare-fun e!59891 () Bool)

(assert (=> b!91844 (= e!59891 (= (apply!87 lt!44919 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 (_2!1138 lt!44500))))))

(declare-fun b!91845 () Bool)

(declare-fun lt!44905 () Unit!2718)

(assert (=> b!91845 (= e!59893 lt!44905)))

(declare-fun lt!44910 () ListLongMap!1477)

(assert (=> b!91845 (= lt!44910 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))))))

(declare-fun lt!44920 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44911 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44911 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000))))

(declare-fun lt!44906 () Unit!2718)

(assert (=> b!91845 (= lt!44906 (addStillContains!63 lt!44910 lt!44920 (zeroValue!2293 (_2!1138 lt!44500)) lt!44911))))

(assert (=> b!91845 (contains!772 (+!119 lt!44910 (tuple2!2257 lt!44920 (zeroValue!2293 (_2!1138 lt!44500)))) lt!44911)))

(declare-fun lt!44922 () Unit!2718)

(assert (=> b!91845 (= lt!44922 lt!44906)))

(declare-fun lt!44917 () ListLongMap!1477)

(assert (=> b!91845 (= lt!44917 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))))))

(declare-fun lt!44908 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44908 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44915 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44915 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000))))

(declare-fun lt!44904 () Unit!2718)

(assert (=> b!91845 (= lt!44904 (addApplyDifferent!63 lt!44917 lt!44908 (minValue!2293 (_2!1138 lt!44500)) lt!44915))))

(assert (=> b!91845 (= (apply!87 (+!119 lt!44917 (tuple2!2257 lt!44908 (minValue!2293 (_2!1138 lt!44500)))) lt!44915) (apply!87 lt!44917 lt!44915))))

(declare-fun lt!44914 () Unit!2718)

(assert (=> b!91845 (= lt!44914 lt!44904)))

(declare-fun lt!44923 () ListLongMap!1477)

(assert (=> b!91845 (= lt!44923 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))))))

(declare-fun lt!44902 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44903 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44903 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000))))

(declare-fun lt!44907 () Unit!2718)

(assert (=> b!91845 (= lt!44907 (addApplyDifferent!63 lt!44923 lt!44902 (zeroValue!2293 (_2!1138 lt!44500)) lt!44903))))

(assert (=> b!91845 (= (apply!87 (+!119 lt!44923 (tuple2!2257 lt!44902 (zeroValue!2293 (_2!1138 lt!44500)))) lt!44903) (apply!87 lt!44923 lt!44903))))

(declare-fun lt!44921 () Unit!2718)

(assert (=> b!91845 (= lt!44921 lt!44907)))

(declare-fun lt!44913 () ListLongMap!1477)

(assert (=> b!91845 (= lt!44913 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))))))

(declare-fun lt!44912 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44912 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44918 () (_ BitVec 64))

(assert (=> b!91845 (= lt!44918 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000))))

(assert (=> b!91845 (= lt!44905 (addApplyDifferent!63 lt!44913 lt!44912 (minValue!2293 (_2!1138 lt!44500)) lt!44918))))

(assert (=> b!91845 (= (apply!87 (+!119 lt!44913 (tuple2!2257 lt!44912 (minValue!2293 (_2!1138 lt!44500)))) lt!44918) (apply!87 lt!44913 lt!44918))))

(declare-fun c!15260 () Bool)

(declare-fun bm!9033 () Bool)

(declare-fun c!15262 () Bool)

(declare-fun call!9037 () ListLongMap!1477)

(assert (=> bm!9033 (= call!9037 (+!119 (ite c!15262 call!9036 (ite c!15260 call!9032 call!9033)) (ite (or c!15262 c!15260) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (_2!1138 lt!44500))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (_2!1138 lt!44500))))))))

(declare-fun bm!9034 () Bool)

(assert (=> bm!9034 (= call!9032 call!9036)))

(declare-fun b!91846 () Bool)

(declare-fun e!59890 () Bool)

(assert (=> b!91846 (= e!59890 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun bm!9035 () Bool)

(assert (=> bm!9035 (= call!9035 call!9037)))

(declare-fun d!24125 () Bool)

(assert (=> d!24125 e!59898))

(declare-fun res!46734 () Bool)

(assert (=> d!24125 (=> (not res!46734) (not e!59898))))

(assert (=> d!24125 (= res!46734 (or (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))))

(declare-fun lt!44909 () ListLongMap!1477)

(assert (=> d!24125 (= lt!44919 lt!44909)))

(declare-fun lt!44916 () Unit!2718)

(assert (=> d!24125 (= lt!44916 e!59893)))

(declare-fun c!15259 () Bool)

(assert (=> d!24125 (= c!15259 e!59890)))

(declare-fun res!46735 () Bool)

(assert (=> d!24125 (=> (not res!46735) (not e!59890))))

(assert (=> d!24125 (= res!46735 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(declare-fun e!59886 () ListLongMap!1477)

(assert (=> d!24125 (= lt!44909 e!59886)))

(assert (=> d!24125 (= c!15262 (and (not (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24125 (validMask!0 (mask!6464 (_2!1138 lt!44500)))))

(assert (=> d!24125 (= (getCurrentListMap!437 (_keys!4084 (_2!1138 lt!44500)) (_values!2388 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500)) (extraKeys!2236 (_2!1138 lt!44500)) (zeroValue!2293 (_2!1138 lt!44500)) (minValue!2293 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44500))) lt!44919)))

(declare-fun b!91847 () Bool)

(assert (=> b!91847 (= e!59895 e!59891)))

(declare-fun res!46736 () Bool)

(assert (=> b!91847 (= res!46736 call!9038)))

(assert (=> b!91847 (=> (not res!46736) (not e!59891))))

(declare-fun b!91848 () Bool)

(assert (=> b!91848 (= e!59897 (not call!9034))))

(declare-fun b!91849 () Bool)

(declare-fun e!59888 () Bool)

(assert (=> b!91849 (= e!59889 e!59888)))

(declare-fun res!46730 () Bool)

(assert (=> b!91849 (=> (not res!46730) (not e!59888))))

(assert (=> b!91849 (= res!46730 (contains!772 lt!44919 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(assert (=> b!91849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(declare-fun b!91850 () Bool)

(assert (=> b!91850 (= e!59888 (= (apply!87 lt!44919 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)) (get!1241 (select (arr!1955 (_values!2388 (_2!1138 lt!44500))) #b00000000000000000000000000000000) (dynLambda!355 (defaultEntry!2405 (_2!1138 lt!44500)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2203 (_values!2388 (_2!1138 lt!44500)))))))

(assert (=> b!91850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(declare-fun b!91851 () Bool)

(assert (=> b!91851 (= e!59886 (+!119 call!9037 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (_2!1138 lt!44500)))))))

(declare-fun b!91852 () Bool)

(assert (=> b!91852 (= e!59895 (not call!9038))))

(declare-fun b!91853 () Bool)

(assert (=> b!91853 (= e!59892 call!9033)))

(declare-fun b!91854 () Bool)

(assert (=> b!91854 (= e!59886 e!59896)))

(assert (=> b!91854 (= c!15260 (and (not (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!24125 c!15262) b!91851))

(assert (= (and d!24125 (not c!15262)) b!91854))

(assert (= (and b!91854 c!15260) b!91835))

(assert (= (and b!91854 (not c!15260)) b!91836))

(assert (= (and b!91836 c!15258) b!91839))

(assert (= (and b!91836 (not c!15258)) b!91853))

(assert (= (or b!91839 b!91853) bm!9032))

(assert (= (or b!91835 bm!9032) bm!9034))

(assert (= (or b!91835 b!91839) bm!9035))

(assert (= (or b!91851 bm!9034) bm!9029))

(assert (= (or b!91851 bm!9035) bm!9033))

(assert (= (and d!24125 res!46735) b!91846))

(assert (= (and d!24125 c!15259) b!91845))

(assert (= (and d!24125 (not c!15259)) b!91837))

(assert (= (and d!24125 res!46734) b!91834))

(assert (= (and b!91834 res!46732) b!91838))

(assert (= (and b!91834 (not res!46737)) b!91849))

(assert (= (and b!91849 res!46730) b!91850))

(assert (= (and b!91834 res!46731) b!91843))

(assert (= (and b!91843 c!15261) b!91841))

(assert (= (and b!91843 (not c!15261)) b!91848))

(assert (= (and b!91841 res!46729) b!91840))

(assert (= (or b!91841 b!91848) bm!9031))

(assert (= (and b!91843 res!46733) b!91842))

(assert (= (and b!91842 c!15257) b!91847))

(assert (= (and b!91842 (not c!15257)) b!91852))

(assert (= (and b!91847 res!46736) b!91844))

(assert (= (or b!91847 b!91852) bm!9030))

(declare-fun b_lambda!4055 () Bool)

(assert (=> (not b_lambda!4055) (not b!91850)))

(declare-fun tb!1809 () Bool)

(declare-fun t!5395 () Bool)

(assert (=> (and b!91293 (= (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) (defaultEntry!2405 (_2!1138 lt!44500))) t!5395) tb!1809))

(declare-fun result!3097 () Bool)

(assert (=> tb!1809 (= result!3097 tp_is_empty!2581)))

(assert (=> b!91850 t!5395))

(declare-fun b_and!5577 () Bool)

(assert (= b_and!5573 (and (=> t!5395 result!3097) b_and!5577)))

(declare-fun t!5397 () Bool)

(declare-fun tb!1811 () Bool)

(assert (=> (and b!91288 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (_2!1138 lt!44500))) t!5397) tb!1811))

(declare-fun result!3099 () Bool)

(assert (= result!3099 result!3097))

(assert (=> b!91850 t!5397))

(declare-fun b_and!5579 () Bool)

(assert (= b_and!5575 (and (=> t!5397 result!3099) b_and!5579)))

(declare-fun m!98547 () Bool)

(assert (=> b!91838 m!98547))

(assert (=> b!91838 m!98547))

(declare-fun m!98549 () Bool)

(assert (=> b!91838 m!98549))

(declare-fun m!98551 () Bool)

(assert (=> bm!9031 m!98551))

(declare-fun m!98553 () Bool)

(assert (=> bm!9029 m!98553))

(declare-fun m!98555 () Bool)

(assert (=> b!91845 m!98555))

(declare-fun m!98557 () Bool)

(assert (=> b!91845 m!98557))

(declare-fun m!98559 () Bool)

(assert (=> b!91845 m!98559))

(assert (=> b!91845 m!98555))

(declare-fun m!98561 () Bool)

(assert (=> b!91845 m!98561))

(declare-fun m!98563 () Bool)

(assert (=> b!91845 m!98563))

(assert (=> b!91845 m!98547))

(declare-fun m!98565 () Bool)

(assert (=> b!91845 m!98565))

(declare-fun m!98567 () Bool)

(assert (=> b!91845 m!98567))

(assert (=> b!91845 m!98561))

(declare-fun m!98569 () Bool)

(assert (=> b!91845 m!98569))

(declare-fun m!98571 () Bool)

(assert (=> b!91845 m!98571))

(declare-fun m!98573 () Bool)

(assert (=> b!91845 m!98573))

(assert (=> b!91845 m!98563))

(declare-fun m!98575 () Bool)

(assert (=> b!91845 m!98575))

(declare-fun m!98577 () Bool)

(assert (=> b!91845 m!98577))

(assert (=> b!91845 m!98553))

(assert (=> b!91845 m!98577))

(declare-fun m!98579 () Bool)

(assert (=> b!91845 m!98579))

(declare-fun m!98581 () Bool)

(assert (=> b!91845 m!98581))

(declare-fun m!98583 () Bool)

(assert (=> b!91845 m!98583))

(assert (=> b!91846 m!98547))

(assert (=> b!91846 m!98547))

(assert (=> b!91846 m!98549))

(declare-fun m!98585 () Bool)

(assert (=> b!91844 m!98585))

(assert (=> b!91849 m!98547))

(assert (=> b!91849 m!98547))

(declare-fun m!98587 () Bool)

(assert (=> b!91849 m!98587))

(declare-fun m!98589 () Bool)

(assert (=> b!91850 m!98589))

(assert (=> b!91850 m!98547))

(declare-fun m!98591 () Bool)

(assert (=> b!91850 m!98591))

(assert (=> b!91850 m!98589))

(declare-fun m!98593 () Bool)

(assert (=> b!91850 m!98593))

(assert (=> b!91850 m!98547))

(declare-fun m!98595 () Bool)

(assert (=> b!91850 m!98595))

(assert (=> b!91850 m!98591))

(declare-fun m!98597 () Bool)

(assert (=> d!24125 m!98597))

(declare-fun m!98599 () Bool)

(assert (=> b!91851 m!98599))

(declare-fun m!98601 () Bool)

(assert (=> bm!9033 m!98601))

(declare-fun m!98603 () Bool)

(assert (=> bm!9030 m!98603))

(declare-fun m!98605 () Bool)

(assert (=> b!91840 m!98605))

(assert (=> d!24069 d!24125))

(declare-fun d!24127 () Bool)

(assert (=> d!24127 (= (get!1242 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2712 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91617 d!24127))

(declare-fun d!24129 () Bool)

(declare-fun e!59899 () Bool)

(assert (=> d!24129 e!59899))

(declare-fun res!46738 () Bool)

(assert (=> d!24129 (=> res!46738 e!59899)))

(declare-fun lt!44927 () Bool)

(assert (=> d!24129 (= res!46738 (not lt!44927))))

(declare-fun lt!44925 () Bool)

(assert (=> d!24129 (= lt!44927 lt!44925)))

(declare-fun lt!44926 () Unit!2718)

(declare-fun e!59900 () Unit!2718)

(assert (=> d!24129 (= lt!44926 e!59900)))

(declare-fun c!15263 () Bool)

(assert (=> d!24129 (= c!15263 lt!44925)))

(assert (=> d!24129 (= lt!44925 (containsKey!147 (toList!754 lt!44730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24129 (= (contains!772 lt!44730 #b0000000000000000000000000000000000000000000000000000000000000000) lt!44927)))

(declare-fun b!91855 () Bool)

(declare-fun lt!44924 () Unit!2718)

(assert (=> b!91855 (= e!59900 lt!44924)))

(assert (=> b!91855 (= lt!44924 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91855 (isDefined!97 (getValueByKey!143 (toList!754 lt!44730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91856 () Bool)

(declare-fun Unit!2735 () Unit!2718)

(assert (=> b!91856 (= e!59900 Unit!2735)))

(declare-fun b!91857 () Bool)

(assert (=> b!91857 (= e!59899 (isDefined!97 (getValueByKey!143 (toList!754 lt!44730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24129 c!15263) b!91855))

(assert (= (and d!24129 (not c!15263)) b!91856))

(assert (= (and d!24129 (not res!46738)) b!91857))

(declare-fun m!98607 () Bool)

(assert (=> d!24129 m!98607))

(declare-fun m!98609 () Bool)

(assert (=> b!91855 m!98609))

(declare-fun m!98611 () Bool)

(assert (=> b!91855 m!98611))

(assert (=> b!91855 m!98611))

(declare-fun m!98613 () Bool)

(assert (=> b!91855 m!98613))

(assert (=> b!91857 m!98611))

(assert (=> b!91857 m!98611))

(assert (=> b!91857 m!98613))

(assert (=> bm!8941 d!24129))

(declare-fun d!24131 () Bool)

(declare-fun e!59901 () Bool)

(assert (=> d!24131 e!59901))

(declare-fun res!46739 () Bool)

(assert (=> d!24131 (=> res!46739 e!59901)))

(declare-fun lt!44931 () Bool)

(assert (=> d!24131 (= res!46739 (not lt!44931))))

(declare-fun lt!44929 () Bool)

(assert (=> d!24131 (= lt!44931 lt!44929)))

(declare-fun lt!44930 () Unit!2718)

(declare-fun e!59902 () Unit!2718)

(assert (=> d!24131 (= lt!44930 e!59902)))

(declare-fun c!15264 () Bool)

(assert (=> d!24131 (= c!15264 lt!44929)))

(assert (=> d!24131 (= lt!44929 (containsKey!147 (toList!754 e!59834) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24131 (= (contains!772 e!59834 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) lt!44931)))

(declare-fun b!91858 () Bool)

(declare-fun lt!44928 () Unit!2718)

(assert (=> b!91858 (= e!59902 lt!44928)))

(assert (=> b!91858 (= lt!44928 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 e!59834) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91858 (isDefined!97 (getValueByKey!143 (toList!754 e!59834) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91859 () Bool)

(declare-fun Unit!2736 () Unit!2718)

(assert (=> b!91859 (= e!59902 Unit!2736)))

(declare-fun b!91860 () Bool)

(assert (=> b!91860 (= e!59901 (isDefined!97 (getValueByKey!143 (toList!754 e!59834) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(assert (= (and d!24131 c!15264) b!91858))

(assert (= (and d!24131 (not c!15264)) b!91859))

(assert (= (and d!24131 (not res!46739)) b!91860))

(assert (=> d!24131 m!97899))

(declare-fun m!98615 () Bool)

(assert (=> d!24131 m!98615))

(assert (=> b!91858 m!97899))

(declare-fun m!98617 () Bool)

(assert (=> b!91858 m!98617))

(assert (=> b!91858 m!97899))

(declare-fun m!98619 () Bool)

(assert (=> b!91858 m!98619))

(assert (=> b!91858 m!98619))

(declare-fun m!98621 () Bool)

(assert (=> b!91858 m!98621))

(assert (=> b!91860 m!97899))

(assert (=> b!91860 m!98619))

(assert (=> b!91860 m!98619))

(assert (=> b!91860 m!98621))

(assert (=> bm!9017 d!24131))

(declare-fun d!24133 () Bool)

(assert (=> d!24133 (isDefined!97 (getValueByKey!143 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun lt!44934 () Unit!2718)

(declare-fun choose!552 (List!1555 (_ BitVec 64)) Unit!2718)

(assert (=> d!24133 (= lt!44934 (choose!552 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun e!59905 () Bool)

(assert (=> d!24133 e!59905))

(declare-fun res!46742 () Bool)

(assert (=> d!24133 (=> (not res!46742) (not e!59905))))

(declare-fun isStrictlySorted!296 (List!1555) Bool)

(assert (=> d!24133 (= res!46742 (isStrictlySorted!296 (toList!754 lt!44488)))))

(assert (=> d!24133 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) lt!44934)))

(declare-fun b!91863 () Bool)

(assert (=> b!91863 (= e!59905 (containsKey!147 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (= (and d!24133 res!46742) b!91863))

(assert (=> d!24133 m!97899))

(assert (=> d!24133 m!98369))

(assert (=> d!24133 m!98369))

(assert (=> d!24133 m!98371))

(assert (=> d!24133 m!97899))

(declare-fun m!98623 () Bool)

(assert (=> d!24133 m!98623))

(declare-fun m!98625 () Bool)

(assert (=> d!24133 m!98625))

(assert (=> b!91863 m!97899))

(assert (=> b!91863 m!98365))

(assert (=> b!91625 d!24133))

(declare-fun d!24135 () Bool)

(declare-fun isEmpty!351 (Option!149) Bool)

(assert (=> d!24135 (= (isDefined!97 (getValueByKey!143 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))) (not (isEmpty!351 (getValueByKey!143 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))))

(declare-fun bs!3802 () Bool)

(assert (= bs!3802 d!24135))

(assert (=> bs!3802 m!98369))

(declare-fun m!98627 () Bool)

(assert (=> bs!3802 m!98627))

(assert (=> b!91625 d!24135))

(declare-fun c!15265 () Bool)

(declare-fun d!24137 () Bool)

(assert (=> d!24137 (= c!15265 (and ((_ is Cons!1551) (toList!754 lt!44488)) (= (_1!1139 (h!2143 (toList!754 lt!44488))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(declare-fun e!59906 () Option!149)

(assert (=> d!24137 (= (getValueByKey!143 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) e!59906)))

(declare-fun b!91866 () Bool)

(declare-fun e!59907 () Option!149)

(assert (=> b!91866 (= e!59907 (getValueByKey!143 (t!5380 (toList!754 lt!44488)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91865 () Bool)

(assert (=> b!91865 (= e!59906 e!59907)))

(declare-fun c!15266 () Bool)

(assert (=> b!91865 (= c!15266 (and ((_ is Cons!1551) (toList!754 lt!44488)) (not (= (_1!1139 (h!2143 (toList!754 lt!44488))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))))

(declare-fun b!91867 () Bool)

(assert (=> b!91867 (= e!59907 None!147)))

(declare-fun b!91864 () Bool)

(assert (=> b!91864 (= e!59906 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44488)))))))

(assert (= (and d!24137 c!15265) b!91864))

(assert (= (and d!24137 (not c!15265)) b!91865))

(assert (= (and b!91865 c!15266) b!91866))

(assert (= (and b!91865 (not c!15266)) b!91867))

(assert (=> b!91866 m!97899))

(declare-fun m!98629 () Bool)

(assert (=> b!91866 m!98629))

(assert (=> b!91625 d!24137))

(declare-fun d!24139 () Bool)

(assert (=> d!24139 (= (apply!87 lt!44671 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1244 (getValueByKey!143 (toList!754 lt!44671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3803 () Bool)

(assert (= bs!3803 d!24139))

(declare-fun m!98631 () Bool)

(assert (=> bs!3803 m!98631))

(assert (=> bs!3803 m!98631))

(declare-fun m!98633 () Bool)

(assert (=> bs!3803 m!98633))

(assert (=> b!91493 d!24139))

(declare-fun d!24141 () Bool)

(declare-fun lt!44937 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!95 (List!1555) (InoxSet tuple2!2256))

(assert (=> d!24141 (= lt!44937 (select (content!95 (toList!754 lt!44684)) lt!44489))))

(declare-fun e!59913 () Bool)

(assert (=> d!24141 (= lt!44937 e!59913)))

(declare-fun res!46747 () Bool)

(assert (=> d!24141 (=> (not res!46747) (not e!59913))))

(assert (=> d!24141 (= res!46747 ((_ is Cons!1551) (toList!754 lt!44684)))))

(assert (=> d!24141 (= (contains!773 (toList!754 lt!44684) lt!44489) lt!44937)))

(declare-fun b!91872 () Bool)

(declare-fun e!59912 () Bool)

(assert (=> b!91872 (= e!59913 e!59912)))

(declare-fun res!46748 () Bool)

(assert (=> b!91872 (=> res!46748 e!59912)))

(assert (=> b!91872 (= res!46748 (= (h!2143 (toList!754 lt!44684)) lt!44489))))

(declare-fun b!91873 () Bool)

(assert (=> b!91873 (= e!59912 (contains!773 (t!5380 (toList!754 lt!44684)) lt!44489))))

(assert (= (and d!24141 res!46747) b!91872))

(assert (= (and b!91872 (not res!46748)) b!91873))

(declare-fun m!98635 () Bool)

(assert (=> d!24141 m!98635))

(declare-fun m!98637 () Bool)

(assert (=> d!24141 m!98637))

(declare-fun m!98639 () Bool)

(assert (=> b!91873 m!98639))

(assert (=> b!91516 d!24141))

(declare-fun b!91886 () Bool)

(declare-fun e!59920 () SeekEntryResult!251)

(declare-fun lt!44946 () SeekEntryResult!251)

(assert (=> b!91886 (= e!59920 (MissingZero!251 (index!3146 lt!44946)))))

(declare-fun d!24143 () Bool)

(declare-fun lt!44945 () SeekEntryResult!251)

(assert (=> d!24143 (and (or ((_ is Undefined!251) lt!44945) (not ((_ is Found!251) lt!44945)) (and (bvsge (index!3145 lt!44945) #b00000000000000000000000000000000) (bvslt (index!3145 lt!44945) (size!2202 (_keys!4084 newMap!16))))) (or ((_ is Undefined!251) lt!44945) ((_ is Found!251) lt!44945) (not ((_ is MissingZero!251) lt!44945)) (and (bvsge (index!3144 lt!44945) #b00000000000000000000000000000000) (bvslt (index!3144 lt!44945) (size!2202 (_keys!4084 newMap!16))))) (or ((_ is Undefined!251) lt!44945) ((_ is Found!251) lt!44945) ((_ is MissingZero!251) lt!44945) (not ((_ is MissingVacant!251) lt!44945)) (and (bvsge (index!3147 lt!44945) #b00000000000000000000000000000000) (bvslt (index!3147 lt!44945) (size!2202 (_keys!4084 newMap!16))))) (or ((_ is Undefined!251) lt!44945) (ite ((_ is Found!251) lt!44945) (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44945)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (ite ((_ is MissingZero!251) lt!44945) (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3144 lt!44945)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!251) lt!44945) (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3147 lt!44945)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!59921 () SeekEntryResult!251)

(assert (=> d!24143 (= lt!44945 e!59921)))

(declare-fun c!15273 () Bool)

(assert (=> d!24143 (= c!15273 (and ((_ is Intermediate!251) lt!44946) (undefined!1063 lt!44946)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4111 (_ BitVec 32)) SeekEntryResult!251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!24143 (= lt!44946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (mask!6464 newMap!16)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(assert (=> d!24143 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24143 (= (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)) lt!44945)))

(declare-fun b!91887 () Bool)

(declare-fun c!15274 () Bool)

(declare-fun lt!44944 () (_ BitVec 64))

(assert (=> b!91887 (= c!15274 (= lt!44944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!59922 () SeekEntryResult!251)

(assert (=> b!91887 (= e!59922 e!59920)))

(declare-fun b!91888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4111 (_ BitVec 32)) SeekEntryResult!251)

(assert (=> b!91888 (= e!59920 (seekKeyOrZeroReturnVacant!0 (x!12449 lt!44946) (index!3146 lt!44946) (index!3146 lt!44946) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(declare-fun b!91889 () Bool)

(assert (=> b!91889 (= e!59921 Undefined!251)))

(declare-fun b!91890 () Bool)

(assert (=> b!91890 (= e!59921 e!59922)))

(assert (=> b!91890 (= lt!44944 (select (arr!1954 (_keys!4084 newMap!16)) (index!3146 lt!44946)))))

(declare-fun c!15275 () Bool)

(assert (=> b!91890 (= c!15275 (= lt!44944 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!91891 () Bool)

(assert (=> b!91891 (= e!59922 (Found!251 (index!3146 lt!44946)))))

(assert (= (and d!24143 c!15273) b!91889))

(assert (= (and d!24143 (not c!15273)) b!91890))

(assert (= (and b!91890 c!15275) b!91891))

(assert (= (and b!91890 (not c!15275)) b!91887))

(assert (= (and b!91887 c!15274) b!91886))

(assert (= (and b!91887 (not c!15274)) b!91888))

(declare-fun m!98641 () Bool)

(assert (=> d!24143 m!98641))

(declare-fun m!98643 () Bool)

(assert (=> d!24143 m!98643))

(assert (=> d!24143 m!97899))

(declare-fun m!98645 () Bool)

(assert (=> d!24143 m!98645))

(declare-fun m!98647 () Bool)

(assert (=> d!24143 m!98647))

(declare-fun m!98649 () Bool)

(assert (=> d!24143 m!98649))

(assert (=> d!24143 m!97899))

(assert (=> d!24143 m!98643))

(assert (=> d!24143 m!98497))

(assert (=> b!91888 m!97899))

(declare-fun m!98651 () Bool)

(assert (=> b!91888 m!98651))

(declare-fun m!98653 () Bool)

(assert (=> b!91890 m!98653))

(assert (=> b!91753 d!24143))

(declare-fun d!24145 () Bool)

(assert (=> d!24145 (= (inRange!0 (ite c!15224 (ite c!15235 (index!3145 lt!44834) (ite c!15225 (index!3144 lt!44852) (index!3147 lt!44852))) (ite c!15234 (index!3145 lt!44850) (ite c!15228 (index!3144 lt!44859) (index!3147 lt!44859)))) (mask!6464 newMap!16)) (and (bvsge (ite c!15224 (ite c!15235 (index!3145 lt!44834) (ite c!15225 (index!3144 lt!44852) (index!3147 lt!44852))) (ite c!15234 (index!3145 lt!44850) (ite c!15228 (index!3144 lt!44859) (index!3147 lt!44859)))) #b00000000000000000000000000000000) (bvslt (ite c!15224 (ite c!15235 (index!3145 lt!44834) (ite c!15225 (index!3144 lt!44852) (index!3147 lt!44852))) (ite c!15234 (index!3145 lt!44850) (ite c!15228 (index!3144 lt!44859) (index!3147 lt!44859)))) (bvadd (mask!6464 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!9011 d!24145))

(declare-fun b!91900 () Bool)

(declare-fun e!59931 () Bool)

(declare-fun call!9041 () Bool)

(assert (=> b!91900 (= e!59931 call!9041)))

(declare-fun b!91901 () Bool)

(declare-fun e!59929 () Bool)

(declare-fun e!59930 () Bool)

(assert (=> b!91901 (= e!59929 e!59930)))

(declare-fun c!15278 () Bool)

(assert (=> b!91901 (= c!15278 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun b!91902 () Bool)

(assert (=> b!91902 (= e!59930 e!59931)))

(declare-fun lt!44953 () (_ BitVec 64))

(assert (=> b!91902 (= lt!44953 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000))))

(declare-fun lt!44955 () Unit!2718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4111 (_ BitVec 64) (_ BitVec 32)) Unit!2718)

(assert (=> b!91902 (= lt!44955 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4084 (_2!1138 lt!44500)) lt!44953 #b00000000000000000000000000000000))))

(assert (=> b!91902 (arrayContainsKey!0 (_keys!4084 (_2!1138 lt!44500)) lt!44953 #b00000000000000000000000000000000)))

(declare-fun lt!44954 () Unit!2718)

(assert (=> b!91902 (= lt!44954 lt!44955)))

(declare-fun res!46754 () Bool)

(assert (=> b!91902 (= res!46754 (= (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000) (_keys!4084 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500))) (Found!251 #b00000000000000000000000000000000)))))

(assert (=> b!91902 (=> (not res!46754) (not e!59931))))

(declare-fun b!91903 () Bool)

(assert (=> b!91903 (= e!59930 call!9041)))

(declare-fun d!24147 () Bool)

(declare-fun res!46753 () Bool)

(assert (=> d!24147 (=> res!46753 e!59929)))

(assert (=> d!24147 (= res!46753 (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(assert (=> d!24147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4084 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500))) e!59929)))

(declare-fun bm!9038 () Bool)

(assert (=> bm!9038 (= call!9041 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4084 (_2!1138 lt!44500)) (mask!6464 (_2!1138 lt!44500))))))

(assert (= (and d!24147 (not res!46753)) b!91901))

(assert (= (and b!91901 c!15278) b!91902))

(assert (= (and b!91901 (not c!15278)) b!91903))

(assert (= (and b!91902 res!46754) b!91900))

(assert (= (or b!91900 b!91903) bm!9038))

(assert (=> b!91901 m!98547))

(assert (=> b!91901 m!98547))

(assert (=> b!91901 m!98549))

(assert (=> b!91902 m!98547))

(declare-fun m!98655 () Bool)

(assert (=> b!91902 m!98655))

(declare-fun m!98657 () Bool)

(assert (=> b!91902 m!98657))

(assert (=> b!91902 m!98547))

(declare-fun m!98659 () Bool)

(assert (=> b!91902 m!98659))

(declare-fun m!98661 () Bool)

(assert (=> bm!9038 m!98661))

(assert (=> b!91509 d!24147))

(declare-fun b!91904 () Bool)

(declare-fun e!59934 () Bool)

(declare-fun call!9042 () Bool)

(assert (=> b!91904 (= e!59934 call!9042)))

(declare-fun b!91905 () Bool)

(assert (=> b!91905 (= e!59934 call!9042)))

(declare-fun c!15279 () Bool)

(declare-fun bm!9039 () Bool)

(assert (=> bm!9039 (= call!9042 (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!15279 (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!15187 (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553) Nil!1553)) (ite c!15187 (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553) Nil!1553))))))

(declare-fun b!91906 () Bool)

(declare-fun e!59933 () Bool)

(declare-fun e!59932 () Bool)

(assert (=> b!91906 (= e!59933 e!59932)))

(declare-fun res!46755 () Bool)

(assert (=> b!91906 (=> (not res!46755) (not e!59932))))

(declare-fun e!59935 () Bool)

(assert (=> b!91906 (= res!46755 (not e!59935))))

(declare-fun res!46757 () Bool)

(assert (=> b!91906 (=> (not res!46757) (not e!59935))))

(assert (=> b!91906 (= res!46757 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!91908 () Bool)

(assert (=> b!91908 (= e!59932 e!59934)))

(assert (=> b!91908 (= c!15279 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!24149 () Bool)

(declare-fun res!46756 () Bool)

(assert (=> d!24149 (=> res!46756 e!59933)))

(assert (=> d!24149 (= res!46756 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> d!24149 (= (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15187 (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553) Nil!1553)) e!59933)))

(declare-fun b!91907 () Bool)

(assert (=> b!91907 (= e!59935 (contains!774 (ite c!15187 (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553) Nil!1553) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!24149 (not res!46756)) b!91906))

(assert (= (and b!91906 res!46757) b!91907))

(assert (= (and b!91906 res!46755) b!91908))

(assert (= (and b!91908 c!15279) b!91904))

(assert (= (and b!91908 (not c!15279)) b!91905))

(assert (= (or b!91904 b!91905) bm!9039))

(declare-fun m!98663 () Bool)

(assert (=> bm!9039 m!98663))

(declare-fun m!98665 () Bool)

(assert (=> bm!9039 m!98665))

(assert (=> b!91906 m!98663))

(assert (=> b!91906 m!98663))

(declare-fun m!98667 () Bool)

(assert (=> b!91906 m!98667))

(assert (=> b!91908 m!98663))

(assert (=> b!91908 m!98663))

(assert (=> b!91908 m!98667))

(assert (=> b!91907 m!98663))

(assert (=> b!91907 m!98663))

(declare-fun m!98669 () Bool)

(assert (=> b!91907 m!98669))

(assert (=> bm!8948 d!24149))

(declare-fun d!24151 () Bool)

(declare-fun lt!44956 () Bool)

(assert (=> d!24151 (= lt!44956 (select (content!95 (toList!754 lt!44739)) lt!44495))))

(declare-fun e!59937 () Bool)

(assert (=> d!24151 (= lt!44956 e!59937)))

(declare-fun res!46758 () Bool)

(assert (=> d!24151 (=> (not res!46758) (not e!59937))))

(assert (=> d!24151 (= res!46758 ((_ is Cons!1551) (toList!754 lt!44739)))))

(assert (=> d!24151 (= (contains!773 (toList!754 lt!44739) lt!44495) lt!44956)))

(declare-fun b!91909 () Bool)

(declare-fun e!59936 () Bool)

(assert (=> b!91909 (= e!59937 e!59936)))

(declare-fun res!46759 () Bool)

(assert (=> b!91909 (=> res!46759 e!59936)))

(assert (=> b!91909 (= res!46759 (= (h!2143 (toList!754 lt!44739)) lt!44495))))

(declare-fun b!91910 () Bool)

(assert (=> b!91910 (= e!59936 (contains!773 (t!5380 (toList!754 lt!44739)) lt!44495))))

(assert (= (and d!24151 res!46758) b!91909))

(assert (= (and b!91909 (not res!46759)) b!91910))

(declare-fun m!98671 () Bool)

(assert (=> d!24151 m!98671))

(declare-fun m!98673 () Bool)

(assert (=> d!24151 m!98673))

(declare-fun m!98675 () Bool)

(assert (=> b!91910 m!98675))

(assert (=> b!91579 d!24151))

(declare-fun bm!9040 () Bool)

(declare-fun call!9047 () ListLongMap!1477)

(assert (=> bm!9040 (= call!9047 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!91911 () Bool)

(declare-fun res!46762 () Bool)

(declare-fun e!59950 () Bool)

(assert (=> b!91911 (=> (not res!46762) (not e!59950))))

(declare-fun e!59941 () Bool)

(assert (=> b!91911 (= res!46762 e!59941)))

(declare-fun res!46768 () Bool)

(assert (=> b!91911 (=> res!46768 e!59941)))

(declare-fun e!59946 () Bool)

(assert (=> b!91911 (= res!46768 (not e!59946))))

(declare-fun res!46763 () Bool)

(assert (=> b!91911 (=> (not res!46763) (not e!59946))))

(assert (=> b!91911 (= res!46763 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!91912 () Bool)

(declare-fun e!59948 () ListLongMap!1477)

(declare-fun call!9046 () ListLongMap!1477)

(assert (=> b!91912 (= e!59948 call!9046)))

(declare-fun bm!9041 () Bool)

(declare-fun call!9049 () Bool)

(declare-fun lt!44974 () ListLongMap!1477)

(assert (=> bm!9041 (= call!9049 (contains!772 lt!44974 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9042 () Bool)

(declare-fun call!9045 () Bool)

(assert (=> bm!9042 (= call!9045 (contains!772 lt!44974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91913 () Bool)

(declare-fun c!15281 () Bool)

(assert (=> b!91913 (= c!15281 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59944 () ListLongMap!1477)

(assert (=> b!91913 (= e!59948 e!59944)))

(declare-fun b!91914 () Bool)

(declare-fun e!59945 () Unit!2718)

(declare-fun Unit!2737 () Unit!2718)

(assert (=> b!91914 (= e!59945 Unit!2737)))

(declare-fun b!91915 () Bool)

(assert (=> b!91915 (= e!59946 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!91916 () Bool)

(assert (=> b!91916 (= e!59944 call!9046)))

(declare-fun b!91917 () Bool)

(declare-fun e!59939 () Bool)

(assert (=> b!91917 (= e!59939 (= (apply!87 lt!44974 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 newMap!16)))))

(declare-fun b!91918 () Bool)

(declare-fun e!59949 () Bool)

(assert (=> b!91918 (= e!59949 e!59939)))

(declare-fun res!46760 () Bool)

(assert (=> b!91918 (= res!46760 call!9045)))

(assert (=> b!91918 (=> (not res!46760) (not e!59939))))

(declare-fun b!91919 () Bool)

(declare-fun e!59947 () Bool)

(assert (=> b!91919 (= e!59950 e!59947)))

(declare-fun c!15280 () Bool)

(assert (=> b!91919 (= c!15280 (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9043 () Bool)

(declare-fun call!9044 () ListLongMap!1477)

(declare-fun call!9043 () ListLongMap!1477)

(assert (=> bm!9043 (= call!9044 call!9043)))

(declare-fun b!91920 () Bool)

(declare-fun res!46764 () Bool)

(assert (=> b!91920 (=> (not res!46764) (not e!59950))))

(assert (=> b!91920 (= res!46764 e!59949)))

(declare-fun c!15284 () Bool)

(assert (=> b!91920 (= c!15284 (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91921 () Bool)

(declare-fun e!59943 () Bool)

(assert (=> b!91921 (= e!59943 (= (apply!87 lt!44974 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 newMap!16)))))

(declare-fun b!91922 () Bool)

(declare-fun lt!44960 () Unit!2718)

(assert (=> b!91922 (= e!59945 lt!44960)))

(declare-fun lt!44965 () ListLongMap!1477)

(assert (=> b!91922 (= lt!44965 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44975 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44966 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44966 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!44961 () Unit!2718)

(assert (=> b!91922 (= lt!44961 (addStillContains!63 lt!44965 lt!44975 (zeroValue!2293 newMap!16) lt!44966))))

(assert (=> b!91922 (contains!772 (+!119 lt!44965 (tuple2!2257 lt!44975 (zeroValue!2293 newMap!16))) lt!44966)))

(declare-fun lt!44977 () Unit!2718)

(assert (=> b!91922 (= lt!44977 lt!44961)))

(declare-fun lt!44972 () ListLongMap!1477)

(assert (=> b!91922 (= lt!44972 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44963 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44963 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44970 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44970 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!44959 () Unit!2718)

(assert (=> b!91922 (= lt!44959 (addApplyDifferent!63 lt!44972 lt!44963 (minValue!2293 newMap!16) lt!44970))))

(assert (=> b!91922 (= (apply!87 (+!119 lt!44972 (tuple2!2257 lt!44963 (minValue!2293 newMap!16))) lt!44970) (apply!87 lt!44972 lt!44970))))

(declare-fun lt!44969 () Unit!2718)

(assert (=> b!91922 (= lt!44969 lt!44959)))

(declare-fun lt!44978 () ListLongMap!1477)

(assert (=> b!91922 (= lt!44978 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44957 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44958 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44958 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!44962 () Unit!2718)

(assert (=> b!91922 (= lt!44962 (addApplyDifferent!63 lt!44978 lt!44957 (zeroValue!2293 newMap!16) lt!44958))))

(assert (=> b!91922 (= (apply!87 (+!119 lt!44978 (tuple2!2257 lt!44957 (zeroValue!2293 newMap!16))) lt!44958) (apply!87 lt!44978 lt!44958))))

(declare-fun lt!44976 () Unit!2718)

(assert (=> b!91922 (= lt!44976 lt!44962)))

(declare-fun lt!44968 () ListLongMap!1477)

(assert (=> b!91922 (= lt!44968 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44967 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44967 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44973 () (_ BitVec 64))

(assert (=> b!91922 (= lt!44973 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91922 (= lt!44960 (addApplyDifferent!63 lt!44968 lt!44967 (minValue!2293 newMap!16) lt!44973))))

(assert (=> b!91922 (= (apply!87 (+!119 lt!44968 (tuple2!2257 lt!44967 (minValue!2293 newMap!16))) lt!44973) (apply!87 lt!44968 lt!44973))))

(declare-fun bm!9044 () Bool)

(declare-fun c!15285 () Bool)

(declare-fun call!9048 () ListLongMap!1477)

(declare-fun c!15283 () Bool)

(assert (=> bm!9044 (= call!9048 (+!119 (ite c!15285 call!9047 (ite c!15283 call!9043 call!9044)) (ite (or c!15285 c!15283) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 newMap!16)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16)))))))

(declare-fun bm!9045 () Bool)

(assert (=> bm!9045 (= call!9043 call!9047)))

(declare-fun b!91923 () Bool)

(declare-fun e!59942 () Bool)

(assert (=> b!91923 (= e!59942 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9046 () Bool)

(assert (=> bm!9046 (= call!9046 call!9048)))

(declare-fun d!24153 () Bool)

(assert (=> d!24153 e!59950))

(declare-fun res!46765 () Bool)

(assert (=> d!24153 (=> (not res!46765) (not e!59950))))

(assert (=> d!24153 (= res!46765 (or (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))))

(declare-fun lt!44964 () ListLongMap!1477)

(assert (=> d!24153 (= lt!44974 lt!44964)))

(declare-fun lt!44971 () Unit!2718)

(assert (=> d!24153 (= lt!44971 e!59945)))

(declare-fun c!15282 () Bool)

(assert (=> d!24153 (= c!15282 e!59942)))

(declare-fun res!46766 () Bool)

(assert (=> d!24153 (=> (not res!46766) (not e!59942))))

(assert (=> d!24153 (= res!46766 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun e!59938 () ListLongMap!1477)

(assert (=> d!24153 (= lt!44964 e!59938)))

(assert (=> d!24153 (= c!15285 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24153 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24153 (= (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) lt!44974)))

(declare-fun b!91924 () Bool)

(assert (=> b!91924 (= e!59947 e!59943)))

(declare-fun res!46767 () Bool)

(assert (=> b!91924 (= res!46767 call!9049)))

(assert (=> b!91924 (=> (not res!46767) (not e!59943))))

(declare-fun b!91925 () Bool)

(assert (=> b!91925 (= e!59949 (not call!9045))))

(declare-fun b!91926 () Bool)

(declare-fun e!59940 () Bool)

(assert (=> b!91926 (= e!59941 e!59940)))

(declare-fun res!46761 () Bool)

(assert (=> b!91926 (=> (not res!46761) (not e!59940))))

(assert (=> b!91926 (= res!46761 (contains!772 lt!44974 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!91926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!91927 () Bool)

(assert (=> b!91927 (= e!59940 (= (apply!87 lt!44974 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)) (get!1241 (select (arr!1955 (_values!2388 newMap!16)) #b00000000000000000000000000000000) (dynLambda!355 (defaultEntry!2405 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2203 (_values!2388 newMap!16))))))

(assert (=> b!91927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!91928 () Bool)

(assert (=> b!91928 (= e!59938 (+!119 call!9048 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16))))))

(declare-fun b!91929 () Bool)

(assert (=> b!91929 (= e!59947 (not call!9049))))

(declare-fun b!91930 () Bool)

(assert (=> b!91930 (= e!59944 call!9044)))

(declare-fun b!91931 () Bool)

(assert (=> b!91931 (= e!59938 e!59948)))

(assert (=> b!91931 (= c!15283 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!24153 c!15285) b!91928))

(assert (= (and d!24153 (not c!15285)) b!91931))

(assert (= (and b!91931 c!15283) b!91912))

(assert (= (and b!91931 (not c!15283)) b!91913))

(assert (= (and b!91913 c!15281) b!91916))

(assert (= (and b!91913 (not c!15281)) b!91930))

(assert (= (or b!91916 b!91930) bm!9043))

(assert (= (or b!91912 bm!9043) bm!9045))

(assert (= (or b!91912 b!91916) bm!9046))

(assert (= (or b!91928 bm!9045) bm!9040))

(assert (= (or b!91928 bm!9046) bm!9044))

(assert (= (and d!24153 res!46766) b!91923))

(assert (= (and d!24153 c!15282) b!91922))

(assert (= (and d!24153 (not c!15282)) b!91914))

(assert (= (and d!24153 res!46765) b!91911))

(assert (= (and b!91911 res!46763) b!91915))

(assert (= (and b!91911 (not res!46768)) b!91926))

(assert (= (and b!91926 res!46761) b!91927))

(assert (= (and b!91911 res!46762) b!91920))

(assert (= (and b!91920 c!15284) b!91918))

(assert (= (and b!91920 (not c!15284)) b!91925))

(assert (= (and b!91918 res!46760) b!91917))

(assert (= (or b!91918 b!91925) bm!9042))

(assert (= (and b!91920 res!46764) b!91919))

(assert (= (and b!91919 c!15280) b!91924))

(assert (= (and b!91919 (not c!15280)) b!91929))

(assert (= (and b!91924 res!46767) b!91921))

(assert (= (or b!91924 b!91929) bm!9041))

(declare-fun b_lambda!4057 () Bool)

(assert (=> (not b_lambda!4057) (not b!91927)))

(assert (=> b!91927 t!5391))

(declare-fun b_and!5581 () Bool)

(assert (= b_and!5577 (and (=> t!5391 result!3093) b_and!5581)))

(assert (=> b!91927 t!5393))

(declare-fun b_and!5583 () Bool)

(assert (= b_and!5579 (and (=> t!5393 result!3095) b_and!5583)))

(assert (=> b!91915 m!98447))

(assert (=> b!91915 m!98447))

(assert (=> b!91915 m!98449))

(declare-fun m!98677 () Bool)

(assert (=> bm!9042 m!98677))

(declare-fun m!98679 () Bool)

(assert (=> bm!9040 m!98679))

(declare-fun m!98681 () Bool)

(assert (=> b!91922 m!98681))

(declare-fun m!98683 () Bool)

(assert (=> b!91922 m!98683))

(declare-fun m!98685 () Bool)

(assert (=> b!91922 m!98685))

(assert (=> b!91922 m!98681))

(declare-fun m!98687 () Bool)

(assert (=> b!91922 m!98687))

(declare-fun m!98689 () Bool)

(assert (=> b!91922 m!98689))

(assert (=> b!91922 m!98447))

(declare-fun m!98691 () Bool)

(assert (=> b!91922 m!98691))

(declare-fun m!98693 () Bool)

(assert (=> b!91922 m!98693))

(assert (=> b!91922 m!98687))

(declare-fun m!98695 () Bool)

(assert (=> b!91922 m!98695))

(declare-fun m!98697 () Bool)

(assert (=> b!91922 m!98697))

(declare-fun m!98699 () Bool)

(assert (=> b!91922 m!98699))

(assert (=> b!91922 m!98689))

(declare-fun m!98701 () Bool)

(assert (=> b!91922 m!98701))

(declare-fun m!98703 () Bool)

(assert (=> b!91922 m!98703))

(assert (=> b!91922 m!98679))

(assert (=> b!91922 m!98703))

(declare-fun m!98705 () Bool)

(assert (=> b!91922 m!98705))

(declare-fun m!98707 () Bool)

(assert (=> b!91922 m!98707))

(declare-fun m!98709 () Bool)

(assert (=> b!91922 m!98709))

(assert (=> b!91923 m!98447))

(assert (=> b!91923 m!98447))

(assert (=> b!91923 m!98449))

(declare-fun m!98711 () Bool)

(assert (=> b!91921 m!98711))

(assert (=> b!91926 m!98447))

(assert (=> b!91926 m!98447))

(declare-fun m!98713 () Bool)

(assert (=> b!91926 m!98713))

(assert (=> b!91927 m!98489))

(assert (=> b!91927 m!98447))

(declare-fun m!98715 () Bool)

(assert (=> b!91927 m!98715))

(assert (=> b!91927 m!98489))

(declare-fun m!98717 () Bool)

(assert (=> b!91927 m!98717))

(assert (=> b!91927 m!98447))

(declare-fun m!98719 () Bool)

(assert (=> b!91927 m!98719))

(assert (=> b!91927 m!98715))

(assert (=> d!24153 m!98497))

(declare-fun m!98721 () Bool)

(assert (=> b!91928 m!98721))

(declare-fun m!98723 () Bool)

(assert (=> bm!9044 m!98723))

(declare-fun m!98725 () Bool)

(assert (=> bm!9041 m!98725))

(declare-fun m!98727 () Bool)

(assert (=> b!91917 m!98727))

(assert (=> b!91726 d!24153))

(declare-fun d!24155 () Bool)

(assert (=> d!24155 (= (apply!87 lt!44707 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1244 (getValueByKey!143 (toList!754 lt!44707) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3804 () Bool)

(assert (= bs!3804 d!24155))

(assert (=> bs!3804 m!98109))

(declare-fun m!98729 () Bool)

(assert (=> bs!3804 m!98729))

(assert (=> bs!3804 m!98729))

(declare-fun m!98731 () Bool)

(assert (=> bs!3804 m!98731))

(assert (=> b!91549 d!24155))

(declare-fun d!24157 () Bool)

(declare-fun c!15286 () Bool)

(assert (=> d!24157 (= c!15286 ((_ is ValueCellFull!947) (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!59951 () V!3089)

(assert (=> d!24157 (= (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59951)))

(declare-fun b!91932 () Bool)

(assert (=> b!91932 (= e!59951 (get!1242 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91933 () Bool)

(assert (=> b!91933 (= e!59951 (get!1243 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24157 c!15286) b!91932))

(assert (= (and d!24157 (not c!15286)) b!91933))

(assert (=> b!91932 m!98149))

(assert (=> b!91932 m!97923))

(declare-fun m!98733 () Bool)

(assert (=> b!91932 m!98733))

(assert (=> b!91933 m!98149))

(assert (=> b!91933 m!97923))

(declare-fun m!98735 () Bool)

(assert (=> b!91933 m!98735))

(assert (=> b!91549 d!24157))

(declare-fun d!24159 () Bool)

(declare-fun e!59954 () Bool)

(assert (=> d!24159 e!59954))

(declare-fun res!46774 () Bool)

(assert (=> d!24159 (=> (not res!46774) (not e!59954))))

(declare-fun lt!44984 () SeekEntryResult!251)

(assert (=> d!24159 (= res!46774 ((_ is Found!251) lt!44984))))

(assert (=> d!24159 (= lt!44984 (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(declare-fun lt!44983 () Unit!2718)

(declare-fun choose!553 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2718)

(assert (=> d!24159 (= lt!44983 (choose!553 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24159 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24159 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)) lt!44983)))

(declare-fun b!91938 () Bool)

(declare-fun res!46773 () Bool)

(assert (=> b!91938 (=> (not res!46773) (not e!59954))))

(assert (=> b!91938 (= res!46773 (inRange!0 (index!3145 lt!44984) (mask!6464 newMap!16)))))

(declare-fun b!91939 () Bool)

(assert (=> b!91939 (= e!59954 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44984)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!91939 (and (bvsge (index!3145 lt!44984) #b00000000000000000000000000000000) (bvslt (index!3145 lt!44984) (size!2202 (_keys!4084 newMap!16))))))

(assert (= (and d!24159 res!46774) b!91938))

(assert (= (and b!91938 res!46773) b!91939))

(assert (=> d!24159 m!97899))

(assert (=> d!24159 m!98381))

(assert (=> d!24159 m!97899))

(declare-fun m!98737 () Bool)

(assert (=> d!24159 m!98737))

(assert (=> d!24159 m!98497))

(declare-fun m!98739 () Bool)

(assert (=> b!91938 m!98739))

(declare-fun m!98741 () Bool)

(assert (=> b!91939 m!98741))

(assert (=> bm!9006 d!24159))

(declare-fun d!24161 () Bool)

(declare-fun e!59955 () Bool)

(assert (=> d!24161 e!59955))

(declare-fun res!46775 () Bool)

(assert (=> d!24161 (=> res!46775 e!59955)))

(declare-fun lt!44988 () Bool)

(assert (=> d!24161 (= res!46775 (not lt!44988))))

(declare-fun lt!44986 () Bool)

(assert (=> d!24161 (= lt!44988 lt!44986)))

(declare-fun lt!44987 () Unit!2718)

(declare-fun e!59956 () Unit!2718)

(assert (=> d!24161 (= lt!44987 e!59956)))

(declare-fun c!15287 () Bool)

(assert (=> d!24161 (= c!15287 lt!44986)))

(assert (=> d!24161 (= lt!44986 (containsKey!147 (toList!754 lt!44707) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!24161 (= (contains!772 lt!44707 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!44988)))

(declare-fun b!91940 () Bool)

(declare-fun lt!44985 () Unit!2718)

(assert (=> b!91940 (= e!59956 lt!44985)))

(assert (=> b!91940 (= lt!44985 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44707) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91940 (isDefined!97 (getValueByKey!143 (toList!754 lt!44707) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91941 () Bool)

(declare-fun Unit!2738 () Unit!2718)

(assert (=> b!91941 (= e!59956 Unit!2738)))

(declare-fun b!91942 () Bool)

(assert (=> b!91942 (= e!59955 (isDefined!97 (getValueByKey!143 (toList!754 lt!44707) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!24161 c!15287) b!91940))

(assert (= (and d!24161 (not c!15287)) b!91941))

(assert (= (and d!24161 (not res!46775)) b!91942))

(assert (=> d!24161 m!98109))

(declare-fun m!98743 () Bool)

(assert (=> d!24161 m!98743))

(assert (=> b!91940 m!98109))

(declare-fun m!98745 () Bool)

(assert (=> b!91940 m!98745))

(assert (=> b!91940 m!98109))

(assert (=> b!91940 m!98729))

(assert (=> b!91940 m!98729))

(declare-fun m!98747 () Bool)

(assert (=> b!91940 m!98747))

(assert (=> b!91942 m!98109))

(assert (=> b!91942 m!98729))

(assert (=> b!91942 m!98729))

(assert (=> b!91942 m!98747))

(assert (=> b!91553 d!24161))

(declare-fun d!24163 () Bool)

(declare-fun e!59957 () Bool)

(assert (=> d!24163 e!59957))

(declare-fun res!46776 () Bool)

(assert (=> d!24163 (=> (not res!46776) (not e!59957))))

(declare-fun lt!44989 () ListLongMap!1477)

(assert (=> d!24163 (= res!46776 (contains!772 lt!44989 (_1!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun lt!44992 () List!1555)

(assert (=> d!24163 (= lt!44989 (ListLongMap!1478 lt!44992))))

(declare-fun lt!44991 () Unit!2718)

(declare-fun lt!44990 () Unit!2718)

(assert (=> d!24163 (= lt!44991 lt!44990)))

(assert (=> d!24163 (= (getValueByKey!143 lt!44992 (_1!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))) (Some!148 (_2!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(assert (=> d!24163 (= lt!44990 (lemmaContainsTupThenGetReturnValue!63 lt!44992 (_1!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (_2!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(assert (=> d!24163 (= lt!44992 (insertStrictlySorted!66 (toList!754 (ite c!15181 call!8946 (ite c!15179 call!8942 call!8943))) (_1!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (_2!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(assert (=> d!24163 (= (+!119 (ite c!15181 call!8946 (ite c!15179 call!8942 call!8943)) (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44989)))

(declare-fun b!91943 () Bool)

(declare-fun res!46777 () Bool)

(assert (=> b!91943 (=> (not res!46777) (not e!59957))))

(assert (=> b!91943 (= res!46777 (= (getValueByKey!143 (toList!754 lt!44989) (_1!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))) (Some!148 (_2!1139 (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))))

(declare-fun b!91944 () Bool)

(assert (=> b!91944 (= e!59957 (contains!773 (toList!754 lt!44989) (ite (or c!15181 c!15179) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (= (and d!24163 res!46776) b!91943))

(assert (= (and b!91943 res!46777) b!91944))

(declare-fun m!98749 () Bool)

(assert (=> d!24163 m!98749))

(declare-fun m!98751 () Bool)

(assert (=> d!24163 m!98751))

(declare-fun m!98753 () Bool)

(assert (=> d!24163 m!98753))

(declare-fun m!98755 () Bool)

(assert (=> d!24163 m!98755))

(declare-fun m!98757 () Bool)

(assert (=> b!91943 m!98757))

(declare-fun m!98759 () Bool)

(assert (=> b!91944 m!98759))

(assert (=> bm!8943 d!24163))

(declare-fun d!24165 () Bool)

(declare-fun res!46778 () Bool)

(declare-fun e!59958 () Bool)

(assert (=> d!24165 (=> (not res!46778) (not e!59958))))

(assert (=> d!24165 (= res!46778 (simpleValid!63 (_2!1138 lt!44835)))))

(assert (=> d!24165 (= (valid!362 (_2!1138 lt!44835)) e!59958)))

(declare-fun b!91945 () Bool)

(declare-fun res!46779 () Bool)

(assert (=> b!91945 (=> (not res!46779) (not e!59958))))

(assert (=> b!91945 (= res!46779 (= (arrayCountValidKeys!0 (_keys!4084 (_2!1138 lt!44835)) #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44835)))) (_size!450 (_2!1138 lt!44835))))))

(declare-fun b!91946 () Bool)

(declare-fun res!46780 () Bool)

(assert (=> b!91946 (=> (not res!46780) (not e!59958))))

(assert (=> b!91946 (= res!46780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4084 (_2!1138 lt!44835)) (mask!6464 (_2!1138 lt!44835))))))

(declare-fun b!91947 () Bool)

(assert (=> b!91947 (= e!59958 (arrayNoDuplicates!0 (_keys!4084 (_2!1138 lt!44835)) #b00000000000000000000000000000000 Nil!1553))))

(assert (= (and d!24165 res!46778) b!91945))

(assert (= (and b!91945 res!46779) b!91946))

(assert (= (and b!91946 res!46780) b!91947))

(declare-fun m!98761 () Bool)

(assert (=> d!24165 m!98761))

(declare-fun m!98763 () Bool)

(assert (=> b!91945 m!98763))

(declare-fun m!98765 () Bool)

(assert (=> b!91946 m!98765))

(declare-fun m!98767 () Bool)

(assert (=> b!91947 m!98767))

(assert (=> d!24095 d!24165))

(assert (=> d!24095 d!24041))

(assert (=> bm!8929 d!24053))

(declare-fun b!91948 () Bool)

(declare-fun e!59961 () Bool)

(declare-fun call!9050 () Bool)

(assert (=> b!91948 (= e!59961 call!9050)))

(declare-fun b!91949 () Bool)

(assert (=> b!91949 (= e!59961 call!9050)))

(declare-fun bm!9047 () Bool)

(declare-fun c!15288 () Bool)

(assert (=> bm!9047 (= call!9050 (arrayNoDuplicates!0 (_keys!4084 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!15288 (Cons!1552 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000) Nil!1553) Nil!1553)))))

(declare-fun b!91950 () Bool)

(declare-fun e!59960 () Bool)

(declare-fun e!59959 () Bool)

(assert (=> b!91950 (= e!59960 e!59959)))

(declare-fun res!46781 () Bool)

(assert (=> b!91950 (=> (not res!46781) (not e!59959))))

(declare-fun e!59962 () Bool)

(assert (=> b!91950 (= res!46781 (not e!59962))))

(declare-fun res!46783 () Bool)

(assert (=> b!91950 (=> (not res!46783) (not e!59962))))

(assert (=> b!91950 (= res!46783 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!91952 () Bool)

(assert (=> b!91952 (= e!59959 e!59961)))

(assert (=> b!91952 (= c!15288 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!24167 () Bool)

(declare-fun res!46782 () Bool)

(assert (=> d!24167 (=> res!46782 e!59960)))

(assert (=> d!24167 (= res!46782 (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(assert (=> d!24167 (= (arrayNoDuplicates!0 (_keys!4084 newMap!16) #b00000000000000000000000000000000 Nil!1553) e!59960)))

(declare-fun b!91951 () Bool)

(assert (=> b!91951 (= e!59962 (contains!774 Nil!1553 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!24167 (not res!46782)) b!91950))

(assert (= (and b!91950 res!46783) b!91951))

(assert (= (and b!91950 res!46781) b!91952))

(assert (= (and b!91952 c!15288) b!91948))

(assert (= (and b!91952 (not c!15288)) b!91949))

(assert (= (or b!91948 b!91949) bm!9047))

(assert (=> bm!9047 m!98447))

(declare-fun m!98769 () Bool)

(assert (=> bm!9047 m!98769))

(assert (=> b!91950 m!98447))

(assert (=> b!91950 m!98447))

(assert (=> b!91950 m!98449))

(assert (=> b!91952 m!98447))

(assert (=> b!91952 m!98447))

(assert (=> b!91952 m!98449))

(assert (=> b!91951 m!98447))

(assert (=> b!91951 m!98447))

(declare-fun m!98771 () Bool)

(assert (=> b!91951 m!98771))

(assert (=> b!91444 d!24167))

(declare-fun d!24169 () Bool)

(declare-fun e!59963 () Bool)

(assert (=> d!24169 e!59963))

(declare-fun res!46784 () Bool)

(assert (=> d!24169 (=> res!46784 e!59963)))

(declare-fun lt!44996 () Bool)

(assert (=> d!24169 (= res!46784 (not lt!44996))))

(declare-fun lt!44994 () Bool)

(assert (=> d!24169 (= lt!44996 lt!44994)))

(declare-fun lt!44995 () Unit!2718)

(declare-fun e!59964 () Unit!2718)

(assert (=> d!24169 (= lt!44995 e!59964)))

(declare-fun c!15289 () Bool)

(assert (=> d!24169 (= c!15289 lt!44994)))

(assert (=> d!24169 (= lt!44994 (containsKey!147 (toList!754 lt!44739) (_1!1139 lt!44495)))))

(assert (=> d!24169 (= (contains!772 lt!44739 (_1!1139 lt!44495)) lt!44996)))

(declare-fun b!91953 () Bool)

(declare-fun lt!44993 () Unit!2718)

(assert (=> b!91953 (= e!59964 lt!44993)))

(assert (=> b!91953 (= lt!44993 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44739) (_1!1139 lt!44495)))))

(assert (=> b!91953 (isDefined!97 (getValueByKey!143 (toList!754 lt!44739) (_1!1139 lt!44495)))))

(declare-fun b!91954 () Bool)

(declare-fun Unit!2739 () Unit!2718)

(assert (=> b!91954 (= e!59964 Unit!2739)))

(declare-fun b!91955 () Bool)

(assert (=> b!91955 (= e!59963 (isDefined!97 (getValueByKey!143 (toList!754 lt!44739) (_1!1139 lt!44495))))))

(assert (= (and d!24169 c!15289) b!91953))

(assert (= (and d!24169 (not c!15289)) b!91954))

(assert (= (and d!24169 (not res!46784)) b!91955))

(declare-fun m!98773 () Bool)

(assert (=> d!24169 m!98773))

(declare-fun m!98775 () Bool)

(assert (=> b!91953 m!98775))

(assert (=> b!91953 m!98287))

(assert (=> b!91953 m!98287))

(declare-fun m!98777 () Bool)

(assert (=> b!91953 m!98777))

(assert (=> b!91955 m!98287))

(assert (=> b!91955 m!98287))

(assert (=> b!91955 m!98777))

(assert (=> d!24059 d!24169))

(declare-fun d!24171 () Bool)

(declare-fun c!15290 () Bool)

(assert (=> d!24171 (= c!15290 (and ((_ is Cons!1551) lt!44742) (= (_1!1139 (h!2143 lt!44742)) (_1!1139 lt!44495))))))

(declare-fun e!59965 () Option!149)

(assert (=> d!24171 (= (getValueByKey!143 lt!44742 (_1!1139 lt!44495)) e!59965)))

(declare-fun b!91958 () Bool)

(declare-fun e!59966 () Option!149)

(assert (=> b!91958 (= e!59966 (getValueByKey!143 (t!5380 lt!44742) (_1!1139 lt!44495)))))

(declare-fun b!91957 () Bool)

(assert (=> b!91957 (= e!59965 e!59966)))

(declare-fun c!15291 () Bool)

(assert (=> b!91957 (= c!15291 (and ((_ is Cons!1551) lt!44742) (not (= (_1!1139 (h!2143 lt!44742)) (_1!1139 lt!44495)))))))

(declare-fun b!91959 () Bool)

(assert (=> b!91959 (= e!59966 None!147)))

(declare-fun b!91956 () Bool)

(assert (=> b!91956 (= e!59965 (Some!148 (_2!1139 (h!2143 lt!44742))))))

(assert (= (and d!24171 c!15290) b!91956))

(assert (= (and d!24171 (not c!15290)) b!91957))

(assert (= (and b!91957 c!15291) b!91958))

(assert (= (and b!91957 (not c!15291)) b!91959))

(declare-fun m!98779 () Bool)

(assert (=> b!91958 m!98779))

(assert (=> d!24059 d!24171))

(declare-fun d!24173 () Bool)

(assert (=> d!24173 (= (getValueByKey!143 lt!44742 (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495)))))

(declare-fun lt!44999 () Unit!2718)

(declare-fun choose!554 (List!1555 (_ BitVec 64) V!3089) Unit!2718)

(assert (=> d!24173 (= lt!44999 (choose!554 lt!44742 (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(declare-fun e!59969 () Bool)

(assert (=> d!24173 e!59969))

(declare-fun res!46789 () Bool)

(assert (=> d!24173 (=> (not res!46789) (not e!59969))))

(assert (=> d!24173 (= res!46789 (isStrictlySorted!296 lt!44742))))

(assert (=> d!24173 (= (lemmaContainsTupThenGetReturnValue!63 lt!44742 (_1!1139 lt!44495) (_2!1139 lt!44495)) lt!44999)))

(declare-fun b!91964 () Bool)

(declare-fun res!46790 () Bool)

(assert (=> b!91964 (=> (not res!46790) (not e!59969))))

(assert (=> b!91964 (= res!46790 (containsKey!147 lt!44742 (_1!1139 lt!44495)))))

(declare-fun b!91965 () Bool)

(assert (=> b!91965 (= e!59969 (contains!773 lt!44742 (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495))))))

(assert (= (and d!24173 res!46789) b!91964))

(assert (= (and b!91964 res!46790) b!91965))

(assert (=> d!24173 m!98281))

(declare-fun m!98781 () Bool)

(assert (=> d!24173 m!98781))

(declare-fun m!98783 () Bool)

(assert (=> d!24173 m!98783))

(declare-fun m!98785 () Bool)

(assert (=> b!91964 m!98785))

(declare-fun m!98787 () Bool)

(assert (=> b!91965 m!98787))

(assert (=> d!24059 d!24173))

(declare-fun b!91986 () Bool)

(declare-fun res!46796 () Bool)

(declare-fun e!59984 () Bool)

(assert (=> b!91986 (=> (not res!46796) (not e!59984))))

(declare-fun lt!45002 () List!1555)

(assert (=> b!91986 (= res!46796 (containsKey!147 lt!45002 (_1!1139 lt!44495)))))

(declare-fun b!91987 () Bool)

(declare-fun e!59983 () List!1555)

(declare-fun call!9057 () List!1555)

(assert (=> b!91987 (= e!59983 call!9057)))

(declare-fun d!24175 () Bool)

(assert (=> d!24175 e!59984))

(declare-fun res!46795 () Bool)

(assert (=> d!24175 (=> (not res!46795) (not e!59984))))

(assert (=> d!24175 (= res!46795 (isStrictlySorted!296 lt!45002))))

(assert (=> d!24175 (= lt!45002 e!59983)))

(declare-fun c!15301 () Bool)

(assert (=> d!24175 (= c!15301 (and ((_ is Cons!1551) (toList!754 (+!119 lt!44498 lt!44489))) (bvslt (_1!1139 (h!2143 (toList!754 (+!119 lt!44498 lt!44489)))) (_1!1139 lt!44495))))))

(assert (=> d!24175 (isStrictlySorted!296 (toList!754 (+!119 lt!44498 lt!44489)))))

(assert (=> d!24175 (= (insertStrictlySorted!66 (toList!754 (+!119 lt!44498 lt!44489)) (_1!1139 lt!44495) (_2!1139 lt!44495)) lt!45002)))

(declare-fun bm!9054 () Bool)

(declare-fun call!9059 () List!1555)

(assert (=> bm!9054 (= call!9059 call!9057)))

(declare-fun b!91988 () Bool)

(declare-fun e!59980 () List!1555)

(assert (=> b!91988 (= e!59983 e!59980)))

(declare-fun c!15300 () Bool)

(assert (=> b!91988 (= c!15300 (and ((_ is Cons!1551) (toList!754 (+!119 lt!44498 lt!44489))) (= (_1!1139 (h!2143 (toList!754 (+!119 lt!44498 lt!44489)))) (_1!1139 lt!44495))))))

(declare-fun b!91989 () Bool)

(declare-fun c!15302 () Bool)

(declare-fun e!59981 () List!1555)

(assert (=> b!91989 (= e!59981 (ite c!15300 (t!5380 (toList!754 (+!119 lt!44498 lt!44489))) (ite c!15302 (Cons!1551 (h!2143 (toList!754 (+!119 lt!44498 lt!44489))) (t!5380 (toList!754 (+!119 lt!44498 lt!44489)))) Nil!1552)))))

(declare-fun b!91990 () Bool)

(declare-fun e!59982 () List!1555)

(declare-fun call!9058 () List!1555)

(assert (=> b!91990 (= e!59982 call!9058)))

(declare-fun b!91991 () Bool)

(assert (=> b!91991 (= e!59982 call!9058)))

(declare-fun b!91992 () Bool)

(assert (=> b!91992 (= e!59980 call!9059)))

(declare-fun bm!9055 () Bool)

(declare-fun $colon$colon!74 (List!1555 tuple2!2256) List!1555)

(assert (=> bm!9055 (= call!9057 ($colon$colon!74 e!59981 (ite c!15301 (h!2143 (toList!754 (+!119 lt!44498 lt!44489))) (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495)))))))

(declare-fun c!15303 () Bool)

(assert (=> bm!9055 (= c!15303 c!15301)))

(declare-fun b!91993 () Bool)

(assert (=> b!91993 (= e!59981 (insertStrictlySorted!66 (t!5380 (toList!754 (+!119 lt!44498 lt!44489))) (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(declare-fun bm!9056 () Bool)

(assert (=> bm!9056 (= call!9058 call!9059)))

(declare-fun b!91994 () Bool)

(assert (=> b!91994 (= c!15302 (and ((_ is Cons!1551) (toList!754 (+!119 lt!44498 lt!44489))) (bvsgt (_1!1139 (h!2143 (toList!754 (+!119 lt!44498 lt!44489)))) (_1!1139 lt!44495))))))

(assert (=> b!91994 (= e!59980 e!59982)))

(declare-fun b!91995 () Bool)

(assert (=> b!91995 (= e!59984 (contains!773 lt!45002 (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495))))))

(assert (= (and d!24175 c!15301) b!91987))

(assert (= (and d!24175 (not c!15301)) b!91988))

(assert (= (and b!91988 c!15300) b!91992))

(assert (= (and b!91988 (not c!15300)) b!91994))

(assert (= (and b!91994 c!15302) b!91990))

(assert (= (and b!91994 (not c!15302)) b!91991))

(assert (= (or b!91990 b!91991) bm!9056))

(assert (= (or b!91992 bm!9056) bm!9054))

(assert (= (or b!91987 bm!9054) bm!9055))

(assert (= (and bm!9055 c!15303) b!91993))

(assert (= (and bm!9055 (not c!15303)) b!91989))

(assert (= (and d!24175 res!46795) b!91986))

(assert (= (and b!91986 res!46796) b!91995))

(declare-fun m!98789 () Bool)

(assert (=> d!24175 m!98789))

(declare-fun m!98791 () Bool)

(assert (=> d!24175 m!98791))

(declare-fun m!98793 () Bool)

(assert (=> bm!9055 m!98793))

(declare-fun m!98795 () Bool)

(assert (=> b!91986 m!98795))

(declare-fun m!98797 () Bool)

(assert (=> b!91993 m!98797))

(declare-fun m!98799 () Bool)

(assert (=> b!91995 m!98799))

(assert (=> d!24059 d!24175))

(declare-fun d!24177 () Bool)

(declare-fun e!59985 () Bool)

(assert (=> d!24177 e!59985))

(declare-fun res!46797 () Bool)

(assert (=> d!24177 (=> res!46797 e!59985)))

(declare-fun lt!45006 () Bool)

(assert (=> d!24177 (= res!46797 (not lt!45006))))

(declare-fun lt!45004 () Bool)

(assert (=> d!24177 (= lt!45006 lt!45004)))

(declare-fun lt!45005 () Unit!2718)

(declare-fun e!59986 () Unit!2718)

(assert (=> d!24177 (= lt!45005 e!59986)))

(declare-fun c!15304 () Bool)

(assert (=> d!24177 (= c!15304 lt!45004)))

(assert (=> d!24177 (= lt!45004 (containsKey!147 (toList!754 lt!44671) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24177 (= (contains!772 lt!44671 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45006)))

(declare-fun b!91996 () Bool)

(declare-fun lt!45003 () Unit!2718)

(assert (=> b!91996 (= e!59986 lt!45003)))

(assert (=> b!91996 (= lt!45003 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44671) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91996 (isDefined!97 (getValueByKey!143 (toList!754 lt!44671) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91997 () Bool)

(declare-fun Unit!2740 () Unit!2718)

(assert (=> b!91997 (= e!59986 Unit!2740)))

(declare-fun b!91998 () Bool)

(assert (=> b!91998 (= e!59985 (isDefined!97 (getValueByKey!143 (toList!754 lt!44671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24177 c!15304) b!91996))

(assert (= (and d!24177 (not c!15304)) b!91997))

(assert (= (and d!24177 (not res!46797)) b!91998))

(declare-fun m!98801 () Bool)

(assert (=> d!24177 m!98801))

(declare-fun m!98803 () Bool)

(assert (=> b!91996 m!98803))

(assert (=> b!91996 m!98631))

(assert (=> b!91996 m!98631))

(declare-fun m!98805 () Bool)

(assert (=> b!91996 m!98805))

(assert (=> b!91998 m!98631))

(assert (=> b!91998 m!98631))

(assert (=> b!91998 m!98805))

(assert (=> bm!8931 d!24177))

(declare-fun d!24179 () Bool)

(declare-fun e!59987 () Bool)

(assert (=> d!24179 e!59987))

(declare-fun res!46798 () Bool)

(assert (=> d!24179 (=> (not res!46798) (not e!59987))))

(declare-fun lt!45007 () ListLongMap!1477)

(assert (=> d!24179 (= res!46798 (contains!772 lt!45007 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45010 () List!1555)

(assert (=> d!24179 (= lt!45007 (ListLongMap!1478 lt!45010))))

(declare-fun lt!45009 () Unit!2718)

(declare-fun lt!45008 () Unit!2718)

(assert (=> d!24179 (= lt!45009 lt!45008)))

(assert (=> d!24179 (= (getValueByKey!143 lt!45010 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24179 (= lt!45008 (lemmaContainsTupThenGetReturnValue!63 lt!45010 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24179 (= lt!45010 (insertStrictlySorted!66 (toList!754 call!8947) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24179 (= (+!119 call!8947 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45007)))

(declare-fun b!91999 () Bool)

(declare-fun res!46799 () Bool)

(assert (=> b!91999 (=> (not res!46799) (not e!59987))))

(assert (=> b!91999 (= res!46799 (= (getValueByKey!143 (toList!754 lt!45007) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92000 () Bool)

(assert (=> b!92000 (= e!59987 (contains!773 (toList!754 lt!45007) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24179 res!46798) b!91999))

(assert (= (and b!91999 res!46799) b!92000))

(declare-fun m!98807 () Bool)

(assert (=> d!24179 m!98807))

(declare-fun m!98809 () Bool)

(assert (=> d!24179 m!98809))

(declare-fun m!98811 () Bool)

(assert (=> d!24179 m!98811))

(declare-fun m!98813 () Bool)

(assert (=> d!24179 m!98813))

(declare-fun m!98815 () Bool)

(assert (=> b!91999 m!98815))

(declare-fun m!98817 () Bool)

(assert (=> b!92000 m!98817))

(assert (=> b!91572 d!24179))

(declare-fun d!24181 () Bool)

(declare-fun e!59988 () Bool)

(assert (=> d!24181 e!59988))

(declare-fun res!46800 () Bool)

(assert (=> d!24181 (=> res!46800 e!59988)))

(declare-fun lt!45014 () Bool)

(assert (=> d!24181 (= res!46800 (not lt!45014))))

(declare-fun lt!45012 () Bool)

(assert (=> d!24181 (= lt!45014 lt!45012)))

(declare-fun lt!45013 () Unit!2718)

(declare-fun e!59989 () Unit!2718)

(assert (=> d!24181 (= lt!45013 e!59989)))

(declare-fun c!15305 () Bool)

(assert (=> d!24181 (= c!15305 lt!45012)))

(assert (=> d!24181 (= lt!45012 (containsKey!147 (toList!754 lt!44707) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24181 (= (contains!772 lt!44707 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45014)))

(declare-fun b!92001 () Bool)

(declare-fun lt!45011 () Unit!2718)

(assert (=> b!92001 (= e!59989 lt!45011)))

(assert (=> b!92001 (= lt!45011 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44707) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92001 (isDefined!97 (getValueByKey!143 (toList!754 lt!44707) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92002 () Bool)

(declare-fun Unit!2741 () Unit!2718)

(assert (=> b!92002 (= e!59989 Unit!2741)))

(declare-fun b!92003 () Bool)

(assert (=> b!92003 (= e!59988 (isDefined!97 (getValueByKey!143 (toList!754 lt!44707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24181 c!15305) b!92001))

(assert (= (and d!24181 (not c!15305)) b!92002))

(assert (= (and d!24181 (not res!46800)) b!92003))

(declare-fun m!98819 () Bool)

(assert (=> d!24181 m!98819))

(declare-fun m!98821 () Bool)

(assert (=> b!92001 m!98821))

(declare-fun m!98823 () Bool)

(assert (=> b!92001 m!98823))

(assert (=> b!92001 m!98823))

(declare-fun m!98825 () Bool)

(assert (=> b!92001 m!98825))

(assert (=> b!92003 m!98823))

(assert (=> b!92003 m!98823))

(assert (=> b!92003 m!98825))

(assert (=> d!24053 d!24181))

(assert (=> d!24053 d!24117))

(declare-fun d!24183 () Bool)

(declare-fun res!46801 () Bool)

(declare-fun e!59990 () Bool)

(assert (=> d!24183 (=> (not res!46801) (not e!59990))))

(assert (=> d!24183 (= res!46801 (simpleValid!63 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24183 (= (valid!362 (v!2713 (underlying!308 thiss!992))) e!59990)))

(declare-fun b!92004 () Bool)

(declare-fun res!46802 () Bool)

(assert (=> b!92004 (=> (not res!46802) (not e!59990))))

(assert (=> b!92004 (= res!46802 (= (arrayCountValidKeys!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000000 (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))) (_size!450 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!92005 () Bool)

(declare-fun res!46803 () Bool)

(assert (=> b!92005 (=> (not res!46803) (not e!59990))))

(assert (=> b!92005 (= res!46803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!92006 () Bool)

(assert (=> b!92006 (= e!59990 (arrayNoDuplicates!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000000 Nil!1553))))

(assert (= (and d!24183 res!46801) b!92004))

(assert (= (and b!92004 res!46802) b!92005))

(assert (= (and b!92005 res!46803) b!92006))

(declare-fun m!98827 () Bool)

(assert (=> d!24183 m!98827))

(declare-fun m!98829 () Bool)

(assert (=> b!92004 m!98829))

(declare-fun m!98831 () Bool)

(assert (=> b!92005 m!98831))

(declare-fun m!98833 () Bool)

(assert (=> b!92006 m!98833))

(assert (=> d!24097 d!24183))

(declare-fun d!24185 () Bool)

(declare-fun e!59991 () Bool)

(assert (=> d!24185 e!59991))

(declare-fun res!46804 () Bool)

(assert (=> d!24185 (=> res!46804 e!59991)))

(declare-fun lt!45018 () Bool)

(assert (=> d!24185 (= res!46804 (not lt!45018))))

(declare-fun lt!45016 () Bool)

(assert (=> d!24185 (= lt!45018 lt!45016)))

(declare-fun lt!45017 () Unit!2718)

(declare-fun e!59992 () Unit!2718)

(assert (=> d!24185 (= lt!45017 e!59992)))

(declare-fun c!15306 () Bool)

(assert (=> d!24185 (= c!15306 lt!45016)))

(assert (=> d!24185 (= lt!45016 (containsKey!147 (toList!754 lt!44730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24185 (= (contains!772 lt!44730 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45018)))

(declare-fun b!92007 () Bool)

(declare-fun lt!45015 () Unit!2718)

(assert (=> b!92007 (= e!59992 lt!45015)))

(assert (=> b!92007 (= lt!45015 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92007 (isDefined!97 (getValueByKey!143 (toList!754 lt!44730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92008 () Bool)

(declare-fun Unit!2742 () Unit!2718)

(assert (=> b!92008 (= e!59992 Unit!2742)))

(declare-fun b!92009 () Bool)

(assert (=> b!92009 (= e!59991 (isDefined!97 (getValueByKey!143 (toList!754 lt!44730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24185 c!15306) b!92007))

(assert (= (and d!24185 (not c!15306)) b!92008))

(assert (= (and d!24185 (not res!46804)) b!92009))

(declare-fun m!98835 () Bool)

(assert (=> d!24185 m!98835))

(declare-fun m!98837 () Bool)

(assert (=> b!92007 m!98837))

(declare-fun m!98839 () Bool)

(assert (=> b!92007 m!98839))

(assert (=> b!92007 m!98839))

(declare-fun m!98841 () Bool)

(assert (=> b!92007 m!98841))

(assert (=> b!92009 m!98839))

(assert (=> b!92009 m!98839))

(assert (=> b!92009 m!98841))

(assert (=> bm!8940 d!24185))

(declare-fun d!24187 () Bool)

(declare-fun e!59993 () Bool)

(assert (=> d!24187 e!59993))

(declare-fun res!46805 () Bool)

(assert (=> d!24187 (=> (not res!46805) (not e!59993))))

(declare-fun lt!45019 () ListLongMap!1477)

(assert (=> d!24187 (= res!46805 (contains!772 lt!45019 (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45022 () List!1555)

(assert (=> d!24187 (= lt!45019 (ListLongMap!1478 lt!45022))))

(declare-fun lt!45021 () Unit!2718)

(declare-fun lt!45020 () Unit!2718)

(assert (=> d!24187 (= lt!45021 lt!45020)))

(assert (=> d!24187 (= (getValueByKey!143 lt!45022 (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24187 (= lt!45020 (lemmaContainsTupThenGetReturnValue!63 lt!45022 (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24187 (= lt!45022 (insertStrictlySorted!66 (toList!754 lt!44485) (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24187 (= (+!119 lt!44485 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45019)))

(declare-fun b!92010 () Bool)

(declare-fun res!46806 () Bool)

(assert (=> b!92010 (=> (not res!46806) (not e!59993))))

(assert (=> b!92010 (= res!46806 (= (getValueByKey!143 (toList!754 lt!45019) (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92011 () Bool)

(assert (=> b!92011 (= e!59993 (contains!773 (toList!754 lt!45019) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24187 res!46805) b!92010))

(assert (= (and b!92010 res!46806) b!92011))

(declare-fun m!98843 () Bool)

(assert (=> d!24187 m!98843))

(declare-fun m!98845 () Bool)

(assert (=> d!24187 m!98845))

(declare-fun m!98847 () Bool)

(assert (=> d!24187 m!98847))

(declare-fun m!98849 () Bool)

(assert (=> d!24187 m!98849))

(declare-fun m!98851 () Bool)

(assert (=> b!92010 m!98851))

(declare-fun m!98853 () Bool)

(assert (=> b!92011 m!98853))

(assert (=> d!24063 d!24187))

(declare-fun d!24189 () Bool)

(declare-fun e!59994 () Bool)

(assert (=> d!24189 e!59994))

(declare-fun res!46807 () Bool)

(assert (=> d!24189 (=> (not res!46807) (not e!59994))))

(declare-fun lt!45023 () ListLongMap!1477)

(assert (=> d!24189 (= res!46807 (contains!772 lt!45023 (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45026 () List!1555)

(assert (=> d!24189 (= lt!45023 (ListLongMap!1478 lt!45026))))

(declare-fun lt!45025 () Unit!2718)

(declare-fun lt!45024 () Unit!2718)

(assert (=> d!24189 (= lt!45025 lt!45024)))

(assert (=> d!24189 (= (getValueByKey!143 lt!45026 (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24189 (= lt!45024 (lemmaContainsTupThenGetReturnValue!63 lt!45026 (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24189 (= lt!45026 (insertStrictlySorted!66 (toList!754 (+!119 lt!44485 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24189 (= (+!119 (+!119 lt!44485 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45023)))

(declare-fun b!92012 () Bool)

(declare-fun res!46808 () Bool)

(assert (=> b!92012 (=> (not res!46808) (not e!59994))))

(assert (=> b!92012 (= res!46808 (= (getValueByKey!143 (toList!754 lt!45023) (_1!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92013 () Bool)

(assert (=> b!92013 (= e!59994 (contains!773 (toList!754 lt!45023) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24189 res!46807) b!92012))

(assert (= (and b!92012 res!46808) b!92013))

(declare-fun m!98855 () Bool)

(assert (=> d!24189 m!98855))

(declare-fun m!98857 () Bool)

(assert (=> d!24189 m!98857))

(declare-fun m!98859 () Bool)

(assert (=> d!24189 m!98859))

(declare-fun m!98861 () Bool)

(assert (=> d!24189 m!98861))

(declare-fun m!98863 () Bool)

(assert (=> b!92012 m!98863))

(declare-fun m!98865 () Bool)

(assert (=> b!92013 m!98865))

(assert (=> d!24063 d!24189))

(declare-fun d!24191 () Bool)

(assert (=> d!24191 (= (+!119 (+!119 lt!44485 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (+!119 (+!119 lt!44485 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (=> d!24191 true))

(declare-fun _$28!154 () Unit!2718)

(assert (=> d!24191 (= (choose!550 lt!44485 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) _$28!154)))

(declare-fun bs!3805 () Bool)

(assert (= bs!3805 d!24191))

(assert (=> bs!3805 m!98307))

(assert (=> bs!3805 m!98307))

(assert (=> bs!3805 m!98309))

(assert (=> bs!3805 m!98303))

(assert (=> bs!3805 m!98303))

(assert (=> bs!3805 m!98305))

(assert (=> d!24063 d!24191))

(declare-fun d!24193 () Bool)

(declare-fun e!59995 () Bool)

(assert (=> d!24193 e!59995))

(declare-fun res!46809 () Bool)

(assert (=> d!24193 (=> (not res!46809) (not e!59995))))

(declare-fun lt!45027 () ListLongMap!1477)

(assert (=> d!24193 (= res!46809 (contains!772 lt!45027 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun lt!45030 () List!1555)

(assert (=> d!24193 (= lt!45027 (ListLongMap!1478 lt!45030))))

(declare-fun lt!45029 () Unit!2718)

(declare-fun lt!45028 () Unit!2718)

(assert (=> d!24193 (= lt!45029 lt!45028)))

(assert (=> d!24193 (= (getValueByKey!143 lt!45030 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24193 (= lt!45028 (lemmaContainsTupThenGetReturnValue!63 lt!45030 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24193 (= lt!45030 (insertStrictlySorted!66 (toList!754 (+!119 lt!44485 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24193 (= (+!119 (+!119 lt!44485 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) lt!45027)))

(declare-fun b!92014 () Bool)

(declare-fun res!46810 () Bool)

(assert (=> b!92014 (=> (not res!46810) (not e!59995))))

(assert (=> b!92014 (= res!46810 (= (getValueByKey!143 (toList!754 lt!45027) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(declare-fun b!92015 () Bool)

(assert (=> b!92015 (= e!59995 (contains!773 (toList!754 lt!45027) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (= (and d!24193 res!46809) b!92014))

(assert (= (and b!92014 res!46810) b!92015))

(declare-fun m!98867 () Bool)

(assert (=> d!24193 m!98867))

(declare-fun m!98869 () Bool)

(assert (=> d!24193 m!98869))

(declare-fun m!98871 () Bool)

(assert (=> d!24193 m!98871))

(declare-fun m!98873 () Bool)

(assert (=> d!24193 m!98873))

(declare-fun m!98875 () Bool)

(assert (=> b!92014 m!98875))

(declare-fun m!98877 () Bool)

(assert (=> b!92015 m!98877))

(assert (=> d!24063 d!24193))

(declare-fun d!24195 () Bool)

(declare-fun e!59996 () Bool)

(assert (=> d!24195 e!59996))

(declare-fun res!46811 () Bool)

(assert (=> d!24195 (=> (not res!46811) (not e!59996))))

(declare-fun lt!45031 () ListLongMap!1477)

(assert (=> d!24195 (= res!46811 (contains!772 lt!45031 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun lt!45034 () List!1555)

(assert (=> d!24195 (= lt!45031 (ListLongMap!1478 lt!45034))))

(declare-fun lt!45033 () Unit!2718)

(declare-fun lt!45032 () Unit!2718)

(assert (=> d!24195 (= lt!45033 lt!45032)))

(assert (=> d!24195 (= (getValueByKey!143 lt!45034 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24195 (= lt!45032 (lemmaContainsTupThenGetReturnValue!63 lt!45034 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24195 (= lt!45034 (insertStrictlySorted!66 (toList!754 lt!44485) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24195 (= (+!119 lt!44485 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) lt!45031)))

(declare-fun b!92016 () Bool)

(declare-fun res!46812 () Bool)

(assert (=> b!92016 (=> (not res!46812) (not e!59996))))

(assert (=> b!92016 (= res!46812 (= (getValueByKey!143 (toList!754 lt!45031) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(declare-fun b!92017 () Bool)

(assert (=> b!92017 (= e!59996 (contains!773 (toList!754 lt!45031) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (= (and d!24195 res!46811) b!92016))

(assert (= (and b!92016 res!46812) b!92017))

(declare-fun m!98879 () Bool)

(assert (=> d!24195 m!98879))

(declare-fun m!98881 () Bool)

(assert (=> d!24195 m!98881))

(declare-fun m!98883 () Bool)

(assert (=> d!24195 m!98883))

(declare-fun m!98885 () Bool)

(assert (=> d!24195 m!98885))

(declare-fun m!98887 () Bool)

(assert (=> b!92016 m!98887))

(declare-fun m!98889 () Bool)

(assert (=> b!92017 m!98889))

(assert (=> d!24063 d!24195))

(declare-fun b!92018 () Bool)

(declare-fun lt!45038 () Unit!2718)

(declare-fun lt!45037 () Unit!2718)

(assert (=> b!92018 (= lt!45038 lt!45037)))

(declare-fun lt!45035 () (_ BitVec 64))

(declare-fun lt!45041 () (_ BitVec 64))

(declare-fun lt!45040 () V!3089)

(declare-fun lt!45039 () ListLongMap!1477)

(assert (=> b!92018 (not (contains!772 (+!119 lt!45039 (tuple2!2257 lt!45041 lt!45040)) lt!45035))))

(assert (=> b!92018 (= lt!45037 (addStillNotContains!37 lt!45039 lt!45041 lt!45040 lt!45035))))

(assert (=> b!92018 (= lt!45035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!92018 (= lt!45040 (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!92018 (= lt!45041 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!9060 () ListLongMap!1477)

(assert (=> b!92018 (= lt!45039 call!9060)))

(declare-fun e!59997 () ListLongMap!1477)

(assert (=> b!92018 (= e!59997 (+!119 call!9060 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!92019 () Bool)

(declare-fun e!60002 () Bool)

(declare-fun e!60001 () Bool)

(assert (=> b!92019 (= e!60002 e!60001)))

(declare-fun c!15308 () Bool)

(assert (=> b!92019 (= c!15308 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!92020 () Bool)

(declare-fun lt!45036 () ListLongMap!1477)

(assert (=> b!92020 (= e!60001 (= lt!45036 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!92021 () Bool)

(declare-fun e!60000 () ListLongMap!1477)

(assert (=> b!92021 (= e!60000 (ListLongMap!1478 Nil!1552))))

(declare-fun bm!9057 () Bool)

(assert (=> bm!9057 (= call!9060 (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))))))

(declare-fun b!92022 () Bool)

(assert (=> b!92022 (= e!60000 e!59997)))

(declare-fun c!15310 () Bool)

(assert (=> b!92022 (= c!15310 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!92023 () Bool)

(assert (=> b!92023 (= e!60001 (isEmpty!350 lt!45036))))

(declare-fun b!92024 () Bool)

(assert (=> b!92024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> b!92024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2203 (_values!2388 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun e!60003 () Bool)

(assert (=> b!92024 (= e!60003 (= (apply!87 lt!45036 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!92025 () Bool)

(declare-fun e!59999 () Bool)

(assert (=> b!92025 (= e!59999 e!60002)))

(declare-fun c!15309 () Bool)

(declare-fun e!59998 () Bool)

(assert (=> b!92025 (= c!15309 e!59998)))

(declare-fun res!46815 () Bool)

(assert (=> b!92025 (=> (not res!46815) (not e!59998))))

(assert (=> b!92025 (= res!46815 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!92027 () Bool)

(assert (=> b!92027 (= e!59998 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!92027 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!92028 () Bool)

(assert (=> b!92028 (= e!60002 e!60003)))

(assert (=> b!92028 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun res!46813 () Bool)

(assert (=> b!92028 (= res!46813 (contains!772 lt!45036 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!92028 (=> (not res!46813) (not e!60003))))

(declare-fun b!92029 () Bool)

(declare-fun res!46814 () Bool)

(assert (=> b!92029 (=> (not res!46814) (not e!59999))))

(assert (=> b!92029 (= res!46814 (not (contains!772 lt!45036 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92026 () Bool)

(assert (=> b!92026 (= e!59997 call!9060)))

(declare-fun d!24197 () Bool)

(assert (=> d!24197 e!59999))

(declare-fun res!46816 () Bool)

(assert (=> d!24197 (=> (not res!46816) (not e!59999))))

(assert (=> d!24197 (= res!46816 (not (contains!772 lt!45036 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24197 (= lt!45036 e!60000)))

(declare-fun c!15307 () Bool)

(assert (=> d!24197 (= c!15307 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(assert (=> d!24197 (validMask!0 (mask!6464 (v!2713 (underlying!308 thiss!992))))))

(assert (=> d!24197 (= (getCurrentListMapNoExtraKeys!83 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) lt!45036)))

(assert (= (and d!24197 c!15307) b!92021))

(assert (= (and d!24197 (not c!15307)) b!92022))

(assert (= (and b!92022 c!15310) b!92018))

(assert (= (and b!92022 (not c!15310)) b!92026))

(assert (= (or b!92018 b!92026) bm!9057))

(assert (= (and d!24197 res!46816) b!92029))

(assert (= (and b!92029 res!46814) b!92025))

(assert (= (and b!92025 res!46815) b!92027))

(assert (= (and b!92025 c!15309) b!92028))

(assert (= (and b!92025 (not c!15309)) b!92019))

(assert (= (and b!92028 res!46813) b!92024))

(assert (= (and b!92019 c!15308) b!92020))

(assert (= (and b!92019 (not c!15308)) b!92023))

(declare-fun b_lambda!4059 () Bool)

(assert (=> (not b_lambda!4059) (not b!92018)))

(assert (=> b!92018 t!5377))

(declare-fun b_and!5585 () Bool)

(assert (= b_and!5581 (and (=> t!5377 result!3073) b_and!5585)))

(assert (=> b!92018 t!5379))

(declare-fun b_and!5587 () Bool)

(assert (= b_and!5583 (and (=> t!5379 result!3077) b_and!5587)))

(declare-fun b_lambda!4061 () Bool)

(assert (=> (not b_lambda!4061) (not b!92024)))

(assert (=> b!92024 t!5377))

(declare-fun b_and!5589 () Bool)

(assert (= b_and!5585 (and (=> t!5377 result!3073) b_and!5589)))

(assert (=> b!92024 t!5379))

(declare-fun b_and!5591 () Bool)

(assert (= b_and!5587 (and (=> t!5379 result!3077) b_and!5591)))

(declare-fun m!98891 () Bool)

(assert (=> b!92029 m!98891))

(declare-fun m!98893 () Bool)

(assert (=> d!24197 m!98893))

(assert (=> d!24197 m!98155))

(declare-fun m!98895 () Bool)

(assert (=> b!92023 m!98895))

(declare-fun m!98897 () Bool)

(assert (=> b!92020 m!98897))

(assert (=> bm!9057 m!98897))

(declare-fun m!98899 () Bool)

(assert (=> b!92024 m!98899))

(declare-fun m!98901 () Bool)

(assert (=> b!92024 m!98901))

(assert (=> b!92024 m!97923))

(declare-fun m!98903 () Bool)

(assert (=> b!92024 m!98903))

(assert (=> b!92024 m!98899))

(assert (=> b!92024 m!98903))

(assert (=> b!92024 m!97923))

(declare-fun m!98905 () Bool)

(assert (=> b!92024 m!98905))

(declare-fun m!98907 () Bool)

(assert (=> b!92018 m!98907))

(declare-fun m!98909 () Bool)

(assert (=> b!92018 m!98909))

(assert (=> b!92018 m!97923))

(assert (=> b!92018 m!98903))

(declare-fun m!98911 () Bool)

(assert (=> b!92018 m!98911))

(assert (=> b!92018 m!98903))

(assert (=> b!92018 m!97923))

(assert (=> b!92018 m!98905))

(assert (=> b!92018 m!98911))

(declare-fun m!98913 () Bool)

(assert (=> b!92018 m!98913))

(assert (=> b!92018 m!98899))

(assert (=> b!92022 m!98899))

(assert (=> b!92022 m!98899))

(declare-fun m!98915 () Bool)

(assert (=> b!92022 m!98915))

(assert (=> b!92027 m!98899))

(assert (=> b!92027 m!98899))

(assert (=> b!92027 m!98915))

(assert (=> b!92028 m!98899))

(assert (=> b!92028 m!98899))

(declare-fun m!98917 () Bool)

(assert (=> b!92028 m!98917))

(assert (=> b!91545 d!24197))

(declare-fun d!24199 () Bool)

(declare-fun lt!45042 () Bool)

(assert (=> d!24199 (= lt!45042 (select (content!95 (toList!754 lt!44751)) lt!44492))))

(declare-fun e!60005 () Bool)

(assert (=> d!24199 (= lt!45042 e!60005)))

(declare-fun res!46817 () Bool)

(assert (=> d!24199 (=> (not res!46817) (not e!60005))))

(assert (=> d!24199 (= res!46817 ((_ is Cons!1551) (toList!754 lt!44751)))))

(assert (=> d!24199 (= (contains!773 (toList!754 lt!44751) lt!44492) lt!45042)))

(declare-fun b!92030 () Bool)

(declare-fun e!60004 () Bool)

(assert (=> b!92030 (= e!60005 e!60004)))

(declare-fun res!46818 () Bool)

(assert (=> b!92030 (=> res!46818 e!60004)))

(assert (=> b!92030 (= res!46818 (= (h!2143 (toList!754 lt!44751)) lt!44492))))

(declare-fun b!92031 () Bool)

(assert (=> b!92031 (= e!60004 (contains!773 (t!5380 (toList!754 lt!44751)) lt!44492))))

(assert (= (and d!24199 res!46817) b!92030))

(assert (= (and b!92030 (not res!46818)) b!92031))

(declare-fun m!98919 () Bool)

(assert (=> d!24199 m!98919))

(declare-fun m!98921 () Bool)

(assert (=> d!24199 m!98921))

(declare-fun m!98923 () Bool)

(assert (=> b!92031 m!98923))

(assert (=> b!91583 d!24199))

(declare-fun d!24201 () Bool)

(declare-fun lt!45045 () (_ BitVec 32))

(assert (=> d!24201 (and (bvsge lt!45045 #b00000000000000000000000000000000) (bvsle lt!45045 (bvsub (size!2202 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun e!60010 () (_ BitVec 32))

(assert (=> d!24201 (= lt!45045 e!60010)))

(declare-fun c!15315 () Bool)

(assert (=> d!24201 (= c!15315 (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(assert (=> d!24201 (and (bvsle #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2202 (_keys!4084 (_2!1138 lt!44500))) (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(assert (=> d!24201 (= (arrayCountValidKeys!0 (_keys!4084 (_2!1138 lt!44500)) #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))) lt!45045)))

(declare-fun b!92040 () Bool)

(declare-fun e!60011 () (_ BitVec 32))

(declare-fun call!9063 () (_ BitVec 32))

(assert (=> b!92040 (= e!60011 (bvadd #b00000000000000000000000000000001 call!9063))))

(declare-fun b!92041 () Bool)

(assert (=> b!92041 (= e!60010 #b00000000000000000000000000000000)))

(declare-fun b!92042 () Bool)

(assert (=> b!92042 (= e!60010 e!60011)))

(declare-fun c!15316 () Bool)

(assert (=> b!92042 (= c!15316 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun bm!9060 () Bool)

(assert (=> bm!9060 (= call!9063 (arrayCountValidKeys!0 (_keys!4084 (_2!1138 lt!44500)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(declare-fun b!92043 () Bool)

(assert (=> b!92043 (= e!60011 call!9063)))

(assert (= (and d!24201 c!15315) b!92041))

(assert (= (and d!24201 (not c!15315)) b!92042))

(assert (= (and b!92042 c!15316) b!92040))

(assert (= (and b!92042 (not c!15316)) b!92043))

(assert (= (or b!92040 b!92043) bm!9060))

(assert (=> b!92042 m!98547))

(assert (=> b!92042 m!98547))

(assert (=> b!92042 m!98549))

(declare-fun m!98925 () Bool)

(assert (=> bm!9060 m!98925))

(assert (=> b!91508 d!24201))

(declare-fun d!24203 () Bool)

(assert (=> d!24203 (= (+!119 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) lt!44856 lt!44490 (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45048 () Unit!2718)

(declare-fun choose!555 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2718)

(assert (=> d!24203 (= lt!45048 (choose!555 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) lt!44856 (zeroValue!2293 newMap!16) lt!44490 (minValue!2293 newMap!16) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24203 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24203 (= (lemmaChangeZeroKeyThenAddPairToListMap!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) lt!44856 (zeroValue!2293 newMap!16) lt!44490 (minValue!2293 newMap!16) (defaultEntry!2405 newMap!16)) lt!45048)))

(declare-fun bs!3806 () Bool)

(assert (= bs!3806 d!24203))

(assert (=> bs!3806 m!98497))

(assert (=> bs!3806 m!98107))

(declare-fun m!98927 () Bool)

(assert (=> bs!3806 m!98927))

(declare-fun m!98929 () Bool)

(assert (=> bs!3806 m!98929))

(assert (=> bs!3806 m!98107))

(declare-fun m!98931 () Bool)

(assert (=> bs!3806 m!98931))

(assert (=> b!91752 d!24203))

(assert (=> d!24073 d!24077))

(declare-fun d!24205 () Bool)

(assert (=> d!24205 (not (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!24205 true))

(declare-fun _$68!82 () Unit!2718)

(assert (=> d!24205 (= (choose!68 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (Cons!1552 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) Nil!1553)) _$68!82)))

(declare-fun bs!3807 () Bool)

(assert (= bs!3807 d!24205))

(assert (=> bs!3807 m!97899))

(assert (=> bs!3807 m!97903))

(assert (=> d!24073 d!24205))

(assert (=> b!91559 d!24103))

(declare-fun d!24207 () Bool)

(declare-fun c!15317 () Bool)

(assert (=> d!24207 (= c!15317 (and ((_ is Cons!1551) (toList!754 lt!44684)) (= (_1!1139 (h!2143 (toList!754 lt!44684))) (_1!1139 lt!44489))))))

(declare-fun e!60012 () Option!149)

(assert (=> d!24207 (= (getValueByKey!143 (toList!754 lt!44684) (_1!1139 lt!44489)) e!60012)))

(declare-fun b!92046 () Bool)

(declare-fun e!60013 () Option!149)

(assert (=> b!92046 (= e!60013 (getValueByKey!143 (t!5380 (toList!754 lt!44684)) (_1!1139 lt!44489)))))

(declare-fun b!92045 () Bool)

(assert (=> b!92045 (= e!60012 e!60013)))

(declare-fun c!15318 () Bool)

(assert (=> b!92045 (= c!15318 (and ((_ is Cons!1551) (toList!754 lt!44684)) (not (= (_1!1139 (h!2143 (toList!754 lt!44684))) (_1!1139 lt!44489)))))))

(declare-fun b!92047 () Bool)

(assert (=> b!92047 (= e!60013 None!147)))

(declare-fun b!92044 () Bool)

(assert (=> b!92044 (= e!60012 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44684)))))))

(assert (= (and d!24207 c!15317) b!92044))

(assert (= (and d!24207 (not c!15317)) b!92045))

(assert (= (and b!92045 c!15318) b!92046))

(assert (= (and b!92045 (not c!15318)) b!92047))

(declare-fun m!98933 () Bool)

(assert (=> b!92046 m!98933))

(assert (=> b!91515 d!24207))

(declare-fun d!24209 () Bool)

(declare-fun c!15319 () Bool)

(assert (=> d!24209 (= c!15319 (and ((_ is Cons!1551) (toList!754 lt!44739)) (= (_1!1139 (h!2143 (toList!754 lt!44739))) (_1!1139 lt!44495))))))

(declare-fun e!60014 () Option!149)

(assert (=> d!24209 (= (getValueByKey!143 (toList!754 lt!44739) (_1!1139 lt!44495)) e!60014)))

(declare-fun b!92050 () Bool)

(declare-fun e!60015 () Option!149)

(assert (=> b!92050 (= e!60015 (getValueByKey!143 (t!5380 (toList!754 lt!44739)) (_1!1139 lt!44495)))))

(declare-fun b!92049 () Bool)

(assert (=> b!92049 (= e!60014 e!60015)))

(declare-fun c!15320 () Bool)

(assert (=> b!92049 (= c!15320 (and ((_ is Cons!1551) (toList!754 lt!44739)) (not (= (_1!1139 (h!2143 (toList!754 lt!44739))) (_1!1139 lt!44495)))))))

(declare-fun b!92051 () Bool)

(assert (=> b!92051 (= e!60015 None!147)))

(declare-fun b!92048 () Bool)

(assert (=> b!92048 (= e!60014 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44739)))))))

(assert (= (and d!24209 c!15319) b!92048))

(assert (= (and d!24209 (not c!15319)) b!92049))

(assert (= (and b!92049 c!15320) b!92050))

(assert (= (and b!92049 (not c!15320)) b!92051))

(declare-fun m!98935 () Bool)

(assert (=> b!92050 m!98935))

(assert (=> b!91578 d!24209))

(declare-fun d!24211 () Bool)

(declare-fun isEmpty!352 (List!1555) Bool)

(assert (=> d!24211 (= (isEmpty!350 lt!44707) (isEmpty!352 (toList!754 lt!44707)))))

(declare-fun bs!3808 () Bool)

(assert (= bs!3808 d!24211))

(declare-fun m!98937 () Bool)

(assert (=> bs!3808 m!98937))

(assert (=> b!91548 d!24211))

(declare-fun d!24213 () Bool)

(declare-fun e!60016 () Bool)

(assert (=> d!24213 e!60016))

(declare-fun res!46819 () Bool)

(assert (=> d!24213 (=> (not res!46819) (not e!60016))))

(declare-fun lt!45049 () ListLongMap!1477)

(assert (=> d!24213 (= res!46819 (contains!772 lt!45049 (_1!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun lt!45052 () List!1555)

(assert (=> d!24213 (= lt!45049 (ListLongMap!1478 lt!45052))))

(declare-fun lt!45051 () Unit!2718)

(declare-fun lt!45050 () Unit!2718)

(assert (=> d!24213 (= lt!45051 lt!45050)))

(assert (=> d!24213 (= (getValueByKey!143 lt!45052 (_1!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))) (Some!148 (_2!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(assert (=> d!24213 (= lt!45050 (lemmaContainsTupThenGetReturnValue!63 lt!45052 (_1!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (_2!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(assert (=> d!24213 (= lt!45052 (insertStrictlySorted!66 (toList!754 (ite c!15163 call!8936 (ite c!15161 call!8932 call!8933))) (_1!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (_2!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(assert (=> d!24213 (= (+!119 (ite c!15163 call!8936 (ite c!15161 call!8932 call!8933)) (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!45049)))

(declare-fun b!92052 () Bool)

(declare-fun res!46820 () Bool)

(assert (=> b!92052 (=> (not res!46820) (not e!60016))))

(assert (=> b!92052 (= res!46820 (= (getValueByKey!143 (toList!754 lt!45049) (_1!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))) (Some!148 (_2!1139 (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))))

(declare-fun b!92053 () Bool)

(assert (=> b!92053 (= e!60016 (contains!773 (toList!754 lt!45049) (ite (or c!15163 c!15161) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (= (and d!24213 res!46819) b!92052))

(assert (= (and b!92052 res!46820) b!92053))

(declare-fun m!98939 () Bool)

(assert (=> d!24213 m!98939))

(declare-fun m!98941 () Bool)

(assert (=> d!24213 m!98941))

(declare-fun m!98943 () Bool)

(assert (=> d!24213 m!98943))

(declare-fun m!98945 () Bool)

(assert (=> d!24213 m!98945))

(declare-fun m!98947 () Bool)

(assert (=> b!92052 m!98947))

(declare-fun m!98949 () Bool)

(assert (=> b!92053 m!98949))

(assert (=> bm!8933 d!24213))

(assert (=> b!91612 d!24103))

(assert (=> b!91552 d!24115))

(assert (=> bm!9013 d!24143))

(declare-fun d!24215 () Bool)

(declare-fun res!46825 () Bool)

(declare-fun e!60021 () Bool)

(assert (=> d!24215 (=> res!46825 e!60021)))

(assert (=> d!24215 (= res!46825 (and ((_ is Cons!1551) (toList!754 lt!44488)) (= (_1!1139 (h!2143 (toList!754 lt!44488))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(assert (=> d!24215 (= (containsKey!147 (toList!754 lt!44488) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) e!60021)))

(declare-fun b!92058 () Bool)

(declare-fun e!60022 () Bool)

(assert (=> b!92058 (= e!60021 e!60022)))

(declare-fun res!46826 () Bool)

(assert (=> b!92058 (=> (not res!46826) (not e!60022))))

(assert (=> b!92058 (= res!46826 (and (or (not ((_ is Cons!1551) (toList!754 lt!44488))) (bvsle (_1!1139 (h!2143 (toList!754 lt!44488))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))) ((_ is Cons!1551) (toList!754 lt!44488)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44488))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(declare-fun b!92059 () Bool)

(assert (=> b!92059 (= e!60022 (containsKey!147 (t!5380 (toList!754 lt!44488)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (= (and d!24215 (not res!46825)) b!92058))

(assert (= (and b!92058 res!46826) b!92059))

(assert (=> b!92059 m!97899))

(declare-fun m!98951 () Bool)

(assert (=> b!92059 m!98951))

(assert (=> d!24093 d!24215))

(declare-fun d!24217 () Bool)

(declare-fun res!46827 () Bool)

(declare-fun e!60023 () Bool)

(assert (=> d!24217 (=> res!46827 e!60023)))

(assert (=> d!24217 (= res!46827 (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24217 (= (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!60023)))

(declare-fun b!92060 () Bool)

(declare-fun e!60024 () Bool)

(assert (=> b!92060 (= e!60023 e!60024)))

(declare-fun res!46828 () Bool)

(assert (=> b!92060 (=> (not res!46828) (not e!60024))))

(assert (=> b!92060 (= res!46828 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2202 (_keys!4084 (v!2713 (underlying!308 thiss!992))))))))

(declare-fun b!92061 () Bool)

(assert (=> b!92061 (= e!60024 (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!24217 (not res!46827)) b!92060))

(assert (= (and b!92060 res!46828) b!92061))

(assert (=> d!24217 m!98899))

(assert (=> b!92061 m!97899))

(declare-fun m!98953 () Bool)

(assert (=> b!92061 m!98953))

(assert (=> b!91591 d!24217))

(declare-fun d!24219 () Bool)

(declare-fun e!60025 () Bool)

(assert (=> d!24219 e!60025))

(declare-fun res!46829 () Bool)

(assert (=> d!24219 (=> (not res!46829) (not e!60025))))

(declare-fun lt!45053 () ListLongMap!1477)

(assert (=> d!24219 (= res!46829 (contains!772 lt!45053 (_1!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45056 () List!1555)

(assert (=> d!24219 (= lt!45053 (ListLongMap!1478 lt!45056))))

(declare-fun lt!45055 () Unit!2718)

(declare-fun lt!45054 () Unit!2718)

(assert (=> d!24219 (= lt!45055 lt!45054)))

(assert (=> d!24219 (= (getValueByKey!143 lt!45056 (_1!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24219 (= lt!45054 (lemmaContainsTupThenGetReturnValue!63 lt!45056 (_1!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24219 (= lt!45056 (insertStrictlySorted!66 (toList!754 lt!44721) (_1!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24219 (= (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45053)))

(declare-fun b!92062 () Bool)

(declare-fun res!46830 () Bool)

(assert (=> b!92062 (=> (not res!46830) (not e!60025))))

(assert (=> b!92062 (= res!46830 (= (getValueByKey!143 (toList!754 lt!45053) (_1!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92063 () Bool)

(assert (=> b!92063 (= e!60025 (contains!773 (toList!754 lt!45053) (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24219 res!46829) b!92062))

(assert (= (and b!92062 res!46830) b!92063))

(declare-fun m!98955 () Bool)

(assert (=> d!24219 m!98955))

(declare-fun m!98957 () Bool)

(assert (=> d!24219 m!98957))

(declare-fun m!98959 () Bool)

(assert (=> d!24219 m!98959))

(declare-fun m!98961 () Bool)

(assert (=> d!24219 m!98961))

(declare-fun m!98963 () Bool)

(assert (=> b!92062 m!98963))

(declare-fun m!98965 () Bool)

(assert (=> b!92063 m!98965))

(assert (=> b!91566 d!24219))

(assert (=> b!91566 d!24121))

(declare-fun d!24221 () Bool)

(assert (=> d!24221 (= (apply!87 (+!119 lt!44724 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44729) (apply!87 lt!44724 lt!44729))))

(declare-fun lt!45059 () Unit!2718)

(declare-fun choose!556 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2718)

(assert (=> d!24221 (= lt!45059 (choose!556 lt!44724 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44729))))

(declare-fun e!60028 () Bool)

(assert (=> d!24221 e!60028))

(declare-fun res!46833 () Bool)

(assert (=> d!24221 (=> (not res!46833) (not e!60028))))

(assert (=> d!24221 (= res!46833 (contains!772 lt!44724 lt!44729))))

(assert (=> d!24221 (= (addApplyDifferent!63 lt!44724 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44729) lt!45059)))

(declare-fun b!92067 () Bool)

(assert (=> b!92067 (= e!60028 (not (= lt!44729 lt!44723)))))

(assert (= (and d!24221 res!46833) b!92067))

(declare-fun m!98967 () Bool)

(assert (=> d!24221 m!98967))

(declare-fun m!98969 () Bool)

(assert (=> d!24221 m!98969))

(assert (=> d!24221 m!98229))

(assert (=> d!24221 m!98237))

(assert (=> d!24221 m!98235))

(assert (=> d!24221 m!98229))

(assert (=> b!91566 d!24221))

(declare-fun d!24223 () Bool)

(assert (=> d!24223 (= (apply!87 lt!44734 lt!44714) (get!1244 (getValueByKey!143 (toList!754 lt!44734) lt!44714)))))

(declare-fun bs!3809 () Bool)

(assert (= bs!3809 d!24223))

(declare-fun m!98971 () Bool)

(assert (=> bs!3809 m!98971))

(assert (=> bs!3809 m!98971))

(declare-fun m!98973 () Bool)

(assert (=> bs!3809 m!98973))

(assert (=> b!91566 d!24223))

(declare-fun d!24225 () Bool)

(assert (=> d!24225 (= (apply!87 (+!119 lt!44734 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44714) (apply!87 lt!44734 lt!44714))))

(declare-fun lt!45060 () Unit!2718)

(assert (=> d!24225 (= lt!45060 (choose!556 lt!44734 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44714))))

(declare-fun e!60029 () Bool)

(assert (=> d!24225 e!60029))

(declare-fun res!46834 () Bool)

(assert (=> d!24225 (=> (not res!46834) (not e!60029))))

(assert (=> d!24225 (= res!46834 (contains!772 lt!44734 lt!44714))))

(assert (=> d!24225 (= (addApplyDifferent!63 lt!44734 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44714) lt!45060)))

(declare-fun b!92068 () Bool)

(assert (=> b!92068 (= e!60029 (not (= lt!44714 lt!44713)))))

(assert (= (and d!24225 res!46834) b!92068))

(declare-fun m!98975 () Bool)

(assert (=> d!24225 m!98975))

(declare-fun m!98977 () Bool)

(assert (=> d!24225 m!98977))

(assert (=> d!24225 m!98231))

(assert (=> d!24225 m!98243))

(assert (=> d!24225 m!98251))

(assert (=> d!24225 m!98231))

(assert (=> b!91566 d!24225))

(declare-fun d!24227 () Bool)

(declare-fun e!60030 () Bool)

(assert (=> d!24227 e!60030))

(declare-fun res!46835 () Bool)

(assert (=> d!24227 (=> (not res!46835) (not e!60030))))

(declare-fun lt!45061 () ListLongMap!1477)

(assert (=> d!24227 (= res!46835 (contains!772 lt!45061 (_1!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45064 () List!1555)

(assert (=> d!24227 (= lt!45061 (ListLongMap!1478 lt!45064))))

(declare-fun lt!45063 () Unit!2718)

(declare-fun lt!45062 () Unit!2718)

(assert (=> d!24227 (= lt!45063 lt!45062)))

(assert (=> d!24227 (= (getValueByKey!143 lt!45064 (_1!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24227 (= lt!45062 (lemmaContainsTupThenGetReturnValue!63 lt!45064 (_1!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24227 (= lt!45064 (insertStrictlySorted!66 (toList!754 lt!44728) (_1!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24227 (= (+!119 lt!44728 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45061)))

(declare-fun b!92069 () Bool)

(declare-fun res!46836 () Bool)

(assert (=> b!92069 (=> (not res!46836) (not e!60030))))

(assert (=> b!92069 (= res!46836 (= (getValueByKey!143 (toList!754 lt!45061) (_1!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92070 () Bool)

(assert (=> b!92070 (= e!60030 (contains!773 (toList!754 lt!45061) (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24227 res!46835) b!92069))

(assert (= (and b!92069 res!46836) b!92070))

(declare-fun m!98979 () Bool)

(assert (=> d!24227 m!98979))

(declare-fun m!98981 () Bool)

(assert (=> d!24227 m!98981))

(declare-fun m!98983 () Bool)

(assert (=> d!24227 m!98983))

(declare-fun m!98985 () Bool)

(assert (=> d!24227 m!98985))

(declare-fun m!98987 () Bool)

(assert (=> b!92069 m!98987))

(declare-fun m!98989 () Bool)

(assert (=> b!92070 m!98989))

(assert (=> b!91566 d!24227))

(declare-fun d!24229 () Bool)

(assert (=> d!24229 (= (apply!87 (+!119 lt!44728 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44726) (apply!87 lt!44728 lt!44726))))

(declare-fun lt!45065 () Unit!2718)

(assert (=> d!24229 (= lt!45065 (choose!556 lt!44728 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44726))))

(declare-fun e!60031 () Bool)

(assert (=> d!24229 e!60031))

(declare-fun res!46837 () Bool)

(assert (=> d!24229 (=> (not res!46837) (not e!60031))))

(assert (=> d!24229 (= res!46837 (contains!772 lt!44728 lt!44726))))

(assert (=> d!24229 (= (addApplyDifferent!63 lt!44728 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44726) lt!45065)))

(declare-fun b!92071 () Bool)

(assert (=> b!92071 (= e!60031 (not (= lt!44726 lt!44719)))))

(assert (= (and d!24229 res!46837) b!92071))

(declare-fun m!98991 () Bool)

(assert (=> d!24229 m!98991))

(declare-fun m!98993 () Bool)

(assert (=> d!24229 m!98993))

(assert (=> d!24229 m!98245))

(assert (=> d!24229 m!98247))

(assert (=> d!24229 m!98239))

(assert (=> d!24229 m!98245))

(assert (=> b!91566 d!24229))

(declare-fun d!24231 () Bool)

(declare-fun e!60032 () Bool)

(assert (=> d!24231 e!60032))

(declare-fun res!46838 () Bool)

(assert (=> d!24231 (=> res!46838 e!60032)))

(declare-fun lt!45069 () Bool)

(assert (=> d!24231 (= res!46838 (not lt!45069))))

(declare-fun lt!45067 () Bool)

(assert (=> d!24231 (= lt!45069 lt!45067)))

(declare-fun lt!45068 () Unit!2718)

(declare-fun e!60033 () Unit!2718)

(assert (=> d!24231 (= lt!45068 e!60033)))

(declare-fun c!15321 () Bool)

(assert (=> d!24231 (= c!15321 lt!45067)))

(assert (=> d!24231 (= lt!45067 (containsKey!147 (toList!754 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44722))))

(assert (=> d!24231 (= (contains!772 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44722) lt!45069)))

(declare-fun b!92072 () Bool)

(declare-fun lt!45066 () Unit!2718)

(assert (=> b!92072 (= e!60033 lt!45066)))

(assert (=> b!92072 (= lt!45066 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44722))))

(assert (=> b!92072 (isDefined!97 (getValueByKey!143 (toList!754 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44722))))

(declare-fun b!92073 () Bool)

(declare-fun Unit!2743 () Unit!2718)

(assert (=> b!92073 (= e!60033 Unit!2743)))

(declare-fun b!92074 () Bool)

(assert (=> b!92074 (= e!60032 (isDefined!97 (getValueByKey!143 (toList!754 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44722)))))

(assert (= (and d!24231 c!15321) b!92072))

(assert (= (and d!24231 (not c!15321)) b!92073))

(assert (= (and d!24231 (not res!46838)) b!92074))

(declare-fun m!98995 () Bool)

(assert (=> d!24231 m!98995))

(declare-fun m!98997 () Bool)

(assert (=> b!92072 m!98997))

(declare-fun m!98999 () Bool)

(assert (=> b!92072 m!98999))

(assert (=> b!92072 m!98999))

(declare-fun m!99001 () Bool)

(assert (=> b!92072 m!99001))

(assert (=> b!92074 m!98999))

(assert (=> b!92074 m!98999))

(assert (=> b!92074 m!99001))

(assert (=> b!91566 d!24231))

(declare-fun d!24233 () Bool)

(declare-fun e!60034 () Bool)

(assert (=> d!24233 e!60034))

(declare-fun res!46839 () Bool)

(assert (=> d!24233 (=> (not res!46839) (not e!60034))))

(declare-fun lt!45070 () ListLongMap!1477)

(assert (=> d!24233 (= res!46839 (contains!772 lt!45070 (_1!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45073 () List!1555)

(assert (=> d!24233 (= lt!45070 (ListLongMap!1478 lt!45073))))

(declare-fun lt!45072 () Unit!2718)

(declare-fun lt!45071 () Unit!2718)

(assert (=> d!24233 (= lt!45072 lt!45071)))

(assert (=> d!24233 (= (getValueByKey!143 lt!45073 (_1!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24233 (= lt!45071 (lemmaContainsTupThenGetReturnValue!63 lt!45073 (_1!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24233 (= lt!45073 (insertStrictlySorted!66 (toList!754 lt!44724) (_1!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24233 (= (+!119 lt!44724 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45070)))

(declare-fun b!92075 () Bool)

(declare-fun res!46840 () Bool)

(assert (=> b!92075 (=> (not res!46840) (not e!60034))))

(assert (=> b!92075 (= res!46840 (= (getValueByKey!143 (toList!754 lt!45070) (_1!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92076 () Bool)

(assert (=> b!92076 (= e!60034 (contains!773 (toList!754 lt!45070) (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24233 res!46839) b!92075))

(assert (= (and b!92075 res!46840) b!92076))

(declare-fun m!99003 () Bool)

(assert (=> d!24233 m!99003))

(declare-fun m!99005 () Bool)

(assert (=> d!24233 m!99005))

(declare-fun m!99007 () Bool)

(assert (=> d!24233 m!99007))

(declare-fun m!99009 () Bool)

(assert (=> d!24233 m!99009))

(declare-fun m!99011 () Bool)

(assert (=> b!92075 m!99011))

(declare-fun m!99013 () Bool)

(assert (=> b!92076 m!99013))

(assert (=> b!91566 d!24233))

(declare-fun d!24235 () Bool)

(assert (=> d!24235 (contains!772 (+!119 lt!44721 (tuple2!2257 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44722)))

(declare-fun lt!45076 () Unit!2718)

(declare-fun choose!557 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2718)

(assert (=> d!24235 (= lt!45076 (choose!557 lt!44721 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44722))))

(assert (=> d!24235 (contains!772 lt!44721 lt!44722)))

(assert (=> d!24235 (= (addStillContains!63 lt!44721 lt!44731 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44722) lt!45076)))

(declare-fun bs!3810 () Bool)

(assert (= bs!3810 d!24235))

(assert (=> bs!3810 m!98223))

(assert (=> bs!3810 m!98223))

(assert (=> bs!3810 m!98225))

(declare-fun m!99015 () Bool)

(assert (=> bs!3810 m!99015))

(declare-fun m!99017 () Bool)

(assert (=> bs!3810 m!99017))

(assert (=> b!91566 d!24235))

(declare-fun d!24237 () Bool)

(assert (=> d!24237 (= (apply!87 lt!44724 lt!44729) (get!1244 (getValueByKey!143 (toList!754 lt!44724) lt!44729)))))

(declare-fun bs!3811 () Bool)

(assert (= bs!3811 d!24237))

(declare-fun m!99019 () Bool)

(assert (=> bs!3811 m!99019))

(assert (=> bs!3811 m!99019))

(declare-fun m!99021 () Bool)

(assert (=> bs!3811 m!99021))

(assert (=> b!91566 d!24237))

(declare-fun d!24239 () Bool)

(assert (=> d!24239 (= (apply!87 (+!119 lt!44734 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44714) (get!1244 (getValueByKey!143 (toList!754 (+!119 lt!44734 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44714)))))

(declare-fun bs!3812 () Bool)

(assert (= bs!3812 d!24239))

(declare-fun m!99023 () Bool)

(assert (=> bs!3812 m!99023))

(assert (=> bs!3812 m!99023))

(declare-fun m!99025 () Bool)

(assert (=> bs!3812 m!99025))

(assert (=> b!91566 d!24239))

(declare-fun d!24241 () Bool)

(assert (=> d!24241 (= (apply!87 (+!119 lt!44724 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44729) (get!1244 (getValueByKey!143 (toList!754 (+!119 lt!44724 (tuple2!2257 lt!44723 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44729)))))

(declare-fun bs!3813 () Bool)

(assert (= bs!3813 d!24241))

(declare-fun m!99027 () Bool)

(assert (=> bs!3813 m!99027))

(assert (=> bs!3813 m!99027))

(declare-fun m!99029 () Bool)

(assert (=> bs!3813 m!99029))

(assert (=> b!91566 d!24241))

(declare-fun d!24243 () Bool)

(declare-fun e!60035 () Bool)

(assert (=> d!24243 e!60035))

(declare-fun res!46841 () Bool)

(assert (=> d!24243 (=> (not res!46841) (not e!60035))))

(declare-fun lt!45077 () ListLongMap!1477)

(assert (=> d!24243 (= res!46841 (contains!772 lt!45077 (_1!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45080 () List!1555)

(assert (=> d!24243 (= lt!45077 (ListLongMap!1478 lt!45080))))

(declare-fun lt!45079 () Unit!2718)

(declare-fun lt!45078 () Unit!2718)

(assert (=> d!24243 (= lt!45079 lt!45078)))

(assert (=> d!24243 (= (getValueByKey!143 lt!45080 (_1!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24243 (= lt!45078 (lemmaContainsTupThenGetReturnValue!63 lt!45080 (_1!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24243 (= lt!45080 (insertStrictlySorted!66 (toList!754 lt!44734) (_1!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24243 (= (+!119 lt!44734 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45077)))

(declare-fun b!92078 () Bool)

(declare-fun res!46842 () Bool)

(assert (=> b!92078 (=> (not res!46842) (not e!60035))))

(assert (=> b!92078 (= res!46842 (= (getValueByKey!143 (toList!754 lt!45077) (_1!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92079 () Bool)

(assert (=> b!92079 (= e!60035 (contains!773 (toList!754 lt!45077) (tuple2!2257 lt!44713 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24243 res!46841) b!92078))

(assert (= (and b!92078 res!46842) b!92079))

(declare-fun m!99031 () Bool)

(assert (=> d!24243 m!99031))

(declare-fun m!99033 () Bool)

(assert (=> d!24243 m!99033))

(declare-fun m!99035 () Bool)

(assert (=> d!24243 m!99035))

(declare-fun m!99037 () Bool)

(assert (=> d!24243 m!99037))

(declare-fun m!99039 () Bool)

(assert (=> b!92078 m!99039))

(declare-fun m!99041 () Bool)

(assert (=> b!92079 m!99041))

(assert (=> b!91566 d!24243))

(declare-fun d!24245 () Bool)

(assert (=> d!24245 (= (apply!87 lt!44728 lt!44726) (get!1244 (getValueByKey!143 (toList!754 lt!44728) lt!44726)))))

(declare-fun bs!3814 () Bool)

(assert (= bs!3814 d!24245))

(declare-fun m!99043 () Bool)

(assert (=> bs!3814 m!99043))

(assert (=> bs!3814 m!99043))

(declare-fun m!99045 () Bool)

(assert (=> bs!3814 m!99045))

(assert (=> b!91566 d!24245))

(declare-fun d!24247 () Bool)

(assert (=> d!24247 (= (apply!87 (+!119 lt!44728 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44726) (get!1244 (getValueByKey!143 (toList!754 (+!119 lt!44728 (tuple2!2257 lt!44719 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44726)))))

(declare-fun bs!3815 () Bool)

(assert (= bs!3815 d!24247))

(declare-fun m!99047 () Bool)

(assert (=> bs!3815 m!99047))

(assert (=> bs!3815 m!99047))

(declare-fun m!99049 () Bool)

(assert (=> bs!3815 m!99049))

(assert (=> b!91566 d!24247))

(declare-fun b!92080 () Bool)

(declare-fun e!60038 () Bool)

(declare-fun call!9064 () Bool)

(assert (=> b!92080 (= e!60038 call!9064)))

(declare-fun b!92081 () Bool)

(declare-fun e!60036 () Bool)

(declare-fun e!60037 () Bool)

(assert (=> b!92081 (= e!60036 e!60037)))

(declare-fun c!15322 () Bool)

(assert (=> b!92081 (= c!15322 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92082 () Bool)

(assert (=> b!92082 (= e!60037 e!60038)))

(declare-fun lt!45081 () (_ BitVec 64))

(assert (=> b!92082 (= lt!45081 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45083 () Unit!2718)

(assert (=> b!92082 (= lt!45083 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4084 newMap!16) lt!45081 #b00000000000000000000000000000000))))

(assert (=> b!92082 (arrayContainsKey!0 (_keys!4084 newMap!16) lt!45081 #b00000000000000000000000000000000)))

(declare-fun lt!45082 () Unit!2718)

(assert (=> b!92082 (= lt!45082 lt!45083)))

(declare-fun res!46844 () Bool)

(assert (=> b!92082 (= res!46844 (= (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000) (_keys!4084 newMap!16) (mask!6464 newMap!16)) (Found!251 #b00000000000000000000000000000000)))))

(assert (=> b!92082 (=> (not res!46844) (not e!60038))))

(declare-fun b!92083 () Bool)

(assert (=> b!92083 (= e!60037 call!9064)))

(declare-fun d!24249 () Bool)

(declare-fun res!46843 () Bool)

(assert (=> d!24249 (=> res!46843 e!60036)))

(assert (=> d!24249 (= res!46843 (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(assert (=> d!24249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4084 newMap!16) (mask!6464 newMap!16)) e!60036)))

(declare-fun bm!9061 () Bool)

(assert (=> bm!9061 (= call!9064 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(assert (= (and d!24249 (not res!46843)) b!92081))

(assert (= (and b!92081 c!15322) b!92082))

(assert (= (and b!92081 (not c!15322)) b!92083))

(assert (= (and b!92082 res!46844) b!92080))

(assert (= (or b!92080 b!92083) bm!9061))

(assert (=> b!92081 m!98447))

(assert (=> b!92081 m!98447))

(assert (=> b!92081 m!98449))

(assert (=> b!92082 m!98447))

(declare-fun m!99051 () Bool)

(assert (=> b!92082 m!99051))

(declare-fun m!99053 () Bool)

(assert (=> b!92082 m!99053))

(assert (=> b!92082 m!98447))

(declare-fun m!99055 () Bool)

(assert (=> b!92082 m!99055))

(declare-fun m!99057 () Bool)

(assert (=> bm!9061 m!99057))

(assert (=> b!91443 d!24249))

(declare-fun d!24251 () Bool)

(declare-fun e!60039 () Bool)

(assert (=> d!24251 e!60039))

(declare-fun res!46845 () Bool)

(assert (=> d!24251 (=> res!46845 e!60039)))

(declare-fun lt!45087 () Bool)

(assert (=> d!24251 (= res!46845 (not lt!45087))))

(declare-fun lt!45085 () Bool)

(assert (=> d!24251 (= lt!45087 lt!45085)))

(declare-fun lt!45086 () Unit!2718)

(declare-fun e!60040 () Unit!2718)

(assert (=> d!24251 (= lt!45086 e!60040)))

(declare-fun c!15323 () Bool)

(assert (=> d!24251 (= c!15323 lt!45085)))

(assert (=> d!24251 (= lt!45085 (containsKey!147 (toList!754 call!9019) (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841))))))

(assert (=> d!24251 (= (contains!772 call!9019 (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841))) lt!45087)))

(declare-fun b!92084 () Bool)

(declare-fun lt!45084 () Unit!2718)

(assert (=> b!92084 (= e!60040 lt!45084)))

(assert (=> b!92084 (= lt!45084 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 call!9019) (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841))))))

(assert (=> b!92084 (isDefined!97 (getValueByKey!143 (toList!754 call!9019) (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841))))))

(declare-fun b!92085 () Bool)

(declare-fun Unit!2744 () Unit!2718)

(assert (=> b!92085 (= e!60040 Unit!2744)))

(declare-fun b!92086 () Bool)

(assert (=> b!92086 (= e!60039 (isDefined!97 (getValueByKey!143 (toList!754 call!9019) (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841)))))))

(assert (= (and d!24251 c!15323) b!92084))

(assert (= (and d!24251 (not c!15323)) b!92085))

(assert (= (and d!24251 (not res!46845)) b!92086))

(assert (=> d!24251 m!98411))

(declare-fun m!99059 () Bool)

(assert (=> d!24251 m!99059))

(assert (=> b!92084 m!98411))

(declare-fun m!99061 () Bool)

(assert (=> b!92084 m!99061))

(assert (=> b!92084 m!98411))

(declare-fun m!99063 () Bool)

(assert (=> b!92084 m!99063))

(assert (=> b!92084 m!99063))

(declare-fun m!99065 () Bool)

(assert (=> b!92084 m!99065))

(assert (=> b!92086 m!98411))

(assert (=> b!92086 m!99063))

(assert (=> b!92086 m!99063))

(assert (=> b!92086 m!99065))

(assert (=> b!91729 d!24251))

(declare-fun d!24253 () Bool)

(declare-fun e!60043 () Bool)

(assert (=> d!24253 e!60043))

(declare-fun res!46848 () Bool)

(assert (=> d!24253 (=> (not res!46848) (not e!60043))))

(assert (=> d!24253 (= res!46848 (and (bvsge (index!3145 lt!44841) #b00000000000000000000000000000000) (bvslt (index!3145 lt!44841) (size!2202 (_keys!4084 newMap!16)))))))

(declare-fun lt!45090 () Unit!2718)

(declare-fun choose!558 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) Unit!2718)

(assert (=> d!24253 (= lt!45090 (choose!558 (_keys!4084 newMap!16) lt!44842 (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3145 lt!44841) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24253 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24253 (= (lemmaValidKeyInArrayIsInListMap!95 (_keys!4084 newMap!16) lt!44842 (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3145 lt!44841) (defaultEntry!2405 newMap!16)) lt!45090)))

(declare-fun b!92089 () Bool)

(assert (=> b!92089 (= e!60043 (contains!772 (getCurrentListMap!437 (_keys!4084 newMap!16) lt!44842 (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!44841))))))

(assert (= (and d!24253 res!46848) b!92089))

(declare-fun m!99067 () Bool)

(assert (=> d!24253 m!99067))

(assert (=> d!24253 m!98497))

(declare-fun m!99069 () Bool)

(assert (=> b!92089 m!99069))

(assert (=> b!92089 m!98411))

(assert (=> b!92089 m!99069))

(assert (=> b!92089 m!98411))

(declare-fun m!99071 () Bool)

(assert (=> b!92089 m!99071))

(assert (=> b!91729 d!24253))

(declare-fun d!24255 () Bool)

(declare-fun e!60046 () Bool)

(assert (=> d!24255 e!60046))

(declare-fun res!46851 () Bool)

(assert (=> d!24255 (=> (not res!46851) (not e!60046))))

(assert (=> d!24255 (= res!46851 (and (bvsge (index!3145 lt!44841) #b00000000000000000000000000000000) (bvslt (index!3145 lt!44841) (size!2203 (_values!2388 newMap!16)))))))

(declare-fun lt!45093 () Unit!2718)

(declare-fun choose!559 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) (_ BitVec 64) V!3089 Int) Unit!2718)

(assert (=> d!24255 (= lt!45093 (choose!559 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3145 lt!44841) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 (defaultEntry!2405 newMap!16)))))

(assert (=> d!24255 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24255 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3145 lt!44841) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 (defaultEntry!2405 newMap!16)) lt!45093)))

(declare-fun b!92092 () Bool)

(assert (=> b!92092 (= e!60046 (= (+!119 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (getCurrentListMap!437 (_keys!4084 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16))))))

(assert (= (and d!24255 res!46851) b!92092))

(assert (=> d!24255 m!97899))

(declare-fun m!99073 () Bool)

(assert (=> d!24255 m!99073))

(assert (=> d!24255 m!98497))

(assert (=> b!92092 m!98107))

(assert (=> b!92092 m!98107))

(declare-fun m!99075 () Bool)

(assert (=> b!92092 m!99075))

(assert (=> b!92092 m!98393))

(declare-fun m!99077 () Bool)

(assert (=> b!92092 m!99077))

(assert (=> b!91729 d!24255))

(declare-fun d!24257 () Bool)

(declare-fun e!60049 () Bool)

(assert (=> d!24257 e!60049))

(declare-fun c!15326 () Bool)

(assert (=> d!24257 (= c!15326 (and (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!24257 true))

(declare-fun _$29!117 () Unit!2718)

(assert (=> d!24257 (= (choose!551 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (_values!2388 (v!2713 (underlying!308 thiss!992))) (mask!6464 (v!2713 (underlying!308 thiss!992))) (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) (minValue!2293 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992)))) _$29!117)))

(declare-fun b!92097 () Bool)

(assert (=> b!92097 (= e!60049 (arrayContainsKey!0 (_keys!4084 (v!2713 (underlying!308 thiss!992))) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!92098 () Bool)

(assert (=> b!92098 (= e!60049 (ite (= (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2713 (underlying!308 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24257 c!15326) b!92097))

(assert (= (and d!24257 (not c!15326)) b!92098))

(assert (=> b!92097 m!97899))

(assert (=> b!92097 m!97903))

(assert (=> d!24079 d!24257))

(assert (=> d!24079 d!24117))

(declare-fun d!24259 () Bool)

(declare-fun e!60050 () Bool)

(assert (=> d!24259 e!60050))

(declare-fun res!46852 () Bool)

(assert (=> d!24259 (=> res!46852 e!60050)))

(declare-fun lt!45097 () Bool)

(assert (=> d!24259 (= res!46852 (not lt!45097))))

(declare-fun lt!45095 () Bool)

(assert (=> d!24259 (= lt!45097 lt!45095)))

(declare-fun lt!45096 () Unit!2718)

(declare-fun e!60051 () Unit!2718)

(assert (=> d!24259 (= lt!45096 e!60051)))

(declare-fun c!15327 () Bool)

(assert (=> d!24259 (= c!15327 lt!45095)))

(assert (=> d!24259 (= lt!45095 (containsKey!147 (toList!754 lt!44684) (_1!1139 lt!44489)))))

(assert (=> d!24259 (= (contains!772 lt!44684 (_1!1139 lt!44489)) lt!45097)))

(declare-fun b!92099 () Bool)

(declare-fun lt!45094 () Unit!2718)

(assert (=> b!92099 (= e!60051 lt!45094)))

(assert (=> b!92099 (= lt!45094 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44684) (_1!1139 lt!44489)))))

(assert (=> b!92099 (isDefined!97 (getValueByKey!143 (toList!754 lt!44684) (_1!1139 lt!44489)))))

(declare-fun b!92100 () Bool)

(declare-fun Unit!2745 () Unit!2718)

(assert (=> b!92100 (= e!60051 Unit!2745)))

(declare-fun b!92101 () Bool)

(assert (=> b!92101 (= e!60050 (isDefined!97 (getValueByKey!143 (toList!754 lt!44684) (_1!1139 lt!44489))))))

(assert (= (and d!24259 c!15327) b!92099))

(assert (= (and d!24259 (not c!15327)) b!92100))

(assert (= (and d!24259 (not res!46852)) b!92101))

(declare-fun m!99079 () Bool)

(assert (=> d!24259 m!99079))

(declare-fun m!99081 () Bool)

(assert (=> b!92099 m!99081))

(assert (=> b!92099 m!98181))

(assert (=> b!92099 m!98181))

(declare-fun m!99083 () Bool)

(assert (=> b!92099 m!99083))

(assert (=> b!92101 m!98181))

(assert (=> b!92101 m!98181))

(assert (=> b!92101 m!99083))

(assert (=> d!24049 d!24259))

(declare-fun d!24261 () Bool)

(declare-fun c!15328 () Bool)

(assert (=> d!24261 (= c!15328 (and ((_ is Cons!1551) lt!44687) (= (_1!1139 (h!2143 lt!44687)) (_1!1139 lt!44489))))))

(declare-fun e!60052 () Option!149)

(assert (=> d!24261 (= (getValueByKey!143 lt!44687 (_1!1139 lt!44489)) e!60052)))

(declare-fun b!92104 () Bool)

(declare-fun e!60053 () Option!149)

(assert (=> b!92104 (= e!60053 (getValueByKey!143 (t!5380 lt!44687) (_1!1139 lt!44489)))))

(declare-fun b!92103 () Bool)

(assert (=> b!92103 (= e!60052 e!60053)))

(declare-fun c!15329 () Bool)

(assert (=> b!92103 (= c!15329 (and ((_ is Cons!1551) lt!44687) (not (= (_1!1139 (h!2143 lt!44687)) (_1!1139 lt!44489)))))))

(declare-fun b!92105 () Bool)

(assert (=> b!92105 (= e!60053 None!147)))

(declare-fun b!92102 () Bool)

(assert (=> b!92102 (= e!60052 (Some!148 (_2!1139 (h!2143 lt!44687))))))

(assert (= (and d!24261 c!15328) b!92102))

(assert (= (and d!24261 (not c!15328)) b!92103))

(assert (= (and b!92103 c!15329) b!92104))

(assert (= (and b!92103 (not c!15329)) b!92105))

(declare-fun m!99085 () Bool)

(assert (=> b!92104 m!99085))

(assert (=> d!24049 d!24261))

(declare-fun d!24263 () Bool)

(assert (=> d!24263 (= (getValueByKey!143 lt!44687 (_1!1139 lt!44489)) (Some!148 (_2!1139 lt!44489)))))

(declare-fun lt!45098 () Unit!2718)

(assert (=> d!24263 (= lt!45098 (choose!554 lt!44687 (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(declare-fun e!60054 () Bool)

(assert (=> d!24263 e!60054))

(declare-fun res!46853 () Bool)

(assert (=> d!24263 (=> (not res!46853) (not e!60054))))

(assert (=> d!24263 (= res!46853 (isStrictlySorted!296 lt!44687))))

(assert (=> d!24263 (= (lemmaContainsTupThenGetReturnValue!63 lt!44687 (_1!1139 lt!44489) (_2!1139 lt!44489)) lt!45098)))

(declare-fun b!92106 () Bool)

(declare-fun res!46854 () Bool)

(assert (=> b!92106 (=> (not res!46854) (not e!60054))))

(assert (=> b!92106 (= res!46854 (containsKey!147 lt!44687 (_1!1139 lt!44489)))))

(declare-fun b!92107 () Bool)

(assert (=> b!92107 (= e!60054 (contains!773 lt!44687 (tuple2!2257 (_1!1139 lt!44489) (_2!1139 lt!44489))))))

(assert (= (and d!24263 res!46853) b!92106))

(assert (= (and b!92106 res!46854) b!92107))

(assert (=> d!24263 m!98175))

(declare-fun m!99087 () Bool)

(assert (=> d!24263 m!99087))

(declare-fun m!99089 () Bool)

(assert (=> d!24263 m!99089))

(declare-fun m!99091 () Bool)

(assert (=> b!92106 m!99091))

(declare-fun m!99093 () Bool)

(assert (=> b!92107 m!99093))

(assert (=> d!24049 d!24263))

(declare-fun b!92108 () Bool)

(declare-fun res!46856 () Bool)

(declare-fun e!60059 () Bool)

(assert (=> b!92108 (=> (not res!46856) (not e!60059))))

(declare-fun lt!45099 () List!1555)

(assert (=> b!92108 (= res!46856 (containsKey!147 lt!45099 (_1!1139 lt!44489)))))

(declare-fun b!92109 () Bool)

(declare-fun e!60058 () List!1555)

(declare-fun call!9065 () List!1555)

(assert (=> b!92109 (= e!60058 call!9065)))

(declare-fun d!24265 () Bool)

(assert (=> d!24265 e!60059))

(declare-fun res!46855 () Bool)

(assert (=> d!24265 (=> (not res!46855) (not e!60059))))

(assert (=> d!24265 (= res!46855 (isStrictlySorted!296 lt!45099))))

(assert (=> d!24265 (= lt!45099 e!60058)))

(declare-fun c!15331 () Bool)

(assert (=> d!24265 (= c!15331 (and ((_ is Cons!1551) (toList!754 lt!44487)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44487))) (_1!1139 lt!44489))))))

(assert (=> d!24265 (isStrictlySorted!296 (toList!754 lt!44487))))

(assert (=> d!24265 (= (insertStrictlySorted!66 (toList!754 lt!44487) (_1!1139 lt!44489) (_2!1139 lt!44489)) lt!45099)))

(declare-fun bm!9062 () Bool)

(declare-fun call!9067 () List!1555)

(assert (=> bm!9062 (= call!9067 call!9065)))

(declare-fun b!92110 () Bool)

(declare-fun e!60055 () List!1555)

(assert (=> b!92110 (= e!60058 e!60055)))

(declare-fun c!15330 () Bool)

(assert (=> b!92110 (= c!15330 (and ((_ is Cons!1551) (toList!754 lt!44487)) (= (_1!1139 (h!2143 (toList!754 lt!44487))) (_1!1139 lt!44489))))))

(declare-fun c!15332 () Bool)

(declare-fun e!60056 () List!1555)

(declare-fun b!92111 () Bool)

(assert (=> b!92111 (= e!60056 (ite c!15330 (t!5380 (toList!754 lt!44487)) (ite c!15332 (Cons!1551 (h!2143 (toList!754 lt!44487)) (t!5380 (toList!754 lt!44487))) Nil!1552)))))

(declare-fun b!92112 () Bool)

(declare-fun e!60057 () List!1555)

(declare-fun call!9066 () List!1555)

(assert (=> b!92112 (= e!60057 call!9066)))

(declare-fun b!92113 () Bool)

(assert (=> b!92113 (= e!60057 call!9066)))

(declare-fun b!92114 () Bool)

(assert (=> b!92114 (= e!60055 call!9067)))

(declare-fun bm!9063 () Bool)

(assert (=> bm!9063 (= call!9065 ($colon$colon!74 e!60056 (ite c!15331 (h!2143 (toList!754 lt!44487)) (tuple2!2257 (_1!1139 lt!44489) (_2!1139 lt!44489)))))))

(declare-fun c!15333 () Bool)

(assert (=> bm!9063 (= c!15333 c!15331)))

(declare-fun b!92115 () Bool)

(assert (=> b!92115 (= e!60056 (insertStrictlySorted!66 (t!5380 (toList!754 lt!44487)) (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(declare-fun bm!9064 () Bool)

(assert (=> bm!9064 (= call!9066 call!9067)))

(declare-fun b!92116 () Bool)

(assert (=> b!92116 (= c!15332 (and ((_ is Cons!1551) (toList!754 lt!44487)) (bvsgt (_1!1139 (h!2143 (toList!754 lt!44487))) (_1!1139 lt!44489))))))

(assert (=> b!92116 (= e!60055 e!60057)))

(declare-fun b!92117 () Bool)

(assert (=> b!92117 (= e!60059 (contains!773 lt!45099 (tuple2!2257 (_1!1139 lt!44489) (_2!1139 lt!44489))))))

(assert (= (and d!24265 c!15331) b!92109))

(assert (= (and d!24265 (not c!15331)) b!92110))

(assert (= (and b!92110 c!15330) b!92114))

(assert (= (and b!92110 (not c!15330)) b!92116))

(assert (= (and b!92116 c!15332) b!92112))

(assert (= (and b!92116 (not c!15332)) b!92113))

(assert (= (or b!92112 b!92113) bm!9064))

(assert (= (or b!92114 bm!9064) bm!9062))

(assert (= (or b!92109 bm!9062) bm!9063))

(assert (= (and bm!9063 c!15333) b!92115))

(assert (= (and bm!9063 (not c!15333)) b!92111))

(assert (= (and d!24265 res!46855) b!92108))

(assert (= (and b!92108 res!46856) b!92117))

(declare-fun m!99095 () Bool)

(assert (=> d!24265 m!99095))

(declare-fun m!99097 () Bool)

(assert (=> d!24265 m!99097))

(declare-fun m!99099 () Bool)

(assert (=> bm!9063 m!99099))

(declare-fun m!99101 () Bool)

(assert (=> b!92108 m!99101))

(declare-fun m!99103 () Bool)

(assert (=> b!92115 m!99103))

(declare-fun m!99105 () Bool)

(assert (=> b!92117 m!99105))

(assert (=> d!24049 d!24265))

(declare-fun d!24267 () Bool)

(declare-fun e!60060 () Bool)

(assert (=> d!24267 e!60060))

(declare-fun res!46857 () Bool)

(assert (=> d!24267 (=> res!46857 e!60060)))

(declare-fun lt!45103 () Bool)

(assert (=> d!24267 (= res!46857 (not lt!45103))))

(declare-fun lt!45101 () Bool)

(assert (=> d!24267 (= lt!45103 lt!45101)))

(declare-fun lt!45102 () Unit!2718)

(declare-fun e!60061 () Unit!2718)

(assert (=> d!24267 (= lt!45102 e!60061)))

(declare-fun c!15334 () Bool)

(assert (=> d!24267 (= c!15334 lt!45101)))

(assert (=> d!24267 (= lt!45101 (containsKey!147 (toList!754 lt!44671) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24267 (= (contains!772 lt!44671 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45103)))

(declare-fun b!92118 () Bool)

(declare-fun lt!45100 () Unit!2718)

(assert (=> b!92118 (= e!60061 lt!45100)))

(assert (=> b!92118 (= lt!45100 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44671) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92118 (isDefined!97 (getValueByKey!143 (toList!754 lt!44671) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92119 () Bool)

(declare-fun Unit!2746 () Unit!2718)

(assert (=> b!92119 (= e!60061 Unit!2746)))

(declare-fun b!92120 () Bool)

(assert (=> b!92120 (= e!60060 (isDefined!97 (getValueByKey!143 (toList!754 lt!44671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24267 c!15334) b!92118))

(assert (= (and d!24267 (not c!15334)) b!92119))

(assert (= (and d!24267 (not res!46857)) b!92120))

(declare-fun m!99107 () Bool)

(assert (=> d!24267 m!99107))

(declare-fun m!99109 () Bool)

(assert (=> b!92118 m!99109))

(assert (=> b!92118 m!98435))

(assert (=> b!92118 m!98435))

(declare-fun m!99111 () Bool)

(assert (=> b!92118 m!99111))

(assert (=> b!92120 m!98435))

(assert (=> b!92120 m!98435))

(assert (=> b!92120 m!99111))

(assert (=> bm!8930 d!24267))

(declare-fun d!24269 () Bool)

(declare-fun e!60062 () Bool)

(assert (=> d!24269 e!60062))

(declare-fun res!46858 () Bool)

(assert (=> d!24269 (=> (not res!46858) (not e!60062))))

(declare-fun lt!45104 () ListLongMap!1477)

(assert (=> d!24269 (= res!46858 (contains!772 lt!45104 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45107 () List!1555)

(assert (=> d!24269 (= lt!45104 (ListLongMap!1478 lt!45107))))

(declare-fun lt!45106 () Unit!2718)

(declare-fun lt!45105 () Unit!2718)

(assert (=> d!24269 (= lt!45106 lt!45105)))

(assert (=> d!24269 (= (getValueByKey!143 lt!45107 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24269 (= lt!45105 (lemmaContainsTupThenGetReturnValue!63 lt!45107 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24269 (= lt!45107 (insertStrictlySorted!66 (toList!754 call!8937) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24269 (= (+!119 call!8937 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45104)))

(declare-fun b!92121 () Bool)

(declare-fun res!46859 () Bool)

(assert (=> b!92121 (=> (not res!46859) (not e!60062))))

(assert (=> b!92121 (= res!46859 (= (getValueByKey!143 (toList!754 lt!45104) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92122 () Bool)

(assert (=> b!92122 (= e!60062 (contains!773 (toList!754 lt!45104) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24269 res!46858) b!92121))

(assert (= (and b!92121 res!46859) b!92122))

(declare-fun m!99113 () Bool)

(assert (=> d!24269 m!99113))

(declare-fun m!99115 () Bool)

(assert (=> d!24269 m!99115))

(declare-fun m!99117 () Bool)

(assert (=> d!24269 m!99117))

(declare-fun m!99119 () Bool)

(assert (=> d!24269 m!99119))

(declare-fun m!99121 () Bool)

(assert (=> b!92121 m!99121))

(declare-fun m!99123 () Bool)

(assert (=> b!92122 m!99123))

(assert (=> b!91504 d!24269))

(declare-fun d!24271 () Bool)

(declare-fun e!60063 () Bool)

(assert (=> d!24271 e!60063))

(declare-fun res!46860 () Bool)

(assert (=> d!24271 (=> res!46860 e!60063)))

(declare-fun lt!45111 () Bool)

(assert (=> d!24271 (= res!46860 (not lt!45111))))

(declare-fun lt!45109 () Bool)

(assert (=> d!24271 (= lt!45111 lt!45109)))

(declare-fun lt!45110 () Unit!2718)

(declare-fun e!60064 () Unit!2718)

(assert (=> d!24271 (= lt!45110 e!60064)))

(declare-fun c!15335 () Bool)

(assert (=> d!24271 (= c!15335 lt!45109)))

(assert (=> d!24271 (= lt!45109 (containsKey!147 (toList!754 lt!44751) (_1!1139 lt!44492)))))

(assert (=> d!24271 (= (contains!772 lt!44751 (_1!1139 lt!44492)) lt!45111)))

(declare-fun b!92123 () Bool)

(declare-fun lt!45108 () Unit!2718)

(assert (=> b!92123 (= e!60064 lt!45108)))

(assert (=> b!92123 (= lt!45108 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44751) (_1!1139 lt!44492)))))

(assert (=> b!92123 (isDefined!97 (getValueByKey!143 (toList!754 lt!44751) (_1!1139 lt!44492)))))

(declare-fun b!92124 () Bool)

(declare-fun Unit!2747 () Unit!2718)

(assert (=> b!92124 (= e!60064 Unit!2747)))

(declare-fun b!92125 () Bool)

(assert (=> b!92125 (= e!60063 (isDefined!97 (getValueByKey!143 (toList!754 lt!44751) (_1!1139 lt!44492))))))

(assert (= (and d!24271 c!15335) b!92123))

(assert (= (and d!24271 (not c!15335)) b!92124))

(assert (= (and d!24271 (not res!46860)) b!92125))

(declare-fun m!99125 () Bool)

(assert (=> d!24271 m!99125))

(declare-fun m!99127 () Bool)

(assert (=> b!92123 m!99127))

(assert (=> b!92123 m!98331))

(assert (=> b!92123 m!98331))

(declare-fun m!99129 () Bool)

(assert (=> b!92123 m!99129))

(assert (=> b!92125 m!98331))

(assert (=> b!92125 m!98331))

(assert (=> b!92125 m!99129))

(assert (=> d!24067 d!24271))

(declare-fun d!24273 () Bool)

(declare-fun c!15336 () Bool)

(assert (=> d!24273 (= c!15336 (and ((_ is Cons!1551) lt!44754) (= (_1!1139 (h!2143 lt!44754)) (_1!1139 lt!44492))))))

(declare-fun e!60065 () Option!149)

(assert (=> d!24273 (= (getValueByKey!143 lt!44754 (_1!1139 lt!44492)) e!60065)))

(declare-fun b!92128 () Bool)

(declare-fun e!60066 () Option!149)

(assert (=> b!92128 (= e!60066 (getValueByKey!143 (t!5380 lt!44754) (_1!1139 lt!44492)))))

(declare-fun b!92127 () Bool)

(assert (=> b!92127 (= e!60065 e!60066)))

(declare-fun c!15337 () Bool)

(assert (=> b!92127 (= c!15337 (and ((_ is Cons!1551) lt!44754) (not (= (_1!1139 (h!2143 lt!44754)) (_1!1139 lt!44492)))))))

(declare-fun b!92129 () Bool)

(assert (=> b!92129 (= e!60066 None!147)))

(declare-fun b!92126 () Bool)

(assert (=> b!92126 (= e!60065 (Some!148 (_2!1139 (h!2143 lt!44754))))))

(assert (= (and d!24273 c!15336) b!92126))

(assert (= (and d!24273 (not c!15336)) b!92127))

(assert (= (and b!92127 c!15337) b!92128))

(assert (= (and b!92127 (not c!15337)) b!92129))

(declare-fun m!99131 () Bool)

(assert (=> b!92128 m!99131))

(assert (=> d!24067 d!24273))

(declare-fun d!24275 () Bool)

(assert (=> d!24275 (= (getValueByKey!143 lt!44754 (_1!1139 lt!44492)) (Some!148 (_2!1139 lt!44492)))))

(declare-fun lt!45112 () Unit!2718)

(assert (=> d!24275 (= lt!45112 (choose!554 lt!44754 (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(declare-fun e!60067 () Bool)

(assert (=> d!24275 e!60067))

(declare-fun res!46861 () Bool)

(assert (=> d!24275 (=> (not res!46861) (not e!60067))))

(assert (=> d!24275 (= res!46861 (isStrictlySorted!296 lt!44754))))

(assert (=> d!24275 (= (lemmaContainsTupThenGetReturnValue!63 lt!44754 (_1!1139 lt!44492) (_2!1139 lt!44492)) lt!45112)))

(declare-fun b!92130 () Bool)

(declare-fun res!46862 () Bool)

(assert (=> b!92130 (=> (not res!46862) (not e!60067))))

(assert (=> b!92130 (= res!46862 (containsKey!147 lt!44754 (_1!1139 lt!44492)))))

(declare-fun b!92131 () Bool)

(assert (=> b!92131 (= e!60067 (contains!773 lt!44754 (tuple2!2257 (_1!1139 lt!44492) (_2!1139 lt!44492))))))

(assert (= (and d!24275 res!46861) b!92130))

(assert (= (and b!92130 res!46862) b!92131))

(assert (=> d!24275 m!98325))

(declare-fun m!99133 () Bool)

(assert (=> d!24275 m!99133))

(declare-fun m!99135 () Bool)

(assert (=> d!24275 m!99135))

(declare-fun m!99137 () Bool)

(assert (=> b!92130 m!99137))

(declare-fun m!99139 () Bool)

(assert (=> b!92131 m!99139))

(assert (=> d!24067 d!24275))

(declare-fun b!92132 () Bool)

(declare-fun res!46864 () Bool)

(declare-fun e!60072 () Bool)

(assert (=> b!92132 (=> (not res!46864) (not e!60072))))

(declare-fun lt!45113 () List!1555)

(assert (=> b!92132 (= res!46864 (containsKey!147 lt!45113 (_1!1139 lt!44492)))))

(declare-fun b!92133 () Bool)

(declare-fun e!60071 () List!1555)

(declare-fun call!9068 () List!1555)

(assert (=> b!92133 (= e!60071 call!9068)))

(declare-fun d!24277 () Bool)

(assert (=> d!24277 e!60072))

(declare-fun res!46863 () Bool)

(assert (=> d!24277 (=> (not res!46863) (not e!60072))))

(assert (=> d!24277 (= res!46863 (isStrictlySorted!296 lt!45113))))

(assert (=> d!24277 (= lt!45113 e!60071)))

(declare-fun c!15339 () Bool)

(assert (=> d!24277 (= c!15339 (and ((_ is Cons!1551) (toList!754 lt!44485)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44485))) (_1!1139 lt!44492))))))

(assert (=> d!24277 (isStrictlySorted!296 (toList!754 lt!44485))))

(assert (=> d!24277 (= (insertStrictlySorted!66 (toList!754 lt!44485) (_1!1139 lt!44492) (_2!1139 lt!44492)) lt!45113)))

(declare-fun bm!9065 () Bool)

(declare-fun call!9070 () List!1555)

(assert (=> bm!9065 (= call!9070 call!9068)))

(declare-fun b!92134 () Bool)

(declare-fun e!60068 () List!1555)

(assert (=> b!92134 (= e!60071 e!60068)))

(declare-fun c!15338 () Bool)

(assert (=> b!92134 (= c!15338 (and ((_ is Cons!1551) (toList!754 lt!44485)) (= (_1!1139 (h!2143 (toList!754 lt!44485))) (_1!1139 lt!44492))))))

(declare-fun c!15340 () Bool)

(declare-fun e!60069 () List!1555)

(declare-fun b!92135 () Bool)

(assert (=> b!92135 (= e!60069 (ite c!15338 (t!5380 (toList!754 lt!44485)) (ite c!15340 (Cons!1551 (h!2143 (toList!754 lt!44485)) (t!5380 (toList!754 lt!44485))) Nil!1552)))))

(declare-fun b!92136 () Bool)

(declare-fun e!60070 () List!1555)

(declare-fun call!9069 () List!1555)

(assert (=> b!92136 (= e!60070 call!9069)))

(declare-fun b!92137 () Bool)

(assert (=> b!92137 (= e!60070 call!9069)))

(declare-fun b!92138 () Bool)

(assert (=> b!92138 (= e!60068 call!9070)))

(declare-fun bm!9066 () Bool)

(assert (=> bm!9066 (= call!9068 ($colon$colon!74 e!60069 (ite c!15339 (h!2143 (toList!754 lt!44485)) (tuple2!2257 (_1!1139 lt!44492) (_2!1139 lt!44492)))))))

(declare-fun c!15341 () Bool)

(assert (=> bm!9066 (= c!15341 c!15339)))

(declare-fun b!92139 () Bool)

(assert (=> b!92139 (= e!60069 (insertStrictlySorted!66 (t!5380 (toList!754 lt!44485)) (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(declare-fun bm!9067 () Bool)

(assert (=> bm!9067 (= call!9069 call!9070)))

(declare-fun b!92140 () Bool)

(assert (=> b!92140 (= c!15340 (and ((_ is Cons!1551) (toList!754 lt!44485)) (bvsgt (_1!1139 (h!2143 (toList!754 lt!44485))) (_1!1139 lt!44492))))))

(assert (=> b!92140 (= e!60068 e!60070)))

(declare-fun b!92141 () Bool)

(assert (=> b!92141 (= e!60072 (contains!773 lt!45113 (tuple2!2257 (_1!1139 lt!44492) (_2!1139 lt!44492))))))

(assert (= (and d!24277 c!15339) b!92133))

(assert (= (and d!24277 (not c!15339)) b!92134))

(assert (= (and b!92134 c!15338) b!92138))

(assert (= (and b!92134 (not c!15338)) b!92140))

(assert (= (and b!92140 c!15340) b!92136))

(assert (= (and b!92140 (not c!15340)) b!92137))

(assert (= (or b!92136 b!92137) bm!9067))

(assert (= (or b!92138 bm!9067) bm!9065))

(assert (= (or b!92133 bm!9065) bm!9066))

(assert (= (and bm!9066 c!15341) b!92139))

(assert (= (and bm!9066 (not c!15341)) b!92135))

(assert (= (and d!24277 res!46863) b!92132))

(assert (= (and b!92132 res!46864) b!92141))

(declare-fun m!99141 () Bool)

(assert (=> d!24277 m!99141))

(declare-fun m!99143 () Bool)

(assert (=> d!24277 m!99143))

(declare-fun m!99145 () Bool)

(assert (=> bm!9066 m!99145))

(declare-fun m!99147 () Bool)

(assert (=> b!92132 m!99147))

(declare-fun m!99149 () Bool)

(assert (=> b!92139 m!99149))

(declare-fun m!99151 () Bool)

(assert (=> b!92141 m!99151))

(assert (=> d!24067 d!24277))

(assert (=> b!91596 d!24077))

(declare-fun b!92142 () Bool)

(declare-fun res!46868 () Bool)

(declare-fun e!60073 () Bool)

(assert (=> b!92142 (=> (not res!46868) (not e!60073))))

(assert (=> b!92142 (= res!46868 (and (= (size!2203 (_values!2388 (_2!1138 lt!44500))) (bvadd (mask!6464 (_2!1138 lt!44500)) #b00000000000000000000000000000001)) (= (size!2202 (_keys!4084 (_2!1138 lt!44500))) (size!2203 (_values!2388 (_2!1138 lt!44500)))) (bvsge (_size!450 (_2!1138 lt!44500)) #b00000000000000000000000000000000) (bvsle (_size!450 (_2!1138 lt!44500)) (bvadd (mask!6464 (_2!1138 lt!44500)) #b00000000000000000000000000000001))))))

(declare-fun d!24279 () Bool)

(declare-fun res!46866 () Bool)

(assert (=> d!24279 (=> (not res!46866) (not e!60073))))

(assert (=> d!24279 (= res!46866 (validMask!0 (mask!6464 (_2!1138 lt!44500))))))

(assert (=> d!24279 (= (simpleValid!63 (_2!1138 lt!44500)) e!60073)))

(declare-fun b!92144 () Bool)

(declare-fun res!46865 () Bool)

(assert (=> b!92144 (=> (not res!46865) (not e!60073))))

(assert (=> b!92144 (= res!46865 (= (size!2208 (_2!1138 lt!44500)) (bvadd (_size!450 (_2!1138 lt!44500)) (bvsdiv (bvadd (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!92145 () Bool)

(assert (=> b!92145 (= e!60073 (and (bvsge (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000000) (bvsle (extraKeys!2236 (_2!1138 lt!44500)) #b00000000000000000000000000000011) (bvsge (_vacant!450 (_2!1138 lt!44500)) #b00000000000000000000000000000000)))))

(declare-fun b!92143 () Bool)

(declare-fun res!46867 () Bool)

(assert (=> b!92143 (=> (not res!46867) (not e!60073))))

(assert (=> b!92143 (= res!46867 (bvsge (size!2208 (_2!1138 lt!44500)) (_size!450 (_2!1138 lt!44500))))))

(assert (= (and d!24279 res!46866) b!92142))

(assert (= (and b!92142 res!46868) b!92143))

(assert (= (and b!92143 res!46867) b!92144))

(assert (= (and b!92144 res!46865) b!92145))

(assert (=> d!24279 m!98597))

(declare-fun m!99153 () Bool)

(assert (=> b!92144 m!99153))

(assert (=> b!92143 m!99153))

(assert (=> d!24047 d!24279))

(declare-fun d!24281 () Bool)

(assert (=> d!24281 (= (apply!87 lt!44730 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (get!1244 (getValueByKey!143 (toList!754 lt!44730) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(declare-fun bs!3816 () Bool)

(assert (= bs!3816 d!24281))

(assert (=> bs!3816 m!97899))

(declare-fun m!99155 () Bool)

(assert (=> bs!3816 m!99155))

(assert (=> bs!3816 m!99155))

(declare-fun m!99157 () Bool)

(assert (=> bs!3816 m!99157))

(assert (=> b!91571 d!24281))

(assert (=> b!91571 d!24087))

(assert (=> b!91491 d!24115))

(declare-fun d!24283 () Bool)

(declare-fun e!60074 () Bool)

(assert (=> d!24283 e!60074))

(declare-fun res!46869 () Bool)

(assert (=> d!24283 (=> (not res!46869) (not e!60074))))

(declare-fun lt!45114 () ListLongMap!1477)

(assert (=> d!24283 (= res!46869 (contains!772 lt!45114 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun lt!45117 () List!1555)

(assert (=> d!24283 (= lt!45114 (ListLongMap!1478 lt!45117))))

(declare-fun lt!45116 () Unit!2718)

(declare-fun lt!45115 () Unit!2718)

(assert (=> d!24283 (= lt!45116 lt!45115)))

(assert (=> d!24283 (= (getValueByKey!143 lt!45117 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24283 (= lt!45115 (lemmaContainsTupThenGetReturnValue!63 lt!45117 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24283 (= lt!45117 (insertStrictlySorted!66 (toList!754 call!9010) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24283 (= (+!119 call!9010 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) lt!45114)))

(declare-fun b!92146 () Bool)

(declare-fun res!46870 () Bool)

(assert (=> b!92146 (=> (not res!46870) (not e!60074))))

(assert (=> b!92146 (= res!46870 (= (getValueByKey!143 (toList!754 lt!45114) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(declare-fun b!92147 () Bool)

(assert (=> b!92147 (= e!60074 (contains!773 (toList!754 lt!45114) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (= (and d!24283 res!46869) b!92146))

(assert (= (and b!92146 res!46870) b!92147))

(declare-fun m!99159 () Bool)

(assert (=> d!24283 m!99159))

(declare-fun m!99161 () Bool)

(assert (=> d!24283 m!99161))

(declare-fun m!99163 () Bool)

(assert (=> d!24283 m!99163))

(declare-fun m!99165 () Bool)

(assert (=> d!24283 m!99165))

(declare-fun m!99167 () Bool)

(assert (=> b!92146 m!99167))

(declare-fun m!99169 () Bool)

(assert (=> b!92147 m!99169))

(assert (=> b!91749 d!24283))

(declare-fun d!24285 () Bool)

(declare-fun res!46871 () Bool)

(declare-fun e!60075 () Bool)

(assert (=> d!24285 (=> res!46871 e!60075)))

(assert (=> d!24285 (= res!46871 (= (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24285 (= (arrayContainsKey!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000) e!60075)))

(declare-fun b!92148 () Bool)

(declare-fun e!60076 () Bool)

(assert (=> b!92148 (= e!60075 e!60076)))

(declare-fun res!46872 () Bool)

(assert (=> b!92148 (=> (not res!46872) (not e!60076))))

(assert (=> b!92148 (= res!46872 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!92149 () Bool)

(assert (=> b!92149 (= e!60076 (arrayContainsKey!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!24285 (not res!46871)) b!92148))

(assert (= (and b!92148 res!46872) b!92149))

(assert (=> d!24285 m!98447))

(assert (=> b!92149 m!97899))

(declare-fun m!99171 () Bool)

(assert (=> b!92149 m!99171))

(assert (=> bm!9009 d!24285))

(assert (=> b!91547 d!24115))

(declare-fun d!24287 () Bool)

(assert (=> d!24287 (= (map!1213 (_2!1138 lt!44835)) (getCurrentListMap!437 (_keys!4084 (_2!1138 lt!44835)) (_values!2388 (_2!1138 lt!44835)) (mask!6464 (_2!1138 lt!44835)) (extraKeys!2236 (_2!1138 lt!44835)) (zeroValue!2293 (_2!1138 lt!44835)) (minValue!2293 (_2!1138 lt!44835)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1138 lt!44835))))))

(declare-fun bs!3817 () Bool)

(assert (= bs!3817 d!24287))

(declare-fun m!99173 () Bool)

(assert (=> bs!3817 m!99173))

(assert (=> bm!9018 d!24287))

(assert (=> b!91627 d!24135))

(assert (=> b!91627 d!24137))

(declare-fun d!24289 () Bool)

(declare-fun c!15342 () Bool)

(assert (=> d!24289 (= c!15342 (and ((_ is Cons!1551) (toList!754 lt!44751)) (= (_1!1139 (h!2143 (toList!754 lt!44751))) (_1!1139 lt!44492))))))

(declare-fun e!60077 () Option!149)

(assert (=> d!24289 (= (getValueByKey!143 (toList!754 lt!44751) (_1!1139 lt!44492)) e!60077)))

(declare-fun b!92152 () Bool)

(declare-fun e!60078 () Option!149)

(assert (=> b!92152 (= e!60078 (getValueByKey!143 (t!5380 (toList!754 lt!44751)) (_1!1139 lt!44492)))))

(declare-fun b!92151 () Bool)

(assert (=> b!92151 (= e!60077 e!60078)))

(declare-fun c!15343 () Bool)

(assert (=> b!92151 (= c!15343 (and ((_ is Cons!1551) (toList!754 lt!44751)) (not (= (_1!1139 (h!2143 (toList!754 lt!44751))) (_1!1139 lt!44492)))))))

(declare-fun b!92153 () Bool)

(assert (=> b!92153 (= e!60078 None!147)))

(declare-fun b!92150 () Bool)

(assert (=> b!92150 (= e!60077 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44751)))))))

(assert (= (and d!24289 c!15342) b!92150))

(assert (= (and d!24289 (not c!15342)) b!92151))

(assert (= (and b!92151 c!15343) b!92152))

(assert (= (and b!92151 (not c!15343)) b!92153))

(declare-fun m!99175 () Bool)

(assert (=> b!92152 m!99175))

(assert (=> b!91582 d!24289))

(declare-fun c!15349 () Bool)

(declare-fun lt!45123 () SeekEntryResult!251)

(declare-fun call!9076 () Bool)

(declare-fun bm!9072 () Bool)

(assert (=> bm!9072 (= call!9076 (inRange!0 (ite c!15349 (index!3144 lt!45123) (index!3147 lt!45123)) (mask!6464 newMap!16)))))

(declare-fun b!92170 () Bool)

(declare-fun e!60090 () Bool)

(declare-fun call!9075 () Bool)

(assert (=> b!92170 (= e!60090 (not call!9075))))

(declare-fun b!92171 () Bool)

(declare-fun e!60087 () Bool)

(assert (=> b!92171 (= e!60087 ((_ is Undefined!251) lt!45123))))

(declare-fun bm!9073 () Bool)

(assert (=> bm!9073 (= call!9075 (arrayContainsKey!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!92172 () Bool)

(declare-fun e!60089 () Bool)

(assert (=> b!92172 (= e!60089 e!60087)))

(declare-fun c!15348 () Bool)

(assert (=> b!92172 (= c!15348 ((_ is MissingVacant!251) lt!45123))))

(declare-fun b!92173 () Bool)

(declare-fun e!60088 () Bool)

(assert (=> b!92173 (= e!60088 (not call!9075))))

(declare-fun d!24291 () Bool)

(assert (=> d!24291 e!60089))

(assert (=> d!24291 (= c!15349 ((_ is MissingZero!251) lt!45123))))

(assert (=> d!24291 (= lt!45123 (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(declare-fun lt!45122 () Unit!2718)

(declare-fun choose!560 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2718)

(assert (=> d!24291 (= lt!45122 (choose!560 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24291 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24291 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)) lt!45122)))

(declare-fun b!92174 () Bool)

(declare-fun res!46884 () Bool)

(assert (=> b!92174 (=> (not res!46884) (not e!60088))))

(assert (=> b!92174 (= res!46884 call!9076)))

(assert (=> b!92174 (= e!60087 e!60088)))

(declare-fun b!92175 () Bool)

(assert (=> b!92175 (= e!60089 e!60090)))

(declare-fun res!46881 () Bool)

(assert (=> b!92175 (= res!46881 call!9076)))

(assert (=> b!92175 (=> (not res!46881) (not e!60090))))

(declare-fun b!92176 () Bool)

(assert (=> b!92176 (and (bvsge (index!3144 lt!45123) #b00000000000000000000000000000000) (bvslt (index!3144 lt!45123) (size!2202 (_keys!4084 newMap!16))))))

(declare-fun res!46882 () Bool)

(assert (=> b!92176 (= res!46882 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3144 lt!45123)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92176 (=> (not res!46882) (not e!60090))))

(declare-fun b!92177 () Bool)

(declare-fun res!46883 () Bool)

(assert (=> b!92177 (=> (not res!46883) (not e!60088))))

(assert (=> b!92177 (= res!46883 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3147 lt!45123)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92177 (and (bvsge (index!3147 lt!45123) #b00000000000000000000000000000000) (bvslt (index!3147 lt!45123) (size!2202 (_keys!4084 newMap!16))))))

(assert (= (and d!24291 c!15349) b!92175))

(assert (= (and d!24291 (not c!15349)) b!92172))

(assert (= (and b!92175 res!46881) b!92176))

(assert (= (and b!92176 res!46882) b!92170))

(assert (= (and b!92172 c!15348) b!92174))

(assert (= (and b!92172 (not c!15348)) b!92171))

(assert (= (and b!92174 res!46884) b!92177))

(assert (= (and b!92177 res!46883) b!92173))

(assert (= (or b!92175 b!92174) bm!9072))

(assert (= (or b!92170 b!92173) bm!9073))

(assert (=> d!24291 m!97899))

(assert (=> d!24291 m!98381))

(assert (=> d!24291 m!97899))

(declare-fun m!99177 () Bool)

(assert (=> d!24291 m!99177))

(assert (=> d!24291 m!98497))

(declare-fun m!99179 () Bool)

(assert (=> bm!9072 m!99179))

(assert (=> bm!9073 m!97899))

(assert (=> bm!9073 m!98403))

(declare-fun m!99181 () Bool)

(assert (=> b!92176 m!99181))

(declare-fun m!99183 () Bool)

(assert (=> b!92177 m!99183))

(assert (=> bm!9010 d!24291))

(declare-fun d!24293 () Bool)

(declare-fun lt!45124 () Bool)

(assert (=> d!24293 (= lt!45124 (select (content!95 (toList!754 lt!44735)) lt!44489))))

(declare-fun e!60092 () Bool)

(assert (=> d!24293 (= lt!45124 e!60092)))

(declare-fun res!46885 () Bool)

(assert (=> d!24293 (=> (not res!46885) (not e!60092))))

(assert (=> d!24293 (= res!46885 ((_ is Cons!1551) (toList!754 lt!44735)))))

(assert (=> d!24293 (= (contains!773 (toList!754 lt!44735) lt!44489) lt!45124)))

(declare-fun b!92178 () Bool)

(declare-fun e!60091 () Bool)

(assert (=> b!92178 (= e!60092 e!60091)))

(declare-fun res!46886 () Bool)

(assert (=> b!92178 (=> res!46886 e!60091)))

(assert (=> b!92178 (= res!46886 (= (h!2143 (toList!754 lt!44735)) lt!44489))))

(declare-fun b!92179 () Bool)

(assert (=> b!92179 (= e!60091 (contains!773 (t!5380 (toList!754 lt!44735)) lt!44489))))

(assert (= (and d!24293 res!46885) b!92178))

(assert (= (and b!92178 (not res!46886)) b!92179))

(declare-fun m!99185 () Bool)

(assert (=> d!24293 m!99185))

(declare-fun m!99187 () Bool)

(assert (=> d!24293 m!99187))

(declare-fun m!99189 () Bool)

(assert (=> b!92179 m!99189))

(assert (=> b!91577 d!24293))

(declare-fun d!24295 () Bool)

(declare-fun lt!45125 () Bool)

(assert (=> d!24295 (= lt!45125 (select (content!95 (toList!754 lt!44688)) lt!44495))))

(declare-fun e!60094 () Bool)

(assert (=> d!24295 (= lt!45125 e!60094)))

(declare-fun res!46887 () Bool)

(assert (=> d!24295 (=> (not res!46887) (not e!60094))))

(assert (=> d!24295 (= res!46887 ((_ is Cons!1551) (toList!754 lt!44688)))))

(assert (=> d!24295 (= (contains!773 (toList!754 lt!44688) lt!44495) lt!45125)))

(declare-fun b!92180 () Bool)

(declare-fun e!60093 () Bool)

(assert (=> b!92180 (= e!60094 e!60093)))

(declare-fun res!46888 () Bool)

(assert (=> b!92180 (=> res!46888 e!60093)))

(assert (=> b!92180 (= res!46888 (= (h!2143 (toList!754 lt!44688)) lt!44495))))

(declare-fun b!92181 () Bool)

(assert (=> b!92181 (= e!60093 (contains!773 (t!5380 (toList!754 lt!44688)) lt!44495))))

(assert (= (and d!24295 res!46887) b!92180))

(assert (= (and b!92180 (not res!46888)) b!92181))

(declare-fun m!99191 () Bool)

(assert (=> d!24295 m!99191))

(declare-fun m!99193 () Bool)

(assert (=> d!24295 m!99193))

(declare-fun m!99195 () Bool)

(assert (=> b!92181 m!99195))

(assert (=> b!91518 d!24295))

(declare-fun d!24297 () Bool)

(declare-fun lt!45126 () Bool)

(assert (=> d!24297 (= lt!45126 (select (content!95 (toList!754 lt!44743)) lt!44492))))

(declare-fun e!60096 () Bool)

(assert (=> d!24297 (= lt!45126 e!60096)))

(declare-fun res!46889 () Bool)

(assert (=> d!24297 (=> (not res!46889) (not e!60096))))

(assert (=> d!24297 (= res!46889 ((_ is Cons!1551) (toList!754 lt!44743)))))

(assert (=> d!24297 (= (contains!773 (toList!754 lt!44743) lt!44492) lt!45126)))

(declare-fun b!92182 () Bool)

(declare-fun e!60095 () Bool)

(assert (=> b!92182 (= e!60096 e!60095)))

(declare-fun res!46890 () Bool)

(assert (=> b!92182 (=> res!46890 e!60095)))

(assert (=> b!92182 (= res!46890 (= (h!2143 (toList!754 lt!44743)) lt!44492))))

(declare-fun b!92183 () Bool)

(assert (=> b!92183 (= e!60095 (contains!773 (t!5380 (toList!754 lt!44743)) lt!44492))))

(assert (= (and d!24297 res!46889) b!92182))

(assert (= (and b!92182 (not res!46890)) b!92183))

(declare-fun m!99197 () Bool)

(assert (=> d!24297 m!99197))

(declare-fun m!99199 () Bool)

(assert (=> d!24297 m!99199))

(declare-fun m!99201 () Bool)

(assert (=> b!92183 m!99201))

(assert (=> b!91581 d!24297))

(declare-fun d!24299 () Bool)

(assert (=> d!24299 (= (apply!87 (+!119 lt!44675 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44655) (apply!87 lt!44675 lt!44655))))

(declare-fun lt!45127 () Unit!2718)

(assert (=> d!24299 (= lt!45127 (choose!556 lt!44675 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44655))))

(declare-fun e!60097 () Bool)

(assert (=> d!24299 e!60097))

(declare-fun res!46891 () Bool)

(assert (=> d!24299 (=> (not res!46891) (not e!60097))))

(assert (=> d!24299 (= res!46891 (contains!772 lt!44675 lt!44655))))

(assert (=> d!24299 (= (addApplyDifferent!63 lt!44675 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44655) lt!45127)))

(declare-fun b!92184 () Bool)

(assert (=> b!92184 (= e!60097 (not (= lt!44655 lt!44654)))))

(assert (= (and d!24299 res!46891) b!92184))

(declare-fun m!99203 () Bool)

(assert (=> d!24299 m!99203))

(declare-fun m!99205 () Bool)

(assert (=> d!24299 m!99205))

(assert (=> d!24299 m!98123))

(assert (=> d!24299 m!98135))

(assert (=> d!24299 m!98143))

(assert (=> d!24299 m!98123))

(assert (=> b!91498 d!24299))

(declare-fun d!24301 () Bool)

(declare-fun e!60098 () Bool)

(assert (=> d!24301 e!60098))

(declare-fun res!46892 () Bool)

(assert (=> d!24301 (=> (not res!46892) (not e!60098))))

(declare-fun lt!45128 () ListLongMap!1477)

(assert (=> d!24301 (= res!46892 (contains!772 lt!45128 (_1!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45131 () List!1555)

(assert (=> d!24301 (= lt!45128 (ListLongMap!1478 lt!45131))))

(declare-fun lt!45130 () Unit!2718)

(declare-fun lt!45129 () Unit!2718)

(assert (=> d!24301 (= lt!45130 lt!45129)))

(assert (=> d!24301 (= (getValueByKey!143 lt!45131 (_1!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24301 (= lt!45129 (lemmaContainsTupThenGetReturnValue!63 lt!45131 (_1!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24301 (= lt!45131 (insertStrictlySorted!66 (toList!754 lt!44669) (_1!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24301 (= (+!119 lt!44669 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45128)))

(declare-fun b!92185 () Bool)

(declare-fun res!46893 () Bool)

(assert (=> b!92185 (=> (not res!46893) (not e!60098))))

(assert (=> b!92185 (= res!46893 (= (getValueByKey!143 (toList!754 lt!45128) (_1!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92186 () Bool)

(assert (=> b!92186 (= e!60098 (contains!773 (toList!754 lt!45128) (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24301 res!46892) b!92185))

(assert (= (and b!92185 res!46893) b!92186))

(declare-fun m!99207 () Bool)

(assert (=> d!24301 m!99207))

(declare-fun m!99209 () Bool)

(assert (=> d!24301 m!99209))

(declare-fun m!99211 () Bool)

(assert (=> d!24301 m!99211))

(declare-fun m!99213 () Bool)

(assert (=> d!24301 m!99213))

(declare-fun m!99215 () Bool)

(assert (=> b!92185 m!99215))

(declare-fun m!99217 () Bool)

(assert (=> b!92186 m!99217))

(assert (=> b!91498 d!24301))

(declare-fun d!24303 () Bool)

(assert (=> d!24303 (contains!772 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44663)))

(declare-fun lt!45132 () Unit!2718)

(assert (=> d!24303 (= lt!45132 (choose!557 lt!44662 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44663))))

(assert (=> d!24303 (contains!772 lt!44662 lt!44663)))

(assert (=> d!24303 (= (addStillContains!63 lt!44662 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44663) lt!45132)))

(declare-fun bs!3818 () Bool)

(assert (= bs!3818 d!24303))

(assert (=> bs!3818 m!98115))

(assert (=> bs!3818 m!98115))

(assert (=> bs!3818 m!98117))

(declare-fun m!99219 () Bool)

(assert (=> bs!3818 m!99219))

(declare-fun m!99221 () Bool)

(assert (=> bs!3818 m!99221))

(assert (=> b!91498 d!24303))

(declare-fun d!24305 () Bool)

(assert (=> d!24305 (= (apply!87 lt!44665 lt!44670) (get!1244 (getValueByKey!143 (toList!754 lt!44665) lt!44670)))))

(declare-fun bs!3819 () Bool)

(assert (= bs!3819 d!24305))

(declare-fun m!99223 () Bool)

(assert (=> bs!3819 m!99223))

(assert (=> bs!3819 m!99223))

(declare-fun m!99225 () Bool)

(assert (=> bs!3819 m!99225))

(assert (=> b!91498 d!24305))

(declare-fun d!24307 () Bool)

(assert (=> d!24307 (= (apply!87 lt!44669 lt!44667) (get!1244 (getValueByKey!143 (toList!754 lt!44669) lt!44667)))))

(declare-fun bs!3820 () Bool)

(assert (= bs!3820 d!24307))

(declare-fun m!99227 () Bool)

(assert (=> bs!3820 m!99227))

(assert (=> bs!3820 m!99227))

(declare-fun m!99229 () Bool)

(assert (=> bs!3820 m!99229))

(assert (=> b!91498 d!24307))

(declare-fun d!24309 () Bool)

(assert (=> d!24309 (= (apply!87 (+!119 lt!44669 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44667) (get!1244 (getValueByKey!143 (toList!754 (+!119 lt!44669 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44667)))))

(declare-fun bs!3821 () Bool)

(assert (= bs!3821 d!24309))

(declare-fun m!99231 () Bool)

(assert (=> bs!3821 m!99231))

(assert (=> bs!3821 m!99231))

(declare-fun m!99233 () Bool)

(assert (=> bs!3821 m!99233))

(assert (=> b!91498 d!24309))

(declare-fun d!24311 () Bool)

(declare-fun e!60099 () Bool)

(assert (=> d!24311 e!60099))

(declare-fun res!46894 () Bool)

(assert (=> d!24311 (=> (not res!46894) (not e!60099))))

(declare-fun lt!45133 () ListLongMap!1477)

(assert (=> d!24311 (= res!46894 (contains!772 lt!45133 (_1!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45136 () List!1555)

(assert (=> d!24311 (= lt!45133 (ListLongMap!1478 lt!45136))))

(declare-fun lt!45135 () Unit!2718)

(declare-fun lt!45134 () Unit!2718)

(assert (=> d!24311 (= lt!45135 lt!45134)))

(assert (=> d!24311 (= (getValueByKey!143 lt!45136 (_1!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24311 (= lt!45134 (lemmaContainsTupThenGetReturnValue!63 lt!45136 (_1!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24311 (= lt!45136 (insertStrictlySorted!66 (toList!754 lt!44675) (_1!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24311 (= (+!119 lt!44675 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45133)))

(declare-fun b!92187 () Bool)

(declare-fun res!46895 () Bool)

(assert (=> b!92187 (=> (not res!46895) (not e!60099))))

(assert (=> b!92187 (= res!46895 (= (getValueByKey!143 (toList!754 lt!45133) (_1!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92188 () Bool)

(assert (=> b!92188 (= e!60099 (contains!773 (toList!754 lt!45133) (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24311 res!46894) b!92187))

(assert (= (and b!92187 res!46895) b!92188))

(declare-fun m!99235 () Bool)

(assert (=> d!24311 m!99235))

(declare-fun m!99237 () Bool)

(assert (=> d!24311 m!99237))

(declare-fun m!99239 () Bool)

(assert (=> d!24311 m!99239))

(declare-fun m!99241 () Bool)

(assert (=> d!24311 m!99241))

(declare-fun m!99243 () Bool)

(assert (=> b!92187 m!99243))

(declare-fun m!99245 () Bool)

(assert (=> b!92188 m!99245))

(assert (=> b!91498 d!24311))

(declare-fun d!24313 () Bool)

(assert (=> d!24313 (= (apply!87 (+!119 lt!44669 (tuple2!2257 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44667) (apply!87 lt!44669 lt!44667))))

(declare-fun lt!45137 () Unit!2718)

(assert (=> d!24313 (= lt!45137 (choose!556 lt!44669 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44667))))

(declare-fun e!60100 () Bool)

(assert (=> d!24313 e!60100))

(declare-fun res!46896 () Bool)

(assert (=> d!24313 (=> (not res!46896) (not e!60100))))

(assert (=> d!24313 (= res!46896 (contains!772 lt!44669 lt!44667))))

(assert (=> d!24313 (= (addApplyDifferent!63 lt!44669 lt!44660 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44667) lt!45137)))

(declare-fun b!92189 () Bool)

(assert (=> b!92189 (= e!60100 (not (= lt!44667 lt!44660)))))

(assert (= (and d!24313 res!46896) b!92189))

(declare-fun m!99247 () Bool)

(assert (=> d!24313 m!99247))

(declare-fun m!99249 () Bool)

(assert (=> d!24313 m!99249))

(assert (=> d!24313 m!98137))

(assert (=> d!24313 m!98139))

(assert (=> d!24313 m!98131))

(assert (=> d!24313 m!98137))

(assert (=> b!91498 d!24313))

(declare-fun d!24315 () Bool)

(assert (=> d!24315 (= (apply!87 (+!119 lt!44675 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44655) (get!1244 (getValueByKey!143 (toList!754 (+!119 lt!44675 (tuple2!2257 lt!44654 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44655)))))

(declare-fun bs!3822 () Bool)

(assert (= bs!3822 d!24315))

(declare-fun m!99251 () Bool)

(assert (=> bs!3822 m!99251))

(assert (=> bs!3822 m!99251))

(declare-fun m!99253 () Bool)

(assert (=> bs!3822 m!99253))

(assert (=> b!91498 d!24315))

(declare-fun d!24317 () Bool)

(assert (=> d!24317 (= (apply!87 (+!119 lt!44665 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44670) (apply!87 lt!44665 lt!44670))))

(declare-fun lt!45138 () Unit!2718)

(assert (=> d!24317 (= lt!45138 (choose!556 lt!44665 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44670))))

(declare-fun e!60101 () Bool)

(assert (=> d!24317 e!60101))

(declare-fun res!46897 () Bool)

(assert (=> d!24317 (=> (not res!46897) (not e!60101))))

(assert (=> d!24317 (= res!46897 (contains!772 lt!44665 lt!44670))))

(assert (=> d!24317 (= (addApplyDifferent!63 lt!44665 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))) lt!44670) lt!45138)))

(declare-fun b!92190 () Bool)

(assert (=> b!92190 (= e!60101 (not (= lt!44670 lt!44664)))))

(assert (= (and d!24317 res!46897) b!92190))

(declare-fun m!99255 () Bool)

(assert (=> d!24317 m!99255))

(declare-fun m!99257 () Bool)

(assert (=> d!24317 m!99257))

(assert (=> d!24317 m!98121))

(assert (=> d!24317 m!98129))

(assert (=> d!24317 m!98127))

(assert (=> d!24317 m!98121))

(assert (=> b!91498 d!24317))

(declare-fun d!24319 () Bool)

(declare-fun e!60102 () Bool)

(assert (=> d!24319 e!60102))

(declare-fun res!46898 () Bool)

(assert (=> d!24319 (=> (not res!46898) (not e!60102))))

(declare-fun lt!45139 () ListLongMap!1477)

(assert (=> d!24319 (= res!46898 (contains!772 lt!45139 (_1!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45142 () List!1555)

(assert (=> d!24319 (= lt!45139 (ListLongMap!1478 lt!45142))))

(declare-fun lt!45141 () Unit!2718)

(declare-fun lt!45140 () Unit!2718)

(assert (=> d!24319 (= lt!45141 lt!45140)))

(assert (=> d!24319 (= (getValueByKey!143 lt!45142 (_1!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24319 (= lt!45140 (lemmaContainsTupThenGetReturnValue!63 lt!45142 (_1!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24319 (= lt!45142 (insertStrictlySorted!66 (toList!754 lt!44665) (_1!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24319 (= (+!119 lt!44665 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45139)))

(declare-fun b!92191 () Bool)

(declare-fun res!46899 () Bool)

(assert (=> b!92191 (=> (not res!46899) (not e!60102))))

(assert (=> b!92191 (= res!46899 (= (getValueByKey!143 (toList!754 lt!45139) (_1!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92192 () Bool)

(assert (=> b!92192 (= e!60102 (contains!773 (toList!754 lt!45139) (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24319 res!46898) b!92191))

(assert (= (and b!92191 res!46899) b!92192))

(declare-fun m!99259 () Bool)

(assert (=> d!24319 m!99259))

(declare-fun m!99261 () Bool)

(assert (=> d!24319 m!99261))

(declare-fun m!99263 () Bool)

(assert (=> d!24319 m!99263))

(declare-fun m!99265 () Bool)

(assert (=> d!24319 m!99265))

(declare-fun m!99267 () Bool)

(assert (=> b!92191 m!99267))

(declare-fun m!99269 () Bool)

(assert (=> b!92192 m!99269))

(assert (=> b!91498 d!24319))

(declare-fun d!24321 () Bool)

(declare-fun e!60103 () Bool)

(assert (=> d!24321 e!60103))

(declare-fun res!46900 () Bool)

(assert (=> d!24321 (=> res!46900 e!60103)))

(declare-fun lt!45146 () Bool)

(assert (=> d!24321 (= res!46900 (not lt!45146))))

(declare-fun lt!45144 () Bool)

(assert (=> d!24321 (= lt!45146 lt!45144)))

(declare-fun lt!45145 () Unit!2718)

(declare-fun e!60104 () Unit!2718)

(assert (=> d!24321 (= lt!45145 e!60104)))

(declare-fun c!15350 () Bool)

(assert (=> d!24321 (= c!15350 lt!45144)))

(assert (=> d!24321 (= lt!45144 (containsKey!147 (toList!754 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44663))))

(assert (=> d!24321 (= (contains!772 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44663) lt!45146)))

(declare-fun b!92193 () Bool)

(declare-fun lt!45143 () Unit!2718)

(assert (=> b!92193 (= e!60104 lt!45143)))

(assert (=> b!92193 (= lt!45143 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44663))))

(assert (=> b!92193 (isDefined!97 (getValueByKey!143 (toList!754 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44663))))

(declare-fun b!92194 () Bool)

(declare-fun Unit!2748 () Unit!2718)

(assert (=> b!92194 (= e!60104 Unit!2748)))

(declare-fun b!92195 () Bool)

(assert (=> b!92195 (= e!60103 (isDefined!97 (getValueByKey!143 (toList!754 (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44663)))))

(assert (= (and d!24321 c!15350) b!92193))

(assert (= (and d!24321 (not c!15350)) b!92194))

(assert (= (and d!24321 (not res!46900)) b!92195))

(declare-fun m!99271 () Bool)

(assert (=> d!24321 m!99271))

(declare-fun m!99273 () Bool)

(assert (=> b!92193 m!99273))

(declare-fun m!99275 () Bool)

(assert (=> b!92193 m!99275))

(assert (=> b!92193 m!99275))

(declare-fun m!99277 () Bool)

(assert (=> b!92193 m!99277))

(assert (=> b!92195 m!99275))

(assert (=> b!92195 m!99275))

(assert (=> b!92195 m!99277))

(assert (=> b!91498 d!24321))

(declare-fun d!24323 () Bool)

(assert (=> d!24323 (= (apply!87 lt!44675 lt!44655) (get!1244 (getValueByKey!143 (toList!754 lt!44675) lt!44655)))))

(declare-fun bs!3823 () Bool)

(assert (= bs!3823 d!24323))

(declare-fun m!99279 () Bool)

(assert (=> bs!3823 m!99279))

(assert (=> bs!3823 m!99279))

(declare-fun m!99281 () Bool)

(assert (=> bs!3823 m!99281))

(assert (=> b!91498 d!24323))

(assert (=> b!91498 d!24053))

(declare-fun d!24325 () Bool)

(assert (=> d!24325 (= (apply!87 (+!119 lt!44665 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!44670) (get!1244 (getValueByKey!143 (toList!754 (+!119 lt!44665 (tuple2!2257 lt!44664 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) lt!44670)))))

(declare-fun bs!3824 () Bool)

(assert (= bs!3824 d!24325))

(declare-fun m!99283 () Bool)

(assert (=> bs!3824 m!99283))

(assert (=> bs!3824 m!99283))

(declare-fun m!99285 () Bool)

(assert (=> bs!3824 m!99285))

(assert (=> b!91498 d!24325))

(declare-fun d!24327 () Bool)

(declare-fun e!60105 () Bool)

(assert (=> d!24327 e!60105))

(declare-fun res!46901 () Bool)

(assert (=> d!24327 (=> (not res!46901) (not e!60105))))

(declare-fun lt!45147 () ListLongMap!1477)

(assert (=> d!24327 (= res!46901 (contains!772 lt!45147 (_1!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45150 () List!1555)

(assert (=> d!24327 (= lt!45147 (ListLongMap!1478 lt!45150))))

(declare-fun lt!45149 () Unit!2718)

(declare-fun lt!45148 () Unit!2718)

(assert (=> d!24327 (= lt!45149 lt!45148)))

(assert (=> d!24327 (= (getValueByKey!143 lt!45150 (_1!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24327 (= lt!45148 (lemmaContainsTupThenGetReturnValue!63 lt!45150 (_1!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24327 (= lt!45150 (insertStrictlySorted!66 (toList!754 lt!44662) (_1!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24327 (= (+!119 lt!44662 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45147)))

(declare-fun b!92196 () Bool)

(declare-fun res!46902 () Bool)

(assert (=> b!92196 (=> (not res!46902) (not e!60105))))

(assert (=> b!92196 (= res!46902 (= (getValueByKey!143 (toList!754 lt!45147) (_1!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92197 () Bool)

(assert (=> b!92197 (= e!60105 (contains!773 (toList!754 lt!45147) (tuple2!2257 lt!44672 (zeroValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24327 res!46901) b!92196))

(assert (= (and b!92196 res!46902) b!92197))

(declare-fun m!99287 () Bool)

(assert (=> d!24327 m!99287))

(declare-fun m!99289 () Bool)

(assert (=> d!24327 m!99289))

(declare-fun m!99291 () Bool)

(assert (=> d!24327 m!99291))

(declare-fun m!99293 () Bool)

(assert (=> d!24327 m!99293))

(declare-fun m!99295 () Bool)

(assert (=> b!92196 m!99295))

(declare-fun m!99297 () Bool)

(assert (=> b!92197 m!99297))

(assert (=> b!91498 d!24327))

(declare-fun d!24329 () Bool)

(declare-fun lt!45153 () Bool)

(declare-fun content!96 (List!1556) (InoxSet (_ BitVec 64)))

(assert (=> d!24329 (= lt!45153 (select (content!96 Nil!1553) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun e!60110 () Bool)

(assert (=> d!24329 (= lt!45153 e!60110)))

(declare-fun res!46907 () Bool)

(assert (=> d!24329 (=> (not res!46907) (not e!60110))))

(assert (=> d!24329 (= res!46907 ((_ is Cons!1552) Nil!1553))))

(assert (=> d!24329 (= (contains!774 Nil!1553 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) lt!45153)))

(declare-fun b!92202 () Bool)

(declare-fun e!60111 () Bool)

(assert (=> b!92202 (= e!60110 e!60111)))

(declare-fun res!46908 () Bool)

(assert (=> b!92202 (=> res!46908 e!60111)))

(assert (=> b!92202 (= res!46908 (= (h!2144 Nil!1553) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!92203 () Bool)

(assert (=> b!92203 (= e!60111 (contains!774 (t!5381 Nil!1553) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (= (and d!24329 res!46907) b!92202))

(assert (= (and b!92202 (not res!46908)) b!92203))

(declare-fun m!99299 () Bool)

(assert (=> d!24329 m!99299))

(assert (=> d!24329 m!97899))

(declare-fun m!99301 () Bool)

(assert (=> d!24329 m!99301))

(assert (=> b!92203 m!97899))

(declare-fun m!99303 () Bool)

(assert (=> b!92203 m!99303))

(assert (=> b!91611 d!24329))

(declare-fun d!24331 () Bool)

(declare-fun lt!45154 () Bool)

(assert (=> d!24331 (= lt!45154 (select (content!95 (toList!754 lt!44755)) lt!44495))))

(declare-fun e!60113 () Bool)

(assert (=> d!24331 (= lt!45154 e!60113)))

(declare-fun res!46909 () Bool)

(assert (=> d!24331 (=> (not res!46909) (not e!60113))))

(assert (=> d!24331 (= res!46909 ((_ is Cons!1551) (toList!754 lt!44755)))))

(assert (=> d!24331 (= (contains!773 (toList!754 lt!44755) lt!44495) lt!45154)))

(declare-fun b!92204 () Bool)

(declare-fun e!60112 () Bool)

(assert (=> b!92204 (= e!60113 e!60112)))

(declare-fun res!46910 () Bool)

(assert (=> b!92204 (=> res!46910 e!60112)))

(assert (=> b!92204 (= res!46910 (= (h!2143 (toList!754 lt!44755)) lt!44495))))

(declare-fun b!92205 () Bool)

(assert (=> b!92205 (= e!60112 (contains!773 (t!5380 (toList!754 lt!44755)) lt!44495))))

(assert (= (and d!24331 res!46909) b!92204))

(assert (= (and b!92204 (not res!46910)) b!92205))

(declare-fun m!99305 () Bool)

(assert (=> d!24331 m!99305))

(declare-fun m!99307 () Bool)

(assert (=> d!24331 m!99307))

(declare-fun m!99309 () Bool)

(assert (=> b!92205 m!99309))

(assert (=> b!91585 d!24331))

(declare-fun d!24333 () Bool)

(assert (=> d!24333 (= (apply!87 lt!44730 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1244 (getValueByKey!143 (toList!754 lt!44730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3825 () Bool)

(assert (= bs!3825 d!24333))

(assert (=> bs!3825 m!98839))

(assert (=> bs!3825 m!98839))

(declare-fun m!99311 () Bool)

(assert (=> bs!3825 m!99311))

(assert (=> b!91565 d!24333))

(declare-fun d!24335 () Bool)

(declare-fun lt!45155 () (_ BitVec 32))

(assert (=> d!24335 (and (bvsge lt!45155 #b00000000000000000000000000000000) (bvsle lt!45155 (bvsub (size!2202 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!60114 () (_ BitVec 32))

(assert (=> d!24335 (= lt!45155 e!60114)))

(declare-fun c!15351 () Bool)

(assert (=> d!24335 (= c!15351 (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(assert (=> d!24335 (and (bvsle #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2202 (_keys!4084 newMap!16)) (size!2202 (_keys!4084 newMap!16))))))

(assert (=> d!24335 (= (arrayCountValidKeys!0 (_keys!4084 newMap!16) #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) lt!45155)))

(declare-fun b!92206 () Bool)

(declare-fun e!60115 () (_ BitVec 32))

(declare-fun call!9077 () (_ BitVec 32))

(assert (=> b!92206 (= e!60115 (bvadd #b00000000000000000000000000000001 call!9077))))

(declare-fun b!92207 () Bool)

(assert (=> b!92207 (= e!60114 #b00000000000000000000000000000000)))

(declare-fun b!92208 () Bool)

(assert (=> b!92208 (= e!60114 e!60115)))

(declare-fun c!15352 () Bool)

(assert (=> b!92208 (= c!15352 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9074 () Bool)

(assert (=> bm!9074 (= call!9077 (arrayCountValidKeys!0 (_keys!4084 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!92209 () Bool)

(assert (=> b!92209 (= e!60115 call!9077)))

(assert (= (and d!24335 c!15351) b!92207))

(assert (= (and d!24335 (not c!15351)) b!92208))

(assert (= (and b!92208 c!15352) b!92206))

(assert (= (and b!92208 (not c!15352)) b!92209))

(assert (= (or b!92206 b!92209) bm!9074))

(assert (=> b!92208 m!98447))

(assert (=> b!92208 m!98447))

(assert (=> b!92208 m!98449))

(declare-fun m!99313 () Bool)

(assert (=> bm!9074 m!99313))

(assert (=> b!91442 d!24335))

(assert (=> b!91567 d!24103))

(declare-fun d!24337 () Bool)

(assert (=> d!24337 (= (apply!87 lt!44671 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1244 (getValueByKey!143 (toList!754 lt!44671) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3826 () Bool)

(assert (= bs!3826 d!24337))

(assert (=> bs!3826 m!98109))

(assert (=> bs!3826 m!98523))

(assert (=> bs!3826 m!98523))

(declare-fun m!99315 () Bool)

(assert (=> bs!3826 m!99315))

(assert (=> b!91503 d!24337))

(assert (=> b!91503 d!24157))

(assert (=> bm!9015 d!24043))

(declare-fun d!24339 () Bool)

(declare-fun e!60116 () Bool)

(assert (=> d!24339 e!60116))

(declare-fun res!46911 () Bool)

(assert (=> d!24339 (=> res!46911 e!60116)))

(declare-fun lt!45159 () Bool)

(assert (=> d!24339 (= res!46911 (not lt!45159))))

(declare-fun lt!45157 () Bool)

(assert (=> d!24339 (= lt!45159 lt!45157)))

(declare-fun lt!45158 () Unit!2718)

(declare-fun e!60117 () Unit!2718)

(assert (=> d!24339 (= lt!45158 e!60117)))

(declare-fun c!15353 () Bool)

(assert (=> d!24339 (= c!15353 lt!45157)))

(assert (=> d!24339 (= lt!45157 (containsKey!147 (toList!754 lt!44735) (_1!1139 lt!44489)))))

(assert (=> d!24339 (= (contains!772 lt!44735 (_1!1139 lt!44489)) lt!45159)))

(declare-fun b!92210 () Bool)

(declare-fun lt!45156 () Unit!2718)

(assert (=> b!92210 (= e!60117 lt!45156)))

(assert (=> b!92210 (= lt!45156 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44735) (_1!1139 lt!44489)))))

(assert (=> b!92210 (isDefined!97 (getValueByKey!143 (toList!754 lt!44735) (_1!1139 lt!44489)))))

(declare-fun b!92211 () Bool)

(declare-fun Unit!2749 () Unit!2718)

(assert (=> b!92211 (= e!60117 Unit!2749)))

(declare-fun b!92212 () Bool)

(assert (=> b!92212 (= e!60116 (isDefined!97 (getValueByKey!143 (toList!754 lt!44735) (_1!1139 lt!44489))))))

(assert (= (and d!24339 c!15353) b!92210))

(assert (= (and d!24339 (not c!15353)) b!92211))

(assert (= (and d!24339 (not res!46911)) b!92212))

(declare-fun m!99317 () Bool)

(assert (=> d!24339 m!99317))

(declare-fun m!99319 () Bool)

(assert (=> b!92210 m!99319))

(assert (=> b!92210 m!98275))

(assert (=> b!92210 m!98275))

(declare-fun m!99321 () Bool)

(assert (=> b!92210 m!99321))

(assert (=> b!92212 m!98275))

(assert (=> b!92212 m!98275))

(assert (=> b!92212 m!99321))

(assert (=> d!24057 d!24339))

(declare-fun d!24341 () Bool)

(declare-fun c!15354 () Bool)

(assert (=> d!24341 (= c!15354 (and ((_ is Cons!1551) lt!44738) (= (_1!1139 (h!2143 lt!44738)) (_1!1139 lt!44489))))))

(declare-fun e!60118 () Option!149)

(assert (=> d!24341 (= (getValueByKey!143 lt!44738 (_1!1139 lt!44489)) e!60118)))

(declare-fun b!92215 () Bool)

(declare-fun e!60119 () Option!149)

(assert (=> b!92215 (= e!60119 (getValueByKey!143 (t!5380 lt!44738) (_1!1139 lt!44489)))))

(declare-fun b!92214 () Bool)

(assert (=> b!92214 (= e!60118 e!60119)))

(declare-fun c!15355 () Bool)

(assert (=> b!92214 (= c!15355 (and ((_ is Cons!1551) lt!44738) (not (= (_1!1139 (h!2143 lt!44738)) (_1!1139 lt!44489)))))))

(declare-fun b!92216 () Bool)

(assert (=> b!92216 (= e!60119 None!147)))

(declare-fun b!92213 () Bool)

(assert (=> b!92213 (= e!60118 (Some!148 (_2!1139 (h!2143 lt!44738))))))

(assert (= (and d!24341 c!15354) b!92213))

(assert (= (and d!24341 (not c!15354)) b!92214))

(assert (= (and b!92214 c!15355) b!92215))

(assert (= (and b!92214 (not c!15355)) b!92216))

(declare-fun m!99323 () Bool)

(assert (=> b!92215 m!99323))

(assert (=> d!24057 d!24341))

(declare-fun d!24343 () Bool)

(assert (=> d!24343 (= (getValueByKey!143 lt!44738 (_1!1139 lt!44489)) (Some!148 (_2!1139 lt!44489)))))

(declare-fun lt!45160 () Unit!2718)

(assert (=> d!24343 (= lt!45160 (choose!554 lt!44738 (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(declare-fun e!60120 () Bool)

(assert (=> d!24343 e!60120))

(declare-fun res!46912 () Bool)

(assert (=> d!24343 (=> (not res!46912) (not e!60120))))

(assert (=> d!24343 (= res!46912 (isStrictlySorted!296 lt!44738))))

(assert (=> d!24343 (= (lemmaContainsTupThenGetReturnValue!63 lt!44738 (_1!1139 lt!44489) (_2!1139 lt!44489)) lt!45160)))

(declare-fun b!92217 () Bool)

(declare-fun res!46913 () Bool)

(assert (=> b!92217 (=> (not res!46913) (not e!60120))))

(assert (=> b!92217 (= res!46913 (containsKey!147 lt!44738 (_1!1139 lt!44489)))))

(declare-fun b!92218 () Bool)

(assert (=> b!92218 (= e!60120 (contains!773 lt!44738 (tuple2!2257 (_1!1139 lt!44489) (_2!1139 lt!44489))))))

(assert (= (and d!24343 res!46912) b!92217))

(assert (= (and b!92217 res!46913) b!92218))

(assert (=> d!24343 m!98269))

(declare-fun m!99325 () Bool)

(assert (=> d!24343 m!99325))

(declare-fun m!99327 () Bool)

(assert (=> d!24343 m!99327))

(declare-fun m!99329 () Bool)

(assert (=> b!92217 m!99329))

(declare-fun m!99331 () Bool)

(assert (=> b!92218 m!99331))

(assert (=> d!24057 d!24343))

(declare-fun b!92219 () Bool)

(declare-fun res!46915 () Bool)

(declare-fun e!60125 () Bool)

(assert (=> b!92219 (=> (not res!46915) (not e!60125))))

(declare-fun lt!45161 () List!1555)

(assert (=> b!92219 (= res!46915 (containsKey!147 lt!45161 (_1!1139 lt!44489)))))

(declare-fun b!92220 () Bool)

(declare-fun e!60124 () List!1555)

(declare-fun call!9078 () List!1555)

(assert (=> b!92220 (= e!60124 call!9078)))

(declare-fun d!24345 () Bool)

(assert (=> d!24345 e!60125))

(declare-fun res!46914 () Bool)

(assert (=> d!24345 (=> (not res!46914) (not e!60125))))

(assert (=> d!24345 (= res!46914 (isStrictlySorted!296 lt!45161))))

(assert (=> d!24345 (= lt!45161 e!60124)))

(declare-fun c!15357 () Bool)

(assert (=> d!24345 (= c!15357 (and ((_ is Cons!1551) (toList!754 lt!44498)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44498))) (_1!1139 lt!44489))))))

(assert (=> d!24345 (isStrictlySorted!296 (toList!754 lt!44498))))

(assert (=> d!24345 (= (insertStrictlySorted!66 (toList!754 lt!44498) (_1!1139 lt!44489) (_2!1139 lt!44489)) lt!45161)))

(declare-fun bm!9075 () Bool)

(declare-fun call!9080 () List!1555)

(assert (=> bm!9075 (= call!9080 call!9078)))

(declare-fun b!92221 () Bool)

(declare-fun e!60121 () List!1555)

(assert (=> b!92221 (= e!60124 e!60121)))

(declare-fun c!15356 () Bool)

(assert (=> b!92221 (= c!15356 (and ((_ is Cons!1551) (toList!754 lt!44498)) (= (_1!1139 (h!2143 (toList!754 lt!44498))) (_1!1139 lt!44489))))))

(declare-fun b!92222 () Bool)

(declare-fun c!15358 () Bool)

(declare-fun e!60122 () List!1555)

(assert (=> b!92222 (= e!60122 (ite c!15356 (t!5380 (toList!754 lt!44498)) (ite c!15358 (Cons!1551 (h!2143 (toList!754 lt!44498)) (t!5380 (toList!754 lt!44498))) Nil!1552)))))

(declare-fun b!92223 () Bool)

(declare-fun e!60123 () List!1555)

(declare-fun call!9079 () List!1555)

(assert (=> b!92223 (= e!60123 call!9079)))

(declare-fun b!92224 () Bool)

(assert (=> b!92224 (= e!60123 call!9079)))

(declare-fun b!92225 () Bool)

(assert (=> b!92225 (= e!60121 call!9080)))

(declare-fun bm!9076 () Bool)

(assert (=> bm!9076 (= call!9078 ($colon$colon!74 e!60122 (ite c!15357 (h!2143 (toList!754 lt!44498)) (tuple2!2257 (_1!1139 lt!44489) (_2!1139 lt!44489)))))))

(declare-fun c!15359 () Bool)

(assert (=> bm!9076 (= c!15359 c!15357)))

(declare-fun b!92226 () Bool)

(assert (=> b!92226 (= e!60122 (insertStrictlySorted!66 (t!5380 (toList!754 lt!44498)) (_1!1139 lt!44489) (_2!1139 lt!44489)))))

(declare-fun bm!9077 () Bool)

(assert (=> bm!9077 (= call!9079 call!9080)))

(declare-fun b!92227 () Bool)

(assert (=> b!92227 (= c!15358 (and ((_ is Cons!1551) (toList!754 lt!44498)) (bvsgt (_1!1139 (h!2143 (toList!754 lt!44498))) (_1!1139 lt!44489))))))

(assert (=> b!92227 (= e!60121 e!60123)))

(declare-fun b!92228 () Bool)

(assert (=> b!92228 (= e!60125 (contains!773 lt!45161 (tuple2!2257 (_1!1139 lt!44489) (_2!1139 lt!44489))))))

(assert (= (and d!24345 c!15357) b!92220))

(assert (= (and d!24345 (not c!15357)) b!92221))

(assert (= (and b!92221 c!15356) b!92225))

(assert (= (and b!92221 (not c!15356)) b!92227))

(assert (= (and b!92227 c!15358) b!92223))

(assert (= (and b!92227 (not c!15358)) b!92224))

(assert (= (or b!92223 b!92224) bm!9077))

(assert (= (or b!92225 bm!9077) bm!9075))

(assert (= (or b!92220 bm!9075) bm!9076))

(assert (= (and bm!9076 c!15359) b!92226))

(assert (= (and bm!9076 (not c!15359)) b!92222))

(assert (= (and d!24345 res!46914) b!92219))

(assert (= (and b!92219 res!46915) b!92228))

(declare-fun m!99333 () Bool)

(assert (=> d!24345 m!99333))

(declare-fun m!99335 () Bool)

(assert (=> d!24345 m!99335))

(declare-fun m!99337 () Bool)

(assert (=> bm!9076 m!99337))

(declare-fun m!99339 () Bool)

(assert (=> b!92219 m!99339))

(declare-fun m!99341 () Bool)

(assert (=> b!92226 m!99341))

(declare-fun m!99343 () Bool)

(assert (=> b!92228 m!99343))

(assert (=> d!24057 d!24345))

(declare-fun d!24347 () Bool)

(declare-fun e!60126 () Bool)

(assert (=> d!24347 e!60126))

(declare-fun res!46916 () Bool)

(assert (=> d!24347 (=> res!46916 e!60126)))

(declare-fun lt!45165 () Bool)

(assert (=> d!24347 (= res!46916 (not lt!45165))))

(declare-fun lt!45163 () Bool)

(assert (=> d!24347 (= lt!45165 lt!45163)))

(declare-fun lt!45164 () Unit!2718)

(declare-fun e!60127 () Unit!2718)

(assert (=> d!24347 (= lt!45164 e!60127)))

(declare-fun c!15360 () Bool)

(assert (=> d!24347 (= c!15360 lt!45163)))

(assert (=> d!24347 (= lt!45163 (containsKey!147 (toList!754 lt!44730) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24347 (= (contains!772 lt!44730 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) lt!45165)))

(declare-fun b!92229 () Bool)

(declare-fun lt!45162 () Unit!2718)

(assert (=> b!92229 (= e!60127 lt!45162)))

(assert (=> b!92229 (= lt!45162 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44730) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> b!92229 (isDefined!97 (getValueByKey!143 (toList!754 lt!44730) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!92230 () Bool)

(declare-fun Unit!2750 () Unit!2718)

(assert (=> b!92230 (= e!60127 Unit!2750)))

(declare-fun b!92231 () Bool)

(assert (=> b!92231 (= e!60126 (isDefined!97 (getValueByKey!143 (toList!754 lt!44730) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))))

(assert (= (and d!24347 c!15360) b!92229))

(assert (= (and d!24347 (not c!15360)) b!92230))

(assert (= (and d!24347 (not res!46916)) b!92231))

(assert (=> d!24347 m!97899))

(declare-fun m!99345 () Bool)

(assert (=> d!24347 m!99345))

(assert (=> b!92229 m!97899))

(declare-fun m!99347 () Bool)

(assert (=> b!92229 m!99347))

(assert (=> b!92229 m!97899))

(assert (=> b!92229 m!99155))

(assert (=> b!92229 m!99155))

(declare-fun m!99349 () Bool)

(assert (=> b!92229 m!99349))

(assert (=> b!92231 m!97899))

(assert (=> b!92231 m!99155))

(assert (=> b!92231 m!99155))

(assert (=> b!92231 m!99349))

(assert (=> b!91570 d!24347))

(declare-fun d!24349 () Bool)

(declare-fun e!60128 () Bool)

(assert (=> d!24349 e!60128))

(declare-fun res!46917 () Bool)

(assert (=> d!24349 (=> res!46917 e!60128)))

(declare-fun lt!45169 () Bool)

(assert (=> d!24349 (= res!46917 (not lt!45169))))

(declare-fun lt!45167 () Bool)

(assert (=> d!24349 (= lt!45169 lt!45167)))

(declare-fun lt!45168 () Unit!2718)

(declare-fun e!60129 () Unit!2718)

(assert (=> d!24349 (= lt!45168 e!60129)))

(declare-fun c!15361 () Bool)

(assert (=> d!24349 (= c!15361 lt!45167)))

(assert (=> d!24349 (= lt!45167 (containsKey!147 (toList!754 lt!44688) (_1!1139 lt!44495)))))

(assert (=> d!24349 (= (contains!772 lt!44688 (_1!1139 lt!44495)) lt!45169)))

(declare-fun b!92232 () Bool)

(declare-fun lt!45166 () Unit!2718)

(assert (=> b!92232 (= e!60129 lt!45166)))

(assert (=> b!92232 (= lt!45166 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44688) (_1!1139 lt!44495)))))

(assert (=> b!92232 (isDefined!97 (getValueByKey!143 (toList!754 lt!44688) (_1!1139 lt!44495)))))

(declare-fun b!92233 () Bool)

(declare-fun Unit!2751 () Unit!2718)

(assert (=> b!92233 (= e!60129 Unit!2751)))

(declare-fun b!92234 () Bool)

(assert (=> b!92234 (= e!60128 (isDefined!97 (getValueByKey!143 (toList!754 lt!44688) (_1!1139 lt!44495))))))

(assert (= (and d!24349 c!15361) b!92232))

(assert (= (and d!24349 (not c!15361)) b!92233))

(assert (= (and d!24349 (not res!46917)) b!92234))

(declare-fun m!99351 () Bool)

(assert (=> d!24349 m!99351))

(declare-fun m!99353 () Bool)

(assert (=> b!92232 m!99353))

(assert (=> b!92232 m!98193))

(assert (=> b!92232 m!98193))

(declare-fun m!99355 () Bool)

(assert (=> b!92232 m!99355))

(assert (=> b!92234 m!98193))

(assert (=> b!92234 m!98193))

(assert (=> b!92234 m!99355))

(assert (=> d!24051 d!24349))

(declare-fun d!24351 () Bool)

(declare-fun c!15362 () Bool)

(assert (=> d!24351 (= c!15362 (and ((_ is Cons!1551) lt!44691) (= (_1!1139 (h!2143 lt!44691)) (_1!1139 lt!44495))))))

(declare-fun e!60130 () Option!149)

(assert (=> d!24351 (= (getValueByKey!143 lt!44691 (_1!1139 lt!44495)) e!60130)))

(declare-fun b!92237 () Bool)

(declare-fun e!60131 () Option!149)

(assert (=> b!92237 (= e!60131 (getValueByKey!143 (t!5380 lt!44691) (_1!1139 lt!44495)))))

(declare-fun b!92236 () Bool)

(assert (=> b!92236 (= e!60130 e!60131)))

(declare-fun c!15363 () Bool)

(assert (=> b!92236 (= c!15363 (and ((_ is Cons!1551) lt!44691) (not (= (_1!1139 (h!2143 lt!44691)) (_1!1139 lt!44495)))))))

(declare-fun b!92238 () Bool)

(assert (=> b!92238 (= e!60131 None!147)))

(declare-fun b!92235 () Bool)

(assert (=> b!92235 (= e!60130 (Some!148 (_2!1139 (h!2143 lt!44691))))))

(assert (= (and d!24351 c!15362) b!92235))

(assert (= (and d!24351 (not c!15362)) b!92236))

(assert (= (and b!92236 c!15363) b!92237))

(assert (= (and b!92236 (not c!15363)) b!92238))

(declare-fun m!99357 () Bool)

(assert (=> b!92237 m!99357))

(assert (=> d!24051 d!24351))

(declare-fun d!24353 () Bool)

(assert (=> d!24353 (= (getValueByKey!143 lt!44691 (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495)))))

(declare-fun lt!45170 () Unit!2718)

(assert (=> d!24353 (= lt!45170 (choose!554 lt!44691 (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(declare-fun e!60132 () Bool)

(assert (=> d!24353 e!60132))

(declare-fun res!46918 () Bool)

(assert (=> d!24353 (=> (not res!46918) (not e!60132))))

(assert (=> d!24353 (= res!46918 (isStrictlySorted!296 lt!44691))))

(assert (=> d!24353 (= (lemmaContainsTupThenGetReturnValue!63 lt!44691 (_1!1139 lt!44495) (_2!1139 lt!44495)) lt!45170)))

(declare-fun b!92239 () Bool)

(declare-fun res!46919 () Bool)

(assert (=> b!92239 (=> (not res!46919) (not e!60132))))

(assert (=> b!92239 (= res!46919 (containsKey!147 lt!44691 (_1!1139 lt!44495)))))

(declare-fun b!92240 () Bool)

(assert (=> b!92240 (= e!60132 (contains!773 lt!44691 (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495))))))

(assert (= (and d!24353 res!46918) b!92239))

(assert (= (and b!92239 res!46919) b!92240))

(assert (=> d!24353 m!98187))

(declare-fun m!99359 () Bool)

(assert (=> d!24353 m!99359))

(declare-fun m!99361 () Bool)

(assert (=> d!24353 m!99361))

(declare-fun m!99363 () Bool)

(assert (=> b!92239 m!99363))

(declare-fun m!99365 () Bool)

(assert (=> b!92240 m!99365))

(assert (=> d!24051 d!24353))

(declare-fun b!92241 () Bool)

(declare-fun res!46921 () Bool)

(declare-fun e!60137 () Bool)

(assert (=> b!92241 (=> (not res!46921) (not e!60137))))

(declare-fun lt!45171 () List!1555)

(assert (=> b!92241 (= res!46921 (containsKey!147 lt!45171 (_1!1139 lt!44495)))))

(declare-fun b!92242 () Bool)

(declare-fun e!60136 () List!1555)

(declare-fun call!9081 () List!1555)

(assert (=> b!92242 (= e!60136 call!9081)))

(declare-fun d!24355 () Bool)

(assert (=> d!24355 e!60137))

(declare-fun res!46920 () Bool)

(assert (=> d!24355 (=> (not res!46920) (not e!60137))))

(assert (=> d!24355 (= res!46920 (isStrictlySorted!296 lt!45171))))

(assert (=> d!24355 (= lt!45171 e!60136)))

(declare-fun c!15365 () Bool)

(assert (=> d!24355 (= c!15365 (and ((_ is Cons!1551) (toList!754 lt!44485)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44485))) (_1!1139 lt!44495))))))

(assert (=> d!24355 (isStrictlySorted!296 (toList!754 lt!44485))))

(assert (=> d!24355 (= (insertStrictlySorted!66 (toList!754 lt!44485) (_1!1139 lt!44495) (_2!1139 lt!44495)) lt!45171)))

(declare-fun bm!9078 () Bool)

(declare-fun call!9083 () List!1555)

(assert (=> bm!9078 (= call!9083 call!9081)))

(declare-fun b!92243 () Bool)

(declare-fun e!60133 () List!1555)

(assert (=> b!92243 (= e!60136 e!60133)))

(declare-fun c!15364 () Bool)

(assert (=> b!92243 (= c!15364 (and ((_ is Cons!1551) (toList!754 lt!44485)) (= (_1!1139 (h!2143 (toList!754 lt!44485))) (_1!1139 lt!44495))))))

(declare-fun c!15366 () Bool)

(declare-fun e!60134 () List!1555)

(declare-fun b!92244 () Bool)

(assert (=> b!92244 (= e!60134 (ite c!15364 (t!5380 (toList!754 lt!44485)) (ite c!15366 (Cons!1551 (h!2143 (toList!754 lt!44485)) (t!5380 (toList!754 lt!44485))) Nil!1552)))))

(declare-fun b!92245 () Bool)

(declare-fun e!60135 () List!1555)

(declare-fun call!9082 () List!1555)

(assert (=> b!92245 (= e!60135 call!9082)))

(declare-fun b!92246 () Bool)

(assert (=> b!92246 (= e!60135 call!9082)))

(declare-fun b!92247 () Bool)

(assert (=> b!92247 (= e!60133 call!9083)))

(declare-fun bm!9079 () Bool)

(assert (=> bm!9079 (= call!9081 ($colon$colon!74 e!60134 (ite c!15365 (h!2143 (toList!754 lt!44485)) (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495)))))))

(declare-fun c!15367 () Bool)

(assert (=> bm!9079 (= c!15367 c!15365)))

(declare-fun b!92248 () Bool)

(assert (=> b!92248 (= e!60134 (insertStrictlySorted!66 (t!5380 (toList!754 lt!44485)) (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(declare-fun bm!9080 () Bool)

(assert (=> bm!9080 (= call!9082 call!9083)))

(declare-fun b!92249 () Bool)

(assert (=> b!92249 (= c!15366 (and ((_ is Cons!1551) (toList!754 lt!44485)) (bvsgt (_1!1139 (h!2143 (toList!754 lt!44485))) (_1!1139 lt!44495))))))

(assert (=> b!92249 (= e!60133 e!60135)))

(declare-fun b!92250 () Bool)

(assert (=> b!92250 (= e!60137 (contains!773 lt!45171 (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495))))))

(assert (= (and d!24355 c!15365) b!92242))

(assert (= (and d!24355 (not c!15365)) b!92243))

(assert (= (and b!92243 c!15364) b!92247))

(assert (= (and b!92243 (not c!15364)) b!92249))

(assert (= (and b!92249 c!15366) b!92245))

(assert (= (and b!92249 (not c!15366)) b!92246))

(assert (= (or b!92245 b!92246) bm!9080))

(assert (= (or b!92247 bm!9080) bm!9078))

(assert (= (or b!92242 bm!9078) bm!9079))

(assert (= (and bm!9079 c!15367) b!92248))

(assert (= (and bm!9079 (not c!15367)) b!92244))

(assert (= (and d!24355 res!46920) b!92241))

(assert (= (and b!92241 res!46921) b!92250))

(declare-fun m!99367 () Bool)

(assert (=> d!24355 m!99367))

(assert (=> d!24355 m!99143))

(declare-fun m!99369 () Bool)

(assert (=> bm!9079 m!99369))

(declare-fun m!99371 () Bool)

(assert (=> b!92241 m!99371))

(declare-fun m!99373 () Bool)

(assert (=> b!92248 m!99373))

(declare-fun m!99375 () Bool)

(assert (=> b!92250 m!99375))

(assert (=> d!24051 d!24355))

(assert (=> b!91543 d!24157))

(declare-fun d!24357 () Bool)

(declare-fun e!60138 () Bool)

(assert (=> d!24357 e!60138))

(declare-fun res!46922 () Bool)

(assert (=> d!24357 (=> (not res!46922) (not e!60138))))

(declare-fun lt!45172 () ListLongMap!1477)

(assert (=> d!24357 (= res!46922 (contains!772 lt!45172 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!45175 () List!1555)

(assert (=> d!24357 (= lt!45172 (ListLongMap!1478 lt!45175))))

(declare-fun lt!45174 () Unit!2718)

(declare-fun lt!45173 () Unit!2718)

(assert (=> d!24357 (= lt!45174 lt!45173)))

(assert (=> d!24357 (= (getValueByKey!143 lt!45175 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24357 (= lt!45173 (lemmaContainsTupThenGetReturnValue!63 lt!45175 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24357 (= lt!45175 (insertStrictlySorted!66 (toList!754 call!8941) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24357 (= (+!119 call!8941 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!45172)))

(declare-fun b!92251 () Bool)

(declare-fun res!46923 () Bool)

(assert (=> b!92251 (=> (not res!46923) (not e!60138))))

(assert (=> b!92251 (= res!46923 (= (getValueByKey!143 (toList!754 lt!45172) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!92252 () Bool)

(assert (=> b!92252 (= e!60138 (contains!773 (toList!754 lt!45172) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1241 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!24357 res!46922) b!92251))

(assert (= (and b!92251 res!46923) b!92252))

(declare-fun m!99377 () Bool)

(assert (=> d!24357 m!99377))

(declare-fun m!99379 () Bool)

(assert (=> d!24357 m!99379))

(declare-fun m!99381 () Bool)

(assert (=> d!24357 m!99381))

(declare-fun m!99383 () Bool)

(assert (=> d!24357 m!99383))

(declare-fun m!99385 () Bool)

(assert (=> b!92251 m!99385))

(declare-fun m!99387 () Bool)

(assert (=> b!92252 m!99387))

(assert (=> b!91543 d!24357))

(declare-fun d!24359 () Bool)

(assert (=> d!24359 (not (contains!772 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711)) lt!44706))))

(declare-fun lt!45178 () Unit!2718)

(declare-fun choose!561 (ListLongMap!1477 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2718)

(assert (=> d!24359 (= lt!45178 (choose!561 lt!44710 lt!44712 lt!44711 lt!44706))))

(declare-fun e!60141 () Bool)

(assert (=> d!24359 e!60141))

(declare-fun res!46926 () Bool)

(assert (=> d!24359 (=> (not res!46926) (not e!60141))))

(assert (=> d!24359 (= res!46926 (not (contains!772 lt!44710 lt!44706)))))

(assert (=> d!24359 (= (addStillNotContains!37 lt!44710 lt!44712 lt!44711 lt!44706) lt!45178)))

(declare-fun b!92256 () Bool)

(assert (=> b!92256 (= e!60141 (not (= lt!44712 lt!44706)))))

(assert (= (and d!24359 res!46926) b!92256))

(assert (=> d!24359 m!98211))

(assert (=> d!24359 m!98211))

(assert (=> d!24359 m!98213))

(declare-fun m!99389 () Bool)

(assert (=> d!24359 m!99389))

(declare-fun m!99391 () Bool)

(assert (=> d!24359 m!99391))

(assert (=> b!91543 d!24359))

(declare-fun d!24361 () Bool)

(declare-fun e!60142 () Bool)

(assert (=> d!24361 e!60142))

(declare-fun res!46927 () Bool)

(assert (=> d!24361 (=> res!46927 e!60142)))

(declare-fun lt!45182 () Bool)

(assert (=> d!24361 (= res!46927 (not lt!45182))))

(declare-fun lt!45180 () Bool)

(assert (=> d!24361 (= lt!45182 lt!45180)))

(declare-fun lt!45181 () Unit!2718)

(declare-fun e!60143 () Unit!2718)

(assert (=> d!24361 (= lt!45181 e!60143)))

(declare-fun c!15368 () Bool)

(assert (=> d!24361 (= c!15368 lt!45180)))

(assert (=> d!24361 (= lt!45180 (containsKey!147 (toList!754 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711))) lt!44706))))

(assert (=> d!24361 (= (contains!772 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711)) lt!44706) lt!45182)))

(declare-fun b!92257 () Bool)

(declare-fun lt!45179 () Unit!2718)

(assert (=> b!92257 (= e!60143 lt!45179)))

(assert (=> b!92257 (= lt!45179 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711))) lt!44706))))

(assert (=> b!92257 (isDefined!97 (getValueByKey!143 (toList!754 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711))) lt!44706))))

(declare-fun b!92258 () Bool)

(declare-fun Unit!2752 () Unit!2718)

(assert (=> b!92258 (= e!60143 Unit!2752)))

(declare-fun b!92259 () Bool)

(assert (=> b!92259 (= e!60142 (isDefined!97 (getValueByKey!143 (toList!754 (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711))) lt!44706)))))

(assert (= (and d!24361 c!15368) b!92257))

(assert (= (and d!24361 (not c!15368)) b!92258))

(assert (= (and d!24361 (not res!46927)) b!92259))

(declare-fun m!99393 () Bool)

(assert (=> d!24361 m!99393))

(declare-fun m!99395 () Bool)

(assert (=> b!92257 m!99395))

(declare-fun m!99397 () Bool)

(assert (=> b!92257 m!99397))

(assert (=> b!92257 m!99397))

(declare-fun m!99399 () Bool)

(assert (=> b!92257 m!99399))

(assert (=> b!92259 m!99397))

(assert (=> b!92259 m!99397))

(assert (=> b!92259 m!99399))

(assert (=> b!91543 d!24361))

(declare-fun d!24363 () Bool)

(declare-fun e!60144 () Bool)

(assert (=> d!24363 e!60144))

(declare-fun res!46928 () Bool)

(assert (=> d!24363 (=> (not res!46928) (not e!60144))))

(declare-fun lt!45183 () ListLongMap!1477)

(assert (=> d!24363 (= res!46928 (contains!772 lt!45183 (_1!1139 (tuple2!2257 lt!44712 lt!44711))))))

(declare-fun lt!45186 () List!1555)

(assert (=> d!24363 (= lt!45183 (ListLongMap!1478 lt!45186))))

(declare-fun lt!45185 () Unit!2718)

(declare-fun lt!45184 () Unit!2718)

(assert (=> d!24363 (= lt!45185 lt!45184)))

(assert (=> d!24363 (= (getValueByKey!143 lt!45186 (_1!1139 (tuple2!2257 lt!44712 lt!44711))) (Some!148 (_2!1139 (tuple2!2257 lt!44712 lt!44711))))))

(assert (=> d!24363 (= lt!45184 (lemmaContainsTupThenGetReturnValue!63 lt!45186 (_1!1139 (tuple2!2257 lt!44712 lt!44711)) (_2!1139 (tuple2!2257 lt!44712 lt!44711))))))

(assert (=> d!24363 (= lt!45186 (insertStrictlySorted!66 (toList!754 lt!44710) (_1!1139 (tuple2!2257 lt!44712 lt!44711)) (_2!1139 (tuple2!2257 lt!44712 lt!44711))))))

(assert (=> d!24363 (= (+!119 lt!44710 (tuple2!2257 lt!44712 lt!44711)) lt!45183)))

(declare-fun b!92260 () Bool)

(declare-fun res!46929 () Bool)

(assert (=> b!92260 (=> (not res!46929) (not e!60144))))

(assert (=> b!92260 (= res!46929 (= (getValueByKey!143 (toList!754 lt!45183) (_1!1139 (tuple2!2257 lt!44712 lt!44711))) (Some!148 (_2!1139 (tuple2!2257 lt!44712 lt!44711)))))))

(declare-fun b!92261 () Bool)

(assert (=> b!92261 (= e!60144 (contains!773 (toList!754 lt!45183) (tuple2!2257 lt!44712 lt!44711)))))

(assert (= (and d!24363 res!46928) b!92260))

(assert (= (and b!92260 res!46929) b!92261))

(declare-fun m!99401 () Bool)

(assert (=> d!24363 m!99401))

(declare-fun m!99403 () Bool)

(assert (=> d!24363 m!99403))

(declare-fun m!99405 () Bool)

(assert (=> d!24363 m!99405))

(declare-fun m!99407 () Bool)

(assert (=> d!24363 m!99407))

(declare-fun m!99409 () Bool)

(assert (=> b!92260 m!99409))

(declare-fun m!99411 () Bool)

(assert (=> b!92261 m!99411))

(assert (=> b!91543 d!24363))

(declare-fun b!92296 () Bool)

(declare-fun e!60163 () Unit!2718)

(declare-fun Unit!2753 () Unit!2718)

(assert (=> b!92296 (= e!60163 Unit!2753)))

(declare-fun lt!45265 () Unit!2718)

(declare-fun lemmaArrayContainsKeyThenInListMap!22 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) (_ BitVec 32) Int) Unit!2718)

(assert (=> b!92296 (= lt!45265 (lemmaArrayContainsKeyThenInListMap!22 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(assert (=> b!92296 (contains!772 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355))))

(declare-fun lt!45250 () Unit!2718)

(assert (=> b!92296 (= lt!45250 lt!45265)))

(assert (=> b!92296 false))

(declare-fun b!92297 () Bool)

(declare-fun c!15380 () Bool)

(declare-fun lt!45272 () SeekEntryResult!251)

(assert (=> b!92297 (= c!15380 ((_ is MissingVacant!251) lt!45272))))

(declare-fun e!60165 () Bool)

(declare-fun e!60168 () Bool)

(assert (=> b!92297 (= e!60165 e!60168)))

(declare-fun call!9094 () SeekEntryResult!251)

(declare-fun bm!9089 () Bool)

(assert (=> bm!9089 (= call!9094 (seekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (mask!6464 newMap!16)))))

(declare-fun b!92298 () Bool)

(declare-fun res!46950 () Bool)

(assert (=> b!92298 (= res!46950 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3147 lt!45272)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!60164 () Bool)

(assert (=> b!92298 (=> (not res!46950) (not e!60164))))

(declare-fun b!92299 () Bool)

(declare-fun lt!45270 () SeekEntryResult!251)

(declare-fun e!60167 () Bool)

(assert (=> b!92299 (= e!60167 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3145 lt!45270)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!92300 () Bool)

(declare-fun res!46955 () Bool)

(declare-fun e!60162 () Bool)

(assert (=> b!92300 (=> (not res!46955) (not e!60162))))

(declare-fun lt!45269 () tuple2!2254)

(assert (=> b!92300 (= res!46955 (valid!362 (_2!1138 lt!45269)))))

(declare-fun b!92301 () Bool)

(declare-fun call!9092 () Bool)

(assert (=> b!92301 (= e!60164 (not call!9092))))

(declare-fun b!92302 () Bool)

(declare-fun e!60166 () Unit!2718)

(declare-fun Unit!2754 () Unit!2718)

(assert (=> b!92302 (= e!60166 Unit!2754)))

(declare-fun lt!45263 () Unit!2718)

(assert (=> b!92302 (= lt!45263 (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> b!92302 (= lt!45270 call!9094)))

(declare-fun res!46948 () Bool)

(assert (=> b!92302 (= res!46948 ((_ is Found!251) lt!45270))))

(assert (=> b!92302 (=> (not res!46948) (not e!60167))))

(assert (=> b!92302 e!60167))

(declare-fun lt!45259 () Unit!2718)

(assert (=> b!92302 (= lt!45259 lt!45263)))

(assert (=> b!92302 false))

(declare-fun bm!9090 () Bool)

(declare-fun call!9095 () Bool)

(declare-fun call!9093 () Bool)

(assert (=> bm!9090 (= call!9095 call!9093)))

(declare-fun c!15378 () Bool)

(declare-fun c!15377 () Bool)

(declare-fun bm!9091 () Bool)

(assert (=> bm!9091 (= call!9093 (inRange!0 (ite c!15377 (index!3145 lt!45270) (ite c!15378 (index!3144 lt!45272) (index!3147 lt!45272))) (mask!6464 newMap!16)))))

(declare-fun b!92303 () Bool)

(assert (=> b!92303 (= e!60168 e!60164)))

(declare-fun res!46954 () Bool)

(assert (=> b!92303 (= res!46954 call!9095)))

(assert (=> b!92303 (=> (not res!46954) (not e!60164))))

(declare-fun bm!9092 () Bool)

(assert (=> bm!9092 (= call!9092 (arrayContainsKey!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!92305 () Bool)

(declare-fun res!46956 () Bool)

(assert (=> b!92305 (=> (not res!46956) (not e!60162))))

(assert (=> b!92305 (= res!46956 (contains!772 (map!1213 (_2!1138 lt!45269)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun b!92306 () Bool)

(declare-fun res!46949 () Bool)

(assert (=> b!92306 (= res!46949 call!9093)))

(assert (=> b!92306 (=> (not res!46949) (not e!60167))))

(declare-fun b!92307 () Bool)

(assert (=> b!92307 (= e!60162 (= (map!1213 (_2!1138 lt!45269)) (+!119 (map!1213 newMap!16) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun b!92308 () Bool)

(declare-fun e!60161 () Bool)

(assert (=> b!92308 (= e!60161 (not call!9092))))

(declare-fun b!92309 () Bool)

(declare-fun Unit!2755 () Unit!2718)

(assert (=> b!92309 (= e!60163 Unit!2755)))

(declare-fun b!92310 () Bool)

(assert (=> b!92310 (= e!60168 ((_ is Undefined!251) lt!45272))))

(declare-fun b!92311 () Bool)

(declare-fun lt!45276 () Unit!2718)

(assert (=> b!92311 (= e!60166 lt!45276)))

(assert (=> b!92311 (= lt!45276 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> b!92311 (= lt!45272 call!9094)))

(assert (=> b!92311 (= c!15378 ((_ is MissingZero!251) lt!45272))))

(assert (=> b!92311 e!60165))

(declare-fun b!92312 () Bool)

(declare-fun res!46953 () Bool)

(assert (=> b!92312 (=> (not res!46953) (not e!60161))))

(assert (=> b!92312 (= res!46953 call!9095)))

(assert (=> b!92312 (= e!60165 e!60161)))

(declare-fun d!24365 () Bool)

(assert (=> d!24365 e!60162))

(declare-fun res!46952 () Bool)

(assert (=> d!24365 (=> (not res!46952) (not e!60162))))

(assert (=> d!24365 (= res!46952 (_1!1138 lt!45269))))

(assert (=> d!24365 (= lt!45269 (tuple2!2255 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (bvadd (_size!450 newMap!16) #b00000000000000000000000000000001) (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))) (_vacant!450 newMap!16))))))

(declare-fun lt!45253 () Unit!2718)

(declare-fun lt!45273 () Unit!2718)

(assert (=> d!24365 (= lt!45253 lt!45273)))

(declare-fun lt!45251 () array!4113)

(declare-fun lt!45262 () array!4111)

(assert (=> d!24365 (contains!772 (getCurrentListMap!437 lt!45262 lt!45251 (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841))))))

(assert (=> d!24365 (= lt!45273 (lemmaValidKeyInArrayIsInListMap!95 lt!45262 lt!45251 (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24365 (= lt!45251 (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))))))

(assert (=> d!24365 (= lt!45262 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))))))

(declare-fun lt!45255 () Unit!2718)

(declare-fun lt!45249 () Unit!2718)

(assert (=> d!24365 (= lt!45255 lt!45249)))

(declare-fun lt!45257 () array!4111)

(assert (=> d!24365 (= (arrayCountValidKeys!0 lt!45257 (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (bvadd (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4111 (_ BitVec 32)) Unit!2718)

(assert (=> d!24365 (= lt!45249 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!45257 (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841))))))

(assert (=> d!24365 (= lt!45257 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))))))

(declare-fun lt!45271 () Unit!2718)

(declare-fun lt!45266 () Unit!2718)

(assert (=> d!24365 (= lt!45271 lt!45266)))

(declare-fun lt!45258 () array!4111)

(assert (=> d!24365 (arrayContainsKey!0 lt!45258 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!24365 (= lt!45266 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!45258 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841))))))

(assert (=> d!24365 (= lt!45258 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))))))

(declare-fun lt!45274 () Unit!2718)

(declare-fun lt!45267 () Unit!2718)

(assert (=> d!24365 (= lt!45274 lt!45267)))

(assert (=> d!24365 (= (+!119 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (getCurrentListMap!437 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!22 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) (_ BitVec 64) V!3089 Int) Unit!2718)

(assert (=> d!24365 (= lt!45267 (lemmaAddValidKeyToArrayThenAddPairToListMap!22 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45264 () Unit!2718)

(declare-fun lt!45254 () Unit!2718)

(assert (=> d!24365 (= lt!45264 lt!45254)))

(assert (=> d!24365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))) (mask!6464 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4111 (_ BitVec 32) (_ BitVec 32)) Unit!2718)

(assert (=> d!24365 (= lt!45254 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (_keys!4084 newMap!16) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (mask!6464 newMap!16)))))

(declare-fun lt!45275 () Unit!2718)

(declare-fun lt!45252 () Unit!2718)

(assert (=> d!24365 (= lt!45275 lt!45252)))

(assert (=> d!24365 (= (arrayCountValidKeys!0 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))) #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4084 newMap!16) #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4111 (_ BitVec 32) (_ BitVec 64)) Unit!2718)

(assert (=> d!24365 (= lt!45252 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4084 newMap!16) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(declare-fun lt!45247 () Unit!2718)

(declare-fun lt!45248 () Unit!2718)

(assert (=> d!24365 (= lt!45247 lt!45248)))

(declare-fun lt!45261 () List!1556)

(declare-fun lt!45260 () (_ BitVec 32))

(assert (=> d!24365 (arrayNoDuplicates!0 (array!4112 (store (arr!1954 (_keys!4084 newMap!16)) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)) (size!2202 (_keys!4084 newMap!16))) lt!45260 lt!45261)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4111 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1556) Unit!2718)

(assert (=> d!24365 (= lt!45248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841)) lt!45260 lt!45261))))

(assert (=> d!24365 (= lt!45261 Nil!1553)))

(assert (=> d!24365 (= lt!45260 #b00000000000000000000000000000000)))

(declare-fun lt!45268 () Unit!2718)

(assert (=> d!24365 (= lt!45268 e!60163)))

(declare-fun c!15379 () Bool)

(assert (=> d!24365 (= c!15379 (arrayContainsKey!0 (_keys!4084 newMap!16) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!45256 () Unit!2718)

(assert (=> d!24365 (= lt!45256 e!60166)))

(assert (=> d!24365 (= c!15377 (contains!772 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355)))))

(assert (=> d!24365 (valid!362 newMap!16)))

(assert (=> d!24365 (= (updateHelperNewKey!36 newMap!16 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 (ite c!15233 (index!3147 lt!44841) (index!3144 lt!44841))) lt!45269)))

(declare-fun b!92304 () Bool)

(declare-fun res!46951 () Bool)

(assert (=> b!92304 (=> (not res!46951) (not e!60161))))

(assert (=> b!92304 (= res!46951 (= (select (arr!1954 (_keys!4084 newMap!16)) (index!3144 lt!45272)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!24365 c!15377) b!92302))

(assert (= (and d!24365 (not c!15377)) b!92311))

(assert (= (and b!92302 res!46948) b!92306))

(assert (= (and b!92306 res!46949) b!92299))

(assert (= (and b!92311 c!15378) b!92312))

(assert (= (and b!92311 (not c!15378)) b!92297))

(assert (= (and b!92312 res!46953) b!92304))

(assert (= (and b!92304 res!46951) b!92308))

(assert (= (and b!92297 c!15380) b!92303))

(assert (= (and b!92297 (not c!15380)) b!92310))

(assert (= (and b!92303 res!46954) b!92298))

(assert (= (and b!92298 res!46950) b!92301))

(assert (= (or b!92312 b!92303) bm!9090))

(assert (= (or b!92308 b!92301) bm!9092))

(assert (= (or b!92306 bm!9090) bm!9091))

(assert (= (or b!92302 b!92311) bm!9089))

(assert (= (and d!24365 c!15379) b!92296))

(assert (= (and d!24365 (not c!15379)) b!92309))

(assert (= (and d!24365 res!46952) b!92300))

(assert (= (and b!92300 res!46955) b!92305))

(assert (= (and b!92305 res!46956) b!92307))

(assert (=> b!92302 m!97899))

(assert (=> b!92302 m!98383))

(declare-fun m!99413 () Bool)

(assert (=> b!92299 m!99413))

(assert (=> b!92296 m!97899))

(declare-fun m!99415 () Bool)

(assert (=> b!92296 m!99415))

(assert (=> b!92296 m!98107))

(assert (=> b!92296 m!98107))

(assert (=> b!92296 m!97899))

(declare-fun m!99417 () Bool)

(assert (=> b!92296 m!99417))

(assert (=> b!92311 m!97899))

(assert (=> b!92311 m!98387))

(declare-fun m!99419 () Bool)

(assert (=> b!92300 m!99419))

(declare-fun m!99421 () Bool)

(assert (=> b!92305 m!99421))

(assert (=> b!92305 m!99421))

(assert (=> b!92305 m!97899))

(declare-fun m!99423 () Bool)

(assert (=> b!92305 m!99423))

(assert (=> d!24365 m!97899))

(declare-fun m!99425 () Bool)

(assert (=> d!24365 m!99425))

(assert (=> d!24365 m!97899))

(declare-fun m!99427 () Bool)

(assert (=> d!24365 m!99427))

(declare-fun m!99429 () Bool)

(assert (=> d!24365 m!99429))

(assert (=> d!24365 m!98107))

(declare-fun m!99431 () Bool)

(assert (=> d!24365 m!99431))

(declare-fun m!99433 () Bool)

(assert (=> d!24365 m!99433))

(declare-fun m!99435 () Bool)

(assert (=> d!24365 m!99435))

(assert (=> d!24365 m!97899))

(declare-fun m!99437 () Bool)

(assert (=> d!24365 m!99437))

(assert (=> d!24365 m!98107))

(assert (=> d!24365 m!97899))

(assert (=> d!24365 m!99417))

(declare-fun m!99439 () Bool)

(assert (=> d!24365 m!99439))

(assert (=> d!24365 m!97899))

(declare-fun m!99441 () Bool)

(assert (=> d!24365 m!99441))

(assert (=> d!24365 m!98107))

(assert (=> d!24365 m!99075))

(declare-fun m!99443 () Bool)

(assert (=> d!24365 m!99443))

(declare-fun m!99445 () Bool)

(assert (=> d!24365 m!99445))

(assert (=> d!24365 m!99433))

(declare-fun m!99447 () Bool)

(assert (=> d!24365 m!99447))

(declare-fun m!99449 () Bool)

(assert (=> d!24365 m!99449))

(assert (=> d!24365 m!97961))

(declare-fun m!99451 () Bool)

(assert (=> d!24365 m!99451))

(assert (=> d!24365 m!97899))

(declare-fun m!99453 () Bool)

(assert (=> d!24365 m!99453))

(declare-fun m!99455 () Bool)

(assert (=> d!24365 m!99455))

(assert (=> d!24365 m!99447))

(assert (=> d!24365 m!97899))

(declare-fun m!99457 () Bool)

(assert (=> d!24365 m!99457))

(assert (=> d!24365 m!98101))

(declare-fun m!99459 () Bool)

(assert (=> d!24365 m!99459))

(assert (=> d!24365 m!97899))

(assert (=> d!24365 m!98403))

(declare-fun m!99461 () Bool)

(assert (=> bm!9091 m!99461))

(declare-fun m!99463 () Bool)

(assert (=> b!92304 m!99463))

(assert (=> bm!9092 m!97899))

(assert (=> bm!9092 m!98403))

(assert (=> b!92307 m!99421))

(assert (=> b!92307 m!97907))

(assert (=> b!92307 m!97907))

(declare-fun m!99465 () Bool)

(assert (=> b!92307 m!99465))

(declare-fun m!99467 () Bool)

(assert (=> b!92298 m!99467))

(assert (=> bm!9089 m!97899))

(assert (=> bm!9089 m!98381))

(assert (=> bm!9000 d!24365))

(declare-fun d!24367 () Bool)

(assert (=> d!24367 (= (get!1243 (select (arr!1955 (_values!2388 (v!2713 (underlying!308 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!355 (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91618 d!24367))

(declare-fun d!24369 () Bool)

(declare-fun e!60169 () Bool)

(assert (=> d!24369 e!60169))

(declare-fun res!46957 () Bool)

(assert (=> d!24369 (=> res!46957 e!60169)))

(declare-fun lt!45280 () Bool)

(assert (=> d!24369 (= res!46957 (not lt!45280))))

(declare-fun lt!45278 () Bool)

(assert (=> d!24369 (= lt!45280 lt!45278)))

(declare-fun lt!45279 () Unit!2718)

(declare-fun e!60170 () Unit!2718)

(assert (=> d!24369 (= lt!45279 e!60170)))

(declare-fun c!15381 () Bool)

(assert (=> d!24369 (= c!15381 lt!45278)))

(assert (=> d!24369 (= lt!45278 (containsKey!147 (toList!754 lt!44743) (_1!1139 lt!44492)))))

(assert (=> d!24369 (= (contains!772 lt!44743 (_1!1139 lt!44492)) lt!45280)))

(declare-fun b!92313 () Bool)

(declare-fun lt!45277 () Unit!2718)

(assert (=> b!92313 (= e!60170 lt!45277)))

(assert (=> b!92313 (= lt!45277 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44743) (_1!1139 lt!44492)))))

(assert (=> b!92313 (isDefined!97 (getValueByKey!143 (toList!754 lt!44743) (_1!1139 lt!44492)))))

(declare-fun b!92314 () Bool)

(declare-fun Unit!2756 () Unit!2718)

(assert (=> b!92314 (= e!60170 Unit!2756)))

(declare-fun b!92315 () Bool)

(assert (=> b!92315 (= e!60169 (isDefined!97 (getValueByKey!143 (toList!754 lt!44743) (_1!1139 lt!44492))))))

(assert (= (and d!24369 c!15381) b!92313))

(assert (= (and d!24369 (not c!15381)) b!92314))

(assert (= (and d!24369 (not res!46957)) b!92315))

(declare-fun m!99469 () Bool)

(assert (=> d!24369 m!99469))

(declare-fun m!99471 () Bool)

(assert (=> b!92313 m!99471))

(assert (=> b!92313 m!98299))

(assert (=> b!92313 m!98299))

(declare-fun m!99473 () Bool)

(assert (=> b!92313 m!99473))

(assert (=> b!92315 m!98299))

(assert (=> b!92315 m!98299))

(assert (=> b!92315 m!99473))

(assert (=> d!24061 d!24369))

(declare-fun d!24371 () Bool)

(declare-fun c!15382 () Bool)

(assert (=> d!24371 (= c!15382 (and ((_ is Cons!1551) lt!44746) (= (_1!1139 (h!2143 lt!44746)) (_1!1139 lt!44492))))))

(declare-fun e!60171 () Option!149)

(assert (=> d!24371 (= (getValueByKey!143 lt!44746 (_1!1139 lt!44492)) e!60171)))

(declare-fun b!92318 () Bool)

(declare-fun e!60172 () Option!149)

(assert (=> b!92318 (= e!60172 (getValueByKey!143 (t!5380 lt!44746) (_1!1139 lt!44492)))))

(declare-fun b!92317 () Bool)

(assert (=> b!92317 (= e!60171 e!60172)))

(declare-fun c!15383 () Bool)

(assert (=> b!92317 (= c!15383 (and ((_ is Cons!1551) lt!44746) (not (= (_1!1139 (h!2143 lt!44746)) (_1!1139 lt!44492)))))))

(declare-fun b!92319 () Bool)

(assert (=> b!92319 (= e!60172 None!147)))

(declare-fun b!92316 () Bool)

(assert (=> b!92316 (= e!60171 (Some!148 (_2!1139 (h!2143 lt!44746))))))

(assert (= (and d!24371 c!15382) b!92316))

(assert (= (and d!24371 (not c!15382)) b!92317))

(assert (= (and b!92317 c!15383) b!92318))

(assert (= (and b!92317 (not c!15383)) b!92319))

(declare-fun m!99475 () Bool)

(assert (=> b!92318 m!99475))

(assert (=> d!24061 d!24371))

(declare-fun d!24373 () Bool)

(assert (=> d!24373 (= (getValueByKey!143 lt!44746 (_1!1139 lt!44492)) (Some!148 (_2!1139 lt!44492)))))

(declare-fun lt!45281 () Unit!2718)

(assert (=> d!24373 (= lt!45281 (choose!554 lt!44746 (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(declare-fun e!60173 () Bool)

(assert (=> d!24373 e!60173))

(declare-fun res!46958 () Bool)

(assert (=> d!24373 (=> (not res!46958) (not e!60173))))

(assert (=> d!24373 (= res!46958 (isStrictlySorted!296 lt!44746))))

(assert (=> d!24373 (= (lemmaContainsTupThenGetReturnValue!63 lt!44746 (_1!1139 lt!44492) (_2!1139 lt!44492)) lt!45281)))

(declare-fun b!92320 () Bool)

(declare-fun res!46959 () Bool)

(assert (=> b!92320 (=> (not res!46959) (not e!60173))))

(assert (=> b!92320 (= res!46959 (containsKey!147 lt!44746 (_1!1139 lt!44492)))))

(declare-fun b!92321 () Bool)

(assert (=> b!92321 (= e!60173 (contains!773 lt!44746 (tuple2!2257 (_1!1139 lt!44492) (_2!1139 lt!44492))))))

(assert (= (and d!24373 res!46958) b!92320))

(assert (= (and b!92320 res!46959) b!92321))

(assert (=> d!24373 m!98293))

(declare-fun m!99477 () Bool)

(assert (=> d!24373 m!99477))

(declare-fun m!99479 () Bool)

(assert (=> d!24373 m!99479))

(declare-fun m!99481 () Bool)

(assert (=> b!92320 m!99481))

(declare-fun m!99483 () Bool)

(assert (=> b!92321 m!99483))

(assert (=> d!24061 d!24373))

(declare-fun b!92322 () Bool)

(declare-fun res!46961 () Bool)

(declare-fun e!60178 () Bool)

(assert (=> b!92322 (=> (not res!46961) (not e!60178))))

(declare-fun lt!45282 () List!1555)

(assert (=> b!92322 (= res!46961 (containsKey!147 lt!45282 (_1!1139 lt!44492)))))

(declare-fun b!92323 () Bool)

(declare-fun e!60177 () List!1555)

(declare-fun call!9096 () List!1555)

(assert (=> b!92323 (= e!60177 call!9096)))

(declare-fun d!24375 () Bool)

(assert (=> d!24375 e!60178))

(declare-fun res!46960 () Bool)

(assert (=> d!24375 (=> (not res!46960) (not e!60178))))

(assert (=> d!24375 (= res!46960 (isStrictlySorted!296 lt!45282))))

(assert (=> d!24375 (= lt!45282 e!60177)))

(declare-fun c!15385 () Bool)

(assert (=> d!24375 (= c!15385 (and ((_ is Cons!1551) (toList!754 lt!44497)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44497))) (_1!1139 lt!44492))))))

(assert (=> d!24375 (isStrictlySorted!296 (toList!754 lt!44497))))

(assert (=> d!24375 (= (insertStrictlySorted!66 (toList!754 lt!44497) (_1!1139 lt!44492) (_2!1139 lt!44492)) lt!45282)))

(declare-fun bm!9093 () Bool)

(declare-fun call!9098 () List!1555)

(assert (=> bm!9093 (= call!9098 call!9096)))

(declare-fun b!92324 () Bool)

(declare-fun e!60174 () List!1555)

(assert (=> b!92324 (= e!60177 e!60174)))

(declare-fun c!15384 () Bool)

(assert (=> b!92324 (= c!15384 (and ((_ is Cons!1551) (toList!754 lt!44497)) (= (_1!1139 (h!2143 (toList!754 lt!44497))) (_1!1139 lt!44492))))))

(declare-fun e!60175 () List!1555)

(declare-fun c!15386 () Bool)

(declare-fun b!92325 () Bool)

(assert (=> b!92325 (= e!60175 (ite c!15384 (t!5380 (toList!754 lt!44497)) (ite c!15386 (Cons!1551 (h!2143 (toList!754 lt!44497)) (t!5380 (toList!754 lt!44497))) Nil!1552)))))

(declare-fun b!92326 () Bool)

(declare-fun e!60176 () List!1555)

(declare-fun call!9097 () List!1555)

(assert (=> b!92326 (= e!60176 call!9097)))

(declare-fun b!92327 () Bool)

(assert (=> b!92327 (= e!60176 call!9097)))

(declare-fun b!92328 () Bool)

(assert (=> b!92328 (= e!60174 call!9098)))

(declare-fun bm!9094 () Bool)

(assert (=> bm!9094 (= call!9096 ($colon$colon!74 e!60175 (ite c!15385 (h!2143 (toList!754 lt!44497)) (tuple2!2257 (_1!1139 lt!44492) (_2!1139 lt!44492)))))))

(declare-fun c!15387 () Bool)

(assert (=> bm!9094 (= c!15387 c!15385)))

(declare-fun b!92329 () Bool)

(assert (=> b!92329 (= e!60175 (insertStrictlySorted!66 (t!5380 (toList!754 lt!44497)) (_1!1139 lt!44492) (_2!1139 lt!44492)))))

(declare-fun bm!9095 () Bool)

(assert (=> bm!9095 (= call!9097 call!9098)))

(declare-fun b!92330 () Bool)

(assert (=> b!92330 (= c!15386 (and ((_ is Cons!1551) (toList!754 lt!44497)) (bvsgt (_1!1139 (h!2143 (toList!754 lt!44497))) (_1!1139 lt!44492))))))

(assert (=> b!92330 (= e!60174 e!60176)))

(declare-fun b!92331 () Bool)

(assert (=> b!92331 (= e!60178 (contains!773 lt!45282 (tuple2!2257 (_1!1139 lt!44492) (_2!1139 lt!44492))))))

(assert (= (and d!24375 c!15385) b!92323))

(assert (= (and d!24375 (not c!15385)) b!92324))

(assert (= (and b!92324 c!15384) b!92328))

(assert (= (and b!92324 (not c!15384)) b!92330))

(assert (= (and b!92330 c!15386) b!92326))

(assert (= (and b!92330 (not c!15386)) b!92327))

(assert (= (or b!92326 b!92327) bm!9095))

(assert (= (or b!92328 bm!9095) bm!9093))

(assert (= (or b!92323 bm!9093) bm!9094))

(assert (= (and bm!9094 c!15387) b!92329))

(assert (= (and bm!9094 (not c!15387)) b!92325))

(assert (= (and d!24375 res!46960) b!92322))

(assert (= (and b!92322 res!46961) b!92331))

(declare-fun m!99485 () Bool)

(assert (=> d!24375 m!99485))

(declare-fun m!99487 () Bool)

(assert (=> d!24375 m!99487))

(declare-fun m!99489 () Bool)

(assert (=> bm!9094 m!99489))

(declare-fun m!99491 () Bool)

(assert (=> b!92322 m!99491))

(declare-fun m!99493 () Bool)

(assert (=> b!92329 m!99493))

(declare-fun m!99495 () Bool)

(assert (=> b!92331 m!99495))

(assert (=> d!24061 d!24375))

(assert (=> bm!8938 d!24197))

(assert (=> b!91738 d!24153))

(declare-fun d!24377 () Bool)

(declare-fun e!60179 () Bool)

(assert (=> d!24377 e!60179))

(declare-fun res!46962 () Bool)

(assert (=> d!24377 (=> (not res!46962) (not e!60179))))

(declare-fun lt!45283 () ListLongMap!1477)

(assert (=> d!24377 (= res!46962 (contains!772 lt!45283 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45286 () List!1555)

(assert (=> d!24377 (= lt!45283 (ListLongMap!1478 lt!45286))))

(declare-fun lt!45285 () Unit!2718)

(declare-fun lt!45284 () Unit!2718)

(assert (=> d!24377 (= lt!45285 lt!45284)))

(assert (=> d!24377 (= (getValueByKey!143 lt!45286 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24377 (= lt!45284 (lemmaContainsTupThenGetReturnValue!63 lt!45286 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24377 (= lt!45286 (insertStrictlySorted!66 (toList!754 lt!44498) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24377 (= (+!119 lt!44498 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45283)))

(declare-fun b!92332 () Bool)

(declare-fun res!46963 () Bool)

(assert (=> b!92332 (=> (not res!46963) (not e!60179))))

(assert (=> b!92332 (= res!46963 (= (getValueByKey!143 (toList!754 lt!45283) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92333 () Bool)

(assert (=> b!92333 (= e!60179 (contains!773 (toList!754 lt!45283) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24377 res!46962) b!92332))

(assert (= (and b!92332 res!46963) b!92333))

(declare-fun m!99497 () Bool)

(assert (=> d!24377 m!99497))

(declare-fun m!99499 () Bool)

(assert (=> d!24377 m!99499))

(declare-fun m!99501 () Bool)

(assert (=> d!24377 m!99501))

(declare-fun m!99503 () Bool)

(assert (=> d!24377 m!99503))

(declare-fun m!99505 () Bool)

(assert (=> b!92332 m!99505))

(declare-fun m!99507 () Bool)

(assert (=> b!92333 m!99507))

(assert (=> d!24065 d!24377))

(declare-fun d!24379 () Bool)

(declare-fun e!60180 () Bool)

(assert (=> d!24379 e!60180))

(declare-fun res!46964 () Bool)

(assert (=> d!24379 (=> (not res!46964) (not e!60180))))

(declare-fun lt!45287 () ListLongMap!1477)

(assert (=> d!24379 (= res!46964 (contains!772 lt!45287 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(declare-fun lt!45290 () List!1555)

(assert (=> d!24379 (= lt!45287 (ListLongMap!1478 lt!45290))))

(declare-fun lt!45289 () Unit!2718)

(declare-fun lt!45288 () Unit!2718)

(assert (=> d!24379 (= lt!45289 lt!45288)))

(assert (=> d!24379 (= (getValueByKey!143 lt!45290 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24379 (= lt!45288 (lemmaContainsTupThenGetReturnValue!63 lt!45290 (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24379 (= lt!45290 (insertStrictlySorted!66 (toList!754 (+!119 lt!44498 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))))))

(assert (=> d!24379 (= (+!119 (+!119 lt!44498 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) lt!45287)))

(declare-fun b!92334 () Bool)

(declare-fun res!46965 () Bool)

(assert (=> b!92334 (=> (not res!46965) (not e!60180))))

(assert (=> b!92334 (= res!46965 (= (getValueByKey!143 (toList!754 lt!45287) (_1!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (Some!148 (_2!1139 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))))

(declare-fun b!92335 () Bool)

(assert (=> b!92335 (= e!60180 (contains!773 (toList!754 lt!45287) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))))))

(assert (= (and d!24379 res!46964) b!92334))

(assert (= (and b!92334 res!46965) b!92335))

(declare-fun m!99509 () Bool)

(assert (=> d!24379 m!99509))

(declare-fun m!99511 () Bool)

(assert (=> d!24379 m!99511))

(declare-fun m!99513 () Bool)

(assert (=> d!24379 m!99513))

(declare-fun m!99515 () Bool)

(assert (=> d!24379 m!99515))

(declare-fun m!99517 () Bool)

(assert (=> b!92334 m!99517))

(declare-fun m!99519 () Bool)

(assert (=> b!92335 m!99519))

(assert (=> d!24065 d!24379))

(declare-fun d!24381 () Bool)

(assert (=> d!24381 (= (+!119 (+!119 lt!44498 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (+!119 (+!119 lt!44498 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (=> d!24381 true))

(declare-fun _$28!155 () Unit!2718)

(assert (=> d!24381 (= (choose!550 lt!44498 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))) _$28!155)))

(declare-fun bs!3827 () Bool)

(assert (= bs!3827 d!24381))

(assert (=> bs!3827 m!98317))

(assert (=> bs!3827 m!98317))

(assert (=> bs!3827 m!98319))

(assert (=> bs!3827 m!98313))

(assert (=> bs!3827 m!98313))

(assert (=> bs!3827 m!98315))

(assert (=> d!24065 d!24381))

(declare-fun d!24383 () Bool)

(declare-fun e!60181 () Bool)

(assert (=> d!24383 e!60181))

(declare-fun res!46966 () Bool)

(assert (=> d!24383 (=> (not res!46966) (not e!60181))))

(declare-fun lt!45291 () ListLongMap!1477)

(assert (=> d!24383 (= res!46966 (contains!772 lt!45291 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun lt!45294 () List!1555)

(assert (=> d!24383 (= lt!45291 (ListLongMap!1478 lt!45294))))

(declare-fun lt!45293 () Unit!2718)

(declare-fun lt!45292 () Unit!2718)

(assert (=> d!24383 (= lt!45293 lt!45292)))

(assert (=> d!24383 (= (getValueByKey!143 lt!45294 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24383 (= lt!45292 (lemmaContainsTupThenGetReturnValue!63 lt!45294 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24383 (= lt!45294 (insertStrictlySorted!66 (toList!754 (+!119 lt!44498 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992)))))) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24383 (= (+!119 (+!119 lt!44498 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2713 (underlying!308 thiss!992))))) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) lt!45291)))

(declare-fun b!92336 () Bool)

(declare-fun res!46967 () Bool)

(assert (=> b!92336 (=> (not res!46967) (not e!60181))))

(assert (=> b!92336 (= res!46967 (= (getValueByKey!143 (toList!754 lt!45291) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(declare-fun b!92337 () Bool)

(assert (=> b!92337 (= e!60181 (contains!773 (toList!754 lt!45291) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (= (and d!24383 res!46966) b!92336))

(assert (= (and b!92336 res!46967) b!92337))

(declare-fun m!99521 () Bool)

(assert (=> d!24383 m!99521))

(declare-fun m!99523 () Bool)

(assert (=> d!24383 m!99523))

(declare-fun m!99525 () Bool)

(assert (=> d!24383 m!99525))

(declare-fun m!99527 () Bool)

(assert (=> d!24383 m!99527))

(declare-fun m!99529 () Bool)

(assert (=> b!92336 m!99529))

(declare-fun m!99531 () Bool)

(assert (=> b!92337 m!99531))

(assert (=> d!24065 d!24383))

(declare-fun d!24385 () Bool)

(declare-fun e!60182 () Bool)

(assert (=> d!24385 e!60182))

(declare-fun res!46968 () Bool)

(assert (=> d!24385 (=> (not res!46968) (not e!60182))))

(declare-fun lt!45295 () ListLongMap!1477)

(assert (=> d!24385 (= res!46968 (contains!772 lt!45295 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(declare-fun lt!45298 () List!1555)

(assert (=> d!24385 (= lt!45295 (ListLongMap!1478 lt!45298))))

(declare-fun lt!45297 () Unit!2718)

(declare-fun lt!45296 () Unit!2718)

(assert (=> d!24385 (= lt!45297 lt!45296)))

(assert (=> d!24385 (= (getValueByKey!143 lt!45298 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24385 (= lt!45296 (lemmaContainsTupThenGetReturnValue!63 lt!45298 (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24385 (= lt!45298 (insertStrictlySorted!66 (toList!754 lt!44498) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (=> d!24385 (= (+!119 lt!44498 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)) lt!45295)))

(declare-fun b!92338 () Bool)

(declare-fun res!46969 () Bool)

(assert (=> b!92338 (=> (not res!46969) (not e!60182))))

(assert (=> b!92338 (= res!46969 (= (getValueByKey!143 (toList!754 lt!45295) (_1!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (Some!148 (_2!1139 (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(declare-fun b!92339 () Bool)

(assert (=> b!92339 (= e!60182 (contains!773 (toList!754 lt!45295) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))

(assert (= (and d!24385 res!46968) b!92338))

(assert (= (and b!92338 res!46969) b!92339))

(declare-fun m!99533 () Bool)

(assert (=> d!24385 m!99533))

(declare-fun m!99535 () Bool)

(assert (=> d!24385 m!99535))

(declare-fun m!99537 () Bool)

(assert (=> d!24385 m!99537))

(declare-fun m!99539 () Bool)

(assert (=> d!24385 m!99539))

(declare-fun m!99541 () Bool)

(assert (=> b!92338 m!99541))

(declare-fun m!99543 () Bool)

(assert (=> b!92339 m!99543))

(assert (=> d!24065 d!24385))

(assert (=> d!24055 d!24117))

(declare-fun d!24387 () Bool)

(declare-fun e!60183 () Bool)

(assert (=> d!24387 e!60183))

(declare-fun res!46970 () Bool)

(assert (=> d!24387 (=> res!46970 e!60183)))

(declare-fun lt!45302 () Bool)

(assert (=> d!24387 (= res!46970 (not lt!45302))))

(declare-fun lt!45300 () Bool)

(assert (=> d!24387 (= lt!45302 lt!45300)))

(declare-fun lt!45301 () Unit!2718)

(declare-fun e!60184 () Unit!2718)

(assert (=> d!24387 (= lt!45301 e!60184)))

(declare-fun c!15388 () Bool)

(assert (=> d!24387 (= c!15388 lt!45300)))

(assert (=> d!24387 (= lt!45300 (containsKey!147 (toList!754 lt!44755) (_1!1139 lt!44495)))))

(assert (=> d!24387 (= (contains!772 lt!44755 (_1!1139 lt!44495)) lt!45302)))

(declare-fun b!92340 () Bool)

(declare-fun lt!45299 () Unit!2718)

(assert (=> b!92340 (= e!60184 lt!45299)))

(assert (=> b!92340 (= lt!45299 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!754 lt!44755) (_1!1139 lt!44495)))))

(assert (=> b!92340 (isDefined!97 (getValueByKey!143 (toList!754 lt!44755) (_1!1139 lt!44495)))))

(declare-fun b!92341 () Bool)

(declare-fun Unit!2757 () Unit!2718)

(assert (=> b!92341 (= e!60184 Unit!2757)))

(declare-fun b!92342 () Bool)

(assert (=> b!92342 (= e!60183 (isDefined!97 (getValueByKey!143 (toList!754 lt!44755) (_1!1139 lt!44495))))))

(assert (= (and d!24387 c!15388) b!92340))

(assert (= (and d!24387 (not c!15388)) b!92341))

(assert (= (and d!24387 (not res!46970)) b!92342))

(declare-fun m!99545 () Bool)

(assert (=> d!24387 m!99545))

(declare-fun m!99547 () Bool)

(assert (=> b!92340 m!99547))

(assert (=> b!92340 m!98345))

(assert (=> b!92340 m!98345))

(declare-fun m!99549 () Bool)

(assert (=> b!92340 m!99549))

(assert (=> b!92342 m!98345))

(assert (=> b!92342 m!98345))

(assert (=> b!92342 m!99549))

(assert (=> d!24071 d!24387))

(declare-fun d!24389 () Bool)

(declare-fun c!15389 () Bool)

(assert (=> d!24389 (= c!15389 (and ((_ is Cons!1551) lt!44758) (= (_1!1139 (h!2143 lt!44758)) (_1!1139 lt!44495))))))

(declare-fun e!60185 () Option!149)

(assert (=> d!24389 (= (getValueByKey!143 lt!44758 (_1!1139 lt!44495)) e!60185)))

(declare-fun b!92345 () Bool)

(declare-fun e!60186 () Option!149)

(assert (=> b!92345 (= e!60186 (getValueByKey!143 (t!5380 lt!44758) (_1!1139 lt!44495)))))

(declare-fun b!92344 () Bool)

(assert (=> b!92344 (= e!60185 e!60186)))

(declare-fun c!15390 () Bool)

(assert (=> b!92344 (= c!15390 (and ((_ is Cons!1551) lt!44758) (not (= (_1!1139 (h!2143 lt!44758)) (_1!1139 lt!44495)))))))

(declare-fun b!92346 () Bool)

(assert (=> b!92346 (= e!60186 None!147)))

(declare-fun b!92343 () Bool)

(assert (=> b!92343 (= e!60185 (Some!148 (_2!1139 (h!2143 lt!44758))))))

(assert (= (and d!24389 c!15389) b!92343))

(assert (= (and d!24389 (not c!15389)) b!92344))

(assert (= (and b!92344 c!15390) b!92345))

(assert (= (and b!92344 (not c!15390)) b!92346))

(declare-fun m!99551 () Bool)

(assert (=> b!92345 m!99551))

(assert (=> d!24071 d!24389))

(declare-fun d!24391 () Bool)

(assert (=> d!24391 (= (getValueByKey!143 lt!44758 (_1!1139 lt!44495)) (Some!148 (_2!1139 lt!44495)))))

(declare-fun lt!45303 () Unit!2718)

(assert (=> d!24391 (= lt!45303 (choose!554 lt!44758 (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(declare-fun e!60187 () Bool)

(assert (=> d!24391 e!60187))

(declare-fun res!46971 () Bool)

(assert (=> d!24391 (=> (not res!46971) (not e!60187))))

(assert (=> d!24391 (= res!46971 (isStrictlySorted!296 lt!44758))))

(assert (=> d!24391 (= (lemmaContainsTupThenGetReturnValue!63 lt!44758 (_1!1139 lt!44495) (_2!1139 lt!44495)) lt!45303)))

(declare-fun b!92347 () Bool)

(declare-fun res!46972 () Bool)

(assert (=> b!92347 (=> (not res!46972) (not e!60187))))

(assert (=> b!92347 (= res!46972 (containsKey!147 lt!44758 (_1!1139 lt!44495)))))

(declare-fun b!92348 () Bool)

(assert (=> b!92348 (= e!60187 (contains!773 lt!44758 (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495))))))

(assert (= (and d!24391 res!46971) b!92347))

(assert (= (and b!92347 res!46972) b!92348))

(assert (=> d!24391 m!98339))

(declare-fun m!99553 () Bool)

(assert (=> d!24391 m!99553))

(declare-fun m!99555 () Bool)

(assert (=> d!24391 m!99555))

(declare-fun m!99557 () Bool)

(assert (=> b!92347 m!99557))

(declare-fun m!99559 () Bool)

(assert (=> b!92348 m!99559))

(assert (=> d!24071 d!24391))

(declare-fun b!92349 () Bool)

(declare-fun res!46974 () Bool)

(declare-fun e!60192 () Bool)

(assert (=> b!92349 (=> (not res!46974) (not e!60192))))

(declare-fun lt!45304 () List!1555)

(assert (=> b!92349 (= res!46974 (containsKey!147 lt!45304 (_1!1139 lt!44495)))))

(declare-fun b!92350 () Bool)

(declare-fun e!60191 () List!1555)

(declare-fun call!9099 () List!1555)

(assert (=> b!92350 (= e!60191 call!9099)))

(declare-fun d!24393 () Bool)

(assert (=> d!24393 e!60192))

(declare-fun res!46973 () Bool)

(assert (=> d!24393 (=> (not res!46973) (not e!60192))))

(assert (=> d!24393 (= res!46973 (isStrictlySorted!296 lt!45304))))

(assert (=> d!24393 (= lt!45304 e!60191)))

(declare-fun c!15392 () Bool)

(assert (=> d!24393 (= c!15392 (and ((_ is Cons!1551) (toList!754 lt!44498)) (bvslt (_1!1139 (h!2143 (toList!754 lt!44498))) (_1!1139 lt!44495))))))

(assert (=> d!24393 (isStrictlySorted!296 (toList!754 lt!44498))))

(assert (=> d!24393 (= (insertStrictlySorted!66 (toList!754 lt!44498) (_1!1139 lt!44495) (_2!1139 lt!44495)) lt!45304)))

(declare-fun bm!9096 () Bool)

(declare-fun call!9101 () List!1555)

(assert (=> bm!9096 (= call!9101 call!9099)))

(declare-fun b!92351 () Bool)

(declare-fun e!60188 () List!1555)

(assert (=> b!92351 (= e!60191 e!60188)))

(declare-fun c!15391 () Bool)

(assert (=> b!92351 (= c!15391 (and ((_ is Cons!1551) (toList!754 lt!44498)) (= (_1!1139 (h!2143 (toList!754 lt!44498))) (_1!1139 lt!44495))))))

(declare-fun e!60189 () List!1555)

(declare-fun c!15393 () Bool)

(declare-fun b!92352 () Bool)

(assert (=> b!92352 (= e!60189 (ite c!15391 (t!5380 (toList!754 lt!44498)) (ite c!15393 (Cons!1551 (h!2143 (toList!754 lt!44498)) (t!5380 (toList!754 lt!44498))) Nil!1552)))))

(declare-fun b!92353 () Bool)

(declare-fun e!60190 () List!1555)

(declare-fun call!9100 () List!1555)

(assert (=> b!92353 (= e!60190 call!9100)))

(declare-fun b!92354 () Bool)

(assert (=> b!92354 (= e!60190 call!9100)))

(declare-fun b!92355 () Bool)

(assert (=> b!92355 (= e!60188 call!9101)))

(declare-fun bm!9097 () Bool)

(assert (=> bm!9097 (= call!9099 ($colon$colon!74 e!60189 (ite c!15392 (h!2143 (toList!754 lt!44498)) (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495)))))))

(declare-fun c!15394 () Bool)

(assert (=> bm!9097 (= c!15394 c!15392)))

(declare-fun b!92356 () Bool)

(assert (=> b!92356 (= e!60189 (insertStrictlySorted!66 (t!5380 (toList!754 lt!44498)) (_1!1139 lt!44495) (_2!1139 lt!44495)))))

(declare-fun bm!9098 () Bool)

(assert (=> bm!9098 (= call!9100 call!9101)))

(declare-fun b!92357 () Bool)

(assert (=> b!92357 (= c!15393 (and ((_ is Cons!1551) (toList!754 lt!44498)) (bvsgt (_1!1139 (h!2143 (toList!754 lt!44498))) (_1!1139 lt!44495))))))

(assert (=> b!92357 (= e!60188 e!60190)))

(declare-fun b!92358 () Bool)

(assert (=> b!92358 (= e!60192 (contains!773 lt!45304 (tuple2!2257 (_1!1139 lt!44495) (_2!1139 lt!44495))))))

(assert (= (and d!24393 c!15392) b!92350))

(assert (= (and d!24393 (not c!15392)) b!92351))

(assert (= (and b!92351 c!15391) b!92355))

(assert (= (and b!92351 (not c!15391)) b!92357))

(assert (= (and b!92357 c!15393) b!92353))

(assert (= (and b!92357 (not c!15393)) b!92354))

(assert (= (or b!92353 b!92354) bm!9098))

(assert (= (or b!92355 bm!9098) bm!9096))

(assert (= (or b!92350 bm!9096) bm!9097))

(assert (= (and bm!9097 c!15394) b!92356))

(assert (= (and bm!9097 (not c!15394)) b!92352))

(assert (= (and d!24393 res!46973) b!92349))

(assert (= (and b!92349 res!46974) b!92358))

(declare-fun m!99561 () Bool)

(assert (=> d!24393 m!99561))

(assert (=> d!24393 m!99335))

(declare-fun m!99563 () Bool)

(assert (=> bm!9097 m!99563))

(declare-fun m!99565 () Bool)

(assert (=> b!92349 m!99565))

(declare-fun m!99567 () Bool)

(assert (=> b!92356 m!99567))

(declare-fun m!99569 () Bool)

(assert (=> b!92358 m!99569))

(assert (=> d!24071 d!24393))

(declare-fun d!24395 () Bool)

(assert (=> d!24395 (= (+!119 (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (getCurrentListMap!437 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) lt!44843 (zeroValue!2293 newMap!16) lt!44490 #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45307 () Unit!2718)

(declare-fun choose!562 (array!4111 array!4113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2718)

(assert (=> d!24395 (= lt!45307 (choose!562 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) lt!44843 (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) lt!44490 (defaultEntry!2405 newMap!16)))))

(assert (=> d!24395 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24395 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (_keys!4084 newMap!16) (_values!2388 newMap!16) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) lt!44843 (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) lt!44490 (defaultEntry!2405 newMap!16)) lt!45307)))

(declare-fun bs!3828 () Bool)

(assert (= bs!3828 d!24395))

(assert (=> bs!3828 m!98107))

(declare-fun m!99571 () Bool)

(assert (=> bs!3828 m!99571))

(declare-fun m!99573 () Bool)

(assert (=> bs!3828 m!99573))

(assert (=> bs!3828 m!98107))

(declare-fun m!99575 () Bool)

(assert (=> bs!3828 m!99575))

(assert (=> bs!3828 m!98497))

(assert (=> b!91751 d!24395))

(declare-fun d!24397 () Bool)

(declare-fun c!15395 () Bool)

(assert (=> d!24397 (= c!15395 (and ((_ is Cons!1551) (toList!754 lt!44735)) (= (_1!1139 (h!2143 (toList!754 lt!44735))) (_1!1139 lt!44489))))))

(declare-fun e!60193 () Option!149)

(assert (=> d!24397 (= (getValueByKey!143 (toList!754 lt!44735) (_1!1139 lt!44489)) e!60193)))

(declare-fun b!92361 () Bool)

(declare-fun e!60194 () Option!149)

(assert (=> b!92361 (= e!60194 (getValueByKey!143 (t!5380 (toList!754 lt!44735)) (_1!1139 lt!44489)))))

(declare-fun b!92360 () Bool)

(assert (=> b!92360 (= e!60193 e!60194)))

(declare-fun c!15396 () Bool)

(assert (=> b!92360 (= c!15396 (and ((_ is Cons!1551) (toList!754 lt!44735)) (not (= (_1!1139 (h!2143 (toList!754 lt!44735))) (_1!1139 lt!44489)))))))

(declare-fun b!92362 () Bool)

(assert (=> b!92362 (= e!60194 None!147)))

(declare-fun b!92359 () Bool)

(assert (=> b!92359 (= e!60193 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44735)))))))

(assert (= (and d!24397 c!15395) b!92359))

(assert (= (and d!24397 (not c!15395)) b!92360))

(assert (= (and b!92360 c!15396) b!92361))

(assert (= (and b!92360 (not c!15396)) b!92362))

(declare-fun m!99577 () Bool)

(assert (=> b!92361 m!99577))

(assert (=> b!91576 d!24397))

(assert (=> d!24043 d!24153))

(declare-fun d!24399 () Bool)

(assert (=> d!24399 (= (apply!87 lt!44730 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1244 (getValueByKey!143 (toList!754 lt!44730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3829 () Bool)

(assert (= bs!3829 d!24399))

(assert (=> bs!3829 m!98611))

(assert (=> bs!3829 m!98611))

(declare-fun m!99579 () Bool)

(assert (=> bs!3829 m!99579))

(assert (=> b!91561 d!24399))

(declare-fun d!24401 () Bool)

(declare-fun c!15397 () Bool)

(assert (=> d!24401 (= c!15397 (and ((_ is Cons!1551) (toList!754 lt!44688)) (= (_1!1139 (h!2143 (toList!754 lt!44688))) (_1!1139 lt!44495))))))

(declare-fun e!60195 () Option!149)

(assert (=> d!24401 (= (getValueByKey!143 (toList!754 lt!44688) (_1!1139 lt!44495)) e!60195)))

(declare-fun b!92365 () Bool)

(declare-fun e!60196 () Option!149)

(assert (=> b!92365 (= e!60196 (getValueByKey!143 (t!5380 (toList!754 lt!44688)) (_1!1139 lt!44495)))))

(declare-fun b!92364 () Bool)

(assert (=> b!92364 (= e!60195 e!60196)))

(declare-fun c!15398 () Bool)

(assert (=> b!92364 (= c!15398 (and ((_ is Cons!1551) (toList!754 lt!44688)) (not (= (_1!1139 (h!2143 (toList!754 lt!44688))) (_1!1139 lt!44495)))))))

(declare-fun b!92366 () Bool)

(assert (=> b!92366 (= e!60196 None!147)))

(declare-fun b!92363 () Bool)

(assert (=> b!92363 (= e!60195 (Some!148 (_2!1139 (h!2143 (toList!754 lt!44688)))))))

(assert (= (and d!24401 c!15397) b!92363))

(assert (= (and d!24401 (not c!15397)) b!92364))

(assert (= (and b!92364 c!15398) b!92365))

(assert (= (and b!92364 (not c!15398)) b!92366))

(declare-fun m!99581 () Bool)

(assert (=> b!92365 m!99581))

(assert (=> b!91517 d!24401))

(declare-fun d!24403 () Bool)

(declare-fun e!60197 () Bool)

(assert (=> d!24403 e!60197))

(declare-fun res!46975 () Bool)

(assert (=> d!24403 (=> (not res!46975) (not e!60197))))

(declare-fun lt!45308 () ListLongMap!1477)

(assert (=> d!24403 (= res!46975 (contains!772 lt!45308 (_1!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(declare-fun lt!45311 () List!1555)

(assert (=> d!24403 (= lt!45308 (ListLongMap!1478 lt!45311))))

(declare-fun lt!45310 () Unit!2718)

(declare-fun lt!45309 () Unit!2718)

(assert (=> d!24403 (= lt!45310 lt!45309)))

(assert (=> d!24403 (= (getValueByKey!143 lt!45311 (_1!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))) (Some!148 (_2!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(assert (=> d!24403 (= lt!45309 (lemmaContainsTupThenGetReturnValue!63 lt!45311 (_1!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (_2!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(assert (=> d!24403 (= lt!45311 (insertStrictlySorted!66 (toList!754 e!59825) (_1!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) (_2!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))))))

(assert (=> d!24403 (= (+!119 e!59825 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))) lt!45308)))

(declare-fun b!92367 () Bool)

(declare-fun res!46976 () Bool)

(assert (=> b!92367 (=> (not res!46976) (not e!60197))))

(assert (=> b!92367 (= res!46976 (= (getValueByKey!143 (toList!754 lt!45308) (_1!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490)))) (Some!148 (_2!1139 (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))))

(declare-fun b!92368 () Bool)

(assert (=> b!92368 (= e!60197 (contains!773 (toList!754 lt!45308) (ite c!15230 (ite c!15232 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44490) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44490)) (tuple2!2257 (select (arr!1954 (_keys!4084 (v!2713 (underlying!308 thiss!992)))) from!355) lt!44490))))))

(assert (= (and d!24403 res!46975) b!92367))

(assert (= (and b!92367 res!46976) b!92368))

(declare-fun m!99583 () Bool)

(assert (=> d!24403 m!99583))

(declare-fun m!99585 () Bool)

(assert (=> d!24403 m!99585))

(declare-fun m!99587 () Bool)

(assert (=> d!24403 m!99587))

(declare-fun m!99589 () Bool)

(assert (=> d!24403 m!99589))

(declare-fun m!99591 () Bool)

(assert (=> b!92367 m!99591))

(declare-fun m!99593 () Bool)

(assert (=> b!92368 m!99593))

(assert (=> bm!9012 d!24403))

(declare-fun bm!9099 () Bool)

(declare-fun call!9106 () ListLongMap!1477)

(assert (=> bm!9099 (= call!9106 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!92369 () Bool)

(declare-fun res!46979 () Bool)

(declare-fun e!60210 () Bool)

(assert (=> b!92369 (=> (not res!46979) (not e!60210))))

(declare-fun e!60201 () Bool)

(assert (=> b!92369 (= res!46979 e!60201)))

(declare-fun res!46985 () Bool)

(assert (=> b!92369 (=> res!46985 e!60201)))

(declare-fun e!60206 () Bool)

(assert (=> b!92369 (= res!46985 (not e!60206))))

(declare-fun res!46980 () Bool)

(assert (=> b!92369 (=> (not res!46980) (not e!60206))))

(assert (=> b!92369 (= res!46980 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!92370 () Bool)

(declare-fun e!60208 () ListLongMap!1477)

(declare-fun call!9105 () ListLongMap!1477)

(assert (=> b!92370 (= e!60208 call!9105)))

(declare-fun bm!9100 () Bool)

(declare-fun call!9108 () Bool)

(declare-fun lt!45329 () ListLongMap!1477)

(assert (=> bm!9100 (= call!9108 (contains!772 lt!45329 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9101 () Bool)

(declare-fun call!9104 () Bool)

(assert (=> bm!9101 (= call!9104 (contains!772 lt!45329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92371 () Bool)

(declare-fun c!15400 () Bool)

(assert (=> b!92371 (= c!15400 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60204 () ListLongMap!1477)

(assert (=> b!92371 (= e!60208 e!60204)))

(declare-fun b!92372 () Bool)

(declare-fun e!60205 () Unit!2718)

(declare-fun Unit!2758 () Unit!2718)

(assert (=> b!92372 (= e!60205 Unit!2758)))

(declare-fun b!92373 () Bool)

(assert (=> b!92373 (= e!60206 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92374 () Bool)

(assert (=> b!92374 (= e!60204 call!9105)))

(declare-fun b!92375 () Bool)

(declare-fun e!60199 () Bool)

(assert (=> b!92375 (= e!60199 (= (apply!87 lt!45329 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 newMap!16)))))

(declare-fun b!92376 () Bool)

(declare-fun e!60209 () Bool)

(assert (=> b!92376 (= e!60209 e!60199)))

(declare-fun res!46977 () Bool)

(assert (=> b!92376 (= res!46977 call!9104)))

(assert (=> b!92376 (=> (not res!46977) (not e!60199))))

(declare-fun b!92377 () Bool)

(declare-fun e!60207 () Bool)

(assert (=> b!92377 (= e!60210 e!60207)))

(declare-fun c!15399 () Bool)

(assert (=> b!92377 (= c!15399 (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9102 () Bool)

(declare-fun call!9103 () ListLongMap!1477)

(declare-fun call!9102 () ListLongMap!1477)

(assert (=> bm!9102 (= call!9103 call!9102)))

(declare-fun b!92378 () Bool)

(declare-fun res!46981 () Bool)

(assert (=> b!92378 (=> (not res!46981) (not e!60210))))

(assert (=> b!92378 (= res!46981 e!60209)))

(declare-fun c!15403 () Bool)

(assert (=> b!92378 (= c!15403 (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!92379 () Bool)

(declare-fun e!60203 () Bool)

(assert (=> b!92379 (= e!60203 (= (apply!87 lt!45329 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 newMap!16)))))

(declare-fun b!92380 () Bool)

(declare-fun lt!45315 () Unit!2718)

(assert (=> b!92380 (= e!60205 lt!45315)))

(declare-fun lt!45320 () ListLongMap!1477)

(assert (=> b!92380 (= lt!45320 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45330 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45321 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45321 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45316 () Unit!2718)

(assert (=> b!92380 (= lt!45316 (addStillContains!63 lt!45320 lt!45330 (zeroValue!2293 newMap!16) lt!45321))))

(assert (=> b!92380 (contains!772 (+!119 lt!45320 (tuple2!2257 lt!45330 (zeroValue!2293 newMap!16))) lt!45321)))

(declare-fun lt!45332 () Unit!2718)

(assert (=> b!92380 (= lt!45332 lt!45316)))

(declare-fun lt!45327 () ListLongMap!1477)

(assert (=> b!92380 (= lt!45327 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45318 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45325 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45325 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45314 () Unit!2718)

(assert (=> b!92380 (= lt!45314 (addApplyDifferent!63 lt!45327 lt!45318 (minValue!2293 newMap!16) lt!45325))))

(assert (=> b!92380 (= (apply!87 (+!119 lt!45327 (tuple2!2257 lt!45318 (minValue!2293 newMap!16))) lt!45325) (apply!87 lt!45327 lt!45325))))

(declare-fun lt!45324 () Unit!2718)

(assert (=> b!92380 (= lt!45324 lt!45314)))

(declare-fun lt!45333 () ListLongMap!1477)

(assert (=> b!92380 (= lt!45333 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45312 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45313 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45313 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45317 () Unit!2718)

(assert (=> b!92380 (= lt!45317 (addApplyDifferent!63 lt!45333 lt!45312 (zeroValue!2293 newMap!16) lt!45313))))

(assert (=> b!92380 (= (apply!87 (+!119 lt!45333 (tuple2!2257 lt!45312 (zeroValue!2293 newMap!16))) lt!45313) (apply!87 lt!45333 lt!45313))))

(declare-fun lt!45331 () Unit!2718)

(assert (=> b!92380 (= lt!45331 lt!45317)))

(declare-fun lt!45323 () ListLongMap!1477)

(assert (=> b!92380 (= lt!45323 (getCurrentListMapNoExtraKeys!83 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45322 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45322 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45328 () (_ BitVec 64))

(assert (=> b!92380 (= lt!45328 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92380 (= lt!45315 (addApplyDifferent!63 lt!45323 lt!45322 (minValue!2293 newMap!16) lt!45328))))

(assert (=> b!92380 (= (apply!87 (+!119 lt!45323 (tuple2!2257 lt!45322 (minValue!2293 newMap!16))) lt!45328) (apply!87 lt!45323 lt!45328))))

(declare-fun c!15402 () Bool)

(declare-fun call!9107 () ListLongMap!1477)

(declare-fun c!15404 () Bool)

(declare-fun bm!9103 () Bool)

(assert (=> bm!9103 (= call!9107 (+!119 (ite c!15404 call!9106 (ite c!15402 call!9102 call!9103)) (ite (or c!15404 c!15402) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 newMap!16)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16)))))))

(declare-fun bm!9104 () Bool)

(assert (=> bm!9104 (= call!9102 call!9106)))

(declare-fun b!92381 () Bool)

(declare-fun e!60202 () Bool)

(assert (=> b!92381 (= e!60202 (validKeyInArray!0 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9105 () Bool)

(assert (=> bm!9105 (= call!9105 call!9107)))

(declare-fun d!24405 () Bool)

(assert (=> d!24405 e!60210))

(declare-fun res!46982 () Bool)

(assert (=> d!24405 (=> (not res!46982) (not e!60210))))

(assert (=> d!24405 (= res!46982 (or (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))))

(declare-fun lt!45319 () ListLongMap!1477)

(assert (=> d!24405 (= lt!45329 lt!45319)))

(declare-fun lt!45326 () Unit!2718)

(assert (=> d!24405 (= lt!45326 e!60205)))

(declare-fun c!15401 () Bool)

(assert (=> d!24405 (= c!15401 e!60202)))

(declare-fun res!46983 () Bool)

(assert (=> d!24405 (=> (not res!46983) (not e!60202))))

(assert (=> d!24405 (= res!46983 (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun e!60198 () ListLongMap!1477)

(assert (=> d!24405 (= lt!45319 e!60198)))

(assert (=> d!24405 (= c!15404 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24405 (validMask!0 (mask!6464 newMap!16))))

(assert (=> d!24405 (= (getCurrentListMap!437 (_keys!4084 newMap!16) (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))) (mask!6464 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) lt!45329)))

(declare-fun b!92382 () Bool)

(assert (=> b!92382 (= e!60207 e!60203)))

(declare-fun res!46984 () Bool)

(assert (=> b!92382 (= res!46984 call!9108)))

(assert (=> b!92382 (=> (not res!46984) (not e!60203))))

(declare-fun b!92383 () Bool)

(assert (=> b!92383 (= e!60209 (not call!9104))))

(declare-fun b!92384 () Bool)

(declare-fun e!60200 () Bool)

(assert (=> b!92384 (= e!60201 e!60200)))

(declare-fun res!46978 () Bool)

(assert (=> b!92384 (=> (not res!46978) (not e!60200))))

(assert (=> b!92384 (= res!46978 (contains!772 lt!45329 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!92384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!92385 () Bool)

(assert (=> b!92385 (= e!60200 (= (apply!87 lt!45329 (select (arr!1954 (_keys!4084 newMap!16)) #b00000000000000000000000000000000)) (get!1241 (select (arr!1955 (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!355 (defaultEntry!2405 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2203 (ite (or c!15230 c!15224) (_values!2388 newMap!16) (array!4114 (store (arr!1955 (_values!2388 newMap!16)) (index!3145 lt!44841) (ValueCellFull!947 lt!44490)) (size!2203 (_values!2388 newMap!16)))))))))

(assert (=> b!92385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2202 (_keys!4084 newMap!16))))))

(declare-fun b!92386 () Bool)

(assert (=> b!92386 (= e!60198 (+!119 call!9107 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16))))))

(declare-fun b!92387 () Bool)

(assert (=> b!92387 (= e!60207 (not call!9108))))

(declare-fun b!92388 () Bool)

(assert (=> b!92388 (= e!60204 call!9103)))

(declare-fun b!92389 () Bool)

(assert (=> b!92389 (= e!60198 e!60208)))

(assert (=> b!92389 (= c!15402 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!24405 c!15404) b!92386))

(assert (= (and d!24405 (not c!15404)) b!92389))

(assert (= (and b!92389 c!15402) b!92370))

(assert (= (and b!92389 (not c!15402)) b!92371))

(assert (= (and b!92371 c!15400) b!92374))

(assert (= (and b!92371 (not c!15400)) b!92388))

(assert (= (or b!92374 b!92388) bm!9102))

(assert (= (or b!92370 bm!9102) bm!9104))

(assert (= (or b!92370 b!92374) bm!9105))

(assert (= (or b!92386 bm!9104) bm!9099))

(assert (= (or b!92386 bm!9105) bm!9103))

(assert (= (and d!24405 res!46983) b!92381))

(assert (= (and d!24405 c!15401) b!92380))

(assert (= (and d!24405 (not c!15401)) b!92372))

(assert (= (and d!24405 res!46982) b!92369))

(assert (= (and b!92369 res!46980) b!92373))

(assert (= (and b!92369 (not res!46985)) b!92384))

(assert (= (and b!92384 res!46978) b!92385))

(assert (= (and b!92369 res!46979) b!92378))

(assert (= (and b!92378 c!15403) b!92376))

(assert (= (and b!92378 (not c!15403)) b!92383))

(assert (= (and b!92376 res!46977) b!92375))

(assert (= (or b!92376 b!92383) bm!9101))

(assert (= (and b!92378 res!46981) b!92377))

(assert (= (and b!92377 c!15399) b!92382))

(assert (= (and b!92377 (not c!15399)) b!92387))

(assert (= (and b!92382 res!46984) b!92379))

(assert (= (or b!92382 b!92387) bm!9100))

(declare-fun b_lambda!4063 () Bool)

(assert (=> (not b_lambda!4063) (not b!92385)))

(assert (=> b!92385 t!5391))

(declare-fun b_and!5593 () Bool)

(assert (= b_and!5589 (and (=> t!5391 result!3093) b_and!5593)))

(assert (=> b!92385 t!5393))

(declare-fun b_and!5595 () Bool)

(assert (= b_and!5591 (and (=> t!5393 result!3095) b_and!5595)))

(assert (=> b!92373 m!98447))

(assert (=> b!92373 m!98447))

(assert (=> b!92373 m!98449))

(declare-fun m!99595 () Bool)

(assert (=> bm!9101 m!99595))

(declare-fun m!99597 () Bool)

(assert (=> bm!9099 m!99597))

(declare-fun m!99599 () Bool)

(assert (=> b!92380 m!99599))

(declare-fun m!99601 () Bool)

(assert (=> b!92380 m!99601))

(declare-fun m!99603 () Bool)

(assert (=> b!92380 m!99603))

(assert (=> b!92380 m!99599))

(declare-fun m!99605 () Bool)

(assert (=> b!92380 m!99605))

(declare-fun m!99607 () Bool)

(assert (=> b!92380 m!99607))

(assert (=> b!92380 m!98447))

(declare-fun m!99609 () Bool)

(assert (=> b!92380 m!99609))

(declare-fun m!99611 () Bool)

(assert (=> b!92380 m!99611))

(assert (=> b!92380 m!99605))

(declare-fun m!99613 () Bool)

(assert (=> b!92380 m!99613))

(declare-fun m!99615 () Bool)

(assert (=> b!92380 m!99615))

(declare-fun m!99617 () Bool)

(assert (=> b!92380 m!99617))

(assert (=> b!92380 m!99607))

(declare-fun m!99619 () Bool)

(assert (=> b!92380 m!99619))

(declare-fun m!99621 () Bool)

(assert (=> b!92380 m!99621))

(assert (=> b!92380 m!99597))

(assert (=> b!92380 m!99621))

(declare-fun m!99623 () Bool)

(assert (=> b!92380 m!99623))

(declare-fun m!99625 () Bool)

(assert (=> b!92380 m!99625))

(declare-fun m!99627 () Bool)

(assert (=> b!92380 m!99627))

(assert (=> b!92381 m!98447))

(assert (=> b!92381 m!98447))

(assert (=> b!92381 m!98449))

(declare-fun m!99629 () Bool)

(assert (=> b!92379 m!99629))

(assert (=> b!92384 m!98447))

(assert (=> b!92384 m!98447))

(declare-fun m!99631 () Bool)

(assert (=> b!92384 m!99631))

(assert (=> b!92385 m!98489))

(assert (=> b!92385 m!98447))

(declare-fun m!99633 () Bool)

(assert (=> b!92385 m!99633))

(assert (=> b!92385 m!98489))

(declare-fun m!99635 () Bool)

(assert (=> b!92385 m!99635))

(assert (=> b!92385 m!98447))

(declare-fun m!99637 () Bool)

(assert (=> b!92385 m!99637))

(assert (=> b!92385 m!99633))

(assert (=> d!24405 m!98497))

(declare-fun m!99639 () Bool)

(assert (=> b!92386 m!99639))

(declare-fun m!99641 () Bool)

(assert (=> bm!9103 m!99641))

(declare-fun m!99643 () Bool)

(assert (=> bm!9100 m!99643))

(declare-fun m!99645 () Bool)

(assert (=> b!92375 m!99645))

(assert (=> bm!9004 d!24405))

(declare-fun b!92390 () Bool)

(declare-fun e!60213 () Bool)

(declare-fun call!9109 () Bool)

(assert (=> b!92390 (= e!60213 call!9109)))

(declare-fun b!92391 () Bool)

(assert (=> b!92391 (= e!60213 call!9109)))

(declare-fun bm!9106 () Bool)

(declare-fun c!15405 () Bool)

(assert (=> bm!9106 (= call!9109 (arrayNoDuplicates!0 (_keys!4084 (_2!1138 lt!44500)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!15405 (Cons!1552 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000) Nil!1553) Nil!1553)))))

(declare-fun b!92392 () Bool)

(declare-fun e!60212 () Bool)

(declare-fun e!60211 () Bool)

(assert (=> b!92392 (= e!60212 e!60211)))

(declare-fun res!46986 () Bool)

(assert (=> b!92392 (=> (not res!46986) (not e!60211))))

(declare-fun e!60214 () Bool)

(assert (=> b!92392 (= res!46986 (not e!60214))))

(declare-fun res!46988 () Bool)

(assert (=> b!92392 (=> (not res!46988) (not e!60214))))

(assert (=> b!92392 (= res!46988 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun b!92394 () Bool)

(assert (=> b!92394 (= e!60211 e!60213)))

(assert (=> b!92394 (= c!15405 (validKeyInArray!0 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(declare-fun d!24407 () Bool)

(declare-fun res!46987 () Bool)

(assert (=> d!24407 (=> res!46987 e!60212)))

(assert (=> d!24407 (= res!46987 (bvsge #b00000000000000000000000000000000 (size!2202 (_keys!4084 (_2!1138 lt!44500)))))))

(assert (=> d!24407 (= (arrayNoDuplicates!0 (_keys!4084 (_2!1138 lt!44500)) #b00000000000000000000000000000000 Nil!1553) e!60212)))

(declare-fun b!92393 () Bool)

(assert (=> b!92393 (= e!60214 (contains!774 Nil!1553 (select (arr!1954 (_keys!4084 (_2!1138 lt!44500))) #b00000000000000000000000000000000)))))

(assert (= (and d!24407 (not res!46987)) b!92392))

(assert (= (and b!92392 res!46988) b!92393))

(assert (= (and b!92392 res!46986) b!92394))

(assert (= (and b!92394 c!15405) b!92390))

(assert (= (and b!92394 (not c!15405)) b!92391))

(assert (= (or b!92390 b!92391) bm!9106))

(assert (=> bm!9106 m!98547))

(declare-fun m!99647 () Bool)

(assert (=> bm!9106 m!99647))

(assert (=> b!92392 m!98547))

(assert (=> b!92392 m!98547))

(assert (=> b!92392 m!98549))

(assert (=> b!92394 m!98547))

(assert (=> b!92394 m!98547))

(assert (=> b!92394 m!98549))

(assert (=> b!92393 m!98547))

(assert (=> b!92393 m!98547))

(declare-fun m!99649 () Bool)

(assert (=> b!92393 m!99649))

(assert (=> b!91510 d!24407))

(declare-fun condMapEmpty!3583 () Bool)

(declare-fun mapDefault!3583 () ValueCell!947)

(assert (=> mapNonEmpty!3581 (= condMapEmpty!3583 (= mapRest!3581 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3583)))))

(declare-fun e!60216 () Bool)

(declare-fun mapRes!3583 () Bool)

(assert (=> mapNonEmpty!3581 (= tp!9269 (and e!60216 mapRes!3583))))

(declare-fun mapNonEmpty!3583 () Bool)

(declare-fun tp!9271 () Bool)

(declare-fun e!60215 () Bool)

(assert (=> mapNonEmpty!3583 (= mapRes!3583 (and tp!9271 e!60215))))

(declare-fun mapKey!3583 () (_ BitVec 32))

(declare-fun mapValue!3583 () ValueCell!947)

(declare-fun mapRest!3583 () (Array (_ BitVec 32) ValueCell!947))

(assert (=> mapNonEmpty!3583 (= mapRest!3581 (store mapRest!3583 mapKey!3583 mapValue!3583))))

(declare-fun b!92396 () Bool)

(assert (=> b!92396 (= e!60216 tp_is_empty!2581)))

(declare-fun b!92395 () Bool)

(assert (=> b!92395 (= e!60215 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3583 () Bool)

(assert (=> mapIsEmpty!3583 mapRes!3583))

(assert (= (and mapNonEmpty!3581 condMapEmpty!3583) mapIsEmpty!3583))

(assert (= (and mapNonEmpty!3581 (not condMapEmpty!3583)) mapNonEmpty!3583))

(assert (= (and mapNonEmpty!3583 ((_ is ValueCellFull!947) mapValue!3583)) b!92395))

(assert (= (and mapNonEmpty!3581 ((_ is ValueCellFull!947) mapDefault!3583)) b!92396))

(declare-fun m!99651 () Bool)

(assert (=> mapNonEmpty!3583 m!99651))

(declare-fun condMapEmpty!3584 () Bool)

(declare-fun mapDefault!3584 () ValueCell!947)

(assert (=> mapNonEmpty!3582 (= condMapEmpty!3584 (= mapRest!3582 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3584)))))

(declare-fun e!60218 () Bool)

(declare-fun mapRes!3584 () Bool)

(assert (=> mapNonEmpty!3582 (= tp!9270 (and e!60218 mapRes!3584))))

(declare-fun mapNonEmpty!3584 () Bool)

(declare-fun tp!9272 () Bool)

(declare-fun e!60217 () Bool)

(assert (=> mapNonEmpty!3584 (= mapRes!3584 (and tp!9272 e!60217))))

(declare-fun mapKey!3584 () (_ BitVec 32))

(declare-fun mapRest!3584 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3584 () ValueCell!947)

(assert (=> mapNonEmpty!3584 (= mapRest!3582 (store mapRest!3584 mapKey!3584 mapValue!3584))))

(declare-fun b!92398 () Bool)

(assert (=> b!92398 (= e!60218 tp_is_empty!2581)))

(declare-fun b!92397 () Bool)

(assert (=> b!92397 (= e!60217 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3584 () Bool)

(assert (=> mapIsEmpty!3584 mapRes!3584))

(assert (= (and mapNonEmpty!3582 condMapEmpty!3584) mapIsEmpty!3584))

(assert (= (and mapNonEmpty!3582 (not condMapEmpty!3584)) mapNonEmpty!3584))

(assert (= (and mapNonEmpty!3584 ((_ is ValueCellFull!947) mapValue!3584)) b!92397))

(assert (= (and mapNonEmpty!3582 ((_ is ValueCellFull!947) mapDefault!3584)) b!92398))

(declare-fun m!99653 () Bool)

(assert (=> mapNonEmpty!3584 m!99653))

(declare-fun b_lambda!4065 () Bool)

(assert (= b_lambda!4063 (or (and b!91293 b_free!2329 (= (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) (defaultEntry!2405 newMap!16))) (and b!91288 b_free!2331) b_lambda!4065)))

(declare-fun b_lambda!4067 () Bool)

(assert (= b_lambda!4053 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4067)))

(declare-fun b_lambda!4069 () Bool)

(assert (= b_lambda!4057 (or (and b!91293 b_free!2329 (= (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) (defaultEntry!2405 newMap!16))) (and b!91288 b_free!2331) b_lambda!4069)))

(declare-fun b_lambda!4071 () Bool)

(assert (= b_lambda!4049 (or (and b!91293 b_free!2329 (= (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))) (defaultEntry!2405 newMap!16))) (and b!91288 b_free!2331) b_lambda!4071)))

(declare-fun b_lambda!4073 () Bool)

(assert (= b_lambda!4051 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4073)))

(declare-fun b_lambda!4075 () Bool)

(assert (= b_lambda!4061 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4075)))

(declare-fun b_lambda!4077 () Bool)

(assert (= b_lambda!4059 (or (and b!91293 b_free!2329) (and b!91288 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2713 (underlying!308 thiss!992))))) b_lambda!4077)))

(check-sat (not b!91831) (not b!92050) (not b!92356) (not b!91850) (not d!24161) (not d!24301) (not d!24327) (not b!92139) (not b!91789) (not d!24141) (not b!92210) (not mapNonEmpty!3583) (not b!92146) (not b!91951) (not d!24253) (not b!92219) (not b!92257) (not bm!9031) (not b!92027) (not b!91915) (not b!92023) (not bm!9079) (not b!92332) (not d!24399) (not d!24305) (not b!92092) (not b!92144) (not b!92313) (not b!92106) (not bm!9033) (not b_lambda!4031) (not b!92321) (not b!91827) (not bm!9044) (not b!92349) (not d!24135) (not b!91908) (not d!24377) (not b!91826) (not b!92345) (not b!92239) (not d!24187) (not b!92393) (not d!24233) (not b!91958) (not d!24241) (not d!24393) (not b!91774) (not b!92208) (not b!92234) (not bm!9092) (not bm!9047) (not b!92240) (not b!92215) (not bm!9041) b_and!5595 (not d!24119) (not b_lambda!4041) (not b!91943) (not b!92380) (not b!92187) (not d!24193) (not b!91832) (not d!24277) (not d!24381) (not b!91821) (not bm!9061) (not b!92072) (not b!92022) (not d!24211) (not d!24287) (not b!91986) (not b!91828) (not b!92183) (not b!92074) (not b!91845) (not b!92130) (not b!91796) (not b!91993) (not bm!9060) (not b_lambda!4075) (not bm!9089) (not b!92059) (not d!24237) (not b!91824) (not d!24323) (not d!24155) (not b!92084) (not b!91866) (not b!92120) b_and!5593 (not d!24347) (not b!92079) (not bm!9100) (not d!24359) (not b!92384) (not b!92099) (not d!24365) (not b!92128) (not bm!9103) (not b!92331) (not d!24279) (not d!24139) (not d!24295) (not b!92132) (not b!92141) (not b!92123) (not b!92152) (not b!91776) (not d!24353) (not b!91945) (not d!24213) (not b!92195) (not b!92381) (not d!24247) (not b!92118) (not d!24153) (not bm!9055) (not b!92012) (not b!92101) (not b!92004) (not d!24317) (not bm!9023) (not d!24387) (not b!91938) (not d!24369) (not b!91921) (not b!92217) (not b!92122) (not b!92115) (not b!92149) (not d!24183) (not d!24205) (not b!91858) (not b!92296) (not b!92300) (not d!24151) (not b_lambda!4047) (not b!92361) (not d!24191) (not d!24337) (not b!91944) (not b!91794) (not b!92000) (not d!24251) (not b!92302) (not mapNonEmpty!3584) (not bm!9106) (not d!24269) (not b!92016) (not d!24225) (not b!92334) (not d!24245) (not d!24271) (not b!91814) (not b!92069) (not b!92226) (not d!24163) (not b!91816) (not d!24101) (not b!92193) (not d!24133) (not b!92010) (not b_lambda!4043) (not b!91926) (not d!24375) (not b!92335) (not d!24331) (not b!91917) (not bm!9066) (not b!92028) (not b!91927) (not b!92063) (not b!91851) (not b!91952) (not d!24267) (not d!24403) (not d!24255) (not d!24275) (not b!92181) (not b!92005) (not d!24239) (not d!24185) (not b!92329) (not d!24391) (not b!92081) (not d!24221) (not b!92250) (not d!24405) (not b!92252) (not b!92007) (not b!92342) (not bm!9038) (not b_lambda!4071) (not d!24265) (not b!92011) (not b!92336) (not b!92185) (not d!24303) (not bm!9028) (not d!24131) (not d!24263) (not b!91922) (not d!24165) (not b!92218) (not d!24175) (not b!91923) (not b!92015) (not b!91902) (not b!91946) (not d!24219) (not b!91910) (not b!91942) (not b!92373) (not bm!9063) (not d!24373) (not b!91964) (not b!91873) (not d!24363) (not b!91940) (not b_lambda!4069) (not b!91995) (not d!24227) (not d!24385) (not b!92203) (not bm!9029) (not d!24349) (not b!91819) (not b!92070) (not b!92318) (not d!24339) (not b!92009) (not b!92337) (not b!91863) (not b!92121) (not d!24319) (not d!24203) (not b!92260) (not bm!9094) (not b!92024) (not b!91791) (not bm!9074) (not b!92014) (not d!24395) (not b!92315) (not b!92104) (not d!24121) (not b!92131) (not bm!9039) (not b_lambda!4073) (not d!24169) (not b_lambda!4065) (not b!92348) (not b!92229) (not b!91818) (not d!24181) (not b!91901) (not b!91998) (not d!24343) (not d!24355) (not bm!9022) (not b!92339) (not b!91996) (not b!92237) (not b!92097) (not b!92261) tp_is_empty!2581 (not b!92053) (not b!92365) (not b!92259) (not b!92017) (not bm!9057) (not b!92086) (not d!24281) (not b!92212) (not b!92147) (not d!24189) (not b!92311) (not b!91955) (not b!91953) (not b!92046) (not b!92307) (not d!24379) (not d!24123) (not b!92125) (not d!24259) (not bm!9030) (not b!91965) (not b!91947) (not d!24243) (not b!92392) (not b!91833) (not b!92001) (not b!92228) (not d!24125) (not b!92082) (not b!91838) (not b!91840) (not b!92320) (not b!91860) (not bm!9073) (not bm!9042) (not b!92020) (not b!92117) (not d!24291) (not d!24345) (not d!24129) (not b!92333) (not b!92232) (not b!92338) (not d!24293) (not b!92013) (not b!92029) (not b!91933) (not b!91785) (not b!91950) (not b!91857) (not b!92031) (not d!24177) (not d!24299) (not bm!9025) (not b!92305) (not d!24311) (not d!24229) (not d!24195) (not b!91802) (not d!24143) (not b!92340) (not d!24173) (not d!24297) (not b!91932) (not b!92052) (not b!92078) (not b_next!2329) (not b!92196) (not b!92062) (not b_lambda!4055) (not bm!9076) (not b!92003) (not d!24111) (not b!91855) (not b!92368) (not b!92107) (not b!92006) (not bm!9021) (not b!92248) (not b!91783) (not d!24361) (not b!92076) (not d!24235) (not b!92191) (not d!24223) (not b!92197) (not b!92192) (not b_lambda!4067) (not b!92385) (not b!91846) (not bm!9072) (not b_lambda!4045) (not b!91999) (not b!92322) (not b!91795) (not d!24199) (not b!92186) (not d!24357) (not b!92241) (not d!24159) (not d!24105) (not bm!9099) (not b!92386) (not d!24329) (not b!92075) (not b!91822) (not d!24231) (not b!91888) (not b!92143) (not d!24107) (not d!24179) (not d!24383) (not d!24313) (not d!24197) (not b_lambda!4077) (not b!91907) (not b!92379) (not d!24283) (not b!91849) (not b!92188) (not d!24325) (not b!92375) (not d!24307) (not b!92251) (not b!92108) (not d!24113) (not b!92358) (not b!92061) (not b!91844) (not d!24315) (not b!91928) (not b!92394) (not d!24333) (not b!92367) (not bm!9101) (not bm!9040) (not d!24321) (not d!24309) (not b!92042) (not b!91906) (not b!92089) (not b!91778) (not bm!9097) (not b_next!2331) (not b!92205) (not bm!9091) (not b!92179) (not b!92018) (not b!91813) (not b!91790) (not b!92347) (not b!92231))
(check-sat b_and!5593 b_and!5595 (not b_next!2329) (not b_next!2331))
