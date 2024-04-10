; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73818 () Bool)

(assert start!73818)

(declare-fun b_free!14733 () Bool)

(declare-fun b_next!14733 () Bool)

(assert (=> start!73818 (= b_free!14733 (not b_next!14733))))

(declare-fun tp!51702 () Bool)

(declare-fun b_and!24445 () Bool)

(assert (=> start!73818 (= tp!51702 b_and!24445)))

(declare-fun b!866575 () Bool)

(declare-fun res!588802 () Bool)

(declare-fun e!482720 () Bool)

(assert (=> b!866575 (=> (not res!588802) (not e!482720))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866575 (= res!588802 (validKeyInArray!0 k0!854))))

(declare-fun b!866576 () Bool)

(declare-fun e!482723 () Bool)

(declare-fun e!482721 () Bool)

(declare-fun mapRes!26903 () Bool)

(assert (=> b!866576 (= e!482723 (and e!482721 mapRes!26903))))

(declare-fun condMapEmpty!26903 () Bool)

(declare-datatypes ((V!27539 0))(
  ( (V!27540 (val!8482 Int)) )
))
(declare-datatypes ((ValueCell!7995 0))(
  ( (ValueCellFull!7995 (v!10907 V!27539)) (EmptyCell!7995) )
))
(declare-datatypes ((array!49898 0))(
  ( (array!49899 (arr!23980 (Array (_ BitVec 32) ValueCell!7995)) (size!24420 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49898)

(declare-fun mapDefault!26903 () ValueCell!7995)

(assert (=> b!866576 (= condMapEmpty!26903 (= (arr!23980 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7995)) mapDefault!26903)))))

(declare-fun mapNonEmpty!26903 () Bool)

(declare-fun tp!51703 () Bool)

(declare-fun e!482726 () Bool)

(assert (=> mapNonEmpty!26903 (= mapRes!26903 (and tp!51703 e!482726))))

(declare-fun mapRest!26903 () (Array (_ BitVec 32) ValueCell!7995))

(declare-fun mapKey!26903 () (_ BitVec 32))

(declare-fun mapValue!26903 () ValueCell!7995)

(assert (=> mapNonEmpty!26903 (= (arr!23980 _values!688) (store mapRest!26903 mapKey!26903 mapValue!26903))))

(declare-fun b!866577 () Bool)

(declare-fun e!482727 () Bool)

(declare-fun e!482722 () Bool)

(assert (=> b!866577 (= e!482727 e!482722)))

(declare-fun res!588797 () Bool)

(assert (=> b!866577 (=> res!588797 e!482722)))

(declare-datatypes ((array!49900 0))(
  ( (array!49901 (arr!23981 (Array (_ BitVec 32) (_ BitVec 64))) (size!24421 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49900)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866577 (= res!588797 (= k0!854 (select (arr!23981 _keys!868) from!1053)))))

(assert (=> b!866577 (not (= (select (arr!23981 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29703 0))(
  ( (Unit!29704) )
))
(declare-fun lt!393256 () Unit!29703)

(declare-fun e!482724 () Unit!29703)

(assert (=> b!866577 (= lt!393256 e!482724)))

(declare-fun c!92320 () Bool)

(assert (=> b!866577 (= c!92320 (= (select (arr!23981 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11246 0))(
  ( (tuple2!11247 (_1!5634 (_ BitVec 64)) (_2!5634 V!27539)) )
))
(declare-datatypes ((List!17047 0))(
  ( (Nil!17044) (Cons!17043 (h!18174 tuple2!11246) (t!24046 List!17047)) )
))
(declare-datatypes ((ListLongMap!10015 0))(
  ( (ListLongMap!10016 (toList!5023 List!17047)) )
))
(declare-fun lt!393255 () ListLongMap!10015)

(declare-fun lt!393247 () ListLongMap!10015)

(assert (=> b!866577 (= lt!393255 lt!393247)))

(declare-fun lt!393246 () ListLongMap!10015)

(declare-fun lt!393254 () tuple2!11246)

(declare-fun +!2370 (ListLongMap!10015 tuple2!11246) ListLongMap!10015)

(assert (=> b!866577 (= lt!393247 (+!2370 lt!393246 lt!393254))))

(declare-fun lt!393243 () V!27539)

(assert (=> b!866577 (= lt!393254 (tuple2!11247 (select (arr!23981 _keys!868) from!1053) lt!393243))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12678 (ValueCell!7995 V!27539) V!27539)

(declare-fun dynLambda!1190 (Int (_ BitVec 64)) V!27539)

(assert (=> b!866577 (= lt!393243 (get!12678 (select (arr!23980 _values!688) from!1053) (dynLambda!1190 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866578 () Bool)

(assert (=> b!866578 (= e!482722 true)))

(declare-fun lt!393248 () tuple2!11246)

(declare-fun lt!393241 () ListLongMap!10015)

(assert (=> b!866578 (= lt!393247 (+!2370 (+!2370 lt!393241 lt!393254) lt!393248))))

(declare-fun v!557 () V!27539)

(declare-fun lt!393252 () Unit!29703)

(declare-fun addCommutativeForDiffKeys!538 (ListLongMap!10015 (_ BitVec 64) V!27539 (_ BitVec 64) V!27539) Unit!29703)

(assert (=> b!866578 (= lt!393252 (addCommutativeForDiffKeys!538 lt!393241 k0!854 v!557 (select (arr!23981 _keys!868) from!1053) lt!393243))))

(declare-fun b!866579 () Bool)

(declare-fun tp_is_empty!16869 () Bool)

(assert (=> b!866579 (= e!482726 tp_is_empty!16869)))

(declare-fun b!866580 () Bool)

(declare-fun e!482725 () Bool)

(assert (=> b!866580 (= e!482725 (not e!482727))))

(declare-fun res!588800 () Bool)

(assert (=> b!866580 (=> res!588800 e!482727)))

(assert (=> b!866580 (= res!588800 (not (validKeyInArray!0 (select (arr!23981 _keys!868) from!1053))))))

(declare-fun lt!393249 () ListLongMap!10015)

(assert (=> b!866580 (= lt!393249 lt!393246)))

(assert (=> b!866580 (= lt!393246 (+!2370 lt!393241 lt!393248))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!393245 () array!49898)

(declare-fun minValue!654 () V!27539)

(declare-fun zeroValue!654 () V!27539)

(declare-fun getCurrentListMapNoExtraKeys!2993 (array!49900 array!49898 (_ BitVec 32) (_ BitVec 32) V!27539 V!27539 (_ BitVec 32) Int) ListLongMap!10015)

(assert (=> b!866580 (= lt!393249 (getCurrentListMapNoExtraKeys!2993 _keys!868 lt!393245 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866580 (= lt!393248 (tuple2!11247 k0!854 v!557))))

(assert (=> b!866580 (= lt!393241 (getCurrentListMapNoExtraKeys!2993 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!393250 () Unit!29703)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!568 (array!49900 array!49898 (_ BitVec 32) (_ BitVec 32) V!27539 V!27539 (_ BitVec 32) (_ BitVec 64) V!27539 (_ BitVec 32) Int) Unit!29703)

(assert (=> b!866580 (= lt!393250 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!568 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26903 () Bool)

(assert (=> mapIsEmpty!26903 mapRes!26903))

(declare-fun b!866581 () Bool)

(declare-fun res!588795 () Bool)

(assert (=> b!866581 (=> (not res!588795) (not e!482720))))

(declare-datatypes ((List!17048 0))(
  ( (Nil!17045) (Cons!17044 (h!18175 (_ BitVec 64)) (t!24047 List!17048)) )
))
(declare-fun arrayNoDuplicates!0 (array!49900 (_ BitVec 32) List!17048) Bool)

(assert (=> b!866581 (= res!588795 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17045))))

(declare-fun b!866582 () Bool)

(declare-fun res!588796 () Bool)

(assert (=> b!866582 (=> (not res!588796) (not e!482720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866582 (= res!588796 (validMask!0 mask!1196))))

(declare-fun b!866583 () Bool)

(declare-fun Unit!29705 () Unit!29703)

(assert (=> b!866583 (= e!482724 Unit!29705)))

(declare-fun lt!393244 () Unit!29703)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49900 (_ BitVec 32) (_ BitVec 32)) Unit!29703)

(assert (=> b!866583 (= lt!393244 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866583 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17045)))

(declare-fun lt!393253 () Unit!29703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49900 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29703)

(assert (=> b!866583 (= lt!393253 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866583 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393251 () Unit!29703)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49900 (_ BitVec 64) (_ BitVec 32) List!17048) Unit!29703)

(assert (=> b!866583 (= lt!393251 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17045))))

(assert (=> b!866583 false))

(declare-fun b!866584 () Bool)

(assert (=> b!866584 (= e!482721 tp_is_empty!16869)))

(declare-fun b!866585 () Bool)

(declare-fun res!588799 () Bool)

(assert (=> b!866585 (=> (not res!588799) (not e!482720))))

(assert (=> b!866585 (= res!588799 (and (= (select (arr!23981 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866586 () Bool)

(declare-fun Unit!29706 () Unit!29703)

(assert (=> b!866586 (= e!482724 Unit!29706)))

(declare-fun b!866587 () Bool)

(declare-fun res!588801 () Bool)

(assert (=> b!866587 (=> (not res!588801) (not e!482720))))

(assert (=> b!866587 (= res!588801 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24421 _keys!868))))))

(declare-fun res!588793 () Bool)

(assert (=> start!73818 (=> (not res!588793) (not e!482720))))

(assert (=> start!73818 (= res!588793 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24421 _keys!868))))))

(assert (=> start!73818 e!482720))

(assert (=> start!73818 tp_is_empty!16869))

(assert (=> start!73818 true))

(assert (=> start!73818 tp!51702))

(declare-fun array_inv!18950 (array!49900) Bool)

(assert (=> start!73818 (array_inv!18950 _keys!868)))

(declare-fun array_inv!18951 (array!49898) Bool)

(assert (=> start!73818 (and (array_inv!18951 _values!688) e!482723)))

(declare-fun b!866588 () Bool)

(declare-fun res!588803 () Bool)

(assert (=> b!866588 (=> (not res!588803) (not e!482720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49900 (_ BitVec 32)) Bool)

(assert (=> b!866588 (= res!588803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866589 () Bool)

(declare-fun res!588798 () Bool)

(assert (=> b!866589 (=> (not res!588798) (not e!482720))))

(assert (=> b!866589 (= res!588798 (and (= (size!24420 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24421 _keys!868) (size!24420 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866590 () Bool)

(assert (=> b!866590 (= e!482720 e!482725)))

(declare-fun res!588794 () Bool)

(assert (=> b!866590 (=> (not res!588794) (not e!482725))))

(assert (=> b!866590 (= res!588794 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866590 (= lt!393255 (getCurrentListMapNoExtraKeys!2993 _keys!868 lt!393245 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866590 (= lt!393245 (array!49899 (store (arr!23980 _values!688) i!612 (ValueCellFull!7995 v!557)) (size!24420 _values!688)))))

(declare-fun lt!393242 () ListLongMap!10015)

(assert (=> b!866590 (= lt!393242 (getCurrentListMapNoExtraKeys!2993 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73818 res!588793) b!866582))

(assert (= (and b!866582 res!588796) b!866589))

(assert (= (and b!866589 res!588798) b!866588))

(assert (= (and b!866588 res!588803) b!866581))

(assert (= (and b!866581 res!588795) b!866587))

(assert (= (and b!866587 res!588801) b!866575))

(assert (= (and b!866575 res!588802) b!866585))

(assert (= (and b!866585 res!588799) b!866590))

(assert (= (and b!866590 res!588794) b!866580))

(assert (= (and b!866580 (not res!588800)) b!866577))

(assert (= (and b!866577 c!92320) b!866583))

(assert (= (and b!866577 (not c!92320)) b!866586))

(assert (= (and b!866577 (not res!588797)) b!866578))

(assert (= (and b!866576 condMapEmpty!26903) mapIsEmpty!26903))

(assert (= (and b!866576 (not condMapEmpty!26903)) mapNonEmpty!26903))

(get-info :version)

(assert (= (and mapNonEmpty!26903 ((_ is ValueCellFull!7995) mapValue!26903)) b!866579))

(assert (= (and b!866576 ((_ is ValueCellFull!7995) mapDefault!26903)) b!866584))

(assert (= start!73818 b!866576))

(declare-fun b_lambda!12085 () Bool)

(assert (=> (not b_lambda!12085) (not b!866577)))

(declare-fun t!24045 () Bool)

(declare-fun tb!4855 () Bool)

(assert (=> (and start!73818 (= defaultEntry!696 defaultEntry!696) t!24045) tb!4855))

(declare-fun result!9321 () Bool)

(assert (=> tb!4855 (= result!9321 tp_is_empty!16869)))

(assert (=> b!866577 t!24045))

(declare-fun b_and!24447 () Bool)

(assert (= b_and!24445 (and (=> t!24045 result!9321) b_and!24447)))

(declare-fun m!808257 () Bool)

(assert (=> b!866575 m!808257))

(declare-fun m!808259 () Bool)

(assert (=> b!866583 m!808259))

(declare-fun m!808261 () Bool)

(assert (=> b!866583 m!808261))

(declare-fun m!808263 () Bool)

(assert (=> b!866583 m!808263))

(declare-fun m!808265 () Bool)

(assert (=> b!866583 m!808265))

(declare-fun m!808267 () Bool)

(assert (=> b!866583 m!808267))

(declare-fun m!808269 () Bool)

(assert (=> mapNonEmpty!26903 m!808269))

(declare-fun m!808271 () Bool)

(assert (=> b!866585 m!808271))

(declare-fun m!808273 () Bool)

(assert (=> start!73818 m!808273))

(declare-fun m!808275 () Bool)

(assert (=> start!73818 m!808275))

(declare-fun m!808277 () Bool)

(assert (=> b!866590 m!808277))

(declare-fun m!808279 () Bool)

(assert (=> b!866590 m!808279))

(declare-fun m!808281 () Bool)

(assert (=> b!866590 m!808281))

(declare-fun m!808283 () Bool)

(assert (=> b!866580 m!808283))

(declare-fun m!808285 () Bool)

(assert (=> b!866580 m!808285))

(declare-fun m!808287 () Bool)

(assert (=> b!866580 m!808287))

(declare-fun m!808289 () Bool)

(assert (=> b!866580 m!808289))

(assert (=> b!866580 m!808287))

(declare-fun m!808291 () Bool)

(assert (=> b!866580 m!808291))

(declare-fun m!808293 () Bool)

(assert (=> b!866580 m!808293))

(declare-fun m!808295 () Bool)

(assert (=> b!866588 m!808295))

(declare-fun m!808297 () Bool)

(assert (=> b!866582 m!808297))

(declare-fun m!808299 () Bool)

(assert (=> b!866581 m!808299))

(declare-fun m!808301 () Bool)

(assert (=> b!866578 m!808301))

(assert (=> b!866578 m!808301))

(declare-fun m!808303 () Bool)

(assert (=> b!866578 m!808303))

(assert (=> b!866578 m!808287))

(assert (=> b!866578 m!808287))

(declare-fun m!808305 () Bool)

(assert (=> b!866578 m!808305))

(declare-fun m!808307 () Bool)

(assert (=> b!866577 m!808307))

(declare-fun m!808309 () Bool)

(assert (=> b!866577 m!808309))

(declare-fun m!808311 () Bool)

(assert (=> b!866577 m!808311))

(declare-fun m!808313 () Bool)

(assert (=> b!866577 m!808313))

(assert (=> b!866577 m!808309))

(assert (=> b!866577 m!808287))

(assert (=> b!866577 m!808311))

(check-sat (not b_next!14733) (not start!73818) (not mapNonEmpty!26903) (not b!866575) (not b!866582) (not b!866578) (not b!866590) (not b!866577) b_and!24447 (not b_lambda!12085) (not b!866588) (not b!866580) tp_is_empty!16869 (not b!866583) (not b!866581))
(check-sat b_and!24447 (not b_next!14733))
