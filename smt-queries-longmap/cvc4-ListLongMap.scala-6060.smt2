; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78428 () Bool)

(assert start!78428)

(declare-fun b!914798 () Bool)

(declare-fun e!513265 () Bool)

(declare-fun tp_is_empty!19193 () Bool)

(assert (=> b!914798 (= e!513265 tp_is_empty!19193)))

(declare-fun b!914799 () Bool)

(declare-fun e!513262 () Bool)

(declare-fun e!513263 () Bool)

(declare-fun mapRes!30531 () Bool)

(assert (=> b!914799 (= e!513262 (and e!513263 mapRes!30531))))

(declare-fun condMapEmpty!30531 () Bool)

(declare-datatypes ((V!30555 0))(
  ( (V!30556 (val!9647 Int)) )
))
(declare-datatypes ((ValueCell!9115 0))(
  ( (ValueCellFull!9115 (v!12164 V!30555)) (EmptyCell!9115) )
))
(declare-datatypes ((array!54378 0))(
  ( (array!54379 (arr!26139 (Array (_ BitVec 32) ValueCell!9115)) (size!26598 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54378)

(declare-fun mapDefault!30531 () ValueCell!9115)

