; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99002 () Bool)

(assert start!99002)

(declare-fun b_free!24613 () Bool)

(declare-fun b_next!24613 () Bool)

(assert (=> start!99002 (= b_free!24613 (not b_next!24613))))

(declare-fun tp!86550 () Bool)

(declare-fun b_and!40053 () Bool)

(assert (=> start!99002 (= tp!86550 b_and!40053)))

(declare-datatypes ((V!43985 0))(
  ( (V!43986 (val!14628 Int)) )
))
(declare-fun zeroValue!944 () V!43985)

(declare-datatypes ((array!75042 0))(
  ( (array!75043 (arr!36172 (Array (_ BitVec 32) (_ BitVec 64))) (size!36710 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75042)

(declare-datatypes ((tuple2!18734 0))(
  ( (tuple2!18735 (_1!9378 (_ BitVec 64)) (_2!9378 V!43985)) )
))
(declare-datatypes ((List!25451 0))(
  ( (Nil!25448) (Cons!25447 (h!26656 tuple2!18734) (t!37047 List!25451)) )
))
(declare-datatypes ((ListLongMap!16703 0))(
  ( (ListLongMap!16704 (toList!8367 List!25451)) )
))
(declare-fun call!56882 () ListLongMap!16703)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13862 0))(
  ( (ValueCellFull!13862 (v!17264 V!43985)) (EmptyCell!13862) )
))
(declare-datatypes ((array!75044 0))(
  ( (array!75045 (arr!36173 (Array (_ BitVec 32) ValueCell!13862)) (size!36711 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75044)

(declare-fun bm!56872 () Bool)

(declare-fun minValue!944 () V!43985)

(declare-fun getCurrentListMapNoExtraKeys!4845 (array!75042 array!75044 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 32) Int) ListLongMap!16703)

(assert (=> bm!56872 (= call!56882 (getCurrentListMapNoExtraKeys!4845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163086 () Bool)

(declare-fun res!771403 () Bool)

(declare-fun e!661341 () Bool)

(assert (=> b!1163086 (=> (not res!771403) (not e!661341))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163086 (= res!771403 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36710 _keys!1208))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!661344 () Bool)

(declare-fun b!1163087 () Bool)

(declare-fun arrayContainsKey!0 (array!75042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163087 (= e!661344 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163088 () Bool)

(declare-fun res!771399 () Bool)

(assert (=> b!1163088 (=> (not res!771399) (not e!661341))))

(declare-datatypes ((List!25452 0))(
  ( (Nil!25449) (Cons!25448 (h!26657 (_ BitVec 64)) (t!37048 List!25452)) )
))
(declare-fun arrayNoDuplicates!0 (array!75042 (_ BitVec 32) List!25452) Bool)

(assert (=> b!1163088 (= res!771399 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25449))))

(declare-fun b!1163089 () Bool)

(declare-fun e!661343 () Bool)

(declare-fun e!661340 () Bool)

(assert (=> b!1163089 (= e!661343 e!661340)))

(declare-fun res!771396 () Bool)

(assert (=> b!1163089 (=> res!771396 e!661340)))

(assert (=> b!1163089 (= res!771396 (not (= (select (arr!36172 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661353 () Bool)

(assert (=> b!1163089 e!661353))

(declare-fun c!116353 () Bool)

(assert (=> b!1163089 (= c!116353 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!38212 0))(
  ( (Unit!38213) )
))
(declare-fun lt!523788 () Unit!38212)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!679 (array!75042 array!75044 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38212)

(assert (=> b!1163089 (= lt!523788 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!679 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!523772 () ListLongMap!16703)

(declare-fun call!56880 () Unit!38212)

(declare-fun bm!56873 () Bool)

(declare-fun lt!523782 () ListLongMap!16703)

(declare-fun c!116352 () Bool)

(declare-fun c!116351 () Bool)

(declare-fun addStillContains!976 (ListLongMap!16703 (_ BitVec 64) V!43985 (_ BitVec 64)) Unit!38212)

(assert (=> bm!56873 (= call!56880 (addStillContains!976 (ite c!116352 lt!523782 lt!523772) (ite c!116352 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116351 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116352 minValue!944 (ite c!116351 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163090 () Bool)

(declare-fun res!771402 () Bool)

(declare-fun e!661346 () Bool)

(assert (=> b!1163090 (=> (not res!771402) (not e!661346))))

(declare-fun lt!523785 () array!75042)

(assert (=> b!1163090 (= res!771402 (arrayNoDuplicates!0 lt!523785 #b00000000000000000000000000000000 Nil!25449))))

(declare-fun b!1163091 () Bool)

(declare-fun e!661338 () Bool)

(declare-fun tp_is_empty!29143 () Bool)

(assert (=> b!1163091 (= e!661338 tp_is_empty!29143)))

(declare-fun b!1163092 () Bool)

(declare-fun e!661349 () Unit!38212)

(declare-fun Unit!38214 () Unit!38212)

(assert (=> b!1163092 (= e!661349 Unit!38214)))

(declare-fun lt!523787 () Bool)

(assert (=> b!1163092 (= lt!523787 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163092 (= c!116352 (and (not lt!523787) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523774 () Unit!38212)

(declare-fun e!661342 () Unit!38212)

(assert (=> b!1163092 (= lt!523774 e!661342)))

(declare-fun lt!523780 () Unit!38212)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!547 (array!75042 array!75044 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 64) (_ BitVec 32) Int) Unit!38212)

(assert (=> b!1163092 (= lt!523780 (lemmaListMapContainsThenArrayContainsFrom!547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116350 () Bool)

(assert (=> b!1163092 (= c!116350 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771404 () Bool)

(declare-fun e!661352 () Bool)

(assert (=> b!1163092 (= res!771404 e!661352)))

(assert (=> b!1163092 (=> (not res!771404) (not e!661344))))

(assert (=> b!1163092 e!661344))

(declare-fun lt!523777 () Unit!38212)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75042 (_ BitVec 32) (_ BitVec 32)) Unit!38212)

(assert (=> b!1163092 (= lt!523777 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163092 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25449)))

(declare-fun lt!523781 () Unit!38212)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75042 (_ BitVec 64) (_ BitVec 32) List!25452) Unit!38212)

(assert (=> b!1163092 (= lt!523781 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25449))))

(assert (=> b!1163092 false))

(declare-fun bm!56874 () Bool)

(declare-fun call!56879 () Unit!38212)

(assert (=> bm!56874 (= call!56879 call!56880)))

(declare-fun res!771401 () Bool)

(assert (=> start!99002 (=> (not res!771401) (not e!661341))))

(assert (=> start!99002 (= res!771401 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36710 _keys!1208))))))

(assert (=> start!99002 e!661341))

(assert (=> start!99002 tp_is_empty!29143))

(declare-fun array_inv!27786 (array!75042) Bool)

(assert (=> start!99002 (array_inv!27786 _keys!1208)))

(assert (=> start!99002 true))

(assert (=> start!99002 tp!86550))

(declare-fun e!661347 () Bool)

(declare-fun array_inv!27787 (array!75044) Bool)

(assert (=> start!99002 (and (array_inv!27787 _values!996) e!661347)))

(declare-fun mapNonEmpty!45539 () Bool)

(declare-fun mapRes!45539 () Bool)

(declare-fun tp!86549 () Bool)

(declare-fun e!661348 () Bool)

(assert (=> mapNonEmpty!45539 (= mapRes!45539 (and tp!86549 e!661348))))

(declare-fun mapKey!45539 () (_ BitVec 32))

(declare-fun mapRest!45539 () (Array (_ BitVec 32) ValueCell!13862))

(declare-fun mapValue!45539 () ValueCell!13862)

(assert (=> mapNonEmpty!45539 (= (arr!36173 _values!996) (store mapRest!45539 mapKey!45539 mapValue!45539))))

(declare-fun b!1163093 () Bool)

(declare-fun res!771393 () Bool)

(assert (=> b!1163093 (=> (not res!771393) (not e!661341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75042 (_ BitVec 32)) Bool)

(assert (=> b!1163093 (= res!771393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!523770 () array!75044)

(declare-fun lt!523773 () ListLongMap!16703)

(declare-fun b!1163094 () Bool)

(declare-fun e!661345 () Bool)

(assert (=> b!1163094 (= e!661345 (= lt!523773 (getCurrentListMapNoExtraKeys!4845 lt!523785 lt!523770 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!56876 () ListLongMap!16703)

(declare-fun bm!56875 () Bool)

(assert (=> bm!56875 (= call!56876 (getCurrentListMapNoExtraKeys!4845 lt!523785 lt!523770 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163095 () Bool)

(declare-fun call!56877 () ListLongMap!16703)

(declare-fun contains!6812 (ListLongMap!16703 (_ BitVec 64)) Bool)

(assert (=> b!1163095 (contains!6812 call!56877 k0!934)))

(declare-fun lt!523789 () Unit!38212)

(assert (=> b!1163095 (= lt!523789 call!56880)))

(declare-fun call!56875 () Bool)

(assert (=> b!1163095 call!56875))

(declare-fun +!3769 (ListLongMap!16703 tuple2!18734) ListLongMap!16703)

(assert (=> b!1163095 (= lt!523782 (+!3769 lt!523772 (tuple2!18735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523784 () Unit!38212)

(assert (=> b!1163095 (= lt!523784 (addStillContains!976 lt!523772 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163095 (= e!661342 lt!523789)))

(declare-fun b!1163096 () Bool)

(assert (=> b!1163096 (= e!661340 true)))

(assert (=> b!1163096 e!661345))

(declare-fun res!771394 () Bool)

(assert (=> b!1163096 (=> (not res!771394) (not e!661345))))

(assert (=> b!1163096 (= res!771394 (= lt!523773 lt!523772))))

(declare-fun lt!523790 () ListLongMap!16703)

(declare-fun -!1413 (ListLongMap!16703 (_ BitVec 64)) ListLongMap!16703)

(assert (=> b!1163096 (= lt!523773 (-!1413 lt!523790 k0!934))))

(declare-fun lt!523786 () V!43985)

(assert (=> b!1163096 (= (-!1413 (+!3769 lt!523772 (tuple2!18735 (select (arr!36172 _keys!1208) from!1455) lt!523786)) (select (arr!36172 _keys!1208) from!1455)) lt!523772)))

(declare-fun lt!523779 () Unit!38212)

(declare-fun addThenRemoveForNewKeyIsSame!253 (ListLongMap!16703 (_ BitVec 64) V!43985) Unit!38212)

(assert (=> b!1163096 (= lt!523779 (addThenRemoveForNewKeyIsSame!253 lt!523772 (select (arr!36172 _keys!1208) from!1455) lt!523786))))

(declare-fun lt!523783 () V!43985)

(declare-fun get!18471 (ValueCell!13862 V!43985) V!43985)

(assert (=> b!1163096 (= lt!523786 (get!18471 (select (arr!36173 _values!996) from!1455) lt!523783))))

(declare-fun lt!523775 () Unit!38212)

(assert (=> b!1163096 (= lt!523775 e!661349)))

(declare-fun c!116349 () Bool)

(assert (=> b!1163096 (= c!116349 (contains!6812 lt!523772 k0!934))))

(assert (=> b!1163096 (= lt!523772 (getCurrentListMapNoExtraKeys!4845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163097 () Bool)

(declare-fun Unit!38215 () Unit!38212)

(assert (=> b!1163097 (= e!661349 Unit!38215)))

(declare-fun mapIsEmpty!45539 () Bool)

(assert (=> mapIsEmpty!45539 mapRes!45539))

(declare-fun b!1163098 () Bool)

(assert (=> b!1163098 (= e!661341 e!661346)))

(declare-fun res!771405 () Bool)

(assert (=> b!1163098 (=> (not res!771405) (not e!661346))))

(assert (=> b!1163098 (= res!771405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523785 mask!1564))))

(assert (=> b!1163098 (= lt!523785 (array!75043 (store (arr!36172 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36710 _keys!1208)))))

(declare-fun b!1163099 () Bool)

(declare-fun e!661339 () Bool)

(assert (=> b!1163099 (= e!661339 e!661343)))

(declare-fun res!771406 () Bool)

(assert (=> b!1163099 (=> res!771406 e!661343)))

(assert (=> b!1163099 (= res!771406 (not (= from!1455 i!673)))))

(declare-fun lt!523776 () ListLongMap!16703)

(assert (=> b!1163099 (= lt!523776 (getCurrentListMapNoExtraKeys!4845 lt!523785 lt!523770 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163099 (= lt!523770 (array!75045 (store (arr!36173 _values!996) i!673 (ValueCellFull!13862 lt!523783)) (size!36711 _values!996)))))

(declare-fun dynLambda!2779 (Int (_ BitVec 64)) V!43985)

(assert (=> b!1163099 (= lt!523783 (dynLambda!2779 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163099 (= lt!523790 (getCurrentListMapNoExtraKeys!4845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163100 () Bool)

(declare-fun res!771400 () Bool)

(assert (=> b!1163100 (=> (not res!771400) (not e!661341))))

(assert (=> b!1163100 (= res!771400 (= (select (arr!36172 _keys!1208) i!673) k0!934))))

(declare-fun b!1163101 () Bool)

(declare-fun e!661350 () Unit!38212)

(declare-fun lt!523778 () Unit!38212)

(assert (=> b!1163101 (= e!661350 lt!523778)))

(assert (=> b!1163101 (= lt!523778 call!56879)))

(declare-fun call!56881 () Bool)

(assert (=> b!1163101 call!56881))

(declare-fun b!1163102 () Bool)

(assert (=> b!1163102 (= e!661346 (not e!661339))))

(declare-fun res!771395 () Bool)

(assert (=> b!1163102 (=> res!771395 e!661339)))

(assert (=> b!1163102 (= res!771395 (bvsgt from!1455 i!673))))

(assert (=> b!1163102 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523791 () Unit!38212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75042 (_ BitVec 64) (_ BitVec 32)) Unit!38212)

(assert (=> b!1163102 (= lt!523791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163103 () Bool)

(assert (=> b!1163103 (= c!116351 (and (not lt!523787) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1163103 (= e!661342 e!661350)))

(declare-fun b!1163104 () Bool)

(assert (=> b!1163104 (= e!661352 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523787) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163105 () Bool)

(assert (=> b!1163105 (= e!661352 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163106 () Bool)

(assert (=> b!1163106 call!56881))

(declare-fun lt!523771 () Unit!38212)

(assert (=> b!1163106 (= lt!523771 call!56879)))

(declare-fun e!661337 () Unit!38212)

(assert (=> b!1163106 (= e!661337 lt!523771)))

(declare-fun b!1163107 () Bool)

(declare-fun res!771397 () Bool)

(assert (=> b!1163107 (=> (not res!771397) (not e!661341))))

(assert (=> b!1163107 (= res!771397 (and (= (size!36711 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36710 _keys!1208) (size!36711 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163108 () Bool)

(assert (=> b!1163108 (= e!661353 (= call!56876 call!56882))))

(declare-fun bm!56876 () Bool)

(declare-fun call!56878 () ListLongMap!16703)

(assert (=> bm!56876 (= call!56875 (contains!6812 (ite c!116352 lt!523782 call!56878) k0!934))))

(declare-fun bm!56877 () Bool)

(assert (=> bm!56877 (= call!56878 call!56877)))

(declare-fun b!1163109 () Bool)

(assert (=> b!1163109 (= e!661353 (= call!56876 (-!1413 call!56882 k0!934)))))

(declare-fun bm!56878 () Bool)

(assert (=> bm!56878 (= call!56877 (+!3769 (ite c!116352 lt!523782 lt!523772) (ite c!116352 (tuple2!18735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116351 (tuple2!18735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!56879 () Bool)

(assert (=> bm!56879 (= call!56881 call!56875)))

(declare-fun b!1163110 () Bool)

(assert (=> b!1163110 (= e!661350 e!661337)))

(declare-fun c!116354 () Bool)

(assert (=> b!1163110 (= c!116354 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523787))))

(declare-fun b!1163111 () Bool)

(declare-fun res!771407 () Bool)

(assert (=> b!1163111 (=> (not res!771407) (not e!661341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163111 (= res!771407 (validMask!0 mask!1564))))

(declare-fun b!1163112 () Bool)

(declare-fun Unit!38216 () Unit!38212)

(assert (=> b!1163112 (= e!661337 Unit!38216)))

(declare-fun b!1163113 () Bool)

(assert (=> b!1163113 (= e!661347 (and e!661338 mapRes!45539))))

(declare-fun condMapEmpty!45539 () Bool)

(declare-fun mapDefault!45539 () ValueCell!13862)

(assert (=> b!1163113 (= condMapEmpty!45539 (= (arr!36173 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13862)) mapDefault!45539)))))

(declare-fun b!1163114 () Bool)

(declare-fun res!771398 () Bool)

(assert (=> b!1163114 (=> (not res!771398) (not e!661341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163114 (= res!771398 (validKeyInArray!0 k0!934))))

(declare-fun b!1163115 () Bool)

(assert (=> b!1163115 (= e!661348 tp_is_empty!29143)))

(assert (= (and start!99002 res!771401) b!1163111))

(assert (= (and b!1163111 res!771407) b!1163107))

(assert (= (and b!1163107 res!771397) b!1163093))

(assert (= (and b!1163093 res!771393) b!1163088))

(assert (= (and b!1163088 res!771399) b!1163086))

(assert (= (and b!1163086 res!771403) b!1163114))

(assert (= (and b!1163114 res!771398) b!1163100))

(assert (= (and b!1163100 res!771400) b!1163098))

(assert (= (and b!1163098 res!771405) b!1163090))

(assert (= (and b!1163090 res!771402) b!1163102))

(assert (= (and b!1163102 (not res!771395)) b!1163099))

(assert (= (and b!1163099 (not res!771406)) b!1163089))

(assert (= (and b!1163089 c!116353) b!1163109))

(assert (= (and b!1163089 (not c!116353)) b!1163108))

(assert (= (or b!1163109 b!1163108) bm!56875))

(assert (= (or b!1163109 b!1163108) bm!56872))

(assert (= (and b!1163089 (not res!771396)) b!1163096))

(assert (= (and b!1163096 c!116349) b!1163092))

(assert (= (and b!1163096 (not c!116349)) b!1163097))

(assert (= (and b!1163092 c!116352) b!1163095))

(assert (= (and b!1163092 (not c!116352)) b!1163103))

(assert (= (and b!1163103 c!116351) b!1163101))

(assert (= (and b!1163103 (not c!116351)) b!1163110))

(assert (= (and b!1163110 c!116354) b!1163106))

(assert (= (and b!1163110 (not c!116354)) b!1163112))

(assert (= (or b!1163101 b!1163106) bm!56874))

(assert (= (or b!1163101 b!1163106) bm!56877))

(assert (= (or b!1163101 b!1163106) bm!56879))

(assert (= (or b!1163095 bm!56879) bm!56876))

(assert (= (or b!1163095 bm!56874) bm!56873))

(assert (= (or b!1163095 bm!56877) bm!56878))

(assert (= (and b!1163092 c!116350) b!1163105))

(assert (= (and b!1163092 (not c!116350)) b!1163104))

(assert (= (and b!1163092 res!771404) b!1163087))

(assert (= (and b!1163096 res!771394) b!1163094))

(assert (= (and b!1163113 condMapEmpty!45539) mapIsEmpty!45539))

(assert (= (and b!1163113 (not condMapEmpty!45539)) mapNonEmpty!45539))

(get-info :version)

(assert (= (and mapNonEmpty!45539 ((_ is ValueCellFull!13862) mapValue!45539)) b!1163115))

(assert (= (and b!1163113 ((_ is ValueCellFull!13862) mapDefault!45539)) b!1163091))

(assert (= start!99002 b!1163113))

(declare-fun b_lambda!19701 () Bool)

(assert (=> (not b_lambda!19701) (not b!1163099)))

(declare-fun t!37046 () Bool)

(declare-fun tb!9417 () Bool)

(assert (=> (and start!99002 (= defaultEntry!1004 defaultEntry!1004) t!37046) tb!9417))

(declare-fun result!19407 () Bool)

(assert (=> tb!9417 (= result!19407 tp_is_empty!29143)))

(assert (=> b!1163099 t!37046))

(declare-fun b_and!40055 () Bool)

(assert (= b_and!40053 (and (=> t!37046 result!19407) b_and!40055)))

(declare-fun m!1071199 () Bool)

(assert (=> bm!56873 m!1071199))

(declare-fun m!1071201 () Bool)

(assert (=> b!1163114 m!1071201))

(declare-fun m!1071203 () Bool)

(assert (=> b!1163089 m!1071203))

(declare-fun m!1071205 () Bool)

(assert (=> b!1163089 m!1071205))

(declare-fun m!1071207 () Bool)

(assert (=> b!1163099 m!1071207))

(declare-fun m!1071209 () Bool)

(assert (=> b!1163099 m!1071209))

(declare-fun m!1071211 () Bool)

(assert (=> b!1163099 m!1071211))

(declare-fun m!1071213 () Bool)

(assert (=> b!1163099 m!1071213))

(declare-fun m!1071215 () Bool)

(assert (=> b!1163111 m!1071215))

(declare-fun m!1071217 () Bool)

(assert (=> bm!56872 m!1071217))

(declare-fun m!1071219 () Bool)

(assert (=> b!1163100 m!1071219))

(declare-fun m!1071221 () Bool)

(assert (=> b!1163087 m!1071221))

(declare-fun m!1071223 () Bool)

(assert (=> b!1163109 m!1071223))

(declare-fun m!1071225 () Bool)

(assert (=> b!1163098 m!1071225))

(declare-fun m!1071227 () Bool)

(assert (=> b!1163098 m!1071227))

(assert (=> b!1163096 m!1071217))

(declare-fun m!1071229 () Bool)

(assert (=> b!1163096 m!1071229))

(declare-fun m!1071231 () Bool)

(assert (=> b!1163096 m!1071231))

(declare-fun m!1071233 () Bool)

(assert (=> b!1163096 m!1071233))

(declare-fun m!1071235 () Bool)

(assert (=> b!1163096 m!1071235))

(assert (=> b!1163096 m!1071229))

(declare-fun m!1071237 () Bool)

(assert (=> b!1163096 m!1071237))

(assert (=> b!1163096 m!1071203))

(declare-fun m!1071239 () Bool)

(assert (=> b!1163096 m!1071239))

(assert (=> b!1163096 m!1071231))

(assert (=> b!1163096 m!1071203))

(declare-fun m!1071241 () Bool)

(assert (=> b!1163096 m!1071241))

(assert (=> b!1163096 m!1071203))

(declare-fun m!1071243 () Bool)

(assert (=> start!99002 m!1071243))

(declare-fun m!1071245 () Bool)

(assert (=> start!99002 m!1071245))

(declare-fun m!1071247 () Bool)

(assert (=> mapNonEmpty!45539 m!1071247))

(declare-fun m!1071249 () Bool)

(assert (=> b!1163092 m!1071249))

(declare-fun m!1071251 () Bool)

(assert (=> b!1163092 m!1071251))

(declare-fun m!1071253 () Bool)

(assert (=> b!1163092 m!1071253))

(declare-fun m!1071255 () Bool)

(assert (=> b!1163092 m!1071255))

(assert (=> b!1163105 m!1071221))

(declare-fun m!1071257 () Bool)

(assert (=> b!1163094 m!1071257))

(declare-fun m!1071259 () Bool)

(assert (=> b!1163088 m!1071259))

(declare-fun m!1071261 () Bool)

(assert (=> b!1163093 m!1071261))

(assert (=> bm!56875 m!1071257))

(declare-fun m!1071263 () Bool)

(assert (=> b!1163095 m!1071263))

(declare-fun m!1071265 () Bool)

(assert (=> b!1163095 m!1071265))

(declare-fun m!1071267 () Bool)

(assert (=> b!1163095 m!1071267))

(declare-fun m!1071269 () Bool)

(assert (=> bm!56878 m!1071269))

(declare-fun m!1071271 () Bool)

(assert (=> b!1163102 m!1071271))

(declare-fun m!1071273 () Bool)

(assert (=> b!1163102 m!1071273))

(declare-fun m!1071275 () Bool)

(assert (=> bm!56876 m!1071275))

(declare-fun m!1071277 () Bool)

(assert (=> b!1163090 m!1071277))

(check-sat (not b!1163096) (not b!1163098) (not b_lambda!19701) (not b!1163089) (not bm!56872) (not bm!56878) (not b_next!24613) (not b!1163093) (not b!1163114) (not b!1163105) b_and!40055 (not start!99002) (not b!1163087) (not bm!56875) (not bm!56876) (not b!1163088) (not b!1163092) (not b!1163111) (not b!1163095) (not b!1163109) (not b!1163102) (not bm!56873) (not b!1163099) (not mapNonEmpty!45539) (not b!1163090) (not b!1163094) tp_is_empty!29143)
(check-sat b_and!40055 (not b_next!24613))
