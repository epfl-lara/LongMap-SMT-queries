; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98152 () Bool)

(assert start!98152)

(declare-fun b_free!23853 () Bool)

(declare-fun b_next!23853 () Bool)

(assert (=> start!98152 (= b_free!23853 (not b_next!23853))))

(declare-fun tp!84263 () Bool)

(declare-fun b_and!38489 () Bool)

(assert (=> start!98152 (= tp!84263 b_and!38489)))

(declare-fun b!1128483 () Bool)

(declare-fun res!754145 () Bool)

(declare-fun e!642258 () Bool)

(assert (=> b!1128483 (=> (not res!754145) (not e!642258))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73625 0))(
  ( (array!73626 (arr!35465 (Array (_ BitVec 32) (_ BitVec 64))) (size!36001 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73625)

(assert (=> b!1128483 (= res!754145 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36001 _keys!1208))))))

(declare-fun b!1128484 () Bool)

(declare-fun e!642267 () Bool)

(declare-fun tp_is_empty!28383 () Bool)

(assert (=> b!1128484 (= e!642267 tp_is_empty!28383)))

(declare-fun b!1128485 () Bool)

(declare-fun res!754149 () Bool)

(assert (=> b!1128485 (=> (not res!754149) (not e!642258))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73625 (_ BitVec 32)) Bool)

