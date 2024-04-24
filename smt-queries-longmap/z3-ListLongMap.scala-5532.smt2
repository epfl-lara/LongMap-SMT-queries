; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73144 () Bool)

(assert start!73144)

(declare-fun b_free!13891 () Bool)

(declare-fun b_next!13891 () Bool)

(assert (=> start!73144 (= b_free!13891 (not b_next!13891))))

(declare-fun tp!49177 () Bool)

(declare-fun b_and!22987 () Bool)

(assert (=> start!73144 (= tp!49177 b_and!22987)))

(declare-datatypes ((V!26417 0))(
  ( (V!26418 (val!8061 Int)) )
))
(declare-datatypes ((ValueCell!7574 0))(
  ( (ValueCellFull!7574 (v!10486 V!26417)) (EmptyCell!7574) )
))
(declare-datatypes ((array!48317 0))(
  ( (array!48318 (arr!23185 (Array (_ BitVec 32) ValueCell!7574)) (size!23626 (_ BitVec 32))) )
))
(declare-fun lt!382166 () array!48317)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37570 () Bool)

(declare-datatypes ((tuple2!10460 0))(
  ( (tuple2!10461 (_1!5241 (_ BitVec 64)) (_2!5241 V!26417)) )
))
(declare-datatypes ((List!16331 0))(
  ( (Nil!16328) (Cons!16327 (h!17464 tuple2!10460) (t!22694 List!16331)) )
))
(declare-datatypes ((ListLongMap!9231 0))(
  ( (ListLongMap!9232 (toList!4631 List!16331)) )
))
(declare-fun call!37573 () ListLongMap!9231)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48319 0))(
  ( (array!48320 (arr!23186 (Array (_ BitVec 32) (_ BitVec 64))) (size!23627 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48319)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26417)

(declare-fun zeroValue!654 () V!26417)

(declare-fun getCurrentListMapNoExtraKeys!2689 (array!48319 array!48317 (_ BitVec 32) (_ BitVec 32) V!26417 V!26417 (_ BitVec 32) Int) ListLongMap!9231)

(assert (=> bm!37570 (= call!37573 (getCurrentListMapNoExtraKeys!2689 _keys!868 lt!382166 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576281 () Bool)

(declare-fun e!473580 () Bool)

(assert (=> start!73144 (=> (not res!576281) (not e!473580))))

(assert (=> start!73144 (= res!576281 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23627 _keys!868))))))

(assert (=> start!73144 e!473580))

(declare-fun tp_is_empty!16027 () Bool)

(assert (=> start!73144 tp_is_empty!16027))

(assert (=> start!73144 true))

(assert (=> start!73144 tp!49177))

(declare-fun array_inv!18460 (array!48319) Bool)

(assert (=> start!73144 (array_inv!18460 _keys!868)))

(declare-fun _values!688 () array!48317)

(declare-fun e!473584 () Bool)

(declare-fun array_inv!18461 (array!48317) Bool)

(assert (=> start!73144 (and (array_inv!18461 _values!688) e!473584)))

(declare-fun bm!37571 () Bool)

(declare-fun call!37574 () ListLongMap!9231)

(assert (=> bm!37571 (= call!37574 (getCurrentListMapNoExtraKeys!2689 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848575 () Bool)

(declare-fun res!576279 () Bool)

(assert (=> b!848575 (=> (not res!576279) (not e!473580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848575 (= res!576279 (validMask!0 mask!1196))))

(declare-fun b!848576 () Bool)

(declare-fun e!473581 () Bool)

(assert (=> b!848576 (= e!473581 tp_is_empty!16027)))

(declare-fun b!848577 () Bool)

(declare-fun e!473579 () Bool)

(assert (=> b!848577 (= e!473579 tp_is_empty!16027)))

(declare-fun b!848578 () Bool)

(declare-fun res!576283 () Bool)

(assert (=> b!848578 (=> (not res!576283) (not e!473580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48319 (_ BitVec 32)) Bool)

(assert (=> b!848578 (= res!576283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848579 () Bool)

(declare-fun v!557 () V!26417)

(declare-fun e!473582 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2091 (ListLongMap!9231 tuple2!10460) ListLongMap!9231)

(assert (=> b!848579 (= e!473582 (= call!37573 (+!2091 call!37574 (tuple2!10461 k0!854 v!557))))))

(declare-fun mapIsEmpty!25640 () Bool)

(declare-fun mapRes!25640 () Bool)

(assert (=> mapIsEmpty!25640 mapRes!25640))

(declare-fun b!848580 () Bool)

(declare-fun res!576277 () Bool)

(assert (=> b!848580 (=> (not res!576277) (not e!473580))))

(declare-datatypes ((List!16332 0))(
  ( (Nil!16329) (Cons!16328 (h!17465 (_ BitVec 64)) (t!22695 List!16332)) )
))
(declare-fun arrayNoDuplicates!0 (array!48319 (_ BitVec 32) List!16332) Bool)

(assert (=> b!848580 (= res!576277 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16329))))

(declare-fun b!848581 () Bool)

(assert (=> b!848581 (= e!473582 (= call!37573 call!37574))))

(declare-fun b!848582 () Bool)

(assert (=> b!848582 (= e!473584 (and e!473581 mapRes!25640))))

(declare-fun condMapEmpty!25640 () Bool)

(declare-fun mapDefault!25640 () ValueCell!7574)

(assert (=> b!848582 (= condMapEmpty!25640 (= (arr!23185 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7574)) mapDefault!25640)))))

(declare-fun mapNonEmpty!25640 () Bool)

(declare-fun tp!49178 () Bool)

(assert (=> mapNonEmpty!25640 (= mapRes!25640 (and tp!49178 e!473579))))

(declare-fun mapRest!25640 () (Array (_ BitVec 32) ValueCell!7574))

(declare-fun mapKey!25640 () (_ BitVec 32))

(declare-fun mapValue!25640 () ValueCell!7574)

(assert (=> mapNonEmpty!25640 (= (arr!23185 _values!688) (store mapRest!25640 mapKey!25640 mapValue!25640))))

(declare-fun b!848583 () Bool)

(declare-fun res!576282 () Bool)

(assert (=> b!848583 (=> (not res!576282) (not e!473580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848583 (= res!576282 (validKeyInArray!0 k0!854))))

(declare-fun b!848584 () Bool)

(declare-fun res!576275 () Bool)

(assert (=> b!848584 (=> (not res!576275) (not e!473580))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848584 (= res!576275 (and (= (select (arr!23186 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848585 () Bool)

(declare-fun res!576278 () Bool)

(assert (=> b!848585 (=> (not res!576278) (not e!473580))))

(assert (=> b!848585 (= res!576278 (and (= (size!23626 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23627 _keys!868) (size!23626 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848586 () Bool)

(declare-fun res!576276 () Bool)

(assert (=> b!848586 (=> (not res!576276) (not e!473580))))

(assert (=> b!848586 (= res!576276 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23627 _keys!868))))))

(declare-fun b!848587 () Bool)

(declare-fun e!473583 () Bool)

(assert (=> b!848587 (= e!473580 e!473583)))

(declare-fun res!576280 () Bool)

(assert (=> b!848587 (=> (not res!576280) (not e!473583))))

(assert (=> b!848587 (= res!576280 (= from!1053 i!612))))

(declare-fun lt!382165 () ListLongMap!9231)

(assert (=> b!848587 (= lt!382165 (getCurrentListMapNoExtraKeys!2689 _keys!868 lt!382166 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848587 (= lt!382166 (array!48318 (store (arr!23185 _values!688) i!612 (ValueCellFull!7574 v!557)) (size!23626 _values!688)))))

(declare-fun lt!382163 () ListLongMap!9231)

(assert (=> b!848587 (= lt!382163 (getCurrentListMapNoExtraKeys!2689 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848588 () Bool)

(assert (=> b!848588 (= e!473583 (not true))))

(assert (=> b!848588 e!473582))

(declare-fun c!91789 () Bool)

(assert (=> b!848588 (= c!91789 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28962 0))(
  ( (Unit!28963) )
))
(declare-fun lt!382164 () Unit!28962)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!317 (array!48319 array!48317 (_ BitVec 32) (_ BitVec 32) V!26417 V!26417 (_ BitVec 32) (_ BitVec 64) V!26417 (_ BitVec 32) Int) Unit!28962)

(assert (=> b!848588 (= lt!382164 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!317 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73144 res!576281) b!848575))

(assert (= (and b!848575 res!576279) b!848585))

(assert (= (and b!848585 res!576278) b!848578))

(assert (= (and b!848578 res!576283) b!848580))

(assert (= (and b!848580 res!576277) b!848586))

(assert (= (and b!848586 res!576276) b!848583))

(assert (= (and b!848583 res!576282) b!848584))

(assert (= (and b!848584 res!576275) b!848587))

(assert (= (and b!848587 res!576280) b!848588))

(assert (= (and b!848588 c!91789) b!848579))

(assert (= (and b!848588 (not c!91789)) b!848581))

(assert (= (or b!848579 b!848581) bm!37570))

(assert (= (or b!848579 b!848581) bm!37571))

(assert (= (and b!848582 condMapEmpty!25640) mapIsEmpty!25640))

(assert (= (and b!848582 (not condMapEmpty!25640)) mapNonEmpty!25640))

(get-info :version)

(assert (= (and mapNonEmpty!25640 ((_ is ValueCellFull!7574) mapValue!25640)) b!848577))

(assert (= (and b!848582 ((_ is ValueCellFull!7574) mapDefault!25640)) b!848576))

(assert (= start!73144 b!848582))

(declare-fun m!789965 () Bool)

(assert (=> b!848580 m!789965))

(declare-fun m!789967 () Bool)

(assert (=> b!848588 m!789967))

(declare-fun m!789969 () Bool)

(assert (=> b!848579 m!789969))

(declare-fun m!789971 () Bool)

(assert (=> bm!37570 m!789971))

(declare-fun m!789973 () Bool)

(assert (=> mapNonEmpty!25640 m!789973))

(declare-fun m!789975 () Bool)

(assert (=> b!848587 m!789975))

(declare-fun m!789977 () Bool)

(assert (=> b!848587 m!789977))

(declare-fun m!789979 () Bool)

(assert (=> b!848587 m!789979))

(declare-fun m!789981 () Bool)

(assert (=> b!848583 m!789981))

(declare-fun m!789983 () Bool)

(assert (=> start!73144 m!789983))

(declare-fun m!789985 () Bool)

(assert (=> start!73144 m!789985))

(declare-fun m!789987 () Bool)

(assert (=> b!848584 m!789987))

(declare-fun m!789989 () Bool)

(assert (=> b!848578 m!789989))

(declare-fun m!789991 () Bool)

(assert (=> b!848575 m!789991))

(declare-fun m!789993 () Bool)

(assert (=> bm!37571 m!789993))

(check-sat (not b!848579) (not b!848578) (not start!73144) (not b_next!13891) (not b!848575) (not b!848583) (not b!848587) (not b!848580) (not bm!37570) (not mapNonEmpty!25640) (not b!848588) tp_is_empty!16027 b_and!22987 (not bm!37571))
(check-sat b_and!22987 (not b_next!13891))
