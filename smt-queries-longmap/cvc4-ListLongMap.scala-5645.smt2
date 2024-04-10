; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73658 () Bool)

(assert start!73658)

(declare-fun b_free!14573 () Bool)

(declare-fun b_next!14573 () Bool)

(assert (=> start!73658 (= b_free!14573 (not b_next!14573))))

(declare-fun tp!51222 () Bool)

(declare-fun b_and!24125 () Bool)

(assert (=> start!73658 (= tp!51222 b_and!24125)))

(declare-fun b!862575 () Bool)

(declare-fun res!586153 () Bool)

(declare-fun e!480563 () Bool)

(assert (=> b!862575 (=> (not res!586153) (not e!480563))))

(declare-datatypes ((array!49582 0))(
  ( (array!49583 (arr!23822 (Array (_ BitVec 32) (_ BitVec 64))) (size!24262 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49582)

(declare-datatypes ((List!16923 0))(
  ( (Nil!16920) (Cons!16919 (h!18050 (_ BitVec 64)) (t!23762 List!16923)) )
))
(declare-fun arrayNoDuplicates!0 (array!49582 (_ BitVec 32) List!16923) Bool)

(assert (=> b!862575 (= res!586153 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16920))))

(declare-fun b!862576 () Bool)

(declare-datatypes ((Unit!29461 0))(
  ( (Unit!29462) )
))
(declare-fun e!480561 () Unit!29461)

(declare-fun Unit!29463 () Unit!29461)

(assert (=> b!862576 (= e!480561 Unit!29463)))

(declare-fun lt!389406 () Unit!29461)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49582 (_ BitVec 32) (_ BitVec 32)) Unit!29461)

(assert (=> b!862576 (= lt!389406 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862576 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16920)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!389411 () Unit!29461)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49582 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29461)

(assert (=> b!862576 (= lt!389411 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862576 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389403 () Unit!29461)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49582 (_ BitVec 64) (_ BitVec 32) List!16923) Unit!29461)

(assert (=> b!862576 (= lt!389403 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16920))))

(assert (=> b!862576 false))

(declare-fun b!862577 () Bool)

(declare-fun res!586155 () Bool)

(assert (=> b!862577 (=> (not res!586155) (not e!480563))))

