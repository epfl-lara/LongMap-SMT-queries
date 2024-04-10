; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73608 () Bool)

(assert start!73608)

(declare-fun b_free!14523 () Bool)

(declare-fun b_next!14523 () Bool)

(assert (=> start!73608 (= b_free!14523 (not b_next!14523))))

(declare-fun tp!51073 () Bool)

(declare-fun b_and!24025 () Bool)

(assert (=> start!73608 (= tp!51073 b_and!24025)))

(declare-fun b!861374 () Bool)

(declare-fun res!585384 () Bool)

(declare-fun e!479937 () Bool)

(assert (=> b!861374 (=> (not res!585384) (not e!479937))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861374 (= res!585384 (validMask!0 mask!1196))))

(declare-fun b!861375 () Bool)

(declare-fun res!585380 () Bool)

(assert (=> b!861375 (=> (not res!585380) (not e!479937))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861375 (= res!585380 (validKeyInArray!0 k0!854))))

(declare-fun b!861376 () Bool)

(declare-datatypes ((Unit!29378 0))(
  ( (Unit!29379) )
))
(declare-fun e!479934 () Unit!29378)

(declare-fun Unit!29380 () Unit!29378)

(assert (=> b!861376 (= e!479934 Unit!29380)))

(declare-fun lt!388455 () Unit!29378)

(declare-datatypes ((array!49484 0))(
  ( (array!49485 (arr!23773 (Array (_ BitVec 32) (_ BitVec 64))) (size!24213 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49484)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49484 (_ BitVec 32) (_ BitVec 32)) Unit!29378)

(assert (=> b!861376 (= lt!388455 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16880 0))(
  ( (Nil!16877) (Cons!16876 (h!18007 (_ BitVec 64)) (t!23669 List!16880)) )
))
(declare-fun arrayNoDuplicates!0 (array!49484 (_ BitVec 32) List!16880) Bool)

(assert (=> b!861376 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16877)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388451 () Unit!29378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29378)

(assert (=> b!861376 (= lt!388451 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861376 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388454 () Unit!29378)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49484 (_ BitVec 64) (_ BitVec 32) List!16880) Unit!29378)

(assert (=> b!861376 (= lt!388454 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16877))))

(assert (=> b!861376 false))

(declare-fun b!861377 () Bool)

(declare-fun e!479939 () Bool)

(declare-fun tp_is_empty!16659 () Bool)

(assert (=> b!861377 (= e!479939 tp_is_empty!16659)))

(declare-fun b!861378 () Bool)

(declare-fun e!479940 () Bool)

(assert (=> b!861378 (= e!479937 e!479940)))

(declare-fun res!585378 () Bool)

(assert (=> b!861378 (=> (not res!585378) (not e!479940))))

(assert (=> b!861378 (= res!585378 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27259 0))(
  ( (V!27260 (val!8377 Int)) )
))
(declare-datatypes ((tuple2!11070 0))(
  ( (tuple2!11071 (_1!5546 (_ BitVec 64)) (_2!5546 V!27259)) )
))
(declare-datatypes ((List!16881 0))(
  ( (Nil!16878) (Cons!16877 (h!18008 tuple2!11070) (t!23670 List!16881)) )
))
(declare-datatypes ((ListLongMap!9839 0))(
  ( (ListLongMap!9840 (toList!4935 List!16881)) )
))
(declare-fun lt!388450 () ListLongMap!9839)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27259)

(declare-fun zeroValue!654 () V!27259)

(declare-datatypes ((ValueCell!7890 0))(
  ( (ValueCellFull!7890 (v!10802 V!27259)) (EmptyCell!7890) )
))
(declare-datatypes ((array!49486 0))(
  ( (array!49487 (arr!23774 (Array (_ BitVec 32) ValueCell!7890)) (size!24214 (_ BitVec 32))) )
))
(declare-fun lt!388448 () array!49486)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2912 (array!49484 array!49486 (_ BitVec 32) (_ BitVec 32) V!27259 V!27259 (_ BitVec 32) Int) ListLongMap!9839)

