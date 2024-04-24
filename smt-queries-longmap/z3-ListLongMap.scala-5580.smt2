; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73432 () Bool)

(assert start!73432)

(declare-fun b_free!14179 () Bool)

(declare-fun b_next!14179 () Bool)

(assert (=> start!73432 (= b_free!14179 (not b_next!14179))))

(declare-fun tp!50042 () Bool)

(declare-fun b_and!23527 () Bool)

(assert (=> start!73432 (= tp!50042 b_and!23527)))

(declare-fun b!855264 () Bool)

(declare-fun res!580556 () Bool)

(declare-fun e!476991 () Bool)

(assert (=> b!855264 (=> (not res!580556) (not e!476991))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855264 (= res!580556 (validMask!0 mask!1196))))

(declare-fun b!855265 () Bool)

(declare-fun res!580560 () Bool)

(assert (=> b!855265 (=> (not res!580560) (not e!476991))))

(declare-datatypes ((array!48875 0))(
  ( (array!48876 (arr!23464 (Array (_ BitVec 32) (_ BitVec 64))) (size!23905 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48875)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48875 (_ BitVec 32)) Bool)

(assert (=> b!855265 (= res!580560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!26801 0))(
  ( (V!26802 (val!8205 Int)) )
))
(declare-datatypes ((tuple2!10724 0))(
  ( (tuple2!10725 (_1!5373 (_ BitVec 64)) (_2!5373 V!26801)) )
))
(declare-datatypes ((List!16571 0))(
  ( (Nil!16568) (Cons!16567 (h!17704 tuple2!10724) (t!23188 List!16571)) )
))
(declare-datatypes ((ListLongMap!9495 0))(
  ( (ListLongMap!9496 (toList!4763 List!16571)) )
))
(declare-fun call!38437 () ListLongMap!9495)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!38434 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7718 0))(
  ( (ValueCellFull!7718 (v!10630 V!26801)) (EmptyCell!7718) )
))
(declare-datatypes ((array!48877 0))(
  ( (array!48878 (arr!23465 (Array (_ BitVec 32) ValueCell!7718)) (size!23906 (_ BitVec 32))) )
))
(declare-fun lt!385694 () array!48877)

(declare-fun minValue!654 () V!26801)

(declare-fun zeroValue!654 () V!26801)

(declare-fun getCurrentListMapNoExtraKeys!2819 (array!48875 array!48877 (_ BitVec 32) (_ BitVec 32) V!26801 V!26801 (_ BitVec 32) Int) ListLongMap!9495)

(assert (=> bm!38434 (= call!38437 (getCurrentListMapNoExtraKeys!2819 _keys!868 lt!385694 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855267 () Bool)

(declare-fun e!476992 () Bool)

(assert (=> b!855267 (= e!476992 true)))

(declare-fun lt!385687 () V!26801)

(declare-fun lt!385690 () ListLongMap!9495)

(declare-fun lt!385693 () tuple2!10724)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2205 (ListLongMap!9495 tuple2!10724) ListLongMap!9495)

(assert (=> b!855267 (= (+!2205 lt!385690 lt!385693) (+!2205 (+!2205 lt!385690 (tuple2!10725 k0!854 lt!385687)) lt!385693))))

(declare-fun lt!385691 () V!26801)

(assert (=> b!855267 (= lt!385693 (tuple2!10725 k0!854 lt!385691))))

(declare-datatypes ((Unit!29168 0))(
  ( (Unit!29169) )
))
(declare-fun lt!385689 () Unit!29168)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!328 (ListLongMap!9495 (_ BitVec 64) V!26801 V!26801) Unit!29168)

(assert (=> b!855267 (= lt!385689 (addSameAsAddTwiceSameKeyDiffValues!328 lt!385690 k0!854 lt!385687 lt!385691))))

(declare-fun lt!385688 () V!26801)

(declare-fun _values!688 () array!48877)

(declare-fun get!12385 (ValueCell!7718 V!26801) V!26801)

(assert (=> b!855267 (= lt!385687 (get!12385 (select (arr!23465 _values!688) from!1053) lt!385688))))

(declare-fun lt!385692 () ListLongMap!9495)

(assert (=> b!855267 (= lt!385692 (+!2205 lt!385690 (tuple2!10725 (select (arr!23464 _keys!868) from!1053) lt!385691)))))

(declare-fun v!557 () V!26801)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855267 (= lt!385691 (get!12385 (select (store (arr!23465 _values!688) i!612 (ValueCellFull!7718 v!557)) from!1053) lt!385688))))

