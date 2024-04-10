; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78502 () Bool)

(assert start!78502)

(declare-fun b!915210 () Bool)

(declare-fun e!513586 () Bool)

(declare-fun e!513584 () Bool)

(declare-fun mapRes!30591 () Bool)

(assert (=> b!915210 (= e!513586 (and e!513584 mapRes!30591))))

(declare-fun condMapEmpty!30591 () Bool)

(declare-datatypes ((V!30595 0))(
  ( (V!30596 (val!9662 Int)) )
))
(declare-datatypes ((ValueCell!9130 0))(
  ( (ValueCellFull!9130 (v!12180 V!30595)) (EmptyCell!9130) )
))
(declare-datatypes ((array!54446 0))(
  ( (array!54447 (arr!26168 (Array (_ BitVec 32) ValueCell!9130)) (size!26627 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54446)

(declare-fun mapDefault!30591 () ValueCell!9130)

