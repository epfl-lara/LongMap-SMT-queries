; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77592 () Bool)

(assert start!77592)

(declare-fun b_free!16177 () Bool)

(declare-fun b_next!16177 () Bool)

(assert (=> start!77592 (= b_free!16177 (not b_next!16177))))

(declare-fun tp!56793 () Bool)

(declare-fun b_and!26543 () Bool)

(assert (=> start!77592 (= tp!56793 b_and!26543)))

(declare-fun b!904227 () Bool)

(declare-fun e!506675 () Bool)

(declare-fun e!506671 () Bool)

(declare-fun mapRes!29605 () Bool)

(assert (=> b!904227 (= e!506675 (and e!506671 mapRes!29605))))

(declare-fun condMapEmpty!29605 () Bool)

(declare-datatypes ((V!29759 0))(
  ( (V!29760 (val!9348 Int)) )
))
(declare-datatypes ((ValueCell!8816 0))(
  ( (ValueCellFull!8816 (v!11853 V!29759)) (EmptyCell!8816) )
))
(declare-datatypes ((array!53238 0))(
  ( (array!53239 (arr!25578 (Array (_ BitVec 32) ValueCell!8816)) (size!26037 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53238)

(declare-fun mapDefault!29605 () ValueCell!8816)

