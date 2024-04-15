; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9116 () Bool)

(assert start!9116)

(declare-fun b!64437 () Bool)

(declare-fun b_free!2017 () Bool)

(declare-fun b_next!2017 () Bool)

(assert (=> b!64437 (= b_free!2017 (not b_next!2017))))

(declare-fun tp!8194 () Bool)

(declare-fun b_and!3937 () Bool)

(assert (=> b!64437 (= tp!8194 b_and!3937)))

(declare-fun b!64440 () Bool)

(declare-fun b_free!2019 () Bool)

(declare-fun b_next!2019 () Bool)

(assert (=> b!64440 (= b_free!2019 (not b_next!2019))))

(declare-fun tp!8195 () Bool)

(declare-fun b_and!3939 () Bool)

(assert (=> b!64440 (= tp!8195 b_and!3939)))

(declare-fun b!64436 () Bool)

(declare-datatypes ((Unit!1772 0))(
  ( (Unit!1773) )
))
(declare-fun e!42239 () Unit!1772)

(declare-fun Unit!1774 () Unit!1772)

(assert (=> b!64436 (= e!42239 Unit!1774)))

(declare-fun lt!27385 () Unit!1772)

(declare-datatypes ((V!2881 0))(
  ( (V!2882 (val!1257 Int)) )
))
(declare-datatypes ((array!3765 0))(
  ( (array!3766 (arr!1798 (Array (_ BitVec 32) (_ BitVec 64))) (size!2033 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!869 0))(
  ( (ValueCellFull!869 (v!2439 V!2881)) (EmptyCell!869) )
))
(declare-datatypes ((array!3767 0))(
  ( (array!3768 (arr!1799 (Array (_ BitVec 32) ValueCell!869)) (size!2034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!646 0))(
  ( (LongMapFixedSize!647 (defaultEntry!2121 Int) (mask!6042 (_ BitVec 32)) (extraKeys!1994 (_ BitVec 32)) (zeroValue!2030 V!2881) (minValue!2030 V!2881) (_size!372 (_ BitVec 32)) (_keys!3758 array!3765) (_values!2104 array!3767) (_vacant!372 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!448 0))(
  ( (Cell!449 (v!2440 LongMapFixedSize!646)) )
))
(declare-datatypes ((LongMap!448 0))(
  ( (LongMap!449 (underlying!235 Cell!448)) )
))
(declare-fun thiss!992 () LongMap!448)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!38 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) (_ BitVec 32) Int) Unit!1772)

(assert (=> b!64436 (= lt!27385 (lemmaListMapContainsThenArrayContainsFrom!38 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!64436 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27383 () Unit!1772)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3765 (_ BitVec 32) (_ BitVec 32)) Unit!1772)

(assert (=> b!64436 (= lt!27383 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1453 0))(
  ( (Nil!1450) (Cons!1449 (h!2033 (_ BitVec 64)) (t!4874 List!1453)) )
))
(declare-fun arrayNoDuplicates!0 (array!3765 (_ BitVec 32) List!1453) Bool)

(assert (=> b!64436 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) from!355 Nil!1450)))

(declare-fun lt!27382 () Unit!1772)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3765 (_ BitVec 32) (_ BitVec 64) List!1453) Unit!1772)

(assert (=> b!64436 (= lt!27382 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450)))))

(assert (=> b!64436 false))

(declare-fun mapNonEmpty!2987 () Bool)

(declare-fun mapRes!2987 () Bool)

(declare-fun tp!8196 () Bool)

(declare-fun e!42236 () Bool)

(assert (=> mapNonEmpty!2987 (= mapRes!2987 (and tp!8196 e!42236))))

(declare-fun mapKey!2988 () (_ BitVec 32))

(declare-fun mapValue!2987 () ValueCell!869)

(declare-fun newMap!16 () LongMapFixedSize!646)

(declare-fun mapRest!2987 () (Array (_ BitVec 32) ValueCell!869))

(assert (=> mapNonEmpty!2987 (= (arr!1799 (_values!2104 newMap!16)) (store mapRest!2987 mapKey!2988 mapValue!2987))))

(declare-fun mapIsEmpty!2987 () Bool)

(assert (=> mapIsEmpty!2987 mapRes!2987))

(declare-fun mapNonEmpty!2988 () Bool)

(declare-fun mapRes!2988 () Bool)

(declare-fun tp!8193 () Bool)

(declare-fun e!42235 () Bool)

(assert (=> mapNonEmpty!2988 (= mapRes!2988 (and tp!8193 e!42235))))

(declare-fun mapValue!2988 () ValueCell!869)

(declare-fun mapKey!2987 () (_ BitVec 32))

(declare-fun mapRest!2988 () (Array (_ BitVec 32) ValueCell!869))

