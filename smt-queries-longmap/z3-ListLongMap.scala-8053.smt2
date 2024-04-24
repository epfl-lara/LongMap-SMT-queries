; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99394 () Bool)

(assert start!99394)

(declare-fun b_free!24763 () Bool)

(declare-fun b_next!24763 () Bool)

(assert (=> start!99394 (= b_free!24763 (not b_next!24763))))

(declare-fun tp!86999 () Bool)

(declare-fun b_and!40377 () Bool)

(assert (=> start!99394 (= tp!86999 b_and!40377)))

(declare-fun b!1168273 () Bool)

(declare-fun e!664153 () Bool)

(declare-fun e!664150 () Bool)

(assert (=> b!1168273 (= e!664153 e!664150)))

(declare-fun res!774626 () Bool)

(assert (=> b!1168273 (=> (not res!774626) (not e!664150))))

(declare-datatypes ((array!75463 0))(
  ( (array!75464 (arr!36376 (Array (_ BitVec 32) (_ BitVec 64))) (size!36913 (_ BitVec 32))) )
))
(declare-fun lt!525948 () array!75463)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75463 (_ BitVec 32)) Bool)

(assert (=> b!1168273 (= res!774626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525948 mask!1564))))

(declare-fun _keys!1208 () array!75463)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168273 (= lt!525948 (array!75464 (store (arr!36376 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36913 _keys!1208)))))

(declare-fun b!1168274 () Bool)

(declare-fun e!664148 () Bool)

(assert (=> b!1168274 (= e!664148 true)))

(declare-datatypes ((V!44185 0))(
  ( (V!44186 (val!14703 Int)) )
))
(declare-fun zeroValue!944 () V!44185)

(declare-datatypes ((ValueCell!13937 0))(
  ( (ValueCellFull!13937 (v!17336 V!44185)) (EmptyCell!13937) )
))
(declare-datatypes ((array!75465 0))(
  ( (array!75466 (arr!36377 (Array (_ BitVec 32) ValueCell!13937)) (size!36914 (_ BitVec 32))) )
))
(declare-fun lt!525945 () array!75465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44185)

(declare-fun _values!996 () array!75465)

