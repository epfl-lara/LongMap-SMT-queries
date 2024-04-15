; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98420 () Bool)

(assert start!98420)

(declare-fun b_free!24031 () Bool)

(declare-fun b_next!24031 () Bool)

(assert (=> start!98420 (= b_free!24031 (not b_next!24031))))

(declare-fun tp!84804 () Bool)

(declare-fun b_and!38889 () Bool)

(assert (=> start!98420 (= tp!84804 b_and!38889)))

(declare-fun b!1136564 () Bool)

(declare-datatypes ((Unit!37075 0))(
  ( (Unit!37076) )
))
(declare-fun e!646758 () Unit!37075)

(declare-fun Unit!37077 () Unit!37075)

(assert (=> b!1136564 (= e!646758 Unit!37077)))

(declare-datatypes ((V!43209 0))(
  ( (V!43210 (val!14337 Int)) )
))
(declare-fun zeroValue!944 () V!43209)

(declare-datatypes ((array!73906 0))(
  ( (array!73907 (arr!35604 (Array (_ BitVec 32) (_ BitVec 64))) (size!36142 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73906)

(declare-fun bm!49888 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18190 0))(
  ( (tuple2!18191 (_1!9106 (_ BitVec 64)) (_2!9106 V!43209)) )
))
(declare-datatypes ((List!24935 0))(
  ( (Nil!24932) (Cons!24931 (h!26140 tuple2!18190) (t!35949 List!24935)) )
))
(declare-datatypes ((ListLongMap!16159 0))(
  ( (ListLongMap!16160 (toList!8095 List!24935)) )
))
(declare-fun call!49895 () ListLongMap!16159)

(declare-datatypes ((ValueCell!13571 0))(
  ( (ValueCellFull!13571 (v!16973 V!43209)) (EmptyCell!13571) )
))
(declare-datatypes ((array!73908 0))(
  ( (array!73909 (arr!35605 (Array (_ BitVec 32) ValueCell!13571)) (size!36143 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73908)

(declare-fun minValue!944 () V!43209)

(declare-fun getCurrentListMapNoExtraKeys!4591 (array!73906 array!73908 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 32) Int) ListLongMap!16159)

(assert (=> bm!49888 (= call!49895 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505236 () array!73906)

(declare-fun call!49892 () ListLongMap!16159)

(declare-fun bm!49889 () Bool)

(declare-fun lt!505246 () array!73908)

(assert (=> bm!49889 (= call!49892 (getCurrentListMapNoExtraKeys!4591 lt!505236 lt!505246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136565 () Bool)

(declare-fun res!758557 () Bool)

(declare-fun e!646748 () Bool)

(assert (=> b!1136565 (=> (not res!758557) (not e!646748))))

(declare-datatypes ((List!24936 0))(
  ( (Nil!24933) (Cons!24932 (h!26141 (_ BitVec 64)) (t!35950 List!24936)) )
))
(declare-fun arrayNoDuplicates!0 (array!73906 (_ BitVec 32) List!24936) Bool)

(assert (=> b!1136565 (= res!758557 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24933))))

(declare-fun b!1136566 () Bool)

(declare-fun res!758560 () Bool)

(assert (=> b!1136566 (=> (not res!758560) (not e!646748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73906 (_ BitVec 32)) Bool)

(assert (=> b!1136566 (= res!758560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136567 () Bool)

(declare-fun e!646756 () Bool)

(declare-fun e!646751 () Bool)

(assert (=> b!1136567 (= e!646756 e!646751)))

(declare-fun res!758549 () Bool)

(assert (=> b!1136567 (=> res!758549 e!646751)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1136567 (= res!758549 (not (= (select (arr!35604 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646761 () Bool)

(assert (=> b!1136567 e!646761))

(declare-fun c!111114 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136567 (= c!111114 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505239 () Unit!37075)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!474 (array!73906 array!73908 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37075)

(assert (=> b!1136567 (= lt!505239 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136568 () Bool)

(declare-fun c!111112 () Bool)

(declare-fun lt!505242 () Bool)

(assert (=> b!1136568 (= c!111112 (and (not lt!505242) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!646752 () Unit!37075)

(declare-fun e!646760 () Unit!37075)

(assert (=> b!1136568 (= e!646752 e!646760)))

(declare-fun mapIsEmpty!44666 () Bool)

(declare-fun mapRes!44666 () Bool)

(assert (=> mapIsEmpty!44666 mapRes!44666))

(declare-fun b!1136569 () Bool)

(declare-fun e!646755 () Bool)

(declare-fun e!646749 () Bool)

(assert (=> b!1136569 (= e!646755 (and e!646749 mapRes!44666))))

(declare-fun condMapEmpty!44666 () Bool)

(declare-fun mapDefault!44666 () ValueCell!13571)

(assert (=> b!1136569 (= condMapEmpty!44666 (= (arr!35605 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13571)) mapDefault!44666)))))

(declare-fun bm!49890 () Bool)

(declare-fun call!49893 () ListLongMap!16159)

(declare-fun call!49897 () ListLongMap!16159)

(assert (=> bm!49890 (= call!49893 call!49897)))

(declare-fun lt!505244 () ListLongMap!16159)

(declare-fun bm!49891 () Bool)

(declare-fun lt!505237 () ListLongMap!16159)

(declare-fun c!111116 () Bool)

(declare-fun +!3526 (ListLongMap!16159 tuple2!18190) ListLongMap!16159)

(assert (=> bm!49891 (= call!49897 (+!3526 (ite c!111116 lt!505244 lt!505237) (ite c!111116 (tuple2!18191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111112 (tuple2!18191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!758551 () Bool)

(assert (=> start!98420 (=> (not res!758551) (not e!646748))))

(assert (=> start!98420 (= res!758551 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36142 _keys!1208))))))

(assert (=> start!98420 e!646748))

(declare-fun tp_is_empty!28561 () Bool)

(assert (=> start!98420 tp_is_empty!28561))

(declare-fun array_inv!27374 (array!73906) Bool)

(assert (=> start!98420 (array_inv!27374 _keys!1208)))

(assert (=> start!98420 true))

(assert (=> start!98420 tp!84804))

(declare-fun array_inv!27375 (array!73908) Bool)

(assert (=> start!98420 (and (array_inv!27375 _values!996) e!646755)))

(declare-fun mapNonEmpty!44666 () Bool)

(declare-fun tp!84803 () Bool)

(declare-fun e!646754 () Bool)

(assert (=> mapNonEmpty!44666 (= mapRes!44666 (and tp!84803 e!646754))))

(declare-fun mapKey!44666 () (_ BitVec 32))

(declare-fun mapValue!44666 () ValueCell!13571)

(declare-fun mapRest!44666 () (Array (_ BitVec 32) ValueCell!13571))

(assert (=> mapNonEmpty!44666 (= (arr!35605 _values!996) (store mapRest!44666 mapKey!44666 mapValue!44666))))

(declare-fun b!1136570 () Bool)

(declare-fun res!758561 () Bool)

(declare-fun e!646746 () Bool)

(assert (=> b!1136570 (=> (not res!758561) (not e!646746))))

(assert (=> b!1136570 (= res!758561 (arrayNoDuplicates!0 lt!505236 #b00000000000000000000000000000000 Nil!24933))))

(declare-fun b!1136571 () Bool)

(declare-fun e!646757 () Bool)

(assert (=> b!1136571 (= e!646746 (not e!646757))))

(declare-fun res!758548 () Bool)

(assert (=> b!1136571 (=> res!758548 e!646757)))

(assert (=> b!1136571 (= res!758548 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136571 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505241 () Unit!37075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73906 (_ BitVec 64) (_ BitVec 32)) Unit!37075)

(assert (=> b!1136571 (= lt!505241 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136572 () Bool)

(assert (=> b!1136572 (= e!646761 (= call!49892 call!49895))))

(declare-fun b!1136573 () Bool)

(declare-fun res!758550 () Bool)

(assert (=> b!1136573 (=> (not res!758550) (not e!646748))))

(assert (=> b!1136573 (= res!758550 (= (select (arr!35604 _keys!1208) i!673) k0!934))))

(declare-fun b!1136574 () Bool)

(declare-fun e!646747 () Bool)

(assert (=> b!1136574 (= e!646747 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505242) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136575 () Bool)

(assert (=> b!1136575 (= e!646757 e!646756)))

(declare-fun res!758555 () Bool)

(assert (=> b!1136575 (=> res!758555 e!646756)))

(assert (=> b!1136575 (= res!758555 (not (= from!1455 i!673)))))

(declare-fun lt!505245 () ListLongMap!16159)

(assert (=> b!1136575 (= lt!505245 (getCurrentListMapNoExtraKeys!4591 lt!505236 lt!505246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2584 (Int (_ BitVec 64)) V!43209)

(assert (=> b!1136575 (= lt!505246 (array!73909 (store (arr!35605 _values!996) i!673 (ValueCellFull!13571 (dynLambda!2584 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36143 _values!996)))))

(declare-fun lt!505240 () ListLongMap!16159)

(assert (=> b!1136575 (= lt!505240 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136576 () Bool)

(declare-fun contains!6570 (ListLongMap!16159 (_ BitVec 64)) Bool)

(assert (=> b!1136576 (contains!6570 call!49897 k0!934)))

(declare-fun lt!505233 () Unit!37075)

(declare-fun call!49894 () Unit!37075)

(assert (=> b!1136576 (= lt!505233 call!49894)))

(declare-fun call!49898 () Bool)

(assert (=> b!1136576 call!49898))

(assert (=> b!1136576 (= lt!505244 (+!3526 lt!505237 (tuple2!18191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505232 () Unit!37075)

(declare-fun addStillContains!744 (ListLongMap!16159 (_ BitVec 64) V!43209 (_ BitVec 64)) Unit!37075)

(assert (=> b!1136576 (= lt!505232 (addStillContains!744 lt!505237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1136576 (= e!646752 lt!505233)))

(declare-fun bm!49892 () Bool)

(assert (=> bm!49892 (= call!49894 (addStillContains!744 (ite c!111116 lt!505244 lt!505237) (ite c!111116 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111112 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111116 minValue!944 (ite c!111112 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!49893 () Bool)

(declare-fun call!49891 () Bool)

(assert (=> bm!49893 (= call!49891 call!49898)))

(declare-fun b!1136577 () Bool)

(declare-fun res!758552 () Bool)

(assert (=> b!1136577 (=> (not res!758552) (not e!646748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136577 (= res!758552 (validMask!0 mask!1564))))

(declare-fun b!1136578 () Bool)

(declare-fun res!758556 () Bool)

(assert (=> b!1136578 (=> (not res!758556) (not e!646748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136578 (= res!758556 (validKeyInArray!0 k0!934))))

(declare-fun b!1136579 () Bool)

(declare-fun e!646750 () Unit!37075)

(declare-fun Unit!37078 () Unit!37075)

(assert (=> b!1136579 (= e!646750 Unit!37078)))

(assert (=> b!1136579 (= lt!505242 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1136579 (= c!111116 (and (not lt!505242) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505247 () Unit!37075)

(assert (=> b!1136579 (= lt!505247 e!646752)))

(declare-fun lt!505243 () Unit!37075)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!355 (array!73906 array!73908 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 64) (_ BitVec 32) Int) Unit!37075)

(assert (=> b!1136579 (= lt!505243 (lemmaListMapContainsThenArrayContainsFrom!355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111115 () Bool)

(assert (=> b!1136579 (= c!111115 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758554 () Bool)

(assert (=> b!1136579 (= res!758554 e!646747)))

(declare-fun e!646759 () Bool)

(assert (=> b!1136579 (=> (not res!758554) (not e!646759))))

(assert (=> b!1136579 e!646759))

(declare-fun lt!505235 () Unit!37075)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73906 (_ BitVec 32) (_ BitVec 32)) Unit!37075)

(assert (=> b!1136579 (= lt!505235 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136579 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24933)))

(declare-fun lt!505248 () Unit!37075)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73906 (_ BitVec 64) (_ BitVec 32) List!24936) Unit!37075)

(assert (=> b!1136579 (= lt!505248 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24933))))

(assert (=> b!1136579 false))

(declare-fun b!1136580 () Bool)

(declare-fun res!758558 () Bool)

(assert (=> b!1136580 (=> (not res!758558) (not e!646748))))

(assert (=> b!1136580 (= res!758558 (and (= (size!36143 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36142 _keys!1208) (size!36143 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136581 () Bool)

(assert (=> b!1136581 (= e!646754 tp_is_empty!28561)))

(declare-fun b!1136582 () Bool)

(assert (=> b!1136582 (= e!646748 e!646746)))

(declare-fun res!758559 () Bool)

(assert (=> b!1136582 (=> (not res!758559) (not e!646746))))

(assert (=> b!1136582 (= res!758559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505236 mask!1564))))

(assert (=> b!1136582 (= lt!505236 (array!73907 (store (arr!35604 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36142 _keys!1208)))))

(declare-fun b!1136583 () Bool)

(assert (=> b!1136583 (= e!646747 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49894 () Bool)

(assert (=> bm!49894 (= call!49898 (contains!6570 (ite c!111116 lt!505244 call!49893) k0!934))))

(declare-fun bm!49895 () Bool)

(declare-fun call!49896 () Unit!37075)

(assert (=> bm!49895 (= call!49896 call!49894)))

(declare-fun b!1136584 () Bool)

(declare-fun res!758553 () Bool)

(assert (=> b!1136584 (=> (not res!758553) (not e!646748))))

(assert (=> b!1136584 (= res!758553 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36142 _keys!1208))))))

(declare-fun b!1136585 () Bool)

(declare-fun -!1190 (ListLongMap!16159 (_ BitVec 64)) ListLongMap!16159)

(assert (=> b!1136585 (= e!646761 (= call!49892 (-!1190 call!49895 k0!934)))))

(declare-fun b!1136586 () Bool)

(assert (=> b!1136586 (= e!646751 true)))

(declare-fun lt!505238 () Unit!37075)

(assert (=> b!1136586 (= lt!505238 e!646750)))

(declare-fun c!111113 () Bool)

(assert (=> b!1136586 (= c!111113 (contains!6570 lt!505237 k0!934))))

(assert (=> b!1136586 (= lt!505237 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136587 () Bool)

(declare-fun lt!505234 () Unit!37075)

(assert (=> b!1136587 (= e!646760 lt!505234)))

(assert (=> b!1136587 (= lt!505234 call!49896)))

(assert (=> b!1136587 call!49891))

(declare-fun b!1136588 () Bool)

(assert (=> b!1136588 call!49891))

(declare-fun lt!505231 () Unit!37075)

(assert (=> b!1136588 (= lt!505231 call!49896)))

(assert (=> b!1136588 (= e!646758 lt!505231)))

(declare-fun b!1136589 () Bool)

(assert (=> b!1136589 (= e!646760 e!646758)))

(declare-fun c!111111 () Bool)

(assert (=> b!1136589 (= c!111111 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505242))))

(declare-fun b!1136590 () Bool)

(declare-fun Unit!37079 () Unit!37075)

(assert (=> b!1136590 (= e!646750 Unit!37079)))

(declare-fun b!1136591 () Bool)

(assert (=> b!1136591 (= e!646759 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136592 () Bool)

(assert (=> b!1136592 (= e!646749 tp_is_empty!28561)))

(assert (= (and start!98420 res!758551) b!1136577))

(assert (= (and b!1136577 res!758552) b!1136580))

(assert (= (and b!1136580 res!758558) b!1136566))

(assert (= (and b!1136566 res!758560) b!1136565))

(assert (= (and b!1136565 res!758557) b!1136584))

(assert (= (and b!1136584 res!758553) b!1136578))

(assert (= (and b!1136578 res!758556) b!1136573))

(assert (= (and b!1136573 res!758550) b!1136582))

(assert (= (and b!1136582 res!758559) b!1136570))

(assert (= (and b!1136570 res!758561) b!1136571))

(assert (= (and b!1136571 (not res!758548)) b!1136575))

(assert (= (and b!1136575 (not res!758555)) b!1136567))

(assert (= (and b!1136567 c!111114) b!1136585))

(assert (= (and b!1136567 (not c!111114)) b!1136572))

(assert (= (or b!1136585 b!1136572) bm!49889))

(assert (= (or b!1136585 b!1136572) bm!49888))

(assert (= (and b!1136567 (not res!758549)) b!1136586))

(assert (= (and b!1136586 c!111113) b!1136579))

(assert (= (and b!1136586 (not c!111113)) b!1136590))

(assert (= (and b!1136579 c!111116) b!1136576))

(assert (= (and b!1136579 (not c!111116)) b!1136568))

(assert (= (and b!1136568 c!111112) b!1136587))

(assert (= (and b!1136568 (not c!111112)) b!1136589))

(assert (= (and b!1136589 c!111111) b!1136588))

(assert (= (and b!1136589 (not c!111111)) b!1136564))

(assert (= (or b!1136587 b!1136588) bm!49895))

(assert (= (or b!1136587 b!1136588) bm!49890))

(assert (= (or b!1136587 b!1136588) bm!49893))

(assert (= (or b!1136576 bm!49893) bm!49894))

(assert (= (or b!1136576 bm!49895) bm!49892))

(assert (= (or b!1136576 bm!49890) bm!49891))

(assert (= (and b!1136579 c!111115) b!1136583))

(assert (= (and b!1136579 (not c!111115)) b!1136574))

(assert (= (and b!1136579 res!758554) b!1136591))

(assert (= (and b!1136569 condMapEmpty!44666) mapIsEmpty!44666))

(assert (= (and b!1136569 (not condMapEmpty!44666)) mapNonEmpty!44666))

(get-info :version)

(assert (= (and mapNonEmpty!44666 ((_ is ValueCellFull!13571) mapValue!44666)) b!1136581))

(assert (= (and b!1136569 ((_ is ValueCellFull!13571) mapDefault!44666)) b!1136592))

(assert (= start!98420 b!1136569))

(declare-fun b_lambda!19119 () Bool)

(assert (=> (not b_lambda!19119) (not b!1136575)))

(declare-fun t!35948 () Bool)

(declare-fun tb!8835 () Bool)

(assert (=> (and start!98420 (= defaultEntry!1004 defaultEntry!1004) t!35948) tb!8835))

(declare-fun result!18243 () Bool)

(assert (=> tb!8835 (= result!18243 tp_is_empty!28561)))

(assert (=> b!1136575 t!35948))

(declare-fun b_and!38891 () Bool)

(assert (= b_and!38889 (and (=> t!35948 result!18243) b_and!38891)))

(declare-fun m!1048353 () Bool)

(assert (=> start!98420 m!1048353))

(declare-fun m!1048355 () Bool)

(assert (=> start!98420 m!1048355))

(declare-fun m!1048357 () Bool)

(assert (=> b!1136585 m!1048357))

(declare-fun m!1048359 () Bool)

(assert (=> b!1136583 m!1048359))

(declare-fun m!1048361 () Bool)

(assert (=> bm!49889 m!1048361))

(declare-fun m!1048363 () Bool)

(assert (=> bm!49891 m!1048363))

(declare-fun m!1048365 () Bool)

(assert (=> b!1136579 m!1048365))

(declare-fun m!1048367 () Bool)

(assert (=> b!1136579 m!1048367))

(declare-fun m!1048369 () Bool)

(assert (=> b!1136579 m!1048369))

(declare-fun m!1048371 () Bool)

(assert (=> b!1136579 m!1048371))

(declare-fun m!1048373 () Bool)

(assert (=> mapNonEmpty!44666 m!1048373))

(declare-fun m!1048375 () Bool)

(assert (=> b!1136571 m!1048375))

(declare-fun m!1048377 () Bool)

(assert (=> b!1136571 m!1048377))

(assert (=> b!1136591 m!1048359))

(declare-fun m!1048379 () Bool)

(assert (=> b!1136576 m!1048379))

(declare-fun m!1048381 () Bool)

(assert (=> b!1136576 m!1048381))

(declare-fun m!1048383 () Bool)

(assert (=> b!1136576 m!1048383))

(declare-fun m!1048385 () Bool)

(assert (=> b!1136575 m!1048385))

(declare-fun m!1048387 () Bool)

(assert (=> b!1136575 m!1048387))

(declare-fun m!1048389 () Bool)

(assert (=> b!1136575 m!1048389))

(declare-fun m!1048391 () Bool)

(assert (=> b!1136575 m!1048391))

(declare-fun m!1048393 () Bool)

(assert (=> b!1136586 m!1048393))

(declare-fun m!1048395 () Bool)

(assert (=> b!1136586 m!1048395))

(declare-fun m!1048397 () Bool)

(assert (=> b!1136567 m!1048397))

(declare-fun m!1048399 () Bool)

(assert (=> b!1136567 m!1048399))

(declare-fun m!1048401 () Bool)

(assert (=> bm!49894 m!1048401))

(declare-fun m!1048403 () Bool)

(assert (=> b!1136573 m!1048403))

(declare-fun m!1048405 () Bool)

(assert (=> b!1136570 m!1048405))

(declare-fun m!1048407 () Bool)

(assert (=> b!1136566 m!1048407))

(declare-fun m!1048409 () Bool)

(assert (=> b!1136578 m!1048409))

(assert (=> bm!49888 m!1048395))

(declare-fun m!1048411 () Bool)

(assert (=> b!1136577 m!1048411))

(declare-fun m!1048413 () Bool)

(assert (=> b!1136582 m!1048413))

(declare-fun m!1048415 () Bool)

(assert (=> b!1136582 m!1048415))

(declare-fun m!1048417 () Bool)

(assert (=> bm!49892 m!1048417))

(declare-fun m!1048419 () Bool)

(assert (=> b!1136565 m!1048419))

(check-sat (not b!1136586) (not bm!49888) (not b!1136570) (not mapNonEmpty!44666) b_and!38891 (not bm!49894) (not b!1136567) (not b_next!24031) (not b!1136591) (not bm!49891) (not b!1136565) (not b!1136576) tp_is_empty!28561 (not b!1136585) (not b!1136566) (not b!1136579) (not b!1136575) (not b!1136577) (not b!1136582) (not b!1136578) (not b_lambda!19119) (not b!1136571) (not bm!49892) (not b!1136583) (not bm!49889) (not start!98420))
(check-sat b_and!38891 (not b_next!24031))
