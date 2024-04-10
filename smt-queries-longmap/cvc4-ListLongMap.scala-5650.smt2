; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73688 () Bool)

(assert start!73688)

(declare-fun b_free!14603 () Bool)

(declare-fun b_next!14603 () Bool)

(assert (=> start!73688 (= b_free!14603 (not b_next!14603))))

(declare-fun tp!51313 () Bool)

(declare-fun b_and!24185 () Bool)

(assert (=> start!73688 (= tp!51313 b_and!24185)))

(declare-fun b!863325 () Bool)

(declare-fun e!480970 () Bool)

(declare-fun e!480971 () Bool)

(assert (=> b!863325 (= e!480970 e!480971)))

(declare-fun res!586649 () Bool)

(assert (=> b!863325 (=> (not res!586649) (not e!480971))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863325 (= res!586649 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27365 0))(
  ( (V!27366 (val!8417 Int)) )
))
(declare-datatypes ((tuple2!11138 0))(
  ( (tuple2!11139 (_1!5580 (_ BitVec 64)) (_2!5580 V!27365)) )
))
(declare-datatypes ((List!16946 0))(
  ( (Nil!16943) (Cons!16942 (h!18073 tuple2!11138) (t!23815 List!16946)) )
))
(declare-datatypes ((ListLongMap!9907 0))(
  ( (ListLongMap!9908 (toList!4969 List!16946)) )
))
(declare-fun lt!390124 () ListLongMap!9907)

(declare-datatypes ((array!49640 0))(
  ( (array!49641 (arr!23851 (Array (_ BitVec 32) (_ BitVec 64))) (size!24291 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49640)

(declare-datatypes ((ValueCell!7930 0))(
  ( (ValueCellFull!7930 (v!10842 V!27365)) (EmptyCell!7930) )
))
(declare-datatypes ((array!49642 0))(
  ( (array!49643 (arr!23852 (Array (_ BitVec 32) ValueCell!7930)) (size!24292 (_ BitVec 32))) )
))
(declare-fun lt!390136 () array!49642)

(declare-fun minValue!654 () V!27365)

(declare-fun zeroValue!654 () V!27365)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2944 (array!49640 array!49642 (_ BitVec 32) (_ BitVec 32) V!27365 V!27365 (_ BitVec 32) Int) ListLongMap!9907)

(assert (=> b!863325 (= lt!390124 (getCurrentListMapNoExtraKeys!2944 _keys!868 lt!390136 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27365)

(declare-fun _values!688 () array!49642)

(assert (=> b!863325 (= lt!390136 (array!49643 (store (arr!23852 _values!688) i!612 (ValueCellFull!7930 v!557)) (size!24292 _values!688)))))

(declare-fun lt!390133 () ListLongMap!9907)

(assert (=> b!863325 (= lt!390133 (getCurrentListMapNoExtraKeys!2944 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26708 () Bool)

(declare-fun mapRes!26708 () Bool)

(declare-fun tp!51312 () Bool)

(declare-fun e!480972 () Bool)

(assert (=> mapNonEmpty!26708 (= mapRes!26708 (and tp!51312 e!480972))))

(declare-fun mapValue!26708 () ValueCell!7930)

(declare-fun mapRest!26708 () (Array (_ BitVec 32) ValueCell!7930))

(declare-fun mapKey!26708 () (_ BitVec 32))

(assert (=> mapNonEmpty!26708 (= (arr!23852 _values!688) (store mapRest!26708 mapKey!26708 mapValue!26708))))

(declare-fun b!863326 () Bool)

(declare-datatypes ((Unit!29506 0))(
  ( (Unit!29507) )
))
(declare-fun e!480967 () Unit!29506)

(declare-fun Unit!29508 () Unit!29506)

(assert (=> b!863326 (= e!480967 Unit!29508)))

(declare-fun lt!390123 () Unit!29506)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49640 (_ BitVec 32) (_ BitVec 32)) Unit!29506)

(assert (=> b!863326 (= lt!390123 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16947 0))(
  ( (Nil!16944) (Cons!16943 (h!18074 (_ BitVec 64)) (t!23816 List!16947)) )
))
(declare-fun arrayNoDuplicates!0 (array!49640 (_ BitVec 32) List!16947) Bool)

(assert (=> b!863326 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16944)))

(declare-fun lt!390134 () Unit!29506)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29506)

(assert (=> b!863326 (= lt!390134 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863326 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390127 () Unit!29506)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49640 (_ BitVec 64) (_ BitVec 32) List!16947) Unit!29506)

(assert (=> b!863326 (= lt!390127 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16944))))

(assert (=> b!863326 false))

(declare-fun b!863327 () Bool)

(declare-fun res!586648 () Bool)

(assert (=> b!863327 (=> (not res!586648) (not e!480970))))

(assert (=> b!863327 (= res!586648 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24291 _keys!868))))))

(declare-fun b!863328 () Bool)

(declare-fun res!586654 () Bool)

(assert (=> b!863328 (=> (not res!586654) (not e!480970))))

(assert (=> b!863328 (= res!586654 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16944))))

