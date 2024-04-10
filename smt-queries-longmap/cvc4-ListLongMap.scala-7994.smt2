; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98808 () Bool)

(assert start!98808)

(declare-fun b_free!24413 () Bool)

(declare-fun b_next!24413 () Bool)

(assert (=> start!98808 (= b_free!24413 (not b_next!24413))))

(declare-fun tp!85950 () Bool)

(declare-fun b_and!39675 () Bool)

(assert (=> start!98808 (= tp!85950 b_and!39675)))

(declare-fun b!1154010 () Bool)

(declare-fun res!766968 () Bool)

(declare-fun e!656319 () Bool)

(assert (=> b!1154010 (=> (not res!766968) (not e!656319))))

(declare-datatypes ((array!74733 0))(
  ( (array!74734 (arr!36017 (Array (_ BitVec 32) (_ BitVec 64))) (size!36553 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74733)

(declare-datatypes ((List!25208 0))(
  ( (Nil!25205) (Cons!25204 (h!26413 (_ BitVec 64)) (t!36613 List!25208)) )
))
(declare-fun arrayNoDuplicates!0 (array!74733 (_ BitVec 32) List!25208) Bool)

(assert (=> b!1154010 (= res!766968 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25205))))

(declare-fun b!1154011 () Bool)

(declare-fun c!114575 () Bool)

(declare-fun lt!517383 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1154011 (= c!114575 (and (not lt!517383) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37985 0))(
  ( (Unit!37986) )
))
(declare-fun e!656316 () Unit!37985)

(declare-fun e!656317 () Unit!37985)

(assert (=> b!1154011 (= e!656316 e!656317)))

(declare-fun b!1154012 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!656320 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154012 (= e!656320 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154013 () Bool)

(declare-fun e!656315 () Bool)

(declare-fun tp_is_empty!28943 () Bool)

(assert (=> b!1154013 (= e!656315 tp_is_empty!28943)))

(declare-fun b!1154014 () Bool)

(declare-fun e!656328 () Bool)

(declare-fun e!656326 () Bool)

(assert (=> b!1154014 (= e!656328 e!656326)))

(declare-fun res!766971 () Bool)

(assert (=> b!1154014 (=> res!766971 e!656326)))

(assert (=> b!1154014 (= res!766971 (not (= (select (arr!36017 _keys!1208) from!1455) k!934)))))

(declare-fun e!656321 () Bool)

(assert (=> b!1154014 e!656321))

(declare-fun c!114577 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154014 (= c!114577 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43717 0))(
  ( (V!43718 (val!14528 Int)) )
))
(declare-fun zeroValue!944 () V!43717)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!517373 () Unit!37985)

(declare-datatypes ((ValueCell!13762 0))(
  ( (ValueCellFull!13762 (v!17165 V!43717)) (EmptyCell!13762) )
))
(declare-datatypes ((array!74735 0))(
  ( (array!74736 (arr!36018 (Array (_ BitVec 32) ValueCell!13762)) (size!36554 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74735)

(declare-fun minValue!944 () V!43717)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!589 (array!74733 array!74735 (_ BitVec 32) (_ BitVec 32) V!43717 V!43717 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37985)

(assert (=> b!1154014 (= lt!517373 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154015 () Bool)

(declare-fun res!766969 () Bool)

(assert (=> b!1154015 (=> (not res!766969) (not e!656319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154015 (= res!766969 (validMask!0 mask!1564))))

(declare-fun b!1154016 () Bool)

(declare-fun res!766959 () Bool)

(assert (=> b!1154016 (=> (not res!766959) (not e!656319))))

(assert (=> b!1154016 (= res!766959 (and (= (size!36554 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36553 _keys!1208) (size!36554 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154017 () Bool)

(declare-fun res!766970 () Bool)

(assert (=> b!1154017 (=> (not res!766970) (not e!656319))))

(assert (=> b!1154017 (= res!766970 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36553 _keys!1208))))))

(declare-fun call!54499 () Unit!37985)

(declare-fun bm!54495 () Bool)

(declare-datatypes ((tuple2!18464 0))(
  ( (tuple2!18465 (_1!9243 (_ BitVec 64)) (_2!9243 V!43717)) )
))
(declare-datatypes ((List!25209 0))(
  ( (Nil!25206) (Cons!25205 (h!26414 tuple2!18464) (t!36614 List!25209)) )
))
(declare-datatypes ((ListLongMap!16433 0))(
  ( (ListLongMap!16434 (toList!8232 List!25209)) )
))
(declare-fun lt!517374 () ListLongMap!16433)

(declare-fun lt!517364 () ListLongMap!16433)

(declare-fun c!114578 () Bool)

(declare-fun addStillContains!891 (ListLongMap!16433 (_ BitVec 64) V!43717 (_ BitVec 64)) Unit!37985)

(assert (=> bm!54495 (= call!54499 (addStillContains!891 (ite c!114578 lt!517374 lt!517364) (ite c!114578 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114575 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114578 minValue!944 (ite c!114575 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!54496 () Bool)

(declare-fun call!54501 () Unit!37985)

(assert (=> bm!54496 (= call!54501 call!54499)))

(declare-fun b!1154018 () Bool)

(declare-fun e!656323 () Unit!37985)

(assert (=> b!1154018 (= e!656317 e!656323)))

(declare-fun c!114576 () Bool)

(assert (=> b!1154018 (= c!114576 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517383))))

(declare-fun b!1154019 () Bool)

(declare-fun res!766962 () Bool)

(declare-fun e!656324 () Bool)

(assert (=> b!1154019 (=> (not res!766962) (not e!656324))))

(declare-fun lt!517376 () array!74733)

(assert (=> b!1154019 (= res!766962 (arrayNoDuplicates!0 lt!517376 #b00000000000000000000000000000000 Nil!25205))))

(declare-fun lt!517378 () array!74735)

(declare-fun e!656331 () Bool)

(declare-fun b!1154020 () Bool)

(declare-fun lt!517368 () ListLongMap!16433)

(declare-fun getCurrentListMapNoExtraKeys!4701 (array!74733 array!74735 (_ BitVec 32) (_ BitVec 32) V!43717 V!43717 (_ BitVec 32) Int) ListLongMap!16433)

(assert (=> b!1154020 (= e!656331 (= lt!517368 (getCurrentListMapNoExtraKeys!4701 lt!517376 lt!517378 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!54504 () ListLongMap!16433)

(declare-fun bm!54497 () Bool)

(declare-fun +!3645 (ListLongMap!16433 tuple2!18464) ListLongMap!16433)

(assert (=> bm!54497 (= call!54504 (+!3645 (ite c!114578 lt!517374 lt!517364) (ite c!114578 (tuple2!18465 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114575 (tuple2!18465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18465 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1154021 () Bool)

(assert (=> b!1154021 (= e!656326 true)))

(assert (=> b!1154021 e!656331))

(declare-fun res!766972 () Bool)

(assert (=> b!1154021 (=> (not res!766972) (not e!656331))))

(assert (=> b!1154021 (= res!766972 (= lt!517368 lt!517364))))

(declare-fun lt!517377 () ListLongMap!16433)

(declare-fun -!1354 (ListLongMap!16433 (_ BitVec 64)) ListLongMap!16433)

(assert (=> b!1154021 (= lt!517368 (-!1354 lt!517377 k!934))))

(declare-fun lt!517380 () V!43717)

(assert (=> b!1154021 (= (-!1354 (+!3645 lt!517364 (tuple2!18465 (select (arr!36017 _keys!1208) from!1455) lt!517380)) (select (arr!36017 _keys!1208) from!1455)) lt!517364)))

(declare-fun lt!517363 () Unit!37985)

(declare-fun addThenRemoveForNewKeyIsSame!194 (ListLongMap!16433 (_ BitVec 64) V!43717) Unit!37985)

(assert (=> b!1154021 (= lt!517363 (addThenRemoveForNewKeyIsSame!194 lt!517364 (select (arr!36017 _keys!1208) from!1455) lt!517380))))

(declare-fun lt!517370 () V!43717)

(declare-fun get!18344 (ValueCell!13762 V!43717) V!43717)

(assert (=> b!1154021 (= lt!517380 (get!18344 (select (arr!36018 _values!996) from!1455) lt!517370))))

(declare-fun lt!517371 () Unit!37985)

(declare-fun e!656327 () Unit!37985)

(assert (=> b!1154021 (= lt!517371 e!656327)))

(declare-fun c!114580 () Bool)

(declare-fun contains!6746 (ListLongMap!16433 (_ BitVec 64)) Bool)

(assert (=> b!1154021 (= c!114580 (contains!6746 lt!517364 k!934))))

(assert (=> b!1154021 (= lt!517364 (getCurrentListMapNoExtraKeys!4701 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154022 () Bool)

(declare-fun call!54498 () ListLongMap!16433)

(declare-fun call!54502 () ListLongMap!16433)

(assert (=> b!1154022 (= e!656321 (= call!54502 (-!1354 call!54498 k!934)))))

(declare-fun b!1154023 () Bool)

(declare-fun e!656322 () Bool)

(declare-fun e!656318 () Bool)

(declare-fun mapRes!45239 () Bool)

(assert (=> b!1154023 (= e!656322 (and e!656318 mapRes!45239))))

(declare-fun condMapEmpty!45239 () Bool)

(declare-fun mapDefault!45239 () ValueCell!13762)

