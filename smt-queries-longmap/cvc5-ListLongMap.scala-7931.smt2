; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98426 () Bool)

(assert start!98426)

(declare-fun b_free!24031 () Bool)

(declare-fun b_next!24031 () Bool)

(assert (=> start!98426 (= b_free!24031 (not b_next!24031))))

(declare-fun tp!84804 () Bool)

(declare-fun b_and!38911 () Bool)

(assert (=> start!98426 (= tp!84804 b_and!38911)))

(declare-fun bm!49911 () Bool)

(declare-datatypes ((Unit!37224 0))(
  ( (Unit!37225) )
))
(declare-fun call!49920 () Unit!37224)

(declare-fun call!49918 () Unit!37224)

(assert (=> bm!49911 (= call!49920 call!49918)))

(declare-fun b!1136688 () Bool)

(declare-fun e!646830 () Unit!37224)

(declare-fun Unit!37226 () Unit!37224)

(assert (=> b!1136688 (= e!646830 Unit!37226)))

(declare-fun lt!505427 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1136688 (= lt!505427 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111140 () Bool)

(assert (=> b!1136688 (= c!111140 (and (not lt!505427) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505429 () Unit!37224)

(declare-fun e!646824 () Unit!37224)

(assert (=> b!1136688 (= lt!505429 e!646824)))

(declare-datatypes ((V!43209 0))(
  ( (V!43210 (val!14337 Int)) )
))
(declare-fun zeroValue!944 () V!43209)

(declare-fun lt!505423 () Unit!37224)

(declare-datatypes ((array!73983 0))(
  ( (array!73984 (arr!35642 (Array (_ BitVec 32) (_ BitVec 64))) (size!36178 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73983)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13571 0))(
  ( (ValueCellFull!13571 (v!16974 V!43209)) (EmptyCell!13571) )
))
(declare-datatypes ((array!73985 0))(
  ( (array!73986 (arr!35643 (Array (_ BitVec 32) ValueCell!13571)) (size!36179 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73985)

(declare-fun minValue!944 () V!43209)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!351 (array!73983 array!73985 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 64) (_ BitVec 32) Int) Unit!37224)

(assert (=> b!1136688 (= lt!505423 (lemmaListMapContainsThenArrayContainsFrom!351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111141 () Bool)

(assert (=> b!1136688 (= c!111141 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758621 () Bool)

(declare-fun e!646828 () Bool)

(assert (=> b!1136688 (= res!758621 e!646828)))

(declare-fun e!646831 () Bool)

(assert (=> b!1136688 (=> (not res!758621) (not e!646831))))

(assert (=> b!1136688 e!646831))

(declare-fun lt!505431 () Unit!37224)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73983 (_ BitVec 32) (_ BitVec 32)) Unit!37224)

(assert (=> b!1136688 (= lt!505431 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24861 0))(
  ( (Nil!24858) (Cons!24857 (h!26066 (_ BitVec 64)) (t!35884 List!24861)) )
))
(declare-fun arrayNoDuplicates!0 (array!73983 (_ BitVec 32) List!24861) Bool)

(assert (=> b!1136688 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24858)))

(declare-fun lt!505432 () Unit!37224)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73983 (_ BitVec 64) (_ BitVec 32) List!24861) Unit!37224)

(assert (=> b!1136688 (= lt!505432 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24858))))

(assert (=> b!1136688 false))

(declare-fun b!1136689 () Bool)

(declare-fun call!49914 () Bool)

(assert (=> b!1136689 call!49914))

(declare-fun lt!505430 () Unit!37224)

(assert (=> b!1136689 (= lt!505430 call!49920)))

(declare-fun e!646835 () Unit!37224)

(assert (=> b!1136689 (= e!646835 lt!505430)))

(declare-fun bm!49912 () Bool)

(declare-fun call!49917 () Bool)

(assert (=> bm!49912 (= call!49914 call!49917)))

(declare-fun b!1136690 () Bool)

(declare-fun Unit!37227 () Unit!37224)

(assert (=> b!1136690 (= e!646830 Unit!37227)))

(declare-fun bm!49913 () Bool)

(declare-datatypes ((tuple2!18102 0))(
  ( (tuple2!18103 (_1!9062 (_ BitVec 64)) (_2!9062 V!43209)) )
))
(declare-datatypes ((List!24862 0))(
  ( (Nil!24859) (Cons!24858 (h!26067 tuple2!18102) (t!35885 List!24862)) )
))
(declare-datatypes ((ListLongMap!16071 0))(
  ( (ListLongMap!16072 (toList!8051 List!24862)) )
))
(declare-fun call!49919 () ListLongMap!16071)

(declare-fun getCurrentListMapNoExtraKeys!4535 (array!73983 array!73985 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 32) Int) ListLongMap!16071)

(assert (=> bm!49913 (= call!49919 (getCurrentListMapNoExtraKeys!4535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136691 () Bool)

(declare-fun res!758616 () Bool)

(declare-fun e!646833 () Bool)

(assert (=> b!1136691 (=> (not res!758616) (not e!646833))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136691 (= res!758616 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36178 _keys!1208))))))

(declare-fun lt!505425 () ListLongMap!16071)

(declare-fun bm!49914 () Bool)

(declare-fun call!49921 () ListLongMap!16071)

(declare-fun contains!6591 (ListLongMap!16071 (_ BitVec 64)) Bool)

(assert (=> bm!49914 (= call!49917 (contains!6591 (ite c!111140 lt!505425 call!49921) k!934))))

(declare-fun mapNonEmpty!44666 () Bool)

(declare-fun mapRes!44666 () Bool)

(declare-fun tp!84803 () Bool)

(declare-fun e!646839 () Bool)

(assert (=> mapNonEmpty!44666 (= mapRes!44666 (and tp!84803 e!646839))))

(declare-fun mapValue!44666 () ValueCell!13571)

(declare-fun mapKey!44666 () (_ BitVec 32))

(declare-fun mapRest!44666 () (Array (_ BitVec 32) ValueCell!13571))

(assert (=> mapNonEmpty!44666 (= (arr!35643 _values!996) (store mapRest!44666 mapKey!44666 mapValue!44666))))

(declare-fun b!1136692 () Bool)

(declare-fun e!646837 () Bool)

(declare-fun call!49916 () ListLongMap!16071)

(assert (=> b!1136692 (= e!646837 (= call!49916 call!49919))))

(declare-fun lt!505435 () ListLongMap!16071)

(declare-fun c!111139 () Bool)

(declare-fun bm!49915 () Bool)

(declare-fun addStillContains!748 (ListLongMap!16071 (_ BitVec 64) V!43209 (_ BitVec 64)) Unit!37224)

(assert (=> bm!49915 (= call!49918 (addStillContains!748 lt!505435 (ite (or c!111140 c!111139) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111140 c!111139) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1136693 () Bool)

(declare-fun e!646834 () Bool)

(declare-fun e!646838 () Bool)

(assert (=> b!1136693 (= e!646834 e!646838)))

(declare-fun res!758614 () Bool)

(assert (=> b!1136693 (=> res!758614 e!646838)))

(assert (=> b!1136693 (= res!758614 (not (= (select (arr!35642 _keys!1208) from!1455) k!934)))))

(assert (=> b!1136693 e!646837))

(declare-fun c!111138 () Bool)

(assert (=> b!1136693 (= c!111138 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505428 () Unit!37224)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!458 (array!73983 array!73985 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37224)

(assert (=> b!1136693 (= lt!505428 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136694 () Bool)

(declare-fun res!758620 () Bool)

(assert (=> b!1136694 (=> (not res!758620) (not e!646833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136694 (= res!758620 (validKeyInArray!0 k!934))))

(declare-fun b!1136695 () Bool)

(declare-fun res!758619 () Bool)

(assert (=> b!1136695 (=> (not res!758619) (not e!646833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136695 (= res!758619 (validMask!0 mask!1564))))

(declare-fun b!1136696 () Bool)

(assert (=> b!1136696 (= e!646838 true)))

(declare-fun lt!505440 () Unit!37224)

(assert (=> b!1136696 (= lt!505440 e!646830)))

(declare-fun c!111142 () Bool)

(assert (=> b!1136696 (= c!111142 (contains!6591 lt!505435 k!934))))

(assert (=> b!1136696 (= lt!505435 (getCurrentListMapNoExtraKeys!4535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49916 () Bool)

(declare-fun call!49915 () ListLongMap!16071)

(assert (=> bm!49916 (= call!49921 call!49915)))

(declare-fun b!1136697 () Bool)

(declare-fun arrayContainsKey!0 (array!73983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136697 (= e!646828 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136698 () Bool)

(declare-fun tp_is_empty!28561 () Bool)

(assert (=> b!1136698 (= e!646839 tp_is_empty!28561)))

(declare-fun bm!49917 () Bool)

(declare-fun +!3487 (ListLongMap!16071 tuple2!18102) ListLongMap!16071)

(assert (=> bm!49917 (= call!49915 (+!3487 (ite c!111140 lt!505425 lt!505435) (ite c!111140 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111139 (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1136699 () Bool)

(declare-fun res!758627 () Bool)

(assert (=> b!1136699 (=> (not res!758627) (not e!646833))))

(assert (=> b!1136699 (= res!758627 (and (= (size!36179 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36178 _keys!1208) (size!36179 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44666 () Bool)

(assert (=> mapIsEmpty!44666 mapRes!44666))

(declare-fun b!1136700 () Bool)

(declare-fun res!758617 () Bool)

(assert (=> b!1136700 (=> (not res!758617) (not e!646833))))

(assert (=> b!1136700 (= res!758617 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24858))))

(declare-fun b!1136701 () Bool)

(declare-fun e!646827 () Unit!37224)

(declare-fun lt!505436 () Unit!37224)

(assert (=> b!1136701 (= e!646827 lt!505436)))

(assert (=> b!1136701 (= lt!505436 call!49920)))

(assert (=> b!1136701 call!49914))

(declare-fun b!1136702 () Bool)

(assert (=> b!1136702 (= c!111139 (and (not lt!505427) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1136702 (= e!646824 e!646827)))

(declare-fun lt!505434 () array!73983)

(declare-fun lt!505424 () array!73985)

(declare-fun bm!49918 () Bool)

(assert (=> bm!49918 (= call!49916 (getCurrentListMapNoExtraKeys!4535 lt!505434 lt!505424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136703 () Bool)

(declare-fun res!758624 () Bool)

(declare-fun e!646825 () Bool)

(assert (=> b!1136703 (=> (not res!758624) (not e!646825))))

(assert (=> b!1136703 (= res!758624 (arrayNoDuplicates!0 lt!505434 #b00000000000000000000000000000000 Nil!24858))))

(declare-fun b!1136704 () Bool)

(assert (=> b!1136704 (= e!646827 e!646835)))

(declare-fun c!111137 () Bool)

(assert (=> b!1136704 (= c!111137 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505427))))

(declare-fun b!1136705 () Bool)

(declare-fun e!646832 () Bool)

(assert (=> b!1136705 (= e!646832 e!646834)))

(declare-fun res!758625 () Bool)

(assert (=> b!1136705 (=> res!758625 e!646834)))

(assert (=> b!1136705 (= res!758625 (not (= from!1455 i!673)))))

(declare-fun lt!505439 () ListLongMap!16071)

(assert (=> b!1136705 (= lt!505439 (getCurrentListMapNoExtraKeys!4535 lt!505434 lt!505424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2593 (Int (_ BitVec 64)) V!43209)

(assert (=> b!1136705 (= lt!505424 (array!73986 (store (arr!35643 _values!996) i!673 (ValueCellFull!13571 (dynLambda!2593 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36179 _values!996)))))

(declare-fun lt!505426 () ListLongMap!16071)

(assert (=> b!1136705 (= lt!505426 (getCurrentListMapNoExtraKeys!4535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!758615 () Bool)

(assert (=> start!98426 (=> (not res!758615) (not e!646833))))

(assert (=> start!98426 (= res!758615 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36178 _keys!1208))))))

(assert (=> start!98426 e!646833))

(assert (=> start!98426 tp_is_empty!28561))

(declare-fun array_inv!27330 (array!73983) Bool)

(assert (=> start!98426 (array_inv!27330 _keys!1208)))

(assert (=> start!98426 true))

(assert (=> start!98426 tp!84804))

(declare-fun e!646826 () Bool)

(declare-fun array_inv!27331 (array!73985) Bool)

(assert (=> start!98426 (and (array_inv!27331 _values!996) e!646826)))

(declare-fun b!1136706 () Bool)

(assert (=> b!1136706 (= e!646825 (not e!646832))))

(declare-fun res!758618 () Bool)

(assert (=> b!1136706 (=> res!758618 e!646832)))

(assert (=> b!1136706 (= res!758618 (bvsgt from!1455 i!673))))

(assert (=> b!1136706 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505437 () Unit!37224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73983 (_ BitVec 64) (_ BitVec 32)) Unit!37224)

(assert (=> b!1136706 (= lt!505437 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1136707 () Bool)

(assert (=> b!1136707 (= e!646833 e!646825)))

(declare-fun res!758623 () Bool)

(assert (=> b!1136707 (=> (not res!758623) (not e!646825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73983 (_ BitVec 32)) Bool)

(assert (=> b!1136707 (= res!758623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505434 mask!1564))))

(assert (=> b!1136707 (= lt!505434 (array!73984 (store (arr!35642 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36178 _keys!1208)))))

(declare-fun b!1136708 () Bool)

(declare-fun res!758622 () Bool)

(assert (=> b!1136708 (=> (not res!758622) (not e!646833))))

(assert (=> b!1136708 (= res!758622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136709 () Bool)

(declare-fun e!646829 () Bool)

(assert (=> b!1136709 (= e!646829 tp_is_empty!28561)))

(declare-fun b!1136710 () Bool)

(assert (=> b!1136710 (contains!6591 call!49915 k!934)))

(declare-fun lt!505433 () Unit!37224)

(assert (=> b!1136710 (= lt!505433 (addStillContains!748 lt!505425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1136710 call!49917))

(assert (=> b!1136710 (= lt!505425 (+!3487 lt!505435 (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505438 () Unit!37224)

(assert (=> b!1136710 (= lt!505438 call!49918)))

(assert (=> b!1136710 (= e!646824 lt!505433)))

(declare-fun b!1136711 () Bool)

(declare-fun Unit!37228 () Unit!37224)

(assert (=> b!1136711 (= e!646835 Unit!37228)))

(declare-fun b!1136712 () Bool)

(declare-fun res!758626 () Bool)

(assert (=> b!1136712 (=> (not res!758626) (not e!646833))))

(assert (=> b!1136712 (= res!758626 (= (select (arr!35642 _keys!1208) i!673) k!934))))

(declare-fun b!1136713 () Bool)

(declare-fun -!1212 (ListLongMap!16071 (_ BitVec 64)) ListLongMap!16071)

(assert (=> b!1136713 (= e!646837 (= call!49916 (-!1212 call!49919 k!934)))))

(declare-fun b!1136714 () Bool)

(assert (=> b!1136714 (= e!646828 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505427) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136715 () Bool)

(assert (=> b!1136715 (= e!646826 (and e!646829 mapRes!44666))))

(declare-fun condMapEmpty!44666 () Bool)

(declare-fun mapDefault!44666 () ValueCell!13571)

