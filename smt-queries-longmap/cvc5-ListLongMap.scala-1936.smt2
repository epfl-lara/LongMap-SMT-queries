; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34310 () Bool)

(assert start!34310)

(declare-fun b_free!7285 () Bool)

(declare-fun b_next!7285 () Bool)

(assert (=> start!34310 (= b_free!7285 (not b_next!7285))))

(declare-fun tp!25394 () Bool)

(declare-fun b_and!14489 () Bool)

(assert (=> start!34310 (= tp!25394 b_and!14489)))

(declare-fun b!342371 () Bool)

(declare-datatypes ((Unit!10657 0))(
  ( (Unit!10658) )
))
(declare-fun e!209953 () Unit!10657)

(declare-fun Unit!10659 () Unit!10657)

(assert (=> b!342371 (= e!209953 Unit!10659)))

(declare-fun b!342372 () Bool)

(declare-fun e!209957 () Bool)

(declare-fun e!209955 () Bool)

(declare-fun mapRes!12288 () Bool)

(assert (=> b!342372 (= e!209957 (and e!209955 mapRes!12288))))

(declare-fun condMapEmpty!12288 () Bool)

(declare-datatypes ((V!10627 0))(
  ( (V!10628 (val!3663 Int)) )
))
(declare-datatypes ((ValueCell!3275 0))(
  ( (ValueCellFull!3275 (v!5837 V!10627)) (EmptyCell!3275) )
))
(declare-datatypes ((array!18071 0))(
  ( (array!18072 (arr!8554 (Array (_ BitVec 32) ValueCell!3275)) (size!8906 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18071)

(declare-fun mapDefault!12288 () ValueCell!3275)

