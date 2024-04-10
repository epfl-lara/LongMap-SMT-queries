; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109900 () Bool)

(assert start!109900)

(declare-fun b_free!29225 () Bool)

(declare-fun b_next!29225 () Bool)

(assert (=> start!109900 (= b_free!29225 (not b_next!29225))))

(declare-fun tp!102813 () Bool)

(declare-fun b_and!47359 () Bool)

(assert (=> start!109900 (= tp!102813 b_and!47359)))

(declare-fun mapIsEmpty!53877 () Bool)

(declare-fun mapRes!53877 () Bool)

(assert (=> mapIsEmpty!53877 mapRes!53877))

(declare-fun b!1301912 () Bool)

(declare-datatypes ((Unit!43098 0))(
  ( (Unit!43099) )
))
(declare-fun e!742581 () Unit!43098)

(declare-fun lt!582323 () Unit!43098)

(assert (=> b!1301912 (= e!742581 lt!582323)))

(declare-datatypes ((V!51589 0))(
  ( (V!51590 (val!17507 Int)) )
))
(declare-datatypes ((tuple2!22586 0))(
  ( (tuple2!22587 (_1!11304 (_ BitVec 64)) (_2!11304 V!51589)) )
))
(declare-datatypes ((List!29714 0))(
  ( (Nil!29711) (Cons!29710 (h!30919 tuple2!22586) (t!43300 List!29714)) )
))
(declare-datatypes ((ListLongMap!20243 0))(
  ( (ListLongMap!20244 (toList!10137 List!29714)) )
))
(declare-fun lt!582315 () ListLongMap!20243)

(declare-fun call!64029 () ListLongMap!20243)

(assert (=> b!1301912 (= lt!582315 call!64029)))

(declare-fun lt!582322 () ListLongMap!20243)

(declare-fun zeroValue!1387 () V!51589)

(declare-fun +!4464 (ListLongMap!20243 tuple2!22586) ListLongMap!20243)

(assert (=> b!1301912 (= lt!582322 (+!4464 lt!582315 (tuple2!22587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!51589)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!582325 () Unit!43098)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!86 ((_ BitVec 64) (_ BitVec 64) V!51589 ListLongMap!20243) Unit!43098)

(assert (=> b!1301912 (= lt!582325 (lemmaInListMapAfterAddingDiffThenInBefore!86 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582322))))

(declare-fun contains!8265 (ListLongMap!20243 (_ BitVec 64)) Bool)

(assert (=> b!1301912 (contains!8265 lt!582322 k!1205)))

(declare-fun call!64024 () Unit!43098)

(assert (=> b!1301912 (= lt!582323 call!64024)))

(declare-fun call!64027 () Bool)

(assert (=> b!1301912 call!64027))

(declare-fun bm!64021 () Bool)

(declare-fun call!64025 () Unit!43098)

(assert (=> bm!64021 (= call!64025 call!64024)))

(declare-fun b!1301913 () Bool)

(declare-fun res!864872 () Bool)

(declare-fun e!742586 () Bool)

(assert (=> b!1301913 (=> (not res!864872) (not e!742586))))

(declare-datatypes ((array!86740 0))(
  ( (array!86741 (arr!41865 (Array (_ BitVec 32) (_ BitVec 64))) (size!42415 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86740)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301913 (= res!864872 (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)))))

(declare-fun b!1301914 () Bool)

(declare-fun res!864876 () Bool)

(assert (=> b!1301914 (=> (not res!864876) (not e!742586))))

(assert (=> b!1301914 (= res!864876 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42415 _keys!1741))))))

(declare-fun b!1301915 () Bool)

(declare-fun e!742580 () Bool)

(declare-fun tp_is_empty!34865 () Bool)

(assert (=> b!1301915 (= e!742580 tp_is_empty!34865)))

(declare-fun b!1301916 () Bool)

(declare-fun c!124872 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!582316 () Bool)

(assert (=> b!1301916 (= c!124872 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582316))))

(declare-fun e!742585 () Unit!43098)

(declare-fun e!742582 () Unit!43098)

(assert (=> b!1301916 (= e!742585 e!742582)))

