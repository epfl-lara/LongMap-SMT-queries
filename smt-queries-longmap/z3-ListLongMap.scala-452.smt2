; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8328 () Bool)

(assert start!8328)

(declare-fun b!54778 () Bool)

(declare-fun b_free!1813 () Bool)

(declare-fun b_next!1813 () Bool)

(assert (=> b!54778 (= b_free!1813 (not b_next!1813))))

(declare-fun tp!7540 () Bool)

(declare-fun b_and!3165 () Bool)

(assert (=> b!54778 (= tp!7540 b_and!3165)))

(declare-fun b!54776 () Bool)

(declare-fun b_free!1815 () Bool)

(declare-fun b_next!1815 () Bool)

(assert (=> b!54776 (= b_free!1815 (not b_next!1815))))

(declare-fun tp!7541 () Bool)

(declare-fun b_and!3167 () Bool)

(assert (=> b!54776 (= tp!7541 b_and!3167)))

(declare-fun res!30938 () Bool)

(declare-fun e!35866 () Bool)

(assert (=> start!8328 (=> (not res!30938) (not e!35866))))

(declare-datatypes ((V!2745 0))(
  ( (V!2746 (val!1206 Int)) )
))
(declare-datatypes ((array!3555 0))(
  ( (array!3556 (arr!1700 (Array (_ BitVec 32) (_ BitVec 64))) (size!1929 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!818 0))(
  ( (ValueCellFull!818 (v!2300 V!2745)) (EmptyCell!818) )
))
(declare-datatypes ((array!3557 0))(
  ( (array!3558 (arr!1701 (Array (_ BitVec 32) ValueCell!818)) (size!1930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!544 0))(
  ( (LongMapFixedSize!545 (defaultEntry!1986 Int) (mask!5837 (_ BitVec 32)) (extraKeys!1877 (_ BitVec 32)) (zeroValue!1904 V!2745) (minValue!1904 V!2745) (_size!321 (_ BitVec 32)) (_keys!3606 array!3555) (_values!1969 array!3557) (_vacant!321 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!362 0))(
  ( (Cell!363 (v!2301 LongMapFixedSize!544)) )
))
(declare-datatypes ((LongMap!362 0))(
  ( (LongMap!363 (underlying!192 Cell!362)) )
))
(declare-fun thiss!992 () LongMap!362)

(declare-fun valid!225 (LongMap!362) Bool)

(assert (=> start!8328 (= res!30938 (valid!225 thiss!992))))

(assert (=> start!8328 e!35866))

(declare-fun e!35856 () Bool)

(assert (=> start!8328 e!35856))

(assert (=> start!8328 true))

(declare-fun e!35864 () Bool)

(assert (=> start!8328 e!35864))

(declare-fun b!54763 () Bool)

(declare-fun e!35859 () Bool)

(declare-fun tp_is_empty!2323 () Bool)

(assert (=> b!54763 (= e!35859 tp_is_empty!2323)))

(declare-fun b!54764 () Bool)

(declare-fun res!30937 () Bool)

(assert (=> b!54764 (=> (not res!30937) (not e!35866))))

(declare-fun newMap!16 () LongMapFixedSize!544)

(declare-fun valid!226 (LongMapFixedSize!544) Bool)

(assert (=> b!54764 (= res!30937 (valid!226 newMap!16))))

(declare-fun b!54765 () Bool)

(declare-fun res!30935 () Bool)

(assert (=> b!54765 (=> (not res!30935) (not e!35866))))

(assert (=> b!54765 (= res!30935 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5837 newMap!16)) (_size!321 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun mapNonEmpty!2639 () Bool)

(declare-fun mapRes!2640 () Bool)

(declare-fun tp!7539 () Bool)

(declare-fun e!35863 () Bool)

(assert (=> mapNonEmpty!2639 (= mapRes!2640 (and tp!7539 e!35863))))

(declare-fun mapValue!2639 () ValueCell!818)

(declare-fun mapRest!2639 () (Array (_ BitVec 32) ValueCell!818))

(declare-fun mapKey!2639 () (_ BitVec 32))

(assert (=> mapNonEmpty!2639 (= (arr!1701 (_values!1969 newMap!16)) (store mapRest!2639 mapKey!2639 mapValue!2639))))

(declare-fun b!54766 () Bool)

(declare-fun e!35855 () Bool)

(assert (=> b!54766 (= e!35855 tp_is_empty!2323)))

(declare-fun b!54767 () Bool)

(declare-fun e!35854 () Bool)

(assert (=> b!54767 (= e!35856 e!35854)))

(declare-fun b!54768 () Bool)

(declare-fun e!35857 () Bool)

(assert (=> b!54768 (= e!35857 true)))

(declare-fun lt!21715 () Bool)

(declare-datatypes ((List!1373 0))(
  ( (Nil!1370) (Cons!1369 (h!1949 (_ BitVec 64)) (t!4555 List!1373)) )
))
(declare-fun arrayNoDuplicates!0 (array!3555 (_ BitVec 32) List!1373) Bool)

(assert (=> b!54768 (= lt!21715 (arrayNoDuplicates!0 (_keys!3606 (v!2301 (underlying!192 thiss!992))) #b00000000000000000000000000000000 Nil!1370))))

(declare-fun mapIsEmpty!2639 () Bool)

(assert (=> mapIsEmpty!2639 mapRes!2640))

(declare-fun b!54769 () Bool)

(declare-fun e!35865 () Bool)

(declare-fun e!35858 () Bool)

(assert (=> b!54769 (= e!35865 (and e!35858 mapRes!2640))))

(declare-fun condMapEmpty!2639 () Bool)

(declare-fun mapDefault!2640 () ValueCell!818)

(assert (=> b!54769 (= condMapEmpty!2639 (= (arr!1701 (_values!1969 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!818)) mapDefault!2640)))))

(declare-fun mapNonEmpty!2640 () Bool)

(declare-fun mapRes!2639 () Bool)

(declare-fun tp!7542 () Bool)

(assert (=> mapNonEmpty!2640 (= mapRes!2639 (and tp!7542 e!35859))))

(declare-fun mapRest!2640 () (Array (_ BitVec 32) ValueCell!818))

(declare-fun mapKey!2640 () (_ BitVec 32))

(declare-fun mapValue!2640 () ValueCell!818)

(assert (=> mapNonEmpty!2640 (= (arr!1701 (_values!1969 (v!2301 (underlying!192 thiss!992)))) (store mapRest!2640 mapKey!2640 mapValue!2640))))

(declare-fun b!54770 () Bool)

(declare-fun e!35852 () Bool)

(assert (=> b!54770 (= e!35852 (not e!35857))))

(declare-fun res!30934 () Bool)

(assert (=> b!54770 (=> res!30934 e!35857)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54770 (= res!30934 (or (bvsge (size!1929 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1929 (_keys!3606 (v!2301 (underlying!192 thiss!992))))) (bvsgt from!355 (size!1929 (_keys!3606 (v!2301 (underlying!192 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54770 (arrayContainsKey!0 (_keys!3606 (v!2301 (underlying!192 thiss!992))) (select (arr!1700 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1448 0))(
  ( (Unit!1449) )
))
(declare-fun lt!21714 () Unit!1448)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!8 (array!3555 array!3557 (_ BitVec 32) (_ BitVec 32) V!2745 V!2745 (_ BitVec 64) (_ BitVec 32) Int) Unit!1448)

(assert (=> b!54770 (= lt!21714 (lemmaListMapContainsThenArrayContainsFrom!8 (_keys!3606 (v!2301 (underlying!192 thiss!992))) (_values!1969 (v!2301 (underlying!192 thiss!992))) (mask!5837 (v!2301 (underlying!192 thiss!992))) (extraKeys!1877 (v!2301 (underlying!192 thiss!992))) (zeroValue!1904 (v!2301 (underlying!192 thiss!992))) (minValue!1904 (v!2301 (underlying!192 thiss!992))) (select (arr!1700 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1986 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun b!54771 () Bool)

(declare-fun e!35853 () Bool)

(assert (=> b!54771 (= e!35853 (and e!35855 mapRes!2639))))

(declare-fun condMapEmpty!2640 () Bool)

(declare-fun mapDefault!2639 () ValueCell!818)

(assert (=> b!54771 (= condMapEmpty!2640 (= (arr!1701 (_values!1969 (v!2301 (underlying!192 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!818)) mapDefault!2639)))))

(declare-fun b!54772 () Bool)

(declare-fun e!35862 () Bool)

(assert (=> b!54772 (= e!35862 e!35852)))

(declare-fun res!30940 () Bool)

(assert (=> b!54772 (=> (not res!30940) (not e!35852))))

(declare-datatypes ((tuple2!1936 0))(
  ( (tuple2!1937 (_1!979 (_ BitVec 64)) (_2!979 V!2745)) )
))
(declare-datatypes ((List!1374 0))(
  ( (Nil!1371) (Cons!1370 (h!1950 tuple2!1936) (t!4556 List!1374)) )
))
(declare-datatypes ((ListLongMap!1299 0))(
  ( (ListLongMap!1300 (toList!665 List!1374)) )
))
(declare-fun lt!21712 () ListLongMap!1299)

(declare-fun contains!642 (ListLongMap!1299 (_ BitVec 64)) Bool)

(assert (=> b!54772 (= res!30940 (contains!642 lt!21712 (select (arr!1700 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1938 0))(
  ( (tuple2!1939 (_1!980 Bool) (_2!980 LongMapFixedSize!544)) )
))
(declare-fun lt!21713 () tuple2!1938)

(declare-fun update!69 (LongMapFixedSize!544 (_ BitVec 64) V!2745) tuple2!1938)

(declare-fun get!1026 (ValueCell!818 V!2745) V!2745)

(declare-fun dynLambda!287 (Int (_ BitVec 64)) V!2745)

(assert (=> b!54772 (= lt!21713 (update!69 newMap!16 (select (arr!1700 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) from!355) (get!1026 (select (arr!1701 (_values!1969 (v!2301 (underlying!192 thiss!992)))) from!355) (dynLambda!287 (defaultEntry!1986 (v!2301 (underlying!192 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54773 () Bool)

(declare-fun e!35861 () Bool)

(assert (=> b!54773 (= e!35854 e!35861)))

(declare-fun mapIsEmpty!2640 () Bool)

(assert (=> mapIsEmpty!2640 mapRes!2639))

(declare-fun b!54774 () Bool)

(declare-fun res!30936 () Bool)

(assert (=> b!54774 (=> (not res!30936) (not e!35866))))

(assert (=> b!54774 (= res!30936 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1929 (_keys!3606 (v!2301 (underlying!192 thiss!992)))))))))

(declare-fun b!54775 () Bool)

(assert (=> b!54775 (= e!35866 e!35862)))

(declare-fun res!30939 () Bool)

(assert (=> b!54775 (=> (not res!30939) (not e!35862))))

(declare-fun lt!21716 () ListLongMap!1299)

(assert (=> b!54775 (= res!30939 (and (= lt!21716 lt!21712) (not (= (select (arr!1700 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1700 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1064 (LongMapFixedSize!544) ListLongMap!1299)

(assert (=> b!54775 (= lt!21712 (map!1064 newMap!16))))

(declare-fun getCurrentListMap!368 (array!3555 array!3557 (_ BitVec 32) (_ BitVec 32) V!2745 V!2745 (_ BitVec 32) Int) ListLongMap!1299)

(assert (=> b!54775 (= lt!21716 (getCurrentListMap!368 (_keys!3606 (v!2301 (underlying!192 thiss!992))) (_values!1969 (v!2301 (underlying!192 thiss!992))) (mask!5837 (v!2301 (underlying!192 thiss!992))) (extraKeys!1877 (v!2301 (underlying!192 thiss!992))) (zeroValue!1904 (v!2301 (underlying!192 thiss!992))) (minValue!1904 (v!2301 (underlying!192 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1986 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun array_inv!1043 (array!3555) Bool)

(declare-fun array_inv!1044 (array!3557) Bool)

(assert (=> b!54776 (= e!35864 (and tp!7541 tp_is_empty!2323 (array_inv!1043 (_keys!3606 newMap!16)) (array_inv!1044 (_values!1969 newMap!16)) e!35865))))

(declare-fun b!54777 () Bool)

(assert (=> b!54777 (= e!35858 tp_is_empty!2323)))

(assert (=> b!54778 (= e!35861 (and tp!7540 tp_is_empty!2323 (array_inv!1043 (_keys!3606 (v!2301 (underlying!192 thiss!992)))) (array_inv!1044 (_values!1969 (v!2301 (underlying!192 thiss!992)))) e!35853))))

(declare-fun b!54779 () Bool)

(assert (=> b!54779 (= e!35863 tp_is_empty!2323)))

(assert (= (and start!8328 res!30938) b!54774))

(assert (= (and b!54774 res!30936) b!54764))

(assert (= (and b!54764 res!30937) b!54765))

(assert (= (and b!54765 res!30935) b!54775))

(assert (= (and b!54775 res!30939) b!54772))

(assert (= (and b!54772 res!30940) b!54770))

(assert (= (and b!54770 (not res!30934)) b!54768))

(assert (= (and b!54771 condMapEmpty!2640) mapIsEmpty!2640))

(assert (= (and b!54771 (not condMapEmpty!2640)) mapNonEmpty!2640))

(get-info :version)

(assert (= (and mapNonEmpty!2640 ((_ is ValueCellFull!818) mapValue!2640)) b!54763))

(assert (= (and b!54771 ((_ is ValueCellFull!818) mapDefault!2639)) b!54766))

(assert (= b!54778 b!54771))

(assert (= b!54773 b!54778))

(assert (= b!54767 b!54773))

(assert (= start!8328 b!54767))

(assert (= (and b!54769 condMapEmpty!2639) mapIsEmpty!2639))

(assert (= (and b!54769 (not condMapEmpty!2639)) mapNonEmpty!2639))

(assert (= (and mapNonEmpty!2639 ((_ is ValueCellFull!818) mapValue!2639)) b!54779))

(assert (= (and b!54769 ((_ is ValueCellFull!818) mapDefault!2640)) b!54777))

(assert (= b!54776 b!54769))

(assert (= start!8328 b!54776))

(declare-fun b_lambda!2417 () Bool)

(assert (=> (not b_lambda!2417) (not b!54772)))

(declare-fun t!4552 () Bool)

(declare-fun tb!1157 () Bool)

(assert (=> (and b!54778 (= (defaultEntry!1986 (v!2301 (underlying!192 thiss!992))) (defaultEntry!1986 (v!2301 (underlying!192 thiss!992)))) t!4552) tb!1157))

(declare-fun result!2133 () Bool)

(assert (=> tb!1157 (= result!2133 tp_is_empty!2323)))

(assert (=> b!54772 t!4552))

(declare-fun b_and!3169 () Bool)

(assert (= b_and!3165 (and (=> t!4552 result!2133) b_and!3169)))

(declare-fun t!4554 () Bool)

(declare-fun tb!1159 () Bool)

(assert (=> (and b!54776 (= (defaultEntry!1986 newMap!16) (defaultEntry!1986 (v!2301 (underlying!192 thiss!992)))) t!4554) tb!1159))

(declare-fun result!2137 () Bool)

(assert (= result!2137 result!2133))

(assert (=> b!54772 t!4554))

(declare-fun b_and!3171 () Bool)

(assert (= b_and!3167 (and (=> t!4554 result!2137) b_and!3171)))

(declare-fun m!46189 () Bool)

(assert (=> start!8328 m!46189))

(declare-fun m!46191 () Bool)

(assert (=> b!54776 m!46191))

(declare-fun m!46193 () Bool)

(assert (=> b!54776 m!46193))

(declare-fun m!46195 () Bool)

(assert (=> mapNonEmpty!2640 m!46195))

(declare-fun m!46197 () Bool)

(assert (=> b!54764 m!46197))

(declare-fun m!46199 () Bool)

(assert (=> mapNonEmpty!2639 m!46199))

(declare-fun m!46201 () Bool)

(assert (=> b!54775 m!46201))

(declare-fun m!46203 () Bool)

(assert (=> b!54775 m!46203))

(declare-fun m!46205 () Bool)

(assert (=> b!54775 m!46205))

(declare-fun m!46207 () Bool)

(assert (=> b!54778 m!46207))

(declare-fun m!46209 () Bool)

(assert (=> b!54778 m!46209))

(declare-fun m!46211 () Bool)

(assert (=> b!54768 m!46211))

(assert (=> b!54770 m!46201))

(assert (=> b!54770 m!46201))

(declare-fun m!46213 () Bool)

(assert (=> b!54770 m!46213))

(assert (=> b!54770 m!46201))

(declare-fun m!46215 () Bool)

(assert (=> b!54770 m!46215))

(declare-fun m!46217 () Bool)

(assert (=> b!54772 m!46217))

(declare-fun m!46219 () Bool)

(assert (=> b!54772 m!46219))

(declare-fun m!46221 () Bool)

(assert (=> b!54772 m!46221))

(assert (=> b!54772 m!46201))

(assert (=> b!54772 m!46219))

(assert (=> b!54772 m!46201))

(declare-fun m!46223 () Bool)

(assert (=> b!54772 m!46223))

(assert (=> b!54772 m!46201))

(assert (=> b!54772 m!46221))

(declare-fun m!46225 () Bool)

(assert (=> b!54772 m!46225))

(assert (=> b!54772 m!46217))

(check-sat (not b_next!1813) tp_is_empty!2323 (not b!54770) (not b!54764) (not b_next!1815) (not b!54775) (not b!54778) (not mapNonEmpty!2639) (not b!54768) b_and!3169 (not b!54772) (not b!54776) (not b_lambda!2417) b_and!3171 (not start!8328) (not mapNonEmpty!2640))
(check-sat b_and!3169 b_and!3171 (not b_next!1813) (not b_next!1815))
