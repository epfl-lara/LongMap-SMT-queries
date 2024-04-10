; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97514 () Bool)

(assert start!97514)

(declare-fun mapIsEmpty!43435 () Bool)

(declare-fun mapRes!43435 () Bool)

(assert (=> mapIsEmpty!43435 mapRes!43435))

(declare-fun b!1113261 () Bool)

(declare-fun e!634625 () Bool)

(assert (=> b!1113261 (= e!634625 (not true))))

(declare-datatypes ((array!72399 0))(
  ( (array!72400 (arr!34852 (Array (_ BitVec 32) (_ BitVec 64))) (size!35388 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72399)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113261 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36530 0))(
  ( (Unit!36531) )
))
(declare-fun lt!496645 () Unit!36530)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72399 (_ BitVec 64) (_ BitVec 32)) Unit!36530)

(assert (=> b!1113261 (= lt!496645 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113262 () Bool)

(declare-fun e!634624 () Bool)

(declare-fun e!634628 () Bool)

(assert (=> b!1113262 (= e!634624 (and e!634628 mapRes!43435))))

(declare-fun condMapEmpty!43435 () Bool)

(declare-datatypes ((V!42121 0))(
  ( (V!42122 (val!13929 Int)) )
))
(declare-datatypes ((ValueCell!13163 0))(
  ( (ValueCellFull!13163 (v!16562 V!42121)) (EmptyCell!13163) )
))
(declare-datatypes ((array!72401 0))(
  ( (array!72402 (arr!34853 (Array (_ BitVec 32) ValueCell!13163)) (size!35389 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72401)

(declare-fun mapDefault!43435 () ValueCell!13163)

