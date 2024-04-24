; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98692 () Bool)

(assert start!98692)

(declare-fun b_free!24061 () Bool)

(declare-fun b_next!24061 () Bool)

(assert (=> start!98692 (= b_free!24061 (not b_next!24061))))

(declare-fun tp!84893 () Bool)

(declare-fun b_and!38973 () Bool)

(assert (=> start!98692 (= tp!84893 b_and!38973)))

(declare-fun e!648391 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1139312 () Bool)

(declare-fun lt!506717 () Bool)

(assert (=> b!1139312 (= e!648391 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506717) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!50336 () Bool)

(declare-datatypes ((Unit!37262 0))(
  ( (Unit!37263) )
))
(declare-fun call!50342 () Unit!37262)

(declare-fun call!50346 () Unit!37262)

(assert (=> bm!50336 (= call!50342 call!50346)))

(declare-fun b!1139314 () Bool)

(declare-fun e!648383 () Bool)

(declare-fun tp_is_empty!28591 () Bool)

(assert (=> b!1139314 (= e!648383 tp_is_empty!28591)))

(declare-fun b!1139315 () Bool)

(declare-fun e!648385 () Bool)

(assert (=> b!1139315 (= e!648385 true)))

(declare-fun lt!506721 () Unit!37262)

(declare-fun e!648381 () Unit!37262)

(assert (=> b!1139315 (= lt!506721 e!648381)))

(declare-fun c!111808 () Bool)

(declare-datatypes ((V!43249 0))(
  ( (V!43250 (val!14352 Int)) )
))
(declare-datatypes ((tuple2!18142 0))(
  ( (tuple2!18143 (_1!9082 (_ BitVec 64)) (_2!9082 V!43249)) )
))
(declare-datatypes ((List!24906 0))(
  ( (Nil!24903) (Cons!24902 (h!26120 tuple2!18142) (t!35951 List!24906)) )
))
(declare-datatypes ((ListLongMap!16119 0))(
  ( (ListLongMap!16120 (toList!8075 List!24906)) )
))
(declare-fun lt!506720 () ListLongMap!16119)

(declare-fun contains!6625 (ListLongMap!16119 (_ BitVec 64)) Bool)

(assert (=> b!1139315 (= c!111808 (contains!6625 lt!506720 k0!934))))

(declare-fun zeroValue!944 () V!43249)

(declare-datatypes ((array!74083 0))(
  ( (array!74084 (arr!35686 (Array (_ BitVec 32) (_ BitVec 64))) (size!36223 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74083)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13586 0))(
  ( (ValueCellFull!13586 (v!16985 V!43249)) (EmptyCell!13586) )
))
(declare-datatypes ((array!74085 0))(
  ( (array!74086 (arr!35687 (Array (_ BitVec 32) ValueCell!13586)) (size!36224 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74085)

(declare-fun minValue!944 () V!43249)

(declare-fun getCurrentListMapNoExtraKeys!4585 (array!74083 array!74085 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 32) Int) ListLongMap!16119)

(assert (=> b!1139315 (= lt!506720 (getCurrentListMapNoExtraKeys!4585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!50340 () ListLongMap!16119)

(declare-fun bm!50337 () Bool)

(declare-fun c!111810 () Bool)

(declare-fun c!111805 () Bool)

(declare-fun +!3527 (ListLongMap!16119 tuple2!18142) ListLongMap!16119)

(assert (=> bm!50337 (= call!50340 (+!3527 lt!506720 (ite (or c!111805 c!111810) (tuple2!18143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapNonEmpty!44711 () Bool)

(declare-fun mapRes!44711 () Bool)

(declare-fun tp!84894 () Bool)

(declare-fun e!648382 () Bool)

(assert (=> mapNonEmpty!44711 (= mapRes!44711 (and tp!84894 e!648382))))

(declare-fun mapValue!44711 () ValueCell!13586)

(declare-fun mapKey!44711 () (_ BitVec 32))

(declare-fun mapRest!44711 () (Array (_ BitVec 32) ValueCell!13586))

(assert (=> mapNonEmpty!44711 (= (arr!35687 _values!996) (store mapRest!44711 mapKey!44711 mapValue!44711))))

(declare-fun bm!50338 () Bool)

(declare-fun addStillContains!754 (ListLongMap!16119 (_ BitVec 64) V!43249 (_ BitVec 64)) Unit!37262)

(assert (=> bm!50338 (= call!50346 (addStillContains!754 lt!506720 (ite (or c!111805 c!111810) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111805 c!111810) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1139316 () Bool)

(declare-fun e!648384 () Unit!37262)

(declare-fun Unit!37264 () Unit!37262)

(assert (=> b!1139316 (= e!648384 Unit!37264)))

(declare-fun bm!50339 () Bool)

(declare-fun lt!506725 () array!74085)

(declare-fun call!50345 () ListLongMap!16119)

(declare-fun lt!506732 () array!74083)

(assert (=> bm!50339 (= call!50345 (getCurrentListMapNoExtraKeys!4585 lt!506732 lt!506725 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139317 () Bool)

(declare-fun res!759763 () Bool)

(declare-fun e!648389 () Bool)

(assert (=> b!1139317 (=> (not res!759763) (not e!648389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139317 (= res!759763 (validMask!0 mask!1564))))

(declare-fun lt!506722 () ListLongMap!16119)

(declare-fun call!50341 () ListLongMap!16119)

(declare-fun call!50339 () Bool)

(declare-fun bm!50340 () Bool)

(assert (=> bm!50340 (= call!50339 (contains!6625 (ite c!111805 lt!506722 call!50341) k0!934))))

(declare-fun b!1139318 () Bool)

(declare-fun e!648377 () Bool)

(declare-fun e!648379 () Bool)

(assert (=> b!1139318 (= e!648377 e!648379)))

(declare-fun res!759756 () Bool)

(assert (=> b!1139318 (=> res!759756 e!648379)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139318 (= res!759756 (not (= from!1455 i!673)))))

(declare-fun lt!506718 () ListLongMap!16119)

(assert (=> b!1139318 (= lt!506718 (getCurrentListMapNoExtraKeys!4585 lt!506732 lt!506725 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2633 (Int (_ BitVec 64)) V!43249)

(assert (=> b!1139318 (= lt!506725 (array!74086 (store (arr!35687 _values!996) i!673 (ValueCellFull!13586 (dynLambda!2633 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36224 _values!996)))))

(declare-fun lt!506719 () ListLongMap!16119)

(assert (=> b!1139318 (= lt!506719 (getCurrentListMapNoExtraKeys!4585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139319 () Bool)

(declare-fun e!648390 () Bool)

(assert (=> b!1139319 (= e!648389 e!648390)))

(declare-fun res!759764 () Bool)

(assert (=> b!1139319 (=> (not res!759764) (not e!648390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74083 (_ BitVec 32)) Bool)

(assert (=> b!1139319 (= res!759764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506732 mask!1564))))

(assert (=> b!1139319 (= lt!506732 (array!74084 (store (arr!35686 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36223 _keys!1208)))))

(declare-fun b!1139320 () Bool)

(declare-fun e!648388 () Bool)

(declare-fun call!50344 () ListLongMap!16119)

(assert (=> b!1139320 (= e!648388 (= call!50345 call!50344))))

(declare-fun b!1139321 () Bool)

(declare-fun res!759759 () Bool)

(assert (=> b!1139321 (=> (not res!759759) (not e!648389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139321 (= res!759759 (validKeyInArray!0 k0!934))))

(declare-fun b!1139322 () Bool)

(assert (=> b!1139322 (= e!648382 tp_is_empty!28591)))

(declare-fun b!1139323 () Bool)

(declare-fun res!759761 () Bool)

(assert (=> b!1139323 (=> (not res!759761) (not e!648389))))

(declare-datatypes ((List!24907 0))(
  ( (Nil!24904) (Cons!24903 (h!26121 (_ BitVec 64)) (t!35952 List!24907)) )
))
(declare-fun arrayNoDuplicates!0 (array!74083 (_ BitVec 32) List!24907) Bool)

(assert (=> b!1139323 (= res!759761 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24904))))

(declare-fun b!1139324 () Bool)

(declare-fun -!1213 (ListLongMap!16119 (_ BitVec 64)) ListLongMap!16119)

(assert (=> b!1139324 (= e!648388 (= call!50345 (-!1213 call!50344 k0!934)))))

(declare-fun b!1139325 () Bool)

(declare-fun e!648380 () Unit!37262)

(declare-fun lt!506726 () Unit!37262)

(assert (=> b!1139325 (= e!648380 lt!506726)))

(assert (=> b!1139325 (= lt!506726 call!50342)))

(declare-fun call!50343 () Bool)

(assert (=> b!1139325 call!50343))

(declare-fun res!759762 () Bool)

(assert (=> start!98692 (=> (not res!759762) (not e!648389))))

(assert (=> start!98692 (= res!759762 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36223 _keys!1208))))))

(assert (=> start!98692 e!648389))

(assert (=> start!98692 tp_is_empty!28591))

(declare-fun array_inv!27406 (array!74083) Bool)

(assert (=> start!98692 (array_inv!27406 _keys!1208)))

(assert (=> start!98692 true))

(assert (=> start!98692 tp!84893))

(declare-fun e!648376 () Bool)

(declare-fun array_inv!27407 (array!74085) Bool)

(assert (=> start!98692 (and (array_inv!27407 _values!996) e!648376)))

(declare-fun b!1139313 () Bool)

(declare-fun res!759755 () Bool)

(assert (=> b!1139313 (=> (not res!759755) (not e!648389))))

(assert (=> b!1139313 (= res!759755 (= (select (arr!35686 _keys!1208) i!673) k0!934))))

(declare-fun b!1139326 () Bool)

(declare-fun res!759758 () Bool)

(assert (=> b!1139326 (=> (not res!759758) (not e!648390))))

(assert (=> b!1139326 (= res!759758 (arrayNoDuplicates!0 lt!506732 #b00000000000000000000000000000000 Nil!24904))))

(declare-fun b!1139327 () Bool)

(declare-fun res!759760 () Bool)

(assert (=> b!1139327 (=> (not res!759760) (not e!648389))))

(assert (=> b!1139327 (= res!759760 (and (= (size!36224 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36223 _keys!1208) (size!36224 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139328 () Bool)

(assert (=> b!1139328 call!50343))

(declare-fun lt!506731 () Unit!37262)

(assert (=> b!1139328 (= lt!506731 call!50342)))

(assert (=> b!1139328 (= e!648384 lt!506731)))

(declare-fun b!1139329 () Bool)

(declare-fun res!759753 () Bool)

(assert (=> b!1139329 (=> (not res!759753) (not e!648389))))

(assert (=> b!1139329 (= res!759753 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36223 _keys!1208))))))

(declare-fun b!1139330 () Bool)

(declare-fun Unit!37265 () Unit!37262)

(assert (=> b!1139330 (= e!648381 Unit!37265)))

(declare-fun bm!50341 () Bool)

(assert (=> bm!50341 (= call!50341 call!50340)))

(declare-fun b!1139331 () Bool)

(assert (=> b!1139331 (= e!648390 (not e!648377))))

(declare-fun res!759752 () Bool)

(assert (=> b!1139331 (=> res!759752 e!648377)))

(assert (=> b!1139331 (= res!759752 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139331 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506728 () Unit!37262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74083 (_ BitVec 64) (_ BitVec 32)) Unit!37262)

(assert (=> b!1139331 (= lt!506728 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139332 () Bool)

(assert (=> b!1139332 (= e!648380 e!648384)))

(declare-fun c!111809 () Bool)

(assert (=> b!1139332 (= c!111809 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506717))))

(declare-fun b!1139333 () Bool)

(declare-fun res!759765 () Bool)

(assert (=> b!1139333 (=> (not res!759765) (not e!648389))))

(assert (=> b!1139333 (= res!759765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139334 () Bool)

(assert (=> b!1139334 (= c!111810 (and (not lt!506717) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648387 () Unit!37262)

(assert (=> b!1139334 (= e!648387 e!648380)))

(declare-fun b!1139335 () Bool)

(assert (=> b!1139335 (= e!648379 e!648385)))

(declare-fun res!759754 () Bool)

(assert (=> b!1139335 (=> res!759754 e!648385)))

(assert (=> b!1139335 (= res!759754 (not (= (select (arr!35686 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1139335 e!648388))

(declare-fun c!111807 () Bool)

(assert (=> b!1139335 (= c!111807 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506730 () Unit!37262)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!472 (array!74083 array!74085 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37262)

(assert (=> b!1139335 (= lt!506730 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50342 () Bool)

(assert (=> bm!50342 (= call!50343 call!50339)))

(declare-fun b!1139336 () Bool)

(declare-fun Unit!37266 () Unit!37262)

(assert (=> b!1139336 (= e!648381 Unit!37266)))

(assert (=> b!1139336 (= lt!506717 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139336 (= c!111805 (and (not lt!506717) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506734 () Unit!37262)

(assert (=> b!1139336 (= lt!506734 e!648387)))

(declare-fun lt!506724 () Unit!37262)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!362 (array!74083 array!74085 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 64) (_ BitVec 32) Int) Unit!37262)

(assert (=> b!1139336 (= lt!506724 (lemmaListMapContainsThenArrayContainsFrom!362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111806 () Bool)

(assert (=> b!1139336 (= c!111806 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759757 () Bool)

(assert (=> b!1139336 (= res!759757 e!648391)))

(declare-fun e!648378 () Bool)

(assert (=> b!1139336 (=> (not res!759757) (not e!648378))))

(assert (=> b!1139336 e!648378))

(declare-fun lt!506723 () Unit!37262)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74083 (_ BitVec 32) (_ BitVec 32)) Unit!37262)

(assert (=> b!1139336 (= lt!506723 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139336 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24904)))

(declare-fun lt!506727 () Unit!37262)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74083 (_ BitVec 64) (_ BitVec 32) List!24907) Unit!37262)

(assert (=> b!1139336 (= lt!506727 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24904))))

(assert (=> b!1139336 false))

(declare-fun b!1139337 () Bool)

(assert (=> b!1139337 (= e!648391 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139338 () Bool)

(assert (=> b!1139338 (contains!6625 (+!3527 lt!506722 (tuple2!18143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506729 () Unit!37262)

(assert (=> b!1139338 (= lt!506729 (addStillContains!754 lt!506722 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1139338 call!50339))

(assert (=> b!1139338 (= lt!506722 call!50340)))

(declare-fun lt!506733 () Unit!37262)

(assert (=> b!1139338 (= lt!506733 call!50346)))

(assert (=> b!1139338 (= e!648387 lt!506729)))

(declare-fun bm!50343 () Bool)

(assert (=> bm!50343 (= call!50344 (getCurrentListMapNoExtraKeys!4585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139339 () Bool)

(assert (=> b!1139339 (= e!648376 (and e!648383 mapRes!44711))))

(declare-fun condMapEmpty!44711 () Bool)

(declare-fun mapDefault!44711 () ValueCell!13586)

(assert (=> b!1139339 (= condMapEmpty!44711 (= (arr!35687 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13586)) mapDefault!44711)))))

(declare-fun mapIsEmpty!44711 () Bool)

(assert (=> mapIsEmpty!44711 mapRes!44711))

(declare-fun b!1139340 () Bool)

(assert (=> b!1139340 (= e!648378 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98692 res!759762) b!1139317))

(assert (= (and b!1139317 res!759763) b!1139327))

(assert (= (and b!1139327 res!759760) b!1139333))

(assert (= (and b!1139333 res!759765) b!1139323))

(assert (= (and b!1139323 res!759761) b!1139329))

(assert (= (and b!1139329 res!759753) b!1139321))

(assert (= (and b!1139321 res!759759) b!1139313))

(assert (= (and b!1139313 res!759755) b!1139319))

(assert (= (and b!1139319 res!759764) b!1139326))

(assert (= (and b!1139326 res!759758) b!1139331))

(assert (= (and b!1139331 (not res!759752)) b!1139318))

(assert (= (and b!1139318 (not res!759756)) b!1139335))

(assert (= (and b!1139335 c!111807) b!1139324))

(assert (= (and b!1139335 (not c!111807)) b!1139320))

(assert (= (or b!1139324 b!1139320) bm!50343))

(assert (= (or b!1139324 b!1139320) bm!50339))

(assert (= (and b!1139335 (not res!759754)) b!1139315))

(assert (= (and b!1139315 c!111808) b!1139336))

(assert (= (and b!1139315 (not c!111808)) b!1139330))

(assert (= (and b!1139336 c!111805) b!1139338))

(assert (= (and b!1139336 (not c!111805)) b!1139334))

(assert (= (and b!1139334 c!111810) b!1139325))

(assert (= (and b!1139334 (not c!111810)) b!1139332))

(assert (= (and b!1139332 c!111809) b!1139328))

(assert (= (and b!1139332 (not c!111809)) b!1139316))

(assert (= (or b!1139325 b!1139328) bm!50336))

(assert (= (or b!1139325 b!1139328) bm!50341))

(assert (= (or b!1139325 b!1139328) bm!50342))

(assert (= (or b!1139338 bm!50342) bm!50340))

(assert (= (or b!1139338 bm!50336) bm!50338))

(assert (= (or b!1139338 bm!50341) bm!50337))

(assert (= (and b!1139336 c!111806) b!1139337))

(assert (= (and b!1139336 (not c!111806)) b!1139312))

(assert (= (and b!1139336 res!759757) b!1139340))

(assert (= (and b!1139339 condMapEmpty!44711) mapIsEmpty!44711))

(assert (= (and b!1139339 (not condMapEmpty!44711)) mapNonEmpty!44711))

(get-info :version)

(assert (= (and mapNonEmpty!44711 ((_ is ValueCellFull!13586) mapValue!44711)) b!1139322))

(assert (= (and b!1139339 ((_ is ValueCellFull!13586) mapDefault!44711)) b!1139314))

(assert (= start!98692 b!1139339))

(declare-fun b_lambda!19161 () Bool)

(assert (=> (not b_lambda!19161) (not b!1139318)))

(declare-fun t!35950 () Bool)

(declare-fun tb!8865 () Bool)

(assert (=> (and start!98692 (= defaultEntry!1004 defaultEntry!1004) t!35950) tb!8865))

(declare-fun result!18303 () Bool)

(assert (=> tb!8865 (= result!18303 tp_is_empty!28591)))

(assert (=> b!1139318 t!35950))

(declare-fun b_and!38975 () Bool)

(assert (= b_and!38973 (and (=> t!35950 result!18303) b_and!38975)))

(declare-fun m!1051551 () Bool)

(assert (=> b!1139319 m!1051551))

(declare-fun m!1051553 () Bool)

(assert (=> b!1139319 m!1051553))

(declare-fun m!1051555 () Bool)

(assert (=> b!1139340 m!1051555))

(declare-fun m!1051557 () Bool)

(assert (=> bm!50337 m!1051557))

(declare-fun m!1051559 () Bool)

(assert (=> b!1139323 m!1051559))

(declare-fun m!1051561 () Bool)

(assert (=> b!1139338 m!1051561))

(assert (=> b!1139338 m!1051561))

(declare-fun m!1051563 () Bool)

(assert (=> b!1139338 m!1051563))

(declare-fun m!1051565 () Bool)

(assert (=> b!1139338 m!1051565))

(declare-fun m!1051567 () Bool)

(assert (=> bm!50343 m!1051567))

(declare-fun m!1051569 () Bool)

(assert (=> b!1139333 m!1051569))

(declare-fun m!1051571 () Bool)

(assert (=> b!1139331 m!1051571))

(declare-fun m!1051573 () Bool)

(assert (=> b!1139331 m!1051573))

(declare-fun m!1051575 () Bool)

(assert (=> b!1139324 m!1051575))

(declare-fun m!1051577 () Bool)

(assert (=> b!1139315 m!1051577))

(assert (=> b!1139315 m!1051567))

(declare-fun m!1051579 () Bool)

(assert (=> b!1139321 m!1051579))

(declare-fun m!1051581 () Bool)

(assert (=> mapNonEmpty!44711 m!1051581))

(declare-fun m!1051583 () Bool)

(assert (=> b!1139335 m!1051583))

(declare-fun m!1051585 () Bool)

(assert (=> b!1139335 m!1051585))

(declare-fun m!1051587 () Bool)

(assert (=> start!98692 m!1051587))

(declare-fun m!1051589 () Bool)

(assert (=> start!98692 m!1051589))

(declare-fun m!1051591 () Bool)

(assert (=> bm!50340 m!1051591))

(declare-fun m!1051593 () Bool)

(assert (=> bm!50339 m!1051593))

(declare-fun m!1051595 () Bool)

(assert (=> b!1139336 m!1051595))

(declare-fun m!1051597 () Bool)

(assert (=> b!1139336 m!1051597))

(declare-fun m!1051599 () Bool)

(assert (=> b!1139336 m!1051599))

(declare-fun m!1051601 () Bool)

(assert (=> b!1139336 m!1051601))

(declare-fun m!1051603 () Bool)

(assert (=> b!1139318 m!1051603))

(declare-fun m!1051605 () Bool)

(assert (=> b!1139318 m!1051605))

(declare-fun m!1051607 () Bool)

(assert (=> b!1139318 m!1051607))

(declare-fun m!1051609 () Bool)

(assert (=> b!1139318 m!1051609))

(declare-fun m!1051611 () Bool)

(assert (=> b!1139317 m!1051611))

(declare-fun m!1051613 () Bool)

(assert (=> bm!50338 m!1051613))

(assert (=> b!1139337 m!1051555))

(declare-fun m!1051615 () Bool)

(assert (=> b!1139326 m!1051615))

(declare-fun m!1051617 () Bool)

(assert (=> b!1139313 m!1051617))

(check-sat (not start!98692) (not b!1139326) (not bm!50343) (not bm!50337) (not b!1139323) (not b_lambda!19161) (not bm!50338) (not bm!50339) (not mapNonEmpty!44711) (not bm!50340) (not b!1139335) (not b!1139340) (not b!1139338) (not b!1139319) (not b!1139317) tp_is_empty!28591 b_and!38975 (not b!1139331) (not b!1139336) (not b!1139321) (not b!1139324) (not b!1139333) (not b!1139337) (not b!1139315) (not b_next!24061) (not b!1139318))
(check-sat b_and!38975 (not b_next!24061))
