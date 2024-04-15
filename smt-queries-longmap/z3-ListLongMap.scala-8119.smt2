; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99574 () Bool)

(assert start!99574)

(declare-fun b_free!25159 () Bool)

(declare-fun b_next!25159 () Bool)

(assert (=> start!99574 (= b_free!25159 (not b_next!25159))))

(declare-fun tp!88190 () Bool)

(declare-fun b_and!41163 () Bool)

(assert (=> start!99574 (= tp!88190 b_and!41163)))

(declare-fun b!1178886 () Bool)

(declare-fun e!670208 () Bool)

(declare-fun e!670198 () Bool)

(assert (=> b!1178886 (= e!670208 (not e!670198))))

(declare-fun res!783212 () Bool)

(assert (=> b!1178886 (=> res!783212 e!670198)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178886 (= res!783212 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76116 0))(
  ( (array!76117 (arr!36708 (Array (_ BitVec 32) (_ BitVec 64))) (size!37246 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76116)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178886 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38802 0))(
  ( (Unit!38803) )
))
(declare-fun lt!532554 () Unit!38802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76116 (_ BitVec 64) (_ BitVec 32)) Unit!38802)

(assert (=> b!1178886 (= lt!532554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178887 () Bool)

(declare-fun res!783217 () Bool)

(declare-fun e!670206 () Bool)

(assert (=> b!1178887 (=> (not res!783217) (not e!670206))))

(assert (=> b!1178887 (= res!783217 (= (select (arr!36708 _keys!1208) i!673) k0!934))))

(declare-datatypes ((V!44713 0))(
  ( (V!44714 (val!14901 Int)) )
))
(declare-datatypes ((tuple2!19182 0))(
  ( (tuple2!19183 (_1!9602 (_ BitVec 64)) (_2!9602 V!44713)) )
))
(declare-datatypes ((List!25889 0))(
  ( (Nil!25886) (Cons!25885 (h!27094 tuple2!19182) (t!38031 List!25889)) )
))
(declare-datatypes ((ListLongMap!17151 0))(
  ( (ListLongMap!17152 (toList!8591 List!25889)) )
))
(declare-fun lt!532560 () ListLongMap!17151)

(declare-fun e!670210 () Bool)

(declare-fun b!1178888 () Bool)

(declare-fun lt!532553 () ListLongMap!17151)

(declare-fun lt!532563 () tuple2!19182)

(declare-fun +!3892 (ListLongMap!17151 tuple2!19182) ListLongMap!17151)

(assert (=> b!1178888 (= e!670210 (= lt!532553 (+!3892 lt!532560 lt!532563)))))

(declare-fun b!1178889 () Bool)

(declare-fun res!783211 () Bool)

(assert (=> b!1178889 (=> (not res!783211) (not e!670206))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14135 0))(
  ( (ValueCellFull!14135 (v!17538 V!44713)) (EmptyCell!14135) )
))
(declare-datatypes ((array!76118 0))(
  ( (array!76119 (arr!36709 (Array (_ BitVec 32) ValueCell!14135)) (size!37247 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76118)

(assert (=> b!1178889 (= res!783211 (and (= (size!37247 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37246 _keys!1208) (size!37247 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46361 () Bool)

(declare-fun mapRes!46361 () Bool)

(assert (=> mapIsEmpty!46361 mapRes!46361))

(declare-fun b!1178890 () Bool)

(declare-fun e!670200 () Bool)

(assert (=> b!1178890 (= e!670200 true)))

(assert (=> b!1178890 e!670210))

(declare-fun res!783219 () Bool)

(assert (=> b!1178890 (=> (not res!783219) (not e!670210))))

(assert (=> b!1178890 (= res!783219 (not (= (select (arr!36708 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532558 () Unit!38802)

(declare-fun e!670201 () Unit!38802)

(assert (=> b!1178890 (= lt!532558 e!670201)))

(declare-fun c!116836 () Bool)

(assert (=> b!1178890 (= c!116836 (= (select (arr!36708 _keys!1208) from!1455) k0!934))))

(declare-fun e!670199 () Bool)

(assert (=> b!1178890 e!670199))

(declare-fun res!783208 () Bool)

(assert (=> b!1178890 (=> (not res!783208) (not e!670199))))

(declare-fun lt!532552 () ListLongMap!17151)

(declare-fun lt!532562 () ListLongMap!17151)

(assert (=> b!1178890 (= res!783208 (= lt!532562 (+!3892 lt!532552 lt!532563)))))

(declare-fun lt!532557 () V!44713)

(declare-fun get!18771 (ValueCell!14135 V!44713) V!44713)

(assert (=> b!1178890 (= lt!532563 (tuple2!19183 (select (arr!36708 _keys!1208) from!1455) (get!18771 (select (arr!36709 _values!996) from!1455) lt!532557)))))

(declare-fun b!1178891 () Bool)

(declare-fun e!670209 () Bool)

(assert (=> b!1178891 (= e!670209 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46361 () Bool)

(declare-fun tp!88191 () Bool)

(declare-fun e!670207 () Bool)

(assert (=> mapNonEmpty!46361 (= mapRes!46361 (and tp!88191 e!670207))))

(declare-fun mapKey!46361 () (_ BitVec 32))

(declare-fun mapRest!46361 () (Array (_ BitVec 32) ValueCell!14135))

(declare-fun mapValue!46361 () ValueCell!14135)

(assert (=> mapNonEmpty!46361 (= (arr!36709 _values!996) (store mapRest!46361 mapKey!46361 mapValue!46361))))

(declare-fun b!1178892 () Bool)

(declare-fun res!783209 () Bool)

(assert (=> b!1178892 (=> (not res!783209) (not e!670208))))

(declare-fun lt!532564 () array!76116)

(declare-datatypes ((List!25890 0))(
  ( (Nil!25887) (Cons!25886 (h!27095 (_ BitVec 64)) (t!38032 List!25890)) )
))
(declare-fun arrayNoDuplicates!0 (array!76116 (_ BitVec 32) List!25890) Bool)

(assert (=> b!1178892 (= res!783209 (arrayNoDuplicates!0 lt!532564 #b00000000000000000000000000000000 Nil!25887))))

(declare-fun b!1178893 () Bool)

(assert (=> b!1178893 (= e!670199 e!670209)))

(declare-fun res!783215 () Bool)

(assert (=> b!1178893 (=> res!783215 e!670209)))

(assert (=> b!1178893 (= res!783215 (not (= (select (arr!36708 _keys!1208) from!1455) k0!934)))))

(declare-fun res!783221 () Bool)

(assert (=> start!99574 (=> (not res!783221) (not e!670206))))

(assert (=> start!99574 (= res!783221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37246 _keys!1208))))))

(assert (=> start!99574 e!670206))

(declare-fun tp_is_empty!29689 () Bool)

(assert (=> start!99574 tp_is_empty!29689))

(declare-fun array_inv!28140 (array!76116) Bool)

(assert (=> start!99574 (array_inv!28140 _keys!1208)))

(assert (=> start!99574 true))

(assert (=> start!99574 tp!88190))

(declare-fun e!670204 () Bool)

(declare-fun array_inv!28141 (array!76118) Bool)

(assert (=> start!99574 (and (array_inv!28141 _values!996) e!670204)))

(declare-fun b!1178894 () Bool)

(assert (=> b!1178894 (= e!670206 e!670208)))

(declare-fun res!783222 () Bool)

(assert (=> b!1178894 (=> (not res!783222) (not e!670208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76116 (_ BitVec 32)) Bool)

(assert (=> b!1178894 (= res!783222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532564 mask!1564))))

(assert (=> b!1178894 (= lt!532564 (array!76117 (store (arr!36708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37246 _keys!1208)))))

(declare-fun b!1178895 () Bool)

(assert (=> b!1178895 (= e!670207 tp_is_empty!29689)))

(declare-fun b!1178896 () Bool)

(declare-fun res!783218 () Bool)

(assert (=> b!1178896 (=> (not res!783218) (not e!670206))))

(assert (=> b!1178896 (= res!783218 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37246 _keys!1208))))))

(declare-fun b!1178897 () Bool)

(declare-fun res!783210 () Bool)

(assert (=> b!1178897 (=> (not res!783210) (not e!670206))))

(assert (=> b!1178897 (= res!783210 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25887))))

(declare-fun b!1178898 () Bool)

(declare-fun e!670205 () Bool)

(assert (=> b!1178898 (= e!670204 (and e!670205 mapRes!46361))))

(declare-fun condMapEmpty!46361 () Bool)

(declare-fun mapDefault!46361 () ValueCell!14135)

(assert (=> b!1178898 (= condMapEmpty!46361 (= (arr!36709 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14135)) mapDefault!46361)))))

(declare-fun b!1178899 () Bool)

(assert (=> b!1178899 (= e!670205 tp_is_empty!29689)))

(declare-fun b!1178900 () Bool)

(declare-fun Unit!38804 () Unit!38802)

(assert (=> b!1178900 (= e!670201 Unit!38804)))

(declare-fun lt!532565 () Unit!38802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76116 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38802)

(assert (=> b!1178900 (= lt!532565 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178900 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532555 () Unit!38802)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76116 (_ BitVec 32) (_ BitVec 32)) Unit!38802)

(assert (=> b!1178900 (= lt!532555 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178900 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25887)))

(declare-fun lt!532559 () Unit!38802)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76116 (_ BitVec 64) (_ BitVec 32) List!25890) Unit!38802)

(assert (=> b!1178900 (= lt!532559 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25887))))

(assert (=> b!1178900 false))

(declare-fun b!1178901 () Bool)

(declare-fun res!783220 () Bool)

(assert (=> b!1178901 (=> (not res!783220) (not e!670206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178901 (= res!783220 (validMask!0 mask!1564))))

(declare-fun b!1178902 () Bool)

(declare-fun e!670203 () Bool)

(assert (=> b!1178902 (= e!670198 e!670203)))

(declare-fun res!783214 () Bool)

(assert (=> b!1178902 (=> res!783214 e!670203)))

(assert (=> b!1178902 (= res!783214 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44713)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532561 () array!76118)

(declare-fun minValue!944 () V!44713)

(declare-fun getCurrentListMapNoExtraKeys!5052 (array!76116 array!76118 (_ BitVec 32) (_ BitVec 32) V!44713 V!44713 (_ BitVec 32) Int) ListLongMap!17151)

(assert (=> b!1178902 (= lt!532562 (getCurrentListMapNoExtraKeys!5052 lt!532564 lt!532561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178902 (= lt!532561 (array!76119 (store (arr!36709 _values!996) i!673 (ValueCellFull!14135 lt!532557)) (size!37247 _values!996)))))

(declare-fun dynLambda!2965 (Int (_ BitVec 64)) V!44713)

(assert (=> b!1178902 (= lt!532557 (dynLambda!2965 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178902 (= lt!532553 (getCurrentListMapNoExtraKeys!5052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178903 () Bool)

(declare-fun Unit!38805 () Unit!38802)

(assert (=> b!1178903 (= e!670201 Unit!38805)))

(declare-fun b!1178904 () Bool)

(declare-fun res!783223 () Bool)

(assert (=> b!1178904 (=> (not res!783223) (not e!670206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178904 (= res!783223 (validKeyInArray!0 k0!934))))

(declare-fun b!1178905 () Bool)

(declare-fun res!783213 () Bool)

(assert (=> b!1178905 (=> (not res!783213) (not e!670206))))

(assert (=> b!1178905 (= res!783213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178906 () Bool)

(assert (=> b!1178906 (= e!670203 e!670200)))

(declare-fun res!783216 () Bool)

(assert (=> b!1178906 (=> res!783216 e!670200)))

(assert (=> b!1178906 (= res!783216 (not (validKeyInArray!0 (select (arr!36708 _keys!1208) from!1455))))))

(declare-fun lt!532566 () ListLongMap!17151)

(assert (=> b!1178906 (= lt!532566 lt!532552)))

(declare-fun -!1559 (ListLongMap!17151 (_ BitVec 64)) ListLongMap!17151)

(assert (=> b!1178906 (= lt!532552 (-!1559 lt!532560 k0!934))))

(assert (=> b!1178906 (= lt!532566 (getCurrentListMapNoExtraKeys!5052 lt!532564 lt!532561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178906 (= lt!532560 (getCurrentListMapNoExtraKeys!5052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532556 () Unit!38802)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!823 (array!76116 array!76118 (_ BitVec 32) (_ BitVec 32) V!44713 V!44713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38802)

(assert (=> b!1178906 (= lt!532556 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99574 res!783221) b!1178901))

(assert (= (and b!1178901 res!783220) b!1178889))

(assert (= (and b!1178889 res!783211) b!1178905))

(assert (= (and b!1178905 res!783213) b!1178897))

(assert (= (and b!1178897 res!783210) b!1178896))

(assert (= (and b!1178896 res!783218) b!1178904))

(assert (= (and b!1178904 res!783223) b!1178887))

(assert (= (and b!1178887 res!783217) b!1178894))

(assert (= (and b!1178894 res!783222) b!1178892))

(assert (= (and b!1178892 res!783209) b!1178886))

(assert (= (and b!1178886 (not res!783212)) b!1178902))

(assert (= (and b!1178902 (not res!783214)) b!1178906))

(assert (= (and b!1178906 (not res!783216)) b!1178890))

(assert (= (and b!1178890 res!783208) b!1178893))

(assert (= (and b!1178893 (not res!783215)) b!1178891))

(assert (= (and b!1178890 c!116836) b!1178900))

(assert (= (and b!1178890 (not c!116836)) b!1178903))

(assert (= (and b!1178890 res!783219) b!1178888))

(assert (= (and b!1178898 condMapEmpty!46361) mapIsEmpty!46361))

(assert (= (and b!1178898 (not condMapEmpty!46361)) mapNonEmpty!46361))

(get-info :version)

(assert (= (and mapNonEmpty!46361 ((_ is ValueCellFull!14135) mapValue!46361)) b!1178895))

(assert (= (and b!1178898 ((_ is ValueCellFull!14135) mapDefault!46361)) b!1178899))

(assert (= start!99574 b!1178898))

(declare-fun b_lambda!20285 () Bool)

(assert (=> (not b_lambda!20285) (not b!1178902)))

(declare-fun t!38030 () Bool)

(declare-fun tb!9963 () Bool)

(assert (=> (and start!99574 (= defaultEntry!1004 defaultEntry!1004) t!38030) tb!9963))

(declare-fun result!20501 () Bool)

(assert (=> tb!9963 (= result!20501 tp_is_empty!29689)))

(assert (=> b!1178902 t!38030))

(declare-fun b_and!41165 () Bool)

(assert (= b_and!41163 (and (=> t!38030 result!20501) b_and!41165)))

(declare-fun m!1086371 () Bool)

(assert (=> b!1178887 m!1086371))

(declare-fun m!1086373 () Bool)

(assert (=> b!1178894 m!1086373))

(declare-fun m!1086375 () Bool)

(assert (=> b!1178894 m!1086375))

(declare-fun m!1086377 () Bool)

(assert (=> b!1178897 m!1086377))

(declare-fun m!1086379 () Bool)

(assert (=> b!1178900 m!1086379))

(declare-fun m!1086381 () Bool)

(assert (=> b!1178900 m!1086381))

(declare-fun m!1086383 () Bool)

(assert (=> b!1178900 m!1086383))

(declare-fun m!1086385 () Bool)

(assert (=> b!1178900 m!1086385))

(declare-fun m!1086387 () Bool)

(assert (=> b!1178900 m!1086387))

(declare-fun m!1086389 () Bool)

(assert (=> b!1178906 m!1086389))

(declare-fun m!1086391 () Bool)

(assert (=> b!1178906 m!1086391))

(declare-fun m!1086393 () Bool)

(assert (=> b!1178906 m!1086393))

(declare-fun m!1086395 () Bool)

(assert (=> b!1178906 m!1086395))

(assert (=> b!1178906 m!1086393))

(declare-fun m!1086397 () Bool)

(assert (=> b!1178906 m!1086397))

(declare-fun m!1086399 () Bool)

(assert (=> b!1178906 m!1086399))

(declare-fun m!1086401 () Bool)

(assert (=> b!1178891 m!1086401))

(declare-fun m!1086403 () Bool)

(assert (=> b!1178904 m!1086403))

(assert (=> b!1178893 m!1086393))

(declare-fun m!1086405 () Bool)

(assert (=> b!1178892 m!1086405))

(declare-fun m!1086407 () Bool)

(assert (=> b!1178888 m!1086407))

(assert (=> b!1178890 m!1086393))

(declare-fun m!1086409 () Bool)

(assert (=> b!1178890 m!1086409))

(declare-fun m!1086411 () Bool)

(assert (=> b!1178890 m!1086411))

(assert (=> b!1178890 m!1086411))

(declare-fun m!1086413 () Bool)

(assert (=> b!1178890 m!1086413))

(declare-fun m!1086415 () Bool)

(assert (=> start!99574 m!1086415))

(declare-fun m!1086417 () Bool)

(assert (=> start!99574 m!1086417))

(declare-fun m!1086419 () Bool)

(assert (=> b!1178901 m!1086419))

(declare-fun m!1086421 () Bool)

(assert (=> mapNonEmpty!46361 m!1086421))

(declare-fun m!1086423 () Bool)

(assert (=> b!1178902 m!1086423))

(declare-fun m!1086425 () Bool)

(assert (=> b!1178902 m!1086425))

(declare-fun m!1086427 () Bool)

(assert (=> b!1178902 m!1086427))

(declare-fun m!1086429 () Bool)

(assert (=> b!1178902 m!1086429))

(declare-fun m!1086431 () Bool)

(assert (=> b!1178905 m!1086431))

(declare-fun m!1086433 () Bool)

(assert (=> b!1178886 m!1086433))

(declare-fun m!1086435 () Bool)

(assert (=> b!1178886 m!1086435))

(check-sat (not start!99574) (not b_next!25159) (not b!1178900) (not b!1178891) (not b!1178902) (not b!1178890) (not b!1178886) (not b!1178897) tp_is_empty!29689 (not mapNonEmpty!46361) (not b!1178904) (not b!1178905) (not b!1178906) (not b!1178888) (not b!1178894) b_and!41165 (not b_lambda!20285) (not b!1178892) (not b!1178901))
(check-sat b_and!41165 (not b_next!25159))
