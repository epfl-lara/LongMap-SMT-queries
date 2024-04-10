; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99666 () Bool)

(assert start!99666)

(declare-fun b_free!25245 () Bool)

(declare-fun b_next!25245 () Bool)

(assert (=> start!99666 (= b_free!25245 (not b_next!25245))))

(declare-fun tp!88449 () Bool)

(declare-fun b_and!41357 () Bool)

(assert (=> start!99666 (= tp!88449 b_and!41357)))

(declare-fun b!1181881 () Bool)

(declare-fun e!671948 () Bool)

(declare-fun e!671947 () Bool)

(assert (=> b!1181881 (= e!671948 e!671947)))

(declare-fun res!785425 () Bool)

(assert (=> b!1181881 (=> res!785425 e!671947)))

(declare-datatypes ((array!76353 0))(
  ( (array!76354 (arr!36826 (Array (_ BitVec 32) (_ BitVec 64))) (size!37362 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76353)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181881 (= res!785425 (not (validKeyInArray!0 (select (arr!36826 _keys!1208) from!1455))))))

(declare-datatypes ((V!44827 0))(
  ( (V!44828 (val!14944 Int)) )
))
(declare-datatypes ((tuple2!19148 0))(
  ( (tuple2!19149 (_1!9585 (_ BitVec 64)) (_2!9585 V!44827)) )
))
(declare-datatypes ((List!25888 0))(
  ( (Nil!25885) (Cons!25884 (h!27093 tuple2!19148) (t!38125 List!25888)) )
))
(declare-datatypes ((ListLongMap!17117 0))(
  ( (ListLongMap!17118 (toList!8574 List!25888)) )
))
(declare-fun lt!534747 () ListLongMap!17117)

(declare-fun lt!534753 () ListLongMap!17117)

(assert (=> b!1181881 (= lt!534747 lt!534753)))

(declare-fun lt!534752 () ListLongMap!17117)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1613 (ListLongMap!17117 (_ BitVec 64)) ListLongMap!17117)

(assert (=> b!1181881 (= lt!534753 (-!1613 lt!534752 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14178 0))(
  ( (ValueCellFull!14178 (v!17582 V!44827)) (EmptyCell!14178) )
))
(declare-datatypes ((array!76355 0))(
  ( (array!76356 (arr!36827 (Array (_ BitVec 32) ValueCell!14178)) (size!37363 (_ BitVec 32))) )
))
(declare-fun lt!534748 () array!76355)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44827)

(declare-fun lt!534741 () array!76353)

(declare-fun zeroValue!944 () V!44827)

(declare-fun getCurrentListMapNoExtraKeys!5027 (array!76353 array!76355 (_ BitVec 32) (_ BitVec 32) V!44827 V!44827 (_ BitVec 32) Int) ListLongMap!17117)

(assert (=> b!1181881 (= lt!534747 (getCurrentListMapNoExtraKeys!5027 lt!534741 lt!534748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76355)

(assert (=> b!1181881 (= lt!534752 (getCurrentListMapNoExtraKeys!5027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39092 0))(
  ( (Unit!39093) )
))
(declare-fun lt!534736 () Unit!39092)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!838 (array!76353 array!76355 (_ BitVec 32) (_ BitVec 32) V!44827 V!44827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39092)

(assert (=> b!1181881 (= lt!534736 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181882 () Bool)

(declare-fun res!785423 () Bool)

(declare-fun e!671944 () Bool)

(assert (=> b!1181882 (=> (not res!785423) (not e!671944))))

(assert (=> b!1181882 (= res!785423 (and (= (size!37363 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37362 _keys!1208) (size!37363 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181883 () Bool)

(declare-fun e!671940 () Bool)

(declare-fun tp_is_empty!29775 () Bool)

(assert (=> b!1181883 (= e!671940 tp_is_empty!29775)))

(declare-fun b!1181884 () Bool)

(assert (=> b!1181884 (= e!671947 true)))

(declare-fun lt!534750 () ListLongMap!17117)

(declare-fun lt!534751 () ListLongMap!17117)

(assert (=> b!1181884 (= (-!1613 lt!534750 k0!934) lt!534751)))

(declare-fun lt!534739 () Unit!39092)

(declare-fun lt!534737 () V!44827)

(declare-fun addRemoveCommutativeForDiffKeys!144 (ListLongMap!17117 (_ BitVec 64) V!44827 (_ BitVec 64)) Unit!39092)

(assert (=> b!1181884 (= lt!534739 (addRemoveCommutativeForDiffKeys!144 lt!534752 (select (arr!36826 _keys!1208) from!1455) lt!534737 k0!934))))

(declare-fun lt!534744 () ListLongMap!17117)

(assert (=> b!1181884 (and (= lt!534744 lt!534750) (= lt!534753 lt!534747))))

(declare-fun lt!534735 () tuple2!19148)

(declare-fun +!3881 (ListLongMap!17117 tuple2!19148) ListLongMap!17117)

(assert (=> b!1181884 (= lt!534750 (+!3881 lt!534752 lt!534735))))

(assert (=> b!1181884 (not (= (select (arr!36826 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534749 () Unit!39092)

(declare-fun e!671946 () Unit!39092)

(assert (=> b!1181884 (= lt!534749 e!671946)))

(declare-fun c!116991 () Bool)

(assert (=> b!1181884 (= c!116991 (= (select (arr!36826 _keys!1208) from!1455) k0!934))))

(declare-fun e!671945 () Bool)

(assert (=> b!1181884 e!671945))

(declare-fun res!785424 () Bool)

(assert (=> b!1181884 (=> (not res!785424) (not e!671945))))

(declare-fun lt!534745 () ListLongMap!17117)

(assert (=> b!1181884 (= res!785424 (= lt!534745 lt!534751))))

(assert (=> b!1181884 (= lt!534751 (+!3881 lt!534753 lt!534735))))

(assert (=> b!1181884 (= lt!534735 (tuple2!19149 (select (arr!36826 _keys!1208) from!1455) lt!534737))))

(declare-fun lt!534743 () V!44827)

(declare-fun get!18836 (ValueCell!14178 V!44827) V!44827)

(assert (=> b!1181884 (= lt!534737 (get!18836 (select (arr!36827 _values!996) from!1455) lt!534743))))

(declare-fun b!1181885 () Bool)

(declare-fun res!785418 () Bool)

(assert (=> b!1181885 (=> (not res!785418) (not e!671944))))

(declare-datatypes ((List!25889 0))(
  ( (Nil!25886) (Cons!25885 (h!27094 (_ BitVec 64)) (t!38126 List!25889)) )
))
(declare-fun arrayNoDuplicates!0 (array!76353 (_ BitVec 32) List!25889) Bool)

(assert (=> b!1181885 (= res!785418 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25886))))

(declare-fun b!1181886 () Bool)

(declare-fun res!785414 () Bool)

(assert (=> b!1181886 (=> (not res!785414) (not e!671944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181886 (= res!785414 (validMask!0 mask!1564))))

(declare-fun b!1181887 () Bool)

(declare-fun e!671939 () Bool)

(assert (=> b!1181887 (= e!671945 e!671939)))

(declare-fun res!785416 () Bool)

(assert (=> b!1181887 (=> res!785416 e!671939)))

(assert (=> b!1181887 (= res!785416 (not (= (select (arr!36826 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181888 () Bool)

(declare-fun res!785422 () Bool)

(assert (=> b!1181888 (=> (not res!785422) (not e!671944))))

(assert (=> b!1181888 (= res!785422 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37362 _keys!1208))))))

(declare-fun res!785426 () Bool)

(assert (=> start!99666 (=> (not res!785426) (not e!671944))))

(assert (=> start!99666 (= res!785426 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37362 _keys!1208))))))

(assert (=> start!99666 e!671944))

(assert (=> start!99666 tp_is_empty!29775))

(declare-fun array_inv!28118 (array!76353) Bool)

(assert (=> start!99666 (array_inv!28118 _keys!1208)))

(assert (=> start!99666 true))

(assert (=> start!99666 tp!88449))

(declare-fun e!671943 () Bool)

(declare-fun array_inv!28119 (array!76355) Bool)

(assert (=> start!99666 (and (array_inv!28119 _values!996) e!671943)))

(declare-fun b!1181889 () Bool)

(declare-fun Unit!39094 () Unit!39092)

(assert (=> b!1181889 (= e!671946 Unit!39094)))

(declare-fun b!1181890 () Bool)

(declare-fun arrayContainsKey!0 (array!76353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181890 (= e!671939 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181891 () Bool)

(declare-fun Unit!39095 () Unit!39092)

(assert (=> b!1181891 (= e!671946 Unit!39095)))

(declare-fun lt!534740 () Unit!39092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39092)

(assert (=> b!1181891 (= lt!534740 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181891 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534742 () Unit!39092)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76353 (_ BitVec 32) (_ BitVec 32)) Unit!39092)

(assert (=> b!1181891 (= lt!534742 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181891 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25886)))

(declare-fun lt!534746 () Unit!39092)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76353 (_ BitVec 64) (_ BitVec 32) List!25889) Unit!39092)

(assert (=> b!1181891 (= lt!534746 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25886))))

(assert (=> b!1181891 false))

(declare-fun b!1181892 () Bool)

(declare-fun res!785420 () Bool)

(assert (=> b!1181892 (=> (not res!785420) (not e!671944))))

(assert (=> b!1181892 (= res!785420 (validKeyInArray!0 k0!934))))

(declare-fun b!1181893 () Bool)

(declare-fun res!785415 () Bool)

(assert (=> b!1181893 (=> (not res!785415) (not e!671944))))

(assert (=> b!1181893 (= res!785415 (= (select (arr!36826 _keys!1208) i!673) k0!934))))

(declare-fun b!1181894 () Bool)

(declare-fun e!671949 () Bool)

(declare-fun mapRes!46490 () Bool)

(assert (=> b!1181894 (= e!671943 (and e!671949 mapRes!46490))))

(declare-fun condMapEmpty!46490 () Bool)

(declare-fun mapDefault!46490 () ValueCell!14178)

(assert (=> b!1181894 (= condMapEmpty!46490 (= (arr!36827 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14178)) mapDefault!46490)))))

(declare-fun mapIsEmpty!46490 () Bool)

(assert (=> mapIsEmpty!46490 mapRes!46490))

(declare-fun b!1181895 () Bool)

(assert (=> b!1181895 (= e!671949 tp_is_empty!29775)))

(declare-fun b!1181896 () Bool)

(declare-fun e!671941 () Bool)

(assert (=> b!1181896 (= e!671944 e!671941)))

(declare-fun res!785421 () Bool)

(assert (=> b!1181896 (=> (not res!785421) (not e!671941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76353 (_ BitVec 32)) Bool)

(assert (=> b!1181896 (= res!785421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534741 mask!1564))))

(assert (=> b!1181896 (= lt!534741 (array!76354 (store (arr!36826 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37362 _keys!1208)))))

(declare-fun b!1181897 () Bool)

(declare-fun res!785419 () Bool)

(assert (=> b!1181897 (=> (not res!785419) (not e!671944))))

(assert (=> b!1181897 (= res!785419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181898 () Bool)

(declare-fun e!671950 () Bool)

(assert (=> b!1181898 (= e!671941 (not e!671950))))

(declare-fun res!785417 () Bool)

(assert (=> b!1181898 (=> res!785417 e!671950)))

(assert (=> b!1181898 (= res!785417 (bvsgt from!1455 i!673))))

(assert (=> b!1181898 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534738 () Unit!39092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76353 (_ BitVec 64) (_ BitVec 32)) Unit!39092)

(assert (=> b!1181898 (= lt!534738 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46490 () Bool)

(declare-fun tp!88448 () Bool)

(assert (=> mapNonEmpty!46490 (= mapRes!46490 (and tp!88448 e!671940))))

(declare-fun mapRest!46490 () (Array (_ BitVec 32) ValueCell!14178))

(declare-fun mapKey!46490 () (_ BitVec 32))

(declare-fun mapValue!46490 () ValueCell!14178)

(assert (=> mapNonEmpty!46490 (= (arr!36827 _values!996) (store mapRest!46490 mapKey!46490 mapValue!46490))))

(declare-fun b!1181899 () Bool)

(assert (=> b!1181899 (= e!671950 e!671948)))

(declare-fun res!785427 () Bool)

(assert (=> b!1181899 (=> res!785427 e!671948)))

(assert (=> b!1181899 (= res!785427 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1181899 (= lt!534745 (getCurrentListMapNoExtraKeys!5027 lt!534741 lt!534748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1181899 (= lt!534748 (array!76356 (store (arr!36827 _values!996) i!673 (ValueCellFull!14178 lt!534743)) (size!37363 _values!996)))))

(declare-fun dynLambda!2982 (Int (_ BitVec 64)) V!44827)

(assert (=> b!1181899 (= lt!534743 (dynLambda!2982 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181899 (= lt!534744 (getCurrentListMapNoExtraKeys!5027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181900 () Bool)

(declare-fun res!785428 () Bool)

(assert (=> b!1181900 (=> (not res!785428) (not e!671941))))

(assert (=> b!1181900 (= res!785428 (arrayNoDuplicates!0 lt!534741 #b00000000000000000000000000000000 Nil!25886))))

(assert (= (and start!99666 res!785426) b!1181886))

(assert (= (and b!1181886 res!785414) b!1181882))

(assert (= (and b!1181882 res!785423) b!1181897))

(assert (= (and b!1181897 res!785419) b!1181885))

(assert (= (and b!1181885 res!785418) b!1181888))

(assert (= (and b!1181888 res!785422) b!1181892))

(assert (= (and b!1181892 res!785420) b!1181893))

(assert (= (and b!1181893 res!785415) b!1181896))

(assert (= (and b!1181896 res!785421) b!1181900))

(assert (= (and b!1181900 res!785428) b!1181898))

(assert (= (and b!1181898 (not res!785417)) b!1181899))

(assert (= (and b!1181899 (not res!785427)) b!1181881))

(assert (= (and b!1181881 (not res!785425)) b!1181884))

(assert (= (and b!1181884 res!785424) b!1181887))

(assert (= (and b!1181887 (not res!785416)) b!1181890))

(assert (= (and b!1181884 c!116991) b!1181891))

(assert (= (and b!1181884 (not c!116991)) b!1181889))

(assert (= (and b!1181894 condMapEmpty!46490) mapIsEmpty!46490))

(assert (= (and b!1181894 (not condMapEmpty!46490)) mapNonEmpty!46490))

(get-info :version)

(assert (= (and mapNonEmpty!46490 ((_ is ValueCellFull!14178) mapValue!46490)) b!1181883))

(assert (= (and b!1181894 ((_ is ValueCellFull!14178) mapDefault!46490)) b!1181895))

(assert (= start!99666 b!1181894))

(declare-fun b_lambda!20389 () Bool)

(assert (=> (not b_lambda!20389) (not b!1181899)))

(declare-fun t!38124 () Bool)

(declare-fun tb!10057 () Bool)

(assert (=> (and start!99666 (= defaultEntry!1004 defaultEntry!1004) t!38124) tb!10057))

(declare-fun result!20681 () Bool)

(assert (=> tb!10057 (= result!20681 tp_is_empty!29775)))

(assert (=> b!1181899 t!38124))

(declare-fun b_and!41359 () Bool)

(assert (= b_and!41357 (and (=> t!38124 result!20681) b_and!41359)))

(declare-fun m!1089835 () Bool)

(assert (=> b!1181897 m!1089835))

(declare-fun m!1089837 () Bool)

(assert (=> b!1181890 m!1089837))

(declare-fun m!1089839 () Bool)

(assert (=> b!1181887 m!1089839))

(declare-fun m!1089841 () Bool)

(assert (=> b!1181900 m!1089841))

(declare-fun m!1089843 () Bool)

(assert (=> start!99666 m!1089843))

(declare-fun m!1089845 () Bool)

(assert (=> start!99666 m!1089845))

(declare-fun m!1089847 () Bool)

(assert (=> b!1181896 m!1089847))

(declare-fun m!1089849 () Bool)

(assert (=> b!1181896 m!1089849))

(declare-fun m!1089851 () Bool)

(assert (=> b!1181899 m!1089851))

(declare-fun m!1089853 () Bool)

(assert (=> b!1181899 m!1089853))

(declare-fun m!1089855 () Bool)

(assert (=> b!1181899 m!1089855))

(declare-fun m!1089857 () Bool)

(assert (=> b!1181899 m!1089857))

(declare-fun m!1089859 () Bool)

(assert (=> b!1181892 m!1089859))

(declare-fun m!1089861 () Bool)

(assert (=> b!1181891 m!1089861))

(declare-fun m!1089863 () Bool)

(assert (=> b!1181891 m!1089863))

(declare-fun m!1089865 () Bool)

(assert (=> b!1181891 m!1089865))

(declare-fun m!1089867 () Bool)

(assert (=> b!1181891 m!1089867))

(declare-fun m!1089869 () Bool)

(assert (=> b!1181891 m!1089869))

(declare-fun m!1089871 () Bool)

(assert (=> mapNonEmpty!46490 m!1089871))

(declare-fun m!1089873 () Bool)

(assert (=> b!1181886 m!1089873))

(declare-fun m!1089875 () Bool)

(assert (=> b!1181885 m!1089875))

(declare-fun m!1089877 () Bool)

(assert (=> b!1181893 m!1089877))

(declare-fun m!1089879 () Bool)

(assert (=> b!1181881 m!1089879))

(assert (=> b!1181881 m!1089839))

(declare-fun m!1089881 () Bool)

(assert (=> b!1181881 m!1089881))

(declare-fun m!1089883 () Bool)

(assert (=> b!1181881 m!1089883))

(assert (=> b!1181881 m!1089839))

(declare-fun m!1089885 () Bool)

(assert (=> b!1181881 m!1089885))

(declare-fun m!1089887 () Bool)

(assert (=> b!1181881 m!1089887))

(declare-fun m!1089889 () Bool)

(assert (=> b!1181898 m!1089889))

(declare-fun m!1089891 () Bool)

(assert (=> b!1181898 m!1089891))

(declare-fun m!1089893 () Bool)

(assert (=> b!1181884 m!1089893))

(declare-fun m!1089895 () Bool)

(assert (=> b!1181884 m!1089895))

(assert (=> b!1181884 m!1089839))

(declare-fun m!1089897 () Bool)

(assert (=> b!1181884 m!1089897))

(assert (=> b!1181884 m!1089893))

(declare-fun m!1089899 () Bool)

(assert (=> b!1181884 m!1089899))

(assert (=> b!1181884 m!1089839))

(declare-fun m!1089901 () Bool)

(assert (=> b!1181884 m!1089901))

(declare-fun m!1089903 () Bool)

(assert (=> b!1181884 m!1089903))

(check-sat (not b!1181890) (not b!1181891) (not b!1181900) (not b!1181892) (not start!99666) tp_is_empty!29775 (not b!1181897) (not b_next!25245) (not b!1181885) (not b!1181886) (not mapNonEmpty!46490) (not b!1181899) (not b!1181881) b_and!41359 (not b_lambda!20389) (not b!1181884) (not b!1181896) (not b!1181898))
(check-sat b_and!41359 (not b_next!25245))
