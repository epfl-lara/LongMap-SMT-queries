; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73978 () Bool)

(assert start!73978)

(declare-fun b_free!14725 () Bool)

(declare-fun b_next!14725 () Bool)

(assert (=> start!73978 (= b_free!14725 (not b_next!14725))))

(declare-fun tp!51679 () Bool)

(declare-fun b_and!24439 () Bool)

(assert (=> start!73978 (= tp!51679 b_and!24439)))

(declare-fun b!867278 () Bool)

(declare-datatypes ((Unit!29690 0))(
  ( (Unit!29691) )
))
(declare-fun e!483195 () Unit!29690)

(declare-fun Unit!29692 () Unit!29690)

(assert (=> b!867278 (= e!483195 Unit!29692)))

(declare-fun b!867279 () Bool)

(declare-fun res!589015 () Bool)

(declare-fun e!483200 () Bool)

(assert (=> b!867279 (=> (not res!589015) (not e!483200))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49933 0))(
  ( (array!49934 (arr!23993 (Array (_ BitVec 32) (_ BitVec 64))) (size!24434 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49933)

(declare-datatypes ((V!27529 0))(
  ( (V!27530 (val!8478 Int)) )
))
(declare-datatypes ((ValueCell!7991 0))(
  ( (ValueCellFull!7991 (v!10903 V!27529)) (EmptyCell!7991) )
))
(declare-datatypes ((array!49935 0))(
  ( (array!49936 (arr!23994 (Array (_ BitVec 32) ValueCell!7991)) (size!24435 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49935)

(assert (=> b!867279 (= res!589015 (and (= (size!24435 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24434 _keys!868) (size!24435 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867280 () Bool)

(declare-fun res!589010 () Bool)

(assert (=> b!867280 (=> (not res!589010) (not e!483200))))

(declare-datatypes ((List!16994 0))(
  ( (Nil!16991) (Cons!16990 (h!18127 (_ BitVec 64)) (t!23977 List!16994)) )
))
(declare-fun arrayNoDuplicates!0 (array!49933 (_ BitVec 32) List!16994) Bool)

(assert (=> b!867280 (= res!589010 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16991))))

(declare-fun b!867281 () Bool)

(declare-fun Unit!29693 () Unit!29690)

(assert (=> b!867281 (= e!483195 Unit!29693)))

(declare-fun lt!393417 () Unit!29690)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49933 (_ BitVec 32) (_ BitVec 32)) Unit!29690)

(assert (=> b!867281 (= lt!393417 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!867281 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16991)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!393412 () Unit!29690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49933 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29690)

(assert (=> b!867281 (= lt!393412 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867281 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393411 () Unit!29690)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49933 (_ BitVec 64) (_ BitVec 32) List!16994) Unit!29690)

(assert (=> b!867281 (= lt!393411 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16991))))

(assert (=> b!867281 false))

(declare-fun b!867282 () Bool)

(declare-fun res!589008 () Bool)

(assert (=> b!867282 (=> (not res!589008) (not e!483200))))

(assert (=> b!867282 (= res!589008 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24434 _keys!868))))))

(declare-fun b!867283 () Bool)

(declare-fun e!483194 () Bool)

(declare-fun tp_is_empty!16861 () Bool)

(assert (=> b!867283 (= e!483194 tp_is_empty!16861)))

(declare-fun b!867284 () Bool)

(declare-fun res!589006 () Bool)

(assert (=> b!867284 (=> (not res!589006) (not e!483200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867284 (= res!589006 (validKeyInArray!0 k0!854))))

(declare-fun b!867285 () Bool)

(declare-fun e!483201 () Bool)

(declare-fun e!483199 () Bool)

(assert (=> b!867285 (= e!483201 e!483199)))

(declare-fun res!589012 () Bool)

(assert (=> b!867285 (=> res!589012 e!483199)))

(assert (=> b!867285 (= res!589012 (= k0!854 (select (arr!23993 _keys!868) from!1053)))))

(assert (=> b!867285 (not (= (select (arr!23993 _keys!868) from!1053) k0!854))))

(declare-fun lt!393416 () Unit!29690)

(assert (=> b!867285 (= lt!393416 e!483195)))

(declare-fun c!92590 () Bool)

(assert (=> b!867285 (= c!92590 (= (select (arr!23993 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11166 0))(
  ( (tuple2!11167 (_1!5594 (_ BitVec 64)) (_2!5594 V!27529)) )
))
(declare-datatypes ((List!16995 0))(
  ( (Nil!16992) (Cons!16991 (h!18128 tuple2!11166) (t!23978 List!16995)) )
))
(declare-datatypes ((ListLongMap!9937 0))(
  ( (ListLongMap!9938 (toList!4984 List!16995)) )
))
(declare-fun lt!393425 () ListLongMap!9937)

(declare-fun lt!393422 () ListLongMap!9937)

(assert (=> b!867285 (= lt!393425 lt!393422)))

(declare-fun lt!393424 () ListLongMap!9937)

(declare-fun lt!393423 () tuple2!11166)

(declare-fun +!2387 (ListLongMap!9937 tuple2!11166) ListLongMap!9937)

(assert (=> b!867285 (= lt!393422 (+!2387 lt!393424 lt!393423))))

(declare-fun lt!393413 () V!27529)

(assert (=> b!867285 (= lt!393423 (tuple2!11167 (select (arr!23993 _keys!868) from!1053) lt!393413))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12700 (ValueCell!7991 V!27529) V!27529)

(declare-fun dynLambda!1208 (Int (_ BitVec 64)) V!27529)

(assert (=> b!867285 (= lt!393413 (get!12700 (select (arr!23994 _values!688) from!1053) (dynLambda!1208 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26891 () Bool)

(declare-fun mapRes!26891 () Bool)

(declare-fun tp!51680 () Bool)

(declare-fun e!483196 () Bool)

(assert (=> mapNonEmpty!26891 (= mapRes!26891 (and tp!51680 e!483196))))

(declare-fun mapKey!26891 () (_ BitVec 32))

(declare-fun mapValue!26891 () ValueCell!7991)

(declare-fun mapRest!26891 () (Array (_ BitVec 32) ValueCell!7991))

(assert (=> mapNonEmpty!26891 (= (arr!23994 _values!688) (store mapRest!26891 mapKey!26891 mapValue!26891))))

(declare-fun b!867286 () Bool)

(assert (=> b!867286 (= e!483199 true)))

(declare-fun lt!393410 () tuple2!11166)

(declare-fun lt!393414 () ListLongMap!9937)

(assert (=> b!867286 (= lt!393422 (+!2387 (+!2387 lt!393414 lt!393423) lt!393410))))

(declare-fun lt!393418 () Unit!29690)

(declare-fun v!557 () V!27529)

(declare-fun addCommutativeForDiffKeys!529 (ListLongMap!9937 (_ BitVec 64) V!27529 (_ BitVec 64) V!27529) Unit!29690)

(assert (=> b!867286 (= lt!393418 (addCommutativeForDiffKeys!529 lt!393414 k0!854 v!557 (select (arr!23993 _keys!868) from!1053) lt!393413))))

(declare-fun mapIsEmpty!26891 () Bool)

(assert (=> mapIsEmpty!26891 mapRes!26891))

(declare-fun res!589009 () Bool)

(assert (=> start!73978 (=> (not res!589009) (not e!483200))))

(assert (=> start!73978 (= res!589009 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24434 _keys!868))))))

(assert (=> start!73978 e!483200))

(assert (=> start!73978 tp_is_empty!16861))

(assert (=> start!73978 true))

(assert (=> start!73978 tp!51679))

(declare-fun array_inv!19018 (array!49933) Bool)

(assert (=> start!73978 (array_inv!19018 _keys!868)))

(declare-fun e!483198 () Bool)

(declare-fun array_inv!19019 (array!49935) Bool)

(assert (=> start!73978 (and (array_inv!19019 _values!688) e!483198)))

(declare-fun b!867287 () Bool)

(declare-fun res!589013 () Bool)

(assert (=> b!867287 (=> (not res!589013) (not e!483200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867287 (= res!589013 (validMask!0 mask!1196))))

(declare-fun b!867288 () Bool)

(declare-fun e!483202 () Bool)

(assert (=> b!867288 (= e!483202 (not e!483201))))

(declare-fun res!589005 () Bool)

(assert (=> b!867288 (=> res!589005 e!483201)))

(assert (=> b!867288 (= res!589005 (not (validKeyInArray!0 (select (arr!23993 _keys!868) from!1053))))))

(declare-fun lt!393419 () ListLongMap!9937)

(assert (=> b!867288 (= lt!393419 lt!393424)))

(assert (=> b!867288 (= lt!393424 (+!2387 lt!393414 lt!393410))))

(declare-fun lt!393421 () array!49935)

(declare-fun minValue!654 () V!27529)

(declare-fun zeroValue!654 () V!27529)

(declare-fun getCurrentListMapNoExtraKeys!3029 (array!49933 array!49935 (_ BitVec 32) (_ BitVec 32) V!27529 V!27529 (_ BitVec 32) Int) ListLongMap!9937)

(assert (=> b!867288 (= lt!393419 (getCurrentListMapNoExtraKeys!3029 _keys!868 lt!393421 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867288 (= lt!393410 (tuple2!11167 k0!854 v!557))))

(assert (=> b!867288 (= lt!393414 (getCurrentListMapNoExtraKeys!3029 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393420 () Unit!29690)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!563 (array!49933 array!49935 (_ BitVec 32) (_ BitVec 32) V!27529 V!27529 (_ BitVec 32) (_ BitVec 64) V!27529 (_ BitVec 32) Int) Unit!29690)

(assert (=> b!867288 (= lt!393420 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!563 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867289 () Bool)

(assert (=> b!867289 (= e!483196 tp_is_empty!16861)))

(declare-fun b!867290 () Bool)

(assert (=> b!867290 (= e!483200 e!483202)))

(declare-fun res!589011 () Bool)

(assert (=> b!867290 (=> (not res!589011) (not e!483202))))

(assert (=> b!867290 (= res!589011 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!867290 (= lt!393425 (getCurrentListMapNoExtraKeys!3029 _keys!868 lt!393421 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867290 (= lt!393421 (array!49936 (store (arr!23994 _values!688) i!612 (ValueCellFull!7991 v!557)) (size!24435 _values!688)))))

(declare-fun lt!393415 () ListLongMap!9937)

(assert (=> b!867290 (= lt!393415 (getCurrentListMapNoExtraKeys!3029 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867291 () Bool)

(declare-fun res!589014 () Bool)

(assert (=> b!867291 (=> (not res!589014) (not e!483200))))

(assert (=> b!867291 (= res!589014 (and (= (select (arr!23993 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867292 () Bool)

(assert (=> b!867292 (= e!483198 (and e!483194 mapRes!26891))))

(declare-fun condMapEmpty!26891 () Bool)

(declare-fun mapDefault!26891 () ValueCell!7991)

(assert (=> b!867292 (= condMapEmpty!26891 (= (arr!23994 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7991)) mapDefault!26891)))))

(declare-fun b!867293 () Bool)

(declare-fun res!589007 () Bool)

(assert (=> b!867293 (=> (not res!589007) (not e!483200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49933 (_ BitVec 32)) Bool)

(assert (=> b!867293 (= res!589007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73978 res!589009) b!867287))

(assert (= (and b!867287 res!589013) b!867279))

(assert (= (and b!867279 res!589015) b!867293))

(assert (= (and b!867293 res!589007) b!867280))

(assert (= (and b!867280 res!589010) b!867282))

(assert (= (and b!867282 res!589008) b!867284))

(assert (= (and b!867284 res!589006) b!867291))

(assert (= (and b!867291 res!589014) b!867290))

(assert (= (and b!867290 res!589011) b!867288))

(assert (= (and b!867288 (not res!589005)) b!867285))

(assert (= (and b!867285 c!92590) b!867281))

(assert (= (and b!867285 (not c!92590)) b!867278))

(assert (= (and b!867285 (not res!589012)) b!867286))

(assert (= (and b!867292 condMapEmpty!26891) mapIsEmpty!26891))

(assert (= (and b!867292 (not condMapEmpty!26891)) mapNonEmpty!26891))

(get-info :version)

(assert (= (and mapNonEmpty!26891 ((_ is ValueCellFull!7991) mapValue!26891)) b!867289))

(assert (= (and b!867292 ((_ is ValueCellFull!7991) mapDefault!26891)) b!867283))

(assert (= start!73978 b!867292))

(declare-fun b_lambda!12091 () Bool)

(assert (=> (not b_lambda!12091) (not b!867285)))

(declare-fun t!23976 () Bool)

(declare-fun tb!4839 () Bool)

(assert (=> (and start!73978 (= defaultEntry!696 defaultEntry!696) t!23976) tb!4839))

(declare-fun result!9297 () Bool)

(assert (=> tb!4839 (= result!9297 tp_is_empty!16861)))

(assert (=> b!867285 t!23976))

(declare-fun b_and!24441 () Bool)

(assert (= b_and!24439 (and (=> t!23976 result!9297) b_and!24441)))

(declare-fun m!809315 () Bool)

(assert (=> b!867284 m!809315))

(declare-fun m!809317 () Bool)

(assert (=> start!73978 m!809317))

(declare-fun m!809319 () Bool)

(assert (=> start!73978 m!809319))

(declare-fun m!809321 () Bool)

(assert (=> mapNonEmpty!26891 m!809321))

(declare-fun m!809323 () Bool)

(assert (=> b!867293 m!809323))

(declare-fun m!809325 () Bool)

(assert (=> b!867287 m!809325))

(declare-fun m!809327 () Bool)

(assert (=> b!867290 m!809327))

(declare-fun m!809329 () Bool)

(assert (=> b!867290 m!809329))

(declare-fun m!809331 () Bool)

(assert (=> b!867290 m!809331))

(declare-fun m!809333 () Bool)

(assert (=> b!867286 m!809333))

(assert (=> b!867286 m!809333))

(declare-fun m!809335 () Bool)

(assert (=> b!867286 m!809335))

(declare-fun m!809337 () Bool)

(assert (=> b!867286 m!809337))

(assert (=> b!867286 m!809337))

(declare-fun m!809339 () Bool)

(assert (=> b!867286 m!809339))

(declare-fun m!809341 () Bool)

(assert (=> b!867280 m!809341))

(declare-fun m!809343 () Bool)

(assert (=> b!867281 m!809343))

(declare-fun m!809345 () Bool)

(assert (=> b!867281 m!809345))

(declare-fun m!809347 () Bool)

(assert (=> b!867281 m!809347))

(declare-fun m!809349 () Bool)

(assert (=> b!867281 m!809349))

(declare-fun m!809351 () Bool)

(assert (=> b!867281 m!809351))

(declare-fun m!809353 () Bool)

(assert (=> b!867288 m!809353))

(assert (=> b!867288 m!809337))

(declare-fun m!809355 () Bool)

(assert (=> b!867288 m!809355))

(declare-fun m!809357 () Bool)

(assert (=> b!867288 m!809357))

(declare-fun m!809359 () Bool)

(assert (=> b!867288 m!809359))

(assert (=> b!867288 m!809337))

(declare-fun m!809361 () Bool)

(assert (=> b!867288 m!809361))

(declare-fun m!809363 () Bool)

(assert (=> b!867285 m!809363))

(declare-fun m!809365 () Bool)

(assert (=> b!867285 m!809365))

(declare-fun m!809367 () Bool)

(assert (=> b!867285 m!809367))

(declare-fun m!809369 () Bool)

(assert (=> b!867285 m!809369))

(assert (=> b!867285 m!809365))

(assert (=> b!867285 m!809337))

(assert (=> b!867285 m!809367))

(declare-fun m!809371 () Bool)

(assert (=> b!867291 m!809371))

(check-sat (not b!867287) (not b!867281) (not mapNonEmpty!26891) (not b!867290) (not b_lambda!12091) (not b!867293) (not b!867284) (not b_next!14725) (not b!867285) (not b!867286) (not b!867280) (not start!73978) (not b!867288) tp_is_empty!16861 b_and!24441)
(check-sat b_and!24441 (not b_next!14725))
