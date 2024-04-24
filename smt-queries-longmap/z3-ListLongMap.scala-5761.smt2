; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74582 () Bool)

(assert start!74582)

(declare-fun b_free!15157 () Bool)

(declare-fun b_next!15157 () Bool)

(assert (=> start!74582 (= b_free!15157 (not b_next!15157))))

(declare-fun tp!53150 () Bool)

(declare-fun b_and!24977 () Bool)

(assert (=> start!74582 (= tp!53150 b_and!24977)))

(declare-fun b!877103 () Bool)

(declare-fun e!488355 () Bool)

(declare-fun e!488350 () Bool)

(assert (=> b!877103 (= e!488355 (not e!488350))))

(declare-fun res!595745 () Bool)

(assert (=> b!877103 (=> res!595745 e!488350)))

(declare-datatypes ((array!50973 0))(
  ( (array!50974 (arr!24509 (Array (_ BitVec 32) (_ BitVec 64))) (size!24950 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50973)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877103 (= res!595745 (not (validKeyInArray!0 (select (arr!24509 _keys!868) from!1053))))))

(declare-fun e!488353 () Bool)

(assert (=> b!877103 e!488353))

(declare-fun c!92867 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!877103 (= c!92867 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28249 0))(
  ( (V!28250 (val!8748 Int)) )
))
(declare-fun v!557 () V!28249)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28249)

(declare-fun zeroValue!654 () V!28249)

(declare-datatypes ((Unit!29940 0))(
  ( (Unit!29941) )
))
(declare-fun lt!396783 () Unit!29940)

