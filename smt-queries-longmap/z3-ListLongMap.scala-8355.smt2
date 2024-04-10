; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101714 () Bool)

(assert start!101714)

(declare-fun b_free!26403 () Bool)

(declare-fun b_next!26403 () Bool)

(assert (=> start!101714 (= b_free!26403 (not b_next!26403))))

(declare-fun tp!92254 () Bool)

(declare-fun b_and!44067 () Bool)

(assert (=> start!101714 (= tp!92254 b_and!44067)))

(declare-fun b!1223897 () Bool)

(declare-fun e!695118 () Bool)

(declare-fun e!695121 () Bool)

(declare-fun mapRes!48559 () Bool)

(assert (=> b!1223897 (= e!695118 (and e!695121 mapRes!48559))))

(declare-fun condMapEmpty!48559 () Bool)

(declare-datatypes ((V!46603 0))(
  ( (V!46604 (val!15610 Int)) )
))
(declare-datatypes ((ValueCell!14844 0))(
  ( (ValueCellFull!14844 (v!18272 V!46603)) (EmptyCell!14844) )
))
(declare-datatypes ((array!78997 0))(
  ( (array!78998 (arr!38125 (Array (_ BitVec 32) ValueCell!14844)) (size!38661 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78997)

(declare-fun mapDefault!48559 () ValueCell!14844)

(assert (=> b!1223897 (= condMapEmpty!48559 (= (arr!38125 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14844)) mapDefault!48559)))))

(declare-fun b!1223899 () Bool)

(declare-fun e!695122 () Bool)

(declare-fun e!695116 () Bool)

(assert (=> b!1223899 (= e!695122 e!695116)))

(declare-fun res!813224 () Bool)

(assert (=> b!1223899 (=> res!813224 e!695116)))

(declare-datatypes ((array!78999 0))(
  ( (array!79000 (arr!38126 (Array (_ BitVec 32) (_ BitVec 64))) (size!38662 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78999)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223899 (= res!813224 (not (= (select (arr!38126 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223900 () Bool)

(declare-fun res!813231 () Bool)

(declare-fun e!695110 () Bool)

(assert (=> b!1223900 (=> (not res!813231) (not e!695110))))

(declare-fun lt!557168 () array!78999)

(declare-datatypes ((List!26916 0))(
  ( (Nil!26913) (Cons!26912 (h!28121 (_ BitVec 64)) (t!40299 List!26916)) )
))
(declare-fun arrayNoDuplicates!0 (array!78999 (_ BitVec 32) List!26916) Bool)

(assert (=> b!1223900 (= res!813231 (arrayNoDuplicates!0 lt!557168 #b00000000000000000000000000000000 Nil!26913))))

(declare-fun b!1223901 () Bool)

(declare-fun res!813222 () Bool)

(declare-fun e!695117 () Bool)

(assert (=> b!1223901 (=> (not res!813222) (not e!695117))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78999 (_ BitVec 32)) Bool)

(assert (=> b!1223901 (= res!813222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223902 () Bool)

(declare-fun res!813230 () Bool)

(assert (=> b!1223902 (=> (not res!813230) (not e!695117))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1223902 (= res!813230 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38662 _keys!1208))))))

(declare-fun mapIsEmpty!48559 () Bool)

(assert (=> mapIsEmpty!48559 mapRes!48559))

(declare-fun mapNonEmpty!48559 () Bool)

(declare-fun tp!92255 () Bool)

(declare-fun e!695111 () Bool)

(assert (=> mapNonEmpty!48559 (= mapRes!48559 (and tp!92255 e!695111))))

(declare-fun mapValue!48559 () ValueCell!14844)

(declare-fun mapKey!48559 () (_ BitVec 32))

(declare-fun mapRest!48559 () (Array (_ BitVec 32) ValueCell!14844))

(assert (=> mapNonEmpty!48559 (= (arr!38125 _values!996) (store mapRest!48559 mapKey!48559 mapValue!48559))))

(declare-fun b!1223903 () Bool)

(assert (=> b!1223903 (= e!695117 e!695110)))

(declare-fun res!813220 () Bool)

(assert (=> b!1223903 (=> (not res!813220) (not e!695110))))

(assert (=> b!1223903 (= res!813220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557168 mask!1564))))

(assert (=> b!1223903 (= lt!557168 (array!79000 (store (arr!38126 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38662 _keys!1208)))))

(declare-fun b!1223904 () Bool)

(declare-fun res!813235 () Bool)

(assert (=> b!1223904 (=> (not res!813235) (not e!695117))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1223904 (= res!813235 (and (= (size!38661 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38662 _keys!1208) (size!38661 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223905 () Bool)

(declare-fun res!813227 () Bool)

(assert (=> b!1223905 (=> (not res!813227) (not e!695117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223905 (= res!813227 (validKeyInArray!0 k0!934))))

(declare-fun res!813221 () Bool)

(assert (=> start!101714 (=> (not res!813221) (not e!695117))))

(assert (=> start!101714 (= res!813221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38662 _keys!1208))))))

(assert (=> start!101714 e!695117))

(declare-fun tp_is_empty!31107 () Bool)

(assert (=> start!101714 tp_is_empty!31107))

(declare-fun array_inv!29004 (array!78999) Bool)

(assert (=> start!101714 (array_inv!29004 _keys!1208)))

(assert (=> start!101714 true))

(assert (=> start!101714 tp!92254))

(declare-fun array_inv!29005 (array!78997) Bool)

(assert (=> start!101714 (and (array_inv!29005 _values!996) e!695118)))

(declare-fun b!1223898 () Bool)

(declare-fun e!695120 () Bool)

(declare-fun e!695114 () Bool)

(assert (=> b!1223898 (= e!695120 e!695114)))

(declare-fun res!813233 () Bool)

(assert (=> b!1223898 (=> res!813233 e!695114)))

(assert (=> b!1223898 (= res!813233 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46603)

(declare-fun lt!557163 () array!78997)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46603)

(declare-datatypes ((tuple2!20116 0))(
  ( (tuple2!20117 (_1!10069 (_ BitVec 64)) (_2!10069 V!46603)) )
))
(declare-datatypes ((List!26917 0))(
  ( (Nil!26914) (Cons!26913 (h!28122 tuple2!20116) (t!40300 List!26917)) )
))
(declare-datatypes ((ListLongMap!18085 0))(
  ( (ListLongMap!18086 (toList!9058 List!26917)) )
))
(declare-fun lt!557160 () ListLongMap!18085)

(declare-fun getCurrentListMapNoExtraKeys!5480 (array!78999 array!78997 (_ BitVec 32) (_ BitVec 32) V!46603 V!46603 (_ BitVec 32) Int) ListLongMap!18085)

(assert (=> b!1223898 (= lt!557160 (getCurrentListMapNoExtraKeys!5480 lt!557168 lt!557163 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557169 () V!46603)

(assert (=> b!1223898 (= lt!557163 (array!78998 (store (arr!38125 _values!996) i!673 (ValueCellFull!14844 lt!557169)) (size!38661 _values!996)))))

(declare-fun dynLambda!3353 (Int (_ BitVec 64)) V!46603)

(assert (=> b!1223898 (= lt!557169 (dynLambda!3353 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557167 () ListLongMap!18085)

(assert (=> b!1223898 (= lt!557167 (getCurrentListMapNoExtraKeys!5480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223906 () Bool)

(assert (=> b!1223906 (= e!695111 tp_is_empty!31107)))

(declare-fun b!1223907 () Bool)

(declare-fun lt!557157 () tuple2!20116)

(declare-fun e!695112 () Bool)

(declare-fun lt!557162 () ListLongMap!18085)

(declare-fun +!4115 (ListLongMap!18085 tuple2!20116) ListLongMap!18085)

(assert (=> b!1223907 (= e!695112 (= lt!557167 (+!4115 lt!557162 lt!557157)))))

(declare-fun b!1223908 () Bool)

(declare-datatypes ((Unit!40549 0))(
  ( (Unit!40550) )
))
(declare-fun e!695113 () Unit!40549)

(declare-fun Unit!40551 () Unit!40549)

(assert (=> b!1223908 (= e!695113 Unit!40551)))

(declare-fun lt!557166 () Unit!40549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78999 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40549)

(assert (=> b!1223908 (= lt!557166 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223908 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557170 () Unit!40549)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78999 (_ BitVec 32) (_ BitVec 32)) Unit!40549)

(assert (=> b!1223908 (= lt!557170 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223908 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26913)))

(declare-fun lt!557161 () Unit!40549)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78999 (_ BitVec 64) (_ BitVec 32) List!26916) Unit!40549)

(assert (=> b!1223908 (= lt!557161 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26913))))

(assert (=> b!1223908 false))

(declare-fun b!1223909 () Bool)

(assert (=> b!1223909 (= e!695110 (not e!695120))))

(declare-fun res!813229 () Bool)

(assert (=> b!1223909 (=> res!813229 e!695120)))

(assert (=> b!1223909 (= res!813229 (bvsgt from!1455 i!673))))

(assert (=> b!1223909 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557158 () Unit!40549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78999 (_ BitVec 64) (_ BitVec 32)) Unit!40549)

(assert (=> b!1223909 (= lt!557158 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223910 () Bool)

(assert (=> b!1223910 (= e!695116 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223911 () Bool)

(assert (=> b!1223911 (= e!695121 tp_is_empty!31107)))

(declare-fun b!1223912 () Bool)

(declare-fun e!695115 () Bool)

(declare-fun lt!557159 () ListLongMap!18085)

(declare-fun lt!557164 () ListLongMap!18085)

(assert (=> b!1223912 (= e!695115 (= lt!557159 lt!557164))))

(assert (=> b!1223912 e!695112))

(declare-fun res!813226 () Bool)

(assert (=> b!1223912 (=> (not res!813226) (not e!695112))))

(assert (=> b!1223912 (= res!813226 (not (= (select (arr!38126 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557171 () Unit!40549)

(assert (=> b!1223912 (= lt!557171 e!695113)))

(declare-fun c!120425 () Bool)

(assert (=> b!1223912 (= c!120425 (= (select (arr!38126 _keys!1208) from!1455) k0!934))))

(assert (=> b!1223912 e!695122))

(declare-fun res!813232 () Bool)

(assert (=> b!1223912 (=> (not res!813232) (not e!695122))))

(assert (=> b!1223912 (= res!813232 (= lt!557160 (+!4115 lt!557159 lt!557157)))))

(declare-fun get!19470 (ValueCell!14844 V!46603) V!46603)

(assert (=> b!1223912 (= lt!557157 (tuple2!20117 (select (arr!38126 _keys!1208) from!1455) (get!19470 (select (arr!38125 _values!996) from!1455) lt!557169)))))

(declare-fun b!1223913 () Bool)

(assert (=> b!1223913 (= e!695114 e!695115)))

(declare-fun res!813228 () Bool)

(assert (=> b!1223913 (=> res!813228 e!695115)))

(assert (=> b!1223913 (= res!813228 (not (validKeyInArray!0 (select (arr!38126 _keys!1208) from!1455))))))

(assert (=> b!1223913 (= lt!557164 lt!557159)))

(declare-fun -!1960 (ListLongMap!18085 (_ BitVec 64)) ListLongMap!18085)

(assert (=> b!1223913 (= lt!557159 (-!1960 lt!557162 k0!934))))

(assert (=> b!1223913 (= lt!557164 (getCurrentListMapNoExtraKeys!5480 lt!557168 lt!557163 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223913 (= lt!557162 (getCurrentListMapNoExtraKeys!5480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557165 () Unit!40549)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1167 (array!78999 array!78997 (_ BitVec 32) (_ BitVec 32) V!46603 V!46603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40549)

(assert (=> b!1223913 (= lt!557165 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1167 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223914 () Bool)

(declare-fun res!813225 () Bool)

(assert (=> b!1223914 (=> (not res!813225) (not e!695117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223914 (= res!813225 (validMask!0 mask!1564))))

(declare-fun b!1223915 () Bool)

(declare-fun Unit!40552 () Unit!40549)

(assert (=> b!1223915 (= e!695113 Unit!40552)))

(declare-fun b!1223916 () Bool)

(declare-fun res!813223 () Bool)

(assert (=> b!1223916 (=> (not res!813223) (not e!695117))))

(assert (=> b!1223916 (= res!813223 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26913))))

(declare-fun b!1223917 () Bool)

(declare-fun res!813234 () Bool)

(assert (=> b!1223917 (=> (not res!813234) (not e!695117))))

(assert (=> b!1223917 (= res!813234 (= (select (arr!38126 _keys!1208) i!673) k0!934))))

(assert (= (and start!101714 res!813221) b!1223914))

(assert (= (and b!1223914 res!813225) b!1223904))

(assert (= (and b!1223904 res!813235) b!1223901))

(assert (= (and b!1223901 res!813222) b!1223916))

(assert (= (and b!1223916 res!813223) b!1223902))

(assert (= (and b!1223902 res!813230) b!1223905))

(assert (= (and b!1223905 res!813227) b!1223917))

(assert (= (and b!1223917 res!813234) b!1223903))

(assert (= (and b!1223903 res!813220) b!1223900))

(assert (= (and b!1223900 res!813231) b!1223909))

(assert (= (and b!1223909 (not res!813229)) b!1223898))

(assert (= (and b!1223898 (not res!813233)) b!1223913))

(assert (= (and b!1223913 (not res!813228)) b!1223912))

(assert (= (and b!1223912 res!813232) b!1223899))

(assert (= (and b!1223899 (not res!813224)) b!1223910))

(assert (= (and b!1223912 c!120425) b!1223908))

(assert (= (and b!1223912 (not c!120425)) b!1223915))

(assert (= (and b!1223912 res!813226) b!1223907))

(assert (= (and b!1223897 condMapEmpty!48559) mapIsEmpty!48559))

(assert (= (and b!1223897 (not condMapEmpty!48559)) mapNonEmpty!48559))

(get-info :version)

(assert (= (and mapNonEmpty!48559 ((_ is ValueCellFull!14844) mapValue!48559)) b!1223906))

(assert (= (and b!1223897 ((_ is ValueCellFull!14844) mapDefault!48559)) b!1223911))

(assert (= start!101714 b!1223897))

(declare-fun b_lambda!22383 () Bool)

(assert (=> (not b_lambda!22383) (not b!1223898)))

(declare-fun t!40298 () Bool)

(declare-fun tb!11203 () Bool)

(assert (=> (and start!101714 (= defaultEntry!1004 defaultEntry!1004) t!40298) tb!11203))

(declare-fun result!23019 () Bool)

(assert (=> tb!11203 (= result!23019 tp_is_empty!31107)))

(assert (=> b!1223898 t!40298))

(declare-fun b_and!44069 () Bool)

(assert (= b_and!44067 (and (=> t!40298 result!23019) b_and!44069)))

(declare-fun m!1128911 () Bool)

(assert (=> b!1223907 m!1128911))

(declare-fun m!1128913 () Bool)

(assert (=> b!1223908 m!1128913))

(declare-fun m!1128915 () Bool)

(assert (=> b!1223908 m!1128915))

(declare-fun m!1128917 () Bool)

(assert (=> b!1223908 m!1128917))

(declare-fun m!1128919 () Bool)

(assert (=> b!1223908 m!1128919))

(declare-fun m!1128921 () Bool)

(assert (=> b!1223908 m!1128921))

(declare-fun m!1128923 () Bool)

(assert (=> b!1223910 m!1128923))

(declare-fun m!1128925 () Bool)

(assert (=> b!1223914 m!1128925))

(declare-fun m!1128927 () Bool)

(assert (=> mapNonEmpty!48559 m!1128927))

(declare-fun m!1128929 () Bool)

(assert (=> b!1223898 m!1128929))

(declare-fun m!1128931 () Bool)

(assert (=> b!1223898 m!1128931))

(declare-fun m!1128933 () Bool)

(assert (=> b!1223898 m!1128933))

(declare-fun m!1128935 () Bool)

(assert (=> b!1223898 m!1128935))

(declare-fun m!1128937 () Bool)

(assert (=> start!101714 m!1128937))

(declare-fun m!1128939 () Bool)

(assert (=> start!101714 m!1128939))

(declare-fun m!1128941 () Bool)

(assert (=> b!1223905 m!1128941))

(declare-fun m!1128943 () Bool)

(assert (=> b!1223913 m!1128943))

(declare-fun m!1128945 () Bool)

(assert (=> b!1223913 m!1128945))

(declare-fun m!1128947 () Bool)

(assert (=> b!1223913 m!1128947))

(declare-fun m!1128949 () Bool)

(assert (=> b!1223913 m!1128949))

(assert (=> b!1223913 m!1128947))

(declare-fun m!1128951 () Bool)

(assert (=> b!1223913 m!1128951))

(declare-fun m!1128953 () Bool)

(assert (=> b!1223913 m!1128953))

(declare-fun m!1128955 () Bool)

(assert (=> b!1223917 m!1128955))

(assert (=> b!1223899 m!1128947))

(declare-fun m!1128957 () Bool)

(assert (=> b!1223916 m!1128957))

(declare-fun m!1128959 () Bool)

(assert (=> b!1223903 m!1128959))

(declare-fun m!1128961 () Bool)

(assert (=> b!1223903 m!1128961))

(declare-fun m!1128963 () Bool)

(assert (=> b!1223909 m!1128963))

(declare-fun m!1128965 () Bool)

(assert (=> b!1223909 m!1128965))

(declare-fun m!1128967 () Bool)

(assert (=> b!1223901 m!1128967))

(declare-fun m!1128969 () Bool)

(assert (=> b!1223900 m!1128969))

(assert (=> b!1223912 m!1128947))

(declare-fun m!1128971 () Bool)

(assert (=> b!1223912 m!1128971))

(declare-fun m!1128973 () Bool)

(assert (=> b!1223912 m!1128973))

(assert (=> b!1223912 m!1128973))

(declare-fun m!1128975 () Bool)

(assert (=> b!1223912 m!1128975))

(check-sat (not b!1223912) (not b!1223905) (not b!1223916) (not b!1223913) (not b_next!26403) (not b!1223901) (not b!1223898) (not b_lambda!22383) b_and!44069 (not mapNonEmpty!48559) (not b!1223910) (not b!1223914) (not b!1223909) (not b!1223908) tp_is_empty!31107 (not start!101714) (not b!1223900) (not b!1223903) (not b!1223907))
(check-sat b_and!44069 (not b_next!26403))
