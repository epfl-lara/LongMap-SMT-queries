; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109896 () Bool)

(assert start!109896)

(declare-fun b_free!29221 () Bool)

(declare-fun b_next!29221 () Bool)

(assert (=> start!109896 (= b_free!29221 (not b_next!29221))))

(declare-fun tp!102801 () Bool)

(declare-fun b_and!47333 () Bool)

(assert (=> start!109896 (= tp!102801 b_and!47333)))

(declare-datatypes ((V!51585 0))(
  ( (V!51586 (val!17505 Int)) )
))
(declare-fun minValue!1387 () V!51585)

(declare-fun zeroValue!1387 () V!51585)

(declare-fun bm!63966 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((tuple2!22638 0))(
  ( (tuple2!22639 (_1!11330 (_ BitVec 64)) (_2!11330 V!51585)) )
))
(declare-datatypes ((List!29754 0))(
  ( (Nil!29751) (Cons!29750 (h!30959 tuple2!22638) (t!43328 List!29754)) )
))
(declare-datatypes ((ListLongMap!20295 0))(
  ( (ListLongMap!20296 (toList!10163 List!29754)) )
))
(declare-fun call!63971 () ListLongMap!20295)

(declare-datatypes ((ValueCell!16532 0))(
  ( (ValueCellFull!16532 (v!20115 V!51585)) (EmptyCell!16532) )
))
(declare-datatypes ((array!86635 0))(
  ( (array!86636 (arr!41813 (Array (_ BitVec 32) ValueCell!16532)) (size!42365 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86635)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86637 0))(
  ( (array!86638 (arr!41814 (Array (_ BitVec 32) (_ BitVec 64))) (size!42366 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86637)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6133 (array!86637 array!86635 (_ BitVec 32) (_ BitVec 32) V!51585 V!51585 (_ BitVec 32) Int) ListLongMap!20295)

(assert (=> bm!63966 (= call!63971 (getCurrentListMapNoExtraKeys!6133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!864792 () Bool)

(declare-fun e!742494 () Bool)

(assert (=> start!109896 (=> (not res!864792) (not e!742494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109896 (= res!864792 (validMask!0 mask!2175))))

(assert (=> start!109896 e!742494))

(declare-fun tp_is_empty!34861 () Bool)

(assert (=> start!109896 tp_is_empty!34861))

(assert (=> start!109896 true))

(declare-fun e!742499 () Bool)

(declare-fun array_inv!31805 (array!86635) Bool)

(assert (=> start!109896 (and (array_inv!31805 _values!1445) e!742499)))

(declare-fun array_inv!31806 (array!86637) Bool)

(assert (=> start!109896 (array_inv!31806 _keys!1741)))

(assert (=> start!109896 tp!102801))

(declare-fun mapNonEmpty!53871 () Bool)

(declare-fun mapRes!53871 () Bool)

(declare-fun tp!102802 () Bool)

(declare-fun e!742501 () Bool)

(assert (=> mapNonEmpty!53871 (= mapRes!53871 (and tp!102802 e!742501))))

(declare-fun mapKey!53871 () (_ BitVec 32))

(declare-fun mapValue!53871 () ValueCell!16532)

(declare-fun mapRest!53871 () (Array (_ BitVec 32) ValueCell!16532))

(assert (=> mapNonEmpty!53871 (= (arr!41813 _values!1445) (store mapRest!53871 mapKey!53871 mapValue!53871))))

(declare-fun b!1301730 () Bool)

(declare-fun e!742497 () Bool)

(assert (=> b!1301730 (= e!742497 true)))

(declare-fun lt!582053 () V!51585)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8221 (ListLongMap!20295 (_ BitVec 64)) Bool)

(declare-fun +!4501 (ListLongMap!20295 tuple2!22638) ListLongMap!20295)

(assert (=> b!1301730 (not (contains!8221 (+!4501 (ListLongMap!20296 Nil!29751) (tuple2!22639 (select (arr!41814 _keys!1741) from!2144) lt!582053)) k0!1205))))

(declare-datatypes ((Unit!42933 0))(
  ( (Unit!42934) )
))
(declare-fun lt!582054 () Unit!42933)

(declare-fun addStillNotContains!456 (ListLongMap!20295 (_ BitVec 64) V!51585 (_ BitVec 64)) Unit!42933)

(assert (=> b!1301730 (= lt!582054 (addStillNotContains!456 (ListLongMap!20296 Nil!29751) (select (arr!41814 _keys!1741) from!2144) lt!582053 k0!1205))))

(declare-fun get!21142 (ValueCell!16532 V!51585) V!51585)

(declare-fun dynLambda!3448 (Int (_ BitVec 64)) V!51585)

(assert (=> b!1301730 (= lt!582053 (get!21142 (select (arr!41813 _values!1445) from!2144) (dynLambda!3448 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301731 () Bool)

(declare-fun res!864794 () Bool)

(assert (=> b!1301731 (=> (not res!864794) (not e!742494))))

(assert (=> b!1301731 (= res!864794 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42366 _keys!1741))))))

(declare-fun b!1301732 () Bool)

(declare-fun e!742498 () Bool)

(assert (=> b!1301732 (= e!742499 (and e!742498 mapRes!53871))))

(declare-fun condMapEmpty!53871 () Bool)

(declare-fun mapDefault!53871 () ValueCell!16532)

(assert (=> b!1301732 (= condMapEmpty!53871 (= (arr!41813 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16532)) mapDefault!53871)))))

(declare-fun b!1301733 () Bool)

(declare-fun res!864788 () Bool)

(assert (=> b!1301733 (=> (not res!864788) (not e!742494))))

(assert (=> b!1301733 (= res!864788 (and (= (size!42365 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42366 _keys!1741) (size!42365 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301734 () Bool)

(declare-fun res!864789 () Bool)

(assert (=> b!1301734 (=> (not res!864789) (not e!742494))))

(assert (=> b!1301734 (= res!864789 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42366 _keys!1741))))))

(declare-fun b!1301735 () Bool)

(declare-fun call!63972 () Bool)

(assert (=> b!1301735 call!63972))

(declare-fun lt!582059 () Unit!42933)

(declare-fun call!63973 () Unit!42933)

(assert (=> b!1301735 (= lt!582059 call!63973)))

(declare-fun lt!582051 () ListLongMap!20295)

(declare-fun call!63969 () ListLongMap!20295)

(assert (=> b!1301735 (= lt!582051 call!63969)))

(declare-fun e!742496 () Unit!42933)

(assert (=> b!1301735 (= e!742496 lt!582059)))

(declare-fun bm!63967 () Bool)

(declare-fun call!63970 () Bool)

(declare-fun c!124836 () Bool)

(declare-fun lt!582062 () ListLongMap!20295)

(declare-fun lt!582058 () ListLongMap!20295)

(declare-fun c!124835 () Bool)

(assert (=> bm!63967 (= call!63970 (contains!8221 (ite c!124836 lt!582058 (ite c!124835 lt!582051 lt!582062)) k0!1205))))

(declare-fun b!1301736 () Bool)

(declare-fun e!742493 () Unit!42933)

(declare-fun Unit!42935 () Unit!42933)

(assert (=> b!1301736 (= e!742493 Unit!42935)))

(declare-fun mapIsEmpty!53871 () Bool)

(assert (=> mapIsEmpty!53871 mapRes!53871))

(declare-fun b!1301737 () Bool)

(declare-fun res!864791 () Bool)

(assert (=> b!1301737 (=> (not res!864791) (not e!742494))))

(declare-datatypes ((List!29755 0))(
  ( (Nil!29752) (Cons!29751 (h!30960 (_ BitVec 64)) (t!43329 List!29755)) )
))
(declare-fun arrayNoDuplicates!0 (array!86637 (_ BitVec 32) List!29755) Bool)

(assert (=> b!1301737 (= res!864791 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29752))))

(declare-fun bm!63968 () Bool)

(assert (=> bm!63968 (= call!63972 call!63970)))

(declare-fun b!1301738 () Bool)

(declare-fun res!864793 () Bool)

(assert (=> b!1301738 (=> (not res!864793) (not e!742494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301738 (= res!864793 (validKeyInArray!0 (select (arr!41814 _keys!1741) from!2144)))))

(declare-fun bm!63969 () Bool)

(declare-fun call!63974 () Unit!42933)

(assert (=> bm!63969 (= call!63973 call!63974)))

(declare-fun b!1301739 () Bool)

(declare-fun e!742500 () Unit!42933)

(assert (=> b!1301739 (= e!742500 e!742496)))

(declare-fun lt!582063 () Bool)

(assert (=> b!1301739 (= c!124835 (and (not lt!582063) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63970 () Bool)

(assert (=> bm!63970 (= call!63969 call!63971)))

(declare-fun b!1301740 () Bool)

(assert (=> b!1301740 (= e!742498 tp_is_empty!34861)))

(declare-fun b!1301741 () Bool)

(declare-fun lt!582056 () Unit!42933)

(assert (=> b!1301741 (= e!742500 lt!582056)))

(declare-fun lt!582055 () ListLongMap!20295)

(assert (=> b!1301741 (= lt!582055 call!63971)))

(assert (=> b!1301741 (= lt!582058 (+!4501 lt!582055 (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582057 () Unit!42933)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!86 ((_ BitVec 64) (_ BitVec 64) V!51585 ListLongMap!20295) Unit!42933)

(assert (=> b!1301741 (= lt!582057 (lemmaInListMapAfterAddingDiffThenInBefore!86 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582058))))

(assert (=> b!1301741 call!63970))

(assert (=> b!1301741 (= lt!582056 call!63974)))

(assert (=> b!1301741 (contains!8221 lt!582055 k0!1205)))

(declare-fun b!1301742 () Bool)

(declare-fun lt!582061 () Unit!42933)

(assert (=> b!1301742 (= e!742493 lt!582061)))

(assert (=> b!1301742 (= lt!582062 call!63969)))

(assert (=> b!1301742 (= lt!582061 call!63973)))

(assert (=> b!1301742 call!63972))

(declare-fun bm!63971 () Bool)

(assert (=> bm!63971 (= call!63974 (lemmaInListMapAfterAddingDiffThenInBefore!86 k0!1205 (ite (or c!124836 c!124835) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124836 c!124835) zeroValue!1387 minValue!1387) (ite c!124836 lt!582055 (ite c!124835 lt!582051 lt!582062))))))

(declare-fun b!1301743 () Bool)

(declare-fun res!864790 () Bool)

(assert (=> b!1301743 (=> (not res!864790) (not e!742494))))

(declare-fun getCurrentListMap!5072 (array!86637 array!86635 (_ BitVec 32) (_ BitVec 32) V!51585 V!51585 (_ BitVec 32) Int) ListLongMap!20295)

(assert (=> b!1301743 (= res!864790 (contains!8221 (getCurrentListMap!5072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301744 () Bool)

(declare-fun res!864786 () Bool)

(assert (=> b!1301744 (=> (not res!864786) (not e!742494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86637 (_ BitVec 32)) Bool)

(assert (=> b!1301744 (= res!864786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301745 () Bool)

(declare-fun c!124837 () Bool)

(assert (=> b!1301745 (= c!124837 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582063))))

(assert (=> b!1301745 (= e!742496 e!742493)))

(declare-fun b!1301746 () Bool)

(assert (=> b!1301746 (= e!742501 tp_is_empty!34861)))

(declare-fun b!1301747 () Bool)

(assert (=> b!1301747 (= e!742494 (not e!742497))))

(declare-fun res!864787 () Bool)

(assert (=> b!1301747 (=> res!864787 e!742497)))

(assert (=> b!1301747 (= res!864787 (= k0!1205 (select (arr!41814 _keys!1741) from!2144)))))

(assert (=> b!1301747 (not (contains!8221 (ListLongMap!20296 Nil!29751) k0!1205))))

(declare-fun lt!582060 () Unit!42933)

(declare-fun emptyContainsNothing!199 ((_ BitVec 64)) Unit!42933)

(assert (=> b!1301747 (= lt!582060 (emptyContainsNothing!199 k0!1205))))

(declare-fun lt!582052 () Unit!42933)

(assert (=> b!1301747 (= lt!582052 e!742500)))

(assert (=> b!1301747 (= c!124836 (and (not lt!582063) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301747 (= lt!582063 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!109896 res!864792) b!1301733))

(assert (= (and b!1301733 res!864788) b!1301744))

(assert (= (and b!1301744 res!864786) b!1301737))

(assert (= (and b!1301737 res!864791) b!1301731))

(assert (= (and b!1301731 res!864794) b!1301743))

(assert (= (and b!1301743 res!864790) b!1301734))

(assert (= (and b!1301734 res!864789) b!1301738))

(assert (= (and b!1301738 res!864793) b!1301747))

(assert (= (and b!1301747 c!124836) b!1301741))

(assert (= (and b!1301747 (not c!124836)) b!1301739))

(assert (= (and b!1301739 c!124835) b!1301735))

(assert (= (and b!1301739 (not c!124835)) b!1301745))

(assert (= (and b!1301745 c!124837) b!1301742))

(assert (= (and b!1301745 (not c!124837)) b!1301736))

(assert (= (or b!1301735 b!1301742) bm!63970))

(assert (= (or b!1301735 b!1301742) bm!63969))

(assert (= (or b!1301735 b!1301742) bm!63968))

(assert (= (or b!1301741 bm!63970) bm!63966))

(assert (= (or b!1301741 bm!63969) bm!63971))

(assert (= (or b!1301741 bm!63968) bm!63967))

(assert (= (and b!1301747 (not res!864787)) b!1301730))

(assert (= (and b!1301732 condMapEmpty!53871) mapIsEmpty!53871))

(assert (= (and b!1301732 (not condMapEmpty!53871)) mapNonEmpty!53871))

(get-info :version)

(assert (= (and mapNonEmpty!53871 ((_ is ValueCellFull!16532) mapValue!53871)) b!1301746))

(assert (= (and b!1301732 ((_ is ValueCellFull!16532) mapDefault!53871)) b!1301740))

(assert (= start!109896 b!1301732))

(declare-fun b_lambda!23203 () Bool)

(assert (=> (not b_lambda!23203) (not b!1301730)))

(declare-fun t!43327 () Bool)

(declare-fun tb!11377 () Bool)

(assert (=> (and start!109896 (= defaultEntry!1448 defaultEntry!1448) t!43327) tb!11377))

(declare-fun result!23775 () Bool)

(assert (=> tb!11377 (= result!23775 tp_is_empty!34861)))

(assert (=> b!1301730 t!43327))

(declare-fun b_and!47335 () Bool)

(assert (= b_and!47333 (and (=> t!43327 result!23775) b_and!47335)))

(declare-fun m!1192153 () Bool)

(assert (=> b!1301747 m!1192153))

(declare-fun m!1192155 () Bool)

(assert (=> b!1301747 m!1192155))

(declare-fun m!1192157 () Bool)

(assert (=> b!1301747 m!1192157))

(declare-fun m!1192159 () Bool)

(assert (=> bm!63971 m!1192159))

(declare-fun m!1192161 () Bool)

(assert (=> b!1301741 m!1192161))

(declare-fun m!1192163 () Bool)

(assert (=> b!1301741 m!1192163))

(declare-fun m!1192165 () Bool)

(assert (=> b!1301741 m!1192165))

(declare-fun m!1192167 () Bool)

(assert (=> b!1301744 m!1192167))

(declare-fun m!1192169 () Bool)

(assert (=> start!109896 m!1192169))

(declare-fun m!1192171 () Bool)

(assert (=> start!109896 m!1192171))

(declare-fun m!1192173 () Bool)

(assert (=> start!109896 m!1192173))

(assert (=> b!1301738 m!1192153))

(assert (=> b!1301738 m!1192153))

(declare-fun m!1192175 () Bool)

(assert (=> b!1301738 m!1192175))

(declare-fun m!1192177 () Bool)

(assert (=> mapNonEmpty!53871 m!1192177))

(declare-fun m!1192179 () Bool)

(assert (=> b!1301743 m!1192179))

(assert (=> b!1301743 m!1192179))

(declare-fun m!1192181 () Bool)

(assert (=> b!1301743 m!1192181))

(declare-fun m!1192183 () Bool)

(assert (=> b!1301737 m!1192183))

(declare-fun m!1192185 () Bool)

(assert (=> bm!63966 m!1192185))

(declare-fun m!1192187 () Bool)

(assert (=> bm!63967 m!1192187))

(declare-fun m!1192189 () Bool)

(assert (=> b!1301730 m!1192189))

(declare-fun m!1192191 () Bool)

(assert (=> b!1301730 m!1192191))

(declare-fun m!1192193 () Bool)

(assert (=> b!1301730 m!1192193))

(assert (=> b!1301730 m!1192193))

(declare-fun m!1192195 () Bool)

(assert (=> b!1301730 m!1192195))

(assert (=> b!1301730 m!1192191))

(assert (=> b!1301730 m!1192189))

(declare-fun m!1192197 () Bool)

(assert (=> b!1301730 m!1192197))

(assert (=> b!1301730 m!1192153))

(declare-fun m!1192199 () Bool)

(assert (=> b!1301730 m!1192199))

(assert (=> b!1301730 m!1192153))

(check-sat (not mapNonEmpty!53871) (not bm!63966) (not b!1301744) (not b_lambda!23203) (not b!1301743) (not start!109896) (not bm!63967) (not b!1301741) (not b!1301738) tp_is_empty!34861 (not b_next!29221) (not b!1301747) (not bm!63971) (not b!1301730) b_and!47335 (not b!1301737))
(check-sat b_and!47335 (not b_next!29221))
