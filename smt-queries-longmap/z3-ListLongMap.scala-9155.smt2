; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109812 () Bool)

(assert start!109812)

(declare-fun b_free!29205 () Bool)

(declare-fun b_next!29205 () Bool)

(assert (=> start!109812 (= b_free!29205 (not b_next!29205))))

(declare-fun tp!102749 () Bool)

(declare-fun b_and!47319 () Bool)

(assert (=> start!109812 (= tp!102749 b_and!47319)))

(declare-fun b!1300959 () Bool)

(declare-fun res!864441 () Bool)

(declare-fun e!742057 () Bool)

(assert (=> b!1300959 (=> (not res!864441) (not e!742057))))

(declare-datatypes ((array!86702 0))(
  ( (array!86703 (arr!41847 (Array (_ BitVec 32) (_ BitVec 64))) (size!42397 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86702)

(declare-datatypes ((List!29700 0))(
  ( (Nil!29697) (Cons!29696 (h!30905 (_ BitVec 64)) (t!43274 List!29700)) )
))
(declare-fun arrayNoDuplicates!0 (array!86702 (_ BitVec 32) List!29700) Bool)

(assert (=> b!1300959 (= res!864441 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29697))))

(declare-fun res!864436 () Bool)

(assert (=> start!109812 (=> (not res!864436) (not e!742057))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109812 (= res!864436 (validMask!0 mask!2175))))

(assert (=> start!109812 e!742057))

(declare-fun tp_is_empty!34845 () Bool)

(assert (=> start!109812 tp_is_empty!34845))

(assert (=> start!109812 true))

(declare-datatypes ((V!51563 0))(
  ( (V!51564 (val!17497 Int)) )
))
(declare-datatypes ((ValueCell!16524 0))(
  ( (ValueCellFull!16524 (v!20105 V!51563)) (EmptyCell!16524) )
))
(declare-datatypes ((array!86704 0))(
  ( (array!86705 (arr!41848 (Array (_ BitVec 32) ValueCell!16524)) (size!42398 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86704)

(declare-fun e!742064 () Bool)

(declare-fun array_inv!31659 (array!86704) Bool)

(assert (=> start!109812 (and (array_inv!31659 _values!1445) e!742064)))

(declare-fun array_inv!31660 (array!86702) Bool)

(assert (=> start!109812 (array_inv!31660 _keys!1741)))

(assert (=> start!109812 tp!102749))

(declare-fun minValue!1387 () V!51563)

(declare-fun zeroValue!1387 () V!51563)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!63796 () Bool)

(declare-datatypes ((tuple2!22570 0))(
  ( (tuple2!22571 (_1!11296 (_ BitVec 64)) (_2!11296 V!51563)) )
))
(declare-datatypes ((List!29701 0))(
  ( (Nil!29698) (Cons!29697 (h!30906 tuple2!22570) (t!43275 List!29701)) )
))
(declare-datatypes ((ListLongMap!20227 0))(
  ( (ListLongMap!20228 (toList!10129 List!29701)) )
))
(declare-fun call!63803 () ListLongMap!20227)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6088 (array!86702 array!86704 (_ BitVec 32) (_ BitVec 32) V!51563 V!51563 (_ BitVec 32) Int) ListLongMap!20227)

(assert (=> bm!63796 (= call!63803 (getCurrentListMapNoExtraKeys!6088 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300960 () Bool)

(declare-fun res!864438 () Bool)

(assert (=> b!1300960 (=> (not res!864438) (not e!742057))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8255 (ListLongMap!20227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5154 (array!86702 array!86704 (_ BitVec 32) (_ BitVec 32) V!51563 V!51563 (_ BitVec 32) Int) ListLongMap!20227)

(assert (=> b!1300960 (= res!864438 (contains!8255 (getCurrentListMap!5154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300961 () Bool)

(declare-datatypes ((Unit!43054 0))(
  ( (Unit!43055) )
))
(declare-fun e!742059 () Unit!43054)

(declare-fun lt!581658 () Unit!43054)

(assert (=> b!1300961 (= e!742059 lt!581658)))

(declare-fun lt!581659 () ListLongMap!20227)

(assert (=> b!1300961 (= lt!581659 call!63803)))

(declare-fun lt!581661 () ListLongMap!20227)

(declare-fun +!4456 (ListLongMap!20227 tuple2!22570) ListLongMap!20227)

(assert (=> b!1300961 (= lt!581661 (+!4456 lt!581659 (tuple2!22571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581665 () Unit!43054)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!79 ((_ BitVec 64) (_ BitVec 64) V!51563 ListLongMap!20227) Unit!43054)

(assert (=> b!1300961 (= lt!581665 (lemmaInListMapAfterAddingDiffThenInBefore!79 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581661))))

(declare-fun call!63799 () Bool)

(assert (=> b!1300961 call!63799))

(declare-fun call!63802 () Unit!43054)

(assert (=> b!1300961 (= lt!581658 call!63802)))

(assert (=> b!1300961 (contains!8255 lt!581659 k0!1205)))

(declare-fun b!1300962 () Bool)

(declare-fun res!864440 () Bool)

(assert (=> b!1300962 (=> (not res!864440) (not e!742057))))

(assert (=> b!1300962 (= res!864440 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42397 _keys!1741))))))

(declare-fun b!1300963 () Bool)

(declare-fun call!63801 () Bool)

(assert (=> b!1300963 call!63801))

(declare-fun lt!581656 () Unit!43054)

(declare-fun call!63804 () Unit!43054)

(assert (=> b!1300963 (= lt!581656 call!63804)))

(declare-fun lt!581666 () ListLongMap!20227)

(declare-fun call!63800 () ListLongMap!20227)

(assert (=> b!1300963 (= lt!581666 call!63800)))

(declare-fun e!742060 () Unit!43054)

(assert (=> b!1300963 (= e!742060 lt!581656)))

(declare-fun bm!63797 () Bool)

(assert (=> bm!63797 (= call!63800 call!63803)))

(declare-fun mapNonEmpty!53843 () Bool)

(declare-fun mapRes!53843 () Bool)

(declare-fun tp!102748 () Bool)

(declare-fun e!742063 () Bool)

(assert (=> mapNonEmpty!53843 (= mapRes!53843 (and tp!102748 e!742063))))

(declare-fun mapValue!53843 () ValueCell!16524)

(declare-fun mapKey!53843 () (_ BitVec 32))

(declare-fun mapRest!53843 () (Array (_ BitVec 32) ValueCell!16524))

(assert (=> mapNonEmpty!53843 (= (arr!41848 _values!1445) (store mapRest!53843 mapKey!53843 mapValue!53843))))

(declare-fun c!124669 () Bool)

(declare-fun bm!63798 () Bool)

(declare-fun c!124670 () Bool)

(declare-fun lt!581662 () ListLongMap!20227)

(assert (=> bm!63798 (= call!63802 (lemmaInListMapAfterAddingDiffThenInBefore!79 k0!1205 (ite (or c!124669 c!124670) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124669 c!124670) zeroValue!1387 minValue!1387) (ite c!124669 lt!581659 (ite c!124670 lt!581666 lt!581662))))))

(declare-fun b!1300964 () Bool)

(declare-fun res!864443 () Bool)

(assert (=> b!1300964 (=> (not res!864443) (not e!742057))))

(assert (=> b!1300964 (= res!864443 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42397 _keys!1741))))))

(declare-fun b!1300965 () Bool)

(declare-fun e!742062 () Unit!43054)

(declare-fun lt!581660 () Unit!43054)

(assert (=> b!1300965 (= e!742062 lt!581660)))

(assert (=> b!1300965 (= lt!581662 call!63800)))

(assert (=> b!1300965 (= lt!581660 call!63804)))

(assert (=> b!1300965 call!63801))

(declare-fun bm!63799 () Bool)

(assert (=> bm!63799 (= call!63799 (contains!8255 (ite c!124669 lt!581661 (ite c!124670 lt!581666 lt!581662)) k0!1205))))

(declare-fun bm!63800 () Bool)

(assert (=> bm!63800 (= call!63804 call!63802)))

(declare-fun b!1300966 () Bool)

(declare-fun c!124668 () Bool)

(declare-fun lt!581657 () Bool)

(assert (=> b!1300966 (= c!124668 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581657))))

(assert (=> b!1300966 (= e!742060 e!742062)))

(declare-fun b!1300967 () Bool)

(assert (=> b!1300967 (= e!742057 (not (or (= k0!1205 (select (arr!41847 _keys!1741) from!2144)) (bvslt from!2144 (size!42398 _values!1445)))))))

(assert (=> b!1300967 (not (contains!8255 (ListLongMap!20228 Nil!29698) k0!1205))))

(declare-fun lt!581663 () Unit!43054)

(declare-fun emptyContainsNothing!197 ((_ BitVec 64)) Unit!43054)

(assert (=> b!1300967 (= lt!581663 (emptyContainsNothing!197 k0!1205))))

(declare-fun lt!581664 () Unit!43054)

(assert (=> b!1300967 (= lt!581664 e!742059)))

(assert (=> b!1300967 (= c!124669 (and (not lt!581657) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300967 (= lt!581657 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1300968 () Bool)

(declare-fun res!864437 () Bool)

(assert (=> b!1300968 (=> (not res!864437) (not e!742057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86702 (_ BitVec 32)) Bool)

(assert (=> b!1300968 (= res!864437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63801 () Bool)

(assert (=> bm!63801 (= call!63801 call!63799)))

(declare-fun b!1300969 () Bool)

(declare-fun res!864442 () Bool)

(assert (=> b!1300969 (=> (not res!864442) (not e!742057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300969 (= res!864442 (validKeyInArray!0 (select (arr!41847 _keys!1741) from!2144)))))

(declare-fun b!1300970 () Bool)

(assert (=> b!1300970 (= e!742063 tp_is_empty!34845)))

(declare-fun b!1300971 () Bool)

(declare-fun Unit!43056 () Unit!43054)

(assert (=> b!1300971 (= e!742062 Unit!43056)))

(declare-fun b!1300972 () Bool)

(declare-fun res!864439 () Bool)

(assert (=> b!1300972 (=> (not res!864439) (not e!742057))))

(assert (=> b!1300972 (= res!864439 (and (= (size!42398 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42397 _keys!1741) (size!42398 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53843 () Bool)

(assert (=> mapIsEmpty!53843 mapRes!53843))

(declare-fun b!1300973 () Bool)

(declare-fun e!742061 () Bool)

(assert (=> b!1300973 (= e!742064 (and e!742061 mapRes!53843))))

(declare-fun condMapEmpty!53843 () Bool)

(declare-fun mapDefault!53843 () ValueCell!16524)

(assert (=> b!1300973 (= condMapEmpty!53843 (= (arr!41848 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16524)) mapDefault!53843)))))

(declare-fun b!1300974 () Bool)

(assert (=> b!1300974 (= e!742059 e!742060)))

(assert (=> b!1300974 (= c!124670 (and (not lt!581657) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300975 () Bool)

(assert (=> b!1300975 (= e!742061 tp_is_empty!34845)))

(assert (= (and start!109812 res!864436) b!1300972))

(assert (= (and b!1300972 res!864439) b!1300968))

(assert (= (and b!1300968 res!864437) b!1300959))

(assert (= (and b!1300959 res!864441) b!1300964))

(assert (= (and b!1300964 res!864443) b!1300960))

(assert (= (and b!1300960 res!864438) b!1300962))

(assert (= (and b!1300962 res!864440) b!1300969))

(assert (= (and b!1300969 res!864442) b!1300967))

(assert (= (and b!1300967 c!124669) b!1300961))

(assert (= (and b!1300967 (not c!124669)) b!1300974))

(assert (= (and b!1300974 c!124670) b!1300963))

(assert (= (and b!1300974 (not c!124670)) b!1300966))

(assert (= (and b!1300966 c!124668) b!1300965))

(assert (= (and b!1300966 (not c!124668)) b!1300971))

(assert (= (or b!1300963 b!1300965) bm!63797))

(assert (= (or b!1300963 b!1300965) bm!63800))

(assert (= (or b!1300963 b!1300965) bm!63801))

(assert (= (or b!1300961 bm!63797) bm!63796))

(assert (= (or b!1300961 bm!63800) bm!63798))

(assert (= (or b!1300961 bm!63801) bm!63799))

(assert (= (and b!1300973 condMapEmpty!53843) mapIsEmpty!53843))

(assert (= (and b!1300973 (not condMapEmpty!53843)) mapNonEmpty!53843))

(get-info :version)

(assert (= (and mapNonEmpty!53843 ((_ is ValueCellFull!16524) mapValue!53843)) b!1300970))

(assert (= (and b!1300973 ((_ is ValueCellFull!16524) mapDefault!53843)) b!1300975))

(assert (= start!109812 b!1300973))

(declare-fun m!1191733 () Bool)

(assert (=> b!1300961 m!1191733))

(declare-fun m!1191735 () Bool)

(assert (=> b!1300961 m!1191735))

(declare-fun m!1191737 () Bool)

(assert (=> b!1300961 m!1191737))

(declare-fun m!1191739 () Bool)

(assert (=> b!1300968 m!1191739))

(declare-fun m!1191741 () Bool)

(assert (=> bm!63798 m!1191741))

(declare-fun m!1191743 () Bool)

(assert (=> b!1300967 m!1191743))

(declare-fun m!1191745 () Bool)

(assert (=> b!1300967 m!1191745))

(declare-fun m!1191747 () Bool)

(assert (=> b!1300967 m!1191747))

(declare-fun m!1191749 () Bool)

(assert (=> start!109812 m!1191749))

(declare-fun m!1191751 () Bool)

(assert (=> start!109812 m!1191751))

(declare-fun m!1191753 () Bool)

(assert (=> start!109812 m!1191753))

(declare-fun m!1191755 () Bool)

(assert (=> b!1300960 m!1191755))

(assert (=> b!1300960 m!1191755))

(declare-fun m!1191757 () Bool)

(assert (=> b!1300960 m!1191757))

(declare-fun m!1191759 () Bool)

(assert (=> mapNonEmpty!53843 m!1191759))

(assert (=> b!1300969 m!1191743))

(assert (=> b!1300969 m!1191743))

(declare-fun m!1191761 () Bool)

(assert (=> b!1300969 m!1191761))

(declare-fun m!1191763 () Bool)

(assert (=> bm!63796 m!1191763))

(declare-fun m!1191765 () Bool)

(assert (=> bm!63799 m!1191765))

(declare-fun m!1191767 () Bool)

(assert (=> b!1300959 m!1191767))

(check-sat (not bm!63796) (not bm!63798) (not b!1300961) (not b!1300960) (not b_next!29205) (not mapNonEmpty!53843) (not start!109812) tp_is_empty!34845 (not b!1300969) (not b!1300967) (not bm!63799) (not b!1300968) (not b!1300959) b_and!47319)
(check-sat b_and!47319 (not b_next!29205))
