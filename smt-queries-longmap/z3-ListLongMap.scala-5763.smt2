; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74408 () Bool)

(assert start!74408)

(declare-fun b_free!15169 () Bool)

(declare-fun b_next!15169 () Bool)

(assert (=> start!74408 (= b_free!15169 (not b_next!15169))))

(declare-fun tp!53185 () Bool)

(declare-fun b_and!24965 () Bool)

(assert (=> start!74408 (= tp!53185 b_and!24965)))

(declare-fun b!876243 () Bool)

(declare-fun e!487768 () Bool)

(declare-datatypes ((V!28265 0))(
  ( (V!28266 (val!8754 Int)) )
))
(declare-datatypes ((tuple2!11582 0))(
  ( (tuple2!11583 (_1!5802 (_ BitVec 64)) (_2!5802 V!28265)) )
))
(declare-datatypes ((List!17386 0))(
  ( (Nil!17383) (Cons!17382 (h!18513 tuple2!11582) (t!24450 List!17386)) )
))
(declare-datatypes ((ListLongMap!10341 0))(
  ( (ListLongMap!10342 (toList!5186 List!17386)) )
))
(declare-fun call!38724 () ListLongMap!10341)

(declare-fun call!38725 () ListLongMap!10341)

(assert (=> b!876243 (= e!487768 (= call!38724 call!38725))))

(declare-fun res!595479 () Bool)

(declare-fun e!487763 () Bool)

(assert (=> start!74408 (=> (not res!595479) (not e!487763))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50931 0))(
  ( (array!50932 (arr!24493 (Array (_ BitVec 32) (_ BitVec 64))) (size!24935 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50931)

(assert (=> start!74408 (= res!595479 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24935 _keys!868))))))

(assert (=> start!74408 e!487763))

(declare-fun tp_is_empty!17413 () Bool)

(assert (=> start!74408 tp_is_empty!17413))

(assert (=> start!74408 true))

(assert (=> start!74408 tp!53185))

(declare-fun array_inv!19352 (array!50931) Bool)

(assert (=> start!74408 (array_inv!19352 _keys!868)))

