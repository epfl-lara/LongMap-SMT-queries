; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20568 () Bool)

(assert start!20568)

(declare-fun b_free!5227 () Bool)

(declare-fun b_next!5227 () Bool)

(assert (=> start!20568 (= b_free!5227 (not b_next!5227))))

(declare-fun tp!18712 () Bool)

(declare-fun b_and!11973 () Bool)

(assert (=> start!20568 (= tp!18712 b_and!11973)))

(declare-fun b!204732 () Bool)

(declare-fun e!133934 () Bool)

(declare-fun e!133932 () Bool)

(declare-fun mapRes!8693 () Bool)

(assert (=> b!204732 (= e!133934 (and e!133932 mapRes!8693))))

(declare-fun condMapEmpty!8693 () Bool)

(declare-datatypes ((V!6425 0))(
  ( (V!6426 (val!2586 Int)) )
))
(declare-datatypes ((ValueCell!2198 0))(
  ( (ValueCellFull!2198 (v!4556 V!6425)) (EmptyCell!2198) )
))
(declare-datatypes ((array!9383 0))(
  ( (array!9384 (arr!4442 (Array (_ BitVec 32) ValueCell!2198)) (size!4767 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9383)

(declare-fun mapDefault!8693 () ValueCell!2198)

