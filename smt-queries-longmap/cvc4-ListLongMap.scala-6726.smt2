; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84332 () Bool)

(assert start!84332)

(declare-fun b!986488 () Bool)

(declare-fun e!556224 () Bool)

(declare-fun e!556225 () Bool)

(declare-fun mapRes!36731 () Bool)

(assert (=> b!986488 (= e!556224 (and e!556225 mapRes!36731))))

(declare-fun condMapEmpty!36731 () Bool)

(declare-datatypes ((V!35829 0))(
  ( (V!35830 (val!11618 Int)) )
))
(declare-datatypes ((ValueCell!11086 0))(
  ( (ValueCellFull!11086 (v!14180 V!35829)) (EmptyCell!11086) )
))
(declare-datatypes ((array!62235 0))(
  ( (array!62236 (arr!29975 (Array (_ BitVec 32) ValueCell!11086)) (size!30454 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62235)

(declare-fun mapDefault!36731 () ValueCell!11086)

