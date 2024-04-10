; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99004 () Bool)

(assert start!99004)

(declare-fun b_free!24609 () Bool)

(declare-fun b_next!24609 () Bool)

(assert (=> start!99004 (= b_free!24609 (not b_next!24609))))

(declare-fun tp!86538 () Bool)

(declare-fun b_and!40067 () Bool)

(assert (=> start!99004 (= tp!86538 b_and!40067)))

(declare-fun b!1163026 () Bool)

(declare-datatypes ((Unit!38378 0))(
  ( (Unit!38379) )
))
(declare-fun e!661319 () Unit!38378)

(declare-fun lt!523839 () Unit!38378)

(assert (=> b!1163026 (= e!661319 lt!523839)))

(declare-fun call!56852 () Unit!38378)

(assert (=> b!1163026 (= lt!523839 call!56852)))

(declare-fun call!56855 () Bool)

(assert (=> b!1163026 call!56855))

(declare-fun b!1163027 () Bool)

(declare-fun e!661321 () Unit!38378)

(declare-fun Unit!38380 () Unit!38378)

(assert (=> b!1163027 (= e!661321 Unit!38380)))

(declare-fun e!661320 () Bool)

(declare-datatypes ((V!43979 0))(
  ( (V!43980 (val!14626 Int)) )
))
(declare-datatypes ((tuple2!18648 0))(
  ( (tuple2!18649 (_1!9335 (_ BitVec 64)) (_2!9335 V!43979)) )
))
(declare-datatypes ((List!25381 0))(
  ( (Nil!25378) (Cons!25377 (h!26586 tuple2!18648) (t!36982 List!25381)) )
))
(declare-datatypes ((ListLongMap!16617 0))(
  ( (ListLongMap!16618 (toList!8324 List!25381)) )
))
(declare-fun call!56854 () ListLongMap!16617)

(declare-fun b!1163028 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!56851 () ListLongMap!16617)

(declare-fun -!1429 (ListLongMap!16617 (_ BitVec 64)) ListLongMap!16617)

(assert (=> b!1163028 (= e!661320 (= call!56854 (-!1429 call!56851 k0!934)))))

(declare-fun mapIsEmpty!45533 () Bool)

(declare-fun mapRes!45533 () Bool)

(assert (=> mapIsEmpty!45533 mapRes!45533))

(declare-fun b!1163029 () Bool)

