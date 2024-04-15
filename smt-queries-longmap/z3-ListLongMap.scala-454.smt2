; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8340 () Bool)

(assert start!8340)

(declare-fun b!55079 () Bool)

(declare-fun b_free!1837 () Bool)

(declare-fun b_next!1837 () Bool)

(assert (=> b!55079 (= b_free!1837 (not b_next!1837))))

(declare-fun tp!7612 () Bool)

(declare-fun b_and!3217 () Bool)

(assert (=> b!55079 (= tp!7612 b_and!3217)))

(declare-fun b!55075 () Bool)

(declare-fun b_free!1839 () Bool)

(declare-fun b_next!1839 () Bool)

(assert (=> b!55075 (= b_free!1839 (not b_next!1839))))

(declare-fun tp!7611 () Bool)

(declare-fun b_and!3219 () Bool)

(assert (=> b!55075 (= tp!7611 b_and!3219)))

(declare-fun mapIsEmpty!2675 () Bool)

(declare-fun mapRes!2675 () Bool)

(assert (=> mapIsEmpty!2675 mapRes!2675))

(declare-fun b!55072 () Bool)

(declare-fun e!36146 () Bool)

(declare-fun e!36138 () Bool)

(assert (=> b!55072 (= e!36146 (and e!36138 mapRes!2675))))

(declare-fun condMapEmpty!2676 () Bool)

