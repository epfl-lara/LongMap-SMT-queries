; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73680 () Bool)

(assert start!73680)

(declare-fun b_free!14595 () Bool)

(declare-fun b_next!14595 () Bool)

(assert (=> start!73680 (= b_free!14595 (not b_next!14595))))

(declare-fun tp!51288 () Bool)

(declare-fun b_and!24169 () Bool)

(assert (=> start!73680 (= tp!51288 b_and!24169)))

(declare-fun b!863125 () Bool)

(declare-fun res!586516 () Bool)

(declare-fun e!480858 () Bool)

(assert (=> b!863125 (=> (not res!586516) (not e!480858))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49624 0))(
  ( (array!49625 (arr!23843 (Array (_ BitVec 32) (_ BitVec 64))) (size!24283 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49624)

(assert (=> b!863125 (= res!586516 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24283 _keys!868))))))

(declare-fun b!863126 () Bool)

(declare-fun res!586520 () Bool)

(assert (=> b!863126 (=> (not res!586520) (not e!480858))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863126 (= res!586520 (validMask!0 mask!1196))))

(declare-fun b!863127 () Bool)

(declare-datatypes ((Unit!29491 0))(
  ( (Unit!29492) )
))
(declare-fun e!480859 () Unit!29491)

(declare-fun Unit!29493 () Unit!29491)

(assert (=> b!863127 (= e!480859 Unit!29493)))

(declare-fun b!863128 () Bool)

(declare-fun Unit!29494 () Unit!29491)

(assert (=> b!863128 (= e!480859 Unit!29494)))

(declare-fun lt!389938 () Unit!29491)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49624 (_ BitVec 32) (_ BitVec 32)) Unit!29491)

(assert (=> b!863128 (= lt!389938 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16939 0))(
  ( (Nil!16936) (Cons!16935 (h!18066 (_ BitVec 64)) (t!23800 List!16939)) )
))
(declare-fun arrayNoDuplicates!0 (array!49624 (_ BitVec 32) List!16939) Bool)

(assert (=> b!863128 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16936)))

(declare-fun lt!389932 () Unit!29491)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49624 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29491)

(assert (=> b!863128 (= lt!389932 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863128 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389937 () Unit!29491)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49624 (_ BitVec 64) (_ BitVec 32) List!16939) Unit!29491)

(assert (=> b!863128 (= lt!389937 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16936))))

(assert (=> b!863128 false))

(declare-fun b!863129 () Bool)

(declare-fun res!586518 () Bool)

(assert (=> b!863129 (=> (not res!586518) (not e!480858))))

