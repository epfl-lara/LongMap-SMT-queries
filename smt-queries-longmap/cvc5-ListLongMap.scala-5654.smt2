; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73708 () Bool)

(assert start!73708)

(declare-fun b_free!14623 () Bool)

(declare-fun b_next!14623 () Bool)

(assert (=> start!73708 (= b_free!14623 (not b_next!14623))))

(declare-fun tp!51372 () Bool)

(declare-fun b_and!24225 () Bool)

(assert (=> start!73708 (= tp!51372 b_and!24225)))

(declare-fun b!863825 () Bool)

(declare-fun e!481243 () Bool)

(declare-fun tp_is_empty!16759 () Bool)

(assert (=> b!863825 (= e!481243 tp_is_empty!16759)))

(declare-fun b!863826 () Bool)

(declare-datatypes ((Unit!29536 0))(
  ( (Unit!29537) )
))
(declare-fun e!481241 () Unit!29536)

(declare-fun Unit!29538 () Unit!29536)

(assert (=> b!863826 (= e!481241 Unit!29538)))

(declare-fun lt!390612 () Unit!29536)

(declare-datatypes ((array!49680 0))(
  ( (array!49681 (arr!23871 (Array (_ BitVec 32) (_ BitVec 64))) (size!24311 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49680)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49680 (_ BitVec 32) (_ BitVec 32)) Unit!29536)

(assert (=> b!863826 (= lt!390612 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16962 0))(
  ( (Nil!16959) (Cons!16958 (h!18089 (_ BitVec 64)) (t!23851 List!16962)) )
))
(declare-fun arrayNoDuplicates!0 (array!49680 (_ BitVec 32) List!16962) Bool)

(assert (=> b!863826 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16959)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!390614 () Unit!29536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29536)

(assert (=> b!863826 (= lt!390614 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863826 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390604 () Unit!29536)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49680 (_ BitVec 64) (_ BitVec 32) List!16962) Unit!29536)

(assert (=> b!863826 (= lt!390604 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16959))))

(assert (=> b!863826 false))

(declare-fun res!586988 () Bool)

(declare-fun e!481242 () Bool)

(assert (=> start!73708 (=> (not res!586988) (not e!481242))))

(assert (=> start!73708 (= res!586988 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24311 _keys!868))))))

(assert (=> start!73708 e!481242))

(assert (=> start!73708 tp_is_empty!16759))

(assert (=> start!73708 true))

(assert (=> start!73708 tp!51372))

(declare-fun array_inv!18880 (array!49680) Bool)

(assert (=> start!73708 (array_inv!18880 _keys!868)))

