; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99640 () Bool)

(assert start!99640)

(declare-fun b_free!25225 () Bool)

(declare-fun b_next!25225 () Bool)

(assert (=> start!99640 (= b_free!25225 (not b_next!25225))))

(declare-fun tp!88388 () Bool)

(declare-fun b_and!41295 () Bool)

(assert (=> start!99640 (= tp!88388 b_and!41295)))

(declare-fun b!1181105 () Bool)

(declare-fun e!671489 () Bool)

(declare-fun tp_is_empty!29755 () Bool)

(assert (=> b!1181105 (= e!671489 tp_is_empty!29755)))

(declare-fun b!1181106 () Bool)

(declare-fun e!671492 () Bool)

(declare-fun e!671486 () Bool)

(assert (=> b!1181106 (= e!671492 e!671486)))

(declare-fun res!784874 () Bool)

(assert (=> b!1181106 (=> res!784874 e!671486)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181106 (= res!784874 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44801 0))(
  ( (V!44802 (val!14934 Int)) )
))
(declare-fun zeroValue!944 () V!44801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!76246 0))(
  ( (array!76247 (arr!36773 (Array (_ BitVec 32) (_ BitVec 64))) (size!37311 (_ BitVec 32))) )
))
(declare-fun lt!534038 () array!76246)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19240 0))(
  ( (tuple2!19241 (_1!9631 (_ BitVec 64)) (_2!9631 V!44801)) )
))
(declare-datatypes ((List!25947 0))(
  ( (Nil!25944) (Cons!25943 (h!27152 tuple2!19240) (t!38155 List!25947)) )
))
(declare-datatypes ((ListLongMap!17209 0))(
  ( (ListLongMap!17210 (toList!8620 List!25947)) )
))
(declare-fun lt!534041 () ListLongMap!17209)

(declare-fun minValue!944 () V!44801)

(declare-datatypes ((ValueCell!14168 0))(
  ( (ValueCellFull!14168 (v!17571 V!44801)) (EmptyCell!14168) )
))
(declare-datatypes ((array!76248 0))(
  ( (array!76249 (arr!36774 (Array (_ BitVec 32) ValueCell!14168)) (size!37312 (_ BitVec 32))) )
))
(declare-fun lt!534044 () array!76248)

(declare-fun getCurrentListMapNoExtraKeys!5076 (array!76246 array!76248 (_ BitVec 32) (_ BitVec 32) V!44801 V!44801 (_ BitVec 32) Int) ListLongMap!17209)

