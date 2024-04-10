; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73690 () Bool)

(assert start!73690)

(declare-fun b_free!14605 () Bool)

(declare-fun b_next!14605 () Bool)

(assert (=> start!73690 (= b_free!14605 (not b_next!14605))))

(declare-fun tp!51319 () Bool)

(declare-fun b_and!24189 () Bool)

(assert (=> start!73690 (= tp!51319 b_and!24189)))

(declare-fun b!863375 () Bool)

(declare-fun e!480997 () Bool)

(declare-fun e!480996 () Bool)

(assert (=> b!863375 (= e!480997 (not e!480996))))

(declare-fun res!586682 () Bool)

(assert (=> b!863375 (=> res!586682 e!480996)))

(declare-datatypes ((array!49644 0))(
  ( (array!49645 (arr!23853 (Array (_ BitVec 32) (_ BitVec 64))) (size!24293 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49644)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863375 (= res!586682 (not (validKeyInArray!0 (select (arr!23853 _keys!868) from!1053))))))

(declare-datatypes ((V!27369 0))(
  ( (V!27370 (val!8418 Int)) )
))
(declare-datatypes ((tuple2!11140 0))(
  ( (tuple2!11141 (_1!5581 (_ BitVec 64)) (_2!5581 V!27369)) )
))
(declare-datatypes ((List!16948 0))(
  ( (Nil!16945) (Cons!16944 (h!18075 tuple2!11140) (t!23819 List!16948)) )
))
(declare-datatypes ((ListLongMap!9909 0))(
  ( (ListLongMap!9910 (toList!4970 List!16948)) )
))
(declare-fun lt!390173 () ListLongMap!9909)

(declare-fun lt!390183 () ListLongMap!9909)

(assert (=> b!863375 (= lt!390173 lt!390183)))

(declare-fun lt!390169 () ListLongMap!9909)

(declare-fun lt!390176 () tuple2!11140)

(declare-fun +!2319 (ListLongMap!9909 tuple2!11140) ListLongMap!9909)

(assert (=> b!863375 (= lt!390183 (+!2319 lt!390169 lt!390176))))

(declare-datatypes ((ValueCell!7931 0))(
  ( (ValueCellFull!7931 (v!10843 V!27369)) (EmptyCell!7931) )
))
(declare-datatypes ((array!49646 0))(
  ( (array!49647 (arr!23854 (Array (_ BitVec 32) ValueCell!7931)) (size!24294 (_ BitVec 32))) )
))
(declare-fun lt!390178 () array!49646)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27369)

(declare-fun zeroValue!654 () V!27369)

(declare-fun getCurrentListMapNoExtraKeys!2945 (array!49644 array!49646 (_ BitVec 32) (_ BitVec 32) V!27369 V!27369 (_ BitVec 32) Int) ListLongMap!9909)

(assert (=> b!863375 (= lt!390173 (getCurrentListMapNoExtraKeys!2945 _keys!868 lt!390178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27369)

(assert (=> b!863375 (= lt!390176 (tuple2!11141 k!854 v!557))))

(declare-fun _values!688 () array!49646)

(assert (=> b!863375 (= lt!390169 (getCurrentListMapNoExtraKeys!2945 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29509 0))(
  ( (Unit!29510) )
))
(declare-fun lt!390172 () Unit!29509)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!527 (array!49644 array!49646 (_ BitVec 32) (_ BitVec 32) V!27369 V!27369 (_ BitVec 32) (_ BitVec 64) V!27369 (_ BitVec 32) Int) Unit!29509)

(assert (=> b!863375 (= lt!390172 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!527 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863376 () Bool)

(declare-fun e!480999 () Bool)

(assert (=> b!863376 (= e!480999 e!480997)))

(declare-fun res!586687 () Bool)

(assert (=> b!863376 (=> (not res!586687) (not e!480997))))

(assert (=> b!863376 (= res!586687 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390174 () ListLongMap!9909)

(assert (=> b!863376 (= lt!390174 (getCurrentListMapNoExtraKeys!2945 _keys!868 lt!390178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863376 (= lt!390178 (array!49647 (store (arr!23854 _values!688) i!612 (ValueCellFull!7931 v!557)) (size!24294 _values!688)))))

(declare-fun lt!390177 () ListLongMap!9909)

(assert (=> b!863376 (= lt!390177 (getCurrentListMapNoExtraKeys!2945 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863377 () Bool)

(declare-fun e!480995 () Bool)

(declare-fun tp_is_empty!16741 () Bool)

(assert (=> b!863377 (= e!480995 tp_is_empty!16741)))

(declare-fun b!863378 () Bool)

(declare-fun res!586690 () Bool)

(assert (=> b!863378 (=> (not res!586690) (not e!480999))))

(declare-datatypes ((List!16949 0))(
  ( (Nil!16946) (Cons!16945 (h!18076 (_ BitVec 64)) (t!23820 List!16949)) )
))
(declare-fun arrayNoDuplicates!0 (array!49644 (_ BitVec 32) List!16949) Bool)

(assert (=> b!863378 (= res!586690 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16946))))

(declare-fun b!863379 () Bool)

(declare-fun res!586684 () Bool)

(assert (=> b!863379 (=> (not res!586684) (not e!480999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863379 (= res!586684 (validMask!0 mask!1196))))

(declare-fun b!863380 () Bool)

(declare-fun res!586681 () Bool)

(assert (=> b!863380 (=> (not res!586681) (not e!480999))))

(assert (=> b!863380 (= res!586681 (and (= (size!24294 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24293 _keys!868) (size!24294 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!586689 () Bool)

(assert (=> start!73690 (=> (not res!586689) (not e!480999))))

(assert (=> start!73690 (= res!586689 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24293 _keys!868))))))

(assert (=> start!73690 e!480999))

(assert (=> start!73690 tp_is_empty!16741))

(assert (=> start!73690 true))

(assert (=> start!73690 tp!51319))

(declare-fun array_inv!18870 (array!49644) Bool)

(assert (=> start!73690 (array_inv!18870 _keys!868)))

(declare-fun e!480993 () Bool)

(declare-fun array_inv!18871 (array!49646) Bool)

(assert (=> start!73690 (and (array_inv!18871 _values!688) e!480993)))

(declare-fun b!863381 () Bool)

(declare-fun e!480994 () Bool)

(assert (=> b!863381 (= e!480996 e!480994)))

(declare-fun res!586683 () Bool)

(assert (=> b!863381 (=> res!586683 e!480994)))

(assert (=> b!863381 (= res!586683 (= k!854 (select (arr!23853 _keys!868) from!1053)))))

(assert (=> b!863381 (not (= (select (arr!23853 _keys!868) from!1053) k!854))))

(declare-fun lt!390175 () Unit!29509)

(declare-fun e!480998 () Unit!29509)

(assert (=> b!863381 (= lt!390175 e!480998)))

(declare-fun c!92128 () Bool)

(assert (=> b!863381 (= c!92128 (= (select (arr!23853 _keys!868) from!1053) k!854))))

(declare-fun lt!390184 () ListLongMap!9909)

(assert (=> b!863381 (= lt!390174 lt!390184)))

(declare-fun lt!390180 () tuple2!11140)

(assert (=> b!863381 (= lt!390184 (+!2319 lt!390183 lt!390180))))

(declare-fun lt!390171 () V!27369)

(assert (=> b!863381 (= lt!390180 (tuple2!11141 (select (arr!23853 _keys!868) from!1053) lt!390171))))

(declare-fun get!12595 (ValueCell!7931 V!27369) V!27369)

(declare-fun dynLambda!1149 (Int (_ BitVec 64)) V!27369)

(assert (=> b!863381 (= lt!390171 (get!12595 (select (arr!23854 _values!688) from!1053) (dynLambda!1149 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863382 () Bool)

(declare-fun res!586688 () Bool)

(assert (=> b!863382 (=> (not res!586688) (not e!480999))))

(assert (=> b!863382 (= res!586688 (and (= (select (arr!23853 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863383 () Bool)

(assert (=> b!863383 (= e!480994 true)))

(assert (=> b!863383 (= lt!390184 (+!2319 (+!2319 lt!390169 lt!390180) lt!390176))))

(declare-fun lt!390182 () Unit!29509)

(declare-fun addCommutativeForDiffKeys!493 (ListLongMap!9909 (_ BitVec 64) V!27369 (_ BitVec 64) V!27369) Unit!29509)

(assert (=> b!863383 (= lt!390182 (addCommutativeForDiffKeys!493 lt!390169 k!854 v!557 (select (arr!23853 _keys!868) from!1053) lt!390171))))

(declare-fun b!863384 () Bool)

(declare-fun Unit!29511 () Unit!29509)

(assert (=> b!863384 (= e!480998 Unit!29511)))

(declare-fun b!863385 () Bool)

(declare-fun e!481000 () Bool)

(assert (=> b!863385 (= e!481000 tp_is_empty!16741)))

(declare-fun b!863386 () Bool)

(declare-fun res!586691 () Bool)

(assert (=> b!863386 (=> (not res!586691) (not e!480999))))

(assert (=> b!863386 (= res!586691 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24293 _keys!868))))))

(declare-fun b!863387 () Bool)

(declare-fun res!586685 () Bool)

(assert (=> b!863387 (=> (not res!586685) (not e!480999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49644 (_ BitVec 32)) Bool)

(assert (=> b!863387 (= res!586685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863388 () Bool)

(declare-fun res!586686 () Bool)

(assert (=> b!863388 (=> (not res!586686) (not e!480999))))

(assert (=> b!863388 (= res!586686 (validKeyInArray!0 k!854))))

(declare-fun b!863389 () Bool)

(declare-fun Unit!29512 () Unit!29509)

(assert (=> b!863389 (= e!480998 Unit!29512)))

(declare-fun lt!390179 () Unit!29509)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49644 (_ BitVec 32) (_ BitVec 32)) Unit!29509)

(assert (=> b!863389 (= lt!390179 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863389 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16946)))

(declare-fun lt!390170 () Unit!29509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29509)

(assert (=> b!863389 (= lt!390170 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863389 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390181 () Unit!29509)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49644 (_ BitVec 64) (_ BitVec 32) List!16949) Unit!29509)

(assert (=> b!863389 (= lt!390181 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16946))))

(assert (=> b!863389 false))

(declare-fun b!863390 () Bool)

(declare-fun mapRes!26711 () Bool)

(assert (=> b!863390 (= e!480993 (and e!480995 mapRes!26711))))

(declare-fun condMapEmpty!26711 () Bool)

(declare-fun mapDefault!26711 () ValueCell!7931)

