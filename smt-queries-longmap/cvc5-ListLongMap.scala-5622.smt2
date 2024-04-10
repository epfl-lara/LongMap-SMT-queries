; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73516 () Bool)

(assert start!73516)

(declare-fun b_free!14431 () Bool)

(declare-fun b_next!14431 () Bool)

(assert (=> start!73516 (= b_free!14431 (not b_next!14431))))

(declare-fun tp!50796 () Bool)

(declare-fun b_and!23841 () Bool)

(assert (=> start!73516 (= tp!50796 b_and!23841)))

(declare-fun b!859066 () Bool)

(declare-fun res!583659 () Bool)

(declare-fun e!478750 () Bool)

(assert (=> b!859066 (=> (not res!583659) (not e!478750))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859066 (= res!583659 (validMask!0 mask!1196))))

(declare-fun b!859067 () Bool)

(declare-fun res!583658 () Bool)

(assert (=> b!859067 (=> (not res!583658) (not e!478750))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859067 (= res!583658 (validKeyInArray!0 k!854))))

(declare-fun b!859068 () Bool)

(declare-fun e!478752 () Bool)

(declare-fun tp_is_empty!16567 () Bool)

(assert (=> b!859068 (= e!478752 tp_is_empty!16567)))

(declare-fun b!859069 () Bool)

(declare-fun res!583667 () Bool)

(assert (=> b!859069 (=> (not res!583667) (not e!478750))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49314 0))(
  ( (array!49315 (arr!23688 (Array (_ BitVec 32) (_ BitVec 64))) (size!24128 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49314)

(assert (=> b!859069 (= res!583667 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24128 _keys!868))))))

(declare-fun b!859070 () Bool)

(declare-fun e!478756 () Bool)

(declare-fun e!478751 () Bool)

(assert (=> b!859070 (= e!478756 (not e!478751))))

(declare-fun res!583666 () Bool)

(assert (=> b!859070 (=> res!583666 e!478751)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859070 (= res!583666 (not (validKeyInArray!0 (select (arr!23688 _keys!868) from!1053))))))

(declare-datatypes ((V!27137 0))(
  ( (V!27138 (val!8331 Int)) )
))
(declare-datatypes ((tuple2!10998 0))(
  ( (tuple2!10999 (_1!5510 (_ BitVec 64)) (_2!5510 V!27137)) )
))
(declare-datatypes ((List!16807 0))(
  ( (Nil!16804) (Cons!16803 (h!17934 tuple2!10998) (t!23504 List!16807)) )
))
(declare-datatypes ((ListLongMap!9767 0))(
  ( (ListLongMap!9768 (toList!4899 List!16807)) )
))
(declare-fun lt!387060 () ListLongMap!9767)

(declare-fun lt!387063 () ListLongMap!9767)

(assert (=> b!859070 (= lt!387060 lt!387063)))

(declare-fun v!557 () V!27137)

(declare-fun lt!387062 () ListLongMap!9767)

(declare-fun +!2252 (ListLongMap!9767 tuple2!10998) ListLongMap!9767)

