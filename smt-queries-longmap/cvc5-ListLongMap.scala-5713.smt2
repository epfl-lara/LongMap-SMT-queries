; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74062 () Bool)

(assert start!74062)

(declare-fun b_free!14977 () Bool)

(declare-fun b_next!14977 () Bool)

(assert (=> start!74062 (= b_free!14977 (not b_next!14977))))

(declare-fun tp!52434 () Bool)

(declare-fun b_and!24729 () Bool)

(assert (=> start!74062 (= tp!52434 b_and!24729)))

(declare-fun b!871239 () Bool)

(declare-fun res!592206 () Bool)

(declare-fun e!485091 () Bool)

(assert (=> b!871239 (=> (not res!592206) (not e!485091))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50366 0))(
  ( (array!50367 (arr!24214 (Array (_ BitVec 32) (_ BitVec 64))) (size!24654 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50366)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!871239 (= res!592206 (and (= (select (arr!24214 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!871240 () Bool)

(declare-fun res!592204 () Bool)

(assert (=> b!871240 (=> (not res!592204) (not e!485091))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50366 (_ BitVec 32)) Bool)

(assert (=> b!871240 (= res!592204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871241 () Bool)

(declare-fun e!485095 () Bool)

(assert (=> b!871241 (= e!485095 (not true))))

(declare-datatypes ((V!27865 0))(
  ( (V!27866 (val!8604 Int)) )
))
(declare-fun v!557 () V!27865)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8117 0))(
  ( (ValueCellFull!8117 (v!11029 V!27865)) (EmptyCell!8117) )
))
(declare-datatypes ((array!50368 0))(
  ( (array!50369 (arr!24215 (Array (_ BitVec 32) ValueCell!8117)) (size!24655 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50368)

(declare-fun minValue!654 () V!27865)

(declare-fun lt!395404 () array!50368)

(declare-fun zeroValue!654 () V!27865)

(declare-datatypes ((tuple2!11434 0))(
  ( (tuple2!11435 (_1!5728 (_ BitVec 64)) (_2!5728 V!27865)) )
))
(declare-datatypes ((List!17221 0))(
  ( (Nil!17218) (Cons!17217 (h!18348 tuple2!11434) (t!24258 List!17221)) )
))
(declare-datatypes ((ListLongMap!10203 0))(
  ( (ListLongMap!10204 (toList!5117 List!17221)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3086 (array!50366 array!50368 (_ BitVec 32) (_ BitVec 32) V!27865 V!27865 (_ BitVec 32) Int) ListLongMap!10203)

(declare-fun +!2452 (ListLongMap!10203 tuple2!11434) ListLongMap!10203)

(assert (=> b!871241 (= (getCurrentListMapNoExtraKeys!3086 _keys!868 lt!395404 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2452 (getCurrentListMapNoExtraKeys!3086 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11435 k!854 v!557)))))

(declare-datatypes ((Unit!29902 0))(
  ( (Unit!29903) )
))
(declare-fun lt!395403 () Unit!29902)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!646 (array!50366 array!50368 (_ BitVec 32) (_ BitVec 32) V!27865 V!27865 (_ BitVec 32) (_ BitVec 64) V!27865 (_ BitVec 32) Int) Unit!29902)

(assert (=> b!871241 (= lt!395403 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!646 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871242 () Bool)

(assert (=> b!871242 (= e!485091 e!485095)))

(declare-fun res!592205 () Bool)

(assert (=> b!871242 (=> (not res!592205) (not e!485095))))

(assert (=> b!871242 (= res!592205 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395401 () ListLongMap!10203)

(assert (=> b!871242 (= lt!395401 (getCurrentListMapNoExtraKeys!3086 _keys!868 lt!395404 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871242 (= lt!395404 (array!50369 (store (arr!24215 _values!688) i!612 (ValueCellFull!8117 v!557)) (size!24655 _values!688)))))

(declare-fun lt!395402 () ListLongMap!10203)

(assert (=> b!871242 (= lt!395402 (getCurrentListMapNoExtraKeys!3086 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871243 () Bool)

(declare-fun e!485094 () Bool)

(declare-fun e!485090 () Bool)

(declare-fun mapRes!27269 () Bool)

(assert (=> b!871243 (= e!485094 (and e!485090 mapRes!27269))))

(declare-fun condMapEmpty!27269 () Bool)

(declare-fun mapDefault!27269 () ValueCell!8117)

