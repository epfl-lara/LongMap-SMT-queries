; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98486 () Bool)

(assert start!98486)

(declare-fun b_free!24091 () Bool)

(declare-fun b_next!24091 () Bool)

(assert (=> start!98486 (= b_free!24091 (not b_next!24091))))

(declare-fun tp!84983 () Bool)

(declare-fun b_and!39031 () Bool)

(assert (=> start!98486 (= tp!84983 b_and!39031)))

(declare-fun b!1139358 () Bool)

(declare-fun e!648265 () Bool)

(declare-datatypes ((V!43289 0))(
  ( (V!43290 (val!14367 Int)) )
))
(declare-datatypes ((tuple2!18160 0))(
  ( (tuple2!18161 (_1!9091 (_ BitVec 64)) (_2!9091 V!43289)) )
))
(declare-datatypes ((List!24916 0))(
  ( (Nil!24913) (Cons!24912 (h!26121 tuple2!18160) (t!35999 List!24916)) )
))
(declare-datatypes ((ListLongMap!16129 0))(
  ( (ListLongMap!16130 (toList!8080 List!24916)) )
))
(declare-fun call!50636 () ListLongMap!16129)

(declare-fun call!50637 () ListLongMap!16129)

(assert (=> b!1139358 (= e!648265 (= call!50636 call!50637))))

(declare-fun b!1139359 () Bool)

(declare-datatypes ((Unit!37340 0))(
  ( (Unit!37341) )
))
(declare-fun e!648275 () Unit!37340)

(declare-fun Unit!37342 () Unit!37340)

(assert (=> b!1139359 (= e!648275 Unit!37342)))

(declare-fun b!1139360 () Bool)

(declare-fun e!648269 () Unit!37340)

(declare-fun e!648268 () Unit!37340)

(assert (=> b!1139360 (= e!648269 e!648268)))

(declare-fun c!111682 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!507070 () Bool)

(assert (=> b!1139360 (= c!111682 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507070))))

(declare-fun b!1139361 () Bool)

(declare-fun res!759886 () Bool)

(declare-fun e!648267 () Bool)

(assert (=> b!1139361 (=> (not res!759886) (not e!648267))))

