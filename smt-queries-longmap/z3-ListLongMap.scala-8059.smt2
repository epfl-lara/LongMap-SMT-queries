; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99430 () Bool)

(assert start!99430)

(declare-fun b_free!24799 () Bool)

(declare-fun b_next!24799 () Bool)

(assert (=> start!99430 (= b_free!24799 (not b_next!24799))))

(declare-fun tp!87108 () Bool)

(declare-fun b_and!40449 () Bool)

(assert (=> start!99430 (= tp!87108 b_and!40449)))

(declare-fun b!1169119 () Bool)

(declare-fun res!775272 () Bool)

(declare-fun e!664585 () Bool)

(assert (=> b!1169119 (=> (not res!775272) (not e!664585))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75531 0))(
  ( (array!75532 (arr!36410 (Array (_ BitVec 32) (_ BitVec 64))) (size!36947 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75531)

(assert (=> b!1169119 (= res!775272 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36947 _keys!1208))))))

(declare-fun mapIsEmpty!45818 () Bool)

(declare-fun mapRes!45818 () Bool)

(assert (=> mapIsEmpty!45818 mapRes!45818))

(declare-fun b!1169120 () Bool)

(declare-fun e!664584 () Bool)

(declare-fun tp_is_empty!29329 () Bool)

(assert (=> b!1169120 (= e!664584 tp_is_empty!29329)))

(declare-fun b!1169121 () Bool)

(declare-fun res!775267 () Bool)

(assert (=> b!1169121 (=> (not res!775267) (not e!664585))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169121 (= res!775267 (validMask!0 mask!1564))))

(declare-fun b!1169122 () Bool)

(declare-fun res!775274 () Bool)

(declare-fun e!664582 () Bool)

(assert (=> b!1169122 (=> (not res!775274) (not e!664582))))

(declare-fun lt!526272 () array!75531)

(declare-datatypes ((List!25557 0))(
  ( (Nil!25554) (Cons!25553 (h!26771 (_ BitVec 64)) (t!37340 List!25557)) )
))
(declare-fun arrayNoDuplicates!0 (array!75531 (_ BitVec 32) List!25557) Bool)

