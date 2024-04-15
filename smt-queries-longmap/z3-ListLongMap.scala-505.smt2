; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11950 () Bool)

(assert start!11950)

(declare-fun b!100481 () Bool)

(declare-fun b_free!2449 () Bool)

(declare-fun b_next!2449 () Bool)

(assert (=> b!100481 (= b_free!2449 (not b_next!2449))))

(declare-fun tp!9645 () Bool)

(declare-fun b_and!6173 () Bool)

(assert (=> b!100481 (= tp!9645 b_and!6173)))

(declare-fun b!100484 () Bool)

(declare-fun b_free!2451 () Bool)

(declare-fun b_next!2451 () Bool)

(assert (=> b!100484 (= b_free!2451 (not b_next!2451))))

(declare-fun tp!9646 () Bool)

(declare-fun b_and!6175 () Bool)

(assert (=> b!100484 (= tp!9646 b_and!6175)))

(declare-fun b!100472 () Bool)

(declare-fun e!65437 () Bool)

(declare-fun tp_is_empty!2641 () Bool)

(assert (=> b!100472 (= e!65437 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3791 () Bool)

(declare-fun mapRes!3792 () Bool)

(declare-fun tp!9647 () Bool)

(declare-fun e!65431 () Bool)

(assert (=> mapNonEmpty!3791 (= mapRes!3792 (and tp!9647 e!65431))))

(declare-datatypes ((V!3169 0))(
  ( (V!3170 (val!1365 Int)) )
))
(declare-datatypes ((ValueCell!977 0))(
  ( (ValueCellFull!977 (v!2822 V!3169)) (EmptyCell!977) )
))
(declare-fun mapValue!3792 () ValueCell!977)

(declare-fun mapRest!3791 () (Array (_ BitVec 32) ValueCell!977))

(declare-datatypes ((array!4245 0))(
  ( (array!4246 (arr!2014 (Array (_ BitVec 32) (_ BitVec 64))) (size!2267 (_ BitVec 32))) )
))
(declare-datatypes ((array!4247 0))(
  ( (array!4248 (arr!2015 (Array (_ BitVec 32) ValueCell!977)) (size!2268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!862 0))(
  ( (LongMapFixedSize!863 (defaultEntry!2522 Int) (mask!6638 (_ BitVec 32)) (extraKeys!2335 (_ BitVec 32)) (zeroValue!2401 V!3169) (minValue!2401 V!3169) (_size!480 (_ BitVec 32)) (_keys!4219 array!4245) (_values!2505 array!4247) (_vacant!480 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!862)

(declare-fun mapKey!3792 () (_ BitVec 32))

(assert (=> mapNonEmpty!3791 (= (arr!2015 (_values!2505 newMap!16)) (store mapRest!3791 mapKey!3792 mapValue!3792))))

(declare-fun b!100473 () Bool)

(declare-fun e!65426 () Bool)

(declare-fun e!65423 () Bool)

(assert (=> b!100473 (= e!65426 e!65423)))

(declare-fun res!50395 () Bool)

(assert (=> b!100473 (=> (not res!50395) (not e!65423))))

(declare-datatypes ((tuple2!2336 0))(
  ( (tuple2!2337 (_1!1179 Bool) (_2!1179 LongMapFixedSize!862)) )
))
(declare-fun lt!50766 () tuple2!2336)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!100473 (= res!50395 (and (_1!1179 lt!50766) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3061 0))(
  ( (Unit!3062) )
))
(declare-fun lt!50761 () Unit!3061)

(declare-fun e!65429 () Unit!3061)

(assert (=> b!100473 (= lt!50761 e!65429)))

(declare-datatypes ((Cell!652 0))(
  ( (Cell!653 (v!2823 LongMapFixedSize!862)) )
))
(declare-datatypes ((LongMap!652 0))(
  ( (LongMap!653 (underlying!337 Cell!652)) )
))
(declare-fun thiss!992 () LongMap!652)

(declare-fun c!17245 () Bool)

(declare-datatypes ((tuple2!2338 0))(
  ( (tuple2!2339 (_1!1180 (_ BitVec 64)) (_2!1180 V!3169)) )
))
(declare-datatypes ((List!1593 0))(
  ( (Nil!1590) (Cons!1589 (h!2185 tuple2!2338) (t!5578 List!1593)) )
))
(declare-datatypes ((ListLongMap!1519 0))(
  ( (ListLongMap!1520 (toList!775 List!1593)) )
))
(declare-fun lt!50764 () ListLongMap!1519)

(declare-fun contains!802 (ListLongMap!1519 (_ BitVec 64)) Bool)

(assert (=> b!100473 (= c!17245 (contains!802 lt!50764 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun update!149 (LongMapFixedSize!862 (_ BitVec 64) V!3169) tuple2!2336)

(declare-fun get!1297 (ValueCell!977 V!3169) V!3169)

(declare-fun dynLambda!372 (Int (_ BitVec 64)) V!3169)

(assert (=> b!100473 (= lt!50766 (update!149 newMap!16 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!100474 () Bool)

(declare-fun Unit!3063 () Unit!3061)

(assert (=> b!100474 (= e!65429 Unit!3063)))

(declare-fun lt!50762 () Unit!3061)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!99 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) (_ BitVec 32) Int) Unit!3061)

(assert (=> b!100474 (= lt!50762 (lemmaListMapContainsThenArrayContainsFrom!99 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!100474 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!50765 () Unit!3061)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4245 (_ BitVec 32) (_ BitVec 32)) Unit!3061)

(assert (=> b!100474 (= lt!50765 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1594 0))(
  ( (Nil!1591) (Cons!1590 (h!2186 (_ BitVec 64)) (t!5579 List!1594)) )
))
(declare-fun arrayNoDuplicates!0 (array!4245 (_ BitVec 32) List!1594) Bool)

(assert (=> b!100474 (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) from!355 Nil!1591)))

(declare-fun lt!50760 () Unit!3061)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4245 (_ BitVec 32) (_ BitVec 64) List!1594) Unit!3061)

(assert (=> b!100474 (= lt!50760 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591)))))

(assert (=> b!100474 false))

(declare-fun b!100475 () Bool)

(declare-fun res!50398 () Bool)

(declare-fun e!65428 () Bool)

(assert (=> b!100475 (=> (not res!50398) (not e!65428))))

(assert (=> b!100475 (= res!50398 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun b!100476 () Bool)

(declare-fun res!50393 () Bool)

(assert (=> b!100476 (=> (not res!50393) (not e!65423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!100476 (= res!50393 (validMask!0 (mask!6638 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun res!50397 () Bool)

(assert (=> start!11950 (=> (not res!50397) (not e!65428))))

(declare-fun valid!398 (LongMap!652) Bool)

(assert (=> start!11950 (= res!50397 (valid!398 thiss!992))))

(assert (=> start!11950 e!65428))

(declare-fun e!65430 () Bool)

(assert (=> start!11950 e!65430))

(assert (=> start!11950 true))

(declare-fun e!65433 () Bool)

(assert (=> start!11950 e!65433))

(declare-fun b!100477 () Bool)

(assert (=> b!100477 (= e!65431 tp_is_empty!2641)))

(declare-fun b!100478 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4245 (_ BitVec 32)) Bool)

(assert (=> b!100478 (= e!65423 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!100479 () Bool)

(declare-fun e!65427 () Bool)

(assert (=> b!100479 (= e!65430 e!65427)))

(declare-fun b!100480 () Bool)

(declare-fun res!50399 () Bool)

(assert (=> b!100480 (=> (not res!50399) (not e!65428))))

(assert (=> b!100480 (= res!50399 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6638 newMap!16)) (_size!480 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun e!65424 () Bool)

(declare-fun e!65436 () Bool)

(declare-fun array_inv!1263 (array!4245) Bool)

(declare-fun array_inv!1264 (array!4247) Bool)

(assert (=> b!100481 (= e!65436 (and tp!9645 tp_is_empty!2641 (array_inv!1263 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (array_inv!1264 (_values!2505 (v!2823 (underlying!337 thiss!992)))) e!65424))))

(declare-fun b!100482 () Bool)

(declare-fun Unit!3064 () Unit!3061)

(assert (=> b!100482 (= e!65429 Unit!3064)))

(declare-fun b!100483 () Bool)

(declare-fun e!65435 () Bool)

(declare-fun e!65425 () Bool)

(assert (=> b!100483 (= e!65435 (and e!65425 mapRes!3792))))

(declare-fun condMapEmpty!3791 () Bool)

(declare-fun mapDefault!3792 () ValueCell!977)

(assert (=> b!100483 (= condMapEmpty!3791 (= (arr!2015 (_values!2505 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3792)))))

(assert (=> b!100484 (= e!65433 (and tp!9646 tp_is_empty!2641 (array_inv!1263 (_keys!4219 newMap!16)) (array_inv!1264 (_values!2505 newMap!16)) e!65435))))

(declare-fun b!100485 () Bool)

(assert (=> b!100485 (= e!65428 e!65426)))

(declare-fun res!50394 () Bool)

(assert (=> b!100485 (=> (not res!50394) (not e!65426))))

(declare-fun lt!50763 () ListLongMap!1519)

(assert (=> b!100485 (= res!50394 (and (= lt!50763 lt!50764) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1250 (LongMapFixedSize!862) ListLongMap!1519)

(assert (=> b!100485 (= lt!50764 (map!1250 newMap!16))))

(declare-fun getCurrentListMap!456 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) ListLongMap!1519)

(assert (=> b!100485 (= lt!50763 (getCurrentListMap!456 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun mapIsEmpty!3791 () Bool)

(assert (=> mapIsEmpty!3791 mapRes!3792))

(declare-fun b!100486 () Bool)

(declare-fun res!50396 () Bool)

(assert (=> b!100486 (=> (not res!50396) (not e!65423))))

(assert (=> b!100486 (= res!50396 (and (= (size!2268 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6638 (v!2823 (underlying!337 thiss!992))))) (= (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (size!2268 (_values!2505 (v!2823 (underlying!337 thiss!992))))) (bvsge (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!100487 () Bool)

(declare-fun e!65422 () Bool)

(declare-fun mapRes!3791 () Bool)

(assert (=> b!100487 (= e!65424 (and e!65422 mapRes!3791))))

(declare-fun condMapEmpty!3792 () Bool)

(declare-fun mapDefault!3791 () ValueCell!977)

(assert (=> b!100487 (= condMapEmpty!3792 (= (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3791)))))

(declare-fun b!100488 () Bool)

(assert (=> b!100488 (= e!65422 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3792 () Bool)

(declare-fun tp!9648 () Bool)

(assert (=> mapNonEmpty!3792 (= mapRes!3791 (and tp!9648 e!65437))))

(declare-fun mapKey!3791 () (_ BitVec 32))

(declare-fun mapRest!3792 () (Array (_ BitVec 32) ValueCell!977))

(declare-fun mapValue!3791 () ValueCell!977)

(assert (=> mapNonEmpty!3792 (= (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (store mapRest!3792 mapKey!3791 mapValue!3791))))

(declare-fun b!100489 () Bool)

(declare-fun res!50392 () Bool)

(assert (=> b!100489 (=> (not res!50392) (not e!65428))))

(declare-fun valid!399 (LongMapFixedSize!862) Bool)

(assert (=> b!100489 (= res!50392 (valid!399 newMap!16))))

(declare-fun mapIsEmpty!3792 () Bool)

(assert (=> mapIsEmpty!3792 mapRes!3791))

(declare-fun b!100490 () Bool)

(assert (=> b!100490 (= e!65427 e!65436)))

(declare-fun b!100491 () Bool)

(assert (=> b!100491 (= e!65425 tp_is_empty!2641)))

(assert (= (and start!11950 res!50397) b!100475))

(assert (= (and b!100475 res!50398) b!100489))

(assert (= (and b!100489 res!50392) b!100480))

(assert (= (and b!100480 res!50399) b!100485))

(assert (= (and b!100485 res!50394) b!100473))

(assert (= (and b!100473 c!17245) b!100474))

(assert (= (and b!100473 (not c!17245)) b!100482))

(assert (= (and b!100473 res!50395) b!100476))

(assert (= (and b!100476 res!50393) b!100486))

(assert (= (and b!100486 res!50396) b!100478))

(assert (= (and b!100487 condMapEmpty!3792) mapIsEmpty!3792))

(assert (= (and b!100487 (not condMapEmpty!3792)) mapNonEmpty!3792))

(get-info :version)

(assert (= (and mapNonEmpty!3792 ((_ is ValueCellFull!977) mapValue!3791)) b!100472))

(assert (= (and b!100487 ((_ is ValueCellFull!977) mapDefault!3791)) b!100488))

(assert (= b!100481 b!100487))

(assert (= b!100490 b!100481))

(assert (= b!100479 b!100490))

(assert (= start!11950 b!100479))

(assert (= (and b!100483 condMapEmpty!3791) mapIsEmpty!3791))

(assert (= (and b!100483 (not condMapEmpty!3791)) mapNonEmpty!3791))

(assert (= (and mapNonEmpty!3791 ((_ is ValueCellFull!977) mapValue!3792)) b!100477))

(assert (= (and b!100483 ((_ is ValueCellFull!977) mapDefault!3792)) b!100491))

(assert (= b!100484 b!100483))

(assert (= start!11950 b!100484))

(declare-fun b_lambda!4497 () Bool)

(assert (=> (not b_lambda!4497) (not b!100473)))

(declare-fun t!5575 () Bool)

(declare-fun tb!1953 () Bool)

(assert (=> (and b!100481 (= (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))) t!5575) tb!1953))

(declare-fun result!3307 () Bool)

(assert (=> tb!1953 (= result!3307 tp_is_empty!2641)))

(assert (=> b!100473 t!5575))

(declare-fun b_and!6177 () Bool)

(assert (= b_and!6173 (and (=> t!5575 result!3307) b_and!6177)))

(declare-fun t!5577 () Bool)

(declare-fun tb!1955 () Bool)

(assert (=> (and b!100484 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))) t!5577) tb!1955))

(declare-fun result!3311 () Bool)

(assert (= result!3311 result!3307))

(assert (=> b!100473 t!5577))

(declare-fun b_and!6179 () Bool)

(assert (= b_and!6175 (and (=> t!5577 result!3311) b_and!6179)))

(declare-fun m!111065 () Bool)

(assert (=> b!100474 m!111065))

(declare-fun m!111067 () Bool)

(assert (=> b!100474 m!111067))

(declare-fun m!111069 () Bool)

(assert (=> b!100474 m!111069))

(declare-fun m!111071 () Bool)

(assert (=> b!100474 m!111071))

(assert (=> b!100474 m!111069))

(assert (=> b!100474 m!111069))

(declare-fun m!111073 () Bool)

(assert (=> b!100474 m!111073))

(assert (=> b!100474 m!111069))

(declare-fun m!111075 () Bool)

(assert (=> b!100474 m!111075))

(declare-fun m!111077 () Bool)

(assert (=> b!100476 m!111077))

(declare-fun m!111079 () Bool)

(assert (=> b!100489 m!111079))

(declare-fun m!111081 () Bool)

(assert (=> b!100478 m!111081))

(declare-fun m!111083 () Bool)

(assert (=> start!11950 m!111083))

(declare-fun m!111085 () Bool)

(assert (=> b!100481 m!111085))

(declare-fun m!111087 () Bool)

(assert (=> b!100481 m!111087))

(assert (=> b!100485 m!111069))

(declare-fun m!111089 () Bool)

(assert (=> b!100485 m!111089))

(declare-fun m!111091 () Bool)

(assert (=> b!100485 m!111091))

(declare-fun m!111093 () Bool)

(assert (=> mapNonEmpty!3792 m!111093))

(declare-fun m!111095 () Bool)

(assert (=> b!100473 m!111095))

(declare-fun m!111097 () Bool)

(assert (=> b!100473 m!111097))

(declare-fun m!111099 () Bool)

(assert (=> b!100473 m!111099))

(assert (=> b!100473 m!111069))

(assert (=> b!100473 m!111069))

(declare-fun m!111101 () Bool)

(assert (=> b!100473 m!111101))

(assert (=> b!100473 m!111097))

(assert (=> b!100473 m!111069))

(assert (=> b!100473 m!111099))

(declare-fun m!111103 () Bool)

(assert (=> b!100473 m!111103))

(assert (=> b!100473 m!111095))

(declare-fun m!111105 () Bool)

(assert (=> mapNonEmpty!3791 m!111105))

(declare-fun m!111107 () Bool)

(assert (=> b!100484 m!111107))

(declare-fun m!111109 () Bool)

(assert (=> b!100484 m!111109))

(check-sat (not b_lambda!4497) (not mapNonEmpty!3791) b_and!6179 (not b!100473) b_and!6177 (not b!100489) (not b!100478) (not b!100484) (not b_next!2449) (not b!100481) (not b!100485) (not b!100474) tp_is_empty!2641 (not start!11950) (not b!100476) (not b_next!2451) (not mapNonEmpty!3792))
(check-sat b_and!6177 b_and!6179 (not b_next!2449) (not b_next!2451))
(get-model)

(declare-fun b_lambda!4503 () Bool)

(assert (= b_lambda!4497 (or (and b!100481 b_free!2449) (and b!100484 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))))) b_lambda!4503)))

(check-sat (not mapNonEmpty!3791) b_and!6179 (not b!100473) b_and!6177 (not b!100489) (not b!100478) (not b!100484) (not b_next!2449) (not b!100481) (not b!100485) (not b!100474) tp_is_empty!2641 (not start!11950) (not b!100476) (not b_lambda!4503) (not b_next!2451) (not mapNonEmpty!3792))
(check-sat b_and!6177 b_and!6179 (not b_next!2449) (not b_next!2451))
(get-model)

(declare-fun d!27233 () Bool)

(assert (=> d!27233 (= (array_inv!1263 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvsge (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!100481 d!27233))

(declare-fun d!27235 () Bool)

(assert (=> d!27235 (= (array_inv!1264 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvsge (size!2268 (_values!2505 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!100481 d!27235))

(declare-fun d!27237 () Bool)

(assert (=> d!27237 (= (validMask!0 (mask!6638 (v!2823 (underlying!337 thiss!992)))) (and (or (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000001111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000011111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000001111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000011111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000001111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000011111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000001111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000011111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000000111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000001111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000011111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000000111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000001111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000011111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000000111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000001111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000011111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000000111111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000001111111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000011111111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00000111111111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00001111111111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00011111111111111111111111111111) (= (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6638 (v!2823 (underlying!337 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!100476 d!27237))

(declare-fun d!27239 () Bool)

(declare-fun res!50454 () Bool)

(declare-fun e!65536 () Bool)

(assert (=> d!27239 (=> (not res!50454) (not e!65536))))

(declare-fun simpleValid!70 (LongMapFixedSize!862) Bool)

(assert (=> d!27239 (= res!50454 (simpleValid!70 newMap!16))))

(assert (=> d!27239 (= (valid!399 newMap!16) e!65536)))

(declare-fun b!100624 () Bool)

(declare-fun res!50455 () Bool)

(assert (=> b!100624 (=> (not res!50455) (not e!65536))))

(declare-fun arrayCountValidKeys!0 (array!4245 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!100624 (= res!50455 (= (arrayCountValidKeys!0 (_keys!4219 newMap!16) #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) (_size!480 newMap!16)))))

(declare-fun b!100625 () Bool)

(declare-fun res!50456 () Bool)

(assert (=> b!100625 (=> (not res!50456) (not e!65536))))

(assert (=> b!100625 (= res!50456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun b!100626 () Bool)

(assert (=> b!100626 (= e!65536 (arrayNoDuplicates!0 (_keys!4219 newMap!16) #b00000000000000000000000000000000 Nil!1591))))

(assert (= (and d!27239 res!50454) b!100624))

(assert (= (and b!100624 res!50455) b!100625))

(assert (= (and b!100625 res!50456) b!100626))

(declare-fun m!111203 () Bool)

(assert (=> d!27239 m!111203))

(declare-fun m!111205 () Bool)

(assert (=> b!100624 m!111205))

(declare-fun m!111207 () Bool)

(assert (=> b!100625 m!111207))

(declare-fun m!111209 () Bool)

(assert (=> b!100626 m!111209))

(assert (=> b!100489 d!27239))

(declare-fun d!27241 () Bool)

(assert (=> d!27241 (= (map!1250 newMap!16) (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun bs!4159 () Bool)

(assert (= bs!4159 d!27241))

(declare-fun m!111211 () Bool)

(assert (=> bs!4159 m!111211))

(assert (=> b!100485 d!27241))

(declare-fun b!100669 () Bool)

(declare-fun e!65565 () ListLongMap!1519)

(declare-fun call!10366 () ListLongMap!1519)

(assert (=> b!100669 (= e!65565 call!10366)))

(declare-fun b!100670 () Bool)

(declare-fun e!65567 () Bool)

(declare-fun lt!50874 () ListLongMap!1519)

(declare-fun apply!94 (ListLongMap!1519 (_ BitVec 64)) V!3169)

(assert (=> b!100670 (= e!65567 (= (apply!94 lt!50874 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!100671 () Bool)

(declare-fun e!65564 () Bool)

(declare-fun call!10364 () Bool)

(assert (=> b!100671 (= e!65564 (not call!10364))))

(declare-fun bm!10358 () Bool)

(declare-fun call!10361 () ListLongMap!1519)

(declare-fun call!10362 () ListLongMap!1519)

(assert (=> bm!10358 (= call!10361 call!10362)))

(declare-fun b!100672 () Bool)

(declare-fun e!65570 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!100672 (= e!65570 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun call!10365 () ListLongMap!1519)

(declare-fun c!17264 () Bool)

(declare-fun c!17269 () Bool)

(declare-fun bm!10359 () Bool)

(declare-fun call!10363 () ListLongMap!1519)

(declare-fun +!130 (ListLongMap!1519 tuple2!2338) ListLongMap!1519)

(assert (=> bm!10359 (= call!10363 (+!130 (ite c!17269 call!10365 (ite c!17264 call!10362 call!10361)) (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun e!65573 () Bool)

(declare-fun b!100673 () Bool)

(assert (=> b!100673 (= e!65573 (= (apply!94 lt!50874 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100673 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2268 (_values!2505 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> b!100673 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!100674 () Bool)

(declare-fun e!65571 () Bool)

(declare-fun e!65569 () Bool)

(assert (=> b!100674 (= e!65571 e!65569)))

(declare-fun res!50478 () Bool)

(declare-fun call!10367 () Bool)

(assert (=> b!100674 (= res!50478 call!10367)))

(assert (=> b!100674 (=> (not res!50478) (not e!65569))))

(declare-fun b!100675 () Bool)

(declare-fun e!65568 () Bool)

(assert (=> b!100675 (= e!65568 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!100676 () Bool)

(declare-fun e!65574 () Bool)

(assert (=> b!100676 (= e!65574 e!65564)))

(declare-fun c!17265 () Bool)

(assert (=> b!100676 (= c!17265 (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10360 () Bool)

(assert (=> bm!10360 (= call!10366 call!10363)))

(declare-fun b!100677 () Bool)

(declare-fun e!65575 () ListLongMap!1519)

(assert (=> b!100677 (= e!65575 call!10366)))

(declare-fun bm!10361 () Bool)

(assert (=> bm!10361 (= call!10367 (contains!802 lt!50874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100678 () Bool)

(declare-fun e!65572 () Unit!3061)

(declare-fun lt!50865 () Unit!3061)

(assert (=> b!100678 (= e!65572 lt!50865)))

(declare-fun lt!50861 () ListLongMap!1519)

(declare-fun getCurrentListMapNoExtraKeys!94 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) ListLongMap!1519)

(assert (=> b!100678 (= lt!50861 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun lt!50854 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50866 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50866 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50872 () Unit!3061)

(declare-fun addStillContains!70 (ListLongMap!1519 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3061)

(assert (=> b!100678 (= lt!50872 (addStillContains!70 lt!50861 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50866))))

(assert (=> b!100678 (contains!802 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50866)))

(declare-fun lt!50868 () Unit!3061)

(assert (=> b!100678 (= lt!50868 lt!50872)))

(declare-fun lt!50869 () ListLongMap!1519)

(assert (=> b!100678 (= lt!50869 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun lt!50870 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50870 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50871 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50871 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50856 () Unit!3061)

(declare-fun addApplyDifferent!70 (ListLongMap!1519 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3061)

(assert (=> b!100678 (= lt!50856 (addApplyDifferent!70 lt!50869 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50871))))

(assert (=> b!100678 (= (apply!94 (+!130 lt!50869 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50871) (apply!94 lt!50869 lt!50871))))

(declare-fun lt!50857 () Unit!3061)

(assert (=> b!100678 (= lt!50857 lt!50856)))

(declare-fun lt!50853 () ListLongMap!1519)

(assert (=> b!100678 (= lt!50853 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun lt!50858 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50862 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50862 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50863 () Unit!3061)

(assert (=> b!100678 (= lt!50863 (addApplyDifferent!70 lt!50853 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50862))))

(assert (=> b!100678 (= (apply!94 (+!130 lt!50853 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50862) (apply!94 lt!50853 lt!50862))))

(declare-fun lt!50873 () Unit!3061)

(assert (=> b!100678 (= lt!50873 lt!50863)))

(declare-fun lt!50864 () ListLongMap!1519)

(assert (=> b!100678 (= lt!50864 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun lt!50859 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50859 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50860 () (_ BitVec 64))

(assert (=> b!100678 (= lt!50860 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!100678 (= lt!50865 (addApplyDifferent!70 lt!50864 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50860))))

(assert (=> b!100678 (= (apply!94 (+!130 lt!50864 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50860) (apply!94 lt!50864 lt!50860))))

(declare-fun d!27243 () Bool)

(assert (=> d!27243 e!65574))

(declare-fun res!50482 () Bool)

(assert (=> d!27243 (=> (not res!50482) (not e!65574))))

(assert (=> d!27243 (= res!50482 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun lt!50867 () ListLongMap!1519)

(assert (=> d!27243 (= lt!50874 lt!50867)))

(declare-fun lt!50855 () Unit!3061)

(assert (=> d!27243 (= lt!50855 e!65572)))

(declare-fun c!17266 () Bool)

(assert (=> d!27243 (= c!17266 e!65568)))

(declare-fun res!50483 () Bool)

(assert (=> d!27243 (=> (not res!50483) (not e!65568))))

(assert (=> d!27243 (= res!50483 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun e!65563 () ListLongMap!1519)

(assert (=> d!27243 (= lt!50867 e!65563)))

(assert (=> d!27243 (= c!17269 (and (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27243 (validMask!0 (mask!6638 (v!2823 (underlying!337 thiss!992))))))

(assert (=> d!27243 (= (getCurrentListMap!456 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))) lt!50874)))

(declare-fun b!100679 () Bool)

(declare-fun Unit!3073 () Unit!3061)

(assert (=> b!100679 (= e!65572 Unit!3073)))

(declare-fun b!100680 () Bool)

(assert (=> b!100680 (= e!65571 (not call!10367))))

(declare-fun b!100681 () Bool)

(assert (=> b!100681 (= e!65575 call!10361)))

(declare-fun bm!10362 () Bool)

(assert (=> bm!10362 (= call!10365 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!100682 () Bool)

(assert (=> b!100682 (= e!65563 (+!130 call!10363 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun bm!10363 () Bool)

(assert (=> bm!10363 (= call!10364 (contains!802 lt!50874 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100683 () Bool)

(assert (=> b!100683 (= e!65569 (= (apply!94 lt!50874 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!100684 () Bool)

(declare-fun c!17267 () Bool)

(assert (=> b!100684 (= c!17267 (and (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!100684 (= e!65565 e!65575)))

(declare-fun b!100685 () Bool)

(declare-fun res!50476 () Bool)

(assert (=> b!100685 (=> (not res!50476) (not e!65574))))

(assert (=> b!100685 (= res!50476 e!65571)))

(declare-fun c!17268 () Bool)

(assert (=> b!100685 (= c!17268 (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!100686 () Bool)

(assert (=> b!100686 (= e!65563 e!65565)))

(assert (=> b!100686 (= c!17264 (and (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!100687 () Bool)

(declare-fun res!50477 () Bool)

(assert (=> b!100687 (=> (not res!50477) (not e!65574))))

(declare-fun e!65566 () Bool)

(assert (=> b!100687 (= res!50477 e!65566)))

(declare-fun res!50480 () Bool)

(assert (=> b!100687 (=> res!50480 e!65566)))

(assert (=> b!100687 (= res!50480 (not e!65570))))

(declare-fun res!50475 () Bool)

(assert (=> b!100687 (=> (not res!50475) (not e!65570))))

(assert (=> b!100687 (= res!50475 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun bm!10364 () Bool)

(assert (=> bm!10364 (= call!10362 call!10365)))

(declare-fun b!100688 () Bool)

(assert (=> b!100688 (= e!65564 e!65567)))

(declare-fun res!50479 () Bool)

(assert (=> b!100688 (= res!50479 call!10364)))

(assert (=> b!100688 (=> (not res!50479) (not e!65567))))

(declare-fun b!100689 () Bool)

(assert (=> b!100689 (= e!65566 e!65573)))

(declare-fun res!50481 () Bool)

(assert (=> b!100689 (=> (not res!50481) (not e!65573))))

(assert (=> b!100689 (= res!50481 (contains!802 lt!50874 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!100689 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27243 c!17269) b!100682))

(assert (= (and d!27243 (not c!17269)) b!100686))

(assert (= (and b!100686 c!17264) b!100669))

(assert (= (and b!100686 (not c!17264)) b!100684))

(assert (= (and b!100684 c!17267) b!100677))

(assert (= (and b!100684 (not c!17267)) b!100681))

(assert (= (or b!100677 b!100681) bm!10358))

(assert (= (or b!100669 bm!10358) bm!10364))

(assert (= (or b!100669 b!100677) bm!10360))

(assert (= (or b!100682 bm!10364) bm!10362))

(assert (= (or b!100682 bm!10360) bm!10359))

(assert (= (and d!27243 res!50483) b!100675))

(assert (= (and d!27243 c!17266) b!100678))

(assert (= (and d!27243 (not c!17266)) b!100679))

(assert (= (and d!27243 res!50482) b!100687))

(assert (= (and b!100687 res!50475) b!100672))

(assert (= (and b!100687 (not res!50480)) b!100689))

(assert (= (and b!100689 res!50481) b!100673))

(assert (= (and b!100687 res!50477) b!100685))

(assert (= (and b!100685 c!17268) b!100674))

(assert (= (and b!100685 (not c!17268)) b!100680))

(assert (= (and b!100674 res!50478) b!100683))

(assert (= (or b!100674 b!100680) bm!10361))

(assert (= (and b!100685 res!50476) b!100676))

(assert (= (and b!100676 c!17265) b!100688))

(assert (= (and b!100676 (not c!17265)) b!100671))

(assert (= (and b!100688 res!50479) b!100670))

(assert (= (or b!100688 b!100671) bm!10363))

(declare-fun b_lambda!4505 () Bool)

(assert (=> (not b_lambda!4505) (not b!100673)))

(assert (=> b!100673 t!5575))

(declare-fun b_and!6197 () Bool)

(assert (= b_and!6177 (and (=> t!5575 result!3307) b_and!6197)))

(assert (=> b!100673 t!5577))

(declare-fun b_and!6199 () Bool)

(assert (= b_and!6179 (and (=> t!5577 result!3311) b_and!6199)))

(declare-fun m!111213 () Bool)

(assert (=> bm!10362 m!111213))

(declare-fun m!111215 () Bool)

(assert (=> bm!10359 m!111215))

(declare-fun m!111217 () Bool)

(assert (=> b!100675 m!111217))

(assert (=> b!100675 m!111217))

(declare-fun m!111219 () Bool)

(assert (=> b!100675 m!111219))

(declare-fun m!111221 () Bool)

(assert (=> b!100682 m!111221))

(declare-fun m!111223 () Bool)

(assert (=> b!100683 m!111223))

(assert (=> b!100672 m!111217))

(assert (=> b!100672 m!111217))

(assert (=> b!100672 m!111219))

(assert (=> d!27243 m!111077))

(declare-fun m!111225 () Bool)

(assert (=> b!100670 m!111225))

(declare-fun m!111227 () Bool)

(assert (=> bm!10361 m!111227))

(assert (=> b!100678 m!111213))

(declare-fun m!111229 () Bool)

(assert (=> b!100678 m!111229))

(assert (=> b!100678 m!111217))

(declare-fun m!111231 () Bool)

(assert (=> b!100678 m!111231))

(declare-fun m!111233 () Bool)

(assert (=> b!100678 m!111233))

(declare-fun m!111235 () Bool)

(assert (=> b!100678 m!111235))

(declare-fun m!111237 () Bool)

(assert (=> b!100678 m!111237))

(declare-fun m!111239 () Bool)

(assert (=> b!100678 m!111239))

(declare-fun m!111241 () Bool)

(assert (=> b!100678 m!111241))

(declare-fun m!111243 () Bool)

(assert (=> b!100678 m!111243))

(assert (=> b!100678 m!111229))

(declare-fun m!111245 () Bool)

(assert (=> b!100678 m!111245))

(declare-fun m!111247 () Bool)

(assert (=> b!100678 m!111247))

(declare-fun m!111249 () Bool)

(assert (=> b!100678 m!111249))

(declare-fun m!111251 () Bool)

(assert (=> b!100678 m!111251))

(assert (=> b!100678 m!111241))

(assert (=> b!100678 m!111249))

(declare-fun m!111253 () Bool)

(assert (=> b!100678 m!111253))

(declare-fun m!111255 () Bool)

(assert (=> b!100678 m!111255))

(declare-fun m!111257 () Bool)

(assert (=> b!100678 m!111257))

(assert (=> b!100678 m!111235))

(declare-fun m!111259 () Bool)

(assert (=> bm!10363 m!111259))

(assert (=> b!100673 m!111217))

(declare-fun m!111261 () Bool)

(assert (=> b!100673 m!111261))

(assert (=> b!100673 m!111097))

(assert (=> b!100673 m!111217))

(declare-fun m!111263 () Bool)

(assert (=> b!100673 m!111263))

(assert (=> b!100673 m!111263))

(assert (=> b!100673 m!111097))

(declare-fun m!111265 () Bool)

(assert (=> b!100673 m!111265))

(assert (=> b!100689 m!111217))

(assert (=> b!100689 m!111217))

(declare-fun m!111267 () Bool)

(assert (=> b!100689 m!111267))

(assert (=> b!100485 d!27243))

(declare-fun d!27245 () Bool)

(assert (=> d!27245 (not (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50877 () Unit!3061)

(declare-fun choose!68 (array!4245 (_ BitVec 32) (_ BitVec 64) List!1594) Unit!3061)

(assert (=> d!27245 (= lt!50877 (choose!68 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591)))))

(assert (=> d!27245 (bvslt (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27245 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591)) lt!50877)))

(declare-fun bs!4160 () Bool)

(assert (= bs!4160 d!27245))

(assert (=> bs!4160 m!111069))

(assert (=> bs!4160 m!111073))

(assert (=> bs!4160 m!111069))

(declare-fun m!111269 () Bool)

(assert (=> bs!4160 m!111269))

(assert (=> b!100474 d!27245))

(declare-fun d!27247 () Bool)

(assert (=> d!27247 (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) from!355 Nil!1591)))

(declare-fun lt!50880 () Unit!3061)

(declare-fun choose!39 (array!4245 (_ BitVec 32) (_ BitVec 32)) Unit!3061)

(assert (=> d!27247 (= lt!50880 (choose!39 (_keys!4219 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27247 (bvslt (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27247 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000 from!355) lt!50880)))

(declare-fun bs!4161 () Bool)

(assert (= bs!4161 d!27247))

(assert (=> bs!4161 m!111067))

(declare-fun m!111271 () Bool)

(assert (=> bs!4161 m!111271))

(assert (=> b!100474 d!27247))

(declare-fun d!27249 () Bool)

(declare-fun res!50488 () Bool)

(declare-fun e!65580 () Bool)

(assert (=> d!27249 (=> res!50488 e!65580)))

(assert (=> d!27249 (= res!50488 (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27249 (= (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!65580)))

(declare-fun b!100694 () Bool)

(declare-fun e!65581 () Bool)

(assert (=> b!100694 (= e!65580 e!65581)))

(declare-fun res!50489 () Bool)

(assert (=> b!100694 (=> (not res!50489) (not e!65581))))

(assert (=> b!100694 (= res!50489 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!100695 () Bool)

(assert (=> b!100695 (= e!65581 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27249 (not res!50488)) b!100694))

(assert (= (and b!100694 res!50489) b!100695))

(assert (=> d!27249 m!111217))

(assert (=> b!100695 m!111069))

(declare-fun m!111273 () Bool)

(assert (=> b!100695 m!111273))

(assert (=> b!100474 d!27249))

(declare-fun d!27251 () Bool)

(declare-fun e!65584 () Bool)

(assert (=> d!27251 e!65584))

(declare-fun c!17272 () Bool)

(assert (=> d!27251 (= c!17272 (and (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!50883 () Unit!3061)

(declare-fun choose!622 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) (_ BitVec 32) Int) Unit!3061)

(assert (=> d!27251 (= lt!50883 (choose!622 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(assert (=> d!27251 (validMask!0 (mask!6638 (v!2823 (underlying!337 thiss!992))))))

(assert (=> d!27251 (= (lemmaListMapContainsThenArrayContainsFrom!99 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))) lt!50883)))

(declare-fun b!100700 () Bool)

(assert (=> b!100700 (= e!65584 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!100701 () Bool)

(assert (=> b!100701 (= e!65584 (ite (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27251 c!17272) b!100700))

(assert (= (and d!27251 (not c!17272)) b!100701))

(assert (=> d!27251 m!111069))

(declare-fun m!111275 () Bool)

(assert (=> d!27251 m!111275))

(assert (=> d!27251 m!111077))

(assert (=> b!100700 m!111069))

(assert (=> b!100700 m!111073))

(assert (=> b!100474 d!27251))

(declare-fun d!27253 () Bool)

(declare-fun res!50497 () Bool)

(declare-fun e!65593 () Bool)

(assert (=> d!27253 (=> res!50497 e!65593)))

(assert (=> d!27253 (= res!50497 (bvsge from!355 (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> d!27253 (= (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) from!355 Nil!1591) e!65593)))

(declare-fun b!100712 () Bool)

(declare-fun e!65596 () Bool)

(declare-fun call!10370 () Bool)

(assert (=> b!100712 (= e!65596 call!10370)))

(declare-fun c!17275 () Bool)

(declare-fun bm!10367 () Bool)

(assert (=> bm!10367 (= call!10370 (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17275 (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591) Nil!1591)))))

(declare-fun b!100713 () Bool)

(assert (=> b!100713 (= e!65596 call!10370)))

(declare-fun b!100714 () Bool)

(declare-fun e!65595 () Bool)

(declare-fun contains!805 (List!1594 (_ BitVec 64)) Bool)

(assert (=> b!100714 (= e!65595 (contains!805 Nil!1591 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!100715 () Bool)

(declare-fun e!65594 () Bool)

(assert (=> b!100715 (= e!65593 e!65594)))

(declare-fun res!50498 () Bool)

(assert (=> b!100715 (=> (not res!50498) (not e!65594))))

(assert (=> b!100715 (= res!50498 (not e!65595))))

(declare-fun res!50496 () Bool)

(assert (=> b!100715 (=> (not res!50496) (not e!65595))))

(assert (=> b!100715 (= res!50496 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!100716 () Bool)

(assert (=> b!100716 (= e!65594 e!65596)))

(assert (=> b!100716 (= c!17275 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (= (and d!27253 (not res!50497)) b!100715))

(assert (= (and b!100715 res!50496) b!100714))

(assert (= (and b!100715 res!50498) b!100716))

(assert (= (and b!100716 c!17275) b!100712))

(assert (= (and b!100716 (not c!17275)) b!100713))

(assert (= (or b!100712 b!100713) bm!10367))

(assert (=> bm!10367 m!111069))

(declare-fun m!111277 () Bool)

(assert (=> bm!10367 m!111277))

(assert (=> b!100714 m!111069))

(assert (=> b!100714 m!111069))

(declare-fun m!111279 () Bool)

(assert (=> b!100714 m!111279))

(assert (=> b!100715 m!111069))

(assert (=> b!100715 m!111069))

(declare-fun m!111281 () Bool)

(assert (=> b!100715 m!111281))

(assert (=> b!100716 m!111069))

(assert (=> b!100716 m!111069))

(assert (=> b!100716 m!111281))

(assert (=> b!100474 d!27253))

(declare-fun d!27255 () Bool)

(declare-fun e!65602 () Bool)

(assert (=> d!27255 e!65602))

(declare-fun res!50501 () Bool)

(assert (=> d!27255 (=> res!50501 e!65602)))

(declare-fun lt!50895 () Bool)

(assert (=> d!27255 (= res!50501 (not lt!50895))))

(declare-fun lt!50892 () Bool)

(assert (=> d!27255 (= lt!50895 lt!50892)))

(declare-fun lt!50894 () Unit!3061)

(declare-fun e!65601 () Unit!3061)

(assert (=> d!27255 (= lt!50894 e!65601)))

(declare-fun c!17278 () Bool)

(assert (=> d!27255 (= c!17278 lt!50892)))

(declare-fun containsKey!154 (List!1593 (_ BitVec 64)) Bool)

(assert (=> d!27255 (= lt!50892 (containsKey!154 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27255 (= (contains!802 lt!50764 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) lt!50895)))

(declare-fun b!100723 () Bool)

(declare-fun lt!50893 () Unit!3061)

(assert (=> b!100723 (= e!65601 lt!50893)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!103 (List!1593 (_ BitVec 64)) Unit!3061)

(assert (=> b!100723 (= lt!50893 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-datatypes ((Option!156 0))(
  ( (Some!155 (v!2829 V!3169)) (None!154) )
))
(declare-fun isDefined!104 (Option!156) Bool)

(declare-fun getValueByKey!150 (List!1593 (_ BitVec 64)) Option!156)

(assert (=> b!100723 (isDefined!104 (getValueByKey!150 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!100724 () Bool)

(declare-fun Unit!3074 () Unit!3061)

(assert (=> b!100724 (= e!65601 Unit!3074)))

(declare-fun b!100725 () Bool)

(assert (=> b!100725 (= e!65602 (isDefined!104 (getValueByKey!150 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(assert (= (and d!27255 c!17278) b!100723))

(assert (= (and d!27255 (not c!17278)) b!100724))

(assert (= (and d!27255 (not res!50501)) b!100725))

(assert (=> d!27255 m!111069))

(declare-fun m!111283 () Bool)

(assert (=> d!27255 m!111283))

(assert (=> b!100723 m!111069))

(declare-fun m!111285 () Bool)

(assert (=> b!100723 m!111285))

(assert (=> b!100723 m!111069))

(declare-fun m!111287 () Bool)

(assert (=> b!100723 m!111287))

(assert (=> b!100723 m!111287))

(declare-fun m!111289 () Bool)

(assert (=> b!100723 m!111289))

(assert (=> b!100725 m!111069))

(assert (=> b!100725 m!111287))

(assert (=> b!100725 m!111287))

(assert (=> b!100725 m!111289))

(assert (=> b!100473 d!27255))

(declare-fun bm!10416 () Bool)

(declare-fun call!10426 () Bool)

(declare-fun call!10427 () Bool)

(assert (=> bm!10416 (= call!10426 call!10427)))

(declare-fun b!100810 () Bool)

(declare-fun lt!50962 () Unit!3061)

(declare-fun lt!50961 () Unit!3061)

(assert (=> b!100810 (= lt!50962 lt!50961)))

(declare-fun call!10419 () ListLongMap!1519)

(declare-fun call!10423 () ListLongMap!1519)

(assert (=> b!100810 (= call!10419 call!10423)))

(declare-fun lt!50966 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!43 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3061)

(assert (=> b!100810 (= lt!50961 (lemmaChangeZeroKeyThenAddPairToListMap!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) lt!50966 (zeroValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (defaultEntry!2522 newMap!16)))))

(assert (=> b!100810 (= lt!50966 (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!65664 () tuple2!2336)

(assert (=> b!100810 (= e!65664 (tuple2!2337 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6638 newMap!16) (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (_size!480 newMap!16) (_keys!4219 newMap!16) (_values!2505 newMap!16) (_vacant!480 newMap!16))))))

(declare-fun bm!10417 () Bool)

(declare-fun call!10440 () Bool)

(declare-fun call!10430 () Bool)

(assert (=> bm!10417 (= call!10440 call!10430)))

(declare-fun call!10437 () Bool)

(declare-fun c!17313 () Bool)

(declare-datatypes ((SeekEntryResult!258 0))(
  ( (MissingZero!258 (index!3177 (_ BitVec 32))) (Found!258 (index!3178 (_ BitVec 32))) (Intermediate!258 (undefined!1070 Bool) (index!3179 (_ BitVec 32)) (x!13251 (_ BitVec 32))) (Undefined!258) (MissingVacant!258 (index!3180 (_ BitVec 32))) )
))
(declare-fun lt!50971 () SeekEntryResult!258)

(declare-fun c!17311 () Bool)

(declare-fun c!17315 () Bool)

(declare-fun c!17310 () Bool)

(declare-fun bm!10418 () Bool)

(declare-fun lt!50955 () SeekEntryResult!258)

(declare-fun lt!50951 () SeekEntryResult!258)

(declare-fun lt!50957 () SeekEntryResult!258)

(declare-fun c!17319 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10418 (= call!10437 (inRange!0 (ite c!17310 (ite c!17319 (index!3178 lt!50971) (ite c!17313 (index!3177 lt!50955) (index!3180 lt!50955))) (ite c!17315 (index!3178 lt!50951) (ite c!17311 (index!3177 lt!50957) (index!3180 lt!50957)))) (mask!6638 newMap!16)))))

(declare-fun b!100811 () Bool)

(declare-fun e!65647 () Bool)

(declare-fun call!10422 () Bool)

(assert (=> b!100811 (= e!65647 (not call!10422))))

(declare-fun bm!10419 () Bool)

(declare-fun call!10433 () ListLongMap!1519)

(declare-fun call!10439 () ListLongMap!1519)

(assert (=> bm!10419 (= call!10433 call!10439)))

(declare-fun b!100812 () Bool)

(declare-fun e!65656 () Unit!3061)

(declare-fun lt!50970 () Unit!3061)

(assert (=> b!100812 (= e!65656 lt!50970)))

(declare-fun call!10432 () Unit!3061)

(assert (=> b!100812 (= lt!50970 call!10432)))

(declare-fun call!10441 () SeekEntryResult!258)

(assert (=> b!100812 (= lt!50951 call!10441)))

(declare-fun res!50541 () Bool)

(assert (=> b!100812 (= res!50541 ((_ is Found!258) lt!50951))))

(declare-fun e!65663 () Bool)

(assert (=> b!100812 (=> (not res!50541) (not e!65663))))

(assert (=> b!100812 e!65663))

(declare-fun b!100813 () Bool)

(declare-fun c!17312 () Bool)

(assert (=> b!100813 (= c!17312 ((_ is MissingVacant!258) lt!50957))))

(declare-fun e!65652 () Bool)

(declare-fun e!65665 () Bool)

(assert (=> b!100813 (= e!65652 e!65665)))

(declare-fun b!100814 () Bool)

(declare-fun e!65668 () tuple2!2336)

(declare-fun e!65650 () tuple2!2336)

(assert (=> b!100814 (= e!65668 e!65650)))

(declare-fun c!17309 () Bool)

(declare-fun lt!50972 () SeekEntryResult!258)

(assert (=> b!100814 (= c!17309 ((_ is MissingZero!258) lt!50972))))

(declare-fun b!100815 () Bool)

(declare-fun lt!50964 () tuple2!2336)

(assert (=> b!100815 (= e!65668 (tuple2!2337 (_1!1179 lt!50964) (_2!1179 lt!50964)))))

(declare-fun call!10429 () tuple2!2336)

(assert (=> b!100815 (= lt!50964 call!10429)))

(declare-fun bm!10420 () Bool)

(declare-fun call!10434 () ListLongMap!1519)

(assert (=> bm!10420 (= call!10434 call!10439)))

(declare-fun b!100816 () Bool)

(declare-fun lt!50974 () Unit!3061)

(declare-fun lt!50959 () Unit!3061)

(assert (=> b!100816 (= lt!50974 lt!50959)))

(assert (=> b!100816 (= call!10419 call!10423)))

(declare-fun lt!50950 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3061)

(assert (=> b!100816 (= lt!50959 (lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) lt!50950 (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(assert (=> b!100816 (= lt!50950 (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!100816 (= e!65664 (tuple2!2337 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6638 newMap!16) (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) (zeroValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!480 newMap!16) (_keys!4219 newMap!16) (_values!2505 newMap!16) (_vacant!480 newMap!16))))))

(declare-fun b!100817 () Bool)

(declare-fun lt!50958 () Unit!3061)

(declare-fun lt!50969 () Unit!3061)

(assert (=> b!100817 (= lt!50958 lt!50969)))

(declare-fun call!10420 () Bool)

(assert (=> b!100817 call!10420))

(declare-fun lt!50968 () array!4247)

(declare-fun lemmaValidKeyInArrayIsInListMap!102 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) Unit!3061)

(assert (=> b!100817 (= lt!50969 (lemmaValidKeyInArrayIsInListMap!102 (_keys!4219 newMap!16) lt!50968 (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3178 lt!50972) (defaultEntry!2522 newMap!16)))))

(assert (=> b!100817 (= lt!50968 (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))))))

(declare-fun lt!50963 () Unit!3061)

(declare-fun lt!50975 () Unit!3061)

(assert (=> b!100817 (= lt!50963 lt!50975)))

(declare-fun call!10436 () ListLongMap!1519)

(assert (=> b!100817 (= call!10436 call!10434)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) (_ BitVec 64) V!3169 Int) Unit!3061)

(assert (=> b!100817 (= lt!50975 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3178 lt!50972) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(declare-fun lt!50967 () Unit!3061)

(assert (=> b!100817 (= lt!50967 e!65656)))

(assert (=> b!100817 (= c!17315 (contains!802 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> b!100817 (= e!65650 (tuple2!2337 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (_size!480 newMap!16) (_keys!4219 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))) (_vacant!480 newMap!16))))))

(declare-fun b!100818 () Bool)

(declare-fun e!65660 () ListLongMap!1519)

(assert (=> b!100818 (= e!65660 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun bm!10421 () Bool)

(assert (=> bm!10421 (= call!10419 call!10436)))

(declare-fun bm!10422 () Bool)

(assert (=> bm!10422 (= call!10430 call!10437)))

(declare-fun bm!10423 () Bool)

(declare-fun call!10435 () SeekEntryResult!258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4245 (_ BitVec 32)) SeekEntryResult!258)

(assert (=> bm!10423 (= call!10435 (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun b!100819 () Bool)

(assert (=> b!100819 (= e!65665 ((_ is Undefined!258) lt!50957))))

(declare-fun bm!10424 () Bool)

(declare-fun call!10431 () Bool)

(assert (=> bm!10424 (= call!10431 call!10437)))

(declare-fun b!100820 () Bool)

(declare-fun Unit!3075 () Unit!3061)

(assert (=> b!100820 (= e!65656 Unit!3075)))

(declare-fun lt!50973 () Unit!3061)

(declare-fun call!10442 () Unit!3061)

(assert (=> b!100820 (= lt!50973 call!10442)))

(assert (=> b!100820 (= lt!50957 call!10441)))

(assert (=> b!100820 (= c!17311 ((_ is MissingZero!258) lt!50957))))

(assert (=> b!100820 e!65652))

(declare-fun lt!50953 () Unit!3061)

(assert (=> b!100820 (= lt!50953 lt!50973)))

(assert (=> b!100820 false))

(declare-fun call!10424 () ListLongMap!1519)

(declare-fun b!100821 () Bool)

(declare-fun e!65654 () Bool)

(declare-fun call!10421 () ListLongMap!1519)

(assert (=> b!100821 (= e!65654 (= call!10421 (+!130 call!10424 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!100822 () Bool)

(declare-fun e!65659 () Bool)

(assert (=> b!100822 (= e!65659 (not call!10422))))

(declare-fun bm!10425 () Bool)

(assert (=> bm!10425 (= call!10424 (map!1250 newMap!16))))

(declare-fun b!100823 () Bool)

(assert (=> b!100823 (= e!65660 call!10433)))

(declare-fun bm!10426 () Bool)

(assert (=> bm!10426 (= call!10441 call!10435)))

(declare-fun c!17308 () Bool)

(declare-fun bm!10427 () Bool)

(assert (=> bm!10427 (= call!10439 (getCurrentListMap!456 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!100824 () Bool)

(declare-fun lt!50952 () Unit!3061)

(declare-fun e!65657 () Unit!3061)

(assert (=> b!100824 (= lt!50952 e!65657)))

(assert (=> b!100824 (= c!17319 call!10420)))

(declare-fun e!65658 () tuple2!2336)

(assert (=> b!100824 (= e!65658 (tuple2!2337 false newMap!16))))

(declare-fun b!100825 () Bool)

(declare-fun e!65648 () ListLongMap!1519)

(declare-fun call!10425 () ListLongMap!1519)

(assert (=> b!100825 (= e!65648 call!10425)))

(declare-fun b!100826 () Bool)

(declare-fun res!50537 () Bool)

(declare-fun e!65651 () Bool)

(assert (=> b!100826 (=> (not res!50537) (not e!65651))))

(assert (=> b!100826 (= res!50537 call!10440)))

(declare-fun e!65661 () Bool)

(assert (=> b!100826 (= e!65661 e!65651)))

(declare-fun b!100827 () Bool)

(declare-fun res!50540 () Bool)

(assert (=> b!100827 (= res!50540 call!10431)))

(assert (=> b!100827 (=> (not res!50540) (not e!65663))))

(declare-fun b!100828 () Bool)

(declare-fun c!17307 () Bool)

(assert (=> b!100828 (= c!17307 ((_ is MissingVacant!258) lt!50955))))

(declare-fun e!65653 () Bool)

(assert (=> b!100828 (= e!65661 e!65653)))

(declare-fun b!100829 () Bool)

(declare-fun res!50531 () Bool)

(assert (=> b!100829 (= res!50531 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3180 lt!50957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100829 (=> (not res!50531) (not e!65659))))

(declare-fun b!100830 () Bool)

(declare-fun res!50543 () Bool)

(assert (=> b!100830 (= res!50543 call!10430)))

(declare-fun e!65667 () Bool)

(assert (=> b!100830 (=> (not res!50543) (not e!65667))))

(declare-fun bm!10428 () Bool)

(assert (=> bm!10428 (= call!10422 call!10427)))

(declare-fun bm!10429 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3061)

(assert (=> bm!10429 (= call!10432 (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(declare-fun b!100831 () Bool)

(declare-fun lt!50954 () Unit!3061)

(assert (=> b!100831 (= e!65657 lt!50954)))

(assert (=> b!100831 (= lt!50954 call!10442)))

(declare-fun call!10438 () SeekEntryResult!258)

(assert (=> b!100831 (= lt!50955 call!10438)))

(assert (=> b!100831 (= c!17313 ((_ is MissingZero!258) lt!50955))))

(assert (=> b!100831 e!65661))

(declare-fun bm!10430 () Bool)

(declare-fun c!17317 () Bool)

(assert (=> bm!10430 (= call!10425 (getCurrentListMap!456 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun bm!10431 () Bool)

(declare-fun lt!50956 () tuple2!2336)

(assert (=> bm!10431 (= call!10421 (map!1250 (_2!1179 lt!50956)))))

(declare-fun b!100832 () Bool)

(declare-fun e!65662 () tuple2!2336)

(assert (=> b!100832 (= e!65662 e!65658)))

(assert (=> b!100832 (= lt!50972 (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(assert (=> b!100832 (= c!17310 ((_ is Undefined!258) lt!50972))))

(declare-fun bm!10432 () Bool)

(assert (=> bm!10432 (= call!10438 call!10435)))

(declare-fun b!100833 () Bool)

(assert (=> b!100833 (= e!65665 e!65659)))

(declare-fun res!50532 () Bool)

(declare-fun call!10428 () Bool)

(assert (=> b!100833 (= res!50532 call!10428)))

(assert (=> b!100833 (=> (not res!50532) (not e!65659))))

(declare-fun b!100834 () Bool)

(declare-fun res!50534 () Bool)

(assert (=> b!100834 (=> (not res!50534) (not e!65647))))

(assert (=> b!100834 (= res!50534 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3177 lt!50957)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10433 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3061)

(assert (=> bm!10433 (= call!10442 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(declare-fun b!100835 () Bool)

(declare-fun res!50530 () Bool)

(assert (=> b!100835 (=> (not res!50530) (not e!65647))))

(assert (=> b!100835 (= res!50530 call!10428)))

(assert (=> b!100835 (= e!65652 e!65647)))

(declare-fun bm!10434 () Bool)

(assert (=> bm!10434 (= call!10427 (arrayContainsKey!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!100836 () Bool)

(assert (=> b!100836 (= e!65651 (not call!10426))))

(declare-fun b!100837 () Bool)

(declare-fun res!50538 () Bool)

(assert (=> b!100837 (=> (not res!50538) (not e!65651))))

(assert (=> b!100837 (= res!50538 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3177 lt!50955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100838 () Bool)

(declare-fun Unit!3076 () Unit!3061)

(assert (=> b!100838 (= e!65657 Unit!3076)))

(declare-fun lt!50960 () Unit!3061)

(assert (=> b!100838 (= lt!50960 call!10432)))

(assert (=> b!100838 (= lt!50971 call!10438)))

(declare-fun res!50533 () Bool)

(assert (=> b!100838 (= res!50533 ((_ is Found!258) lt!50971))))

(assert (=> b!100838 (=> (not res!50533) (not e!65667))))

(assert (=> b!100838 e!65667))

(declare-fun lt!50976 () Unit!3061)

(assert (=> b!100838 (= lt!50976 lt!50960)))

(assert (=> b!100838 false))

(declare-fun b!100839 () Bool)

(declare-fun e!65666 () Bool)

(assert (=> b!100839 (= e!65666 (not call!10426))))

(declare-fun b!100840 () Bool)

(assert (=> b!100840 (= e!65648 call!10434)))

(declare-fun b!100841 () Bool)

(declare-fun e!65649 () Bool)

(assert (=> b!100841 (= e!65649 e!65654)))

(declare-fun res!50535 () Bool)

(assert (=> b!100841 (= res!50535 (contains!802 call!10421 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> b!100841 (=> (not res!50535) (not e!65654))))

(declare-fun bm!10435 () Bool)

(assert (=> bm!10435 (= call!10428 call!10431)))

(declare-fun b!100842 () Bool)

(assert (=> b!100842 (= e!65653 ((_ is Undefined!258) lt!50955))))

(declare-fun b!100843 () Bool)

(assert (=> b!100843 (= e!65662 e!65664)))

(assert (=> b!100843 (= c!17317 (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100844 () Bool)

(declare-fun c!17318 () Bool)

(assert (=> b!100844 (= c!17318 ((_ is MissingVacant!258) lt!50972))))

(assert (=> b!100844 (= e!65658 e!65668)))

(declare-fun b!100845 () Bool)

(assert (=> b!100845 (= e!65667 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50971)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun bm!10436 () Bool)

(declare-fun updateHelperNewKey!43 (LongMapFixedSize!862 (_ BitVec 64) V!3169 (_ BitVec 32)) tuple2!2336)

(assert (=> bm!10436 (= call!10429 (updateHelperNewKey!43 newMap!16 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972))))))

(declare-fun bm!10437 () Bool)

(assert (=> bm!10437 (= call!10423 call!10425)))

(declare-fun bm!10438 () Bool)

(declare-fun c!17314 () Bool)

(assert (=> bm!10438 (= c!17314 c!17310)))

(assert (=> bm!10438 (= call!10420 (contains!802 e!65648 (ite c!17310 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972)))))))

(declare-fun b!100846 () Bool)

(declare-fun lt!50965 () tuple2!2336)

(assert (=> b!100846 (= lt!50965 call!10429)))

(assert (=> b!100846 (= e!65650 (tuple2!2337 (_1!1179 lt!50965) (_2!1179 lt!50965)))))

(declare-fun bm!10439 () Bool)

(assert (=> bm!10439 (= call!10436 (+!130 e!65660 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!17320 () Bool)

(assert (=> bm!10439 (= c!17320 c!17308)))

(declare-fun b!100847 () Bool)

(declare-fun res!50542 () Bool)

(assert (=> b!100847 (= res!50542 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3180 lt!50955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100847 (=> (not res!50542) (not e!65666))))

(declare-fun d!27257 () Bool)

(declare-fun e!65655 () Bool)

(assert (=> d!27257 e!65655))

(declare-fun res!50536 () Bool)

(assert (=> d!27257 (=> (not res!50536) (not e!65655))))

(assert (=> d!27257 (= res!50536 (valid!399 (_2!1179 lt!50956)))))

(assert (=> d!27257 (= lt!50956 e!65662)))

(assert (=> d!27257 (= c!17308 (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvneg (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(assert (=> d!27257 (valid!399 newMap!16)))

(assert (=> d!27257 (= (update!149 newMap!16 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!50956)))

(declare-fun b!100848 () Bool)

(assert (=> b!100848 (= e!65663 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50951)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!100849 () Bool)

(assert (=> b!100849 (= e!65653 e!65666)))

(declare-fun res!50539 () Bool)

(assert (=> b!100849 (= res!50539 call!10440)))

(assert (=> b!100849 (=> (not res!50539) (not e!65666))))

(declare-fun b!100850 () Bool)

(assert (=> b!100850 (= e!65649 (= call!10421 call!10424))))

(declare-fun b!100851 () Bool)

(assert (=> b!100851 (= e!65655 e!65649)))

(declare-fun c!17316 () Bool)

(assert (=> b!100851 (= c!17316 (_1!1179 lt!50956))))

(assert (= (and d!27257 c!17308) b!100843))

(assert (= (and d!27257 (not c!17308)) b!100832))

(assert (= (and b!100843 c!17317) b!100810))

(assert (= (and b!100843 (not c!17317)) b!100816))

(assert (= (or b!100810 b!100816) bm!10437))

(assert (= (or b!100810 b!100816) bm!10419))

(assert (= (or b!100810 b!100816) bm!10421))

(assert (= (and b!100832 c!17310) b!100824))

(assert (= (and b!100832 (not c!17310)) b!100844))

(assert (= (and b!100824 c!17319) b!100838))

(assert (= (and b!100824 (not c!17319)) b!100831))

(assert (= (and b!100838 res!50533) b!100830))

(assert (= (and b!100830 res!50543) b!100845))

(assert (= (and b!100831 c!17313) b!100826))

(assert (= (and b!100831 (not c!17313)) b!100828))

(assert (= (and b!100826 res!50537) b!100837))

(assert (= (and b!100837 res!50538) b!100836))

(assert (= (and b!100828 c!17307) b!100849))

(assert (= (and b!100828 (not c!17307)) b!100842))

(assert (= (and b!100849 res!50539) b!100847))

(assert (= (and b!100847 res!50542) b!100839))

(assert (= (or b!100826 b!100849) bm!10417))

(assert (= (or b!100836 b!100839) bm!10416))

(assert (= (or b!100830 bm!10417) bm!10422))

(assert (= (or b!100838 b!100831) bm!10432))

(assert (= (and b!100844 c!17318) b!100815))

(assert (= (and b!100844 (not c!17318)) b!100814))

(assert (= (and b!100814 c!17309) b!100846))

(assert (= (and b!100814 (not c!17309)) b!100817))

(assert (= (and b!100817 c!17315) b!100812))

(assert (= (and b!100817 (not c!17315)) b!100820))

(assert (= (and b!100812 res!50541) b!100827))

(assert (= (and b!100827 res!50540) b!100848))

(assert (= (and b!100820 c!17311) b!100835))

(assert (= (and b!100820 (not c!17311)) b!100813))

(assert (= (and b!100835 res!50530) b!100834))

(assert (= (and b!100834 res!50534) b!100811))

(assert (= (and b!100813 c!17312) b!100833))

(assert (= (and b!100813 (not c!17312)) b!100819))

(assert (= (and b!100833 res!50532) b!100829))

(assert (= (and b!100829 res!50531) b!100822))

(assert (= (or b!100835 b!100833) bm!10435))

(assert (= (or b!100811 b!100822) bm!10428))

(assert (= (or b!100827 bm!10435) bm!10424))

(assert (= (or b!100812 b!100820) bm!10426))

(assert (= (or b!100815 b!100846) bm!10436))

(assert (= (or b!100838 b!100812) bm!10429))

(assert (= (or b!100831 b!100820) bm!10433))

(assert (= (or bm!10416 bm!10428) bm!10434))

(assert (= (or b!100824 b!100817) bm!10420))

(assert (= (or bm!10432 bm!10426) bm!10423))

(assert (= (or bm!10422 bm!10424) bm!10418))

(assert (= (or b!100824 b!100817) bm!10438))

(assert (= (and bm!10438 c!17314) b!100840))

(assert (= (and bm!10438 (not c!17314)) b!100825))

(assert (= (or bm!10437 b!100825) bm!10430))

(assert (= (or bm!10419 bm!10420) bm!10427))

(assert (= (or bm!10421 b!100817) bm!10439))

(assert (= (and bm!10439 c!17320) b!100823))

(assert (= (and bm!10439 (not c!17320)) b!100818))

(assert (= (and d!27257 res!50536) b!100851))

(assert (= (and b!100851 c!17316) b!100841))

(assert (= (and b!100851 (not c!17316)) b!100850))

(assert (= (and b!100841 res!50535) b!100821))

(assert (= (or b!100841 b!100821 b!100850) bm!10431))

(assert (= (or b!100821 b!100850) bm!10425))

(assert (=> b!100816 m!111099))

(declare-fun m!111291 () Bool)

(assert (=> b!100816 m!111291))

(declare-fun m!111293 () Bool)

(assert (=> bm!10427 m!111293))

(declare-fun m!111295 () Bool)

(assert (=> bm!10427 m!111295))

(declare-fun m!111297 () Bool)

(assert (=> b!100847 m!111297))

(declare-fun m!111299 () Bool)

(assert (=> b!100834 m!111299))

(assert (=> b!100810 m!111099))

(declare-fun m!111301 () Bool)

(assert (=> b!100810 m!111301))

(declare-fun m!111303 () Bool)

(assert (=> b!100845 m!111303))

(assert (=> bm!10423 m!111069))

(declare-fun m!111305 () Bool)

(assert (=> bm!10423 m!111305))

(assert (=> bm!10436 m!111069))

(assert (=> bm!10436 m!111099))

(declare-fun m!111307 () Bool)

(assert (=> bm!10436 m!111307))

(declare-fun m!111309 () Bool)

(assert (=> d!27257 m!111309))

(assert (=> d!27257 m!111079))

(declare-fun m!111311 () Bool)

(assert (=> bm!10438 m!111311))

(declare-fun m!111313 () Bool)

(assert (=> bm!10438 m!111313))

(assert (=> b!100841 m!111069))

(declare-fun m!111315 () Bool)

(assert (=> b!100841 m!111315))

(declare-fun m!111317 () Bool)

(assert (=> b!100837 m!111317))

(assert (=> b!100818 m!111211))

(assert (=> bm!10425 m!111089))

(declare-fun m!111319 () Bool)

(assert (=> bm!10418 m!111319))

(declare-fun m!111321 () Bool)

(assert (=> bm!10431 m!111321))

(declare-fun m!111323 () Bool)

(assert (=> b!100848 m!111323))

(assert (=> b!100817 m!111293))

(assert (=> b!100817 m!111069))

(assert (=> b!100817 m!111099))

(declare-fun m!111325 () Bool)

(assert (=> b!100817 m!111325))

(declare-fun m!111327 () Bool)

(assert (=> b!100817 m!111327))

(assert (=> b!100817 m!111211))

(assert (=> b!100817 m!111211))

(assert (=> b!100817 m!111069))

(declare-fun m!111329 () Bool)

(assert (=> b!100817 m!111329))

(assert (=> b!100832 m!111069))

(assert (=> b!100832 m!111305))

(declare-fun m!111331 () Bool)

(assert (=> bm!10430 m!111331))

(assert (=> bm!10433 m!111069))

(declare-fun m!111333 () Bool)

(assert (=> bm!10433 m!111333))

(declare-fun m!111335 () Bool)

(assert (=> b!100821 m!111335))

(declare-fun m!111337 () Bool)

(assert (=> b!100829 m!111337))

(assert (=> bm!10429 m!111069))

(declare-fun m!111339 () Bool)

(assert (=> bm!10429 m!111339))

(assert (=> bm!10434 m!111069))

(declare-fun m!111341 () Bool)

(assert (=> bm!10434 m!111341))

(declare-fun m!111343 () Bool)

(assert (=> bm!10439 m!111343))

(assert (=> b!100473 d!27257))

(declare-fun d!27259 () Bool)

(declare-fun c!17323 () Bool)

(assert (=> d!27259 (= c!17323 ((_ is ValueCellFull!977) (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun e!65671 () V!3169)

(assert (=> d!27259 (= (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!65671)))

(declare-fun b!100856 () Bool)

(declare-fun get!1300 (ValueCell!977 V!3169) V!3169)

(assert (=> b!100856 (= e!65671 (get!1300 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100857 () Bool)

(declare-fun get!1301 (ValueCell!977 V!3169) V!3169)

(assert (=> b!100857 (= e!65671 (get!1301 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27259 c!17323) b!100856))

(assert (= (and d!27259 (not c!17323)) b!100857))

(assert (=> b!100856 m!111095))

(assert (=> b!100856 m!111097))

(declare-fun m!111345 () Bool)

(assert (=> b!100856 m!111345))

(assert (=> b!100857 m!111095))

(assert (=> b!100857 m!111097))

(declare-fun m!111347 () Bool)

(assert (=> b!100857 m!111347))

(assert (=> b!100473 d!27259))

(declare-fun d!27261 () Bool)

(assert (=> d!27261 (= (array_inv!1263 (_keys!4219 newMap!16)) (bvsge (size!2267 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!100484 d!27261))

(declare-fun d!27263 () Bool)

(assert (=> d!27263 (= (array_inv!1264 (_values!2505 newMap!16)) (bvsge (size!2268 (_values!2505 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!100484 d!27263))

(declare-fun d!27265 () Bool)

(assert (=> d!27265 (= (valid!398 thiss!992) (valid!399 (v!2823 (underlying!337 thiss!992))))))

(declare-fun bs!4162 () Bool)

(assert (= bs!4162 d!27265))

(declare-fun m!111349 () Bool)

(assert (=> bs!4162 m!111349))

(assert (=> start!11950 d!27265))

(declare-fun bm!10442 () Bool)

(declare-fun call!10445 () Bool)

(assert (=> bm!10442 (= call!10445 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun d!27267 () Bool)

(declare-fun res!50549 () Bool)

(declare-fun e!65680 () Bool)

(assert (=> d!27267 (=> res!50549 e!65680)))

(assert (=> d!27267 (= res!50549 (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> d!27267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))) e!65680)))

(declare-fun b!100866 () Bool)

(declare-fun e!65679 () Bool)

(assert (=> b!100866 (= e!65679 call!10445)))

(declare-fun b!100867 () Bool)

(declare-fun e!65678 () Bool)

(assert (=> b!100867 (= e!65678 call!10445)))

(declare-fun b!100868 () Bool)

(assert (=> b!100868 (= e!65680 e!65679)))

(declare-fun c!17326 () Bool)

(assert (=> b!100868 (= c!17326 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!100869 () Bool)

(assert (=> b!100869 (= e!65679 e!65678)))

(declare-fun lt!50984 () (_ BitVec 64))

(assert (=> b!100869 (= lt!50984 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!50983 () Unit!3061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4245 (_ BitVec 64) (_ BitVec 32)) Unit!3061)

(assert (=> b!100869 (= lt!50983 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 #b00000000000000000000000000000000))))

(assert (=> b!100869 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 #b00000000000000000000000000000000)))

(declare-fun lt!50985 () Unit!3061)

(assert (=> b!100869 (= lt!50985 lt!50983)))

(declare-fun res!50548 () Bool)

(assert (=> b!100869 (= res!50548 (= (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))) (Found!258 #b00000000000000000000000000000000)))))

(assert (=> b!100869 (=> (not res!50548) (not e!65678))))

(assert (= (and d!27267 (not res!50549)) b!100868))

(assert (= (and b!100868 c!17326) b!100869))

(assert (= (and b!100868 (not c!17326)) b!100866))

(assert (= (and b!100869 res!50548) b!100867))

(assert (= (or b!100867 b!100866) bm!10442))

(declare-fun m!111351 () Bool)

(assert (=> bm!10442 m!111351))

(declare-fun m!111353 () Bool)

(assert (=> b!100868 m!111353))

(assert (=> b!100868 m!111353))

(declare-fun m!111355 () Bool)

(assert (=> b!100868 m!111355))

(assert (=> b!100869 m!111353))

(declare-fun m!111357 () Bool)

(assert (=> b!100869 m!111357))

(declare-fun m!111359 () Bool)

(assert (=> b!100869 m!111359))

(assert (=> b!100869 m!111353))

(declare-fun m!111361 () Bool)

(assert (=> b!100869 m!111361))

(assert (=> b!100478 d!27267))

(declare-fun mapNonEmpty!3807 () Bool)

(declare-fun mapRes!3807 () Bool)

(declare-fun tp!9675 () Bool)

(declare-fun e!65685 () Bool)

(assert (=> mapNonEmpty!3807 (= mapRes!3807 (and tp!9675 e!65685))))

(declare-fun mapRest!3807 () (Array (_ BitVec 32) ValueCell!977))

(declare-fun mapKey!3807 () (_ BitVec 32))

(declare-fun mapValue!3807 () ValueCell!977)

(assert (=> mapNonEmpty!3807 (= mapRest!3791 (store mapRest!3807 mapKey!3807 mapValue!3807))))

(declare-fun condMapEmpty!3807 () Bool)

(declare-fun mapDefault!3807 () ValueCell!977)

(assert (=> mapNonEmpty!3791 (= condMapEmpty!3807 (= mapRest!3791 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3807)))))

(declare-fun e!65686 () Bool)

(assert (=> mapNonEmpty!3791 (= tp!9647 (and e!65686 mapRes!3807))))

(declare-fun mapIsEmpty!3807 () Bool)

(assert (=> mapIsEmpty!3807 mapRes!3807))

(declare-fun b!100877 () Bool)

(assert (=> b!100877 (= e!65686 tp_is_empty!2641)))

(declare-fun b!100876 () Bool)

(assert (=> b!100876 (= e!65685 tp_is_empty!2641)))

(assert (= (and mapNonEmpty!3791 condMapEmpty!3807) mapIsEmpty!3807))

(assert (= (and mapNonEmpty!3791 (not condMapEmpty!3807)) mapNonEmpty!3807))

(assert (= (and mapNonEmpty!3807 ((_ is ValueCellFull!977) mapValue!3807)) b!100876))

(assert (= (and mapNonEmpty!3791 ((_ is ValueCellFull!977) mapDefault!3807)) b!100877))

(declare-fun m!111363 () Bool)

(assert (=> mapNonEmpty!3807 m!111363))

(declare-fun mapNonEmpty!3808 () Bool)

(declare-fun mapRes!3808 () Bool)

(declare-fun tp!9676 () Bool)

(declare-fun e!65687 () Bool)

(assert (=> mapNonEmpty!3808 (= mapRes!3808 (and tp!9676 e!65687))))

(declare-fun mapRest!3808 () (Array (_ BitVec 32) ValueCell!977))

(declare-fun mapValue!3808 () ValueCell!977)

(declare-fun mapKey!3808 () (_ BitVec 32))

(assert (=> mapNonEmpty!3808 (= mapRest!3792 (store mapRest!3808 mapKey!3808 mapValue!3808))))

(declare-fun condMapEmpty!3808 () Bool)

(declare-fun mapDefault!3808 () ValueCell!977)

(assert (=> mapNonEmpty!3792 (= condMapEmpty!3808 (= mapRest!3792 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3808)))))

(declare-fun e!65688 () Bool)

(assert (=> mapNonEmpty!3792 (= tp!9648 (and e!65688 mapRes!3808))))

(declare-fun mapIsEmpty!3808 () Bool)

(assert (=> mapIsEmpty!3808 mapRes!3808))

(declare-fun b!100879 () Bool)

(assert (=> b!100879 (= e!65688 tp_is_empty!2641)))

(declare-fun b!100878 () Bool)

(assert (=> b!100878 (= e!65687 tp_is_empty!2641)))

(assert (= (and mapNonEmpty!3792 condMapEmpty!3808) mapIsEmpty!3808))

(assert (= (and mapNonEmpty!3792 (not condMapEmpty!3808)) mapNonEmpty!3808))

(assert (= (and mapNonEmpty!3808 ((_ is ValueCellFull!977) mapValue!3808)) b!100878))

(assert (= (and mapNonEmpty!3792 ((_ is ValueCellFull!977) mapDefault!3808)) b!100879))

(declare-fun m!111365 () Bool)

(assert (=> mapNonEmpty!3808 m!111365))

(declare-fun b_lambda!4507 () Bool)

(assert (= b_lambda!4505 (or (and b!100481 b_free!2449) (and b!100484 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))))) b_lambda!4507)))

(check-sat (not b!100868) (not b!100675) (not bm!10436) (not b!100857) (not b!100821) (not d!27245) (not b!100817) (not b!100832) (not b_next!2451) (not bm!10423) (not b_lambda!4507) (not b!100714) (not b!100856) (not bm!10439) (not bm!10429) (not b!100723) (not b!100678) (not d!27265) (not d!27241) (not b!100624) (not b!100810) (not b!100695) (not b!100683) (not d!27243) (not d!27251) (not b!100869) (not bm!10425) (not d!27247) (not b!100689) (not bm!10367) (not d!27255) (not b!100716) (not mapNonEmpty!3807) (not b!100673) (not b!100672) (not b!100670) (not bm!10438) (not b!100818) (not bm!10362) (not bm!10431) (not bm!10427) (not b!100626) (not mapNonEmpty!3808) (not b!100625) (not bm!10361) (not bm!10359) (not bm!10434) b_and!6199 (not bm!10433) (not b!100725) (not b_lambda!4503) (not d!27239) (not bm!10418) (not b_next!2449) (not bm!10363) (not b!100700) (not b!100715) (not b!100841) b_and!6197 (not b!100682) (not b!100816) (not bm!10442) (not d!27257) (not bm!10430) tp_is_empty!2641)
(check-sat b_and!6197 b_and!6199 (not b_next!2449) (not b_next!2451))
(get-model)

(declare-fun d!27269 () Bool)

(declare-fun e!65691 () Bool)

(assert (=> d!27269 e!65691))

(declare-fun res!50554 () Bool)

(assert (=> d!27269 (=> (not res!50554) (not e!65691))))

(declare-fun lt!50995 () ListLongMap!1519)

(assert (=> d!27269 (= res!50554 (contains!802 lt!50995 (_1!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!50997 () List!1593)

(assert (=> d!27269 (= lt!50995 (ListLongMap!1520 lt!50997))))

(declare-fun lt!50996 () Unit!3061)

(declare-fun lt!50994 () Unit!3061)

(assert (=> d!27269 (= lt!50996 lt!50994)))

(assert (=> d!27269 (= (getValueByKey!150 lt!50997 (_1!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!155 (_2!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!69 (List!1593 (_ BitVec 64) V!3169) Unit!3061)

(assert (=> d!27269 (= lt!50994 (lemmaContainsTupThenGetReturnValue!69 lt!50997 (_1!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!72 (List!1593 (_ BitVec 64) V!3169) List!1593)

(assert (=> d!27269 (= lt!50997 (insertStrictlySorted!72 (toList!775 e!65660) (_1!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27269 (= (+!130 e!65660 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!50995)))

(declare-fun b!100884 () Bool)

(declare-fun res!50555 () Bool)

(assert (=> b!100884 (=> (not res!50555) (not e!65691))))

(assert (=> b!100884 (= res!50555 (= (getValueByKey!150 (toList!775 lt!50995) (_1!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!155 (_2!1180 (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!100885 () Bool)

(declare-fun contains!806 (List!1593 tuple2!2338) Bool)

(assert (=> b!100885 (= e!65691 (contains!806 (toList!775 lt!50995) (ite c!17308 (ite c!17317 (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27269 res!50554) b!100884))

(assert (= (and b!100884 res!50555) b!100885))

(declare-fun m!111367 () Bool)

(assert (=> d!27269 m!111367))

(declare-fun m!111369 () Bool)

(assert (=> d!27269 m!111369))

(declare-fun m!111371 () Bool)

(assert (=> d!27269 m!111371))

(declare-fun m!111373 () Bool)

(assert (=> d!27269 m!111373))

(declare-fun m!111375 () Bool)

(assert (=> b!100884 m!111375))

(declare-fun m!111377 () Bool)

(assert (=> b!100885 m!111377))

(assert (=> bm!10439 d!27269))

(declare-fun d!27271 () Bool)

(declare-fun res!50556 () Bool)

(declare-fun e!65692 () Bool)

(assert (=> d!27271 (=> res!50556 e!65692)))

(assert (=> d!27271 (= res!50556 (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27271 (= (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!65692)))

(declare-fun b!100886 () Bool)

(declare-fun e!65693 () Bool)

(assert (=> b!100886 (= e!65692 e!65693)))

(declare-fun res!50557 () Bool)

(assert (=> b!100886 (=> (not res!50557) (not e!65693))))

(assert (=> b!100886 (= res!50557 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!100887 () Bool)

(assert (=> b!100887 (= e!65693 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!27271 (not res!50556)) b!100886))

(assert (= (and b!100886 res!50557) b!100887))

(declare-fun m!111379 () Bool)

(assert (=> d!27271 m!111379))

(assert (=> b!100887 m!111069))

(declare-fun m!111381 () Bool)

(assert (=> b!100887 m!111381))

(assert (=> b!100695 d!27271))

(declare-fun d!27273 () Bool)

(declare-fun e!65695 () Bool)

(assert (=> d!27273 e!65695))

(declare-fun res!50558 () Bool)

(assert (=> d!27273 (=> res!50558 e!65695)))

(declare-fun lt!51001 () Bool)

(assert (=> d!27273 (= res!50558 (not lt!51001))))

(declare-fun lt!50998 () Bool)

(assert (=> d!27273 (= lt!51001 lt!50998)))

(declare-fun lt!51000 () Unit!3061)

(declare-fun e!65694 () Unit!3061)

(assert (=> d!27273 (= lt!51000 e!65694)))

(declare-fun c!17327 () Bool)

(assert (=> d!27273 (= c!17327 lt!50998)))

(assert (=> d!27273 (= lt!50998 (containsKey!154 (toList!775 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50866))))

(assert (=> d!27273 (= (contains!802 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50866) lt!51001)))

(declare-fun b!100888 () Bool)

(declare-fun lt!50999 () Unit!3061)

(assert (=> b!100888 (= e!65694 lt!50999)))

(assert (=> b!100888 (= lt!50999 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50866))))

(assert (=> b!100888 (isDefined!104 (getValueByKey!150 (toList!775 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50866))))

(declare-fun b!100889 () Bool)

(declare-fun Unit!3077 () Unit!3061)

(assert (=> b!100889 (= e!65694 Unit!3077)))

(declare-fun b!100890 () Bool)

(assert (=> b!100890 (= e!65695 (isDefined!104 (getValueByKey!150 (toList!775 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50866)))))

(assert (= (and d!27273 c!17327) b!100888))

(assert (= (and d!27273 (not c!17327)) b!100889))

(assert (= (and d!27273 (not res!50558)) b!100890))

(declare-fun m!111383 () Bool)

(assert (=> d!27273 m!111383))

(declare-fun m!111385 () Bool)

(assert (=> b!100888 m!111385))

(declare-fun m!111387 () Bool)

(assert (=> b!100888 m!111387))

(assert (=> b!100888 m!111387))

(declare-fun m!111389 () Bool)

(assert (=> b!100888 m!111389))

(assert (=> b!100890 m!111387))

(assert (=> b!100890 m!111387))

(assert (=> b!100890 m!111389))

(assert (=> b!100678 d!27273))

(declare-fun d!27275 () Bool)

(assert (=> d!27275 (= (apply!94 (+!130 lt!50864 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50860) (apply!94 lt!50864 lt!50860))))

(declare-fun lt!51004 () Unit!3061)

(declare-fun choose!623 (ListLongMap!1519 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3061)

(assert (=> d!27275 (= lt!51004 (choose!623 lt!50864 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50860))))

(declare-fun e!65698 () Bool)

(assert (=> d!27275 e!65698))

(declare-fun res!50561 () Bool)

(assert (=> d!27275 (=> (not res!50561) (not e!65698))))

(assert (=> d!27275 (= res!50561 (contains!802 lt!50864 lt!50860))))

(assert (=> d!27275 (= (addApplyDifferent!70 lt!50864 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50860) lt!51004)))

(declare-fun b!100894 () Bool)

(assert (=> b!100894 (= e!65698 (not (= lt!50860 lt!50859)))))

(assert (= (and d!27275 res!50561) b!100894))

(declare-fun m!111391 () Bool)

(assert (=> d!27275 m!111391))

(assert (=> d!27275 m!111233))

(assert (=> d!27275 m!111249))

(assert (=> d!27275 m!111251))

(declare-fun m!111393 () Bool)

(assert (=> d!27275 m!111393))

(assert (=> d!27275 m!111249))

(assert (=> b!100678 d!27275))

(declare-fun d!27277 () Bool)

(declare-fun e!65699 () Bool)

(assert (=> d!27277 e!65699))

(declare-fun res!50562 () Bool)

(assert (=> d!27277 (=> (not res!50562) (not e!65699))))

(declare-fun lt!51006 () ListLongMap!1519)

(assert (=> d!27277 (= res!50562 (contains!802 lt!51006 (_1!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun lt!51008 () List!1593)

(assert (=> d!27277 (= lt!51006 (ListLongMap!1520 lt!51008))))

(declare-fun lt!51007 () Unit!3061)

(declare-fun lt!51005 () Unit!3061)

(assert (=> d!27277 (= lt!51007 lt!51005)))

(assert (=> d!27277 (= (getValueByKey!150 lt!51008 (_1!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27277 (= lt!51005 (lemmaContainsTupThenGetReturnValue!69 lt!51008 (_1!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27277 (= lt!51008 (insertStrictlySorted!72 (toList!775 lt!50869) (_1!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27277 (= (+!130 lt!50869 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!51006)))

(declare-fun b!100895 () Bool)

(declare-fun res!50563 () Bool)

(assert (=> b!100895 (=> (not res!50563) (not e!65699))))

(assert (=> b!100895 (= res!50563 (= (getValueByKey!150 (toList!775 lt!51006) (_1!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun b!100896 () Bool)

(assert (=> b!100896 (= e!65699 (contains!806 (toList!775 lt!51006) (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27277 res!50562) b!100895))

(assert (= (and b!100895 res!50563) b!100896))

(declare-fun m!111395 () Bool)

(assert (=> d!27277 m!111395))

(declare-fun m!111397 () Bool)

(assert (=> d!27277 m!111397))

(declare-fun m!111399 () Bool)

(assert (=> d!27277 m!111399))

(declare-fun m!111401 () Bool)

(assert (=> d!27277 m!111401))

(declare-fun m!111403 () Bool)

(assert (=> b!100895 m!111403))

(declare-fun m!111405 () Bool)

(assert (=> b!100896 m!111405))

(assert (=> b!100678 d!27277))

(declare-fun d!27279 () Bool)

(declare-fun e!65700 () Bool)

(assert (=> d!27279 e!65700))

(declare-fun res!50564 () Bool)

(assert (=> d!27279 (=> (not res!50564) (not e!65700))))

(declare-fun lt!51010 () ListLongMap!1519)

(assert (=> d!27279 (= res!50564 (contains!802 lt!51010 (_1!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun lt!51012 () List!1593)

(assert (=> d!27279 (= lt!51010 (ListLongMap!1520 lt!51012))))

(declare-fun lt!51011 () Unit!3061)

(declare-fun lt!51009 () Unit!3061)

(assert (=> d!27279 (= lt!51011 lt!51009)))

(assert (=> d!27279 (= (getValueByKey!150 lt!51012 (_1!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27279 (= lt!51009 (lemmaContainsTupThenGetReturnValue!69 lt!51012 (_1!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27279 (= lt!51012 (insertStrictlySorted!72 (toList!775 lt!50853) (_1!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27279 (= (+!130 lt!50853 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!51010)))

(declare-fun b!100897 () Bool)

(declare-fun res!50565 () Bool)

(assert (=> b!100897 (=> (not res!50565) (not e!65700))))

(assert (=> b!100897 (= res!50565 (= (getValueByKey!150 (toList!775 lt!51010) (_1!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun b!100898 () Bool)

(assert (=> b!100898 (= e!65700 (contains!806 (toList!775 lt!51010) (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27279 res!50564) b!100897))

(assert (= (and b!100897 res!50565) b!100898))

(declare-fun m!111407 () Bool)

(assert (=> d!27279 m!111407))

(declare-fun m!111409 () Bool)

(assert (=> d!27279 m!111409))

(declare-fun m!111411 () Bool)

(assert (=> d!27279 m!111411))

(declare-fun m!111413 () Bool)

(assert (=> d!27279 m!111413))

(declare-fun m!111415 () Bool)

(assert (=> b!100897 m!111415))

(declare-fun m!111417 () Bool)

(assert (=> b!100898 m!111417))

(assert (=> b!100678 d!27279))

(declare-fun b!100923 () Bool)

(declare-fun e!65717 () ListLongMap!1519)

(declare-fun call!10448 () ListLongMap!1519)

(assert (=> b!100923 (= e!65717 call!10448)))

(declare-fun b!100924 () Bool)

(declare-fun e!65721 () ListLongMap!1519)

(assert (=> b!100924 (= e!65721 (ListLongMap!1520 Nil!1590))))

(declare-fun d!27281 () Bool)

(declare-fun e!65718 () Bool)

(assert (=> d!27281 e!65718))

(declare-fun res!50574 () Bool)

(assert (=> d!27281 (=> (not res!50574) (not e!65718))))

(declare-fun lt!51032 () ListLongMap!1519)

(assert (=> d!27281 (= res!50574 (not (contains!802 lt!51032 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27281 (= lt!51032 e!65721)))

(declare-fun c!17336 () Bool)

(assert (=> d!27281 (= c!17336 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> d!27281 (validMask!0 (mask!6638 (v!2823 (underlying!337 thiss!992))))))

(assert (=> d!27281 (= (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))) lt!51032)))

(declare-fun b!100925 () Bool)

(declare-fun res!50576 () Bool)

(assert (=> b!100925 (=> (not res!50576) (not e!65718))))

(assert (=> b!100925 (= res!50576 (not (contains!802 lt!51032 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100926 () Bool)

(declare-fun e!65720 () Bool)

(assert (=> b!100926 (= e!65718 e!65720)))

(declare-fun c!17338 () Bool)

(declare-fun e!65716 () Bool)

(assert (=> b!100926 (= c!17338 e!65716)))

(declare-fun res!50575 () Bool)

(assert (=> b!100926 (=> (not res!50575) (not e!65716))))

(assert (=> b!100926 (= res!50575 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!100927 () Bool)

(assert (=> b!100927 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> b!100927 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2268 (_values!2505 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun e!65719 () Bool)

(assert (=> b!100927 (= e!65719 (= (apply!94 lt!51032 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!100928 () Bool)

(declare-fun e!65715 () Bool)

(declare-fun isEmpty!366 (ListLongMap!1519) Bool)

(assert (=> b!100928 (= e!65715 (isEmpty!366 lt!51032))))

(declare-fun b!100929 () Bool)

(assert (=> b!100929 (= e!65715 (= lt!51032 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!100930 () Bool)

(assert (=> b!100930 (= e!65716 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!100930 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!100931 () Bool)

(assert (=> b!100931 (= e!65720 e!65719)))

(assert (=> b!100931 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun res!50577 () Bool)

(assert (=> b!100931 (= res!50577 (contains!802 lt!51032 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!100931 (=> (not res!50577) (not e!65719))))

(declare-fun b!100932 () Bool)

(assert (=> b!100932 (= e!65721 e!65717)))

(declare-fun c!17339 () Bool)

(assert (=> b!100932 (= c!17339 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!100933 () Bool)

(declare-fun lt!51031 () Unit!3061)

(declare-fun lt!51028 () Unit!3061)

(assert (=> b!100933 (= lt!51031 lt!51028)))

(declare-fun lt!51033 () (_ BitVec 64))

(declare-fun lt!51029 () V!3169)

(declare-fun lt!51030 () (_ BitVec 64))

(declare-fun lt!51027 () ListLongMap!1519)

(assert (=> b!100933 (not (contains!802 (+!130 lt!51027 (tuple2!2339 lt!51033 lt!51029)) lt!51030))))

(declare-fun addStillNotContains!43 (ListLongMap!1519 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3061)

(assert (=> b!100933 (= lt!51028 (addStillNotContains!43 lt!51027 lt!51033 lt!51029 lt!51030))))

(assert (=> b!100933 (= lt!51030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!100933 (= lt!51029 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100933 (= lt!51033 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!100933 (= lt!51027 call!10448)))

(assert (=> b!100933 (= e!65717 (+!130 call!10448 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!10445 () Bool)

(assert (=> bm!10445 (= call!10448 (getCurrentListMapNoExtraKeys!94 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!100934 () Bool)

(assert (=> b!100934 (= e!65720 e!65715)))

(declare-fun c!17337 () Bool)

(assert (=> b!100934 (= c!17337 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27281 c!17336) b!100924))

(assert (= (and d!27281 (not c!17336)) b!100932))

(assert (= (and b!100932 c!17339) b!100933))

(assert (= (and b!100932 (not c!17339)) b!100923))

(assert (= (or b!100933 b!100923) bm!10445))

(assert (= (and d!27281 res!50574) b!100925))

(assert (= (and b!100925 res!50576) b!100926))

(assert (= (and b!100926 res!50575) b!100930))

(assert (= (and b!100926 c!17338) b!100931))

(assert (= (and b!100926 (not c!17338)) b!100934))

(assert (= (and b!100931 res!50577) b!100927))

(assert (= (and b!100934 c!17337) b!100929))

(assert (= (and b!100934 (not c!17337)) b!100928))

(declare-fun b_lambda!4509 () Bool)

(assert (=> (not b_lambda!4509) (not b!100927)))

(assert (=> b!100927 t!5575))

(declare-fun b_and!6201 () Bool)

(assert (= b_and!6197 (and (=> t!5575 result!3307) b_and!6201)))

(assert (=> b!100927 t!5577))

(declare-fun b_and!6203 () Bool)

(assert (= b_and!6199 (and (=> t!5577 result!3311) b_and!6203)))

(declare-fun b_lambda!4511 () Bool)

(assert (=> (not b_lambda!4511) (not b!100933)))

(assert (=> b!100933 t!5575))

(declare-fun b_and!6205 () Bool)

(assert (= b_and!6201 (and (=> t!5575 result!3307) b_and!6205)))

(assert (=> b!100933 t!5577))

(declare-fun b_and!6207 () Bool)

(assert (= b_and!6203 (and (=> t!5577 result!3311) b_and!6207)))

(assert (=> b!100933 m!111097))

(assert (=> b!100933 m!111263))

(assert (=> b!100933 m!111097))

(assert (=> b!100933 m!111265))

(assert (=> b!100933 m!111263))

(declare-fun m!111419 () Bool)

(assert (=> b!100933 m!111419))

(declare-fun m!111421 () Bool)

(assert (=> b!100933 m!111421))

(assert (=> b!100933 m!111419))

(assert (=> b!100933 m!111217))

(declare-fun m!111423 () Bool)

(assert (=> b!100933 m!111423))

(declare-fun m!111425 () Bool)

(assert (=> b!100933 m!111425))

(declare-fun m!111427 () Bool)

(assert (=> bm!10445 m!111427))

(declare-fun m!111429 () Bool)

(assert (=> b!100925 m!111429))

(declare-fun m!111431 () Bool)

(assert (=> b!100928 m!111431))

(assert (=> b!100931 m!111217))

(assert (=> b!100931 m!111217))

(declare-fun m!111433 () Bool)

(assert (=> b!100931 m!111433))

(assert (=> b!100932 m!111217))

(assert (=> b!100932 m!111217))

(assert (=> b!100932 m!111219))

(assert (=> b!100929 m!111427))

(assert (=> b!100930 m!111217))

(assert (=> b!100930 m!111217))

(assert (=> b!100930 m!111219))

(declare-fun m!111435 () Bool)

(assert (=> d!27281 m!111435))

(assert (=> d!27281 m!111077))

(assert (=> b!100927 m!111097))

(assert (=> b!100927 m!111263))

(assert (=> b!100927 m!111097))

(assert (=> b!100927 m!111265))

(assert (=> b!100927 m!111217))

(declare-fun m!111437 () Bool)

(assert (=> b!100927 m!111437))

(assert (=> b!100927 m!111263))

(assert (=> b!100927 m!111217))

(assert (=> b!100678 d!27281))

(declare-fun d!27283 () Bool)

(declare-fun get!1302 (Option!156) V!3169)

(assert (=> d!27283 (= (apply!94 (+!130 lt!50864 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50860) (get!1302 (getValueByKey!150 (toList!775 (+!130 lt!50864 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50860)))))

(declare-fun bs!4163 () Bool)

(assert (= bs!4163 d!27283))

(declare-fun m!111439 () Bool)

(assert (=> bs!4163 m!111439))

(assert (=> bs!4163 m!111439))

(declare-fun m!111441 () Bool)

(assert (=> bs!4163 m!111441))

(assert (=> b!100678 d!27283))

(declare-fun d!27285 () Bool)

(assert (=> d!27285 (= (apply!94 lt!50864 lt!50860) (get!1302 (getValueByKey!150 (toList!775 lt!50864) lt!50860)))))

(declare-fun bs!4164 () Bool)

(assert (= bs!4164 d!27285))

(declare-fun m!111443 () Bool)

(assert (=> bs!4164 m!111443))

(assert (=> bs!4164 m!111443))

(declare-fun m!111445 () Bool)

(assert (=> bs!4164 m!111445))

(assert (=> b!100678 d!27285))

(declare-fun d!27287 () Bool)

(assert (=> d!27287 (= (apply!94 (+!130 lt!50853 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50862) (apply!94 lt!50853 lt!50862))))

(declare-fun lt!51034 () Unit!3061)

(assert (=> d!27287 (= lt!51034 (choose!623 lt!50853 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50862))))

(declare-fun e!65722 () Bool)

(assert (=> d!27287 e!65722))

(declare-fun res!50578 () Bool)

(assert (=> d!27287 (=> (not res!50578) (not e!65722))))

(assert (=> d!27287 (= res!50578 (contains!802 lt!50853 lt!50862))))

(assert (=> d!27287 (= (addApplyDifferent!70 lt!50853 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50862) lt!51034)))

(declare-fun b!100935 () Bool)

(assert (=> b!100935 (= e!65722 (not (= lt!50862 lt!50858)))))

(assert (= (and d!27287 res!50578) b!100935))

(declare-fun m!111447 () Bool)

(assert (=> d!27287 m!111447))

(assert (=> d!27287 m!111247))

(assert (=> d!27287 m!111235))

(assert (=> d!27287 m!111237))

(declare-fun m!111449 () Bool)

(assert (=> d!27287 m!111449))

(assert (=> d!27287 m!111235))

(assert (=> b!100678 d!27287))

(declare-fun d!27289 () Bool)

(assert (=> d!27289 (= (apply!94 lt!50869 lt!50871) (get!1302 (getValueByKey!150 (toList!775 lt!50869) lt!50871)))))

(declare-fun bs!4165 () Bool)

(assert (= bs!4165 d!27289))

(declare-fun m!111451 () Bool)

(assert (=> bs!4165 m!111451))

(assert (=> bs!4165 m!111451))

(declare-fun m!111453 () Bool)

(assert (=> bs!4165 m!111453))

(assert (=> b!100678 d!27289))

(declare-fun d!27291 () Bool)

(declare-fun e!65723 () Bool)

(assert (=> d!27291 e!65723))

(declare-fun res!50579 () Bool)

(assert (=> d!27291 (=> (not res!50579) (not e!65723))))

(declare-fun lt!51036 () ListLongMap!1519)

(assert (=> d!27291 (= res!50579 (contains!802 lt!51036 (_1!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun lt!51038 () List!1593)

(assert (=> d!27291 (= lt!51036 (ListLongMap!1520 lt!51038))))

(declare-fun lt!51037 () Unit!3061)

(declare-fun lt!51035 () Unit!3061)

(assert (=> d!27291 (= lt!51037 lt!51035)))

(assert (=> d!27291 (= (getValueByKey!150 lt!51038 (_1!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27291 (= lt!51035 (lemmaContainsTupThenGetReturnValue!69 lt!51038 (_1!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27291 (= lt!51038 (insertStrictlySorted!72 (toList!775 lt!50864) (_1!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27291 (= (+!130 lt!50864 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!51036)))

(declare-fun b!100936 () Bool)

(declare-fun res!50580 () Bool)

(assert (=> b!100936 (=> (not res!50580) (not e!65723))))

(assert (=> b!100936 (= res!50580 (= (getValueByKey!150 (toList!775 lt!51036) (_1!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun b!100937 () Bool)

(assert (=> b!100937 (= e!65723 (contains!806 (toList!775 lt!51036) (tuple2!2339 lt!50859 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27291 res!50579) b!100936))

(assert (= (and b!100936 res!50580) b!100937))

(declare-fun m!111455 () Bool)

(assert (=> d!27291 m!111455))

(declare-fun m!111457 () Bool)

(assert (=> d!27291 m!111457))

(declare-fun m!111459 () Bool)

(assert (=> d!27291 m!111459))

(declare-fun m!111461 () Bool)

(assert (=> d!27291 m!111461))

(declare-fun m!111463 () Bool)

(assert (=> b!100936 m!111463))

(declare-fun m!111465 () Bool)

(assert (=> b!100937 m!111465))

(assert (=> b!100678 d!27291))

(declare-fun d!27293 () Bool)

(assert (=> d!27293 (= (apply!94 (+!130 lt!50869 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50871) (apply!94 lt!50869 lt!50871))))

(declare-fun lt!51039 () Unit!3061)

(assert (=> d!27293 (= lt!51039 (choose!623 lt!50869 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50871))))

(declare-fun e!65724 () Bool)

(assert (=> d!27293 e!65724))

(declare-fun res!50581 () Bool)

(assert (=> d!27293 (=> (not res!50581) (not e!65724))))

(assert (=> d!27293 (= res!50581 (contains!802 lt!50869 lt!50871))))

(assert (=> d!27293 (= (addApplyDifferent!70 lt!50869 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50871) lt!51039)))

(declare-fun b!100938 () Bool)

(assert (=> b!100938 (= e!65724 (not (= lt!50871 lt!50870)))))

(assert (= (and d!27293 res!50581) b!100938))

(declare-fun m!111467 () Bool)

(assert (=> d!27293 m!111467))

(assert (=> d!27293 m!111255))

(assert (=> d!27293 m!111229))

(assert (=> d!27293 m!111245))

(declare-fun m!111469 () Bool)

(assert (=> d!27293 m!111469))

(assert (=> d!27293 m!111229))

(assert (=> b!100678 d!27293))

(declare-fun d!27295 () Bool)

(assert (=> d!27295 (= (apply!94 lt!50853 lt!50862) (get!1302 (getValueByKey!150 (toList!775 lt!50853) lt!50862)))))

(declare-fun bs!4166 () Bool)

(assert (= bs!4166 d!27295))

(declare-fun m!111471 () Bool)

(assert (=> bs!4166 m!111471))

(assert (=> bs!4166 m!111471))

(declare-fun m!111473 () Bool)

(assert (=> bs!4166 m!111473))

(assert (=> b!100678 d!27295))

(declare-fun d!27297 () Bool)

(assert (=> d!27297 (= (apply!94 (+!130 lt!50869 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50871) (get!1302 (getValueByKey!150 (toList!775 (+!130 lt!50869 (tuple2!2339 lt!50870 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50871)))))

(declare-fun bs!4167 () Bool)

(assert (= bs!4167 d!27297))

(declare-fun m!111475 () Bool)

(assert (=> bs!4167 m!111475))

(assert (=> bs!4167 m!111475))

(declare-fun m!111477 () Bool)

(assert (=> bs!4167 m!111477))

(assert (=> b!100678 d!27297))

(declare-fun d!27299 () Bool)

(declare-fun e!65725 () Bool)

(assert (=> d!27299 e!65725))

(declare-fun res!50582 () Bool)

(assert (=> d!27299 (=> (not res!50582) (not e!65725))))

(declare-fun lt!51041 () ListLongMap!1519)

(assert (=> d!27299 (= res!50582 (contains!802 lt!51041 (_1!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun lt!51043 () List!1593)

(assert (=> d!27299 (= lt!51041 (ListLongMap!1520 lt!51043))))

(declare-fun lt!51042 () Unit!3061)

(declare-fun lt!51040 () Unit!3061)

(assert (=> d!27299 (= lt!51042 lt!51040)))

(assert (=> d!27299 (= (getValueByKey!150 lt!51043 (_1!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27299 (= lt!51040 (lemmaContainsTupThenGetReturnValue!69 lt!51043 (_1!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27299 (= lt!51043 (insertStrictlySorted!72 (toList!775 lt!50861) (_1!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27299 (= (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!51041)))

(declare-fun b!100939 () Bool)

(declare-fun res!50583 () Bool)

(assert (=> b!100939 (=> (not res!50583) (not e!65725))))

(assert (=> b!100939 (= res!50583 (= (getValueByKey!150 (toList!775 lt!51041) (_1!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun b!100940 () Bool)

(assert (=> b!100940 (= e!65725 (contains!806 (toList!775 lt!51041) (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27299 res!50582) b!100939))

(assert (= (and b!100939 res!50583) b!100940))

(declare-fun m!111479 () Bool)

(assert (=> d!27299 m!111479))

(declare-fun m!111481 () Bool)

(assert (=> d!27299 m!111481))

(declare-fun m!111483 () Bool)

(assert (=> d!27299 m!111483))

(declare-fun m!111485 () Bool)

(assert (=> d!27299 m!111485))

(declare-fun m!111487 () Bool)

(assert (=> b!100939 m!111487))

(declare-fun m!111489 () Bool)

(assert (=> b!100940 m!111489))

(assert (=> b!100678 d!27299))

(declare-fun d!27301 () Bool)

(assert (=> d!27301 (= (apply!94 (+!130 lt!50853 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50862) (get!1302 (getValueByKey!150 (toList!775 (+!130 lt!50853 (tuple2!2339 lt!50858 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!50862)))))

(declare-fun bs!4168 () Bool)

(assert (= bs!4168 d!27301))

(declare-fun m!111491 () Bool)

(assert (=> bs!4168 m!111491))

(assert (=> bs!4168 m!111491))

(declare-fun m!111493 () Bool)

(assert (=> bs!4168 m!111493))

(assert (=> b!100678 d!27301))

(declare-fun d!27303 () Bool)

(assert (=> d!27303 (contains!802 (+!130 lt!50861 (tuple2!2339 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!50866)))

(declare-fun lt!51046 () Unit!3061)

(declare-fun choose!624 (ListLongMap!1519 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3061)

(assert (=> d!27303 (= lt!51046 (choose!624 lt!50861 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50866))))

(assert (=> d!27303 (contains!802 lt!50861 lt!50866)))

(assert (=> d!27303 (= (addStillContains!70 lt!50861 lt!50854 (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) lt!50866) lt!51046)))

(declare-fun bs!4169 () Bool)

(assert (= bs!4169 d!27303))

(assert (=> bs!4169 m!111241))

(assert (=> bs!4169 m!111241))

(assert (=> bs!4169 m!111243))

(declare-fun m!111495 () Bool)

(assert (=> bs!4169 m!111495))

(declare-fun m!111497 () Bool)

(assert (=> bs!4169 m!111497))

(assert (=> b!100678 d!27303))

(declare-fun d!27305 () Bool)

(declare-fun e!65727 () Bool)

(assert (=> d!27305 e!65727))

(declare-fun res!50584 () Bool)

(assert (=> d!27305 (=> res!50584 e!65727)))

(declare-fun lt!51050 () Bool)

(assert (=> d!27305 (= res!50584 (not lt!51050))))

(declare-fun lt!51047 () Bool)

(assert (=> d!27305 (= lt!51050 lt!51047)))

(declare-fun lt!51049 () Unit!3061)

(declare-fun e!65726 () Unit!3061)

(assert (=> d!27305 (= lt!51049 e!65726)))

(declare-fun c!17340 () Bool)

(assert (=> d!27305 (= c!17340 lt!51047)))

(assert (=> d!27305 (= lt!51047 (containsKey!154 (toList!775 e!65648) (ite c!17310 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972)))))))

(assert (=> d!27305 (= (contains!802 e!65648 (ite c!17310 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972)))) lt!51050)))

(declare-fun b!100942 () Bool)

(declare-fun lt!51048 () Unit!3061)

(assert (=> b!100942 (= e!65726 lt!51048)))

(assert (=> b!100942 (= lt!51048 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 e!65648) (ite c!17310 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972)))))))

(assert (=> b!100942 (isDefined!104 (getValueByKey!150 (toList!775 e!65648) (ite c!17310 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972)))))))

(declare-fun b!100943 () Bool)

(declare-fun Unit!3078 () Unit!3061)

(assert (=> b!100943 (= e!65726 Unit!3078)))

(declare-fun b!100944 () Bool)

(assert (=> b!100944 (= e!65727 (isDefined!104 (getValueByKey!150 (toList!775 e!65648) (ite c!17310 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972))))))))

(assert (= (and d!27305 c!17340) b!100942))

(assert (= (and d!27305 (not c!17340)) b!100943))

(assert (= (and d!27305 (not res!50584)) b!100944))

(declare-fun m!111499 () Bool)

(assert (=> d!27305 m!111499))

(declare-fun m!111501 () Bool)

(assert (=> b!100942 m!111501))

(declare-fun m!111503 () Bool)

(assert (=> b!100942 m!111503))

(assert (=> b!100942 m!111503))

(declare-fun m!111505 () Bool)

(assert (=> b!100942 m!111505))

(assert (=> b!100944 m!111503))

(assert (=> b!100944 m!111503))

(assert (=> b!100944 m!111505))

(assert (=> bm!10438 d!27305))

(declare-fun d!27307 () Bool)

(assert (=> d!27307 (= (map!1250 (_2!1179 lt!50956)) (getCurrentListMap!456 (_keys!4219 (_2!1179 lt!50956)) (_values!2505 (_2!1179 lt!50956)) (mask!6638 (_2!1179 lt!50956)) (extraKeys!2335 (_2!1179 lt!50956)) (zeroValue!2401 (_2!1179 lt!50956)) (minValue!2401 (_2!1179 lt!50956)) #b00000000000000000000000000000000 (defaultEntry!2522 (_2!1179 lt!50956))))))

(declare-fun bs!4170 () Bool)

(assert (= bs!4170 d!27307))

(declare-fun m!111507 () Bool)

(assert (=> bs!4170 m!111507))

(assert (=> bm!10431 d!27307))

(declare-fun lt!51059 () SeekEntryResult!258)

(declare-fun d!27309 () Bool)

(assert (=> d!27309 (and (or ((_ is Undefined!258) lt!51059) (not ((_ is Found!258) lt!51059)) (and (bvsge (index!3178 lt!51059) #b00000000000000000000000000000000) (bvslt (index!3178 lt!51059) (size!2267 (_keys!4219 newMap!16))))) (or ((_ is Undefined!258) lt!51059) ((_ is Found!258) lt!51059) (not ((_ is MissingZero!258) lt!51059)) (and (bvsge (index!3177 lt!51059) #b00000000000000000000000000000000) (bvslt (index!3177 lt!51059) (size!2267 (_keys!4219 newMap!16))))) (or ((_ is Undefined!258) lt!51059) ((_ is Found!258) lt!51059) ((_ is MissingZero!258) lt!51059) (not ((_ is MissingVacant!258) lt!51059)) (and (bvsge (index!3180 lt!51059) #b00000000000000000000000000000000) (bvslt (index!3180 lt!51059) (size!2267 (_keys!4219 newMap!16))))) (or ((_ is Undefined!258) lt!51059) (ite ((_ is Found!258) lt!51059) (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!51059)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (ite ((_ is MissingZero!258) lt!51059) (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3177 lt!51059)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!258) lt!51059) (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3180 lt!51059)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!65734 () SeekEntryResult!258)

(assert (=> d!27309 (= lt!51059 e!65734)))

(declare-fun c!17347 () Bool)

(declare-fun lt!51058 () SeekEntryResult!258)

(assert (=> d!27309 (= c!17347 (and ((_ is Intermediate!258) lt!51058) (undefined!1070 lt!51058)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4245 (_ BitVec 32)) SeekEntryResult!258)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!27309 (= lt!51058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (mask!6638 newMap!16)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(assert (=> d!27309 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27309 (= (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)) lt!51059)))

(declare-fun e!65735 () SeekEntryResult!258)

(declare-fun b!100957 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4245 (_ BitVec 32)) SeekEntryResult!258)

(assert (=> b!100957 (= e!65735 (seekKeyOrZeroReturnVacant!0 (x!13251 lt!51058) (index!3179 lt!51058) (index!3179 lt!51058) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun b!100958 () Bool)

(declare-fun c!17348 () Bool)

(declare-fun lt!51057 () (_ BitVec 64))

(assert (=> b!100958 (= c!17348 (= lt!51057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!65736 () SeekEntryResult!258)

(assert (=> b!100958 (= e!65736 e!65735)))

(declare-fun b!100959 () Bool)

(assert (=> b!100959 (= e!65734 Undefined!258)))

(declare-fun b!100960 () Bool)

(assert (=> b!100960 (= e!65735 (MissingZero!258 (index!3179 lt!51058)))))

(declare-fun b!100961 () Bool)

(assert (=> b!100961 (= e!65736 (Found!258 (index!3179 lt!51058)))))

(declare-fun b!100962 () Bool)

(assert (=> b!100962 (= e!65734 e!65736)))

(assert (=> b!100962 (= lt!51057 (select (arr!2014 (_keys!4219 newMap!16)) (index!3179 lt!51058)))))

(declare-fun c!17349 () Bool)

(assert (=> b!100962 (= c!17349 (= lt!51057 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (= (and d!27309 c!17347) b!100959))

(assert (= (and d!27309 (not c!17347)) b!100962))

(assert (= (and b!100962 c!17349) b!100961))

(assert (= (and b!100962 (not c!17349)) b!100958))

(assert (= (and b!100958 c!17348) b!100960))

(assert (= (and b!100958 (not c!17348)) b!100957))

(declare-fun m!111509 () Bool)

(assert (=> d!27309 m!111509))

(declare-fun m!111511 () Bool)

(assert (=> d!27309 m!111511))

(assert (=> d!27309 m!111069))

(declare-fun m!111513 () Bool)

(assert (=> d!27309 m!111513))

(declare-fun m!111515 () Bool)

(assert (=> d!27309 m!111515))

(declare-fun m!111517 () Bool)

(assert (=> d!27309 m!111517))

(assert (=> d!27309 m!111513))

(assert (=> d!27309 m!111069))

(declare-fun m!111519 () Bool)

(assert (=> d!27309 m!111519))

(assert (=> b!100957 m!111069))

(declare-fun m!111521 () Bool)

(assert (=> b!100957 m!111521))

(declare-fun m!111523 () Bool)

(assert (=> b!100962 m!111523))

(assert (=> bm!10423 d!27309))

(declare-fun d!27311 () Bool)

(assert (=> d!27311 (= (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (and (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100716 d!27311))

(declare-fun d!27313 () Bool)

(declare-fun lt!51062 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!105 (List!1594) (InoxSet (_ BitVec 64)))

(assert (=> d!27313 (= lt!51062 (select (content!105 Nil!1591) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun e!65741 () Bool)

(assert (=> d!27313 (= lt!51062 e!65741)))

(declare-fun res!50589 () Bool)

(assert (=> d!27313 (=> (not res!50589) (not e!65741))))

(assert (=> d!27313 (= res!50589 ((_ is Cons!1590) Nil!1591))))

(assert (=> d!27313 (= (contains!805 Nil!1591 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) lt!51062)))

(declare-fun b!100967 () Bool)

(declare-fun e!65742 () Bool)

(assert (=> b!100967 (= e!65741 e!65742)))

(declare-fun res!50590 () Bool)

(assert (=> b!100967 (=> res!50590 e!65742)))

(assert (=> b!100967 (= res!50590 (= (h!2186 Nil!1591) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!100968 () Bool)

(assert (=> b!100968 (= e!65742 (contains!805 (t!5579 Nil!1591) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (= (and d!27313 res!50589) b!100967))

(assert (= (and b!100967 (not res!50590)) b!100968))

(declare-fun m!111525 () Bool)

(assert (=> d!27313 m!111525))

(assert (=> d!27313 m!111069))

(declare-fun m!111527 () Bool)

(assert (=> d!27313 m!111527))

(assert (=> b!100968 m!111069))

(declare-fun m!111529 () Bool)

(assert (=> b!100968 m!111529))

(assert (=> b!100714 d!27313))

(declare-fun b!100977 () Bool)

(declare-fun e!65747 () (_ BitVec 32))

(assert (=> b!100977 (= e!65747 #b00000000000000000000000000000000)))

(declare-fun b!100978 () Bool)

(declare-fun e!65748 () (_ BitVec 32))

(assert (=> b!100978 (= e!65747 e!65748)))

(declare-fun c!17355 () Bool)

(assert (=> b!100978 (= c!17355 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!100980 () Bool)

(declare-fun call!10451 () (_ BitVec 32))

(assert (=> b!100980 (= e!65748 call!10451)))

(declare-fun bm!10448 () Bool)

(assert (=> bm!10448 (= call!10451 (arrayCountValidKeys!0 (_keys!4219 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun b!100979 () Bool)

(assert (=> b!100979 (= e!65748 (bvadd #b00000000000000000000000000000001 call!10451))))

(declare-fun d!27315 () Bool)

(declare-fun lt!51065 () (_ BitVec 32))

(assert (=> d!27315 (and (bvsge lt!51065 #b00000000000000000000000000000000) (bvsle lt!51065 (bvsub (size!2267 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!27315 (= lt!51065 e!65747)))

(declare-fun c!17354 () Bool)

(assert (=> d!27315 (= c!17354 (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(assert (=> d!27315 (and (bvsle #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2267 (_keys!4219 newMap!16)) (size!2267 (_keys!4219 newMap!16))))))

(assert (=> d!27315 (= (arrayCountValidKeys!0 (_keys!4219 newMap!16) #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) lt!51065)))

(assert (= (and d!27315 c!17354) b!100977))

(assert (= (and d!27315 (not c!17354)) b!100978))

(assert (= (and b!100978 c!17355) b!100979))

(assert (= (and b!100978 (not c!17355)) b!100980))

(assert (= (or b!100979 b!100980) bm!10448))

(declare-fun m!111531 () Bool)

(assert (=> b!100978 m!111531))

(assert (=> b!100978 m!111531))

(declare-fun m!111533 () Bool)

(assert (=> b!100978 m!111533))

(declare-fun m!111535 () Bool)

(assert (=> bm!10448 m!111535))

(assert (=> b!100624 d!27315))

(declare-fun d!27317 () Bool)

(declare-fun e!65750 () Bool)

(assert (=> d!27317 e!65750))

(declare-fun res!50591 () Bool)

(assert (=> d!27317 (=> res!50591 e!65750)))

(declare-fun lt!51069 () Bool)

(assert (=> d!27317 (= res!50591 (not lt!51069))))

(declare-fun lt!51066 () Bool)

(assert (=> d!27317 (= lt!51069 lt!51066)))

(declare-fun lt!51068 () Unit!3061)

(declare-fun e!65749 () Unit!3061)

(assert (=> d!27317 (= lt!51068 e!65749)))

(declare-fun c!17356 () Bool)

(assert (=> d!27317 (= c!17356 lt!51066)))

(assert (=> d!27317 (= lt!51066 (containsKey!154 (toList!775 lt!50874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27317 (= (contains!802 lt!50874 #b1000000000000000000000000000000000000000000000000000000000000000) lt!51069)))

(declare-fun b!100981 () Bool)

(declare-fun lt!51067 () Unit!3061)

(assert (=> b!100981 (= e!65749 lt!51067)))

(assert (=> b!100981 (= lt!51067 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 lt!50874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100981 (isDefined!104 (getValueByKey!150 (toList!775 lt!50874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100982 () Bool)

(declare-fun Unit!3079 () Unit!3061)

(assert (=> b!100982 (= e!65749 Unit!3079)))

(declare-fun b!100983 () Bool)

(assert (=> b!100983 (= e!65750 (isDefined!104 (getValueByKey!150 (toList!775 lt!50874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27317 c!17356) b!100981))

(assert (= (and d!27317 (not c!17356)) b!100982))

(assert (= (and d!27317 (not res!50591)) b!100983))

(declare-fun m!111537 () Bool)

(assert (=> d!27317 m!111537))

(declare-fun m!111539 () Bool)

(assert (=> b!100981 m!111539))

(declare-fun m!111541 () Bool)

(assert (=> b!100981 m!111541))

(assert (=> b!100981 m!111541))

(declare-fun m!111543 () Bool)

(assert (=> b!100981 m!111543))

(assert (=> b!100983 m!111541))

(assert (=> b!100983 m!111541))

(assert (=> b!100983 m!111543))

(assert (=> bm!10363 d!27317))

(declare-fun d!27319 () Bool)

(declare-fun res!50596 () Bool)

(declare-fun e!65755 () Bool)

(assert (=> d!27319 (=> res!50596 e!65755)))

(assert (=> d!27319 (= res!50596 (and ((_ is Cons!1589) (toList!775 lt!50764)) (= (_1!1180 (h!2185 (toList!775 lt!50764))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(assert (=> d!27319 (= (containsKey!154 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) e!65755)))

(declare-fun b!100988 () Bool)

(declare-fun e!65756 () Bool)

(assert (=> b!100988 (= e!65755 e!65756)))

(declare-fun res!50597 () Bool)

(assert (=> b!100988 (=> (not res!50597) (not e!65756))))

(assert (=> b!100988 (= res!50597 (and (or (not ((_ is Cons!1589) (toList!775 lt!50764))) (bvsle (_1!1180 (h!2185 (toList!775 lt!50764))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))) ((_ is Cons!1589) (toList!775 lt!50764)) (bvslt (_1!1180 (h!2185 (toList!775 lt!50764))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(declare-fun b!100989 () Bool)

(assert (=> b!100989 (= e!65756 (containsKey!154 (t!5578 (toList!775 lt!50764)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (= (and d!27319 (not res!50596)) b!100988))

(assert (= (and b!100988 res!50597) b!100989))

(assert (=> b!100989 m!111069))

(declare-fun m!111545 () Bool)

(assert (=> b!100989 m!111545))

(assert (=> d!27255 d!27319))

(assert (=> d!27247 d!27253))

(declare-fun d!27321 () Bool)

(assert (=> d!27321 (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) from!355 Nil!1591)))

(assert (=> d!27321 true))

(declare-fun _$71!138 () Unit!3061)

(assert (=> d!27321 (= (choose!39 (_keys!4219 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!138)))

(declare-fun bs!4171 () Bool)

(assert (= bs!4171 d!27321))

(assert (=> bs!4171 m!111067))

(assert (=> d!27247 d!27321))

(declare-fun d!27323 () Bool)

(assert (=> d!27323 (= (inRange!0 (ite c!17310 (ite c!17319 (index!3178 lt!50971) (ite c!17313 (index!3177 lt!50955) (index!3180 lt!50955))) (ite c!17315 (index!3178 lt!50951) (ite c!17311 (index!3177 lt!50957) (index!3180 lt!50957)))) (mask!6638 newMap!16)) (and (bvsge (ite c!17310 (ite c!17319 (index!3178 lt!50971) (ite c!17313 (index!3177 lt!50955) (index!3180 lt!50955))) (ite c!17315 (index!3178 lt!50951) (ite c!17311 (index!3177 lt!50957) (index!3180 lt!50957)))) #b00000000000000000000000000000000) (bvslt (ite c!17310 (ite c!17319 (index!3178 lt!50971) (ite c!17313 (index!3177 lt!50955) (index!3180 lt!50955))) (ite c!17315 (index!3178 lt!50951) (ite c!17311 (index!3177 lt!50957) (index!3180 lt!50957)))) (bvadd (mask!6638 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!10418 d!27323))

(assert (=> bm!10425 d!27241))

(declare-fun d!27325 () Bool)

(assert (=> d!27325 (= (+!130 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) lt!50966 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51072 () Unit!3061)

(declare-fun choose!625 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3061)

(assert (=> d!27325 (= lt!51072 (choose!625 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) lt!50966 (zeroValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27325 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27325 (= (lemmaChangeZeroKeyThenAddPairToListMap!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) lt!50966 (zeroValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (defaultEntry!2522 newMap!16)) lt!51072)))

(declare-fun bs!4172 () Bool)

(assert (= bs!4172 d!27325))

(assert (=> bs!4172 m!111099))

(declare-fun m!111547 () Bool)

(assert (=> bs!4172 m!111547))

(assert (=> bs!4172 m!111517))

(assert (=> bs!4172 m!111211))

(declare-fun m!111549 () Bool)

(assert (=> bs!4172 m!111549))

(assert (=> bs!4172 m!111099))

(declare-fun m!111551 () Bool)

(assert (=> bs!4172 m!111551))

(assert (=> bs!4172 m!111211))

(assert (=> b!100810 d!27325))

(declare-fun d!27327 () Bool)

(declare-fun e!65759 () Bool)

(assert (=> d!27327 e!65759))

(declare-fun c!17359 () Bool)

(assert (=> d!27327 (= c!17359 (and (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!27327 true))

(declare-fun _$29!132 () Unit!3061)

(assert (=> d!27327 (= (choose!622 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (_values!2505 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992))) (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) (zeroValue!2401 (v!2823 (underlying!337 thiss!992))) (minValue!2401 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992)))) _$29!132)))

(declare-fun b!100994 () Bool)

(assert (=> b!100994 (= e!65759 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!100995 () Bool)

(assert (=> b!100995 (= e!65759 (ite (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27327 c!17359) b!100994))

(assert (= (and d!27327 (not c!17359)) b!100995))

(assert (=> b!100994 m!111069))

(assert (=> b!100994 m!111073))

(assert (=> d!27251 d!27327))

(assert (=> d!27251 d!27237))

(assert (=> bm!10362 d!27281))

(declare-fun d!27329 () Bool)

(declare-fun e!65760 () Bool)

(assert (=> d!27329 e!65760))

(declare-fun res!50598 () Bool)

(assert (=> d!27329 (=> (not res!50598) (not e!65760))))

(declare-fun lt!51074 () ListLongMap!1519)

(assert (=> d!27329 (= res!50598 (contains!802 lt!51074 (_1!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!51076 () List!1593)

(assert (=> d!27329 (= lt!51074 (ListLongMap!1520 lt!51076))))

(declare-fun lt!51075 () Unit!3061)

(declare-fun lt!51073 () Unit!3061)

(assert (=> d!27329 (= lt!51075 lt!51073)))

(assert (=> d!27329 (= (getValueByKey!150 lt!51076 (_1!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!155 (_2!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27329 (= lt!51073 (lemmaContainsTupThenGetReturnValue!69 lt!51076 (_1!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27329 (= lt!51076 (insertStrictlySorted!72 (toList!775 call!10424) (_1!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27329 (= (+!130 call!10424 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!51074)))

(declare-fun b!100996 () Bool)

(declare-fun res!50599 () Bool)

(assert (=> b!100996 (=> (not res!50599) (not e!65760))))

(assert (=> b!100996 (= res!50599 (= (getValueByKey!150 (toList!775 lt!51074) (_1!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!155 (_2!1180 (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!100997 () Bool)

(assert (=> b!100997 (= e!65760 (contains!806 (toList!775 lt!51074) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!27329 res!50598) b!100996))

(assert (= (and b!100996 res!50599) b!100997))

(declare-fun m!111553 () Bool)

(assert (=> d!27329 m!111553))

(declare-fun m!111555 () Bool)

(assert (=> d!27329 m!111555))

(declare-fun m!111557 () Bool)

(assert (=> d!27329 m!111557))

(declare-fun m!111559 () Bool)

(assert (=> d!27329 m!111559))

(declare-fun m!111561 () Bool)

(assert (=> b!100996 m!111561))

(declare-fun m!111563 () Bool)

(assert (=> b!100997 m!111563))

(assert (=> b!100821 d!27329))

(declare-fun d!27331 () Bool)

(assert (=> d!27331 (= (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100672 d!27331))

(assert (=> b!100700 d!27249))

(declare-fun d!27333 () Bool)

(declare-fun res!50601 () Bool)

(declare-fun e!65761 () Bool)

(assert (=> d!27333 (=> res!50601 e!65761)))

(assert (=> d!27333 (= res!50601 (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(assert (=> d!27333 (= (arrayNoDuplicates!0 (_keys!4219 newMap!16) #b00000000000000000000000000000000 Nil!1591) e!65761)))

(declare-fun b!100998 () Bool)

(declare-fun e!65764 () Bool)

(declare-fun call!10452 () Bool)

(assert (=> b!100998 (= e!65764 call!10452)))

(declare-fun bm!10449 () Bool)

(declare-fun c!17360 () Bool)

(assert (=> bm!10449 (= call!10452 (arrayNoDuplicates!0 (_keys!4219 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17360 (Cons!1590 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000) Nil!1591) Nil!1591)))))

(declare-fun b!100999 () Bool)

(assert (=> b!100999 (= e!65764 call!10452)))

(declare-fun b!101000 () Bool)

(declare-fun e!65763 () Bool)

(assert (=> b!101000 (= e!65763 (contains!805 Nil!1591 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101001 () Bool)

(declare-fun e!65762 () Bool)

(assert (=> b!101001 (= e!65761 e!65762)))

(declare-fun res!50602 () Bool)

(assert (=> b!101001 (=> (not res!50602) (not e!65762))))

(assert (=> b!101001 (= res!50602 (not e!65763))))

(declare-fun res!50600 () Bool)

(assert (=> b!101001 (=> (not res!50600) (not e!65763))))

(assert (=> b!101001 (= res!50600 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101002 () Bool)

(assert (=> b!101002 (= e!65762 e!65764)))

(assert (=> b!101002 (= c!17360 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!27333 (not res!50601)) b!101001))

(assert (= (and b!101001 res!50600) b!101000))

(assert (= (and b!101001 res!50602) b!101002))

(assert (= (and b!101002 c!17360) b!100998))

(assert (= (and b!101002 (not c!17360)) b!100999))

(assert (= (or b!100998 b!100999) bm!10449))

(assert (=> bm!10449 m!111531))

(declare-fun m!111565 () Bool)

(assert (=> bm!10449 m!111565))

(assert (=> b!101000 m!111531))

(assert (=> b!101000 m!111531))

(declare-fun m!111567 () Bool)

(assert (=> b!101000 m!111567))

(assert (=> b!101001 m!111531))

(assert (=> b!101001 m!111531))

(assert (=> b!101001 m!111533))

(assert (=> b!101002 m!111531))

(assert (=> b!101002 m!111531))

(assert (=> b!101002 m!111533))

(assert (=> b!100626 d!27333))

(declare-fun d!27335 () Bool)

(declare-fun e!65767 () Bool)

(assert (=> d!27335 e!65767))

(declare-fun res!50607 () Bool)

(assert (=> d!27335 (=> (not res!50607) (not e!65767))))

(declare-fun lt!51082 () SeekEntryResult!258)

(assert (=> d!27335 (= res!50607 ((_ is Found!258) lt!51082))))

(assert (=> d!27335 (= lt!51082 (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun lt!51081 () Unit!3061)

(declare-fun choose!626 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3061)

(assert (=> d!27335 (= lt!51081 (choose!626 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27335 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27335 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)) lt!51081)))

(declare-fun b!101007 () Bool)

(declare-fun res!50608 () Bool)

(assert (=> b!101007 (=> (not res!50608) (not e!65767))))

(assert (=> b!101007 (= res!50608 (inRange!0 (index!3178 lt!51082) (mask!6638 newMap!16)))))

(declare-fun b!101008 () Bool)

(assert (=> b!101008 (= e!65767 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!51082)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> b!101008 (and (bvsge (index!3178 lt!51082) #b00000000000000000000000000000000) (bvslt (index!3178 lt!51082) (size!2267 (_keys!4219 newMap!16))))))

(assert (= (and d!27335 res!50607) b!101007))

(assert (= (and b!101007 res!50608) b!101008))

(assert (=> d!27335 m!111069))

(assert (=> d!27335 m!111305))

(assert (=> d!27335 m!111069))

(declare-fun m!111569 () Bool)

(assert (=> d!27335 m!111569))

(assert (=> d!27335 m!111517))

(declare-fun m!111571 () Bool)

(assert (=> b!101007 m!111571))

(declare-fun m!111573 () Bool)

(assert (=> b!101008 m!111573))

(assert (=> bm!10429 d!27335))

(declare-fun b!101009 () Bool)

(declare-fun e!65770 () ListLongMap!1519)

(declare-fun call!10458 () ListLongMap!1519)

(assert (=> b!101009 (= e!65770 call!10458)))

(declare-fun b!101010 () Bool)

(declare-fun e!65772 () Bool)

(declare-fun lt!51104 () ListLongMap!1519)

(assert (=> b!101010 (= e!65772 (= (apply!94 lt!51104 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 newMap!16)))))

(declare-fun b!101011 () Bool)

(declare-fun e!65769 () Bool)

(declare-fun call!10456 () Bool)

(assert (=> b!101011 (= e!65769 (not call!10456))))

(declare-fun bm!10450 () Bool)

(declare-fun call!10453 () ListLongMap!1519)

(declare-fun call!10454 () ListLongMap!1519)

(assert (=> bm!10450 (= call!10453 call!10454)))

(declare-fun b!101012 () Bool)

(declare-fun e!65775 () Bool)

(assert (=> b!101012 (= e!65775 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!17361 () Bool)

(declare-fun c!17366 () Bool)

(declare-fun call!10455 () ListLongMap!1519)

(declare-fun call!10457 () ListLongMap!1519)

(declare-fun bm!10451 () Bool)

(assert (=> bm!10451 (= call!10455 (+!130 (ite c!17366 call!10457 (ite c!17361 call!10454 call!10453)) (ite (or c!17366 c!17361) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 newMap!16)) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16)))))))

(declare-fun b!101013 () Bool)

(declare-fun e!65778 () Bool)

(assert (=> b!101013 (= e!65778 (= (apply!94 lt!51104 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)) (get!1297 (select (arr!2015 (_values!2505 newMap!16)) #b00000000000000000000000000000000) (dynLambda!372 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2268 (_values!2505 newMap!16))))))

(assert (=> b!101013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun b!101014 () Bool)

(declare-fun e!65776 () Bool)

(declare-fun e!65774 () Bool)

(assert (=> b!101014 (= e!65776 e!65774)))

(declare-fun res!50612 () Bool)

(declare-fun call!10459 () Bool)

(assert (=> b!101014 (= res!50612 call!10459)))

(assert (=> b!101014 (=> (not res!50612) (not e!65774))))

(declare-fun b!101015 () Bool)

(declare-fun e!65773 () Bool)

(assert (=> b!101015 (= e!65773 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101016 () Bool)

(declare-fun e!65779 () Bool)

(assert (=> b!101016 (= e!65779 e!65769)))

(declare-fun c!17362 () Bool)

(assert (=> b!101016 (= c!17362 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10452 () Bool)

(assert (=> bm!10452 (= call!10458 call!10455)))

(declare-fun b!101017 () Bool)

(declare-fun e!65780 () ListLongMap!1519)

(assert (=> b!101017 (= e!65780 call!10458)))

(declare-fun bm!10453 () Bool)

(assert (=> bm!10453 (= call!10459 (contains!802 lt!51104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101018 () Bool)

(declare-fun e!65777 () Unit!3061)

(declare-fun lt!51095 () Unit!3061)

(assert (=> b!101018 (= e!65777 lt!51095)))

(declare-fun lt!51091 () ListLongMap!1519)

(assert (=> b!101018 (= lt!51091 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51084 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51096 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51096 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51102 () Unit!3061)

(assert (=> b!101018 (= lt!51102 (addStillContains!70 lt!51091 lt!51084 (zeroValue!2401 newMap!16) lt!51096))))

(assert (=> b!101018 (contains!802 (+!130 lt!51091 (tuple2!2339 lt!51084 (zeroValue!2401 newMap!16))) lt!51096)))

(declare-fun lt!51098 () Unit!3061)

(assert (=> b!101018 (= lt!51098 lt!51102)))

(declare-fun lt!51099 () ListLongMap!1519)

(assert (=> b!101018 (= lt!51099 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51100 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51100 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51101 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51101 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51086 () Unit!3061)

(assert (=> b!101018 (= lt!51086 (addApplyDifferent!70 lt!51099 lt!51100 (minValue!2401 newMap!16) lt!51101))))

(assert (=> b!101018 (= (apply!94 (+!130 lt!51099 (tuple2!2339 lt!51100 (minValue!2401 newMap!16))) lt!51101) (apply!94 lt!51099 lt!51101))))

(declare-fun lt!51087 () Unit!3061)

(assert (=> b!101018 (= lt!51087 lt!51086)))

(declare-fun lt!51083 () ListLongMap!1519)

(assert (=> b!101018 (= lt!51083 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51088 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51092 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51092 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51093 () Unit!3061)

(assert (=> b!101018 (= lt!51093 (addApplyDifferent!70 lt!51083 lt!51088 (zeroValue!2401 newMap!16) lt!51092))))

(assert (=> b!101018 (= (apply!94 (+!130 lt!51083 (tuple2!2339 lt!51088 (zeroValue!2401 newMap!16))) lt!51092) (apply!94 lt!51083 lt!51092))))

(declare-fun lt!51103 () Unit!3061)

(assert (=> b!101018 (= lt!51103 lt!51093)))

(declare-fun lt!51094 () ListLongMap!1519)

(assert (=> b!101018 (= lt!51094 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51089 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51089 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51090 () (_ BitVec 64))

(assert (=> b!101018 (= lt!51090 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101018 (= lt!51095 (addApplyDifferent!70 lt!51094 lt!51089 (minValue!2401 newMap!16) lt!51090))))

(assert (=> b!101018 (= (apply!94 (+!130 lt!51094 (tuple2!2339 lt!51089 (minValue!2401 newMap!16))) lt!51090) (apply!94 lt!51094 lt!51090))))

(declare-fun d!27337 () Bool)

(assert (=> d!27337 e!65779))

(declare-fun res!50616 () Bool)

(assert (=> d!27337 (=> (not res!50616) (not e!65779))))

(assert (=> d!27337 (= res!50616 (or (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))))

(declare-fun lt!51097 () ListLongMap!1519)

(assert (=> d!27337 (= lt!51104 lt!51097)))

(declare-fun lt!51085 () Unit!3061)

(assert (=> d!27337 (= lt!51085 e!65777)))

(declare-fun c!17363 () Bool)

(assert (=> d!27337 (= c!17363 e!65773)))

(declare-fun res!50617 () Bool)

(assert (=> d!27337 (=> (not res!50617) (not e!65773))))

(assert (=> d!27337 (= res!50617 (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun e!65768 () ListLongMap!1519)

(assert (=> d!27337 (= lt!51097 e!65768)))

(assert (=> d!27337 (= c!17366 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27337 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27337 (= (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51104)))

(declare-fun b!101019 () Bool)

(declare-fun Unit!3080 () Unit!3061)

(assert (=> b!101019 (= e!65777 Unit!3080)))

(declare-fun b!101020 () Bool)

(assert (=> b!101020 (= e!65776 (not call!10459))))

(declare-fun b!101021 () Bool)

(assert (=> b!101021 (= e!65780 call!10453)))

(declare-fun bm!10454 () Bool)

(assert (=> bm!10454 (= call!10457 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101022 () Bool)

(assert (=> b!101022 (= e!65768 (+!130 call!10455 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16))))))

(declare-fun bm!10455 () Bool)

(assert (=> bm!10455 (= call!10456 (contains!802 lt!51104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101023 () Bool)

(assert (=> b!101023 (= e!65774 (= (apply!94 lt!51104 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 newMap!16)))))

(declare-fun b!101024 () Bool)

(declare-fun c!17364 () Bool)

(assert (=> b!101024 (= c!17364 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101024 (= e!65770 e!65780)))

(declare-fun b!101025 () Bool)

(declare-fun res!50610 () Bool)

(assert (=> b!101025 (=> (not res!50610) (not e!65779))))

(assert (=> b!101025 (= res!50610 e!65776)))

(declare-fun c!17365 () Bool)

(assert (=> b!101025 (= c!17365 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101026 () Bool)

(assert (=> b!101026 (= e!65768 e!65770)))

(assert (=> b!101026 (= c!17361 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101027 () Bool)

(declare-fun res!50611 () Bool)

(assert (=> b!101027 (=> (not res!50611) (not e!65779))))

(declare-fun e!65771 () Bool)

(assert (=> b!101027 (= res!50611 e!65771)))

(declare-fun res!50614 () Bool)

(assert (=> b!101027 (=> res!50614 e!65771)))

(assert (=> b!101027 (= res!50614 (not e!65775))))

(declare-fun res!50609 () Bool)

(assert (=> b!101027 (=> (not res!50609) (not e!65775))))

(assert (=> b!101027 (= res!50609 (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun bm!10456 () Bool)

(assert (=> bm!10456 (= call!10454 call!10457)))

(declare-fun b!101028 () Bool)

(assert (=> b!101028 (= e!65769 e!65772)))

(declare-fun res!50613 () Bool)

(assert (=> b!101028 (= res!50613 call!10456)))

(assert (=> b!101028 (=> (not res!50613) (not e!65772))))

(declare-fun b!101029 () Bool)

(assert (=> b!101029 (= e!65771 e!65778)))

(declare-fun res!50615 () Bool)

(assert (=> b!101029 (=> (not res!50615) (not e!65778))))

(assert (=> b!101029 (= res!50615 (contains!802 lt!51104 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(assert (= (and d!27337 c!17366) b!101022))

(assert (= (and d!27337 (not c!17366)) b!101026))

(assert (= (and b!101026 c!17361) b!101009))

(assert (= (and b!101026 (not c!17361)) b!101024))

(assert (= (and b!101024 c!17364) b!101017))

(assert (= (and b!101024 (not c!17364)) b!101021))

(assert (= (or b!101017 b!101021) bm!10450))

(assert (= (or b!101009 bm!10450) bm!10456))

(assert (= (or b!101009 b!101017) bm!10452))

(assert (= (or b!101022 bm!10456) bm!10454))

(assert (= (or b!101022 bm!10452) bm!10451))

(assert (= (and d!27337 res!50617) b!101015))

(assert (= (and d!27337 c!17363) b!101018))

(assert (= (and d!27337 (not c!17363)) b!101019))

(assert (= (and d!27337 res!50616) b!101027))

(assert (= (and b!101027 res!50609) b!101012))

(assert (= (and b!101027 (not res!50614)) b!101029))

(assert (= (and b!101029 res!50615) b!101013))

(assert (= (and b!101027 res!50611) b!101025))

(assert (= (and b!101025 c!17365) b!101014))

(assert (= (and b!101025 (not c!17365)) b!101020))

(assert (= (and b!101014 res!50612) b!101023))

(assert (= (or b!101014 b!101020) bm!10453))

(assert (= (and b!101025 res!50610) b!101016))

(assert (= (and b!101016 c!17362) b!101028))

(assert (= (and b!101016 (not c!17362)) b!101011))

(assert (= (and b!101028 res!50613) b!101010))

(assert (= (or b!101028 b!101011) bm!10455))

(declare-fun b_lambda!4513 () Bool)

(assert (=> (not b_lambda!4513) (not b!101013)))

(declare-fun tb!1965 () Bool)

(declare-fun t!5593 () Bool)

(assert (=> (and b!100481 (= (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) (defaultEntry!2522 newMap!16)) t!5593) tb!1965))

(declare-fun result!3327 () Bool)

(assert (=> tb!1965 (= result!3327 tp_is_empty!2641)))

(assert (=> b!101013 t!5593))

(declare-fun b_and!6209 () Bool)

(assert (= b_and!6205 (and (=> t!5593 result!3327) b_and!6209)))

(declare-fun t!5595 () Bool)

(declare-fun tb!1967 () Bool)

(assert (=> (and b!100484 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 newMap!16)) t!5595) tb!1967))

(declare-fun result!3329 () Bool)

(assert (= result!3329 result!3327))

(assert (=> b!101013 t!5595))

(declare-fun b_and!6211 () Bool)

(assert (= b_and!6207 (and (=> t!5595 result!3329) b_and!6211)))

(declare-fun m!111575 () Bool)

(assert (=> bm!10454 m!111575))

(declare-fun m!111577 () Bool)

(assert (=> bm!10451 m!111577))

(assert (=> b!101015 m!111531))

(assert (=> b!101015 m!111531))

(assert (=> b!101015 m!111533))

(declare-fun m!111579 () Bool)

(assert (=> b!101022 m!111579))

(declare-fun m!111581 () Bool)

(assert (=> b!101023 m!111581))

(assert (=> b!101012 m!111531))

(assert (=> b!101012 m!111531))

(assert (=> b!101012 m!111533))

(assert (=> d!27337 m!111517))

(declare-fun m!111583 () Bool)

(assert (=> b!101010 m!111583))

(declare-fun m!111585 () Bool)

(assert (=> bm!10453 m!111585))

(assert (=> b!101018 m!111575))

(declare-fun m!111587 () Bool)

(assert (=> b!101018 m!111587))

(assert (=> b!101018 m!111531))

(declare-fun m!111589 () Bool)

(assert (=> b!101018 m!111589))

(declare-fun m!111591 () Bool)

(assert (=> b!101018 m!111591))

(declare-fun m!111593 () Bool)

(assert (=> b!101018 m!111593))

(declare-fun m!111595 () Bool)

(assert (=> b!101018 m!111595))

(declare-fun m!111597 () Bool)

(assert (=> b!101018 m!111597))

(declare-fun m!111599 () Bool)

(assert (=> b!101018 m!111599))

(declare-fun m!111601 () Bool)

(assert (=> b!101018 m!111601))

(assert (=> b!101018 m!111587))

(declare-fun m!111603 () Bool)

(assert (=> b!101018 m!111603))

(declare-fun m!111605 () Bool)

(assert (=> b!101018 m!111605))

(declare-fun m!111607 () Bool)

(assert (=> b!101018 m!111607))

(declare-fun m!111609 () Bool)

(assert (=> b!101018 m!111609))

(assert (=> b!101018 m!111599))

(assert (=> b!101018 m!111607))

(declare-fun m!111611 () Bool)

(assert (=> b!101018 m!111611))

(declare-fun m!111613 () Bool)

(assert (=> b!101018 m!111613))

(declare-fun m!111615 () Bool)

(assert (=> b!101018 m!111615))

(assert (=> b!101018 m!111593))

(declare-fun m!111617 () Bool)

(assert (=> bm!10455 m!111617))

(assert (=> b!101013 m!111531))

(declare-fun m!111619 () Bool)

(assert (=> b!101013 m!111619))

(declare-fun m!111621 () Bool)

(assert (=> b!101013 m!111621))

(assert (=> b!101013 m!111531))

(declare-fun m!111623 () Bool)

(assert (=> b!101013 m!111623))

(assert (=> b!101013 m!111623))

(assert (=> b!101013 m!111621))

(declare-fun m!111625 () Bool)

(assert (=> b!101013 m!111625))

(assert (=> b!101029 m!111531))

(assert (=> b!101029 m!111531))

(declare-fun m!111627 () Bool)

(assert (=> b!101029 m!111627))

(assert (=> b!100818 d!27337))

(assert (=> b!100675 d!27331))

(declare-fun d!27339 () Bool)

(assert (=> d!27339 (= (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100868 d!27339))

(declare-fun d!27341 () Bool)

(assert (=> d!27341 (= (apply!94 lt!50874 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1302 (getValueByKey!150 (toList!775 lt!50874) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4173 () Bool)

(assert (= bs!4173 d!27341))

(assert (=> bs!4173 m!111217))

(declare-fun m!111629 () Bool)

(assert (=> bs!4173 m!111629))

(assert (=> bs!4173 m!111629))

(declare-fun m!111631 () Bool)

(assert (=> bs!4173 m!111631))

(assert (=> b!100673 d!27341))

(declare-fun d!27343 () Bool)

(declare-fun c!17367 () Bool)

(assert (=> d!27343 (= c!17367 ((_ is ValueCellFull!977) (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!65781 () V!3169)

(assert (=> d!27343 (= (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!65781)))

(declare-fun b!101030 () Bool)

(assert (=> b!101030 (= e!65781 (get!1300 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101031 () Bool)

(assert (=> b!101031 (= e!65781 (get!1301 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27343 c!17367) b!101030))

(assert (= (and d!27343 (not c!17367)) b!101031))

(assert (=> b!101030 m!111263))

(assert (=> b!101030 m!111097))

(declare-fun m!111633 () Bool)

(assert (=> b!101030 m!111633))

(assert (=> b!101031 m!111263))

(assert (=> b!101031 m!111097))

(declare-fun m!111635 () Bool)

(assert (=> b!101031 m!111635))

(assert (=> b!100673 d!27343))

(declare-fun d!27345 () Bool)

(declare-fun e!65783 () Bool)

(assert (=> d!27345 e!65783))

(declare-fun res!50618 () Bool)

(assert (=> d!27345 (=> res!50618 e!65783)))

(declare-fun lt!51108 () Bool)

(assert (=> d!27345 (= res!50618 (not lt!51108))))

(declare-fun lt!51105 () Bool)

(assert (=> d!27345 (= lt!51108 lt!51105)))

(declare-fun lt!51107 () Unit!3061)

(declare-fun e!65782 () Unit!3061)

(assert (=> d!27345 (= lt!51107 e!65782)))

(declare-fun c!17368 () Bool)

(assert (=> d!27345 (= c!17368 lt!51105)))

(assert (=> d!27345 (= lt!51105 (containsKey!154 (toList!775 lt!50874) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!27345 (= (contains!802 lt!50874 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!51108)))

(declare-fun b!101032 () Bool)

(declare-fun lt!51106 () Unit!3061)

(assert (=> b!101032 (= e!65782 lt!51106)))

(assert (=> b!101032 (= lt!51106 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 lt!50874) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101032 (isDefined!104 (getValueByKey!150 (toList!775 lt!50874) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101033 () Bool)

(declare-fun Unit!3081 () Unit!3061)

(assert (=> b!101033 (= e!65782 Unit!3081)))

(declare-fun b!101034 () Bool)

(assert (=> b!101034 (= e!65783 (isDefined!104 (getValueByKey!150 (toList!775 lt!50874) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!27345 c!17368) b!101032))

(assert (= (and d!27345 (not c!17368)) b!101033))

(assert (= (and d!27345 (not res!50618)) b!101034))

(assert (=> d!27345 m!111217))

(declare-fun m!111637 () Bool)

(assert (=> d!27345 m!111637))

(assert (=> b!101032 m!111217))

(declare-fun m!111639 () Bool)

(assert (=> b!101032 m!111639))

(assert (=> b!101032 m!111217))

(assert (=> b!101032 m!111629))

(assert (=> b!101032 m!111629))

(declare-fun m!111641 () Bool)

(assert (=> b!101032 m!111641))

(assert (=> b!101034 m!111217))

(assert (=> b!101034 m!111629))

(assert (=> b!101034 m!111629))

(assert (=> b!101034 m!111641))

(assert (=> b!100689 d!27345))

(declare-fun d!27347 () Bool)

(assert (=> d!27347 (= (+!130 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) lt!50950 (zeroValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51111 () Unit!3061)

(declare-fun choose!627 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3061)

(assert (=> d!27347 (= lt!51111 (choose!627 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) lt!50950 (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27347 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27347 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) lt!50950 (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)) lt!51111)))

(declare-fun bs!4174 () Bool)

(assert (= bs!4174 d!27347))

(assert (=> bs!4174 m!111211))

(assert (=> bs!4174 m!111211))

(declare-fun m!111643 () Bool)

(assert (=> bs!4174 m!111643))

(assert (=> bs!4174 m!111517))

(assert (=> bs!4174 m!111099))

(declare-fun m!111645 () Bool)

(assert (=> bs!4174 m!111645))

(assert (=> bs!4174 m!111099))

(declare-fun m!111647 () Bool)

(assert (=> bs!4174 m!111647))

(assert (=> b!100816 d!27347))

(declare-fun d!27349 () Bool)

(assert (=> d!27349 (= (get!1301 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100857 d!27349))

(declare-fun d!27351 () Bool)

(declare-fun isEmpty!367 (Option!156) Bool)

(assert (=> d!27351 (= (isDefined!104 (getValueByKey!150 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))) (not (isEmpty!367 (getValueByKey!150 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))))

(declare-fun bs!4175 () Bool)

(assert (= bs!4175 d!27351))

(assert (=> bs!4175 m!111287))

(declare-fun m!111649 () Bool)

(assert (=> bs!4175 m!111649))

(assert (=> b!100725 d!27351))

(declare-fun b!101043 () Bool)

(declare-fun e!65788 () Option!156)

(assert (=> b!101043 (= e!65788 (Some!155 (_2!1180 (h!2185 (toList!775 lt!50764)))))))

(declare-fun b!101044 () Bool)

(declare-fun e!65789 () Option!156)

(assert (=> b!101044 (= e!65788 e!65789)))

(declare-fun c!17374 () Bool)

(assert (=> b!101044 (= c!17374 (and ((_ is Cons!1589) (toList!775 lt!50764)) (not (= (_1!1180 (h!2185 (toList!775 lt!50764))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))))

(declare-fun b!101045 () Bool)

(assert (=> b!101045 (= e!65789 (getValueByKey!150 (t!5578 (toList!775 lt!50764)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!101046 () Bool)

(assert (=> b!101046 (= e!65789 None!154)))

(declare-fun d!27353 () Bool)

(declare-fun c!17373 () Bool)

(assert (=> d!27353 (= c!17373 (and ((_ is Cons!1589) (toList!775 lt!50764)) (= (_1!1180 (h!2185 (toList!775 lt!50764))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(assert (=> d!27353 (= (getValueByKey!150 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) e!65788)))

(assert (= (and d!27353 c!17373) b!101043))

(assert (= (and d!27353 (not c!17373)) b!101044))

(assert (= (and b!101044 c!17374) b!101045))

(assert (= (and b!101044 (not c!17374)) b!101046))

(assert (=> b!101045 m!111069))

(declare-fun m!111651 () Bool)

(assert (=> b!101045 m!111651))

(assert (=> b!100725 d!27353))

(declare-fun d!27355 () Bool)

(declare-fun res!50619 () Bool)

(declare-fun e!65790 () Bool)

(assert (=> d!27355 (=> (not res!50619) (not e!65790))))

(assert (=> d!27355 (= res!50619 (simpleValid!70 (v!2823 (underlying!337 thiss!992))))))

(assert (=> d!27355 (= (valid!399 (v!2823 (underlying!337 thiss!992))) e!65790)))

(declare-fun b!101047 () Bool)

(declare-fun res!50620 () Bool)

(assert (=> b!101047 (=> (not res!50620) (not e!65790))))

(assert (=> b!101047 (= res!50620 (= (arrayCountValidKeys!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000 (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))) (_size!480 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!101048 () Bool)

(declare-fun res!50621 () Bool)

(assert (=> b!101048 (=> (not res!50621) (not e!65790))))

(assert (=> b!101048 (= res!50621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!101049 () Bool)

(assert (=> b!101049 (= e!65790 (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) #b00000000000000000000000000000000 Nil!1591))))

(assert (= (and d!27355 res!50619) b!101047))

(assert (= (and b!101047 res!50620) b!101048))

(assert (= (and b!101048 res!50621) b!101049))

(declare-fun m!111653 () Bool)

(assert (=> d!27355 m!111653))

(declare-fun m!111655 () Bool)

(assert (=> b!101047 m!111655))

(assert (=> b!101048 m!111081))

(declare-fun m!111657 () Bool)

(assert (=> b!101049 m!111657))

(assert (=> d!27265 d!27355))

(assert (=> b!100832 d!27309))

(declare-fun d!27357 () Bool)

(assert (=> d!27357 (isDefined!104 (getValueByKey!150 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun lt!51114 () Unit!3061)

(declare-fun choose!628 (List!1593 (_ BitVec 64)) Unit!3061)

(assert (=> d!27357 (= lt!51114 (choose!628 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun e!65793 () Bool)

(assert (=> d!27357 e!65793))

(declare-fun res!50624 () Bool)

(assert (=> d!27357 (=> (not res!50624) (not e!65793))))

(declare-fun isStrictlySorted!301 (List!1593) Bool)

(assert (=> d!27357 (= res!50624 (isStrictlySorted!301 (toList!775 lt!50764)))))

(assert (=> d!27357 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) lt!51114)))

(declare-fun b!101052 () Bool)

(assert (=> b!101052 (= e!65793 (containsKey!154 (toList!775 lt!50764) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (= (and d!27357 res!50624) b!101052))

(assert (=> d!27357 m!111069))

(assert (=> d!27357 m!111287))

(assert (=> d!27357 m!111287))

(assert (=> d!27357 m!111289))

(assert (=> d!27357 m!111069))

(declare-fun m!111659 () Bool)

(assert (=> d!27357 m!111659))

(declare-fun m!111661 () Bool)

(assert (=> d!27357 m!111661))

(assert (=> b!101052 m!111069))

(assert (=> b!101052 m!111283))

(assert (=> b!100723 d!27357))

(assert (=> b!100723 d!27351))

(assert (=> b!100723 d!27353))

(declare-fun d!27359 () Bool)

(declare-fun e!65795 () Bool)

(assert (=> d!27359 e!65795))

(declare-fun res!50625 () Bool)

(assert (=> d!27359 (=> res!50625 e!65795)))

(declare-fun lt!51118 () Bool)

(assert (=> d!27359 (= res!50625 (not lt!51118))))

(declare-fun lt!51115 () Bool)

(assert (=> d!27359 (= lt!51118 lt!51115)))

(declare-fun lt!51117 () Unit!3061)

(declare-fun e!65794 () Unit!3061)

(assert (=> d!27359 (= lt!51117 e!65794)))

(declare-fun c!17375 () Bool)

(assert (=> d!27359 (= c!17375 lt!51115)))

(assert (=> d!27359 (= lt!51115 (containsKey!154 (toList!775 lt!50874) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27359 (= (contains!802 lt!50874 #b0000000000000000000000000000000000000000000000000000000000000000) lt!51118)))

(declare-fun b!101053 () Bool)

(declare-fun lt!51116 () Unit!3061)

(assert (=> b!101053 (= e!65794 lt!51116)))

(assert (=> b!101053 (= lt!51116 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 lt!50874) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101053 (isDefined!104 (getValueByKey!150 (toList!775 lt!50874) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101054 () Bool)

(declare-fun Unit!3082 () Unit!3061)

(assert (=> b!101054 (= e!65794 Unit!3082)))

(declare-fun b!101055 () Bool)

(assert (=> b!101055 (= e!65795 (isDefined!104 (getValueByKey!150 (toList!775 lt!50874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27359 c!17375) b!101053))

(assert (= (and d!27359 (not c!17375)) b!101054))

(assert (= (and d!27359 (not res!50625)) b!101055))

(declare-fun m!111663 () Bool)

(assert (=> d!27359 m!111663))

(declare-fun m!111665 () Bool)

(assert (=> b!101053 m!111665))

(declare-fun m!111667 () Bool)

(assert (=> b!101053 m!111667))

(assert (=> b!101053 m!111667))

(declare-fun m!111669 () Bool)

(assert (=> b!101053 m!111669))

(assert (=> b!101055 m!111667))

(assert (=> b!101055 m!111667))

(assert (=> b!101055 m!111669))

(assert (=> bm!10361 d!27359))

(assert (=> d!27241 d!27337))

(assert (=> b!100715 d!27311))

(declare-fun b!101056 () Bool)

(declare-fun e!65798 () ListLongMap!1519)

(declare-fun call!10465 () ListLongMap!1519)

(assert (=> b!101056 (= e!65798 call!10465)))

(declare-fun lt!51140 () ListLongMap!1519)

(declare-fun e!65800 () Bool)

(declare-fun b!101057 () Bool)

(assert (=> b!101057 (= e!65800 (= (apply!94 lt!51140 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16))))))

(declare-fun b!101058 () Bool)

(declare-fun e!65797 () Bool)

(declare-fun call!10463 () Bool)

(assert (=> b!101058 (= e!65797 (not call!10463))))

(declare-fun bm!10457 () Bool)

(declare-fun call!10460 () ListLongMap!1519)

(declare-fun call!10461 () ListLongMap!1519)

(assert (=> bm!10457 (= call!10460 call!10461)))

(declare-fun b!101059 () Bool)

(declare-fun e!65803 () Bool)

(assert (=> b!101059 (= e!65803 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun call!10462 () ListLongMap!1519)

(declare-fun call!10464 () ListLongMap!1519)

(declare-fun c!17376 () Bool)

(declare-fun c!17381 () Bool)

(declare-fun bm!10458 () Bool)

(assert (=> bm!10458 (= call!10462 (+!130 (ite c!17381 call!10464 (ite c!17376 call!10461 call!10460)) (ite (or c!17381 c!17376) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16))))))))

(declare-fun e!65806 () Bool)

(declare-fun b!101060 () Bool)

(assert (=> b!101060 (= e!65806 (= (apply!94 lt!51140 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)) (get!1297 (select (arr!2015 (ite c!17308 (_values!2505 newMap!16) lt!50968)) #b00000000000000000000000000000000) (dynLambda!372 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101060 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2268 (ite c!17308 (_values!2505 newMap!16) lt!50968))))))

(assert (=> b!101060 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun b!101061 () Bool)

(declare-fun e!65804 () Bool)

(declare-fun e!65802 () Bool)

(assert (=> b!101061 (= e!65804 e!65802)))

(declare-fun res!50629 () Bool)

(declare-fun call!10466 () Bool)

(assert (=> b!101061 (= res!50629 call!10466)))

(assert (=> b!101061 (=> (not res!50629) (not e!65802))))

(declare-fun b!101062 () Bool)

(declare-fun e!65801 () Bool)

(assert (=> b!101062 (= e!65801 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101063 () Bool)

(declare-fun e!65807 () Bool)

(assert (=> b!101063 (= e!65807 e!65797)))

(declare-fun c!17377 () Bool)

(assert (=> b!101063 (= c!17377 (not (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10459 () Bool)

(assert (=> bm!10459 (= call!10465 call!10462)))

(declare-fun b!101064 () Bool)

(declare-fun e!65808 () ListLongMap!1519)

(assert (=> b!101064 (= e!65808 call!10465)))

(declare-fun bm!10460 () Bool)

(assert (=> bm!10460 (= call!10466 (contains!802 lt!51140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101065 () Bool)

(declare-fun e!65805 () Unit!3061)

(declare-fun lt!51131 () Unit!3061)

(assert (=> b!101065 (= e!65805 lt!51131)))

(declare-fun lt!51127 () ListLongMap!1519)

(assert (=> b!101065 (= lt!51127 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51120 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51132 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51132 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51138 () Unit!3061)

(assert (=> b!101065 (= lt!51138 (addStillContains!70 lt!51127 lt!51120 (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) lt!51132))))

(assert (=> b!101065 (contains!802 (+!130 lt!51127 (tuple2!2339 lt!51120 (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)))) lt!51132)))

(declare-fun lt!51134 () Unit!3061)

(assert (=> b!101065 (= lt!51134 lt!51138)))

(declare-fun lt!51135 () ListLongMap!1519)

(assert (=> b!101065 (= lt!51135 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51136 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51136 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51137 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51137 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51122 () Unit!3061)

(assert (=> b!101065 (= lt!51122 (addApplyDifferent!70 lt!51135 lt!51136 (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) lt!51137))))

(assert (=> b!101065 (= (apply!94 (+!130 lt!51135 (tuple2!2339 lt!51136 (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)))) lt!51137) (apply!94 lt!51135 lt!51137))))

(declare-fun lt!51123 () Unit!3061)

(assert (=> b!101065 (= lt!51123 lt!51122)))

(declare-fun lt!51119 () ListLongMap!1519)

(assert (=> b!101065 (= lt!51119 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51124 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51128 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51128 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51129 () Unit!3061)

(assert (=> b!101065 (= lt!51129 (addApplyDifferent!70 lt!51119 lt!51124 (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) lt!51128))))

(assert (=> b!101065 (= (apply!94 (+!130 lt!51119 (tuple2!2339 lt!51124 (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)))) lt!51128) (apply!94 lt!51119 lt!51128))))

(declare-fun lt!51139 () Unit!3061)

(assert (=> b!101065 (= lt!51139 lt!51129)))

(declare-fun lt!51130 () ListLongMap!1519)

(assert (=> b!101065 (= lt!51130 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51125 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51125 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51126 () (_ BitVec 64))

(assert (=> b!101065 (= lt!51126 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101065 (= lt!51131 (addApplyDifferent!70 lt!51130 lt!51125 (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) lt!51126))))

(assert (=> b!101065 (= (apply!94 (+!130 lt!51130 (tuple2!2339 lt!51125 (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)))) lt!51126) (apply!94 lt!51130 lt!51126))))

(declare-fun d!27361 () Bool)

(assert (=> d!27361 e!65807))

(declare-fun res!50633 () Bool)

(assert (=> d!27361 (=> (not res!50633) (not e!65807))))

(assert (=> d!27361 (= res!50633 (or (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))))

(declare-fun lt!51133 () ListLongMap!1519)

(assert (=> d!27361 (= lt!51140 lt!51133)))

(declare-fun lt!51121 () Unit!3061)

(assert (=> d!27361 (= lt!51121 e!65805)))

(declare-fun c!17378 () Bool)

(assert (=> d!27361 (= c!17378 e!65801)))

(declare-fun res!50634 () Bool)

(assert (=> d!27361 (=> (not res!50634) (not e!65801))))

(assert (=> d!27361 (= res!50634 (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun e!65796 () ListLongMap!1519)

(assert (=> d!27361 (= lt!51133 e!65796)))

(assert (=> d!27361 (= c!17381 (and (not (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27361 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27361 (= (getCurrentListMap!456 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51140)))

(declare-fun b!101066 () Bool)

(declare-fun Unit!3083 () Unit!3061)

(assert (=> b!101066 (= e!65805 Unit!3083)))

(declare-fun b!101067 () Bool)

(assert (=> b!101067 (= e!65804 (not call!10466))))

(declare-fun b!101068 () Bool)

(assert (=> b!101068 (= e!65808 call!10460)))

(declare-fun bm!10461 () Bool)

(assert (=> bm!10461 (= call!10464 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite c!17308 (_values!2505 newMap!16) lt!50968) (mask!6638 newMap!16) (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101069 () Bool)

(assert (=> b!101069 (= e!65796 (+!130 call!10462 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17308 (ite c!17317 (minValue!2401 newMap!16) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)))))))

(declare-fun bm!10462 () Bool)

(assert (=> bm!10462 (= call!10463 (contains!802 lt!51140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101070 () Bool)

(assert (=> b!101070 (= e!65802 (= (apply!94 lt!51140 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!17308 c!17317) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16))))))

(declare-fun b!101071 () Bool)

(declare-fun c!17379 () Bool)

(assert (=> b!101071 (= c!17379 (and (not (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101071 (= e!65798 e!65808)))

(declare-fun b!101072 () Bool)

(declare-fun res!50627 () Bool)

(assert (=> b!101072 (=> (not res!50627) (not e!65807))))

(assert (=> b!101072 (= res!50627 e!65804)))

(declare-fun c!17380 () Bool)

(assert (=> b!101072 (= c!17380 (not (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101073 () Bool)

(assert (=> b!101073 (= e!65796 e!65798)))

(assert (=> b!101073 (= c!17376 (and (not (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!17308 (ite c!17317 lt!50966 lt!50950) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101074 () Bool)

(declare-fun res!50628 () Bool)

(assert (=> b!101074 (=> (not res!50628) (not e!65807))))

(declare-fun e!65799 () Bool)

(assert (=> b!101074 (= res!50628 e!65799)))

(declare-fun res!50631 () Bool)

(assert (=> b!101074 (=> res!50631 e!65799)))

(assert (=> b!101074 (= res!50631 (not e!65803))))

(declare-fun res!50626 () Bool)

(assert (=> b!101074 (=> (not res!50626) (not e!65803))))

(assert (=> b!101074 (= res!50626 (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun bm!10463 () Bool)

(assert (=> bm!10463 (= call!10461 call!10464)))

(declare-fun b!101075 () Bool)

(assert (=> b!101075 (= e!65797 e!65800)))

(declare-fun res!50630 () Bool)

(assert (=> b!101075 (= res!50630 call!10463)))

(assert (=> b!101075 (=> (not res!50630) (not e!65800))))

(declare-fun b!101076 () Bool)

(assert (=> b!101076 (= e!65799 e!65806)))

(declare-fun res!50632 () Bool)

(assert (=> b!101076 (=> (not res!50632) (not e!65806))))

(assert (=> b!101076 (= res!50632 (contains!802 lt!51140 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(assert (= (and d!27361 c!17381) b!101069))

(assert (= (and d!27361 (not c!17381)) b!101073))

(assert (= (and b!101073 c!17376) b!101056))

(assert (= (and b!101073 (not c!17376)) b!101071))

(assert (= (and b!101071 c!17379) b!101064))

(assert (= (and b!101071 (not c!17379)) b!101068))

(assert (= (or b!101064 b!101068) bm!10457))

(assert (= (or b!101056 bm!10457) bm!10463))

(assert (= (or b!101056 b!101064) bm!10459))

(assert (= (or b!101069 bm!10463) bm!10461))

(assert (= (or b!101069 bm!10459) bm!10458))

(assert (= (and d!27361 res!50634) b!101062))

(assert (= (and d!27361 c!17378) b!101065))

(assert (= (and d!27361 (not c!17378)) b!101066))

(assert (= (and d!27361 res!50633) b!101074))

(assert (= (and b!101074 res!50626) b!101059))

(assert (= (and b!101074 (not res!50631)) b!101076))

(assert (= (and b!101076 res!50632) b!101060))

(assert (= (and b!101074 res!50628) b!101072))

(assert (= (and b!101072 c!17380) b!101061))

(assert (= (and b!101072 (not c!17380)) b!101067))

(assert (= (and b!101061 res!50629) b!101070))

(assert (= (or b!101061 b!101067) bm!10460))

(assert (= (and b!101072 res!50627) b!101063))

(assert (= (and b!101063 c!17377) b!101075))

(assert (= (and b!101063 (not c!17377)) b!101058))

(assert (= (and b!101075 res!50630) b!101057))

(assert (= (or b!101075 b!101058) bm!10462))

(declare-fun b_lambda!4515 () Bool)

(assert (=> (not b_lambda!4515) (not b!101060)))

(assert (=> b!101060 t!5593))

(declare-fun b_and!6213 () Bool)

(assert (= b_and!6209 (and (=> t!5593 result!3327) b_and!6213)))

(assert (=> b!101060 t!5595))

(declare-fun b_and!6215 () Bool)

(assert (= b_and!6211 (and (=> t!5595 result!3329) b_and!6215)))

(declare-fun m!111671 () Bool)

(assert (=> bm!10461 m!111671))

(declare-fun m!111673 () Bool)

(assert (=> bm!10458 m!111673))

(assert (=> b!101062 m!111531))

(assert (=> b!101062 m!111531))

(assert (=> b!101062 m!111533))

(declare-fun m!111675 () Bool)

(assert (=> b!101069 m!111675))

(declare-fun m!111677 () Bool)

(assert (=> b!101070 m!111677))

(assert (=> b!101059 m!111531))

(assert (=> b!101059 m!111531))

(assert (=> b!101059 m!111533))

(assert (=> d!27361 m!111517))

(declare-fun m!111679 () Bool)

(assert (=> b!101057 m!111679))

(declare-fun m!111681 () Bool)

(assert (=> bm!10460 m!111681))

(assert (=> b!101065 m!111671))

(declare-fun m!111683 () Bool)

(assert (=> b!101065 m!111683))

(assert (=> b!101065 m!111531))

(declare-fun m!111685 () Bool)

(assert (=> b!101065 m!111685))

(declare-fun m!111687 () Bool)

(assert (=> b!101065 m!111687))

(declare-fun m!111689 () Bool)

(assert (=> b!101065 m!111689))

(declare-fun m!111691 () Bool)

(assert (=> b!101065 m!111691))

(declare-fun m!111693 () Bool)

(assert (=> b!101065 m!111693))

(declare-fun m!111695 () Bool)

(assert (=> b!101065 m!111695))

(declare-fun m!111697 () Bool)

(assert (=> b!101065 m!111697))

(assert (=> b!101065 m!111683))

(declare-fun m!111699 () Bool)

(assert (=> b!101065 m!111699))

(declare-fun m!111701 () Bool)

(assert (=> b!101065 m!111701))

(declare-fun m!111703 () Bool)

(assert (=> b!101065 m!111703))

(declare-fun m!111705 () Bool)

(assert (=> b!101065 m!111705))

(assert (=> b!101065 m!111695))

(assert (=> b!101065 m!111703))

(declare-fun m!111707 () Bool)

(assert (=> b!101065 m!111707))

(declare-fun m!111709 () Bool)

(assert (=> b!101065 m!111709))

(declare-fun m!111711 () Bool)

(assert (=> b!101065 m!111711))

(assert (=> b!101065 m!111689))

(declare-fun m!111713 () Bool)

(assert (=> bm!10462 m!111713))

(assert (=> b!101060 m!111531))

(declare-fun m!111715 () Bool)

(assert (=> b!101060 m!111715))

(assert (=> b!101060 m!111621))

(assert (=> b!101060 m!111531))

(declare-fun m!111717 () Bool)

(assert (=> b!101060 m!111717))

(assert (=> b!101060 m!111717))

(assert (=> b!101060 m!111621))

(declare-fun m!111719 () Bool)

(assert (=> b!101060 m!111719))

(assert (=> b!101076 m!111531))

(assert (=> b!101076 m!111531))

(declare-fun m!111721 () Bool)

(assert (=> b!101076 m!111721))

(assert (=> bm!10430 d!27361))

(declare-fun d!27363 () Bool)

(assert (=> d!27363 (= (apply!94 lt!50874 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1302 (getValueByKey!150 (toList!775 lt!50874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4176 () Bool)

(assert (= bs!4176 d!27363))

(assert (=> bs!4176 m!111667))

(assert (=> bs!4176 m!111667))

(declare-fun m!111723 () Bool)

(assert (=> bs!4176 m!111723))

(assert (=> b!100683 d!27363))

(declare-fun d!27365 () Bool)

(declare-fun e!65809 () Bool)

(assert (=> d!27365 e!65809))

(declare-fun res!50635 () Bool)

(assert (=> d!27365 (=> (not res!50635) (not e!65809))))

(declare-fun lt!51142 () ListLongMap!1519)

(assert (=> d!27365 (= res!50635 (contains!802 lt!51142 (_1!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(declare-fun lt!51144 () List!1593)

(assert (=> d!27365 (= lt!51142 (ListLongMap!1520 lt!51144))))

(declare-fun lt!51143 () Unit!3061)

(declare-fun lt!51141 () Unit!3061)

(assert (=> d!27365 (= lt!51143 lt!51141)))

(assert (=> d!27365 (= (getValueByKey!150 lt!51144 (_1!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27365 (= lt!51141 (lemmaContainsTupThenGetReturnValue!69 lt!51144 (_1!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27365 (= lt!51144 (insertStrictlySorted!72 (toList!775 call!10363) (_1!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) (_2!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (=> d!27365 (= (+!130 call!10363 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))) lt!51142)))

(declare-fun b!101077 () Bool)

(declare-fun res!50636 () Bool)

(assert (=> b!101077 (=> (not res!50636) (not e!65809))))

(assert (=> b!101077 (= res!50636 (= (getValueByKey!150 (toList!775 lt!51142) (_1!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (Some!155 (_2!1180 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun b!101078 () Bool)

(assert (=> b!101078 (= e!65809 (contains!806 (toList!775 lt!51142) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))

(assert (= (and d!27365 res!50635) b!101077))

(assert (= (and b!101077 res!50636) b!101078))

(declare-fun m!111725 () Bool)

(assert (=> d!27365 m!111725))

(declare-fun m!111727 () Bool)

(assert (=> d!27365 m!111727))

(declare-fun m!111729 () Bool)

(assert (=> d!27365 m!111729))

(declare-fun m!111731 () Bool)

(assert (=> d!27365 m!111731))

(declare-fun m!111733 () Bool)

(assert (=> b!101077 m!111733))

(declare-fun m!111735 () Bool)

(assert (=> b!101078 m!111735))

(assert (=> b!100682 d!27365))

(assert (=> d!27243 d!27237))

(declare-fun b!101090 () Bool)

(declare-fun e!65812 () Bool)

(assert (=> b!101090 (= e!65812 (and (bvsge (extraKeys!2335 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2335 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!480 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!101088 () Bool)

(declare-fun res!50647 () Bool)

(assert (=> b!101088 (=> (not res!50647) (not e!65812))))

(declare-fun size!2273 (LongMapFixedSize!862) (_ BitVec 32))

(assert (=> b!101088 (= res!50647 (bvsge (size!2273 newMap!16) (_size!480 newMap!16)))))

(declare-fun b!101087 () Bool)

(declare-fun res!50645 () Bool)

(assert (=> b!101087 (=> (not res!50645) (not e!65812))))

(assert (=> b!101087 (= res!50645 (and (= (size!2268 (_values!2505 newMap!16)) (bvadd (mask!6638 newMap!16) #b00000000000000000000000000000001)) (= (size!2267 (_keys!4219 newMap!16)) (size!2268 (_values!2505 newMap!16))) (bvsge (_size!480 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!480 newMap!16) (bvadd (mask!6638 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!27367 () Bool)

(declare-fun res!50646 () Bool)

(assert (=> d!27367 (=> (not res!50646) (not e!65812))))

(assert (=> d!27367 (= res!50646 (validMask!0 (mask!6638 newMap!16)))))

(assert (=> d!27367 (= (simpleValid!70 newMap!16) e!65812)))

(declare-fun b!101089 () Bool)

(declare-fun res!50648 () Bool)

(assert (=> b!101089 (=> (not res!50648) (not e!65812))))

(assert (=> b!101089 (= res!50648 (= (size!2273 newMap!16) (bvadd (_size!480 newMap!16) (bvsdiv (bvadd (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!27367 res!50646) b!101087))

(assert (= (and b!101087 res!50645) b!101088))

(assert (= (and b!101088 res!50647) b!101089))

(assert (= (and b!101089 res!50648) b!101090))

(declare-fun m!111737 () Bool)

(assert (=> b!101088 m!111737))

(assert (=> d!27367 m!111517))

(assert (=> b!101089 m!111737))

(assert (=> d!27239 d!27367))

(declare-fun d!27369 () Bool)

(declare-fun res!50649 () Bool)

(declare-fun e!65813 () Bool)

(assert (=> d!27369 (=> res!50649 e!65813)))

(assert (=> d!27369 (= res!50649 (= (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27369 (= (arrayContainsKey!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000) e!65813)))

(declare-fun b!101091 () Bool)

(declare-fun e!65814 () Bool)

(assert (=> b!101091 (= e!65813 e!65814)))

(declare-fun res!50650 () Bool)

(assert (=> b!101091 (=> (not res!50650) (not e!65814))))

(assert (=> b!101091 (= res!50650 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun b!101092 () Bool)

(assert (=> b!101092 (= e!65814 (arrayContainsKey!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27369 (not res!50649)) b!101091))

(assert (= (and b!101091 res!50650) b!101092))

(assert (=> d!27369 m!111531))

(assert (=> b!101092 m!111069))

(declare-fun m!111739 () Bool)

(assert (=> b!101092 m!111739))

(assert (=> bm!10434 d!27369))

(declare-fun lt!51149 () SeekEntryResult!258)

(declare-fun call!10472 () Bool)

(declare-fun c!17387 () Bool)

(declare-fun bm!10468 () Bool)

(assert (=> bm!10468 (= call!10472 (inRange!0 (ite c!17387 (index!3177 lt!51149) (index!3180 lt!51149)) (mask!6638 newMap!16)))))

(declare-fun b!101109 () Bool)

(declare-fun res!50660 () Bool)

(declare-fun e!65824 () Bool)

(assert (=> b!101109 (=> (not res!50660) (not e!65824))))

(assert (=> b!101109 (= res!50660 call!10472)))

(declare-fun e!65825 () Bool)

(assert (=> b!101109 (= e!65825 e!65824)))

(declare-fun b!101110 () Bool)

(declare-fun e!65823 () Bool)

(assert (=> b!101110 (= e!65823 e!65825)))

(declare-fun c!17386 () Bool)

(assert (=> b!101110 (= c!17386 ((_ is MissingVacant!258) lt!51149))))

(declare-fun b!101111 () Bool)

(declare-fun e!65826 () Bool)

(assert (=> b!101111 (= e!65823 e!65826)))

(declare-fun res!50662 () Bool)

(assert (=> b!101111 (= res!50662 call!10472)))

(assert (=> b!101111 (=> (not res!50662) (not e!65826))))

(declare-fun b!101112 () Bool)

(declare-fun call!10471 () Bool)

(assert (=> b!101112 (= e!65826 (not call!10471))))

(declare-fun b!101113 () Bool)

(declare-fun res!50661 () Bool)

(assert (=> b!101113 (=> (not res!50661) (not e!65824))))

(assert (=> b!101113 (= res!50661 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3180 lt!51149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101113 (and (bvsge (index!3180 lt!51149) #b00000000000000000000000000000000) (bvslt (index!3180 lt!51149) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun b!101114 () Bool)

(assert (=> b!101114 (= e!65825 ((_ is Undefined!258) lt!51149))))

(declare-fun d!27371 () Bool)

(assert (=> d!27371 e!65823))

(assert (=> d!27371 (= c!17387 ((_ is MissingZero!258) lt!51149))))

(assert (=> d!27371 (= lt!51149 (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun lt!51150 () Unit!3061)

(declare-fun choose!629 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3061)

(assert (=> d!27371 (= lt!51150 (choose!629 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27371 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27371 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)) lt!51150)))

(declare-fun b!101115 () Bool)

(assert (=> b!101115 (= e!65824 (not call!10471))))

(declare-fun b!101116 () Bool)

(assert (=> b!101116 (and (bvsge (index!3177 lt!51149) #b00000000000000000000000000000000) (bvslt (index!3177 lt!51149) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun res!50659 () Bool)

(assert (=> b!101116 (= res!50659 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3177 lt!51149)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101116 (=> (not res!50659) (not e!65826))))

(declare-fun bm!10469 () Bool)

(assert (=> bm!10469 (= call!10471 (arrayContainsKey!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!27371 c!17387) b!101111))

(assert (= (and d!27371 (not c!17387)) b!101110))

(assert (= (and b!101111 res!50662) b!101116))

(assert (= (and b!101116 res!50659) b!101112))

(assert (= (and b!101110 c!17386) b!101109))

(assert (= (and b!101110 (not c!17386)) b!101114))

(assert (= (and b!101109 res!50660) b!101113))

(assert (= (and b!101113 res!50661) b!101115))

(assert (= (or b!101111 b!101109) bm!10468))

(assert (= (or b!101112 b!101115) bm!10469))

(assert (=> bm!10469 m!111069))

(assert (=> bm!10469 m!111341))

(declare-fun m!111741 () Bool)

(assert (=> b!101116 m!111741))

(assert (=> d!27371 m!111069))

(assert (=> d!27371 m!111305))

(assert (=> d!27371 m!111069))

(declare-fun m!111743 () Bool)

(assert (=> d!27371 m!111743))

(assert (=> d!27371 m!111517))

(declare-fun m!111745 () Bool)

(assert (=> bm!10468 m!111745))

(declare-fun m!111747 () Bool)

(assert (=> b!101113 m!111747))

(assert (=> bm!10433 d!27371))

(declare-fun d!27373 () Bool)

(declare-fun e!65828 () Bool)

(assert (=> d!27373 e!65828))

(declare-fun res!50663 () Bool)

(assert (=> d!27373 (=> res!50663 e!65828)))

(declare-fun lt!51154 () Bool)

(assert (=> d!27373 (= res!50663 (not lt!51154))))

(declare-fun lt!51151 () Bool)

(assert (=> d!27373 (= lt!51154 lt!51151)))

(declare-fun lt!51153 () Unit!3061)

(declare-fun e!65827 () Unit!3061)

(assert (=> d!27373 (= lt!51153 e!65827)))

(declare-fun c!17388 () Bool)

(assert (=> d!27373 (= c!17388 lt!51151)))

(assert (=> d!27373 (= lt!51151 (containsKey!154 (toList!775 call!10421) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27373 (= (contains!802 call!10421 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) lt!51154)))

(declare-fun b!101117 () Bool)

(declare-fun lt!51152 () Unit!3061)

(assert (=> b!101117 (= e!65827 lt!51152)))

(assert (=> b!101117 (= lt!51152 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 call!10421) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> b!101117 (isDefined!104 (getValueByKey!150 (toList!775 call!10421) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!101118 () Bool)

(declare-fun Unit!3084 () Unit!3061)

(assert (=> b!101118 (= e!65827 Unit!3084)))

(declare-fun b!101119 () Bool)

(assert (=> b!101119 (= e!65828 (isDefined!104 (getValueByKey!150 (toList!775 call!10421) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(assert (= (and d!27373 c!17388) b!101117))

(assert (= (and d!27373 (not c!17388)) b!101118))

(assert (= (and d!27373 (not res!50663)) b!101119))

(assert (=> d!27373 m!111069))

(declare-fun m!111749 () Bool)

(assert (=> d!27373 m!111749))

(assert (=> b!101117 m!111069))

(declare-fun m!111751 () Bool)

(assert (=> b!101117 m!111751))

(assert (=> b!101117 m!111069))

(declare-fun m!111753 () Bool)

(assert (=> b!101117 m!111753))

(assert (=> b!101117 m!111753))

(declare-fun m!111755 () Bool)

(assert (=> b!101117 m!111755))

(assert (=> b!101119 m!111069))

(assert (=> b!101119 m!111753))

(assert (=> b!101119 m!111753))

(assert (=> b!101119 m!111755))

(assert (=> b!100841 d!27373))

(declare-fun d!27375 () Bool)

(assert (=> d!27375 (= (get!1300 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2822 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> b!100856 d!27375))

(declare-fun d!27377 () Bool)

(declare-fun res!50664 () Bool)

(declare-fun e!65829 () Bool)

(assert (=> d!27377 (=> (not res!50664) (not e!65829))))

(assert (=> d!27377 (= res!50664 (simpleValid!70 (_2!1179 lt!50956)))))

(assert (=> d!27377 (= (valid!399 (_2!1179 lt!50956)) e!65829)))

(declare-fun b!101120 () Bool)

(declare-fun res!50665 () Bool)

(assert (=> b!101120 (=> (not res!50665) (not e!65829))))

(assert (=> b!101120 (= res!50665 (= (arrayCountValidKeys!0 (_keys!4219 (_2!1179 lt!50956)) #b00000000000000000000000000000000 (size!2267 (_keys!4219 (_2!1179 lt!50956)))) (_size!480 (_2!1179 lt!50956))))))

(declare-fun b!101121 () Bool)

(declare-fun res!50666 () Bool)

(assert (=> b!101121 (=> (not res!50666) (not e!65829))))

(assert (=> b!101121 (= res!50666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4219 (_2!1179 lt!50956)) (mask!6638 (_2!1179 lt!50956))))))

(declare-fun b!101122 () Bool)

(assert (=> b!101122 (= e!65829 (arrayNoDuplicates!0 (_keys!4219 (_2!1179 lt!50956)) #b00000000000000000000000000000000 Nil!1591))))

(assert (= (and d!27377 res!50664) b!101120))

(assert (= (and b!101120 res!50665) b!101121))

(assert (= (and b!101121 res!50666) b!101122))

(declare-fun m!111757 () Bool)

(assert (=> d!27377 m!111757))

(declare-fun m!111759 () Bool)

(assert (=> b!101120 m!111759))

(declare-fun m!111761 () Bool)

(assert (=> b!101121 m!111761))

(declare-fun m!111763 () Bool)

(assert (=> b!101122 m!111763))

(assert (=> d!27257 d!27377))

(assert (=> d!27257 d!27239))

(declare-fun d!27379 () Bool)

(assert (=> d!27379 (= (apply!94 lt!50874 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1302 (getValueByKey!150 (toList!775 lt!50874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4177 () Bool)

(assert (= bs!4177 d!27379))

(assert (=> bs!4177 m!111541))

(assert (=> bs!4177 m!111541))

(declare-fun m!111765 () Bool)

(assert (=> bs!4177 m!111765))

(assert (=> b!100670 d!27379))

(declare-fun bm!10470 () Bool)

(declare-fun call!10473 () Bool)

(assert (=> bm!10470 (= call!10473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun d!27381 () Bool)

(declare-fun res!50668 () Bool)

(declare-fun e!65832 () Bool)

(assert (=> d!27381 (=> res!50668 e!65832)))

(assert (=> d!27381 (= res!50668 (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(assert (=> d!27381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4219 newMap!16) (mask!6638 newMap!16)) e!65832)))

(declare-fun b!101123 () Bool)

(declare-fun e!65831 () Bool)

(assert (=> b!101123 (= e!65831 call!10473)))

(declare-fun b!101124 () Bool)

(declare-fun e!65830 () Bool)

(assert (=> b!101124 (= e!65830 call!10473)))

(declare-fun b!101125 () Bool)

(assert (=> b!101125 (= e!65832 e!65831)))

(declare-fun c!17389 () Bool)

(assert (=> b!101125 (= c!17389 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101126 () Bool)

(assert (=> b!101126 (= e!65831 e!65830)))

(declare-fun lt!51156 () (_ BitVec 64))

(assert (=> b!101126 (= lt!51156 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51155 () Unit!3061)

(assert (=> b!101126 (= lt!51155 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4219 newMap!16) lt!51156 #b00000000000000000000000000000000))))

(assert (=> b!101126 (arrayContainsKey!0 (_keys!4219 newMap!16) lt!51156 #b00000000000000000000000000000000)))

(declare-fun lt!51157 () Unit!3061)

(assert (=> b!101126 (= lt!51157 lt!51155)))

(declare-fun res!50667 () Bool)

(assert (=> b!101126 (= res!50667 (= (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000) (_keys!4219 newMap!16) (mask!6638 newMap!16)) (Found!258 #b00000000000000000000000000000000)))))

(assert (=> b!101126 (=> (not res!50667) (not e!65830))))

(assert (= (and d!27381 (not res!50668)) b!101125))

(assert (= (and b!101125 c!17389) b!101126))

(assert (= (and b!101125 (not c!17389)) b!101123))

(assert (= (and b!101126 res!50667) b!101124))

(assert (= (or b!101124 b!101123) bm!10470))

(declare-fun m!111767 () Bool)

(assert (=> bm!10470 m!111767))

(assert (=> b!101125 m!111531))

(assert (=> b!101125 m!111531))

(assert (=> b!101125 m!111533))

(assert (=> b!101126 m!111531))

(declare-fun m!111769 () Bool)

(assert (=> b!101126 m!111769))

(declare-fun m!111771 () Bool)

(assert (=> b!101126 m!111771))

(assert (=> b!101126 m!111531))

(declare-fun m!111773 () Bool)

(assert (=> b!101126 m!111773))

(assert (=> b!100625 d!27381))

(declare-fun b!101127 () Bool)

(declare-fun e!65835 () ListLongMap!1519)

(declare-fun call!10479 () ListLongMap!1519)

(assert (=> b!101127 (= e!65835 call!10479)))

(declare-fun b!101128 () Bool)

(declare-fun e!65837 () Bool)

(declare-fun lt!51179 () ListLongMap!1519)

(assert (=> b!101128 (= e!65837 (= (apply!94 lt!51179 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 newMap!16)))))

(declare-fun b!101129 () Bool)

(declare-fun e!65834 () Bool)

(declare-fun call!10477 () Bool)

(assert (=> b!101129 (= e!65834 (not call!10477))))

(declare-fun bm!10471 () Bool)

(declare-fun call!10474 () ListLongMap!1519)

(declare-fun call!10475 () ListLongMap!1519)

(assert (=> bm!10471 (= call!10474 call!10475)))

(declare-fun b!101130 () Bool)

(declare-fun e!65840 () Bool)

(assert (=> b!101130 (= e!65840 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!17395 () Bool)

(declare-fun call!10476 () ListLongMap!1519)

(declare-fun call!10478 () ListLongMap!1519)

(declare-fun c!17390 () Bool)

(declare-fun bm!10472 () Bool)

(assert (=> bm!10472 (= call!10476 (+!130 (ite c!17395 call!10478 (ite c!17390 call!10475 call!10474)) (ite (or c!17395 c!17390) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 newMap!16)) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16)))))))

(declare-fun e!65843 () Bool)

(declare-fun b!101131 () Bool)

(assert (=> b!101131 (= e!65843 (= (apply!94 lt!51179 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)) (get!1297 (select (arr!2015 (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!372 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2268 (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))))))))

(assert (=> b!101131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun b!101132 () Bool)

(declare-fun e!65841 () Bool)

(declare-fun e!65839 () Bool)

(assert (=> b!101132 (= e!65841 e!65839)))

(declare-fun res!50672 () Bool)

(declare-fun call!10480 () Bool)

(assert (=> b!101132 (= res!50672 call!10480)))

(assert (=> b!101132 (=> (not res!50672) (not e!65839))))

(declare-fun b!101133 () Bool)

(declare-fun e!65838 () Bool)

(assert (=> b!101133 (= e!65838 (validKeyInArray!0 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101134 () Bool)

(declare-fun e!65844 () Bool)

(assert (=> b!101134 (= e!65844 e!65834)))

(declare-fun c!17391 () Bool)

(assert (=> b!101134 (= c!17391 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10473 () Bool)

(assert (=> bm!10473 (= call!10479 call!10476)))

(declare-fun b!101135 () Bool)

(declare-fun e!65845 () ListLongMap!1519)

(assert (=> b!101135 (= e!65845 call!10479)))

(declare-fun bm!10474 () Bool)

(assert (=> bm!10474 (= call!10480 (contains!802 lt!51179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101136 () Bool)

(declare-fun e!65842 () Unit!3061)

(declare-fun lt!51170 () Unit!3061)

(assert (=> b!101136 (= e!65842 lt!51170)))

(declare-fun lt!51166 () ListLongMap!1519)

(assert (=> b!101136 (= lt!51166 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51159 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51159 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51171 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51171 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51177 () Unit!3061)

(assert (=> b!101136 (= lt!51177 (addStillContains!70 lt!51166 lt!51159 (zeroValue!2401 newMap!16) lt!51171))))

(assert (=> b!101136 (contains!802 (+!130 lt!51166 (tuple2!2339 lt!51159 (zeroValue!2401 newMap!16))) lt!51171)))

(declare-fun lt!51173 () Unit!3061)

(assert (=> b!101136 (= lt!51173 lt!51177)))

(declare-fun lt!51174 () ListLongMap!1519)

(assert (=> b!101136 (= lt!51174 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51175 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51175 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51176 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51176 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51161 () Unit!3061)

(assert (=> b!101136 (= lt!51161 (addApplyDifferent!70 lt!51174 lt!51175 (minValue!2401 newMap!16) lt!51176))))

(assert (=> b!101136 (= (apply!94 (+!130 lt!51174 (tuple2!2339 lt!51175 (minValue!2401 newMap!16))) lt!51176) (apply!94 lt!51174 lt!51176))))

(declare-fun lt!51162 () Unit!3061)

(assert (=> b!101136 (= lt!51162 lt!51161)))

(declare-fun lt!51158 () ListLongMap!1519)

(assert (=> b!101136 (= lt!51158 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51163 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51167 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51167 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51168 () Unit!3061)

(assert (=> b!101136 (= lt!51168 (addApplyDifferent!70 lt!51158 lt!51163 (zeroValue!2401 newMap!16) lt!51167))))

(assert (=> b!101136 (= (apply!94 (+!130 lt!51158 (tuple2!2339 lt!51163 (zeroValue!2401 newMap!16))) lt!51167) (apply!94 lt!51158 lt!51167))))

(declare-fun lt!51178 () Unit!3061)

(assert (=> b!101136 (= lt!51178 lt!51168)))

(declare-fun lt!51169 () ListLongMap!1519)

(assert (=> b!101136 (= lt!51169 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51164 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51164 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51165 () (_ BitVec 64))

(assert (=> b!101136 (= lt!51165 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101136 (= lt!51170 (addApplyDifferent!70 lt!51169 lt!51164 (minValue!2401 newMap!16) lt!51165))))

(assert (=> b!101136 (= (apply!94 (+!130 lt!51169 (tuple2!2339 lt!51164 (minValue!2401 newMap!16))) lt!51165) (apply!94 lt!51169 lt!51165))))

(declare-fun d!27383 () Bool)

(assert (=> d!27383 e!65844))

(declare-fun res!50676 () Bool)

(assert (=> d!27383 (=> (not res!50676) (not e!65844))))

(assert (=> d!27383 (= res!50676 (or (bvsge #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))))

(declare-fun lt!51172 () ListLongMap!1519)

(assert (=> d!27383 (= lt!51179 lt!51172)))

(declare-fun lt!51160 () Unit!3061)

(assert (=> d!27383 (= lt!51160 e!65842)))

(declare-fun c!17392 () Bool)

(assert (=> d!27383 (= c!17392 e!65838)))

(declare-fun res!50677 () Bool)

(assert (=> d!27383 (=> (not res!50677) (not e!65838))))

(assert (=> d!27383 (= res!50677 (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun e!65833 () ListLongMap!1519)

(assert (=> d!27383 (= lt!51172 e!65833)))

(assert (=> d!27383 (= c!17395 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27383 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27383 (= (getCurrentListMap!456 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51179)))

(declare-fun b!101137 () Bool)

(declare-fun Unit!3085 () Unit!3061)

(assert (=> b!101137 (= e!65842 Unit!3085)))

(declare-fun b!101138 () Bool)

(assert (=> b!101138 (= e!65841 (not call!10480))))

(declare-fun b!101139 () Bool)

(assert (=> b!101139 (= e!65845 call!10474)))

(declare-fun bm!10475 () Bool)

(assert (=> bm!10475 (= call!10478 (getCurrentListMapNoExtraKeys!94 (_keys!4219 newMap!16) (ite (or c!17308 c!17310) (_values!2505 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16)))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101140 () Bool)

(assert (=> b!101140 (= e!65833 (+!130 call!10476 (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16))))))

(declare-fun bm!10476 () Bool)

(assert (=> bm!10476 (= call!10477 (contains!802 lt!51179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101141 () Bool)

(assert (=> b!101141 (= e!65839 (= (apply!94 lt!51179 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 newMap!16)))))

(declare-fun b!101142 () Bool)

(declare-fun c!17393 () Bool)

(assert (=> b!101142 (= c!17393 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101142 (= e!65835 e!65845)))

(declare-fun b!101143 () Bool)

(declare-fun res!50670 () Bool)

(assert (=> b!101143 (=> (not res!50670) (not e!65844))))

(assert (=> b!101143 (= res!50670 e!65841)))

(declare-fun c!17394 () Bool)

(assert (=> b!101143 (= c!17394 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101144 () Bool)

(assert (=> b!101144 (= e!65833 e!65835)))

(assert (=> b!101144 (= c!17390 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101145 () Bool)

(declare-fun res!50671 () Bool)

(assert (=> b!101145 (=> (not res!50671) (not e!65844))))

(declare-fun e!65836 () Bool)

(assert (=> b!101145 (= res!50671 e!65836)))

(declare-fun res!50674 () Bool)

(assert (=> b!101145 (=> res!50674 e!65836)))

(assert (=> b!101145 (= res!50674 (not e!65840))))

(declare-fun res!50669 () Bool)

(assert (=> b!101145 (=> (not res!50669) (not e!65840))))

(assert (=> b!101145 (= res!50669 (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(declare-fun bm!10477 () Bool)

(assert (=> bm!10477 (= call!10475 call!10478)))

(declare-fun b!101146 () Bool)

(assert (=> b!101146 (= e!65834 e!65837)))

(declare-fun res!50673 () Bool)

(assert (=> b!101146 (= res!50673 call!10477)))

(assert (=> b!101146 (=> (not res!50673) (not e!65837))))

(declare-fun b!101147 () Bool)

(assert (=> b!101147 (= e!65836 e!65843)))

(declare-fun res!50675 () Bool)

(assert (=> b!101147 (=> (not res!50675) (not e!65843))))

(assert (=> b!101147 (= res!50675 (contains!802 lt!51179 (select (arr!2014 (_keys!4219 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))))))

(assert (= (and d!27383 c!17395) b!101140))

(assert (= (and d!27383 (not c!17395)) b!101144))

(assert (= (and b!101144 c!17390) b!101127))

(assert (= (and b!101144 (not c!17390)) b!101142))

(assert (= (and b!101142 c!17393) b!101135))

(assert (= (and b!101142 (not c!17393)) b!101139))

(assert (= (or b!101135 b!101139) bm!10471))

(assert (= (or b!101127 bm!10471) bm!10477))

(assert (= (or b!101127 b!101135) bm!10473))

(assert (= (or b!101140 bm!10477) bm!10475))

(assert (= (or b!101140 bm!10473) bm!10472))

(assert (= (and d!27383 res!50677) b!101133))

(assert (= (and d!27383 c!17392) b!101136))

(assert (= (and d!27383 (not c!17392)) b!101137))

(assert (= (and d!27383 res!50676) b!101145))

(assert (= (and b!101145 res!50669) b!101130))

(assert (= (and b!101145 (not res!50674)) b!101147))

(assert (= (and b!101147 res!50675) b!101131))

(assert (= (and b!101145 res!50671) b!101143))

(assert (= (and b!101143 c!17394) b!101132))

(assert (= (and b!101143 (not c!17394)) b!101138))

(assert (= (and b!101132 res!50672) b!101141))

(assert (= (or b!101132 b!101138) bm!10474))

(assert (= (and b!101143 res!50670) b!101134))

(assert (= (and b!101134 c!17391) b!101146))

(assert (= (and b!101134 (not c!17391)) b!101129))

(assert (= (and b!101146 res!50673) b!101128))

(assert (= (or b!101146 b!101129) bm!10476))

(declare-fun b_lambda!4517 () Bool)

(assert (=> (not b_lambda!4517) (not b!101131)))

(assert (=> b!101131 t!5593))

(declare-fun b_and!6217 () Bool)

(assert (= b_and!6213 (and (=> t!5593 result!3327) b_and!6217)))

(assert (=> b!101131 t!5595))

(declare-fun b_and!6219 () Bool)

(assert (= b_and!6215 (and (=> t!5595 result!3329) b_and!6219)))

(declare-fun m!111775 () Bool)

(assert (=> bm!10475 m!111775))

(declare-fun m!111777 () Bool)

(assert (=> bm!10472 m!111777))

(assert (=> b!101133 m!111531))

(assert (=> b!101133 m!111531))

(assert (=> b!101133 m!111533))

(declare-fun m!111779 () Bool)

(assert (=> b!101140 m!111779))

(declare-fun m!111781 () Bool)

(assert (=> b!101141 m!111781))

(assert (=> b!101130 m!111531))

(assert (=> b!101130 m!111531))

(assert (=> b!101130 m!111533))

(assert (=> d!27383 m!111517))

(declare-fun m!111783 () Bool)

(assert (=> b!101128 m!111783))

(declare-fun m!111785 () Bool)

(assert (=> bm!10474 m!111785))

(assert (=> b!101136 m!111775))

(declare-fun m!111787 () Bool)

(assert (=> b!101136 m!111787))

(assert (=> b!101136 m!111531))

(declare-fun m!111789 () Bool)

(assert (=> b!101136 m!111789))

(declare-fun m!111791 () Bool)

(assert (=> b!101136 m!111791))

(declare-fun m!111793 () Bool)

(assert (=> b!101136 m!111793))

(declare-fun m!111795 () Bool)

(assert (=> b!101136 m!111795))

(declare-fun m!111797 () Bool)

(assert (=> b!101136 m!111797))

(declare-fun m!111799 () Bool)

(assert (=> b!101136 m!111799))

(declare-fun m!111801 () Bool)

(assert (=> b!101136 m!111801))

(assert (=> b!101136 m!111787))

(declare-fun m!111803 () Bool)

(assert (=> b!101136 m!111803))

(declare-fun m!111805 () Bool)

(assert (=> b!101136 m!111805))

(declare-fun m!111807 () Bool)

(assert (=> b!101136 m!111807))

(declare-fun m!111809 () Bool)

(assert (=> b!101136 m!111809))

(assert (=> b!101136 m!111799))

(assert (=> b!101136 m!111807))

(declare-fun m!111811 () Bool)

(assert (=> b!101136 m!111811))

(declare-fun m!111813 () Bool)

(assert (=> b!101136 m!111813))

(declare-fun m!111815 () Bool)

(assert (=> b!101136 m!111815))

(assert (=> b!101136 m!111793))

(declare-fun m!111817 () Bool)

(assert (=> bm!10476 m!111817))

(assert (=> b!101131 m!111531))

(declare-fun m!111819 () Bool)

(assert (=> b!101131 m!111819))

(assert (=> b!101131 m!111621))

(assert (=> b!101131 m!111531))

(declare-fun m!111821 () Bool)

(assert (=> b!101131 m!111821))

(assert (=> b!101131 m!111821))

(assert (=> b!101131 m!111621))

(declare-fun m!111823 () Bool)

(assert (=> b!101131 m!111823))

(assert (=> b!101147 m!111531))

(assert (=> b!101147 m!111531))

(declare-fun m!111825 () Bool)

(assert (=> b!101147 m!111825))

(assert (=> bm!10427 d!27383))

(declare-fun d!27385 () Bool)

(assert (=> d!27385 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 #b00000000000000000000000000000000)))

(declare-fun lt!51182 () Unit!3061)

(declare-fun choose!13 (array!4245 (_ BitVec 64) (_ BitVec 32)) Unit!3061)

(assert (=> d!27385 (= lt!51182 (choose!13 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 #b00000000000000000000000000000000))))

(assert (=> d!27385 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!27385 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 #b00000000000000000000000000000000) lt!51182)))

(declare-fun bs!4178 () Bool)

(assert (= bs!4178 d!27385))

(assert (=> bs!4178 m!111359))

(declare-fun m!111827 () Bool)

(assert (=> bs!4178 m!111827))

(assert (=> b!100869 d!27385))

(declare-fun d!27387 () Bool)

(declare-fun res!50678 () Bool)

(declare-fun e!65846 () Bool)

(assert (=> d!27387 (=> res!50678 e!65846)))

(assert (=> d!27387 (= res!50678 (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) lt!50984))))

(assert (=> d!27387 (= (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 #b00000000000000000000000000000000) e!65846)))

(declare-fun b!101148 () Bool)

(declare-fun e!65847 () Bool)

(assert (=> b!101148 (= e!65846 e!65847)))

(declare-fun res!50679 () Bool)

(assert (=> b!101148 (=> (not res!50679) (not e!65847))))

(assert (=> b!101148 (= res!50679 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(declare-fun b!101149 () Bool)

(assert (=> b!101149 (= e!65847 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!50984 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27387 (not res!50678)) b!101148))

(assert (= (and b!101148 res!50679) b!101149))

(assert (=> d!27387 m!111353))

(declare-fun m!111829 () Bool)

(assert (=> b!101149 m!111829))

(assert (=> b!100869 d!27387))

(declare-fun d!27389 () Bool)

(declare-fun lt!51185 () SeekEntryResult!258)

(assert (=> d!27389 (and (or ((_ is Undefined!258) lt!51185) (not ((_ is Found!258) lt!51185)) (and (bvsge (index!3178 lt!51185) #b00000000000000000000000000000000) (bvslt (index!3178 lt!51185) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))) (or ((_ is Undefined!258) lt!51185) ((_ is Found!258) lt!51185) (not ((_ is MissingZero!258) lt!51185)) (and (bvsge (index!3177 lt!51185) #b00000000000000000000000000000000) (bvslt (index!3177 lt!51185) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))) (or ((_ is Undefined!258) lt!51185) ((_ is Found!258) lt!51185) ((_ is MissingZero!258) lt!51185) (not ((_ is MissingVacant!258) lt!51185)) (and (bvsge (index!3180 lt!51185) #b00000000000000000000000000000000) (bvslt (index!3180 lt!51185) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))) (or ((_ is Undefined!258) lt!51185) (ite ((_ is Found!258) lt!51185) (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (index!3178 lt!51185)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!258) lt!51185) (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (index!3177 lt!51185)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!258) lt!51185) (= (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (index!3180 lt!51185)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!65848 () SeekEntryResult!258)

(assert (=> d!27389 (= lt!51185 e!65848)))

(declare-fun c!17396 () Bool)

(declare-fun lt!51184 () SeekEntryResult!258)

(assert (=> d!27389 (= c!17396 (and ((_ is Intermediate!258) lt!51184) (undefined!1070 lt!51184)))))

(assert (=> d!27389 (= lt!51184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) (mask!6638 (v!2823 (underlying!337 thiss!992)))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))))))

(assert (=> d!27389 (validMask!0 (mask!6638 (v!2823 (underlying!337 thiss!992))))))

(assert (=> d!27389 (= (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))) lt!51185)))

(declare-fun b!101150 () Bool)

(declare-fun e!65849 () SeekEntryResult!258)

(assert (=> b!101150 (= e!65849 (seekKeyOrZeroReturnVacant!0 (x!13251 lt!51184) (index!3179 lt!51184) (index!3179 lt!51184) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun b!101151 () Bool)

(declare-fun c!17397 () Bool)

(declare-fun lt!51183 () (_ BitVec 64))

(assert (=> b!101151 (= c!17397 (= lt!51183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!65850 () SeekEntryResult!258)

(assert (=> b!101151 (= e!65850 e!65849)))

(declare-fun b!101152 () Bool)

(assert (=> b!101152 (= e!65848 Undefined!258)))

(declare-fun b!101153 () Bool)

(assert (=> b!101153 (= e!65849 (MissingZero!258 (index!3179 lt!51184)))))

(declare-fun b!101154 () Bool)

(assert (=> b!101154 (= e!65850 (Found!258 (index!3179 lt!51184)))))

(declare-fun b!101155 () Bool)

(assert (=> b!101155 (= e!65848 e!65850)))

(assert (=> b!101155 (= lt!51183 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (index!3179 lt!51184)))))

(declare-fun c!17398 () Bool)

(assert (=> b!101155 (= c!17398 (= lt!51183 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!27389 c!17396) b!101152))

(assert (= (and d!27389 (not c!17396)) b!101155))

(assert (= (and b!101155 c!17398) b!101154))

(assert (= (and b!101155 (not c!17398)) b!101151))

(assert (= (and b!101151 c!17397) b!101153))

(assert (= (and b!101151 (not c!17397)) b!101150))

(declare-fun m!111831 () Bool)

(assert (=> d!27389 m!111831))

(declare-fun m!111833 () Bool)

(assert (=> d!27389 m!111833))

(assert (=> d!27389 m!111353))

(declare-fun m!111835 () Bool)

(assert (=> d!27389 m!111835))

(declare-fun m!111837 () Bool)

(assert (=> d!27389 m!111837))

(assert (=> d!27389 m!111077))

(assert (=> d!27389 m!111835))

(assert (=> d!27389 m!111353))

(declare-fun m!111839 () Bool)

(assert (=> d!27389 m!111839))

(assert (=> b!101150 m!111353))

(declare-fun m!111841 () Bool)

(assert (=> b!101150 m!111841))

(declare-fun m!111843 () Bool)

(assert (=> b!101155 m!111843))

(assert (=> b!100869 d!27389))

(declare-fun b!101190 () Bool)

(declare-fun res!50701 () Bool)

(declare-fun e!65874 () Bool)

(assert (=> b!101190 (=> (not res!50701) (not e!65874))))

(declare-fun lt!51246 () tuple2!2336)

(assert (=> b!101190 (= res!50701 (valid!399 (_2!1179 lt!51246)))))

(declare-fun b!101191 () Bool)

(declare-fun e!65867 () Unit!3061)

(declare-fun lt!51248 () Unit!3061)

(assert (=> b!101191 (= e!65867 lt!51248)))

(assert (=> b!101191 (= lt!51248 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51257 () SeekEntryResult!258)

(declare-fun call!10491 () SeekEntryResult!258)

(assert (=> b!101191 (= lt!51257 call!10491)))

(declare-fun c!17409 () Bool)

(assert (=> b!101191 (= c!17409 ((_ is MissingZero!258) lt!51257))))

(declare-fun e!65871 () Bool)

(assert (=> b!101191 e!65871))

(declare-fun b!101192 () Bool)

(assert (=> b!101192 (= e!65874 (= (map!1250 (_2!1179 lt!51246)) (+!130 (map!1250 newMap!16) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!101193 () Bool)

(declare-fun e!65870 () Unit!3061)

(declare-fun Unit!3086 () Unit!3061)

(assert (=> b!101193 (= e!65870 Unit!3086)))

(declare-fun lt!51273 () Unit!3061)

(declare-fun lemmaArrayContainsKeyThenInListMap!27 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) (_ BitVec 32) Int) Unit!3061)

(assert (=> b!101193 (= lt!51273 (lemmaArrayContainsKeyThenInListMap!27 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(assert (=> b!101193 (contains!802 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))

(declare-fun lt!51252 () Unit!3061)

(assert (=> b!101193 (= lt!51252 lt!51273)))

(assert (=> b!101193 false))

(declare-fun b!101194 () Bool)

(declare-fun e!65869 () Bool)

(assert (=> b!101194 (= e!65869 ((_ is Undefined!258) lt!51257))))

(declare-fun b!101196 () Bool)

(declare-fun res!50705 () Bool)

(assert (=> b!101196 (= res!50705 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3180 lt!51257)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!65872 () Bool)

(assert (=> b!101196 (=> (not res!50705) (not e!65872))))

(declare-fun bm!10486 () Bool)

(declare-fun call!10489 () Bool)

(declare-fun call!10490 () Bool)

(assert (=> bm!10486 (= call!10489 call!10490)))

(declare-fun call!10492 () Bool)

(declare-fun bm!10487 () Bool)

(assert (=> bm!10487 (= call!10492 (arrayContainsKey!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101197 () Bool)

(declare-fun Unit!3087 () Unit!3061)

(assert (=> b!101197 (= e!65870 Unit!3087)))

(declare-fun bm!10488 () Bool)

(assert (=> bm!10488 (= call!10491 (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (mask!6638 newMap!16)))))

(declare-fun b!101198 () Bool)

(declare-fun res!50699 () Bool)

(declare-fun e!65873 () Bool)

(assert (=> b!101198 (=> (not res!50699) (not e!65873))))

(assert (=> b!101198 (= res!50699 call!10489)))

(assert (=> b!101198 (= e!65871 e!65873)))

(declare-fun b!101199 () Bool)

(declare-fun res!50706 () Bool)

(assert (=> b!101199 (=> (not res!50706) (not e!65874))))

(assert (=> b!101199 (= res!50706 (contains!802 (map!1250 (_2!1179 lt!51246)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun c!17408 () Bool)

(declare-fun bm!10489 () Bool)

(declare-fun lt!51271 () SeekEntryResult!258)

(assert (=> bm!10489 (= call!10490 (inRange!0 (ite c!17408 (index!3178 lt!51271) (ite c!17409 (index!3177 lt!51257) (index!3180 lt!51257))) (mask!6638 newMap!16)))))

(declare-fun b!101200 () Bool)

(assert (=> b!101200 (= e!65869 e!65872)))

(declare-fun res!50703 () Bool)

(assert (=> b!101200 (= res!50703 call!10489)))

(assert (=> b!101200 (=> (not res!50703) (not e!65872))))

(declare-fun b!101201 () Bool)

(declare-fun res!50702 () Bool)

(assert (=> b!101201 (=> (not res!50702) (not e!65873))))

(assert (=> b!101201 (= res!50702 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3177 lt!51257)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101195 () Bool)

(declare-fun c!17407 () Bool)

(assert (=> b!101195 (= c!17407 ((_ is MissingVacant!258) lt!51257))))

(assert (=> b!101195 (= e!65871 e!65869)))

(declare-fun d!27391 () Bool)

(assert (=> d!27391 e!65874))

(declare-fun res!50700 () Bool)

(assert (=> d!27391 (=> (not res!50700) (not e!65874))))

(assert (=> d!27391 (= res!50700 (_1!1179 lt!51246))))

(assert (=> d!27391 (= lt!51246 (tuple2!2337 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (bvadd (_size!480 newMap!16) #b00000000000000000000000000000001) (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))) (_vacant!480 newMap!16))))))

(declare-fun lt!51260 () Unit!3061)

(declare-fun lt!51275 () Unit!3061)

(assert (=> d!27391 (= lt!51260 lt!51275)))

(declare-fun lt!51270 () array!4245)

(declare-fun lt!51258 () array!4247)

(assert (=> d!27391 (contains!802 (getCurrentListMap!456 lt!51270 lt!51258 (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972))))))

(assert (=> d!27391 (= lt!51275 (lemmaValidKeyInArrayIsInListMap!102 lt!51270 lt!51258 (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27391 (= lt!51258 (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))))))

(assert (=> d!27391 (= lt!51270 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun lt!51263 () Unit!3061)

(declare-fun lt!51265 () Unit!3061)

(assert (=> d!27391 (= lt!51263 lt!51265)))

(declare-fun lt!51261 () array!4245)

(assert (=> d!27391 (= (arrayCountValidKeys!0 lt!51261 (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (bvadd (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4245 (_ BitVec 32)) Unit!3061)

(assert (=> d!27391 (= lt!51265 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!51261 (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972))))))

(assert (=> d!27391 (= lt!51261 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun lt!51264 () Unit!3061)

(declare-fun lt!51262 () Unit!3061)

(assert (=> d!27391 (= lt!51264 lt!51262)))

(declare-fun lt!51266 () array!4245)

(assert (=> d!27391 (arrayContainsKey!0 lt!51266 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!27391 (= lt!51262 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!51266 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972))))))

(assert (=> d!27391 (= lt!51266 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))))))

(declare-fun lt!51249 () Unit!3061)

(declare-fun lt!51268 () Unit!3061)

(assert (=> d!27391 (= lt!51249 lt!51268)))

(assert (=> d!27391 (= (+!130 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!456 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!27 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) (_ BitVec 64) V!3169 Int) Unit!3061)

(assert (=> d!27391 (= lt!51268 (lemmaAddValidKeyToArrayThenAddPairToListMap!27 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51269 () Unit!3061)

(declare-fun lt!51253 () Unit!3061)

(assert (=> d!27391 (= lt!51269 lt!51253)))

(assert (=> d!27391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))) (mask!6638 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4245 (_ BitVec 32) (_ BitVec 32)) Unit!3061)

(assert (=> d!27391 (= lt!51253 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (_keys!4219 newMap!16) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (mask!6638 newMap!16)))))

(declare-fun lt!51247 () Unit!3061)

(declare-fun lt!51251 () Unit!3061)

(assert (=> d!27391 (= lt!51247 lt!51251)))

(assert (=> d!27391 (= (arrayCountValidKeys!0 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))) #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4219 newMap!16) #b00000000000000000000000000000000 (size!2267 (_keys!4219 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4245 (_ BitVec 32) (_ BitVec 64)) Unit!3061)

(assert (=> d!27391 (= lt!51251 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4219 newMap!16) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun lt!51259 () Unit!3061)

(declare-fun lt!51274 () Unit!3061)

(assert (=> d!27391 (= lt!51259 lt!51274)))

(declare-fun lt!51254 () List!1594)

(declare-fun lt!51255 () (_ BitVec 32))

(assert (=> d!27391 (arrayNoDuplicates!0 (array!4246 (store (arr!2014 (_keys!4219 newMap!16)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) (size!2267 (_keys!4219 newMap!16))) lt!51255 lt!51254)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4245 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1594) Unit!3061)

(assert (=> d!27391 (= lt!51274 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972)) lt!51255 lt!51254))))

(assert (=> d!27391 (= lt!51254 Nil!1591)))

(assert (=> d!27391 (= lt!51255 #b00000000000000000000000000000000)))

(declare-fun lt!51267 () Unit!3061)

(assert (=> d!27391 (= lt!51267 e!65870)))

(declare-fun c!17410 () Bool)

(assert (=> d!27391 (= c!17410 (arrayContainsKey!0 (_keys!4219 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!51250 () Unit!3061)

(assert (=> d!27391 (= lt!51250 e!65867)))

(assert (=> d!27391 (= c!17408 (contains!802 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27391 (valid!399 newMap!16)))

(assert (=> d!27391 (= (updateHelperNewKey!43 newMap!16 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17318 (index!3180 lt!50972) (index!3177 lt!50972))) lt!51246)))

(declare-fun b!101202 () Bool)

(assert (=> b!101202 (= e!65872 (not call!10492))))

(declare-fun e!65868 () Bool)

(declare-fun b!101203 () Bool)

(assert (=> b!101203 (= e!65868 (= (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!51271)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!101204 () Bool)

(declare-fun Unit!3088 () Unit!3061)

(assert (=> b!101204 (= e!65867 Unit!3088)))

(declare-fun lt!51272 () Unit!3061)

(assert (=> b!101204 (= lt!51272 (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(assert (=> b!101204 (= lt!51271 call!10491)))

(declare-fun res!50698 () Bool)

(assert (=> b!101204 (= res!50698 ((_ is Found!258) lt!51271))))

(assert (=> b!101204 (=> (not res!50698) (not e!65868))))

(assert (=> b!101204 e!65868))

(declare-fun lt!51256 () Unit!3061)

(assert (=> b!101204 (= lt!51256 lt!51272)))

(assert (=> b!101204 false))

(declare-fun b!101205 () Bool)

(declare-fun res!50704 () Bool)

(assert (=> b!101205 (= res!50704 call!10490)))

(assert (=> b!101205 (=> (not res!50704) (not e!65868))))

(declare-fun b!101206 () Bool)

(assert (=> b!101206 (= e!65873 (not call!10492))))

(assert (= (and d!27391 c!17408) b!101204))

(assert (= (and d!27391 (not c!17408)) b!101191))

(assert (= (and b!101204 res!50698) b!101205))

(assert (= (and b!101205 res!50704) b!101203))

(assert (= (and b!101191 c!17409) b!101198))

(assert (= (and b!101191 (not c!17409)) b!101195))

(assert (= (and b!101198 res!50699) b!101201))

(assert (= (and b!101201 res!50702) b!101206))

(assert (= (and b!101195 c!17407) b!101200))

(assert (= (and b!101195 (not c!17407)) b!101194))

(assert (= (and b!101200 res!50703) b!101196))

(assert (= (and b!101196 res!50705) b!101202))

(assert (= (or b!101198 b!101200) bm!10486))

(assert (= (or b!101206 b!101202) bm!10487))

(assert (= (or b!101205 bm!10486) bm!10489))

(assert (= (or b!101204 b!101191) bm!10488))

(assert (= (and d!27391 c!17410) b!101193))

(assert (= (and d!27391 (not c!17410)) b!101197))

(assert (= (and d!27391 res!50700) b!101190))

(assert (= (and b!101190 res!50701) b!101199))

(assert (= (and b!101199 res!50706) b!101192))

(declare-fun m!111845 () Bool)

(assert (=> b!101199 m!111845))

(assert (=> b!101199 m!111845))

(assert (=> b!101199 m!111069))

(declare-fun m!111847 () Bool)

(assert (=> b!101199 m!111847))

(assert (=> d!27391 m!111069))

(declare-fun m!111849 () Bool)

(assert (=> d!27391 m!111849))

(assert (=> d!27391 m!111069))

(assert (=> d!27391 m!111099))

(declare-fun m!111851 () Bool)

(assert (=> d!27391 m!111851))

(assert (=> d!27391 m!111079))

(declare-fun m!111853 () Bool)

(assert (=> d!27391 m!111853))

(declare-fun m!111855 () Bool)

(assert (=> d!27391 m!111855))

(declare-fun m!111857 () Bool)

(assert (=> d!27391 m!111857))

(declare-fun m!111859 () Bool)

(assert (=> d!27391 m!111859))

(assert (=> d!27391 m!111069))

(declare-fun m!111861 () Bool)

(assert (=> d!27391 m!111861))

(assert (=> d!27391 m!111211))

(assert (=> d!27391 m!111069))

(assert (=> d!27391 m!111329))

(declare-fun m!111863 () Bool)

(assert (=> d!27391 m!111863))

(declare-fun m!111865 () Bool)

(assert (=> d!27391 m!111865))

(declare-fun m!111867 () Bool)

(assert (=> d!27391 m!111867))

(assert (=> d!27391 m!111069))

(assert (=> d!27391 m!111341))

(declare-fun m!111869 () Bool)

(assert (=> d!27391 m!111869))

(assert (=> d!27391 m!111855))

(assert (=> d!27391 m!111859))

(declare-fun m!111871 () Bool)

(assert (=> d!27391 m!111871))

(assert (=> d!27391 m!111211))

(declare-fun m!111873 () Bool)

(assert (=> d!27391 m!111873))

(assert (=> d!27391 m!111069))

(declare-fun m!111875 () Bool)

(assert (=> d!27391 m!111875))

(assert (=> d!27391 m!111211))

(declare-fun m!111877 () Bool)

(assert (=> d!27391 m!111877))

(assert (=> d!27391 m!111069))

(declare-fun m!111879 () Bool)

(assert (=> d!27391 m!111879))

(declare-fun m!111881 () Bool)

(assert (=> d!27391 m!111881))

(assert (=> d!27391 m!111205))

(declare-fun m!111883 () Bool)

(assert (=> d!27391 m!111883))

(assert (=> d!27391 m!111069))

(declare-fun m!111885 () Bool)

(assert (=> d!27391 m!111885))

(assert (=> b!101193 m!111069))

(declare-fun m!111887 () Bool)

(assert (=> b!101193 m!111887))

(assert (=> b!101193 m!111211))

(assert (=> b!101193 m!111211))

(assert (=> b!101193 m!111069))

(assert (=> b!101193 m!111329))

(declare-fun m!111889 () Bool)

(assert (=> b!101203 m!111889))

(assert (=> bm!10487 m!111069))

(assert (=> bm!10487 m!111341))

(assert (=> b!101204 m!111069))

(assert (=> b!101204 m!111339))

(assert (=> bm!10488 m!111069))

(assert (=> bm!10488 m!111305))

(assert (=> b!101192 m!111845))

(assert (=> b!101192 m!111089))

(assert (=> b!101192 m!111089))

(declare-fun m!111891 () Bool)

(assert (=> b!101192 m!111891))

(declare-fun m!111893 () Bool)

(assert (=> b!101196 m!111893))

(declare-fun m!111895 () Bool)

(assert (=> b!101190 m!111895))

(declare-fun m!111897 () Bool)

(assert (=> b!101201 m!111897))

(assert (=> b!101191 m!111069))

(assert (=> b!101191 m!111333))

(declare-fun m!111899 () Bool)

(assert (=> bm!10489 m!111899))

(assert (=> bm!10436 d!27391))

(declare-fun d!27393 () Bool)

(declare-fun e!65877 () Bool)

(assert (=> d!27393 e!65877))

(declare-fun res!50709 () Bool)

(assert (=> d!27393 (=> (not res!50709) (not e!65877))))

(assert (=> d!27393 (= res!50709 (and (bvsge (index!3178 lt!50972) #b00000000000000000000000000000000) (bvslt (index!3178 lt!50972) (size!2267 (_keys!4219 newMap!16)))))))

(declare-fun lt!51278 () Unit!3061)

(declare-fun choose!630 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) Unit!3061)

(assert (=> d!27393 (= lt!51278 (choose!630 (_keys!4219 newMap!16) lt!50968 (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3178 lt!50972) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27393 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27393 (= (lemmaValidKeyInArrayIsInListMap!102 (_keys!4219 newMap!16) lt!50968 (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3178 lt!50972) (defaultEntry!2522 newMap!16)) lt!51278)))

(declare-fun b!101209 () Bool)

(assert (=> b!101209 (= e!65877 (contains!802 (getCurrentListMap!456 (_keys!4219 newMap!16) lt!50968 (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2014 (_keys!4219 newMap!16)) (index!3178 lt!50972))))))

(assert (= (and d!27393 res!50709) b!101209))

(declare-fun m!111901 () Bool)

(assert (=> d!27393 m!111901))

(assert (=> d!27393 m!111517))

(declare-fun m!111903 () Bool)

(assert (=> b!101209 m!111903))

(assert (=> b!101209 m!111311))

(assert (=> b!101209 m!111903))

(assert (=> b!101209 m!111311))

(declare-fun m!111905 () Bool)

(assert (=> b!101209 m!111905))

(assert (=> b!100817 d!27393))

(declare-fun d!27395 () Bool)

(declare-fun e!65880 () Bool)

(assert (=> d!27395 e!65880))

(declare-fun res!50712 () Bool)

(assert (=> d!27395 (=> (not res!50712) (not e!65880))))

(assert (=> d!27395 (= res!50712 (and (bvsge (index!3178 lt!50972) #b00000000000000000000000000000000) (bvslt (index!3178 lt!50972) (size!2268 (_values!2505 newMap!16)))))))

(declare-fun lt!51281 () Unit!3061)

(declare-fun choose!631 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) (_ BitVec 64) V!3169 Int) Unit!3061)

(assert (=> d!27395 (= lt!51281 (choose!631 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3178 lt!50972) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27395 (validMask!0 (mask!6638 newMap!16))))

(assert (=> d!27395 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3178 lt!50972) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)) lt!51281)))

(declare-fun b!101212 () Bool)

(assert (=> b!101212 (= e!65880 (= (+!130 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2339 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!456 (_keys!4219 newMap!16) (array!4248 (store (arr!2015 (_values!2505 newMap!16)) (index!3178 lt!50972) (ValueCellFull!977 (get!1297 (select (arr!2015 (_values!2505 (v!2823 (underlying!337 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2268 (_values!2505 newMap!16))) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16))))))

(assert (= (and d!27395 res!50712) b!101212))

(assert (=> d!27395 m!111069))

(assert (=> d!27395 m!111099))

(declare-fun m!111907 () Bool)

(assert (=> d!27395 m!111907))

(assert (=> d!27395 m!111517))

(assert (=> b!101212 m!111211))

(assert (=> b!101212 m!111211))

(assert (=> b!101212 m!111877))

(assert (=> b!101212 m!111293))

(declare-fun m!111909 () Bool)

(assert (=> b!101212 m!111909))

(assert (=> b!100817 d!27395))

(declare-fun d!27397 () Bool)

(declare-fun e!65882 () Bool)

(assert (=> d!27397 e!65882))

(declare-fun res!50713 () Bool)

(assert (=> d!27397 (=> res!50713 e!65882)))

(declare-fun lt!51285 () Bool)

(assert (=> d!27397 (= res!50713 (not lt!51285))))

(declare-fun lt!51282 () Bool)

(assert (=> d!27397 (= lt!51285 lt!51282)))

(declare-fun lt!51284 () Unit!3061)

(declare-fun e!65881 () Unit!3061)

(assert (=> d!27397 (= lt!51284 e!65881)))

(declare-fun c!17411 () Bool)

(assert (=> d!27397 (= c!17411 lt!51282)))

(assert (=> d!27397 (= lt!51282 (containsKey!154 (toList!775 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> d!27397 (= (contains!802 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)) lt!51285)))

(declare-fun b!101213 () Bool)

(declare-fun lt!51283 () Unit!3061)

(assert (=> b!101213 (= e!65881 lt!51283)))

(assert (=> b!101213 (= lt!51283 (lemmaContainsKeyImpliesGetValueByKeyDefined!103 (toList!775 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(assert (=> b!101213 (isDefined!104 (getValueByKey!150 (toList!775 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355)))))

(declare-fun b!101214 () Bool)

(declare-fun Unit!3089 () Unit!3061)

(assert (=> b!101214 (= e!65881 Unit!3089)))

(declare-fun b!101215 () Bool)

(assert (=> b!101215 (= e!65882 (isDefined!104 (getValueByKey!150 (toList!775 (getCurrentListMap!456 (_keys!4219 newMap!16) (_values!2505 newMap!16) (mask!6638 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355))))))

(assert (= (and d!27397 c!17411) b!101213))

(assert (= (and d!27397 (not c!17411)) b!101214))

(assert (= (and d!27397 (not res!50713)) b!101215))

(assert (=> d!27397 m!111069))

(declare-fun m!111911 () Bool)

(assert (=> d!27397 m!111911))

(assert (=> b!101213 m!111069))

(declare-fun m!111913 () Bool)

(assert (=> b!101213 m!111913))

(assert (=> b!101213 m!111069))

(declare-fun m!111915 () Bool)

(assert (=> b!101213 m!111915))

(assert (=> b!101213 m!111915))

(declare-fun m!111917 () Bool)

(assert (=> b!101213 m!111917))

(assert (=> b!101215 m!111069))

(assert (=> b!101215 m!111915))

(assert (=> b!101215 m!111915))

(assert (=> b!101215 m!111917))

(assert (=> b!100817 d!27397))

(assert (=> b!100817 d!27337))

(declare-fun d!27399 () Bool)

(declare-fun res!50715 () Bool)

(declare-fun e!65883 () Bool)

(assert (=> d!27399 (=> res!50715 e!65883)))

(assert (=> d!27399 (= res!50715 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> d!27399 (= (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17275 (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591) Nil!1591)) e!65883)))

(declare-fun b!101216 () Bool)

(declare-fun e!65886 () Bool)

(declare-fun call!10493 () Bool)

(assert (=> b!101216 (= e!65886 call!10493)))

(declare-fun bm!10490 () Bool)

(declare-fun c!17412 () Bool)

(assert (=> bm!10490 (= call!10493 (arrayNoDuplicates!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17412 (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!17275 (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591) Nil!1591)) (ite c!17275 (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591) Nil!1591))))))

(declare-fun b!101217 () Bool)

(assert (=> b!101217 (= e!65886 call!10493)))

(declare-fun e!65885 () Bool)

(declare-fun b!101218 () Bool)

(assert (=> b!101218 (= e!65885 (contains!805 (ite c!17275 (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591) Nil!1591) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101219 () Bool)

(declare-fun e!65884 () Bool)

(assert (=> b!101219 (= e!65883 e!65884)))

(declare-fun res!50716 () Bool)

(assert (=> b!101219 (=> (not res!50716) (not e!65884))))

(assert (=> b!101219 (= res!50716 (not e!65885))))

(declare-fun res!50714 () Bool)

(assert (=> b!101219 (=> (not res!50714) (not e!65885))))

(assert (=> b!101219 (= res!50714 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101220 () Bool)

(assert (=> b!101220 (= e!65884 e!65886)))

(assert (=> b!101220 (= c!17412 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!27399 (not res!50715)) b!101219))

(assert (= (and b!101219 res!50714) b!101218))

(assert (= (and b!101219 res!50716) b!101220))

(assert (= (and b!101220 c!17412) b!101216))

(assert (= (and b!101220 (not c!17412)) b!101217))

(assert (= (or b!101216 b!101217) bm!10490))

(declare-fun m!111919 () Bool)

(assert (=> bm!10490 m!111919))

(declare-fun m!111921 () Bool)

(assert (=> bm!10490 m!111921))

(assert (=> b!101218 m!111919))

(assert (=> b!101218 m!111919))

(declare-fun m!111923 () Bool)

(assert (=> b!101218 m!111923))

(assert (=> b!101219 m!111919))

(assert (=> b!101219 m!111919))

(declare-fun m!111925 () Bool)

(assert (=> b!101219 m!111925))

(assert (=> b!101220 m!111919))

(assert (=> b!101220 m!111919))

(assert (=> b!101220 m!111925))

(assert (=> bm!10367 d!27399))

(assert (=> d!27245 d!27249))

(declare-fun d!27401 () Bool)

(assert (=> d!27401 (not (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!27401 true))

(declare-fun _$68!97 () Unit!3061)

(assert (=> d!27401 (= (choose!68 (_keys!4219 (v!2823 (underlying!337 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) (Cons!1590 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) from!355) Nil!1591)) _$68!97)))

(declare-fun bs!4179 () Bool)

(assert (= bs!4179 d!27401))

(assert (=> bs!4179 m!111069))

(assert (=> bs!4179 m!111073))

(assert (=> d!27245 d!27401))

(declare-fun bm!10491 () Bool)

(declare-fun call!10494 () Bool)

(assert (=> bm!10491 (= call!10494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))))))

(declare-fun d!27403 () Bool)

(declare-fun res!50718 () Bool)

(declare-fun e!65889 () Bool)

(assert (=> d!27403 (=> res!50718 e!65889)))

(assert (=> d!27403 (= res!50718 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2267 (_keys!4219 (v!2823 (underlying!337 thiss!992))))))))

(assert (=> d!27403 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))) e!65889)))

(declare-fun b!101221 () Bool)

(declare-fun e!65888 () Bool)

(assert (=> b!101221 (= e!65888 call!10494)))

(declare-fun b!101222 () Bool)

(declare-fun e!65887 () Bool)

(assert (=> b!101222 (= e!65887 call!10494)))

(declare-fun b!101223 () Bool)

(assert (=> b!101223 (= e!65889 e!65888)))

(declare-fun c!17413 () Bool)

(assert (=> b!101223 (= c!17413 (validKeyInArray!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101224 () Bool)

(assert (=> b!101224 (= e!65888 e!65887)))

(declare-fun lt!51287 () (_ BitVec 64))

(assert (=> b!101224 (= lt!51287 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!51286 () Unit!3061)

(assert (=> b!101224 (= lt!51286 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!51287 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!101224 (arrayContainsKey!0 (_keys!4219 (v!2823 (underlying!337 thiss!992))) lt!51287 #b00000000000000000000000000000000)))

(declare-fun lt!51288 () Unit!3061)

(assert (=> b!101224 (= lt!51288 lt!51286)))

(declare-fun res!50717 () Bool)

(assert (=> b!101224 (= res!50717 (= (seekEntryOrOpen!0 (select (arr!2014 (_keys!4219 (v!2823 (underlying!337 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4219 (v!2823 (underlying!337 thiss!992))) (mask!6638 (v!2823 (underlying!337 thiss!992)))) (Found!258 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!101224 (=> (not res!50717) (not e!65887))))

(assert (= (and d!27403 (not res!50718)) b!101223))

(assert (= (and b!101223 c!17413) b!101224))

(assert (= (and b!101223 (not c!17413)) b!101221))

(assert (= (and b!101224 res!50717) b!101222))

(assert (= (or b!101222 b!101221) bm!10491))

(declare-fun m!111927 () Bool)

(assert (=> bm!10491 m!111927))

(declare-fun m!111929 () Bool)

(assert (=> b!101223 m!111929))

(assert (=> b!101223 m!111929))

(declare-fun m!111931 () Bool)

(assert (=> b!101223 m!111931))

(assert (=> b!101224 m!111929))

(declare-fun m!111933 () Bool)

(assert (=> b!101224 m!111933))

(declare-fun m!111935 () Bool)

(assert (=> b!101224 m!111935))

(assert (=> b!101224 m!111929))

(declare-fun m!111937 () Bool)

(assert (=> b!101224 m!111937))

(assert (=> bm!10442 d!27403))

(declare-fun d!27405 () Bool)

(declare-fun e!65890 () Bool)

(assert (=> d!27405 e!65890))

(declare-fun res!50719 () Bool)

(assert (=> d!27405 (=> (not res!50719) (not e!65890))))

(declare-fun lt!51290 () ListLongMap!1519)

(assert (=> d!27405 (= res!50719 (contains!802 lt!51290 (_1!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(declare-fun lt!51292 () List!1593)

(assert (=> d!27405 (= lt!51290 (ListLongMap!1520 lt!51292))))

(declare-fun lt!51291 () Unit!3061)

(declare-fun lt!51289 () Unit!3061)

(assert (=> d!27405 (= lt!51291 lt!51289)))

(assert (=> d!27405 (= (getValueByKey!150 lt!51292 (_1!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))) (Some!155 (_2!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(assert (=> d!27405 (= lt!51289 (lemmaContainsTupThenGetReturnValue!69 lt!51292 (_1!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (_2!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(assert (=> d!27405 (= lt!51292 (insertStrictlySorted!72 (toList!775 (ite c!17269 call!10365 (ite c!17264 call!10362 call!10361))) (_1!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) (_2!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))))))

(assert (=> d!27405 (= (+!130 (ite c!17269 call!10365 (ite c!17264 call!10362 call!10361)) (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))) lt!51290)))

(declare-fun b!101225 () Bool)

(declare-fun res!50720 () Bool)

(assert (=> b!101225 (=> (not res!50720) (not e!65890))))

(assert (=> b!101225 (= res!50720 (= (getValueByKey!150 (toList!775 lt!51290) (_1!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992))))))) (Some!155 (_2!1180 (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))))

(declare-fun b!101226 () Bool)

(assert (=> b!101226 (= e!65890 (contains!806 (toList!775 lt!51290) (ite (or c!17269 c!17264) (tuple2!2339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2823 (underlying!337 thiss!992)))) (tuple2!2339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2823 (underlying!337 thiss!992)))))))))

(assert (= (and d!27405 res!50719) b!101225))

(assert (= (and b!101225 res!50720) b!101226))

(declare-fun m!111939 () Bool)

(assert (=> d!27405 m!111939))

(declare-fun m!111941 () Bool)

(assert (=> d!27405 m!111941))

(declare-fun m!111943 () Bool)

(assert (=> d!27405 m!111943))

(declare-fun m!111945 () Bool)

(assert (=> d!27405 m!111945))

(declare-fun m!111947 () Bool)

(assert (=> b!101225 m!111947))

(declare-fun m!111949 () Bool)

(assert (=> b!101226 m!111949))

(assert (=> bm!10359 d!27405))

(declare-fun mapNonEmpty!3809 () Bool)

(declare-fun mapRes!3809 () Bool)

(declare-fun tp!9677 () Bool)

(declare-fun e!65891 () Bool)

(assert (=> mapNonEmpty!3809 (= mapRes!3809 (and tp!9677 e!65891))))

(declare-fun mapRest!3809 () (Array (_ BitVec 32) ValueCell!977))

(declare-fun mapKey!3809 () (_ BitVec 32))

(declare-fun mapValue!3809 () ValueCell!977)

(assert (=> mapNonEmpty!3809 (= mapRest!3808 (store mapRest!3809 mapKey!3809 mapValue!3809))))

(declare-fun condMapEmpty!3809 () Bool)

(declare-fun mapDefault!3809 () ValueCell!977)

(assert (=> mapNonEmpty!3808 (= condMapEmpty!3809 (= mapRest!3808 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3809)))))

(declare-fun e!65892 () Bool)

(assert (=> mapNonEmpty!3808 (= tp!9676 (and e!65892 mapRes!3809))))

(declare-fun mapIsEmpty!3809 () Bool)

(assert (=> mapIsEmpty!3809 mapRes!3809))

(declare-fun b!101228 () Bool)

(assert (=> b!101228 (= e!65892 tp_is_empty!2641)))

(declare-fun b!101227 () Bool)

(assert (=> b!101227 (= e!65891 tp_is_empty!2641)))

(assert (= (and mapNonEmpty!3808 condMapEmpty!3809) mapIsEmpty!3809))

(assert (= (and mapNonEmpty!3808 (not condMapEmpty!3809)) mapNonEmpty!3809))

(assert (= (and mapNonEmpty!3809 ((_ is ValueCellFull!977) mapValue!3809)) b!101227))

(assert (= (and mapNonEmpty!3808 ((_ is ValueCellFull!977) mapDefault!3809)) b!101228))

(declare-fun m!111951 () Bool)

(assert (=> mapNonEmpty!3809 m!111951))

(declare-fun mapNonEmpty!3810 () Bool)

(declare-fun mapRes!3810 () Bool)

(declare-fun tp!9678 () Bool)

(declare-fun e!65893 () Bool)

(assert (=> mapNonEmpty!3810 (= mapRes!3810 (and tp!9678 e!65893))))

(declare-fun mapKey!3810 () (_ BitVec 32))

(declare-fun mapValue!3810 () ValueCell!977)

(declare-fun mapRest!3810 () (Array (_ BitVec 32) ValueCell!977))

(assert (=> mapNonEmpty!3810 (= mapRest!3807 (store mapRest!3810 mapKey!3810 mapValue!3810))))

(declare-fun condMapEmpty!3810 () Bool)

(declare-fun mapDefault!3810 () ValueCell!977)

(assert (=> mapNonEmpty!3807 (= condMapEmpty!3810 (= mapRest!3807 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3810)))))

(declare-fun e!65894 () Bool)

(assert (=> mapNonEmpty!3807 (= tp!9675 (and e!65894 mapRes!3810))))

(declare-fun mapIsEmpty!3810 () Bool)

(assert (=> mapIsEmpty!3810 mapRes!3810))

(declare-fun b!101230 () Bool)

(assert (=> b!101230 (= e!65894 tp_is_empty!2641)))

(declare-fun b!101229 () Bool)

(assert (=> b!101229 (= e!65893 tp_is_empty!2641)))

(assert (= (and mapNonEmpty!3807 condMapEmpty!3810) mapIsEmpty!3810))

(assert (= (and mapNonEmpty!3807 (not condMapEmpty!3810)) mapNonEmpty!3810))

(assert (= (and mapNonEmpty!3810 ((_ is ValueCellFull!977) mapValue!3810)) b!101229))

(assert (= (and mapNonEmpty!3807 ((_ is ValueCellFull!977) mapDefault!3810)) b!101230))

(declare-fun m!111953 () Bool)

(assert (=> mapNonEmpty!3810 m!111953))

(declare-fun b_lambda!4519 () Bool)

(assert (= b_lambda!4511 (or (and b!100481 b_free!2449) (and b!100484 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))))) b_lambda!4519)))

(declare-fun b_lambda!4521 () Bool)

(assert (= b_lambda!4513 (or (and b!100481 b_free!2449 (= (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100484 b_free!2451) b_lambda!4521)))

(declare-fun b_lambda!4523 () Bool)

(assert (= b_lambda!4517 (or (and b!100481 b_free!2449 (= (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100484 b_free!2451) b_lambda!4523)))

(declare-fun b_lambda!4525 () Bool)

(assert (= b_lambda!4509 (or (and b!100481 b_free!2449) (and b!100484 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))))) b_lambda!4525)))

(declare-fun b_lambda!4527 () Bool)

(assert (= b_lambda!4515 (or (and b!100481 b_free!2449 (= (defaultEntry!2522 (v!2823 (underlying!337 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100484 b_free!2451) b_lambda!4527)))

(check-sat (not b!101022) (not d!27345) (not b!101128) (not b_lambda!4523) (not b!100997) (not b!101150) (not b!101045) (not b!101190) (not b!101092) (not d!27365) (not b!101023) (not b_lambda!4525) (not b!101053) (not b!100929) (not b!101034) (not b!101002) (not d!27293) (not b!101070) (not bm!10472) (not b!100896) (not b!101060) (not d!27337) (not b!101117) (not b!101125) (not bm!10445) (not d!27305) (not bm!10468) (not b!101209) (not d!27359) (not d!27393) (not b!101192) b_and!6219 (not b!100994) (not b!101219) (not b!101133) (not b!101007) (not d!27371) (not d!27401) (not d!27383) (not bm!10461) (not d!27351) (not d!27283) (not b!101062) (not d!27299) b_and!6217 (not bm!10453) (not b!101141) (not b!101212) (not b!101018) (not d!27303) (not d!27275) (not b!101077) (not b!100981) (not d!27379) (not d!27325) (not b_lambda!4527) (not d!27397) (not bm!10451) (not b!100897) (not b!100928) (not bm!10470) (not b!100898) (not b!101057) (not b!101055) (not b!100939) (not d!27277) (not bm!10490) (not b_lambda!4521) (not b!100933) (not b!101065) (not b!101220) (not d!27273) (not d!27285) (not b!101226) (not b!100968) (not b!100942) (not b!100890) (not d!27373) (not d!27341) (not b!100927) (not bm!10476) (not bm!10489) (not b!101223) (not b!100996) (not d!27405) (not b!101001) (not b!101030) (not b!101131) (not b!101225) (not d!27287) (not d!27347) (not b!100944) (not b!101049) (not bm!10462) (not d!27389) (not b!100888) (not d!27367) (not bm!10460) (not d!27307) (not d!27295) (not b!100936) (not bm!10455) (not mapNonEmpty!3810) (not d!27291) (not b!101076) (not d!27297) (not b!100887) (not b!100895) (not b!101213) (not b!101218) (not bm!10474) (not bm!10491) (not b!100885) (not b!101000) (not bm!10487) (not d!27385) (not d!27329) (not d!27391) (not b_lambda!4519) (not b!101048) (not d!27321) (not b!101078) (not b_lambda!4503) (not b!100989) (not bm!10449) (not b!101193) (not bm!10458) (not d!27301) (not b!101126) (not d!27309) (not b!101204) (not b_next!2449) (not d!27355) (not b!101032) (not b!100930) (not b!101031) (not mapNonEmpty!3809) (not b!101199) (not b!101120) (not d!27357) (not b!101047) (not b!100884) (not b!101215) (not b!100931) (not bm!10448) (not b!101013) (not b!101052) (not d!27313) (not bm!10454) (not b!100957) (not b!101015) (not b!100925) (not b!101140) (not d!27377) (not b!101121) (not d!27289) (not b!101089) (not b!100940) (not d!27317) (not b!100932) (not b!101122) (not d!27281) (not b!100978) (not d!27279) (not b_next!2451) (not d!27269) (not b!101224) (not b!100983) (not d!27363) (not b!101147) (not b!101059) (not b!101029) (not b!101119) (not bm!10475) (not d!27395) (not b!101149) (not bm!10488) (not b!101191) (not b!101010) (not bm!10469) (not b!101069) (not b!101088) (not b!101012) (not b_lambda!4507) (not d!27335) (not b!101136) (not d!27361) (not b!101130) (not b!100937) tp_is_empty!2641)
(check-sat b_and!6217 b_and!6219 (not b_next!2449) (not b_next!2451))
