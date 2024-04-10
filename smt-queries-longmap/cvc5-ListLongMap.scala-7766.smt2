; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97340 () Bool)

(assert start!97340)

(declare-fun b_free!23311 () Bool)

(declare-fun b_next!23311 () Bool)

(assert (=> start!97340 (= b_free!23311 (not b_next!23311))))

(declare-fun tp!82231 () Bool)

(declare-fun b_and!37457 () Bool)

(assert (=> start!97340 (= tp!82231 b_and!37457)))

(declare-fun b!1109169 () Bool)

(declare-fun res!740203 () Bool)

(declare-fun e!632682 () Bool)

(assert (=> b!1109169 (=> (not res!740203) (not e!632682))))

(declare-datatypes ((array!72059 0))(
  ( (array!72060 (arr!34682 (Array (_ BitVec 32) (_ BitVec 64))) (size!35218 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72059)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72059 (_ BitVec 32)) Bool)

(assert (=> b!1109169 (= res!740203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109170 () Bool)

(declare-fun res!740206 () Bool)

(assert (=> b!1109170 (=> (not res!740206) (not e!632682))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41889 0))(
  ( (V!41890 (val!13842 Int)) )
))
(declare-datatypes ((ValueCell!13076 0))(
  ( (ValueCellFull!13076 (v!16475 V!41889)) (EmptyCell!13076) )
))
(declare-datatypes ((array!72061 0))(
  ( (array!72062 (arr!34683 (Array (_ BitVec 32) ValueCell!13076)) (size!35219 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72061)

(assert (=> b!1109170 (= res!740206 (and (= (size!35219 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35218 _keys!1208) (size!35219 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109171 () Bool)

(declare-fun e!632683 () Bool)

(declare-fun e!632681 () Bool)

(assert (=> b!1109171 (= e!632683 (not e!632681))))

(declare-fun res!740196 () Bool)

(assert (=> b!1109171 (=> res!740196 e!632681)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109171 (= res!740196 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35218 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109171 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36402 0))(
  ( (Unit!36403) )
))
(declare-fun lt!495938 () Unit!36402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72059 (_ BitVec 64) (_ BitVec 32)) Unit!36402)

(assert (=> b!1109171 (= lt!495938 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((tuple2!17498 0))(
  ( (tuple2!17499 (_1!8760 (_ BitVec 64)) (_2!8760 V!41889)) )
))
(declare-datatypes ((List!24181 0))(
  ( (Nil!24178) (Cons!24177 (h!25386 tuple2!17498) (t!34538 List!24181)) )
))
(declare-datatypes ((ListLongMap!15467 0))(
  ( (ListLongMap!15468 (toList!7749 List!24181)) )
))
(declare-fun call!46630 () ListLongMap!15467)

(declare-fun call!46629 () ListLongMap!15467)

(declare-fun e!632679 () Bool)

(declare-fun b!1109172 () Bool)

(declare-fun -!1025 (ListLongMap!15467 (_ BitVec 64)) ListLongMap!15467)

(assert (=> b!1109172 (= e!632679 (= call!46630 (-!1025 call!46629 k!934)))))

(declare-fun zeroValue!944 () V!41889)

(declare-fun bm!46626 () Bool)

(declare-fun minValue!944 () V!41889)

(declare-fun lt!495937 () array!72059)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4243 (array!72059 array!72061 (_ BitVec 32) (_ BitVec 32) V!41889 V!41889 (_ BitVec 32) Int) ListLongMap!15467)

(declare-fun dynLambda!2373 (Int (_ BitVec 64)) V!41889)

(assert (=> bm!46626 (= call!46630 (getCurrentListMapNoExtraKeys!4243 lt!495937 (array!72062 (store (arr!34683 _values!996) i!673 (ValueCellFull!13076 (dynLambda!2373 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35219 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109173 () Bool)

(declare-fun res!740204 () Bool)

(assert (=> b!1109173 (=> (not res!740204) (not e!632682))))

(assert (=> b!1109173 (= res!740204 (= (select (arr!34682 _keys!1208) i!673) k!934))))

(declare-fun bm!46627 () Bool)

(assert (=> bm!46627 (= call!46629 (getCurrentListMapNoExtraKeys!4243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109174 () Bool)

(declare-fun e!632678 () Bool)

(declare-fun e!632684 () Bool)

(declare-fun mapRes!43174 () Bool)

(assert (=> b!1109174 (= e!632678 (and e!632684 mapRes!43174))))

(declare-fun condMapEmpty!43174 () Bool)

(declare-fun mapDefault!43174 () ValueCell!13076)