(assert (=> b!1181106 (= lt!534041 (getCurrentListMapNoExtraKeys!5076 lt!534038 lt!534044 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534040 () V!44801)

(declare-fun _values!996 () array!76248)

(assert (=> b!1181106 (= lt!534044 (array!76249 (store (arr!36774 _values!996) i!673 (ValueCellFull!14168 lt!534040)) (size!37312 _values!996)))))

(declare-fun dynLambda!2985 (Int (_ BitVec 64)) V!44801)

(assert (=> b!1181106 (= lt!534040 (dynLambda!2985 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76246)

(declare-fun lt!534051 () ListLongMap!17209)

(assert (=> b!1181106 (= lt!534051 (getCurrentListMapNoExtraKeys!5076 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181107 () Bool)

(declare-fun res!784875 () Bool)

(declare-fun e!671493 () Bool)

(assert (=> b!1181107 (=> (not res!784875) (not e!671493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181107 (= res!784875 (validMask!0 mask!1564))))

(declare-fun b!1181108 () Bool)

(declare-fun e!671495 () Bool)

(declare-fun lt!534048 () ListLongMap!17209)

(declare-fun lt!534050 () ListLongMap!17209)

(assert (=> b!1181108 (= e!671495 (= lt!534048 lt!534050))))

(declare-fun b!1181109 () Bool)

(declare-fun e!671494 () Bool)

(declare-fun e!671487 () Bool)

(declare-fun mapRes!46460 () Bool)

(assert (=> b!1181109 (= e!671494 (and e!671487 mapRes!46460))))

(declare-fun condMapEmpty!46460 () Bool)

(declare-fun mapDefault!46460 () ValueCell!14168)

(assert (=> b!1181109 (= condMapEmpty!46460 (= (arr!36774 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14168)) mapDefault!46460)))))

(declare-fun b!1181110 () Bool)

(declare-fun res!784868 () Bool)

(assert (=> b!1181110 (=> (not res!784868) (not e!671493))))

(assert (=> b!1181110 (= res!784868 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37311 _keys!1208))))))

(declare-fun b!1181111 () Bool)

(declare-fun e!671491 () Bool)

(assert (=> b!1181111 (= e!671491 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37311 _keys!1208))))))

(assert (=> b!1181111 e!671495))

(declare-fun res!784866 () Bool)

(assert (=> b!1181111 (=> (not res!784866) (not e!671495))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1181111 (= res!784866 (not (= (select (arr!36773 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38906 0))(
  ( (Unit!38907) )
))
(declare-fun lt!534043 () Unit!38906)

(declare-fun e!671497 () Unit!38906)

(assert (=> b!1181111 (= lt!534043 e!671497)))

(declare-fun c!116935 () Bool)

(assert (=> b!1181111 (= c!116935 (= (select (arr!36773 _keys!1208) from!1455) k0!934))))

(declare-fun e!671496 () Bool)

(assert (=> b!1181111 e!671496))

(declare-fun res!784867 () Bool)

(assert (=> b!1181111 (=> (not res!784867) (not e!671496))))

(declare-fun lt!534037 () tuple2!19240)

(declare-fun +!3917 (ListLongMap!17209 tuple2!19240) ListLongMap!17209)

(assert (=> b!1181111 (= res!784867 (= lt!534041 (+!3917 lt!534048 lt!534037)))))

(declare-fun get!18816 (ValueCell!14168 V!44801) V!44801)

(assert (=> b!1181111 (= lt!534037 (tuple2!19241 (select (arr!36773 _keys!1208) from!1455) (get!18816 (select (arr!36774 _values!996) from!1455) lt!534040)))))

(declare-fun b!1181112 () Bool)

(declare-fun e!671485 () Bool)

(declare-fun arrayContainsKey!0 (array!76246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181112 (= e!671485 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181113 () Bool)

(declare-fun Unit!38908 () Unit!38906)

(assert (=> b!1181113 (= e!671497 Unit!38908)))

(declare-fun b!1181115 () Bool)

(declare-fun e!671488 () Bool)

(assert (=> b!1181115 (= e!671493 e!671488)))

(declare-fun res!784880 () Bool)

(assert (=> b!1181115 (=> (not res!784880) (not e!671488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76246 (_ BitVec 32)) Bool)

(assert (=> b!1181115 (= res!784880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534038 mask!1564))))

(assert (=> b!1181115 (= lt!534038 (array!76247 (store (arr!36773 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37311 _keys!1208)))))

(declare-fun mapIsEmpty!46460 () Bool)

(assert (=> mapIsEmpty!46460 mapRes!46460))

(declare-fun b!1181116 () Bool)

(declare-fun res!784873 () Bool)

(assert (=> b!1181116 (=> (not res!784873) (not e!671493))))

(assert (=> b!1181116 (= res!784873 (and (= (size!37312 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37311 _keys!1208) (size!37312 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46460 () Bool)

(declare-fun tp!88389 () Bool)

(assert (=> mapNonEmpty!46460 (= mapRes!46460 (and tp!88389 e!671489))))

(declare-fun mapValue!46460 () ValueCell!14168)

(declare-fun mapKey!46460 () (_ BitVec 32))

(declare-fun mapRest!46460 () (Array (_ BitVec 32) ValueCell!14168))

(assert (=> mapNonEmpty!46460 (= (arr!36774 _values!996) (store mapRest!46460 mapKey!46460 mapValue!46460))))

(declare-fun b!1181117 () Bool)

(declare-fun res!784871 () Bool)

(assert (=> b!1181117 (=> (not res!784871) (not e!671493))))

(assert (=> b!1181117 (= res!784871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181118 () Bool)

(declare-fun Unit!38909 () Unit!38906)

(assert (=> b!1181118 (= e!671497 Unit!38909)))

(declare-fun lt!534046 () Unit!38906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38906)

(assert (=> b!1181118 (= lt!534046 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181118 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534042 () Unit!38906)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76246 (_ BitVec 32) (_ BitVec 32)) Unit!38906)

(assert (=> b!1181118 (= lt!534042 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25948 0))(
  ( (Nil!25945) (Cons!25944 (h!27153 (_ BitVec 64)) (t!38156 List!25948)) )
))
(declare-fun arrayNoDuplicates!0 (array!76246 (_ BitVec 32) List!25948) Bool)

(assert (=> b!1181118 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25945)))

(declare-fun lt!534039 () Unit!38906)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76246 (_ BitVec 64) (_ BitVec 32) List!25948) Unit!38906)

(assert (=> b!1181118 (= lt!534039 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25945))))

(assert (=> b!1181118 false))

(declare-fun b!1181119 () Bool)

(declare-fun res!784869 () Bool)

(assert (=> b!1181119 (=> (not res!784869) (not e!671493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181119 (= res!784869 (validKeyInArray!0 k0!934))))

(declare-fun b!1181120 () Bool)

(assert (=> b!1181120 (= e!671487 tp_is_empty!29755)))

(declare-fun b!1181121 () Bool)

(assert (=> b!1181121 (= e!671486 e!671491)))

(declare-fun res!784882 () Bool)

(assert (=> b!1181121 (=> res!784882 e!671491)))

(assert (=> b!1181121 (= res!784882 (not (validKeyInArray!0 (select (arr!36773 _keys!1208) from!1455))))))

(assert (=> b!1181121 (= lt!534050 lt!534048)))

(declare-fun lt!534045 () ListLongMap!17209)

(declare-fun -!1580 (ListLongMap!17209 (_ BitVec 64)) ListLongMap!17209)

(assert (=> b!1181121 (= lt!534048 (-!1580 lt!534045 k0!934))))

(assert (=> b!1181121 (= lt!534050 (getCurrentListMapNoExtraKeys!5076 lt!534038 lt!534044 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181121 (= lt!534045 (getCurrentListMapNoExtraKeys!5076 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534049 () Unit!38906)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!844 (array!76246 array!76248 (_ BitVec 32) (_ BitVec 32) V!44801 V!44801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38906)

(assert (=> b!1181121 (= lt!534049 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!844 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181122 () Bool)

(declare-fun res!784876 () Bool)

(assert (=> b!1181122 (=> (not res!784876) (not e!671495))))

(assert (=> b!1181122 (= res!784876 (= lt!534051 (+!3917 lt!534045 lt!534037)))))

(declare-fun b!1181123 () Bool)

(assert (=> b!1181123 (= e!671488 (not e!671492))))

(declare-fun res!784878 () Bool)

(assert (=> b!1181123 (=> res!784878 e!671492)))

(assert (=> b!1181123 (= res!784878 (bvsgt from!1455 i!673))))

(assert (=> b!1181123 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534047 () Unit!38906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76246 (_ BitVec 64) (_ BitVec 32)) Unit!38906)

(assert (=> b!1181123 (= lt!534047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181124 () Bool)

(declare-fun res!784877 () Bool)

(assert (=> b!1181124 (=> (not res!784877) (not e!671493))))

(assert (=> b!1181124 (= res!784877 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25945))))

(declare-fun res!784881 () Bool)

(assert (=> start!99640 (=> (not res!784881) (not e!671493))))

(assert (=> start!99640 (= res!784881 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37311 _keys!1208))))))

(assert (=> start!99640 e!671493))

(assert (=> start!99640 tp_is_empty!29755))

(declare-fun array_inv!28188 (array!76246) Bool)

(assert (=> start!99640 (array_inv!28188 _keys!1208)))

(assert (=> start!99640 true))

(assert (=> start!99640 tp!88388))

(declare-fun array_inv!28189 (array!76248) Bool)

(assert (=> start!99640 (and (array_inv!28189 _values!996) e!671494)))

(declare-fun b!1181114 () Bool)

(declare-fun res!784872 () Bool)

(assert (=> b!1181114 (=> (not res!784872) (not e!671493))))

(assert (=> b!1181114 (= res!784872 (= (select (arr!36773 _keys!1208) i!673) k0!934))))

(declare-fun b!1181125 () Bool)

(declare-fun res!784870 () Bool)

(assert (=> b!1181125 (=> (not res!784870) (not e!671488))))

(assert (=> b!1181125 (= res!784870 (arrayNoDuplicates!0 lt!534038 #b00000000000000000000000000000000 Nil!25945))))

(declare-fun b!1181126 () Bool)

(assert (=> b!1181126 (= e!671496 e!671485)))

(declare-fun res!784879 () Bool)

(assert (=> b!1181126 (=> res!784879 e!671485)))

(assert (=> b!1181126 (= res!784879 (not (= (select (arr!36773 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99640 res!784881) b!1181107))

(assert (= (and b!1181107 res!784875) b!1181116))

(assert (= (and b!1181116 res!784873) b!1181117))

(assert (= (and b!1181117 res!784871) b!1181124))

(assert (= (and b!1181124 res!784877) b!1181110))

(assert (= (and b!1181110 res!784868) b!1181119))

(assert (= (and b!1181119 res!784869) b!1181114))

(assert (= (and b!1181114 res!784872) b!1181115))

(assert (= (and b!1181115 res!784880) b!1181125))

(assert (= (and b!1181125 res!784870) b!1181123))

(assert (= (and b!1181123 (not res!784878)) b!1181106))

(assert (= (and b!1181106 (not res!784874)) b!1181121))

(assert (= (and b!1181121 (not res!784882)) b!1181111))

(assert (= (and b!1181111 res!784867) b!1181126))

(assert (= (and b!1181126 (not res!784879)) b!1181112))

(assert (= (and b!1181111 c!116935) b!1181118))

(assert (= (and b!1181111 (not c!116935)) b!1181113))

(assert (= (and b!1181111 res!784866) b!1181122))

(assert (= (and b!1181122 res!784876) b!1181108))

(assert (= (and b!1181109 condMapEmpty!46460) mapIsEmpty!46460))

(assert (= (and b!1181109 (not condMapEmpty!46460)) mapNonEmpty!46460))

(get-info :version)

(assert (= (and mapNonEmpty!46460 ((_ is ValueCellFull!14168) mapValue!46460)) b!1181105))

(assert (= (and b!1181109 ((_ is ValueCellFull!14168) mapDefault!46460)) b!1181120))

(assert (= start!99640 b!1181109))

(declare-fun b_lambda!20351 () Bool)

(assert (=> (not b_lambda!20351) (not b!1181106)))

(declare-fun t!38154 () Bool)

(declare-fun tb!10029 () Bool)

(assert (=> (and start!99640 (= defaultEntry!1004 defaultEntry!1004) t!38154) tb!10029))

(declare-fun result!20633 () Bool)

(assert (=> tb!10029 (= result!20633 tp_is_empty!29755)))

(assert (=> b!1181106 t!38154))

(declare-fun b_and!41297 () Bool)

(assert (= b_and!41295 (and (=> t!38154 result!20633) b_and!41297)))

(declare-fun m!1088549 () Bool)

(assert (=> b!1181118 m!1088549))

(declare-fun m!1088551 () Bool)

(assert (=> b!1181118 m!1088551))

(declare-fun m!1088553 () Bool)

(assert (=> b!1181118 m!1088553))

(declare-fun m!1088555 () Bool)

(assert (=> b!1181118 m!1088555))

(declare-fun m!1088557 () Bool)

(assert (=> b!1181118 m!1088557))

(declare-fun m!1088559 () Bool)

(assert (=> b!1181119 m!1088559))

(declare-fun m!1088561 () Bool)

(assert (=> b!1181121 m!1088561))

(declare-fun m!1088563 () Bool)

(assert (=> b!1181121 m!1088563))

(declare-fun m!1088565 () Bool)

(assert (=> b!1181121 m!1088565))

(declare-fun m!1088567 () Bool)

(assert (=> b!1181121 m!1088567))

(declare-fun m!1088569 () Bool)

(assert (=> b!1181121 m!1088569))

(declare-fun m!1088571 () Bool)

(assert (=> b!1181121 m!1088571))

(assert (=> b!1181121 m!1088569))

(declare-fun m!1088573 () Bool)

(assert (=> b!1181106 m!1088573))

(declare-fun m!1088575 () Bool)

(assert (=> b!1181106 m!1088575))

(declare-fun m!1088577 () Bool)

(assert (=> b!1181106 m!1088577))

(declare-fun m!1088579 () Bool)

(assert (=> b!1181106 m!1088579))

(declare-fun m!1088581 () Bool)

(assert (=> b!1181125 m!1088581))

(declare-fun m!1088583 () Bool)

(assert (=> mapNonEmpty!46460 m!1088583))

(assert (=> b!1181126 m!1088569))

(declare-fun m!1088585 () Bool)

(assert (=> b!1181122 m!1088585))

(declare-fun m!1088587 () Bool)

(assert (=> b!1181115 m!1088587))

(declare-fun m!1088589 () Bool)

(assert (=> b!1181115 m!1088589))

(declare-fun m!1088591 () Bool)

(assert (=> b!1181107 m!1088591))

(declare-fun m!1088593 () Bool)

(assert (=> b!1181123 m!1088593))

(declare-fun m!1088595 () Bool)

(assert (=> b!1181123 m!1088595))

(declare-fun m!1088597 () Bool)

(assert (=> b!1181117 m!1088597))

(assert (=> b!1181111 m!1088569))

(declare-fun m!1088599 () Bool)

(assert (=> b!1181111 m!1088599))

(declare-fun m!1088601 () Bool)

(assert (=> b!1181111 m!1088601))

(assert (=> b!1181111 m!1088601))

(declare-fun m!1088603 () Bool)

(assert (=> b!1181111 m!1088603))

(declare-fun m!1088605 () Bool)

(assert (=> b!1181112 m!1088605))

(declare-fun m!1088607 () Bool)

(assert (=> b!1181114 m!1088607))

(declare-fun m!1088609 () Bool)

(assert (=> b!1181124 m!1088609))

(declare-fun m!1088611 () Bool)

(assert (=> start!99640 m!1088611))

(declare-fun m!1088613 () Bool)

(assert (=> start!99640 m!1088613))

(check-sat (not mapNonEmpty!46460) tp_is_empty!29755 (not b!1181112) (not b!1181106) (not b!1181123) (not b_next!25225) (not b!1181117) (not b!1181124) (not b!1181121) (not b!1181115) b_and!41297 (not b_lambda!20351) (not b!1181111) (not b!1181125) (not b!1181107) (not b!1181122) (not b!1181118) (not b!1181119) (not start!99640))
(check-sat b_and!41297 (not b_next!25225))
