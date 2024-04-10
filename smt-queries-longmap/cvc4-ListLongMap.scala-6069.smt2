; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78526 () Bool)

(assert start!78526)

(declare-fun b!915426 () Bool)

(declare-fun e!513765 () Bool)

(declare-fun e!513763 () Bool)

(declare-fun mapRes!30627 () Bool)

(assert (=> b!915426 (= e!513765 (and e!513763 mapRes!30627))))

(declare-fun condMapEmpty!30627 () Bool)

(declare-datatypes ((V!30627 0))(
  ( (V!30628 (val!9674 Int)) )
))
(declare-datatypes ((ValueCell!9142 0))(
  ( (ValueCellFull!9142 (v!12192 V!30627)) (EmptyCell!9142) )
))
(declare-datatypes ((array!54492 0))(
  ( (array!54493 (arr!26191 (Array (_ BitVec 32) ValueCell!9142)) (size!26650 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54492)

(declare-fun mapDefault!30627 () ValueCell!9142)

