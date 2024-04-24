; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98632 () Bool)

(assert start!98632)

(declare-fun b_free!24001 () Bool)

(declare-fun b_next!24001 () Bool)

(assert (=> start!98632 (= b_free!24001 (not b_next!24001))))

(declare-fun tp!84713 () Bool)

(declare-fun b_and!38853 () Bool)

(assert (=> start!98632 (= tp!84713 b_and!38853)))

(declare-fun bm!49616 () Bool)

(declare-datatypes ((Unit!37159 0))(
  ( (Unit!37160) )
))
(declare-fun call!49624 () Unit!37159)

(declare-fun call!49620 () Unit!37159)

(assert (=> bm!49616 (= call!49624 call!49620)))

(declare-fun mapNonEmpty!44621 () Bool)

(declare-fun mapRes!44621 () Bool)

(declare-fun tp!84714 () Bool)

(declare-fun e!646906 () Bool)

(assert (=> mapNonEmpty!44621 (= mapRes!44621 (and tp!84714 e!646906))))

(declare-datatypes ((V!43169 0))(
  ( (V!43170 (val!14322 Int)) )
))
(declare-datatypes ((ValueCell!13556 0))(
  ( (ValueCellFull!13556 (v!16955 V!43169)) (EmptyCell!13556) )
))
(declare-fun mapValue!44621 () ValueCell!13556)

(declare-fun mapRest!44621 () (Array (_ BitVec 32) ValueCell!13556))