(assert (=> b!1169122 (= res!775274 (arrayNoDuplicates!0 lt!526272 #b00000000000000000000000000000000 Nil!25554))))

(declare-fun mapNonEmpty!45818 () Bool)

(declare-fun tp!87107 () Bool)

(assert (=> mapNonEmpty!45818 (= mapRes!45818 (and tp!87107 e!664584))))

(declare-fun mapKey!45818 () (_ BitVec 32))

(declare-datatypes ((V!44233 0))(
  ( (V!44234 (val!14721 Int)) )
))
(declare-datatypes ((ValueCell!13955 0))(
  ( (ValueCellFull!13955 (v!17354 V!44233)) (EmptyCell!13955) )
))
(declare-fun mapRest!45818 () (Array (_ BitVec 32) ValueCell!13955))

(declare-fun mapValue!45818 () ValueCell!13955)

(declare-datatypes ((array!75533 0))(
  ( (array!75534 (arr!36411 (Array (_ BitVec 32) ValueCell!13955)) (size!36948 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75533)

(assert (=> mapNonEmpty!45818 (= (arr!36411 _values!996) (store mapRest!45818 mapKey!45818 mapValue!45818))))

(declare-fun b!1169123 () Bool)

(declare-fun res!775268 () Bool)

(assert (=> b!1169123 (=> (not res!775268) (not e!664585))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169123 (= res!775268 (= (select (arr!36410 _keys!1208) i!673) k0!934))))

(declare-fun b!1169124 () Bool)

(declare-fun res!775270 () Bool)

(assert (=> b!1169124 (=> (not res!775270) (not e!664585))))

(assert (=> b!1169124 (= res!775270 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25554))))

(declare-fun res!775264 () Bool)

(assert (=> start!99430 (=> (not res!775264) (not e!664585))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99430 (= res!775264 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36947 _keys!1208))))))

(assert (=> start!99430 e!664585))

(assert (=> start!99430 tp_is_empty!29329))

(declare-fun array_inv!27912 (array!75531) Bool)

(assert (=> start!99430 (array_inv!27912 _keys!1208)))

(assert (=> start!99430 true))

(assert (=> start!99430 tp!87108))

(declare-fun e!664583 () Bool)

(declare-fun array_inv!27913 (array!75533) Bool)

(assert (=> start!99430 (and (array_inv!27913 _values!996) e!664583)))

(declare-fun b!1169125 () Bool)

(declare-fun e!664580 () Bool)

(declare-fun e!664578 () Bool)

(assert (=> b!1169125 (= e!664580 e!664578)))

(declare-fun res!775273 () Bool)

(assert (=> b!1169125 (=> res!775273 e!664578)))

(assert (=> b!1169125 (= res!775273 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44233)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44233)

(declare-fun lt!526271 () array!75533)

(declare-datatypes ((tuple2!18818 0))(
  ( (tuple2!18819 (_1!9420 (_ BitVec 64)) (_2!9420 V!44233)) )
))
(declare-datatypes ((List!25558 0))(
  ( (Nil!25555) (Cons!25554 (h!26772 tuple2!18818) (t!37341 List!25558)) )
))
(declare-datatypes ((ListLongMap!16795 0))(
  ( (ListLongMap!16796 (toList!8413 List!25558)) )
))
(declare-fun lt!526268 () ListLongMap!16795)

(declare-fun getCurrentListMapNoExtraKeys!4904 (array!75531 array!75533 (_ BitVec 32) (_ BitVec 32) V!44233 V!44233 (_ BitVec 32) Int) ListLongMap!16795)

(assert (=> b!1169125 (= lt!526268 (getCurrentListMapNoExtraKeys!4904 lt!526272 lt!526271 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2891 (Int (_ BitVec 64)) V!44233)

(assert (=> b!1169125 (= lt!526271 (array!75534 (store (arr!36411 _values!996) i!673 (ValueCellFull!13955 (dynLambda!2891 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36948 _values!996)))))

(declare-fun lt!526269 () ListLongMap!16795)

(assert (=> b!1169125 (= lt!526269 (getCurrentListMapNoExtraKeys!4904 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169126 () Bool)

(declare-fun res!775269 () Bool)

(assert (=> b!1169126 (=> (not res!775269) (not e!664585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75531 (_ BitVec 32)) Bool)

(assert (=> b!1169126 (= res!775269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169127 () Bool)

(assert (=> b!1169127 (= e!664582 (not e!664580))))

(declare-fun res!775265 () Bool)

(assert (=> b!1169127 (=> res!775265 e!664580)))

(assert (=> b!1169127 (= res!775265 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169127 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38519 0))(
  ( (Unit!38520) )
))
(declare-fun lt!526273 () Unit!38519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75531 (_ BitVec 64) (_ BitVec 32)) Unit!38519)

(assert (=> b!1169127 (= lt!526273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169128 () Bool)

(declare-fun e!664579 () Bool)

(assert (=> b!1169128 (= e!664579 tp_is_empty!29329)))

(declare-fun b!1169129 () Bool)

(assert (=> b!1169129 (= e!664583 (and e!664579 mapRes!45818))))

(declare-fun condMapEmpty!45818 () Bool)

(declare-fun mapDefault!45818 () ValueCell!13955)

(assert (=> b!1169129 (= condMapEmpty!45818 (= (arr!36411 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13955)) mapDefault!45818)))))

(declare-fun b!1169130 () Bool)

(declare-fun res!775266 () Bool)

(assert (=> b!1169130 (=> (not res!775266) (not e!664585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169130 (= res!775266 (validKeyInArray!0 k0!934))))

(declare-fun b!1169131 () Bool)

(assert (=> b!1169131 (= e!664578 true)))

(declare-fun -!1474 (ListLongMap!16795 (_ BitVec 64)) ListLongMap!16795)

(assert (=> b!1169131 (= (getCurrentListMapNoExtraKeys!4904 lt!526272 lt!526271 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1474 (getCurrentListMapNoExtraKeys!4904 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!526270 () Unit!38519)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!699 (array!75531 array!75533 (_ BitVec 32) (_ BitVec 32) V!44233 V!44233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38519)

(assert (=> b!1169131 (= lt!526270 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!699 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169132 () Bool)

(declare-fun res!775275 () Bool)

(assert (=> b!1169132 (=> (not res!775275) (not e!664585))))

(assert (=> b!1169132 (= res!775275 (and (= (size!36948 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36947 _keys!1208) (size!36948 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169133 () Bool)

(assert (=> b!1169133 (= e!664585 e!664582)))

(declare-fun res!775271 () Bool)

(assert (=> b!1169133 (=> (not res!775271) (not e!664582))))

(assert (=> b!1169133 (= res!775271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526272 mask!1564))))

(assert (=> b!1169133 (= lt!526272 (array!75532 (store (arr!36410 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36947 _keys!1208)))))

(assert (= (and start!99430 res!775264) b!1169121))

(assert (= (and b!1169121 res!775267) b!1169132))

(assert (= (and b!1169132 res!775275) b!1169126))

(assert (= (and b!1169126 res!775269) b!1169124))

(assert (= (and b!1169124 res!775270) b!1169119))

(assert (= (and b!1169119 res!775272) b!1169130))

(assert (= (and b!1169130 res!775266) b!1169123))

(assert (= (and b!1169123 res!775268) b!1169133))

(assert (= (and b!1169133 res!775271) b!1169122))

(assert (= (and b!1169122 res!775274) b!1169127))

(assert (= (and b!1169127 (not res!775265)) b!1169125))

(assert (= (and b!1169125 (not res!775273)) b!1169131))

(assert (= (and b!1169129 condMapEmpty!45818) mapIsEmpty!45818))

(assert (= (and b!1169129 (not condMapEmpty!45818)) mapNonEmpty!45818))

(get-info :version)

(assert (= (and mapNonEmpty!45818 ((_ is ValueCellFull!13955) mapValue!45818)) b!1169120))

(assert (= (and b!1169129 ((_ is ValueCellFull!13955) mapDefault!45818)) b!1169128))

(assert (= start!99430 b!1169129))

(declare-fun b_lambda!19899 () Bool)

(assert (=> (not b_lambda!19899) (not b!1169125)))

(declare-fun t!37339 () Bool)

(declare-fun tb!9603 () Bool)

(assert (=> (and start!99430 (= defaultEntry!1004 defaultEntry!1004) t!37339) tb!9603))

(declare-fun result!19779 () Bool)

(assert (=> tb!9603 (= result!19779 tp_is_empty!29329)))

(assert (=> b!1169125 t!37339))

(declare-fun b_and!40451 () Bool)

(assert (= b_and!40449 (and (=> t!37339 result!19779) b_and!40451)))

(declare-fun m!1077293 () Bool)

(assert (=> mapNonEmpty!45818 m!1077293))

(declare-fun m!1077295 () Bool)

(assert (=> b!1169126 m!1077295))

(declare-fun m!1077297 () Bool)

(assert (=> b!1169125 m!1077297))

(declare-fun m!1077299 () Bool)

(assert (=> b!1169125 m!1077299))

(declare-fun m!1077301 () Bool)

(assert (=> b!1169125 m!1077301))

(declare-fun m!1077303 () Bool)

(assert (=> b!1169125 m!1077303))

(declare-fun m!1077305 () Bool)

(assert (=> b!1169133 m!1077305))

(declare-fun m!1077307 () Bool)

(assert (=> b!1169133 m!1077307))

(declare-fun m!1077309 () Bool)

(assert (=> b!1169124 m!1077309))

(declare-fun m!1077311 () Bool)

(assert (=> b!1169127 m!1077311))

(declare-fun m!1077313 () Bool)

(assert (=> b!1169127 m!1077313))

(declare-fun m!1077315 () Bool)

(assert (=> b!1169130 m!1077315))

(declare-fun m!1077317 () Bool)

(assert (=> start!99430 m!1077317))

(declare-fun m!1077319 () Bool)

(assert (=> start!99430 m!1077319))

(declare-fun m!1077321 () Bool)

(assert (=> b!1169122 m!1077321))

(declare-fun m!1077323 () Bool)

(assert (=> b!1169131 m!1077323))

(declare-fun m!1077325 () Bool)

(assert (=> b!1169131 m!1077325))

(assert (=> b!1169131 m!1077325))

(declare-fun m!1077327 () Bool)

(assert (=> b!1169131 m!1077327))

(declare-fun m!1077329 () Bool)

(assert (=> b!1169131 m!1077329))

(declare-fun m!1077331 () Bool)

(assert (=> b!1169121 m!1077331))

(declare-fun m!1077333 () Bool)

(assert (=> b!1169123 m!1077333))

(check-sat (not b!1169133) (not b_lambda!19899) tp_is_empty!29329 (not b_next!24799) (not b!1169131) (not b!1169127) (not b!1169121) (not b!1169122) (not b!1169130) (not b!1169125) (not b!1169126) b_and!40451 (not mapNonEmpty!45818) (not b!1169124) (not start!99430))
(check-sat b_and!40451 (not b_next!24799))