(declare-datatypes ((V!2761 0))(
  ( (V!2762 (val!1212 Int)) )
))
(declare-datatypes ((array!3573 0))(
  ( (array!3574 (arr!1708 (Array (_ BitVec 32) (_ BitVec 64))) (size!1938 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!824 0))(
  ( (ValueCellFull!824 (v!2306 V!2761)) (EmptyCell!824) )
))
(declare-datatypes ((array!3575 0))(
  ( (array!3576 (arr!1709 (Array (_ BitVec 32) ValueCell!824)) (size!1939 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!556 0))(
  ( (LongMapFixedSize!557 (defaultEntry!1992 Int) (mask!5846 (_ BitVec 32)) (extraKeys!1883 (_ BitVec 32)) (zeroValue!1910 V!2761) (minValue!1910 V!2761) (_size!327 (_ BitVec 32)) (_keys!3611 array!3573) (_values!1975 array!3575) (_vacant!327 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!368 0))(
  ( (Cell!369 (v!2307 LongMapFixedSize!556)) )
))
(declare-datatypes ((LongMap!368 0))(
  ( (LongMap!369 (underlying!195 Cell!368)) )
))
(declare-fun thiss!992 () LongMap!368)

(declare-fun mapDefault!2675 () ValueCell!824)

(assert (=> b!55072 (= condMapEmpty!2676 (= (arr!1709 (_values!1975 (v!2307 (underlying!195 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!824)) mapDefault!2675)))))

(declare-fun b!55073 () Bool)

(declare-fun e!36143 () Bool)

(declare-fun e!36141 () Bool)

(assert (=> b!55073 (= e!36143 e!36141)))

(declare-fun res!31066 () Bool)

(assert (=> b!55073 (=> (not res!31066) (not e!36141))))

(declare-datatypes ((tuple2!1966 0))(
  ( (tuple2!1967 (_1!994 (_ BitVec 64)) (_2!994 V!2761)) )
))
(declare-datatypes ((List!1395 0))(
  ( (Nil!1392) (Cons!1391 (h!1971 tuple2!1966) (t!4600 List!1395)) )
))
(declare-datatypes ((ListLongMap!1319 0))(
  ( (ListLongMap!1320 (toList!675 List!1395)) )
))
(declare-fun lt!21830 () ListLongMap!1319)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!649 (ListLongMap!1319 (_ BitVec 64)) Bool)

(assert (=> b!55073 (= res!31066 (contains!649 lt!21830 (select (arr!1708 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!556)

(declare-datatypes ((tuple2!1968 0))(
  ( (tuple2!1969 (_1!995 Bool) (_2!995 LongMapFixedSize!556)) )
))
(declare-fun lt!21832 () tuple2!1968)

(declare-fun update!68 (LongMapFixedSize!556 (_ BitVec 64) V!2761) tuple2!1968)

(declare-fun get!1032 (ValueCell!824 V!2761) V!2761)

(declare-fun dynLambda!292 (Int (_ BitVec 64)) V!2761)

(assert (=> b!55073 (= lt!21832 (update!68 newMap!16 (select (arr!1708 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) from!355) (get!1032 (select (arr!1709 (_values!1975 (v!2307 (underlying!195 thiss!992)))) from!355) (dynLambda!292 (defaultEntry!1992 (v!2307 (underlying!195 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55074 () Bool)

(declare-fun e!36139 () Bool)

(declare-fun e!36134 () Bool)

(assert (=> b!55074 (= e!36139 e!36134)))

(declare-fun res!31068 () Bool)

(declare-fun e!36136 () Bool)

(assert (=> start!8340 (=> (not res!31068) (not e!36136))))

(declare-fun valid!220 (LongMap!368) Bool)

(assert (=> start!8340 (= res!31068 (valid!220 thiss!992))))

(assert (=> start!8340 e!36136))

(declare-fun e!36145 () Bool)

(assert (=> start!8340 e!36145))

(assert (=> start!8340 true))

(declare-fun e!36142 () Bool)

(assert (=> start!8340 e!36142))

(declare-fun mapIsEmpty!2676 () Bool)

(declare-fun mapRes!2676 () Bool)

(assert (=> mapIsEmpty!2676 mapRes!2676))

(declare-fun tp_is_empty!2335 () Bool)

(declare-fun e!36137 () Bool)

(declare-fun array_inv!1053 (array!3573) Bool)

(declare-fun array_inv!1054 (array!3575) Bool)

(assert (=> b!55075 (= e!36142 (and tp!7611 tp_is_empty!2335 (array_inv!1053 (_keys!3611 newMap!16)) (array_inv!1054 (_values!1975 newMap!16)) e!36137))))

(declare-fun b!55076 () Bool)

(declare-fun e!36135 () Bool)

(assert (=> b!55076 (= e!36141 (not e!36135))))

(declare-fun res!31071 () Bool)

(assert (=> b!55076 (=> res!31071 e!36135)))

(assert (=> b!55076 (= res!31071 (or (bvsge (size!1938 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1938 (_keys!3611 (v!2307 (underlying!195 thiss!992))))) (bvsgt from!355 (size!1938 (_keys!3611 (v!2307 (underlying!195 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55076 (arrayContainsKey!0 (_keys!3611 (v!2307 (underlying!195 thiss!992))) (select (arr!1708 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1446 0))(
  ( (Unit!1447) )
))
(declare-fun lt!21833 () Unit!1446)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!10 (array!3573 array!3575 (_ BitVec 32) (_ BitVec 32) V!2761 V!2761 (_ BitVec 64) (_ BitVec 32) Int) Unit!1446)

(assert (=> b!55076 (= lt!21833 (lemmaListMapContainsThenArrayContainsFrom!10 (_keys!3611 (v!2307 (underlying!195 thiss!992))) (_values!1975 (v!2307 (underlying!195 thiss!992))) (mask!5846 (v!2307 (underlying!195 thiss!992))) (extraKeys!1883 (v!2307 (underlying!195 thiss!992))) (zeroValue!1910 (v!2307 (underlying!195 thiss!992))) (minValue!1910 (v!2307 (underlying!195 thiss!992))) (select (arr!1708 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1992 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!55077 () Bool)

(declare-fun res!31069 () Bool)

(assert (=> b!55077 (=> (not res!31069) (not e!36136))))

(assert (=> b!55077 (= res!31069 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5846 newMap!16)) (_size!327 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!55078 () Bool)

(declare-fun e!36133 () Bool)

(assert (=> b!55078 (= e!36133 tp_is_empty!2335)))

(assert (=> b!55079 (= e!36134 (and tp!7612 tp_is_empty!2335 (array_inv!1053 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) (array_inv!1054 (_values!1975 (v!2307 (underlying!195 thiss!992)))) e!36146))))

(declare-fun mapNonEmpty!2675 () Bool)

(declare-fun tp!7614 () Bool)

(declare-fun e!36140 () Bool)

(assert (=> mapNonEmpty!2675 (= mapRes!2676 (and tp!7614 e!36140))))

(declare-fun mapValue!2675 () ValueCell!824)

(declare-fun mapKey!2676 () (_ BitVec 32))

(declare-fun mapRest!2676 () (Array (_ BitVec 32) ValueCell!824))

(assert (=> mapNonEmpty!2675 (= (arr!1709 (_values!1975 newMap!16)) (store mapRest!2676 mapKey!2676 mapValue!2675))))

(declare-fun b!55080 () Bool)

(declare-fun res!31065 () Bool)

(assert (=> b!55080 (=> (not res!31065) (not e!36136))))

(declare-fun valid!221 (LongMapFixedSize!556) Bool)

(assert (=> b!55080 (= res!31065 (valid!221 newMap!16))))

(declare-fun b!55081 () Bool)

(declare-fun e!36147 () Bool)

(assert (=> b!55081 (= e!36147 tp_is_empty!2335)))

(declare-fun b!55082 () Bool)

(assert (=> b!55082 (= e!36136 e!36143)))

(declare-fun res!31067 () Bool)

(assert (=> b!55082 (=> (not res!31067) (not e!36143))))

(declare-fun lt!21829 () ListLongMap!1319)

(assert (=> b!55082 (= res!31067 (and (= lt!21829 lt!21830) (not (= (select (arr!1708 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1708 (_keys!3611 (v!2307 (underlying!195 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1068 (LongMapFixedSize!556) ListLongMap!1319)

(assert (=> b!55082 (= lt!21830 (map!1068 newMap!16))))

(declare-fun getCurrentListMap!374 (array!3573 array!3575 (_ BitVec 32) (_ BitVec 32) V!2761 V!2761 (_ BitVec 32) Int) ListLongMap!1319)

(assert (=> b!55082 (= lt!21829 (getCurrentListMap!374 (_keys!3611 (v!2307 (underlying!195 thiss!992))) (_values!1975 (v!2307 (underlying!195 thiss!992))) (mask!5846 (v!2307 (underlying!195 thiss!992))) (extraKeys!1883 (v!2307 (underlying!195 thiss!992))) (zeroValue!1910 (v!2307 (underlying!195 thiss!992))) (minValue!1910 (v!2307 (underlying!195 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1992 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!55083 () Bool)

(assert (=> b!55083 (= e!36137 (and e!36147 mapRes!2676))))

(declare-fun condMapEmpty!2675 () Bool)

(declare-fun mapDefault!2676 () ValueCell!824)

(assert (=> b!55083 (= condMapEmpty!2675 (= (arr!1709 (_values!1975 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!824)) mapDefault!2676)))))

(declare-fun b!55084 () Bool)

(assert (=> b!55084 (= e!36140 tp_is_empty!2335)))

(declare-fun b!55085 () Bool)

(declare-fun res!31070 () Bool)

(assert (=> b!55085 (=> (not res!31070) (not e!36136))))

(assert (=> b!55085 (= res!31070 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1938 (_keys!3611 (v!2307 (underlying!195 thiss!992)))))))))

(declare-fun b!55086 () Bool)

(assert (=> b!55086 (= e!36135 true)))

(declare-fun lt!21831 () Bool)

(declare-datatypes ((List!1396 0))(
  ( (Nil!1393) (Cons!1392 (h!1972 (_ BitVec 64)) (t!4601 List!1396)) )
))
(declare-fun arrayNoDuplicates!0 (array!3573 (_ BitVec 32) List!1396) Bool)

(assert (=> b!55086 (= lt!21831 (arrayNoDuplicates!0 (_keys!3611 (v!2307 (underlying!195 thiss!992))) #b00000000000000000000000000000000 Nil!1393))))

(declare-fun b!55087 () Bool)

(assert (=> b!55087 (= e!36145 e!36139)))

(declare-fun b!55088 () Bool)

(assert (=> b!55088 (= e!36138 tp_is_empty!2335)))

(declare-fun mapNonEmpty!2676 () Bool)

(declare-fun tp!7613 () Bool)

(assert (=> mapNonEmpty!2676 (= mapRes!2675 (and tp!7613 e!36133))))

(declare-fun mapKey!2675 () (_ BitVec 32))

(declare-fun mapRest!2675 () (Array (_ BitVec 32) ValueCell!824))

(declare-fun mapValue!2676 () ValueCell!824)

(assert (=> mapNonEmpty!2676 (= (arr!1709 (_values!1975 (v!2307 (underlying!195 thiss!992)))) (store mapRest!2675 mapKey!2675 mapValue!2676))))

(assert (= (and start!8340 res!31068) b!55085))

(assert (= (and b!55085 res!31070) b!55080))

(assert (= (and b!55080 res!31065) b!55077))

(assert (= (and b!55077 res!31069) b!55082))

(assert (= (and b!55082 res!31067) b!55073))

(assert (= (and b!55073 res!31066) b!55076))

(assert (= (and b!55076 (not res!31071)) b!55086))

(assert (= (and b!55072 condMapEmpty!2676) mapIsEmpty!2675))

(assert (= (and b!55072 (not condMapEmpty!2676)) mapNonEmpty!2676))

(get-info :version)

(assert (= (and mapNonEmpty!2676 ((_ is ValueCellFull!824) mapValue!2676)) b!55078))

(assert (= (and b!55072 ((_ is ValueCellFull!824) mapDefault!2675)) b!55088))

(assert (= b!55079 b!55072))

(assert (= b!55074 b!55079))

(assert (= b!55087 b!55074))

(assert (= start!8340 b!55087))

(assert (= (and b!55083 condMapEmpty!2675) mapIsEmpty!2676))

(assert (= (and b!55083 (not condMapEmpty!2675)) mapNonEmpty!2675))

(assert (= (and mapNonEmpty!2675 ((_ is ValueCellFull!824) mapValue!2675)) b!55084))

(assert (= (and b!55083 ((_ is ValueCellFull!824) mapDefault!2676)) b!55081))

(assert (= b!55075 b!55083))

(assert (= start!8340 b!55075))

(declare-fun b_lambda!2433 () Bool)

(assert (=> (not b_lambda!2433) (not b!55073)))

(declare-fun t!4597 () Bool)

(declare-fun tb!1181 () Bool)

(assert (=> (and b!55079 (= (defaultEntry!1992 (v!2307 (underlying!195 thiss!992))) (defaultEntry!1992 (v!2307 (underlying!195 thiss!992)))) t!4597) tb!1181))

(declare-fun result!2169 () Bool)

(assert (=> tb!1181 (= result!2169 tp_is_empty!2335)))

(assert (=> b!55073 t!4597))

(declare-fun b_and!3221 () Bool)

(assert (= b_and!3217 (and (=> t!4597 result!2169) b_and!3221)))

(declare-fun tb!1183 () Bool)

(declare-fun t!4599 () Bool)

(assert (=> (and b!55075 (= (defaultEntry!1992 newMap!16) (defaultEntry!1992 (v!2307 (underlying!195 thiss!992)))) t!4599) tb!1183))

(declare-fun result!2173 () Bool)

(assert (= result!2173 result!2169))

(assert (=> b!55073 t!4599))

(declare-fun b_and!3223 () Bool)

(assert (= b_and!3219 (and (=> t!4599 result!2173) b_and!3223)))

(declare-fun m!46459 () Bool)

(assert (=> b!55080 m!46459))

(declare-fun m!46461 () Bool)

(assert (=> start!8340 m!46461))

(declare-fun m!46463 () Bool)

(assert (=> b!55082 m!46463))

(declare-fun m!46465 () Bool)

(assert (=> b!55082 m!46465))

(declare-fun m!46467 () Bool)

(assert (=> b!55082 m!46467))

(declare-fun m!46469 () Bool)

(assert (=> b!55079 m!46469))

(declare-fun m!46471 () Bool)

(assert (=> b!55079 m!46471))

(declare-fun m!46473 () Bool)

(assert (=> b!55075 m!46473))

(declare-fun m!46475 () Bool)

(assert (=> b!55075 m!46475))

(declare-fun m!46477 () Bool)

(assert (=> mapNonEmpty!2676 m!46477))

(assert (=> b!55076 m!46463))

(assert (=> b!55076 m!46463))

(declare-fun m!46479 () Bool)

(assert (=> b!55076 m!46479))

(assert (=> b!55076 m!46463))

(declare-fun m!46481 () Bool)

(assert (=> b!55076 m!46481))

(declare-fun m!46483 () Bool)

(assert (=> b!55086 m!46483))

(declare-fun m!46485 () Bool)

(assert (=> mapNonEmpty!2675 m!46485))

(declare-fun m!46487 () Bool)

(assert (=> b!55073 m!46487))

(declare-fun m!46489 () Bool)

(assert (=> b!55073 m!46489))

(declare-fun m!46491 () Bool)

(assert (=> b!55073 m!46491))

(assert (=> b!55073 m!46463))

(declare-fun m!46493 () Bool)

(assert (=> b!55073 m!46493))

(assert (=> b!55073 m!46463))

(assert (=> b!55073 m!46489))

(assert (=> b!55073 m!46463))

(assert (=> b!55073 m!46491))

(declare-fun m!46495 () Bool)

(assert (=> b!55073 m!46495))

(assert (=> b!55073 m!46487))

(check-sat b_and!3223 (not b!55073) tp_is_empty!2335 (not b!55080) (not b!55079) (not b!55086) (not b!55075) (not b_next!1839) (not mapNonEmpty!2676) (not b_lambda!2433) (not b_next!1837) (not b!55082) (not mapNonEmpty!2675) b_and!3221 (not start!8340) (not b!55076))
(check-sat b_and!3221 b_and!3223 (not b_next!1837) (not b_next!1839))
