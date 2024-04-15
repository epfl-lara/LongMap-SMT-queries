; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99934 () Bool)

(assert start!99934)

(declare-fun b_free!25519 () Bool)

(declare-fun b_next!25519 () Bool)

(assert (=> start!99934 (= b_free!25519 (not b_next!25519))))

(declare-fun tp!89271 () Bool)

(declare-fun b_and!41883 () Bool)

(assert (=> start!99934 (= tp!89271 b_and!41883)))

(declare-fun b!1189746 () Bool)

(declare-fun e!676396 () Bool)

(declare-fun tp_is_empty!30049 () Bool)

(assert (=> b!1189746 (= e!676396 tp_is_empty!30049)))

(declare-fun b!1189747 () Bool)

(declare-fun res!791217 () Bool)

(declare-fun e!676391 () Bool)

(assert (=> b!1189747 (=> (not res!791217) (not e!676391))))

(declare-datatypes ((array!76826 0))(
  ( (array!76827 (arr!37063 (Array (_ BitVec 32) (_ BitVec 64))) (size!37601 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76826)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76826 (_ BitVec 32)) Bool)

(assert (=> b!1189747 (= res!791217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!791221 () Bool)

(assert (=> start!99934 (=> (not res!791221) (not e!676391))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99934 (= res!791221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37601 _keys!1208))))))

(assert (=> start!99934 e!676391))

(assert (=> start!99934 tp_is_empty!30049))

(declare-fun array_inv!28394 (array!76826) Bool)

(assert (=> start!99934 (array_inv!28394 _keys!1208)))

(assert (=> start!99934 true))

(assert (=> start!99934 tp!89271))

(declare-datatypes ((V!45193 0))(
  ( (V!45194 (val!15081 Int)) )
))
(declare-datatypes ((ValueCell!14315 0))(
  ( (ValueCellFull!14315 (v!17718 V!45193)) (EmptyCell!14315) )
))
(declare-datatypes ((array!76828 0))(
  ( (array!76829 (arr!37064 (Array (_ BitVec 32) ValueCell!14315)) (size!37602 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76828)

(declare-fun e!676389 () Bool)

(declare-fun array_inv!28395 (array!76828) Bool)

(assert (=> start!99934 (and (array_inv!28395 _values!996) e!676389)))

(declare-fun b!1189748 () Bool)

(declare-fun res!791214 () Bool)

(assert (=> b!1189748 (=> (not res!791214) (not e!676391))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189748 (= res!791214 (validKeyInArray!0 k0!934))))

(declare-fun b!1189749 () Bool)

(declare-fun e!676393 () Bool)

(assert (=> b!1189749 (= e!676393 true)))

(declare-fun zeroValue!944 () V!45193)

(declare-fun lt!541042 () array!76826)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!45193)

(declare-fun lt!541041 () array!76828)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19488 0))(
  ( (tuple2!19489 (_1!9755 (_ BitVec 64)) (_2!9755 V!45193)) )
))
(declare-datatypes ((List!26201 0))(
  ( (Nil!26198) (Cons!26197 (h!27406 tuple2!19488) (t!38703 List!26201)) )
))
(declare-datatypes ((ListLongMap!17457 0))(
  ( (ListLongMap!17458 (toList!8744 List!26201)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5194 (array!76826 array!76828 (_ BitVec 32) (_ BitVec 32) V!45193 V!45193 (_ BitVec 32) Int) ListLongMap!17457)

(declare-fun -!1690 (ListLongMap!17457 (_ BitVec 64)) ListLongMap!17457)

(assert (=> b!1189749 (= (getCurrentListMapNoExtraKeys!5194 lt!541042 lt!541041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1690 (getCurrentListMapNoExtraKeys!5194 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39349 0))(
  ( (Unit!39350) )
))
(declare-fun lt!541043 () Unit!39349)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!940 (array!76826 array!76828 (_ BitVec 32) (_ BitVec 32) V!45193 V!45193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39349)

(assert (=> b!1189749 (= lt!541043 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!940 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189750 () Bool)

(declare-fun res!791212 () Bool)

(assert (=> b!1189750 (=> (not res!791212) (not e!676391))))

(assert (=> b!1189750 (= res!791212 (= (select (arr!37063 _keys!1208) i!673) k0!934))))

(declare-fun b!1189751 () Bool)

(declare-fun e!676390 () Bool)

(assert (=> b!1189751 (= e!676391 e!676390)))

(declare-fun res!791219 () Bool)

(assert (=> b!1189751 (=> (not res!791219) (not e!676390))))

(assert (=> b!1189751 (= res!791219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541042 mask!1564))))

(assert (=> b!1189751 (= lt!541042 (array!76827 (store (arr!37063 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37601 _keys!1208)))))

(declare-fun b!1189752 () Bool)

(declare-fun e!676394 () Bool)

(declare-fun mapRes!46901 () Bool)

(assert (=> b!1189752 (= e!676389 (and e!676394 mapRes!46901))))

(declare-fun condMapEmpty!46901 () Bool)

(declare-fun mapDefault!46901 () ValueCell!14315)

(assert (=> b!1189752 (= condMapEmpty!46901 (= (arr!37064 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14315)) mapDefault!46901)))))

(declare-fun b!1189753 () Bool)

(declare-fun res!791218 () Bool)

(assert (=> b!1189753 (=> (not res!791218) (not e!676391))))

(assert (=> b!1189753 (= res!791218 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37601 _keys!1208))))))

(declare-fun mapIsEmpty!46901 () Bool)

(assert (=> mapIsEmpty!46901 mapRes!46901))

(declare-fun b!1189754 () Bool)

(declare-fun res!791210 () Bool)

(assert (=> b!1189754 (=> (not res!791210) (not e!676391))))

(declare-datatypes ((List!26202 0))(
  ( (Nil!26199) (Cons!26198 (h!27407 (_ BitVec 64)) (t!38704 List!26202)) )
))
(declare-fun arrayNoDuplicates!0 (array!76826 (_ BitVec 32) List!26202) Bool)

(assert (=> b!1189754 (= res!791210 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26199))))

(declare-fun mapNonEmpty!46901 () Bool)

(declare-fun tp!89270 () Bool)

(assert (=> mapNonEmpty!46901 (= mapRes!46901 (and tp!89270 e!676396))))

(declare-fun mapRest!46901 () (Array (_ BitVec 32) ValueCell!14315))

(declare-fun mapValue!46901 () ValueCell!14315)

(declare-fun mapKey!46901 () (_ BitVec 32))

(assert (=> mapNonEmpty!46901 (= (arr!37064 _values!996) (store mapRest!46901 mapKey!46901 mapValue!46901))))

(declare-fun b!1189755 () Bool)

(declare-fun res!791211 () Bool)

(assert (=> b!1189755 (=> (not res!791211) (not e!676390))))

(assert (=> b!1189755 (= res!791211 (arrayNoDuplicates!0 lt!541042 #b00000000000000000000000000000000 Nil!26199))))

(declare-fun b!1189756 () Bool)

(declare-fun e!676395 () Bool)

(assert (=> b!1189756 (= e!676390 (not e!676395))))

(declare-fun res!791213 () Bool)

(assert (=> b!1189756 (=> res!791213 e!676395)))

(assert (=> b!1189756 (= res!791213 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189756 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541040 () Unit!39349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76826 (_ BitVec 64) (_ BitVec 32)) Unit!39349)

(assert (=> b!1189756 (= lt!541040 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189757 () Bool)

(assert (=> b!1189757 (= e!676395 e!676393)))

(declare-fun res!791215 () Bool)

(assert (=> b!1189757 (=> res!791215 e!676393)))

(assert (=> b!1189757 (= res!791215 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541044 () ListLongMap!17457)

(assert (=> b!1189757 (= lt!541044 (getCurrentListMapNoExtraKeys!5194 lt!541042 lt!541041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3088 (Int (_ BitVec 64)) V!45193)

(assert (=> b!1189757 (= lt!541041 (array!76829 (store (arr!37064 _values!996) i!673 (ValueCellFull!14315 (dynLambda!3088 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37602 _values!996)))))

(declare-fun lt!541039 () ListLongMap!17457)

(assert (=> b!1189757 (= lt!541039 (getCurrentListMapNoExtraKeys!5194 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189758 () Bool)

(assert (=> b!1189758 (= e!676394 tp_is_empty!30049)))

(declare-fun b!1189759 () Bool)

(declare-fun res!791220 () Bool)

(assert (=> b!1189759 (=> (not res!791220) (not e!676391))))

(assert (=> b!1189759 (= res!791220 (and (= (size!37602 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37601 _keys!1208) (size!37602 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189760 () Bool)

(declare-fun res!791216 () Bool)

(assert (=> b!1189760 (=> (not res!791216) (not e!676391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189760 (= res!791216 (validMask!0 mask!1564))))

(assert (= (and start!99934 res!791221) b!1189760))

(assert (= (and b!1189760 res!791216) b!1189759))

(assert (= (and b!1189759 res!791220) b!1189747))

(assert (= (and b!1189747 res!791217) b!1189754))

(assert (= (and b!1189754 res!791210) b!1189753))

(assert (= (and b!1189753 res!791218) b!1189748))

(assert (= (and b!1189748 res!791214) b!1189750))

(assert (= (and b!1189750 res!791212) b!1189751))

(assert (= (and b!1189751 res!791219) b!1189755))

(assert (= (and b!1189755 res!791211) b!1189756))

(assert (= (and b!1189756 (not res!791213)) b!1189757))

(assert (= (and b!1189757 (not res!791215)) b!1189749))

(assert (= (and b!1189752 condMapEmpty!46901) mapIsEmpty!46901))

(assert (= (and b!1189752 (not condMapEmpty!46901)) mapNonEmpty!46901))

(get-info :version)

(assert (= (and mapNonEmpty!46901 ((_ is ValueCellFull!14315) mapValue!46901)) b!1189746))

(assert (= (and b!1189752 ((_ is ValueCellFull!14315) mapDefault!46901)) b!1189758))

(assert (= start!99934 b!1189752))

(declare-fun b_lambda!20645 () Bool)

(assert (=> (not b_lambda!20645) (not b!1189757)))

(declare-fun t!38702 () Bool)

(declare-fun tb!10323 () Bool)

(assert (=> (and start!99934 (= defaultEntry!1004 defaultEntry!1004) t!38702) tb!10323))

(declare-fun result!21221 () Bool)

(assert (=> tb!10323 (= result!21221 tp_is_empty!30049)))

(assert (=> b!1189757 t!38702))

(declare-fun b_and!41885 () Bool)

(assert (= b_and!41883 (and (=> t!38702 result!21221) b_and!41885)))

(declare-fun m!1097891 () Bool)

(assert (=> b!1189748 m!1097891))

(declare-fun m!1097893 () Bool)

(assert (=> b!1189750 m!1097893))

(declare-fun m!1097895 () Bool)

(assert (=> mapNonEmpty!46901 m!1097895))

(declare-fun m!1097897 () Bool)

(assert (=> b!1189754 m!1097897))

(declare-fun m!1097899 () Bool)

(assert (=> b!1189760 m!1097899))

(declare-fun m!1097901 () Bool)

(assert (=> b!1189751 m!1097901))

(declare-fun m!1097903 () Bool)

(assert (=> b!1189751 m!1097903))

(declare-fun m!1097905 () Bool)

(assert (=> b!1189755 m!1097905))

(declare-fun m!1097907 () Bool)

(assert (=> b!1189747 m!1097907))

(declare-fun m!1097909 () Bool)

(assert (=> b!1189757 m!1097909))

(declare-fun m!1097911 () Bool)

(assert (=> b!1189757 m!1097911))

(declare-fun m!1097913 () Bool)

(assert (=> b!1189757 m!1097913))

(declare-fun m!1097915 () Bool)

(assert (=> b!1189757 m!1097915))

(declare-fun m!1097917 () Bool)

(assert (=> b!1189756 m!1097917))

(declare-fun m!1097919 () Bool)

(assert (=> b!1189756 m!1097919))

(declare-fun m!1097921 () Bool)

(assert (=> start!99934 m!1097921))

(declare-fun m!1097923 () Bool)

(assert (=> start!99934 m!1097923))

(declare-fun m!1097925 () Bool)

(assert (=> b!1189749 m!1097925))

(declare-fun m!1097927 () Bool)

(assert (=> b!1189749 m!1097927))

(assert (=> b!1189749 m!1097927))

(declare-fun m!1097929 () Bool)

(assert (=> b!1189749 m!1097929))

(declare-fun m!1097931 () Bool)

(assert (=> b!1189749 m!1097931))

(check-sat (not b!1189757) b_and!41885 (not b!1189751) (not mapNonEmpty!46901) (not b!1189747) (not b!1189755) (not b!1189749) (not b_lambda!20645) (not b_next!25519) (not b!1189756) (not start!99934) (not b!1189754) tp_is_empty!30049 (not b!1189748) (not b!1189760))
(check-sat b_and!41885 (not b_next!25519))
