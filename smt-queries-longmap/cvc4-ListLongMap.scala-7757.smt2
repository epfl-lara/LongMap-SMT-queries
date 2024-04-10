; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97290 () Bool)

(assert start!97290)

(declare-fun b_free!23261 () Bool)

(declare-fun b_next!23261 () Bool)

(assert (=> start!97290 (= b_free!23261 (not b_next!23261))))

(declare-fun tp!82082 () Bool)

(declare-fun b_and!37353 () Bool)

(assert (=> start!97290 (= tp!82082 b_and!37353)))

(declare-fun b!1107895 () Bool)

(declare-fun res!739376 () Bool)

(declare-fun e!632066 () Bool)

(assert (=> b!1107895 (=> (not res!739376) (not e!632066))))

(declare-datatypes ((array!71959 0))(
  ( (array!71960 (arr!34632 (Array (_ BitVec 32) (_ BitVec 64))) (size!35168 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71959)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1107895 (= res!739376 (= (select (arr!34632 _keys!1208) i!673) k!934))))

(declare-fun b!1107896 () Bool)

(declare-fun res!739373 () Bool)

(assert (=> b!1107896 (=> (not res!739373) (not e!632066))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41821 0))(
  ( (V!41822 (val!13817 Int)) )
))
(declare-datatypes ((ValueCell!13051 0))(
  ( (ValueCellFull!13051 (v!16450 V!41821)) (EmptyCell!13051) )
))
(declare-datatypes ((array!71961 0))(
  ( (array!71962 (arr!34633 (Array (_ BitVec 32) ValueCell!13051)) (size!35169 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71961)

(assert (=> b!1107896 (= res!739373 (and (= (size!35169 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35168 _keys!1208) (size!35169 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!17458 0))(
  ( (tuple2!17459 (_1!8740 (_ BitVec 64)) (_2!8740 V!41821)) )
))
(declare-datatypes ((List!24142 0))(
  ( (Nil!24139) (Cons!24138 (h!25347 tuple2!17458) (t!34449 List!24142)) )
))
(declare-datatypes ((ListLongMap!15427 0))(
  ( (ListLongMap!15428 (toList!7729 List!24142)) )
))
(declare-fun call!46479 () ListLongMap!15427)

(declare-fun call!46480 () ListLongMap!15427)

(declare-fun e!632073 () Bool)

(declare-fun b!1107897 () Bool)

(declare-fun -!1009 (ListLongMap!15427 (_ BitVec 64)) ListLongMap!15427)

(assert (=> b!1107897 (= e!632073 (= call!46480 (-!1009 call!46479 k!934)))))

(declare-fun b!1107899 () Bool)

(declare-fun res!739381 () Bool)

(declare-fun e!632071 () Bool)

(assert (=> b!1107899 (=> (not res!739381) (not e!632071))))

(declare-fun lt!495712 () array!71959)

(declare-datatypes ((List!24143 0))(
  ( (Nil!24140) (Cons!24139 (h!25348 (_ BitVec 64)) (t!34450 List!24143)) )
))
(declare-fun arrayNoDuplicates!0 (array!71959 (_ BitVec 32) List!24143) Bool)

(assert (=> b!1107899 (= res!739381 (arrayNoDuplicates!0 lt!495712 #b00000000000000000000000000000000 Nil!24140))))

(declare-fun zeroValue!944 () V!41821)

(declare-fun bm!46476 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41821)

(declare-fun getCurrentListMapNoExtraKeys!4225 (array!71959 array!71961 (_ BitVec 32) (_ BitVec 32) V!41821 V!41821 (_ BitVec 32) Int) ListLongMap!15427)

(assert (=> bm!46476 (= call!46479 (getCurrentListMapNoExtraKeys!4225 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107900 () Bool)

(declare-fun res!739380 () Bool)

(assert (=> b!1107900 (=> (not res!739380) (not e!632066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107900 (= res!739380 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43099 () Bool)

(declare-fun mapRes!43099 () Bool)

(declare-fun tp!82081 () Bool)

(declare-fun e!632070 () Bool)

(assert (=> mapNonEmpty!43099 (= mapRes!43099 (and tp!82081 e!632070))))

(declare-fun mapValue!43099 () ValueCell!13051)

(declare-fun mapRest!43099 () (Array (_ BitVec 32) ValueCell!13051))

(declare-fun mapKey!43099 () (_ BitVec 32))

(assert (=> mapNonEmpty!43099 (= (arr!34633 _values!996) (store mapRest!43099 mapKey!43099 mapValue!43099))))

(declare-fun b!1107901 () Bool)

(declare-fun res!739379 () Bool)

(assert (=> b!1107901 (=> (not res!739379) (not e!632066))))

(assert (=> b!1107901 (= res!739379 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35168 _keys!1208))))))

(declare-fun b!1107902 () Bool)

(declare-fun e!632068 () Bool)

(assert (=> b!1107902 (= e!632068 true)))

(assert (=> b!1107902 e!632073))

(declare-fun c!109071 () Bool)

(assert (=> b!1107902 (= c!109071 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36362 0))(
  ( (Unit!36363) )
))
(declare-fun lt!495711 () Unit!36362)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!254 (array!71959 array!71961 (_ BitVec 32) (_ BitVec 32) V!41821 V!41821 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36362)

(assert (=> b!1107902 (= lt!495711 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!254 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43099 () Bool)

(assert (=> mapIsEmpty!43099 mapRes!43099))

(declare-fun bm!46477 () Bool)

(declare-fun dynLambda!2357 (Int (_ BitVec 64)) V!41821)

(assert (=> bm!46477 (= call!46480 (getCurrentListMapNoExtraKeys!4225 lt!495712 (array!71962 (store (arr!34633 _values!996) i!673 (ValueCellFull!13051 (dynLambda!2357 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35169 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107903 () Bool)

(assert (=> b!1107903 (= e!632066 e!632071)))

(declare-fun res!739375 () Bool)

(assert (=> b!1107903 (=> (not res!739375) (not e!632071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71959 (_ BitVec 32)) Bool)

(assert (=> b!1107903 (= res!739375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495712 mask!1564))))

(assert (=> b!1107903 (= lt!495712 (array!71960 (store (arr!34632 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35168 _keys!1208)))))

(declare-fun b!1107904 () Bool)

(declare-fun res!739372 () Bool)

(assert (=> b!1107904 (=> (not res!739372) (not e!632066))))

(assert (=> b!1107904 (= res!739372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107905 () Bool)

(declare-fun e!632069 () Bool)

(declare-fun e!632067 () Bool)

(assert (=> b!1107905 (= e!632069 (and e!632067 mapRes!43099))))

(declare-fun condMapEmpty!43099 () Bool)

(declare-fun mapDefault!43099 () ValueCell!13051)

