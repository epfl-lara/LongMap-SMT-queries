; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73900 () Bool)

(assert start!73900)

(declare-fun b_free!14647 () Bool)

(declare-fun b_next!14647 () Bool)

(assert (=> start!73900 (= b_free!14647 (not b_next!14647))))

(declare-fun tp!51445 () Bool)

(declare-fun b_and!24283 () Bool)

(assert (=> start!73900 (= tp!51445 b_and!24283)))

(declare-fun b!865328 () Bool)

(declare-fun res!587718 () Bool)

(declare-fun e!482144 () Bool)

(assert (=> b!865328 (=> (not res!587718) (not e!482144))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49777 0))(
  ( (array!49778 (arr!23915 (Array (_ BitVec 32) (_ BitVec 64))) (size!24356 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49777)

(assert (=> b!865328 (= res!587718 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24356 _keys!868))))))

(declare-fun b!865329 () Bool)

(declare-fun e!482145 () Bool)

(declare-fun e!482143 () Bool)

(assert (=> b!865329 (= e!482145 (not e!482143))))

(declare-fun res!587726 () Bool)

(assert (=> b!865329 (=> res!587726 e!482143)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865329 (= res!587726 (not (validKeyInArray!0 (select (arr!23915 _keys!868) from!1053))))))

(declare-datatypes ((V!27425 0))(
  ( (V!27426 (val!8439 Int)) )
))
(declare-datatypes ((tuple2!11096 0))(
  ( (tuple2!11097 (_1!5559 (_ BitVec 64)) (_2!5559 V!27425)) )
))
(declare-datatypes ((List!16927 0))(
  ( (Nil!16924) (Cons!16923 (h!18060 tuple2!11096) (t!23832 List!16927)) )
))
(declare-datatypes ((ListLongMap!9867 0))(
  ( (ListLongMap!9868 (toList!4949 List!16927)) )
))
(declare-fun lt!391540 () ListLongMap!9867)

(declare-fun lt!391545 () ListLongMap!9867)

(assert (=> b!865329 (= lt!391540 lt!391545)))

(declare-fun lt!391550 () ListLongMap!9867)

(declare-fun lt!391544 () tuple2!11096)

(declare-fun +!2352 (ListLongMap!9867 tuple2!11096) ListLongMap!9867)

(assert (=> b!865329 (= lt!391545 (+!2352 lt!391550 lt!391544))))

(declare-datatypes ((ValueCell!7952 0))(
  ( (ValueCellFull!7952 (v!10864 V!27425)) (EmptyCell!7952) )
))
(declare-datatypes ((array!49779 0))(
  ( (array!49780 (arr!23916 (Array (_ BitVec 32) ValueCell!7952)) (size!24357 (_ BitVec 32))) )
))
(declare-fun lt!391538 () array!49779)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27425)

(declare-fun zeroValue!654 () V!27425)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2999 (array!49777 array!49779 (_ BitVec 32) (_ BitVec 32) V!27425 V!27425 (_ BitVec 32) Int) ListLongMap!9867)

