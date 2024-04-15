; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73474 () Bool)

(assert start!73474)

(declare-fun b_free!14407 () Bool)

(declare-fun b_next!14407 () Bool)

(assert (=> start!73474 (= b_free!14407 (not b_next!14407))))

(declare-fun tp!50726 () Bool)

(declare-fun b_and!23767 () Bool)

(assert (=> start!73474 (= tp!50726 b_and!23767)))

(declare-fun b!858299 () Bool)

(declare-fun e!478313 () Bool)

(declare-fun tp_is_empty!16543 () Bool)

(assert (=> b!858299 (= e!478313 tp_is_empty!16543)))

(declare-fun b!858300 () Bool)

(declare-fun res!583151 () Bool)

(declare-fun e!478314 () Bool)

(assert (=> b!858300 (=> (not res!583151) (not e!478314))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49253 0))(
  ( (array!49254 (arr!23658 (Array (_ BitVec 32) (_ BitVec 64))) (size!24100 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49253)

(declare-datatypes ((V!27105 0))(
  ( (V!27106 (val!8319 Int)) )
))
(declare-datatypes ((ValueCell!7832 0))(
  ( (ValueCellFull!7832 (v!10738 V!27105)) (EmptyCell!7832) )
))
(declare-datatypes ((array!49255 0))(
  ( (array!49256 (arr!23659 (Array (_ BitVec 32) ValueCell!7832)) (size!24101 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49255)

(assert (=> b!858300 (= res!583151 (and (= (size!24101 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24100 _keys!868) (size!24101 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858301 () Bool)

(declare-fun res!583155 () Bool)

(assert (=> b!858301 (=> (not res!583155) (not e!478314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858301 (= res!583155 (validMask!0 mask!1196))))

(declare-fun b!858302 () Bool)

(declare-fun e!478317 () Bool)

(assert (=> b!858302 (= e!478317 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16788 0))(
  ( (Nil!16785) (Cons!16784 (h!17915 (_ BitVec 64)) (t!23452 List!16788)) )
))
(declare-fun arrayNoDuplicates!0 (array!49253 (_ BitVec 32) List!16788) Bool)

(assert (=> b!858302 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16785)))

(declare-datatypes ((Unit!29193 0))(
  ( (Unit!29194) )
))
(declare-fun lt!386536 () Unit!29193)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49253 (_ BitVec 32) (_ BitVec 32)) Unit!29193)

(assert (=> b!858302 (= lt!386536 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858303 () Bool)

(declare-fun e!478320 () Bool)

(assert (=> b!858303 (= e!478320 e!478317)))

(declare-fun res!583156 () Bool)

(assert (=> b!858303 (=> res!583156 e!478317)))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!858303 (= res!583156 (not (= (select (arr!23658 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10988 0))(
  ( (tuple2!10989 (_1!5505 (_ BitVec 64)) (_2!5505 V!27105)) )
))
(declare-datatypes ((List!16789 0))(
  ( (Nil!16786) (Cons!16785 (h!17916 tuple2!10988) (t!23453 List!16789)) )
))
(declare-datatypes ((ListLongMap!9747 0))(
  ( (ListLongMap!9748 (toList!4889 List!16789)) )
))
(declare-fun lt!386538 () ListLongMap!9747)

(declare-fun lt!386535 () ListLongMap!9747)

(declare-fun +!2263 (ListLongMap!9747 tuple2!10988) ListLongMap!9747)

(declare-fun get!12465 (ValueCell!7832 V!27105) V!27105)

(declare-fun dynLambda!1082 (Int (_ BitVec 64)) V!27105)

(assert (=> b!858303 (= lt!386538 (+!2263 lt!386535 (tuple2!10989 (select (arr!23658 _keys!868) from!1053) (get!12465 (select (arr!23659 _values!688) from!1053) (dynLambda!1082 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858304 () Bool)

(declare-fun res!583160 () Bool)

(assert (=> b!858304 (=> (not res!583160) (not e!478314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858304 (= res!583160 (validKeyInArray!0 k0!854))))

(declare-fun b!858305 () Bool)

(declare-fun e!478318 () Bool)

(assert (=> b!858305 (= e!478318 tp_is_empty!16543)))

(declare-fun res!583152 () Bool)

(assert (=> start!73474 (=> (not res!583152) (not e!478314))))

(assert (=> start!73474 (= res!583152 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24100 _keys!868))))))

(assert (=> start!73474 e!478314))

(assert (=> start!73474 tp_is_empty!16543))

(assert (=> start!73474 true))

(assert (=> start!73474 tp!50726))

(declare-fun array_inv!18794 (array!49253) Bool)

(assert (=> start!73474 (array_inv!18794 _keys!868)))

(declare-fun e!478315 () Bool)

(declare-fun array_inv!18795 (array!49255) Bool)

(assert (=> start!73474 (and (array_inv!18795 _values!688) e!478315)))

(declare-fun b!858306 () Bool)

(declare-fun res!583153 () Bool)

(assert (=> b!858306 (=> (not res!583153) (not e!478314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49253 (_ BitVec 32)) Bool)

(assert (=> b!858306 (= res!583153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858307 () Bool)

(declare-fun e!478316 () Bool)

(assert (=> b!858307 (= e!478314 e!478316)))

(declare-fun res!583158 () Bool)

(assert (=> b!858307 (=> (not res!583158) (not e!478316))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858307 (= res!583158 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386534 () array!49255)

(declare-fun minValue!654 () V!27105)

(declare-fun zeroValue!654 () V!27105)

(declare-fun getCurrentListMapNoExtraKeys!2895 (array!49253 array!49255 (_ BitVec 32) (_ BitVec 32) V!27105 V!27105 (_ BitVec 32) Int) ListLongMap!9747)

(assert (=> b!858307 (= lt!386538 (getCurrentListMapNoExtraKeys!2895 _keys!868 lt!386534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27105)

(assert (=> b!858307 (= lt!386534 (array!49256 (store (arr!23659 _values!688) i!612 (ValueCellFull!7832 v!557)) (size!24101 _values!688)))))

(declare-fun lt!386539 () ListLongMap!9747)

(assert (=> b!858307 (= lt!386539 (getCurrentListMapNoExtraKeys!2895 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858308 () Bool)

(declare-fun res!583157 () Bool)

(assert (=> b!858308 (=> (not res!583157) (not e!478314))))

(assert (=> b!858308 (= res!583157 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24100 _keys!868))))))

(declare-fun b!858309 () Bool)

(declare-fun mapRes!26414 () Bool)

(assert (=> b!858309 (= e!478315 (and e!478318 mapRes!26414))))

(declare-fun condMapEmpty!26414 () Bool)

(declare-fun mapDefault!26414 () ValueCell!7832)

(assert (=> b!858309 (= condMapEmpty!26414 (= (arr!23659 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7832)) mapDefault!26414)))))

(declare-fun b!858310 () Bool)

(declare-fun res!583159 () Bool)

(assert (=> b!858310 (=> (not res!583159) (not e!478314))))

(assert (=> b!858310 (= res!583159 (and (= (select (arr!23658 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26414 () Bool)

(declare-fun tp!50725 () Bool)

(assert (=> mapNonEmpty!26414 (= mapRes!26414 (and tp!50725 e!478313))))

(declare-fun mapRest!26414 () (Array (_ BitVec 32) ValueCell!7832))

(declare-fun mapValue!26414 () ValueCell!7832)

(declare-fun mapKey!26414 () (_ BitVec 32))

(assert (=> mapNonEmpty!26414 (= (arr!23659 _values!688) (store mapRest!26414 mapKey!26414 mapValue!26414))))

(declare-fun b!858311 () Bool)

(declare-fun res!583161 () Bool)

(assert (=> b!858311 (=> (not res!583161) (not e!478314))))

(assert (=> b!858311 (= res!583161 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16785))))

(declare-fun mapIsEmpty!26414 () Bool)

(assert (=> mapIsEmpty!26414 mapRes!26414))

(declare-fun b!858312 () Bool)

(assert (=> b!858312 (= e!478316 (not e!478320))))

(declare-fun res!583154 () Bool)

(assert (=> b!858312 (=> res!583154 e!478320)))

(assert (=> b!858312 (= res!583154 (not (validKeyInArray!0 (select (arr!23658 _keys!868) from!1053))))))

(declare-fun lt!386533 () ListLongMap!9747)

(assert (=> b!858312 (= lt!386533 lt!386535)))

(declare-fun lt!386537 () ListLongMap!9747)

(assert (=> b!858312 (= lt!386535 (+!2263 lt!386537 (tuple2!10989 k0!854 v!557)))))

(assert (=> b!858312 (= lt!386533 (getCurrentListMapNoExtraKeys!2895 _keys!868 lt!386534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858312 (= lt!386537 (getCurrentListMapNoExtraKeys!2895 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386540 () Unit!29193)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!459 (array!49253 array!49255 (_ BitVec 32) (_ BitVec 32) V!27105 V!27105 (_ BitVec 32) (_ BitVec 64) V!27105 (_ BitVec 32) Int) Unit!29193)

(assert (=> b!858312 (= lt!386540 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!459 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73474 res!583152) b!858301))

(assert (= (and b!858301 res!583155) b!858300))

(assert (= (and b!858300 res!583151) b!858306))

(assert (= (and b!858306 res!583153) b!858311))

(assert (= (and b!858311 res!583161) b!858308))

(assert (= (and b!858308 res!583157) b!858304))

(assert (= (and b!858304 res!583160) b!858310))

(assert (= (and b!858310 res!583159) b!858307))

(assert (= (and b!858307 res!583158) b!858312))

(assert (= (and b!858312 (not res!583154)) b!858303))

(assert (= (and b!858303 (not res!583156)) b!858302))

(assert (= (and b!858309 condMapEmpty!26414) mapIsEmpty!26414))

(assert (= (and b!858309 (not condMapEmpty!26414)) mapNonEmpty!26414))

(get-info :version)

(assert (= (and mapNonEmpty!26414 ((_ is ValueCellFull!7832) mapValue!26414)) b!858299))

(assert (= (and b!858309 ((_ is ValueCellFull!7832) mapDefault!26414)) b!858305))

(assert (= start!73474 b!858309))

(declare-fun b_lambda!11741 () Bool)

(assert (=> (not b_lambda!11741) (not b!858303)))

(declare-fun t!23451 () Bool)

(declare-fun tb!4521 () Bool)

(assert (=> (and start!73474 (= defaultEntry!696 defaultEntry!696) t!23451) tb!4521))

(declare-fun result!8661 () Bool)

(assert (=> tb!4521 (= result!8661 tp_is_empty!16543)))

(assert (=> b!858303 t!23451))

(declare-fun b_and!23769 () Bool)

(assert (= b_and!23767 (and (=> t!23451 result!8661) b_and!23769)))

(declare-fun m!798495 () Bool)

(assert (=> b!858302 m!798495))

(declare-fun m!798497 () Bool)

(assert (=> b!858302 m!798497))

(declare-fun m!798499 () Bool)

(assert (=> mapNonEmpty!26414 m!798499))

(declare-fun m!798501 () Bool)

(assert (=> b!858306 m!798501))

(declare-fun m!798503 () Bool)

(assert (=> b!858301 m!798503))

(declare-fun m!798505 () Bool)

(assert (=> b!858307 m!798505))

(declare-fun m!798507 () Bool)

(assert (=> b!858307 m!798507))

(declare-fun m!798509 () Bool)

(assert (=> b!858307 m!798509))

(declare-fun m!798511 () Bool)

(assert (=> b!858312 m!798511))

(declare-fun m!798513 () Bool)

(assert (=> b!858312 m!798513))

(declare-fun m!798515 () Bool)

(assert (=> b!858312 m!798515))

(declare-fun m!798517 () Bool)

(assert (=> b!858312 m!798517))

(declare-fun m!798519 () Bool)

(assert (=> b!858312 m!798519))

(assert (=> b!858312 m!798517))

(declare-fun m!798521 () Bool)

(assert (=> b!858312 m!798521))

(declare-fun m!798523 () Bool)

(assert (=> start!73474 m!798523))

(declare-fun m!798525 () Bool)

(assert (=> start!73474 m!798525))

(declare-fun m!798527 () Bool)

(assert (=> b!858311 m!798527))

(declare-fun m!798529 () Bool)

(assert (=> b!858310 m!798529))

(declare-fun m!798531 () Bool)

(assert (=> b!858304 m!798531))

(declare-fun m!798533 () Bool)

(assert (=> b!858303 m!798533))

(declare-fun m!798535 () Bool)

(assert (=> b!858303 m!798535))

(declare-fun m!798537 () Bool)

(assert (=> b!858303 m!798537))

(declare-fun m!798539 () Bool)

(assert (=> b!858303 m!798539))

(assert (=> b!858303 m!798535))

(assert (=> b!858303 m!798517))

(assert (=> b!858303 m!798537))

(check-sat (not b!858311) (not mapNonEmpty!26414) b_and!23769 (not b_next!14407) (not b!858301) (not start!73474) tp_is_empty!16543 (not b!858303) (not b!858306) (not b!858302) (not b_lambda!11741) (not b!858307) (not b!858304) (not b!858312))
(check-sat b_and!23769 (not b_next!14407))
