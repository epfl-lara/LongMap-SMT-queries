; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98590 () Bool)

(assert start!98590)

(declare-fun b_free!23959 () Bool)

(declare-fun b_next!23959 () Bool)

(assert (=> start!98590 (= b_free!23959 (not b_next!23959))))

(declare-fun tp!84588 () Bool)

(declare-fun b_and!38769 () Bool)

(assert (=> start!98590 (= tp!84588 b_and!38769)))

(declare-fun b!1134636 () Bool)

(declare-datatypes ((Unit!37104 0))(
  ( (Unit!37105) )
))
(declare-fun e!645847 () Unit!37104)

(declare-fun Unit!37106 () Unit!37104)

(assert (=> b!1134636 (= e!645847 Unit!37106)))

(declare-fun b!1134637 () Bool)

(declare-fun e!645855 () Bool)

(declare-fun e!645861 () Bool)

(assert (=> b!1134637 (= e!645855 e!645861)))

(declare-fun res!757270 () Bool)

(assert (=> b!1134637 (=> (not res!757270) (not e!645861))))

(declare-datatypes ((array!73881 0))(
  ( (array!73882 (arr!35585 (Array (_ BitVec 32) (_ BitVec 64))) (size!36122 (_ BitVec 32))) )
))
(declare-fun lt!504122 () array!73881)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73881 (_ BitVec 32)) Bool)

(assert (=> b!1134637 (= res!757270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504122 mask!1564))))

(declare-fun _keys!1208 () array!73881)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134637 (= lt!504122 (array!73882 (store (arr!35585 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36122 _keys!1208)))))

(declare-fun b!1134638 () Bool)

(declare-fun res!757266 () Bool)

(assert (=> b!1134638 (=> (not res!757266) (not e!645855))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1134638 (= res!757266 (= (select (arr!35585 _keys!1208) i!673) k0!934))))

(declare-fun b!1134639 () Bool)

(declare-fun e!645860 () Bool)

(declare-datatypes ((V!43113 0))(
  ( (V!43114 (val!14301 Int)) )
))
(declare-datatypes ((tuple2!18044 0))(
  ( (tuple2!18045 (_1!9033 (_ BitVec 64)) (_2!9033 V!43113)) )
))
(declare-datatypes ((List!24814 0))(
  ( (Nil!24811) (Cons!24810 (h!26028 tuple2!18044) (t!35757 List!24814)) )
))
(declare-datatypes ((ListLongMap!16021 0))(
  ( (ListLongMap!16022 (toList!8026 List!24814)) )
))
(declare-fun call!49118 () ListLongMap!16021)

(declare-fun call!49119 () ListLongMap!16021)

(assert (=> b!1134639 (= e!645860 (= call!49118 call!49119))))

(declare-fun b!1134640 () Bool)

(declare-fun res!757265 () Bool)

(assert (=> b!1134640 (=> (not res!757265) (not e!645855))))

(declare-datatypes ((List!24815 0))(
  ( (Nil!24812) (Cons!24811 (h!26029 (_ BitVec 64)) (t!35758 List!24815)) )
))
(declare-fun arrayNoDuplicates!0 (array!73881 (_ BitVec 32) List!24815) Bool)

(assert (=> b!1134640 (= res!757265 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24812))))

(declare-fun b!1134641 () Bool)

(declare-fun e!645850 () Bool)

(declare-fun tp_is_empty!28489 () Bool)

(assert (=> b!1134641 (= e!645850 tp_is_empty!28489)))

(declare-fun b!1134642 () Bool)

(declare-fun e!645856 () Bool)

(assert (=> b!1134642 (= e!645856 true)))

(declare-fun e!645852 () Bool)

(assert (=> b!1134642 e!645852))

(declare-fun res!757261 () Bool)

(assert (=> b!1134642 (=> (not res!757261) (not e!645852))))

(declare-fun e!645858 () Bool)

(assert (=> b!1134642 (= res!757261 e!645858)))

(declare-fun c!110994 () Bool)

