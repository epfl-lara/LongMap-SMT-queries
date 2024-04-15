; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99736 () Bool)

(assert start!99736)

(declare-fun b_free!25321 () Bool)

(declare-fun b_next!25321 () Bool)

(assert (=> start!99736 (= b_free!25321 (not b_next!25321))))

(declare-fun tp!88677 () Bool)

(declare-fun b_and!41487 () Bool)

(assert (=> start!99736 (= tp!88677 b_and!41487)))

(declare-fun b!1184113 () Bool)

(declare-fun res!787063 () Bool)

(declare-fun e!673231 () Bool)

(assert (=> b!1184113 (=> (not res!787063) (not e!673231))))

(declare-datatypes ((array!76436 0))(
  ( (array!76437 (arr!36868 (Array (_ BitVec 32) (_ BitVec 64))) (size!37406 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76436)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1184113 (= res!787063 (= (select (arr!36868 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46604 () Bool)

(declare-fun mapRes!46604 () Bool)

(declare-fun tp!88676 () Bool)

(declare-fun e!673234 () Bool)

(assert (=> mapNonEmpty!46604 (= mapRes!46604 (and tp!88676 e!673234))))

(declare-fun mapKey!46604 () (_ BitVec 32))

(declare-datatypes ((V!44929 0))(
  ( (V!44930 (val!14982 Int)) )
))
(declare-datatypes ((ValueCell!14216 0))(
  ( (ValueCellFull!14216 (v!17619 V!44929)) (EmptyCell!14216) )
))
(declare-datatypes ((array!76438 0))(
  ( (array!76439 (arr!36869 (Array (_ BitVec 32) ValueCell!14216)) (size!37407 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76438)

(declare-fun mapRest!46604 () (Array (_ BitVec 32) ValueCell!14216))

(declare-fun mapValue!46604 () ValueCell!14216)

(assert (=> mapNonEmpty!46604 (= (arr!36869 _values!996) (store mapRest!46604 mapKey!46604 mapValue!46604))))

(declare-fun b!1184114 () Bool)

(declare-fun e!673230 () Bool)

(declare-fun e!673232 () Bool)

(assert (=> b!1184114 (= e!673230 e!673232)))

(declare-fun res!787071 () Bool)

(assert (=> b!1184114 (=> res!787071 e!673232)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184114 (= res!787071 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19322 0))(
  ( (tuple2!19323 (_1!9672 (_ BitVec 64)) (_2!9672 V!44929)) )
))
(declare-datatypes ((List!26032 0))(
  ( (Nil!26029) (Cons!26028 (h!27237 tuple2!19322) (t!38336 List!26032)) )
))
(declare-datatypes ((ListLongMap!17291 0))(
  ( (ListLongMap!17292 (toList!8661 List!26032)) )
))
(declare-fun lt!536724 () ListLongMap!17291)

(declare-fun minValue!944 () V!44929)

(declare-fun lt!536727 () array!76436)

(declare-fun zeroValue!944 () V!44929)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!536711 () array!76438)

(declare-fun getCurrentListMapNoExtraKeys!5116 (array!76436 array!76438 (_ BitVec 32) (_ BitVec 32) V!44929 V!44929 (_ BitVec 32) Int) ListLongMap!17291)

(assert (=> b!1184114 (= lt!536724 (getCurrentListMapNoExtraKeys!5116 lt!536727 lt!536711 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536714 () V!44929)

(assert (=> b!1184114 (= lt!536711 (array!76439 (store (arr!36869 _values!996) i!673 (ValueCellFull!14216 lt!536714)) (size!37407 _values!996)))))

(declare-fun dynLambda!3018 (Int (_ BitVec 64)) V!44929)

(assert (=> b!1184114 (= lt!536714 (dynLambda!3018 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536718 () ListLongMap!17291)

(assert (=> b!1184114 (= lt!536718 (getCurrentListMapNoExtraKeys!5116 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184115 () Bool)

(declare-fun e!673240 () Bool)

(declare-fun e!673238 () Bool)

(assert (=> b!1184115 (= e!673240 (and e!673238 mapRes!46604))))

(declare-fun condMapEmpty!46604 () Bool)

(declare-fun mapDefault!46604 () ValueCell!14216)

(assert (=> b!1184115 (= condMapEmpty!46604 (= (arr!36869 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14216)) mapDefault!46604)))))

(declare-fun mapIsEmpty!46604 () Bool)

(assert (=> mapIsEmpty!46604 mapRes!46604))

(declare-fun b!1184116 () Bool)

(declare-fun res!787064 () Bool)

(assert (=> b!1184116 (=> (not res!787064) (not e!673231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76436 (_ BitVec 32)) Bool)

(assert (=> b!1184116 (= res!787064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184117 () Bool)

(declare-fun res!787070 () Bool)

(assert (=> b!1184117 (=> (not res!787070) (not e!673231))))

(assert (=> b!1184117 (= res!787070 (and (= (size!37407 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37406 _keys!1208) (size!37407 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184118 () Bool)

(declare-fun tp_is_empty!29851 () Bool)

(assert (=> b!1184118 (= e!673234 tp_is_empty!29851)))

(declare-fun b!1184119 () Bool)

(declare-fun res!787068 () Bool)

(declare-fun e!673237 () Bool)

(assert (=> b!1184119 (=> (not res!787068) (not e!673237))))

(declare-datatypes ((List!26033 0))(
  ( (Nil!26030) (Cons!26029 (h!27238 (_ BitVec 64)) (t!38337 List!26033)) )
))
(declare-fun arrayNoDuplicates!0 (array!76436 (_ BitVec 32) List!26033) Bool)

(assert (=> b!1184119 (= res!787068 (arrayNoDuplicates!0 lt!536727 #b00000000000000000000000000000000 Nil!26030))))

(declare-fun b!1184120 () Bool)

(declare-fun e!673229 () Bool)

(declare-fun e!673236 () Bool)

(assert (=> b!1184120 (= e!673229 e!673236)))

(declare-fun res!787072 () Bool)

(assert (=> b!1184120 (=> res!787072 e!673236)))

(assert (=> b!1184120 (= res!787072 (not (= (select (arr!36868 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184121 () Bool)

(declare-fun res!787066 () Bool)

(assert (=> b!1184121 (=> (not res!787066) (not e!673231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184121 (= res!787066 (validMask!0 mask!1564))))

(declare-fun b!1184122 () Bool)

(declare-fun e!673233 () Bool)

(assert (=> b!1184122 (= e!673232 e!673233)))

(declare-fun res!787061 () Bool)

(assert (=> b!1184122 (=> res!787061 e!673233)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184122 (= res!787061 (not (validKeyInArray!0 (select (arr!36868 _keys!1208) from!1455))))))

(declare-fun lt!536709 () ListLongMap!17291)

(declare-fun lt!536716 () ListLongMap!17291)

(assert (=> b!1184122 (= lt!536709 lt!536716)))

(declare-fun lt!536713 () ListLongMap!17291)

(declare-fun -!1615 (ListLongMap!17291 (_ BitVec 64)) ListLongMap!17291)

(assert (=> b!1184122 (= lt!536716 (-!1615 lt!536713 k0!934))))

(assert (=> b!1184122 (= lt!536709 (getCurrentListMapNoExtraKeys!5116 lt!536727 lt!536711 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184122 (= lt!536713 (getCurrentListMapNoExtraKeys!5116 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39071 0))(
  ( (Unit!39072) )
))
(declare-fun lt!536712 () Unit!39071)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!877 (array!76436 array!76438 (_ BitVec 32) (_ BitVec 32) V!44929 V!44929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39071)

(assert (=> b!1184122 (= lt!536712 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!877 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184123 () Bool)

(declare-fun res!787062 () Bool)

(assert (=> b!1184123 (=> (not res!787062) (not e!673231))))

(assert (=> b!1184123 (= res!787062 (validKeyInArray!0 k0!934))))

(declare-fun b!1184124 () Bool)

(declare-fun res!787059 () Bool)

(assert (=> b!1184124 (=> (not res!787059) (not e!673231))))

(assert (=> b!1184124 (= res!787059 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26030))))

(declare-fun b!1184126 () Bool)

(declare-fun e!673239 () Unit!39071)

(declare-fun Unit!39073 () Unit!39071)

(assert (=> b!1184126 (= e!673239 Unit!39073)))

(declare-fun lt!536715 () Unit!39071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39071)

(assert (=> b!1184126 (= lt!536715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184126 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536726 () Unit!39071)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76436 (_ BitVec 32) (_ BitVec 32)) Unit!39071)

(assert (=> b!1184126 (= lt!536726 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184126 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26030)))

(declare-fun lt!536723 () Unit!39071)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76436 (_ BitVec 64) (_ BitVec 32) List!26033) Unit!39071)

(assert (=> b!1184126 (= lt!536723 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26030))))

(assert (=> b!1184126 false))

(declare-fun b!1184127 () Bool)

(assert (=> b!1184127 (= e!673237 (not e!673230))))

(declare-fun res!787067 () Bool)

(assert (=> b!1184127 (=> res!787067 e!673230)))

(assert (=> b!1184127 (= res!787067 (bvsgt from!1455 i!673))))

(assert (=> b!1184127 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536722 () Unit!39071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76436 (_ BitVec 64) (_ BitVec 32)) Unit!39071)

(assert (=> b!1184127 (= lt!536722 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184128 () Bool)

(assert (=> b!1184128 (= e!673238 tp_is_empty!29851)))

(declare-fun b!1184129 () Bool)

(assert (=> b!1184129 (= e!673233 true)))

(declare-fun lt!536720 () ListLongMap!17291)

(declare-fun lt!536725 () ListLongMap!17291)

(assert (=> b!1184129 (= (-!1615 lt!536720 k0!934) lt!536725)))

(declare-fun lt!536717 () V!44929)

(declare-fun lt!536710 () Unit!39071)

(declare-fun addRemoveCommutativeForDiffKeys!160 (ListLongMap!17291 (_ BitVec 64) V!44929 (_ BitVec 64)) Unit!39071)

(assert (=> b!1184129 (= lt!536710 (addRemoveCommutativeForDiffKeys!160 lt!536713 (select (arr!36868 _keys!1208) from!1455) lt!536717 k0!934))))

(assert (=> b!1184129 (and (= lt!536718 lt!536720) (= lt!536716 lt!536709))))

(declare-fun lt!536719 () tuple2!19322)

(declare-fun +!3946 (ListLongMap!17291 tuple2!19322) ListLongMap!17291)

(assert (=> b!1184129 (= lt!536720 (+!3946 lt!536713 lt!536719))))

(assert (=> b!1184129 (not (= (select (arr!36868 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536721 () Unit!39071)

(assert (=> b!1184129 (= lt!536721 e!673239)))

(declare-fun c!117079 () Bool)

(assert (=> b!1184129 (= c!117079 (= (select (arr!36868 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184129 e!673229))

(declare-fun res!787058 () Bool)

(assert (=> b!1184129 (=> (not res!787058) (not e!673229))))

(assert (=> b!1184129 (= res!787058 (= lt!536724 lt!536725))))

(assert (=> b!1184129 (= lt!536725 (+!3946 lt!536716 lt!536719))))

(assert (=> b!1184129 (= lt!536719 (tuple2!19323 (select (arr!36868 _keys!1208) from!1455) lt!536717))))

(declare-fun get!18875 (ValueCell!14216 V!44929) V!44929)

(assert (=> b!1184129 (= lt!536717 (get!18875 (select (arr!36869 _values!996) from!1455) lt!536714))))

(declare-fun b!1184130 () Bool)

(declare-fun Unit!39074 () Unit!39071)

(assert (=> b!1184130 (= e!673239 Unit!39074)))

(declare-fun b!1184131 () Bool)

(assert (=> b!1184131 (= e!673236 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184132 () Bool)

(assert (=> b!1184132 (= e!673231 e!673237)))

(declare-fun res!787069 () Bool)

(assert (=> b!1184132 (=> (not res!787069) (not e!673237))))

(assert (=> b!1184132 (= res!787069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536727 mask!1564))))

(assert (=> b!1184132 (= lt!536727 (array!76437 (store (arr!36868 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37406 _keys!1208)))))

(declare-fun res!787065 () Bool)

(assert (=> start!99736 (=> (not res!787065) (not e!673231))))

(assert (=> start!99736 (= res!787065 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37406 _keys!1208))))))

(assert (=> start!99736 e!673231))

(assert (=> start!99736 tp_is_empty!29851))

(declare-fun array_inv!28248 (array!76436) Bool)

(assert (=> start!99736 (array_inv!28248 _keys!1208)))

(assert (=> start!99736 true))

(assert (=> start!99736 tp!88677))

(declare-fun array_inv!28249 (array!76438) Bool)

(assert (=> start!99736 (and (array_inv!28249 _values!996) e!673240)))

(declare-fun b!1184125 () Bool)

(declare-fun res!787060 () Bool)

(assert (=> b!1184125 (=> (not res!787060) (not e!673231))))

(assert (=> b!1184125 (= res!787060 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37406 _keys!1208))))))

(assert (= (and start!99736 res!787065) b!1184121))

(assert (= (and b!1184121 res!787066) b!1184117))

(assert (= (and b!1184117 res!787070) b!1184116))

(assert (= (and b!1184116 res!787064) b!1184124))

(assert (= (and b!1184124 res!787059) b!1184125))

(assert (= (and b!1184125 res!787060) b!1184123))

(assert (= (and b!1184123 res!787062) b!1184113))

(assert (= (and b!1184113 res!787063) b!1184132))

(assert (= (and b!1184132 res!787069) b!1184119))

(assert (= (and b!1184119 res!787068) b!1184127))

(assert (= (and b!1184127 (not res!787067)) b!1184114))

(assert (= (and b!1184114 (not res!787071)) b!1184122))

(assert (= (and b!1184122 (not res!787061)) b!1184129))

(assert (= (and b!1184129 res!787058) b!1184120))

(assert (= (and b!1184120 (not res!787072)) b!1184131))

(assert (= (and b!1184129 c!117079) b!1184126))

(assert (= (and b!1184129 (not c!117079)) b!1184130))

(assert (= (and b!1184115 condMapEmpty!46604) mapIsEmpty!46604))

(assert (= (and b!1184115 (not condMapEmpty!46604)) mapNonEmpty!46604))

(get-info :version)

(assert (= (and mapNonEmpty!46604 ((_ is ValueCellFull!14216) mapValue!46604)) b!1184118))

(assert (= (and b!1184115 ((_ is ValueCellFull!14216) mapDefault!46604)) b!1184128))

(assert (= start!99736 b!1184115))

(declare-fun b_lambda!20447 () Bool)

(assert (=> (not b_lambda!20447) (not b!1184114)))

(declare-fun t!38335 () Bool)

(declare-fun tb!10125 () Bool)

(assert (=> (and start!99736 (= defaultEntry!1004 defaultEntry!1004) t!38335) tb!10125))

(declare-fun result!20825 () Bool)

(assert (=> tb!10125 (= result!20825 tp_is_empty!29851)))

(assert (=> b!1184114 t!38335))

(declare-fun b_and!41489 () Bool)

(assert (= b_and!41487 (and (=> t!38335 result!20825) b_and!41489)))

(declare-fun m!1091885 () Bool)

(assert (=> b!1184123 m!1091885))

(declare-fun m!1091887 () Bool)

(assert (=> start!99736 m!1091887))

(declare-fun m!1091889 () Bool)

(assert (=> start!99736 m!1091889))

(declare-fun m!1091891 () Bool)

(assert (=> b!1184121 m!1091891))

(declare-fun m!1091893 () Bool)

(assert (=> b!1184120 m!1091893))

(declare-fun m!1091895 () Bool)

(assert (=> b!1184129 m!1091895))

(declare-fun m!1091897 () Bool)

(assert (=> b!1184129 m!1091897))

(assert (=> b!1184129 m!1091895))

(declare-fun m!1091899 () Bool)

(assert (=> b!1184129 m!1091899))

(declare-fun m!1091901 () Bool)

(assert (=> b!1184129 m!1091901))

(declare-fun m!1091903 () Bool)

(assert (=> b!1184129 m!1091903))

(assert (=> b!1184129 m!1091893))

(declare-fun m!1091905 () Bool)

(assert (=> b!1184129 m!1091905))

(assert (=> b!1184129 m!1091893))

(declare-fun m!1091907 () Bool)

(assert (=> b!1184124 m!1091907))

(declare-fun m!1091909 () Bool)

(assert (=> b!1184122 m!1091909))

(declare-fun m!1091911 () Bool)

(assert (=> b!1184122 m!1091911))

(assert (=> b!1184122 m!1091893))

(declare-fun m!1091913 () Bool)

(assert (=> b!1184122 m!1091913))

(assert (=> b!1184122 m!1091893))

(declare-fun m!1091915 () Bool)

(assert (=> b!1184122 m!1091915))

(declare-fun m!1091917 () Bool)

(assert (=> b!1184122 m!1091917))

(declare-fun m!1091919 () Bool)

(assert (=> b!1184132 m!1091919))

(declare-fun m!1091921 () Bool)

(assert (=> b!1184132 m!1091921))

(declare-fun m!1091923 () Bool)

(assert (=> b!1184116 m!1091923))

(declare-fun m!1091925 () Bool)

(assert (=> mapNonEmpty!46604 m!1091925))

(declare-fun m!1091927 () Bool)

(assert (=> b!1184114 m!1091927))

(declare-fun m!1091929 () Bool)

(assert (=> b!1184114 m!1091929))

(declare-fun m!1091931 () Bool)

(assert (=> b!1184114 m!1091931))

(declare-fun m!1091933 () Bool)

(assert (=> b!1184114 m!1091933))

(declare-fun m!1091935 () Bool)

(assert (=> b!1184119 m!1091935))

(declare-fun m!1091937 () Bool)

(assert (=> b!1184126 m!1091937))

(declare-fun m!1091939 () Bool)

(assert (=> b!1184126 m!1091939))

(declare-fun m!1091941 () Bool)

(assert (=> b!1184126 m!1091941))

(declare-fun m!1091943 () Bool)

(assert (=> b!1184126 m!1091943))

(declare-fun m!1091945 () Bool)

(assert (=> b!1184126 m!1091945))

(declare-fun m!1091947 () Bool)

(assert (=> b!1184127 m!1091947))

(declare-fun m!1091949 () Bool)

(assert (=> b!1184127 m!1091949))

(declare-fun m!1091951 () Bool)

(assert (=> b!1184113 m!1091951))

(declare-fun m!1091953 () Bool)

(assert (=> b!1184131 m!1091953))

(check-sat b_and!41489 (not b!1184124) (not b!1184131) (not b!1184129) (not b_next!25321) (not b!1184127) (not b!1184123) (not b!1184132) (not b!1184119) (not mapNonEmpty!46604) (not b!1184121) tp_is_empty!29851 (not b!1184114) (not b_lambda!20447) (not b!1184122) (not start!99736) (not b!1184126) (not b!1184116))
(check-sat b_and!41489 (not b_next!25321))
