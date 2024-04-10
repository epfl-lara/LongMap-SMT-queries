; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98796 () Bool)

(assert start!98796)

(declare-fun b_free!24401 () Bool)

(declare-fun b_next!24401 () Bool)

(assert (=> start!98796 (= b_free!24401 (not b_next!24401))))

(declare-fun tp!85913 () Bool)

(declare-fun b_and!39651 () Bool)

(assert (=> start!98796 (= tp!85913 b_and!39651)))

(declare-fun b!1153458 () Bool)

(declare-fun res!766702 () Bool)

(declare-fun e!656012 () Bool)

(assert (=> b!1153458 (=> (not res!766702) (not e!656012))))

(declare-datatypes ((array!74709 0))(
  ( (array!74710 (arr!36005 (Array (_ BitVec 32) (_ BitVec 64))) (size!36541 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74709)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74709 (_ BitVec 32)) Bool)

(assert (=> b!1153458 (= res!766702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153459 () Bool)

(declare-fun e!656020 () Bool)

(declare-fun tp_is_empty!28931 () Bool)

(assert (=> b!1153459 (= e!656020 tp_is_empty!28931)))

(declare-fun res!766701 () Bool)

(assert (=> start!98796 (=> (not res!766701) (not e!656012))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98796 (= res!766701 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36541 _keys!1208))))))

(assert (=> start!98796 e!656012))

(assert (=> start!98796 tp_is_empty!28931))

(declare-fun array_inv!27566 (array!74709) Bool)

(assert (=> start!98796 (array_inv!27566 _keys!1208)))

(assert (=> start!98796 true))

(assert (=> start!98796 tp!85913))

(declare-datatypes ((V!43701 0))(
  ( (V!43702 (val!14522 Int)) )
))
(declare-datatypes ((ValueCell!13756 0))(
  ( (ValueCellFull!13756 (v!17159 V!43701)) (EmptyCell!13756) )
))
(declare-datatypes ((array!74711 0))(
  ( (array!74712 (arr!36006 (Array (_ BitVec 32) ValueCell!13756)) (size!36542 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74711)

(declare-fun e!656025 () Bool)

(declare-fun array_inv!27567 (array!74711) Bool)

(assert (=> start!98796 (and (array_inv!27567 _values!996) e!656025)))

(declare-fun b!1153460 () Bool)

(declare-fun c!114471 () Bool)

(declare-fun lt!516977 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1153460 (= c!114471 (and (not lt!516977) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37963 0))(
  ( (Unit!37964) )
))
(declare-fun e!656017 () Unit!37963)

(declare-fun e!656015 () Unit!37963)

(assert (=> b!1153460 (= e!656017 e!656015)))

(declare-fun b!1153461 () Bool)

(declare-fun call!54354 () Bool)

(assert (=> b!1153461 call!54354))

(declare-fun lt!516978 () Unit!37963)

(declare-fun call!54356 () Unit!37963)

(assert (=> b!1153461 (= lt!516978 call!54356)))

(declare-fun e!656013 () Unit!37963)

(assert (=> b!1153461 (= e!656013 lt!516978)))

(declare-fun mapIsEmpty!45221 () Bool)

(declare-fun mapRes!45221 () Bool)

(assert (=> mapIsEmpty!45221 mapRes!45221))

(declare-fun bm!54351 () Bool)

(declare-fun call!54358 () Unit!37963)

(assert (=> bm!54351 (= call!54356 call!54358)))

(declare-fun b!1153462 () Bool)

(declare-fun e!656023 () Unit!37963)

(declare-fun Unit!37965 () Unit!37963)

(assert (=> b!1153462 (= e!656023 Unit!37965)))

(assert (=> b!1153462 (= lt!516977 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114469 () Bool)

(assert (=> b!1153462 (= c!114469 (and (not lt!516977) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516986 () Unit!37963)

(assert (=> b!1153462 (= lt!516986 e!656017)))

(declare-fun zeroValue!944 () V!43701)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516970 () Unit!37963)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43701)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!480 (array!74709 array!74711 (_ BitVec 32) (_ BitVec 32) V!43701 V!43701 (_ BitVec 64) (_ BitVec 32) Int) Unit!37963)

(assert (=> b!1153462 (= lt!516970 (lemmaListMapContainsThenArrayContainsFrom!480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114472 () Bool)

(assert (=> b!1153462 (= c!114472 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766694 () Bool)

(declare-fun e!656018 () Bool)

(assert (=> b!1153462 (= res!766694 e!656018)))

(declare-fun e!656019 () Bool)

(assert (=> b!1153462 (=> (not res!766694) (not e!656019))))

(assert (=> b!1153462 e!656019))

(declare-fun lt!516972 () Unit!37963)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74709 (_ BitVec 32) (_ BitVec 32)) Unit!37963)

(assert (=> b!1153462 (= lt!516972 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25198 0))(
  ( (Nil!25195) (Cons!25194 (h!26403 (_ BitVec 64)) (t!36591 List!25198)) )
))
(declare-fun arrayNoDuplicates!0 (array!74709 (_ BitVec 32) List!25198) Bool)

(assert (=> b!1153462 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25195)))

(declare-fun lt!516971 () Unit!37963)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74709 (_ BitVec 64) (_ BitVec 32) List!25198) Unit!37963)

(assert (=> b!1153462 (= lt!516971 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25195))))

(assert (=> b!1153462 false))

(declare-fun b!1153463 () Bool)

(assert (=> b!1153463 (= e!656015 e!656013)))

(declare-fun c!114468 () Bool)

(assert (=> b!1153463 (= c!114468 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516977))))

(declare-datatypes ((tuple2!18452 0))(
  ( (tuple2!18453 (_1!9237 (_ BitVec 64)) (_2!9237 V!43701)) )
))
(declare-datatypes ((List!25199 0))(
  ( (Nil!25196) (Cons!25195 (h!26404 tuple2!18452) (t!36592 List!25199)) )
))
(declare-datatypes ((ListLongMap!16421 0))(
  ( (ListLongMap!16422 (toList!8226 List!25199)) )
))
(declare-fun call!54360 () ListLongMap!16421)

(declare-fun lt!516967 () array!74711)

(declare-fun bm!54352 () Bool)

(declare-fun lt!516984 () array!74709)

(declare-fun getCurrentListMapNoExtraKeys!4696 (array!74709 array!74711 (_ BitVec 32) (_ BitVec 32) V!43701 V!43701 (_ BitVec 32) Int) ListLongMap!16421)

(assert (=> bm!54352 (= call!54360 (getCurrentListMapNoExtraKeys!4696 lt!516984 lt!516967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153464 () Bool)

(declare-fun arrayContainsKey!0 (array!74709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153464 (= e!656019 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153465 () Bool)

(declare-fun lt!516980 () Unit!37963)

(assert (=> b!1153465 (= e!656015 lt!516980)))

(assert (=> b!1153465 (= lt!516980 call!54356)))

(assert (=> b!1153465 call!54354))

(declare-fun b!1153466 () Bool)

(declare-fun res!766692 () Bool)

(assert (=> b!1153466 (=> (not res!766692) (not e!656012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153466 (= res!766692 (validMask!0 mask!1564))))

(declare-fun b!1153467 () Bool)

(declare-fun res!766699 () Bool)

(assert (=> b!1153467 (=> (not res!766699) (not e!656012))))

(assert (=> b!1153467 (= res!766699 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25195))))

(declare-fun bm!54353 () Bool)

(declare-fun call!54355 () Bool)

(assert (=> bm!54353 (= call!54354 call!54355)))

(declare-fun b!1153468 () Bool)

(declare-fun res!766697 () Bool)

(assert (=> b!1153468 (=> (not res!766697) (not e!656012))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153468 (= res!766697 (= (select (arr!36005 _keys!1208) i!673) k!934))))

(declare-fun call!54361 () ListLongMap!16421)

(declare-fun b!1153469 () Bool)

(declare-fun e!656021 () Bool)

(declare-fun -!1351 (ListLongMap!16421 (_ BitVec 64)) ListLongMap!16421)

(assert (=> b!1153469 (= e!656021 (= call!54360 (-!1351 call!54361 k!934)))))

(declare-fun b!1153470 () Bool)

(assert (=> b!1153470 (= e!656018 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153471 () Bool)

(declare-fun e!656009 () Bool)

(assert (=> b!1153471 (= e!656012 e!656009)))

(declare-fun res!766693 () Bool)

(assert (=> b!1153471 (=> (not res!766693) (not e!656009))))

(assert (=> b!1153471 (= res!766693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516984 mask!1564))))

(assert (=> b!1153471 (= lt!516984 (array!74710 (store (arr!36005 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36541 _keys!1208)))))

(declare-fun b!1153472 () Bool)

(assert (=> b!1153472 (= e!656021 (= call!54360 call!54361))))

(declare-fun b!1153473 () Bool)

(declare-fun call!54359 () ListLongMap!16421)

(declare-fun contains!6742 (ListLongMap!16421 (_ BitVec 64)) Bool)

(assert (=> b!1153473 (contains!6742 call!54359 k!934)))

(declare-fun lt!516982 () ListLongMap!16421)

(declare-fun lt!516976 () Unit!37963)

(declare-fun addStillContains!886 (ListLongMap!16421 (_ BitVec 64) V!43701 (_ BitVec 64)) Unit!37963)

(assert (=> b!1153473 (= lt!516976 (addStillContains!886 lt!516982 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1153473 call!54355))

(declare-fun lt!516979 () ListLongMap!16421)

(declare-fun +!3641 (ListLongMap!16421 tuple2!18452) ListLongMap!16421)

(assert (=> b!1153473 (= lt!516982 (+!3641 lt!516979 (tuple2!18453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516973 () Unit!37963)

(assert (=> b!1153473 (= lt!516973 call!54358)))

(assert (=> b!1153473 (= e!656017 lt!516976)))

(declare-fun bm!54354 () Bool)

(declare-fun call!54357 () ListLongMap!16421)

(assert (=> bm!54354 (= call!54355 (contains!6742 (ite c!114469 lt!516982 call!54357) k!934))))

(declare-fun b!1153474 () Bool)

(declare-fun e!656010 () Bool)

(declare-fun e!656014 () Bool)

(assert (=> b!1153474 (= e!656010 e!656014)))

(declare-fun res!766689 () Bool)

(assert (=> b!1153474 (=> res!766689 e!656014)))

(assert (=> b!1153474 (= res!766689 (not (= (select (arr!36005 _keys!1208) from!1455) k!934)))))

(assert (=> b!1153474 e!656021))

(declare-fun c!114467 () Bool)

(assert (=> b!1153474 (= c!114467 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516985 () Unit!37963)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!586 (array!74709 array!74711 (_ BitVec 32) (_ BitVec 32) V!43701 V!43701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37963)

(assert (=> b!1153474 (= lt!516985 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!586 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153475 () Bool)

(declare-fun res!766695 () Bool)

(assert (=> b!1153475 (=> (not res!766695) (not e!656009))))

(assert (=> b!1153475 (= res!766695 (arrayNoDuplicates!0 lt!516984 #b00000000000000000000000000000000 Nil!25195))))

(declare-fun b!1153476 () Bool)

(assert (=> b!1153476 (= e!656018 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516977) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54355 () Bool)

(assert (=> bm!54355 (= call!54361 (getCurrentListMapNoExtraKeys!4696 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153477 () Bool)

(declare-fun Unit!37966 () Unit!37963)

(assert (=> b!1153477 (= e!656013 Unit!37966)))

(declare-fun bm!54356 () Bool)

(assert (=> bm!54356 (= call!54359 (+!3641 (ite c!114469 lt!516982 lt!516979) (ite c!114469 (tuple2!18453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114471 (tuple2!18453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153478 () Bool)

(declare-fun res!766698 () Bool)

(assert (=> b!1153478 (=> (not res!766698) (not e!656012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153478 (= res!766698 (validKeyInArray!0 k!934))))

(declare-fun bm!54357 () Bool)

(assert (=> bm!54357 (= call!54357 call!54359)))

(declare-fun bm!54358 () Bool)

(assert (=> bm!54358 (= call!54358 (addStillContains!886 lt!516979 (ite (or c!114469 c!114471) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114469 c!114471) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1153479 () Bool)

(declare-fun res!766696 () Bool)

(assert (=> b!1153479 (=> (not res!766696) (not e!656012))))

(assert (=> b!1153479 (= res!766696 (and (= (size!36542 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36541 _keys!1208) (size!36542 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153480 () Bool)

(assert (=> b!1153480 (= e!656025 (and e!656020 mapRes!45221))))

(declare-fun condMapEmpty!45221 () Bool)

(declare-fun mapDefault!45221 () ValueCell!13756)