(declare-datatypes ((array!73965 0))(
  ( (array!73966 (arr!35627 (Array (_ BitVec 32) ValueCell!13556)) (size!36164 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73965)

(declare-fun mapKey!44621 () (_ BitVec 32))

(assert (=> mapNonEmpty!44621 (= (arr!35627 _values!996) (store mapRest!44621 mapKey!44621 mapValue!44621))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!646897 () Bool)

(declare-fun lt!505151 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1136556 () Bool)

(assert (=> b!1136556 (= e!646897 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505151) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((array!73967 0))(
  ( (array!73968 (arr!35628 (Array (_ BitVec 32) (_ BitVec 64))) (size!36165 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73967)

(declare-fun b!1136557 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!73967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136557 (= e!646897 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136559 () Bool)

(declare-fun res!758333 () Bool)

(declare-fun e!646904 () Bool)

(assert (=> b!1136559 (=> (not res!758333) (not e!646904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136559 (= res!758333 (validKeyInArray!0 k0!934))))

(declare-fun b!1136560 () Bool)

(declare-fun e!646893 () Bool)

(declare-datatypes ((tuple2!18086 0))(
  ( (tuple2!18087 (_1!9054 (_ BitVec 64)) (_2!9054 V!43169)) )
))
(declare-datatypes ((List!24852 0))(
  ( (Nil!24849) (Cons!24848 (h!26066 tuple2!18086) (t!35837 List!24852)) )
))
(declare-datatypes ((ListLongMap!16063 0))(
  ( (ListLongMap!16064 (toList!8047 List!24852)) )
))
(declare-fun call!49621 () ListLongMap!16063)

(declare-fun call!49626 () ListLongMap!16063)

(declare-fun -!1195 (ListLongMap!16063 (_ BitVec 64)) ListLongMap!16063)

(assert (=> b!1136560 (= e!646893 (= call!49621 (-!1195 call!49626 k0!934)))))

(declare-fun b!1136561 () Bool)

(declare-fun res!758331 () Bool)

(assert (=> b!1136561 (=> (not res!758331) (not e!646904))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73967 (_ BitVec 32)) Bool)

(assert (=> b!1136561 (= res!758331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44621 () Bool)

(assert (=> mapIsEmpty!44621 mapRes!44621))

(declare-fun b!1136562 () Bool)

(declare-fun res!758323 () Bool)

(declare-fun e!646907 () Bool)

(assert (=> b!1136562 (=> (not res!758323) (not e!646907))))

(declare-fun lt!505155 () array!73967)

(declare-datatypes ((List!24853 0))(
  ( (Nil!24850) (Cons!24849 (h!26067 (_ BitVec 64)) (t!35838 List!24853)) )
))
(declare-fun arrayNoDuplicates!0 (array!73967 (_ BitVec 32) List!24853) Bool)

(assert (=> b!1136562 (= res!758323 (arrayNoDuplicates!0 lt!505155 #b00000000000000000000000000000000 Nil!24850))))

(declare-fun b!1136563 () Bool)

(assert (=> b!1136563 (= e!646904 e!646907)))

(declare-fun res!758329 () Bool)

(assert (=> b!1136563 (=> (not res!758329) (not e!646907))))

(assert (=> b!1136563 (= res!758329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505155 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136563 (= lt!505155 (array!73968 (store (arr!35628 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36165 _keys!1208)))))

(declare-fun b!1136564 () Bool)

(declare-fun res!758327 () Bool)

(declare-fun e!646901 () Bool)

(assert (=> b!1136564 (=> res!758327 e!646901)))

(declare-fun noDuplicate!1612 (List!24853) Bool)

(assert (=> b!1136564 (= res!758327 (not (noDuplicate!1612 Nil!24850)))))

(declare-fun b!1136565 () Bool)

(assert (=> b!1136565 (= e!646893 (= call!49621 call!49626))))

(declare-fun b!1136566 () Bool)

(declare-fun c!111310 () Bool)

(assert (=> b!1136566 (= c!111310 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505151))))

(declare-fun e!646909 () Unit!37159)

(declare-fun e!646894 () Unit!37159)

(assert (=> b!1136566 (= e!646909 e!646894)))

(declare-fun zeroValue!944 () V!43169)

(declare-fun call!49623 () ListLongMap!16063)

(declare-fun c!111311 () Bool)

(declare-fun lt!505156 () ListLongMap!16063)

(declare-fun c!111312 () Bool)

(declare-fun minValue!944 () V!43169)

(declare-fun lt!505141 () ListLongMap!16063)

(declare-fun bm!49617 () Bool)

(declare-fun +!3503 (ListLongMap!16063 tuple2!18086) ListLongMap!16063)

(assert (=> bm!49617 (= call!49623 (+!3503 (ite c!111311 lt!505156 lt!505141) (ite c!111311 (tuple2!18087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111312 (tuple2!18087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!49618 () Bool)

(declare-fun call!49619 () Bool)

(declare-fun call!49622 () Bool)

(assert (=> bm!49618 (= call!49619 call!49622)))

(declare-fun b!1136567 () Bool)

(declare-fun e!646903 () Bool)

(assert (=> b!1136567 (= e!646907 (not e!646903))))

(declare-fun res!758328 () Bool)

(assert (=> b!1136567 (=> res!758328 e!646903)))

(assert (=> b!1136567 (= res!758328 (bvsgt from!1455 i!673))))

(assert (=> b!1136567 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505142 () Unit!37159)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73967 (_ BitVec 64) (_ BitVec 32)) Unit!37159)

(assert (=> b!1136567 (= lt!505142 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136568 () Bool)

(declare-fun res!758330 () Bool)

(assert (=> b!1136568 (=> (not res!758330) (not e!646904))))

(assert (=> b!1136568 (= res!758330 (= (select (arr!35628 _keys!1208) i!673) k0!934))))

(declare-fun bm!49619 () Bool)

(declare-fun addStillContains!730 (ListLongMap!16063 (_ BitVec 64) V!43169 (_ BitVec 64)) Unit!37159)

(assert (=> bm!49619 (= call!49620 (addStillContains!730 lt!505141 (ite (or c!111311 c!111312) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111311 c!111312) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1136569 () Bool)

(declare-fun e!646898 () Bool)

(declare-fun e!646905 () Bool)

(assert (=> b!1136569 (= e!646898 e!646905)))

(declare-fun res!758336 () Bool)

(assert (=> b!1136569 (=> res!758336 e!646905)))

(declare-fun contains!6589 (ListLongMap!16063 (_ BitVec 64)) Bool)

(assert (=> b!1136569 (= res!758336 (not (contains!6589 lt!505141 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4558 (array!73967 array!73965 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 32) Int) ListLongMap!16063)

(assert (=> b!1136569 (= lt!505141 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136570 () Bool)

(declare-fun e!646900 () Bool)

(declare-fun e!646895 () Bool)

(assert (=> b!1136570 (= e!646900 (and e!646895 mapRes!44621))))

(declare-fun condMapEmpty!44621 () Bool)

(declare-fun mapDefault!44621 () ValueCell!13556)

(assert (=> b!1136570 (= condMapEmpty!44621 (= (arr!35627 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13556)) mapDefault!44621)))))

(declare-fun b!1136571 () Bool)

(declare-fun res!758334 () Bool)

(assert (=> b!1136571 (=> res!758334 e!646901)))

(declare-fun contains!6590 (List!24853 (_ BitVec 64)) Bool)

(assert (=> b!1136571 (= res!758334 (contains!6590 Nil!24850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136572 () Bool)

(assert (=> b!1136572 (= e!646901 true)))

(declare-fun lt!505147 () Bool)

(assert (=> b!1136572 (= lt!505147 (contains!6590 Nil!24850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!49625 () ListLongMap!16063)

(declare-fun bm!49620 () Bool)

(assert (=> bm!49620 (= call!49622 (contains!6589 (ite c!111311 lt!505156 call!49625) k0!934))))

(declare-fun b!1136573 () Bool)

(declare-fun res!758320 () Bool)

(assert (=> b!1136573 (=> (not res!758320) (not e!646904))))

(assert (=> b!1136573 (= res!758320 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24850))))

(declare-fun bm!49621 () Bool)

(assert (=> bm!49621 (= call!49625 call!49623)))

(declare-fun b!1136574 () Bool)

(assert (=> b!1136574 call!49619))

(declare-fun lt!505153 () Unit!37159)

(assert (=> b!1136574 (= lt!505153 call!49624)))

(assert (=> b!1136574 (= e!646909 lt!505153)))

(declare-fun bm!49622 () Bool)

(declare-fun lt!505148 () array!73965)

(assert (=> bm!49622 (= call!49621 (getCurrentListMapNoExtraKeys!4558 lt!505155 lt!505148 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136575 () Bool)

(declare-fun lt!505150 () Unit!37159)

(assert (=> b!1136575 (= e!646894 lt!505150)))

(assert (=> b!1136575 (= lt!505150 call!49624)))

(assert (=> b!1136575 call!49619))

(declare-fun b!1136576 () Bool)

(assert (=> b!1136576 (= e!646905 e!646901)))

(declare-fun res!758332 () Bool)

(assert (=> b!1136576 (=> res!758332 e!646901)))

(assert (=> b!1136576 (= res!758332 (or (bvsge (size!36165 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36165 _keys!1208)) (bvsge from!1455 (size!36165 _keys!1208))))))

(assert (=> b!1136576 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24850)))

(declare-fun lt!505146 () Unit!37159)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73967 (_ BitVec 32) (_ BitVec 32)) Unit!37159)

(assert (=> b!1136576 (= lt!505146 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646908 () Bool)

(assert (=> b!1136576 e!646908))

(declare-fun res!758326 () Bool)

(assert (=> b!1136576 (=> (not res!758326) (not e!646908))))

(assert (=> b!1136576 (= res!758326 e!646897)))

(declare-fun c!111309 () Bool)

(assert (=> b!1136576 (= c!111309 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505143 () Unit!37159)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!339 (array!73967 array!73965 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 64) (_ BitVec 32) Int) Unit!37159)

(assert (=> b!1136576 (= lt!505143 (lemmaListMapContainsThenArrayContainsFrom!339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505140 () Unit!37159)

(declare-fun e!646902 () Unit!37159)

(assert (=> b!1136576 (= lt!505140 e!646902)))

(assert (=> b!1136576 (= c!111311 (and (not lt!505151) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136576 (= lt!505151 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136577 () Bool)

(assert (=> b!1136577 (= e!646908 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136578 () Bool)

(declare-fun res!758324 () Bool)

(assert (=> b!1136578 (=> (not res!758324) (not e!646904))))

(assert (=> b!1136578 (= res!758324 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36165 _keys!1208))))))

(declare-fun b!1136579 () Bool)

(declare-fun tp_is_empty!28531 () Bool)

(assert (=> b!1136579 (= e!646895 tp_is_empty!28531)))

(declare-fun b!1136580 () Bool)

(assert (=> b!1136580 (= e!646902 e!646909)))

(assert (=> b!1136580 (= c!111312 (and (not lt!505151) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136581 () Bool)

(declare-fun e!646899 () Bool)

(assert (=> b!1136581 (= e!646899 e!646898)))

(declare-fun res!758321 () Bool)

(assert (=> b!1136581 (=> res!758321 e!646898)))

(assert (=> b!1136581 (= res!758321 (not (= (select (arr!35628 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136581 e!646893))

(declare-fun c!111308 () Bool)

(assert (=> b!1136581 (= c!111308 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505144 () Unit!37159)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!451 (array!73967 array!73965 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37159)

(assert (=> b!1136581 (= lt!505144 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136582 () Bool)

(declare-fun lt!505145 () Unit!37159)

(assert (=> b!1136582 (= e!646902 lt!505145)))

(declare-fun lt!505154 () Unit!37159)

(assert (=> b!1136582 (= lt!505154 call!49620)))

(assert (=> b!1136582 (= lt!505156 (+!3503 lt!505141 (tuple2!18087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1136582 call!49622))

(assert (=> b!1136582 (= lt!505145 (addStillContains!730 lt!505156 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1136582 (contains!6589 call!49623 k0!934)))

(declare-fun b!1136583 () Bool)

(assert (=> b!1136583 (= e!646906 tp_is_empty!28531)))

(declare-fun b!1136584 () Bool)

(declare-fun Unit!37161 () Unit!37159)

(assert (=> b!1136584 (= e!646894 Unit!37161)))

(declare-fun bm!49623 () Bool)

(assert (=> bm!49623 (= call!49626 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!758322 () Bool)

(assert (=> start!98632 (=> (not res!758322) (not e!646904))))

(assert (=> start!98632 (= res!758322 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36165 _keys!1208))))))

(assert (=> start!98632 e!646904))

(assert (=> start!98632 tp_is_empty!28531))

(declare-fun array_inv!27374 (array!73967) Bool)

(assert (=> start!98632 (array_inv!27374 _keys!1208)))

(assert (=> start!98632 true))

(assert (=> start!98632 tp!84713))

(declare-fun array_inv!27375 (array!73965) Bool)

(assert (=> start!98632 (and (array_inv!27375 _values!996) e!646900)))

(declare-fun b!1136558 () Bool)

(declare-fun res!758337 () Bool)

(assert (=> b!1136558 (=> (not res!758337) (not e!646904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136558 (= res!758337 (validMask!0 mask!1564))))

(declare-fun b!1136585 () Bool)

(assert (=> b!1136585 (= e!646903 e!646899)))

(declare-fun res!758335 () Bool)

(assert (=> b!1136585 (=> res!758335 e!646899)))

(assert (=> b!1136585 (= res!758335 (not (= from!1455 i!673)))))

(declare-fun lt!505152 () ListLongMap!16063)

(assert (=> b!1136585 (= lt!505152 (getCurrentListMapNoExtraKeys!4558 lt!505155 lt!505148 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2612 (Int (_ BitVec 64)) V!43169)

(assert (=> b!1136585 (= lt!505148 (array!73966 (store (arr!35627 _values!996) i!673 (ValueCellFull!13556 (dynLambda!2612 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36164 _values!996)))))

(declare-fun lt!505149 () ListLongMap!16063)

(assert (=> b!1136585 (= lt!505149 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136586 () Bool)

(declare-fun res!758325 () Bool)

(assert (=> b!1136586 (=> (not res!758325) (not e!646904))))

(assert (=> b!1136586 (= res!758325 (and (= (size!36164 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36165 _keys!1208) (size!36164 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98632 res!758322) b!1136558))

(assert (= (and b!1136558 res!758337) b!1136586))

(assert (= (and b!1136586 res!758325) b!1136561))

(assert (= (and b!1136561 res!758331) b!1136573))

(assert (= (and b!1136573 res!758320) b!1136578))

(assert (= (and b!1136578 res!758324) b!1136559))

(assert (= (and b!1136559 res!758333) b!1136568))

(assert (= (and b!1136568 res!758330) b!1136563))

(assert (= (and b!1136563 res!758329) b!1136562))

(assert (= (and b!1136562 res!758323) b!1136567))

(assert (= (and b!1136567 (not res!758328)) b!1136585))

(assert (= (and b!1136585 (not res!758335)) b!1136581))

(assert (= (and b!1136581 c!111308) b!1136560))

(assert (= (and b!1136581 (not c!111308)) b!1136565))

(assert (= (or b!1136560 b!1136565) bm!49622))

(assert (= (or b!1136560 b!1136565) bm!49623))

(assert (= (and b!1136581 (not res!758321)) b!1136569))

(assert (= (and b!1136569 (not res!758336)) b!1136576))

(assert (= (and b!1136576 c!111311) b!1136582))

(assert (= (and b!1136576 (not c!111311)) b!1136580))

(assert (= (and b!1136580 c!111312) b!1136574))

(assert (= (and b!1136580 (not c!111312)) b!1136566))

(assert (= (and b!1136566 c!111310) b!1136575))

(assert (= (and b!1136566 (not c!111310)) b!1136584))

(assert (= (or b!1136574 b!1136575) bm!49616))

(assert (= (or b!1136574 b!1136575) bm!49621))

(assert (= (or b!1136574 b!1136575) bm!49618))

(assert (= (or b!1136582 bm!49618) bm!49620))

(assert (= (or b!1136582 bm!49616) bm!49619))

(assert (= (or b!1136582 bm!49621) bm!49617))

(assert (= (and b!1136576 c!111309) b!1136557))

(assert (= (and b!1136576 (not c!111309)) b!1136556))

(assert (= (and b!1136576 res!758326) b!1136577))

(assert (= (and b!1136576 (not res!758332)) b!1136564))

(assert (= (and b!1136564 (not res!758327)) b!1136571))

(assert (= (and b!1136571 (not res!758334)) b!1136572))

(assert (= (and b!1136570 condMapEmpty!44621) mapIsEmpty!44621))

(assert (= (and b!1136570 (not condMapEmpty!44621)) mapNonEmpty!44621))

(get-info :version)

(assert (= (and mapNonEmpty!44621 ((_ is ValueCellFull!13556) mapValue!44621)) b!1136583))

(assert (= (and b!1136570 ((_ is ValueCellFull!13556) mapDefault!44621)) b!1136579))

(assert (= start!98632 b!1136570))

(declare-fun b_lambda!19101 () Bool)

(assert (=> (not b_lambda!19101) (not b!1136585)))

(declare-fun t!35836 () Bool)

(declare-fun tb!8805 () Bool)

(assert (=> (and start!98632 (= defaultEntry!1004 defaultEntry!1004) t!35836) tb!8805))

(declare-fun result!18183 () Bool)

(assert (=> tb!8805 (= result!18183 tp_is_empty!28531)))

(assert (=> b!1136585 t!35836))

(declare-fun b_and!38855 () Bool)

(assert (= b_and!38853 (and (=> t!35836 result!18183) b_and!38855)))

(declare-fun m!1049451 () Bool)

(assert (=> bm!49617 m!1049451))

(declare-fun m!1049453 () Bool)

(assert (=> b!1136569 m!1049453))

(declare-fun m!1049455 () Bool)

(assert (=> b!1136569 m!1049455))

(declare-fun m!1049457 () Bool)

(assert (=> start!98632 m!1049457))

(declare-fun m!1049459 () Bool)

(assert (=> start!98632 m!1049459))

(declare-fun m!1049461 () Bool)

(assert (=> mapNonEmpty!44621 m!1049461))

(assert (=> bm!49623 m!1049455))

(declare-fun m!1049463 () Bool)

(assert (=> b!1136577 m!1049463))

(declare-fun m!1049465 () Bool)

(assert (=> b!1136571 m!1049465))

(declare-fun m!1049467 () Bool)

(assert (=> b!1136568 m!1049467))

(declare-fun m!1049469 () Bool)

(assert (=> b!1136563 m!1049469))

(declare-fun m!1049471 () Bool)

(assert (=> b!1136563 m!1049471))

(declare-fun m!1049473 () Bool)

(assert (=> b!1136576 m!1049473))

(declare-fun m!1049475 () Bool)

(assert (=> b!1136576 m!1049475))

(declare-fun m!1049477 () Bool)

(assert (=> b!1136576 m!1049477))

(declare-fun m!1049479 () Bool)

(assert (=> b!1136585 m!1049479))

(declare-fun m!1049481 () Bool)

(assert (=> b!1136585 m!1049481))

(declare-fun m!1049483 () Bool)

(assert (=> b!1136585 m!1049483))

(declare-fun m!1049485 () Bool)

(assert (=> b!1136585 m!1049485))

(declare-fun m!1049487 () Bool)

(assert (=> b!1136564 m!1049487))

(declare-fun m!1049489 () Bool)

(assert (=> bm!49620 m!1049489))

(declare-fun m!1049491 () Bool)

(assert (=> b!1136581 m!1049491))

(declare-fun m!1049493 () Bool)

(assert (=> b!1136581 m!1049493))

(declare-fun m!1049495 () Bool)

(assert (=> b!1136562 m!1049495))

(declare-fun m!1049497 () Bool)

(assert (=> b!1136573 m!1049497))

(declare-fun m!1049499 () Bool)

(assert (=> b!1136560 m!1049499))

(declare-fun m!1049501 () Bool)

(assert (=> b!1136572 m!1049501))

(declare-fun m!1049503 () Bool)

(assert (=> b!1136561 m!1049503))

(declare-fun m!1049505 () Bool)

(assert (=> b!1136567 m!1049505))

(declare-fun m!1049507 () Bool)

(assert (=> b!1136567 m!1049507))

(declare-fun m!1049509 () Bool)

(assert (=> b!1136559 m!1049509))

(declare-fun m!1049511 () Bool)

(assert (=> bm!49622 m!1049511))

(assert (=> b!1136557 m!1049463))

(declare-fun m!1049513 () Bool)

(assert (=> bm!49619 m!1049513))

(declare-fun m!1049515 () Bool)

(assert (=> b!1136558 m!1049515))

(declare-fun m!1049517 () Bool)

(assert (=> b!1136582 m!1049517))

(declare-fun m!1049519 () Bool)

(assert (=> b!1136582 m!1049519))

(declare-fun m!1049521 () Bool)

(assert (=> b!1136582 m!1049521))

(check-sat (not b!1136563) tp_is_empty!28531 (not start!98632) (not b!1136572) (not bm!49620) (not b!1136560) (not b!1136576) (not bm!49622) (not b!1136557) (not b!1136564) (not b!1136571) (not b!1136585) (not b!1136562) (not b!1136582) (not b_next!24001) (not mapNonEmpty!44621) (not b!1136573) (not b!1136561) (not b!1136559) (not b_lambda!19101) (not b!1136577) (not b!1136558) (not bm!49619) (not b!1136581) (not b!1136569) b_and!38855 (not bm!49623) (not b!1136567) (not bm!49617))
(check-sat b_and!38855 (not b_next!24001))
