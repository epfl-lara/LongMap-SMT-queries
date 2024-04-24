; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100128 () Bool)

(assert start!100128)

(declare-fun b_free!25471 () Bool)

(declare-fun b_next!25471 () Bool)

(assert (=> start!100128 (= b_free!25471 (not b_next!25471))))

(declare-fun tp!89126 () Bool)

(declare-fun b_and!41811 () Bool)

(assert (=> start!100128 (= tp!89126 b_and!41811)))

(declare-fun b!1190031 () Bool)

(declare-fun res!790926 () Bool)

(declare-fun e!676726 () Bool)

(assert (=> b!1190031 (=> (not res!790926) (not e!676726))))

(declare-datatypes ((array!76841 0))(
  ( (array!76842 (arr!37064 (Array (_ BitVec 32) (_ BitVec 64))) (size!37601 (_ BitVec 32))) )
))
(declare-fun lt!541288 () array!76841)

(declare-datatypes ((List!26112 0))(
  ( (Nil!26109) (Cons!26108 (h!27326 (_ BitVec 64)) (t!38567 List!26112)) )
))
(declare-fun arrayNoDuplicates!0 (array!76841 (_ BitVec 32) List!26112) Bool)

(assert (=> b!1190031 (= res!790926 (arrayNoDuplicates!0 lt!541288 #b00000000000000000000000000000000 Nil!26109))))

(declare-fun b!1190032 () Bool)

(declare-fun e!676730 () Bool)

(assert (=> b!1190032 (= e!676730 true)))

(declare-datatypes ((V!45129 0))(
  ( (V!45130 (val!15057 Int)) )
))
(declare-fun zeroValue!944 () V!45129)

(declare-fun _keys!1208 () array!76841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45129)

(declare-datatypes ((ValueCell!14291 0))(
  ( (ValueCellFull!14291 (v!17691 V!45129)) (EmptyCell!14291) )
))
(declare-datatypes ((array!76843 0))(
  ( (array!76844 (arr!37065 (Array (_ BitVec 32) ValueCell!14291)) (size!37602 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76843)

(declare-fun lt!541287 () array!76843)

(declare-datatypes ((tuple2!19370 0))(
  ( (tuple2!19371 (_1!9696 (_ BitVec 64)) (_2!9696 V!45129)) )
))
(declare-datatypes ((List!26113 0))(
  ( (Nil!26110) (Cons!26109 (h!27327 tuple2!19370) (t!38568 List!26113)) )
))
(declare-datatypes ((ListLongMap!17347 0))(
  ( (ListLongMap!17348 (toList!8689 List!26113)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5157 (array!76841 array!76843 (_ BitVec 32) (_ BitVec 32) V!45129 V!45129 (_ BitVec 32) Int) ListLongMap!17347)

(declare-fun -!1706 (ListLongMap!17347 (_ BitVec 64)) ListLongMap!17347)

(assert (=> b!1190032 (= (getCurrentListMapNoExtraKeys!5157 lt!541288 lt!541287 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1706 (getCurrentListMapNoExtraKeys!5157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39417 0))(
  ( (Unit!39418) )
))
(declare-fun lt!541284 () Unit!39417)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!921 (array!76841 array!76843 (_ BitVec 32) (_ BitVec 32) V!45129 V!45129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39417)

(assert (=> b!1190032 (= lt!541284 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!921 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190033 () Bool)

(declare-fun res!790923 () Bool)

(declare-fun e!676727 () Bool)

(assert (=> b!1190033 (=> (not res!790923) (not e!676727))))

(assert (=> b!1190033 (= res!790923 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26109))))

(declare-fun b!1190034 () Bool)

(declare-fun res!790931 () Bool)

(assert (=> b!1190034 (=> (not res!790931) (not e!676727))))

(assert (=> b!1190034 (= res!790931 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37601 _keys!1208))))))

(declare-fun b!1190035 () Bool)

(declare-fun e!676724 () Bool)

(declare-fun tp_is_empty!30001 () Bool)

(assert (=> b!1190035 (= e!676724 tp_is_empty!30001)))

(declare-fun b!1190036 () Bool)

(declare-fun e!676723 () Bool)

(declare-fun e!676728 () Bool)

(declare-fun mapRes!46829 () Bool)

(assert (=> b!1190036 (= e!676723 (and e!676728 mapRes!46829))))

(declare-fun condMapEmpty!46829 () Bool)

(declare-fun mapDefault!46829 () ValueCell!14291)

(assert (=> b!1190036 (= condMapEmpty!46829 (= (arr!37065 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14291)) mapDefault!46829)))))

(declare-fun b!1190037 () Bool)

(declare-fun res!790928 () Bool)

(assert (=> b!1190037 (=> (not res!790928) (not e!676727))))

(assert (=> b!1190037 (= res!790928 (and (= (size!37602 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37601 _keys!1208) (size!37602 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190038 () Bool)

(assert (=> b!1190038 (= e!676728 tp_is_empty!30001)))

(declare-fun b!1190039 () Bool)

(declare-fun e!676725 () Bool)

(assert (=> b!1190039 (= e!676725 e!676730)))

(declare-fun res!790925 () Bool)

(assert (=> b!1190039 (=> res!790925 e!676730)))

(assert (=> b!1190039 (= res!790925 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541285 () ListLongMap!17347)

(assert (=> b!1190039 (= lt!541285 (getCurrentListMapNoExtraKeys!5157 lt!541288 lt!541287 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3115 (Int (_ BitVec 64)) V!45129)

(assert (=> b!1190039 (= lt!541287 (array!76844 (store (arr!37065 _values!996) i!673 (ValueCellFull!14291 (dynLambda!3115 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37602 _values!996)))))

(declare-fun lt!541286 () ListLongMap!17347)

(assert (=> b!1190039 (= lt!541286 (getCurrentListMapNoExtraKeys!5157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190040 () Bool)

(declare-fun res!790929 () Bool)

(assert (=> b!1190040 (=> (not res!790929) (not e!676727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76841 (_ BitVec 32)) Bool)

(assert (=> b!1190040 (= res!790929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190041 () Bool)

(assert (=> b!1190041 (= e!676726 (not e!676725))))

(declare-fun res!790927 () Bool)

(assert (=> b!1190041 (=> res!790927 e!676725)))

(assert (=> b!1190041 (= res!790927 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190041 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541283 () Unit!39417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76841 (_ BitVec 64) (_ BitVec 32)) Unit!39417)

(assert (=> b!1190041 (= lt!541283 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46829 () Bool)

(declare-fun tp!89127 () Bool)

(assert (=> mapNonEmpty!46829 (= mapRes!46829 (and tp!89127 e!676724))))

(declare-fun mapRest!46829 () (Array (_ BitVec 32) ValueCell!14291))

(declare-fun mapKey!46829 () (_ BitVec 32))

(declare-fun mapValue!46829 () ValueCell!14291)

(assert (=> mapNonEmpty!46829 (= (arr!37065 _values!996) (store mapRest!46829 mapKey!46829 mapValue!46829))))

(declare-fun res!790920 () Bool)

(assert (=> start!100128 (=> (not res!790920) (not e!676727))))

(assert (=> start!100128 (= res!790920 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37601 _keys!1208))))))

(assert (=> start!100128 e!676727))

(assert (=> start!100128 tp_is_empty!30001))

(declare-fun array_inv!28342 (array!76841) Bool)

(assert (=> start!100128 (array_inv!28342 _keys!1208)))

(assert (=> start!100128 true))

(assert (=> start!100128 tp!89126))

(declare-fun array_inv!28343 (array!76843) Bool)

(assert (=> start!100128 (and (array_inv!28343 _values!996) e!676723)))

(declare-fun b!1190042 () Bool)

(assert (=> b!1190042 (= e!676727 e!676726)))

(declare-fun res!790921 () Bool)

(assert (=> b!1190042 (=> (not res!790921) (not e!676726))))

(assert (=> b!1190042 (= res!790921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541288 mask!1564))))

(assert (=> b!1190042 (= lt!541288 (array!76842 (store (arr!37064 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37601 _keys!1208)))))

(declare-fun b!1190043 () Bool)

(declare-fun res!790924 () Bool)

(assert (=> b!1190043 (=> (not res!790924) (not e!676727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190043 (= res!790924 (validKeyInArray!0 k0!934))))

(declare-fun b!1190044 () Bool)

(declare-fun res!790922 () Bool)

(assert (=> b!1190044 (=> (not res!790922) (not e!676727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190044 (= res!790922 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46829 () Bool)

(assert (=> mapIsEmpty!46829 mapRes!46829))

(declare-fun b!1190045 () Bool)

(declare-fun res!790930 () Bool)

(assert (=> b!1190045 (=> (not res!790930) (not e!676727))))

(assert (=> b!1190045 (= res!790930 (= (select (arr!37064 _keys!1208) i!673) k0!934))))

(assert (= (and start!100128 res!790920) b!1190044))

(assert (= (and b!1190044 res!790922) b!1190037))

(assert (= (and b!1190037 res!790928) b!1190040))

(assert (= (and b!1190040 res!790929) b!1190033))

(assert (= (and b!1190033 res!790923) b!1190034))

(assert (= (and b!1190034 res!790931) b!1190043))

(assert (= (and b!1190043 res!790924) b!1190045))

(assert (= (and b!1190045 res!790930) b!1190042))

(assert (= (and b!1190042 res!790921) b!1190031))

(assert (= (and b!1190031 res!790926) b!1190041))

(assert (= (and b!1190041 (not res!790927)) b!1190039))

(assert (= (and b!1190039 (not res!790925)) b!1190032))

(assert (= (and b!1190036 condMapEmpty!46829) mapIsEmpty!46829))

(assert (= (and b!1190036 (not condMapEmpty!46829)) mapNonEmpty!46829))

(get-info :version)

(assert (= (and mapNonEmpty!46829 ((_ is ValueCellFull!14291) mapValue!46829)) b!1190035))

(assert (= (and b!1190036 ((_ is ValueCellFull!14291) mapDefault!46829)) b!1190038))

(assert (= start!100128 b!1190036))

(declare-fun b_lambda!20609 () Bool)

(assert (=> (not b_lambda!20609) (not b!1190039)))

(declare-fun t!38566 () Bool)

(declare-fun tb!10275 () Bool)

(assert (=> (and start!100128 (= defaultEntry!1004 defaultEntry!1004) t!38566) tb!10275))

(declare-fun result!21125 () Bool)

(assert (=> tb!10275 (= result!21125 tp_is_empty!30001)))

(assert (=> b!1190039 t!38566))

(declare-fun b_and!41813 () Bool)

(assert (= b_and!41811 (and (=> t!38566 result!21125) b_and!41813)))

(declare-fun m!1099065 () Bool)

(assert (=> b!1190045 m!1099065))

(declare-fun m!1099067 () Bool)

(assert (=> b!1190039 m!1099067))

(declare-fun m!1099069 () Bool)

(assert (=> b!1190039 m!1099069))

(declare-fun m!1099071 () Bool)

(assert (=> b!1190039 m!1099071))

(declare-fun m!1099073 () Bool)

(assert (=> b!1190039 m!1099073))

(declare-fun m!1099075 () Bool)

(assert (=> b!1190032 m!1099075))

(declare-fun m!1099077 () Bool)

(assert (=> b!1190032 m!1099077))

(assert (=> b!1190032 m!1099077))

(declare-fun m!1099079 () Bool)

(assert (=> b!1190032 m!1099079))

(declare-fun m!1099081 () Bool)

(assert (=> b!1190032 m!1099081))

(declare-fun m!1099083 () Bool)

(assert (=> mapNonEmpty!46829 m!1099083))

(declare-fun m!1099085 () Bool)

(assert (=> b!1190041 m!1099085))

(declare-fun m!1099087 () Bool)

(assert (=> b!1190041 m!1099087))

(declare-fun m!1099089 () Bool)

(assert (=> b!1190043 m!1099089))

(declare-fun m!1099091 () Bool)

(assert (=> start!100128 m!1099091))

(declare-fun m!1099093 () Bool)

(assert (=> start!100128 m!1099093))

(declare-fun m!1099095 () Bool)

(assert (=> b!1190040 m!1099095))

(declare-fun m!1099097 () Bool)

(assert (=> b!1190033 m!1099097))

(declare-fun m!1099099 () Bool)

(assert (=> b!1190031 m!1099099))

(declare-fun m!1099101 () Bool)

(assert (=> b!1190044 m!1099101))

(declare-fun m!1099103 () Bool)

(assert (=> b!1190042 m!1099103))

(declare-fun m!1099105 () Bool)

(assert (=> b!1190042 m!1099105))

(check-sat (not start!100128) b_and!41813 tp_is_empty!30001 (not b!1190031) (not b!1190044) (not b_next!25471) (not b!1190039) (not b!1190033) (not b_lambda!20609) (not b!1190042) (not b!1190041) (not b!1190032) (not b!1190043) (not mapNonEmpty!46829) (not b!1190040))
(check-sat b_and!41813 (not b_next!25471))
