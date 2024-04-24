; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15452 () Bool)

(assert start!15452)

(declare-fun b!153465 () Bool)

(declare-fun b_free!3181 () Bool)

(declare-fun b_next!3181 () Bool)

(assert (=> b!153465 (= b_free!3181 (not b_next!3181))))

(declare-fun tp!12061 () Bool)

(declare-fun b_and!9545 () Bool)

(assert (=> b!153465 (= tp!12061 b_and!9545)))

(declare-fun b!153467 () Bool)

(declare-fun b_free!3183 () Bool)

(declare-fun b_next!3183 () Bool)

(assert (=> b!153467 (= b_free!3183 (not b_next!3183))))

(declare-fun tp!12060 () Bool)

(declare-fun b_and!9547 () Bool)

(assert (=> b!153467 (= tp!12060 b_and!9547)))

(declare-fun b!153455 () Bool)

(declare-fun e!100177 () Bool)

(declare-fun tp_is_empty!3007 () Bool)

(assert (=> b!153455 (= e!100177 tp_is_empty!3007)))

(declare-fun mapNonEmpty!5107 () Bool)

(declare-fun mapRes!5107 () Bool)

(declare-fun tp!12062 () Bool)

(declare-fun e!100174 () Bool)

(assert (=> mapNonEmpty!5107 (= mapRes!5107 (and tp!12062 e!100174))))

(declare-datatypes ((V!3657 0))(
  ( (V!3658 (val!1548 Int)) )
))
(declare-datatypes ((ValueCell!1160 0))(
  ( (ValueCellFull!1160 (v!3399 V!3657)) (EmptyCell!1160) )
))
(declare-fun mapRest!5108 () (Array (_ BitVec 32) ValueCell!1160))

(declare-fun mapKey!5107 () (_ BitVec 32))

(declare-fun mapValue!5108 () ValueCell!1160)

