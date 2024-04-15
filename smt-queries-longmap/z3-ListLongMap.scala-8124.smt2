; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99604 () Bool)

(assert start!99604)

(declare-fun b_free!25189 () Bool)

(declare-fun b_next!25189 () Bool)

(assert (=> start!99604 (= b_free!25189 (not b_next!25189))))

(declare-fun tp!88280 () Bool)

(declare-fun b_and!41223 () Bool)

(assert (=> start!99604 (= tp!88280 b_and!41223)))

(declare-fun b!1179881 () Bool)

(declare-fun res!783963 () Bool)

(declare-fun e!670794 () Bool)

(assert (=> b!1179881 (=> (not res!783963) (not e!670794))))

(declare-datatypes ((array!76176 0))(
  ( (array!76177 (arr!36738 (Array (_ BitVec 32) (_ BitVec 64))) (size!37276 (_ BitVec 32))) )
))
(declare-fun lt!533230 () array!76176)

(declare-datatypes ((List!25916 0))(
  ( (Nil!25913) (Cons!25912 (h!27121 (_ BitVec 64)) (t!38088 List!25916)) )
))
(declare-fun arrayNoDuplicates!0 (array!76176 (_ BitVec 32) List!25916) Bool)

(assert (=> b!1179881 (= res!783963 (arrayNoDuplicates!0 lt!533230 #b00000000000000000000000000000000 Nil!25913))))

(declare-fun b!1179882 () Bool)

(declare-fun e!670785 () Bool)

(declare-fun e!670784 () Bool)

(assert (=> b!1179882 (= e!670785 e!670784)))

(declare-fun res!783959 () Bool)

(assert (=> b!1179882 (=> res!783959 e!670784)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179882 (= res!783959 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44753 0))(
  ( (V!44754 (val!14916 Int)) )
))
(declare-fun zeroValue!944 () V!44753)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14150 0))(
  ( (ValueCellFull!14150 (v!17553 V!44753)) (EmptyCell!14150) )
))
(declare-datatypes ((array!76178 0))(
  ( (array!76179 (arr!36739 (Array (_ BitVec 32) ValueCell!14150)) (size!37277 (_ BitVec 32))) )
))
(declare-fun lt!533227 () array!76178)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19208 0))(
  ( (tuple2!19209 (_1!9615 (_ BitVec 64)) (_2!9615 V!44753)) )
))
(declare-datatypes ((List!25917 0))(
  ( (Nil!25914) (Cons!25913 (h!27122 tuple2!19208) (t!38089 List!25917)) )
))
(declare-datatypes ((ListLongMap!17177 0))(
  ( (ListLongMap!17178 (toList!8604 List!25917)) )
))
(declare-fun lt!533235 () ListLongMap!17177)

(declare-fun minValue!944 () V!44753)

(declare-fun getCurrentListMapNoExtraKeys!5062 (array!76176 array!76178 (_ BitVec 32) (_ BitVec 32) V!44753 V!44753 (_ BitVec 32) Int) ListLongMap!17177)

