; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98584 () Bool)

(assert start!98584)

(declare-fun b_free!23953 () Bool)

(declare-fun b_next!23953 () Bool)

(assert (=> start!98584 (= b_free!23953 (not b_next!23953))))

(declare-fun tp!84569 () Bool)

(declare-fun b_and!38757 () Bool)

(assert (=> start!98584 (= tp!84569 b_and!38757)))

(declare-fun b!1134378 () Bool)

(declare-fun e!645713 () Bool)

(declare-fun e!645718 () Bool)

(declare-fun mapRes!44549 () Bool)

(assert (=> b!1134378 (= e!645713 (and e!645718 mapRes!44549))))

(declare-fun condMapEmpty!44549 () Bool)

(declare-datatypes ((V!43105 0))(
  ( (V!43106 (val!14298 Int)) )
))
(declare-datatypes ((ValueCell!13532 0))(
  ( (ValueCellFull!13532 (v!16931 V!43105)) (EmptyCell!13532) )
))
(declare-datatypes ((array!73871 0))(
  ( (array!73872 (arr!35580 (Array (_ BitVec 32) ValueCell!13532)) (size!36117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73871)

(declare-fun mapDefault!44549 () ValueCell!13532)

(assert (=> b!1134378 (= condMapEmpty!44549 (= (arr!35580 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13532)) mapDefault!44549)))))

(declare-fun b!1134379 () Bool)

(declare-fun res!757139 () Bool)

(declare-fun e!645704 () Bool)

(assert (=> b!1134379 (=> (not res!757139) (not e!645704))))

(declare-datatypes ((array!73873 0))(
  ( (array!73874 (arr!35581 (Array (_ BitVec 32) (_ BitVec 64))) (size!36118 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73873)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73873 (_ BitVec 32)) Bool)

(assert (=> b!1134379 (= res!757139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134380 () Bool)

(declare-fun res!757132 () Bool)

(declare-fun e!645707 () Bool)

(assert (=> b!1134380 (=> (not res!757132) (not e!645707))))

(declare-fun lt!503990 () array!73873)

(declare-datatypes ((List!24811 0))(
  ( (Nil!24808) (Cons!24807 (h!26025 (_ BitVec 64)) (t!35748 List!24811)) )
))
(declare-fun arrayNoDuplicates!0 (array!73873 (_ BitVec 32) List!24811) Bool)

(assert (=> b!1134380 (= res!757132 (arrayNoDuplicates!0 lt!503990 #b00000000000000000000000000000000 Nil!24808))))

(declare-fun b!1134381 () Bool)

(declare-datatypes ((Unit!37097 0))(
  ( (Unit!37098) )
))
(declare-fun e!645711 () Unit!37097)

(declare-fun e!645710 () Unit!37097)

(assert (=> b!1134381 (= e!645711 e!645710)))

(declare-fun c!110952 () Bool)

(declare-fun lt!503992 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1134381 (= c!110952 (and (not lt!503992) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134382 () Bool)

(declare-fun e!645705 () Unit!37097)

(declare-fun lt!503991 () Unit!37097)

(assert (=> b!1134382 (= e!645705 lt!503991)))

(declare-fun call!49047 () Unit!37097)

(assert (=> b!1134382 (= lt!503991 call!49047)))

(declare-fun call!49049 () Bool)

(assert (=> b!1134382 call!49049))

(declare-fun b!1134384 () Bool)

(declare-fun c!110949 () Bool)

(assert (=> b!1134384 (= c!110949 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503992))))

(assert (=> b!1134384 (= e!645710 e!645705)))

(declare-fun b!1134385 () Bool)

(assert (=> b!1134385 (= e!645704 e!645707)))

(declare-fun res!757129 () Bool)

(assert (=> b!1134385 (=> (not res!757129) (not e!645707))))

(assert (=> b!1134385 (= res!757129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503990 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134385 (= lt!503990 (array!73874 (store (arr!35581 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36118 _keys!1208)))))

(declare-fun b!1134386 () Bool)

(declare-fun e!645716 () Bool)

(declare-fun e!645703 () Bool)

(assert (=> b!1134386 (= e!645716 e!645703)))

(declare-fun res!757136 () Bool)

(assert (=> b!1134386 (=> res!757136 e!645703)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1134386 (= res!757136 (not (= (select (arr!35581 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645714 () Bool)

(assert (=> b!1134386 e!645714))

(declare-fun c!110950 () Bool)

(assert (=> b!1134386 (= c!110950 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43105)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43105)

(declare-fun lt!503995 () Unit!37097)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 (array!73873 array!73871 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37097)

(assert (=> b!1134386 (= lt!503995 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134387 () Bool)

(declare-fun tp_is_empty!28483 () Bool)

(assert (=> b!1134387 (= e!645718 tp_is_empty!28483)))

(declare-fun b!1134388 () Bool)

(declare-fun Unit!37099 () Unit!37097)

(assert (=> b!1134388 (= e!645705 Unit!37099)))

(declare-fun b!1134389 () Bool)

(declare-fun e!645706 () Bool)

(assert (=> b!1134389 (= e!645703 e!645706)))

(declare-fun res!757138 () Bool)

(assert (=> b!1134389 (=> res!757138 e!645706)))

(declare-datatypes ((tuple2!18040 0))(
  ( (tuple2!18041 (_1!9031 (_ BitVec 64)) (_2!9031 V!43105)) )
))
(declare-datatypes ((List!24812 0))(
  ( (Nil!24809) (Cons!24808 (h!26026 tuple2!18040) (t!35749 List!24812)) )
))
(declare-datatypes ((ListLongMap!16017 0))(
  ( (ListLongMap!16018 (toList!8024 List!24812)) )
))
(declare-fun lt!503985 () ListLongMap!16017)

(declare-fun contains!6559 (ListLongMap!16017 (_ BitVec 64)) Bool)

(assert (=> b!1134389 (= res!757138 (not (contains!6559 lt!503985 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4538 (array!73873 array!73871 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 32) Int) ListLongMap!16017)

(assert (=> b!1134389 (= lt!503985 (getCurrentListMapNoExtraKeys!4538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49040 () Bool)

(declare-fun call!49044 () ListLongMap!16017)

(declare-fun call!49043 () ListLongMap!16017)

(assert (=> bm!49040 (= call!49044 call!49043)))

(declare-fun bm!49041 () Bool)

(declare-fun call!49048 () ListLongMap!16017)

(assert (=> bm!49041 (= call!49048 (getCurrentListMapNoExtraKeys!4538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44549 () Bool)

(assert (=> mapIsEmpty!44549 mapRes!44549))

(declare-fun bm!49042 () Bool)

(declare-fun call!49050 () Unit!37097)

(assert (=> bm!49042 (= call!49047 call!49050)))

(declare-fun b!1134390 () Bool)

(declare-fun res!757137 () Bool)

(assert (=> b!1134390 (=> (not res!757137) (not e!645704))))

(assert (=> b!1134390 (= res!757137 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24808))))

(declare-fun b!1134391 () Bool)

(declare-fun res!757131 () Bool)

(assert (=> b!1134391 (=> (not res!757131) (not e!645704))))

(assert (=> b!1134391 (= res!757131 (and (= (size!36117 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36118 _keys!1208) (size!36117 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134392 () Bool)

(assert (=> b!1134392 (= e!645706 true)))

(declare-fun e!645709 () Bool)

(assert (=> b!1134392 e!645709))

(declare-fun res!757130 () Bool)

(assert (=> b!1134392 (=> (not res!757130) (not e!645709))))

(declare-fun e!645708 () Bool)

(assert (=> b!1134392 (= res!757130 e!645708)))

(declare-fun c!110948 () Bool)

(assert (=> b!1134392 (= c!110948 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503989 () Unit!37097)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!322 (array!73873 array!73871 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 64) (_ BitVec 32) Int) Unit!37097)

(assert (=> b!1134392 (= lt!503989 (lemmaListMapContainsThenArrayContainsFrom!322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503994 () Unit!37097)

(assert (=> b!1134392 (= lt!503994 e!645711)))

(declare-fun c!110951 () Bool)

(assert (=> b!1134392 (= c!110951 (and (not lt!503992) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134392 (= lt!503992 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!44549 () Bool)

(declare-fun tp!84570 () Bool)

(declare-fun e!645715 () Bool)

(assert (=> mapNonEmpty!44549 (= mapRes!44549 (and tp!84570 e!645715))))

(declare-fun mapRest!44549 () (Array (_ BitVec 32) ValueCell!13532))

(declare-fun mapKey!44549 () (_ BitVec 32))

(declare-fun mapValue!44549 () ValueCell!13532)

(assert (=> mapNonEmpty!44549 (= (arr!35580 _values!996) (store mapRest!44549 mapKey!44549 mapValue!44549))))

(declare-fun b!1134393 () Bool)

(declare-fun res!757127 () Bool)

(assert (=> b!1134393 (=> (not res!757127) (not e!645704))))

(assert (=> b!1134393 (= res!757127 (= (select (arr!35581 _keys!1208) i!673) k0!934))))

(declare-fun b!1134394 () Bool)

(declare-fun e!645717 () Bool)

(assert (=> b!1134394 (= e!645717 e!645716)))

(declare-fun res!757126 () Bool)

(assert (=> b!1134394 (=> res!757126 e!645716)))

(assert (=> b!1134394 (= res!757126 (not (= from!1455 i!673)))))

(declare-fun lt!503998 () array!73871)

(declare-fun lt!503996 () ListLongMap!16017)

(assert (=> b!1134394 (= lt!503996 (getCurrentListMapNoExtraKeys!4538 lt!503990 lt!503998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2598 (Int (_ BitVec 64)) V!43105)

(assert (=> b!1134394 (= lt!503998 (array!73872 (store (arr!35580 _values!996) i!673 (ValueCellFull!13532 (dynLambda!2598 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36117 _values!996)))))

(declare-fun lt!503987 () ListLongMap!16017)

(assert (=> b!1134394 (= lt!503987 (getCurrentListMapNoExtraKeys!4538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49043 () Bool)

(declare-fun lt!503988 () ListLongMap!16017)

(declare-fun addStillContains!711 (ListLongMap!16017 (_ BitVec 64) V!43105 (_ BitVec 64)) Unit!37097)

(assert (=> bm!49043 (= call!49050 (addStillContains!711 (ite c!110951 lt!503988 lt!503985) (ite c!110951 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110952 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110951 minValue!944 (ite c!110952 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1134395 () Bool)

(declare-fun arrayContainsKey!0 (array!73873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134395 (= e!645708 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134396 () Bool)

(declare-fun res!757128 () Bool)

(assert (=> b!1134396 (=> (not res!757128) (not e!645704))))

(assert (=> b!1134396 (= res!757128 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36118 _keys!1208))))))

(declare-fun b!1134397 () Bool)

(declare-fun call!49045 () ListLongMap!16017)

(declare-fun -!1179 (ListLongMap!16017 (_ BitVec 64)) ListLongMap!16017)

(assert (=> b!1134397 (= e!645714 (= call!49045 (-!1179 call!49048 k0!934)))))

(declare-fun b!1134398 () Bool)

(assert (=> b!1134398 (= e!645708 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503992) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134399 () Bool)

(declare-fun res!757135 () Bool)

(assert (=> b!1134399 (=> (not res!757135) (not e!645704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134399 (= res!757135 (validMask!0 mask!1564))))

(declare-fun bm!49044 () Bool)

(assert (=> bm!49044 (= call!49045 (getCurrentListMapNoExtraKeys!4538 lt!503990 lt!503998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134400 () Bool)

(assert (=> b!1134400 (= e!645715 tp_is_empty!28483)))

(declare-fun res!757133 () Bool)

(assert (=> start!98584 (=> (not res!757133) (not e!645704))))

(assert (=> start!98584 (= res!757133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36118 _keys!1208))))))

(assert (=> start!98584 e!645704))

(assert (=> start!98584 tp_is_empty!28483))

(declare-fun array_inv!27344 (array!73873) Bool)

(assert (=> start!98584 (array_inv!27344 _keys!1208)))

(assert (=> start!98584 true))

(assert (=> start!98584 tp!84569))

(declare-fun array_inv!27345 (array!73871) Bool)

(assert (=> start!98584 (and (array_inv!27345 _values!996) e!645713)))

(declare-fun b!1134383 () Bool)

(assert (=> b!1134383 (= e!645707 (not e!645717))))

(declare-fun res!757140 () Bool)

(assert (=> b!1134383 (=> res!757140 e!645717)))

(assert (=> b!1134383 (= res!757140 (bvsgt from!1455 i!673))))

(assert (=> b!1134383 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503997 () Unit!37097)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73873 (_ BitVec 64) (_ BitVec 32)) Unit!37097)

(assert (=> b!1134383 (= lt!503997 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49045 () Bool)

(declare-fun call!49046 () Bool)

(assert (=> bm!49045 (= call!49046 (contains!6559 (ite c!110951 lt!503988 call!49044) k0!934))))

(declare-fun bm!49046 () Bool)

(assert (=> bm!49046 (= call!49049 call!49046)))

(declare-fun b!1134401 () Bool)

(declare-fun res!757134 () Bool)

(assert (=> b!1134401 (=> (not res!757134) (not e!645704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134401 (= res!757134 (validKeyInArray!0 k0!934))))

(declare-fun b!1134402 () Bool)

(declare-fun lt!503993 () Unit!37097)

(assert (=> b!1134402 (= e!645711 lt!503993)))

(declare-fun lt!503984 () Unit!37097)

(assert (=> b!1134402 (= lt!503984 (addStillContains!711 lt!503985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1134402 (= lt!503988 call!49043)))

(assert (=> b!1134402 call!49046))

(assert (=> b!1134402 (= lt!503993 call!49050)))

(declare-fun +!3485 (ListLongMap!16017 tuple2!18040) ListLongMap!16017)

(assert (=> b!1134402 (contains!6559 (+!3485 lt!503988 (tuple2!18041 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!49047 () Bool)

(assert (=> bm!49047 (= call!49043 (+!3485 lt!503985 (ite (or c!110951 c!110952) (tuple2!18041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18041 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1134403 () Bool)

(assert (=> b!1134403 (= e!645714 (= call!49045 call!49048))))

(declare-fun b!1134404 () Bool)

(assert (=> b!1134404 (= e!645709 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134405 () Bool)

(assert (=> b!1134405 call!49049))

(declare-fun lt!503986 () Unit!37097)

(assert (=> b!1134405 (= lt!503986 call!49047)))

(assert (=> b!1134405 (= e!645710 lt!503986)))

(assert (= (and start!98584 res!757133) b!1134399))

(assert (= (and b!1134399 res!757135) b!1134391))

(assert (= (and b!1134391 res!757131) b!1134379))

(assert (= (and b!1134379 res!757139) b!1134390))

(assert (= (and b!1134390 res!757137) b!1134396))

(assert (= (and b!1134396 res!757128) b!1134401))

(assert (= (and b!1134401 res!757134) b!1134393))

(assert (= (and b!1134393 res!757127) b!1134385))

(assert (= (and b!1134385 res!757129) b!1134380))

(assert (= (and b!1134380 res!757132) b!1134383))

(assert (= (and b!1134383 (not res!757140)) b!1134394))

(assert (= (and b!1134394 (not res!757126)) b!1134386))

(assert (= (and b!1134386 c!110950) b!1134397))

(assert (= (and b!1134386 (not c!110950)) b!1134403))

(assert (= (or b!1134397 b!1134403) bm!49044))

(assert (= (or b!1134397 b!1134403) bm!49041))

(assert (= (and b!1134386 (not res!757136)) b!1134389))

(assert (= (and b!1134389 (not res!757138)) b!1134392))

(assert (= (and b!1134392 c!110951) b!1134402))

(assert (= (and b!1134392 (not c!110951)) b!1134381))

(assert (= (and b!1134381 c!110952) b!1134405))

(assert (= (and b!1134381 (not c!110952)) b!1134384))

(assert (= (and b!1134384 c!110949) b!1134382))

(assert (= (and b!1134384 (not c!110949)) b!1134388))

(assert (= (or b!1134405 b!1134382) bm!49042))

(assert (= (or b!1134405 b!1134382) bm!49040))

(assert (= (or b!1134405 b!1134382) bm!49046))

(assert (= (or b!1134402 bm!49046) bm!49045))

(assert (= (or b!1134402 bm!49042) bm!49043))

(assert (= (or b!1134402 bm!49040) bm!49047))

(assert (= (and b!1134392 c!110948) b!1134395))

(assert (= (and b!1134392 (not c!110948)) b!1134398))

(assert (= (and b!1134392 res!757130) b!1134404))

(assert (= (and b!1134378 condMapEmpty!44549) mapIsEmpty!44549))

(assert (= (and b!1134378 (not condMapEmpty!44549)) mapNonEmpty!44549))

(get-info :version)

(assert (= (and mapNonEmpty!44549 ((_ is ValueCellFull!13532) mapValue!44549)) b!1134400))

(assert (= (and b!1134378 ((_ is ValueCellFull!13532) mapDefault!44549)) b!1134387))

(assert (= start!98584 b!1134378))

(declare-fun b_lambda!19053 () Bool)

(assert (=> (not b_lambda!19053) (not b!1134394)))

(declare-fun t!35747 () Bool)

(declare-fun tb!8757 () Bool)

(assert (=> (and start!98584 (= defaultEntry!1004 defaultEntry!1004) t!35747) tb!8757))

(declare-fun result!18087 () Bool)

(assert (=> tb!8757 (= result!18087 tp_is_empty!28483)))

(assert (=> b!1134394 t!35747))

(declare-fun b_and!38759 () Bool)

(assert (= b_and!38757 (and (=> t!35747 result!18087) b_and!38759)))

(declare-fun m!1047841 () Bool)

(assert (=> b!1134380 m!1047841))

(declare-fun m!1047843 () Bool)

(assert (=> bm!49041 m!1047843))

(declare-fun m!1047845 () Bool)

(assert (=> b!1134394 m!1047845))

(declare-fun m!1047847 () Bool)

(assert (=> b!1134394 m!1047847))

(declare-fun m!1047849 () Bool)

(assert (=> b!1134394 m!1047849))

(declare-fun m!1047851 () Bool)

(assert (=> b!1134394 m!1047851))

(declare-fun m!1047853 () Bool)

(assert (=> b!1134395 m!1047853))

(declare-fun m!1047855 () Bool)

(assert (=> start!98584 m!1047855))

(declare-fun m!1047857 () Bool)

(assert (=> start!98584 m!1047857))

(declare-fun m!1047859 () Bool)

(assert (=> mapNonEmpty!44549 m!1047859))

(declare-fun m!1047861 () Bool)

(assert (=> b!1134402 m!1047861))

(declare-fun m!1047863 () Bool)

(assert (=> b!1134402 m!1047863))

(assert (=> b!1134402 m!1047863))

(declare-fun m!1047865 () Bool)

(assert (=> b!1134402 m!1047865))

(declare-fun m!1047867 () Bool)

(assert (=> b!1134385 m!1047867))

(declare-fun m!1047869 () Bool)

(assert (=> b!1134385 m!1047869))

(declare-fun m!1047871 () Bool)

(assert (=> bm!49045 m!1047871))

(declare-fun m!1047873 () Bool)

(assert (=> b!1134379 m!1047873))

(declare-fun m!1047875 () Bool)

(assert (=> b!1134389 m!1047875))

(assert (=> b!1134389 m!1047843))

(declare-fun m!1047877 () Bool)

(assert (=> b!1134393 m!1047877))

(declare-fun m!1047879 () Bool)

(assert (=> b!1134386 m!1047879))

(declare-fun m!1047881 () Bool)

(assert (=> b!1134386 m!1047881))

(declare-fun m!1047883 () Bool)

(assert (=> b!1134392 m!1047883))

(declare-fun m!1047885 () Bool)

(assert (=> b!1134401 m!1047885))

(declare-fun m!1047887 () Bool)

(assert (=> bm!49047 m!1047887))

(assert (=> b!1134404 m!1047853))

(declare-fun m!1047889 () Bool)

(assert (=> b!1134383 m!1047889))

(declare-fun m!1047891 () Bool)

(assert (=> b!1134383 m!1047891))

(declare-fun m!1047893 () Bool)

(assert (=> b!1134397 m!1047893))

(declare-fun m!1047895 () Bool)

(assert (=> b!1134390 m!1047895))

(declare-fun m!1047897 () Bool)

(assert (=> bm!49043 m!1047897))

(declare-fun m!1047899 () Bool)

(assert (=> b!1134399 m!1047899))

(declare-fun m!1047901 () Bool)

(assert (=> bm!49044 m!1047901))

(check-sat (not bm!49045) (not b!1134394) (not b!1134383) (not bm!49047) (not b_lambda!19053) (not b_next!23953) tp_is_empty!28483 (not b!1134395) (not start!98584) (not b!1134380) (not b!1134379) (not b!1134397) (not b!1134390) (not b!1134386) (not b!1134399) (not b!1134404) (not b!1134392) (not b!1134389) (not b!1134401) (not mapNonEmpty!44549) (not b!1134402) (not bm!49043) (not bm!49041) (not bm!49044) b_and!38759 (not b!1134385))
(check-sat b_and!38759 (not b_next!23953))
