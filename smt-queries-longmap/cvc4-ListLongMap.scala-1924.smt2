; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34194 () Bool)

(assert start!34194)

(declare-fun b_free!7217 () Bool)

(declare-fun b_next!7217 () Bool)

(assert (=> start!34194 (= b_free!7217 (not b_next!7217))))

(declare-fun tp!25185 () Bool)

(declare-fun b_and!14417 () Bool)

(assert (=> start!34194 (= tp!25185 b_and!14417)))

(declare-fun b!340924 () Bool)

(declare-fun e!209115 () Bool)

(declare-fun e!209117 () Bool)

(declare-fun mapRes!12180 () Bool)

(assert (=> b!340924 (= e!209115 (and e!209117 mapRes!12180))))

(declare-fun condMapEmpty!12180 () Bool)

(declare-datatypes ((V!10535 0))(
  ( (V!10536 (val!3629 Int)) )
))
(declare-datatypes ((ValueCell!3241 0))(
  ( (ValueCellFull!3241 (v!5801 V!10535)) (EmptyCell!3241) )
))
(declare-datatypes ((array!17939 0))(
  ( (array!17940 (arr!8490 (Array (_ BitVec 32) ValueCell!3241)) (size!8842 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17939)

(declare-fun mapDefault!12180 () ValueCell!3241)

