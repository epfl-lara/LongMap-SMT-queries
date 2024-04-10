; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73736 () Bool)

(assert start!73736)

(declare-fun b_free!14651 () Bool)

(declare-fun b_next!14651 () Bool)

(assert (=> start!73736 (= b_free!14651 (not b_next!14651))))

(declare-fun tp!51457 () Bool)

(declare-fun b_and!24281 () Bool)

(assert (=> start!73736 (= tp!51457 b_and!24281)))

(declare-fun b!864525 () Bool)

(declare-fun e!481613 () Bool)

(assert (=> b!864525 (= e!481613 true)))

(declare-datatypes ((V!27429 0))(
  ( (V!27430 (val!8441 Int)) )
))
(declare-datatypes ((tuple2!11178 0))(
  ( (tuple2!11179 (_1!5600 (_ BitVec 64)) (_2!5600 V!27429)) )
))
(declare-datatypes ((List!16983 0))(
  ( (Nil!16980) (Cons!16979 (h!18110 tuple2!11178) (t!23900 List!16983)) )
))
(declare-datatypes ((ListLongMap!9947 0))(
  ( (ListLongMap!9948 (toList!4989 List!16983)) )
))
(declare-fun lt!391278 () ListLongMap!9947)

(declare-fun lt!391287 () tuple2!11178)

(declare-fun lt!391276 () ListLongMap!9947)

(declare-fun lt!391282 () tuple2!11178)

(declare-fun +!2338 (ListLongMap!9947 tuple2!11178) ListLongMap!9947)

(assert (=> b!864525 (= lt!391278 (+!2338 (+!2338 lt!391276 lt!391287) lt!391282))))

(declare-datatypes ((Unit!29579 0))(
  ( (Unit!29580) )
))
(declare-fun lt!391281 () Unit!29579)

(declare-fun v!557 () V!27429)

