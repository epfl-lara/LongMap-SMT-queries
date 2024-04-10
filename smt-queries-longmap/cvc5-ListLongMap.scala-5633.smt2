; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73582 () Bool)

(assert start!73582)

(declare-fun b_free!14497 () Bool)

(declare-fun b_next!14497 () Bool)

(assert (=> start!73582 (= b_free!14497 (not b_next!14497))))

(declare-fun tp!50994 () Bool)

(declare-fun b_and!23973 () Bool)

(assert (=> start!73582 (= tp!50994 b_and!23973)))

(declare-fun b!860763 () Bool)

(declare-fun res!584995 () Bool)

(declare-fun e!479629 () Bool)

(assert (=> b!860763 (=> (not res!584995) (not e!479629))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860763 (= res!584995 (validMask!0 mask!1196))))

(declare-fun b!860764 () Bool)

(declare-fun res!584987 () Bool)

(assert (=> b!860764 (=> (not res!584987) (not e!479629))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49440 0))(
  ( (array!49441 (arr!23751 (Array (_ BitVec 32) (_ BitVec 64))) (size!24191 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49440)

(declare-datatypes ((V!27225 0))(
  ( (V!27226 (val!8364 Int)) )
))
(declare-datatypes ((ValueCell!7877 0))(
  ( (ValueCellFull!7877 (v!10789 V!27225)) (EmptyCell!7877) )
))
(declare-datatypes ((array!49442 0))(
  ( (array!49443 (arr!23752 (Array (_ BitVec 32) ValueCell!7877)) (size!24192 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49442)

(assert (=> b!860764 (= res!584987 (and (= (size!24192 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24191 _keys!868) (size!24192 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860765 () Bool)

(declare-fun res!584994 () Bool)

(assert (=> b!860765 (=> (not res!584994) (not e!479629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49440 (_ BitVec 32)) Bool)

(assert (=> b!860765 (= res!584994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26549 () Bool)

(declare-fun mapRes!26549 () Bool)

(assert (=> mapIsEmpty!26549 mapRes!26549))

(declare-fun b!860766 () Bool)

(declare-datatypes ((Unit!29343 0))(
  ( (Unit!29344) )
))
(declare-fun e!479624 () Unit!29343)

(declare-fun Unit!29345 () Unit!29343)

(assert (=> b!860766 (= e!479624 Unit!29345)))

(declare-fun lt!388020 () Unit!29343)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49440 (_ BitVec 32) (_ BitVec 32)) Unit!29343)

(assert (=> b!860766 (= lt!388020 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16863 0))(
  ( (Nil!16860) (Cons!16859 (h!17990 (_ BitVec 64)) (t!23626 List!16863)) )
))
(declare-fun arrayNoDuplicates!0 (array!49440 (_ BitVec 32) List!16863) Bool)

(assert (=> b!860766 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16860)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!388017 () Unit!29343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49440 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29343)

(assert (=> b!860766 (= lt!388017 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860766 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388027 () Unit!29343)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49440 (_ BitVec 64) (_ BitVec 32) List!16863) Unit!29343)

(assert (=> b!860766 (= lt!388027 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16860))))

(assert (=> b!860766 false))

(declare-fun b!860767 () Bool)

(declare-fun e!479622 () Bool)

(declare-fun tp_is_empty!16633 () Bool)

(assert (=> b!860767 (= e!479622 tp_is_empty!16633)))

(declare-fun b!860768 () Bool)

(declare-fun res!584988 () Bool)

(assert (=> b!860768 (=> (not res!584988) (not e!479629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860768 (= res!584988 (validKeyInArray!0 k!854))))

(declare-fun res!584996 () Bool)

(assert (=> start!73582 (=> (not res!584996) (not e!479629))))

(assert (=> start!73582 (= res!584996 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24191 _keys!868))))))

(assert (=> start!73582 e!479629))

(assert (=> start!73582 tp_is_empty!16633))

(assert (=> start!73582 true))

(assert (=> start!73582 tp!50994))

(declare-fun array_inv!18802 (array!49440) Bool)

(assert (=> start!73582 (array_inv!18802 _keys!868)))

(declare-fun e!479625 () Bool)

(declare-fun array_inv!18803 (array!49442) Bool)

(assert (=> start!73582 (and (array_inv!18803 _values!688) e!479625)))

(declare-fun b!860769 () Bool)

(declare-fun res!584989 () Bool)

(assert (=> b!860769 (=> (not res!584989) (not e!479629))))

(assert (=> b!860769 (= res!584989 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16860))))

(declare-fun b!860770 () Bool)

(declare-fun e!479626 () Bool)

(declare-fun e!479623 () Bool)

(assert (=> b!860770 (= e!479626 (not e!479623))))

(declare-fun res!584990 () Bool)

(assert (=> b!860770 (=> res!584990 e!479623)))

(assert (=> b!860770 (= res!584990 (not (validKeyInArray!0 (select (arr!23751 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11054 0))(
  ( (tuple2!11055 (_1!5538 (_ BitVec 64)) (_2!5538 V!27225)) )
))
(declare-datatypes ((List!16864 0))(
  ( (Nil!16861) (Cons!16860 (h!17991 tuple2!11054) (t!23627 List!16864)) )
))
(declare-datatypes ((ListLongMap!9823 0))(
  ( (ListLongMap!9824 (toList!4927 List!16864)) )
))
(declare-fun lt!388026 () ListLongMap!9823)

(declare-fun lt!388019 () ListLongMap!9823)

(assert (=> b!860770 (= lt!388026 lt!388019)))

(declare-fun v!557 () V!27225)

(declare-fun lt!388018 () ListLongMap!9823)

(declare-fun +!2279 (ListLongMap!9823 tuple2!11054) ListLongMap!9823)

(assert (=> b!860770 (= lt!388019 (+!2279 lt!388018 (tuple2!11055 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388023 () array!49442)

(declare-fun minValue!654 () V!27225)

(declare-fun zeroValue!654 () V!27225)

(declare-fun getCurrentListMapNoExtraKeys!2904 (array!49440 array!49442 (_ BitVec 32) (_ BitVec 32) V!27225 V!27225 (_ BitVec 32) Int) ListLongMap!9823)

(assert (=> b!860770 (= lt!388026 (getCurrentListMapNoExtraKeys!2904 _keys!868 lt!388023 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860770 (= lt!388018 (getCurrentListMapNoExtraKeys!2904 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388021 () Unit!29343)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!491 (array!49440 array!49442 (_ BitVec 32) (_ BitVec 32) V!27225 V!27225 (_ BitVec 32) (_ BitVec 64) V!27225 (_ BitVec 32) Int) Unit!29343)

(assert (=> b!860770 (= lt!388021 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!491 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860771 () Bool)

(declare-fun res!584992 () Bool)

(assert (=> b!860771 (=> (not res!584992) (not e!479629))))

(assert (=> b!860771 (= res!584992 (and (= (select (arr!23751 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!860772 () Bool)

(declare-fun Unit!29346 () Unit!29343)

(assert (=> b!860772 (= e!479624 Unit!29346)))

(declare-fun b!860773 () Bool)

(declare-fun res!584991 () Bool)

(assert (=> b!860773 (=> (not res!584991) (not e!479629))))

(assert (=> b!860773 (= res!584991 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24191 _keys!868))))))

(declare-fun b!860774 () Bool)

(assert (=> b!860774 (= e!479629 e!479626)))

(declare-fun res!584993 () Bool)

(assert (=> b!860774 (=> (not res!584993) (not e!479626))))

(assert (=> b!860774 (= res!584993 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388022 () ListLongMap!9823)

(assert (=> b!860774 (= lt!388022 (getCurrentListMapNoExtraKeys!2904 _keys!868 lt!388023 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860774 (= lt!388023 (array!49443 (store (arr!23752 _values!688) i!612 (ValueCellFull!7877 v!557)) (size!24192 _values!688)))))

(declare-fun lt!388025 () ListLongMap!9823)

(assert (=> b!860774 (= lt!388025 (getCurrentListMapNoExtraKeys!2904 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26549 () Bool)

(declare-fun tp!50995 () Bool)

(declare-fun e!479628 () Bool)

(assert (=> mapNonEmpty!26549 (= mapRes!26549 (and tp!50995 e!479628))))

(declare-fun mapValue!26549 () ValueCell!7877)

(declare-fun mapKey!26549 () (_ BitVec 32))

(declare-fun mapRest!26549 () (Array (_ BitVec 32) ValueCell!7877))

(assert (=> mapNonEmpty!26549 (= (arr!23752 _values!688) (store mapRest!26549 mapKey!26549 mapValue!26549))))

(declare-fun b!860775 () Bool)

(assert (=> b!860775 (= e!479628 tp_is_empty!16633)))

(declare-fun b!860776 () Bool)

(assert (=> b!860776 (= e!479623 true)))

(assert (=> b!860776 (not (= (select (arr!23751 _keys!868) from!1053) k!854))))

(declare-fun lt!388024 () Unit!29343)

(assert (=> b!860776 (= lt!388024 e!479624)))

(declare-fun c!91966 () Bool)

(assert (=> b!860776 (= c!91966 (= (select (arr!23751 _keys!868) from!1053) k!854))))

(declare-fun get!12525 (ValueCell!7877 V!27225) V!27225)

(declare-fun dynLambda!1115 (Int (_ BitVec 64)) V!27225)

(assert (=> b!860776 (= lt!388022 (+!2279 lt!388019 (tuple2!11055 (select (arr!23751 _keys!868) from!1053) (get!12525 (select (arr!23752 _values!688) from!1053) (dynLambda!1115 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860777 () Bool)

(assert (=> b!860777 (= e!479625 (and e!479622 mapRes!26549))))

(declare-fun condMapEmpty!26549 () Bool)

(declare-fun mapDefault!26549 () ValueCell!7877)

