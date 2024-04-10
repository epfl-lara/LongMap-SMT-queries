; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8338 () Bool)

(assert start!8338)

(declare-fun b!55193 () Bool)

(declare-fun b_free!1841 () Bool)

(declare-fun b_next!1841 () Bool)

(assert (=> b!55193 (= b_free!1841 (not b_next!1841))))

(declare-fun tp!7623 () Bool)

(declare-fun b_and!3223 () Bool)

(assert (=> b!55193 (= tp!7623 b_and!3223)))

(declare-fun b!55198 () Bool)

(declare-fun b_free!1843 () Bool)

(declare-fun b_next!1843 () Bool)

(assert (=> b!55198 (= b_free!1843 (not b_next!1843))))

(declare-fun tp!7626 () Bool)

(declare-fun b_and!3225 () Bool)

(assert (=> b!55198 (= tp!7626 b_and!3225)))

(declare-fun b!55191 () Bool)

(declare-fun e!36237 () Bool)

(declare-fun e!36236 () Bool)

(assert (=> b!55191 (= e!36237 e!36236)))

(declare-fun res!31106 () Bool)

(assert (=> b!55191 (=> (not res!31106) (not e!36236))))

(declare-datatypes ((V!2763 0))(
  ( (V!2764 (val!1213 Int)) )
))
(declare-datatypes ((array!3597 0))(
  ( (array!3598 (arr!1721 (Array (_ BitVec 32) (_ BitVec 64))) (size!1950 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!825 0))(
  ( (ValueCellFull!825 (v!2312 V!2763)) (EmptyCell!825) )
))
(declare-datatypes ((array!3599 0))(
  ( (array!3600 (arr!1722 (Array (_ BitVec 32) ValueCell!825)) (size!1951 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!558 0))(
  ( (LongMapFixedSize!559 (defaultEntry!1993 Int) (mask!5848 (_ BitVec 32)) (extraKeys!1884 (_ BitVec 32)) (zeroValue!1911 V!2763) (minValue!1911 V!2763) (_size!328 (_ BitVec 32)) (_keys!3613 array!3597) (_values!1976 array!3599) (_vacant!328 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!374 0))(
  ( (Cell!375 (v!2313 LongMapFixedSize!558)) )
))
(declare-datatypes ((LongMap!374 0))(
  ( (LongMap!375 (underlying!198 Cell!374)) )
))
(declare-fun thiss!992 () LongMap!374)

(declare-datatypes ((tuple2!1958 0))(
  ( (tuple2!1959 (_1!990 (_ BitVec 64)) (_2!990 V!2763)) )
))
(declare-datatypes ((List!1390 0))(
  ( (Nil!1387) (Cons!1386 (h!1966 tuple2!1958) (t!4600 List!1390)) )
))
(declare-datatypes ((ListLongMap!1327 0))(
  ( (ListLongMap!1328 (toList!679 List!1390)) )
))
(declare-fun lt!21861 () ListLongMap!1327)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!21864 () ListLongMap!1327)

(assert (=> b!55191 (= res!31106 (and (= lt!21861 lt!21864) (not (= (select (arr!1721 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1721 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!558)

(declare-fun map!1069 (LongMapFixedSize!558) ListLongMap!1327)

(assert (=> b!55191 (= lt!21864 (map!1069 newMap!16))))

(declare-fun getCurrentListMap!386 (array!3597 array!3599 (_ BitVec 32) (_ BitVec 32) V!2763 V!2763 (_ BitVec 32) Int) ListLongMap!1327)

(assert (=> b!55191 (= lt!21861 (getCurrentListMap!386 (_keys!3613 (v!2313 (underlying!198 thiss!992))) (_values!1976 (v!2313 (underlying!198 thiss!992))) (mask!5848 (v!2313 (underlying!198 thiss!992))) (extraKeys!1884 (v!2313 (underlying!198 thiss!992))) (zeroValue!1911 (v!2313 (underlying!198 thiss!992))) (minValue!1911 (v!2313 (underlying!198 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1993 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun mapIsEmpty!2681 () Bool)

(declare-fun mapRes!2681 () Bool)

(assert (=> mapIsEmpty!2681 mapRes!2681))

(declare-fun b!55192 () Bool)

(declare-fun e!36224 () Bool)

(assert (=> b!55192 (= e!36224 true)))

(declare-fun lt!21863 () Bool)

(declare-datatypes ((List!1391 0))(
  ( (Nil!1388) (Cons!1387 (h!1967 (_ BitVec 64)) (t!4601 List!1391)) )
))
(declare-fun arrayNoDuplicates!0 (array!3597 (_ BitVec 32) List!1391) Bool)

(assert (=> b!55192 (= lt!21863 (arrayNoDuplicates!0 (_keys!3613 (v!2313 (underlying!198 thiss!992))) #b00000000000000000000000000000000 Nil!1388))))

(declare-fun mapNonEmpty!2681 () Bool)

(declare-fun tp!7625 () Bool)

(declare-fun e!36227 () Bool)

(assert (=> mapNonEmpty!2681 (= mapRes!2681 (and tp!7625 e!36227))))

(declare-fun mapValue!2681 () ValueCell!825)

(declare-fun mapKey!2681 () (_ BitVec 32))

(declare-fun mapRest!2681 () (Array (_ BitVec 32) ValueCell!825))

(assert (=> mapNonEmpty!2681 (= (arr!1722 (_values!1976 newMap!16)) (store mapRest!2681 mapKey!2681 mapValue!2681))))

(declare-fun e!36226 () Bool)

(declare-fun e!36239 () Bool)

(declare-fun tp_is_empty!2337 () Bool)

(declare-fun array_inv!1065 (array!3597) Bool)

(declare-fun array_inv!1066 (array!3599) Bool)

(assert (=> b!55193 (= e!36239 (and tp!7623 tp_is_empty!2337 (array_inv!1065 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) (array_inv!1066 (_values!1976 (v!2313 (underlying!198 thiss!992)))) e!36226))))

(declare-fun res!31109 () Bool)

(assert (=> start!8338 (=> (not res!31109) (not e!36237))))

(declare-fun valid!220 (LongMap!374) Bool)

(assert (=> start!8338 (= res!31109 (valid!220 thiss!992))))

(assert (=> start!8338 e!36237))

(declare-fun e!36232 () Bool)

(assert (=> start!8338 e!36232))

(assert (=> start!8338 true))

(declare-fun e!36233 () Bool)

(assert (=> start!8338 e!36233))

(declare-fun mapIsEmpty!2682 () Bool)

(declare-fun mapRes!2682 () Bool)

(assert (=> mapIsEmpty!2682 mapRes!2682))

(declare-fun mapNonEmpty!2682 () Bool)

(declare-fun tp!7624 () Bool)

(declare-fun e!36231 () Bool)

(assert (=> mapNonEmpty!2682 (= mapRes!2682 (and tp!7624 e!36231))))

(declare-fun mapValue!2682 () ValueCell!825)

(declare-fun mapRest!2682 () (Array (_ BitVec 32) ValueCell!825))

(declare-fun mapKey!2682 () (_ BitVec 32))

(assert (=> mapNonEmpty!2682 (= (arr!1722 (_values!1976 (v!2313 (underlying!198 thiss!992)))) (store mapRest!2682 mapKey!2682 mapValue!2682))))

(declare-fun b!55194 () Bool)

(assert (=> b!55194 (= e!36231 tp_is_empty!2337)))

(declare-fun b!55195 () Bool)

(declare-fun e!36225 () Bool)

(assert (=> b!55195 (= e!36225 e!36239)))

(declare-fun b!55196 () Bool)

(declare-fun res!31107 () Bool)

(assert (=> b!55196 (=> (not res!31107) (not e!36237))))

(assert (=> b!55196 (= res!31107 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5848 newMap!16)) (_size!328 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun b!55197 () Bool)

(declare-fun res!31108 () Bool)

(assert (=> b!55197 (=> (not res!31108) (not e!36237))))

(assert (=> b!55197 (= res!31108 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1950 (_keys!3613 (v!2313 (underlying!198 thiss!992)))))))))

(declare-fun e!36235 () Bool)

(assert (=> b!55198 (= e!36233 (and tp!7626 tp_is_empty!2337 (array_inv!1065 (_keys!3613 newMap!16)) (array_inv!1066 (_values!1976 newMap!16)) e!36235))))

(declare-fun b!55199 () Bool)

(declare-fun e!36238 () Bool)

(assert (=> b!55199 (= e!36235 (and e!36238 mapRes!2681))))

(declare-fun condMapEmpty!2682 () Bool)

(declare-fun mapDefault!2681 () ValueCell!825)

(assert (=> b!55199 (= condMapEmpty!2682 (= (arr!1722 (_values!1976 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!825)) mapDefault!2681)))))

(declare-fun b!55200 () Bool)

(assert (=> b!55200 (= e!36232 e!36225)))

(declare-fun b!55201 () Bool)

(assert (=> b!55201 (= e!36238 tp_is_empty!2337)))

(declare-fun b!55202 () Bool)

(declare-fun e!36234 () Bool)

(assert (=> b!55202 (= e!36226 (and e!36234 mapRes!2682))))

(declare-fun condMapEmpty!2681 () Bool)

(declare-fun mapDefault!2682 () ValueCell!825)

(assert (=> b!55202 (= condMapEmpty!2681 (= (arr!1722 (_values!1976 (v!2313 (underlying!198 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!825)) mapDefault!2682)))))

(declare-fun b!55203 () Bool)

(assert (=> b!55203 (= e!36234 tp_is_empty!2337)))

(declare-fun b!55204 () Bool)

(declare-fun res!31112 () Bool)

(assert (=> b!55204 (=> (not res!31112) (not e!36237))))

(declare-fun valid!221 (LongMapFixedSize!558) Bool)

(assert (=> b!55204 (= res!31112 (valid!221 newMap!16))))

(declare-fun b!55205 () Bool)

(declare-fun e!36228 () Bool)

(assert (=> b!55205 (= e!36236 e!36228)))

(declare-fun res!31110 () Bool)

(assert (=> b!55205 (=> (not res!31110) (not e!36228))))

(declare-fun contains!652 (ListLongMap!1327 (_ BitVec 64)) Bool)

(assert (=> b!55205 (= res!31110 (contains!652 lt!21864 (select (arr!1721 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1960 0))(
  ( (tuple2!1961 (_1!991 Bool) (_2!991 LongMapFixedSize!558)) )
))
(declare-fun lt!21860 () tuple2!1960)

(declare-fun update!60 (LongMapFixedSize!558 (_ BitVec 64) V!2763) tuple2!1960)

(declare-fun get!1028 (ValueCell!825 V!2763) V!2763)

(declare-fun dynLambda!291 (Int (_ BitVec 64)) V!2763)

(assert (=> b!55205 (= lt!21860 (update!60 newMap!16 (select (arr!1721 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) from!355) (get!1028 (select (arr!1722 (_values!1976 (v!2313 (underlying!198 thiss!992)))) from!355) (dynLambda!291 (defaultEntry!1993 (v!2313 (underlying!198 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55206 () Bool)

(assert (=> b!55206 (= e!36228 (not e!36224))))

(declare-fun res!31111 () Bool)

(assert (=> b!55206 (=> res!31111 e!36224)))

(assert (=> b!55206 (= res!31111 (or (bvsge (size!1950 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1950 (_keys!3613 (v!2313 (underlying!198 thiss!992))))) (bvsgt from!355 (size!1950 (_keys!3613 (v!2313 (underlying!198 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55206 (arrayContainsKey!0 (_keys!3613 (v!2313 (underlying!198 thiss!992))) (select (arr!1721 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1449 0))(
  ( (Unit!1450) )
))
(declare-fun lt!21862 () Unit!1449)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!14 (array!3597 array!3599 (_ BitVec 32) (_ BitVec 32) V!2763 V!2763 (_ BitVec 64) (_ BitVec 32) Int) Unit!1449)

(assert (=> b!55206 (= lt!21862 (lemmaListMapContainsThenArrayContainsFrom!14 (_keys!3613 (v!2313 (underlying!198 thiss!992))) (_values!1976 (v!2313 (underlying!198 thiss!992))) (mask!5848 (v!2313 (underlying!198 thiss!992))) (extraKeys!1884 (v!2313 (underlying!198 thiss!992))) (zeroValue!1911 (v!2313 (underlying!198 thiss!992))) (minValue!1911 (v!2313 (underlying!198 thiss!992))) (select (arr!1721 (_keys!3613 (v!2313 (underlying!198 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1993 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun b!55207 () Bool)

(assert (=> b!55207 (= e!36227 tp_is_empty!2337)))

(assert (= (and start!8338 res!31109) b!55197))

(assert (= (and b!55197 res!31108) b!55204))

(assert (= (and b!55204 res!31112) b!55196))

(assert (= (and b!55196 res!31107) b!55191))

(assert (= (and b!55191 res!31106) b!55205))

(assert (= (and b!55205 res!31110) b!55206))

(assert (= (and b!55206 (not res!31111)) b!55192))

(assert (= (and b!55202 condMapEmpty!2681) mapIsEmpty!2682))

(assert (= (and b!55202 (not condMapEmpty!2681)) mapNonEmpty!2682))

(get-info :version)

(assert (= (and mapNonEmpty!2682 ((_ is ValueCellFull!825) mapValue!2682)) b!55194))

(assert (= (and b!55202 ((_ is ValueCellFull!825) mapDefault!2682)) b!55203))

(assert (= b!55193 b!55202))

(assert (= b!55195 b!55193))

(assert (= b!55200 b!55195))

(assert (= start!8338 b!55200))

(assert (= (and b!55199 condMapEmpty!2682) mapIsEmpty!2681))

(assert (= (and b!55199 (not condMapEmpty!2682)) mapNonEmpty!2681))

(assert (= (and mapNonEmpty!2681 ((_ is ValueCellFull!825) mapValue!2681)) b!55207))

(assert (= (and b!55199 ((_ is ValueCellFull!825) mapDefault!2681)) b!55201))

(assert (= b!55198 b!55199))

(assert (= start!8338 b!55198))

(declare-fun b_lambda!2431 () Bool)

(assert (=> (not b_lambda!2431) (not b!55205)))

(declare-fun t!4597 () Bool)

(declare-fun tb!1185 () Bool)

(assert (=> (and b!55193 (= (defaultEntry!1993 (v!2313 (underlying!198 thiss!992))) (defaultEntry!1993 (v!2313 (underlying!198 thiss!992)))) t!4597) tb!1185))

(declare-fun result!2175 () Bool)

(assert (=> tb!1185 (= result!2175 tp_is_empty!2337)))

(assert (=> b!55205 t!4597))

(declare-fun b_and!3227 () Bool)

(assert (= b_and!3223 (and (=> t!4597 result!2175) b_and!3227)))

(declare-fun tb!1187 () Bool)

(declare-fun t!4599 () Bool)

(assert (=> (and b!55198 (= (defaultEntry!1993 newMap!16) (defaultEntry!1993 (v!2313 (underlying!198 thiss!992)))) t!4599) tb!1187))

(declare-fun result!2179 () Bool)

(assert (= result!2179 result!2175))

(assert (=> b!55205 t!4599))

(declare-fun b_and!3229 () Bool)

(assert (= b_and!3225 (and (=> t!4599 result!2179) b_and!3229)))

(declare-fun m!46579 () Bool)

(assert (=> b!55191 m!46579))

(declare-fun m!46581 () Bool)

(assert (=> b!55191 m!46581))

(declare-fun m!46583 () Bool)

(assert (=> b!55191 m!46583))

(declare-fun m!46585 () Bool)

(assert (=> b!55193 m!46585))

(declare-fun m!46587 () Bool)

(assert (=> b!55193 m!46587))

(declare-fun m!46589 () Bool)

(assert (=> b!55192 m!46589))

(declare-fun m!46591 () Bool)

(assert (=> mapNonEmpty!2681 m!46591))

(assert (=> b!55206 m!46579))

(assert (=> b!55206 m!46579))

(declare-fun m!46593 () Bool)

(assert (=> b!55206 m!46593))

(assert (=> b!55206 m!46579))

(declare-fun m!46595 () Bool)

(assert (=> b!55206 m!46595))

(declare-fun m!46597 () Bool)

(assert (=> mapNonEmpty!2682 m!46597))

(declare-fun m!46599 () Bool)

(assert (=> b!55198 m!46599))

(declare-fun m!46601 () Bool)

(assert (=> b!55198 m!46601))

(declare-fun m!46603 () Bool)

(assert (=> b!55204 m!46603))

(assert (=> b!55205 m!46579))

(declare-fun m!46605 () Bool)

(assert (=> b!55205 m!46605))

(declare-fun m!46607 () Bool)

(assert (=> b!55205 m!46607))

(declare-fun m!46609 () Bool)

(assert (=> b!55205 m!46609))

(declare-fun m!46611 () Bool)

(assert (=> b!55205 m!46611))

(assert (=> b!55205 m!46579))

(assert (=> b!55205 m!46609))

(assert (=> b!55205 m!46579))

(assert (=> b!55205 m!46611))

(declare-fun m!46613 () Bool)

(assert (=> b!55205 m!46613))

(assert (=> b!55205 m!46607))

(declare-fun m!46615 () Bool)

(assert (=> start!8338 m!46615))

(check-sat b_and!3229 (not b!55206) (not b!55198) (not b!55205) (not b!55192) b_and!3227 (not mapNonEmpty!2681) (not b_next!1843) (not b!55193) tp_is_empty!2337 (not b_lambda!2431) (not mapNonEmpty!2682) (not b_next!1841) (not b!55191) (not b!55204) (not start!8338))
(check-sat b_and!3227 b_and!3229 (not b_next!1841) (not b_next!1843))
