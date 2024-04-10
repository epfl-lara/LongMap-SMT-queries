; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82844 () Bool)

(assert start!82844)

(declare-fun b_free!18971 () Bool)

(declare-fun b_next!18971 () Bool)

(assert (=> start!82844 (= b_free!18971 (not b_next!18971))))

(declare-fun tp!66041 () Bool)

(declare-fun b_and!30459 () Bool)

(assert (=> start!82844 (= tp!66041 b_and!30459)))

(declare-fun b!966426 () Bool)

(declare-fun e!544796 () Bool)

(declare-fun e!544793 () Bool)

(declare-fun mapRes!34663 () Bool)

(assert (=> b!966426 (= e!544796 (and e!544793 mapRes!34663))))

(declare-fun condMapEmpty!34663 () Bool)

(declare-datatypes ((V!34021 0))(
  ( (V!34022 (val!10940 Int)) )
))
(declare-datatypes ((ValueCell!10408 0))(
  ( (ValueCellFull!10408 (v!13498 V!34021)) (EmptyCell!10408) )
))
(declare-datatypes ((array!59643 0))(
  ( (array!59644 (arr!28690 (Array (_ BitVec 32) ValueCell!10408)) (size!29169 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59643)

(declare-fun mapDefault!34663 () ValueCell!10408)

