; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40428 () Bool)

(assert start!40428)

(declare-fun b!444692 () Bool)

(declare-fun e!261492 () Bool)

(declare-fun e!261491 () Bool)

(declare-fun mapRes!19347 () Bool)

(assert (=> b!444692 (= e!261492 (and e!261491 mapRes!19347))))

(declare-fun condMapEmpty!19347 () Bool)

(declare-datatypes ((V!16855 0))(
  ( (V!16856 (val!5951 Int)) )
))
(declare-datatypes ((ValueCell!5563 0))(
  ( (ValueCellFull!5563 (v!8202 V!16855)) (EmptyCell!5563) )
))
(declare-datatypes ((array!27435 0))(
  ( (array!27436 (arr!13165 (Array (_ BitVec 32) ValueCell!5563)) (size!13517 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27435)

(declare-fun mapDefault!19347 () ValueCell!5563)

