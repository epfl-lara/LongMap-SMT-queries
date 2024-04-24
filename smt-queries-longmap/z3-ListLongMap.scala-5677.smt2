; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74014 () Bool)

(assert start!74014)

(declare-fun b_free!14761 () Bool)

(declare-fun b_next!14761 () Bool)

(assert (=> start!74014 (= b_free!14761 (not b_next!14761))))

(declare-fun tp!51788 () Bool)

(declare-fun b_and!24511 () Bool)

(assert (=> start!74014 (= tp!51788 b_and!24511)))

(declare-fun res!589606 () Bool)

(declare-fun e!483687 () Bool)

(assert (=> start!74014 (=> (not res!589606) (not e!483687))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50003 0))(
  ( (array!50004 (arr!24028 (Array (_ BitVec 32) (_ BitVec 64))) (size!24469 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50003)

(assert (=> start!74014 (= res!589606 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24469 _keys!868))))))

(assert (=> start!74014 e!483687))

(declare-fun tp_is_empty!16897 () Bool)

(assert (=> start!74014 tp_is_empty!16897))

(assert (=> start!74014 true))

(assert (=> start!74014 tp!51788))

(declare-fun array_inv!19042 (array!50003) Bool)

(assert (=> start!74014 (array_inv!19042 _keys!868)))

