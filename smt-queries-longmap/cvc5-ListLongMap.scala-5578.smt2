; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73252 () Bool)

(assert start!73252)

(declare-fun b_free!14167 () Bool)

(declare-fun b_next!14167 () Bool)

(assert (=> start!73252 (= b_free!14167 (not b_next!14167))))

(declare-fun tp!50004 () Bool)

(declare-fun b_and!23493 () Bool)

(assert (=> start!73252 (= tp!50004 b_and!23493)))

(declare-fun mapIsEmpty!26054 () Bool)

(declare-fun mapRes!26054 () Bool)

(assert (=> mapIsEmpty!26054 mapRes!26054))

(declare-fun b!854079 () Bool)

(declare-fun e!476266 () Bool)

(declare-fun e!476268 () Bool)

(assert (=> b!854079 (= e!476266 e!476268)))

(declare-fun res!580031 () Bool)

(assert (=> b!854079 (=> (not res!580031) (not e!476268))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854079 (= res!580031 (= from!1053 i!612))))

(declare-datatypes ((V!26785 0))(
  ( (V!26786 (val!8199 Int)) )
))
(declare-datatypes ((ValueCell!7712 0))(
  ( (ValueCellFull!7712 (v!10624 V!26785)) (EmptyCell!7712) )
))
(declare-datatypes ((array!48804 0))(
  ( (array!48805 (arr!23433 (Array (_ BitVec 32) ValueCell!7712)) (size!23873 (_ BitVec 32))) )
))
(declare-fun lt!385151 () array!48804)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48806 0))(
  ( (array!48807 (arr!23434 (Array (_ BitVec 32) (_ BitVec 64))) (size!23874 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48806)

(declare-datatypes ((tuple2!10788 0))(
  ( (tuple2!10789 (_1!5405 (_ BitVec 64)) (_2!5405 V!26785)) )
))
(declare-datatypes ((List!16607 0))(
  ( (Nil!16604) (Cons!16603 (h!17734 tuple2!10788) (t!23220 List!16607)) )
))
(declare-datatypes ((ListLongMap!9557 0))(
  ( (ListLongMap!9558 (toList!4794 List!16607)) )
))
(declare-fun lt!385148 () ListLongMap!9557)

(declare-fun minValue!654 () V!26785)

(declare-fun zeroValue!654 () V!26785)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2775 (array!48806 array!48804 (_ BitVec 32) (_ BitVec 32) V!26785 V!26785 (_ BitVec 32) Int) ListLongMap!9557)

(assert (=> b!854079 (= lt!385148 (getCurrentListMapNoExtraKeys!2775 _keys!868 lt!385151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26785)

(declare-fun _values!688 () array!48804)

(assert (=> b!854079 (= lt!385151 (array!48805 (store (arr!23433 _values!688) i!612 (ValueCellFull!7712 v!557)) (size!23873 _values!688)))))

(declare-fun lt!385153 () ListLongMap!9557)

(assert (=> b!854079 (= lt!385153 (getCurrentListMapNoExtraKeys!2775 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854080 () Bool)

(declare-fun e!476271 () Bool)

(assert (=> b!854080 (= e!476271 true)))

(declare-fun lt!385146 () V!26785)

(declare-fun lt!385149 () ListLongMap!9557)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!385152 () tuple2!10788)

(declare-fun +!2183 (ListLongMap!9557 tuple2!10788) ListLongMap!9557)

(assert (=> b!854080 (= (+!2183 lt!385149 lt!385152) (+!2183 (+!2183 lt!385149 (tuple2!10789 k!854 lt!385146)) lt!385152))))

(declare-fun lt!385150 () V!26785)

(assert (=> b!854080 (= lt!385152 (tuple2!10789 k!854 lt!385150))))

(declare-datatypes ((Unit!29151 0))(
  ( (Unit!29152) )
))
(declare-fun lt!385147 () Unit!29151)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!308 (ListLongMap!9557 (_ BitVec 64) V!26785 V!26785) Unit!29151)

(assert (=> b!854080 (= lt!385147 (addSameAsAddTwiceSameKeyDiffValues!308 lt!385149 k!854 lt!385146 lt!385150))))

(declare-fun lt!385145 () V!26785)

(declare-fun get!12362 (ValueCell!7712 V!26785) V!26785)

(assert (=> b!854080 (= lt!385146 (get!12362 (select (arr!23433 _values!688) from!1053) lt!385145))))

(assert (=> b!854080 (= lt!385148 (+!2183 lt!385149 (tuple2!10789 (select (arr!23434 _keys!868) from!1053) lt!385150)))))

(assert (=> b!854080 (= lt!385150 (get!12362 (select (store (arr!23433 _values!688) i!612 (ValueCellFull!7712 v!557)) from!1053) lt!385145))))

(declare-fun dynLambda!1062 (Int (_ BitVec 64)) V!26785)

(assert (=> b!854080 (= lt!385145 (dynLambda!1062 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854080 (= lt!385149 (getCurrentListMapNoExtraKeys!2775 _keys!868 lt!385151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854081 () Bool)

(declare-fun res!580034 () Bool)

(assert (=> b!854081 (=> (not res!580034) (not e!476266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854081 (= res!580034 (validMask!0 mask!1196))))

(declare-fun b!854082 () Bool)

(assert (=> b!854082 (= e!476268 (not e!476271))))

(declare-fun res!580028 () Bool)

(assert (=> b!854082 (=> res!580028 e!476271)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854082 (= res!580028 (not (validKeyInArray!0 (select (arr!23434 _keys!868) from!1053))))))

(declare-fun e!476267 () Bool)

(assert (=> b!854082 e!476267))

(declare-fun c!91921 () Bool)

(assert (=> b!854082 (= c!91921 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385144 () Unit!29151)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!407 (array!48806 array!48804 (_ BitVec 32) (_ BitVec 32) V!26785 V!26785 (_ BitVec 32) (_ BitVec 64) V!26785 (_ BitVec 32) Int) Unit!29151)

(assert (=> b!854082 (= lt!385144 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!407 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26054 () Bool)

(declare-fun tp!50005 () Bool)

(declare-fun e!476269 () Bool)

(assert (=> mapNonEmpty!26054 (= mapRes!26054 (and tp!50005 e!476269))))

(declare-fun mapRest!26054 () (Array (_ BitVec 32) ValueCell!7712))

(declare-fun mapValue!26054 () ValueCell!7712)

(declare-fun mapKey!26054 () (_ BitVec 32))

(assert (=> mapNonEmpty!26054 (= (arr!23433 _values!688) (store mapRest!26054 mapKey!26054 mapValue!26054))))

(declare-fun b!854083 () Bool)

(declare-fun e!476265 () Bool)

(declare-fun e!476270 () Bool)

(assert (=> b!854083 (= e!476265 (and e!476270 mapRes!26054))))

(declare-fun condMapEmpty!26054 () Bool)

(declare-fun mapDefault!26054 () ValueCell!7712)

