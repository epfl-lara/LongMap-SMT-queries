; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97610 () Bool)

(assert start!97610)

(declare-fun b!1115133 () Bool)

(declare-fun res!744442 () Bool)

(declare-fun e!635491 () Bool)

(assert (=> b!1115133 (=> (not res!744442) (not e!635491))))

(declare-datatypes ((array!72585 0))(
  ( (array!72586 (arr!34945 (Array (_ BitVec 32) (_ BitVec 64))) (size!35481 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72585)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72585 (_ BitVec 32)) Bool)

(assert (=> b!1115133 (= res!744442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115134 () Bool)

(declare-fun e!635488 () Bool)

(assert (=> b!1115134 (= e!635491 e!635488)))

(declare-fun res!744433 () Bool)

(assert (=> b!1115134 (=> (not res!744433) (not e!635488))))

(declare-fun lt!496934 () array!72585)

(assert (=> b!1115134 (= res!744433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496934 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115134 (= lt!496934 (array!72586 (store (arr!34945 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35481 _keys!1208)))))

(declare-fun b!1115135 () Bool)

(declare-fun e!635489 () Bool)

(declare-fun tp_is_empty!27841 () Bool)

(assert (=> b!1115135 (= e!635489 tp_is_empty!27841)))

(declare-fun mapIsEmpty!43579 () Bool)

(declare-fun mapRes!43579 () Bool)

(assert (=> mapIsEmpty!43579 mapRes!43579))

(declare-fun res!744436 () Bool)

(assert (=> start!97610 (=> (not res!744436) (not e!635491))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97610 (= res!744436 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35481 _keys!1208))))))

(assert (=> start!97610 e!635491))

(declare-fun array_inv!26866 (array!72585) Bool)

(assert (=> start!97610 (array_inv!26866 _keys!1208)))

(assert (=> start!97610 true))

(declare-datatypes ((V!42249 0))(
  ( (V!42250 (val!13977 Int)) )
))
(declare-datatypes ((ValueCell!13211 0))(
  ( (ValueCellFull!13211 (v!16610 V!42249)) (EmptyCell!13211) )
))
(declare-datatypes ((array!72587 0))(
  ( (array!72588 (arr!34946 (Array (_ BitVec 32) ValueCell!13211)) (size!35482 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72587)

(declare-fun e!635490 () Bool)

(declare-fun array_inv!26867 (array!72587) Bool)

(assert (=> start!97610 (and (array_inv!26867 _values!996) e!635490)))

(declare-fun b!1115136 () Bool)

(declare-fun res!744440 () Bool)

(assert (=> b!1115136 (=> (not res!744440) (not e!635491))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1115136 (= res!744440 (= (select (arr!34945 _keys!1208) i!673) k!934))))

(declare-fun b!1115137 () Bool)

(assert (=> b!1115137 (= e!635490 (and e!635489 mapRes!43579))))

(declare-fun condMapEmpty!43579 () Bool)

(declare-fun mapDefault!43579 () ValueCell!13211)

