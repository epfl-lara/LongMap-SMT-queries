; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99388 () Bool)

(assert start!99388)

(declare-fun b_free!24973 () Bool)

(declare-fun b_next!24973 () Bool)

(assert (=> start!99388 (= b_free!24973 (not b_next!24973))))

(declare-fun tp!87632 () Bool)

(declare-fun b_and!40791 () Bool)

(assert (=> start!99388 (= tp!87632 b_and!40791)))

(declare-fun b!1172983 () Bool)

(declare-fun e!666715 () Bool)

(declare-fun e!666713 () Bool)

(assert (=> b!1172983 (= e!666715 e!666713)))

(declare-fun res!778891 () Bool)

(assert (=> b!1172983 (=> res!778891 e!666713)))

(declare-datatypes ((array!75748 0))(
  ( (array!75749 (arr!36524 (Array (_ BitVec 32) (_ BitVec 64))) (size!37062 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75748)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172983 (= res!778891 (not (= (select (arr!36524 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172984 () Bool)

(declare-fun e!666723 () Bool)

(declare-fun tp_is_empty!29503 () Bool)

(assert (=> b!1172984 (= e!666723 tp_is_empty!29503)))

(declare-fun b!1172985 () Bool)

(declare-fun res!778887 () Bool)

(declare-fun e!666718 () Bool)

(assert (=> b!1172985 (=> (not res!778887) (not e!666718))))

(declare-fun lt!528514 () array!75748)

(declare-datatypes ((List!25731 0))(
  ( (Nil!25728) (Cons!25727 (h!26936 (_ BitVec 64)) (t!37687 List!25731)) )
))
(declare-fun arrayNoDuplicates!0 (array!75748 (_ BitVec 32) List!25731) Bool)

(assert (=> b!1172985 (= res!778887 (arrayNoDuplicates!0 lt!528514 #b00000000000000000000000000000000 Nil!25728))))

(declare-fun b!1172986 () Bool)

(declare-fun res!778890 () Bool)

(declare-fun e!666722 () Bool)

(assert (=> b!1172986 (=> (not res!778890) (not e!666722))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75748 (_ BitVec 32)) Bool)

(assert (=> b!1172986 (= res!778890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172987 () Bool)

(assert (=> b!1172987 (= e!666722 e!666718)))

(declare-fun res!778899 () Bool)

(assert (=> b!1172987 (=> (not res!778899) (not e!666718))))

(assert (=> b!1172987 (= res!778899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528514 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172987 (= lt!528514 (array!75749 (store (arr!36524 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37062 _keys!1208)))))

(declare-fun b!1172988 () Bool)

(declare-fun res!778896 () Bool)

(assert (=> b!1172988 (=> (not res!778896) (not e!666722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172988 (= res!778896 (validKeyInArray!0 k0!934))))

(declare-fun res!778889 () Bool)

(assert (=> start!99388 (=> (not res!778889) (not e!666722))))

(assert (=> start!99388 (= res!778889 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37062 _keys!1208))))))

(assert (=> start!99388 e!666722))

(assert (=> start!99388 tp_is_empty!29503))

(declare-fun array_inv!28008 (array!75748) Bool)

(assert (=> start!99388 (array_inv!28008 _keys!1208)))

(assert (=> start!99388 true))

(assert (=> start!99388 tp!87632))

(declare-datatypes ((V!44465 0))(
  ( (V!44466 (val!14808 Int)) )
))
(declare-datatypes ((ValueCell!14042 0))(
  ( (ValueCellFull!14042 (v!17445 V!44465)) (EmptyCell!14042) )
))
(declare-datatypes ((array!75750 0))(
  ( (array!75751 (arr!36525 (Array (_ BitVec 32) ValueCell!14042)) (size!37063 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75750)

(declare-fun e!666714 () Bool)

(declare-fun array_inv!28009 (array!75750) Bool)

(assert (=> start!99388 (and (array_inv!28009 _values!996) e!666714)))

(declare-fun b!1172989 () Bool)

(declare-fun res!778897 () Bool)

(assert (=> b!1172989 (=> (not res!778897) (not e!666722))))

(assert (=> b!1172989 (= res!778897 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25728))))

(declare-fun b!1172990 () Bool)

(declare-fun e!666719 () Bool)

(assert (=> b!1172990 (= e!666718 (not e!666719))))

(declare-fun res!778894 () Bool)

(assert (=> b!1172990 (=> res!778894 e!666719)))

(assert (=> b!1172990 (= res!778894 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172990 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38504 0))(
  ( (Unit!38505) )
))
(declare-fun lt!528522 () Unit!38504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75748 (_ BitVec 64) (_ BitVec 32)) Unit!38504)

(assert (=> b!1172990 (= lt!528522 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172991 () Bool)

(declare-fun e!666724 () Bool)

(assert (=> b!1172991 (= e!666719 e!666724)))

(declare-fun res!778898 () Bool)

(assert (=> b!1172991 (=> res!778898 e!666724)))

(assert (=> b!1172991 (= res!778898 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44465)

(declare-datatypes ((tuple2!19014 0))(
  ( (tuple2!19015 (_1!9518 (_ BitVec 64)) (_2!9518 V!44465)) )
))
(declare-datatypes ((List!25732 0))(
  ( (Nil!25729) (Cons!25728 (h!26937 tuple2!19014) (t!37688 List!25732)) )
))
(declare-datatypes ((ListLongMap!16983 0))(
  ( (ListLongMap!16984 (toList!8507 List!25732)) )
))
(declare-fun lt!528519 () ListLongMap!16983)

(declare-fun lt!528520 () array!75750)

(declare-fun zeroValue!944 () V!44465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4981 (array!75748 array!75750 (_ BitVec 32) (_ BitVec 32) V!44465 V!44465 (_ BitVec 32) Int) ListLongMap!16983)

(assert (=> b!1172991 (= lt!528519 (getCurrentListMapNoExtraKeys!4981 lt!528514 lt!528520 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528512 () V!44465)

(assert (=> b!1172991 (= lt!528520 (array!75751 (store (arr!36525 _values!996) i!673 (ValueCellFull!14042 lt!528512)) (size!37063 _values!996)))))

(declare-fun dynLambda!2905 (Int (_ BitVec 64)) V!44465)

(assert (=> b!1172991 (= lt!528512 (dynLambda!2905 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528511 () ListLongMap!16983)

(assert (=> b!1172991 (= lt!528511 (getCurrentListMapNoExtraKeys!4981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172992 () Bool)

(declare-fun res!778886 () Bool)

(assert (=> b!1172992 (=> (not res!778886) (not e!666722))))

(assert (=> b!1172992 (= res!778886 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37062 _keys!1208))))))

(declare-fun b!1172993 () Bool)

(declare-fun res!778895 () Bool)

(assert (=> b!1172993 (=> (not res!778895) (not e!666722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172993 (= res!778895 (validMask!0 mask!1564))))

(declare-fun b!1172994 () Bool)

(declare-fun res!778893 () Bool)

(assert (=> b!1172994 (=> (not res!778893) (not e!666722))))

(assert (=> b!1172994 (= res!778893 (= (select (arr!36524 _keys!1208) i!673) k0!934))))

(declare-fun b!1172995 () Bool)

(declare-fun e!666720 () Bool)

(assert (=> b!1172995 (= e!666720 true)))

(assert (=> b!1172995 (not (= (select (arr!36524 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528521 () Unit!38504)

(declare-fun e!666716 () Unit!38504)

(assert (=> b!1172995 (= lt!528521 e!666716)))

(declare-fun c!116557 () Bool)

(assert (=> b!1172995 (= c!116557 (= (select (arr!36524 _keys!1208) from!1455) k0!934))))

(assert (=> b!1172995 e!666715))

(declare-fun res!778892 () Bool)

(assert (=> b!1172995 (=> (not res!778892) (not e!666715))))

(declare-fun lt!528510 () ListLongMap!16983)

(declare-fun +!3822 (ListLongMap!16983 tuple2!19014) ListLongMap!16983)

(declare-fun get!18646 (ValueCell!14042 V!44465) V!44465)

(assert (=> b!1172995 (= res!778892 (= lt!528519 (+!3822 lt!528510 (tuple2!19015 (select (arr!36524 _keys!1208) from!1455) (get!18646 (select (arr!36525 _values!996) from!1455) lt!528512)))))))

(declare-fun mapNonEmpty!46082 () Bool)

(declare-fun mapRes!46082 () Bool)

(declare-fun tp!87633 () Bool)

(declare-fun e!666721 () Bool)

(assert (=> mapNonEmpty!46082 (= mapRes!46082 (and tp!87633 e!666721))))

(declare-fun mapRest!46082 () (Array (_ BitVec 32) ValueCell!14042))

(declare-fun mapValue!46082 () ValueCell!14042)

(declare-fun mapKey!46082 () (_ BitVec 32))

(assert (=> mapNonEmpty!46082 (= (arr!36525 _values!996) (store mapRest!46082 mapKey!46082 mapValue!46082))))

(declare-fun b!1172996 () Bool)

(declare-fun Unit!38506 () Unit!38504)

(assert (=> b!1172996 (= e!666716 Unit!38506)))

(declare-fun lt!528517 () Unit!38504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38504)

(assert (=> b!1172996 (= lt!528517 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1172996 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528518 () Unit!38504)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75748 (_ BitVec 32) (_ BitVec 32)) Unit!38504)

(assert (=> b!1172996 (= lt!528518 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172996 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25728)))

(declare-fun lt!528516 () Unit!38504)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75748 (_ BitVec 64) (_ BitVec 32) List!25731) Unit!38504)

(assert (=> b!1172996 (= lt!528516 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25728))))

(assert (=> b!1172996 false))

(declare-fun b!1172997 () Bool)

(assert (=> b!1172997 (= e!666724 e!666720)))

(declare-fun res!778888 () Bool)

(assert (=> b!1172997 (=> res!778888 e!666720)))

(assert (=> b!1172997 (= res!778888 (not (validKeyInArray!0 (select (arr!36524 _keys!1208) from!1455))))))

(declare-fun lt!528513 () ListLongMap!16983)

(assert (=> b!1172997 (= lt!528513 lt!528510)))

(declare-fun lt!528515 () ListLongMap!16983)

(declare-fun -!1496 (ListLongMap!16983 (_ BitVec 64)) ListLongMap!16983)

(assert (=> b!1172997 (= lt!528510 (-!1496 lt!528515 k0!934))))

(assert (=> b!1172997 (= lt!528513 (getCurrentListMapNoExtraKeys!4981 lt!528514 lt!528520 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172997 (= lt!528515 (getCurrentListMapNoExtraKeys!4981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528509 () Unit!38504)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!760 (array!75748 array!75750 (_ BitVec 32) (_ BitVec 32) V!44465 V!44465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38504)

(assert (=> b!1172997 (= lt!528509 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!760 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172998 () Bool)

(assert (=> b!1172998 (= e!666714 (and e!666723 mapRes!46082))))

(declare-fun condMapEmpty!46082 () Bool)

(declare-fun mapDefault!46082 () ValueCell!14042)

(assert (=> b!1172998 (= condMapEmpty!46082 (= (arr!36525 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14042)) mapDefault!46082)))))

(declare-fun b!1172999 () Bool)

(assert (=> b!1172999 (= e!666721 tp_is_empty!29503)))

(declare-fun mapIsEmpty!46082 () Bool)

(assert (=> mapIsEmpty!46082 mapRes!46082))

(declare-fun b!1173000 () Bool)

(declare-fun Unit!38507 () Unit!38504)

(assert (=> b!1173000 (= e!666716 Unit!38507)))

(declare-fun b!1173001 () Bool)

(declare-fun res!778900 () Bool)

(assert (=> b!1173001 (=> (not res!778900) (not e!666722))))

(assert (=> b!1173001 (= res!778900 (and (= (size!37063 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37062 _keys!1208) (size!37063 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173002 () Bool)

(assert (=> b!1173002 (= e!666713 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99388 res!778889) b!1172993))

(assert (= (and b!1172993 res!778895) b!1173001))

(assert (= (and b!1173001 res!778900) b!1172986))

(assert (= (and b!1172986 res!778890) b!1172989))

(assert (= (and b!1172989 res!778897) b!1172992))

(assert (= (and b!1172992 res!778886) b!1172988))

(assert (= (and b!1172988 res!778896) b!1172994))

(assert (= (and b!1172994 res!778893) b!1172987))

(assert (= (and b!1172987 res!778899) b!1172985))

(assert (= (and b!1172985 res!778887) b!1172990))

(assert (= (and b!1172990 (not res!778894)) b!1172991))

(assert (= (and b!1172991 (not res!778898)) b!1172997))

(assert (= (and b!1172997 (not res!778888)) b!1172995))

(assert (= (and b!1172995 res!778892) b!1172983))

(assert (= (and b!1172983 (not res!778891)) b!1173002))

(assert (= (and b!1172995 c!116557) b!1172996))

(assert (= (and b!1172995 (not c!116557)) b!1173000))

(assert (= (and b!1172998 condMapEmpty!46082) mapIsEmpty!46082))

(assert (= (and b!1172998 (not condMapEmpty!46082)) mapNonEmpty!46082))

(get-info :version)

(assert (= (and mapNonEmpty!46082 ((_ is ValueCellFull!14042) mapValue!46082)) b!1172999))

(assert (= (and b!1172998 ((_ is ValueCellFull!14042) mapDefault!46082)) b!1172984))

(assert (= start!99388 b!1172998))

(declare-fun b_lambda!20099 () Bool)

(assert (=> (not b_lambda!20099) (not b!1172991)))

(declare-fun t!37686 () Bool)

(declare-fun tb!9777 () Bool)

(assert (=> (and start!99388 (= defaultEntry!1004 defaultEntry!1004) t!37686) tb!9777))

(declare-fun result!20129 () Bool)

(assert (=> tb!9777 (= result!20129 tp_is_empty!29503)))

(assert (=> b!1172991 t!37686))

(declare-fun b_and!40793 () Bool)

(assert (= b_and!40791 (and (=> t!37686 result!20129) b_and!40793)))

(declare-fun m!1080329 () Bool)

(assert (=> b!1172987 m!1080329))

(declare-fun m!1080331 () Bool)

(assert (=> b!1172987 m!1080331))

(declare-fun m!1080333 () Bool)

(assert (=> b!1172994 m!1080333))

(declare-fun m!1080335 () Bool)

(assert (=> b!1172990 m!1080335))

(declare-fun m!1080337 () Bool)

(assert (=> b!1172990 m!1080337))

(declare-fun m!1080339 () Bool)

(assert (=> b!1173002 m!1080339))

(declare-fun m!1080341 () Bool)

(assert (=> b!1172993 m!1080341))

(declare-fun m!1080343 () Bool)

(assert (=> b!1172988 m!1080343))

(declare-fun m!1080345 () Bool)

(assert (=> b!1172989 m!1080345))

(declare-fun m!1080347 () Bool)

(assert (=> b!1172983 m!1080347))

(declare-fun m!1080349 () Bool)

(assert (=> b!1172997 m!1080349))

(declare-fun m!1080351 () Bool)

(assert (=> b!1172997 m!1080351))

(assert (=> b!1172997 m!1080347))

(declare-fun m!1080353 () Bool)

(assert (=> b!1172997 m!1080353))

(assert (=> b!1172997 m!1080347))

(declare-fun m!1080355 () Bool)

(assert (=> b!1172997 m!1080355))

(declare-fun m!1080357 () Bool)

(assert (=> b!1172997 m!1080357))

(declare-fun m!1080359 () Bool)

(assert (=> b!1172985 m!1080359))

(declare-fun m!1080361 () Bool)

(assert (=> b!1172991 m!1080361))

(declare-fun m!1080363 () Bool)

(assert (=> b!1172991 m!1080363))

(declare-fun m!1080365 () Bool)

(assert (=> b!1172991 m!1080365))

(declare-fun m!1080367 () Bool)

(assert (=> b!1172991 m!1080367))

(declare-fun m!1080369 () Bool)

(assert (=> b!1172996 m!1080369))

(declare-fun m!1080371 () Bool)

(assert (=> b!1172996 m!1080371))

(declare-fun m!1080373 () Bool)

(assert (=> b!1172996 m!1080373))

(declare-fun m!1080375 () Bool)

(assert (=> b!1172996 m!1080375))

(declare-fun m!1080377 () Bool)

(assert (=> b!1172996 m!1080377))

(declare-fun m!1080379 () Bool)

(assert (=> mapNonEmpty!46082 m!1080379))

(declare-fun m!1080381 () Bool)

(assert (=> start!99388 m!1080381))

(declare-fun m!1080383 () Bool)

(assert (=> start!99388 m!1080383))

(declare-fun m!1080385 () Bool)

(assert (=> b!1172986 m!1080385))

(assert (=> b!1172995 m!1080347))

(declare-fun m!1080387 () Bool)

(assert (=> b!1172995 m!1080387))

(assert (=> b!1172995 m!1080387))

(declare-fun m!1080389 () Bool)

(assert (=> b!1172995 m!1080389))

(declare-fun m!1080391 () Bool)

(assert (=> b!1172995 m!1080391))

(check-sat (not b!1172987) (not b!1172991) (not b_next!24973) (not b!1172990) (not b!1172996) (not b!1172989) (not b!1172997) (not start!99388) (not b!1172986) (not b!1172988) (not mapNonEmpty!46082) (not b!1173002) (not b_lambda!20099) (not b!1172985) b_and!40793 (not b!1172995) (not b!1172993) tp_is_empty!29503)
(check-sat b_and!40793 (not b_next!24973))
