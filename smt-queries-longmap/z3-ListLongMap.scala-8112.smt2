; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99774 () Bool)

(assert start!99774)

(declare-fun b_free!25117 () Bool)

(declare-fun b_next!25117 () Bool)

(assert (=> start!99774 (= b_free!25117 (not b_next!25117))))

(declare-fun tp!88065 () Bool)

(declare-fun b_and!41103 () Bool)

(assert (=> start!99774 (= tp!88065 b_and!41103)))

(declare-fun b!1178934 () Bool)

(declare-fun e!670297 () Bool)

(declare-fun e!670292 () Bool)

(declare-fun mapRes!46298 () Bool)

(assert (=> b!1178934 (= e!670297 (and e!670292 mapRes!46298))))

(declare-fun condMapEmpty!46298 () Bool)

(declare-datatypes ((V!44657 0))(
  ( (V!44658 (val!14880 Int)) )
))
(declare-datatypes ((ValueCell!14114 0))(
  ( (ValueCellFull!14114 (v!17514 V!44657)) (EmptyCell!14114) )
))
(declare-datatypes ((array!76149 0))(
  ( (array!76150 (arr!36718 (Array (_ BitVec 32) ValueCell!14114)) (size!37255 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76149)

(declare-fun mapDefault!46298 () ValueCell!14114)

(assert (=> b!1178934 (= condMapEmpty!46298 (= (arr!36718 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14114)) mapDefault!46298)))))

(declare-fun b!1178935 () Bool)

(declare-fun e!670289 () Bool)

(declare-fun tp_is_empty!29647 () Bool)

(assert (=> b!1178935 (= e!670289 tp_is_empty!29647)))

(declare-fun b!1178936 () Bool)

(declare-datatypes ((tuple2!19086 0))(
  ( (tuple2!19087 (_1!9554 (_ BitVec 64)) (_2!9554 V!44657)) )
))
(declare-datatypes ((List!25817 0))(
  ( (Nil!25814) (Cons!25813 (h!27031 tuple2!19086) (t!37918 List!25817)) )
))
(declare-datatypes ((ListLongMap!17063 0))(
  ( (ListLongMap!17064 (toList!8547 List!25817)) )
))
(declare-fun lt!532287 () ListLongMap!17063)

(declare-fun e!670301 () Bool)

(declare-fun lt!532289 () ListLongMap!17063)

(declare-fun lt!532297 () tuple2!19086)

(declare-fun +!3873 (ListLongMap!17063 tuple2!19086) ListLongMap!17063)

(assert (=> b!1178936 (= e!670301 (= lt!532287 (+!3873 lt!532289 lt!532297)))))

(declare-fun b!1178937 () Bool)

(declare-datatypes ((Unit!38891 0))(
  ( (Unit!38892) )
))
(declare-fun e!670295 () Unit!38891)

(declare-fun Unit!38893 () Unit!38891)

(assert (=> b!1178937 (= e!670295 Unit!38893)))

(declare-fun b!1178938 () Bool)

(declare-fun res!782775 () Bool)

(declare-fun e!670291 () Bool)

(assert (=> b!1178938 (=> (not res!782775) (not e!670291))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76151 0))(
  ( (array!76152 (arr!36719 (Array (_ BitVec 32) (_ BitVec 64))) (size!37256 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76151)

(assert (=> b!1178938 (= res!782775 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37256 _keys!1208))))))

(declare-fun b!1178939 () Bool)

(declare-fun e!670290 () Bool)

(declare-fun e!670299 () Bool)

(assert (=> b!1178939 (= e!670290 (not e!670299))))

(declare-fun res!782777 () Bool)

(assert (=> b!1178939 (=> res!782777 e!670299)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178939 (= res!782777 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178939 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532291 () Unit!38891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76151 (_ BitVec 64) (_ BitVec 32)) Unit!38891)

(assert (=> b!1178939 (= lt!532291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178940 () Bool)

(declare-fun res!782785 () Bool)

(assert (=> b!1178940 (=> (not res!782785) (not e!670291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178940 (= res!782785 (validKeyInArray!0 k0!934))))

(declare-fun b!1178941 () Bool)

(declare-fun res!782786 () Bool)

(assert (=> b!1178941 (=> (not res!782786) (not e!670291))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1178941 (= res!782786 (and (= (size!37255 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37256 _keys!1208) (size!37255 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178942 () Bool)

(declare-fun res!782779 () Bool)

(assert (=> b!1178942 (=> (not res!782779) (not e!670291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76151 (_ BitVec 32)) Bool)

(assert (=> b!1178942 (= res!782779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178943 () Bool)

(declare-fun e!670298 () Bool)

(declare-fun e!670300 () Bool)

(assert (=> b!1178943 (= e!670298 e!670300)))

(declare-fun res!782778 () Bool)

(assert (=> b!1178943 (=> res!782778 e!670300)))

(assert (=> b!1178943 (= res!782778 (not (= (select (arr!36719 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178944 () Bool)

(assert (=> b!1178944 (= e!670300 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178945 () Bool)

(declare-fun res!782782 () Bool)

(assert (=> b!1178945 (=> (not res!782782) (not e!670291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178945 (= res!782782 (validMask!0 mask!1564))))

(declare-fun b!1178946 () Bool)

(declare-fun res!782788 () Bool)

(assert (=> b!1178946 (=> (not res!782788) (not e!670290))))

(declare-fun lt!532296 () array!76151)

(declare-datatypes ((List!25818 0))(
  ( (Nil!25815) (Cons!25814 (h!27032 (_ BitVec 64)) (t!37919 List!25818)) )
))
(declare-fun arrayNoDuplicates!0 (array!76151 (_ BitVec 32) List!25818) Bool)

(assert (=> b!1178946 (= res!782788 (arrayNoDuplicates!0 lt!532296 #b00000000000000000000000000000000 Nil!25815))))

(declare-fun b!1178947 () Bool)

(declare-fun res!782784 () Bool)

(assert (=> b!1178947 (=> (not res!782784) (not e!670291))))

(assert (=> b!1178947 (= res!782784 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25815))))

(declare-fun b!1178948 () Bool)

(declare-fun e!670296 () Bool)

(assert (=> b!1178948 (= e!670296 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37256 _keys!1208))))))

(assert (=> b!1178948 e!670301))

(declare-fun res!782783 () Bool)

(assert (=> b!1178948 (=> (not res!782783) (not e!670301))))

(assert (=> b!1178948 (= res!782783 (not (= (select (arr!36719 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532293 () Unit!38891)

(assert (=> b!1178948 (= lt!532293 e!670295)))

(declare-fun c!117197 () Bool)

(assert (=> b!1178948 (= c!117197 (= (select (arr!36719 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178948 e!670298))

(declare-fun res!782787 () Bool)

(assert (=> b!1178948 (=> (not res!782787) (not e!670298))))

(declare-fun lt!532284 () ListLongMap!17063)

(declare-fun lt!532286 () ListLongMap!17063)

(assert (=> b!1178948 (= res!782787 (= lt!532286 (+!3873 lt!532284 lt!532297)))))

(declare-fun lt!532292 () V!44657)

(declare-fun get!18795 (ValueCell!14114 V!44657) V!44657)

(assert (=> b!1178948 (= lt!532297 (tuple2!19087 (select (arr!36719 _keys!1208) from!1455) (get!18795 (select (arr!36718 _values!996) from!1455) lt!532292)))))

(declare-fun b!1178949 () Bool)

(declare-fun e!670294 () Bool)

(assert (=> b!1178949 (= e!670294 e!670296)))

(declare-fun res!782789 () Bool)

(assert (=> b!1178949 (=> res!782789 e!670296)))

(assert (=> b!1178949 (= res!782789 (not (validKeyInArray!0 (select (arr!36719 _keys!1208) from!1455))))))

(declare-fun lt!532285 () ListLongMap!17063)

(assert (=> b!1178949 (= lt!532285 lt!532284)))

(declare-fun -!1580 (ListLongMap!17063 (_ BitVec 64)) ListLongMap!17063)

(assert (=> b!1178949 (= lt!532284 (-!1580 lt!532289 k0!934))))

(declare-fun zeroValue!944 () V!44657)

(declare-fun lt!532283 () array!76149)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44657)

(declare-fun getCurrentListMapNoExtraKeys!5026 (array!76151 array!76149 (_ BitVec 32) (_ BitVec 32) V!44657 V!44657 (_ BitVec 32) Int) ListLongMap!17063)

(assert (=> b!1178949 (= lt!532285 (getCurrentListMapNoExtraKeys!5026 lt!532296 lt!532283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178949 (= lt!532289 (getCurrentListMapNoExtraKeys!5026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532290 () Unit!38891)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!805 (array!76151 array!76149 (_ BitVec 32) (_ BitVec 32) V!44657 V!44657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38891)

(assert (=> b!1178949 (= lt!532290 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!805 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178950 () Bool)

(assert (=> b!1178950 (= e!670291 e!670290)))

(declare-fun res!782781 () Bool)

(assert (=> b!1178950 (=> (not res!782781) (not e!670290))))

(assert (=> b!1178950 (= res!782781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532296 mask!1564))))

(assert (=> b!1178950 (= lt!532296 (array!76152 (store (arr!36719 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37256 _keys!1208)))))

(declare-fun b!1178951 () Bool)

(assert (=> b!1178951 (= e!670292 tp_is_empty!29647)))

(declare-fun b!1178952 () Bool)

(declare-fun res!782774 () Bool)

(assert (=> b!1178952 (=> (not res!782774) (not e!670291))))

(assert (=> b!1178952 (= res!782774 (= (select (arr!36719 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46298 () Bool)

(assert (=> mapIsEmpty!46298 mapRes!46298))

(declare-fun mapNonEmpty!46298 () Bool)

(declare-fun tp!88064 () Bool)

(assert (=> mapNonEmpty!46298 (= mapRes!46298 (and tp!88064 e!670289))))

(declare-fun mapKey!46298 () (_ BitVec 32))

(declare-fun mapRest!46298 () (Array (_ BitVec 32) ValueCell!14114))

(declare-fun mapValue!46298 () ValueCell!14114)

(assert (=> mapNonEmpty!46298 (= (arr!36718 _values!996) (store mapRest!46298 mapKey!46298 mapValue!46298))))

(declare-fun res!782780 () Bool)

(assert (=> start!99774 (=> (not res!782780) (not e!670291))))

(assert (=> start!99774 (= res!782780 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37256 _keys!1208))))))

(assert (=> start!99774 e!670291))

(assert (=> start!99774 tp_is_empty!29647))

(declare-fun array_inv!28114 (array!76151) Bool)

(assert (=> start!99774 (array_inv!28114 _keys!1208)))

(assert (=> start!99774 true))

(assert (=> start!99774 tp!88065))

(declare-fun array_inv!28115 (array!76149) Bool)

(assert (=> start!99774 (and (array_inv!28115 _values!996) e!670297)))

(declare-fun b!1178953 () Bool)

(declare-fun Unit!38894 () Unit!38891)

(assert (=> b!1178953 (= e!670295 Unit!38894)))

(declare-fun lt!532295 () Unit!38891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38891)

(assert (=> b!1178953 (= lt!532295 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178953 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532288 () Unit!38891)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76151 (_ BitVec 32) (_ BitVec 32)) Unit!38891)

(assert (=> b!1178953 (= lt!532288 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178953 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25815)))

(declare-fun lt!532294 () Unit!38891)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76151 (_ BitVec 64) (_ BitVec 32) List!25818) Unit!38891)

(assert (=> b!1178953 (= lt!532294 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25815))))

(assert (=> b!1178953 false))

(declare-fun b!1178954 () Bool)

(assert (=> b!1178954 (= e!670299 e!670294)))

(declare-fun res!782776 () Bool)

(assert (=> b!1178954 (=> res!782776 e!670294)))

(assert (=> b!1178954 (= res!782776 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1178954 (= lt!532286 (getCurrentListMapNoExtraKeys!5026 lt!532296 lt!532283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178954 (= lt!532283 (array!76150 (store (arr!36718 _values!996) i!673 (ValueCellFull!14114 lt!532292)) (size!37255 _values!996)))))

(declare-fun dynLambda!2998 (Int (_ BitVec 64)) V!44657)

(assert (=> b!1178954 (= lt!532292 (dynLambda!2998 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178954 (= lt!532287 (getCurrentListMapNoExtraKeys!5026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99774 res!782780) b!1178945))

(assert (= (and b!1178945 res!782782) b!1178941))

(assert (= (and b!1178941 res!782786) b!1178942))

(assert (= (and b!1178942 res!782779) b!1178947))

(assert (= (and b!1178947 res!782784) b!1178938))

(assert (= (and b!1178938 res!782775) b!1178940))

(assert (= (and b!1178940 res!782785) b!1178952))

(assert (= (and b!1178952 res!782774) b!1178950))

(assert (= (and b!1178950 res!782781) b!1178946))

(assert (= (and b!1178946 res!782788) b!1178939))

(assert (= (and b!1178939 (not res!782777)) b!1178954))

(assert (= (and b!1178954 (not res!782776)) b!1178949))

(assert (= (and b!1178949 (not res!782789)) b!1178948))

(assert (= (and b!1178948 res!782787) b!1178943))

(assert (= (and b!1178943 (not res!782778)) b!1178944))

(assert (= (and b!1178948 c!117197) b!1178953))

(assert (= (and b!1178948 (not c!117197)) b!1178937))

(assert (= (and b!1178948 res!782783) b!1178936))

(assert (= (and b!1178934 condMapEmpty!46298) mapIsEmpty!46298))

(assert (= (and b!1178934 (not condMapEmpty!46298)) mapNonEmpty!46298))

(get-info :version)

(assert (= (and mapNonEmpty!46298 ((_ is ValueCellFull!14114) mapValue!46298)) b!1178935))

(assert (= (and b!1178934 ((_ is ValueCellFull!14114) mapDefault!46298)) b!1178951))

(assert (= start!99774 b!1178934))

(declare-fun b_lambda!20255 () Bool)

(assert (=> (not b_lambda!20255) (not b!1178954)))

(declare-fun t!37917 () Bool)

(declare-fun tb!9921 () Bool)

(assert (=> (and start!99774 (= defaultEntry!1004 defaultEntry!1004) t!37917) tb!9921))

(declare-fun result!20417 () Bool)

(assert (=> tb!9921 (= result!20417 tp_is_empty!29647)))

(assert (=> b!1178954 t!37917))

(declare-fun b_and!41105 () Bool)

(assert (= b_and!41103 (and (=> t!37917 result!20417) b_and!41105)))

(declare-fun m!1087167 () Bool)

(assert (=> mapNonEmpty!46298 m!1087167))

(declare-fun m!1087169 () Bool)

(assert (=> b!1178953 m!1087169))

(declare-fun m!1087171 () Bool)

(assert (=> b!1178953 m!1087171))

(declare-fun m!1087173 () Bool)

(assert (=> b!1178953 m!1087173))

(declare-fun m!1087175 () Bool)

(assert (=> b!1178953 m!1087175))

(declare-fun m!1087177 () Bool)

(assert (=> b!1178953 m!1087177))

(declare-fun m!1087179 () Bool)

(assert (=> b!1178936 m!1087179))

(declare-fun m!1087181 () Bool)

(assert (=> b!1178954 m!1087181))

(declare-fun m!1087183 () Bool)

(assert (=> b!1178954 m!1087183))

(declare-fun m!1087185 () Bool)

(assert (=> b!1178954 m!1087185))

(declare-fun m!1087187 () Bool)

(assert (=> b!1178954 m!1087187))

(declare-fun m!1087189 () Bool)

(assert (=> b!1178952 m!1087189))

(declare-fun m!1087191 () Bool)

(assert (=> b!1178945 m!1087191))

(declare-fun m!1087193 () Bool)

(assert (=> b!1178939 m!1087193))

(declare-fun m!1087195 () Bool)

(assert (=> b!1178939 m!1087195))

(declare-fun m!1087197 () Bool)

(assert (=> b!1178940 m!1087197))

(declare-fun m!1087199 () Bool)

(assert (=> b!1178943 m!1087199))

(declare-fun m!1087201 () Bool)

(assert (=> b!1178942 m!1087201))

(declare-fun m!1087203 () Bool)

(assert (=> b!1178947 m!1087203))

(declare-fun m!1087205 () Bool)

(assert (=> b!1178946 m!1087205))

(declare-fun m!1087207 () Bool)

(assert (=> b!1178949 m!1087207))

(assert (=> b!1178949 m!1087199))

(declare-fun m!1087209 () Bool)

(assert (=> b!1178949 m!1087209))

(declare-fun m!1087211 () Bool)

(assert (=> b!1178949 m!1087211))

(assert (=> b!1178949 m!1087199))

(declare-fun m!1087213 () Bool)

(assert (=> b!1178949 m!1087213))

(declare-fun m!1087215 () Bool)

(assert (=> b!1178949 m!1087215))

(declare-fun m!1087217 () Bool)

(assert (=> b!1178950 m!1087217))

(declare-fun m!1087219 () Bool)

(assert (=> b!1178950 m!1087219))

(assert (=> b!1178948 m!1087199))

(declare-fun m!1087221 () Bool)

(assert (=> b!1178948 m!1087221))

(declare-fun m!1087223 () Bool)

(assert (=> b!1178948 m!1087223))

(assert (=> b!1178948 m!1087223))

(declare-fun m!1087225 () Bool)

(assert (=> b!1178948 m!1087225))

(declare-fun m!1087227 () Bool)

(assert (=> b!1178944 m!1087227))

(declare-fun m!1087229 () Bool)

(assert (=> start!99774 m!1087229))

(declare-fun m!1087231 () Bool)

(assert (=> start!99774 m!1087231))

(check-sat tp_is_empty!29647 (not b_next!25117) (not mapNonEmpty!46298) (not b!1178942) (not b!1178947) (not b_lambda!20255) (not b!1178944) (not b!1178946) (not b!1178949) (not b!1178945) (not b!1178940) (not b!1178936) (not b!1178954) (not b!1178948) b_and!41105 (not start!99774) (not b!1178939) (not b!1178950) (not b!1178953))
(check-sat b_and!41105 (not b_next!25117))
