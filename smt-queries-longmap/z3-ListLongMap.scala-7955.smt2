; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98564 () Bool)

(assert start!98564)

(declare-fun b_free!24175 () Bool)

(declare-fun b_next!24175 () Bool)

(assert (=> start!98564 (= b_free!24175 (not b_next!24175))))

(declare-fun tp!85235 () Bool)

(declare-fun b_and!39177 () Bool)

(assert (=> start!98564 (= tp!85235 b_and!39177)))

(declare-fun res!761577 () Bool)

(declare-fun e!650202 () Bool)

(assert (=> start!98564 (=> (not res!761577) (not e!650202))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74190 0))(
  ( (array!74191 (arr!35746 (Array (_ BitVec 32) (_ BitVec 64))) (size!36284 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74190)

(assert (=> start!98564 (= res!761577 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36284 _keys!1208))))))

(assert (=> start!98564 e!650202))

(declare-fun tp_is_empty!28705 () Bool)

(assert (=> start!98564 tp_is_empty!28705))

(declare-fun array_inv!27470 (array!74190) Bool)

(assert (=> start!98564 (array_inv!27470 _keys!1208)))

(assert (=> start!98564 true))

(assert (=> start!98564 tp!85235))

(declare-datatypes ((V!43401 0))(
  ( (V!43402 (val!14409 Int)) )
))
(declare-datatypes ((ValueCell!13643 0))(
  ( (ValueCellFull!13643 (v!17045 V!43401)) (EmptyCell!13643) )
))
(declare-datatypes ((array!74192 0))(
  ( (array!74193 (arr!35747 (Array (_ BitVec 32) ValueCell!13643)) (size!36285 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74192)

(declare-fun e!650212 () Bool)

(declare-fun array_inv!27471 (array!74192) Bool)

(assert (=> start!98564 (and (array_inv!27471 _values!996) e!650212)))

(declare-fun b!1142972 () Bool)

(declare-fun res!761572 () Bool)

(assert (=> b!1142972 (=> (not res!761572) (not e!650202))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1142972 (= res!761572 (= (select (arr!35746 _keys!1208) i!673) k0!934))))

(declare-fun b!1142973 () Bool)

(declare-fun e!650207 () Bool)

(assert (=> b!1142973 (= e!650207 tp_is_empty!28705)))

(declare-fun b!1142974 () Bool)

(declare-datatypes ((Unit!37367 0))(
  ( (Unit!37368) )
))
(declare-fun e!650208 () Unit!37367)

(declare-fun Unit!37369 () Unit!37367)

(assert (=> b!1142974 (= e!650208 Unit!37369)))

(declare-fun lt!509528 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142974 (= lt!509528 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112410 () Bool)

(assert (=> b!1142974 (= c!112410 (and (not lt!509528) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509516 () Unit!37367)

(declare-fun e!650215 () Unit!37367)

(assert (=> b!1142974 (= lt!509516 e!650215)))

(declare-fun zeroValue!944 () V!43401)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!509527 () Unit!37367)

(declare-fun minValue!944 () V!43401)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!401 (array!74190 array!74192 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 64) (_ BitVec 32) Int) Unit!37367)

(assert (=> b!1142974 (= lt!509527 (lemmaListMapContainsThenArrayContainsFrom!401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112412 () Bool)

(assert (=> b!1142974 (= c!112412 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761581 () Bool)

(declare-fun e!650216 () Bool)

(assert (=> b!1142974 (= res!761581 e!650216)))

(declare-fun e!650210 () Bool)

(assert (=> b!1142974 (=> (not res!761581) (not e!650210))))

(assert (=> b!1142974 e!650210))

(declare-fun lt!509523 () Unit!37367)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74190 (_ BitVec 32) (_ BitVec 32)) Unit!37367)

(assert (=> b!1142974 (= lt!509523 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25065 0))(
  ( (Nil!25062) (Cons!25061 (h!26270 (_ BitVec 64)) (t!36223 List!25065)) )
))
(declare-fun arrayNoDuplicates!0 (array!74190 (_ BitVec 32) List!25065) Bool)

(assert (=> b!1142974 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25062)))

(declare-fun lt!509518 () Unit!37367)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74190 (_ BitVec 64) (_ BitVec 32) List!25065) Unit!37367)

(assert (=> b!1142974 (= lt!509518 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25062))))

(assert (=> b!1142974 false))

(declare-fun b!1142975 () Bool)

(declare-fun res!761576 () Bool)

(assert (=> b!1142975 (=> (not res!761576) (not e!650202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142975 (= res!761576 (validMask!0 mask!1564))))

(declare-fun b!1142976 () Bool)

(declare-fun res!761573 () Bool)

(assert (=> b!1142976 (=> (not res!761573) (not e!650202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74190 (_ BitVec 32)) Bool)

(assert (=> b!1142976 (= res!761573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142977 () Bool)

(declare-fun e!650209 () Bool)

(declare-fun e!650214 () Bool)

(assert (=> b!1142977 (= e!650209 e!650214)))

(declare-fun res!761574 () Bool)

(assert (=> b!1142977 (=> res!761574 e!650214)))

(assert (=> b!1142977 (= res!761574 (not (= from!1455 i!673)))))

(declare-fun lt!509514 () array!74192)

(declare-datatypes ((tuple2!18328 0))(
  ( (tuple2!18329 (_1!9175 (_ BitVec 64)) (_2!9175 V!43401)) )
))
(declare-datatypes ((List!25066 0))(
  ( (Nil!25063) (Cons!25062 (h!26271 tuple2!18328) (t!36224 List!25066)) )
))
(declare-datatypes ((ListLongMap!16297 0))(
  ( (ListLongMap!16298 (toList!8164 List!25066)) )
))
(declare-fun lt!509526 () ListLongMap!16297)

(declare-fun lt!509532 () array!74190)

(declare-fun getCurrentListMapNoExtraKeys!4654 (array!74190 array!74192 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 32) Int) ListLongMap!16297)

(assert (=> b!1142977 (= lt!509526 (getCurrentListMapNoExtraKeys!4654 lt!509532 lt!509514 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509512 () V!43401)

(assert (=> b!1142977 (= lt!509514 (array!74193 (store (arr!35747 _values!996) i!673 (ValueCellFull!13643 lt!509512)) (size!36285 _values!996)))))

(declare-fun dynLambda!2632 (Int (_ BitVec 64)) V!43401)

(assert (=> b!1142977 (= lt!509512 (dynLambda!2632 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509513 () ListLongMap!16297)

(assert (=> b!1142977 (= lt!509513 (getCurrentListMapNoExtraKeys!4654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142978 () Bool)

(declare-fun res!761575 () Bool)

(assert (=> b!1142978 (=> (not res!761575) (not e!650202))))

(assert (=> b!1142978 (= res!761575 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36284 _keys!1208))))))

(declare-fun lt!509521 () ListLongMap!16297)

(declare-fun call!51624 () ListLongMap!16297)

(declare-fun c!112407 () Bool)

(declare-fun bm!51616 () Bool)

(declare-fun +!3587 (ListLongMap!16297 tuple2!18328) ListLongMap!16297)

(assert (=> bm!51616 (= call!51624 (+!3587 lt!509521 (ite (or c!112410 c!112407) (tuple2!18329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1142979 () Bool)

(declare-fun lt!509520 () ListLongMap!16297)

(declare-fun contains!6632 (ListLongMap!16297 (_ BitVec 64)) Bool)

(assert (=> b!1142979 (contains!6632 (+!3587 lt!509520 (tuple2!18329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509531 () Unit!37367)

(declare-fun call!51620 () Unit!37367)

(assert (=> b!1142979 (= lt!509531 call!51620)))

(declare-fun call!51619 () Bool)

(assert (=> b!1142979 call!51619))

(assert (=> b!1142979 (= lt!509520 call!51624)))

(declare-fun lt!509525 () Unit!37367)

(declare-fun addStillContains!802 (ListLongMap!16297 (_ BitVec 64) V!43401 (_ BitVec 64)) Unit!37367)

(assert (=> b!1142979 (= lt!509525 (addStillContains!802 lt!509521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1142979 (= e!650215 lt!509531)))

(declare-fun bm!51617 () Bool)

(declare-fun call!51623 () Unit!37367)

(assert (=> bm!51617 (= call!51623 call!51620)))

(declare-fun b!1142980 () Bool)

(declare-fun e!650211 () Unit!37367)

(declare-fun e!650206 () Unit!37367)

(assert (=> b!1142980 (= e!650211 e!650206)))

(declare-fun c!112409 () Bool)

(assert (=> b!1142980 (= c!112409 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509528))))

(declare-fun b!1142981 () Bool)

(declare-fun Unit!37370 () Unit!37367)

(assert (=> b!1142981 (= e!650208 Unit!37370)))

(declare-fun b!1142982 () Bool)

(declare-fun arrayContainsKey!0 (array!74190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142982 (= e!650216 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51618 () Bool)

(declare-fun call!51621 () Bool)

(assert (=> bm!51618 (= call!51621 call!51619)))

(declare-fun call!51622 () ListLongMap!16297)

(declare-fun b!1142983 () Bool)

(declare-fun call!51625 () ListLongMap!16297)

(declare-fun e!650213 () Bool)

(declare-fun -!1243 (ListLongMap!16297 (_ BitVec 64)) ListLongMap!16297)

(assert (=> b!1142983 (= e!650213 (= call!51622 (-!1243 call!51625 k0!934)))))

(declare-fun b!1142984 () Bool)

(assert (=> b!1142984 (= c!112407 (and (not lt!509528) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1142984 (= e!650215 e!650211)))

(declare-fun b!1142985 () Bool)

(declare-fun Unit!37371 () Unit!37367)

(assert (=> b!1142985 (= e!650206 Unit!37371)))

(declare-fun b!1142986 () Bool)

(declare-fun res!761580 () Bool)

(assert (=> b!1142986 (=> (not res!761580) (not e!650202))))

(assert (=> b!1142986 (= res!761580 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25062))))

(declare-fun b!1142987 () Bool)

(declare-fun res!761583 () Bool)

(assert (=> b!1142987 (=> (not res!761583) (not e!650202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142987 (= res!761583 (validKeyInArray!0 k0!934))))

(declare-fun b!1142988 () Bool)

(declare-fun e!650204 () Bool)

(assert (=> b!1142988 (= e!650214 e!650204)))

(declare-fun res!761584 () Bool)

(assert (=> b!1142988 (=> res!761584 e!650204)))

(assert (=> b!1142988 (= res!761584 (not (= (select (arr!35746 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142988 e!650213))

(declare-fun c!112408 () Bool)

(assert (=> b!1142988 (= c!112408 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509519 () Unit!37367)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!525 (array!74190 array!74192 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37367)

(assert (=> b!1142988 (= lt!509519 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51619 () Bool)

(assert (=> bm!51619 (= call!51622 (getCurrentListMapNoExtraKeys!4654 lt!509532 lt!509514 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51626 () ListLongMap!16297)

(declare-fun bm!51620 () Bool)

(assert (=> bm!51620 (= call!51619 (contains!6632 (ite c!112410 lt!509520 call!51626) k0!934))))

(declare-fun b!1142989 () Bool)

(assert (=> b!1142989 (= e!650210 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51621 () Bool)

(assert (=> bm!51621 (= call!51626 call!51624)))

(declare-fun b!1142990 () Bool)

(declare-fun lt!509522 () Unit!37367)

(assert (=> b!1142990 (= e!650211 lt!509522)))

(assert (=> b!1142990 (= lt!509522 call!51623)))

(assert (=> b!1142990 call!51621))

(declare-fun b!1142991 () Bool)

(declare-fun res!761578 () Bool)

(assert (=> b!1142991 (=> (not res!761578) (not e!650202))))

(assert (=> b!1142991 (= res!761578 (and (= (size!36285 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36284 _keys!1208) (size!36285 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142992 () Bool)

(declare-fun e!650203 () Bool)

(assert (=> b!1142992 (= e!650203 (not e!650209))))

(declare-fun res!761579 () Bool)

(assert (=> b!1142992 (=> res!761579 e!650209)))

(assert (=> b!1142992 (= res!761579 (bvsgt from!1455 i!673))))

(assert (=> b!1142992 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509524 () Unit!37367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74190 (_ BitVec 64) (_ BitVec 32)) Unit!37367)

(assert (=> b!1142992 (= lt!509524 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1142993 () Bool)

(assert (=> b!1142993 call!51621))

(declare-fun lt!509529 () Unit!37367)

(assert (=> b!1142993 (= lt!509529 call!51623)))

(assert (=> b!1142993 (= e!650206 lt!509529)))

(declare-fun b!1142994 () Bool)

(assert (=> b!1142994 (= e!650204 true)))

(declare-fun lt!509517 () V!43401)

(assert (=> b!1142994 (= (-!1243 (+!3587 lt!509521 (tuple2!18329 (select (arr!35746 _keys!1208) from!1455) lt!509517)) (select (arr!35746 _keys!1208) from!1455)) lt!509521)))

(declare-fun lt!509530 () Unit!37367)

(declare-fun addThenRemoveForNewKeyIsSame!109 (ListLongMap!16297 (_ BitVec 64) V!43401) Unit!37367)

(assert (=> b!1142994 (= lt!509530 (addThenRemoveForNewKeyIsSame!109 lt!509521 (select (arr!35746 _keys!1208) from!1455) lt!509517))))

(declare-fun get!18181 (ValueCell!13643 V!43401) V!43401)

(assert (=> b!1142994 (= lt!509517 (get!18181 (select (arr!35747 _values!996) from!1455) lt!509512))))

(declare-fun lt!509515 () Unit!37367)

(assert (=> b!1142994 (= lt!509515 e!650208)))

(declare-fun c!112411 () Bool)

(assert (=> b!1142994 (= c!112411 (contains!6632 lt!509521 k0!934))))

(assert (=> b!1142994 (= lt!509521 (getCurrentListMapNoExtraKeys!4654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142995 () Bool)

(declare-fun e!650217 () Bool)

(assert (=> b!1142995 (= e!650217 tp_is_empty!28705)))

(declare-fun mapIsEmpty!44882 () Bool)

(declare-fun mapRes!44882 () Bool)

(assert (=> mapIsEmpty!44882 mapRes!44882))

(declare-fun b!1142996 () Bool)

(declare-fun res!761582 () Bool)

(assert (=> b!1142996 (=> (not res!761582) (not e!650203))))

(assert (=> b!1142996 (= res!761582 (arrayNoDuplicates!0 lt!509532 #b00000000000000000000000000000000 Nil!25062))))

(declare-fun bm!51622 () Bool)

(assert (=> bm!51622 (= call!51625 (getCurrentListMapNoExtraKeys!4654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142997 () Bool)

(assert (=> b!1142997 (= e!650212 (and e!650217 mapRes!44882))))

(declare-fun condMapEmpty!44882 () Bool)

(declare-fun mapDefault!44882 () ValueCell!13643)

(assert (=> b!1142997 (= condMapEmpty!44882 (= (arr!35747 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13643)) mapDefault!44882)))))

(declare-fun b!1142998 () Bool)

(assert (=> b!1142998 (= e!650202 e!650203)))

(declare-fun res!761585 () Bool)

(assert (=> b!1142998 (=> (not res!761585) (not e!650203))))

(assert (=> b!1142998 (= res!761585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509532 mask!1564))))

(assert (=> b!1142998 (= lt!509532 (array!74191 (store (arr!35746 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36284 _keys!1208)))))

(declare-fun bm!51623 () Bool)

(assert (=> bm!51623 (= call!51620 (addStillContains!802 (ite c!112410 lt!509520 lt!509521) (ite c!112410 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112407 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112410 minValue!944 (ite c!112407 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!44882 () Bool)

(declare-fun tp!85236 () Bool)

(assert (=> mapNonEmpty!44882 (= mapRes!44882 (and tp!85236 e!650207))))

(declare-fun mapRest!44882 () (Array (_ BitVec 32) ValueCell!13643))

(declare-fun mapValue!44882 () ValueCell!13643)

(declare-fun mapKey!44882 () (_ BitVec 32))

(assert (=> mapNonEmpty!44882 (= (arr!35747 _values!996) (store mapRest!44882 mapKey!44882 mapValue!44882))))

(declare-fun b!1142999 () Bool)

(assert (=> b!1142999 (= e!650213 (= call!51622 call!51625))))

(declare-fun b!1143000 () Bool)

(assert (=> b!1143000 (= e!650216 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509528) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!98564 res!761577) b!1142975))

(assert (= (and b!1142975 res!761576) b!1142991))

(assert (= (and b!1142991 res!761578) b!1142976))

(assert (= (and b!1142976 res!761573) b!1142986))

(assert (= (and b!1142986 res!761580) b!1142978))

(assert (= (and b!1142978 res!761575) b!1142987))

(assert (= (and b!1142987 res!761583) b!1142972))

(assert (= (and b!1142972 res!761572) b!1142998))

(assert (= (and b!1142998 res!761585) b!1142996))

(assert (= (and b!1142996 res!761582) b!1142992))

(assert (= (and b!1142992 (not res!761579)) b!1142977))

(assert (= (and b!1142977 (not res!761574)) b!1142988))

(assert (= (and b!1142988 c!112408) b!1142983))

(assert (= (and b!1142988 (not c!112408)) b!1142999))

(assert (= (or b!1142983 b!1142999) bm!51619))

(assert (= (or b!1142983 b!1142999) bm!51622))

(assert (= (and b!1142988 (not res!761584)) b!1142994))

(assert (= (and b!1142994 c!112411) b!1142974))

(assert (= (and b!1142994 (not c!112411)) b!1142981))

(assert (= (and b!1142974 c!112410) b!1142979))

(assert (= (and b!1142974 (not c!112410)) b!1142984))

(assert (= (and b!1142984 c!112407) b!1142990))

(assert (= (and b!1142984 (not c!112407)) b!1142980))

(assert (= (and b!1142980 c!112409) b!1142993))

(assert (= (and b!1142980 (not c!112409)) b!1142985))

(assert (= (or b!1142990 b!1142993) bm!51617))

(assert (= (or b!1142990 b!1142993) bm!51621))

(assert (= (or b!1142990 b!1142993) bm!51618))

(assert (= (or b!1142979 bm!51618) bm!51620))

(assert (= (or b!1142979 bm!51617) bm!51623))

(assert (= (or b!1142979 bm!51621) bm!51616))

(assert (= (and b!1142974 c!112412) b!1142982))

(assert (= (and b!1142974 (not c!112412)) b!1143000))

(assert (= (and b!1142974 res!761581) b!1142989))

(assert (= (and b!1142997 condMapEmpty!44882) mapIsEmpty!44882))

(assert (= (and b!1142997 (not condMapEmpty!44882)) mapNonEmpty!44882))

(get-info :version)

(assert (= (and mapNonEmpty!44882 ((_ is ValueCellFull!13643) mapValue!44882)) b!1142973))

(assert (= (and b!1142997 ((_ is ValueCellFull!13643) mapDefault!44882)) b!1142995))

(assert (= start!98564 b!1142997))

(declare-fun b_lambda!19263 () Bool)

(assert (=> (not b_lambda!19263) (not b!1142977)))

(declare-fun t!36222 () Bool)

(declare-fun tb!8979 () Bool)

(assert (=> (and start!98564 (= defaultEntry!1004 defaultEntry!1004) t!36222) tb!8979))

(declare-fun result!18531 () Bool)

(assert (=> tb!8979 (= result!18531 tp_is_empty!28705)))

(assert (=> b!1142977 t!36222))

(declare-fun b_and!39179 () Bool)

(assert (= b_and!39177 (and (=> t!36222 result!18531) b_and!39179)))

(declare-fun m!1053681 () Bool)

(assert (=> b!1142989 m!1053681))

(declare-fun m!1053683 () Bool)

(assert (=> b!1142975 m!1053683))

(declare-fun m!1053685 () Bool)

(assert (=> b!1142996 m!1053685))

(declare-fun m!1053687 () Bool)

(assert (=> b!1142992 m!1053687))

(declare-fun m!1053689 () Bool)

(assert (=> b!1142992 m!1053689))

(declare-fun m!1053691 () Bool)

(assert (=> b!1142994 m!1053691))

(declare-fun m!1053693 () Bool)

(assert (=> b!1142994 m!1053693))

(declare-fun m!1053695 () Bool)

(assert (=> b!1142994 m!1053695))

(declare-fun m!1053697 () Bool)

(assert (=> b!1142994 m!1053697))

(assert (=> b!1142994 m!1053695))

(declare-fun m!1053699 () Bool)

(assert (=> b!1142994 m!1053699))

(declare-fun m!1053701 () Bool)

(assert (=> b!1142994 m!1053701))

(declare-fun m!1053703 () Bool)

(assert (=> b!1142994 m!1053703))

(assert (=> b!1142994 m!1053697))

(assert (=> b!1142994 m!1053701))

(declare-fun m!1053705 () Bool)

(assert (=> b!1142994 m!1053705))

(assert (=> b!1142994 m!1053701))

(declare-fun m!1053707 () Bool)

(assert (=> b!1142974 m!1053707))

(declare-fun m!1053709 () Bool)

(assert (=> b!1142974 m!1053709))

(declare-fun m!1053711 () Bool)

(assert (=> b!1142974 m!1053711))

(declare-fun m!1053713 () Bool)

(assert (=> b!1142974 m!1053713))

(declare-fun m!1053715 () Bool)

(assert (=> bm!51619 m!1053715))

(declare-fun m!1053717 () Bool)

(assert (=> start!98564 m!1053717))

(declare-fun m!1053719 () Bool)

(assert (=> start!98564 m!1053719))

(declare-fun m!1053721 () Bool)

(assert (=> b!1142987 m!1053721))

(declare-fun m!1053723 () Bool)

(assert (=> b!1142977 m!1053723))

(declare-fun m!1053725 () Bool)

(assert (=> b!1142977 m!1053725))

(declare-fun m!1053727 () Bool)

(assert (=> b!1142977 m!1053727))

(declare-fun m!1053729 () Bool)

(assert (=> b!1142977 m!1053729))

(declare-fun m!1053731 () Bool)

(assert (=> b!1142983 m!1053731))

(declare-fun m!1053733 () Bool)

(assert (=> b!1142986 m!1053733))

(declare-fun m!1053735 () Bool)

(assert (=> b!1142976 m!1053735))

(assert (=> b!1142982 m!1053681))

(assert (=> bm!51622 m!1053693))

(declare-fun m!1053737 () Bool)

(assert (=> bm!51623 m!1053737))

(declare-fun m!1053739 () Bool)

(assert (=> bm!51616 m!1053739))

(declare-fun m!1053741 () Bool)

(assert (=> b!1142979 m!1053741))

(assert (=> b!1142979 m!1053741))

(declare-fun m!1053743 () Bool)

(assert (=> b!1142979 m!1053743))

(declare-fun m!1053745 () Bool)

(assert (=> b!1142979 m!1053745))

(declare-fun m!1053747 () Bool)

(assert (=> mapNonEmpty!44882 m!1053747))

(declare-fun m!1053749 () Bool)

(assert (=> b!1142998 m!1053749))

(declare-fun m!1053751 () Bool)

(assert (=> b!1142998 m!1053751))

(declare-fun m!1053753 () Bool)

(assert (=> b!1142972 m!1053753))

(assert (=> b!1142988 m!1053701))

(declare-fun m!1053755 () Bool)

(assert (=> b!1142988 m!1053755))

(declare-fun m!1053757 () Bool)

(assert (=> bm!51620 m!1053757))

(check-sat (not b!1142974) (not start!98564) (not b!1142987) (not b!1142989) (not b!1142982) (not b!1142998) (not bm!51622) tp_is_empty!28705 (not bm!51619) (not b!1142983) (not bm!51616) b_and!39179 (not b_next!24175) (not b!1142975) (not mapNonEmpty!44882) (not b!1142976) (not b!1142986) (not b!1142996) (not bm!51623) (not b!1142977) (not b!1142979) (not bm!51620) (not b!1142988) (not b_lambda!19263) (not b!1142994) (not b!1142992))
(check-sat b_and!39179 (not b_next!24175))
