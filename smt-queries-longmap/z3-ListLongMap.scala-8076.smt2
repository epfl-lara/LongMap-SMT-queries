; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99316 () Bool)

(assert start!99316)

(declare-fun b_free!24901 () Bool)

(declare-fun b_next!24901 () Bool)

(assert (=> start!99316 (= b_free!24901 (not b_next!24901))))

(declare-fun tp!87417 () Bool)

(declare-fun b_and!40647 () Bool)

(assert (=> start!99316 (= tp!87417 b_and!40647)))

(declare-datatypes ((array!75608 0))(
  ( (array!75609 (arr!36454 (Array (_ BitVec 32) (_ BitVec 64))) (size!36992 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75608)

(declare-fun e!665338 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1170596 () Bool)

(declare-fun arrayContainsKey!0 (array!75608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170596 (= e!665338 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!776936 () Bool)

(declare-fun e!665340 () Bool)

(assert (=> start!99316 (=> (not res!776936) (not e!665340))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99316 (= res!776936 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36992 _keys!1208))))))

(assert (=> start!99316 e!665340))

(declare-fun tp_is_empty!29431 () Bool)

(assert (=> start!99316 tp_is_empty!29431))

(declare-fun array_inv!27962 (array!75608) Bool)

(assert (=> start!99316 (array_inv!27962 _keys!1208)))

(assert (=> start!99316 true))

(assert (=> start!99316 tp!87417))

(declare-datatypes ((V!44369 0))(
  ( (V!44370 (val!14772 Int)) )
))
(declare-datatypes ((ValueCell!14006 0))(
  ( (ValueCellFull!14006 (v!17409 V!44369)) (EmptyCell!14006) )
))
(declare-datatypes ((array!75610 0))(
  ( (array!75611 (arr!36455 (Array (_ BitVec 32) ValueCell!14006)) (size!36993 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75610)

(declare-fun e!665345 () Bool)

(declare-fun array_inv!27963 (array!75610) Bool)

(assert (=> start!99316 (and (array_inv!27963 _values!996) e!665345)))

(declare-fun b!1170597 () Bool)

(declare-fun e!665336 () Bool)

(declare-fun e!665344 () Bool)

(assert (=> b!1170597 (= e!665336 e!665344)))

(declare-fun res!776944 () Bool)

(assert (=> b!1170597 (=> res!776944 e!665344)))

(assert (=> b!1170597 (= res!776944 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44369)

(declare-datatypes ((tuple2!18956 0))(
  ( (tuple2!18957 (_1!9489 (_ BitVec 64)) (_2!9489 V!44369)) )
))
(declare-datatypes ((List!25670 0))(
  ( (Nil!25667) (Cons!25666 (h!26875 tuple2!18956) (t!37554 List!25670)) )
))
(declare-datatypes ((ListLongMap!16925 0))(
  ( (ListLongMap!16926 (toList!8478 List!25670)) )
))
(declare-fun lt!527104 () ListLongMap!16925)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527105 () array!75610)

(declare-fun lt!527106 () array!75608)

(declare-fun minValue!944 () V!44369)

(declare-fun getCurrentListMapNoExtraKeys!4953 (array!75608 array!75610 (_ BitVec 32) (_ BitVec 32) V!44369 V!44369 (_ BitVec 32) Int) ListLongMap!16925)

(assert (=> b!1170597 (= lt!527104 (getCurrentListMapNoExtraKeys!4953 lt!527106 lt!527105 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527100 () V!44369)

(assert (=> b!1170597 (= lt!527105 (array!75611 (store (arr!36455 _values!996) i!673 (ValueCellFull!14006 lt!527100)) (size!36993 _values!996)))))

(declare-fun dynLambda!2878 (Int (_ BitVec 64)) V!44369)

(assert (=> b!1170597 (= lt!527100 (dynLambda!2878 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527108 () ListLongMap!16925)

(assert (=> b!1170597 (= lt!527108 (getCurrentListMapNoExtraKeys!4953 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170598 () Bool)

(declare-fun e!665347 () Bool)

(assert (=> b!1170598 (= e!665340 e!665347)))

(declare-fun res!776950 () Bool)

(assert (=> b!1170598 (=> (not res!776950) (not e!665347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75608 (_ BitVec 32)) Bool)

(assert (=> b!1170598 (= res!776950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527106 mask!1564))))

(assert (=> b!1170598 (= lt!527106 (array!75609 (store (arr!36454 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36992 _keys!1208)))))

(declare-fun b!1170599 () Bool)

(declare-fun e!665341 () Bool)

(declare-fun mapRes!45974 () Bool)

(assert (=> b!1170599 (= e!665345 (and e!665341 mapRes!45974))))

(declare-fun condMapEmpty!45974 () Bool)

(declare-fun mapDefault!45974 () ValueCell!14006)

(assert (=> b!1170599 (= condMapEmpty!45974 (= (arr!36455 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14006)) mapDefault!45974)))))

(declare-fun b!1170600 () Bool)

(declare-fun e!665343 () Bool)

(assert (=> b!1170600 (= e!665343 tp_is_empty!29431)))

(declare-fun b!1170601 () Bool)

(assert (=> b!1170601 (= e!665341 tp_is_empty!29431)))

(declare-fun b!1170602 () Bool)

(declare-fun e!665337 () Bool)

(assert (=> b!1170602 (= e!665344 e!665337)))

(declare-fun res!776943 () Bool)

(assert (=> b!1170602 (=> res!776943 e!665337)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170602 (= res!776943 (not (validKeyInArray!0 (select (arr!36454 _keys!1208) from!1455))))))

(declare-fun lt!527103 () ListLongMap!16925)

(declare-fun lt!527109 () ListLongMap!16925)

(assert (=> b!1170602 (= lt!527103 lt!527109)))

(declare-fun lt!527107 () ListLongMap!16925)

(declare-fun -!1476 (ListLongMap!16925 (_ BitVec 64)) ListLongMap!16925)

(assert (=> b!1170602 (= lt!527109 (-!1476 lt!527107 k0!934))))

(assert (=> b!1170602 (= lt!527103 (getCurrentListMapNoExtraKeys!4953 lt!527106 lt!527105 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170602 (= lt!527107 (getCurrentListMapNoExtraKeys!4953 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38437 0))(
  ( (Unit!38438) )
))
(declare-fun lt!527102 () Unit!38437)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!740 (array!75608 array!75610 (_ BitVec 32) (_ BitVec 32) V!44369 V!44369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38437)

(assert (=> b!1170602 (= lt!527102 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!740 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170603 () Bool)

(declare-fun e!665346 () Bool)

(assert (=> b!1170603 (= e!665337 e!665346)))

(declare-fun res!776945 () Bool)

(assert (=> b!1170603 (=> res!776945 e!665346)))

(assert (=> b!1170603 (= res!776945 (not (= (select (arr!36454 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665342 () Bool)

(assert (=> b!1170603 e!665342))

(declare-fun res!776942 () Bool)

(assert (=> b!1170603 (=> (not res!776942) (not e!665342))))

(declare-fun +!3797 (ListLongMap!16925 tuple2!18956) ListLongMap!16925)

(declare-fun get!18597 (ValueCell!14006 V!44369) V!44369)

(assert (=> b!1170603 (= res!776942 (= lt!527104 (+!3797 lt!527109 (tuple2!18957 (select (arr!36454 _keys!1208) from!1455) (get!18597 (select (arr!36455 _values!996) from!1455) lt!527100)))))))

(declare-fun b!1170604 () Bool)

(declare-fun res!776941 () Bool)

(assert (=> b!1170604 (=> (not res!776941) (not e!665340))))

(declare-datatypes ((List!25671 0))(
  ( (Nil!25668) (Cons!25667 (h!26876 (_ BitVec 64)) (t!37555 List!25671)) )
))
(declare-fun arrayNoDuplicates!0 (array!75608 (_ BitVec 32) List!25671) Bool)

(assert (=> b!1170604 (= res!776941 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25668))))

(declare-fun b!1170605 () Bool)

(declare-fun res!776940 () Bool)

(assert (=> b!1170605 (=> (not res!776940) (not e!665340))))

(assert (=> b!1170605 (= res!776940 (validKeyInArray!0 k0!934))))

(declare-fun b!1170606 () Bool)

(assert (=> b!1170606 (= e!665347 (not e!665336))))

(declare-fun res!776939 () Bool)

(assert (=> b!1170606 (=> res!776939 e!665336)))

(assert (=> b!1170606 (= res!776939 (bvsgt from!1455 i!673))))

(assert (=> b!1170606 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527101 () Unit!38437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75608 (_ BitVec 64) (_ BitVec 32)) Unit!38437)

(assert (=> b!1170606 (= lt!527101 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170607 () Bool)

(declare-fun res!776937 () Bool)

(assert (=> b!1170607 (=> (not res!776937) (not e!665347))))

(assert (=> b!1170607 (= res!776937 (arrayNoDuplicates!0 lt!527106 #b00000000000000000000000000000000 Nil!25668))))

(declare-fun b!1170608 () Bool)

(declare-fun res!776947 () Bool)

(assert (=> b!1170608 (=> (not res!776947) (not e!665340))))

(assert (=> b!1170608 (= res!776947 (and (= (size!36993 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36992 _keys!1208) (size!36993 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170609 () Bool)

(declare-fun res!776935 () Bool)

(assert (=> b!1170609 (=> (not res!776935) (not e!665340))))

(assert (=> b!1170609 (= res!776935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170610 () Bool)

(declare-fun res!776949 () Bool)

(assert (=> b!1170610 (=> (not res!776949) (not e!665340))))

(assert (=> b!1170610 (= res!776949 (= (select (arr!36454 _keys!1208) i!673) k0!934))))

(declare-fun b!1170611 () Bool)

(assert (=> b!1170611 (= e!665346 true)))

(assert (=> b!1170611 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527099 () Unit!38437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38437)

(assert (=> b!1170611 (= lt!527099 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45974 () Bool)

(assert (=> mapIsEmpty!45974 mapRes!45974))

(declare-fun b!1170612 () Bool)

(assert (=> b!1170612 (= e!665342 e!665338)))

(declare-fun res!776948 () Bool)

(assert (=> b!1170612 (=> res!776948 e!665338)))

(assert (=> b!1170612 (= res!776948 (not (= (select (arr!36454 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170613 () Bool)

(declare-fun res!776938 () Bool)

(assert (=> b!1170613 (=> (not res!776938) (not e!665340))))

(assert (=> b!1170613 (= res!776938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36992 _keys!1208))))))

(declare-fun mapNonEmpty!45974 () Bool)

(declare-fun tp!87416 () Bool)

(assert (=> mapNonEmpty!45974 (= mapRes!45974 (and tp!87416 e!665343))))

(declare-fun mapKey!45974 () (_ BitVec 32))

(declare-fun mapRest!45974 () (Array (_ BitVec 32) ValueCell!14006))

(declare-fun mapValue!45974 () ValueCell!14006)

(assert (=> mapNonEmpty!45974 (= (arr!36455 _values!996) (store mapRest!45974 mapKey!45974 mapValue!45974))))

(declare-fun b!1170614 () Bool)

(declare-fun res!776946 () Bool)

(assert (=> b!1170614 (=> (not res!776946) (not e!665340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170614 (= res!776946 (validMask!0 mask!1564))))

(assert (= (and start!99316 res!776936) b!1170614))

(assert (= (and b!1170614 res!776946) b!1170608))

(assert (= (and b!1170608 res!776947) b!1170609))

(assert (= (and b!1170609 res!776935) b!1170604))

(assert (= (and b!1170604 res!776941) b!1170613))

(assert (= (and b!1170613 res!776938) b!1170605))

(assert (= (and b!1170605 res!776940) b!1170610))

(assert (= (and b!1170610 res!776949) b!1170598))

(assert (= (and b!1170598 res!776950) b!1170607))

(assert (= (and b!1170607 res!776937) b!1170606))

(assert (= (and b!1170606 (not res!776939)) b!1170597))

(assert (= (and b!1170597 (not res!776944)) b!1170602))

(assert (= (and b!1170602 (not res!776943)) b!1170603))

(assert (= (and b!1170603 res!776942) b!1170612))

(assert (= (and b!1170612 (not res!776948)) b!1170596))

(assert (= (and b!1170603 (not res!776945)) b!1170611))

(assert (= (and b!1170599 condMapEmpty!45974) mapIsEmpty!45974))

(assert (= (and b!1170599 (not condMapEmpty!45974)) mapNonEmpty!45974))

(get-info :version)

(assert (= (and mapNonEmpty!45974 ((_ is ValueCellFull!14006) mapValue!45974)) b!1170600))

(assert (= (and b!1170599 ((_ is ValueCellFull!14006) mapDefault!45974)) b!1170601))

(assert (= start!99316 b!1170599))

(declare-fun b_lambda!20027 () Bool)

(assert (=> (not b_lambda!20027) (not b!1170597)))

(declare-fun t!37553 () Bool)

(declare-fun tb!9705 () Bool)

(assert (=> (and start!99316 (= defaultEntry!1004 defaultEntry!1004) t!37553) tb!9705))

(declare-fun result!19985 () Bool)

(assert (=> tb!9705 (= result!19985 tp_is_empty!29431)))

(assert (=> b!1170597 t!37553))

(declare-fun b_and!40649 () Bool)

(assert (= b_and!40647 (and (=> t!37553 result!19985) b_and!40649)))

(declare-fun m!1077935 () Bool)

(assert (=> b!1170603 m!1077935))

(declare-fun m!1077937 () Bool)

(assert (=> b!1170603 m!1077937))

(assert (=> b!1170603 m!1077937))

(declare-fun m!1077939 () Bool)

(assert (=> b!1170603 m!1077939))

(declare-fun m!1077941 () Bool)

(assert (=> b!1170603 m!1077941))

(declare-fun m!1077943 () Bool)

(assert (=> b!1170602 m!1077943))

(declare-fun m!1077945 () Bool)

(assert (=> b!1170602 m!1077945))

(declare-fun m!1077947 () Bool)

(assert (=> b!1170602 m!1077947))

(assert (=> b!1170602 m!1077935))

(declare-fun m!1077949 () Bool)

(assert (=> b!1170602 m!1077949))

(declare-fun m!1077951 () Bool)

(assert (=> b!1170602 m!1077951))

(assert (=> b!1170602 m!1077935))

(declare-fun m!1077953 () Bool)

(assert (=> start!99316 m!1077953))

(declare-fun m!1077955 () Bool)

(assert (=> start!99316 m!1077955))

(declare-fun m!1077957 () Bool)

(assert (=> b!1170596 m!1077957))

(declare-fun m!1077959 () Bool)

(assert (=> b!1170606 m!1077959))

(declare-fun m!1077961 () Bool)

(assert (=> b!1170606 m!1077961))

(assert (=> b!1170612 m!1077935))

(declare-fun m!1077963 () Bool)

(assert (=> b!1170598 m!1077963))

(declare-fun m!1077965 () Bool)

(assert (=> b!1170598 m!1077965))

(declare-fun m!1077967 () Bool)

(assert (=> b!1170605 m!1077967))

(declare-fun m!1077969 () Bool)

(assert (=> b!1170609 m!1077969))

(declare-fun m!1077971 () Bool)

(assert (=> b!1170607 m!1077971))

(declare-fun m!1077973 () Bool)

(assert (=> mapNonEmpty!45974 m!1077973))

(declare-fun m!1077975 () Bool)

(assert (=> b!1170611 m!1077975))

(declare-fun m!1077977 () Bool)

(assert (=> b!1170611 m!1077977))

(declare-fun m!1077979 () Bool)

(assert (=> b!1170614 m!1077979))

(declare-fun m!1077981 () Bool)

(assert (=> b!1170610 m!1077981))

(declare-fun m!1077983 () Bool)

(assert (=> b!1170604 m!1077983))

(declare-fun m!1077985 () Bool)

(assert (=> b!1170597 m!1077985))

(declare-fun m!1077987 () Bool)

(assert (=> b!1170597 m!1077987))

(declare-fun m!1077989 () Bool)

(assert (=> b!1170597 m!1077989))

(declare-fun m!1077991 () Bool)

(assert (=> b!1170597 m!1077991))

(check-sat b_and!40649 (not b!1170596) (not b!1170609) (not mapNonEmpty!45974) (not start!99316) (not b_lambda!20027) (not b!1170598) (not b!1170614) (not b_next!24901) (not b!1170604) tp_is_empty!29431 (not b!1170611) (not b!1170606) (not b!1170597) (not b!1170602) (not b!1170605) (not b!1170607) (not b!1170603))
(check-sat b_and!40649 (not b_next!24901))
