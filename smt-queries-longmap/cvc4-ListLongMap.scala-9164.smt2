; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110062 () Bool)

(assert start!110062)

(declare-fun b_free!29261 () Bool)

(declare-fun b_next!29261 () Bool)

(assert (=> start!110062 (= b_free!29261 (not b_next!29261))))

(declare-fun tp!102933 () Bool)

(declare-fun b_and!47425 () Bool)

(assert (=> start!110062 (= tp!102933 b_and!47425)))

(declare-fun b!1303442 () Bool)

(declare-fun res!865727 () Bool)

(declare-fun e!743475 () Bool)

(assert (=> b!1303442 (=> (not res!865727) (not e!743475))))

(declare-datatypes ((array!86816 0))(
  ( (array!86817 (arr!41899 (Array (_ BitVec 32) (_ BitVec 64))) (size!42449 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86816)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303442 (= res!865727 (not (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144))))))

(declare-fun b!1303443 () Bool)

(declare-fun res!865725 () Bool)

(assert (=> b!1303443 (=> (not res!865725) (not e!743475))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51637 0))(
  ( (V!51638 (val!17525 Int)) )
))
(declare-datatypes ((ValueCell!16552 0))(
  ( (ValueCellFull!16552 (v!20141 V!51637)) (EmptyCell!16552) )
))
(declare-datatypes ((array!86818 0))(
  ( (array!86819 (arr!41900 (Array (_ BitVec 32) ValueCell!16552)) (size!42450 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86818)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303443 (= res!865725 (and (= (size!42450 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42449 _keys!1741) (size!42450 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303444 () Bool)

(declare-fun res!865722 () Bool)

(assert (=> b!1303444 (=> (not res!865722) (not e!743475))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1303444 (= res!865722 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42449 _keys!1741))))))

(declare-fun b!1303445 () Bool)

(declare-fun e!743471 () Bool)

(assert (=> b!1303445 (= e!743471 true)))

(assert (=> b!1303445 false))

(declare-fun minValue!1387 () V!51637)

(declare-datatypes ((Unit!43158 0))(
  ( (Unit!43159) )
))
(declare-fun lt!583292 () Unit!43158)

(declare-datatypes ((tuple2!22616 0))(
  ( (tuple2!22617 (_1!11319 (_ BitVec 64)) (_2!11319 V!51637)) )
))
(declare-datatypes ((List!29742 0))(
  ( (Nil!29739) (Cons!29738 (h!30947 tuple2!22616) (t!43336 List!29742)) )
))
(declare-datatypes ((ListLongMap!20273 0))(
  ( (ListLongMap!20274 (toList!10152 List!29742)) )
))
(declare-fun lt!583293 () ListLongMap!20273)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!90 ((_ BitVec 64) (_ BitVec 64) V!51637 ListLongMap!20273) Unit!43158)

(assert (=> b!1303445 (= lt!583292 (lemmaInListMapAfterAddingDiffThenInBefore!90 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583293))))

(declare-fun lt!583291 () ListLongMap!20273)

(declare-fun contains!8288 (ListLongMap!20273 (_ BitVec 64)) Bool)

(declare-fun +!4477 (ListLongMap!20273 tuple2!22616) ListLongMap!20273)

(assert (=> b!1303445 (not (contains!8288 (+!4477 lt!583291 (tuple2!22617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!583289 () Unit!43158)

(declare-fun addStillNotContains!474 (ListLongMap!20273 (_ BitVec 64) V!51637 (_ BitVec 64)) Unit!43158)

(assert (=> b!1303445 (= lt!583289 (addStillNotContains!474 lt!583291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1303445 (not (contains!8288 lt!583293 k!1205))))

(declare-fun zeroValue!1387 () V!51637)

(assert (=> b!1303445 (= lt!583293 (+!4477 lt!583291 (tuple2!22617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583288 () Unit!43158)

(assert (=> b!1303445 (= lt!583288 (addStillNotContains!474 lt!583291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6110 (array!86816 array!86818 (_ BitVec 32) (_ BitVec 32) V!51637 V!51637 (_ BitVec 32) Int) ListLongMap!20273)

(assert (=> b!1303445 (= lt!583291 (getCurrentListMapNoExtraKeys!6110 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303446 () Bool)

(declare-fun e!743476 () Bool)

(declare-fun e!743473 () Bool)

(declare-fun mapRes!53944 () Bool)

(assert (=> b!1303446 (= e!743476 (and e!743473 mapRes!53944))))

(declare-fun condMapEmpty!53944 () Bool)

(declare-fun mapDefault!53944 () ValueCell!16552)

