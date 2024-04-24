; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99780 () Bool)

(assert start!99780)

(declare-fun b_free!25123 () Bool)

(declare-fun b_next!25123 () Bool)

(assert (=> start!99780 (= b_free!25123 (not b_next!25123))))

(declare-fun tp!88083 () Bool)

(declare-fun b_and!41115 () Bool)

(assert (=> start!99780 (= tp!88083 b_and!41115)))

(declare-fun b!1179129 () Bool)

(declare-fun res!782924 () Bool)

(declare-fun e!670409 () Bool)

(assert (=> b!1179129 (=> (not res!782924) (not e!670409))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179129 (= res!782924 (validMask!0 mask!1564))))

(declare-fun res!782929 () Bool)

(assert (=> start!99780 (=> (not res!782929) (not e!670409))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76159 0))(
  ( (array!76160 (arr!36723 (Array (_ BitVec 32) (_ BitVec 64))) (size!37260 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76159)

(assert (=> start!99780 (= res!782929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37260 _keys!1208))))))

(assert (=> start!99780 e!670409))

(declare-fun tp_is_empty!29653 () Bool)

(assert (=> start!99780 tp_is_empty!29653))

(declare-fun array_inv!28118 (array!76159) Bool)

(assert (=> start!99780 (array_inv!28118 _keys!1208)))

(assert (=> start!99780 true))

(assert (=> start!99780 tp!88083))

