; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7404 () Bool)

(assert start!7404)

(declare-fun mapIsEmpty!2105 () Bool)

(declare-fun mapRes!2105 () Bool)

(assert (=> mapIsEmpty!2105 mapRes!2105))

(declare-fun b!47524 () Bool)

(declare-fun e!30444 () Bool)

(declare-fun e!30447 () Bool)

(assert (=> b!47524 (= e!30444 (and e!30447 mapRes!2105))))

(declare-fun condMapEmpty!2105 () Bool)

(declare-datatypes ((V!2455 0))(
  ( (V!2456 (val!1059 Int)) )
))
(declare-datatypes ((ValueCell!731 0))(
  ( (ValueCellFull!731 (v!2120 V!2455)) (EmptyCell!731) )
))
(declare-datatypes ((array!3147 0))(
  ( (array!3148 (arr!1508 (Array (_ BitVec 32) ValueCell!731)) (size!1730 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3147)

(declare-fun mapDefault!2105 () ValueCell!731)

