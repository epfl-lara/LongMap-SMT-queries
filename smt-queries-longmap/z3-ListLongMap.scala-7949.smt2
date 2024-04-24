; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98770 () Bool)

(assert start!98770)

(declare-fun b_free!24139 () Bool)

(declare-fun b_next!24139 () Bool)

(assert (=> start!98770 (= b_free!24139 (not b_next!24139))))

(declare-fun tp!85128 () Bool)

(declare-fun b_and!39129 () Bool)

(assert (=> start!98770 (= tp!85128 b_and!39129)))

(declare-fun b!1142783 () Bool)

(declare-fun e!650253 () Bool)

(declare-fun e!650248 () Bool)

(declare-fun mapRes!44828 () Bool)

(assert (=> b!1142783 (= e!650253 (and e!650248 mapRes!44828))))

(declare-fun condMapEmpty!44828 () Bool)

(declare-datatypes ((V!43353 0))(
  ( (V!43354 (val!14391 Int)) )
))
(declare-datatypes ((ValueCell!13625 0))(
  ( (ValueCellFull!13625 (v!17024 V!43353)) (EmptyCell!13625) )
))
(declare-datatypes ((array!74239 0))(
  ( (array!74240 (arr!35764 (Array (_ BitVec 32) ValueCell!13625)) (size!36301 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74239)

(declare-fun mapDefault!44828 () ValueCell!13625)

(assert (=> b!1142783 (= condMapEmpty!44828 (= (arr!35764 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13625)) mapDefault!44828)))))

(declare-fun res!761400 () Bool)

(declare-fun e!650263 () Bool)

(assert (=> start!98770 (=> (not res!761400) (not e!650263))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74241 0))(
  ( (array!74242 (arr!35765 (Array (_ BitVec 32) (_ BitVec 64))) (size!36302 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74241)

(assert (=> start!98770 (= res!761400 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36302 _keys!1208))))))

(assert (=> start!98770 e!650263))

(declare-fun tp_is_empty!28669 () Bool)

(assert (=> start!98770 tp_is_empty!28669))

(declare-fun array_inv!27460 (array!74241) Bool)

(assert (=> start!98770 (array_inv!27460 _keys!1208)))

(assert (=> start!98770 true))

(assert (=> start!98770 tp!85128))

(declare-fun array_inv!27461 (array!74239) Bool)

(assert (=> start!98770 (and (array_inv!27461 _values!996) e!650253)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1142784 () Bool)

(declare-fun e!650262 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!509074 () Bool)

(assert (=> b!1142784 (= e!650262 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509074) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142785 () Bool)

(declare-fun res!761393 () Bool)

(assert (=> b!1142785 (=> (not res!761393) (not e!650263))))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1142785 (= res!761393 (and (= (size!36301 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36302 _keys!1208) (size!36301 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142786 () Bool)

(declare-fun res!761394 () Bool)

(declare-fun e!650250 () Bool)

(assert (=> b!1142786 (=> (not res!761394) (not e!650250))))

(declare-fun lt!509058 () array!74241)

(declare-datatypes ((List!24980 0))(
  ( (Nil!24977) (Cons!24976 (h!26194 (_ BitVec 64)) (t!36103 List!24980)) )
))
(declare-fun arrayNoDuplicates!0 (array!74241 (_ BitVec 32) List!24980) Bool)

(assert (=> b!1142786 (= res!761394 (arrayNoDuplicates!0 lt!509058 #b00000000000000000000000000000000 Nil!24977))))

(declare-datatypes ((tuple2!18220 0))(
  ( (tuple2!18221 (_1!9121 (_ BitVec 64)) (_2!9121 V!43353)) )
))
(declare-datatypes ((List!24981 0))(
  ( (Nil!24978) (Cons!24977 (h!26195 tuple2!18220) (t!36104 List!24981)) )
))
(declare-datatypes ((ListLongMap!16197 0))(
  ( (ListLongMap!16198 (toList!8114 List!24981)) )
))
(declare-fun call!51277 () ListLongMap!16197)

(declare-fun bm!51272 () Bool)

(declare-fun c!112507 () Bool)

(declare-fun call!51280 () Bool)

(declare-fun lt!509069 () ListLongMap!16197)

(declare-fun contains!6659 (ListLongMap!16197 (_ BitVec 64)) Bool)

(assert (=> bm!51272 (= call!51280 (contains!6659 (ite c!112507 lt!509069 call!51277) k0!934))))

(declare-fun b!1142787 () Bool)

(declare-fun e!650260 () Bool)

(declare-fun e!650255 () Bool)

(assert (=> b!1142787 (= e!650260 e!650255)))

(declare-fun res!761392 () Bool)

(assert (=> b!1142787 (=> res!761392 e!650255)))

(assert (=> b!1142787 (= res!761392 (not (= (select (arr!35765 _keys!1208) from!1455) k0!934)))))

(declare-fun e!650254 () Bool)

(assert (=> b!1142787 e!650254))

(declare-fun c!112510 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142787 (= c!112510 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43353)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43353)

(declare-datatypes ((Unit!37421 0))(
  ( (Unit!37422) )
))
(declare-fun lt!509060 () Unit!37421)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!501 (array!74241 array!74239 (_ BitVec 32) (_ BitVec 32) V!43353 V!43353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37421)

(assert (=> b!1142787 (= lt!509060 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142788 () Bool)

(declare-fun c!112511 () Bool)

(assert (=> b!1142788 (= c!112511 (and (not lt!509074) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650252 () Unit!37421)

(declare-fun e!650259 () Unit!37421)

(assert (=> b!1142788 (= e!650252 e!650259)))

(declare-fun bm!51273 () Bool)

(declare-fun call!51276 () Bool)

(assert (=> bm!51273 (= call!51276 call!51280)))

(declare-fun mapIsEmpty!44828 () Bool)

(assert (=> mapIsEmpty!44828 mapRes!44828))

(declare-fun b!1142789 () Bool)

(declare-fun +!3561 (ListLongMap!16197 tuple2!18220) ListLongMap!16197)

(assert (=> b!1142789 (contains!6659 (+!3561 lt!509069 (tuple2!18221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509071 () Unit!37421)

(declare-fun call!51279 () Unit!37421)

(assert (=> b!1142789 (= lt!509071 call!51279)))

(assert (=> b!1142789 call!51280))

(declare-fun call!51275 () ListLongMap!16197)

(assert (=> b!1142789 (= lt!509069 call!51275)))

(declare-fun lt!509057 () ListLongMap!16197)

(declare-fun lt!509061 () Unit!37421)

(declare-fun addStillContains!788 (ListLongMap!16197 (_ BitVec 64) V!43353 (_ BitVec 64)) Unit!37421)

(assert (=> b!1142789 (= lt!509061 (addStillContains!788 lt!509057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1142789 (= e!650252 lt!509071)))

(declare-fun b!1142790 () Bool)

(declare-fun e!650251 () Bool)

(assert (=> b!1142790 (= e!650250 (not e!650251))))

(declare-fun res!761402 () Bool)

(assert (=> b!1142790 (=> res!761402 e!650251)))

(assert (=> b!1142790 (= res!761402 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142790 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509063 () Unit!37421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74241 (_ BitVec 64) (_ BitVec 32)) Unit!37421)

(assert (=> b!1142790 (= lt!509063 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1142791 () Bool)

(declare-fun e!650256 () Unit!37421)

(assert (=> b!1142791 (= e!650259 e!650256)))

(declare-fun c!112508 () Bool)

(assert (=> b!1142791 (= c!112508 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509074))))

(declare-fun b!1142792 () Bool)

(declare-fun res!761398 () Bool)

(assert (=> b!1142792 (=> (not res!761398) (not e!650263))))

(assert (=> b!1142792 (= res!761398 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36302 _keys!1208))))))

(declare-fun b!1142793 () Bool)

(declare-fun e!650257 () Unit!37421)

(declare-fun Unit!37423 () Unit!37421)

(assert (=> b!1142793 (= e!650257 Unit!37423)))

(declare-fun mapNonEmpty!44828 () Bool)

(declare-fun tp!85127 () Bool)

(declare-fun e!650261 () Bool)

(assert (=> mapNonEmpty!44828 (= mapRes!44828 (and tp!85127 e!650261))))

(declare-fun mapValue!44828 () ValueCell!13625)

(declare-fun mapRest!44828 () (Array (_ BitVec 32) ValueCell!13625))

(declare-fun mapKey!44828 () (_ BitVec 32))

(assert (=> mapNonEmpty!44828 (= (arr!35764 _values!996) (store mapRest!44828 mapKey!44828 mapValue!44828))))

(declare-fun b!1142794 () Bool)

(assert (=> b!1142794 (= e!650261 tp_is_empty!28669)))

(declare-fun b!1142795 () Bool)

(declare-fun res!761396 () Bool)

(assert (=> b!1142795 (=> (not res!761396) (not e!650263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74241 (_ BitVec 32)) Bool)

(assert (=> b!1142795 (= res!761396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142796 () Bool)

(declare-fun res!761390 () Bool)

(assert (=> b!1142796 (=> (not res!761390) (not e!650263))))

(assert (=> b!1142796 (= res!761390 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24977))))

(declare-fun b!1142797 () Bool)

(assert (=> b!1142797 call!51276))

(declare-fun lt!509054 () Unit!37421)

(declare-fun call!51278 () Unit!37421)

(assert (=> b!1142797 (= lt!509054 call!51278)))

(assert (=> b!1142797 (= e!650256 lt!509054)))

(declare-fun b!1142798 () Bool)

(assert (=> b!1142798 (= e!650262 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142799 () Bool)

(declare-fun call!51281 () ListLongMap!16197)

(declare-fun call!51282 () ListLongMap!16197)

(declare-fun -!1245 (ListLongMap!16197 (_ BitVec 64)) ListLongMap!16197)

(assert (=> b!1142799 (= e!650254 (= call!51282 (-!1245 call!51281 k0!934)))))

(declare-fun bm!51274 () Bool)

(assert (=> bm!51274 (= call!51275 (+!3561 lt!509057 (ite (or c!112507 c!112511) (tuple2!18221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1142800 () Bool)

(declare-fun res!761397 () Bool)

(assert (=> b!1142800 (=> (not res!761397) (not e!650263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142800 (= res!761397 (validKeyInArray!0 k0!934))))

(declare-fun bm!51275 () Bool)

(assert (=> bm!51275 (= call!51279 (addStillContains!788 (ite c!112507 lt!509069 lt!509057) (ite c!112507 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112511 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112507 minValue!944 (ite c!112511 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1142801 () Bool)

(declare-fun Unit!37424 () Unit!37421)

(assert (=> b!1142801 (= e!650257 Unit!37424)))

(assert (=> b!1142801 (= lt!509074 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142801 (= c!112507 (and (not lt!509074) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509055 () Unit!37421)

(assert (=> b!1142801 (= lt!509055 e!650252)))

(declare-fun lt!509068 () Unit!37421)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!392 (array!74241 array!74239 (_ BitVec 32) (_ BitVec 32) V!43353 V!43353 (_ BitVec 64) (_ BitVec 32) Int) Unit!37421)

(assert (=> b!1142801 (= lt!509068 (lemmaListMapContainsThenArrayContainsFrom!392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112509 () Bool)

(assert (=> b!1142801 (= c!112509 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761399 () Bool)

(assert (=> b!1142801 (= res!761399 e!650262)))

(declare-fun e!650249 () Bool)

(assert (=> b!1142801 (=> (not res!761399) (not e!650249))))

(assert (=> b!1142801 e!650249))

(declare-fun lt!509072 () Unit!37421)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74241 (_ BitVec 32) (_ BitVec 32)) Unit!37421)

(assert (=> b!1142801 (= lt!509072 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142801 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24977)))

(declare-fun lt!509070 () Unit!37421)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74241 (_ BitVec 64) (_ BitVec 32) List!24980) Unit!37421)

(assert (=> b!1142801 (= lt!509070 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24977))))

(assert (=> b!1142801 false))

(declare-fun b!1142802 () Bool)

(assert (=> b!1142802 (= e!650254 (= call!51282 call!51281))))

(declare-fun bm!51276 () Bool)

(assert (=> bm!51276 (= call!51278 call!51279)))

(declare-fun b!1142803 () Bool)

(assert (=> b!1142803 (= e!650255 true)))

(declare-fun lt!509067 () V!43353)

(assert (=> b!1142803 (= (-!1245 (+!3561 lt!509057 (tuple2!18221 (select (arr!35765 _keys!1208) from!1455) lt!509067)) (select (arr!35765 _keys!1208) from!1455)) lt!509057)))

(declare-fun lt!509065 () Unit!37421)

(declare-fun addThenRemoveForNewKeyIsSame!105 (ListLongMap!16197 (_ BitVec 64) V!43353) Unit!37421)

(assert (=> b!1142803 (= lt!509065 (addThenRemoveForNewKeyIsSame!105 lt!509057 (select (arr!35765 _keys!1208) from!1455) lt!509067))))

(declare-fun lt!509064 () V!43353)

(declare-fun get!18196 (ValueCell!13625 V!43353) V!43353)

(assert (=> b!1142803 (= lt!509067 (get!18196 (select (arr!35764 _values!996) from!1455) lt!509064))))

(declare-fun lt!509059 () Unit!37421)

(assert (=> b!1142803 (= lt!509059 e!650257)))

(declare-fun c!112512 () Bool)

(assert (=> b!1142803 (= c!112512 (contains!6659 lt!509057 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4622 (array!74241 array!74239 (_ BitVec 32) (_ BitVec 32) V!43353 V!43353 (_ BitVec 32) Int) ListLongMap!16197)

(assert (=> b!1142803 (= lt!509057 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51277 () Bool)

(assert (=> bm!51277 (= call!51281 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142804 () Bool)

(assert (=> b!1142804 (= e!650251 e!650260)))

(declare-fun res!761395 () Bool)

(assert (=> b!1142804 (=> res!761395 e!650260)))

(assert (=> b!1142804 (= res!761395 (not (= from!1455 i!673)))))

(declare-fun lt!509062 () ListLongMap!16197)

(declare-fun lt!509056 () array!74239)

(assert (=> b!1142804 (= lt!509062 (getCurrentListMapNoExtraKeys!4622 lt!509058 lt!509056 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142804 (= lt!509056 (array!74240 (store (arr!35764 _values!996) i!673 (ValueCellFull!13625 lt!509064)) (size!36301 _values!996)))))

(declare-fun dynLambda!2660 (Int (_ BitVec 64)) V!43353)

(assert (=> b!1142804 (= lt!509064 (dynLambda!2660 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509066 () ListLongMap!16197)

(assert (=> b!1142804 (= lt!509066 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142805 () Bool)

(declare-fun res!761403 () Bool)

(assert (=> b!1142805 (=> (not res!761403) (not e!650263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142805 (= res!761403 (validMask!0 mask!1564))))

(declare-fun bm!51278 () Bool)

(assert (=> bm!51278 (= call!51277 call!51275)))

(declare-fun b!1142806 () Bool)

(declare-fun res!761401 () Bool)

(assert (=> b!1142806 (=> (not res!761401) (not e!650263))))

(assert (=> b!1142806 (= res!761401 (= (select (arr!35765 _keys!1208) i!673) k0!934))))

(declare-fun b!1142807 () Bool)

(assert (=> b!1142807 (= e!650263 e!650250)))

(declare-fun res!761391 () Bool)

(assert (=> b!1142807 (=> (not res!761391) (not e!650250))))

(assert (=> b!1142807 (= res!761391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509058 mask!1564))))

(assert (=> b!1142807 (= lt!509058 (array!74242 (store (arr!35765 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36302 _keys!1208)))))

(declare-fun b!1142808 () Bool)

(assert (=> b!1142808 (= e!650249 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51279 () Bool)

(assert (=> bm!51279 (= call!51282 (getCurrentListMapNoExtraKeys!4622 lt!509058 lt!509056 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142809 () Bool)

(declare-fun Unit!37425 () Unit!37421)

(assert (=> b!1142809 (= e!650256 Unit!37425)))

(declare-fun b!1142810 () Bool)

(assert (=> b!1142810 (= e!650248 tp_is_empty!28669)))

(declare-fun b!1142811 () Bool)

(declare-fun lt!509073 () Unit!37421)

(assert (=> b!1142811 (= e!650259 lt!509073)))

(assert (=> b!1142811 (= lt!509073 call!51278)))

(assert (=> b!1142811 call!51276))

(assert (= (and start!98770 res!761400) b!1142805))

(assert (= (and b!1142805 res!761403) b!1142785))

(assert (= (and b!1142785 res!761393) b!1142795))

(assert (= (and b!1142795 res!761396) b!1142796))

(assert (= (and b!1142796 res!761390) b!1142792))

(assert (= (and b!1142792 res!761398) b!1142800))

(assert (= (and b!1142800 res!761397) b!1142806))

(assert (= (and b!1142806 res!761401) b!1142807))

(assert (= (and b!1142807 res!761391) b!1142786))

(assert (= (and b!1142786 res!761394) b!1142790))

(assert (= (and b!1142790 (not res!761402)) b!1142804))

(assert (= (and b!1142804 (not res!761395)) b!1142787))

(assert (= (and b!1142787 c!112510) b!1142799))

(assert (= (and b!1142787 (not c!112510)) b!1142802))

(assert (= (or b!1142799 b!1142802) bm!51279))

(assert (= (or b!1142799 b!1142802) bm!51277))

(assert (= (and b!1142787 (not res!761392)) b!1142803))

(assert (= (and b!1142803 c!112512) b!1142801))

(assert (= (and b!1142803 (not c!112512)) b!1142793))

(assert (= (and b!1142801 c!112507) b!1142789))

(assert (= (and b!1142801 (not c!112507)) b!1142788))

(assert (= (and b!1142788 c!112511) b!1142811))

(assert (= (and b!1142788 (not c!112511)) b!1142791))

(assert (= (and b!1142791 c!112508) b!1142797))

(assert (= (and b!1142791 (not c!112508)) b!1142809))

(assert (= (or b!1142811 b!1142797) bm!51276))

(assert (= (or b!1142811 b!1142797) bm!51278))

(assert (= (or b!1142811 b!1142797) bm!51273))

(assert (= (or b!1142789 bm!51273) bm!51272))

(assert (= (or b!1142789 bm!51276) bm!51275))

(assert (= (or b!1142789 bm!51278) bm!51274))

(assert (= (and b!1142801 c!112509) b!1142798))

(assert (= (and b!1142801 (not c!112509)) b!1142784))

(assert (= (and b!1142801 res!761399) b!1142808))

(assert (= (and b!1142783 condMapEmpty!44828) mapIsEmpty!44828))

(assert (= (and b!1142783 (not condMapEmpty!44828)) mapNonEmpty!44828))

(get-info :version)

(assert (= (and mapNonEmpty!44828 ((_ is ValueCellFull!13625) mapValue!44828)) b!1142794))

(assert (= (and b!1142783 ((_ is ValueCellFull!13625) mapDefault!44828)) b!1142810))

(assert (= start!98770 b!1142783))

(declare-fun b_lambda!19239 () Bool)

(assert (=> (not b_lambda!19239) (not b!1142804)))

(declare-fun t!36102 () Bool)

(declare-fun tb!8943 () Bool)

(assert (=> (and start!98770 (= defaultEntry!1004 defaultEntry!1004) t!36102) tb!8943))

(declare-fun result!18459 () Bool)

(assert (=> tb!8943 (= result!18459 tp_is_empty!28669)))

(assert (=> b!1142804 t!36102))

(declare-fun b_and!39131 () Bool)

(assert (= b_and!39129 (and (=> t!36102 result!18459) b_and!39131)))

(declare-fun m!1054451 () Bool)

(assert (=> b!1142804 m!1054451))

(declare-fun m!1054453 () Bool)

(assert (=> b!1142804 m!1054453))

(declare-fun m!1054455 () Bool)

(assert (=> b!1142804 m!1054455))

(declare-fun m!1054457 () Bool)

(assert (=> b!1142804 m!1054457))

(declare-fun m!1054459 () Bool)

(assert (=> b!1142799 m!1054459))

(declare-fun m!1054461 () Bool)

(assert (=> start!98770 m!1054461))

(declare-fun m!1054463 () Bool)

(assert (=> start!98770 m!1054463))

(declare-fun m!1054465 () Bool)

(assert (=> bm!51275 m!1054465))

(declare-fun m!1054467 () Bool)

(assert (=> b!1142800 m!1054467))

(declare-fun m!1054469 () Bool)

(assert (=> b!1142807 m!1054469))

(declare-fun m!1054471 () Bool)

(assert (=> b!1142807 m!1054471))

(declare-fun m!1054473 () Bool)

(assert (=> b!1142789 m!1054473))

(assert (=> b!1142789 m!1054473))

(declare-fun m!1054475 () Bool)

(assert (=> b!1142789 m!1054475))

(declare-fun m!1054477 () Bool)

(assert (=> b!1142789 m!1054477))

(declare-fun m!1054479 () Bool)

(assert (=> b!1142803 m!1054479))

(declare-fun m!1054481 () Bool)

(assert (=> b!1142803 m!1054481))

(declare-fun m!1054483 () Bool)

(assert (=> b!1142803 m!1054483))

(declare-fun m!1054485 () Bool)

(assert (=> b!1142803 m!1054485))

(declare-fun m!1054487 () Bool)

(assert (=> b!1142803 m!1054487))

(declare-fun m!1054489 () Bool)

(assert (=> b!1142803 m!1054489))

(assert (=> b!1142803 m!1054483))

(declare-fun m!1054491 () Bool)

(assert (=> b!1142803 m!1054491))

(assert (=> b!1142803 m!1054481))

(declare-fun m!1054493 () Bool)

(assert (=> b!1142803 m!1054493))

(assert (=> b!1142803 m!1054489))

(assert (=> b!1142803 m!1054483))

(declare-fun m!1054495 () Bool)

(assert (=> b!1142790 m!1054495))

(declare-fun m!1054497 () Bool)

(assert (=> b!1142790 m!1054497))

(assert (=> bm!51277 m!1054479))

(declare-fun m!1054499 () Bool)

(assert (=> b!1142796 m!1054499))

(declare-fun m!1054501 () Bool)

(assert (=> bm!51279 m!1054501))

(declare-fun m!1054503 () Bool)

(assert (=> b!1142808 m!1054503))

(declare-fun m!1054505 () Bool)

(assert (=> bm!51274 m!1054505))

(declare-fun m!1054507 () Bool)

(assert (=> b!1142805 m!1054507))

(declare-fun m!1054509 () Bool)

(assert (=> b!1142786 m!1054509))

(declare-fun m!1054511 () Bool)

(assert (=> b!1142801 m!1054511))

(declare-fun m!1054513 () Bool)

(assert (=> b!1142801 m!1054513))

(declare-fun m!1054515 () Bool)

(assert (=> b!1142801 m!1054515))

(declare-fun m!1054517 () Bool)

(assert (=> b!1142801 m!1054517))

(declare-fun m!1054519 () Bool)

(assert (=> bm!51272 m!1054519))

(declare-fun m!1054521 () Bool)

(assert (=> b!1142795 m!1054521))

(assert (=> b!1142798 m!1054503))

(assert (=> b!1142787 m!1054483))

(declare-fun m!1054523 () Bool)

(assert (=> b!1142787 m!1054523))

(declare-fun m!1054525 () Bool)

(assert (=> mapNonEmpty!44828 m!1054525))

(declare-fun m!1054527 () Bool)

(assert (=> b!1142806 m!1054527))

(check-sat (not mapNonEmpty!44828) (not b_lambda!19239) (not b!1142801) (not bm!51272) (not b!1142803) tp_is_empty!28669 (not b!1142790) (not bm!51274) (not b!1142787) (not bm!51275) (not start!98770) (not b!1142796) (not b!1142786) (not b!1142807) (not b!1142804) b_and!39131 (not b!1142799) (not bm!51277) (not b!1142798) (not bm!51279) (not b!1142789) (not b!1142795) (not b_next!24139) (not b!1142800) (not b!1142808) (not b!1142805))
(check-sat b_and!39131 (not b_next!24139))
