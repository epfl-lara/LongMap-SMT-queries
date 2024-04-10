; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73898 () Bool)

(assert start!73898)

(declare-fun b_free!14813 () Bool)

(declare-fun b_next!14813 () Bool)

(assert (=> start!73898 (= b_free!14813 (not b_next!14813))))

(declare-fun tp!51942 () Bool)

(declare-fun b_and!24565 () Bool)

(assert (=> start!73898 (= tp!51942 b_and!24565)))

(declare-fun b!868287 () Bool)

(declare-fun res!589993 () Bool)

(declare-fun e!483614 () Bool)

(assert (=> b!868287 (=> (not res!589993) (not e!483614))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868287 (= res!589993 (validKeyInArray!0 k!854))))

(declare-fun b!868288 () Bool)

(declare-fun e!483615 () Bool)

(assert (=> b!868288 (= e!483614 e!483615)))

(declare-fun res!589997 () Bool)

(assert (=> b!868288 (=> (not res!589997) (not e!483615))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868288 (= res!589997 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27645 0))(
  ( (V!27646 (val!8522 Int)) )
))
(declare-datatypes ((tuple2!11312 0))(
  ( (tuple2!11313 (_1!5667 (_ BitVec 64)) (_2!5667 V!27645)) )
))
(declare-datatypes ((List!17109 0))(
  ( (Nil!17106) (Cons!17105 (h!18236 tuple2!11312) (t!24146 List!17109)) )
))
(declare-datatypes ((ListLongMap!10081 0))(
  ( (ListLongMap!10082 (toList!5056 List!17109)) )
))
(declare-fun lt!394417 () ListLongMap!10081)

(declare-datatypes ((array!50054 0))(
  ( (array!50055 (arr!24058 (Array (_ BitVec 32) (_ BitVec 64))) (size!24498 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50054)

(declare-fun minValue!654 () V!27645)

(declare-fun zeroValue!654 () V!27645)

(declare-datatypes ((ValueCell!8035 0))(
  ( (ValueCellFull!8035 (v!10947 V!27645)) (EmptyCell!8035) )
))
(declare-datatypes ((array!50056 0))(
  ( (array!50057 (arr!24059 (Array (_ BitVec 32) ValueCell!8035)) (size!24499 (_ BitVec 32))) )
))
(declare-fun lt!394419 () array!50056)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3025 (array!50054 array!50056 (_ BitVec 32) (_ BitVec 32) V!27645 V!27645 (_ BitVec 32) Int) ListLongMap!10081)

(assert (=> b!868288 (= lt!394417 (getCurrentListMapNoExtraKeys!3025 _keys!868 lt!394419 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27645)

(declare-fun _values!688 () array!50056)

(assert (=> b!868288 (= lt!394419 (array!50057 (store (arr!24059 _values!688) i!612 (ValueCellFull!8035 v!557)) (size!24499 _values!688)))))

(declare-fun lt!394418 () ListLongMap!10081)

(assert (=> b!868288 (= lt!394418 (getCurrentListMapNoExtraKeys!3025 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868289 () Bool)

(declare-fun e!483618 () Bool)

(declare-fun e!483616 () Bool)

(declare-fun mapRes!27023 () Bool)

(assert (=> b!868289 (= e!483618 (and e!483616 mapRes!27023))))

(declare-fun condMapEmpty!27023 () Bool)

(declare-fun mapDefault!27023 () ValueCell!8035)

