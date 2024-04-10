; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34202 () Bool)

(assert start!34202)

(declare-fun b_free!7225 () Bool)

(declare-fun b_next!7225 () Bool)

(assert (=> start!34202 (= b_free!7225 (not b_next!7225))))

(declare-fun tp!25209 () Bool)

(declare-fun b_and!14425 () Bool)

(assert (=> start!34202 (= tp!25209 b_and!14425)))

(declare-fun b!341056 () Bool)

(declare-fun e!209187 () Bool)

(declare-fun e!209188 () Bool)

(declare-fun mapRes!12192 () Bool)

(assert (=> b!341056 (= e!209187 (and e!209188 mapRes!12192))))

(declare-fun condMapEmpty!12192 () Bool)

(declare-datatypes ((V!10547 0))(
  ( (V!10548 (val!3633 Int)) )
))
(declare-datatypes ((ValueCell!3245 0))(
  ( (ValueCellFull!3245 (v!5805 V!10547)) (EmptyCell!3245) )
))
(declare-datatypes ((array!17951 0))(
  ( (array!17952 (arr!8496 (Array (_ BitVec 32) ValueCell!3245)) (size!8848 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17951)

(declare-fun mapDefault!12192 () ValueCell!3245)

