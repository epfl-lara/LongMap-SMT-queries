; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72456 () Bool)

(assert start!72456)

(declare-fun b_free!13641 () Bool)

(declare-fun b_next!13641 () Bool)

(assert (=> start!72456 (= b_free!13641 (not b_next!13641))))

(declare-fun tp!48021 () Bool)

(declare-fun b_and!22727 () Bool)

(assert (=> start!72456 (= tp!48021 b_and!22727)))

(declare-fun b!840311 () Bool)

(declare-fun e!468881 () Bool)

(declare-datatypes ((V!25723 0))(
  ( (V!25724 (val!7801 Int)) )
))
(declare-datatypes ((tuple2!10338 0))(
  ( (tuple2!10339 (_1!5180 (_ BitVec 64)) (_2!5180 V!25723)) )
))
(declare-datatypes ((List!16130 0))(
  ( (Nil!16127) (Cons!16126 (h!17257 tuple2!10338) (t!22501 List!16130)) )
))
(declare-datatypes ((ListLongMap!9107 0))(
  ( (ListLongMap!9108 (toList!4569 List!16130)) )
))
(declare-fun call!37156 () ListLongMap!9107)

(declare-fun call!37157 () ListLongMap!9107)

(assert (=> b!840311 (= e!468881 (= call!37156 call!37157))))

(declare-fun b!840312 () Bool)

(declare-fun res!571283 () Bool)

(declare-fun e!468885 () Bool)

(assert (=> b!840312 (=> (not res!571283) (not e!468885))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47294 0))(
  ( (array!47295 (arr!22678 (Array (_ BitVec 32) (_ BitVec 64))) (size!23118 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47294)

(assert (=> b!840312 (= res!571283 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23118 _keys!868))))))

(declare-fun b!840313 () Bool)

(declare-fun e!468882 () Bool)

(declare-fun tp_is_empty!15507 () Bool)

(assert (=> b!840313 (= e!468882 tp_is_empty!15507)))

(declare-fun b!840314 () Bool)

(declare-fun res!571285 () Bool)

(assert (=> b!840314 (=> (not res!571285) (not e!468885))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47294 (_ BitVec 32)) Bool)

