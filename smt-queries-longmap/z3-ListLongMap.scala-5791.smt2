; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74856 () Bool)

(assert start!74856)

(declare-fun b_free!15337 () Bool)

(declare-fun b_next!15337 () Bool)

(assert (=> start!74856 (= b_free!15337 (not b_next!15337))))

(declare-fun tp!53699 () Bool)

(declare-fun b_and!25303 () Bool)

(assert (=> start!74856 (= tp!53699 b_and!25303)))

(declare-fun b!881329 () Bool)

(declare-fun e!490531 () Bool)

(assert (=> b!881329 (= e!490531 true)))

(declare-datatypes ((array!51323 0))(
  ( (array!51324 (arr!24681 (Array (_ BitVec 32) (_ BitVec 64))) (size!25122 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51323)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!17464 0))(
  ( (Nil!17461) (Cons!17460 (h!18597 (_ BitVec 64)) (t!24595 List!17464)) )
))
(declare-fun arrayNoDuplicates!0 (array!51323 (_ BitVec 32) List!17464) Bool)

(assert (=> b!881329 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17461)))

(declare-datatypes ((Unit!30034 0))(
  ( (Unit!30035) )
))
(declare-fun lt!398481 () Unit!30034)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51323 (_ BitVec 32) (_ BitVec 32)) Unit!30034)

