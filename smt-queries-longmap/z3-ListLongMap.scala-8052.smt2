; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99154 () Bool)

(assert start!99154)

(declare-fun b_free!24759 () Bool)

(declare-fun b_next!24759 () Bool)

(assert (=> start!99154 (= b_free!24759 (not b_next!24759))))

(declare-fun tp!86987 () Bool)

(declare-fun b_and!40367 () Bool)

(assert (=> start!99154 (= tp!86987 b_and!40367)))

(declare-fun b!1166890 () Bool)

(declare-fun e!663273 () Bool)

(declare-fun tp_is_empty!29289 () Bool)

(assert (=> b!1166890 (= e!663273 tp_is_empty!29289)))

(declare-fun b!1166891 () Bool)

(declare-fun res!774040 () Bool)

(declare-fun e!663269 () Bool)

(assert (=> b!1166891 (=> (not res!774040) (not e!663269))))

(declare-datatypes ((array!75409 0))(
  ( (array!75410 (arr!36355 (Array (_ BitVec 32) (_ BitVec 64))) (size!36891 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75409)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166891 (= res!774040 (= (select (arr!36355 _keys!1208) i!673) k0!934))))

(declare-fun b!1166892 () Bool)

(declare-fun e!663268 () Bool)

(declare-fun e!663266 () Bool)

(assert (=> b!1166892 (= e!663268 (not e!663266))))

(declare-fun res!774036 () Bool)

(assert (=> b!1166892 (=> res!774036 e!663266)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166892 (= res!774036 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166892 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38506 0))(
  ( (Unit!38507) )
))
(declare-fun lt!525425 () Unit!38506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75409 (_ BitVec 64) (_ BitVec 32)) Unit!38506)

(assert (=> b!1166892 (= lt!525425 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!774039 () Bool)

(assert (=> start!99154 (=> (not res!774039) (not e!663269))))

(assert (=> start!99154 (= res!774039 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36891 _keys!1208))))))

(assert (=> start!99154 e!663269))

(assert (=> start!99154 tp_is_empty!29289))

(declare-fun array_inv!27798 (array!75409) Bool)

(assert (=> start!99154 (array_inv!27798 _keys!1208)))

(assert (=> start!99154 true))

(assert (=> start!99154 tp!86987))

