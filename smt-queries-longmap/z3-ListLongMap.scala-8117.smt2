; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99804 () Bool)

(assert start!99804)

(declare-fun b_free!25147 () Bool)

(declare-fun b_next!25147 () Bool)

(assert (=> start!99804 (= b_free!25147 (not b_next!25147))))

(declare-fun tp!88154 () Bool)

(declare-fun b_and!41163 () Bool)

(assert (=> start!99804 (= tp!88154 b_and!41163)))

(declare-fun b!1179909 () Bool)

(declare-fun res!783503 () Bool)

(declare-fun e!670879 () Bool)

(assert (=> b!1179909 (=> (not res!783503) (not e!670879))))

(declare-datatypes ((array!76207 0))(
  ( (array!76208 (arr!36747 (Array (_ BitVec 32) (_ BitVec 64))) (size!37284 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76207)

(declare-datatypes ((List!25840 0))(
  ( (Nil!25837) (Cons!25836 (h!27054 (_ BitVec 64)) (t!37971 List!25840)) )
))
(declare-fun arrayNoDuplicates!0 (array!76207 (_ BitVec 32) List!25840) Bool)

(assert (=> b!1179909 (= res!783503 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25837))))

(declare-fun b!1179911 () Bool)

(declare-fun res!783500 () Bool)

(assert (=> b!1179911 (=> (not res!783500) (not e!670879))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76207 (_ BitVec 32)) Bool)

(assert (=> b!1179911 (= res!783500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179912 () Bool)

(declare-fun e!670882 () Bool)

(declare-fun e!670877 () Bool)

(assert (=> b!1179912 (= e!670882 e!670877)))

(declare-fun res!783506 () Bool)

(assert (=> b!1179912 (=> res!783506 e!670877)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179912 (= res!783506 (not (= (select (arr!36747 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179913 () Bool)

(declare-fun e!670883 () Bool)

(declare-fun e!670875 () Bool)

(declare-fun mapRes!46343 () Bool)

(assert (=> b!1179913 (= e!670883 (and e!670875 mapRes!46343))))

(declare-fun condMapEmpty!46343 () Bool)

(declare-datatypes ((V!44697 0))(
  ( (V!44698 (val!14895 Int)) )
))
(declare-datatypes ((ValueCell!14129 0))(
  ( (ValueCellFull!14129 (v!17529 V!44697)) (EmptyCell!14129) )
))
(declare-datatypes ((array!76209 0))(
  ( (array!76210 (arr!36748 (Array (_ BitVec 32) ValueCell!14129)) (size!37285 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76209)

(declare-fun mapDefault!46343 () ValueCell!14129)

(assert (=> b!1179913 (= condMapEmpty!46343 (= (arr!36748 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14129)) mapDefault!46343)))))

(declare-fun mapNonEmpty!46343 () Bool)

(declare-fun tp!88155 () Bool)

(declare-fun e!670884 () Bool)

(assert (=> mapNonEmpty!46343 (= mapRes!46343 (and tp!88155 e!670884))))

(declare-fun mapRest!46343 () (Array (_ BitVec 32) ValueCell!14129))

(declare-fun mapValue!46343 () ValueCell!14129)

(declare-fun mapKey!46343 () (_ BitVec 32))

(assert (=> mapNonEmpty!46343 (= (arr!36748 _values!996) (store mapRest!46343 mapKey!46343 mapValue!46343))))

(declare-fun b!1179914 () Bool)

(declare-datatypes ((Unit!38935 0))(
  ( (Unit!38936) )
))
(declare-fun e!670876 () Unit!38935)

(declare-fun Unit!38937 () Unit!38935)

(assert (=> b!1179914 (= e!670876 Unit!38937)))

(declare-fun lt!532962 () Unit!38935)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76207 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38935)

(assert (=> b!1179914 (= lt!532962 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179914 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532963 () Unit!38935)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76207 (_ BitVec 32) (_ BitVec 32)) Unit!38935)

(assert (=> b!1179914 (= lt!532963 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179914 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25837)))

(declare-fun lt!532968 () Unit!38935)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76207 (_ BitVec 64) (_ BitVec 32) List!25840) Unit!38935)

(assert (=> b!1179914 (= lt!532968 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25837))))

(assert (=> b!1179914 false))

(declare-fun b!1179915 () Bool)

(declare-fun tp_is_empty!29677 () Bool)

(assert (=> b!1179915 (= e!670875 tp_is_empty!29677)))

(declare-fun b!1179916 () Bool)

(declare-fun Unit!38938 () Unit!38935)

(assert (=> b!1179916 (= e!670876 Unit!38938)))

(declare-fun b!1179917 () Bool)

(declare-fun e!670874 () Bool)

(declare-fun e!670878 () Bool)

(assert (=> b!1179917 (= e!670874 e!670878)))

(declare-fun res!783494 () Bool)

(assert (=> b!1179917 (=> res!783494 e!670878)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179917 (= res!783494 (not (validKeyInArray!0 (select (arr!36747 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19110 0))(
  ( (tuple2!19111 (_1!9566 (_ BitVec 64)) (_2!9566 V!44697)) )
))
(declare-datatypes ((List!25841 0))(
  ( (Nil!25838) (Cons!25837 (h!27055 tuple2!19110) (t!37972 List!25841)) )
))
(declare-datatypes ((ListLongMap!17087 0))(
  ( (ListLongMap!17088 (toList!8559 List!25841)) )
))
(declare-fun lt!532958 () ListLongMap!17087)

(declare-fun lt!532969 () ListLongMap!17087)

(assert (=> b!1179917 (= lt!532958 lt!532969)))

(declare-fun lt!532959 () ListLongMap!17087)

(declare-fun -!1590 (ListLongMap!17087 (_ BitVec 64)) ListLongMap!17087)

(assert (=> b!1179917 (= lt!532969 (-!1590 lt!532959 k0!934))))

(declare-fun zeroValue!944 () V!44697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44697)

(declare-fun lt!532971 () array!76209)

(declare-fun lt!532967 () array!76207)

(declare-fun getCurrentListMapNoExtraKeys!5038 (array!76207 array!76209 (_ BitVec 32) (_ BitVec 32) V!44697 V!44697 (_ BitVec 32) Int) ListLongMap!17087)

(assert (=> b!1179917 (= lt!532958 (getCurrentListMapNoExtraKeys!5038 lt!532967 lt!532971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179917 (= lt!532959 (getCurrentListMapNoExtraKeys!5038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532970 () Unit!38935)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!815 (array!76207 array!76209 (_ BitVec 32) (_ BitVec 32) V!44697 V!44697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38935)

(assert (=> b!1179917 (= lt!532970 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179918 () Bool)

(assert (=> b!1179918 (= e!670884 tp_is_empty!29677)))

(declare-fun mapIsEmpty!46343 () Bool)

(assert (=> mapIsEmpty!46343 mapRes!46343))

(declare-fun b!1179919 () Bool)

(assert (=> b!1179919 (= e!670877 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179920 () Bool)

(declare-fun res!783495 () Bool)

(assert (=> b!1179920 (=> (not res!783495) (not e!670879))))

(assert (=> b!1179920 (= res!783495 (and (= (size!37285 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37284 _keys!1208) (size!37285 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179921 () Bool)

(declare-fun e!670885 () Bool)

(assert (=> b!1179921 (= e!670879 e!670885)))

(declare-fun res!783497 () Bool)

(assert (=> b!1179921 (=> (not res!783497) (not e!670885))))

(assert (=> b!1179921 (= res!783497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532967 mask!1564))))

(assert (=> b!1179921 (= lt!532967 (array!76208 (store (arr!36747 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37284 _keys!1208)))))

(declare-fun b!1179922 () Bool)

(declare-fun res!783496 () Bool)

(assert (=> b!1179922 (=> (not res!783496) (not e!670879))))

(assert (=> b!1179922 (= res!783496 (validKeyInArray!0 k0!934))))

(declare-fun b!1179910 () Bool)

(declare-fun res!783505 () Bool)

(assert (=> b!1179910 (=> (not res!783505) (not e!670879))))

(assert (=> b!1179910 (= res!783505 (= (select (arr!36747 _keys!1208) i!673) k0!934))))

(declare-fun res!783509 () Bool)

(assert (=> start!99804 (=> (not res!783509) (not e!670879))))

(assert (=> start!99804 (= res!783509 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37284 _keys!1208))))))

(assert (=> start!99804 e!670879))

(assert (=> start!99804 tp_is_empty!29677))

(declare-fun array_inv!28132 (array!76207) Bool)

(assert (=> start!99804 (array_inv!28132 _keys!1208)))

(assert (=> start!99804 true))

(assert (=> start!99804 tp!88154))

(declare-fun array_inv!28133 (array!76209) Bool)

(assert (=> start!99804 (and (array_inv!28133 _values!996) e!670883)))

(declare-fun b!1179923 () Bool)

(declare-fun res!783504 () Bool)

(assert (=> b!1179923 (=> (not res!783504) (not e!670879))))

(assert (=> b!1179923 (= res!783504 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37284 _keys!1208))))))

(declare-fun b!1179924 () Bool)

(declare-fun res!783501 () Bool)

(assert (=> b!1179924 (=> (not res!783501) (not e!670885))))

(assert (=> b!1179924 (= res!783501 (arrayNoDuplicates!0 lt!532967 #b00000000000000000000000000000000 Nil!25837))))

(declare-fun b!1179925 () Bool)

(declare-fun e!670886 () Bool)

(assert (=> b!1179925 (= e!670885 (not e!670886))))

(declare-fun res!783507 () Bool)

(assert (=> b!1179925 (=> res!783507 e!670886)))

(assert (=> b!1179925 (= res!783507 (bvsgt from!1455 i!673))))

(assert (=> b!1179925 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532961 () Unit!38935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76207 (_ BitVec 64) (_ BitVec 32)) Unit!38935)

(assert (=> b!1179925 (= lt!532961 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179926 () Bool)

(assert (=> b!1179926 (= e!670878 true)))

(declare-fun e!670881 () Bool)

(assert (=> b!1179926 e!670881))

(declare-fun res!783498 () Bool)

(assert (=> b!1179926 (=> (not res!783498) (not e!670881))))

(assert (=> b!1179926 (= res!783498 (not (= (select (arr!36747 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532964 () Unit!38935)

(assert (=> b!1179926 (= lt!532964 e!670876)))

(declare-fun c!117242 () Bool)

(assert (=> b!1179926 (= c!117242 (= (select (arr!36747 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179926 e!670882))

(declare-fun res!783502 () Bool)

(assert (=> b!1179926 (=> (not res!783502) (not e!670882))))

(declare-fun lt!532965 () ListLongMap!17087)

(declare-fun lt!532972 () tuple2!19110)

(declare-fun +!3884 (ListLongMap!17087 tuple2!19110) ListLongMap!17087)

(assert (=> b!1179926 (= res!783502 (= lt!532965 (+!3884 lt!532969 lt!532972)))))

(declare-fun lt!532960 () V!44697)

(declare-fun get!18815 (ValueCell!14129 V!44697) V!44697)

(assert (=> b!1179926 (= lt!532972 (tuple2!19111 (select (arr!36747 _keys!1208) from!1455) (get!18815 (select (arr!36748 _values!996) from!1455) lt!532960)))))

(declare-fun lt!532966 () ListLongMap!17087)

(declare-fun b!1179927 () Bool)

(assert (=> b!1179927 (= e!670881 (= lt!532966 (+!3884 lt!532959 lt!532972)))))

(declare-fun b!1179928 () Bool)

(declare-fun res!783508 () Bool)

(assert (=> b!1179928 (=> (not res!783508) (not e!670879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179928 (= res!783508 (validMask!0 mask!1564))))

(declare-fun b!1179929 () Bool)

(assert (=> b!1179929 (= e!670886 e!670874)))

(declare-fun res!783499 () Bool)

(assert (=> b!1179929 (=> res!783499 e!670874)))

(assert (=> b!1179929 (= res!783499 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179929 (= lt!532965 (getCurrentListMapNoExtraKeys!5038 lt!532967 lt!532971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179929 (= lt!532971 (array!76210 (store (arr!36748 _values!996) i!673 (ValueCellFull!14129 lt!532960)) (size!37285 _values!996)))))

(declare-fun dynLambda!3008 (Int (_ BitVec 64)) V!44697)

(assert (=> b!1179929 (= lt!532960 (dynLambda!3008 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179929 (= lt!532966 (getCurrentListMapNoExtraKeys!5038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99804 res!783509) b!1179928))

(assert (= (and b!1179928 res!783508) b!1179920))

(assert (= (and b!1179920 res!783495) b!1179911))

(assert (= (and b!1179911 res!783500) b!1179909))

(assert (= (and b!1179909 res!783503) b!1179923))

(assert (= (and b!1179923 res!783504) b!1179922))

(assert (= (and b!1179922 res!783496) b!1179910))

(assert (= (and b!1179910 res!783505) b!1179921))

(assert (= (and b!1179921 res!783497) b!1179924))

(assert (= (and b!1179924 res!783501) b!1179925))

(assert (= (and b!1179925 (not res!783507)) b!1179929))

(assert (= (and b!1179929 (not res!783499)) b!1179917))

(assert (= (and b!1179917 (not res!783494)) b!1179926))

(assert (= (and b!1179926 res!783502) b!1179912))

(assert (= (and b!1179912 (not res!783506)) b!1179919))

(assert (= (and b!1179926 c!117242) b!1179914))

(assert (= (and b!1179926 (not c!117242)) b!1179916))

(assert (= (and b!1179926 res!783498) b!1179927))

(assert (= (and b!1179913 condMapEmpty!46343) mapIsEmpty!46343))

(assert (= (and b!1179913 (not condMapEmpty!46343)) mapNonEmpty!46343))

(get-info :version)

(assert (= (and mapNonEmpty!46343 ((_ is ValueCellFull!14129) mapValue!46343)) b!1179918))

(assert (= (and b!1179913 ((_ is ValueCellFull!14129) mapDefault!46343)) b!1179915))

(assert (= start!99804 b!1179913))

(declare-fun b_lambda!20285 () Bool)

(assert (=> (not b_lambda!20285) (not b!1179929)))

(declare-fun t!37970 () Bool)

(declare-fun tb!9951 () Bool)

(assert (=> (and start!99804 (= defaultEntry!1004 defaultEntry!1004) t!37970) tb!9951))

(declare-fun result!20477 () Bool)

(assert (=> tb!9951 (= result!20477 tp_is_empty!29677)))

(assert (=> b!1179929 t!37970))

(declare-fun b_and!41165 () Bool)

(assert (= b_and!41163 (and (=> t!37970 result!20477) b_and!41165)))

(declare-fun m!1088157 () Bool)

(assert (=> b!1179922 m!1088157))

(declare-fun m!1088159 () Bool)

(assert (=> b!1179912 m!1088159))

(assert (=> b!1179926 m!1088159))

(declare-fun m!1088161 () Bool)

(assert (=> b!1179926 m!1088161))

(declare-fun m!1088163 () Bool)

(assert (=> b!1179926 m!1088163))

(assert (=> b!1179926 m!1088163))

(declare-fun m!1088165 () Bool)

(assert (=> b!1179926 m!1088165))

(declare-fun m!1088167 () Bool)

(assert (=> b!1179921 m!1088167))

(declare-fun m!1088169 () Bool)

(assert (=> b!1179921 m!1088169))

(declare-fun m!1088171 () Bool)

(assert (=> b!1179928 m!1088171))

(declare-fun m!1088173 () Bool)

(assert (=> b!1179929 m!1088173))

(declare-fun m!1088175 () Bool)

(assert (=> b!1179929 m!1088175))

(declare-fun m!1088177 () Bool)

(assert (=> b!1179929 m!1088177))

(declare-fun m!1088179 () Bool)

(assert (=> b!1179929 m!1088179))

(declare-fun m!1088181 () Bool)

(assert (=> mapNonEmpty!46343 m!1088181))

(declare-fun m!1088183 () Bool)

(assert (=> b!1179909 m!1088183))

(declare-fun m!1088185 () Bool)

(assert (=> b!1179925 m!1088185))

(declare-fun m!1088187 () Bool)

(assert (=> b!1179925 m!1088187))

(declare-fun m!1088189 () Bool)

(assert (=> b!1179911 m!1088189))

(declare-fun m!1088191 () Bool)

(assert (=> b!1179924 m!1088191))

(declare-fun m!1088193 () Bool)

(assert (=> b!1179910 m!1088193))

(declare-fun m!1088195 () Bool)

(assert (=> b!1179914 m!1088195))

(declare-fun m!1088197 () Bool)

(assert (=> b!1179914 m!1088197))

(declare-fun m!1088199 () Bool)

(assert (=> b!1179914 m!1088199))

(declare-fun m!1088201 () Bool)

(assert (=> b!1179914 m!1088201))

(declare-fun m!1088203 () Bool)

(assert (=> b!1179914 m!1088203))

(declare-fun m!1088205 () Bool)

(assert (=> b!1179917 m!1088205))

(declare-fun m!1088207 () Bool)

(assert (=> b!1179917 m!1088207))

(declare-fun m!1088209 () Bool)

(assert (=> b!1179917 m!1088209))

(declare-fun m!1088211 () Bool)

(assert (=> b!1179917 m!1088211))

(assert (=> b!1179917 m!1088159))

(declare-fun m!1088213 () Bool)

(assert (=> b!1179917 m!1088213))

(assert (=> b!1179917 m!1088159))

(declare-fun m!1088215 () Bool)

(assert (=> start!99804 m!1088215))

(declare-fun m!1088217 () Bool)

(assert (=> start!99804 m!1088217))

(declare-fun m!1088219 () Bool)

(assert (=> b!1179919 m!1088219))

(declare-fun m!1088221 () Bool)

(assert (=> b!1179927 m!1088221))

(check-sat (not b_lambda!20285) (not b!1179909) (not b!1179924) tp_is_empty!29677 (not b!1179919) (not b!1179917) (not mapNonEmpty!46343) b_and!41165 (not b!1179921) (not b!1179927) (not b!1179928) (not start!99804) (not b!1179926) (not b!1179914) (not b!1179911) (not b_next!25147) (not b!1179929) (not b!1179922) (not b!1179925))
(check-sat b_and!41165 (not b_next!25147))
