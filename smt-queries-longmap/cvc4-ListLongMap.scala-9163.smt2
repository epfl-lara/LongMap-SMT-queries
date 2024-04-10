; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110056 () Bool)

(assert start!110056)

(declare-fun b_free!29255 () Bool)

(declare-fun b_next!29255 () Bool)

(assert (=> start!110056 (= b_free!29255 (not b_next!29255))))

(declare-fun tp!102916 () Bool)

(declare-fun b_and!47419 () Bool)

(assert (=> start!110056 (= tp!102916 b_and!47419)))

(declare-fun b!1303334 () Bool)

(declare-fun e!743421 () Bool)

(declare-fun tp_is_empty!34895 () Bool)

(assert (=> b!1303334 (= e!743421 tp_is_empty!34895)))

(declare-fun b!1303335 () Bool)

(declare-fun e!743420 () Bool)

(assert (=> b!1303335 (= e!743420 tp_is_empty!34895)))

(declare-fun b!1303336 () Bool)

(declare-fun res!865643 () Bool)

(declare-fun e!743418 () Bool)

(assert (=> b!1303336 (=> (not res!865643) (not e!743418))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86806 0))(
  ( (array!86807 (arr!41894 (Array (_ BitVec 32) (_ BitVec 64))) (size!42444 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86806)

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1303336 (= res!865643 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42444 _keys!1741))))))

(declare-fun b!1303337 () Bool)

(declare-fun res!865644 () Bool)

(assert (=> b!1303337 (=> (not res!865644) (not e!743418))))

(declare-datatypes ((List!29738 0))(
  ( (Nil!29735) (Cons!29734 (h!30943 (_ BitVec 64)) (t!43332 List!29738)) )
))
(declare-fun arrayNoDuplicates!0 (array!86806 (_ BitVec 32) List!29738) Bool)

(assert (=> b!1303337 (= res!865644 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29735))))

(declare-fun b!1303338 () Bool)

(declare-fun e!743419 () Bool)

(assert (=> b!1303338 (= e!743419 true)))

(declare-datatypes ((V!51629 0))(
  ( (V!51630 (val!17522 Int)) )
))
(declare-datatypes ((tuple2!22612 0))(
  ( (tuple2!22613 (_1!11317 (_ BitVec 64)) (_2!11317 V!51629)) )
))
(declare-fun lt!583239 () tuple2!22612)

(declare-datatypes ((List!29739 0))(
  ( (Nil!29736) (Cons!29735 (h!30944 tuple2!22612) (t!43333 List!29739)) )
))
(declare-datatypes ((ListLongMap!20269 0))(
  ( (ListLongMap!20270 (toList!10150 List!29739)) )
))
(declare-fun lt!583235 () ListLongMap!20269)

(declare-fun lt!583236 () Bool)

(declare-fun contains!8286 (ListLongMap!20269 (_ BitVec 64)) Bool)

(declare-fun +!4475 (ListLongMap!20269 tuple2!22612) ListLongMap!20269)

(assert (=> b!1303338 (= lt!583236 (contains!8286 (+!4475 lt!583235 lt!583239) k!1205))))

(declare-fun lt!583233 () ListLongMap!20269)

(assert (=> b!1303338 (not (contains!8286 (+!4475 lt!583233 lt!583239) k!1205))))

(declare-fun minValue!1387 () V!51629)

(assert (=> b!1303338 (= lt!583239 (tuple2!22613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!43154 0))(
  ( (Unit!43155) )
))
(declare-fun lt!583237 () Unit!43154)

(declare-fun addStillNotContains!472 (ListLongMap!20269 (_ BitVec 64) V!51629 (_ BitVec 64)) Unit!43154)

(assert (=> b!1303338 (= lt!583237 (addStillNotContains!472 lt!583233 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1303338 (not (contains!8286 lt!583235 k!1205))))

(declare-fun zeroValue!1387 () V!51629)

(assert (=> b!1303338 (= lt!583235 (+!4475 lt!583233 (tuple2!22613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583238 () Unit!43154)

(assert (=> b!1303338 (= lt!583238 (addStillNotContains!472 lt!583233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16549 0))(
  ( (ValueCellFull!16549 (v!20138 V!51629)) (EmptyCell!16549) )
))
(declare-datatypes ((array!86808 0))(
  ( (array!86809 (arr!41895 (Array (_ BitVec 32) ValueCell!16549)) (size!42445 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86808)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6108 (array!86806 array!86808 (_ BitVec 32) (_ BitVec 32) V!51629 V!51629 (_ BitVec 32) Int) ListLongMap!20269)

(assert (=> b!1303338 (= lt!583233 (getCurrentListMapNoExtraKeys!6108 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303339 () Bool)

(declare-fun res!865641 () Bool)

(assert (=> b!1303339 (=> (not res!865641) (not e!743418))))

(assert (=> b!1303339 (= res!865641 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42444 _keys!1741))))))

(declare-fun b!1303340 () Bool)

(declare-fun res!865646 () Bool)

(assert (=> b!1303340 (=> (not res!865646) (not e!743418))))

(assert (=> b!1303340 (= res!865646 (and (= (size!42445 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42444 _keys!1741) (size!42445 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303341 () Bool)

(declare-fun res!865640 () Bool)

(assert (=> b!1303341 (=> (not res!865640) (not e!743418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303341 (= res!865640 (not (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53935 () Bool)

(declare-fun mapRes!53935 () Bool)

(declare-fun tp!102915 () Bool)

(assert (=> mapNonEmpty!53935 (= mapRes!53935 (and tp!102915 e!743421))))

(declare-fun mapRest!53935 () (Array (_ BitVec 32) ValueCell!16549))

(declare-fun mapValue!53935 () ValueCell!16549)

(declare-fun mapKey!53935 () (_ BitVec 32))

(assert (=> mapNonEmpty!53935 (= (arr!41895 _values!1445) (store mapRest!53935 mapKey!53935 mapValue!53935))))

(declare-fun b!1303342 () Bool)

(assert (=> b!1303342 (= e!743418 (not e!743419))))

(declare-fun res!865647 () Bool)

(assert (=> b!1303342 (=> res!865647 e!743419)))

(assert (=> b!1303342 (= res!865647 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1303342 (not (contains!8286 (ListLongMap!20270 Nil!29736) k!1205))))

(declare-fun lt!583234 () Unit!43154)

(declare-fun emptyContainsNothing!215 ((_ BitVec 64)) Unit!43154)

(assert (=> b!1303342 (= lt!583234 (emptyContainsNothing!215 k!1205))))

(declare-fun mapIsEmpty!53935 () Bool)

(assert (=> mapIsEmpty!53935 mapRes!53935))

(declare-fun b!1303343 () Bool)

(declare-fun e!743417 () Bool)

(assert (=> b!1303343 (= e!743417 (and e!743420 mapRes!53935))))

(declare-fun condMapEmpty!53935 () Bool)

(declare-fun mapDefault!53935 () ValueCell!16549)