(assert (=> b!1134642 (= c!110994 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!43113)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504133 () Unit!37104)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13535 0))(
  ( (ValueCellFull!13535 (v!16934 V!43113)) (EmptyCell!13535) )
))
(declare-datatypes ((array!73883 0))(
  ( (array!73884 (arr!35586 (Array (_ BitVec 32) ValueCell!13535)) (size!36123 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73883)

(declare-fun minValue!944 () V!43113)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!323 (array!73881 array!73883 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 64) (_ BitVec 32) Int) Unit!37104)

(assert (=> b!1134642 (= lt!504133 (lemmaListMapContainsThenArrayContainsFrom!323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504123 () Unit!37104)

(declare-fun e!645851 () Unit!37104)

(assert (=> b!1134642 (= lt!504123 e!645851)))

(declare-fun c!110993 () Bool)

(declare-fun lt!504125 () Bool)

(assert (=> b!1134642 (= c!110993 (and (not lt!504125) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134642 (= lt!504125 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134643 () Bool)

(declare-fun res!757271 () Bool)

(assert (=> b!1134643 (=> (not res!757271) (not e!645855))))

(assert (=> b!1134643 (= res!757271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134644 () Bool)

(declare-fun e!645853 () Bool)

(assert (=> b!1134644 (= e!645861 (not e!645853))))

(declare-fun res!757274 () Bool)

(assert (=> b!1134644 (=> res!757274 e!645853)))

(assert (=> b!1134644 (= res!757274 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134644 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504127 () Unit!37104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73881 (_ BitVec 64) (_ BitVec 32)) Unit!37104)

(assert (=> b!1134644 (= lt!504127 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1134645 () Bool)

(declare-fun lt!504132 () Unit!37104)

(assert (=> b!1134645 (= e!645847 lt!504132)))

(declare-fun call!49120 () Unit!37104)

(assert (=> b!1134645 (= lt!504132 call!49120)))

(declare-fun call!49117 () Bool)

(assert (=> b!1134645 call!49117))

(declare-fun b!1134646 () Bool)

(declare-fun lt!504130 () Unit!37104)

(assert (=> b!1134646 (= e!645851 lt!504130)))

(declare-fun lt!504129 () Unit!37104)

(declare-fun lt!504120 () ListLongMap!16021)

(declare-fun addStillContains!713 (ListLongMap!16021 (_ BitVec 64) V!43113 (_ BitVec 64)) Unit!37104)

(assert (=> b!1134646 (= lt!504129 (addStillContains!713 lt!504120 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!504128 () ListLongMap!16021)

(declare-fun +!3486 (ListLongMap!16021 tuple2!18044) ListLongMap!16021)

(assert (=> b!1134646 (= lt!504128 (+!3486 lt!504120 (tuple2!18045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!49122 () Bool)

(assert (=> b!1134646 call!49122))

(declare-fun call!49115 () Unit!37104)

(assert (=> b!1134646 (= lt!504130 call!49115)))

(declare-fun call!49121 () ListLongMap!16021)

(declare-fun contains!6561 (ListLongMap!16021 (_ BitVec 64)) Bool)

(assert (=> b!1134646 (contains!6561 call!49121 k0!934)))

(declare-fun call!49116 () ListLongMap!16021)

(declare-fun bm!49112 () Bool)

(assert (=> bm!49112 (= call!49122 (contains!6561 (ite c!110993 lt!504128 call!49116) k0!934))))

(declare-fun b!1134647 () Bool)

(declare-fun res!757269 () Bool)

(assert (=> b!1134647 (=> (not res!757269) (not e!645855))))

(assert (=> b!1134647 (= res!757269 (and (= (size!36123 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36122 _keys!1208) (size!36123 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134648 () Bool)

(declare-fun res!757262 () Bool)

(assert (=> b!1134648 (=> (not res!757262) (not e!645855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134648 (= res!757262 (validKeyInArray!0 k0!934))))

(declare-fun b!1134649 () Bool)

(assert (=> b!1134649 (= e!645852 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49113 () Bool)

(assert (=> bm!49113 (= call!49120 call!49115)))

(declare-fun bm!49114 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4540 (array!73881 array!73883 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 32) Int) ListLongMap!16021)

(assert (=> bm!49114 (= call!49119 (getCurrentListMapNoExtraKeys!4540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44558 () Bool)

(declare-fun mapRes!44558 () Bool)

(declare-fun tp!84587 () Bool)

(assert (=> mapNonEmpty!44558 (= mapRes!44558 (and tp!84587 e!645850))))

(declare-fun mapKey!44558 () (_ BitVec 32))

(declare-fun mapRest!44558 () (Array (_ BitVec 32) ValueCell!13535))

(declare-fun mapValue!44558 () ValueCell!13535)

(assert (=> mapNonEmpty!44558 (= (arr!35586 _values!996) (store mapRest!44558 mapKey!44558 mapValue!44558))))

(declare-fun b!1134650 () Bool)

(declare-fun e!645854 () Bool)

(assert (=> b!1134650 (= e!645853 e!645854)))

(declare-fun res!757268 () Bool)

(assert (=> b!1134650 (=> res!757268 e!645854)))

(assert (=> b!1134650 (= res!757268 (not (= from!1455 i!673)))))

(declare-fun lt!504119 () ListLongMap!16021)

(declare-fun lt!504121 () array!73883)

(assert (=> b!1134650 (= lt!504119 (getCurrentListMapNoExtraKeys!4540 lt!504122 lt!504121 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2599 (Int (_ BitVec 64)) V!43113)

(assert (=> b!1134650 (= lt!504121 (array!73884 (store (arr!35586 _values!996) i!673 (ValueCellFull!13535 (dynLambda!2599 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36123 _values!996)))))

(declare-fun lt!504124 () ListLongMap!16021)

(assert (=> b!1134650 (= lt!504124 (getCurrentListMapNoExtraKeys!4540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49115 () Bool)

(assert (=> bm!49115 (= call!49116 call!49121)))

(declare-fun bm!49116 () Bool)

(assert (=> bm!49116 (= call!49118 (getCurrentListMapNoExtraKeys!4540 lt!504122 lt!504121 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!110996 () Bool)

(declare-fun bm!49117 () Bool)

(assert (=> bm!49117 (= call!49121 (+!3486 (ite c!110993 lt!504128 lt!504120) (ite c!110993 (tuple2!18045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110996 (tuple2!18045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1134651 () Bool)

(assert (=> b!1134651 (= e!645858 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134652 () Bool)

(declare-fun c!110997 () Bool)

(assert (=> b!1134652 (= c!110997 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504125))))

(declare-fun e!645848 () Unit!37104)

(assert (=> b!1134652 (= e!645848 e!645847)))

(declare-fun res!757273 () Bool)

(assert (=> start!98590 (=> (not res!757273) (not e!645855))))

(assert (=> start!98590 (= res!757273 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36122 _keys!1208))))))

(assert (=> start!98590 e!645855))

(assert (=> start!98590 tp_is_empty!28489))

(declare-fun array_inv!27346 (array!73881) Bool)

(assert (=> start!98590 (array_inv!27346 _keys!1208)))

(assert (=> start!98590 true))

(assert (=> start!98590 tp!84588))

(declare-fun e!645862 () Bool)

(declare-fun array_inv!27347 (array!73883) Bool)

(assert (=> start!98590 (and (array_inv!27347 _values!996) e!645862)))

(declare-fun b!1134653 () Bool)

(assert (=> b!1134653 (= e!645858 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504125) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134654 () Bool)

(declare-fun e!645859 () Bool)

(assert (=> b!1134654 (= e!645854 e!645859)))

(declare-fun res!757267 () Bool)

(assert (=> b!1134654 (=> res!757267 e!645859)))

(assert (=> b!1134654 (= res!757267 (not (= (select (arr!35585 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134654 e!645860))

(declare-fun c!110995 () Bool)

(assert (=> b!1134654 (= c!110995 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504131 () Unit!37104)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!438 (array!73881 array!73883 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37104)

(assert (=> b!1134654 (= lt!504131 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134655 () Bool)

(declare-fun res!757272 () Bool)

(assert (=> b!1134655 (=> (not res!757272) (not e!645861))))

(assert (=> b!1134655 (= res!757272 (arrayNoDuplicates!0 lt!504122 #b00000000000000000000000000000000 Nil!24812))))

(declare-fun b!1134656 () Bool)

(assert (=> b!1134656 call!49117))

(declare-fun lt!504126 () Unit!37104)

(assert (=> b!1134656 (= lt!504126 call!49120)))

(assert (=> b!1134656 (= e!645848 lt!504126)))

(declare-fun b!1134657 () Bool)

(declare-fun -!1180 (ListLongMap!16021 (_ BitVec 64)) ListLongMap!16021)

(assert (=> b!1134657 (= e!645860 (= call!49118 (-!1180 call!49119 k0!934)))))

(declare-fun mapIsEmpty!44558 () Bool)

(assert (=> mapIsEmpty!44558 mapRes!44558))

(declare-fun b!1134658 () Bool)

(declare-fun res!757275 () Bool)

(assert (=> b!1134658 (=> (not res!757275) (not e!645855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134658 (= res!757275 (validMask!0 mask!1564))))

(declare-fun bm!49118 () Bool)

(assert (=> bm!49118 (= call!49117 call!49122)))

(declare-fun b!1134659 () Bool)

(assert (=> b!1134659 (= e!645859 e!645856)))

(declare-fun res!757264 () Bool)

(assert (=> b!1134659 (=> res!757264 e!645856)))

(assert (=> b!1134659 (= res!757264 (not (contains!6561 lt!504120 k0!934)))))

(assert (=> b!1134659 (= lt!504120 (getCurrentListMapNoExtraKeys!4540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134660 () Bool)

(declare-fun e!645849 () Bool)

(assert (=> b!1134660 (= e!645849 tp_is_empty!28489)))

(declare-fun b!1134661 () Bool)

(declare-fun res!757263 () Bool)

(assert (=> b!1134661 (=> (not res!757263) (not e!645855))))

(assert (=> b!1134661 (= res!757263 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36122 _keys!1208))))))

(declare-fun b!1134662 () Bool)

(assert (=> b!1134662 (= e!645851 e!645848)))

(assert (=> b!1134662 (= c!110996 (and (not lt!504125) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134663 () Bool)

(assert (=> b!1134663 (= e!645862 (and e!645849 mapRes!44558))))

(declare-fun condMapEmpty!44558 () Bool)

(declare-fun mapDefault!44558 () ValueCell!13535)

(assert (=> b!1134663 (= condMapEmpty!44558 (= (arr!35586 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13535)) mapDefault!44558)))))

(declare-fun bm!49119 () Bool)

(assert (=> bm!49119 (= call!49115 (addStillContains!713 (ite c!110993 lt!504128 lt!504120) (ite c!110993 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110996 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110993 minValue!944 (ite c!110996 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!98590 res!757273) b!1134658))

(assert (= (and b!1134658 res!757275) b!1134647))

(assert (= (and b!1134647 res!757269) b!1134643))

(assert (= (and b!1134643 res!757271) b!1134640))

(assert (= (and b!1134640 res!757265) b!1134661))

(assert (= (and b!1134661 res!757263) b!1134648))

(assert (= (and b!1134648 res!757262) b!1134638))

(assert (= (and b!1134638 res!757266) b!1134637))

(assert (= (and b!1134637 res!757270) b!1134655))

(assert (= (and b!1134655 res!757272) b!1134644))

(assert (= (and b!1134644 (not res!757274)) b!1134650))

(assert (= (and b!1134650 (not res!757268)) b!1134654))

(assert (= (and b!1134654 c!110995) b!1134657))

(assert (= (and b!1134654 (not c!110995)) b!1134639))

(assert (= (or b!1134657 b!1134639) bm!49116))

(assert (= (or b!1134657 b!1134639) bm!49114))

(assert (= (and b!1134654 (not res!757267)) b!1134659))

(assert (= (and b!1134659 (not res!757264)) b!1134642))

(assert (= (and b!1134642 c!110993) b!1134646))

(assert (= (and b!1134642 (not c!110993)) b!1134662))

(assert (= (and b!1134662 c!110996) b!1134656))

(assert (= (and b!1134662 (not c!110996)) b!1134652))

(assert (= (and b!1134652 c!110997) b!1134645))

(assert (= (and b!1134652 (not c!110997)) b!1134636))

(assert (= (or b!1134656 b!1134645) bm!49113))

(assert (= (or b!1134656 b!1134645) bm!49115))

(assert (= (or b!1134656 b!1134645) bm!49118))

(assert (= (or b!1134646 bm!49118) bm!49112))

(assert (= (or b!1134646 bm!49113) bm!49119))

(assert (= (or b!1134646 bm!49115) bm!49117))

(assert (= (and b!1134642 c!110994) b!1134651))

(assert (= (and b!1134642 (not c!110994)) b!1134653))

(assert (= (and b!1134642 res!757261) b!1134649))

(assert (= (and b!1134663 condMapEmpty!44558) mapIsEmpty!44558))

(assert (= (and b!1134663 (not condMapEmpty!44558)) mapNonEmpty!44558))

(get-info :version)

(assert (= (and mapNonEmpty!44558 ((_ is ValueCellFull!13535) mapValue!44558)) b!1134641))

(assert (= (and b!1134663 ((_ is ValueCellFull!13535) mapDefault!44558)) b!1134660))

(assert (= start!98590 b!1134663))

(declare-fun b_lambda!19059 () Bool)

(assert (=> (not b_lambda!19059) (not b!1134650)))

(declare-fun t!35756 () Bool)

(declare-fun tb!8763 () Bool)

(assert (=> (and start!98590 (= defaultEntry!1004 defaultEntry!1004) t!35756) tb!8763))

(declare-fun result!18099 () Bool)

(assert (=> tb!8763 (= result!18099 tp_is_empty!28489)))

(assert (=> b!1134650 t!35756))

(declare-fun b_and!38771 () Bool)

(assert (= b_and!38769 (and (=> t!35756 result!18099) b_and!38771)))

(declare-fun m!1048027 () Bool)

(assert (=> bm!49112 m!1048027))

(declare-fun m!1048029 () Bool)

(assert (=> b!1134650 m!1048029))

(declare-fun m!1048031 () Bool)

(assert (=> b!1134650 m!1048031))

(declare-fun m!1048033 () Bool)

(assert (=> b!1134650 m!1048033))

(declare-fun m!1048035 () Bool)

(assert (=> b!1134650 m!1048035))

(declare-fun m!1048037 () Bool)

(assert (=> b!1134659 m!1048037))

(declare-fun m!1048039 () Bool)

(assert (=> b!1134659 m!1048039))

(declare-fun m!1048041 () Bool)

(assert (=> bm!49119 m!1048041))

(declare-fun m!1048043 () Bool)

(assert (=> b!1134642 m!1048043))

(declare-fun m!1048045 () Bool)

(assert (=> start!98590 m!1048045))

(declare-fun m!1048047 () Bool)

(assert (=> start!98590 m!1048047))

(declare-fun m!1048049 () Bool)

(assert (=> b!1134649 m!1048049))

(declare-fun m!1048051 () Bool)

(assert (=> b!1134638 m!1048051))

(declare-fun m!1048053 () Bool)

(assert (=> bm!49116 m!1048053))

(declare-fun m!1048055 () Bool)

(assert (=> b!1134658 m!1048055))

(declare-fun m!1048057 () Bool)

(assert (=> b!1134640 m!1048057))

(assert (=> b!1134651 m!1048049))

(declare-fun m!1048059 () Bool)

(assert (=> b!1134644 m!1048059))

(declare-fun m!1048061 () Bool)

(assert (=> b!1134644 m!1048061))

(declare-fun m!1048063 () Bool)

(assert (=> b!1134637 m!1048063))

(declare-fun m!1048065 () Bool)

(assert (=> b!1134637 m!1048065))

(assert (=> bm!49114 m!1048039))

(declare-fun m!1048067 () Bool)

(assert (=> b!1134646 m!1048067))

(declare-fun m!1048069 () Bool)

(assert (=> b!1134646 m!1048069))

(declare-fun m!1048071 () Bool)

(assert (=> b!1134646 m!1048071))

(declare-fun m!1048073 () Bool)

(assert (=> mapNonEmpty!44558 m!1048073))

(declare-fun m!1048075 () Bool)

(assert (=> b!1134655 m!1048075))

(declare-fun m!1048077 () Bool)

(assert (=> b!1134643 m!1048077))

(declare-fun m!1048079 () Bool)

(assert (=> b!1134648 m!1048079))

(declare-fun m!1048081 () Bool)

(assert (=> b!1134657 m!1048081))

(declare-fun m!1048083 () Bool)

(assert (=> bm!49117 m!1048083))

(declare-fun m!1048085 () Bool)

(assert (=> b!1134654 m!1048085))

(declare-fun m!1048087 () Bool)

(assert (=> b!1134654 m!1048087))

(check-sat (not b_next!23959) (not b!1134649) (not bm!49117) (not bm!49114) (not b!1134657) (not bm!49112) (not b!1134648) (not start!98590) b_and!38771 (not b!1134646) (not b!1134640) (not b!1134650) (not mapNonEmpty!44558) (not b!1134651) (not b!1134637) (not b!1134655) (not bm!49116) (not b!1134658) (not b_lambda!19059) tp_is_empty!28489 (not bm!49119) (not b!1134644) (not b!1134659) (not b!1134654) (not b!1134642) (not b!1134643))
(check-sat b_and!38771 (not b_next!23959))