(declare-datatypes ((ValueCell!8267 0))(
  ( (ValueCellFull!8267 (v!11181 V!28265)) (EmptyCell!8267) )
))
(declare-datatypes ((array!50933 0))(
  ( (array!50934 (arr!24494 (Array (_ BitVec 32) ValueCell!8267)) (size!24936 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50933)

(declare-fun e!487762 () Bool)

(declare-fun array_inv!19353 (array!50933) Bool)

(assert (=> start!74408 (and (array_inv!19353 _values!688) e!487762)))

(declare-fun b!876244 () Bool)

(declare-fun res!595477 () Bool)

(assert (=> b!876244 (=> (not res!595477) (not e!487763))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!876244 (= res!595477 (and (= (select (arr!24493 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876245 () Bool)

(declare-fun res!595473 () Bool)

(assert (=> b!876245 (=> (not res!595473) (not e!487763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876245 (= res!595473 (validKeyInArray!0 k0!854))))

(declare-fun b!876246 () Bool)

(declare-fun e!487767 () Bool)

(assert (=> b!876246 (= e!487767 tp_is_empty!17413)))

(declare-fun b!876247 () Bool)

(declare-fun res!595476 () Bool)

(assert (=> b!876247 (=> (not res!595476) (not e!487763))))

(assert (=> b!876247 (= res!595476 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24935 _keys!868))))))

(declare-fun b!876248 () Bool)

(declare-fun e!487769 () Bool)

(assert (=> b!876248 (= e!487763 e!487769)))

(declare-fun res!595478 () Bool)

(assert (=> b!876248 (=> (not res!595478) (not e!487769))))

(assert (=> b!876248 (= res!595478 (= from!1053 i!612))))

(declare-fun lt!396276 () array!50933)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28265)

(declare-fun zeroValue!654 () V!28265)

(declare-fun lt!396268 () ListLongMap!10341)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3179 (array!50931 array!50933 (_ BitVec 32) (_ BitVec 32) V!28265 V!28265 (_ BitVec 32) Int) ListLongMap!10341)

(assert (=> b!876248 (= lt!396268 (getCurrentListMapNoExtraKeys!3179 _keys!868 lt!396276 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28265)

(assert (=> b!876248 (= lt!396276 (array!50934 (store (arr!24494 _values!688) i!612 (ValueCellFull!8267 v!557)) (size!24936 _values!688)))))

(declare-fun lt!396273 () ListLongMap!10341)

(assert (=> b!876248 (= lt!396273 (getCurrentListMapNoExtraKeys!3179 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27731 () Bool)

(declare-fun mapRes!27731 () Bool)

(assert (=> mapIsEmpty!27731 mapRes!27731))

(declare-fun b!876249 () Bool)

(declare-fun res!595472 () Bool)

(assert (=> b!876249 (=> (not res!595472) (not e!487763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876249 (= res!595472 (validMask!0 mask!1196))))

(declare-fun b!876250 () Bool)

(declare-fun e!487764 () Bool)

(assert (=> b!876250 (= e!487769 (not e!487764))))

(declare-fun res!595474 () Bool)

(assert (=> b!876250 (=> res!595474 e!487764)))

(assert (=> b!876250 (= res!595474 (not (validKeyInArray!0 (select (arr!24493 _keys!868) from!1053))))))

(assert (=> b!876250 e!487768))

(declare-fun c!92538 () Bool)

(assert (=> b!876250 (= c!92538 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29915 0))(
  ( (Unit!29916) )
))
(declare-fun lt!396272 () Unit!29915)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!680 (array!50931 array!50933 (_ BitVec 32) (_ BitVec 32) V!28265 V!28265 (_ BitVec 32) (_ BitVec 64) V!28265 (_ BitVec 32) Int) Unit!29915)

(assert (=> b!876250 (= lt!396272 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!680 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27731 () Bool)

(declare-fun tp!53186 () Bool)

(declare-fun e!487765 () Bool)

(assert (=> mapNonEmpty!27731 (= mapRes!27731 (and tp!53186 e!487765))))

(declare-fun mapValue!27731 () ValueCell!8267)

(declare-fun mapRest!27731 () (Array (_ BitVec 32) ValueCell!8267))

(declare-fun mapKey!27731 () (_ BitVec 32))

(assert (=> mapNonEmpty!27731 (= (arr!24494 _values!688) (store mapRest!27731 mapKey!27731 mapValue!27731))))

(declare-fun b!876251 () Bool)

(declare-fun res!595475 () Bool)

(assert (=> b!876251 (=> (not res!595475) (not e!487763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50931 (_ BitVec 32)) Bool)

(assert (=> b!876251 (= res!595475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876252 () Bool)

(assert (=> b!876252 (= e!487765 tp_is_empty!17413)))

(declare-fun b!876253 () Bool)

(declare-fun res!595471 () Bool)

(assert (=> b!876253 (=> (not res!595471) (not e!487763))))

(declare-datatypes ((List!17387 0))(
  ( (Nil!17384) (Cons!17383 (h!18514 (_ BitVec 64)) (t!24451 List!17387)) )
))
(declare-fun arrayNoDuplicates!0 (array!50931 (_ BitVec 32) List!17387) Bool)

(assert (=> b!876253 (= res!595471 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17384))))

(declare-fun b!876254 () Bool)

(declare-fun res!595470 () Bool)

(assert (=> b!876254 (=> (not res!595470) (not e!487763))))

(assert (=> b!876254 (= res!595470 (and (= (size!24936 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24935 _keys!868) (size!24936 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38721 () Bool)

(assert (=> bm!38721 (= call!38724 (getCurrentListMapNoExtraKeys!3179 _keys!868 lt!396276 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876255 () Bool)

(declare-fun +!2511 (ListLongMap!10341 tuple2!11582) ListLongMap!10341)

(assert (=> b!876255 (= e!487768 (= call!38724 (+!2511 call!38725 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!876256 () Bool)

(assert (=> b!876256 (= e!487764 (bvslt i!612 (size!24936 _values!688)))))

(declare-fun lt!396270 () tuple2!11582)

(declare-fun lt!396274 () V!28265)

(declare-fun lt!396275 () ListLongMap!10341)

(assert (=> b!876256 (= (+!2511 lt!396275 lt!396270) (+!2511 (+!2511 lt!396275 (tuple2!11583 k0!854 lt!396274)) lt!396270))))

(declare-fun lt!396277 () V!28265)

(assert (=> b!876256 (= lt!396270 (tuple2!11583 k0!854 lt!396277))))

(declare-fun lt!396271 () Unit!29915)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!323 (ListLongMap!10341 (_ BitVec 64) V!28265 V!28265) Unit!29915)

(assert (=> b!876256 (= lt!396271 (addSameAsAddTwiceSameKeyDiffValues!323 lt!396275 k0!854 lt!396274 lt!396277))))

(declare-fun lt!396269 () V!28265)

(declare-fun get!12890 (ValueCell!8267 V!28265) V!28265)

(assert (=> b!876256 (= lt!396274 (get!12890 (select (arr!24494 _values!688) from!1053) lt!396269))))

(assert (=> b!876256 (= lt!396268 (+!2511 lt!396275 (tuple2!11583 (select (arr!24493 _keys!868) from!1053) lt!396277)))))

(assert (=> b!876256 (= lt!396277 (get!12890 (select (store (arr!24494 _values!688) i!612 (ValueCellFull!8267 v!557)) from!1053) lt!396269))))

(declare-fun dynLambda!1215 (Int (_ BitVec 64)) V!28265)

(assert (=> b!876256 (= lt!396269 (dynLambda!1215 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!876256 (= lt!396275 (getCurrentListMapNoExtraKeys!3179 _keys!868 lt!396276 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38722 () Bool)

(assert (=> bm!38722 (= call!38725 (getCurrentListMapNoExtraKeys!3179 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876257 () Bool)

(assert (=> b!876257 (= e!487762 (and e!487767 mapRes!27731))))

(declare-fun condMapEmpty!27731 () Bool)

(declare-fun mapDefault!27731 () ValueCell!8267)

(assert (=> b!876257 (= condMapEmpty!27731 (= (arr!24494 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8267)) mapDefault!27731)))))

(assert (= (and start!74408 res!595479) b!876249))

(assert (= (and b!876249 res!595472) b!876254))

(assert (= (and b!876254 res!595470) b!876251))

(assert (= (and b!876251 res!595475) b!876253))

(assert (= (and b!876253 res!595471) b!876247))

(assert (= (and b!876247 res!595476) b!876245))

(assert (= (and b!876245 res!595473) b!876244))

(assert (= (and b!876244 res!595477) b!876248))

(assert (= (and b!876248 res!595478) b!876250))

(assert (= (and b!876250 c!92538) b!876255))

(assert (= (and b!876250 (not c!92538)) b!876243))

(assert (= (or b!876255 b!876243) bm!38721))

(assert (= (or b!876255 b!876243) bm!38722))

(assert (= (and b!876250 (not res!595474)) b!876256))

(assert (= (and b!876257 condMapEmpty!27731) mapIsEmpty!27731))

(assert (= (and b!876257 (not condMapEmpty!27731)) mapNonEmpty!27731))

(get-info :version)

(assert (= (and mapNonEmpty!27731 ((_ is ValueCellFull!8267) mapValue!27731)) b!876252))

(assert (= (and b!876257 ((_ is ValueCellFull!8267) mapDefault!27731)) b!876246))

(assert (= start!74408 b!876257))

(declare-fun b_lambda!12219 () Bool)

(assert (=> (not b_lambda!12219) (not b!876256)))

(declare-fun t!24449 () Bool)

(declare-fun tb!4921 () Bool)

(assert (=> (and start!74408 (= defaultEntry!696 defaultEntry!696) t!24449) tb!4921))

(declare-fun result!9469 () Bool)

(assert (=> tb!4921 (= result!9469 tp_is_empty!17413)))

(assert (=> b!876256 t!24449))

(declare-fun b_and!24967 () Bool)

(assert (= b_and!24965 (and (=> t!24449 result!9469) b_and!24967)))

(declare-fun m!815481 () Bool)

(assert (=> mapNonEmpty!27731 m!815481))

(declare-fun m!815483 () Bool)

(assert (=> b!876245 m!815483))

(declare-fun m!815485 () Bool)

(assert (=> b!876244 m!815485))

(declare-fun m!815487 () Bool)

(assert (=> bm!38722 m!815487))

(declare-fun m!815489 () Bool)

(assert (=> b!876248 m!815489))

(declare-fun m!815491 () Bool)

(assert (=> b!876248 m!815491))

(declare-fun m!815493 () Bool)

(assert (=> b!876248 m!815493))

(declare-fun m!815495 () Bool)

(assert (=> b!876250 m!815495))

(assert (=> b!876250 m!815495))

(declare-fun m!815497 () Bool)

(assert (=> b!876250 m!815497))

(declare-fun m!815499 () Bool)

(assert (=> b!876250 m!815499))

(declare-fun m!815501 () Bool)

(assert (=> b!876253 m!815501))

(declare-fun m!815503 () Bool)

(assert (=> start!74408 m!815503))

(declare-fun m!815505 () Bool)

(assert (=> start!74408 m!815505))

(declare-fun m!815507 () Bool)

(assert (=> bm!38721 m!815507))

(declare-fun m!815509 () Bool)

(assert (=> b!876255 m!815509))

(declare-fun m!815511 () Bool)

(assert (=> b!876256 m!815511))

(declare-fun m!815513 () Bool)

(assert (=> b!876256 m!815513))

(declare-fun m!815515 () Bool)

(assert (=> b!876256 m!815515))

(declare-fun m!815517 () Bool)

(assert (=> b!876256 m!815517))

(declare-fun m!815519 () Bool)

(assert (=> b!876256 m!815519))

(declare-fun m!815521 () Bool)

(assert (=> b!876256 m!815521))

(assert (=> b!876256 m!815511))

(declare-fun m!815523 () Bool)

(assert (=> b!876256 m!815523))

(assert (=> b!876256 m!815507))

(declare-fun m!815525 () Bool)

(assert (=> b!876256 m!815525))

(assert (=> b!876256 m!815517))

(assert (=> b!876256 m!815521))

(declare-fun m!815527 () Bool)

(assert (=> b!876256 m!815527))

(assert (=> b!876256 m!815491))

(assert (=> b!876256 m!815495))

(declare-fun m!815529 () Bool)

(assert (=> b!876256 m!815529))

(declare-fun m!815531 () Bool)

(assert (=> b!876251 m!815531))

(declare-fun m!815533 () Bool)

(assert (=> b!876249 m!815533))

(check-sat (not b!876245) (not b!876255) (not b!876256) (not b!876253) (not b_next!15169) (not b!876249) tp_is_empty!17413 (not mapNonEmpty!27731) (not b!876251) (not start!74408) (not b_lambda!12219) b_and!24967 (not bm!38721) (not b!876250) (not b!876248) (not bm!38722))
(check-sat b_and!24967 (not b_next!15169))