(assert (=> b!865329 (= lt!391540 (getCurrentListMapNoExtraKeys!2999 _keys!868 lt!391538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27425)

(assert (=> b!865329 (= lt!391544 (tuple2!11097 k0!854 v!557))))

(declare-fun _values!688 () array!49779)

(assert (=> b!865329 (= lt!391550 (getCurrentListMapNoExtraKeys!2999 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29561 0))(
  ( (Unit!29562) )
))
(declare-fun lt!391548 () Unit!29561)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!536 (array!49777 array!49779 (_ BitVec 32) (_ BitVec 32) V!27425 V!27425 (_ BitVec 32) (_ BitVec 64) V!27425 (_ BitVec 32) Int) Unit!29561)

(assert (=> b!865329 (= lt!391548 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!536 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865330 () Bool)

(declare-fun res!587724 () Bool)

(assert (=> b!865330 (=> (not res!587724) (not e!482144))))

(assert (=> b!865330 (= res!587724 (and (= (select (arr!23915 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865331 () Bool)

(declare-fun e!482146 () Bool)

(declare-fun e!482147 () Bool)

(declare-fun mapRes!26774 () Bool)

(assert (=> b!865331 (= e!482146 (and e!482147 mapRes!26774))))

(declare-fun condMapEmpty!26774 () Bool)

(declare-fun mapDefault!26774 () ValueCell!7952)

(assert (=> b!865331 (= condMapEmpty!26774 (= (arr!23916 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7952)) mapDefault!26774)))))

(declare-fun b!865332 () Bool)

(declare-fun res!587719 () Bool)

(assert (=> b!865332 (=> (not res!587719) (not e!482144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49777 (_ BitVec 32)) Bool)

(assert (=> b!865332 (= res!587719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865333 () Bool)

(declare-fun res!587723 () Bool)

(assert (=> b!865333 (=> (not res!587723) (not e!482144))))

(declare-datatypes ((List!16928 0))(
  ( (Nil!16925) (Cons!16924 (h!18061 (_ BitVec 64)) (t!23833 List!16928)) )
))
(declare-fun arrayNoDuplicates!0 (array!49777 (_ BitVec 32) List!16928) Bool)

(assert (=> b!865333 (= res!587723 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16925))))

(declare-fun b!865334 () Bool)

(declare-fun e!482141 () Unit!29561)

(declare-fun Unit!29563 () Unit!29561)

(assert (=> b!865334 (= e!482141 Unit!29563)))

(declare-fun mapIsEmpty!26774 () Bool)

(assert (=> mapIsEmpty!26774 mapRes!26774))

(declare-fun res!587727 () Bool)

(assert (=> start!73900 (=> (not res!587727) (not e!482144))))

(assert (=> start!73900 (= res!587727 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24356 _keys!868))))))

(assert (=> start!73900 e!482144))

(declare-fun tp_is_empty!16783 () Bool)

(assert (=> start!73900 tp_is_empty!16783))

(assert (=> start!73900 true))

(assert (=> start!73900 tp!51445))

(declare-fun array_inv!18966 (array!49777) Bool)

(assert (=> start!73900 (array_inv!18966 _keys!868)))

(declare-fun array_inv!18967 (array!49779) Bool)

(assert (=> start!73900 (and (array_inv!18967 _values!688) e!482146)))

(declare-fun b!865335 () Bool)

(declare-fun e!482142 () Bool)

(assert (=> b!865335 (= e!482143 e!482142)))

(declare-fun res!587722 () Bool)

(assert (=> b!865335 (=> res!587722 e!482142)))

(assert (=> b!865335 (= res!587722 (= k0!854 (select (arr!23915 _keys!868) from!1053)))))

(assert (=> b!865335 (not (= (select (arr!23915 _keys!868) from!1053) k0!854))))

(declare-fun lt!391552 () Unit!29561)

(assert (=> b!865335 (= lt!391552 e!482141)))

(declare-fun c!92473 () Bool)

(assert (=> b!865335 (= c!92473 (= (select (arr!23915 _keys!868) from!1053) k0!854))))

(declare-fun lt!391553 () ListLongMap!9867)

(declare-fun lt!391551 () ListLongMap!9867)

(assert (=> b!865335 (= lt!391553 lt!391551)))

(declare-fun lt!391542 () tuple2!11096)

(assert (=> b!865335 (= lt!391551 (+!2352 lt!391545 lt!391542))))

(declare-fun lt!391547 () V!27425)

(assert (=> b!865335 (= lt!391542 (tuple2!11097 (select (arr!23915 _keys!868) from!1053) lt!391547))))

(declare-fun get!12642 (ValueCell!7952 V!27425) V!27425)

(declare-fun dynLambda!1176 (Int (_ BitVec 64)) V!27425)

(assert (=> b!865335 (= lt!391547 (get!12642 (select (arr!23916 _values!688) from!1053) (dynLambda!1176 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865336 () Bool)

(declare-fun e!482149 () Bool)

(assert (=> b!865336 (= e!482149 tp_is_empty!16783)))

(declare-fun b!865337 () Bool)

(declare-fun res!587728 () Bool)

(assert (=> b!865337 (=> (not res!587728) (not e!482144))))

(assert (=> b!865337 (= res!587728 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26774 () Bool)

(declare-fun tp!51446 () Bool)

(assert (=> mapNonEmpty!26774 (= mapRes!26774 (and tp!51446 e!482149))))

(declare-fun mapRest!26774 () (Array (_ BitVec 32) ValueCell!7952))

(declare-fun mapKey!26774 () (_ BitVec 32))

(declare-fun mapValue!26774 () ValueCell!7952)

(assert (=> mapNonEmpty!26774 (= (arr!23916 _values!688) (store mapRest!26774 mapKey!26774 mapValue!26774))))

(declare-fun b!865338 () Bool)

(assert (=> b!865338 (= e!482142 true)))

(assert (=> b!865338 (= lt!391551 (+!2352 (+!2352 lt!391550 lt!391542) lt!391544))))

(declare-fun lt!391543 () Unit!29561)

(declare-fun addCommutativeForDiffKeys!503 (ListLongMap!9867 (_ BitVec 64) V!27425 (_ BitVec 64) V!27425) Unit!29561)

(assert (=> b!865338 (= lt!391543 (addCommutativeForDiffKeys!503 lt!391550 k0!854 v!557 (select (arr!23915 _keys!868) from!1053) lt!391547))))

(declare-fun b!865339 () Bool)

(assert (=> b!865339 (= e!482144 e!482145)))

(declare-fun res!587720 () Bool)

(assert (=> b!865339 (=> (not res!587720) (not e!482145))))

(assert (=> b!865339 (= res!587720 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865339 (= lt!391553 (getCurrentListMapNoExtraKeys!2999 _keys!868 lt!391538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865339 (= lt!391538 (array!49780 (store (arr!23916 _values!688) i!612 (ValueCellFull!7952 v!557)) (size!24357 _values!688)))))

(declare-fun lt!391549 () ListLongMap!9867)

(assert (=> b!865339 (= lt!391549 (getCurrentListMapNoExtraKeys!2999 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865340 () Bool)

(declare-fun res!587721 () Bool)

(assert (=> b!865340 (=> (not res!587721) (not e!482144))))

(assert (=> b!865340 (= res!587721 (and (= (size!24357 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24356 _keys!868) (size!24357 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865341 () Bool)

(declare-fun Unit!29564 () Unit!29561)

(assert (=> b!865341 (= e!482141 Unit!29564)))

(declare-fun lt!391539 () Unit!29561)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49777 (_ BitVec 32) (_ BitVec 32)) Unit!29561)

(assert (=> b!865341 (= lt!391539 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865341 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16925)))

(declare-fun lt!391541 () Unit!29561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49777 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29561)

(assert (=> b!865341 (= lt!391541 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865341 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391546 () Unit!29561)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49777 (_ BitVec 64) (_ BitVec 32) List!16928) Unit!29561)

(assert (=> b!865341 (= lt!391546 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16925))))

(assert (=> b!865341 false))

(declare-fun b!865342 () Bool)

(assert (=> b!865342 (= e!482147 tp_is_empty!16783)))

(declare-fun b!865343 () Bool)

(declare-fun res!587725 () Bool)

(assert (=> b!865343 (=> (not res!587725) (not e!482144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865343 (= res!587725 (validMask!0 mask!1196))))

(assert (= (and start!73900 res!587727) b!865343))

(assert (= (and b!865343 res!587725) b!865340))

(assert (= (and b!865340 res!587721) b!865332))

(assert (= (and b!865332 res!587719) b!865333))

(assert (= (and b!865333 res!587723) b!865328))

(assert (= (and b!865328 res!587718) b!865337))

(assert (= (and b!865337 res!587728) b!865330))

(assert (= (and b!865330 res!587724) b!865339))

(assert (= (and b!865339 res!587720) b!865329))

(assert (= (and b!865329 (not res!587726)) b!865335))

(assert (= (and b!865335 c!92473) b!865341))

(assert (= (and b!865335 (not c!92473)) b!865334))

(assert (= (and b!865335 (not res!587722)) b!865338))

(assert (= (and b!865331 condMapEmpty!26774) mapIsEmpty!26774))

(assert (= (and b!865331 (not condMapEmpty!26774)) mapNonEmpty!26774))

(get-info :version)

(assert (= (and mapNonEmpty!26774 ((_ is ValueCellFull!7952) mapValue!26774)) b!865336))

(assert (= (and b!865331 ((_ is ValueCellFull!7952) mapDefault!26774)) b!865342))

(assert (= start!73900 b!865331))

(declare-fun b_lambda!12013 () Bool)

(assert (=> (not b_lambda!12013) (not b!865335)))

(declare-fun t!23831 () Bool)

(declare-fun tb!4761 () Bool)

(assert (=> (and start!73900 (= defaultEntry!696 defaultEntry!696) t!23831) tb!4761))

(declare-fun result!9141 () Bool)

(assert (=> tb!4761 (= result!9141 tp_is_empty!16783)))

(assert (=> b!865335 t!23831))

(declare-fun b_and!24285 () Bool)

(assert (= b_and!24283 (and (=> t!23831 result!9141) b_and!24285)))

(declare-fun m!807053 () Bool)

(assert (=> b!865335 m!807053))

(declare-fun m!807055 () Bool)

(assert (=> b!865335 m!807055))

(declare-fun m!807057 () Bool)

(assert (=> b!865335 m!807057))

(declare-fun m!807059 () Bool)

(assert (=> b!865335 m!807059))

(assert (=> b!865335 m!807055))

(declare-fun m!807061 () Bool)

(assert (=> b!865335 m!807061))

(assert (=> b!865335 m!807057))

(declare-fun m!807063 () Bool)

(assert (=> b!865333 m!807063))

(declare-fun m!807065 () Bool)

(assert (=> start!73900 m!807065))

(declare-fun m!807067 () Bool)

(assert (=> start!73900 m!807067))

(assert (=> b!865329 m!807061))

(declare-fun m!807069 () Bool)

(assert (=> b!865329 m!807069))

(declare-fun m!807071 () Bool)

(assert (=> b!865329 m!807071))

(declare-fun m!807073 () Bool)

(assert (=> b!865329 m!807073))

(declare-fun m!807075 () Bool)

(assert (=> b!865329 m!807075))

(assert (=> b!865329 m!807061))

(declare-fun m!807077 () Bool)

(assert (=> b!865329 m!807077))

(declare-fun m!807079 () Bool)

(assert (=> b!865332 m!807079))

(declare-fun m!807081 () Bool)

(assert (=> mapNonEmpty!26774 m!807081))

(declare-fun m!807083 () Bool)

(assert (=> b!865343 m!807083))

(declare-fun m!807085 () Bool)

(assert (=> b!865338 m!807085))

(assert (=> b!865338 m!807085))

(declare-fun m!807087 () Bool)

(assert (=> b!865338 m!807087))

(assert (=> b!865338 m!807061))

(assert (=> b!865338 m!807061))

(declare-fun m!807089 () Bool)

(assert (=> b!865338 m!807089))

(declare-fun m!807091 () Bool)

(assert (=> b!865339 m!807091))

(declare-fun m!807093 () Bool)

(assert (=> b!865339 m!807093))

(declare-fun m!807095 () Bool)

(assert (=> b!865339 m!807095))

(declare-fun m!807097 () Bool)

(assert (=> b!865330 m!807097))

(declare-fun m!807099 () Bool)

(assert (=> b!865341 m!807099))

(declare-fun m!807101 () Bool)

(assert (=> b!865341 m!807101))

(declare-fun m!807103 () Bool)

(assert (=> b!865341 m!807103))

(declare-fun m!807105 () Bool)

(assert (=> b!865341 m!807105))

(declare-fun m!807107 () Bool)

(assert (=> b!865341 m!807107))

(declare-fun m!807109 () Bool)

(assert (=> b!865337 m!807109))

(check-sat (not start!73900) b_and!24285 (not b_next!14647) (not b!865339) (not b!865341) (not b_lambda!12013) (not b!865332) (not mapNonEmpty!26774) tp_is_empty!16783 (not b!865329) (not b!865335) (not b!865343) (not b!865338) (not b!865337) (not b!865333))
(check-sat b_and!24285 (not b_next!14647))
