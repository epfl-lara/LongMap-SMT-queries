; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101164 () Bool)

(assert start!101164)

(declare-fun b_free!26087 () Bool)

(declare-fun b_next!26087 () Bool)

(assert (=> start!101164 (= b_free!26087 (not b_next!26087))))

(declare-fun tp!91282 () Bool)

(declare-fun b_and!43291 () Bool)

(assert (=> start!101164 (= tp!91282 b_and!43291)))

(declare-fun res!806031 () Bool)

(declare-fun e!689447 () Bool)

(assert (=> start!101164 (=> (not res!806031) (not e!689447))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78369 0))(
  ( (array!78370 (arr!37819 (Array (_ BitVec 32) (_ BitVec 64))) (size!38355 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78369)

(assert (=> start!101164 (= res!806031 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38355 _keys!1208))))))

(assert (=> start!101164 e!689447))

(declare-fun tp_is_empty!30791 () Bool)

(assert (=> start!101164 tp_is_empty!30791))

(declare-fun array_inv!28800 (array!78369) Bool)

(assert (=> start!101164 (array_inv!28800 _keys!1208)))

(assert (=> start!101164 true))

(assert (=> start!101164 tp!91282))

(declare-datatypes ((V!46181 0))(
  ( (V!46182 (val!15452 Int)) )
))
(declare-datatypes ((ValueCell!14686 0))(
  ( (ValueCellFull!14686 (v!18105 V!46181)) (EmptyCell!14686) )
))
(declare-datatypes ((array!78371 0))(
  ( (array!78372 (arr!37820 (Array (_ BitVec 32) ValueCell!14686)) (size!38356 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78371)

(declare-fun e!689454 () Bool)

(declare-fun array_inv!28801 (array!78371) Bool)

(assert (=> start!101164 (and (array_inv!28801 _values!996) e!689454)))

(declare-fun mapNonEmpty!48061 () Bool)

(declare-fun mapRes!48061 () Bool)

(declare-fun tp!91283 () Bool)

(declare-fun e!689451 () Bool)

(assert (=> mapNonEmpty!48061 (= mapRes!48061 (and tp!91283 e!689451))))

(declare-fun mapRest!48061 () (Array (_ BitVec 32) ValueCell!14686))

(declare-fun mapKey!48061 () (_ BitVec 32))

(declare-fun mapValue!48061 () ValueCell!14686)

(assert (=> mapNonEmpty!48061 (= (arr!37820 _values!996) (store mapRest!48061 mapKey!48061 mapValue!48061))))

(declare-fun b!1214028 () Bool)

(declare-datatypes ((Unit!40260 0))(
  ( (Unit!40261) )
))
(declare-fun e!689461 () Unit!40260)

(declare-fun Unit!40262 () Unit!40260)

(assert (=> b!1214028 (= e!689461 Unit!40262)))

(declare-fun b!1214029 () Bool)

(declare-fun e!689458 () Unit!40260)

(declare-fun Unit!40263 () Unit!40260)

(assert (=> b!1214029 (= e!689458 Unit!40263)))

(declare-fun lt!552097 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214029 (= lt!552097 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119993 () Bool)

(assert (=> b!1214029 (= c!119993 (and (not lt!552097) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552113 () Unit!40260)

(declare-fun e!689446 () Unit!40260)

(assert (=> b!1214029 (= lt!552113 e!689446)))

(declare-fun zeroValue!944 () V!46181)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!552093 () Unit!40260)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!46181)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!620 (array!78369 array!78371 (_ BitVec 32) (_ BitVec 32) V!46181 V!46181 (_ BitVec 64) (_ BitVec 32) Int) Unit!40260)

(assert (=> b!1214029 (= lt!552093 (lemmaListMapContainsThenArrayContainsFrom!620 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119992 () Bool)

(assert (=> b!1214029 (= c!119992 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806025 () Bool)

(declare-fun e!689456 () Bool)

(assert (=> b!1214029 (= res!806025 e!689456)))

(declare-fun e!689445 () Bool)

(assert (=> b!1214029 (=> (not res!806025) (not e!689445))))

(assert (=> b!1214029 e!689445))

(declare-fun lt!552094 () Unit!40260)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78369 (_ BitVec 32) (_ BitVec 32)) Unit!40260)

(assert (=> b!1214029 (= lt!552094 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26662 0))(
  ( (Nil!26659) (Cons!26658 (h!27867 (_ BitVec 64)) (t!39729 List!26662)) )
))
(declare-fun arrayNoDuplicates!0 (array!78369 (_ BitVec 32) List!26662) Bool)

(assert (=> b!1214029 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26659)))

(declare-fun lt!552108 () Unit!40260)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78369 (_ BitVec 64) (_ BitVec 32) List!26662) Unit!40260)

(assert (=> b!1214029 (= lt!552108 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26659))))

(assert (=> b!1214029 false))

(declare-fun b!1214030 () Bool)

(declare-fun c!119991 () Bool)

(assert (=> b!1214030 (= c!119991 (and (not lt!552097) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!689453 () Unit!40260)

(assert (=> b!1214030 (= e!689446 e!689453)))

(declare-fun b!1214031 () Bool)

(declare-fun res!806036 () Bool)

(assert (=> b!1214031 (=> (not res!806036) (not e!689447))))

(assert (=> b!1214031 (= res!806036 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26659))))

(declare-fun b!1214032 () Bool)

(declare-fun arrayContainsKey!0 (array!78369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214032 (= e!689445 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214033 () Bool)

(declare-fun e!689459 () Bool)

(assert (=> b!1214033 (= e!689459 tp_is_empty!30791)))

(declare-fun b!1214034 () Bool)

(declare-fun e!689450 () Bool)

(assert (=> b!1214034 (= e!689450 true)))

(declare-fun e!689457 () Bool)

(assert (=> b!1214034 e!689457))

(declare-fun res!806030 () Bool)

(assert (=> b!1214034 (=> (not res!806030) (not e!689457))))

(declare-datatypes ((tuple2!19864 0))(
  ( (tuple2!19865 (_1!9943 (_ BitVec 64)) (_2!9943 V!46181)) )
))
(declare-datatypes ((List!26663 0))(
  ( (Nil!26660) (Cons!26659 (h!27868 tuple2!19864) (t!39730 List!26663)) )
))
(declare-datatypes ((ListLongMap!17833 0))(
  ( (ListLongMap!17834 (toList!8932 List!26663)) )
))
(declare-fun lt!552105 () ListLongMap!17833)

(declare-fun lt!552112 () ListLongMap!17833)

(assert (=> b!1214034 (= res!806030 (= lt!552105 lt!552112))))

(declare-fun lt!552095 () ListLongMap!17833)

(declare-fun -!1877 (ListLongMap!17833 (_ BitVec 64)) ListLongMap!17833)

(assert (=> b!1214034 (= lt!552105 (-!1877 lt!552095 k!934))))

(declare-fun lt!552114 () V!46181)

(declare-fun +!4044 (ListLongMap!17833 tuple2!19864) ListLongMap!17833)

(assert (=> b!1214034 (= (-!1877 (+!4044 lt!552112 (tuple2!19865 (select (arr!37819 _keys!1208) from!1455) lt!552114)) (select (arr!37819 _keys!1208) from!1455)) lt!552112)))

(declare-fun lt!552102 () Unit!40260)

(declare-fun addThenRemoveForNewKeyIsSame!288 (ListLongMap!17833 (_ BitVec 64) V!46181) Unit!40260)

(assert (=> b!1214034 (= lt!552102 (addThenRemoveForNewKeyIsSame!288 lt!552112 (select (arr!37819 _keys!1208) from!1455) lt!552114))))

(declare-fun lt!552099 () V!46181)

(declare-fun get!19279 (ValueCell!14686 V!46181) V!46181)

(assert (=> b!1214034 (= lt!552114 (get!19279 (select (arr!37820 _values!996) from!1455) lt!552099))))

(declare-fun lt!552110 () Unit!40260)

(assert (=> b!1214034 (= lt!552110 e!689458)))

(declare-fun c!119989 () Bool)

(declare-fun contains!7002 (ListLongMap!17833 (_ BitVec 64)) Bool)

(assert (=> b!1214034 (= c!119989 (contains!7002 lt!552112 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!5359 (array!78369 array!78371 (_ BitVec 32) (_ BitVec 32) V!46181 V!46181 (_ BitVec 32) Int) ListLongMap!17833)

(assert (=> b!1214034 (= lt!552112 (getCurrentListMapNoExtraKeys!5359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!689455 () Bool)

(declare-fun call!60530 () ListLongMap!17833)

(declare-fun call!60529 () ListLongMap!17833)

(declare-fun b!1214035 () Bool)

(assert (=> b!1214035 (= e!689455 (= call!60530 (-!1877 call!60529 k!934)))))

(declare-fun lt!552104 () array!78371)

(declare-fun lt!552101 () array!78369)

(declare-fun b!1214036 () Bool)

(assert (=> b!1214036 (= e!689457 (= lt!552105 (getCurrentListMapNoExtraKeys!5359 lt!552101 lt!552104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1214037 () Bool)

(declare-fun res!806034 () Bool)

(assert (=> b!1214037 (=> (not res!806034) (not e!689447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78369 (_ BitVec 32)) Bool)

(assert (=> b!1214037 (= res!806034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!60531 () ListLongMap!17833)

(declare-fun bm!60524 () Bool)

(assert (=> bm!60524 (= call!60531 (+!4044 lt!552112 (ite (or c!119993 c!119991) (tuple2!19865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!60525 () Bool)

(assert (=> bm!60525 (= call!60529 (getCurrentListMapNoExtraKeys!5359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60533 () ListLongMap!17833)

(declare-fun call!60527 () Bool)

(declare-fun lt!552103 () ListLongMap!17833)

(declare-fun bm!60526 () Bool)

(assert (=> bm!60526 (= call!60527 (contains!7002 (ite c!119993 lt!552103 call!60533) k!934))))

(declare-fun b!1214038 () Bool)

(assert (=> b!1214038 (= e!689455 (= call!60530 call!60529))))

(declare-fun b!1214039 () Bool)

(declare-fun call!60532 () Bool)

(assert (=> b!1214039 call!60532))

(declare-fun lt!552107 () Unit!40260)

(declare-fun call!60528 () Unit!40260)

(assert (=> b!1214039 (= lt!552107 call!60528)))

(assert (=> b!1214039 (= e!689461 lt!552107)))

(declare-fun b!1214040 () Bool)

(assert (=> b!1214040 (= e!689456 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552097) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1214041 () Bool)

(declare-fun res!806035 () Bool)

(assert (=> b!1214041 (=> (not res!806035) (not e!689447))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214041 (= res!806035 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38355 _keys!1208))))))

(declare-fun bm!60527 () Bool)

(assert (=> bm!60527 (= call!60532 call!60527)))

(declare-fun bm!60528 () Bool)

(assert (=> bm!60528 (= call!60530 (getCurrentListMapNoExtraKeys!5359 lt!552101 lt!552104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214042 () Bool)

(assert (=> b!1214042 (= e!689451 tp_is_empty!30791)))

(declare-fun b!1214043 () Bool)

(declare-fun res!806037 () Bool)

(assert (=> b!1214043 (=> (not res!806037) (not e!689447))))

(assert (=> b!1214043 (= res!806037 (= (select (arr!37819 _keys!1208) i!673) k!934))))

(declare-fun b!1214044 () Bool)

(declare-fun e!689449 () Bool)

(assert (=> b!1214044 (= e!689449 e!689450)))

(declare-fun res!806026 () Bool)

(assert (=> b!1214044 (=> res!806026 e!689450)))

(assert (=> b!1214044 (= res!806026 (not (= (select (arr!37819 _keys!1208) from!1455) k!934)))))

(assert (=> b!1214044 e!689455))

(declare-fun c!119990 () Bool)

(assert (=> b!1214044 (= c!119990 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552106 () Unit!40260)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1084 (array!78369 array!78371 (_ BitVec 32) (_ BitVec 32) V!46181 V!46181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40260)

(assert (=> b!1214044 (= lt!552106 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1084 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60534 () Unit!40260)

(declare-fun bm!60529 () Bool)

(declare-fun addStillContains!1072 (ListLongMap!17833 (_ BitVec 64) V!46181 (_ BitVec 64)) Unit!40260)

(assert (=> bm!60529 (= call!60534 (addStillContains!1072 (ite c!119993 lt!552103 lt!552112) (ite c!119993 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119991 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119993 minValue!944 (ite c!119991 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!60530 () Bool)

(assert (=> bm!60530 (= call!60533 call!60531)))

(declare-fun b!1214045 () Bool)

(declare-fun e!689452 () Bool)

(assert (=> b!1214045 (= e!689452 e!689449)))

(declare-fun res!806038 () Bool)

(assert (=> b!1214045 (=> res!806038 e!689449)))

(assert (=> b!1214045 (= res!806038 (not (= from!1455 i!673)))))

(declare-fun lt!552111 () ListLongMap!17833)

(assert (=> b!1214045 (= lt!552111 (getCurrentListMapNoExtraKeys!5359 lt!552101 lt!552104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1214045 (= lt!552104 (array!78372 (store (arr!37820 _values!996) i!673 (ValueCellFull!14686 lt!552099)) (size!38356 _values!996)))))

(declare-fun dynLambda!3249 (Int (_ BitVec 64)) V!46181)

(assert (=> b!1214045 (= lt!552099 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1214045 (= lt!552095 (getCurrentListMapNoExtraKeys!5359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214046 () Bool)

(assert (=> b!1214046 (= e!689456 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214047 () Bool)

(declare-fun e!689460 () Bool)

(assert (=> b!1214047 (= e!689447 e!689460)))

(declare-fun res!806029 () Bool)

(assert (=> b!1214047 (=> (not res!806029) (not e!689460))))

(assert (=> b!1214047 (= res!806029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552101 mask!1564))))

(assert (=> b!1214047 (= lt!552101 (array!78370 (store (arr!37819 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38355 _keys!1208)))))

(declare-fun bm!60531 () Bool)

(assert (=> bm!60531 (= call!60528 call!60534)))

(declare-fun b!1214048 () Bool)

(declare-fun res!806028 () Bool)

(assert (=> b!1214048 (=> (not res!806028) (not e!689447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214048 (= res!806028 (validKeyInArray!0 k!934))))

(declare-fun b!1214049 () Bool)

(assert (=> b!1214049 (= e!689454 (and e!689459 mapRes!48061))))

(declare-fun condMapEmpty!48061 () Bool)

(declare-fun mapDefault!48061 () ValueCell!14686)

