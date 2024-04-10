; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97362 () Bool)

(assert start!97362)

(declare-fun b_free!23333 () Bool)

(declare-fun b_next!23333 () Bool)

(assert (=> start!97362 (= b_free!23333 (not b_next!23333))))

(declare-fun tp!82297 () Bool)

(declare-fun b_and!37501 () Bool)

(assert (=> start!97362 (= tp!82297 b_and!37501)))

(declare-datatypes ((V!41917 0))(
  ( (V!41918 (val!13853 Int)) )
))
(declare-fun zeroValue!944 () V!41917)

(declare-datatypes ((array!72103 0))(
  ( (array!72104 (arr!34704 (Array (_ BitVec 32) (_ BitVec 64))) (size!35240 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72103)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13087 0))(
  ( (ValueCellFull!13087 (v!16486 V!41917)) (EmptyCell!13087) )
))
(declare-datatypes ((array!72105 0))(
  ( (array!72106 (arr!34705 (Array (_ BitVec 32) ValueCell!13087)) (size!35241 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72105)

(declare-fun minValue!944 () V!41917)

(declare-fun bm!46692 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17514 0))(
  ( (tuple2!17515 (_1!8768 (_ BitVec 64)) (_2!8768 V!41917)) )
))
(declare-datatypes ((List!24197 0))(
  ( (Nil!24194) (Cons!24193 (h!25402 tuple2!17514) (t!34576 List!24197)) )
))
(declare-datatypes ((ListLongMap!15483 0))(
  ( (ListLongMap!15484 (toList!7757 List!24197)) )
))
(declare-fun call!46695 () ListLongMap!15483)

(declare-fun getCurrentListMapNoExtraKeys!4251 (array!72103 array!72105 (_ BitVec 32) (_ BitVec 32) V!41917 V!41917 (_ BitVec 32) Int) ListLongMap!15483)

(assert (=> bm!46692 (= call!46695 (getCurrentListMapNoExtraKeys!4251 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!740569 () Bool)

(declare-fun e!632948 () Bool)

(assert (=> start!97362 (=> (not res!740569) (not e!632948))))

(assert (=> start!97362 (= res!740569 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35240 _keys!1208))))))

(assert (=> start!97362 e!632948))

(declare-fun tp_is_empty!27593 () Bool)

(assert (=> start!97362 tp_is_empty!27593))

(declare-fun array_inv!26706 (array!72103) Bool)

(assert (=> start!97362 (array_inv!26706 _keys!1208)))

(assert (=> start!97362 true))

(assert (=> start!97362 tp!82297))

(declare-fun e!632947 () Bool)

(declare-fun array_inv!26707 (array!72105) Bool)

(assert (=> start!97362 (and (array_inv!26707 _values!996) e!632947)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun bm!46693 () Bool)

(declare-fun lt!496037 () array!72103)

(declare-fun call!46696 () ListLongMap!15483)

(declare-fun dynLambda!2380 (Int (_ BitVec 64)) V!41917)

(assert (=> bm!46693 (= call!46696 (getCurrentListMapNoExtraKeys!4251 lt!496037 (array!72106 (store (arr!34705 _values!996) i!673 (ValueCellFull!13087 (dynLambda!2380 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35241 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109719 () Bool)

(declare-fun e!632945 () Bool)

(assert (=> b!1109719 (= e!632945 tp_is_empty!27593)))

(declare-fun b!1109720 () Bool)

(declare-fun e!632946 () Bool)

(assert (=> b!1109720 (= e!632948 e!632946)))

(declare-fun res!740567 () Bool)

(assert (=> b!1109720 (=> (not res!740567) (not e!632946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72103 (_ BitVec 32)) Bool)

(assert (=> b!1109720 (= res!740567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496037 mask!1564))))

(assert (=> b!1109720 (= lt!496037 (array!72104 (store (arr!34704 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35240 _keys!1208)))))

(declare-fun b!1109721 () Bool)

(declare-fun e!632943 () Bool)

(assert (=> b!1109721 (= e!632946 (not e!632943))))

(declare-fun res!740566 () Bool)

(assert (=> b!1109721 (=> res!740566 e!632943)))

(assert (=> b!1109721 (= res!740566 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35240 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109721 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36420 0))(
  ( (Unit!36421) )
))
(declare-fun lt!496035 () Unit!36420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72103 (_ BitVec 64) (_ BitVec 32)) Unit!36420)

(assert (=> b!1109721 (= lt!496035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43207 () Bool)

(declare-fun mapRes!43207 () Bool)

(declare-fun tp!82298 () Bool)

(declare-fun e!632949 () Bool)

(assert (=> mapNonEmpty!43207 (= mapRes!43207 (and tp!82298 e!632949))))

(declare-fun mapValue!43207 () ValueCell!13087)

(declare-fun mapKey!43207 () (_ BitVec 32))

(declare-fun mapRest!43207 () (Array (_ BitVec 32) ValueCell!13087))

(assert (=> mapNonEmpty!43207 (= (arr!34705 _values!996) (store mapRest!43207 mapKey!43207 mapValue!43207))))

(declare-fun b!1109722 () Bool)

(declare-fun res!740561 () Bool)

(assert (=> b!1109722 (=> (not res!740561) (not e!632946))))

(declare-datatypes ((List!24198 0))(
  ( (Nil!24195) (Cons!24194 (h!25403 (_ BitVec 64)) (t!34577 List!24198)) )
))
(declare-fun arrayNoDuplicates!0 (array!72103 (_ BitVec 32) List!24198) Bool)

(assert (=> b!1109722 (= res!740561 (arrayNoDuplicates!0 lt!496037 #b00000000000000000000000000000000 Nil!24195))))

(declare-fun b!1109723 () Bool)

(declare-fun res!740568 () Bool)

(assert (=> b!1109723 (=> (not res!740568) (not e!632948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109723 (= res!740568 (validKeyInArray!0 k!934))))

(declare-fun b!1109724 () Bool)

(declare-fun res!740562 () Bool)

(assert (=> b!1109724 (=> (not res!740562) (not e!632948))))

(assert (=> b!1109724 (= res!740562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!632944 () Bool)

(declare-fun b!1109725 () Bool)

(declare-fun -!1032 (ListLongMap!15483 (_ BitVec 64)) ListLongMap!15483)

(assert (=> b!1109725 (= e!632944 (= call!46696 (-!1032 call!46695 k!934)))))

(declare-fun b!1109726 () Bool)

(declare-fun res!740559 () Bool)

(assert (=> b!1109726 (=> (not res!740559) (not e!632948))))

(assert (=> b!1109726 (= res!740559 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35240 _keys!1208))))))

(declare-fun b!1109727 () Bool)

(assert (=> b!1109727 (= e!632943 true)))

(assert (=> b!1109727 e!632944))

(declare-fun c!109191 () Bool)

(assert (=> b!1109727 (= c!109191 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496036 () Unit!36420)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!279 (array!72103 array!72105 (_ BitVec 32) (_ BitVec 32) V!41917 V!41917 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36420)

(assert (=> b!1109727 (= lt!496036 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!279 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109728 () Bool)

(declare-fun res!740565 () Bool)

(assert (=> b!1109728 (=> (not res!740565) (not e!632948))))

(assert (=> b!1109728 (= res!740565 (and (= (size!35241 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35240 _keys!1208) (size!35241 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109729 () Bool)

(assert (=> b!1109729 (= e!632949 tp_is_empty!27593)))

(declare-fun mapIsEmpty!43207 () Bool)

(assert (=> mapIsEmpty!43207 mapRes!43207))

(declare-fun b!1109730 () Bool)

(assert (=> b!1109730 (= e!632947 (and e!632945 mapRes!43207))))

(declare-fun condMapEmpty!43207 () Bool)

(declare-fun mapDefault!43207 () ValueCell!13087)