(declare-datatypes ((V!27577 0))(
  ( (V!27578 (val!8496 Int)) )
))
(declare-datatypes ((ValueCell!8009 0))(
  ( (ValueCellFull!8009 (v!10921 V!27577)) (EmptyCell!8009) )
))
(declare-datatypes ((array!50005 0))(
  ( (array!50006 (arr!24029 (Array (_ BitVec 32) ValueCell!8009)) (size!24470 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50005)

(declare-fun e!483685 () Bool)

(declare-fun array_inv!19043 (array!50005) Bool)

(assert (=> start!74014 (and (array_inv!19043 _values!688) e!483685)))

(declare-fun b!868178 () Bool)

(declare-fun res!589600 () Bool)

(assert (=> b!868178 (=> (not res!589600) (not e!483687))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50003 (_ BitVec 32)) Bool)

(assert (=> b!868178 (= res!589600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868179 () Bool)

(declare-fun e!483681 () Bool)

(assert (=> b!868179 (= e!483681 true)))

(declare-datatypes ((tuple2!11196 0))(
  ( (tuple2!11197 (_1!5609 (_ BitVec 64)) (_2!5609 V!27577)) )
))
(declare-datatypes ((List!17023 0))(
  ( (Nil!17020) (Cons!17019 (h!18156 tuple2!11196) (t!24042 List!17023)) )
))
(declare-datatypes ((ListLongMap!9967 0))(
  ( (ListLongMap!9968 (toList!4999 List!17023)) )
))
(declare-fun lt!394275 () ListLongMap!9967)

(declare-fun lt!394288 () tuple2!11196)

(declare-fun lt!394277 () ListLongMap!9967)

(declare-fun lt!394276 () tuple2!11196)

(declare-fun +!2402 (ListLongMap!9967 tuple2!11196) ListLongMap!9967)

(assert (=> b!868179 (= lt!394277 (+!2402 (+!2402 lt!394275 lt!394288) lt!394276))))

(declare-fun v!557 () V!27577)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!394281 () V!27577)

(declare-datatypes ((Unit!29744 0))(
  ( (Unit!29745) )
))
(declare-fun lt!394289 () Unit!29744)

(declare-fun addCommutativeForDiffKeys!542 (ListLongMap!9967 (_ BitVec 64) V!27577 (_ BitVec 64) V!27577) Unit!29744)

(assert (=> b!868179 (= lt!394289 (addCommutativeForDiffKeys!542 lt!394275 k0!854 v!557 (select (arr!24028 _keys!868) from!1053) lt!394281))))

(declare-fun b!868180 () Bool)

(declare-fun e!483680 () Unit!29744)

(declare-fun Unit!29746 () Unit!29744)

(assert (=> b!868180 (= e!483680 Unit!29746)))

(declare-fun lt!394283 () Unit!29744)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!50003 (_ BitVec 32) (_ BitVec 32)) Unit!29744)

(assert (=> b!868180 (= lt!394283 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17024 0))(
  ( (Nil!17021) (Cons!17020 (h!18157 (_ BitVec 64)) (t!24043 List!17024)) )
))
(declare-fun arrayNoDuplicates!0 (array!50003 (_ BitVec 32) List!17024) Bool)

(assert (=> b!868180 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17021)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!394285 () Unit!29744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!50003 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29744)

(assert (=> b!868180 (= lt!394285 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!50003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!868180 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!394279 () Unit!29744)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!50003 (_ BitVec 64) (_ BitVec 32) List!17024) Unit!29744)

(assert (=> b!868180 (= lt!394279 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17021))))

(assert (=> b!868180 false))

(declare-fun b!868181 () Bool)

(declare-fun Unit!29747 () Unit!29744)

(assert (=> b!868181 (= e!483680 Unit!29747)))

(declare-fun b!868182 () Bool)

(declare-fun res!589609 () Bool)

(assert (=> b!868182 (=> (not res!589609) (not e!483687))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!868182 (= res!589609 (and (= (size!24470 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24469 _keys!868) (size!24470 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868183 () Bool)

(declare-fun res!589607 () Bool)

(assert (=> b!868183 (=> (not res!589607) (not e!483687))))

(assert (=> b!868183 (= res!589607 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17021))))

(declare-fun b!868184 () Bool)

(declare-fun e!483682 () Bool)

(assert (=> b!868184 (= e!483682 tp_is_empty!16897)))

(declare-fun b!868185 () Bool)

(declare-fun e!483686 () Bool)

(assert (=> b!868185 (= e!483687 e!483686)))

(declare-fun res!589601 () Bool)

(assert (=> b!868185 (=> (not res!589601) (not e!483686))))

(assert (=> b!868185 (= res!589601 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394278 () array!50005)

(declare-fun lt!394284 () ListLongMap!9967)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27577)

(declare-fun zeroValue!654 () V!27577)

(declare-fun getCurrentListMapNoExtraKeys!3043 (array!50003 array!50005 (_ BitVec 32) (_ BitVec 32) V!27577 V!27577 (_ BitVec 32) Int) ListLongMap!9967)

(assert (=> b!868185 (= lt!394284 (getCurrentListMapNoExtraKeys!3043 _keys!868 lt!394278 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868185 (= lt!394278 (array!50006 (store (arr!24029 _values!688) i!612 (ValueCellFull!8009 v!557)) (size!24470 _values!688)))))

(declare-fun lt!394286 () ListLongMap!9967)

(assert (=> b!868185 (= lt!394286 (getCurrentListMapNoExtraKeys!3043 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26945 () Bool)

(declare-fun mapRes!26945 () Bool)

(assert (=> mapIsEmpty!26945 mapRes!26945))

(declare-fun mapNonEmpty!26945 () Bool)

(declare-fun tp!51787 () Bool)

(declare-fun e!483684 () Bool)

(assert (=> mapNonEmpty!26945 (= mapRes!26945 (and tp!51787 e!483684))))

(declare-fun mapValue!26945 () ValueCell!8009)

(declare-fun mapRest!26945 () (Array (_ BitVec 32) ValueCell!8009))

(declare-fun mapKey!26945 () (_ BitVec 32))

(assert (=> mapNonEmpty!26945 (= (arr!24029 _values!688) (store mapRest!26945 mapKey!26945 mapValue!26945))))

(declare-fun b!868186 () Bool)

(assert (=> b!868186 (= e!483684 tp_is_empty!16897)))

(declare-fun b!868187 () Bool)

(declare-fun res!589603 () Bool)

(assert (=> b!868187 (=> (not res!589603) (not e!483687))))

(assert (=> b!868187 (= res!589603 (and (= (select (arr!24028 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868188 () Bool)

(assert (=> b!868188 (= e!483685 (and e!483682 mapRes!26945))))

(declare-fun condMapEmpty!26945 () Bool)

(declare-fun mapDefault!26945 () ValueCell!8009)

(assert (=> b!868188 (= condMapEmpty!26945 (= (arr!24029 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8009)) mapDefault!26945)))))

(declare-fun b!868189 () Bool)

(declare-fun res!589602 () Bool)

(assert (=> b!868189 (=> (not res!589602) (not e!483687))))

(assert (=> b!868189 (= res!589602 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24469 _keys!868))))))

(declare-fun b!868190 () Bool)

(declare-fun res!589604 () Bool)

(assert (=> b!868190 (=> (not res!589604) (not e!483687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868190 (= res!589604 (validMask!0 mask!1196))))

(declare-fun b!868191 () Bool)

(declare-fun e!483688 () Bool)

(assert (=> b!868191 (= e!483686 (not e!483688))))

(declare-fun res!589608 () Bool)

(assert (=> b!868191 (=> res!589608 e!483688)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868191 (= res!589608 (not (validKeyInArray!0 (select (arr!24028 _keys!868) from!1053))))))

(declare-fun lt!394280 () ListLongMap!9967)

(declare-fun lt!394287 () ListLongMap!9967)

(assert (=> b!868191 (= lt!394280 lt!394287)))

(assert (=> b!868191 (= lt!394287 (+!2402 lt!394275 lt!394276))))

(assert (=> b!868191 (= lt!394280 (getCurrentListMapNoExtraKeys!3043 _keys!868 lt!394278 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!868191 (= lt!394276 (tuple2!11197 k0!854 v!557))))

(assert (=> b!868191 (= lt!394275 (getCurrentListMapNoExtraKeys!3043 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!394274 () Unit!29744)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!574 (array!50003 array!50005 (_ BitVec 32) (_ BitVec 32) V!27577 V!27577 (_ BitVec 32) (_ BitVec 64) V!27577 (_ BitVec 32) Int) Unit!29744)

(assert (=> b!868191 (= lt!394274 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!574 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868192 () Bool)

(declare-fun res!589605 () Bool)

(assert (=> b!868192 (=> (not res!589605) (not e!483687))))

(assert (=> b!868192 (= res!589605 (validKeyInArray!0 k0!854))))

(declare-fun b!868193 () Bool)

(assert (=> b!868193 (= e!483688 e!483681)))

(declare-fun res!589599 () Bool)

(assert (=> b!868193 (=> res!589599 e!483681)))

(assert (=> b!868193 (= res!589599 (= k0!854 (select (arr!24028 _keys!868) from!1053)))))

(assert (=> b!868193 (not (= (select (arr!24028 _keys!868) from!1053) k0!854))))

(declare-fun lt!394282 () Unit!29744)

(assert (=> b!868193 (= lt!394282 e!483680)))

(declare-fun c!92644 () Bool)

(assert (=> b!868193 (= c!92644 (= (select (arr!24028 _keys!868) from!1053) k0!854))))

(assert (=> b!868193 (= lt!394284 lt!394277)))

(assert (=> b!868193 (= lt!394277 (+!2402 lt!394287 lt!394288))))

(assert (=> b!868193 (= lt!394288 (tuple2!11197 (select (arr!24028 _keys!868) from!1053) lt!394281))))

(declare-fun get!12725 (ValueCell!8009 V!27577) V!27577)

(declare-fun dynLambda!1221 (Int (_ BitVec 64)) V!27577)

(assert (=> b!868193 (= lt!394281 (get!12725 (select (arr!24029 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!74014 res!589606) b!868190))

(assert (= (and b!868190 res!589604) b!868182))

(assert (= (and b!868182 res!589609) b!868178))

(assert (= (and b!868178 res!589600) b!868183))

(assert (= (and b!868183 res!589607) b!868189))

(assert (= (and b!868189 res!589602) b!868192))

(assert (= (and b!868192 res!589605) b!868187))

(assert (= (and b!868187 res!589603) b!868185))

(assert (= (and b!868185 res!589601) b!868191))

(assert (= (and b!868191 (not res!589608)) b!868193))

(assert (= (and b!868193 c!92644) b!868180))

(assert (= (and b!868193 (not c!92644)) b!868181))

(assert (= (and b!868193 (not res!589599)) b!868179))

(assert (= (and b!868188 condMapEmpty!26945) mapIsEmpty!26945))

(assert (= (and b!868188 (not condMapEmpty!26945)) mapNonEmpty!26945))

(get-info :version)

(assert (= (and mapNonEmpty!26945 ((_ is ValueCellFull!8009) mapValue!26945)) b!868186))

(assert (= (and b!868188 ((_ is ValueCellFull!8009) mapDefault!26945)) b!868184))

(assert (= start!74014 b!868188))

(declare-fun b_lambda!12127 () Bool)

(assert (=> (not b_lambda!12127) (not b!868193)))

(declare-fun t!24041 () Bool)

(declare-fun tb!4875 () Bool)

(assert (=> (and start!74014 (= defaultEntry!696 defaultEntry!696) t!24041) tb!4875))

(declare-fun result!9369 () Bool)

(assert (=> tb!4875 (= result!9369 tp_is_empty!16897)))

(assert (=> b!868193 t!24041))

(declare-fun b_and!24513 () Bool)

(assert (= b_and!24511 (and (=> t!24041 result!9369) b_and!24513)))

(declare-fun m!810359 () Bool)

(assert (=> b!868180 m!810359))

(declare-fun m!810361 () Bool)

(assert (=> b!868180 m!810361))

(declare-fun m!810363 () Bool)

(assert (=> b!868180 m!810363))

(declare-fun m!810365 () Bool)

(assert (=> b!868180 m!810365))

(declare-fun m!810367 () Bool)

(assert (=> b!868180 m!810367))

(declare-fun m!810369 () Bool)

(assert (=> mapNonEmpty!26945 m!810369))

(declare-fun m!810371 () Bool)

(assert (=> b!868193 m!810371))

(declare-fun m!810373 () Bool)

(assert (=> b!868193 m!810373))

(declare-fun m!810375 () Bool)

(assert (=> b!868193 m!810375))

(declare-fun m!810377 () Bool)

(assert (=> b!868193 m!810377))

(assert (=> b!868193 m!810373))

(declare-fun m!810379 () Bool)

(assert (=> b!868193 m!810379))

(assert (=> b!868193 m!810371))

(declare-fun m!810381 () Bool)

(assert (=> b!868185 m!810381))

(declare-fun m!810383 () Bool)

(assert (=> b!868185 m!810383))

(declare-fun m!810385 () Bool)

(assert (=> b!868185 m!810385))

(declare-fun m!810387 () Bool)

(assert (=> b!868191 m!810387))

(assert (=> b!868191 m!810377))

(declare-fun m!810389 () Bool)

(assert (=> b!868191 m!810389))

(assert (=> b!868191 m!810377))

(declare-fun m!810391 () Bool)

(assert (=> b!868191 m!810391))

(declare-fun m!810393 () Bool)

(assert (=> b!868191 m!810393))

(declare-fun m!810395 () Bool)

(assert (=> b!868191 m!810395))

(declare-fun m!810397 () Bool)

(assert (=> b!868178 m!810397))

(declare-fun m!810399 () Bool)

(assert (=> b!868190 m!810399))

(declare-fun m!810401 () Bool)

(assert (=> b!868183 m!810401))

(declare-fun m!810403 () Bool)

(assert (=> b!868187 m!810403))

(declare-fun m!810405 () Bool)

(assert (=> b!868192 m!810405))

(declare-fun m!810407 () Bool)

(assert (=> start!74014 m!810407))

(declare-fun m!810409 () Bool)

(assert (=> start!74014 m!810409))

(declare-fun m!810411 () Bool)

(assert (=> b!868179 m!810411))

(assert (=> b!868179 m!810411))

(declare-fun m!810413 () Bool)

(assert (=> b!868179 m!810413))

(assert (=> b!868179 m!810377))

(assert (=> b!868179 m!810377))

(declare-fun m!810415 () Bool)

(assert (=> b!868179 m!810415))

(check-sat (not b_next!14761) (not b!868191) (not b!868180) (not start!74014) b_and!24513 tp_is_empty!16897 (not b!868192) (not b!868179) (not b!868183) (not mapNonEmpty!26945) (not b!868178) (not b!868190) (not b!868193) (not b!868185) (not b_lambda!12127))
(check-sat b_and!24513 (not b_next!14761))
