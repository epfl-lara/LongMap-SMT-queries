; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99870 () Bool)

(assert start!99870)

(declare-fun b_free!25449 () Bool)

(declare-fun b_next!25449 () Bool)

(assert (=> start!99870 (= b_free!25449 (not b_next!25449))))

(declare-fun tp!89061 () Bool)

(declare-fun b_and!41765 () Bool)

(assert (=> start!99870 (= tp!89061 b_and!41765)))

(declare-fun b!1188205 () Bool)

(declare-fun e!675618 () Bool)

(declare-fun tp_is_empty!29979 () Bool)

(assert (=> b!1188205 (= e!675618 tp_is_empty!29979)))

(declare-fun b!1188206 () Bool)

(declare-datatypes ((Unit!39418 0))(
  ( (Unit!39419) )
))
(declare-fun e!675613 () Unit!39418)

(declare-fun Unit!39420 () Unit!39418)

(assert (=> b!1188206 (= e!675613 Unit!39420)))

(declare-datatypes ((array!76753 0))(
  ( (array!76754 (arr!37026 (Array (_ BitVec 32) (_ BitVec 64))) (size!37562 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76753)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!540550 () Unit!39418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76753 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39418)

(assert (=> b!1188206 (= lt!540550 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188206 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540549 () Unit!39418)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76753 (_ BitVec 32) (_ BitVec 32)) Unit!39418)

(assert (=> b!1188206 (= lt!540549 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26062 0))(
  ( (Nil!26059) (Cons!26058 (h!27267 (_ BitVec 64)) (t!38503 List!26062)) )
))
(declare-fun arrayNoDuplicates!0 (array!76753 (_ BitVec 32) List!26062) Bool)

(assert (=> b!1188206 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26059)))

(declare-fun lt!540564 () Unit!39418)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76753 (_ BitVec 64) (_ BitVec 32) List!26062) Unit!39418)

(assert (=> b!1188206 (= lt!540564 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26059))))

(assert (=> b!1188206 false))

(declare-fun b!1188208 () Bool)

(declare-fun e!675622 () Bool)

(assert (=> b!1188208 (= e!675622 tp_is_empty!29979)))

(declare-fun b!1188209 () Bool)

(declare-fun res!790014 () Bool)

(declare-fun e!675615 () Bool)

(assert (=> b!1188209 (=> (not res!790014) (not e!675615))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188209 (= res!790014 (validMask!0 mask!1564))))

(declare-fun b!1188210 () Bool)

(declare-fun Unit!39421 () Unit!39418)

(assert (=> b!1188210 (= e!675613 Unit!39421)))

(declare-fun b!1188211 () Bool)

(declare-fun res!790007 () Bool)

(assert (=> b!1188211 (=> (not res!790007) (not e!675615))))

(assert (=> b!1188211 (= res!790007 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37562 _keys!1208))))))

(declare-fun b!1188212 () Bool)

(declare-fun e!675619 () Bool)

(declare-fun e!675614 () Bool)

(assert (=> b!1188212 (= e!675619 e!675614)))

(declare-fun res!790004 () Bool)

(assert (=> b!1188212 (=> res!790004 e!675614)))

