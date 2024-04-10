; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99486 () Bool)

(assert start!99486)

(declare-fun b_free!25065 () Bool)

(declare-fun b_next!25065 () Bool)

(assert (=> start!99486 (= b_free!25065 (not b_next!25065))))

(declare-fun tp!87908 () Bool)

(declare-fun b_and!40997 () Bool)

(assert (=> start!99486 (= tp!87908 b_and!40997)))

(declare-fun mapIsEmpty!46220 () Bool)

(declare-fun mapRes!46220 () Bool)

(assert (=> mapIsEmpty!46220 mapRes!46220))

(declare-datatypes ((array!75997 0))(
  ( (array!75998 (arr!36648 (Array (_ BitVec 32) (_ BitVec 64))) (size!37184 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75997)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1175959 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!668447 () Bool)

(declare-fun arrayContainsKey!0 (array!75997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175959 (= e!668447 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175960 () Bool)

(declare-fun e!668450 () Bool)

(declare-fun tp_is_empty!29595 () Bool)

(assert (=> b!1175960 (= e!668450 tp_is_empty!29595)))

(declare-fun b!1175961 () Bool)

(declare-fun res!781030 () Bool)

(declare-fun e!668448 () Bool)

(assert (=> b!1175961 (=> (not res!781030) (not e!668448))))

(assert (=> b!1175961 (= res!781030 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37184 _keys!1208))))))

(declare-fun b!1175962 () Bool)

(declare-fun res!781022 () Bool)

(declare-fun e!668451 () Bool)

(assert (=> b!1175962 (=> (not res!781022) (not e!668451))))

(declare-fun lt!530639 () array!75997)

(declare-datatypes ((List!25731 0))(
  ( (Nil!25728) (Cons!25727 (h!26936 (_ BitVec 64)) (t!37788 List!25731)) )
))
(declare-fun arrayNoDuplicates!0 (array!75997 (_ BitVec 32) List!25731) Bool)

(assert (=> b!1175962 (= res!781022 (arrayNoDuplicates!0 lt!530639 #b00000000000000000000000000000000 Nil!25728))))

(declare-fun b!1175963 () Bool)

(declare-fun e!668449 () Bool)

(declare-fun e!668454 () Bool)

(assert (=> b!1175963 (= e!668449 e!668454)))

(declare-fun res!781024 () Bool)

(assert (=> b!1175963 (=> res!781024 e!668454)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175963 (= res!781024 (not (validKeyInArray!0 (select (arr!36648 _keys!1208) from!1455))))))

(declare-datatypes ((V!44587 0))(
  ( (V!44588 (val!14854 Int)) )
))
(declare-datatypes ((tuple2!18990 0))(
  ( (tuple2!18991 (_1!9506 (_ BitVec 64)) (_2!9506 V!44587)) )
))
(declare-datatypes ((List!25732 0))(
  ( (Nil!25729) (Cons!25728 (h!26937 tuple2!18990) (t!37789 List!25732)) )
))
(declare-datatypes ((ListLongMap!16959 0))(
  ( (ListLongMap!16960 (toList!8495 List!25732)) )
))
(declare-fun lt!530633 () ListLongMap!16959)

(declare-fun lt!530642 () ListLongMap!16959)

(assert (=> b!1175963 (= lt!530633 lt!530642)))

(declare-fun lt!530637 () ListLongMap!16959)

(declare-fun -!1550 (ListLongMap!16959 (_ BitVec 64)) ListLongMap!16959)

(assert (=> b!1175963 (= lt!530642 (-!1550 lt!530637 k0!934))))

(declare-fun zeroValue!944 () V!44587)

(declare-datatypes ((ValueCell!14088 0))(
  ( (ValueCellFull!14088 (v!17492 V!44587)) (EmptyCell!14088) )
))
(declare-datatypes ((array!75999 0))(
  ( (array!76000 (arr!36649 (Array (_ BitVec 32) ValueCell!14088)) (size!37185 (_ BitVec 32))) )
))
(declare-fun lt!530645 () array!75999)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44587)

(declare-fun getCurrentListMapNoExtraKeys!4955 (array!75997 array!75999 (_ BitVec 32) (_ BitVec 32) V!44587 V!44587 (_ BitVec 32) Int) ListLongMap!16959)

(assert (=> b!1175963 (= lt!530633 (getCurrentListMapNoExtraKeys!4955 lt!530639 lt!530645 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75999)

(assert (=> b!1175963 (= lt!530637 (getCurrentListMapNoExtraKeys!4955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38812 0))(
  ( (Unit!38813) )
))
(declare-fun lt!530635 () Unit!38812)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!777 (array!75997 array!75999 (_ BitVec 32) (_ BitVec 32) V!44587 V!44587 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38812)

(assert (=> b!1175963 (= lt!530635 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!777 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175964 () Bool)

(declare-fun e!668458 () Bool)

(assert (=> b!1175964 (= e!668458 e!668447)))

(declare-fun res!781025 () Bool)

(assert (=> b!1175964 (=> res!781025 e!668447)))

(assert (=> b!1175964 (= res!781025 (not (= (select (arr!36648 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175965 () Bool)

(declare-fun res!781032 () Bool)

(assert (=> b!1175965 (=> (not res!781032) (not e!668448))))

(assert (=> b!1175965 (= res!781032 (= (select (arr!36648 _keys!1208) i!673) k0!934))))

(declare-fun b!1175966 () Bool)

(declare-fun e!668452 () Bool)

(assert (=> b!1175966 (= e!668452 e!668449)))

(declare-fun res!781028 () Bool)

(assert (=> b!1175966 (=> res!781028 e!668449)))

(assert (=> b!1175966 (= res!781028 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!530643 () ListLongMap!16959)

(assert (=> b!1175966 (= lt!530643 (getCurrentListMapNoExtraKeys!4955 lt!530639 lt!530645 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530640 () V!44587)

(assert (=> b!1175966 (= lt!530645 (array!76000 (store (arr!36649 _values!996) i!673 (ValueCellFull!14088 lt!530640)) (size!37185 _values!996)))))

(declare-fun dynLambda!2921 (Int (_ BitVec 64)) V!44587)

(assert (=> b!1175966 (= lt!530640 (dynLambda!2921 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530636 () ListLongMap!16959)

(assert (=> b!1175966 (= lt!530636 (getCurrentListMapNoExtraKeys!4955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175968 () Bool)

(declare-fun e!668456 () Bool)

(assert (=> b!1175968 (= e!668456 tp_is_empty!29595)))

(declare-fun b!1175969 () Bool)

(assert (=> b!1175969 (= e!668451 (not e!668452))))

(declare-fun res!781023 () Bool)

(assert (=> b!1175969 (=> res!781023 e!668452)))

(assert (=> b!1175969 (= res!781023 (bvsgt from!1455 i!673))))

(assert (=> b!1175969 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530638 () Unit!38812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75997 (_ BitVec 64) (_ BitVec 32)) Unit!38812)

(assert (=> b!1175969 (= lt!530638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175970 () Bool)

(declare-fun res!781036 () Bool)

(assert (=> b!1175970 (=> (not res!781036) (not e!668448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75997 (_ BitVec 32)) Bool)

(assert (=> b!1175970 (= res!781036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175971 () Bool)

(assert (=> b!1175971 (= e!668454 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37184 _keys!1208))))))

(assert (=> b!1175971 (not (= (select (arr!36648 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530634 () Unit!38812)

(declare-fun e!668453 () Unit!38812)

(assert (=> b!1175971 (= lt!530634 e!668453)))

(declare-fun c!116721 () Bool)

(assert (=> b!1175971 (= c!116721 (= (select (arr!36648 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175971 e!668458))

(declare-fun res!781029 () Bool)

(assert (=> b!1175971 (=> (not res!781029) (not e!668458))))

(declare-fun +!3811 (ListLongMap!16959 tuple2!18990) ListLongMap!16959)

(declare-fun get!18713 (ValueCell!14088 V!44587) V!44587)

(assert (=> b!1175971 (= res!781029 (= lt!530643 (+!3811 lt!530642 (tuple2!18991 (select (arr!36648 _keys!1208) from!1455) (get!18713 (select (arr!36649 _values!996) from!1455) lt!530640)))))))

(declare-fun b!1175972 () Bool)

(declare-fun Unit!38814 () Unit!38812)

(assert (=> b!1175972 (= e!668453 Unit!38814)))

(declare-fun b!1175973 () Bool)

(declare-fun res!781034 () Bool)

(assert (=> b!1175973 (=> (not res!781034) (not e!668448))))

(assert (=> b!1175973 (= res!781034 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25728))))

(declare-fun b!1175974 () Bool)

(declare-fun res!781033 () Bool)

(assert (=> b!1175974 (=> (not res!781033) (not e!668448))))

(assert (=> b!1175974 (= res!781033 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46220 () Bool)

(declare-fun tp!87909 () Bool)

(assert (=> mapNonEmpty!46220 (= mapRes!46220 (and tp!87909 e!668450))))

(declare-fun mapValue!46220 () ValueCell!14088)

(declare-fun mapRest!46220 () (Array (_ BitVec 32) ValueCell!14088))

(declare-fun mapKey!46220 () (_ BitVec 32))

(assert (=> mapNonEmpty!46220 (= (arr!36649 _values!996) (store mapRest!46220 mapKey!46220 mapValue!46220))))

(declare-fun b!1175975 () Bool)

(declare-fun e!668455 () Bool)

(assert (=> b!1175975 (= e!668455 (and e!668456 mapRes!46220))))

(declare-fun condMapEmpty!46220 () Bool)

(declare-fun mapDefault!46220 () ValueCell!14088)

(assert (=> b!1175975 (= condMapEmpty!46220 (= (arr!36649 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14088)) mapDefault!46220)))))

(declare-fun b!1175976 () Bool)

(assert (=> b!1175976 (= e!668448 e!668451)))

(declare-fun res!781031 () Bool)

(assert (=> b!1175976 (=> (not res!781031) (not e!668451))))

(assert (=> b!1175976 (= res!781031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530639 mask!1564))))

(assert (=> b!1175976 (= lt!530639 (array!75998 (store (arr!36648 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37184 _keys!1208)))))

(declare-fun b!1175977 () Bool)

(declare-fun res!781035 () Bool)

(assert (=> b!1175977 (=> (not res!781035) (not e!668448))))

(assert (=> b!1175977 (= res!781035 (and (= (size!37185 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37184 _keys!1208) (size!37185 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175978 () Bool)

(declare-fun Unit!38815 () Unit!38812)

(assert (=> b!1175978 (= e!668453 Unit!38815)))

(declare-fun lt!530641 () Unit!38812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75997 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38812)

(assert (=> b!1175978 (= lt!530641 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175978 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530646 () Unit!38812)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75997 (_ BitVec 32) (_ BitVec 32)) Unit!38812)

(assert (=> b!1175978 (= lt!530646 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175978 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25728)))

(declare-fun lt!530644 () Unit!38812)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75997 (_ BitVec 64) (_ BitVec 32) List!25731) Unit!38812)

(assert (=> b!1175978 (= lt!530644 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25728))))

(assert (=> b!1175978 false))

(declare-fun res!781026 () Bool)

(assert (=> start!99486 (=> (not res!781026) (not e!668448))))

(assert (=> start!99486 (= res!781026 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37184 _keys!1208))))))

(assert (=> start!99486 e!668448))

(assert (=> start!99486 tp_is_empty!29595))

(declare-fun array_inv!27992 (array!75997) Bool)

(assert (=> start!99486 (array_inv!27992 _keys!1208)))

(assert (=> start!99486 true))

(assert (=> start!99486 tp!87908))

(declare-fun array_inv!27993 (array!75999) Bool)

(assert (=> start!99486 (and (array_inv!27993 _values!996) e!668455)))

(declare-fun b!1175967 () Bool)

(declare-fun res!781027 () Bool)

(assert (=> b!1175967 (=> (not res!781027) (not e!668448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175967 (= res!781027 (validMask!0 mask!1564))))

(assert (= (and start!99486 res!781026) b!1175967))

(assert (= (and b!1175967 res!781027) b!1175977))

(assert (= (and b!1175977 res!781035) b!1175970))

(assert (= (and b!1175970 res!781036) b!1175973))

(assert (= (and b!1175973 res!781034) b!1175961))

(assert (= (and b!1175961 res!781030) b!1175974))

(assert (= (and b!1175974 res!781033) b!1175965))

(assert (= (and b!1175965 res!781032) b!1175976))

(assert (= (and b!1175976 res!781031) b!1175962))

(assert (= (and b!1175962 res!781022) b!1175969))

(assert (= (and b!1175969 (not res!781023)) b!1175966))

(assert (= (and b!1175966 (not res!781028)) b!1175963))

(assert (= (and b!1175963 (not res!781024)) b!1175971))

(assert (= (and b!1175971 res!781029) b!1175964))

(assert (= (and b!1175964 (not res!781025)) b!1175959))

(assert (= (and b!1175971 c!116721) b!1175978))

(assert (= (and b!1175971 (not c!116721)) b!1175972))

(assert (= (and b!1175975 condMapEmpty!46220) mapIsEmpty!46220))

(assert (= (and b!1175975 (not condMapEmpty!46220)) mapNonEmpty!46220))

(get-info :version)

(assert (= (and mapNonEmpty!46220 ((_ is ValueCellFull!14088) mapValue!46220)) b!1175960))

(assert (= (and b!1175975 ((_ is ValueCellFull!14088) mapDefault!46220)) b!1175968))

(assert (= start!99486 b!1175975))

(declare-fun b_lambda!20209 () Bool)

(assert (=> (not b_lambda!20209) (not b!1175966)))

(declare-fun t!37787 () Bool)

(declare-fun tb!9877 () Bool)

(assert (=> (and start!99486 (= defaultEntry!1004 defaultEntry!1004) t!37787) tb!9877))

(declare-fun result!20321 () Bool)

(assert (=> tb!9877 (= result!20321 tp_is_empty!29595)))

(assert (=> b!1175966 t!37787))

(declare-fun b_and!40999 () Bool)

(assert (= b_and!40997 (and (=> t!37787 result!20321) b_and!40999)))

(declare-fun m!1083883 () Bool)

(assert (=> b!1175976 m!1083883))

(declare-fun m!1083885 () Bool)

(assert (=> b!1175976 m!1083885))

(declare-fun m!1083887 () Bool)

(assert (=> mapNonEmpty!46220 m!1083887))

(declare-fun m!1083889 () Bool)

(assert (=> b!1175959 m!1083889))

(declare-fun m!1083891 () Bool)

(assert (=> b!1175974 m!1083891))

(declare-fun m!1083893 () Bool)

(assert (=> start!99486 m!1083893))

(declare-fun m!1083895 () Bool)

(assert (=> start!99486 m!1083895))

(declare-fun m!1083897 () Bool)

(assert (=> b!1175973 m!1083897))

(declare-fun m!1083899 () Bool)

(assert (=> b!1175967 m!1083899))

(declare-fun m!1083901 () Bool)

(assert (=> b!1175966 m!1083901))

(declare-fun m!1083903 () Bool)

(assert (=> b!1175966 m!1083903))

(declare-fun m!1083905 () Bool)

(assert (=> b!1175966 m!1083905))

(declare-fun m!1083907 () Bool)

(assert (=> b!1175966 m!1083907))

(declare-fun m!1083909 () Bool)

(assert (=> b!1175978 m!1083909))

(declare-fun m!1083911 () Bool)

(assert (=> b!1175978 m!1083911))

(declare-fun m!1083913 () Bool)

(assert (=> b!1175978 m!1083913))

(declare-fun m!1083915 () Bool)

(assert (=> b!1175978 m!1083915))

(declare-fun m!1083917 () Bool)

(assert (=> b!1175978 m!1083917))

(declare-fun m!1083919 () Bool)

(assert (=> b!1175963 m!1083919))

(declare-fun m!1083921 () Bool)

(assert (=> b!1175963 m!1083921))

(declare-fun m!1083923 () Bool)

(assert (=> b!1175963 m!1083923))

(declare-fun m!1083925 () Bool)

(assert (=> b!1175963 m!1083925))

(declare-fun m!1083927 () Bool)

(assert (=> b!1175963 m!1083927))

(declare-fun m!1083929 () Bool)

(assert (=> b!1175963 m!1083929))

(assert (=> b!1175963 m!1083925))

(declare-fun m!1083931 () Bool)

(assert (=> b!1175962 m!1083931))

(declare-fun m!1083933 () Bool)

(assert (=> b!1175970 m!1083933))

(assert (=> b!1175964 m!1083925))

(declare-fun m!1083935 () Bool)

(assert (=> b!1175969 m!1083935))

(declare-fun m!1083937 () Bool)

(assert (=> b!1175969 m!1083937))

(declare-fun m!1083939 () Bool)

(assert (=> b!1175965 m!1083939))

(assert (=> b!1175971 m!1083925))

(declare-fun m!1083941 () Bool)

(assert (=> b!1175971 m!1083941))

(assert (=> b!1175971 m!1083941))

(declare-fun m!1083943 () Bool)

(assert (=> b!1175971 m!1083943))

(declare-fun m!1083945 () Bool)

(assert (=> b!1175971 m!1083945))

(check-sat (not b!1175970) (not b!1175963) (not b_lambda!20209) tp_is_empty!29595 (not b!1175978) (not b!1175976) (not b!1175971) (not b!1175967) (not b!1175969) b_and!40999 (not b!1175966) (not b!1175962) (not start!99486) (not b!1175974) (not mapNonEmpty!46220) (not b!1175973) (not b!1175959) (not b_next!25065))
(check-sat b_and!40999 (not b_next!25065))
