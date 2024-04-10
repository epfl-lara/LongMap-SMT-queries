; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97568 () Bool)

(assert start!97568)

(declare-fun b!1114314 () Bool)

(declare-fun res!743808 () Bool)

(declare-fun e!635115 () Bool)

(assert (=> b!1114314 (=> (not res!743808) (not e!635115))))

(declare-datatypes ((array!72505 0))(
  ( (array!72506 (arr!34905 (Array (_ BitVec 32) (_ BitVec 64))) (size!35441 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72505)

(declare-datatypes ((List!24328 0))(
  ( (Nil!24325) (Cons!24324 (h!25533 (_ BitVec 64)) (t!34809 List!24328)) )
))
(declare-fun arrayNoDuplicates!0 (array!72505 (_ BitVec 32) List!24328) Bool)

(assert (=> b!1114314 (= res!743808 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24325))))

(declare-fun b!1114315 () Bool)

(declare-fun res!743807 () Bool)

(assert (=> b!1114315 (=> (not res!743807) (not e!635115))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42193 0))(
  ( (V!42194 (val!13956 Int)) )
))
(declare-datatypes ((ValueCell!13190 0))(
  ( (ValueCellFull!13190 (v!16589 V!42193)) (EmptyCell!13190) )
))
(declare-datatypes ((array!72507 0))(
  ( (array!72508 (arr!34906 (Array (_ BitVec 32) ValueCell!13190)) (size!35442 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72507)

(assert (=> b!1114315 (= res!743807 (and (= (size!35442 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35441 _keys!1208) (size!35442 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114316 () Bool)

(declare-fun e!635110 () Bool)

(assert (=> b!1114316 (= e!635110 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114316 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36574 0))(
  ( (Unit!36575) )
))
(declare-fun lt!496807 () Unit!36574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72505 (_ BitVec 64) (_ BitVec 32)) Unit!36574)

(assert (=> b!1114316 (= lt!496807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114317 () Bool)

(declare-fun res!743804 () Bool)

(assert (=> b!1114317 (=> (not res!743804) (not e!635115))))

(assert (=> b!1114317 (= res!743804 (= (select (arr!34905 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43516 () Bool)

(declare-fun mapRes!43516 () Bool)

(assert (=> mapIsEmpty!43516 mapRes!43516))

(declare-fun b!1114318 () Bool)

(declare-fun e!635114 () Bool)

(declare-fun e!635113 () Bool)

(assert (=> b!1114318 (= e!635114 (and e!635113 mapRes!43516))))

(declare-fun condMapEmpty!43516 () Bool)

(declare-fun mapDefault!43516 () ValueCell!13190)