(assert (=> b!1188212 (= res!790004 (not (= (select (arr!37026 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188213 () Bool)

(declare-fun res!790017 () Bool)

(assert (=> b!1188213 (=> (not res!790017) (not e!675615))))

(assert (=> b!1188213 (= res!790017 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26059))))

(declare-fun b!1188214 () Bool)

(declare-fun e!675616 () Bool)

(declare-fun e!675621 () Bool)

(assert (=> b!1188214 (= e!675616 (not e!675621))))

(declare-fun res!790015 () Bool)

(assert (=> b!1188214 (=> res!790015 e!675621)))

(assert (=> b!1188214 (= res!790015 (bvsgt from!1455 i!673))))

(assert (=> b!1188214 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540562 () Unit!39418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76753 (_ BitVec 64) (_ BitVec 32)) Unit!39418)

(assert (=> b!1188214 (= lt!540562 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!790005 () Bool)

(assert (=> start!99870 (=> (not res!790005) (not e!675615))))

(assert (=> start!99870 (= res!790005 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37562 _keys!1208))))))

(assert (=> start!99870 e!675615))

(assert (=> start!99870 tp_is_empty!29979))

(declare-fun array_inv!28250 (array!76753) Bool)

(assert (=> start!99870 (array_inv!28250 _keys!1208)))

(assert (=> start!99870 true))

(assert (=> start!99870 tp!89061))

(declare-datatypes ((V!45099 0))(
  ( (V!45100 (val!15046 Int)) )
))
(declare-datatypes ((ValueCell!14280 0))(
  ( (ValueCellFull!14280 (v!17684 V!45099)) (EmptyCell!14280) )
))
(declare-datatypes ((array!76755 0))(
  ( (array!76756 (arr!37027 (Array (_ BitVec 32) ValueCell!14280)) (size!37563 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76755)

(declare-fun e!675617 () Bool)

(declare-fun array_inv!28251 (array!76755) Bool)

(assert (=> start!99870 (and (array_inv!28251 _values!996) e!675617)))

(declare-fun b!1188207 () Bool)

(declare-fun e!675611 () Bool)

(assert (=> b!1188207 (= e!675611 true)))

(declare-datatypes ((tuple2!19322 0))(
  ( (tuple2!19323 (_1!9672 (_ BitVec 64)) (_2!9672 V!45099)) )
))
(declare-datatypes ((List!26063 0))(
  ( (Nil!26060) (Cons!26059 (h!27268 tuple2!19322) (t!38504 List!26063)) )
))
(declare-datatypes ((ListLongMap!17291 0))(
  ( (ListLongMap!17292 (toList!8661 List!26063)) )
))
(declare-fun lt!540559 () ListLongMap!17291)

(declare-fun lt!540558 () ListLongMap!17291)

(declare-fun -!1691 (ListLongMap!17291 (_ BitVec 64)) ListLongMap!17291)

(assert (=> b!1188207 (= (-!1691 lt!540559 k0!934) lt!540558)))

(declare-fun lt!540552 () ListLongMap!17291)

(declare-fun lt!540553 () Unit!39418)

(declare-fun lt!540555 () V!45099)

(declare-fun addRemoveCommutativeForDiffKeys!209 (ListLongMap!17291 (_ BitVec 64) V!45099 (_ BitVec 64)) Unit!39418)

(assert (=> b!1188207 (= lt!540553 (addRemoveCommutativeForDiffKeys!209 lt!540552 (select (arr!37026 _keys!1208) from!1455) lt!540555 k0!934))))

(declare-fun lt!540551 () ListLongMap!17291)

(declare-fun lt!540556 () ListLongMap!17291)

(declare-fun lt!540554 () ListLongMap!17291)

(assert (=> b!1188207 (and (= lt!540554 lt!540559) (= lt!540551 lt!540556))))

(declare-fun lt!540560 () tuple2!19322)

(declare-fun +!3946 (ListLongMap!17291 tuple2!19322) ListLongMap!17291)

(assert (=> b!1188207 (= lt!540559 (+!3946 lt!540552 lt!540560))))

(assert (=> b!1188207 (not (= (select (arr!37026 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540561 () Unit!39418)

(assert (=> b!1188207 (= lt!540561 e!675613)))

(declare-fun c!117297 () Bool)

(assert (=> b!1188207 (= c!117297 (= (select (arr!37026 _keys!1208) from!1455) k0!934))))

(assert (=> b!1188207 e!675619))

(declare-fun res!790008 () Bool)

(assert (=> b!1188207 (=> (not res!790008) (not e!675619))))

(declare-fun lt!540565 () ListLongMap!17291)

(assert (=> b!1188207 (= res!790008 (= lt!540565 lt!540558))))

(assert (=> b!1188207 (= lt!540558 (+!3946 lt!540551 lt!540560))))

(assert (=> b!1188207 (= lt!540560 (tuple2!19323 (select (arr!37026 _keys!1208) from!1455) lt!540555))))

(declare-fun lt!540566 () V!45099)

(declare-fun get!18969 (ValueCell!14280 V!45099) V!45099)

(assert (=> b!1188207 (= lt!540555 (get!18969 (select (arr!37027 _values!996) from!1455) lt!540566))))

(declare-fun b!1188215 () Bool)

(declare-fun mapRes!46796 () Bool)

(assert (=> b!1188215 (= e!675617 (and e!675622 mapRes!46796))))

(declare-fun condMapEmpty!46796 () Bool)

(declare-fun mapDefault!46796 () ValueCell!14280)

(assert (=> b!1188215 (= condMapEmpty!46796 (= (arr!37027 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14280)) mapDefault!46796)))))

(declare-fun b!1188216 () Bool)

(declare-fun res!790006 () Bool)

(assert (=> b!1188216 (=> (not res!790006) (not e!675616))))

(declare-fun lt!540563 () array!76753)

(assert (=> b!1188216 (= res!790006 (arrayNoDuplicates!0 lt!540563 #b00000000000000000000000000000000 Nil!26059))))

(declare-fun b!1188217 () Bool)

(declare-fun res!790010 () Bool)

(assert (=> b!1188217 (=> (not res!790010) (not e!675615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188217 (= res!790010 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46796 () Bool)

(declare-fun tp!89060 () Bool)

(assert (=> mapNonEmpty!46796 (= mapRes!46796 (and tp!89060 e!675618))))

(declare-fun mapKey!46796 () (_ BitVec 32))

(declare-fun mapValue!46796 () ValueCell!14280)

(declare-fun mapRest!46796 () (Array (_ BitVec 32) ValueCell!14280))

(assert (=> mapNonEmpty!46796 (= (arr!37027 _values!996) (store mapRest!46796 mapKey!46796 mapValue!46796))))

(declare-fun b!1188218 () Bool)

(declare-fun res!790012 () Bool)

(assert (=> b!1188218 (=> (not res!790012) (not e!675615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76753 (_ BitVec 32)) Bool)

(assert (=> b!1188218 (= res!790012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188219 () Bool)

(declare-fun e!675620 () Bool)

(assert (=> b!1188219 (= e!675621 e!675620)))

(declare-fun res!790011 () Bool)

(assert (=> b!1188219 (=> res!790011 e!675620)))

(assert (=> b!1188219 (= res!790011 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45099)

(declare-fun defaultEntry!1004 () Int)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!540567 () array!76755)

(declare-fun minValue!944 () V!45099)

(declare-fun getCurrentListMapNoExtraKeys!5102 (array!76753 array!76755 (_ BitVec 32) (_ BitVec 32) V!45099 V!45099 (_ BitVec 32) Int) ListLongMap!17291)

(assert (=> b!1188219 (= lt!540565 (getCurrentListMapNoExtraKeys!5102 lt!540563 lt!540567 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1188219 (= lt!540567 (array!76756 (store (arr!37027 _values!996) i!673 (ValueCellFull!14280 lt!540566)) (size!37563 _values!996)))))

(declare-fun dynLambda!3047 (Int (_ BitVec 64)) V!45099)

(assert (=> b!1188219 (= lt!540566 (dynLambda!3047 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1188219 (= lt!540554 (getCurrentListMapNoExtraKeys!5102 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188220 () Bool)

(declare-fun res!790013 () Bool)

(assert (=> b!1188220 (=> (not res!790013) (not e!675615))))

(assert (=> b!1188220 (= res!790013 (and (= (size!37563 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37562 _keys!1208) (size!37563 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46796 () Bool)

(assert (=> mapIsEmpty!46796 mapRes!46796))

(declare-fun b!1188221 () Bool)

(assert (=> b!1188221 (= e!675615 e!675616)))

(declare-fun res!790009 () Bool)

(assert (=> b!1188221 (=> (not res!790009) (not e!675616))))

(assert (=> b!1188221 (= res!790009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540563 mask!1564))))

(assert (=> b!1188221 (= lt!540563 (array!76754 (store (arr!37026 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37562 _keys!1208)))))

(declare-fun b!1188222 () Bool)

(assert (=> b!1188222 (= e!675614 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188223 () Bool)

(declare-fun res!790016 () Bool)

(assert (=> b!1188223 (=> (not res!790016) (not e!675615))))

(assert (=> b!1188223 (= res!790016 (= (select (arr!37026 _keys!1208) i!673) k0!934))))

(declare-fun b!1188224 () Bool)

(assert (=> b!1188224 (= e!675620 e!675611)))

(declare-fun res!790018 () Bool)

(assert (=> b!1188224 (=> res!790018 e!675611)))

(assert (=> b!1188224 (= res!790018 (not (validKeyInArray!0 (select (arr!37026 _keys!1208) from!1455))))))

(assert (=> b!1188224 (= lt!540556 lt!540551)))

(assert (=> b!1188224 (= lt!540551 (-!1691 lt!540552 k0!934))))

(assert (=> b!1188224 (= lt!540556 (getCurrentListMapNoExtraKeys!5102 lt!540563 lt!540567 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188224 (= lt!540552 (getCurrentListMapNoExtraKeys!5102 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540557 () Unit!39418)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!900 (array!76753 array!76755 (_ BitVec 32) (_ BitVec 32) V!45099 V!45099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39418)

(assert (=> b!1188224 (= lt!540557 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!900 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99870 res!790005) b!1188209))

(assert (= (and b!1188209 res!790014) b!1188220))

(assert (= (and b!1188220 res!790013) b!1188218))

(assert (= (and b!1188218 res!790012) b!1188213))

(assert (= (and b!1188213 res!790017) b!1188211))

(assert (= (and b!1188211 res!790007) b!1188217))

(assert (= (and b!1188217 res!790010) b!1188223))

(assert (= (and b!1188223 res!790016) b!1188221))

(assert (= (and b!1188221 res!790009) b!1188216))

(assert (= (and b!1188216 res!790006) b!1188214))

(assert (= (and b!1188214 (not res!790015)) b!1188219))

(assert (= (and b!1188219 (not res!790011)) b!1188224))

(assert (= (and b!1188224 (not res!790018)) b!1188207))

(assert (= (and b!1188207 res!790008) b!1188212))

(assert (= (and b!1188212 (not res!790004)) b!1188222))

(assert (= (and b!1188207 c!117297) b!1188206))

(assert (= (and b!1188207 (not c!117297)) b!1188210))

(assert (= (and b!1188215 condMapEmpty!46796) mapIsEmpty!46796))

(assert (= (and b!1188215 (not condMapEmpty!46796)) mapNonEmpty!46796))

(get-info :version)

(assert (= (and mapNonEmpty!46796 ((_ is ValueCellFull!14280) mapValue!46796)) b!1188205))

(assert (= (and b!1188215 ((_ is ValueCellFull!14280) mapDefault!46796)) b!1188208))

(assert (= start!99870 b!1188215))

(declare-fun b_lambda!20593 () Bool)

(assert (=> (not b_lambda!20593) (not b!1188219)))

(declare-fun t!38502 () Bool)

(declare-fun tb!10261 () Bool)

(assert (=> (and start!99870 (= defaultEntry!1004 defaultEntry!1004) t!38502) tb!10261))

(declare-fun result!21089 () Bool)

(assert (=> tb!10261 (= result!21089 tp_is_empty!29979)))

(assert (=> b!1188219 t!38502))

(declare-fun b_and!41767 () Bool)

(assert (= b_and!41765 (and (=> t!38502 result!21089) b_and!41767)))

(declare-fun m!1096975 () Bool)

(assert (=> b!1188224 m!1096975))

(declare-fun m!1096977 () Bool)

(assert (=> b!1188224 m!1096977))

(declare-fun m!1096979 () Bool)

(assert (=> b!1188224 m!1096979))

(declare-fun m!1096981 () Bool)

(assert (=> b!1188224 m!1096981))

(declare-fun m!1096983 () Bool)

(assert (=> b!1188224 m!1096983))

(declare-fun m!1096985 () Bool)

(assert (=> b!1188224 m!1096985))

(assert (=> b!1188224 m!1096983))

(declare-fun m!1096987 () Bool)

(assert (=> b!1188213 m!1096987))

(declare-fun m!1096989 () Bool)

(assert (=> b!1188209 m!1096989))

(declare-fun m!1096991 () Bool)

(assert (=> b!1188214 m!1096991))

(declare-fun m!1096993 () Bool)

(assert (=> b!1188214 m!1096993))

(declare-fun m!1096995 () Bool)

(assert (=> mapNonEmpty!46796 m!1096995))

(declare-fun m!1096997 () Bool)

(assert (=> b!1188216 m!1096997))

(declare-fun m!1096999 () Bool)

(assert (=> b!1188217 m!1096999))

(declare-fun m!1097001 () Bool)

(assert (=> b!1188223 m!1097001))

(declare-fun m!1097003 () Bool)

(assert (=> b!1188221 m!1097003))

(declare-fun m!1097005 () Bool)

(assert (=> b!1188221 m!1097005))

(declare-fun m!1097007 () Bool)

(assert (=> b!1188219 m!1097007))

(declare-fun m!1097009 () Bool)

(assert (=> b!1188219 m!1097009))

(declare-fun m!1097011 () Bool)

(assert (=> b!1188219 m!1097011))

(declare-fun m!1097013 () Bool)

(assert (=> b!1188219 m!1097013))

(declare-fun m!1097015 () Bool)

(assert (=> b!1188207 m!1097015))

(declare-fun m!1097017 () Bool)

(assert (=> b!1188207 m!1097017))

(declare-fun m!1097019 () Bool)

(assert (=> b!1188207 m!1097019))

(declare-fun m!1097021 () Bool)

(assert (=> b!1188207 m!1097021))

(assert (=> b!1188207 m!1096983))

(assert (=> b!1188207 m!1096983))

(declare-fun m!1097023 () Bool)

(assert (=> b!1188207 m!1097023))

(assert (=> b!1188207 m!1097017))

(declare-fun m!1097025 () Bool)

(assert (=> b!1188207 m!1097025))

(declare-fun m!1097027 () Bool)

(assert (=> b!1188218 m!1097027))

(declare-fun m!1097029 () Bool)

(assert (=> b!1188222 m!1097029))

(assert (=> b!1188212 m!1096983))

(declare-fun m!1097031 () Bool)

(assert (=> start!99870 m!1097031))

(declare-fun m!1097033 () Bool)

(assert (=> start!99870 m!1097033))

(declare-fun m!1097035 () Bool)

(assert (=> b!1188206 m!1097035))

(declare-fun m!1097037 () Bool)

(assert (=> b!1188206 m!1097037))

(declare-fun m!1097039 () Bool)

(assert (=> b!1188206 m!1097039))

(declare-fun m!1097041 () Bool)

(assert (=> b!1188206 m!1097041))

(declare-fun m!1097043 () Bool)

(assert (=> b!1188206 m!1097043))

(check-sat (not b!1188206) (not b!1188209) (not mapNonEmpty!46796) (not b!1188222) (not b!1188213) (not b!1188207) (not b!1188217) b_and!41767 (not b!1188218) (not start!99870) (not b!1188224) (not b!1188214) tp_is_empty!29979 (not b!1188216) (not b_next!25449) (not b_lambda!20593) (not b!1188219) (not b!1188221))
(check-sat b_and!41767 (not b_next!25449))
