; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14570 () Bool)

(assert start!14570)

(declare-fun b!137542 () Bool)

(declare-fun b_free!2957 () Bool)

(declare-fun b_next!2957 () Bool)

(assert (=> b!137542 (= b_free!2957 (not b_next!2957))))

(declare-fun tp!11334 () Bool)

(declare-fun b_and!8523 () Bool)

(assert (=> b!137542 (= tp!11334 b_and!8523)))

(declare-fun b!137546 () Bool)

(declare-fun b_free!2959 () Bool)

(declare-fun b_next!2959 () Bool)

(assert (=> b!137546 (= b_free!2959 (not b_next!2959))))

(declare-fun tp!11331 () Bool)

(declare-fun b_and!8525 () Bool)

(assert (=> b!137546 (= tp!11331 b_and!8525)))

(declare-fun b!137535 () Bool)

(declare-fun res!65937 () Bool)

(declare-fun e!89558 () Bool)

(assert (=> b!137535 (=> (not res!65937) (not e!89558))))

(declare-datatypes ((V!3507 0))(
  ( (V!3508 (val!1492 Int)) )
))
(declare-datatypes ((array!4821 0))(
  ( (array!4822 (arr!2279 (Array (_ BitVec 32) (_ BitVec 64))) (size!2550 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1104 0))(
  ( (ValueCellFull!1104 (v!3236 V!3507)) (EmptyCell!1104) )
))
(declare-datatypes ((array!4823 0))(
  ( (array!4824 (arr!2280 (Array (_ BitVec 32) ValueCell!1104)) (size!2551 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1116 0))(
  ( (LongMapFixedSize!1117 (defaultEntry!2910 Int) (mask!7234 (_ BitVec 32)) (extraKeys!2667 (_ BitVec 32)) (zeroValue!2761 V!3507) (minValue!2761 V!3507) (_size!607 (_ BitVec 32)) (_keys!4667 array!4821) (_values!2893 array!4823) (_vacant!607 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1116)

(declare-datatypes ((Cell!904 0))(
  ( (Cell!905 (v!3237 LongMapFixedSize!1116)) )
))
(declare-datatypes ((LongMap!904 0))(
  ( (LongMap!905 (underlying!463 Cell!904)) )
))
(declare-fun thiss!992 () LongMap!904)

(assert (=> b!137535 (= res!65937 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7234 newMap!16)) (_size!607 (v!3237 (underlying!463 thiss!992)))))))

(declare-fun b!137536 () Bool)

(declare-fun e!89563 () Bool)

(declare-fun tp_is_empty!2895 () Bool)

(assert (=> b!137536 (= e!89563 tp_is_empty!2895)))

(declare-fun b!137537 () Bool)

(declare-fun e!89555 () Bool)

(declare-fun e!89564 () Bool)

(declare-fun mapRes!4715 () Bool)

(assert (=> b!137537 (= e!89555 (and e!89564 mapRes!4715))))

(declare-fun condMapEmpty!4715 () Bool)

(declare-fun mapDefault!4715 () ValueCell!1104)

(assert (=> b!137537 (= condMapEmpty!4715 (= (arr!2280 (_values!2893 (v!3237 (underlying!463 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1104)) mapDefault!4715)))))

(declare-fun b!137538 () Bool)

(declare-fun res!65938 () Bool)

(assert (=> b!137538 (=> (not res!65938) (not e!89558))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!137538 (= res!65938 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2550 (_keys!4667 (v!3237 (underlying!463 thiss!992)))))))))

(declare-fun mapNonEmpty!4715 () Bool)

(declare-fun mapRes!4716 () Bool)

(declare-fun tp!11332 () Bool)

(declare-fun e!89556 () Bool)

(assert (=> mapNonEmpty!4715 (= mapRes!4716 (and tp!11332 e!89556))))

(declare-fun mapKey!4715 () (_ BitVec 32))

(declare-fun mapValue!4715 () ValueCell!1104)

(declare-fun mapRest!4715 () (Array (_ BitVec 32) ValueCell!1104))

(assert (=> mapNonEmpty!4715 (= (arr!2280 (_values!2893 newMap!16)) (store mapRest!4715 mapKey!4715 mapValue!4715))))

(declare-fun b!137539 () Bool)

(assert (=> b!137539 (= e!89556 tp_is_empty!2895)))

(declare-fun b!137540 () Bool)

(declare-fun e!89559 () Bool)

(declare-fun e!89554 () Bool)

(assert (=> b!137540 (= e!89559 (and e!89554 mapRes!4716))))

(declare-fun condMapEmpty!4716 () Bool)

(declare-fun mapDefault!4716 () ValueCell!1104)

(assert (=> b!137540 (= condMapEmpty!4716 (= (arr!2280 (_values!2893 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1104)) mapDefault!4716)))))

(declare-fun mapIsEmpty!4715 () Bool)

(assert (=> mapIsEmpty!4715 mapRes!4715))

(declare-fun b!137541 () Bool)

(declare-fun res!65934 () Bool)

(assert (=> b!137541 (=> (not res!65934) (not e!89558))))

(declare-fun valid!537 (LongMapFixedSize!1116) Bool)

(assert (=> b!137541 (= res!65934 (valid!537 newMap!16))))

(declare-fun e!89560 () Bool)

(declare-fun array_inv!1435 (array!4821) Bool)

(declare-fun array_inv!1436 (array!4823) Bool)

(assert (=> b!137542 (= e!89560 (and tp!11334 tp_is_empty!2895 (array_inv!1435 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) (array_inv!1436 (_values!2893 (v!3237 (underlying!463 thiss!992)))) e!89555))))

(declare-fun mapIsEmpty!4716 () Bool)

(assert (=> mapIsEmpty!4716 mapRes!4716))

(declare-fun b!137543 () Bool)

(declare-fun e!89553 () Bool)

(declare-fun e!89562 () Bool)

(assert (=> b!137543 (= e!89553 e!89562)))

(declare-fun b!137544 () Bool)

(assert (=> b!137544 (= e!89562 e!89560)))

(declare-fun b!137545 () Bool)

(declare-fun e!89557 () Bool)

(assert (=> b!137545 (= e!89557 (not true))))

(declare-fun arrayContainsKey!0 (array!4821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137545 (arrayContainsKey!0 (_keys!4667 (v!3237 (underlying!463 thiss!992))) (select (arr!2279 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4336 0))(
  ( (Unit!4337) )
))
(declare-fun lt!71953 () Unit!4336)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!131 (array!4821 array!4823 (_ BitVec 32) (_ BitVec 32) V!3507 V!3507 (_ BitVec 64) (_ BitVec 32) Int) Unit!4336)

(assert (=> b!137545 (= lt!71953 (lemmaListMapContainsThenArrayContainsFrom!131 (_keys!4667 (v!3237 (underlying!463 thiss!992))) (_values!2893 (v!3237 (underlying!463 thiss!992))) (mask!7234 (v!3237 (underlying!463 thiss!992))) (extraKeys!2667 (v!3237 (underlying!463 thiss!992))) (zeroValue!2761 (v!3237 (underlying!463 thiss!992))) (minValue!2761 (v!3237 (underlying!463 thiss!992))) (select (arr!2279 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2910 (v!3237 (underlying!463 thiss!992)))))))

(declare-fun e!89566 () Bool)

(assert (=> b!137546 (= e!89566 (and tp!11331 tp_is_empty!2895 (array_inv!1435 (_keys!4667 newMap!16)) (array_inv!1436 (_values!2893 newMap!16)) e!89559))))

(declare-fun b!137547 () Bool)

(declare-fun e!89561 () Bool)

(assert (=> b!137547 (= e!89561 e!89557)))

(declare-fun res!65939 () Bool)

(assert (=> b!137547 (=> (not res!65939) (not e!89557))))

(declare-datatypes ((tuple2!2654 0))(
  ( (tuple2!2655 (_1!1338 (_ BitVec 64)) (_2!1338 V!3507)) )
))
(declare-datatypes ((List!1727 0))(
  ( (Nil!1724) (Cons!1723 (h!2330 tuple2!2654) (t!6235 List!1727)) )
))
(declare-datatypes ((ListLongMap!1721 0))(
  ( (ListLongMap!1722 (toList!876 List!1727)) )
))
(declare-fun lt!71954 () ListLongMap!1721)

(declare-fun contains!910 (ListLongMap!1721 (_ BitVec 64)) Bool)

(assert (=> b!137547 (= res!65939 (contains!910 lt!71954 (select (arr!2279 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2656 0))(
  ( (tuple2!2657 (_1!1339 Bool) (_2!1339 LongMapFixedSize!1116)) )
))
(declare-fun lt!71955 () tuple2!2656)

(declare-fun update!201 (LongMapFixedSize!1116 (_ BitVec 64) V!3507) tuple2!2656)

(declare-fun get!1501 (ValueCell!1104 V!3507) V!3507)

(declare-fun dynLambda!432 (Int (_ BitVec 64)) V!3507)

(assert (=> b!137547 (= lt!71955 (update!201 newMap!16 (select (arr!2279 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) from!355) (get!1501 (select (arr!2280 (_values!2893 (v!3237 (underlying!463 thiss!992)))) from!355) (dynLambda!432 (defaultEntry!2910 (v!3237 (underlying!463 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137548 () Bool)

(assert (=> b!137548 (= e!89558 e!89561)))

(declare-fun res!65935 () Bool)

(assert (=> b!137548 (=> (not res!65935) (not e!89561))))

(declare-fun lt!71956 () ListLongMap!1721)

(assert (=> b!137548 (= res!65935 (and (= lt!71956 lt!71954) (not (= (select (arr!2279 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2279 (_keys!4667 (v!3237 (underlying!463 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1421 (LongMapFixedSize!1116) ListLongMap!1721)

(assert (=> b!137548 (= lt!71954 (map!1421 newMap!16))))

(declare-fun getCurrentListMap!552 (array!4821 array!4823 (_ BitVec 32) (_ BitVec 32) V!3507 V!3507 (_ BitVec 32) Int) ListLongMap!1721)

(assert (=> b!137548 (= lt!71956 (getCurrentListMap!552 (_keys!4667 (v!3237 (underlying!463 thiss!992))) (_values!2893 (v!3237 (underlying!463 thiss!992))) (mask!7234 (v!3237 (underlying!463 thiss!992))) (extraKeys!2667 (v!3237 (underlying!463 thiss!992))) (zeroValue!2761 (v!3237 (underlying!463 thiss!992))) (minValue!2761 (v!3237 (underlying!463 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2910 (v!3237 (underlying!463 thiss!992)))))))

(declare-fun mapNonEmpty!4716 () Bool)

(declare-fun tp!11333 () Bool)

(assert (=> mapNonEmpty!4716 (= mapRes!4715 (and tp!11333 e!89563))))

(declare-fun mapValue!4716 () ValueCell!1104)

(declare-fun mapKey!4716 () (_ BitVec 32))

(declare-fun mapRest!4716 () (Array (_ BitVec 32) ValueCell!1104))

(assert (=> mapNonEmpty!4716 (= (arr!2280 (_values!2893 (v!3237 (underlying!463 thiss!992)))) (store mapRest!4716 mapKey!4716 mapValue!4716))))

(declare-fun res!65936 () Bool)

(assert (=> start!14570 (=> (not res!65936) (not e!89558))))

(declare-fun valid!538 (LongMap!904) Bool)

(assert (=> start!14570 (= res!65936 (valid!538 thiss!992))))

(assert (=> start!14570 e!89558))

(assert (=> start!14570 e!89553))

(assert (=> start!14570 true))

(assert (=> start!14570 e!89566))

(declare-fun b!137549 () Bool)

(assert (=> b!137549 (= e!89564 tp_is_empty!2895)))

(declare-fun b!137550 () Bool)

(assert (=> b!137550 (= e!89554 tp_is_empty!2895)))

(assert (= (and start!14570 res!65936) b!137538))

(assert (= (and b!137538 res!65938) b!137541))

(assert (= (and b!137541 res!65934) b!137535))

(assert (= (and b!137535 res!65937) b!137548))

(assert (= (and b!137548 res!65935) b!137547))

(assert (= (and b!137547 res!65939) b!137545))

(assert (= (and b!137537 condMapEmpty!4715) mapIsEmpty!4715))

(assert (= (and b!137537 (not condMapEmpty!4715)) mapNonEmpty!4716))

(get-info :version)

(assert (= (and mapNonEmpty!4716 ((_ is ValueCellFull!1104) mapValue!4716)) b!137536))

(assert (= (and b!137537 ((_ is ValueCellFull!1104) mapDefault!4715)) b!137549))

(assert (= b!137542 b!137537))

(assert (= b!137544 b!137542))

(assert (= b!137543 b!137544))

(assert (= start!14570 b!137543))

(assert (= (and b!137540 condMapEmpty!4716) mapIsEmpty!4716))

(assert (= (and b!137540 (not condMapEmpty!4716)) mapNonEmpty!4715))

(assert (= (and mapNonEmpty!4715 ((_ is ValueCellFull!1104) mapValue!4715)) b!137539))

(assert (= (and b!137540 ((_ is ValueCellFull!1104) mapDefault!4716)) b!137550))

(assert (= b!137546 b!137540))

(assert (= start!14570 b!137546))

(declare-fun b_lambda!6159 () Bool)

(assert (=> (not b_lambda!6159) (not b!137547)))

(declare-fun t!6232 () Bool)

(declare-fun tb!2469 () Bool)

(assert (=> (and b!137542 (= (defaultEntry!2910 (v!3237 (underlying!463 thiss!992))) (defaultEntry!2910 (v!3237 (underlying!463 thiss!992)))) t!6232) tb!2469))

(declare-fun result!4061 () Bool)

(assert (=> tb!2469 (= result!4061 tp_is_empty!2895)))

(assert (=> b!137547 t!6232))

(declare-fun b_and!8527 () Bool)

(assert (= b_and!8523 (and (=> t!6232 result!4061) b_and!8527)))

(declare-fun tb!2471 () Bool)

(declare-fun t!6234 () Bool)

(assert (=> (and b!137546 (= (defaultEntry!2910 newMap!16) (defaultEntry!2910 (v!3237 (underlying!463 thiss!992)))) t!6234) tb!2471))

(declare-fun result!4065 () Bool)

(assert (= result!4065 result!4061))

(assert (=> b!137547 t!6234))

(declare-fun b_and!8529 () Bool)

(assert (= b_and!8525 (and (=> t!6234 result!4065) b_and!8529)))

(declare-fun m!164465 () Bool)

(assert (=> b!137546 m!164465))

(declare-fun m!164467 () Bool)

(assert (=> b!137546 m!164467))

(declare-fun m!164469 () Bool)

(assert (=> b!137545 m!164469))

(assert (=> b!137545 m!164469))

(declare-fun m!164471 () Bool)

(assert (=> b!137545 m!164471))

(assert (=> b!137545 m!164469))

(declare-fun m!164473 () Bool)

(assert (=> b!137545 m!164473))

(declare-fun m!164475 () Bool)

(assert (=> mapNonEmpty!4716 m!164475))

(declare-fun m!164477 () Bool)

(assert (=> mapNonEmpty!4715 m!164477))

(declare-fun m!164479 () Bool)

(assert (=> b!137541 m!164479))

(declare-fun m!164481 () Bool)

(assert (=> start!14570 m!164481))

(declare-fun m!164483 () Bool)

(assert (=> b!137547 m!164483))

(declare-fun m!164485 () Bool)

(assert (=> b!137547 m!164485))

(declare-fun m!164487 () Bool)

(assert (=> b!137547 m!164487))

(assert (=> b!137547 m!164469))

(assert (=> b!137547 m!164485))

(assert (=> b!137547 m!164469))

(declare-fun m!164489 () Bool)

(assert (=> b!137547 m!164489))

(assert (=> b!137547 m!164469))

(assert (=> b!137547 m!164487))

(declare-fun m!164491 () Bool)

(assert (=> b!137547 m!164491))

(assert (=> b!137547 m!164483))

(assert (=> b!137548 m!164469))

(declare-fun m!164493 () Bool)

(assert (=> b!137548 m!164493))

(declare-fun m!164495 () Bool)

(assert (=> b!137548 m!164495))

(declare-fun m!164497 () Bool)

(assert (=> b!137542 m!164497))

(declare-fun m!164499 () Bool)

(assert (=> b!137542 m!164499))

(check-sat tp_is_empty!2895 b_and!8527 (not start!14570) (not b_lambda!6159) (not b!137548) (not b_next!2959) b_and!8529 (not b!137547) (not b!137542) (not b_next!2957) (not b!137546) (not mapNonEmpty!4715) (not mapNonEmpty!4716) (not b!137541) (not b!137545))
(check-sat b_and!8527 b_and!8529 (not b_next!2957) (not b_next!2959))
