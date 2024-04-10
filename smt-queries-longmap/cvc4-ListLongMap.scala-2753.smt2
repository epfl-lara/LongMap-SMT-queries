; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40374 () Bool)

(assert start!40374)

(declare-fun b!443639 () Bool)

(declare-fun e!261006 () Bool)

(declare-fun e!261003 () Bool)

(declare-fun mapRes!19266 () Bool)

(assert (=> b!443639 (= e!261006 (and e!261003 mapRes!19266))))

(declare-fun condMapEmpty!19266 () Bool)

(declare-datatypes ((V!16783 0))(
  ( (V!16784 (val!5924 Int)) )
))
(declare-datatypes ((ValueCell!5536 0))(
  ( (ValueCellFull!5536 (v!8175 V!16783)) (EmptyCell!5536) )
))
(declare-datatypes ((array!27331 0))(
  ( (array!27332 (arr!13113 (Array (_ BitVec 32) ValueCell!5536)) (size!13465 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27331)

(declare-fun mapDefault!19266 () ValueCell!5536)

