; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97418 () Bool)

(assert start!97418)

(declare-fun b_free!23389 () Bool)

(declare-fun b_next!23389 () Bool)

(assert (=> start!97418 (= b_free!23389 (not b_next!23389))))

(declare-fun tp!82466 () Bool)

(declare-fun b_and!37615 () Bool)

(assert (=> start!97418 (= tp!82466 b_and!37615)))

(declare-datatypes ((V!41993 0))(
  ( (V!41994 (val!13881 Int)) )
))
(declare-fun zeroValue!944 () V!41993)

(declare-datatypes ((array!72215 0))(
  ( (array!72216 (arr!34760 (Array (_ BitVec 32) (_ BitVec 64))) (size!35296 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72215)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41993)

(declare-datatypes ((tuple2!17564 0))(
  ( (tuple2!17565 (_1!8793 (_ BitVec 64)) (_2!8793 V!41993)) )
))
(declare-datatypes ((List!24248 0))(
  ( (Nil!24245) (Cons!24244 (h!25453 tuple2!17564) (t!34683 List!24248)) )
))
(declare-datatypes ((ListLongMap!15533 0))(
  ( (ListLongMap!15534 (toList!7782 List!24248)) )
))
(declare-fun call!46863 () ListLongMap!15533)

(declare-datatypes ((ValueCell!13115 0))(
  ( (ValueCellFull!13115 (v!16514 V!41993)) (EmptyCell!13115) )
))
(declare-datatypes ((array!72217 0))(
  ( (array!72218 (arr!34761 (Array (_ BitVec 32) ValueCell!13115)) (size!35297 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72217)

(declare-fun bm!46860 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4274 (array!72215 array!72217 (_ BitVec 32) (_ BitVec 32) V!41993 V!41993 (_ BitVec 32) Int) ListLongMap!15533)

(assert (=> bm!46860 (= call!46863 (getCurrentListMapNoExtraKeys!4274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111131 () Bool)

(declare-fun res!741485 () Bool)

(declare-fun e!633624 () Bool)

(assert (=> b!1111131 (=> (not res!741485) (not e!633624))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111131 (= res!741485 (validKeyInArray!0 k!934))))

(declare-fun call!46864 () ListLongMap!15533)

(declare-fun b!1111132 () Bool)

(declare-fun e!633623 () Bool)

(declare-fun -!1051 (ListLongMap!15533 (_ BitVec 64)) ListLongMap!15533)

(assert (=> b!1111132 (= e!633623 (= call!46864 (-!1051 call!46863 k!934)))))

(declare-fun mapNonEmpty!43291 () Bool)

(declare-fun mapRes!43291 () Bool)

(declare-fun tp!82465 () Bool)

(declare-fun e!633625 () Bool)

(assert (=> mapNonEmpty!43291 (= mapRes!43291 (and tp!82465 e!633625))))

(declare-fun mapKey!43291 () (_ BitVec 32))

(declare-fun mapRest!43291 () (Array (_ BitVec 32) ValueCell!13115))

(declare-fun mapValue!43291 () ValueCell!13115)

(assert (=> mapNonEmpty!43291 (= (arr!34761 _values!996) (store mapRest!43291 mapKey!43291 mapValue!43291))))

(declare-fun b!1111133 () Bool)

(declare-fun e!633620 () Bool)

(declare-fun e!633626 () Bool)

(assert (=> b!1111133 (= e!633620 (not e!633626))))

(declare-fun res!741488 () Bool)

(assert (=> b!1111133 (=> res!741488 e!633626)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111133 (= res!741488 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35296 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111133 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36464 0))(
  ( (Unit!36465) )
))
(declare-fun lt!496288 () Unit!36464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72215 (_ BitVec 64) (_ BitVec 32)) Unit!36464)

(assert (=> b!1111133 (= lt!496288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1111134 () Bool)

(declare-fun e!633622 () Bool)

(declare-fun e!633627 () Bool)

(assert (=> b!1111134 (= e!633622 (and e!633627 mapRes!43291))))

(declare-fun condMapEmpty!43291 () Bool)

(declare-fun mapDefault!43291 () ValueCell!13115)

