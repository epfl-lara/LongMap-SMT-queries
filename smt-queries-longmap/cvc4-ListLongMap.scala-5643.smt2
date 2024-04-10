; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73646 () Bool)

(assert start!73646)

(declare-fun b_free!14561 () Bool)

(declare-fun b_next!14561 () Bool)

(assert (=> start!73646 (= b_free!14561 (not b_next!14561))))

(declare-fun tp!51187 () Bool)

(declare-fun b_and!24101 () Bool)

(assert (=> start!73646 (= tp!51187 b_and!24101)))

(declare-fun b!862275 () Bool)

(declare-fun res!585956 () Bool)

(declare-fun e!480401 () Bool)

(assert (=> b!862275 (=> (not res!585956) (not e!480401))))

(declare-datatypes ((array!49558 0))(
  ( (array!49559 (arr!23810 (Array (_ BitVec 32) (_ BitVec 64))) (size!24250 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49558)

(declare-datatypes ((List!16913 0))(
  ( (Nil!16910) (Cons!16909 (h!18040 (_ BitVec 64)) (t!23740 List!16913)) )
))
(declare-fun arrayNoDuplicates!0 (array!49558 (_ BitVec 32) List!16913) Bool)

(assert (=> b!862275 (= res!585956 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16910))))

(declare-fun b!862276 () Bool)

(declare-fun e!480399 () Bool)

(declare-fun e!480402 () Bool)

(assert (=> b!862276 (= e!480399 (not e!480402))))

(declare-fun res!585958 () Bool)

(assert (=> b!862276 (=> res!585958 e!480402)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862276 (= res!585958 (not (validKeyInArray!0 (select (arr!23810 _keys!868) from!1053))))))

(declare-datatypes ((V!27309 0))(
  ( (V!27310 (val!8396 Int)) )
))
(declare-datatypes ((tuple2!11104 0))(
  ( (tuple2!11105 (_1!5563 (_ BitVec 64)) (_2!5563 V!27309)) )
))
(declare-datatypes ((List!16914 0))(
  ( (Nil!16911) (Cons!16910 (h!18041 tuple2!11104) (t!23741 List!16914)) )
))
(declare-datatypes ((ListLongMap!9873 0))(
  ( (ListLongMap!9874 (toList!4952 List!16914)) )
))
(declare-fun lt!389116 () ListLongMap!9873)

(declare-fun lt!389118 () ListLongMap!9873)

(assert (=> b!862276 (= lt!389116 lt!389118)))

(declare-fun lt!389122 () ListLongMap!9873)

(declare-fun lt!389121 () tuple2!11104)

(declare-fun +!2301 (ListLongMap!9873 tuple2!11104) ListLongMap!9873)

(assert (=> b!862276 (= lt!389118 (+!2301 lt!389122 lt!389121))))

(declare-datatypes ((ValueCell!7909 0))(
  ( (ValueCellFull!7909 (v!10821 V!27309)) (EmptyCell!7909) )
))
(declare-datatypes ((array!49560 0))(
  ( (array!49561 (arr!23811 (Array (_ BitVec 32) ValueCell!7909)) (size!24251 (_ BitVec 32))) )
))
(declare-fun lt!389115 () array!49560)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27309)

(declare-fun zeroValue!654 () V!27309)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2928 (array!49558 array!49560 (_ BitVec 32) (_ BitVec 32) V!27309 V!27309 (_ BitVec 32) Int) ListLongMap!9873)

(assert (=> b!862276 (= lt!389116 (getCurrentListMapNoExtraKeys!2928 _keys!868 lt!389115 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27309)

(assert (=> b!862276 (= lt!389121 (tuple2!11105 k!854 v!557))))

(declare-fun _values!688 () array!49560)

(assert (=> b!862276 (= lt!389122 (getCurrentListMapNoExtraKeys!2928 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29441 0))(
  ( (Unit!29442) )
))
(declare-fun lt!389119 () Unit!29441)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!511 (array!49558 array!49560 (_ BitVec 32) (_ BitVec 32) V!27309 V!27309 (_ BitVec 32) (_ BitVec 64) V!27309 (_ BitVec 32) Int) Unit!29441)

(assert (=> b!862276 (= lt!389119 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!511 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862277 () Bool)

(assert (=> b!862277 (= e!480401 e!480399)))

(declare-fun res!585960 () Bool)

(assert (=> b!862277 (=> (not res!585960) (not e!480399))))

(assert (=> b!862277 (= res!585960 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389127 () ListLongMap!9873)

(assert (=> b!862277 (= lt!389127 (getCurrentListMapNoExtraKeys!2928 _keys!868 lt!389115 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862277 (= lt!389115 (array!49561 (store (arr!23811 _values!688) i!612 (ValueCellFull!7909 v!557)) (size!24251 _values!688)))))

(declare-fun lt!389117 () ListLongMap!9873)

(assert (=> b!862277 (= lt!389117 (getCurrentListMapNoExtraKeys!2928 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862278 () Bool)

(declare-fun res!585957 () Bool)

(assert (=> b!862278 (=> (not res!585957) (not e!480401))))

(assert (=> b!862278 (= res!585957 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24250 _keys!868))))))

(declare-fun mapNonEmpty!26645 () Bool)

(declare-fun mapRes!26645 () Bool)

(declare-fun tp!51186 () Bool)

(declare-fun e!480403 () Bool)

(assert (=> mapNonEmpty!26645 (= mapRes!26645 (and tp!51186 e!480403))))

(declare-fun mapKey!26645 () (_ BitVec 32))

(declare-fun mapValue!26645 () ValueCell!7909)

(declare-fun mapRest!26645 () (Array (_ BitVec 32) ValueCell!7909))

(assert (=> mapNonEmpty!26645 (= (arr!23811 _values!688) (store mapRest!26645 mapKey!26645 mapValue!26645))))

(declare-fun b!862279 () Bool)

(declare-fun e!480406 () Bool)

(declare-fun e!480400 () Bool)

(assert (=> b!862279 (= e!480406 (and e!480400 mapRes!26645))))

(declare-fun condMapEmpty!26645 () Bool)

(declare-fun mapDefault!26645 () ValueCell!7909)

