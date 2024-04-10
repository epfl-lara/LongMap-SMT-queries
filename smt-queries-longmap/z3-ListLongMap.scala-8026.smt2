; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98998 () Bool)

(assert start!98998)

(declare-fun b_free!24603 () Bool)

(declare-fun b_next!24603 () Bool)

(assert (=> start!98998 (= b_free!24603 (not b_next!24603))))

(declare-fun tp!86520 () Bool)

(declare-fun b_and!40055 () Bool)

(assert (=> start!98998 (= tp!86520 b_and!40055)))

(declare-datatypes ((V!43971 0))(
  ( (V!43972 (val!14623 Int)) )
))
(declare-fun zeroValue!944 () V!43971)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13857 0))(
  ( (ValueCellFull!13857 (v!17260 V!43971)) (EmptyCell!13857) )
))
(declare-datatypes ((array!75105 0))(
  ( (array!75106 (arr!36203 (Array (_ BitVec 32) ValueCell!13857)) (size!36739 (_ BitVec 32))) )
))
(declare-fun lt!523648 () array!75105)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!56775 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43971)

(declare-datatypes ((array!75107 0))(
  ( (array!75108 (arr!36204 (Array (_ BitVec 32) (_ BitVec 64))) (size!36740 (_ BitVec 32))) )
))
(declare-fun lt!523650 () array!75107)

(declare-datatypes ((tuple2!18642 0))(
  ( (tuple2!18643 (_1!9332 (_ BitVec 64)) (_2!9332 V!43971)) )
))
(declare-datatypes ((List!25376 0))(
  ( (Nil!25373) (Cons!25372 (h!26581 tuple2!18642) (t!36971 List!25376)) )
))
(declare-datatypes ((ListLongMap!16611 0))(
  ( (ListLongMap!16612 (toList!8321 List!25376)) )
))
(declare-fun call!56780 () ListLongMap!16611)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4785 (array!75107 array!75105 (_ BitVec 32) (_ BitVec 32) V!43971 V!43971 (_ BitVec 32) Int) ListLongMap!16611)

