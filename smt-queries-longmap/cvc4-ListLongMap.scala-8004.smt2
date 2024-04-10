; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98868 () Bool)

(assert start!98868)

(declare-fun b_free!24473 () Bool)

(declare-fun b_next!24473 () Bool)

(assert (=> start!98868 (= b_free!24473 (not b_next!24473))))

(declare-fun tp!86129 () Bool)

(declare-fun b_and!39795 () Bool)

(assert (=> start!98868 (= tp!86129 b_and!39795)))

(declare-fun b!1156770 () Bool)

(declare-fun e!657849 () Bool)

(declare-fun e!657850 () Bool)

(assert (=> b!1156770 (= e!657849 e!657850)))

(declare-fun res!768319 () Bool)

(assert (=> b!1156770 (=> res!768319 e!657850)))

(declare-datatypes ((array!74851 0))(
  ( (array!74852 (arr!36076 (Array (_ BitVec 32) (_ BitVec 64))) (size!36612 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74851)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1156770 (= res!768319 (not (= (select (arr!36076 _keys!1208) from!1455) k!934)))))

(declare-fun e!657845 () Bool)

(assert (=> b!1156770 e!657845))

(declare-fun c!115120 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156770 (= c!115120 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43797 0))(
  ( (V!43798 (val!14558 Int)) )
))
(declare-fun zeroValue!944 () V!43797)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!38103 0))(
  ( (Unit!38104) )
))
(declare-fun lt!519348 () Unit!38103)