(assert (=> b!862577 (= res!586155 (and (= (select (arr!23822 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!862578 () Bool)

(declare-fun e!480564 () Bool)

(declare-fun e!480567 () Bool)

(assert (=> b!862578 (= e!480564 (not e!480567))))

(declare-fun res!586160 () Bool)

(assert (=> b!862578 (=> res!586160 e!480567)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862578 (= res!586160 (not (validKeyInArray!0 (select (arr!23822 _keys!868) from!1053))))))

(declare-datatypes ((V!27325 0))(
  ( (V!27326 (val!8402 Int)) )
))
(declare-datatypes ((tuple2!11114 0))(
  ( (tuple2!11115 (_1!5568 (_ BitVec 64)) (_2!5568 V!27325)) )
))
(declare-datatypes ((List!16924 0))(
  ( (Nil!16921) (Cons!16920 (h!18051 tuple2!11114) (t!23763 List!16924)) )
))
(declare-datatypes ((ListLongMap!9883 0))(
  ( (ListLongMap!9884 (toList!4957 List!16924)) )
))
(declare-fun lt!389409 () ListLongMap!9883)

(declare-fun lt!389401 () ListLongMap!9883)

(assert (=> b!862578 (= lt!389409 lt!389401)))

(declare-fun lt!389415 () ListLongMap!9883)

(declare-fun lt!389413 () tuple2!11114)

(declare-fun +!2306 (ListLongMap!9883 tuple2!11114) ListLongMap!9883)

(assert (=> b!862578 (= lt!389401 (+!2306 lt!389415 lt!389413))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7915 0))(
  ( (ValueCellFull!7915 (v!10827 V!27325)) (EmptyCell!7915) )
))
(declare-datatypes ((array!49584 0))(
  ( (array!49585 (arr!23823 (Array (_ BitVec 32) ValueCell!7915)) (size!24263 (_ BitVec 32))) )
))
(declare-fun lt!389408 () array!49584)

(declare-fun minValue!654 () V!27325)

(declare-fun zeroValue!654 () V!27325)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2933 (array!49582 array!49584 (_ BitVec 32) (_ BitVec 32) V!27325 V!27325 (_ BitVec 32) Int) ListLongMap!9883)

(assert (=> b!862578 (= lt!389409 (getCurrentListMapNoExtraKeys!2933 _keys!868 lt!389408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27325)

(assert (=> b!862578 (= lt!389413 (tuple2!11115 k!854 v!557))))

(declare-fun _values!688 () array!49584)

(assert (=> b!862578 (= lt!389415 (getCurrentListMapNoExtraKeys!2933 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389410 () Unit!29461)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!515 (array!49582 array!49584 (_ BitVec 32) (_ BitVec 32) V!27325 V!27325 (_ BitVec 32) (_ BitVec 64) V!27325 (_ BitVec 32) Int) Unit!29461)

(assert (=> b!862578 (= lt!389410 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!515 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862579 () Bool)

(assert (=> b!862579 (= e!480563 e!480564)))

(declare-fun res!586163 () Bool)

(assert (=> b!862579 (=> (not res!586163) (not e!480564))))

(assert (=> b!862579 (= res!586163 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389405 () ListLongMap!9883)

(assert (=> b!862579 (= lt!389405 (getCurrentListMapNoExtraKeys!2933 _keys!868 lt!389408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862579 (= lt!389408 (array!49585 (store (arr!23823 _values!688) i!612 (ValueCellFull!7915 v!557)) (size!24263 _values!688)))))

(declare-fun lt!389404 () ListLongMap!9883)

(assert (=> b!862579 (= lt!389404 (getCurrentListMapNoExtraKeys!2933 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862580 () Bool)

(declare-fun res!586162 () Bool)

(assert (=> b!862580 (=> (not res!586162) (not e!480563))))

(assert (=> b!862580 (= res!586162 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24262 _keys!868))))))

(declare-fun b!862581 () Bool)

(declare-fun res!586161 () Bool)

(assert (=> b!862581 (=> (not res!586161) (not e!480563))))

(assert (=> b!862581 (= res!586161 (validKeyInArray!0 k!854))))

(declare-fun res!586157 () Bool)

(assert (=> start!73658 (=> (not res!586157) (not e!480563))))

(assert (=> start!73658 (= res!586157 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24262 _keys!868))))))

(assert (=> start!73658 e!480563))

(declare-fun tp_is_empty!16709 () Bool)

(assert (=> start!73658 tp_is_empty!16709))

(assert (=> start!73658 true))

(assert (=> start!73658 tp!51222))

(declare-fun array_inv!18846 (array!49582) Bool)

(assert (=> start!73658 (array_inv!18846 _keys!868)))

(declare-fun e!480565 () Bool)

(declare-fun array_inv!18847 (array!49584) Bool)

(assert (=> start!73658 (and (array_inv!18847 _values!688) e!480565)))

(declare-fun b!862582 () Bool)

(declare-fun Unit!29464 () Unit!29461)

(assert (=> b!862582 (= e!480561 Unit!29464)))

(declare-fun mapNonEmpty!26663 () Bool)

(declare-fun mapRes!26663 () Bool)

(declare-fun tp!51223 () Bool)

(declare-fun e!480562 () Bool)

(assert (=> mapNonEmpty!26663 (= mapRes!26663 (and tp!51223 e!480562))))

(declare-fun mapValue!26663 () ValueCell!7915)

(declare-fun mapKey!26663 () (_ BitVec 32))

(declare-fun mapRest!26663 () (Array (_ BitVec 32) ValueCell!7915))

(assert (=> mapNonEmpty!26663 (= (arr!23823 _values!688) (store mapRest!26663 mapKey!26663 mapValue!26663))))

(declare-fun b!862583 () Bool)

(declare-fun e!480566 () Bool)

(assert (=> b!862583 (= e!480565 (and e!480566 mapRes!26663))))

(declare-fun condMapEmpty!26663 () Bool)

(declare-fun mapDefault!26663 () ValueCell!7915)

