; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99940 () Bool)

(assert start!99940)

(declare-fun b_free!25525 () Bool)

(declare-fun b_next!25525 () Bool)

(assert (=> start!99940 (= b_free!25525 (not b_next!25525))))

(declare-fun tp!89288 () Bool)

(declare-fun b_and!41895 () Bool)

(assert (=> start!99940 (= tp!89288 b_and!41895)))

(declare-fun b!1189887 () Bool)

(declare-fun res!791320 () Bool)

(declare-fun e!676466 () Bool)

(assert (=> b!1189887 (=> (not res!791320) (not e!676466))))

(declare-datatypes ((array!76838 0))(
  ( (array!76839 (arr!37069 (Array (_ BitVec 32) (_ BitVec 64))) (size!37607 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76838)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1189887 (= res!791320 (= (select (arr!37069 _keys!1208) i!673) k0!934))))

(declare-fun b!1189888 () Bool)

(declare-fun e!676463 () Bool)

(declare-fun e!676467 () Bool)

(assert (=> b!1189888 (= e!676463 (not e!676467))))

(declare-fun res!791325 () Bool)

(assert (=> b!1189888 (=> res!791325 e!676467)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189888 (= res!791325 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189888 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39353 0))(
  ( (Unit!39354) )
))
(declare-fun lt!541094 () Unit!39353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76838 (_ BitVec 64) (_ BitVec 32)) Unit!39353)

(assert (=> b!1189888 (= lt!541094 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189889 () Bool)

(declare-fun e!676461 () Bool)

(declare-fun tp_is_empty!30055 () Bool)

(assert (=> b!1189889 (= e!676461 tp_is_empty!30055)))

(declare-fun b!1189890 () Bool)

(declare-fun res!791326 () Bool)

(assert (=> b!1189890 (=> (not res!791326) (not e!676466))))

(declare-datatypes ((List!26205 0))(
  ( (Nil!26202) (Cons!26201 (h!27410 (_ BitVec 64)) (t!38713 List!26205)) )
))
(declare-fun arrayNoDuplicates!0 (array!76838 (_ BitVec 32) List!26205) Bool)

(assert (=> b!1189890 (= res!791326 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26202))))

(declare-fun b!1189891 () Bool)

(declare-fun res!791319 () Bool)

(assert (=> b!1189891 (=> (not res!791319) (not e!676466))))

(assert (=> b!1189891 (= res!791319 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37607 _keys!1208))))))

(declare-fun b!1189892 () Bool)

(declare-fun e!676468 () Bool)

(declare-fun mapRes!46910 () Bool)

(assert (=> b!1189892 (= e!676468 (and e!676461 mapRes!46910))))

(declare-fun condMapEmpty!46910 () Bool)

(declare-datatypes ((V!45201 0))(
  ( (V!45202 (val!15084 Int)) )
))
(declare-datatypes ((ValueCell!14318 0))(
  ( (ValueCellFull!14318 (v!17721 V!45201)) (EmptyCell!14318) )
))
(declare-datatypes ((array!76840 0))(
  ( (array!76841 (arr!37070 (Array (_ BitVec 32) ValueCell!14318)) (size!37608 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76840)

(declare-fun mapDefault!46910 () ValueCell!14318)

(assert (=> b!1189892 (= condMapEmpty!46910 (= (arr!37070 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14318)) mapDefault!46910)))))

(declare-fun b!1189893 () Bool)

(declare-fun e!676462 () Bool)

(assert (=> b!1189893 (= e!676462 true)))

(declare-fun zeroValue!944 () V!45201)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!541098 () array!76840)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541097 () array!76838)

(declare-fun minValue!944 () V!45201)

