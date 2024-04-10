; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73500 () Bool)

(assert start!73500)

(declare-fun b_free!14415 () Bool)

(declare-fun b_next!14415 () Bool)

(assert (=> start!73500 (= b_free!14415 (not b_next!14415))))

(declare-fun tp!50749 () Bool)

(declare-fun b_and!23809 () Bool)

(assert (=> start!73500 (= tp!50749 b_and!23809)))

(declare-fun b!858714 () Bool)

(declare-fun e!478560 () Bool)

(assert (=> b!858714 (= e!478560 true)))

(declare-datatypes ((array!49286 0))(
  ( (array!49287 (arr!23674 (Array (_ BitVec 32) (_ BitVec 64))) (size!24114 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49286)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16796 0))(
  ( (Nil!16793) (Cons!16792 (h!17923 (_ BitVec 64)) (t!23477 List!16796)) )
))
(declare-fun arrayNoDuplicates!0 (array!49286 (_ BitVec 32) List!16796) Bool)

(assert (=> b!858714 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16793)))

(declare-datatypes ((Unit!29277 0))(
  ( (Unit!29278) )
))
(declare-fun lt!386871 () Unit!29277)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49286 (_ BitVec 32) (_ BitVec 32)) Unit!29277)

(assert (=> b!858714 (= lt!386871 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!26426 () Bool)

(declare-fun mapRes!26426 () Bool)

(declare-fun tp!50748 () Bool)

(declare-fun e!478562 () Bool)

(assert (=> mapNonEmpty!26426 (= mapRes!26426 (and tp!50748 e!478562))))

(declare-datatypes ((V!27115 0))(
  ( (V!27116 (val!8323 Int)) )
))
(declare-datatypes ((ValueCell!7836 0))(
  ( (ValueCellFull!7836 (v!10748 V!27115)) (EmptyCell!7836) )
))
(declare-fun mapValue!26426 () ValueCell!7836)

(declare-fun mapKey!26426 () (_ BitVec 32))

(declare-fun mapRest!26426 () (Array (_ BitVec 32) ValueCell!7836))

(declare-datatypes ((array!49288 0))(
  ( (array!49289 (arr!23675 (Array (_ BitVec 32) ValueCell!7836)) (size!24115 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49288)

(assert (=> mapNonEmpty!26426 (= (arr!23675 _values!688) (store mapRest!26426 mapKey!26426 mapValue!26426))))

(declare-fun b!858715 () Bool)

(declare-fun res!583399 () Bool)

(declare-fun e!478557 () Bool)

(assert (=> b!858715 (=> (not res!583399) (not e!478557))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!858715 (= res!583399 (and (= (select (arr!23674 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858716 () Bool)

(declare-fun res!583396 () Bool)

(assert (=> b!858716 (=> (not res!583396) (not e!478557))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!858716 (= res!583396 (and (= (size!24115 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24114 _keys!868) (size!24115 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26426 () Bool)

(assert (=> mapIsEmpty!26426 mapRes!26426))

(declare-fun b!858717 () Bool)

(declare-fun res!583397 () Bool)

(assert (=> b!858717 (=> (not res!583397) (not e!478557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49286 (_ BitVec 32)) Bool)

(assert (=> b!858717 (= res!583397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858718 () Bool)

(declare-fun res!583394 () Bool)

(assert (=> b!858718 (=> (not res!583394) (not e!478557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858718 (= res!583394 (validMask!0 mask!1196))))

(declare-fun b!858719 () Bool)

(declare-fun e!478559 () Bool)

(assert (=> b!858719 (= e!478559 e!478560)))

(declare-fun res!583395 () Bool)

(assert (=> b!858719 (=> res!583395 e!478560)))

(assert (=> b!858719 (= res!583395 (not (= (select (arr!23674 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10988 0))(
  ( (tuple2!10989 (_1!5505 (_ BitVec 64)) (_2!5505 V!27115)) )
))
(declare-datatypes ((List!16797 0))(
  ( (Nil!16794) (Cons!16793 (h!17924 tuple2!10988) (t!23478 List!16797)) )
))
(declare-datatypes ((ListLongMap!9757 0))(
  ( (ListLongMap!9758 (toList!4894 List!16797)) )
))
(declare-fun lt!386866 () ListLongMap!9757)

(declare-fun lt!386870 () ListLongMap!9757)

(declare-fun +!2247 (ListLongMap!9757 tuple2!10988) ListLongMap!9757)

(declare-fun get!12469 (ValueCell!7836 V!27115) V!27115)

(declare-fun dynLambda!1087 (Int (_ BitVec 64)) V!27115)

(assert (=> b!858719 (= lt!386870 (+!2247 lt!386866 (tuple2!10989 (select (arr!23674 _keys!868) from!1053) (get!12469 (select (arr!23675 _values!688) from!1053) (dynLambda!1087 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858720 () Bool)

(declare-fun e!478563 () Bool)

(declare-fun tp_is_empty!16551 () Bool)

(assert (=> b!858720 (= e!478563 tp_is_empty!16551)))

(declare-fun b!858722 () Bool)

(assert (=> b!858722 (= e!478562 tp_is_empty!16551)))

(declare-fun b!858723 () Bool)

(declare-fun e!478558 () Bool)

(assert (=> b!858723 (= e!478557 e!478558)))

(declare-fun res!583403 () Bool)

(assert (=> b!858723 (=> (not res!583403) (not e!478558))))

(assert (=> b!858723 (= res!583403 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27115)

(declare-fun zeroValue!654 () V!27115)

(declare-fun lt!386865 () array!49288)

(declare-fun getCurrentListMapNoExtraKeys!2874 (array!49286 array!49288 (_ BitVec 32) (_ BitVec 32) V!27115 V!27115 (_ BitVec 32) Int) ListLongMap!9757)

(assert (=> b!858723 (= lt!386870 (getCurrentListMapNoExtraKeys!2874 _keys!868 lt!386865 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27115)

(assert (=> b!858723 (= lt!386865 (array!49289 (store (arr!23675 _values!688) i!612 (ValueCellFull!7836 v!557)) (size!24115 _values!688)))))

(declare-fun lt!386869 () ListLongMap!9757)

(assert (=> b!858723 (= lt!386869 (getCurrentListMapNoExtraKeys!2874 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858724 () Bool)

(assert (=> b!858724 (= e!478558 (not e!478559))))

(declare-fun res!583401 () Bool)

(assert (=> b!858724 (=> res!583401 e!478559)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858724 (= res!583401 (not (validKeyInArray!0 (select (arr!23674 _keys!868) from!1053))))))

(declare-fun lt!386868 () ListLongMap!9757)

(assert (=> b!858724 (= lt!386868 lt!386866)))

(declare-fun lt!386867 () ListLongMap!9757)

(assert (=> b!858724 (= lt!386866 (+!2247 lt!386867 (tuple2!10989 k0!854 v!557)))))

(assert (=> b!858724 (= lt!386868 (getCurrentListMapNoExtraKeys!2874 _keys!868 lt!386865 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858724 (= lt!386867 (getCurrentListMapNoExtraKeys!2874 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386872 () Unit!29277)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!464 (array!49286 array!49288 (_ BitVec 32) (_ BitVec 32) V!27115 V!27115 (_ BitVec 32) (_ BitVec 64) V!27115 (_ BitVec 32) Int) Unit!29277)

(assert (=> b!858724 (= lt!386872 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!464 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858725 () Bool)

(declare-fun res!583398 () Bool)

(assert (=> b!858725 (=> (not res!583398) (not e!478557))))

(assert (=> b!858725 (= res!583398 (validKeyInArray!0 k0!854))))

(declare-fun b!858726 () Bool)

(declare-fun res!583393 () Bool)

(assert (=> b!858726 (=> (not res!583393) (not e!478557))))

(assert (=> b!858726 (= res!583393 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16793))))

(declare-fun b!858727 () Bool)

(declare-fun e!478564 () Bool)

(assert (=> b!858727 (= e!478564 (and e!478563 mapRes!26426))))

(declare-fun condMapEmpty!26426 () Bool)

(declare-fun mapDefault!26426 () ValueCell!7836)

(assert (=> b!858727 (= condMapEmpty!26426 (= (arr!23675 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7836)) mapDefault!26426)))))

(declare-fun res!583400 () Bool)

(assert (=> start!73500 (=> (not res!583400) (not e!478557))))

(assert (=> start!73500 (= res!583400 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24114 _keys!868))))))

(assert (=> start!73500 e!478557))

(assert (=> start!73500 tp_is_empty!16551))

(assert (=> start!73500 true))

(assert (=> start!73500 tp!50749))

(declare-fun array_inv!18750 (array!49286) Bool)

(assert (=> start!73500 (array_inv!18750 _keys!868)))

(declare-fun array_inv!18751 (array!49288) Bool)

(assert (=> start!73500 (and (array_inv!18751 _values!688) e!478564)))

(declare-fun b!858721 () Bool)

(declare-fun res!583402 () Bool)

(assert (=> b!858721 (=> (not res!583402) (not e!478557))))

(assert (=> b!858721 (= res!583402 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24114 _keys!868))))))

(assert (= (and start!73500 res!583400) b!858718))

(assert (= (and b!858718 res!583394) b!858716))

(assert (= (and b!858716 res!583396) b!858717))

(assert (= (and b!858717 res!583397) b!858726))

(assert (= (and b!858726 res!583393) b!858721))

(assert (= (and b!858721 res!583402) b!858725))

(assert (= (and b!858725 res!583398) b!858715))

(assert (= (and b!858715 res!583399) b!858723))

(assert (= (and b!858723 res!583403) b!858724))

(assert (= (and b!858724 (not res!583401)) b!858719))

(assert (= (and b!858719 (not res!583395)) b!858714))

(assert (= (and b!858727 condMapEmpty!26426) mapIsEmpty!26426))

(assert (= (and b!858727 (not condMapEmpty!26426)) mapNonEmpty!26426))

(get-info :version)

(assert (= (and mapNonEmpty!26426 ((_ is ValueCellFull!7836) mapValue!26426)) b!858722))

(assert (= (and b!858727 ((_ is ValueCellFull!7836) mapDefault!26426)) b!858720))

(assert (= start!73500 b!858727))

(declare-fun b_lambda!11767 () Bool)

(assert (=> (not b_lambda!11767) (not b!858719)))

(declare-fun t!23476 () Bool)

(declare-fun tb!4537 () Bool)

(assert (=> (and start!73500 (= defaultEntry!696 defaultEntry!696) t!23476) tb!4537))

(declare-fun result!8685 () Bool)

(assert (=> tb!4537 (= result!8685 tp_is_empty!16551)))

(assert (=> b!858719 t!23476))

(declare-fun b_and!23811 () Bool)

(assert (= b_and!23809 (and (=> t!23476 result!8685) b_and!23811)))

(declare-fun m!799437 () Bool)

(assert (=> b!858719 m!799437))

(declare-fun m!799439 () Bool)

(assert (=> b!858719 m!799439))

(declare-fun m!799441 () Bool)

(assert (=> b!858719 m!799441))

(declare-fun m!799443 () Bool)

(assert (=> b!858719 m!799443))

(assert (=> b!858719 m!799439))

(declare-fun m!799445 () Bool)

(assert (=> b!858719 m!799445))

(assert (=> b!858719 m!799441))

(declare-fun m!799447 () Bool)

(assert (=> b!858718 m!799447))

(declare-fun m!799449 () Bool)

(assert (=> start!73500 m!799449))

(declare-fun m!799451 () Bool)

(assert (=> start!73500 m!799451))

(declare-fun m!799453 () Bool)

(assert (=> b!858715 m!799453))

(declare-fun m!799455 () Bool)

(assert (=> mapNonEmpty!26426 m!799455))

(declare-fun m!799457 () Bool)

(assert (=> b!858717 m!799457))

(declare-fun m!799459 () Bool)

(assert (=> b!858725 m!799459))

(declare-fun m!799461 () Bool)

(assert (=> b!858726 m!799461))

(declare-fun m!799463 () Bool)

(assert (=> b!858714 m!799463))

(declare-fun m!799465 () Bool)

(assert (=> b!858714 m!799465))

(declare-fun m!799467 () Bool)

(assert (=> b!858724 m!799467))

(declare-fun m!799469 () Bool)

(assert (=> b!858724 m!799469))

(assert (=> b!858724 m!799445))

(declare-fun m!799471 () Bool)

(assert (=> b!858724 m!799471))

(assert (=> b!858724 m!799445))

(declare-fun m!799473 () Bool)

(assert (=> b!858724 m!799473))

(declare-fun m!799475 () Bool)

(assert (=> b!858724 m!799475))

(declare-fun m!799477 () Bool)

(assert (=> b!858723 m!799477))

(declare-fun m!799479 () Bool)

(assert (=> b!858723 m!799479))

(declare-fun m!799481 () Bool)

(assert (=> b!858723 m!799481))

(check-sat (not b!858726) (not b!858725) tp_is_empty!16551 (not start!73500) b_and!23811 (not b_next!14415) (not b!858718) (not b!858723) (not b_lambda!11767) (not b!858717) (not b!858724) (not b!858714) (not b!858719) (not mapNonEmpty!26426))
(check-sat b_and!23811 (not b_next!14415))
