; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77480 () Bool)

(assert start!77480)

(declare-fun b!902902 () Bool)

(declare-fun e!505785 () Bool)

(declare-fun e!505787 () Bool)

(declare-fun mapRes!29449 () Bool)

(assert (=> b!902902 (= e!505785 (and e!505787 mapRes!29449))))

(declare-fun condMapEmpty!29449 () Bool)

(declare-datatypes ((V!29623 0))(
  ( (V!29624 (val!9297 Int)) )
))
(declare-datatypes ((ValueCell!8765 0))(
  ( (ValueCellFull!8765 (v!11802 V!29623)) (EmptyCell!8765) )
))
(declare-datatypes ((array!53046 0))(
  ( (array!53047 (arr!25483 (Array (_ BitVec 32) ValueCell!8765)) (size!25942 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53046)

(declare-fun mapDefault!29449 () ValueCell!8765)

