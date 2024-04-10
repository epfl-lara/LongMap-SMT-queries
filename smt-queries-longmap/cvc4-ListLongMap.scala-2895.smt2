; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41516 () Bool)

(assert start!41516)

(declare-fun b_free!11183 () Bool)

(declare-fun b_next!11183 () Bool)

(assert (=> start!41516 (= b_free!11183 (not b_next!11183))))

(declare-fun tp!39546 () Bool)

(declare-fun b_and!19523 () Bool)

(assert (=> start!41516 (= tp!39546 b_and!19523)))

(declare-fun b!463768 () Bool)

(declare-fun e!270819 () Bool)

(declare-fun tp_is_empty!12611 () Bool)

(assert (=> b!463768 (= e!270819 tp_is_empty!12611)))

(declare-fun b!463769 () Bool)

(declare-fun e!270818 () Bool)

(declare-fun mapRes!20593 () Bool)

(assert (=> b!463769 (= e!270818 (and e!270819 mapRes!20593))))

(declare-fun condMapEmpty!20593 () Bool)

(declare-datatypes ((V!17919 0))(
  ( (V!17920 (val!6350 Int)) )
))
(declare-datatypes ((ValueCell!5962 0))(
  ( (ValueCellFull!5962 (v!8637 V!17919)) (EmptyCell!5962) )
))
(declare-datatypes ((array!29013 0))(
  ( (array!29014 (arr!13938 (Array (_ BitVec 32) ValueCell!5962)) (size!14290 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29013)

(declare-fun mapDefault!20593 () ValueCell!5962)

