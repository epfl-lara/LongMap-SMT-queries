; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98644 () Bool)

(assert start!98644)

(declare-fun b_free!24013 () Bool)

(declare-fun b_next!24013 () Bool)

(assert (=> start!98644 (= b_free!24013 (not b_next!24013))))

(declare-fun tp!84749 () Bool)

(declare-fun b_and!38877 () Bool)

(assert (=> start!98644 (= tp!84749 b_and!38877)))

(declare-fun b!1137126 () Bool)

(declare-fun res!758652 () Bool)

(declare-fun e!647214 () Bool)

(assert (=> b!1137126 (=> res!758652 e!647214)))

(declare-datatypes ((List!24861 0))(
  ( (Nil!24858) (Cons!24857 (h!26075 (_ BitVec 64)) (t!35858 List!24861)) )
))
(declare-fun contains!6597 (List!24861 (_ BitVec 64)) Bool)

(assert (=> b!1137126 (= res!758652 (contains!6597 Nil!24858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1137127 () Bool)

(declare-fun call!49768 () Bool)

(assert (=> b!1137127 call!49768))

(declare-datatypes ((Unit!37174 0))(
  ( (Unit!37175) )
))
(declare-fun lt!505449 () Unit!37174)

(declare-fun call!49763 () Unit!37174)

(assert (=> b!1137127 (= lt!505449 call!49763)))

(declare-fun e!647211 () Unit!37174)

(assert (=> b!1137127 (= e!647211 lt!505449)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1137128 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!505462 () Bool)

(declare-fun e!647210 () Bool)

(assert (=> b!1137128 (= e!647210 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505462) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137129 () Bool)

(declare-fun res!758656 () Bool)

(declare-fun e!647208 () Bool)

(assert (=> b!1137129 (=> (not res!758656) (not e!647208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137129 (= res!758656 (validKeyInArray!0 k0!934))))

(declare-fun b!1137130 () Bool)

(declare-fun e!647203 () Bool)

(declare-fun tp_is_empty!28543 () Bool)

(assert (=> b!1137130 (= e!647203 tp_is_empty!28543)))

(declare-fun bm!49760 () Bool)

(declare-datatypes ((V!43185 0))(
  ( (V!43186 (val!14328 Int)) )
))
(declare-datatypes ((tuple2!18096 0))(
  ( (tuple2!18097 (_1!9059 (_ BitVec 64)) (_2!9059 V!43185)) )
))
(declare-datatypes ((List!24862 0))(
  ( (Nil!24859) (Cons!24858 (h!26076 tuple2!18096) (t!35859 List!24862)) )
))
(declare-datatypes ((ListLongMap!16073 0))(
  ( (ListLongMap!16074 (toList!8052 List!24862)) )
))
(declare-fun call!49766 () ListLongMap!16073)

(declare-fun call!49764 () ListLongMap!16073)

(assert (=> bm!49760 (= call!49766 call!49764)))

(declare-fun b!1137131 () Bool)

(declare-fun res!758647 () Bool)

(assert (=> b!1137131 (=> res!758647 e!647214)))

(declare-fun noDuplicate!1615 (List!24861) Bool)

(assert (=> b!1137131 (= res!758647 (not (noDuplicate!1615 Nil!24858)))))

(declare-datatypes ((array!73989 0))(
  ( (array!73990 (arr!35639 (Array (_ BitVec 32) (_ BitVec 64))) (size!36176 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73989)

(declare-fun b!1137132 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!73989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137132 (= e!647210 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137133 () Bool)

(declare-fun res!758651 () Bool)

(assert (=> b!1137133 (=> (not res!758651) (not e!647208))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137133 (= res!758651 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36176 _keys!1208))))))

(declare-fun mapNonEmpty!44639 () Bool)

(declare-fun mapRes!44639 () Bool)

(declare-fun tp!84750 () Bool)

(declare-fun e!647205 () Bool)

(assert (=> mapNonEmpty!44639 (= mapRes!44639 (and tp!84750 e!647205))))

(declare-datatypes ((ValueCell!13562 0))(
  ( (ValueCellFull!13562 (v!16961 V!43185)) (EmptyCell!13562) )
))
(declare-fun mapValue!44639 () ValueCell!13562)

(declare-fun mapKey!44639 () (_ BitVec 32))

(declare-datatypes ((array!73991 0))(
  ( (array!73992 (arr!35640 (Array (_ BitVec 32) ValueCell!13562)) (size!36177 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73991)

(declare-fun mapRest!44639 () (Array (_ BitVec 32) ValueCell!13562))

(assert (=> mapNonEmpty!44639 (= (arr!35640 _values!996) (store mapRest!44639 mapKey!44639 mapValue!44639))))

(declare-fun b!1137135 () Bool)

(declare-fun c!111400 () Bool)

(assert (=> b!1137135 (= c!111400 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505462))))

(declare-fun e!647206 () Unit!37174)

(assert (=> b!1137135 (= e!647211 e!647206)))

(declare-fun b!1137136 () Bool)

(declare-fun e!647200 () Bool)

(assert (=> b!1137136 (= e!647200 (and e!647203 mapRes!44639))))

(declare-fun condMapEmpty!44639 () Bool)

(declare-fun mapDefault!44639 () ValueCell!13562)

(assert (=> b!1137136 (= condMapEmpty!44639 (= (arr!35640 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13562)) mapDefault!44639)))))

(declare-fun b!1137137 () Bool)

(declare-fun Unit!37176 () Unit!37174)

(assert (=> b!1137137 (= e!647206 Unit!37176)))

(declare-fun zeroValue!944 () V!43185)

(declare-fun lt!505460 () ListLongMap!16073)

(declare-fun bm!49761 () Bool)

(declare-fun lt!505450 () ListLongMap!16073)

(declare-fun c!111398 () Bool)

(declare-fun minValue!944 () V!43185)

(declare-fun c!111401 () Bool)

(declare-fun +!3507 (ListLongMap!16073 tuple2!18096) ListLongMap!16073)

(assert (=> bm!49761 (= call!49764 (+!3507 (ite c!111401 lt!505460 lt!505450) (ite c!111401 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111398 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!49762 () Bool)

(declare-fun call!49765 () Unit!37174)

(assert (=> bm!49762 (= call!49763 call!49765)))

(declare-fun call!49770 () ListLongMap!16073)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!49763 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4563 (array!73989 array!73991 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 32) Int) ListLongMap!16073)

(assert (=> bm!49763 (= call!49770 (getCurrentListMapNoExtraKeys!4563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137138 () Bool)

(declare-fun lt!505456 () Unit!37174)

(assert (=> b!1137138 (= e!647206 lt!505456)))

(assert (=> b!1137138 (= lt!505456 call!49763)))

(assert (=> b!1137138 call!49768))

(declare-fun mapIsEmpty!44639 () Bool)

(assert (=> mapIsEmpty!44639 mapRes!44639))

(declare-fun call!49769 () ListLongMap!16073)

(declare-fun lt!505451 () array!73991)

(declare-fun lt!505455 () array!73989)

(declare-fun bm!49764 () Bool)

(assert (=> bm!49764 (= call!49769 (getCurrentListMapNoExtraKeys!4563 lt!505455 lt!505451 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!49767 () Bool)

(declare-fun bm!49765 () Bool)

(declare-fun contains!6598 (ListLongMap!16073 (_ BitVec 64)) Bool)

(assert (=> bm!49765 (= call!49767 (contains!6598 (ite c!111401 lt!505460 call!49766) k0!934))))

(declare-fun b!1137139 () Bool)

(declare-fun e!647207 () Bool)

(assert (=> b!1137139 (= e!647207 (= call!49769 call!49770))))

(declare-fun b!1137140 () Bool)

(declare-fun res!758660 () Bool)

(assert (=> b!1137140 (=> (not res!758660) (not e!647208))))

(assert (=> b!1137140 (= res!758660 (and (= (size!36177 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36176 _keys!1208) (size!36177 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137141 () Bool)

(declare-fun res!758655 () Bool)

(declare-fun e!647209 () Bool)

(assert (=> b!1137141 (=> (not res!758655) (not e!647209))))

(declare-fun arrayNoDuplicates!0 (array!73989 (_ BitVec 32) List!24861) Bool)

(assert (=> b!1137141 (= res!758655 (arrayNoDuplicates!0 lt!505455 #b00000000000000000000000000000000 Nil!24858))))

(declare-fun b!1137142 () Bool)

(assert (=> b!1137142 (= e!647205 tp_is_empty!28543)))

(declare-fun b!1137143 () Bool)

(declare-fun e!647212 () Unit!37174)

(declare-fun lt!505461 () Unit!37174)

(assert (=> b!1137143 (= e!647212 lt!505461)))

(declare-fun lt!505446 () Unit!37174)

(declare-fun addStillContains!733 (ListLongMap!16073 (_ BitVec 64) V!43185 (_ BitVec 64)) Unit!37174)

(assert (=> b!1137143 (= lt!505446 (addStillContains!733 lt!505450 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1137143 (= lt!505460 (+!3507 lt!505450 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1137143 call!49767))

(assert (=> b!1137143 (= lt!505461 call!49765)))

(assert (=> b!1137143 (contains!6598 call!49764 k0!934)))

(declare-fun b!1137144 () Bool)

(declare-fun e!647201 () Bool)

(assert (=> b!1137144 (= e!647201 e!647214)))

(declare-fun res!758646 () Bool)

(assert (=> b!1137144 (=> res!758646 e!647214)))

(assert (=> b!1137144 (= res!758646 (or (bvsge (size!36176 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36176 _keys!1208)) (bvsge from!1455 (size!36176 _keys!1208))))))

(assert (=> b!1137144 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24858)))

(declare-fun lt!505458 () Unit!37174)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73989 (_ BitVec 32) (_ BitVec 32)) Unit!37174)

(assert (=> b!1137144 (= lt!505458 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!647202 () Bool)

(assert (=> b!1137144 e!647202))

(declare-fun res!758648 () Bool)

(assert (=> b!1137144 (=> (not res!758648) (not e!647202))))

(assert (=> b!1137144 (= res!758648 e!647210)))

(declare-fun c!111402 () Bool)

(assert (=> b!1137144 (= c!111402 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505452 () Unit!37174)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!342 (array!73989 array!73991 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 64) (_ BitVec 32) Int) Unit!37174)

(assert (=> b!1137144 (= lt!505452 (lemmaListMapContainsThenArrayContainsFrom!342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505457 () Unit!37174)

(assert (=> b!1137144 (= lt!505457 e!647212)))

(assert (=> b!1137144 (= c!111401 (and (not lt!505462) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1137144 (= lt!505462 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1137145 () Bool)

(declare-fun res!758649 () Bool)

(assert (=> b!1137145 (=> (not res!758649) (not e!647208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137145 (= res!758649 (validMask!0 mask!1564))))

(declare-fun b!1137146 () Bool)

(declare-fun res!758645 () Bool)

(assert (=> b!1137146 (=> (not res!758645) (not e!647208))))

(assert (=> b!1137146 (= res!758645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24858))))

(declare-fun b!1137147 () Bool)

(declare-fun e!647215 () Bool)

(assert (=> b!1137147 (= e!647215 e!647201)))

(declare-fun res!758653 () Bool)

(assert (=> b!1137147 (=> res!758653 e!647201)))

(assert (=> b!1137147 (= res!758653 (not (contains!6598 lt!505450 k0!934)))))

(assert (=> b!1137147 (= lt!505450 (getCurrentListMapNoExtraKeys!4563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137148 () Bool)

(assert (=> b!1137148 (= e!647214 true)))

(declare-fun lt!505454 () Bool)

(assert (=> b!1137148 (= lt!505454 (contains!6597 Nil!24858 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1137149 () Bool)

(declare-fun e!647204 () Bool)

(assert (=> b!1137149 (= e!647204 e!647215)))

(declare-fun res!758650 () Bool)

(assert (=> b!1137149 (=> res!758650 e!647215)))

(assert (=> b!1137149 (= res!758650 (not (= (select (arr!35639 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137149 e!647207))

(declare-fun c!111399 () Bool)

(assert (=> b!1137149 (= c!111399 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505448 () Unit!37174)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!454 (array!73989 array!73991 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37174)

(assert (=> b!1137149 (= lt!505448 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137150 () Bool)

(declare-fun e!647199 () Bool)

(assert (=> b!1137150 (= e!647209 (not e!647199))))

(declare-fun res!758654 () Bool)

(assert (=> b!1137150 (=> res!758654 e!647199)))

(assert (=> b!1137150 (= res!758654 (bvsgt from!1455 i!673))))

(assert (=> b!1137150 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505459 () Unit!37174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73989 (_ BitVec 64) (_ BitVec 32)) Unit!37174)

(assert (=> b!1137150 (= lt!505459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137151 () Bool)

(declare-fun res!758644 () Bool)

(assert (=> b!1137151 (=> (not res!758644) (not e!647208))))

(assert (=> b!1137151 (= res!758644 (= (select (arr!35639 _keys!1208) i!673) k0!934))))

(declare-fun b!1137152 () Bool)

(declare-fun -!1198 (ListLongMap!16073 (_ BitVec 64)) ListLongMap!16073)

(assert (=> b!1137152 (= e!647207 (= call!49769 (-!1198 call!49770 k0!934)))))

(declare-fun bm!49766 () Bool)

(assert (=> bm!49766 (= call!49768 call!49767)))

(declare-fun b!1137153 () Bool)

(assert (=> b!1137153 (= e!647208 e!647209)))

(declare-fun res!758661 () Bool)

(assert (=> b!1137153 (=> (not res!758661) (not e!647209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73989 (_ BitVec 32)) Bool)

(assert (=> b!1137153 (= res!758661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505455 mask!1564))))

(assert (=> b!1137153 (= lt!505455 (array!73990 (store (arr!35639 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36176 _keys!1208)))))

(declare-fun b!1137154 () Bool)

(assert (=> b!1137154 (= e!647202 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137155 () Bool)

(assert (=> b!1137155 (= e!647212 e!647211)))

(assert (=> b!1137155 (= c!111398 (and (not lt!505462) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1137156 () Bool)

(assert (=> b!1137156 (= e!647199 e!647204)))

(declare-fun res!758659 () Bool)

(assert (=> b!1137156 (=> res!758659 e!647204)))

(assert (=> b!1137156 (= res!758659 (not (= from!1455 i!673)))))

(declare-fun lt!505453 () ListLongMap!16073)

(assert (=> b!1137156 (= lt!505453 (getCurrentListMapNoExtraKeys!4563 lt!505455 lt!505451 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2615 (Int (_ BitVec 64)) V!43185)

(assert (=> b!1137156 (= lt!505451 (array!73992 (store (arr!35640 _values!996) i!673 (ValueCellFull!13562 (dynLambda!2615 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36177 _values!996)))))

(declare-fun lt!505447 () ListLongMap!16073)

(assert (=> b!1137156 (= lt!505447 (getCurrentListMapNoExtraKeys!4563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49767 () Bool)

(assert (=> bm!49767 (= call!49765 (addStillContains!733 (ite c!111401 lt!505460 lt!505450) (ite c!111401 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111398 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111401 minValue!944 (ite c!111398 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1137134 () Bool)

(declare-fun res!758657 () Bool)

(assert (=> b!1137134 (=> (not res!758657) (not e!647208))))

(assert (=> b!1137134 (= res!758657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!758658 () Bool)

(assert (=> start!98644 (=> (not res!758658) (not e!647208))))

(assert (=> start!98644 (= res!758658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36176 _keys!1208))))))

(assert (=> start!98644 e!647208))

(assert (=> start!98644 tp_is_empty!28543))

(declare-fun array_inv!27378 (array!73989) Bool)

(assert (=> start!98644 (array_inv!27378 _keys!1208)))

(assert (=> start!98644 true))

(assert (=> start!98644 tp!84749))

(declare-fun array_inv!27379 (array!73991) Bool)

(assert (=> start!98644 (and (array_inv!27379 _values!996) e!647200)))

(assert (= (and start!98644 res!758658) b!1137145))

(assert (= (and b!1137145 res!758649) b!1137140))

(assert (= (and b!1137140 res!758660) b!1137134))

(assert (= (and b!1137134 res!758657) b!1137146))

(assert (= (and b!1137146 res!758645) b!1137133))

(assert (= (and b!1137133 res!758651) b!1137129))

(assert (= (and b!1137129 res!758656) b!1137151))

(assert (= (and b!1137151 res!758644) b!1137153))

(assert (= (and b!1137153 res!758661) b!1137141))

(assert (= (and b!1137141 res!758655) b!1137150))

(assert (= (and b!1137150 (not res!758654)) b!1137156))

(assert (= (and b!1137156 (not res!758659)) b!1137149))

(assert (= (and b!1137149 c!111399) b!1137152))

(assert (= (and b!1137149 (not c!111399)) b!1137139))

(assert (= (or b!1137152 b!1137139) bm!49764))

(assert (= (or b!1137152 b!1137139) bm!49763))

(assert (= (and b!1137149 (not res!758650)) b!1137147))

(assert (= (and b!1137147 (not res!758653)) b!1137144))

(assert (= (and b!1137144 c!111401) b!1137143))

(assert (= (and b!1137144 (not c!111401)) b!1137155))

(assert (= (and b!1137155 c!111398) b!1137127))

(assert (= (and b!1137155 (not c!111398)) b!1137135))

(assert (= (and b!1137135 c!111400) b!1137138))

(assert (= (and b!1137135 (not c!111400)) b!1137137))

(assert (= (or b!1137127 b!1137138) bm!49762))

(assert (= (or b!1137127 b!1137138) bm!49760))

(assert (= (or b!1137127 b!1137138) bm!49766))

(assert (= (or b!1137143 bm!49766) bm!49765))

(assert (= (or b!1137143 bm!49762) bm!49767))

(assert (= (or b!1137143 bm!49760) bm!49761))

(assert (= (and b!1137144 c!111402) b!1137132))

(assert (= (and b!1137144 (not c!111402)) b!1137128))

(assert (= (and b!1137144 res!758648) b!1137154))

(assert (= (and b!1137144 (not res!758646)) b!1137131))

(assert (= (and b!1137131 (not res!758647)) b!1137126))

(assert (= (and b!1137126 (not res!758652)) b!1137148))

(assert (= (and b!1137136 condMapEmpty!44639) mapIsEmpty!44639))

(assert (= (and b!1137136 (not condMapEmpty!44639)) mapNonEmpty!44639))

(get-info :version)

(assert (= (and mapNonEmpty!44639 ((_ is ValueCellFull!13562) mapValue!44639)) b!1137142))

(assert (= (and b!1137136 ((_ is ValueCellFull!13562) mapDefault!44639)) b!1137130))

(assert (= start!98644 b!1137136))

(declare-fun b_lambda!19113 () Bool)

(assert (=> (not b_lambda!19113) (not b!1137156)))

(declare-fun t!35857 () Bool)

(declare-fun tb!8817 () Bool)

(assert (=> (and start!98644 (= defaultEntry!1004 defaultEntry!1004) t!35857) tb!8817))

(declare-fun result!18207 () Bool)

(assert (=> tb!8817 (= result!18207 tp_is_empty!28543)))

(assert (=> b!1137156 t!35857))

(declare-fun b_and!38879 () Bool)

(assert (= b_and!38877 (and (=> t!35857 result!18207) b_and!38879)))

(declare-fun m!1049883 () Bool)

(assert (=> b!1137134 m!1049883))

(declare-fun m!1049885 () Bool)

(assert (=> b!1137147 m!1049885))

(declare-fun m!1049887 () Bool)

(assert (=> b!1137147 m!1049887))

(declare-fun m!1049889 () Bool)

(assert (=> bm!49764 m!1049889))

(declare-fun m!1049891 () Bool)

(assert (=> b!1137143 m!1049891))

(declare-fun m!1049893 () Bool)

(assert (=> b!1137143 m!1049893))

(declare-fun m!1049895 () Bool)

(assert (=> b!1137143 m!1049895))

(declare-fun m!1049897 () Bool)

(assert (=> b!1137126 m!1049897))

(declare-fun m!1049899 () Bool)

(assert (=> b!1137129 m!1049899))

(declare-fun m!1049901 () Bool)

(assert (=> b!1137131 m!1049901))

(declare-fun m!1049903 () Bool)

(assert (=> bm!49761 m!1049903))

(declare-fun m!1049905 () Bool)

(assert (=> b!1137153 m!1049905))

(declare-fun m!1049907 () Bool)

(assert (=> b!1137153 m!1049907))

(assert (=> bm!49763 m!1049887))

(declare-fun m!1049909 () Bool)

(assert (=> b!1137154 m!1049909))

(declare-fun m!1049911 () Bool)

(assert (=> mapNonEmpty!44639 m!1049911))

(declare-fun m!1049913 () Bool)

(assert (=> b!1137152 m!1049913))

(declare-fun m!1049915 () Bool)

(assert (=> b!1137156 m!1049915))

(declare-fun m!1049917 () Bool)

(assert (=> b!1137156 m!1049917))

(declare-fun m!1049919 () Bool)

(assert (=> b!1137156 m!1049919))

(declare-fun m!1049921 () Bool)

(assert (=> b!1137156 m!1049921))

(declare-fun m!1049923 () Bool)

(assert (=> bm!49765 m!1049923))

(declare-fun m!1049925 () Bool)

(assert (=> b!1137145 m!1049925))

(declare-fun m!1049927 () Bool)

(assert (=> b!1137149 m!1049927))

(declare-fun m!1049929 () Bool)

(assert (=> b!1137149 m!1049929))

(declare-fun m!1049931 () Bool)

(assert (=> start!98644 m!1049931))

(declare-fun m!1049933 () Bool)

(assert (=> start!98644 m!1049933))

(declare-fun m!1049935 () Bool)

(assert (=> b!1137146 m!1049935))

(declare-fun m!1049937 () Bool)

(assert (=> b!1137150 m!1049937))

(declare-fun m!1049939 () Bool)

(assert (=> b!1137150 m!1049939))

(declare-fun m!1049941 () Bool)

(assert (=> bm!49767 m!1049941))

(declare-fun m!1049943 () Bool)

(assert (=> b!1137151 m!1049943))

(declare-fun m!1049945 () Bool)

(assert (=> b!1137148 m!1049945))

(declare-fun m!1049947 () Bool)

(assert (=> b!1137141 m!1049947))

(declare-fun m!1049949 () Bool)

(assert (=> b!1137144 m!1049949))

(declare-fun m!1049951 () Bool)

(assert (=> b!1137144 m!1049951))

(declare-fun m!1049953 () Bool)

(assert (=> b!1137144 m!1049953))

(assert (=> b!1137132 m!1049909))

(check-sat (not bm!49765) (not b!1137129) (not b_lambda!19113) (not b!1137143) (not b!1137126) (not b!1137131) b_and!38879 (not b!1137146) (not b!1137134) (not b!1137154) (not b!1137141) (not b!1137149) (not b!1137144) (not mapNonEmpty!44639) (not b_next!24013) tp_is_empty!28543 (not start!98644) (not b!1137156) (not bm!49761) (not b!1137152) (not b!1137145) (not b!1137148) (not bm!49767) (not b!1137147) (not b!1137153) (not b!1137132) (not b!1137150) (not bm!49764) (not bm!49763))
(check-sat b_and!38879 (not b_next!24013))
