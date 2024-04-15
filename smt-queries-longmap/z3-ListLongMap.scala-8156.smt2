; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99796 () Bool)

(assert start!99796)

(declare-fun b_free!25381 () Bool)

(declare-fun b_next!25381 () Bool)

(assert (=> start!99796 (= b_free!25381 (not b_next!25381))))

(declare-fun tp!88856 () Bool)

(declare-fun b_and!41607 () Bool)

(assert (=> start!99796 (= tp!88856 b_and!41607)))

(declare-fun b!1185973 () Bool)

(declare-fun e!674316 () Bool)

(declare-fun e!674317 () Bool)

(assert (=> b!1185973 (= e!674316 e!674317)))

(declare-fun res!788417 () Bool)

(assert (=> b!1185973 (=> res!788417 e!674317)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185973 (= res!788417 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45009 0))(
  ( (V!45010 (val!15012 Int)) )
))
(declare-fun zeroValue!944 () V!45009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14246 0))(
  ( (ValueCellFull!14246 (v!17649 V!45009)) (EmptyCell!14246) )
))
(declare-datatypes ((array!76556 0))(
  ( (array!76557 (arr!36928 (Array (_ BitVec 32) ValueCell!14246)) (size!37466 (_ BitVec 32))) )
))
(declare-fun lt!538426 () array!76556)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76558 0))(
  ( (array!76559 (arr!36929 (Array (_ BitVec 32) (_ BitVec 64))) (size!37467 (_ BitVec 32))) )
))
(declare-fun lt!538432 () array!76558)

(declare-fun minValue!944 () V!45009)

(declare-datatypes ((tuple2!19372 0))(
  ( (tuple2!19373 (_1!9697 (_ BitVec 64)) (_2!9697 V!45009)) )
))
(declare-datatypes ((List!26086 0))(
  ( (Nil!26083) (Cons!26082 (h!27291 tuple2!19372) (t!38450 List!26086)) )
))
(declare-datatypes ((ListLongMap!17341 0))(
  ( (ListLongMap!17342 (toList!8686 List!26086)) )
))
(declare-fun lt!538425 () ListLongMap!17341)

(declare-fun getCurrentListMapNoExtraKeys!5139 (array!76558 array!76556 (_ BitVec 32) (_ BitVec 32) V!45009 V!45009 (_ BitVec 32) Int) ListLongMap!17341)

