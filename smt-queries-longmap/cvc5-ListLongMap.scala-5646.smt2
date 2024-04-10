; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73660 () Bool)

(assert start!73660)

(declare-fun b_free!14575 () Bool)

(declare-fun b_next!14575 () Bool)

(assert (=> start!73660 (= b_free!14575 (not b_next!14575))))

(declare-fun tp!51228 () Bool)

(declare-fun b_and!24129 () Bool)

(assert (=> start!73660 (= tp!51228 b_and!24129)))

(declare-fun b!862625 () Bool)

(declare-fun e!480592 () Bool)

(assert (=> b!862625 (= e!480592 true)))

(declare-datatypes ((V!27329 0))(
  ( (V!27330 (val!8403 Int)) )
))
(declare-datatypes ((tuple2!11116 0))(
  ( (tuple2!11117 (_1!5569 (_ BitVec 64)) (_2!5569 V!27329)) )
))
(declare-fun lt!389455 () tuple2!11116)

(declare-datatypes ((List!16925 0))(
  ( (Nil!16922) (Cons!16921 (h!18052 tuple2!11116) (t!23766 List!16925)) )
))
(declare-datatypes ((ListLongMap!9885 0))(
  ( (ListLongMap!9886 (toList!4958 List!16925)) )
))
(declare-fun lt!389458 () ListLongMap!9885)

(declare-fun lt!389461 () ListLongMap!9885)

(declare-fun lt!389449 () tuple2!11116)

(declare-fun +!2307 (ListLongMap!9885 tuple2!11116) ListLongMap!9885)

(assert (=> b!862625 (= lt!389458 (+!2307 (+!2307 lt!389461 lt!389449) lt!389455))))

(declare-fun v!557 () V!27329)

