; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20578 () Bool)

(assert start!20578)

(declare-fun b_free!5237 () Bool)

(declare-fun b_next!5237 () Bool)

(assert (=> start!20578 (= b_free!5237 (not b_next!5237))))

(declare-fun tp!18742 () Bool)

(declare-fun b_and!11983 () Bool)

(assert (=> start!20578 (= tp!18742 b_and!11983)))

(declare-fun b!204912 () Bool)

(declare-fun e!134037 () Bool)

(declare-fun e!134040 () Bool)

(declare-fun mapRes!8708 () Bool)

(assert (=> b!204912 (= e!134037 (and e!134040 mapRes!8708))))

(declare-fun condMapEmpty!8708 () Bool)

(declare-datatypes ((V!6437 0))(
  ( (V!6438 (val!2591 Int)) )
))
(declare-datatypes ((ValueCell!2203 0))(
  ( (ValueCellFull!2203 (v!4561 V!6437)) (EmptyCell!2203) )
))
(declare-datatypes ((array!9401 0))(
  ( (array!9402 (arr!4451 (Array (_ BitVec 32) ValueCell!2203)) (size!4776 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9401)

(declare-fun mapDefault!8708 () ValueCell!2203)