(declare-datatypes ((V!27393 0))(
  ( (V!27394 (val!8427 Int)) )
))
(declare-datatypes ((ValueCell!7940 0))(
  ( (ValueCellFull!7940 (v!10852 V!27393)) (EmptyCell!7940) )
))
(declare-datatypes ((array!49682 0))(
  ( (array!49683 (arr!23872 (Array (_ BitVec 32) ValueCell!7940)) (size!24312 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49682)

(declare-fun e!481240 () Bool)

(declare-fun array_inv!18881 (array!49682) Bool)

(assert (=> start!73708 (and (array_inv!18881 _values!688) e!481240)))

(declare-fun b!863827 () Bool)

(declare-fun e!481236 () Bool)

(assert (=> b!863827 (= e!481236 true)))

(declare-datatypes ((tuple2!11156 0))(
  ( (tuple2!11157 (_1!5589 (_ BitVec 64)) (_2!5589 V!27393)) )
))
(declare-fun lt!390601 () tuple2!11156)

(declare-datatypes ((List!16963 0))(
  ( (Nil!16960) (Cons!16959 (h!18090 tuple2!11156) (t!23852 List!16963)) )
))
(declare-datatypes ((ListLongMap!9925 0))(
  ( (ListLongMap!9926 (toList!4978 List!16963)) )
))
(declare-fun lt!390613 () ListLongMap!9925)

(declare-fun lt!390615 () tuple2!11156)

(declare-fun lt!390606 () ListLongMap!9925)

(declare-fun +!2327 (ListLongMap!9925 tuple2!11156) ListLongMap!9925)

(assert (=> b!863827 (= lt!390613 (+!2327 (+!2327 lt!390606 lt!390601) lt!390615))))

(declare-fun v!557 () V!27393)

(declare-fun lt!390605 () V!27393)

(declare-fun lt!390602 () Unit!29536)

(declare-fun addCommutativeForDiffKeys!500 (ListLongMap!9925 (_ BitVec 64) V!27393 (_ BitVec 64) V!27393) Unit!29536)

(assert (=> b!863827 (= lt!390602 (addCommutativeForDiffKeys!500 lt!390606 k!854 v!557 (select (arr!23871 _keys!868) from!1053) lt!390605))))

(declare-fun b!863828 () Bool)

(declare-fun res!586981 () Bool)

(assert (=> b!863828 (=> (not res!586981) (not e!481242))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49680 (_ BitVec 32)) Bool)

(assert (=> b!863828 (= res!586981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863829 () Bool)

(declare-fun res!586982 () Bool)

(assert (=> b!863829 (=> (not res!586982) (not e!481242))))

(assert (=> b!863829 (= res!586982 (and (= (select (arr!23871 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863830 () Bool)

(declare-fun e!481239 () Bool)

(assert (=> b!863830 (= e!481239 e!481236)))

(declare-fun res!586986 () Bool)

(assert (=> b!863830 (=> res!586986 e!481236)))

(assert (=> b!863830 (= res!586986 (= k!854 (select (arr!23871 _keys!868) from!1053)))))

(assert (=> b!863830 (not (= (select (arr!23871 _keys!868) from!1053) k!854))))

(declare-fun lt!390610 () Unit!29536)

(assert (=> b!863830 (= lt!390610 e!481241)))

(declare-fun c!92155 () Bool)

(assert (=> b!863830 (= c!92155 (= (select (arr!23871 _keys!868) from!1053) k!854))))

(declare-fun lt!390608 () ListLongMap!9925)

(assert (=> b!863830 (= lt!390608 lt!390613)))

(declare-fun lt!390616 () ListLongMap!9925)

(assert (=> b!863830 (= lt!390613 (+!2327 lt!390616 lt!390601))))

(assert (=> b!863830 (= lt!390601 (tuple2!11157 (select (arr!23871 _keys!868) from!1053) lt!390605))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12606 (ValueCell!7940 V!27393) V!27393)

(declare-fun dynLambda!1154 (Int (_ BitVec 64)) V!27393)

(assert (=> b!863830 (= lt!390605 (get!12606 (select (arr!23872 _values!688) from!1053) (dynLambda!1154 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863831 () Bool)

(declare-fun res!586987 () Bool)

(assert (=> b!863831 (=> (not res!586987) (not e!481242))))

(assert (=> b!863831 (= res!586987 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24311 _keys!868))))))

(declare-fun b!863832 () Bool)

(declare-fun e!481235 () Bool)

(assert (=> b!863832 (= e!481242 e!481235)))

(declare-fun res!586985 () Bool)

(assert (=> b!863832 (=> (not res!586985) (not e!481235))))

(assert (=> b!863832 (= res!586985 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27393)

(declare-fun zeroValue!654 () V!27393)

(declare-fun lt!390603 () array!49682)

(declare-fun getCurrentListMapNoExtraKeys!2952 (array!49680 array!49682 (_ BitVec 32) (_ BitVec 32) V!27393 V!27393 (_ BitVec 32) Int) ListLongMap!9925)

(assert (=> b!863832 (= lt!390608 (getCurrentListMapNoExtraKeys!2952 _keys!868 lt!390603 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863832 (= lt!390603 (array!49683 (store (arr!23872 _values!688) i!612 (ValueCellFull!7940 v!557)) (size!24312 _values!688)))))

(declare-fun lt!390607 () ListLongMap!9925)

(assert (=> b!863832 (= lt!390607 (getCurrentListMapNoExtraKeys!2952 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863833 () Bool)

(declare-fun e!481237 () Bool)

(assert (=> b!863833 (= e!481237 tp_is_empty!16759)))

(declare-fun b!863834 () Bool)

(declare-fun res!586978 () Bool)

(assert (=> b!863834 (=> (not res!586978) (not e!481242))))

(assert (=> b!863834 (= res!586978 (and (= (size!24312 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24311 _keys!868) (size!24312 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26738 () Bool)

(declare-fun mapRes!26738 () Bool)

(declare-fun tp!51373 () Bool)

(assert (=> mapNonEmpty!26738 (= mapRes!26738 (and tp!51373 e!481243))))

(declare-fun mapKey!26738 () (_ BitVec 32))

(declare-fun mapRest!26738 () (Array (_ BitVec 32) ValueCell!7940))

(declare-fun mapValue!26738 () ValueCell!7940)

(assert (=> mapNonEmpty!26738 (= (arr!23872 _values!688) (store mapRest!26738 mapKey!26738 mapValue!26738))))

(declare-fun mapIsEmpty!26738 () Bool)

(assert (=> mapIsEmpty!26738 mapRes!26738))

(declare-fun b!863835 () Bool)

(assert (=> b!863835 (= e!481240 (and e!481237 mapRes!26738))))

(declare-fun condMapEmpty!26738 () Bool)

(declare-fun mapDefault!26738 () ValueCell!7940)

