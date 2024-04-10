; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98438 () Bool)

(assert start!98438)

(declare-fun b_free!24043 () Bool)

(declare-fun b_next!24043 () Bool)

(assert (=> start!98438 (= b_free!24043 (not b_next!24043))))

(declare-fun tp!84840 () Bool)

(declare-fun b_and!38935 () Bool)

(assert (=> start!98438 (= tp!84840 b_and!38935)))

(declare-datatypes ((V!43225 0))(
  ( (V!43226 (val!14343 Int)) )
))
(declare-fun zeroValue!944 () V!43225)

(declare-datatypes ((tuple2!18114 0))(
  ( (tuple2!18115 (_1!9068 (_ BitVec 64)) (_2!9068 V!43225)) )
))
(declare-datatypes ((List!24872 0))(
  ( (Nil!24869) (Cons!24868 (h!26077 tuple2!18114) (t!35907 List!24872)) )
))
(declare-datatypes ((ListLongMap!16083 0))(
  ( (ListLongMap!16084 (toList!8057 List!24872)) )
))
(declare-fun call!50059 () ListLongMap!16083)

(declare-fun lt!505755 () ListLongMap!16083)

(declare-fun c!111250 () Bool)

(declare-fun lt!505758 () ListLongMap!16083)

(declare-fun bm!50055 () Bool)

(declare-fun c!111245 () Bool)

(declare-fun minValue!944 () V!43225)

(declare-fun +!3492 (ListLongMap!16083 tuple2!18114) ListLongMap!16083)

