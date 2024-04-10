; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98720 () Bool)

(assert start!98720)

(declare-fun b_free!24325 () Bool)

(declare-fun b_next!24325 () Bool)

(assert (=> start!98720 (= b_free!24325 (not b_next!24325))))

(declare-fun tp!85685 () Bool)

(declare-fun b_and!39499 () Bool)

(assert (=> start!98720 (= tp!85685 b_and!39499)))

(declare-fun b!1149962 () Bool)

(declare-fun res!764981 () Bool)

(declare-fun e!654072 () Bool)

(assert (=> b!1149962 (=> (not res!764981) (not e!654072))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149962 (= res!764981 (validMask!0 mask!1564))))

(declare-datatypes ((V!43601 0))(
  ( (V!43602 (val!14484 Int)) )
))
(declare-fun zeroValue!944 () V!43601)

(declare-datatypes ((tuple2!18380 0))(
  ( (tuple2!18381 (_1!9201 (_ BitVec 64)) (_2!9201 V!43601)) )
))
(declare-datatypes ((List!25129 0))(
  ( (Nil!25126) (Cons!25125 (h!26334 tuple2!18380) (t!36446 List!25129)) )
))
(declare-datatypes ((ListLongMap!16349 0))(
  ( (ListLongMap!16350 (toList!8190 List!25129)) )
))
(declare-fun call!53442 () ListLongMap!16349)

(declare-fun c!113786 () Bool)

(declare-fun minValue!944 () V!43601)

(declare-fun lt!514468 () ListLongMap!16349)

(declare-fun lt!514476 () ListLongMap!16349)

(declare-fun c!113787 () Bool)

(declare-fun bm!53439 () Bool)

(declare-fun +!3611 (ListLongMap!16349 tuple2!18380) ListLongMap!16349)

