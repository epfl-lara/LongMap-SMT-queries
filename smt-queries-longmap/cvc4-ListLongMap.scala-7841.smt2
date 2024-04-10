; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97794 () Bool)

(assert start!97794)

(declare-fun b_free!23495 () Bool)

(declare-fun b_next!23495 () Bool)

(assert (=> start!97794 (= b_free!23495 (not b_next!23495))))

(declare-fun tp!83188 () Bool)

(declare-fun b_and!37773 () Bool)

(assert (=> start!97794 (= tp!83188 b_and!37773)))

(declare-fun res!747289 () Bool)

(declare-fun e!637238 () Bool)

(assert (=> start!97794 (=> (not res!747289) (not e!637238))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72939 0))(
  ( (array!72940 (arr!35122 (Array (_ BitVec 32) (_ BitVec 64))) (size!35658 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72939)

(assert (=> start!97794 (= res!747289 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35658 _keys!1208))))))

(assert (=> start!97794 e!637238))

(declare-fun tp_is_empty!28025 () Bool)

(assert (=> start!97794 tp_is_empty!28025))

(declare-fun array_inv!26988 (array!72939) Bool)

(assert (=> start!97794 (array_inv!26988 _keys!1208)))

(assert (=> start!97794 true))

(assert (=> start!97794 tp!83188))

(declare-datatypes ((V!42493 0))(
  ( (V!42494 (val!14069 Int)) )
))
(declare-datatypes ((ValueCell!13303 0))(
  ( (ValueCellFull!13303 (v!16702 V!42493)) (EmptyCell!13303) )
))
(declare-datatypes ((array!72941 0))(
  ( (array!72942 (arr!35123 (Array (_ BitVec 32) ValueCell!13303)) (size!35659 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72941)

(declare-fun e!637239 () Bool)

(declare-fun array_inv!26989 (array!72941) Bool)

(assert (=> start!97794 (and (array_inv!26989 _values!996) e!637239)))

(declare-fun b!1118814 () Bool)

(declare-fun res!747285 () Bool)

(assert (=> b!1118814 (=> (not res!747285) (not e!637238))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118814 (= res!747285 (validMask!0 mask!1564))))

(declare-fun b!1118815 () Bool)

(declare-fun res!747286 () Bool)

(assert (=> b!1118815 (=> (not res!747286) (not e!637238))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1118815 (= res!747286 (= (select (arr!35122 _keys!1208) i!673) k!934))))

(declare-fun b!1118816 () Bool)

(declare-fun e!637234 () Bool)

(assert (=> b!1118816 (= e!637234 true)))

(declare-fun zeroValue!944 () V!42493)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17650 0))(
  ( (tuple2!17651 (_1!8836 (_ BitVec 64)) (_2!8836 V!42493)) )
))
(declare-datatypes ((List!24436 0))(
  ( (Nil!24433) (Cons!24432 (h!25641 tuple2!17650) (t!34923 List!24436)) )
))
(declare-datatypes ((ListLongMap!15619 0))(
  ( (ListLongMap!15620 (toList!7825 List!24436)) )
))
(declare-fun lt!497582 () ListLongMap!15619)

(declare-fun minValue!944 () V!42493)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!497583 () array!72939)

(declare-fun getCurrentListMapNoExtraKeys!4315 (array!72939 array!72941 (_ BitVec 32) (_ BitVec 32) V!42493 V!42493 (_ BitVec 32) Int) ListLongMap!15619)

(declare-fun dynLambda!2419 (Int (_ BitVec 64)) V!42493)

(assert (=> b!1118816 (= lt!497582 (getCurrentListMapNoExtraKeys!4315 lt!497583 (array!72942 (store (arr!35123 _values!996) i!673 (ValueCellFull!13303 (dynLambda!2419 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35659 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497584 () ListLongMap!15619)

(assert (=> b!1118816 (= lt!497584 (getCurrentListMapNoExtraKeys!4315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118817 () Bool)

(declare-fun res!747288 () Bool)

(assert (=> b!1118817 (=> (not res!747288) (not e!637238))))

(declare-datatypes ((List!24437 0))(
  ( (Nil!24434) (Cons!24433 (h!25642 (_ BitVec 64)) (t!34924 List!24437)) )
))
(declare-fun arrayNoDuplicates!0 (array!72939 (_ BitVec 32) List!24437) Bool)

(assert (=> b!1118817 (= res!747288 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24434))))

(declare-fun b!1118818 () Bool)

(declare-fun res!747287 () Bool)

(declare-fun e!637235 () Bool)

(assert (=> b!1118818 (=> (not res!747287) (not e!637235))))

(assert (=> b!1118818 (= res!747287 (arrayNoDuplicates!0 lt!497583 #b00000000000000000000000000000000 Nil!24434))))

(declare-fun b!1118819 () Bool)

(declare-fun res!747282 () Bool)

(assert (=> b!1118819 (=> (not res!747282) (not e!637238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72939 (_ BitVec 32)) Bool)

(assert (=> b!1118819 (= res!747282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118820 () Bool)

(declare-fun e!637236 () Bool)

(assert (=> b!1118820 (= e!637236 tp_is_empty!28025)))

(declare-fun b!1118821 () Bool)

(assert (=> b!1118821 (= e!637235 (not e!637234))))

(declare-fun res!747284 () Bool)

(assert (=> b!1118821 (=> res!747284 e!637234)))

(assert (=> b!1118821 (= res!747284 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118821 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36720 0))(
  ( (Unit!36721) )
))
(declare-fun lt!497585 () Unit!36720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72939 (_ BitVec 64) (_ BitVec 32)) Unit!36720)

(assert (=> b!1118821 (= lt!497585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118822 () Bool)

(declare-fun e!637233 () Bool)

(assert (=> b!1118822 (= e!637233 tp_is_empty!28025)))

(declare-fun b!1118823 () Bool)

(declare-fun res!747283 () Bool)

(assert (=> b!1118823 (=> (not res!747283) (not e!637238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118823 (= res!747283 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43855 () Bool)

(declare-fun mapRes!43855 () Bool)

(declare-fun tp!83189 () Bool)

(assert (=> mapNonEmpty!43855 (= mapRes!43855 (and tp!83189 e!637233))))

(declare-fun mapKey!43855 () (_ BitVec 32))

(declare-fun mapValue!43855 () ValueCell!13303)

(declare-fun mapRest!43855 () (Array (_ BitVec 32) ValueCell!13303))

(assert (=> mapNonEmpty!43855 (= (arr!35123 _values!996) (store mapRest!43855 mapKey!43855 mapValue!43855))))

(declare-fun mapIsEmpty!43855 () Bool)

(assert (=> mapIsEmpty!43855 mapRes!43855))

(declare-fun b!1118824 () Bool)

(declare-fun res!747292 () Bool)

(assert (=> b!1118824 (=> (not res!747292) (not e!637238))))

(assert (=> b!1118824 (= res!747292 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35658 _keys!1208))))))

(declare-fun b!1118825 () Bool)

(assert (=> b!1118825 (= e!637239 (and e!637236 mapRes!43855))))

(declare-fun condMapEmpty!43855 () Bool)

(declare-fun mapDefault!43855 () ValueCell!13303)

