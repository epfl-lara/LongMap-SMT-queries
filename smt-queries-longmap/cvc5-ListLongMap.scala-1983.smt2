; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34782 () Bool)

(assert start!34782)

(declare-fun b_free!7567 () Bool)

(declare-fun b_next!7567 () Bool)

(assert (=> start!34782 (= b_free!7567 (not b_next!7567))))

(declare-fun tp!26268 () Bool)

(declare-fun b_and!14789 () Bool)

(assert (=> start!34782 (= tp!26268 b_and!14789)))

(declare-fun b!347915 () Bool)

(declare-fun e!213185 () Bool)

(declare-fun e!213181 () Bool)

(declare-fun mapRes!12738 () Bool)

(assert (=> b!347915 (= e!213185 (and e!213181 mapRes!12738))))

(declare-fun condMapEmpty!12738 () Bool)

(declare-datatypes ((V!11003 0))(
  ( (V!11004 (val!3804 Int)) )
))
(declare-datatypes ((ValueCell!3416 0))(
  ( (ValueCellFull!3416 (v!5987 V!11003)) (EmptyCell!3416) )
))
(declare-datatypes ((array!18627 0))(
  ( (array!18628 (arr!8823 (Array (_ BitVec 32) ValueCell!3416)) (size!9175 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18627)

(declare-fun mapDefault!12738 () ValueCell!3416)

