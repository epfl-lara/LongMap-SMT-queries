; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98718 () Bool)

(assert start!98718)

(declare-fun b_free!24323 () Bool)

(declare-fun b_next!24323 () Bool)

(assert (=> start!98718 (= b_free!24323 (not b_next!24323))))

(declare-fun tp!85680 () Bool)

(declare-fun b_and!39495 () Bool)

(assert (=> start!98718 (= tp!85680 b_and!39495)))

(declare-fun b!1149870 () Bool)

(declare-fun res!764934 () Bool)

(declare-fun e!654026 () Bool)

(assert (=> b!1149870 (=> (not res!764934) (not e!654026))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149870 (= res!764934 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!43597 0))(
  ( (V!43598 (val!14483 Int)) )
))
(declare-fun zeroValue!944 () V!43597)

(declare-datatypes ((tuple2!18378 0))(
  ( (tuple2!18379 (_1!9200 (_ BitVec 64)) (_2!9200 V!43597)) )
))
(declare-datatypes ((List!25127 0))(
  ( (Nil!25124) (Cons!25123 (h!26332 tuple2!18378) (t!36442 List!25127)) )
))
(declare-datatypes ((ListLongMap!16347 0))(
  ( (ListLongMap!16348 (toList!8189 List!25127)) )
))
(declare-fun lt!514405 () ListLongMap!16347)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!74553 0))(
  ( (array!74554 (arr!35927 (Array (_ BitVec 32) (_ BitVec 64))) (size!36463 (_ BitVec 32))) )
))
(declare-fun lt!514407 () array!74553)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!654030 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13717 0))(
  ( (ValueCellFull!13717 (v!17120 V!43597)) (EmptyCell!13717) )
))
(declare-datatypes ((array!74555 0))(
  ( (array!74556 (arr!35928 (Array (_ BitVec 32) ValueCell!13717)) (size!36464 (_ BitVec 32))) )
))
(declare-fun lt!514409 () array!74555)

(declare-fun minValue!944 () V!43597)

(declare-fun b!1149871 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4662 (array!74553 array!74555 (_ BitVec 32) (_ BitVec 32) V!43597 V!43597 (_ BitVec 32) Int) ListLongMap!16347)

