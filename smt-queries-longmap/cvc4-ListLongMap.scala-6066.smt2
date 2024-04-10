; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78508 () Bool)

(assert start!78508)

(declare-fun b!915264 () Bool)

(declare-fun res!617120 () Bool)

(declare-fun e!513628 () Bool)

(assert (=> b!915264 (=> (not res!617120) (not e!513628))))

(declare-datatypes ((array!54456 0))(
  ( (array!54457 (arr!26173 (Array (_ BitVec 32) (_ BitVec 64))) (size!26632 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54456)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30603 0))(
  ( (V!30604 (val!9665 Int)) )
))
(declare-datatypes ((ValueCell!9133 0))(
  ( (ValueCellFull!9133 (v!12183 V!30603)) (EmptyCell!9133) )
))
(declare-datatypes ((array!54458 0))(
  ( (array!54459 (arr!26174 (Array (_ BitVec 32) ValueCell!9133)) (size!26633 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54458)

(assert (=> b!915264 (= res!617120 (and (= (size!26633 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26632 _keys!1487) (size!26633 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!617122 () Bool)

(assert (=> start!78508 (=> (not res!617122) (not e!513628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78508 (= res!617122 (validMask!0 mask!1881))))

(assert (=> start!78508 e!513628))

(assert (=> start!78508 true))

(declare-fun e!513631 () Bool)

(declare-fun array_inv!20434 (array!54458) Bool)

(assert (=> start!78508 (and (array_inv!20434 _values!1231) e!513631)))

(declare-fun array_inv!20435 (array!54456) Bool)

(assert (=> start!78508 (array_inv!20435 _keys!1487)))

(declare-fun b!915265 () Bool)

(assert (=> b!915265 (= e!513628 false)))

(declare-fun lt!411643 () Bool)

(declare-datatypes ((List!18365 0))(
  ( (Nil!18362) (Cons!18361 (h!19507 (_ BitVec 64)) (t!25978 List!18365)) )
))
(declare-fun arrayNoDuplicates!0 (array!54456 (_ BitVec 32) List!18365) Bool)

(assert (=> b!915265 (= lt!411643 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18362))))

(declare-fun b!915266 () Bool)

(declare-fun e!513630 () Bool)

(declare-fun tp_is_empty!19229 () Bool)

(assert (=> b!915266 (= e!513630 tp_is_empty!19229)))

(declare-fun b!915267 () Bool)

(declare-fun e!513627 () Bool)

(assert (=> b!915267 (= e!513627 tp_is_empty!19229)))

(declare-fun mapIsEmpty!30600 () Bool)

(declare-fun mapRes!30600 () Bool)

(assert (=> mapIsEmpty!30600 mapRes!30600))

(declare-fun b!915268 () Bool)

(assert (=> b!915268 (= e!513631 (and e!513627 mapRes!30600))))

(declare-fun condMapEmpty!30600 () Bool)

(declare-fun mapDefault!30600 () ValueCell!9133)

