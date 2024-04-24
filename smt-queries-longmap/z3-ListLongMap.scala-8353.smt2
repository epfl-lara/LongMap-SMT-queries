; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101936 () Bool)

(assert start!101936)

(declare-fun b_free!26389 () Bool)

(declare-fun b_next!26389 () Bool)

(assert (=> start!101936 (= b_free!26389 (not b_next!26389))))

(declare-fun tp!92212 () Bool)

(declare-fun b_and!44041 () Bool)

(assert (=> start!101936 (= tp!92212 b_and!44041)))

(declare-fun b!1224729 () Bool)

(declare-fun res!813403 () Bool)

(declare-fun e!695677 () Bool)

(assert (=> b!1224729 (=> (not res!813403) (not e!695677))))

(declare-datatypes ((array!79007 0))(
  ( (array!79008 (arr!38124 (Array (_ BitVec 32) (_ BitVec 64))) (size!38661 (_ BitVec 32))) )
))
(declare-fun lt!557335 () array!79007)

(declare-datatypes ((List!26923 0))(
  ( (Nil!26920) (Cons!26919 (h!28137 (_ BitVec 64)) (t!40284 List!26923)) )
))
(declare-fun arrayNoDuplicates!0 (array!79007 (_ BitVec 32) List!26923) Bool)

