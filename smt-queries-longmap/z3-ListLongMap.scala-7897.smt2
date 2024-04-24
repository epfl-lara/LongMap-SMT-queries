; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98362 () Bool)

(assert start!98362)

(declare-fun b_free!23827 () Bool)

(declare-fun b_next!23827 () Bool)

(assert (=> start!98362 (= b_free!23827 (not b_next!23827))))

(declare-fun tp!84185 () Bool)

(declare-fun b_and!38447 () Bool)

(assert (=> start!98362 (= tp!84185 b_and!38447)))

(declare-fun mapIsEmpty!44353 () Bool)

(declare-fun mapRes!44353 () Bool)

(assert (=> mapIsEmpty!44353 mapRes!44353))

(declare-fun b!1129082 () Bool)

(declare-fun res!754169 () Bool)

(declare-fun e!642727 () Bool)

(assert (=> b!1129082 (=> (not res!754169) (not e!642727))))

(declare-datatypes ((array!73619 0))(
  ( (array!73620 (arr!35456 (Array (_ BitVec 32) (_ BitVec 64))) (size!35993 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73619)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1129082 (= res!754169 (= (select (arr!35456 _keys!1208) i!673) k0!934))))

(declare-fun b!1129083 () Bool)

(declare-fun e!642726 () Bool)

(declare-fun e!642730 () Bool)

(assert (=> b!1129083 (= e!642726 e!642730)))

(declare-fun res!754165 () Bool)

(assert (=> b!1129083 (=> res!754165 e!642730)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1129083 (= res!754165 (not (= (select (arr!35456 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642732 () Bool)

(assert (=> b!1129083 e!642732))

(declare-fun c!110141 () Bool)

(assert (=> b!1129083 (= c!110141 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42937 0))(
  ( (V!42938 (val!14235 Int)) )
))
(declare-fun zeroValue!944 () V!42937)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13469 0))(
  ( (ValueCellFull!13469 (v!16864 V!42937)) (EmptyCell!13469) )
))
(declare-datatypes ((array!73621 0))(
  ( (array!73622 (arr!35457 (Array (_ BitVec 32) ValueCell!13469)) (size!35994 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73621)

(declare-fun minValue!944 () V!42937)

(declare-datatypes ((Unit!36937 0))(
  ( (Unit!36938) )
))
(declare-fun lt!501223 () Unit!36937)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!400 (array!73619 array!73621 (_ BitVec 32) (_ BitVec 32) V!42937 V!42937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36937)

(assert (=> b!1129083 (= lt!501223 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!501220 () array!73619)

(declare-fun lt!501225 () array!73621)

(declare-datatypes ((tuple2!17926 0))(
  ( (tuple2!17927 (_1!8974 (_ BitVec 64)) (_2!8974 V!42937)) )
))
(declare-datatypes ((List!24707 0))(
  ( (Nil!24704) (Cons!24703 (h!25921 tuple2!17926) (t!35518 List!24707)) )
))
(declare-datatypes ((ListLongMap!15903 0))(
  ( (ListLongMap!15904 (toList!7967 List!24707)) )
))
(declare-fun call!47831 () ListLongMap!15903)

(declare-fun bm!47827 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4487 (array!73619 array!73621 (_ BitVec 32) (_ BitVec 32) V!42937 V!42937 (_ BitVec 32) Int) ListLongMap!15903)

(assert (=> bm!47827 (= call!47831 (getCurrentListMapNoExtraKeys!4487 lt!501220 lt!501225 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129084 () Bool)

(declare-fun call!47830 () ListLongMap!15903)

(declare-fun -!1139 (ListLongMap!15903 (_ BitVec 64)) ListLongMap!15903)

(assert (=> b!1129084 (= e!642732 (= call!47831 (-!1139 call!47830 k0!934)))))

(declare-fun b!1129085 () Bool)

(declare-fun res!754162 () Bool)

(assert (=> b!1129085 (=> (not res!754162) (not e!642727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73619 (_ BitVec 32)) Bool)

(assert (=> b!1129085 (= res!754162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129086 () Bool)

(assert (=> b!1129086 (= e!642730 true)))

(declare-fun lt!501222 () Bool)

(declare-fun contains!6508 (ListLongMap!15903 (_ BitVec 64)) Bool)

(assert (=> b!1129086 (= lt!501222 (contains!6508 (getCurrentListMapNoExtraKeys!4487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129087 () Bool)

(declare-fun res!754168 () Bool)

(assert (=> b!1129087 (=> (not res!754168) (not e!642727))))

(declare-datatypes ((List!24708 0))(
  ( (Nil!24705) (Cons!24704 (h!25922 (_ BitVec 64)) (t!35519 List!24708)) )
))
(declare-fun arrayNoDuplicates!0 (array!73619 (_ BitVec 32) List!24708) Bool)

(assert (=> b!1129087 (= res!754168 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24705))))

(declare-fun b!1129088 () Bool)

(declare-fun res!754171 () Bool)

(assert (=> b!1129088 (=> (not res!754171) (not e!642727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129088 (= res!754171 (validKeyInArray!0 k0!934))))

(declare-fun res!754167 () Bool)

(assert (=> start!98362 (=> (not res!754167) (not e!642727))))

(assert (=> start!98362 (= res!754167 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35993 _keys!1208))))))

(assert (=> start!98362 e!642727))

(declare-fun tp_is_empty!28357 () Bool)

(assert (=> start!98362 tp_is_empty!28357))

(declare-fun array_inv!27262 (array!73619) Bool)

(assert (=> start!98362 (array_inv!27262 _keys!1208)))

(assert (=> start!98362 true))

(assert (=> start!98362 tp!84185))

(declare-fun e!642725 () Bool)

(declare-fun array_inv!27263 (array!73621) Bool)

(assert (=> start!98362 (and (array_inv!27263 _values!996) e!642725)))

(declare-fun b!1129089 () Bool)

(declare-fun res!754159 () Bool)

(assert (=> b!1129089 (=> (not res!754159) (not e!642727))))

(assert (=> b!1129089 (= res!754159 (and (= (size!35994 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35993 _keys!1208) (size!35994 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129090 () Bool)

(declare-fun e!642731 () Bool)

(assert (=> b!1129090 (= e!642731 tp_is_empty!28357)))

(declare-fun bm!47828 () Bool)

(assert (=> bm!47828 (= call!47830 (getCurrentListMapNoExtraKeys!4487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44353 () Bool)

(declare-fun tp!84184 () Bool)

(declare-fun e!642728 () Bool)

(assert (=> mapNonEmpty!44353 (= mapRes!44353 (and tp!84184 e!642728))))

(declare-fun mapValue!44353 () ValueCell!13469)

(declare-fun mapRest!44353 () (Array (_ BitVec 32) ValueCell!13469))

(declare-fun mapKey!44353 () (_ BitVec 32))

(assert (=> mapNonEmpty!44353 (= (arr!35457 _values!996) (store mapRest!44353 mapKey!44353 mapValue!44353))))

(declare-fun b!1129091 () Bool)

(declare-fun e!642723 () Bool)

(declare-fun e!642729 () Bool)

(assert (=> b!1129091 (= e!642723 (not e!642729))))

(declare-fun res!754163 () Bool)

(assert (=> b!1129091 (=> res!754163 e!642729)))

(assert (=> b!1129091 (= res!754163 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129091 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501226 () Unit!36937)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73619 (_ BitVec 64) (_ BitVec 32)) Unit!36937)

(assert (=> b!1129091 (= lt!501226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129092 () Bool)

(declare-fun res!754164 () Bool)

(assert (=> b!1129092 (=> (not res!754164) (not e!642727))))

(assert (=> b!1129092 (= res!754164 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35993 _keys!1208))))))

(declare-fun b!1129093 () Bool)

(declare-fun res!754166 () Bool)

(assert (=> b!1129093 (=> (not res!754166) (not e!642727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129093 (= res!754166 (validMask!0 mask!1564))))

(declare-fun b!1129094 () Bool)

(assert (=> b!1129094 (= e!642729 e!642726)))

(declare-fun res!754160 () Bool)

(assert (=> b!1129094 (=> res!754160 e!642726)))

(assert (=> b!1129094 (= res!754160 (not (= from!1455 i!673)))))

(declare-fun lt!501224 () ListLongMap!15903)

(assert (=> b!1129094 (= lt!501224 (getCurrentListMapNoExtraKeys!4487 lt!501220 lt!501225 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2555 (Int (_ BitVec 64)) V!42937)

(assert (=> b!1129094 (= lt!501225 (array!73622 (store (arr!35457 _values!996) i!673 (ValueCellFull!13469 (dynLambda!2555 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35994 _values!996)))))

(declare-fun lt!501221 () ListLongMap!15903)

(assert (=> b!1129094 (= lt!501221 (getCurrentListMapNoExtraKeys!4487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129095 () Bool)

(assert (=> b!1129095 (= e!642727 e!642723)))

(declare-fun res!754161 () Bool)

(assert (=> b!1129095 (=> (not res!754161) (not e!642723))))

(assert (=> b!1129095 (= res!754161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501220 mask!1564))))

(assert (=> b!1129095 (= lt!501220 (array!73620 (store (arr!35456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35993 _keys!1208)))))

(declare-fun b!1129096 () Bool)

(declare-fun res!754170 () Bool)

(assert (=> b!1129096 (=> (not res!754170) (not e!642723))))

(assert (=> b!1129096 (= res!754170 (arrayNoDuplicates!0 lt!501220 #b00000000000000000000000000000000 Nil!24705))))

(declare-fun b!1129097 () Bool)

(assert (=> b!1129097 (= e!642725 (and e!642731 mapRes!44353))))

(declare-fun condMapEmpty!44353 () Bool)

(declare-fun mapDefault!44353 () ValueCell!13469)

(assert (=> b!1129097 (= condMapEmpty!44353 (= (arr!35457 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13469)) mapDefault!44353)))))

(declare-fun b!1129098 () Bool)

(assert (=> b!1129098 (= e!642728 tp_is_empty!28357)))

(declare-fun b!1129099 () Bool)

(assert (=> b!1129099 (= e!642732 (= call!47831 call!47830))))

(assert (= (and start!98362 res!754167) b!1129093))

(assert (= (and b!1129093 res!754166) b!1129089))

(assert (= (and b!1129089 res!754159) b!1129085))

(assert (= (and b!1129085 res!754162) b!1129087))

(assert (= (and b!1129087 res!754168) b!1129092))

(assert (= (and b!1129092 res!754164) b!1129088))

(assert (= (and b!1129088 res!754171) b!1129082))

(assert (= (and b!1129082 res!754169) b!1129095))

(assert (= (and b!1129095 res!754161) b!1129096))

(assert (= (and b!1129096 res!754170) b!1129091))

(assert (= (and b!1129091 (not res!754163)) b!1129094))

(assert (= (and b!1129094 (not res!754160)) b!1129083))

(assert (= (and b!1129083 c!110141) b!1129084))

(assert (= (and b!1129083 (not c!110141)) b!1129099))

(assert (= (or b!1129084 b!1129099) bm!47827))

(assert (= (or b!1129084 b!1129099) bm!47828))

(assert (= (and b!1129083 (not res!754165)) b!1129086))

(assert (= (and b!1129097 condMapEmpty!44353) mapIsEmpty!44353))

(assert (= (and b!1129097 (not condMapEmpty!44353)) mapNonEmpty!44353))

(get-info :version)

(assert (= (and mapNonEmpty!44353 ((_ is ValueCellFull!13469) mapValue!44353)) b!1129098))

(assert (= (and b!1129097 ((_ is ValueCellFull!13469) mapDefault!44353)) b!1129090))

(assert (= start!98362 b!1129097))

(declare-fun b_lambda!18807 () Bool)

(assert (=> (not b_lambda!18807) (not b!1129094)))

(declare-fun t!35517 () Bool)

(declare-fun tb!8631 () Bool)

(assert (=> (and start!98362 (= defaultEntry!1004 defaultEntry!1004) t!35517) tb!8631))

(declare-fun result!17831 () Bool)

(assert (=> tb!8631 (= result!17831 tp_is_empty!28357)))

(assert (=> b!1129094 t!35517))

(declare-fun b_and!38449 () Bool)

(assert (= b_and!38447 (and (=> t!35517 result!17831) b_and!38449)))

(declare-fun m!1043151 () Bool)

(assert (=> start!98362 m!1043151))

(declare-fun m!1043153 () Bool)

(assert (=> start!98362 m!1043153))

(declare-fun m!1043155 () Bool)

(assert (=> b!1129088 m!1043155))

(declare-fun m!1043157 () Bool)

(assert (=> b!1129086 m!1043157))

(assert (=> b!1129086 m!1043157))

(declare-fun m!1043159 () Bool)

(assert (=> b!1129086 m!1043159))

(declare-fun m!1043161 () Bool)

(assert (=> b!1129093 m!1043161))

(declare-fun m!1043163 () Bool)

(assert (=> b!1129083 m!1043163))

(declare-fun m!1043165 () Bool)

(assert (=> b!1129083 m!1043165))

(declare-fun m!1043167 () Bool)

(assert (=> mapNonEmpty!44353 m!1043167))

(declare-fun m!1043169 () Bool)

(assert (=> b!1129095 m!1043169))

(declare-fun m!1043171 () Bool)

(assert (=> b!1129095 m!1043171))

(declare-fun m!1043173 () Bool)

(assert (=> b!1129094 m!1043173))

(declare-fun m!1043175 () Bool)

(assert (=> b!1129094 m!1043175))

(declare-fun m!1043177 () Bool)

(assert (=> b!1129094 m!1043177))

(declare-fun m!1043179 () Bool)

(assert (=> b!1129094 m!1043179))

(declare-fun m!1043181 () Bool)

(assert (=> b!1129084 m!1043181))

(declare-fun m!1043183 () Bool)

(assert (=> b!1129096 m!1043183))

(assert (=> bm!47828 m!1043157))

(declare-fun m!1043185 () Bool)

(assert (=> b!1129091 m!1043185))

(declare-fun m!1043187 () Bool)

(assert (=> b!1129091 m!1043187))

(declare-fun m!1043189 () Bool)

(assert (=> b!1129082 m!1043189))

(declare-fun m!1043191 () Bool)

(assert (=> b!1129087 m!1043191))

(declare-fun m!1043193 () Bool)

(assert (=> bm!47827 m!1043193))

(declare-fun m!1043195 () Bool)

(assert (=> b!1129085 m!1043195))

(check-sat (not start!98362) (not b!1129093) (not b_next!23827) (not b!1129086) (not b!1129087) (not b_lambda!18807) (not bm!47827) b_and!38449 (not b!1129094) (not b!1129095) (not b!1129088) (not b!1129091) (not mapNonEmpty!44353) (not b!1129085) (not bm!47828) tp_is_empty!28357 (not b!1129096) (not b!1129083) (not b!1129084))
(check-sat b_and!38449 (not b_next!23827))