(assert (=> b!861378 (= lt!388450 (getCurrentListMapNoExtraKeys!2912 _keys!868 lt!388448 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27259)

(declare-fun _values!688 () array!49486)

(assert (=> b!861378 (= lt!388448 (array!49487 (store (arr!23774 _values!688) i!612 (ValueCellFull!7890 v!557)) (size!24214 _values!688)))))

(declare-fun lt!388446 () ListLongMap!9839)

(assert (=> b!861378 (= lt!388446 (getCurrentListMapNoExtraKeys!2912 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861379 () Bool)

(declare-fun res!585385 () Bool)

(assert (=> b!861379 (=> (not res!585385) (not e!479937))))

(assert (=> b!861379 (= res!585385 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24213 _keys!868))))))

(declare-fun mapNonEmpty!26588 () Bool)

(declare-fun mapRes!26588 () Bool)

(declare-fun tp!51072 () Bool)

(assert (=> mapNonEmpty!26588 (= mapRes!26588 (and tp!51072 e!479939))))

(declare-fun mapValue!26588 () ValueCell!7890)

(declare-fun mapKey!26588 () (_ BitVec 32))

(declare-fun mapRest!26588 () (Array (_ BitVec 32) ValueCell!7890))

(assert (=> mapNonEmpty!26588 (= (arr!23774 _values!688) (store mapRest!26588 mapKey!26588 mapValue!26588))))

(declare-fun b!861381 () Bool)

(declare-fun e!479936 () Bool)

(assert (=> b!861381 (= e!479936 true)))

(assert (=> b!861381 (not (= (select (arr!23773 _keys!868) from!1053) k0!854))))

(declare-fun lt!388447 () Unit!29378)

(assert (=> b!861381 (= lt!388447 e!479934)))

(declare-fun c!92005 () Bool)

(assert (=> b!861381 (= c!92005 (= (select (arr!23773 _keys!868) from!1053) k0!854))))

(declare-fun lt!388453 () ListLongMap!9839)

(declare-fun +!2286 (ListLongMap!9839 tuple2!11070) ListLongMap!9839)

(declare-fun get!12540 (ValueCell!7890 V!27259) V!27259)

(declare-fun dynLambda!1122 (Int (_ BitVec 64)) V!27259)

(assert (=> b!861381 (= lt!388450 (+!2286 lt!388453 (tuple2!11071 (select (arr!23773 _keys!868) from!1053) (get!12540 (select (arr!23774 _values!688) from!1053) (dynLambda!1122 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!585381 () Bool)

(assert (=> start!73608 (=> (not res!585381) (not e!479937))))

(assert (=> start!73608 (= res!585381 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24213 _keys!868))))))

(assert (=> start!73608 e!479937))

(assert (=> start!73608 tp_is_empty!16659))

(assert (=> start!73608 true))

(assert (=> start!73608 tp!51073))

(declare-fun array_inv!18814 (array!49484) Bool)

(assert (=> start!73608 (array_inv!18814 _keys!868)))

(declare-fun e!479941 () Bool)

(declare-fun array_inv!18815 (array!49486) Bool)

(assert (=> start!73608 (and (array_inv!18815 _values!688) e!479941)))

(declare-fun b!861380 () Bool)

(declare-fun res!585377 () Bool)

(assert (=> b!861380 (=> (not res!585377) (not e!479937))))

(assert (=> b!861380 (= res!585377 (and (= (select (arr!23773 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861382 () Bool)

(assert (=> b!861382 (= e!479940 (not e!479936))))

(declare-fun res!585386 () Bool)

(assert (=> b!861382 (=> res!585386 e!479936)))

(assert (=> b!861382 (= res!585386 (not (validKeyInArray!0 (select (arr!23773 _keys!868) from!1053))))))

(declare-fun lt!388449 () ListLongMap!9839)

(assert (=> b!861382 (= lt!388449 lt!388453)))

(declare-fun lt!388456 () ListLongMap!9839)

(assert (=> b!861382 (= lt!388453 (+!2286 lt!388456 (tuple2!11071 k0!854 v!557)))))

(assert (=> b!861382 (= lt!388449 (getCurrentListMapNoExtraKeys!2912 _keys!868 lt!388448 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861382 (= lt!388456 (getCurrentListMapNoExtraKeys!2912 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388452 () Unit!29378)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!497 (array!49484 array!49486 (_ BitVec 32) (_ BitVec 32) V!27259 V!27259 (_ BitVec 32) (_ BitVec 64) V!27259 (_ BitVec 32) Int) Unit!29378)

(assert (=> b!861382 (= lt!388452 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!497 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861383 () Bool)

(declare-fun res!585382 () Bool)

(assert (=> b!861383 (=> (not res!585382) (not e!479937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49484 (_ BitVec 32)) Bool)

(assert (=> b!861383 (= res!585382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861384 () Bool)

(declare-fun res!585379 () Bool)

(assert (=> b!861384 (=> (not res!585379) (not e!479937))))

(assert (=> b!861384 (= res!585379 (and (= (size!24214 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24213 _keys!868) (size!24214 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861385 () Bool)

(declare-fun res!585383 () Bool)

(assert (=> b!861385 (=> (not res!585383) (not e!479937))))

(assert (=> b!861385 (= res!585383 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16877))))

(declare-fun b!861386 () Bool)

(declare-fun e!479938 () Bool)

(assert (=> b!861386 (= e!479938 tp_is_empty!16659)))

(declare-fun b!861387 () Bool)

(declare-fun Unit!29381 () Unit!29378)

(assert (=> b!861387 (= e!479934 Unit!29381)))

(declare-fun b!861388 () Bool)

(assert (=> b!861388 (= e!479941 (and e!479938 mapRes!26588))))

(declare-fun condMapEmpty!26588 () Bool)

(declare-fun mapDefault!26588 () ValueCell!7890)

(assert (=> b!861388 (= condMapEmpty!26588 (= (arr!23774 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7890)) mapDefault!26588)))))

(declare-fun mapIsEmpty!26588 () Bool)

(assert (=> mapIsEmpty!26588 mapRes!26588))

(assert (= (and start!73608 res!585381) b!861374))

(assert (= (and b!861374 res!585384) b!861384))

(assert (= (and b!861384 res!585379) b!861383))

(assert (= (and b!861383 res!585382) b!861385))

(assert (= (and b!861385 res!585383) b!861379))

(assert (= (and b!861379 res!585385) b!861375))

(assert (= (and b!861375 res!585380) b!861380))

(assert (= (and b!861380 res!585377) b!861378))

(assert (= (and b!861378 res!585378) b!861382))

(assert (= (and b!861382 (not res!585386)) b!861381))

(assert (= (and b!861381 c!92005) b!861376))

(assert (= (and b!861381 (not c!92005)) b!861387))

(assert (= (and b!861388 condMapEmpty!26588) mapIsEmpty!26588))

(assert (= (and b!861388 (not condMapEmpty!26588)) mapNonEmpty!26588))

(get-info :version)

(assert (= (and mapNonEmpty!26588 ((_ is ValueCellFull!7890) mapValue!26588)) b!861377))

(assert (= (and b!861388 ((_ is ValueCellFull!7890) mapDefault!26588)) b!861386))

(assert (= start!73608 b!861388))

(declare-fun b_lambda!11875 () Bool)

(assert (=> (not b_lambda!11875) (not b!861381)))

(declare-fun t!23668 () Bool)

(declare-fun tb!4645 () Bool)

(assert (=> (and start!73608 (= defaultEntry!696 defaultEntry!696) t!23668) tb!4645))

(declare-fun result!8901 () Bool)

(assert (=> tb!4645 (= result!8901 tp_is_empty!16659)))

(assert (=> b!861381 t!23668))

(declare-fun b_and!24027 () Bool)

(assert (= b_and!24025 (and (=> t!23668 result!8901) b_and!24027)))

(declare-fun m!802269 () Bool)

(assert (=> b!861376 m!802269))

(declare-fun m!802271 () Bool)

(assert (=> b!861376 m!802271))

(declare-fun m!802273 () Bool)

(assert (=> b!861376 m!802273))

(declare-fun m!802275 () Bool)

(assert (=> b!861376 m!802275))

(declare-fun m!802277 () Bool)

(assert (=> b!861376 m!802277))

(declare-fun m!802279 () Bool)

(assert (=> b!861381 m!802279))

(declare-fun m!802281 () Bool)

(assert (=> b!861381 m!802281))

(declare-fun m!802283 () Bool)

(assert (=> b!861381 m!802283))

(declare-fun m!802285 () Bool)

(assert (=> b!861381 m!802285))

(assert (=> b!861381 m!802281))

(assert (=> b!861381 m!802279))

(declare-fun m!802287 () Bool)

(assert (=> b!861381 m!802287))

(declare-fun m!802289 () Bool)

(assert (=> start!73608 m!802289))

(declare-fun m!802291 () Bool)

(assert (=> start!73608 m!802291))

(declare-fun m!802293 () Bool)

(assert (=> b!861375 m!802293))

(declare-fun m!802295 () Bool)

(assert (=> b!861380 m!802295))

(declare-fun m!802297 () Bool)

(assert (=> mapNonEmpty!26588 m!802297))

(declare-fun m!802299 () Bool)

(assert (=> b!861382 m!802299))

(assert (=> b!861382 m!802285))

(declare-fun m!802301 () Bool)

(assert (=> b!861382 m!802301))

(assert (=> b!861382 m!802285))

(declare-fun m!802303 () Bool)

(assert (=> b!861382 m!802303))

(declare-fun m!802305 () Bool)

(assert (=> b!861382 m!802305))

(declare-fun m!802307 () Bool)

(assert (=> b!861382 m!802307))

(declare-fun m!802309 () Bool)

(assert (=> b!861383 m!802309))

(declare-fun m!802311 () Bool)

(assert (=> b!861374 m!802311))

(declare-fun m!802313 () Bool)

(assert (=> b!861385 m!802313))

(declare-fun m!802315 () Bool)

(assert (=> b!861378 m!802315))

(declare-fun m!802317 () Bool)

(assert (=> b!861378 m!802317))

(declare-fun m!802319 () Bool)

(assert (=> b!861378 m!802319))

(check-sat (not b!861378) (not b!861376) b_and!24027 (not b!861383) (not start!73608) (not b_next!14523) (not b!861381) (not b!861382) tp_is_empty!16659 (not b!861385) (not mapNonEmpty!26588) (not b_lambda!11875) (not b!861374) (not b!861375))
(check-sat b_and!24027 (not b_next!14523))