(declare-datatypes ((tuple2!19492 0))(
  ( (tuple2!19493 (_1!9757 (_ BitVec 64)) (_2!9757 V!45201)) )
))
(declare-datatypes ((List!26206 0))(
  ( (Nil!26203) (Cons!26202 (h!27411 tuple2!19492) (t!38714 List!26206)) )
))
(declare-datatypes ((ListLongMap!17461 0))(
  ( (ListLongMap!17462 (toList!8746 List!26206)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5196 (array!76838 array!76840 (_ BitVec 32) (_ BitVec 32) V!45201 V!45201 (_ BitVec 32) Int) ListLongMap!17461)

(declare-fun -!1692 (ListLongMap!17461 (_ BitVec 64)) ListLongMap!17461)

(assert (=> b!1189893 (= (getCurrentListMapNoExtraKeys!5196 lt!541097 lt!541098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1692 (getCurrentListMapNoExtraKeys!5196 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541093 () Unit!39353)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!942 (array!76838 array!76840 (_ BitVec 32) (_ BitVec 32) V!45201 V!45201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39353)

(assert (=> b!1189893 (= lt!541093 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!942 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!791324 () Bool)

(assert (=> start!99940 (=> (not res!791324) (not e!676466))))

(assert (=> start!99940 (= res!791324 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37607 _keys!1208))))))

(assert (=> start!99940 e!676466))

(assert (=> start!99940 tp_is_empty!30055))

(declare-fun array_inv!28400 (array!76838) Bool)

(assert (=> start!99940 (array_inv!28400 _keys!1208)))

(assert (=> start!99940 true))

(assert (=> start!99940 tp!89288))

(declare-fun array_inv!28401 (array!76840) Bool)

(assert (=> start!99940 (and (array_inv!28401 _values!996) e!676468)))

(declare-fun b!1189894 () Bool)

(declare-fun res!791322 () Bool)

(assert (=> b!1189894 (=> (not res!791322) (not e!676466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189894 (= res!791322 (validKeyInArray!0 k0!934))))

(declare-fun b!1189895 () Bool)

(declare-fun res!791321 () Bool)

(assert (=> b!1189895 (=> (not res!791321) (not e!676466))))

(assert (=> b!1189895 (= res!791321 (and (= (size!37608 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37607 _keys!1208) (size!37608 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189896 () Bool)

(declare-fun e!676464 () Bool)

(assert (=> b!1189896 (= e!676464 tp_is_empty!30055)))

(declare-fun b!1189897 () Bool)

(declare-fun res!791328 () Bool)

(assert (=> b!1189897 (=> (not res!791328) (not e!676466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76838 (_ BitVec 32)) Bool)

(assert (=> b!1189897 (= res!791328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46910 () Bool)

(declare-fun tp!89289 () Bool)

(assert (=> mapNonEmpty!46910 (= mapRes!46910 (and tp!89289 e!676464))))

(declare-fun mapValue!46910 () ValueCell!14318)

(declare-fun mapRest!46910 () (Array (_ BitVec 32) ValueCell!14318))

(declare-fun mapKey!46910 () (_ BitVec 32))

(assert (=> mapNonEmpty!46910 (= (arr!37070 _values!996) (store mapRest!46910 mapKey!46910 mapValue!46910))))

(declare-fun b!1189898 () Bool)

(declare-fun res!791329 () Bool)

(assert (=> b!1189898 (=> (not res!791329) (not e!676466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189898 (= res!791329 (validMask!0 mask!1564))))

(declare-fun b!1189899 () Bool)

(declare-fun res!791318 () Bool)

(assert (=> b!1189899 (=> (not res!791318) (not e!676463))))

(assert (=> b!1189899 (= res!791318 (arrayNoDuplicates!0 lt!541097 #b00000000000000000000000000000000 Nil!26202))))

(declare-fun b!1189900 () Bool)

(assert (=> b!1189900 (= e!676466 e!676463)))

(declare-fun res!791323 () Bool)

(assert (=> b!1189900 (=> (not res!791323) (not e!676463))))

(assert (=> b!1189900 (= res!791323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541097 mask!1564))))

(assert (=> b!1189900 (= lt!541097 (array!76839 (store (arr!37069 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37607 _keys!1208)))))

(declare-fun mapIsEmpty!46910 () Bool)

(assert (=> mapIsEmpty!46910 mapRes!46910))

(declare-fun b!1189901 () Bool)

(assert (=> b!1189901 (= e!676467 e!676462)))

(declare-fun res!791327 () Bool)

(assert (=> b!1189901 (=> res!791327 e!676462)))

(assert (=> b!1189901 (= res!791327 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541096 () ListLongMap!17461)

(assert (=> b!1189901 (= lt!541096 (getCurrentListMapNoExtraKeys!5196 lt!541097 lt!541098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3090 (Int (_ BitVec 64)) V!45201)

(assert (=> b!1189901 (= lt!541098 (array!76841 (store (arr!37070 _values!996) i!673 (ValueCellFull!14318 (dynLambda!3090 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37608 _values!996)))))

(declare-fun lt!541095 () ListLongMap!17461)

(assert (=> b!1189901 (= lt!541095 (getCurrentListMapNoExtraKeys!5196 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99940 res!791324) b!1189898))

(assert (= (and b!1189898 res!791329) b!1189895))

(assert (= (and b!1189895 res!791321) b!1189897))

(assert (= (and b!1189897 res!791328) b!1189890))

(assert (= (and b!1189890 res!791326) b!1189891))

(assert (= (and b!1189891 res!791319) b!1189894))

(assert (= (and b!1189894 res!791322) b!1189887))

(assert (= (and b!1189887 res!791320) b!1189900))

(assert (= (and b!1189900 res!791323) b!1189899))

(assert (= (and b!1189899 res!791318) b!1189888))

(assert (= (and b!1189888 (not res!791325)) b!1189901))

(assert (= (and b!1189901 (not res!791327)) b!1189893))

(assert (= (and b!1189892 condMapEmpty!46910) mapIsEmpty!46910))

(assert (= (and b!1189892 (not condMapEmpty!46910)) mapNonEmpty!46910))

(get-info :version)

(assert (= (and mapNonEmpty!46910 ((_ is ValueCellFull!14318) mapValue!46910)) b!1189896))

(assert (= (and b!1189892 ((_ is ValueCellFull!14318) mapDefault!46910)) b!1189889))

(assert (= start!99940 b!1189892))

(declare-fun b_lambda!20651 () Bool)

(assert (=> (not b_lambda!20651) (not b!1189901)))

(declare-fun t!38712 () Bool)

(declare-fun tb!10329 () Bool)

(assert (=> (and start!99940 (= defaultEntry!1004 defaultEntry!1004) t!38712) tb!10329))

(declare-fun result!21233 () Bool)

(assert (=> tb!10329 (= result!21233 tp_is_empty!30055)))

(assert (=> b!1189901 t!38712))

(declare-fun b_and!41897 () Bool)

(assert (= b_and!41895 (and (=> t!38712 result!21233) b_and!41897)))

(declare-fun m!1098017 () Bool)

(assert (=> b!1189900 m!1098017))

(declare-fun m!1098019 () Bool)

(assert (=> b!1189900 m!1098019))

(declare-fun m!1098021 () Bool)

(assert (=> b!1189894 m!1098021))

(declare-fun m!1098023 () Bool)

(assert (=> start!99940 m!1098023))

(declare-fun m!1098025 () Bool)

(assert (=> start!99940 m!1098025))

(declare-fun m!1098027 () Bool)

(assert (=> b!1189897 m!1098027))

(declare-fun m!1098029 () Bool)

(assert (=> b!1189901 m!1098029))

(declare-fun m!1098031 () Bool)

(assert (=> b!1189901 m!1098031))

(declare-fun m!1098033 () Bool)

(assert (=> b!1189901 m!1098033))

(declare-fun m!1098035 () Bool)

(assert (=> b!1189901 m!1098035))

(declare-fun m!1098037 () Bool)

(assert (=> mapNonEmpty!46910 m!1098037))

(declare-fun m!1098039 () Bool)

(assert (=> b!1189898 m!1098039))

(declare-fun m!1098041 () Bool)

(assert (=> b!1189888 m!1098041))

(declare-fun m!1098043 () Bool)

(assert (=> b!1189888 m!1098043))

(declare-fun m!1098045 () Bool)

(assert (=> b!1189890 m!1098045))

(declare-fun m!1098047 () Bool)

(assert (=> b!1189893 m!1098047))

(declare-fun m!1098049 () Bool)

(assert (=> b!1189893 m!1098049))

(assert (=> b!1189893 m!1098049))

(declare-fun m!1098051 () Bool)

(assert (=> b!1189893 m!1098051))

(declare-fun m!1098053 () Bool)

(assert (=> b!1189893 m!1098053))

(declare-fun m!1098055 () Bool)

(assert (=> b!1189887 m!1098055))

(declare-fun m!1098057 () Bool)

(assert (=> b!1189899 m!1098057))

(check-sat (not b!1189893) (not b!1189894) (not mapNonEmpty!46910) (not b!1189898) b_and!41897 (not b!1189897) (not b!1189890) (not b!1189899) (not b!1189888) tp_is_empty!30055 (not b_lambda!20651) (not b!1189900) (not start!99940) (not b_next!25525) (not b!1189901))
(check-sat b_and!41897 (not b_next!25525))
