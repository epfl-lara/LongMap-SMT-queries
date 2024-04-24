; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99996 () Bool)

(assert start!99996)

(declare-fun b_free!25339 () Bool)

(declare-fun b_next!25339 () Bool)

(assert (=> start!99996 (= b_free!25339 (not b_next!25339))))

(declare-fun tp!88730 () Bool)

(declare-fun b_and!41547 () Bool)

(assert (=> start!99996 (= tp!88730 b_and!41547)))

(declare-fun b!1186084 () Bool)

(declare-fun e!674465 () Bool)

(declare-fun tp_is_empty!29869 () Bool)

(assert (=> b!1186084 (= e!674465 tp_is_empty!29869)))

(declare-fun b!1186085 () Bool)

(declare-fun res!788046 () Bool)

(declare-fun e!674469 () Bool)

(assert (=> b!1186085 (=> (not res!788046) (not e!674469))))

(declare-datatypes ((array!76583 0))(
  ( (array!76584 (arr!36935 (Array (_ BitVec 32) (_ BitVec 64))) (size!37472 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76583)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186085 (= res!788046 (= (select (arr!36935 _keys!1208) i!673) k0!934))))

(declare-fun b!1186086 () Bool)

(declare-fun res!788042 () Bool)

(assert (=> b!1186086 (=> (not res!788042) (not e!674469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186086 (= res!788042 (validKeyInArray!0 k0!934))))

(declare-fun b!1186087 () Bool)

(declare-fun e!674472 () Bool)

(declare-fun e!674470 () Bool)

(assert (=> b!1186087 (= e!674472 e!674470)))

(declare-fun res!788051 () Bool)

(assert (=> b!1186087 (=> res!788051 e!674470)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1186087 (= res!788051 (not (validKeyInArray!0 (select (arr!36935 _keys!1208) from!1455))))))

(declare-datatypes ((V!44953 0))(
  ( (V!44954 (val!14991 Int)) )
))
(declare-datatypes ((tuple2!19268 0))(
  ( (tuple2!19269 (_1!9645 (_ BitVec 64)) (_2!9645 V!44953)) )
))
(declare-datatypes ((List!26001 0))(
  ( (Nil!25998) (Cons!25997 (h!27215 tuple2!19268) (t!38324 List!26001)) )
))
(declare-datatypes ((ListLongMap!17245 0))(
  ( (ListLongMap!17246 (toList!8638 List!26001)) )
))
(declare-fun lt!537912 () ListLongMap!17245)

(declare-fun lt!537904 () ListLongMap!17245)

(assert (=> b!1186087 (= lt!537912 lt!537904)))

(declare-fun lt!537906 () ListLongMap!17245)

(declare-fun -!1659 (ListLongMap!17245 (_ BitVec 64)) ListLongMap!17245)

(assert (=> b!1186087 (= lt!537904 (-!1659 lt!537906 k0!934))))

(declare-fun zeroValue!944 () V!44953)

(declare-datatypes ((ValueCell!14225 0))(
  ( (ValueCellFull!14225 (v!17625 V!44953)) (EmptyCell!14225) )
))
(declare-datatypes ((array!76585 0))(
  ( (array!76586 (arr!36936 (Array (_ BitVec 32) ValueCell!14225)) (size!37473 (_ BitVec 32))) )
))
(declare-fun lt!537916 () array!76585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537900 () array!76583)

(declare-fun minValue!944 () V!44953)

(declare-fun getCurrentListMapNoExtraKeys!5109 (array!76583 array!76585 (_ BitVec 32) (_ BitVec 32) V!44953 V!44953 (_ BitVec 32) Int) ListLongMap!17245)

(assert (=> b!1186087 (= lt!537912 (getCurrentListMapNoExtraKeys!5109 lt!537900 lt!537916 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76585)

(assert (=> b!1186087 (= lt!537906 (getCurrentListMapNoExtraKeys!5109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39237 0))(
  ( (Unit!39238) )
))
(declare-fun lt!537903 () Unit!39237)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!879 (array!76583 array!76585 (_ BitVec 32) (_ BitVec 32) V!44953 V!44953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39237)

(assert (=> b!1186087 (= lt!537903 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186088 () Bool)

(declare-fun e!674466 () Bool)

(declare-fun e!674474 () Bool)

(declare-fun mapRes!46631 () Bool)

(assert (=> b!1186088 (= e!674466 (and e!674474 mapRes!46631))))

(declare-fun condMapEmpty!46631 () Bool)

(declare-fun mapDefault!46631 () ValueCell!14225)

(assert (=> b!1186088 (= condMapEmpty!46631 (= (arr!36936 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14225)) mapDefault!46631)))))

(declare-fun b!1186089 () Bool)

(declare-fun res!788041 () Bool)

(assert (=> b!1186089 (=> (not res!788041) (not e!674469))))

(assert (=> b!1186089 (= res!788041 (and (= (size!37473 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37472 _keys!1208) (size!37473 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186090 () Bool)

(assert (=> b!1186090 (= e!674470 true)))

(declare-fun lt!537899 () ListLongMap!17245)

(declare-fun lt!537915 () ListLongMap!17245)

(assert (=> b!1186090 (= (-!1659 lt!537899 k0!934) lt!537915)))

(declare-fun lt!537911 () Unit!39237)

(declare-fun lt!537910 () V!44953)

(declare-fun addRemoveCommutativeForDiffKeys!173 (ListLongMap!17245 (_ BitVec 64) V!44953 (_ BitVec 64)) Unit!39237)

(assert (=> b!1186090 (= lt!537911 (addRemoveCommutativeForDiffKeys!173 lt!537906 (select (arr!36935 _keys!1208) from!1455) lt!537910 k0!934))))

(declare-fun lt!537905 () ListLongMap!17245)

(assert (=> b!1186090 (and (= lt!537905 lt!537899) (= lt!537904 lt!537912))))

(declare-fun lt!537913 () tuple2!19268)

(declare-fun +!3957 (ListLongMap!17245 tuple2!19268) ListLongMap!17245)

(assert (=> b!1186090 (= lt!537899 (+!3957 lt!537906 lt!537913))))

(assert (=> b!1186090 (not (= (select (arr!36935 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537898 () Unit!39237)

(declare-fun e!674463 () Unit!39237)

(assert (=> b!1186090 (= lt!537898 e!674463)))

(declare-fun c!117530 () Bool)

(assert (=> b!1186090 (= c!117530 (= (select (arr!36935 _keys!1208) from!1455) k0!934))))

(declare-fun e!674467 () Bool)

(assert (=> b!1186090 e!674467))

(declare-fun res!788038 () Bool)

(assert (=> b!1186090 (=> (not res!788038) (not e!674467))))

(declare-fun lt!537901 () ListLongMap!17245)

(assert (=> b!1186090 (= res!788038 (= lt!537901 lt!537915))))

(assert (=> b!1186090 (= lt!537915 (+!3957 lt!537904 lt!537913))))

(assert (=> b!1186090 (= lt!537913 (tuple2!19269 (select (arr!36935 _keys!1208) from!1455) lt!537910))))

(declare-fun lt!537908 () V!44953)

(declare-fun get!18948 (ValueCell!14225 V!44953) V!44953)

(assert (=> b!1186090 (= lt!537910 (get!18948 (select (arr!36936 _values!996) from!1455) lt!537908))))

(declare-fun b!1186091 () Bool)

(declare-fun Unit!39239 () Unit!39237)

(assert (=> b!1186091 (= e!674463 Unit!39239)))

(declare-fun lt!537914 () Unit!39237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39237)

(assert (=> b!1186091 (= lt!537914 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186091 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537907 () Unit!39237)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76583 (_ BitVec 32) (_ BitVec 32)) Unit!39237)

(assert (=> b!1186091 (= lt!537907 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26002 0))(
  ( (Nil!25999) (Cons!25998 (h!27216 (_ BitVec 64)) (t!38325 List!26002)) )
))
(declare-fun arrayNoDuplicates!0 (array!76583 (_ BitVec 32) List!26002) Bool)

(assert (=> b!1186091 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25999)))

(declare-fun lt!537909 () Unit!39237)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76583 (_ BitVec 64) (_ BitVec 32) List!26002) Unit!39237)

(assert (=> b!1186091 (= lt!537909 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25999))))

(assert (=> b!1186091 false))

(declare-fun b!1186092 () Bool)

(declare-fun res!788050 () Bool)

(declare-fun e!674471 () Bool)

(assert (=> b!1186092 (=> (not res!788050) (not e!674471))))

(assert (=> b!1186092 (= res!788050 (arrayNoDuplicates!0 lt!537900 #b00000000000000000000000000000000 Nil!25999))))

(declare-fun b!1186093 () Bool)

(declare-fun Unit!39240 () Unit!39237)

(assert (=> b!1186093 (= e!674463 Unit!39240)))

(declare-fun mapIsEmpty!46631 () Bool)

(assert (=> mapIsEmpty!46631 mapRes!46631))

(declare-fun b!1186094 () Bool)

(declare-fun e!674464 () Bool)

(assert (=> b!1186094 (= e!674467 e!674464)))

(declare-fun res!788047 () Bool)

(assert (=> b!1186094 (=> res!788047 e!674464)))

(assert (=> b!1186094 (= res!788047 (not (= (select (arr!36935 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46631 () Bool)

(declare-fun tp!88731 () Bool)

(assert (=> mapNonEmpty!46631 (= mapRes!46631 (and tp!88731 e!674465))))

(declare-fun mapRest!46631 () (Array (_ BitVec 32) ValueCell!14225))

(declare-fun mapKey!46631 () (_ BitVec 32))

(declare-fun mapValue!46631 () ValueCell!14225)

(assert (=> mapNonEmpty!46631 (= (arr!36936 _values!996) (store mapRest!46631 mapKey!46631 mapValue!46631))))

(declare-fun b!1186095 () Bool)

(assert (=> b!1186095 (= e!674464 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186096 () Bool)

(declare-fun e!674473 () Bool)

(assert (=> b!1186096 (= e!674473 e!674472)))

(declare-fun res!788043 () Bool)

(assert (=> b!1186096 (=> res!788043 e!674472)))

(assert (=> b!1186096 (= res!788043 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1186096 (= lt!537901 (getCurrentListMapNoExtraKeys!5109 lt!537900 lt!537916 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1186096 (= lt!537916 (array!76586 (store (arr!36936 _values!996) i!673 (ValueCellFull!14225 lt!537908)) (size!37473 _values!996)))))

(declare-fun dynLambda!3070 (Int (_ BitVec 64)) V!44953)

(assert (=> b!1186096 (= lt!537908 (dynLambda!3070 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1186096 (= lt!537905 (getCurrentListMapNoExtraKeys!5109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186097 () Bool)

(declare-fun res!788045 () Bool)

(assert (=> b!1186097 (=> (not res!788045) (not e!674469))))

(assert (=> b!1186097 (= res!788045 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37472 _keys!1208))))))

(declare-fun b!1186098 () Bool)

(assert (=> b!1186098 (= e!674469 e!674471)))

(declare-fun res!788048 () Bool)

(assert (=> b!1186098 (=> (not res!788048) (not e!674471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76583 (_ BitVec 32)) Bool)

(assert (=> b!1186098 (= res!788048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537900 mask!1564))))

(assert (=> b!1186098 (= lt!537900 (array!76584 (store (arr!36935 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37472 _keys!1208)))))

(declare-fun b!1186099 () Bool)

(declare-fun res!788049 () Bool)

(assert (=> b!1186099 (=> (not res!788049) (not e!674469))))

(assert (=> b!1186099 (= res!788049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186100 () Bool)

(assert (=> b!1186100 (= e!674474 tp_is_empty!29869)))

(declare-fun b!1186101 () Bool)

(assert (=> b!1186101 (= e!674471 (not e!674473))))

(declare-fun res!788037 () Bool)

(assert (=> b!1186101 (=> res!788037 e!674473)))

(assert (=> b!1186101 (= res!788037 (bvsgt from!1455 i!673))))

(assert (=> b!1186101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537902 () Unit!39237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76583 (_ BitVec 64) (_ BitVec 32)) Unit!39237)

(assert (=> b!1186101 (= lt!537902 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!788044 () Bool)

(assert (=> start!99996 (=> (not res!788044) (not e!674469))))

(assert (=> start!99996 (= res!788044 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37472 _keys!1208))))))

(assert (=> start!99996 e!674469))

(assert (=> start!99996 tp_is_empty!29869))

(declare-fun array_inv!28262 (array!76583) Bool)

(assert (=> start!99996 (array_inv!28262 _keys!1208)))

(assert (=> start!99996 true))

(assert (=> start!99996 tp!88730))

(declare-fun array_inv!28263 (array!76585) Bool)

(assert (=> start!99996 (and (array_inv!28263 _values!996) e!674466)))

(declare-fun b!1186102 () Bool)

(declare-fun res!788039 () Bool)

(assert (=> b!1186102 (=> (not res!788039) (not e!674469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186102 (= res!788039 (validMask!0 mask!1564))))

(declare-fun b!1186103 () Bool)

(declare-fun res!788040 () Bool)

(assert (=> b!1186103 (=> (not res!788040) (not e!674469))))

(assert (=> b!1186103 (= res!788040 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25999))))

(assert (= (and start!99996 res!788044) b!1186102))

(assert (= (and b!1186102 res!788039) b!1186089))

(assert (= (and b!1186089 res!788041) b!1186099))

(assert (= (and b!1186099 res!788049) b!1186103))

(assert (= (and b!1186103 res!788040) b!1186097))

(assert (= (and b!1186097 res!788045) b!1186086))

(assert (= (and b!1186086 res!788042) b!1186085))

(assert (= (and b!1186085 res!788046) b!1186098))

(assert (= (and b!1186098 res!788048) b!1186092))

(assert (= (and b!1186092 res!788050) b!1186101))

(assert (= (and b!1186101 (not res!788037)) b!1186096))

(assert (= (and b!1186096 (not res!788043)) b!1186087))

(assert (= (and b!1186087 (not res!788051)) b!1186090))

(assert (= (and b!1186090 res!788038) b!1186094))

(assert (= (and b!1186094 (not res!788047)) b!1186095))

(assert (= (and b!1186090 c!117530) b!1186091))

(assert (= (and b!1186090 (not c!117530)) b!1186093))

(assert (= (and b!1186088 condMapEmpty!46631) mapIsEmpty!46631))

(assert (= (and b!1186088 (not condMapEmpty!46631)) mapNonEmpty!46631))

(get-info :version)

(assert (= (and mapNonEmpty!46631 ((_ is ValueCellFull!14225) mapValue!46631)) b!1186084))

(assert (= (and b!1186088 ((_ is ValueCellFull!14225) mapDefault!46631)) b!1186100))

(assert (= start!99996 b!1186088))

(declare-fun b_lambda!20477 () Bool)

(assert (=> (not b_lambda!20477) (not b!1186096)))

(declare-fun t!38323 () Bool)

(declare-fun tb!10143 () Bool)

(assert (=> (and start!99996 (= defaultEntry!1004 defaultEntry!1004) t!38323) tb!10143))

(declare-fun result!20861 () Bool)

(assert (=> tb!10143 (= result!20861 tp_is_empty!29869)))

(assert (=> b!1186096 t!38323))

(declare-fun b_and!41549 () Bool)

(assert (= b_and!41547 (and (=> t!38323 result!20861) b_and!41549)))

(declare-fun m!1094697 () Bool)

(assert (=> b!1186090 m!1094697))

(declare-fun m!1094699 () Bool)

(assert (=> b!1186090 m!1094699))

(assert (=> b!1186090 m!1094699))

(declare-fun m!1094701 () Bool)

(assert (=> b!1186090 m!1094701))

(declare-fun m!1094703 () Bool)

(assert (=> b!1186090 m!1094703))

(declare-fun m!1094705 () Bool)

(assert (=> b!1186090 m!1094705))

(declare-fun m!1094707 () Bool)

(assert (=> b!1186090 m!1094707))

(declare-fun m!1094709 () Bool)

(assert (=> b!1186090 m!1094709))

(assert (=> b!1186090 m!1094703))

(declare-fun m!1094711 () Bool)

(assert (=> b!1186087 m!1094711))

(declare-fun m!1094713 () Bool)

(assert (=> b!1186087 m!1094713))

(declare-fun m!1094715 () Bool)

(assert (=> b!1186087 m!1094715))

(declare-fun m!1094717 () Bool)

(assert (=> b!1186087 m!1094717))

(assert (=> b!1186087 m!1094703))

(declare-fun m!1094719 () Bool)

(assert (=> b!1186087 m!1094719))

(assert (=> b!1186087 m!1094703))

(declare-fun m!1094721 () Bool)

(assert (=> b!1186103 m!1094721))

(declare-fun m!1094723 () Bool)

(assert (=> b!1186096 m!1094723))

(declare-fun m!1094725 () Bool)

(assert (=> b!1186096 m!1094725))

(declare-fun m!1094727 () Bool)

(assert (=> b!1186096 m!1094727))

(declare-fun m!1094729 () Bool)

(assert (=> b!1186096 m!1094729))

(declare-fun m!1094731 () Bool)

(assert (=> mapNonEmpty!46631 m!1094731))

(declare-fun m!1094733 () Bool)

(assert (=> b!1186085 m!1094733))

(assert (=> b!1186094 m!1094703))

(declare-fun m!1094735 () Bool)

(assert (=> b!1186091 m!1094735))

(declare-fun m!1094737 () Bool)

(assert (=> b!1186091 m!1094737))

(declare-fun m!1094739 () Bool)

(assert (=> b!1186091 m!1094739))

(declare-fun m!1094741 () Bool)

(assert (=> b!1186091 m!1094741))

(declare-fun m!1094743 () Bool)

(assert (=> b!1186091 m!1094743))

(declare-fun m!1094745 () Bool)

(assert (=> b!1186092 m!1094745))

(declare-fun m!1094747 () Bool)

(assert (=> b!1186101 m!1094747))

(declare-fun m!1094749 () Bool)

(assert (=> b!1186101 m!1094749))

(declare-fun m!1094751 () Bool)

(assert (=> start!99996 m!1094751))

(declare-fun m!1094753 () Bool)

(assert (=> start!99996 m!1094753))

(declare-fun m!1094755 () Bool)

(assert (=> b!1186095 m!1094755))

(declare-fun m!1094757 () Bool)

(assert (=> b!1186102 m!1094757))

(declare-fun m!1094759 () Bool)

(assert (=> b!1186086 m!1094759))

(declare-fun m!1094761 () Bool)

(assert (=> b!1186098 m!1094761))

(declare-fun m!1094763 () Bool)

(assert (=> b!1186098 m!1094763))

(declare-fun m!1094765 () Bool)

(assert (=> b!1186099 m!1094765))

(check-sat (not b!1186103) (not b!1186099) tp_is_empty!29869 (not b!1186092) (not b!1186102) b_and!41549 (not mapNonEmpty!46631) (not b!1186096) (not b!1186098) (not b_next!25339) (not start!99996) (not b!1186087) (not b!1186095) (not b!1186090) (not b!1186101) (not b!1186091) (not b!1186086) (not b_lambda!20477))
(check-sat b_and!41549 (not b_next!25339))
