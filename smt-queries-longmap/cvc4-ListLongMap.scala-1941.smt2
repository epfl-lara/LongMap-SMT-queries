; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34344 () Bool)

(assert start!34344)

(declare-fun b_free!7319 () Bool)

(declare-fun b_next!7319 () Bool)

(assert (=> start!34344 (= b_free!7319 (not b_next!7319))))

(declare-fun tp!25497 () Bool)

(declare-fun b_and!14523 () Bool)

(assert (=> start!34344 (= tp!25497 b_and!14523)))

(declare-fun b!342983 () Bool)

(declare-fun e!210309 () Bool)

(declare-fun e!210312 () Bool)

(declare-fun mapRes!12339 () Bool)

(assert (=> b!342983 (= e!210309 (and e!210312 mapRes!12339))))

(declare-fun condMapEmpty!12339 () Bool)

(declare-datatypes ((V!10671 0))(
  ( (V!10672 (val!3680 Int)) )
))
(declare-datatypes ((ValueCell!3292 0))(
  ( (ValueCellFull!3292 (v!5854 V!10671)) (EmptyCell!3292) )
))
(declare-datatypes ((array!18133 0))(
  ( (array!18134 (arr!8585 (Array (_ BitVec 32) ValueCell!3292)) (size!8937 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18133)

(declare-fun mapDefault!12339 () ValueCell!3292)