(declare-datatypes ((V!44665 0))(
  ( (V!44666 (val!14883 Int)) )
))
(declare-datatypes ((ValueCell!14117 0))(
  ( (ValueCellFull!14117 (v!17517 V!44665)) (EmptyCell!14117) )
))
(declare-datatypes ((array!76161 0))(
  ( (array!76162 (arr!36724 (Array (_ BitVec 32) ValueCell!14117)) (size!37261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76161)

(declare-fun e!670418 () Bool)

(declare-fun array_inv!28119 (array!76161) Bool)

(assert (=> start!99780 (and (array_inv!28119 _values!996) e!670418)))

(declare-fun b!1179130 () Bool)

(declare-fun e!670410 () Bool)

(declare-fun e!670406 () Bool)

(assert (=> b!1179130 (= e!670410 (not e!670406))))

(declare-fun res!782931 () Bool)

(assert (=> b!1179130 (=> res!782931 e!670406)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179130 (= res!782931 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179130 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38895 0))(
  ( (Unit!38896) )
))
(declare-fun lt!532420 () Unit!38895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76159 (_ BitVec 64) (_ BitVec 32)) Unit!38895)

(assert (=> b!1179130 (= lt!532420 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179131 () Bool)

(declare-fun res!782923 () Bool)

(assert (=> b!1179131 (=> (not res!782923) (not e!670409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76159 (_ BitVec 32)) Bool)

(assert (=> b!1179131 (= res!782923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179132 () Bool)

(declare-fun e!670413 () Bool)

(assert (=> b!1179132 (= e!670406 e!670413)))

(declare-fun res!782925 () Bool)

(assert (=> b!1179132 (=> res!782925 e!670413)))

(assert (=> b!1179132 (= res!782925 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44665)

(declare-datatypes ((tuple2!19088 0))(
  ( (tuple2!19089 (_1!9555 (_ BitVec 64)) (_2!9555 V!44665)) )
))
(declare-datatypes ((List!25820 0))(
  ( (Nil!25817) (Cons!25816 (h!27034 tuple2!19088) (t!37927 List!25820)) )
))
(declare-datatypes ((ListLongMap!17065 0))(
  ( (ListLongMap!17066 (toList!8548 List!25820)) )
))
(declare-fun lt!532425 () ListLongMap!17065)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532418 () array!76159)

(declare-fun minValue!944 () V!44665)

(declare-fun lt!532424 () array!76161)

(declare-fun getCurrentListMapNoExtraKeys!5027 (array!76159 array!76161 (_ BitVec 32) (_ BitVec 32) V!44665 V!44665 (_ BitVec 32) Int) ListLongMap!17065)

(assert (=> b!1179132 (= lt!532425 (getCurrentListMapNoExtraKeys!5027 lt!532418 lt!532424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532423 () V!44665)

(assert (=> b!1179132 (= lt!532424 (array!76162 (store (arr!36724 _values!996) i!673 (ValueCellFull!14117 lt!532423)) (size!37261 _values!996)))))

(declare-fun dynLambda!2999 (Int (_ BitVec 64)) V!44665)

(assert (=> b!1179132 (= lt!532423 (dynLambda!2999 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532429 () ListLongMap!17065)

(assert (=> b!1179132 (= lt!532429 (getCurrentListMapNoExtraKeys!5027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179133 () Bool)

(declare-fun e!670407 () Bool)

(assert (=> b!1179133 (= e!670407 tp_is_empty!29653)))

(declare-fun b!1179134 () Bool)

(declare-fun e!670411 () Bool)

(assert (=> b!1179134 (= e!670411 true)))

(declare-fun e!670415 () Bool)

(assert (=> b!1179134 e!670415))

(declare-fun res!782922 () Bool)

(assert (=> b!1179134 (=> (not res!782922) (not e!670415))))

(assert (=> b!1179134 (= res!782922 (not (= (select (arr!36723 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532428 () Unit!38895)

(declare-fun e!670408 () Unit!38895)

(assert (=> b!1179134 (= lt!532428 e!670408)))

(declare-fun c!117206 () Bool)

(assert (=> b!1179134 (= c!117206 (= (select (arr!36723 _keys!1208) from!1455) k0!934))))

(declare-fun e!670416 () Bool)

(assert (=> b!1179134 e!670416))

(declare-fun res!782927 () Bool)

(assert (=> b!1179134 (=> (not res!782927) (not e!670416))))

(declare-fun lt!532426 () ListLongMap!17065)

(declare-fun lt!532422 () tuple2!19088)

(declare-fun +!3874 (ListLongMap!17065 tuple2!19088) ListLongMap!17065)

(assert (=> b!1179134 (= res!782927 (= lt!532425 (+!3874 lt!532426 lt!532422)))))

(declare-fun get!18798 (ValueCell!14117 V!44665) V!44665)

(assert (=> b!1179134 (= lt!532422 (tuple2!19089 (select (arr!36723 _keys!1208) from!1455) (get!18798 (select (arr!36724 _values!996) from!1455) lt!532423)))))

(declare-fun b!1179135 () Bool)

(declare-fun res!782928 () Bool)

(assert (=> b!1179135 (=> (not res!782928) (not e!670409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179135 (= res!782928 (validKeyInArray!0 k0!934))))

(declare-fun b!1179136 () Bool)

(declare-fun res!782933 () Bool)

(assert (=> b!1179136 (=> (not res!782933) (not e!670409))))

(assert (=> b!1179136 (= res!782933 (and (= (size!37261 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37260 _keys!1208) (size!37261 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179137 () Bool)

(declare-fun Unit!38897 () Unit!38895)

(assert (=> b!1179137 (= e!670408 Unit!38897)))

(declare-fun lt!532427 () Unit!38895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76159 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38895)

(assert (=> b!1179137 (= lt!532427 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179137 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532430 () Unit!38895)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76159 (_ BitVec 32) (_ BitVec 32)) Unit!38895)

(assert (=> b!1179137 (= lt!532430 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25821 0))(
  ( (Nil!25818) (Cons!25817 (h!27035 (_ BitVec 64)) (t!37928 List!25821)) )
))
(declare-fun arrayNoDuplicates!0 (array!76159 (_ BitVec 32) List!25821) Bool)

(assert (=> b!1179137 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25818)))

(declare-fun lt!532432 () Unit!38895)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76159 (_ BitVec 64) (_ BitVec 32) List!25821) Unit!38895)

(assert (=> b!1179137 (= lt!532432 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25818))))

(assert (=> b!1179137 false))

(declare-fun b!1179138 () Bool)

(declare-fun res!782919 () Bool)

(assert (=> b!1179138 (=> (not res!782919) (not e!670409))))

(assert (=> b!1179138 (= res!782919 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37260 _keys!1208))))))

(declare-fun b!1179139 () Bool)

(declare-fun res!782918 () Bool)

(assert (=> b!1179139 (=> (not res!782918) (not e!670409))))

(assert (=> b!1179139 (= res!782918 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25818))))

(declare-fun b!1179140 () Bool)

(declare-fun res!782921 () Bool)

(assert (=> b!1179140 (=> (not res!782921) (not e!670409))))

(assert (=> b!1179140 (= res!782921 (= (select (arr!36723 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46307 () Bool)

(declare-fun mapRes!46307 () Bool)

(declare-fun tp!88082 () Bool)

(assert (=> mapNonEmpty!46307 (= mapRes!46307 (and tp!88082 e!670407))))

(declare-fun mapValue!46307 () ValueCell!14117)

(declare-fun mapKey!46307 () (_ BitVec 32))

(declare-fun mapRest!46307 () (Array (_ BitVec 32) ValueCell!14117))

(assert (=> mapNonEmpty!46307 (= (arr!36724 _values!996) (store mapRest!46307 mapKey!46307 mapValue!46307))))

(declare-fun b!1179141 () Bool)

(assert (=> b!1179141 (= e!670409 e!670410)))

(declare-fun res!782932 () Bool)

(assert (=> b!1179141 (=> (not res!782932) (not e!670410))))

(assert (=> b!1179141 (= res!782932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532418 mask!1564))))

(assert (=> b!1179141 (= lt!532418 (array!76160 (store (arr!36723 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37260 _keys!1208)))))

(declare-fun b!1179142 () Bool)

(assert (=> b!1179142 (= e!670413 e!670411)))

(declare-fun res!782926 () Bool)

(assert (=> b!1179142 (=> res!782926 e!670411)))

(assert (=> b!1179142 (= res!782926 (not (validKeyInArray!0 (select (arr!36723 _keys!1208) from!1455))))))

(declare-fun lt!532431 () ListLongMap!17065)

(assert (=> b!1179142 (= lt!532431 lt!532426)))

(declare-fun lt!532419 () ListLongMap!17065)

(declare-fun -!1581 (ListLongMap!17065 (_ BitVec 64)) ListLongMap!17065)

(assert (=> b!1179142 (= lt!532426 (-!1581 lt!532419 k0!934))))

(assert (=> b!1179142 (= lt!532431 (getCurrentListMapNoExtraKeys!5027 lt!532418 lt!532424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179142 (= lt!532419 (getCurrentListMapNoExtraKeys!5027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532421 () Unit!38895)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!806 (array!76159 array!76161 (_ BitVec 32) (_ BitVec 32) V!44665 V!44665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38895)

(assert (=> b!1179142 (= lt!532421 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179143 () Bool)

(declare-fun e!670417 () Bool)

(assert (=> b!1179143 (= e!670418 (and e!670417 mapRes!46307))))

(declare-fun condMapEmpty!46307 () Bool)

(declare-fun mapDefault!46307 () ValueCell!14117)

(assert (=> b!1179143 (= condMapEmpty!46307 (= (arr!36724 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14117)) mapDefault!46307)))))

(declare-fun b!1179144 () Bool)

(declare-fun e!670412 () Bool)

(assert (=> b!1179144 (= e!670416 e!670412)))

(declare-fun res!782930 () Bool)

(assert (=> b!1179144 (=> res!782930 e!670412)))

(assert (=> b!1179144 (= res!782930 (not (= (select (arr!36723 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179145 () Bool)

(assert (=> b!1179145 (= e!670415 (= lt!532429 (+!3874 lt!532419 lt!532422)))))

(declare-fun b!1179146 () Bool)

(declare-fun res!782920 () Bool)

(assert (=> b!1179146 (=> (not res!782920) (not e!670410))))

(assert (=> b!1179146 (= res!782920 (arrayNoDuplicates!0 lt!532418 #b00000000000000000000000000000000 Nil!25818))))

(declare-fun b!1179147 () Bool)

(assert (=> b!1179147 (= e!670412 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46307 () Bool)

(assert (=> mapIsEmpty!46307 mapRes!46307))

(declare-fun b!1179148 () Bool)

(assert (=> b!1179148 (= e!670417 tp_is_empty!29653)))

(declare-fun b!1179149 () Bool)

(declare-fun Unit!38898 () Unit!38895)

(assert (=> b!1179149 (= e!670408 Unit!38898)))

(assert (= (and start!99780 res!782929) b!1179129))

(assert (= (and b!1179129 res!782924) b!1179136))

(assert (= (and b!1179136 res!782933) b!1179131))

(assert (= (and b!1179131 res!782923) b!1179139))

(assert (= (and b!1179139 res!782918) b!1179138))

(assert (= (and b!1179138 res!782919) b!1179135))

(assert (= (and b!1179135 res!782928) b!1179140))

(assert (= (and b!1179140 res!782921) b!1179141))

(assert (= (and b!1179141 res!782932) b!1179146))

(assert (= (and b!1179146 res!782920) b!1179130))

(assert (= (and b!1179130 (not res!782931)) b!1179132))

(assert (= (and b!1179132 (not res!782925)) b!1179142))

(assert (= (and b!1179142 (not res!782926)) b!1179134))

(assert (= (and b!1179134 res!782927) b!1179144))

(assert (= (and b!1179144 (not res!782930)) b!1179147))

(assert (= (and b!1179134 c!117206) b!1179137))

(assert (= (and b!1179134 (not c!117206)) b!1179149))

(assert (= (and b!1179134 res!782922) b!1179145))

(assert (= (and b!1179143 condMapEmpty!46307) mapIsEmpty!46307))

(assert (= (and b!1179143 (not condMapEmpty!46307)) mapNonEmpty!46307))

(get-info :version)

(assert (= (and mapNonEmpty!46307 ((_ is ValueCellFull!14117) mapValue!46307)) b!1179133))

(assert (= (and b!1179143 ((_ is ValueCellFull!14117) mapDefault!46307)) b!1179148))

(assert (= start!99780 b!1179143))

(declare-fun b_lambda!20261 () Bool)

(assert (=> (not b_lambda!20261) (not b!1179132)))

(declare-fun t!37926 () Bool)

(declare-fun tb!9927 () Bool)

(assert (=> (and start!99780 (= defaultEntry!1004 defaultEntry!1004) t!37926) tb!9927))

(declare-fun result!20429 () Bool)

(assert (=> tb!9927 (= result!20429 tp_is_empty!29653)))

(assert (=> b!1179132 t!37926))

(declare-fun b_and!41117 () Bool)

(assert (= b_and!41115 (and (=> t!37926 result!20429) b_and!41117)))

(declare-fun m!1087365 () Bool)

(assert (=> mapNonEmpty!46307 m!1087365))

(declare-fun m!1087367 () Bool)

(assert (=> b!1179146 m!1087367))

(declare-fun m!1087369 () Bool)

(assert (=> b!1179134 m!1087369))

(declare-fun m!1087371 () Bool)

(assert (=> b!1179134 m!1087371))

(declare-fun m!1087373 () Bool)

(assert (=> b!1179134 m!1087373))

(assert (=> b!1179134 m!1087373))

(declare-fun m!1087375 () Bool)

(assert (=> b!1179134 m!1087375))

(declare-fun m!1087377 () Bool)

(assert (=> b!1179131 m!1087377))

(declare-fun m!1087379 () Bool)

(assert (=> b!1179140 m!1087379))

(declare-fun m!1087381 () Bool)

(assert (=> b!1179145 m!1087381))

(declare-fun m!1087383 () Bool)

(assert (=> b!1179142 m!1087383))

(declare-fun m!1087385 () Bool)

(assert (=> b!1179142 m!1087385))

(declare-fun m!1087387 () Bool)

(assert (=> b!1179142 m!1087387))

(declare-fun m!1087389 () Bool)

(assert (=> b!1179142 m!1087389))

(assert (=> b!1179142 m!1087369))

(declare-fun m!1087391 () Bool)

(assert (=> b!1179142 m!1087391))

(assert (=> b!1179142 m!1087369))

(declare-fun m!1087393 () Bool)

(assert (=> b!1179137 m!1087393))

(declare-fun m!1087395 () Bool)

(assert (=> b!1179137 m!1087395))

(declare-fun m!1087397 () Bool)

(assert (=> b!1179137 m!1087397))

(declare-fun m!1087399 () Bool)

(assert (=> b!1179137 m!1087399))

(declare-fun m!1087401 () Bool)

(assert (=> b!1179137 m!1087401))

(declare-fun m!1087403 () Bool)

(assert (=> b!1179132 m!1087403))

(declare-fun m!1087405 () Bool)

(assert (=> b!1179132 m!1087405))

(declare-fun m!1087407 () Bool)

(assert (=> b!1179132 m!1087407))

(declare-fun m!1087409 () Bool)

(assert (=> b!1179132 m!1087409))

(declare-fun m!1087411 () Bool)

(assert (=> b!1179139 m!1087411))

(declare-fun m!1087413 () Bool)

(assert (=> b!1179135 m!1087413))

(declare-fun m!1087415 () Bool)

(assert (=> b!1179147 m!1087415))

(assert (=> b!1179144 m!1087369))

(declare-fun m!1087417 () Bool)

(assert (=> b!1179130 m!1087417))

(declare-fun m!1087419 () Bool)

(assert (=> b!1179130 m!1087419))

(declare-fun m!1087421 () Bool)

(assert (=> b!1179129 m!1087421))

(declare-fun m!1087423 () Bool)

(assert (=> b!1179141 m!1087423))

(declare-fun m!1087425 () Bool)

(assert (=> b!1179141 m!1087425))

(declare-fun m!1087427 () Bool)

(assert (=> start!99780 m!1087427))

(declare-fun m!1087429 () Bool)

(assert (=> start!99780 m!1087429))

(check-sat (not b!1179139) (not b!1179137) (not b!1179147) (not b_next!25123) (not b_lambda!20261) (not b!1179146) b_and!41117 (not b!1179129) tp_is_empty!29653 (not b!1179131) (not b!1179145) (not b!1179134) (not b!1179135) (not b!1179132) (not mapNonEmpty!46307) (not start!99780) (not b!1179142) (not b!1179141) (not b!1179130))
(check-sat b_and!41117 (not b_next!25123))