(declare-datatypes ((V!44179 0))(
  ( (V!44180 (val!14701 Int)) )
))
(declare-datatypes ((ValueCell!13935 0))(
  ( (ValueCellFull!13935 (v!17338 V!44179)) (EmptyCell!13935) )
))
(declare-datatypes ((array!75411 0))(
  ( (array!75412 (arr!36356 (Array (_ BitVec 32) ValueCell!13935)) (size!36892 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75411)

(declare-fun e!663272 () Bool)

(declare-fun array_inv!27799 (array!75411) Bool)

(assert (=> start!99154 (and (array_inv!27799 _values!996) e!663272)))

(declare-fun b!1166893 () Bool)

(declare-fun res!774047 () Bool)

(assert (=> b!1166893 (=> (not res!774047) (not e!663269))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166893 (= res!774047 (validMask!0 mask!1564))))

(declare-fun b!1166894 () Bool)

(declare-fun res!774044 () Bool)

(assert (=> b!1166894 (=> (not res!774044) (not e!663269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166894 (= res!774044 (validKeyInArray!0 k0!934))))

(declare-fun b!1166895 () Bool)

(declare-fun res!774043 () Bool)

(assert (=> b!1166895 (=> (not res!774043) (not e!663269))))

(declare-datatypes ((List!25493 0))(
  ( (Nil!25490) (Cons!25489 (h!26698 (_ BitVec 64)) (t!37244 List!25493)) )
))
(declare-fun arrayNoDuplicates!0 (array!75409 (_ BitVec 32) List!25493) Bool)

(assert (=> b!1166895 (= res!774043 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25490))))

(declare-fun b!1166896 () Bool)

(declare-fun res!774045 () Bool)

(assert (=> b!1166896 (=> (not res!774045) (not e!663269))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166896 (= res!774045 (and (= (size!36892 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36891 _keys!1208) (size!36892 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45758 () Bool)

(declare-fun mapRes!45758 () Bool)

(assert (=> mapIsEmpty!45758 mapRes!45758))

(declare-fun b!1166897 () Bool)

(declare-fun e!663267 () Bool)

(assert (=> b!1166897 (= e!663272 (and e!663267 mapRes!45758))))

(declare-fun condMapEmpty!45758 () Bool)

(declare-fun mapDefault!45758 () ValueCell!13935)

(assert (=> b!1166897 (= condMapEmpty!45758 (= (arr!36356 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13935)) mapDefault!45758)))))

(declare-fun b!1166898 () Bool)

(declare-fun res!774038 () Bool)

(assert (=> b!1166898 (=> (not res!774038) (not e!663268))))

(declare-fun lt!525427 () array!75409)

(assert (=> b!1166898 (= res!774038 (arrayNoDuplicates!0 lt!525427 #b00000000000000000000000000000000 Nil!25490))))

(declare-fun mapNonEmpty!45758 () Bool)

(declare-fun tp!86988 () Bool)

(assert (=> mapNonEmpty!45758 (= mapRes!45758 (and tp!86988 e!663273))))

(declare-fun mapKey!45758 () (_ BitVec 32))

(declare-fun mapRest!45758 () (Array (_ BitVec 32) ValueCell!13935))

(declare-fun mapValue!45758 () ValueCell!13935)

(assert (=> mapNonEmpty!45758 (= (arr!36356 _values!996) (store mapRest!45758 mapKey!45758 mapValue!45758))))

(declare-fun b!1166899 () Bool)

(assert (=> b!1166899 (= e!663269 e!663268)))

(declare-fun res!774041 () Bool)

(assert (=> b!1166899 (=> (not res!774041) (not e!663268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75409 (_ BitVec 32)) Bool)

(assert (=> b!1166899 (= res!774041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525427 mask!1564))))

(assert (=> b!1166899 (= lt!525427 (array!75410 (store (arr!36355 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36891 _keys!1208)))))

(declare-fun b!1166900 () Bool)

(assert (=> b!1166900 (= e!663267 tp_is_empty!29289)))

(declare-fun b!1166901 () Bool)

(declare-fun res!774046 () Bool)

(assert (=> b!1166901 (=> (not res!774046) (not e!663269))))

(assert (=> b!1166901 (= res!774046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166902 () Bool)

(declare-fun res!774037 () Bool)

(assert (=> b!1166902 (=> (not res!774037) (not e!663269))))

(assert (=> b!1166902 (= res!774037 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36891 _keys!1208))))))

(declare-fun b!1166903 () Bool)

(declare-fun e!663271 () Bool)

(assert (=> b!1166903 (= e!663266 e!663271)))

(declare-fun res!774042 () Bool)

(assert (=> b!1166903 (=> res!774042 e!663271)))

(assert (=> b!1166903 (= res!774042 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525426 () array!75411)

(declare-fun minValue!944 () V!44179)

(declare-datatypes ((tuple2!18752 0))(
  ( (tuple2!18753 (_1!9387 (_ BitVec 64)) (_2!9387 V!44179)) )
))
(declare-datatypes ((List!25494 0))(
  ( (Nil!25491) (Cons!25490 (h!26699 tuple2!18752) (t!37245 List!25494)) )
))
(declare-datatypes ((ListLongMap!16721 0))(
  ( (ListLongMap!16722 (toList!8376 List!25494)) )
))
(declare-fun lt!525429 () ListLongMap!16721)

(declare-fun zeroValue!944 () V!44179)

(declare-fun getCurrentListMapNoExtraKeys!4840 (array!75409 array!75411 (_ BitVec 32) (_ BitVec 32) V!44179 V!44179 (_ BitVec 32) Int) ListLongMap!16721)

(assert (=> b!1166903 (= lt!525429 (getCurrentListMapNoExtraKeys!4840 lt!525427 lt!525426 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2826 (Int (_ BitVec 64)) V!44179)

(assert (=> b!1166903 (= lt!525426 (array!75412 (store (arr!36356 _values!996) i!673 (ValueCellFull!13935 (dynLambda!2826 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36892 _values!996)))))

(declare-fun lt!525424 () ListLongMap!16721)

(assert (=> b!1166903 (= lt!525424 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166904 () Bool)

(assert (=> b!1166904 (= e!663271 true)))

(declare-fun -!1452 (ListLongMap!16721 (_ BitVec 64)) ListLongMap!16721)

(assert (=> b!1166904 (= (getCurrentListMapNoExtraKeys!4840 lt!525427 lt!525426 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1452 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525428 () Unit!38506)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!679 (array!75409 array!75411 (_ BitVec 32) (_ BitVec 32) V!44179 V!44179 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38506)

(assert (=> b!1166904 (= lt!525428 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!679 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99154 res!774039) b!1166893))

(assert (= (and b!1166893 res!774047) b!1166896))

(assert (= (and b!1166896 res!774045) b!1166901))

(assert (= (and b!1166901 res!774046) b!1166895))

(assert (= (and b!1166895 res!774043) b!1166902))

(assert (= (and b!1166902 res!774037) b!1166894))

(assert (= (and b!1166894 res!774044) b!1166891))

(assert (= (and b!1166891 res!774040) b!1166899))

(assert (= (and b!1166899 res!774041) b!1166898))

(assert (= (and b!1166898 res!774038) b!1166892))

(assert (= (and b!1166892 (not res!774036)) b!1166903))

(assert (= (and b!1166903 (not res!774042)) b!1166904))

(assert (= (and b!1166897 condMapEmpty!45758) mapIsEmpty!45758))

(assert (= (and b!1166897 (not condMapEmpty!45758)) mapNonEmpty!45758))

(get-info :version)

(assert (= (and mapNonEmpty!45758 ((_ is ValueCellFull!13935) mapValue!45758)) b!1166890))

(assert (= (and b!1166897 ((_ is ValueCellFull!13935) mapDefault!45758)) b!1166900))

(assert (= start!99154 b!1166897))

(declare-fun b_lambda!19865 () Bool)

(assert (=> (not b_lambda!19865) (not b!1166903)))

(declare-fun t!37243 () Bool)

(declare-fun tb!9571 () Bool)

(assert (=> (and start!99154 (= defaultEntry!1004 defaultEntry!1004) t!37243) tb!9571))

(declare-fun result!19707 () Bool)

(assert (=> tb!9571 (= result!19707 tp_is_empty!29289)))

(assert (=> b!1166903 t!37243))

(declare-fun b_and!40369 () Bool)

(assert (= b_and!40367 (and (=> t!37243 result!19707) b_and!40369)))

(declare-fun m!1074881 () Bool)

(assert (=> b!1166898 m!1074881))

(declare-fun m!1074883 () Bool)

(assert (=> mapNonEmpty!45758 m!1074883))

(declare-fun m!1074885 () Bool)

(assert (=> start!99154 m!1074885))

(declare-fun m!1074887 () Bool)

(assert (=> start!99154 m!1074887))

(declare-fun m!1074889 () Bool)

(assert (=> b!1166892 m!1074889))

(declare-fun m!1074891 () Bool)

(assert (=> b!1166892 m!1074891))

(declare-fun m!1074893 () Bool)

(assert (=> b!1166901 m!1074893))

(declare-fun m!1074895 () Bool)

(assert (=> b!1166895 m!1074895))

(declare-fun m!1074897 () Bool)

(assert (=> b!1166893 m!1074897))

(declare-fun m!1074899 () Bool)

(assert (=> b!1166904 m!1074899))

(declare-fun m!1074901 () Bool)

(assert (=> b!1166904 m!1074901))

(assert (=> b!1166904 m!1074901))

(declare-fun m!1074903 () Bool)

(assert (=> b!1166904 m!1074903))

(declare-fun m!1074905 () Bool)

(assert (=> b!1166904 m!1074905))

(declare-fun m!1074907 () Bool)

(assert (=> b!1166894 m!1074907))

(declare-fun m!1074909 () Bool)

(assert (=> b!1166903 m!1074909))

(declare-fun m!1074911 () Bool)

(assert (=> b!1166903 m!1074911))

(declare-fun m!1074913 () Bool)

(assert (=> b!1166903 m!1074913))

(declare-fun m!1074915 () Bool)

(assert (=> b!1166903 m!1074915))

(declare-fun m!1074917 () Bool)

(assert (=> b!1166899 m!1074917))

(declare-fun m!1074919 () Bool)

(assert (=> b!1166899 m!1074919))

(declare-fun m!1074921 () Bool)

(assert (=> b!1166891 m!1074921))

(check-sat (not start!99154) (not b!1166895) (not b!1166904) tp_is_empty!29289 (not b!1166892) (not b!1166901) (not b!1166893) b_and!40369 (not b_lambda!19865) (not b!1166899) (not mapNonEmpty!45758) (not b_next!24759) (not b!1166898) (not b!1166903) (not b!1166894))
(check-sat b_and!40369 (not b_next!24759))