(declare-datatypes ((ValueCell!8261 0))(
  ( (ValueCellFull!8261 (v!11181 V!28249)) (EmptyCell!8261) )
))
(declare-datatypes ((array!50975 0))(
  ( (array!50976 (arr!24510 (Array (_ BitVec 32) ValueCell!8261)) (size!24951 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50975)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!664 (array!50973 array!50975 (_ BitVec 32) (_ BitVec 32) V!28249 V!28249 (_ BitVec 32) (_ BitVec 64) V!28249 (_ BitVec 32) Int) Unit!29940)

(assert (=> b!877103 (= lt!396783 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!664 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38756 () Bool)

(declare-datatypes ((tuple2!11496 0))(
  ( (tuple2!11497 (_1!5759 (_ BitVec 64)) (_2!5759 V!28249)) )
))
(declare-datatypes ((List!17335 0))(
  ( (Nil!17332) (Cons!17331 (h!18468 tuple2!11496) (t!24388 List!17335)) )
))
(declare-datatypes ((ListLongMap!10267 0))(
  ( (ListLongMap!10268 (toList!5149 List!17335)) )
))
(declare-fun call!38759 () ListLongMap!10267)

(declare-fun lt!396781 () array!50975)

(declare-fun getCurrentListMapNoExtraKeys!3191 (array!50973 array!50975 (_ BitVec 32) (_ BitVec 32) V!28249 V!28249 (_ BitVec 32) Int) ListLongMap!10267)

(assert (=> bm!38756 (= call!38759 (getCurrentListMapNoExtraKeys!3191 _keys!868 lt!396781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877104 () Bool)

(declare-fun e!488354 () Bool)

(assert (=> b!877104 (= e!488354 e!488355)))

(declare-fun res!595748 () Bool)

(assert (=> b!877104 (=> (not res!595748) (not e!488355))))

(assert (=> b!877104 (= res!595748 (= from!1053 i!612))))

(declare-fun lt!396782 () ListLongMap!10267)

(assert (=> b!877104 (= lt!396782 (getCurrentListMapNoExtraKeys!3191 _keys!868 lt!396781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!877104 (= lt!396781 (array!50976 (store (arr!24510 _values!688) i!612 (ValueCellFull!8261 v!557)) (size!24951 _values!688)))))

(declare-fun lt!396784 () ListLongMap!10267)

(assert (=> b!877104 (= lt!396784 (getCurrentListMapNoExtraKeys!3191 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877105 () Bool)

(declare-fun res!595753 () Bool)

(assert (=> b!877105 (=> (not res!595753) (not e!488354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877105 (= res!595753 (validMask!0 mask!1196))))

(declare-fun b!877106 () Bool)

(declare-fun res!595746 () Bool)

(assert (=> b!877106 (=> (not res!595746) (not e!488354))))

(assert (=> b!877106 (= res!595746 (validKeyInArray!0 k0!854))))

(declare-fun b!877107 () Bool)

(declare-fun res!595749 () Bool)

(assert (=> b!877107 (=> (not res!595749) (not e!488354))))

(assert (=> b!877107 (= res!595749 (and (= (size!24951 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24950 _keys!868) (size!24951 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877108 () Bool)

(declare-fun res!595751 () Bool)

(assert (=> b!877108 (=> (not res!595751) (not e!488354))))

(declare-datatypes ((List!17336 0))(
  ( (Nil!17333) (Cons!17332 (h!18469 (_ BitVec 64)) (t!24389 List!17336)) )
))
(declare-fun arrayNoDuplicates!0 (array!50973 (_ BitVec 32) List!17336) Bool)

(assert (=> b!877108 (= res!595751 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17333))))

(declare-fun res!595744 () Bool)

(assert (=> start!74582 (=> (not res!595744) (not e!488354))))

(assert (=> start!74582 (= res!595744 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24950 _keys!868))))))

(assert (=> start!74582 e!488354))

(declare-fun tp_is_empty!17401 () Bool)

(assert (=> start!74582 tp_is_empty!17401))

(assert (=> start!74582 true))

(assert (=> start!74582 tp!53150))

(declare-fun array_inv!19372 (array!50973) Bool)

(assert (=> start!74582 (array_inv!19372 _keys!868)))

(declare-fun e!488352 () Bool)

(declare-fun array_inv!19373 (array!50975) Bool)

(assert (=> start!74582 (and (array_inv!19373 _values!688) e!488352)))

(declare-fun b!877109 () Bool)

(declare-fun call!38760 () ListLongMap!10267)

(assert (=> b!877109 (= e!488353 (= call!38759 call!38760))))

(declare-fun mapIsEmpty!27713 () Bool)

(declare-fun mapRes!27713 () Bool)

(assert (=> mapIsEmpty!27713 mapRes!27713))

(declare-fun b!877110 () Bool)

(declare-fun res!595750 () Bool)

(assert (=> b!877110 (=> (not res!595750) (not e!488354))))

(assert (=> b!877110 (= res!595750 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24950 _keys!868))))))

(declare-fun b!877111 () Bool)

(declare-fun res!595747 () Bool)

(assert (=> b!877111 (=> (not res!595747) (not e!488354))))

(assert (=> b!877111 (= res!595747 (and (= (select (arr!24509 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27713 () Bool)

(declare-fun tp!53149 () Bool)

(declare-fun e!488349 () Bool)

(assert (=> mapNonEmpty!27713 (= mapRes!27713 (and tp!53149 e!488349))))

(declare-fun mapValue!27713 () ValueCell!8261)

(declare-fun mapKey!27713 () (_ BitVec 32))

(declare-fun mapRest!27713 () (Array (_ BitVec 32) ValueCell!8261))

(assert (=> mapNonEmpty!27713 (= (arr!24510 _values!688) (store mapRest!27713 mapKey!27713 mapValue!27713))))

(declare-fun b!877112 () Bool)

(declare-fun res!595752 () Bool)

(assert (=> b!877112 (=> (not res!595752) (not e!488354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50973 (_ BitVec 32)) Bool)

(assert (=> b!877112 (= res!595752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877113 () Bool)

(declare-fun +!2496 (ListLongMap!10267 tuple2!11496) ListLongMap!10267)

(assert (=> b!877113 (= e!488353 (= call!38759 (+!2496 call!38760 (tuple2!11497 k0!854 v!557))))))

(declare-fun b!877114 () Bool)

(declare-fun e!488351 () Bool)

(assert (=> b!877114 (= e!488352 (and e!488351 mapRes!27713))))

(declare-fun condMapEmpty!27713 () Bool)

(declare-fun mapDefault!27713 () ValueCell!8261)

(assert (=> b!877114 (= condMapEmpty!27713 (= (arr!24510 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8261)) mapDefault!27713)))))

(declare-fun b!877115 () Bool)

(assert (=> b!877115 (= e!488351 tp_is_empty!17401)))

(declare-fun bm!38757 () Bool)

(assert (=> bm!38757 (= call!38760 (getCurrentListMapNoExtraKeys!3191 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877116 () Bool)

(assert (=> b!877116 (= e!488349 tp_is_empty!17401)))

(declare-fun b!877117 () Bool)

(assert (=> b!877117 (= e!488350 (bvslt from!1053 (size!24951 _values!688)))))

(declare-fun get!12906 (ValueCell!8261 V!28249) V!28249)

(declare-fun dynLambda!1232 (Int (_ BitVec 64)) V!28249)

(assert (=> b!877117 (= lt!396782 (+!2496 (getCurrentListMapNoExtraKeys!3191 _keys!868 lt!396781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11497 (select (arr!24509 _keys!868) from!1053) (get!12906 (select (arr!24510 lt!396781) from!1053) (dynLambda!1232 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74582 res!595744) b!877105))

(assert (= (and b!877105 res!595753) b!877107))

(assert (= (and b!877107 res!595749) b!877112))

(assert (= (and b!877112 res!595752) b!877108))

(assert (= (and b!877108 res!595751) b!877110))

(assert (= (and b!877110 res!595750) b!877106))

(assert (= (and b!877106 res!595746) b!877111))

(assert (= (and b!877111 res!595747) b!877104))

(assert (= (and b!877104 res!595748) b!877103))

(assert (= (and b!877103 c!92867) b!877113))

(assert (= (and b!877103 (not c!92867)) b!877109))

(assert (= (or b!877113 b!877109) bm!38756))

(assert (= (or b!877113 b!877109) bm!38757))

(assert (= (and b!877103 (not res!595745)) b!877117))

(assert (= (and b!877114 condMapEmpty!27713) mapIsEmpty!27713))

(assert (= (and b!877114 (not condMapEmpty!27713)) mapNonEmpty!27713))

(get-info :version)

(assert (= (and mapNonEmpty!27713 ((_ is ValueCellFull!8261) mapValue!27713)) b!877116))

(assert (= (and b!877114 ((_ is ValueCellFull!8261) mapDefault!27713)) b!877115))

(assert (= start!74582 b!877114))

(declare-fun b_lambda!12239 () Bool)

(assert (=> (not b_lambda!12239) (not b!877117)))

(declare-fun t!24387 () Bool)

(declare-fun tb!4909 () Bool)

(assert (=> (and start!74582 (= defaultEntry!696 defaultEntry!696) t!24387) tb!4909))

(declare-fun result!9445 () Bool)

(assert (=> tb!4909 (= result!9445 tp_is_empty!17401)))

(assert (=> b!877117 t!24387))

(declare-fun b_and!24979 () Bool)

(assert (= b_and!24977 (and (=> t!24387 result!9445) b_and!24979)))

(declare-fun m!817277 () Bool)

(assert (=> b!877111 m!817277))

(declare-fun m!817279 () Bool)

(assert (=> b!877105 m!817279))

(declare-fun m!817281 () Bool)

(assert (=> b!877113 m!817281))

(declare-fun m!817283 () Bool)

(assert (=> b!877103 m!817283))

(assert (=> b!877103 m!817283))

(declare-fun m!817285 () Bool)

(assert (=> b!877103 m!817285))

(declare-fun m!817287 () Bool)

(assert (=> b!877103 m!817287))

(declare-fun m!817289 () Bool)

(assert (=> b!877112 m!817289))

(declare-fun m!817291 () Bool)

(assert (=> b!877104 m!817291))

(declare-fun m!817293 () Bool)

(assert (=> b!877104 m!817293))

(declare-fun m!817295 () Bool)

(assert (=> b!877104 m!817295))

(declare-fun m!817297 () Bool)

(assert (=> bm!38757 m!817297))

(declare-fun m!817299 () Bool)

(assert (=> bm!38756 m!817299))

(assert (=> b!877117 m!817299))

(declare-fun m!817301 () Bool)

(assert (=> b!877117 m!817301))

(declare-fun m!817303 () Bool)

(assert (=> b!877117 m!817303))

(declare-fun m!817305 () Bool)

(assert (=> b!877117 m!817305))

(declare-fun m!817307 () Bool)

(assert (=> b!877117 m!817307))

(assert (=> b!877117 m!817299))

(assert (=> b!877117 m!817303))

(assert (=> b!877117 m!817283))

(assert (=> b!877117 m!817305))

(declare-fun m!817309 () Bool)

(assert (=> start!74582 m!817309))

(declare-fun m!817311 () Bool)

(assert (=> start!74582 m!817311))

(declare-fun m!817313 () Bool)

(assert (=> b!877108 m!817313))

(declare-fun m!817315 () Bool)

(assert (=> b!877106 m!817315))

(declare-fun m!817317 () Bool)

(assert (=> mapNonEmpty!27713 m!817317))

(check-sat (not b!877104) (not b!877113) (not b!877106) (not b!877103) (not b_lambda!12239) (not b!877108) (not b!877105) (not b!877117) (not b_next!15157) tp_is_empty!17401 (not mapNonEmpty!27713) (not b!877112) b_and!24979 (not bm!38757) (not start!74582) (not bm!38756))
(check-sat b_and!24979 (not b_next!15157))
