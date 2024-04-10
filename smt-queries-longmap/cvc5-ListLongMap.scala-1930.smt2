; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34226 () Bool)

(assert start!34226)

(declare-fun b_free!7249 () Bool)

(declare-fun b_next!7249 () Bool)

(assert (=> start!34226 (= b_free!7249 (not b_next!7249))))

(declare-fun tp!25280 () Bool)

(declare-fun b_and!14449 () Bool)

(assert (=> start!34226 (= tp!25280 b_and!14449)))

(declare-fun b!341452 () Bool)

(declare-fun e!209403 () Bool)

(declare-fun e!209404 () Bool)

(declare-fun mapRes!12228 () Bool)

(assert (=> b!341452 (= e!209403 (and e!209404 mapRes!12228))))

(declare-fun condMapEmpty!12228 () Bool)

(declare-datatypes ((V!10579 0))(
  ( (V!10580 (val!3645 Int)) )
))
(declare-datatypes ((ValueCell!3257 0))(
  ( (ValueCellFull!3257 (v!5817 V!10579)) (EmptyCell!3257) )
))
(declare-datatypes ((array!17997 0))(
  ( (array!17998 (arr!8519 (Array (_ BitVec 32) ValueCell!3257)) (size!8871 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17997)

(declare-fun mapDefault!12228 () ValueCell!3257)

