; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101260 () Bool)

(assert start!101260)

(declare-fun b_free!26023 () Bool)

(declare-fun b_next!26023 () Bool)

(assert (=> start!101260 (= b_free!26023 (not b_next!26023))))

(declare-fun tp!91085 () Bool)

(declare-fun b_and!43129 () Bool)

(assert (=> start!101260 (= tp!91085 b_and!43129)))

(declare-datatypes ((V!46097 0))(
  ( (V!46098 (val!15420 Int)) )
))
(declare-datatypes ((tuple2!19818 0))(
  ( (tuple2!19819 (_1!9920 (_ BitVec 64)) (_2!9920 V!46097)) )
))
(declare-datatypes ((List!26623 0))(
  ( (Nil!26620) (Cons!26619 (h!27837 tuple2!19818) (t!39618 List!26623)) )
))
(declare-datatypes ((ListLongMap!17795 0))(
  ( (ListLongMap!17796 (toList!8913 List!26623)) )
))
(declare-fun call!59785 () ListLongMap!17795)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!688439 () Bool)

(declare-fun b!1212035 () Bool)

(declare-fun call!59782 () ListLongMap!17795)

(declare-fun -!1842 (ListLongMap!17795 (_ BitVec 64)) ListLongMap!17795)

(assert (=> b!1212035 (= e!688439 (= call!59782 (-!1842 call!59785 k0!934)))))

(declare-fun b!1212036 () Bool)

(declare-fun e!688435 () Bool)

(declare-fun e!688445 () Bool)

(assert (=> b!1212036 (= e!688435 e!688445)))

(declare-fun res!804967 () Bool)

(assert (=> b!1212036 (=> res!804967 e!688445)))