(assert (=> bm!50055 (= call!50059 (+!3492 (ite c!111250 lt!505755 lt!505758) (ite c!111250 (tuple2!18115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111245 (tuple2!18115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1137222 () Bool)

(declare-fun call!50063 () Bool)

(assert (=> b!1137222 call!50063))

(declare-datatypes ((Unit!37249 0))(
  ( (Unit!37250) )
))
(declare-fun lt!505757 () Unit!37249)

(declare-fun call!50061 () Unit!37249)

(assert (=> b!1137222 (= lt!505757 call!50061)))

(declare-fun e!647120 () Unit!37249)

(assert (=> b!1137222 (= e!647120 lt!505757)))

(declare-fun b!1137223 () Bool)

(declare-fun e!647118 () Bool)

(declare-fun e!647116 () Bool)

(assert (=> b!1137223 (= e!647118 e!647116)))

(declare-fun res!758869 () Bool)

(assert (=> b!1137223 (=> res!758869 e!647116)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137223 (= res!758869 (not (= from!1455 i!673)))))

(declare-datatypes ((ValueCell!13577 0))(
  ( (ValueCellFull!13577 (v!16980 V!43225)) (EmptyCell!13577) )
))
(declare-datatypes ((array!74007 0))(
  ( (array!74008 (arr!35654 (Array (_ BitVec 32) ValueCell!13577)) (size!36190 (_ BitVec 32))) )
))
(declare-fun lt!505762 () array!74007)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!74009 0))(
  ( (array!74010 (arr!35655 (Array (_ BitVec 32) (_ BitVec 64))) (size!36191 (_ BitVec 32))) )
))
(declare-fun lt!505751 () array!74009)

(declare-fun lt!505763 () ListLongMap!16083)

(declare-fun getCurrentListMapNoExtraKeys!4541 (array!74009 array!74007 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 32) Int) ListLongMap!16083)

(assert (=> b!1137223 (= lt!505763 (getCurrentListMapNoExtraKeys!4541 lt!505751 lt!505762 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74007)

(declare-fun dynLambda!2597 (Int (_ BitVec 64)) V!43225)

(assert (=> b!1137223 (= lt!505762 (array!74008 (store (arr!35654 _values!996) i!673 (ValueCellFull!13577 (dynLambda!2597 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36190 _values!996)))))

(declare-fun _keys!1208 () array!74009)

(declare-fun lt!505754 () ListLongMap!16083)

(assert (=> b!1137223 (= lt!505754 (getCurrentListMapNoExtraKeys!4541 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137224 () Bool)

(declare-fun e!647127 () Unit!37249)

(declare-fun Unit!37251 () Unit!37249)

(assert (=> b!1137224 (= e!647127 Unit!37251)))

(declare-fun lt!505759 () Bool)

(assert (=> b!1137224 (= lt!505759 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137224 (= c!111250 (and (not lt!505759) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505748 () Unit!37249)

(declare-fun e!647112 () Unit!37249)

(assert (=> b!1137224 (= lt!505748 e!647112)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!505756 () Unit!37249)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!356 (array!74009 array!74007 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 64) (_ BitVec 32) Int) Unit!37249)

(assert (=> b!1137224 (= lt!505756 (lemmaListMapContainsThenArrayContainsFrom!356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111248 () Bool)

(assert (=> b!1137224 (= c!111248 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758871 () Bool)

(declare-fun e!647121 () Bool)

(assert (=> b!1137224 (= res!758871 e!647121)))

(declare-fun e!647114 () Bool)

(assert (=> b!1137224 (=> (not res!758871) (not e!647114))))

(assert (=> b!1137224 e!647114))

(declare-fun lt!505764 () Unit!37249)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74009 (_ BitVec 32) (_ BitVec 32)) Unit!37249)

(assert (=> b!1137224 (= lt!505764 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24873 0))(
  ( (Nil!24870) (Cons!24869 (h!26078 (_ BitVec 64)) (t!35908 List!24873)) )
))
(declare-fun arrayNoDuplicates!0 (array!74009 (_ BitVec 32) List!24873) Bool)

(assert (=> b!1137224 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24870)))

(declare-fun lt!505749 () Unit!37249)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74009 (_ BitVec 64) (_ BitVec 32) List!24873) Unit!37249)

(assert (=> b!1137224 (= lt!505749 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24870))))

(assert (=> b!1137224 false))

(declare-fun b!1137225 () Bool)

(declare-fun res!758870 () Bool)

(declare-fun e!647126 () Bool)

(assert (=> b!1137225 (=> (not res!758870) (not e!647126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137225 (= res!758870 (validMask!0 mask!1564))))

(declare-fun bm!50056 () Bool)

(declare-fun call!50065 () ListLongMap!16083)

(assert (=> bm!50056 (= call!50065 (getCurrentListMapNoExtraKeys!4541 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44684 () Bool)

(declare-fun mapRes!44684 () Bool)

(assert (=> mapIsEmpty!44684 mapRes!44684))

(declare-fun res!758872 () Bool)

(assert (=> start!98438 (=> (not res!758872) (not e!647126))))

(assert (=> start!98438 (= res!758872 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36191 _keys!1208))))))

(assert (=> start!98438 e!647126))

(declare-fun tp_is_empty!28573 () Bool)

(assert (=> start!98438 tp_is_empty!28573))

(declare-fun array_inv!27338 (array!74009) Bool)

(assert (=> start!98438 (array_inv!27338 _keys!1208)))

(assert (=> start!98438 true))

(assert (=> start!98438 tp!84840))

(declare-fun e!647117 () Bool)

(declare-fun array_inv!27339 (array!74007) Bool)

(assert (=> start!98438 (and (array_inv!27339 _values!996) e!647117)))

(declare-fun b!1137226 () Bool)

(declare-fun e!647122 () Unit!37249)

(assert (=> b!1137226 (= e!647122 e!647120)))

(declare-fun c!111249 () Bool)

(assert (=> b!1137226 (= c!111249 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505759))))

(declare-fun b!1137227 () Bool)

(declare-fun contains!6595 (ListLongMap!16083 (_ BitVec 64)) Bool)

(assert (=> b!1137227 (contains!6595 call!50059 k!934)))

(declare-fun lt!505753 () Unit!37249)

(declare-fun addStillContains!752 (ListLongMap!16083 (_ BitVec 64) V!43225 (_ BitVec 64)) Unit!37249)

(assert (=> b!1137227 (= lt!505753 (addStillContains!752 lt!505755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!50064 () Bool)

(assert (=> b!1137227 call!50064))

(assert (=> b!1137227 (= lt!505755 (+!3492 lt!505758 (tuple2!18115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505760 () Unit!37249)

(declare-fun call!50062 () Unit!37249)

(assert (=> b!1137227 (= lt!505760 call!50062)))

(assert (=> b!1137227 (= e!647112 lt!505753)))

(declare-fun b!1137228 () Bool)

(declare-fun res!758867 () Bool)

(declare-fun e!647123 () Bool)

(assert (=> b!1137228 (=> (not res!758867) (not e!647123))))

(assert (=> b!1137228 (= res!758867 (arrayNoDuplicates!0 lt!505751 #b00000000000000000000000000000000 Nil!24870))))

(declare-fun bm!50057 () Bool)

(assert (=> bm!50057 (= call!50063 call!50064)))

(declare-fun call!50060 () ListLongMap!16083)

(declare-fun bm!50058 () Bool)

(assert (=> bm!50058 (= call!50060 (getCurrentListMapNoExtraKeys!4541 lt!505751 lt!505762 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137229 () Bool)

(declare-fun res!758868 () Bool)

(assert (=> b!1137229 (=> (not res!758868) (not e!647126))))

(assert (=> b!1137229 (= res!758868 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36191 _keys!1208))))))

(declare-fun mapNonEmpty!44684 () Bool)

(declare-fun tp!84839 () Bool)

(declare-fun e!647125 () Bool)

(assert (=> mapNonEmpty!44684 (= mapRes!44684 (and tp!84839 e!647125))))

(declare-fun mapKey!44684 () (_ BitVec 32))

(declare-fun mapRest!44684 () (Array (_ BitVec 32) ValueCell!13577))

(declare-fun mapValue!44684 () ValueCell!13577)

(assert (=> mapNonEmpty!44684 (= (arr!35654 _values!996) (store mapRest!44684 mapKey!44684 mapValue!44684))))

(declare-fun b!1137230 () Bool)

(declare-fun e!647113 () Bool)

(assert (=> b!1137230 (= e!647113 true)))

(declare-fun lt!505750 () Unit!37249)

(assert (=> b!1137230 (= lt!505750 e!647127)))

(declare-fun c!111247 () Bool)

(assert (=> b!1137230 (= c!111247 (contains!6595 lt!505758 k!934))))

(assert (=> b!1137230 (= lt!505758 (getCurrentListMapNoExtraKeys!4541 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50059 () Bool)

(assert (=> bm!50059 (= call!50061 call!50062)))

(declare-fun b!1137231 () Bool)

(assert (=> b!1137231 (= e!647125 tp_is_empty!28573)))

(declare-fun b!1137232 () Bool)

(assert (=> b!1137232 (= e!647116 e!647113)))

(declare-fun res!758875 () Bool)

(assert (=> b!1137232 (=> res!758875 e!647113)))

(assert (=> b!1137232 (= res!758875 (not (= (select (arr!35655 _keys!1208) from!1455) k!934)))))

(declare-fun e!647119 () Bool)

(assert (=> b!1137232 e!647119))

(declare-fun c!111246 () Bool)

(assert (=> b!1137232 (= c!111246 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505752 () Unit!37249)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!461 (array!74009 array!74007 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37249)

(assert (=> b!1137232 (= lt!505752 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137233 () Bool)

(declare-fun arrayContainsKey!0 (array!74009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137233 (= e!647114 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137234 () Bool)

(declare-fun res!758878 () Bool)

(assert (=> b!1137234 (=> (not res!758878) (not e!647126))))

(assert (=> b!1137234 (= res!758878 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24870))))

(declare-fun b!1137235 () Bool)

(declare-fun -!1215 (ListLongMap!16083 (_ BitVec 64)) ListLongMap!16083)

(assert (=> b!1137235 (= e!647119 (= call!50060 (-!1215 call!50065 k!934)))))

(declare-fun bm!50060 () Bool)

(declare-fun call!50058 () ListLongMap!16083)

(assert (=> bm!50060 (= call!50058 call!50059)))

(declare-fun b!1137236 () Bool)

(declare-fun res!758877 () Bool)

(assert (=> b!1137236 (=> (not res!758877) (not e!647126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74009 (_ BitVec 32)) Bool)

(assert (=> b!1137236 (= res!758877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137237 () Bool)

(assert (=> b!1137237 (= e!647121 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50061 () Bool)

(assert (=> bm!50061 (= call!50062 (addStillContains!752 lt!505758 (ite (or c!111250 c!111245) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111250 c!111245) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1137238 () Bool)

(declare-fun res!758879 () Bool)

(assert (=> b!1137238 (=> (not res!758879) (not e!647126))))

(assert (=> b!1137238 (= res!758879 (= (select (arr!35655 _keys!1208) i!673) k!934))))

(declare-fun bm!50062 () Bool)

(assert (=> bm!50062 (= call!50064 (contains!6595 (ite c!111250 lt!505755 call!50058) k!934))))

(declare-fun b!1137239 () Bool)

(assert (=> b!1137239 (= e!647119 (= call!50060 call!50065))))

(declare-fun b!1137240 () Bool)

(assert (=> b!1137240 (= e!647121 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505759) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137241 () Bool)

(assert (=> b!1137241 (= e!647123 (not e!647118))))

(declare-fun res!758876 () Bool)

(assert (=> b!1137241 (=> res!758876 e!647118)))

(assert (=> b!1137241 (= res!758876 (bvsgt from!1455 i!673))))

(assert (=> b!1137241 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505761 () Unit!37249)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74009 (_ BitVec 64) (_ BitVec 32)) Unit!37249)

(assert (=> b!1137241 (= lt!505761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1137242 () Bool)

(declare-fun res!758874 () Bool)

(assert (=> b!1137242 (=> (not res!758874) (not e!647126))))

(assert (=> b!1137242 (= res!758874 (and (= (size!36190 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36191 _keys!1208) (size!36190 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137243 () Bool)

(declare-fun Unit!37252 () Unit!37249)

(assert (=> b!1137243 (= e!647120 Unit!37252)))

(declare-fun b!1137244 () Bool)

(declare-fun e!647124 () Bool)

(assert (=> b!1137244 (= e!647117 (and e!647124 mapRes!44684))))

(declare-fun condMapEmpty!44684 () Bool)

(declare-fun mapDefault!44684 () ValueCell!13577)

