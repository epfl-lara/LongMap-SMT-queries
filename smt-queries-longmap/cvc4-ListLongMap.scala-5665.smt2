; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73778 () Bool)

(assert start!73778)

(declare-fun b_free!14693 () Bool)

(declare-fun b_next!14693 () Bool)

(assert (=> start!73778 (= b_free!14693 (not b_next!14693))))

(declare-fun tp!51582 () Bool)

(declare-fun b_and!24365 () Bool)

(assert (=> start!73778 (= tp!51582 b_and!24365)))

(declare-fun b!865575 () Bool)

(declare-datatypes ((Unit!29650 0))(
  ( (Unit!29651) )
))
(declare-fun e!482181 () Unit!29650)

(declare-fun Unit!29652 () Unit!29650)

(assert (=> b!865575 (= e!482181 Unit!29652)))

(declare-fun b!865576 () Bool)

(declare-fun e!482184 () Bool)

(declare-fun e!482185 () Bool)

(assert (=> b!865576 (= e!482184 e!482185)))

(declare-fun res!588141 () Bool)

(assert (=> b!865576 (=> (not res!588141) (not e!482185))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865576 (= res!588141 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27485 0))(
  ( (V!27486 (val!8462 Int)) )
))
(declare-datatypes ((ValueCell!7975 0))(
  ( (ValueCellFull!7975 (v!10887 V!27485)) (EmptyCell!7975) )
))
(declare-datatypes ((array!49818 0))(
  ( (array!49819 (arr!23940 (Array (_ BitVec 32) ValueCell!7975)) (size!24380 (_ BitVec 32))) )
))
(declare-fun lt!392294 () array!49818)

