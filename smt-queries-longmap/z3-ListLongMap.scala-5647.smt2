; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73648 () Bool)

(assert start!73648)

(declare-fun b_free!14581 () Bool)

(declare-fun b_next!14581 () Bool)

(assert (=> start!73648 (= b_free!14581 (not b_next!14581))))

(declare-fun tp!51248 () Bool)

(declare-fun b_and!24115 () Bool)

(assert (=> start!73648 (= tp!51248 b_and!24115)))

(declare-fun b!862536 () Bool)

(declare-fun res!586176 () Bool)

(declare-fun e!480521 () Bool)

(assert (=> b!862536 (=> (not res!586176) (not e!480521))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862536 (= res!586176 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26675 () Bool)

(declare-fun mapRes!26675 () Bool)

(assert (=> mapIsEmpty!26675 mapRes!26675))

(declare-fun b!862538 () Bool)

(declare-fun e!480528 () Bool)

(declare-fun e!480526 () Bool)

(assert (=> b!862538 (= e!480528 (and e!480526 mapRes!26675))))

(declare-fun condMapEmpty!26675 () Bool)

(declare-datatypes ((V!27337 0))(
  ( (V!27338 (val!8406 Int)) )
))
(declare-datatypes ((ValueCell!7919 0))(
  ( (ValueCellFull!7919 (v!10825 V!27337)) (EmptyCell!7919) )
))
(declare-datatypes ((array!49587 0))(
  ( (array!49588 (arr!23825 (Array (_ BitVec 32) ValueCell!7919)) (size!24267 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49587)

(declare-fun mapDefault!26675 () ValueCell!7919)

(assert (=> b!862538 (= condMapEmpty!26675 (= (arr!23825 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7919)) mapDefault!26675)))))

(declare-fun b!862539 () Bool)

(declare-fun res!586183 () Bool)

(assert (=> b!862539 (=> (not res!586183) (not e!480521))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49589 0))(
  ( (array!49590 (arr!23826 (Array (_ BitVec 32) (_ BitVec 64))) (size!24268 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49589)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!862539 (= res!586183 (and (= (size!24267 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24268 _keys!868) (size!24267 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862540 () Bool)

(declare-fun res!586179 () Bool)

(assert (=> b!862540 (=> (not res!586179) (not e!480521))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862540 (= res!586179 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24268 _keys!868))))))

(declare-fun b!862541 () Bool)

(declare-fun e!480522 () Bool)

(assert (=> b!862541 (= e!480522 true)))

(declare-datatypes ((tuple2!11132 0))(
  ( (tuple2!11133 (_1!5577 (_ BitVec 64)) (_2!5577 V!27337)) )
))
(declare-fun lt!389365 () tuple2!11132)

(declare-datatypes ((List!16928 0))(
  ( (Nil!16925) (Cons!16924 (h!18055 tuple2!11132) (t!23766 List!16928)) )
))
(declare-datatypes ((ListLongMap!9891 0))(
  ( (ListLongMap!9892 (toList!4961 List!16928)) )
))
(declare-fun lt!389361 () ListLongMap!9891)

(declare-fun lt!389357 () ListLongMap!9891)

(declare-fun lt!389362 () tuple2!11132)

(declare-fun +!2330 (ListLongMap!9891 tuple2!11132) ListLongMap!9891)

(assert (=> b!862541 (= lt!389357 (+!2330 (+!2330 lt!389361 lt!389362) lt!389365))))

(declare-fun v!557 () V!27337)

(declare-datatypes ((Unit!29391 0))(
  ( (Unit!29392) )
))
(declare-fun lt!389363 () Unit!29391)

(declare-fun lt!389358 () V!27337)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!480 (ListLongMap!9891 (_ BitVec 64) V!27337 (_ BitVec 64) V!27337) Unit!29391)

(assert (=> b!862541 (= lt!389363 (addCommutativeForDiffKeys!480 lt!389361 k0!854 v!557 (select (arr!23826 _keys!868) from!1053) lt!389358))))

(declare-fun mapNonEmpty!26675 () Bool)

(declare-fun tp!51247 () Bool)

(declare-fun e!480524 () Bool)

(assert (=> mapNonEmpty!26675 (= mapRes!26675 (and tp!51247 e!480524))))

(declare-fun mapKey!26675 () (_ BitVec 32))

(declare-fun mapRest!26675 () (Array (_ BitVec 32) ValueCell!7919))

(declare-fun mapValue!26675 () ValueCell!7919)

(assert (=> mapNonEmpty!26675 (= (arr!23825 _values!688) (store mapRest!26675 mapKey!26675 mapValue!26675))))

(declare-fun b!862542 () Bool)

(declare-fun e!480520 () Unit!29391)

(declare-fun Unit!29393 () Unit!29391)

(assert (=> b!862542 (= e!480520 Unit!29393)))

(declare-fun lt!389372 () Unit!29391)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49589 (_ BitVec 32) (_ BitVec 32)) Unit!29391)

(assert (=> b!862542 (= lt!389372 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16929 0))(
  ( (Nil!16926) (Cons!16925 (h!18056 (_ BitVec 64)) (t!23767 List!16929)) )
))
(declare-fun arrayNoDuplicates!0 (array!49589 (_ BitVec 32) List!16929) Bool)

(assert (=> b!862542 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16926)))

(declare-fun lt!389360 () Unit!29391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29391)

(assert (=> b!862542 (= lt!389360 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862542 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389364 () Unit!29391)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49589 (_ BitVec 64) (_ BitVec 32) List!16929) Unit!29391)

(assert (=> b!862542 (= lt!389364 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16926))))

(assert (=> b!862542 false))

(declare-fun res!586181 () Bool)

(assert (=> start!73648 (=> (not res!586181) (not e!480521))))

(assert (=> start!73648 (= res!586181 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24268 _keys!868))))))

