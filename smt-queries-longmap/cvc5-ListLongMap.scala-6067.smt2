; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78510 () Bool)

(assert start!78510)

(declare-fun b!915282 () Bool)

(declare-fun e!513645 () Bool)

(declare-fun tp_is_empty!19231 () Bool)

(assert (=> b!915282 (= e!513645 tp_is_empty!19231)))

(declare-fun b!915283 () Bool)

(declare-fun res!617130 () Bool)

(declare-fun e!513646 () Bool)

(assert (=> b!915283 (=> (not res!617130) (not e!513646))))

(declare-datatypes ((array!54460 0))(
  ( (array!54461 (arr!26175 (Array (_ BitVec 32) (_ BitVec 64))) (size!26634 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54460)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30607 0))(
  ( (V!30608 (val!9666 Int)) )
))
(declare-datatypes ((ValueCell!9134 0))(
  ( (ValueCellFull!9134 (v!12184 V!30607)) (EmptyCell!9134) )
))
(declare-datatypes ((array!54462 0))(
  ( (array!54463 (arr!26176 (Array (_ BitVec 32) ValueCell!9134)) (size!26635 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54462)

(assert (=> b!915283 (= res!617130 (and (= (size!26635 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26634 _keys!1487) (size!26635 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!617131 () Bool)

(assert (=> start!78510 (=> (not res!617131) (not e!513646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78510 (= res!617131 (validMask!0 mask!1881))))

(assert (=> start!78510 e!513646))

(assert (=> start!78510 true))

(declare-fun e!513644 () Bool)

(declare-fun array_inv!20436 (array!54462) Bool)

(assert (=> start!78510 (and (array_inv!20436 _values!1231) e!513644)))

(declare-fun array_inv!20437 (array!54460) Bool)

(assert (=> start!78510 (array_inv!20437 _keys!1487)))

(declare-fun b!915284 () Bool)

(declare-fun res!617129 () Bool)

(assert (=> b!915284 (=> (not res!617129) (not e!513646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54460 (_ BitVec 32)) Bool)

(assert (=> b!915284 (= res!617129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915285 () Bool)

(declare-fun mapRes!30603 () Bool)

(assert (=> b!915285 (= e!513644 (and e!513645 mapRes!30603))))

(declare-fun condMapEmpty!30603 () Bool)

(declare-fun mapDefault!30603 () ValueCell!9134)

