; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99750 () Bool)

(assert start!99750)

(declare-fun b_free!25093 () Bool)

(declare-fun b_next!25093 () Bool)

(assert (=> start!99750 (= b_free!25093 (not b_next!25093))))

(declare-fun tp!87993 () Bool)

(declare-fun b_and!41055 () Bool)

(assert (=> start!99750 (= tp!87993 b_and!41055)))

(declare-fun b!1178154 () Bool)

(declare-datatypes ((Unit!38853 0))(
  ( (Unit!38854) )
))
(declare-fun e!669828 () Unit!38853)

(declare-fun Unit!38855 () Unit!38853)

(assert (=> b!1178154 (= e!669828 Unit!38855)))

(declare-fun b!1178155 () Bool)

(declare-fun res!782200 () Bool)

(declare-fun e!669829 () Bool)

(assert (=> b!1178155 (=> (not res!782200) (not e!669829))))

(declare-datatypes ((array!76101 0))(
  ( (array!76102 (arr!36694 (Array (_ BitVec 32) (_ BitVec 64))) (size!37231 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76101)

(declare-datatypes ((List!25794 0))(
  ( (Nil!25791) (Cons!25790 (h!27008 (_ BitVec 64)) (t!37871 List!25794)) )
))
(declare-fun arrayNoDuplicates!0 (array!76101 (_ BitVec 32) List!25794) Bool)

(assert (=> b!1178155 (= res!782200 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25791))))

(declare-fun b!1178156 () Bool)

(declare-fun e!669830 () Bool)

(assert (=> b!1178156 (= e!669830 true)))

(declare-fun e!669823 () Bool)

(assert (=> b!1178156 e!669823))

(declare-fun res!782205 () Bool)

(assert (=> b!1178156 (=> (not res!782205) (not e!669823))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1178156 (= res!782205 (not (= (select (arr!36694 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531754 () Unit!38853)

(assert (=> b!1178156 (= lt!531754 e!669828)))

(declare-fun c!117161 () Bool)

(assert (=> b!1178156 (= c!117161 (= (select (arr!36694 _keys!1208) from!1455) k0!934))))

(declare-fun e!669825 () Bool)

(assert (=> b!1178156 e!669825))

(declare-fun res!782202 () Bool)

(assert (=> b!1178156 (=> (not res!782202) (not e!669825))))

(declare-datatypes ((V!44625 0))(
  ( (V!44626 (val!14868 Int)) )
))
(declare-datatypes ((tuple2!19062 0))(
  ( (tuple2!19063 (_1!9542 (_ BitVec 64)) (_2!9542 V!44625)) )
))
(declare-fun lt!531750 () tuple2!19062)

(declare-datatypes ((List!25795 0))(
  ( (Nil!25792) (Cons!25791 (h!27009 tuple2!19062) (t!37872 List!25795)) )
))
(declare-datatypes ((ListLongMap!17039 0))(
  ( (ListLongMap!17040 (toList!8535 List!25795)) )
))
(declare-fun lt!531747 () ListLongMap!17039)

(declare-fun lt!531749 () ListLongMap!17039)

(declare-fun +!3863 (ListLongMap!17039 tuple2!19062) ListLongMap!17039)

(assert (=> b!1178156 (= res!782202 (= lt!531747 (+!3863 lt!531749 lt!531750)))))

(declare-fun lt!531756 () V!44625)

(declare-datatypes ((ValueCell!14102 0))(
  ( (ValueCellFull!14102 (v!17502 V!44625)) (EmptyCell!14102) )
))
(declare-datatypes ((array!76103 0))(
  ( (array!76104 (arr!36695 (Array (_ BitVec 32) ValueCell!14102)) (size!37232 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76103)

(declare-fun get!18779 (ValueCell!14102 V!44625) V!44625)

(assert (=> b!1178156 (= lt!531750 (tuple2!19063 (select (arr!36694 _keys!1208) from!1455) (get!18779 (select (arr!36695 _values!996) from!1455) lt!531756)))))

(declare-fun e!669827 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1178157 () Bool)

(declare-fun arrayContainsKey!0 (array!76101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178157 (= e!669827 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178158 () Bool)

(declare-fun e!669824 () Bool)

(assert (=> b!1178158 (= e!669829 e!669824)))

(declare-fun res!782204 () Bool)

(assert (=> b!1178158 (=> (not res!782204) (not e!669824))))

(declare-fun lt!531743 () array!76101)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76101 (_ BitVec 32)) Bool)

(assert (=> b!1178158 (= res!782204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531743 mask!1564))))

(assert (=> b!1178158 (= lt!531743 (array!76102 (store (arr!36694 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37231 _keys!1208)))))

(declare-fun b!1178159 () Bool)

(declare-fun res!782208 () Bool)

(assert (=> b!1178159 (=> (not res!782208) (not e!669824))))

(assert (=> b!1178159 (= res!782208 (arrayNoDuplicates!0 lt!531743 #b00000000000000000000000000000000 Nil!25791))))

(declare-fun b!1178160 () Bool)

(declare-fun res!782212 () Bool)

(assert (=> b!1178160 (=> (not res!782212) (not e!669829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178160 (= res!782212 (validMask!0 mask!1564))))

(declare-fun b!1178161 () Bool)

(declare-fun res!782213 () Bool)

(assert (=> b!1178161 (=> (not res!782213) (not e!669829))))

(assert (=> b!1178161 (= res!782213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178162 () Bool)

(declare-fun res!782198 () Bool)

(assert (=> b!1178162 (=> (not res!782198) (not e!669829))))

(assert (=> b!1178162 (= res!782198 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37231 _keys!1208))))))

(declare-fun b!1178164 () Bool)

(declare-fun res!782207 () Bool)

(assert (=> b!1178164 (=> (not res!782207) (not e!669829))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1178164 (= res!782207 (and (= (size!37232 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37231 _keys!1208) (size!37232 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46262 () Bool)

(declare-fun mapRes!46262 () Bool)

(declare-fun tp!87992 () Bool)

(declare-fun e!669821 () Bool)

(assert (=> mapNonEmpty!46262 (= mapRes!46262 (and tp!87992 e!669821))))

(declare-fun mapRest!46262 () (Array (_ BitVec 32) ValueCell!14102))

(declare-fun mapKey!46262 () (_ BitVec 32))

(declare-fun mapValue!46262 () ValueCell!14102)

(assert (=> mapNonEmpty!46262 (= (arr!36695 _values!996) (store mapRest!46262 mapKey!46262 mapValue!46262))))

(declare-fun b!1178165 () Bool)

(assert (=> b!1178165 (= e!669825 e!669827)))

(declare-fun res!782210 () Bool)

(assert (=> b!1178165 (=> res!782210 e!669827)))

(assert (=> b!1178165 (= res!782210 (not (= (select (arr!36694 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531752 () ListLongMap!17039)

(declare-fun b!1178166 () Bool)

(declare-fun lt!531757 () ListLongMap!17039)

(assert (=> b!1178166 (= e!669823 (= lt!531757 (+!3863 lt!531752 lt!531750)))))

(declare-fun b!1178167 () Bool)

(declare-fun res!782211 () Bool)

(assert (=> b!1178167 (=> (not res!782211) (not e!669829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178167 (= res!782211 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46262 () Bool)

(assert (=> mapIsEmpty!46262 mapRes!46262))

(declare-fun b!1178168 () Bool)

(declare-fun res!782209 () Bool)

(assert (=> b!1178168 (=> (not res!782209) (not e!669829))))

(assert (=> b!1178168 (= res!782209 (= (select (arr!36694 _keys!1208) i!673) k0!934))))

(declare-fun b!1178169 () Bool)

(declare-fun e!669822 () Bool)

(declare-fun e!669833 () Bool)

(assert (=> b!1178169 (= e!669822 e!669833)))

(declare-fun res!782206 () Bool)

(assert (=> b!1178169 (=> res!782206 e!669833)))

(assert (=> b!1178169 (= res!782206 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531751 () array!76103)

(declare-fun minValue!944 () V!44625)

(declare-fun zeroValue!944 () V!44625)

(declare-fun getCurrentListMapNoExtraKeys!5016 (array!76101 array!76103 (_ BitVec 32) (_ BitVec 32) V!44625 V!44625 (_ BitVec 32) Int) ListLongMap!17039)

(assert (=> b!1178169 (= lt!531747 (getCurrentListMapNoExtraKeys!5016 lt!531743 lt!531751 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178169 (= lt!531751 (array!76104 (store (arr!36695 _values!996) i!673 (ValueCellFull!14102 lt!531756)) (size!37232 _values!996)))))

(declare-fun dynLambda!2991 (Int (_ BitVec 64)) V!44625)

(assert (=> b!1178169 (= lt!531756 (dynLambda!2991 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178169 (= lt!531757 (getCurrentListMapNoExtraKeys!5016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178170 () Bool)

(declare-fun Unit!38856 () Unit!38853)

(assert (=> b!1178170 (= e!669828 Unit!38856)))

(declare-fun lt!531746 () Unit!38853)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76101 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38853)

(assert (=> b!1178170 (= lt!531746 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178170 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531745 () Unit!38853)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76101 (_ BitVec 32) (_ BitVec 32)) Unit!38853)

(assert (=> b!1178170 (= lt!531745 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178170 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25791)))

(declare-fun lt!531753 () Unit!38853)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76101 (_ BitVec 64) (_ BitVec 32) List!25794) Unit!38853)

(assert (=> b!1178170 (= lt!531753 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25791))))

(assert (=> b!1178170 false))

(declare-fun b!1178171 () Bool)

(assert (=> b!1178171 (= e!669833 e!669830)))

(declare-fun res!782199 () Bool)

(assert (=> b!1178171 (=> res!782199 e!669830)))

(assert (=> b!1178171 (= res!782199 (not (validKeyInArray!0 (select (arr!36694 _keys!1208) from!1455))))))

(declare-fun lt!531748 () ListLongMap!17039)

(assert (=> b!1178171 (= lt!531748 lt!531749)))

(declare-fun -!1571 (ListLongMap!17039 (_ BitVec 64)) ListLongMap!17039)

(assert (=> b!1178171 (= lt!531749 (-!1571 lt!531752 k0!934))))

(assert (=> b!1178171 (= lt!531748 (getCurrentListMapNoExtraKeys!5016 lt!531743 lt!531751 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178171 (= lt!531752 (getCurrentListMapNoExtraKeys!5016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531744 () Unit!38853)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!796 (array!76101 array!76103 (_ BitVec 32) (_ BitVec 32) V!44625 V!44625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38853)

(assert (=> b!1178171 (= lt!531744 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!782203 () Bool)

(assert (=> start!99750 (=> (not res!782203) (not e!669829))))

(assert (=> start!99750 (= res!782203 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37231 _keys!1208))))))

(assert (=> start!99750 e!669829))

(declare-fun tp_is_empty!29623 () Bool)

(assert (=> start!99750 tp_is_empty!29623))

(declare-fun array_inv!28100 (array!76101) Bool)

(assert (=> start!99750 (array_inv!28100 _keys!1208)))

(assert (=> start!99750 true))

(assert (=> start!99750 tp!87993))

(declare-fun e!669832 () Bool)

(declare-fun array_inv!28101 (array!76103) Bool)

(assert (=> start!99750 (and (array_inv!28101 _values!996) e!669832)))

(declare-fun b!1178163 () Bool)

(assert (=> b!1178163 (= e!669824 (not e!669822))))

(declare-fun res!782201 () Bool)

(assert (=> b!1178163 (=> res!782201 e!669822)))

(assert (=> b!1178163 (= res!782201 (bvsgt from!1455 i!673))))

(assert (=> b!1178163 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531755 () Unit!38853)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76101 (_ BitVec 64) (_ BitVec 32)) Unit!38853)

(assert (=> b!1178163 (= lt!531755 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178172 () Bool)

(declare-fun e!669826 () Bool)

(assert (=> b!1178172 (= e!669826 tp_is_empty!29623)))

(declare-fun b!1178173 () Bool)

(assert (=> b!1178173 (= e!669832 (and e!669826 mapRes!46262))))

(declare-fun condMapEmpty!46262 () Bool)

(declare-fun mapDefault!46262 () ValueCell!14102)

(assert (=> b!1178173 (= condMapEmpty!46262 (= (arr!36695 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14102)) mapDefault!46262)))))

(declare-fun b!1178174 () Bool)

(assert (=> b!1178174 (= e!669821 tp_is_empty!29623)))

(assert (= (and start!99750 res!782203) b!1178160))

(assert (= (and b!1178160 res!782212) b!1178164))

(assert (= (and b!1178164 res!782207) b!1178161))

(assert (= (and b!1178161 res!782213) b!1178155))

(assert (= (and b!1178155 res!782200) b!1178162))

(assert (= (and b!1178162 res!782198) b!1178167))

(assert (= (and b!1178167 res!782211) b!1178168))

(assert (= (and b!1178168 res!782209) b!1178158))

(assert (= (and b!1178158 res!782204) b!1178159))

(assert (= (and b!1178159 res!782208) b!1178163))

(assert (= (and b!1178163 (not res!782201)) b!1178169))

(assert (= (and b!1178169 (not res!782206)) b!1178171))

(assert (= (and b!1178171 (not res!782199)) b!1178156))

(assert (= (and b!1178156 res!782202) b!1178165))

(assert (= (and b!1178165 (not res!782210)) b!1178157))

(assert (= (and b!1178156 c!117161) b!1178170))

(assert (= (and b!1178156 (not c!117161)) b!1178154))

(assert (= (and b!1178156 res!782205) b!1178166))

(assert (= (and b!1178173 condMapEmpty!46262) mapIsEmpty!46262))

(assert (= (and b!1178173 (not condMapEmpty!46262)) mapNonEmpty!46262))

(get-info :version)

(assert (= (and mapNonEmpty!46262 ((_ is ValueCellFull!14102) mapValue!46262)) b!1178174))

(assert (= (and b!1178173 ((_ is ValueCellFull!14102) mapDefault!46262)) b!1178172))

(assert (= start!99750 b!1178173))

(declare-fun b_lambda!20231 () Bool)

(assert (=> (not b_lambda!20231) (not b!1178169)))

(declare-fun t!37870 () Bool)

(declare-fun tb!9897 () Bool)

(assert (=> (and start!99750 (= defaultEntry!1004 defaultEntry!1004) t!37870) tb!9897))

(declare-fun result!20369 () Bool)

(assert (=> tb!9897 (= result!20369 tp_is_empty!29623)))

(assert (=> b!1178169 t!37870))

(declare-fun b_and!41057 () Bool)

(assert (= b_and!41055 (and (=> t!37870 result!20369) b_and!41057)))

(declare-fun m!1086375 () Bool)

(assert (=> b!1178171 m!1086375))

(declare-fun m!1086377 () Bool)

(assert (=> b!1178171 m!1086377))

(declare-fun m!1086379 () Bool)

(assert (=> b!1178171 m!1086379))

(declare-fun m!1086381 () Bool)

(assert (=> b!1178171 m!1086381))

(declare-fun m!1086383 () Bool)

(assert (=> b!1178171 m!1086383))

(declare-fun m!1086385 () Bool)

(assert (=> b!1178171 m!1086385))

(assert (=> b!1178171 m!1086383))

(declare-fun m!1086387 () Bool)

(assert (=> b!1178159 m!1086387))

(declare-fun m!1086389 () Bool)

(assert (=> b!1178157 m!1086389))

(declare-fun m!1086391 () Bool)

(assert (=> b!1178167 m!1086391))

(declare-fun m!1086393 () Bool)

(assert (=> b!1178168 m!1086393))

(declare-fun m!1086395 () Bool)

(assert (=> b!1178169 m!1086395))

(declare-fun m!1086397 () Bool)

(assert (=> b!1178169 m!1086397))

(declare-fun m!1086399 () Bool)

(assert (=> b!1178169 m!1086399))

(declare-fun m!1086401 () Bool)

(assert (=> b!1178169 m!1086401))

(declare-fun m!1086403 () Bool)

(assert (=> mapNonEmpty!46262 m!1086403))

(declare-fun m!1086405 () Bool)

(assert (=> b!1178158 m!1086405))

(declare-fun m!1086407 () Bool)

(assert (=> b!1178158 m!1086407))

(declare-fun m!1086409 () Bool)

(assert (=> start!99750 m!1086409))

(declare-fun m!1086411 () Bool)

(assert (=> start!99750 m!1086411))

(declare-fun m!1086413 () Bool)

(assert (=> b!1178155 m!1086413))

(declare-fun m!1086415 () Bool)

(assert (=> b!1178166 m!1086415))

(assert (=> b!1178156 m!1086383))

(declare-fun m!1086417 () Bool)

(assert (=> b!1178156 m!1086417))

(declare-fun m!1086419 () Bool)

(assert (=> b!1178156 m!1086419))

(assert (=> b!1178156 m!1086419))

(declare-fun m!1086421 () Bool)

(assert (=> b!1178156 m!1086421))

(assert (=> b!1178165 m!1086383))

(declare-fun m!1086423 () Bool)

(assert (=> b!1178160 m!1086423))

(declare-fun m!1086425 () Bool)

(assert (=> b!1178161 m!1086425))

(declare-fun m!1086427 () Bool)

(assert (=> b!1178170 m!1086427))

(declare-fun m!1086429 () Bool)

(assert (=> b!1178170 m!1086429))

(declare-fun m!1086431 () Bool)

(assert (=> b!1178170 m!1086431))

(declare-fun m!1086433 () Bool)

(assert (=> b!1178170 m!1086433))

(declare-fun m!1086435 () Bool)

(assert (=> b!1178170 m!1086435))

(declare-fun m!1086437 () Bool)

(assert (=> b!1178163 m!1086437))

(declare-fun m!1086439 () Bool)

(assert (=> b!1178163 m!1086439))

(check-sat (not start!99750) (not b!1178169) (not mapNonEmpty!46262) (not b!1178160) (not b!1178159) (not b!1178157) (not b!1178158) b_and!41057 (not b_lambda!20231) (not b!1178166) (not b!1178163) tp_is_empty!29623 (not b!1178170) (not b!1178171) (not b!1178156) (not b!1178155) (not b_next!25093) (not b!1178161) (not b!1178167))
(check-sat b_and!41057 (not b_next!25093))