(declare-fun lt!391273 () V!27429)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49734 0))(
  ( (array!49735 (arr!23898 (Array (_ BitVec 32) (_ BitVec 64))) (size!24338 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49734)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!510 (ListLongMap!9947 (_ BitVec 64) V!27429 (_ BitVec 64) V!27429) Unit!29579)

(assert (=> b!864525 (= lt!391281 (addCommutativeForDiffKeys!510 lt!391276 k!854 v!557 (select (arr!23898 _keys!868) from!1053) lt!391273))))

(declare-fun b!864526 () Bool)

(declare-fun res!587448 () Bool)

(declare-fun e!481621 () Bool)

(assert (=> b!864526 (=> (not res!587448) (not e!481621))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864526 (= res!587448 (and (= (select (arr!23898 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!864527 () Bool)

(declare-fun e!481617 () Bool)

(declare-fun tp_is_empty!16787 () Bool)

(assert (=> b!864527 (= e!481617 tp_is_empty!16787)))

(declare-fun b!864528 () Bool)

(declare-fun e!481616 () Bool)

(assert (=> b!864528 (= e!481621 e!481616)))

(declare-fun res!587442 () Bool)

(assert (=> b!864528 (=> (not res!587442) (not e!481616))))

(assert (=> b!864528 (= res!587442 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!391288 () ListLongMap!9947)

(declare-datatypes ((ValueCell!7954 0))(
  ( (ValueCellFull!7954 (v!10866 V!27429)) (EmptyCell!7954) )
))
(declare-datatypes ((array!49736 0))(
  ( (array!49737 (arr!23899 (Array (_ BitVec 32) ValueCell!7954)) (size!24339 (_ BitVec 32))) )
))
(declare-fun lt!391274 () array!49736)

(declare-fun minValue!654 () V!27429)

(declare-fun zeroValue!654 () V!27429)

(declare-fun getCurrentListMapNoExtraKeys!2961 (array!49734 array!49736 (_ BitVec 32) (_ BitVec 32) V!27429 V!27429 (_ BitVec 32) Int) ListLongMap!9947)

(assert (=> b!864528 (= lt!391288 (getCurrentListMapNoExtraKeys!2961 _keys!868 lt!391274 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49736)

(assert (=> b!864528 (= lt!391274 (array!49737 (store (arr!23899 _values!688) i!612 (ValueCellFull!7954 v!557)) (size!24339 _values!688)))))

(declare-fun lt!391283 () ListLongMap!9947)

(assert (=> b!864528 (= lt!391283 (getCurrentListMapNoExtraKeys!2961 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864529 () Bool)

(declare-fun e!481614 () Bool)

(assert (=> b!864529 (= e!481614 tp_is_empty!16787)))

(declare-fun b!864530 () Bool)

(declare-fun res!587440 () Bool)

(assert (=> b!864530 (=> (not res!587440) (not e!481621))))

(assert (=> b!864530 (= res!587440 (and (= (size!24339 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24338 _keys!868) (size!24339 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864531 () Bool)

(declare-fun res!587446 () Bool)

(assert (=> b!864531 (=> (not res!587446) (not e!481621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864531 (= res!587446 (validKeyInArray!0 k!854))))

(declare-fun b!864533 () Bool)

(declare-fun e!481620 () Bool)

(assert (=> b!864533 (= e!481616 (not e!481620))))

(declare-fun res!587444 () Bool)

(assert (=> b!864533 (=> res!587444 e!481620)))

(assert (=> b!864533 (= res!587444 (not (validKeyInArray!0 (select (arr!23898 _keys!868) from!1053))))))

(declare-fun lt!391277 () ListLongMap!9947)

(declare-fun lt!391280 () ListLongMap!9947)

(assert (=> b!864533 (= lt!391277 lt!391280)))

(assert (=> b!864533 (= lt!391280 (+!2338 lt!391276 lt!391282))))

(assert (=> b!864533 (= lt!391277 (getCurrentListMapNoExtraKeys!2961 _keys!868 lt!391274 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864533 (= lt!391282 (tuple2!11179 k!854 v!557))))

(assert (=> b!864533 (= lt!391276 (getCurrentListMapNoExtraKeys!2961 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391284 () Unit!29579)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!541 (array!49734 array!49736 (_ BitVec 32) (_ BitVec 32) V!27429 V!27429 (_ BitVec 32) (_ BitVec 64) V!27429 (_ BitVec 32) Int) Unit!29579)

(assert (=> b!864533 (= lt!391284 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!541 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864534 () Bool)

(declare-fun res!587449 () Bool)

(assert (=> b!864534 (=> (not res!587449) (not e!481621))))

(assert (=> b!864534 (= res!587449 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24338 _keys!868))))))

(declare-fun b!864535 () Bool)

(declare-fun e!481618 () Unit!29579)

(declare-fun Unit!29581 () Unit!29579)

(assert (=> b!864535 (= e!481618 Unit!29581)))

(declare-fun mapNonEmpty!26780 () Bool)

(declare-fun mapRes!26780 () Bool)

(declare-fun tp!51456 () Bool)

(assert (=> mapNonEmpty!26780 (= mapRes!26780 (and tp!51456 e!481617))))

(declare-fun mapKey!26780 () (_ BitVec 32))

(declare-fun mapRest!26780 () (Array (_ BitVec 32) ValueCell!7954))

(declare-fun mapValue!26780 () ValueCell!7954)

(assert (=> mapNonEmpty!26780 (= (arr!23899 _values!688) (store mapRest!26780 mapKey!26780 mapValue!26780))))

(declare-fun b!864536 () Bool)

(declare-fun Unit!29582 () Unit!29579)

(assert (=> b!864536 (= e!481618 Unit!29582)))

(declare-fun lt!391275 () Unit!29579)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49734 (_ BitVec 32) (_ BitVec 32)) Unit!29579)

(assert (=> b!864536 (= lt!391275 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16984 0))(
  ( (Nil!16981) (Cons!16980 (h!18111 (_ BitVec 64)) (t!23901 List!16984)) )
))
(declare-fun arrayNoDuplicates!0 (array!49734 (_ BitVec 32) List!16984) Bool)

(assert (=> b!864536 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16981)))

(declare-fun lt!391279 () Unit!29579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49734 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29579)

(assert (=> b!864536 (= lt!391279 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864536 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391285 () Unit!29579)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49734 (_ BitVec 64) (_ BitVec 32) List!16984) Unit!29579)

(assert (=> b!864536 (= lt!391285 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16981))))

(assert (=> b!864536 false))

(declare-fun mapIsEmpty!26780 () Bool)

(assert (=> mapIsEmpty!26780 mapRes!26780))

(declare-fun b!864537 () Bool)

(declare-fun res!587443 () Bool)

(assert (=> b!864537 (=> (not res!587443) (not e!481621))))

(assert (=> b!864537 (= res!587443 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16981))))

(declare-fun b!864538 () Bool)

(assert (=> b!864538 (= e!481620 e!481613)))

(declare-fun res!587441 () Bool)

(assert (=> b!864538 (=> res!587441 e!481613)))

(assert (=> b!864538 (= res!587441 (= k!854 (select (arr!23898 _keys!868) from!1053)))))

(assert (=> b!864538 (not (= (select (arr!23898 _keys!868) from!1053) k!854))))

(declare-fun lt!391286 () Unit!29579)

(assert (=> b!864538 (= lt!391286 e!481618)))

(declare-fun c!92197 () Bool)

(assert (=> b!864538 (= c!92197 (= (select (arr!23898 _keys!868) from!1053) k!854))))

(assert (=> b!864538 (= lt!391288 lt!391278)))

(assert (=> b!864538 (= lt!391278 (+!2338 lt!391280 lt!391287))))

(assert (=> b!864538 (= lt!391287 (tuple2!11179 (select (arr!23898 _keys!868) from!1053) lt!391273))))

(declare-fun get!12624 (ValueCell!7954 V!27429) V!27429)

(declare-fun dynLambda!1164 (Int (_ BitVec 64)) V!27429)

(assert (=> b!864538 (= lt!391273 (get!12624 (select (arr!23899 _values!688) from!1053) (dynLambda!1164 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864539 () Bool)

(declare-fun e!481619 () Bool)

(assert (=> b!864539 (= e!481619 (and e!481614 mapRes!26780))))

(declare-fun condMapEmpty!26780 () Bool)

(declare-fun mapDefault!26780 () ValueCell!7954)

