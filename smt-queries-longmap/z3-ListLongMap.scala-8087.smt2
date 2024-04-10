; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99390 () Bool)

(assert start!99390)

(declare-fun b_free!24969 () Bool)

(declare-fun b_next!24969 () Bool)

(assert (=> start!99390 (= b_free!24969 (not b_next!24969))))

(declare-fun tp!87621 () Bool)

(declare-fun b_and!40805 () Bool)

(assert (=> start!99390 (= tp!87621 b_and!40805)))

(declare-fun b!1172983 () Bool)

(declare-fun res!778863 () Bool)

(declare-fun e!666730 () Bool)

(assert (=> b!1172983 (=> (not res!778863) (not e!666730))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75809 0))(
  ( (array!75810 (arr!36554 (Array (_ BitVec 32) (_ BitVec 64))) (size!37090 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75809)

(assert (=> b!1172983 (= res!778863 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37090 _keys!1208))))))

(declare-fun b!1172985 () Bool)

(declare-fun res!778874 () Bool)

(assert (=> b!1172985 (=> (not res!778874) (not e!666730))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44459 0))(
  ( (V!44460 (val!14806 Int)) )
))
(declare-datatypes ((ValueCell!14040 0))(
  ( (ValueCellFull!14040 (v!17444 V!44459)) (EmptyCell!14040) )
))
(declare-datatypes ((array!75811 0))(
  ( (array!75812 (arr!36555 (Array (_ BitVec 32) ValueCell!14040)) (size!37091 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75811)

(assert (=> b!1172985 (= res!778874 (and (= (size!37091 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37090 _keys!1208) (size!37091 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172986 () Bool)

(declare-datatypes ((Unit!38678 0))(
  ( (Unit!38679) )
))
(declare-fun e!666728 () Unit!38678)

(declare-fun Unit!38680 () Unit!38678)

(assert (=> b!1172986 (= e!666728 Unit!38680)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!528623 () Unit!38678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75809 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38678)

(assert (=> b!1172986 (= lt!528623 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172986 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528618 () Unit!38678)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75809 (_ BitVec 32) (_ BitVec 32)) Unit!38678)

(assert (=> b!1172986 (= lt!528618 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25656 0))(
  ( (Nil!25653) (Cons!25652 (h!26861 (_ BitVec 64)) (t!37617 List!25656)) )
))
(declare-fun arrayNoDuplicates!0 (array!75809 (_ BitVec 32) List!25656) Bool)

(assert (=> b!1172986 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25653)))

(declare-fun lt!528622 () Unit!38678)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75809 (_ BitVec 64) (_ BitVec 32) List!25656) Unit!38678)

(assert (=> b!1172986 (= lt!528622 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25653))))

(assert (=> b!1172986 false))

(declare-fun b!1172987 () Bool)

(declare-fun res!778869 () Bool)

(assert (=> b!1172987 (=> (not res!778869) (not e!666730))))

(assert (=> b!1172987 (= res!778869 (= (select (arr!36554 _keys!1208) i!673) k0!934))))

(declare-fun b!1172988 () Bool)

(declare-fun e!666720 () Bool)

(declare-fun e!666721 () Bool)

(declare-fun mapRes!46076 () Bool)

(assert (=> b!1172988 (= e!666720 (and e!666721 mapRes!46076))))

(declare-fun condMapEmpty!46076 () Bool)

(declare-fun mapDefault!46076 () ValueCell!14040)

(assert (=> b!1172988 (= condMapEmpty!46076 (= (arr!36555 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14040)) mapDefault!46076)))))

(declare-fun b!1172989 () Bool)

(declare-fun tp_is_empty!29499 () Bool)

(assert (=> b!1172989 (= e!666721 tp_is_empty!29499)))

(declare-fun b!1172990 () Bool)

(declare-fun res!778872 () Bool)

(assert (=> b!1172990 (=> (not res!778872) (not e!666730))))

(assert (=> b!1172990 (= res!778872 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25653))))

(declare-fun mapNonEmpty!46076 () Bool)

(declare-fun tp!87620 () Bool)

(declare-fun e!666723 () Bool)

(assert (=> mapNonEmpty!46076 (= mapRes!46076 (and tp!87620 e!666723))))

(declare-fun mapRest!46076 () (Array (_ BitVec 32) ValueCell!14040))

(declare-fun mapKey!46076 () (_ BitVec 32))

(declare-fun mapValue!46076 () ValueCell!14040)

(assert (=> mapNonEmpty!46076 (= (arr!36555 _values!996) (store mapRest!46076 mapKey!46076 mapValue!46076))))

(declare-fun b!1172984 () Bool)

(declare-fun res!778867 () Bool)

(assert (=> b!1172984 (=> (not res!778867) (not e!666730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172984 (= res!778867 (validKeyInArray!0 k0!934))))

(declare-fun res!778865 () Bool)

(assert (=> start!99390 (=> (not res!778865) (not e!666730))))

(assert (=> start!99390 (= res!778865 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37090 _keys!1208))))))

(assert (=> start!99390 e!666730))

(assert (=> start!99390 tp_is_empty!29499))

(declare-fun array_inv!27930 (array!75809) Bool)

(assert (=> start!99390 (array_inv!27930 _keys!1208)))

(assert (=> start!99390 true))

(assert (=> start!99390 tp!87621))

(declare-fun array_inv!27931 (array!75811) Bool)

(assert (=> start!99390 (and (array_inv!27931 _values!996) e!666720)))

(declare-fun b!1172991 () Bool)

(declare-fun e!666724 () Bool)

(declare-fun e!666726 () Bool)

(assert (=> b!1172991 (= e!666724 (not e!666726))))

(declare-fun res!778871 () Bool)

(assert (=> b!1172991 (=> res!778871 e!666726)))

(assert (=> b!1172991 (= res!778871 (bvsgt from!1455 i!673))))

(assert (=> b!1172991 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528628 () Unit!38678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75809 (_ BitVec 64) (_ BitVec 32)) Unit!38678)

(assert (=> b!1172991 (= lt!528628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172992 () Bool)

(declare-fun e!666729 () Bool)

(assert (=> b!1172992 (= e!666729 true)))

(assert (=> b!1172992 (not (= (select (arr!36554 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528629 () Unit!38678)

(assert (=> b!1172992 (= lt!528629 e!666728)))

(declare-fun c!116577 () Bool)

(assert (=> b!1172992 (= c!116577 (= (select (arr!36554 _keys!1208) from!1455) k0!934))))

(declare-fun e!666727 () Bool)

(assert (=> b!1172992 e!666727))

(declare-fun res!778870 () Bool)

(assert (=> b!1172992 (=> (not res!778870) (not e!666727))))

(declare-fun lt!528627 () V!44459)

(declare-datatypes ((tuple2!18918 0))(
  ( (tuple2!18919 (_1!9470 (_ BitVec 64)) (_2!9470 V!44459)) )
))
(declare-datatypes ((List!25657 0))(
  ( (Nil!25654) (Cons!25653 (h!26862 tuple2!18918) (t!37618 List!25657)) )
))
(declare-datatypes ((ListLongMap!16887 0))(
  ( (ListLongMap!16888 (toList!8459 List!25657)) )
))
(declare-fun lt!528624 () ListLongMap!16887)

(declare-fun lt!528630 () ListLongMap!16887)

(declare-fun +!3779 (ListLongMap!16887 tuple2!18918) ListLongMap!16887)

(declare-fun get!18649 (ValueCell!14040 V!44459) V!44459)

(assert (=> b!1172992 (= res!778870 (= lt!528624 (+!3779 lt!528630 (tuple2!18919 (select (arr!36554 _keys!1208) from!1455) (get!18649 (select (arr!36555 _values!996) from!1455) lt!528627)))))))

(declare-fun b!1172993 () Bool)

(declare-fun e!666722 () Bool)

(assert (=> b!1172993 (= e!666722 e!666729)))

(declare-fun res!778866 () Bool)

(assert (=> b!1172993 (=> res!778866 e!666729)))

(assert (=> b!1172993 (= res!778866 (not (validKeyInArray!0 (select (arr!36554 _keys!1208) from!1455))))))

(declare-fun lt!528620 () ListLongMap!16887)

(assert (=> b!1172993 (= lt!528620 lt!528630)))

(declare-fun lt!528621 () ListLongMap!16887)

(declare-fun -!1525 (ListLongMap!16887 (_ BitVec 64)) ListLongMap!16887)

(assert (=> b!1172993 (= lt!528630 (-!1525 lt!528621 k0!934))))

(declare-fun zeroValue!944 () V!44459)

(declare-fun lt!528617 () array!75811)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44459)

(declare-fun lt!528619 () array!75809)

(declare-fun getCurrentListMapNoExtraKeys!4923 (array!75809 array!75811 (_ BitVec 32) (_ BitVec 32) V!44459 V!44459 (_ BitVec 32) Int) ListLongMap!16887)

(assert (=> b!1172993 (= lt!528620 (getCurrentListMapNoExtraKeys!4923 lt!528619 lt!528617 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172993 (= lt!528621 (getCurrentListMapNoExtraKeys!4923 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528625 () Unit!38678)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!752 (array!75809 array!75811 (_ BitVec 32) (_ BitVec 32) V!44459 V!44459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38678)

(assert (=> b!1172993 (= lt!528625 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172994 () Bool)

(declare-fun e!666719 () Bool)

(assert (=> b!1172994 (= e!666719 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172995 () Bool)

(assert (=> b!1172995 (= e!666723 tp_is_empty!29499)))

(declare-fun b!1172996 () Bool)

(declare-fun res!778868 () Bool)

(assert (=> b!1172996 (=> (not res!778868) (not e!666730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75809 (_ BitVec 32)) Bool)

(assert (=> b!1172996 (= res!778868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172997 () Bool)

(declare-fun res!778873 () Bool)

(assert (=> b!1172997 (=> (not res!778873) (not e!666724))))

(assert (=> b!1172997 (= res!778873 (arrayNoDuplicates!0 lt!528619 #b00000000000000000000000000000000 Nil!25653))))

(declare-fun mapIsEmpty!46076 () Bool)

(assert (=> mapIsEmpty!46076 mapRes!46076))

(declare-fun b!1172998 () Bool)

(declare-fun res!778864 () Bool)

(assert (=> b!1172998 (=> (not res!778864) (not e!666730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172998 (= res!778864 (validMask!0 mask!1564))))

(declare-fun b!1172999 () Bool)

(assert (=> b!1172999 (= e!666730 e!666724)))

(declare-fun res!778862 () Bool)

(assert (=> b!1172999 (=> (not res!778862) (not e!666724))))

(assert (=> b!1172999 (= res!778862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528619 mask!1564))))

(assert (=> b!1172999 (= lt!528619 (array!75810 (store (arr!36554 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37090 _keys!1208)))))

(declare-fun b!1173000 () Bool)

(assert (=> b!1173000 (= e!666727 e!666719)))

(declare-fun res!778876 () Bool)

(assert (=> b!1173000 (=> res!778876 e!666719)))

(assert (=> b!1173000 (= res!778876 (not (= (select (arr!36554 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173001 () Bool)

(declare-fun Unit!38681 () Unit!38678)

(assert (=> b!1173001 (= e!666728 Unit!38681)))

(declare-fun b!1173002 () Bool)

(assert (=> b!1173002 (= e!666726 e!666722)))

(declare-fun res!778875 () Bool)

(assert (=> b!1173002 (=> res!778875 e!666722)))

(assert (=> b!1173002 (= res!778875 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173002 (= lt!528624 (getCurrentListMapNoExtraKeys!4923 lt!528619 lt!528617 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173002 (= lt!528617 (array!75812 (store (arr!36555 _values!996) i!673 (ValueCellFull!14040 lt!528627)) (size!37091 _values!996)))))

(declare-fun dynLambda!2894 (Int (_ BitVec 64)) V!44459)

(assert (=> b!1173002 (= lt!528627 (dynLambda!2894 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528626 () ListLongMap!16887)

(assert (=> b!1173002 (= lt!528626 (getCurrentListMapNoExtraKeys!4923 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99390 res!778865) b!1172998))

(assert (= (and b!1172998 res!778864) b!1172985))

(assert (= (and b!1172985 res!778874) b!1172996))

(assert (= (and b!1172996 res!778868) b!1172990))

(assert (= (and b!1172990 res!778872) b!1172983))

(assert (= (and b!1172983 res!778863) b!1172984))

(assert (= (and b!1172984 res!778867) b!1172987))

(assert (= (and b!1172987 res!778869) b!1172999))

(assert (= (and b!1172999 res!778862) b!1172997))

(assert (= (and b!1172997 res!778873) b!1172991))

(assert (= (and b!1172991 (not res!778871)) b!1173002))

(assert (= (and b!1173002 (not res!778875)) b!1172993))

(assert (= (and b!1172993 (not res!778866)) b!1172992))

(assert (= (and b!1172992 res!778870) b!1173000))

(assert (= (and b!1173000 (not res!778876)) b!1172994))

(assert (= (and b!1172992 c!116577) b!1172986))

(assert (= (and b!1172992 (not c!116577)) b!1173001))

(assert (= (and b!1172988 condMapEmpty!46076) mapIsEmpty!46076))

(assert (= (and b!1172988 (not condMapEmpty!46076)) mapNonEmpty!46076))

(get-info :version)

(assert (= (and mapNonEmpty!46076 ((_ is ValueCellFull!14040) mapValue!46076)) b!1172995))

(assert (= (and b!1172988 ((_ is ValueCellFull!14040) mapDefault!46076)) b!1172989))

(assert (= start!99390 b!1172988))

(declare-fun b_lambda!20113 () Bool)

(assert (=> (not b_lambda!20113) (not b!1173002)))

(declare-fun t!37616 () Bool)

(declare-fun tb!9781 () Bool)

(assert (=> (and start!99390 (= defaultEntry!1004 defaultEntry!1004) t!37616) tb!9781))

(declare-fun result!20129 () Bool)

(assert (=> tb!9781 (= result!20129 tp_is_empty!29499)))

(assert (=> b!1173002 t!37616))

(declare-fun b_and!40807 () Bool)

(assert (= b_and!40805 (and (=> t!37616 result!20129) b_and!40807)))

(declare-fun m!1080811 () Bool)

(assert (=> b!1172990 m!1080811))

(declare-fun m!1080813 () Bool)

(assert (=> mapNonEmpty!46076 m!1080813))

(declare-fun m!1080815 () Bool)

(assert (=> b!1172998 m!1080815))

(declare-fun m!1080817 () Bool)

(assert (=> b!1172991 m!1080817))

(declare-fun m!1080819 () Bool)

(assert (=> b!1172991 m!1080819))

(declare-fun m!1080821 () Bool)

(assert (=> b!1172986 m!1080821))

(declare-fun m!1080823 () Bool)

(assert (=> b!1172986 m!1080823))

(declare-fun m!1080825 () Bool)

(assert (=> b!1172986 m!1080825))

(declare-fun m!1080827 () Bool)

(assert (=> b!1172986 m!1080827))

(declare-fun m!1080829 () Bool)

(assert (=> b!1172986 m!1080829))

(declare-fun m!1080831 () Bool)

(assert (=> b!1173002 m!1080831))

(declare-fun m!1080833 () Bool)

(assert (=> b!1173002 m!1080833))

(declare-fun m!1080835 () Bool)

(assert (=> b!1173002 m!1080835))

(declare-fun m!1080837 () Bool)

(assert (=> b!1173002 m!1080837))

(declare-fun m!1080839 () Bool)

(assert (=> b!1172996 m!1080839))

(declare-fun m!1080841 () Bool)

(assert (=> b!1172992 m!1080841))

(declare-fun m!1080843 () Bool)

(assert (=> b!1172992 m!1080843))

(assert (=> b!1172992 m!1080843))

(declare-fun m!1080845 () Bool)

(assert (=> b!1172992 m!1080845))

(declare-fun m!1080847 () Bool)

(assert (=> b!1172992 m!1080847))

(declare-fun m!1080849 () Bool)

(assert (=> b!1172984 m!1080849))

(declare-fun m!1080851 () Bool)

(assert (=> b!1172994 m!1080851))

(declare-fun m!1080853 () Bool)

(assert (=> b!1172987 m!1080853))

(declare-fun m!1080855 () Bool)

(assert (=> b!1172993 m!1080855))

(declare-fun m!1080857 () Bool)

(assert (=> b!1172993 m!1080857))

(declare-fun m!1080859 () Bool)

(assert (=> b!1172993 m!1080859))

(assert (=> b!1172993 m!1080841))

(declare-fun m!1080861 () Bool)

(assert (=> b!1172993 m!1080861))

(declare-fun m!1080863 () Bool)

(assert (=> b!1172993 m!1080863))

(assert (=> b!1172993 m!1080841))

(declare-fun m!1080865 () Bool)

(assert (=> b!1172997 m!1080865))

(declare-fun m!1080867 () Bool)

(assert (=> b!1172999 m!1080867))

(declare-fun m!1080869 () Bool)

(assert (=> b!1172999 m!1080869))

(assert (=> b!1173000 m!1080841))

(declare-fun m!1080871 () Bool)

(assert (=> start!99390 m!1080871))

(declare-fun m!1080873 () Bool)

(assert (=> start!99390 m!1080873))

(check-sat (not b!1172993) (not b!1172990) (not mapNonEmpty!46076) (not start!99390) (not b_next!24969) (not b!1172992) tp_is_empty!29499 (not b!1172984) (not b!1172998) (not b!1172994) (not b!1173002) (not b!1172997) (not b_lambda!20113) b_and!40807 (not b!1172986) (not b!1172991) (not b!1172999) (not b!1172996))
(check-sat b_and!40807 (not b_next!24969))
