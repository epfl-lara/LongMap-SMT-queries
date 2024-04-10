; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34332 () Bool)

(assert start!34332)

(declare-fun b_free!7307 () Bool)

(declare-fun b_next!7307 () Bool)

(assert (=> start!34332 (= b_free!7307 (not b_next!7307))))

(declare-fun tp!25460 () Bool)

(declare-fun b_and!14511 () Bool)

(assert (=> start!34332 (= tp!25460 b_and!14511)))

(declare-fun b!342767 () Bool)

(declare-fun e!210185 () Bool)

(declare-fun e!210187 () Bool)

(declare-fun mapRes!12321 () Bool)

(assert (=> b!342767 (= e!210185 (and e!210187 mapRes!12321))))

(declare-fun condMapEmpty!12321 () Bool)

(declare-datatypes ((V!10655 0))(
  ( (V!10656 (val!3674 Int)) )
))
(declare-datatypes ((ValueCell!3286 0))(
  ( (ValueCellFull!3286 (v!5848 V!10655)) (EmptyCell!3286) )
))
(declare-datatypes ((array!18111 0))(
  ( (array!18112 (arr!8574 (Array (_ BitVec 32) ValueCell!3286)) (size!8926 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18111)

(declare-fun mapDefault!12321 () ValueCell!3286)