(declare-fun dynLambda!1075 (Int (_ BitVec 64)) V!26801)

(assert (=> b!855267 (= lt!385688 (dynLambda!1075 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!855267 (= lt!385690 (getCurrentListMapNoExtraKeys!2819 _keys!868 lt!385694 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38438 () ListLongMap!9495)

(declare-fun bm!38435 () Bool)

(assert (=> bm!38435 (= call!38438 (getCurrentListMapNoExtraKeys!2819 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855268 () Bool)

(declare-fun res!580561 () Bool)

(assert (=> b!855268 (=> (not res!580561) (not e!476991))))

(assert (=> b!855268 (= res!580561 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23905 _keys!868))))))

(declare-fun b!855269 () Bool)

(declare-fun res!580552 () Bool)

(assert (=> b!855269 (=> (not res!580552) (not e!476991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855269 (= res!580552 (validKeyInArray!0 k0!854))))

(declare-fun b!855270 () Bool)

(declare-fun res!580557 () Bool)

(assert (=> b!855270 (=> (not res!580557) (not e!476991))))

(assert (=> b!855270 (= res!580557 (and (= (size!23906 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23905 _keys!868) (size!23906 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855271 () Bool)

(declare-fun res!580553 () Bool)

(assert (=> b!855271 (=> (not res!580553) (not e!476991))))

(assert (=> b!855271 (= res!580553 (and (= (select (arr!23464 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26072 () Bool)

(declare-fun mapRes!26072 () Bool)

(declare-fun tp!50041 () Bool)

(declare-fun e!476998 () Bool)

(assert (=> mapNonEmpty!26072 (= mapRes!26072 (and tp!50041 e!476998))))

(declare-fun mapValue!26072 () ValueCell!7718)

(declare-fun mapKey!26072 () (_ BitVec 32))

(declare-fun mapRest!26072 () (Array (_ BitVec 32) ValueCell!7718))

(assert (=> mapNonEmpty!26072 (= (arr!23465 _values!688) (store mapRest!26072 mapKey!26072 mapValue!26072))))

(declare-fun b!855272 () Bool)

(declare-fun e!476996 () Bool)

(assert (=> b!855272 (= e!476996 (= call!38437 (+!2205 call!38438 (tuple2!10725 k0!854 v!557))))))

(declare-fun b!855273 () Bool)

(declare-fun e!476997 () Bool)

(assert (=> b!855273 (= e!476997 (not e!476992))))

(declare-fun res!580554 () Bool)

(assert (=> b!855273 (=> res!580554 e!476992)))

(assert (=> b!855273 (= res!580554 (not (validKeyInArray!0 (select (arr!23464 _keys!868) from!1053))))))

(assert (=> b!855273 e!476996))

(declare-fun c!92221 () Bool)

(assert (=> b!855273 (= c!92221 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385685 () Unit!29168)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!407 (array!48875 array!48877 (_ BitVec 32) (_ BitVec 32) V!26801 V!26801 (_ BitVec 32) (_ BitVec 64) V!26801 (_ BitVec 32) Int) Unit!29168)

(assert (=> b!855273 (= lt!385685 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!407 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855274 () Bool)

(assert (=> b!855274 (= e!476996 (= call!38437 call!38438))))

(declare-fun mapIsEmpty!26072 () Bool)

(assert (=> mapIsEmpty!26072 mapRes!26072))

(declare-fun res!580559 () Bool)

(assert (=> start!73432 (=> (not res!580559) (not e!476991))))

(assert (=> start!73432 (= res!580559 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23905 _keys!868))))))

(assert (=> start!73432 e!476991))

(declare-fun tp_is_empty!16315 () Bool)

(assert (=> start!73432 tp_is_empty!16315))

(assert (=> start!73432 true))

(assert (=> start!73432 tp!50042))

(declare-fun array_inv!18646 (array!48875) Bool)

(assert (=> start!73432 (array_inv!18646 _keys!868)))

(declare-fun e!476993 () Bool)

(declare-fun array_inv!18647 (array!48877) Bool)

(assert (=> start!73432 (and (array_inv!18647 _values!688) e!476993)))

(declare-fun b!855266 () Bool)

(declare-fun e!476995 () Bool)

(assert (=> b!855266 (= e!476993 (and e!476995 mapRes!26072))))

(declare-fun condMapEmpty!26072 () Bool)

(declare-fun mapDefault!26072 () ValueCell!7718)

(assert (=> b!855266 (= condMapEmpty!26072 (= (arr!23465 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7718)) mapDefault!26072)))))

(declare-fun b!855275 () Bool)

(assert (=> b!855275 (= e!476998 tp_is_empty!16315)))

(declare-fun b!855276 () Bool)

(assert (=> b!855276 (= e!476991 e!476997)))

(declare-fun res!580555 () Bool)

(assert (=> b!855276 (=> (not res!580555) (not e!476997))))

(assert (=> b!855276 (= res!580555 (= from!1053 i!612))))

(assert (=> b!855276 (= lt!385692 (getCurrentListMapNoExtraKeys!2819 _keys!868 lt!385694 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!855276 (= lt!385694 (array!48878 (store (arr!23465 _values!688) i!612 (ValueCellFull!7718 v!557)) (size!23906 _values!688)))))

(declare-fun lt!385686 () ListLongMap!9495)

(assert (=> b!855276 (= lt!385686 (getCurrentListMapNoExtraKeys!2819 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855277 () Bool)

(declare-fun res!580558 () Bool)

(assert (=> b!855277 (=> (not res!580558) (not e!476991))))

(declare-datatypes ((List!16572 0))(
  ( (Nil!16569) (Cons!16568 (h!17705 (_ BitVec 64)) (t!23189 List!16572)) )
))
(declare-fun arrayNoDuplicates!0 (array!48875 (_ BitVec 32) List!16572) Bool)

(assert (=> b!855277 (= res!580558 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16569))))

(declare-fun b!855278 () Bool)

(assert (=> b!855278 (= e!476995 tp_is_empty!16315)))

(assert (= (and start!73432 res!580559) b!855264))

(assert (= (and b!855264 res!580556) b!855270))

(assert (= (and b!855270 res!580557) b!855265))

(assert (= (and b!855265 res!580560) b!855277))

(assert (= (and b!855277 res!580558) b!855268))

(assert (= (and b!855268 res!580561) b!855269))

(assert (= (and b!855269 res!580552) b!855271))

(assert (= (and b!855271 res!580553) b!855276))

(assert (= (and b!855276 res!580555) b!855273))

(assert (= (and b!855273 c!92221) b!855272))

(assert (= (and b!855273 (not c!92221)) b!855274))

(assert (= (or b!855272 b!855274) bm!38434))

(assert (= (or b!855272 b!855274) bm!38435))

(assert (= (and b!855273 (not res!580554)) b!855267))

(assert (= (and b!855266 condMapEmpty!26072) mapIsEmpty!26072))

(assert (= (and b!855266 (not condMapEmpty!26072)) mapNonEmpty!26072))

(get-info :version)

(assert (= (and mapNonEmpty!26072 ((_ is ValueCellFull!7718) mapValue!26072)) b!855275))

(assert (= (and b!855266 ((_ is ValueCellFull!7718) mapDefault!26072)) b!855278))

(assert (= start!73432 b!855266))

(declare-fun b_lambda!11725 () Bool)

(assert (=> (not b_lambda!11725) (not b!855267)))

(declare-fun t!23187 () Bool)

(declare-fun tb!4473 () Bool)

(assert (=> (and start!73432 (= defaultEntry!696 defaultEntry!696) t!23187) tb!4473))

(declare-fun result!8565 () Bool)

(assert (=> tb!4473 (= result!8565 tp_is_empty!16315)))

(assert (=> b!855267 t!23187))

(declare-fun b_and!23529 () Bool)

(assert (= b_and!23527 (and (=> t!23187 result!8565) b_and!23529)))

(declare-fun m!797003 () Bool)

(assert (=> b!855267 m!797003))

(declare-fun m!797005 () Bool)

(assert (=> b!855267 m!797005))

(declare-fun m!797007 () Bool)

(assert (=> b!855267 m!797007))

(assert (=> b!855267 m!797003))

(declare-fun m!797009 () Bool)

(assert (=> b!855267 m!797009))

(declare-fun m!797011 () Bool)

(assert (=> b!855267 m!797011))

(declare-fun m!797013 () Bool)

(assert (=> b!855267 m!797013))

(assert (=> b!855267 m!797011))

(declare-fun m!797015 () Bool)

(assert (=> b!855267 m!797015))

(declare-fun m!797017 () Bool)

(assert (=> b!855267 m!797017))

(declare-fun m!797019 () Bool)

(assert (=> b!855267 m!797019))

(assert (=> b!855267 m!797015))

(declare-fun m!797021 () Bool)

(assert (=> b!855267 m!797021))

(declare-fun m!797023 () Bool)

(assert (=> b!855267 m!797023))

(declare-fun m!797025 () Bool)

(assert (=> b!855267 m!797025))

(declare-fun m!797027 () Bool)

(assert (=> b!855267 m!797027))

(declare-fun m!797029 () Bool)

(assert (=> b!855269 m!797029))

(assert (=> bm!38434 m!797007))

(declare-fun m!797031 () Bool)

(assert (=> b!855264 m!797031))

(assert (=> b!855273 m!797025))

(assert (=> b!855273 m!797025))

(declare-fun m!797033 () Bool)

(assert (=> b!855273 m!797033))

(declare-fun m!797035 () Bool)

(assert (=> b!855273 m!797035))

(declare-fun m!797037 () Bool)

(assert (=> b!855272 m!797037))

(declare-fun m!797039 () Bool)

(assert (=> bm!38435 m!797039))

(declare-fun m!797041 () Bool)

(assert (=> mapNonEmpty!26072 m!797041))

(declare-fun m!797043 () Bool)

(assert (=> b!855277 m!797043))

(declare-fun m!797045 () Bool)

(assert (=> start!73432 m!797045))

(declare-fun m!797047 () Bool)

(assert (=> start!73432 m!797047))

(declare-fun m!797049 () Bool)

(assert (=> b!855271 m!797049))

(declare-fun m!797051 () Bool)

(assert (=> b!855276 m!797051))

(assert (=> b!855276 m!797017))

(declare-fun m!797053 () Bool)

(assert (=> b!855276 m!797053))

(declare-fun m!797055 () Bool)

(assert (=> b!855265 m!797055))

(check-sat (not b!855269) (not b!855272) (not b!855273) (not bm!38434) (not start!73432) (not b_lambda!11725) (not b!855277) b_and!23529 tp_is_empty!16315 (not bm!38435) (not b!855267) (not b!855276) (not b!855265) (not mapNonEmpty!26072) (not b_next!14179) (not b!855264))
(check-sat b_and!23529 (not b_next!14179))