(declare-datatypes ((array!75117 0))(
  ( (array!75118 (arr!36209 (Array (_ BitVec 32) (_ BitVec 64))) (size!36745 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75117)

(declare-fun e!661317 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!75117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163029 (= e!661317 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163030 () Bool)

(declare-fun res!771382 () Bool)

(declare-fun e!661313 () Bool)

(assert (=> b!1163030 (=> (not res!771382) (not e!661313))))

(declare-datatypes ((List!25382 0))(
  ( (Nil!25379) (Cons!25378 (h!26587 (_ BitVec 64)) (t!36983 List!25382)) )
))
(declare-fun arrayNoDuplicates!0 (array!75117 (_ BitVec 32) List!25382) Bool)

(assert (=> b!1163030 (= res!771382 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25379))))

(declare-fun zeroValue!944 () V!43979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1163031 () Bool)

(declare-fun lt!523851 () ListLongMap!16617)

(declare-fun minValue!944 () V!43979)

(declare-fun lt!523849 () array!75117)

(declare-fun e!661327 () Bool)

(declare-datatypes ((ValueCell!13860 0))(
  ( (ValueCellFull!13860 (v!17263 V!43979)) (EmptyCell!13860) )
))
(declare-datatypes ((array!75119 0))(
  ( (array!75120 (arr!36210 (Array (_ BitVec 32) ValueCell!13860)) (size!36746 (_ BitVec 32))) )
))
(declare-fun lt!523843 () array!75119)

(declare-fun getCurrentListMapNoExtraKeys!4788 (array!75117 array!75119 (_ BitVec 32) (_ BitVec 32) V!43979 V!43979 (_ BitVec 32) Int) ListLongMap!16617)

(assert (=> b!1163031 (= e!661327 (= lt!523851 (getCurrentListMapNoExtraKeys!4788 lt!523849 lt!523843 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163032 () Bool)

(declare-fun res!771381 () Bool)

(assert (=> b!1163032 (=> (not res!771381) (not e!661313))))

(declare-fun _values!996 () array!75119)

(assert (=> b!1163032 (= res!771381 (and (= (size!36746 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36745 _keys!1208) (size!36746 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!523836 () ListLongMap!16617)

(declare-fun c!116344 () Bool)

(declare-fun call!56853 () ListLongMap!16617)

(declare-fun bm!56847 () Bool)

(declare-fun c!116341 () Bool)

(declare-fun +!3728 (ListLongMap!16617 tuple2!18648) ListLongMap!16617)

(assert (=> bm!56847 (= call!56853 (+!3728 lt!523836 (ite (or c!116341 c!116344) (tuple2!18649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!56848 () Bool)

(declare-fun call!56850 () Unit!38378)

(declare-fun lt!523830 () ListLongMap!16617)

(declare-fun addStillContains!968 (ListLongMap!16617 (_ BitVec 64) V!43979 (_ BitVec 64)) Unit!38378)

(assert (=> bm!56848 (= call!56850 (addStillContains!968 (ite c!116341 lt!523830 lt!523836) (ite c!116341 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116344 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116341 minValue!944 (ite c!116344 zeroValue!944 minValue!944)) k0!934))))

(declare-fun call!56856 () Bool)

(declare-fun call!56857 () ListLongMap!16617)

(declare-fun bm!56849 () Bool)

(declare-fun contains!6828 (ListLongMap!16617 (_ BitVec 64)) Bool)

(assert (=> bm!56849 (= call!56856 (contains!6828 (ite c!116341 lt!523830 call!56857) k0!934))))

(declare-fun e!661324 () Bool)

(declare-fun b!1163034 () Bool)

(assert (=> b!1163034 (= e!661324 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56850 () Bool)

(assert (=> bm!56850 (= call!56855 call!56856)))

(declare-fun b!1163035 () Bool)

(declare-fun res!771371 () Bool)

(declare-fun e!661325 () Bool)

(assert (=> b!1163035 (=> (not res!771371) (not e!661325))))

(assert (=> b!1163035 (= res!771371 (arrayNoDuplicates!0 lt!523849 #b00000000000000000000000000000000 Nil!25379))))

(declare-fun b!1163036 () Bool)

(declare-fun res!771376 () Bool)

(assert (=> b!1163036 (=> (not res!771376) (not e!661313))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163036 (= res!771376 (= (select (arr!36209 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45533 () Bool)

(declare-fun tp!86537 () Bool)

(declare-fun e!661316 () Bool)

(assert (=> mapNonEmpty!45533 (= mapRes!45533 (and tp!86537 e!661316))))

(declare-fun mapRest!45533 () (Array (_ BitVec 32) ValueCell!13860))

(declare-fun mapKey!45533 () (_ BitVec 32))

(declare-fun mapValue!45533 () ValueCell!13860)

(assert (=> mapNonEmpty!45533 (= (arr!36210 _values!996) (store mapRest!45533 mapKey!45533 mapValue!45533))))

(declare-fun b!1163037 () Bool)

(declare-fun e!661318 () Bool)

(declare-fun e!661329 () Bool)

(assert (=> b!1163037 (= e!661318 e!661329)))

(declare-fun res!771373 () Bool)

(assert (=> b!1163037 (=> res!771373 e!661329)))

(assert (=> b!1163037 (= res!771373 (not (= (select (arr!36209 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1163037 e!661320))

(declare-fun c!116339 () Bool)

(assert (=> b!1163037 (= c!116339 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523831 () Unit!38378)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!657 (array!75117 array!75119 (_ BitVec 32) (_ BitVec 32) V!43979 V!43979 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38378)

(assert (=> b!1163037 (= lt!523831 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163038 () Bool)

(assert (=> b!1163038 (= e!661313 e!661325)))

(declare-fun res!771383 () Bool)

(assert (=> b!1163038 (=> (not res!771383) (not e!661325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75117 (_ BitVec 32)) Bool)

(assert (=> b!1163038 (= res!771383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523849 mask!1564))))

(assert (=> b!1163038 (= lt!523849 (array!75118 (store (arr!36209 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36745 _keys!1208)))))

(declare-fun b!1163039 () Bool)

(declare-fun e!661323 () Bool)

(assert (=> b!1163039 (= e!661325 (not e!661323))))

(declare-fun res!771377 () Bool)

(assert (=> b!1163039 (=> res!771377 e!661323)))

(assert (=> b!1163039 (= res!771377 (bvsgt from!1455 i!673))))

(assert (=> b!1163039 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523841 () Unit!38378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75117 (_ BitVec 64) (_ BitVec 32)) Unit!38378)

(assert (=> b!1163039 (= lt!523841 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163040 () Bool)

(declare-fun e!661328 () Unit!38378)

(assert (=> b!1163040 (= e!661319 e!661328)))

(declare-fun c!116343 () Bool)

(declare-fun lt!523834 () Bool)

(assert (=> b!1163040 (= c!116343 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523834))))

(declare-fun b!1163041 () Bool)

(assert (=> b!1163041 (contains!6828 (+!3728 lt!523830 (tuple2!18649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!523837 () Unit!38378)

(assert (=> b!1163041 (= lt!523837 call!56850)))

(assert (=> b!1163041 call!56856))

(assert (=> b!1163041 (= lt!523830 call!56853)))

(declare-fun lt!523846 () Unit!38378)

(assert (=> b!1163041 (= lt!523846 (addStillContains!968 lt!523836 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!661322 () Unit!38378)

(assert (=> b!1163041 (= e!661322 lt!523837)))

(declare-fun b!1163042 () Bool)

(assert (=> b!1163042 call!56855))

(declare-fun lt!523845 () Unit!38378)

(assert (=> b!1163042 (= lt!523845 call!56852)))

(assert (=> b!1163042 (= e!661328 lt!523845)))

(declare-fun b!1163043 () Bool)

(assert (=> b!1163043 (= e!661320 (= call!56854 call!56851))))

(declare-fun b!1163044 () Bool)

(declare-fun e!661326 () Bool)

(declare-fun e!661314 () Bool)

(assert (=> b!1163044 (= e!661326 (and e!661314 mapRes!45533))))

(declare-fun condMapEmpty!45533 () Bool)

(declare-fun mapDefault!45533 () ValueCell!13860)

(assert (=> b!1163044 (= condMapEmpty!45533 (= (arr!36210 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13860)) mapDefault!45533)))))

(declare-fun bm!56851 () Bool)

(assert (=> bm!56851 (= call!56854 (getCurrentListMapNoExtraKeys!4788 lt!523849 lt!523843 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56852 () Bool)

(assert (=> bm!56852 (= call!56852 call!56850)))

(declare-fun bm!56853 () Bool)

(assert (=> bm!56853 (= call!56857 call!56853)))

(declare-fun b!1163045 () Bool)

(assert (=> b!1163045 (= e!661329 true)))

(assert (=> b!1163045 e!661327))

(declare-fun res!771374 () Bool)

(assert (=> b!1163045 (=> (not res!771374) (not e!661327))))

(assert (=> b!1163045 (= res!771374 (= lt!523851 lt!523836))))

(declare-fun lt!523832 () ListLongMap!16617)

(assert (=> b!1163045 (= lt!523851 (-!1429 lt!523832 k0!934))))

(declare-fun lt!523833 () V!43979)

(assert (=> b!1163045 (= (-!1429 (+!3728 lt!523836 (tuple2!18649 (select (arr!36209 _keys!1208) from!1455) lt!523833)) (select (arr!36209 _keys!1208) from!1455)) lt!523836)))

(declare-fun lt!523835 () Unit!38378)

(declare-fun addThenRemoveForNewKeyIsSame!262 (ListLongMap!16617 (_ BitVec 64) V!43979) Unit!38378)

(assert (=> b!1163045 (= lt!523835 (addThenRemoveForNewKeyIsSame!262 lt!523836 (select (arr!36209 _keys!1208) from!1455) lt!523833))))

(declare-fun lt!523844 () V!43979)

(declare-fun get!18478 (ValueCell!13860 V!43979) V!43979)

(assert (=> b!1163045 (= lt!523833 (get!18478 (select (arr!36210 _values!996) from!1455) lt!523844))))

(declare-fun lt!523840 () Unit!38378)

(assert (=> b!1163045 (= lt!523840 e!661321)))

(declare-fun c!116340 () Bool)

(assert (=> b!1163045 (= c!116340 (contains!6828 lt!523836 k0!934))))

(assert (=> b!1163045 (= lt!523836 (getCurrentListMapNoExtraKeys!4788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163046 () Bool)

(assert (=> b!1163046 (= c!116344 (and (not lt!523834) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1163046 (= e!661322 e!661319)))

(declare-fun b!1163047 () Bool)

(declare-fun tp_is_empty!29139 () Bool)

(assert (=> b!1163047 (= e!661314 tp_is_empty!29139)))

(declare-fun b!1163048 () Bool)

(declare-fun Unit!38381 () Unit!38378)

(assert (=> b!1163048 (= e!661321 Unit!38381)))

(assert (=> b!1163048 (= lt!523834 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163048 (= c!116341 (and (not lt!523834) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523848 () Unit!38378)

(assert (=> b!1163048 (= lt!523848 e!661322)))

(declare-fun lt!523847 () Unit!38378)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!553 (array!75117 array!75119 (_ BitVec 32) (_ BitVec 32) V!43979 V!43979 (_ BitVec 64) (_ BitVec 32) Int) Unit!38378)

(assert (=> b!1163048 (= lt!523847 (lemmaListMapContainsThenArrayContainsFrom!553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116342 () Bool)

(assert (=> b!1163048 (= c!116342 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771380 () Bool)

(assert (=> b!1163048 (= res!771380 e!661324)))

(assert (=> b!1163048 (=> (not res!771380) (not e!661317))))

(assert (=> b!1163048 e!661317))

(declare-fun lt!523838 () Unit!38378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75117 (_ BitVec 32) (_ BitVec 32)) Unit!38378)

(assert (=> b!1163048 (= lt!523838 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163048 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25379)))

(declare-fun lt!523842 () Unit!38378)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75117 (_ BitVec 64) (_ BitVec 32) List!25382) Unit!38378)

(assert (=> b!1163048 (= lt!523842 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25379))))

(assert (=> b!1163048 false))

(declare-fun bm!56854 () Bool)

(assert (=> bm!56854 (= call!56851 (getCurrentListMapNoExtraKeys!4788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163049 () Bool)

(assert (=> b!1163049 (= e!661323 e!661318)))

(declare-fun res!771378 () Bool)

(assert (=> b!1163049 (=> res!771378 e!661318)))

(assert (=> b!1163049 (= res!771378 (not (= from!1455 i!673)))))

(declare-fun lt!523850 () ListLongMap!16617)

(assert (=> b!1163049 (= lt!523850 (getCurrentListMapNoExtraKeys!4788 lt!523849 lt!523843 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163049 (= lt!523843 (array!75120 (store (arr!36210 _values!996) i!673 (ValueCellFull!13860 lt!523844)) (size!36746 _values!996)))))

(declare-fun dynLambda!2782 (Int (_ BitVec 64)) V!43979)

(assert (=> b!1163049 (= lt!523844 (dynLambda!2782 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163049 (= lt!523832 (getCurrentListMapNoExtraKeys!4788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163050 () Bool)

(declare-fun Unit!38382 () Unit!38378)

(assert (=> b!1163050 (= e!661328 Unit!38382)))

(declare-fun b!1163033 () Bool)

(assert (=> b!1163033 (= e!661324 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523834) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!771375 () Bool)

(assert (=> start!99004 (=> (not res!771375) (not e!661313))))

(assert (=> start!99004 (= res!771375 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36745 _keys!1208))))))

(assert (=> start!99004 e!661313))

(assert (=> start!99004 tp_is_empty!29139))

(declare-fun array_inv!27708 (array!75117) Bool)

(assert (=> start!99004 (array_inv!27708 _keys!1208)))

(assert (=> start!99004 true))

(assert (=> start!99004 tp!86538))

(declare-fun array_inv!27709 (array!75119) Bool)

(assert (=> start!99004 (and (array_inv!27709 _values!996) e!661326)))

(declare-fun b!1163051 () Bool)

(declare-fun res!771372 () Bool)

(assert (=> b!1163051 (=> (not res!771372) (not e!661313))))

(assert (=> b!1163051 (= res!771372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163052 () Bool)

(declare-fun res!771369 () Bool)

(assert (=> b!1163052 (=> (not res!771369) (not e!661313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163052 (= res!771369 (validKeyInArray!0 k0!934))))

(declare-fun b!1163053 () Bool)

(assert (=> b!1163053 (= e!661316 tp_is_empty!29139)))

(declare-fun b!1163054 () Bool)

(declare-fun res!771370 () Bool)

(assert (=> b!1163054 (=> (not res!771370) (not e!661313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163054 (= res!771370 (validMask!0 mask!1564))))

(declare-fun b!1163055 () Bool)

(declare-fun res!771379 () Bool)

(assert (=> b!1163055 (=> (not res!771379) (not e!661313))))

(assert (=> b!1163055 (= res!771379 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36745 _keys!1208))))))

(assert (= (and start!99004 res!771375) b!1163054))

(assert (= (and b!1163054 res!771370) b!1163032))

(assert (= (and b!1163032 res!771381) b!1163051))

(assert (= (and b!1163051 res!771372) b!1163030))

(assert (= (and b!1163030 res!771382) b!1163055))

(assert (= (and b!1163055 res!771379) b!1163052))

(assert (= (and b!1163052 res!771369) b!1163036))

(assert (= (and b!1163036 res!771376) b!1163038))

(assert (= (and b!1163038 res!771383) b!1163035))

(assert (= (and b!1163035 res!771371) b!1163039))

(assert (= (and b!1163039 (not res!771377)) b!1163049))

(assert (= (and b!1163049 (not res!771378)) b!1163037))

(assert (= (and b!1163037 c!116339) b!1163028))

(assert (= (and b!1163037 (not c!116339)) b!1163043))

(assert (= (or b!1163028 b!1163043) bm!56851))

(assert (= (or b!1163028 b!1163043) bm!56854))

(assert (= (and b!1163037 (not res!771373)) b!1163045))

(assert (= (and b!1163045 c!116340) b!1163048))

(assert (= (and b!1163045 (not c!116340)) b!1163027))

(assert (= (and b!1163048 c!116341) b!1163041))

(assert (= (and b!1163048 (not c!116341)) b!1163046))

(assert (= (and b!1163046 c!116344) b!1163026))

(assert (= (and b!1163046 (not c!116344)) b!1163040))

(assert (= (and b!1163040 c!116343) b!1163042))

(assert (= (and b!1163040 (not c!116343)) b!1163050))

(assert (= (or b!1163026 b!1163042) bm!56852))

(assert (= (or b!1163026 b!1163042) bm!56853))

(assert (= (or b!1163026 b!1163042) bm!56850))

(assert (= (or b!1163041 bm!56850) bm!56849))

(assert (= (or b!1163041 bm!56852) bm!56848))

(assert (= (or b!1163041 bm!56853) bm!56847))

(assert (= (and b!1163048 c!116342) b!1163034))

(assert (= (and b!1163048 (not c!116342)) b!1163033))

(assert (= (and b!1163048 res!771380) b!1163029))

(assert (= (and b!1163045 res!771374) b!1163031))

(assert (= (and b!1163044 condMapEmpty!45533) mapIsEmpty!45533))

(assert (= (and b!1163044 (not condMapEmpty!45533)) mapNonEmpty!45533))

(get-info :version)

(assert (= (and mapNonEmpty!45533 ((_ is ValueCellFull!13860) mapValue!45533)) b!1163053))

(assert (= (and b!1163044 ((_ is ValueCellFull!13860) mapDefault!45533)) b!1163047))

(assert (= start!99004 b!1163044))

(declare-fun b_lambda!19715 () Bool)

(assert (=> (not b_lambda!19715) (not b!1163049)))

(declare-fun t!36981 () Bool)

(declare-fun tb!9421 () Bool)

(assert (=> (and start!99004 (= defaultEntry!1004 defaultEntry!1004) t!36981) tb!9421))

(declare-fun result!19407 () Bool)

(assert (=> tb!9421 (= result!19407 tp_is_empty!29139)))

(assert (=> b!1163049 t!36981))

(declare-fun b_and!40069 () Bool)

(assert (= b_and!40067 (and (=> t!36981 result!19407) b_and!40069)))

(declare-fun m!1071649 () Bool)

(assert (=> b!1163034 m!1071649))

(declare-fun m!1071651 () Bool)

(assert (=> bm!56849 m!1071651))

(declare-fun m!1071653 () Bool)

(assert (=> start!99004 m!1071653))

(declare-fun m!1071655 () Bool)

(assert (=> start!99004 m!1071655))

(declare-fun m!1071657 () Bool)

(assert (=> b!1163051 m!1071657))

(declare-fun m!1071659 () Bool)

(assert (=> bm!56848 m!1071659))

(declare-fun m!1071661 () Bool)

(assert (=> b!1163049 m!1071661))

(declare-fun m!1071663 () Bool)

(assert (=> b!1163049 m!1071663))

(declare-fun m!1071665 () Bool)

(assert (=> b!1163049 m!1071665))

(declare-fun m!1071667 () Bool)

(assert (=> b!1163049 m!1071667))

(declare-fun m!1071669 () Bool)

(assert (=> b!1163054 m!1071669))

(declare-fun m!1071671 () Bool)

(assert (=> b!1163031 m!1071671))

(declare-fun m!1071673 () Bool)

(assert (=> b!1163038 m!1071673))

(declare-fun m!1071675 () Bool)

(assert (=> b!1163038 m!1071675))

(declare-fun m!1071677 () Bool)

(assert (=> b!1163045 m!1071677))

(declare-fun m!1071679 () Bool)

(assert (=> b!1163045 m!1071679))

(declare-fun m!1071681 () Bool)

(assert (=> b!1163045 m!1071681))

(assert (=> b!1163045 m!1071681))

(declare-fun m!1071683 () Bool)

(assert (=> b!1163045 m!1071683))

(declare-fun m!1071685 () Bool)

(assert (=> b!1163045 m!1071685))

(declare-fun m!1071687 () Bool)

(assert (=> b!1163045 m!1071687))

(declare-fun m!1071689 () Bool)

(assert (=> b!1163045 m!1071689))

(declare-fun m!1071691 () Bool)

(assert (=> b!1163045 m!1071691))

(assert (=> b!1163045 m!1071687))

(declare-fun m!1071693 () Bool)

(assert (=> b!1163045 m!1071693))

(assert (=> b!1163045 m!1071691))

(assert (=> b!1163045 m!1071687))

(declare-fun m!1071695 () Bool)

(assert (=> b!1163052 m!1071695))

(assert (=> bm!56854 m!1071677))

(declare-fun m!1071697 () Bool)

(assert (=> b!1163041 m!1071697))

(assert (=> b!1163041 m!1071697))

(declare-fun m!1071699 () Bool)

(assert (=> b!1163041 m!1071699))

(declare-fun m!1071701 () Bool)

(assert (=> b!1163041 m!1071701))

(assert (=> b!1163037 m!1071687))

(declare-fun m!1071703 () Bool)

(assert (=> b!1163037 m!1071703))

(declare-fun m!1071705 () Bool)

(assert (=> bm!56847 m!1071705))

(declare-fun m!1071707 () Bool)

(assert (=> b!1163039 m!1071707))

(declare-fun m!1071709 () Bool)

(assert (=> b!1163039 m!1071709))

(declare-fun m!1071711 () Bool)

(assert (=> b!1163036 m!1071711))

(assert (=> bm!56851 m!1071671))

(declare-fun m!1071713 () Bool)

(assert (=> b!1163028 m!1071713))

(assert (=> b!1163029 m!1071649))

(declare-fun m!1071715 () Bool)

(assert (=> b!1163035 m!1071715))

(declare-fun m!1071717 () Bool)

(assert (=> mapNonEmpty!45533 m!1071717))

(declare-fun m!1071719 () Bool)

(assert (=> b!1163048 m!1071719))

(declare-fun m!1071721 () Bool)

(assert (=> b!1163048 m!1071721))

(declare-fun m!1071723 () Bool)

(assert (=> b!1163048 m!1071723))

(declare-fun m!1071725 () Bool)

(assert (=> b!1163048 m!1071725))

(declare-fun m!1071727 () Bool)

(assert (=> b!1163030 m!1071727))

(check-sat (not b!1163030) (not bm!56854) (not mapNonEmpty!45533) (not b!1163034) (not b!1163028) (not b!1163045) (not bm!56851) (not b!1163029) (not start!99004) (not b!1163054) (not b!1163031) (not bm!56849) (not bm!56848) b_and!40069 (not b!1163041) (not b_lambda!19715) (not b_next!24609) (not b!1163037) (not b!1163038) (not bm!56847) tp_is_empty!29139 (not b!1163048) (not b!1163035) (not b!1163052) (not b!1163039) (not b!1163051) (not b!1163049))
(check-sat b_and!40069 (not b_next!24609))
