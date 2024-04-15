; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98444 () Bool)

(assert start!98444)

(declare-fun b_free!24055 () Bool)

(declare-fun b_next!24055 () Bool)

(assert (=> start!98444 (= b_free!24055 (not b_next!24055))))

(declare-fun tp!84875 () Bool)

(declare-fun b_and!38937 () Bool)

(assert (=> start!98444 (= tp!84875 b_and!38937)))

(declare-fun b!1137632 () Bool)

(declare-fun e!647330 () Bool)

(declare-fun tp_is_empty!28585 () Bool)

(assert (=> b!1137632 (= e!647330 tp_is_empty!28585)))

(declare-fun b!1137633 () Bool)

(declare-datatypes ((Unit!37119 0))(
  ( (Unit!37120) )
))
(declare-fun e!647323 () Unit!37119)

(declare-fun e!647332 () Unit!37119)

(assert (=> b!1137633 (= e!647323 e!647332)))

(declare-fun c!111331 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!505892 () Bool)

(assert (=> b!1137633 (= c!111331 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505892))))

(declare-fun bm!50176 () Bool)

(declare-fun call!50184 () Unit!37119)

(declare-fun call!50181 () Unit!37119)

(assert (=> bm!50176 (= call!50184 call!50181)))

(declare-fun b!1137634 () Bool)

(declare-fun res!759063 () Bool)

(declare-fun e!647331 () Bool)

(assert (=> b!1137634 (=> (not res!759063) (not e!647331))))

(declare-datatypes ((array!73952 0))(
  ( (array!73953 (arr!35627 (Array (_ BitVec 32) (_ BitVec 64))) (size!36165 (_ BitVec 32))) )
))
(declare-fun lt!505880 () array!73952)

(declare-datatypes ((List!24953 0))(
  ( (Nil!24950) (Cons!24949 (h!26158 (_ BitVec 64)) (t!35991 List!24953)) )
))
(declare-fun arrayNoDuplicates!0 (array!73952 (_ BitVec 32) List!24953) Bool)