(assert (=> bm!53439 (= call!53442 (+!3611 (ite c!113786 lt!514468 lt!514476) (ite c!113786 (tuple2!18381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113787 (tuple2!18381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1149964 () Bool)

(declare-datatypes ((Unit!37810 0))(
  ( (Unit!37811) )
))
(declare-fun e!654087 () Unit!37810)

(declare-fun Unit!37812 () Unit!37810)

(assert (=> b!1149964 (= e!654087 Unit!37812)))

(declare-fun b!1149965 () Bool)

(declare-fun lt!514467 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1149965 (= c!113787 (and (not lt!514467) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654073 () Unit!37810)

(declare-fun e!654085 () Unit!37810)

(assert (=> b!1149965 (= e!654073 e!654085)))

(declare-datatypes ((array!74557 0))(
  ( (array!74558 (arr!35929 (Array (_ BitVec 32) (_ BitVec 64))) (size!36465 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74557)

(declare-fun b!1149966 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!654080 () Bool)

(declare-fun arrayContainsKey!0 (array!74557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149966 (= e!654080 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!654082 () Bool)

(declare-fun call!53448 () ListLongMap!16349)

(declare-fun call!53444 () ListLongMap!16349)

(declare-fun b!1149967 () Bool)

(declare-fun -!1323 (ListLongMap!16349 (_ BitVec 64)) ListLongMap!16349)

(assert (=> b!1149967 (= e!654082 (= call!53448 (-!1323 call!53444 k!934)))))

(declare-fun b!1149968 () Bool)

(declare-fun e!654071 () Unit!37810)

(declare-fun Unit!37813 () Unit!37810)

(assert (=> b!1149968 (= e!654071 Unit!37813)))

(assert (=> b!1149968 (= lt!514467 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149968 (= c!113786 (and (not lt!514467) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514471 () Unit!37810)

(assert (=> b!1149968 (= lt!514471 e!654073)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13718 0))(
  ( (ValueCellFull!13718 (v!17121 V!43601)) (EmptyCell!13718) )
))
(declare-datatypes ((array!74559 0))(
  ( (array!74560 (arr!35930 (Array (_ BitVec 32) ValueCell!13718)) (size!36466 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74559)

(declare-fun lt!514464 () Unit!37810)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!453 (array!74557 array!74559 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 64) (_ BitVec 32) Int) Unit!37810)

(assert (=> b!1149968 (= lt!514464 (lemmaListMapContainsThenArrayContainsFrom!453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113784 () Bool)

(assert (=> b!1149968 (= c!113784 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764986 () Bool)

(assert (=> b!1149968 (= res!764986 e!654080)))

(declare-fun e!654077 () Bool)

(assert (=> b!1149968 (=> (not res!764986) (not e!654077))))

(assert (=> b!1149968 e!654077))

(declare-fun lt!514462 () Unit!37810)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74557 (_ BitVec 32) (_ BitVec 32)) Unit!37810)

(assert (=> b!1149968 (= lt!514462 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25130 0))(
  ( (Nil!25127) (Cons!25126 (h!26335 (_ BitVec 64)) (t!36447 List!25130)) )
))
(declare-fun arrayNoDuplicates!0 (array!74557 (_ BitVec 32) List!25130) Bool)

(assert (=> b!1149968 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25127)))

(declare-fun lt!514465 () Unit!37810)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74557 (_ BitVec 64) (_ BitVec 32) List!25130) Unit!37810)

(assert (=> b!1149968 (= lt!514465 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25127))))

(assert (=> b!1149968 false))

(declare-fun b!1149969 () Bool)

(declare-fun e!654076 () Bool)

(assert (=> b!1149969 (= e!654076 true)))

(declare-fun e!654083 () Bool)

(assert (=> b!1149969 e!654083))

(declare-fun res!764980 () Bool)

(assert (=> b!1149969 (=> (not res!764980) (not e!654083))))

(declare-fun lt!514472 () ListLongMap!16349)

(assert (=> b!1149969 (= res!764980 (= lt!514472 lt!514476))))

(declare-fun lt!514459 () ListLongMap!16349)

(assert (=> b!1149969 (= lt!514472 (-!1323 lt!514459 k!934))))

(declare-fun lt!514458 () V!43601)

(assert (=> b!1149969 (= (-!1323 (+!3611 lt!514476 (tuple2!18381 (select (arr!35929 _keys!1208) from!1455) lt!514458)) (select (arr!35929 _keys!1208) from!1455)) lt!514476)))

(declare-fun lt!514479 () Unit!37810)

(declare-fun addThenRemoveForNewKeyIsSame!167 (ListLongMap!16349 (_ BitVec 64) V!43601) Unit!37810)

(assert (=> b!1149969 (= lt!514479 (addThenRemoveForNewKeyIsSame!167 lt!514476 (select (arr!35929 _keys!1208) from!1455) lt!514458))))

(declare-fun lt!514473 () V!43601)

(declare-fun get!18289 (ValueCell!13718 V!43601) V!43601)

(assert (=> b!1149969 (= lt!514458 (get!18289 (select (arr!35930 _values!996) from!1455) lt!514473))))

(declare-fun lt!514478 () Unit!37810)

(assert (=> b!1149969 (= lt!514478 e!654071)))

(declare-fun c!113785 () Bool)

(declare-fun contains!6711 (ListLongMap!16349 (_ BitVec 64)) Bool)

(assert (=> b!1149969 (= c!113785 (contains!6711 lt!514476 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4663 (array!74557 array!74559 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 32) Int) ListLongMap!16349)

(assert (=> b!1149969 (= lt!514476 (getCurrentListMapNoExtraKeys!4663 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149970 () Bool)

(declare-fun res!764984 () Bool)

(assert (=> b!1149970 (=> (not res!764984) (not e!654072))))

(assert (=> b!1149970 (= res!764984 (and (= (size!36466 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36465 _keys!1208) (size!36466 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149971 () Bool)

(declare-fun e!654079 () Bool)

(declare-fun tp_is_empty!28855 () Bool)

(assert (=> b!1149971 (= e!654079 tp_is_empty!28855)))

(declare-fun b!1149972 () Bool)

(assert (=> b!1149972 (contains!6711 call!53442 k!934)))

(declare-fun lt!514460 () Unit!37810)

(declare-fun call!53445 () Unit!37810)

(assert (=> b!1149972 (= lt!514460 call!53445)))

(declare-fun call!53443 () Bool)

(assert (=> b!1149972 call!53443))

(assert (=> b!1149972 (= lt!514468 (+!3611 lt!514476 (tuple2!18381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514470 () Unit!37810)

(declare-fun addStillContains!861 (ListLongMap!16349 (_ BitVec 64) V!43601 (_ BitVec 64)) Unit!37810)

(assert (=> b!1149972 (= lt!514470 (addStillContains!861 lt!514476 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1149972 (= e!654073 lt!514460)))

(declare-fun b!1149973 () Bool)

(declare-fun res!764985 () Bool)

(assert (=> b!1149973 (=> (not res!764985) (not e!654072))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149973 (= res!764985 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36465 _keys!1208))))))

(declare-fun mapIsEmpty!45107 () Bool)

(declare-fun mapRes!45107 () Bool)

(assert (=> mapIsEmpty!45107 mapRes!45107))

(declare-fun b!1149974 () Bool)

(declare-fun e!654075 () Bool)

(declare-fun e!654084 () Bool)

(assert (=> b!1149974 (= e!654075 e!654084)))

(declare-fun res!764993 () Bool)

(assert (=> b!1149974 (=> res!764993 e!654084)))

(assert (=> b!1149974 (= res!764993 (not (= from!1455 i!673)))))

(declare-fun lt!514466 () array!74557)

(declare-fun lt!514477 () ListLongMap!16349)

(declare-fun lt!514469 () array!74559)

(assert (=> b!1149974 (= lt!514477 (getCurrentListMapNoExtraKeys!4663 lt!514466 lt!514469 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1149974 (= lt!514469 (array!74560 (store (arr!35930 _values!996) i!673 (ValueCellFull!13718 lt!514473)) (size!36466 _values!996)))))

(declare-fun dynLambda!2687 (Int (_ BitVec 64)) V!43601)

(assert (=> b!1149974 (= lt!514473 (dynLambda!2687 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1149974 (= lt!514459 (getCurrentListMapNoExtraKeys!4663 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!53447 () ListLongMap!16349)

(declare-fun bm!53440 () Bool)

(assert (=> bm!53440 (= call!53443 (contains!6711 (ite c!113786 lt!514468 call!53447) k!934))))

(declare-fun b!1149975 () Bool)

(assert (=> b!1149975 (= e!654085 e!654087)))

(declare-fun c!113788 () Bool)

(assert (=> b!1149975 (= c!113788 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514467))))

(declare-fun bm!53441 () Bool)

(assert (=> bm!53441 (= call!53447 call!53442)))

(declare-fun bm!53442 () Bool)

(declare-fun call!53446 () Bool)

(assert (=> bm!53442 (= call!53446 call!53443)))

(declare-fun b!1149976 () Bool)

(assert (=> b!1149976 call!53446))

(declare-fun lt!514463 () Unit!37810)

(declare-fun call!53449 () Unit!37810)

(assert (=> b!1149976 (= lt!514463 call!53449)))

(assert (=> b!1149976 (= e!654087 lt!514463)))

(declare-fun res!764989 () Bool)

(assert (=> start!98720 (=> (not res!764989) (not e!654072))))

(assert (=> start!98720 (= res!764989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36465 _keys!1208))))))

(assert (=> start!98720 e!654072))

(assert (=> start!98720 tp_is_empty!28855))

(declare-fun array_inv!27516 (array!74557) Bool)

(assert (=> start!98720 (array_inv!27516 _keys!1208)))

(assert (=> start!98720 true))

(assert (=> start!98720 tp!85685))

(declare-fun e!654081 () Bool)

(declare-fun array_inv!27517 (array!74559) Bool)

(assert (=> start!98720 (and (array_inv!27517 _values!996) e!654081)))

(declare-fun b!1149963 () Bool)

(assert (=> b!1149963 (= e!654080 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514467) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53443 () Bool)

(assert (=> bm!53443 (= call!53449 call!53445)))

(declare-fun b!1149977 () Bool)

(assert (=> b!1149977 (= e!654077 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45107 () Bool)

(declare-fun tp!85686 () Bool)

(assert (=> mapNonEmpty!45107 (= mapRes!45107 (and tp!85686 e!654079))))

(declare-fun mapRest!45107 () (Array (_ BitVec 32) ValueCell!13718))

(declare-fun mapValue!45107 () ValueCell!13718)

(declare-fun mapKey!45107 () (_ BitVec 32))

(assert (=> mapNonEmpty!45107 (= (arr!35930 _values!996) (store mapRest!45107 mapKey!45107 mapValue!45107))))

(declare-fun b!1149978 () Bool)

(declare-fun res!764983 () Bool)

(assert (=> b!1149978 (=> (not res!764983) (not e!654072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149978 (= res!764983 (validKeyInArray!0 k!934))))

(declare-fun b!1149979 () Bool)

(assert (=> b!1149979 (= e!654084 e!654076)))

(declare-fun res!764991 () Bool)

(assert (=> b!1149979 (=> res!764991 e!654076)))

(assert (=> b!1149979 (= res!764991 (not (= (select (arr!35929 _keys!1208) from!1455) k!934)))))

(assert (=> b!1149979 e!654082))

(declare-fun c!113783 () Bool)

(assert (=> b!1149979 (= c!113783 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514474 () Unit!37810)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!560 (array!74557 array!74559 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37810)

(assert (=> b!1149979 (= lt!514474 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53444 () Bool)

(assert (=> bm!53444 (= call!53444 (getCurrentListMapNoExtraKeys!4663 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149980 () Bool)

(declare-fun res!764992 () Bool)

(assert (=> b!1149980 (=> (not res!764992) (not e!654072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74557 (_ BitVec 32)) Bool)

(assert (=> b!1149980 (= res!764992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149981 () Bool)

(declare-fun e!654086 () Bool)

(assert (=> b!1149981 (= e!654072 e!654086)))

(declare-fun res!764979 () Bool)

(assert (=> b!1149981 (=> (not res!764979) (not e!654086))))

(assert (=> b!1149981 (= res!764979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514466 mask!1564))))

(assert (=> b!1149981 (= lt!514466 (array!74558 (store (arr!35929 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36465 _keys!1208)))))

(declare-fun b!1149982 () Bool)

(declare-fun e!654078 () Bool)

(assert (=> b!1149982 (= e!654081 (and e!654078 mapRes!45107))))

(declare-fun condMapEmpty!45107 () Bool)

(declare-fun mapDefault!45107 () ValueCell!13718)

