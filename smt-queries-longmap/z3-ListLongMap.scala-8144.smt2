; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99732 () Bool)

(assert start!99732)

(declare-fun b_free!25311 () Bool)

(declare-fun b_next!25311 () Bool)

(assert (=> start!99732 (= b_free!25311 (not b_next!25311))))

(declare-fun tp!88647 () Bool)

(declare-fun b_and!41489 () Bool)

(assert (=> start!99732 (= tp!88647 b_and!41489)))

(declare-fun b!1183927 () Bool)

(declare-fun e!673131 () Bool)

(assert (=> b!1183927 (= e!673131 true)))

(declare-datatypes ((V!44915 0))(
  ( (V!44916 (val!14977 Int)) )
))
(declare-datatypes ((tuple2!19204 0))(
  ( (tuple2!19205 (_1!9613 (_ BitVec 64)) (_2!9613 V!44915)) )
))
(declare-datatypes ((List!25943 0))(
  ( (Nil!25940) (Cons!25939 (h!27148 tuple2!19204) (t!38246 List!25943)) )
))
(declare-datatypes ((ListLongMap!17173 0))(
  ( (ListLongMap!17174 (toList!8602 List!25943)) )
))
(declare-fun lt!536620 () ListLongMap!17173)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!536630 () ListLongMap!17173)

(declare-fun -!1637 (ListLongMap!17173 (_ BitVec 64)) ListLongMap!17173)

(assert (=> b!1183927 (= (-!1637 lt!536620 k0!934) lt!536630)))

(declare-fun lt!536625 () V!44915)

