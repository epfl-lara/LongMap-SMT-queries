; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34712 () Bool)

(assert start!34712)

(declare-fun b_free!7519 () Bool)

(declare-fun b_next!7519 () Bool)

(assert (=> start!34712 (= b_free!7519 (not b_next!7519))))

(declare-fun tp!26120 () Bool)

(declare-fun b_and!14739 () Bool)

(assert (=> start!34712 (= tp!26120 b_and!14739)))

(declare-fun b!346979 () Bool)

(declare-fun e!212633 () Bool)

(declare-fun tp_is_empty!7471 () Bool)

(assert (=> b!346979 (= e!212633 tp_is_empty!7471)))

(declare-fun b!346980 () Bool)

(declare-fun e!212632 () Bool)

(declare-fun mapRes!12663 () Bool)

(assert (=> b!346980 (= e!212632 (and e!212633 mapRes!12663))))

(declare-fun condMapEmpty!12663 () Bool)

(declare-datatypes ((V!10939 0))(
  ( (V!10940 (val!3780 Int)) )
))
(declare-datatypes ((ValueCell!3392 0))(
  ( (ValueCellFull!3392 (v!5962 V!10939)) (EmptyCell!3392) )
))
(declare-datatypes ((array!18535 0))(
  ( (array!18536 (arr!8778 (Array (_ BitVec 32) ValueCell!3392)) (size!9130 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18535)

(declare-fun mapDefault!12663 () ValueCell!3392)