(declare-datatypes ((array!78273 0))(
  ( (array!78274 (arr!37767 (Array (_ BitVec 32) (_ BitVec 64))) (size!38304 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78273)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1212036 (= res!804967 (not (= (select (arr!37767 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212036 e!688439))

(declare-fun c!119719 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212036 (= c!119719 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!46097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14654 0))(
  ( (ValueCellFull!14654 (v!18067 V!46097)) (EmptyCell!14654) )
))
(declare-datatypes ((array!78275 0))(
  ( (array!78276 (arr!37768 (Array (_ BitVec 32) ValueCell!14654)) (size!38305 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78275)

(declare-fun minValue!944 () V!46097)

(declare-datatypes ((Unit!40093 0))(
  ( (Unit!40094) )
))
(declare-fun lt!550264 () Unit!40093)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 (array!78273 array!78275 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40093)

(assert (=> b!1212036 (= lt!550264 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212037 () Bool)

(declare-fun res!804963 () Bool)

(declare-fun e!688442 () Bool)

(assert (=> b!1212037 (=> (not res!804963) (not e!688442))))

(declare-datatypes ((List!26624 0))(
  ( (Nil!26621) (Cons!26620 (h!27838 (_ BitVec 64)) (t!39619 List!26624)) )
))
(declare-fun arrayNoDuplicates!0 (array!78273 (_ BitVec 32) List!26624) Bool)

(assert (=> b!1212037 (= res!804963 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26621))))

(declare-fun e!688430 () Bool)

(declare-fun b!1212038 () Bool)

(declare-fun arrayContainsKey!0 (array!78273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212038 (= e!688430 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212039 () Bool)

(declare-fun e!688444 () Unit!40093)

(declare-fun Unit!40095 () Unit!40093)

(assert (=> b!1212039 (= e!688444 Unit!40095)))

(declare-fun b!1212040 () Bool)

(declare-fun e!688437 () Unit!40093)

(declare-fun lt!550263 () Unit!40093)

(assert (=> b!1212040 (= e!688437 lt!550263)))

(declare-fun call!59787 () Unit!40093)

(assert (=> b!1212040 (= lt!550263 call!59787)))

(declare-fun call!59786 () Bool)

(assert (=> b!1212040 call!59786))

(declare-fun bm!59779 () Bool)

(declare-fun c!119717 () Bool)

(declare-fun call!59789 () ListLongMap!17795)

(declare-fun c!119721 () Bool)

(declare-fun lt!550245 () ListLongMap!17795)

(declare-fun lt!550259 () ListLongMap!17795)

(declare-fun +!4074 (ListLongMap!17795 tuple2!19818) ListLongMap!17795)

(assert (=> bm!59779 (= call!59789 (+!4074 (ite c!119721 lt!550259 lt!550245) (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1212041 () Bool)

(declare-fun res!804969 () Bool)

(declare-fun e!688433 () Bool)

(assert (=> b!1212041 (=> (not res!804969) (not e!688433))))

(declare-fun lt!550256 () array!78273)

(assert (=> b!1212041 (= res!804969 (arrayNoDuplicates!0 lt!550256 #b00000000000000000000000000000000 Nil!26621))))

(declare-fun bm!59780 () Bool)

(declare-fun call!59784 () Unit!40093)

(declare-fun addStillContains!1057 (ListLongMap!17795 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!40093)

(assert (=> bm!59780 (= call!59784 (addStillContains!1057 (ite c!119721 lt!550259 lt!550245) (ite c!119721 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119717 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119721 minValue!944 (ite c!119717 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1212042 () Bool)

(declare-fun res!804974 () Bool)

(assert (=> b!1212042 (=> (not res!804974) (not e!688442))))

(assert (=> b!1212042 (= res!804974 (= (select (arr!37767 _keys!1208) i!673) k0!934))))

(declare-fun b!1212043 () Bool)

(declare-fun e!688440 () Bool)

(declare-fun tp_is_empty!30727 () Bool)

(assert (=> b!1212043 (= e!688440 tp_is_empty!30727)))

(declare-fun b!1212044 () Bool)

(declare-fun e!688432 () Bool)

(assert (=> b!1212044 (= e!688432 e!688435)))

(declare-fun res!804971 () Bool)

(assert (=> b!1212044 (=> res!804971 e!688435)))

(assert (=> b!1212044 (= res!804971 (not (= from!1455 i!673)))))

(declare-fun lt!550251 () array!78275)

(declare-fun lt!550257 () ListLongMap!17795)

(declare-fun getCurrentListMapNoExtraKeys!5373 (array!78273 array!78275 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) Int) ListLongMap!17795)

(assert (=> b!1212044 (= lt!550257 (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550260 () V!46097)

(assert (=> b!1212044 (= lt!550251 (array!78276 (store (arr!37768 _values!996) i!673 (ValueCellFull!14654 lt!550260)) (size!38305 _values!996)))))

(declare-fun dynLambda!3290 (Int (_ BitVec 64)) V!46097)

(assert (=> b!1212044 (= lt!550260 (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550250 () ListLongMap!17795)

(assert (=> b!1212044 (= lt!550250 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59781 () Bool)

(assert (=> bm!59781 (= call!59785 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212046 () Bool)

(assert (=> b!1212046 call!59786))

(declare-fun lt!550252 () Unit!40093)

(assert (=> b!1212046 (= lt!550252 call!59787)))

(assert (=> b!1212046 (= e!688444 lt!550252)))

(declare-fun bm!59782 () Bool)

(declare-fun call!59788 () Bool)

(assert (=> bm!59782 (= call!59786 call!59788)))

(declare-fun b!1212047 () Bool)

(declare-fun res!804970 () Bool)

(assert (=> b!1212047 (=> (not res!804970) (not e!688442))))

(assert (=> b!1212047 (= res!804970 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38304 _keys!1208))))))

(declare-fun bm!59783 () Bool)

(declare-fun call!59783 () ListLongMap!17795)

(assert (=> bm!59783 (= call!59783 call!59789)))

(declare-fun b!1212048 () Bool)

(declare-fun lt!550258 () Bool)

(assert (=> b!1212048 (= e!688430 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550258) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212049 () Bool)

(declare-fun contains!7006 (ListLongMap!17795 (_ BitVec 64)) Bool)

(assert (=> b!1212049 (contains!7006 call!59789 k0!934)))

(declare-fun lt!550253 () Unit!40093)

(assert (=> b!1212049 (= lt!550253 call!59784)))

(assert (=> b!1212049 call!59788))

(assert (=> b!1212049 (= lt!550259 (+!4074 lt!550245 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550248 () Unit!40093)

(assert (=> b!1212049 (= lt!550248 (addStillContains!1057 lt!550245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!688443 () Unit!40093)

(assert (=> b!1212049 (= e!688443 lt!550253)))

(declare-fun bm!59784 () Bool)

(assert (=> bm!59784 (= call!59787 call!59784)))

(declare-fun b!1212050 () Bool)

(assert (=> b!1212050 (= e!688439 (= call!59782 call!59785))))

(declare-fun bm!59785 () Bool)

(assert (=> bm!59785 (= call!59782 (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212051 () Bool)

(assert (=> b!1212051 (= e!688437 e!688444)))

(declare-fun c!119722 () Bool)

(assert (=> b!1212051 (= c!119722 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550258))))

(declare-fun b!1212052 () Bool)

(assert (=> b!1212052 (= e!688433 (not e!688432))))

(declare-fun res!804965 () Bool)

(assert (=> b!1212052 (=> res!804965 e!688432)))

(assert (=> b!1212052 (= res!804965 (bvsgt from!1455 i!673))))

(assert (=> b!1212052 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550249 () Unit!40093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78273 (_ BitVec 64) (_ BitVec 32)) Unit!40093)

(assert (=> b!1212052 (= lt!550249 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1212053 () Bool)

(assert (=> b!1212053 (= e!688442 e!688433)))

(declare-fun res!804973 () Bool)

(assert (=> b!1212053 (=> (not res!804973) (not e!688433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78273 (_ BitVec 32)) Bool)

(assert (=> b!1212053 (= res!804973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550256 mask!1564))))

(assert (=> b!1212053 (= lt!550256 (array!78274 (store (arr!37767 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38304 _keys!1208)))))

(declare-fun b!1212054 () Bool)

(declare-fun res!804962 () Bool)

(assert (=> b!1212054 (=> (not res!804962) (not e!688442))))

(assert (=> b!1212054 (= res!804962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212055 () Bool)

(declare-fun res!804961 () Bool)

(assert (=> b!1212055 (=> (not res!804961) (not e!688442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212055 (= res!804961 (validKeyInArray!0 k0!934))))

(declare-fun b!1212056 () Bool)

(declare-fun e!688438 () Unit!40093)

(declare-fun Unit!40096 () Unit!40093)

(assert (=> b!1212056 (= e!688438 Unit!40096)))

(assert (=> b!1212056 (= lt!550258 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212056 (= c!119721 (and (not lt!550258) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550244 () Unit!40093)

(assert (=> b!1212056 (= lt!550244 e!688443)))

(declare-fun lt!550255 () Unit!40093)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!605 (array!78273 array!78275 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 64) (_ BitVec 32) Int) Unit!40093)

(assert (=> b!1212056 (= lt!550255 (lemmaListMapContainsThenArrayContainsFrom!605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119718 () Bool)

(assert (=> b!1212056 (= c!119718 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804964 () Bool)

(assert (=> b!1212056 (= res!804964 e!688430)))

(declare-fun e!688441 () Bool)

(assert (=> b!1212056 (=> (not res!804964) (not e!688441))))

(assert (=> b!1212056 e!688441))

(declare-fun lt!550261 () Unit!40093)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78273 (_ BitVec 32) (_ BitVec 32)) Unit!40093)

(assert (=> b!1212056 (= lt!550261 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212056 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26621)))

(declare-fun lt!550247 () Unit!40093)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78273 (_ BitVec 64) (_ BitVec 32) List!26624) Unit!40093)

(assert (=> b!1212056 (= lt!550247 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26621))))

(assert (=> b!1212056 false))

(declare-fun b!1212057 () Bool)

(declare-fun e!688434 () Bool)

(assert (=> b!1212057 (= e!688434 tp_is_empty!30727)))

(declare-fun b!1212058 () Bool)

(assert (=> b!1212058 (= c!119717 (and (not lt!550258) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212058 (= e!688443 e!688437)))

(declare-fun b!1212059 () Bool)

(declare-fun Unit!40097 () Unit!40093)

(assert (=> b!1212059 (= e!688438 Unit!40097)))

(declare-fun mapIsEmpty!47959 () Bool)

(declare-fun mapRes!47959 () Bool)

(assert (=> mapIsEmpty!47959 mapRes!47959))

(declare-fun b!1212060 () Bool)

(assert (=> b!1212060 (= e!688445 (= (-!1842 lt!550250 k0!934) lt!550245))))

(declare-fun lt!550246 () V!46097)

(assert (=> b!1212060 (= (-!1842 (+!4074 lt!550245 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)) (select (arr!37767 _keys!1208) from!1455)) lt!550245)))

(declare-fun lt!550262 () Unit!40093)

(declare-fun addThenRemoveForNewKeyIsSame!272 (ListLongMap!17795 (_ BitVec 64) V!46097) Unit!40093)

(assert (=> b!1212060 (= lt!550262 (addThenRemoveForNewKeyIsSame!272 lt!550245 (select (arr!37767 _keys!1208) from!1455) lt!550246))))

(declare-fun get!19289 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1212060 (= lt!550246 (get!19289 (select (arr!37768 _values!996) from!1455) lt!550260))))

(declare-fun lt!550254 () Unit!40093)

(assert (=> b!1212060 (= lt!550254 e!688438)))

(declare-fun c!119720 () Bool)

(assert (=> b!1212060 (= c!119720 (contains!7006 lt!550245 k0!934))))

(assert (=> b!1212060 (= lt!550245 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47959 () Bool)

(declare-fun tp!91084 () Bool)

(assert (=> mapNonEmpty!47959 (= mapRes!47959 (and tp!91084 e!688440))))

(declare-fun mapRest!47959 () (Array (_ BitVec 32) ValueCell!14654))

(declare-fun mapKey!47959 () (_ BitVec 32))

(declare-fun mapValue!47959 () ValueCell!14654)

(assert (=> mapNonEmpty!47959 (= (arr!37768 _values!996) (store mapRest!47959 mapKey!47959 mapValue!47959))))

(declare-fun b!1212045 () Bool)

(declare-fun res!804966 () Bool)

(assert (=> b!1212045 (=> (not res!804966) (not e!688442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212045 (= res!804966 (validMask!0 mask!1564))))

(declare-fun res!804968 () Bool)

(assert (=> start!101260 (=> (not res!804968) (not e!688442))))

(assert (=> start!101260 (= res!804968 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38304 _keys!1208))))))

(assert (=> start!101260 e!688442))

(assert (=> start!101260 tp_is_empty!30727))

(declare-fun array_inv!28830 (array!78273) Bool)

(assert (=> start!101260 (array_inv!28830 _keys!1208)))

(assert (=> start!101260 true))

(assert (=> start!101260 tp!91085))

(declare-fun e!688436 () Bool)

(declare-fun array_inv!28831 (array!78275) Bool)

(assert (=> start!101260 (and (array_inv!28831 _values!996) e!688436)))

(declare-fun b!1212061 () Bool)

(assert (=> b!1212061 (= e!688436 (and e!688434 mapRes!47959))))

(declare-fun condMapEmpty!47959 () Bool)

(declare-fun mapDefault!47959 () ValueCell!14654)

(assert (=> b!1212061 (= condMapEmpty!47959 (= (arr!37768 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14654)) mapDefault!47959)))))

(declare-fun b!1212062 () Bool)

(assert (=> b!1212062 (= e!688441 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212063 () Bool)

(declare-fun res!804972 () Bool)

(assert (=> b!1212063 (=> (not res!804972) (not e!688442))))

(assert (=> b!1212063 (= res!804972 (and (= (size!38305 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38304 _keys!1208) (size!38305 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!59786 () Bool)

(assert (=> bm!59786 (= call!59788 (contains!7006 (ite c!119721 lt!550259 call!59783) k0!934))))

(assert (= (and start!101260 res!804968) b!1212045))

(assert (= (and b!1212045 res!804966) b!1212063))

(assert (= (and b!1212063 res!804972) b!1212054))

(assert (= (and b!1212054 res!804962) b!1212037))

(assert (= (and b!1212037 res!804963) b!1212047))

(assert (= (and b!1212047 res!804970) b!1212055))

(assert (= (and b!1212055 res!804961) b!1212042))

(assert (= (and b!1212042 res!804974) b!1212053))

(assert (= (and b!1212053 res!804973) b!1212041))

(assert (= (and b!1212041 res!804969) b!1212052))

(assert (= (and b!1212052 (not res!804965)) b!1212044))

(assert (= (and b!1212044 (not res!804971)) b!1212036))

(assert (= (and b!1212036 c!119719) b!1212035))

(assert (= (and b!1212036 (not c!119719)) b!1212050))

(assert (= (or b!1212035 b!1212050) bm!59781))

(assert (= (or b!1212035 b!1212050) bm!59785))

(assert (= (and b!1212036 (not res!804967)) b!1212060))

(assert (= (and b!1212060 c!119720) b!1212056))

(assert (= (and b!1212060 (not c!119720)) b!1212059))

(assert (= (and b!1212056 c!119721) b!1212049))

(assert (= (and b!1212056 (not c!119721)) b!1212058))

(assert (= (and b!1212058 c!119717) b!1212040))

(assert (= (and b!1212058 (not c!119717)) b!1212051))

(assert (= (and b!1212051 c!119722) b!1212046))

(assert (= (and b!1212051 (not c!119722)) b!1212039))

(assert (= (or b!1212040 b!1212046) bm!59784))

(assert (= (or b!1212040 b!1212046) bm!59783))

(assert (= (or b!1212040 b!1212046) bm!59782))

(assert (= (or b!1212049 bm!59782) bm!59786))

(assert (= (or b!1212049 bm!59784) bm!59780))

(assert (= (or b!1212049 bm!59783) bm!59779))

(assert (= (and b!1212056 c!119718) b!1212038))

(assert (= (and b!1212056 (not c!119718)) b!1212048))

(assert (= (and b!1212056 res!804964) b!1212062))

(assert (= (and b!1212061 condMapEmpty!47959) mapIsEmpty!47959))

(assert (= (and b!1212061 (not condMapEmpty!47959)) mapNonEmpty!47959))

(get-info :version)

(assert (= (and mapNonEmpty!47959 ((_ is ValueCellFull!14654) mapValue!47959)) b!1212043))

(assert (= (and b!1212061 ((_ is ValueCellFull!14654) mapDefault!47959)) b!1212057))

(assert (= start!101260 b!1212061))

(declare-fun b_lambda!21617 () Bool)

(assert (=> (not b_lambda!21617) (not b!1212044)))

(declare-fun t!39617 () Bool)

(declare-fun tb!10815 () Bool)

(assert (=> (and start!101260 (= defaultEntry!1004 defaultEntry!1004) t!39617) tb!10815))

(declare-fun result!22231 () Bool)

(assert (=> tb!10815 (= result!22231 tp_is_empty!30727)))

(assert (=> b!1212044 t!39617))

(declare-fun b_and!43131 () Bool)

(assert (= b_and!43129 (and (=> t!39617 result!22231) b_and!43131)))

(declare-fun m!1117759 () Bool)

(assert (=> bm!59785 m!1117759))

(declare-fun m!1117761 () Bool)

(assert (=> b!1212053 m!1117761))

(declare-fun m!1117763 () Bool)

(assert (=> b!1212053 m!1117763))

(declare-fun m!1117765 () Bool)

(assert (=> b!1212054 m!1117765))

(declare-fun m!1117767 () Bool)

(assert (=> b!1212044 m!1117767))

(declare-fun m!1117769 () Bool)

(assert (=> b!1212044 m!1117769))

(declare-fun m!1117771 () Bool)

(assert (=> b!1212044 m!1117771))

(declare-fun m!1117773 () Bool)

(assert (=> b!1212044 m!1117773))

(declare-fun m!1117775 () Bool)

(assert (=> mapNonEmpty!47959 m!1117775))

(declare-fun m!1117777 () Bool)

(assert (=> start!101260 m!1117777))

(declare-fun m!1117779 () Bool)

(assert (=> start!101260 m!1117779))

(declare-fun m!1117781 () Bool)

(assert (=> b!1212037 m!1117781))

(declare-fun m!1117783 () Bool)

(assert (=> bm!59780 m!1117783))

(declare-fun m!1117785 () Bool)

(assert (=> bm!59779 m!1117785))

(declare-fun m!1117787 () Bool)

(assert (=> b!1212055 m!1117787))

(declare-fun m!1117789 () Bool)

(assert (=> b!1212045 m!1117789))

(declare-fun m!1117791 () Bool)

(assert (=> bm!59786 m!1117791))

(declare-fun m!1117793 () Bool)

(assert (=> b!1212060 m!1117793))

(declare-fun m!1117795 () Bool)

(assert (=> b!1212060 m!1117795))

(declare-fun m!1117797 () Bool)

(assert (=> b!1212060 m!1117797))

(declare-fun m!1117799 () Bool)

(assert (=> b!1212060 m!1117799))

(assert (=> b!1212060 m!1117795))

(declare-fun m!1117801 () Bool)

(assert (=> b!1212060 m!1117801))

(declare-fun m!1117803 () Bool)

(assert (=> b!1212060 m!1117803))

(assert (=> b!1212060 m!1117797))

(declare-fun m!1117805 () Bool)

(assert (=> b!1212060 m!1117805))

(declare-fun m!1117807 () Bool)

(assert (=> b!1212060 m!1117807))

(assert (=> b!1212060 m!1117797))

(assert (=> b!1212060 m!1117801))

(declare-fun m!1117809 () Bool)

(assert (=> b!1212060 m!1117809))

(declare-fun m!1117811 () Bool)

(assert (=> b!1212049 m!1117811))

(declare-fun m!1117813 () Bool)

(assert (=> b!1212049 m!1117813))

(declare-fun m!1117815 () Bool)

(assert (=> b!1212049 m!1117815))

(declare-fun m!1117817 () Bool)

(assert (=> b!1212035 m!1117817))

(declare-fun m!1117819 () Bool)

(assert (=> b!1212052 m!1117819))

(declare-fun m!1117821 () Bool)

(assert (=> b!1212052 m!1117821))

(declare-fun m!1117823 () Bool)

(assert (=> b!1212056 m!1117823))

(declare-fun m!1117825 () Bool)

(assert (=> b!1212056 m!1117825))

(declare-fun m!1117827 () Bool)

(assert (=> b!1212056 m!1117827))

(declare-fun m!1117829 () Bool)

(assert (=> b!1212056 m!1117829))

(declare-fun m!1117831 () Bool)

(assert (=> b!1212038 m!1117831))

(assert (=> bm!59781 m!1117793))

(declare-fun m!1117833 () Bool)

(assert (=> b!1212041 m!1117833))

(assert (=> b!1212062 m!1117831))

(assert (=> b!1212036 m!1117797))

(declare-fun m!1117835 () Bool)

(assert (=> b!1212036 m!1117835))

(declare-fun m!1117837 () Bool)

(assert (=> b!1212042 m!1117837))

(check-sat (not b!1212038) (not b!1212055) (not start!101260) (not b!1212037) (not mapNonEmpty!47959) (not b_next!26023) (not bm!59780) (not b!1212044) (not b!1212041) tp_is_empty!30727 (not b!1212036) (not b!1212049) (not b!1212054) (not b!1212045) (not bm!59785) (not bm!59781) (not b!1212062) (not b!1212060) (not b!1212056) (not b_lambda!21617) (not b!1212052) (not bm!59786) b_and!43131 (not b!1212053) (not bm!59779) (not b!1212035))
(check-sat b_and!43131 (not b_next!26023))
(get-model)

(declare-fun b_lambda!21623 () Bool)

(assert (= b_lambda!21617 (or (and start!101260 b_free!26023) b_lambda!21623)))

(check-sat (not b!1212038) (not b!1212055) (not b_lambda!21623) (not start!101260) (not b!1212037) (not mapNonEmpty!47959) (not b_next!26023) (not bm!59780) (not b!1212044) (not b!1212041) tp_is_empty!30727 (not b!1212036) (not b!1212049) (not b!1212054) (not b!1212045) (not bm!59785) (not bm!59781) (not b!1212062) (not b!1212060) (not b!1212056) (not b!1212052) (not bm!59786) b_and!43131 (not b!1212053) (not bm!59779) (not b!1212035))
(check-sat b_and!43131 (not b_next!26023))
(get-model)

(declare-fun d!133793 () Bool)

(assert (=> d!133793 (= (array_inv!28830 _keys!1208) (bvsge (size!38304 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101260 d!133793))

(declare-fun d!133795 () Bool)

(assert (=> d!133795 (= (array_inv!28831 _values!996) (bvsge (size!38305 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101260 d!133795))

(declare-fun d!133797 () Bool)

(declare-fun e!688547 () Bool)

(assert (=> d!133797 e!688547))

(declare-fun res!805061 () Bool)

(assert (=> d!133797 (=> res!805061 e!688547)))

(declare-fun lt!550399 () Bool)

(assert (=> d!133797 (= res!805061 (not lt!550399))))

(declare-fun lt!550402 () Bool)

(assert (=> d!133797 (= lt!550399 lt!550402)))

(declare-fun lt!550401 () Unit!40093)

(declare-fun e!688546 () Unit!40093)

(assert (=> d!133797 (= lt!550401 e!688546)))

(declare-fun c!119761 () Bool)

(assert (=> d!133797 (= c!119761 lt!550402)))

(declare-fun containsKey!597 (List!26623 (_ BitVec 64)) Bool)

(assert (=> d!133797 (= lt!550402 (containsKey!597 (toList!8913 call!59789) k0!934))))

(assert (=> d!133797 (= (contains!7006 call!59789 k0!934) lt!550399)))

(declare-fun b!1212250 () Bool)

(declare-fun lt!550400 () Unit!40093)

(assert (=> b!1212250 (= e!688546 lt!550400)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!425 (List!26623 (_ BitVec 64)) Unit!40093)

(assert (=> b!1212250 (= lt!550400 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8913 call!59789) k0!934))))

(declare-datatypes ((Option!686 0))(
  ( (Some!685 (v!18070 V!46097)) (None!684) )
))
(declare-fun isDefined!463 (Option!686) Bool)

(declare-fun getValueByKey!635 (List!26623 (_ BitVec 64)) Option!686)

(assert (=> b!1212250 (isDefined!463 (getValueByKey!635 (toList!8913 call!59789) k0!934))))

(declare-fun b!1212251 () Bool)

(declare-fun Unit!40106 () Unit!40093)

(assert (=> b!1212251 (= e!688546 Unit!40106)))

(declare-fun b!1212252 () Bool)

(assert (=> b!1212252 (= e!688547 (isDefined!463 (getValueByKey!635 (toList!8913 call!59789) k0!934)))))

(assert (= (and d!133797 c!119761) b!1212250))

(assert (= (and d!133797 (not c!119761)) b!1212251))

(assert (= (and d!133797 (not res!805061)) b!1212252))

(declare-fun m!1118001 () Bool)

(assert (=> d!133797 m!1118001))

(declare-fun m!1118003 () Bool)

(assert (=> b!1212250 m!1118003))

(declare-fun m!1118005 () Bool)

(assert (=> b!1212250 m!1118005))

(assert (=> b!1212250 m!1118005))

(declare-fun m!1118007 () Bool)

(assert (=> b!1212250 m!1118007))

(assert (=> b!1212252 m!1118005))

(assert (=> b!1212252 m!1118005))

(assert (=> b!1212252 m!1118007))

(assert (=> b!1212049 d!133797))

(declare-fun d!133799 () Bool)

(declare-fun e!688550 () Bool)

(assert (=> d!133799 e!688550))

(declare-fun res!805067 () Bool)

(assert (=> d!133799 (=> (not res!805067) (not e!688550))))

(declare-fun lt!550413 () ListLongMap!17795)

(assert (=> d!133799 (= res!805067 (contains!7006 lt!550413 (_1!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!550414 () List!26623)

(assert (=> d!133799 (= lt!550413 (ListLongMap!17796 lt!550414))))

(declare-fun lt!550411 () Unit!40093)

(declare-fun lt!550412 () Unit!40093)

(assert (=> d!133799 (= lt!550411 lt!550412)))

(assert (=> d!133799 (= (getValueByKey!635 lt!550414 (_1!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!685 (_2!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!317 (List!26623 (_ BitVec 64) V!46097) Unit!40093)

(assert (=> d!133799 (= lt!550412 (lemmaContainsTupThenGetReturnValue!317 lt!550414 (_1!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!410 (List!26623 (_ BitVec 64) V!46097) List!26623)

(assert (=> d!133799 (= lt!550414 (insertStrictlySorted!410 (toList!8913 lt!550245) (_1!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133799 (= (+!4074 lt!550245 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!550413)))

(declare-fun b!1212257 () Bool)

(declare-fun res!805066 () Bool)

(assert (=> b!1212257 (=> (not res!805066) (not e!688550))))

(assert (=> b!1212257 (= res!805066 (= (getValueByKey!635 (toList!8913 lt!550413) (_1!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!685 (_2!9920 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1212258 () Bool)

(declare-fun contains!7008 (List!26623 tuple2!19818) Bool)

(assert (=> b!1212258 (= e!688550 (contains!7008 (toList!8913 lt!550413) (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133799 res!805067) b!1212257))

(assert (= (and b!1212257 res!805066) b!1212258))

(declare-fun m!1118009 () Bool)

(assert (=> d!133799 m!1118009))

(declare-fun m!1118011 () Bool)

(assert (=> d!133799 m!1118011))

(declare-fun m!1118013 () Bool)

(assert (=> d!133799 m!1118013))

(declare-fun m!1118015 () Bool)

(assert (=> d!133799 m!1118015))

(declare-fun m!1118017 () Bool)

(assert (=> b!1212257 m!1118017))

(declare-fun m!1118019 () Bool)

(assert (=> b!1212258 m!1118019))

(assert (=> b!1212049 d!133799))

(declare-fun d!133801 () Bool)

(assert (=> d!133801 (contains!7006 (+!4074 lt!550245 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!550417 () Unit!40093)

(declare-fun choose!1818 (ListLongMap!17795 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!40093)

(assert (=> d!133801 (= lt!550417 (choose!1818 lt!550245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133801 (contains!7006 lt!550245 k0!934)))

(assert (=> d!133801 (= (addStillContains!1057 lt!550245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!550417)))

(declare-fun bs!34210 () Bool)

(assert (= bs!34210 d!133801))

(assert (=> bs!34210 m!1117813))

(assert (=> bs!34210 m!1117813))

(declare-fun m!1118021 () Bool)

(assert (=> bs!34210 m!1118021))

(declare-fun m!1118023 () Bool)

(assert (=> bs!34210 m!1118023))

(assert (=> bs!34210 m!1117809))

(assert (=> b!1212049 d!133801))

(declare-fun d!133803 () Bool)

(assert (=> d!133803 (contains!7006 (+!4074 (ite c!119721 lt!550259 lt!550245) (tuple2!19819 (ite c!119721 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119717 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119721 minValue!944 (ite c!119717 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!550418 () Unit!40093)

(assert (=> d!133803 (= lt!550418 (choose!1818 (ite c!119721 lt!550259 lt!550245) (ite c!119721 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119717 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119721 minValue!944 (ite c!119717 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133803 (contains!7006 (ite c!119721 lt!550259 lt!550245) k0!934)))

(assert (=> d!133803 (= (addStillContains!1057 (ite c!119721 lt!550259 lt!550245) (ite c!119721 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119717 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119721 minValue!944 (ite c!119717 zeroValue!944 minValue!944)) k0!934) lt!550418)))

(declare-fun bs!34211 () Bool)

(assert (= bs!34211 d!133803))

(declare-fun m!1118025 () Bool)

(assert (=> bs!34211 m!1118025))

(assert (=> bs!34211 m!1118025))

(declare-fun m!1118027 () Bool)

(assert (=> bs!34211 m!1118027))

(declare-fun m!1118029 () Bool)

(assert (=> bs!34211 m!1118029))

(declare-fun m!1118031 () Bool)

(assert (=> bs!34211 m!1118031))

(assert (=> bm!59780 d!133803))

(declare-fun b!1212270 () Bool)

(declare-fun e!688562 () Bool)

(declare-fun e!688560 () Bool)

(assert (=> b!1212270 (= e!688562 e!688560)))

(declare-fun res!805074 () Bool)

(assert (=> b!1212270 (=> (not res!805074) (not e!688560))))

(declare-fun e!688559 () Bool)

(assert (=> b!1212270 (= res!805074 (not e!688559))))

(declare-fun res!805075 () Bool)

(assert (=> b!1212270 (=> (not res!805075) (not e!688559))))

(assert (=> b!1212270 (= res!805075 (validKeyInArray!0 (select (arr!37767 lt!550256) #b00000000000000000000000000000000)))))

(declare-fun b!1212271 () Bool)

(declare-fun e!688561 () Bool)

(declare-fun call!59840 () Bool)

(assert (=> b!1212271 (= e!688561 call!59840)))

(declare-fun b!1212272 () Bool)

(declare-fun contains!7009 (List!26624 (_ BitVec 64)) Bool)

(assert (=> b!1212272 (= e!688559 (contains!7009 Nil!26621 (select (arr!37767 lt!550256) #b00000000000000000000000000000000)))))

(declare-fun b!1212273 () Bool)

(assert (=> b!1212273 (= e!688561 call!59840)))

(declare-fun d!133805 () Bool)

(declare-fun res!805076 () Bool)

(assert (=> d!133805 (=> res!805076 e!688562)))

(assert (=> d!133805 (= res!805076 (bvsge #b00000000000000000000000000000000 (size!38304 lt!550256)))))

(assert (=> d!133805 (= (arrayNoDuplicates!0 lt!550256 #b00000000000000000000000000000000 Nil!26621) e!688562)))

(declare-fun bm!59837 () Bool)

(declare-fun c!119764 () Bool)

(assert (=> bm!59837 (= call!59840 (arrayNoDuplicates!0 lt!550256 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119764 (Cons!26620 (select (arr!37767 lt!550256) #b00000000000000000000000000000000) Nil!26621) Nil!26621)))))

(declare-fun b!1212274 () Bool)

(assert (=> b!1212274 (= e!688560 e!688561)))

(assert (=> b!1212274 (= c!119764 (validKeyInArray!0 (select (arr!37767 lt!550256) #b00000000000000000000000000000000)))))

(assert (= (and d!133805 (not res!805076)) b!1212270))

(assert (= (and b!1212270 res!805075) b!1212272))

(assert (= (and b!1212270 res!805074) b!1212274))

(assert (= (and b!1212274 c!119764) b!1212271))

(assert (= (and b!1212274 (not c!119764)) b!1212273))

(assert (= (or b!1212271 b!1212273) bm!59837))

(declare-fun m!1118033 () Bool)

(assert (=> b!1212270 m!1118033))

(assert (=> b!1212270 m!1118033))

(declare-fun m!1118035 () Bool)

(assert (=> b!1212270 m!1118035))

(assert (=> b!1212272 m!1118033))

(assert (=> b!1212272 m!1118033))

(declare-fun m!1118037 () Bool)

(assert (=> b!1212272 m!1118037))

(assert (=> bm!59837 m!1118033))

(declare-fun m!1118039 () Bool)

(assert (=> bm!59837 m!1118039))

(assert (=> b!1212274 m!1118033))

(assert (=> b!1212274 m!1118033))

(assert (=> b!1212274 m!1118035))

(assert (=> b!1212041 d!133805))

(declare-fun b!1212299 () Bool)

(declare-fun e!688577 () Bool)

(assert (=> b!1212299 (= e!688577 (validKeyInArray!0 (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212299 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1212300 () Bool)

(declare-fun e!688583 () ListLongMap!17795)

(assert (=> b!1212300 (= e!688583 (ListLongMap!17796 Nil!26620))))

(declare-fun b!1212301 () Bool)

(declare-fun e!688581 () ListLongMap!17795)

(declare-fun call!59843 () ListLongMap!17795)

(assert (=> b!1212301 (= e!688581 call!59843)))

(declare-fun b!1212302 () Bool)

(declare-fun e!688578 () Bool)

(declare-fun lt!550437 () ListLongMap!17795)

(declare-fun isEmpty!996 (ListLongMap!17795) Bool)

(assert (=> b!1212302 (= e!688578 (isEmpty!996 lt!550437))))

(declare-fun d!133807 () Bool)

(declare-fun e!688582 () Bool)

(assert (=> d!133807 e!688582))

(declare-fun res!805085 () Bool)

(assert (=> d!133807 (=> (not res!805085) (not e!688582))))

(assert (=> d!133807 (= res!805085 (not (contains!7006 lt!550437 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133807 (= lt!550437 e!688583)))

(declare-fun c!119775 () Bool)

(assert (=> d!133807 (= c!119775 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 _keys!1208)))))

(assert (=> d!133807 (validMask!0 mask!1564)))

(assert (=> d!133807 (= (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!550437)))

(declare-fun b!1212303 () Bool)

(declare-fun res!805086 () Bool)

(assert (=> b!1212303 (=> (not res!805086) (not e!688582))))

(assert (=> b!1212303 (= res!805086 (not (contains!7006 lt!550437 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!59840 () Bool)

(assert (=> bm!59840 (= call!59843 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212304 () Bool)

(declare-fun e!688580 () Bool)

(declare-fun e!688579 () Bool)

(assert (=> b!1212304 (= e!688580 e!688579)))

(assert (=> b!1212304 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 _keys!1208)))))

(declare-fun res!805087 () Bool)

(assert (=> b!1212304 (= res!805087 (contains!7006 lt!550437 (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212304 (=> (not res!805087) (not e!688579))))

(declare-fun b!1212305 () Bool)

(assert (=> b!1212305 (= e!688580 e!688578)))

(declare-fun c!119774 () Bool)

(assert (=> b!1212305 (= c!119774 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 _keys!1208)))))

(declare-fun b!1212306 () Bool)

(declare-fun lt!550435 () Unit!40093)

(declare-fun lt!550438 () Unit!40093)

(assert (=> b!1212306 (= lt!550435 lt!550438)))

(declare-fun lt!550434 () (_ BitVec 64))

(declare-fun lt!550439 () V!46097)

(declare-fun lt!550436 () (_ BitVec 64))

(declare-fun lt!550433 () ListLongMap!17795)

(assert (=> b!1212306 (not (contains!7006 (+!4074 lt!550433 (tuple2!19819 lt!550436 lt!550439)) lt!550434))))

(declare-fun addStillNotContains!298 (ListLongMap!17795 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!40093)

(assert (=> b!1212306 (= lt!550438 (addStillNotContains!298 lt!550433 lt!550436 lt!550439 lt!550434))))

(assert (=> b!1212306 (= lt!550434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212306 (= lt!550439 (get!19289 (select (arr!37768 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212306 (= lt!550436 (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1212306 (= lt!550433 call!59843)))

(assert (=> b!1212306 (= e!688581 (+!4074 call!59843 (tuple2!19819 (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19289 (select (arr!37768 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212307 () Bool)

(assert (=> b!1212307 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 _keys!1208)))))

(assert (=> b!1212307 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38305 _values!996)))))

(declare-fun apply!977 (ListLongMap!17795 (_ BitVec 64)) V!46097)

(assert (=> b!1212307 (= e!688579 (= (apply!977 lt!550437 (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19289 (select (arr!37768 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212308 () Bool)

(assert (=> b!1212308 (= e!688583 e!688581)))

(declare-fun c!119776 () Bool)

(assert (=> b!1212308 (= c!119776 (validKeyInArray!0 (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212309 () Bool)

(assert (=> b!1212309 (= e!688578 (= lt!550437 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212310 () Bool)

(assert (=> b!1212310 (= e!688582 e!688580)))

(declare-fun c!119773 () Bool)

(assert (=> b!1212310 (= c!119773 e!688577)))

(declare-fun res!805088 () Bool)

(assert (=> b!1212310 (=> (not res!805088) (not e!688577))))

(assert (=> b!1212310 (= res!805088 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 _keys!1208)))))

(assert (= (and d!133807 c!119775) b!1212300))

(assert (= (and d!133807 (not c!119775)) b!1212308))

(assert (= (and b!1212308 c!119776) b!1212306))

(assert (= (and b!1212308 (not c!119776)) b!1212301))

(assert (= (or b!1212306 b!1212301) bm!59840))

(assert (= (and d!133807 res!805085) b!1212303))

(assert (= (and b!1212303 res!805086) b!1212310))

(assert (= (and b!1212310 res!805088) b!1212299))

(assert (= (and b!1212310 c!119773) b!1212304))

(assert (= (and b!1212310 (not c!119773)) b!1212305))

(assert (= (and b!1212304 res!805087) b!1212307))

(assert (= (and b!1212305 c!119774) b!1212309))

(assert (= (and b!1212305 (not c!119774)) b!1212302))

(declare-fun b_lambda!21625 () Bool)

(assert (=> (not b_lambda!21625) (not b!1212306)))

(assert (=> b!1212306 t!39617))

(declare-fun b_and!43141 () Bool)

(assert (= b_and!43131 (and (=> t!39617 result!22231) b_and!43141)))

(declare-fun b_lambda!21627 () Bool)

(assert (=> (not b_lambda!21627) (not b!1212307)))

(assert (=> b!1212307 t!39617))

(declare-fun b_and!43143 () Bool)

(assert (= b_and!43141 (and (=> t!39617 result!22231) b_and!43143)))

(declare-fun m!1118041 () Bool)

(assert (=> b!1212306 m!1118041))

(declare-fun m!1118043 () Bool)

(assert (=> b!1212306 m!1118043))

(declare-fun m!1118045 () Bool)

(assert (=> b!1212306 m!1118045))

(declare-fun m!1118047 () Bool)

(assert (=> b!1212306 m!1118047))

(assert (=> b!1212306 m!1117771))

(assert (=> b!1212306 m!1118045))

(assert (=> b!1212306 m!1118041))

(assert (=> b!1212306 m!1117771))

(declare-fun m!1118049 () Bool)

(assert (=> b!1212306 m!1118049))

(declare-fun m!1118051 () Bool)

(assert (=> b!1212306 m!1118051))

(declare-fun m!1118053 () Bool)

(assert (=> b!1212306 m!1118053))

(declare-fun m!1118055 () Bool)

(assert (=> bm!59840 m!1118055))

(assert (=> b!1212307 m!1117771))

(assert (=> b!1212307 m!1118041))

(assert (=> b!1212307 m!1117771))

(assert (=> b!1212307 m!1118049))

(assert (=> b!1212307 m!1118053))

(assert (=> b!1212307 m!1118041))

(assert (=> b!1212307 m!1118053))

(declare-fun m!1118057 () Bool)

(assert (=> b!1212307 m!1118057))

(declare-fun m!1118059 () Bool)

(assert (=> b!1212303 m!1118059))

(declare-fun m!1118061 () Bool)

(assert (=> d!133807 m!1118061))

(assert (=> d!133807 m!1117789))

(assert (=> b!1212308 m!1118053))

(assert (=> b!1212308 m!1118053))

(declare-fun m!1118063 () Bool)

(assert (=> b!1212308 m!1118063))

(declare-fun m!1118065 () Bool)

(assert (=> b!1212302 m!1118065))

(assert (=> b!1212304 m!1118053))

(assert (=> b!1212304 m!1118053))

(declare-fun m!1118067 () Bool)

(assert (=> b!1212304 m!1118067))

(assert (=> b!1212309 m!1118055))

(assert (=> b!1212299 m!1118053))

(assert (=> b!1212299 m!1118053))

(assert (=> b!1212299 m!1118063))

(assert (=> bm!59781 d!133807))

(declare-fun b!1212317 () Bool)

(declare-fun e!688589 () Bool)

(declare-fun e!688588 () Bool)

(assert (=> b!1212317 (= e!688589 e!688588)))

(declare-fun c!119779 () Bool)

(assert (=> b!1212317 (= c!119779 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun call!59849 () ListLongMap!17795)

(declare-fun bm!59846 () Bool)

(assert (=> bm!59846 (= call!59849 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212318 () Bool)

(declare-fun call!59848 () ListLongMap!17795)

(assert (=> b!1212318 (= e!688588 (= call!59848 call!59849))))

(assert (=> b!1212318 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38305 _values!996)))))

(declare-fun b!1212319 () Bool)

(assert (=> b!1212319 (= e!688588 (= call!59848 (-!1842 call!59849 k0!934)))))

(assert (=> b!1212319 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38305 _values!996)))))

(declare-fun bm!59845 () Bool)

(assert (=> bm!59845 (= call!59848 (getCurrentListMapNoExtraKeys!5373 (array!78274 (store (arr!37767 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38304 _keys!1208)) (array!78276 (store (arr!37768 _values!996) i!673 (ValueCellFull!14654 (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38305 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133809 () Bool)

(assert (=> d!133809 e!688589))

(declare-fun res!805091 () Bool)

(assert (=> d!133809 (=> (not res!805091) (not e!688589))))

(assert (=> d!133809 (= res!805091 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38304 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38304 _keys!1208))))))))

(declare-fun lt!550442 () Unit!40093)

(declare-fun choose!1819 (array!78273 array!78275 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40093)

(assert (=> d!133809 (= lt!550442 (choose!1819 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133809 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 _keys!1208)))))

(assert (=> d!133809 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!550442)))

(assert (= (and d!133809 res!805091) b!1212317))

(assert (= (and b!1212317 c!119779) b!1212319))

(assert (= (and b!1212317 (not c!119779)) b!1212318))

(assert (= (or b!1212319 b!1212318) bm!59846))

(assert (= (or b!1212319 b!1212318) bm!59845))

(declare-fun b_lambda!21629 () Bool)

(assert (=> (not b_lambda!21629) (not bm!59845)))

(assert (=> bm!59845 t!39617))

(declare-fun b_and!43145 () Bool)

(assert (= b_and!43143 (and (=> t!39617 result!22231) b_and!43145)))

(assert (=> bm!59846 m!1117793))

(declare-fun m!1118069 () Bool)

(assert (=> b!1212319 m!1118069))

(assert (=> bm!59845 m!1117763))

(assert (=> bm!59845 m!1117771))

(declare-fun m!1118071 () Bool)

(assert (=> bm!59845 m!1118071))

(declare-fun m!1118073 () Bool)

(assert (=> bm!59845 m!1118073))

(declare-fun m!1118075 () Bool)

(assert (=> d!133809 m!1118075))

(assert (=> b!1212036 d!133809))

(declare-fun d!133811 () Bool)

(declare-fun lt!550445 () ListLongMap!17795)

(assert (=> d!133811 (not (contains!7006 lt!550445 k0!934))))

(declare-fun removeStrictlySorted!100 (List!26623 (_ BitVec 64)) List!26623)

(assert (=> d!133811 (= lt!550445 (ListLongMap!17796 (removeStrictlySorted!100 (toList!8913 lt!550250) k0!934)))))

(assert (=> d!133811 (= (-!1842 lt!550250 k0!934) lt!550445)))

(declare-fun bs!34212 () Bool)

(assert (= bs!34212 d!133811))

(declare-fun m!1118077 () Bool)

(assert (=> bs!34212 m!1118077))

(declare-fun m!1118079 () Bool)

(assert (=> bs!34212 m!1118079))

(assert (=> b!1212060 d!133811))

(declare-fun d!133813 () Bool)

(declare-fun e!688591 () Bool)

(assert (=> d!133813 e!688591))

(declare-fun res!805092 () Bool)

(assert (=> d!133813 (=> res!805092 e!688591)))

(declare-fun lt!550446 () Bool)

(assert (=> d!133813 (= res!805092 (not lt!550446))))

(declare-fun lt!550449 () Bool)

(assert (=> d!133813 (= lt!550446 lt!550449)))

(declare-fun lt!550448 () Unit!40093)

(declare-fun e!688590 () Unit!40093)

(assert (=> d!133813 (= lt!550448 e!688590)))

(declare-fun c!119780 () Bool)

(assert (=> d!133813 (= c!119780 lt!550449)))

(assert (=> d!133813 (= lt!550449 (containsKey!597 (toList!8913 lt!550245) k0!934))))

(assert (=> d!133813 (= (contains!7006 lt!550245 k0!934) lt!550446)))

(declare-fun b!1212320 () Bool)

(declare-fun lt!550447 () Unit!40093)

(assert (=> b!1212320 (= e!688590 lt!550447)))

(assert (=> b!1212320 (= lt!550447 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8913 lt!550245) k0!934))))

(assert (=> b!1212320 (isDefined!463 (getValueByKey!635 (toList!8913 lt!550245) k0!934))))

(declare-fun b!1212321 () Bool)

(declare-fun Unit!40107 () Unit!40093)

(assert (=> b!1212321 (= e!688590 Unit!40107)))

(declare-fun b!1212322 () Bool)

(assert (=> b!1212322 (= e!688591 (isDefined!463 (getValueByKey!635 (toList!8913 lt!550245) k0!934)))))

(assert (= (and d!133813 c!119780) b!1212320))

(assert (= (and d!133813 (not c!119780)) b!1212321))

(assert (= (and d!133813 (not res!805092)) b!1212322))

(declare-fun m!1118081 () Bool)

(assert (=> d!133813 m!1118081))

(declare-fun m!1118083 () Bool)

(assert (=> b!1212320 m!1118083))

(declare-fun m!1118085 () Bool)

(assert (=> b!1212320 m!1118085))

(assert (=> b!1212320 m!1118085))

(declare-fun m!1118087 () Bool)

(assert (=> b!1212320 m!1118087))

(assert (=> b!1212322 m!1118085))

(assert (=> b!1212322 m!1118085))

(assert (=> b!1212322 m!1118087))

(assert (=> b!1212060 d!133813))

(declare-fun d!133815 () Bool)

(declare-fun lt!550450 () ListLongMap!17795)

(assert (=> d!133815 (not (contains!7006 lt!550450 (select (arr!37767 _keys!1208) from!1455)))))

(assert (=> d!133815 (= lt!550450 (ListLongMap!17796 (removeStrictlySorted!100 (toList!8913 (+!4074 lt!550245 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))) (select (arr!37767 _keys!1208) from!1455))))))

(assert (=> d!133815 (= (-!1842 (+!4074 lt!550245 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)) (select (arr!37767 _keys!1208) from!1455)) lt!550450)))

(declare-fun bs!34213 () Bool)

(assert (= bs!34213 d!133815))

(assert (=> bs!34213 m!1117797))

(declare-fun m!1118089 () Bool)

(assert (=> bs!34213 m!1118089))

(assert (=> bs!34213 m!1117797))

(declare-fun m!1118091 () Bool)

(assert (=> bs!34213 m!1118091))

(assert (=> b!1212060 d!133815))

(declare-fun d!133817 () Bool)

(declare-fun c!119783 () Bool)

(assert (=> d!133817 (= c!119783 ((_ is ValueCellFull!14654) (select (arr!37768 _values!996) from!1455)))))

(declare-fun e!688594 () V!46097)

(assert (=> d!133817 (= (get!19289 (select (arr!37768 _values!996) from!1455) lt!550260) e!688594)))

(declare-fun b!1212327 () Bool)

(declare-fun get!19291 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1212327 (= e!688594 (get!19291 (select (arr!37768 _values!996) from!1455) lt!550260))))

(declare-fun b!1212328 () Bool)

(declare-fun get!19292 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1212328 (= e!688594 (get!19292 (select (arr!37768 _values!996) from!1455) lt!550260))))

(assert (= (and d!133817 c!119783) b!1212327))

(assert (= (and d!133817 (not c!119783)) b!1212328))

(assert (=> b!1212327 m!1117801))

(declare-fun m!1118093 () Bool)

(assert (=> b!1212327 m!1118093))

(assert (=> b!1212328 m!1117801))

(declare-fun m!1118095 () Bool)

(assert (=> b!1212328 m!1118095))

(assert (=> b!1212060 d!133817))

(declare-fun d!133819 () Bool)

(assert (=> d!133819 (= (-!1842 (+!4074 lt!550245 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)) (select (arr!37767 _keys!1208) from!1455)) lt!550245)))

(declare-fun lt!550453 () Unit!40093)

(declare-fun choose!1820 (ListLongMap!17795 (_ BitVec 64) V!46097) Unit!40093)

(assert (=> d!133819 (= lt!550453 (choose!1820 lt!550245 (select (arr!37767 _keys!1208) from!1455) lt!550246))))

(assert (=> d!133819 (not (contains!7006 lt!550245 (select (arr!37767 _keys!1208) from!1455)))))

(assert (=> d!133819 (= (addThenRemoveForNewKeyIsSame!272 lt!550245 (select (arr!37767 _keys!1208) from!1455) lt!550246) lt!550453)))

(declare-fun bs!34214 () Bool)

(assert (= bs!34214 d!133819))

(assert (=> bs!34214 m!1117795))

(assert (=> bs!34214 m!1117795))

(assert (=> bs!34214 m!1117797))

(assert (=> bs!34214 m!1117799))

(assert (=> bs!34214 m!1117797))

(declare-fun m!1118097 () Bool)

(assert (=> bs!34214 m!1118097))

(assert (=> bs!34214 m!1117797))

(declare-fun m!1118099 () Bool)

(assert (=> bs!34214 m!1118099))

(assert (=> b!1212060 d!133819))

(assert (=> b!1212060 d!133807))

(declare-fun d!133821 () Bool)

(declare-fun e!688595 () Bool)

(assert (=> d!133821 e!688595))

(declare-fun res!805094 () Bool)

(assert (=> d!133821 (=> (not res!805094) (not e!688595))))

(declare-fun lt!550456 () ListLongMap!17795)

(assert (=> d!133821 (= res!805094 (contains!7006 lt!550456 (_1!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))))))

(declare-fun lt!550457 () List!26623)

(assert (=> d!133821 (= lt!550456 (ListLongMap!17796 lt!550457))))

(declare-fun lt!550454 () Unit!40093)

(declare-fun lt!550455 () Unit!40093)

(assert (=> d!133821 (= lt!550454 lt!550455)))

(assert (=> d!133821 (= (getValueByKey!635 lt!550457 (_1!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))) (Some!685 (_2!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))))))

(assert (=> d!133821 (= lt!550455 (lemmaContainsTupThenGetReturnValue!317 lt!550457 (_1!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)) (_2!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))))))

(assert (=> d!133821 (= lt!550457 (insertStrictlySorted!410 (toList!8913 lt!550245) (_1!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)) (_2!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))))))

(assert (=> d!133821 (= (+!4074 lt!550245 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)) lt!550456)))

(declare-fun b!1212329 () Bool)

(declare-fun res!805093 () Bool)

(assert (=> b!1212329 (=> (not res!805093) (not e!688595))))

(assert (=> b!1212329 (= res!805093 (= (getValueByKey!635 (toList!8913 lt!550456) (_1!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246))) (Some!685 (_2!9920 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)))))))

(declare-fun b!1212330 () Bool)

(assert (=> b!1212330 (= e!688595 (contains!7008 (toList!8913 lt!550456) (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) lt!550246)))))

(assert (= (and d!133821 res!805094) b!1212329))

(assert (= (and b!1212329 res!805093) b!1212330))

(declare-fun m!1118101 () Bool)

(assert (=> d!133821 m!1118101))

(declare-fun m!1118103 () Bool)

(assert (=> d!133821 m!1118103))

(declare-fun m!1118105 () Bool)

(assert (=> d!133821 m!1118105))

(declare-fun m!1118107 () Bool)

(assert (=> d!133821 m!1118107))

(declare-fun m!1118109 () Bool)

(assert (=> b!1212329 m!1118109))

(declare-fun m!1118111 () Bool)

(assert (=> b!1212330 m!1118111))

(assert (=> b!1212060 d!133821))

(declare-fun b!1212331 () Bool)

(declare-fun e!688596 () Bool)

(assert (=> b!1212331 (= e!688596 (validKeyInArray!0 (select (arr!37767 lt!550256) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212331 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1212332 () Bool)

(declare-fun e!688602 () ListLongMap!17795)

(assert (=> b!1212332 (= e!688602 (ListLongMap!17796 Nil!26620))))

(declare-fun b!1212333 () Bool)

(declare-fun e!688600 () ListLongMap!17795)

(declare-fun call!59850 () ListLongMap!17795)

(assert (=> b!1212333 (= e!688600 call!59850)))

(declare-fun b!1212334 () Bool)

(declare-fun e!688597 () Bool)

(declare-fun lt!550462 () ListLongMap!17795)

(assert (=> b!1212334 (= e!688597 (isEmpty!996 lt!550462))))

(declare-fun d!133823 () Bool)

(declare-fun e!688601 () Bool)

(assert (=> d!133823 e!688601))

(declare-fun res!805095 () Bool)

(assert (=> d!133823 (=> (not res!805095) (not e!688601))))

(assert (=> d!133823 (= res!805095 (not (contains!7006 lt!550462 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133823 (= lt!550462 e!688602)))

(declare-fun c!119786 () Bool)

(assert (=> d!133823 (= c!119786 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 lt!550256)))))

(assert (=> d!133823 (validMask!0 mask!1564)))

(assert (=> d!133823 (= (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!550462)))

(declare-fun b!1212335 () Bool)

(declare-fun res!805096 () Bool)

(assert (=> b!1212335 (=> (not res!805096) (not e!688601))))

(assert (=> b!1212335 (= res!805096 (not (contains!7006 lt!550462 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!59847 () Bool)

(assert (=> bm!59847 (= call!59850 (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212336 () Bool)

(declare-fun e!688599 () Bool)

(declare-fun e!688598 () Bool)

(assert (=> b!1212336 (= e!688599 e!688598)))

(assert (=> b!1212336 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 lt!550256)))))

(declare-fun res!805097 () Bool)

(assert (=> b!1212336 (= res!805097 (contains!7006 lt!550462 (select (arr!37767 lt!550256) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212336 (=> (not res!805097) (not e!688598))))

(declare-fun b!1212337 () Bool)

(assert (=> b!1212337 (= e!688599 e!688597)))

(declare-fun c!119785 () Bool)

(assert (=> b!1212337 (= c!119785 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 lt!550256)))))

(declare-fun b!1212338 () Bool)

(declare-fun lt!550460 () Unit!40093)

(declare-fun lt!550463 () Unit!40093)

(assert (=> b!1212338 (= lt!550460 lt!550463)))

(declare-fun lt!550458 () ListLongMap!17795)

(declare-fun lt!550461 () (_ BitVec 64))

(declare-fun lt!550464 () V!46097)

(declare-fun lt!550459 () (_ BitVec 64))

(assert (=> b!1212338 (not (contains!7006 (+!4074 lt!550458 (tuple2!19819 lt!550461 lt!550464)) lt!550459))))

(assert (=> b!1212338 (= lt!550463 (addStillNotContains!298 lt!550458 lt!550461 lt!550464 lt!550459))))

(assert (=> b!1212338 (= lt!550459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212338 (= lt!550464 (get!19289 (select (arr!37768 lt!550251) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212338 (= lt!550461 (select (arr!37767 lt!550256) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1212338 (= lt!550458 call!59850)))

(assert (=> b!1212338 (= e!688600 (+!4074 call!59850 (tuple2!19819 (select (arr!37767 lt!550256) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19289 (select (arr!37768 lt!550251) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212339 () Bool)

(assert (=> b!1212339 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 lt!550256)))))

(assert (=> b!1212339 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38305 lt!550251)))))

(assert (=> b!1212339 (= e!688598 (= (apply!977 lt!550462 (select (arr!37767 lt!550256) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19289 (select (arr!37768 lt!550251) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212340 () Bool)

(assert (=> b!1212340 (= e!688602 e!688600)))

(declare-fun c!119787 () Bool)

(assert (=> b!1212340 (= c!119787 (validKeyInArray!0 (select (arr!37767 lt!550256) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212341 () Bool)

(assert (=> b!1212341 (= e!688597 (= lt!550462 (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212342 () Bool)

(assert (=> b!1212342 (= e!688601 e!688599)))

(declare-fun c!119784 () Bool)

(assert (=> b!1212342 (= c!119784 e!688596)))

(declare-fun res!805098 () Bool)

(assert (=> b!1212342 (=> (not res!805098) (not e!688596))))

(assert (=> b!1212342 (= res!805098 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38304 lt!550256)))))

(assert (= (and d!133823 c!119786) b!1212332))

(assert (= (and d!133823 (not c!119786)) b!1212340))

(assert (= (and b!1212340 c!119787) b!1212338))

(assert (= (and b!1212340 (not c!119787)) b!1212333))

(assert (= (or b!1212338 b!1212333) bm!59847))

(assert (= (and d!133823 res!805095) b!1212335))

(assert (= (and b!1212335 res!805096) b!1212342))

(assert (= (and b!1212342 res!805098) b!1212331))

(assert (= (and b!1212342 c!119784) b!1212336))

(assert (= (and b!1212342 (not c!119784)) b!1212337))

(assert (= (and b!1212336 res!805097) b!1212339))

(assert (= (and b!1212337 c!119785) b!1212341))

(assert (= (and b!1212337 (not c!119785)) b!1212334))

(declare-fun b_lambda!21631 () Bool)

(assert (=> (not b_lambda!21631) (not b!1212338)))

(assert (=> b!1212338 t!39617))

(declare-fun b_and!43147 () Bool)

(assert (= b_and!43145 (and (=> t!39617 result!22231) b_and!43147)))

(declare-fun b_lambda!21633 () Bool)

(assert (=> (not b_lambda!21633) (not b!1212339)))

(assert (=> b!1212339 t!39617))

(declare-fun b_and!43149 () Bool)

(assert (= b_and!43147 (and (=> t!39617 result!22231) b_and!43149)))

(declare-fun m!1118113 () Bool)

(assert (=> b!1212338 m!1118113))

(declare-fun m!1118115 () Bool)

(assert (=> b!1212338 m!1118115))

(declare-fun m!1118117 () Bool)

(assert (=> b!1212338 m!1118117))

(declare-fun m!1118119 () Bool)

(assert (=> b!1212338 m!1118119))

(assert (=> b!1212338 m!1117771))

(assert (=> b!1212338 m!1118117))

(assert (=> b!1212338 m!1118113))

(assert (=> b!1212338 m!1117771))

(declare-fun m!1118121 () Bool)

(assert (=> b!1212338 m!1118121))

(declare-fun m!1118123 () Bool)

(assert (=> b!1212338 m!1118123))

(declare-fun m!1118125 () Bool)

(assert (=> b!1212338 m!1118125))

(declare-fun m!1118127 () Bool)

(assert (=> bm!59847 m!1118127))

(assert (=> b!1212339 m!1117771))

(assert (=> b!1212339 m!1118113))

(assert (=> b!1212339 m!1117771))

(assert (=> b!1212339 m!1118121))

(assert (=> b!1212339 m!1118125))

(assert (=> b!1212339 m!1118113))

(assert (=> b!1212339 m!1118125))

(declare-fun m!1118129 () Bool)

(assert (=> b!1212339 m!1118129))

(declare-fun m!1118131 () Bool)

(assert (=> b!1212335 m!1118131))

(declare-fun m!1118133 () Bool)

(assert (=> d!133823 m!1118133))

(assert (=> d!133823 m!1117789))

(assert (=> b!1212340 m!1118125))

(assert (=> b!1212340 m!1118125))

(declare-fun m!1118135 () Bool)

(assert (=> b!1212340 m!1118135))

(declare-fun m!1118137 () Bool)

(assert (=> b!1212334 m!1118137))

(assert (=> b!1212336 m!1118125))

(assert (=> b!1212336 m!1118125))

(declare-fun m!1118139 () Bool)

(assert (=> b!1212336 m!1118139))

(assert (=> b!1212341 m!1118127))

(assert (=> b!1212331 m!1118125))

(assert (=> b!1212331 m!1118125))

(assert (=> b!1212331 m!1118135))

(assert (=> bm!59785 d!133823))

(declare-fun b!1212343 () Bool)

(declare-fun e!688603 () Bool)

(assert (=> b!1212343 (= e!688603 (validKeyInArray!0 (select (arr!37767 lt!550256) from!1455)))))

(assert (=> b!1212343 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1212344 () Bool)

(declare-fun e!688609 () ListLongMap!17795)

(assert (=> b!1212344 (= e!688609 (ListLongMap!17796 Nil!26620))))

(declare-fun b!1212345 () Bool)

(declare-fun e!688607 () ListLongMap!17795)

(declare-fun call!59851 () ListLongMap!17795)

(assert (=> b!1212345 (= e!688607 call!59851)))

(declare-fun b!1212346 () Bool)

(declare-fun e!688604 () Bool)

(declare-fun lt!550469 () ListLongMap!17795)

(assert (=> b!1212346 (= e!688604 (isEmpty!996 lt!550469))))

(declare-fun d!133825 () Bool)

(declare-fun e!688608 () Bool)

(assert (=> d!133825 e!688608))

(declare-fun res!805099 () Bool)

(assert (=> d!133825 (=> (not res!805099) (not e!688608))))

(assert (=> d!133825 (= res!805099 (not (contains!7006 lt!550469 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133825 (= lt!550469 e!688609)))

(declare-fun c!119790 () Bool)

(assert (=> d!133825 (= c!119790 (bvsge from!1455 (size!38304 lt!550256)))))

(assert (=> d!133825 (validMask!0 mask!1564)))

(assert (=> d!133825 (= (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!550469)))

(declare-fun b!1212347 () Bool)

(declare-fun res!805100 () Bool)

(assert (=> b!1212347 (=> (not res!805100) (not e!688608))))

(assert (=> b!1212347 (= res!805100 (not (contains!7006 lt!550469 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!59848 () Bool)

(assert (=> bm!59848 (= call!59851 (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212348 () Bool)

(declare-fun e!688606 () Bool)

(declare-fun e!688605 () Bool)

(assert (=> b!1212348 (= e!688606 e!688605)))

(assert (=> b!1212348 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38304 lt!550256)))))

(declare-fun res!805101 () Bool)

(assert (=> b!1212348 (= res!805101 (contains!7006 lt!550469 (select (arr!37767 lt!550256) from!1455)))))

(assert (=> b!1212348 (=> (not res!805101) (not e!688605))))

(declare-fun b!1212349 () Bool)

(assert (=> b!1212349 (= e!688606 e!688604)))

(declare-fun c!119789 () Bool)

(assert (=> b!1212349 (= c!119789 (bvslt from!1455 (size!38304 lt!550256)))))

(declare-fun b!1212350 () Bool)

(declare-fun lt!550467 () Unit!40093)

(declare-fun lt!550470 () Unit!40093)

(assert (=> b!1212350 (= lt!550467 lt!550470)))

(declare-fun lt!550465 () ListLongMap!17795)

(declare-fun lt!550468 () (_ BitVec 64))

(declare-fun lt!550466 () (_ BitVec 64))

(declare-fun lt!550471 () V!46097)

(assert (=> b!1212350 (not (contains!7006 (+!4074 lt!550465 (tuple2!19819 lt!550468 lt!550471)) lt!550466))))

(assert (=> b!1212350 (= lt!550470 (addStillNotContains!298 lt!550465 lt!550468 lt!550471 lt!550466))))

(assert (=> b!1212350 (= lt!550466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212350 (= lt!550471 (get!19289 (select (arr!37768 lt!550251) from!1455) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212350 (= lt!550468 (select (arr!37767 lt!550256) from!1455))))

(assert (=> b!1212350 (= lt!550465 call!59851)))

(assert (=> b!1212350 (= e!688607 (+!4074 call!59851 (tuple2!19819 (select (arr!37767 lt!550256) from!1455) (get!19289 (select (arr!37768 lt!550251) from!1455) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212351 () Bool)

(assert (=> b!1212351 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38304 lt!550256)))))

(assert (=> b!1212351 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38305 lt!550251)))))

(assert (=> b!1212351 (= e!688605 (= (apply!977 lt!550469 (select (arr!37767 lt!550256) from!1455)) (get!19289 (select (arr!37768 lt!550251) from!1455) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212352 () Bool)

(assert (=> b!1212352 (= e!688609 e!688607)))

(declare-fun c!119791 () Bool)

(assert (=> b!1212352 (= c!119791 (validKeyInArray!0 (select (arr!37767 lt!550256) from!1455)))))

(declare-fun b!1212353 () Bool)

(assert (=> b!1212353 (= e!688604 (= lt!550469 (getCurrentListMapNoExtraKeys!5373 lt!550256 lt!550251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212354 () Bool)

(assert (=> b!1212354 (= e!688608 e!688606)))

(declare-fun c!119788 () Bool)

(assert (=> b!1212354 (= c!119788 e!688603)))

(declare-fun res!805102 () Bool)

(assert (=> b!1212354 (=> (not res!805102) (not e!688603))))

(assert (=> b!1212354 (= res!805102 (bvslt from!1455 (size!38304 lt!550256)))))

(assert (= (and d!133825 c!119790) b!1212344))

(assert (= (and d!133825 (not c!119790)) b!1212352))

(assert (= (and b!1212352 c!119791) b!1212350))

(assert (= (and b!1212352 (not c!119791)) b!1212345))

(assert (= (or b!1212350 b!1212345) bm!59848))

(assert (= (and d!133825 res!805099) b!1212347))

(assert (= (and b!1212347 res!805100) b!1212354))

(assert (= (and b!1212354 res!805102) b!1212343))

(assert (= (and b!1212354 c!119788) b!1212348))

(assert (= (and b!1212354 (not c!119788)) b!1212349))

(assert (= (and b!1212348 res!805101) b!1212351))

(assert (= (and b!1212349 c!119789) b!1212353))

(assert (= (and b!1212349 (not c!119789)) b!1212346))

(declare-fun b_lambda!21635 () Bool)

(assert (=> (not b_lambda!21635) (not b!1212350)))

(assert (=> b!1212350 t!39617))

(declare-fun b_and!43151 () Bool)

(assert (= b_and!43149 (and (=> t!39617 result!22231) b_and!43151)))

(declare-fun b_lambda!21637 () Bool)

(assert (=> (not b_lambda!21637) (not b!1212351)))

(assert (=> b!1212351 t!39617))

(declare-fun b_and!43153 () Bool)

(assert (= b_and!43151 (and (=> t!39617 result!22231) b_and!43153)))

(declare-fun m!1118141 () Bool)

(assert (=> b!1212350 m!1118141))

(declare-fun m!1118143 () Bool)

(assert (=> b!1212350 m!1118143))

(declare-fun m!1118145 () Bool)

(assert (=> b!1212350 m!1118145))

(declare-fun m!1118147 () Bool)

(assert (=> b!1212350 m!1118147))

(assert (=> b!1212350 m!1117771))

(assert (=> b!1212350 m!1118145))

(assert (=> b!1212350 m!1118141))

(assert (=> b!1212350 m!1117771))

(declare-fun m!1118149 () Bool)

(assert (=> b!1212350 m!1118149))

(declare-fun m!1118151 () Bool)

(assert (=> b!1212350 m!1118151))

(declare-fun m!1118153 () Bool)

(assert (=> b!1212350 m!1118153))

(declare-fun m!1118155 () Bool)

(assert (=> bm!59848 m!1118155))

(assert (=> b!1212351 m!1117771))

(assert (=> b!1212351 m!1118141))

(assert (=> b!1212351 m!1117771))

(assert (=> b!1212351 m!1118149))

(assert (=> b!1212351 m!1118153))

(assert (=> b!1212351 m!1118141))

(assert (=> b!1212351 m!1118153))

(declare-fun m!1118157 () Bool)

(assert (=> b!1212351 m!1118157))

(declare-fun m!1118159 () Bool)

(assert (=> b!1212347 m!1118159))

(declare-fun m!1118161 () Bool)

(assert (=> d!133825 m!1118161))

(assert (=> d!133825 m!1117789))

(assert (=> b!1212352 m!1118153))

(assert (=> b!1212352 m!1118153))

(declare-fun m!1118163 () Bool)

(assert (=> b!1212352 m!1118163))

(declare-fun m!1118165 () Bool)

(assert (=> b!1212346 m!1118165))

(assert (=> b!1212348 m!1118153))

(assert (=> b!1212348 m!1118153))

(declare-fun m!1118167 () Bool)

(assert (=> b!1212348 m!1118167))

(assert (=> b!1212353 m!1118155))

(assert (=> b!1212343 m!1118153))

(assert (=> b!1212343 m!1118153))

(assert (=> b!1212343 m!1118163))

(assert (=> b!1212044 d!133825))

(declare-fun b!1212355 () Bool)

(declare-fun e!688610 () Bool)

(assert (=> b!1212355 (= e!688610 (validKeyInArray!0 (select (arr!37767 _keys!1208) from!1455)))))

(assert (=> b!1212355 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1212356 () Bool)

(declare-fun e!688616 () ListLongMap!17795)

(assert (=> b!1212356 (= e!688616 (ListLongMap!17796 Nil!26620))))

(declare-fun b!1212357 () Bool)

(declare-fun e!688614 () ListLongMap!17795)

(declare-fun call!59852 () ListLongMap!17795)

(assert (=> b!1212357 (= e!688614 call!59852)))

(declare-fun b!1212358 () Bool)

(declare-fun e!688611 () Bool)

(declare-fun lt!550476 () ListLongMap!17795)

(assert (=> b!1212358 (= e!688611 (isEmpty!996 lt!550476))))

(declare-fun d!133827 () Bool)

(declare-fun e!688615 () Bool)

(assert (=> d!133827 e!688615))

(declare-fun res!805103 () Bool)

(assert (=> d!133827 (=> (not res!805103) (not e!688615))))

(assert (=> d!133827 (= res!805103 (not (contains!7006 lt!550476 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133827 (= lt!550476 e!688616)))

(declare-fun c!119794 () Bool)

(assert (=> d!133827 (= c!119794 (bvsge from!1455 (size!38304 _keys!1208)))))

(assert (=> d!133827 (validMask!0 mask!1564)))

(assert (=> d!133827 (= (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!550476)))

(declare-fun b!1212359 () Bool)

(declare-fun res!805104 () Bool)

(assert (=> b!1212359 (=> (not res!805104) (not e!688615))))

(assert (=> b!1212359 (= res!805104 (not (contains!7006 lt!550476 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!59849 () Bool)

(assert (=> bm!59849 (= call!59852 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212360 () Bool)

(declare-fun e!688613 () Bool)

(declare-fun e!688612 () Bool)

(assert (=> b!1212360 (= e!688613 e!688612)))

(assert (=> b!1212360 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38304 _keys!1208)))))

(declare-fun res!805105 () Bool)

(assert (=> b!1212360 (= res!805105 (contains!7006 lt!550476 (select (arr!37767 _keys!1208) from!1455)))))

(assert (=> b!1212360 (=> (not res!805105) (not e!688612))))

(declare-fun b!1212361 () Bool)

(assert (=> b!1212361 (= e!688613 e!688611)))

(declare-fun c!119793 () Bool)

(assert (=> b!1212361 (= c!119793 (bvslt from!1455 (size!38304 _keys!1208)))))

(declare-fun b!1212362 () Bool)

(declare-fun lt!550474 () Unit!40093)

(declare-fun lt!550477 () Unit!40093)

(assert (=> b!1212362 (= lt!550474 lt!550477)))

(declare-fun lt!550473 () (_ BitVec 64))

(declare-fun lt!550472 () ListLongMap!17795)

(declare-fun lt!550478 () V!46097)

(declare-fun lt!550475 () (_ BitVec 64))

(assert (=> b!1212362 (not (contains!7006 (+!4074 lt!550472 (tuple2!19819 lt!550475 lt!550478)) lt!550473))))

(assert (=> b!1212362 (= lt!550477 (addStillNotContains!298 lt!550472 lt!550475 lt!550478 lt!550473))))

(assert (=> b!1212362 (= lt!550473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212362 (= lt!550478 (get!19289 (select (arr!37768 _values!996) from!1455) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212362 (= lt!550475 (select (arr!37767 _keys!1208) from!1455))))

(assert (=> b!1212362 (= lt!550472 call!59852)))

(assert (=> b!1212362 (= e!688614 (+!4074 call!59852 (tuple2!19819 (select (arr!37767 _keys!1208) from!1455) (get!19289 (select (arr!37768 _values!996) from!1455) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212363 () Bool)

(assert (=> b!1212363 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38304 _keys!1208)))))

(assert (=> b!1212363 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38305 _values!996)))))

(assert (=> b!1212363 (= e!688612 (= (apply!977 lt!550476 (select (arr!37767 _keys!1208) from!1455)) (get!19289 (select (arr!37768 _values!996) from!1455) (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212364 () Bool)

(assert (=> b!1212364 (= e!688616 e!688614)))

(declare-fun c!119795 () Bool)

(assert (=> b!1212364 (= c!119795 (validKeyInArray!0 (select (arr!37767 _keys!1208) from!1455)))))

(declare-fun b!1212365 () Bool)

(assert (=> b!1212365 (= e!688611 (= lt!550476 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212366 () Bool)

(assert (=> b!1212366 (= e!688615 e!688613)))

(declare-fun c!119792 () Bool)

(assert (=> b!1212366 (= c!119792 e!688610)))

(declare-fun res!805106 () Bool)

(assert (=> b!1212366 (=> (not res!805106) (not e!688610))))

(assert (=> b!1212366 (= res!805106 (bvslt from!1455 (size!38304 _keys!1208)))))

(assert (= (and d!133827 c!119794) b!1212356))

(assert (= (and d!133827 (not c!119794)) b!1212364))

(assert (= (and b!1212364 c!119795) b!1212362))

(assert (= (and b!1212364 (not c!119795)) b!1212357))

(assert (= (or b!1212362 b!1212357) bm!59849))

(assert (= (and d!133827 res!805103) b!1212359))

(assert (= (and b!1212359 res!805104) b!1212366))

(assert (= (and b!1212366 res!805106) b!1212355))

(assert (= (and b!1212366 c!119792) b!1212360))

(assert (= (and b!1212366 (not c!119792)) b!1212361))

(assert (= (and b!1212360 res!805105) b!1212363))

(assert (= (and b!1212361 c!119793) b!1212365))

(assert (= (and b!1212361 (not c!119793)) b!1212358))

(declare-fun b_lambda!21639 () Bool)

(assert (=> (not b_lambda!21639) (not b!1212362)))

(assert (=> b!1212362 t!39617))

(declare-fun b_and!43155 () Bool)

(assert (= b_and!43153 (and (=> t!39617 result!22231) b_and!43155)))

(declare-fun b_lambda!21641 () Bool)

(assert (=> (not b_lambda!21641) (not b!1212363)))

(assert (=> b!1212363 t!39617))

(declare-fun b_and!43157 () Bool)

(assert (= b_and!43155 (and (=> t!39617 result!22231) b_and!43157)))

(assert (=> b!1212362 m!1117801))

(declare-fun m!1118169 () Bool)

(assert (=> b!1212362 m!1118169))

(declare-fun m!1118171 () Bool)

(assert (=> b!1212362 m!1118171))

(declare-fun m!1118173 () Bool)

(assert (=> b!1212362 m!1118173))

(assert (=> b!1212362 m!1117771))

(assert (=> b!1212362 m!1118171))

(assert (=> b!1212362 m!1117801))

(assert (=> b!1212362 m!1117771))

(declare-fun m!1118175 () Bool)

(assert (=> b!1212362 m!1118175))

(declare-fun m!1118177 () Bool)

(assert (=> b!1212362 m!1118177))

(assert (=> b!1212362 m!1117797))

(declare-fun m!1118179 () Bool)

(assert (=> bm!59849 m!1118179))

(assert (=> b!1212363 m!1117771))

(assert (=> b!1212363 m!1117801))

(assert (=> b!1212363 m!1117771))

(assert (=> b!1212363 m!1118175))

(assert (=> b!1212363 m!1117797))

(assert (=> b!1212363 m!1117801))

(assert (=> b!1212363 m!1117797))

(declare-fun m!1118181 () Bool)

(assert (=> b!1212363 m!1118181))

(declare-fun m!1118183 () Bool)

(assert (=> b!1212359 m!1118183))

(declare-fun m!1118185 () Bool)

(assert (=> d!133827 m!1118185))

(assert (=> d!133827 m!1117789))

(assert (=> b!1212364 m!1117797))

(assert (=> b!1212364 m!1117797))

(declare-fun m!1118187 () Bool)

(assert (=> b!1212364 m!1118187))

(declare-fun m!1118189 () Bool)

(assert (=> b!1212358 m!1118189))

(assert (=> b!1212360 m!1117797))

(assert (=> b!1212360 m!1117797))

(declare-fun m!1118191 () Bool)

(assert (=> b!1212360 m!1118191))

(assert (=> b!1212365 m!1118179))

(assert (=> b!1212355 m!1117797))

(assert (=> b!1212355 m!1117797))

(assert (=> b!1212355 m!1118187))

(assert (=> b!1212044 d!133827))

(declare-fun d!133829 () Bool)

(declare-fun lt!550479 () ListLongMap!17795)

(assert (=> d!133829 (not (contains!7006 lt!550479 k0!934))))

(assert (=> d!133829 (= lt!550479 (ListLongMap!17796 (removeStrictlySorted!100 (toList!8913 call!59785) k0!934)))))

(assert (=> d!133829 (= (-!1842 call!59785 k0!934) lt!550479)))

(declare-fun bs!34215 () Bool)

(assert (= bs!34215 d!133829))

(declare-fun m!1118193 () Bool)

(assert (=> bs!34215 m!1118193))

(declare-fun m!1118195 () Bool)

(assert (=> bs!34215 m!1118195))

(assert (=> b!1212035 d!133829))

(declare-fun d!133831 () Bool)

(declare-fun res!805111 () Bool)

(declare-fun e!688621 () Bool)

(assert (=> d!133831 (=> res!805111 e!688621)))

(assert (=> d!133831 (= res!805111 (= (select (arr!37767 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133831 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!688621)))

(declare-fun b!1212371 () Bool)

(declare-fun e!688622 () Bool)

(assert (=> b!1212371 (= e!688621 e!688622)))

(declare-fun res!805112 () Bool)

(assert (=> b!1212371 (=> (not res!805112) (not e!688622))))

(assert (=> b!1212371 (= res!805112 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38304 _keys!1208)))))

(declare-fun b!1212372 () Bool)

(assert (=> b!1212372 (= e!688622 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133831 (not res!805111)) b!1212371))

(assert (= (and b!1212371 res!805112) b!1212372))

(assert (=> d!133831 m!1118053))

(declare-fun m!1118197 () Bool)

(assert (=> b!1212372 m!1118197))

(assert (=> b!1212062 d!133831))

(declare-fun b!1212381 () Bool)

(declare-fun e!688630 () Bool)

(declare-fun e!688629 () Bool)

(assert (=> b!1212381 (= e!688630 e!688629)))

(declare-fun c!119798 () Bool)

(assert (=> b!1212381 (= c!119798 (validKeyInArray!0 (select (arr!37767 lt!550256) #b00000000000000000000000000000000)))))

(declare-fun d!133833 () Bool)

(declare-fun res!805117 () Bool)

(assert (=> d!133833 (=> res!805117 e!688630)))

(assert (=> d!133833 (= res!805117 (bvsge #b00000000000000000000000000000000 (size!38304 lt!550256)))))

(assert (=> d!133833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550256 mask!1564) e!688630)))

(declare-fun b!1212382 () Bool)

(declare-fun e!688631 () Bool)

(declare-fun call!59855 () Bool)

(assert (=> b!1212382 (= e!688631 call!59855)))

(declare-fun b!1212383 () Bool)

(assert (=> b!1212383 (= e!688629 call!59855)))

(declare-fun b!1212384 () Bool)

(assert (=> b!1212384 (= e!688629 e!688631)))

(declare-fun lt!550487 () (_ BitVec 64))

(assert (=> b!1212384 (= lt!550487 (select (arr!37767 lt!550256) #b00000000000000000000000000000000))))

(declare-fun lt!550486 () Unit!40093)

(assert (=> b!1212384 (= lt!550486 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!550256 lt!550487 #b00000000000000000000000000000000))))

(assert (=> b!1212384 (arrayContainsKey!0 lt!550256 lt!550487 #b00000000000000000000000000000000)))

(declare-fun lt!550488 () Unit!40093)

(assert (=> b!1212384 (= lt!550488 lt!550486)))

(declare-fun res!805118 () Bool)

(declare-datatypes ((SeekEntryResult!9897 0))(
  ( (MissingZero!9897 (index!41959 (_ BitVec 32))) (Found!9897 (index!41960 (_ BitVec 32))) (Intermediate!9897 (undefined!10709 Bool) (index!41961 (_ BitVec 32)) (x!106738 (_ BitVec 32))) (Undefined!9897) (MissingVacant!9897 (index!41962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78273 (_ BitVec 32)) SeekEntryResult!9897)

(assert (=> b!1212384 (= res!805118 (= (seekEntryOrOpen!0 (select (arr!37767 lt!550256) #b00000000000000000000000000000000) lt!550256 mask!1564) (Found!9897 #b00000000000000000000000000000000)))))

(assert (=> b!1212384 (=> (not res!805118) (not e!688631))))

(declare-fun bm!59852 () Bool)

(assert (=> bm!59852 (= call!59855 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!550256 mask!1564))))

(assert (= (and d!133833 (not res!805117)) b!1212381))

(assert (= (and b!1212381 c!119798) b!1212384))

(assert (= (and b!1212381 (not c!119798)) b!1212383))

(assert (= (and b!1212384 res!805118) b!1212382))

(assert (= (or b!1212382 b!1212383) bm!59852))

(assert (=> b!1212381 m!1118033))

(assert (=> b!1212381 m!1118033))

(assert (=> b!1212381 m!1118035))

(assert (=> b!1212384 m!1118033))

(declare-fun m!1118199 () Bool)

(assert (=> b!1212384 m!1118199))

(declare-fun m!1118201 () Bool)

(assert (=> b!1212384 m!1118201))

(assert (=> b!1212384 m!1118033))

(declare-fun m!1118203 () Bool)

(assert (=> b!1212384 m!1118203))

(declare-fun m!1118205 () Bool)

(assert (=> bm!59852 m!1118205))

(assert (=> b!1212053 d!133833))

(assert (=> b!1212038 d!133831))

(declare-fun d!133835 () Bool)

(declare-fun res!805119 () Bool)

(declare-fun e!688632 () Bool)

(assert (=> d!133835 (=> res!805119 e!688632)))

(assert (=> d!133835 (= res!805119 (= (select (arr!37767 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133835 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!688632)))

(declare-fun b!1212385 () Bool)

(declare-fun e!688633 () Bool)

(assert (=> b!1212385 (= e!688632 e!688633)))

(declare-fun res!805120 () Bool)

(assert (=> b!1212385 (=> (not res!805120) (not e!688633))))

(assert (=> b!1212385 (= res!805120 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38304 _keys!1208)))))

(declare-fun b!1212386 () Bool)

(assert (=> b!1212386 (= e!688633 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133835 (not res!805119)) b!1212385))

(assert (= (and b!1212385 res!805120) b!1212386))

(declare-fun m!1118207 () Bool)

(assert (=> d!133835 m!1118207))

(declare-fun m!1118209 () Bool)

(assert (=> b!1212386 m!1118209))

(assert (=> b!1212052 d!133835))

(declare-fun d!133837 () Bool)

(assert (=> d!133837 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550491 () Unit!40093)

(declare-fun choose!13 (array!78273 (_ BitVec 64) (_ BitVec 32)) Unit!40093)

(assert (=> d!133837 (= lt!550491 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133837 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133837 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!550491)))

(declare-fun bs!34216 () Bool)

(assert (= bs!34216 d!133837))

(assert (=> bs!34216 m!1117819))

(declare-fun m!1118211 () Bool)

(assert (=> bs!34216 m!1118211))

(assert (=> b!1212052 d!133837))

(declare-fun d!133839 () Bool)

(assert (=> d!133839 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1212045 d!133839))

(declare-fun b!1212387 () Bool)

(declare-fun e!688637 () Bool)

(declare-fun e!688635 () Bool)

(assert (=> b!1212387 (= e!688637 e!688635)))

(declare-fun res!805121 () Bool)

(assert (=> b!1212387 (=> (not res!805121) (not e!688635))))

(declare-fun e!688634 () Bool)

(assert (=> b!1212387 (= res!805121 (not e!688634))))

(declare-fun res!805122 () Bool)

(assert (=> b!1212387 (=> (not res!805122) (not e!688634))))

(assert (=> b!1212387 (= res!805122 (validKeyInArray!0 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1212388 () Bool)

(declare-fun e!688636 () Bool)

(declare-fun call!59856 () Bool)

(assert (=> b!1212388 (= e!688636 call!59856)))

(declare-fun b!1212389 () Bool)

(assert (=> b!1212389 (= e!688634 (contains!7009 Nil!26621 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1212390 () Bool)

(assert (=> b!1212390 (= e!688636 call!59856)))

(declare-fun d!133841 () Bool)

(declare-fun res!805123 () Bool)

(assert (=> d!133841 (=> res!805123 e!688637)))

(assert (=> d!133841 (= res!805123 (bvsge #b00000000000000000000000000000000 (size!38304 _keys!1208)))))

(assert (=> d!133841 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26621) e!688637)))

(declare-fun bm!59853 () Bool)

(declare-fun c!119799 () Bool)

(assert (=> bm!59853 (= call!59856 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119799 (Cons!26620 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000) Nil!26621) Nil!26621)))))

(declare-fun b!1212391 () Bool)

(assert (=> b!1212391 (= e!688635 e!688636)))

(assert (=> b!1212391 (= c!119799 (validKeyInArray!0 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133841 (not res!805123)) b!1212387))

(assert (= (and b!1212387 res!805122) b!1212389))

(assert (= (and b!1212387 res!805121) b!1212391))

(assert (= (and b!1212391 c!119799) b!1212388))

(assert (= (and b!1212391 (not c!119799)) b!1212390))

(assert (= (or b!1212388 b!1212390) bm!59853))

(assert (=> b!1212387 m!1118207))

(assert (=> b!1212387 m!1118207))

(declare-fun m!1118213 () Bool)

(assert (=> b!1212387 m!1118213))

(assert (=> b!1212389 m!1118207))

(assert (=> b!1212389 m!1118207))

(declare-fun m!1118215 () Bool)

(assert (=> b!1212389 m!1118215))

(assert (=> bm!59853 m!1118207))

(declare-fun m!1118217 () Bool)

(assert (=> bm!59853 m!1118217))

(assert (=> b!1212391 m!1118207))

(assert (=> b!1212391 m!1118207))

(assert (=> b!1212391 m!1118213))

(assert (=> b!1212037 d!133841))

(declare-fun d!133843 () Bool)

(declare-fun e!688640 () Bool)

(assert (=> d!133843 e!688640))

(declare-fun c!119802 () Bool)

(assert (=> d!133843 (= c!119802 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!550494 () Unit!40093)

(declare-fun choose!1821 (array!78273 array!78275 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 64) (_ BitVec 32) Int) Unit!40093)

(assert (=> d!133843 (= lt!550494 (choose!1821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133843 (validMask!0 mask!1564)))

(assert (=> d!133843 (= (lemmaListMapContainsThenArrayContainsFrom!605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!550494)))

(declare-fun b!1212396 () Bool)

(assert (=> b!1212396 (= e!688640 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212397 () Bool)

(assert (=> b!1212397 (= e!688640 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133843 c!119802) b!1212396))

(assert (= (and d!133843 (not c!119802)) b!1212397))

(declare-fun m!1118219 () Bool)

(assert (=> d!133843 m!1118219))

(assert (=> d!133843 m!1117789))

(assert (=> b!1212396 m!1117831))

(assert (=> b!1212056 d!133843))

(declare-fun d!133845 () Bool)

(assert (=> d!133845 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26621)))

(declare-fun lt!550497 () Unit!40093)

(declare-fun choose!39 (array!78273 (_ BitVec 32) (_ BitVec 32)) Unit!40093)

(assert (=> d!133845 (= lt!550497 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133845 (bvslt (size!38304 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133845 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!550497)))

(declare-fun bs!34217 () Bool)

(assert (= bs!34217 d!133845))

(assert (=> bs!34217 m!1117827))

(declare-fun m!1118221 () Bool)

(assert (=> bs!34217 m!1118221))

(assert (=> b!1212056 d!133845))

(declare-fun b!1212398 () Bool)

(declare-fun e!688644 () Bool)

(declare-fun e!688642 () Bool)

(assert (=> b!1212398 (= e!688644 e!688642)))

(declare-fun res!805124 () Bool)

(assert (=> b!1212398 (=> (not res!805124) (not e!688642))))

(declare-fun e!688641 () Bool)

(assert (=> b!1212398 (= res!805124 (not e!688641))))

(declare-fun res!805125 () Bool)

(assert (=> b!1212398 (=> (not res!805125) (not e!688641))))

(assert (=> b!1212398 (= res!805125 (validKeyInArray!0 (select (arr!37767 _keys!1208) from!1455)))))

(declare-fun b!1212399 () Bool)

(declare-fun e!688643 () Bool)

(declare-fun call!59857 () Bool)

(assert (=> b!1212399 (= e!688643 call!59857)))

(declare-fun b!1212400 () Bool)

(assert (=> b!1212400 (= e!688641 (contains!7009 Nil!26621 (select (arr!37767 _keys!1208) from!1455)))))

(declare-fun b!1212401 () Bool)

(assert (=> b!1212401 (= e!688643 call!59857)))

(declare-fun d!133847 () Bool)

(declare-fun res!805126 () Bool)

(assert (=> d!133847 (=> res!805126 e!688644)))

(assert (=> d!133847 (= res!805126 (bvsge from!1455 (size!38304 _keys!1208)))))

(assert (=> d!133847 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26621) e!688644)))

(declare-fun c!119803 () Bool)

(declare-fun bm!59854 () Bool)

(assert (=> bm!59854 (= call!59857 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119803 (Cons!26620 (select (arr!37767 _keys!1208) from!1455) Nil!26621) Nil!26621)))))

(declare-fun b!1212402 () Bool)

(assert (=> b!1212402 (= e!688642 e!688643)))

(assert (=> b!1212402 (= c!119803 (validKeyInArray!0 (select (arr!37767 _keys!1208) from!1455)))))

(assert (= (and d!133847 (not res!805126)) b!1212398))

(assert (= (and b!1212398 res!805125) b!1212400))

(assert (= (and b!1212398 res!805124) b!1212402))

(assert (= (and b!1212402 c!119803) b!1212399))

(assert (= (and b!1212402 (not c!119803)) b!1212401))

(assert (= (or b!1212399 b!1212401) bm!59854))

(assert (=> b!1212398 m!1117797))

(assert (=> b!1212398 m!1117797))

(assert (=> b!1212398 m!1118187))

(assert (=> b!1212400 m!1117797))

(assert (=> b!1212400 m!1117797))

(declare-fun m!1118223 () Bool)

(assert (=> b!1212400 m!1118223))

(assert (=> bm!59854 m!1117797))

(declare-fun m!1118225 () Bool)

(assert (=> bm!59854 m!1118225))

(assert (=> b!1212402 m!1117797))

(assert (=> b!1212402 m!1117797))

(assert (=> b!1212402 m!1118187))

(assert (=> b!1212056 d!133847))

(declare-fun d!133849 () Bool)

(assert (=> d!133849 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38304 _keys!1208)) (not (= (select (arr!37767 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!550500 () Unit!40093)

(declare-fun choose!21 (array!78273 (_ BitVec 64) (_ BitVec 32) List!26624) Unit!40093)

(assert (=> d!133849 (= lt!550500 (choose!21 _keys!1208 k0!934 from!1455 Nil!26621))))

(assert (=> d!133849 (bvslt (size!38304 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133849 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26621) lt!550500)))

(declare-fun bs!34218 () Bool)

(assert (= bs!34218 d!133849))

(assert (=> bs!34218 m!1117797))

(declare-fun m!1118227 () Bool)

(assert (=> bs!34218 m!1118227))

(assert (=> b!1212056 d!133849))

(declare-fun d!133851 () Bool)

(declare-fun e!688645 () Bool)

(assert (=> d!133851 e!688645))

(declare-fun res!805128 () Bool)

(assert (=> d!133851 (=> (not res!805128) (not e!688645))))

(declare-fun lt!550503 () ListLongMap!17795)

(assert (=> d!133851 (= res!805128 (contains!7006 lt!550503 (_1!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!550504 () List!26623)

(assert (=> d!133851 (= lt!550503 (ListLongMap!17796 lt!550504))))

(declare-fun lt!550501 () Unit!40093)

(declare-fun lt!550502 () Unit!40093)

(assert (=> d!133851 (= lt!550501 lt!550502)))

(assert (=> d!133851 (= (getValueByKey!635 lt!550504 (_1!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!685 (_2!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133851 (= lt!550502 (lemmaContainsTupThenGetReturnValue!317 lt!550504 (_1!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133851 (= lt!550504 (insertStrictlySorted!410 (toList!8913 (ite c!119721 lt!550259 lt!550245)) (_1!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133851 (= (+!4074 (ite c!119721 lt!550259 lt!550245) (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!550503)))

(declare-fun b!1212403 () Bool)

(declare-fun res!805127 () Bool)

(assert (=> b!1212403 (=> (not res!805127) (not e!688645))))

(assert (=> b!1212403 (= res!805127 (= (getValueByKey!635 (toList!8913 lt!550503) (_1!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!685 (_2!9920 (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1212404 () Bool)

(assert (=> b!1212404 (= e!688645 (contains!7008 (toList!8913 lt!550503) (ite c!119721 (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119717 (tuple2!19819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133851 res!805128) b!1212403))

(assert (= (and b!1212403 res!805127) b!1212404))

(declare-fun m!1118229 () Bool)

(assert (=> d!133851 m!1118229))

(declare-fun m!1118231 () Bool)

(assert (=> d!133851 m!1118231))

(declare-fun m!1118233 () Bool)

(assert (=> d!133851 m!1118233))

(declare-fun m!1118235 () Bool)

(assert (=> d!133851 m!1118235))

(declare-fun m!1118237 () Bool)

(assert (=> b!1212403 m!1118237))

(declare-fun m!1118239 () Bool)

(assert (=> b!1212404 m!1118239))

(assert (=> bm!59779 d!133851))

(declare-fun d!133853 () Bool)

(declare-fun e!688647 () Bool)

(assert (=> d!133853 e!688647))

(declare-fun res!805129 () Bool)

(assert (=> d!133853 (=> res!805129 e!688647)))

(declare-fun lt!550505 () Bool)

(assert (=> d!133853 (= res!805129 (not lt!550505))))

(declare-fun lt!550508 () Bool)

(assert (=> d!133853 (= lt!550505 lt!550508)))

(declare-fun lt!550507 () Unit!40093)

(declare-fun e!688646 () Unit!40093)

(assert (=> d!133853 (= lt!550507 e!688646)))

(declare-fun c!119804 () Bool)

(assert (=> d!133853 (= c!119804 lt!550508)))

(assert (=> d!133853 (= lt!550508 (containsKey!597 (toList!8913 (ite c!119721 lt!550259 call!59783)) k0!934))))

(assert (=> d!133853 (= (contains!7006 (ite c!119721 lt!550259 call!59783) k0!934) lt!550505)))

(declare-fun b!1212405 () Bool)

(declare-fun lt!550506 () Unit!40093)

(assert (=> b!1212405 (= e!688646 lt!550506)))

(assert (=> b!1212405 (= lt!550506 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8913 (ite c!119721 lt!550259 call!59783)) k0!934))))

(assert (=> b!1212405 (isDefined!463 (getValueByKey!635 (toList!8913 (ite c!119721 lt!550259 call!59783)) k0!934))))

(declare-fun b!1212406 () Bool)

(declare-fun Unit!40108 () Unit!40093)

(assert (=> b!1212406 (= e!688646 Unit!40108)))

(declare-fun b!1212407 () Bool)

(assert (=> b!1212407 (= e!688647 (isDefined!463 (getValueByKey!635 (toList!8913 (ite c!119721 lt!550259 call!59783)) k0!934)))))

(assert (= (and d!133853 c!119804) b!1212405))

(assert (= (and d!133853 (not c!119804)) b!1212406))

(assert (= (and d!133853 (not res!805129)) b!1212407))

(declare-fun m!1118241 () Bool)

(assert (=> d!133853 m!1118241))

(declare-fun m!1118243 () Bool)

(assert (=> b!1212405 m!1118243))

(declare-fun m!1118245 () Bool)

(assert (=> b!1212405 m!1118245))

(assert (=> b!1212405 m!1118245))

(declare-fun m!1118247 () Bool)

(assert (=> b!1212405 m!1118247))

(assert (=> b!1212407 m!1118245))

(assert (=> b!1212407 m!1118245))

(assert (=> b!1212407 m!1118247))

(assert (=> bm!59786 d!133853))

(declare-fun d!133855 () Bool)

(assert (=> d!133855 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1212055 d!133855))

(declare-fun b!1212408 () Bool)

(declare-fun e!688649 () Bool)

(declare-fun e!688648 () Bool)

(assert (=> b!1212408 (= e!688649 e!688648)))

(declare-fun c!119805 () Bool)

(assert (=> b!1212408 (= c!119805 (validKeyInArray!0 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133857 () Bool)

(declare-fun res!805130 () Bool)

(assert (=> d!133857 (=> res!805130 e!688649)))

(assert (=> d!133857 (= res!805130 (bvsge #b00000000000000000000000000000000 (size!38304 _keys!1208)))))

(assert (=> d!133857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!688649)))

(declare-fun b!1212409 () Bool)

(declare-fun e!688650 () Bool)

(declare-fun call!59858 () Bool)

(assert (=> b!1212409 (= e!688650 call!59858)))

(declare-fun b!1212410 () Bool)

(assert (=> b!1212410 (= e!688648 call!59858)))

(declare-fun b!1212411 () Bool)

(assert (=> b!1212411 (= e!688648 e!688650)))

(declare-fun lt!550510 () (_ BitVec 64))

(assert (=> b!1212411 (= lt!550510 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!550509 () Unit!40093)

(assert (=> b!1212411 (= lt!550509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!550510 #b00000000000000000000000000000000))))

(assert (=> b!1212411 (arrayContainsKey!0 _keys!1208 lt!550510 #b00000000000000000000000000000000)))

(declare-fun lt!550511 () Unit!40093)

(assert (=> b!1212411 (= lt!550511 lt!550509)))

(declare-fun res!805131 () Bool)

(assert (=> b!1212411 (= res!805131 (= (seekEntryOrOpen!0 (select (arr!37767 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9897 #b00000000000000000000000000000000)))))

(assert (=> b!1212411 (=> (not res!805131) (not e!688650))))

(declare-fun bm!59855 () Bool)

(assert (=> bm!59855 (= call!59858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133857 (not res!805130)) b!1212408))

(assert (= (and b!1212408 c!119805) b!1212411))

(assert (= (and b!1212408 (not c!119805)) b!1212410))

(assert (= (and b!1212411 res!805131) b!1212409))

(assert (= (or b!1212409 b!1212410) bm!59855))

(assert (=> b!1212408 m!1118207))

(assert (=> b!1212408 m!1118207))

(assert (=> b!1212408 m!1118213))

(assert (=> b!1212411 m!1118207))

(declare-fun m!1118249 () Bool)

(assert (=> b!1212411 m!1118249))

(declare-fun m!1118251 () Bool)

(assert (=> b!1212411 m!1118251))

(assert (=> b!1212411 m!1118207))

(declare-fun m!1118253 () Bool)

(assert (=> b!1212411 m!1118253))

(declare-fun m!1118255 () Bool)

(assert (=> bm!59855 m!1118255))

(assert (=> b!1212054 d!133857))

(declare-fun mapNonEmpty!47968 () Bool)

(declare-fun mapRes!47968 () Bool)

(declare-fun tp!91100 () Bool)

(declare-fun e!688655 () Bool)

(assert (=> mapNonEmpty!47968 (= mapRes!47968 (and tp!91100 e!688655))))

(declare-fun mapRest!47968 () (Array (_ BitVec 32) ValueCell!14654))

(declare-fun mapValue!47968 () ValueCell!14654)

(declare-fun mapKey!47968 () (_ BitVec 32))

(assert (=> mapNonEmpty!47968 (= mapRest!47959 (store mapRest!47968 mapKey!47968 mapValue!47968))))

(declare-fun b!1212418 () Bool)

(assert (=> b!1212418 (= e!688655 tp_is_empty!30727)))

(declare-fun mapIsEmpty!47968 () Bool)

(assert (=> mapIsEmpty!47968 mapRes!47968))

(declare-fun condMapEmpty!47968 () Bool)

(declare-fun mapDefault!47968 () ValueCell!14654)

(assert (=> mapNonEmpty!47959 (= condMapEmpty!47968 (= mapRest!47959 ((as const (Array (_ BitVec 32) ValueCell!14654)) mapDefault!47968)))))

(declare-fun e!688656 () Bool)

(assert (=> mapNonEmpty!47959 (= tp!91084 (and e!688656 mapRes!47968))))

(declare-fun b!1212419 () Bool)

(assert (=> b!1212419 (= e!688656 tp_is_empty!30727)))

(assert (= (and mapNonEmpty!47959 condMapEmpty!47968) mapIsEmpty!47968))

(assert (= (and mapNonEmpty!47959 (not condMapEmpty!47968)) mapNonEmpty!47968))

(assert (= (and mapNonEmpty!47968 ((_ is ValueCellFull!14654) mapValue!47968)) b!1212418))

(assert (= (and mapNonEmpty!47959 ((_ is ValueCellFull!14654) mapDefault!47968)) b!1212419))

(declare-fun m!1118257 () Bool)

(assert (=> mapNonEmpty!47968 m!1118257))

(declare-fun b_lambda!21643 () Bool)

(assert (= b_lambda!21631 (or (and start!101260 b_free!26023) b_lambda!21643)))

(declare-fun b_lambda!21645 () Bool)

(assert (= b_lambda!21627 (or (and start!101260 b_free!26023) b_lambda!21645)))

(declare-fun b_lambda!21647 () Bool)

(assert (= b_lambda!21629 (or (and start!101260 b_free!26023) b_lambda!21647)))

(declare-fun b_lambda!21649 () Bool)

(assert (= b_lambda!21633 (or (and start!101260 b_free!26023) b_lambda!21649)))

(declare-fun b_lambda!21651 () Bool)

(assert (= b_lambda!21639 (or (and start!101260 b_free!26023) b_lambda!21651)))

(declare-fun b_lambda!21653 () Bool)

(assert (= b_lambda!21641 (or (and start!101260 b_free!26023) b_lambda!21653)))

(declare-fun b_lambda!21655 () Bool)

(assert (= b_lambda!21635 (or (and start!101260 b_free!26023) b_lambda!21655)))

(declare-fun b_lambda!21657 () Bool)

(assert (= b_lambda!21625 (or (and start!101260 b_free!26023) b_lambda!21657)))

(declare-fun b_lambda!21659 () Bool)

(assert (= b_lambda!21637 (or (and start!101260 b_free!26023) b_lambda!21659)))

(check-sat (not mapNonEmpty!47968) (not d!133823) (not b!1212365) (not b!1212322) tp_is_empty!30727 (not b!1212402) (not d!133843) (not bm!59847) (not bm!59848) (not b!1212302) (not b!1212372) (not b!1212304) (not b!1212299) (not b!1212335) (not b!1212309) (not b!1212331) (not b!1212338) (not d!133851) (not b!1212391) (not b!1212411) (not b!1212389) (not d!133821) (not d!133853) (not b!1212355) (not b!1212404) (not bm!59852) (not d!133807) (not b!1212343) (not b_lambda!21623) (not b!1212362) (not b!1212407) b_and!43157 (not d!133815) (not b!1212403) (not b_lambda!21643) (not b_lambda!21647) (not b!1212363) (not b!1212328) (not b!1212303) (not b!1212306) (not b!1212329) (not b_lambda!21651) (not b!1212384) (not b_lambda!21649) (not b!1212274) (not b_lambda!21657) (not b_lambda!21655) (not b!1212327) (not d!133827) (not b!1212272) (not b!1212339) (not b!1212320) (not d!133803) (not b!1212250) (not d!133849) (not d!133825) (not b!1212353) (not d!133797) (not d!133829) (not b!1212319) (not b!1212348) (not b!1212381) (not d!133801) (not b_lambda!21653) (not b!1212396) (not b!1212359) (not bm!59845) (not d!133799) (not bm!59840) (not b!1212360) (not bm!59846) (not b!1212334) (not d!133809) (not d!133811) (not b!1212336) (not b!1212347) (not bm!59854) (not b!1212330) (not d!133819) (not b_lambda!21659) (not b!1212387) (not b!1212270) (not b!1212308) (not d!133845) (not b!1212307) (not b!1212340) (not b!1212352) (not bm!59849) (not b_lambda!21645) (not b!1212386) (not b_next!26023) (not bm!59855) (not b!1212258) (not d!133837) (not b!1212341) (not bm!59837) (not b!1212364) (not b!1212351) (not b!1212405) (not b!1212400) (not b!1212408) (not b!1212358) (not b!1212252) (not b!1212398) (not d!133813) (not b!1212257) (not bm!59853) (not b!1212346) (not b!1212350))
(check-sat b_and!43157 (not b_next!26023))
