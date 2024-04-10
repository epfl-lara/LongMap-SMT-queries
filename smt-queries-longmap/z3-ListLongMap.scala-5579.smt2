; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73260 () Bool)

(assert start!73260)

(declare-fun b_free!14175 () Bool)

(declare-fun b_next!14175 () Bool)

(assert (=> start!73260 (= b_free!14175 (not b_next!14175))))

(declare-fun tp!50028 () Bool)

(declare-fun b_and!23509 () Bool)

(assert (=> start!73260 (= tp!50028 b_and!23509)))

(declare-fun b!854267 () Bool)

(declare-fun res!580155 () Bool)

(declare-fun e!476361 () Bool)

(assert (=> b!854267 (=> (not res!580155) (not e!476361))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854267 (= res!580155 (validMask!0 mask!1196))))

(declare-datatypes ((V!26795 0))(
  ( (V!26796 (val!8203 Int)) )
))
(declare-datatypes ((tuple2!10796 0))(
  ( (tuple2!10797 (_1!5409 (_ BitVec 64)) (_2!5409 V!26795)) )
))
(declare-datatypes ((List!16613 0))(
  ( (Nil!16610) (Cons!16609 (h!17740 tuple2!10796) (t!23234 List!16613)) )
))
(declare-datatypes ((ListLongMap!9565 0))(
  ( (ListLongMap!9566 (toList!4798 List!16613)) )
))
(declare-fun call!38381 () ListLongMap!9565)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48820 0))(
  ( (array!48821 (arr!23441 (Array (_ BitVec 32) (_ BitVec 64))) (size!23881 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48820)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26795)

(declare-fun zeroValue!654 () V!26795)

(declare-datatypes ((ValueCell!7716 0))(
  ( (ValueCellFull!7716 (v!10628 V!26795)) (EmptyCell!7716) )
))
(declare-datatypes ((array!48822 0))(
  ( (array!48823 (arr!23442 (Array (_ BitVec 32) ValueCell!7716)) (size!23882 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48822)

(declare-fun bm!38377 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2779 (array!48820 array!48822 (_ BitVec 32) (_ BitVec 32) V!26795 V!26795 (_ BitVec 32) Int) ListLongMap!9565)

(assert (=> bm!38377 (= call!38381 (getCurrentListMapNoExtraKeys!2779 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854269 () Bool)

(declare-fun e!476364 () Bool)

(declare-fun e!476363 () Bool)

(assert (=> b!854269 (= e!476364 (not e!476363))))

(declare-fun res!580153 () Bool)

(assert (=> b!854269 (=> res!580153 e!476363)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854269 (= res!580153 (not (validKeyInArray!0 (select (arr!23441 _keys!868) from!1053))))))

(declare-fun e!476366 () Bool)

(assert (=> b!854269 e!476366))

(declare-fun c!91933 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854269 (= c!91933 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26795)

(declare-datatypes ((Unit!29159 0))(
  ( (Unit!29160) )
))
(declare-fun lt!385271 () Unit!29159)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!409 (array!48820 array!48822 (_ BitVec 32) (_ BitVec 32) V!26795 V!26795 (_ BitVec 32) (_ BitVec 64) V!26795 (_ BitVec 32) Int) Unit!29159)

(assert (=> b!854269 (= lt!385271 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!409 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26066 () Bool)

(declare-fun mapRes!26066 () Bool)

(assert (=> mapIsEmpty!26066 mapRes!26066))

(declare-fun b!854270 () Bool)

(declare-fun e!476365 () Bool)

(declare-fun e!476362 () Bool)

(assert (=> b!854270 (= e!476365 (and e!476362 mapRes!26066))))

(declare-fun condMapEmpty!26066 () Bool)

(declare-fun mapDefault!26066 () ValueCell!7716)

(assert (=> b!854270 (= condMapEmpty!26066 (= (arr!23442 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7716)) mapDefault!26066)))))

(declare-fun b!854271 () Bool)

(assert (=> b!854271 (= e!476363 true)))

(declare-fun lt!385267 () ListLongMap!9565)

(declare-fun lt!385268 () tuple2!10796)

(declare-fun lt!385273 () V!26795)

(declare-fun +!2187 (ListLongMap!9565 tuple2!10796) ListLongMap!9565)

(assert (=> b!854271 (= (+!2187 lt!385267 lt!385268) (+!2187 (+!2187 lt!385267 (tuple2!10797 k0!854 lt!385273)) lt!385268))))

(declare-fun lt!385270 () V!26795)

(assert (=> b!854271 (= lt!385268 (tuple2!10797 k0!854 lt!385270))))

(declare-fun lt!385264 () Unit!29159)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!312 (ListLongMap!9565 (_ BitVec 64) V!26795 V!26795) Unit!29159)

(assert (=> b!854271 (= lt!385264 (addSameAsAddTwiceSameKeyDiffValues!312 lt!385267 k0!854 lt!385273 lt!385270))))

(declare-fun lt!385269 () V!26795)

(declare-fun get!12368 (ValueCell!7716 V!26795) V!26795)

(assert (=> b!854271 (= lt!385273 (get!12368 (select (arr!23442 _values!688) from!1053) lt!385269))))

(declare-fun lt!385272 () ListLongMap!9565)

(assert (=> b!854271 (= lt!385272 (+!2187 lt!385267 (tuple2!10797 (select (arr!23441 _keys!868) from!1053) lt!385270)))))

(assert (=> b!854271 (= lt!385270 (get!12368 (select (store (arr!23442 _values!688) i!612 (ValueCellFull!7716 v!557)) from!1053) lt!385269))))

(declare-fun dynLambda!1066 (Int (_ BitVec 64)) V!26795)

(assert (=> b!854271 (= lt!385269 (dynLambda!1066 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!385265 () array!48822)

(assert (=> b!854271 (= lt!385267 (getCurrentListMapNoExtraKeys!2779 _keys!868 lt!385265 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854272 () Bool)

(declare-fun res!580150 () Bool)

(assert (=> b!854272 (=> (not res!580150) (not e!476361))))

(assert (=> b!854272 (= res!580150 (validKeyInArray!0 k0!854))))

(declare-fun bm!38378 () Bool)

(declare-fun call!38380 () ListLongMap!9565)

(assert (=> bm!38378 (= call!38380 (getCurrentListMapNoExtraKeys!2779 _keys!868 lt!385265 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854273 () Bool)

(declare-fun res!580152 () Bool)

(assert (=> b!854273 (=> (not res!580152) (not e!476361))))

(assert (=> b!854273 (= res!580152 (and (= (size!23882 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23881 _keys!868) (size!23882 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854274 () Bool)

(declare-fun res!580157 () Bool)

(assert (=> b!854274 (=> (not res!580157) (not e!476361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48820 (_ BitVec 32)) Bool)

(assert (=> b!854274 (= res!580157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854275 () Bool)

(declare-fun res!580154 () Bool)

(assert (=> b!854275 (=> (not res!580154) (not e!476361))))

(assert (=> b!854275 (= res!580154 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23881 _keys!868))))))

(declare-fun b!854268 () Bool)

(declare-fun res!580148 () Bool)

(assert (=> b!854268 (=> (not res!580148) (not e!476361))))

(assert (=> b!854268 (= res!580148 (and (= (select (arr!23441 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!580149 () Bool)

(assert (=> start!73260 (=> (not res!580149) (not e!476361))))

(assert (=> start!73260 (= res!580149 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23881 _keys!868))))))

(assert (=> start!73260 e!476361))

(declare-fun tp_is_empty!16311 () Bool)

(assert (=> start!73260 tp_is_empty!16311))

(assert (=> start!73260 true))

(assert (=> start!73260 tp!50028))

(declare-fun array_inv!18580 (array!48820) Bool)

(assert (=> start!73260 (array_inv!18580 _keys!868)))

(declare-fun array_inv!18581 (array!48822) Bool)

(assert (=> start!73260 (and (array_inv!18581 _values!688) e!476365)))

(declare-fun b!854276 () Bool)

(assert (=> b!854276 (= e!476361 e!476364)))

(declare-fun res!580151 () Bool)

(assert (=> b!854276 (=> (not res!580151) (not e!476364))))

(assert (=> b!854276 (= res!580151 (= from!1053 i!612))))

(assert (=> b!854276 (= lt!385272 (getCurrentListMapNoExtraKeys!2779 _keys!868 lt!385265 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854276 (= lt!385265 (array!48823 (store (arr!23442 _values!688) i!612 (ValueCellFull!7716 v!557)) (size!23882 _values!688)))))

(declare-fun lt!385266 () ListLongMap!9565)

(assert (=> b!854276 (= lt!385266 (getCurrentListMapNoExtraKeys!2779 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854277 () Bool)

(assert (=> b!854277 (= e!476362 tp_is_empty!16311)))

(declare-fun b!854278 () Bool)

(assert (=> b!854278 (= e!476366 (= call!38380 call!38381))))

(declare-fun b!854279 () Bool)

(declare-fun e!476368 () Bool)

(assert (=> b!854279 (= e!476368 tp_is_empty!16311)))

(declare-fun b!854280 () Bool)

(declare-fun res!580156 () Bool)

(assert (=> b!854280 (=> (not res!580156) (not e!476361))))

(declare-datatypes ((List!16614 0))(
  ( (Nil!16611) (Cons!16610 (h!17741 (_ BitVec 64)) (t!23235 List!16614)) )
))
(declare-fun arrayNoDuplicates!0 (array!48820 (_ BitVec 32) List!16614) Bool)

(assert (=> b!854280 (= res!580156 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16611))))

(declare-fun b!854281 () Bool)

(assert (=> b!854281 (= e!476366 (= call!38380 (+!2187 call!38381 (tuple2!10797 k0!854 v!557))))))

(declare-fun mapNonEmpty!26066 () Bool)

(declare-fun tp!50029 () Bool)

(assert (=> mapNonEmpty!26066 (= mapRes!26066 (and tp!50029 e!476368))))

(declare-fun mapRest!26066 () (Array (_ BitVec 32) ValueCell!7716))

(declare-fun mapValue!26066 () ValueCell!7716)

(declare-fun mapKey!26066 () (_ BitVec 32))

(assert (=> mapNonEmpty!26066 (= (arr!23442 _values!688) (store mapRest!26066 mapKey!26066 mapValue!26066))))

(assert (= (and start!73260 res!580149) b!854267))

(assert (= (and b!854267 res!580155) b!854273))

(assert (= (and b!854273 res!580152) b!854274))

(assert (= (and b!854274 res!580157) b!854280))

(assert (= (and b!854280 res!580156) b!854275))

(assert (= (and b!854275 res!580154) b!854272))

(assert (= (and b!854272 res!580150) b!854268))

(assert (= (and b!854268 res!580148) b!854276))

(assert (= (and b!854276 res!580151) b!854269))

(assert (= (and b!854269 c!91933) b!854281))

(assert (= (and b!854269 (not c!91933)) b!854278))

(assert (= (or b!854281 b!854278) bm!38378))

(assert (= (or b!854281 b!854278) bm!38377))

(assert (= (and b!854269 (not res!580153)) b!854271))

(assert (= (and b!854270 condMapEmpty!26066) mapIsEmpty!26066))

(assert (= (and b!854270 (not condMapEmpty!26066)) mapNonEmpty!26066))

(get-info :version)

(assert (= (and mapNonEmpty!26066 ((_ is ValueCellFull!7716) mapValue!26066)) b!854279))

(assert (= (and b!854270 ((_ is ValueCellFull!7716) mapDefault!26066)) b!854277))

(assert (= start!73260 b!854270))

(declare-fun b_lambda!11707 () Bool)

(assert (=> (not b_lambda!11707) (not b!854271)))

(declare-fun t!23233 () Bool)

(declare-fun tb!4477 () Bool)

(assert (=> (and start!73260 (= defaultEntry!696 defaultEntry!696) t!23233) tb!4477))

(declare-fun result!8565 () Bool)

(assert (=> tb!4477 (= result!8565 tp_is_empty!16311)))

(assert (=> b!854271 t!23233))

(declare-fun b_and!23511 () Bool)

(assert (= b_and!23509 (and (=> t!23233 result!8565) b_and!23511)))

(declare-fun m!795605 () Bool)

(assert (=> b!854281 m!795605))

(declare-fun m!795607 () Bool)

(assert (=> bm!38378 m!795607))

(declare-fun m!795609 () Bool)

(assert (=> b!854268 m!795609))

(declare-fun m!795611 () Bool)

(assert (=> b!854271 m!795611))

(declare-fun m!795613 () Bool)

(assert (=> b!854271 m!795613))

(declare-fun m!795615 () Bool)

(assert (=> b!854271 m!795615))

(assert (=> b!854271 m!795607))

(declare-fun m!795617 () Bool)

(assert (=> b!854271 m!795617))

(assert (=> b!854271 m!795611))

(declare-fun m!795619 () Bool)

(assert (=> b!854271 m!795619))

(assert (=> b!854271 m!795613))

(declare-fun m!795621 () Bool)

(assert (=> b!854271 m!795621))

(declare-fun m!795623 () Bool)

(assert (=> b!854271 m!795623))

(declare-fun m!795625 () Bool)

(assert (=> b!854271 m!795625))

(assert (=> b!854271 m!795623))

(declare-fun m!795627 () Bool)

(assert (=> b!854271 m!795627))

(declare-fun m!795629 () Bool)

(assert (=> b!854271 m!795629))

(declare-fun m!795631 () Bool)

(assert (=> b!854271 m!795631))

(declare-fun m!795633 () Bool)

(assert (=> b!854271 m!795633))

(declare-fun m!795635 () Bool)

(assert (=> mapNonEmpty!26066 m!795635))

(assert (=> b!854269 m!795629))

(assert (=> b!854269 m!795629))

(declare-fun m!795637 () Bool)

(assert (=> b!854269 m!795637))

(declare-fun m!795639 () Bool)

(assert (=> b!854269 m!795639))

(declare-fun m!795641 () Bool)

(assert (=> bm!38377 m!795641))

(declare-fun m!795643 () Bool)

(assert (=> b!854267 m!795643))

(declare-fun m!795645 () Bool)

(assert (=> b!854280 m!795645))

(declare-fun m!795647 () Bool)

(assert (=> b!854274 m!795647))

(declare-fun m!795649 () Bool)

(assert (=> start!73260 m!795649))

(declare-fun m!795651 () Bool)

(assert (=> start!73260 m!795651))

(declare-fun m!795653 () Bool)

(assert (=> b!854276 m!795653))

(assert (=> b!854276 m!795627))

(declare-fun m!795655 () Bool)

(assert (=> b!854276 m!795655))

(declare-fun m!795657 () Bool)

(assert (=> b!854272 m!795657))

(check-sat (not b!854281) (not mapNonEmpty!26066) (not bm!38377) (not bm!38378) (not b!854272) tp_is_empty!16311 (not b!854271) (not b!854274) (not b!854269) (not b!854280) b_and!23511 (not b!854276) (not start!73260) (not b_next!14175) (not b!854267) (not b_lambda!11707))
(check-sat b_and!23511 (not b_next!14175))
