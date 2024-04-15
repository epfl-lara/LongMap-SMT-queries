; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98720 () Bool)

(assert start!98720)

(declare-fun b_free!24331 () Bool)

(declare-fun b_next!24331 () Bool)

(assert (=> start!98720 (= b_free!24331 (not b_next!24331))))

(declare-fun tp!85704 () Bool)

(declare-fun b_and!39489 () Bool)

(assert (=> start!98720 (= tp!85704 b_and!39489)))

(declare-fun b!1150114 () Bool)

(declare-fun e!654146 () Bool)

(declare-fun e!654161 () Bool)

(declare-fun mapRes!45116 () Bool)

(assert (=> b!1150114 (= e!654146 (and e!654161 mapRes!45116))))

(declare-fun condMapEmpty!45116 () Bool)

(declare-datatypes ((V!43609 0))(
  ( (V!43610 (val!14487 Int)) )
))
(declare-datatypes ((ValueCell!13721 0))(
  ( (ValueCellFull!13721 (v!17123 V!43609)) (EmptyCell!13721) )
))
(declare-datatypes ((array!74488 0))(
  ( (array!74489 (arr!35895 (Array (_ BitVec 32) ValueCell!13721)) (size!36433 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74488)

(declare-fun mapDefault!45116 () ValueCell!13721)

(assert (=> b!1150114 (= condMapEmpty!45116 (= (arr!35895 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13721)) mapDefault!45116)))))

(declare-fun bm!53488 () Bool)

(declare-fun call!53494 () Bool)

(declare-fun call!53495 () Bool)

(assert (=> bm!53488 (= call!53494 call!53495)))

(declare-fun zeroValue!944 () V!43609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!74490 0))(
  ( (array!74491 (arr!35896 (Array (_ BitVec 32) (_ BitVec 64))) (size!36434 (_ BitVec 32))) )
))
(declare-fun lt!514476 () array!74490)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!514477 () array!74488)

(declare-fun bm!53489 () Bool)

(declare-datatypes ((tuple2!18460 0))(
  ( (tuple2!18461 (_1!9241 (_ BitVec 64)) (_2!9241 V!43609)) )
))
(declare-datatypes ((List!25195 0))(
  ( (Nil!25192) (Cons!25191 (h!26400 tuple2!18460) (t!36509 List!25195)) )
))
(declare-datatypes ((ListLongMap!16429 0))(
  ( (ListLongMap!16430 (toList!8230 List!25195)) )
))
(declare-fun call!53498 () ListLongMap!16429)

(declare-fun minValue!944 () V!43609)

(declare-fun getCurrentListMapNoExtraKeys!4714 (array!74490 array!74488 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 32) Int) ListLongMap!16429)