(assert (=> b!863129 (= res!586518 (and (= (select (arr!23843 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863130 () Bool)

(declare-fun e!480861 () Bool)

(declare-fun e!480865 () Bool)

(assert (=> b!863130 (= e!480861 (not e!480865))))

(declare-fun res!586525 () Bool)

(assert (=> b!863130 (=> res!586525 e!480865)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863130 (= res!586525 (not (validKeyInArray!0 (select (arr!23843 _keys!868) from!1053))))))

(declare-datatypes ((V!27355 0))(
  ( (V!27356 (val!8413 Int)) )
))
(declare-datatypes ((tuple2!11130 0))(
  ( (tuple2!11131 (_1!5576 (_ BitVec 64)) (_2!5576 V!27355)) )
))
(declare-datatypes ((List!16940 0))(
  ( (Nil!16937) (Cons!16936 (h!18067 tuple2!11130) (t!23801 List!16940)) )
))
(declare-datatypes ((ListLongMap!9899 0))(
  ( (ListLongMap!9900 (toList!4965 List!16940)) )
))
(declare-fun lt!389930 () ListLongMap!9899)

(declare-fun lt!389929 () ListLongMap!9899)

(assert (=> b!863130 (= lt!389930 lt!389929)))

(declare-fun lt!389939 () ListLongMap!9899)

(declare-fun lt!389941 () tuple2!11130)

(declare-fun +!2314 (ListLongMap!9899 tuple2!11130) ListLongMap!9899)

(assert (=> b!863130 (= lt!389929 (+!2314 lt!389939 lt!389941))))

(declare-datatypes ((ValueCell!7926 0))(
  ( (ValueCellFull!7926 (v!10838 V!27355)) (EmptyCell!7926) )
))
(declare-datatypes ((array!49626 0))(
  ( (array!49627 (arr!23844 (Array (_ BitVec 32) ValueCell!7926)) (size!24284 (_ BitVec 32))) )
))
(declare-fun lt!389944 () array!49626)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27355)

(declare-fun zeroValue!654 () V!27355)

(declare-fun getCurrentListMapNoExtraKeys!2940 (array!49624 array!49626 (_ BitVec 32) (_ BitVec 32) V!27355 V!27355 (_ BitVec 32) Int) ListLongMap!9899)

(assert (=> b!863130 (= lt!389930 (getCurrentListMapNoExtraKeys!2940 _keys!868 lt!389944 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27355)

(assert (=> b!863130 (= lt!389941 (tuple2!11131 k0!854 v!557))))

(declare-fun _values!688 () array!49626)

(assert (=> b!863130 (= lt!389939 (getCurrentListMapNoExtraKeys!2940 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389942 () Unit!29491)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!522 (array!49624 array!49626 (_ BitVec 32) (_ BitVec 32) V!27355 V!27355 (_ BitVec 32) (_ BitVec 64) V!27355 (_ BitVec 32) Int) Unit!29491)

(assert (=> b!863130 (= lt!389942 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!522 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863131 () Bool)

(declare-fun res!586526 () Bool)

(assert (=> b!863131 (=> (not res!586526) (not e!480858))))

(assert (=> b!863131 (= res!586526 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16936))))

(declare-fun b!863132 () Bool)

(declare-fun e!480864 () Bool)

(assert (=> b!863132 (= e!480865 e!480864)))

(declare-fun res!586517 () Bool)

(assert (=> b!863132 (=> res!586517 e!480864)))

(assert (=> b!863132 (= res!586517 (= k0!854 (select (arr!23843 _keys!868) from!1053)))))

(assert (=> b!863132 (not (= (select (arr!23843 _keys!868) from!1053) k0!854))))

(declare-fun lt!389931 () Unit!29491)

(assert (=> b!863132 (= lt!389931 e!480859)))

(declare-fun c!92113 () Bool)

(assert (=> b!863132 (= c!92113 (= (select (arr!23843 _keys!868) from!1053) k0!854))))

(declare-fun lt!389936 () ListLongMap!9899)

(declare-fun lt!389933 () ListLongMap!9899)

(assert (=> b!863132 (= lt!389936 lt!389933)))

(declare-fun lt!389940 () tuple2!11130)

(assert (=> b!863132 (= lt!389933 (+!2314 lt!389929 lt!389940))))

(declare-fun lt!389934 () V!27355)

(assert (=> b!863132 (= lt!389940 (tuple2!11131 (select (arr!23843 _keys!868) from!1053) lt!389934))))

(declare-fun get!12587 (ValueCell!7926 V!27355) V!27355)

(declare-fun dynLambda!1145 (Int (_ BitVec 64)) V!27355)

(assert (=> b!863132 (= lt!389934 (get!12587 (select (arr!23844 _values!688) from!1053) (dynLambda!1145 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863133 () Bool)

(declare-fun e!480862 () Bool)

(declare-fun tp_is_empty!16731 () Bool)

(assert (=> b!863133 (= e!480862 tp_is_empty!16731)))

(declare-fun b!863134 () Bool)

(declare-fun res!586521 () Bool)

(assert (=> b!863134 (=> (not res!586521) (not e!480858))))

(assert (=> b!863134 (= res!586521 (and (= (size!24284 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24283 _keys!868) (size!24284 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863135 () Bool)

(declare-fun res!586522 () Bool)

(assert (=> b!863135 (=> (not res!586522) (not e!480858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49624 (_ BitVec 32)) Bool)

(assert (=> b!863135 (= res!586522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!586519 () Bool)

(assert (=> start!73680 (=> (not res!586519) (not e!480858))))

(assert (=> start!73680 (= res!586519 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24283 _keys!868))))))

(assert (=> start!73680 e!480858))

(assert (=> start!73680 tp_is_empty!16731))

(assert (=> start!73680 true))

(assert (=> start!73680 tp!51288))

(declare-fun array_inv!18862 (array!49624) Bool)

(assert (=> start!73680 (array_inv!18862 _keys!868)))

(declare-fun e!480860 () Bool)

(declare-fun array_inv!18863 (array!49626) Bool)

(assert (=> start!73680 (and (array_inv!18863 _values!688) e!480860)))

(declare-fun b!863136 () Bool)

(declare-fun res!586524 () Bool)

(assert (=> b!863136 (=> (not res!586524) (not e!480858))))

(assert (=> b!863136 (= res!586524 (validKeyInArray!0 k0!854))))

(declare-fun b!863137 () Bool)

(assert (=> b!863137 (= e!480864 true)))

(assert (=> b!863137 (= lt!389933 (+!2314 (+!2314 lt!389939 lt!389940) lt!389941))))

(declare-fun lt!389935 () Unit!29491)

(declare-fun addCommutativeForDiffKeys!488 (ListLongMap!9899 (_ BitVec 64) V!27355 (_ BitVec 64) V!27355) Unit!29491)

(assert (=> b!863137 (= lt!389935 (addCommutativeForDiffKeys!488 lt!389939 k0!854 v!557 (select (arr!23843 _keys!868) from!1053) lt!389934))))

(declare-fun b!863138 () Bool)

(declare-fun e!480857 () Bool)

(assert (=> b!863138 (= e!480857 tp_is_empty!16731)))

(declare-fun mapNonEmpty!26696 () Bool)

(declare-fun mapRes!26696 () Bool)

(declare-fun tp!51289 () Bool)

(assert (=> mapNonEmpty!26696 (= mapRes!26696 (and tp!51289 e!480857))))

(declare-fun mapKey!26696 () (_ BitVec 32))

(declare-fun mapRest!26696 () (Array (_ BitVec 32) ValueCell!7926))

(declare-fun mapValue!26696 () ValueCell!7926)

(assert (=> mapNonEmpty!26696 (= (arr!23844 _values!688) (store mapRest!26696 mapKey!26696 mapValue!26696))))

(declare-fun b!863139 () Bool)

(assert (=> b!863139 (= e!480860 (and e!480862 mapRes!26696))))

(declare-fun condMapEmpty!26696 () Bool)

(declare-fun mapDefault!26696 () ValueCell!7926)

(assert (=> b!863139 (= condMapEmpty!26696 (= (arr!23844 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7926)) mapDefault!26696)))))

(declare-fun mapIsEmpty!26696 () Bool)

(assert (=> mapIsEmpty!26696 mapRes!26696))

(declare-fun b!863140 () Bool)

(assert (=> b!863140 (= e!480858 e!480861)))

(declare-fun res!586523 () Bool)

(assert (=> b!863140 (=> (not res!586523) (not e!480861))))

(assert (=> b!863140 (= res!586523 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863140 (= lt!389936 (getCurrentListMapNoExtraKeys!2940 _keys!868 lt!389944 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863140 (= lt!389944 (array!49627 (store (arr!23844 _values!688) i!612 (ValueCellFull!7926 v!557)) (size!24284 _values!688)))))

(declare-fun lt!389943 () ListLongMap!9899)

(assert (=> b!863140 (= lt!389943 (getCurrentListMapNoExtraKeys!2940 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73680 res!586519) b!863126))

(assert (= (and b!863126 res!586520) b!863134))

(assert (= (and b!863134 res!586521) b!863135))

(assert (= (and b!863135 res!586522) b!863131))

(assert (= (and b!863131 res!586526) b!863125))

(assert (= (and b!863125 res!586516) b!863136))

(assert (= (and b!863136 res!586524) b!863129))

(assert (= (and b!863129 res!586518) b!863140))

(assert (= (and b!863140 res!586523) b!863130))

(assert (= (and b!863130 (not res!586525)) b!863132))

(assert (= (and b!863132 c!92113) b!863128))

(assert (= (and b!863132 (not c!92113)) b!863127))

(assert (= (and b!863132 (not res!586517)) b!863137))

(assert (= (and b!863139 condMapEmpty!26696) mapIsEmpty!26696))

(assert (= (and b!863139 (not condMapEmpty!26696)) mapNonEmpty!26696))

(get-info :version)

(assert (= (and mapNonEmpty!26696 ((_ is ValueCellFull!7926) mapValue!26696)) b!863138))

(assert (= (and b!863139 ((_ is ValueCellFull!7926) mapDefault!26696)) b!863133))

(assert (= start!73680 b!863139))

(declare-fun b_lambda!11947 () Bool)

(assert (=> (not b_lambda!11947) (not b!863132)))

(declare-fun t!23799 () Bool)

(declare-fun tb!4717 () Bool)

(assert (=> (and start!73680 (= defaultEntry!696 defaultEntry!696) t!23799) tb!4717))

(declare-fun result!9045 () Bool)

(assert (=> tb!4717 (= result!9045 tp_is_empty!16731)))

(assert (=> b!863132 t!23799))

(declare-fun b_and!24171 () Bool)

(assert (= b_and!24169 (and (=> t!23799 result!9045) b_and!24171)))

(declare-fun m!804255 () Bool)

(assert (=> b!863129 m!804255))

(declare-fun m!804257 () Bool)

(assert (=> b!863132 m!804257))

(declare-fun m!804259 () Bool)

(assert (=> b!863132 m!804259))

(declare-fun m!804261 () Bool)

(assert (=> b!863132 m!804261))

(declare-fun m!804263 () Bool)

(assert (=> b!863132 m!804263))

(assert (=> b!863132 m!804259))

(declare-fun m!804265 () Bool)

(assert (=> b!863132 m!804265))

(assert (=> b!863132 m!804261))

(declare-fun m!804267 () Bool)

(assert (=> b!863126 m!804267))

(declare-fun m!804269 () Bool)

(assert (=> b!863128 m!804269))

(declare-fun m!804271 () Bool)

(assert (=> b!863128 m!804271))

(declare-fun m!804273 () Bool)

(assert (=> b!863128 m!804273))

(declare-fun m!804275 () Bool)

(assert (=> b!863128 m!804275))

(declare-fun m!804277 () Bool)

(assert (=> b!863128 m!804277))

(declare-fun m!804279 () Bool)

(assert (=> b!863140 m!804279))

(declare-fun m!804281 () Bool)

(assert (=> b!863140 m!804281))

(declare-fun m!804283 () Bool)

(assert (=> b!863140 m!804283))

(declare-fun m!804285 () Bool)

(assert (=> b!863131 m!804285))

(declare-fun m!804287 () Bool)

(assert (=> mapNonEmpty!26696 m!804287))

(declare-fun m!804289 () Bool)

(assert (=> b!863136 m!804289))

(declare-fun m!804291 () Bool)

(assert (=> start!73680 m!804291))

(declare-fun m!804293 () Bool)

(assert (=> start!73680 m!804293))

(declare-fun m!804295 () Bool)

(assert (=> b!863135 m!804295))

(declare-fun m!804297 () Bool)

(assert (=> b!863130 m!804297))

(assert (=> b!863130 m!804265))

(declare-fun m!804299 () Bool)

(assert (=> b!863130 m!804299))

(assert (=> b!863130 m!804265))

(declare-fun m!804301 () Bool)

(assert (=> b!863130 m!804301))

(declare-fun m!804303 () Bool)

(assert (=> b!863130 m!804303))

(declare-fun m!804305 () Bool)

(assert (=> b!863130 m!804305))

(declare-fun m!804307 () Bool)

(assert (=> b!863137 m!804307))

(assert (=> b!863137 m!804307))

(declare-fun m!804309 () Bool)

(assert (=> b!863137 m!804309))

(assert (=> b!863137 m!804265))

(assert (=> b!863137 m!804265))

(declare-fun m!804311 () Bool)

(assert (=> b!863137 m!804311))

(check-sat (not b_next!14595) (not b!863135) (not b!863132) (not b!863137) (not b!863130) (not b!863136) (not mapNonEmpty!26696) tp_is_empty!16731 (not b_lambda!11947) (not b!863131) (not start!73680) (not b!863140) (not b!863126) (not b!863128) b_and!24171)
(check-sat b_and!24171 (not b_next!14595))
