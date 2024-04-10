; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99002 () Bool)

(assert start!99002)

(declare-fun b_free!24607 () Bool)

(declare-fun b_next!24607 () Bool)

(assert (=> start!99002 (= b_free!24607 (not b_next!24607))))

(declare-fun tp!86531 () Bool)

(declare-fun b_and!40063 () Bool)

(assert (=> start!99002 (= tp!86531 b_and!40063)))

(declare-fun res!771325 () Bool)

(declare-fun e!661267 () Bool)

(assert (=> start!99002 (=> (not res!771325) (not e!661267))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75113 0))(
  ( (array!75114 (arr!36207 (Array (_ BitVec 32) (_ BitVec 64))) (size!36743 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75113)

(assert (=> start!99002 (= res!771325 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36743 _keys!1208))))))

(assert (=> start!99002 e!661267))

(declare-fun tp_is_empty!29137 () Bool)

(assert (=> start!99002 tp_is_empty!29137))

(declare-fun array_inv!27706 (array!75113) Bool)

(assert (=> start!99002 (array_inv!27706 _keys!1208)))

(assert (=> start!99002 true))

(assert (=> start!99002 tp!86531))

(declare-datatypes ((V!43977 0))(
  ( (V!43978 (val!14625 Int)) )
))
(declare-datatypes ((ValueCell!13859 0))(
  ( (ValueCellFull!13859 (v!17262 V!43977)) (EmptyCell!13859) )
))
(declare-datatypes ((array!75115 0))(
  ( (array!75116 (arr!36208 (Array (_ BitVec 32) ValueCell!13859)) (size!36744 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75115)

(declare-fun e!661278 () Bool)

(declare-fun array_inv!27707 (array!75115) Bool)

(assert (=> start!99002 (and (array_inv!27707 _values!996) e!661278)))

(declare-fun e!661268 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1162934 () Bool)

(declare-fun arrayContainsKey!0 (array!75113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162934 (= e!661268 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162935 () Bool)

(declare-fun res!771335 () Bool)

(assert (=> b!1162935 (=> (not res!771335) (not e!661267))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162935 (= res!771335 (validMask!0 mask!1564))))

(declare-fun b!1162936 () Bool)

(declare-datatypes ((Unit!38374 0))(
  ( (Unit!38375) )
))
(declare-fun e!661277 () Unit!38374)

(declare-fun e!661265 () Unit!38374)

(assert (=> b!1162936 (= e!661277 e!661265)))

(declare-fun c!116324 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!523767 () Bool)

(assert (=> b!1162936 (= c!116324 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523767))))

(declare-fun b!1162937 () Bool)

(declare-fun res!771330 () Bool)

(assert (=> b!1162937 (=> (not res!771330) (not e!661267))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162937 (= res!771330 (= (select (arr!36207 _keys!1208) i!673) k!934))))

(declare-fun b!1162938 () Bool)

(declare-fun e!661263 () Bool)

(assert (=> b!1162938 (= e!661263 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162939 () Bool)

(declare-fun e!661262 () Unit!38374)

(declare-fun Unit!38376 () Unit!38374)

(assert (=> b!1162939 (= e!661262 Unit!38376)))

(declare-fun e!661264 () Bool)

(declare-datatypes ((tuple2!18646 0))(
  ( (tuple2!18647 (_1!9334 (_ BitVec 64)) (_2!9334 V!43977)) )
))
(declare-datatypes ((List!25379 0))(
  ( (Nil!25376) (Cons!25375 (h!26584 tuple2!18646) (t!36978 List!25379)) )
))
(declare-datatypes ((ListLongMap!16615 0))(
  ( (ListLongMap!16616 (toList!8323 List!25379)) )
))
(declare-fun call!56830 () ListLongMap!16615)

(declare-fun b!1162940 () Bool)

(declare-fun call!56828 () ListLongMap!16615)

(declare-fun -!1428 (ListLongMap!16615 (_ BitVec 64)) ListLongMap!16615)

(assert (=> b!1162940 (= e!661264 (= call!56828 (-!1428 call!56830 k!934)))))

(declare-fun mapNonEmpty!45530 () Bool)

(declare-fun mapRes!45530 () Bool)

(declare-fun tp!86532 () Bool)

(declare-fun e!661269 () Bool)

(assert (=> mapNonEmpty!45530 (= mapRes!45530 (and tp!86532 e!661269))))

(declare-fun mapValue!45530 () ValueCell!13859)

(declare-fun mapRest!45530 () (Array (_ BitVec 32) ValueCell!13859))

(declare-fun mapKey!45530 () (_ BitVec 32))

(assert (=> mapNonEmpty!45530 (= (arr!36208 _values!996) (store mapRest!45530 mapKey!45530 mapValue!45530))))

(declare-fun b!1162941 () Bool)

(declare-fun Unit!38377 () Unit!38374)

(assert (=> b!1162941 (= e!661262 Unit!38377)))

(assert (=> b!1162941 (= lt!523767 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116322 () Bool)

(assert (=> b!1162941 (= c!116322 (and (not lt!523767) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523783 () Unit!38374)

(declare-fun e!661276 () Unit!38374)

(assert (=> b!1162941 (= lt!523783 e!661276)))

(declare-fun zeroValue!944 () V!43977)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!523771 () Unit!38374)

(declare-fun minValue!944 () V!43977)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!552 (array!75113 array!75115 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 64) (_ BitVec 32) Int) Unit!38374)

(assert (=> b!1162941 (= lt!523771 (lemmaListMapContainsThenArrayContainsFrom!552 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116323 () Bool)

(assert (=> b!1162941 (= c!116323 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771324 () Bool)

(assert (=> b!1162941 (= res!771324 e!661263)))

(assert (=> b!1162941 (=> (not res!771324) (not e!661268))))

(assert (=> b!1162941 e!661268))

(declare-fun lt!523770 () Unit!38374)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75113 (_ BitVec 32) (_ BitVec 32)) Unit!38374)

(assert (=> b!1162941 (= lt!523770 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25380 0))(
  ( (Nil!25377) (Cons!25376 (h!26585 (_ BitVec 64)) (t!36979 List!25380)) )
))
(declare-fun arrayNoDuplicates!0 (array!75113 (_ BitVec 32) List!25380) Bool)

(assert (=> b!1162941 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25377)))

(declare-fun lt!523778 () Unit!38374)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75113 (_ BitVec 64) (_ BitVec 32) List!25380) Unit!38374)

(assert (=> b!1162941 (= lt!523778 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25377))))

(assert (=> b!1162941 false))

(declare-fun lt!523776 () ListLongMap!16615)

(declare-fun c!116321 () Bool)

(declare-fun bm!56823 () Bool)

(declare-fun call!56833 () ListLongMap!16615)

(declare-fun +!3727 (ListLongMap!16615 tuple2!18646) ListLongMap!16615)

(assert (=> bm!56823 (= call!56833 (+!3727 lt!523776 (ite (or c!116322 c!116321) (tuple2!18647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1162942 () Bool)

(assert (=> b!1162942 (= e!661264 (= call!56828 call!56830))))

(declare-fun b!1162943 () Bool)

(assert (=> b!1162943 (= e!661263 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523767) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162944 () Bool)

(declare-fun e!661266 () Bool)

(assert (=> b!1162944 (= e!661266 true)))

(declare-fun e!661271 () Bool)

(assert (=> b!1162944 e!661271))

(declare-fun res!771333 () Bool)

(assert (=> b!1162944 (=> (not res!771333) (not e!661271))))

(declare-fun lt!523781 () ListLongMap!16615)

(assert (=> b!1162944 (= res!771333 (= lt!523781 lt!523776))))

(declare-fun lt!523779 () ListLongMap!16615)

(assert (=> b!1162944 (= lt!523781 (-!1428 lt!523779 k!934))))

(declare-fun lt!523773 () V!43977)

(assert (=> b!1162944 (= (-!1428 (+!3727 lt!523776 (tuple2!18647 (select (arr!36207 _keys!1208) from!1455) lt!523773)) (select (arr!36207 _keys!1208) from!1455)) lt!523776)))

(declare-fun lt!523772 () Unit!38374)

(declare-fun addThenRemoveForNewKeyIsSame!261 (ListLongMap!16615 (_ BitVec 64) V!43977) Unit!38374)

(assert (=> b!1162944 (= lt!523772 (addThenRemoveForNewKeyIsSame!261 lt!523776 (select (arr!36207 _keys!1208) from!1455) lt!523773))))

(declare-fun lt!523764 () V!43977)

(declare-fun get!18477 (ValueCell!13859 V!43977) V!43977)

(assert (=> b!1162944 (= lt!523773 (get!18477 (select (arr!36208 _values!996) from!1455) lt!523764))))

(declare-fun lt!523780 () Unit!38374)

(assert (=> b!1162944 (= lt!523780 e!661262)))

(declare-fun c!116325 () Bool)

(declare-fun contains!6827 (ListLongMap!16615 (_ BitVec 64)) Bool)

(assert (=> b!1162944 (= c!116325 (contains!6827 lt!523776 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4787 (array!75113 array!75115 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 32) Int) ListLongMap!16615)

(assert (=> b!1162944 (= lt!523776 (getCurrentListMapNoExtraKeys!4787 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162945 () Bool)

(declare-fun lt!523765 () Unit!38374)

(assert (=> b!1162945 (= e!661277 lt!523765)))

(declare-fun call!56831 () Unit!38374)

(assert (=> b!1162945 (= lt!523765 call!56831)))

(declare-fun call!56827 () Bool)

(assert (=> b!1162945 call!56827))

(declare-fun lt!523768 () array!75113)

(declare-fun bm!56824 () Bool)

(declare-fun lt!523769 () array!75115)

(assert (=> bm!56824 (= call!56828 (getCurrentListMapNoExtraKeys!4787 lt!523768 lt!523769 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162946 () Bool)

(declare-fun lt!523784 () ListLongMap!16615)

(assert (=> b!1162946 (contains!6827 (+!3727 lt!523784 (tuple2!18647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!523766 () Unit!38374)

(declare-fun call!56829 () Unit!38374)

(assert (=> b!1162946 (= lt!523766 call!56829)))

(declare-fun call!56826 () Bool)

(assert (=> b!1162946 call!56826))

(assert (=> b!1162946 (= lt!523784 call!56833)))

(declare-fun lt!523785 () Unit!38374)

(declare-fun addStillContains!967 (ListLongMap!16615 (_ BitVec 64) V!43977 (_ BitVec 64)) Unit!38374)

(assert (=> b!1162946 (= lt!523785 (addStillContains!967 lt!523776 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1162946 (= e!661276 lt!523766)))

(declare-fun b!1162947 () Bool)

(declare-fun res!771338 () Bool)

(assert (=> b!1162947 (=> (not res!771338) (not e!661267))))

(assert (=> b!1162947 (= res!771338 (and (= (size!36744 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36743 _keys!1208) (size!36744 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56825 () Bool)

(assert (=> bm!56825 (= call!56830 (getCurrentListMapNoExtraKeys!4787 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162948 () Bool)

(declare-fun e!661275 () Bool)

(assert (=> b!1162948 (= e!661278 (and e!661275 mapRes!45530))))

(declare-fun condMapEmpty!45530 () Bool)

(declare-fun mapDefault!45530 () ValueCell!13859)