(assert (=> b!1137634 (= res!759063 (arrayNoDuplicates!0 lt!505880 #b00000000000000000000000000000000 Nil!24950))))

(declare-fun res!759056 () Bool)

(declare-fun e!647329 () Bool)

(assert (=> start!98444 (=> (not res!759056) (not e!647329))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73952)

(assert (=> start!98444 (= res!759056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36165 _keys!1208))))))

(assert (=> start!98444 e!647329))

(assert (=> start!98444 tp_is_empty!28585))

(declare-fun array_inv!27386 (array!73952) Bool)

(assert (=> start!98444 (array_inv!27386 _keys!1208)))

(assert (=> start!98444 true))

(assert (=> start!98444 tp!84875))

(declare-datatypes ((V!43241 0))(
  ( (V!43242 (val!14349 Int)) )
))
(declare-datatypes ((ValueCell!13583 0))(
  ( (ValueCellFull!13583 (v!16985 V!43241)) (EmptyCell!13583) )
))
(declare-datatypes ((array!73954 0))(
  ( (array!73955 (arr!35628 (Array (_ BitVec 32) ValueCell!13583)) (size!36166 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73954)

(declare-fun e!647324 () Bool)

(declare-fun array_inv!27387 (array!73954) Bool)

(assert (=> start!98444 (and (array_inv!27387 _values!996) e!647324)))

(declare-fun b!1137635 () Bool)

(declare-fun e!647334 () Bool)

(assert (=> b!1137635 (= e!647334 tp_is_empty!28585)))

(declare-fun b!1137636 () Bool)

(declare-fun e!647322 () Unit!37119)

(declare-fun Unit!37121 () Unit!37119)

(assert (=> b!1137636 (= e!647322 Unit!37121)))

(assert (=> b!1137636 (= lt!505892 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111329 () Bool)

(assert (=> b!1137636 (= c!111329 (and (not lt!505892) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505884 () Unit!37119)

(declare-fun e!647326 () Unit!37119)

(assert (=> b!1137636 (= lt!505884 e!647326)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43241)

(declare-fun zeroValue!944 () V!43241)

(declare-fun lt!505885 () Unit!37119)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!360 (array!73952 array!73954 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 64) (_ BitVec 32) Int) Unit!37119)

(assert (=> b!1137636 (= lt!505885 (lemmaListMapContainsThenArrayContainsFrom!360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111332 () Bool)

(assert (=> b!1137636 (= c!111332 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759064 () Bool)

(declare-fun e!647335 () Bool)

(assert (=> b!1137636 (= res!759064 e!647335)))

(declare-fun e!647328 () Bool)

(assert (=> b!1137636 (=> (not res!759064) (not e!647328))))

(assert (=> b!1137636 e!647328))

(declare-fun lt!505893 () Unit!37119)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73952 (_ BitVec 32) (_ BitVec 32)) Unit!37119)

(assert (=> b!1137636 (= lt!505893 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137636 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24950)))

(declare-fun lt!505889 () Unit!37119)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73952 (_ BitVec 64) (_ BitVec 32) List!24953) Unit!37119)

(assert (=> b!1137636 (= lt!505889 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24950))))

(assert (=> b!1137636 false))

(declare-datatypes ((tuple2!18212 0))(
  ( (tuple2!18213 (_1!9117 (_ BitVec 64)) (_2!9117 V!43241)) )
))
(declare-datatypes ((List!24954 0))(
  ( (Nil!24951) (Cons!24950 (h!26159 tuple2!18212) (t!35992 List!24954)) )
))
(declare-datatypes ((ListLongMap!16181 0))(
  ( (ListLongMap!16182 (toList!8106 List!24954)) )
))
(declare-fun lt!505879 () ListLongMap!16181)

(declare-fun bm!50177 () Bool)

(declare-fun c!111328 () Bool)

(declare-fun call!50180 () ListLongMap!16181)

(declare-fun +!3534 (ListLongMap!16181 tuple2!18212) ListLongMap!16181)

(assert (=> bm!50177 (= call!50180 (+!3534 lt!505879 (ite (or c!111329 c!111328) (tuple2!18213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137637 () Bool)

(declare-fun Unit!37122 () Unit!37119)

(assert (=> b!1137637 (= e!647332 Unit!37122)))

(declare-fun b!1137638 () Bool)

(declare-fun e!647333 () Bool)

(declare-fun call!50185 () ListLongMap!16181)

(declare-fun call!50183 () ListLongMap!16181)

(assert (=> b!1137638 (= e!647333 (= call!50185 call!50183))))

(declare-fun b!1137639 () Bool)

(assert (=> b!1137639 (= e!647335 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505892) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137640 () Bool)

(declare-fun res!759059 () Bool)

(assert (=> b!1137640 (=> (not res!759059) (not e!647329))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137640 (= res!759059 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36165 _keys!1208))))))

(declare-fun bm!50178 () Bool)

(declare-fun call!50182 () ListLongMap!16181)

(assert (=> bm!50178 (= call!50182 call!50180)))

(declare-fun mapIsEmpty!44702 () Bool)

(declare-fun mapRes!44702 () Bool)

(assert (=> mapIsEmpty!44702 mapRes!44702))

(declare-fun lt!505891 () array!73954)

(declare-fun bm!50179 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4601 (array!73952 array!73954 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 32) Int) ListLongMap!16181)

(assert (=> bm!50179 (= call!50185 (getCurrentListMapNoExtraKeys!4601 lt!505880 lt!505891 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137641 () Bool)

(declare-fun -!1198 (ListLongMap!16181 (_ BitVec 64)) ListLongMap!16181)

(assert (=> b!1137641 (= e!647333 (= call!50185 (-!1198 call!50183 k0!934)))))

(declare-fun b!1137642 () Bool)

(assert (=> b!1137642 (= c!111328 (and (not lt!505892) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1137642 (= e!647326 e!647323)))

(declare-fun bm!50180 () Bool)

(declare-fun addStillContains!754 (ListLongMap!16181 (_ BitVec 64) V!43241 (_ BitVec 64)) Unit!37119)

(assert (=> bm!50180 (= call!50181 (addStillContains!754 lt!505879 (ite (or c!111329 c!111328) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111329 c!111328) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!50179 () Bool)

(declare-fun lt!505888 () ListLongMap!16181)

(declare-fun bm!50181 () Bool)

(declare-fun contains!6579 (ListLongMap!16181 (_ BitVec 64)) Bool)

(assert (=> bm!50181 (= call!50179 (contains!6579 (ite c!111329 lt!505888 call!50182) k0!934))))

(declare-fun b!1137643 () Bool)

(assert (=> b!1137643 (= e!647324 (and e!647334 mapRes!44702))))

(declare-fun condMapEmpty!44702 () Bool)

(declare-fun mapDefault!44702 () ValueCell!13583)

(assert (=> b!1137643 (= condMapEmpty!44702 (= (arr!35628 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13583)) mapDefault!44702)))))

(declare-fun b!1137644 () Bool)

(assert (=> b!1137644 (contains!6579 (+!3534 lt!505888 (tuple2!18213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!505882 () Unit!37119)

(assert (=> b!1137644 (= lt!505882 (addStillContains!754 lt!505888 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1137644 call!50179))

(assert (=> b!1137644 (= lt!505888 call!50180)))

(declare-fun lt!505886 () Unit!37119)

(assert (=> b!1137644 (= lt!505886 call!50181)))

(assert (=> b!1137644 (= e!647326 lt!505882)))

(declare-fun b!1137645 () Bool)

(declare-fun e!647337 () Bool)

(assert (=> b!1137645 (= e!647337 true)))

(declare-fun lt!505894 () Unit!37119)

(assert (=> b!1137645 (= lt!505894 e!647322)))

(declare-fun c!111330 () Bool)

(assert (=> b!1137645 (= c!111330 (contains!6579 lt!505879 k0!934))))

(assert (=> b!1137645 (= lt!505879 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137646 () Bool)

(declare-fun Unit!37123 () Unit!37119)

(assert (=> b!1137646 (= e!647322 Unit!37123)))

(declare-fun b!1137647 () Bool)

(declare-fun res!759055 () Bool)

(assert (=> b!1137647 (=> (not res!759055) (not e!647329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137647 (= res!759055 (validKeyInArray!0 k0!934))))

(declare-fun b!1137648 () Bool)

(declare-fun arrayContainsKey!0 (array!73952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137648 (= e!647335 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137649 () Bool)

(declare-fun res!759053 () Bool)

(assert (=> b!1137649 (=> (not res!759053) (not e!647329))))

(assert (=> b!1137649 (= res!759053 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24950))))

(declare-fun mapNonEmpty!44702 () Bool)

(declare-fun tp!84876 () Bool)

(assert (=> mapNonEmpty!44702 (= mapRes!44702 (and tp!84876 e!647330))))

(declare-fun mapKey!44702 () (_ BitVec 32))

(declare-fun mapValue!44702 () ValueCell!13583)

(declare-fun mapRest!44702 () (Array (_ BitVec 32) ValueCell!13583))

(assert (=> mapNonEmpty!44702 (= (arr!35628 _values!996) (store mapRest!44702 mapKey!44702 mapValue!44702))))

(declare-fun b!1137650 () Bool)

(declare-fun res!759052 () Bool)

(assert (=> b!1137650 (=> (not res!759052) (not e!647329))))

(assert (=> b!1137650 (= res!759052 (= (select (arr!35627 _keys!1208) i!673) k0!934))))

(declare-fun b!1137651 () Bool)

(assert (=> b!1137651 (= e!647329 e!647331)))

(declare-fun res!759058 () Bool)

(assert (=> b!1137651 (=> (not res!759058) (not e!647331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73952 (_ BitVec 32)) Bool)

(assert (=> b!1137651 (= res!759058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505880 mask!1564))))

(assert (=> b!1137651 (= lt!505880 (array!73953 (store (arr!35627 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36165 _keys!1208)))))

(declare-fun b!1137652 () Bool)

(declare-fun lt!505890 () Unit!37119)

(assert (=> b!1137652 (= e!647323 lt!505890)))

(assert (=> b!1137652 (= lt!505890 call!50184)))

(declare-fun call!50186 () Bool)

(assert (=> b!1137652 call!50186))

(declare-fun b!1137653 () Bool)

(assert (=> b!1137653 call!50186))

(declare-fun lt!505887 () Unit!37119)

(assert (=> b!1137653 (= lt!505887 call!50184)))

(assert (=> b!1137653 (= e!647332 lt!505887)))

(declare-fun b!1137654 () Bool)

(assert (=> b!1137654 (= e!647328 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137655 () Bool)

(declare-fun res!759065 () Bool)

(assert (=> b!1137655 (=> (not res!759065) (not e!647329))))

(assert (=> b!1137655 (= res!759065 (and (= (size!36166 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36165 _keys!1208) (size!36166 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50182 () Bool)

(assert (=> bm!50182 (= call!50183 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137656 () Bool)

(declare-fun e!647336 () Bool)

(assert (=> b!1137656 (= e!647336 e!647337)))

(declare-fun res!759061 () Bool)

(assert (=> b!1137656 (=> res!759061 e!647337)))

(assert (=> b!1137656 (= res!759061 (not (= (select (arr!35627 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137656 e!647333))

(declare-fun c!111327 () Bool)

(assert (=> b!1137656 (= c!111327 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505883 () Unit!37119)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!481 (array!73952 array!73954 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37119)

(assert (=> b!1137656 (= lt!505883 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137657 () Bool)

(declare-fun e!647327 () Bool)

(assert (=> b!1137657 (= e!647327 e!647336)))

(declare-fun res!759057 () Bool)

(assert (=> b!1137657 (=> res!759057 e!647336)))

(assert (=> b!1137657 (= res!759057 (not (= from!1455 i!673)))))

(declare-fun lt!505881 () ListLongMap!16181)

(assert (=> b!1137657 (= lt!505881 (getCurrentListMapNoExtraKeys!4601 lt!505880 lt!505891 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2592 (Int (_ BitVec 64)) V!43241)

(assert (=> b!1137657 (= lt!505891 (array!73955 (store (arr!35628 _values!996) i!673 (ValueCellFull!13583 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36166 _values!996)))))

(declare-fun lt!505896 () ListLongMap!16181)

(assert (=> b!1137657 (= lt!505896 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137658 () Bool)

(declare-fun res!759054 () Bool)

(assert (=> b!1137658 (=> (not res!759054) (not e!647329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137658 (= res!759054 (validMask!0 mask!1564))))

(declare-fun b!1137659 () Bool)

(assert (=> b!1137659 (= e!647331 (not e!647327))))

(declare-fun res!759060 () Bool)

(assert (=> b!1137659 (=> res!759060 e!647327)))

(assert (=> b!1137659 (= res!759060 (bvsgt from!1455 i!673))))

(assert (=> b!1137659 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505895 () Unit!37119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73952 (_ BitVec 64) (_ BitVec 32)) Unit!37119)

(assert (=> b!1137659 (= lt!505895 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137660 () Bool)

(declare-fun res!759062 () Bool)

(assert (=> b!1137660 (=> (not res!759062) (not e!647329))))

(assert (=> b!1137660 (= res!759062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50183 () Bool)

(assert (=> bm!50183 (= call!50186 call!50179)))

(assert (= (and start!98444 res!759056) b!1137658))

(assert (= (and b!1137658 res!759054) b!1137655))

(assert (= (and b!1137655 res!759065) b!1137660))

(assert (= (and b!1137660 res!759062) b!1137649))

(assert (= (and b!1137649 res!759053) b!1137640))

(assert (= (and b!1137640 res!759059) b!1137647))

(assert (= (and b!1137647 res!759055) b!1137650))

(assert (= (and b!1137650 res!759052) b!1137651))

(assert (= (and b!1137651 res!759058) b!1137634))

(assert (= (and b!1137634 res!759063) b!1137659))

(assert (= (and b!1137659 (not res!759060)) b!1137657))

(assert (= (and b!1137657 (not res!759057)) b!1137656))

(assert (= (and b!1137656 c!111327) b!1137641))

(assert (= (and b!1137656 (not c!111327)) b!1137638))

(assert (= (or b!1137641 b!1137638) bm!50182))

(assert (= (or b!1137641 b!1137638) bm!50179))

(assert (= (and b!1137656 (not res!759061)) b!1137645))

(assert (= (and b!1137645 c!111330) b!1137636))

(assert (= (and b!1137645 (not c!111330)) b!1137646))

(assert (= (and b!1137636 c!111329) b!1137644))

(assert (= (and b!1137636 (not c!111329)) b!1137642))

(assert (= (and b!1137642 c!111328) b!1137652))

(assert (= (and b!1137642 (not c!111328)) b!1137633))

(assert (= (and b!1137633 c!111331) b!1137653))

(assert (= (and b!1137633 (not c!111331)) b!1137637))

(assert (= (or b!1137652 b!1137653) bm!50176))

(assert (= (or b!1137652 b!1137653) bm!50178))

(assert (= (or b!1137652 b!1137653) bm!50183))

(assert (= (or b!1137644 bm!50183) bm!50181))

(assert (= (or b!1137644 bm!50176) bm!50180))

(assert (= (or b!1137644 bm!50178) bm!50177))

(assert (= (and b!1137636 c!111332) b!1137648))

(assert (= (and b!1137636 (not c!111332)) b!1137639))

(assert (= (and b!1137636 res!759064) b!1137654))

(assert (= (and b!1137643 condMapEmpty!44702) mapIsEmpty!44702))

(assert (= (and b!1137643 (not condMapEmpty!44702)) mapNonEmpty!44702))

(get-info :version)

(assert (= (and mapNonEmpty!44702 ((_ is ValueCellFull!13583) mapValue!44702)) b!1137632))

(assert (= (and b!1137643 ((_ is ValueCellFull!13583) mapDefault!44702)) b!1137635))

(assert (= start!98444 b!1137643))

(declare-fun b_lambda!19143 () Bool)

(assert (=> (not b_lambda!19143) (not b!1137657)))

(declare-fun t!35990 () Bool)

(declare-fun tb!8859 () Bool)

(assert (=> (and start!98444 (= defaultEntry!1004 defaultEntry!1004) t!35990) tb!8859))

(declare-fun result!18291 () Bool)

(assert (=> tb!8859 (= result!18291 tp_is_empty!28585)))

(assert (=> b!1137657 t!35990))

(declare-fun b_and!38939 () Bool)

(assert (= b_and!38937 (and (=> t!35990 result!18291) b_and!38939)))

(declare-fun m!1049169 () Bool)

(assert (=> b!1137659 m!1049169))

(declare-fun m!1049171 () Bool)

(assert (=> b!1137659 m!1049171))

(declare-fun m!1049173 () Bool)

(assert (=> b!1137634 m!1049173))

(declare-fun m!1049175 () Bool)

(assert (=> bm!50177 m!1049175))

(declare-fun m!1049177 () Bool)

(assert (=> bm!50181 m!1049177))

(declare-fun m!1049179 () Bool)

(assert (=> b!1137651 m!1049179))

(declare-fun m!1049181 () Bool)

(assert (=> b!1137651 m!1049181))

(declare-fun m!1049183 () Bool)

(assert (=> b!1137645 m!1049183))

(declare-fun m!1049185 () Bool)

(assert (=> b!1137645 m!1049185))

(declare-fun m!1049187 () Bool)

(assert (=> b!1137650 m!1049187))

(declare-fun m!1049189 () Bool)

(assert (=> b!1137658 m!1049189))

(assert (=> bm!50182 m!1049185))

(declare-fun m!1049191 () Bool)

(assert (=> b!1137656 m!1049191))

(declare-fun m!1049193 () Bool)

(assert (=> b!1137656 m!1049193))

(declare-fun m!1049195 () Bool)

(assert (=> b!1137647 m!1049195))

(declare-fun m!1049197 () Bool)

(assert (=> b!1137649 m!1049197))

(declare-fun m!1049199 () Bool)

(assert (=> b!1137660 m!1049199))

(declare-fun m!1049201 () Bool)

(assert (=> b!1137657 m!1049201))

(declare-fun m!1049203 () Bool)

(assert (=> b!1137657 m!1049203))

(declare-fun m!1049205 () Bool)

(assert (=> b!1137657 m!1049205))

(declare-fun m!1049207 () Bool)

(assert (=> b!1137657 m!1049207))

(declare-fun m!1049209 () Bool)

(assert (=> b!1137648 m!1049209))

(declare-fun m!1049211 () Bool)

(assert (=> b!1137636 m!1049211))

(declare-fun m!1049213 () Bool)

(assert (=> b!1137636 m!1049213))

(declare-fun m!1049215 () Bool)

(assert (=> b!1137636 m!1049215))

(declare-fun m!1049217 () Bool)

(assert (=> b!1137636 m!1049217))

(declare-fun m!1049219 () Bool)

(assert (=> start!98444 m!1049219))

(declare-fun m!1049221 () Bool)

(assert (=> start!98444 m!1049221))

(declare-fun m!1049223 () Bool)

(assert (=> bm!50179 m!1049223))

(assert (=> b!1137654 m!1049209))

(declare-fun m!1049225 () Bool)

(assert (=> mapNonEmpty!44702 m!1049225))

(declare-fun m!1049227 () Bool)

(assert (=> b!1137641 m!1049227))

(declare-fun m!1049229 () Bool)

(assert (=> bm!50180 m!1049229))

(declare-fun m!1049231 () Bool)

(assert (=> b!1137644 m!1049231))

(assert (=> b!1137644 m!1049231))

(declare-fun m!1049233 () Bool)

(assert (=> b!1137644 m!1049233))

(declare-fun m!1049235 () Bool)

(assert (=> b!1137644 m!1049235))

(check-sat (not b!1137641) (not bm!50177) (not b_lambda!19143) (not bm!50182) (not start!98444) (not b!1137654) (not bm!50180) (not mapNonEmpty!44702) (not b!1137634) (not b!1137649) (not b!1137651) b_and!38939 (not bm!50179) (not bm!50181) (not b!1137644) (not b!1137647) (not b!1137660) (not b!1137636) (not b!1137657) (not b_next!24055) (not b!1137645) (not b!1137659) tp_is_empty!28585 (not b!1137658) (not b!1137656) (not b!1137648))
(check-sat b_and!38939 (not b_next!24055))