(assert (=> b!1185973 (= lt!538425 (getCurrentListMapNoExtraKeys!5139 lt!538432 lt!538426 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538430 () V!45009)

(declare-fun _values!996 () array!76556)

(assert (=> b!1185973 (= lt!538426 (array!76557 (store (arr!36928 _values!996) i!673 (ValueCellFull!14246 lt!538430)) (size!37466 _values!996)))))

(declare-fun dynLambda!3040 (Int (_ BitVec 64)) V!45009)

(assert (=> b!1185973 (= lt!538430 (dynLambda!3040 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76558)

(declare-fun lt!538437 () ListLongMap!17341)

(assert (=> b!1185973 (= lt!538437 (getCurrentListMapNoExtraKeys!5139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185974 () Bool)

(declare-fun res!788408 () Bool)

(declare-fun e!674313 () Bool)

(assert (=> b!1185974 (=> (not res!788408) (not e!674313))))

(assert (=> b!1185974 (= res!788408 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37467 _keys!1208))))))

(declare-fun b!1185975 () Bool)

(declare-fun res!788414 () Bool)

(assert (=> b!1185975 (=> (not res!788414) (not e!674313))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1185975 (= res!788414 (= (select (arr!36929 _keys!1208) i!673) k0!934))))

(declare-fun b!1185976 () Bool)

(declare-fun e!674320 () Bool)

(assert (=> b!1185976 (= e!674317 e!674320)))

(declare-fun res!788410 () Bool)

(assert (=> b!1185976 (=> res!788410 e!674320)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185976 (= res!788410 (not (validKeyInArray!0 (select (arr!36929 _keys!1208) from!1455))))))

(declare-fun lt!538433 () ListLongMap!17341)

(declare-fun lt!538423 () ListLongMap!17341)

(assert (=> b!1185976 (= lt!538433 lt!538423)))

(declare-fun lt!538431 () ListLongMap!17341)

(declare-fun -!1638 (ListLongMap!17341 (_ BitVec 64)) ListLongMap!17341)

(assert (=> b!1185976 (= lt!538423 (-!1638 lt!538431 k0!934))))

(assert (=> b!1185976 (= lt!538433 (getCurrentListMapNoExtraKeys!5139 lt!538432 lt!538426 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185976 (= lt!538431 (getCurrentListMapNoExtraKeys!5139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39177 0))(
  ( (Unit!39178) )
))
(declare-fun lt!538435 () Unit!39177)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!895 (array!76558 array!76556 (_ BitVec 32) (_ BitVec 32) V!45009 V!45009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39177)

(assert (=> b!1185976 (= lt!538435 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!895 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185977 () Bool)

(declare-fun e!674312 () Bool)

(declare-fun tp_is_empty!29911 () Bool)

(assert (=> b!1185977 (= e!674312 tp_is_empty!29911)))

(declare-fun mapNonEmpty!46694 () Bool)

(declare-fun mapRes!46694 () Bool)

(declare-fun tp!88857 () Bool)

(assert (=> mapNonEmpty!46694 (= mapRes!46694 (and tp!88857 e!674312))))

(declare-fun mapValue!46694 () ValueCell!14246)

(declare-fun mapRest!46694 () (Array (_ BitVec 32) ValueCell!14246))

(declare-fun mapKey!46694 () (_ BitVec 32))

(assert (=> mapNonEmpty!46694 (= (arr!36928 _values!996) (store mapRest!46694 mapKey!46694 mapValue!46694))))

(declare-fun b!1185978 () Bool)

(declare-fun res!788419 () Bool)

(declare-fun e!674319 () Bool)

(assert (=> b!1185978 (=> (not res!788419) (not e!674319))))

(declare-datatypes ((List!26087 0))(
  ( (Nil!26084) (Cons!26083 (h!27292 (_ BitVec 64)) (t!38451 List!26087)) )
))
(declare-fun arrayNoDuplicates!0 (array!76558 (_ BitVec 32) List!26087) Bool)

(assert (=> b!1185978 (= res!788419 (arrayNoDuplicates!0 lt!538432 #b00000000000000000000000000000000 Nil!26084))))

(declare-fun b!1185979 () Bool)

(declare-fun e!674311 () Bool)

(declare-fun arrayContainsKey!0 (array!76558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185979 (= e!674311 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185980 () Bool)

(declare-fun e!674318 () Bool)

(assert (=> b!1185980 (= e!674318 e!674311)))

(declare-fun res!788420 () Bool)

(assert (=> b!1185980 (=> res!788420 e!674311)))

(assert (=> b!1185980 (= res!788420 (not (= (select (arr!36929 _keys!1208) from!1455) k0!934)))))

(declare-fun res!788416 () Bool)

(assert (=> start!99796 (=> (not res!788416) (not e!674313))))

(assert (=> start!99796 (= res!788416 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37467 _keys!1208))))))

(assert (=> start!99796 e!674313))

(assert (=> start!99796 tp_is_empty!29911))

(declare-fun array_inv!28294 (array!76558) Bool)

(assert (=> start!99796 (array_inv!28294 _keys!1208)))

(assert (=> start!99796 true))

(assert (=> start!99796 tp!88856))

(declare-fun e!674309 () Bool)

(declare-fun array_inv!28295 (array!76556) Bool)

(assert (=> start!99796 (and (array_inv!28295 _values!996) e!674309)))

(declare-fun b!1185981 () Bool)

(assert (=> b!1185981 (= e!674313 e!674319)))

(declare-fun res!788422 () Bool)

(assert (=> b!1185981 (=> (not res!788422) (not e!674319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76558 (_ BitVec 32)) Bool)

(assert (=> b!1185981 (= res!788422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538432 mask!1564))))

(assert (=> b!1185981 (= lt!538432 (array!76559 (store (arr!36929 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37467 _keys!1208)))))

(declare-fun b!1185982 () Bool)

(declare-fun e!674314 () Unit!39177)

(declare-fun Unit!39179 () Unit!39177)

(assert (=> b!1185982 (= e!674314 Unit!39179)))

(declare-fun b!1185983 () Bool)

(assert (=> b!1185983 (= e!674319 (not e!674316))))

(declare-fun res!788411 () Bool)

(assert (=> b!1185983 (=> res!788411 e!674316)))

(assert (=> b!1185983 (= res!788411 (bvsgt from!1455 i!673))))

(assert (=> b!1185983 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538420 () Unit!39177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76558 (_ BitVec 64) (_ BitVec 32)) Unit!39177)

(assert (=> b!1185983 (= lt!538420 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46694 () Bool)

(assert (=> mapIsEmpty!46694 mapRes!46694))

(declare-fun b!1185984 () Bool)

(declare-fun e!674315 () Bool)

(assert (=> b!1185984 (= e!674309 (and e!674315 mapRes!46694))))

(declare-fun condMapEmpty!46694 () Bool)

(declare-fun mapDefault!46694 () ValueCell!14246)

(assert (=> b!1185984 (= condMapEmpty!46694 (= (arr!36928 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14246)) mapDefault!46694)))))

(declare-fun b!1185985 () Bool)

(assert (=> b!1185985 (= e!674320 true)))

(declare-fun lt!538429 () ListLongMap!17341)

(declare-fun lt!538419 () ListLongMap!17341)

(assert (=> b!1185985 (= (-!1638 lt!538429 k0!934) lt!538419)))

(declare-fun lt!538436 () Unit!39177)

(declare-fun lt!538424 () V!45009)

(declare-fun addRemoveCommutativeForDiffKeys!181 (ListLongMap!17341 (_ BitVec 64) V!45009 (_ BitVec 64)) Unit!39177)

(assert (=> b!1185985 (= lt!538436 (addRemoveCommutativeForDiffKeys!181 lt!538431 (select (arr!36929 _keys!1208) from!1455) lt!538424 k0!934))))

(assert (=> b!1185985 (and (= lt!538437 lt!538429) (= lt!538423 lt!538433))))

(declare-fun lt!538427 () tuple2!19372)

(declare-fun +!3967 (ListLongMap!17341 tuple2!19372) ListLongMap!17341)

(assert (=> b!1185985 (= lt!538429 (+!3967 lt!538431 lt!538427))))

(assert (=> b!1185985 (not (= (select (arr!36929 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538422 () Unit!39177)

(assert (=> b!1185985 (= lt!538422 e!674314)))

(declare-fun c!117169 () Bool)

(assert (=> b!1185985 (= c!117169 (= (select (arr!36929 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185985 e!674318))

(declare-fun res!788413 () Bool)

(assert (=> b!1185985 (=> (not res!788413) (not e!674318))))

(assert (=> b!1185985 (= res!788413 (= lt!538425 lt!538419))))

(assert (=> b!1185985 (= lt!538419 (+!3967 lt!538423 lt!538427))))

(assert (=> b!1185985 (= lt!538427 (tuple2!19373 (select (arr!36929 _keys!1208) from!1455) lt!538424))))

(declare-fun get!18916 (ValueCell!14246 V!45009) V!45009)

(assert (=> b!1185985 (= lt!538424 (get!18916 (select (arr!36928 _values!996) from!1455) lt!538430))))

(declare-fun b!1185986 () Bool)

(declare-fun res!788421 () Bool)

(assert (=> b!1185986 (=> (not res!788421) (not e!674313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185986 (= res!788421 (validMask!0 mask!1564))))

(declare-fun b!1185987 () Bool)

(declare-fun res!788415 () Bool)

(assert (=> b!1185987 (=> (not res!788415) (not e!674313))))

(assert (=> b!1185987 (= res!788415 (validKeyInArray!0 k0!934))))

(declare-fun b!1185988 () Bool)

(declare-fun res!788418 () Bool)

(assert (=> b!1185988 (=> (not res!788418) (not e!674313))))

(assert (=> b!1185988 (= res!788418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185989 () Bool)

(declare-fun res!788412 () Bool)

(assert (=> b!1185989 (=> (not res!788412) (not e!674313))))

(assert (=> b!1185989 (= res!788412 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26084))))

(declare-fun b!1185990 () Bool)

(declare-fun Unit!39180 () Unit!39177)

(assert (=> b!1185990 (= e!674314 Unit!39180)))

(declare-fun lt!538434 () Unit!39177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76558 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39177)

(assert (=> b!1185990 (= lt!538434 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185990 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538428 () Unit!39177)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76558 (_ BitVec 32) (_ BitVec 32)) Unit!39177)

(assert (=> b!1185990 (= lt!538428 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185990 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26084)))

(declare-fun lt!538421 () Unit!39177)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76558 (_ BitVec 64) (_ BitVec 32) List!26087) Unit!39177)

(assert (=> b!1185990 (= lt!538421 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26084))))

(assert (=> b!1185990 false))

(declare-fun b!1185991 () Bool)

(declare-fun res!788409 () Bool)

(assert (=> b!1185991 (=> (not res!788409) (not e!674313))))

(assert (=> b!1185991 (= res!788409 (and (= (size!37466 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37467 _keys!1208) (size!37466 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185992 () Bool)

(assert (=> b!1185992 (= e!674315 tp_is_empty!29911)))

(assert (= (and start!99796 res!788416) b!1185986))

(assert (= (and b!1185986 res!788421) b!1185991))

(assert (= (and b!1185991 res!788409) b!1185988))

(assert (= (and b!1185988 res!788418) b!1185989))

(assert (= (and b!1185989 res!788412) b!1185974))

(assert (= (and b!1185974 res!788408) b!1185987))

(assert (= (and b!1185987 res!788415) b!1185975))

(assert (= (and b!1185975 res!788414) b!1185981))

(assert (= (and b!1185981 res!788422) b!1185978))

(assert (= (and b!1185978 res!788419) b!1185983))

(assert (= (and b!1185983 (not res!788411)) b!1185973))

(assert (= (and b!1185973 (not res!788417)) b!1185976))

(assert (= (and b!1185976 (not res!788410)) b!1185985))

(assert (= (and b!1185985 res!788413) b!1185980))

(assert (= (and b!1185980 (not res!788420)) b!1185979))

(assert (= (and b!1185985 c!117169) b!1185990))

(assert (= (and b!1185985 (not c!117169)) b!1185982))

(assert (= (and b!1185984 condMapEmpty!46694) mapIsEmpty!46694))

(assert (= (and b!1185984 (not condMapEmpty!46694)) mapNonEmpty!46694))

(get-info :version)

(assert (= (and mapNonEmpty!46694 ((_ is ValueCellFull!14246) mapValue!46694)) b!1185977))

(assert (= (and b!1185984 ((_ is ValueCellFull!14246) mapDefault!46694)) b!1185992))

(assert (= start!99796 b!1185984))

(declare-fun b_lambda!20507 () Bool)

(assert (=> (not b_lambda!20507) (not b!1185973)))

(declare-fun t!38449 () Bool)

(declare-fun tb!10185 () Bool)

(assert (=> (and start!99796 (= defaultEntry!1004 defaultEntry!1004) t!38449) tb!10185))

(declare-fun result!20945 () Bool)

(assert (=> tb!10185 (= result!20945 tp_is_empty!29911)))

(assert (=> b!1185973 t!38449))

(declare-fun b_and!41609 () Bool)

(assert (= b_and!41607 (and (=> t!38449 result!20945) b_and!41609)))

(declare-fun m!1093985 () Bool)

(assert (=> b!1185985 m!1093985))

(declare-fun m!1093987 () Bool)

(assert (=> b!1185985 m!1093987))

(declare-fun m!1093989 () Bool)

(assert (=> b!1185985 m!1093989))

(declare-fun m!1093991 () Bool)

(assert (=> b!1185985 m!1093991))

(declare-fun m!1093993 () Bool)

(assert (=> b!1185985 m!1093993))

(declare-fun m!1093995 () Bool)

(assert (=> b!1185985 m!1093995))

(assert (=> b!1185985 m!1093985))

(assert (=> b!1185985 m!1093989))

(declare-fun m!1093997 () Bool)

(assert (=> b!1185985 m!1093997))

(declare-fun m!1093999 () Bool)

(assert (=> b!1185989 m!1093999))

(declare-fun m!1094001 () Bool)

(assert (=> mapNonEmpty!46694 m!1094001))

(declare-fun m!1094003 () Bool)

(assert (=> b!1185973 m!1094003))

(declare-fun m!1094005 () Bool)

(assert (=> b!1185973 m!1094005))

(declare-fun m!1094007 () Bool)

(assert (=> b!1185973 m!1094007))

(declare-fun m!1094009 () Bool)

(assert (=> b!1185973 m!1094009))

(declare-fun m!1094011 () Bool)

(assert (=> b!1185987 m!1094011))

(declare-fun m!1094013 () Bool)

(assert (=> b!1185976 m!1094013))

(declare-fun m!1094015 () Bool)

(assert (=> b!1185976 m!1094015))

(declare-fun m!1094017 () Bool)

(assert (=> b!1185976 m!1094017))

(declare-fun m!1094019 () Bool)

(assert (=> b!1185976 m!1094019))

(assert (=> b!1185976 m!1093985))

(declare-fun m!1094021 () Bool)

(assert (=> b!1185976 m!1094021))

(assert (=> b!1185976 m!1093985))

(declare-fun m!1094023 () Bool)

(assert (=> start!99796 m!1094023))

(declare-fun m!1094025 () Bool)

(assert (=> start!99796 m!1094025))

(declare-fun m!1094027 () Bool)

(assert (=> b!1185978 m!1094027))

(declare-fun m!1094029 () Bool)

(assert (=> b!1185981 m!1094029))

(declare-fun m!1094031 () Bool)

(assert (=> b!1185981 m!1094031))

(assert (=> b!1185980 m!1093985))

(declare-fun m!1094033 () Bool)

(assert (=> b!1185988 m!1094033))

(declare-fun m!1094035 () Bool)

(assert (=> b!1185990 m!1094035))

(declare-fun m!1094037 () Bool)

(assert (=> b!1185990 m!1094037))

(declare-fun m!1094039 () Bool)

(assert (=> b!1185990 m!1094039))

(declare-fun m!1094041 () Bool)

(assert (=> b!1185990 m!1094041))

(declare-fun m!1094043 () Bool)

(assert (=> b!1185990 m!1094043))

(declare-fun m!1094045 () Bool)

(assert (=> b!1185983 m!1094045))

(declare-fun m!1094047 () Bool)

(assert (=> b!1185983 m!1094047))

(declare-fun m!1094049 () Bool)

(assert (=> b!1185986 m!1094049))

(declare-fun m!1094051 () Bool)

(assert (=> b!1185975 m!1094051))

(declare-fun m!1094053 () Bool)

(assert (=> b!1185979 m!1094053))

(check-sat (not b!1185983) (not b!1185986) (not b!1185987) (not b!1185973) (not b!1185981) (not b!1185979) b_and!41609 (not b_next!25381) (not b_lambda!20507) tp_is_empty!29911 (not b!1185988) (not mapNonEmpty!46694) (not b!1185978) (not b!1185990) (not start!99796) (not b!1185985) (not b!1185976) (not b!1185989))
(check-sat b_and!41609 (not b_next!25381))
