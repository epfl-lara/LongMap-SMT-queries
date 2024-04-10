; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73480 () Bool)

(assert start!73480)

(declare-fun b_free!14395 () Bool)

(declare-fun b_next!14395 () Bool)

(assert (=> start!73480 (= b_free!14395 (not b_next!14395))))

(declare-fun tp!50688 () Bool)

(declare-fun b_and!23769 () Bool)

(assert (=> start!73480 (= tp!50688 b_and!23769)))

(declare-fun b!858290 () Bool)

(declare-fun res!583079 () Bool)

(declare-fun e!478339 () Bool)

(assert (=> b!858290 (=> (not res!583079) (not e!478339))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49250 0))(
  ( (array!49251 (arr!23656 (Array (_ BitVec 32) (_ BitVec 64))) (size!24096 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49250)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858290 (= res!583079 (and (= (select (arr!23656 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858291 () Bool)

(declare-fun res!583085 () Bool)

(assert (=> b!858291 (=> (not res!583085) (not e!478339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858291 (= res!583085 (validKeyInArray!0 k!854))))

(declare-fun b!858292 () Bool)

(declare-fun res!583081 () Bool)

(assert (=> b!858292 (=> (not res!583081) (not e!478339))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49250 (_ BitVec 32)) Bool)

(assert (=> b!858292 (= res!583081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858293 () Bool)

(declare-fun res!583083 () Bool)

(assert (=> b!858293 (=> (not res!583083) (not e!478339))))

(declare-datatypes ((List!16782 0))(
  ( (Nil!16779) (Cons!16778 (h!17909 (_ BitVec 64)) (t!23443 List!16782)) )
))
(declare-fun arrayNoDuplicates!0 (array!49250 (_ BitVec 32) List!16782) Bool)

(assert (=> b!858293 (= res!583083 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16779))))

(declare-fun b!858295 () Bool)

(declare-fun res!583082 () Bool)

(assert (=> b!858295 (=> (not res!583082) (not e!478339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858295 (= res!583082 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26396 () Bool)

(declare-fun mapRes!26396 () Bool)

(assert (=> mapIsEmpty!26396 mapRes!26396))

(declare-fun b!858296 () Bool)

(declare-fun e!478335 () Bool)

(declare-fun e!478337 () Bool)

(assert (=> b!858296 (= e!478335 (not e!478337))))

(declare-fun res!583088 () Bool)

(assert (=> b!858296 (=> res!583088 e!478337)))

(assert (=> b!858296 (= res!583088 (not (validKeyInArray!0 (select (arr!23656 _keys!868) from!1053))))))

(declare-datatypes ((V!27089 0))(
  ( (V!27090 (val!8313 Int)) )
))
(declare-datatypes ((tuple2!10974 0))(
  ( (tuple2!10975 (_1!5498 (_ BitVec 64)) (_2!5498 V!27089)) )
))
(declare-datatypes ((List!16783 0))(
  ( (Nil!16780) (Cons!16779 (h!17910 tuple2!10974) (t!23444 List!16783)) )
))
(declare-datatypes ((ListLongMap!9743 0))(
  ( (ListLongMap!9744 (toList!4887 List!16783)) )
))
(declare-fun lt!386642 () ListLongMap!9743)

(declare-fun lt!386644 () ListLongMap!9743)

(assert (=> b!858296 (= lt!386642 lt!386644)))

(declare-fun v!557 () V!27089)

(declare-fun lt!386646 () ListLongMap!9743)

(declare-fun +!2240 (ListLongMap!9743 tuple2!10974) ListLongMap!9743)

(assert (=> b!858296 (= lt!386644 (+!2240 lt!386646 (tuple2!10975 k!854 v!557)))))

(declare-datatypes ((ValueCell!7826 0))(
  ( (ValueCellFull!7826 (v!10738 V!27089)) (EmptyCell!7826) )
))
(declare-datatypes ((array!49252 0))(
  ( (array!49253 (arr!23657 (Array (_ BitVec 32) ValueCell!7826)) (size!24097 (_ BitVec 32))) )
))
(declare-fun lt!386647 () array!49252)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27089)

(declare-fun zeroValue!654 () V!27089)

(declare-fun getCurrentListMapNoExtraKeys!2868 (array!49250 array!49252 (_ BitVec 32) (_ BitVec 32) V!27089 V!27089 (_ BitVec 32) Int) ListLongMap!9743)

(assert (=> b!858296 (= lt!386642 (getCurrentListMapNoExtraKeys!2868 _keys!868 lt!386647 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49252)

(assert (=> b!858296 (= lt!386646 (getCurrentListMapNoExtraKeys!2868 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29265 0))(
  ( (Unit!29266) )
))
(declare-fun lt!386645 () Unit!29265)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!460 (array!49250 array!49252 (_ BitVec 32) (_ BitVec 32) V!27089 V!27089 (_ BitVec 32) (_ BitVec 64) V!27089 (_ BitVec 32) Int) Unit!29265)

(assert (=> b!858296 (= lt!386645 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!460 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858297 () Bool)

(declare-fun res!583086 () Bool)

(assert (=> b!858297 (=> (not res!583086) (not e!478339))))

(assert (=> b!858297 (= res!583086 (and (= (size!24097 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24096 _keys!868) (size!24097 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858298 () Bool)

(assert (=> b!858298 (= e!478337 true)))

(declare-fun lt!386641 () ListLongMap!9743)

(declare-fun get!12456 (ValueCell!7826 V!27089) V!27089)

(declare-fun dynLambda!1080 (Int (_ BitVec 64)) V!27089)

(assert (=> b!858298 (= lt!386641 (+!2240 lt!386644 (tuple2!10975 (select (arr!23656 _keys!868) from!1053) (get!12456 (select (arr!23657 _values!688) from!1053) (dynLambda!1080 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!583087 () Bool)

(assert (=> start!73480 (=> (not res!583087) (not e!478339))))

(assert (=> start!73480 (= res!583087 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24096 _keys!868))))))

(assert (=> start!73480 e!478339))

(declare-fun tp_is_empty!16531 () Bool)

(assert (=> start!73480 tp_is_empty!16531))

(assert (=> start!73480 true))

(assert (=> start!73480 tp!50688))

(declare-fun array_inv!18736 (array!49250) Bool)

(assert (=> start!73480 (array_inv!18736 _keys!868)))

(declare-fun e!478333 () Bool)

(declare-fun array_inv!18737 (array!49252) Bool)

(assert (=> start!73480 (and (array_inv!18737 _values!688) e!478333)))

(declare-fun b!858294 () Bool)

(assert (=> b!858294 (= e!478339 e!478335)))

(declare-fun res!583084 () Bool)

(assert (=> b!858294 (=> (not res!583084) (not e!478335))))

(assert (=> b!858294 (= res!583084 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858294 (= lt!386641 (getCurrentListMapNoExtraKeys!2868 _keys!868 lt!386647 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858294 (= lt!386647 (array!49253 (store (arr!23657 _values!688) i!612 (ValueCellFull!7826 v!557)) (size!24097 _values!688)))))

(declare-fun lt!386643 () ListLongMap!9743)

(assert (=> b!858294 (= lt!386643 (getCurrentListMapNoExtraKeys!2868 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858299 () Bool)

(declare-fun res!583080 () Bool)

(assert (=> b!858299 (=> (not res!583080) (not e!478339))))

(assert (=> b!858299 (= res!583080 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24096 _keys!868))))))

(declare-fun b!858300 () Bool)

(declare-fun e!478336 () Bool)

(assert (=> b!858300 (= e!478333 (and e!478336 mapRes!26396))))

(declare-fun condMapEmpty!26396 () Bool)

(declare-fun mapDefault!26396 () ValueCell!7826)