(declare-datatypes ((tuple2!18788 0))(
  ( (tuple2!18789 (_1!9405 (_ BitVec 64)) (_2!9405 V!44185)) )
))
(declare-datatypes ((List!25529 0))(
  ( (Nil!25526) (Cons!25525 (h!26743 tuple2!18788) (t!37276 List!25529)) )
))
(declare-datatypes ((ListLongMap!16765 0))(
  ( (ListLongMap!16766 (toList!8398 List!25529)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4889 (array!75463 array!75465 (_ BitVec 32) (_ BitVec 32) V!44185 V!44185 (_ BitVec 32) Int) ListLongMap!16765)

(declare-fun -!1461 (ListLongMap!16765 (_ BitVec 64)) ListLongMap!16765)

(assert (=> b!1168274 (= (getCurrentListMapNoExtraKeys!4889 lt!525948 lt!525945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1461 (getCurrentListMapNoExtraKeys!4889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38493 0))(
  ( (Unit!38494) )
))
(declare-fun lt!525946 () Unit!38493)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!686 (array!75463 array!75465 (_ BitVec 32) (_ BitVec 32) V!44185 V!44185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38493)

(assert (=> b!1168274 (= lt!525946 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168276 () Bool)

(declare-fun res!774619 () Bool)

(assert (=> b!1168276 (=> (not res!774619) (not e!664153))))

(assert (=> b!1168276 (= res!774619 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36913 _keys!1208))))))

(declare-fun b!1168277 () Bool)

(declare-fun e!664149 () Bool)

(declare-fun tp_is_empty!29293 () Bool)

(assert (=> b!1168277 (= e!664149 tp_is_empty!29293)))

(declare-fun b!1168278 () Bool)

(declare-fun e!664146 () Bool)

(assert (=> b!1168278 (= e!664146 e!664148)))

(declare-fun res!774616 () Bool)

(assert (=> b!1168278 (=> res!774616 e!664148)))

(assert (=> b!1168278 (= res!774616 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525944 () ListLongMap!16765)

(assert (=> b!1168278 (= lt!525944 (getCurrentListMapNoExtraKeys!4889 lt!525948 lt!525945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2878 (Int (_ BitVec 64)) V!44185)

(assert (=> b!1168278 (= lt!525945 (array!75466 (store (arr!36377 _values!996) i!673 (ValueCellFull!13937 (dynLambda!2878 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36914 _values!996)))))

(declare-fun lt!525949 () ListLongMap!16765)

(assert (=> b!1168278 (= lt!525949 (getCurrentListMapNoExtraKeys!4889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168279 () Bool)

(declare-fun res!774621 () Bool)

(assert (=> b!1168279 (=> (not res!774621) (not e!664153))))

(assert (=> b!1168279 (= res!774621 (and (= (size!36914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36913 _keys!1208) (size!36914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168280 () Bool)

(declare-fun res!774625 () Bool)

(assert (=> b!1168280 (=> (not res!774625) (not e!664150))))

(declare-datatypes ((List!25530 0))(
  ( (Nil!25527) (Cons!25526 (h!26744 (_ BitVec 64)) (t!37277 List!25530)) )
))
(declare-fun arrayNoDuplicates!0 (array!75463 (_ BitVec 32) List!25530) Bool)

(assert (=> b!1168280 (= res!774625 (arrayNoDuplicates!0 lt!525948 #b00000000000000000000000000000000 Nil!25527))))

(declare-fun b!1168281 () Bool)

(declare-fun res!774624 () Bool)

(assert (=> b!1168281 (=> (not res!774624) (not e!664153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168281 (= res!774624 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45764 () Bool)

(declare-fun mapRes!45764 () Bool)

(assert (=> mapIsEmpty!45764 mapRes!45764))

(declare-fun b!1168282 () Bool)

(assert (=> b!1168282 (= e!664150 (not e!664146))))

(declare-fun res!774627 () Bool)

(assert (=> b!1168282 (=> res!774627 e!664146)))

(assert (=> b!1168282 (= res!774627 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168282 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525947 () Unit!38493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75463 (_ BitVec 64) (_ BitVec 32)) Unit!38493)

(assert (=> b!1168282 (= lt!525947 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168283 () Bool)

(declare-fun e!664147 () Bool)

(assert (=> b!1168283 (= e!664147 tp_is_empty!29293)))

(declare-fun b!1168275 () Bool)

(declare-fun res!774623 () Bool)

(assert (=> b!1168275 (=> (not res!774623) (not e!664153))))

(assert (=> b!1168275 (= res!774623 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25527))))

(declare-fun res!774618 () Bool)

(assert (=> start!99394 (=> (not res!774618) (not e!664153))))

(assert (=> start!99394 (= res!774618 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36913 _keys!1208))))))

(assert (=> start!99394 e!664153))

(assert (=> start!99394 tp_is_empty!29293))

(declare-fun array_inv!27886 (array!75463) Bool)

(assert (=> start!99394 (array_inv!27886 _keys!1208)))

(assert (=> start!99394 true))

(assert (=> start!99394 tp!86999))

(declare-fun e!664151 () Bool)

(declare-fun array_inv!27887 (array!75465) Bool)

(assert (=> start!99394 (and (array_inv!27887 _values!996) e!664151)))

(declare-fun b!1168284 () Bool)

(assert (=> b!1168284 (= e!664151 (and e!664149 mapRes!45764))))

(declare-fun condMapEmpty!45764 () Bool)

(declare-fun mapDefault!45764 () ValueCell!13937)

(assert (=> b!1168284 (= condMapEmpty!45764 (= (arr!36377 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13937)) mapDefault!45764)))))

(declare-fun b!1168285 () Bool)

(declare-fun res!774620 () Bool)

(assert (=> b!1168285 (=> (not res!774620) (not e!664153))))

(assert (=> b!1168285 (= res!774620 (= (select (arr!36376 _keys!1208) i!673) k0!934))))

(declare-fun b!1168286 () Bool)

(declare-fun res!774622 () Bool)

(assert (=> b!1168286 (=> (not res!774622) (not e!664153))))

(assert (=> b!1168286 (= res!774622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168287 () Bool)

(declare-fun res!774617 () Bool)

(assert (=> b!1168287 (=> (not res!774617) (not e!664153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168287 (= res!774617 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45764 () Bool)

(declare-fun tp!87000 () Bool)

(assert (=> mapNonEmpty!45764 (= mapRes!45764 (and tp!87000 e!664147))))

(declare-fun mapValue!45764 () ValueCell!13937)

(declare-fun mapRest!45764 () (Array (_ BitVec 32) ValueCell!13937))

(declare-fun mapKey!45764 () (_ BitVec 32))

(assert (=> mapNonEmpty!45764 (= (arr!36377 _values!996) (store mapRest!45764 mapKey!45764 mapValue!45764))))

(assert (= (and start!99394 res!774618) b!1168281))

(assert (= (and b!1168281 res!774624) b!1168279))

(assert (= (and b!1168279 res!774621) b!1168286))

(assert (= (and b!1168286 res!774622) b!1168275))

(assert (= (and b!1168275 res!774623) b!1168276))

(assert (= (and b!1168276 res!774619) b!1168287))

(assert (= (and b!1168287 res!774617) b!1168285))

(assert (= (and b!1168285 res!774620) b!1168273))

(assert (= (and b!1168273 res!774626) b!1168280))

(assert (= (and b!1168280 res!774625) b!1168282))

(assert (= (and b!1168282 (not res!774627)) b!1168278))

(assert (= (and b!1168278 (not res!774616)) b!1168274))

(assert (= (and b!1168284 condMapEmpty!45764) mapIsEmpty!45764))

(assert (= (and b!1168284 (not condMapEmpty!45764)) mapNonEmpty!45764))

(get-info :version)

(assert (= (and mapNonEmpty!45764 ((_ is ValueCellFull!13937) mapValue!45764)) b!1168283))

(assert (= (and b!1168284 ((_ is ValueCellFull!13937) mapDefault!45764)) b!1168277))

(assert (= start!99394 b!1168284))

(declare-fun b_lambda!19863 () Bool)

(assert (=> (not b_lambda!19863) (not b!1168278)))

(declare-fun t!37275 () Bool)

(declare-fun tb!9567 () Bool)

(assert (=> (and start!99394 (= defaultEntry!1004 defaultEntry!1004) t!37275) tb!9567))

(declare-fun result!19707 () Bool)

(assert (=> tb!9567 (= result!19707 tp_is_empty!29293)))

(assert (=> b!1168278 t!37275))

(declare-fun b_and!40379 () Bool)

(assert (= b_and!40377 (and (=> t!37275 result!19707) b_and!40379)))

(declare-fun m!1076537 () Bool)

(assert (=> b!1168287 m!1076537))

(declare-fun m!1076539 () Bool)

(assert (=> start!99394 m!1076539))

(declare-fun m!1076541 () Bool)

(assert (=> start!99394 m!1076541))

(declare-fun m!1076543 () Bool)

(assert (=> b!1168280 m!1076543))

(declare-fun m!1076545 () Bool)

(assert (=> b!1168285 m!1076545))

(declare-fun m!1076547 () Bool)

(assert (=> b!1168274 m!1076547))

(declare-fun m!1076549 () Bool)

(assert (=> b!1168274 m!1076549))

(assert (=> b!1168274 m!1076549))

(declare-fun m!1076551 () Bool)

(assert (=> b!1168274 m!1076551))

(declare-fun m!1076553 () Bool)

(assert (=> b!1168274 m!1076553))

(declare-fun m!1076555 () Bool)

(assert (=> b!1168286 m!1076555))

(declare-fun m!1076557 () Bool)

(assert (=> b!1168278 m!1076557))

(declare-fun m!1076559 () Bool)

(assert (=> b!1168278 m!1076559))

(declare-fun m!1076561 () Bool)

(assert (=> b!1168278 m!1076561))

(declare-fun m!1076563 () Bool)

(assert (=> b!1168278 m!1076563))

(declare-fun m!1076565 () Bool)

(assert (=> b!1168282 m!1076565))

(declare-fun m!1076567 () Bool)

(assert (=> b!1168282 m!1076567))

(declare-fun m!1076569 () Bool)

(assert (=> b!1168281 m!1076569))

(declare-fun m!1076571 () Bool)

(assert (=> b!1168273 m!1076571))

(declare-fun m!1076573 () Bool)

(assert (=> b!1168273 m!1076573))

(declare-fun m!1076575 () Bool)

(assert (=> mapNonEmpty!45764 m!1076575))

(declare-fun m!1076577 () Bool)

(assert (=> b!1168275 m!1076577))

(check-sat (not b!1168286) (not b!1168280) (not b!1168278) (not b!1168275) b_and!40379 (not b!1168287) tp_is_empty!29293 (not b_next!24763) (not b!1168274) (not b!1168282) (not start!99394) (not b_lambda!19863) (not b!1168281) (not mapNonEmpty!45764) (not b!1168273))
(check-sat b_and!40379 (not b_next!24763))