(declare-datatypes ((array!49820 0))(
  ( (array!49821 (arr!23941 (Array (_ BitVec 32) (_ BitVec 64))) (size!24381 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49820)

(declare-datatypes ((tuple2!11216 0))(
  ( (tuple2!11217 (_1!5619 (_ BitVec 64)) (_2!5619 V!27485)) )
))
(declare-datatypes ((List!17019 0))(
  ( (Nil!17016) (Cons!17015 (h!18146 tuple2!11216) (t!23978 List!17019)) )
))
(declare-datatypes ((ListLongMap!9985 0))(
  ( (ListLongMap!9986 (toList!5008 List!17019)) )
))
(declare-fun lt!392292 () ListLongMap!9985)

(declare-fun minValue!654 () V!27485)

(declare-fun zeroValue!654 () V!27485)

(declare-fun getCurrentListMapNoExtraKeys!2979 (array!49820 array!49818 (_ BitVec 32) (_ BitVec 32) V!27485 V!27485 (_ BitVec 32) Int) ListLongMap!9985)

(assert (=> b!865576 (= lt!392292 (getCurrentListMapNoExtraKeys!2979 _keys!868 lt!392294 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27485)

(declare-fun _values!688 () array!49818)

(assert (=> b!865576 (= lt!392294 (array!49819 (store (arr!23940 _values!688) i!612 (ValueCellFull!7975 v!557)) (size!24380 _values!688)))))

(declare-fun lt!392282 () ListLongMap!9985)

(assert (=> b!865576 (= lt!392282 (getCurrentListMapNoExtraKeys!2979 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26843 () Bool)

(declare-fun mapRes!26843 () Bool)

(assert (=> mapIsEmpty!26843 mapRes!26843))

(declare-fun b!865577 () Bool)

(declare-fun e!482188 () Bool)

(declare-fun e!482187 () Bool)

(assert (=> b!865577 (= e!482188 e!482187)))

(declare-fun res!588138 () Bool)

(assert (=> b!865577 (=> res!588138 e!482187)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!865577 (= res!588138 (= k!854 (select (arr!23941 _keys!868) from!1053)))))

(assert (=> b!865577 (not (= (select (arr!23941 _keys!868) from!1053) k!854))))

(declare-fun lt!392289 () Unit!29650)

(assert (=> b!865577 (= lt!392289 e!482181)))

(declare-fun c!92260 () Bool)

(assert (=> b!865577 (= c!92260 (= (select (arr!23941 _keys!868) from!1053) k!854))))

(declare-fun lt!392288 () ListLongMap!9985)

(assert (=> b!865577 (= lt!392292 lt!392288)))

(declare-fun lt!392285 () ListLongMap!9985)

(declare-fun lt!392284 () tuple2!11216)

(declare-fun +!2357 (ListLongMap!9985 tuple2!11216) ListLongMap!9985)

(assert (=> b!865577 (= lt!392288 (+!2357 lt!392285 lt!392284))))

(declare-fun lt!392286 () V!27485)

(assert (=> b!865577 (= lt!392284 (tuple2!11217 (select (arr!23941 _keys!868) from!1053) lt!392286))))

(declare-fun get!12653 (ValueCell!7975 V!27485) V!27485)

(declare-fun dynLambda!1179 (Int (_ BitVec 64)) V!27485)

(assert (=> b!865577 (= lt!392286 (get!12653 (select (arr!23940 _values!688) from!1053) (dynLambda!1179 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865578 () Bool)

(declare-fun res!588143 () Bool)

(assert (=> b!865578 (=> (not res!588143) (not e!482184))))

(assert (=> b!865578 (= res!588143 (and (= (size!24380 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24381 _keys!868) (size!24380 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!588135 () Bool)

(assert (=> start!73778 (=> (not res!588135) (not e!482184))))

(assert (=> start!73778 (= res!588135 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24381 _keys!868))))))

(assert (=> start!73778 e!482184))

(declare-fun tp_is_empty!16829 () Bool)

(assert (=> start!73778 tp_is_empty!16829))

(assert (=> start!73778 true))

(assert (=> start!73778 tp!51582))

(declare-fun array_inv!18926 (array!49820) Bool)

(assert (=> start!73778 (array_inv!18926 _keys!868)))

(declare-fun e!482186 () Bool)

(declare-fun array_inv!18927 (array!49818) Bool)

(assert (=> start!73778 (and (array_inv!18927 _values!688) e!482186)))

(declare-fun b!865579 () Bool)

(declare-fun res!588133 () Bool)

(assert (=> b!865579 (=> (not res!588133) (not e!482184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49820 (_ BitVec 32)) Bool)

(assert (=> b!865579 (= res!588133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865580 () Bool)

(declare-fun res!588137 () Bool)

(assert (=> b!865580 (=> (not res!588137) (not e!482184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865580 (= res!588137 (validKeyInArray!0 k!854))))

(declare-fun b!865581 () Bool)

(declare-fun res!588142 () Bool)

(assert (=> b!865581 (=> (not res!588142) (not e!482184))))

(assert (=> b!865581 (= res!588142 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24381 _keys!868))))))

(declare-fun b!865582 () Bool)

(assert (=> b!865582 (= e!482187 true)))

(declare-fun lt!392290 () ListLongMap!9985)

(declare-fun lt!392295 () tuple2!11216)

(assert (=> b!865582 (= lt!392288 (+!2357 (+!2357 lt!392290 lt!392284) lt!392295))))

(declare-fun lt!392293 () Unit!29650)

(declare-fun addCommutativeForDiffKeys!526 (ListLongMap!9985 (_ BitVec 64) V!27485 (_ BitVec 64) V!27485) Unit!29650)

(assert (=> b!865582 (= lt!392293 (addCommutativeForDiffKeys!526 lt!392290 k!854 v!557 (select (arr!23941 _keys!868) from!1053) lt!392286))))

(declare-fun b!865583 () Bool)

(declare-fun res!588140 () Bool)

(assert (=> b!865583 (=> (not res!588140) (not e!482184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865583 (= res!588140 (validMask!0 mask!1196))))

(declare-fun b!865584 () Bool)

(declare-fun e!482180 () Bool)

(assert (=> b!865584 (= e!482180 tp_is_empty!16829)))

(declare-fun mapNonEmpty!26843 () Bool)

(declare-fun tp!51583 () Bool)

(declare-fun e!482182 () Bool)

(assert (=> mapNonEmpty!26843 (= mapRes!26843 (and tp!51583 e!482182))))

(declare-fun mapKey!26843 () (_ BitVec 32))

(declare-fun mapValue!26843 () ValueCell!7975)

(declare-fun mapRest!26843 () (Array (_ BitVec 32) ValueCell!7975))

(assert (=> mapNonEmpty!26843 (= (arr!23940 _values!688) (store mapRest!26843 mapKey!26843 mapValue!26843))))

(declare-fun b!865585 () Bool)

(assert (=> b!865585 (= e!482182 tp_is_empty!16829)))

(declare-fun b!865586 () Bool)

(declare-fun res!588134 () Bool)

(assert (=> b!865586 (=> (not res!588134) (not e!482184))))

(declare-datatypes ((List!17020 0))(
  ( (Nil!17017) (Cons!17016 (h!18147 (_ BitVec 64)) (t!23979 List!17020)) )
))
(declare-fun arrayNoDuplicates!0 (array!49820 (_ BitVec 32) List!17020) Bool)

(assert (=> b!865586 (= res!588134 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17017))))

(declare-fun b!865587 () Bool)

(assert (=> b!865587 (= e!482185 (not e!482188))))

(declare-fun res!588139 () Bool)

(assert (=> b!865587 (=> res!588139 e!482188)))

(assert (=> b!865587 (= res!588139 (not (validKeyInArray!0 (select (arr!23941 _keys!868) from!1053))))))

(declare-fun lt!392291 () ListLongMap!9985)

(assert (=> b!865587 (= lt!392291 lt!392285)))

(assert (=> b!865587 (= lt!392285 (+!2357 lt!392290 lt!392295))))

(assert (=> b!865587 (= lt!392291 (getCurrentListMapNoExtraKeys!2979 _keys!868 lt!392294 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865587 (= lt!392295 (tuple2!11217 k!854 v!557))))

(assert (=> b!865587 (= lt!392290 (getCurrentListMapNoExtraKeys!2979 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392287 () Unit!29650)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!557 (array!49820 array!49818 (_ BitVec 32) (_ BitVec 32) V!27485 V!27485 (_ BitVec 32) (_ BitVec 64) V!27485 (_ BitVec 32) Int) Unit!29650)

(assert (=> b!865587 (= lt!392287 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!557 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865588 () Bool)

(assert (=> b!865588 (= e!482186 (and e!482180 mapRes!26843))))

(declare-fun condMapEmpty!26843 () Bool)

(declare-fun mapDefault!26843 () ValueCell!7975)

