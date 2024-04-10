; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97464 () Bool)

(assert start!97464)

(declare-fun b_free!23435 () Bool)

(declare-fun b_next!23435 () Bool)

(assert (=> start!97464 (= b_free!23435 (not b_next!23435))))

(declare-fun tp!82604 () Bool)

(declare-fun b_and!37707 () Bool)

(assert (=> start!97464 (= tp!82604 b_and!37707)))

(declare-fun b!1112281 () Bool)

(declare-fun e!634178 () Bool)

(declare-fun e!634177 () Bool)

(assert (=> b!1112281 (= e!634178 (not e!634177))))

(declare-fun res!742251 () Bool)

(assert (=> b!1112281 (=> res!742251 e!634177)))

(declare-datatypes ((array!72303 0))(
  ( (array!72304 (arr!34804 (Array (_ BitVec 32) (_ BitVec 64))) (size!35340 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72303)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1112281 (= res!742251 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35340 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112281 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36498 0))(
  ( (Unit!36499) )
))
(declare-fun lt!496495 () Unit!36498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72303 (_ BitVec 64) (_ BitVec 32)) Unit!36498)

(assert (=> b!1112281 (= lt!496495 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1112282 () Bool)

(declare-fun res!742250 () Bool)

(declare-fun e!634179 () Bool)

(assert (=> b!1112282 (=> (not res!742250) (not e!634179))))

(declare-datatypes ((List!24285 0))(
  ( (Nil!24282) (Cons!24281 (h!25490 (_ BitVec 64)) (t!34766 List!24285)) )
))
(declare-fun arrayNoDuplicates!0 (array!72303 (_ BitVec 32) List!24285) Bool)

(assert (=> b!1112282 (= res!742250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24282))))

(declare-fun b!1112283 () Bool)

(declare-fun res!742248 () Bool)

(assert (=> b!1112283 (=> (not res!742248) (not e!634179))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72303 (_ BitVec 32)) Bool)

(assert (=> b!1112283 (= res!742248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112284 () Bool)

(declare-fun res!742242 () Bool)

(assert (=> b!1112284 (=> (not res!742242) (not e!634179))))

(declare-datatypes ((V!42053 0))(
  ( (V!42054 (val!13904 Int)) )
))
(declare-datatypes ((ValueCell!13138 0))(
  ( (ValueCellFull!13138 (v!16537 V!42053)) (EmptyCell!13138) )
))
(declare-datatypes ((array!72305 0))(
  ( (array!72306 (arr!34805 (Array (_ BitVec 32) ValueCell!13138)) (size!35341 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72305)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112284 (= res!742242 (and (= (size!35341 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35340 _keys!1208) (size!35341 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112285 () Bool)

(declare-fun res!742249 () Bool)

(assert (=> b!1112285 (=> (not res!742249) (not e!634178))))

(declare-fun lt!496496 () array!72303)

(assert (=> b!1112285 (= res!742249 (arrayNoDuplicates!0 lt!496496 #b00000000000000000000000000000000 Nil!24282))))

(declare-fun zeroValue!944 () V!42053)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17602 0))(
  ( (tuple2!17603 (_1!8812 (_ BitVec 64)) (_2!8812 V!42053)) )
))
(declare-datatypes ((List!24286 0))(
  ( (Nil!24283) (Cons!24282 (h!25491 tuple2!17602) (t!34767 List!24286)) )
))
(declare-datatypes ((ListLongMap!15571 0))(
  ( (ListLongMap!15572 (toList!7801 List!24286)) )
))
(declare-fun call!47001 () ListLongMap!15571)

(declare-fun bm!46998 () Bool)

(declare-fun minValue!944 () V!42053)

(declare-fun getCurrentListMapNoExtraKeys!4291 (array!72303 array!72305 (_ BitVec 32) (_ BitVec 32) V!42053 V!42053 (_ BitVec 32) Int) ListLongMap!15571)

(assert (=> bm!46998 (= call!47001 (getCurrentListMapNoExtraKeys!4291 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112286 () Bool)

(assert (=> b!1112286 (= e!634179 e!634178)))

(declare-fun res!742247 () Bool)

(assert (=> b!1112286 (=> (not res!742247) (not e!634178))))

(assert (=> b!1112286 (= res!742247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496496 mask!1564))))

(assert (=> b!1112286 (= lt!496496 (array!72304 (store (arr!34804 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35340 _keys!1208)))))

(declare-fun res!742252 () Bool)

(assert (=> start!97464 (=> (not res!742252) (not e!634179))))

(assert (=> start!97464 (= res!742252 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35340 _keys!1208))))))

(assert (=> start!97464 e!634179))

(declare-fun tp_is_empty!27695 () Bool)

(assert (=> start!97464 tp_is_empty!27695))

(declare-fun array_inv!26764 (array!72303) Bool)

(assert (=> start!97464 (array_inv!26764 _keys!1208)))

(assert (=> start!97464 true))

(assert (=> start!97464 tp!82604))

(declare-fun e!634176 () Bool)

(declare-fun array_inv!26765 (array!72305) Bool)

(assert (=> start!97464 (and (array_inv!26765 _values!996) e!634176)))

(declare-fun call!47002 () ListLongMap!15571)

(declare-fun bm!46999 () Bool)

(declare-fun dynLambda!2417 (Int (_ BitVec 64)) V!42053)

(assert (=> bm!46999 (= call!47002 (getCurrentListMapNoExtraKeys!4291 lt!496496 (array!72306 (store (arr!34805 _values!996) i!673 (ValueCellFull!13138 (dynLambda!2417 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35341 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112287 () Bool)

(declare-fun res!742244 () Bool)

(assert (=> b!1112287 (=> (not res!742244) (not e!634179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112287 (= res!742244 (validMask!0 mask!1564))))

(declare-fun b!1112288 () Bool)

(declare-fun e!634174 () Bool)

(assert (=> b!1112288 (= e!634174 tp_is_empty!27695)))

(declare-fun b!1112289 () Bool)

(assert (=> b!1112289 (= e!634177 true)))

(declare-fun e!634173 () Bool)

(assert (=> b!1112289 e!634173))

(declare-fun c!109350 () Bool)

(assert (=> b!1112289 (= c!109350 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496494 () Unit!36498)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!314 (array!72303 array!72305 (_ BitVec 32) (_ BitVec 32) V!42053 V!42053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36498)

(assert (=> b!1112289 (= lt!496494 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!314 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112290 () Bool)

(declare-fun res!742245 () Bool)

(assert (=> b!1112290 (=> (not res!742245) (not e!634179))))

(assert (=> b!1112290 (= res!742245 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35340 _keys!1208))))))

(declare-fun b!1112291 () Bool)

(declare-fun res!742243 () Bool)

(assert (=> b!1112291 (=> (not res!742243) (not e!634179))))

(assert (=> b!1112291 (= res!742243 (= (select (arr!34804 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43360 () Bool)

(declare-fun mapRes!43360 () Bool)

(assert (=> mapIsEmpty!43360 mapRes!43360))

(declare-fun b!1112292 () Bool)

(declare-fun res!742246 () Bool)

(assert (=> b!1112292 (=> (not res!742246) (not e!634179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112292 (= res!742246 (validKeyInArray!0 k!934))))

(declare-fun b!1112293 () Bool)

(declare-fun e!634172 () Bool)

(assert (=> b!1112293 (= e!634172 tp_is_empty!27695)))

(declare-fun b!1112294 () Bool)

(assert (=> b!1112294 (= e!634176 (and e!634174 mapRes!43360))))

(declare-fun condMapEmpty!43360 () Bool)

(declare-fun mapDefault!43360 () ValueCell!13138)

