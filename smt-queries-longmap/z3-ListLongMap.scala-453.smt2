; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8332 () Bool)

(assert start!8332)

(declare-fun b!55034 () Bool)

(declare-fun b_free!1829 () Bool)

(declare-fun b_next!1829 () Bool)

(assert (=> b!55034 (= b_free!1829 (not b_next!1829))))

(declare-fun tp!7588 () Bool)

(declare-fun b_and!3199 () Bool)

(assert (=> b!55034 (= tp!7588 b_and!3199)))

(declare-fun b!55038 () Bool)

(declare-fun b_free!1831 () Bool)

(declare-fun b_next!1831 () Bool)

(assert (=> b!55038 (= b_free!1831 (not b_next!1831))))

(declare-fun tp!7587 () Bool)

(declare-fun b_and!3201 () Bool)

(assert (=> b!55038 (= tp!7587 b_and!3201)))

(declare-fun mapNonEmpty!2663 () Bool)

(declare-fun mapRes!2664 () Bool)

(declare-fun tp!7589 () Bool)

(declare-fun e!36087 () Bool)

(assert (=> mapNonEmpty!2663 (= mapRes!2664 (and tp!7589 e!36087))))

(declare-fun mapKey!2663 () (_ BitVec 32))

(declare-datatypes ((V!2755 0))(
  ( (V!2756 (val!1210 Int)) )
))
(declare-datatypes ((array!3585 0))(
  ( (array!3586 (arr!1715 (Array (_ BitVec 32) (_ BitVec 64))) (size!1944 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!822 0))(
  ( (ValueCellFull!822 (v!2306 V!2755)) (EmptyCell!822) )
))
(declare-datatypes ((array!3587 0))(
  ( (array!3588 (arr!1716 (Array (_ BitVec 32) ValueCell!822)) (size!1945 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!552 0))(
  ( (LongMapFixedSize!553 (defaultEntry!1990 Int) (mask!5843 (_ BitVec 32)) (extraKeys!1881 (_ BitVec 32)) (zeroValue!1908 V!2755) (minValue!1908 V!2755) (_size!325 (_ BitVec 32)) (_keys!3610 array!3585) (_values!1973 array!3587) (_vacant!325 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!552)

(declare-fun mapValue!2663 () ValueCell!822)

(declare-fun mapRest!2664 () (Array (_ BitVec 32) ValueCell!822))

(assert (=> mapNonEmpty!2663 (= (arr!1716 (_values!1973 newMap!16)) (store mapRest!2664 mapKey!2663 mapValue!2663))))

(declare-fun b!55032 () Bool)

(declare-fun e!36090 () Bool)

(declare-fun e!36080 () Bool)

(declare-fun mapRes!2663 () Bool)

(assert (=> b!55032 (= e!36090 (and e!36080 mapRes!2663))))

(declare-fun condMapEmpty!2663 () Bool)

(declare-datatypes ((Cell!368 0))(
  ( (Cell!369 (v!2307 LongMapFixedSize!552)) )
))
(declare-datatypes ((LongMap!368 0))(
  ( (LongMap!369 (underlying!195 Cell!368)) )
))
(declare-fun thiss!992 () LongMap!368)

(declare-fun mapDefault!2663 () ValueCell!822)

(assert (=> b!55032 (= condMapEmpty!2663 (= (arr!1716 (_values!1973 (v!2307 (underlying!195 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!822)) mapDefault!2663)))))

(declare-fun b!55033 () Bool)

(declare-fun res!31043 () Bool)

(declare-fun e!36086 () Bool)

(assert (=> b!55033 (=> (not res!31043) (not e!36086))))

(assert (=> b!55033 (= res!31043 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5843 newMap!16)) (_size!325 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun tp_is_empty!2331 () Bool)

(declare-fun e!36082 () Bool)

(declare-fun array_inv!1061 (array!3585) Bool)

(declare-fun array_inv!1062 (array!3587) Bool)

(assert (=> b!55034 (= e!36082 (and tp!7588 tp_is_empty!2331 (array_inv!1061 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) (array_inv!1062 (_values!1973 (v!2307 (underlying!195 thiss!992)))) e!36090))))

(declare-fun b!55035 () Bool)

(declare-fun e!36089 () Bool)

(assert (=> b!55035 (= e!36089 tp_is_empty!2331)))

(declare-fun b!55036 () Bool)

(declare-fun e!36084 () Bool)

(assert (=> b!55036 (= e!36086 e!36084)))

(declare-fun res!31045 () Bool)

(assert (=> b!55036 (=> (not res!31045) (not e!36084))))

(declare-datatypes ((tuple2!1950 0))(
  ( (tuple2!1951 (_1!986 (_ BitVec 64)) (_2!986 V!2755)) )
))
(declare-datatypes ((List!1387 0))(
  ( (Nil!1384) (Cons!1383 (h!1963 tuple2!1950) (t!4585 List!1387)) )
))
(declare-datatypes ((ListLongMap!1323 0))(
  ( (ListLongMap!1324 (toList!677 List!1387)) )
))
(declare-fun lt!21816 () ListLongMap!1323)

(declare-fun lt!21818 () ListLongMap!1323)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55036 (= res!31045 (and (= lt!21818 lt!21816) (not (= (select (arr!1715 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1715 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1066 (LongMapFixedSize!552) ListLongMap!1323)

(assert (=> b!55036 (= lt!21816 (map!1066 newMap!16))))

(declare-fun getCurrentListMap!385 (array!3585 array!3587 (_ BitVec 32) (_ BitVec 32) V!2755 V!2755 (_ BitVec 32) Int) ListLongMap!1323)

(assert (=> b!55036 (= lt!21818 (getCurrentListMap!385 (_keys!3610 (v!2307 (underlying!195 thiss!992))) (_values!1973 (v!2307 (underlying!195 thiss!992))) (mask!5843 (v!2307 (underlying!195 thiss!992))) (extraKeys!1881 (v!2307 (underlying!195 thiss!992))) (zeroValue!1908 (v!2307 (underlying!195 thiss!992))) (minValue!1908 (v!2307 (underlying!195 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1990 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!55037 () Bool)

(declare-fun res!31046 () Bool)

(assert (=> b!55037 (=> (not res!31046) (not e!36086))))

(declare-fun valid!216 (LongMapFixedSize!552) Bool)

(assert (=> b!55037 (= res!31046 (valid!216 newMap!16))))

(declare-fun e!36094 () Bool)

(declare-fun e!36088 () Bool)

(assert (=> b!55038 (= e!36088 (and tp!7587 tp_is_empty!2331 (array_inv!1061 (_keys!3610 newMap!16)) (array_inv!1062 (_values!1973 newMap!16)) e!36094))))

(declare-fun b!55039 () Bool)

(declare-fun e!36095 () Bool)

(assert (=> b!55039 (= e!36084 e!36095)))

(declare-fun res!31044 () Bool)

(assert (=> b!55039 (=> (not res!31044) (not e!36095))))

(declare-fun contains!650 (ListLongMap!1323 (_ BitVec 64)) Bool)

(assert (=> b!55039 (= res!31044 (contains!650 lt!21816 (select (arr!1715 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1952 0))(
  ( (tuple2!1953 (_1!987 Bool) (_2!987 LongMapFixedSize!552)) )
))
(declare-fun lt!21819 () tuple2!1952)

(declare-fun update!58 (LongMapFixedSize!552 (_ BitVec 64) V!2755) tuple2!1952)

(declare-fun get!1024 (ValueCell!822 V!2755) V!2755)

(declare-fun dynLambda!289 (Int (_ BitVec 64)) V!2755)

(assert (=> b!55039 (= lt!21819 (update!58 newMap!16 (select (arr!1715 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) from!355) (get!1024 (select (arr!1716 (_values!1973 (v!2307 (underlying!195 thiss!992)))) from!355) (dynLambda!289 (defaultEntry!1990 (v!2307 (underlying!195 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55040 () Bool)

(assert (=> b!55040 (= e!36087 tp_is_empty!2331)))

(declare-fun b!55041 () Bool)

(declare-fun res!31049 () Bool)

(assert (=> b!55041 (=> (not res!31049) (not e!36086))))

(assert (=> b!55041 (= res!31049 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1944 (_keys!3610 (v!2307 (underlying!195 thiss!992)))))))))

(declare-fun b!55042 () Bool)

(assert (=> b!55042 (= e!36080 tp_is_empty!2331)))

(declare-fun b!55043 () Bool)

(declare-fun e!36083 () Bool)

(assert (=> b!55043 (= e!36095 (not e!36083))))

(declare-fun res!31047 () Bool)

(assert (=> b!55043 (=> res!31047 e!36083)))

(assert (=> b!55043 (= res!31047 (or (bvsge (size!1944 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1944 (_keys!3610 (v!2307 (underlying!195 thiss!992))))) (bvsgt from!355 (size!1944 (_keys!3610 (v!2307 (underlying!195 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55043 (arrayContainsKey!0 (_keys!3610 (v!2307 (underlying!195 thiss!992))) (select (arr!1715 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1445 0))(
  ( (Unit!1446) )
))
(declare-fun lt!21817 () Unit!1445)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!12 (array!3585 array!3587 (_ BitVec 32) (_ BitVec 32) V!2755 V!2755 (_ BitVec 64) (_ BitVec 32) Int) Unit!1445)

(assert (=> b!55043 (= lt!21817 (lemmaListMapContainsThenArrayContainsFrom!12 (_keys!3610 (v!2307 (underlying!195 thiss!992))) (_values!1973 (v!2307 (underlying!195 thiss!992))) (mask!5843 (v!2307 (underlying!195 thiss!992))) (extraKeys!1881 (v!2307 (underlying!195 thiss!992))) (zeroValue!1908 (v!2307 (underlying!195 thiss!992))) (minValue!1908 (v!2307 (underlying!195 thiss!992))) (select (arr!1715 (_keys!3610 (v!2307 (underlying!195 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1990 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!55044 () Bool)

(declare-fun e!36081 () Bool)

(assert (=> b!55044 (= e!36081 e!36082)))

(declare-fun b!55045 () Bool)

(declare-fun e!36092 () Bool)

(assert (=> b!55045 (= e!36094 (and e!36092 mapRes!2664))))

(declare-fun condMapEmpty!2664 () Bool)

(declare-fun mapDefault!2664 () ValueCell!822)

(assert (=> b!55045 (= condMapEmpty!2664 (= (arr!1716 (_values!1973 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!822)) mapDefault!2664)))))

(declare-fun b!55046 () Bool)

(assert (=> b!55046 (= e!36083 true)))

(declare-fun lt!21815 () Bool)

(declare-datatypes ((List!1388 0))(
  ( (Nil!1385) (Cons!1384 (h!1964 (_ BitVec 64)) (t!4586 List!1388)) )
))
(declare-fun arrayNoDuplicates!0 (array!3585 (_ BitVec 32) List!1388) Bool)

(assert (=> b!55046 (= lt!21815 (arrayNoDuplicates!0 (_keys!3610 (v!2307 (underlying!195 thiss!992))) #b00000000000000000000000000000000 Nil!1385))))

(declare-fun b!55047 () Bool)

(assert (=> b!55047 (= e!36092 tp_is_empty!2331)))

(declare-fun res!31048 () Bool)

(assert (=> start!8332 (=> (not res!31048) (not e!36086))))

(declare-fun valid!217 (LongMap!368) Bool)

(assert (=> start!8332 (= res!31048 (valid!217 thiss!992))))

(assert (=> start!8332 e!36086))

(declare-fun e!36091 () Bool)

(assert (=> start!8332 e!36091))

(assert (=> start!8332 true))

(assert (=> start!8332 e!36088))

(declare-fun mapIsEmpty!2663 () Bool)

(assert (=> mapIsEmpty!2663 mapRes!2663))

(declare-fun b!55048 () Bool)

(assert (=> b!55048 (= e!36091 e!36081)))

(declare-fun mapIsEmpty!2664 () Bool)

(assert (=> mapIsEmpty!2664 mapRes!2664))

(declare-fun mapNonEmpty!2664 () Bool)

(declare-fun tp!7590 () Bool)

(assert (=> mapNonEmpty!2664 (= mapRes!2663 (and tp!7590 e!36089))))

(declare-fun mapKey!2664 () (_ BitVec 32))

(declare-fun mapRest!2663 () (Array (_ BitVec 32) ValueCell!822))

(declare-fun mapValue!2664 () ValueCell!822)

(assert (=> mapNonEmpty!2664 (= (arr!1716 (_values!1973 (v!2307 (underlying!195 thiss!992)))) (store mapRest!2663 mapKey!2664 mapValue!2664))))

(assert (= (and start!8332 res!31048) b!55041))

(assert (= (and b!55041 res!31049) b!55037))

(assert (= (and b!55037 res!31046) b!55033))

(assert (= (and b!55033 res!31043) b!55036))

(assert (= (and b!55036 res!31045) b!55039))

(assert (= (and b!55039 res!31044) b!55043))

(assert (= (and b!55043 (not res!31047)) b!55046))

(assert (= (and b!55032 condMapEmpty!2663) mapIsEmpty!2663))

(assert (= (and b!55032 (not condMapEmpty!2663)) mapNonEmpty!2664))

(get-info :version)

(assert (= (and mapNonEmpty!2664 ((_ is ValueCellFull!822) mapValue!2664)) b!55035))

(assert (= (and b!55032 ((_ is ValueCellFull!822) mapDefault!2663)) b!55042))

(assert (= b!55034 b!55032))

(assert (= b!55044 b!55034))

(assert (= b!55048 b!55044))

(assert (= start!8332 b!55048))

(assert (= (and b!55045 condMapEmpty!2664) mapIsEmpty!2664))

(assert (= (and b!55045 (not condMapEmpty!2664)) mapNonEmpty!2663))

(assert (= (and mapNonEmpty!2663 ((_ is ValueCellFull!822) mapValue!2663)) b!55040))

(assert (= (and b!55045 ((_ is ValueCellFull!822) mapDefault!2664)) b!55047))

(assert (= b!55038 b!55045))

(assert (= start!8332 b!55038))

(declare-fun b_lambda!2425 () Bool)

(assert (=> (not b_lambda!2425) (not b!55039)))

(declare-fun t!4582 () Bool)

(declare-fun tb!1173 () Bool)

(assert (=> (and b!55034 (= (defaultEntry!1990 (v!2307 (underlying!195 thiss!992))) (defaultEntry!1990 (v!2307 (underlying!195 thiss!992)))) t!4582) tb!1173))

(declare-fun result!2157 () Bool)

(assert (=> tb!1173 (= result!2157 tp_is_empty!2331)))

(assert (=> b!55039 t!4582))

(declare-fun b_and!3203 () Bool)

(assert (= b_and!3199 (and (=> t!4582 result!2157) b_and!3203)))

(declare-fun t!4584 () Bool)

(declare-fun tb!1175 () Bool)

(assert (=> (and b!55038 (= (defaultEntry!1990 newMap!16) (defaultEntry!1990 (v!2307 (underlying!195 thiss!992)))) t!4584) tb!1175))

(declare-fun result!2161 () Bool)

(assert (= result!2161 result!2157))

(assert (=> b!55039 t!4584))

(declare-fun b_and!3205 () Bool)

(assert (= b_and!3201 (and (=> t!4584 result!2161) b_and!3205)))

(declare-fun m!46465 () Bool)

(assert (=> b!55034 m!46465))

(declare-fun m!46467 () Bool)

(assert (=> b!55034 m!46467))

(declare-fun m!46469 () Bool)

(assert (=> b!55046 m!46469))

(declare-fun m!46471 () Bool)

(assert (=> mapNonEmpty!2663 m!46471))

(declare-fun m!46473 () Bool)

(assert (=> b!55036 m!46473))

(declare-fun m!46475 () Bool)

(assert (=> b!55036 m!46475))

(declare-fun m!46477 () Bool)

(assert (=> b!55036 m!46477))

(assert (=> b!55043 m!46473))

(assert (=> b!55043 m!46473))

(declare-fun m!46479 () Bool)

(assert (=> b!55043 m!46479))

(assert (=> b!55043 m!46473))

(declare-fun m!46481 () Bool)

(assert (=> b!55043 m!46481))

(declare-fun m!46483 () Bool)

(assert (=> b!55038 m!46483))

(declare-fun m!46485 () Bool)

(assert (=> b!55038 m!46485))

(declare-fun m!46487 () Bool)

(assert (=> start!8332 m!46487))

(declare-fun m!46489 () Bool)

(assert (=> mapNonEmpty!2664 m!46489))

(assert (=> b!55039 m!46473))

(declare-fun m!46491 () Bool)

(assert (=> b!55039 m!46491))

(declare-fun m!46493 () Bool)

(assert (=> b!55039 m!46493))

(declare-fun m!46495 () Bool)

(assert (=> b!55039 m!46495))

(declare-fun m!46497 () Bool)

(assert (=> b!55039 m!46497))

(assert (=> b!55039 m!46473))

(assert (=> b!55039 m!46495))

(assert (=> b!55039 m!46473))

(assert (=> b!55039 m!46497))

(declare-fun m!46499 () Bool)

(assert (=> b!55039 m!46499))

(assert (=> b!55039 m!46493))

(declare-fun m!46501 () Bool)

(assert (=> b!55037 m!46501))

(check-sat tp_is_empty!2331 (not mapNonEmpty!2664) (not b_next!1829) b_and!3205 (not b!55043) (not b_next!1831) b_and!3203 (not b!55037) (not b_lambda!2425) (not b!55038) (not b!55036) (not start!8332) (not b!55046) (not mapNonEmpty!2663) (not b!55039) (not b!55034))
(check-sat b_and!3203 b_and!3205 (not b_next!1829) (not b_next!1831))
