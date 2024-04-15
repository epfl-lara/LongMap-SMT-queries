; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8328 () Bool)

(assert start!8328)

(declare-fun b!54757 () Bool)

(declare-fun b_free!1813 () Bool)

(declare-fun b_next!1813 () Bool)

(assert (=> b!54757 (= b_free!1813 (not b_next!1813))))

(declare-fun tp!7540 () Bool)

(declare-fun b_and!3169 () Bool)

(assert (=> b!54757 (= tp!7540 b_and!3169)))

(declare-fun b!54758 () Bool)

(declare-fun b_free!1815 () Bool)

(declare-fun b_next!1815 () Bool)

(assert (=> b!54758 (= b_free!1815 (not b_next!1815))))

(declare-fun tp!7539 () Bool)

(declare-fun b_and!3171 () Bool)

(assert (=> b!54758 (= tp!7539 b_and!3171)))

(declare-fun b!54754 () Bool)

(declare-fun res!30945 () Bool)

(declare-fun e!35854 () Bool)

(assert (=> b!54754 (=> (not res!30945) (not e!35854))))

(declare-datatypes ((V!2745 0))(
  ( (V!2746 (val!1206 Int)) )
))
(declare-datatypes ((array!3549 0))(
  ( (array!3550 (arr!1696 (Array (_ BitVec 32) (_ BitVec 64))) (size!1926 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!818 0))(
  ( (ValueCellFull!818 (v!2295 V!2745)) (EmptyCell!818) )
))
(declare-datatypes ((array!3551 0))(
  ( (array!3552 (arr!1697 (Array (_ BitVec 32) ValueCell!818)) (size!1927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!544 0))(
  ( (LongMapFixedSize!545 (defaultEntry!1986 Int) (mask!5836 (_ BitVec 32)) (extraKeys!1877 (_ BitVec 32)) (zeroValue!1904 V!2745) (minValue!1904 V!2745) (_size!321 (_ BitVec 32)) (_keys!3605 array!3549) (_values!1969 array!3551) (_vacant!321 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!544)

(declare-datatypes ((Cell!358 0))(
  ( (Cell!359 (v!2296 LongMapFixedSize!544)) )
))
(declare-datatypes ((LongMap!358 0))(
  ( (LongMap!359 (underlying!190 Cell!358)) )
))
(declare-fun thiss!992 () LongMap!358)

(assert (=> b!54754 (= res!30945 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5836 newMap!16)) (_size!321 (v!2296 (underlying!190 thiss!992)))))))

(declare-fun b!54755 () Bool)

(declare-fun e!35851 () Bool)

(declare-fun tp_is_empty!2323 () Bool)

(assert (=> b!54755 (= e!35851 tp_is_empty!2323)))

(declare-fun b!54756 () Bool)

(declare-fun e!35860 () Bool)

(declare-fun e!35848 () Bool)

(assert (=> b!54756 (= e!35860 e!35848)))

(declare-fun e!35856 () Bool)

(declare-fun e!35850 () Bool)

(declare-fun array_inv!1045 (array!3549) Bool)

(declare-fun array_inv!1046 (array!3551) Bool)

(assert (=> b!54757 (= e!35856 (and tp!7540 tp_is_empty!2323 (array_inv!1045 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) (array_inv!1046 (_values!1969 (v!2296 (underlying!190 thiss!992)))) e!35850))))

(declare-fun mapNonEmpty!2639 () Bool)

(declare-fun mapRes!2640 () Bool)

(declare-fun tp!7542 () Bool)

(declare-fun e!35857 () Bool)

(assert (=> mapNonEmpty!2639 (= mapRes!2640 (and tp!7542 e!35857))))

(declare-fun mapRest!2639 () (Array (_ BitVec 32) ValueCell!818))

(declare-fun mapValue!2640 () ValueCell!818)

(declare-fun mapKey!2640 () (_ BitVec 32))

(assert (=> mapNonEmpty!2639 (= (arr!1697 (_values!1969 newMap!16)) (store mapRest!2639 mapKey!2640 mapValue!2640))))

(declare-fun e!35855 () Bool)

(declare-fun e!35845 () Bool)

(assert (=> b!54758 (= e!35855 (and tp!7539 tp_is_empty!2323 (array_inv!1045 (_keys!3605 newMap!16)) (array_inv!1046 (_values!1969 newMap!16)) e!35845))))

(declare-fun res!30944 () Bool)

(assert (=> start!8328 (=> (not res!30944) (not e!35854))))

(declare-fun valid!214 (LongMap!358) Bool)

(assert (=> start!8328 (= res!30944 (valid!214 thiss!992))))

(assert (=> start!8328 e!35854))

(assert (=> start!8328 e!35860))

(assert (=> start!8328 true))

(assert (=> start!8328 e!35855))

(declare-fun mapIsEmpty!2639 () Bool)

(assert (=> mapIsEmpty!2639 mapRes!2640))

(declare-fun b!54759 () Bool)

(declare-fun e!35858 () Bool)

(assert (=> b!54759 (= e!35858 tp_is_empty!2323)))

(declare-fun b!54760 () Bool)

(declare-fun e!35846 () Bool)

(assert (=> b!54760 (= e!35846 true)))

(declare-fun lt!21743 () Bool)

(declare-datatypes ((List!1388 0))(
  ( (Nil!1385) (Cons!1384 (h!1964 (_ BitVec 64)) (t!4569 List!1388)) )
))
(declare-fun arrayNoDuplicates!0 (array!3549 (_ BitVec 32) List!1388) Bool)

(assert (=> b!54760 (= lt!21743 (arrayNoDuplicates!0 (_keys!3605 (v!2296 (underlying!190 thiss!992))) #b00000000000000000000000000000000 Nil!1385))))

(declare-fun b!54761 () Bool)

(assert (=> b!54761 (= e!35845 (and e!35858 mapRes!2640))))

(declare-fun condMapEmpty!2640 () Bool)

(declare-fun mapDefault!2639 () ValueCell!818)

(assert (=> b!54761 (= condMapEmpty!2640 (= (arr!1697 (_values!1969 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!818)) mapDefault!2639)))))

(declare-fun b!54762 () Bool)

(declare-fun e!35852 () Bool)

(assert (=> b!54762 (= e!35852 tp_is_empty!2323)))

(declare-fun b!54763 () Bool)

(declare-fun mapRes!2639 () Bool)

(assert (=> b!54763 (= e!35850 (and e!35852 mapRes!2639))))

(declare-fun condMapEmpty!2639 () Bool)

(declare-fun mapDefault!2640 () ValueCell!818)

(assert (=> b!54763 (= condMapEmpty!2639 (= (arr!1697 (_values!1969 (v!2296 (underlying!190 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!818)) mapDefault!2640)))))

(declare-fun mapIsEmpty!2640 () Bool)

(assert (=> mapIsEmpty!2640 mapRes!2639))

(declare-fun b!54764 () Bool)

(declare-fun res!30942 () Bool)

(assert (=> b!54764 (=> (not res!30942) (not e!35854))))

(declare-fun valid!215 (LongMapFixedSize!544) Bool)

(assert (=> b!54764 (= res!30942 (valid!215 newMap!16))))

(declare-fun mapNonEmpty!2640 () Bool)

(declare-fun tp!7541 () Bool)

(assert (=> mapNonEmpty!2640 (= mapRes!2639 (and tp!7541 e!35851))))

(declare-fun mapValue!2639 () ValueCell!818)

(declare-fun mapKey!2639 () (_ BitVec 32))

(declare-fun mapRest!2640 () (Array (_ BitVec 32) ValueCell!818))

(assert (=> mapNonEmpty!2640 (= (arr!1697 (_values!1969 (v!2296 (underlying!190 thiss!992)))) (store mapRest!2640 mapKey!2639 mapValue!2639))))

(declare-fun b!54765 () Bool)

(assert (=> b!54765 (= e!35857 tp_is_empty!2323)))

(declare-fun b!54766 () Bool)

(declare-fun res!30939 () Bool)

(assert (=> b!54766 (=> (not res!30939) (not e!35854))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54766 (= res!30939 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1926 (_keys!3605 (v!2296 (underlying!190 thiss!992)))))))))

(declare-fun b!54767 () Bool)

(declare-fun e!35853 () Bool)

(declare-fun e!35849 () Bool)

(assert (=> b!54767 (= e!35853 e!35849)))

(declare-fun res!30941 () Bool)

(assert (=> b!54767 (=> (not res!30941) (not e!35849))))

(declare-datatypes ((tuple2!1950 0))(
  ( (tuple2!1951 (_1!986 (_ BitVec 64)) (_2!986 V!2745)) )
))
(declare-datatypes ((List!1389 0))(
  ( (Nil!1386) (Cons!1385 (h!1965 tuple2!1950) (t!4570 List!1389)) )
))
(declare-datatypes ((ListLongMap!1311 0))(
  ( (ListLongMap!1312 (toList!671 List!1389)) )
))
(declare-fun lt!21741 () ListLongMap!1311)

(declare-fun contains!645 (ListLongMap!1311 (_ BitVec 64)) Bool)

(assert (=> b!54767 (= res!30941 (contains!645 lt!21741 (select (arr!1696 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1952 0))(
  ( (tuple2!1953 (_1!987 Bool) (_2!987 LongMapFixedSize!544)) )
))
(declare-fun lt!21740 () tuple2!1952)

(declare-fun update!64 (LongMapFixedSize!544 (_ BitVec 64) V!2745) tuple2!1952)

(declare-fun get!1024 (ValueCell!818 V!2745) V!2745)

(declare-fun dynLambda!288 (Int (_ BitVec 64)) V!2745)

(assert (=> b!54767 (= lt!21740 (update!64 newMap!16 (select (arr!1696 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) from!355) (get!1024 (select (arr!1697 (_values!1969 (v!2296 (underlying!190 thiss!992)))) from!355) (dynLambda!288 (defaultEntry!1986 (v!2296 (underlying!190 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54768 () Bool)

(assert (=> b!54768 (= e!35854 e!35853)))

(declare-fun res!30940 () Bool)

(assert (=> b!54768 (=> (not res!30940) (not e!35853))))

(declare-fun lt!21742 () ListLongMap!1311)

(assert (=> b!54768 (= res!30940 (and (= lt!21742 lt!21741) (not (= (select (arr!1696 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1696 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1062 (LongMapFixedSize!544) ListLongMap!1311)

(assert (=> b!54768 (= lt!21741 (map!1062 newMap!16))))

(declare-fun getCurrentListMap!372 (array!3549 array!3551 (_ BitVec 32) (_ BitVec 32) V!2745 V!2745 (_ BitVec 32) Int) ListLongMap!1311)

(assert (=> b!54768 (= lt!21742 (getCurrentListMap!372 (_keys!3605 (v!2296 (underlying!190 thiss!992))) (_values!1969 (v!2296 (underlying!190 thiss!992))) (mask!5836 (v!2296 (underlying!190 thiss!992))) (extraKeys!1877 (v!2296 (underlying!190 thiss!992))) (zeroValue!1904 (v!2296 (underlying!190 thiss!992))) (minValue!1904 (v!2296 (underlying!190 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1986 (v!2296 (underlying!190 thiss!992)))))))

(declare-fun b!54769 () Bool)

(assert (=> b!54769 (= e!35848 e!35856)))

(declare-fun b!54770 () Bool)

(assert (=> b!54770 (= e!35849 (not e!35846))))

(declare-fun res!30943 () Bool)

(assert (=> b!54770 (=> res!30943 e!35846)))

(assert (=> b!54770 (= res!30943 (or (bvsge (size!1926 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1926 (_keys!3605 (v!2296 (underlying!190 thiss!992))))) (bvsgt from!355 (size!1926 (_keys!3605 (v!2296 (underlying!190 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54770 (arrayContainsKey!0 (_keys!3605 (v!2296 (underlying!190 thiss!992))) (select (arr!1696 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1440 0))(
  ( (Unit!1441) )
))
(declare-fun lt!21739 () Unit!1440)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!7 (array!3549 array!3551 (_ BitVec 32) (_ BitVec 32) V!2745 V!2745 (_ BitVec 64) (_ BitVec 32) Int) Unit!1440)

(assert (=> b!54770 (= lt!21739 (lemmaListMapContainsThenArrayContainsFrom!7 (_keys!3605 (v!2296 (underlying!190 thiss!992))) (_values!1969 (v!2296 (underlying!190 thiss!992))) (mask!5836 (v!2296 (underlying!190 thiss!992))) (extraKeys!1877 (v!2296 (underlying!190 thiss!992))) (zeroValue!1904 (v!2296 (underlying!190 thiss!992))) (minValue!1904 (v!2296 (underlying!190 thiss!992))) (select (arr!1696 (_keys!3605 (v!2296 (underlying!190 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1986 (v!2296 (underlying!190 thiss!992)))))))

(assert (= (and start!8328 res!30944) b!54766))

(assert (= (and b!54766 res!30939) b!54764))

(assert (= (and b!54764 res!30942) b!54754))

(assert (= (and b!54754 res!30945) b!54768))

(assert (= (and b!54768 res!30940) b!54767))

(assert (= (and b!54767 res!30941) b!54770))

(assert (= (and b!54770 (not res!30943)) b!54760))

(assert (= (and b!54763 condMapEmpty!2639) mapIsEmpty!2640))

(assert (= (and b!54763 (not condMapEmpty!2639)) mapNonEmpty!2640))

(get-info :version)

(assert (= (and mapNonEmpty!2640 ((_ is ValueCellFull!818) mapValue!2639)) b!54755))

(assert (= (and b!54763 ((_ is ValueCellFull!818) mapDefault!2640)) b!54762))

(assert (= b!54757 b!54763))

(assert (= b!54769 b!54757))

(assert (= b!54756 b!54769))

(assert (= start!8328 b!54756))

(assert (= (and b!54761 condMapEmpty!2640) mapIsEmpty!2639))

(assert (= (and b!54761 (not condMapEmpty!2640)) mapNonEmpty!2639))

(assert (= (and mapNonEmpty!2639 ((_ is ValueCellFull!818) mapValue!2640)) b!54765))

(assert (= (and b!54761 ((_ is ValueCellFull!818) mapDefault!2639)) b!54759))

(assert (= b!54758 b!54761))

(assert (= start!8328 b!54758))

(declare-fun b_lambda!2421 () Bool)

(assert (=> (not b_lambda!2421) (not b!54767)))

(declare-fun t!4566 () Bool)

(declare-fun tb!1157 () Bool)

(assert (=> (and b!54757 (= (defaultEntry!1986 (v!2296 (underlying!190 thiss!992))) (defaultEntry!1986 (v!2296 (underlying!190 thiss!992)))) t!4566) tb!1157))

(declare-fun result!2133 () Bool)

(assert (=> tb!1157 (= result!2133 tp_is_empty!2323)))

(assert (=> b!54767 t!4566))

(declare-fun b_and!3173 () Bool)

(assert (= b_and!3169 (and (=> t!4566 result!2133) b_and!3173)))

(declare-fun t!4568 () Bool)

(declare-fun tb!1159 () Bool)

(assert (=> (and b!54758 (= (defaultEntry!1986 newMap!16) (defaultEntry!1986 (v!2296 (underlying!190 thiss!992)))) t!4568) tb!1159))

(declare-fun result!2137 () Bool)

(assert (= result!2137 result!2133))

(assert (=> b!54767 t!4568))

(declare-fun b_and!3175 () Bool)

(assert (= b_and!3171 (and (=> t!4568 result!2137) b_and!3175)))

(declare-fun m!46231 () Bool)

(assert (=> start!8328 m!46231))

(declare-fun m!46233 () Bool)

(assert (=> b!54758 m!46233))

(declare-fun m!46235 () Bool)

(assert (=> b!54758 m!46235))

(declare-fun m!46237 () Bool)

(assert (=> b!54770 m!46237))

(assert (=> b!54770 m!46237))

(declare-fun m!46239 () Bool)

(assert (=> b!54770 m!46239))

(assert (=> b!54770 m!46237))

(declare-fun m!46241 () Bool)

(assert (=> b!54770 m!46241))

(declare-fun m!46243 () Bool)

(assert (=> b!54767 m!46243))

(declare-fun m!46245 () Bool)

(assert (=> b!54767 m!46245))

(declare-fun m!46247 () Bool)

(assert (=> b!54767 m!46247))

(assert (=> b!54767 m!46237))

(assert (=> b!54767 m!46237))

(declare-fun m!46249 () Bool)

(assert (=> b!54767 m!46249))

(assert (=> b!54767 m!46245))

(assert (=> b!54767 m!46237))

(assert (=> b!54767 m!46247))

(declare-fun m!46251 () Bool)

(assert (=> b!54767 m!46251))

(assert (=> b!54767 m!46243))

(declare-fun m!46253 () Bool)

(assert (=> b!54764 m!46253))

(declare-fun m!46255 () Bool)

(assert (=> b!54757 m!46255))

(declare-fun m!46257 () Bool)

(assert (=> b!54757 m!46257))

(declare-fun m!46259 () Bool)

(assert (=> b!54760 m!46259))

(declare-fun m!46261 () Bool)

(assert (=> mapNonEmpty!2639 m!46261))

(assert (=> b!54768 m!46237))

(declare-fun m!46263 () Bool)

(assert (=> b!54768 m!46263))

(declare-fun m!46265 () Bool)

(assert (=> b!54768 m!46265))

(declare-fun m!46267 () Bool)

(assert (=> mapNonEmpty!2640 m!46267))

(check-sat (not b!54764) (not b!54767) (not b!54760) (not mapNonEmpty!2639) tp_is_empty!2323 b_and!3175 (not b_lambda!2421) (not mapNonEmpty!2640) (not start!8328) (not b!54758) b_and!3173 (not b!54757) (not b_next!1813) (not b_next!1815) (not b!54770) (not b!54768))
(check-sat b_and!3173 b_and!3175 (not b_next!1813) (not b_next!1815))
