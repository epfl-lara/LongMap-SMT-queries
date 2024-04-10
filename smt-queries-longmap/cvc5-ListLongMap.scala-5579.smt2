; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73258 () Bool)

(assert start!73258)

(declare-fun b_free!14173 () Bool)

(declare-fun b_next!14173 () Bool)

(assert (=> start!73258 (= b_free!14173 (not b_next!14173))))

(declare-fun tp!50023 () Bool)

(declare-fun b_and!23505 () Bool)

(assert (=> start!73258 (= tp!50023 b_and!23505)))

(declare-fun b!854220 () Bool)

(declare-fun e!476338 () Bool)

(declare-fun e!476337 () Bool)

(assert (=> b!854220 (= e!476338 e!476337)))

(declare-fun res!580119 () Bool)

(assert (=> b!854220 (=> (not res!580119) (not e!476337))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854220 (= res!580119 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26793 0))(
  ( (V!26794 (val!8202 Int)) )
))
(declare-datatypes ((tuple2!10794 0))(
  ( (tuple2!10795 (_1!5408 (_ BitVec 64)) (_2!5408 V!26793)) )
))
(declare-datatypes ((List!16612 0))(
  ( (Nil!16609) (Cons!16608 (h!17739 tuple2!10794) (t!23231 List!16612)) )
))
(declare-datatypes ((ListLongMap!9563 0))(
  ( (ListLongMap!9564 (toList!4797 List!16612)) )
))
(declare-fun lt!385236 () ListLongMap!9563)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48816 0))(
  ( (array!48817 (arr!23439 (Array (_ BitVec 32) (_ BitVec 64))) (size!23879 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48816)

(declare-datatypes ((ValueCell!7715 0))(
  ( (ValueCellFull!7715 (v!10627 V!26793)) (EmptyCell!7715) )
))
(declare-datatypes ((array!48818 0))(
  ( (array!48819 (arr!23440 (Array (_ BitVec 32) ValueCell!7715)) (size!23880 (_ BitVec 32))) )
))
(declare-fun lt!385234 () array!48818)

(declare-fun minValue!654 () V!26793)

(declare-fun zeroValue!654 () V!26793)

(declare-fun getCurrentListMapNoExtraKeys!2778 (array!48816 array!48818 (_ BitVec 32) (_ BitVec 32) V!26793 V!26793 (_ BitVec 32) Int) ListLongMap!9563)

(assert (=> b!854220 (= lt!385236 (getCurrentListMapNoExtraKeys!2778 _keys!868 lt!385234 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26793)

(declare-fun _values!688 () array!48818)

(assert (=> b!854220 (= lt!385234 (array!48819 (store (arr!23440 _values!688) i!612 (ValueCellFull!7715 v!557)) (size!23880 _values!688)))))

(declare-fun lt!385242 () ListLongMap!9563)

(assert (=> b!854220 (= lt!385242 (getCurrentListMapNoExtraKeys!2778 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26063 () Bool)

(declare-fun mapRes!26063 () Bool)

(assert (=> mapIsEmpty!26063 mapRes!26063))

(declare-fun b!854222 () Bool)

(declare-fun e!476344 () Bool)

(assert (=> b!854222 (= e!476344 true)))

(declare-fun lt!385243 () tuple2!10794)

(declare-fun lt!385237 () ListLongMap!9563)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!385238 () V!26793)

(declare-fun +!2186 (ListLongMap!9563 tuple2!10794) ListLongMap!9563)

(assert (=> b!854222 (= (+!2186 lt!385237 lt!385243) (+!2186 (+!2186 lt!385237 (tuple2!10795 k!854 lt!385238)) lt!385243))))

(declare-fun lt!385235 () V!26793)

(assert (=> b!854222 (= lt!385243 (tuple2!10795 k!854 lt!385235))))

(declare-datatypes ((Unit!29157 0))(
  ( (Unit!29158) )
))
(declare-fun lt!385240 () Unit!29157)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!311 (ListLongMap!9563 (_ BitVec 64) V!26793 V!26793) Unit!29157)

(assert (=> b!854222 (= lt!385240 (addSameAsAddTwiceSameKeyDiffValues!311 lt!385237 k!854 lt!385238 lt!385235))))

(declare-fun lt!385239 () V!26793)

(declare-fun get!12367 (ValueCell!7715 V!26793) V!26793)

(assert (=> b!854222 (= lt!385238 (get!12367 (select (arr!23440 _values!688) from!1053) lt!385239))))

(assert (=> b!854222 (= lt!385236 (+!2186 lt!385237 (tuple2!10795 (select (arr!23439 _keys!868) from!1053) lt!385235)))))

(assert (=> b!854222 (= lt!385235 (get!12367 (select (store (arr!23440 _values!688) i!612 (ValueCellFull!7715 v!557)) from!1053) lt!385239))))

(declare-fun dynLambda!1065 (Int (_ BitVec 64)) V!26793)

(assert (=> b!854222 (= lt!385239 (dynLambda!1065 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854222 (= lt!385237 (getCurrentListMapNoExtraKeys!2778 _keys!868 lt!385234 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854223 () Bool)

(declare-fun res!580127 () Bool)

(assert (=> b!854223 (=> (not res!580127) (not e!476338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854223 (= res!580127 (validKeyInArray!0 k!854))))

(declare-fun b!854224 () Bool)

(declare-fun res!580118 () Bool)

(assert (=> b!854224 (=> (not res!580118) (not e!476338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48816 (_ BitVec 32)) Bool)

(assert (=> b!854224 (= res!580118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854225 () Bool)

(declare-fun e!476341 () Bool)

(declare-fun e!476340 () Bool)

(assert (=> b!854225 (= e!476341 (and e!476340 mapRes!26063))))

(declare-fun condMapEmpty!26063 () Bool)

(declare-fun mapDefault!26063 () ValueCell!7715)

