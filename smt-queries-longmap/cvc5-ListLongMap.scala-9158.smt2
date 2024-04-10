; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109896 () Bool)

(assert start!109896)

(declare-fun b_free!29221 () Bool)

(declare-fun b_next!29221 () Bool)

(assert (=> start!109896 (= b_free!29221 (not b_next!29221))))

(declare-fun tp!102800 () Bool)

(declare-fun b_and!47351 () Bool)

(assert (=> start!109896 (= tp!102800 b_and!47351)))

(declare-fun b!1301800 () Bool)

(declare-fun res!864822 () Bool)

(declare-fun e!742529 () Bool)

(assert (=> b!1301800 (=> (not res!864822) (not e!742529))))

(declare-datatypes ((V!51585 0))(
  ( (V!51586 (val!17505 Int)) )
))
(declare-fun minValue!1387 () V!51585)

(declare-fun zeroValue!1387 () V!51585)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16532 0))(
  ( (ValueCellFull!16532 (v!20116 V!51585)) (EmptyCell!16532) )
))
(declare-datatypes ((array!86732 0))(
  ( (array!86733 (arr!41861 (Array (_ BitVec 32) ValueCell!16532)) (size!42411 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86732)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86734 0))(
  ( (array!86735 (arr!41862 (Array (_ BitVec 32) (_ BitVec 64))) (size!42412 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86734)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22582 0))(
  ( (tuple2!22583 (_1!11302 (_ BitVec 64)) (_2!11302 V!51585)) )
))
(declare-datatypes ((List!29710 0))(
  ( (Nil!29707) (Cons!29706 (h!30915 tuple2!22582) (t!43292 List!29710)) )
))
(declare-datatypes ((ListLongMap!20239 0))(
  ( (ListLongMap!20240 (toList!10135 List!29710)) )
))
(declare-fun contains!8263 (ListLongMap!20239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5160 (array!86734 array!86732 (_ BitVec 32) (_ BitVec 32) V!51585 V!51585 (_ BitVec 32) Int) ListLongMap!20239)

(assert (=> b!1301800 (= res!864822 (contains!8263 (getCurrentListMap!5160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1301801 () Bool)

(declare-fun e!742532 () Bool)

(declare-fun tp_is_empty!34861 () Bool)

(assert (=> b!1301801 (= e!742532 tp_is_empty!34861)))

(declare-fun b!1301802 () Bool)

(declare-fun e!742526 () Bool)

(assert (=> b!1301802 (= e!742526 true)))

(declare-fun lt!582245 () V!51585)

(declare-fun +!4462 (ListLongMap!20239 tuple2!22582) ListLongMap!20239)

(assert (=> b!1301802 (not (contains!8263 (+!4462 (ListLongMap!20240 Nil!29707) (tuple2!22583 (select (arr!41862 _keys!1741) from!2144) lt!582245)) k!1205))))

(declare-datatypes ((Unit!43093 0))(
  ( (Unit!43094) )
))
(declare-fun lt!582243 () Unit!43093)

(declare-fun addStillNotContains!460 (ListLongMap!20239 (_ BitVec 64) V!51585 (_ BitVec 64)) Unit!43093)

(assert (=> b!1301802 (= lt!582243 (addStillNotContains!460 (ListLongMap!20240 Nil!29707) (select (arr!41862 _keys!1741) from!2144) lt!582245 k!1205))))

(declare-fun get!21140 (ValueCell!16532 V!51585) V!51585)

(declare-fun dynLambda!3422 (Int (_ BitVec 64)) V!51585)

(assert (=> b!1301802 (= lt!582245 (get!21140 (select (arr!41861 _values!1445) from!2144) (dynLambda!3422 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!53871 () Bool)

(declare-fun mapRes!53871 () Bool)

(assert (=> mapIsEmpty!53871 mapRes!53871))

(declare-fun b!1301803 () Bool)

(declare-fun res!864816 () Bool)

(assert (=> b!1301803 (=> (not res!864816) (not e!742529))))

(declare-datatypes ((List!29711 0))(
  ( (Nil!29708) (Cons!29707 (h!30916 (_ BitVec 64)) (t!43293 List!29711)) )
))
(declare-fun arrayNoDuplicates!0 (array!86734 (_ BitVec 32) List!29711) Bool)

(assert (=> b!1301803 (= res!864816 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29708))))

(declare-fun mapNonEmpty!53871 () Bool)

(declare-fun tp!102801 () Bool)

(declare-fun e!742531 () Bool)

(assert (=> mapNonEmpty!53871 (= mapRes!53871 (and tp!102801 e!742531))))

(declare-fun mapRest!53871 () (Array (_ BitVec 32) ValueCell!16532))

(declare-fun mapKey!53871 () (_ BitVec 32))

(declare-fun mapValue!53871 () ValueCell!16532)

(assert (=> mapNonEmpty!53871 (= (arr!41861 _values!1445) (store mapRest!53871 mapKey!53871 mapValue!53871))))

(declare-fun call!63989 () ListLongMap!20239)

(declare-fun bm!63985 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6094 (array!86734 array!86732 (_ BitVec 32) (_ BitVec 32) V!51585 V!51585 (_ BitVec 32) Int) ListLongMap!20239)

(assert (=> bm!63985 (= call!63989 (getCurrentListMapNoExtraKeys!6094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301804 () Bool)

(declare-fun res!864815 () Bool)

(assert (=> b!1301804 (=> (not res!864815) (not e!742529))))

(assert (=> b!1301804 (= res!864815 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42412 _keys!1741))))))

(declare-fun b!1301805 () Bool)

(assert (=> b!1301805 (= e!742531 tp_is_empty!34861)))

(declare-fun b!1301806 () Bool)

(declare-fun e!742534 () Unit!43093)

(declare-fun e!742527 () Unit!43093)

(assert (=> b!1301806 (= e!742534 e!742527)))

(declare-fun c!124854 () Bool)

(declare-fun lt!582237 () Bool)

(assert (=> b!1301806 (= c!124854 (and (not lt!582237) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301807 () Bool)

(declare-fun call!63988 () Bool)

(assert (=> b!1301807 call!63988))

(declare-fun lt!582249 () Unit!43093)

(declare-fun call!63990 () Unit!43093)

(assert (=> b!1301807 (= lt!582249 call!63990)))

(declare-fun lt!582244 () ListLongMap!20239)

(declare-fun call!63991 () ListLongMap!20239)

(assert (=> b!1301807 (= lt!582244 call!63991)))

(assert (=> b!1301807 (= e!742527 lt!582249)))

(declare-fun bm!63986 () Bool)

(declare-fun call!63993 () Bool)

(assert (=> bm!63986 (= call!63988 call!63993)))

(declare-fun b!1301808 () Bool)

(declare-fun e!742530 () Bool)

(assert (=> b!1301808 (= e!742530 (and e!742532 mapRes!53871))))

(declare-fun condMapEmpty!53871 () Bool)

(declare-fun mapDefault!53871 () ValueCell!16532)

