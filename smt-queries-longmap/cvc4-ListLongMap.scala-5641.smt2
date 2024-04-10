; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73634 () Bool)

(assert start!73634)

(declare-fun b_free!14549 () Bool)

(declare-fun b_next!14549 () Bool)

(assert (=> start!73634 (= b_free!14549 (not b_next!14549))))

(declare-fun tp!51150 () Bool)

(declare-fun b_and!24077 () Bool)

(assert (=> start!73634 (= tp!51150 b_and!24077)))

(declare-fun b!861985 () Bool)

(declare-fun res!585769 () Bool)

(declare-fun e!480248 () Bool)

(assert (=> b!861985 (=> (not res!585769) (not e!480248))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49534 0))(
  ( (array!49535 (arr!23798 (Array (_ BitVec 32) (_ BitVec 64))) (size!24238 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49534)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861985 (= res!585769 (and (= (select (arr!23798 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861986 () Bool)

(declare-fun res!585773 () Bool)

(assert (=> b!861986 (=> (not res!585773) (not e!480248))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861986 (= res!585773 (validMask!0 mask!1196))))

(declare-fun b!861987 () Bool)

(declare-datatypes ((Unit!29417 0))(
  ( (Unit!29418) )
))
(declare-fun e!480246 () Unit!29417)

(declare-fun Unit!29419 () Unit!29417)

(assert (=> b!861987 (= e!480246 Unit!29419)))

(declare-fun lt!388885 () Unit!29417)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49534 (_ BitVec 32) (_ BitVec 32)) Unit!29417)

(assert (=> b!861987 (= lt!388885 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16901 0))(
  ( (Nil!16898) (Cons!16897 (h!18028 (_ BitVec 64)) (t!23716 List!16901)) )
))
(declare-fun arrayNoDuplicates!0 (array!49534 (_ BitVec 32) List!16901) Bool)

(assert (=> b!861987 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16898)))

(declare-fun lt!388882 () Unit!29417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29417)

(assert (=> b!861987 (= lt!388882 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861987 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388883 () Unit!29417)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49534 (_ BitVec 64) (_ BitVec 32) List!16901) Unit!29417)

(assert (=> b!861987 (= lt!388883 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16898))))

(assert (=> b!861987 false))

(declare-fun b!861988 () Bool)

(declare-fun res!585776 () Bool)

(assert (=> b!861988 (=> (not res!585776) (not e!480248))))

(assert (=> b!861988 (= res!585776 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16898))))

(declare-fun res!585774 () Bool)

(assert (=> start!73634 (=> (not res!585774) (not e!480248))))

(assert (=> start!73634 (= res!585774 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24238 _keys!868))))))

(assert (=> start!73634 e!480248))

(declare-fun tp_is_empty!16685 () Bool)

(assert (=> start!73634 tp_is_empty!16685))

(assert (=> start!73634 true))

(assert (=> start!73634 tp!51150))

(declare-fun array_inv!18828 (array!49534) Bool)

(assert (=> start!73634 (array_inv!18828 _keys!868)))

