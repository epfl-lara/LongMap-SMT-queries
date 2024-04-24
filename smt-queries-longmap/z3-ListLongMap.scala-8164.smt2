; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100086 () Bool)

(assert start!100086)

(declare-fun b_free!25429 () Bool)

(declare-fun b_next!25429 () Bool)

(assert (=> start!100086 (= b_free!25429 (not b_next!25429))))

(declare-fun tp!89000 () Bool)

(declare-fun b_and!41727 () Bool)

(assert (=> start!100086 (= tp!89000 b_and!41727)))

(declare-fun b!1188874 () Bool)

(declare-fun res!790069 () Bool)

(declare-fun e!676094 () Bool)

(assert (=> b!1188874 (=> (not res!790069) (not e!676094))))

(declare-datatypes ((array!76759 0))(
  ( (array!76760 (arr!37023 (Array (_ BitVec 32) (_ BitVec 64))) (size!37560 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76759)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45073 0))(
  ( (V!45074 (val!15036 Int)) )
))
(declare-datatypes ((ValueCell!14270 0))(
  ( (ValueCellFull!14270 (v!17670 V!45073)) (EmptyCell!14270) )
))
(declare-datatypes ((array!76761 0))(
  ( (array!76762 (arr!37024 (Array (_ BitVec 32) ValueCell!14270)) (size!37561 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76761)

(assert (=> b!1188874 (= res!790069 (and (= (size!37561 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37560 _keys!1208) (size!37561 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188875 () Bool)

(declare-fun res!790066 () Bool)

(assert (=> b!1188875 (=> (not res!790066) (not e!676094))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188875 (= res!790066 (validKeyInArray!0 k0!934))))

(declare-fun b!1188876 () Bool)

(declare-fun res!790073 () Bool)

(assert (=> b!1188876 (=> (not res!790073) (not e!676094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188876 (= res!790073 (validMask!0 mask!1564))))

(declare-fun b!1188877 () Bool)

(declare-fun res!790065 () Bool)

(assert (=> b!1188877 (=> (not res!790065) (not e!676094))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188877 (= res!790065 (= (select (arr!37023 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46766 () Bool)

(declare-fun mapRes!46766 () Bool)

(assert (=> mapIsEmpty!46766 mapRes!46766))

(declare-fun b!1188878 () Bool)

(declare-fun res!790062 () Bool)

(assert (=> b!1188878 (=> (not res!790062) (not e!676094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76759 (_ BitVec 32)) Bool)

(assert (=> b!1188878 (= res!790062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46766 () Bool)

(declare-fun tp!89001 () Bool)

(declare-fun e!676088 () Bool)

(assert (=> mapNonEmpty!46766 (= mapRes!46766 (and tp!89001 e!676088))))

(declare-fun mapKey!46766 () (_ BitVec 32))

(declare-fun mapValue!46766 () ValueCell!14270)

(declare-fun mapRest!46766 () (Array (_ BitVec 32) ValueCell!14270))

(assert (=> mapNonEmpty!46766 (= (arr!37024 _values!996) (store mapRest!46766 mapKey!46766 mapValue!46766))))

(declare-fun b!1188879 () Bool)

(declare-datatypes ((Unit!39372 0))(
  ( (Unit!39373) )
))
(declare-fun e!676091 () Unit!39372)

(declare-fun Unit!39374 () Unit!39372)

(assert (=> b!1188879 (= e!676091 Unit!39374)))

(declare-fun b!1188880 () Bool)

(declare-fun res!790072 () Bool)

(assert (=> b!1188880 (=> (not res!790072) (not e!676094))))

(assert (=> b!1188880 (= res!790072 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37560 _keys!1208))))))

(declare-fun e!676090 () Bool)

(declare-fun b!1188881 () Bool)

(declare-fun arrayContainsKey!0 (array!76759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188881 (= e!676090 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188882 () Bool)

(declare-fun e!676086 () Bool)

(declare-fun e!676087 () Bool)

(assert (=> b!1188882 (= e!676086 e!676087)))

(declare-fun res!790074 () Bool)

(assert (=> b!1188882 (=> res!790074 e!676087)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188882 (= res!790074 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45073)

(declare-fun lt!540477 () array!76761)

(declare-datatypes ((tuple2!19342 0))(
  ( (tuple2!19343 (_1!9682 (_ BitVec 64)) (_2!9682 V!45073)) )
))
(declare-datatypes ((List!26080 0))(
  ( (Nil!26077) (Cons!26076 (h!27294 tuple2!19342) (t!38493 List!26080)) )
))
(declare-datatypes ((ListLongMap!17319 0))(
  ( (ListLongMap!17320 (toList!8675 List!26080)) )
))
(declare-fun lt!540481 () ListLongMap!17319)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540472 () array!76759)

(declare-fun minValue!944 () V!45073)

(declare-fun getCurrentListMapNoExtraKeys!5144 (array!76759 array!76761 (_ BitVec 32) (_ BitVec 32) V!45073 V!45073 (_ BitVec 32) Int) ListLongMap!17319)

(assert (=> b!1188882 (= lt!540481 (getCurrentListMapNoExtraKeys!5144 lt!540472 lt!540477 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540467 () V!45073)

(assert (=> b!1188882 (= lt!540477 (array!76762 (store (arr!37024 _values!996) i!673 (ValueCellFull!14270 lt!540467)) (size!37561 _values!996)))))

(declare-fun dynLambda!3103 (Int (_ BitVec 64)) V!45073)

(assert (=> b!1188882 (= lt!540467 (dynLambda!3103 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540470 () ListLongMap!17319)

(assert (=> b!1188882 (= lt!540470 (getCurrentListMapNoExtraKeys!5144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188883 () Bool)

(declare-fun e!676093 () Bool)

(declare-fun tp_is_empty!29959 () Bool)

(assert (=> b!1188883 (= e!676093 tp_is_empty!29959)))

(declare-fun b!1188884 () Bool)

(declare-fun Unit!39375 () Unit!39372)

(assert (=> b!1188884 (= e!676091 Unit!39375)))

(declare-fun lt!540473 () Unit!39372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76759 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39372)

(assert (=> b!1188884 (= lt!540473 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1188884 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540466 () Unit!39372)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76759 (_ BitVec 32) (_ BitVec 32)) Unit!39372)

(assert (=> b!1188884 (= lt!540466 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26081 0))(
  ( (Nil!26078) (Cons!26077 (h!27295 (_ BitVec 64)) (t!38494 List!26081)) )
))
(declare-fun arrayNoDuplicates!0 (array!76759 (_ BitVec 32) List!26081) Bool)

(assert (=> b!1188884 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26078)))

(declare-fun lt!540480 () Unit!39372)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76759 (_ BitVec 64) (_ BitVec 32) List!26081) Unit!39372)

(assert (=> b!1188884 (= lt!540480 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26078))))

(assert (=> b!1188884 false))

(declare-fun b!1188885 () Bool)

(declare-fun res!790063 () Bool)

(declare-fun e!676092 () Bool)

(assert (=> b!1188885 (=> (not res!790063) (not e!676092))))

(assert (=> b!1188885 (= res!790063 (arrayNoDuplicates!0 lt!540472 #b00000000000000000000000000000000 Nil!26078))))

(declare-fun b!1188886 () Bool)

(declare-fun e!676084 () Bool)

(assert (=> b!1188886 (= e!676084 true)))

(declare-fun lt!540476 () ListLongMap!17319)

(declare-fun lt!540463 () ListLongMap!17319)

(declare-fun -!1694 (ListLongMap!17319 (_ BitVec 64)) ListLongMap!17319)

(assert (=> b!1188886 (= (-!1694 lt!540476 k0!934) lt!540463)))

(declare-fun lt!540471 () ListLongMap!17319)

(declare-fun lt!540475 () V!45073)

(declare-fun lt!540469 () Unit!39372)

(declare-fun addRemoveCommutativeForDiffKeys!206 (ListLongMap!17319 (_ BitVec 64) V!45073 (_ BitVec 64)) Unit!39372)

(assert (=> b!1188886 (= lt!540469 (addRemoveCommutativeForDiffKeys!206 lt!540471 (select (arr!37023 _keys!1208) from!1455) lt!540475 k0!934))))

(declare-fun lt!540465 () ListLongMap!17319)

(declare-fun lt!540474 () ListLongMap!17319)

(assert (=> b!1188886 (and (= lt!540470 lt!540476) (= lt!540474 lt!540465))))

(declare-fun lt!540464 () tuple2!19342)

(declare-fun +!3990 (ListLongMap!17319 tuple2!19342) ListLongMap!17319)

(assert (=> b!1188886 (= lt!540476 (+!3990 lt!540471 lt!540464))))

(assert (=> b!1188886 (not (= (select (arr!37023 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540478 () Unit!39372)

(assert (=> b!1188886 (= lt!540478 e!676091)))

(declare-fun c!117665 () Bool)

(assert (=> b!1188886 (= c!117665 (= (select (arr!37023 _keys!1208) from!1455) k0!934))))

(declare-fun e!676085 () Bool)

(assert (=> b!1188886 e!676085))

(declare-fun res!790067 () Bool)

(assert (=> b!1188886 (=> (not res!790067) (not e!676085))))

(assert (=> b!1188886 (= res!790067 (= lt!540481 lt!540463))))

(assert (=> b!1188886 (= lt!540463 (+!3990 lt!540474 lt!540464))))

(assert (=> b!1188886 (= lt!540464 (tuple2!19343 (select (arr!37023 _keys!1208) from!1455) lt!540475))))

(declare-fun get!19011 (ValueCell!14270 V!45073) V!45073)

(assert (=> b!1188886 (= lt!540475 (get!19011 (select (arr!37024 _values!996) from!1455) lt!540467))))

(declare-fun b!1188887 () Bool)

(declare-fun res!790068 () Bool)

(assert (=> b!1188887 (=> (not res!790068) (not e!676094))))

(assert (=> b!1188887 (= res!790068 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26078))))

(declare-fun b!1188888 () Bool)

(assert (=> b!1188888 (= e!676085 e!676090)))

(declare-fun res!790064 () Bool)

(assert (=> b!1188888 (=> res!790064 e!676090)))

(assert (=> b!1188888 (= res!790064 (not (= (select (arr!37023 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188889 () Bool)

(assert (=> b!1188889 (= e!676088 tp_is_empty!29959)))

(declare-fun res!790071 () Bool)

(assert (=> start!100086 (=> (not res!790071) (not e!676094))))

(assert (=> start!100086 (= res!790071 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37560 _keys!1208))))))

(assert (=> start!100086 e!676094))

(assert (=> start!100086 tp_is_empty!29959))

(declare-fun array_inv!28318 (array!76759) Bool)

(assert (=> start!100086 (array_inv!28318 _keys!1208)))

(assert (=> start!100086 true))

(assert (=> start!100086 tp!89000))

(declare-fun e!676089 () Bool)

(declare-fun array_inv!28319 (array!76761) Bool)

(assert (=> start!100086 (and (array_inv!28319 _values!996) e!676089)))

(declare-fun b!1188890 () Bool)

(assert (=> b!1188890 (= e!676094 e!676092)))

(declare-fun res!790070 () Bool)

(assert (=> b!1188890 (=> (not res!790070) (not e!676092))))

(assert (=> b!1188890 (= res!790070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540472 mask!1564))))

(assert (=> b!1188890 (= lt!540472 (array!76760 (store (arr!37023 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37560 _keys!1208)))))

(declare-fun b!1188891 () Bool)

(assert (=> b!1188891 (= e!676092 (not e!676086))))

(declare-fun res!790076 () Bool)

(assert (=> b!1188891 (=> res!790076 e!676086)))

(assert (=> b!1188891 (= res!790076 (bvsgt from!1455 i!673))))

(assert (=> b!1188891 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540468 () Unit!39372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76759 (_ BitVec 64) (_ BitVec 32)) Unit!39372)

(assert (=> b!1188891 (= lt!540468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188892 () Bool)

(assert (=> b!1188892 (= e!676089 (and e!676093 mapRes!46766))))

(declare-fun condMapEmpty!46766 () Bool)

(declare-fun mapDefault!46766 () ValueCell!14270)

(assert (=> b!1188892 (= condMapEmpty!46766 (= (arr!37024 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14270)) mapDefault!46766)))))

(declare-fun b!1188893 () Bool)

(assert (=> b!1188893 (= e!676087 e!676084)))

(declare-fun res!790075 () Bool)

(assert (=> b!1188893 (=> res!790075 e!676084)))

(assert (=> b!1188893 (= res!790075 (not (validKeyInArray!0 (select (arr!37023 _keys!1208) from!1455))))))

(assert (=> b!1188893 (= lt!540465 lt!540474)))

(assert (=> b!1188893 (= lt!540474 (-!1694 lt!540471 k0!934))))

(assert (=> b!1188893 (= lt!540465 (getCurrentListMapNoExtraKeys!5144 lt!540472 lt!540477 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188893 (= lt!540471 (getCurrentListMapNoExtraKeys!5144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540479 () Unit!39372)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!910 (array!76759 array!76761 (_ BitVec 32) (_ BitVec 32) V!45073 V!45073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39372)

(assert (=> b!1188893 (= lt!540479 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100086 res!790071) b!1188876))

(assert (= (and b!1188876 res!790073) b!1188874))

(assert (= (and b!1188874 res!790069) b!1188878))

(assert (= (and b!1188878 res!790062) b!1188887))

(assert (= (and b!1188887 res!790068) b!1188880))

(assert (= (and b!1188880 res!790072) b!1188875))

(assert (= (and b!1188875 res!790066) b!1188877))

(assert (= (and b!1188877 res!790065) b!1188890))

(assert (= (and b!1188890 res!790070) b!1188885))

(assert (= (and b!1188885 res!790063) b!1188891))

(assert (= (and b!1188891 (not res!790076)) b!1188882))

(assert (= (and b!1188882 (not res!790074)) b!1188893))

(assert (= (and b!1188893 (not res!790075)) b!1188886))

(assert (= (and b!1188886 res!790067) b!1188888))

(assert (= (and b!1188888 (not res!790064)) b!1188881))

(assert (= (and b!1188886 c!117665) b!1188884))

(assert (= (and b!1188886 (not c!117665)) b!1188879))

(assert (= (and b!1188892 condMapEmpty!46766) mapIsEmpty!46766))

(assert (= (and b!1188892 (not condMapEmpty!46766)) mapNonEmpty!46766))

(get-info :version)

(assert (= (and mapNonEmpty!46766 ((_ is ValueCellFull!14270) mapValue!46766)) b!1188889))

(assert (= (and b!1188892 ((_ is ValueCellFull!14270) mapDefault!46766)) b!1188883))

(assert (= start!100086 b!1188892))

(declare-fun b_lambda!20567 () Bool)

(assert (=> (not b_lambda!20567) (not b!1188882)))

(declare-fun t!38492 () Bool)

(declare-fun tb!10233 () Bool)

(assert (=> (and start!100086 (= defaultEntry!1004 defaultEntry!1004) t!38492) tb!10233))

(declare-fun result!21041 () Bool)

(assert (=> tb!10233 (= result!21041 tp_is_empty!29959)))

(assert (=> b!1188882 t!38492))

(declare-fun b_and!41729 () Bool)

(assert (= b_and!41727 (and (=> t!38492 result!21041) b_and!41729)))

(declare-fun m!1097847 () Bool)

(assert (=> b!1188888 m!1097847))

(declare-fun m!1097849 () Bool)

(assert (=> b!1188893 m!1097849))

(declare-fun m!1097851 () Bool)

(assert (=> b!1188893 m!1097851))

(declare-fun m!1097853 () Bool)

(assert (=> b!1188893 m!1097853))

(assert (=> b!1188893 m!1097847))

(declare-fun m!1097855 () Bool)

(assert (=> b!1188893 m!1097855))

(declare-fun m!1097857 () Bool)

(assert (=> b!1188893 m!1097857))

(assert (=> b!1188893 m!1097847))

(declare-fun m!1097859 () Bool)

(assert (=> b!1188884 m!1097859))

(declare-fun m!1097861 () Bool)

(assert (=> b!1188884 m!1097861))

(declare-fun m!1097863 () Bool)

(assert (=> b!1188884 m!1097863))

(declare-fun m!1097865 () Bool)

(assert (=> b!1188884 m!1097865))

(declare-fun m!1097867 () Bool)

(assert (=> b!1188884 m!1097867))

(declare-fun m!1097869 () Bool)

(assert (=> b!1188890 m!1097869))

(declare-fun m!1097871 () Bool)

(assert (=> b!1188890 m!1097871))

(declare-fun m!1097873 () Bool)

(assert (=> b!1188881 m!1097873))

(declare-fun m!1097875 () Bool)

(assert (=> b!1188887 m!1097875))

(declare-fun m!1097877 () Bool)

(assert (=> b!1188875 m!1097877))

(declare-fun m!1097879 () Bool)

(assert (=> b!1188885 m!1097879))

(declare-fun m!1097881 () Bool)

(assert (=> b!1188877 m!1097881))

(declare-fun m!1097883 () Bool)

(assert (=> mapNonEmpty!46766 m!1097883))

(declare-fun m!1097885 () Bool)

(assert (=> b!1188878 m!1097885))

(declare-fun m!1097887 () Bool)

(assert (=> b!1188891 m!1097887))

(declare-fun m!1097889 () Bool)

(assert (=> b!1188891 m!1097889))

(declare-fun m!1097891 () Bool)

(assert (=> b!1188876 m!1097891))

(declare-fun m!1097893 () Bool)

(assert (=> start!100086 m!1097893))

(declare-fun m!1097895 () Bool)

(assert (=> start!100086 m!1097895))

(declare-fun m!1097897 () Bool)

(assert (=> b!1188882 m!1097897))

(declare-fun m!1097899 () Bool)

(assert (=> b!1188882 m!1097899))

(declare-fun m!1097901 () Bool)

(assert (=> b!1188882 m!1097901))

(declare-fun m!1097903 () Bool)

(assert (=> b!1188882 m!1097903))

(declare-fun m!1097905 () Bool)

(assert (=> b!1188886 m!1097905))

(declare-fun m!1097907 () Bool)

(assert (=> b!1188886 m!1097907))

(declare-fun m!1097909 () Bool)

(assert (=> b!1188886 m!1097909))

(assert (=> b!1188886 m!1097847))

(declare-fun m!1097911 () Bool)

(assert (=> b!1188886 m!1097911))

(declare-fun m!1097913 () Bool)

(assert (=> b!1188886 m!1097913))

(assert (=> b!1188886 m!1097847))

(assert (=> b!1188886 m!1097905))

(declare-fun m!1097915 () Bool)

(assert (=> b!1188886 m!1097915))

(check-sat (not b!1188884) (not b_lambda!20567) (not b!1188887) b_and!41729 (not mapNonEmpty!46766) tp_is_empty!29959 (not b!1188882) (not b!1188885) (not b!1188878) (not b!1188876) (not b!1188886) (not b!1188875) (not start!100086) (not b!1188893) (not b_next!25429) (not b!1188890) (not b!1188881) (not b!1188891))
(check-sat b_and!41729 (not b_next!25429))
