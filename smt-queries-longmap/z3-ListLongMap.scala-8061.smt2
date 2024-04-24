; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99442 () Bool)

(assert start!99442)

(declare-fun b_free!24811 () Bool)

(declare-fun b_next!24811 () Bool)

(assert (=> start!99442 (= b_free!24811 (not b_next!24811))))

(declare-fun tp!87144 () Bool)

(declare-fun b_and!40473 () Bool)

(assert (=> start!99442 (= tp!87144 b_and!40473)))

(declare-fun b!1169401 () Bool)

(declare-fun e!664726 () Bool)

(assert (=> b!1169401 (= e!664726 true)))

(declare-datatypes ((V!44249 0))(
  ( (V!44250 (val!14727 Int)) )
))
(declare-fun zeroValue!944 () V!44249)

(declare-datatypes ((array!75553 0))(
  ( (array!75554 (arr!36421 (Array (_ BitVec 32) (_ BitVec 64))) (size!36958 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75553)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13961 0))(
  ( (ValueCellFull!13961 (v!17360 V!44249)) (EmptyCell!13961) )
))
(declare-datatypes ((array!75555 0))(
  ( (array!75556 (arr!36422 (Array (_ BitVec 32) ValueCell!13961)) (size!36959 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75555)

(declare-fun lt!526377 () array!75553)

(declare-fun minValue!944 () V!44249)

(declare-fun lt!526379 () array!75555)

(declare-datatypes ((tuple2!18824 0))(
  ( (tuple2!18825 (_1!9423 (_ BitVec 64)) (_2!9423 V!44249)) )
))
(declare-datatypes ((List!25564 0))(
  ( (Nil!25561) (Cons!25560 (h!26778 tuple2!18824) (t!37359 List!25564)) )
))
(declare-datatypes ((ListLongMap!16801 0))(
  ( (ListLongMap!16802 (toList!8416 List!25564)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4907 (array!75553 array!75555 (_ BitVec 32) (_ BitVec 32) V!44249 V!44249 (_ BitVec 32) Int) ListLongMap!16801)

(declare-fun -!1477 (ListLongMap!16801 (_ BitVec 64)) ListLongMap!16801)

(assert (=> b!1169401 (= (getCurrentListMapNoExtraKeys!4907 lt!526377 lt!526379 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1477 (getCurrentListMapNoExtraKeys!4907 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38525 0))(
  ( (Unit!38526) )
))
(declare-fun lt!526381 () Unit!38525)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!702 (array!75553 array!75555 (_ BitVec 32) (_ BitVec 32) V!44249 V!44249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38525)

(assert (=> b!1169401 (= lt!526381 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!702 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169402 () Bool)

(declare-fun e!664723 () Bool)

(declare-fun e!664725 () Bool)

(assert (=> b!1169402 (= e!664723 (not e!664725))))

(declare-fun res!775484 () Bool)

(assert (=> b!1169402 (=> res!775484 e!664725)))

(assert (=> b!1169402 (= res!775484 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169402 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526380 () Unit!38525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75553 (_ BitVec 64) (_ BitVec 32)) Unit!38525)

(assert (=> b!1169402 (= lt!526380 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169403 () Bool)

(declare-fun res!775488 () Bool)

(declare-fun e!664722 () Bool)

(assert (=> b!1169403 (=> (not res!775488) (not e!664722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169403 (= res!775488 (validKeyInArray!0 k0!934))))

(declare-fun b!1169404 () Bool)

(declare-fun e!664724 () Bool)

(declare-fun e!664728 () Bool)

(declare-fun mapRes!45836 () Bool)

(assert (=> b!1169404 (= e!664724 (and e!664728 mapRes!45836))))

(declare-fun condMapEmpty!45836 () Bool)

(declare-fun mapDefault!45836 () ValueCell!13961)

(assert (=> b!1169404 (= condMapEmpty!45836 (= (arr!36422 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13961)) mapDefault!45836)))))

(declare-fun b!1169405 () Bool)

(declare-fun res!775483 () Bool)

(assert (=> b!1169405 (=> (not res!775483) (not e!664722))))

(assert (=> b!1169405 (= res!775483 (= (select (arr!36421 _keys!1208) i!673) k0!934))))

(declare-fun b!1169406 () Bool)

(declare-fun tp_is_empty!29341 () Bool)

(assert (=> b!1169406 (= e!664728 tp_is_empty!29341)))

(declare-fun b!1169407 () Bool)

(declare-fun e!664727 () Bool)

(assert (=> b!1169407 (= e!664727 tp_is_empty!29341)))

(declare-fun b!1169408 () Bool)

(assert (=> b!1169408 (= e!664725 e!664726)))

(declare-fun res!775485 () Bool)

(assert (=> b!1169408 (=> res!775485 e!664726)))

(assert (=> b!1169408 (= res!775485 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526376 () ListLongMap!16801)

(assert (=> b!1169408 (= lt!526376 (getCurrentListMapNoExtraKeys!4907 lt!526377 lt!526379 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2894 (Int (_ BitVec 64)) V!44249)

(assert (=> b!1169408 (= lt!526379 (array!75556 (store (arr!36422 _values!996) i!673 (ValueCellFull!13961 (dynLambda!2894 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36959 _values!996)))))

(declare-fun lt!526378 () ListLongMap!16801)

(assert (=> b!1169408 (= lt!526378 (getCurrentListMapNoExtraKeys!4907 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169409 () Bool)

(declare-fun res!775482 () Bool)

(assert (=> b!1169409 (=> (not res!775482) (not e!664722))))

(assert (=> b!1169409 (= res!775482 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36958 _keys!1208))))))

(declare-fun res!775480 () Bool)

(assert (=> start!99442 (=> (not res!775480) (not e!664722))))

(assert (=> start!99442 (= res!775480 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36958 _keys!1208))))))

(assert (=> start!99442 e!664722))

(assert (=> start!99442 tp_is_empty!29341))

(declare-fun array_inv!27916 (array!75553) Bool)

(assert (=> start!99442 (array_inv!27916 _keys!1208)))

(assert (=> start!99442 true))

(assert (=> start!99442 tp!87144))

(declare-fun array_inv!27917 (array!75555) Bool)

(assert (=> start!99442 (and (array_inv!27917 _values!996) e!664724)))

(declare-fun mapNonEmpty!45836 () Bool)

(declare-fun tp!87143 () Bool)

(assert (=> mapNonEmpty!45836 (= mapRes!45836 (and tp!87143 e!664727))))

(declare-fun mapValue!45836 () ValueCell!13961)

(declare-fun mapKey!45836 () (_ BitVec 32))

(declare-fun mapRest!45836 () (Array (_ BitVec 32) ValueCell!13961))

(assert (=> mapNonEmpty!45836 (= (arr!36422 _values!996) (store mapRest!45836 mapKey!45836 mapValue!45836))))

(declare-fun b!1169410 () Bool)

(declare-fun res!775487 () Bool)

(assert (=> b!1169410 (=> (not res!775487) (not e!664722))))

(assert (=> b!1169410 (= res!775487 (and (= (size!36959 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36958 _keys!1208) (size!36959 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45836 () Bool)

(assert (=> mapIsEmpty!45836 mapRes!45836))

(declare-fun b!1169411 () Bool)

(declare-fun res!775490 () Bool)

(assert (=> b!1169411 (=> (not res!775490) (not e!664722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169411 (= res!775490 (validMask!0 mask!1564))))

(declare-fun b!1169412 () Bool)

(assert (=> b!1169412 (= e!664722 e!664723)))

(declare-fun res!775489 () Bool)

(assert (=> b!1169412 (=> (not res!775489) (not e!664723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75553 (_ BitVec 32)) Bool)

(assert (=> b!1169412 (= res!775489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526377 mask!1564))))

(assert (=> b!1169412 (= lt!526377 (array!75554 (store (arr!36421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36958 _keys!1208)))))

(declare-fun b!1169413 () Bool)

(declare-fun res!775481 () Bool)

(assert (=> b!1169413 (=> (not res!775481) (not e!664722))))

(declare-datatypes ((List!25565 0))(
  ( (Nil!25562) (Cons!25561 (h!26779 (_ BitVec 64)) (t!37360 List!25565)) )
))
(declare-fun arrayNoDuplicates!0 (array!75553 (_ BitVec 32) List!25565) Bool)

(assert (=> b!1169413 (= res!775481 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25562))))

(declare-fun b!1169414 () Bool)

(declare-fun res!775491 () Bool)

(assert (=> b!1169414 (=> (not res!775491) (not e!664722))))

(assert (=> b!1169414 (= res!775491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169415 () Bool)

(declare-fun res!775486 () Bool)

(assert (=> b!1169415 (=> (not res!775486) (not e!664723))))

(assert (=> b!1169415 (= res!775486 (arrayNoDuplicates!0 lt!526377 #b00000000000000000000000000000000 Nil!25562))))

(assert (= (and start!99442 res!775480) b!1169411))

(assert (= (and b!1169411 res!775490) b!1169410))

(assert (= (and b!1169410 res!775487) b!1169414))

(assert (= (and b!1169414 res!775491) b!1169413))

(assert (= (and b!1169413 res!775481) b!1169409))

(assert (= (and b!1169409 res!775482) b!1169403))

(assert (= (and b!1169403 res!775488) b!1169405))

(assert (= (and b!1169405 res!775483) b!1169412))

(assert (= (and b!1169412 res!775489) b!1169415))

(assert (= (and b!1169415 res!775486) b!1169402))

(assert (= (and b!1169402 (not res!775484)) b!1169408))

(assert (= (and b!1169408 (not res!775485)) b!1169401))

(assert (= (and b!1169404 condMapEmpty!45836) mapIsEmpty!45836))

(assert (= (and b!1169404 (not condMapEmpty!45836)) mapNonEmpty!45836))

(get-info :version)

(assert (= (and mapNonEmpty!45836 ((_ is ValueCellFull!13961) mapValue!45836)) b!1169407))

(assert (= (and b!1169404 ((_ is ValueCellFull!13961) mapDefault!45836)) b!1169406))

(assert (= start!99442 b!1169404))

(declare-fun b_lambda!19911 () Bool)

(assert (=> (not b_lambda!19911) (not b!1169408)))

(declare-fun t!37358 () Bool)

(declare-fun tb!9615 () Bool)

(assert (=> (and start!99442 (= defaultEntry!1004 defaultEntry!1004) t!37358) tb!9615))

(declare-fun result!19803 () Bool)

(assert (=> tb!9615 (= result!19803 tp_is_empty!29341)))

(assert (=> b!1169408 t!37358))

(declare-fun b_and!40475 () Bool)

(assert (= b_and!40473 (and (=> t!37358 result!19803) b_and!40475)))

(declare-fun m!1077545 () Bool)

(assert (=> start!99442 m!1077545))

(declare-fun m!1077547 () Bool)

(assert (=> start!99442 m!1077547))

(declare-fun m!1077549 () Bool)

(assert (=> b!1169402 m!1077549))

(declare-fun m!1077551 () Bool)

(assert (=> b!1169402 m!1077551))

(declare-fun m!1077553 () Bool)

(assert (=> b!1169403 m!1077553))

(declare-fun m!1077555 () Bool)

(assert (=> b!1169411 m!1077555))

(declare-fun m!1077557 () Bool)

(assert (=> b!1169405 m!1077557))

(declare-fun m!1077559 () Bool)

(assert (=> b!1169408 m!1077559))

(declare-fun m!1077561 () Bool)

(assert (=> b!1169408 m!1077561))

(declare-fun m!1077563 () Bool)

(assert (=> b!1169408 m!1077563))

(declare-fun m!1077565 () Bool)

(assert (=> b!1169408 m!1077565))

(declare-fun m!1077567 () Bool)

(assert (=> b!1169415 m!1077567))

(declare-fun m!1077569 () Bool)

(assert (=> b!1169412 m!1077569))

(declare-fun m!1077571 () Bool)

(assert (=> b!1169412 m!1077571))

(declare-fun m!1077573 () Bool)

(assert (=> mapNonEmpty!45836 m!1077573))

(declare-fun m!1077575 () Bool)

(assert (=> b!1169413 m!1077575))

(declare-fun m!1077577 () Bool)

(assert (=> b!1169401 m!1077577))

(declare-fun m!1077579 () Bool)

(assert (=> b!1169401 m!1077579))

(assert (=> b!1169401 m!1077579))

(declare-fun m!1077581 () Bool)

(assert (=> b!1169401 m!1077581))

(declare-fun m!1077583 () Bool)

(assert (=> b!1169401 m!1077583))

(declare-fun m!1077585 () Bool)

(assert (=> b!1169414 m!1077585))

(check-sat tp_is_empty!29341 (not b!1169408) b_and!40475 (not b_next!24811) (not b!1169413) (not b!1169412) (not b!1169401) (not b!1169403) (not mapNonEmpty!45836) (not b!1169402) (not start!99442) (not b!1169414) (not b!1169415) (not b!1169411) (not b_lambda!19911))
(check-sat b_and!40475 (not b_next!24811))
