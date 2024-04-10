; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98404 () Bool)

(assert start!98404)

(declare-fun b_free!24009 () Bool)

(declare-fun b_next!24009 () Bool)

(assert (=> start!98404 (= b_free!24009 (not b_next!24009))))

(declare-fun tp!84738 () Bool)

(declare-fun b_and!38867 () Bool)

(assert (=> start!98404 (= tp!84738 b_and!38867)))

(declare-fun b!1135647 () Bool)

(declare-fun e!646278 () Bool)

(declare-datatypes ((V!43179 0))(
  ( (V!43180 (val!14326 Int)) )
))
(declare-datatypes ((tuple2!18082 0))(
  ( (tuple2!18083 (_1!9052 (_ BitVec 64)) (_2!9052 V!43179)) )
))
(declare-datatypes ((List!24840 0))(
  ( (Nil!24837) (Cons!24836 (h!26045 tuple2!18082) (t!35841 List!24840)) )
))
(declare-datatypes ((ListLongMap!16051 0))(
  ( (ListLongMap!16052 (toList!8041 List!24840)) )
))
(declare-fun call!49654 () ListLongMap!16051)

(declare-fun call!49651 () ListLongMap!16051)

(assert (=> b!1135647 (= e!646278 (= call!49654 call!49651))))

(declare-fun b!1135648 () Bool)

(declare-fun res!758042 () Bool)

(declare-fun e!646280 () Bool)

(assert (=> b!1135648 (=> res!758042 e!646280)))

(declare-datatypes ((List!24841 0))(
  ( (Nil!24838) (Cons!24837 (h!26046 (_ BitVec 64)) (t!35842 List!24841)) )
))
(declare-fun contains!6573 (List!24841 (_ BitVec 64)) Bool)

