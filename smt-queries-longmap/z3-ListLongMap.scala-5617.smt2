; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73654 () Bool)

(assert start!73654)

(declare-fun b_free!14401 () Bool)

(declare-fun b_next!14401 () Bool)

(assert (=> start!73654 (= b_free!14401 (not b_next!14401))))

(declare-fun tp!50708 () Bool)

(declare-fun b_and!23791 () Bool)

(assert (=> start!73654 (= tp!50708 b_and!23791)))

(declare-fun b!859316 () Bool)

(declare-fun res!583519 () Bool)

(declare-fun e!478979 () Bool)

(assert (=> b!859316 (=> (not res!583519) (not e!478979))))

(declare-datatypes ((array!49305 0))(
  ( (array!49306 (arr!23679 (Array (_ BitVec 32) (_ BitVec 64))) (size!24120 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49305)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49305 (_ BitVec 32)) Bool)

(assert (=> b!859316 (= res!583519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26405 () Bool)

(declare-fun mapRes!26405 () Bool)

(declare-fun tp!50707 () Bool)

(declare-fun e!478980 () Bool)

(assert (=> mapNonEmpty!26405 (= mapRes!26405 (and tp!50707 e!478980))))

(declare-fun mapKey!26405 () (_ BitVec 32))

(declare-datatypes ((V!27097 0))(
  ( (V!27098 (val!8316 Int)) )
))
(declare-datatypes ((ValueCell!7829 0))(
  ( (ValueCellFull!7829 (v!10741 V!27097)) (EmptyCell!7829) )
))
(declare-fun mapRest!26405 () (Array (_ BitVec 32) ValueCell!7829))

(declare-fun mapValue!26405 () ValueCell!7829)

(declare-datatypes ((array!49307 0))(
  ( (array!49308 (arr!23680 (Array (_ BitVec 32) ValueCell!7829)) (size!24121 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49307)

(assert (=> mapNonEmpty!26405 (= (arr!23680 _values!688) (store mapRest!26405 mapKey!26405 mapValue!26405))))

(declare-fun b!859317 () Bool)

(declare-fun res!583522 () Bool)

(assert (=> b!859317 (=> (not res!583522) (not e!478979))))

(declare-datatypes ((List!16740 0))(
  ( (Nil!16737) (Cons!16736 (h!17873 (_ BitVec 64)) (t!23399 List!16740)) )
))
(declare-fun arrayNoDuplicates!0 (array!49305 (_ BitVec 32) List!16740) Bool)

(assert (=> b!859317 (= res!583522 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16737))))

(declare-fun b!859318 () Bool)

(declare-fun e!478978 () Bool)

(declare-fun tp_is_empty!16537 () Bool)

(assert (=> b!859318 (= e!478978 tp_is_empty!16537)))

(declare-fun b!859319 () Bool)

(declare-fun res!583516 () Bool)

(assert (=> b!859319 (=> (not res!583516) (not e!478979))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859319 (= res!583516 (and (= (select (arr!23679 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26405 () Bool)

(assert (=> mapIsEmpty!26405 mapRes!26405))

(declare-fun b!859320 () Bool)

(declare-fun e!478984 () Bool)

(assert (=> b!859320 (= e!478979 e!478984)))

(declare-fun res!583513 () Bool)

(assert (=> b!859320 (=> (not res!583513) (not e!478984))))

(assert (=> b!859320 (= res!583513 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387066 () array!49307)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10900 0))(
  ( (tuple2!10901 (_1!5461 (_ BitVec 64)) (_2!5461 V!27097)) )
))
(declare-datatypes ((List!16741 0))(
  ( (Nil!16738) (Cons!16737 (h!17874 tuple2!10900) (t!23400 List!16741)) )
))
(declare-datatypes ((ListLongMap!9671 0))(
  ( (ListLongMap!9672 (toList!4851 List!16741)) )
))
(declare-fun lt!387069 () ListLongMap!9671)

(declare-fun minValue!654 () V!27097)

(declare-fun zeroValue!654 () V!27097)

(declare-fun getCurrentListMapNoExtraKeys!2907 (array!49305 array!49307 (_ BitVec 32) (_ BitVec 32) V!27097 V!27097 (_ BitVec 32) Int) ListLongMap!9671)

(assert (=> b!859320 (= lt!387069 (getCurrentListMapNoExtraKeys!2907 _keys!868 lt!387066 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27097)

(assert (=> b!859320 (= lt!387066 (array!49308 (store (arr!23680 _values!688) i!612 (ValueCellFull!7829 v!557)) (size!24121 _values!688)))))

(declare-fun lt!387067 () ListLongMap!9671)

(assert (=> b!859320 (= lt!387067 (getCurrentListMapNoExtraKeys!2907 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859322 () Bool)

(declare-fun res!583517 () Bool)

(assert (=> b!859322 (=> (not res!583517) (not e!478979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859322 (= res!583517 (validKeyInArray!0 k0!854))))

(declare-fun b!859323 () Bool)

(assert (=> b!859323 (= e!478980 tp_is_empty!16537)))

(declare-fun b!859324 () Bool)

(declare-fun e!478983 () Bool)

(assert (=> b!859324 (= e!478983 (and e!478978 mapRes!26405))))

(declare-fun condMapEmpty!26405 () Bool)

(declare-fun mapDefault!26405 () ValueCell!7829)

(assert (=> b!859324 (= condMapEmpty!26405 (= (arr!23680 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7829)) mapDefault!26405)))))

(declare-fun b!859325 () Bool)

(declare-fun res!583518 () Bool)

(assert (=> b!859325 (=> (not res!583518) (not e!478979))))

(assert (=> b!859325 (= res!583518 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24120 _keys!868))))))

(declare-fun b!859326 () Bool)

(declare-fun res!583521 () Bool)

(assert (=> b!859326 (=> (not res!583521) (not e!478979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859326 (= res!583521 (validMask!0 mask!1196))))

(declare-fun res!583515 () Bool)

(assert (=> start!73654 (=> (not res!583515) (not e!478979))))

(assert (=> start!73654 (= res!583515 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24120 _keys!868))))))

(assert (=> start!73654 e!478979))

(assert (=> start!73654 tp_is_empty!16537))

(assert (=> start!73654 true))

(assert (=> start!73654 tp!50708))

(declare-fun array_inv!18802 (array!49305) Bool)

(assert (=> start!73654 (array_inv!18802 _keys!868)))

(declare-fun array_inv!18803 (array!49307) Bool)

(assert (=> start!73654 (and (array_inv!18803 _values!688) e!478983)))

(declare-fun b!859321 () Bool)

(declare-fun e!478982 () Bool)

(assert (=> b!859321 (= e!478984 (not e!478982))))

(declare-fun res!583520 () Bool)

(assert (=> b!859321 (=> res!583520 e!478982)))

(assert (=> b!859321 (= res!583520 (not (validKeyInArray!0 (select (arr!23679 _keys!868) from!1053))))))

(declare-fun lt!387071 () ListLongMap!9671)

(declare-fun lt!387065 () ListLongMap!9671)

(assert (=> b!859321 (= lt!387071 lt!387065)))

(declare-fun lt!387068 () ListLongMap!9671)

(declare-fun +!2257 (ListLongMap!9671 tuple2!10900) ListLongMap!9671)

(assert (=> b!859321 (= lt!387065 (+!2257 lt!387068 (tuple2!10901 k0!854 v!557)))))

(assert (=> b!859321 (= lt!387071 (getCurrentListMapNoExtraKeys!2907 _keys!868 lt!387066 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859321 (= lt!387068 (getCurrentListMapNoExtraKeys!2907 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29268 0))(
  ( (Unit!29269) )
))
(declare-fun lt!387070 () Unit!29268)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!454 (array!49305 array!49307 (_ BitVec 32) (_ BitVec 32) V!27097 V!27097 (_ BitVec 32) (_ BitVec 64) V!27097 (_ BitVec 32) Int) Unit!29268)

(assert (=> b!859321 (= lt!387070 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!454 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859327 () Bool)

(declare-fun res!583514 () Bool)

(assert (=> b!859327 (=> (not res!583514) (not e!478979))))

(assert (=> b!859327 (= res!583514 (and (= (size!24121 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24120 _keys!868) (size!24121 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859328 () Bool)

(assert (=> b!859328 (= e!478982 true)))

(declare-fun get!12475 (ValueCell!7829 V!27097) V!27097)

(declare-fun dynLambda!1091 (Int (_ BitVec 64)) V!27097)

(assert (=> b!859328 (= lt!387069 (+!2257 lt!387065 (tuple2!10901 (select (arr!23679 _keys!868) from!1053) (get!12475 (select (arr!23680 _values!688) from!1053) (dynLambda!1091 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73654 res!583515) b!859326))

(assert (= (and b!859326 res!583521) b!859327))

(assert (= (and b!859327 res!583514) b!859316))

(assert (= (and b!859316 res!583519) b!859317))

(assert (= (and b!859317 res!583522) b!859325))

(assert (= (and b!859325 res!583518) b!859322))

(assert (= (and b!859322 res!583517) b!859319))

(assert (= (and b!859319 res!583516) b!859320))

(assert (= (and b!859320 res!583513) b!859321))

(assert (= (and b!859321 (not res!583520)) b!859328))

(assert (= (and b!859324 condMapEmpty!26405) mapIsEmpty!26405))

(assert (= (and b!859324 (not condMapEmpty!26405)) mapNonEmpty!26405))

(get-info :version)

(assert (= (and mapNonEmpty!26405 ((_ is ValueCellFull!7829) mapValue!26405)) b!859323))

(assert (= (and b!859324 ((_ is ValueCellFull!7829) mapDefault!26405)) b!859318))

(assert (= start!73654 b!859324))

(declare-fun b_lambda!11767 () Bool)

(assert (=> (not b_lambda!11767) (not b!859328)))

(declare-fun t!23398 () Bool)

(declare-fun tb!4515 () Bool)

(assert (=> (and start!73654 (= defaultEntry!696 defaultEntry!696) t!23398) tb!4515))

(declare-fun result!8649 () Bool)

(assert (=> tb!4515 (= result!8649 tp_is_empty!16537)))

(assert (=> b!859328 t!23398))

(declare-fun b_and!23793 () Bool)

(assert (= b_and!23791 (and (=> t!23398 result!8649) b_and!23793)))

(declare-fun m!800417 () Bool)

(assert (=> b!859322 m!800417))

(declare-fun m!800419 () Bool)

(assert (=> b!859316 m!800419))

(declare-fun m!800421 () Bool)

(assert (=> b!859319 m!800421))

(declare-fun m!800423 () Bool)

(assert (=> b!859326 m!800423))

(declare-fun m!800425 () Bool)

(assert (=> start!73654 m!800425))

(declare-fun m!800427 () Bool)

(assert (=> start!73654 m!800427))

(declare-fun m!800429 () Bool)

(assert (=> mapNonEmpty!26405 m!800429))

(declare-fun m!800431 () Bool)

(assert (=> b!859321 m!800431))

(declare-fun m!800433 () Bool)

(assert (=> b!859321 m!800433))

(declare-fun m!800435 () Bool)

(assert (=> b!859321 m!800435))

(declare-fun m!800437 () Bool)

(assert (=> b!859321 m!800437))

(assert (=> b!859321 m!800435))

(declare-fun m!800439 () Bool)

(assert (=> b!859321 m!800439))

(declare-fun m!800441 () Bool)

(assert (=> b!859321 m!800441))

(declare-fun m!800443 () Bool)

(assert (=> b!859320 m!800443))

(declare-fun m!800445 () Bool)

(assert (=> b!859320 m!800445))

(declare-fun m!800447 () Bool)

(assert (=> b!859320 m!800447))

(declare-fun m!800449 () Bool)

(assert (=> b!859317 m!800449))

(declare-fun m!800451 () Bool)

(assert (=> b!859328 m!800451))

(declare-fun m!800453 () Bool)

(assert (=> b!859328 m!800453))

(declare-fun m!800455 () Bool)

(assert (=> b!859328 m!800455))

(declare-fun m!800457 () Bool)

(assert (=> b!859328 m!800457))

(assert (=> b!859328 m!800453))

(assert (=> b!859328 m!800435))

(assert (=> b!859328 m!800455))

(check-sat tp_is_empty!16537 b_and!23793 (not b!859328) (not start!73654) (not b!859326) (not b!859322) (not b_next!14401) (not b_lambda!11767) (not b!859320) (not b!859317) (not mapNonEmpty!26405) (not b!859321) (not b!859316))
(check-sat b_and!23793 (not b_next!14401))
