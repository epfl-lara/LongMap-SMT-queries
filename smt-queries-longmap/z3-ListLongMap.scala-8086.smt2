; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99376 () Bool)

(assert start!99376)

(declare-fun b_free!24961 () Bool)

(declare-fun b_next!24961 () Bool)

(assert (=> start!99376 (= b_free!24961 (not b_next!24961))))

(declare-fun tp!87597 () Bool)

(declare-fun b_and!40767 () Bool)

(assert (=> start!99376 (= tp!87597 b_and!40767)))

(declare-fun b!1172611 () Bool)

(declare-fun res!778618 () Bool)

(declare-fun e!666506 () Bool)

(assert (=> b!1172611 (=> (not res!778618) (not e!666506))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75724 0))(
  ( (array!75725 (arr!36512 (Array (_ BitVec 32) (_ BitVec 64))) (size!37050 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75724)

(assert (=> b!1172611 (= res!778618 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37050 _keys!1208))))))

(declare-fun b!1172612 () Bool)

(declare-datatypes ((Unit!38487 0))(
  ( (Unit!38488) )
))
(declare-fun e!666499 () Unit!38487)

(declare-fun Unit!38489 () Unit!38487)

(assert (=> b!1172612 (= e!666499 Unit!38489)))

(declare-fun lt!528268 () Unit!38487)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38487)

(assert (=> b!1172612 (= lt!528268 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172612 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528261 () Unit!38487)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75724 (_ BitVec 32) (_ BitVec 32)) Unit!38487)

(assert (=> b!1172612 (= lt!528261 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25720 0))(
  ( (Nil!25717) (Cons!25716 (h!26925 (_ BitVec 64)) (t!37664 List!25720)) )
))
(declare-fun arrayNoDuplicates!0 (array!75724 (_ BitVec 32) List!25720) Bool)

(assert (=> b!1172612 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25717)))

(declare-fun lt!528264 () Unit!38487)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75724 (_ BitVec 64) (_ BitVec 32) List!25720) Unit!38487)

(assert (=> b!1172612 (= lt!528264 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25717))))

(assert (=> b!1172612 false))

(declare-fun b!1172613 () Bool)

(declare-fun e!666497 () Bool)

(declare-fun e!666500 () Bool)

(declare-fun mapRes!46064 () Bool)

(assert (=> b!1172613 (= e!666497 (and e!666500 mapRes!46064))))

(declare-fun condMapEmpty!46064 () Bool)