(declare-datatypes ((array!74101 0))(
  ( (array!74102 (arr!35701 (Array (_ BitVec 32) (_ BitVec 64))) (size!36237 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74101)

(declare-datatypes ((List!24917 0))(
  ( (Nil!24914) (Cons!24913 (h!26122 (_ BitVec 64)) (t!36000 List!24917)) )
))
(declare-fun arrayNoDuplicates!0 (array!74101 (_ BitVec 32) List!24917) Bool)

(assert (=> b!1139361 (= res!759886 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24914))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!648278 () Bool)

(declare-fun b!1139362 () Bool)

(declare-fun arrayContainsKey!0 (array!74101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139362 (= e!648278 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139363 () Bool)

(declare-fun e!648270 () Bool)

(declare-fun e!648264 () Bool)

(assert (=> b!1139363 (= e!648270 e!648264)))

(declare-fun res!759878 () Bool)

(assert (=> b!1139363 (=> res!759878 e!648264)))

(assert (=> b!1139363 (= res!759878 (not (= (select (arr!35701 _keys!1208) from!1455) k!934)))))

(assert (=> b!1139363 e!648265))

(declare-fun c!111680 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139363 (= c!111680 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43289)

(declare-fun lt!507076 () Unit!37340)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13601 0))(
  ( (ValueCellFull!13601 (v!17004 V!43289)) (EmptyCell!13601) )
))
(declare-datatypes ((array!74103 0))(
  ( (array!74104 (arr!35702 (Array (_ BitVec 32) ValueCell!13601)) (size!36238 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74103)

(declare-fun minValue!944 () V!43289)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!478 (array!74101 array!74103 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37340)

(assert (=> b!1139363 (= lt!507076 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50631 () Bool)

(declare-fun call!50640 () ListLongMap!16129)

(declare-fun call!50641 () ListLongMap!16129)

(assert (=> bm!50631 (= call!50640 call!50641)))

(declare-fun b!1139364 () Bool)

(assert (=> b!1139364 (= e!648264 true)))

(declare-fun lt!507066 () V!43289)

(declare-fun lt!507073 () ListLongMap!16129)

(declare-fun -!1231 (ListLongMap!16129 (_ BitVec 64)) ListLongMap!16129)

(declare-fun +!3512 (ListLongMap!16129 tuple2!18160) ListLongMap!16129)

(assert (=> b!1139364 (= (-!1231 (+!3512 lt!507073 (tuple2!18161 (select (arr!35701 _keys!1208) from!1455) lt!507066)) (select (arr!35701 _keys!1208) from!1455)) lt!507073)))

(declare-fun lt!507068 () Unit!37340)

(declare-fun addThenRemoveForNewKeyIsSame!86 (ListLongMap!16129 (_ BitVec 64) V!43289) Unit!37340)

(assert (=> b!1139364 (= lt!507068 (addThenRemoveForNewKeyIsSame!86 lt!507073 (select (arr!35701 _keys!1208) from!1455) lt!507066))))

(declare-fun lt!507069 () V!43289)

(declare-fun get!18130 (ValueCell!13601 V!43289) V!43289)

(assert (=> b!1139364 (= lt!507066 (get!18130 (select (arr!35702 _values!996) from!1455) lt!507069))))

(declare-fun lt!507078 () Unit!37340)

(assert (=> b!1139364 (= lt!507078 e!648275)))

(declare-fun c!111678 () Bool)

(declare-fun contains!6615 (ListLongMap!16129 (_ BitVec 64)) Bool)

(assert (=> b!1139364 (= c!111678 (contains!6615 lt!507073 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4563 (array!74101 array!74103 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 32) Int) ListLongMap!16129)

(assert (=> b!1139364 (= lt!507073 (getCurrentListMapNoExtraKeys!4563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!50635 () Unit!37340)

(declare-fun c!111681 () Bool)

(declare-fun lt!507072 () ListLongMap!16129)

(declare-fun c!111677 () Bool)

(declare-fun bm!50632 () Bool)

(declare-fun addStillContains!770 (ListLongMap!16129 (_ BitVec 64) V!43289 (_ BitVec 64)) Unit!37340)

(assert (=> bm!50632 (= call!50635 (addStillContains!770 (ite c!111677 lt!507072 lt!507073) (ite c!111677 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111681 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111677 minValue!944 (ite c!111681 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1139365 () Bool)

(declare-fun Unit!37343 () Unit!37340)

(assert (=> b!1139365 (= e!648275 Unit!37343)))

(assert (=> b!1139365 (= lt!507070 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139365 (= c!111677 (and (not lt!507070) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507060 () Unit!37340)

(declare-fun e!648277 () Unit!37340)

(assert (=> b!1139365 (= lt!507060 e!648277)))

(declare-fun lt!507062 () Unit!37340)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!371 (array!74101 array!74103 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 64) (_ BitVec 32) Int) Unit!37340)

(assert (=> b!1139365 (= lt!507062 (lemmaListMapContainsThenArrayContainsFrom!371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111679 () Bool)

(assert (=> b!1139365 (= c!111679 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759876 () Bool)

(assert (=> b!1139365 (= res!759876 e!648278)))

(declare-fun e!648276 () Bool)

(assert (=> b!1139365 (=> (not res!759876) (not e!648276))))

(assert (=> b!1139365 e!648276))

(declare-fun lt!507075 () Unit!37340)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74101 (_ BitVec 32) (_ BitVec 32)) Unit!37340)

(assert (=> b!1139365 (= lt!507075 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139365 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24914)))

(declare-fun lt!507063 () Unit!37340)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74101 (_ BitVec 64) (_ BitVec 32) List!24917) Unit!37340)

(assert (=> b!1139365 (= lt!507063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24914))))

(assert (=> b!1139365 false))

(declare-fun b!1139366 () Bool)

(declare-fun e!648272 () Bool)

(assert (=> b!1139366 (= e!648272 e!648270)))

(declare-fun res!759884 () Bool)

(assert (=> b!1139366 (=> res!759884 e!648270)))

(assert (=> b!1139366 (= res!759884 (not (= from!1455 i!673)))))

(declare-fun lt!507077 () array!74101)

(declare-fun lt!507065 () ListLongMap!16129)

(declare-fun lt!507071 () array!74103)

(assert (=> b!1139366 (= lt!507065 (getCurrentListMapNoExtraKeys!4563 lt!507077 lt!507071 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1139366 (= lt!507071 (array!74104 (store (arr!35702 _values!996) i!673 (ValueCellFull!13601 lt!507069)) (size!36238 _values!996)))))

(declare-fun dynLambda!2612 (Int (_ BitVec 64)) V!43289)

(assert (=> b!1139366 (= lt!507069 (dynLambda!2612 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507064 () ListLongMap!16129)

(assert (=> b!1139366 (= lt!507064 (getCurrentListMapNoExtraKeys!4563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50633 () Bool)

(declare-fun call!50638 () Unit!37340)

(assert (=> bm!50633 (= call!50638 call!50635)))

(declare-fun b!1139367 () Bool)

(declare-fun call!50639 () Bool)

(assert (=> b!1139367 call!50639))

(declare-fun lt!507059 () Unit!37340)

(assert (=> b!1139367 (= lt!507059 call!50638)))

(assert (=> b!1139367 (= e!648268 lt!507059)))

(declare-fun bm!50634 () Bool)

(assert (=> bm!50634 (= call!50636 (getCurrentListMapNoExtraKeys!4563 lt!507077 lt!507071 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139368 () Bool)

(declare-fun lt!507074 () Unit!37340)

(assert (=> b!1139368 (= e!648269 lt!507074)))

(assert (=> b!1139368 (= lt!507074 call!50638)))

(assert (=> b!1139368 call!50639))

(declare-fun b!1139369 () Bool)

(assert (=> b!1139369 (= c!111681 (and (not lt!507070) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139369 (= e!648277 e!648269)))

(declare-fun b!1139370 () Bool)

(declare-fun res!759887 () Bool)

(assert (=> b!1139370 (=> (not res!759887) (not e!648267))))

(assert (=> b!1139370 (= res!759887 (and (= (size!36238 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36237 _keys!1208) (size!36238 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50635 () Bool)

(assert (=> bm!50635 (= call!50641 (+!3512 (ite c!111677 lt!507072 lt!507073) (ite c!111677 (tuple2!18161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111681 (tuple2!18161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1139371 () Bool)

(declare-fun res!759874 () Bool)

(assert (=> b!1139371 (=> (not res!759874) (not e!648267))))

(assert (=> b!1139371 (= res!759874 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36237 _keys!1208))))))

(declare-fun mapIsEmpty!44756 () Bool)

(declare-fun mapRes!44756 () Bool)

(assert (=> mapIsEmpty!44756 mapRes!44756))

(declare-fun b!1139372 () Bool)

(declare-fun e!648273 () Bool)

(assert (=> b!1139372 (= e!648267 e!648273)))

(declare-fun res!759880 () Bool)

(assert (=> b!1139372 (=> (not res!759880) (not e!648273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74101 (_ BitVec 32)) Bool)

(assert (=> b!1139372 (= res!759880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507077 mask!1564))))

(assert (=> b!1139372 (= lt!507077 (array!74102 (store (arr!35701 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36237 _keys!1208)))))

(declare-fun res!759885 () Bool)

(assert (=> start!98486 (=> (not res!759885) (not e!648267))))

(assert (=> start!98486 (= res!759885 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36237 _keys!1208))))))

(assert (=> start!98486 e!648267))

(declare-fun tp_is_empty!28621 () Bool)

(assert (=> start!98486 tp_is_empty!28621))

(declare-fun array_inv!27364 (array!74101) Bool)

(assert (=> start!98486 (array_inv!27364 _keys!1208)))

(assert (=> start!98486 true))

(assert (=> start!98486 tp!84983))

(declare-fun e!648266 () Bool)

(declare-fun array_inv!27365 (array!74103) Bool)

(assert (=> start!98486 (and (array_inv!27365 _values!996) e!648266)))

(declare-fun b!1139373 () Bool)

(assert (=> b!1139373 (contains!6615 call!50641 k!934)))

(declare-fun lt!507061 () Unit!37340)

(assert (=> b!1139373 (= lt!507061 call!50635)))

(declare-fun call!50634 () Bool)

(assert (=> b!1139373 call!50634))

(assert (=> b!1139373 (= lt!507072 (+!3512 lt!507073 (tuple2!18161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507067 () Unit!37340)

(assert (=> b!1139373 (= lt!507067 (addStillContains!770 lt!507073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1139373 (= e!648277 lt!507061)))

(declare-fun b!1139374 () Bool)

(declare-fun res!759879 () Bool)

(assert (=> b!1139374 (=> (not res!759879) (not e!648267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139374 (= res!759879 (validKeyInArray!0 k!934))))

(declare-fun b!1139375 () Bool)

(assert (=> b!1139375 (= e!648265 (= call!50636 (-!1231 call!50637 k!934)))))

(declare-fun b!1139376 () Bool)

(assert (=> b!1139376 (= e!648273 (not e!648272))))

(declare-fun res!759883 () Bool)

(assert (=> b!1139376 (=> res!759883 e!648272)))

(assert (=> b!1139376 (= res!759883 (bvsgt from!1455 i!673))))

(assert (=> b!1139376 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!507058 () Unit!37340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74101 (_ BitVec 64) (_ BitVec 32)) Unit!37340)

(assert (=> b!1139376 (= lt!507058 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1139377 () Bool)

(declare-fun e!648271 () Bool)

(assert (=> b!1139377 (= e!648271 tp_is_empty!28621)))

(declare-fun b!1139378 () Bool)

(declare-fun res!759881 () Bool)

(assert (=> b!1139378 (=> (not res!759881) (not e!648267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139378 (= res!759881 (validMask!0 mask!1564))))

(declare-fun b!1139379 () Bool)

(assert (=> b!1139379 (= e!648276 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139380 () Bool)

(declare-fun res!759882 () Bool)

(assert (=> b!1139380 (=> (not res!759882) (not e!648273))))

(assert (=> b!1139380 (= res!759882 (arrayNoDuplicates!0 lt!507077 #b00000000000000000000000000000000 Nil!24914))))

(declare-fun b!1139381 () Bool)

(declare-fun res!759877 () Bool)

(assert (=> b!1139381 (=> (not res!759877) (not e!648267))))

(assert (=> b!1139381 (= res!759877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139382 () Bool)

(declare-fun Unit!37344 () Unit!37340)

(assert (=> b!1139382 (= e!648268 Unit!37344)))

(declare-fun b!1139383 () Bool)

(declare-fun res!759875 () Bool)

(assert (=> b!1139383 (=> (not res!759875) (not e!648267))))

(assert (=> b!1139383 (= res!759875 (= (select (arr!35701 _keys!1208) i!673) k!934))))

(declare-fun bm!50636 () Bool)

(assert (=> bm!50636 (= call!50634 (contains!6615 (ite c!111677 lt!507072 call!50640) k!934))))

(declare-fun b!1139384 () Bool)

(declare-fun e!648274 () Bool)

(assert (=> b!1139384 (= e!648274 tp_is_empty!28621)))

(declare-fun b!1139385 () Bool)

(assert (=> b!1139385 (= e!648278 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507070) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!50637 () Bool)

(assert (=> bm!50637 (= call!50637 (getCurrentListMapNoExtraKeys!4563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139386 () Bool)

(assert (=> b!1139386 (= e!648266 (and e!648271 mapRes!44756))))

(declare-fun condMapEmpty!44756 () Bool)

(declare-fun mapDefault!44756 () ValueCell!13601)