(declare-fun b!863329 () Bool)

(declare-fun res!586650 () Bool)

(assert (=> b!863329 (=> (not res!586650) (not e!480970))))

(assert (=> b!863329 (= res!586650 (and (= (size!24292 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24291 _keys!868) (size!24292 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863330 () Bool)

(declare-fun e!480965 () Bool)

(assert (=> b!863330 (= e!480971 (not e!480965))))

(declare-fun res!586657 () Bool)

(assert (=> b!863330 (=> res!586657 e!480965)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863330 (= res!586657 (not (validKeyInArray!0 (select (arr!23851 _keys!868) from!1053))))))

(declare-fun lt!390129 () ListLongMap!9907)

(declare-fun lt!390122 () ListLongMap!9907)

(assert (=> b!863330 (= lt!390129 lt!390122)))

(declare-fun lt!390135 () ListLongMap!9907)

(declare-fun lt!390125 () tuple2!11138)

(declare-fun +!2318 (ListLongMap!9907 tuple2!11138) ListLongMap!9907)

(assert (=> b!863330 (= lt!390122 (+!2318 lt!390135 lt!390125))))

(assert (=> b!863330 (= lt!390129 (getCurrentListMapNoExtraKeys!2944 _keys!868 lt!390136 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863330 (= lt!390125 (tuple2!11139 k!854 v!557))))

(assert (=> b!863330 (= lt!390135 (getCurrentListMapNoExtraKeys!2944 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390132 () Unit!29506)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!526 (array!49640 array!49642 (_ BitVec 32) (_ BitVec 32) V!27365 V!27365 (_ BitVec 32) (_ BitVec 64) V!27365 (_ BitVec 32) Int) Unit!29506)

(assert (=> b!863330 (= lt!390132 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!526 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863331 () Bool)

(declare-fun res!586653 () Bool)

(assert (=> b!863331 (=> (not res!586653) (not e!480970))))

(assert (=> b!863331 (= res!586653 (validKeyInArray!0 k!854))))

(declare-fun b!863332 () Bool)

(declare-fun e!480966 () Bool)

(assert (=> b!863332 (= e!480966 true)))

(declare-fun lt!390131 () tuple2!11138)

(declare-fun lt!390128 () ListLongMap!9907)

(assert (=> b!863332 (= lt!390128 (+!2318 (+!2318 lt!390135 lt!390131) lt!390125))))

(declare-fun lt!390130 () Unit!29506)

(declare-fun lt!390126 () V!27365)

(declare-fun addCommutativeForDiffKeys!492 (ListLongMap!9907 (_ BitVec 64) V!27365 (_ BitVec 64) V!27365) Unit!29506)

(assert (=> b!863332 (= lt!390130 (addCommutativeForDiffKeys!492 lt!390135 k!854 v!557 (select (arr!23851 _keys!868) from!1053) lt!390126))))

(declare-fun b!863333 () Bool)

(declare-fun res!586651 () Bool)

(assert (=> b!863333 (=> (not res!586651) (not e!480970))))

(assert (=> b!863333 (= res!586651 (and (= (select (arr!23851 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863334 () Bool)

(declare-fun res!586652 () Bool)

(assert (=> b!863334 (=> (not res!586652) (not e!480970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863334 (= res!586652 (validMask!0 mask!1196))))

(declare-fun res!586658 () Bool)

(assert (=> start!73688 (=> (not res!586658) (not e!480970))))

(assert (=> start!73688 (= res!586658 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24291 _keys!868))))))

(assert (=> start!73688 e!480970))

(declare-fun tp_is_empty!16739 () Bool)

(assert (=> start!73688 tp_is_empty!16739))

(assert (=> start!73688 true))

(assert (=> start!73688 tp!51313))

(declare-fun array_inv!18868 (array!49640) Bool)

(assert (=> start!73688 (array_inv!18868 _keys!868)))

(declare-fun e!480969 () Bool)

(declare-fun array_inv!18869 (array!49642) Bool)

(assert (=> start!73688 (and (array_inv!18869 _values!688) e!480969)))

(declare-fun b!863335 () Bool)

(declare-fun e!480968 () Bool)

(assert (=> b!863335 (= e!480969 (and e!480968 mapRes!26708))))

(declare-fun condMapEmpty!26708 () Bool)

(declare-fun mapDefault!26708 () ValueCell!7930)