(declare-datatypes ((V!44449 0))(
  ( (V!44450 (val!14802 Int)) )
))
(declare-datatypes ((ValueCell!14036 0))(
  ( (ValueCellFull!14036 (v!17439 V!44449)) (EmptyCell!14036) )
))
(declare-datatypes ((array!75726 0))(
  ( (array!75727 (arr!36513 (Array (_ BitVec 32) ValueCell!14036)) (size!37051 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75726)

(declare-fun mapDefault!46064 () ValueCell!14036)

(assert (=> b!1172613 (= condMapEmpty!46064 (= (arr!36513 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14036)) mapDefault!46064)))))

(declare-fun b!1172614 () Bool)

(declare-fun e!666508 () Bool)

(declare-fun e!666502 () Bool)

(assert (=> b!1172614 (= e!666508 e!666502)))

(declare-fun res!778620 () Bool)

(assert (=> b!1172614 (=> res!778620 e!666502)))

(assert (=> b!1172614 (= res!778620 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44449)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528265 () array!75724)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528270 () array!75726)

(declare-fun minValue!944 () V!44449)

(declare-datatypes ((tuple2!19004 0))(
  ( (tuple2!19005 (_1!9513 (_ BitVec 64)) (_2!9513 V!44449)) )
))
(declare-datatypes ((List!25721 0))(
  ( (Nil!25718) (Cons!25717 (h!26926 tuple2!19004) (t!37665 List!25721)) )
))
(declare-datatypes ((ListLongMap!16973 0))(
  ( (ListLongMap!16974 (toList!8502 List!25721)) )
))
(declare-fun lt!528267 () ListLongMap!16973)

(declare-fun getCurrentListMapNoExtraKeys!4976 (array!75724 array!75726 (_ BitVec 32) (_ BitVec 32) V!44449 V!44449 (_ BitVec 32) Int) ListLongMap!16973)

(assert (=> b!1172614 (= lt!528267 (getCurrentListMapNoExtraKeys!4976 lt!528265 lt!528270 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528262 () V!44449)

(assert (=> b!1172614 (= lt!528270 (array!75727 (store (arr!36513 _values!996) i!673 (ValueCellFull!14036 lt!528262)) (size!37051 _values!996)))))

(declare-fun dynLambda!2901 (Int (_ BitVec 64)) V!44449)

(assert (=> b!1172614 (= lt!528262 (dynLambda!2901 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528260 () ListLongMap!16973)

(assert (=> b!1172614 (= lt!528260 (getCurrentListMapNoExtraKeys!4976 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!778625 () Bool)

(assert (=> start!99376 (=> (not res!778625) (not e!666506))))

(assert (=> start!99376 (= res!778625 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37050 _keys!1208))))))

(assert (=> start!99376 e!666506))

(declare-fun tp_is_empty!29491 () Bool)

(assert (=> start!99376 tp_is_empty!29491))

(declare-fun array_inv!28004 (array!75724) Bool)

(assert (=> start!99376 (array_inv!28004 _keys!1208)))

(assert (=> start!99376 true))

(assert (=> start!99376 tp!87597))

(declare-fun array_inv!28005 (array!75726) Bool)

(assert (=> start!99376 (and (array_inv!28005 _values!996) e!666497)))

(declare-fun b!1172615 () Bool)

(declare-fun e!666501 () Bool)

(assert (=> b!1172615 (= e!666501 tp_is_empty!29491)))

(declare-fun b!1172616 () Bool)

(assert (=> b!1172616 (= e!666500 tp_is_empty!29491)))

(declare-fun b!1172617 () Bool)

(declare-fun e!666505 () Bool)

(assert (=> b!1172617 (= e!666505 (not e!666508))))

(declare-fun res!778616 () Bool)

(assert (=> b!1172617 (=> res!778616 e!666508)))

(assert (=> b!1172617 (= res!778616 (bvsgt from!1455 i!673))))

(assert (=> b!1172617 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528257 () Unit!38487)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75724 (_ BitVec 64) (_ BitVec 32)) Unit!38487)

(assert (=> b!1172617 (= lt!528257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172618 () Bool)

(declare-fun res!778630 () Bool)

(assert (=> b!1172618 (=> (not res!778630) (not e!666506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172618 (= res!778630 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46064 () Bool)

(assert (=> mapIsEmpty!46064 mapRes!46064))

(declare-fun b!1172619 () Bool)

(declare-fun res!778623 () Bool)

(assert (=> b!1172619 (=> (not res!778623) (not e!666506))))

(assert (=> b!1172619 (= res!778623 (and (= (size!37051 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37050 _keys!1208) (size!37051 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172620 () Bool)

(declare-fun res!778628 () Bool)

(assert (=> b!1172620 (=> (not res!778628) (not e!666506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75724 (_ BitVec 32)) Bool)

(assert (=> b!1172620 (= res!778628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172621 () Bool)

(declare-fun res!778621 () Bool)

(assert (=> b!1172621 (=> (not res!778621) (not e!666506))))

(assert (=> b!1172621 (= res!778621 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25717))))

(declare-fun b!1172622 () Bool)

(assert (=> b!1172622 (= e!666506 e!666505)))

(declare-fun res!778629 () Bool)

(assert (=> b!1172622 (=> (not res!778629) (not e!666505))))

(assert (=> b!1172622 (= res!778629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528265 mask!1564))))

(assert (=> b!1172622 (= lt!528265 (array!75725 (store (arr!36512 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37050 _keys!1208)))))

(declare-fun b!1172623 () Bool)

(declare-fun res!778627 () Bool)

(assert (=> b!1172623 (=> (not res!778627) (not e!666506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172623 (= res!778627 (validKeyInArray!0 k0!934))))

(declare-fun b!1172624 () Bool)

(declare-fun e!666498 () Bool)

(assert (=> b!1172624 (= e!666502 e!666498)))

(declare-fun res!778619 () Bool)

(assert (=> b!1172624 (=> res!778619 e!666498)))

(assert (=> b!1172624 (= res!778619 (not (validKeyInArray!0 (select (arr!36512 _keys!1208) from!1455))))))

(declare-fun lt!528269 () ListLongMap!16973)

(declare-fun lt!528266 () ListLongMap!16973)

(assert (=> b!1172624 (= lt!528269 lt!528266)))

(declare-fun lt!528259 () ListLongMap!16973)

(declare-fun -!1491 (ListLongMap!16973 (_ BitVec 64)) ListLongMap!16973)

(assert (=> b!1172624 (= lt!528266 (-!1491 lt!528259 k0!934))))

(assert (=> b!1172624 (= lt!528269 (getCurrentListMapNoExtraKeys!4976 lt!528265 lt!528270 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172624 (= lt!528259 (getCurrentListMapNoExtraKeys!4976 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528258 () Unit!38487)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!755 (array!75724 array!75726 (_ BitVec 32) (_ BitVec 32) V!44449 V!44449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38487)

(assert (=> b!1172624 (= lt!528258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172625 () Bool)

(assert (=> b!1172625 (= e!666498 true)))

(assert (=> b!1172625 (not (= (select (arr!36512 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528263 () Unit!38487)

(assert (=> b!1172625 (= lt!528263 e!666499)))

(declare-fun c!116539 () Bool)

(assert (=> b!1172625 (= c!116539 (= (select (arr!36512 _keys!1208) from!1455) k0!934))))

(declare-fun e!666507 () Bool)

(assert (=> b!1172625 e!666507))

(declare-fun res!778622 () Bool)

(assert (=> b!1172625 (=> (not res!778622) (not e!666507))))

(declare-fun +!3817 (ListLongMap!16973 tuple2!19004) ListLongMap!16973)

(declare-fun get!18637 (ValueCell!14036 V!44449) V!44449)

(assert (=> b!1172625 (= res!778622 (= lt!528267 (+!3817 lt!528266 (tuple2!19005 (select (arr!36512 _keys!1208) from!1455) (get!18637 (select (arr!36513 _values!996) from!1455) lt!528262)))))))

(declare-fun b!1172626 () Bool)

(declare-fun res!778626 () Bool)

(assert (=> b!1172626 (=> (not res!778626) (not e!666506))))

(assert (=> b!1172626 (= res!778626 (= (select (arr!36512 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46064 () Bool)

(declare-fun tp!87596 () Bool)

(assert (=> mapNonEmpty!46064 (= mapRes!46064 (and tp!87596 e!666501))))

(declare-fun mapRest!46064 () (Array (_ BitVec 32) ValueCell!14036))

(declare-fun mapValue!46064 () ValueCell!14036)

(declare-fun mapKey!46064 () (_ BitVec 32))

(assert (=> mapNonEmpty!46064 (= (arr!36513 _values!996) (store mapRest!46064 mapKey!46064 mapValue!46064))))

(declare-fun b!1172627 () Bool)

(declare-fun e!666503 () Bool)

(assert (=> b!1172627 (= e!666503 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172628 () Bool)

(declare-fun Unit!38490 () Unit!38487)

(assert (=> b!1172628 (= e!666499 Unit!38490)))

(declare-fun b!1172629 () Bool)

(assert (=> b!1172629 (= e!666507 e!666503)))

(declare-fun res!778624 () Bool)

(assert (=> b!1172629 (=> res!778624 e!666503)))

(assert (=> b!1172629 (= res!778624 (not (= (select (arr!36512 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172630 () Bool)

(declare-fun res!778617 () Bool)

(assert (=> b!1172630 (=> (not res!778617) (not e!666505))))

(assert (=> b!1172630 (= res!778617 (arrayNoDuplicates!0 lt!528265 #b00000000000000000000000000000000 Nil!25717))))

(assert (= (and start!99376 res!778625) b!1172618))

(assert (= (and b!1172618 res!778630) b!1172619))

(assert (= (and b!1172619 res!778623) b!1172620))

(assert (= (and b!1172620 res!778628) b!1172621))

(assert (= (and b!1172621 res!778621) b!1172611))

(assert (= (and b!1172611 res!778618) b!1172623))

(assert (= (and b!1172623 res!778627) b!1172626))

(assert (= (and b!1172626 res!778626) b!1172622))

(assert (= (and b!1172622 res!778629) b!1172630))

(assert (= (and b!1172630 res!778617) b!1172617))

(assert (= (and b!1172617 (not res!778616)) b!1172614))

(assert (= (and b!1172614 (not res!778620)) b!1172624))

(assert (= (and b!1172624 (not res!778619)) b!1172625))

(assert (= (and b!1172625 res!778622) b!1172629))

(assert (= (and b!1172629 (not res!778624)) b!1172627))

(assert (= (and b!1172625 c!116539) b!1172612))

(assert (= (and b!1172625 (not c!116539)) b!1172628))

(assert (= (and b!1172613 condMapEmpty!46064) mapIsEmpty!46064))

(assert (= (and b!1172613 (not condMapEmpty!46064)) mapNonEmpty!46064))

(get-info :version)

(assert (= (and mapNonEmpty!46064 ((_ is ValueCellFull!14036) mapValue!46064)) b!1172615))

(assert (= (and b!1172613 ((_ is ValueCellFull!14036) mapDefault!46064)) b!1172616))

(assert (= start!99376 b!1172613))

(declare-fun b_lambda!20087 () Bool)

(assert (=> (not b_lambda!20087) (not b!1172614)))

(declare-fun t!37663 () Bool)

(declare-fun tb!9765 () Bool)

(assert (=> (and start!99376 (= defaultEntry!1004 defaultEntry!1004) t!37663) tb!9765))

(declare-fun result!20105 () Bool)

(assert (=> tb!9765 (= result!20105 tp_is_empty!29491)))

(assert (=> b!1172614 t!37663))

(declare-fun b_and!40769 () Bool)

(assert (= b_and!40767 (and (=> t!37663 result!20105) b_and!40769)))

(declare-fun m!1079945 () Bool)

(assert (=> start!99376 m!1079945))

(declare-fun m!1079947 () Bool)

(assert (=> start!99376 m!1079947))

(declare-fun m!1079949 () Bool)

(assert (=> b!1172630 m!1079949))

(declare-fun m!1079951 () Bool)

(assert (=> b!1172629 m!1079951))

(declare-fun m!1079953 () Bool)

(assert (=> b!1172626 m!1079953))

(declare-fun m!1079955 () Bool)

(assert (=> b!1172612 m!1079955))

(declare-fun m!1079957 () Bool)

(assert (=> b!1172612 m!1079957))

(declare-fun m!1079959 () Bool)

(assert (=> b!1172612 m!1079959))

(declare-fun m!1079961 () Bool)

(assert (=> b!1172612 m!1079961))

(declare-fun m!1079963 () Bool)

(assert (=> b!1172612 m!1079963))

(declare-fun m!1079965 () Bool)

(assert (=> b!1172617 m!1079965))

(declare-fun m!1079967 () Bool)

(assert (=> b!1172617 m!1079967))

(assert (=> b!1172625 m!1079951))

(declare-fun m!1079969 () Bool)

(assert (=> b!1172625 m!1079969))

(assert (=> b!1172625 m!1079969))

(declare-fun m!1079971 () Bool)

(assert (=> b!1172625 m!1079971))

(declare-fun m!1079973 () Bool)

(assert (=> b!1172625 m!1079973))

(declare-fun m!1079975 () Bool)

(assert (=> b!1172614 m!1079975))

(declare-fun m!1079977 () Bool)

(assert (=> b!1172614 m!1079977))

(declare-fun m!1079979 () Bool)

(assert (=> b!1172614 m!1079979))

(declare-fun m!1079981 () Bool)

(assert (=> b!1172614 m!1079981))

(declare-fun m!1079983 () Bool)

(assert (=> b!1172618 m!1079983))

(declare-fun m!1079985 () Bool)

(assert (=> b!1172621 m!1079985))

(declare-fun m!1079987 () Bool)

(assert (=> b!1172624 m!1079987))

(declare-fun m!1079989 () Bool)

(assert (=> b!1172624 m!1079989))

(declare-fun m!1079991 () Bool)

(assert (=> b!1172624 m!1079991))

(declare-fun m!1079993 () Bool)

(assert (=> b!1172624 m!1079993))

(assert (=> b!1172624 m!1079951))

(declare-fun m!1079995 () Bool)

(assert (=> b!1172624 m!1079995))

(assert (=> b!1172624 m!1079951))

(declare-fun m!1079997 () Bool)

(assert (=> mapNonEmpty!46064 m!1079997))

(declare-fun m!1079999 () Bool)

(assert (=> b!1172627 m!1079999))

(declare-fun m!1080001 () Bool)

(assert (=> b!1172623 m!1080001))

(declare-fun m!1080003 () Bool)

(assert (=> b!1172622 m!1080003))

(declare-fun m!1080005 () Bool)

(assert (=> b!1172622 m!1080005))

(declare-fun m!1080007 () Bool)

(assert (=> b!1172620 m!1080007))

(check-sat (not b!1172612) (not start!99376) (not b!1172618) (not b!1172623) (not mapNonEmpty!46064) (not b!1172624) (not b_lambda!20087) (not b!1172614) (not b!1172627) (not b!1172622) (not b_next!24961) (not b!1172620) (not b!1172621) (not b!1172617) (not b!1172630) (not b!1172625) tp_is_empty!29491 b_and!40769)
(check-sat b_and!40769 (not b_next!24961))