(assert (=> start!73648 e!480521))

(declare-fun tp_is_empty!16717 () Bool)

(assert (=> start!73648 tp_is_empty!16717))

(assert (=> start!73648 true))

(assert (=> start!73648 tp!51248))

(declare-fun array_inv!18920 (array!49589) Bool)

(assert (=> start!73648 (array_inv!18920 _keys!868)))

(declare-fun array_inv!18921 (array!49587) Bool)

(assert (=> start!73648 (and (array_inv!18921 _values!688) e!480528)))

(declare-fun b!862537 () Bool)

(declare-fun e!480527 () Bool)

(assert (=> b!862537 (= e!480527 e!480522)))

(declare-fun res!586184 () Bool)

(assert (=> b!862537 (=> res!586184 e!480522)))

(assert (=> b!862537 (= res!586184 (= k0!854 (select (arr!23826 _keys!868) from!1053)))))

(assert (=> b!862537 (not (= (select (arr!23826 _keys!868) from!1053) k0!854))))

(declare-fun lt!389371 () Unit!29391)

(assert (=> b!862537 (= lt!389371 e!480520)))

(declare-fun c!92027 () Bool)

(assert (=> b!862537 (= c!92027 (= (select (arr!23826 _keys!868) from!1053) k0!854))))

(declare-fun lt!389369 () ListLongMap!9891)

(assert (=> b!862537 (= lt!389369 lt!389357)))

(declare-fun lt!389368 () ListLongMap!9891)

(assert (=> b!862537 (= lt!389357 (+!2330 lt!389368 lt!389362))))

