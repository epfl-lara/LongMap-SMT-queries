; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15450 () Bool)

(assert start!15450)

(declare-fun b!153463 () Bool)

(declare-fun b_free!3185 () Bool)

(declare-fun b_next!3185 () Bool)

(assert (=> b!153463 (= b_free!3185 (not b_next!3185))))

(declare-fun tp!12071 () Bool)

(declare-fun b_and!9539 () Bool)

(assert (=> b!153463 (= tp!12071 b_and!9539)))

(declare-fun b!153469 () Bool)

(declare-fun b_free!3187 () Bool)

(declare-fun b_next!3187 () Bool)

(assert (=> b!153469 (= b_free!3187 (not b_next!3187))))

(declare-fun tp!12073 () Bool)

(declare-fun b_and!9541 () Bool)

(assert (=> b!153469 (= tp!12073 b_and!9541)))

(declare-fun b!153461 () Bool)

(declare-fun e!100197 () Bool)

(declare-fun tp_is_empty!3009 () Bool)

(assert (=> b!153461 (= e!100197 tp_is_empty!3009)))

(declare-fun b!153462 () Bool)

(declare-fun res!72543 () Bool)

(declare-fun e!100196 () Bool)

(assert (=> b!153462 (=> (not res!72543) (not e!100196))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3659 0))(
  ( (V!3660 (val!1549 Int)) )
))
(declare-datatypes ((array!5067 0))(
  ( (array!5068 (arr!2393 (Array (_ BitVec 32) (_ BitVec 64))) (size!2670 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1161 0))(
  ( (ValueCellFull!1161 (v!3400 V!3659)) (EmptyCell!1161) )
))
(declare-datatypes ((array!5069 0))(
  ( (array!5070 (arr!2394 (Array (_ BitVec 32) ValueCell!1161)) (size!2671 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1230 0))(
  ( (LongMapFixedSize!1231 (defaultEntry!3054 Int) (mask!7452 (_ BitVec 32)) (extraKeys!2795 (_ BitVec 32)) (zeroValue!2897 V!3659) (minValue!2897 V!3659) (_size!664 (_ BitVec 32)) (_keys!4827 array!5067) (_values!3037 array!5069) (_vacant!664 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1012 0))(
  ( (Cell!1013 (v!3401 LongMapFixedSize!1230)) )
))
(declare-datatypes ((LongMap!1012 0))(
  ( (LongMap!1013 (underlying!517 Cell!1012)) )
))
(declare-fun thiss!992 () LongMap!1012)

(assert (=> b!153462 (= res!72543 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2670 (_keys!4827 (v!3401 (underlying!517 thiss!992)))))))))

(declare-fun e!100193 () Bool)

(declare-fun e!100186 () Bool)

(declare-fun array_inv!1509 (array!5067) Bool)

(declare-fun array_inv!1510 (array!5069) Bool)

(assert (=> b!153463 (= e!100193 (and tp!12071 tp_is_empty!3009 (array_inv!1509 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) (array_inv!1510 (_values!3037 (v!3401 (underlying!517 thiss!992)))) e!100186))))

(declare-fun b!153464 () Bool)

(declare-fun e!100194 () Bool)

(assert (=> b!153464 (= e!100194 tp_is_empty!3009)))

(declare-fun b!153465 () Bool)

(declare-fun e!100188 () Bool)

(assert (=> b!153465 (= e!100188 false)))

(declare-datatypes ((Unit!4888 0))(
  ( (Unit!4889) )
))
(declare-fun lt!80644 () Unit!4888)

(declare-fun e!100191 () Unit!4888)

(assert (=> b!153465 (= lt!80644 e!100191)))

(declare-datatypes ((tuple2!2810 0))(
  ( (tuple2!2811 (_1!1416 (_ BitVec 64)) (_2!1416 V!3659)) )
))
(declare-datatypes ((List!1799 0))(
  ( (Nil!1796) (Cons!1795 (h!2404 tuple2!2810) (t!6585 List!1799)) )
))
(declare-datatypes ((ListLongMap!1805 0))(
  ( (ListLongMap!1806 (toList!918 List!1799)) )
))
(declare-fun lt!80641 () ListLongMap!1805)

(declare-fun c!29457 () Bool)

(declare-fun contains!965 (ListLongMap!1805 (_ BitVec 64)) Bool)

(assert (=> b!153465 (= c!29457 (contains!965 lt!80641 (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1230)

(declare-datatypes ((tuple2!2812 0))(
  ( (tuple2!2813 (_1!1417 Bool) (_2!1417 LongMapFixedSize!1230)) )
))
(declare-fun lt!80645 () tuple2!2812)

(declare-fun update!236 (LongMapFixedSize!1230 (_ BitVec 64) V!3659) tuple2!2812)

(declare-fun get!1599 (ValueCell!1161 V!3659) V!3659)

(declare-fun dynLambda!468 (Int (_ BitVec 64)) V!3659)

(assert (=> b!153465 (= lt!80645 (update!236 newMap!16 (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) (get!1599 (select (arr!2394 (_values!3037 (v!3401 (underlying!517 thiss!992)))) from!355) (dynLambda!468 (defaultEntry!3054 (v!3401 (underlying!517 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!153466 () Bool)

(declare-fun e!100199 () Bool)

(assert (=> b!153466 (= e!100199 tp_is_empty!3009)))

(declare-fun b!153467 () Bool)

(declare-fun e!100192 () Bool)

(assert (=> b!153467 (= e!100192 tp_is_empty!3009)))

(declare-fun mapIsEmpty!5113 () Bool)

(declare-fun mapRes!5114 () Bool)

(assert (=> mapIsEmpty!5113 mapRes!5114))

(declare-fun mapIsEmpty!5114 () Bool)

(declare-fun mapRes!5113 () Bool)

(assert (=> mapIsEmpty!5114 mapRes!5113))

(declare-fun b!153468 () Bool)

(declare-fun e!100185 () Bool)

(assert (=> b!153468 (= e!100185 (and e!100192 mapRes!5114))))

(declare-fun condMapEmpty!5113 () Bool)

(declare-fun mapDefault!5113 () ValueCell!1161)

(assert (=> b!153468 (= condMapEmpty!5113 (= (arr!2394 (_values!3037 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1161)) mapDefault!5113)))))

(declare-fun res!72544 () Bool)

(assert (=> start!15450 (=> (not res!72544) (not e!100196))))

(declare-fun valid!602 (LongMap!1012) Bool)

(assert (=> start!15450 (= res!72544 (valid!602 thiss!992))))

(assert (=> start!15450 e!100196))

(declare-fun e!100189 () Bool)

(assert (=> start!15450 e!100189))

(assert (=> start!15450 true))

(declare-fun e!100195 () Bool)

(assert (=> start!15450 e!100195))

(assert (=> b!153469 (= e!100195 (and tp!12073 tp_is_empty!3009 (array_inv!1509 (_keys!4827 newMap!16)) (array_inv!1510 (_values!3037 newMap!16)) e!100185))))

(declare-fun b!153470 () Bool)

(declare-fun res!72546 () Bool)

(assert (=> b!153470 (=> (not res!72546) (not e!100196))))

(assert (=> b!153470 (= res!72546 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7452 newMap!16)) (_size!664 (v!3401 (underlying!517 thiss!992)))))))

(declare-fun b!153471 () Bool)

(declare-fun e!100187 () Bool)

(assert (=> b!153471 (= e!100189 e!100187)))

(declare-fun mapNonEmpty!5113 () Bool)

(declare-fun tp!12072 () Bool)

(assert (=> mapNonEmpty!5113 (= mapRes!5113 (and tp!12072 e!100194))))

(declare-fun mapRest!5114 () (Array (_ BitVec 32) ValueCell!1161))

(declare-fun mapKey!5113 () (_ BitVec 32))

(declare-fun mapValue!5113 () ValueCell!1161)

(assert (=> mapNonEmpty!5113 (= (arr!2394 (_values!3037 (v!3401 (underlying!517 thiss!992)))) (store mapRest!5114 mapKey!5113 mapValue!5113))))

(declare-fun mapNonEmpty!5114 () Bool)

(declare-fun tp!12074 () Bool)

(assert (=> mapNonEmpty!5114 (= mapRes!5114 (and tp!12074 e!100197))))

(declare-fun mapRest!5113 () (Array (_ BitVec 32) ValueCell!1161))

(declare-fun mapKey!5114 () (_ BitVec 32))

(declare-fun mapValue!5114 () ValueCell!1161)

(assert (=> mapNonEmpty!5114 (= (arr!2394 (_values!3037 newMap!16)) (store mapRest!5113 mapKey!5114 mapValue!5114))))

(declare-fun b!153472 () Bool)

(assert (=> b!153472 (= e!100186 (and e!100199 mapRes!5113))))

(declare-fun condMapEmpty!5114 () Bool)

(declare-fun mapDefault!5114 () ValueCell!1161)

(assert (=> b!153472 (= condMapEmpty!5114 (= (arr!2394 (_values!3037 (v!3401 (underlying!517 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1161)) mapDefault!5114)))))

(declare-fun b!153473 () Bool)

(declare-fun Unit!4890 () Unit!4888)

(assert (=> b!153473 (= e!100191 Unit!4890)))

(declare-fun lt!80643 () Unit!4888)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!161 (array!5067 array!5069 (_ BitVec 32) (_ BitVec 32) V!3659 V!3659 (_ BitVec 64) (_ BitVec 32) Int) Unit!4888)

(assert (=> b!153473 (= lt!80643 (lemmaListMapContainsThenArrayContainsFrom!161 (_keys!4827 (v!3401 (underlying!517 thiss!992))) (_values!3037 (v!3401 (underlying!517 thiss!992))) (mask!7452 (v!3401 (underlying!517 thiss!992))) (extraKeys!2795 (v!3401 (underlying!517 thiss!992))) (zeroValue!2897 (v!3401 (underlying!517 thiss!992))) (minValue!2897 (v!3401 (underlying!517 thiss!992))) (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3054 (v!3401 (underlying!517 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!153473 (arrayContainsKey!0 (_keys!4827 (v!3401 (underlying!517 thiss!992))) (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!80640 () Unit!4888)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5067 (_ BitVec 32) (_ BitVec 32)) Unit!4888)

(assert (=> b!153473 (= lt!80640 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4827 (v!3401 (underlying!517 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1800 0))(
  ( (Nil!1797) (Cons!1796 (h!2405 (_ BitVec 64)) (t!6586 List!1800)) )
))
(declare-fun arrayNoDuplicates!0 (array!5067 (_ BitVec 32) List!1800) Bool)

(assert (=> b!153473 (arrayNoDuplicates!0 (_keys!4827 (v!3401 (underlying!517 thiss!992))) from!355 Nil!1797)))

(declare-fun lt!80646 () Unit!4888)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5067 (_ BitVec 32) (_ BitVec 64) List!1800) Unit!4888)

(assert (=> b!153473 (= lt!80646 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4827 (v!3401 (underlying!517 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) (Cons!1796 (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) Nil!1797)))))

(assert (=> b!153473 false))

(declare-fun b!153474 () Bool)

(assert (=> b!153474 (= e!100187 e!100193)))

(declare-fun b!153475 () Bool)

(declare-fun res!72542 () Bool)

(assert (=> b!153475 (=> (not res!72542) (not e!100196))))

(declare-fun valid!603 (LongMapFixedSize!1230) Bool)

(assert (=> b!153475 (= res!72542 (valid!603 newMap!16))))

(declare-fun b!153476 () Bool)

(declare-fun Unit!4891 () Unit!4888)

(assert (=> b!153476 (= e!100191 Unit!4891)))

(declare-fun b!153477 () Bool)

(assert (=> b!153477 (= e!100196 e!100188)))

(declare-fun res!72545 () Bool)

(assert (=> b!153477 (=> (not res!72545) (not e!100188))))

(declare-fun lt!80642 () ListLongMap!1805)

(assert (=> b!153477 (= res!72545 (and (= lt!80642 lt!80641) (not (= (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2393 (_keys!4827 (v!3401 (underlying!517 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1492 (LongMapFixedSize!1230) ListLongMap!1805)

(assert (=> b!153477 (= lt!80641 (map!1492 newMap!16))))

(declare-fun getCurrentListMap!584 (array!5067 array!5069 (_ BitVec 32) (_ BitVec 32) V!3659 V!3659 (_ BitVec 32) Int) ListLongMap!1805)

(assert (=> b!153477 (= lt!80642 (getCurrentListMap!584 (_keys!4827 (v!3401 (underlying!517 thiss!992))) (_values!3037 (v!3401 (underlying!517 thiss!992))) (mask!7452 (v!3401 (underlying!517 thiss!992))) (extraKeys!2795 (v!3401 (underlying!517 thiss!992))) (zeroValue!2897 (v!3401 (underlying!517 thiss!992))) (minValue!2897 (v!3401 (underlying!517 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3054 (v!3401 (underlying!517 thiss!992)))))))

(assert (= (and start!15450 res!72544) b!153462))

(assert (= (and b!153462 res!72543) b!153475))

(assert (= (and b!153475 res!72542) b!153470))

(assert (= (and b!153470 res!72546) b!153477))

(assert (= (and b!153477 res!72545) b!153465))

(assert (= (and b!153465 c!29457) b!153473))

(assert (= (and b!153465 (not c!29457)) b!153476))

(assert (= (and b!153472 condMapEmpty!5114) mapIsEmpty!5114))

(assert (= (and b!153472 (not condMapEmpty!5114)) mapNonEmpty!5113))

(get-info :version)

(assert (= (and mapNonEmpty!5113 ((_ is ValueCellFull!1161) mapValue!5113)) b!153464))

(assert (= (and b!153472 ((_ is ValueCellFull!1161) mapDefault!5114)) b!153466))

(assert (= b!153463 b!153472))

(assert (= b!153474 b!153463))

(assert (= b!153471 b!153474))

(assert (= start!15450 b!153471))

(assert (= (and b!153468 condMapEmpty!5113) mapIsEmpty!5113))

(assert (= (and b!153468 (not condMapEmpty!5113)) mapNonEmpty!5114))

(assert (= (and mapNonEmpty!5114 ((_ is ValueCellFull!1161) mapValue!5114)) b!153461))

(assert (= (and b!153468 ((_ is ValueCellFull!1161) mapDefault!5113)) b!153467))

(assert (= b!153469 b!153468))

(assert (= start!15450 b!153469))

(declare-fun b_lambda!6831 () Bool)

(assert (=> (not b_lambda!6831) (not b!153465)))

(declare-fun t!6582 () Bool)

(declare-fun tb!2745 () Bool)

(assert (=> (and b!153463 (= (defaultEntry!3054 (v!3401 (underlying!517 thiss!992))) (defaultEntry!3054 (v!3401 (underlying!517 thiss!992)))) t!6582) tb!2745))

(declare-fun result!4469 () Bool)

(assert (=> tb!2745 (= result!4469 tp_is_empty!3009)))

(assert (=> b!153465 t!6582))

(declare-fun b_and!9543 () Bool)

(assert (= b_and!9539 (and (=> t!6582 result!4469) b_and!9543)))

(declare-fun t!6584 () Bool)

(declare-fun tb!2747 () Bool)

(assert (=> (and b!153469 (= (defaultEntry!3054 newMap!16) (defaultEntry!3054 (v!3401 (underlying!517 thiss!992)))) t!6584) tb!2747))

(declare-fun result!4473 () Bool)

(assert (= result!4473 result!4469))

(assert (=> b!153465 t!6584))

(declare-fun b_and!9545 () Bool)

(assert (= b_and!9541 (and (=> t!6584 result!4473) b_and!9545)))

(declare-fun m!187375 () Bool)

(assert (=> b!153475 m!187375))

(declare-fun m!187377 () Bool)

(assert (=> start!15450 m!187377))

(declare-fun m!187379 () Bool)

(assert (=> b!153469 m!187379))

(declare-fun m!187381 () Bool)

(assert (=> b!153469 m!187381))

(declare-fun m!187383 () Bool)

(assert (=> b!153463 m!187383))

(declare-fun m!187385 () Bool)

(assert (=> b!153463 m!187385))

(declare-fun m!187387 () Bool)

(assert (=> mapNonEmpty!5113 m!187387))

(declare-fun m!187389 () Bool)

(assert (=> b!153465 m!187389))

(declare-fun m!187391 () Bool)

(assert (=> b!153465 m!187391))

(declare-fun m!187393 () Bool)

(assert (=> b!153465 m!187393))

(declare-fun m!187395 () Bool)

(assert (=> b!153465 m!187395))

(assert (=> b!153465 m!187391))

(assert (=> b!153465 m!187395))

(declare-fun m!187397 () Bool)

(assert (=> b!153465 m!187397))

(assert (=> b!153465 m!187395))

(assert (=> b!153465 m!187393))

(declare-fun m!187399 () Bool)

(assert (=> b!153465 m!187399))

(assert (=> b!153465 m!187389))

(declare-fun m!187401 () Bool)

(assert (=> b!153473 m!187401))

(declare-fun m!187403 () Bool)

(assert (=> b!153473 m!187403))

(assert (=> b!153473 m!187395))

(declare-fun m!187405 () Bool)

(assert (=> b!153473 m!187405))

(assert (=> b!153473 m!187395))

(assert (=> b!153473 m!187395))

(declare-fun m!187407 () Bool)

(assert (=> b!153473 m!187407))

(assert (=> b!153473 m!187395))

(declare-fun m!187409 () Bool)

(assert (=> b!153473 m!187409))

(assert (=> b!153477 m!187395))

(declare-fun m!187411 () Bool)

(assert (=> b!153477 m!187411))

(declare-fun m!187413 () Bool)

(assert (=> b!153477 m!187413))

(declare-fun m!187415 () Bool)

(assert (=> mapNonEmpty!5114 m!187415))

(check-sat (not b_lambda!6831) tp_is_empty!3009 (not b!153463) (not b!153477) (not b!153473) (not b!153475) b_and!9545 (not mapNonEmpty!5113) (not b!153465) (not start!15450) (not mapNonEmpty!5114) (not b!153469) b_and!9543 (not b_next!3185) (not b_next!3187))
(check-sat b_and!9543 b_and!9545 (not b_next!3185) (not b_next!3187))