(assert (=> mapNonEmpty!2988 (= (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (store mapRest!2988 mapKey!2987 mapValue!2988))))

(declare-fun e!42234 () Bool)

(declare-fun e!42229 () Bool)

(declare-fun tp_is_empty!2425 () Bool)

(declare-fun array_inv!1121 (array!3765) Bool)

(declare-fun array_inv!1122 (array!3767) Bool)

(assert (=> b!64437 (= e!42234 (and tp!8194 tp_is_empty!2425 (array_inv!1121 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (array_inv!1122 (_values!2104 (v!2440 (underlying!235 thiss!992)))) e!42229))))

(declare-fun b!64438 () Bool)

(assert (=> b!64438 (= e!42235 tp_is_empty!2425)))

(declare-fun b!64439 () Bool)

(declare-fun e!42233 () Bool)

(declare-fun e!42241 () Bool)

(assert (=> b!64439 (= e!42233 (and e!42241 mapRes!2987))))

(declare-fun condMapEmpty!2988 () Bool)

(declare-fun mapDefault!2988 () ValueCell!869)

(assert (=> b!64439 (= condMapEmpty!2988 (= (arr!1799 (_values!2104 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!2988)))))

(declare-fun e!42232 () Bool)

(assert (=> b!64440 (= e!42232 (and tp!8195 tp_is_empty!2425 (array_inv!1121 (_keys!3758 newMap!16)) (array_inv!1122 (_values!2104 newMap!16)) e!42233))))

(declare-fun b!64441 () Bool)

(declare-fun res!35142 () Bool)

(declare-fun e!42237 () Bool)

(assert (=> b!64441 (=> (not res!35142) (not e!42237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!64441 (= res!35142 (validMask!0 (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64442 () Bool)

(declare-fun e!42240 () Bool)

(assert (=> b!64442 (= e!42240 tp_is_empty!2425)))

(declare-fun b!64443 () Bool)

(declare-fun e!42231 () Bool)

(declare-fun e!42243 () Bool)

(assert (=> b!64443 (= e!42231 e!42243)))

(declare-fun res!35146 () Bool)

(assert (=> b!64443 (=> (not res!35146) (not e!42243))))

(declare-datatypes ((tuple2!2060 0))(
  ( (tuple2!2061 (_1!1041 (_ BitVec 64)) (_2!1041 V!2881)) )
))
(declare-datatypes ((List!1454 0))(
  ( (Nil!1451) (Cons!1450 (h!2034 tuple2!2060) (t!4875 List!1454)) )
))
(declare-datatypes ((ListLongMap!1369 0))(
  ( (ListLongMap!1370 (toList!700 List!1454)) )
))
(declare-fun lt!27387 () ListLongMap!1369)

(declare-fun lt!27384 () ListLongMap!1369)

(assert (=> b!64443 (= res!35146 (and (= lt!27384 lt!27387) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1120 (LongMapFixedSize!646) ListLongMap!1369)

(assert (=> b!64443 (= lt!27387 (map!1120 newMap!16))))

(declare-fun getCurrentListMap!396 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) ListLongMap!1369)

(assert (=> b!64443 (= lt!27384 (getCurrentListMap!396 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64444 () Bool)

(assert (=> b!64444 (= e!42229 (and e!42240 mapRes!2988))))

(declare-fun condMapEmpty!2987 () Bool)

(declare-fun mapDefault!2987 () ValueCell!869)

(assert (=> b!64444 (= condMapEmpty!2987 (= (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!2987)))))

(declare-fun b!64445 () Bool)

(declare-fun res!35148 () Bool)

(assert (=> b!64445 (=> (not res!35148) (not e!42237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3765 (_ BitVec 32)) Bool)

(assert (=> b!64445 (= res!35148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64446 () Bool)

(assert (=> b!64446 (= e!42241 tp_is_empty!2425)))

(declare-fun b!64447 () Bool)

(assert (=> b!64447 (= e!42236 tp_is_empty!2425)))

(declare-fun b!64448 () Bool)

(declare-fun res!35149 () Bool)

(assert (=> b!64448 (=> (not res!35149) (not e!42231))))

(declare-fun valid!277 (LongMapFixedSize!646) Bool)

(assert (=> b!64448 (= res!35149 (valid!277 newMap!16))))

(declare-fun b!64449 () Bool)

(declare-fun res!35147 () Bool)

(assert (=> b!64449 (=> (not res!35147) (not e!42231))))

(assert (=> b!64449 (= res!35147 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6042 newMap!16)) (_size!372 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64450 () Bool)

(declare-fun e!42242 () Bool)

(declare-fun e!42238 () Bool)

(assert (=> b!64450 (= e!42242 e!42238)))

(declare-fun b!64451 () Bool)

(assert (=> b!64451 (= e!42238 e!42234)))

(declare-fun b!64452 () Bool)

(assert (=> b!64452 (= e!42243 e!42237)))

(declare-fun res!35144 () Bool)

(assert (=> b!64452 (=> (not res!35144) (not e!42237))))

(declare-datatypes ((tuple2!2062 0))(
  ( (tuple2!2063 (_1!1042 Bool) (_2!1042 LongMapFixedSize!646)) )
))
(declare-fun lt!27386 () tuple2!2062)

(assert (=> b!64452 (= res!35144 (and (_1!1042 lt!27386) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!27388 () Unit!1772)

(assert (=> b!64452 (= lt!27388 e!42239)))

(declare-fun c!8797 () Bool)

(declare-fun contains!696 (ListLongMap!1369 (_ BitVec 64)) Bool)

(assert (=> b!64452 (= c!8797 (contains!696 lt!27387 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun update!90 (LongMapFixedSize!646 (_ BitVec 64) V!2881) tuple2!2062)

(declare-fun get!1101 (ValueCell!869 V!2881) V!2881)

(declare-fun dynLambda!314 (Int (_ BitVec 64)) V!2881)

(assert (=> b!64452 (= lt!27386 (update!90 newMap!16 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2988 () Bool)

(assert (=> mapIsEmpty!2988 mapRes!2988))

(declare-fun b!64453 () Bool)

(declare-fun res!35145 () Bool)

(assert (=> b!64453 (=> (not res!35145) (not e!42231))))

(assert (=> b!64453 (= res!35145 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun b!64454 () Bool)

(declare-fun Unit!1775 () Unit!1772)

(assert (=> b!64454 (= e!42239 Unit!1775)))

(declare-fun b!64455 () Bool)

(declare-fun res!35143 () Bool)

(assert (=> b!64455 (=> (not res!35143) (not e!42237))))

(assert (=> b!64455 (= res!35143 (and (= (size!2034 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6042 (v!2440 (underlying!235 thiss!992))))) (= (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (size!2034 (_values!2104 (v!2440 (underlying!235 thiss!992))))) (bvsge (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!64456 () Bool)

(assert (=> b!64456 (= e!42237 (not (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 Nil!1450)))))

(declare-fun res!35141 () Bool)

(assert (=> start!9116 (=> (not res!35141) (not e!42231))))

(declare-fun valid!278 (LongMap!448) Bool)

(assert (=> start!9116 (= res!35141 (valid!278 thiss!992))))

(assert (=> start!9116 e!42231))

(assert (=> start!9116 e!42242))

(assert (=> start!9116 true))

(assert (=> start!9116 e!42232))

(assert (= (and start!9116 res!35141) b!64453))

(assert (= (and b!64453 res!35145) b!64448))

(assert (= (and b!64448 res!35149) b!64449))

(assert (= (and b!64449 res!35147) b!64443))

(assert (= (and b!64443 res!35146) b!64452))

(assert (= (and b!64452 c!8797) b!64436))

(assert (= (and b!64452 (not c!8797)) b!64454))

(assert (= (and b!64452 res!35144) b!64441))

(assert (= (and b!64441 res!35142) b!64455))

(assert (= (and b!64455 res!35143) b!64445))

(assert (= (and b!64445 res!35148) b!64456))

(assert (= (and b!64444 condMapEmpty!2987) mapIsEmpty!2988))

(assert (= (and b!64444 (not condMapEmpty!2987)) mapNonEmpty!2988))

(get-info :version)

(assert (= (and mapNonEmpty!2988 ((_ is ValueCellFull!869) mapValue!2988)) b!64438))

(assert (= (and b!64444 ((_ is ValueCellFull!869) mapDefault!2987)) b!64442))

(assert (= b!64437 b!64444))

(assert (= b!64451 b!64437))

(assert (= b!64450 b!64451))

(assert (= start!9116 b!64450))

(assert (= (and b!64439 condMapEmpty!2988) mapIsEmpty!2987))

(assert (= (and b!64439 (not condMapEmpty!2988)) mapNonEmpty!2987))

(assert (= (and mapNonEmpty!2987 ((_ is ValueCellFull!869) mapValue!2987)) b!64447))

(assert (= (and b!64439 ((_ is ValueCellFull!869) mapDefault!2988)) b!64446))

(assert (= b!64440 b!64439))

(assert (= start!9116 b!64440))

(declare-fun b_lambda!2887 () Bool)

(assert (=> (not b_lambda!2887) (not b!64452)))

(declare-fun t!4871 () Bool)

(declare-fun tb!1397 () Bool)

(assert (=> (and b!64437 (= (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))) t!4871) tb!1397))

(declare-fun result!2487 () Bool)

(assert (=> tb!1397 (= result!2487 tp_is_empty!2425)))

(assert (=> b!64452 t!4871))

(declare-fun b_and!3941 () Bool)

(assert (= b_and!3937 (and (=> t!4871 result!2487) b_and!3941)))

(declare-fun tb!1399 () Bool)

(declare-fun t!4873 () Bool)

(assert (=> (and b!64440 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))) t!4873) tb!1399))

(declare-fun result!2491 () Bool)

(assert (= result!2491 result!2487))

(assert (=> b!64452 t!4873))

(declare-fun b_and!3943 () Bool)

(assert (= b_and!3939 (and (=> t!4873 result!2491) b_and!3943)))

(declare-fun m!58851 () Bool)

(assert (=> b!64441 m!58851))

(declare-fun m!58853 () Bool)

(assert (=> mapNonEmpty!2987 m!58853))

(declare-fun m!58855 () Bool)

(assert (=> b!64448 m!58855))

(declare-fun m!58857 () Bool)

(assert (=> b!64437 m!58857))

(declare-fun m!58859 () Bool)

(assert (=> b!64437 m!58859))

(declare-fun m!58861 () Bool)

(assert (=> b!64443 m!58861))

(declare-fun m!58863 () Bool)

(assert (=> b!64443 m!58863))

(declare-fun m!58865 () Bool)

(assert (=> b!64443 m!58865))

(declare-fun m!58867 () Bool)

(assert (=> b!64440 m!58867))

(declare-fun m!58869 () Bool)

(assert (=> b!64440 m!58869))

(declare-fun m!58871 () Bool)

(assert (=> b!64436 m!58871))

(declare-fun m!58873 () Bool)

(assert (=> b!64436 m!58873))

(assert (=> b!64436 m!58861))

(declare-fun m!58875 () Bool)

(assert (=> b!64436 m!58875))

(assert (=> b!64436 m!58861))

(assert (=> b!64436 m!58861))

(declare-fun m!58877 () Bool)

(assert (=> b!64436 m!58877))

(assert (=> b!64436 m!58861))

(declare-fun m!58879 () Bool)

(assert (=> b!64436 m!58879))

(declare-fun m!58881 () Bool)

(assert (=> mapNonEmpty!2988 m!58881))

(declare-fun m!58883 () Bool)

(assert (=> b!64456 m!58883))

(declare-fun m!58885 () Bool)

(assert (=> b!64445 m!58885))

(declare-fun m!58887 () Bool)

(assert (=> start!9116 m!58887))

(declare-fun m!58889 () Bool)

(assert (=> b!64452 m!58889))

(declare-fun m!58891 () Bool)

(assert (=> b!64452 m!58891))

(declare-fun m!58893 () Bool)

(assert (=> b!64452 m!58893))

(assert (=> b!64452 m!58861))

(assert (=> b!64452 m!58861))

(assert (=> b!64452 m!58893))

(declare-fun m!58895 () Bool)

(assert (=> b!64452 m!58895))

(assert (=> b!64452 m!58889))

(assert (=> b!64452 m!58861))

(declare-fun m!58897 () Bool)

(assert (=> b!64452 m!58897))

(assert (=> b!64452 m!58891))

(check-sat (not b_next!2017) (not start!9116) (not b_next!2019) (not mapNonEmpty!2987) (not b!64441) (not b!64456) (not b_lambda!2887) (not b!64440) (not b!64437) (not b!64436) (not b!64448) b_and!3941 (not mapNonEmpty!2988) (not b!64443) (not b!64445) (not b!64452) b_and!3943 tp_is_empty!2425)
(check-sat b_and!3941 b_and!3943 (not b_next!2017) (not b_next!2019))
(get-model)

(declare-fun b_lambda!2893 () Bool)

(assert (= b_lambda!2887 (or (and b!64437 b_free!2017) (and b!64440 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))))) b_lambda!2893)))

(check-sat (not b_next!2017) (not start!9116) (not b_next!2019) (not mapNonEmpty!2987) (not b!64441) (not b!64456) (not b!64440) (not b!64437) (not b!64436) (not b!64448) b_and!3941 (not mapNonEmpty!2988) (not b_lambda!2893) (not b!64443) (not b!64445) (not b!64452) b_and!3943 tp_is_empty!2425)
(check-sat b_and!3941 b_and!3943 (not b_next!2017) (not b_next!2019))
(get-model)

(declare-fun d!13399 () Bool)

(assert (=> d!13399 (not (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27433 () Unit!1772)

(declare-fun choose!68 (array!3765 (_ BitVec 32) (_ BitVec 64) List!1453) Unit!1772)

(assert (=> d!13399 (= lt!27433 (choose!68 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450)))))

(assert (=> d!13399 (bvslt (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13399 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450)) lt!27433)))

(declare-fun bs!2802 () Bool)

(assert (= bs!2802 d!13399))

(assert (=> bs!2802 m!58861))

(assert (=> bs!2802 m!58877))

(assert (=> bs!2802 m!58861))

(declare-fun m!58995 () Bool)

(assert (=> bs!2802 m!58995))

(assert (=> b!64436 d!13399))

(declare-fun d!13401 () Bool)

(assert (=> d!13401 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) from!355 Nil!1450)))

(declare-fun lt!27436 () Unit!1772)

(declare-fun choose!39 (array!3765 (_ BitVec 32) (_ BitVec 32)) Unit!1772)

(assert (=> d!13401 (= lt!27436 (choose!39 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13401 (bvslt (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13401 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 from!355) lt!27436)))

(declare-fun bs!2803 () Bool)

(assert (= bs!2803 d!13401))

(assert (=> bs!2803 m!58873))

(declare-fun m!58997 () Bool)

(assert (=> bs!2803 m!58997))

(assert (=> b!64436 d!13401))

(declare-fun d!13403 () Bool)

(declare-fun res!35208 () Bool)

(declare-fun e!42344 () Bool)

(assert (=> d!13403 (=> res!35208 e!42344)))

(assert (=> d!13403 (= res!35208 (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13403 (= (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!42344)))

(declare-fun b!64593 () Bool)

(declare-fun e!42345 () Bool)

(assert (=> b!64593 (= e!42344 e!42345)))

(declare-fun res!35209 () Bool)

(assert (=> b!64593 (=> (not res!35209) (not e!42345))))

(assert (=> b!64593 (= res!35209 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!64594 () Bool)

(assert (=> b!64594 (= e!42345 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13403 (not res!35208)) b!64593))

(assert (= (and b!64593 res!35209) b!64594))

(declare-fun m!58999 () Bool)

(assert (=> d!13403 m!58999))

(assert (=> b!64594 m!58861))

(declare-fun m!59001 () Bool)

(assert (=> b!64594 m!59001))

(assert (=> b!64436 d!13403))

(declare-fun d!13405 () Bool)

(declare-fun e!42348 () Bool)

(assert (=> d!13405 e!42348))

(declare-fun c!8806 () Bool)

(assert (=> d!13405 (= c!8806 (and (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27439 () Unit!1772)

(declare-fun choose!360 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) (_ BitVec 32) Int) Unit!1772)

(assert (=> d!13405 (= lt!27439 (choose!360 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(assert (=> d!13405 (validMask!0 (mask!6042 (v!2440 (underlying!235 thiss!992))))))

(assert (=> d!13405 (= (lemmaListMapContainsThenArrayContainsFrom!38 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))) lt!27439)))

(declare-fun b!64599 () Bool)

(assert (=> b!64599 (= e!42348 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64600 () Bool)

(assert (=> b!64600 (= e!42348 (ite (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13405 c!8806) b!64599))

(assert (= (and d!13405 (not c!8806)) b!64600))

(assert (=> d!13405 m!58861))

(declare-fun m!59003 () Bool)

(assert (=> d!13405 m!59003))

(assert (=> d!13405 m!58851))

(assert (=> b!64599 m!58861))

(assert (=> b!64599 m!58877))

(assert (=> b!64436 d!13405))

(declare-fun b!64611 () Bool)

(declare-fun e!42359 () Bool)

(declare-fun e!42360 () Bool)

(assert (=> b!64611 (= e!42359 e!42360)))

(declare-fun c!8809 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!64611 (= c!8809 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!64612 () Bool)

(declare-fun call!5205 () Bool)

(assert (=> b!64612 (= e!42360 call!5205)))

(declare-fun bm!5202 () Bool)

(assert (=> bm!5202 (= call!5205 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8809 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450) Nil!1450)))))

(declare-fun b!64613 () Bool)

(declare-fun e!42357 () Bool)

(assert (=> b!64613 (= e!42357 e!42359)))

(declare-fun res!35216 () Bool)

(assert (=> b!64613 (=> (not res!35216) (not e!42359))))

(declare-fun e!42358 () Bool)

(assert (=> b!64613 (= res!35216 (not e!42358))))

(declare-fun res!35217 () Bool)

(assert (=> b!64613 (=> (not res!35217) (not e!42358))))

(assert (=> b!64613 (= res!35217 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun d!13407 () Bool)

(declare-fun res!35218 () Bool)

(assert (=> d!13407 (=> res!35218 e!42357)))

(assert (=> d!13407 (= res!35218 (bvsge from!355 (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13407 (= (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) from!355 Nil!1450) e!42357)))

(declare-fun b!64614 () Bool)

(assert (=> b!64614 (= e!42360 call!5205)))

(declare-fun b!64615 () Bool)

(declare-fun contains!697 (List!1453 (_ BitVec 64)) Bool)

(assert (=> b!64615 (= e!42358 (contains!697 Nil!1450 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (= (and d!13407 (not res!35218)) b!64613))

(assert (= (and b!64613 res!35217) b!64615))

(assert (= (and b!64613 res!35216) b!64611))

(assert (= (and b!64611 c!8809) b!64614))

(assert (= (and b!64611 (not c!8809)) b!64612))

(assert (= (or b!64614 b!64612) bm!5202))

(assert (=> b!64611 m!58861))

(assert (=> b!64611 m!58861))

(declare-fun m!59005 () Bool)

(assert (=> b!64611 m!59005))

(assert (=> bm!5202 m!58861))

(declare-fun m!59007 () Bool)

(assert (=> bm!5202 m!59007))

(assert (=> b!64613 m!58861))

(assert (=> b!64613 m!58861))

(assert (=> b!64613 m!59005))

(assert (=> b!64615 m!58861))

(assert (=> b!64615 m!58861))

(declare-fun m!59009 () Bool)

(assert (=> b!64615 m!59009))

(assert (=> b!64436 d!13407))

(declare-fun d!13409 () Bool)

(assert (=> d!13409 (= (map!1120 newMap!16) (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun bs!2804 () Bool)

(assert (= bs!2804 d!13409))

(declare-fun m!59011 () Bool)

(assert (=> bs!2804 m!59011))

(assert (=> b!64443 d!13409))

(declare-fun b!64658 () Bool)

(declare-fun e!42390 () Bool)

(declare-fun lt!27495 () ListLongMap!1369)

(declare-fun apply!70 (ListLongMap!1369 (_ BitVec 64)) V!2881)

(assert (=> b!64658 (= e!42390 (= (apply!70 lt!27495 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun bm!5217 () Bool)

(declare-fun c!8822 () Bool)

(declare-fun call!5223 () ListLongMap!1369)

(declare-fun call!5220 () ListLongMap!1369)

(declare-fun call!5222 () ListLongMap!1369)

(declare-fun c!8827 () Bool)

(declare-fun call!5221 () ListLongMap!1369)

(declare-fun +!85 (ListLongMap!1369 tuple2!2060) ListLongMap!1369)

(assert (=> bm!5217 (= call!5220 (+!85 (ite c!8822 call!5223 (ite c!8827 call!5221 call!5222)) (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun b!64659 () Bool)

(declare-fun e!42394 () Bool)

(declare-fun e!42396 () Bool)

(assert (=> b!64659 (= e!42394 e!42396)))

(declare-fun res!35244 () Bool)

(declare-fun call!5226 () Bool)

(assert (=> b!64659 (= res!35244 call!5226)))

(assert (=> b!64659 (=> (not res!35244) (not e!42396))))

(declare-fun d!13411 () Bool)

(declare-fun e!42395 () Bool)

(assert (=> d!13411 e!42395))

(declare-fun res!35237 () Bool)

(assert (=> d!13411 (=> (not res!35237) (not e!42395))))

(assert (=> d!13411 (= res!35237 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun lt!27504 () ListLongMap!1369)

(assert (=> d!13411 (= lt!27495 lt!27504)))

(declare-fun lt!27498 () Unit!1772)

(declare-fun e!42399 () Unit!1772)

(assert (=> d!13411 (= lt!27498 e!42399)))

(declare-fun c!8824 () Bool)

(declare-fun e!42389 () Bool)

(assert (=> d!13411 (= c!8824 e!42389)))

(declare-fun res!35238 () Bool)

(assert (=> d!13411 (=> (not res!35238) (not e!42389))))

(assert (=> d!13411 (= res!35238 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun e!42398 () ListLongMap!1369)

(assert (=> d!13411 (= lt!27504 e!42398)))

(assert (=> d!13411 (= c!8822 (and (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13411 (validMask!0 (mask!6042 (v!2440 (underlying!235 thiss!992))))))

(assert (=> d!13411 (= (getCurrentListMap!396 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))) lt!27495)))

(declare-fun b!64660 () Bool)

(assert (=> b!64660 (= e!42396 (= (apply!70 lt!27495 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun bm!5218 () Bool)

(declare-fun call!5225 () Bool)

(assert (=> bm!5218 (= call!5225 (contains!696 lt!27495 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5219 () Bool)

(assert (=> bm!5219 (= call!5221 call!5223)))

(declare-fun b!64661 () Bool)

(declare-fun c!8823 () Bool)

(assert (=> b!64661 (= c!8823 (and (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42392 () ListLongMap!1369)

(declare-fun e!42391 () ListLongMap!1369)

(assert (=> b!64661 (= e!42392 e!42391)))

(declare-fun bm!5220 () Bool)

(assert (=> bm!5220 (= call!5226 (contains!696 lt!27495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64662 () Bool)

(declare-fun e!42388 () Bool)

(assert (=> b!64662 (= e!42388 e!42390)))

(declare-fun res!35239 () Bool)

(assert (=> b!64662 (= res!35239 call!5225)))

(assert (=> b!64662 (=> (not res!35239) (not e!42390))))

(declare-fun b!64663 () Bool)

(declare-fun e!42393 () Bool)

(declare-fun e!42397 () Bool)

(assert (=> b!64663 (= e!42393 e!42397)))

(declare-fun res!35241 () Bool)

(assert (=> b!64663 (=> (not res!35241) (not e!42397))))

(assert (=> b!64663 (= res!35241 (contains!696 lt!27495 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64663 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!64664 () Bool)

(declare-fun e!42387 () Bool)

(assert (=> b!64664 (= e!42387 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64665 () Bool)

(declare-fun call!5224 () ListLongMap!1369)

(assert (=> b!64665 (= e!42391 call!5224)))

(declare-fun b!64666 () Bool)

(assert (=> b!64666 (= e!42398 e!42392)))

(assert (=> b!64666 (= c!8827 (and (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64667 () Bool)

(assert (=> b!64667 (= e!42397 (= (apply!70 lt!27495 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2034 (_values!2104 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> b!64667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!64668 () Bool)

(assert (=> b!64668 (= e!42389 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!5221 () Bool)

(assert (=> bm!5221 (= call!5224 call!5220)))

(declare-fun bm!5222 () Bool)

(assert (=> bm!5222 (= call!5222 call!5221)))

(declare-fun b!64669 () Bool)

(assert (=> b!64669 (= e!42388 (not call!5225))))

(declare-fun b!64670 () Bool)

(assert (=> b!64670 (= e!42392 call!5224)))

(declare-fun b!64671 () Bool)

(declare-fun res!35243 () Bool)

(assert (=> b!64671 (=> (not res!35243) (not e!42395))))

(assert (=> b!64671 (= res!35243 e!42394)))

(declare-fun c!8826 () Bool)

(assert (=> b!64671 (= c!8826 (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64672 () Bool)

(assert (=> b!64672 (= e!42395 e!42388)))

(declare-fun c!8825 () Bool)

(assert (=> b!64672 (= c!8825 (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64673 () Bool)

(declare-fun Unit!1776 () Unit!1772)

(assert (=> b!64673 (= e!42399 Unit!1776)))

(declare-fun b!64674 () Bool)

(assert (=> b!64674 (= e!42391 call!5222)))

(declare-fun b!64675 () Bool)

(assert (=> b!64675 (= e!42394 (not call!5226))))

(declare-fun b!64676 () Bool)

(assert (=> b!64676 (= e!42398 (+!85 call!5220 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun bm!5223 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!48 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) ListLongMap!1369)

(assert (=> bm!5223 (= call!5223 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64677 () Bool)

(declare-fun res!35242 () Bool)

(assert (=> b!64677 (=> (not res!35242) (not e!42395))))

(assert (=> b!64677 (= res!35242 e!42393)))

(declare-fun res!35240 () Bool)

(assert (=> b!64677 (=> res!35240 e!42393)))

(assert (=> b!64677 (= res!35240 (not e!42387))))

(declare-fun res!35245 () Bool)

(assert (=> b!64677 (=> (not res!35245) (not e!42387))))

(assert (=> b!64677 (= res!35245 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!64678 () Bool)

(declare-fun lt!27499 () Unit!1772)

(assert (=> b!64678 (= e!42399 lt!27499)))

(declare-fun lt!27496 () ListLongMap!1369)

(assert (=> b!64678 (= lt!27496 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun lt!27503 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27494 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27494 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27505 () Unit!1772)

(declare-fun addStillContains!46 (ListLongMap!1369 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1772)

(assert (=> b!64678 (= lt!27505 (addStillContains!46 lt!27496 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27494))))

(assert (=> b!64678 (contains!696 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27494)))

(declare-fun lt!27492 () Unit!1772)

(assert (=> b!64678 (= lt!27492 lt!27505)))

(declare-fun lt!27500 () ListLongMap!1369)

(assert (=> b!64678 (= lt!27500 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun lt!27485 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27501 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27501 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27489 () Unit!1772)

(declare-fun addApplyDifferent!46 (ListLongMap!1369 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1772)

(assert (=> b!64678 (= lt!27489 (addApplyDifferent!46 lt!27500 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27501))))

(assert (=> b!64678 (= (apply!70 (+!85 lt!27500 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27501) (apply!70 lt!27500 lt!27501))))

(declare-fun lt!27487 () Unit!1772)

(assert (=> b!64678 (= lt!27487 lt!27489)))

(declare-fun lt!27493 () ListLongMap!1369)

(assert (=> b!64678 (= lt!27493 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun lt!27497 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27502 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27502 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27486 () Unit!1772)

(assert (=> b!64678 (= lt!27486 (addApplyDifferent!46 lt!27493 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27502))))

(assert (=> b!64678 (= (apply!70 (+!85 lt!27493 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27502) (apply!70 lt!27493 lt!27502))))

(declare-fun lt!27491 () Unit!1772)

(assert (=> b!64678 (= lt!27491 lt!27486)))

(declare-fun lt!27490 () ListLongMap!1369)

(assert (=> b!64678 (= lt!27490 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun lt!27484 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27484 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27488 () (_ BitVec 64))

(assert (=> b!64678 (= lt!27488 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!64678 (= lt!27499 (addApplyDifferent!46 lt!27490 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27488))))

(assert (=> b!64678 (= (apply!70 (+!85 lt!27490 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27488) (apply!70 lt!27490 lt!27488))))

(assert (= (and d!13411 c!8822) b!64676))

(assert (= (and d!13411 (not c!8822)) b!64666))

(assert (= (and b!64666 c!8827) b!64670))

(assert (= (and b!64666 (not c!8827)) b!64661))

(assert (= (and b!64661 c!8823) b!64665))

(assert (= (and b!64661 (not c!8823)) b!64674))

(assert (= (or b!64665 b!64674) bm!5222))

(assert (= (or b!64670 bm!5222) bm!5219))

(assert (= (or b!64670 b!64665) bm!5221))

(assert (= (or b!64676 bm!5219) bm!5223))

(assert (= (or b!64676 bm!5221) bm!5217))

(assert (= (and d!13411 res!35238) b!64668))

(assert (= (and d!13411 c!8824) b!64678))

(assert (= (and d!13411 (not c!8824)) b!64673))

(assert (= (and d!13411 res!35237) b!64677))

(assert (= (and b!64677 res!35245) b!64664))

(assert (= (and b!64677 (not res!35240)) b!64663))

(assert (= (and b!64663 res!35241) b!64667))

(assert (= (and b!64677 res!35242) b!64671))

(assert (= (and b!64671 c!8826) b!64659))

(assert (= (and b!64671 (not c!8826)) b!64675))

(assert (= (and b!64659 res!35244) b!64660))

(assert (= (or b!64659 b!64675) bm!5220))

(assert (= (and b!64671 res!35243) b!64672))

(assert (= (and b!64672 c!8825) b!64662))

(assert (= (and b!64672 (not c!8825)) b!64669))

(assert (= (and b!64662 res!35239) b!64658))

(assert (= (or b!64662 b!64669) bm!5218))

(declare-fun b_lambda!2895 () Bool)

(assert (=> (not b_lambda!2895) (not b!64667)))

(assert (=> b!64667 t!4871))

(declare-fun b_and!3961 () Bool)

(assert (= b_and!3941 (and (=> t!4871 result!2487) b_and!3961)))

(assert (=> b!64667 t!4873))

(declare-fun b_and!3963 () Bool)

(assert (= b_and!3943 (and (=> t!4873 result!2491) b_and!3963)))

(assert (=> b!64664 m!58999))

(assert (=> b!64664 m!58999))

(declare-fun m!59013 () Bool)

(assert (=> b!64664 m!59013))

(assert (=> d!13411 m!58851))

(declare-fun m!59015 () Bool)

(assert (=> bm!5217 m!59015))

(assert (=> b!64667 m!58891))

(declare-fun m!59017 () Bool)

(assert (=> b!64667 m!59017))

(assert (=> b!64667 m!58999))

(assert (=> b!64667 m!58999))

(declare-fun m!59019 () Bool)

(assert (=> b!64667 m!59019))

(assert (=> b!64667 m!59017))

(assert (=> b!64667 m!58891))

(declare-fun m!59021 () Bool)

(assert (=> b!64667 m!59021))

(declare-fun m!59023 () Bool)

(assert (=> b!64678 m!59023))

(assert (=> b!64678 m!59023))

(declare-fun m!59025 () Bool)

(assert (=> b!64678 m!59025))

(declare-fun m!59027 () Bool)

(assert (=> b!64678 m!59027))

(declare-fun m!59029 () Bool)

(assert (=> b!64678 m!59029))

(assert (=> b!64678 m!58999))

(declare-fun m!59031 () Bool)

(assert (=> b!64678 m!59031))

(declare-fun m!59033 () Bool)

(assert (=> b!64678 m!59033))

(declare-fun m!59035 () Bool)

(assert (=> b!64678 m!59035))

(declare-fun m!59037 () Bool)

(assert (=> b!64678 m!59037))

(declare-fun m!59039 () Bool)

(assert (=> b!64678 m!59039))

(declare-fun m!59041 () Bool)

(assert (=> b!64678 m!59041))

(declare-fun m!59043 () Bool)

(assert (=> b!64678 m!59043))

(declare-fun m!59045 () Bool)

(assert (=> b!64678 m!59045))

(declare-fun m!59047 () Bool)

(assert (=> b!64678 m!59047))

(assert (=> b!64678 m!59041))

(declare-fun m!59049 () Bool)

(assert (=> b!64678 m!59049))

(assert (=> b!64678 m!59031))

(assert (=> b!64678 m!59035))

(declare-fun m!59051 () Bool)

(assert (=> b!64678 m!59051))

(declare-fun m!59053 () Bool)

(assert (=> b!64678 m!59053))

(assert (=> b!64663 m!58999))

(assert (=> b!64663 m!58999))

(declare-fun m!59055 () Bool)

(assert (=> b!64663 m!59055))

(declare-fun m!59057 () Bool)

(assert (=> bm!5220 m!59057))

(declare-fun m!59059 () Bool)

(assert (=> bm!5218 m!59059))

(declare-fun m!59061 () Bool)

(assert (=> b!64660 m!59061))

(declare-fun m!59063 () Bool)

(assert (=> b!64676 m!59063))

(assert (=> bm!5223 m!59043))

(declare-fun m!59065 () Bool)

(assert (=> b!64658 m!59065))

(assert (=> b!64668 m!58999))

(assert (=> b!64668 m!58999))

(assert (=> b!64668 m!59013))

(assert (=> b!64443 d!13411))

(declare-fun d!13413 () Bool)

(declare-fun res!35252 () Bool)

(declare-fun e!42402 () Bool)

(assert (=> d!13413 (=> (not res!35252) (not e!42402))))

(declare-fun simpleValid!46 (LongMapFixedSize!646) Bool)

(assert (=> d!13413 (= res!35252 (simpleValid!46 newMap!16))))

(assert (=> d!13413 (= (valid!277 newMap!16) e!42402)))

(declare-fun b!64685 () Bool)

(declare-fun res!35253 () Bool)

(assert (=> b!64685 (=> (not res!35253) (not e!42402))))

(declare-fun arrayCountValidKeys!0 (array!3765 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!64685 (= res!35253 (= (arrayCountValidKeys!0 (_keys!3758 newMap!16) #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) (_size!372 newMap!16)))))

(declare-fun b!64686 () Bool)

(declare-fun res!35254 () Bool)

(assert (=> b!64686 (=> (not res!35254) (not e!42402))))

(assert (=> b!64686 (= res!35254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(declare-fun b!64687 () Bool)

(assert (=> b!64687 (= e!42402 (arrayNoDuplicates!0 (_keys!3758 newMap!16) #b00000000000000000000000000000000 Nil!1450))))

(assert (= (and d!13413 res!35252) b!64685))

(assert (= (and b!64685 res!35253) b!64686))

(assert (= (and b!64686 res!35254) b!64687))

(declare-fun m!59067 () Bool)

(assert (=> d!13413 m!59067))

(declare-fun m!59069 () Bool)

(assert (=> b!64685 m!59069))

(declare-fun m!59071 () Bool)

(assert (=> b!64686 m!59071))

(declare-fun m!59073 () Bool)

(assert (=> b!64687 m!59073))

(assert (=> b!64448 d!13413))

(declare-fun d!13415 () Bool)

(assert (=> d!13415 (= (array_inv!1121 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvsge (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!64437 d!13415))

(declare-fun d!13417 () Bool)

(assert (=> d!13417 (= (array_inv!1122 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvsge (size!2034 (_values!2104 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!64437 d!13417))

(declare-fun d!13419 () Bool)

(declare-fun e!42407 () Bool)

(assert (=> d!13419 e!42407))

(declare-fun res!35257 () Bool)

(assert (=> d!13419 (=> res!35257 e!42407)))

(declare-fun lt!27517 () Bool)

(assert (=> d!13419 (= res!35257 (not lt!27517))))

(declare-fun lt!27514 () Bool)

(assert (=> d!13419 (= lt!27517 lt!27514)))

(declare-fun lt!27516 () Unit!1772)

(declare-fun e!42408 () Unit!1772)

(assert (=> d!13419 (= lt!27516 e!42408)))

(declare-fun c!8830 () Bool)

(assert (=> d!13419 (= c!8830 lt!27514)))

(declare-fun containsKey!130 (List!1454 (_ BitVec 64)) Bool)

(assert (=> d!13419 (= lt!27514 (containsKey!130 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13419 (= (contains!696 lt!27387 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) lt!27517)))

(declare-fun b!64694 () Bool)

(declare-fun lt!27515 () Unit!1772)

(assert (=> b!64694 (= e!42408 lt!27515)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!79 (List!1454 (_ BitVec 64)) Unit!1772)

(assert (=> b!64694 (= lt!27515 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-datatypes ((Option!132 0))(
  ( (Some!131 (v!2446 V!2881)) (None!130) )
))
(declare-fun isDefined!80 (Option!132) Bool)

(declare-fun getValueByKey!126 (List!1454 (_ BitVec 64)) Option!132)

(assert (=> b!64694 (isDefined!80 (getValueByKey!126 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!64695 () Bool)

(declare-fun Unit!1777 () Unit!1772)

(assert (=> b!64695 (= e!42408 Unit!1777)))

(declare-fun b!64696 () Bool)

(assert (=> b!64696 (= e!42407 (isDefined!80 (getValueByKey!126 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(assert (= (and d!13419 c!8830) b!64694))

(assert (= (and d!13419 (not c!8830)) b!64695))

(assert (= (and d!13419 (not res!35257)) b!64696))

(assert (=> d!13419 m!58861))

(declare-fun m!59075 () Bool)

(assert (=> d!13419 m!59075))

(assert (=> b!64694 m!58861))

(declare-fun m!59077 () Bool)

(assert (=> b!64694 m!59077))

(assert (=> b!64694 m!58861))

(declare-fun m!59079 () Bool)

(assert (=> b!64694 m!59079))

(assert (=> b!64694 m!59079))

(declare-fun m!59081 () Bool)

(assert (=> b!64694 m!59081))

(assert (=> b!64696 m!58861))

(assert (=> b!64696 m!59079))

(assert (=> b!64696 m!59079))

(assert (=> b!64696 m!59081))

(assert (=> b!64452 d!13419))

(declare-fun bm!5272 () Bool)

(declare-fun c!8869 () Bool)

(declare-fun c!8867 () Bool)

(assert (=> bm!5272 (= c!8869 c!8867)))

(declare-fun e!42456 () ListLongMap!1369)

(declare-fun call!5280 () Bool)

(assert (=> bm!5272 (= call!5280 (contains!696 e!42456 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-datatypes ((SeekEntryResult!234 0))(
  ( (MissingZero!234 (index!3063 (_ BitVec 32))) (Found!234 (index!3064 (_ BitVec 32))) (Intermediate!234 (undefined!1046 Bool) (index!3065 (_ BitVec 32)) (x!10544 (_ BitVec 32))) (Undefined!234) (MissingVacant!234 (index!3066 (_ BitVec 32))) )
))
(declare-fun lt!27586 () SeekEntryResult!234)

(declare-fun e!42471 () Bool)

(declare-fun b!64781 () Bool)

(assert (=> b!64781 (= e!42471 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27586)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun call!5298 () Bool)

(declare-fun bm!5273 () Bool)

(assert (=> bm!5273 (= call!5298 (arrayContainsKey!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64782 () Bool)

(declare-fun e!42466 () Unit!1772)

(declare-fun Unit!1778 () Unit!1772)

(assert (=> b!64782 (= e!42466 Unit!1778)))

(declare-fun lt!27596 () Unit!1772)

(declare-fun call!5288 () Unit!1772)

(assert (=> b!64782 (= lt!27596 call!5288)))

(declare-fun lt!27579 () SeekEntryResult!234)

(declare-fun call!5291 () SeekEntryResult!234)

(assert (=> b!64782 (= lt!27579 call!5291)))

(declare-fun c!8864 () Bool)

(assert (=> b!64782 (= c!8864 ((_ is MissingZero!234) lt!27579))))

(declare-fun e!42467 () Bool)

(assert (=> b!64782 e!42467))

(declare-fun lt!27584 () Unit!1772)

(assert (=> b!64782 (= lt!27584 lt!27596)))

(assert (=> b!64782 false))

(declare-fun bm!5274 () Bool)

(declare-fun call!5278 () ListLongMap!1369)

(assert (=> bm!5274 (= call!5278 (map!1120 newMap!16))))

(declare-fun bm!5275 () Bool)

(declare-fun call!5286 () ListLongMap!1369)

(declare-fun call!5284 () ListLongMap!1369)

(assert (=> bm!5275 (= call!5286 call!5284)))

(declare-fun bm!5276 () Bool)

(declare-fun call!5295 () ListLongMap!1369)

(declare-fun call!5285 () ListLongMap!1369)

(assert (=> bm!5276 (= call!5295 call!5285)))

(declare-fun b!64783 () Bool)

(declare-fun c!8860 () Bool)

(assert (=> b!64783 (= c!8860 ((_ is MissingVacant!234) lt!27579))))

(declare-fun e!42460 () Bool)

(assert (=> b!64783 (= e!42467 e!42460)))

(declare-fun bm!5277 () Bool)

(declare-fun call!5283 () Bool)

(declare-fun call!5277 () Bool)

(assert (=> bm!5277 (= call!5283 call!5277)))

(declare-fun b!64784 () Bool)

(declare-fun lt!27594 () Unit!1772)

(assert (=> b!64784 (= e!42466 lt!27594)))

(declare-fun call!5287 () Unit!1772)

(assert (=> b!64784 (= lt!27594 call!5287)))

(declare-fun lt!27578 () SeekEntryResult!234)

(assert (=> b!64784 (= lt!27578 call!5291)))

(declare-fun res!35296 () Bool)

(assert (=> b!64784 (= res!35296 ((_ is Found!234) lt!27578))))

(declare-fun e!42474 () Bool)

(assert (=> b!64784 (=> (not res!35296) (not e!42474))))

(assert (=> b!64784 e!42474))

(declare-fun b!64785 () Bool)

(declare-fun lt!27597 () Unit!1772)

(declare-fun lt!27588 () Unit!1772)

(assert (=> b!64785 (= lt!27597 lt!27588)))

(assert (=> b!64785 (= call!5286 call!5295)))

(declare-fun lt!27585 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1772)

(assert (=> b!64785 (= lt!27588 (lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) lt!27585 (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64785 (= lt!27585 (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!42463 () tuple2!2062)

(assert (=> b!64785 (= e!42463 (tuple2!2063 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6042 newMap!16) (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) (zeroValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!372 newMap!16) (_keys!3758 newMap!16) (_values!2104 newMap!16) (_vacant!372 newMap!16))))))

(declare-fun b!64786 () Bool)

(declare-fun res!35288 () Bool)

(declare-fun call!5276 () Bool)

(assert (=> b!64786 (= res!35288 call!5276)))

(assert (=> b!64786 (=> (not res!35288) (not e!42471))))

(declare-fun b!64787 () Bool)

(declare-fun e!42459 () Unit!1772)

(declare-fun Unit!1779 () Unit!1772)

(assert (=> b!64787 (= e!42459 Unit!1779)))

(declare-fun lt!27595 () Unit!1772)

(assert (=> b!64787 (= lt!27595 call!5287)))

(declare-fun call!5294 () SeekEntryResult!234)

(assert (=> b!64787 (= lt!27586 call!5294)))

(declare-fun res!35299 () Bool)

(assert (=> b!64787 (= res!35299 ((_ is Found!234) lt!27586))))

(assert (=> b!64787 (=> (not res!35299) (not e!42471))))

(assert (=> b!64787 e!42471))

(declare-fun lt!27590 () Unit!1772)

(assert (=> b!64787 (= lt!27590 lt!27595)))

(assert (=> b!64787 false))

(declare-fun b!64788 () Bool)

(declare-fun e!42454 () tuple2!2062)

(declare-fun lt!27582 () tuple2!2062)

(assert (=> b!64788 (= e!42454 (tuple2!2063 (_1!1042 lt!27582) (_2!1042 lt!27582)))))

(declare-fun call!5290 () tuple2!2062)

(assert (=> b!64788 (= lt!27582 call!5290)))

(declare-fun b!64789 () Bool)

(declare-fun e!42472 () Bool)

(declare-fun call!5275 () ListLongMap!1369)

(assert (=> b!64789 (= e!42472 (= call!5275 call!5278))))

(declare-fun b!64790 () Bool)

(declare-fun call!5282 () ListLongMap!1369)

(assert (=> b!64790 (= e!42456 call!5282)))

(declare-fun bm!5278 () Bool)

(declare-fun call!5289 () Bool)

(assert (=> bm!5278 (= call!5277 call!5289)))

(declare-fun c!8866 () Bool)

(declare-fun e!42469 () ListLongMap!1369)

(declare-fun bm!5279 () Bool)

(declare-fun c!8868 () Bool)

(assert (=> bm!5279 (= call!5284 (+!85 e!42469 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!8861 () Bool)

(assert (=> bm!5279 (= c!8861 c!8868)))

(declare-fun bm!5280 () Bool)

(declare-fun call!5293 () SeekEntryResult!234)

(assert (=> bm!5280 (= call!5294 call!5293)))

(declare-fun bm!5281 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1772)

(assert (=> bm!5281 (= call!5287 (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(declare-fun d!13421 () Bool)

(declare-fun e!42453 () Bool)

(assert (=> d!13421 e!42453))

(declare-fun res!35298 () Bool)

(assert (=> d!13421 (=> (not res!35298) (not e!42453))))

(declare-fun lt!27573 () tuple2!2062)

(assert (=> d!13421 (= res!35298 (valid!277 (_2!1042 lt!27573)))))

(declare-fun e!42465 () tuple2!2062)

(assert (=> d!13421 (= lt!27573 e!42465)))

(assert (=> d!13421 (= c!8868 (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvneg (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(assert (=> d!13421 (valid!277 newMap!16)))

(assert (=> d!13421 (= (update!90 newMap!16 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!27573)))

(declare-fun b!64791 () Bool)

(declare-fun c!8872 () Bool)

(declare-fun lt!27580 () SeekEntryResult!234)

(assert (=> b!64791 (= c!8872 ((_ is MissingVacant!234) lt!27580))))

(declare-fun e!42470 () Bool)

(declare-fun e!42473 () Bool)

(assert (=> b!64791 (= e!42470 e!42473)))

(declare-fun bm!5282 () Bool)

(declare-fun call!5281 () Bool)

(assert (=> bm!5282 (= call!5281 call!5298)))

(declare-fun b!64792 () Bool)

(declare-fun lt!27575 () Unit!1772)

(assert (=> b!64792 (= lt!27575 e!42459)))

(declare-fun c!8870 () Bool)

(assert (=> b!64792 (= c!8870 call!5280)))

(declare-fun e!42462 () tuple2!2062)

(assert (=> b!64792 (= e!42462 (tuple2!2063 false newMap!16))))

(declare-fun c!8871 () Bool)

(declare-fun lt!27593 () SeekEntryResult!234)

(declare-fun bm!5283 () Bool)

(declare-fun updateHelperNewKey!19 (LongMapFixedSize!646 (_ BitVec 64) V!2881 (_ BitVec 32)) tuple2!2062)

(assert (=> bm!5283 (= call!5290 (updateHelperNewKey!19 newMap!16 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593))))))

(declare-fun b!64793 () Bool)

(declare-fun lt!27576 () Unit!1772)

(assert (=> b!64793 (= e!42459 lt!27576)))

(assert (=> b!64793 (= lt!27576 call!5288)))

(assert (=> b!64793 (= lt!27580 call!5294)))

(declare-fun c!8862 () Bool)

(assert (=> b!64793 (= c!8862 ((_ is MissingZero!234) lt!27580))))

(assert (=> b!64793 e!42470))

(declare-fun bm!5284 () Bool)

(declare-fun call!5297 () ListLongMap!1369)

(assert (=> bm!5284 (= call!5282 call!5297)))

(declare-fun b!64794 () Bool)

(assert (=> b!64794 (= e!42456 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!64795 () Bool)

(assert (=> b!64795 (= e!42453 e!42472)))

(declare-fun c!8863 () Bool)

(assert (=> b!64795 (= c!8863 (_1!1042 lt!27573))))

(declare-fun b!64796 () Bool)

(assert (=> b!64796 (= c!8871 ((_ is MissingVacant!234) lt!27593))))

(assert (=> b!64796 (= e!42462 e!42454)))

(declare-fun bm!5285 () Bool)

(declare-fun call!5296 () Bool)

(assert (=> bm!5285 (= call!5296 call!5298)))

(declare-fun b!64797 () Bool)

(declare-fun e!42458 () Bool)

(assert (=> b!64797 (= e!42458 (not call!5281))))

(declare-fun bm!5286 () Bool)

(declare-fun call!5279 () Bool)

(assert (=> bm!5286 (= call!5279 call!5276)))

(declare-fun bm!5287 () Bool)

(declare-fun call!5292 () ListLongMap!1369)

(assert (=> bm!5287 (= call!5292 call!5297)))

(declare-fun b!64798 () Bool)

(declare-fun e!42468 () Bool)

(assert (=> b!64798 (= e!42468 (= call!5275 (+!85 call!5278 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64799 () Bool)

(assert (=> b!64799 (= e!42472 e!42468)))

(declare-fun res!35286 () Bool)

(assert (=> b!64799 (= res!35286 (contains!696 call!5275 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> b!64799 (=> (not res!35286) (not e!42468))))

(declare-fun b!64800 () Bool)

(assert (=> b!64800 (= e!42473 ((_ is Undefined!234) lt!27580))))

(declare-fun b!64801 () Bool)

(declare-fun e!42455 () Bool)

(assert (=> b!64801 (= e!42455 (not call!5296))))

(declare-fun b!64802 () Bool)

(assert (=> b!64802 (= e!42460 ((_ is Undefined!234) lt!27579))))

(declare-fun bm!5288 () Bool)

(assert (=> bm!5288 (= call!5275 (map!1120 (_2!1042 lt!27573)))))

(declare-fun lt!27581 () array!3767)

(declare-fun lt!27583 () (_ BitVec 32))

(declare-fun bm!5289 () Bool)

(assert (=> bm!5289 (= call!5297 (getCurrentListMap!396 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!64803 () Bool)

(declare-fun res!35292 () Bool)

(declare-fun e!42464 () Bool)

(assert (=> b!64803 (=> (not res!35292) (not e!42464))))

(assert (=> b!64803 (= res!35292 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3063 lt!27580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5290 () Bool)

(assert (=> bm!5290 (= call!5285 (getCurrentListMap!396 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!64804 () Bool)

(declare-fun lt!27592 () Unit!1772)

(declare-fun lt!27598 () Unit!1772)

(assert (=> b!64804 (= lt!27592 lt!27598)))

(assert (=> b!64804 (contains!696 call!5282 (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!78 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) Unit!1772)

(assert (=> b!64804 (= lt!27598 (lemmaValidKeyInArrayIsInListMap!78 (_keys!3758 newMap!16) lt!27581 (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3064 lt!27593) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64804 (= lt!27581 (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))))))

(declare-fun lt!27572 () Unit!1772)

(declare-fun lt!27589 () Unit!1772)

(assert (=> b!64804 (= lt!27572 lt!27589)))

(assert (=> b!64804 (= call!5284 call!5285)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) (_ BitVec 64) V!2881 Int) Unit!1772)

(assert (=> b!64804 (= lt!27589 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3064 lt!27593) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27574 () Unit!1772)

(assert (=> b!64804 (= lt!27574 e!42466)))

(declare-fun c!8859 () Bool)

(assert (=> b!64804 (= c!8859 call!5280)))

(declare-fun e!42457 () tuple2!2062)

(assert (=> b!64804 (= e!42457 (tuple2!2063 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (_size!372 newMap!16) (_keys!3758 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))) (_vacant!372 newMap!16))))))

(declare-fun b!64805 () Bool)

(declare-fun res!35291 () Bool)

(assert (=> b!64805 (=> (not res!35291) (not e!42464))))

(assert (=> b!64805 (= res!35291 call!5279)))

(assert (=> b!64805 (= e!42470 e!42464)))

(declare-fun b!64806 () Bool)

(declare-fun res!35290 () Bool)

(declare-fun e!42461 () Bool)

(assert (=> b!64806 (=> (not res!35290) (not e!42461))))

(assert (=> b!64806 (= res!35290 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3063 lt!27579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64807 () Bool)

(declare-fun lt!27591 () Unit!1772)

(declare-fun lt!27577 () Unit!1772)

(assert (=> b!64807 (= lt!27591 lt!27577)))

(assert (=> b!64807 (= call!5286 call!5292)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!19 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1772)

(assert (=> b!64807 (= lt!27577 (lemmaChangeZeroKeyThenAddPairToListMap!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) lt!27583 (zeroValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64807 (= lt!27583 (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!64807 (= e!42463 (tuple2!2063 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6042 newMap!16) (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (_size!372 newMap!16) (_keys!3758 newMap!16) (_values!2104 newMap!16) (_vacant!372 newMap!16))))))

(declare-fun b!64808 () Bool)

(assert (=> b!64808 (= e!42474 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27578)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!64809 () Bool)

(declare-fun res!35294 () Bool)

(assert (=> b!64809 (= res!35294 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3066 lt!27579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64809 (=> (not res!35294) (not e!42455))))

(declare-fun bm!5291 () Bool)

(assert (=> bm!5291 (= call!5291 call!5293)))

(declare-fun b!64810 () Bool)

(assert (=> b!64810 (= e!42460 e!42455)))

(declare-fun res!35293 () Bool)

(assert (=> b!64810 (= res!35293 call!5283)))

(assert (=> b!64810 (=> (not res!35293) (not e!42455))))

(declare-fun bm!5292 () Bool)

(assert (=> bm!5292 (= call!5276 call!5289)))

(declare-fun bm!5293 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5293 (= call!5289 (inRange!0 (ite c!8867 (ite c!8870 (index!3064 lt!27586) (ite c!8862 (index!3063 lt!27580) (index!3066 lt!27580))) (ite c!8859 (index!3064 lt!27578) (ite c!8864 (index!3063 lt!27579) (index!3066 lt!27579)))) (mask!6042 newMap!16)))))

(declare-fun b!64811 () Bool)

(assert (=> b!64811 (= e!42465 e!42462)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3765 (_ BitVec 32)) SeekEntryResult!234)

(assert (=> b!64811 (= lt!27593 (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(assert (=> b!64811 (= c!8867 ((_ is Undefined!234) lt!27593))))

(declare-fun b!64812 () Bool)

(assert (=> b!64812 (= e!42464 (not call!5281))))

(declare-fun b!64813 () Bool)

(assert (=> b!64813 (= e!42465 e!42463)))

(assert (=> b!64813 (= c!8866 (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64814 () Bool)

(declare-fun res!35297 () Bool)

(assert (=> b!64814 (=> (not res!35297) (not e!42461))))

(assert (=> b!64814 (= res!35297 call!5283)))

(assert (=> b!64814 (= e!42467 e!42461)))

(declare-fun b!64815 () Bool)

(assert (=> b!64815 (= e!42469 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun bm!5294 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1772)

(assert (=> bm!5294 (= call!5288 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(declare-fun b!64816 () Bool)

(assert (=> b!64816 (= e!42469 (ite c!8866 call!5295 call!5292))))

(declare-fun b!64817 () Bool)

(assert (=> b!64817 (= e!42454 e!42457)))

(declare-fun c!8865 () Bool)

(assert (=> b!64817 (= c!8865 ((_ is MissingZero!234) lt!27593))))

(declare-fun b!64818 () Bool)

(assert (=> b!64818 (= e!42461 (not call!5296))))

(declare-fun b!64819 () Bool)

(declare-fun res!35287 () Bool)

(assert (=> b!64819 (= res!35287 call!5277)))

(assert (=> b!64819 (=> (not res!35287) (not e!42474))))

(declare-fun bm!5295 () Bool)

(assert (=> bm!5295 (= call!5293 (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(declare-fun b!64820 () Bool)

(assert (=> b!64820 (= e!42473 e!42458)))

(declare-fun res!35289 () Bool)

(assert (=> b!64820 (= res!35289 call!5279)))

(assert (=> b!64820 (=> (not res!35289) (not e!42458))))

(declare-fun b!64821 () Bool)

(declare-fun lt!27587 () tuple2!2062)

(assert (=> b!64821 (= lt!27587 call!5290)))

(assert (=> b!64821 (= e!42457 (tuple2!2063 (_1!1042 lt!27587) (_2!1042 lt!27587)))))

(declare-fun b!64822 () Bool)

(declare-fun res!35295 () Bool)

(assert (=> b!64822 (= res!35295 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3066 lt!27580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64822 (=> (not res!35295) (not e!42458))))

(assert (= (and d!13421 c!8868) b!64813))

(assert (= (and d!13421 (not c!8868)) b!64811))

(assert (= (and b!64813 c!8866) b!64807))

(assert (= (and b!64813 (not c!8866)) b!64785))

(assert (= (or b!64807 b!64785) bm!5276))

(assert (= (or b!64807 b!64785) bm!5287))

(assert (= (or b!64807 b!64785) bm!5275))

(assert (= (and b!64811 c!8867) b!64792))

(assert (= (and b!64811 (not c!8867)) b!64796))

(assert (= (and b!64792 c!8870) b!64787))

(assert (= (and b!64792 (not c!8870)) b!64793))

(assert (= (and b!64787 res!35299) b!64786))

(assert (= (and b!64786 res!35288) b!64781))

(assert (= (and b!64793 c!8862) b!64805))

(assert (= (and b!64793 (not c!8862)) b!64791))

(assert (= (and b!64805 res!35291) b!64803))

(assert (= (and b!64803 res!35292) b!64812))

(assert (= (and b!64791 c!8872) b!64820))

(assert (= (and b!64791 (not c!8872)) b!64800))

(assert (= (and b!64820 res!35289) b!64822))

(assert (= (and b!64822 res!35295) b!64797))

(assert (= (or b!64805 b!64820) bm!5286))

(assert (= (or b!64812 b!64797) bm!5282))

(assert (= (or b!64786 bm!5286) bm!5292))

(assert (= (or b!64787 b!64793) bm!5280))

(assert (= (and b!64796 c!8871) b!64788))

(assert (= (and b!64796 (not c!8871)) b!64817))

(assert (= (and b!64817 c!8865) b!64821))

(assert (= (and b!64817 (not c!8865)) b!64804))

(assert (= (and b!64804 c!8859) b!64784))

(assert (= (and b!64804 (not c!8859)) b!64782))

(assert (= (and b!64784 res!35296) b!64819))

(assert (= (and b!64819 res!35287) b!64808))

(assert (= (and b!64782 c!8864) b!64814))

(assert (= (and b!64782 (not c!8864)) b!64783))

(assert (= (and b!64814 res!35297) b!64806))

(assert (= (and b!64806 res!35290) b!64818))

(assert (= (and b!64783 c!8860) b!64810))

(assert (= (and b!64783 (not c!8860)) b!64802))

(assert (= (and b!64810 res!35293) b!64809))

(assert (= (and b!64809 res!35294) b!64801))

(assert (= (or b!64814 b!64810) bm!5277))

(assert (= (or b!64818 b!64801) bm!5285))

(assert (= (or b!64819 bm!5277) bm!5278))

(assert (= (or b!64784 b!64782) bm!5291))

(assert (= (or b!64788 b!64821) bm!5283))

(assert (= (or bm!5282 bm!5285) bm!5273))

(assert (= (or b!64792 b!64804) bm!5284))

(assert (= (or b!64793 b!64782) bm!5294))

(assert (= (or bm!5280 bm!5291) bm!5295))

(assert (= (or b!64787 b!64784) bm!5281))

(assert (= (or bm!5292 bm!5278) bm!5293))

(assert (= (or b!64792 b!64804) bm!5272))

(assert (= (and bm!5272 c!8869) b!64790))

(assert (= (and bm!5272 (not c!8869)) b!64794))

(assert (= (or bm!5287 bm!5284) bm!5289))

(assert (= (or bm!5276 b!64804) bm!5290))

(assert (= (or bm!5275 b!64804) bm!5279))

(assert (= (and bm!5279 c!8861) b!64816))

(assert (= (and bm!5279 (not c!8861)) b!64815))

(assert (= (and d!13421 res!35298) b!64795))

(assert (= (and b!64795 c!8863) b!64799))

(assert (= (and b!64795 (not c!8863)) b!64789))

(assert (= (and b!64799 res!35286) b!64798))

(assert (= (or b!64799 b!64798 b!64789) bm!5288))

(assert (= (or b!64798 b!64789) bm!5274))

(assert (=> bm!5281 m!58861))

(declare-fun m!59083 () Bool)

(assert (=> bm!5281 m!59083))

(declare-fun m!59085 () Bool)

(assert (=> b!64798 m!59085))

(declare-fun m!59087 () Bool)

(assert (=> d!13421 m!59087))

(assert (=> d!13421 m!58855))

(declare-fun m!59089 () Bool)

(assert (=> bm!5288 m!59089))

(assert (=> bm!5272 m!58861))

(declare-fun m!59091 () Bool)

(assert (=> bm!5272 m!59091))

(declare-fun m!59093 () Bool)

(assert (=> bm!5289 m!59093))

(declare-fun m!59095 () Bool)

(assert (=> b!64804 m!59095))

(assert (=> b!64804 m!59095))

(declare-fun m!59097 () Bool)

(assert (=> b!64804 m!59097))

(assert (=> b!64804 m!58861))

(assert (=> b!64804 m!58893))

(declare-fun m!59099 () Bool)

(assert (=> b!64804 m!59099))

(declare-fun m!59101 () Bool)

(assert (=> b!64804 m!59101))

(declare-fun m!59103 () Bool)

(assert (=> b!64804 m!59103))

(declare-fun m!59105 () Bool)

(assert (=> b!64803 m!59105))

(assert (=> bm!5274 m!58863))

(assert (=> bm!5273 m!58861))

(declare-fun m!59107 () Bool)

(assert (=> bm!5273 m!59107))

(declare-fun m!59109 () Bool)

(assert (=> b!64781 m!59109))

(assert (=> bm!5295 m!58861))

(declare-fun m!59111 () Bool)

(assert (=> bm!5295 m!59111))

(assert (=> b!64794 m!59011))

(assert (=> bm!5294 m!58861))

(declare-fun m!59113 () Bool)

(assert (=> bm!5294 m!59113))

(assert (=> bm!5290 m!59103))

(declare-fun m!59115 () Bool)

(assert (=> bm!5290 m!59115))

(declare-fun m!59117 () Bool)

(assert (=> bm!5293 m!59117))

(declare-fun m!59119 () Bool)

(assert (=> bm!5279 m!59119))

(assert (=> b!64785 m!58893))

(declare-fun m!59121 () Bool)

(assert (=> b!64785 m!59121))

(assert (=> b!64799 m!58861))

(declare-fun m!59123 () Bool)

(assert (=> b!64799 m!59123))

(declare-fun m!59125 () Bool)

(assert (=> b!64806 m!59125))

(assert (=> b!64811 m!58861))

(assert (=> b!64811 m!59111))

(assert (=> bm!5283 m!58861))

(assert (=> bm!5283 m!58893))

(declare-fun m!59127 () Bool)

(assert (=> bm!5283 m!59127))

(declare-fun m!59129 () Bool)

(assert (=> b!64809 m!59129))

(assert (=> b!64807 m!58893))

(declare-fun m!59131 () Bool)

(assert (=> b!64807 m!59131))

(declare-fun m!59133 () Bool)

(assert (=> b!64808 m!59133))

(declare-fun m!59135 () Bool)

(assert (=> b!64822 m!59135))

(assert (=> b!64815 m!59011))

(assert (=> b!64452 d!13421))

(declare-fun d!13423 () Bool)

(declare-fun c!8875 () Bool)

(assert (=> d!13423 (= c!8875 ((_ is ValueCellFull!869) (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun e!42477 () V!2881)

(assert (=> d!13423 (= (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42477)))

(declare-fun b!64827 () Bool)

(declare-fun get!1102 (ValueCell!869 V!2881) V!2881)

(assert (=> b!64827 (= e!42477 (get!1102 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64828 () Bool)

(declare-fun get!1103 (ValueCell!869 V!2881) V!2881)

(assert (=> b!64828 (= e!42477 (get!1103 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13423 c!8875) b!64827))

(assert (= (and d!13423 (not c!8875)) b!64828))

(assert (=> b!64827 m!58889))

(assert (=> b!64827 m!58891))

(declare-fun m!59137 () Bool)

(assert (=> b!64827 m!59137))

(assert (=> b!64828 m!58889))

(assert (=> b!64828 m!58891))

(declare-fun m!59139 () Bool)

(assert (=> b!64828 m!59139))

(assert (=> b!64452 d!13423))

(declare-fun b!64829 () Bool)

(declare-fun e!42480 () Bool)

(declare-fun e!42481 () Bool)

(assert (=> b!64829 (= e!42480 e!42481)))

(declare-fun c!8876 () Bool)

(assert (=> b!64829 (= c!8876 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64830 () Bool)

(declare-fun call!5299 () Bool)

(assert (=> b!64830 (= e!42481 call!5299)))

(declare-fun bm!5296 () Bool)

(assert (=> bm!5296 (= call!5299 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8876 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) Nil!1450) Nil!1450)))))

(declare-fun b!64831 () Bool)

(declare-fun e!42478 () Bool)

(assert (=> b!64831 (= e!42478 e!42480)))

(declare-fun res!35300 () Bool)

(assert (=> b!64831 (=> (not res!35300) (not e!42480))))

(declare-fun e!42479 () Bool)

(assert (=> b!64831 (= res!35300 (not e!42479))))

(declare-fun res!35301 () Bool)

(assert (=> b!64831 (=> (not res!35301) (not e!42479))))

(assert (=> b!64831 (= res!35301 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!13425 () Bool)

(declare-fun res!35302 () Bool)

(assert (=> d!13425 (=> res!35302 e!42478)))

(assert (=> d!13425 (= res!35302 (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13425 (= (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 Nil!1450) e!42478)))

(declare-fun b!64832 () Bool)

(assert (=> b!64832 (= e!42481 call!5299)))

(declare-fun b!64833 () Bool)

(assert (=> b!64833 (= e!42479 (contains!697 Nil!1450 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!13425 (not res!35302)) b!64831))

(assert (= (and b!64831 res!35301) b!64833))

(assert (= (and b!64831 res!35300) b!64829))

(assert (= (and b!64829 c!8876) b!64832))

(assert (= (and b!64829 (not c!8876)) b!64830))

(assert (= (or b!64832 b!64830) bm!5296))

(declare-fun m!59141 () Bool)

(assert (=> b!64829 m!59141))

(assert (=> b!64829 m!59141))

(declare-fun m!59143 () Bool)

(assert (=> b!64829 m!59143))

(assert (=> bm!5296 m!59141))

(declare-fun m!59145 () Bool)

(assert (=> bm!5296 m!59145))

(assert (=> b!64831 m!59141))

(assert (=> b!64831 m!59141))

(assert (=> b!64831 m!59143))

(assert (=> b!64833 m!59141))

(assert (=> b!64833 m!59141))

(declare-fun m!59147 () Bool)

(assert (=> b!64833 m!59147))

(assert (=> b!64456 d!13425))

(declare-fun d!13427 () Bool)

(assert (=> d!13427 (= (validMask!0 (mask!6042 (v!2440 (underlying!235 thiss!992)))) (and (or (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000001111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000011111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000001111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000011111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000001111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000011111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000001111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000011111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000000111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000001111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000011111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000000111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000001111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000011111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000000111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000001111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000011111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000000111111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000001111111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000011111111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00000111111111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00001111111111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00011111111111111111111111111111) (= (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6042 (v!2440 (underlying!235 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!64441 d!13427))

(declare-fun d!13429 () Bool)

(assert (=> d!13429 (= (valid!278 thiss!992) (valid!277 (v!2440 (underlying!235 thiss!992))))))

(declare-fun bs!2805 () Bool)

(assert (= bs!2805 d!13429))

(declare-fun m!59149 () Bool)

(assert (=> bs!2805 m!59149))

(assert (=> start!9116 d!13429))

(declare-fun d!13431 () Bool)

(assert (=> d!13431 (= (array_inv!1121 (_keys!3758 newMap!16)) (bvsge (size!2033 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64440 d!13431))

(declare-fun d!13433 () Bool)

(assert (=> d!13433 (= (array_inv!1122 (_values!2104 newMap!16)) (bvsge (size!2034 (_values!2104 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64440 d!13433))

(declare-fun b!64842 () Bool)

(declare-fun e!42488 () Bool)

(declare-fun call!5302 () Bool)

(assert (=> b!64842 (= e!42488 call!5302)))

(declare-fun d!13435 () Bool)

(declare-fun res!35308 () Bool)

(declare-fun e!42490 () Bool)

(assert (=> d!13435 (=> res!35308 e!42490)))

(assert (=> d!13435 (= res!35308 (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))) e!42490)))

(declare-fun bm!5299 () Bool)

(assert (=> bm!5299 (= call!5302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64843 () Bool)

(declare-fun e!42489 () Bool)

(assert (=> b!64843 (= e!42488 e!42489)))

(declare-fun lt!27606 () (_ BitVec 64))

(assert (=> b!64843 (= lt!27606 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!27607 () Unit!1772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3765 (_ BitVec 64) (_ BitVec 32)) Unit!1772)

(assert (=> b!64843 (= lt!27607 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 #b00000000000000000000000000000000))))

(assert (=> b!64843 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 #b00000000000000000000000000000000)))

(declare-fun lt!27605 () Unit!1772)

(assert (=> b!64843 (= lt!27605 lt!27607)))

(declare-fun res!35307 () Bool)

(assert (=> b!64843 (= res!35307 (= (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))) (Found!234 #b00000000000000000000000000000000)))))

(assert (=> b!64843 (=> (not res!35307) (not e!42489))))

(declare-fun b!64844 () Bool)

(assert (=> b!64844 (= e!42489 call!5302)))

(declare-fun b!64845 () Bool)

(assert (=> b!64845 (= e!42490 e!42488)))

(declare-fun c!8879 () Bool)

(assert (=> b!64845 (= c!8879 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!13435 (not res!35308)) b!64845))

(assert (= (and b!64845 c!8879) b!64843))

(assert (= (and b!64845 (not c!8879)) b!64842))

(assert (= (and b!64843 res!35307) b!64844))

(assert (= (or b!64844 b!64842) bm!5299))

(declare-fun m!59151 () Bool)

(assert (=> bm!5299 m!59151))

(assert (=> b!64843 m!59141))

(declare-fun m!59153 () Bool)

(assert (=> b!64843 m!59153))

(declare-fun m!59155 () Bool)

(assert (=> b!64843 m!59155))

(assert (=> b!64843 m!59141))

(declare-fun m!59157 () Bool)

(assert (=> b!64843 m!59157))

(assert (=> b!64845 m!59141))

(assert (=> b!64845 m!59141))

(assert (=> b!64845 m!59143))

(assert (=> b!64445 d!13435))

(declare-fun condMapEmpty!3003 () Bool)

(declare-fun mapDefault!3003 () ValueCell!869)

(assert (=> mapNonEmpty!2988 (= condMapEmpty!3003 (= mapRest!2988 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3003)))))

(declare-fun e!42496 () Bool)

(declare-fun mapRes!3003 () Bool)

(assert (=> mapNonEmpty!2988 (= tp!8193 (and e!42496 mapRes!3003))))

(declare-fun mapIsEmpty!3003 () Bool)

(assert (=> mapIsEmpty!3003 mapRes!3003))

(declare-fun b!64853 () Bool)

(assert (=> b!64853 (= e!42496 tp_is_empty!2425)))

(declare-fun b!64852 () Bool)

(declare-fun e!42495 () Bool)

(assert (=> b!64852 (= e!42495 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3003 () Bool)

(declare-fun tp!8223 () Bool)

(assert (=> mapNonEmpty!3003 (= mapRes!3003 (and tp!8223 e!42495))))

(declare-fun mapValue!3003 () ValueCell!869)

(declare-fun mapRest!3003 () (Array (_ BitVec 32) ValueCell!869))

(declare-fun mapKey!3003 () (_ BitVec 32))

(assert (=> mapNonEmpty!3003 (= mapRest!2988 (store mapRest!3003 mapKey!3003 mapValue!3003))))

(assert (= (and mapNonEmpty!2988 condMapEmpty!3003) mapIsEmpty!3003))

(assert (= (and mapNonEmpty!2988 (not condMapEmpty!3003)) mapNonEmpty!3003))

(assert (= (and mapNonEmpty!3003 ((_ is ValueCellFull!869) mapValue!3003)) b!64852))

(assert (= (and mapNonEmpty!2988 ((_ is ValueCellFull!869) mapDefault!3003)) b!64853))

(declare-fun m!59159 () Bool)

(assert (=> mapNonEmpty!3003 m!59159))

(declare-fun condMapEmpty!3004 () Bool)

(declare-fun mapDefault!3004 () ValueCell!869)

(assert (=> mapNonEmpty!2987 (= condMapEmpty!3004 (= mapRest!2987 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3004)))))

(declare-fun e!42498 () Bool)

(declare-fun mapRes!3004 () Bool)

(assert (=> mapNonEmpty!2987 (= tp!8196 (and e!42498 mapRes!3004))))

(declare-fun mapIsEmpty!3004 () Bool)

(assert (=> mapIsEmpty!3004 mapRes!3004))

(declare-fun b!64855 () Bool)

(assert (=> b!64855 (= e!42498 tp_is_empty!2425)))

(declare-fun b!64854 () Bool)

(declare-fun e!42497 () Bool)

(assert (=> b!64854 (= e!42497 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3004 () Bool)

(declare-fun tp!8224 () Bool)

(assert (=> mapNonEmpty!3004 (= mapRes!3004 (and tp!8224 e!42497))))

(declare-fun mapValue!3004 () ValueCell!869)

(declare-fun mapRest!3004 () (Array (_ BitVec 32) ValueCell!869))

(declare-fun mapKey!3004 () (_ BitVec 32))

(assert (=> mapNonEmpty!3004 (= mapRest!2987 (store mapRest!3004 mapKey!3004 mapValue!3004))))

(assert (= (and mapNonEmpty!2987 condMapEmpty!3004) mapIsEmpty!3004))

(assert (= (and mapNonEmpty!2987 (not condMapEmpty!3004)) mapNonEmpty!3004))

(assert (= (and mapNonEmpty!3004 ((_ is ValueCellFull!869) mapValue!3004)) b!64854))

(assert (= (and mapNonEmpty!2987 ((_ is ValueCellFull!869) mapDefault!3004)) b!64855))

(declare-fun m!59161 () Bool)

(assert (=> mapNonEmpty!3004 m!59161))

(declare-fun b_lambda!2897 () Bool)

(assert (= b_lambda!2895 (or (and b!64437 b_free!2017) (and b!64440 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))))) b_lambda!2897)))

(check-sat (not b!64663) (not d!13429) (not bm!5289) (not bm!5281) (not b!64811) (not b_next!2017) (not d!13399) (not b!64599) (not bm!5296) (not b!64686) (not d!13421) (not b!64660) (not bm!5274) b_and!3963 (not mapNonEmpty!3004) (not d!13409) (not b!64804) (not b!64667) (not b_lambda!2893) (not b!64678) (not bm!5223) (not b!64845) (not b!64798) (not b!64833) (not b_next!2019) (not b!64694) (not d!13419) (not d!13401) (not d!13413) (not b!64831) (not bm!5293) (not bm!5279) (not d!13411) (not bm!5217) (not b!64815) (not bm!5299) (not b!64668) (not b!64676) (not bm!5294) (not mapNonEmpty!3003) (not b!64794) (not b!64613) (not bm!5202) (not b!64687) (not b!64611) (not b!64807) (not bm!5220) b_and!3961 (not b!64828) (not b!64696) (not d!13405) (not bm!5290) (not b!64827) (not b!64615) (not b!64785) (not b!64843) (not bm!5218) (not b!64799) (not bm!5288) (not b!64658) (not b_lambda!2897) (not bm!5295) (not b!64664) (not b!64829) (not b!64685) (not b!64594) (not bm!5272) (not bm!5273) (not bm!5283) tp_is_empty!2425)
(check-sat b_and!3961 b_and!3963 (not b_next!2017) (not b_next!2019))
(get-model)

(declare-fun b!64856 () Bool)

(declare-fun e!42501 () Bool)

(declare-fun e!42502 () Bool)

(assert (=> b!64856 (= e!42501 e!42502)))

(declare-fun c!8880 () Bool)

(assert (=> b!64856 (= c!8880 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!64857 () Bool)

(declare-fun call!5303 () Bool)

(assert (=> b!64857 (= e!42502 call!5303)))

(declare-fun bm!5300 () Bool)

(assert (=> bm!5300 (= call!5303 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8880 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!8876 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) Nil!1450) Nil!1450)) (ite c!8876 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) Nil!1450) Nil!1450))))))

(declare-fun b!64858 () Bool)

(declare-fun e!42499 () Bool)

(assert (=> b!64858 (= e!42499 e!42501)))

(declare-fun res!35309 () Bool)

(assert (=> b!64858 (=> (not res!35309) (not e!42501))))

(declare-fun e!42500 () Bool)

(assert (=> b!64858 (= res!35309 (not e!42500))))

(declare-fun res!35310 () Bool)

(assert (=> b!64858 (=> (not res!35310) (not e!42500))))

(assert (=> b!64858 (= res!35310 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!13437 () Bool)

(declare-fun res!35311 () Bool)

(assert (=> d!13437 (=> res!35311 e!42499)))

(assert (=> d!13437 (= res!35311 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13437 (= (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8876 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) Nil!1450) Nil!1450)) e!42499)))

(declare-fun b!64859 () Bool)

(assert (=> b!64859 (= e!42502 call!5303)))

(declare-fun b!64860 () Bool)

(assert (=> b!64860 (= e!42500 (contains!697 (ite c!8876 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) Nil!1450) Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!13437 (not res!35311)) b!64858))

(assert (= (and b!64858 res!35310) b!64860))

(assert (= (and b!64858 res!35309) b!64856))

(assert (= (and b!64856 c!8880) b!64859))

(assert (= (and b!64856 (not c!8880)) b!64857))

(assert (= (or b!64859 b!64857) bm!5300))

(declare-fun m!59163 () Bool)

(assert (=> b!64856 m!59163))

(assert (=> b!64856 m!59163))

(declare-fun m!59165 () Bool)

(assert (=> b!64856 m!59165))

(assert (=> bm!5300 m!59163))

(declare-fun m!59167 () Bool)

(assert (=> bm!5300 m!59167))

(assert (=> b!64858 m!59163))

(assert (=> b!64858 m!59163))

(assert (=> b!64858 m!59165))

(assert (=> b!64860 m!59163))

(assert (=> b!64860 m!59163))

(declare-fun m!59169 () Bool)

(assert (=> b!64860 m!59169))

(assert (=> bm!5296 d!13437))

(assert (=> d!13401 d!13407))

(declare-fun d!13439 () Bool)

(assert (=> d!13439 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) from!355 Nil!1450)))

(assert (=> d!13439 true))

(declare-fun _$71!84 () Unit!1772)

(assert (=> d!13439 (= (choose!39 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!84)))

(declare-fun bs!2806 () Bool)

(assert (= bs!2806 d!13439))

(assert (=> bs!2806 m!58873))

(assert (=> d!13401 d!13439))

(declare-fun d!13441 () Bool)

(declare-fun e!42505 () Bool)

(assert (=> d!13441 e!42505))

(declare-fun c!8883 () Bool)

(assert (=> d!13441 (= c!8883 (and (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13441 true))

(declare-fun _$29!78 () Unit!1772)

(assert (=> d!13441 (= (choose!360 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))) _$29!78)))

(declare-fun b!64865 () Bool)

(assert (=> b!64865 (= e!42505 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64866 () Bool)

(assert (=> b!64866 (= e!42505 (ite (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13441 c!8883) b!64865))

(assert (= (and d!13441 (not c!8883)) b!64866))

(assert (=> b!64865 m!58861))

(assert (=> b!64865 m!58877))

(assert (=> d!13405 d!13441))

(assert (=> d!13405 d!13427))

(assert (=> bm!5274 d!13409))

(declare-fun b!64867 () Bool)

(declare-fun e!42508 () Bool)

(declare-fun e!42509 () Bool)

(assert (=> b!64867 (= e!42508 e!42509)))

(declare-fun c!8884 () Bool)

(assert (=> b!64867 (= c!8884 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64868 () Bool)

(declare-fun call!5304 () Bool)

(assert (=> b!64868 (= e!42509 call!5304)))

(declare-fun bm!5301 () Bool)

(assert (=> bm!5301 (= call!5304 (arrayNoDuplicates!0 (_keys!3758 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8884 (Cons!1449 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000) Nil!1450) Nil!1450)))))

(declare-fun b!64869 () Bool)

(declare-fun e!42506 () Bool)

(assert (=> b!64869 (= e!42506 e!42508)))

(declare-fun res!35312 () Bool)

(assert (=> b!64869 (=> (not res!35312) (not e!42508))))

(declare-fun e!42507 () Bool)

(assert (=> b!64869 (= res!35312 (not e!42507))))

(declare-fun res!35313 () Bool)

(assert (=> b!64869 (=> (not res!35313) (not e!42507))))

(assert (=> b!64869 (= res!35313 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13443 () Bool)

(declare-fun res!35314 () Bool)

(assert (=> d!13443 (=> res!35314 e!42506)))

(assert (=> d!13443 (= res!35314 (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(assert (=> d!13443 (= (arrayNoDuplicates!0 (_keys!3758 newMap!16) #b00000000000000000000000000000000 Nil!1450) e!42506)))

(declare-fun b!64870 () Bool)

(assert (=> b!64870 (= e!42509 call!5304)))

(declare-fun b!64871 () Bool)

(assert (=> b!64871 (= e!42507 (contains!697 Nil!1450 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!13443 (not res!35314)) b!64869))

(assert (= (and b!64869 res!35313) b!64871))

(assert (= (and b!64869 res!35312) b!64867))

(assert (= (and b!64867 c!8884) b!64870))

(assert (= (and b!64867 (not c!8884)) b!64868))

(assert (= (or b!64870 b!64868) bm!5301))

(declare-fun m!59171 () Bool)

(assert (=> b!64867 m!59171))

(assert (=> b!64867 m!59171))

(declare-fun m!59173 () Bool)

(assert (=> b!64867 m!59173))

(assert (=> bm!5301 m!59171))

(declare-fun m!59175 () Bool)

(assert (=> bm!5301 m!59175))

(assert (=> b!64869 m!59171))

(assert (=> b!64869 m!59171))

(assert (=> b!64869 m!59173))

(assert (=> b!64871 m!59171))

(assert (=> b!64871 m!59171))

(declare-fun m!59177 () Bool)

(assert (=> b!64871 m!59177))

(assert (=> b!64687 d!13443))

(declare-fun b!64896 () Bool)

(declare-fun res!35323 () Bool)

(declare-fun e!42525 () Bool)

(assert (=> b!64896 (=> (not res!35323) (not e!42525))))

(declare-fun lt!27627 () ListLongMap!1369)

(assert (=> b!64896 (= res!35323 (not (contains!696 lt!27627 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64897 () Bool)

(declare-fun e!42529 () Bool)

(assert (=> b!64897 (= e!42529 (= lt!27627 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!64898 () Bool)

(declare-fun e!42524 () Bool)

(declare-fun e!42530 () Bool)

(assert (=> b!64898 (= e!42524 e!42530)))

(assert (=> b!64898 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun res!35325 () Bool)

(assert (=> b!64898 (= res!35325 (contains!696 lt!27627 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64898 (=> (not res!35325) (not e!42530))))

(declare-fun b!64899 () Bool)

(declare-fun e!42526 () ListLongMap!1369)

(declare-fun call!5307 () ListLongMap!1369)

(assert (=> b!64899 (= e!42526 call!5307)))

(declare-fun bm!5304 () Bool)

(assert (=> bm!5304 (= call!5307 (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!64900 () Bool)

(declare-fun isEmpty!308 (ListLongMap!1369) Bool)

(assert (=> b!64900 (= e!42529 (isEmpty!308 lt!27627))))

(declare-fun d!13445 () Bool)

(assert (=> d!13445 e!42525))

(declare-fun res!35326 () Bool)

(assert (=> d!13445 (=> (not res!35326) (not e!42525))))

(assert (=> d!13445 (= res!35326 (not (contains!696 lt!27627 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!42527 () ListLongMap!1369)

(assert (=> d!13445 (= lt!27627 e!42527)))

(declare-fun c!8893 () Bool)

(assert (=> d!13445 (= c!8893 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13445 (validMask!0 (mask!6042 (v!2440 (underlying!235 thiss!992))))))

(assert (=> d!13445 (= (getCurrentListMapNoExtraKeys!48 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (_values!2104 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992))) (extraKeys!1994 (v!2440 (underlying!235 thiss!992))) (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) (minValue!2030 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992)))) lt!27627)))

(declare-fun b!64901 () Bool)

(assert (=> b!64901 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> b!64901 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2034 (_values!2104 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> b!64901 (= e!42530 (= (apply!70 lt!27627 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!64902 () Bool)

(assert (=> b!64902 (= e!42527 e!42526)))

(declare-fun c!8895 () Bool)

(assert (=> b!64902 (= c!8895 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64903 () Bool)

(declare-fun e!42528 () Bool)

(assert (=> b!64903 (= e!42528 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64903 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!64904 () Bool)

(declare-fun lt!27624 () Unit!1772)

(declare-fun lt!27622 () Unit!1772)

(assert (=> b!64904 (= lt!27624 lt!27622)))

(declare-fun lt!27623 () (_ BitVec 64))

(declare-fun lt!27625 () V!2881)

(declare-fun lt!27628 () (_ BitVec 64))

(declare-fun lt!27626 () ListLongMap!1369)

(assert (=> b!64904 (not (contains!696 (+!85 lt!27626 (tuple2!2061 lt!27623 lt!27625)) lt!27628))))

(declare-fun addStillNotContains!20 (ListLongMap!1369 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1772)

(assert (=> b!64904 (= lt!27622 (addStillNotContains!20 lt!27626 lt!27623 lt!27625 lt!27628))))

(assert (=> b!64904 (= lt!27628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!64904 (= lt!27625 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64904 (= lt!27623 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!64904 (= lt!27626 call!5307)))

(assert (=> b!64904 (= e!42526 (+!85 call!5307 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!64905 () Bool)

(assert (=> b!64905 (= e!42524 e!42529)))

(declare-fun c!8894 () Bool)

(assert (=> b!64905 (= c!8894 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!64906 () Bool)

(assert (=> b!64906 (= e!42527 (ListLongMap!1370 Nil!1451))))

(declare-fun b!64907 () Bool)

(assert (=> b!64907 (= e!42525 e!42524)))

(declare-fun c!8896 () Bool)

(assert (=> b!64907 (= c!8896 e!42528)))

(declare-fun res!35324 () Bool)

(assert (=> b!64907 (=> (not res!35324) (not e!42528))))

(assert (=> b!64907 (= res!35324 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (= (and d!13445 c!8893) b!64906))

(assert (= (and d!13445 (not c!8893)) b!64902))

(assert (= (and b!64902 c!8895) b!64904))

(assert (= (and b!64902 (not c!8895)) b!64899))

(assert (= (or b!64904 b!64899) bm!5304))

(assert (= (and d!13445 res!35326) b!64896))

(assert (= (and b!64896 res!35323) b!64907))

(assert (= (and b!64907 res!35324) b!64903))

(assert (= (and b!64907 c!8896) b!64898))

(assert (= (and b!64907 (not c!8896)) b!64905))

(assert (= (and b!64898 res!35325) b!64901))

(assert (= (and b!64905 c!8894) b!64897))

(assert (= (and b!64905 (not c!8894)) b!64900))

(declare-fun b_lambda!2899 () Bool)

(assert (=> (not b_lambda!2899) (not b!64901)))

(assert (=> b!64901 t!4871))

(declare-fun b_and!3965 () Bool)

(assert (= b_and!3961 (and (=> t!4871 result!2487) b_and!3965)))

(assert (=> b!64901 t!4873))

(declare-fun b_and!3967 () Bool)

(assert (= b_and!3963 (and (=> t!4873 result!2491) b_and!3967)))

(declare-fun b_lambda!2901 () Bool)

(assert (=> (not b_lambda!2901) (not b!64904)))

(assert (=> b!64904 t!4871))

(declare-fun b_and!3969 () Bool)

(assert (= b_and!3965 (and (=> t!4871 result!2487) b_and!3969)))

(assert (=> b!64904 t!4873))

(declare-fun b_and!3971 () Bool)

(assert (= b_and!3967 (and (=> t!4873 result!2491) b_and!3971)))

(assert (=> b!64902 m!58999))

(assert (=> b!64902 m!58999))

(assert (=> b!64902 m!59013))

(declare-fun m!59179 () Bool)

(assert (=> b!64904 m!59179))

(declare-fun m!59181 () Bool)

(assert (=> b!64904 m!59181))

(assert (=> b!64904 m!58999))

(assert (=> b!64904 m!59017))

(assert (=> b!64904 m!58891))

(assert (=> b!64904 m!59021))

(assert (=> b!64904 m!59017))

(assert (=> b!64904 m!59179))

(declare-fun m!59183 () Bool)

(assert (=> b!64904 m!59183))

(assert (=> b!64904 m!58891))

(declare-fun m!59185 () Bool)

(assert (=> b!64904 m!59185))

(declare-fun m!59187 () Bool)

(assert (=> d!13445 m!59187))

(assert (=> d!13445 m!58851))

(assert (=> b!64898 m!58999))

(assert (=> b!64898 m!58999))

(declare-fun m!59189 () Bool)

(assert (=> b!64898 m!59189))

(declare-fun m!59191 () Bool)

(assert (=> bm!5304 m!59191))

(assert (=> b!64901 m!59017))

(assert (=> b!64901 m!58891))

(assert (=> b!64901 m!59021))

(assert (=> b!64901 m!59017))

(assert (=> b!64901 m!58891))

(assert (=> b!64901 m!58999))

(assert (=> b!64901 m!58999))

(declare-fun m!59193 () Bool)

(assert (=> b!64901 m!59193))

(declare-fun m!59195 () Bool)

(assert (=> b!64900 m!59195))

(assert (=> b!64897 m!59191))

(declare-fun m!59197 () Bool)

(assert (=> b!64896 m!59197))

(assert (=> b!64903 m!58999))

(assert (=> b!64903 m!58999))

(assert (=> b!64903 m!59013))

(assert (=> b!64678 d!13445))

(declare-fun d!13447 () Bool)

(declare-fun e!42533 () Bool)

(assert (=> d!13447 e!42533))

(declare-fun res!35331 () Bool)

(assert (=> d!13447 (=> (not res!35331) (not e!42533))))

(declare-fun lt!27640 () ListLongMap!1369)

(assert (=> d!13447 (= res!35331 (contains!696 lt!27640 (_1!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun lt!27638 () List!1454)

(assert (=> d!13447 (= lt!27640 (ListLongMap!1370 lt!27638))))

(declare-fun lt!27637 () Unit!1772)

(declare-fun lt!27639 () Unit!1772)

(assert (=> d!13447 (= lt!27637 lt!27639)))

(assert (=> d!13447 (= (getValueByKey!126 lt!27638 (_1!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!46 (List!1454 (_ BitVec 64) V!2881) Unit!1772)

(assert (=> d!13447 (= lt!27639 (lemmaContainsTupThenGetReturnValue!46 lt!27638 (_1!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun insertStrictlySorted!49 (List!1454 (_ BitVec 64) V!2881) List!1454)

(assert (=> d!13447 (= lt!27638 (insertStrictlySorted!49 (toList!700 lt!27496) (_1!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13447 (= (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27640)))

(declare-fun b!64912 () Bool)

(declare-fun res!35332 () Bool)

(assert (=> b!64912 (=> (not res!35332) (not e!42533))))

(assert (=> b!64912 (= res!35332 (= (getValueByKey!126 (toList!700 lt!27640) (_1!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun b!64913 () Bool)

(declare-fun contains!698 (List!1454 tuple2!2060) Bool)

(assert (=> b!64913 (= e!42533 (contains!698 (toList!700 lt!27640) (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))))))

(assert (= (and d!13447 res!35331) b!64912))

(assert (= (and b!64912 res!35332) b!64913))

(declare-fun m!59199 () Bool)

(assert (=> d!13447 m!59199))

(declare-fun m!59201 () Bool)

(assert (=> d!13447 m!59201))

(declare-fun m!59203 () Bool)

(assert (=> d!13447 m!59203))

(declare-fun m!59205 () Bool)

(assert (=> d!13447 m!59205))

(declare-fun m!59207 () Bool)

(assert (=> b!64912 m!59207))

(declare-fun m!59209 () Bool)

(assert (=> b!64913 m!59209))

(assert (=> b!64678 d!13447))

(declare-fun d!13449 () Bool)

(declare-fun get!1104 (Option!132) V!2881)

(assert (=> d!13449 (= (apply!70 (+!85 lt!27493 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27502) (get!1104 (getValueByKey!126 (toList!700 (+!85 lt!27493 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27502)))))

(declare-fun bs!2807 () Bool)

(assert (= bs!2807 d!13449))

(declare-fun m!59211 () Bool)

(assert (=> bs!2807 m!59211))

(assert (=> bs!2807 m!59211))

(declare-fun m!59213 () Bool)

(assert (=> bs!2807 m!59213))

(assert (=> b!64678 d!13449))

(declare-fun d!13451 () Bool)

(assert (=> d!13451 (= (apply!70 lt!27493 lt!27502) (get!1104 (getValueByKey!126 (toList!700 lt!27493) lt!27502)))))

(declare-fun bs!2808 () Bool)

(assert (= bs!2808 d!13451))

(declare-fun m!59215 () Bool)

(assert (=> bs!2808 m!59215))

(assert (=> bs!2808 m!59215))

(declare-fun m!59217 () Bool)

(assert (=> bs!2808 m!59217))

(assert (=> b!64678 d!13451))

(declare-fun d!13453 () Bool)

(assert (=> d!13453 (= (apply!70 lt!27500 lt!27501) (get!1104 (getValueByKey!126 (toList!700 lt!27500) lt!27501)))))

(declare-fun bs!2809 () Bool)

(assert (= bs!2809 d!13453))

(declare-fun m!59219 () Bool)

(assert (=> bs!2809 m!59219))

(assert (=> bs!2809 m!59219))

(declare-fun m!59221 () Bool)

(assert (=> bs!2809 m!59221))

(assert (=> b!64678 d!13453))

(declare-fun d!13455 () Bool)

(assert (=> d!13455 (= (apply!70 (+!85 lt!27490 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27488) (get!1104 (getValueByKey!126 (toList!700 (+!85 lt!27490 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27488)))))

(declare-fun bs!2810 () Bool)

(assert (= bs!2810 d!13455))

(declare-fun m!59223 () Bool)

(assert (=> bs!2810 m!59223))

(assert (=> bs!2810 m!59223))

(declare-fun m!59225 () Bool)

(assert (=> bs!2810 m!59225))

(assert (=> b!64678 d!13455))

(declare-fun d!13457 () Bool)

(assert (=> d!13457 (contains!696 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27494)))

(declare-fun lt!27643 () Unit!1772)

(declare-fun choose!361 (ListLongMap!1369 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1772)

(assert (=> d!13457 (= lt!27643 (choose!361 lt!27496 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27494))))

(assert (=> d!13457 (contains!696 lt!27496 lt!27494)))

(assert (=> d!13457 (= (addStillContains!46 lt!27496 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27494) lt!27643)))

(declare-fun bs!2811 () Bool)

(assert (= bs!2811 d!13457))

(assert (=> bs!2811 m!59023))

(assert (=> bs!2811 m!59023))

(assert (=> bs!2811 m!59025))

(declare-fun m!59227 () Bool)

(assert (=> bs!2811 m!59227))

(declare-fun m!59229 () Bool)

(assert (=> bs!2811 m!59229))

(assert (=> b!64678 d!13457))

(declare-fun d!13459 () Bool)

(declare-fun e!42534 () Bool)

(assert (=> d!13459 e!42534))

(declare-fun res!35333 () Bool)

(assert (=> d!13459 (=> res!35333 e!42534)))

(declare-fun lt!27647 () Bool)

(assert (=> d!13459 (= res!35333 (not lt!27647))))

(declare-fun lt!27644 () Bool)

(assert (=> d!13459 (= lt!27647 lt!27644)))

(declare-fun lt!27646 () Unit!1772)

(declare-fun e!42535 () Unit!1772)

(assert (=> d!13459 (= lt!27646 e!42535)))

(declare-fun c!8897 () Bool)

(assert (=> d!13459 (= c!8897 lt!27644)))

(assert (=> d!13459 (= lt!27644 (containsKey!130 (toList!700 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27494))))

(assert (=> d!13459 (= (contains!696 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27494) lt!27647)))

(declare-fun b!64915 () Bool)

(declare-fun lt!27645 () Unit!1772)

(assert (=> b!64915 (= e!42535 lt!27645)))

(assert (=> b!64915 (= lt!27645 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27494))))

(assert (=> b!64915 (isDefined!80 (getValueByKey!126 (toList!700 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27494))))

(declare-fun b!64916 () Bool)

(declare-fun Unit!1780 () Unit!1772)

(assert (=> b!64916 (= e!42535 Unit!1780)))

(declare-fun b!64917 () Bool)

(assert (=> b!64917 (= e!42534 (isDefined!80 (getValueByKey!126 (toList!700 (+!85 lt!27496 (tuple2!2061 lt!27503 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27494)))))

(assert (= (and d!13459 c!8897) b!64915))

(assert (= (and d!13459 (not c!8897)) b!64916))

(assert (= (and d!13459 (not res!35333)) b!64917))

(declare-fun m!59231 () Bool)

(assert (=> d!13459 m!59231))

(declare-fun m!59233 () Bool)

(assert (=> b!64915 m!59233))

(declare-fun m!59235 () Bool)

(assert (=> b!64915 m!59235))

(assert (=> b!64915 m!59235))

(declare-fun m!59237 () Bool)

(assert (=> b!64915 m!59237))

(assert (=> b!64917 m!59235))

(assert (=> b!64917 m!59235))

(assert (=> b!64917 m!59237))

(assert (=> b!64678 d!13459))

(declare-fun d!13461 () Bool)

(assert (=> d!13461 (= (apply!70 (+!85 lt!27500 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27501) (apply!70 lt!27500 lt!27501))))

(declare-fun lt!27650 () Unit!1772)

(declare-fun choose!362 (ListLongMap!1369 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1772)

(assert (=> d!13461 (= lt!27650 (choose!362 lt!27500 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27501))))

(declare-fun e!42538 () Bool)

(assert (=> d!13461 e!42538))

(declare-fun res!35336 () Bool)

(assert (=> d!13461 (=> (not res!35336) (not e!42538))))

(assert (=> d!13461 (= res!35336 (contains!696 lt!27500 lt!27501))))

(assert (=> d!13461 (= (addApplyDifferent!46 lt!27500 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27501) lt!27650)))

(declare-fun b!64921 () Bool)

(assert (=> b!64921 (= e!42538 (not (= lt!27501 lt!27485)))))

(assert (= (and d!13461 res!35336) b!64921))

(declare-fun m!59239 () Bool)

(assert (=> d!13461 m!59239))

(assert (=> d!13461 m!59041))

(assert (=> d!13461 m!59037))

(assert (=> d!13461 m!59041))

(assert (=> d!13461 m!59049))

(declare-fun m!59241 () Bool)

(assert (=> d!13461 m!59241))

(assert (=> b!64678 d!13461))

(declare-fun d!13463 () Bool)

(assert (=> d!13463 (= (apply!70 (+!85 lt!27490 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27488) (apply!70 lt!27490 lt!27488))))

(declare-fun lt!27651 () Unit!1772)

(assert (=> d!13463 (= lt!27651 (choose!362 lt!27490 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27488))))

(declare-fun e!42539 () Bool)

(assert (=> d!13463 e!42539))

(declare-fun res!35337 () Bool)

(assert (=> d!13463 (=> (not res!35337) (not e!42539))))

(assert (=> d!13463 (= res!35337 (contains!696 lt!27490 lt!27488))))

(assert (=> d!13463 (= (addApplyDifferent!46 lt!27490 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27488) lt!27651)))

(declare-fun b!64922 () Bool)

(assert (=> b!64922 (= e!42539 (not (= lt!27488 lt!27484)))))

(assert (= (and d!13463 res!35337) b!64922))

(declare-fun m!59243 () Bool)

(assert (=> d!13463 m!59243))

(assert (=> d!13463 m!59031))

(assert (=> d!13463 m!59045))

(assert (=> d!13463 m!59031))

(assert (=> d!13463 m!59033))

(declare-fun m!59245 () Bool)

(assert (=> d!13463 m!59245))

(assert (=> b!64678 d!13463))

(declare-fun d!13465 () Bool)

(assert (=> d!13465 (= (apply!70 (+!85 lt!27493 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27502) (apply!70 lt!27493 lt!27502))))

(declare-fun lt!27652 () Unit!1772)

(assert (=> d!13465 (= lt!27652 (choose!362 lt!27493 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27502))))

(declare-fun e!42540 () Bool)

(assert (=> d!13465 e!42540))

(declare-fun res!35338 () Bool)

(assert (=> d!13465 (=> (not res!35338) (not e!42540))))

(assert (=> d!13465 (= res!35338 (contains!696 lt!27493 lt!27502))))

(assert (=> d!13465 (= (addApplyDifferent!46 lt!27493 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))) lt!27502) lt!27652)))

(declare-fun b!64923 () Bool)

(assert (=> b!64923 (= e!42540 (not (= lt!27502 lt!27497)))))

(assert (= (and d!13465 res!35338) b!64923))

(declare-fun m!59247 () Bool)

(assert (=> d!13465 m!59247))

(assert (=> d!13465 m!59035))

(assert (=> d!13465 m!59053))

(assert (=> d!13465 m!59035))

(assert (=> d!13465 m!59051))

(declare-fun m!59249 () Bool)

(assert (=> d!13465 m!59249))

(assert (=> b!64678 d!13465))

(declare-fun d!13467 () Bool)

(declare-fun e!42541 () Bool)

(assert (=> d!13467 e!42541))

(declare-fun res!35339 () Bool)

(assert (=> d!13467 (=> (not res!35339) (not e!42541))))

(declare-fun lt!27656 () ListLongMap!1369)

(assert (=> d!13467 (= res!35339 (contains!696 lt!27656 (_1!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun lt!27654 () List!1454)

(assert (=> d!13467 (= lt!27656 (ListLongMap!1370 lt!27654))))

(declare-fun lt!27653 () Unit!1772)

(declare-fun lt!27655 () Unit!1772)

(assert (=> d!13467 (= lt!27653 lt!27655)))

(assert (=> d!13467 (= (getValueByKey!126 lt!27654 (_1!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13467 (= lt!27655 (lemmaContainsTupThenGetReturnValue!46 lt!27654 (_1!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13467 (= lt!27654 (insertStrictlySorted!49 (toList!700 lt!27500) (_1!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13467 (= (+!85 lt!27500 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27656)))

(declare-fun b!64924 () Bool)

(declare-fun res!35340 () Bool)

(assert (=> b!64924 (=> (not res!35340) (not e!42541))))

(assert (=> b!64924 (= res!35340 (= (getValueByKey!126 (toList!700 lt!27656) (_1!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun b!64925 () Bool)

(assert (=> b!64925 (= e!42541 (contains!698 (toList!700 lt!27656) (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))

(assert (= (and d!13467 res!35339) b!64924))

(assert (= (and b!64924 res!35340) b!64925))

(declare-fun m!59251 () Bool)

(assert (=> d!13467 m!59251))

(declare-fun m!59253 () Bool)

(assert (=> d!13467 m!59253))

(declare-fun m!59255 () Bool)

(assert (=> d!13467 m!59255))

(declare-fun m!59257 () Bool)

(assert (=> d!13467 m!59257))

(declare-fun m!59259 () Bool)

(assert (=> b!64924 m!59259))

(declare-fun m!59261 () Bool)

(assert (=> b!64925 m!59261))

(assert (=> b!64678 d!13467))

(declare-fun d!13469 () Bool)

(assert (=> d!13469 (= (apply!70 (+!85 lt!27500 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27501) (get!1104 (getValueByKey!126 (toList!700 (+!85 lt!27500 (tuple2!2061 lt!27485 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27501)))))

(declare-fun bs!2812 () Bool)

(assert (= bs!2812 d!13469))

(declare-fun m!59263 () Bool)

(assert (=> bs!2812 m!59263))

(assert (=> bs!2812 m!59263))

(declare-fun m!59265 () Bool)

(assert (=> bs!2812 m!59265))

(assert (=> b!64678 d!13469))

(declare-fun d!13471 () Bool)

(assert (=> d!13471 (= (apply!70 lt!27490 lt!27488) (get!1104 (getValueByKey!126 (toList!700 lt!27490) lt!27488)))))

(declare-fun bs!2813 () Bool)

(assert (= bs!2813 d!13471))

(declare-fun m!59267 () Bool)

(assert (=> bs!2813 m!59267))

(assert (=> bs!2813 m!59267))

(declare-fun m!59269 () Bool)

(assert (=> bs!2813 m!59269))

(assert (=> b!64678 d!13471))

(declare-fun d!13473 () Bool)

(declare-fun e!42542 () Bool)

(assert (=> d!13473 e!42542))

(declare-fun res!35341 () Bool)

(assert (=> d!13473 (=> (not res!35341) (not e!42542))))

(declare-fun lt!27660 () ListLongMap!1369)

(assert (=> d!13473 (= res!35341 (contains!696 lt!27660 (_1!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun lt!27658 () List!1454)

(assert (=> d!13473 (= lt!27660 (ListLongMap!1370 lt!27658))))

(declare-fun lt!27657 () Unit!1772)

(declare-fun lt!27659 () Unit!1772)

(assert (=> d!13473 (= lt!27657 lt!27659)))

(assert (=> d!13473 (= (getValueByKey!126 lt!27658 (_1!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13473 (= lt!27659 (lemmaContainsTupThenGetReturnValue!46 lt!27658 (_1!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13473 (= lt!27658 (insertStrictlySorted!49 (toList!700 lt!27490) (_1!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13473 (= (+!85 lt!27490 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27660)))

(declare-fun b!64926 () Bool)

(declare-fun res!35342 () Bool)

(assert (=> b!64926 (=> (not res!35342) (not e!42542))))

(assert (=> b!64926 (= res!35342 (= (getValueByKey!126 (toList!700 lt!27660) (_1!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun b!64927 () Bool)

(assert (=> b!64927 (= e!42542 (contains!698 (toList!700 lt!27660) (tuple2!2061 lt!27484 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))

(assert (= (and d!13473 res!35341) b!64926))

(assert (= (and b!64926 res!35342) b!64927))

(declare-fun m!59271 () Bool)

(assert (=> d!13473 m!59271))

(declare-fun m!59273 () Bool)

(assert (=> d!13473 m!59273))

(declare-fun m!59275 () Bool)

(assert (=> d!13473 m!59275))

(declare-fun m!59277 () Bool)

(assert (=> d!13473 m!59277))

(declare-fun m!59279 () Bool)

(assert (=> b!64926 m!59279))

(declare-fun m!59281 () Bool)

(assert (=> b!64927 m!59281))

(assert (=> b!64678 d!13473))

(declare-fun d!13475 () Bool)

(declare-fun e!42543 () Bool)

(assert (=> d!13475 e!42543))

(declare-fun res!35343 () Bool)

(assert (=> d!13475 (=> (not res!35343) (not e!42543))))

(declare-fun lt!27664 () ListLongMap!1369)

(assert (=> d!13475 (= res!35343 (contains!696 lt!27664 (_1!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun lt!27662 () List!1454)

(assert (=> d!13475 (= lt!27664 (ListLongMap!1370 lt!27662))))

(declare-fun lt!27661 () Unit!1772)

(declare-fun lt!27663 () Unit!1772)

(assert (=> d!13475 (= lt!27661 lt!27663)))

(assert (=> d!13475 (= (getValueByKey!126 lt!27662 (_1!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13475 (= lt!27663 (lemmaContainsTupThenGetReturnValue!46 lt!27662 (_1!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13475 (= lt!27662 (insertStrictlySorted!49 (toList!700 lt!27493) (_1!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13475 (= (+!85 lt!27493 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27664)))

(declare-fun b!64928 () Bool)

(declare-fun res!35344 () Bool)

(assert (=> b!64928 (=> (not res!35344) (not e!42543))))

(assert (=> b!64928 (= res!35344 (= (getValueByKey!126 (toList!700 lt!27664) (_1!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun b!64929 () Bool)

(assert (=> b!64929 (= e!42543 (contains!698 (toList!700 lt!27664) (tuple2!2061 lt!27497 (zeroValue!2030 (v!2440 (underlying!235 thiss!992))))))))

(assert (= (and d!13475 res!35343) b!64928))

(assert (= (and b!64928 res!35344) b!64929))

(declare-fun m!59283 () Bool)

(assert (=> d!13475 m!59283))

(declare-fun m!59285 () Bool)

(assert (=> d!13475 m!59285))

(declare-fun m!59287 () Bool)

(assert (=> d!13475 m!59287))

(declare-fun m!59289 () Bool)

(assert (=> d!13475 m!59289))

(declare-fun m!59291 () Bool)

(assert (=> b!64928 m!59291))

(declare-fun m!59293 () Bool)

(assert (=> b!64929 m!59293))

(assert (=> b!64678 d!13475))

(declare-fun d!13477 () Bool)

(assert (=> d!13477 (= (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64829 d!13477))

(declare-fun b!64938 () Bool)

(declare-fun e!42548 () (_ BitVec 32))

(declare-fun call!5310 () (_ BitVec 32))

(assert (=> b!64938 (= e!42548 call!5310)))

(declare-fun b!64939 () Bool)

(declare-fun e!42549 () (_ BitVec 32))

(assert (=> b!64939 (= e!42549 #b00000000000000000000000000000000)))

(declare-fun bm!5307 () Bool)

(assert (=> bm!5307 (= call!5310 (arrayCountValidKeys!0 (_keys!3758 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun d!13479 () Bool)

(declare-fun lt!27667 () (_ BitVec 32))

(assert (=> d!13479 (and (bvsge lt!27667 #b00000000000000000000000000000000) (bvsle lt!27667 (bvsub (size!2033 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!13479 (= lt!27667 e!42549)))

(declare-fun c!8903 () Bool)

(assert (=> d!13479 (= c!8903 (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(assert (=> d!13479 (and (bvsle #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2033 (_keys!3758 newMap!16)) (size!2033 (_keys!3758 newMap!16))))))

(assert (=> d!13479 (= (arrayCountValidKeys!0 (_keys!3758 newMap!16) #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) lt!27667)))

(declare-fun b!64940 () Bool)

(assert (=> b!64940 (= e!42548 (bvadd #b00000000000000000000000000000001 call!5310))))

(declare-fun b!64941 () Bool)

(assert (=> b!64941 (= e!42549 e!42548)))

(declare-fun c!8902 () Bool)

(assert (=> b!64941 (= c!8902 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!13479 c!8903) b!64939))

(assert (= (and d!13479 (not c!8903)) b!64941))

(assert (= (and b!64941 c!8902) b!64940))

(assert (= (and b!64941 (not c!8902)) b!64938))

(assert (= (or b!64940 b!64938) bm!5307))

(declare-fun m!59295 () Bool)

(assert (=> bm!5307 m!59295))

(assert (=> b!64941 m!59171))

(assert (=> b!64941 m!59171))

(assert (=> b!64941 m!59173))

(assert (=> b!64685 d!13479))

(declare-fun b!64977 () Bool)

(declare-fun res!35368 () Bool)

(declare-fun e!42566 () Bool)

(assert (=> b!64977 (=> (not res!35368) (not e!42566))))

(declare-fun lt!27729 () SeekEntryResult!234)

(assert (=> b!64977 (= res!35368 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3063 lt!27729)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!27743 () SeekEntryResult!234)

(declare-fun e!42569 () Bool)

(declare-fun b!64978 () Bool)

(assert (=> b!64978 (= e!42569 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27743)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!64979 () Bool)

(declare-fun res!35363 () Bool)

(assert (=> b!64979 (=> (not res!35363) (not e!42566))))

(declare-fun call!5322 () Bool)

(assert (=> b!64979 (= res!35363 call!5322)))

(declare-fun e!42573 () Bool)

(assert (=> b!64979 (= e!42573 e!42566)))

(declare-fun bm!5316 () Bool)

(declare-fun call!5320 () Bool)

(assert (=> bm!5316 (= call!5320 (arrayContainsKey!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64980 () Bool)

(declare-fun e!42568 () Unit!1772)

(declare-fun Unit!1781 () Unit!1772)

(assert (=> b!64980 (= e!42568 Unit!1781)))

(declare-fun lt!27752 () Unit!1772)

(assert (=> b!64980 (= lt!27752 (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(declare-fun call!5319 () SeekEntryResult!234)

(assert (=> b!64980 (= lt!27743 call!5319)))

(declare-fun res!35370 () Bool)

(assert (=> b!64980 (= res!35370 ((_ is Found!234) lt!27743))))

(assert (=> b!64980 (=> (not res!35370) (not e!42569))))

(assert (=> b!64980 e!42569))

(declare-fun lt!27748 () Unit!1772)

(assert (=> b!64980 (= lt!27748 lt!27752)))

(assert (=> b!64980 false))

(declare-fun b!64981 () Bool)

(declare-fun e!42570 () Bool)

(assert (=> b!64981 (= e!42570 ((_ is Undefined!234) lt!27729))))

(declare-fun b!64982 () Bool)

(declare-fun e!42567 () Bool)

(assert (=> b!64982 (= e!42570 e!42567)))

(declare-fun res!35371 () Bool)

(assert (=> b!64982 (= res!35371 call!5322)))

(assert (=> b!64982 (=> (not res!35371) (not e!42567))))

(declare-fun bm!5317 () Bool)

(declare-fun call!5321 () Bool)

(assert (=> bm!5317 (= call!5322 call!5321)))

(declare-fun b!64983 () Bool)

(declare-fun c!8913 () Bool)

(assert (=> b!64983 (= c!8913 ((_ is MissingVacant!234) lt!27729))))

(assert (=> b!64983 (= e!42573 e!42570)))

(declare-fun c!8912 () Bool)

(declare-fun bm!5318 () Bool)

(declare-fun c!8915 () Bool)

(assert (=> bm!5318 (= call!5321 (inRange!0 (ite c!8915 (index!3064 lt!27743) (ite c!8912 (index!3063 lt!27729) (index!3066 lt!27729))) (mask!6042 newMap!16)))))

(declare-fun b!64984 () Bool)

(declare-fun e!42571 () Unit!1772)

(declare-fun Unit!1782 () Unit!1772)

(assert (=> b!64984 (= e!42571 Unit!1782)))

(declare-fun b!64976 () Bool)

(declare-fun res!35367 () Bool)

(declare-fun e!42572 () Bool)

(assert (=> b!64976 (=> (not res!35367) (not e!42572))))

(declare-fun lt!27754 () tuple2!2062)

(assert (=> b!64976 (= res!35367 (contains!696 (map!1120 (_2!1042 lt!27754)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun d!13481 () Bool)

(assert (=> d!13481 e!42572))

(declare-fun res!35365 () Bool)

(assert (=> d!13481 (=> (not res!35365) (not e!42572))))

(assert (=> d!13481 (= res!35365 (_1!1042 lt!27754))))

(assert (=> d!13481 (= lt!27754 (tuple2!2063 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (bvadd (_size!372 newMap!16) #b00000000000000000000000000000001) (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))) (_vacant!372 newMap!16))))))

(declare-fun lt!27731 () Unit!1772)

(declare-fun lt!27757 () Unit!1772)

(assert (=> d!13481 (= lt!27731 lt!27757)))

(declare-fun lt!27728 () array!3765)

(declare-fun lt!27735 () array!3767)

(assert (=> d!13481 (contains!696 (getCurrentListMap!396 lt!27728 lt!27735 (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593))))))

(assert (=> d!13481 (= lt!27757 (lemmaValidKeyInArrayIsInListMap!78 lt!27728 lt!27735 (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13481 (= lt!27735 (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))))))

(assert (=> d!13481 (= lt!27728 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun lt!27753 () Unit!1772)

(declare-fun lt!27747 () Unit!1772)

(assert (=> d!13481 (= lt!27753 lt!27747)))

(declare-fun lt!27737 () array!3765)

(assert (=> d!13481 (= (arrayCountValidKeys!0 lt!27737 (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (bvadd (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3765 (_ BitVec 32)) Unit!1772)

(assert (=> d!13481 (= lt!27747 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!27737 (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593))))))

(assert (=> d!13481 (= lt!27737 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun lt!27750 () Unit!1772)

(declare-fun lt!27746 () Unit!1772)

(assert (=> d!13481 (= lt!27750 lt!27746)))

(declare-fun lt!27738 () array!3765)

(assert (=> d!13481 (arrayContainsKey!0 lt!27738 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!13481 (= lt!27746 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!27738 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593))))))

(assert (=> d!13481 (= lt!27738 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun lt!27730 () Unit!1772)

(declare-fun lt!27732 () Unit!1772)

(assert (=> d!13481 (= lt!27730 lt!27732)))

(assert (=> d!13481 (= (+!85 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!9 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) (_ BitVec 64) V!2881 Int) Unit!1772)

(assert (=> d!13481 (= lt!27732 (lemmaAddValidKeyToArrayThenAddPairToListMap!9 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27733 () Unit!1772)

(declare-fun lt!27749 () Unit!1772)

(assert (=> d!13481 (= lt!27733 lt!27749)))

(assert (=> d!13481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))) (mask!6042 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3765 (_ BitVec 32) (_ BitVec 32)) Unit!1772)

(assert (=> d!13481 (= lt!27749 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (mask!6042 newMap!16)))))

(declare-fun lt!27742 () Unit!1772)

(declare-fun lt!27756 () Unit!1772)

(assert (=> d!13481 (= lt!27742 lt!27756)))

(assert (=> d!13481 (= (arrayCountValidKeys!0 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))) #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3758 newMap!16) #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3765 (_ BitVec 32) (_ BitVec 64)) Unit!1772)

(assert (=> d!13481 (= lt!27756 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3758 newMap!16) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun lt!27745 () Unit!1772)

(declare-fun lt!27740 () Unit!1772)

(assert (=> d!13481 (= lt!27745 lt!27740)))

(declare-fun lt!27734 () List!1453)

(declare-fun lt!27739 () (_ BitVec 32))

(assert (=> d!13481 (arrayNoDuplicates!0 (array!3766 (store (arr!1798 (_keys!3758 newMap!16)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (size!2033 (_keys!3758 newMap!16))) lt!27739 lt!27734)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3765 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1453) Unit!1772)

(assert (=> d!13481 (= lt!27740 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593)) lt!27739 lt!27734))))

(assert (=> d!13481 (= lt!27734 Nil!1450)))

(assert (=> d!13481 (= lt!27739 #b00000000000000000000000000000000)))

(declare-fun lt!27736 () Unit!1772)

(assert (=> d!13481 (= lt!27736 e!42571)))

(declare-fun c!8914 () Bool)

(assert (=> d!13481 (= c!8914 (arrayContainsKey!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!27751 () Unit!1772)

(assert (=> d!13481 (= lt!27751 e!42568)))

(assert (=> d!13481 (= c!8915 (contains!696 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13481 (valid!277 newMap!16)))

(assert (=> d!13481 (= (updateHelperNewKey!19 newMap!16 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8871 (index!3066 lt!27593) (index!3063 lt!27593))) lt!27754)))

(declare-fun b!64985 () Bool)

(assert (=> b!64985 (= e!42567 (not call!5320))))

(declare-fun b!64986 () Bool)

(assert (=> b!64986 (= e!42566 (not call!5320))))

(declare-fun b!64987 () Bool)

(assert (=> b!64987 (= e!42572 (= (map!1120 (_2!1042 lt!27754)) (+!85 (map!1120 newMap!16) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!5319 () Bool)

(assert (=> bm!5319 (= call!5319 (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(declare-fun b!64988 () Bool)

(declare-fun res!35366 () Bool)

(assert (=> b!64988 (=> (not res!35366) (not e!42572))))

(assert (=> b!64988 (= res!35366 (valid!277 (_2!1042 lt!27754)))))

(declare-fun b!64989 () Bool)

(declare-fun res!35364 () Bool)

(assert (=> b!64989 (= res!35364 call!5321)))

(assert (=> b!64989 (=> (not res!35364) (not e!42569))))

(declare-fun b!64990 () Bool)

(declare-fun Unit!1783 () Unit!1772)

(assert (=> b!64990 (= e!42571 Unit!1783)))

(declare-fun lt!27755 () Unit!1772)

(declare-fun lemmaArrayContainsKeyThenInListMap!9 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) (_ BitVec 32) Int) Unit!1772)

(assert (=> b!64990 (= lt!27755 (lemmaArrayContainsKeyThenInListMap!9 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(assert (=> b!64990 (contains!696 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))

(declare-fun lt!27744 () Unit!1772)

(assert (=> b!64990 (= lt!27744 lt!27755)))

(assert (=> b!64990 false))

(declare-fun b!64991 () Bool)

(declare-fun res!35369 () Bool)

(assert (=> b!64991 (= res!35369 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3066 lt!27729)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64991 (=> (not res!35369) (not e!42567))))

(declare-fun b!64992 () Bool)

(declare-fun lt!27741 () Unit!1772)

(assert (=> b!64992 (= e!42568 lt!27741)))

(assert (=> b!64992 (= lt!27741 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64992 (= lt!27729 call!5319)))

(assert (=> b!64992 (= c!8912 ((_ is MissingZero!234) lt!27729))))

(assert (=> b!64992 e!42573))

(assert (= (and d!13481 c!8915) b!64980))

(assert (= (and d!13481 (not c!8915)) b!64992))

(assert (= (and b!64980 res!35370) b!64989))

(assert (= (and b!64989 res!35364) b!64978))

(assert (= (and b!64992 c!8912) b!64979))

(assert (= (and b!64992 (not c!8912)) b!64983))

(assert (= (and b!64979 res!35363) b!64977))

(assert (= (and b!64977 res!35368) b!64986))

(assert (= (and b!64983 c!8913) b!64982))

(assert (= (and b!64983 (not c!8913)) b!64981))

(assert (= (and b!64982 res!35371) b!64991))

(assert (= (and b!64991 res!35369) b!64985))

(assert (= (or b!64979 b!64982) bm!5317))

(assert (= (or b!64986 b!64985) bm!5316))

(assert (= (or b!64989 bm!5317) bm!5318))

(assert (= (or b!64980 b!64992) bm!5319))

(assert (= (and d!13481 c!8914) b!64990))

(assert (= (and d!13481 (not c!8914)) b!64984))

(assert (= (and d!13481 res!35365) b!64988))

(assert (= (and b!64988 res!35366) b!64976))

(assert (= (and b!64976 res!35367) b!64987))

(declare-fun m!59297 () Bool)

(assert (=> b!64991 m!59297))

(declare-fun m!59299 () Bool)

(assert (=> b!64978 m!59299))

(declare-fun m!59301 () Bool)

(assert (=> b!64988 m!59301))

(declare-fun m!59303 () Bool)

(assert (=> bm!5318 m!59303))

(assert (=> d!13481 m!58861))

(declare-fun m!59305 () Bool)

(assert (=> d!13481 m!59305))

(assert (=> d!13481 m!58861))

(assert (=> d!13481 m!59107))

(declare-fun m!59307 () Bool)

(assert (=> d!13481 m!59307))

(declare-fun m!59309 () Bool)

(assert (=> d!13481 m!59309))

(declare-fun m!59311 () Bool)

(assert (=> d!13481 m!59311))

(declare-fun m!59313 () Bool)

(assert (=> d!13481 m!59313))

(assert (=> d!13481 m!58855))

(declare-fun m!59315 () Bool)

(assert (=> d!13481 m!59315))

(assert (=> d!13481 m!58861))

(assert (=> d!13481 m!58893))

(declare-fun m!59317 () Bool)

(assert (=> d!13481 m!59317))

(declare-fun m!59319 () Bool)

(assert (=> d!13481 m!59319))

(declare-fun m!59321 () Bool)

(assert (=> d!13481 m!59321))

(assert (=> d!13481 m!59011))

(assert (=> d!13481 m!58861))

(declare-fun m!59323 () Bool)

(assert (=> d!13481 m!59323))

(assert (=> d!13481 m!58861))

(declare-fun m!59325 () Bool)

(assert (=> d!13481 m!59325))

(declare-fun m!59327 () Bool)

(assert (=> d!13481 m!59327))

(assert (=> d!13481 m!59319))

(declare-fun m!59329 () Bool)

(assert (=> d!13481 m!59329))

(declare-fun m!59331 () Bool)

(assert (=> d!13481 m!59331))

(assert (=> d!13481 m!59327))

(declare-fun m!59333 () Bool)

(assert (=> d!13481 m!59333))

(assert (=> d!13481 m!58861))

(declare-fun m!59335 () Bool)

(assert (=> d!13481 m!59335))

(assert (=> d!13481 m!58861))

(declare-fun m!59337 () Bool)

(assert (=> d!13481 m!59337))

(assert (=> d!13481 m!59069))

(assert (=> d!13481 m!58861))

(declare-fun m!59339 () Bool)

(assert (=> d!13481 m!59339))

(assert (=> d!13481 m!59011))

(declare-fun m!59341 () Bool)

(assert (=> d!13481 m!59341))

(declare-fun m!59343 () Bool)

(assert (=> d!13481 m!59343))

(assert (=> d!13481 m!59011))

(declare-fun m!59345 () Bool)

(assert (=> b!64987 m!59345))

(assert (=> b!64987 m!58863))

(assert (=> b!64987 m!58863))

(declare-fun m!59347 () Bool)

(assert (=> b!64987 m!59347))

(assert (=> b!64980 m!58861))

(assert (=> b!64980 m!59083))

(assert (=> b!64976 m!59345))

(assert (=> b!64976 m!59345))

(assert (=> b!64976 m!58861))

(declare-fun m!59349 () Bool)

(assert (=> b!64976 m!59349))

(assert (=> b!64992 m!58861))

(assert (=> b!64992 m!59113))

(assert (=> bm!5319 m!58861))

(assert (=> bm!5319 m!59111))

(assert (=> b!64990 m!58861))

(declare-fun m!59351 () Bool)

(assert (=> b!64990 m!59351))

(assert (=> b!64990 m!59011))

(assert (=> b!64990 m!59011))

(assert (=> b!64990 m!58861))

(assert (=> b!64990 m!59323))

(assert (=> bm!5316 m!58861))

(assert (=> bm!5316 m!59107))

(declare-fun m!59353 () Bool)

(assert (=> b!64977 m!59353))

(assert (=> bm!5283 d!13481))

(assert (=> bm!5223 d!13445))

(declare-fun d!13483 () Bool)

(declare-fun e!42574 () Bool)

(assert (=> d!13483 e!42574))

(declare-fun res!35372 () Bool)

(assert (=> d!13483 (=> res!35372 e!42574)))

(declare-fun lt!27761 () Bool)

(assert (=> d!13483 (= res!35372 (not lt!27761))))

(declare-fun lt!27758 () Bool)

(assert (=> d!13483 (= lt!27761 lt!27758)))

(declare-fun lt!27760 () Unit!1772)

(declare-fun e!42575 () Unit!1772)

(assert (=> d!13483 (= lt!27760 e!42575)))

(declare-fun c!8916 () Bool)

(assert (=> d!13483 (= c!8916 lt!27758)))

(assert (=> d!13483 (= lt!27758 (containsKey!130 (toList!700 lt!27495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13483 (= (contains!696 lt!27495 #b1000000000000000000000000000000000000000000000000000000000000000) lt!27761)))

(declare-fun b!64993 () Bool)

(declare-fun lt!27759 () Unit!1772)

(assert (=> b!64993 (= e!42575 lt!27759)))

(assert (=> b!64993 (= lt!27759 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 lt!27495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64993 (isDefined!80 (getValueByKey!126 (toList!700 lt!27495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64994 () Bool)

(declare-fun Unit!1784 () Unit!1772)

(assert (=> b!64994 (= e!42575 Unit!1784)))

(declare-fun b!64995 () Bool)

(assert (=> b!64995 (= e!42574 (isDefined!80 (getValueByKey!126 (toList!700 lt!27495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13483 c!8916) b!64993))

(assert (= (and d!13483 (not c!8916)) b!64994))

(assert (= (and d!13483 (not res!35372)) b!64995))

(declare-fun m!59355 () Bool)

(assert (=> d!13483 m!59355))

(declare-fun m!59357 () Bool)

(assert (=> b!64993 m!59357))

(declare-fun m!59359 () Bool)

(assert (=> b!64993 m!59359))

(assert (=> b!64993 m!59359))

(declare-fun m!59361 () Bool)

(assert (=> b!64993 m!59361))

(assert (=> b!64995 m!59359))

(assert (=> b!64995 m!59359))

(assert (=> b!64995 m!59361))

(assert (=> bm!5218 d!13483))

(declare-fun d!13485 () Bool)

(declare-fun res!35373 () Bool)

(declare-fun e!42576 () Bool)

(assert (=> d!13485 (=> res!35373 e!42576)))

(assert (=> d!13485 (= res!35373 (= (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13485 (= (arrayContainsKey!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000) e!42576)))

(declare-fun b!64996 () Bool)

(declare-fun e!42577 () Bool)

(assert (=> b!64996 (= e!42576 e!42577)))

(declare-fun res!35374 () Bool)

(assert (=> b!64996 (=> (not res!35374) (not e!42577))))

(assert (=> b!64996 (= res!35374 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!64997 () Bool)

(assert (=> b!64997 (= e!42577 (arrayContainsKey!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13485 (not res!35373)) b!64996))

(assert (= (and b!64996 res!35374) b!64997))

(assert (=> d!13485 m!59171))

(assert (=> b!64997 m!58861))

(declare-fun m!59363 () Bool)

(assert (=> b!64997 m!59363))

(assert (=> bm!5273 d!13485))

(assert (=> b!64845 d!13477))

(declare-fun d!13487 () Bool)

(declare-fun e!42578 () Bool)

(assert (=> d!13487 e!42578))

(declare-fun res!35375 () Bool)

(assert (=> d!13487 (=> res!35375 e!42578)))

(declare-fun lt!27765 () Bool)

(assert (=> d!13487 (= res!35375 (not lt!27765))))

(declare-fun lt!27762 () Bool)

(assert (=> d!13487 (= lt!27765 lt!27762)))

(declare-fun lt!27764 () Unit!1772)

(declare-fun e!42579 () Unit!1772)

(assert (=> d!13487 (= lt!27764 e!42579)))

(declare-fun c!8917 () Bool)

(assert (=> d!13487 (= c!8917 lt!27762)))

(assert (=> d!13487 (= lt!27762 (containsKey!130 (toList!700 e!42456) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13487 (= (contains!696 e!42456 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) lt!27765)))

(declare-fun b!64998 () Bool)

(declare-fun lt!27763 () Unit!1772)

(assert (=> b!64998 (= e!42579 lt!27763)))

(assert (=> b!64998 (= lt!27763 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 e!42456) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> b!64998 (isDefined!80 (getValueByKey!126 (toList!700 e!42456) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!64999 () Bool)

(declare-fun Unit!1785 () Unit!1772)

(assert (=> b!64999 (= e!42579 Unit!1785)))

(declare-fun b!65000 () Bool)

(assert (=> b!65000 (= e!42578 (isDefined!80 (getValueByKey!126 (toList!700 e!42456) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(assert (= (and d!13487 c!8917) b!64998))

(assert (= (and d!13487 (not c!8917)) b!64999))

(assert (= (and d!13487 (not res!35375)) b!65000))

(assert (=> d!13487 m!58861))

(declare-fun m!59365 () Bool)

(assert (=> d!13487 m!59365))

(assert (=> b!64998 m!58861))

(declare-fun m!59367 () Bool)

(assert (=> b!64998 m!59367))

(assert (=> b!64998 m!58861))

(declare-fun m!59369 () Bool)

(assert (=> b!64998 m!59369))

(assert (=> b!64998 m!59369))

(declare-fun m!59371 () Bool)

(assert (=> b!64998 m!59371))

(assert (=> b!65000 m!58861))

(assert (=> b!65000 m!59369))

(assert (=> b!65000 m!59369))

(assert (=> b!65000 m!59371))

(assert (=> bm!5272 d!13487))

(declare-fun d!13489 () Bool)

(declare-fun lt!27768 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!70 (List!1453) (InoxSet (_ BitVec 64)))

(assert (=> d!13489 (= lt!27768 (select (content!70 Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun e!42585 () Bool)

(assert (=> d!13489 (= lt!27768 e!42585)))

(declare-fun res!35380 () Bool)

(assert (=> d!13489 (=> (not res!35380) (not e!42585))))

(assert (=> d!13489 (= res!35380 ((_ is Cons!1449) Nil!1450))))

(assert (=> d!13489 (= (contains!697 Nil!1450 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) lt!27768)))

(declare-fun b!65005 () Bool)

(declare-fun e!42584 () Bool)

(assert (=> b!65005 (= e!42585 e!42584)))

(declare-fun res!35381 () Bool)

(assert (=> b!65005 (=> res!35381 e!42584)))

(assert (=> b!65005 (= res!35381 (= (h!2033 Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!65006 () Bool)

(assert (=> b!65006 (= e!42584 (contains!697 (t!4874 Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (= (and d!13489 res!35380) b!65005))

(assert (= (and b!65005 (not res!35381)) b!65006))

(declare-fun m!59373 () Bool)

(assert (=> d!13489 m!59373))

(assert (=> d!13489 m!58861))

(declare-fun m!59375 () Bool)

(assert (=> d!13489 m!59375))

(assert (=> b!65006 m!58861))

(declare-fun m!59377 () Bool)

(assert (=> b!65006 m!59377))

(assert (=> b!64615 d!13489))

(declare-fun d!13491 () Bool)

(declare-fun res!35382 () Bool)

(declare-fun e!42586 () Bool)

(assert (=> d!13491 (=> res!35382 e!42586)))

(assert (=> d!13491 (= res!35382 (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13491 (= (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!42586)))

(declare-fun b!65007 () Bool)

(declare-fun e!42587 () Bool)

(assert (=> b!65007 (= e!42586 e!42587)))

(declare-fun res!35383 () Bool)

(assert (=> b!65007 (=> (not res!35383) (not e!42587))))

(assert (=> b!65007 (= res!35383 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!65008 () Bool)

(assert (=> b!65008 (= e!42587 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!13491 (not res!35382)) b!65007))

(assert (= (and b!65007 res!35383) b!65008))

(declare-fun m!59379 () Bool)

(assert (=> d!13491 m!59379))

(assert (=> b!65008 m!58861))

(declare-fun m!59381 () Bool)

(assert (=> b!65008 m!59381))

(assert (=> b!64594 d!13491))

(declare-fun d!13493 () Bool)

(declare-fun e!42588 () Bool)

(assert (=> d!13493 e!42588))

(declare-fun res!35384 () Bool)

(assert (=> d!13493 (=> res!35384 e!42588)))

(declare-fun lt!27772 () Bool)

(assert (=> d!13493 (= res!35384 (not lt!27772))))

(declare-fun lt!27769 () Bool)

(assert (=> d!13493 (= lt!27772 lt!27769)))

(declare-fun lt!27771 () Unit!1772)

(declare-fun e!42589 () Unit!1772)

(assert (=> d!13493 (= lt!27771 e!42589)))

(declare-fun c!8918 () Bool)

(assert (=> d!13493 (= c!8918 lt!27769)))

(assert (=> d!13493 (= lt!27769 (containsKey!130 (toList!700 call!5282) (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593))))))

(assert (=> d!13493 (= (contains!696 call!5282 (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593))) lt!27772)))

(declare-fun b!65009 () Bool)

(declare-fun lt!27770 () Unit!1772)

(assert (=> b!65009 (= e!42589 lt!27770)))

(assert (=> b!65009 (= lt!27770 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 call!5282) (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593))))))

(assert (=> b!65009 (isDefined!80 (getValueByKey!126 (toList!700 call!5282) (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593))))))

(declare-fun b!65010 () Bool)

(declare-fun Unit!1786 () Unit!1772)

(assert (=> b!65010 (= e!42589 Unit!1786)))

(declare-fun b!65011 () Bool)

(assert (=> b!65011 (= e!42588 (isDefined!80 (getValueByKey!126 (toList!700 call!5282) (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593)))))))

(assert (= (and d!13493 c!8918) b!65009))

(assert (= (and d!13493 (not c!8918)) b!65010))

(assert (= (and d!13493 (not res!35384)) b!65011))

(assert (=> d!13493 m!59095))

(declare-fun m!59383 () Bool)

(assert (=> d!13493 m!59383))

(assert (=> b!65009 m!59095))

(declare-fun m!59385 () Bool)

(assert (=> b!65009 m!59385))

(assert (=> b!65009 m!59095))

(declare-fun m!59387 () Bool)

(assert (=> b!65009 m!59387))

(assert (=> b!65009 m!59387))

(declare-fun m!59389 () Bool)

(assert (=> b!65009 m!59389))

(assert (=> b!65011 m!59095))

(assert (=> b!65011 m!59387))

(assert (=> b!65011 m!59387))

(assert (=> b!65011 m!59389))

(assert (=> b!64804 d!13493))

(declare-fun d!13495 () Bool)

(declare-fun e!42592 () Bool)

(assert (=> d!13495 e!42592))

(declare-fun res!35387 () Bool)

(assert (=> d!13495 (=> (not res!35387) (not e!42592))))

(assert (=> d!13495 (= res!35387 (and (bvsge (index!3064 lt!27593) #b00000000000000000000000000000000) (bvslt (index!3064 lt!27593) (size!2033 (_keys!3758 newMap!16)))))))

(declare-fun lt!27775 () Unit!1772)

(declare-fun choose!363 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) Unit!1772)

(assert (=> d!13495 (= lt!27775 (choose!363 (_keys!3758 newMap!16) lt!27581 (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3064 lt!27593) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13495 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13495 (= (lemmaValidKeyInArrayIsInListMap!78 (_keys!3758 newMap!16) lt!27581 (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3064 lt!27593) (defaultEntry!2121 newMap!16)) lt!27775)))

(declare-fun b!65014 () Bool)

(assert (=> b!65014 (= e!42592 (contains!696 (getCurrentListMap!396 (_keys!3758 newMap!16) lt!27581 (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27593))))))

(assert (= (and d!13495 res!35387) b!65014))

(declare-fun m!59391 () Bool)

(assert (=> d!13495 m!59391))

(declare-fun m!59393 () Bool)

(assert (=> d!13495 m!59393))

(declare-fun m!59395 () Bool)

(assert (=> b!65014 m!59395))

(assert (=> b!65014 m!59095))

(assert (=> b!65014 m!59395))

(assert (=> b!65014 m!59095))

(declare-fun m!59397 () Bool)

(assert (=> b!65014 m!59397))

(assert (=> b!64804 d!13495))

(declare-fun d!13497 () Bool)

(declare-fun e!42595 () Bool)

(assert (=> d!13497 e!42595))

(declare-fun res!35390 () Bool)

(assert (=> d!13497 (=> (not res!35390) (not e!42595))))

(assert (=> d!13497 (= res!35390 (and (bvsge (index!3064 lt!27593) #b00000000000000000000000000000000) (bvslt (index!3064 lt!27593) (size!2034 (_values!2104 newMap!16)))))))

(declare-fun lt!27778 () Unit!1772)

(declare-fun choose!364 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) (_ BitVec 64) V!2881 Int) Unit!1772)

(assert (=> d!13497 (= lt!27778 (choose!364 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3064 lt!27593) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13497 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13497 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3064 lt!27593) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)) lt!27778)))

(declare-fun b!65017 () Bool)

(assert (=> b!65017 (= e!42595 (= (+!85 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (_keys!3758 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16))))))

(assert (= (and d!13497 res!35390) b!65017))

(assert (=> d!13497 m!58861))

(assert (=> d!13497 m!58893))

(declare-fun m!59399 () Bool)

(assert (=> d!13497 m!59399))

(assert (=> d!13497 m!59393))

(assert (=> b!65017 m!59011))

(assert (=> b!65017 m!59011))

(assert (=> b!65017 m!59341))

(assert (=> b!65017 m!59103))

(declare-fun m!59401 () Bool)

(assert (=> b!65017 m!59401))

(assert (=> b!64804 d!13497))

(declare-fun d!13499 () Bool)

(declare-fun e!42598 () Bool)

(assert (=> d!13499 e!42598))

(declare-fun res!35395 () Bool)

(assert (=> d!13499 (=> (not res!35395) (not e!42598))))

(declare-fun lt!27784 () SeekEntryResult!234)

(assert (=> d!13499 (= res!35395 ((_ is Found!234) lt!27784))))

(assert (=> d!13499 (= lt!27784 (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(declare-fun lt!27783 () Unit!1772)

(declare-fun choose!365 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1772)

(assert (=> d!13499 (= lt!27783 (choose!365 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13499 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13499 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)) lt!27783)))

(declare-fun b!65022 () Bool)

(declare-fun res!35396 () Bool)

(assert (=> b!65022 (=> (not res!35396) (not e!42598))))

(assert (=> b!65022 (= res!35396 (inRange!0 (index!3064 lt!27784) (mask!6042 newMap!16)))))

(declare-fun b!65023 () Bool)

(assert (=> b!65023 (= e!42598 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27784)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> b!65023 (and (bvsge (index!3064 lt!27784) #b00000000000000000000000000000000) (bvslt (index!3064 lt!27784) (size!2033 (_keys!3758 newMap!16))))))

(assert (= (and d!13499 res!35395) b!65022))

(assert (= (and b!65022 res!35396) b!65023))

(assert (=> d!13499 m!58861))

(assert (=> d!13499 m!59111))

(assert (=> d!13499 m!58861))

(declare-fun m!59403 () Bool)

(assert (=> d!13499 m!59403))

(assert (=> d!13499 m!59393))

(declare-fun m!59405 () Bool)

(assert (=> b!65022 m!59405))

(declare-fun m!59407 () Bool)

(assert (=> b!65023 m!59407))

(assert (=> bm!5281 d!13499))

(declare-fun d!13501 () Bool)

(assert (=> d!13501 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 #b00000000000000000000000000000000)))

(declare-fun lt!27787 () Unit!1772)

(declare-fun choose!13 (array!3765 (_ BitVec 64) (_ BitVec 32)) Unit!1772)

(assert (=> d!13501 (= lt!27787 (choose!13 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 #b00000000000000000000000000000000))))

(assert (=> d!13501 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!13501 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 #b00000000000000000000000000000000) lt!27787)))

(declare-fun bs!2814 () Bool)

(assert (= bs!2814 d!13501))

(assert (=> bs!2814 m!59155))

(declare-fun m!59409 () Bool)

(assert (=> bs!2814 m!59409))

(assert (=> b!64843 d!13501))

(declare-fun d!13503 () Bool)

(declare-fun res!35397 () Bool)

(declare-fun e!42599 () Bool)

(assert (=> d!13503 (=> res!35397 e!42599)))

(assert (=> d!13503 (= res!35397 (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) lt!27606))))

(assert (=> d!13503 (= (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 #b00000000000000000000000000000000) e!42599)))

(declare-fun b!65024 () Bool)

(declare-fun e!42600 () Bool)

(assert (=> b!65024 (= e!42599 e!42600)))

(declare-fun res!35398 () Bool)

(assert (=> b!65024 (=> (not res!35398) (not e!42600))))

(assert (=> b!65024 (= res!35398 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(declare-fun b!65025 () Bool)

(assert (=> b!65025 (= e!42600 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27606 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13503 (not res!35397)) b!65024))

(assert (= (and b!65024 res!35398) b!65025))

(assert (=> d!13503 m!59141))

(declare-fun m!59411 () Bool)

(assert (=> b!65025 m!59411))

(assert (=> b!64843 d!13503))

(declare-fun b!65038 () Bool)

(declare-fun e!42609 () SeekEntryResult!234)

(assert (=> b!65038 (= e!42609 Undefined!234)))

(declare-fun b!65039 () Bool)

(declare-fun e!42607 () SeekEntryResult!234)

(declare-fun lt!27795 () SeekEntryResult!234)

(assert (=> b!65039 (= e!42607 (MissingZero!234 (index!3065 lt!27795)))))

(declare-fun b!65040 () Bool)

(declare-fun c!8926 () Bool)

(declare-fun lt!27796 () (_ BitVec 64))

(assert (=> b!65040 (= c!8926 (= lt!27796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42608 () SeekEntryResult!234)

(assert (=> b!65040 (= e!42608 e!42607)))

(declare-fun b!65041 () Bool)

(assert (=> b!65041 (= e!42608 (Found!234 (index!3065 lt!27795)))))

(declare-fun d!13505 () Bool)

(declare-fun lt!27794 () SeekEntryResult!234)

(assert (=> d!13505 (and (or ((_ is Undefined!234) lt!27794) (not ((_ is Found!234) lt!27794)) (and (bvsge (index!3064 lt!27794) #b00000000000000000000000000000000) (bvslt (index!3064 lt!27794) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))) (or ((_ is Undefined!234) lt!27794) ((_ is Found!234) lt!27794) (not ((_ is MissingZero!234) lt!27794)) (and (bvsge (index!3063 lt!27794) #b00000000000000000000000000000000) (bvslt (index!3063 lt!27794) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))) (or ((_ is Undefined!234) lt!27794) ((_ is Found!234) lt!27794) ((_ is MissingZero!234) lt!27794) (not ((_ is MissingVacant!234) lt!27794)) (and (bvsge (index!3066 lt!27794) #b00000000000000000000000000000000) (bvslt (index!3066 lt!27794) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))) (or ((_ is Undefined!234) lt!27794) (ite ((_ is Found!234) lt!27794) (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (index!3064 lt!27794)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!234) lt!27794) (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (index!3063 lt!27794)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!234) lt!27794) (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (index!3066 lt!27794)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13505 (= lt!27794 e!42609)))

(declare-fun c!8925 () Bool)

(assert (=> d!13505 (= c!8925 (and ((_ is Intermediate!234) lt!27795) (undefined!1046 lt!27795)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3765 (_ BitVec 32)) SeekEntryResult!234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!13505 (= lt!27795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) (mask!6042 (v!2440 (underlying!235 thiss!992)))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(assert (=> d!13505 (validMask!0 (mask!6042 (v!2440 (underlying!235 thiss!992))))))

(assert (=> d!13505 (= (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))) lt!27794)))

(declare-fun b!65042 () Bool)

(assert (=> b!65042 (= e!42609 e!42608)))

(assert (=> b!65042 (= lt!27796 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (index!3065 lt!27795)))))

(declare-fun c!8927 () Bool)

(assert (=> b!65042 (= c!8927 (= lt!27796 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65043 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3765 (_ BitVec 32)) SeekEntryResult!234)

(assert (=> b!65043 (= e!42607 (seekKeyOrZeroReturnVacant!0 (x!10544 lt!27795) (index!3065 lt!27795) (index!3065 lt!27795) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(assert (= (and d!13505 c!8925) b!65038))

(assert (= (and d!13505 (not c!8925)) b!65042))

(assert (= (and b!65042 c!8927) b!65041))

(assert (= (and b!65042 (not c!8927)) b!65040))

(assert (= (and b!65040 c!8926) b!65039))

(assert (= (and b!65040 (not c!8926)) b!65043))

(declare-fun m!59413 () Bool)

(assert (=> d!13505 m!59413))

(assert (=> d!13505 m!58851))

(assert (=> d!13505 m!59141))

(declare-fun m!59415 () Bool)

(assert (=> d!13505 m!59415))

(assert (=> d!13505 m!59415))

(assert (=> d!13505 m!59141))

(declare-fun m!59417 () Bool)

(assert (=> d!13505 m!59417))

(declare-fun m!59419 () Bool)

(assert (=> d!13505 m!59419))

(declare-fun m!59421 () Bool)

(assert (=> d!13505 m!59421))

(declare-fun m!59423 () Bool)

(assert (=> b!65042 m!59423))

(assert (=> b!65043 m!59141))

(declare-fun m!59425 () Bool)

(assert (=> b!65043 m!59425))

(assert (=> b!64843 d!13505))

(declare-fun d!13507 () Bool)

(assert (=> d!13507 (= (apply!70 lt!27495 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1104 (getValueByKey!126 (toList!700 lt!27495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2815 () Bool)

(assert (= bs!2815 d!13507))

(assert (=> bs!2815 m!59359))

(assert (=> bs!2815 m!59359))

(declare-fun m!59427 () Bool)

(assert (=> bs!2815 m!59427))

(assert (=> b!64658 d!13507))

(declare-fun d!13509 () Bool)

(assert (=> d!13509 (= (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (and (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64613 d!13509))

(declare-fun d!13511 () Bool)

(declare-fun isEmpty!309 (Option!132) Bool)

(assert (=> d!13511 (= (isDefined!80 (getValueByKey!126 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))) (not (isEmpty!309 (getValueByKey!126 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))))

(declare-fun bs!2816 () Bool)

(assert (= bs!2816 d!13511))

(assert (=> bs!2816 m!59079))

(declare-fun m!59429 () Bool)

(assert (=> bs!2816 m!59429))

(assert (=> b!64696 d!13511))

(declare-fun d!13513 () Bool)

(declare-fun c!8932 () Bool)

(assert (=> d!13513 (= c!8932 (and ((_ is Cons!1450) (toList!700 lt!27387)) (= (_1!1041 (h!2034 (toList!700 lt!27387))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(declare-fun e!42614 () Option!132)

(assert (=> d!13513 (= (getValueByKey!126 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) e!42614)))

(declare-fun b!65053 () Bool)

(declare-fun e!42615 () Option!132)

(assert (=> b!65053 (= e!42614 e!42615)))

(declare-fun c!8933 () Bool)

(assert (=> b!65053 (= c!8933 (and ((_ is Cons!1450) (toList!700 lt!27387)) (not (= (_1!1041 (h!2034 (toList!700 lt!27387))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))))

(declare-fun b!65055 () Bool)

(assert (=> b!65055 (= e!42615 None!130)))

(declare-fun b!65052 () Bool)

(assert (=> b!65052 (= e!42614 (Some!131 (_2!1041 (h!2034 (toList!700 lt!27387)))))))

(declare-fun b!65054 () Bool)

(assert (=> b!65054 (= e!42615 (getValueByKey!126 (t!4875 (toList!700 lt!27387)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (= (and d!13513 c!8932) b!65052))

(assert (= (and d!13513 (not c!8932)) b!65053))

(assert (= (and b!65053 c!8933) b!65054))

(assert (= (and b!65053 (not c!8933)) b!65055))

(assert (=> b!65054 m!58861))

(declare-fun m!59431 () Bool)

(assert (=> b!65054 m!59431))

(assert (=> b!64696 d!13513))

(assert (=> b!64611 d!13509))

(assert (=> d!13411 d!13427))

(declare-fun b!65056 () Bool)

(declare-fun e!42619 () Bool)

(declare-fun lt!27808 () ListLongMap!1369)

(assert (=> b!65056 (= e!42619 (= (apply!70 lt!27808 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2030 newMap!16)))))

(declare-fun call!5324 () ListLongMap!1369)

(declare-fun call!5325 () ListLongMap!1369)

(declare-fun call!5326 () ListLongMap!1369)

(declare-fun c!8939 () Bool)

(declare-fun call!5323 () ListLongMap!1369)

(declare-fun bm!5320 () Bool)

(declare-fun c!8934 () Bool)

(assert (=> bm!5320 (= call!5323 (+!85 (ite c!8934 call!5326 (ite c!8939 call!5324 call!5325)) (ite (or c!8934 c!8939) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 newMap!16)) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16)))))))

(declare-fun b!65057 () Bool)

(declare-fun e!42623 () Bool)

(declare-fun e!42625 () Bool)

(assert (=> b!65057 (= e!42623 e!42625)))

(declare-fun res!35406 () Bool)

(declare-fun call!5329 () Bool)

(assert (=> b!65057 (= res!35406 call!5329)))

(assert (=> b!65057 (=> (not res!35406) (not e!42625))))

(declare-fun d!13515 () Bool)

(declare-fun e!42624 () Bool)

(assert (=> d!13515 e!42624))

(declare-fun res!35399 () Bool)

(assert (=> d!13515 (=> (not res!35399) (not e!42624))))

(assert (=> d!13515 (= res!35399 (or (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))))

(declare-fun lt!27817 () ListLongMap!1369)

(assert (=> d!13515 (= lt!27808 lt!27817)))

(declare-fun lt!27811 () Unit!1772)

(declare-fun e!42628 () Unit!1772)

(assert (=> d!13515 (= lt!27811 e!42628)))

(declare-fun c!8936 () Bool)

(declare-fun e!42618 () Bool)

(assert (=> d!13515 (= c!8936 e!42618)))

(declare-fun res!35400 () Bool)

(assert (=> d!13515 (=> (not res!35400) (not e!42618))))

(assert (=> d!13515 (= res!35400 (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun e!42627 () ListLongMap!1369)

(assert (=> d!13515 (= lt!27817 e!42627)))

(assert (=> d!13515 (= c!8934 (and (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13515 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13515 (= (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) lt!27808)))

(declare-fun b!65058 () Bool)

(assert (=> b!65058 (= e!42625 (= (apply!70 lt!27808 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2030 newMap!16)))))

(declare-fun bm!5321 () Bool)

(declare-fun call!5328 () Bool)

(assert (=> bm!5321 (= call!5328 (contains!696 lt!27808 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5322 () Bool)

(assert (=> bm!5322 (= call!5324 call!5326)))

(declare-fun b!65059 () Bool)

(declare-fun c!8935 () Bool)

(assert (=> b!65059 (= c!8935 (and (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42621 () ListLongMap!1369)

(declare-fun e!42620 () ListLongMap!1369)

(assert (=> b!65059 (= e!42621 e!42620)))

(declare-fun bm!5323 () Bool)

(assert (=> bm!5323 (= call!5329 (contains!696 lt!27808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65060 () Bool)

(declare-fun e!42617 () Bool)

(assert (=> b!65060 (= e!42617 e!42619)))

(declare-fun res!35401 () Bool)

(assert (=> b!65060 (= res!35401 call!5328)))

(assert (=> b!65060 (=> (not res!35401) (not e!42619))))

(declare-fun b!65061 () Bool)

(declare-fun e!42622 () Bool)

(declare-fun e!42626 () Bool)

(assert (=> b!65061 (= e!42622 e!42626)))

(declare-fun res!35403 () Bool)

(assert (=> b!65061 (=> (not res!35403) (not e!42626))))

(assert (=> b!65061 (= res!35403 (contains!696 lt!27808 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65062 () Bool)

(declare-fun e!42616 () Bool)

(assert (=> b!65062 (= e!42616 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65063 () Bool)

(declare-fun call!5327 () ListLongMap!1369)

(assert (=> b!65063 (= e!42620 call!5327)))

(declare-fun b!65064 () Bool)

(assert (=> b!65064 (= e!42627 e!42621)))

(assert (=> b!65064 (= c!8939 (and (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65065 () Bool)

(assert (=> b!65065 (= e!42626 (= (apply!70 lt!27808 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)) (get!1101 (select (arr!1799 (_values!2104 newMap!16)) #b00000000000000000000000000000000) (dynLambda!314 (defaultEntry!2121 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2034 (_values!2104 newMap!16))))))

(assert (=> b!65065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65066 () Bool)

(assert (=> b!65066 (= e!42618 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5324 () Bool)

(assert (=> bm!5324 (= call!5327 call!5323)))

(declare-fun bm!5325 () Bool)

(assert (=> bm!5325 (= call!5325 call!5324)))

(declare-fun b!65067 () Bool)

(assert (=> b!65067 (= e!42617 (not call!5328))))

(declare-fun b!65068 () Bool)

(assert (=> b!65068 (= e!42621 call!5327)))

(declare-fun b!65069 () Bool)

(declare-fun res!35405 () Bool)

(assert (=> b!65069 (=> (not res!35405) (not e!42624))))

(assert (=> b!65069 (= res!35405 e!42623)))

(declare-fun c!8938 () Bool)

(assert (=> b!65069 (= c!8938 (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65070 () Bool)

(assert (=> b!65070 (= e!42624 e!42617)))

(declare-fun c!8937 () Bool)

(assert (=> b!65070 (= c!8937 (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65071 () Bool)

(declare-fun Unit!1787 () Unit!1772)

(assert (=> b!65071 (= e!42628 Unit!1787)))

(declare-fun b!65072 () Bool)

(assert (=> b!65072 (= e!42620 call!5325)))

(declare-fun b!65073 () Bool)

(assert (=> b!65073 (= e!42623 (not call!5329))))

(declare-fun b!65074 () Bool)

(assert (=> b!65074 (= e!42627 (+!85 call!5323 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16))))))

(declare-fun bm!5326 () Bool)

(assert (=> bm!5326 (= call!5326 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!65075 () Bool)

(declare-fun res!35404 () Bool)

(assert (=> b!65075 (=> (not res!35404) (not e!42624))))

(assert (=> b!65075 (= res!35404 e!42622)))

(declare-fun res!35402 () Bool)

(assert (=> b!65075 (=> res!35402 e!42622)))

(assert (=> b!65075 (= res!35402 (not e!42616))))

(declare-fun res!35407 () Bool)

(assert (=> b!65075 (=> (not res!35407) (not e!42616))))

(assert (=> b!65075 (= res!35407 (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65076 () Bool)

(declare-fun lt!27812 () Unit!1772)

(assert (=> b!65076 (= e!42628 lt!27812)))

(declare-fun lt!27809 () ListLongMap!1369)

(assert (=> b!65076 (= lt!27809 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27816 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27807 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27807 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27818 () Unit!1772)

(assert (=> b!65076 (= lt!27818 (addStillContains!46 lt!27809 lt!27816 (zeroValue!2030 newMap!16) lt!27807))))

(assert (=> b!65076 (contains!696 (+!85 lt!27809 (tuple2!2061 lt!27816 (zeroValue!2030 newMap!16))) lt!27807)))

(declare-fun lt!27805 () Unit!1772)

(assert (=> b!65076 (= lt!27805 lt!27818)))

(declare-fun lt!27813 () ListLongMap!1369)

(assert (=> b!65076 (= lt!27813 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27798 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27814 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27814 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27802 () Unit!1772)

(assert (=> b!65076 (= lt!27802 (addApplyDifferent!46 lt!27813 lt!27798 (minValue!2030 newMap!16) lt!27814))))

(assert (=> b!65076 (= (apply!70 (+!85 lt!27813 (tuple2!2061 lt!27798 (minValue!2030 newMap!16))) lt!27814) (apply!70 lt!27813 lt!27814))))

(declare-fun lt!27800 () Unit!1772)

(assert (=> b!65076 (= lt!27800 lt!27802)))

(declare-fun lt!27806 () ListLongMap!1369)

(assert (=> b!65076 (= lt!27806 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27810 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27815 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27815 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27799 () Unit!1772)

(assert (=> b!65076 (= lt!27799 (addApplyDifferent!46 lt!27806 lt!27810 (zeroValue!2030 newMap!16) lt!27815))))

(assert (=> b!65076 (= (apply!70 (+!85 lt!27806 (tuple2!2061 lt!27810 (zeroValue!2030 newMap!16))) lt!27815) (apply!70 lt!27806 lt!27815))))

(declare-fun lt!27804 () Unit!1772)

(assert (=> b!65076 (= lt!27804 lt!27799)))

(declare-fun lt!27803 () ListLongMap!1369)

(assert (=> b!65076 (= lt!27803 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27797 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27801 () (_ BitVec 64))

(assert (=> b!65076 (= lt!27801 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65076 (= lt!27812 (addApplyDifferent!46 lt!27803 lt!27797 (minValue!2030 newMap!16) lt!27801))))

(assert (=> b!65076 (= (apply!70 (+!85 lt!27803 (tuple2!2061 lt!27797 (minValue!2030 newMap!16))) lt!27801) (apply!70 lt!27803 lt!27801))))

(assert (= (and d!13515 c!8934) b!65074))

(assert (= (and d!13515 (not c!8934)) b!65064))

(assert (= (and b!65064 c!8939) b!65068))

(assert (= (and b!65064 (not c!8939)) b!65059))

(assert (= (and b!65059 c!8935) b!65063))

(assert (= (and b!65059 (not c!8935)) b!65072))

(assert (= (or b!65063 b!65072) bm!5325))

(assert (= (or b!65068 bm!5325) bm!5322))

(assert (= (or b!65068 b!65063) bm!5324))

(assert (= (or b!65074 bm!5322) bm!5326))

(assert (= (or b!65074 bm!5324) bm!5320))

(assert (= (and d!13515 res!35400) b!65066))

(assert (= (and d!13515 c!8936) b!65076))

(assert (= (and d!13515 (not c!8936)) b!65071))

(assert (= (and d!13515 res!35399) b!65075))

(assert (= (and b!65075 res!35407) b!65062))

(assert (= (and b!65075 (not res!35402)) b!65061))

(assert (= (and b!65061 res!35403) b!65065))

(assert (= (and b!65075 res!35404) b!65069))

(assert (= (and b!65069 c!8938) b!65057))

(assert (= (and b!65069 (not c!8938)) b!65073))

(assert (= (and b!65057 res!35406) b!65058))

(assert (= (or b!65057 b!65073) bm!5323))

(assert (= (and b!65069 res!35405) b!65070))

(assert (= (and b!65070 c!8937) b!65060))

(assert (= (and b!65070 (not c!8937)) b!65067))

(assert (= (and b!65060 res!35401) b!65056))

(assert (= (or b!65060 b!65067) bm!5321))

(declare-fun b_lambda!2903 () Bool)

(assert (=> (not b_lambda!2903) (not b!65065)))

(declare-fun tb!1409 () Bool)

(declare-fun t!4887 () Bool)

(assert (=> (and b!64437 (= (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) (defaultEntry!2121 newMap!16)) t!4887) tb!1409))

(declare-fun result!2507 () Bool)

(assert (=> tb!1409 (= result!2507 tp_is_empty!2425)))

(assert (=> b!65065 t!4887))

(declare-fun b_and!3973 () Bool)

(assert (= b_and!3969 (and (=> t!4887 result!2507) b_and!3973)))

(declare-fun t!4889 () Bool)

(declare-fun tb!1411 () Bool)

(assert (=> (and b!64440 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 newMap!16)) t!4889) tb!1411))

(declare-fun result!2509 () Bool)

(assert (= result!2509 result!2507))

(assert (=> b!65065 t!4889))

(declare-fun b_and!3975 () Bool)

(assert (= b_and!3971 (and (=> t!4889 result!2509) b_and!3975)))

(assert (=> b!65062 m!59171))

(assert (=> b!65062 m!59171))

(assert (=> b!65062 m!59173))

(assert (=> d!13515 m!59393))

(declare-fun m!59433 () Bool)

(assert (=> bm!5320 m!59433))

(declare-fun m!59435 () Bool)

(assert (=> b!65065 m!59435))

(declare-fun m!59437 () Bool)

(assert (=> b!65065 m!59437))

(assert (=> b!65065 m!59171))

(assert (=> b!65065 m!59171))

(declare-fun m!59439 () Bool)

(assert (=> b!65065 m!59439))

(assert (=> b!65065 m!59437))

(assert (=> b!65065 m!59435))

(declare-fun m!59441 () Bool)

(assert (=> b!65065 m!59441))

(declare-fun m!59443 () Bool)

(assert (=> b!65076 m!59443))

(assert (=> b!65076 m!59443))

(declare-fun m!59445 () Bool)

(assert (=> b!65076 m!59445))

(declare-fun m!59447 () Bool)

(assert (=> b!65076 m!59447))

(declare-fun m!59449 () Bool)

(assert (=> b!65076 m!59449))

(assert (=> b!65076 m!59171))

(declare-fun m!59451 () Bool)

(assert (=> b!65076 m!59451))

(declare-fun m!59453 () Bool)

(assert (=> b!65076 m!59453))

(declare-fun m!59455 () Bool)

(assert (=> b!65076 m!59455))

(declare-fun m!59457 () Bool)

(assert (=> b!65076 m!59457))

(declare-fun m!59459 () Bool)

(assert (=> b!65076 m!59459))

(declare-fun m!59461 () Bool)

(assert (=> b!65076 m!59461))

(declare-fun m!59463 () Bool)

(assert (=> b!65076 m!59463))

(declare-fun m!59465 () Bool)

(assert (=> b!65076 m!59465))

(declare-fun m!59467 () Bool)

(assert (=> b!65076 m!59467))

(assert (=> b!65076 m!59461))

(declare-fun m!59469 () Bool)

(assert (=> b!65076 m!59469))

(assert (=> b!65076 m!59451))

(assert (=> b!65076 m!59455))

(declare-fun m!59471 () Bool)

(assert (=> b!65076 m!59471))

(declare-fun m!59473 () Bool)

(assert (=> b!65076 m!59473))

(assert (=> b!65061 m!59171))

(assert (=> b!65061 m!59171))

(declare-fun m!59475 () Bool)

(assert (=> b!65061 m!59475))

(declare-fun m!59477 () Bool)

(assert (=> bm!5323 m!59477))

(declare-fun m!59479 () Bool)

(assert (=> bm!5321 m!59479))

(declare-fun m!59481 () Bool)

(assert (=> b!65058 m!59481))

(declare-fun m!59483 () Bool)

(assert (=> b!65074 m!59483))

(assert (=> bm!5326 m!59463))

(declare-fun m!59485 () Bool)

(assert (=> b!65056 m!59485))

(assert (=> b!65066 m!59171))

(assert (=> b!65066 m!59171))

(assert (=> b!65066 m!59173))

(assert (=> b!64815 d!13515))

(declare-fun d!13517 () Bool)

(assert (=> d!13517 (= (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64668 d!13517))

(declare-fun d!13519 () Bool)

(declare-fun e!42629 () Bool)

(assert (=> d!13519 e!42629))

(declare-fun res!35408 () Bool)

(assert (=> d!13519 (=> (not res!35408) (not e!42629))))

(declare-fun lt!27822 () ListLongMap!1369)

(assert (=> d!13519 (= res!35408 (contains!696 lt!27822 (_1!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!27820 () List!1454)

(assert (=> d!13519 (= lt!27822 (ListLongMap!1370 lt!27820))))

(declare-fun lt!27819 () Unit!1772)

(declare-fun lt!27821 () Unit!1772)

(assert (=> d!13519 (= lt!27819 lt!27821)))

(assert (=> d!13519 (= (getValueByKey!126 lt!27820 (_1!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!131 (_2!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13519 (= lt!27821 (lemmaContainsTupThenGetReturnValue!46 lt!27820 (_1!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13519 (= lt!27820 (insertStrictlySorted!49 (toList!700 call!5278) (_1!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13519 (= (+!85 call!5278 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!27822)))

(declare-fun b!65077 () Bool)

(declare-fun res!35409 () Bool)

(assert (=> b!65077 (=> (not res!35409) (not e!42629))))

(assert (=> b!65077 (= res!35409 (= (getValueByKey!126 (toList!700 lt!27822) (_1!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!131 (_2!1041 (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!65078 () Bool)

(assert (=> b!65078 (= e!42629 (contains!698 (toList!700 lt!27822) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!13519 res!35408) b!65077))

(assert (= (and b!65077 res!35409) b!65078))

(declare-fun m!59487 () Bool)

(assert (=> d!13519 m!59487))

(declare-fun m!59489 () Bool)

(assert (=> d!13519 m!59489))

(declare-fun m!59491 () Bool)

(assert (=> d!13519 m!59491))

(declare-fun m!59493 () Bool)

(assert (=> d!13519 m!59493))

(declare-fun m!59495 () Bool)

(assert (=> b!65077 m!59495))

(declare-fun m!59497 () Bool)

(assert (=> b!65078 m!59497))

(assert (=> b!64798 d!13519))

(declare-fun b!65079 () Bool)

(declare-fun e!42632 () SeekEntryResult!234)

(assert (=> b!65079 (= e!42632 Undefined!234)))

(declare-fun b!65080 () Bool)

(declare-fun e!42630 () SeekEntryResult!234)

(declare-fun lt!27824 () SeekEntryResult!234)

(assert (=> b!65080 (= e!42630 (MissingZero!234 (index!3065 lt!27824)))))

(declare-fun b!65081 () Bool)

(declare-fun c!8941 () Bool)

(declare-fun lt!27825 () (_ BitVec 64))

(assert (=> b!65081 (= c!8941 (= lt!27825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42631 () SeekEntryResult!234)

(assert (=> b!65081 (= e!42631 e!42630)))

(declare-fun b!65082 () Bool)

(assert (=> b!65082 (= e!42631 (Found!234 (index!3065 lt!27824)))))

(declare-fun lt!27823 () SeekEntryResult!234)

(declare-fun d!13521 () Bool)

(assert (=> d!13521 (and (or ((_ is Undefined!234) lt!27823) (not ((_ is Found!234) lt!27823)) (and (bvsge (index!3064 lt!27823) #b00000000000000000000000000000000) (bvslt (index!3064 lt!27823) (size!2033 (_keys!3758 newMap!16))))) (or ((_ is Undefined!234) lt!27823) ((_ is Found!234) lt!27823) (not ((_ is MissingZero!234) lt!27823)) (and (bvsge (index!3063 lt!27823) #b00000000000000000000000000000000) (bvslt (index!3063 lt!27823) (size!2033 (_keys!3758 newMap!16))))) (or ((_ is Undefined!234) lt!27823) ((_ is Found!234) lt!27823) ((_ is MissingZero!234) lt!27823) (not ((_ is MissingVacant!234) lt!27823)) (and (bvsge (index!3066 lt!27823) #b00000000000000000000000000000000) (bvslt (index!3066 lt!27823) (size!2033 (_keys!3758 newMap!16))))) (or ((_ is Undefined!234) lt!27823) (ite ((_ is Found!234) lt!27823) (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3064 lt!27823)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) (ite ((_ is MissingZero!234) lt!27823) (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3063 lt!27823)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!234) lt!27823) (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3066 lt!27823)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13521 (= lt!27823 e!42632)))

(declare-fun c!8940 () Bool)

(assert (=> d!13521 (= c!8940 (and ((_ is Intermediate!234) lt!27824) (undefined!1046 lt!27824)))))

(assert (=> d!13521 (= lt!27824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (mask!6042 newMap!16)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(assert (=> d!13521 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13521 (= (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)) lt!27823)))

(declare-fun b!65083 () Bool)

(assert (=> b!65083 (= e!42632 e!42631)))

(assert (=> b!65083 (= lt!27825 (select (arr!1798 (_keys!3758 newMap!16)) (index!3065 lt!27824)))))

(declare-fun c!8942 () Bool)

(assert (=> b!65083 (= c!8942 (= lt!27825 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!65084 () Bool)

(assert (=> b!65084 (= e!42630 (seekKeyOrZeroReturnVacant!0 (x!10544 lt!27824) (index!3065 lt!27824) (index!3065 lt!27824) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(assert (= (and d!13521 c!8940) b!65079))

(assert (= (and d!13521 (not c!8940)) b!65083))

(assert (= (and b!65083 c!8942) b!65082))

(assert (= (and b!65083 (not c!8942)) b!65081))

(assert (= (and b!65081 c!8941) b!65080))

(assert (= (and b!65081 (not c!8941)) b!65084))

(declare-fun m!59499 () Bool)

(assert (=> d!13521 m!59499))

(assert (=> d!13521 m!59393))

(assert (=> d!13521 m!58861))

(declare-fun m!59501 () Bool)

(assert (=> d!13521 m!59501))

(assert (=> d!13521 m!59501))

(assert (=> d!13521 m!58861))

(declare-fun m!59503 () Bool)

(assert (=> d!13521 m!59503))

(declare-fun m!59505 () Bool)

(assert (=> d!13521 m!59505))

(declare-fun m!59507 () Bool)

(assert (=> d!13521 m!59507))

(declare-fun m!59509 () Bool)

(assert (=> b!65083 m!59509))

(assert (=> b!65084 m!58861))

(declare-fun m!59511 () Bool)

(assert (=> b!65084 m!59511))

(assert (=> b!64811 d!13521))

(declare-fun d!13523 () Bool)

(assert (=> d!13523 (= (+!85 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) lt!27585 (zeroValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27828 () Unit!1772)

(declare-fun choose!366 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1772)

(assert (=> d!13523 (= lt!27828 (choose!366 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) lt!27585 (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13523 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13523 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) lt!27585 (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)) lt!27828)))

(declare-fun bs!2817 () Bool)

(assert (= bs!2817 d!13523))

(assert (=> bs!2817 m!58893))

(declare-fun m!59513 () Bool)

(assert (=> bs!2817 m!59513))

(assert (=> bs!2817 m!58893))

(declare-fun m!59515 () Bool)

(assert (=> bs!2817 m!59515))

(assert (=> bs!2817 m!59393))

(assert (=> bs!2817 m!59011))

(assert (=> bs!2817 m!59011))

(declare-fun m!59517 () Bool)

(assert (=> bs!2817 m!59517))

(assert (=> b!64785 d!13523))

(assert (=> b!64599 d!13403))

(declare-fun d!13525 () Bool)

(assert (=> d!13525 (= (get!1102 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2439 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> b!64827 d!13525))

(assert (=> b!64664 d!13517))

(assert (=> d!13409 d!13515))

(declare-fun d!13527 () Bool)

(declare-fun res!35410 () Bool)

(declare-fun e!42633 () Bool)

(assert (=> d!13527 (=> (not res!35410) (not e!42633))))

(assert (=> d!13527 (= res!35410 (simpleValid!46 (_2!1042 lt!27573)))))

(assert (=> d!13527 (= (valid!277 (_2!1042 lt!27573)) e!42633)))

(declare-fun b!65085 () Bool)

(declare-fun res!35411 () Bool)

(assert (=> b!65085 (=> (not res!35411) (not e!42633))))

(assert (=> b!65085 (= res!35411 (= (arrayCountValidKeys!0 (_keys!3758 (_2!1042 lt!27573)) #b00000000000000000000000000000000 (size!2033 (_keys!3758 (_2!1042 lt!27573)))) (_size!372 (_2!1042 lt!27573))))))

(declare-fun b!65086 () Bool)

(declare-fun res!35412 () Bool)

(assert (=> b!65086 (=> (not res!35412) (not e!42633))))

(assert (=> b!65086 (= res!35412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3758 (_2!1042 lt!27573)) (mask!6042 (_2!1042 lt!27573))))))

(declare-fun b!65087 () Bool)

(assert (=> b!65087 (= e!42633 (arrayNoDuplicates!0 (_keys!3758 (_2!1042 lt!27573)) #b00000000000000000000000000000000 Nil!1450))))

(assert (= (and d!13527 res!35410) b!65085))

(assert (= (and b!65085 res!35411) b!65086))

(assert (= (and b!65086 res!35412) b!65087))

(declare-fun m!59519 () Bool)

(assert (=> d!13527 m!59519))

(declare-fun m!59521 () Bool)

(assert (=> b!65085 m!59521))

(declare-fun m!59523 () Bool)

(assert (=> b!65086 m!59523))

(declare-fun m!59525 () Bool)

(assert (=> b!65087 m!59525))

(assert (=> d!13421 d!13527))

(assert (=> d!13421 d!13413))

(declare-fun d!13529 () Bool)

(declare-fun e!42634 () Bool)

(assert (=> d!13529 e!42634))

(declare-fun res!35413 () Bool)

(assert (=> d!13529 (=> res!35413 e!42634)))

(declare-fun lt!27832 () Bool)

(assert (=> d!13529 (= res!35413 (not lt!27832))))

(declare-fun lt!27829 () Bool)

(assert (=> d!13529 (= lt!27832 lt!27829)))

(declare-fun lt!27831 () Unit!1772)

(declare-fun e!42635 () Unit!1772)

(assert (=> d!13529 (= lt!27831 e!42635)))

(declare-fun c!8943 () Bool)

(assert (=> d!13529 (= c!8943 lt!27829)))

(assert (=> d!13529 (= lt!27829 (containsKey!130 (toList!700 lt!27495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13529 (= (contains!696 lt!27495 #b0000000000000000000000000000000000000000000000000000000000000000) lt!27832)))

(declare-fun b!65088 () Bool)

(declare-fun lt!27830 () Unit!1772)

(assert (=> b!65088 (= e!42635 lt!27830)))

(assert (=> b!65088 (= lt!27830 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 lt!27495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65088 (isDefined!80 (getValueByKey!126 (toList!700 lt!27495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65089 () Bool)

(declare-fun Unit!1788 () Unit!1772)

(assert (=> b!65089 (= e!42635 Unit!1788)))

(declare-fun b!65090 () Bool)

(assert (=> b!65090 (= e!42634 (isDefined!80 (getValueByKey!126 (toList!700 lt!27495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13529 c!8943) b!65088))

(assert (= (and d!13529 (not c!8943)) b!65089))

(assert (= (and d!13529 (not res!35413)) b!65090))

(declare-fun m!59527 () Bool)

(assert (=> d!13529 m!59527))

(declare-fun m!59529 () Bool)

(assert (=> b!65088 m!59529))

(declare-fun m!59531 () Bool)

(assert (=> b!65088 m!59531))

(assert (=> b!65088 m!59531))

(declare-fun m!59533 () Bool)

(assert (=> b!65088 m!59533))

(assert (=> b!65090 m!59531))

(assert (=> b!65090 m!59531))

(assert (=> b!65090 m!59533))

(assert (=> bm!5220 d!13529))

(assert (=> b!64794 d!13515))

(declare-fun d!13531 () Bool)

(declare-fun res!35418 () Bool)

(declare-fun e!42640 () Bool)

(assert (=> d!13531 (=> res!35418 e!42640)))

(assert (=> d!13531 (= res!35418 (and ((_ is Cons!1450) (toList!700 lt!27387)) (= (_1!1041 (h!2034 (toList!700 lt!27387))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(assert (=> d!13531 (= (containsKey!130 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) e!42640)))

(declare-fun b!65095 () Bool)

(declare-fun e!42641 () Bool)

(assert (=> b!65095 (= e!42640 e!42641)))

(declare-fun res!35419 () Bool)

(assert (=> b!65095 (=> (not res!35419) (not e!42641))))

(assert (=> b!65095 (= res!35419 (and (or (not ((_ is Cons!1450) (toList!700 lt!27387))) (bvsle (_1!1041 (h!2034 (toList!700 lt!27387))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))) ((_ is Cons!1450) (toList!700 lt!27387)) (bvslt (_1!1041 (h!2034 (toList!700 lt!27387))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(declare-fun b!65096 () Bool)

(assert (=> b!65096 (= e!42641 (containsKey!130 (t!4875 (toList!700 lt!27387)) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (= (and d!13531 (not res!35418)) b!65095))

(assert (= (and b!65095 res!35419) b!65096))

(assert (=> b!65096 m!58861))

(declare-fun m!59535 () Bool)

(assert (=> b!65096 m!59535))

(assert (=> d!13419 d!13531))

(declare-fun b!65097 () Bool)

(declare-fun e!42642 () Bool)

(declare-fun call!5330 () Bool)

(assert (=> b!65097 (= e!42642 call!5330)))

(declare-fun d!13533 () Bool)

(declare-fun res!35421 () Bool)

(declare-fun e!42644 () Bool)

(assert (=> d!13533 (=> res!35421 e!42644)))

(assert (=> d!13533 (= res!35421 (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(assert (=> d!13533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3758 newMap!16) (mask!6042 newMap!16)) e!42644)))

(declare-fun bm!5327 () Bool)

(assert (=> bm!5327 (= call!5330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(declare-fun b!65098 () Bool)

(declare-fun e!42643 () Bool)

(assert (=> b!65098 (= e!42642 e!42643)))

(declare-fun lt!27834 () (_ BitVec 64))

(assert (=> b!65098 (= lt!27834 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27835 () Unit!1772)

(assert (=> b!65098 (= lt!27835 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3758 newMap!16) lt!27834 #b00000000000000000000000000000000))))

(assert (=> b!65098 (arrayContainsKey!0 (_keys!3758 newMap!16) lt!27834 #b00000000000000000000000000000000)))

(declare-fun lt!27833 () Unit!1772)

(assert (=> b!65098 (= lt!27833 lt!27835)))

(declare-fun res!35420 () Bool)

(assert (=> b!65098 (= res!35420 (= (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000) (_keys!3758 newMap!16) (mask!6042 newMap!16)) (Found!234 #b00000000000000000000000000000000)))))

(assert (=> b!65098 (=> (not res!35420) (not e!42643))))

(declare-fun b!65099 () Bool)

(assert (=> b!65099 (= e!42643 call!5330)))

(declare-fun b!65100 () Bool)

(assert (=> b!65100 (= e!42644 e!42642)))

(declare-fun c!8944 () Bool)

(assert (=> b!65100 (= c!8944 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!13533 (not res!35421)) b!65100))

(assert (= (and b!65100 c!8944) b!65098))

(assert (= (and b!65100 (not c!8944)) b!65097))

(assert (= (and b!65098 res!35420) b!65099))

(assert (= (or b!65099 b!65097) bm!5327))

(declare-fun m!59537 () Bool)

(assert (=> bm!5327 m!59537))

(assert (=> b!65098 m!59171))

(declare-fun m!59539 () Bool)

(assert (=> b!65098 m!59539))

(declare-fun m!59541 () Bool)

(assert (=> b!65098 m!59541))

(assert (=> b!65098 m!59171))

(declare-fun m!59543 () Bool)

(assert (=> b!65098 m!59543))

(assert (=> b!65100 m!59171))

(assert (=> b!65100 m!59171))

(assert (=> b!65100 m!59173))

(assert (=> b!64686 d!13533))

(declare-fun b!65109 () Bool)

(declare-fun res!35432 () Bool)

(declare-fun e!42647 () Bool)

(assert (=> b!65109 (=> (not res!35432) (not e!42647))))

(assert (=> b!65109 (= res!35432 (and (= (size!2034 (_values!2104 newMap!16)) (bvadd (mask!6042 newMap!16) #b00000000000000000000000000000001)) (= (size!2033 (_keys!3758 newMap!16)) (size!2034 (_values!2104 newMap!16))) (bvsge (_size!372 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!372 newMap!16) (bvadd (mask!6042 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!65110 () Bool)

(declare-fun res!35430 () Bool)

(assert (=> b!65110 (=> (not res!35430) (not e!42647))))

(declare-fun size!2039 (LongMapFixedSize!646) (_ BitVec 32))

(assert (=> b!65110 (= res!35430 (bvsge (size!2039 newMap!16) (_size!372 newMap!16)))))

(declare-fun b!65112 () Bool)

(assert (=> b!65112 (= e!42647 (and (bvsge (extraKeys!1994 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1994 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!372 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!13535 () Bool)

(declare-fun res!35431 () Bool)

(assert (=> d!13535 (=> (not res!35431) (not e!42647))))

(assert (=> d!13535 (= res!35431 (validMask!0 (mask!6042 newMap!16)))))

(assert (=> d!13535 (= (simpleValid!46 newMap!16) e!42647)))

(declare-fun b!65111 () Bool)

(declare-fun res!35433 () Bool)

(assert (=> b!65111 (=> (not res!35433) (not e!42647))))

(assert (=> b!65111 (= res!35433 (= (size!2039 newMap!16) (bvadd (_size!372 newMap!16) (bvsdiv (bvadd (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!13535 res!35431) b!65109))

(assert (= (and b!65109 res!35432) b!65110))

(assert (= (and b!65110 res!35430) b!65111))

(assert (= (and b!65111 res!35433) b!65112))

(declare-fun m!59545 () Bool)

(assert (=> b!65110 m!59545))

(assert (=> d!13535 m!59393))

(assert (=> b!65111 m!59545))

(assert (=> d!13413 d!13535))

(declare-fun d!13537 () Bool)

(declare-fun res!35434 () Bool)

(declare-fun e!42648 () Bool)

(assert (=> d!13537 (=> (not res!35434) (not e!42648))))

(assert (=> d!13537 (= res!35434 (simpleValid!46 (v!2440 (underlying!235 thiss!992))))))

(assert (=> d!13537 (= (valid!277 (v!2440 (underlying!235 thiss!992))) e!42648)))

(declare-fun b!65113 () Bool)

(declare-fun res!35435 () Bool)

(assert (=> b!65113 (=> (not res!35435) (not e!42648))))

(assert (=> b!65113 (= res!35435 (= (arrayCountValidKeys!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))) (_size!372 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!65114 () Bool)

(declare-fun res!35436 () Bool)

(assert (=> b!65114 (=> (not res!35436) (not e!42648))))

(assert (=> b!65114 (= res!35436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!65115 () Bool)

(assert (=> b!65115 (= e!42648 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) #b00000000000000000000000000000000 Nil!1450))))

(assert (= (and d!13537 res!35434) b!65113))

(assert (= (and b!65113 res!35435) b!65114))

(assert (= (and b!65114 res!35436) b!65115))

(declare-fun m!59547 () Bool)

(assert (=> d!13537 m!59547))

(declare-fun m!59549 () Bool)

(assert (=> b!65113 m!59549))

(assert (=> b!65114 m!58885))

(assert (=> b!65115 m!58883))

(assert (=> d!13429 d!13537))

(declare-fun d!13539 () Bool)

(assert (=> d!13539 (= (+!85 (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) lt!27583 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27838 () Unit!1772)

(declare-fun choose!367 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1772)

(assert (=> d!13539 (= lt!27838 (choose!367 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) lt!27583 (zeroValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13539 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13539 (= (lemmaChangeZeroKeyThenAddPairToListMap!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) lt!27583 (zeroValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (defaultEntry!2121 newMap!16)) lt!27838)))

(declare-fun bs!2818 () Bool)

(assert (= bs!2818 d!13539))

(assert (=> bs!2818 m!58893))

(declare-fun m!59551 () Bool)

(assert (=> bs!2818 m!59551))

(assert (=> bs!2818 m!59011))

(declare-fun m!59553 () Bool)

(assert (=> bs!2818 m!59553))

(assert (=> bs!2818 m!58893))

(declare-fun m!59555 () Bool)

(assert (=> bs!2818 m!59555))

(assert (=> bs!2818 m!59393))

(assert (=> bs!2818 m!59011))

(assert (=> b!64807 d!13539))

(declare-fun d!13541 () Bool)

(assert (=> d!13541 (= (apply!70 lt!27495 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1104 (getValueByKey!126 (toList!700 lt!27495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2819 () Bool)

(assert (= bs!2819 d!13541))

(assert (=> bs!2819 m!59531))

(assert (=> bs!2819 m!59531))

(declare-fun m!59557 () Bool)

(assert (=> bs!2819 m!59557))

(assert (=> b!64660 d!13541))

(declare-fun d!13543 () Bool)

(declare-fun e!42649 () Bool)

(assert (=> d!13543 e!42649))

(declare-fun res!35437 () Bool)

(assert (=> d!13543 (=> (not res!35437) (not e!42649))))

(declare-fun lt!27842 () ListLongMap!1369)

(assert (=> d!13543 (= res!35437 (contains!696 lt!27842 (_1!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(declare-fun lt!27840 () List!1454)

(assert (=> d!13543 (= lt!27842 (ListLongMap!1370 lt!27840))))

(declare-fun lt!27839 () Unit!1772)

(declare-fun lt!27841 () Unit!1772)

(assert (=> d!13543 (= lt!27839 lt!27841)))

(assert (=> d!13543 (= (getValueByKey!126 lt!27840 (_1!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13543 (= lt!27841 (lemmaContainsTupThenGetReturnValue!46 lt!27840 (_1!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13543 (= lt!27840 (insertStrictlySorted!49 (toList!700 call!5220) (_1!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) (_2!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (=> d!13543 (= (+!85 call!5220 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))) lt!27842)))

(declare-fun b!65116 () Bool)

(declare-fun res!35438 () Bool)

(assert (=> b!65116 (=> (not res!35438) (not e!42649))))

(assert (=> b!65116 (= res!35438 (= (getValueByKey!126 (toList!700 lt!27842) (_1!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (Some!131 (_2!1041 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun b!65117 () Bool)

(assert (=> b!65117 (= e!42649 (contains!698 (toList!700 lt!27842) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))

(assert (= (and d!13543 res!35437) b!65116))

(assert (= (and b!65116 res!35438) b!65117))

(declare-fun m!59559 () Bool)

(assert (=> d!13543 m!59559))

(declare-fun m!59561 () Bool)

(assert (=> d!13543 m!59561))

(declare-fun m!59563 () Bool)

(assert (=> d!13543 m!59563))

(declare-fun m!59565 () Bool)

(assert (=> d!13543 m!59565))

(declare-fun m!59567 () Bool)

(assert (=> b!65116 m!59567))

(declare-fun m!59569 () Bool)

(assert (=> b!65117 m!59569))

(assert (=> b!64676 d!13543))

(declare-fun d!13545 () Bool)

(declare-fun e!42650 () Bool)

(assert (=> d!13545 e!42650))

(declare-fun res!35439 () Bool)

(assert (=> d!13545 (=> (not res!35439) (not e!42650))))

(declare-fun lt!27846 () ListLongMap!1369)

(assert (=> d!13545 (= res!35439 (contains!696 lt!27846 (_1!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(declare-fun lt!27844 () List!1454)

(assert (=> d!13545 (= lt!27846 (ListLongMap!1370 lt!27844))))

(declare-fun lt!27843 () Unit!1772)

(declare-fun lt!27845 () Unit!1772)

(assert (=> d!13545 (= lt!27843 lt!27845)))

(assert (=> d!13545 (= (getValueByKey!126 lt!27844 (_1!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))) (Some!131 (_2!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(assert (=> d!13545 (= lt!27845 (lemmaContainsTupThenGetReturnValue!46 lt!27844 (_1!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (_2!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(assert (=> d!13545 (= lt!27844 (insertStrictlySorted!49 (toList!700 (ite c!8822 call!5223 (ite c!8827 call!5221 call!5222))) (_1!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) (_2!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))))))

(assert (=> d!13545 (= (+!85 (ite c!8822 call!5223 (ite c!8827 call!5221 call!5222)) (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))) lt!27846)))

(declare-fun b!65118 () Bool)

(declare-fun res!35440 () Bool)

(assert (=> b!65118 (=> (not res!35440) (not e!42650))))

(assert (=> b!65118 (= res!35440 (= (getValueByKey!126 (toList!700 lt!27846) (_1!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992))))))) (Some!131 (_2!1041 (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))))

(declare-fun b!65119 () Bool)

(assert (=> b!65119 (= e!42650 (contains!698 (toList!700 lt!27846) (ite (or c!8822 c!8827) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2440 (underlying!235 thiss!992)))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2440 (underlying!235 thiss!992)))))))))

(assert (= (and d!13545 res!35439) b!65118))

(assert (= (and b!65118 res!35440) b!65119))

(declare-fun m!59571 () Bool)

(assert (=> d!13545 m!59571))

(declare-fun m!59573 () Bool)

(assert (=> d!13545 m!59573))

(declare-fun m!59575 () Bool)

(assert (=> d!13545 m!59575))

(declare-fun m!59577 () Bool)

(assert (=> d!13545 m!59577))

(declare-fun m!59579 () Bool)

(assert (=> b!65118 m!59579))

(declare-fun m!59581 () Bool)

(assert (=> b!65119 m!59581))

(assert (=> bm!5217 d!13545))

(declare-fun b!65120 () Bool)

(declare-fun e!42651 () Bool)

(declare-fun call!5331 () Bool)

(assert (=> b!65120 (= e!42651 call!5331)))

(declare-fun d!13547 () Bool)

(declare-fun res!35442 () Bool)

(declare-fun e!42653 () Bool)

(assert (=> d!13547 (=> res!35442 e!42653)))

(assert (=> d!13547 (= res!35442 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13547 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))) e!42653)))

(declare-fun bm!5328 () Bool)

(assert (=> bm!5328 (= call!5331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))))))

(declare-fun b!65121 () Bool)

(declare-fun e!42652 () Bool)

(assert (=> b!65121 (= e!42651 e!42652)))

(declare-fun lt!27848 () (_ BitVec 64))

(assert (=> b!65121 (= lt!27848 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!27849 () Unit!1772)

(assert (=> b!65121 (= lt!27849 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27848 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!65121 (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) lt!27848 #b00000000000000000000000000000000)))

(declare-fun lt!27847 () Unit!1772)

(assert (=> b!65121 (= lt!27847 lt!27849)))

(declare-fun res!35441 () Bool)

(assert (=> b!65121 (= res!35441 (= (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3758 (v!2440 (underlying!235 thiss!992))) (mask!6042 (v!2440 (underlying!235 thiss!992)))) (Found!234 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!65121 (=> (not res!35441) (not e!42652))))

(declare-fun b!65122 () Bool)

(assert (=> b!65122 (= e!42652 call!5331)))

(declare-fun b!65123 () Bool)

(assert (=> b!65123 (= e!42653 e!42651)))

(declare-fun c!8945 () Bool)

(assert (=> b!65123 (= c!8945 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!13547 (not res!35442)) b!65123))

(assert (= (and b!65123 c!8945) b!65121))

(assert (= (and b!65123 (not c!8945)) b!65120))

(assert (= (and b!65121 res!35441) b!65122))

(assert (= (or b!65122 b!65120) bm!5328))

(declare-fun m!59583 () Bool)

(assert (=> bm!5328 m!59583))

(assert (=> b!65121 m!59163))

(declare-fun m!59585 () Bool)

(assert (=> b!65121 m!59585))

(declare-fun m!59587 () Bool)

(assert (=> b!65121 m!59587))

(assert (=> b!65121 m!59163))

(declare-fun m!59589 () Bool)

(assert (=> b!65121 m!59589))

(assert (=> b!65123 m!59163))

(assert (=> b!65123 m!59163))

(assert (=> b!65123 m!59165))

(assert (=> bm!5299 d!13547))

(declare-fun lt!27861 () ListLongMap!1369)

(declare-fun e!42657 () Bool)

(declare-fun b!65124 () Bool)

(assert (=> b!65124 (= e!42657 (= (apply!70 lt!27861 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16))))))

(declare-fun call!5333 () ListLongMap!1369)

(declare-fun c!8951 () Bool)

(declare-fun call!5334 () ListLongMap!1369)

(declare-fun c!8946 () Bool)

(declare-fun call!5335 () ListLongMap!1369)

(declare-fun call!5332 () ListLongMap!1369)

(declare-fun bm!5329 () Bool)

(assert (=> bm!5329 (= call!5332 (+!85 (ite c!8946 call!5335 (ite c!8951 call!5333 call!5334)) (ite (or c!8946 c!8951) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 newMap!16)) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16))))))))

(declare-fun b!65125 () Bool)

(declare-fun e!42661 () Bool)

(declare-fun e!42663 () Bool)

(assert (=> b!65125 (= e!42661 e!42663)))

(declare-fun res!35450 () Bool)

(declare-fun call!5338 () Bool)

(assert (=> b!65125 (= res!35450 call!5338)))

(assert (=> b!65125 (=> (not res!35450) (not e!42663))))

(declare-fun d!13549 () Bool)

(declare-fun e!42662 () Bool)

(assert (=> d!13549 e!42662))

(declare-fun res!35443 () Bool)

(assert (=> d!13549 (=> (not res!35443) (not e!42662))))

(assert (=> d!13549 (= res!35443 (or (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))))

(declare-fun lt!27870 () ListLongMap!1369)

(assert (=> d!13549 (= lt!27861 lt!27870)))

(declare-fun lt!27864 () Unit!1772)

(declare-fun e!42666 () Unit!1772)

(assert (=> d!13549 (= lt!27864 e!42666)))

(declare-fun c!8948 () Bool)

(declare-fun e!42656 () Bool)

(assert (=> d!13549 (= c!8948 e!42656)))

(declare-fun res!35444 () Bool)

(assert (=> d!13549 (=> (not res!35444) (not e!42656))))

(assert (=> d!13549 (= res!35444 (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun e!42665 () ListLongMap!1369)

(assert (=> d!13549 (= lt!27870 e!42665)))

(assert (=> d!13549 (= c!8946 (and (not (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13549 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13549 (= (getCurrentListMap!396 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) lt!27861)))

(declare-fun b!65126 () Bool)

(assert (=> b!65126 (= e!42663 (= (apply!70 lt!27861 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2030 newMap!16)))))

(declare-fun bm!5330 () Bool)

(declare-fun call!5337 () Bool)

(assert (=> bm!5330 (= call!5337 (contains!696 lt!27861 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5331 () Bool)

(assert (=> bm!5331 (= call!5333 call!5335)))

(declare-fun c!8947 () Bool)

(declare-fun b!65127 () Bool)

(assert (=> b!65127 (= c!8947 (and (not (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42659 () ListLongMap!1369)

(declare-fun e!42658 () ListLongMap!1369)

(assert (=> b!65127 (= e!42659 e!42658)))

(declare-fun bm!5332 () Bool)

(assert (=> bm!5332 (= call!5338 (contains!696 lt!27861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65128 () Bool)

(declare-fun e!42655 () Bool)

(assert (=> b!65128 (= e!42655 e!42657)))

(declare-fun res!35445 () Bool)

(assert (=> b!65128 (= res!35445 call!5337)))

(assert (=> b!65128 (=> (not res!35445) (not e!42657))))

(declare-fun b!65129 () Bool)

(declare-fun e!42660 () Bool)

(declare-fun e!42664 () Bool)

(assert (=> b!65129 (= e!42660 e!42664)))

(declare-fun res!35447 () Bool)

(assert (=> b!65129 (=> (not res!35447) (not e!42664))))

(assert (=> b!65129 (= res!35447 (contains!696 lt!27861 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65130 () Bool)

(declare-fun e!42654 () Bool)

(assert (=> b!65130 (= e!42654 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65131 () Bool)

(declare-fun call!5336 () ListLongMap!1369)

(assert (=> b!65131 (= e!42658 call!5336)))

(declare-fun b!65132 () Bool)

(assert (=> b!65132 (= e!42665 e!42659)))

(assert (=> b!65132 (= c!8951 (and (not (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65133 () Bool)

(assert (=> b!65133 (= e!42664 (= (apply!70 lt!27861 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)) (get!1101 (select (arr!1799 (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!314 (defaultEntry!2121 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2034 (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))))))))

(assert (=> b!65133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65134 () Bool)

(assert (=> b!65134 (= e!42656 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5333 () Bool)

(assert (=> bm!5333 (= call!5336 call!5332)))

(declare-fun bm!5334 () Bool)

(assert (=> bm!5334 (= call!5334 call!5333)))

(declare-fun b!65135 () Bool)

(assert (=> b!65135 (= e!42655 (not call!5337))))

(declare-fun b!65136 () Bool)

(assert (=> b!65136 (= e!42659 call!5336)))

(declare-fun b!65137 () Bool)

(declare-fun res!35449 () Bool)

(assert (=> b!65137 (=> (not res!35449) (not e!42662))))

(assert (=> b!65137 (= res!35449 e!42661)))

(declare-fun c!8950 () Bool)

(assert (=> b!65137 (= c!8950 (not (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65138 () Bool)

(assert (=> b!65138 (= e!42662 e!42655)))

(declare-fun c!8949 () Bool)

(assert (=> b!65138 (= c!8949 (not (= (bvand (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65139 () Bool)

(declare-fun Unit!1789 () Unit!1772)

(assert (=> b!65139 (= e!42666 Unit!1789)))

(declare-fun b!65140 () Bool)

(assert (=> b!65140 (= e!42658 call!5334)))

(declare-fun b!65141 () Bool)

(assert (=> b!65141 (= e!42661 (not call!5338))))

(declare-fun b!65142 () Bool)

(assert (=> b!65142 (= e!42665 (+!85 call!5332 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)))))))

(declare-fun bm!5335 () Bool)

(assert (=> bm!5335 (= call!5335 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!65143 () Bool)

(declare-fun res!35448 () Bool)

(assert (=> b!65143 (=> (not res!35448) (not e!42662))))

(assert (=> b!65143 (= res!35448 e!42660)))

(declare-fun res!35446 () Bool)

(assert (=> b!65143 (=> res!35446 e!42660)))

(assert (=> b!65143 (= res!35446 (not e!42654))))

(declare-fun res!35451 () Bool)

(assert (=> b!65143 (=> (not res!35451) (not e!42654))))

(assert (=> b!65143 (= res!35451 (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65144 () Bool)

(declare-fun lt!27865 () Unit!1772)

(assert (=> b!65144 (= e!42666 lt!27865)))

(declare-fun lt!27862 () ListLongMap!1369)

(assert (=> b!65144 (= lt!27862 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27869 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27860 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27860 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27871 () Unit!1772)

(assert (=> b!65144 (= lt!27871 (addStillContains!46 lt!27862 lt!27869 (zeroValue!2030 newMap!16) lt!27860))))

(assert (=> b!65144 (contains!696 (+!85 lt!27862 (tuple2!2061 lt!27869 (zeroValue!2030 newMap!16))) lt!27860)))

(declare-fun lt!27858 () Unit!1772)

(assert (=> b!65144 (= lt!27858 lt!27871)))

(declare-fun lt!27866 () ListLongMap!1369)

(assert (=> b!65144 (= lt!27866 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27851 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27851 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27867 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27867 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27855 () Unit!1772)

(assert (=> b!65144 (= lt!27855 (addApplyDifferent!46 lt!27866 lt!27851 (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) lt!27867))))

(assert (=> b!65144 (= (apply!70 (+!85 lt!27866 (tuple2!2061 lt!27851 (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)))) lt!27867) (apply!70 lt!27866 lt!27867))))

(declare-fun lt!27853 () Unit!1772)

(assert (=> b!65144 (= lt!27853 lt!27855)))

(declare-fun lt!27859 () ListLongMap!1369)

(assert (=> b!65144 (= lt!27859 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27863 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27868 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27868 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27852 () Unit!1772)

(assert (=> b!65144 (= lt!27852 (addApplyDifferent!46 lt!27859 lt!27863 (zeroValue!2030 newMap!16) lt!27868))))

(assert (=> b!65144 (= (apply!70 (+!85 lt!27859 (tuple2!2061 lt!27863 (zeroValue!2030 newMap!16))) lt!27868) (apply!70 lt!27859 lt!27868))))

(declare-fun lt!27857 () Unit!1772)

(assert (=> b!65144 (= lt!27857 lt!27852)))

(declare-fun lt!27856 () ListLongMap!1369)

(assert (=> b!65144 (= lt!27856 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite c!8868 (_values!2104 newMap!16) (array!3768 (store (arr!1799 (_values!2104 newMap!16)) (index!3064 lt!27593) (ValueCellFull!869 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2034 (_values!2104 newMap!16)))) (mask!6042 newMap!16) (ite c!8868 (ite c!8866 (extraKeys!1994 newMap!16) lt!27585) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27850 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27850 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27854 () (_ BitVec 64))

(assert (=> b!65144 (= lt!27854 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65144 (= lt!27865 (addApplyDifferent!46 lt!27856 lt!27850 (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) lt!27854))))

(assert (=> b!65144 (= (apply!70 (+!85 lt!27856 (tuple2!2061 lt!27850 (ite c!8868 (ite c!8866 (minValue!2030 newMap!16) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)))) lt!27854) (apply!70 lt!27856 lt!27854))))

(assert (= (and d!13549 c!8946) b!65142))

(assert (= (and d!13549 (not c!8946)) b!65132))

(assert (= (and b!65132 c!8951) b!65136))

(assert (= (and b!65132 (not c!8951)) b!65127))

(assert (= (and b!65127 c!8947) b!65131))

(assert (= (and b!65127 (not c!8947)) b!65140))

(assert (= (or b!65131 b!65140) bm!5334))

(assert (= (or b!65136 bm!5334) bm!5331))

(assert (= (or b!65136 b!65131) bm!5333))

(assert (= (or b!65142 bm!5331) bm!5335))

(assert (= (or b!65142 bm!5333) bm!5329))

(assert (= (and d!13549 res!35444) b!65134))

(assert (= (and d!13549 c!8948) b!65144))

(assert (= (and d!13549 (not c!8948)) b!65139))

(assert (= (and d!13549 res!35443) b!65143))

(assert (= (and b!65143 res!35451) b!65130))

(assert (= (and b!65143 (not res!35446)) b!65129))

(assert (= (and b!65129 res!35447) b!65133))

(assert (= (and b!65143 res!35448) b!65137))

(assert (= (and b!65137 c!8950) b!65125))

(assert (= (and b!65137 (not c!8950)) b!65141))

(assert (= (and b!65125 res!35450) b!65126))

(assert (= (or b!65125 b!65141) bm!5332))

(assert (= (and b!65137 res!35449) b!65138))

(assert (= (and b!65138 c!8949) b!65128))

(assert (= (and b!65138 (not c!8949)) b!65135))

(assert (= (and b!65128 res!35445) b!65124))

(assert (= (or b!65128 b!65135) bm!5330))

(declare-fun b_lambda!2905 () Bool)

(assert (=> (not b_lambda!2905) (not b!65133)))

(assert (=> b!65133 t!4887))

(declare-fun b_and!3977 () Bool)

(assert (= b_and!3973 (and (=> t!4887 result!2507) b_and!3977)))

(assert (=> b!65133 t!4889))

(declare-fun b_and!3979 () Bool)

(assert (= b_and!3975 (and (=> t!4889 result!2509) b_and!3979)))

(assert (=> b!65130 m!59171))

(assert (=> b!65130 m!59171))

(assert (=> b!65130 m!59173))

(assert (=> d!13549 m!59393))

(declare-fun m!59591 () Bool)

(assert (=> bm!5329 m!59591))

(assert (=> b!65133 m!59435))

(declare-fun m!59593 () Bool)

(assert (=> b!65133 m!59593))

(assert (=> b!65133 m!59171))

(assert (=> b!65133 m!59171))

(declare-fun m!59595 () Bool)

(assert (=> b!65133 m!59595))

(assert (=> b!65133 m!59593))

(assert (=> b!65133 m!59435))

(declare-fun m!59597 () Bool)

(assert (=> b!65133 m!59597))

(declare-fun m!59599 () Bool)

(assert (=> b!65144 m!59599))

(assert (=> b!65144 m!59599))

(declare-fun m!59601 () Bool)

(assert (=> b!65144 m!59601))

(declare-fun m!59603 () Bool)

(assert (=> b!65144 m!59603))

(declare-fun m!59605 () Bool)

(assert (=> b!65144 m!59605))

(assert (=> b!65144 m!59171))

(declare-fun m!59607 () Bool)

(assert (=> b!65144 m!59607))

(declare-fun m!59609 () Bool)

(assert (=> b!65144 m!59609))

(declare-fun m!59611 () Bool)

(assert (=> b!65144 m!59611))

(declare-fun m!59613 () Bool)

(assert (=> b!65144 m!59613))

(declare-fun m!59615 () Bool)

(assert (=> b!65144 m!59615))

(declare-fun m!59617 () Bool)

(assert (=> b!65144 m!59617))

(declare-fun m!59619 () Bool)

(assert (=> b!65144 m!59619))

(declare-fun m!59621 () Bool)

(assert (=> b!65144 m!59621))

(declare-fun m!59623 () Bool)

(assert (=> b!65144 m!59623))

(assert (=> b!65144 m!59617))

(declare-fun m!59625 () Bool)

(assert (=> b!65144 m!59625))

(assert (=> b!65144 m!59607))

(assert (=> b!65144 m!59611))

(declare-fun m!59627 () Bool)

(assert (=> b!65144 m!59627))

(declare-fun m!59629 () Bool)

(assert (=> b!65144 m!59629))

(assert (=> b!65129 m!59171))

(assert (=> b!65129 m!59171))

(declare-fun m!59631 () Bool)

(assert (=> b!65129 m!59631))

(declare-fun m!59633 () Bool)

(assert (=> bm!5332 m!59633))

(declare-fun m!59635 () Bool)

(assert (=> bm!5330 m!59635))

(declare-fun m!59637 () Bool)

(assert (=> b!65126 m!59637))

(declare-fun m!59639 () Bool)

(assert (=> b!65142 m!59639))

(assert (=> bm!5335 m!59619))

(declare-fun m!59641 () Bool)

(assert (=> b!65124 m!59641))

(assert (=> b!65134 m!59171))

(assert (=> b!65134 m!59171))

(assert (=> b!65134 m!59173))

(assert (=> bm!5290 d!13549))

(assert (=> bm!5295 d!13521))

(declare-fun b!65145 () Bool)

(declare-fun e!42669 () Bool)

(declare-fun e!42670 () Bool)

(assert (=> b!65145 (= e!42669 e!42670)))

(declare-fun c!8952 () Bool)

(assert (=> b!65145 (= c!8952 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!65146 () Bool)

(declare-fun call!5339 () Bool)

(assert (=> b!65146 (= e!42670 call!5339)))

(declare-fun bm!5336 () Bool)

(assert (=> bm!5336 (= call!5339 (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8952 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!8809 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450) Nil!1450)) (ite c!8809 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450) Nil!1450))))))

(declare-fun b!65147 () Bool)

(declare-fun e!42667 () Bool)

(assert (=> b!65147 (= e!42667 e!42669)))

(declare-fun res!35452 () Bool)

(assert (=> b!65147 (=> (not res!35452) (not e!42669))))

(declare-fun e!42668 () Bool)

(assert (=> b!65147 (= res!35452 (not e!42668))))

(declare-fun res!35453 () Bool)

(assert (=> b!65147 (=> (not res!35453) (not e!42668))))

(assert (=> b!65147 (= res!35453 (validKeyInArray!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!13551 () Bool)

(declare-fun res!35454 () Bool)

(assert (=> d!13551 (=> res!35454 e!42667)))

(assert (=> d!13551 (= res!35454 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2033 (_keys!3758 (v!2440 (underlying!235 thiss!992))))))))

(assert (=> d!13551 (= (arrayNoDuplicates!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8809 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450) Nil!1450)) e!42667)))

(declare-fun b!65148 () Bool)

(assert (=> b!65148 (= e!42670 call!5339)))

(declare-fun b!65149 () Bool)

(assert (=> b!65149 (= e!42668 (contains!697 (ite c!8809 (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450) Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!13551 (not res!35454)) b!65147))

(assert (= (and b!65147 res!35453) b!65149))

(assert (= (and b!65147 res!35452) b!65145))

(assert (= (and b!65145 c!8952) b!65148))

(assert (= (and b!65145 (not c!8952)) b!65146))

(assert (= (or b!65148 b!65146) bm!5336))

(declare-fun m!59643 () Bool)

(assert (=> b!65145 m!59643))

(assert (=> b!65145 m!59643))

(declare-fun m!59645 () Bool)

(assert (=> b!65145 m!59645))

(assert (=> bm!5336 m!59643))

(declare-fun m!59647 () Bool)

(assert (=> bm!5336 m!59647))

(assert (=> b!65147 m!59643))

(assert (=> b!65147 m!59643))

(assert (=> b!65147 m!59645))

(assert (=> b!65149 m!59643))

(assert (=> b!65149 m!59643))

(declare-fun m!59649 () Bool)

(assert (=> b!65149 m!59649))

(assert (=> bm!5202 d!13551))

(declare-fun b!65150 () Bool)

(declare-fun e!42674 () Bool)

(declare-fun lt!27883 () ListLongMap!1369)

(assert (=> b!65150 (= e!42674 (= (apply!70 lt!27883 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2030 newMap!16)))))

(declare-fun c!8958 () Bool)

(declare-fun call!5343 () ListLongMap!1369)

(declare-fun call!5340 () ListLongMap!1369)

(declare-fun call!5341 () ListLongMap!1369)

(declare-fun call!5342 () ListLongMap!1369)

(declare-fun c!8953 () Bool)

(declare-fun bm!5337 () Bool)

(assert (=> bm!5337 (= call!5340 (+!85 (ite c!8953 call!5343 (ite c!8958 call!5341 call!5342)) (ite (or c!8953 c!8958) (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16)))))))

(declare-fun b!65151 () Bool)

(declare-fun e!42678 () Bool)

(declare-fun e!42680 () Bool)

(assert (=> b!65151 (= e!42678 e!42680)))

(declare-fun res!35462 () Bool)

(declare-fun call!5346 () Bool)

(assert (=> b!65151 (= res!35462 call!5346)))

(assert (=> b!65151 (=> (not res!35462) (not e!42680))))

(declare-fun d!13553 () Bool)

(declare-fun e!42679 () Bool)

(assert (=> d!13553 e!42679))

(declare-fun res!35455 () Bool)

(assert (=> d!13553 (=> (not res!35455) (not e!42679))))

(assert (=> d!13553 (= res!35455 (or (bvsge #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))))

(declare-fun lt!27892 () ListLongMap!1369)

(assert (=> d!13553 (= lt!27883 lt!27892)))

(declare-fun lt!27886 () Unit!1772)

(declare-fun e!42683 () Unit!1772)

(assert (=> d!13553 (= lt!27886 e!42683)))

(declare-fun c!8955 () Bool)

(declare-fun e!42673 () Bool)

(assert (=> d!13553 (= c!8955 e!42673)))

(declare-fun res!35456 () Bool)

(assert (=> d!13553 (=> (not res!35456) (not e!42673))))

(assert (=> d!13553 (= res!35456 (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun e!42682 () ListLongMap!1369)

(assert (=> d!13553 (= lt!27892 e!42682)))

(assert (=> d!13553 (= c!8953 (and (not (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13553 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13553 (= (getCurrentListMap!396 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) lt!27883)))

(declare-fun b!65152 () Bool)

(assert (=> b!65152 (= e!42680 (= (apply!70 lt!27883 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16))))))

(declare-fun bm!5338 () Bool)

(declare-fun call!5345 () Bool)

(assert (=> bm!5338 (= call!5345 (contains!696 lt!27883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5339 () Bool)

(assert (=> bm!5339 (= call!5341 call!5343)))

(declare-fun b!65153 () Bool)

(declare-fun c!8954 () Bool)

(assert (=> b!65153 (= c!8954 (and (not (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42676 () ListLongMap!1369)

(declare-fun e!42675 () ListLongMap!1369)

(assert (=> b!65153 (= e!42676 e!42675)))

(declare-fun bm!5340 () Bool)

(assert (=> bm!5340 (= call!5346 (contains!696 lt!27883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65154 () Bool)

(declare-fun e!42672 () Bool)

(assert (=> b!65154 (= e!42672 e!42674)))

(declare-fun res!35457 () Bool)

(assert (=> b!65154 (= res!35457 call!5345)))

(assert (=> b!65154 (=> (not res!35457) (not e!42674))))

(declare-fun b!65155 () Bool)

(declare-fun e!42677 () Bool)

(declare-fun e!42681 () Bool)

(assert (=> b!65155 (= e!42677 e!42681)))

(declare-fun res!35459 () Bool)

(assert (=> b!65155 (=> (not res!35459) (not e!42681))))

(assert (=> b!65155 (= res!35459 (contains!696 lt!27883 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65156 () Bool)

(declare-fun e!42671 () Bool)

(assert (=> b!65156 (= e!42671 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65157 () Bool)

(declare-fun call!5344 () ListLongMap!1369)

(assert (=> b!65157 (= e!42675 call!5344)))

(declare-fun b!65158 () Bool)

(assert (=> b!65158 (= e!42682 e!42676)))

(assert (=> b!65158 (= c!8958 (and (not (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65159 () Bool)

(assert (=> b!65159 (= e!42681 (= (apply!70 lt!27883 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)) (get!1101 (select (arr!1799 (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581)) #b00000000000000000000000000000000) (dynLambda!314 (defaultEntry!2121 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2034 (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581))))))

(assert (=> b!65159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65160 () Bool)

(assert (=> b!65160 (= e!42673 (validKeyInArray!0 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5341 () Bool)

(assert (=> bm!5341 (= call!5344 call!5340)))

(declare-fun bm!5342 () Bool)

(assert (=> bm!5342 (= call!5342 call!5341)))

(declare-fun b!65161 () Bool)

(assert (=> b!65161 (= e!42672 (not call!5345))))

(declare-fun b!65162 () Bool)

(assert (=> b!65162 (= e!42676 call!5344)))

(declare-fun b!65163 () Bool)

(declare-fun res!35461 () Bool)

(assert (=> b!65163 (=> (not res!35461) (not e!42679))))

(assert (=> b!65163 (= res!35461 e!42678)))

(declare-fun c!8957 () Bool)

(assert (=> b!65163 (= c!8957 (not (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65164 () Bool)

(assert (=> b!65164 (= e!42679 e!42672)))

(declare-fun c!8956 () Bool)

(assert (=> b!65164 (= c!8956 (not (= (bvand (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65165 () Bool)

(declare-fun Unit!1790 () Unit!1772)

(assert (=> b!65165 (= e!42683 Unit!1790)))

(declare-fun b!65166 () Bool)

(assert (=> b!65166 (= e!42675 call!5342)))

(declare-fun b!65167 () Bool)

(assert (=> b!65167 (= e!42678 (not call!5346))))

(declare-fun b!65168 () Bool)

(assert (=> b!65168 (= e!42682 (+!85 call!5340 (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16))))))

(declare-fun bm!5343 () Bool)

(assert (=> bm!5343 (= call!5343 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!65169 () Bool)

(declare-fun res!35460 () Bool)

(assert (=> b!65169 (=> (not res!35460) (not e!42679))))

(assert (=> b!65169 (= res!35460 e!42677)))

(declare-fun res!35458 () Bool)

(assert (=> b!65169 (=> res!35458 e!42677)))

(assert (=> b!65169 (= res!35458 (not e!42671))))

(declare-fun res!35463 () Bool)

(assert (=> b!65169 (=> (not res!35463) (not e!42671))))

(assert (=> b!65169 (= res!35463 (bvslt #b00000000000000000000000000000000 (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65170 () Bool)

(declare-fun lt!27887 () Unit!1772)

(assert (=> b!65170 (= e!42683 lt!27887)))

(declare-fun lt!27884 () ListLongMap!1369)

(assert (=> b!65170 (= lt!27884 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27891 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27882 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27882 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27893 () Unit!1772)

(assert (=> b!65170 (= lt!27893 (addStillContains!46 lt!27884 lt!27891 (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) lt!27882))))

(assert (=> b!65170 (contains!696 (+!85 lt!27884 (tuple2!2061 lt!27891 (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)))) lt!27882)))

(declare-fun lt!27880 () Unit!1772)

(assert (=> b!65170 (= lt!27880 lt!27893)))

(declare-fun lt!27888 () ListLongMap!1369)

(assert (=> b!65170 (= lt!27888 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27873 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27873 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27889 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27889 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27877 () Unit!1772)

(assert (=> b!65170 (= lt!27877 (addApplyDifferent!46 lt!27888 lt!27873 (minValue!2030 newMap!16) lt!27889))))

(assert (=> b!65170 (= (apply!70 (+!85 lt!27888 (tuple2!2061 lt!27873 (minValue!2030 newMap!16))) lt!27889) (apply!70 lt!27888 lt!27889))))

(declare-fun lt!27875 () Unit!1772)

(assert (=> b!65170 (= lt!27875 lt!27877)))

(declare-fun lt!27881 () ListLongMap!1369)

(assert (=> b!65170 (= lt!27881 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27885 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27885 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27890 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27890 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27874 () Unit!1772)

(assert (=> b!65170 (= lt!27874 (addApplyDifferent!46 lt!27881 lt!27885 (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) lt!27890))))

(assert (=> b!65170 (= (apply!70 (+!85 lt!27881 (tuple2!2061 lt!27885 (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)))) lt!27890) (apply!70 lt!27881 lt!27890))))

(declare-fun lt!27879 () Unit!1772)

(assert (=> b!65170 (= lt!27879 lt!27874)))

(declare-fun lt!27878 () ListLongMap!1369)

(assert (=> b!65170 (= lt!27878 (getCurrentListMapNoExtraKeys!48 (_keys!3758 newMap!16) (ite (or c!8868 c!8867) (_values!2104 newMap!16) lt!27581) (mask!6042 newMap!16) (ite (and c!8868 c!8866) lt!27583 (extraKeys!1994 newMap!16)) (ite (and c!8868 c!8866) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27872 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27876 () (_ BitVec 64))

(assert (=> b!65170 (= lt!27876 (select (arr!1798 (_keys!3758 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65170 (= lt!27887 (addApplyDifferent!46 lt!27878 lt!27872 (minValue!2030 newMap!16) lt!27876))))

(assert (=> b!65170 (= (apply!70 (+!85 lt!27878 (tuple2!2061 lt!27872 (minValue!2030 newMap!16))) lt!27876) (apply!70 lt!27878 lt!27876))))

(assert (= (and d!13553 c!8953) b!65168))

(assert (= (and d!13553 (not c!8953)) b!65158))

(assert (= (and b!65158 c!8958) b!65162))

(assert (= (and b!65158 (not c!8958)) b!65153))

(assert (= (and b!65153 c!8954) b!65157))

(assert (= (and b!65153 (not c!8954)) b!65166))

(assert (= (or b!65157 b!65166) bm!5342))

(assert (= (or b!65162 bm!5342) bm!5339))

(assert (= (or b!65162 b!65157) bm!5341))

(assert (= (or b!65168 bm!5339) bm!5343))

(assert (= (or b!65168 bm!5341) bm!5337))

(assert (= (and d!13553 res!35456) b!65160))

(assert (= (and d!13553 c!8955) b!65170))

(assert (= (and d!13553 (not c!8955)) b!65165))

(assert (= (and d!13553 res!35455) b!65169))

(assert (= (and b!65169 res!35463) b!65156))

(assert (= (and b!65169 (not res!35458)) b!65155))

(assert (= (and b!65155 res!35459) b!65159))

(assert (= (and b!65169 res!35460) b!65163))

(assert (= (and b!65163 c!8957) b!65151))

(assert (= (and b!65163 (not c!8957)) b!65167))

(assert (= (and b!65151 res!35462) b!65152))

(assert (= (or b!65151 b!65167) bm!5340))

(assert (= (and b!65163 res!35461) b!65164))

(assert (= (and b!65164 c!8956) b!65154))

(assert (= (and b!65164 (not c!8956)) b!65161))

(assert (= (and b!65154 res!35457) b!65150))

(assert (= (or b!65154 b!65161) bm!5338))

(declare-fun b_lambda!2907 () Bool)

(assert (=> (not b_lambda!2907) (not b!65159)))

(assert (=> b!65159 t!4887))

(declare-fun b_and!3981 () Bool)

(assert (= b_and!3977 (and (=> t!4887 result!2507) b_and!3981)))

(assert (=> b!65159 t!4889))

(declare-fun b_and!3983 () Bool)

(assert (= b_and!3979 (and (=> t!4889 result!2509) b_and!3983)))

(assert (=> b!65156 m!59171))

(assert (=> b!65156 m!59171))

(assert (=> b!65156 m!59173))

(assert (=> d!13553 m!59393))

(declare-fun m!59651 () Bool)

(assert (=> bm!5337 m!59651))

(assert (=> b!65159 m!59435))

(declare-fun m!59653 () Bool)

(assert (=> b!65159 m!59653))

(assert (=> b!65159 m!59171))

(assert (=> b!65159 m!59171))

(declare-fun m!59655 () Bool)

(assert (=> b!65159 m!59655))

(assert (=> b!65159 m!59653))

(assert (=> b!65159 m!59435))

(declare-fun m!59657 () Bool)

(assert (=> b!65159 m!59657))

(declare-fun m!59659 () Bool)

(assert (=> b!65170 m!59659))

(assert (=> b!65170 m!59659))

(declare-fun m!59661 () Bool)

(assert (=> b!65170 m!59661))

(declare-fun m!59663 () Bool)

(assert (=> b!65170 m!59663))

(declare-fun m!59665 () Bool)

(assert (=> b!65170 m!59665))

(assert (=> b!65170 m!59171))

(declare-fun m!59667 () Bool)

(assert (=> b!65170 m!59667))

(declare-fun m!59669 () Bool)

(assert (=> b!65170 m!59669))

(declare-fun m!59671 () Bool)

(assert (=> b!65170 m!59671))

(declare-fun m!59673 () Bool)

(assert (=> b!65170 m!59673))

(declare-fun m!59675 () Bool)

(assert (=> b!65170 m!59675))

(declare-fun m!59677 () Bool)

(assert (=> b!65170 m!59677))

(declare-fun m!59679 () Bool)

(assert (=> b!65170 m!59679))

(declare-fun m!59681 () Bool)

(assert (=> b!65170 m!59681))

(declare-fun m!59683 () Bool)

(assert (=> b!65170 m!59683))

(assert (=> b!65170 m!59677))

(declare-fun m!59685 () Bool)

(assert (=> b!65170 m!59685))

(assert (=> b!65170 m!59667))

(assert (=> b!65170 m!59671))

(declare-fun m!59687 () Bool)

(assert (=> b!65170 m!59687))

(declare-fun m!59689 () Bool)

(assert (=> b!65170 m!59689))

(assert (=> b!65155 m!59171))

(assert (=> b!65155 m!59171))

(declare-fun m!59691 () Bool)

(assert (=> b!65155 m!59691))

(declare-fun m!59693 () Bool)

(assert (=> bm!5340 m!59693))

(declare-fun m!59695 () Bool)

(assert (=> bm!5338 m!59695))

(declare-fun m!59697 () Bool)

(assert (=> b!65152 m!59697))

(declare-fun m!59699 () Bool)

(assert (=> b!65168 m!59699))

(assert (=> bm!5343 m!59679))

(declare-fun m!59701 () Bool)

(assert (=> b!65150 m!59701))

(assert (=> b!65160 m!59171))

(assert (=> b!65160 m!59171))

(assert (=> b!65160 m!59173))

(assert (=> bm!5289 d!13553))

(declare-fun d!13555 () Bool)

(declare-fun e!42684 () Bool)

(assert (=> d!13555 e!42684))

(declare-fun res!35464 () Bool)

(assert (=> d!13555 (=> (not res!35464) (not e!42684))))

(declare-fun lt!27897 () ListLongMap!1369)

(assert (=> d!13555 (= res!35464 (contains!696 lt!27897 (_1!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!27895 () List!1454)

(assert (=> d!13555 (= lt!27897 (ListLongMap!1370 lt!27895))))

(declare-fun lt!27894 () Unit!1772)

(declare-fun lt!27896 () Unit!1772)

(assert (=> d!13555 (= lt!27894 lt!27896)))

(assert (=> d!13555 (= (getValueByKey!126 lt!27895 (_1!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!131 (_2!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13555 (= lt!27896 (lemmaContainsTupThenGetReturnValue!46 lt!27895 (_1!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13555 (= lt!27895 (insertStrictlySorted!49 (toList!700 e!42469) (_1!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13555 (= (+!85 e!42469 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!27897)))

(declare-fun b!65171 () Bool)

(declare-fun res!35465 () Bool)

(assert (=> b!65171 (=> (not res!35465) (not e!42684))))

(assert (=> b!65171 (= res!35465 (= (getValueByKey!126 (toList!700 lt!27897) (_1!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!131 (_2!1041 (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!65172 () Bool)

(assert (=> b!65172 (= e!42684 (contains!698 (toList!700 lt!27897) (ite c!8868 (ite c!8866 (tuple2!2061 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2061 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2061 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!13555 res!35464) b!65171))

(assert (= (and b!65171 res!35465) b!65172))

(declare-fun m!59703 () Bool)

(assert (=> d!13555 m!59703))

(declare-fun m!59705 () Bool)

(assert (=> d!13555 m!59705))

(declare-fun m!59707 () Bool)

(assert (=> d!13555 m!59707))

(declare-fun m!59709 () Bool)

(assert (=> d!13555 m!59709))

(declare-fun m!59711 () Bool)

(assert (=> b!65171 m!59711))

(declare-fun m!59713 () Bool)

(assert (=> b!65172 m!59713))

(assert (=> bm!5279 d!13555))

(declare-fun d!13557 () Bool)

(assert (=> d!13557 (isDefined!80 (getValueByKey!126 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun lt!27900 () Unit!1772)

(declare-fun choose!368 (List!1454 (_ BitVec 64)) Unit!1772)

(assert (=> d!13557 (= lt!27900 (choose!368 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun e!42687 () Bool)

(assert (=> d!13557 e!42687))

(declare-fun res!35468 () Bool)

(assert (=> d!13557 (=> (not res!35468) (not e!42687))))

(declare-fun isStrictlySorted!283 (List!1454) Bool)

(assert (=> d!13557 (= res!35468 (isStrictlySorted!283 (toList!700 lt!27387)))))

(assert (=> d!13557 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) lt!27900)))

(declare-fun b!65175 () Bool)

(assert (=> b!65175 (= e!42687 (containsKey!130 (toList!700 lt!27387) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (= (and d!13557 res!35468) b!65175))

(assert (=> d!13557 m!58861))

(assert (=> d!13557 m!59079))

(assert (=> d!13557 m!59079))

(assert (=> d!13557 m!59081))

(assert (=> d!13557 m!58861))

(declare-fun m!59715 () Bool)

(assert (=> d!13557 m!59715))

(declare-fun m!59717 () Bool)

(assert (=> d!13557 m!59717))

(assert (=> b!65175 m!58861))

(assert (=> b!65175 m!59075))

(assert (=> b!64694 d!13557))

(assert (=> b!64694 d!13511))

(assert (=> b!64694 d!13513))

(declare-fun d!13559 () Bool)

(assert (=> d!13559 (= (map!1120 (_2!1042 lt!27573)) (getCurrentListMap!396 (_keys!3758 (_2!1042 lt!27573)) (_values!2104 (_2!1042 lt!27573)) (mask!6042 (_2!1042 lt!27573)) (extraKeys!1994 (_2!1042 lt!27573)) (zeroValue!2030 (_2!1042 lt!27573)) (minValue!2030 (_2!1042 lt!27573)) #b00000000000000000000000000000000 (defaultEntry!2121 (_2!1042 lt!27573))))))

(declare-fun bs!2820 () Bool)

(assert (= bs!2820 d!13559))

(declare-fun m!59719 () Bool)

(assert (=> bs!2820 m!59719))

(assert (=> bm!5288 d!13559))

(declare-fun c!8964 () Bool)

(declare-fun call!5352 () Bool)

(declare-fun bm!5348 () Bool)

(declare-fun lt!27905 () SeekEntryResult!234)

(assert (=> bm!5348 (= call!5352 (inRange!0 (ite c!8964 (index!3063 lt!27905) (index!3066 lt!27905)) (mask!6042 newMap!16)))))

(declare-fun b!65193 () Bool)

(declare-fun res!35479 () Bool)

(declare-fun e!42696 () Bool)

(assert (=> b!65193 (=> (not res!35479) (not e!42696))))

(assert (=> b!65193 (= res!35479 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3066 lt!27905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65193 (and (bvsge (index!3066 lt!27905) #b00000000000000000000000000000000) (bvslt (index!3066 lt!27905) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun b!65194 () Bool)

(declare-fun e!42699 () Bool)

(declare-fun e!42697 () Bool)

(assert (=> b!65194 (= e!42699 e!42697)))

(declare-fun c!8963 () Bool)

(assert (=> b!65194 (= c!8963 ((_ is MissingVacant!234) lt!27905))))

(declare-fun bm!5349 () Bool)

(declare-fun call!5351 () Bool)

(assert (=> bm!5349 (= call!5351 (arrayContainsKey!0 (_keys!3758 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!65195 () Bool)

(assert (=> b!65195 (and (bvsge (index!3063 lt!27905) #b00000000000000000000000000000000) (bvslt (index!3063 lt!27905) (size!2033 (_keys!3758 newMap!16))))))

(declare-fun res!35478 () Bool)

(assert (=> b!65195 (= res!35478 (= (select (arr!1798 (_keys!3758 newMap!16)) (index!3063 lt!27905)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42698 () Bool)

(assert (=> b!65195 (=> (not res!35478) (not e!42698))))

(declare-fun b!65196 () Bool)

(declare-fun res!35480 () Bool)

(assert (=> b!65196 (=> (not res!35480) (not e!42696))))

(assert (=> b!65196 (= res!35480 call!5352)))

(assert (=> b!65196 (= e!42697 e!42696)))

(declare-fun b!65197 () Bool)

(assert (=> b!65197 (= e!42697 ((_ is Undefined!234) lt!27905))))

(declare-fun b!65192 () Bool)

(assert (=> b!65192 (= e!42696 (not call!5351))))

(declare-fun d!13561 () Bool)

(assert (=> d!13561 e!42699))

(assert (=> d!13561 (= c!8964 ((_ is MissingZero!234) lt!27905))))

(assert (=> d!13561 (= lt!27905 (seekEntryOrOpen!0 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (_keys!3758 newMap!16) (mask!6042 newMap!16)))))

(declare-fun lt!27906 () Unit!1772)

(declare-fun choose!369 (array!3765 array!3767 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1772)

(assert (=> d!13561 (= lt!27906 (choose!369 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13561 (validMask!0 (mask!6042 newMap!16))))

(assert (=> d!13561 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3758 newMap!16) (_values!2104 newMap!16) (mask!6042 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)) lt!27906)))

(declare-fun b!65198 () Bool)

(assert (=> b!65198 (= e!42698 (not call!5351))))

(declare-fun b!65199 () Bool)

(assert (=> b!65199 (= e!42699 e!42698)))

(declare-fun res!35477 () Bool)

(assert (=> b!65199 (= res!35477 call!5352)))

(assert (=> b!65199 (=> (not res!35477) (not e!42698))))

(assert (= (and d!13561 c!8964) b!65199))

(assert (= (and d!13561 (not c!8964)) b!65194))

(assert (= (and b!65199 res!35477) b!65195))

(assert (= (and b!65195 res!35478) b!65198))

(assert (= (and b!65194 c!8963) b!65196))

(assert (= (and b!65194 (not c!8963)) b!65197))

(assert (= (and b!65196 res!35480) b!65193))

(assert (= (and b!65193 res!35479) b!65192))

(assert (= (or b!65199 b!65196) bm!5348))

(assert (= (or b!65198 b!65192) bm!5349))

(declare-fun m!59721 () Bool)

(assert (=> b!65195 m!59721))

(assert (=> bm!5349 m!58861))

(assert (=> bm!5349 m!59107))

(declare-fun m!59723 () Bool)

(assert (=> b!65193 m!59723))

(assert (=> d!13561 m!58861))

(assert (=> d!13561 m!59111))

(assert (=> d!13561 m!58861))

(declare-fun m!59725 () Bool)

(assert (=> d!13561 m!59725))

(assert (=> d!13561 m!59393))

(declare-fun m!59727 () Bool)

(assert (=> bm!5348 m!59727))

(assert (=> bm!5294 d!13561))

(assert (=> d!13399 d!13403))

(declare-fun d!13563 () Bool)

(assert (=> d!13563 (not (arrayContainsKey!0 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!13563 true))

(declare-fun _$68!43 () Unit!1772)

(assert (=> d!13563 (= (choose!68 (_keys!3758 (v!2440 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) (Cons!1449 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355) Nil!1450)) _$68!43)))

(declare-fun bs!2821 () Bool)

(assert (= bs!2821 d!13563))

(assert (=> bs!2821 m!58861))

(assert (=> bs!2821 m!58877))

(assert (=> d!13399 d!13563))

(declare-fun d!13565 () Bool)

(declare-fun e!42700 () Bool)

(assert (=> d!13565 e!42700))

(declare-fun res!35481 () Bool)

(assert (=> d!13565 (=> res!35481 e!42700)))

(declare-fun lt!27910 () Bool)

(assert (=> d!13565 (= res!35481 (not lt!27910))))

(declare-fun lt!27907 () Bool)

(assert (=> d!13565 (= lt!27910 lt!27907)))

(declare-fun lt!27909 () Unit!1772)

(declare-fun e!42701 () Unit!1772)

(assert (=> d!13565 (= lt!27909 e!42701)))

(declare-fun c!8965 () Bool)

(assert (=> d!13565 (= c!8965 lt!27907)))

(assert (=> d!13565 (= lt!27907 (containsKey!130 (toList!700 call!5275) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> d!13565 (= (contains!696 call!5275 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)) lt!27910)))

(declare-fun b!65200 () Bool)

(declare-fun lt!27908 () Unit!1772)

(assert (=> b!65200 (= e!42701 lt!27908)))

(assert (=> b!65200 (= lt!27908 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 call!5275) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(assert (=> b!65200 (isDefined!80 (getValueByKey!126 (toList!700 call!5275) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355)))))

(declare-fun b!65201 () Bool)

(declare-fun Unit!1791 () Unit!1772)

(assert (=> b!65201 (= e!42701 Unit!1791)))

(declare-fun b!65202 () Bool)

(assert (=> b!65202 (= e!42700 (isDefined!80 (getValueByKey!126 (toList!700 call!5275) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) from!355))))))

(assert (= (and d!13565 c!8965) b!65200))

(assert (= (and d!13565 (not c!8965)) b!65201))

(assert (= (and d!13565 (not res!35481)) b!65202))

(assert (=> d!13565 m!58861))

(declare-fun m!59729 () Bool)

(assert (=> d!13565 m!59729))

(assert (=> b!65200 m!58861))

(declare-fun m!59731 () Bool)

(assert (=> b!65200 m!59731))

(assert (=> b!65200 m!58861))

(declare-fun m!59733 () Bool)

(assert (=> b!65200 m!59733))

(assert (=> b!65200 m!59733))

(declare-fun m!59735 () Bool)

(assert (=> b!65200 m!59735))

(assert (=> b!65202 m!58861))

(assert (=> b!65202 m!59733))

(assert (=> b!65202 m!59733))

(assert (=> b!65202 m!59735))

(assert (=> b!64799 d!13565))

(declare-fun d!13567 () Bool)

(assert (=> d!13567 (= (apply!70 lt!27495 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1104 (getValueByKey!126 (toList!700 lt!27495) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2822 () Bool)

(assert (= bs!2822 d!13567))

(assert (=> bs!2822 m!58999))

(declare-fun m!59737 () Bool)

(assert (=> bs!2822 m!59737))

(assert (=> bs!2822 m!59737))

(declare-fun m!59739 () Bool)

(assert (=> bs!2822 m!59739))

(assert (=> b!64667 d!13567))

(declare-fun d!13569 () Bool)

(declare-fun c!8966 () Bool)

(assert (=> d!13569 (= c!8966 ((_ is ValueCellFull!869) (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!42702 () V!2881)

(assert (=> d!13569 (= (get!1101 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42702)))

(declare-fun b!65203 () Bool)

(assert (=> b!65203 (= e!42702 (get!1102 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65204 () Bool)

(assert (=> b!65204 (= e!42702 (get!1103 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13569 c!8966) b!65203))

(assert (= (and d!13569 (not c!8966)) b!65204))

(assert (=> b!65203 m!59017))

(assert (=> b!65203 m!58891))

(declare-fun m!59741 () Bool)

(assert (=> b!65203 m!59741))

(assert (=> b!65204 m!59017))

(assert (=> b!65204 m!58891))

(declare-fun m!59743 () Bool)

(assert (=> b!65204 m!59743))

(assert (=> b!64667 d!13569))

(declare-fun d!13571 () Bool)

(assert (=> d!13571 (= (inRange!0 (ite c!8867 (ite c!8870 (index!3064 lt!27586) (ite c!8862 (index!3063 lt!27580) (index!3066 lt!27580))) (ite c!8859 (index!3064 lt!27578) (ite c!8864 (index!3063 lt!27579) (index!3066 lt!27579)))) (mask!6042 newMap!16)) (and (bvsge (ite c!8867 (ite c!8870 (index!3064 lt!27586) (ite c!8862 (index!3063 lt!27580) (index!3066 lt!27580))) (ite c!8859 (index!3064 lt!27578) (ite c!8864 (index!3063 lt!27579) (index!3066 lt!27579)))) #b00000000000000000000000000000000) (bvslt (ite c!8867 (ite c!8870 (index!3064 lt!27586) (ite c!8862 (index!3063 lt!27580) (index!3066 lt!27580))) (ite c!8859 (index!3064 lt!27578) (ite c!8864 (index!3063 lt!27579) (index!3066 lt!27579)))) (bvadd (mask!6042 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!5293 d!13571))

(declare-fun d!13573 () Bool)

(assert (=> d!13573 (= (get!1103 (select (arr!1799 (_values!2104 (v!2440 (underlying!235 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!314 (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64828 d!13573))

(declare-fun d!13575 () Bool)

(declare-fun lt!27911 () Bool)

(assert (=> d!13575 (= lt!27911 (select (content!70 Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!42704 () Bool)

(assert (=> d!13575 (= lt!27911 e!42704)))

(declare-fun res!35482 () Bool)

(assert (=> d!13575 (=> (not res!35482) (not e!42704))))

(assert (=> d!13575 (= res!35482 ((_ is Cons!1449) Nil!1450))))

(assert (=> d!13575 (= (contains!697 Nil!1450 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)) lt!27911)))

(declare-fun b!65205 () Bool)

(declare-fun e!42703 () Bool)

(assert (=> b!65205 (= e!42704 e!42703)))

(declare-fun res!35483 () Bool)

(assert (=> b!65205 (=> res!35483 e!42703)))

(assert (=> b!65205 (= res!35483 (= (h!2033 Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65206 () Bool)

(assert (=> b!65206 (= e!42703 (contains!697 (t!4874 Nil!1450) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!13575 res!35482) b!65205))

(assert (= (and b!65205 (not res!35483)) b!65206))

(assert (=> d!13575 m!59373))

(assert (=> d!13575 m!59141))

(declare-fun m!59745 () Bool)

(assert (=> d!13575 m!59745))

(assert (=> b!65206 m!59141))

(declare-fun m!59747 () Bool)

(assert (=> b!65206 m!59747))

(assert (=> b!64833 d!13575))

(assert (=> b!64831 d!13477))

(declare-fun d!13577 () Bool)

(declare-fun e!42705 () Bool)

(assert (=> d!13577 e!42705))

(declare-fun res!35484 () Bool)

(assert (=> d!13577 (=> res!35484 e!42705)))

(declare-fun lt!27915 () Bool)

(assert (=> d!13577 (= res!35484 (not lt!27915))))

(declare-fun lt!27912 () Bool)

(assert (=> d!13577 (= lt!27915 lt!27912)))

(declare-fun lt!27914 () Unit!1772)

(declare-fun e!42706 () Unit!1772)

(assert (=> d!13577 (= lt!27914 e!42706)))

(declare-fun c!8967 () Bool)

(assert (=> d!13577 (= c!8967 lt!27912)))

(assert (=> d!13577 (= lt!27912 (containsKey!130 (toList!700 lt!27495) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!13577 (= (contains!696 lt!27495 (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!27915)))

(declare-fun b!65207 () Bool)

(declare-fun lt!27913 () Unit!1772)

(assert (=> b!65207 (= e!42706 lt!27913)))

(assert (=> b!65207 (= lt!27913 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!700 lt!27495) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65207 (isDefined!80 (getValueByKey!126 (toList!700 lt!27495) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!65208 () Bool)

(declare-fun Unit!1792 () Unit!1772)

(assert (=> b!65208 (= e!42706 Unit!1792)))

(declare-fun b!65209 () Bool)

(assert (=> b!65209 (= e!42705 (isDefined!80 (getValueByKey!126 (toList!700 lt!27495) (select (arr!1798 (_keys!3758 (v!2440 (underlying!235 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!13577 c!8967) b!65207))

(assert (= (and d!13577 (not c!8967)) b!65208))

(assert (= (and d!13577 (not res!35484)) b!65209))

(assert (=> d!13577 m!58999))

(declare-fun m!59749 () Bool)

(assert (=> d!13577 m!59749))

(assert (=> b!65207 m!58999))

(declare-fun m!59751 () Bool)

(assert (=> b!65207 m!59751))

(assert (=> b!65207 m!58999))

(assert (=> b!65207 m!59737))

(assert (=> b!65207 m!59737))

(declare-fun m!59753 () Bool)

(assert (=> b!65207 m!59753))

(assert (=> b!65209 m!58999))

(assert (=> b!65209 m!59737))

(assert (=> b!65209 m!59737))

(assert (=> b!65209 m!59753))

(assert (=> b!64663 d!13577))

(declare-fun condMapEmpty!3005 () Bool)

(declare-fun mapDefault!3005 () ValueCell!869)

(assert (=> mapNonEmpty!3003 (= condMapEmpty!3005 (= mapRest!3003 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3005)))))

(declare-fun e!42708 () Bool)

(declare-fun mapRes!3005 () Bool)

(assert (=> mapNonEmpty!3003 (= tp!8223 (and e!42708 mapRes!3005))))

(declare-fun mapIsEmpty!3005 () Bool)

(assert (=> mapIsEmpty!3005 mapRes!3005))

(declare-fun b!65211 () Bool)

(assert (=> b!65211 (= e!42708 tp_is_empty!2425)))

(declare-fun b!65210 () Bool)

(declare-fun e!42707 () Bool)

(assert (=> b!65210 (= e!42707 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3005 () Bool)

(declare-fun tp!8225 () Bool)

(assert (=> mapNonEmpty!3005 (= mapRes!3005 (and tp!8225 e!42707))))

(declare-fun mapKey!3005 () (_ BitVec 32))

(declare-fun mapValue!3005 () ValueCell!869)

(declare-fun mapRest!3005 () (Array (_ BitVec 32) ValueCell!869))

(assert (=> mapNonEmpty!3005 (= mapRest!3003 (store mapRest!3005 mapKey!3005 mapValue!3005))))

(assert (= (and mapNonEmpty!3003 condMapEmpty!3005) mapIsEmpty!3005))

(assert (= (and mapNonEmpty!3003 (not condMapEmpty!3005)) mapNonEmpty!3005))

(assert (= (and mapNonEmpty!3005 ((_ is ValueCellFull!869) mapValue!3005)) b!65210))

(assert (= (and mapNonEmpty!3003 ((_ is ValueCellFull!869) mapDefault!3005)) b!65211))

(declare-fun m!59755 () Bool)

(assert (=> mapNonEmpty!3005 m!59755))

(declare-fun condMapEmpty!3006 () Bool)

(declare-fun mapDefault!3006 () ValueCell!869)

(assert (=> mapNonEmpty!3004 (= condMapEmpty!3006 (= mapRest!3004 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3006)))))

(declare-fun e!42710 () Bool)

(declare-fun mapRes!3006 () Bool)

(assert (=> mapNonEmpty!3004 (= tp!8224 (and e!42710 mapRes!3006))))

(declare-fun mapIsEmpty!3006 () Bool)

(assert (=> mapIsEmpty!3006 mapRes!3006))

(declare-fun b!65213 () Bool)

(assert (=> b!65213 (= e!42710 tp_is_empty!2425)))

(declare-fun b!65212 () Bool)

(declare-fun e!42709 () Bool)

(assert (=> b!65212 (= e!42709 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3006 () Bool)

(declare-fun tp!8226 () Bool)

(assert (=> mapNonEmpty!3006 (= mapRes!3006 (and tp!8226 e!42709))))

(declare-fun mapValue!3006 () ValueCell!869)

(declare-fun mapKey!3006 () (_ BitVec 32))

(declare-fun mapRest!3006 () (Array (_ BitVec 32) ValueCell!869))

(assert (=> mapNonEmpty!3006 (= mapRest!3004 (store mapRest!3006 mapKey!3006 mapValue!3006))))

(assert (= (and mapNonEmpty!3004 condMapEmpty!3006) mapIsEmpty!3006))

(assert (= (and mapNonEmpty!3004 (not condMapEmpty!3006)) mapNonEmpty!3006))

(assert (= (and mapNonEmpty!3006 ((_ is ValueCellFull!869) mapValue!3006)) b!65212))

(assert (= (and mapNonEmpty!3004 ((_ is ValueCellFull!869) mapDefault!3006)) b!65213))

(declare-fun m!59757 () Bool)

(assert (=> mapNonEmpty!3006 m!59757))

(declare-fun b_lambda!2909 () Bool)

(assert (= b_lambda!2905 (or (and b!64437 b_free!2017 (= (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) (defaultEntry!2121 newMap!16))) (and b!64440 b_free!2019) b_lambda!2909)))

(declare-fun b_lambda!2911 () Bool)

(assert (= b_lambda!2899 (or (and b!64437 b_free!2017) (and b!64440 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))))) b_lambda!2911)))

(declare-fun b_lambda!2913 () Bool)

(assert (= b_lambda!2907 (or (and b!64437 b_free!2017 (= (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) (defaultEntry!2121 newMap!16))) (and b!64440 b_free!2019) b_lambda!2913)))

(declare-fun b_lambda!2915 () Bool)

(assert (= b_lambda!2903 (or (and b!64437 b_free!2017 (= (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))) (defaultEntry!2121 newMap!16))) (and b!64440 b_free!2019) b_lambda!2915)))

(declare-fun b_lambda!2917 () Bool)

(assert (= b_lambda!2901 (or (and b!64437 b_free!2017) (and b!64440 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2440 (underlying!235 thiss!992))))) b_lambda!2917)))

(check-sat (not b!65017) (not d!13469) (not d!13505) (not bm!5330) (not b!64928) (not d!13463) (not b!64856) (not bm!5307) (not d!13515) (not b!64990) (not d!13489) (not b!64917) (not b!65062) (not bm!5316) (not d!13473) (not b!65200) (not bm!5319) (not b!65129) (not b!65118) (not b!64976) (not b!65134) (not b!65160) (not bm!5343) (not b_next!2017) (not b!64900) (not b!65011) (not bm!5327) (not d!13501) (not d!13455) (not b!64993) (not b!65084) (not d!13521) (not b!65058) (not b!65098) (not b!64867) (not d!13523) (not b!65156) (not d!13511) (not b_lambda!2911) (not d!13487) (not mapNonEmpty!3005) (not d!13539) (not b!65119) (not b!65130) (not d!13507) (not bm!5321) (not b!65115) (not d!13541) (not d!13575) (not b!65074) (not b!65117) (not b!65100) (not b!64912) (not d!13557) (not b!65110) (not b!65133) (not d!13565) (not b!65086) (not b!65175) (not bm!5332) (not b_lambda!2913) (not b!64897) (not b!65054) (not b!64997) (not bm!5304) (not d!13527) (not bm!5329) (not bm!5301) (not d!13475) (not b!65043) (not b!64896) (not b!65172) (not bm!5328) (not b!65124) (not b_lambda!2893) (not bm!5338) (not d!13553) (not b!64988) (not d!13535) (not b_next!2019) (not b!65202) (not b!65159) (not d!13445) (not bm!5336) (not b!64901) (not b!64924) (not b!65206) (not d!13471) (not b!65022) (not b!64987) (not b!65087) (not d!13451) (not b!65144) (not b!65171) (not b!64903) (not bm!5320) (not b!65147) (not d!13519) (not d!13545) (not b!64992) (not b!65056) b_and!3981 (not b!65096) (not d!13549) (not b!65066) (not d!13555) (not b!64913) (not b!64902) (not b!65168) (not b!65121) (not d!13483) (not b!65126) (not b!65123) (not b!65203) (not b!65149) (not b!65209) (not bm!5326) (not d!13439) (not b!64898) (not b!64927) (not d!13577) (not b!65088) (not b!65116) (not d!13481) (not b!65142) (not b!64869) (not b!65150) (not b!64980) (not d!13447) (not b!65008) (not b!65061) (not d!13499) (not bm!5337) (not d!13457) (not b!65155) (not d!13563) (not bm!5349) (not b!65152) (not d!13561) (not b!65077) (not d!13461) (not b!64941) (not d!13467) b_and!3983 (not d!13465) (not d!13559) (not b!65090) (not b!64929) (not b!64915) (not bm!5323) (not d!13449) (not bm!5318) (not b!64925) (not d!13537) (not d!13453) (not b_lambda!2917) (not b!65145) (not b!64998) (not d!13543) (not bm!5335) (not b!65207) (not b!65065) (not b!65111) (not bm!5340) (not bm!5300) (not b!65078) (not b_lambda!2909) (not b!65025) (not b!64860) (not b!65000) (not b!65014) (not b_lambda!2897) (not b!64995) (not d!13497) (not b!65006) (not b!64926) (not b_lambda!2915) (not d!13567) (not b!64865) (not d!13495) (not d!13529) (not b!65113) (not b!64904) (not b!65204) tp_is_empty!2425 (not d!13493) (not mapNonEmpty!3006) (not b!65170) (not b!64871) (not b!65114) (not b!65085) (not d!13459) (not b!65076) (not b!65009) (not b!64858) (not bm!5348))
(check-sat b_and!3981 b_and!3983 (not b_next!2017) (not b_next!2019))