(declare-datatypes ((ValueCell!13792 0))(
  ( (ValueCellFull!13792 (v!17195 V!43797)) (EmptyCell!13792) )
))
(declare-datatypes ((array!74853 0))(
  ( (array!74854 (arr!36077 (Array (_ BitVec 32) ValueCell!13792)) (size!36613 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74853)

(declare-fun minValue!944 () V!43797)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!608 (array!74851 array!74853 (_ BitVec 32) (_ BitVec 32) V!43797 V!43797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38103)

(assert (=> b!1156770 (= lt!519348 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!608 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!768310 () Bool)

(declare-fun e!657861 () Bool)

(assert (=> start!98868 (=> (not res!768310) (not e!657861))))

(assert (=> start!98868 (= res!768310 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36612 _keys!1208))))))

(assert (=> start!98868 e!657861))

(declare-fun tp_is_empty!29003 () Bool)

(assert (=> start!98868 tp_is_empty!29003))

(declare-fun array_inv!27610 (array!74851) Bool)

(assert (=> start!98868 (array_inv!27610 _keys!1208)))

(assert (=> start!98868 true))

(assert (=> start!98868 tp!86129))

(declare-fun e!657846 () Bool)

(declare-fun array_inv!27611 (array!74853) Bool)

(assert (=> start!98868 (and (array_inv!27611 _values!996) e!657846)))

(declare-fun b!1156771 () Bool)

(declare-fun res!768318 () Bool)

(assert (=> b!1156771 (=> (not res!768318) (not e!657861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74851 (_ BitVec 32)) Bool)

(assert (=> b!1156771 (= res!768318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45329 () Bool)

(declare-fun mapRes!45329 () Bool)

(assert (=> mapIsEmpty!45329 mapRes!45329))

(declare-fun b!1156772 () Bool)

(declare-fun res!768323 () Bool)

(assert (=> b!1156772 (=> (not res!768323) (not e!657861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156772 (= res!768323 (validMask!0 mask!1564))))

(declare-fun bm!55215 () Bool)

(declare-datatypes ((tuple2!18520 0))(
  ( (tuple2!18521 (_1!9271 (_ BitVec 64)) (_2!9271 V!43797)) )
))
(declare-datatypes ((List!25262 0))(
  ( (Nil!25259) (Cons!25258 (h!26467 tuple2!18520) (t!36727 List!25262)) )
))
(declare-datatypes ((ListLongMap!16489 0))(
  ( (ListLongMap!16490 (toList!8260 List!25262)) )
))
(declare-fun call!55218 () ListLongMap!16489)

(declare-fun getCurrentListMapNoExtraKeys!4728 (array!74851 array!74853 (_ BitVec 32) (_ BitVec 32) V!43797 V!43797 (_ BitVec 32) Int) ListLongMap!16489)

(assert (=> bm!55215 (= call!55218 (getCurrentListMapNoExtraKeys!4728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156773 () Bool)

(declare-fun call!55220 () ListLongMap!16489)

(declare-fun contains!6772 (ListLongMap!16489 (_ BitVec 64)) Bool)

(assert (=> b!1156773 (contains!6772 call!55220 k!934)))

(declare-fun lt!519360 () ListLongMap!16489)

(declare-fun lt!519345 () Unit!38103)

(declare-fun addStillContains!915 (ListLongMap!16489 (_ BitVec 64) V!43797 (_ BitVec 64)) Unit!38103)

(assert (=> b!1156773 (= lt!519345 (addStillContains!915 lt!519360 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!55224 () Bool)

(assert (=> b!1156773 call!55224))

(declare-fun lt!519355 () ListLongMap!16489)

(declare-fun +!3673 (ListLongMap!16489 tuple2!18520) ListLongMap!16489)

(assert (=> b!1156773 (= lt!519360 (+!3673 lt!519355 (tuple2!18521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519351 () Unit!38103)

(declare-fun call!55219 () Unit!38103)

(assert (=> b!1156773 (= lt!519351 call!55219)))

(declare-fun e!657856 () Unit!38103)

(assert (=> b!1156773 (= e!657856 lt!519345)))

(declare-fun b!1156774 () Bool)

(declare-fun e!657855 () Bool)

(assert (=> b!1156774 (= e!657855 tp_is_empty!29003)))

(declare-fun b!1156775 () Bool)

(declare-fun res!768317 () Bool)

(assert (=> b!1156775 (=> (not res!768317) (not e!657861))))

(assert (=> b!1156775 (= res!768317 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36612 _keys!1208))))))

(declare-fun call!55222 () ListLongMap!16489)

(declare-fun lt!519361 () array!74853)

(declare-fun bm!55216 () Bool)

(declare-fun lt!519343 () array!74851)

(assert (=> bm!55216 (= call!55222 (getCurrentListMapNoExtraKeys!4728 lt!519343 lt!519361 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156776 () Bool)

(assert (=> b!1156776 (= e!657850 true)))

(declare-fun e!657848 () Bool)

(assert (=> b!1156776 e!657848))

(declare-fun res!768311 () Bool)

(assert (=> b!1156776 (=> (not res!768311) (not e!657848))))

(declare-fun lt!519358 () ListLongMap!16489)

(assert (=> b!1156776 (= res!768311 (= lt!519358 lt!519355))))

(declare-fun lt!519349 () ListLongMap!16489)

(declare-fun -!1376 (ListLongMap!16489 (_ BitVec 64)) ListLongMap!16489)

(assert (=> b!1156776 (= lt!519358 (-!1376 lt!519349 k!934))))

(declare-fun lt!519350 () V!43797)

(assert (=> b!1156776 (= (-!1376 (+!3673 lt!519355 (tuple2!18521 (select (arr!36076 _keys!1208) from!1455) lt!519350)) (select (arr!36076 _keys!1208) from!1455)) lt!519355)))

(declare-fun lt!519354 () Unit!38103)

(declare-fun addThenRemoveForNewKeyIsSame!215 (ListLongMap!16489 (_ BitVec 64) V!43797) Unit!38103)

(assert (=> b!1156776 (= lt!519354 (addThenRemoveForNewKeyIsSame!215 lt!519355 (select (arr!36076 _keys!1208) from!1455) lt!519350))))

(declare-fun lt!519353 () V!43797)

(declare-fun get!18385 (ValueCell!13792 V!43797) V!43797)

(assert (=> b!1156776 (= lt!519350 (get!18385 (select (arr!36077 _values!996) from!1455) lt!519353))))

(declare-fun lt!519344 () Unit!38103)

(declare-fun e!657853 () Unit!38103)

(assert (=> b!1156776 (= lt!519344 e!657853)))

(declare-fun c!115119 () Bool)

(assert (=> b!1156776 (= c!115119 (contains!6772 lt!519355 k!934))))

(assert (=> b!1156776 (= lt!519355 (getCurrentListMapNoExtraKeys!4728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115115 () Bool)

(declare-fun c!115117 () Bool)

(declare-fun bm!55217 () Bool)

(assert (=> bm!55217 (= call!55219 (addStillContains!915 lt!519355 (ite (or c!115117 c!115115) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115117 c!115115) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1156777 () Bool)

(declare-fun e!657847 () Bool)

(declare-fun arrayContainsKey!0 (array!74851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156777 (= e!657847 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45329 () Bool)

(declare-fun tp!86130 () Bool)

(declare-fun e!657859 () Bool)

(assert (=> mapNonEmpty!45329 (= mapRes!45329 (and tp!86130 e!657859))))

(declare-fun mapKey!45329 () (_ BitVec 32))

(declare-fun mapRest!45329 () (Array (_ BitVec 32) ValueCell!13792))

(declare-fun mapValue!45329 () ValueCell!13792)

(assert (=> mapNonEmpty!45329 (= (arr!36077 _values!996) (store mapRest!45329 mapKey!45329 mapValue!45329))))

(declare-fun b!1156778 () Bool)

(declare-fun e!657852 () Bool)

(declare-fun e!657858 () Bool)

(assert (=> b!1156778 (= e!657852 (not e!657858))))

(declare-fun res!768315 () Bool)

(assert (=> b!1156778 (=> res!768315 e!657858)))

(assert (=> b!1156778 (= res!768315 (bvsgt from!1455 i!673))))

(assert (=> b!1156778 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!519347 () Unit!38103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74851 (_ BitVec 64) (_ BitVec 32)) Unit!38103)

(assert (=> b!1156778 (= lt!519347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1156779 () Bool)

(declare-fun e!657854 () Unit!38103)

(declare-fun e!657857 () Unit!38103)

(assert (=> b!1156779 (= e!657854 e!657857)))

(declare-fun c!115118 () Bool)

(declare-fun lt!519359 () Bool)

(assert (=> b!1156779 (= c!115118 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519359))))

(declare-fun b!1156780 () Bool)

(declare-fun Unit!38105 () Unit!38103)

(assert (=> b!1156780 (= e!657853 Unit!38105)))

(declare-fun b!1156781 () Bool)

(assert (=> b!1156781 (= e!657845 (= call!55222 (-!1376 call!55218 k!934)))))

(declare-fun bm!55218 () Bool)

(assert (=> bm!55218 (= call!55220 (+!3673 (ite c!115117 lt!519360 lt!519355) (ite c!115117 (tuple2!18521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115115 (tuple2!18521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1156782 () Bool)

(declare-fun res!768309 () Bool)

(assert (=> b!1156782 (=> (not res!768309) (not e!657861))))

(declare-datatypes ((List!25263 0))(
  ( (Nil!25260) (Cons!25259 (h!26468 (_ BitVec 64)) (t!36728 List!25263)) )
))
(declare-fun arrayNoDuplicates!0 (array!74851 (_ BitVec 32) List!25263) Bool)

(assert (=> b!1156782 (= res!768309 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25260))))

(declare-fun bm!55219 () Bool)

(declare-fun call!55221 () Unit!38103)

(assert (=> bm!55219 (= call!55221 call!55219)))

(declare-fun bm!55220 () Bool)

(declare-fun call!55225 () ListLongMap!16489)

(assert (=> bm!55220 (= call!55225 call!55220)))

(declare-fun b!1156783 () Bool)

(assert (=> b!1156783 (= e!657859 tp_is_empty!29003)))

(declare-fun b!1156784 () Bool)

(declare-fun res!768313 () Bool)

(assert (=> b!1156784 (=> (not res!768313) (not e!657861))))

(assert (=> b!1156784 (= res!768313 (and (= (size!36613 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36612 _keys!1208) (size!36613 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156785 () Bool)

(declare-fun res!768314 () Bool)

(assert (=> b!1156785 (=> (not res!768314) (not e!657861))))

(assert (=> b!1156785 (= res!768314 (= (select (arr!36076 _keys!1208) i!673) k!934))))

(declare-fun bm!55221 () Bool)

(declare-fun call!55223 () Bool)

(assert (=> bm!55221 (= call!55223 call!55224)))

(declare-fun b!1156786 () Bool)

(assert (=> b!1156786 call!55223))

(declare-fun lt!519357 () Unit!38103)

(assert (=> b!1156786 (= lt!519357 call!55221)))

(assert (=> b!1156786 (= e!657857 lt!519357)))

(declare-fun b!1156787 () Bool)

(declare-fun res!768316 () Bool)

(assert (=> b!1156787 (=> (not res!768316) (not e!657861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156787 (= res!768316 (validKeyInArray!0 k!934))))

(declare-fun b!1156788 () Bool)

(assert (=> b!1156788 (= e!657848 (= lt!519358 (getCurrentListMapNoExtraKeys!4728 lt!519343 lt!519361 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156789 () Bool)

(assert (=> b!1156789 (= e!657858 e!657849)))

(declare-fun res!768320 () Bool)

(assert (=> b!1156789 (=> res!768320 e!657849)))

(assert (=> b!1156789 (= res!768320 (not (= from!1455 i!673)))))

(declare-fun lt!519363 () ListLongMap!16489)

(assert (=> b!1156789 (= lt!519363 (getCurrentListMapNoExtraKeys!4728 lt!519343 lt!519361 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1156789 (= lt!519361 (array!74854 (store (arr!36077 _values!996) i!673 (ValueCellFull!13792 lt!519353)) (size!36613 _values!996)))))

(declare-fun dynLambda!2736 (Int (_ BitVec 64)) V!43797)

(assert (=> b!1156789 (= lt!519353 (dynLambda!2736 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1156789 (= lt!519349 (getCurrentListMapNoExtraKeys!4728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156790 () Bool)

(declare-fun Unit!38106 () Unit!38103)

(assert (=> b!1156790 (= e!657857 Unit!38106)))

(declare-fun b!1156791 () Bool)

(assert (=> b!1156791 (= c!115115 (and (not lt!519359) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1156791 (= e!657856 e!657854)))

(declare-fun b!1156792 () Bool)

(declare-fun res!768312 () Bool)

(assert (=> b!1156792 (=> (not res!768312) (not e!657852))))

(assert (=> b!1156792 (= res!768312 (arrayNoDuplicates!0 lt!519343 #b00000000000000000000000000000000 Nil!25260))))

(declare-fun bm!55222 () Bool)

(assert (=> bm!55222 (= call!55224 (contains!6772 (ite c!115117 lt!519360 call!55225) k!934))))

(declare-fun e!657851 () Bool)

(declare-fun b!1156793 () Bool)

(assert (=> b!1156793 (= e!657851 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156794 () Bool)

(assert (=> b!1156794 (= e!657845 (= call!55222 call!55218))))

(declare-fun b!1156795 () Bool)

(declare-fun lt!519352 () Unit!38103)

(assert (=> b!1156795 (= e!657854 lt!519352)))

(assert (=> b!1156795 (= lt!519352 call!55221)))

(assert (=> b!1156795 call!55223))

(declare-fun b!1156796 () Bool)

(declare-fun Unit!38107 () Unit!38103)

(assert (=> b!1156796 (= e!657853 Unit!38107)))

(assert (=> b!1156796 (= lt!519359 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156796 (= c!115117 (and (not lt!519359) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519356 () Unit!38103)

(assert (=> b!1156796 (= lt!519356 e!657856)))

(declare-fun lt!519346 () Unit!38103)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!503 (array!74851 array!74853 (_ BitVec 32) (_ BitVec 32) V!43797 V!43797 (_ BitVec 64) (_ BitVec 32) Int) Unit!38103)

(assert (=> b!1156796 (= lt!519346 (lemmaListMapContainsThenArrayContainsFrom!503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115116 () Bool)

(assert (=> b!1156796 (= c!115116 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768321 () Bool)

(assert (=> b!1156796 (= res!768321 e!657851)))

(assert (=> b!1156796 (=> (not res!768321) (not e!657847))))

(assert (=> b!1156796 e!657847))

(declare-fun lt!519362 () Unit!38103)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74851 (_ BitVec 32) (_ BitVec 32)) Unit!38103)

(assert (=> b!1156796 (= lt!519362 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156796 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25260)))

(declare-fun lt!519342 () Unit!38103)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74851 (_ BitVec 64) (_ BitVec 32) List!25263) Unit!38103)

(assert (=> b!1156796 (= lt!519342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25260))))

(assert (=> b!1156796 false))

(declare-fun b!1156797 () Bool)

(assert (=> b!1156797 (= e!657861 e!657852)))

(declare-fun res!768322 () Bool)

(assert (=> b!1156797 (=> (not res!768322) (not e!657852))))

(assert (=> b!1156797 (= res!768322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519343 mask!1564))))

(assert (=> b!1156797 (= lt!519343 (array!74852 (store (arr!36076 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36612 _keys!1208)))))

(declare-fun b!1156798 () Bool)

(assert (=> b!1156798 (= e!657851 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519359) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156799 () Bool)

(assert (=> b!1156799 (= e!657846 (and e!657855 mapRes!45329))))

(declare-fun condMapEmpty!45329 () Bool)

(declare-fun mapDefault!45329 () ValueCell!13792)