(assert (=> b!840314 (= res!571285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840315 () Bool)

(declare-fun e!468883 () Bool)

(declare-fun e!468886 () Bool)

(declare-fun mapRes!24860 () Bool)

(assert (=> b!840315 (= e!468883 (and e!468886 mapRes!24860))))

(declare-fun condMapEmpty!24860 () Bool)

(declare-datatypes ((ValueCell!7314 0))(
  ( (ValueCellFull!7314 (v!10226 V!25723)) (EmptyCell!7314) )
))
(declare-datatypes ((array!47296 0))(
  ( (array!47297 (arr!22679 (Array (_ BitVec 32) ValueCell!7314)) (size!23119 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47296)

(declare-fun mapDefault!24860 () ValueCell!7314)

(assert (=> b!840315 (= condMapEmpty!24860 (= (arr!22679 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7314)) mapDefault!24860)))))

(declare-fun b!840316 () Bool)

(assert (=> b!840316 (= e!468886 tp_is_empty!15507)))

(declare-fun b!840317 () Bool)

(declare-fun res!571282 () Bool)

(assert (=> b!840317 (=> (not res!571282) (not e!468885))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!840317 (= res!571282 (and (= (size!23119 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23118 _keys!868) (size!23119 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840318 () Bool)

(declare-fun res!571288 () Bool)

(assert (=> b!840318 (=> (not res!571288) (not e!468885))))

(declare-datatypes ((List!16131 0))(
  ( (Nil!16128) (Cons!16127 (h!17258 (_ BitVec 64)) (t!22502 List!16131)) )
))
(declare-fun arrayNoDuplicates!0 (array!47294 (_ BitVec 32) List!16131) Bool)

(assert (=> b!840318 (= res!571288 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16128))))

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!37153 () Bool)

(declare-fun minValue!654 () V!25723)

(declare-fun zeroValue!654 () V!25723)

(declare-fun getCurrentListMapNoExtraKeys!2557 (array!47294 array!47296 (_ BitVec 32) (_ BitVec 32) V!25723 V!25723 (_ BitVec 32) Int) ListLongMap!9107)

(assert (=> bm!37153 (= call!37157 (getCurrentListMapNoExtraKeys!2557 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840319 () Bool)

(declare-fun res!571289 () Bool)

(assert (=> b!840319 (=> (not res!571289) (not e!468885))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!840319 (= res!571289 (and (= (select (arr!22678 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23118 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun v!557 () V!25723)

(declare-fun b!840320 () Bool)

(declare-fun +!2038 (ListLongMap!9107 tuple2!10338) ListLongMap!9107)

(assert (=> b!840320 (= e!468881 (= call!37156 (+!2038 call!37157 (tuple2!10339 k0!854 v!557))))))

(declare-fun b!840321 () Bool)

(assert (=> b!840321 (= e!468885 (not true))))

(assert (=> b!840321 e!468881))

(declare-fun c!91321 () Bool)

(assert (=> b!840321 (= c!91321 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28861 0))(
  ( (Unit!28862) )
))
(declare-fun lt!380827 () Unit!28861)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!276 (array!47294 array!47296 (_ BitVec 32) (_ BitVec 32) V!25723 V!25723 (_ BitVec 32) (_ BitVec 64) V!25723 (_ BitVec 32) Int) Unit!28861)

(assert (=> b!840321 (= lt!380827 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!276 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24860 () Bool)

(declare-fun tp!48022 () Bool)

(assert (=> mapNonEmpty!24860 (= mapRes!24860 (and tp!48022 e!468882))))

(declare-fun mapRest!24860 () (Array (_ BitVec 32) ValueCell!7314))

(declare-fun mapKey!24860 () (_ BitVec 32))

(declare-fun mapValue!24860 () ValueCell!7314)

(assert (=> mapNonEmpty!24860 (= (arr!22679 _values!688) (store mapRest!24860 mapKey!24860 mapValue!24860))))

(declare-fun res!571286 () Bool)

(assert (=> start!72456 (=> (not res!571286) (not e!468885))))

(assert (=> start!72456 (= res!571286 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23118 _keys!868))))))

(assert (=> start!72456 e!468885))

(assert (=> start!72456 tp_is_empty!15507))

(assert (=> start!72456 true))

(assert (=> start!72456 tp!48021))

(declare-fun array_inv!18056 (array!47294) Bool)

(assert (=> start!72456 (array_inv!18056 _keys!868)))

(declare-fun array_inv!18057 (array!47296) Bool)

(assert (=> start!72456 (and (array_inv!18057 _values!688) e!468883)))

(declare-fun b!840322 () Bool)

(declare-fun res!571287 () Bool)

(assert (=> b!840322 (=> (not res!571287) (not e!468885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840322 (= res!571287 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24860 () Bool)

(assert (=> mapIsEmpty!24860 mapRes!24860))

(declare-fun bm!37154 () Bool)

(assert (=> bm!37154 (= call!37156 (getCurrentListMapNoExtraKeys!2557 _keys!868 (array!47297 (store (arr!22679 _values!688) i!612 (ValueCellFull!7314 v!557)) (size!23119 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840323 () Bool)

(declare-fun res!571284 () Bool)

(assert (=> b!840323 (=> (not res!571284) (not e!468885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840323 (= res!571284 (validKeyInArray!0 k0!854))))

(assert (= (and start!72456 res!571286) b!840322))

(assert (= (and b!840322 res!571287) b!840317))

(assert (= (and b!840317 res!571282) b!840314))

(assert (= (and b!840314 res!571285) b!840318))

(assert (= (and b!840318 res!571288) b!840312))

(assert (= (and b!840312 res!571283) b!840323))

(assert (= (and b!840323 res!571284) b!840319))

(assert (= (and b!840319 res!571289) b!840321))

(assert (= (and b!840321 c!91321) b!840320))

(assert (= (and b!840321 (not c!91321)) b!840311))

(assert (= (or b!840320 b!840311) bm!37154))

(assert (= (or b!840320 b!840311) bm!37153))

(assert (= (and b!840315 condMapEmpty!24860) mapIsEmpty!24860))

(assert (= (and b!840315 (not condMapEmpty!24860)) mapNonEmpty!24860))

(get-info :version)

(assert (= (and mapNonEmpty!24860 ((_ is ValueCellFull!7314) mapValue!24860)) b!840313))

(assert (= (and b!840315 ((_ is ValueCellFull!7314) mapDefault!24860)) b!840316))

(assert (= start!72456 b!840315))

(declare-fun m!784127 () Bool)

(assert (=> b!840322 m!784127))

(declare-fun m!784129 () Bool)

(assert (=> b!840318 m!784129))

(declare-fun m!784131 () Bool)

(assert (=> b!840321 m!784131))

(declare-fun m!784133 () Bool)

(assert (=> b!840314 m!784133))

(declare-fun m!784135 () Bool)

(assert (=> mapNonEmpty!24860 m!784135))

(declare-fun m!784137 () Bool)

(assert (=> start!72456 m!784137))

(declare-fun m!784139 () Bool)

(assert (=> start!72456 m!784139))

(declare-fun m!784141 () Bool)

(assert (=> b!840320 m!784141))

(declare-fun m!784143 () Bool)

(assert (=> bm!37153 m!784143))

(declare-fun m!784145 () Bool)

(assert (=> bm!37154 m!784145))

(declare-fun m!784147 () Bool)

(assert (=> bm!37154 m!784147))

(declare-fun m!784149 () Bool)

(assert (=> b!840319 m!784149))

(declare-fun m!784151 () Bool)

(assert (=> b!840323 m!784151))

(check-sat (not b!840318) (not b!840321) tp_is_empty!15507 (not b!840322) (not b_next!13641) (not b!840323) b_and!22727 (not start!72456) (not bm!37154) (not mapNonEmpty!24860) (not b!840320) (not bm!37153) (not b!840314))
(check-sat b_and!22727 (not b_next!13641))
