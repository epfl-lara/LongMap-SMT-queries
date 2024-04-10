; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99426 () Bool)

(assert start!99426)

(declare-fun b_free!25005 () Bool)

(declare-fun b_next!25005 () Bool)

(assert (=> start!99426 (= b_free!25005 (not b_next!25005))))

(declare-fun tp!87729 () Bool)

(declare-fun b_and!40877 () Bool)

(assert (=> start!99426 (= tp!87729 b_and!40877)))

(declare-fun b!1174099 () Bool)

(declare-fun e!667372 () Bool)

(declare-fun e!667378 () Bool)

(assert (=> b!1174099 (= e!667372 e!667378)))

(declare-fun res!779681 () Bool)

(assert (=> b!1174099 (=> res!779681 e!667378)))

(declare-datatypes ((array!75881 0))(
  ( (array!75882 (arr!36590 (Array (_ BitVec 32) (_ BitVec 64))) (size!37126 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75881)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174099 (= res!779681 (not (validKeyInArray!0 (select (arr!36590 _keys!1208) from!1455))))))

(declare-datatypes ((V!44507 0))(
  ( (V!44508 (val!14824 Int)) )
))
(declare-datatypes ((tuple2!18946 0))(
  ( (tuple2!18947 (_1!9484 (_ BitVec 64)) (_2!9484 V!44507)) )
))
(declare-datatypes ((List!25685 0))(
  ( (Nil!25682) (Cons!25681 (h!26890 tuple2!18946) (t!37682 List!25685)) )
))
(declare-datatypes ((ListLongMap!16915 0))(
  ( (ListLongMap!16916 (toList!8473 List!25685)) )
))
(declare-fun lt!529378 () ListLongMap!16915)

(declare-fun lt!529382 () ListLongMap!16915)

(assert (=> b!1174099 (= lt!529378 lt!529382)))

(declare-fun lt!529384 () ListLongMap!16915)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1534 (ListLongMap!16915 (_ BitVec 64)) ListLongMap!16915)

(assert (=> b!1174099 (= lt!529382 (-!1534 lt!529384 k0!934))))

(declare-fun zeroValue!944 () V!44507)

(declare-datatypes ((ValueCell!14058 0))(
  ( (ValueCellFull!14058 (v!17462 V!44507)) (EmptyCell!14058) )
))
(declare-datatypes ((array!75883 0))(
  ( (array!75884 (arr!36591 (Array (_ BitVec 32) ValueCell!14058)) (size!37127 (_ BitVec 32))) )
))
(declare-fun lt!529385 () array!75883)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529376 () array!75881)

(declare-fun minValue!944 () V!44507)

(declare-fun getCurrentListMapNoExtraKeys!4934 (array!75881 array!75883 (_ BitVec 32) (_ BitVec 32) V!44507 V!44507 (_ BitVec 32) Int) ListLongMap!16915)

