; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133364 () Bool)

(assert start!133364)

(declare-fun b!1559326 () Bool)

(declare-fun e!868833 () Bool)

(declare-fun tp_is_empty!38477 () Bool)

(assert (=> b!1559326 (= e!868833 tp_is_empty!38477)))

(declare-fun res!1066331 () Bool)

(declare-fun e!868832 () Bool)

(assert (=> start!133364 (=> (not res!1066331) (not e!868832))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133364 (= res!1066331 (validMask!0 mask!947))))

(assert (=> start!133364 e!868832))

(assert (=> start!133364 true))

(declare-datatypes ((V!59509 0))(
  ( (V!59510 (val!19322 Int)) )
))
(declare-datatypes ((ValueCell!18208 0))(
  ( (ValueCellFull!18208 (v!22073 V!59509)) (EmptyCell!18208) )
))
(declare-datatypes ((array!103676 0))(
  ( (array!103677 (arr!50033 (Array (_ BitVec 32) ValueCell!18208)) (size!50583 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103676)

(declare-fun e!868831 () Bool)

(declare-fun array_inv!38893 (array!103676) Bool)

(assert (=> start!133364 (and (array_inv!38893 _values!487) e!868831)))

(declare-datatypes ((array!103678 0))(
  ( (array!103679 (arr!50034 (Array (_ BitVec 32) (_ BitVec 64))) (size!50584 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103678)

(declare-fun array_inv!38894 (array!103678) Bool)

(assert (=> start!133364 (array_inv!38894 _keys!637)))

(declare-fun b!1559327 () Bool)

(declare-fun res!1066333 () Bool)

(assert (=> b!1559327 (=> (not res!1066333) (not e!868832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103678 (_ BitVec 32)) Bool)

(assert (=> b!1559327 (= res!1066333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559328 () Bool)

(declare-fun mapRes!59082 () Bool)

(assert (=> b!1559328 (= e!868831 (and e!868833 mapRes!59082))))

(declare-fun condMapEmpty!59082 () Bool)

(declare-fun mapDefault!59082 () ValueCell!18208)

