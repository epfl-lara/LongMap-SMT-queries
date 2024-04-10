; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34314 () Bool)

(assert start!34314)

(declare-fun b_free!7289 () Bool)

(declare-fun b_next!7289 () Bool)

(assert (=> start!34314 (= b_free!7289 (not b_next!7289))))

(declare-fun tp!25407 () Bool)

(declare-fun b_and!14493 () Bool)

(assert (=> start!34314 (= tp!25407 b_and!14493)))

(declare-fun b!342443 () Bool)

(declare-fun e!209996 () Bool)

(declare-fun e!210000 () Bool)

(declare-fun mapRes!12294 () Bool)

(assert (=> b!342443 (= e!209996 (and e!210000 mapRes!12294))))

(declare-fun condMapEmpty!12294 () Bool)

(declare-datatypes ((V!10631 0))(
  ( (V!10632 (val!3665 Int)) )
))
(declare-datatypes ((ValueCell!3277 0))(
  ( (ValueCellFull!3277 (v!5839 V!10631)) (EmptyCell!3277) )
))
(declare-datatypes ((array!18077 0))(
  ( (array!18078 (arr!8557 (Array (_ BitVec 32) ValueCell!3277)) (size!8909 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18077)

(declare-fun mapDefault!12294 () ValueCell!3277)