(assert (=> b!881329 (= lt!398481 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881330 () Bool)

(declare-fun res!598511 () Bool)

(declare-fun e!490536 () Bool)

(assert (=> b!881330 (=> (not res!598511) (not e!490536))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28489 0))(
  ( (V!28490 (val!8838 Int)) )
))
(declare-datatypes ((ValueCell!8351 0))(
  ( (ValueCellFull!8351 (v!11286 V!28489)) (EmptyCell!8351) )
))
(declare-datatypes ((array!51325 0))(
  ( (array!51326 (arr!24682 (Array (_ BitVec 32) ValueCell!8351)) (size!25123 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51325)

(assert (=> b!881330 (= res!598511 (and (= (size!25123 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25122 _keys!868) (size!25123 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881331 () Bool)

(declare-fun res!598513 () Bool)

(assert (=> b!881331 (=> (not res!598513) (not e!490536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881331 (= res!598513 (validMask!0 mask!1196))))

(declare-fun b!881333 () Bool)

(declare-fun res!598514 () Bool)

(assert (=> b!881333 (=> (not res!598514) (not e!490536))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881333 (= res!598514 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25122 _keys!868))))))

(declare-fun b!881334 () Bool)

(declare-fun res!598510 () Bool)

(assert (=> b!881334 (=> (not res!598510) (not e!490536))))

(assert (=> b!881334 (= res!598510 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17461))))

(declare-fun b!881335 () Bool)

(declare-fun res!598512 () Bool)

(assert (=> b!881335 (=> (not res!598512) (not e!490536))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!881335 (= res!598512 (and (= (select (arr!24681 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881336 () Bool)

(declare-fun res!598509 () Bool)

(assert (=> b!881336 (=> (not res!598509) (not e!490536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881336 (= res!598509 (validKeyInArray!0 k0!854))))

(declare-fun b!881337 () Bool)

(declare-fun res!598517 () Bool)

(assert (=> b!881337 (=> (not res!598517) (not e!490536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51323 (_ BitVec 32)) Bool)

(assert (=> b!881337 (= res!598517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881338 () Bool)

(declare-fun e!490534 () Bool)

(declare-fun e!490529 () Bool)

(declare-fun mapRes!27993 () Bool)

(assert (=> b!881338 (= e!490534 (and e!490529 mapRes!27993))))

(declare-fun condMapEmpty!27993 () Bool)

(declare-fun mapDefault!27993 () ValueCell!8351)

(assert (=> b!881338 (= condMapEmpty!27993 (= (arr!24682 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8351)) mapDefault!27993)))))

(declare-fun b!881339 () Bool)

(declare-fun e!490535 () Bool)

(assert (=> b!881339 (= e!490535 e!490531)))

(declare-fun res!598516 () Bool)

(assert (=> b!881339 (=> res!598516 e!490531)))

(assert (=> b!881339 (= res!598516 (not (= (select (arr!24681 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11634 0))(
  ( (tuple2!11635 (_1!5828 (_ BitVec 64)) (_2!5828 V!28489)) )
))
(declare-datatypes ((List!17465 0))(
  ( (Nil!17462) (Cons!17461 (h!18598 tuple2!11634) (t!24596 List!17465)) )
))
(declare-datatypes ((ListLongMap!10405 0))(
  ( (ListLongMap!10406 (toList!5218 List!17465)) )
))
(declare-fun lt!398480 () ListLongMap!10405)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398478 () ListLongMap!10405)

(declare-fun +!2533 (ListLongMap!10405 tuple2!11634) ListLongMap!10405)

(declare-fun get!12999 (ValueCell!8351 V!28489) V!28489)

(declare-fun dynLambda!1258 (Int (_ BitVec 64)) V!28489)

(assert (=> b!881339 (= lt!398478 (+!2533 lt!398480 (tuple2!11635 (select (arr!24681 _keys!868) from!1053) (get!12999 (select (arr!24682 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!27993 () Bool)

(declare-fun tp!53700 () Bool)

(declare-fun e!490530 () Bool)

(assert (=> mapNonEmpty!27993 (= mapRes!27993 (and tp!53700 e!490530))))

(declare-fun mapKey!27993 () (_ BitVec 32))

(declare-fun mapValue!27993 () ValueCell!8351)

(declare-fun mapRest!27993 () (Array (_ BitVec 32) ValueCell!8351))

(assert (=> mapNonEmpty!27993 (= (arr!24682 _values!688) (store mapRest!27993 mapKey!27993 mapValue!27993))))

(declare-fun b!881340 () Bool)

(declare-fun tp_is_empty!17581 () Bool)

(assert (=> b!881340 (= e!490530 tp_is_empty!17581)))

(declare-fun b!881341 () Bool)

(declare-fun e!490532 () Bool)

(assert (=> b!881341 (= e!490536 e!490532)))

(declare-fun res!598507 () Bool)

(assert (=> b!881341 (=> (not res!598507) (not e!490532))))

(assert (=> b!881341 (= res!598507 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!28489)

(declare-fun zeroValue!654 () V!28489)

(declare-fun lt!398476 () array!51325)

(declare-fun getCurrentListMapNoExtraKeys!3259 (array!51323 array!51325 (_ BitVec 32) (_ BitVec 32) V!28489 V!28489 (_ BitVec 32) Int) ListLongMap!10405)

(assert (=> b!881341 (= lt!398478 (getCurrentListMapNoExtraKeys!3259 _keys!868 lt!398476 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28489)

(assert (=> b!881341 (= lt!398476 (array!51326 (store (arr!24682 _values!688) i!612 (ValueCellFull!8351 v!557)) (size!25123 _values!688)))))

(declare-fun lt!398474 () ListLongMap!10405)

(assert (=> b!881341 (= lt!398474 (getCurrentListMapNoExtraKeys!3259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27993 () Bool)

(assert (=> mapIsEmpty!27993 mapRes!27993))

(declare-fun b!881342 () Bool)

(assert (=> b!881342 (= e!490532 (not e!490535))))

(declare-fun res!598515 () Bool)

(assert (=> b!881342 (=> res!598515 e!490535)))

(assert (=> b!881342 (= res!598515 (not (validKeyInArray!0 (select (arr!24681 _keys!868) from!1053))))))

(declare-fun lt!398475 () ListLongMap!10405)

(assert (=> b!881342 (= lt!398475 lt!398480)))

(declare-fun lt!398477 () ListLongMap!10405)

(assert (=> b!881342 (= lt!398480 (+!2533 lt!398477 (tuple2!11635 k0!854 v!557)))))

(assert (=> b!881342 (= lt!398475 (getCurrentListMapNoExtraKeys!3259 _keys!868 lt!398476 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881342 (= lt!398477 (getCurrentListMapNoExtraKeys!3259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398479 () Unit!30034)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!699 (array!51323 array!51325 (_ BitVec 32) (_ BitVec 32) V!28489 V!28489 (_ BitVec 32) (_ BitVec 64) V!28489 (_ BitVec 32) Int) Unit!30034)

(assert (=> b!881342 (= lt!398479 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!598508 () Bool)

(assert (=> start!74856 (=> (not res!598508) (not e!490536))))

(assert (=> start!74856 (= res!598508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25122 _keys!868))))))

(assert (=> start!74856 e!490536))

(assert (=> start!74856 tp_is_empty!17581))

(assert (=> start!74856 true))

(assert (=> start!74856 tp!53699))

(declare-fun array_inv!19482 (array!51323) Bool)

(assert (=> start!74856 (array_inv!19482 _keys!868)))

(declare-fun array_inv!19483 (array!51325) Bool)

(assert (=> start!74856 (and (array_inv!19483 _values!688) e!490534)))

(declare-fun b!881332 () Bool)

(assert (=> b!881332 (= e!490529 tp_is_empty!17581)))

(assert (= (and start!74856 res!598508) b!881331))

(assert (= (and b!881331 res!598513) b!881330))

(assert (= (and b!881330 res!598511) b!881337))

(assert (= (and b!881337 res!598517) b!881334))

(assert (= (and b!881334 res!598510) b!881333))

(assert (= (and b!881333 res!598514) b!881336))

(assert (= (and b!881336 res!598509) b!881335))

(assert (= (and b!881335 res!598512) b!881341))

(assert (= (and b!881341 res!598507) b!881342))

(assert (= (and b!881342 (not res!598515)) b!881339))

(assert (= (and b!881339 (not res!598516)) b!881329))

(assert (= (and b!881338 condMapEmpty!27993) mapIsEmpty!27993))

(assert (= (and b!881338 (not condMapEmpty!27993)) mapNonEmpty!27993))

(get-info :version)

(assert (= (and mapNonEmpty!27993 ((_ is ValueCellFull!8351) mapValue!27993)) b!881340))

(assert (= (and b!881338 ((_ is ValueCellFull!8351) mapDefault!27993)) b!881332))

(assert (= start!74856 b!881338))

(declare-fun b_lambda!12459 () Bool)

(assert (=> (not b_lambda!12459) (not b!881339)))

(declare-fun t!24594 () Bool)

(declare-fun tb!4987 () Bool)

(assert (=> (and start!74856 (= defaultEntry!696 defaultEntry!696) t!24594) tb!4987))

(declare-fun result!9607 () Bool)

(assert (=> tb!4987 (= result!9607 tp_is_empty!17581)))

(assert (=> b!881339 t!24594))

(declare-fun b_and!25305 () Bool)

(assert (= b_and!25303 (and (=> t!24594 result!9607) b_and!25305)))

(declare-fun m!821495 () Bool)

(assert (=> b!881334 m!821495))

(declare-fun m!821497 () Bool)

(assert (=> start!74856 m!821497))

(declare-fun m!821499 () Bool)

(assert (=> start!74856 m!821499))

(declare-fun m!821501 () Bool)

(assert (=> b!881336 m!821501))

(declare-fun m!821503 () Bool)

(assert (=> mapNonEmpty!27993 m!821503))

(declare-fun m!821505 () Bool)

(assert (=> b!881339 m!821505))

(declare-fun m!821507 () Bool)

(assert (=> b!881339 m!821507))

(declare-fun m!821509 () Bool)

(assert (=> b!881339 m!821509))

(declare-fun m!821511 () Bool)

(assert (=> b!881339 m!821511))

(assert (=> b!881339 m!821507))

(declare-fun m!821513 () Bool)

(assert (=> b!881339 m!821513))

(assert (=> b!881339 m!821509))

(declare-fun m!821515 () Bool)

(assert (=> b!881331 m!821515))

(declare-fun m!821517 () Bool)

(assert (=> b!881342 m!821517))

(assert (=> b!881342 m!821513))

(declare-fun m!821519 () Bool)

(assert (=> b!881342 m!821519))

(assert (=> b!881342 m!821513))

(declare-fun m!821521 () Bool)

(assert (=> b!881342 m!821521))

(declare-fun m!821523 () Bool)

(assert (=> b!881342 m!821523))

(declare-fun m!821525 () Bool)

(assert (=> b!881342 m!821525))

(declare-fun m!821527 () Bool)

(assert (=> b!881335 m!821527))

(declare-fun m!821529 () Bool)

(assert (=> b!881341 m!821529))

(declare-fun m!821531 () Bool)

(assert (=> b!881341 m!821531))

(declare-fun m!821533 () Bool)

(assert (=> b!881341 m!821533))

(declare-fun m!821535 () Bool)

(assert (=> b!881329 m!821535))

(declare-fun m!821537 () Bool)

(assert (=> b!881329 m!821537))

(declare-fun m!821539 () Bool)

(assert (=> b!881337 m!821539))

(check-sat (not b!881339) (not mapNonEmpty!27993) (not b!881336) (not b!881342) (not start!74856) (not b!881337) (not b_lambda!12459) (not b_next!15337) (not b!881329) (not b!881341) tp_is_empty!17581 b_and!25305 (not b!881331) (not b!881334))
(check-sat b_and!25305 (not b_next!15337))