(assert (=> b!862537 (= lt!389362 (tuple2!11133 (select (arr!23826 _keys!868) from!1053) lt!389358))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12576 (ValueCell!7919 V!27337) V!27337)

(declare-fun dynLambda!1135 (Int (_ BitVec 64)) V!27337)

(assert (=> b!862537 (= lt!389358 (get!12576 (select (arr!23825 _values!688) from!1053) (dynLambda!1135 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862543 () Bool)

(declare-fun e!480525 () Bool)

(assert (=> b!862543 (= e!480521 e!480525)))

(declare-fun res!586185 () Bool)

(assert (=> b!862543 (=> (not res!586185) (not e!480525))))

(assert (=> b!862543 (= res!586185 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389366 () array!49587)

(declare-fun minValue!654 () V!27337)

(declare-fun zeroValue!654 () V!27337)

(declare-fun getCurrentListMapNoExtraKeys!2963 (array!49589 array!49587 (_ BitVec 32) (_ BitVec 32) V!27337 V!27337 (_ BitVec 32) Int) ListLongMap!9891)

(assert (=> b!862543 (= lt!389369 (getCurrentListMapNoExtraKeys!2963 _keys!868 lt!389366 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862543 (= lt!389366 (array!49588 (store (arr!23825 _values!688) i!612 (ValueCellFull!7919 v!557)) (size!24267 _values!688)))))

(declare-fun lt!389359 () ListLongMap!9891)

(assert (=> b!862543 (= lt!389359 (getCurrentListMapNoExtraKeys!2963 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862544 () Bool)

(declare-fun res!586182 () Bool)

(assert (=> b!862544 (=> (not res!586182) (not e!480521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49589 (_ BitVec 32)) Bool)

(assert (=> b!862544 (= res!586182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862545 () Bool)

(declare-fun res!586175 () Bool)

(assert (=> b!862545 (=> (not res!586175) (not e!480521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862545 (= res!586175 (validMask!0 mask!1196))))

(declare-fun b!862546 () Bool)

(assert (=> b!862546 (= e!480526 tp_is_empty!16717)))

(declare-fun b!862547 () Bool)

(assert (=> b!862547 (= e!480525 (not e!480527))))

(declare-fun res!586180 () Bool)

(assert (=> b!862547 (=> res!586180 e!480527)))

(assert (=> b!862547 (= res!586180 (not (validKeyInArray!0 (select (arr!23826 _keys!868) from!1053))))))

(declare-fun lt!389370 () ListLongMap!9891)

(assert (=> b!862547 (= lt!389370 lt!389368)))

(assert (=> b!862547 (= lt!389368 (+!2330 lt!389361 lt!389365))))

(assert (=> b!862547 (= lt!389370 (getCurrentListMapNoExtraKeys!2963 _keys!868 lt!389366 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862547 (= lt!389365 (tuple2!11133 k0!854 v!557))))

(assert (=> b!862547 (= lt!389361 (getCurrentListMapNoExtraKeys!2963 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389367 () Unit!29391)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!516 (array!49589 array!49587 (_ BitVec 32) (_ BitVec 32) V!27337 V!27337 (_ BitVec 32) (_ BitVec 64) V!27337 (_ BitVec 32) Int) Unit!29391)

(assert (=> b!862547 (= lt!389367 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!516 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862548 () Bool)

(declare-fun res!586178 () Bool)

(assert (=> b!862548 (=> (not res!586178) (not e!480521))))

(assert (=> b!862548 (= res!586178 (and (= (select (arr!23826 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862549 () Bool)

(assert (=> b!862549 (= e!480524 tp_is_empty!16717)))

(declare-fun b!862550 () Bool)

(declare-fun res!586177 () Bool)

(assert (=> b!862550 (=> (not res!586177) (not e!480521))))

(assert (=> b!862550 (= res!586177 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16926))))

(declare-fun b!862551 () Bool)

(declare-fun Unit!29394 () Unit!29391)

(assert (=> b!862551 (= e!480520 Unit!29394)))

(assert (= (and start!73648 res!586181) b!862545))

(assert (= (and b!862545 res!586175) b!862539))

(assert (= (and b!862539 res!586183) b!862544))

(assert (= (and b!862544 res!586182) b!862550))

(assert (= (and b!862550 res!586177) b!862540))

(assert (= (and b!862540 res!586179) b!862536))

(assert (= (and b!862536 res!586176) b!862548))

(assert (= (and b!862548 res!586178) b!862543))

(assert (= (and b!862543 res!586185) b!862547))

(assert (= (and b!862547 (not res!586180)) b!862537))

(assert (= (and b!862537 c!92027) b!862542))

(assert (= (and b!862537 (not c!92027)) b!862551))

(assert (= (and b!862537 (not res!586184)) b!862541))

(assert (= (and b!862538 condMapEmpty!26675) mapIsEmpty!26675))

(assert (= (and b!862538 (not condMapEmpty!26675)) mapNonEmpty!26675))

(get-info :version)

(assert (= (and mapNonEmpty!26675 ((_ is ValueCellFull!7919) mapValue!26675)) b!862549))

(assert (= (and b!862538 ((_ is ValueCellFull!7919) mapDefault!26675)) b!862546))

(assert (= start!73648 b!862538))

(declare-fun b_lambda!11915 () Bool)

(assert (=> (not b_lambda!11915) (not b!862537)))

(declare-fun t!23765 () Bool)

(declare-fun tb!4695 () Bool)

(assert (=> (and start!73648 (= defaultEntry!696 defaultEntry!696) t!23765) tb!4695))

(declare-fun result!9009 () Bool)

(assert (=> tb!4695 (= result!9009 tp_is_empty!16717)))

(assert (=> b!862537 t!23765))

(declare-fun b_and!24117 () Bool)

(assert (= b_and!24115 (and (=> t!23765 result!9009) b_and!24117)))

(declare-fun m!803091 () Bool)

(assert (=> b!862545 m!803091))

(declare-fun m!803093 () Bool)

(assert (=> b!862541 m!803093))

(assert (=> b!862541 m!803093))

(declare-fun m!803095 () Bool)

(assert (=> b!862541 m!803095))

(declare-fun m!803097 () Bool)

(assert (=> b!862541 m!803097))

(assert (=> b!862541 m!803097))

(declare-fun m!803099 () Bool)

(assert (=> b!862541 m!803099))

(declare-fun m!803101 () Bool)

(assert (=> b!862547 m!803101))

(declare-fun m!803103 () Bool)

(assert (=> b!862547 m!803103))

(declare-fun m!803105 () Bool)

(assert (=> b!862547 m!803105))

(assert (=> b!862547 m!803097))

(declare-fun m!803107 () Bool)

(assert (=> b!862547 m!803107))

(assert (=> b!862547 m!803097))

(declare-fun m!803109 () Bool)

(assert (=> b!862547 m!803109))

(declare-fun m!803111 () Bool)

(assert (=> b!862544 m!803111))

(declare-fun m!803113 () Bool)

(assert (=> mapNonEmpty!26675 m!803113))

(declare-fun m!803115 () Bool)

(assert (=> b!862542 m!803115))

(declare-fun m!803117 () Bool)

(assert (=> b!862542 m!803117))

(declare-fun m!803119 () Bool)

(assert (=> b!862542 m!803119))

(declare-fun m!803121 () Bool)

(assert (=> b!862542 m!803121))

(declare-fun m!803123 () Bool)

(assert (=> b!862542 m!803123))

(declare-fun m!803125 () Bool)

(assert (=> b!862548 m!803125))

(declare-fun m!803127 () Bool)

(assert (=> b!862536 m!803127))

(declare-fun m!803129 () Bool)

(assert (=> b!862543 m!803129))

(declare-fun m!803131 () Bool)

(assert (=> b!862543 m!803131))

(declare-fun m!803133 () Bool)

(assert (=> b!862543 m!803133))

(declare-fun m!803135 () Bool)

(assert (=> b!862537 m!803135))

(declare-fun m!803137 () Bool)

(assert (=> b!862537 m!803137))

(declare-fun m!803139 () Bool)

(assert (=> b!862537 m!803139))

(declare-fun m!803141 () Bool)

(assert (=> b!862537 m!803141))

(assert (=> b!862537 m!803137))

(assert (=> b!862537 m!803097))

(assert (=> b!862537 m!803139))

(declare-fun m!803143 () Bool)

(assert (=> start!73648 m!803143))

(declare-fun m!803145 () Bool)

(assert (=> start!73648 m!803145))

(declare-fun m!803147 () Bool)

(assert (=> b!862550 m!803147))

(check-sat (not b!862545) (not start!73648) (not b!862537) (not b!862542) (not b!862547) (not b!862536) b_and!24117 (not mapNonEmpty!26675) (not b_next!14581) (not b!862541) (not b!862550) (not b_lambda!11915) tp_is_empty!16717 (not b!862544) (not b!862543))
(check-sat b_and!24117 (not b_next!14581))