(assert (=> b!1179882 (= lt!533235 (getCurrentListMapNoExtraKeys!5062 lt!533230 lt!533227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533239 () V!44753)

(declare-fun _values!996 () array!76178)

(assert (=> b!1179882 (= lt!533227 (array!76179 (store (arr!36739 _values!996) i!673 (ValueCellFull!14150 lt!533239)) (size!37277 _values!996)))))

(declare-fun dynLambda!2974 (Int (_ BitVec 64)) V!44753)

(assert (=> b!1179882 (= lt!533239 (dynLambda!2974 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76176)

(declare-fun lt!533236 () ListLongMap!17177)

(assert (=> b!1179882 (= lt!533236 (getCurrentListMapNoExtraKeys!5062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179883 () Bool)

(declare-fun e!670783 () Bool)

(declare-fun tp_is_empty!29719 () Bool)

(assert (=> b!1179883 (= e!670783 tp_is_empty!29719)))

(declare-fun b!1179884 () Bool)

(declare-fun e!670787 () Bool)

(assert (=> b!1179884 (= e!670784 e!670787)))

(declare-fun res!783951 () Bool)

(assert (=> b!1179884 (=> res!783951 e!670787)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179884 (= res!783951 (not (validKeyInArray!0 (select (arr!36738 _keys!1208) from!1455))))))

(declare-fun lt!533232 () ListLongMap!17177)

(declare-fun lt!533231 () ListLongMap!17177)

(assert (=> b!1179884 (= lt!533232 lt!533231)))

(declare-fun lt!533238 () ListLongMap!17177)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1568 (ListLongMap!17177 (_ BitVec 64)) ListLongMap!17177)

(assert (=> b!1179884 (= lt!533231 (-!1568 lt!533238 k0!934))))

(assert (=> b!1179884 (= lt!533232 (getCurrentListMapNoExtraKeys!5062 lt!533230 lt!533227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179884 (= lt!533238 (getCurrentListMapNoExtraKeys!5062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38848 0))(
  ( (Unit!38849) )
))
(declare-fun lt!533234 () Unit!38848)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!832 (array!76176 array!76178 (_ BitVec 32) (_ BitVec 32) V!44753 V!44753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38848)

(assert (=> b!1179884 (= lt!533234 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179885 () Bool)

(assert (=> b!1179885 (= e!670794 (not e!670785))))

(declare-fun res!783962 () Bool)

(assert (=> b!1179885 (=> res!783962 e!670785)))

(assert (=> b!1179885 (= res!783962 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179885 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533233 () Unit!38848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76176 (_ BitVec 64) (_ BitVec 32)) Unit!38848)

(assert (=> b!1179885 (= lt!533233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179886 () Bool)

(declare-fun e!670790 () Unit!38848)

(declare-fun Unit!38850 () Unit!38848)

(assert (=> b!1179886 (= e!670790 Unit!38850)))

(declare-fun b!1179887 () Bool)

(declare-fun e!670789 () Bool)

(declare-fun e!670795 () Bool)

(assert (=> b!1179887 (= e!670789 e!670795)))

(declare-fun res!783956 () Bool)

(assert (=> b!1179887 (=> res!783956 e!670795)))

(assert (=> b!1179887 (= res!783956 (not (= (select (arr!36738 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179888 () Bool)

(declare-fun res!783952 () Bool)

(declare-fun e!670791 () Bool)

(assert (=> b!1179888 (=> (not res!783952) (not e!670791))))

(assert (=> b!1179888 (= res!783952 (= (select (arr!36738 _keys!1208) i!673) k0!934))))

(declare-fun b!1179889 () Bool)

(declare-fun e!670786 () Bool)

(assert (=> b!1179889 (= e!670786 (= lt!533231 lt!533232))))

(declare-fun mapNonEmpty!46406 () Bool)

(declare-fun mapRes!46406 () Bool)

(declare-fun tp!88281 () Bool)

(declare-fun e!670793 () Bool)

(assert (=> mapNonEmpty!46406 (= mapRes!46406 (and tp!88281 e!670793))))

(declare-fun mapValue!46406 () ValueCell!14150)

(declare-fun mapRest!46406 () (Array (_ BitVec 32) ValueCell!14150))

(declare-fun mapKey!46406 () (_ BitVec 32))

(assert (=> mapNonEmpty!46406 (= (arr!36739 _values!996) (store mapRest!46406 mapKey!46406 mapValue!46406))))

(declare-fun res!783960 () Bool)

(assert (=> start!99604 (=> (not res!783960) (not e!670791))))

(assert (=> start!99604 (= res!783960 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37276 _keys!1208))))))

(assert (=> start!99604 e!670791))

(assert (=> start!99604 tp_is_empty!29719))

(declare-fun array_inv!28162 (array!76176) Bool)

(assert (=> start!99604 (array_inv!28162 _keys!1208)))

(assert (=> start!99604 true))

(assert (=> start!99604 tp!88280))

(declare-fun e!670788 () Bool)

(declare-fun array_inv!28163 (array!76178) Bool)

(assert (=> start!99604 (and (array_inv!28163 _values!996) e!670788)))

(declare-fun b!1179890 () Bool)

(assert (=> b!1179890 (= e!670795 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179891 () Bool)

(declare-fun res!783957 () Bool)

(assert (=> b!1179891 (=> (not res!783957) (not e!670791))))

(assert (=> b!1179891 (= res!783957 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46406 () Bool)

(assert (=> mapIsEmpty!46406 mapRes!46406))

(declare-fun b!1179892 () Bool)

(declare-fun res!783954 () Bool)

(assert (=> b!1179892 (=> (not res!783954) (not e!670791))))

(assert (=> b!1179892 (= res!783954 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25913))))

(declare-fun b!1179893 () Bool)

(declare-fun res!783949 () Bool)

(assert (=> b!1179893 (=> (not res!783949) (not e!670791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76176 (_ BitVec 32)) Bool)

(assert (=> b!1179893 (= res!783949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179894 () Bool)

(declare-fun res!783955 () Bool)

(assert (=> b!1179894 (=> (not res!783955) (not e!670786))))

(declare-fun lt!533229 () tuple2!19208)

(declare-fun +!3903 (ListLongMap!17177 tuple2!19208) ListLongMap!17177)

(assert (=> b!1179894 (= res!783955 (= lt!533236 (+!3903 lt!533238 lt!533229)))))

(declare-fun b!1179895 () Bool)

(assert (=> b!1179895 (= e!670787 true)))

(assert (=> b!1179895 e!670786))

(declare-fun res!783961 () Bool)

(assert (=> b!1179895 (=> (not res!783961) (not e!670786))))

(assert (=> b!1179895 (= res!783961 (not (= (select (arr!36738 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533237 () Unit!38848)

(assert (=> b!1179895 (= lt!533237 e!670790)))

(declare-fun c!116881 () Bool)

(assert (=> b!1179895 (= c!116881 (= (select (arr!36738 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179895 e!670789))

(declare-fun res!783953 () Bool)

(assert (=> b!1179895 (=> (not res!783953) (not e!670789))))

(assert (=> b!1179895 (= res!783953 (= lt!533235 (+!3903 lt!533231 lt!533229)))))

(declare-fun get!18790 (ValueCell!14150 V!44753) V!44753)

(assert (=> b!1179895 (= lt!533229 (tuple2!19209 (select (arr!36738 _keys!1208) from!1455) (get!18790 (select (arr!36739 _values!996) from!1455) lt!533239)))))

(declare-fun b!1179896 () Bool)

(assert (=> b!1179896 (= e!670788 (and e!670783 mapRes!46406))))

(declare-fun condMapEmpty!46406 () Bool)

(declare-fun mapDefault!46406 () ValueCell!14150)

(assert (=> b!1179896 (= condMapEmpty!46406 (= (arr!36739 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14150)) mapDefault!46406)))))

(declare-fun b!1179897 () Bool)

(declare-fun Unit!38851 () Unit!38848)

(assert (=> b!1179897 (= e!670790 Unit!38851)))

(declare-fun lt!533228 () Unit!38848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38848)

(assert (=> b!1179897 (= lt!533228 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179897 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533240 () Unit!38848)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76176 (_ BitVec 32) (_ BitVec 32)) Unit!38848)

(assert (=> b!1179897 (= lt!533240 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179897 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25913)))

(declare-fun lt!533241 () Unit!38848)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76176 (_ BitVec 64) (_ BitVec 32) List!25916) Unit!38848)

(assert (=> b!1179897 (= lt!533241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25913))))

(assert (=> b!1179897 false))

(declare-fun b!1179898 () Bool)

(declare-fun res!783950 () Bool)

(assert (=> b!1179898 (=> (not res!783950) (not e!670791))))

(assert (=> b!1179898 (= res!783950 (and (= (size!37277 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37276 _keys!1208) (size!37277 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179899 () Bool)

(declare-fun res!783958 () Bool)

(assert (=> b!1179899 (=> (not res!783958) (not e!670791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179899 (= res!783958 (validMask!0 mask!1564))))

(declare-fun b!1179900 () Bool)

(assert (=> b!1179900 (= e!670791 e!670794)))

(declare-fun res!783948 () Bool)

(assert (=> b!1179900 (=> (not res!783948) (not e!670794))))

(assert (=> b!1179900 (= res!783948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533230 mask!1564))))

(assert (=> b!1179900 (= lt!533230 (array!76177 (store (arr!36738 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37276 _keys!1208)))))

(declare-fun b!1179901 () Bool)

(declare-fun res!783964 () Bool)

(assert (=> b!1179901 (=> (not res!783964) (not e!670791))))

(assert (=> b!1179901 (= res!783964 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37276 _keys!1208))))))

(declare-fun b!1179902 () Bool)

(assert (=> b!1179902 (= e!670793 tp_is_empty!29719)))

(assert (= (and start!99604 res!783960) b!1179899))

(assert (= (and b!1179899 res!783958) b!1179898))

(assert (= (and b!1179898 res!783950) b!1179893))

(assert (= (and b!1179893 res!783949) b!1179892))

(assert (= (and b!1179892 res!783954) b!1179901))

(assert (= (and b!1179901 res!783964) b!1179891))

(assert (= (and b!1179891 res!783957) b!1179888))

(assert (= (and b!1179888 res!783952) b!1179900))

(assert (= (and b!1179900 res!783948) b!1179881))

(assert (= (and b!1179881 res!783963) b!1179885))

(assert (= (and b!1179885 (not res!783962)) b!1179882))

(assert (= (and b!1179882 (not res!783959)) b!1179884))

(assert (= (and b!1179884 (not res!783951)) b!1179895))

(assert (= (and b!1179895 res!783953) b!1179887))

(assert (= (and b!1179887 (not res!783956)) b!1179890))

(assert (= (and b!1179895 c!116881) b!1179897))

(assert (= (and b!1179895 (not c!116881)) b!1179886))

(assert (= (and b!1179895 res!783961) b!1179894))

(assert (= (and b!1179894 res!783955) b!1179889))

(assert (= (and b!1179896 condMapEmpty!46406) mapIsEmpty!46406))

(assert (= (and b!1179896 (not condMapEmpty!46406)) mapNonEmpty!46406))

(get-info :version)

(assert (= (and mapNonEmpty!46406 ((_ is ValueCellFull!14150) mapValue!46406)) b!1179902))

(assert (= (and b!1179896 ((_ is ValueCellFull!14150) mapDefault!46406)) b!1179883))

(assert (= start!99604 b!1179896))

(declare-fun b_lambda!20315 () Bool)

(assert (=> (not b_lambda!20315) (not b!1179882)))

(declare-fun t!38087 () Bool)

(declare-fun tb!9993 () Bool)

(assert (=> (and start!99604 (= defaultEntry!1004 defaultEntry!1004) t!38087) tb!9993))

(declare-fun result!20561 () Bool)

(assert (=> tb!9993 (= result!20561 tp_is_empty!29719)))

(assert (=> b!1179882 t!38087))

(declare-fun b_and!41225 () Bool)

(assert (= b_and!41223 (and (=> t!38087 result!20561) b_and!41225)))

(declare-fun m!1087361 () Bool)

(assert (=> b!1179885 m!1087361))

(declare-fun m!1087363 () Bool)

(assert (=> b!1179885 m!1087363))

(declare-fun m!1087365 () Bool)

(assert (=> b!1179884 m!1087365))

(declare-fun m!1087367 () Bool)

(assert (=> b!1179884 m!1087367))

(declare-fun m!1087369 () Bool)

(assert (=> b!1179884 m!1087369))

(declare-fun m!1087371 () Bool)

(assert (=> b!1179884 m!1087371))

(declare-fun m!1087373 () Bool)

(assert (=> b!1179884 m!1087373))

(declare-fun m!1087375 () Bool)

(assert (=> b!1179884 m!1087375))

(assert (=> b!1179884 m!1087373))

(declare-fun m!1087377 () Bool)

(assert (=> b!1179894 m!1087377))

(declare-fun m!1087379 () Bool)

(assert (=> start!99604 m!1087379))

(declare-fun m!1087381 () Bool)

(assert (=> start!99604 m!1087381))

(declare-fun m!1087383 () Bool)

(assert (=> b!1179881 m!1087383))

(declare-fun m!1087385 () Bool)

(assert (=> b!1179882 m!1087385))

(declare-fun m!1087387 () Bool)

(assert (=> b!1179882 m!1087387))

(declare-fun m!1087389 () Bool)

(assert (=> b!1179882 m!1087389))

(declare-fun m!1087391 () Bool)

(assert (=> b!1179882 m!1087391))

(declare-fun m!1087393 () Bool)

(assert (=> b!1179888 m!1087393))

(declare-fun m!1087395 () Bool)

(assert (=> mapNonEmpty!46406 m!1087395))

(declare-fun m!1087397 () Bool)

(assert (=> b!1179899 m!1087397))

(declare-fun m!1087399 () Bool)

(assert (=> b!1179892 m!1087399))

(declare-fun m!1087401 () Bool)

(assert (=> b!1179900 m!1087401))

(declare-fun m!1087403 () Bool)

(assert (=> b!1179900 m!1087403))

(declare-fun m!1087405 () Bool)

(assert (=> b!1179891 m!1087405))

(assert (=> b!1179895 m!1087373))

(declare-fun m!1087407 () Bool)

(assert (=> b!1179895 m!1087407))

(declare-fun m!1087409 () Bool)

(assert (=> b!1179895 m!1087409))

(assert (=> b!1179895 m!1087409))

(declare-fun m!1087411 () Bool)

(assert (=> b!1179895 m!1087411))

(declare-fun m!1087413 () Bool)

(assert (=> b!1179890 m!1087413))

(declare-fun m!1087415 () Bool)

(assert (=> b!1179893 m!1087415))

(declare-fun m!1087417 () Bool)

(assert (=> b!1179897 m!1087417))

(declare-fun m!1087419 () Bool)

(assert (=> b!1179897 m!1087419))

(declare-fun m!1087421 () Bool)

(assert (=> b!1179897 m!1087421))

(declare-fun m!1087423 () Bool)

(assert (=> b!1179897 m!1087423))

(declare-fun m!1087425 () Bool)

(assert (=> b!1179897 m!1087425))

(assert (=> b!1179887 m!1087373))

(check-sat b_and!41225 (not b!1179900) (not b!1179881) (not b!1179884) (not b!1179890) (not b!1179893) tp_is_empty!29719 (not b_lambda!20315) (not b_next!25189) (not b!1179885) (not start!99604) (not b!1179891) (not b!1179882) (not b!1179899) (not b!1179895) (not b!1179894) (not mapNonEmpty!46406) (not b!1179897) (not b!1179892))
(check-sat b_and!41225 (not b_next!25189))
