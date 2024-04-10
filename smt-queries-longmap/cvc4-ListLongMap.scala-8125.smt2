; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99620 () Bool)

(assert start!99620)

(declare-fun b_free!25199 () Bool)

(declare-fun b_next!25199 () Bool)

(assert (=> start!99620 (= b_free!25199 (not b_next!25199))))

(declare-fun tp!88311 () Bool)

(declare-fun b_and!41265 () Bool)

(assert (=> start!99620 (= tp!88311 b_and!41265)))

(declare-fun b!1180345 () Bool)

(declare-fun e!671058 () Bool)

(declare-fun e!671066 () Bool)

(assert (=> b!1180345 (= e!671058 e!671066)))

(declare-fun res!784281 () Bool)

(assert (=> b!1180345 (=> res!784281 e!671066)))

(declare-datatypes ((array!76261 0))(
  ( (array!76262 (arr!36780 (Array (_ BitVec 32) (_ BitVec 64))) (size!37316 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76261)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180345 (= res!784281 (not (validKeyInArray!0 (select (arr!36780 _keys!1208) from!1455))))))

(declare-datatypes ((V!44765 0))(
  ( (V!44766 (val!14921 Int)) )
))
(declare-datatypes ((tuple2!19108 0))(
  ( (tuple2!19109 (_1!9565 (_ BitVec 64)) (_2!9565 V!44765)) )
))
(declare-datatypes ((List!25846 0))(
  ( (Nil!25843) (Cons!25842 (h!27051 tuple2!19108) (t!38037 List!25846)) )
))
(declare-datatypes ((ListLongMap!17077 0))(
  ( (ListLongMap!17078 (toList!8554 List!25846)) )
))
(declare-fun lt!533657 () ListLongMap!17077)

(declare-fun lt!533647 () ListLongMap!17077)

(assert (=> b!1180345 (= lt!533657 lt!533647)))

(declare-fun lt!533649 () ListLongMap!17077)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1596 (ListLongMap!17077 (_ BitVec 64)) ListLongMap!17077)

(assert (=> b!1180345 (= lt!533647 (-!1596 lt!533649 k!934))))

(declare-fun zeroValue!944 () V!44765)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14155 0))(
  ( (ValueCellFull!14155 (v!17559 V!44765)) (EmptyCell!14155) )
))
(declare-datatypes ((array!76263 0))(
  ( (array!76264 (arr!36781 (Array (_ BitVec 32) ValueCell!14155)) (size!37317 (_ BitVec 32))) )
))
(declare-fun lt!533646 () array!76263)

(declare-fun minValue!944 () V!44765)

(declare-fun lt!533658 () array!76261)

(declare-fun getCurrentListMapNoExtraKeys!5008 (array!76261 array!76263 (_ BitVec 32) (_ BitVec 32) V!44765 V!44765 (_ BitVec 32) Int) ListLongMap!17077)

(assert (=> b!1180345 (= lt!533657 (getCurrentListMapNoExtraKeys!5008 lt!533658 lt!533646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76263)

(assert (=> b!1180345 (= lt!533649 (getCurrentListMapNoExtraKeys!5008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39016 0))(
  ( (Unit!39017) )
))
(declare-fun lt!533648 () Unit!39016)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!823 (array!76261 array!76263 (_ BitVec 32) (_ BitVec 32) V!44765 V!44765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39016)

(assert (=> b!1180345 (= lt!533648 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46421 () Bool)

(declare-fun mapRes!46421 () Bool)

(assert (=> mapIsEmpty!46421 mapRes!46421))

(declare-fun b!1180346 () Bool)

(declare-fun e!671060 () Bool)

(assert (=> b!1180346 (= e!671060 (= lt!533647 lt!533657))))

(declare-fun b!1180347 () Bool)

(declare-fun e!671067 () Unit!39016)

(declare-fun Unit!39018 () Unit!39016)

(assert (=> b!1180347 (= e!671067 Unit!39018)))

(declare-fun lt!533655 () Unit!39016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76261 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39016)

(assert (=> b!1180347 (= lt!533655 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180347 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533650 () Unit!39016)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76261 (_ BitVec 32) (_ BitVec 32)) Unit!39016)

(assert (=> b!1180347 (= lt!533650 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25847 0))(
  ( (Nil!25844) (Cons!25843 (h!27052 (_ BitVec 64)) (t!38038 List!25847)) )
))
(declare-fun arrayNoDuplicates!0 (array!76261 (_ BitVec 32) List!25847) Bool)

(assert (=> b!1180347 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25844)))

(declare-fun lt!533656 () Unit!39016)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76261 (_ BitVec 64) (_ BitVec 32) List!25847) Unit!39016)

(assert (=> b!1180347 (= lt!533656 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25844))))

(assert (=> b!1180347 false))

(declare-fun b!1180348 () Bool)

(declare-fun res!784271 () Bool)

(declare-fun e!671062 () Bool)

(assert (=> b!1180348 (=> (not res!784271) (not e!671062))))

(assert (=> b!1180348 (= res!784271 (and (= (size!37317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37316 _keys!1208) (size!37317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180349 () Bool)

(declare-fun e!671061 () Bool)

(declare-fun e!671063 () Bool)

(assert (=> b!1180349 (= e!671061 (and e!671063 mapRes!46421))))

(declare-fun condMapEmpty!46421 () Bool)

(declare-fun mapDefault!46421 () ValueCell!14155)

