; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73854 () Bool)

(assert start!73854)

(declare-fun b_free!14769 () Bool)

(declare-fun b_next!14769 () Bool)

(assert (=> start!73854 (= b_free!14769 (not b_next!14769))))

(declare-fun tp!51811 () Bool)

(declare-fun b_and!24517 () Bool)

(assert (=> start!73854 (= tp!51811 b_and!24517)))

(declare-fun b!867476 () Bool)

(declare-fun e!483206 () Bool)

(declare-fun e!483214 () Bool)

(assert (=> b!867476 (= e!483206 e!483214)))

(declare-fun res!589390 () Bool)

(assert (=> b!867476 (=> (not res!589390) (not e!483214))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867476 (= res!589390 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27587 0))(
  ( (V!27588 (val!8500 Int)) )
))
(declare-datatypes ((ValueCell!8013 0))(
  ( (ValueCellFull!8013 (v!10925 V!27587)) (EmptyCell!8013) )
))
(declare-datatypes ((array!49970 0))(
  ( (array!49971 (arr!24016 (Array (_ BitVec 32) ValueCell!8013)) (size!24456 (_ BitVec 32))) )
))
(declare-fun lt!394114 () array!49970)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11276 0))(
  ( (tuple2!11277 (_1!5649 (_ BitVec 64)) (_2!5649 V!27587)) )
))
(declare-datatypes ((List!17076 0))(
  ( (Nil!17073) (Cons!17072 (h!18203 tuple2!11276) (t!24111 List!17076)) )
))
(declare-datatypes ((ListLongMap!10045 0))(
  ( (ListLongMap!10046 (toList!5038 List!17076)) )
))
(declare-fun lt!394108 () ListLongMap!10045)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49972 0))(
  ( (array!49973 (arr!24017 (Array (_ BitVec 32) (_ BitVec 64))) (size!24457 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49972)

(declare-fun minValue!654 () V!27587)

(declare-fun zeroValue!654 () V!27587)

(declare-fun getCurrentListMapNoExtraKeys!3007 (array!49972 array!49970 (_ BitVec 32) (_ BitVec 32) V!27587 V!27587 (_ BitVec 32) Int) ListLongMap!10045)

(assert (=> b!867476 (= lt!394108 (getCurrentListMapNoExtraKeys!3007 _keys!868 lt!394114 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27587)

(declare-fun _values!688 () array!49970)

(assert (=> b!867476 (= lt!394114 (array!49971 (store (arr!24016 _values!688) i!612 (ValueCellFull!8013 v!557)) (size!24456 _values!688)))))

(declare-fun lt!394111 () ListLongMap!10045)

(assert (=> b!867476 (= lt!394111 (getCurrentListMapNoExtraKeys!3007 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867477 () Bool)

(declare-datatypes ((Unit!29761 0))(
  ( (Unit!29762) )
))
(declare-fun e!483209 () Unit!29761)

(declare-fun Unit!29763 () Unit!29761)

(assert (=> b!867477 (= e!483209 Unit!29763)))

(declare-fun lt!394116 () Unit!29761)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49972 (_ BitVec 32) (_ BitVec 32)) Unit!29761)

(assert (=> b!867477 (= lt!394116 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17077 0))(
  ( (Nil!17074) (Cons!17073 (h!18204 (_ BitVec 64)) (t!24112 List!17077)) )
))
(declare-fun arrayNoDuplicates!0 (array!49972 (_ BitVec 32) List!17077) Bool)

(assert (=> b!867477 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17074)))

(declare-fun lt!394113 () Unit!29761)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49972 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29761)

(assert (=> b!867477 (= lt!394113 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867477 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!394106 () Unit!29761)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49972 (_ BitVec 64) (_ BitVec 32) List!17077) Unit!29761)

(assert (=> b!867477 (= lt!394106 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17074))))

(assert (=> b!867477 false))

(declare-fun b!867478 () Bool)

(declare-fun res!589389 () Bool)

(assert (=> b!867478 (=> (not res!589389) (not e!483206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867478 (= res!589389 (validMask!0 mask!1196))))

(declare-fun b!867479 () Bool)

(declare-fun res!589392 () Bool)

(assert (=> b!867479 (=> (not res!589392) (not e!483206))))

(assert (=> b!867479 (= res!589392 (and (= (select (arr!24017 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26957 () Bool)

(declare-fun mapRes!26957 () Bool)

(assert (=> mapIsEmpty!26957 mapRes!26957))

(declare-fun b!867480 () Bool)

(declare-fun res!589391 () Bool)

(assert (=> b!867480 (=> (not res!589391) (not e!483206))))

(assert (=> b!867480 (= res!589391 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24457 _keys!868))))))

(declare-fun mapNonEmpty!26957 () Bool)

(declare-fun tp!51810 () Bool)

(declare-fun e!483208 () Bool)

(assert (=> mapNonEmpty!26957 (= mapRes!26957 (and tp!51810 e!483208))))

(declare-fun mapRest!26957 () (Array (_ BitVec 32) ValueCell!8013))

(declare-fun mapKey!26957 () (_ BitVec 32))

(declare-fun mapValue!26957 () ValueCell!8013)

(assert (=> mapNonEmpty!26957 (= (arr!24016 _values!688) (store mapRest!26957 mapKey!26957 mapValue!26957))))

(declare-fun b!867481 () Bool)

(declare-fun e!483211 () Bool)

(declare-fun tp_is_empty!16905 () Bool)

(assert (=> b!867481 (= e!483211 tp_is_empty!16905)))

(declare-fun b!867482 () Bool)

(declare-fun res!589394 () Bool)

(assert (=> b!867482 (=> (not res!589394) (not e!483206))))

(assert (=> b!867482 (= res!589394 (and (= (size!24456 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24457 _keys!868) (size!24456 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867483 () Bool)

(declare-fun e!483210 () Bool)

(assert (=> b!867483 (= e!483214 (not e!483210))))

(declare-fun res!589393 () Bool)

(assert (=> b!867483 (=> res!589393 e!483210)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867483 (= res!589393 (not (validKeyInArray!0 (select (arr!24017 _keys!868) from!1053))))))

(declare-fun lt!394120 () ListLongMap!10045)

(declare-fun lt!394110 () ListLongMap!10045)

(assert (=> b!867483 (= lt!394120 lt!394110)))

(declare-fun lt!394118 () ListLongMap!10045)

(declare-fun lt!394112 () tuple2!11276)

(declare-fun +!2384 (ListLongMap!10045 tuple2!11276) ListLongMap!10045)

(assert (=> b!867483 (= lt!394110 (+!2384 lt!394118 lt!394112))))

(assert (=> b!867483 (= lt!394120 (getCurrentListMapNoExtraKeys!3007 _keys!868 lt!394114 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867483 (= lt!394112 (tuple2!11277 k0!854 v!557))))

(assert (=> b!867483 (= lt!394118 (getCurrentListMapNoExtraKeys!3007 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!394115 () Unit!29761)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!578 (array!49972 array!49970 (_ BitVec 32) (_ BitVec 32) V!27587 V!27587 (_ BitVec 32) (_ BitVec 64) V!27587 (_ BitVec 32) Int) Unit!29761)

(assert (=> b!867483 (= lt!394115 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!578 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867484 () Bool)

(declare-fun res!589388 () Bool)

(assert (=> b!867484 (=> (not res!589388) (not e!483206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49972 (_ BitVec 32)) Bool)

(assert (=> b!867484 (= res!589388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867485 () Bool)

(declare-fun res!589396 () Bool)

(assert (=> b!867485 (=> (not res!589396) (not e!483206))))

(assert (=> b!867485 (= res!589396 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17074))))

(declare-fun b!867486 () Bool)

(declare-fun Unit!29764 () Unit!29761)

(assert (=> b!867486 (= e!483209 Unit!29764)))

(declare-fun res!589395 () Bool)

(assert (=> start!73854 (=> (not res!589395) (not e!483206))))

(assert (=> start!73854 (= res!589395 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24457 _keys!868))))))

(assert (=> start!73854 e!483206))

(assert (=> start!73854 tp_is_empty!16905))

(assert (=> start!73854 true))

(assert (=> start!73854 tp!51811))

(declare-fun array_inv!18976 (array!49972) Bool)

(assert (=> start!73854 (array_inv!18976 _keys!868)))

(declare-fun e!483207 () Bool)

(declare-fun array_inv!18977 (array!49970) Bool)

(assert (=> start!73854 (and (array_inv!18977 _values!688) e!483207)))

(declare-fun b!867475 () Bool)

(declare-fun res!589397 () Bool)

(assert (=> b!867475 (=> (not res!589397) (not e!483206))))

(assert (=> b!867475 (= res!589397 (validKeyInArray!0 k0!854))))

(declare-fun b!867487 () Bool)

(declare-fun e!483213 () Bool)

(assert (=> b!867487 (= e!483210 e!483213)))

(declare-fun res!589387 () Bool)

(assert (=> b!867487 (=> res!589387 e!483213)))

(assert (=> b!867487 (= res!589387 (= k0!854 (select (arr!24017 _keys!868) from!1053)))))

(assert (=> b!867487 (not (= (select (arr!24017 _keys!868) from!1053) k0!854))))

(declare-fun lt!394105 () Unit!29761)

(assert (=> b!867487 (= lt!394105 e!483209)))

(declare-fun c!92374 () Bool)

(assert (=> b!867487 (= c!92374 (= (select (arr!24017 _keys!868) from!1053) k0!854))))

(declare-fun lt!394109 () ListLongMap!10045)

(assert (=> b!867487 (= lt!394108 lt!394109)))

(declare-fun lt!394117 () tuple2!11276)

(assert (=> b!867487 (= lt!394109 (+!2384 lt!394110 lt!394117))))

(declare-fun lt!394107 () V!27587)

(assert (=> b!867487 (= lt!394117 (tuple2!11277 (select (arr!24017 _keys!868) from!1053) lt!394107))))

(declare-fun get!12701 (ValueCell!8013 V!27587) V!27587)

(declare-fun dynLambda!1201 (Int (_ BitVec 64)) V!27587)

(assert (=> b!867487 (= lt!394107 (get!12701 (select (arr!24016 _values!688) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867488 () Bool)

(assert (=> b!867488 (= e!483208 tp_is_empty!16905)))

(declare-fun b!867489 () Bool)

(assert (=> b!867489 (= e!483213 true)))

(assert (=> b!867489 (= lt!394109 (+!2384 (+!2384 lt!394118 lt!394117) lt!394112))))

(declare-fun lt!394119 () Unit!29761)

(declare-fun addCommutativeForDiffKeys!549 (ListLongMap!10045 (_ BitVec 64) V!27587 (_ BitVec 64) V!27587) Unit!29761)

(assert (=> b!867489 (= lt!394119 (addCommutativeForDiffKeys!549 lt!394118 k0!854 v!557 (select (arr!24017 _keys!868) from!1053) lt!394107))))

(declare-fun b!867490 () Bool)

(assert (=> b!867490 (= e!483207 (and e!483211 mapRes!26957))))

(declare-fun condMapEmpty!26957 () Bool)

(declare-fun mapDefault!26957 () ValueCell!8013)

(assert (=> b!867490 (= condMapEmpty!26957 (= (arr!24016 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8013)) mapDefault!26957)))))

(assert (= (and start!73854 res!589395) b!867478))

(assert (= (and b!867478 res!589389) b!867482))

(assert (= (and b!867482 res!589394) b!867484))

(assert (= (and b!867484 res!589388) b!867485))

(assert (= (and b!867485 res!589396) b!867480))

(assert (= (and b!867480 res!589391) b!867475))

(assert (= (and b!867475 res!589397) b!867479))

(assert (= (and b!867479 res!589392) b!867476))

(assert (= (and b!867476 res!589390) b!867483))

(assert (= (and b!867483 (not res!589393)) b!867487))

(assert (= (and b!867487 c!92374) b!867477))

(assert (= (and b!867487 (not c!92374)) b!867486))

(assert (= (and b!867487 (not res!589387)) b!867489))

(assert (= (and b!867490 condMapEmpty!26957) mapIsEmpty!26957))

(assert (= (and b!867490 (not condMapEmpty!26957)) mapNonEmpty!26957))

(get-info :version)

(assert (= (and mapNonEmpty!26957 ((_ is ValueCellFull!8013) mapValue!26957)) b!867488))

(assert (= (and b!867490 ((_ is ValueCellFull!8013) mapDefault!26957)) b!867481))

(assert (= start!73854 b!867490))

(declare-fun b_lambda!12121 () Bool)

(assert (=> (not b_lambda!12121) (not b!867487)))

(declare-fun t!24110 () Bool)

(declare-fun tb!4891 () Bool)

(assert (=> (and start!73854 (= defaultEntry!696 defaultEntry!696) t!24110) tb!4891))

(declare-fun result!9393 () Bool)

(assert (=> tb!4891 (= result!9393 tp_is_empty!16905)))

(assert (=> b!867487 t!24110))

(declare-fun b_and!24519 () Bool)

(assert (= b_and!24517 (and (=> t!24110 result!9393) b_and!24519)))

(declare-fun m!809301 () Bool)

(assert (=> start!73854 m!809301))

(declare-fun m!809303 () Bool)

(assert (=> start!73854 m!809303))

(declare-fun m!809305 () Bool)

(assert (=> mapNonEmpty!26957 m!809305))

(declare-fun m!809307 () Bool)

(assert (=> b!867479 m!809307))

(declare-fun m!809309 () Bool)

(assert (=> b!867476 m!809309))

(declare-fun m!809311 () Bool)

(assert (=> b!867476 m!809311))

(declare-fun m!809313 () Bool)

(assert (=> b!867476 m!809313))

(declare-fun m!809315 () Bool)

(assert (=> b!867475 m!809315))

(declare-fun m!809317 () Bool)

(assert (=> b!867487 m!809317))

(declare-fun m!809319 () Bool)

(assert (=> b!867487 m!809319))

(declare-fun m!809321 () Bool)

(assert (=> b!867487 m!809321))

(declare-fun m!809323 () Bool)

(assert (=> b!867487 m!809323))

(assert (=> b!867487 m!809319))

(declare-fun m!809325 () Bool)

(assert (=> b!867487 m!809325))

(assert (=> b!867487 m!809321))

(declare-fun m!809327 () Bool)

(assert (=> b!867477 m!809327))

(declare-fun m!809329 () Bool)

(assert (=> b!867477 m!809329))

(declare-fun m!809331 () Bool)

(assert (=> b!867477 m!809331))

(declare-fun m!809333 () Bool)

(assert (=> b!867477 m!809333))

(declare-fun m!809335 () Bool)

(assert (=> b!867477 m!809335))

(declare-fun m!809337 () Bool)

(assert (=> b!867485 m!809337))

(declare-fun m!809339 () Bool)

(assert (=> b!867489 m!809339))

(assert (=> b!867489 m!809339))

(declare-fun m!809341 () Bool)

(assert (=> b!867489 m!809341))

(assert (=> b!867489 m!809325))

(assert (=> b!867489 m!809325))

(declare-fun m!809343 () Bool)

(assert (=> b!867489 m!809343))

(declare-fun m!809345 () Bool)

(assert (=> b!867484 m!809345))

(declare-fun m!809347 () Bool)

(assert (=> b!867478 m!809347))

(declare-fun m!809349 () Bool)

(assert (=> b!867483 m!809349))

(declare-fun m!809351 () Bool)

(assert (=> b!867483 m!809351))

(declare-fun m!809353 () Bool)

(assert (=> b!867483 m!809353))

(assert (=> b!867483 m!809325))

(declare-fun m!809355 () Bool)

(assert (=> b!867483 m!809355))

(assert (=> b!867483 m!809325))

(declare-fun m!809357 () Bool)

(assert (=> b!867483 m!809357))

(check-sat (not b_next!14769) (not b!867485) b_and!24519 (not b_lambda!12121) tp_is_empty!16905 (not start!73854) (not b!867477) (not b!867484) (not b!867487) (not b!867489) (not b!867476) (not b!867483) (not b!867478) (not b!867475) (not mapNonEmpty!26957))
(check-sat b_and!24519 (not b_next!14769))
