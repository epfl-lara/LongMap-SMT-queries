; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109816 () Bool)

(assert start!109816)

(declare-fun b_free!29209 () Bool)

(declare-fun b_next!29209 () Bool)

(assert (=> start!109816 (= b_free!29209 (not b_next!29209))))

(declare-fun tp!102761 () Bool)

(declare-fun b_and!47305 () Bool)

(assert (=> start!109816 (= tp!102761 b_and!47305)))

(declare-fun b!1300997 () Bool)

(declare-fun e!742082 () Bool)

(declare-fun e!742077 () Bool)

(declare-fun mapRes!53849 () Bool)

(assert (=> b!1300997 (= e!742082 (and e!742077 mapRes!53849))))

(declare-fun condMapEmpty!53849 () Bool)

(declare-datatypes ((V!51569 0))(
  ( (V!51570 (val!17499 Int)) )
))
(declare-datatypes ((ValueCell!16526 0))(
  ( (ValueCellFull!16526 (v!20106 V!51569)) (EmptyCell!16526) )
))
(declare-datatypes ((array!86609 0))(
  ( (array!86610 (arr!41801 (Array (_ BitVec 32) ValueCell!16526)) (size!42353 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86609)

(declare-fun mapDefault!53849 () ValueCell!16526)

(assert (=> b!1300997 (= condMapEmpty!53849 (= (arr!41801 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16526)) mapDefault!53849)))))

(declare-fun b!1300998 () Bool)

(declare-fun res!864459 () Bool)

(declare-fun e!742078 () Bool)

(assert (=> b!1300998 (=> (not res!864459) (not e!742078))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86611 0))(
  ( (array!86612 (arr!41802 (Array (_ BitVec 32) (_ BitVec 64))) (size!42354 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86611)

(assert (=> b!1300998 (= res!864459 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42354 _keys!1741))))))

(declare-fun b!1300999 () Bool)

(declare-datatypes ((Unit!42900 0))(
  ( (Unit!42901) )
))
(declare-fun e!742079 () Unit!42900)

(declare-fun lt!581552 () Unit!42900)

(assert (=> b!1300999 (= e!742079 lt!581552)))

(declare-datatypes ((tuple2!22626 0))(
  ( (tuple2!22627 (_1!11324 (_ BitVec 64)) (_2!11324 V!51569)) )
))
(declare-datatypes ((List!29744 0))(
  ( (Nil!29741) (Cons!29740 (h!30949 tuple2!22626) (t!43310 List!29744)) )
))
(declare-datatypes ((ListLongMap!20283 0))(
  ( (ListLongMap!20284 (toList!10157 List!29744)) )
))
(declare-fun lt!581544 () ListLongMap!20283)

(declare-fun call!63817 () ListLongMap!20283)

(assert (=> b!1300999 (= lt!581544 call!63817)))

(declare-fun lt!581550 () ListLongMap!20283)

(declare-fun zeroValue!1387 () V!51569)

(declare-fun +!4496 (ListLongMap!20283 tuple2!22626) ListLongMap!20283)

(assert (=> b!1300999 (= lt!581550 (+!4496 lt!581544 (tuple2!22627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581554 () Unit!42900)

(declare-fun call!63816 () Unit!42900)

(assert (=> b!1300999 (= lt!581554 call!63816)))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8213 (ListLongMap!20283 (_ BitVec 64)) Bool)

(assert (=> b!1300999 (contains!8213 lt!581550 k0!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!80 ((_ BitVec 64) (_ BitVec 64) V!51569 ListLongMap!20283) Unit!42900)

(assert (=> b!1300999 (= lt!581552 (lemmaInListMapAfterAddingDiffThenInBefore!80 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581544))))

(declare-fun call!63819 () Bool)

(assert (=> b!1300999 call!63819))

(declare-fun bm!63813 () Bool)

(declare-fun call!63821 () Bool)

(assert (=> bm!63813 (= call!63821 call!63819)))

(declare-fun b!1301000 () Bool)

(declare-fun c!124671 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!581545 () Bool)

(assert (=> b!1301000 (= c!124671 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581545))))

(declare-fun e!742076 () Unit!42900)

(declare-fun e!742081 () Unit!42900)

(assert (=> b!1301000 (= e!742076 e!742081)))

(declare-fun b!1301001 () Bool)

(declare-fun res!864462 () Bool)

(assert (=> b!1301001 (=> (not res!864462) (not e!742078))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86611 (_ BitVec 32)) Bool)

(assert (=> b!1301001 (= res!864462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53849 () Bool)

(assert (=> mapIsEmpty!53849 mapRes!53849))

(declare-fun b!1301002 () Bool)

(declare-fun Unit!42902 () Unit!42900)

(assert (=> b!1301002 (= e!742081 Unit!42902)))

(declare-fun b!1301003 () Bool)

(declare-fun res!864463 () Bool)

(assert (=> b!1301003 (=> (not res!864463) (not e!742078))))

(declare-fun minValue!1387 () V!51569)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5068 (array!86611 array!86609 (_ BitVec 32) (_ BitVec 32) V!51569 V!51569 (_ BitVec 32) Int) ListLongMap!20283)

(assert (=> b!1301003 (= res!864463 (contains!8213 (getCurrentListMap!5068 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301004 () Bool)

(declare-fun tp_is_empty!34849 () Bool)

(assert (=> b!1301004 (= e!742077 tp_is_empty!34849)))

(declare-fun b!1301005 () Bool)

(assert (=> b!1301005 (= e!742079 e!742076)))

(declare-fun c!124670 () Bool)

(assert (=> b!1301005 (= c!124670 (and (not lt!581545) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301006 () Bool)

(declare-fun lt!581548 () Unit!42900)

(assert (=> b!1301006 (= e!742081 lt!581548)))

(declare-fun lt!581551 () ListLongMap!20283)

(declare-fun call!63818 () ListLongMap!20283)

(assert (=> b!1301006 (= lt!581551 call!63818)))

(declare-fun call!63820 () Unit!42900)

(assert (=> b!1301006 (= lt!581548 call!63820)))

(assert (=> b!1301006 call!63821))

(declare-fun bm!63814 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6128 (array!86611 array!86609 (_ BitVec 32) (_ BitVec 32) V!51569 V!51569 (_ BitVec 32) Int) ListLongMap!20283)

(assert (=> bm!63814 (= call!63817 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301007 () Bool)

(assert (=> b!1301007 (= e!742078 (not (or (= k0!1205 (select (arr!41802 _keys!1741) from!2144)) (not (= (select (arr!41802 _keys!1741) from!2144) k0!1205)))))))

(assert (=> b!1301007 (not (contains!8213 (ListLongMap!20284 Nil!29741) k0!1205))))

(declare-fun lt!581549 () Unit!42900)

(declare-fun emptyContainsNothing!195 ((_ BitVec 64)) Unit!42900)

(assert (=> b!1301007 (= lt!581549 (emptyContainsNothing!195 k0!1205))))

(declare-fun lt!581546 () Unit!42900)

(assert (=> b!1301007 (= lt!581546 e!742079)))

(declare-fun c!124672 () Bool)

(assert (=> b!1301007 (= c!124672 (and (not lt!581545) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301007 (= lt!581545 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301008 () Bool)

(declare-fun res!864457 () Bool)

(assert (=> b!1301008 (=> (not res!864457) (not e!742078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301008 (= res!864457 (validKeyInArray!0 (select (arr!41802 _keys!1741) from!2144)))))

(declare-fun res!864464 () Bool)

(assert (=> start!109816 (=> (not res!864464) (not e!742078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109816 (= res!864464 (validMask!0 mask!2175))))

(assert (=> start!109816 e!742078))

(assert (=> start!109816 tp_is_empty!34849))

(assert (=> start!109816 true))

(declare-fun array_inv!31797 (array!86609) Bool)

(assert (=> start!109816 (and (array_inv!31797 _values!1445) e!742082)))

(declare-fun array_inv!31798 (array!86611) Bool)

(assert (=> start!109816 (array_inv!31798 _keys!1741)))

(assert (=> start!109816 tp!102761))

(declare-fun b!1301009 () Bool)

(declare-fun res!864460 () Bool)

(assert (=> b!1301009 (=> (not res!864460) (not e!742078))))

(assert (=> b!1301009 (= res!864460 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42354 _keys!1741))))))

(declare-fun bm!63815 () Bool)

(declare-fun lt!581553 () ListLongMap!20283)

(assert (=> bm!63815 (= call!63819 (contains!8213 (ite c!124672 lt!581544 (ite c!124670 lt!581553 lt!581551)) k0!1205))))

(declare-fun bm!63816 () Bool)

(assert (=> bm!63816 (= call!63816 (lemmaInListMapAfterAddingDiffThenInBefore!80 k0!1205 (ite c!124672 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124670 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124672 minValue!1387 (ite c!124670 zeroValue!1387 minValue!1387)) (ite c!124672 lt!581550 (ite c!124670 lt!581553 lt!581551))))))

(declare-fun b!1301010 () Bool)

(declare-fun res!864461 () Bool)

(assert (=> b!1301010 (=> (not res!864461) (not e!742078))))

(declare-datatypes ((List!29745 0))(
  ( (Nil!29742) (Cons!29741 (h!30950 (_ BitVec 64)) (t!43311 List!29745)) )
))
(declare-fun arrayNoDuplicates!0 (array!86611 (_ BitVec 32) List!29745) Bool)

(assert (=> b!1301010 (= res!864461 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29742))))

(declare-fun bm!63817 () Bool)

(assert (=> bm!63817 (= call!63820 call!63816)))

(declare-fun b!1301011 () Bool)

(assert (=> b!1301011 call!63821))

(declare-fun lt!581547 () Unit!42900)

(assert (=> b!1301011 (= lt!581547 call!63820)))

(assert (=> b!1301011 (= lt!581553 call!63818)))

(assert (=> b!1301011 (= e!742076 lt!581547)))

(declare-fun bm!63818 () Bool)

(assert (=> bm!63818 (= call!63818 call!63817)))

(declare-fun mapNonEmpty!53849 () Bool)

(declare-fun tp!102762 () Bool)

(declare-fun e!742080 () Bool)

(assert (=> mapNonEmpty!53849 (= mapRes!53849 (and tp!102762 e!742080))))

(declare-fun mapValue!53849 () ValueCell!16526)

(declare-fun mapRest!53849 () (Array (_ BitVec 32) ValueCell!16526))

(declare-fun mapKey!53849 () (_ BitVec 32))

(assert (=> mapNonEmpty!53849 (= (arr!41801 _values!1445) (store mapRest!53849 mapKey!53849 mapValue!53849))))

(declare-fun b!1301012 () Bool)

(assert (=> b!1301012 (= e!742080 tp_is_empty!34849)))

(declare-fun b!1301013 () Bool)

(declare-fun res!864458 () Bool)

(assert (=> b!1301013 (=> (not res!864458) (not e!742078))))

(assert (=> b!1301013 (= res!864458 (and (= (size!42353 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42354 _keys!1741) (size!42353 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109816 res!864464) b!1301013))

(assert (= (and b!1301013 res!864458) b!1301001))

(assert (= (and b!1301001 res!864462) b!1301010))

(assert (= (and b!1301010 res!864461) b!1300998))

(assert (= (and b!1300998 res!864459) b!1301003))

(assert (= (and b!1301003 res!864463) b!1301009))

(assert (= (and b!1301009 res!864460) b!1301008))

(assert (= (and b!1301008 res!864457) b!1301007))

(assert (= (and b!1301007 c!124672) b!1300999))

(assert (= (and b!1301007 (not c!124672)) b!1301005))

(assert (= (and b!1301005 c!124670) b!1301011))

(assert (= (and b!1301005 (not c!124670)) b!1301000))

(assert (= (and b!1301000 c!124671) b!1301006))

(assert (= (and b!1301000 (not c!124671)) b!1301002))

(assert (= (or b!1301011 b!1301006) bm!63818))

(assert (= (or b!1301011 b!1301006) bm!63817))

(assert (= (or b!1301011 b!1301006) bm!63813))

(assert (= (or b!1300999 bm!63818) bm!63814))

(assert (= (or b!1300999 bm!63817) bm!63816))

(assert (= (or b!1300999 bm!63813) bm!63815))

(assert (= (and b!1300997 condMapEmpty!53849) mapIsEmpty!53849))

(assert (= (and b!1300997 (not condMapEmpty!53849)) mapNonEmpty!53849))

(get-info :version)

(assert (= (and mapNonEmpty!53849 ((_ is ValueCellFull!16526) mapValue!53849)) b!1301012))

(assert (= (and b!1300997 ((_ is ValueCellFull!16526) mapDefault!53849)) b!1301004))

(assert (= start!109816 b!1300997))

(declare-fun m!1191305 () Bool)

(assert (=> bm!63816 m!1191305))

(declare-fun m!1191307 () Bool)

(assert (=> b!1301010 m!1191307))

(declare-fun m!1191309 () Bool)

(assert (=> b!1300999 m!1191309))

(declare-fun m!1191311 () Bool)

(assert (=> b!1300999 m!1191311))

(declare-fun m!1191313 () Bool)

(assert (=> b!1300999 m!1191313))

(declare-fun m!1191315 () Bool)

(assert (=> b!1301008 m!1191315))

(assert (=> b!1301008 m!1191315))

(declare-fun m!1191317 () Bool)

(assert (=> b!1301008 m!1191317))

(declare-fun m!1191319 () Bool)

(assert (=> bm!63815 m!1191319))

(declare-fun m!1191321 () Bool)

(assert (=> start!109816 m!1191321))

(declare-fun m!1191323 () Bool)

(assert (=> start!109816 m!1191323))

(declare-fun m!1191325 () Bool)

(assert (=> start!109816 m!1191325))

(declare-fun m!1191327 () Bool)

(assert (=> b!1301001 m!1191327))

(declare-fun m!1191329 () Bool)

(assert (=> b!1301003 m!1191329))

(assert (=> b!1301003 m!1191329))

(declare-fun m!1191331 () Bool)

(assert (=> b!1301003 m!1191331))

(declare-fun m!1191333 () Bool)

(assert (=> mapNonEmpty!53849 m!1191333))

(assert (=> b!1301007 m!1191315))

(declare-fun m!1191335 () Bool)

(assert (=> b!1301007 m!1191335))

(declare-fun m!1191337 () Bool)

(assert (=> b!1301007 m!1191337))

(declare-fun m!1191339 () Bool)

(assert (=> bm!63814 m!1191339))

(check-sat (not bm!63815) (not b_next!29209) (not b!1301001) (not b!1301007) (not start!109816) (not b!1300999) b_and!47305 (not b!1301003) (not mapNonEmpty!53849) (not b!1301010) (not b!1301008) (not bm!63814) tp_is_empty!34849 (not bm!63816))
(check-sat b_and!47305 (not b_next!29209))
