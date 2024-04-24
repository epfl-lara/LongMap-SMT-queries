; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8340 () Bool)

(assert start!8340)

(declare-fun b!55088 () Bool)

(declare-fun b_free!1837 () Bool)

(declare-fun b_next!1837 () Bool)

(assert (=> b!55088 (= b_free!1837 (not b_next!1837))))

(declare-fun tp!7612 () Bool)

(declare-fun b_and!3213 () Bool)

(assert (=> b!55088 (= tp!7612 b_and!3213)))

(declare-fun b!55085 () Bool)

(declare-fun b_free!1839 () Bool)

(declare-fun b_next!1839 () Bool)

(assert (=> b!55085 (= b_free!1839 (not b_next!1839))))

(declare-fun tp!7614 () Bool)

(declare-fun b_and!3215 () Bool)

(assert (=> b!55085 (= tp!7614 b_and!3215)))

(declare-fun b!55081 () Bool)

(declare-fun e!36152 () Bool)

(declare-fun e!36140 () Bool)

(declare-fun mapRes!2676 () Bool)

(assert (=> b!55081 (= e!36152 (and e!36140 mapRes!2676))))

(declare-fun condMapEmpty!2676 () Bool)

(declare-datatypes ((V!2761 0))(
  ( (V!2762 (val!1212 Int)) )
))
(declare-datatypes ((array!3579 0))(
  ( (array!3580 (arr!1712 (Array (_ BitVec 32) (_ BitVec 64))) (size!1941 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!824 0))(
  ( (ValueCellFull!824 (v!2312 V!2761)) (EmptyCell!824) )
))
(declare-datatypes ((array!3581 0))(
  ( (array!3582 (arr!1713 (Array (_ BitVec 32) ValueCell!824)) (size!1942 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!556 0))(
  ( (LongMapFixedSize!557 (defaultEntry!1992 Int) (mask!5847 (_ BitVec 32)) (extraKeys!1883 (_ BitVec 32)) (zeroValue!1910 V!2761) (minValue!1910 V!2761) (_size!327 (_ BitVec 32)) (_keys!3612 array!3579) (_values!1975 array!3581) (_vacant!327 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!556)

(declare-fun mapDefault!2675 () ValueCell!824)

(assert (=> b!55081 (= condMapEmpty!2676 (= (arr!1713 (_values!1975 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!824)) mapDefault!2675)))))

(declare-fun b!55082 () Bool)

(declare-fun e!36147 () Bool)

(declare-fun tp_is_empty!2335 () Bool)

(assert (=> b!55082 (= e!36147 tp_is_empty!2335)))

(declare-fun b!55083 () Bool)

(declare-fun e!36141 () Bool)

(declare-fun e!36153 () Bool)

(assert (=> b!55083 (= e!36141 e!36153)))

(declare-fun b!55084 () Bool)

(declare-fun res!31063 () Bool)

(declare-fun e!36148 () Bool)

(assert (=> b!55084 (=> (not res!31063) (not e!36148))))

(declare-datatypes ((Cell!374 0))(
  ( (Cell!375 (v!2313 LongMapFixedSize!556)) )
))
(declare-datatypes ((LongMap!374 0))(
  ( (LongMap!375 (underlying!198 Cell!374)) )
))
(declare-fun thiss!992 () LongMap!374)

(assert (=> b!55084 (= res!31063 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5847 newMap!16)) (_size!327 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun e!36144 () Bool)

(declare-fun array_inv!1053 (array!3579) Bool)

(declare-fun array_inv!1054 (array!3581) Bool)

(assert (=> b!55085 (= e!36144 (and tp!7614 tp_is_empty!2335 (array_inv!1053 (_keys!3612 newMap!16)) (array_inv!1054 (_values!1975 newMap!16)) e!36152))))

(declare-fun b!55086 () Bool)

(assert (=> b!55086 (= e!36140 tp_is_empty!2335)))

(declare-fun b!55087 () Bool)

(declare-fun res!31061 () Bool)

(assert (=> b!55087 (=> (not res!31061) (not e!36148))))

(declare-fun valid!233 (LongMapFixedSize!556) Bool)

(assert (=> b!55087 (= res!31061 (valid!233 newMap!16))))

(declare-fun e!36150 () Bool)

(assert (=> b!55088 (= e!36153 (and tp!7612 tp_is_empty!2335 (array_inv!1053 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) (array_inv!1054 (_values!1975 (v!2313 (underlying!198 thiss!992)))) e!36150))))

(declare-fun mapNonEmpty!2675 () Bool)

(declare-fun tp!7613 () Bool)

(declare-fun e!36146 () Bool)

(assert (=> mapNonEmpty!2675 (= mapRes!2676 (and tp!7613 e!36146))))

(declare-fun mapRest!2676 () (Array (_ BitVec 32) ValueCell!824))

(declare-fun mapKey!2676 () (_ BitVec 32))

(declare-fun mapValue!2676 () ValueCell!824)

(assert (=> mapNonEmpty!2675 (= (arr!1713 (_values!1975 newMap!16)) (store mapRest!2676 mapKey!2676 mapValue!2676))))

(declare-fun b!55089 () Bool)

(declare-fun e!36154 () Bool)

(assert (=> b!55089 (= e!36154 e!36141)))

(declare-fun b!55090 () Bool)

(declare-fun e!36145 () Bool)

(declare-fun e!36139 () Bool)

(assert (=> b!55090 (= e!36145 (not e!36139))))

(declare-fun res!31064 () Bool)

(assert (=> b!55090 (=> res!31064 e!36139)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55090 (= res!31064 (or (bvsge (size!1941 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1941 (_keys!3612 (v!2313 (underlying!198 thiss!992))))) (bvsgt from!355 (size!1941 (_keys!3612 (v!2313 (underlying!198 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55090 (arrayContainsKey!0 (_keys!3612 (v!2313 (underlying!198 thiss!992))) (select (arr!1712 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1454 0))(
  ( (Unit!1455) )
))
(declare-fun lt!21802 () Unit!1454)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!11 (array!3579 array!3581 (_ BitVec 32) (_ BitVec 32) V!2761 V!2761 (_ BitVec 64) (_ BitVec 32) Int) Unit!1454)

(assert (=> b!55090 (= lt!21802 (lemmaListMapContainsThenArrayContainsFrom!11 (_keys!3612 (v!2313 (underlying!198 thiss!992))) (_values!1975 (v!2313 (underlying!198 thiss!992))) (mask!5847 (v!2313 (underlying!198 thiss!992))) (extraKeys!1883 (v!2313 (underlying!198 thiss!992))) (zeroValue!1910 (v!2313 (underlying!198 thiss!992))) (minValue!1910 (v!2313 (underlying!198 thiss!992))) (select (arr!1712 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1992 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun mapIsEmpty!2675 () Bool)

(assert (=> mapIsEmpty!2675 mapRes!2676))

(declare-fun b!55091 () Bool)

(declare-fun e!36143 () Bool)

(assert (=> b!55091 (= e!36148 e!36143)))

(declare-fun res!31065 () Bool)

(assert (=> b!55091 (=> (not res!31065) (not e!36143))))

(declare-datatypes ((tuple2!1944 0))(
  ( (tuple2!1945 (_1!983 (_ BitVec 64)) (_2!983 V!2761)) )
))
(declare-datatypes ((List!1380 0))(
  ( (Nil!1377) (Cons!1376 (h!1956 tuple2!1944) (t!4586 List!1380)) )
))
(declare-datatypes ((ListLongMap!1303 0))(
  ( (ListLongMap!1304 (toList!667 List!1380)) )
))
(declare-fun lt!21806 () ListLongMap!1303)

(declare-fun lt!21804 () ListLongMap!1303)

(assert (=> b!55091 (= res!31065 (and (= lt!21804 lt!21806) (not (= (select (arr!1712 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1712 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1070 (LongMapFixedSize!556) ListLongMap!1303)

(assert (=> b!55091 (= lt!21806 (map!1070 newMap!16))))

(declare-fun getCurrentListMap!370 (array!3579 array!3581 (_ BitVec 32) (_ BitVec 32) V!2761 V!2761 (_ BitVec 32) Int) ListLongMap!1303)

(assert (=> b!55091 (= lt!21804 (getCurrentListMap!370 (_keys!3612 (v!2313 (underlying!198 thiss!992))) (_values!1975 (v!2313 (underlying!198 thiss!992))) (mask!5847 (v!2313 (underlying!198 thiss!992))) (extraKeys!1883 (v!2313 (underlying!198 thiss!992))) (zeroValue!1910 (v!2313 (underlying!198 thiss!992))) (minValue!1910 (v!2313 (underlying!198 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1992 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun b!55092 () Bool)

(declare-fun res!31062 () Bool)

(assert (=> b!55092 (=> (not res!31062) (not e!36148))))

(assert (=> b!55092 (= res!31062 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1941 (_keys!3612 (v!2313 (underlying!198 thiss!992)))))))))

(declare-fun res!31066 () Bool)

(assert (=> start!8340 (=> (not res!31066) (not e!36148))))

(declare-fun valid!234 (LongMap!374) Bool)

(assert (=> start!8340 (= res!31066 (valid!234 thiss!992))))

(assert (=> start!8340 e!36148))

(assert (=> start!8340 e!36154))

(assert (=> start!8340 true))

(assert (=> start!8340 e!36144))

(declare-fun mapIsEmpty!2676 () Bool)

(declare-fun mapRes!2675 () Bool)

(assert (=> mapIsEmpty!2676 mapRes!2675))

(declare-fun b!55093 () Bool)

(assert (=> b!55093 (= e!36150 (and e!36147 mapRes!2675))))

(declare-fun condMapEmpty!2675 () Bool)

(declare-fun mapDefault!2676 () ValueCell!824)

(assert (=> b!55093 (= condMapEmpty!2675 (= (arr!1713 (_values!1975 (v!2313 (underlying!198 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!824)) mapDefault!2676)))))

(declare-fun b!55094 () Bool)

(declare-fun e!36142 () Bool)

(assert (=> b!55094 (= e!36142 tp_is_empty!2335)))

(declare-fun b!55095 () Bool)

(assert (=> b!55095 (= e!36146 tp_is_empty!2335)))

(declare-fun mapNonEmpty!2676 () Bool)

(declare-fun tp!7611 () Bool)

(assert (=> mapNonEmpty!2676 (= mapRes!2675 (and tp!7611 e!36142))))

(declare-fun mapValue!2675 () ValueCell!824)

(declare-fun mapRest!2675 () (Array (_ BitVec 32) ValueCell!824))

(declare-fun mapKey!2675 () (_ BitVec 32))

(assert (=> mapNonEmpty!2676 (= (arr!1713 (_values!1975 (v!2313 (underlying!198 thiss!992)))) (store mapRest!2675 mapKey!2675 mapValue!2675))))

(declare-fun b!55096 () Bool)

(assert (=> b!55096 (= e!36139 true)))

(declare-fun lt!21805 () Bool)

(declare-datatypes ((List!1381 0))(
  ( (Nil!1378) (Cons!1377 (h!1957 (_ BitVec 64)) (t!4587 List!1381)) )
))
(declare-fun arrayNoDuplicates!0 (array!3579 (_ BitVec 32) List!1381) Bool)

(assert (=> b!55096 (= lt!21805 (arrayNoDuplicates!0 (_keys!3612 (v!2313 (underlying!198 thiss!992))) #b00000000000000000000000000000000 Nil!1378))))

(declare-fun b!55097 () Bool)

(assert (=> b!55097 (= e!36143 e!36145)))

(declare-fun res!31060 () Bool)

(assert (=> b!55097 (=> (not res!31060) (not e!36145))))

(declare-fun contains!644 (ListLongMap!1303 (_ BitVec 64)) Bool)

(assert (=> b!55097 (= res!31060 (contains!644 lt!21806 (select (arr!1712 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1946 0))(
  ( (tuple2!1947 (_1!984 Bool) (_2!984 LongMapFixedSize!556)) )
))
(declare-fun lt!21803 () tuple2!1946)

(declare-fun update!71 (LongMapFixedSize!556 (_ BitVec 64) V!2761) tuple2!1946)

(declare-fun get!1032 (ValueCell!824 V!2761) V!2761)

(declare-fun dynLambda!289 (Int (_ BitVec 64)) V!2761)

(assert (=> b!55097 (= lt!21803 (update!71 newMap!16 (select (arr!1712 (_keys!3612 (v!2313 (underlying!198 thiss!992)))) from!355) (get!1032 (select (arr!1713 (_values!1975 (v!2313 (underlying!198 thiss!992)))) from!355) (dynLambda!289 (defaultEntry!1992 (v!2313 (underlying!198 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!8340 res!31066) b!55092))

(assert (= (and b!55092 res!31062) b!55087))

(assert (= (and b!55087 res!31061) b!55084))

(assert (= (and b!55084 res!31063) b!55091))

(assert (= (and b!55091 res!31065) b!55097))

(assert (= (and b!55097 res!31060) b!55090))

(assert (= (and b!55090 (not res!31064)) b!55096))

(assert (= (and b!55093 condMapEmpty!2675) mapIsEmpty!2676))

(assert (= (and b!55093 (not condMapEmpty!2675)) mapNonEmpty!2676))

(get-info :version)

(assert (= (and mapNonEmpty!2676 ((_ is ValueCellFull!824) mapValue!2675)) b!55094))

(assert (= (and b!55093 ((_ is ValueCellFull!824) mapDefault!2676)) b!55082))

(assert (= b!55088 b!55093))

(assert (= b!55083 b!55088))

(assert (= b!55089 b!55083))

(assert (= start!8340 b!55089))

(assert (= (and b!55081 condMapEmpty!2676) mapIsEmpty!2675))

(assert (= (and b!55081 (not condMapEmpty!2676)) mapNonEmpty!2675))

(assert (= (and mapNonEmpty!2675 ((_ is ValueCellFull!824) mapValue!2676)) b!55095))

(assert (= (and b!55081 ((_ is ValueCellFull!824) mapDefault!2675)) b!55086))

(assert (= b!55085 b!55081))

(assert (= start!8340 b!55085))

(declare-fun b_lambda!2429 () Bool)

(assert (=> (not b_lambda!2429) (not b!55097)))

(declare-fun t!4583 () Bool)

(declare-fun tb!1181 () Bool)

(assert (=> (and b!55088 (= (defaultEntry!1992 (v!2313 (underlying!198 thiss!992))) (defaultEntry!1992 (v!2313 (underlying!198 thiss!992)))) t!4583) tb!1181))

(declare-fun result!2169 () Bool)

(assert (=> tb!1181 (= result!2169 tp_is_empty!2335)))

(assert (=> b!55097 t!4583))

(declare-fun b_and!3217 () Bool)

(assert (= b_and!3213 (and (=> t!4583 result!2169) b_and!3217)))

(declare-fun tb!1183 () Bool)

(declare-fun t!4585 () Bool)

(assert (=> (and b!55085 (= (defaultEntry!1992 newMap!16) (defaultEntry!1992 (v!2313 (underlying!198 thiss!992)))) t!4585) tb!1183))

(declare-fun result!2173 () Bool)

(assert (= result!2173 result!2169))

(assert (=> b!55097 t!4585))

(declare-fun b_and!3219 () Bool)

(assert (= b_and!3215 (and (=> t!4585 result!2173) b_and!3219)))

(declare-fun m!46417 () Bool)

(assert (=> b!55097 m!46417))

(declare-fun m!46419 () Bool)

(assert (=> b!55097 m!46419))

(declare-fun m!46421 () Bool)

(assert (=> b!55097 m!46421))

(declare-fun m!46423 () Bool)

(assert (=> b!55097 m!46423))

(assert (=> b!55097 m!46419))

(assert (=> b!55097 m!46423))

(declare-fun m!46425 () Bool)

(assert (=> b!55097 m!46425))

(assert (=> b!55097 m!46423))

(assert (=> b!55097 m!46421))

(declare-fun m!46427 () Bool)

(assert (=> b!55097 m!46427))

(assert (=> b!55097 m!46417))

(declare-fun m!46429 () Bool)

(assert (=> b!55096 m!46429))

(declare-fun m!46431 () Bool)

(assert (=> start!8340 m!46431))

(declare-fun m!46433 () Bool)

(assert (=> mapNonEmpty!2676 m!46433))

(assert (=> b!55091 m!46423))

(declare-fun m!46435 () Bool)

(assert (=> b!55091 m!46435))

(declare-fun m!46437 () Bool)

(assert (=> b!55091 m!46437))

(declare-fun m!46439 () Bool)

(assert (=> b!55087 m!46439))

(declare-fun m!46441 () Bool)

(assert (=> b!55085 m!46441))

(declare-fun m!46443 () Bool)

(assert (=> b!55085 m!46443))

(declare-fun m!46445 () Bool)

(assert (=> mapNonEmpty!2675 m!46445))

(assert (=> b!55090 m!46423))

(assert (=> b!55090 m!46423))

(declare-fun m!46447 () Bool)

(assert (=> b!55090 m!46447))

(assert (=> b!55090 m!46423))

(declare-fun m!46449 () Bool)

(assert (=> b!55090 m!46449))

(declare-fun m!46451 () Bool)

(assert (=> b!55088 m!46451))

(declare-fun m!46453 () Bool)

(assert (=> b!55088 m!46453))

(check-sat (not b!55097) (not mapNonEmpty!2676) (not b_next!1837) (not b!55096) (not b!55087) (not b!55090) (not b!55088) (not start!8340) (not mapNonEmpty!2675) tp_is_empty!2335 (not b_next!1839) (not b!55091) (not b_lambda!2429) b_and!3219 b_and!3217 (not b!55085))
(check-sat b_and!3217 b_and!3219 (not b_next!1837) (not b_next!1839))
