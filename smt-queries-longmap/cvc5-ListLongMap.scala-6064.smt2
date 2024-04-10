; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78480 () Bool)

(assert start!78480)

(declare-fun b!915065 () Bool)

(declare-fun res!617011 () Bool)

(declare-fun e!513472 () Bool)

(assert (=> b!915065 (=> (not res!617011) (not e!513472))))

(declare-datatypes ((array!54424 0))(
  ( (array!54425 (arr!26158 (Array (_ BitVec 32) (_ BitVec 64))) (size!26617 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54424)

(assert (=> b!915065 (= res!617011 (and (bvsle #b00000000000000000000000000000000 (size!26617 _keys!1487)) (bvslt (size!26617 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!915066 () Bool)

(declare-fun e!513473 () Bool)

(declare-fun e!513471 () Bool)

(declare-fun mapRes!30573 () Bool)

(assert (=> b!915066 (= e!513473 (and e!513471 mapRes!30573))))

(declare-fun condMapEmpty!30573 () Bool)

(declare-datatypes ((V!30583 0))(
  ( (V!30584 (val!9657 Int)) )
))
(declare-datatypes ((ValueCell!9125 0))(
  ( (ValueCellFull!9125 (v!12174 V!30583)) (EmptyCell!9125) )
))
(declare-datatypes ((array!54426 0))(
  ( (array!54427 (arr!26159 (Array (_ BitVec 32) ValueCell!9125)) (size!26618 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54426)

(declare-fun mapDefault!30573 () ValueCell!9125)

