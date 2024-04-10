; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77590 () Bool)

(assert start!77590)

(declare-fun b_free!16175 () Bool)

(declare-fun b_next!16175 () Bool)

(assert (=> start!77590 (= b_free!16175 (not b_next!16175))))

(declare-fun tp!56787 () Bool)

(declare-fun b_and!26541 () Bool)

(assert (=> start!77590 (= tp!56787 b_and!26541)))

(declare-fun b!904191 () Bool)

(declare-fun e!506652 () Bool)

(declare-fun e!506651 () Bool)

(declare-fun mapRes!29602 () Bool)

(assert (=> b!904191 (= e!506652 (and e!506651 mapRes!29602))))

(declare-fun condMapEmpty!29602 () Bool)

(declare-datatypes ((V!29755 0))(
  ( (V!29756 (val!9347 Int)) )
))
(declare-datatypes ((ValueCell!8815 0))(
  ( (ValueCellFull!8815 (v!11852 V!29755)) (EmptyCell!8815) )
))
(declare-datatypes ((array!53236 0))(
  ( (array!53237 (arr!25577 (Array (_ BitVec 32) ValueCell!8815)) (size!26036 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53236)

(declare-fun mapDefault!29602 () ValueCell!8815)

