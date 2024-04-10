; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97394 () Bool)

(assert start!97394)

(declare-fun b_free!23365 () Bool)

(declare-fun b_next!23365 () Bool)

(assert (=> start!97394 (= b_free!23365 (not b_next!23365))))

(declare-fun tp!82394 () Bool)

(declare-fun b_and!37565 () Bool)

(assert (=> start!97394 (= tp!82394 b_and!37565)))

(declare-datatypes ((V!41961 0))(
  ( (V!41962 (val!13869 Int)) )
))
(declare-fun zeroValue!944 () V!41961)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!72167 0))(
  ( (array!72168 (arr!34736 (Array (_ BitVec 32) (_ BitVec 64))) (size!35272 (_ BitVec 32))) )
))
(declare-fun lt!496179 () array!72167)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41961)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17540 0))(
  ( (tuple2!17541 (_1!8781 (_ BitVec 64)) (_2!8781 V!41961)) )
))
(declare-datatypes ((List!24224 0))(
  ( (Nil!24221) (Cons!24220 (h!25429 tuple2!17540) (t!34635 List!24224)) )
))
(declare-datatypes ((ListLongMap!15509 0))(
  ( (ListLongMap!15510 (toList!7770 List!24224)) )
))
(declare-fun call!46791 () ListLongMap!15509)

(declare-datatypes ((ValueCell!13103 0))(
  ( (ValueCellFull!13103 (v!16502 V!41961)) (EmptyCell!13103) )
))
(declare-datatypes ((array!72169 0))(
  ( (array!72170 (arr!34737 (Array (_ BitVec 32) ValueCell!13103)) (size!35273 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72169)

(declare-fun bm!46788 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4264 (array!72167 array!72169 (_ BitVec 32) (_ BitVec 32) V!41961 V!41961 (_ BitVec 32) Int) ListLongMap!15509)

(declare-fun dynLambda!2392 (Int (_ BitVec 64)) V!41961)

(assert (=> bm!46788 (= call!46791 (getCurrentListMapNoExtraKeys!4264 lt!496179 (array!72170 (store (arr!34737 _values!996) i!673 (ValueCellFull!13103 (dynLambda!2392 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35273 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110519 () Bool)

(declare-fun e!633326 () Bool)

(declare-fun e!633330 () Bool)

(assert (=> b!1110519 (= e!633326 e!633330)))

(declare-fun res!741092 () Bool)

(assert (=> b!1110519 (=> (not res!741092) (not e!633330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72167 (_ BitVec 32)) Bool)

(assert (=> b!1110519 (= res!741092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496179 mask!1564))))

(declare-fun _keys!1208 () array!72167)

(assert (=> b!1110519 (= lt!496179 (array!72168 (store (arr!34736 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35272 _keys!1208)))))

(declare-fun b!1110520 () Bool)

(declare-fun res!741090 () Bool)

(assert (=> b!1110520 (=> (not res!741090) (not e!633326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110520 (= res!741090 (validMask!0 mask!1564))))

(declare-fun b!1110521 () Bool)

(declare-fun res!741093 () Bool)

(assert (=> b!1110521 (=> (not res!741093) (not e!633326))))

(assert (=> b!1110521 (= res!741093 (and (= (size!35273 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35272 _keys!1208) (size!35273 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!46792 () ListLongMap!15509)

(declare-fun bm!46789 () Bool)

(assert (=> bm!46789 (= call!46792 (getCurrentListMapNoExtraKeys!4264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110522 () Bool)

(declare-fun e!633332 () Bool)

(assert (=> b!1110522 (= e!633332 true)))

(declare-fun e!633331 () Bool)

(assert (=> b!1110522 e!633331))

(declare-fun c!109239 () Bool)

(assert (=> b!1110522 (= c!109239 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36444 0))(
  ( (Unit!36445) )
))
(declare-fun lt!496180 () Unit!36444)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!291 (array!72167 array!72169 (_ BitVec 32) (_ BitVec 32) V!41961 V!41961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36444)

(assert (=> b!1110522 (= lt!496180 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!291 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43255 () Bool)

(declare-fun mapRes!43255 () Bool)

(declare-fun tp!82393 () Bool)

(declare-fun e!633329 () Bool)

(assert (=> mapNonEmpty!43255 (= mapRes!43255 (and tp!82393 e!633329))))

(declare-fun mapKey!43255 () (_ BitVec 32))

(declare-fun mapRest!43255 () (Array (_ BitVec 32) ValueCell!13103))

(declare-fun mapValue!43255 () ValueCell!13103)

(assert (=> mapNonEmpty!43255 (= (arr!34737 _values!996) (store mapRest!43255 mapKey!43255 mapValue!43255))))

(declare-fun b!1110523 () Bool)

(declare-fun e!633333 () Bool)

(declare-fun tp_is_empty!27625 () Bool)

(assert (=> b!1110523 (= e!633333 tp_is_empty!27625)))

(declare-fun b!1110524 () Bool)

(assert (=> b!1110524 (= e!633330 (not e!633332))))

(declare-fun res!741094 () Bool)

(assert (=> b!1110524 (=> res!741094 e!633332)))

(assert (=> b!1110524 (= res!741094 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35272 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110524 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!496181 () Unit!36444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72167 (_ BitVec 64) (_ BitVec 32)) Unit!36444)

(assert (=> b!1110524 (= lt!496181 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1110525 () Bool)

(declare-fun res!741088 () Bool)

(assert (=> b!1110525 (=> (not res!741088) (not e!633326))))

(assert (=> b!1110525 (= res!741088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43255 () Bool)

(assert (=> mapIsEmpty!43255 mapRes!43255))

(declare-fun b!1110526 () Bool)

(assert (=> b!1110526 (= e!633331 (= call!46791 call!46792))))

(declare-fun b!1110527 () Bool)

(declare-fun res!741097 () Bool)

(assert (=> b!1110527 (=> (not res!741097) (not e!633326))))

(declare-datatypes ((List!24225 0))(
  ( (Nil!24222) (Cons!24221 (h!25430 (_ BitVec 64)) (t!34636 List!24225)) )
))
(declare-fun arrayNoDuplicates!0 (array!72167 (_ BitVec 32) List!24225) Bool)

(assert (=> b!1110527 (= res!741097 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24222))))

(declare-fun b!1110529 () Bool)

(declare-fun res!741089 () Bool)

(assert (=> b!1110529 (=> (not res!741089) (not e!633326))))

(assert (=> b!1110529 (= res!741089 (= (select (arr!34736 _keys!1208) i!673) k!934))))

(declare-fun b!1110530 () Bool)

(declare-fun -!1041 (ListLongMap!15509 (_ BitVec 64)) ListLongMap!15509)

(assert (=> b!1110530 (= e!633331 (= call!46791 (-!1041 call!46792 k!934)))))

(declare-fun b!1110531 () Bool)

(assert (=> b!1110531 (= e!633329 tp_is_empty!27625)))

(declare-fun b!1110532 () Bool)

(declare-fun res!741096 () Bool)

(assert (=> b!1110532 (=> (not res!741096) (not e!633326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110532 (= res!741096 (validKeyInArray!0 k!934))))

(declare-fun b!1110533 () Bool)

(declare-fun e!633328 () Bool)

(assert (=> b!1110533 (= e!633328 (and e!633333 mapRes!43255))))

(declare-fun condMapEmpty!43255 () Bool)

(declare-fun mapDefault!43255 () ValueCell!13103)