(assert (=> b!1174099 (= lt!529378 (getCurrentListMapNoExtraKeys!4934 lt!529376 lt!529385 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75883)

(assert (=> b!1174099 (= lt!529384 (getCurrentListMapNoExtraKeys!4934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38727 0))(
  ( (Unit!38728) )
))
(declare-fun lt!529379 () Unit!38727)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!761 (array!75881 array!75883 (_ BitVec 32) (_ BitVec 32) V!44507 V!44507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38727)

(assert (=> b!1174099 (= lt!529379 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174100 () Bool)

(assert (=> b!1174100 (= e!667378 true)))

(assert (=> b!1174100 (not (= (select (arr!36590 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529381 () Unit!38727)

(declare-fun e!667367 () Unit!38727)

(assert (=> b!1174100 (= lt!529381 e!667367)))

(declare-fun c!116631 () Bool)

(assert (=> b!1174100 (= c!116631 (= (select (arr!36590 _keys!1208) from!1455) k0!934))))

(declare-fun e!667375 () Bool)

(assert (=> b!1174100 e!667375))

(declare-fun res!779684 () Bool)

(assert (=> b!1174100 (=> (not res!779684) (not e!667375))))

(declare-fun lt!529374 () V!44507)

(declare-fun lt!529373 () ListLongMap!16915)

(declare-fun +!3791 (ListLongMap!16915 tuple2!18946) ListLongMap!16915)

(declare-fun get!18673 (ValueCell!14058 V!44507) V!44507)

(assert (=> b!1174100 (= res!779684 (= lt!529373 (+!3791 lt!529382 (tuple2!18947 (select (arr!36590 _keys!1208) from!1455) (get!18673 (select (arr!36591 _values!996) from!1455) lt!529374)))))))

(declare-fun b!1174101 () Bool)

(declare-fun res!779677 () Bool)

(declare-fun e!667374 () Bool)

(assert (=> b!1174101 (=> (not res!779677) (not e!667374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174101 (= res!779677 (validMask!0 mask!1564))))

(declare-fun b!1174102 () Bool)

(declare-fun e!667370 () Bool)

(declare-fun e!667377 () Bool)

(declare-fun mapRes!46130 () Bool)

(assert (=> b!1174102 (= e!667370 (and e!667377 mapRes!46130))))

(declare-fun condMapEmpty!46130 () Bool)

(declare-fun mapDefault!46130 () ValueCell!14058)

(assert (=> b!1174102 (= condMapEmpty!46130 (= (arr!36591 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14058)) mapDefault!46130)))))

(declare-fun b!1174103 () Bool)

(declare-fun e!667373 () Bool)

(declare-fun e!667368 () Bool)

(assert (=> b!1174103 (= e!667373 (not e!667368))))

(declare-fun res!779674 () Bool)

(assert (=> b!1174103 (=> res!779674 e!667368)))

(assert (=> b!1174103 (= res!779674 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174103 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529386 () Unit!38727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75881 (_ BitVec 64) (_ BitVec 32)) Unit!38727)

(assert (=> b!1174103 (= lt!529386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174104 () Bool)

(declare-fun res!779678 () Bool)

(assert (=> b!1174104 (=> (not res!779678) (not e!667374))))

(assert (=> b!1174104 (= res!779678 (= (select (arr!36590 _keys!1208) i!673) k0!934))))

(declare-fun b!1174105 () Bool)

(assert (=> b!1174105 (= e!667368 e!667372)))

(declare-fun res!779679 () Bool)

(assert (=> b!1174105 (=> res!779679 e!667372)))

(assert (=> b!1174105 (= res!779679 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1174105 (= lt!529373 (getCurrentListMapNoExtraKeys!4934 lt!529376 lt!529385 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174105 (= lt!529385 (array!75884 (store (arr!36591 _values!996) i!673 (ValueCellFull!14058 lt!529374)) (size!37127 _values!996)))))

(declare-fun dynLambda!2904 (Int (_ BitVec 64)) V!44507)

(assert (=> b!1174105 (= lt!529374 (dynLambda!2904 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529377 () ListLongMap!16915)

(assert (=> b!1174105 (= lt!529377 (getCurrentListMapNoExtraKeys!4934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174106 () Bool)

(declare-fun e!667376 () Bool)

(assert (=> b!1174106 (= e!667376 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174107 () Bool)

(declare-fun res!779680 () Bool)

(assert (=> b!1174107 (=> (not res!779680) (not e!667374))))

(assert (=> b!1174107 (= res!779680 (and (= (size!37127 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37126 _keys!1208) (size!37127 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174108 () Bool)

(declare-fun res!779682 () Bool)

(assert (=> b!1174108 (=> (not res!779682) (not e!667373))))

(declare-datatypes ((List!25686 0))(
  ( (Nil!25683) (Cons!25682 (h!26891 (_ BitVec 64)) (t!37683 List!25686)) )
))
(declare-fun arrayNoDuplicates!0 (array!75881 (_ BitVec 32) List!25686) Bool)

(assert (=> b!1174108 (= res!779682 (arrayNoDuplicates!0 lt!529376 #b00000000000000000000000000000000 Nil!25683))))

(declare-fun b!1174109 () Bool)

(declare-fun e!667371 () Bool)

(declare-fun tp_is_empty!29535 () Bool)

(assert (=> b!1174109 (= e!667371 tp_is_empty!29535)))

(declare-fun b!1174110 () Bool)

(assert (=> b!1174110 (= e!667377 tp_is_empty!29535)))

(declare-fun b!1174111 () Bool)

(assert (=> b!1174111 (= e!667374 e!667373)))

(declare-fun res!779683 () Bool)

(assert (=> b!1174111 (=> (not res!779683) (not e!667373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75881 (_ BitVec 32)) Bool)

(assert (=> b!1174111 (= res!779683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529376 mask!1564))))

(assert (=> b!1174111 (= lt!529376 (array!75882 (store (arr!36590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37126 _keys!1208)))))

(declare-fun b!1174112 () Bool)

(declare-fun Unit!38729 () Unit!38727)

(assert (=> b!1174112 (= e!667367 Unit!38729)))

(declare-fun lt!529383 () Unit!38727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75881 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38727)

(assert (=> b!1174112 (= lt!529383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174112 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529375 () Unit!38727)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75881 (_ BitVec 32) (_ BitVec 32)) Unit!38727)

(assert (=> b!1174112 (= lt!529375 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174112 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25683)))

(declare-fun lt!529380 () Unit!38727)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75881 (_ BitVec 64) (_ BitVec 32) List!25686) Unit!38727)

(assert (=> b!1174112 (= lt!529380 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25683))))

(assert (=> b!1174112 false))

(declare-fun mapIsEmpty!46130 () Bool)

(assert (=> mapIsEmpty!46130 mapRes!46130))

(declare-fun b!1174113 () Bool)

(declare-fun res!779676 () Bool)

(assert (=> b!1174113 (=> (not res!779676) (not e!667374))))

(assert (=> b!1174113 (= res!779676 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25683))))

(declare-fun res!779686 () Bool)

(assert (=> start!99426 (=> (not res!779686) (not e!667374))))

(assert (=> start!99426 (= res!779686 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37126 _keys!1208))))))

(assert (=> start!99426 e!667374))

(assert (=> start!99426 tp_is_empty!29535))

(declare-fun array_inv!27954 (array!75881) Bool)

(assert (=> start!99426 (array_inv!27954 _keys!1208)))

(assert (=> start!99426 true))

(assert (=> start!99426 tp!87729))

(declare-fun array_inv!27955 (array!75883) Bool)

(assert (=> start!99426 (and (array_inv!27955 _values!996) e!667370)))

(declare-fun b!1174114 () Bool)

(assert (=> b!1174114 (= e!667375 e!667376)))

(declare-fun res!779673 () Bool)

(assert (=> b!1174114 (=> res!779673 e!667376)))

(assert (=> b!1174114 (= res!779673 (not (= (select (arr!36590 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174115 () Bool)

(declare-fun res!779672 () Bool)

(assert (=> b!1174115 (=> (not res!779672) (not e!667374))))

(assert (=> b!1174115 (= res!779672 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37126 _keys!1208))))))

(declare-fun b!1174116 () Bool)

(declare-fun res!779675 () Bool)

(assert (=> b!1174116 (=> (not res!779675) (not e!667374))))

(assert (=> b!1174116 (= res!779675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46130 () Bool)

(declare-fun tp!87728 () Bool)

(assert (=> mapNonEmpty!46130 (= mapRes!46130 (and tp!87728 e!667371))))

(declare-fun mapRest!46130 () (Array (_ BitVec 32) ValueCell!14058))

(declare-fun mapKey!46130 () (_ BitVec 32))

(declare-fun mapValue!46130 () ValueCell!14058)

(assert (=> mapNonEmpty!46130 (= (arr!36591 _values!996) (store mapRest!46130 mapKey!46130 mapValue!46130))))

(declare-fun b!1174117 () Bool)

(declare-fun Unit!38730 () Unit!38727)

(assert (=> b!1174117 (= e!667367 Unit!38730)))

(declare-fun b!1174118 () Bool)

(declare-fun res!779685 () Bool)

(assert (=> b!1174118 (=> (not res!779685) (not e!667374))))

(assert (=> b!1174118 (= res!779685 (validKeyInArray!0 k0!934))))

(assert (= (and start!99426 res!779686) b!1174101))

(assert (= (and b!1174101 res!779677) b!1174107))

(assert (= (and b!1174107 res!779680) b!1174116))

(assert (= (and b!1174116 res!779675) b!1174113))

(assert (= (and b!1174113 res!779676) b!1174115))

(assert (= (and b!1174115 res!779672) b!1174118))

(assert (= (and b!1174118 res!779685) b!1174104))

(assert (= (and b!1174104 res!779678) b!1174111))

(assert (= (and b!1174111 res!779683) b!1174108))

(assert (= (and b!1174108 res!779682) b!1174103))

(assert (= (and b!1174103 (not res!779674)) b!1174105))

(assert (= (and b!1174105 (not res!779679)) b!1174099))

(assert (= (and b!1174099 (not res!779681)) b!1174100))

(assert (= (and b!1174100 res!779684) b!1174114))

(assert (= (and b!1174114 (not res!779673)) b!1174106))

(assert (= (and b!1174100 c!116631) b!1174112))

(assert (= (and b!1174100 (not c!116631)) b!1174117))

(assert (= (and b!1174102 condMapEmpty!46130) mapIsEmpty!46130))

(assert (= (and b!1174102 (not condMapEmpty!46130)) mapNonEmpty!46130))

(get-info :version)

(assert (= (and mapNonEmpty!46130 ((_ is ValueCellFull!14058) mapValue!46130)) b!1174109))

(assert (= (and b!1174102 ((_ is ValueCellFull!14058) mapDefault!46130)) b!1174110))

(assert (= start!99426 b!1174102))

(declare-fun b_lambda!20149 () Bool)

(assert (=> (not b_lambda!20149) (not b!1174105)))

(declare-fun t!37681 () Bool)

(declare-fun tb!9817 () Bool)

(assert (=> (and start!99426 (= defaultEntry!1004 defaultEntry!1004) t!37681) tb!9817))

(declare-fun result!20201 () Bool)

(assert (=> tb!9817 (= result!20201 tp_is_empty!29535)))

(assert (=> b!1174105 t!37681))

(declare-fun b_and!40879 () Bool)

(assert (= b_and!40877 (and (=> t!37681 result!20201) b_and!40879)))

(declare-fun m!1081963 () Bool)

(assert (=> b!1174101 m!1081963))

(declare-fun m!1081965 () Bool)

(assert (=> b!1174099 m!1081965))

(declare-fun m!1081967 () Bool)

(assert (=> b!1174099 m!1081967))

(declare-fun m!1081969 () Bool)

(assert (=> b!1174099 m!1081969))

(declare-fun m!1081971 () Bool)

(assert (=> b!1174099 m!1081971))

(declare-fun m!1081973 () Bool)

(assert (=> b!1174099 m!1081973))

(declare-fun m!1081975 () Bool)

(assert (=> b!1174099 m!1081975))

(assert (=> b!1174099 m!1081973))

(declare-fun m!1081977 () Bool)

(assert (=> start!99426 m!1081977))

(declare-fun m!1081979 () Bool)

(assert (=> start!99426 m!1081979))

(declare-fun m!1081981 () Bool)

(assert (=> b!1174105 m!1081981))

(declare-fun m!1081983 () Bool)

(assert (=> b!1174105 m!1081983))

(declare-fun m!1081985 () Bool)

(assert (=> b!1174105 m!1081985))

(declare-fun m!1081987 () Bool)

(assert (=> b!1174105 m!1081987))

(declare-fun m!1081989 () Bool)

(assert (=> b!1174113 m!1081989))

(declare-fun m!1081991 () Bool)

(assert (=> b!1174108 m!1081991))

(declare-fun m!1081993 () Bool)

(assert (=> b!1174104 m!1081993))

(declare-fun m!1081995 () Bool)

(assert (=> b!1174116 m!1081995))

(assert (=> b!1174100 m!1081973))

(declare-fun m!1081997 () Bool)

(assert (=> b!1174100 m!1081997))

(assert (=> b!1174100 m!1081997))

(declare-fun m!1081999 () Bool)

(assert (=> b!1174100 m!1081999))

(declare-fun m!1082001 () Bool)

(assert (=> b!1174100 m!1082001))

(declare-fun m!1082003 () Bool)

(assert (=> b!1174103 m!1082003))

(declare-fun m!1082005 () Bool)

(assert (=> b!1174103 m!1082005))

(assert (=> b!1174114 m!1081973))

(declare-fun m!1082007 () Bool)

(assert (=> b!1174118 m!1082007))

(declare-fun m!1082009 () Bool)

(assert (=> b!1174112 m!1082009))

(declare-fun m!1082011 () Bool)

(assert (=> b!1174112 m!1082011))

(declare-fun m!1082013 () Bool)

(assert (=> b!1174112 m!1082013))

(declare-fun m!1082015 () Bool)

(assert (=> b!1174112 m!1082015))

(declare-fun m!1082017 () Bool)

(assert (=> b!1174112 m!1082017))

(declare-fun m!1082019 () Bool)

(assert (=> mapNonEmpty!46130 m!1082019))

(declare-fun m!1082021 () Bool)

(assert (=> b!1174106 m!1082021))

(declare-fun m!1082023 () Bool)

(assert (=> b!1174111 m!1082023))

(declare-fun m!1082025 () Bool)

(assert (=> b!1174111 m!1082025))

(check-sat (not b!1174111) tp_is_empty!29535 (not b!1174099) (not b!1174103) (not b!1174106) (not b!1174113) (not b!1174105) (not b!1174112) b_and!40879 (not b!1174108) (not b!1174100) (not b!1174101) (not b_lambda!20149) (not start!99426) (not b!1174116) (not b!1174118) (not mapNonEmpty!46130) (not b_next!25005))
(check-sat b_and!40879 (not b_next!25005))