(assert (=> b!859070 (= lt!387063 (+!2252 lt!387062 (tuple2!10999 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7844 0))(
  ( (ValueCellFull!7844 (v!10756 V!27137)) (EmptyCell!7844) )
))
(declare-datatypes ((array!49316 0))(
  ( (array!49317 (arr!23689 (Array (_ BitVec 32) ValueCell!7844)) (size!24129 (_ BitVec 32))) )
))
(declare-fun lt!387058 () array!49316)

(declare-fun minValue!654 () V!27137)

(declare-fun zeroValue!654 () V!27137)

(declare-fun getCurrentListMapNoExtraKeys!2878 (array!49314 array!49316 (_ BitVec 32) (_ BitVec 32) V!27137 V!27137 (_ BitVec 32) Int) ListLongMap!9767)

(assert (=> b!859070 (= lt!387060 (getCurrentListMapNoExtraKeys!2878 _keys!868 lt!387058 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49316)

(assert (=> b!859070 (= lt!387062 (getCurrentListMapNoExtraKeys!2878 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29289 0))(
  ( (Unit!29290) )
))
(declare-fun lt!387064 () Unit!29289)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!468 (array!49314 array!49316 (_ BitVec 32) (_ BitVec 32) V!27137 V!27137 (_ BitVec 32) (_ BitVec 64) V!27137 (_ BitVec 32) Int) Unit!29289)

(assert (=> b!859070 (= lt!387064 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!468 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859071 () Bool)

(assert (=> b!859071 (= e!478750 e!478756)))

(declare-fun res!583664 () Bool)

(assert (=> b!859071 (=> (not res!583664) (not e!478756))))

(assert (=> b!859071 (= res!583664 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387057 () ListLongMap!9767)

(assert (=> b!859071 (= lt!387057 (getCurrentListMapNoExtraKeys!2878 _keys!868 lt!387058 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859071 (= lt!387058 (array!49317 (store (arr!23689 _values!688) i!612 (ValueCellFull!7844 v!557)) (size!24129 _values!688)))))

(declare-fun lt!387059 () ListLongMap!9767)

(assert (=> b!859071 (= lt!387059 (getCurrentListMapNoExtraKeys!2878 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859072 () Bool)

(declare-fun e!478754 () Bool)

(assert (=> b!859072 (= e!478751 e!478754)))

(declare-fun res!583663 () Bool)

(assert (=> b!859072 (=> res!583663 e!478754)))

(assert (=> b!859072 (= res!583663 (not (= (select (arr!23688 _keys!868) from!1053) k!854)))))

(declare-fun get!12480 (ValueCell!7844 V!27137) V!27137)

(declare-fun dynLambda!1092 (Int (_ BitVec 64)) V!27137)

(assert (=> b!859072 (= lt!387057 (+!2252 lt!387063 (tuple2!10999 (select (arr!23688 _keys!868) from!1053) (get!12480 (select (arr!23689 _values!688) from!1053) (dynLambda!1092 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859073 () Bool)

(assert (=> b!859073 (= e!478754 true)))

(declare-datatypes ((List!16808 0))(
  ( (Nil!16805) (Cons!16804 (h!17935 (_ BitVec 64)) (t!23505 List!16808)) )
))
(declare-fun arrayNoDuplicates!0 (array!49314 (_ BitVec 32) List!16808) Bool)

(assert (=> b!859073 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16805)))

(declare-fun lt!387061 () Unit!29289)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49314 (_ BitVec 32) (_ BitVec 32)) Unit!29289)

(assert (=> b!859073 (= lt!387061 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!26450 () Bool)

(declare-fun mapRes!26450 () Bool)

(declare-fun tp!50797 () Bool)

(assert (=> mapNonEmpty!26450 (= mapRes!26450 (and tp!50797 e!478752))))

(declare-fun mapRest!26450 () (Array (_ BitVec 32) ValueCell!7844))

(declare-fun mapKey!26450 () (_ BitVec 32))

(declare-fun mapValue!26450 () ValueCell!7844)

(assert (=> mapNonEmpty!26450 (= (arr!23689 _values!688) (store mapRest!26450 mapKey!26450 mapValue!26450))))

(declare-fun b!859074 () Bool)

(declare-fun e!478753 () Bool)

(assert (=> b!859074 (= e!478753 tp_is_empty!16567)))

(declare-fun b!859075 () Bool)

(declare-fun res!583657 () Bool)

(assert (=> b!859075 (=> (not res!583657) (not e!478750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49314 (_ BitVec 32)) Bool)

(assert (=> b!859075 (= res!583657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859076 () Bool)

(declare-fun res!583662 () Bool)

(assert (=> b!859076 (=> (not res!583662) (not e!478750))))

(assert (=> b!859076 (= res!583662 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16805))))

(declare-fun b!859077 () Bool)

(declare-fun e!478749 () Bool)

(assert (=> b!859077 (= e!478749 (and e!478753 mapRes!26450))))

(declare-fun condMapEmpty!26450 () Bool)

(declare-fun mapDefault!26450 () ValueCell!7844)

