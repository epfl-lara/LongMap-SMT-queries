; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39344 () Bool)

(assert start!39344)

(declare-fun b_free!9611 () Bool)

(declare-fun b_next!9611 () Bool)

(assert (=> start!39344 (= b_free!9611 (not b_next!9611))))

(declare-fun tp!34361 () Bool)

(declare-fun b_and!17097 () Bool)

(assert (=> start!39344 (= tp!34361 b_and!17097)))

(declare-fun b!417312 () Bool)

(declare-fun e!248998 () Bool)

(declare-fun e!249003 () Bool)

(declare-fun mapRes!17766 () Bool)

(assert (=> b!417312 (= e!248998 (and e!249003 mapRes!17766))))

(declare-fun condMapEmpty!17766 () Bool)

(declare-datatypes ((V!15455 0))(
  ( (V!15456 (val!5426 Int)) )
))
(declare-datatypes ((ValueCell!5038 0))(
  ( (ValueCellFull!5038 (v!7673 V!15455)) (EmptyCell!5038) )
))
(declare-datatypes ((array!25379 0))(
  ( (array!25380 (arr!12139 (Array (_ BitVec 32) ValueCell!5038)) (size!12491 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25379)

(declare-fun mapDefault!17766 () ValueCell!5038)

