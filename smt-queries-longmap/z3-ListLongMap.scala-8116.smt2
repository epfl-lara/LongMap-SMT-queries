; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99798 () Bool)

(assert start!99798)

(declare-fun b_free!25141 () Bool)

(declare-fun b_next!25141 () Bool)

(assert (=> start!99798 (= b_free!25141 (not b_next!25141))))

(declare-fun tp!88136 () Bool)

(declare-fun b_and!41151 () Bool)

(assert (=> start!99798 (= tp!88136 b_and!41151)))

(declare-fun b!1179714 () Bool)

(declare-fun e!670768 () Bool)

(declare-fun e!670759 () Bool)

(assert (=> b!1179714 (= e!670768 (not e!670759))))

(declare-fun res!783363 () Bool)

(assert (=> b!1179714 (=> res!783363 e!670759)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179714 (= res!783363 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76195 0))(
  ( (array!76196 (arr!36741 (Array (_ BitVec 32) (_ BitVec 64))) (size!37278 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76195)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179714 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38924 0))(
  ( (Unit!38925) )
))
(declare-fun lt!532826 () Unit!38924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76195 (_ BitVec 64) (_ BitVec 32)) Unit!38924)

(assert (=> b!1179714 (= lt!532826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179715 () Bool)

(declare-fun e!670764 () Bool)

(declare-fun e!670757 () Bool)

(assert (=> b!1179715 (= e!670764 e!670757)))

(declare-fun res!783359 () Bool)

(assert (=> b!1179715 (=> res!783359 e!670757)))

(assert (=> b!1179715 (= res!783359 (not (= (select (arr!36741 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179716 () Bool)

(declare-fun e!670758 () Unit!38924)

(declare-fun Unit!38926 () Unit!38924)

(assert (=> b!1179716 (= e!670758 Unit!38926)))

(declare-fun lt!532834 () Unit!38924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76195 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38924)

(assert (=> b!1179716 (= lt!532834 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179716 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532827 () Unit!38924)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76195 (_ BitVec 32) (_ BitVec 32)) Unit!38924)

(assert (=> b!1179716 (= lt!532827 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25834 0))(
  ( (Nil!25831) (Cons!25830 (h!27048 (_ BitVec 64)) (t!37959 List!25834)) )
))
(declare-fun arrayNoDuplicates!0 (array!76195 (_ BitVec 32) List!25834) Bool)

(assert (=> b!1179716 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25831)))

(declare-fun lt!532837 () Unit!38924)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76195 (_ BitVec 64) (_ BitVec 32) List!25834) Unit!38924)

(assert (=> b!1179716 (= lt!532837 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25831))))

(assert (=> b!1179716 false))

(declare-fun e!670765 () Bool)

(declare-datatypes ((V!44689 0))(
  ( (V!44690 (val!14892 Int)) )
))
(declare-datatypes ((tuple2!19104 0))(
  ( (tuple2!19105 (_1!9563 (_ BitVec 64)) (_2!9563 V!44689)) )
))
(declare-datatypes ((List!25835 0))(
  ( (Nil!25832) (Cons!25831 (h!27049 tuple2!19104) (t!37960 List!25835)) )
))
(declare-datatypes ((ListLongMap!17081 0))(
  ( (ListLongMap!17082 (toList!8556 List!25835)) )
))
(declare-fun lt!532833 () ListLongMap!17081)

(declare-fun b!1179717 () Bool)

(declare-fun lt!532835 () ListLongMap!17081)

(declare-fun lt!532836 () tuple2!19104)

(declare-fun +!3881 (ListLongMap!17081 tuple2!19104) ListLongMap!17081)

(assert (=> b!1179717 (= e!670765 (= lt!532833 (+!3881 lt!532835 lt!532836)))))

(declare-fun b!1179718 () Bool)

(assert (=> b!1179718 (= e!670757 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179719 () Bool)

(declare-fun e!670763 () Bool)

(declare-fun tp_is_empty!29671 () Bool)

(assert (=> b!1179719 (= e!670763 tp_is_empty!29671)))

(declare-fun res!783354 () Bool)

(declare-fun e!670760 () Bool)

(assert (=> start!99798 (=> (not res!783354) (not e!670760))))

(assert (=> start!99798 (= res!783354 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37278 _keys!1208))))))

(assert (=> start!99798 e!670760))

(assert (=> start!99798 tp_is_empty!29671))

(declare-fun array_inv!28128 (array!76195) Bool)

(assert (=> start!99798 (array_inv!28128 _keys!1208)))

(assert (=> start!99798 true))

(assert (=> start!99798 tp!88136))

(declare-datatypes ((ValueCell!14126 0))(
  ( (ValueCellFull!14126 (v!17526 V!44689)) (EmptyCell!14126) )
))
(declare-datatypes ((array!76197 0))(
  ( (array!76198 (arr!36742 (Array (_ BitVec 32) ValueCell!14126)) (size!37279 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76197)

(declare-fun e!670767 () Bool)

(declare-fun array_inv!28129 (array!76197) Bool)

(assert (=> start!99798 (and (array_inv!28129 _values!996) e!670767)))

(declare-fun b!1179720 () Bool)

(declare-fun e!670762 () Bool)

(declare-fun mapRes!46334 () Bool)

(assert (=> b!1179720 (= e!670767 (and e!670762 mapRes!46334))))

(declare-fun condMapEmpty!46334 () Bool)

(declare-fun mapDefault!46334 () ValueCell!14126)

(assert (=> b!1179720 (= condMapEmpty!46334 (= (arr!36742 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14126)) mapDefault!46334)))))

(declare-fun b!1179721 () Bool)

(declare-fun res!783358 () Bool)

(assert (=> b!1179721 (=> (not res!783358) (not e!670760))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76195 (_ BitVec 32)) Bool)

(assert (=> b!1179721 (= res!783358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179722 () Bool)

(assert (=> b!1179722 (= e!670762 tp_is_empty!29671)))

(declare-fun b!1179723 () Bool)

(declare-fun res!783356 () Bool)

(assert (=> b!1179723 (=> (not res!783356) (not e!670760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179723 (= res!783356 (validKeyInArray!0 k0!934))))

(declare-fun b!1179724 () Bool)

(declare-fun Unit!38927 () Unit!38924)

(assert (=> b!1179724 (= e!670758 Unit!38927)))

(declare-fun b!1179725 () Bool)

(declare-fun res!783350 () Bool)

(assert (=> b!1179725 (=> (not res!783350) (not e!670760))))

(assert (=> b!1179725 (= res!783350 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37278 _keys!1208))))))

(declare-fun b!1179726 () Bool)

(declare-fun e!670761 () Bool)

(assert (=> b!1179726 (= e!670759 e!670761)))

(declare-fun res!783364 () Bool)

(assert (=> b!1179726 (=> res!783364 e!670761)))

(assert (=> b!1179726 (= res!783364 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44689)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!532823 () array!76197)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532825 () array!76195)

(declare-fun minValue!944 () V!44689)

(declare-fun lt!532828 () ListLongMap!17081)

(declare-fun getCurrentListMapNoExtraKeys!5035 (array!76195 array!76197 (_ BitVec 32) (_ BitVec 32) V!44689 V!44689 (_ BitVec 32) Int) ListLongMap!17081)

(assert (=> b!1179726 (= lt!532828 (getCurrentListMapNoExtraKeys!5035 lt!532825 lt!532823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532832 () V!44689)

(assert (=> b!1179726 (= lt!532823 (array!76198 (store (arr!36742 _values!996) i!673 (ValueCellFull!14126 lt!532832)) (size!37279 _values!996)))))

(declare-fun dynLambda!3005 (Int (_ BitVec 64)) V!44689)

(assert (=> b!1179726 (= lt!532832 (dynLambda!3005 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179726 (= lt!532833 (getCurrentListMapNoExtraKeys!5035 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179727 () Bool)

(declare-fun e!670766 () Bool)

(assert (=> b!1179727 (= e!670761 e!670766)))

(declare-fun res!783357 () Bool)

(assert (=> b!1179727 (=> res!783357 e!670766)))

(assert (=> b!1179727 (= res!783357 (not (validKeyInArray!0 (select (arr!36741 _keys!1208) from!1455))))))

(declare-fun lt!532824 () ListLongMap!17081)

(declare-fun lt!532830 () ListLongMap!17081)

(assert (=> b!1179727 (= lt!532824 lt!532830)))

(declare-fun -!1588 (ListLongMap!17081 (_ BitVec 64)) ListLongMap!17081)

(assert (=> b!1179727 (= lt!532830 (-!1588 lt!532835 k0!934))))

(assert (=> b!1179727 (= lt!532824 (getCurrentListMapNoExtraKeys!5035 lt!532825 lt!532823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179727 (= lt!532835 (getCurrentListMapNoExtraKeys!5035 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532831 () Unit!38924)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!813 (array!76195 array!76197 (_ BitVec 32) (_ BitVec 32) V!44689 V!44689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38924)

(assert (=> b!1179727 (= lt!532831 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46334 () Bool)

(declare-fun tp!88137 () Bool)

(assert (=> mapNonEmpty!46334 (= mapRes!46334 (and tp!88137 e!670763))))

(declare-fun mapKey!46334 () (_ BitVec 32))

(declare-fun mapRest!46334 () (Array (_ BitVec 32) ValueCell!14126))

(declare-fun mapValue!46334 () ValueCell!14126)

(assert (=> mapNonEmpty!46334 (= (arr!36742 _values!996) (store mapRest!46334 mapKey!46334 mapValue!46334))))

(declare-fun b!1179728 () Bool)

(declare-fun res!783353 () Bool)

(assert (=> b!1179728 (=> (not res!783353) (not e!670768))))

(assert (=> b!1179728 (= res!783353 (arrayNoDuplicates!0 lt!532825 #b00000000000000000000000000000000 Nil!25831))))

(declare-fun mapIsEmpty!46334 () Bool)

(assert (=> mapIsEmpty!46334 mapRes!46334))

(declare-fun b!1179729 () Bool)

(assert (=> b!1179729 (= e!670760 e!670768)))

(declare-fun res!783360 () Bool)

(assert (=> b!1179729 (=> (not res!783360) (not e!670768))))

(assert (=> b!1179729 (= res!783360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532825 mask!1564))))

(assert (=> b!1179729 (= lt!532825 (array!76196 (store (arr!36741 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37278 _keys!1208)))))

(declare-fun b!1179730 () Bool)

(declare-fun res!783351 () Bool)

(assert (=> b!1179730 (=> (not res!783351) (not e!670760))))

(assert (=> b!1179730 (= res!783351 (and (= (size!37279 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37278 _keys!1208) (size!37279 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179731 () Bool)

(declare-fun res!783361 () Bool)

(assert (=> b!1179731 (=> (not res!783361) (not e!670760))))

(assert (=> b!1179731 (= res!783361 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25831))))

(declare-fun b!1179732 () Bool)

(assert (=> b!1179732 (= e!670766 true)))

(assert (=> b!1179732 e!670765))

(declare-fun res!783355 () Bool)

(assert (=> b!1179732 (=> (not res!783355) (not e!670765))))

(assert (=> b!1179732 (= res!783355 (not (= (select (arr!36741 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532829 () Unit!38924)

(assert (=> b!1179732 (= lt!532829 e!670758)))

(declare-fun c!117233 () Bool)

(assert (=> b!1179732 (= c!117233 (= (select (arr!36741 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179732 e!670764))

(declare-fun res!783365 () Bool)

(assert (=> b!1179732 (=> (not res!783365) (not e!670764))))

(assert (=> b!1179732 (= res!783365 (= lt!532828 (+!3881 lt!532830 lt!532836)))))

(declare-fun get!18810 (ValueCell!14126 V!44689) V!44689)

(assert (=> b!1179732 (= lt!532836 (tuple2!19105 (select (arr!36741 _keys!1208) from!1455) (get!18810 (select (arr!36742 _values!996) from!1455) lt!532832)))))

(declare-fun b!1179733 () Bool)

(declare-fun res!783352 () Bool)

(assert (=> b!1179733 (=> (not res!783352) (not e!670760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179733 (= res!783352 (validMask!0 mask!1564))))

(declare-fun b!1179734 () Bool)

(declare-fun res!783362 () Bool)

(assert (=> b!1179734 (=> (not res!783362) (not e!670760))))

(assert (=> b!1179734 (= res!783362 (= (select (arr!36741 _keys!1208) i!673) k0!934))))

(assert (= (and start!99798 res!783354) b!1179733))

(assert (= (and b!1179733 res!783352) b!1179730))

(assert (= (and b!1179730 res!783351) b!1179721))

(assert (= (and b!1179721 res!783358) b!1179731))

(assert (= (and b!1179731 res!783361) b!1179725))

(assert (= (and b!1179725 res!783350) b!1179723))

(assert (= (and b!1179723 res!783356) b!1179734))

(assert (= (and b!1179734 res!783362) b!1179729))

(assert (= (and b!1179729 res!783360) b!1179728))

(assert (= (and b!1179728 res!783353) b!1179714))

(assert (= (and b!1179714 (not res!783363)) b!1179726))

(assert (= (and b!1179726 (not res!783364)) b!1179727))

(assert (= (and b!1179727 (not res!783357)) b!1179732))

(assert (= (and b!1179732 res!783365) b!1179715))

(assert (= (and b!1179715 (not res!783359)) b!1179718))

(assert (= (and b!1179732 c!117233) b!1179716))

(assert (= (and b!1179732 (not c!117233)) b!1179724))

(assert (= (and b!1179732 res!783355) b!1179717))

(assert (= (and b!1179720 condMapEmpty!46334) mapIsEmpty!46334))

(assert (= (and b!1179720 (not condMapEmpty!46334)) mapNonEmpty!46334))

(get-info :version)

(assert (= (and mapNonEmpty!46334 ((_ is ValueCellFull!14126) mapValue!46334)) b!1179719))

(assert (= (and b!1179720 ((_ is ValueCellFull!14126) mapDefault!46334)) b!1179722))

(assert (= start!99798 b!1179720))

(declare-fun b_lambda!20279 () Bool)

(assert (=> (not b_lambda!20279) (not b!1179726)))

(declare-fun t!37958 () Bool)

(declare-fun tb!9945 () Bool)

(assert (=> (and start!99798 (= defaultEntry!1004 defaultEntry!1004) t!37958) tb!9945))

(declare-fun result!20465 () Bool)

(assert (=> tb!9945 (= result!20465 tp_is_empty!29671)))

(assert (=> b!1179726 t!37958))

(declare-fun b_and!41153 () Bool)

(assert (= b_and!41151 (and (=> t!37958 result!20465) b_and!41153)))

(declare-fun m!1087959 () Bool)

(assert (=> b!1179717 m!1087959))

(declare-fun m!1087961 () Bool)

(assert (=> b!1179726 m!1087961))

(declare-fun m!1087963 () Bool)

(assert (=> b!1179726 m!1087963))

(declare-fun m!1087965 () Bool)

(assert (=> b!1179726 m!1087965))

(declare-fun m!1087967 () Bool)

(assert (=> b!1179726 m!1087967))

(declare-fun m!1087969 () Bool)

(assert (=> mapNonEmpty!46334 m!1087969))

(declare-fun m!1087971 () Bool)

(assert (=> b!1179715 m!1087971))

(declare-fun m!1087973 () Bool)

(assert (=> b!1179716 m!1087973))

(declare-fun m!1087975 () Bool)

(assert (=> b!1179716 m!1087975))

(declare-fun m!1087977 () Bool)

(assert (=> b!1179716 m!1087977))

(declare-fun m!1087979 () Bool)

(assert (=> b!1179716 m!1087979))

(declare-fun m!1087981 () Bool)

(assert (=> b!1179716 m!1087981))

(declare-fun m!1087983 () Bool)

(assert (=> b!1179721 m!1087983))

(declare-fun m!1087985 () Bool)

(assert (=> b!1179714 m!1087985))

(declare-fun m!1087987 () Bool)

(assert (=> b!1179714 m!1087987))

(declare-fun m!1087989 () Bool)

(assert (=> b!1179729 m!1087989))

(declare-fun m!1087991 () Bool)

(assert (=> b!1179729 m!1087991))

(declare-fun m!1087993 () Bool)

(assert (=> b!1179723 m!1087993))

(declare-fun m!1087995 () Bool)

(assert (=> b!1179734 m!1087995))

(declare-fun m!1087997 () Bool)

(assert (=> start!99798 m!1087997))

(declare-fun m!1087999 () Bool)

(assert (=> start!99798 m!1087999))

(declare-fun m!1088001 () Bool)

(assert (=> b!1179733 m!1088001))

(declare-fun m!1088003 () Bool)

(assert (=> b!1179731 m!1088003))

(declare-fun m!1088005 () Bool)

(assert (=> b!1179728 m!1088005))

(declare-fun m!1088007 () Bool)

(assert (=> b!1179718 m!1088007))

(assert (=> b!1179732 m!1087971))

(declare-fun m!1088009 () Bool)

(assert (=> b!1179732 m!1088009))

(declare-fun m!1088011 () Bool)

(assert (=> b!1179732 m!1088011))

(assert (=> b!1179732 m!1088011))

(declare-fun m!1088013 () Bool)

(assert (=> b!1179732 m!1088013))

(declare-fun m!1088015 () Bool)

(assert (=> b!1179727 m!1088015))

(declare-fun m!1088017 () Bool)

(assert (=> b!1179727 m!1088017))

(declare-fun m!1088019 () Bool)

(assert (=> b!1179727 m!1088019))

(declare-fun m!1088021 () Bool)

(assert (=> b!1179727 m!1088021))

(assert (=> b!1179727 m!1087971))

(declare-fun m!1088023 () Bool)

(assert (=> b!1179727 m!1088023))

(assert (=> b!1179727 m!1087971))

(check-sat (not b!1179731) (not b!1179729) (not b_next!25141) (not b!1179718) (not b!1179732) (not b!1179721) (not b!1179717) (not start!99798) (not b!1179716) (not b!1179726) (not b!1179733) (not b!1179723) (not mapNonEmpty!46334) tp_is_empty!29671 (not b_lambda!20279) (not b!1179728) b_and!41153 (not b!1179714) (not b!1179727))
(check-sat b_and!41153 (not b_next!25141))
