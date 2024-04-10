; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97542 () Bool)

(assert start!97542)

(declare-fun b!1113807 () Bool)

(declare-fun e!634876 () Bool)

(assert (=> b!1113807 (= e!634876 (not true))))

(declare-datatypes ((array!72453 0))(
  ( (array!72454 (arr!34879 (Array (_ BitVec 32) (_ BitVec 64))) (size!35415 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72453)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113807 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36552 0))(
  ( (Unit!36553) )
))
(declare-fun lt!496730 () Unit!36552)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72453 (_ BitVec 64) (_ BitVec 32)) Unit!36552)

(assert (=> b!1113807 (= lt!496730 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43477 () Bool)

(declare-fun mapRes!43477 () Bool)

(assert (=> mapIsEmpty!43477 mapRes!43477))

(declare-fun b!1113808 () Bool)

(declare-fun e!634881 () Bool)

(declare-fun tp_is_empty!27773 () Bool)

(assert (=> b!1113808 (= e!634881 tp_is_empty!27773)))

(declare-fun b!1113809 () Bool)

(declare-fun res!743420 () Bool)

(declare-fun e!634880 () Bool)

(assert (=> b!1113809 (=> (not res!743420) (not e!634880))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42157 0))(
  ( (V!42158 (val!13943 Int)) )
))
(declare-datatypes ((ValueCell!13177 0))(
  ( (ValueCellFull!13177 (v!16576 V!42157)) (EmptyCell!13177) )
))
(declare-datatypes ((array!72455 0))(
  ( (array!72456 (arr!34880 (Array (_ BitVec 32) ValueCell!13177)) (size!35416 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72455)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113809 (= res!743420 (and (= (size!35416 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35415 _keys!1208) (size!35416 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113810 () Bool)

(declare-fun e!634877 () Bool)

(assert (=> b!1113810 (= e!634877 (and e!634881 mapRes!43477))))

(declare-fun condMapEmpty!43477 () Bool)

(declare-fun mapDefault!43477 () ValueCell!13177)