(assert (=> b!1149871 (= e!654030 (= lt!514405 (getCurrentListMapNoExtraKeys!4662 lt!514407 lt!514409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun _keys!1208 () array!74553)

(declare-fun e!654032 () Bool)

(declare-fun b!1149872 () Bool)

(declare-fun arrayContainsKey!0 (array!74553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149872 (= e!654032 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149873 () Bool)

(declare-datatypes ((Unit!37806 0))(
  ( (Unit!37807) )
))
(declare-fun e!654036 () Unit!37806)

(declare-fun Unit!37808 () Unit!37806)

(assert (=> b!1149873 (= e!654036 Unit!37808)))

(declare-fun b!1149874 () Bool)

(declare-fun res!764936 () Bool)

(assert (=> b!1149874 (=> (not res!764936) (not e!654026))))

(declare-datatypes ((List!25128 0))(
  ( (Nil!25125) (Cons!25124 (h!26333 (_ BitVec 64)) (t!36443 List!25128)) )
))
(declare-fun arrayNoDuplicates!0 (array!74553 (_ BitVec 32) List!25128) Bool)

(assert (=> b!1149874 (= res!764936 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25125))))

(declare-fun bm!53415 () Bool)

(declare-fun call!53425 () Unit!37806)

(declare-fun call!53421 () Unit!37806)

(assert (=> bm!53415 (= call!53425 call!53421)))

(declare-fun b!1149875 () Bool)

(declare-fun e!654021 () Unit!37806)

(assert (=> b!1149875 (= e!654021 e!654036)))

(declare-fun c!113769 () Bool)

(declare-fun lt!514411 () Bool)

(assert (=> b!1149875 (= c!113769 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514411))))

(declare-fun bm!53416 () Bool)

(declare-fun call!53424 () Bool)

(declare-fun call!53422 () Bool)

(assert (=> bm!53416 (= call!53424 call!53422)))

(declare-fun b!1149876 () Bool)

(declare-fun e!654027 () Unit!37806)

(declare-fun Unit!37809 () Unit!37806)

(assert (=> b!1149876 (= e!654027 Unit!37809)))

(assert (=> b!1149876 (= lt!514411 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113768 () Bool)

(assert (=> b!1149876 (= c!113768 (and (not lt!514411) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514393 () Unit!37806)

(declare-fun e!654023 () Unit!37806)

(assert (=> b!1149876 (= lt!514393 e!654023)))

(declare-fun _values!996 () array!74555)

(declare-fun lt!514399 () Unit!37806)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!452 (array!74553 array!74555 (_ BitVec 32) (_ BitVec 32) V!43597 V!43597 (_ BitVec 64) (_ BitVec 32) Int) Unit!37806)

(assert (=> b!1149876 (= lt!514399 (lemmaListMapContainsThenArrayContainsFrom!452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113765 () Bool)

(assert (=> b!1149876 (= c!113765 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764948 () Bool)

(declare-fun e!654022 () Bool)

(assert (=> b!1149876 (= res!764948 e!654022)))

(assert (=> b!1149876 (=> (not res!764948) (not e!654032))))

(assert (=> b!1149876 e!654032))

(declare-fun lt!514404 () Unit!37806)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74553 (_ BitVec 32) (_ BitVec 32)) Unit!37806)

(assert (=> b!1149876 (= lt!514404 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149876 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25125)))

(declare-fun lt!514395 () Unit!37806)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74553 (_ BitVec 64) (_ BitVec 32) List!25128) Unit!37806)

(assert (=> b!1149876 (= lt!514395 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25125))))

(assert (=> b!1149876 false))

(declare-fun b!1149877 () Bool)

(declare-fun e!654024 () Bool)

(declare-fun e!654035 () Bool)

(assert (=> b!1149877 (= e!654024 (not e!654035))))

(declare-fun res!764947 () Bool)

(assert (=> b!1149877 (=> res!764947 e!654035)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149877 (= res!764947 (bvsgt from!1455 i!673))))

(assert (=> b!1149877 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!514413 () Unit!37806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74553 (_ BitVec 64) (_ BitVec 32)) Unit!37806)

(assert (=> b!1149877 (= lt!514413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1149878 () Bool)

(declare-fun res!764941 () Bool)

(assert (=> b!1149878 (=> (not res!764941) (not e!654026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74553 (_ BitVec 32)) Bool)

(assert (=> b!1149878 (= res!764941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53417 () Bool)

(declare-fun call!53418 () ListLongMap!16347)

(assert (=> bm!53417 (= call!53418 (getCurrentListMapNoExtraKeys!4662 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149879 () Bool)

(declare-fun e!654034 () Bool)

(declare-fun call!53423 () ListLongMap!16347)

(declare-fun -!1322 (ListLongMap!16347 (_ BitVec 64)) ListLongMap!16347)

(assert (=> b!1149879 (= e!654034 (= call!53423 (-!1322 call!53418 k!934)))))

(declare-fun b!1149880 () Bool)

(declare-fun e!654028 () Bool)

(declare-fun e!654029 () Bool)

(assert (=> b!1149880 (= e!654028 e!654029)))

(declare-fun res!764943 () Bool)

(assert (=> b!1149880 (=> res!764943 e!654029)))

(assert (=> b!1149880 (= res!764943 (not (= (select (arr!35927 _keys!1208) from!1455) k!934)))))

(assert (=> b!1149880 e!654034))

(declare-fun c!113767 () Bool)

(assert (=> b!1149880 (= c!113767 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514410 () Unit!37806)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!559 (array!74553 array!74555 (_ BitVec 32) (_ BitVec 32) V!43597 V!43597 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37806)

(assert (=> b!1149880 (= lt!514410 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!559 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149881 () Bool)

(declare-fun res!764942 () Bool)

(assert (=> b!1149881 (=> (not res!764942) (not e!654026))))

(assert (=> b!1149881 (= res!764942 (and (= (size!36464 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36463 _keys!1208) (size!36464 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149882 () Bool)

(assert (=> b!1149882 (= e!654022 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149883 () Bool)

(declare-fun c!113770 () Bool)

(assert (=> b!1149883 (= c!113770 (and (not lt!514411) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149883 (= e!654023 e!654021)))

(declare-fun b!1149884 () Bool)

(declare-fun e!654031 () Bool)

(declare-fun tp_is_empty!28853 () Bool)

(assert (=> b!1149884 (= e!654031 tp_is_empty!28853)))

(declare-fun call!53419 () ListLongMap!16347)

(declare-fun lt!514408 () ListLongMap!16347)

(declare-fun bm!53418 () Bool)

(declare-fun contains!6710 (ListLongMap!16347 (_ BitVec 64)) Bool)

(assert (=> bm!53418 (= call!53422 (contains!6710 (ite c!113768 lt!514408 call!53419) k!934))))

(declare-fun bm!53419 () Bool)

(declare-fun call!53420 () ListLongMap!16347)

(assert (=> bm!53419 (= call!53419 call!53420)))

(declare-fun b!1149885 () Bool)

(declare-fun lt!514394 () Unit!37806)

(assert (=> b!1149885 (= e!654021 lt!514394)))

(assert (=> b!1149885 (= lt!514394 call!53425)))

(assert (=> b!1149885 call!53424))

(declare-fun b!1149886 () Bool)

(declare-fun +!3610 (ListLongMap!16347 tuple2!18378) ListLongMap!16347)

(assert (=> b!1149886 (contains!6710 (+!3610 lt!514408 (tuple2!18379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!514403 () Unit!37806)

(assert (=> b!1149886 (= lt!514403 call!53421)))

(assert (=> b!1149886 call!53422))

(assert (=> b!1149886 (= lt!514408 call!53420)))

(declare-fun lt!514400 () ListLongMap!16347)

(declare-fun lt!514392 () Unit!37806)

(declare-fun addStillContains!860 (ListLongMap!16347 (_ BitVec 64) V!43597 (_ BitVec 64)) Unit!37806)

(assert (=> b!1149886 (= lt!514392 (addStillContains!860 lt!514400 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1149886 (= e!654023 lt!514403)))

(declare-fun mapNonEmpty!45104 () Bool)

(declare-fun mapRes!45104 () Bool)

(declare-fun tp!85679 () Bool)

(declare-fun e!654025 () Bool)

(assert (=> mapNonEmpty!45104 (= mapRes!45104 (and tp!85679 e!654025))))

(declare-fun mapValue!45104 () ValueCell!13717)

(declare-fun mapRest!45104 () (Array (_ BitVec 32) ValueCell!13717))

(declare-fun mapKey!45104 () (_ BitVec 32))

(assert (=> mapNonEmpty!45104 (= (arr!35928 _values!996) (store mapRest!45104 mapKey!45104 mapValue!45104))))

(declare-fun b!1149887 () Bool)

(assert (=> b!1149887 call!53424))

(declare-fun lt!514401 () Unit!37806)

(assert (=> b!1149887 (= lt!514401 call!53425)))

(assert (=> b!1149887 (= e!654036 lt!514401)))

(declare-fun bm!53420 () Bool)

(assert (=> bm!53420 (= call!53420 (+!3610 lt!514400 (ite (or c!113768 c!113770) (tuple2!18379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1149888 () Bool)

(assert (=> b!1149888 (= e!654026 e!654024)))

(declare-fun res!764946 () Bool)

(assert (=> b!1149888 (=> (not res!764946) (not e!654024))))

(assert (=> b!1149888 (= res!764946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514407 mask!1564))))

(assert (=> b!1149888 (= lt!514407 (array!74554 (store (arr!35927 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36463 _keys!1208)))))

(declare-fun b!1149889 () Bool)

(declare-fun res!764938 () Bool)

(assert (=> b!1149889 (=> (not res!764938) (not e!654024))))

(assert (=> b!1149889 (= res!764938 (arrayNoDuplicates!0 lt!514407 #b00000000000000000000000000000000 Nil!25125))))

(declare-fun b!1149890 () Bool)

(declare-fun res!764935 () Bool)

(assert (=> b!1149890 (=> (not res!764935) (not e!654026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149890 (= res!764935 (validMask!0 mask!1564))))

(declare-fun b!1149891 () Bool)

(declare-fun res!764937 () Bool)

(assert (=> b!1149891 (=> (not res!764937) (not e!654026))))

(assert (=> b!1149891 (= res!764937 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36463 _keys!1208))))))

(declare-fun b!1149892 () Bool)

(assert (=> b!1149892 (= e!654022 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514411) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53421 () Bool)

(assert (=> bm!53421 (= call!53421 (addStillContains!860 (ite c!113768 lt!514408 lt!514400) (ite c!113768 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113770 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113768 minValue!944 (ite c!113770 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1149893 () Bool)

(declare-fun res!764945 () Bool)

(assert (=> b!1149893 (=> (not res!764945) (not e!654026))))

(assert (=> b!1149893 (= res!764945 (= (select (arr!35927 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!45104 () Bool)

(assert (=> mapIsEmpty!45104 mapRes!45104))

(declare-fun res!764944 () Bool)

(assert (=> start!98718 (=> (not res!764944) (not e!654026))))

(assert (=> start!98718 (= res!764944 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36463 _keys!1208))))))

(assert (=> start!98718 e!654026))

(assert (=> start!98718 tp_is_empty!28853))

(declare-fun array_inv!27514 (array!74553) Bool)

(assert (=> start!98718 (array_inv!27514 _keys!1208)))

(assert (=> start!98718 true))

(assert (=> start!98718 tp!85680))

(declare-fun e!654033 () Bool)

(declare-fun array_inv!27515 (array!74555) Bool)

(assert (=> start!98718 (and (array_inv!27515 _values!996) e!654033)))

(declare-fun b!1149894 () Bool)

(assert (=> b!1149894 (= e!654029 true)))

(assert (=> b!1149894 e!654030))

(declare-fun res!764939 () Bool)

(assert (=> b!1149894 (=> (not res!764939) (not e!654030))))

(assert (=> b!1149894 (= res!764939 (= lt!514405 lt!514400))))

(declare-fun lt!514398 () ListLongMap!16347)

(assert (=> b!1149894 (= lt!514405 (-!1322 lt!514398 k!934))))

(declare-fun lt!514396 () V!43597)

(assert (=> b!1149894 (= (-!1322 (+!3610 lt!514400 (tuple2!18379 (select (arr!35927 _keys!1208) from!1455) lt!514396)) (select (arr!35927 _keys!1208) from!1455)) lt!514400)))

(declare-fun lt!514397 () Unit!37806)

(declare-fun addThenRemoveForNewKeyIsSame!166 (ListLongMap!16347 (_ BitVec 64) V!43597) Unit!37806)

(assert (=> b!1149894 (= lt!514397 (addThenRemoveForNewKeyIsSame!166 lt!514400 (select (arr!35927 _keys!1208) from!1455) lt!514396))))

(declare-fun lt!514406 () V!43597)

(declare-fun get!18286 (ValueCell!13717 V!43597) V!43597)

(assert (=> b!1149894 (= lt!514396 (get!18286 (select (arr!35928 _values!996) from!1455) lt!514406))))

(declare-fun lt!514412 () Unit!37806)

(assert (=> b!1149894 (= lt!514412 e!654027)))

(declare-fun c!113766 () Bool)

(assert (=> b!1149894 (= c!113766 (contains!6710 lt!514400 k!934))))

(assert (=> b!1149894 (= lt!514400 (getCurrentListMapNoExtraKeys!4662 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149895 () Bool)

(assert (=> b!1149895 (= e!654033 (and e!654031 mapRes!45104))))

(declare-fun condMapEmpty!45104 () Bool)

(declare-fun mapDefault!45104 () ValueCell!13717)

