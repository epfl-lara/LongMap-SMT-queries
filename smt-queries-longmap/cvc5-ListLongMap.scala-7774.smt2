; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97388 () Bool)

(assert start!97388)

(declare-fun b_free!23359 () Bool)

(declare-fun b_next!23359 () Bool)

(assert (=> start!97388 (= b_free!23359 (not b_next!23359))))

(declare-fun tp!82376 () Bool)

(declare-fun b_and!37553 () Bool)

(assert (=> start!97388 (= tp!82376 b_and!37553)))

(declare-fun b!1110369 () Bool)

(declare-fun res!740996 () Bool)

(declare-fun e!633255 () Bool)

(assert (=> b!1110369 (=> (not res!740996) (not e!633255))))

(declare-datatypes ((array!72155 0))(
  ( (array!72156 (arr!34730 (Array (_ BitVec 32) (_ BitVec 64))) (size!35266 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72155)

(declare-datatypes ((List!24219 0))(
  ( (Nil!24216) (Cons!24215 (h!25424 (_ BitVec 64)) (t!34624 List!24219)) )
))
(declare-fun arrayNoDuplicates!0 (array!72155 (_ BitVec 32) List!24219) Bool)

(assert (=> b!1110369 (= res!740996 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24216))))

(declare-fun mapNonEmpty!43246 () Bool)

(declare-fun mapRes!43246 () Bool)

(declare-fun tp!82375 () Bool)

(declare-fun e!633254 () Bool)

(assert (=> mapNonEmpty!43246 (= mapRes!43246 (and tp!82375 e!633254))))

(declare-datatypes ((V!41953 0))(
  ( (V!41954 (val!13866 Int)) )
))
(declare-datatypes ((ValueCell!13100 0))(
  ( (ValueCellFull!13100 (v!16499 V!41953)) (EmptyCell!13100) )
))
(declare-fun mapValue!43246 () ValueCell!13100)

(declare-fun mapRest!43246 () (Array (_ BitVec 32) ValueCell!13100))

(declare-datatypes ((array!72157 0))(
  ( (array!72158 (arr!34731 (Array (_ BitVec 32) ValueCell!13100)) (size!35267 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72157)

(declare-fun mapKey!43246 () (_ BitVec 32))

(assert (=> mapNonEmpty!43246 (= (arr!34731 _values!996) (store mapRest!43246 mapKey!43246 mapValue!43246))))

(declare-fun b!1110370 () Bool)

(declare-fun tp_is_empty!27619 () Bool)

(assert (=> b!1110370 (= e!633254 tp_is_empty!27619)))

(declare-fun b!1110371 () Bool)

(declare-fun res!740995 () Bool)

(declare-fun e!633259 () Bool)

(assert (=> b!1110371 (=> (not res!740995) (not e!633259))))

(declare-fun lt!496152 () array!72155)

(assert (=> b!1110371 (= res!740995 (arrayNoDuplicates!0 lt!496152 #b00000000000000000000000000000000 Nil!24216))))

(declare-fun b!1110372 () Bool)

(assert (=> b!1110372 (= e!633255 e!633259)))

(declare-fun res!740997 () Bool)

(assert (=> b!1110372 (=> (not res!740997) (not e!633259))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72155 (_ BitVec 32)) Bool)

(assert (=> b!1110372 (= res!740997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496152 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110372 (= lt!496152 (array!72156 (store (arr!34730 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35266 _keys!1208)))))

(declare-fun b!1110373 () Bool)

(declare-fun res!740990 () Bool)

(assert (=> b!1110373 (=> (not res!740990) (not e!633255))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1110373 (= res!740990 (= (select (arr!34730 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43246 () Bool)

(assert (=> mapIsEmpty!43246 mapRes!43246))

(declare-fun b!1110374 () Bool)

(declare-fun e!633261 () Bool)

(assert (=> b!1110374 (= e!633261 tp_is_empty!27619)))

(declare-fun b!1110375 () Bool)

(declare-fun res!740993 () Bool)

(assert (=> b!1110375 (=> (not res!740993) (not e!633255))))

(assert (=> b!1110375 (= res!740993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110376 () Bool)

(declare-fun e!633258 () Bool)

(declare-datatypes ((tuple2!17534 0))(
  ( (tuple2!17535 (_1!8778 (_ BitVec 64)) (_2!8778 V!41953)) )
))
(declare-datatypes ((List!24220 0))(
  ( (Nil!24217) (Cons!24216 (h!25425 tuple2!17534) (t!34625 List!24220)) )
))
(declare-datatypes ((ListLongMap!15503 0))(
  ( (ListLongMap!15504 (toList!7767 List!24220)) )
))
(declare-fun call!46774 () ListLongMap!15503)

(declare-fun call!46773 () ListLongMap!15503)

(assert (=> b!1110376 (= e!633258 (= call!46774 call!46773))))

(declare-fun b!1110377 () Bool)

(declare-fun e!633260 () Bool)

(assert (=> b!1110377 (= e!633260 true)))

(assert (=> b!1110377 e!633258))

(declare-fun c!109230 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1110377 (= c!109230 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36440 0))(
  ( (Unit!36441) )
))
(declare-fun lt!496153 () Unit!36440)

(declare-fun minValue!944 () V!41953)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!289 (array!72155 array!72157 (_ BitVec 32) (_ BitVec 32) V!41953 V!41953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36440)

(assert (=> b!1110377 (= lt!496153 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110378 () Bool)

(declare-fun res!740989 () Bool)

(assert (=> b!1110378 (=> (not res!740989) (not e!633255))))

(assert (=> b!1110378 (= res!740989 (and (= (size!35267 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35266 _keys!1208) (size!35267 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110379 () Bool)

(declare-fun res!740998 () Bool)

(assert (=> b!1110379 (=> (not res!740998) (not e!633255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110379 (= res!740998 (validMask!0 mask!1564))))

(declare-fun bm!46770 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4261 (array!72155 array!72157 (_ BitVec 32) (_ BitVec 32) V!41953 V!41953 (_ BitVec 32) Int) ListLongMap!15503)

(assert (=> bm!46770 (= call!46773 (getCurrentListMapNoExtraKeys!4261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!740992 () Bool)

(assert (=> start!97388 (=> (not res!740992) (not e!633255))))

(assert (=> start!97388 (= res!740992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35266 _keys!1208))))))

(assert (=> start!97388 e!633255))

(assert (=> start!97388 tp_is_empty!27619))

(declare-fun array_inv!26722 (array!72155) Bool)

(assert (=> start!97388 (array_inv!26722 _keys!1208)))

(assert (=> start!97388 true))

(assert (=> start!97388 tp!82376))

(declare-fun e!633256 () Bool)

(declare-fun array_inv!26723 (array!72157) Bool)

(assert (=> start!97388 (and (array_inv!26723 _values!996) e!633256)))

(declare-fun bm!46771 () Bool)

(declare-fun dynLambda!2389 (Int (_ BitVec 64)) V!41953)

(assert (=> bm!46771 (= call!46774 (getCurrentListMapNoExtraKeys!4261 lt!496152 (array!72158 (store (arr!34731 _values!996) i!673 (ValueCellFull!13100 (dynLambda!2389 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35267 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110380 () Bool)

(assert (=> b!1110380 (= e!633256 (and e!633261 mapRes!43246))))

(declare-fun condMapEmpty!43246 () Bool)

(declare-fun mapDefault!43246 () ValueCell!13100)