(declare-fun lt!389451 () V!27329)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49586 0))(
  ( (array!49587 (arr!23824 (Array (_ BitVec 32) (_ BitVec 64))) (size!24264 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49586)

(declare-datatypes ((Unit!29465 0))(
  ( (Unit!29466) )
))
(declare-fun lt!389463 () Unit!29465)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!483 (ListLongMap!9885 (_ BitVec 64) V!27329 (_ BitVec 64) V!27329) Unit!29465)

(assert (=> b!862625 (= lt!389463 (addCommutativeForDiffKeys!483 lt!389461 k!854 v!557 (select (arr!23824 _keys!868) from!1053) lt!389451))))

(declare-fun b!862626 () Bool)

(declare-fun e!480587 () Bool)

(declare-fun tp_is_empty!16711 () Bool)

(assert (=> b!862626 (= e!480587 tp_is_empty!16711)))

(declare-fun b!862627 () Bool)

(declare-fun e!480591 () Unit!29465)

(declare-fun Unit!29467 () Unit!29465)

(assert (=> b!862627 (= e!480591 Unit!29467)))

(declare-fun b!862628 () Bool)

(declare-fun res!586195 () Bool)

(declare-fun e!480590 () Bool)

(assert (=> b!862628 (=> (not res!586195) (not e!480590))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862628 (= res!586195 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26666 () Bool)

(declare-fun mapRes!26666 () Bool)

(declare-fun tp!51229 () Bool)

(assert (=> mapNonEmpty!26666 (= mapRes!26666 (and tp!51229 e!480587))))

(declare-datatypes ((ValueCell!7916 0))(
  ( (ValueCellFull!7916 (v!10828 V!27329)) (EmptyCell!7916) )
))
(declare-fun mapValue!26666 () ValueCell!7916)

(declare-fun mapKey!26666 () (_ BitVec 32))

(declare-fun mapRest!26666 () (Array (_ BitVec 32) ValueCell!7916))

(declare-datatypes ((array!49588 0))(
  ( (array!49589 (arr!23825 (Array (_ BitVec 32) ValueCell!7916)) (size!24265 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49588)

(assert (=> mapNonEmpty!26666 (= (arr!23825 _values!688) (store mapRest!26666 mapKey!26666 mapValue!26666))))

(declare-fun b!862629 () Bool)

(declare-fun res!586191 () Bool)

(assert (=> b!862629 (=> (not res!586191) (not e!480590))))

(declare-datatypes ((List!16926 0))(
  ( (Nil!16923) (Cons!16922 (h!18053 (_ BitVec 64)) (t!23767 List!16926)) )
))
(declare-fun arrayNoDuplicates!0 (array!49586 (_ BitVec 32) List!16926) Bool)

(assert (=> b!862629 (= res!586191 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16923))))

(declare-fun b!862630 () Bool)

(declare-fun e!480593 () Bool)

(assert (=> b!862630 (= e!480593 e!480592)))

(declare-fun res!586193 () Bool)

(assert (=> b!862630 (=> res!586193 e!480592)))

(assert (=> b!862630 (= res!586193 (= k!854 (select (arr!23824 _keys!868) from!1053)))))

(assert (=> b!862630 (not (= (select (arr!23824 _keys!868) from!1053) k!854))))

(declare-fun lt!389456 () Unit!29465)

(assert (=> b!862630 (= lt!389456 e!480591)))

(declare-fun c!92083 () Bool)

(assert (=> b!862630 (= c!92083 (= (select (arr!23824 _keys!868) from!1053) k!854))))

(declare-fun lt!389460 () ListLongMap!9885)

(assert (=> b!862630 (= lt!389460 lt!389458)))

(declare-fun lt!389452 () ListLongMap!9885)

(assert (=> b!862630 (= lt!389458 (+!2307 lt!389452 lt!389449))))

(assert (=> b!862630 (= lt!389449 (tuple2!11117 (select (arr!23824 _keys!868) from!1053) lt!389451))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12575 (ValueCell!7916 V!27329) V!27329)

(declare-fun dynLambda!1139 (Int (_ BitVec 64)) V!27329)

(assert (=> b!862630 (= lt!389451 (get!12575 (select (arr!23825 _values!688) from!1053) (dynLambda!1139 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862631 () Bool)

(declare-fun res!586194 () Bool)

(assert (=> b!862631 (=> (not res!586194) (not e!480590))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862631 (= res!586194 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24264 _keys!868))))))

(declare-fun b!862632 () Bool)

(declare-fun Unit!29468 () Unit!29465)

(assert (=> b!862632 (= e!480591 Unit!29468)))

(declare-fun lt!389459 () Unit!29465)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49586 (_ BitVec 32) (_ BitVec 32)) Unit!29465)

(assert (=> b!862632 (= lt!389459 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862632 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16923)))

(declare-fun lt!389450 () Unit!29465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49586 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29465)

(assert (=> b!862632 (= lt!389450 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862632 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389462 () Unit!29465)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49586 (_ BitVec 64) (_ BitVec 32) List!16926) Unit!29465)

(assert (=> b!862632 (= lt!389462 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16923))))

(assert (=> b!862632 false))

(declare-fun b!862633 () Bool)

(declare-fun res!586189 () Bool)

(assert (=> b!862633 (=> (not res!586189) (not e!480590))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!862633 (= res!586189 (and (= (size!24265 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24264 _keys!868) (size!24265 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862634 () Bool)

(declare-fun res!586192 () Bool)

(assert (=> b!862634 (=> (not res!586192) (not e!480590))))

(assert (=> b!862634 (= res!586192 (and (= (select (arr!23824 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!862635 () Bool)

(declare-fun res!586196 () Bool)

(assert (=> b!862635 (=> (not res!586196) (not e!480590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49586 (_ BitVec 32)) Bool)

(assert (=> b!862635 (= res!586196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!586188 () Bool)

(assert (=> start!73660 (=> (not res!586188) (not e!480590))))

(assert (=> start!73660 (= res!586188 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24264 _keys!868))))))

(assert (=> start!73660 e!480590))

(assert (=> start!73660 tp_is_empty!16711))

(assert (=> start!73660 true))

(assert (=> start!73660 tp!51228))

(declare-fun array_inv!18848 (array!49586) Bool)

(assert (=> start!73660 (array_inv!18848 _keys!868)))

(declare-fun e!480588 () Bool)

(declare-fun array_inv!18849 (array!49588) Bool)

(assert (=> start!73660 (and (array_inv!18849 _values!688) e!480588)))

(declare-fun b!862636 () Bool)

(declare-fun res!586186 () Bool)

(assert (=> b!862636 (=> (not res!586186) (not e!480590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862636 (= res!586186 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26666 () Bool)

(assert (=> mapIsEmpty!26666 mapRes!26666))

(declare-fun b!862637 () Bool)

(declare-fun e!480589 () Bool)

(assert (=> b!862637 (= e!480589 (not e!480593))))

(declare-fun res!586190 () Bool)

(assert (=> b!862637 (=> res!586190 e!480593)))

(assert (=> b!862637 (= res!586190 (not (validKeyInArray!0 (select (arr!23824 _keys!868) from!1053))))))

(declare-fun lt!389453 () ListLongMap!9885)

(assert (=> b!862637 (= lt!389453 lt!389452)))

(assert (=> b!862637 (= lt!389452 (+!2307 lt!389461 lt!389455))))

(declare-fun lt!389454 () array!49588)

(declare-fun minValue!654 () V!27329)

(declare-fun zeroValue!654 () V!27329)

(declare-fun getCurrentListMapNoExtraKeys!2934 (array!49586 array!49588 (_ BitVec 32) (_ BitVec 32) V!27329 V!27329 (_ BitVec 32) Int) ListLongMap!9885)

(assert (=> b!862637 (= lt!389453 (getCurrentListMapNoExtraKeys!2934 _keys!868 lt!389454 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862637 (= lt!389455 (tuple2!11117 k!854 v!557))))

(assert (=> b!862637 (= lt!389461 (getCurrentListMapNoExtraKeys!2934 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389464 () Unit!29465)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!516 (array!49586 array!49588 (_ BitVec 32) (_ BitVec 32) V!27329 V!27329 (_ BitVec 32) (_ BitVec 64) V!27329 (_ BitVec 32) Int) Unit!29465)

(assert (=> b!862637 (= lt!389464 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!516 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862638 () Bool)

(declare-fun e!480595 () Bool)

(assert (=> b!862638 (= e!480588 (and e!480595 mapRes!26666))))

(declare-fun condMapEmpty!26666 () Bool)

(declare-fun mapDefault!26666 () ValueCell!7916)