(assert (=> b!1128485 (= res!754149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128486 () Bool)

(declare-fun res!754154 () Bool)

(assert (=> b!1128486 (=> (not res!754154) (not e!642258))))

(declare-datatypes ((List!24700 0))(
  ( (Nil!24697) (Cons!24696 (h!25905 (_ BitVec 64)) (t!35545 List!24700)) )
))
(declare-fun arrayNoDuplicates!0 (array!73625 (_ BitVec 32) List!24700) Bool)

(assert (=> b!1128486 (= res!754154 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24697))))

(declare-fun b!1128487 () Bool)

(declare-fun e!642260 () Bool)

(declare-fun e!642263 () Bool)

(assert (=> b!1128487 (= e!642260 e!642263)))

(declare-fun res!754147 () Bool)

(assert (=> b!1128487 (=> res!754147 e!642263)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128487 (= res!754147 (not (= (select (arr!35465 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642264 () Bool)

(assert (=> b!1128487 e!642264))

(declare-fun c!109770 () Bool)

(assert (=> b!1128487 (= c!109770 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42971 0))(
  ( (V!42972 (val!14248 Int)) )
))
(declare-fun zeroValue!944 () V!42971)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36970 0))(
  ( (Unit!36971) )
))
(declare-fun lt!500984 () Unit!36970)

(declare-datatypes ((ValueCell!13482 0))(
  ( (ValueCellFull!13482 (v!16881 V!42971)) (EmptyCell!13482) )
))
(declare-datatypes ((array!73627 0))(
  ( (array!73628 (arr!35466 (Array (_ BitVec 32) ValueCell!13482)) (size!36002 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73627)

(declare-fun minValue!944 () V!42971)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!403 (array!73625 array!73627 (_ BitVec 32) (_ BitVec 32) V!42971 V!42971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36970)

(assert (=> b!1128487 (= lt!500984 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!754156 () Bool)

(assert (=> start!98152 (=> (not res!754156) (not e!642258))))

(assert (=> start!98152 (= res!754156 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36001 _keys!1208))))))

(assert (=> start!98152 e!642258))

(assert (=> start!98152 tp_is_empty!28383))

(declare-fun array_inv!27210 (array!73625) Bool)

(assert (=> start!98152 (array_inv!27210 _keys!1208)))

(assert (=> start!98152 true))

(assert (=> start!98152 tp!84263))

(declare-fun e!642261 () Bool)

(declare-fun array_inv!27211 (array!73627) Bool)

(assert (=> start!98152 (and (array_inv!27211 _values!996) e!642261)))

(declare-fun b!1128488 () Bool)

(declare-fun e!642262 () Bool)

(declare-fun e!642259 () Bool)

(assert (=> b!1128488 (= e!642262 (not e!642259))))

(declare-fun res!754150 () Bool)

(assert (=> b!1128488 (=> res!754150 e!642259)))

(assert (=> b!1128488 (= res!754150 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128488 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500979 () Unit!36970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73625 (_ BitVec 64) (_ BitVec 32)) Unit!36970)

(assert (=> b!1128488 (= lt!500979 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128489 () Bool)

(declare-datatypes ((tuple2!17932 0))(
  ( (tuple2!17933 (_1!8977 (_ BitVec 64)) (_2!8977 V!42971)) )
))
(declare-datatypes ((List!24701 0))(
  ( (Nil!24698) (Cons!24697 (h!25906 tuple2!17932) (t!35546 List!24701)) )
))
(declare-datatypes ((ListLongMap!15901 0))(
  ( (ListLongMap!15902 (toList!7966 List!24701)) )
))
(declare-fun call!47841 () ListLongMap!15901)

(declare-fun call!47842 () ListLongMap!15901)

(declare-fun -!1149 (ListLongMap!15901 (_ BitVec 64)) ListLongMap!15901)

(assert (=> b!1128489 (= e!642264 (= call!47841 (-!1149 call!47842 k0!934)))))

(declare-fun b!1128490 () Bool)

(declare-fun mapRes!44392 () Bool)

(assert (=> b!1128490 (= e!642261 (and e!642267 mapRes!44392))))

(declare-fun condMapEmpty!44392 () Bool)

(declare-fun mapDefault!44392 () ValueCell!13482)

(assert (=> b!1128490 (= condMapEmpty!44392 (= (arr!35466 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13482)) mapDefault!44392)))))

(declare-fun mapIsEmpty!44392 () Bool)

(assert (=> mapIsEmpty!44392 mapRes!44392))

(declare-fun b!1128491 () Bool)

(assert (=> b!1128491 (= e!642264 (= call!47841 call!47842))))

(declare-fun b!1128492 () Bool)

(declare-fun res!754148 () Bool)

(assert (=> b!1128492 (=> (not res!754148) (not e!642258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128492 (= res!754148 (validKeyInArray!0 k0!934))))

(declare-fun b!1128493 () Bool)

(assert (=> b!1128493 (= e!642259 e!642260)))

(declare-fun res!754144 () Bool)

(assert (=> b!1128493 (=> res!754144 e!642260)))

(assert (=> b!1128493 (= res!754144 (not (= from!1455 i!673)))))

(declare-fun lt!500978 () ListLongMap!15901)

(declare-fun lt!500983 () array!73627)

(declare-fun lt!500981 () array!73625)

(declare-fun getCurrentListMapNoExtraKeys!4453 (array!73625 array!73627 (_ BitVec 32) (_ BitVec 32) V!42971 V!42971 (_ BitVec 32) Int) ListLongMap!15901)

(assert (=> b!1128493 (= lt!500978 (getCurrentListMapNoExtraKeys!4453 lt!500981 lt!500983 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2534 (Int (_ BitVec 64)) V!42971)

(assert (=> b!1128493 (= lt!500983 (array!73628 (store (arr!35466 _values!996) i!673 (ValueCellFull!13482 (dynLambda!2534 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36002 _values!996)))))

(declare-fun lt!500982 () ListLongMap!15901)

(assert (=> b!1128493 (= lt!500982 (getCurrentListMapNoExtraKeys!4453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128494 () Bool)

(declare-fun res!754155 () Bool)

(assert (=> b!1128494 (=> (not res!754155) (not e!642258))))

(assert (=> b!1128494 (= res!754155 (= (select (arr!35465 _keys!1208) i!673) k0!934))))

(declare-fun b!1128495 () Bool)

(assert (=> b!1128495 (= e!642263 true)))

(declare-fun lt!500980 () Bool)

(declare-fun contains!6491 (ListLongMap!15901 (_ BitVec 64)) Bool)

(assert (=> b!1128495 (= lt!500980 (contains!6491 (getCurrentListMapNoExtraKeys!4453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47838 () Bool)

(assert (=> bm!47838 (= call!47842 (getCurrentListMapNoExtraKeys!4453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128496 () Bool)

(assert (=> b!1128496 (= e!642258 e!642262)))

(declare-fun res!754146 () Bool)

(assert (=> b!1128496 (=> (not res!754146) (not e!642262))))

(assert (=> b!1128496 (= res!754146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500981 mask!1564))))

(assert (=> b!1128496 (= lt!500981 (array!73626 (store (arr!35465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36001 _keys!1208)))))

(declare-fun b!1128497 () Bool)

(declare-fun res!754152 () Bool)

(assert (=> b!1128497 (=> (not res!754152) (not e!642262))))

(assert (=> b!1128497 (= res!754152 (arrayNoDuplicates!0 lt!500981 #b00000000000000000000000000000000 Nil!24697))))

(declare-fun mapNonEmpty!44392 () Bool)

(declare-fun tp!84262 () Bool)

(declare-fun e!642266 () Bool)

(assert (=> mapNonEmpty!44392 (= mapRes!44392 (and tp!84262 e!642266))))

(declare-fun mapValue!44392 () ValueCell!13482)

(declare-fun mapRest!44392 () (Array (_ BitVec 32) ValueCell!13482))

(declare-fun mapKey!44392 () (_ BitVec 32))

(assert (=> mapNonEmpty!44392 (= (arr!35466 _values!996) (store mapRest!44392 mapKey!44392 mapValue!44392))))

(declare-fun b!1128498 () Bool)

(declare-fun res!754153 () Bool)

(assert (=> b!1128498 (=> (not res!754153) (not e!642258))))

(assert (=> b!1128498 (= res!754153 (and (= (size!36002 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36001 _keys!1208) (size!36002 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47839 () Bool)

(assert (=> bm!47839 (= call!47841 (getCurrentListMapNoExtraKeys!4453 lt!500981 lt!500983 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128499 () Bool)

(declare-fun res!754151 () Bool)

(assert (=> b!1128499 (=> (not res!754151) (not e!642258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128499 (= res!754151 (validMask!0 mask!1564))))

(declare-fun b!1128500 () Bool)

(assert (=> b!1128500 (= e!642266 tp_is_empty!28383)))

(assert (= (and start!98152 res!754156) b!1128499))

(assert (= (and b!1128499 res!754151) b!1128498))

(assert (= (and b!1128498 res!754153) b!1128485))

(assert (= (and b!1128485 res!754149) b!1128486))

(assert (= (and b!1128486 res!754154) b!1128483))

(assert (= (and b!1128483 res!754145) b!1128492))

(assert (= (and b!1128492 res!754148) b!1128494))

(assert (= (and b!1128494 res!754155) b!1128496))

(assert (= (and b!1128496 res!754146) b!1128497))

(assert (= (and b!1128497 res!754152) b!1128488))

(assert (= (and b!1128488 (not res!754150)) b!1128493))

(assert (= (and b!1128493 (not res!754144)) b!1128487))

(assert (= (and b!1128487 c!109770) b!1128489))

(assert (= (and b!1128487 (not c!109770)) b!1128491))

(assert (= (or b!1128489 b!1128491) bm!47839))

(assert (= (or b!1128489 b!1128491) bm!47838))

(assert (= (and b!1128487 (not res!754147)) b!1128495))

(assert (= (and b!1128490 condMapEmpty!44392) mapIsEmpty!44392))

(assert (= (and b!1128490 (not condMapEmpty!44392)) mapNonEmpty!44392))

(get-info :version)

(assert (= (and mapNonEmpty!44392 ((_ is ValueCellFull!13482) mapValue!44392)) b!1128500))

(assert (= (and b!1128490 ((_ is ValueCellFull!13482) mapDefault!44392)) b!1128484))

(assert (= start!98152 b!1128490))

(declare-fun b_lambda!18823 () Bool)

(assert (=> (not b_lambda!18823) (not b!1128493)))

(declare-fun t!35544 () Bool)

(declare-fun tb!8665 () Bool)

(assert (=> (and start!98152 (= defaultEntry!1004 defaultEntry!1004) t!35544) tb!8665))

(declare-fun result!17891 () Bool)

(assert (=> tb!8665 (= result!17891 tp_is_empty!28383)))

(assert (=> b!1128493 t!35544))

(declare-fun b_and!38491 () Bool)

(assert (= b_and!38489 (and (=> t!35544 result!17891) b_and!38491)))

(declare-fun m!1042075 () Bool)

(assert (=> b!1128494 m!1042075))

(declare-fun m!1042077 () Bool)

(assert (=> b!1128489 m!1042077))

(declare-fun m!1042079 () Bool)

(assert (=> bm!47839 m!1042079))

(declare-fun m!1042081 () Bool)

(assert (=> b!1128497 m!1042081))

(declare-fun m!1042083 () Bool)

(assert (=> b!1128495 m!1042083))

(assert (=> b!1128495 m!1042083))

(declare-fun m!1042085 () Bool)

(assert (=> b!1128495 m!1042085))

(declare-fun m!1042087 () Bool)

(assert (=> b!1128485 m!1042087))

(declare-fun m!1042089 () Bool)

(assert (=> b!1128496 m!1042089))

(declare-fun m!1042091 () Bool)

(assert (=> b!1128496 m!1042091))

(declare-fun m!1042093 () Bool)

(assert (=> start!98152 m!1042093))

(declare-fun m!1042095 () Bool)

(assert (=> start!98152 m!1042095))

(declare-fun m!1042097 () Bool)

(assert (=> b!1128499 m!1042097))

(declare-fun m!1042099 () Bool)

(assert (=> b!1128486 m!1042099))

(assert (=> bm!47838 m!1042083))

(declare-fun m!1042101 () Bool)

(assert (=> b!1128492 m!1042101))

(declare-fun m!1042103 () Bool)

(assert (=> b!1128493 m!1042103))

(declare-fun m!1042105 () Bool)

(assert (=> b!1128493 m!1042105))

(declare-fun m!1042107 () Bool)

(assert (=> b!1128493 m!1042107))

(declare-fun m!1042109 () Bool)

(assert (=> b!1128493 m!1042109))

(declare-fun m!1042111 () Bool)

(assert (=> b!1128487 m!1042111))

(declare-fun m!1042113 () Bool)

(assert (=> b!1128487 m!1042113))

(declare-fun m!1042115 () Bool)

(assert (=> b!1128488 m!1042115))

(declare-fun m!1042117 () Bool)

(assert (=> b!1128488 m!1042117))

(declare-fun m!1042119 () Bool)

(assert (=> mapNonEmpty!44392 m!1042119))

(check-sat (not b!1128495) (not b!1128485) (not start!98152) (not b!1128496) (not b_lambda!18823) (not b_next!23853) (not b!1128487) (not b!1128488) (not bm!47839) (not b!1128489) (not b!1128493) (not bm!47838) tp_is_empty!28383 b_and!38491 (not mapNonEmpty!44392) (not b!1128492) (not b!1128486) (not b!1128499) (not b!1128497))
(check-sat b_and!38491 (not b_next!23853))
