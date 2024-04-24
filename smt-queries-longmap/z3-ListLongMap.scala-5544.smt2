; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73216 () Bool)

(assert start!73216)

(declare-fun b_free!13963 () Bool)

(declare-fun b_next!13963 () Bool)

(assert (=> start!73216 (= b_free!13963 (not b_next!13963))))

(declare-fun tp!49393 () Bool)

(declare-fun b_and!23095 () Bool)

(assert (=> start!73216 (= tp!49393 b_and!23095)))

(declare-fun b!850188 () Bool)

(declare-fun res!577312 () Bool)

(declare-fun e!474404 () Bool)

(assert (=> b!850188 (=> (not res!577312) (not e!474404))))

(declare-datatypes ((array!48455 0))(
  ( (array!48456 (arr!23254 (Array (_ BitVec 32) (_ BitVec 64))) (size!23695 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48455)

(declare-datatypes ((List!16393 0))(
  ( (Nil!16390) (Cons!16389 (h!17526 (_ BitVec 64)) (t!22794 List!16393)) )
))
(declare-fun arrayNoDuplicates!0 (array!48455 (_ BitVec 32) List!16393) Bool)

(assert (=> b!850188 (= res!577312 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16390))))

(declare-datatypes ((V!26513 0))(
  ( (V!26514 (val!8097 Int)) )
))
(declare-datatypes ((ValueCell!7610 0))(
  ( (ValueCellFull!7610 (v!10522 V!26513)) (EmptyCell!7610) )
))
(declare-datatypes ((array!48457 0))(
  ( (array!48458 (arr!23255 (Array (_ BitVec 32) ValueCell!7610)) (size!23696 (_ BitVec 32))) )
))
(declare-fun lt!382597 () array!48457)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10526 0))(
  ( (tuple2!10527 (_1!5274 (_ BitVec 64)) (_2!5274 V!26513)) )
))
(declare-datatypes ((List!16394 0))(
  ( (Nil!16391) (Cons!16390 (h!17527 tuple2!10526) (t!22795 List!16394)) )
))
(declare-datatypes ((ListLongMap!9297 0))(
  ( (ListLongMap!9298 (toList!4664 List!16394)) )
))
(declare-fun call!37790 () ListLongMap!9297)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37786 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26513)

(declare-fun zeroValue!654 () V!26513)

(declare-fun getCurrentListMapNoExtraKeys!2722 (array!48455 array!48457 (_ BitVec 32) (_ BitVec 32) V!26513 V!26513 (_ BitVec 32) Int) ListLongMap!9297)

(assert (=> bm!37786 (= call!37790 (getCurrentListMapNoExtraKeys!2722 _keys!868 lt!382597 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577314 () Bool)

(assert (=> start!73216 (=> (not res!577314) (not e!474404))))

(assert (=> start!73216 (= res!577314 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23695 _keys!868))))))

(assert (=> start!73216 e!474404))

(declare-fun tp_is_empty!16099 () Bool)

(assert (=> start!73216 tp_is_empty!16099))

(assert (=> start!73216 true))

(assert (=> start!73216 tp!49393))

(declare-fun array_inv!18512 (array!48455) Bool)

(assert (=> start!73216 (array_inv!18512 _keys!868)))

(declare-fun _values!688 () array!48457)

(declare-fun e!474403 () Bool)

(declare-fun array_inv!18513 (array!48457) Bool)

(assert (=> start!73216 (and (array_inv!18513 _values!688) e!474403)))

(declare-fun b!850189 () Bool)

(declare-fun e!474399 () Bool)

(declare-fun call!37789 () ListLongMap!9297)

(assert (=> b!850189 (= e!474399 (= call!37790 call!37789))))

(declare-fun b!850190 () Bool)

(declare-fun res!577320 () Bool)

(assert (=> b!850190 (=> (not res!577320) (not e!474404))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850190 (= res!577320 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23695 _keys!868))))))

(declare-fun b!850191 () Bool)

(declare-fun res!577321 () Bool)

