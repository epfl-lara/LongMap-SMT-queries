; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73282 () Bool)

(assert start!73282)

(declare-fun b_free!14029 () Bool)

(declare-fun b_next!14029 () Bool)

(assert (=> start!73282 (= b_free!14029 (not b_next!14029))))

(declare-fun tp!49592 () Bool)

(declare-fun b_and!23227 () Bool)

(assert (=> start!73282 (= tp!49592 b_and!23227)))

(declare-fun b!851739 () Bool)

(declare-fun e!475197 () Bool)

(declare-fun e!475196 () Bool)

(assert (=> b!851739 (= e!475197 (not e!475196))))

(declare-fun res!578302 () Bool)

(assert (=> b!851739 (=> res!578302 e!475196)))

(declare-datatypes ((array!48583 0))(
  ( (array!48584 (arr!23318 (Array (_ BitVec 32) (_ BitVec 64))) (size!23759 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48583)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851739 (= res!578302 (not (validKeyInArray!0 (select (arr!23318 _keys!868) from!1053))))))

(declare-fun e!475191 () Bool)

(assert (=> b!851739 e!475191))

(declare-fun c!91996 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851739 (= c!91996 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26601 0))(
  ( (V!26602 (val!8130 Int)) )
))
(declare-fun v!557 () V!26601)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!29046 0))(
  ( (Unit!29047) )
))
(declare-fun lt!383443 () Unit!29046)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7643 0))(
  ( (ValueCellFull!7643 (v!10555 V!26601)) (EmptyCell!7643) )
))
(declare-datatypes ((array!48585 0))(
  ( (array!48586 (arr!23319 (Array (_ BitVec 32) ValueCell!7643)) (size!23760 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48585)

(declare-fun minValue!654 () V!26601)

(declare-fun zeroValue!654 () V!26601)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!356 (array!48583 array!48585 (_ BitVec 32) (_ BitVec 32) V!26601 V!26601 (_ BitVec 32) (_ BitVec 64) V!26601 (_ BitVec 32) Int) Unit!29046)

(assert (=> b!851739 (= lt!383443 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!356 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851740 () Bool)

(declare-fun res!578307 () Bool)

(declare-fun e!475193 () Bool)

(assert (=> b!851740 (=> (not res!578307) (not e!475193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48583 (_ BitVec 32)) Bool)

(assert (=> b!851740 (= res!578307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851741 () Bool)

(declare-fun e!475198 () Bool)

(declare-fun tp_is_empty!16165 () Bool)

(assert (=> b!851741 (= e!475198 tp_is_empty!16165)))

(declare-fun res!578304 () Bool)

(assert (=> start!73282 (=> (not res!578304) (not e!475193))))

(assert (=> start!73282 (= res!578304 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23759 _keys!868))))))

(assert (=> start!73282 e!475193))

(assert (=> start!73282 tp_is_empty!16165))

(assert (=> start!73282 true))

(assert (=> start!73282 tp!49592))

(declare-fun array_inv!18550 (array!48583) Bool)

(assert (=> start!73282 (array_inv!18550 _keys!868)))

(declare-fun e!475195 () Bool)

(declare-fun array_inv!18551 (array!48585) Bool)

(assert (=> start!73282 (and (array_inv!18551 _values!688) e!475195)))

(declare-fun b!851742 () Bool)

(declare-fun e!475192 () Bool)

(assert (=> b!851742 (= e!475192 tp_is_empty!16165)))

(declare-fun b!851743 () Bool)

(assert (=> b!851743 (= e!475193 e!475197)))

(declare-fun res!578309 () Bool)

(assert (=> b!851743 (=> (not res!578309) (not e!475197))))

(assert (=> b!851743 (= res!578309 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10586 0))(
  ( (tuple2!10587 (_1!5304 (_ BitVec 64)) (_2!5304 V!26601)) )
))
(declare-datatypes ((List!16445 0))(
  ( (Nil!16442) (Cons!16441 (h!17578 tuple2!10586) (t!22912 List!16445)) )
))
(declare-datatypes ((ListLongMap!9357 0))(
  ( (ListLongMap!9358 (toList!4694 List!16445)) )
))
(declare-fun lt!383442 () ListLongMap!9357)

(declare-fun lt!383444 () array!48585)

(declare-fun getCurrentListMapNoExtraKeys!2752 (array!48583 array!48585 (_ BitVec 32) (_ BitVec 32) V!26601 V!26601 (_ BitVec 32) Int) ListLongMap!9357)

(assert (=> b!851743 (= lt!383442 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!383444 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851743 (= lt!383444 (array!48586 (store (arr!23319 _values!688) i!612 (ValueCellFull!7643 v!557)) (size!23760 _values!688)))))

(declare-fun lt!383441 () ListLongMap!9357)

(assert (=> b!851743 (= lt!383441 (getCurrentListMapNoExtraKeys!2752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25847 () Bool)

(declare-fun mapRes!25847 () Bool)

(assert (=> mapIsEmpty!25847 mapRes!25847))

(declare-fun b!851744 () Bool)

(declare-fun res!578311 () Bool)

(assert (=> b!851744 (=> (not res!578311) (not e!475193))))

(assert (=> b!851744 (= res!578311 (validKeyInArray!0 k0!854))))

(declare-fun b!851745 () Bool)

(declare-fun res!578305 () Bool)

(assert (=> b!851745 (=> (not res!578305) (not e!475193))))

(assert (=> b!851745 (= res!578305 (and (= (select (arr!23318 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851746 () Bool)

(assert (=> b!851746 (= e!475195 (and e!475192 mapRes!25847))))

(declare-fun condMapEmpty!25847 () Bool)

(declare-fun mapDefault!25847 () ValueCell!7643)

(assert (=> b!851746 (= condMapEmpty!25847 (= (arr!23319 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7643)) mapDefault!25847)))))

(declare-fun mapNonEmpty!25847 () Bool)

(declare-fun tp!49591 () Bool)

(assert (=> mapNonEmpty!25847 (= mapRes!25847 (and tp!49591 e!475198))))

(declare-fun mapKey!25847 () (_ BitVec 32))

(declare-fun mapValue!25847 () ValueCell!7643)

(declare-fun mapRest!25847 () (Array (_ BitVec 32) ValueCell!7643))

(assert (=> mapNonEmpty!25847 (= (arr!23319 _values!688) (store mapRest!25847 mapKey!25847 mapValue!25847))))

(declare-fun call!37988 () ListLongMap!9357)

(declare-fun bm!37984 () Bool)

(assert (=> bm!37984 (= call!37988 (getCurrentListMapNoExtraKeys!2752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851747 () Bool)

(declare-fun res!578306 () Bool)

(assert (=> b!851747 (=> (not res!578306) (not e!475193))))

(assert (=> b!851747 (= res!578306 (and (= (size!23760 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23759 _keys!868) (size!23760 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851748 () Bool)

(declare-fun res!578303 () Bool)

(assert (=> b!851748 (=> (not res!578303) (not e!475193))))

(declare-datatypes ((List!16446 0))(
  ( (Nil!16443) (Cons!16442 (h!17579 (_ BitVec 64)) (t!22913 List!16446)) )
))
(declare-fun arrayNoDuplicates!0 (array!48583 (_ BitVec 32) List!16446) Bool)

(assert (=> b!851748 (= res!578303 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16443))))

(declare-fun b!851749 () Bool)

(declare-fun call!37987 () ListLongMap!9357)

(declare-fun +!2141 (ListLongMap!9357 tuple2!10586) ListLongMap!9357)

(assert (=> b!851749 (= e!475191 (= call!37987 (+!2141 call!37988 (tuple2!10587 k0!854 v!557))))))

(declare-fun b!851750 () Bool)

(assert (=> b!851750 (= e!475191 (= call!37987 call!37988))))

(declare-fun b!851751 () Bool)

(declare-fun res!578310 () Bool)

(assert (=> b!851751 (=> (not res!578310) (not e!475193))))

(assert (=> b!851751 (= res!578310 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23759 _keys!868))))))

(declare-fun bm!37985 () Bool)

(assert (=> bm!37985 (= call!37987 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!383444 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851752 () Bool)

(declare-fun res!578308 () Bool)

(assert (=> b!851752 (=> (not res!578308) (not e!475193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851752 (= res!578308 (validMask!0 mask!1196))))

(declare-fun b!851753 () Bool)

(assert (=> b!851753 (= e!475196 true)))

(declare-fun lt!383437 () ListLongMap!9357)

(declare-fun lt!383436 () V!26601)

(declare-fun lt!383435 () tuple2!10586)

(assert (=> b!851753 (= (+!2141 lt!383437 lt!383435) (+!2141 (+!2141 lt!383437 (tuple2!10587 k0!854 lt!383436)) lt!383435))))

(declare-fun lt!383438 () V!26601)

(assert (=> b!851753 (= lt!383435 (tuple2!10587 k0!854 lt!383438))))

(declare-fun lt!383439 () Unit!29046)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!271 (ListLongMap!9357 (_ BitVec 64) V!26601 V!26601) Unit!29046)

(assert (=> b!851753 (= lt!383439 (addSameAsAddTwiceSameKeyDiffValues!271 lt!383437 k0!854 lt!383436 lt!383438))))

(declare-fun lt!383440 () V!26601)

(declare-fun get!12278 (ValueCell!7643 V!26601) V!26601)

(assert (=> b!851753 (= lt!383436 (get!12278 (select (arr!23319 _values!688) from!1053) lt!383440))))

(assert (=> b!851753 (= lt!383442 (+!2141 lt!383437 (tuple2!10587 (select (arr!23318 _keys!868) from!1053) lt!383438)))))

(assert (=> b!851753 (= lt!383438 (get!12278 (select (store (arr!23319 _values!688) i!612 (ValueCellFull!7643 v!557)) from!1053) lt!383440))))

(declare-fun dynLambda!1018 (Int (_ BitVec 64)) V!26601)

(assert (=> b!851753 (= lt!383440 (dynLambda!1018 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851753 (= lt!383437 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!383444 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73282 res!578304) b!851752))

(assert (= (and b!851752 res!578308) b!851747))

(assert (= (and b!851747 res!578306) b!851740))

(assert (= (and b!851740 res!578307) b!851748))

(assert (= (and b!851748 res!578303) b!851751))

(assert (= (and b!851751 res!578310) b!851744))

(assert (= (and b!851744 res!578311) b!851745))

(assert (= (and b!851745 res!578305) b!851743))

(assert (= (and b!851743 res!578309) b!851739))

(assert (= (and b!851739 c!91996) b!851749))

(assert (= (and b!851739 (not c!91996)) b!851750))

(assert (= (or b!851749 b!851750) bm!37985))

(assert (= (or b!851749 b!851750) bm!37984))

(assert (= (and b!851739 (not res!578302)) b!851753))

(assert (= (and b!851746 condMapEmpty!25847) mapIsEmpty!25847))

(assert (= (and b!851746 (not condMapEmpty!25847)) mapNonEmpty!25847))

(get-info :version)

(assert (= (and mapNonEmpty!25847 ((_ is ValueCellFull!7643) mapValue!25847)) b!851741))

(assert (= (and b!851746 ((_ is ValueCellFull!7643) mapDefault!25847)) b!851742))

(assert (= start!73282 b!851746))

(declare-fun b_lambda!11575 () Bool)

(assert (=> (not b_lambda!11575) (not b!851753)))

(declare-fun t!22911 () Bool)

(declare-fun tb!4323 () Bool)

(assert (=> (and start!73282 (= defaultEntry!696 defaultEntry!696) t!22911) tb!4323))

(declare-fun result!8265 () Bool)

(assert (=> tb!4323 (= result!8265 tp_is_empty!16165)))

(assert (=> b!851753 t!22911))

(declare-fun b_and!23229 () Bool)

(assert (= b_and!23227 (and (=> t!22911 result!8265) b_and!23229)))

(declare-fun m!792949 () Bool)

(assert (=> bm!37984 m!792949))

(declare-fun m!792951 () Bool)

(assert (=> b!851743 m!792951))

(declare-fun m!792953 () Bool)

(assert (=> b!851743 m!792953))

(declare-fun m!792955 () Bool)

(assert (=> b!851743 m!792955))

(declare-fun m!792957 () Bool)

(assert (=> bm!37985 m!792957))

(declare-fun m!792959 () Bool)

(assert (=> start!73282 m!792959))

(declare-fun m!792961 () Bool)

(assert (=> start!73282 m!792961))

(declare-fun m!792963 () Bool)

(assert (=> mapNonEmpty!25847 m!792963))

(declare-fun m!792965 () Bool)

(assert (=> b!851748 m!792965))

(declare-fun m!792967 () Bool)

(assert (=> b!851752 m!792967))

(declare-fun m!792969 () Bool)

(assert (=> b!851753 m!792969))

(declare-fun m!792971 () Bool)

(assert (=> b!851753 m!792971))

(declare-fun m!792973 () Bool)

(assert (=> b!851753 m!792973))

(declare-fun m!792975 () Bool)

(assert (=> b!851753 m!792975))

(declare-fun m!792977 () Bool)

(assert (=> b!851753 m!792977))

(assert (=> b!851753 m!792975))

(declare-fun m!792979 () Bool)

(assert (=> b!851753 m!792979))

(assert (=> b!851753 m!792957))

(declare-fun m!792981 () Bool)

(assert (=> b!851753 m!792981))

(declare-fun m!792983 () Bool)

(assert (=> b!851753 m!792983))

(assert (=> b!851753 m!792971))

(assert (=> b!851753 m!792977))

(declare-fun m!792985 () Bool)

(assert (=> b!851753 m!792985))

(assert (=> b!851753 m!792953))

(declare-fun m!792987 () Bool)

(assert (=> b!851753 m!792987))

(declare-fun m!792989 () Bool)

(assert (=> b!851753 m!792989))

(declare-fun m!792991 () Bool)

(assert (=> b!851749 m!792991))

(declare-fun m!792993 () Bool)

(assert (=> b!851745 m!792993))

(declare-fun m!792995 () Bool)

(assert (=> b!851740 m!792995))

(assert (=> b!851739 m!792987))

(assert (=> b!851739 m!792987))

(declare-fun m!792997 () Bool)

(assert (=> b!851739 m!792997))

(declare-fun m!792999 () Bool)

(assert (=> b!851739 m!792999))

(declare-fun m!793001 () Bool)

(assert (=> b!851744 m!793001))

(check-sat tp_is_empty!16165 (not b!851753) (not b!851749) (not b!851752) (not bm!37984) (not b_next!14029) (not bm!37985) (not b!851748) (not b!851739) (not b!851743) (not b!851740) (not b_lambda!11575) b_and!23229 (not start!73282) (not b!851744) (not mapNonEmpty!25847))
(check-sat b_and!23229 (not b_next!14029))
