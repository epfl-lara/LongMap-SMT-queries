; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109692 () Bool)

(assert start!109692)

(declare-fun b_free!28957 () Bool)

(declare-fun b_next!28957 () Bool)

(assert (=> start!109692 (= b_free!28957 (not b_next!28957))))

(declare-fun tp!101990 () Bool)

(declare-fun b_and!47049 () Bool)

(assert (=> start!109692 (= tp!101990 b_and!47049)))

(declare-fun b!1297752 () Bool)

(declare-fun e!740478 () Bool)

(declare-fun tp_is_empty!34597 () Bool)

(assert (=> b!1297752 (= e!740478 tp_is_empty!34597)))

(declare-fun b!1297753 () Bool)

(declare-fun e!740479 () Bool)

(declare-fun mapRes!53456 () Bool)

(assert (=> b!1297753 (= e!740479 (and e!740478 mapRes!53456))))

(declare-fun condMapEmpty!53456 () Bool)

(declare-datatypes ((V!51233 0))(
  ( (V!51234 (val!17373 Int)) )
))
(declare-datatypes ((ValueCell!16400 0))(
  ( (ValueCellFull!16400 (v!19971 V!51233)) (EmptyCell!16400) )
))
(declare-datatypes ((array!86247 0))(
  ( (array!86248 (arr!41620 (Array (_ BitVec 32) ValueCell!16400)) (size!42171 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86247)

(declare-fun mapDefault!53456 () ValueCell!16400)

(assert (=> b!1297753 (= condMapEmpty!53456 (= (arr!41620 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16400)) mapDefault!53456)))))

(declare-fun bm!63488 () Bool)

(declare-datatypes ((tuple2!22386 0))(
  ( (tuple2!22387 (_1!11204 (_ BitVec 64)) (_2!11204 V!51233)) )
))
(declare-datatypes ((List!29551 0))(
  ( (Nil!29548) (Cons!29547 (h!30765 tuple2!22386) (t!43107 List!29551)) )
))
(declare-datatypes ((ListLongMap!20051 0))(
  ( (ListLongMap!20052 (toList!10041 List!29551)) )
))
(declare-fun call!63502 () ListLongMap!20051)

(declare-fun call!63496 () ListLongMap!20051)

(assert (=> bm!63488 (= call!63502 call!63496)))

(declare-fun b!1297754 () Bool)

(declare-fun res!862163 () Bool)

(declare-fun e!740481 () Bool)

(assert (=> b!1297754 (=> (not res!862163) (not e!740481))))

(declare-fun minValue!1387 () V!51233)

(declare-fun zeroValue!1387 () V!51233)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!86249 0))(
  ( (array!86250 (arr!41621 (Array (_ BitVec 32) (_ BitVec 64))) (size!42172 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86249)

(declare-fun contains!8172 (ListLongMap!20051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5061 (array!86249 array!86247 (_ BitVec 32) (_ BitVec 32) V!51233 V!51233 (_ BitVec 32) Int) ListLongMap!20051)

(assert (=> b!1297754 (= res!862163 (contains!8172 (getCurrentListMap!5061 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297755 () Bool)

(declare-datatypes ((Unit!42915 0))(
  ( (Unit!42916) )
))
(declare-fun e!740475 () Unit!42915)

(declare-fun lt!580880 () Unit!42915)

(assert (=> b!1297755 (= e!740475 lt!580880)))

(declare-fun lt!580869 () ListLongMap!20051)

(declare-fun call!63493 () ListLongMap!20051)

(assert (=> b!1297755 (= lt!580869 call!63493)))

(declare-fun lt!580884 () Unit!42915)

(declare-fun addStillNotContains!460 (ListLongMap!20051 (_ BitVec 64) V!51233 (_ BitVec 64)) Unit!42915)

(assert (=> b!1297755 (= lt!580884 (addStillNotContains!460 lt!580869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun lt!580878 () ListLongMap!20051)

(declare-fun +!4484 (ListLongMap!20051 tuple2!22386) ListLongMap!20051)

(assert (=> b!1297755 (= lt!580878 (+!4484 lt!580869 (tuple2!22387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun call!63497 () Bool)

(assert (=> b!1297755 (not call!63497)))

(declare-fun lt!580870 () Unit!42915)

(declare-fun call!63500 () Unit!42915)

(assert (=> b!1297755 (= lt!580870 call!63500)))

(assert (=> b!1297755 (not (contains!8172 call!63496 k0!1205))))

(declare-fun lt!580873 () Unit!42915)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!72 ((_ BitVec 64) (_ BitVec 64) V!51233 ListLongMap!20051) Unit!42915)

(assert (=> b!1297755 (= lt!580873 (lemmaInListMapAfterAddingDiffThenInBefore!72 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580878))))

(assert (=> b!1297755 false))

(declare-fun call!63501 () Unit!42915)

(assert (=> b!1297755 (= lt!580880 call!63501)))

(declare-fun lt!580883 () Bool)

(declare-fun call!63495 () Bool)

(assert (=> b!1297755 (= lt!580883 call!63495)))

(declare-fun b!1297756 () Bool)

(declare-fun e!740477 () Unit!42915)

(assert (=> b!1297756 (= e!740475 e!740477)))

(declare-fun c!124794 () Bool)

(declare-fun lt!580881 () Bool)

(assert (=> b!1297756 (= c!124794 (and (not lt!580881) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1297757 () Bool)

(assert (=> b!1297757 (= e!740481 (not true))))

(declare-fun lt!580882 () Unit!42915)

(assert (=> b!1297757 (= lt!580882 e!740475)))

(declare-fun c!124796 () Bool)

(assert (=> b!1297757 (= c!124796 (and (not lt!580881) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1297757 (= lt!580881 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1297757 (not (contains!8172 (ListLongMap!20052 Nil!29548) k0!1205))))

(declare-fun lt!580874 () Unit!42915)

(declare-fun emptyContainsNothing!195 ((_ BitVec 64)) Unit!42915)

(assert (=> b!1297757 (= lt!580874 (emptyContainsNothing!195 k0!1205))))

(declare-fun b!1297758 () Bool)

(declare-fun res!862159 () Bool)

(assert (=> b!1297758 (=> (not res!862159) (not e!740481))))

(assert (=> b!1297758 (= res!862159 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42172 _keys!1741))))))

(declare-fun bm!63489 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6126 (array!86249 array!86247 (_ BitVec 32) (_ BitVec 32) V!51233 V!51233 (_ BitVec 32) Int) ListLongMap!20051)

(assert (=> bm!63489 (= call!63493 (getCurrentListMapNoExtraKeys!6126 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63490 () Bool)

(declare-fun call!63494 () Unit!42915)

(assert (=> bm!63490 (= call!63494 call!63500)))

(declare-fun lt!580876 () ListLongMap!20051)

(declare-fun bm!63491 () Bool)

(declare-fun lt!580879 () ListLongMap!20051)

(assert (=> bm!63491 (= call!63500 (addStillNotContains!460 (ite c!124796 lt!580869 (ite c!124794 lt!580876 lt!580879)) (ite c!124796 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124794 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124796 minValue!1387 (ite c!124794 zeroValue!1387 minValue!1387)) k0!1205))))

(declare-fun bm!63492 () Bool)

(assert (=> bm!63492 (= call!63501 (lemmaInListMapAfterAddingDiffThenInBefore!72 k0!1205 (ite (or c!124796 c!124794) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124796 c!124794) zeroValue!1387 minValue!1387) (ite c!124796 lt!580869 (ite c!124794 lt!580876 lt!580879))))))

(declare-fun bm!63493 () Bool)

(assert (=> bm!63493 (= call!63496 (+!4484 (ite c!124796 lt!580869 (ite c!124794 lt!580876 lt!580879)) (ite c!124796 (tuple2!22387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124794 (tuple2!22387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1297759 () Bool)

(declare-fun res!862158 () Bool)

(assert (=> b!1297759 (=> (not res!862158) (not e!740481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297759 (= res!862158 (not (validKeyInArray!0 (select (arr!41621 _keys!1741) from!2144))))))

(declare-fun b!1297760 () Bool)

(declare-fun res!862165 () Bool)

(assert (=> b!1297760 (=> (not res!862165) (not e!740481))))

(declare-datatypes ((List!29552 0))(
  ( (Nil!29549) (Cons!29548 (h!30766 (_ BitVec 64)) (t!43108 List!29552)) )
))
(declare-fun arrayNoDuplicates!0 (array!86249 (_ BitVec 32) List!29552) Bool)

(assert (=> b!1297760 (= res!862165 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29549))))

(declare-fun b!1297761 () Bool)

(declare-fun e!740476 () Unit!42915)

(declare-fun Unit!42917 () Unit!42915)

(assert (=> b!1297761 (= e!740476 Unit!42917)))

(declare-fun b!1297762 () Bool)

(declare-fun call!63498 () Bool)

(assert (=> b!1297762 call!63498))

(declare-fun lt!580872 () Unit!42915)

(declare-fun call!63499 () Unit!42915)

(assert (=> b!1297762 (= lt!580872 call!63499)))

(declare-fun call!63492 () Bool)

(assert (=> b!1297762 (not call!63492)))

(declare-fun lt!580871 () Unit!42915)

(assert (=> b!1297762 (= lt!580871 call!63494)))

(declare-fun call!63491 () ListLongMap!20051)

(assert (=> b!1297762 (= lt!580876 call!63491)))

(assert (=> b!1297762 (= e!740477 lt!580872)))

(declare-fun b!1297763 () Bool)

(declare-fun c!124795 () Bool)

(assert (=> b!1297763 (= c!124795 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580881))))

(assert (=> b!1297763 (= e!740477 e!740476)))

(declare-fun bm!63494 () Bool)

(assert (=> bm!63494 (= call!63499 call!63501)))

(declare-fun bm!63495 () Bool)

(assert (=> bm!63495 (= call!63491 call!63493)))

(declare-fun bm!63496 () Bool)

(assert (=> bm!63496 (= call!63492 call!63495)))

(declare-fun b!1297764 () Bool)

(declare-fun res!862162 () Bool)

(assert (=> b!1297764 (=> (not res!862162) (not e!740481))))

(assert (=> b!1297764 (= res!862162 (and (= (size!42171 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42172 _keys!1741) (size!42171 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297765 () Bool)

(declare-fun res!862160 () Bool)

(assert (=> b!1297765 (=> (not res!862160) (not e!740481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86249 (_ BitVec 32)) Bool)

(assert (=> b!1297765 (= res!862160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63497 () Bool)

(assert (=> bm!63497 (= call!63498 call!63497)))

(declare-fun b!1297766 () Bool)

(declare-fun lt!580875 () Unit!42915)

(assert (=> b!1297766 (= e!740476 lt!580875)))

(assert (=> b!1297766 (= lt!580879 call!63491)))

(declare-fun lt!580877 () Unit!42915)

(assert (=> b!1297766 (= lt!580877 call!63494)))

(assert (=> b!1297766 (not call!63492)))

(assert (=> b!1297766 (= lt!580875 call!63499)))

(assert (=> b!1297766 call!63498))

(declare-fun b!1297767 () Bool)

(declare-fun res!862164 () Bool)

(assert (=> b!1297767 (=> (not res!862164) (not e!740481))))

(assert (=> b!1297767 (= res!862164 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42172 _keys!1741))))))

(declare-fun mapNonEmpty!53456 () Bool)

(declare-fun tp!101989 () Bool)

(declare-fun e!740480 () Bool)

(assert (=> mapNonEmpty!53456 (= mapRes!53456 (and tp!101989 e!740480))))

(declare-fun mapValue!53456 () ValueCell!16400)

(declare-fun mapKey!53456 () (_ BitVec 32))

(declare-fun mapRest!53456 () (Array (_ BitVec 32) ValueCell!16400))

(assert (=> mapNonEmpty!53456 (= (arr!41620 _values!1445) (store mapRest!53456 mapKey!53456 mapValue!53456))))

(declare-fun res!862161 () Bool)

(assert (=> start!109692 (=> (not res!862161) (not e!740481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109692 (= res!862161 (validMask!0 mask!2175))))

(assert (=> start!109692 e!740481))

(assert (=> start!109692 tp_is_empty!34597))

(assert (=> start!109692 true))

(declare-fun array_inv!31745 (array!86247) Bool)

(assert (=> start!109692 (and (array_inv!31745 _values!1445) e!740479)))

(declare-fun array_inv!31746 (array!86249) Bool)

(assert (=> start!109692 (array_inv!31746 _keys!1741)))

(assert (=> start!109692 tp!101990))

(declare-fun bm!63498 () Bool)

(assert (=> bm!63498 (= call!63495 (contains!8172 (ite c!124796 lt!580869 call!63502) k0!1205))))

(declare-fun mapIsEmpty!53456 () Bool)

(assert (=> mapIsEmpty!53456 mapRes!53456))

(declare-fun bm!63499 () Bool)

(assert (=> bm!63499 (= call!63497 (contains!8172 (ite c!124796 lt!580878 (ite c!124794 lt!580876 lt!580879)) k0!1205))))

(declare-fun b!1297768 () Bool)

(assert (=> b!1297768 (= e!740480 tp_is_empty!34597)))

(assert (= (and start!109692 res!862161) b!1297764))

(assert (= (and b!1297764 res!862162) b!1297765))

(assert (= (and b!1297765 res!862160) b!1297760))

(assert (= (and b!1297760 res!862165) b!1297767))

(assert (= (and b!1297767 res!862164) b!1297754))

(assert (= (and b!1297754 res!862163) b!1297758))

(assert (= (and b!1297758 res!862159) b!1297759))

(assert (= (and b!1297759 res!862158) b!1297757))

(assert (= (and b!1297757 c!124796) b!1297755))

(assert (= (and b!1297757 (not c!124796)) b!1297756))

(assert (= (and b!1297756 c!124794) b!1297762))

(assert (= (and b!1297756 (not c!124794)) b!1297763))

(assert (= (and b!1297763 c!124795) b!1297766))

(assert (= (and b!1297763 (not c!124795)) b!1297761))

(assert (= (or b!1297762 b!1297766) bm!63497))

(assert (= (or b!1297762 b!1297766) bm!63495))

(assert (= (or b!1297762 b!1297766) bm!63488))

(assert (= (or b!1297762 b!1297766) bm!63490))

(assert (= (or b!1297762 b!1297766) bm!63494))

(assert (= (or b!1297762 b!1297766) bm!63496))

(assert (= (or b!1297755 bm!63496) bm!63498))

(assert (= (or b!1297755 bm!63494) bm!63492))

(assert (= (or b!1297755 bm!63497) bm!63499))

(assert (= (or b!1297755 bm!63490) bm!63491))

(assert (= (or b!1297755 bm!63488) bm!63493))

(assert (= (or b!1297755 bm!63495) bm!63489))

(assert (= (and b!1297753 condMapEmpty!53456) mapIsEmpty!53456))

(assert (= (and b!1297753 (not condMapEmpty!53456)) mapNonEmpty!53456))

(get-info :version)

(assert (= (and mapNonEmpty!53456 ((_ is ValueCellFull!16400) mapValue!53456)) b!1297768))

(assert (= (and b!1297753 ((_ is ValueCellFull!16400) mapDefault!53456)) b!1297752))

(assert (= start!109692 b!1297753))

(declare-fun m!1189953 () Bool)

(assert (=> b!1297760 m!1189953))

(declare-fun m!1189955 () Bool)

(assert (=> b!1297755 m!1189955))

(declare-fun m!1189957 () Bool)

(assert (=> b!1297755 m!1189957))

(declare-fun m!1189959 () Bool)

(assert (=> b!1297755 m!1189959))

(declare-fun m!1189961 () Bool)

(assert (=> b!1297755 m!1189961))

(declare-fun m!1189963 () Bool)

(assert (=> bm!63499 m!1189963))

(declare-fun m!1189965 () Bool)

(assert (=> bm!63493 m!1189965))

(declare-fun m!1189967 () Bool)

(assert (=> mapNonEmpty!53456 m!1189967))

(declare-fun m!1189969 () Bool)

(assert (=> b!1297759 m!1189969))

(assert (=> b!1297759 m!1189969))

(declare-fun m!1189971 () Bool)

(assert (=> b!1297759 m!1189971))

(declare-fun m!1189973 () Bool)

(assert (=> bm!63498 m!1189973))

(declare-fun m!1189975 () Bool)

(assert (=> b!1297757 m!1189975))

(declare-fun m!1189977 () Bool)

(assert (=> b!1297757 m!1189977))

(declare-fun m!1189979 () Bool)

(assert (=> b!1297754 m!1189979))

(assert (=> b!1297754 m!1189979))

(declare-fun m!1189981 () Bool)

(assert (=> b!1297754 m!1189981))

(declare-fun m!1189983 () Bool)

(assert (=> bm!63492 m!1189983))

(declare-fun m!1189985 () Bool)

(assert (=> start!109692 m!1189985))

(declare-fun m!1189987 () Bool)

(assert (=> start!109692 m!1189987))

(declare-fun m!1189989 () Bool)

(assert (=> start!109692 m!1189989))

(declare-fun m!1189991 () Bool)

(assert (=> bm!63489 m!1189991))

(declare-fun m!1189993 () Bool)

(assert (=> bm!63491 m!1189993))

(declare-fun m!1189995 () Bool)

(assert (=> b!1297765 m!1189995))

(check-sat (not b!1297760) (not b!1297757) (not b!1297765) (not mapNonEmpty!53456) (not b_next!28957) (not bm!63491) (not bm!63498) (not b!1297754) tp_is_empty!34597 (not bm!63489) (not start!109692) b_and!47049 (not bm!63492) (not b!1297755) (not bm!63493) (not bm!63499) (not b!1297759))
(check-sat b_and!47049 (not b_next!28957))