(declare-datatypes ((V!27293 0))(
  ( (V!27294 (val!8390 Int)) )
))
(declare-datatypes ((ValueCell!7903 0))(
  ( (ValueCellFull!7903 (v!10815 V!27293)) (EmptyCell!7903) )
))
(declare-datatypes ((array!49536 0))(
  ( (array!49537 (arr!23799 (Array (_ BitVec 32) ValueCell!7903)) (size!24239 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49536)

(declare-fun e!480249 () Bool)

(declare-fun array_inv!18829 (array!49536) Bool)

(assert (=> start!73634 (and (array_inv!18829 _values!688) e!480249)))

(declare-fun b!861989 () Bool)

(declare-fun e!480247 () Bool)

(assert (=> b!861989 (= e!480248 e!480247)))

(declare-fun res!585770 () Bool)

(assert (=> b!861989 (=> (not res!585770) (not e!480247))))

(assert (=> b!861989 (= res!585770 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11092 0))(
  ( (tuple2!11093 (_1!5557 (_ BitVec 64)) (_2!5557 V!27293)) )
))
(declare-datatypes ((List!16902 0))(
  ( (Nil!16899) (Cons!16898 (h!18029 tuple2!11092) (t!23717 List!16902)) )
))
(declare-datatypes ((ListLongMap!9861 0))(
  ( (ListLongMap!9862 (toList!4946 List!16902)) )
))
(declare-fun lt!388875 () ListLongMap!9861)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27293)

(declare-fun zeroValue!654 () V!27293)

(declare-fun lt!388877 () array!49536)

(declare-fun getCurrentListMapNoExtraKeys!2922 (array!49534 array!49536 (_ BitVec 32) (_ BitVec 32) V!27293 V!27293 (_ BitVec 32) Int) ListLongMap!9861)

(assert (=> b!861989 (= lt!388875 (getCurrentListMapNoExtraKeys!2922 _keys!868 lt!388877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27293)

(assert (=> b!861989 (= lt!388877 (array!49537 (store (arr!23799 _values!688) i!612 (ValueCellFull!7903 v!557)) (size!24239 _values!688)))))

(declare-fun lt!388878 () ListLongMap!9861)

(assert (=> b!861989 (= lt!388878 (getCurrentListMapNoExtraKeys!2922 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861990 () Bool)

(declare-fun res!585768 () Bool)

(assert (=> b!861990 (=> (not res!585768) (not e!480248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49534 (_ BitVec 32)) Bool)

(assert (=> b!861990 (= res!585768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26627 () Bool)

(declare-fun mapRes!26627 () Bool)

(assert (=> mapIsEmpty!26627 mapRes!26627))

(declare-fun b!861991 () Bool)

(declare-fun res!585775 () Bool)

(assert (=> b!861991 (=> (not res!585775) (not e!480248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861991 (= res!585775 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26627 () Bool)

(declare-fun tp!51151 () Bool)

(declare-fun e!480253 () Bool)

(assert (=> mapNonEmpty!26627 (= mapRes!26627 (and tp!51151 e!480253))))

(declare-fun mapRest!26627 () (Array (_ BitVec 32) ValueCell!7903))

(declare-fun mapValue!26627 () ValueCell!7903)

(declare-fun mapKey!26627 () (_ BitVec 32))

(assert (=> mapNonEmpty!26627 (= (arr!23799 _values!688) (store mapRest!26627 mapKey!26627 mapValue!26627))))

(declare-fun b!861992 () Bool)

(declare-fun e!480251 () Bool)

(assert (=> b!861992 (= e!480251 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24238 _keys!868))))))

(assert (=> b!861992 (not (= (select (arr!23798 _keys!868) from!1053) k!854))))

(declare-fun lt!388880 () Unit!29417)

(assert (=> b!861992 (= lt!388880 e!480246)))

(declare-fun c!92044 () Bool)

(assert (=> b!861992 (= c!92044 (= (select (arr!23798 _keys!868) from!1053) k!854))))

(declare-fun lt!388884 () ListLongMap!9861)

(declare-fun +!2296 (ListLongMap!9861 tuple2!11092) ListLongMap!9861)

(declare-fun get!12558 (ValueCell!7903 V!27293) V!27293)

(declare-fun dynLambda!1132 (Int (_ BitVec 64)) V!27293)

(assert (=> b!861992 (= lt!388875 (+!2296 lt!388884 (tuple2!11093 (select (arr!23798 _keys!868) from!1053) (get!12558 (select (arr!23799 _values!688) from!1053) (dynLambda!1132 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861993 () Bool)

(assert (=> b!861993 (= e!480253 tp_is_empty!16685)))

(declare-fun b!861994 () Bool)

(declare-fun res!585772 () Bool)

(assert (=> b!861994 (=> (not res!585772) (not e!480248))))

(assert (=> b!861994 (= res!585772 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24238 _keys!868))))))

(declare-fun b!861995 () Bool)

(declare-fun Unit!29420 () Unit!29417)

(assert (=> b!861995 (= e!480246 Unit!29420)))

(declare-fun b!861996 () Bool)

(declare-fun res!585767 () Bool)

(assert (=> b!861996 (=> (not res!585767) (not e!480248))))

(assert (=> b!861996 (= res!585767 (and (= (size!24239 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24238 _keys!868) (size!24239 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861997 () Bool)

(assert (=> b!861997 (= e!480247 (not e!480251))))

(declare-fun res!585771 () Bool)

(assert (=> b!861997 (=> res!585771 e!480251)))

(assert (=> b!861997 (= res!585771 (not (validKeyInArray!0 (select (arr!23798 _keys!868) from!1053))))))

(declare-fun lt!388876 () ListLongMap!9861)

(assert (=> b!861997 (= lt!388876 lt!388884)))

(declare-fun lt!388881 () ListLongMap!9861)

(assert (=> b!861997 (= lt!388884 (+!2296 lt!388881 (tuple2!11093 k!854 v!557)))))

(assert (=> b!861997 (= lt!388876 (getCurrentListMapNoExtraKeys!2922 _keys!868 lt!388877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861997 (= lt!388881 (getCurrentListMapNoExtraKeys!2922 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388879 () Unit!29417)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!506 (array!49534 array!49536 (_ BitVec 32) (_ BitVec 32) V!27293 V!27293 (_ BitVec 32) (_ BitVec 64) V!27293 (_ BitVec 32) Int) Unit!29417)

(assert (=> b!861997 (= lt!388879 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!506 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861998 () Bool)

(declare-fun e!480250 () Bool)

(assert (=> b!861998 (= e!480249 (and e!480250 mapRes!26627))))

(declare-fun condMapEmpty!26627 () Bool)

(declare-fun mapDefault!26627 () ValueCell!7903)

