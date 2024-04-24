; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99858 () Bool)

(assert start!99858)

(declare-fun b_free!25201 () Bool)

(declare-fun b_next!25201 () Bool)

(assert (=> start!99858 (= b_free!25201 (not b_next!25201))))

(declare-fun tp!88317 () Bool)

(declare-fun b_and!41271 () Bool)

(assert (=> start!99858 (= tp!88317 b_and!41271)))

(declare-datatypes ((array!76315 0))(
  ( (array!76316 (arr!36801 (Array (_ BitVec 32) (_ BitVec 64))) (size!37338 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76315)

(declare-fun b!1181702 () Bool)

(declare-fun e!671928 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181702 (= e!671928 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181703 () Bool)

(declare-fun res!784835 () Bool)

(declare-fun e!671931 () Bool)

(assert (=> b!1181703 (=> (not res!784835) (not e!671931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181703 (= res!784835 (validKeyInArray!0 k0!934))))

(declare-fun res!784830 () Bool)

(assert (=> start!99858 (=> (not res!784830) (not e!671931))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99858 (= res!784830 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37338 _keys!1208))))))

(assert (=> start!99858 e!671931))

(declare-fun tp_is_empty!29731 () Bool)

(assert (=> start!99858 tp_is_empty!29731))

(declare-fun array_inv!28180 (array!76315) Bool)

(assert (=> start!99858 (array_inv!28180 _keys!1208)))

(assert (=> start!99858 true))

(assert (=> start!99858 tp!88317))

(declare-datatypes ((V!44769 0))(
  ( (V!44770 (val!14922 Int)) )
))
(declare-datatypes ((ValueCell!14156 0))(
  ( (ValueCellFull!14156 (v!17556 V!44769)) (EmptyCell!14156) )
))
(declare-datatypes ((array!76317 0))(
  ( (array!76318 (arr!36802 (Array (_ BitVec 32) ValueCell!14156)) (size!37339 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76317)

(declare-fun e!671927 () Bool)

(declare-fun array_inv!28181 (array!76317) Bool)

(assert (=> start!99858 (and (array_inv!28181 _values!996) e!671927)))

(declare-fun b!1181704 () Bool)

(declare-fun e!671936 () Bool)

(declare-fun e!671929 () Bool)

(assert (=> b!1181704 (= e!671936 e!671929)))

(declare-fun res!784838 () Bool)

(assert (=> b!1181704 (=> res!784838 e!671929)))

(assert (=> b!1181704 (= res!784838 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44769)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534173 () array!76317)

(declare-datatypes ((tuple2!19158 0))(
  ( (tuple2!19159 (_1!9590 (_ BitVec 64)) (_2!9590 V!44769)) )
))
(declare-datatypes ((List!25888 0))(
  ( (Nil!25885) (Cons!25884 (h!27102 tuple2!19158) (t!38073 List!25888)) )
))
(declare-datatypes ((ListLongMap!17135 0))(
  ( (ListLongMap!17136 (toList!8583 List!25888)) )
))
(declare-fun lt!534176 () ListLongMap!17135)

(declare-fun lt!534177 () array!76315)

(declare-fun minValue!944 () V!44769)

(declare-fun getCurrentListMapNoExtraKeys!5061 (array!76315 array!76317 (_ BitVec 32) (_ BitVec 32) V!44769 V!44769 (_ BitVec 32) Int) ListLongMap!17135)

(assert (=> b!1181704 (= lt!534176 (getCurrentListMapNoExtraKeys!5061 lt!534177 lt!534173 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534183 () V!44769)

(assert (=> b!1181704 (= lt!534173 (array!76318 (store (arr!36802 _values!996) i!673 (ValueCellFull!14156 lt!534183)) (size!37339 _values!996)))))

(declare-fun dynLambda!3027 (Int (_ BitVec 64)) V!44769)

(assert (=> b!1181704 (= lt!534183 (dynLambda!3027 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534181 () ListLongMap!17135)

(assert (=> b!1181704 (= lt!534181 (getCurrentListMapNoExtraKeys!5061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181705 () Bool)

(declare-fun e!671935 () Bool)

(assert (=> b!1181705 (= e!671935 true)))

(declare-fun e!671937 () Bool)

(assert (=> b!1181705 e!671937))

(declare-fun res!784833 () Bool)

(assert (=> b!1181705 (=> (not res!784833) (not e!671937))))

(assert (=> b!1181705 (= res!784833 (not (= (select (arr!36801 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!39024 0))(
  ( (Unit!39025) )
))
(declare-fun lt!534178 () Unit!39024)

(declare-fun e!671930 () Unit!39024)

(assert (=> b!1181705 (= lt!534178 e!671930)))

(declare-fun c!117323 () Bool)

(assert (=> b!1181705 (= c!117323 (= (select (arr!36801 _keys!1208) from!1455) k0!934))))

(declare-fun e!671932 () Bool)

(assert (=> b!1181705 e!671932))

(declare-fun res!784839 () Bool)

(assert (=> b!1181705 (=> (not res!784839) (not e!671932))))

(declare-fun lt!534185 () tuple2!19158)

(declare-fun lt!534175 () ListLongMap!17135)

(declare-fun +!3906 (ListLongMap!17135 tuple2!19158) ListLongMap!17135)

(assert (=> b!1181705 (= res!784839 (= lt!534176 (+!3906 lt!534175 lt!534185)))))

(declare-fun get!18852 (ValueCell!14156 V!44769) V!44769)

(assert (=> b!1181705 (= lt!534185 (tuple2!19159 (select (arr!36801 _keys!1208) from!1455) (get!18852 (select (arr!36802 _values!996) from!1455) lt!534183)))))

(declare-fun b!1181706 () Bool)

(declare-fun Unit!39026 () Unit!39024)

(assert (=> b!1181706 (= e!671930 Unit!39026)))

(declare-fun b!1181707 () Bool)

(declare-fun res!784831 () Bool)

(assert (=> b!1181707 (=> (not res!784831) (not e!671931))))

(assert (=> b!1181707 (= res!784831 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37338 _keys!1208))))))

(declare-fun b!1181708 () Bool)

(declare-fun res!784829 () Bool)

(assert (=> b!1181708 (=> (not res!784829) (not e!671931))))

(declare-datatypes ((List!25889 0))(
  ( (Nil!25886) (Cons!25885 (h!27103 (_ BitVec 64)) (t!38074 List!25889)) )
))
(declare-fun arrayNoDuplicates!0 (array!76315 (_ BitVec 32) List!25889) Bool)

(assert (=> b!1181708 (= res!784829 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25886))))

(declare-fun b!1181709 () Bool)

(declare-fun e!671933 () Bool)

(assert (=> b!1181709 (= e!671933 tp_is_empty!29731)))

(declare-fun b!1181710 () Bool)

(declare-fun res!784836 () Bool)

(assert (=> b!1181710 (=> (not res!784836) (not e!671931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181710 (= res!784836 (validMask!0 mask!1564))))

(declare-fun b!1181711 () Bool)

(declare-fun res!784832 () Bool)

(assert (=> b!1181711 (=> (not res!784832) (not e!671931))))

(assert (=> b!1181711 (= res!784832 (and (= (size!37339 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37338 _keys!1208) (size!37339 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46424 () Bool)

(declare-fun mapRes!46424 () Bool)

(declare-fun tp!88316 () Bool)

(declare-fun e!671934 () Bool)

(assert (=> mapNonEmpty!46424 (= mapRes!46424 (and tp!88316 e!671934))))

(declare-fun mapKey!46424 () (_ BitVec 32))

(declare-fun mapValue!46424 () ValueCell!14156)

(declare-fun mapRest!46424 () (Array (_ BitVec 32) ValueCell!14156))

(assert (=> mapNonEmpty!46424 (= (arr!36802 _values!996) (store mapRest!46424 mapKey!46424 mapValue!46424))))

(declare-fun mapIsEmpty!46424 () Bool)

(assert (=> mapIsEmpty!46424 mapRes!46424))

(declare-fun b!1181712 () Bool)

(declare-fun res!784828 () Bool)

(assert (=> b!1181712 (=> (not res!784828) (not e!671931))))

(assert (=> b!1181712 (= res!784828 (= (select (arr!36801 _keys!1208) i!673) k0!934))))

(declare-fun b!1181713 () Bool)

(declare-fun res!784844 () Bool)

(declare-fun e!671938 () Bool)

(assert (=> b!1181713 (=> (not res!784844) (not e!671938))))

(assert (=> b!1181713 (= res!784844 (arrayNoDuplicates!0 lt!534177 #b00000000000000000000000000000000 Nil!25886))))

(declare-fun b!1181714 () Bool)

(assert (=> b!1181714 (= e!671931 e!671938)))

(declare-fun res!784837 () Bool)

(assert (=> b!1181714 (=> (not res!784837) (not e!671938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76315 (_ BitVec 32)) Bool)

(assert (=> b!1181714 (= res!784837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534177 mask!1564))))

(assert (=> b!1181714 (= lt!534177 (array!76316 (store (arr!36801 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37338 _keys!1208)))))

(declare-fun b!1181715 () Bool)

(assert (=> b!1181715 (= e!671932 e!671928)))

(declare-fun res!784841 () Bool)

(assert (=> b!1181715 (=> res!784841 e!671928)))

(assert (=> b!1181715 (= res!784841 (not (= (select (arr!36801 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181716 () Bool)

(assert (=> b!1181716 (= e!671938 (not e!671936))))

(declare-fun res!784842 () Bool)

(assert (=> b!1181716 (=> res!784842 e!671936)))

(assert (=> b!1181716 (= res!784842 (bvsgt from!1455 i!673))))

(assert (=> b!1181716 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534180 () Unit!39024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76315 (_ BitVec 64) (_ BitVec 32)) Unit!39024)

(assert (=> b!1181716 (= lt!534180 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181717 () Bool)

(assert (=> b!1181717 (= e!671927 (and e!671933 mapRes!46424))))

(declare-fun condMapEmpty!46424 () Bool)

(declare-fun mapDefault!46424 () ValueCell!14156)

(assert (=> b!1181717 (= condMapEmpty!46424 (= (arr!36802 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14156)) mapDefault!46424)))))

(declare-fun b!1181718 () Bool)

(declare-fun res!784840 () Bool)

(assert (=> b!1181718 (=> (not res!784840) (not e!671937))))

(declare-fun lt!534187 () ListLongMap!17135)

(assert (=> b!1181718 (= res!784840 (= lt!534181 (+!3906 lt!534187 lt!534185)))))

(declare-fun b!1181719 () Bool)

(declare-fun res!784834 () Bool)

(assert (=> b!1181719 (=> (not res!784834) (not e!671931))))

(assert (=> b!1181719 (= res!784834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181720 () Bool)

(assert (=> b!1181720 (= e!671934 tp_is_empty!29731)))

(declare-fun b!1181721 () Bool)

(declare-fun lt!534174 () ListLongMap!17135)

(assert (=> b!1181721 (= e!671937 (= lt!534175 lt!534174))))

(declare-fun b!1181722 () Bool)

(declare-fun Unit!39027 () Unit!39024)

(assert (=> b!1181722 (= e!671930 Unit!39027)))

(declare-fun lt!534179 () Unit!39024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39024)

(assert (=> b!1181722 (= lt!534179 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181722 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534182 () Unit!39024)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76315 (_ BitVec 32) (_ BitVec 32)) Unit!39024)

(assert (=> b!1181722 (= lt!534182 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181722 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25886)))

(declare-fun lt!534186 () Unit!39024)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76315 (_ BitVec 64) (_ BitVec 32) List!25889) Unit!39024)

(assert (=> b!1181722 (= lt!534186 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25886))))

(assert (=> b!1181722 false))

(declare-fun b!1181723 () Bool)

(assert (=> b!1181723 (= e!671929 e!671935)))

(declare-fun res!784843 () Bool)

(assert (=> b!1181723 (=> res!784843 e!671935)))

(assert (=> b!1181723 (= res!784843 (not (validKeyInArray!0 (select (arr!36801 _keys!1208) from!1455))))))

(assert (=> b!1181723 (= lt!534174 lt!534175)))

(declare-fun -!1612 (ListLongMap!17135 (_ BitVec 64)) ListLongMap!17135)

(assert (=> b!1181723 (= lt!534175 (-!1612 lt!534187 k0!934))))

(assert (=> b!1181723 (= lt!534174 (getCurrentListMapNoExtraKeys!5061 lt!534177 lt!534173 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181723 (= lt!534187 (getCurrentListMapNoExtraKeys!5061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534184 () Unit!39024)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!837 (array!76315 array!76317 (_ BitVec 32) (_ BitVec 32) V!44769 V!44769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39024)

(assert (=> b!1181723 (= lt!534184 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99858 res!784830) b!1181710))

(assert (= (and b!1181710 res!784836) b!1181711))

(assert (= (and b!1181711 res!784832) b!1181719))

(assert (= (and b!1181719 res!784834) b!1181708))

(assert (= (and b!1181708 res!784829) b!1181707))

(assert (= (and b!1181707 res!784831) b!1181703))

(assert (= (and b!1181703 res!784835) b!1181712))

(assert (= (and b!1181712 res!784828) b!1181714))

(assert (= (and b!1181714 res!784837) b!1181713))

(assert (= (and b!1181713 res!784844) b!1181716))

(assert (= (and b!1181716 (not res!784842)) b!1181704))

(assert (= (and b!1181704 (not res!784838)) b!1181723))

(assert (= (and b!1181723 (not res!784843)) b!1181705))

(assert (= (and b!1181705 res!784839) b!1181715))

(assert (= (and b!1181715 (not res!784841)) b!1181702))

(assert (= (and b!1181705 c!117323) b!1181722))

(assert (= (and b!1181705 (not c!117323)) b!1181706))

(assert (= (and b!1181705 res!784833) b!1181718))

(assert (= (and b!1181718 res!784840) b!1181721))

(assert (= (and b!1181717 condMapEmpty!46424) mapIsEmpty!46424))

(assert (= (and b!1181717 (not condMapEmpty!46424)) mapNonEmpty!46424))

(get-info :version)

(assert (= (and mapNonEmpty!46424 ((_ is ValueCellFull!14156) mapValue!46424)) b!1181720))

(assert (= (and b!1181717 ((_ is ValueCellFull!14156) mapDefault!46424)) b!1181709))

(assert (= start!99858 b!1181717))

(declare-fun b_lambda!20339 () Bool)

(assert (=> (not b_lambda!20339) (not b!1181704)))

(declare-fun t!38072 () Bool)

(declare-fun tb!10005 () Bool)

(assert (=> (and start!99858 (= defaultEntry!1004 defaultEntry!1004) t!38072) tb!10005))

(declare-fun result!20585 () Bool)

(assert (=> tb!10005 (= result!20585 tp_is_empty!29731)))

(assert (=> b!1181704 t!38072))

(declare-fun b_and!41273 () Bool)

(assert (= b_and!41271 (and (=> t!38072 result!20585) b_and!41273)))

(declare-fun m!1089939 () Bool)

(assert (=> b!1181705 m!1089939))

(declare-fun m!1089941 () Bool)

(assert (=> b!1181705 m!1089941))

(declare-fun m!1089943 () Bool)

(assert (=> b!1181705 m!1089943))

(assert (=> b!1181705 m!1089943))

(declare-fun m!1089945 () Bool)

(assert (=> b!1181705 m!1089945))

(declare-fun m!1089947 () Bool)

(assert (=> mapNonEmpty!46424 m!1089947))

(declare-fun m!1089949 () Bool)

(assert (=> b!1181722 m!1089949))

(declare-fun m!1089951 () Bool)

(assert (=> b!1181722 m!1089951))

(declare-fun m!1089953 () Bool)

(assert (=> b!1181722 m!1089953))

(declare-fun m!1089955 () Bool)

(assert (=> b!1181722 m!1089955))

(declare-fun m!1089957 () Bool)

(assert (=> b!1181722 m!1089957))

(declare-fun m!1089959 () Bool)

(assert (=> b!1181710 m!1089959))

(declare-fun m!1089961 () Bool)

(assert (=> b!1181703 m!1089961))

(declare-fun m!1089963 () Bool)

(assert (=> b!1181718 m!1089963))

(declare-fun m!1089965 () Bool)

(assert (=> start!99858 m!1089965))

(declare-fun m!1089967 () Bool)

(assert (=> start!99858 m!1089967))

(declare-fun m!1089969 () Bool)

(assert (=> b!1181716 m!1089969))

(declare-fun m!1089971 () Bool)

(assert (=> b!1181716 m!1089971))

(declare-fun m!1089973 () Bool)

(assert (=> b!1181712 m!1089973))

(assert (=> b!1181715 m!1089939))

(declare-fun m!1089975 () Bool)

(assert (=> b!1181714 m!1089975))

(declare-fun m!1089977 () Bool)

(assert (=> b!1181714 m!1089977))

(declare-fun m!1089979 () Bool)

(assert (=> b!1181713 m!1089979))

(declare-fun m!1089981 () Bool)

(assert (=> b!1181704 m!1089981))

(declare-fun m!1089983 () Bool)

(assert (=> b!1181704 m!1089983))

(declare-fun m!1089985 () Bool)

(assert (=> b!1181704 m!1089985))

(declare-fun m!1089987 () Bool)

(assert (=> b!1181704 m!1089987))

(declare-fun m!1089989 () Bool)

(assert (=> b!1181723 m!1089989))

(declare-fun m!1089991 () Bool)

(assert (=> b!1181723 m!1089991))

(declare-fun m!1089993 () Bool)

(assert (=> b!1181723 m!1089993))

(declare-fun m!1089995 () Bool)

(assert (=> b!1181723 m!1089995))

(assert (=> b!1181723 m!1089939))

(declare-fun m!1089997 () Bool)

(assert (=> b!1181723 m!1089997))

(assert (=> b!1181723 m!1089939))

(declare-fun m!1089999 () Bool)

(assert (=> b!1181702 m!1089999))

(declare-fun m!1090001 () Bool)

(assert (=> b!1181708 m!1090001))

(declare-fun m!1090003 () Bool)

(assert (=> b!1181719 m!1090003))

(check-sat tp_is_empty!29731 (not b!1181705) (not b!1181719) b_and!41273 (not b!1181713) (not b!1181704) (not b!1181702) (not b_next!25201) (not b!1181710) (not b!1181722) (not mapNonEmpty!46424) (not b!1181716) (not b!1181718) (not b!1181723) (not b!1181708) (not start!99858) (not b!1181714) (not b_lambda!20339) (not b!1181703))
(check-sat b_and!41273 (not b_next!25201))