(assert (=> bm!53489 (= call!53498 (getCurrentListMapNoExtraKeys!4714 lt!514476 lt!514477 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150115 () Bool)

(declare-fun res!765058 () Bool)

(declare-fun e!654158 () Bool)

(assert (=> b!1150115 (=> (not res!765058) (not e!654158))))

(declare-datatypes ((List!25196 0))(
  ( (Nil!25193) (Cons!25192 (h!26401 (_ BitVec 64)) (t!36510 List!25196)) )
))
(declare-fun arrayNoDuplicates!0 (array!74490 (_ BitVec 32) List!25196) Bool)

(assert (=> b!1150115 (= res!765058 (arrayNoDuplicates!0 lt!514476 #b00000000000000000000000000000000 Nil!25193))))

(declare-fun b!1150116 () Bool)

(declare-fun tp_is_empty!28861 () Bool)

(assert (=> b!1150116 (= e!654161 tp_is_empty!28861)))

(declare-fun b!1150117 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!654152 () Bool)

(declare-fun lt!514466 () Bool)

(assert (=> b!1150117 (= e!654152 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514466) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150118 () Bool)

(declare-fun res!765055 () Bool)

(declare-fun e!654162 () Bool)

(assert (=> b!1150118 (=> (not res!765055) (not e!654162))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74490)

(assert (=> b!1150118 (= res!765055 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36434 _keys!1208))))))

(declare-fun b!1150119 () Bool)

(declare-fun e!654153 () Bool)

(assert (=> b!1150119 (= e!654153 true)))

(declare-fun e!654149 () Bool)

(assert (=> b!1150119 e!654149))

(declare-fun res!765056 () Bool)

(assert (=> b!1150119 (=> (not res!765056) (not e!654149))))

(declare-fun lt!514473 () ListLongMap!16429)

(declare-fun lt!514484 () ListLongMap!16429)

(assert (=> b!1150119 (= res!765056 (= lt!514473 lt!514484))))

(declare-fun lt!514479 () ListLongMap!16429)

(declare-fun -!1298 (ListLongMap!16429 (_ BitVec 64)) ListLongMap!16429)

(assert (=> b!1150119 (= lt!514473 (-!1298 lt!514479 k0!934))))

(declare-fun lt!514475 () V!43609)

(declare-fun +!3646 (ListLongMap!16429 tuple2!18460) ListLongMap!16429)

(assert (=> b!1150119 (= (-!1298 (+!3646 lt!514484 (tuple2!18461 (select (arr!35896 _keys!1208) from!1455) lt!514475)) (select (arr!35896 _keys!1208) from!1455)) lt!514484)))

(declare-datatypes ((Unit!37648 0))(
  ( (Unit!37649) )
))
(declare-fun lt!514467 () Unit!37648)

(declare-fun addThenRemoveForNewKeyIsSame!156 (ListLongMap!16429 (_ BitVec 64) V!43609) Unit!37648)

(assert (=> b!1150119 (= lt!514467 (addThenRemoveForNewKeyIsSame!156 lt!514484 (select (arr!35896 _keys!1208) from!1455) lt!514475))))

(declare-fun lt!514465 () V!43609)

(declare-fun get!18280 (ValueCell!13721 V!43609) V!43609)

(assert (=> b!1150119 (= lt!514475 (get!18280 (select (arr!35895 _values!996) from!1455) lt!514465))))

(declare-fun lt!514478 () Unit!37648)

(declare-fun e!654160 () Unit!37648)

(assert (=> b!1150119 (= lt!514478 e!654160)))

(declare-fun c!113814 () Bool)

(declare-fun contains!6687 (ListLongMap!16429 (_ BitVec 64)) Bool)

(assert (=> b!1150119 (= c!113814 (contains!6687 lt!514484 k0!934))))

(assert (=> b!1150119 (= lt!514484 (getCurrentListMapNoExtraKeys!4714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45116 () Bool)

(declare-fun tp!85703 () Bool)

(declare-fun e!654159 () Bool)

(assert (=> mapNonEmpty!45116 (= mapRes!45116 (and tp!85703 e!654159))))

(declare-fun mapKey!45116 () (_ BitVec 32))

(declare-fun mapValue!45116 () ValueCell!13721)

(declare-fun mapRest!45116 () (Array (_ BitVec 32) ValueCell!13721))

(assert (=> mapNonEmpty!45116 (= (arr!35895 _values!996) (store mapRest!45116 mapKey!45116 mapValue!45116))))

(declare-fun b!1150120 () Bool)

(declare-fun res!765062 () Bool)

(assert (=> b!1150120 (=> (not res!765062) (not e!654162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150120 (= res!765062 (validKeyInArray!0 k0!934))))

(declare-fun b!1150121 () Bool)

(declare-fun e!654155 () Unit!37648)

(declare-fun e!654147 () Unit!37648)

(assert (=> b!1150121 (= e!654155 e!654147)))

(declare-fun c!113816 () Bool)

(assert (=> b!1150121 (= c!113816 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514466))))

(declare-fun b!1150122 () Bool)

(declare-fun res!765051 () Bool)

(assert (=> b!1150122 (=> (not res!765051) (not e!654162))))

(assert (=> b!1150122 (= res!765051 (and (= (size!36433 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36434 _keys!1208) (size!36433 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!765050 () Bool)

(assert (=> start!98720 (=> (not res!765050) (not e!654162))))

(assert (=> start!98720 (= res!765050 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36434 _keys!1208))))))

(assert (=> start!98720 e!654162))

(assert (=> start!98720 tp_is_empty!28861))

(declare-fun array_inv!27578 (array!74490) Bool)

(assert (=> start!98720 (array_inv!27578 _keys!1208)))

(assert (=> start!98720 true))

(assert (=> start!98720 tp!85704))

(declare-fun array_inv!27579 (array!74488) Bool)

(assert (=> start!98720 (and (array_inv!27579 _values!996) e!654146)))

(declare-fun b!1150123 () Bool)

(declare-fun call!53496 () ListLongMap!16429)

(declare-fun e!654148 () Bool)

(assert (=> b!1150123 (= e!654148 (= call!53498 (-!1298 call!53496 k0!934)))))

(declare-fun b!1150124 () Bool)

(declare-fun Unit!37650 () Unit!37648)

(assert (=> b!1150124 (= e!654147 Unit!37650)))

(declare-fun bm!53490 () Bool)

(declare-fun call!53491 () Unit!37648)

(declare-fun call!53492 () Unit!37648)

(assert (=> bm!53490 (= call!53491 call!53492)))

(declare-fun bm!53491 () Bool)

(assert (=> bm!53491 (= call!53496 (getCurrentListMapNoExtraKeys!4714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150125 () Bool)

(declare-fun lt!514480 () ListLongMap!16429)

(assert (=> b!1150125 (contains!6687 (+!3646 lt!514480 (tuple2!18461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!514483 () Unit!37648)

(declare-fun addStillContains!857 (ListLongMap!16429 (_ BitVec 64) V!43609 (_ BitVec 64)) Unit!37648)

(assert (=> b!1150125 (= lt!514483 (addStillContains!857 lt!514480 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1150125 call!53495))

(declare-fun call!53497 () ListLongMap!16429)

(assert (=> b!1150125 (= lt!514480 call!53497)))

(declare-fun lt!514470 () Unit!37648)

(assert (=> b!1150125 (= lt!514470 call!53492)))

(declare-fun e!654157 () Unit!37648)

(assert (=> b!1150125 (= e!654157 lt!514483)))

(declare-fun b!1150126 () Bool)

(declare-fun e!654151 () Bool)

(assert (=> b!1150126 (= e!654158 (not e!654151))))

(declare-fun res!765049 () Bool)

(assert (=> b!1150126 (=> res!765049 e!654151)))

(assert (=> b!1150126 (= res!765049 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150126 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514482 () Unit!37648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74490 (_ BitVec 64) (_ BitVec 32)) Unit!37648)

(assert (=> b!1150126 (= lt!514482 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150127 () Bool)

(assert (=> b!1150127 (= e!654159 tp_is_empty!28861)))

(declare-fun b!1150128 () Bool)

(assert (=> b!1150128 (= e!654148 (= call!53498 call!53496))))

(declare-fun b!1150129 () Bool)

(assert (=> b!1150129 call!53494))

(declare-fun lt!514464 () Unit!37648)

(assert (=> b!1150129 (= lt!514464 call!53491)))

(assert (=> b!1150129 (= e!654147 lt!514464)))

(declare-fun b!1150130 () Bool)

(declare-fun c!113811 () Bool)

(assert (=> b!1150130 (= c!113811 (and (not lt!514466) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1150130 (= e!654157 e!654155)))

(declare-fun b!1150131 () Bool)

(declare-fun res!765057 () Bool)

(assert (=> b!1150131 (=> (not res!765057) (not e!654162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150131 (= res!765057 (validMask!0 mask!1564))))

(declare-fun b!1150132 () Bool)

(assert (=> b!1150132 (= e!654152 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150133 () Bool)

(declare-fun e!654156 () Bool)

(assert (=> b!1150133 (= e!654156 e!654153)))

(declare-fun res!765059 () Bool)

(assert (=> b!1150133 (=> res!765059 e!654153)))

(assert (=> b!1150133 (= res!765059 (not (= (select (arr!35896 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150133 e!654148))

(declare-fun c!113815 () Bool)

(assert (=> b!1150133 (= c!113815 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514468 () Unit!37648)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!573 (array!74490 array!74488 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37648)

(assert (=> b!1150133 (= lt!514468 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150134 () Bool)

(declare-fun lt!514469 () Unit!37648)

(assert (=> b!1150134 (= e!654155 lt!514469)))

(assert (=> b!1150134 (= lt!514469 call!53491)))

(assert (=> b!1150134 call!53494))

(declare-fun bm!53492 () Bool)

(declare-fun call!53493 () ListLongMap!16429)

(assert (=> bm!53492 (= call!53493 call!53497)))

(declare-fun e!654150 () Bool)

(declare-fun b!1150135 () Bool)

(assert (=> b!1150135 (= e!654150 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53493 () Bool)

(declare-fun c!113813 () Bool)

(assert (=> bm!53493 (= call!53497 (+!3646 lt!514484 (ite (or c!113813 c!113811) (tuple2!18461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150136 () Bool)

(declare-fun res!765054 () Bool)

(assert (=> b!1150136 (=> (not res!765054) (not e!654162))))

(assert (=> b!1150136 (= res!765054 (= (select (arr!35896 _keys!1208) i!673) k0!934))))

(declare-fun b!1150137 () Bool)

(declare-fun res!765053 () Bool)

(assert (=> b!1150137 (=> (not res!765053) (not e!654162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74490 (_ BitVec 32)) Bool)

(assert (=> b!1150137 (= res!765053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150138 () Bool)

(assert (=> b!1150138 (= e!654149 (= lt!514473 (getCurrentListMapNoExtraKeys!4714 lt!514476 lt!514477 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53494 () Bool)

(assert (=> bm!53494 (= call!53495 (contains!6687 (ite c!113813 lt!514480 call!53493) k0!934))))

(declare-fun b!1150139 () Bool)

(declare-fun res!765048 () Bool)

(assert (=> b!1150139 (=> (not res!765048) (not e!654162))))

(assert (=> b!1150139 (= res!765048 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25193))))

(declare-fun b!1150140 () Bool)

(assert (=> b!1150140 (= e!654151 e!654156)))

(declare-fun res!765061 () Bool)

(assert (=> b!1150140 (=> res!765061 e!654156)))

(assert (=> b!1150140 (= res!765061 (not (= from!1455 i!673)))))

(declare-fun lt!514481 () ListLongMap!16429)

(assert (=> b!1150140 (= lt!514481 (getCurrentListMapNoExtraKeys!4714 lt!514476 lt!514477 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150140 (= lt!514477 (array!74489 (store (arr!35895 _values!996) i!673 (ValueCellFull!13721 lt!514465)) (size!36433 _values!996)))))

(declare-fun dynLambda!2678 (Int (_ BitVec 64)) V!43609)

(assert (=> b!1150140 (= lt!514465 (dynLambda!2678 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150140 (= lt!514479 (getCurrentListMapNoExtraKeys!4714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150141 () Bool)

(declare-fun Unit!37651 () Unit!37648)

(assert (=> b!1150141 (= e!654160 Unit!37651)))

(declare-fun b!1150142 () Bool)

(assert (=> b!1150142 (= e!654162 e!654158)))

(declare-fun res!765060 () Bool)

(assert (=> b!1150142 (=> (not res!765060) (not e!654158))))

(assert (=> b!1150142 (= res!765060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514476 mask!1564))))

(assert (=> b!1150142 (= lt!514476 (array!74491 (store (arr!35896 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36434 _keys!1208)))))

(declare-fun bm!53495 () Bool)

(assert (=> bm!53495 (= call!53492 (addStillContains!857 lt!514484 (ite (or c!113813 c!113811) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113813 c!113811) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!45116 () Bool)

(assert (=> mapIsEmpty!45116 mapRes!45116))

(declare-fun b!1150143 () Bool)

(declare-fun Unit!37652 () Unit!37648)

(assert (=> b!1150143 (= e!654160 Unit!37652)))

(assert (=> b!1150143 (= lt!514466 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150143 (= c!113813 (and (not lt!514466) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514471 () Unit!37648)

(assert (=> b!1150143 (= lt!514471 e!654157)))

(declare-fun lt!514472 () Unit!37648)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!448 (array!74490 array!74488 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 64) (_ BitVec 32) Int) Unit!37648)

(assert (=> b!1150143 (= lt!514472 (lemmaListMapContainsThenArrayContainsFrom!448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113812 () Bool)

(assert (=> b!1150143 (= c!113812 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765052 () Bool)

(assert (=> b!1150143 (= res!765052 e!654152)))

(assert (=> b!1150143 (=> (not res!765052) (not e!654150))))

(assert (=> b!1150143 e!654150))

(declare-fun lt!514485 () Unit!37648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74490 (_ BitVec 32) (_ BitVec 32)) Unit!37648)

(assert (=> b!1150143 (= lt!514485 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150143 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25193)))

(declare-fun lt!514474 () Unit!37648)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74490 (_ BitVec 64) (_ BitVec 32) List!25196) Unit!37648)

(assert (=> b!1150143 (= lt!514474 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25193))))

(assert (=> b!1150143 false))

(assert (= (and start!98720 res!765050) b!1150131))

(assert (= (and b!1150131 res!765057) b!1150122))

(assert (= (and b!1150122 res!765051) b!1150137))

(assert (= (and b!1150137 res!765053) b!1150139))

(assert (= (and b!1150139 res!765048) b!1150118))

(assert (= (and b!1150118 res!765055) b!1150120))

(assert (= (and b!1150120 res!765062) b!1150136))

(assert (= (and b!1150136 res!765054) b!1150142))

(assert (= (and b!1150142 res!765060) b!1150115))

(assert (= (and b!1150115 res!765058) b!1150126))

(assert (= (and b!1150126 (not res!765049)) b!1150140))

(assert (= (and b!1150140 (not res!765061)) b!1150133))

(assert (= (and b!1150133 c!113815) b!1150123))

(assert (= (and b!1150133 (not c!113815)) b!1150128))

(assert (= (or b!1150123 b!1150128) bm!53489))

(assert (= (or b!1150123 b!1150128) bm!53491))

(assert (= (and b!1150133 (not res!765059)) b!1150119))

(assert (= (and b!1150119 c!113814) b!1150143))

(assert (= (and b!1150119 (not c!113814)) b!1150141))

(assert (= (and b!1150143 c!113813) b!1150125))

(assert (= (and b!1150143 (not c!113813)) b!1150130))

(assert (= (and b!1150130 c!113811) b!1150134))

(assert (= (and b!1150130 (not c!113811)) b!1150121))

(assert (= (and b!1150121 c!113816) b!1150129))

(assert (= (and b!1150121 (not c!113816)) b!1150124))

(assert (= (or b!1150134 b!1150129) bm!53490))

(assert (= (or b!1150134 b!1150129) bm!53492))

(assert (= (or b!1150134 b!1150129) bm!53488))

(assert (= (or b!1150125 bm!53488) bm!53494))

(assert (= (or b!1150125 bm!53490) bm!53495))

(assert (= (or b!1150125 bm!53492) bm!53493))

(assert (= (and b!1150143 c!113812) b!1150132))

(assert (= (and b!1150143 (not c!113812)) b!1150117))

(assert (= (and b!1150143 res!765052) b!1150135))

(assert (= (and b!1150119 res!765056) b!1150138))

(assert (= (and b!1150114 condMapEmpty!45116) mapIsEmpty!45116))

(assert (= (and b!1150114 (not condMapEmpty!45116)) mapNonEmpty!45116))

(get-info :version)

(assert (= (and mapNonEmpty!45116 ((_ is ValueCellFull!13721) mapValue!45116)) b!1150127))

(assert (= (and b!1150114 ((_ is ValueCellFull!13721) mapDefault!45116)) b!1150116))

(assert (= start!98720 b!1150114))

(declare-fun b_lambda!19419 () Bool)

(assert (=> (not b_lambda!19419) (not b!1150140)))

(declare-fun t!36508 () Bool)

(declare-fun tb!9135 () Bool)

(assert (=> (and start!98720 (= defaultEntry!1004 defaultEntry!1004) t!36508) tb!9135))

(declare-fun result!18843 () Bool)

(assert (=> tb!9135 (= result!18843 tp_is_empty!28861)))

(assert (=> b!1150140 t!36508))

(declare-fun b_and!39491 () Bool)

(assert (= b_and!39489 (and (=> t!36508 result!18843) b_and!39491)))

(declare-fun m!1059903 () Bool)

(assert (=> bm!53495 m!1059903))

(declare-fun m!1059905 () Bool)

(assert (=> b!1150135 m!1059905))

(declare-fun m!1059907 () Bool)

(assert (=> bm!53493 m!1059907))

(assert (=> b!1150132 m!1059905))

(declare-fun m!1059909 () Bool)

(assert (=> bm!53494 m!1059909))

(declare-fun m!1059911 () Bool)

(assert (=> b!1150136 m!1059911))

(declare-fun m!1059913 () Bool)

(assert (=> b!1150139 m!1059913))

(declare-fun m!1059915 () Bool)

(assert (=> b!1150115 m!1059915))

(declare-fun m!1059917 () Bool)

(assert (=> b!1150138 m!1059917))

(declare-fun m!1059919 () Bool)

(assert (=> b!1150120 m!1059919))

(declare-fun m!1059921 () Bool)

(assert (=> b!1150126 m!1059921))

(declare-fun m!1059923 () Bool)

(assert (=> b!1150126 m!1059923))

(declare-fun m!1059925 () Bool)

(assert (=> b!1150143 m!1059925))

(declare-fun m!1059927 () Bool)

(assert (=> b!1150143 m!1059927))

(declare-fun m!1059929 () Bool)

(assert (=> b!1150143 m!1059929))

(declare-fun m!1059931 () Bool)

(assert (=> b!1150143 m!1059931))

(declare-fun m!1059933 () Bool)

(assert (=> b!1150125 m!1059933))

(assert (=> b!1150125 m!1059933))

(declare-fun m!1059935 () Bool)

(assert (=> b!1150125 m!1059935))

(declare-fun m!1059937 () Bool)

(assert (=> b!1150125 m!1059937))

(declare-fun m!1059939 () Bool)

(assert (=> b!1150142 m!1059939))

(declare-fun m!1059941 () Bool)

(assert (=> b!1150142 m!1059941))

(declare-fun m!1059943 () Bool)

(assert (=> b!1150137 m!1059943))

(declare-fun m!1059945 () Bool)

(assert (=> b!1150133 m!1059945))

(declare-fun m!1059947 () Bool)

(assert (=> b!1150133 m!1059947))

(declare-fun m!1059949 () Bool)

(assert (=> b!1150131 m!1059949))

(declare-fun m!1059951 () Bool)

(assert (=> mapNonEmpty!45116 m!1059951))

(declare-fun m!1059953 () Bool)

(assert (=> b!1150123 m!1059953))

(declare-fun m!1059955 () Bool)

(assert (=> b!1150140 m!1059955))

(declare-fun m!1059957 () Bool)

(assert (=> b!1150140 m!1059957))

(declare-fun m!1059959 () Bool)

(assert (=> b!1150140 m!1059959))

(declare-fun m!1059961 () Bool)

(assert (=> b!1150140 m!1059961))

(declare-fun m!1059963 () Bool)

(assert (=> start!98720 m!1059963))

(declare-fun m!1059965 () Bool)

(assert (=> start!98720 m!1059965))

(declare-fun m!1059967 () Bool)

(assert (=> b!1150119 m!1059967))

(declare-fun m!1059969 () Bool)

(assert (=> b!1150119 m!1059969))

(declare-fun m!1059971 () Bool)

(assert (=> b!1150119 m!1059971))

(declare-fun m!1059973 () Bool)

(assert (=> b!1150119 m!1059973))

(assert (=> b!1150119 m!1059945))

(declare-fun m!1059975 () Bool)

(assert (=> b!1150119 m!1059975))

(declare-fun m!1059977 () Bool)

(assert (=> b!1150119 m!1059977))

(assert (=> b!1150119 m!1059945))

(assert (=> b!1150119 m!1059977))

(assert (=> b!1150119 m!1059945))

(declare-fun m!1059979 () Bool)

(assert (=> b!1150119 m!1059979))

(assert (=> b!1150119 m!1059971))

(declare-fun m!1059981 () Bool)

(assert (=> b!1150119 m!1059981))

(assert (=> bm!53489 m!1059917))

(assert (=> bm!53491 m!1059967))

(check-sat b_and!39491 (not b!1150115) (not b!1150120) (not b!1150133) (not b_next!24331) (not bm!53489) (not b!1150139) (not b!1150123) (not b!1150126) (not bm!53491) (not b!1150131) (not bm!53494) (not mapNonEmpty!45116) tp_is_empty!28861 (not b_lambda!19419) (not b!1150143) (not bm!53495) (not b!1150135) (not b!1150137) (not b!1150132) (not b!1150140) (not b!1150142) (not bm!53493) (not b!1150119) (not b!1150138) (not start!98720) (not b!1150125))
(check-sat b_and!39491 (not b_next!24331))
