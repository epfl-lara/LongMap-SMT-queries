; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99918 () Bool)

(assert start!99918)

(declare-fun b_free!25261 () Bool)

(declare-fun b_next!25261 () Bool)

(assert (=> start!99918 (= b_free!25261 (not b_next!25261))))

(declare-fun tp!88496 () Bool)

(declare-fun b_and!41391 () Bool)

(assert (=> start!99918 (= tp!88496 b_and!41391)))

(declare-fun res!786284 () Bool)

(declare-fun e!673069 () Bool)

(assert (=> start!99918 (=> (not res!786284) (not e!673069))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76433 0))(
  ( (array!76434 (arr!36860 (Array (_ BitVec 32) (_ BitVec 64))) (size!37397 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76433)

(assert (=> start!99918 (= res!786284 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37397 _keys!1208))))))

(assert (=> start!99918 e!673069))

(declare-fun tp_is_empty!29791 () Bool)

(assert (=> start!99918 tp_is_empty!29791))

(declare-fun array_inv!28212 (array!76433) Bool)

(assert (=> start!99918 (array_inv!28212 _keys!1208)))

(assert (=> start!99918 true))

(assert (=> start!99918 tp!88496))

(declare-datatypes ((V!44849 0))(
  ( (V!44850 (val!14952 Int)) )
))
(declare-datatypes ((ValueCell!14186 0))(
  ( (ValueCellFull!14186 (v!17586 V!44849)) (EmptyCell!14186) )
))
(declare-datatypes ((array!76435 0))(
  ( (array!76436 (arr!36861 (Array (_ BitVec 32) ValueCell!14186)) (size!37398 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76435)

(declare-fun e!673064 () Bool)

(declare-fun array_inv!28213 (array!76435) Bool)

(assert (=> start!99918 (and (array_inv!28213 _values!996) e!673064)))

(declare-fun b!1183666 () Bool)

(declare-fun e!673068 () Bool)

(declare-fun e!673060 () Bool)

(assert (=> b!1183666 (= e!673068 e!673060)))

(declare-fun res!786290 () Bool)

(assert (=> b!1183666 (=> res!786290 e!673060)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183666 (= res!786290 (not (validKeyInArray!0 (select (arr!36860 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19206 0))(
  ( (tuple2!19207 (_1!9614 (_ BitVec 64)) (_2!9614 V!44849)) )
))
(declare-datatypes ((List!25937 0))(
  ( (Nil!25934) (Cons!25933 (h!27151 tuple2!19206) (t!38182 List!25937)) )
))
(declare-datatypes ((ListLongMap!17183 0))(
  ( (ListLongMap!17184 (toList!8607 List!25937)) )
))
(declare-fun lt!535676 () ListLongMap!17183)

(declare-fun lt!535680 () ListLongMap!17183)

(assert (=> b!1183666 (= lt!535676 lt!535680)))

(declare-fun lt!535692 () ListLongMap!17183)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1629 (ListLongMap!17183 (_ BitVec 64)) ListLongMap!17183)

(assert (=> b!1183666 (= lt!535680 (-!1629 lt!535692 k0!934))))

(declare-fun zeroValue!944 () V!44849)

(declare-fun lt!535689 () array!76435)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44849)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!535693 () array!76433)

(declare-fun getCurrentListMapNoExtraKeys!5079 (array!76433 array!76435 (_ BitVec 32) (_ BitVec 32) V!44849 V!44849 (_ BitVec 32) Int) ListLongMap!17183)

(assert (=> b!1183666 (= lt!535676 (getCurrentListMapNoExtraKeys!5079 lt!535693 lt!535689 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183666 (= lt!535692 (getCurrentListMapNoExtraKeys!5079 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39115 0))(
  ( (Unit!39116) )
))
(declare-fun lt!535691 () Unit!39115)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!852 (array!76433 array!76435 (_ BitVec 32) (_ BitVec 32) V!44849 V!44849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39115)

(assert (=> b!1183666 (= lt!535691 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!852 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183667 () Bool)

(declare-fun res!786289 () Bool)

(assert (=> b!1183667 (=> (not res!786289) (not e!673069))))

(assert (=> b!1183667 (= res!786289 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37397 _keys!1208))))))

(declare-fun b!1183668 () Bool)

(declare-fun e!673067 () Bool)

(assert (=> b!1183668 (= e!673067 tp_is_empty!29791)))

(declare-fun b!1183669 () Bool)

(assert (=> b!1183669 (= e!673060 true)))

(declare-fun lt!535687 () ListLongMap!17183)

(declare-fun lt!535688 () ListLongMap!17183)

(assert (=> b!1183669 (= (-!1629 lt!535687 k0!934) lt!535688)))

(declare-fun lt!535677 () V!44849)

(declare-fun lt!535678 () Unit!39115)

(declare-fun addRemoveCommutativeForDiffKeys!144 (ListLongMap!17183 (_ BitVec 64) V!44849 (_ BitVec 64)) Unit!39115)

(assert (=> b!1183669 (= lt!535678 (addRemoveCommutativeForDiffKeys!144 lt!535692 (select (arr!36860 _keys!1208) from!1455) lt!535677 k0!934))))

(declare-fun lt!535684 () ListLongMap!17183)

(assert (=> b!1183669 (and (= lt!535684 lt!535687) (= lt!535680 lt!535676))))

(declare-fun lt!535690 () tuple2!19206)

(declare-fun +!3928 (ListLongMap!17183 tuple2!19206) ListLongMap!17183)

(assert (=> b!1183669 (= lt!535687 (+!3928 lt!535692 lt!535690))))

(assert (=> b!1183669 (not (= (select (arr!36860 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535679 () Unit!39115)

(declare-fun e!673066 () Unit!39115)

(assert (=> b!1183669 (= lt!535679 e!673066)))

(declare-fun c!117413 () Bool)

(assert (=> b!1183669 (= c!117413 (= (select (arr!36860 _keys!1208) from!1455) k0!934))))

(declare-fun e!673070 () Bool)

(assert (=> b!1183669 e!673070))

(declare-fun res!786291 () Bool)

(assert (=> b!1183669 (=> (not res!786291) (not e!673070))))

(declare-fun lt!535686 () ListLongMap!17183)

(assert (=> b!1183669 (= res!786291 (= lt!535686 lt!535688))))

(assert (=> b!1183669 (= lt!535688 (+!3928 lt!535680 lt!535690))))

(assert (=> b!1183669 (= lt!535690 (tuple2!19207 (select (arr!36860 _keys!1208) from!1455) lt!535677))))

(declare-fun lt!535683 () V!44849)

(declare-fun get!18893 (ValueCell!14186 V!44849) V!44849)

(assert (=> b!1183669 (= lt!535677 (get!18893 (select (arr!36861 _values!996) from!1455) lt!535683))))

(declare-fun mapIsEmpty!46514 () Bool)

(declare-fun mapRes!46514 () Bool)

(assert (=> mapIsEmpty!46514 mapRes!46514))

(declare-fun b!1183670 () Bool)

(declare-fun Unit!39117 () Unit!39115)

(assert (=> b!1183670 (= e!673066 Unit!39117)))

(declare-fun b!1183671 () Bool)

(declare-fun e!673063 () Bool)

(assert (=> b!1183671 (= e!673063 tp_is_empty!29791)))

(declare-fun b!1183672 () Bool)

(assert (=> b!1183672 (= e!673064 (and e!673067 mapRes!46514))))

(declare-fun condMapEmpty!46514 () Bool)

(declare-fun mapDefault!46514 () ValueCell!14186)

(assert (=> b!1183672 (= condMapEmpty!46514 (= (arr!36861 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14186)) mapDefault!46514)))))

(declare-fun b!1183673 () Bool)

(declare-fun Unit!39118 () Unit!39115)

(assert (=> b!1183673 (= e!673066 Unit!39118)))

(declare-fun lt!535685 () Unit!39115)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39115)

(assert (=> b!1183673 (= lt!535685 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183673 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535682 () Unit!39115)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76433 (_ BitVec 32) (_ BitVec 32)) Unit!39115)

(assert (=> b!1183673 (= lt!535682 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25938 0))(
  ( (Nil!25935) (Cons!25934 (h!27152 (_ BitVec 64)) (t!38183 List!25938)) )
))
(declare-fun arrayNoDuplicates!0 (array!76433 (_ BitVec 32) List!25938) Bool)

(assert (=> b!1183673 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25935)))

(declare-fun lt!535681 () Unit!39115)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76433 (_ BitVec 64) (_ BitVec 32) List!25938) Unit!39115)

(assert (=> b!1183673 (= lt!535681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25935))))

(assert (=> b!1183673 false))

(declare-fun b!1183674 () Bool)

(declare-fun res!786285 () Bool)

(assert (=> b!1183674 (=> (not res!786285) (not e!673069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76433 (_ BitVec 32)) Bool)

(assert (=> b!1183674 (= res!786285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!673065 () Bool)

(declare-fun b!1183675 () Bool)

(assert (=> b!1183675 (= e!673065 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183676 () Bool)

(declare-fun res!786293 () Bool)

(assert (=> b!1183676 (=> (not res!786293) (not e!673069))))

(assert (=> b!1183676 (= res!786293 (validKeyInArray!0 k0!934))))

(declare-fun b!1183677 () Bool)

(declare-fun res!786295 () Bool)

(declare-fun e!673061 () Bool)

(assert (=> b!1183677 (=> (not res!786295) (not e!673061))))

(assert (=> b!1183677 (= res!786295 (arrayNoDuplicates!0 lt!535693 #b00000000000000000000000000000000 Nil!25935))))

(declare-fun b!1183678 () Bool)

(declare-fun res!786287 () Bool)

(assert (=> b!1183678 (=> (not res!786287) (not e!673069))))

(assert (=> b!1183678 (= res!786287 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25935))))

(declare-fun b!1183679 () Bool)

(declare-fun res!786294 () Bool)

(assert (=> b!1183679 (=> (not res!786294) (not e!673069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183679 (= res!786294 (validMask!0 mask!1564))))

(declare-fun b!1183680 () Bool)

(declare-fun e!673059 () Bool)

(assert (=> b!1183680 (= e!673059 e!673068)))

(declare-fun res!786286 () Bool)

(assert (=> b!1183680 (=> res!786286 e!673068)))

(assert (=> b!1183680 (= res!786286 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183680 (= lt!535686 (getCurrentListMapNoExtraKeys!5079 lt!535693 lt!535689 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183680 (= lt!535689 (array!76436 (store (arr!36861 _values!996) i!673 (ValueCellFull!14186 lt!535683)) (size!37398 _values!996)))))

(declare-fun dynLambda!3044 (Int (_ BitVec 64)) V!44849)

(assert (=> b!1183680 (= lt!535683 (dynLambda!3044 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183680 (= lt!535684 (getCurrentListMapNoExtraKeys!5079 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183681 () Bool)

(declare-fun res!786282 () Bool)

(assert (=> b!1183681 (=> (not res!786282) (not e!673069))))

(assert (=> b!1183681 (= res!786282 (and (= (size!37398 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37397 _keys!1208) (size!37398 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183682 () Bool)

(assert (=> b!1183682 (= e!673061 (not e!673059))))

(declare-fun res!786283 () Bool)

(assert (=> b!1183682 (=> res!786283 e!673059)))

(assert (=> b!1183682 (= res!786283 (bvsgt from!1455 i!673))))

(assert (=> b!1183682 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535675 () Unit!39115)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76433 (_ BitVec 64) (_ BitVec 32)) Unit!39115)

(assert (=> b!1183682 (= lt!535675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46514 () Bool)

(declare-fun tp!88497 () Bool)

(assert (=> mapNonEmpty!46514 (= mapRes!46514 (and tp!88497 e!673063))))

(declare-fun mapRest!46514 () (Array (_ BitVec 32) ValueCell!14186))

(declare-fun mapKey!46514 () (_ BitVec 32))

(declare-fun mapValue!46514 () ValueCell!14186)

(assert (=> mapNonEmpty!46514 (= (arr!36861 _values!996) (store mapRest!46514 mapKey!46514 mapValue!46514))))

(declare-fun b!1183683 () Bool)

(assert (=> b!1183683 (= e!673070 e!673065)))

(declare-fun res!786296 () Bool)

(assert (=> b!1183683 (=> res!786296 e!673065)))

(assert (=> b!1183683 (= res!786296 (not (= (select (arr!36860 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183684 () Bool)

(assert (=> b!1183684 (= e!673069 e!673061)))

(declare-fun res!786292 () Bool)

(assert (=> b!1183684 (=> (not res!786292) (not e!673061))))

(assert (=> b!1183684 (= res!786292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535693 mask!1564))))

(assert (=> b!1183684 (= lt!535693 (array!76434 (store (arr!36860 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37397 _keys!1208)))))

(declare-fun b!1183685 () Bool)

(declare-fun res!786288 () Bool)

(assert (=> b!1183685 (=> (not res!786288) (not e!673069))))

(assert (=> b!1183685 (= res!786288 (= (select (arr!36860 _keys!1208) i!673) k0!934))))

(assert (= (and start!99918 res!786284) b!1183679))

(assert (= (and b!1183679 res!786294) b!1183681))

(assert (= (and b!1183681 res!786282) b!1183674))

(assert (= (and b!1183674 res!786285) b!1183678))

(assert (= (and b!1183678 res!786287) b!1183667))

(assert (= (and b!1183667 res!786289) b!1183676))

(assert (= (and b!1183676 res!786293) b!1183685))

(assert (= (and b!1183685 res!786288) b!1183684))

(assert (= (and b!1183684 res!786292) b!1183677))

(assert (= (and b!1183677 res!786295) b!1183682))

(assert (= (and b!1183682 (not res!786283)) b!1183680))

(assert (= (and b!1183680 (not res!786286)) b!1183666))

(assert (= (and b!1183666 (not res!786290)) b!1183669))

(assert (= (and b!1183669 res!786291) b!1183683))

(assert (= (and b!1183683 (not res!786296)) b!1183675))

(assert (= (and b!1183669 c!117413) b!1183673))

(assert (= (and b!1183669 (not c!117413)) b!1183670))

(assert (= (and b!1183672 condMapEmpty!46514) mapIsEmpty!46514))

(assert (= (and b!1183672 (not condMapEmpty!46514)) mapNonEmpty!46514))

(get-info :version)

(assert (= (and mapNonEmpty!46514 ((_ is ValueCellFull!14186) mapValue!46514)) b!1183671))

(assert (= (and b!1183672 ((_ is ValueCellFull!14186) mapDefault!46514)) b!1183668))

(assert (= start!99918 b!1183672))

(declare-fun b_lambda!20399 () Bool)

(assert (=> (not b_lambda!20399) (not b!1183680)))

(declare-fun t!38181 () Bool)

(declare-fun tb!10065 () Bool)

(assert (=> (and start!99918 (= defaultEntry!1004 defaultEntry!1004) t!38181) tb!10065))

(declare-fun result!20705 () Bool)

(assert (=> tb!10065 (= result!20705 tp_is_empty!29791)))

(assert (=> b!1183680 t!38181))

(declare-fun b_and!41393 () Bool)

(assert (= b_and!41391 (and (=> t!38181 result!20705) b_and!41393)))

(declare-fun m!1091967 () Bool)

(assert (=> b!1183666 m!1091967))

(declare-fun m!1091969 () Bool)

(assert (=> b!1183666 m!1091969))

(declare-fun m!1091971 () Bool)

(assert (=> b!1183666 m!1091971))

(declare-fun m!1091973 () Bool)

(assert (=> b!1183666 m!1091973))

(assert (=> b!1183666 m!1091971))

(declare-fun m!1091975 () Bool)

(assert (=> b!1183666 m!1091975))

(declare-fun m!1091977 () Bool)

(assert (=> b!1183666 m!1091977))

(declare-fun m!1091979 () Bool)

(assert (=> b!1183676 m!1091979))

(declare-fun m!1091981 () Bool)

(assert (=> b!1183684 m!1091981))

(declare-fun m!1091983 () Bool)

(assert (=> b!1183684 m!1091983))

(declare-fun m!1091985 () Bool)

(assert (=> b!1183674 m!1091985))

(declare-fun m!1091987 () Bool)

(assert (=> start!99918 m!1091987))

(declare-fun m!1091989 () Bool)

(assert (=> start!99918 m!1091989))

(assert (=> b!1183683 m!1091971))

(declare-fun m!1091991 () Bool)

(assert (=> b!1183675 m!1091991))

(declare-fun m!1091993 () Bool)

(assert (=> b!1183677 m!1091993))

(declare-fun m!1091995 () Bool)

(assert (=> b!1183679 m!1091995))

(declare-fun m!1091997 () Bool)

(assert (=> b!1183685 m!1091997))

(declare-fun m!1091999 () Bool)

(assert (=> b!1183680 m!1091999))

(declare-fun m!1092001 () Bool)

(assert (=> b!1183680 m!1092001))

(declare-fun m!1092003 () Bool)

(assert (=> b!1183680 m!1092003))

(declare-fun m!1092005 () Bool)

(assert (=> b!1183680 m!1092005))

(declare-fun m!1092007 () Bool)

(assert (=> b!1183669 m!1092007))

(declare-fun m!1092009 () Bool)

(assert (=> b!1183669 m!1092009))

(declare-fun m!1092011 () Bool)

(assert (=> b!1183669 m!1092011))

(assert (=> b!1183669 m!1091971))

(declare-fun m!1092013 () Bool)

(assert (=> b!1183669 m!1092013))

(declare-fun m!1092015 () Bool)

(assert (=> b!1183669 m!1092015))

(assert (=> b!1183669 m!1091971))

(assert (=> b!1183669 m!1092009))

(declare-fun m!1092017 () Bool)

(assert (=> b!1183669 m!1092017))

(declare-fun m!1092019 () Bool)

(assert (=> b!1183673 m!1092019))

(declare-fun m!1092021 () Bool)

(assert (=> b!1183673 m!1092021))

(declare-fun m!1092023 () Bool)

(assert (=> b!1183673 m!1092023))

(declare-fun m!1092025 () Bool)

(assert (=> b!1183673 m!1092025))

(declare-fun m!1092027 () Bool)

(assert (=> b!1183673 m!1092027))

(declare-fun m!1092029 () Bool)

(assert (=> b!1183682 m!1092029))

(declare-fun m!1092031 () Bool)

(assert (=> b!1183682 m!1092031))

(declare-fun m!1092033 () Bool)

(assert (=> b!1183678 m!1092033))

(declare-fun m!1092035 () Bool)

(assert (=> mapNonEmpty!46514 m!1092035))

(check-sat tp_is_empty!29791 (not b!1183675) (not b!1183682) (not b!1183673) (not b!1183679) (not b!1183669) (not b_lambda!20399) (not b!1183676) (not b!1183666) (not b!1183680) (not mapNonEmpty!46514) (not b_next!25261) (not b!1183678) (not start!99918) (not b!1183684) (not b!1183674) b_and!41393 (not b!1183677))
(check-sat b_and!41393 (not b_next!25261))