(declare-datatypes ((array!5049 0))(
  ( (array!5050 (arr!2384 (Array (_ BitVec 32) (_ BitVec 64))) (size!2661 (_ BitVec 32))) )
))
(declare-datatypes ((array!5051 0))(
  ( (array!5052 (arr!2385 (Array (_ BitVec 32) ValueCell!1160)) (size!2662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1228 0))(
  ( (LongMapFixedSize!1229 (defaultEntry!3053 Int) (mask!7451 (_ BitVec 32)) (extraKeys!2794 (_ BitVec 32)) (zeroValue!2896 V!3657) (minValue!2896 V!3657) (_size!663 (_ BitVec 32)) (_keys!4826 array!5049) (_values!3036 array!5051) (_vacant!663 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1228)

(assert (=> mapNonEmpty!5107 (= (arr!2385 (_values!3036 newMap!16)) (store mapRest!5108 mapKey!5107 mapValue!5108))))

(declare-fun b!153456 () Bool)

(assert (=> b!153456 (= e!100174 tp_is_empty!3007)))

(declare-fun mapIsEmpty!5107 () Bool)

(assert (=> mapIsEmpty!5107 mapRes!5107))

(declare-fun b!153457 () Bool)

(declare-datatypes ((Unit!4889 0))(
  ( (Unit!4890) )
))
(declare-fun e!100165 () Unit!4889)

(declare-fun Unit!4891 () Unit!4889)

(assert (=> b!153457 (= e!100165 Unit!4891)))

(declare-fun b!153458 () Bool)

(declare-fun res!72550 () Bool)

(declare-fun e!100167 () Bool)

(assert (=> b!153458 (=> (not res!72550) (not e!100167))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!1010 0))(
  ( (Cell!1011 (v!3400 LongMapFixedSize!1228)) )
))
(declare-datatypes ((LongMap!1010 0))(
  ( (LongMap!1011 (underlying!516 Cell!1010)) )
))
(declare-fun thiss!992 () LongMap!1010)

(assert (=> b!153458 (= res!72550 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2661 (_keys!4826 (v!3400 (underlying!516 thiss!992)))))))))

(declare-fun b!153459 () Bool)

(declare-fun e!100164 () Bool)

(assert (=> b!153459 (= e!100164 tp_is_empty!3007)))

(declare-fun b!153461 () Bool)

(declare-fun e!100171 () Bool)

(declare-fun e!100173 () Bool)

(assert (=> b!153461 (= e!100171 e!100173)))

(declare-fun mapIsEmpty!5108 () Bool)

(declare-fun mapRes!5108 () Bool)

(assert (=> mapIsEmpty!5108 mapRes!5108))

(declare-fun mapNonEmpty!5108 () Bool)

(declare-fun tp!12059 () Bool)

(declare-fun e!100168 () Bool)

(assert (=> mapNonEmpty!5108 (= mapRes!5108 (and tp!12059 e!100168))))

(declare-fun mapValue!5107 () ValueCell!1160)

(declare-fun mapKey!5108 () (_ BitVec 32))

(declare-fun mapRest!5107 () (Array (_ BitVec 32) ValueCell!1160))

(assert (=> mapNonEmpty!5108 (= (arr!2385 (_values!3036 (v!3400 (underlying!516 thiss!992)))) (store mapRest!5107 mapKey!5108 mapValue!5107))))

(declare-fun b!153462 () Bool)

(declare-fun Unit!4892 () Unit!4889)

(assert (=> b!153462 (= e!100165 Unit!4892)))

(declare-fun lt!80683 () Unit!4889)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!162 (array!5049 array!5051 (_ BitVec 32) (_ BitVec 32) V!3657 V!3657 (_ BitVec 64) (_ BitVec 32) Int) Unit!4889)

(assert (=> b!153462 (= lt!80683 (lemmaListMapContainsThenArrayContainsFrom!162 (_keys!4826 (v!3400 (underlying!516 thiss!992))) (_values!3036 (v!3400 (underlying!516 thiss!992))) (mask!7451 (v!3400 (underlying!516 thiss!992))) (extraKeys!2794 (v!3400 (underlying!516 thiss!992))) (zeroValue!2896 (v!3400 (underlying!516 thiss!992))) (minValue!2896 (v!3400 (underlying!516 thiss!992))) (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3053 (v!3400 (underlying!516 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!153462 (arrayContainsKey!0 (_keys!4826 (v!3400 (underlying!516 thiss!992))) (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!80679 () Unit!4889)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5049 (_ BitVec 32) (_ BitVec 32)) Unit!4889)

(assert (=> b!153462 (= lt!80679 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4826 (v!3400 (underlying!516 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1779 0))(
  ( (Nil!1776) (Cons!1775 (h!2384 (_ BitVec 64)) (t!6553 List!1779)) )
))
(declare-fun arrayNoDuplicates!0 (array!5049 (_ BitVec 32) List!1779) Bool)

(assert (=> b!153462 (arrayNoDuplicates!0 (_keys!4826 (v!3400 (underlying!516 thiss!992))) from!355 Nil!1776)))

(declare-fun lt!80678 () Unit!4889)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5049 (_ BitVec 32) (_ BitVec 64) List!1779) Unit!4889)

(assert (=> b!153462 (= lt!80678 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4826 (v!3400 (underlying!516 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) (Cons!1775 (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) Nil!1776)))))

(assert (=> b!153462 false))

(declare-fun b!153463 () Bool)

(declare-fun e!100178 () Bool)

(assert (=> b!153463 (= e!100167 e!100178)))

(declare-fun res!72549 () Bool)

(assert (=> b!153463 (=> (not res!72549) (not e!100178))))

(declare-datatypes ((tuple2!2736 0))(
  ( (tuple2!2737 (_1!1379 (_ BitVec 64)) (_2!1379 V!3657)) )
))
(declare-datatypes ((List!1780 0))(
  ( (Nil!1777) (Cons!1776 (h!2385 tuple2!2736) (t!6554 List!1780)) )
))
(declare-datatypes ((ListLongMap!1747 0))(
  ( (ListLongMap!1748 (toList!889 List!1780)) )
))
(declare-fun lt!80681 () ListLongMap!1747)

(declare-fun lt!80684 () ListLongMap!1747)

(assert (=> b!153463 (= res!72549 (and (= lt!80681 lt!80684) (not (= (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1483 (LongMapFixedSize!1228) ListLongMap!1747)

(assert (=> b!153463 (= lt!80684 (map!1483 newMap!16))))

(declare-fun getCurrentListMap!558 (array!5049 array!5051 (_ BitVec 32) (_ BitVec 32) V!3657 V!3657 (_ BitVec 32) Int) ListLongMap!1747)

(assert (=> b!153463 (= lt!80681 (getCurrentListMap!558 (_keys!4826 (v!3400 (underlying!516 thiss!992))) (_values!3036 (v!3400 (underlying!516 thiss!992))) (mask!7451 (v!3400 (underlying!516 thiss!992))) (extraKeys!2794 (v!3400 (underlying!516 thiss!992))) (zeroValue!2896 (v!3400 (underlying!516 thiss!992))) (minValue!2896 (v!3400 (underlying!516 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3053 (v!3400 (underlying!516 thiss!992)))))))

(declare-fun b!153464 () Bool)

(declare-fun res!72548 () Bool)

(assert (=> b!153464 (=> (not res!72548) (not e!100167))))

(assert (=> b!153464 (= res!72548 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7451 newMap!16)) (_size!663 (v!3400 (underlying!516 thiss!992)))))))

(declare-fun e!100166 () Bool)

(declare-fun array_inv!1499 (array!5049) Bool)

(declare-fun array_inv!1500 (array!5051) Bool)

(assert (=> b!153465 (= e!100173 (and tp!12061 tp_is_empty!3007 (array_inv!1499 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) (array_inv!1500 (_values!3036 (v!3400 (underlying!516 thiss!992)))) e!100166))))

(declare-fun b!153466 () Bool)

(declare-fun e!100172 () Bool)

(assert (=> b!153466 (= e!100172 (and e!100164 mapRes!5107))))

(declare-fun condMapEmpty!5107 () Bool)

(declare-fun mapDefault!5108 () ValueCell!1160)

(assert (=> b!153466 (= condMapEmpty!5107 (= (arr!2385 (_values!3036 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1160)) mapDefault!5108)))))

(declare-fun e!100170 () Bool)

(assert (=> b!153467 (= e!100170 (and tp!12060 tp_is_empty!3007 (array_inv!1499 (_keys!4826 newMap!16)) (array_inv!1500 (_values!3036 newMap!16)) e!100172))))

(declare-fun b!153468 () Bool)

(assert (=> b!153468 (= e!100166 (and e!100177 mapRes!5108))))

(declare-fun condMapEmpty!5108 () Bool)

(declare-fun mapDefault!5107 () ValueCell!1160)

(assert (=> b!153468 (= condMapEmpty!5108 (= (arr!2385 (_values!3036 (v!3400 (underlying!516 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1160)) mapDefault!5107)))))

(declare-fun res!72552 () Bool)

(assert (=> start!15452 (=> (not res!72552) (not e!100167))))

(declare-fun valid!623 (LongMap!1010) Bool)

(assert (=> start!15452 (= res!72552 (valid!623 thiss!992))))

(assert (=> start!15452 e!100167))

(declare-fun e!100169 () Bool)

(assert (=> start!15452 e!100169))

(assert (=> start!15452 true))

(assert (=> start!15452 e!100170))

(declare-fun b!153460 () Bool)

(assert (=> b!153460 (= e!100178 false)))

(declare-fun lt!80680 () Unit!4889)

(assert (=> b!153460 (= lt!80680 e!100165)))

(declare-fun c!29467 () Bool)

(declare-fun contains!943 (ListLongMap!1747 (_ BitVec 64)) Bool)

(assert (=> b!153460 (= c!29467 (contains!943 lt!80684 (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2738 0))(
  ( (tuple2!2739 (_1!1380 Bool) (_2!1380 LongMapFixedSize!1228)) )
))
(declare-fun lt!80682 () tuple2!2738)

(declare-fun update!232 (LongMapFixedSize!1228 (_ BitVec 64) V!3657) tuple2!2738)

(declare-fun get!1604 (ValueCell!1160 V!3657) V!3657)

(declare-fun dynLambda!467 (Int (_ BitVec 64)) V!3657)

(assert (=> b!153460 (= lt!80682 (update!232 newMap!16 (select (arr!2384 (_keys!4826 (v!3400 (underlying!516 thiss!992)))) from!355) (get!1604 (select (arr!2385 (_values!3036 (v!3400 (underlying!516 thiss!992)))) from!355) (dynLambda!467 (defaultEntry!3053 (v!3400 (underlying!516 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!153469 () Bool)

(assert (=> b!153469 (= e!100169 e!100171)))

(declare-fun b!153470 () Bool)

(declare-fun res!72551 () Bool)

(assert (=> b!153470 (=> (not res!72551) (not e!100167))))

(declare-fun valid!624 (LongMapFixedSize!1228) Bool)

(assert (=> b!153470 (= res!72551 (valid!624 newMap!16))))

(declare-fun b!153471 () Bool)

(assert (=> b!153471 (= e!100168 tp_is_empty!3007)))

(assert (= (and start!15452 res!72552) b!153458))

(assert (= (and b!153458 res!72550) b!153470))

(assert (= (and b!153470 res!72551) b!153464))

(assert (= (and b!153464 res!72548) b!153463))

(assert (= (and b!153463 res!72549) b!153460))

(assert (= (and b!153460 c!29467) b!153462))

(assert (= (and b!153460 (not c!29467)) b!153457))

(assert (= (and b!153468 condMapEmpty!5108) mapIsEmpty!5108))

(assert (= (and b!153468 (not condMapEmpty!5108)) mapNonEmpty!5108))

(get-info :version)

(assert (= (and mapNonEmpty!5108 ((_ is ValueCellFull!1160) mapValue!5107)) b!153471))

(assert (= (and b!153468 ((_ is ValueCellFull!1160) mapDefault!5107)) b!153455))

(assert (= b!153465 b!153468))

(assert (= b!153461 b!153465))

(assert (= b!153469 b!153461))

(assert (= start!15452 b!153469))

(assert (= (and b!153466 condMapEmpty!5107) mapIsEmpty!5107))

(assert (= (and b!153466 (not condMapEmpty!5107)) mapNonEmpty!5107))

(assert (= (and mapNonEmpty!5107 ((_ is ValueCellFull!1160) mapValue!5108)) b!153456))

(assert (= (and b!153466 ((_ is ValueCellFull!1160) mapDefault!5108)) b!153459))

(assert (= b!153467 b!153466))

(assert (= start!15452 b!153467))

(declare-fun b_lambda!6851 () Bool)

(assert (=> (not b_lambda!6851) (not b!153460)))

(declare-fun t!6550 () Bool)

(declare-fun tb!2733 () Bool)

(assert (=> (and b!153465 (= (defaultEntry!3053 (v!3400 (underlying!516 thiss!992))) (defaultEntry!3053 (v!3400 (underlying!516 thiss!992)))) t!6550) tb!2733))

(declare-fun result!4455 () Bool)

(assert (=> tb!2733 (= result!4455 tp_is_empty!3007)))

(assert (=> b!153460 t!6550))

(declare-fun b_and!9549 () Bool)

(assert (= b_and!9545 (and (=> t!6550 result!4455) b_and!9549)))

(declare-fun tb!2735 () Bool)

(declare-fun t!6552 () Bool)

(assert (=> (and b!153467 (= (defaultEntry!3053 newMap!16) (defaultEntry!3053 (v!3400 (underlying!516 thiss!992)))) t!6552) tb!2735))

(declare-fun result!4459 () Bool)

(assert (= result!4459 result!4455))

(assert (=> b!153460 t!6552))

(declare-fun b_and!9551 () Bool)

(assert (= b_and!9547 (and (=> t!6552 result!4459) b_and!9551)))

(declare-fun m!187515 () Bool)

(assert (=> mapNonEmpty!5107 m!187515))

(declare-fun m!187517 () Bool)

(assert (=> b!153465 m!187517))

(declare-fun m!187519 () Bool)

(assert (=> b!153465 m!187519))

(declare-fun m!187521 () Bool)

(assert (=> b!153470 m!187521))

(declare-fun m!187523 () Bool)

(assert (=> start!15452 m!187523))

(declare-fun m!187525 () Bool)

(assert (=> b!153463 m!187525))

(declare-fun m!187527 () Bool)

(assert (=> b!153463 m!187527))

(declare-fun m!187529 () Bool)

(assert (=> b!153463 m!187529))

(declare-fun m!187531 () Bool)

(assert (=> mapNonEmpty!5108 m!187531))

(declare-fun m!187533 () Bool)

(assert (=> b!153460 m!187533))

(declare-fun m!187535 () Bool)

(assert (=> b!153460 m!187535))

(declare-fun m!187537 () Bool)

(assert (=> b!153460 m!187537))

(assert (=> b!153460 m!187525))

(assert (=> b!153460 m!187525))

(declare-fun m!187539 () Bool)

(assert (=> b!153460 m!187539))

(assert (=> b!153460 m!187535))

(assert (=> b!153460 m!187525))

(assert (=> b!153460 m!187537))

(declare-fun m!187541 () Bool)

(assert (=> b!153460 m!187541))

(assert (=> b!153460 m!187533))

(declare-fun m!187543 () Bool)

(assert (=> b!153462 m!187543))

(declare-fun m!187545 () Bool)

(assert (=> b!153462 m!187545))

(assert (=> b!153462 m!187525))

(declare-fun m!187547 () Bool)

(assert (=> b!153462 m!187547))

(assert (=> b!153462 m!187525))

(assert (=> b!153462 m!187525))

(declare-fun m!187549 () Bool)

(assert (=> b!153462 m!187549))

(assert (=> b!153462 m!187525))

(declare-fun m!187551 () Bool)

(assert (=> b!153462 m!187551))

(declare-fun m!187553 () Bool)

(assert (=> b!153467 m!187553))

(declare-fun m!187555 () Bool)

(assert (=> b!153467 m!187555))

(check-sat (not start!15452) (not b!153460) (not b!153470) (not mapNonEmpty!5108) b_and!9551 (not b!153463) b_and!9549 (not b_lambda!6851) tp_is_empty!3007 (not b!153462) (not b_next!3181) (not b!153467) (not mapNonEmpty!5107) (not b_next!3183) (not b!153465))
(check-sat b_and!9549 b_and!9551 (not b_next!3181) (not b_next!3183))
