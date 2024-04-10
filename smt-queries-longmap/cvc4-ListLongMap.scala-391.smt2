; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7368 () Bool)

(assert start!7368)

(declare-fun b!47310 () Bool)

(declare-fun e!30283 () Bool)

(declare-fun tp_is_empty!2027 () Bool)

(assert (=> b!47310 (= e!30283 tp_is_empty!2027)))

(declare-fun res!27525 () Bool)

(declare-fun e!30281 () Bool)

(assert (=> start!7368 (=> (not res!27525) (not e!30281))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7368 (= res!27525 (validMask!0 mask!2458))))

(assert (=> start!7368 e!30281))

(assert (=> start!7368 true))

(declare-datatypes ((V!2435 0))(
  ( (V!2436 (val!1052 Int)) )
))
(declare-datatypes ((ValueCell!724 0))(
  ( (ValueCellFull!724 (v!2112 V!2435)) (EmptyCell!724) )
))
(declare-datatypes ((array!3117 0))(
  ( (array!3118 (arr!1495 (Array (_ BitVec 32) ValueCell!724)) (size!1717 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3117)

(declare-fun e!30280 () Bool)

(declare-fun array_inv!900 (array!3117) Bool)

(assert (=> start!7368 (and (array_inv!900 _values!1550) e!30280)))

(declare-datatypes ((array!3119 0))(
  ( (array!3120 (arr!1496 (Array (_ BitVec 32) (_ BitVec 64))) (size!1718 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3119)

(declare-fun array_inv!901 (array!3119) Bool)

(assert (=> start!7368 (array_inv!901 _keys!1940)))

(declare-fun b!47311 () Bool)

(declare-fun e!30284 () Bool)

(declare-fun mapRes!2078 () Bool)

(assert (=> b!47311 (= e!30280 (and e!30284 mapRes!2078))))

(declare-fun condMapEmpty!2078 () Bool)

(declare-fun mapDefault!2078 () ValueCell!724)

