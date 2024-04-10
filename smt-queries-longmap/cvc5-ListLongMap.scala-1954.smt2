; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34470 () Bool)

(assert start!34470)

(declare-fun b_free!7393 () Bool)

(declare-fun b_next!7393 () Bool)

(assert (=> start!34470 (= b_free!7393 (not b_next!7393))))

(declare-fun tp!25724 () Bool)

(declare-fun b_and!14601 () Bool)

(assert (=> start!34470 (= tp!25724 b_and!14601)))

(declare-fun b!344353 () Bool)

(declare-fun e!211103 () Bool)

(declare-fun e!211101 () Bool)

(declare-fun mapRes!12456 () Bool)

(assert (=> b!344353 (= e!211103 (and e!211101 mapRes!12456))))

(declare-fun condMapEmpty!12456 () Bool)

(declare-datatypes ((V!10771 0))(
  ( (V!10772 (val!3717 Int)) )
))
(declare-datatypes ((ValueCell!3329 0))(
  ( (ValueCellFull!3329 (v!5893 V!10771)) (EmptyCell!3329) )
))
(declare-datatypes ((array!18281 0))(
  ( (array!18282 (arr!8657 (Array (_ BitVec 32) ValueCell!3329)) (size!9009 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18281)

(declare-fun mapDefault!12456 () ValueCell!3329)

