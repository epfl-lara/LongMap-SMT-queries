; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98700 () Bool)

(assert start!98700)

(declare-fun b_free!24305 () Bool)

(declare-fun b_next!24305 () Bool)

(assert (=> start!98700 (= b_free!24305 (not b_next!24305))))

(declare-fun tp!85625 () Bool)

(declare-fun b_and!39459 () Bool)

(assert (=> start!98700 (= tp!85625 b_and!39459)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!653577 () Bool)

(declare-fun lt!513812 () Bool)

(declare-fun b!1149043 () Bool)

(assert (=> b!1149043 (= e!653577 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513812) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!43573 0))(
  ( (V!43574 (val!14474 Int)) )
))
(declare-datatypes ((tuple2!18360 0))(
  ( (tuple2!18361 (_1!9191 (_ BitVec 64)) (_2!9191 V!43573)) )
))
(declare-datatypes ((List!25111 0))(
  ( (Nil!25108) (Cons!25107 (h!26316 tuple2!18360) (t!36408 List!25111)) )
))
(declare-datatypes ((ListLongMap!16329 0))(
  ( (ListLongMap!16330 (toList!8180 List!25111)) )
))
(declare-fun lt!513808 () ListLongMap!16329)

(declare-fun b!1149044 () Bool)

(declare-fun lt!513804 () ListLongMap!16329)

(declare-fun e!653563 () Bool)

(declare-fun -!1315 (ListLongMap!16329 (_ BitVec 64)) ListLongMap!16329)

(assert (=> b!1149044 (= e!653563 (= (-!1315 lt!513804 k!934) lt!513808))))

(declare-fun zeroValue!944 () V!43573)

(declare-fun bm!53199 () Bool)

(declare-fun c!113604 () Bool)

(declare-fun c!113603 () Bool)

(declare-fun minValue!944 () V!43573)

(declare-fun call!53205 () ListLongMap!16329)

(declare-fun +!3602 (ListLongMap!16329 tuple2!18360) ListLongMap!16329)