(assert (=> b!1224729 (= res!813403 (arrayNoDuplicates!0 lt!557335 #b00000000000000000000000000000000 Nil!26920))))

(declare-fun b!1224730 () Bool)

(declare-datatypes ((V!46585 0))(
  ( (V!46586 (val!15603 Int)) )
))
(declare-datatypes ((tuple2!20108 0))(
  ( (tuple2!20109 (_1!10065 (_ BitVec 64)) (_2!10065 V!46585)) )
))
(declare-fun lt!557330 () tuple2!20108)

(declare-datatypes ((List!26924 0))(
  ( (Nil!26921) (Cons!26920 (h!28138 tuple2!20108) (t!40285 List!26924)) )
))
(declare-datatypes ((ListLongMap!18085 0))(
  ( (ListLongMap!18086 (toList!9058 List!26924)) )
))
(declare-fun lt!557328 () ListLongMap!18085)

(declare-fun e!695673 () Bool)

(declare-fun lt!557332 () ListLongMap!18085)

(declare-fun +!4160 (ListLongMap!18085 tuple2!20108) ListLongMap!18085)

(assert (=> b!1224730 (= e!695673 (= lt!557328 (+!4160 lt!557332 lt!557330)))))

(declare-fun b!1224731 () Bool)

(declare-fun e!695669 () Bool)

(assert (=> b!1224731 (= e!695677 (not e!695669))))

(declare-fun res!813398 () Bool)

(assert (=> b!1224731 (=> res!813398 e!695669)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224731 (= res!813398 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!79007)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224731 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40492 0))(
  ( (Unit!40493) )
))
(declare-fun lt!557334 () Unit!40492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79007 (_ BitVec 64) (_ BitVec 32)) Unit!40492)

(assert (=> b!1224731 (= lt!557334 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224732 () Bool)

(declare-fun e!695675 () Bool)

(declare-fun e!695671 () Bool)

(assert (=> b!1224732 (= e!695675 e!695671)))

(declare-fun res!813395 () Bool)

(assert (=> b!1224732 (=> res!813395 e!695671)))

(assert (=> b!1224732 (= res!813395 (not (= (select (arr!38124 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224733 () Bool)

(declare-fun res!813393 () Bool)

(declare-fun e!695680 () Bool)

(assert (=> b!1224733 (=> (not res!813393) (not e!695680))))

(assert (=> b!1224733 (= res!813393 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38661 _keys!1208))))))

(declare-fun b!1224734 () Bool)

(declare-fun e!695674 () Bool)

(declare-fun tp_is_empty!31093 () Bool)

(assert (=> b!1224734 (= e!695674 tp_is_empty!31093)))

(declare-fun b!1224735 () Bool)

(declare-fun res!813401 () Bool)

(assert (=> b!1224735 (=> (not res!813401) (not e!695680))))

(assert (=> b!1224735 (= res!813401 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26920))))

(declare-fun res!813392 () Bool)

(assert (=> start!101936 (=> (not res!813392) (not e!695680))))

(assert (=> start!101936 (= res!813392 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38661 _keys!1208))))))

(assert (=> start!101936 e!695680))

(assert (=> start!101936 tp_is_empty!31093))

(declare-fun array_inv!29082 (array!79007) Bool)

(assert (=> start!101936 (array_inv!29082 _keys!1208)))

(assert (=> start!101936 true))

(assert (=> start!101936 tp!92212))

(declare-datatypes ((ValueCell!14837 0))(
  ( (ValueCellFull!14837 (v!18261 V!46585)) (EmptyCell!14837) )
))
(declare-datatypes ((array!79009 0))(
  ( (array!79010 (arr!38125 (Array (_ BitVec 32) ValueCell!14837)) (size!38662 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79009)

(declare-fun e!695670 () Bool)

(declare-fun array_inv!29083 (array!79009) Bool)

(assert (=> start!101936 (and (array_inv!29083 _values!996) e!695670)))

(declare-fun b!1224736 () Bool)

(declare-fun res!813399 () Bool)

(assert (=> b!1224736 (=> (not res!813399) (not e!695680))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1224736 (= res!813399 (and (= (size!38662 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38661 _keys!1208) (size!38662 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224737 () Bool)

(declare-fun mapRes!48538 () Bool)

(assert (=> b!1224737 (= e!695670 (and e!695674 mapRes!48538))))

(declare-fun condMapEmpty!48538 () Bool)

(declare-fun mapDefault!48538 () ValueCell!14837)

(assert (=> b!1224737 (= condMapEmpty!48538 (= (arr!38125 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14837)) mapDefault!48538)))))

(declare-fun b!1224738 () Bool)

(declare-fun e!695672 () Unit!40492)

(declare-fun Unit!40494 () Unit!40492)

(assert (=> b!1224738 (= e!695672 Unit!40494)))

(declare-fun b!1224739 () Bool)

(assert (=> b!1224739 (= e!695671 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224740 () Bool)

(declare-fun e!695668 () Bool)

(declare-fun e!695676 () Bool)

(assert (=> b!1224740 (= e!695668 e!695676)))

(declare-fun res!813400 () Bool)

(assert (=> b!1224740 (=> res!813400 e!695676)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224740 (= res!813400 (not (validKeyInArray!0 (select (arr!38124 _keys!1208) from!1455))))))

(declare-fun lt!557329 () ListLongMap!18085)

(declare-fun lt!557327 () ListLongMap!18085)

(assert (=> b!1224740 (= lt!557329 lt!557327)))

(declare-fun -!1936 (ListLongMap!18085 (_ BitVec 64)) ListLongMap!18085)

(assert (=> b!1224740 (= lt!557327 (-!1936 lt!557332 k0!934))))

(declare-fun zeroValue!944 () V!46585)

(declare-fun lt!557331 () array!79009)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46585)

(declare-fun getCurrentListMapNoExtraKeys!5510 (array!79007 array!79009 (_ BitVec 32) (_ BitVec 32) V!46585 V!46585 (_ BitVec 32) Int) ListLongMap!18085)

(assert (=> b!1224740 (= lt!557329 (getCurrentListMapNoExtraKeys!5510 lt!557335 lt!557331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224740 (= lt!557332 (getCurrentListMapNoExtraKeys!5510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557326 () Unit!40492)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1151 (array!79007 array!79009 (_ BitVec 32) (_ BitVec 32) V!46585 V!46585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40492)

(assert (=> b!1224740 (= lt!557326 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1151 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224741 () Bool)

(declare-fun res!813396 () Bool)

(assert (=> b!1224741 (=> (not res!813396) (not e!695680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79007 (_ BitVec 32)) Bool)

(assert (=> b!1224741 (= res!813396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224742 () Bool)

(declare-fun e!695679 () Bool)

(assert (=> b!1224742 (= e!695679 tp_is_empty!31093)))

(declare-fun b!1224743 () Bool)

(assert (=> b!1224743 (= e!695676 true)))

(assert (=> b!1224743 e!695673))

(declare-fun res!813402 () Bool)

(assert (=> b!1224743 (=> (not res!813402) (not e!695673))))

(assert (=> b!1224743 (= res!813402 (not (= (select (arr!38124 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557336 () Unit!40492)

(assert (=> b!1224743 (= lt!557336 e!695672)))

(declare-fun c!120802 () Bool)

(assert (=> b!1224743 (= c!120802 (= (select (arr!38124 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224743 e!695675))

(declare-fun res!813394 () Bool)

(assert (=> b!1224743 (=> (not res!813394) (not e!695675))))

(declare-fun lt!557325 () ListLongMap!18085)

(assert (=> b!1224743 (= res!813394 (= lt!557325 (+!4160 lt!557327 lt!557330)))))

(declare-fun lt!557322 () V!46585)

(declare-fun get!19510 (ValueCell!14837 V!46585) V!46585)

(assert (=> b!1224743 (= lt!557330 (tuple2!20109 (select (arr!38124 _keys!1208) from!1455) (get!19510 (select (arr!38125 _values!996) from!1455) lt!557322)))))

(declare-fun b!1224744 () Bool)

(assert (=> b!1224744 (= e!695669 e!695668)))

(declare-fun res!813397 () Bool)

(assert (=> b!1224744 (=> res!813397 e!695668)))

(assert (=> b!1224744 (= res!813397 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224744 (= lt!557325 (getCurrentListMapNoExtraKeys!5510 lt!557335 lt!557331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224744 (= lt!557331 (array!79010 (store (arr!38125 _values!996) i!673 (ValueCellFull!14837 lt!557322)) (size!38662 _values!996)))))

(declare-fun dynLambda!3409 (Int (_ BitVec 64)) V!46585)

(assert (=> b!1224744 (= lt!557322 (dynLambda!3409 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224744 (= lt!557328 (getCurrentListMapNoExtraKeys!5510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48538 () Bool)

(declare-fun tp!92213 () Bool)

(assert (=> mapNonEmpty!48538 (= mapRes!48538 (and tp!92213 e!695679))))

(declare-fun mapKey!48538 () (_ BitVec 32))

(declare-fun mapValue!48538 () ValueCell!14837)

(declare-fun mapRest!48538 () (Array (_ BitVec 32) ValueCell!14837))

(assert (=> mapNonEmpty!48538 (= (arr!38125 _values!996) (store mapRest!48538 mapKey!48538 mapValue!48538))))

(declare-fun b!1224745 () Bool)

(assert (=> b!1224745 (= e!695680 e!695677)))

(declare-fun res!813405 () Bool)

(assert (=> b!1224745 (=> (not res!813405) (not e!695677))))

(assert (=> b!1224745 (= res!813405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557335 mask!1564))))

(assert (=> b!1224745 (= lt!557335 (array!79008 (store (arr!38124 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38661 _keys!1208)))))

(declare-fun b!1224746 () Bool)

(declare-fun res!813390 () Bool)

(assert (=> b!1224746 (=> (not res!813390) (not e!695680))))

(assert (=> b!1224746 (= res!813390 (= (select (arr!38124 _keys!1208) i!673) k0!934))))

(declare-fun b!1224747 () Bool)

(declare-fun res!813404 () Bool)

(assert (=> b!1224747 (=> (not res!813404) (not e!695680))))

(assert (=> b!1224747 (= res!813404 (validKeyInArray!0 k0!934))))

(declare-fun b!1224748 () Bool)

(declare-fun res!813391 () Bool)

(assert (=> b!1224748 (=> (not res!813391) (not e!695680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224748 (= res!813391 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48538 () Bool)

(assert (=> mapIsEmpty!48538 mapRes!48538))

(declare-fun b!1224749 () Bool)

(declare-fun Unit!40495 () Unit!40492)

(assert (=> b!1224749 (= e!695672 Unit!40495)))

(declare-fun lt!557333 () Unit!40492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79007 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40492)

(assert (=> b!1224749 (= lt!557333 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557323 () Unit!40492)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79007 (_ BitVec 32) (_ BitVec 32)) Unit!40492)

(assert (=> b!1224749 (= lt!557323 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224749 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26920)))

(declare-fun lt!557324 () Unit!40492)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79007 (_ BitVec 64) (_ BitVec 32) List!26923) Unit!40492)

(assert (=> b!1224749 (= lt!557324 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26920))))

(assert (=> b!1224749 false))

(assert (= (and start!101936 res!813392) b!1224748))

(assert (= (and b!1224748 res!813391) b!1224736))

(assert (= (and b!1224736 res!813399) b!1224741))

(assert (= (and b!1224741 res!813396) b!1224735))

(assert (= (and b!1224735 res!813401) b!1224733))

(assert (= (and b!1224733 res!813393) b!1224747))

(assert (= (and b!1224747 res!813404) b!1224746))

(assert (= (and b!1224746 res!813390) b!1224745))

(assert (= (and b!1224745 res!813405) b!1224729))

(assert (= (and b!1224729 res!813403) b!1224731))

(assert (= (and b!1224731 (not res!813398)) b!1224744))

(assert (= (and b!1224744 (not res!813397)) b!1224740))

(assert (= (and b!1224740 (not res!813400)) b!1224743))

(assert (= (and b!1224743 res!813394) b!1224732))

(assert (= (and b!1224732 (not res!813395)) b!1224739))

(assert (= (and b!1224743 c!120802) b!1224749))

(assert (= (and b!1224743 (not c!120802)) b!1224738))

(assert (= (and b!1224743 res!813402) b!1224730))

(assert (= (and b!1224737 condMapEmpty!48538) mapIsEmpty!48538))

(assert (= (and b!1224737 (not condMapEmpty!48538)) mapNonEmpty!48538))

(get-info :version)

(assert (= (and mapNonEmpty!48538 ((_ is ValueCellFull!14837) mapValue!48538)) b!1224742))

(assert (= (and b!1224737 ((_ is ValueCellFull!14837) mapDefault!48538)) b!1224734))

(assert (= start!101936 b!1224737))

(declare-fun b_lambda!22363 () Bool)

(assert (=> (not b_lambda!22363) (not b!1224744)))

(declare-fun t!40283 () Bool)

(declare-fun tb!11181 () Bool)

(assert (=> (and start!101936 (= defaultEntry!1004 defaultEntry!1004) t!40283) tb!11181))

(declare-fun result!22983 () Bool)

(assert (=> tb!11181 (= result!22983 tp_is_empty!31093)))

(assert (=> b!1224744 t!40283))

(declare-fun b_and!44043 () Bool)

(assert (= b_and!44041 (and (=> t!40283 result!22983) b_and!44043)))

(declare-fun m!1130039 () Bool)

(assert (=> b!1224743 m!1130039))

(declare-fun m!1130041 () Bool)

(assert (=> b!1224743 m!1130041))

(declare-fun m!1130043 () Bool)

(assert (=> b!1224743 m!1130043))

(assert (=> b!1224743 m!1130043))

(declare-fun m!1130045 () Bool)

(assert (=> b!1224743 m!1130045))

(declare-fun m!1130047 () Bool)

(assert (=> b!1224740 m!1130047))

(declare-fun m!1130049 () Bool)

(assert (=> b!1224740 m!1130049))

(declare-fun m!1130051 () Bool)

(assert (=> b!1224740 m!1130051))

(declare-fun m!1130053 () Bool)

(assert (=> b!1224740 m!1130053))

(assert (=> b!1224740 m!1130039))

(declare-fun m!1130055 () Bool)

(assert (=> b!1224740 m!1130055))

(assert (=> b!1224740 m!1130039))

(declare-fun m!1130057 () Bool)

(assert (=> b!1224745 m!1130057))

(declare-fun m!1130059 () Bool)

(assert (=> b!1224745 m!1130059))

(declare-fun m!1130061 () Bool)

(assert (=> b!1224748 m!1130061))

(assert (=> b!1224732 m!1130039))

(declare-fun m!1130063 () Bool)

(assert (=> b!1224749 m!1130063))

(declare-fun m!1130065 () Bool)

(assert (=> b!1224749 m!1130065))

(declare-fun m!1130067 () Bool)

(assert (=> b!1224749 m!1130067))

(declare-fun m!1130069 () Bool)

(assert (=> b!1224749 m!1130069))

(declare-fun m!1130071 () Bool)

(assert (=> b!1224749 m!1130071))

(declare-fun m!1130073 () Bool)

(assert (=> b!1224747 m!1130073))

(declare-fun m!1130075 () Bool)

(assert (=> b!1224735 m!1130075))

(declare-fun m!1130077 () Bool)

(assert (=> b!1224741 m!1130077))

(declare-fun m!1130079 () Bool)

(assert (=> b!1224744 m!1130079))

(declare-fun m!1130081 () Bool)

(assert (=> b!1224744 m!1130081))

(declare-fun m!1130083 () Bool)

(assert (=> b!1224744 m!1130083))

(declare-fun m!1130085 () Bool)

(assert (=> b!1224744 m!1130085))

(declare-fun m!1130087 () Bool)

(assert (=> b!1224746 m!1130087))

(declare-fun m!1130089 () Bool)

(assert (=> b!1224739 m!1130089))

(declare-fun m!1130091 () Bool)

(assert (=> b!1224730 m!1130091))

(declare-fun m!1130093 () Bool)

(assert (=> mapNonEmpty!48538 m!1130093))

(declare-fun m!1130095 () Bool)

(assert (=> b!1224729 m!1130095))

(declare-fun m!1130097 () Bool)

(assert (=> b!1224731 m!1130097))

(declare-fun m!1130099 () Bool)

(assert (=> b!1224731 m!1130099))

(declare-fun m!1130101 () Bool)

(assert (=> start!101936 m!1130101))

(declare-fun m!1130103 () Bool)

(assert (=> start!101936 m!1130103))

(check-sat (not b!1224744) (not b!1224743) (not b_next!26389) (not b!1224741) (not b!1224731) (not b!1224729) (not b!1224747) (not b!1224739) tp_is_empty!31093 (not b!1224748) (not b!1224740) (not b!1224735) (not b_lambda!22363) (not mapNonEmpty!48538) (not b!1224745) (not start!101936) b_and!44043 (not b!1224749) (not b!1224730))
(check-sat b_and!44043 (not b_next!26389))