(assert (=> b!1135648 (= res!758042 (contains!6573 Nil!24838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135649 () Bool)

(declare-fun res!758033 () Bool)

(assert (=> b!1135649 (=> res!758033 e!646280)))

(declare-fun noDuplicate!1599 (List!24841) Bool)

(assert (=> b!1135649 (= res!758033 (not (noDuplicate!1599 Nil!24838)))))

(declare-fun b!1135650 () Bool)

(declare-fun call!49650 () Bool)

(assert (=> b!1135650 call!49650))

(declare-datatypes ((Unit!37198 0))(
  ( (Unit!37199) )
))
(declare-fun lt!504869 () Unit!37198)

(declare-fun call!49657 () Unit!37198)

(assert (=> b!1135650 (= lt!504869 call!49657)))

(declare-fun e!646279 () Unit!37198)

(assert (=> b!1135650 (= e!646279 lt!504869)))

(declare-fun b!1135651 () Bool)

(declare-fun res!758034 () Bool)

(declare-fun e!646281 () Bool)

(assert (=> b!1135651 (=> (not res!758034) (not e!646281))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135651 (= res!758034 (validMask!0 mask!1564))))

(declare-fun b!1135652 () Bool)

(declare-fun e!646270 () Bool)

(declare-fun e!646271 () Bool)

(assert (=> b!1135652 (= e!646270 e!646271)))

(declare-fun res!758043 () Bool)

(assert (=> b!1135652 (=> res!758043 e!646271)))

(declare-fun lt!504871 () ListLongMap!16051)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6574 (ListLongMap!16051 (_ BitVec 64)) Bool)

(assert (=> b!1135652 (= res!758043 (not (contains!6574 lt!504871 k0!934)))))

(declare-fun zeroValue!944 () V!43179)

(declare-datatypes ((array!73939 0))(
  ( (array!73940 (arr!35620 (Array (_ BitVec 32) (_ BitVec 64))) (size!36156 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73939)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13560 0))(
  ( (ValueCellFull!13560 (v!16963 V!43179)) (EmptyCell!13560) )
))
(declare-datatypes ((array!73941 0))(
  ( (array!73942 (arr!35621 (Array (_ BitVec 32) ValueCell!13560)) (size!36157 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73941)

(declare-fun minValue!944 () V!43179)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4526 (array!73939 array!73941 (_ BitVec 32) (_ BitVec 32) V!43179 V!43179 (_ BitVec 32) Int) ListLongMap!16051)

(assert (=> b!1135652 (= lt!504871 (getCurrentListMapNoExtraKeys!4526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135653 () Bool)

(declare-fun e!646274 () Bool)

(declare-fun tp_is_empty!28539 () Bool)

(assert (=> b!1135653 (= e!646274 tp_is_empty!28539)))

(declare-fun lt!504861 () array!73941)

(declare-fun lt!504867 () array!73939)

(declare-fun bm!49647 () Bool)

(assert (=> bm!49647 (= call!49654 (getCurrentListMapNoExtraKeys!4526 lt!504867 lt!504861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49648 () Bool)

(declare-fun lt!504865 () ListLongMap!16051)

(declare-fun call!49653 () Unit!37198)

(declare-fun c!110973 () Bool)

(declare-fun c!110974 () Bool)

(declare-fun addStillContains!739 (ListLongMap!16051 (_ BitVec 64) V!43179 (_ BitVec 64)) Unit!37198)

(assert (=> bm!49648 (= call!49653 (addStillContains!739 (ite c!110974 lt!504865 lt!504871) (ite c!110974 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110973 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110974 minValue!944 (ite c!110973 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1135654 () Bool)

(declare-fun e!646266 () Bool)

(assert (=> b!1135654 (= e!646266 tp_is_empty!28539)))

(declare-fun b!1135655 () Bool)

(assert (=> b!1135655 (= e!646271 e!646280)))

(declare-fun res!758039 () Bool)

(assert (=> b!1135655 (=> res!758039 e!646280)))

(assert (=> b!1135655 (= res!758039 (or (bvsge (size!36156 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36156 _keys!1208)) (bvsge from!1455 (size!36156 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73939 (_ BitVec 32) List!24841) Bool)

(assert (=> b!1135655 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24838)))

(declare-fun lt!504873 () Unit!37198)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73939 (_ BitVec 32) (_ BitVec 32)) Unit!37198)

(assert (=> b!1135655 (= lt!504873 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646273 () Bool)

(assert (=> b!1135655 e!646273))

(declare-fun res!758040 () Bool)

(assert (=> b!1135655 (=> (not res!758040) (not e!646273))))

(declare-fun e!646268 () Bool)

(assert (=> b!1135655 (= res!758040 e!646268)))

(declare-fun c!110970 () Bool)

(assert (=> b!1135655 (= c!110970 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504872 () Unit!37198)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!344 (array!73939 array!73941 (_ BitVec 32) (_ BitVec 32) V!43179 V!43179 (_ BitVec 64) (_ BitVec 32) Int) Unit!37198)

(assert (=> b!1135655 (= lt!504872 (lemmaListMapContainsThenArrayContainsFrom!344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504868 () Unit!37198)

(declare-fun e!646275 () Unit!37198)

(assert (=> b!1135655 (= lt!504868 e!646275)))

(declare-fun lt!504875 () Bool)

(assert (=> b!1135655 (= c!110974 (and (not lt!504875) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135655 (= lt!504875 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1135656 () Bool)

(declare-fun arrayContainsKey!0 (array!73939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135656 (= e!646268 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135657 () Bool)

(assert (=> b!1135657 (= e!646268 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504875) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1135658 () Bool)

(declare-fun e!646276 () Bool)

(declare-fun e!646277 () Bool)

(assert (=> b!1135658 (= e!646276 (not e!646277))))

(declare-fun res!758032 () Bool)

(assert (=> b!1135658 (=> res!758032 e!646277)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135658 (= res!758032 (bvsgt from!1455 i!673))))

(assert (=> b!1135658 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504870 () Unit!37198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73939 (_ BitVec 64) (_ BitVec 32)) Unit!37198)

(assert (=> b!1135658 (= lt!504870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44633 () Bool)

(declare-fun mapRes!44633 () Bool)

(declare-fun tp!84737 () Bool)

(assert (=> mapNonEmpty!44633 (= mapRes!44633 (and tp!84737 e!646266))))

(declare-fun mapValue!44633 () ValueCell!13560)

(declare-fun mapKey!44633 () (_ BitVec 32))

(declare-fun mapRest!44633 () (Array (_ BitVec 32) ValueCell!13560))

(assert (=> mapNonEmpty!44633 (= (arr!35621 _values!996) (store mapRest!44633 mapKey!44633 mapValue!44633))))

(declare-fun bm!49649 () Bool)

(declare-fun call!49655 () Bool)

(declare-fun call!49652 () ListLongMap!16051)

(assert (=> bm!49649 (= call!49655 (contains!6574 (ite c!110974 lt!504865 call!49652) k0!934))))

(declare-fun b!1135659 () Bool)

(declare-fun e!646265 () Bool)

(assert (=> b!1135659 (= e!646265 e!646270)))

(declare-fun res!758045 () Bool)

(assert (=> b!1135659 (=> res!758045 e!646270)))

(assert (=> b!1135659 (= res!758045 (not (= (select (arr!35620 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1135659 e!646278))

(declare-fun c!110971 () Bool)

(assert (=> b!1135659 (= c!110971 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504860 () Unit!37198)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!453 (array!73939 array!73941 (_ BitVec 32) (_ BitVec 32) V!43179 V!43179 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37198)

(assert (=> b!1135659 (= lt!504860 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135660 () Bool)

(declare-fun c!110972 () Bool)

(assert (=> b!1135660 (= c!110972 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504875))))

(declare-fun e!646272 () Unit!37198)

(assert (=> b!1135660 (= e!646279 e!646272)))

(declare-fun b!1135661 () Bool)

(declare-fun lt!504876 () Unit!37198)

(assert (=> b!1135661 (= e!646272 lt!504876)))

(assert (=> b!1135661 (= lt!504876 call!49657)))

(assert (=> b!1135661 call!49650))

(declare-fun b!1135662 () Bool)

(assert (=> b!1135662 (= e!646277 e!646265)))

(declare-fun res!758037 () Bool)

(assert (=> b!1135662 (=> res!758037 e!646265)))

(assert (=> b!1135662 (= res!758037 (not (= from!1455 i!673)))))

(declare-fun lt!504864 () ListLongMap!16051)

(assert (=> b!1135662 (= lt!504864 (getCurrentListMapNoExtraKeys!4526 lt!504867 lt!504861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2587 (Int (_ BitVec 64)) V!43179)

(assert (=> b!1135662 (= lt!504861 (array!73942 (store (arr!35621 _values!996) i!673 (ValueCellFull!13560 (dynLambda!2587 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36157 _values!996)))))

(declare-fun lt!504874 () ListLongMap!16051)

(assert (=> b!1135662 (= lt!504874 (getCurrentListMapNoExtraKeys!4526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1135663 () Bool)

(assert (=> b!1135663 (= e!646281 e!646276)))

(declare-fun res!758036 () Bool)

(assert (=> b!1135663 (=> (not res!758036) (not e!646276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73939 (_ BitVec 32)) Bool)

(assert (=> b!1135663 (= res!758036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504867 mask!1564))))

(assert (=> b!1135663 (= lt!504867 (array!73940 (store (arr!35620 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36156 _keys!1208)))))

(declare-fun b!1135664 () Bool)

(declare-fun res!758044 () Bool)

(assert (=> b!1135664 (=> (not res!758044) (not e!646276))))

(assert (=> b!1135664 (= res!758044 (arrayNoDuplicates!0 lt!504867 #b00000000000000000000000000000000 Nil!24838))))

(declare-fun b!1135665 () Bool)

(declare-fun res!758028 () Bool)

(assert (=> b!1135665 (=> (not res!758028) (not e!646281))))

(assert (=> b!1135665 (= res!758028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135666 () Bool)

(declare-fun res!758030 () Bool)

(assert (=> b!1135666 (=> (not res!758030) (not e!646281))))

(assert (=> b!1135666 (= res!758030 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36156 _keys!1208))))))

(declare-fun bm!49650 () Bool)

(declare-fun call!49656 () ListLongMap!16051)

(assert (=> bm!49650 (= call!49652 call!49656)))

(declare-fun b!1135667 () Bool)

(declare-fun lt!504866 () Unit!37198)

(assert (=> b!1135667 (= e!646275 lt!504866)))

(declare-fun lt!504863 () Unit!37198)

(assert (=> b!1135667 (= lt!504863 (addStillContains!739 lt!504871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1135667 (= lt!504865 call!49656)))

(assert (=> b!1135667 call!49655))

(assert (=> b!1135667 (= lt!504866 call!49653)))

(declare-fun +!3477 (ListLongMap!16051 tuple2!18082) ListLongMap!16051)

(assert (=> b!1135667 (contains!6574 (+!3477 lt!504865 (tuple2!18083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1135668 () Bool)

(assert (=> b!1135668 (= e!646280 true)))

(declare-fun lt!504862 () Bool)

(assert (=> b!1135668 (= lt!504862 (contains!6573 Nil!24838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135669 () Bool)

(assert (=> b!1135669 (= e!646273 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49651 () Bool)

(assert (=> bm!49651 (= call!49657 call!49653)))

(declare-fun b!1135670 () Bool)

(declare-fun res!758029 () Bool)

(assert (=> b!1135670 (=> (not res!758029) (not e!646281))))

(assert (=> b!1135670 (= res!758029 (= (select (arr!35620 _keys!1208) i!673) k0!934))))

(declare-fun b!1135671 () Bool)

(assert (=> b!1135671 (= e!646275 e!646279)))

(assert (=> b!1135671 (= c!110973 (and (not lt!504875) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1135672 () Bool)

(declare-fun -!1203 (ListLongMap!16051 (_ BitVec 64)) ListLongMap!16051)

(assert (=> b!1135672 (= e!646278 (= call!49654 (-!1203 call!49651 k0!934)))))

(declare-fun res!758031 () Bool)

(assert (=> start!98404 (=> (not res!758031) (not e!646281))))

(assert (=> start!98404 (= res!758031 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36156 _keys!1208))))))

(assert (=> start!98404 e!646281))

(assert (=> start!98404 tp_is_empty!28539))

(declare-fun array_inv!27314 (array!73939) Bool)

(assert (=> start!98404 (array_inv!27314 _keys!1208)))

(assert (=> start!98404 true))

(assert (=> start!98404 tp!84738))

(declare-fun e!646269 () Bool)

(declare-fun array_inv!27315 (array!73941) Bool)

(assert (=> start!98404 (and (array_inv!27315 _values!996) e!646269)))

(declare-fun b!1135673 () Bool)

(declare-fun res!758041 () Bool)

(assert (=> b!1135673 (=> (not res!758041) (not e!646281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135673 (= res!758041 (validKeyInArray!0 k0!934))))

(declare-fun b!1135674 () Bool)

(assert (=> b!1135674 (= e!646269 (and e!646274 mapRes!44633))))

(declare-fun condMapEmpty!44633 () Bool)

(declare-fun mapDefault!44633 () ValueCell!13560)

(assert (=> b!1135674 (= condMapEmpty!44633 (= (arr!35621 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13560)) mapDefault!44633)))))

(declare-fun bm!49652 () Bool)

(assert (=> bm!49652 (= call!49650 call!49655)))

(declare-fun b!1135675 () Bool)

(declare-fun res!758035 () Bool)

(assert (=> b!1135675 (=> (not res!758035) (not e!646281))))

(assert (=> b!1135675 (= res!758035 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24838))))

(declare-fun bm!49653 () Bool)

(assert (=> bm!49653 (= call!49656 (+!3477 lt!504871 (ite (or c!110974 c!110973) (tuple2!18083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1135676 () Bool)

(declare-fun res!758038 () Bool)

(assert (=> b!1135676 (=> (not res!758038) (not e!646281))))

(assert (=> b!1135676 (= res!758038 (and (= (size!36157 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36156 _keys!1208) (size!36157 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49654 () Bool)

(assert (=> bm!49654 (= call!49651 (getCurrentListMapNoExtraKeys!4526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44633 () Bool)

(assert (=> mapIsEmpty!44633 mapRes!44633))

(declare-fun b!1135677 () Bool)

(declare-fun Unit!37200 () Unit!37198)

(assert (=> b!1135677 (= e!646272 Unit!37200)))

(assert (= (and start!98404 res!758031) b!1135651))

(assert (= (and b!1135651 res!758034) b!1135676))

(assert (= (and b!1135676 res!758038) b!1135665))

(assert (= (and b!1135665 res!758028) b!1135675))

(assert (= (and b!1135675 res!758035) b!1135666))

(assert (= (and b!1135666 res!758030) b!1135673))

(assert (= (and b!1135673 res!758041) b!1135670))

(assert (= (and b!1135670 res!758029) b!1135663))

(assert (= (and b!1135663 res!758036) b!1135664))

(assert (= (and b!1135664 res!758044) b!1135658))

(assert (= (and b!1135658 (not res!758032)) b!1135662))

(assert (= (and b!1135662 (not res!758037)) b!1135659))

(assert (= (and b!1135659 c!110971) b!1135672))

(assert (= (and b!1135659 (not c!110971)) b!1135647))

(assert (= (or b!1135672 b!1135647) bm!49647))

(assert (= (or b!1135672 b!1135647) bm!49654))

(assert (= (and b!1135659 (not res!758045)) b!1135652))

(assert (= (and b!1135652 (not res!758043)) b!1135655))

(assert (= (and b!1135655 c!110974) b!1135667))

(assert (= (and b!1135655 (not c!110974)) b!1135671))

(assert (= (and b!1135671 c!110973) b!1135650))

(assert (= (and b!1135671 (not c!110973)) b!1135660))

(assert (= (and b!1135660 c!110972) b!1135661))

(assert (= (and b!1135660 (not c!110972)) b!1135677))

(assert (= (or b!1135650 b!1135661) bm!49651))

(assert (= (or b!1135650 b!1135661) bm!49650))

(assert (= (or b!1135650 b!1135661) bm!49652))

(assert (= (or b!1135667 bm!49652) bm!49649))

(assert (= (or b!1135667 bm!49651) bm!49648))

(assert (= (or b!1135667 bm!49650) bm!49653))

(assert (= (and b!1135655 c!110970) b!1135656))

(assert (= (and b!1135655 (not c!110970)) b!1135657))

(assert (= (and b!1135655 res!758040) b!1135669))

(assert (= (and b!1135655 (not res!758039)) b!1135649))

(assert (= (and b!1135649 (not res!758033)) b!1135648))

(assert (= (and b!1135648 (not res!758042)) b!1135668))

(assert (= (and b!1135674 condMapEmpty!44633) mapIsEmpty!44633))

(assert (= (and b!1135674 (not condMapEmpty!44633)) mapNonEmpty!44633))

(get-info :version)

(assert (= (and mapNonEmpty!44633 ((_ is ValueCellFull!13560) mapValue!44633)) b!1135654))

(assert (= (and b!1135674 ((_ is ValueCellFull!13560) mapDefault!44633)) b!1135653))

(assert (= start!98404 b!1135674))

(declare-fun b_lambda!19115 () Bool)

(assert (=> (not b_lambda!19115) (not b!1135662)))

(declare-fun t!35840 () Bool)

(declare-fun tb!8821 () Bool)

(assert (=> (and start!98404 (= defaultEntry!1004 defaultEntry!1004) t!35840) tb!8821))

(declare-fun result!18207 () Bool)

(assert (=> tb!8821 (= result!18207 tp_is_empty!28539)))

(assert (=> b!1135662 t!35840))

(declare-fun b_and!38869 () Bool)

(assert (= b_and!38867 (and (=> t!35840 result!18207) b_and!38869)))

(declare-fun m!1048161 () Bool)

(assert (=> bm!49648 m!1048161))

(declare-fun m!1048163 () Bool)

(assert (=> b!1135663 m!1048163))

(declare-fun m!1048165 () Bool)

(assert (=> b!1135663 m!1048165))

(declare-fun m!1048167 () Bool)

(assert (=> b!1135664 m!1048167))

(declare-fun m!1048169 () Bool)

(assert (=> bm!49653 m!1048169))

(declare-fun m!1048171 () Bool)

(assert (=> b!1135665 m!1048171))

(declare-fun m!1048173 () Bool)

(assert (=> b!1135656 m!1048173))

(declare-fun m!1048175 () Bool)

(assert (=> start!98404 m!1048175))

(declare-fun m!1048177 () Bool)

(assert (=> start!98404 m!1048177))

(declare-fun m!1048179 () Bool)

(assert (=> b!1135667 m!1048179))

(declare-fun m!1048181 () Bool)

(assert (=> b!1135667 m!1048181))

(assert (=> b!1135667 m!1048181))

(declare-fun m!1048183 () Bool)

(assert (=> b!1135667 m!1048183))

(declare-fun m!1048185 () Bool)

(assert (=> b!1135662 m!1048185))

(declare-fun m!1048187 () Bool)

(assert (=> b!1135662 m!1048187))

(declare-fun m!1048189 () Bool)

(assert (=> b!1135662 m!1048189))

(declare-fun m!1048191 () Bool)

(assert (=> b!1135662 m!1048191))

(declare-fun m!1048193 () Bool)

(assert (=> b!1135670 m!1048193))

(declare-fun m!1048195 () Bool)

(assert (=> bm!49647 m!1048195))

(declare-fun m!1048197 () Bool)

(assert (=> b!1135659 m!1048197))

(declare-fun m!1048199 () Bool)

(assert (=> b!1135659 m!1048199))

(declare-fun m!1048201 () Bool)

(assert (=> b!1135672 m!1048201))

(declare-fun m!1048203 () Bool)

(assert (=> bm!49649 m!1048203))

(declare-fun m!1048205 () Bool)

(assert (=> mapNonEmpty!44633 m!1048205))

(declare-fun m!1048207 () Bool)

(assert (=> b!1135668 m!1048207))

(declare-fun m!1048209 () Bool)

(assert (=> bm!49654 m!1048209))

(declare-fun m!1048211 () Bool)

(assert (=> b!1135675 m!1048211))

(declare-fun m!1048213 () Bool)

(assert (=> b!1135651 m!1048213))

(declare-fun m!1048215 () Bool)

(assert (=> b!1135652 m!1048215))

(assert (=> b!1135652 m!1048209))

(declare-fun m!1048217 () Bool)

(assert (=> b!1135658 m!1048217))

(declare-fun m!1048219 () Bool)

(assert (=> b!1135658 m!1048219))

(declare-fun m!1048221 () Bool)

(assert (=> b!1135648 m!1048221))

(declare-fun m!1048223 () Bool)

(assert (=> b!1135649 m!1048223))

(assert (=> b!1135669 m!1048173))

(declare-fun m!1048225 () Bool)

(assert (=> b!1135655 m!1048225))

(declare-fun m!1048227 () Bool)

(assert (=> b!1135655 m!1048227))

(declare-fun m!1048229 () Bool)

(assert (=> b!1135655 m!1048229))

(declare-fun m!1048231 () Bool)

(assert (=> b!1135673 m!1048231))

(check-sat (not b!1135665) (not b!1135664) (not b!1135668) (not mapNonEmpty!44633) (not b!1135655) (not b!1135656) (not b!1135673) (not bm!49647) (not b!1135648) (not b!1135669) (not b!1135672) b_and!38869 (not bm!49653) (not b!1135649) (not b!1135675) (not b!1135659) (not b!1135651) (not b!1135662) (not b_lambda!19115) (not b!1135652) (not bm!49648) (not b!1135667) tp_is_empty!28539 (not start!98404) (not b!1135663) (not b_next!24009) (not bm!49654) (not bm!49649) (not b!1135658))
(check-sat b_and!38869 (not b_next!24009))