(assert (=> bm!53199 (= call!53205 (+!3602 lt!513808 (ite (or c!113603 c!113604) (tuple2!18361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1149045 () Bool)

(declare-datatypes ((Unit!37769 0))(
  ( (Unit!37770) )
))
(declare-fun e!653571 () Unit!37769)

(declare-fun e!653565 () Unit!37769)

(assert (=> b!1149045 (= e!653571 e!653565)))

(declare-fun c!113606 () Bool)

(assert (=> b!1149045 (= c!113606 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513812))))

(declare-fun b!1149046 () Bool)

(declare-fun e!653566 () Bool)

(declare-fun call!53208 () ListLongMap!16329)

(declare-fun call!53204 () ListLongMap!16329)

(assert (=> b!1149046 (= e!653566 (= call!53208 call!53204))))

(declare-fun mapIsEmpty!45077 () Bool)

(declare-fun mapRes!45077 () Bool)

(assert (=> mapIsEmpty!45077 mapRes!45077))

(declare-fun b!1149047 () Bool)

(assert (=> b!1149047 (= c!113604 (and (not lt!513812) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653574 () Unit!37769)

(assert (=> b!1149047 (= e!653574 e!653571)))

(declare-fun b!1149048 () Bool)

(declare-fun e!653569 () Bool)

(declare-fun e!653567 () Bool)

(assert (=> b!1149048 (= e!653569 e!653567)))

(declare-fun res!764534 () Bool)

(assert (=> b!1149048 (=> res!764534 e!653567)))

(declare-datatypes ((array!74517 0))(
  ( (array!74518 (arr!35909 (Array (_ BitVec 32) (_ BitVec 64))) (size!36445 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74517)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1149048 (= res!764534 (not (= (select (arr!35909 _keys!1208) from!1455) k!934)))))

(assert (=> b!1149048 e!653566))

(declare-fun c!113608 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149048 (= c!113608 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13708 0))(
  ( (ValueCellFull!13708 (v!17111 V!43573)) (EmptyCell!13708) )
))
(declare-datatypes ((array!74519 0))(
  ( (array!74520 (arr!35910 (Array (_ BitVec 32) ValueCell!13708)) (size!36446 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74519)

(declare-fun lt!513811 () Unit!37769)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!552 (array!74517 array!74519 (_ BitVec 32) (_ BitVec 32) V!43573 V!43573 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37769)

(assert (=> b!1149048 (= lt!513811 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!552 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149042 () Bool)

(declare-fun e!653562 () Bool)

(declare-fun e!653570 () Bool)

(assert (=> b!1149042 (= e!653562 (not e!653570))))

(declare-fun res!764542 () Bool)

(assert (=> b!1149042 (=> res!764542 e!653570)))

(assert (=> b!1149042 (= res!764542 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149042 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513809 () Unit!37769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74517 (_ BitVec 64) (_ BitVec 32)) Unit!37769)

(assert (=> b!1149042 (= lt!513809 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!764543 () Bool)

(declare-fun e!653572 () Bool)

(assert (=> start!98700 (=> (not res!764543) (not e!653572))))

(assert (=> start!98700 (= res!764543 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36445 _keys!1208))))))

(assert (=> start!98700 e!653572))

(declare-fun tp_is_empty!28835 () Bool)

(assert (=> start!98700 tp_is_empty!28835))

(declare-fun array_inv!27504 (array!74517) Bool)

(assert (=> start!98700 (array_inv!27504 _keys!1208)))

(assert (=> start!98700 true))

(assert (=> start!98700 tp!85625))

(declare-fun e!653575 () Bool)

(declare-fun array_inv!27505 (array!74519) Bool)

(assert (=> start!98700 (and (array_inv!27505 _values!996) e!653575)))

(declare-fun bm!53200 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4653 (array!74517 array!74519 (_ BitVec 32) (_ BitVec 32) V!43573 V!43573 (_ BitVec 32) Int) ListLongMap!16329)

(assert (=> bm!53200 (= call!53204 (getCurrentListMapNoExtraKeys!4653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149049 () Bool)

(assert (=> b!1149049 (= e!653577 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!653576 () Bool)

(declare-fun b!1149050 () Bool)

(assert (=> b!1149050 (= e!653576 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149051 () Bool)

(declare-fun call!53207 () Bool)

(assert (=> b!1149051 call!53207))

(declare-fun lt!513806 () Unit!37769)

(declare-fun call!53206 () Unit!37769)

(assert (=> b!1149051 (= lt!513806 call!53206)))

(assert (=> b!1149051 (= e!653565 lt!513806)))

(declare-fun b!1149052 () Bool)

(declare-fun res!764531 () Bool)

(assert (=> b!1149052 (=> (not res!764531) (not e!653572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149052 (= res!764531 (validMask!0 mask!1564))))

(declare-fun b!1149053 () Bool)

(assert (=> b!1149053 (= e!653567 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36445 _keys!1208))))))

(assert (=> b!1149053 e!653563))

(declare-fun res!764539 () Bool)

(assert (=> b!1149053 (=> (not res!764539) (not e!653563))))

(declare-fun lt!513801 () V!43573)

(assert (=> b!1149053 (= res!764539 (= (-!1315 (+!3602 lt!513808 (tuple2!18361 (select (arr!35909 _keys!1208) from!1455) lt!513801)) (select (arr!35909 _keys!1208) from!1455)) lt!513808))))

(declare-fun lt!513803 () Unit!37769)

(declare-fun addThenRemoveForNewKeyIsSame!160 (ListLongMap!16329 (_ BitVec 64) V!43573) Unit!37769)

(assert (=> b!1149053 (= lt!513803 (addThenRemoveForNewKeyIsSame!160 lt!513808 (select (arr!35909 _keys!1208) from!1455) lt!513801))))

(declare-fun lt!513805 () V!43573)

(declare-fun get!18274 (ValueCell!13708 V!43573) V!43573)

(assert (=> b!1149053 (= lt!513801 (get!18274 (select (arr!35910 _values!996) from!1455) lt!513805))))

(declare-fun lt!513814 () Unit!37769)

(declare-fun e!653564 () Unit!37769)

(assert (=> b!1149053 (= lt!513814 e!653564)))

(declare-fun c!113607 () Bool)

(declare-fun contains!6703 (ListLongMap!16329 (_ BitVec 64)) Bool)

(assert (=> b!1149053 (= c!113607 (contains!6703 lt!513808 k!934))))

(assert (=> b!1149053 (= lt!513808 (getCurrentListMapNoExtraKeys!4653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149054 () Bool)

(declare-fun res!764532 () Bool)

(assert (=> b!1149054 (=> (not res!764532) (not e!653572))))

(assert (=> b!1149054 (= res!764532 (and (= (size!36446 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36445 _keys!1208) (size!36446 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149055 () Bool)

(declare-fun res!764533 () Bool)

(assert (=> b!1149055 (=> (not res!764533) (not e!653572))))

(assert (=> b!1149055 (= res!764533 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36445 _keys!1208))))))

(declare-fun b!1149056 () Bool)

(declare-fun e!653573 () Bool)

(assert (=> b!1149056 (= e!653573 tp_is_empty!28835)))

(declare-fun bm!53201 () Bool)

(declare-fun lt!513800 () array!74517)

(declare-fun lt!513817 () array!74519)

(assert (=> bm!53201 (= call!53208 (getCurrentListMapNoExtraKeys!4653 lt!513800 lt!513817 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149057 () Bool)

(declare-fun res!764535 () Bool)

(assert (=> b!1149057 (=> (not res!764535) (not e!653572))))

(assert (=> b!1149057 (= res!764535 (= (select (arr!35909 _keys!1208) i!673) k!934))))

(declare-fun b!1149058 () Bool)

(declare-fun res!764529 () Bool)

(assert (=> b!1149058 (=> (not res!764529) (not e!653572))))

(declare-datatypes ((List!25112 0))(
  ( (Nil!25109) (Cons!25108 (h!26317 (_ BitVec 64)) (t!36409 List!25112)) )
))
(declare-fun arrayNoDuplicates!0 (array!74517 (_ BitVec 32) List!25112) Bool)

(assert (=> b!1149058 (= res!764529 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25109))))

(declare-fun b!1149059 () Bool)

(assert (=> b!1149059 (= e!653570 e!653569)))

(declare-fun res!764537 () Bool)

(assert (=> b!1149059 (=> res!764537 e!653569)))

(assert (=> b!1149059 (= res!764537 (not (= from!1455 i!673)))))

(declare-fun lt!513813 () ListLongMap!16329)

(assert (=> b!1149059 (= lt!513813 (getCurrentListMapNoExtraKeys!4653 lt!513800 lt!513817 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1149059 (= lt!513817 (array!74520 (store (arr!35910 _values!996) i!673 (ValueCellFull!13708 lt!513805)) (size!36446 _values!996)))))

(declare-fun dynLambda!2680 (Int (_ BitVec 64)) V!43573)

(assert (=> b!1149059 (= lt!513805 (dynLambda!2680 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1149059 (= lt!513804 (getCurrentListMapNoExtraKeys!4653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149060 () Bool)

(declare-fun res!764540 () Bool)

(assert (=> b!1149060 (=> (not res!764540) (not e!653572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149060 (= res!764540 (validKeyInArray!0 k!934))))

(declare-fun b!1149061 () Bool)

(declare-fun lt!513807 () ListLongMap!16329)

(assert (=> b!1149061 (contains!6703 (+!3602 lt!513807 (tuple2!18361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!513799 () Unit!37769)

(declare-fun addStillContains!852 (ListLongMap!16329 (_ BitVec 64) V!43573 (_ BitVec 64)) Unit!37769)

(assert (=> b!1149061 (= lt!513799 (addStillContains!852 lt!513807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!53202 () Bool)

(assert (=> b!1149061 call!53202))

(assert (=> b!1149061 (= lt!513807 call!53205)))

(declare-fun lt!513802 () Unit!37769)

(declare-fun call!53203 () Unit!37769)

(assert (=> b!1149061 (= lt!513802 call!53203)))

(assert (=> b!1149061 (= e!653574 lt!513799)))

(declare-fun mapNonEmpty!45077 () Bool)

(declare-fun tp!85626 () Bool)

(declare-fun e!653561 () Bool)

(assert (=> mapNonEmpty!45077 (= mapRes!45077 (and tp!85626 e!653561))))

(declare-fun mapRest!45077 () (Array (_ BitVec 32) ValueCell!13708))

(declare-fun mapValue!45077 () ValueCell!13708)

(declare-fun mapKey!45077 () (_ BitVec 32))

(assert (=> mapNonEmpty!45077 (= (arr!35910 _values!996) (store mapRest!45077 mapKey!45077 mapValue!45077))))

(declare-fun b!1149062 () Bool)

(assert (=> b!1149062 (= e!653561 tp_is_empty!28835)))

(declare-fun bm!53202 () Bool)

(declare-fun call!53209 () ListLongMap!16329)

(assert (=> bm!53202 (= call!53209 call!53205)))

(declare-fun b!1149063 () Bool)

(declare-fun lt!513818 () Unit!37769)

(assert (=> b!1149063 (= e!653571 lt!513818)))

(assert (=> b!1149063 (= lt!513818 call!53206)))

(assert (=> b!1149063 call!53207))

(declare-fun bm!53203 () Bool)

(assert (=> bm!53203 (= call!53206 call!53203)))

(declare-fun bm!53204 () Bool)

(assert (=> bm!53204 (= call!53202 (contains!6703 (ite c!113603 lt!513807 call!53209) k!934))))

(declare-fun b!1149064 () Bool)

(declare-fun Unit!37771 () Unit!37769)

(assert (=> b!1149064 (= e!653565 Unit!37771)))

(declare-fun b!1149065 () Bool)

(declare-fun Unit!37772 () Unit!37769)

(assert (=> b!1149065 (= e!653564 Unit!37772)))

(declare-fun b!1149066 () Bool)

(assert (=> b!1149066 (= e!653572 e!653562)))

(declare-fun res!764530 () Bool)

(assert (=> b!1149066 (=> (not res!764530) (not e!653562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74517 (_ BitVec 32)) Bool)

(assert (=> b!1149066 (= res!764530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513800 mask!1564))))

(assert (=> b!1149066 (= lt!513800 (array!74518 (store (arr!35909 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36445 _keys!1208)))))

(declare-fun b!1149067 () Bool)

(assert (=> b!1149067 (= e!653566 (= call!53208 (-!1315 call!53204 k!934)))))

(declare-fun b!1149068 () Bool)

(assert (=> b!1149068 (= e!653575 (and e!653573 mapRes!45077))))

(declare-fun condMapEmpty!45077 () Bool)

(declare-fun mapDefault!45077 () ValueCell!13708)

