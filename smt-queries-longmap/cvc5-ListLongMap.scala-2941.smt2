; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41852 () Bool)

(assert start!41852)

(declare-fun b_free!11455 () Bool)

(declare-fun b_next!11455 () Bool)

(assert (=> start!41852 (= b_free!11455 (not b_next!11455))))

(declare-fun tp!40374 () Bool)

(declare-fun b_and!19835 () Bool)

(assert (=> start!41852 (= tp!40374 b_and!19835)))

(declare-fun b!467324 () Bool)

(declare-fun e!273351 () Bool)

(declare-fun e!273354 () Bool)

(declare-fun mapRes!21013 () Bool)

(assert (=> b!467324 (= e!273351 (and e!273354 mapRes!21013))))

(declare-fun condMapEmpty!21013 () Bool)

(declare-datatypes ((V!18283 0))(
  ( (V!18284 (val!6486 Int)) )
))
(declare-datatypes ((ValueCell!6098 0))(
  ( (ValueCellFull!6098 (v!8775 V!18283)) (EmptyCell!6098) )
))
(declare-datatypes ((array!29547 0))(
  ( (array!29548 (arr!14201 (Array (_ BitVec 32) ValueCell!6098)) (size!14553 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29547)

(declare-fun mapDefault!21013 () ValueCell!6098)

