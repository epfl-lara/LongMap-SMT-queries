; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73366 () Bool)

(assert start!73366)

(declare-fun b_free!14113 () Bool)

(declare-fun b_next!14113 () Bool)

(assert (=> start!73366 (= b_free!14113 (not b_next!14113))))

(declare-fun tp!49844 () Bool)

(declare-fun b_and!23395 () Bool)

(assert (=> start!73366 (= tp!49844 b_and!23395)))

(declare-fun b!853714 () Bool)

(declare-fun e!476201 () Bool)

(declare-fun e!476199 () Bool)

(declare-fun mapRes!25973 () Bool)

(assert (=> b!853714 (= e!476201 (and e!476199 mapRes!25973))))

(declare-fun condMapEmpty!25973 () Bool)

(declare-datatypes ((V!26713 0))(
  ( (V!26714 (val!8172 Int)) )
))
(declare-datatypes ((ValueCell!7685 0))(
  ( (ValueCellFull!7685 (v!10597 V!26713)) (EmptyCell!7685) )
))
(declare-datatypes ((array!48747 0))(
  ( (array!48748 (arr!23400 (Array (_ BitVec 32) ValueCell!7685)) (size!23841 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48747)

(declare-fun mapDefault!25973 () ValueCell!7685)

(assert (=> b!853714 (= condMapEmpty!25973 (= (arr!23400 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7685)) mapDefault!25973)))))

(declare-fun b!853715 () Bool)

(declare-fun res!579564 () Bool)

(declare-fun e!476200 () Bool)

(assert (=> b!853715 (=> (not res!579564) (not e!476200))))

(declare-datatypes ((array!48749 0))(
  ( (array!48750 (arr!23401 (Array (_ BitVec 32) (_ BitVec 64))) (size!23842 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48749)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48749 (_ BitVec 32)) Bool)

(assert (=> b!853715 (= res!579564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853716 () Bool)

(declare-fun res!579566 () Bool)

(assert (=> b!853716 (=> (not res!579566) (not e!476200))))

(declare-datatypes ((List!16514 0))(
  ( (Nil!16511) (Cons!16510 (h!17647 (_ BitVec 64)) (t!23065 List!16514)) )
))
(declare-fun arrayNoDuplicates!0 (array!48749 (_ BitVec 32) List!16514) Bool)

(assert (=> b!853716 (= res!579566 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16511))))

(declare-datatypes ((tuple2!10662 0))(
  ( (tuple2!10663 (_1!5342 (_ BitVec 64)) (_2!5342 V!26713)) )
))
(declare-datatypes ((List!16515 0))(
  ( (Nil!16512) (Cons!16511 (h!17648 tuple2!10662) (t!23066 List!16515)) )
))
(declare-datatypes ((ListLongMap!9433 0))(
  ( (ListLongMap!9434 (toList!4732 List!16515)) )
))
(declare-fun call!38240 () ListLongMap!9433)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38236 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26713)

(declare-fun zeroValue!654 () V!26713)

(declare-fun getCurrentListMapNoExtraKeys!2789 (array!48749 array!48747 (_ BitVec 32) (_ BitVec 32) V!26713 V!26713 (_ BitVec 32) Int) ListLongMap!9433)

(assert (=> bm!38236 (= call!38240 (getCurrentListMapNoExtraKeys!2789 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853717 () Bool)

(declare-fun e!476202 () Bool)

(declare-fun e!476205 () Bool)

(assert (=> b!853717 (= e!476202 (not e!476205))))

(declare-fun res!579562 () Bool)

(assert (=> b!853717 (=> res!579562 e!476205)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853717 (= res!579562 (not (validKeyInArray!0 (select (arr!23401 _keys!868) from!1053))))))

(declare-fun e!476206 () Bool)

(assert (=> b!853717 e!476206))

(declare-fun c!92122 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853717 (= c!92122 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!26713)

(declare-datatypes ((Unit!29116 0))(
  ( (Unit!29117) )
))
(declare-fun lt!384704 () Unit!29116)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!383 (array!48749 array!48747 (_ BitVec 32) (_ BitVec 32) V!26713 V!26713 (_ BitVec 32) (_ BitVec 64) V!26713 (_ BitVec 32) Int) Unit!29116)

(assert (=> b!853717 (= lt!384704 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!383 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25973 () Bool)

(assert (=> mapIsEmpty!25973 mapRes!25973))

(declare-fun call!38239 () ListLongMap!9433)

(declare-fun b!853718 () Bool)

(declare-fun +!2178 (ListLongMap!9433 tuple2!10662) ListLongMap!9433)

(assert (=> b!853718 (= e!476206 (= call!38239 (+!2178 call!38240 (tuple2!10663 k0!854 v!557))))))

(declare-fun b!853719 () Bool)

(declare-fun tp_is_empty!16249 () Bool)

(assert (=> b!853719 (= e!476199 tp_is_empty!16249)))

(declare-fun b!853720 () Bool)

(assert (=> b!853720 (= e!476205 true)))

(declare-fun lt!384698 () V!26713)

(declare-fun lt!384703 () ListLongMap!9433)

(declare-fun lt!384696 () tuple2!10662)

(assert (=> b!853720 (= (+!2178 lt!384703 lt!384696) (+!2178 (+!2178 lt!384703 (tuple2!10663 k0!854 lt!384698)) lt!384696))))

(declare-fun lt!384695 () V!26713)

(assert (=> b!853720 (= lt!384696 (tuple2!10663 k0!854 lt!384695))))

(declare-fun lt!384697 () Unit!29116)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!305 (ListLongMap!9433 (_ BitVec 64) V!26713 V!26713) Unit!29116)

(assert (=> b!853720 (= lt!384697 (addSameAsAddTwiceSameKeyDiffValues!305 lt!384703 k0!854 lt!384698 lt!384695))))

(declare-fun lt!384699 () V!26713)

(declare-fun get!12340 (ValueCell!7685 V!26713) V!26713)

(assert (=> b!853720 (= lt!384698 (get!12340 (select (arr!23400 _values!688) from!1053) lt!384699))))

(declare-fun lt!384701 () ListLongMap!9433)

(assert (=> b!853720 (= lt!384701 (+!2178 lt!384703 (tuple2!10663 (select (arr!23401 _keys!868) from!1053) lt!384695)))))

(assert (=> b!853720 (= lt!384695 (get!12340 (select (store (arr!23400 _values!688) i!612 (ValueCellFull!7685 v!557)) from!1053) lt!384699))))

(declare-fun dynLambda!1052 (Int (_ BitVec 64)) V!26713)

(assert (=> b!853720 (= lt!384699 (dynLambda!1052 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384700 () array!48747)

(assert (=> b!853720 (= lt!384703 (getCurrentListMapNoExtraKeys!2789 _keys!868 lt!384700 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853721 () Bool)

(declare-fun res!579565 () Bool)

(assert (=> b!853721 (=> (not res!579565) (not e!476200))))

(assert (=> b!853721 (= res!579565 (and (= (size!23841 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23842 _keys!868) (size!23841 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853722 () Bool)

(declare-fun res!579570 () Bool)

(assert (=> b!853722 (=> (not res!579570) (not e!476200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853722 (= res!579570 (validMask!0 mask!1196))))

(declare-fun bm!38237 () Bool)

(assert (=> bm!38237 (= call!38239 (getCurrentListMapNoExtraKeys!2789 _keys!868 lt!384700 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853723 () Bool)

(declare-fun e!476203 () Bool)

(assert (=> b!853723 (= e!476203 tp_is_empty!16249)))

(declare-fun b!853724 () Bool)

(declare-fun res!579568 () Bool)

(assert (=> b!853724 (=> (not res!579568) (not e!476200))))

(assert (=> b!853724 (= res!579568 (validKeyInArray!0 k0!854))))

(declare-fun res!579569 () Bool)

(assert (=> start!73366 (=> (not res!579569) (not e!476200))))

(assert (=> start!73366 (= res!579569 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23842 _keys!868))))))

(assert (=> start!73366 e!476200))

(assert (=> start!73366 tp_is_empty!16249))

(assert (=> start!73366 true))

(assert (=> start!73366 tp!49844))

(declare-fun array_inv!18610 (array!48749) Bool)

(assert (=> start!73366 (array_inv!18610 _keys!868)))

(declare-fun array_inv!18611 (array!48747) Bool)

(assert (=> start!73366 (and (array_inv!18611 _values!688) e!476201)))

(declare-fun b!853713 () Bool)

(assert (=> b!853713 (= e!476206 (= call!38239 call!38240))))

(declare-fun mapNonEmpty!25973 () Bool)

(declare-fun tp!49843 () Bool)

(assert (=> mapNonEmpty!25973 (= mapRes!25973 (and tp!49843 e!476203))))

(declare-fun mapValue!25973 () ValueCell!7685)

(declare-fun mapKey!25973 () (_ BitVec 32))

(declare-fun mapRest!25973 () (Array (_ BitVec 32) ValueCell!7685))

(assert (=> mapNonEmpty!25973 (= (arr!23400 _values!688) (store mapRest!25973 mapKey!25973 mapValue!25973))))

(declare-fun b!853725 () Bool)

(declare-fun res!579571 () Bool)

(assert (=> b!853725 (=> (not res!579571) (not e!476200))))

(assert (=> b!853725 (= res!579571 (and (= (select (arr!23401 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853726 () Bool)

(assert (=> b!853726 (= e!476200 e!476202)))

(declare-fun res!579567 () Bool)

(assert (=> b!853726 (=> (not res!579567) (not e!476202))))

(assert (=> b!853726 (= res!579567 (= from!1053 i!612))))

(assert (=> b!853726 (= lt!384701 (getCurrentListMapNoExtraKeys!2789 _keys!868 lt!384700 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853726 (= lt!384700 (array!48748 (store (arr!23400 _values!688) i!612 (ValueCellFull!7685 v!557)) (size!23841 _values!688)))))

(declare-fun lt!384702 () ListLongMap!9433)

(assert (=> b!853726 (= lt!384702 (getCurrentListMapNoExtraKeys!2789 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853727 () Bool)

(declare-fun res!579563 () Bool)

(assert (=> b!853727 (=> (not res!579563) (not e!476200))))

(assert (=> b!853727 (= res!579563 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23842 _keys!868))))))

(assert (= (and start!73366 res!579569) b!853722))

(assert (= (and b!853722 res!579570) b!853721))

(assert (= (and b!853721 res!579565) b!853715))

(assert (= (and b!853715 res!579564) b!853716))

(assert (= (and b!853716 res!579566) b!853727))

(assert (= (and b!853727 res!579563) b!853724))

(assert (= (and b!853724 res!579568) b!853725))

(assert (= (and b!853725 res!579571) b!853726))

(assert (= (and b!853726 res!579567) b!853717))

(assert (= (and b!853717 c!92122) b!853718))

(assert (= (and b!853717 (not c!92122)) b!853713))

(assert (= (or b!853718 b!853713) bm!38236))

(assert (= (or b!853718 b!853713) bm!38237))

(assert (= (and b!853717 (not res!579562)) b!853720))

(assert (= (and b!853714 condMapEmpty!25973) mapIsEmpty!25973))

(assert (= (and b!853714 (not condMapEmpty!25973)) mapNonEmpty!25973))

(get-info :version)

(assert (= (and mapNonEmpty!25973 ((_ is ValueCellFull!7685) mapValue!25973)) b!853723))

(assert (= (and b!853714 ((_ is ValueCellFull!7685) mapDefault!25973)) b!853719))

(assert (= start!73366 b!853714))

(declare-fun b_lambda!11659 () Bool)

(assert (=> (not b_lambda!11659) (not b!853720)))

(declare-fun t!23064 () Bool)

(declare-fun tb!4407 () Bool)

(assert (=> (and start!73366 (= defaultEntry!696 defaultEntry!696) t!23064) tb!4407))

(declare-fun result!8433 () Bool)

(assert (=> tb!4407 (= result!8433 tp_is_empty!16249)))

(assert (=> b!853720 t!23064))

(declare-fun b_and!23397 () Bool)

(assert (= b_and!23395 (and (=> t!23064 result!8433) b_and!23397)))

(declare-fun m!795217 () Bool)

(assert (=> b!853720 m!795217))

(assert (=> b!853720 m!795217))

(declare-fun m!795219 () Bool)

(assert (=> b!853720 m!795219))

(declare-fun m!795221 () Bool)

(assert (=> b!853720 m!795221))

(declare-fun m!795223 () Bool)

(assert (=> b!853720 m!795223))

(declare-fun m!795225 () Bool)

(assert (=> b!853720 m!795225))

(declare-fun m!795227 () Bool)

(assert (=> b!853720 m!795227))

(declare-fun m!795229 () Bool)

(assert (=> b!853720 m!795229))

(declare-fun m!795231 () Bool)

(assert (=> b!853720 m!795231))

(declare-fun m!795233 () Bool)

(assert (=> b!853720 m!795233))

(declare-fun m!795235 () Bool)

(assert (=> b!853720 m!795235))

(declare-fun m!795237 () Bool)

(assert (=> b!853720 m!795237))

(declare-fun m!795239 () Bool)

(assert (=> b!853720 m!795239))

(assert (=> b!853720 m!795221))

(assert (=> b!853720 m!795225))

(declare-fun m!795241 () Bool)

(assert (=> b!853720 m!795241))

(declare-fun m!795243 () Bool)

(assert (=> start!73366 m!795243))

(declare-fun m!795245 () Bool)

(assert (=> start!73366 m!795245))

(declare-fun m!795247 () Bool)

(assert (=> b!853715 m!795247))

(declare-fun m!795249 () Bool)

(assert (=> bm!38236 m!795249))

(declare-fun m!795251 () Bool)

(assert (=> mapNonEmpty!25973 m!795251))

(assert (=> b!853717 m!795235))

(assert (=> b!853717 m!795235))

(declare-fun m!795253 () Bool)

(assert (=> b!853717 m!795253))

(declare-fun m!795255 () Bool)

(assert (=> b!853717 m!795255))

(assert (=> bm!38237 m!795233))

(declare-fun m!795257 () Bool)

(assert (=> b!853716 m!795257))

(declare-fun m!795259 () Bool)

(assert (=> b!853725 m!795259))

(declare-fun m!795261 () Bool)

(assert (=> b!853718 m!795261))

(declare-fun m!795263 () Bool)

(assert (=> b!853726 m!795263))

(assert (=> b!853726 m!795229))

(declare-fun m!795265 () Bool)

(assert (=> b!853726 m!795265))

(declare-fun m!795267 () Bool)

(assert (=> b!853724 m!795267))

(declare-fun m!795269 () Bool)

(assert (=> b!853722 m!795269))

(check-sat tp_is_empty!16249 (not b!853722) (not b!853720) (not b_next!14113) (not b!853718) (not b!853726) (not bm!38237) (not mapNonEmpty!25973) (not start!73366) (not b_lambda!11659) (not b!853724) (not b!853715) (not b!853716) (not b!853717) b_and!23397 (not bm!38236))
(check-sat b_and!23397 (not b_next!14113))