(declare-fun res!864875 () Bool)

(assert (=> start!109900 (=> (not res!864875) (not e!742586))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109900 (= res!864875 (validMask!0 mask!2175))))

(assert (=> start!109900 e!742586))

(assert (=> start!109900 tp_is_empty!34865))

(assert (=> start!109900 true))

(declare-datatypes ((ValueCell!16534 0))(
  ( (ValueCellFull!16534 (v!20118 V!51589)) (EmptyCell!16534) )
))
(declare-datatypes ((array!86742 0))(
  ( (array!86743 (arr!41866 (Array (_ BitVec 32) ValueCell!16534)) (size!42416 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86742)

(declare-fun e!742584 () Bool)

(declare-fun array_inv!31669 (array!86742) Bool)

(assert (=> start!109900 (and (array_inv!31669 _values!1445) e!742584)))

(declare-fun array_inv!31670 (array!86740) Bool)

(assert (=> start!109900 (array_inv!31670 _keys!1741)))

(assert (=> start!109900 tp!102813))

(declare-fun c!124871 () Bool)

(declare-fun bm!64022 () Bool)

(declare-fun lt!582321 () ListLongMap!20243)

(declare-fun c!124873 () Bool)

(declare-fun lt!582318 () ListLongMap!20243)

(assert (=> bm!64022 (= call!64024 (lemmaInListMapAfterAddingDiffThenInBefore!86 k!1205 (ite (or c!124873 c!124871) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124873 c!124871) zeroValue!1387 minValue!1387) (ite c!124873 lt!582315 (ite c!124871 lt!582318 lt!582321))))))

(declare-fun b!1301917 () Bool)

(declare-fun res!864877 () Bool)

(assert (=> b!1301917 (=> (not res!864877) (not e!742586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86740 (_ BitVec 32)) Bool)

(assert (=> b!1301917 (= res!864877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!64023 () Bool)

(declare-fun call!64026 () ListLongMap!20243)

(assert (=> bm!64023 (= call!64026 call!64029)))

(declare-fun b!1301918 () Bool)

(declare-fun e!742588 () Bool)

(assert (=> b!1301918 (= e!742588 true)))

(declare-fun lt!582326 () V!51589)

(assert (=> b!1301918 (not (contains!8265 (+!4464 (ListLongMap!20244 Nil!29711) (tuple2!22587 (select (arr!41865 _keys!1741) from!2144) lt!582326)) k!1205))))

(declare-fun lt!582324 () Unit!43098)

(declare-fun addStillNotContains!462 (ListLongMap!20243 (_ BitVec 64) V!51589 (_ BitVec 64)) Unit!43098)

(assert (=> b!1301918 (= lt!582324 (addStillNotContains!462 (ListLongMap!20244 Nil!29711) (select (arr!41865 _keys!1741) from!2144) lt!582326 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun get!21142 (ValueCell!16534 V!51589) V!51589)

(declare-fun dynLambda!3424 (Int (_ BitVec 64)) V!51589)

(assert (=> b!1301918 (= lt!582326 (get!21142 (select (arr!41866 _values!1445) from!2144) (dynLambda!3424 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301919 () Bool)

(declare-fun res!864871 () Bool)

(assert (=> b!1301919 (=> (not res!864871) (not e!742586))))

(declare-datatypes ((List!29715 0))(
  ( (Nil!29712) (Cons!29711 (h!30920 (_ BitVec 64)) (t!43301 List!29715)) )
))
(declare-fun arrayNoDuplicates!0 (array!86740 (_ BitVec 32) List!29715) Bool)

(assert (=> b!1301919 (= res!864871 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29712))))

(declare-fun b!1301920 () Bool)

(declare-fun Unit!43100 () Unit!43098)

(assert (=> b!1301920 (= e!742582 Unit!43100)))

(declare-fun b!1301921 () Bool)

(declare-fun lt!582327 () Unit!43098)

(assert (=> b!1301921 (= e!742582 lt!582327)))

(assert (=> b!1301921 (= lt!582321 call!64026)))

(assert (=> b!1301921 (= lt!582327 call!64025)))

(declare-fun call!64028 () Bool)

(assert (=> b!1301921 call!64028))

(declare-fun bm!64024 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6096 (array!86740 array!86742 (_ BitVec 32) (_ BitVec 32) V!51589 V!51589 (_ BitVec 32) Int) ListLongMap!20243)

(assert (=> bm!64024 (= call!64029 (getCurrentListMapNoExtraKeys!6096 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301922 () Bool)

(assert (=> b!1301922 (= e!742586 (not e!742588))))

(declare-fun res!864869 () Bool)

(assert (=> b!1301922 (=> res!864869 e!742588)))

(assert (=> b!1301922 (= res!864869 (= k!1205 (select (arr!41865 _keys!1741) from!2144)))))

(assert (=> b!1301922 (not (contains!8265 (ListLongMap!20244 Nil!29711) k!1205))))

(declare-fun lt!582320 () Unit!43098)

(declare-fun emptyContainsNothing!204 ((_ BitVec 64)) Unit!43098)

(assert (=> b!1301922 (= lt!582320 (emptyContainsNothing!204 k!1205))))

(declare-fun lt!582317 () Unit!43098)

(assert (=> b!1301922 (= lt!582317 e!742581)))

(assert (=> b!1301922 (= c!124873 (and (not lt!582316) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301922 (= lt!582316 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301923 () Bool)

(assert (=> b!1301923 call!64028))

(declare-fun lt!582319 () Unit!43098)

(assert (=> b!1301923 (= lt!582319 call!64025)))

(assert (=> b!1301923 (= lt!582318 call!64026)))

(assert (=> b!1301923 (= e!742585 lt!582319)))

(declare-fun bm!64025 () Bool)

(assert (=> bm!64025 (= call!64027 (contains!8265 (ite c!124873 lt!582315 (ite c!124871 lt!582318 lt!582321)) k!1205))))

(declare-fun b!1301924 () Bool)

(assert (=> b!1301924 (= e!742581 e!742585)))

(assert (=> b!1301924 (= c!124871 (and (not lt!582316) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64026 () Bool)

(assert (=> bm!64026 (= call!64028 call!64027)))

(declare-fun b!1301925 () Bool)

(declare-fun res!864873 () Bool)

(assert (=> b!1301925 (=> (not res!864873) (not e!742586))))

(assert (=> b!1301925 (= res!864873 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42415 _keys!1741))))))

(declare-fun b!1301926 () Bool)

(declare-fun res!864870 () Bool)

(assert (=> b!1301926 (=> (not res!864870) (not e!742586))))

(assert (=> b!1301926 (= res!864870 (and (= (size!42416 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42415 _keys!1741) (size!42416 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53877 () Bool)

(declare-fun tp!102812 () Bool)

(assert (=> mapNonEmpty!53877 (= mapRes!53877 (and tp!102812 e!742580))))

(declare-fun mapRest!53877 () (Array (_ BitVec 32) ValueCell!16534))

(declare-fun mapKey!53877 () (_ BitVec 32))

(declare-fun mapValue!53877 () ValueCell!16534)

(assert (=> mapNonEmpty!53877 (= (arr!41866 _values!1445) (store mapRest!53877 mapKey!53877 mapValue!53877))))

(declare-fun b!1301927 () Bool)

(declare-fun e!742587 () Bool)

(assert (=> b!1301927 (= e!742587 tp_is_empty!34865)))

(declare-fun b!1301928 () Bool)

(declare-fun res!864874 () Bool)

(assert (=> b!1301928 (=> (not res!864874) (not e!742586))))

(declare-fun getCurrentListMap!5162 (array!86740 array!86742 (_ BitVec 32) (_ BitVec 32) V!51589 V!51589 (_ BitVec 32) Int) ListLongMap!20243)

(assert (=> b!1301928 (= res!864874 (contains!8265 (getCurrentListMap!5162 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1301929 () Bool)

(assert (=> b!1301929 (= e!742584 (and e!742587 mapRes!53877))))

(declare-fun condMapEmpty!53877 () Bool)

(declare-fun mapDefault!53877 () ValueCell!16534)

