; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74428 () Bool)

(assert start!74428)

(declare-fun b_free!15171 () Bool)

(declare-fun b_next!15171 () Bool)

(assert (=> start!74428 (= b_free!15171 (not b_next!15171))))

(declare-fun tp!53190 () Bool)

(declare-fun b_and!24995 () Bool)

(assert (=> start!74428 (= tp!53190 b_and!24995)))

(declare-fun b!876529 () Bool)

(declare-fun e!487940 () Bool)

(declare-fun e!487934 () Bool)

(declare-fun mapRes!27734 () Bool)

(assert (=> b!876529 (= e!487940 (and e!487934 mapRes!27734))))

(declare-fun condMapEmpty!27734 () Bool)

(declare-datatypes ((V!28267 0))(
  ( (V!28268 (val!8755 Int)) )
))
(declare-datatypes ((ValueCell!8268 0))(
  ( (ValueCellFull!8268 (v!11188 V!28267)) (EmptyCell!8268) )
))
(declare-datatypes ((array!50956 0))(
  ( (array!50957 (arr!24505 (Array (_ BitVec 32) ValueCell!8268)) (size!24945 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50956)

(declare-fun mapDefault!27734 () ValueCell!8268)

(assert (=> b!876529 (= condMapEmpty!27734 (= (arr!24505 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8268)) mapDefault!27734)))))

(declare-fun b!876530 () Bool)

(declare-fun res!595611 () Bool)

(declare-fun e!487938 () Bool)

(assert (=> b!876530 (=> (not res!595611) (not e!487938))))

(declare-datatypes ((array!50958 0))(
  ( (array!50959 (arr!24506 (Array (_ BitVec 32) (_ BitVec 64))) (size!24946 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50958)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50958 (_ BitVec 32)) Bool)

(assert (=> b!876530 (= res!595611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38753 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11576 0))(
  ( (tuple2!11577 (_1!5799 (_ BitVec 64)) (_2!5799 V!28267)) )
))
(declare-datatypes ((List!17393 0))(
  ( (Nil!17390) (Cons!17389 (h!18520 tuple2!11576) (t!24468 List!17393)) )
))
(declare-datatypes ((ListLongMap!10345 0))(
  ( (ListLongMap!10346 (toList!5188 List!17393)) )
))
(declare-fun call!38757 () ListLongMap!10345)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28267)

(declare-fun zeroValue!654 () V!28267)

(declare-fun getCurrentListMapNoExtraKeys!3155 (array!50958 array!50956 (_ BitVec 32) (_ BitVec 32) V!28267 V!28267 (_ BitVec 32) Int) ListLongMap!10345)

(assert (=> bm!38753 (= call!38757 (getCurrentListMapNoExtraKeys!3155 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876531 () Bool)

(declare-fun e!487937 () Bool)

(declare-fun call!38756 () ListLongMap!10345)

(assert (=> b!876531 (= e!487937 (= call!38756 call!38757))))

(declare-fun res!595618 () Bool)

(assert (=> start!74428 (=> (not res!595618) (not e!487938))))

(assert (=> start!74428 (= res!595618 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24946 _keys!868))))))

(assert (=> start!74428 e!487938))

(declare-fun tp_is_empty!17415 () Bool)

(assert (=> start!74428 tp_is_empty!17415))

(assert (=> start!74428 true))

(assert (=> start!74428 tp!53190))

(declare-fun array_inv!19318 (array!50958) Bool)

(assert (=> start!74428 (array_inv!19318 _keys!868)))

(declare-fun array_inv!19319 (array!50956) Bool)

(assert (=> start!74428 (and (array_inv!19319 _values!688) e!487940)))

(declare-fun b!876532 () Bool)

(declare-fun e!487935 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876532 (= e!487935 (bvslt i!612 (size!24945 _values!688)))))

(declare-fun lt!396541 () tuple2!11576)

(declare-fun lt!396534 () V!28267)

(declare-fun lt!396542 () ListLongMap!10345)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2488 (ListLongMap!10345 tuple2!11576) ListLongMap!10345)

(assert (=> b!876532 (= (+!2488 lt!396542 lt!396541) (+!2488 (+!2488 lt!396542 (tuple2!11577 k0!854 lt!396534)) lt!396541))))

(declare-fun lt!396538 () V!28267)

(assert (=> b!876532 (= lt!396541 (tuple2!11577 k0!854 lt!396538))))

(declare-datatypes ((Unit!29974 0))(
  ( (Unit!29975) )
))
(declare-fun lt!396536 () Unit!29974)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!321 (ListLongMap!10345 (_ BitVec 64) V!28267 V!28267) Unit!29974)

(assert (=> b!876532 (= lt!396536 (addSameAsAddTwiceSameKeyDiffValues!321 lt!396542 k0!854 lt!396534 lt!396538))))

(declare-fun lt!396539 () V!28267)

(declare-fun get!12887 (ValueCell!8268 V!28267) V!28267)

(assert (=> b!876532 (= lt!396534 (get!12887 (select (arr!24505 _values!688) from!1053) lt!396539))))

(declare-fun lt!396537 () ListLongMap!10345)

