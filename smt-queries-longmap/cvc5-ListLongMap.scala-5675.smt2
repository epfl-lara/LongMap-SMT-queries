; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73834 () Bool)

(assert start!73834)

(declare-fun b_free!14749 () Bool)

(declare-fun b_next!14749 () Bool)

(assert (=> start!73834 (= b_free!14749 (not b_next!14749))))

(declare-fun tp!51750 () Bool)

(declare-fun b_and!24477 () Bool)

(assert (=> start!73834 (= tp!51750 b_and!24477)))

(declare-fun res!589057 () Bool)

(declare-fun e!482942 () Bool)

(assert (=> start!73834 (=> (not res!589057) (not e!482942))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49930 0))(
  ( (array!49931 (arr!23996 (Array (_ BitVec 32) (_ BitVec 64))) (size!24436 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49930)

(assert (=> start!73834 (= res!589057 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24436 _keys!868))))))

(assert (=> start!73834 e!482942))

(declare-fun tp_is_empty!16885 () Bool)

(assert (=> start!73834 tp_is_empty!16885))

(assert (=> start!73834 true))

(assert (=> start!73834 tp!51750))

(declare-fun array_inv!18964 (array!49930) Bool)

(assert (=> start!73834 (array_inv!18964 _keys!868)))

(declare-datatypes ((V!27561 0))(
  ( (V!27562 (val!8490 Int)) )
))
(declare-datatypes ((ValueCell!8003 0))(
  ( (ValueCellFull!8003 (v!10915 V!27561)) (EmptyCell!8003) )
))
(declare-datatypes ((array!49932 0))(
  ( (array!49933 (arr!23997 (Array (_ BitVec 32) ValueCell!8003)) (size!24437 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49932)

(declare-fun e!482944 () Bool)

(declare-fun array_inv!18965 (array!49932) Bool)

(assert (=> start!73834 (and (array_inv!18965 _values!688) e!482944)))

(declare-fun mapIsEmpty!26927 () Bool)

(declare-fun mapRes!26927 () Bool)

(assert (=> mapIsEmpty!26927 mapRes!26927))

(declare-fun mapNonEmpty!26927 () Bool)

(declare-fun tp!51751 () Bool)

(declare-fun e!482936 () Bool)

(assert (=> mapNonEmpty!26927 (= mapRes!26927 (and tp!51751 e!482936))))

(declare-fun mapKey!26927 () (_ BitVec 32))

(declare-fun mapRest!26927 () (Array (_ BitVec 32) ValueCell!8003))

(declare-fun mapValue!26927 () ValueCell!8003)

(assert (=> mapNonEmpty!26927 (= (arr!23997 _values!688) (store mapRest!26927 mapKey!26927 mapValue!26927))))

(declare-fun b!866975 () Bool)

(declare-fun e!482939 () Bool)

(assert (=> b!866975 (= e!482939 true)))

(declare-datatypes ((tuple2!11262 0))(
  ( (tuple2!11263 (_1!5642 (_ BitVec 64)) (_2!5642 V!27561)) )
))
(declare-datatypes ((List!17060 0))(
  ( (Nil!17057) (Cons!17056 (h!18187 tuple2!11262) (t!24075 List!17060)) )
))
(declare-datatypes ((ListLongMap!10031 0))(
  ( (ListLongMap!10032 (toList!5031 List!17060)) )
))
(declare-fun lt!393632 () ListLongMap!10031)

(declare-fun lt!393637 () tuple2!11262)

(declare-fun lt!393629 () ListLongMap!10031)

(declare-fun lt!393628 () tuple2!11262)

(declare-fun +!2377 (ListLongMap!10031 tuple2!11262) ListLongMap!10031)

(assert (=> b!866975 (= lt!393629 (+!2377 (+!2377 lt!393632 lt!393628) lt!393637))))

(declare-fun v!557 () V!27561)

(declare-datatypes ((Unit!29726 0))(
  ( (Unit!29727) )
))
(declare-fun lt!393631 () Unit!29726)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!393636 () V!27561)

(declare-fun addCommutativeForDiffKeys!544 (ListLongMap!10031 (_ BitVec 64) V!27561 (_ BitVec 64) V!27561) Unit!29726)

(assert (=> b!866975 (= lt!393631 (addCommutativeForDiffKeys!544 lt!393632 k!854 v!557 (select (arr!23996 _keys!868) from!1053) lt!393636))))

(declare-fun b!866976 () Bool)

(declare-fun e!482940 () Bool)

(assert (=> b!866976 (= e!482940 e!482939)))

(declare-fun res!589063 () Bool)

(assert (=> b!866976 (=> res!589063 e!482939)))

(assert (=> b!866976 (= res!589063 (= k!854 (select (arr!23996 _keys!868) from!1053)))))

(assert (=> b!866976 (not (= (select (arr!23996 _keys!868) from!1053) k!854))))

(declare-fun lt!393639 () Unit!29726)

(declare-fun e!482937 () Unit!29726)

(assert (=> b!866976 (= lt!393639 e!482937)))

(declare-fun c!92344 () Bool)

(assert (=> b!866976 (= c!92344 (= (select (arr!23996 _keys!868) from!1053) k!854))))

(declare-fun lt!393626 () ListLongMap!10031)

(assert (=> b!866976 (= lt!393626 lt!393629)))

(declare-fun lt!393630 () ListLongMap!10031)

(assert (=> b!866976 (= lt!393629 (+!2377 lt!393630 lt!393628))))

(assert (=> b!866976 (= lt!393628 (tuple2!11263 (select (arr!23996 _keys!868) from!1053) lt!393636))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12689 (ValueCell!8003 V!27561) V!27561)

(declare-fun dynLambda!1195 (Int (_ BitVec 64)) V!27561)

(assert (=> b!866976 (= lt!393636 (get!12689 (select (arr!23997 _values!688) from!1053) (dynLambda!1195 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866977 () Bool)

(declare-fun Unit!29728 () Unit!29726)

(assert (=> b!866977 (= e!482937 Unit!29728)))

(declare-fun lt!393638 () Unit!29726)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49930 (_ BitVec 32) (_ BitVec 32)) Unit!29726)

(assert (=> b!866977 (= lt!393638 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17061 0))(
  ( (Nil!17058) (Cons!17057 (h!18188 (_ BitVec 64)) (t!24076 List!17061)) )
))
(declare-fun arrayNoDuplicates!0 (array!49930 (_ BitVec 32) List!17061) Bool)

(assert (=> b!866977 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17058)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!393635 () Unit!29726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49930 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29726)

(assert (=> b!866977 (= lt!393635 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866977 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393640 () Unit!29726)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49930 (_ BitVec 64) (_ BitVec 32) List!17061) Unit!29726)

(assert (=> b!866977 (= lt!393640 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17058))))

(assert (=> b!866977 false))

(declare-fun b!866978 () Bool)

(declare-fun e!482941 () Bool)

(assert (=> b!866978 (= e!482942 e!482941)))

(declare-fun res!589061 () Bool)

(assert (=> b!866978 (=> (not res!589061) (not e!482941))))

(assert (=> b!866978 (= res!589061 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!393625 () array!49932)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27561)

(declare-fun zeroValue!654 () V!27561)

(declare-fun getCurrentListMapNoExtraKeys!3001 (array!49930 array!49932 (_ BitVec 32) (_ BitVec 32) V!27561 V!27561 (_ BitVec 32) Int) ListLongMap!10031)

(assert (=> b!866978 (= lt!393626 (getCurrentListMapNoExtraKeys!3001 _keys!868 lt!393625 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866978 (= lt!393625 (array!49933 (store (arr!23997 _values!688) i!612 (ValueCellFull!8003 v!557)) (size!24437 _values!688)))))

(declare-fun lt!393633 () ListLongMap!10031)

(assert (=> b!866978 (= lt!393633 (getCurrentListMapNoExtraKeys!3001 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866979 () Bool)

(declare-fun res!589058 () Bool)

(assert (=> b!866979 (=> (not res!589058) (not e!482942))))

(assert (=> b!866979 (= res!589058 (and (= (size!24437 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24436 _keys!868) (size!24437 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866980 () Bool)

(declare-fun res!589060 () Bool)

(assert (=> b!866980 (=> (not res!589060) (not e!482942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49930 (_ BitVec 32)) Bool)

(assert (=> b!866980 (= res!589060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866981 () Bool)

(declare-fun res!589066 () Bool)

(assert (=> b!866981 (=> (not res!589066) (not e!482942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866981 (= res!589066 (validMask!0 mask!1196))))

(declare-fun b!866982 () Bool)

(declare-fun res!589067 () Bool)

(assert (=> b!866982 (=> (not res!589067) (not e!482942))))

(assert (=> b!866982 (= res!589067 (and (= (select (arr!23996 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!866983 () Bool)

(declare-fun res!589065 () Bool)

(assert (=> b!866983 (=> (not res!589065) (not e!482942))))

(assert (=> b!866983 (= res!589065 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17058))))

(declare-fun b!866984 () Bool)

(declare-fun e!482943 () Bool)

(assert (=> b!866984 (= e!482944 (and e!482943 mapRes!26927))))

(declare-fun condMapEmpty!26927 () Bool)

(declare-fun mapDefault!26927 () ValueCell!8003)

