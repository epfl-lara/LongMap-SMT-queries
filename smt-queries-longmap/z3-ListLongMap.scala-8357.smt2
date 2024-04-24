; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101960 () Bool)

(assert start!101960)

(declare-fun b_free!26413 () Bool)

(declare-fun b_next!26413 () Bool)

(assert (=> start!101960 (= b_free!26413 (not b_next!26413))))

(declare-fun tp!92285 () Bool)

(declare-fun b_and!44089 () Bool)

(assert (=> start!101960 (= tp!92285 b_and!44089)))

(declare-fun b!1225520 () Bool)

(declare-datatypes ((Unit!40525 0))(
  ( (Unit!40526) )
))
(declare-fun e!696138 () Unit!40525)

(declare-fun Unit!40527 () Unit!40525)

(assert (=> b!1225520 (= e!696138 Unit!40527)))

(declare-fun b!1225521 () Bool)

(declare-fun res!813985 () Bool)

(declare-fun e!696142 () Bool)

(assert (=> b!1225521 (=> (not res!813985) (not e!696142))))

(declare-datatypes ((array!79055 0))(
  ( (array!79056 (arr!38148 (Array (_ BitVec 32) (_ BitVec 64))) (size!38685 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79055)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46617 0))(
  ( (V!46618 (val!15615 Int)) )
))
(declare-datatypes ((ValueCell!14849 0))(
  ( (ValueCellFull!14849 (v!18273 V!46617)) (EmptyCell!14849) )
))
(declare-datatypes ((array!79057 0))(
  ( (array!79058 (arr!38149 (Array (_ BitVec 32) ValueCell!14849)) (size!38686 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79057)

(assert (=> b!1225521 (= res!813985 (and (= (size!38686 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38685 _keys!1208) (size!38686 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225522 () Bool)

(declare-fun e!696143 () Bool)

(declare-fun tp_is_empty!31117 () Bool)

(assert (=> b!1225522 (= e!696143 tp_is_empty!31117)))

(declare-fun b!1225523 () Bool)

(declare-fun e!696148 () Bool)

(declare-fun mapRes!48574 () Bool)

(assert (=> b!1225523 (= e!696148 (and e!696143 mapRes!48574))))

(declare-fun condMapEmpty!48574 () Bool)

(declare-fun mapDefault!48574 () ValueCell!14849)

(assert (=> b!1225523 (= condMapEmpty!48574 (= (arr!38149 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14849)) mapDefault!48574)))))

(declare-fun res!813993 () Bool)

(assert (=> start!101960 (=> (not res!813993) (not e!696142))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101960 (= res!813993 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38685 _keys!1208))))))

(assert (=> start!101960 e!696142))

(assert (=> start!101960 tp_is_empty!31117))

(declare-fun array_inv!29102 (array!79055) Bool)

(assert (=> start!101960 (array_inv!29102 _keys!1208)))

(assert (=> start!101960 true))

(assert (=> start!101960 tp!92285))

(declare-fun array_inv!29103 (array!79057) Bool)

(assert (=> start!101960 (and (array_inv!29103 _values!996) e!696148)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!696139 () Bool)

(declare-fun b!1225524 () Bool)

(declare-fun arrayContainsKey!0 (array!79055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225524 (= e!696139 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225525 () Bool)

(declare-fun e!696136 () Bool)

(declare-fun e!696146 () Bool)

(assert (=> b!1225525 (= e!696136 e!696146)))

(declare-fun res!813991 () Bool)

(assert (=> b!1225525 (=> res!813991 e!696146)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225525 (= res!813991 (not (validKeyInArray!0 (select (arr!38148 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20132 0))(
  ( (tuple2!20133 (_1!10077 (_ BitVec 64)) (_2!10077 V!46617)) )
))
(declare-datatypes ((List!26946 0))(
  ( (Nil!26943) (Cons!26942 (h!28160 tuple2!20132) (t!40331 List!26946)) )
))
(declare-datatypes ((ListLongMap!18109 0))(
  ( (ListLongMap!18110 (toList!9070 List!26946)) )
))
(declare-fun lt!557868 () ListLongMap!18109)

(declare-fun lt!557865 () ListLongMap!18109)

(assert (=> b!1225525 (= lt!557868 lt!557865)))

(declare-fun lt!557866 () ListLongMap!18109)

(declare-fun -!1943 (ListLongMap!18109 (_ BitVec 64)) ListLongMap!18109)

(assert (=> b!1225525 (= lt!557865 (-!1943 lt!557866 k0!934))))

(declare-fun zeroValue!944 () V!46617)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557876 () array!79057)

(declare-fun minValue!944 () V!46617)

(declare-fun lt!557874 () array!79055)

(declare-fun getCurrentListMapNoExtraKeys!5519 (array!79055 array!79057 (_ BitVec 32) (_ BitVec 32) V!46617 V!46617 (_ BitVec 32) Int) ListLongMap!18109)

(assert (=> b!1225525 (= lt!557868 (getCurrentListMapNoExtraKeys!5519 lt!557874 lt!557876 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225525 (= lt!557866 (getCurrentListMapNoExtraKeys!5519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557873 () Unit!40525)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1158 (array!79055 array!79057 (_ BitVec 32) (_ BitVec 32) V!46617 V!46617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40525)

(assert (=> b!1225525 (= lt!557873 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1158 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225526 () Bool)

(declare-fun e!696140 () Bool)

(assert (=> b!1225526 (= e!696140 tp_is_empty!31117)))

(declare-fun mapNonEmpty!48574 () Bool)

(declare-fun tp!92284 () Bool)

(assert (=> mapNonEmpty!48574 (= mapRes!48574 (and tp!92284 e!696140))))

(declare-fun mapValue!48574 () ValueCell!14849)

(declare-fun mapRest!48574 () (Array (_ BitVec 32) ValueCell!14849))

(declare-fun mapKey!48574 () (_ BitVec 32))

(assert (=> mapNonEmpty!48574 (= (arr!38149 _values!996) (store mapRest!48574 mapKey!48574 mapValue!48574))))

(declare-fun b!1225527 () Bool)

(declare-fun res!813982 () Bool)

(assert (=> b!1225527 (=> (not res!813982) (not e!696142))))

(assert (=> b!1225527 (= res!813982 (= (select (arr!38148 _keys!1208) i!673) k0!934))))

(declare-fun b!1225528 () Bool)

(declare-fun res!813987 () Bool)

(assert (=> b!1225528 (=> (not res!813987) (not e!696142))))

(assert (=> b!1225528 (= res!813987 (validKeyInArray!0 k0!934))))

(declare-fun b!1225529 () Bool)

(declare-fun res!813979 () Bool)

(assert (=> b!1225529 (=> (not res!813979) (not e!696142))))

(declare-datatypes ((List!26947 0))(
  ( (Nil!26944) (Cons!26943 (h!28161 (_ BitVec 64)) (t!40332 List!26947)) )
))
(declare-fun arrayNoDuplicates!0 (array!79055 (_ BitVec 32) List!26947) Bool)

(assert (=> b!1225529 (= res!813979 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26944))))

(declare-fun b!1225530 () Bool)

(declare-fun res!813988 () Bool)

(assert (=> b!1225530 (=> (not res!813988) (not e!696142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79055 (_ BitVec 32)) Bool)

(assert (=> b!1225530 (= res!813988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225531 () Bool)

(declare-fun res!813990 () Bool)

(assert (=> b!1225531 (=> (not res!813990) (not e!696142))))

(assert (=> b!1225531 (= res!813990 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38685 _keys!1208))))))

(declare-fun b!1225532 () Bool)

(declare-fun Unit!40528 () Unit!40525)

(assert (=> b!1225532 (= e!696138 Unit!40528)))

(declare-fun lt!557862 () Unit!40525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79055 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40525)

(assert (=> b!1225532 (= lt!557862 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225532 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557864 () Unit!40525)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79055 (_ BitVec 32) (_ BitVec 32)) Unit!40525)

(assert (=> b!1225532 (= lt!557864 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225532 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26944)))

(declare-fun lt!557867 () Unit!40525)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79055 (_ BitVec 64) (_ BitVec 32) List!26947) Unit!40525)

(assert (=> b!1225532 (= lt!557867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26944))))

(assert (=> b!1225532 false))

(declare-fun mapIsEmpty!48574 () Bool)

(assert (=> mapIsEmpty!48574 mapRes!48574))

(declare-fun b!1225533 () Bool)

(declare-fun e!696141 () Bool)

(assert (=> b!1225533 (= e!696142 e!696141)))

(declare-fun res!813983 () Bool)

(assert (=> b!1225533 (=> (not res!813983) (not e!696141))))

(assert (=> b!1225533 (= res!813983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557874 mask!1564))))

(assert (=> b!1225533 (= lt!557874 (array!79056 (store (arr!38148 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38685 _keys!1208)))))

(declare-fun b!1225534 () Bool)

(declare-fun e!696137 () Bool)

(assert (=> b!1225534 (= e!696141 (not e!696137))))

(declare-fun res!813989 () Bool)

(assert (=> b!1225534 (=> res!813989 e!696137)))

(assert (=> b!1225534 (= res!813989 (bvsgt from!1455 i!673))))

(assert (=> b!1225534 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557870 () Unit!40525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79055 (_ BitVec 64) (_ BitVec 32)) Unit!40525)

(assert (=> b!1225534 (= lt!557870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225535 () Bool)

(declare-fun res!813981 () Bool)

(assert (=> b!1225535 (=> (not res!813981) (not e!696142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225535 (= res!813981 (validMask!0 mask!1564))))

(declare-fun b!1225536 () Bool)

(declare-fun res!813980 () Bool)

(assert (=> b!1225536 (=> (not res!813980) (not e!696141))))

(assert (=> b!1225536 (= res!813980 (arrayNoDuplicates!0 lt!557874 #b00000000000000000000000000000000 Nil!26944))))

(declare-fun b!1225537 () Bool)

(declare-fun e!696145 () Bool)

(assert (=> b!1225537 (= e!696145 (= lt!557865 lt!557868))))

(declare-fun b!1225538 () Bool)

(declare-fun e!696147 () Bool)

(assert (=> b!1225538 (= e!696147 e!696139)))

(declare-fun res!813992 () Bool)

(assert (=> b!1225538 (=> res!813992 e!696139)))

(assert (=> b!1225538 (= res!813992 (not (= (select (arr!38148 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1225539 () Bool)

(assert (=> b!1225539 (= e!696146 (bvslt from!1455 (size!38686 _values!996)))))

(assert (=> b!1225539 e!696145))

(declare-fun res!813986 () Bool)

(assert (=> b!1225539 (=> (not res!813986) (not e!696145))))

(assert (=> b!1225539 (= res!813986 (not (= (select (arr!38148 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557875 () Unit!40525)

(assert (=> b!1225539 (= lt!557875 e!696138)))

(declare-fun c!120838 () Bool)

(assert (=> b!1225539 (= c!120838 (= (select (arr!38148 _keys!1208) from!1455) k0!934))))

(assert (=> b!1225539 e!696147))

(declare-fun res!813978 () Bool)

(assert (=> b!1225539 (=> (not res!813978) (not e!696147))))

(declare-fun lt!557872 () ListLongMap!18109)

(declare-fun lt!557863 () tuple2!20132)

(declare-fun +!4171 (ListLongMap!18109 tuple2!20132) ListLongMap!18109)

(assert (=> b!1225539 (= res!813978 (= lt!557872 (+!4171 lt!557865 lt!557863)))))

(declare-fun lt!557871 () V!46617)

(declare-fun get!19523 (ValueCell!14849 V!46617) V!46617)

(assert (=> b!1225539 (= lt!557863 (tuple2!20133 (select (arr!38148 _keys!1208) from!1455) (get!19523 (select (arr!38149 _values!996) from!1455) lt!557871)))))

(declare-fun b!1225540 () Bool)

(assert (=> b!1225540 (= e!696137 e!696136)))

(declare-fun res!813984 () Bool)

(assert (=> b!1225540 (=> res!813984 e!696136)))

(assert (=> b!1225540 (= res!813984 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1225540 (= lt!557872 (getCurrentListMapNoExtraKeys!5519 lt!557874 lt!557876 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1225540 (= lt!557876 (array!79058 (store (arr!38149 _values!996) i!673 (ValueCellFull!14849 lt!557871)) (size!38686 _values!996)))))

(declare-fun dynLambda!3418 (Int (_ BitVec 64)) V!46617)

(assert (=> b!1225540 (= lt!557871 (dynLambda!3418 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557869 () ListLongMap!18109)

(assert (=> b!1225540 (= lt!557869 (getCurrentListMapNoExtraKeys!5519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225541 () Bool)

(declare-fun res!813977 () Bool)

(assert (=> b!1225541 (=> (not res!813977) (not e!696145))))

(assert (=> b!1225541 (= res!813977 (= lt!557869 (+!4171 lt!557866 lt!557863)))))

(assert (= (and start!101960 res!813993) b!1225535))

(assert (= (and b!1225535 res!813981) b!1225521))

(assert (= (and b!1225521 res!813985) b!1225530))

(assert (= (and b!1225530 res!813988) b!1225529))

(assert (= (and b!1225529 res!813979) b!1225531))

(assert (= (and b!1225531 res!813990) b!1225528))

(assert (= (and b!1225528 res!813987) b!1225527))

(assert (= (and b!1225527 res!813982) b!1225533))

(assert (= (and b!1225533 res!813983) b!1225536))

(assert (= (and b!1225536 res!813980) b!1225534))

(assert (= (and b!1225534 (not res!813989)) b!1225540))

(assert (= (and b!1225540 (not res!813984)) b!1225525))

(assert (= (and b!1225525 (not res!813991)) b!1225539))

(assert (= (and b!1225539 res!813978) b!1225538))

(assert (= (and b!1225538 (not res!813992)) b!1225524))

(assert (= (and b!1225539 c!120838) b!1225532))

(assert (= (and b!1225539 (not c!120838)) b!1225520))

(assert (= (and b!1225539 res!813986) b!1225541))

(assert (= (and b!1225541 res!813977) b!1225537))

(assert (= (and b!1225523 condMapEmpty!48574) mapIsEmpty!48574))

(assert (= (and b!1225523 (not condMapEmpty!48574)) mapNonEmpty!48574))

(get-info :version)

(assert (= (and mapNonEmpty!48574 ((_ is ValueCellFull!14849) mapValue!48574)) b!1225526))

(assert (= (and b!1225523 ((_ is ValueCellFull!14849) mapDefault!48574)) b!1225522))

(assert (= start!101960 b!1225523))

(declare-fun b_lambda!22387 () Bool)

(assert (=> (not b_lambda!22387) (not b!1225540)))

(declare-fun t!40330 () Bool)

(declare-fun tb!11205 () Bool)

(assert (=> (and start!101960 (= defaultEntry!1004 defaultEntry!1004) t!40330) tb!11205))

(declare-fun result!23031 () Bool)

(assert (=> tb!11205 (= result!23031 tp_is_empty!31117)))

(assert (=> b!1225540 t!40330))

(declare-fun b_and!44091 () Bool)

(assert (= b_and!44089 (and (=> t!40330 result!23031) b_and!44091)))

(declare-fun m!1130831 () Bool)

(assert (=> b!1225538 m!1130831))

(declare-fun m!1130833 () Bool)

(assert (=> start!101960 m!1130833))

(declare-fun m!1130835 () Bool)

(assert (=> start!101960 m!1130835))

(declare-fun m!1130837 () Bool)

(assert (=> b!1225536 m!1130837))

(declare-fun m!1130839 () Bool)

(assert (=> b!1225527 m!1130839))

(declare-fun m!1130841 () Bool)

(assert (=> b!1225528 m!1130841))

(assert (=> b!1225539 m!1130831))

(declare-fun m!1130843 () Bool)

(assert (=> b!1225539 m!1130843))

(declare-fun m!1130845 () Bool)

(assert (=> b!1225539 m!1130845))

(assert (=> b!1225539 m!1130845))

(declare-fun m!1130847 () Bool)

(assert (=> b!1225539 m!1130847))

(declare-fun m!1130849 () Bool)

(assert (=> b!1225525 m!1130849))

(declare-fun m!1130851 () Bool)

(assert (=> b!1225525 m!1130851))

(declare-fun m!1130853 () Bool)

(assert (=> b!1225525 m!1130853))

(assert (=> b!1225525 m!1130831))

(declare-fun m!1130855 () Bool)

(assert (=> b!1225525 m!1130855))

(declare-fun m!1130857 () Bool)

(assert (=> b!1225525 m!1130857))

(assert (=> b!1225525 m!1130831))

(declare-fun m!1130859 () Bool)

(assert (=> mapNonEmpty!48574 m!1130859))

(declare-fun m!1130861 () Bool)

(assert (=> b!1225530 m!1130861))

(declare-fun m!1130863 () Bool)

(assert (=> b!1225541 m!1130863))

(declare-fun m!1130865 () Bool)

(assert (=> b!1225529 m!1130865))

(declare-fun m!1130867 () Bool)

(assert (=> b!1225532 m!1130867))

(declare-fun m!1130869 () Bool)

(assert (=> b!1225532 m!1130869))

(declare-fun m!1130871 () Bool)

(assert (=> b!1225532 m!1130871))

(declare-fun m!1130873 () Bool)

(assert (=> b!1225532 m!1130873))

(declare-fun m!1130875 () Bool)

(assert (=> b!1225532 m!1130875))

(declare-fun m!1130877 () Bool)

(assert (=> b!1225533 m!1130877))

(declare-fun m!1130879 () Bool)

(assert (=> b!1225533 m!1130879))

(declare-fun m!1130881 () Bool)

(assert (=> b!1225524 m!1130881))

(declare-fun m!1130883 () Bool)

(assert (=> b!1225535 m!1130883))

(declare-fun m!1130885 () Bool)

(assert (=> b!1225540 m!1130885))

(declare-fun m!1130887 () Bool)

(assert (=> b!1225540 m!1130887))

(declare-fun m!1130889 () Bool)

(assert (=> b!1225540 m!1130889))

(declare-fun m!1130891 () Bool)

(assert (=> b!1225540 m!1130891))

(declare-fun m!1130893 () Bool)

(assert (=> b!1225534 m!1130893))

(declare-fun m!1130895 () Bool)

(assert (=> b!1225534 m!1130895))

(check-sat (not b_next!26413) (not b_lambda!22387) (not b!1225534) (not b!1225529) b_and!44091 (not b!1225539) (not b!1225525) (not mapNonEmpty!48574) (not b!1225533) tp_is_empty!31117 (not b!1225528) (not b!1225541) (not b!1225535) (not start!101960) (not b!1225536) (not b!1225530) (not b!1225532) (not b!1225540) (not b!1225524))
(check-sat b_and!44091 (not b_next!26413))
