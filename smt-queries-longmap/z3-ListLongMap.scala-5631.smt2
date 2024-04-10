; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73572 () Bool)

(assert start!73572)

(declare-fun b_free!14487 () Bool)

(declare-fun b_next!14487 () Bool)

(assert (=> start!73572 (= b_free!14487 (not b_next!14487))))

(declare-fun tp!50964 () Bool)

(declare-fun b_and!23953 () Bool)

(assert (=> start!73572 (= tp!50964 b_and!23953)))

(declare-fun b!860502 () Bool)

(declare-fun res!584792 () Bool)

(declare-fun e!479497 () Bool)

(assert (=> b!860502 (=> (not res!584792) (not e!479497))))

(declare-datatypes ((array!49422 0))(
  ( (array!49423 (arr!23742 (Array (_ BitVec 32) (_ BitVec 64))) (size!24182 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49422)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49422 (_ BitVec 32)) Bool)

(assert (=> b!860502 (= res!584792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860503 () Bool)

(declare-fun e!479496 () Bool)

(declare-fun e!479492 () Bool)

(declare-fun mapRes!26534 () Bool)

(assert (=> b!860503 (= e!479496 (and e!479492 mapRes!26534))))

(declare-fun condMapEmpty!26534 () Bool)

(declare-datatypes ((V!27211 0))(
  ( (V!27212 (val!8359 Int)) )
))
(declare-datatypes ((ValueCell!7872 0))(
  ( (ValueCellFull!7872 (v!10784 V!27211)) (EmptyCell!7872) )
))
(declare-datatypes ((array!49424 0))(
  ( (array!49425 (arr!23743 (Array (_ BitVec 32) ValueCell!7872)) (size!24183 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49424)

(declare-fun mapDefault!26534 () ValueCell!7872)

(assert (=> b!860503 (= condMapEmpty!26534 (= (arr!23743 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7872)) mapDefault!26534)))))

(declare-fun b!860504 () Bool)

(declare-fun res!584790 () Bool)

(assert (=> b!860504 (=> (not res!584790) (not e!479497))))

(declare-datatypes ((List!16856 0))(
  ( (Nil!16853) (Cons!16852 (h!17983 (_ BitVec 64)) (t!23609 List!16856)) )
))
(declare-fun arrayNoDuplicates!0 (array!49422 (_ BitVec 32) List!16856) Bool)

(assert (=> b!860504 (= res!584790 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16853))))

(declare-fun b!860505 () Bool)

(declare-fun e!479491 () Bool)

(assert (=> b!860505 (= e!479497 e!479491)))

(declare-fun res!584798 () Bool)

(assert (=> b!860505 (=> (not res!584798) (not e!479491))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860505 (= res!584798 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387867 () array!49424)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11048 0))(
  ( (tuple2!11049 (_1!5535 (_ BitVec 64)) (_2!5535 V!27211)) )
))
(declare-datatypes ((List!16857 0))(
  ( (Nil!16854) (Cons!16853 (h!17984 tuple2!11048) (t!23610 List!16857)) )
))
(declare-datatypes ((ListLongMap!9817 0))(
  ( (ListLongMap!9818 (toList!4924 List!16857)) )
))
(declare-fun lt!387872 () ListLongMap!9817)

(declare-fun minValue!654 () V!27211)

(declare-fun zeroValue!654 () V!27211)

(declare-fun getCurrentListMapNoExtraKeys!2901 (array!49422 array!49424 (_ BitVec 32) (_ BitVec 32) V!27211 V!27211 (_ BitVec 32) Int) ListLongMap!9817)

(assert (=> b!860505 (= lt!387872 (getCurrentListMapNoExtraKeys!2901 _keys!868 lt!387867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27211)

(assert (=> b!860505 (= lt!387867 (array!49425 (store (arr!23743 _values!688) i!612 (ValueCellFull!7872 v!557)) (size!24183 _values!688)))))

(declare-fun lt!387868 () ListLongMap!9817)

(assert (=> b!860505 (= lt!387868 (getCurrentListMapNoExtraKeys!2901 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860506 () Bool)

(declare-fun e!479490 () Bool)

(assert (=> b!860506 (= e!479491 (not e!479490))))

(declare-fun res!584793 () Bool)

(assert (=> b!860506 (=> res!584793 e!479490)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860506 (= res!584793 (not (validKeyInArray!0 (select (arr!23742 _keys!868) from!1053))))))

(declare-fun lt!387865 () ListLongMap!9817)

(declare-fun lt!387874 () ListLongMap!9817)

(assert (=> b!860506 (= lt!387865 lt!387874)))

(declare-fun lt!387869 () ListLongMap!9817)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2276 (ListLongMap!9817 tuple2!11048) ListLongMap!9817)

(assert (=> b!860506 (= lt!387874 (+!2276 lt!387869 (tuple2!11049 k0!854 v!557)))))

(assert (=> b!860506 (= lt!387865 (getCurrentListMapNoExtraKeys!2901 _keys!868 lt!387867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860506 (= lt!387869 (getCurrentListMapNoExtraKeys!2901 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29335 0))(
  ( (Unit!29336) )
))
(declare-fun lt!387873 () Unit!29335)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!488 (array!49422 array!49424 (_ BitVec 32) (_ BitVec 32) V!27211 V!27211 (_ BitVec 32) (_ BitVec 64) V!27211 (_ BitVec 32) Int) Unit!29335)

(assert (=> b!860506 (= lt!387873 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!488 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860507 () Bool)

(declare-fun tp_is_empty!16623 () Bool)

(assert (=> b!860507 (= e!479492 tp_is_empty!16623)))

(declare-fun b!860508 () Bool)

(declare-fun res!584796 () Bool)

(declare-fun e!479489 () Bool)

(assert (=> b!860508 (=> res!584796 e!479489)))

(declare-fun noDuplicate!1316 (List!16856) Bool)

(assert (=> b!860508 (= res!584796 (not (noDuplicate!1316 Nil!16853)))))

(declare-fun b!860509 () Bool)

(declare-fun e!479494 () Bool)

(assert (=> b!860509 (= e!479494 e!479489)))

(declare-fun res!584786 () Bool)

(assert (=> b!860509 (=> res!584786 e!479489)))

(assert (=> b!860509 (= res!584786 (or (bvsge (size!24182 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24182 _keys!868)) (bvsge from!1053 (size!24182 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860509 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387866 () Unit!29335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49422 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29335)

(assert (=> b!860509 (= lt!387866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860509 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16853)))

(declare-fun lt!387870 () Unit!29335)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49422 (_ BitVec 32) (_ BitVec 32)) Unit!29335)

(assert (=> b!860509 (= lt!387870 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860510 () Bool)

(declare-fun e!479493 () Bool)

(assert (=> b!860510 (= e!479493 tp_is_empty!16623)))

(declare-fun res!584789 () Bool)

(assert (=> start!73572 (=> (not res!584789) (not e!479497))))

(assert (=> start!73572 (= res!584789 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24182 _keys!868))))))

(assert (=> start!73572 e!479497))

(assert (=> start!73572 tp_is_empty!16623))

(assert (=> start!73572 true))

(assert (=> start!73572 tp!50964))

(declare-fun array_inv!18796 (array!49422) Bool)

(assert (=> start!73572 (array_inv!18796 _keys!868)))

(declare-fun array_inv!18797 (array!49424) Bool)

(assert (=> start!73572 (and (array_inv!18797 _values!688) e!479496)))

(declare-fun b!860511 () Bool)

(declare-fun res!584791 () Bool)

(assert (=> b!860511 (=> res!584791 e!479489)))

(declare-fun contains!4236 (List!16856 (_ BitVec 64)) Bool)

(assert (=> b!860511 (= res!584791 (contains!4236 Nil!16853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860512 () Bool)

(declare-fun res!584795 () Bool)

(assert (=> b!860512 (=> (not res!584795) (not e!479497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860512 (= res!584795 (validMask!0 mask!1196))))

(declare-fun b!860513 () Bool)

(assert (=> b!860513 (= e!479489 true)))

(declare-fun lt!387871 () Bool)

(assert (=> b!860513 (= lt!387871 (contains!4236 Nil!16853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860514 () Bool)

(declare-fun res!584797 () Bool)

(assert (=> b!860514 (=> (not res!584797) (not e!479497))))

(assert (=> b!860514 (= res!584797 (and (= (size!24183 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24182 _keys!868) (size!24183 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860515 () Bool)

(declare-fun res!584787 () Bool)

(assert (=> b!860515 (=> (not res!584787) (not e!479497))))

(assert (=> b!860515 (= res!584787 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24182 _keys!868))))))

(declare-fun b!860516 () Bool)

(assert (=> b!860516 (= e!479490 e!479494)))

(declare-fun res!584785 () Bool)

(assert (=> b!860516 (=> res!584785 e!479494)))

(assert (=> b!860516 (= res!584785 (not (= (select (arr!23742 _keys!868) from!1053) k0!854)))))

(declare-fun get!12518 (ValueCell!7872 V!27211) V!27211)

(declare-fun dynLambda!1112 (Int (_ BitVec 64)) V!27211)

(assert (=> b!860516 (= lt!387872 (+!2276 lt!387874 (tuple2!11049 (select (arr!23742 _keys!868) from!1053) (get!12518 (select (arr!23743 _values!688) from!1053) (dynLambda!1112 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860517 () Bool)

(declare-fun res!584794 () Bool)

(assert (=> b!860517 (=> (not res!584794) (not e!479497))))

(assert (=> b!860517 (= res!584794 (and (= (select (arr!23742 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26534 () Bool)

(declare-fun tp!50965 () Bool)

(assert (=> mapNonEmpty!26534 (= mapRes!26534 (and tp!50965 e!479493))))

(declare-fun mapKey!26534 () (_ BitVec 32))

(declare-fun mapValue!26534 () ValueCell!7872)

(declare-fun mapRest!26534 () (Array (_ BitVec 32) ValueCell!7872))

(assert (=> mapNonEmpty!26534 (= (arr!23743 _values!688) (store mapRest!26534 mapKey!26534 mapValue!26534))))

(declare-fun b!860518 () Bool)

(declare-fun res!584788 () Bool)

(assert (=> b!860518 (=> (not res!584788) (not e!479497))))

(assert (=> b!860518 (= res!584788 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26534 () Bool)

(assert (=> mapIsEmpty!26534 mapRes!26534))

(assert (= (and start!73572 res!584789) b!860512))

(assert (= (and b!860512 res!584795) b!860514))

(assert (= (and b!860514 res!584797) b!860502))

(assert (= (and b!860502 res!584792) b!860504))

(assert (= (and b!860504 res!584790) b!860515))

(assert (= (and b!860515 res!584787) b!860518))

(assert (= (and b!860518 res!584788) b!860517))

(assert (= (and b!860517 res!584794) b!860505))

(assert (= (and b!860505 res!584798) b!860506))

(assert (= (and b!860506 (not res!584793)) b!860516))

(assert (= (and b!860516 (not res!584785)) b!860509))

(assert (= (and b!860509 (not res!584786)) b!860508))

(assert (= (and b!860508 (not res!584796)) b!860511))

(assert (= (and b!860511 (not res!584791)) b!860513))

(assert (= (and b!860503 condMapEmpty!26534) mapIsEmpty!26534))

(assert (= (and b!860503 (not condMapEmpty!26534)) mapNonEmpty!26534))

(get-info :version)

(assert (= (and mapNonEmpty!26534 ((_ is ValueCellFull!7872) mapValue!26534)) b!860510))

(assert (= (and b!860503 ((_ is ValueCellFull!7872) mapDefault!26534)) b!860507))

(assert (= start!73572 b!860503))

(declare-fun b_lambda!11839 () Bool)

(assert (=> (not b_lambda!11839) (not b!860516)))

(declare-fun t!23608 () Bool)

(declare-fun tb!4609 () Bool)

(assert (=> (and start!73572 (= defaultEntry!696 defaultEntry!696) t!23608) tb!4609))

(declare-fun result!8829 () Bool)

(assert (=> tb!4609 (= result!8829 tp_is_empty!16623)))

(assert (=> b!860516 t!23608))

(declare-fun b_and!23955 () Bool)

(assert (= b_and!23953 (and (=> t!23608 result!8829) b_and!23955)))

(declare-fun m!801313 () Bool)

(assert (=> mapNonEmpty!26534 m!801313))

(declare-fun m!801315 () Bool)

(assert (=> start!73572 m!801315))

(declare-fun m!801317 () Bool)

(assert (=> start!73572 m!801317))

(declare-fun m!801319 () Bool)

(assert (=> b!860502 m!801319))

(declare-fun m!801321 () Bool)

(assert (=> b!860511 m!801321))

(declare-fun m!801323 () Bool)

(assert (=> b!860505 m!801323))

(declare-fun m!801325 () Bool)

(assert (=> b!860505 m!801325))

(declare-fun m!801327 () Bool)

(assert (=> b!860505 m!801327))

(declare-fun m!801329 () Bool)

(assert (=> b!860517 m!801329))

(declare-fun m!801331 () Bool)

(assert (=> b!860506 m!801331))

(declare-fun m!801333 () Bool)

(assert (=> b!860506 m!801333))

(declare-fun m!801335 () Bool)

(assert (=> b!860506 m!801335))

(assert (=> b!860506 m!801333))

(declare-fun m!801337 () Bool)

(assert (=> b!860506 m!801337))

(declare-fun m!801339 () Bool)

(assert (=> b!860506 m!801339))

(declare-fun m!801341 () Bool)

(assert (=> b!860506 m!801341))

(declare-fun m!801343 () Bool)

(assert (=> b!860504 m!801343))

(declare-fun m!801345 () Bool)

(assert (=> b!860516 m!801345))

(declare-fun m!801347 () Bool)

(assert (=> b!860516 m!801347))

(declare-fun m!801349 () Bool)

(assert (=> b!860516 m!801349))

(declare-fun m!801351 () Bool)

(assert (=> b!860516 m!801351))

(assert (=> b!860516 m!801347))

(assert (=> b!860516 m!801333))

(assert (=> b!860516 m!801349))

(declare-fun m!801353 () Bool)

(assert (=> b!860518 m!801353))

(declare-fun m!801355 () Bool)

(assert (=> b!860513 m!801355))

(declare-fun m!801357 () Bool)

(assert (=> b!860508 m!801357))

(declare-fun m!801359 () Bool)

(assert (=> b!860509 m!801359))

(declare-fun m!801361 () Bool)

(assert (=> b!860509 m!801361))

(declare-fun m!801363 () Bool)

(assert (=> b!860509 m!801363))

(declare-fun m!801365 () Bool)

(assert (=> b!860509 m!801365))

(declare-fun m!801367 () Bool)

(assert (=> b!860512 m!801367))

(check-sat (not b!860502) (not b!860505) (not b!860512) (not b!860516) b_and!23955 tp_is_empty!16623 (not b!860509) (not b_next!14487) (not b!860504) (not mapNonEmpty!26534) (not b!860511) (not b!860513) (not b!860506) (not start!73572) (not b_lambda!11839) (not b!860518) (not b!860508))
(check-sat b_and!23955 (not b_next!14487))
