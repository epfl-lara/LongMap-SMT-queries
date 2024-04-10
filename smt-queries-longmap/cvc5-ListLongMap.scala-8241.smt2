; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100394 () Bool)

(assert start!100394)

(declare-fun b_free!25717 () Bool)

(declare-fun b_next!25717 () Bool)

(assert (=> start!100394 (= b_free!25717 (not b_next!25717))))

(declare-fun tp!90140 () Bool)

(declare-fun b_and!42333 () Bool)

(assert (=> start!100394 (= tp!90140 b_and!42333)))

(declare-fun b!1198188 () Bool)

(declare-fun e!680647 () Bool)

(assert (=> b!1198188 (= e!680647 true)))

(declare-datatypes ((V!45689 0))(
  ( (V!45690 (val!15267 Int)) )
))
(declare-fun zeroValue!944 () V!45689)

(declare-datatypes ((array!77621 0))(
  ( (array!77622 (arr!37455 (Array (_ BitVec 32) (_ BitVec 64))) (size!37991 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77621)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19532 0))(
  ( (tuple2!19533 (_1!9777 (_ BitVec 64)) (_2!9777 V!45689)) )
))
(declare-datatypes ((List!26349 0))(
  ( (Nil!26346) (Cons!26345 (h!27554 tuple2!19532) (t!39056 List!26349)) )
))
(declare-datatypes ((ListLongMap!17501 0))(
  ( (ListLongMap!17502 (toList!8766 List!26349)) )
))
(declare-fun lt!543442 () ListLongMap!17501)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14501 0))(
  ( (ValueCellFull!14501 (v!17905 V!45689)) (EmptyCell!14501) )
))
(declare-datatypes ((array!77623 0))(
  ( (array!77624 (arr!37456 (Array (_ BitVec 32) ValueCell!14501)) (size!37992 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77623)

(declare-fun minValue!944 () V!45689)

(declare-fun getCurrentListMapNoExtraKeys!5205 (array!77621 array!77623 (_ BitVec 32) (_ BitVec 32) V!45689 V!45689 (_ BitVec 32) Int) ListLongMap!17501)

(assert (=> b!1198188 (= lt!543442 (getCurrentListMapNoExtraKeys!5205 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198189 () Bool)

(declare-fun e!680642 () Bool)

(assert (=> b!1198189 (= e!680642 (not e!680647))))

(declare-fun res!797408 () Bool)

(assert (=> b!1198189 (=> res!797408 e!680647)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198189 (= res!797408 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198189 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39726 0))(
  ( (Unit!39727) )
))
(declare-fun lt!543441 () Unit!39726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77621 (_ BitVec 64) (_ BitVec 32)) Unit!39726)

(assert (=> b!1198189 (= lt!543441 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47474 () Bool)

(declare-fun mapRes!47474 () Bool)

(declare-fun tp!90141 () Bool)

(declare-fun e!680644 () Bool)

(assert (=> mapNonEmpty!47474 (= mapRes!47474 (and tp!90141 e!680644))))

(declare-fun mapKey!47474 () (_ BitVec 32))

(declare-fun mapValue!47474 () ValueCell!14501)

(declare-fun mapRest!47474 () (Array (_ BitVec 32) ValueCell!14501))

(assert (=> mapNonEmpty!47474 (= (arr!37456 _values!996) (store mapRest!47474 mapKey!47474 mapValue!47474))))

(declare-fun b!1198190 () Bool)

(declare-fun e!680646 () Bool)

(declare-fun e!680645 () Bool)

(assert (=> b!1198190 (= e!680646 (and e!680645 mapRes!47474))))

(declare-fun condMapEmpty!47474 () Bool)

(declare-fun mapDefault!47474 () ValueCell!14501)