(assert (=> bm!56775 (= call!56780 (getCurrentListMapNoExtraKeys!4785 lt!523650 lt!523648 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162750 () Bool)

(declare-fun e!661172 () Bool)

(declare-fun e!661166 () Bool)

(assert (=> b!1162750 (= e!661172 e!661166)))

(declare-fun res!771239 () Bool)

(assert (=> b!1162750 (=> res!771239 e!661166)))

(declare-fun _keys!1208 () array!75107)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1162750 (= res!771239 (not (= (select (arr!36204 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661175 () Bool)

(assert (=> b!1162750 e!661175))

(declare-fun c!116289 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162750 (= c!116289 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!38369 0))(
  ( (Unit!38370) )
))
(declare-fun lt!523651 () Unit!38369)

(declare-fun _values!996 () array!75105)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!656 (array!75107 array!75105 (_ BitVec 32) (_ BitVec 32) V!43971 V!43971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38369)

(assert (=> b!1162750 (= lt!523651 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!656 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162751 () Bool)

(declare-fun c!116285 () Bool)

(declare-fun lt!523653 () Bool)

(assert (=> b!1162751 (= c!116285 (and (not lt!523653) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661165 () Unit!38369)

(declare-fun e!661167 () Unit!38369)

(assert (=> b!1162751 (= e!661165 e!661167)))

(declare-fun b!1162752 () Bool)

(declare-fun res!771235 () Bool)

(declare-fun e!661169 () Bool)

(assert (=> b!1162752 (=> (not res!771235) (not e!661169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162752 (= res!771235 (validKeyInArray!0 k0!934))))

(declare-fun bm!56776 () Bool)

(declare-fun call!56784 () ListLongMap!16611)

(declare-fun call!56782 () ListLongMap!16611)

(assert (=> bm!56776 (= call!56784 call!56782)))

(declare-fun b!1162753 () Bool)

(declare-fun call!56785 () ListLongMap!16611)

(assert (=> b!1162753 (= e!661175 (= call!56780 call!56785))))

(declare-fun b!1162754 () Bool)

(declare-fun lt!523652 () Unit!38369)

(assert (=> b!1162754 (= e!661167 lt!523652)))

(declare-fun call!56778 () Unit!38369)

(assert (=> b!1162754 (= lt!523652 call!56778)))

(declare-fun call!56779 () Bool)

(assert (=> b!1162754 call!56779))

(declare-fun b!1162755 () Bool)

(assert (=> b!1162755 (= e!661166 true)))

(declare-fun e!661163 () Bool)

(assert (=> b!1162755 e!661163))

(declare-fun res!771243 () Bool)

(assert (=> b!1162755 (=> (not res!771243) (not e!661163))))

(declare-fun lt!523642 () ListLongMap!16611)

(declare-fun lt!523649 () ListLongMap!16611)

(assert (=> b!1162755 (= res!771243 (= lt!523642 lt!523649))))

(declare-fun lt!523644 () ListLongMap!16611)

(declare-fun -!1427 (ListLongMap!16611 (_ BitVec 64)) ListLongMap!16611)

(assert (=> b!1162755 (= lt!523642 (-!1427 lt!523644 k0!934))))

(declare-fun lt!523634 () V!43971)

(declare-fun +!3725 (ListLongMap!16611 tuple2!18642) ListLongMap!16611)

(assert (=> b!1162755 (= (-!1427 (+!3725 lt!523649 (tuple2!18643 (select (arr!36204 _keys!1208) from!1455) lt!523634)) (select (arr!36204 _keys!1208) from!1455)) lt!523649)))

(declare-fun lt!523638 () Unit!38369)

(declare-fun addThenRemoveForNewKeyIsSame!260 (ListLongMap!16611 (_ BitVec 64) V!43971) Unit!38369)

(assert (=> b!1162755 (= lt!523638 (addThenRemoveForNewKeyIsSame!260 lt!523649 (select (arr!36204 _keys!1208) from!1455) lt!523634))))

(declare-fun lt!523633 () V!43971)

(declare-fun get!18474 (ValueCell!13857 V!43971) V!43971)

(assert (=> b!1162755 (= lt!523634 (get!18474 (select (arr!36203 _values!996) from!1455) lt!523633))))

(declare-fun lt!523643 () Unit!38369)

(declare-fun e!661174 () Unit!38369)

(assert (=> b!1162755 (= lt!523643 e!661174)))

(declare-fun c!116290 () Bool)

(declare-fun contains!6826 (ListLongMap!16611 (_ BitVec 64)) Bool)

(assert (=> b!1162755 (= c!116290 (contains!6826 lt!523649 k0!934))))

(assert (=> b!1162755 (= lt!523649 (getCurrentListMapNoExtraKeys!4785 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162756 () Bool)

(declare-fun res!771237 () Bool)

(assert (=> b!1162756 (=> (not res!771237) (not e!661169))))

(assert (=> b!1162756 (= res!771237 (and (= (size!36739 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36740 _keys!1208) (size!36739 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162757 () Bool)

(assert (=> b!1162757 (= e!661175 (= call!56780 (-!1427 call!56785 k0!934)))))

(declare-fun b!1162758 () Bool)

(declare-fun Unit!38371 () Unit!38369)

(assert (=> b!1162758 (= e!661174 Unit!38371)))

(assert (=> b!1162758 (= lt!523653 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116286 () Bool)

(assert (=> b!1162758 (= c!116286 (and (not lt!523653) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523632 () Unit!38369)

(assert (=> b!1162758 (= lt!523632 e!661165)))

(declare-fun lt!523647 () Unit!38369)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!551 (array!75107 array!75105 (_ BitVec 32) (_ BitVec 32) V!43971 V!43971 (_ BitVec 64) (_ BitVec 32) Int) Unit!38369)

(assert (=> b!1162758 (= lt!523647 (lemmaListMapContainsThenArrayContainsFrom!551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116288 () Bool)

(assert (=> b!1162758 (= c!116288 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771244 () Bool)

(declare-fun e!661168 () Bool)

(assert (=> b!1162758 (= res!771244 e!661168)))

(declare-fun e!661161 () Bool)

(assert (=> b!1162758 (=> (not res!771244) (not e!661161))))

(assert (=> b!1162758 e!661161))

(declare-fun lt!523640 () Unit!38369)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75107 (_ BitVec 32) (_ BitVec 32)) Unit!38369)

(assert (=> b!1162758 (= lt!523640 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25377 0))(
  ( (Nil!25374) (Cons!25373 (h!26582 (_ BitVec 64)) (t!36972 List!25377)) )
))
(declare-fun arrayNoDuplicates!0 (array!75107 (_ BitVec 32) List!25377) Bool)

(assert (=> b!1162758 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25374)))

(declare-fun lt!523645 () Unit!38369)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75107 (_ BitVec 64) (_ BitVec 32) List!25377) Unit!38369)

(assert (=> b!1162758 (= lt!523645 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25374))))

(assert (=> b!1162758 false))

(declare-fun b!1162759 () Bool)

(declare-fun e!661164 () Unit!38369)

(declare-fun Unit!38372 () Unit!38369)

(assert (=> b!1162759 (= e!661164 Unit!38372)))

(declare-fun bm!56777 () Bool)

(declare-fun call!56781 () Unit!38369)

(assert (=> bm!56777 (= call!56778 call!56781)))

(declare-fun b!1162760 () Bool)

(assert (=> b!1162760 (= e!661163 (= lt!523642 (getCurrentListMapNoExtraKeys!4785 lt!523650 lt!523648 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56778 () Bool)

(declare-fun call!56783 () Bool)

(assert (=> bm!56778 (= call!56779 call!56783)))

(declare-fun res!771248 () Bool)

(assert (=> start!98998 (=> (not res!771248) (not e!661169))))

(assert (=> start!98998 (= res!771248 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36740 _keys!1208))))))

(assert (=> start!98998 e!661169))

(declare-fun tp_is_empty!29133 () Bool)

(assert (=> start!98998 tp_is_empty!29133))

(declare-fun array_inv!27704 (array!75107) Bool)

(assert (=> start!98998 (array_inv!27704 _keys!1208)))

(assert (=> start!98998 true))

(assert (=> start!98998 tp!86520))

(declare-fun e!661160 () Bool)

(declare-fun array_inv!27705 (array!75105) Bool)

(assert (=> start!98998 (and (array_inv!27705 _values!996) e!661160)))

(declare-fun bm!56779 () Bool)

(declare-fun lt!523637 () ListLongMap!16611)

(assert (=> bm!56779 (= call!56782 (+!3725 (ite c!116286 lt!523637 lt!523649) (ite c!116286 (tuple2!18643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116285 (tuple2!18643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1162761 () Bool)

(declare-fun res!771246 () Bool)

(declare-fun e!661162 () Bool)

(assert (=> b!1162761 (=> (not res!771246) (not e!661162))))

(assert (=> b!1162761 (= res!771246 (arrayNoDuplicates!0 lt!523650 #b00000000000000000000000000000000 Nil!25374))))

(declare-fun b!1162762 () Bool)

(declare-fun e!661170 () Bool)

(declare-fun mapRes!45524 () Bool)

(assert (=> b!1162762 (= e!661160 (and e!661170 mapRes!45524))))

(declare-fun condMapEmpty!45524 () Bool)

(declare-fun mapDefault!45524 () ValueCell!13857)

(assert (=> b!1162762 (= condMapEmpty!45524 (= (arr!36203 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13857)) mapDefault!45524)))))

(declare-fun bm!56780 () Bool)

(declare-fun addStillContains!966 (ListLongMap!16611 (_ BitVec 64) V!43971 (_ BitVec 64)) Unit!38369)

(assert (=> bm!56780 (= call!56781 (addStillContains!966 lt!523649 (ite (or c!116286 c!116285) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116286 c!116285) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162763 () Bool)

(assert (=> b!1162763 (= e!661168 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523653) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162764 () Bool)

(declare-fun Unit!38373 () Unit!38369)

(assert (=> b!1162764 (= e!661174 Unit!38373)))

(declare-fun b!1162765 () Bool)

(declare-fun res!771247 () Bool)

(assert (=> b!1162765 (=> (not res!771247) (not e!661169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162765 (= res!771247 (validMask!0 mask!1564))))

(declare-fun b!1162766 () Bool)

(assert (=> b!1162766 (= e!661169 e!661162)))

(declare-fun res!771242 () Bool)

(assert (=> b!1162766 (=> (not res!771242) (not e!661162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75107 (_ BitVec 32)) Bool)

(assert (=> b!1162766 (= res!771242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523650 mask!1564))))

(assert (=> b!1162766 (= lt!523650 (array!75108 (store (arr!36204 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36740 _keys!1208)))))

(declare-fun b!1162767 () Bool)

(declare-fun e!661176 () Bool)

(assert (=> b!1162767 (= e!661176 e!661172)))

(declare-fun res!771236 () Bool)

(assert (=> b!1162767 (=> res!771236 e!661172)))

(assert (=> b!1162767 (= res!771236 (not (= from!1455 i!673)))))

(declare-fun lt!523641 () ListLongMap!16611)

(assert (=> b!1162767 (= lt!523641 (getCurrentListMapNoExtraKeys!4785 lt!523650 lt!523648 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1162767 (= lt!523648 (array!75106 (store (arr!36203 _values!996) i!673 (ValueCellFull!13857 lt!523633)) (size!36739 _values!996)))))

(declare-fun dynLambda!2781 (Int (_ BitVec 64)) V!43971)

(assert (=> b!1162767 (= lt!523633 (dynLambda!2781 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1162767 (= lt!523644 (getCurrentListMapNoExtraKeys!4785 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162768 () Bool)

(declare-fun arrayContainsKey!0 (array!75107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162768 (= e!661168 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162769 () Bool)

(assert (=> b!1162769 call!56779))

(declare-fun lt!523635 () Unit!38369)

(assert (=> b!1162769 (= lt!523635 call!56778)))

(assert (=> b!1162769 (= e!661164 lt!523635)))

(declare-fun b!1162770 () Bool)

(declare-fun res!771234 () Bool)

(assert (=> b!1162770 (=> (not res!771234) (not e!661169))))

(assert (=> b!1162770 (= res!771234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162771 () Bool)

(declare-fun res!771238 () Bool)

(assert (=> b!1162771 (=> (not res!771238) (not e!661169))))

(assert (=> b!1162771 (= res!771238 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36740 _keys!1208))))))

(declare-fun mapNonEmpty!45524 () Bool)

(declare-fun tp!86519 () Bool)

(declare-fun e!661171 () Bool)

(assert (=> mapNonEmpty!45524 (= mapRes!45524 (and tp!86519 e!661171))))

(declare-fun mapValue!45524 () ValueCell!13857)

(declare-fun mapRest!45524 () (Array (_ BitVec 32) ValueCell!13857))

(declare-fun mapKey!45524 () (_ BitVec 32))

(assert (=> mapNonEmpty!45524 (= (arr!36203 _values!996) (store mapRest!45524 mapKey!45524 mapValue!45524))))

(declare-fun b!1162772 () Bool)

(declare-fun res!771240 () Bool)

(assert (=> b!1162772 (=> (not res!771240) (not e!661169))))

(assert (=> b!1162772 (= res!771240 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25374))))

(declare-fun b!1162773 () Bool)

(assert (=> b!1162773 (= e!661167 e!661164)))

(declare-fun c!116287 () Bool)

(assert (=> b!1162773 (= c!116287 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523653))))

(declare-fun b!1162774 () Bool)

(assert (=> b!1162774 (= e!661162 (not e!661176))))

(declare-fun res!771245 () Bool)

(assert (=> b!1162774 (=> res!771245 e!661176)))

(assert (=> b!1162774 (= res!771245 (bvsgt from!1455 i!673))))

(assert (=> b!1162774 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523646 () Unit!38369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75107 (_ BitVec 64) (_ BitVec 32)) Unit!38369)

(assert (=> b!1162774 (= lt!523646 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162775 () Bool)

(assert (=> b!1162775 (contains!6826 call!56782 k0!934)))

(declare-fun lt!523639 () Unit!38369)

(assert (=> b!1162775 (= lt!523639 (addStillContains!966 lt!523637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1162775 call!56783))

(assert (=> b!1162775 (= lt!523637 (+!3725 lt!523649 (tuple2!18643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523636 () Unit!38369)

(assert (=> b!1162775 (= lt!523636 call!56781)))

(assert (=> b!1162775 (= e!661165 lt!523639)))

(declare-fun b!1162776 () Bool)

(assert (=> b!1162776 (= e!661170 tp_is_empty!29133)))

(declare-fun bm!56781 () Bool)

(assert (=> bm!56781 (= call!56785 (getCurrentListMapNoExtraKeys!4785 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56782 () Bool)

(assert (=> bm!56782 (= call!56783 (contains!6826 (ite c!116286 lt!523637 call!56784) k0!934))))

(declare-fun b!1162777 () Bool)

(assert (=> b!1162777 (= e!661161 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162778 () Bool)

(assert (=> b!1162778 (= e!661171 tp_is_empty!29133)))

(declare-fun b!1162779 () Bool)

(declare-fun res!771241 () Bool)

(assert (=> b!1162779 (=> (not res!771241) (not e!661169))))

(assert (=> b!1162779 (= res!771241 (= (select (arr!36204 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45524 () Bool)

(assert (=> mapIsEmpty!45524 mapRes!45524))

(assert (= (and start!98998 res!771248) b!1162765))

(assert (= (and b!1162765 res!771247) b!1162756))

(assert (= (and b!1162756 res!771237) b!1162770))

(assert (= (and b!1162770 res!771234) b!1162772))

(assert (= (and b!1162772 res!771240) b!1162771))

(assert (= (and b!1162771 res!771238) b!1162752))

(assert (= (and b!1162752 res!771235) b!1162779))

(assert (= (and b!1162779 res!771241) b!1162766))

(assert (= (and b!1162766 res!771242) b!1162761))

(assert (= (and b!1162761 res!771246) b!1162774))

(assert (= (and b!1162774 (not res!771245)) b!1162767))

(assert (= (and b!1162767 (not res!771236)) b!1162750))

(assert (= (and b!1162750 c!116289) b!1162757))

(assert (= (and b!1162750 (not c!116289)) b!1162753))

(assert (= (or b!1162757 b!1162753) bm!56775))

(assert (= (or b!1162757 b!1162753) bm!56781))

(assert (= (and b!1162750 (not res!771239)) b!1162755))

(assert (= (and b!1162755 c!116290) b!1162758))

(assert (= (and b!1162755 (not c!116290)) b!1162764))

(assert (= (and b!1162758 c!116286) b!1162775))

(assert (= (and b!1162758 (not c!116286)) b!1162751))

(assert (= (and b!1162751 c!116285) b!1162754))

(assert (= (and b!1162751 (not c!116285)) b!1162773))

(assert (= (and b!1162773 c!116287) b!1162769))

(assert (= (and b!1162773 (not c!116287)) b!1162759))

(assert (= (or b!1162754 b!1162769) bm!56777))

(assert (= (or b!1162754 b!1162769) bm!56776))

(assert (= (or b!1162754 b!1162769) bm!56778))

(assert (= (or b!1162775 bm!56778) bm!56782))

(assert (= (or b!1162775 bm!56777) bm!56780))

(assert (= (or b!1162775 bm!56776) bm!56779))

(assert (= (and b!1162758 c!116288) b!1162768))

(assert (= (and b!1162758 (not c!116288)) b!1162763))

(assert (= (and b!1162758 res!771244) b!1162777))

(assert (= (and b!1162755 res!771243) b!1162760))

(assert (= (and b!1162762 condMapEmpty!45524) mapIsEmpty!45524))

(assert (= (and b!1162762 (not condMapEmpty!45524)) mapNonEmpty!45524))

(get-info :version)

(assert (= (and mapNonEmpty!45524 ((_ is ValueCellFull!13857) mapValue!45524)) b!1162778))

(assert (= (and b!1162762 ((_ is ValueCellFull!13857) mapDefault!45524)) b!1162776))

(assert (= start!98998 b!1162762))

(declare-fun b_lambda!19709 () Bool)

(assert (=> (not b_lambda!19709) (not b!1162767)))

(declare-fun t!36970 () Bool)

(declare-fun tb!9415 () Bool)

(assert (=> (and start!98998 (= defaultEntry!1004 defaultEntry!1004) t!36970) tb!9415))

(declare-fun result!19395 () Bool)

(assert (=> tb!9415 (= result!19395 tp_is_empty!29133)))

(assert (=> b!1162767 t!36970))

(declare-fun b_and!40057 () Bool)

(assert (= b_and!40055 (and (=> t!36970 result!19395) b_and!40057)))

(declare-fun m!1071409 () Bool)

(assert (=> b!1162757 m!1071409))

(declare-fun m!1071411 () Bool)

(assert (=> b!1162766 m!1071411))

(declare-fun m!1071413 () Bool)

(assert (=> b!1162766 m!1071413))

(declare-fun m!1071415 () Bool)

(assert (=> b!1162761 m!1071415))

(declare-fun m!1071417 () Bool)

(assert (=> bm!56779 m!1071417))

(declare-fun m!1071419 () Bool)

(assert (=> b!1162760 m!1071419))

(declare-fun m!1071421 () Bool)

(assert (=> mapNonEmpty!45524 m!1071421))

(declare-fun m!1071423 () Bool)

(assert (=> b!1162765 m!1071423))

(declare-fun m!1071425 () Bool)

(assert (=> bm!56780 m!1071425))

(declare-fun m!1071427 () Bool)

(assert (=> b!1162752 m!1071427))

(declare-fun m!1071429 () Bool)

(assert (=> b!1162755 m!1071429))

(declare-fun m!1071431 () Bool)

(assert (=> b!1162755 m!1071431))

(declare-fun m!1071433 () Bool)

(assert (=> b!1162755 m!1071433))

(declare-fun m!1071435 () Bool)

(assert (=> b!1162755 m!1071435))

(declare-fun m!1071437 () Bool)

(assert (=> b!1162755 m!1071437))

(declare-fun m!1071439 () Bool)

(assert (=> b!1162755 m!1071439))

(declare-fun m!1071441 () Bool)

(assert (=> b!1162755 m!1071441))

(assert (=> b!1162755 m!1071437))

(assert (=> b!1162755 m!1071431))

(assert (=> b!1162755 m!1071439))

(declare-fun m!1071443 () Bool)

(assert (=> b!1162755 m!1071443))

(declare-fun m!1071445 () Bool)

(assert (=> b!1162755 m!1071445))

(assert (=> b!1162755 m!1071439))

(declare-fun m!1071447 () Bool)

(assert (=> b!1162775 m!1071447))

(declare-fun m!1071449 () Bool)

(assert (=> b!1162775 m!1071449))

(declare-fun m!1071451 () Bool)

(assert (=> b!1162775 m!1071451))

(assert (=> b!1162750 m!1071439))

(declare-fun m!1071453 () Bool)

(assert (=> b!1162750 m!1071453))

(assert (=> bm!56775 m!1071419))

(declare-fun m!1071455 () Bool)

(assert (=> b!1162768 m!1071455))

(assert (=> b!1162777 m!1071455))

(declare-fun m!1071457 () Bool)

(assert (=> b!1162767 m!1071457))

(declare-fun m!1071459 () Bool)

(assert (=> b!1162767 m!1071459))

(declare-fun m!1071461 () Bool)

(assert (=> b!1162767 m!1071461))

(declare-fun m!1071463 () Bool)

(assert (=> b!1162767 m!1071463))

(declare-fun m!1071465 () Bool)

(assert (=> start!98998 m!1071465))

(declare-fun m!1071467 () Bool)

(assert (=> start!98998 m!1071467))

(declare-fun m!1071469 () Bool)

(assert (=> b!1162758 m!1071469))

(declare-fun m!1071471 () Bool)

(assert (=> b!1162758 m!1071471))

(declare-fun m!1071473 () Bool)

(assert (=> b!1162758 m!1071473))

(declare-fun m!1071475 () Bool)

(assert (=> b!1162758 m!1071475))

(assert (=> bm!56781 m!1071429))

(declare-fun m!1071477 () Bool)

(assert (=> b!1162774 m!1071477))

(declare-fun m!1071479 () Bool)

(assert (=> b!1162774 m!1071479))

(declare-fun m!1071481 () Bool)

(assert (=> b!1162779 m!1071481))

(declare-fun m!1071483 () Bool)

(assert (=> bm!56782 m!1071483))

(declare-fun m!1071485 () Bool)

(assert (=> b!1162770 m!1071485))

(declare-fun m!1071487 () Bool)

(assert (=> b!1162772 m!1071487))

(check-sat (not b!1162775) (not b!1162757) (not b!1162752) (not bm!56782) (not b!1162765) (not mapNonEmpty!45524) (not b!1162750) (not bm!56775) (not b!1162768) (not b!1162767) (not b!1162772) (not b!1162766) (not bm!56780) (not bm!56779) (not start!98998) (not b!1162777) (not b!1162758) (not b!1162774) b_and!40057 (not b!1162761) (not b!1162760) (not b!1162770) tp_is_empty!29133 (not b_lambda!19709) (not b_next!24603) (not b!1162755) (not bm!56781))
(check-sat b_and!40057 (not b_next!24603))