(declare-datatypes ((array!76483 0))(
  ( (array!76484 (arr!36891 (Array (_ BitVec 32) (_ BitVec 64))) (size!37427 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76483)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!536622 () ListLongMap!17173)

(declare-datatypes ((Unit!39192 0))(
  ( (Unit!39193) )
))
(declare-fun lt!536627 () Unit!39192)

(declare-fun addRemoveCommutativeForDiffKeys!162 (ListLongMap!17173 (_ BitVec 64) V!44915 (_ BitVec 64)) Unit!39192)

(assert (=> b!1183927 (= lt!536627 (addRemoveCommutativeForDiffKeys!162 lt!536622 (select (arr!36891 _keys!1208) from!1455) lt!536625 k0!934))))

(declare-fun lt!536632 () ListLongMap!17173)

(declare-fun lt!536631 () ListLongMap!17173)

(declare-fun lt!536626 () ListLongMap!17173)

(assert (=> b!1183927 (and (= lt!536631 lt!536620) (= lt!536632 lt!536626))))

(declare-fun lt!536629 () tuple2!19204)

(declare-fun +!3899 (ListLongMap!17173 tuple2!19204) ListLongMap!17173)

(assert (=> b!1183927 (= lt!536620 (+!3899 lt!536622 lt!536629))))

(assert (=> b!1183927 (not (= (select (arr!36891 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536628 () Unit!39192)

(declare-fun e!673132 () Unit!39192)

(assert (=> b!1183927 (= lt!536628 e!673132)))

(declare-fun c!117090 () Bool)

(assert (=> b!1183927 (= c!117090 (= (select (arr!36891 _keys!1208) from!1455) k0!934))))

(declare-fun e!673129 () Bool)

(assert (=> b!1183927 e!673129))

(declare-fun res!786910 () Bool)

(assert (=> b!1183927 (=> (not res!786910) (not e!673129))))

(declare-fun lt!536623 () ListLongMap!17173)

(assert (=> b!1183927 (= res!786910 (= lt!536623 lt!536630))))

(assert (=> b!1183927 (= lt!536630 (+!3899 lt!536632 lt!536629))))

(assert (=> b!1183927 (= lt!536629 (tuple2!19205 (select (arr!36891 _keys!1208) from!1455) lt!536625))))

(declare-datatypes ((ValueCell!14211 0))(
  ( (ValueCellFull!14211 (v!17615 V!44915)) (EmptyCell!14211) )
))
(declare-datatypes ((array!76485 0))(
  ( (array!76486 (arr!36892 (Array (_ BitVec 32) ValueCell!14211)) (size!37428 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76485)

(declare-fun lt!536634 () V!44915)

(declare-fun get!18876 (ValueCell!14211 V!44915) V!44915)

(assert (=> b!1183927 (= lt!536625 (get!18876 (select (arr!36892 _values!996) from!1455) lt!536634))))

(declare-fun b!1183928 () Bool)

(declare-fun e!673130 () Bool)

(declare-fun e!673128 () Bool)

(assert (=> b!1183928 (= e!673130 e!673128)))

(declare-fun res!786907 () Bool)

(assert (=> b!1183928 (=> (not res!786907) (not e!673128))))

(declare-fun lt!536633 () array!76483)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76483 (_ BitVec 32)) Bool)

(assert (=> b!1183928 (= res!786907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536633 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183928 (= lt!536633 (array!76484 (store (arr!36891 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37427 _keys!1208)))))

(declare-fun b!1183929 () Bool)

(declare-fun res!786908 () Bool)

(assert (=> b!1183929 (=> (not res!786908) (not e!673130))))

(declare-datatypes ((List!25944 0))(
  ( (Nil!25941) (Cons!25940 (h!27149 (_ BitVec 64)) (t!38247 List!25944)) )
))
(declare-fun arrayNoDuplicates!0 (array!76483 (_ BitVec 32) List!25944) Bool)

(assert (=> b!1183929 (= res!786908 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25941))))

(declare-fun b!1183930 () Bool)

(declare-fun res!786911 () Bool)

(assert (=> b!1183930 (=> (not res!786911) (not e!673130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183930 (= res!786911 (validMask!0 mask!1564))))

(declare-fun b!1183931 () Bool)

(declare-fun e!673136 () Bool)

(declare-fun tp_is_empty!29841 () Bool)

(assert (=> b!1183931 (= e!673136 tp_is_empty!29841)))

(declare-fun b!1183932 () Bool)

(declare-fun res!786905 () Bool)

(assert (=> b!1183932 (=> (not res!786905) (not e!673128))))

(assert (=> b!1183932 (= res!786905 (arrayNoDuplicates!0 lt!536633 #b00000000000000000000000000000000 Nil!25941))))

(declare-fun b!1183933 () Bool)

(declare-fun res!786901 () Bool)

(assert (=> b!1183933 (=> (not res!786901) (not e!673130))))

(assert (=> b!1183933 (= res!786901 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37427 _keys!1208))))))

(declare-fun b!1183934 () Bool)

(declare-fun res!786906 () Bool)

(assert (=> b!1183934 (=> (not res!786906) (not e!673130))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1183934 (= res!786906 (and (= (size!37428 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37427 _keys!1208) (size!37428 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183936 () Bool)

(declare-fun e!673138 () Bool)

(assert (=> b!1183936 (= e!673129 e!673138)))

(declare-fun res!786902 () Bool)

(assert (=> b!1183936 (=> res!786902 e!673138)))

(assert (=> b!1183936 (= res!786902 (not (= (select (arr!36891 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183937 () Bool)

(declare-fun Unit!39194 () Unit!39192)

(assert (=> b!1183937 (= e!673132 Unit!39194)))

(declare-fun b!1183938 () Bool)

(declare-fun e!673135 () Bool)

(declare-fun mapRes!46589 () Bool)

(assert (=> b!1183938 (= e!673135 (and e!673136 mapRes!46589))))

(declare-fun condMapEmpty!46589 () Bool)

(declare-fun mapDefault!46589 () ValueCell!14211)

(assert (=> b!1183938 (= condMapEmpty!46589 (= (arr!36892 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14211)) mapDefault!46589)))))

(declare-fun b!1183939 () Bool)

(declare-fun e!673127 () Bool)

(assert (=> b!1183939 (= e!673128 (not e!673127))))

(declare-fun res!786909 () Bool)

(assert (=> b!1183939 (=> res!786909 e!673127)))

(assert (=> b!1183939 (= res!786909 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183939 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536618 () Unit!39192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76483 (_ BitVec 64) (_ BitVec 32)) Unit!39192)

(assert (=> b!1183939 (= lt!536618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46589 () Bool)

(assert (=> mapIsEmpty!46589 mapRes!46589))

(declare-fun mapNonEmpty!46589 () Bool)

(declare-fun tp!88646 () Bool)

(declare-fun e!673137 () Bool)

(assert (=> mapNonEmpty!46589 (= mapRes!46589 (and tp!88646 e!673137))))

(declare-fun mapValue!46589 () ValueCell!14211)

(declare-fun mapKey!46589 () (_ BitVec 32))

(declare-fun mapRest!46589 () (Array (_ BitVec 32) ValueCell!14211))

(assert (=> mapNonEmpty!46589 (= (arr!36892 _values!996) (store mapRest!46589 mapKey!46589 mapValue!46589))))

(declare-fun b!1183940 () Bool)

(assert (=> b!1183940 (= e!673138 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183941 () Bool)

(assert (=> b!1183941 (= e!673137 tp_is_empty!29841)))

(declare-fun b!1183942 () Bool)

(declare-fun res!786900 () Bool)

(assert (=> b!1183942 (=> (not res!786900) (not e!673130))))

(assert (=> b!1183942 (= res!786900 (= (select (arr!36891 _keys!1208) i!673) k0!934))))

(declare-fun b!1183943 () Bool)

(declare-fun res!786904 () Bool)

(assert (=> b!1183943 (=> (not res!786904) (not e!673130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183943 (= res!786904 (validKeyInArray!0 k0!934))))

(declare-fun b!1183935 () Bool)

(declare-fun Unit!39195 () Unit!39192)

(assert (=> b!1183935 (= e!673132 Unit!39195)))

(declare-fun lt!536617 () Unit!39192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39192)

(assert (=> b!1183935 (= lt!536617 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183935 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536621 () Unit!39192)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76483 (_ BitVec 32) (_ BitVec 32)) Unit!39192)

(assert (=> b!1183935 (= lt!536621 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183935 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25941)))

(declare-fun lt!536616 () Unit!39192)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76483 (_ BitVec 64) (_ BitVec 32) List!25944) Unit!39192)

(assert (=> b!1183935 (= lt!536616 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25941))))

(assert (=> b!1183935 false))

(declare-fun res!786899 () Bool)

(assert (=> start!99732 (=> (not res!786899) (not e!673130))))

(assert (=> start!99732 (= res!786899 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37427 _keys!1208))))))

(assert (=> start!99732 e!673130))

(assert (=> start!99732 tp_is_empty!29841))

(declare-fun array_inv!28158 (array!76483) Bool)

(assert (=> start!99732 (array_inv!28158 _keys!1208)))

(assert (=> start!99732 true))

(assert (=> start!99732 tp!88647))

(declare-fun array_inv!28159 (array!76485) Bool)

(assert (=> start!99732 (and (array_inv!28159 _values!996) e!673135)))

(declare-fun b!1183944 () Bool)

(declare-fun e!673133 () Bool)

(assert (=> b!1183944 (= e!673133 e!673131)))

(declare-fun res!786903 () Bool)

(assert (=> b!1183944 (=> res!786903 e!673131)))

(assert (=> b!1183944 (= res!786903 (not (validKeyInArray!0 (select (arr!36891 _keys!1208) from!1455))))))

(assert (=> b!1183944 (= lt!536626 lt!536632)))

(assert (=> b!1183944 (= lt!536632 (-!1637 lt!536622 k0!934))))

(declare-fun zeroValue!944 () V!44915)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536624 () array!76485)

(declare-fun minValue!944 () V!44915)

(declare-fun getCurrentListMapNoExtraKeys!5052 (array!76483 array!76485 (_ BitVec 32) (_ BitVec 32) V!44915 V!44915 (_ BitVec 32) Int) ListLongMap!17173)

(assert (=> b!1183944 (= lt!536626 (getCurrentListMapNoExtraKeys!5052 lt!536633 lt!536624 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183944 (= lt!536622 (getCurrentListMapNoExtraKeys!5052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536619 () Unit!39192)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!857 (array!76483 array!76485 (_ BitVec 32) (_ BitVec 32) V!44915 V!44915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39192)

(assert (=> b!1183944 (= lt!536619 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!857 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183945 () Bool)

(assert (=> b!1183945 (= e!673127 e!673133)))

(declare-fun res!786912 () Bool)

(assert (=> b!1183945 (=> res!786912 e!673133)))

(assert (=> b!1183945 (= res!786912 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183945 (= lt!536623 (getCurrentListMapNoExtraKeys!5052 lt!536633 lt!536624 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183945 (= lt!536624 (array!76486 (store (arr!36892 _values!996) i!673 (ValueCellFull!14211 lt!536634)) (size!37428 _values!996)))))

(declare-fun dynLambda!3003 (Int (_ BitVec 64)) V!44915)

(assert (=> b!1183945 (= lt!536634 (dynLambda!3003 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183945 (= lt!536631 (getCurrentListMapNoExtraKeys!5052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183946 () Bool)

(declare-fun res!786913 () Bool)

(assert (=> b!1183946 (=> (not res!786913) (not e!673130))))

(assert (=> b!1183946 (= res!786913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99732 res!786899) b!1183930))

(assert (= (and b!1183930 res!786911) b!1183934))

(assert (= (and b!1183934 res!786906) b!1183946))

(assert (= (and b!1183946 res!786913) b!1183929))

(assert (= (and b!1183929 res!786908) b!1183933))

(assert (= (and b!1183933 res!786901) b!1183943))

(assert (= (and b!1183943 res!786904) b!1183942))

(assert (= (and b!1183942 res!786900) b!1183928))

(assert (= (and b!1183928 res!786907) b!1183932))

(assert (= (and b!1183932 res!786905) b!1183939))

(assert (= (and b!1183939 (not res!786909)) b!1183945))

(assert (= (and b!1183945 (not res!786912)) b!1183944))

(assert (= (and b!1183944 (not res!786903)) b!1183927))

(assert (= (and b!1183927 res!786910) b!1183936))

(assert (= (and b!1183936 (not res!786902)) b!1183940))

(assert (= (and b!1183927 c!117090) b!1183935))

(assert (= (and b!1183927 (not c!117090)) b!1183937))

(assert (= (and b!1183938 condMapEmpty!46589) mapIsEmpty!46589))

(assert (= (and b!1183938 (not condMapEmpty!46589)) mapNonEmpty!46589))

(get-info :version)

(assert (= (and mapNonEmpty!46589 ((_ is ValueCellFull!14211) mapValue!46589)) b!1183941))

(assert (= (and b!1183938 ((_ is ValueCellFull!14211) mapDefault!46589)) b!1183931))

(assert (= start!99732 b!1183938))

(declare-fun b_lambda!20455 () Bool)

(assert (=> (not b_lambda!20455) (not b!1183945)))

(declare-fun t!38245 () Bool)

(declare-fun tb!10123 () Bool)

(assert (=> (and start!99732 (= defaultEntry!1004 defaultEntry!1004) t!38245) tb!10123))

(declare-fun result!20813 () Bool)

(assert (=> tb!10123 (= result!20813 tp_is_empty!29841)))

(assert (=> b!1183945 t!38245))

(declare-fun b_and!41491 () Bool)

(assert (= b_and!41489 (and (=> t!38245 result!20813) b_and!41491)))

(declare-fun m!1092145 () Bool)

(assert (=> b!1183943 m!1092145))

(declare-fun m!1092147 () Bool)

(assert (=> b!1183940 m!1092147))

(declare-fun m!1092149 () Bool)

(assert (=> b!1183942 m!1092149))

(declare-fun m!1092151 () Bool)

(assert (=> mapNonEmpty!46589 m!1092151))

(declare-fun m!1092153 () Bool)

(assert (=> b!1183927 m!1092153))

(declare-fun m!1092155 () Bool)

(assert (=> b!1183927 m!1092155))

(declare-fun m!1092157 () Bool)

(assert (=> b!1183927 m!1092157))

(assert (=> b!1183927 m!1092157))

(declare-fun m!1092159 () Bool)

(assert (=> b!1183927 m!1092159))

(declare-fun m!1092161 () Bool)

(assert (=> b!1183927 m!1092161))

(declare-fun m!1092163 () Bool)

(assert (=> b!1183927 m!1092163))

(declare-fun m!1092165 () Bool)

(assert (=> b!1183927 m!1092165))

(assert (=> b!1183927 m!1092153))

(declare-fun m!1092167 () Bool)

(assert (=> b!1183930 m!1092167))

(declare-fun m!1092169 () Bool)

(assert (=> b!1183929 m!1092169))

(declare-fun m!1092171 () Bool)

(assert (=> b!1183932 m!1092171))

(declare-fun m!1092173 () Bool)

(assert (=> b!1183946 m!1092173))

(assert (=> b!1183936 m!1092153))

(declare-fun m!1092175 () Bool)

(assert (=> start!99732 m!1092175))

(declare-fun m!1092177 () Bool)

(assert (=> start!99732 m!1092177))

(declare-fun m!1092179 () Bool)

(assert (=> b!1183944 m!1092179))

(declare-fun m!1092181 () Bool)

(assert (=> b!1183944 m!1092181))

(declare-fun m!1092183 () Bool)

(assert (=> b!1183944 m!1092183))

(declare-fun m!1092185 () Bool)

(assert (=> b!1183944 m!1092185))

(assert (=> b!1183944 m!1092153))

(declare-fun m!1092187 () Bool)

(assert (=> b!1183944 m!1092187))

(assert (=> b!1183944 m!1092153))

(declare-fun m!1092189 () Bool)

(assert (=> b!1183945 m!1092189))

(declare-fun m!1092191 () Bool)

(assert (=> b!1183945 m!1092191))

(declare-fun m!1092193 () Bool)

(assert (=> b!1183945 m!1092193))

(declare-fun m!1092195 () Bool)

(assert (=> b!1183945 m!1092195))

(declare-fun m!1092197 () Bool)

(assert (=> b!1183928 m!1092197))

(declare-fun m!1092199 () Bool)

(assert (=> b!1183928 m!1092199))

(declare-fun m!1092201 () Bool)

(assert (=> b!1183935 m!1092201))

(declare-fun m!1092203 () Bool)

(assert (=> b!1183935 m!1092203))

(declare-fun m!1092205 () Bool)

(assert (=> b!1183935 m!1092205))

(declare-fun m!1092207 () Bool)

(assert (=> b!1183935 m!1092207))

(declare-fun m!1092209 () Bool)

(assert (=> b!1183935 m!1092209))

(declare-fun m!1092211 () Bool)

(assert (=> b!1183939 m!1092211))

(declare-fun m!1092213 () Bool)

(assert (=> b!1183939 m!1092213))

(check-sat (not b!1183945) (not b!1183943) (not b!1183928) (not b!1183944) (not b_next!25311) (not b_lambda!20455) (not b!1183932) b_and!41491 (not mapNonEmpty!46589) (not b!1183929) (not b!1183935) (not start!99732) (not b!1183930) (not b!1183939) (not b!1183940) tp_is_empty!29841 (not b!1183927) (not b!1183946))
(check-sat b_and!41491 (not b_next!25311))
