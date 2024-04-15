; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73030 () Bool)

(assert start!73030)

(declare-fun b_free!13963 () Bool)

(declare-fun b_next!13963 () Bool)

(assert (=> start!73030 (= b_free!13963 (not b_next!13963))))

(declare-fun tp!49393 () Bool)

(declare-fun b_and!23059 () Bool)

(assert (=> start!73030 (= tp!49393 b_and!23059)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48401 0))(
  ( (array!48402 (arr!23232 (Array (_ BitVec 32) (_ BitVec 64))) (size!23674 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48401)

(declare-fun bm!37715 () Bool)

(declare-datatypes ((V!26513 0))(
  ( (V!26514 (val!8097 Int)) )
))
(declare-datatypes ((ValueCell!7610 0))(
  ( (ValueCellFull!7610 (v!10516 V!26513)) (EmptyCell!7610) )
))
(declare-datatypes ((array!48403 0))(
  ( (array!48404 (arr!23233 (Array (_ BitVec 32) ValueCell!7610)) (size!23675 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48403)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26513)

(declare-datatypes ((tuple2!10626 0))(
  ( (tuple2!10627 (_1!5324 (_ BitVec 64)) (_2!5324 V!26513)) )
))
(declare-datatypes ((List!16472 0))(
  ( (Nil!16469) (Cons!16468 (h!17599 tuple2!10626) (t!22872 List!16472)) )
))
(declare-datatypes ((ListLongMap!9385 0))(
  ( (ListLongMap!9386 (toList!4708 List!16472)) )
))
(declare-fun call!37718 () ListLongMap!9385)

(declare-fun zeroValue!654 () V!26513)

(declare-fun getCurrentListMapNoExtraKeys!2718 (array!48401 array!48403 (_ BitVec 32) (_ BitVec 32) V!26513 V!26513 (_ BitVec 32) Int) ListLongMap!9385)

(assert (=> bm!37715 (= call!37718 (getCurrentListMapNoExtraKeys!2718 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849046 () Bool)

(declare-fun res!576863 () Bool)

(declare-fun e!473676 () Bool)

(assert (=> b!849046 (=> (not res!576863) (not e!473676))))

(assert (=> b!849046 (= res!576863 (and (= (size!23675 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23674 _keys!868) (size!23675 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849047 () Bool)

(declare-fun e!473671 () Bool)

(declare-fun call!37719 () ListLongMap!9385)

(assert (=> b!849047 (= e!473671 (= call!37719 call!37718))))

(declare-fun mapIsEmpty!25748 () Bool)

(declare-fun mapRes!25748 () Bool)

(assert (=> mapIsEmpty!25748 mapRes!25748))

(declare-fun b!849048 () Bool)

(declare-fun e!473669 () Bool)

(declare-fun tp_is_empty!16099 () Bool)

(assert (=> b!849048 (= e!473669 tp_is_empty!16099)))

(declare-fun b!849049 () Bool)

(declare-fun res!576865 () Bool)

(assert (=> b!849049 (=> (not res!576865) (not e!473676))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849049 (= res!576865 (validKeyInArray!0 k0!854))))

(declare-fun res!576858 () Bool)

(assert (=> start!73030 (=> (not res!576858) (not e!473676))))

(assert (=> start!73030 (= res!576858 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23674 _keys!868))))))

(assert (=> start!73030 e!473676))

(assert (=> start!73030 tp_is_empty!16099))

(assert (=> start!73030 true))

(assert (=> start!73030 tp!49393))

(declare-fun array_inv!18524 (array!48401) Bool)

(assert (=> start!73030 (array_inv!18524 _keys!868)))

(declare-fun e!473675 () Bool)

(declare-fun array_inv!18525 (array!48403) Bool)

(assert (=> start!73030 (and (array_inv!18525 _values!688) e!473675)))

(declare-fun bm!37716 () Bool)

(declare-fun lt!381999 () array!48403)

(assert (=> bm!37716 (= call!37719 (getCurrentListMapNoExtraKeys!2718 _keys!868 lt!381999 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849050 () Bool)

(declare-fun res!576860 () Bool)

(assert (=> b!849050 (=> (not res!576860) (not e!473676))))

(declare-datatypes ((List!16473 0))(
  ( (Nil!16470) (Cons!16469 (h!17600 (_ BitVec 64)) (t!22873 List!16473)) )
))
(declare-fun arrayNoDuplicates!0 (array!48401 (_ BitVec 32) List!16473) Bool)

(assert (=> b!849050 (= res!576860 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16470))))

(declare-fun b!849051 () Bool)

(declare-fun e!473674 () Bool)

(assert (=> b!849051 (= e!473674 true)))

(declare-fun lt!382001 () ListLongMap!9385)

(declare-fun +!2135 (ListLongMap!9385 tuple2!10626) ListLongMap!9385)

(declare-fun get!12236 (ValueCell!7610 V!26513) V!26513)

(declare-fun dynLambda!1001 (Int (_ BitVec 64)) V!26513)

(assert (=> b!849051 (= lt!382001 (+!2135 (getCurrentListMapNoExtraKeys!2718 _keys!868 lt!381999 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10627 (select (arr!23232 _keys!868) from!1053) (get!12236 (select (arr!23233 lt!381999) from!1053) (dynLambda!1001 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849052 () Bool)

(declare-fun res!576861 () Bool)

(assert (=> b!849052 (=> (not res!576861) (not e!473676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849052 (= res!576861 (validMask!0 mask!1196))))

(declare-fun b!849053 () Bool)

(declare-fun e!473670 () Bool)

(assert (=> b!849053 (= e!473676 e!473670)))

(declare-fun res!576864 () Bool)

(assert (=> b!849053 (=> (not res!576864) (not e!473670))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849053 (= res!576864 (= from!1053 i!612))))

(assert (=> b!849053 (= lt!382001 (getCurrentListMapNoExtraKeys!2718 _keys!868 lt!381999 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26513)

(assert (=> b!849053 (= lt!381999 (array!48404 (store (arr!23233 _values!688) i!612 (ValueCellFull!7610 v!557)) (size!23675 _values!688)))))

(declare-fun lt!382000 () ListLongMap!9385)

(assert (=> b!849053 (= lt!382000 (getCurrentListMapNoExtraKeys!2718 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849054 () Bool)

(assert (=> b!849054 (= e!473675 (and e!473669 mapRes!25748))))

(declare-fun condMapEmpty!25748 () Bool)

(declare-fun mapDefault!25748 () ValueCell!7610)

(assert (=> b!849054 (= condMapEmpty!25748 (= (arr!23233 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7610)) mapDefault!25748)))))

(declare-fun b!849055 () Bool)

(declare-fun e!473672 () Bool)

(assert (=> b!849055 (= e!473672 tp_is_empty!16099)))

(declare-fun mapNonEmpty!25748 () Bool)

(declare-fun tp!49394 () Bool)

(assert (=> mapNonEmpty!25748 (= mapRes!25748 (and tp!49394 e!473672))))

(declare-fun mapRest!25748 () (Array (_ BitVec 32) ValueCell!7610))

(declare-fun mapValue!25748 () ValueCell!7610)

(declare-fun mapKey!25748 () (_ BitVec 32))

(assert (=> mapNonEmpty!25748 (= (arr!23233 _values!688) (store mapRest!25748 mapKey!25748 mapValue!25748))))

(declare-fun b!849056 () Bool)

(declare-fun res!576862 () Bool)

(assert (=> b!849056 (=> (not res!576862) (not e!473676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48401 (_ BitVec 32)) Bool)

(assert (=> b!849056 (= res!576862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849057 () Bool)

(declare-fun res!576859 () Bool)

(assert (=> b!849057 (=> (not res!576859) (not e!473676))))

(assert (=> b!849057 (= res!576859 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23674 _keys!868))))))

(declare-fun b!849058 () Bool)

(assert (=> b!849058 (= e!473671 (= call!37719 (+!2135 call!37718 (tuple2!10627 k0!854 v!557))))))

(declare-fun b!849059 () Bool)

(declare-fun res!576867 () Bool)

(assert (=> b!849059 (=> (not res!576867) (not e!473676))))

(assert (=> b!849059 (= res!576867 (and (= (select (arr!23232 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849060 () Bool)

(assert (=> b!849060 (= e!473670 (not e!473674))))

(declare-fun res!576866 () Bool)

(assert (=> b!849060 (=> res!576866 e!473674)))

(assert (=> b!849060 (= res!576866 (not (validKeyInArray!0 (select (arr!23232 _keys!868) from!1053))))))

(assert (=> b!849060 e!473671))

(declare-fun c!91550 () Bool)

(assert (=> b!849060 (= c!91550 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28945 0))(
  ( (Unit!28946) )
))
(declare-fun lt!381998 () Unit!28945)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!347 (array!48401 array!48403 (_ BitVec 32) (_ BitVec 32) V!26513 V!26513 (_ BitVec 32) (_ BitVec 64) V!26513 (_ BitVec 32) Int) Unit!28945)

(assert (=> b!849060 (= lt!381998 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!347 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73030 res!576858) b!849052))

(assert (= (and b!849052 res!576861) b!849046))

(assert (= (and b!849046 res!576863) b!849056))

(assert (= (and b!849056 res!576862) b!849050))

(assert (= (and b!849050 res!576860) b!849057))

(assert (= (and b!849057 res!576859) b!849049))

(assert (= (and b!849049 res!576865) b!849059))

(assert (= (and b!849059 res!576867) b!849053))

(assert (= (and b!849053 res!576864) b!849060))

(assert (= (and b!849060 c!91550) b!849058))

(assert (= (and b!849060 (not c!91550)) b!849047))

(assert (= (or b!849058 b!849047) bm!37716))

(assert (= (or b!849058 b!849047) bm!37715))

(assert (= (and b!849060 (not res!576866)) b!849051))

(assert (= (and b!849054 condMapEmpty!25748) mapIsEmpty!25748))

(assert (= (and b!849054 (not condMapEmpty!25748)) mapNonEmpty!25748))

(get-info :version)

(assert (= (and mapNonEmpty!25748 ((_ is ValueCellFull!7610) mapValue!25748)) b!849055))

(assert (= (and b!849054 ((_ is ValueCellFull!7610) mapDefault!25748)) b!849048))

(assert (= start!73030 b!849054))

(declare-fun b_lambda!11477 () Bool)

(assert (=> (not b_lambda!11477) (not b!849051)))

(declare-fun t!22871 () Bool)

(declare-fun tb!4257 () Bool)

(assert (=> (and start!73030 (= defaultEntry!696 defaultEntry!696) t!22871) tb!4257))

(declare-fun result!8133 () Bool)

(assert (=> tb!4257 (= result!8133 tp_is_empty!16099)))

(assert (=> b!849051 t!22871))

(declare-fun b_and!23061 () Bool)

(assert (= b_and!23059 (and (=> t!22871 result!8133) b_and!23061)))

(declare-fun m!789227 () Bool)

(assert (=> start!73030 m!789227))

(declare-fun m!789229 () Bool)

(assert (=> start!73030 m!789229))

(declare-fun m!789231 () Bool)

(assert (=> b!849053 m!789231))

(declare-fun m!789233 () Bool)

(assert (=> b!849053 m!789233))

(declare-fun m!789235 () Bool)

(assert (=> b!849053 m!789235))

(declare-fun m!789237 () Bool)

(assert (=> mapNonEmpty!25748 m!789237))

(declare-fun m!789239 () Bool)

(assert (=> b!849052 m!789239))

(declare-fun m!789241 () Bool)

(assert (=> b!849051 m!789241))

(declare-fun m!789243 () Bool)

(assert (=> b!849051 m!789243))

(assert (=> b!849051 m!789241))

(declare-fun m!789245 () Bool)

(assert (=> b!849051 m!789245))

(assert (=> b!849051 m!789245))

(declare-fun m!789247 () Bool)

(assert (=> b!849051 m!789247))

(declare-fun m!789249 () Bool)

(assert (=> b!849051 m!789249))

(declare-fun m!789251 () Bool)

(assert (=> b!849051 m!789251))

(assert (=> b!849051 m!789247))

(declare-fun m!789253 () Bool)

(assert (=> b!849058 m!789253))

(declare-fun m!789255 () Bool)

(assert (=> b!849059 m!789255))

(declare-fun m!789257 () Bool)

(assert (=> b!849056 m!789257))

(declare-fun m!789259 () Bool)

(assert (=> b!849049 m!789259))

(assert (=> b!849060 m!789251))

(assert (=> b!849060 m!789251))

(declare-fun m!789261 () Bool)

(assert (=> b!849060 m!789261))

(declare-fun m!789263 () Bool)

(assert (=> b!849060 m!789263))

(assert (=> bm!37716 m!789241))

(declare-fun m!789265 () Bool)

(assert (=> b!849050 m!789265))

(declare-fun m!789267 () Bool)

(assert (=> bm!37715 m!789267))

(check-sat (not mapNonEmpty!25748) (not b!849058) (not b_next!13963) tp_is_empty!16099 (not b!849050) (not b!849053) (not b_lambda!11477) (not b!849049) (not b!849052) (not b!849051) (not bm!37715) (not start!73030) b_and!23061 (not bm!37716) (not b!849056) (not b!849060))
(check-sat b_and!23061 (not b_next!13963))
