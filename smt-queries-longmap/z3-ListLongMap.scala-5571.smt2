; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73212 () Bool)

(assert start!73212)

(declare-fun b_free!14127 () Bool)

(declare-fun b_next!14127 () Bool)

(assert (=> start!73212 (= b_free!14127 (not b_next!14127))))

(declare-fun tp!49885 () Bool)

(declare-fun b_and!23413 () Bool)

(assert (=> start!73212 (= tp!49885 b_and!23413)))

(declare-fun b!853139 () Bool)

(declare-fun e!475791 () Bool)

(declare-fun e!475785 () Bool)

(declare-fun mapRes!25994 () Bool)

(assert (=> b!853139 (= e!475791 (and e!475785 mapRes!25994))))

(declare-fun condMapEmpty!25994 () Bool)

(declare-datatypes ((V!26731 0))(
  ( (V!26732 (val!8179 Int)) )
))
(declare-datatypes ((ValueCell!7692 0))(
  ( (ValueCellFull!7692 (v!10604 V!26731)) (EmptyCell!7692) )
))
(declare-datatypes ((array!48724 0))(
  ( (array!48725 (arr!23393 (Array (_ BitVec 32) ValueCell!7692)) (size!23833 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48724)

(declare-fun mapDefault!25994 () ValueCell!7692)

(assert (=> b!853139 (= condMapEmpty!25994 (= (arr!23393 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7692)) mapDefault!25994)))))

(declare-fun b!853140 () Bool)

(declare-fun e!475786 () Bool)

(declare-fun e!475789 () Bool)

(assert (=> b!853140 (= e!475786 (not e!475789))))

(declare-fun res!579431 () Bool)

(assert (=> b!853140 (=> res!579431 e!475789)))

(declare-datatypes ((array!48726 0))(
  ( (array!48727 (arr!23394 (Array (_ BitVec 32) (_ BitVec 64))) (size!23834 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48726)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853140 (= res!579431 (not (validKeyInArray!0 (select (arr!23394 _keys!868) from!1053))))))

(declare-fun e!475788 () Bool)

(assert (=> b!853140 e!475788))

(declare-fun c!91861 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853140 (= c!91861 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26731)

(declare-datatypes ((Unit!29117 0))(
  ( (Unit!29118) )
))
(declare-fun lt!384550 () Unit!29117)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26731)

(declare-fun zeroValue!654 () V!26731)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!395 (array!48726 array!48724 (_ BitVec 32) (_ BitVec 32) V!26731 V!26731 (_ BitVec 32) (_ BitVec 64) V!26731 (_ BitVec 32) Int) Unit!29117)

(assert (=> b!853140 (= lt!384550 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!395 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!384546 () array!48724)

(declare-datatypes ((tuple2!10748 0))(
  ( (tuple2!10749 (_1!5385 (_ BitVec 64)) (_2!5385 V!26731)) )
))
(declare-datatypes ((List!16576 0))(
  ( (Nil!16573) (Cons!16572 (h!17703 tuple2!10748) (t!23149 List!16576)) )
))
(declare-datatypes ((ListLongMap!9517 0))(
  ( (ListLongMap!9518 (toList!4774 List!16576)) )
))
(declare-fun call!38236 () ListLongMap!9517)

(declare-fun bm!38233 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2755 (array!48726 array!48724 (_ BitVec 32) (_ BitVec 32) V!26731 V!26731 (_ BitVec 32) Int) ListLongMap!9517)

(assert (=> bm!38233 (= call!38236 (getCurrentListMapNoExtraKeys!2755 _keys!868 lt!384546 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853142 () Bool)

(declare-fun res!579430 () Bool)

(declare-fun e!475787 () Bool)

(assert (=> b!853142 (=> (not res!579430) (not e!475787))))

(declare-datatypes ((List!16577 0))(
  ( (Nil!16574) (Cons!16573 (h!17704 (_ BitVec 64)) (t!23150 List!16577)) )
))
(declare-fun arrayNoDuplicates!0 (array!48726 (_ BitVec 32) List!16577) Bool)

(assert (=> b!853142 (= res!579430 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16574))))

(declare-fun mapNonEmpty!25994 () Bool)

(declare-fun tp!49884 () Bool)

(declare-fun e!475792 () Bool)

(assert (=> mapNonEmpty!25994 (= mapRes!25994 (and tp!49884 e!475792))))

(declare-fun mapValue!25994 () ValueCell!7692)

(declare-fun mapKey!25994 () (_ BitVec 32))

(declare-fun mapRest!25994 () (Array (_ BitVec 32) ValueCell!7692))

(assert (=> mapNonEmpty!25994 (= (arr!23393 _values!688) (store mapRest!25994 mapKey!25994 mapValue!25994))))

(declare-fun b!853143 () Bool)

(declare-fun tp_is_empty!16263 () Bool)

(assert (=> b!853143 (= e!475785 tp_is_empty!16263)))

(declare-fun b!853144 () Bool)

(assert (=> b!853144 (= e!475789 true)))

(declare-fun lt!384547 () ListLongMap!9517)

(declare-fun lt!384551 () V!26731)

(declare-fun lt!384549 () tuple2!10748)

(declare-fun +!2167 (ListLongMap!9517 tuple2!10748) ListLongMap!9517)

(assert (=> b!853144 (= (+!2167 lt!384547 lt!384549) (+!2167 (+!2167 lt!384547 (tuple2!10749 k0!854 lt!384551)) lt!384549))))

(declare-fun lt!384544 () V!26731)

(assert (=> b!853144 (= lt!384549 (tuple2!10749 k0!854 lt!384544))))

(declare-fun lt!384553 () Unit!29117)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!294 (ListLongMap!9517 (_ BitVec 64) V!26731 V!26731) Unit!29117)

(assert (=> b!853144 (= lt!384553 (addSameAsAddTwiceSameKeyDiffValues!294 lt!384547 k0!854 lt!384551 lt!384544))))

(declare-fun lt!384548 () V!26731)

(declare-fun get!12334 (ValueCell!7692 V!26731) V!26731)

(assert (=> b!853144 (= lt!384551 (get!12334 (select (arr!23393 _values!688) from!1053) lt!384548))))

(declare-fun lt!384552 () ListLongMap!9517)

(assert (=> b!853144 (= lt!384552 (+!2167 lt!384547 (tuple2!10749 (select (arr!23394 _keys!868) from!1053) lt!384544)))))

(assert (=> b!853144 (= lt!384544 (get!12334 (select (store (arr!23393 _values!688) i!612 (ValueCellFull!7692 v!557)) from!1053) lt!384548))))

(declare-fun dynLambda!1048 (Int (_ BitVec 64)) V!26731)

(assert (=> b!853144 (= lt!384548 (dynLambda!1048 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853144 (= lt!384547 (getCurrentListMapNoExtraKeys!2755 _keys!868 lt!384546 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853145 () Bool)

(declare-fun res!579436 () Bool)

(assert (=> b!853145 (=> (not res!579436) (not e!475787))))

(assert (=> b!853145 (= res!579436 (validKeyInArray!0 k0!854))))

(declare-fun b!853146 () Bool)

(assert (=> b!853146 (= e!475792 tp_is_empty!16263)))

(declare-fun b!853147 () Bool)

(declare-fun res!579428 () Bool)

(assert (=> b!853147 (=> (not res!579428) (not e!475787))))

(assert (=> b!853147 (= res!579428 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23834 _keys!868))))))

(declare-fun b!853148 () Bool)

(declare-fun call!38237 () ListLongMap!9517)

(assert (=> b!853148 (= e!475788 (= call!38236 (+!2167 call!38237 (tuple2!10749 k0!854 v!557))))))

(declare-fun bm!38234 () Bool)

(assert (=> bm!38234 (= call!38237 (getCurrentListMapNoExtraKeys!2755 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853141 () Bool)

(assert (=> b!853141 (= e!475788 (= call!38236 call!38237))))

(declare-fun res!579433 () Bool)

(assert (=> start!73212 (=> (not res!579433) (not e!475787))))

(assert (=> start!73212 (= res!579433 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23834 _keys!868))))))

(assert (=> start!73212 e!475787))

(assert (=> start!73212 tp_is_empty!16263))

(assert (=> start!73212 true))

(assert (=> start!73212 tp!49885))

(declare-fun array_inv!18550 (array!48726) Bool)

(assert (=> start!73212 (array_inv!18550 _keys!868)))

(declare-fun array_inv!18551 (array!48724) Bool)

(assert (=> start!73212 (and (array_inv!18551 _values!688) e!475791)))

(declare-fun mapIsEmpty!25994 () Bool)

(assert (=> mapIsEmpty!25994 mapRes!25994))

(declare-fun b!853149 () Bool)

(declare-fun res!579432 () Bool)

(assert (=> b!853149 (=> (not res!579432) (not e!475787))))

(assert (=> b!853149 (= res!579432 (and (= (select (arr!23394 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853150 () Bool)

(assert (=> b!853150 (= e!475787 e!475786)))

(declare-fun res!579429 () Bool)

(assert (=> b!853150 (=> (not res!579429) (not e!475786))))

(assert (=> b!853150 (= res!579429 (= from!1053 i!612))))

(assert (=> b!853150 (= lt!384552 (getCurrentListMapNoExtraKeys!2755 _keys!868 lt!384546 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853150 (= lt!384546 (array!48725 (store (arr!23393 _values!688) i!612 (ValueCellFull!7692 v!557)) (size!23833 _values!688)))))

(declare-fun lt!384545 () ListLongMap!9517)

(assert (=> b!853150 (= lt!384545 (getCurrentListMapNoExtraKeys!2755 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853151 () Bool)

(declare-fun res!579434 () Bool)

(assert (=> b!853151 (=> (not res!579434) (not e!475787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853151 (= res!579434 (validMask!0 mask!1196))))

(declare-fun b!853152 () Bool)

(declare-fun res!579435 () Bool)

(assert (=> b!853152 (=> (not res!579435) (not e!475787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48726 (_ BitVec 32)) Bool)

(assert (=> b!853152 (= res!579435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853153 () Bool)

(declare-fun res!579437 () Bool)

(assert (=> b!853153 (=> (not res!579437) (not e!475787))))

(assert (=> b!853153 (= res!579437 (and (= (size!23833 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23834 _keys!868) (size!23833 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73212 res!579433) b!853151))

(assert (= (and b!853151 res!579434) b!853153))

(assert (= (and b!853153 res!579437) b!853152))

(assert (= (and b!853152 res!579435) b!853142))

(assert (= (and b!853142 res!579430) b!853147))

(assert (= (and b!853147 res!579428) b!853145))

(assert (= (and b!853145 res!579436) b!853149))

(assert (= (and b!853149 res!579432) b!853150))

(assert (= (and b!853150 res!579429) b!853140))

(assert (= (and b!853140 c!91861) b!853148))

(assert (= (and b!853140 (not c!91861)) b!853141))

(assert (= (or b!853148 b!853141) bm!38233))

(assert (= (or b!853148 b!853141) bm!38234))

(assert (= (and b!853140 (not res!579431)) b!853144))

(assert (= (and b!853139 condMapEmpty!25994) mapIsEmpty!25994))

(assert (= (and b!853139 (not condMapEmpty!25994)) mapNonEmpty!25994))

(get-info :version)

(assert (= (and mapNonEmpty!25994 ((_ is ValueCellFull!7692) mapValue!25994)) b!853146))

(assert (= (and b!853139 ((_ is ValueCellFull!7692) mapDefault!25994)) b!853143))

(assert (= start!73212 b!853139))

(declare-fun b_lambda!11659 () Bool)

(assert (=> (not b_lambda!11659) (not b!853144)))

(declare-fun t!23148 () Bool)

(declare-fun tb!4429 () Bool)

(assert (=> (and start!73212 (= defaultEntry!696 defaultEntry!696) t!23148) tb!4429))

(declare-fun result!8469 () Bool)

(assert (=> tb!4429 (= result!8469 tp_is_empty!16263)))

(assert (=> b!853144 t!23148))

(declare-fun b_and!23415 () Bool)

(assert (= b_and!23413 (and (=> t!23148 result!8469) b_and!23415)))

(declare-fun m!794307 () Bool)

(assert (=> b!853151 m!794307))

(declare-fun m!794309 () Bool)

(assert (=> bm!38233 m!794309))

(declare-fun m!794311 () Bool)

(assert (=> b!853150 m!794311))

(declare-fun m!794313 () Bool)

(assert (=> b!853150 m!794313))

(declare-fun m!794315 () Bool)

(assert (=> b!853150 m!794315))

(declare-fun m!794317 () Bool)

(assert (=> b!853152 m!794317))

(declare-fun m!794319 () Bool)

(assert (=> b!853144 m!794319))

(assert (=> b!853144 m!794309))

(declare-fun m!794321 () Bool)

(assert (=> b!853144 m!794321))

(declare-fun m!794323 () Bool)

(assert (=> b!853144 m!794323))

(declare-fun m!794325 () Bool)

(assert (=> b!853144 m!794325))

(declare-fun m!794327 () Bool)

(assert (=> b!853144 m!794327))

(assert (=> b!853144 m!794327))

(declare-fun m!794329 () Bool)

(assert (=> b!853144 m!794329))

(assert (=> b!853144 m!794323))

(declare-fun m!794331 () Bool)

(assert (=> b!853144 m!794331))

(declare-fun m!794333 () Bool)

(assert (=> b!853144 m!794333))

(assert (=> b!853144 m!794331))

(declare-fun m!794335 () Bool)

(assert (=> b!853144 m!794335))

(declare-fun m!794337 () Bool)

(assert (=> b!853144 m!794337))

(declare-fun m!794339 () Bool)

(assert (=> b!853144 m!794339))

(assert (=> b!853144 m!794313))

(declare-fun m!794341 () Bool)

(assert (=> bm!38234 m!794341))

(declare-fun m!794343 () Bool)

(assert (=> b!853148 m!794343))

(declare-fun m!794345 () Bool)

(assert (=> start!73212 m!794345))

(declare-fun m!794347 () Bool)

(assert (=> start!73212 m!794347))

(assert (=> b!853140 m!794335))

(assert (=> b!853140 m!794335))

(declare-fun m!794349 () Bool)

(assert (=> b!853140 m!794349))

(declare-fun m!794351 () Bool)

(assert (=> b!853140 m!794351))

(declare-fun m!794353 () Bool)

(assert (=> b!853149 m!794353))

(declare-fun m!794355 () Bool)

(assert (=> b!853145 m!794355))

(declare-fun m!794357 () Bool)

(assert (=> b!853142 m!794357))

(declare-fun m!794359 () Bool)

(assert (=> mapNonEmpty!25994 m!794359))

(check-sat (not bm!38234) (not b_lambda!11659) (not b!853144) b_and!23415 (not b!853142) (not bm!38233) (not b_next!14127) (not b!853148) (not b!853152) (not b!853151) (not mapNonEmpty!25994) (not b!853140) tp_is_empty!16263 (not b!853150) (not start!73212) (not b!853145))
(check-sat b_and!23415 (not b_next!14127))