(assert (=> b!850191 (=> (not res!577321) (not e!474404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850191 (= res!577321 (validMask!0 mask!1196))))

(declare-fun v!557 () V!26513)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!850192 () Bool)

(declare-fun +!2117 (ListLongMap!9297 tuple2!10526) ListLongMap!9297)

(assert (=> b!850192 (= e!474399 (= call!37790 (+!2117 call!37789 (tuple2!10527 k0!854 v!557))))))

(declare-fun bm!37787 () Bool)

(assert (=> bm!37787 (= call!37789 (getCurrentListMapNoExtraKeys!2722 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850193 () Bool)

(declare-fun res!577319 () Bool)

(assert (=> b!850193 (=> (not res!577319) (not e!474404))))

(assert (=> b!850193 (= res!577319 (and (= (select (arr!23254 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850194 () Bool)

(declare-fun e!474402 () Bool)

(assert (=> b!850194 (= e!474402 tp_is_empty!16099)))

(declare-fun mapIsEmpty!25748 () Bool)

(declare-fun mapRes!25748 () Bool)

(assert (=> mapIsEmpty!25748 mapRes!25748))

(declare-fun b!850195 () Bool)

(declare-fun e!474401 () Bool)

(assert (=> b!850195 (= e!474401 true)))

(declare-fun lt!382596 () ListLongMap!9297)

(declare-fun get!12234 (ValueCell!7610 V!26513) V!26513)

(declare-fun dynLambda!996 (Int (_ BitVec 64)) V!26513)

(assert (=> b!850195 (= lt!382596 (+!2117 (getCurrentListMapNoExtraKeys!2722 _keys!868 lt!382597 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10527 (select (arr!23254 _keys!868) from!1053) (get!12234 (select (arr!23255 lt!382597) from!1053) (dynLambda!996 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!850196 () Bool)

(declare-fun res!577315 () Bool)

(assert (=> b!850196 (=> (not res!577315) (not e!474404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850196 (= res!577315 (validKeyInArray!0 k0!854))))

(declare-fun b!850197 () Bool)

(declare-fun e!474406 () Bool)

(assert (=> b!850197 (= e!474403 (and e!474406 mapRes!25748))))

(declare-fun condMapEmpty!25748 () Bool)

(declare-fun mapDefault!25748 () ValueCell!7610)

(assert (=> b!850197 (= condMapEmpty!25748 (= (arr!23255 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7610)) mapDefault!25748)))))

(declare-fun b!850198 () Bool)

(declare-fun e!474405 () Bool)

(assert (=> b!850198 (= e!474404 e!474405)))

(declare-fun res!577316 () Bool)

(assert (=> b!850198 (=> (not res!577316) (not e!474405))))

(assert (=> b!850198 (= res!577316 (= from!1053 i!612))))

(assert (=> b!850198 (= lt!382596 (getCurrentListMapNoExtraKeys!2722 _keys!868 lt!382597 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850198 (= lt!382597 (array!48458 (store (arr!23255 _values!688) i!612 (ValueCellFull!7610 v!557)) (size!23696 _values!688)))))

(declare-fun lt!382598 () ListLongMap!9297)

(assert (=> b!850198 (= lt!382598 (getCurrentListMapNoExtraKeys!2722 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850199 () Bool)

(assert (=> b!850199 (= e!474406 tp_is_empty!16099)))

(declare-fun b!850200 () Bool)

(declare-fun res!577317 () Bool)

(assert (=> b!850200 (=> (not res!577317) (not e!474404))))

(assert (=> b!850200 (= res!577317 (and (= (size!23696 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23695 _keys!868) (size!23696 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25748 () Bool)

(declare-fun tp!49394 () Bool)

(assert (=> mapNonEmpty!25748 (= mapRes!25748 (and tp!49394 e!474402))))

(declare-fun mapKey!25748 () (_ BitVec 32))

(declare-fun mapRest!25748 () (Array (_ BitVec 32) ValueCell!7610))

(declare-fun mapValue!25748 () ValueCell!7610)

(assert (=> mapNonEmpty!25748 (= (arr!23255 _values!688) (store mapRest!25748 mapKey!25748 mapValue!25748))))

(declare-fun b!850201 () Bool)

(declare-fun res!577313 () Bool)

(assert (=> b!850201 (=> (not res!577313) (not e!474404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48455 (_ BitVec 32)) Bool)

(assert (=> b!850201 (= res!577313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850202 () Bool)

(assert (=> b!850202 (= e!474405 (not e!474401))))

(declare-fun res!577318 () Bool)

(assert (=> b!850202 (=> res!577318 e!474401)))

(assert (=> b!850202 (= res!577318 (not (validKeyInArray!0 (select (arr!23254 _keys!868) from!1053))))))

(assert (=> b!850202 e!474399))

(declare-fun c!91897 () Bool)

(assert (=> b!850202 (= c!91897 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29000 0))(
  ( (Unit!29001) )
))
(declare-fun lt!382595 () Unit!29000)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!336 (array!48455 array!48457 (_ BitVec 32) (_ BitVec 32) V!26513 V!26513 (_ BitVec 32) (_ BitVec 64) V!26513 (_ BitVec 32) Int) Unit!29000)

(assert (=> b!850202 (= lt!382595 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!336 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73216 res!577314) b!850191))

(assert (= (and b!850191 res!577321) b!850200))

(assert (= (and b!850200 res!577317) b!850201))

(assert (= (and b!850201 res!577313) b!850188))

(assert (= (and b!850188 res!577312) b!850190))

(assert (= (and b!850190 res!577320) b!850196))

(assert (= (and b!850196 res!577315) b!850193))

(assert (= (and b!850193 res!577319) b!850198))

(assert (= (and b!850198 res!577316) b!850202))

(assert (= (and b!850202 c!91897) b!850192))

(assert (= (and b!850202 (not c!91897)) b!850189))

(assert (= (or b!850192 b!850189) bm!37786))

(assert (= (or b!850192 b!850189) bm!37787))

(assert (= (and b!850202 (not res!577318)) b!850195))

(assert (= (and b!850197 condMapEmpty!25748) mapIsEmpty!25748))

(assert (= (and b!850197 (not condMapEmpty!25748)) mapNonEmpty!25748))

(get-info :version)

(assert (= (and mapNonEmpty!25748 ((_ is ValueCellFull!7610) mapValue!25748)) b!850194))

(assert (= (and b!850197 ((_ is ValueCellFull!7610) mapDefault!25748)) b!850199))

(assert (= start!73216 b!850197))

(declare-fun b_lambda!11509 () Bool)

(assert (=> (not b_lambda!11509) (not b!850195)))

(declare-fun t!22793 () Bool)

(declare-fun tb!4257 () Bool)

(assert (=> (and start!73216 (= defaultEntry!696 defaultEntry!696) t!22793) tb!4257))

(declare-fun result!8133 () Bool)

(assert (=> tb!4257 (= result!8133 tp_is_empty!16099)))

(assert (=> b!850195 t!22793))

(declare-fun b_and!23097 () Bool)

(assert (= b_and!23095 (and (=> t!22793 result!8133) b_and!23097)))

(declare-fun m!791275 () Bool)

(assert (=> b!850195 m!791275))

(assert (=> b!850195 m!791275))

(declare-fun m!791277 () Bool)

(assert (=> b!850195 m!791277))

(declare-fun m!791279 () Bool)

(assert (=> b!850195 m!791279))

(declare-fun m!791281 () Bool)

(assert (=> b!850195 m!791281))

(assert (=> b!850195 m!791281))

(declare-fun m!791283 () Bool)

(assert (=> b!850195 m!791283))

(declare-fun m!791285 () Bool)

(assert (=> b!850195 m!791285))

(assert (=> b!850195 m!791277))

(declare-fun m!791287 () Bool)

(assert (=> b!850196 m!791287))

(declare-fun m!791289 () Bool)

(assert (=> b!850201 m!791289))

(declare-fun m!791291 () Bool)

(assert (=> start!73216 m!791291))

(declare-fun m!791293 () Bool)

(assert (=> start!73216 m!791293))

(assert (=> b!850202 m!791285))

(assert (=> b!850202 m!791285))

(declare-fun m!791295 () Bool)

(assert (=> b!850202 m!791295))

(declare-fun m!791297 () Bool)

(assert (=> b!850202 m!791297))

(declare-fun m!791299 () Bool)

(assert (=> b!850192 m!791299))

(declare-fun m!791301 () Bool)

(assert (=> b!850188 m!791301))

(declare-fun m!791303 () Bool)

(assert (=> b!850193 m!791303))

(assert (=> bm!37786 m!791281))

(declare-fun m!791305 () Bool)

(assert (=> b!850191 m!791305))

(declare-fun m!791307 () Bool)

(assert (=> mapNonEmpty!25748 m!791307))

(declare-fun m!791309 () Bool)

(assert (=> bm!37787 m!791309))

(declare-fun m!791311 () Bool)

(assert (=> b!850198 m!791311))

(declare-fun m!791313 () Bool)

(assert (=> b!850198 m!791313))

(declare-fun m!791315 () Bool)

(assert (=> b!850198 m!791315))

(check-sat (not start!73216) (not b!850201) b_and!23097 (not mapNonEmpty!25748) (not bm!37787) (not bm!37786) (not b!850198) (not b!850195) (not b_lambda!11509) (not b!850188) (not b!850192) (not b!850196) tp_is_empty!16099 (not b!850202) (not b_next!13963) (not b!850191))
(check-sat b_and!23097 (not b_next!13963))