(assert (=> b!876532 (= lt!396537 (+!2488 lt!396542 (tuple2!11577 (select (arr!24506 _keys!868) from!1053) lt!396538)))))

(declare-fun v!557 () V!28267)

(assert (=> b!876532 (= lt!396538 (get!12887 (select (store (arr!24505 _values!688) i!612 (ValueCellFull!8268 v!557)) from!1053) lt!396539))))

(declare-fun dynLambda!1215 (Int (_ BitVec 64)) V!28267)

(assert (=> b!876532 (= lt!396539 (dynLambda!1215 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!396543 () array!50956)

(assert (=> b!876532 (= lt!396542 (getCurrentListMapNoExtraKeys!3155 _keys!868 lt!396543 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876533 () Bool)

(declare-fun res!595615 () Bool)

(assert (=> b!876533 (=> (not res!595615) (not e!487938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876533 (= res!595615 (validMask!0 mask!1196))))

(declare-fun b!876534 () Bool)

(assert (=> b!876534 (= e!487934 tp_is_empty!17415)))

(declare-fun b!876535 () Bool)

(declare-fun res!595616 () Bool)

(assert (=> b!876535 (=> (not res!595616) (not e!487938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876535 (= res!595616 (validKeyInArray!0 k0!854))))

(declare-fun b!876536 () Bool)

(declare-fun res!595612 () Bool)

(assert (=> b!876536 (=> (not res!595612) (not e!487938))))

(assert (=> b!876536 (= res!595612 (and (= (select (arr!24506 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876537 () Bool)

(declare-fun e!487941 () Bool)

(assert (=> b!876537 (= e!487941 (not e!487935))))

(declare-fun res!595619 () Bool)

(assert (=> b!876537 (=> res!595619 e!487935)))

(assert (=> b!876537 (= res!595619 (not (validKeyInArray!0 (select (arr!24506 _keys!868) from!1053))))))

(assert (=> b!876537 e!487937))

(declare-fun c!92606 () Bool)

(assert (=> b!876537 (= c!92606 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!396535 () Unit!29974)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!680 (array!50958 array!50956 (_ BitVec 32) (_ BitVec 32) V!28267 V!28267 (_ BitVec 32) (_ BitVec 64) V!28267 (_ BitVec 32) Int) Unit!29974)

(assert (=> b!876537 (= lt!396535 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!680 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27734 () Bool)

(assert (=> mapIsEmpty!27734 mapRes!27734))

(declare-fun bm!38754 () Bool)

(assert (=> bm!38754 (= call!38756 (getCurrentListMapNoExtraKeys!3155 _keys!868 lt!396543 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876538 () Bool)

(declare-fun res!595613 () Bool)

(assert (=> b!876538 (=> (not res!595613) (not e!487938))))

(assert (=> b!876538 (= res!595613 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24946 _keys!868))))))

(declare-fun b!876539 () Bool)

(assert (=> b!876539 (= e!487938 e!487941)))

(declare-fun res!595617 () Bool)

(assert (=> b!876539 (=> (not res!595617) (not e!487941))))

(assert (=> b!876539 (= res!595617 (= from!1053 i!612))))

(assert (=> b!876539 (= lt!396537 (getCurrentListMapNoExtraKeys!3155 _keys!868 lt!396543 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876539 (= lt!396543 (array!50957 (store (arr!24505 _values!688) i!612 (ValueCellFull!8268 v!557)) (size!24945 _values!688)))))

(declare-fun lt!396540 () ListLongMap!10345)

(assert (=> b!876539 (= lt!396540 (getCurrentListMapNoExtraKeys!3155 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876540 () Bool)

(declare-fun res!595614 () Bool)

(assert (=> b!876540 (=> (not res!595614) (not e!487938))))

(declare-datatypes ((List!17394 0))(
  ( (Nil!17391) (Cons!17390 (h!18521 (_ BitVec 64)) (t!24469 List!17394)) )
))
(declare-fun arrayNoDuplicates!0 (array!50958 (_ BitVec 32) List!17394) Bool)

(assert (=> b!876540 (= res!595614 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17391))))

(declare-fun mapNonEmpty!27734 () Bool)

(declare-fun tp!53191 () Bool)

(declare-fun e!487939 () Bool)

(assert (=> mapNonEmpty!27734 (= mapRes!27734 (and tp!53191 e!487939))))

(declare-fun mapKey!27734 () (_ BitVec 32))

(declare-fun mapRest!27734 () (Array (_ BitVec 32) ValueCell!8268))

(declare-fun mapValue!27734 () ValueCell!8268)

(assert (=> mapNonEmpty!27734 (= (arr!24505 _values!688) (store mapRest!27734 mapKey!27734 mapValue!27734))))

(declare-fun b!876541 () Bool)

(assert (=> b!876541 (= e!487937 (= call!38756 (+!2488 call!38757 (tuple2!11577 k0!854 v!557))))))

(declare-fun b!876542 () Bool)

(assert (=> b!876542 (= e!487939 tp_is_empty!17415)))

(declare-fun b!876543 () Bool)

(declare-fun res!595610 () Bool)

(assert (=> b!876543 (=> (not res!595610) (not e!487938))))

(assert (=> b!876543 (= res!595610 (and (= (size!24945 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24946 _keys!868) (size!24945 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74428 res!595618) b!876533))

(assert (= (and b!876533 res!595615) b!876543))

(assert (= (and b!876543 res!595610) b!876530))

(assert (= (and b!876530 res!595611) b!876540))

(assert (= (and b!876540 res!595614) b!876538))

(assert (= (and b!876538 res!595613) b!876535))

(assert (= (and b!876535 res!595616) b!876536))

(assert (= (and b!876536 res!595612) b!876539))

(assert (= (and b!876539 res!595617) b!876537))

(assert (= (and b!876537 c!92606) b!876541))

(assert (= (and b!876537 (not c!92606)) b!876531))

(assert (= (or b!876541 b!876531) bm!38754))

(assert (= (or b!876541 b!876531) bm!38753))

(assert (= (and b!876537 (not res!595619)) b!876532))

(assert (= (and b!876529 condMapEmpty!27734) mapIsEmpty!27734))

(assert (= (and b!876529 (not condMapEmpty!27734)) mapNonEmpty!27734))

(get-info :version)

(assert (= (and mapNonEmpty!27734 ((_ is ValueCellFull!8268) mapValue!27734)) b!876542))

(assert (= (and b!876529 ((_ is ValueCellFull!8268) mapDefault!27734)) b!876534))

(assert (= start!74428 b!876529))

(declare-fun b_lambda!12239 () Bool)

(assert (=> (not b_lambda!12239) (not b!876532)))

(declare-fun t!24467 () Bool)

(declare-fun tb!4931 () Bool)

(assert (=> (and start!74428 (= defaultEntry!696 defaultEntry!696) t!24467) tb!4931))

(declare-fun result!9481 () Bool)

(assert (=> tb!4931 (= result!9481 tp_is_empty!17415)))

(assert (=> b!876532 t!24467))

(declare-fun b_and!24997 () Bool)

(assert (= b_and!24995 (and (=> t!24467 result!9481) b_and!24997)))

(declare-fun m!816293 () Bool)

(assert (=> b!876540 m!816293))

(declare-fun m!816295 () Bool)

(assert (=> b!876541 m!816295))

(declare-fun m!816297 () Bool)

(assert (=> b!876533 m!816297))

(declare-fun m!816299 () Bool)

(assert (=> b!876535 m!816299))

(declare-fun m!816301 () Bool)

(assert (=> bm!38754 m!816301))

(declare-fun m!816303 () Bool)

(assert (=> b!876537 m!816303))

(assert (=> b!876537 m!816303))

(declare-fun m!816305 () Bool)

(assert (=> b!876537 m!816305))

(declare-fun m!816307 () Bool)

(assert (=> b!876537 m!816307))

(declare-fun m!816309 () Bool)

(assert (=> bm!38753 m!816309))

(declare-fun m!816311 () Bool)

(assert (=> start!74428 m!816311))

(declare-fun m!816313 () Bool)

(assert (=> start!74428 m!816313))

(declare-fun m!816315 () Bool)

(assert (=> b!876536 m!816315))

(declare-fun m!816317 () Bool)

(assert (=> mapNonEmpty!27734 m!816317))

(declare-fun m!816319 () Bool)

(assert (=> b!876532 m!816319))

(declare-fun m!816321 () Bool)

(assert (=> b!876532 m!816321))

(declare-fun m!816323 () Bool)

(assert (=> b!876532 m!816323))

(declare-fun m!816325 () Bool)

(assert (=> b!876532 m!816325))

(declare-fun m!816327 () Bool)

(assert (=> b!876532 m!816327))

(declare-fun m!816329 () Bool)

(assert (=> b!876532 m!816329))

(declare-fun m!816331 () Bool)

(assert (=> b!876532 m!816331))

(assert (=> b!876532 m!816329))

(declare-fun m!816333 () Bool)

(assert (=> b!876532 m!816333))

(assert (=> b!876532 m!816325))

(assert (=> b!876532 m!816303))

(declare-fun m!816335 () Bool)

(assert (=> b!876532 m!816335))

(assert (=> b!876532 m!816323))

(declare-fun m!816337 () Bool)

(assert (=> b!876532 m!816337))

(assert (=> b!876532 m!816301))

(declare-fun m!816339 () Bool)

(assert (=> b!876532 m!816339))

(declare-fun m!816341 () Bool)

(assert (=> b!876530 m!816341))

(declare-fun m!816343 () Bool)

(assert (=> b!876539 m!816343))

(assert (=> b!876539 m!816339))

(declare-fun m!816345 () Bool)

(assert (=> b!876539 m!816345))

(check-sat (not start!74428) (not b!876535) (not b!876537) (not b!876532) (not b!876541) (not b_next!15171) (not bm!38754) (not b!876533) (not mapNonEmpty!27734) (not b_lambda!12239) tp_is_empty!17415 (not b!876540) b_and!24997 (not b!876539) (not bm!38753) (not b!876530))
(check-sat b_and!24997 (not b_next!15171))
